rails g devise camrade first_name:string middle_name:string last_name:string birth_date:date sex:boolean country_id:integer city_id:integer
sleep 3
rails g model resume description:text title:string camrade_id:integer
sleep 3
rails g scaffold project title:string description:text min_experience:integer camrade_count:integer reserve_count:integer datetime_start:datetime datetime_end:datetime completed:boolean country_id:integer city_id:integer camrade_id:integer
sleep 3
rails g model country name:string
sleep 3
rails g model city name:string
sleep 3
rails g model scope name:string
sleep 3
rails g model specialization name:string scope_id:integer
sleep 3
rails g model experience date_start:date date_end:date description:text position_id:integer company_id:integer resume_id:integer
sleep 3
rails g model position name:string

rails g model company name:string site:string scope_id:integer city_id:integer country_id:integer
sleep 3
rails g model language_level level:integer language_id:integer
sleep 3
rails g model language name:string 
sleep 3

rails g scaffold service title:string description:text scope_id:integer camrade_id:integer
sleep 3
rails g model request message:text member:boolean reserve:boolean camrade_id:integer project_id:integer
sleep 3
rails g model comment content:text camrade_id:integer project_id:integer
sleep 3

rails g migration create_resumes_specializations_join_table
rails g migration create_resumes_scopes_join_table
rails g migration create_projects_specializations_join_table
rails g migration create_projects_scopes_join_table