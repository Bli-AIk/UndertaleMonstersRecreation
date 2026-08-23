-- Internal helpers shared by UndertaleMonstersRecreation's optional i18n hooks.
-- This file is executed explicitly with Kristal.executeLibScript; it is not a
-- registered script and intentionally does not add anything to Mod.libs.
local I18N = {}

function I18N.available()
    return Mod and Mod.libs and Mod.libs["kristalI18n"] ~= nil
end

function I18N.loc(key, fallback, vars)
    if I18N.available() and Game and Game.hasStr and Game:hasStr(key) then
        return Game:loc(key, vars)
    end
    return fallback
end

local function refreshField(enemy, field, key)
    local value = enemy[field]
    if type(value) ~= "string" then
        return
    end
    if enemy["i18n_orig_" .. field] == nil then
        enemy["i18n_orig_" .. field] = value
    end
    enemy[field] = I18N.loc(key, enemy["i18n_orig_" .. field])
end

function I18N.refreshEnemy(enemy)
    if type(enemy) ~= "table" or type(enemy.id) ~= "string" or not enemy.i18n_umr then
        return
    end

    local id = enemy.id
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
            out[i] = I18N.loc("enemy_" .. id .. "_turn" .. i, text)
        end
        enemy.text = out
    end

    if type(enemy.dialogue) == "table" then
        if enemy.i18n_orig_dialogue == nil then
            enemy.i18n_orig_dialogue = TableUtils.copy(enemy.dialogue)
        end
        local out = {}
        for i, dialogue in ipairs(enemy.i18n_orig_dialogue) do
            out[i] = I18N.loc("enemy_" .. id .. "_dialogue" .. i, dialogue)
        end
        enemy.dialogue = out
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
            act.name = I18N.loc("act_" .. string.lower(source_name):gsub("[^%w]", ""), source_name)
            act.i18n_display_names[act.name] = true
        end
    end
end

return I18N
