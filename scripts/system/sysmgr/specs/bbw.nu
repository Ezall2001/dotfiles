use ../../fgen [main]

def login [] {
	print 'bitwarden login'
	bw login
}

export def main [] {
	{
		tasks: {
			login: {login}
		}
	}
}
