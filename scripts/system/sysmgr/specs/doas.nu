def permission [] {
	print 'setting doas.conf owner to root'
	^doas chown root /etc/doas.conf
}

export def main [] {
	{
		tasks: {
			premission: {permission}
		}
	}
}
