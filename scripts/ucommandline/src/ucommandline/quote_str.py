from ucommandline.lib import QUOTE_DELS, CursorStr, Del


class Span:
	start: int
	end: int
	char: str

	def __init__(self, a: Del, b: Del):
		if a.char != b.char:
			raise (Exception('incorrect span'))

		self.start = a.pos
		self.end = b.pos
		self.char = a.char

	def __str__(self):
		return f'{self.start}-{self.end}:{self.char}'

	def __repr__(self):
		return self.__str__()


def check_span(char: str, stack: list[Del]):
	stack_l = len(stack)

	for i, d in enumerate(reversed(stack)):
		if d.char == char:
			return stack_l - i - 1

	return -1


def get_str_spans(buffer: str) -> list[Span]:
	spans: list[Span] = []
	stack: list[Del] = []

	for i, char in enumerate(buffer):
		if char not in QUOTE_DELS:
			continue

		d = Del(char, i)
		match_idx = check_span(char, stack)

		if match_idx == -1:
			stack.append(d)
			continue

		span = Span(stack[match_idx], d)
		spans.append(span)
		stack = stack[:match_idx]

	return spans


def get_quote_str(buffer: str, pos: int):
	str_spans = get_str_spans(buffer)

	cursor_str = CursorStr('none', 0, 0, '')

	for span in str_spans:
		inside = pos >= span.start and pos <= span.end
		bigger = span.end - span.start > cursor_str.end - cursor_str.start + 2  # for the delimiters
		if inside and bigger:
			string = buffer[span.start + 1 : span.end]
			cursor_str = CursorStr('quote', span.start + 1, span.end - 1, string)

	if cursor_str.string == '':
		return None

	return cursor_str
