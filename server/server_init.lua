Core = exports.vorp_core:GetCore()
BccUtils = exports['bcc-utils'].initiate()
---@type BCCStablesDebugLib
DBG = BCCStablesDebug

-- TODO: Update URL
BccUtils.Versioner.checkFile(GetCurrentResourceName(), 'https://github.com/BryceCanyonCounty/stables')
