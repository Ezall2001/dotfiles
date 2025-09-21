local invoke_oil = function(path)
	local oil = require("oil")
	vim.cmd("Oil")
	--oil.open(path or nil, { preview = { vertical = true } })
end

return invoke_oil
