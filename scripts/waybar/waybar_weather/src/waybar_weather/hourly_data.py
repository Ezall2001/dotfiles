from __future__ import annotations

from datetime import datetime, time

import requests

from waybar_weather.lib import CONDITIONS_STR, TIME_FORMAT, format_url, get_loc


class HourData:
	time: time
	feels_like: int
	precip_prob: int  # %
	condition: int

	def __init__(self, data: dict):
		self.time = datetime.strptime(data['datetime'], TIME_FORMAT).time()
		self.feels_like = round(data['feelslike'])
		self.precip_prob = round(data['precipprob'])
		self.condition = CONDITIONS_STR.index(data['conditions'])


def get_hourly_data() -> list[HourData] | None:
	loc = get_loc()

	if loc is None:
		return None

	today = datetime.today()

	url = format_url(loc, today, today, ['hours'])
	res = requests.get(url)

	if res.status_code != 200:
		return None

	data = res.json()
	hours = data['days'][0]['hours']
	return list(map(HourData, hours))
