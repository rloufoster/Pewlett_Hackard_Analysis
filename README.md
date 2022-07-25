# Pewlett Hackard HR Analysis on Retiring Baby Boomers


## Overview of the analysis:

Pewlett Hackard is a large company with a high percentage of employees approaching retirement age due to the baby boomer generational phenomenon. Since many of these employees are in managerial and leadership roles, the impact on the company could be disastrous. We must be prepared for the massive employee turnover by realizing it's scale in advance. This information will be crucial in creating and implementing systems and programs that will buffer the impact. One such program is the proposed mentorship program that will allow some retirement eligible employees to remain with the company as part-time mentors. The purpose of this Human Resources analysis is to determine how many employees are approaching retirement eligibility, what positions do they hold, and which employees will be eligible for the mentorship program. 
 

### Method

PostgreSQL and pgADmin were used to conduct analyses by querying the original data and creating tables. 
The original data:

    * departments.csv
    * dept_emp.csv
    * dept_manager.csv
    * employees.csv
    * salaries_csv
    * titles_csv
    

## Results:     

### Retirement Eligible Employees and their Titles

* The retirement_titles.csv table was created by joining the employees.csv and titles.csv and filtering the data on employees born         between 1952 and 1955. 

! retirement titles code

See [retirement_titles.csv]

* Because many employees had either held more than one title during their tenure or had left Pewlett Hackard all together, a second query   was done using the retirement_titles table that would eliminate duplicate records and filter on employee number and hired to_date. The   resulting table captured 90,398 employees retiring along with their unique, most current title.

    ! unique_titles_code

    See [unique_titles.csv]

* To get a cummulative count along with the titles, the retiring_titles query was performed by using COUNT on the unique_titles table.

    ! retiring_titles_code

* Of the 90,398 employees eligible for retirement, there are 29,414 Senior Engineers, 28,254 Senior Staff, 14,222 Engineers, 12,243         Staff, 4,502 Technique Leaders, 1,761 Assistant Engineers, and 2 Managers. See below.

    ! ADD THE RETIRING_TITLES TABLE HERE



### Determine the employees eligible for the Mentorship Program

* The mentorship_eligibility data was captured by joining the employees.csv, department.csv, employees.csv, and titles.csv tables.  
This query filtered on employees who were born in 1965 and that are currently working at Pewlett Hackard. There are 1,549 employees eligible for the mentorship/semi-retirement package using these criteria.

! mentorship_eligibility_code

See [mentorship_eligibilty.csv]


## Summary:

* How many roles will need to be filled as the "silver tsunami" begins to make an impact:

! will_be_retiring_code

See [will_be_retiring.csv

* Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?

! will_be retiring_bydept_code

See [will_be retiring_bydept.csv

In order for Pewlett Hackard to be best prepared, we must equip ourselves with two crucial points of information: 1.)   to create systems to maintain our competive edge
