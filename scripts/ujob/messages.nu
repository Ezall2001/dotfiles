use consts.nu [RUNNING_STATUS ERROR_STATUS FINISH_STATUS TIMEOUT_EXIT_VALUE]

export def is_std_message [msg:any]: nothing -> bool {
	try {
		$msg | get id
		$msg | get val
		($msg | get status) in [$RUNNING_STATUS $ERROR_STATUS $FINISH_STATUS]
	} catch { false }
}

export def is_timeout_message [msg:any expected_id:int]: nothing -> bool {
	(is_std_message $msg) and $msg.status == $FINISH_STATUS and $msg.val == $TIMEOUT_EXIT_VALUE and $msg.id == $expected_id
}

export def std_message [val?:any --error (-e) --finished (-f)]: nothing -> record {
	let status = if $error {$ERROR_STATUS} else if $finished {$FINISH_STATUS} else {$RUNNING_STATUS}
	{id:(job id) status:$status val:$val}
}
