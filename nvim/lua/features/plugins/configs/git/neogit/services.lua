local services = {}

services['github.com'] = {
	pull_request = 'https://github.com/${owner}/${repository}/compare/${branch_name}?expand=1',
	commit = 'https://github.com/${owner}/${repository}/commit/${oid}',
	tree = 'https://github.com/${owner}/${repository}/tree/${branch_name}',
}

services['bitbucket.org'] = {
	pull_request = 'https://bitbucket.org/${owner}/${repository}/pull-requests/new?source=${branch_name}&t=1',
	commit = 'https://bitbucket.org/${owner}/${repository}/commits/${oid}',
	tree = 'https://bitbucket.org/${owner}/${repository}/branch/${branch_name}',
}

services['gitlab.com'] = {
	pull_request = 'https://gitlab.com/${owner}/${repository}/merge_requests/new?merge_request[source_branch]=${branch_name}',
	commit = 'https://gitlab.com/${owner}/${repository}/-/commit/${oid}',
	tree = 'https://gitlab.com/${owner}/${repository}/-/tree/${branch_name}?ref_type=heads',
}

return services
