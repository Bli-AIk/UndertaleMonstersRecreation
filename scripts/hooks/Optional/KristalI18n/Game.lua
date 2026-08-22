-- Optional kristal-i18n adapter for UMR content: refresh encounter/enemy texts
-- on language switch (the UMR adapter registers `i18n_refreshEnemy` on the
-- undertale_monsters_recreation library table).
local HasI18N = Mod and Mod.libs and Mod.libs["kristalI18n"] ~= nil
local BaseGame = Game
-- Optional runtime switch: the main mod can disable the whole library via
-- mod.json config ({"undertale_monsters_recreation": {"enabled": false}}); see README.
if Mod and Mod.libs and Mod.libs["undertale_monsters_recreation"] and Kristal.getLibConfig and
    Kristal.getLibConfig("undertale_monsters_recreation", "enabled") == false then
    return BaseGame
end

local Game, super = HookSystem.hookScript(BaseGame)

if HasI18N then
    local function refreshEnemies()
        local lib = Mod and Mod.libs and Mod.libs["undertale_monsters_recreation"]
        if lib and lib.i18n_refreshEnemy and BaseGame.battle then
            for _, enemy in ipairs(BaseGame.battle.enemies or {}) do
                lib.i18n_refreshEnemy(enemy)
            end
        end
    end

    function Game:setLanguage(...)
        local r = super.setLanguage(self, ...)
        refreshEnemies()
        return r
    end

    function Game:setNameLanguage(...)
        local r = super.setNameLanguage(self, ...)
        refreshEnemies()
        return r
    end
end

return Game
