-- Optional kristal-i18n adapter for UMR's data-layer ACT result strings.
-- These strings originate in enemy subclasses, so intercept the LightBattle
-- display boundary instead of the base LightEnemyBattler:onAct method.
local HasI18N = Mod and Mod.libs and Mod.libs["kristalI18n"] ~= nil
if Mod and Mod.libs and Mod.libs["undertale_monsters_recreation"] and Kristal.getLibConfig and
    Kristal.getLibConfig("undertale_monsters_recreation", "enabled") == false then
    return LightBattle
end
-- UMR content is loaded through magical-glass: when MGR is missing or
-- disabled, UMR is inert too, so its adapters must stay inert as well.
local mgr = Mod and Mod.libs and Mod.libs["magical-glass"]
if mgr == nil or (Kristal.getLibConfig and Kristal.getLibConfig("magical-glass", "enabled") == false) then
    return LightBattle
end

local LightBattle, super = HookSystem.hookScript(LightBattle)

local function callLoc(key, fallback, var)
    if HasI18N and Game and Game.hasStr and Game:hasStr(key) then
        return Game:loc(key, var)
    end
    return fallback
end

local function getActKey(action)
    local enemy = action and action.target
    if action and action.action == "ACT" and type(action.name) == "string" and
        type(enemy) == "table" and type(enemy.id) == "string" then
        -- action.name is the *visible* (localized) act name; keys must use
        -- the English source name recorded by the refresher.
        local act_name = nil
        for _, act in ipairs(enemy.acts or {}) do
            if act and (act.name == action.name or (act.i18n_display_names and
                act.i18n_display_names[action.name])) then
                act_name = act.i18n_source_name or act.name
                break
            end
        end
        act_name = act_name or action.name
        return enemy, "enemy_" .. enemy.id .. "_act_" .. string.lower(act_name):gsub("[^%w]", "")
    end
end

if HasI18N then
    function LightBattle:processAction(action)
        local enemy, key = getActKey(action)
        if not enemy or not key or type(enemy.onAct) ~= "function" then
            return super.processAction(self, action)
        end

        local original_field = rawget(enemy, "onAct")
        local original_on_act = enemy.onAct
        enemy.onAct = function(target, battler, name)
            local text = original_on_act(target, battler, name)
            if type(text) == "string" then
                local act_var = battler and battler.chara and battler.chara:getName()
                    and { who = battler.chara:getName() } or nil
                text = callLoc(key, text, act_var)
            end
            if type(target.dialogue_override) == "string" then
                target.i18n_dialogue_key = key .. "_dialogue"
                target.i18n_dialogue_source = target.dialogue_override
                target.dialogue_override = callLoc(target.i18n_dialogue_key, target.i18n_dialogue_source)
            end
            return text
        end
        local r = super.processAction(self, action)
        enemy.onAct = original_field
        return r
    end
end

return LightBattle
