from __future__ import annotations

import os
import sys
from datetime import datetime, time
from typing import Callable, TypeVar

import requests
from dotenv import load_dotenv

DATE_FORMAT = '%Y-%m-%d'
TIME_FORMAT = '%H:%M:%S'
BASE_URL = 'https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline'
UNIT_GROUP = 'unitGroup=metric'

CONDITIONS_STR = [
	'Partially cloudy',
	'Rain, Partially cloudy',
	'Clear',
	'Overcast',
	'Rain, Overcast',
	'Rain',
]

TEMP_ICON = ''
CONDITIONS_ICONS = [['', ''], ['', ''], ['', ''], '', '', '']
STATE_DIR = os.getenv('XDG_STATE_HOME')
HEADER_COLOR = '#bd93f9'
FEELS_LIKE_COLOR = '#fff0f9'
LOW_COLOR = '#8be9fd'
HIGH_COLOR = '#FF2E66'
CONDITION_COLOR = '#ead3c1'
LOG_FILE = os.path.join(STATE_DIR or 'tmp', 'waybar', 'weather.log')


def get_condition_icon(condition: int, sunrise: time, sunset: time):
	if condition == 3 or condition == 4:
		return CONDITIONS_ICONS[condition]

	now = datetime.now().time()
	phase_idx = 1 if now >= sunset or now < sunrise else 0

	return CONDITIONS_ICONS[condition][phase_idx]


def load_env():
	env_path = ''

	if getattr(sys, 'frozen', False):
		base_path = sys._MEIPASS  # pyright: ignore[reportAttributeAccessIssue]
		env_path = os.path.join(base_path, '.env')
	else:
		base_path = os.path.dirname(__file__)
		env_path = os.path.join(base_path, '..', '..', '.env')

	env_path = os.path.normpath(env_path)
	load_dotenv(env_path)


def format_url(
	loc: tuple[float, float], s_date: datetime, e_date: datetime, include: list[str]
) -> str:
	loc_str = ','.join(map(str, loc))
	s_date_str = s_date.strftime(DATE_FORMAT)
	e_date_str = e_date.strftime(DATE_FORMAT)
	api_key = os.getenv('API_KEY')
	include_str = ','.join(include)

	return f'{BASE_URL}/{loc_str}/{s_date_str}/{e_date_str}?key={api_key}&include={include_str}&{UNIT_GROUP}'


def get_loc() -> tuple[float, float] | None:
	res = requests.get('https://ipinfo.io/json')

	if res.status_code != 200:
		return None

	data = res.json()
	loc = data['loc'].split(',')
	lat, lon = map(float, loc)

	return lat, lon


R = TypeVar('R')
D = TypeVar('D')


def safe(fn: Callable[..., R], default: D) -> R | D:
	try:
		return fn()
	except Exception as e:
		with open(LOG_FILE, 'a') as f:
			f.write(f'{datetime.now()}::{e}\n')
		return default
