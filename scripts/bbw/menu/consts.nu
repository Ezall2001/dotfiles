export const INPUT_GETTER = ['bbw' '_input']

export const DEFAULT_STATE = { }

export const BINDS = [
	{
		events_keys:['alt-r']
		action:'transform(bbw _action sync)'
	}
]


export const EVENTS = [
	{
		events_keys:[focus]
		action:'transform(bbw _event on_focus_change {1})'
	}
]
