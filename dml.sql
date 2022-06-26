-- name: get_life_areas
-- Get all the greetings in the database
select area, code, description from life_areas;

-- name: add_project!
insert into projects(project, area, description)
    values (:project, :area, :description);

-- name: list_projects
select a.area, p.project_id, p.project, p.description
    from projects p join life_areas a on (p.area = a.area);

-- name: add_activity!
insert into activities(activity, area, description)
    values (:activity, :area, :description);

-- name: list_activities
select activity_id, activity, description from activities;

-- name: task!
insert into tasks (activity_id, duration, description, completed,
                   project_id)
values ((select activity_id from activities where activity = :activity),
        :duration, :description, current_date,
        (select project_id from projects where project = :project));

-- name: done_today
select a.activity, p.project, t.duration, t.description, t.created
    from tasks t join activities a on (t.activity_id = a.activity_id)
                 left join projects p on (t.project_id = p.project_id)
    where t.completed = current_date
    order by t.completed;

-- name: open_task!
insert into tasks (area_id, activity_id, description, project_id)
values ((select area_id from life_areas where code = :area_code),
        (select activity_id from activities where code = :activity_code),
        :description,
        (select project_id from projects where code = :project_code));

-- name: list_open_tasks
select t.task_id, l.code, p.code, a.code, t.duration, t.description, t.created
    from tasks t join life_areas l on (t.area_id = l.area_id)
                 join activities a on (t.activity_id = a.activity_id)
                 left join projects p on (t.project_id = p.project_id)
    where t.completed is null
    order by t.task_id;

-- name: close_task!
update tasks
    set completed = current_date,
        duration = (select sum(duration)
                       from pomodoros
                       where task_id = :task_id)
    where task_id = :task_id;

-- name: add_pomodoro
insert into pomodoros (task_id, duration, description, created, completed)
values (:task_id, :duration, :description, :created, :completed);

-- name: completed_pomodoros
select p.pomodoro_id, l.code, pr.code, a.code, p.description, p.duration
   from pomodoros p join tasks t on (p.task_id = t.task_id)
                    join life_areas l on (t.area_id = l.area_id)
                    join activities a on (t.activity_id = a.activity_id)
                    left join projects pr on (t.project_id = pr.project_id)
   where t.completed is null
   order by p.pomodoro_id;
