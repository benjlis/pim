import argparse
import time


def pomodoro_timer_cli(minutes):
    while minutes:
        print(f'{minutes} minute{"s" if minutes > 1 else ""} to go', end="\r")
        time.sleep(60)
        minutes -= 1


parser = argparse.ArgumentParser()
parser.add_argument("minutes", help='number of minutes to set timer (1-120)',
                    type=int)
args = parser.parse_args()
if 1 <= args.minutes <= 120:
    pomodoro_timer_cli(args.minutes)
else:
    print('The timer must be set to an integer value between 1 and 120.')
