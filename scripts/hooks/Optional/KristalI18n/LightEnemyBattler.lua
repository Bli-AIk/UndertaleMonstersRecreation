-- Optional kristal-i18n adapter for UMR content: superclass base texts.
--
-- UMR enemies register their content strings in `LightEnemyBattler:init`
-- (turn texts `self.text`, `low_health_text`, `spareable_text`, extra act
-- names via `registerAct`, `self.name`, `self.check`). This adapter swaps
-- those fields to localized values on battle start / language switch, exactly
-- like the magical-glass adapter does for name/check (both run independently).
-- Without kristalI18n this hook only registers the shared refresh helper.
local HasI18N = Mod and Mod.libs and Mod.libs["kristalI18n"] ~= nil
local LightEnemyBattler, super = HookSystem.hookScript(LightEnemyBattler)

local function callLoc(key, fallback)
    if HasI18N and Game and Game.hasStr and Game:hasStr(key) then
        return Game:loc(key)
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
    refreshField(enemy, "name", "enemy_" .. id .. "_name")
    refreshField(enemy, "check", "enemy_" .. id .. "_check")
    refreshField(enemy, "low_health_text", "enemy_" .. id .. "_low_health")
    refreshField(enemy, "spareable_text", "enemy_" .. id .. "_spareable")
    if type(enemy.text) == "table" then
        if enemy.i18n_orig_text == nil then
            enemy.i18n_orig_text = TableUtils.copy(enemy.text)
        end
        local out = {}
        for i, text in ipairs(enemy.i18n_orig_text) do
            out[i] = callLoc("enemy_" .. id .. "_text_" .. i, text)
        end
        enemy.text = out
    end
    for _, act in ipairs(enemy.acts or {}) do
        if act and type(act.name) == "string" then
            act.name = callLoc("act_" .. string.lower(act.name):gsub("[^%w]", ""), act.name)
        end
    end
end

if HasI18N and Mod and Mod.libs and Mod.libs["undertale_monsters_recreation"] then
    Mod.libs["undertale_monsters_recreation"].i18n_refreshEnemy = refreshEnemy
end

if HasI18N then
    function LightEnemyBattler:init(...)
        local r = super.init(self, ...)
        refreshEnemy(self)
        return r
    end
end

return LightEnemyBattler
