import db
import timer
import datetime

db.list_open_tasks()
task_id = input('which task id? ')
duration = int(input('how long in minutes? '))
start_time = datetime.datetime.now()
print(f'{start_time=}')
timer.pomodoro_timer_cli(duration)
completion_time = datetime.datetime.now()
timer.sound_alarm()
description = input('any description? ')
db.add_pomodoro(task_id, duration, description, start_time, completion_time)
