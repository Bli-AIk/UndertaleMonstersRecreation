-- Optional kristal-i18n adapter for UMR content: encounter intro texts.
local HasI18N = Mod and Mod.libs and Mod.libs["kristalI18n"] ~= nil
local LightEncounter, super = HookSystem.hookScript(LightEncounter)

local function callLoc(key, fallback)
    if HasI18N and Game and Game.hasStr and Game:hasStr(key) then
        return Game:loc(key)
    end
    return fallback
end

if HasI18N then
    function LightEncounter:init(...)
        local r = super.init(self, ...)
        -- Encounter ids are file basenames (froggit, froggit2, moldsmal, ...).
        if type(self.id) == "string" then
            self.i18n_orig_text = self.text
            self.text = callLoc("lightencounter_" .. self.id .. "_text", self.text)
        end
        return r
    end
end

return LightEncounter
