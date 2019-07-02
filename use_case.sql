-- how many have graduated from the data star courses? 
select count(ind_id) as no_of_Data_Star_graduates 
from alumni_db.individual as i, alumni_db.data_star as ds
where i.ind_id = ds.ind_id
;

-- courses/modules offered by CADS
select c_id, c_name
from alumni_db.course
;

-- insert new individual data
insert into alumni_db.individual 
(ind_name, gender, linkedin_url)
values ('John Smith', 'transgender', 'https://www.linkedin.com/in/shangcheong3004/')
;

-- course attended by individual
select c_name, start_date
from individual as i, intake as int, course as c, enrolment as e
where i.ind_id = e.ind_id
and e.intake_id = int.intake_id
and int.course_id = c.course_id
and i.ind_id = 'blablabla'
;

-- certificates received by individual
select cert_id, course_name, issue_date
from individual as i, old_cert as oc, intake as int, course as c 
where i.ind_id  = oc.ind_id 
and oc.intake_id = int.intake_id 
and int.course_id = c.course_id 
and i.ind_id = 'blablabla'
;