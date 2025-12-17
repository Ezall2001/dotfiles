import json
from datetime import datetime

from prettytable import PrettyTable, TableStyle

from waybar_weather.daily_data import DayData
from waybar_weather.hourly_data import HourData
from waybar_weather.lib import (
	CONDITION_COLOR,
	CONDITIONS_ICONS,
	CONDITIONS_STR,
	FEELS_LIKE_COLOR,
	HEADER_COLOR,
	HIGH_COLOR,
	LOW_COLOR,
	TEMP_ICON,
	get_condition_icon,
)

RAIN_ICON = CONDITIONS_ICONS[4]


def pango_space(n: int):
	return ' ' * n


def format_text(daily: list[DayData] | None, hourly: list[HourData] | None):
	if hourly is None or daily is None:
		return 'something went wrong'

	now = hourly[datetime.now().hour]
	icon = get_condition_icon(now.condition, daily[0].sunrise, daily[0].sunset)

	return f'{icon} {now.feels_like}°C'


def tooltip_today(today: DayData, now: HourData):
	icon = get_condition_icon(now.condition, today.sunrise, today.sunset)
	feels_like = (
		f'<span size="30000" color="{FEELS_LIKE_COLOR}"><tt>{icon}</tt>  {now.feels_like}°C</span>'
	)
	high = f'<span color="{HIGH_COLOR}"><b>High:</b></span> {today.high}°C'
	low = f'<span color="{LOW_COLOR}"><b>Low:</b></span> {today.low}°C'

	condition = (
		f'<span size="20000" color="{CONDITION_COLOR}"><u>{CONDITIONS_STR[now.condition]}</u></span>'
	)
	rain = f'<b>Precipitation:</b> {today.precip}mm ({today.precip_prob}% chance)'
	humidity = f'<b>Humidity:</b> {today.humidity}%'
	uv = f'<b>UV index:</b> {today.uv}'
	wind = f'<b>Wind:</b> {today.wind}km/h'

	rows = []
	rows.append(condition)
	rows.append('')
	rows.append(f'{feels_like}{pango_space(10)}<span size="15000">{high} ┃ {low}</span>')
	rows.append('')
	rows.append(rain)
	rows.append('')
	rows.append(f'{humidity}{pango_space(5)}{wind}{pango_space(5)}{uv}')

	return '\n'.join(rows)


def tooltip_daily(daily: list[DayData]):
	header_r = ['']
	temp_r = [f'{TEMP_ICON}']
	precip_prob_r = [f'{RAIN_ICON}']

	for day in daily:
		date = f'{day.date.strftime("%a")}'
		temp = f'{day.feels_like}°C'
		precip_prob = f'{day.precip_prob}%'
		header_r.append(date)
		temp_r.append(temp)
		precip_prob_r.append(precip_prob)

	t = PrettyTable(header_r, align='l')
	t.add_rows([temp_r, precip_prob_r])
	t.set_style(TableStyle.SINGLE_BORDER)

	return f'<span color="{HEADER_COLOR}"><big>Daily:</big></span>\n<tt>{t.get_string()}</tt>'


def tooltip_hourly(hourly: list[HourData]):
	header_r = ['']
	temp_r = [f'{TEMP_ICON}']
	precip_prob_r = [f'{RAIN_ICON}']

	for hour in hourly:
		time = f'{hour.time.strftime("%H")}h'
		temp = f'{hour.feels_like}°C'
		precip_prob = f'{hour.precip_prob}%'
		header_r.append(time)
		temp_r.append(temp)
		precip_prob_r.append(precip_prob)

	t = PrettyTable(header_r, align='l')
	t.add_rows([temp_r, precip_prob_r])
	t.set_style(TableStyle.SINGLE_BORDER)

	return f'<span color="{HEADER_COLOR}"><big>Hourly:</big></span>\n<tt>{t.get_string()}</tt>'


def format_tooltip(daily: list[DayData] | None, hourly: list[HourData] | None):
	today_section = "Could not retrieve today's data"
	daily_section = "Could not retrieve daily's data"
	hourly_section = "Could not retrieve today's data"

	if daily is not None and hourly is not None:
		now = hourly[datetime.now().hour]
		today_section = tooltip_today(daily[0], now)

	if daily is not None:
		daily_section = tooltip_daily(daily[1:])

	if hourly is not None:
		buckets = hourly[::4] + [hourly[-1]]
		hourly_section = tooltip_hourly(buckets)

	return str.format('{}\n\n{}\n\n{}', today_section, hourly_section, daily_section)


class Results:
	tooltip: str
	text: str

	def __init__(self, daily: list[DayData] | None, hourly: list[HourData] | None):
		self.text = format_text(daily, hourly)
		self.tooltip = format_tooltip(daily, hourly)

	def to_json(self):
		return json.dumps({'tooltip': self.tooltip, 'text': self.text})
