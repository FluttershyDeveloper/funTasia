--# (project_name = 'funTasia BloX World')
--# (project_alias = 'funtasia')
--# (file_name = 'log_helper')
--# (file_extension = 'lua')
--# (file_format = 'lua script')
--# (file_version = {major_version = 0, minor_version = 2, patch_version = 0, suffix_version = 'alpha'})
--# [!] File version numbers have to match with that release version number where the file was last amended
--# (author = {surname = 'Christian', lastname = 'Trant'})
--# (date_of_creation = {day = 04, month = 06, year = 2017})
--# (date_of_last_change = {day = 04, month = 06, year = 2017})
--# (license = 'CC0')

-- Define lua-module log_helper
local _log_helper = {}

  -- bool log_message(log_type, mod_identifier, message)
  -- Write a log 'message' of 'log_type' to debug.txt
  -- this is the abstraction for log_info(message) and log_error(message)
  local function write_log_message(log_type, mod_identifier, message)
    if not mod_identifier or not log_type or not message then return false end
    minetest.log(log_type, mod_identifier .. ' ' .. message)
    return true
  end
  
  -- bool log_info(message)
  -- Write a log message of type info to debug.txt
  -- Example: log_info('>TEST<')
  -- -> debug.txt -> 
  -- '[Mod] funTasia BloX World [0.1.0-unreleased-alpha] [funtasia] >TEST<' 
  function _log_helper.write_log_info(mod_identifier, message)
    local _result = false
    _result = write_log_message('info', mod_identifier, message)
    return _result
  end
				   
  -- bool log_error(message)
  -- Write a log message of type error to debug.txt
  function _log_helper.write_log_error(mod_identifier, message)
	local _result = false
	_result = write_log_message('error', mod_identifier, message)
	return _result
  end

return _log_helper