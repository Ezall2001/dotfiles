import sys

from commandline.bare_str import get_bare_str
from commandline.lib import CursorStr
from commandline.quote_str import get_quote_str


def get_cursor_str(buffer: str, pos: int) -> CursorStr:
	if buffer == '':
		return CursorStr('bare', 0, 0, '')

	cursor_str = get_quote_str(buffer, pos)

	if cursor_str is not None:
		return cursor_str

	return get_bare_str(buffer, pos)


def main():
	buffer = sys.argv[1] if len(sys.argv) > 1 else ''
	pos = int(sys.argv[2]) if len(sys.argv) > 2 else 0
	cursor_str = get_cursor_str(buffer, pos)

	print(cursor_str.to_json())


if __name__ == '__main__':
	main()
