local s = require('spider')

local conf = {
	skipInsignificantPunctuation = true,
	subwordMovement = true,
	consistentOperatorPending = true,
	customPatterns = {},
}

s.setup(conf)
