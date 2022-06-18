import argparse
import time


def sound_alarm(rings=12, freq=5):
    print('Control-C to stop alarm.')
    try:
        for i in range(rings):
            print('\a', end='\r')
            time.sleep(freq)
    except KeyboardInterrupt:
        return


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
    sound_alarm()
else:
    print('The timer must be set to an integer value between 1 and 120.')
