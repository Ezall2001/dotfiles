local c = require("colorizer")

local conf = {
	RGB = true,
	RRGGBB = true,
	names = true,
	RRGGBBAA = true,
	rgb_fn = true,
	hsl_fn = true,
	css = false,
	css_fn = false,
	mode = "background",
}

c.setup({ "text" }, conf)
