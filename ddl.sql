create table life_areas(
    area_id         integer     primary key autoincrement,
    code            varchar(4)  not null unique,
    description     varchar(24) not null);

insert into life_areas(code, description) values
    ('HL', 'History Lab'),
    ('LEI', 'LEI Smart'),
    ('FIN', 'Personal Finance'),
    ('EX', 'Exercise'),
    ('PP', 'Personal Programming'),
    ('CE', 'Career and education'),
    ('HEAL', 'Health'),
    ('FAM', 'Family and friends'),
    ('PHIL', 'Philanthropy');

create table projects(
    -- Projects are a group of related efforts in a life area
    project_id  integer     primary key autoincrement,
    area_id     integer     not null references area,
    code        varchar(6)  not null unique,
    description varchar(32) not null,
    created     date        not null default current_date,
    completed   date
    );

create table activities(
    -- A particular type of work
    activity_id   integer     primary key autoincrement,
    code          varchar(8)  not null unique,
    description   varchar(32) not null,
    created       date        not null default current_date,
    completed     date
    );

create table tasks(
    -- A component of a project
    task_id         integer     primary key autoincrement,
    area_id         integer     not null references life_areas,
    activity_id     integer     not null references activities,
    duration        integer,    -- time in minutes the task took
    description     varchar(32),
    project_id      integer     references project,
    created         date        not null default current_date,
    completed       date
    );

create table pomodoros(
    -- A way to focus on closing out a task
    pomodoro_id     integer     primary key autoincrement,
    task_id         integer     not null references tasks,
    duration        integer,    -- pomodoro length in minutes
    description     varchar(32),
    created         timestamp with time zone not null,
    completed       timestamp with time zone not null
    );
