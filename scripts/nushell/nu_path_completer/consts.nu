export const STARTS = {
	root: '/'
	home: '~'
	personal: '~/personal'
}
export const INPUT_GETTER = ['nu_path_completer' '_update' 'input']

export const DEFAULT_STATE = {
	hidden: true
	absolute: false
	ignored: false
	dir: false
	start: 'personal'
}

export const BINDS = [
	{
		events_keys:[alt-a]
		action:'transform(nu_path_completer _filter absolute)'
	}
	{
		events_keys:[alt-h]
		action:'transform(nu_path_completer _filter hidden)'
	}
	{
		events_keys:[alt-d]
		action:'transform(nu_path_completer _filter dir)'
	}
	{
		events_keys:[alt-i]
		action:'transform(nu_path_completer _filter ignored)'
	}
	{
		events_keys:[alt-r]
		action:'transform(nu_path_completer _filter start root)'
	}
	{
		events_keys:[alt-m]
		action:'transform(nu_path_completer _filter start home)'
	}
	{
		events_keys:[alt-e]
		action:'transform(nu_path_completer _filter start personal)'
	}
]
