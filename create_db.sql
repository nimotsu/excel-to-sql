DROP SCHEMA if exists alumni_db cascade;

CREATE SCHEMA alumni_db
    AUTHORIZATION postgres;
	
drop table if exists alumni_db.individual cascade;
create table alumni_db.individual(
	ind_id char (12) primary key,
	ind_name varchar (80),
	-- YOB date,
	gender varchar (7),
	-- race varchar (5),
	-- email varchar (20),
	-- mobile_no varchar (15),
	linkedin_url varchar (200),
	curr_company varchar (120),
	curr_title varchar (120),
	ts timestamp default now()
	);

drop table if exists alumni_db.enterprise cascade;
create table alumni_db.enterprise(
	ind_id char (12) references alumni_db.individual (ind_id) primary key,
	email varchar (70),
	mobile_no varchar (30),
	prev_company varchar (120),
	prev_title varchar (120),
	ts timestamp default now()
	);

drop table if exists alumni_db.data_star cascade;
create table alumni_db.data_star(
	ind_id char (12) references alumni_db.individual (ind_id) primary key,
	race varchar (1),
	-- yob char (4),
	institution varchar (50),
	highest_qualification varchar (20),
	major varchar (30),
	cgpa numeric (4,2),
	ts timestamp default now()
	);

drop table if exists alumni_db.course cascade;
create table alumni_db.course(
	course_id varchar (10) primary key,
	course_name varchar (70),
	-- price numeric (10,2),
	-- duration integer
	ts timestamp default now()
	);

drop table if exists alumni_db.intake cascade;
create table alumni_db.intake(
	intake_id varchar (10) primary key,
	course_id varchar (10) references alumni_db.course (course_id),
	start_date date,
	grad_date date,
	ts timestamp default now()
	);
					
drop table if exists alumni_db.enrolment cascade;
create table alumni_db.enrolment(
	ind_id char (12) references alumni_db.individual (ind_id),
	intake_id varchar (10) references alumni_db.intake (intake_id),
	payment_date date,
	ts timestamp default now(),
	primary key (ind_id,intake_id)
	);
	
drop table if exists alumni_db.old_cert cascade;
create table alumni_db.old_cert(
	cert_id varchar (20) primary key,
	ind_id char (12) references alumni_db.individual (ind_id),
	intake_id varchar (10) references alumni_db.intake (intake_id),
	issue_date date,
	ts timestamp default now()
	);
	
drop table if exists alumni_db.attempt cascade;
create table alumni_db.attempt(
	attempt_id char (10) primary key,
	ind_id char (12) references alumni_db.individual (ind_id),
	course_id varchar (10) references alumni_db.course (course_id),
	att_date date,
	score numeric (6,2),
	pass boolean,
	ts timestamp default now()
	);
	
drop table if exists alumni_db.new_cert cascade;
create table alumni_db.new_cert(
	attempt_id char (10) references alumni_db.attempt (attempt_id),
	issue_date date,
	ts timestamp default now(),
	primary key (attempt_id)
	);
