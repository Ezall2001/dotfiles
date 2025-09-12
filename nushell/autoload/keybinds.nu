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
	{
		name: menu_prv
		modifier: control
		keycode: char_p
		mode: [vi_insert vi_normal]
		event: { send: menuprevious }
	}
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
		name: help_menu
		modifier: control
		keycode: char_h
		mode: [vi_insert vi_normal]
		event: { send: menu name: help_menu }
	}
	{
		name: history_menu
		modifier: control
		keycode: char_y
		mode: [vi_insert vi_normal]
		event: {
			until: [
				{ send: menu name: history_menu }
				{ send: menupagenext }
			]
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
		name: fzf_nav_cd
		modifier: control
		keycode: char_c
		mode: [vi_insert vi_normal]
		event: { send: executehostcommand cmd: 'fzf_nav cd | __zoxide_z $in' }
	}
	{
		name: fzf_nav_vi
		modifier: control
		keycode: char_v
		mode: [vi_insert vi_normal]
		event: { send: executehostcommand cmd: 'fzf_nav vim' }
	}
]
