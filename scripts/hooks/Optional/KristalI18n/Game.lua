-- Optional kristal-i18n adapter for UMR content: refresh encounter/enemy texts
-- on language switch (the UMR adapter registers `i18n_refreshEnemy` on the
-- undertale_monsters_recreation library table).
local HasI18N = Mod and Mod.libs and Mod.libs["kristalI18n"] ~= nil
local Game, super = HookSystem.hookScript(Game)

if HasI18N then
    function Game:setLanguage(...)
        local r = super.setLanguage(self, ...)
        local lib = Mod and Mod.libs and Mod.libs["undertale_monsters_recreation"]
        if lib and lib.i18n_refreshEnemy and Game.battle then
            for _, enemy in ipairs(Game.battle.enemies or {}) do
                lib.i18n_refreshEnemy(enemy)
            end
        end
        return r
    end
end

return Game
