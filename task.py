import db


def get_activity():
    activities = db.activities()
    for a in activities:
        print(a)
    while True:
        activity_input = input('activity id: ')
        activity = db.get_activity(activity_input)
        if activity:
            break
        else:
            print("Not a valid activity id")
    return activity[0]


def get_area():
    areas = db.areas()
    for a in areas:
        print(a)
    while True:
        area_input = input('area: ')
        activity = db.get_area(area_input)
        if activity:
            break
        else:
            print("Not a valid area")
    return area[0][0]


activity_id, activity, area = get_activity()
print(f'{activity_id=}, {activity=}, {area=}')
if area == 'MULT':
    area = get_area()
print(f'{activity_id=}, {activity=}, {area=}')


# description = input('description: ')
# completed = input('completed [Y/y]: ')
# if completed:
#     duration = int(input('duration [minutes]: '))
