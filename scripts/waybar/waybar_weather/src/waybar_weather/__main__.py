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
