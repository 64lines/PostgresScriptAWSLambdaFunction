-- create a new test schema 
-- one time script 
-- create schema edudirect_staging_non_spectrum_test_j;
-- create a table in the new schema and extract all the rows from the existing "external" schema 
-- create table edudirect_staging_non_spectrum_test_j.lead_fact_table_dev_current
-- sortKey(created_date, monetization_type_name, publisher_name)
-- as 
-- (
-- select 
-- *
-- from 
-- edudirect_staging.lead_fact_table_dev_current
-- );
-- analyze edudirect_staging_non_spectrum_test_j.lead_fact_table_dev_current;
--- on going script

begin;

delete edudirect_staging_non_spectrum_test_j.lead_fact_table_dev_current  where created_date < CURRENT_DATE;

update 
edudirect_staging_non_spectrum_test_j.lead_fact_table_dev_current 
set 
visitor_id  = s.visitor_id,
created_time_date  = s.created_time_date,
created_date = s.created_date ,
created_day_of_week  = s.created_day_of_week,
created_hour_date  = s.created_hour_date,
modified_time_date  = s.modified_time_date,
modified_date = s.modified_date ,
modified_hour_date  = s.modified_hour_date,
country_id  = s.country_id,
state_id  = s.state_id,
publisher_id  = s.publisher_id,
program_id  = s.program_id,
monetization_type_name  = s.monetization_type_name,
monetization_type_code_name  = s.monetization_type_code_name,
form_position_name  = s.form_position_name,
education_level_id  = s.education_level_id,
age_name  = s.age_name,
grad_year_name  = s.grad_year_name,
military_flag  = s.military_flag,
status_name  = s.status_name,
accepted_price_base  = s.accepted_price_base,
affiliate_price_base  = s.affiliate_price_base,
country_local_flag  = s.country_local_flag,
zipcode_name  = s.zipcode_name,
first_form_flag  = s.first_form_flag,
years_diff_grad_base  = s.years_diff_grad_base,
lead_accepted_cnt_base  = s.lead_accepted_cnt_base,
lead_cnt_base  = s.lead_cnt_base,
lead_dual_consent_cnt_base  = s.lead_dual_consent_cnt_base,
url_name  = s.url_name,
country_name  = s.country_name,
country_code_name  = s.country_code_name,
state_name  = s.state_name,
state_code_name  = s.state_code_name,
state_local_name  = s.state_local_name,
publisher_name  = s.publisher_name,
publisher_affiliate_id  = s.publisher_affiliate_id,
publisher_affiliate_name  = s.publisher_affiliate_name,
program_name  = s.program_name,
degree_slug_name  = s.degree_slug_name,
degree_id  = s.degree_id,
degree_name  = s.degree_name,
subject_slug_name  = s.subject_slug_name,
subject_id  = s.subject_id,
subject_name  = s.subject_name,
category_slug_name  = s.category_slug_name,
category_id  = s.category_id,
category_name  = s.category_name,
school_name  = s.school_name,
lead_program_school_nfp_flag  = s.lead_program_school_nfp_flag,
lead_program_school_enable_flag  = s.lead_program_school_enable_flag,
school_slug_name  = s.school_slug_name,
school_id  = s.school_id,
account_manager_id  = s.account_manager_id,
education_level_name  = s.education_level_name,
mobile_flag  = s.mobile_flag,
device_os_info_name  = s.device_os_info_name,
form_position_group_name  = s.form_position_group_name,
form_position_slug_name  = s.form_position_slug_name,
account_manager_name  = s.account_manager_name,
cap_name  = s.cap_name,
cap_id  = s.cap_id,
page_id  = s.page_id,
page_name  = s.page_name,
page_type_name  = s.page_type_name,
page_content_name  = s.page_content_name,
page_degree_name  = s.page_degree_name,
page_category_name  = s.page_category_name,
page_subject_name  = s.page_subject_name,
domain_id  = s.domain_id,
domain_name  = s.domain_name,
browser_major  = s.browser_major,
browser_name  = s.browser_name,
browser_version  = s.browser_version,
device_model  = s.device_model,
device_type  = s.device_type,
device_vendor  = s.device_vendor,
engine_name  = s.engine_name,
engine_version  = s.engine_version,
os_name  = s.os_name,
os_version  = s.os_version,
product_name  = s.product_name,
product_code_name  = s.product_code_name,
price_uom_name  = s.price_uom_name,
data_source  = s.data_source,
event_type  = s.event_type,
lead_test_cnt_base  = s.lead_test_cnt_base,
billable_price_base  = s.billable_price_base,
subject_relation  = s.subject_relation,
first_form_degree_id  = s.first_form_degree_id,
first_form_degree_name  = s.first_form_degree_name,
first_form_degree_slug_name  = s.first_form_degree_slug_name,
first_form_category_id  = s.first_form_category_id,
first_form_category_name  = s.first_form_category_name,
first_form_category_slug_name  = s.first_form_category_slug_name,
first_form_subject_id  = s.first_form_subject_id,
first_form_subject_name  = s.first_form_subject_name,
first_form_subject_slug_name  = s.first_form_subject_slug_name,
year  = s.year,
month  = s.month,
day  = s.day
from 
edudirect_staging.lead_fact_table_dev_current s 
where 
edudirect_staging_non_spectrum_test_j.lead_fact_table_dev_current.lead_id = s.lead_id;


-- insert statement 
insert into edudirect_staging_non_spectrum_test_j.lead_fact_table_dev_current 
select 
s.*
from 
edudirect_staging.lead_fact_table_dev_current s
left join edudirect_staging_non_spectrum_test_j.lead_fact_table_dev_current t 
on 
s.lead_id = t.lead_id 
where 
t.lead_id is null;

analyze edudirect_staging_non_spectrum_test_j.lead_fact_table_dev_current;

end;


