use ../consts.nu [TOGGLE_ICON_OFF TOGGLE_ICON_ON]

export def get_toggle_icon [val:bool] {
	match $val {
		true => $TOGGLE_ICON_ON
		false => $TOGGLE_ICON_OFF
	}
}
