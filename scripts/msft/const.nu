export const DELIMITER = ';;'

export const DEFAULT_STATE = {
	group: false
	sort: 'score'
	sort_direction: -1
}

export const INPUT_GETTER = ['msft' '_input']

export const BINDS = [
	{
		events_keys:[alt-u]
		action:'transform(msft _action group)'
	}
	{
		events_keys:[alt-i]
		action:'transform(msft _action sort timestamp)'
	}
	{
		events_keys:[alt-z]
		action:'transform(msft _action sort size)'
	}
	{
		events_keys:[alt-o]
		action:'transform(msft _action sort score)'
	}
	{
		events_keys:[alt-x]
		action:'transform(msft _action delete {+3})'
	}
	{
		events_keys:[alt-r]
		action:'transform(msft _action restore {+3})'
	}
	{
		events_keys:[alt-w]
		action:'transform(msft _action restore {+3} --cwd)'
	}
]
