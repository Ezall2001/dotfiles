require "lazy_pm.bootstrap"

local lazy = require "lazy"

local spec = {
  { import = "plugins" },
}

local install = {}

local checker = {}

local opts = {
  spec = spec,
  install = install,
  checker = checker,
}

lazy.setup(opts)
