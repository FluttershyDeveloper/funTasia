
--# (project_name = 'funTasia BloX World')
--# (project_alias = 'funtasia')
--# (file_name = 'init')
--# (file_extension = 'lua')
--# (file_format = 'lua script')
--# (file_version = {major_version = 0, minor_version = 1, patch_version = 0, suffix_version = 'alpha'})
--# [!] File version numbers have to match with that release version number where the file was last amended
--# (author = {surname = 'Christian', lastname = 'Trant'})
--# (date_of_creation = {day = 21, month = 05, year = 2017})
--# (date_of_last_change = {day = 23, month = 05, year = 2017})
--# (license = 'CC0')

funtasia = {}

funtasia.name = minetest.get_current_modname()
funtasia.fullname = 'funTasia BloX World'
funtasia.path = minetest.get_modpath(funtasia.name)
funtasia.version = {major = 0,
                    minor = 1,
					patch = 0,
					suffixes = {'unreleased',
            					'alpha'}}
							
-- funtasia.get_version_string(self)
-- Get a version string with format 'major.minor.patch-suffixes'
-- TODO: looks a little bit messy. clean up.

function funtasia:get_version_string()
  if not self.version then
    local error_message = 'funtasia.version is nil, but it must be defined.'
	log_error(error_message)
    error(error_message)    
  end
  local result = 'M.m.p-(suffix)'
  if self.version.major and self.version.minor and self.version.patch then
    result = tostring(self.version.major) .. '.' ..
             tostring(self.version.minor) .. '.' ..
             tostring(self.version.patch)
  end
  if self.version.suffixes then
    local _suffixes = ''
	for _, entity in pairs(self.version.suffixes) do
	  _suffixes = _suffixes .. '-' .. tostring(entity)
	end
	result = result .. _suffixes
  end
  return result
end

----------------------------
-- Helper
----------------------------								
-- TODO: Refactor helper out

-- bool log_message(log_type, message)
-- Write a log 'message' of 'log_type' to debug.txt
-- this is the abstraction for log_info(message) and log_error(message)
local function log_message(log_type, message)
  if not log_type or not message then end
  -- TODO check log_type
  local _message = string.format('[Mod] %s [%s] [%s]',
                                 funtasia.fullname,
	   		     				 funtasia:get_version_string(),
							     funtasia.name)
  minetest.log(tostring(log_type), string.rep('#', 80))
  minetest.log(tostring(log_type), _message .. ' ' .. tostring(message))
  minetest.log(tostring(log_type), string.rep('#', 80))
  return true
end

-- bool log_info(message)
-- Write a log message of type info to debug.txt
-- Example: log_info('>TEST<')
-- -> debug.txt -> 
-- '[Mod] funTasia BloX World [0.1.0-unreleased-alpha] [funtasia] >TEST<'
local function log_info(message)
  local _result = false
  _result = log_message('info', tostring(message))
  return _result
end

-- bool log_error(message)
-- Write a log message of type error to debug.txt
local function log_error(message)
  local _result = false
  _result = log_message('error', tostring(message))
  return _result
end


log_info('loading...')
-- TODO: require libs?
dofile(funtasia.path .. '/commands.lua')
dofile(funtasia.path .. '/recipes.lua')
log_info('loaded.')
print('[Mod]' .. funtasia.fullname .. ' [' .. funtasia:get_version_string() .. '] [' .. funtasia.name .. '] loaded.')