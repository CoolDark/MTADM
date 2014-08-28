function _DEBUG(...)
	local arg = {...}
	return outputDebugString(  tostring( table.concat( arg,' ' ) ) );
end