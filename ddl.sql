create table life_areas(
    area            varchar(4)  primary key,
    description     varchar(24) not null);

insert into life_areas(area, description) values
    ('HL', 'History Lab'),
    ('LEI', 'LEI Smart'),
    ('FIN', 'Personal Finance'),
    ('EX', 'Exercise'),
    ('PP', 'Personal Programming'),
    ('CE', 'Career and education'),
    ('HEAL', 'Health'),
    ('FAM', 'Family and friends'),
    ('PHIL', 'Philanthropy'),
    ('MULT', 'For activities spanning multiple areas');

create table activities(
    -- A particular type of work
    activity_id   integer     primary key autoincrement,
    activity      varchar(8)  not null unique,
    area          varchar(4)  not null references life_areas,
    description   varchar(32) not null,
    created       date        not null default current_date,
    completed     date
    );

insert into activities(activity, description, area) values
    ('RUN','Running/Jogging','EX'),
    ('SMS','Student mentoring and support','HL'),
    ('DBDD','Database design and development','MULT'),
    ('CIVIL','Civil service','PHIL'),
    ('CONDO','Condo board/apt','FIN'),
    ('VACA','Vacation','FAM'),
    ('BANK','Banking','FIN'),
    ('DEVOPS','Keeping things running','MULT'),
    ('SHOP','Shopping','FAM'),
    ('TENNIS','Tennis','EX'),
    ('READ', 'Reading', 'MULT');

create table projects(
    -- Projects are a group of related efforts in a life area
    project_id  integer    primary key autoincrement,
    project     varchar(6)  not null unique,
    description varchar(32) not null,
    area        varchar(4)  not null references life_areas,
    created     date        not null default current_date,
    completed   date
    );

insert into projects(project, area, description) values
    ('UN', 'HL', 'UN Archives'),
    ('TTMS', 'PP', 'Time Tracking Management System');

create table tasks(
    -- A component of a project
    task_id         integer     primary key autoincrement,
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
