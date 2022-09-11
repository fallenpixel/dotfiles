--                        _
--  _ __   ___  _____   _(_)_ __ ___
-- | '_ \ / _ \/ _ \ \ / / | '_ ` _ \
-- | | | |  __/ (_) \ V /| | | | | | |
-- |_| |_|\___|\___/ \_/ |_|_| |_| |_|

function getHostname()
  local f = io.popen("/bin/hostname")
  local hostname = f:read("*a") or ""
  f:close()
  hostname =string.gsub(hostname, "\n$", "")
  return hostname
end
require('plugins')
require('options')
require('mappings')
require('lspconf')
require('snippets')
require('aucmd')
require('terminal')
if getHostname() ~= 'winterfell' then
  require('treesitter')
end
local module_status_ok, local_config = pcall(require, "local_config")
if not module_status_ok then
  return
end
local test_status, test = pcall(require, 'test')
if  test_status then
  return
end
