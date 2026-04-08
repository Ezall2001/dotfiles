import json
from typing import Literal

QUOTE_DELS = ["'", '"', '`']
DELS = [' ', '|'] + QUOTE_DELS


class Del:
	char: str
	pos: int

	def __init__(self, char: str, pos: int):
		self.char = char
		self.pos = pos

	def __str__(self):
		return str(self.pos) + ':' + self.char

	def __repr__(self):
		return self.__str__()


CursorStrType = Literal['quote'] | Literal['bare'] | Literal['none']


class CursorStr:
	start: int
	end: int
	string: str
	type: CursorStrType

	def __init__(self, type: CursorStrType, start: int, end: int, string: str):
		self.type = type
		self.start = start
		self.end = end
		self.string = string

	def to_json(self):
		return json.dumps(self.__dict__)
