$env.config.menus = [
	{
		name: help_menu
		only_buffer_difference: false
		marker: " : "
		type: {
			layout: description
			columns: 8
			col_padding: 2
		}
		style: {
			text: green
			selected_text: green_reverse
			description_text: yellow
		}
	}
	{
		name: completion_menu
		only_buffer_difference: false
		marker: " "
		type: {
			layout: columnar
			columns: 8
			col_padding: 2
		}
		style: {
			text: green
			selected_text: green_reverse
			description_text: yellow
		}
	}
	{
		name: history_menu
		only_buffer_difference: false
		marker: " "
		type: {
			layout: list
			page_size: 10
		}
		style: {
			text: green
			selected_text: green_reverse
			description_text: yellow
		}
	}
]
