$env.config.keybindings = [
	{
		name: menu_next
		modifier: control
		keycode: char_n
		mode: [vi_insert vi_normal]
		event: { send: menunext }
	}
	{
		name: menu_prv
		modifier: control
		keycode: char_p
		mode: [vi_insert vi_normal]
		event: { send: menuprevious }
	}
	{
		name: menu_up
		modifier: control
		keycode: char_k
		mode: [vi_insert vi_normal]
		event: { send: menuup }
	}
	{
		name: menu_down
		modifier: control
		keycode: char_j
		mode: [vi_insert vi_normal]
		event: { send: menudown }
	}
	# FIX: dueplicate
	{
		name: menu_prv
		modifier: control
		keycode: char_p
		mode: [vi_insert vi_normal]
		event: { send: menuprevious }
	}
	# FIX: no menu page next
	{
		name: menu_page_prv
		modifier: control
		keycode: char_o
		mode: [vi_insert vi_normal]
		event: { send: menupageprevious }
	}
	{
		name: completion_menu
		modifier: control
		keycode: space
		mode: [vi_insert vi_normal]
		event: { send: menu name: completion_menu }
	}
	{
		name: helb
		modifier: control
		keycode: char_h
		mode: [vi_insert vi_normal]
		event: [
			{ edit: MoveToStart }
			{ edit: InsertString value: "helb " }
			{ send: Enter }
		]
	}
	{
		name: history_menu
		modifier: control
		keycode: char_t
		mode: [vi_insert vi_normal]
		event: {
			send: executehostcommand
			cmd: 'history | sort-by -r start_timestamp
			| uniq-by command | get command | each {str trim}
			| uniq | str join "\n"
			| nu_history (commandline) | commandline edit $in'
		}
	}
	{
		name: reload
		modifier: control
		keycode: char_r
		mode: [vi_insert vi_normal]
		event: { send: executehostcommand cmd: 'exec nu -e "print reloaded"'}
	}
	{
		name: copy_cmdline
		modifier: control
		keycode: char_y
		mode: [vi_insert vi_normal]
		event: [
			{ edit: MoveToStart }
			{ edit: InsertString value: "r#'" }
			{ edit: MoveToEnd }
			{ edit: InsertString value: "'# | str trim | clipse -c" }
			{ send: Enter }
		]
	}
	{
		name: path_completer
		modifier: control
		keycode: char_c
		mode: [vi_insert vi_normal]
		event: {
			send: executehostcommand
			cmd: 'nu_path_completer (commandline) (commandline get-cursor)
			| from nuon
			| do {commandline edit $in.buffer; commandline set-cursor $in.pos}'
		}
	}
]
