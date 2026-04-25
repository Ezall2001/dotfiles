use consts.nu [TAG_SEPERATOR ERROR_STATUS OK_STATUS]
use messages.nu [message]
use ./new_tag.nu [main]

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

export def main [closure:closure --tag-name(-n):string --tag(-t):string] {
	if $tag == null and $tag_name == null {
		error make 'you need to pass either a tag name or the full tag'
	}

	let pid = job id
	let tag = $tag | default {new_tag $tag_name}

	let id = job spawn --description $tag {
		job_wrapper $tag $closure $pid
	}

	$tag
}
