# Pewlett Hackard HR Analysis on Retiring Baby Boomers


## Overview of the analysis:

Pewlett Hackard is a large company with a high percentage of employees approaching retirement age due to the baby boomer generational phenomenon. Since many of these employees are in managerial and leadership roles, the impact on the company could be disastrous. We must be prepared for the massive employee turnover by realizing it's scale in advance. This information will be crucial in creating and implementing systems and programs that will buffer the impact. One such program is the proposed mentorship program that will allow some retirement eligible employees to remain with the company as part-time mentors. The purpose of this Human Resources analysis is to determine how many employees are approaching retirement eligibility, what positions do they hold, and which employees will be eligible for the mentorship program. 
 

### Method

PostgreSQL and pgAdmin were used to conduct analyses by querying the original data and creating tables by filtering on birth dates, hiring dates, department and title data. 

**The original data:**

    * departments.csv
    * dept_emp.csv
    * dept_manager.csv
    * employees.csv
    * salaries_csv
    * titles_csv
    

## Results:     

### Retirement Eligible Employees and their Titles

* The retirement_titles table was created by joining the employees.csv and titles.csv and filtering the data on employees born         between 1952 and 1955. See [retirement_titles.csv](https://raw.githubusercontent.com/rloufoster/Pewlett_Hackard_Analysis/main/Pewlett_Hackard_Analysis_Folder/Data_Challenge/retirement_titles.csv)

   
   ![retirement_titles_code](https://github.com/rloufoster/Pewlett_Hackard_Analysis/blob/main/Pewlett_Hackard_Analysis_Folder/challenge_resources/retirement_titles_code.png)


* Because many employees had either held more than one position during their tenure or had left Pewlett Hackard all together, a second query was done using the retirement_titles table that would all us to eliminate duplicate records and filter on employee number and hired to_date. The resulting table captured **90,398** employees that will be eligible to retire and it also included the employee's unique, most current title. See [unique_titles.csv](https://raw.githubusercontent.com/rloufoster/Pewlett_Hackard_Analysis/main/Pewlett_Hackard_Analysis_Folder/Data_Challenge/unique_titles.csv)

    
    ![unique_titles_code](https://github.com/rloufoster/Pewlett_Hackard_Analysis/blob/main/Pewlett_Hackard_Analysis_Folder/challenge_resources/unique_titles_code.png)



* To get a cummulative count that corresponded with the titles, the retiring_titles query was performed by using COUNT on the unique_titles table. Of the 90,398 employees eligible for retirement, there are 29,414 Senior Engineers, 28,254 Senior Staff, 14,222 Engineers, 12,243 Staff, 4,502 Technique Leaders, 1,761 Assistant Engineers, and 2 Managers. See table below.

   
   ![retiring_titles_table](https://github.com/rloufoster/Pewlett_Hackard_Analysis/blob/main/Pewlett_Hackard_Analysis_Folder/challenge_resources/Retiring_Titles_Table.png)



### Determine the employees eligible for the Mentorship Program

* The mentorship_eligibility data was captured by joining the employees.csv, department.csv, employees.csv, and titles.csv tables.  
  This query filtered on employees who were born in 1965 and that are currently working at Pewlett Hackard. There are **1,549** employees   eligible for the mentorship/semi-retirement package using these criteria. See [mentorship_eligibilty.csv](https://github.com/rloufoster/Pewlett_Hackard_Analysis/blob/main/Pewlett_Hackard_Analysis_Folder/Data_Challenge/mentorship_eligibilty.csv) 
  
  
  ![mentorship_eligibility_code](https://github.com/rloufoster/Pewlett_Hackard_Analysis/blob/main/Pewlett_Hackard_Analysis_Folder/challenge_resources/mentorship_eligibility_code.png)



## Summary:

###  How many roles will need to be filled as the "silver tsunami" begins to make an impact?

* In order to determine how many positions Pewlett Packard should be prepared to fill in the near future, a query was performed that       filtered current employees hired between 1985 and 1988 with birth dates between 1962 and 1965. This query captured **13,505** employees   that will be offered the mentorship package for semi-retirement.  This will provide a sort of "flood wall" to protect the company from   the silver tsunami. It will also provide a new, less experienced workforce with the means to learn on the job with more guided           supervision. See [employees_leaving.csv](https://github.com/rloufoster/Pewlett_Hackard_Analysis/blob/main/Pewlett_Hackard_Analysis_Folder/Data_Challenge/employees_leaving.csv)

   ![employees_leaving_code](https://github.com/rloufoster/Pewlett_Hackard_Analysis/blob/main/Pewlett_Hackard_Analysis_Folder/challenge_resources/employees_leaving_code.png)

### Will there be enough qualified mentors in all of the departments? 
 
* The above employees_leaving table was joined with the departments and the titles tables query the employees leaving by department. See [employees_leaving_by_dept](https://github.com/rloufoster/Pewlett_Hackard_Analysis/blob/main/Pewlett_Hackard_Analysis_Folder/Data_Challenge/employees_leaving_by_dept.csv)

    ![employees_leaving_by_dept_code](https://github.com/rloufoster/Pewlett_Hackard_Analysis/blob/main/Pewlett_Hackard_Analysis_Folder/challenge_resources/employees_leaving_by_dept_code.png)

* A COUNT was applied to the above table to get the "Employees Retiring-Totals by Department Table" as shown below.
  
  ![employees_leaving_by_dept_totals_table](https://github.com/rloufoster/Pewlett_Hackard_Analysis/blob/main/Pewlett_Hackard_Analysis_Folder/challenge_resources/employees_leaving_by_dept_totals_table.png)
  
 In conclusion, there is a deep pool of possible mentors in all of the departments. It really comes down to incentive for the retirement eligible employees. What else might we propose to offer this group to keep them on board the company for a few more years as they transition into retirement?  As part-time employees, would they keep their insurance benefits?  This would be an important point for this demographic. What about retirement savings options?  Would they still be able to contribute to the company 401K? Would the funds continue to be matched and at what level?  These are all questions that deserve further investigation while compiling the mentorship package that is being proposed.  These incentives could be very costly to Pewlett Hackard. Further Business Analyses should be conducted as well to study the ROI. 
   
