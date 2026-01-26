use ./defs [get_apps]
use ../hyp_utils [post_exec_rules]

def get_app [client:record] {
	for app in (get_apps) {
		if (do $app.check $client) {
			return $app
		}
	}

	return null
}


export def main [addr:string] {
	let client = hyprctl clients -j | from json
	| where address == $addr | first

	if $client == null {return}

	let app = get_app $client
	if $app == null {return}

	let tags = $app.tags | each {{tag:$in op:'+' dynamic:false}}

	post_exec_rules $client.address {tags:$tags}
}
