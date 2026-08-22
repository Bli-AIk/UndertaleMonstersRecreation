-- Optional kristal-i18n adapter for UMR content: encounter intro texts.
local HasI18N = Mod and Mod.libs and Mod.libs["kristalI18n"] ~= nil
-- Optional runtime switch: the main mod can disable the whole library via
-- mod.json config ({"undertale_monsters_recreation": {"enabled": false}}); see README.
if Mod and Mod.libs and Mod.libs["undertale_monsters_recreation"] and Kristal.getLibConfig and
    Kristal.getLibConfig("undertale_monsters_recreation", "enabled") == false then
    return LightEncounter
end

local LightEncounter, super = HookSystem.hookScript(LightEncounter)

local function callLoc(key, fallback)
    if HasI18N and Game and Game.hasStr and Game:hasStr(key) then
        return Game:loc(key)
    end
    return fallback
end

if HasI18N then
    function LightEncounter:getInitialEncounterText()
        local text = super.getInitialEncounterText(self)
        -- Encounter ids are file basenames (froggit, froggit2, moldsmal, ...).
        if type(self.id) == "string" then
            return callLoc("lightencounter_" .. self.id .. "_text", text)
        end
        return text
    end
end

return LightEncounter
