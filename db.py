import aiosql
import sqlite3

conn = sqlite3.connect("../sqlite/ttm.db", isolation_level=None)
dml = aiosql.from_path("dml.sql", "sqlite3")


def add_project(area_code, code, description):
    dml.add_project(conn, area_code=area_code, code=code,
                    description=description)


def list_projects():
    projects = dml.list_projects(conn)
    for p in projects:
        print(p)


def add_activity(code, description):
    dml.add_activity(conn, code=code, description=description)


def areas():
    return dml.list_areas(conn)


def get_area(area):
    return dml.get_area(conn, area)


def activities():
    return dml.list_activities(conn)


def get_activity(id):
    return dml.get_activity(conn, activity_id=id)


def done(area_code, activity_code, duration, description,
         project_code='**none**'):
    dml.done(conn, area_code=area_code, activity_code=activity_code,
             duration=duration, description=description,
             project_code=project_code)


def done_today():
    done = dml.done_today(conn)
    for d in done:
        print(d)


def open_task(area_code, activity_code, description, project_code):
    dml.open_task(conn, area_code=area_code, activity_code=activity_code,
                  description=description, project_code=project_code)


def close_task(task_id):
    dml.close_task(conn, task_id=task_id)


def list_open_tasks():
    opens = dml.list_open_tasks(conn)
    for o in opens:
        print(o)


def add_pomodoro(task_id, duration, description, created, completed):
    dml.add_pomodoro(conn, task_id=task_id, duration=duration,
                     description=description, created=created,
                     completed=completed)


def completed_pomodoros():
    pomodoros = dml.completed_pomodoros(conn)
    for p in pomodoros:
        print(p)


# life_areas = dml.get_life_areas(conn)
# for row in life_areas:
#     print(row)
