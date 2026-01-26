use ../sfzf [STYLED_FZF_DELIMETER, FZF_DELIMETER]
use header.nu [get_header]


export def get_params [state:record] {
	let base_params = {
		header-label: actions
		header: (get_header $state)
		accept-nth: 3
		preview: "msft _preview {3} {4}"
	}

	let custom_sort_params = {
		no-sort: true
	}

	let grouped_params = {
		with-nth: $"{1}($FZF_DELIMETER){2}"
	}

	let ungrouped_params = {
		nth: 3
		with-nth: $"{1}($STYLED_FZF_DELIMETER){2}($STYLED_FZF_DELIMETER){3}"
		scheme: path
	}

	mut params = $base_params

	if $state.sort != 'score' {
		$params = $params | merge $custom_sort_params
	}

	if $state.group {
		$params = $params | merge $grouped_params
	} else {
		$params = $params | merge $ungrouped_params
	}

	$params
}
