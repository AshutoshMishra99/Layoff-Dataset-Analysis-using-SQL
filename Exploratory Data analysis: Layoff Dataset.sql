-- Exploratory Data Analysis
SELECT * 
FROM layoffs_staging2;

-- Looking at Percentage to see how big these layoffs were
SELECT MAX(total_laid_off), MAX(percentage_laid_off)
FROM layoffs_staging2;

-- Which companies had 1 which is basically 100 percent of they company laid off
SELECT *
FROM layoffs_staging2
WHERE percentage_laid_off = 1
ORDER BY total_laid_off DESC;

-- if we order by funds_raised_millions we can see how big some of these companies were
SELECT *
FROM layoffs_staging2
WHERE percentage_laid_off = 1
ORDER BY funds_raised_millions DESC;


-- Companies with the most Total Layoffs
SELECT company, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company
ORDER BY 2 DESC
LIMIT 10;

SELECT MIN(`date`), MAX(`date`)
FROM layoffs_staging2;

SELECT industry, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY industry
ORDER BY 2 DESC;

SELECT YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY YEAR(`date`)
ORDER BY 1 DESC;

SELECT stage, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY stage
ORDER BY 2 DESC;

SELECT SUBSTRING(`date`, 1, 7) `YEAR`, SUM(total_laid_off)
FROM layoffs_staging2 
WHERE SUBSTRING(`date`, 1, 7) IS NOT NULL
GROUP BY `YEAR`
ORDER BY `YEAR`;

WITH rolling_total AS
(
SELECT SUBSTRING(`date`, 1, 7) `YEAR`, SUM(total_laid_off) total_off
FROM layoffs_staging2 
WHERE SUBSTRING(`date`, 1, 7) IS NOT NULL
GROUP BY `YEAR`
ORDER BY `YEAR`
)
SELECT `YEAR`,total_off, SUM(total_off) OVER(ORDER BY `YEAR`) rolling_total
FROM rolling_total;

WITH Company_year (company, years, total_laid_off) AS(
SELECT company, YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company, YEAR(`date`)
), Company_year_rank AS
(
SELECT *, DENSE_RANK() OVER (PARTITION BY years ORDER BY total_laid_off DESC) AS Ranking
FROM Company_year
WHERE years IS NOT NULL
)
SELECT *
FROM Company_year_rank
WHERE Ranking <= 5;

