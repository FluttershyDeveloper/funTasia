--# (project_name = 'funTasia BloX World')
--# (project_alias = 'funtasia')
--# (file_name = 'init')
--# (file_extension = 'lua')
--# (file_format = 'lua script')
--# (file_version = {major_version = 0, minor_version = 2, patch_version = 0, suffix_version = 'alpha'})
--# [!] File version numbers have to match with that release version number where the file was last amended
--# (author = {surname = 'Christian', lastname = 'Trant'})
--# (date_of_creation = {day = 21, month = 05, year = 2017})
--# (date_of_last_change = {day = 04, month = 06, year = 2017})
--# (license = 'CC0')
funtasia = {}

funtasia.name = minetest.get_current_modname()
funtasia.fullname = 'funTasia BloX World'
funtasia.path = minetest.get_modpath(funtasia.name)
funtasia.version = {major = 0,
                    minor = 2,
					patch = 0,
					suffixes = {'unreleased',
            					'alpha'}}
-- Initialization of the lua-module 'log_helper'
local _logger = dofile(funtasia.path .. '/log_helper.lua')

-- funtasia.tell_log_info(self, message)
-- tell the message as an info entry to debug.txt 
function funtasia.tell_log_info(self, message)
  local _result = false
  if type(message) ~= 'string' then 
    self:tell_error('message must be a string')
	return _result
  end
  _result = _logger.write_log_info(self.tell_mod_identifier(self), message)
  return _result
end

-- funtasia.tell_log_error(self, message)
-- tell the message as an error entry to debug.txt 
function funtasia.tell_log_error(self, message)
  local _result = false
  if type(message) ~= 'string' then 
    self:tell_error('message must be a string')
	return _result
  end
  _result = _logger.write_log_error(self.tell_mod_identifier(self), message)
  return _result
end

-- funtasia.tell_error(self, message)
-- tell the message as an error entry to debug.txt and cast it as a fatal error
function funtasia.tell_error(self, message)
  if type(message) ~= 'string' then 
    self:tell_error('message must be a string')
	return _result
  end
    local _message = 'ERROR:' .. self.tell_mod_identifier(self) .. ': ' .. tostring(message)
	self.tell_log_error(self, _message)
    error(_message)    
end

-- funtasia.get_version_string(self)
-- Get a version string with format 'major.minor.patch-suffixes'
function funtasia.tell_version_string(self)
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

-- funtasia.tell_mod_identifier(self)
-- Get a mod identifier string with format '[Mod] %self.fullname [%self.tell_version_string()] [%self.name]'
function funtasia.tell_mod_identifier(self)
  local _message = string.format('[Mod] %s [%s] [%s]',
                                 self.fullname,
	   		     				 self:tell_version_string(),
							     self.name)
  return _message
end

-- TODO: require libs?
dofile(funtasia.path .. '/commands.lua')
dofile(funtasia.path .. '/recipes.lua')
funtasia:tell_log_info('has been loaded.')
print('[Mod]' .. funtasia.fullname .. ' [' .. funtasia:tell_version_string() .. '] [' .. funtasia.name .. '] loaded.')