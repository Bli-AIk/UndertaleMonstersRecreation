-- Optional kristal-i18n adapter for UMR content: superclass base texts.
--
-- UMR enemies register their content strings after `LightEnemyBattler:init`
-- returns (turn texts `self.text`, `low_health_text`, `spareable_text`, extra
-- act names via `registerAct`, `self.name`, `self.check`). This adapter swaps
-- those fields to localized values after battle construction / on language
-- switch, exactly like the magical-glass adapter does for name/check.
-- Without kristalI18n this hook only registers the shared refresh helper.
local HasI18N = Mod and Mod.libs and Mod.libs["kristalI18n"] ~= nil
-- Optional runtime switch: the main mod can disable the whole library via
-- mod.json config ({"undertale_monsters_recreation": {"enabled": false}}); see README.
if Mod and Mod.libs and Mod.libs["undertale_monsters_recreation"] and Kristal.getLibConfig and
    Kristal.getLibConfig("undertale_monsters_recreation", "enabled") == false then
    return LightEnemyBattler
end

local LightEnemyBattler, super = HookSystem.hookScript(LightEnemyBattler)

local function callLoc(key, fallback, var)
    if HasI18N and Game and Game.hasStr and Game:hasStr(key) then
        return Game:loc(key, var)
    end
    return fallback
end

-- Translate one string field of the enemy, keeping the English original once
-- so switching back to English can restore it.
local function refreshField(enemy, field, key)
    local value = enemy[field]
    if type(value) ~= "string" then
        return
    end
    if enemy["i18n_orig_" .. field] == nil then
        enemy["i18n_orig_" .. field] = value
    end
    enemy[field] = callLoc(key, enemy["i18n_orig_" .. field])
end

local function refreshEnemy(enemy)
    if type(enemy) ~= "table" or type(enemy.id) ~= "string" then
        return
    end
    local id = enemy.id
    -- Names resolve through the name dictionary ([name:<id>]) so they follow
    -- the *name language* setting, keeping the English name when that is
    -- selected (e.g. KRIS/SUSIE English but zh_hans UI). Fall back to the
    -- enemy_<id>_name key only if the dictionary has no entry.
    local name_value = Game.locText and Game:locText("[name:" .. id .. "]")
    if type(name_value) == "string" and not name_value:find("is missing", 1, true) then
        if enemy.name and enemy.i18n_orig_name == nil then
            enemy.i18n_orig_name = enemy.name
        end
        enemy.name = name_value
    else
        refreshField(enemy, "name", "enemy_" .. id .. "_name")
    end
    refreshField(enemy, "check", "enemy_" .. id .. "_check")
    refreshField(enemy, "low_health_text", "enemy_" .. id .. "_low")
    refreshField(enemy, "spareable_text", "enemy_" .. id .. "_spare")
    if type(enemy.text) == "table" then
        if enemy.i18n_orig_text == nil then
            enemy.i18n_orig_text = TableUtils.copy(enemy.text)
        end
        local out = {}
        for i, text in ipairs(enemy.i18n_orig_text) do
            out[i] = callLoc("enemy_" .. id .. "_turn" .. i, text)
        end
        enemy.text = out
    end
    for _, act in ipairs(enemy.acts or {}) do
        if act and type(act.name) == "string" and act.name ~= "Check" and
            act.i18n_source_name ~= "Check" then
            if act.i18n_source_name == nil then
                act.i18n_source_name = act.name
            end
            act.i18n_display_names = act.i18n_display_names or {}
            act.i18n_display_names[act.name] = true
            local source_name = act.i18n_source_name
            act.name = callLoc("act_" .. string.lower(source_name):gsub("[^%w]", ""), source_name)
            act.i18n_display_names[act.name] = true
        end
    end
end

if HasI18N and Mod and Mod.libs and Mod.libs["undertale_monsters_recreation"] then
    Mod.libs["undertale_monsters_recreation"].i18n_refreshEnemy = refreshEnemy
end

if HasI18N then
    -- Custom act result texts (Compliment / Threaten / Imitate / Flirt /
    -- Standard...) come from the data layer's onAct return value. Keys:
    -- enemy_<id>_act_<actname>; the Standard template embeds the acting
    -- member's name, passed as [var:who].
    function LightEnemyBattler:onAct(battler, name)
        local r = super.onAct(self, battler, name)
        local act_part = type(name) == "string" and string.lower(name):gsub("[^%w]", "") or nil
        if act_part and type(r) == "string" then
            local key = "enemy_" .. self.id .. "_act_" .. act_part
            if battler and battler.chara and battler.chara:getName() then
                r = callLoc(key, r, { who = battler.chara:getName() })
            else
                r = callLoc(key, r)
            end
        end
        return r
    end

    -- Dialogue overrides are installed by a data-layer onAct implementation.
    -- Resolve them at read time so a language switch before the enemy talks is
    -- still reflected correctly.
    function LightEnemyBattler:getEnemyDialogue()
        if type(self.i18n_dialogue_key) == "string" and type(self.i18n_dialogue_source) == "string" then
            self.dialogue_override = callLoc(self.i18n_dialogue_key, self.i18n_dialogue_source)
        end
        local dialogue = super.getEnemyDialogue(self)
        self.i18n_dialogue_key = nil
        self.i18n_dialogue_source = nil
        return dialogue
    end
end

return LightEnemyBattler
