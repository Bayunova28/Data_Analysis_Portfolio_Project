-- Load video games sales
select 
  * 
from 
  [practice].[dbo].[vgsales] 
  
-- Looking unique of platform
select 
  distinct [Platform] 
from 
  [practice].[dbo].[vgsales] 
  
-- Looking count of platform
select 
  [Platform], 
  count([Platform]) as PlatformCount 
from 
  [practice].[dbo].[vgsales] 
group by 
  [Platform] 
order by 
  [PlatformCount] desc 
  
-- Looking unique of genre
select 
  distinct [Genre] 
from 
  [practice].[dbo].[vgsales] 
  
-- Looking count of genre 
select 
  [Genre], 
  count([Genre]) as GenreCount 
from 
  [practice].[dbo].[vgsales] 
group by 
  [Genre] 
order by 
  [GenreCount] desc 
  
-- Looking unique of publisher
select 
  distinct [Publisher] 
from 
  [practice].[dbo].[vgsales] 
  
-- Looking count of publisher
select 
  [Publisher], 
  count([Publisher]) as PublisherCount 
from 
  [practice].[dbo].[vgsales] 
group by 
  [Publisher] 
order by 
  [PublisherCount] desc 
  
-- Looking north america sales based on rank, name and platform on XOne platform
select 
  [Rank], 
  [Name], 
  [Platform], 
  [NA_Sales] 
from 
  [practice].[dbo].[vgsales] 
where 
  [Platform] = 'XOne' 
order by 
  [Rank] asc 
  
-- Looking all sales based on period of year
select 
  [Year], 
  [NA_Sales], 
  [EU_Sales], 
  [JP_Sales], 
  [Other_Sales], 
  [Global_Sales] 
from 
  [practice].[dbo].[vgsales] 
order by 
  [Year] asc 
  
-- Looking euro sales based on name, platform on PC, PS3 and PS4 along with genre on action and shooter 
select 
  [Name], 
  [Platform], 
  [Genre], 
  [EU_Sales] 
from 
  [practice].[dbo].[vgsales] 
where 
  [Platform] in ('PC', 'PS3', 'PS4') 
  and [Genre] in ('Action', 'Shooter') 
order by 
  [EU_Sales] desc 
  
-- Looking total global sales based on name, publisher on activision and genre on action along with shooter
select 
  [Name], 
  [Publisher], 
  [Genre], 
  sum([Global_Sales]) as total_global_sales 
from 
  [practice].[dbo].[vgsales] 
where 
  [Publisher] = 'Activision' 
  and [Genre] in ('Action', 'Shooter') 
group by 
  [Name], 
  [Publisher], 
  [Genre] 
order by 
  [total_global_sales] desc 
  
-- Looking total global sales based on rank between 1 until 10, name, publisher and genre 
select 
  [Rank], 
  [Name], 
  [Publisher], 
  [Genre], 
  sum([Global_Sales]) as total_global_sales 
from 
  [practice].[dbo].[vgsales] 
where 
  [Rank] between '1' 
  and '10' 
group by 
  [Rank], 
  [Name], 
  [Publisher], 
  [Genre] 
order by 
  [Rank] asc 
  
-- Looking total global sales based on rank, name, genre and publisher
select 
  [Rank], 
  [Name], 
  [Genre], 
  [Publisher], 
  sum([Global_Sales]) as total_global_sales 
from 
  [practice].[dbo].[vgsales] 
where 
  [Publisher] in ('Ubisoft', 'Sega') 
  and [Genre] in ('Action', 'Shooter') 
group by 
  [Rank], 
  [Name], 
  [Genre], 
  [Publisher] 
order by 
  [Rank] asc
