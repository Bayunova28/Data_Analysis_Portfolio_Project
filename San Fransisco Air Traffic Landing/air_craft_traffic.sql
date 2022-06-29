-- Load air craft traffic dataset
select 
  * 
from 
  practice..air_craft_traffic 
  
-- Drop F1 column
alter table 
  practice..air_craft_traffic 
drop 
  column F1 
  
-- Looking count of dataset rows
select 
  count(*) as count 
from 
  practice..air_craft_traffic 
  
-- Looking unique of operating airline values
select 
  distinct [Operating Airline] 
from 
  practice..air_craft_traffic 
  
-- Replace operating airline values
update 
  practice..air_craft_traffic 
set 
  [Operating Airline] = 'United Airlines' 
where 
  [Operating Airline] = 'United Airlines - Pre 07/01/2013' 
update 
  practice..air_craft_traffic 
set 
  [Operating Airline] = 'Philippine Airline, Inc.' 
where 
  [Operating Airline] = 'Philippine Airline, Inc. (INACTIVE - DO NOT USE)' 
update 
  practice..air_craft_traffic 
set 
  [Operating Airline] = 'Northwest Airlines' 
where 
  [Operating Airline] = 'Northwest Airlines (became Delta)' 
update 
  practice..air_craft_traffic 
set 
  [Operating Airline] = 'Total Airport Services, Inc.' 
where 
  [Operating Airline] = 'Total Airport Services, Inc. (Inactive)' 
  
-- Looking count of operating airline values
select 
  [Operating Airline], 
  count([Operating Airline]) as count 
from 
  practice..air_craft_traffic 
group by 
  [Operating Airline] 
order by 
  count desc 
  
-- Looking unique published airline values
select 
  distinct [Published Airline] 
from 
  practice..air_craft_traffic 
  
-- Replace published airline values
update 
  practice..air_craft_traffic 
set 
  [Published Airline] = 'United Airlines' 
where 
  [Published Airline] = 'United Airlines - Pre 07/01/2013' 
update 
  practice..air_craft_traffic 
set 
  [Published Airline] = 'Philippine Airline, Inc.' 
where 
  [Published Airline] = 'Philippine Airline, Inc. (INACTIVE - DO NOT USE)' 
update 
  practice..air_craft_traffic 
set 
  [Published Airline] = 'Northwest Airlines' 
where 
  [Published Airline] = 'Northwest Airlines (became Delta)' 
update 
  practice..air_craft_traffic 
set 
  [Published Airline] = 'Total Airport Services, Inc.' 
where 
  [Published Airline] = 'Total Airport Services, Inc. (Inactive)' 
  
-- Looking count of published airline values
select 
  [Published Airline], 
  count([Published Airline]) as count 
from 
  practice..air_craft_traffic 
group by 
  [Published Airline] 
order by 
  count desc 
  
-- Looking unique of geo summary values
select 
  distinct [GEO Summary] 
from 
  practice..air_craft_traffic 
  
-- Looking count of geo summary values
select 
  [GEO Summary], 
  count([GEO Summary]) as count 
from 
  practice..air_craft_traffic 
group by 
  [GEO Summary] 
order by 
  count desc 
  
-- Looking unique of geo region values
select 
  distinct [GEO Region] 
from 
  practice..air_craft_traffic 
  
-- Looking count of geo region values
select 
  [GEO Region], 
  count([GEO Region]) as count 
from 
  practice..air_craft_traffic 
group by 
  [GEO Region] 
order by 
  count desc 
  
-- Looking unique of landing aircraft type
select 
  distinct [Landing Aircraft Type] 
from 
  practice..air_craft_traffic 
  
-- Looking count of landing aircraft type
select 
  [Landing Aircraft Type], 
  count([Landing Aircraft Type]) as count 
from 
  practice..air_craft_traffic 
group by 
  [Landing Aircraft Type] 
order by 
  count desc 
  
-- Looking unique of aircraft body type
select 
  distinct [Aircraft Body Type] 
from 
  practice..air_craft_traffic 
  
-- Looking count of aircraft body type
select 
  [Aircraft Body Type], 
  count([Aircraft Body Type]) as count 
from 
  practice..air_craft_traffic 
group by 
  [Aircraft Body Type] 
order by 
  count desc 
  
-- Looking unique of aircraft manufacturer values
select 
  distinct [Aircraft Manufacturer] 
from 
  practice..air_craft_traffic 
  
-- Looking count of aircraft manufacturer values
select 
  [Aircraft Manufacturer], 
  count([Aircraft Manufacturer]) as count 
from 
  practice..air_craft_traffic 
group by 
  [Aircraft Manufacturer] 
order by 
  count desc 
  
-- Drop aircraft version column
alter table 
  practice..air_craft_traffic 
drop 
  column [Aircraft Version] 
  
-- Looking descriptive statistics from landing count
select 
  sum([Landing Count]) as [Total Landing Count], 
  min([Landing Count]) as [Minimum Landing Count], 
  avg([Landing Count]) as [Average Landing Count], 
  max([Landing Count]) as [Maximum Landing Count] 
from 
  practice..air_craft_traffic 
  
-- Looking descriptive statistics from total landing weight
select 
  sum([Total Landed Weight]) as [Total Landed Weight], 
  min([Total Landed Weight]) as [Minimum Landed Weight], 
  avg([Total Landed Weight]) as [Average Landed Weight], 
  max([Total Landed Weight]) as [Maximum Landed Weight] 
from 
  practice..air_craft_traffic 
  
-- Looking total landed weight based on top 10 aircraft model
select 
  top 10 [Aircraft Model], 
  [Total Landed Weight] 
from 
  practice..air_craft_traffic 
order by 
  [Total Landed Weight] desc 
  
-- Looking total landing count based on operating airline and geo summary on domestic
select 
  top 10 [Operating Airline], 
  [GEO Summary], 
  sum([Landing Count]) as [Total Landing Count] 
from 
  practice..air_craft_traffic 
where 
  [GEO Summary] = 'Domestic' 
group by 
  [Operating Airline], 
  [GEO Summary] 
order by 
  [Total Landing Count] desc 
  
-- Looking total landing count based on top 10 published airline and geo summary on international
select 
  top 10 [Published Airline], 
  [GEO Summary], 
  sum([Landing Count]) as [Total Landing Count] 
from 
  practice..air_craft_traffic 
where 
  [GEO Summary] = 'International' 
group by 
  [Published Airline], 
  [GEO Summary] 
order by 
  [Total Landing Count] desc 
  
-- Looking total landed weight based on operating airline IATA code
select 
  [Operating Airline IATA Code], 
  [Total Landed Weight] 
from 
  practice..air_craft_traffic 
order by 
  [Total Landed Weight] desc 
  
-- Looking total landing count based on top 10 landing aircraft type on freighter and passenger or operating airline on united airlines
select 
  top 10 [Operating Airline], 
  [Landing Aircraft Type], 
  sum([Landing Count]) as [Total Landing Count] 
from 
  practice..air_craft_traffic 
where 
  [Landing Aircraft Type] in ('Freighter', 'Passenger') 
  or [Operating Airline] = 'United Airlines' 
group by 
  [Operating Airline], 
  [Landing Aircraft Type] 
order by 
  [Total Landing Count] desc 
  
-- Looking total landed weight based on aircraft body type on narrow & wide body
select 
  [Aircraft Body Type], 
  [Total Landed Weight] 
from 
  practice..air_craft_traffic 
where 
  [Aircraft Body Type] in ('Narrow Body', 'Wide Body') 
order by 
  [Total Landed Weight] desc
