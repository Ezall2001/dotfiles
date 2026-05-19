-- NOTE: order matters
local M = {}

M.create_components = {
	require('features.undotree'),
	require('features.grug_far'),
	require('features.obsession'),
	require('features.shada'),
	require('features.oil'),
}

M.delete_components = {
	require('features.undotree'),
	require('features.grug_far'),
	require('features.obsession'),
	require('features.shada'),
	require('features.oil'),
}

M.load_components = {
	require('features.undotree'),
	require('features.grug_far'),
	require('features.obsession'),
	require('features.shada'),
	require('features.oil'),
}

M.fallback_components = {
	require('features.undotree'),
	require('features.grug_far'),
	require('features.obsession'),
	require('features.shada'),
	require('features.oil'),
}

return M
