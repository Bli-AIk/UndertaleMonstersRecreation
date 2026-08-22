-- Optional kristal-i18n adapter for UMR's data-layer ACT result strings.
-- These strings originate in enemy subclasses, so intercept the LightBattle
-- display boundary instead of the base LightEnemyBattler:onAct method.
local HasI18N = Mod and Mod.libs and Mod.libs["kristalI18n"] ~= nil
if Mod and Mod.libs and Mod.libs["undertale_monsters_recreation"] and Kristal.getLibConfig and
    Kristal.getLibConfig("undertale_monsters_recreation", "enabled") == false then
    return LightBattle
end

local LightBattle, super = HookSystem.hookScript(LightBattle)

local function callLoc(key, fallback)
    if HasI18N and Game and Game.hasStr and Game:hasStr(key) then
        return Game:loc(key)
    end
    return fallback
end

local function getActKey(action)
    local enemy = action and action.target
    if action and action.action == "ACT" and type(action.name) == "string" and
        type(enemy) == "table" and type(enemy.id) == "string" then
        local act_name = string.lower(action.name):gsub("[^%w]", "")
        return enemy, "enemy_" .. enemy.id .. "_act_" .. act_name
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
                text = callLoc(key, text)
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
