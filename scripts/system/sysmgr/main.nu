use ./specs [main]

def do_task [tasks:record name:string] {
	if $name == all {
		$tasks | values | each {do $in}
	} else {
		do ($tasks | get $name)
	}
}

# NOTE: usual task_names:
# gen, mkdirs, mklinks, set_perms
# mod_users

export def _main [spec_name:string task_name:string] {
	let specs = specs

	if $spec_name != all {
		let tasks = $specs | get $spec_name | get tasks
		do_task $tasks $task_name
		return
	}

	$specs | values | each {|spec|
		do_task $spec.tasks $task_name
	} | ignore
}
