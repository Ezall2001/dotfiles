const CONFIG_PATH = '~/.config/fcron/fcron.conf' | path expand

def set_perms [] {
	print 'setting fcron.conf owner to root:fcorn with 644 prems'

	^doas chown root:fcorn $CONFIG_PATH
	^doas chmod 644 $CONFIG_PATH
}

def mod_users [] {
	print 'adding users to fcron group'
	let user = whoami
	^doas usermod -aG fcron $user
}

export def main [] {
	{
		tasks: {
			set_perms: {set_perms}
			mod_users: {mod_users}
		}
	}
}
