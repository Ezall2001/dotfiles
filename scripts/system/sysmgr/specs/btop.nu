use ../../fgen [main]

def gen [] {
	print 'generating btop config'
	fgen btop
}

export def main [] {
	{
		tasks: {
			gen: {gen}
		}
	}
}
