use ./specs [main]
use ./main.nu [_main]

def spec_name_comp [] {
	specs | columns | append all
}

def task_name_comp [context:string] {
	let spec_name = $context | split words | last

	if $spec_name != all {
		specs | get $spec_name
		| get tasks | columns
	} else {
		specs | values
		| each {$in | get tasks | columns}
		| flatten
	} | append all

}


export def main [spec_name:string@spec_name_comp task_name:string@task_name_comp] {
	_main $spec_name $task_name
}
