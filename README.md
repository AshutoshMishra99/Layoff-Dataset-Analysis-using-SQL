# Data Analyst Project: Layoff Dataset Analysis 
 
_SQL Data Cleaning and Exploratory Data Analysis_

## Project Overview
This project involves cleaning and analyzing a dataset containing information about company layoffs in the years 2020-2022. The goal is to prepare the data for in-depth analysis and derive meaningful insights about layoff trends. The data includes companies' details, layoff counts, company stage, industry, location, and funding information. The tasks are divided into two main objectives: **data cleaning** and **exploratory data analysis (EDA)**.

## Objectives
1. **Data Cleaning:** 
   - Eliminate duplicate records.
   - Standardize and format data consistently.
   - Address null or blank values appropriately.
   - Drop irrelevant columns or rows.

2. **Exploratory Data Analysis (EDA):**
   - Analyze the scale and frequency of layoffs.
   - Identify patterns across industries and company stages.
   - Examine trends over time to detect periods of high layoffs.
   - Explore relationships between company attributes (e.g., funding, stage) and layoff trends.

---

## Data Cleaning Steps

### 1. Removing Duplicates
- The dataset was initially copied to a staging table for safe data manipulation.
- Duplicate records were identified using the `ROW_NUMBER()` function based on key attributes (company, industry, date, etc.).
- Duplicates were removed, retaining the first instance while deleting subsequent duplicates.

### 2. Standardizing the Data
- **Company Names:** Cleaned up inconsistent formatting by trimming leading or trailing spaces.
- **Industry Classification:** Consolidated industry variations (e.g., different names for the same sector) to ensure consistency.
- **Location and Country:** Standardized values for cities and countries (e.g., using "United States" uniformly).
- **Dates:** Converted the date column from text format to a standard `DATE` format.

### 3. Handling Missing Values
- Analyzed missing or null values across key columns like `industry` and `total_laid_off`.
- Filled missing industry values based on known company information from other entries.
- Replaced any remaining blank values with `NULL` for consistency.

### 4. Dropping Unnecessary Data
- Removed records where both `total_laid_off` and `percentage_laid_off` were missing.
- Dropped intermediary columns used only for data processing steps.

---

## Exploratory Data Analysis (EDA)

### Key Findings
1. **Layoff Severity:**
   - Identified companies with 100% workforce layoffs, indicating possible shutdowns.
   - Analyzed layoffs ordered by `funds_raised_millions` to understand how large, well-funded companies were affected.

2. **Top Companies by Layoffs:**
   - Summed up total layoffs by company to find those with the highest layoff numbers.
   - Ranked the top 10 companies based on total layoffs.

3. **Trends Over Time:**
   - Aggregated layoff data by year and month, revealing periods of high layoff activity.
   - Calculated cumulative layoffs to visualize trends over time.

4. **Industry Analysis:**
   - Grouped data by industry to identify sectors most affected by layoffs.
   - Observed that industries like tech and media were more heavily impacted.

5. **Company Stage Insights:**
   - Compared layoffs across company stages (e.g., Series B, Post-IPO) to find patterns.
   - Noted that even companies with significant funding were not immune to layoffs.

6. **Yearly Company Rankings:**
   - Created annual rankings of companies with the highest layoffs using the `DENSE_RANK()` function.
   - Focused on the top 5 companies each year to see shifts in layoff dynamics.

---

## Technical Details

### Database Setup
- MySQL was used to host the database.
- Data was loaded into a newly created schema named `world_layoffs` as a table named `layoffs`, with subsequent staging tables for cleaning steps.

### Techniques Employed
- **Window Functions:** Used for duplicate detection.
- **Common Table Expressions (CTEs):** Structured the cleaning and analysis processes.
- **Date Functions:** Reformatted date strings for consistency.
- **Join Operations:** Filled missing values based on similar records.

---

## Results and Insights
- Layoff peaks correlated with specific economic downturns or industry disruptions.
- The tech and media sectors experienced the highest layoff rates, with several companies laying off a significant portion of their workforce.
- Analysis showed a pattern of layoffs concentrated in startups or early-stage companies, but large, established companies were also affected.
- Cumulative layoff data revealed distinct waves, likely influenced by broader economic conditions.

---

## Conclusion
The project effectively used SQL for data cleaning and analysis, transforming raw layoff data into a structured, insightful dataset. The cleaned data provided a foundation for understanding layoff trends, identifying vulnerable sectors, and exploring the potential impact of company characteristics on layoffs.

### Future Work
- **Predictive Modeling:** Use machine learning to predict future layoffs based on company and industry data.
- **Data Visualization:** Create interactive dashboards with tools like Tableau to explore the results more dynamically.

---

## How to Reproduce the Project

1. **Database Setup:**
   - Load the CSV file into a MySQL database.
   
2. **Execute Data Cleaning Scripts:**
   - Run the provided SQL scripts for data cleaning and make sure to write the correct names of the tables as per your database.
   
3. **Perform EDA:**
   - Use the EDA queries to explore the cleaned dataset.

---



