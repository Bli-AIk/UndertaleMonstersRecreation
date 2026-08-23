-- Optional kristal-i18n adapter for UMR ACT dialogue overrides.
--
-- UMR enemy subclasses set `dialogue_override` in their own `onAct` methods.
-- Keep a pending override localized until it is consumed, so switching a
-- language between the action and speech still uses the active language.
local HasI18N = Mod and Mod.libs and Mod.libs["kristalI18n"] ~= nil

local LightEnemyBattler, super = HookSystem.hookScript(LightEnemyBattler)

local function callLoc(key, fallback, var)
    if HasI18N and Game and Game.hasStr and Game:hasStr(key) then
        return Game:loc(key, var)
    end
    return fallback
end

if HasI18N then
    function LightEnemyBattler:getEnemyDialogue()
        if not self.i18n_umr then
            return super.getEnemyDialogue(self)
        end
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
