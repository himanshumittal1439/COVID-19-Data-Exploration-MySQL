# COVID-19 Data Exploration Using MySQL

## Project Overview

This project explores global COVID-19 data using MySQL to uncover trends in infection rates, death rates, and vaccination progress across countries and continents.

The analysis focuses on transforming raw data into meaningful insights through SQL queries, aggregations, joins, window functions, Common Table Expressions (CTEs), temporary tables, and views.

## Credits

This project was inspired by a data analytics tutorial by Alex The Analyst on YouTube.
---

## Objectives

* Analyze COVID-19 cases and deaths across different countries.
* Calculate infection and mortality percentages.
* Identify countries with the highest infection rates.
* Identify countries with the highest death counts.
* Compare COVID-19 impact across continents.
* Analyze vaccination progress over time.
* Practice advanced SQL techniques on a real-world dataset.

---

## Dataset

The dataset used in this project is the COVID-19 dataset published by Our World in Data.

Tables Used:

* CovidDeaths
* CovidVaccinations

Key fields analyzed:

* Location
* Date
* Population
* Total Cases
* New Cases
* Total Deaths
* New Deaths
* New Vaccinations

---

## SQL Skills Demonstrated

### Data Exploration

* Filtering and sorting data
* Calculating percentages and ratios
* Country-level and continent-level analysis

### Data Cleaning

* Handling NULL values
* Trimming inconsistent values
* Type conversion using CAST()

### SQL Concepts Used

* Joins
* Aggregate Functions
* Window Functions
* Common Table Expressions (CTEs)
* Temporary Tables
* Views
* Partitioning
* Running Totals

---

## Analysis Performed

### Total Cases vs Total Deaths

Calculated the likelihood of death after contracting COVID-19 for selected countries.

### Total Cases vs Population

Measured the percentage of a country's population infected by COVID-19.

### Countries with Highest Infection Rates

Identified countries with the largest proportion of infected citizens relative to population.

### Countries with Highest Death Counts

Ranked countries based on total reported COVID-19 deaths.

### Continent-Level Analysis

Compared total death counts across continents.

### Global Statistics

Calculated:

* Total global cases
* Total global deaths
* Global death percentage

### Vaccination Analysis

Analyzed vaccination progress using cumulative vaccination counts and rolling totals.

### Population vs Vaccination Analysis

Calculated the percentage of the population vaccinated over time.

---

## Advanced SQL Techniques

### Common Table Expressions (CTEs)

Used CTEs to simplify complex vaccination calculations and improve query readability.

### Temporary Tables

Created temporary tables to store intermediate vaccination data for further analysis.

### Views

Created reusable views to support future visualization and reporting projects.

---

## Repository Structure

├── COVID Portfolio Project.sql

├── CovidDeaths.csv

├── CovidVaccinations.csv

├── README.md

---

## Future Improvements

* Build an interactive Tableau dashboard.
* Create Power BI visualizations.
* Add time-series trend analysis.
* Perform country-to-country comparisons.
* Develop automated reporting workflows.

---

## Key Takeaways

This project strengthened my understanding of SQL-based exploratory data analysis using real-world data. It provided hands-on experience working with large datasets and applying advanced SQL techniques to generate meaningful business and public health insights.
