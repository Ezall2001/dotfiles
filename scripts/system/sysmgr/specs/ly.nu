use ../../fgen [main]

def mkdirs [] {
	print 'making ly dir'
	^doas mkdir /etc/ly
}

def gen [] {
	print 'generating ly conf'
	fgen ly
}

export def main [] {
	{
		tasks: {
			mkdirs: {mkdirs}
			gen: {gen}
		}
	}
}
