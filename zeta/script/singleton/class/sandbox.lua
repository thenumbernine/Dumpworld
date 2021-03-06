local Sandbox = require 'base.script.singleton.class.sandbox'
local ZetaSandbox = class(Sandbox)

-- zeta-specific
ZetaSandbox.prefixCode = ZetaSandbox.prefixCode .. [[
local function popup(...) return player:popupMessage(...) end
local function centerView(...) return player:centerView(...) end
local function stopCenterView() return player:centerView() end
]]

return ZetaSandbox
