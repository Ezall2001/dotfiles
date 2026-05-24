local apply_cmd = function(client, ca)
	--TEST: command execusion should be sync (if exec_cmd is not try the request_sync 'workspace/execcommand')
	client:request_sync('workspace/executeCommand', {
		command = ca.command.command,
		arguments = ca.command.arguments,
	})
end

return apply_cmd
