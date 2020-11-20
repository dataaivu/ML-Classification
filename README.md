# Machine Learning - Logistic Regression
*Arasan M J*

*October 2020 Cohort, Berlin - 19.11.2020*

## Content

 - Project Description
 - Questions & Hypotheses
 - Dataset
 - Database
 - Workflow
 - Organization
 - Tools Used

## Project Description
A dataset of 18000 bank customers have been presented. All of them received an offer for credit card while a few accepted and others didn't. 

A machine learning model using Logistic Regression was applied on the given data to predict potential responses.

## Questions & Hypotheses

Which potential customers should we target with offeres and who to avoid?
Are there any specific chareterstics to look for?

## Dataset

The dataset was provided by IronHack, also included in this repository - https://github.com/dataaivu/Machine-Learning/blob/main/Source_Data/creditcardmarketing.csv

## Workflow 

The dataset was examined in Tableau Prep further cleaned and manipulated there. Then the file was loaded into MySQL workbench for testing some SQL queries. 

In Python, 'Pandas', 'Seaborn', 'Numpy', 'Matplotlib', 'Sklearn', and 'imblearn' modules were used. The model was contructed using random under sampling to account for Data Imbalance.

Tableau was used to visualize the data and create an appealing dashboard.

## Organization

The repository contains the following files:

 - Data_Cleaning:
	 - cleaned_data.hyper - Tableau Prep file with flows
	 - mlready.csv - Machine Learning optimized file for Python
	 - TableauPrep_Clean.csv - File optimzed for MySQL
 - Project_Deliverables:
	 - Book1.twb - Tableau workbook with all the requested worksheets and Dashboard
	 - ML_Classification_Final.ipynb - Jupyter Notebook file with the machine learning model.
	 - SQL_Codes.sql - SQL queries on the given dataset using MySQL
 - Resources:
	 - machine learn end to end helper.pdf - A step-by-step machine learning guide
 - Source_Data:
	 - Contains all the files provided by IronHack for the project.

## Tools Used

 - JIRA - Project Management using Agile techniques
 - Jupyter Notebook- Python based Data Wrangling and Machine Learning
 - Tableau - Data Visualization and Dashboards
 - Tableau Prep - Data Cleaning and preparation
 - PowerPoint - Presentation
 - GitHub Desktop - Committing and Updating the Git Repo
 - Stack Edit - Editing markdown (.md) files
 - Visual Code - Overall IDE 
 
