from __future__ import annotations

import json

import requests

from datetime import time, datetime, timedelta, date

from waybar_weather.lib import get_loc, format_url, DATE_FORMAT, TIME_FORMAT, CONDITIONS_STR


class DayData:
	date: date
	high: int
	low: int
	feels_like: int
	humidity: int  # %
	precip: int  # mm
	precip_prob: int  # %
	wind: int
	uv: int
	sunrise: time
	sunset: time
	condition: int

	def __init__(self, data: dict):
		self.date = datetime.strptime(data['datetime'], DATE_FORMAT).date()
		self.high = round(data['tempmax'])
		self.low = round(data['tempmin'])
		self.feels_like = round(data['feelslike'])
		self.humidity = round(data['humidity'])
		self.precip = round(data['precip'])
		self.precip_prob = round(data['precipprob'])
		self.wind = round(data['windspeed'])
		self.uv = round(data['uvindex'])
		self.sunrise = datetime.strptime(data['sunrise'], TIME_FORMAT).time()
		self.sunset = datetime.strptime(data['sunset'], TIME_FORMAT).time()
		self.condition = CONDITIONS_STR.index(data['conditions'])


def _get_daily_data() -> list[DayData] | None:
	loc = get_loc()

	if loc is None:
		return None

	today = datetime.today()
	five_days_offset = today + timedelta(days=5)

	url = format_url(loc, today, five_days_offset, ['days'])
	res = requests.get(url)

	if res.status_code != 200:
		return None

	data = res.json()

	return list(map(DayData, data['days']))


def get_daily_data() -> list[DayData] | None:
	try:
		return _get_daily_data()
	except Exception:
		return None
