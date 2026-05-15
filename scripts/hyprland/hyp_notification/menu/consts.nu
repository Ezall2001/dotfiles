export const INPUT_GETTER = [hyp_notification _input]

export const BINDS = [
	{
		events_keys:['alt-l']
		action:'transform[hyp_notification _action pause --increase]'
	}
	{
		events_keys:['alt-h']
		action:'transform[hyp_notification _action pause --decrease]'
	}
	{
		events_keys:['alt-x']
		action:'transform[hyp_notification _action delete {1}]'
	}
	{
		events_keys:['alt-X']
		action:'transform[hyp_notification _action clear]'
	}
]
