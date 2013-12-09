--File Revision: 1
--Last Modification: 06/12/2013
-- Change Log:
	-- 06/12/2013: file added.
	
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	--[[global]] DETAILS_HOOK_COOLDOWN = "HOOK_COOLDOWN"
	
	local _detalhes = _G._detalhes
	local _
	
	_detalhes.hooks ["HOOK_COOLDOWN"] = {}
	
	function _detalhes:InstallHook (hook_type, func)
	
		if (not _detalhes.hooks [hook_type]) then
			return false, "Invalid hook type."
		end
		
		_detalhes.hooks [hook_type] [#_detalhes.hooks [hook_type] + 1] = func
		
		_detalhes.hooks [hook_type].enabled = true
		
		_detalhes:UpdateParserGears()
		return true
	end
	
	function _detalhes:UnInstallHook (hook_type, func)
	
		if (not _detalhes.hooks [hook_type]) then
			return false, "Invalid hook type."
		end
		
		for index, this_func in ipairs (_detalhes.hooks [hook_type]) do 
		
			if (this_func == func) then
			
				table.remove (_detalhes.hooks [hook_type], index)
				
				if (#_detalhes.hooks [hook_type] == 0) then
					_detalhes.hooks [hook_type].enabled = false
				end
				
				_detalhes:UpdateParserGears()
				return true
			end
		end
		
	end