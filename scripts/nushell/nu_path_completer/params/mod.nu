use header_param.nu [get_header]

export def get_params [state:record query:string] {
	{
		query: $query
		header: (get_header $state)
		header-label: 'actions'
		accept-nth: 1
		preview: 'nu_path_completer _preview {}'
	}
}
