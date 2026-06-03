# 🦠 COVID-19 Data Exploration Using MySQL & Power BI

## 📊 Project Overview

This project explores global COVID-19 data using **MySQL for data exploration and analysis** and **Power BI for visualization**.  

The goal is to transform raw public health data into meaningful insights by analyzing infection trends, death rates, and vaccination progress across countries and continents.

The project follows a full data analytics workflow:
**Data Cleaning → SQL Analysis → Insight Generation → Dashboard Visualization**

---

## 🎯 Objectives

- Analyze COVID-19 cases and deaths across different countries
- Calculate infection and mortality rates
- Identify countries with the highest infection and death counts
- Compare COVID-19 impact across continents
- Analyze vaccination progress over time
- Build an interactive Power BI dashboard for visualization

---

## 🗄️ Dataset

The dataset is sourced from **Our World in Data**.

### Tables Used:
- CovidDeaths
- CovidVaccinations

### Key Fields:
- Location
- Date
- Population
- Total Cases
- New Cases
- Total Deaths
- New Deaths
- New Vaccinations

---

## 🛠️ Tools & Technologies

- MySQL
- Power BI
- SQL (Joins, CTEs, Window Functions, Aggregations)
- Data Visualization

---

## 📊 Power BI Dashboard

The dashboard visualizes key COVID-19 metrics including cases, deaths, infection rates, and country-wise comparisons.

## 📈 Key Insights

- Countries with smaller populations showed higher infection percentages
- Death rates varied significantly across continents and regions
- Vaccination rollout significantly impacted reduction in new cases
- United States recorded the highest total number of deaths
- Global infection trends peaked in multiple waves over time

---

## 🧠 SQL Skills Demonstrated

### Data Exploration
- Filtering and sorting data
- Calculating percentages and ratios
- Country-level and continent-level analysis

### Data Cleaning
- Handling NULL values
- Data type conversion using CAST()
- Standardizing inconsistent values

### Advanced SQL Concepts
- Joins
- Aggregate Functions
- Window Functions
- Common Table Expressions (CTEs)
- Temporary Tables
- Views
- Running Totals
- Partitioning

---

## 📊 Analysis Performed

### 1. Total Cases vs Total Deaths
Calculated the likelihood of death after contracting COVID-19.

### 2. Total Cases vs Population
Measured infection percentage relative to population size.

### 3. Highest Infection Rates
Identified countries with the highest infection percentages.

### 4. Highest Death Counts
Ranked countries based on total COVID-19 deaths.

### 5. Continent-Level Analysis
Compared total deaths across continents.

### 6. Global Statistics
- Total cases worldwide
- Total deaths worldwide
- Global death percentage

### 7. Vaccination Analysis
Analyzed vaccination progress using cumulative and rolling totals.

---

## 📁 Repository Structure
COVID-19-Data-Exploration/
│
├── CovidDeaths.csv
├── CovidVaccinations.csv
├── COVID Portfolio Project.sql
├── dashboard.pbix
├──dashboard.png
└── README.md


---

## 🚀 Future Improvements

- Add more interactive Power BI filters and slicers
- Build time-series forecasting analysis
- Automate data pipeline for updates
- Expand analysis to regional healthcare comparisons

---

## 🎯 Project Impact

This project demonstrates how raw public health data can be transformed into actionable insights using SQL and Power BI.  

It reflects real-world data analyst workflows including data extraction, transformation, analysis, and visualization.

---

## 👨‍💻 Author

Himanshu
Aspiring Data Analyst | SQL | Power BI | Data Visualization
