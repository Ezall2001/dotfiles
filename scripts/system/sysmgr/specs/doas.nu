use ../../fgen [main]

def gen [] {
	print 'generating doas conf'
	fgen doas
}

export def main [] {
	{
		tasks: {
			gen: {gen}
		}
	}
}
