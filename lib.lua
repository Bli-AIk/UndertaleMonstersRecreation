-- Entry point for the library table itself.
--
-- UndertaleMonstersRecreation is content-only: its actors, enemies and shops
-- are picked up by the engine from scripts/, and scripts/i18n.lua is executed
-- explicitly by the optional kristal-i18n hooks. This file exists so the
-- library can announce that it loaded, and so it has somewhere to grow
-- lifecycle callbacks later.
local lib = {}

function lib:init()
    -- Announced through the engine's "System" logger; kristal-i18n keys off
    -- this exact English wording to translate it (see its localizeConsoleSegments).
    if Logging and Logging.info then
        Logging.info("Enabled library " .. self.info.id .. ".")
    end
end

return lib
