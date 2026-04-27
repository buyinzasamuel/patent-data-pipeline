-- Q1: Top Inventors (who has the most patents)
SELECT i.name, COUNT(r.patent_id) AS patent_count
FROM inventors i
JOIN relationships r ON i.inventor_id = r.inventor_id
GROUP BY i.inventor_id
ORDER BY patent_count DESC
LIMIT 10;

-- Q2: Top Companies
SELECT c.name, COUNT(r.patent_id) AS patent_count
FROM companies c
JOIN relationships r ON c.company_id = r.company_id
GROUP BY c.company_id
ORDER BY patent_count DESC
LIMIT 10;

-- Q3: Top Countries
SELECT i.country, COUNT(DISTINCT r.patent_id) AS patent_count
FROM inventors i
JOIN relationships r ON i.inventor_id = r.inventor_id
WHERE i.country IS NOT NULL AND i.country != ''
GROUP BY i.country
ORDER BY patent_count DESC
LIMIT 10;

-- Q4: Trends Over Time (patents per year)
SELECT year, COUNT(*) AS patent_count
FROM patents
WHERE year IS NOT NULL
GROUP BY year
ORDER BY year;

-- Q5: JOIN Query (combine patents, inventors, companies)
SELECT p.patent_id, p.title, i.name AS inventor_name, c.name AS company_name
FROM patents p
JOIN relationships r ON p.patent_id = r.patent_id
LEFT JOIN inventors i ON r.inventor_id = i.inventor_id
LEFT JOIN companies c ON r.company_id = c.company_id
LIMIT 100;

-- Q6: CTE Query (rank inventors per country)
WITH inventor_counts AS (
    SELECT i.country, i.name, COUNT(r.patent_id) AS patent_count
    FROM inventors i
    JOIN relationships r ON i.inventor_id = r.inventor_id
    WHERE i.country IS NOT NULL
    GROUP BY i.inventor_id
)
SELECT country, name, patent_count
FROM inventor_counts
WHERE patent_count > 5
ORDER BY country, patent_count DESC;

-- Q7: Ranking Query (window function)
SELECT i.name, COUNT(r.patent_id) AS patent_count,
       RANK() OVER (ORDER BY COUNT(r.patent_id) DESC) AS rank
FROM inventors i
JOIN relationships r ON i.inventor_id = r.inventor_id
GROUP BY i.inventor_id
ORDER BY rank
LIMIT 20;