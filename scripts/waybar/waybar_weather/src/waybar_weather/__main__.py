from waybar_weather.daily_data import get_daily_data
from waybar_weather.hourly_data import get_hourly_data
from waybar_weather.lib import load_env, safe
from waybar_weather.result import Results


def main():
	load_env()

	daily_data = safe(get_daily_data, None)
	hourly_data = safe(get_hourly_data, None)

	result = Results(daily_data, hourly_data)

	print(result.to_json())


if __name__ == '__main__':
	main()


# tooltip_text = str.format(
# 	'\t\t{}\t\t\n{}\n{}\n{}\n\n{}\n{}\n{}\n\n{}\n{}',
# 	f'<span size="xx-large">{temp}</span>',
# 	f'<big>{icon}</big>',
# 	f'<big>{status}</big>',
# 	f'<small>{temp_feel_text}</small>',
# 	f'<big>{temp_min_max}</big>',
# 	f'{wind_text}\t{humidity_text}',
# 	f'{visbility_text}\tAQI {air_quality_index}',
# 	f'<i>{r_prediction}</i>',
# 	f'<i>{t_prediction}</i>',
# )
#
# # print waybar module data
# out_data = {
# 	'text': f'{icon}   {temp}',
# 	'alt': status,
# 	'tooltip': tooltip_text,
# 	'class': status_code,
# }
#
# print(json.dumps(out_data))  # noqa: T201
