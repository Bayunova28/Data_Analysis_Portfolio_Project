-- Load game post baseball
SELECT 
  * 
FROM 
  practice..game_post_baseball 
  
-- Looking total away final hits based on away team name
SELECT 
  awayTeamName, 
  SUM(awayFinalHits) AS totalAwayFinalHits 
FROM 
  practice..game_post_baseball 
GROUP BY 
  awayTeamName 
ORDER BY 
  awayTeamName ASC
  
-- Looking total home final hits based on home team name
SELECT 
  homeTeamName, 
  SUM(homeFinalHits) AS totalHomeFinalHits 
FROM 
  practice..game_post_baseball 
GROUP BY 
  homeTeamName 
ORDER BY 
  homeTeamName ASC
  
-- Looking total venue capacity based on venue surface
SELECT 
  venueSurface, 
  SUM(venueCapacity) AS totalVenueCapacity 
FROM 
  practice..game_post_baseball 
GROUP BY 
  venueSurface 
ORDER BY 
  venueSurface ASC 
  
-- Looking total venue capacity based on venue city
SELECT 
  venueCity, 
  SUM(venueCapacity) AS totalVenueCapacity 
FROM 
  practice..game_post_baseball 
GROUP BY 
  venueCity 
ORDER BY 
  venueCity ASC
  
-- Looking home current total runs vs away current total runs based on year
SELECT 
  startTime, 
  SUM(homeCurrentTotalRuns) AS totalHomeCurrentRuns, 
  SUM(awayCurrentTotalRuns) AS totalAwayCurrentRuns 
FROM 
  practice..game_post_baseball 
GROUP BY 
  startTime 
ORDER BY 
  startTime ASC 
  
-- Looking total lineup position based on away team name and home team name
SELECT 
  awayTeamName, 
  homeTeamName, 
  SUM(lineupPosition) AS totalLineupPosition 
FROM 
  practice..game_post_baseball 
GROUP BY 
  awayTeamName, 
  homeTeamName 
ORDER BY 
  awayTeamName, 
  homeTeamName ASC 
  
-- Looking venue capacity based on venue name, venue city, venue surface and venue state at NY
SELECT 
  venueName, 
  venueSurface, 
  venueCity, 
  venueState, 
  venueCapacity 
FROM 
  practice..game_post_baseball 
WHERE 
  venueState = 'NY' 
ORDER BY 
  venueName ASC
  
-- Looking total starting point based on away team name and home team name per month
SELECT 
  awayTeamName, 
  homeTeamName, 
  startingBalls, 
  startingStrikes, 
  startingOuts, 
  SUM(
    startingBalls + startingStrikes + startingOuts
  ) * 30 AS totalStartingPointsPerMonth 
FROM 
  practice..game_post_baseball 
GROUP BY 
  awayTeamName, 
  homeTeamName, 
  startingBalls, 
  startingStrikes, 
  startingOuts 
ORDER BY 
  awayTeamName, 
  homeTeamName ASC 
  
-- Looking total venue capacity which has more than equals to 100000 based on home team name, outcome description and status
SELECT 
  homeTeamName, 
  outcomeDescription, 
  status, 
  SUM(venueCapacity) AS totalVenueCapacity 
FROM 
  practice..game_post_baseball 
GROUP BY 
  homeTeamName, 
  outcomeDescription, 
  status 
HAVING 
  SUM(venueCapacity) >= 100000 
ORDER BY 
  homeTeamName ASC 
  
-- Looking venue capacity description based on home team name, outcome description and venue capacity
SELECT 
  homeTeamName, 
  outcomeDescription, 
  status, 
  venueCapacity, 
  CASE WHEN venueCapacity > 50000 THEN 'Very Large' WHEN venueCapacity = 50000 THEN 'Large' ELSE 'Very Small' END AS venueCapacityDescription 
FROM 
  practice..game_post_baseball 
ORDER BY 
  homeTeamName ASC 
  
-- Looking hitter height and hitter weight based on hitter first name, hitter last name, outcome description on ball, strike loading and foul ball
SELECT 
  hitterFirstName, 
  hitterLastName, 
  outcomeDescription, 
  hitterHeight, 
  hitterWeight 
FROM 
  practice..game_post_baseball 
WHERE 
  outcomeDescription IN (
    'Ball', 'Strike Looking', 'Foul Ball'
  ) 
ORDER BY 
  hitterFirstName, 
  hitterLastName ASC
