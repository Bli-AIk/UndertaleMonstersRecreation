-- Optional kristal-i18n adapter for UMR content: refresh enemy text on a
-- language or name-language switch.
local HasI18N = Mod and Mod.libs and Mod.libs["kristalI18n"] ~= nil
local BaseGame = Game

local Game, super = HookSystem.hookScript(BaseGame)
local _, I18N = Kristal.executeLibScript("undertale_monsters_recreation", "scripts/i18n")

if HasI18N then
    local function refreshEnemies()
        if BaseGame.battle then
            for _, enemy in ipairs(BaseGame.battle.enemies or {}) do
                I18N.refreshEnemy(enemy)
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
