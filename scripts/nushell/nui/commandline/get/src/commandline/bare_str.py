from commandline.lib import DELS, CursorStr


def get_bare_str(buffer: str, pos: int):
	if pos >= len(buffer) or buffer[pos] == ' ':
		return CursorStr('none', pos, pos, '')

	s = 0
	e = len(buffer) - 1

	for i in range(pos, -1, -1):
		char = buffer[i]
		if char in DELS:
			s = i
			break

	for i in range(pos, len(buffer)):
		char = buffer[i]
		if char in DELS:
			e = i
			break

	# remove delimters
	# handles the edge cases of start/end line (no delimiter)
	if s > 0:
		s += 1

	if e < len(buffer) - 1:
		e -= 1

	cursor_str = CursorStr('bare', s, e, buffer[s : e + 1])

	return cursor_str
