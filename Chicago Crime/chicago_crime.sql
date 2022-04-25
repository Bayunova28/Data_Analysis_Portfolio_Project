-- Load chicago crime dataset
SELECT * FROM practice..chicago_crime

-- Looking total beat vs total ward based on primary type
SELECT primary_type, SUM(beat) AS total_beat, SUM(ward) AS total_ward
FROM practice..chicago_crime
GROUP BY primary_type
ORDER BY primary_type

-- Looking highest of beat vs ward based on primary type and description
SELECT primary_type, description, MAX(beat) AS max_beat, MAX(ward) AS max_ward
FROM practice..chicago_crime
GROUP BY primary_type, description
ORDER BY primary_type

-- Looking highest community area based on primary type over the year equals 2010
SELECT primary_type, year, MAX(community_area) AS max_community_area
FROM practice..chicago_crime
WHERE year >= '2010'
GROUP BY primary_type, year
ORDER BY primary_type

-- Looking total community area based on year and arrest
SELECT year, arrest, SUM(community_area) AS total_community_area
FROM practice..chicago_crime
GROUP BY year, arrest

-- Looking total community area based on location description
SELECT location_description, SUM(community_area) AS total_community_area
FROM practice..chicago_crime
GROUP BY location_description

-- Looking total beat based on primary type and arrest
SELECT primary_type, arrest, SUM(beat) AS total_beat
FROM practice..chicago_crime
GROUP BY primary_type, arrest
ORDER BY primary_type

-- Looking total ward based on description and arrest
SELECT description, arrest, SUM(ward) AS total_ward
FROM practice..chicago_crime
GROUP BY description, arrest
ORDER BY description


