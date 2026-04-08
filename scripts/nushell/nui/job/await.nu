use consts.nu [TAG_SEPERATOR TIMEOUT_STATUS]
use messages.nu [message]

def await_job [tag:string timeout?:duration] {
	let msg_tag = $tag | split row $TAG_SEPERATOR
	| get 1 | into int

	if $timeout == null {
		job recv --tag $msg_tag
	} else {
		try {
			job recv --tag $msg_tag --timeout $timeout
		} catch {message $tag $TIMEOUT_STATUS}
	}
}

export def main [...tags --timeout (-t):duration]: nothing -> list<any> {
	$tags | each {|tag|
		await_job $tag $timeout
	}
}
