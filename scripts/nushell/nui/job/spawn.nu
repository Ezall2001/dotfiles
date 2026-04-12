use consts.nu [TAG_SEPERATOR ERROR_STATUS OK_STATUS]
use messages.nu [message]

def job_wrapper [tag:string closure:closure pid:int] {
	let msg = try {
		let val = do $closure
		message $tag $OK_STATUS $val
	} catch {|e|
		message $tag $ERROR_STATUS $e
	}

	let msg_tag = $tag | split row $TAG_SEPERATOR
	| get 1 | into int
	$msg | job send $pid --tag $msg_tag
}

export def main [tag_name:string closure:closure] {
	let pid = job id
	let msg_tag = date now | format date "%H%M%S%f"
	let tag =	$"($tag_name)($TAG_SEPERATOR)($msg_tag)"

	let id = job spawn --description $tag {
		job_wrapper $tag $closure $pid
	}

	$tag
}
