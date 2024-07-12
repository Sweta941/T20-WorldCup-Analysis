create database T20_WorldCup_2022;

use T20_WorldCup_2022;

/* Renaming the column economy to economy_rate*/
alter table bowling_summary
rename column economy to economy_rate;

select * from bowling_summary;

/* Renaming the column SR to strike_rate*/
alter table bating_summary
rename column SR to strike_rate;

select * from bating_summary;

/* Date transformation*/
alter table match_summary
add column Match_Date date;

select str_to_date(matchDate, "%b %d, %Y"), Match_Date
from match_summary;

set SQL_SAFE_UPDATES = 0;

update match_summary
set Match_Date = str_to_date(matchDate, "%b %d, %Y" );

select * from match_summary;

/* 1. Number of players in each team in T20_players_2022*/
select team,count(Distinct name) as No_of_players
from t20_players_2022
group by team
order by No_of_players desc;

/* 2. Number of times teams won the match*/
select winner,count(winner) as No_of_times_won
from match_summary
group by winner
order by No_of_times_won desc;

/* 3. Which batsman scored the highest run and in which match*/
select match_M,Name,runs
from bating_summary
order by runs desc
limit 1;

/* 4. Which bowler has taken the highest number of wickets and in which match*/
select match_m,name,wickets
from bowling_summary
order by wickets desc
limit 1;

/* 5. Number of players in each playing role category in t20_players_2022*/
select playingRole, count(playingRole) as No_of_players
from t20_players_2022
group by playingRole;

/* 6. List of left hand batsman in bating_summary table*/
select name,p.team, p.battingStyle
from t20_players_2022 p inner join bating_summary b using(name)
where battingstyle = "left hand bat";

/* 7. What is the playingRole of the batsman in bating_summary table*/
select distinct name,p.team,p.playingRole
from t20_players_2022 p inner join bating_summary b using(name);

/* 8. Which bowlers have bowled maiden over in the worldcup and in which match*/
select name,match_M,maiden
from bowling_summary
where maiden >= 1
order by maiden desc;

/* 9. Average run of each players */
select name,round(avg(runs),2) as Average_Runs
from bating_summary
group by name
order by average_runs desc;

/* 10. list of first two batsman who has scored highest runs by playing less number of balls*/
select name, runs,balls
from bating_summary
order by runs desc, balls asc
limit 2;

/* 11. According to each playingRole category total no of sixes hit*/
select p. playingrole,sum(b. 6s) as Total_sixes_hit
from bating_summary b inner join t20_players_2022 p using(name)
group by p.playingRole
order by Total_sixes_hit desc;

/* 12. list of the batsman who have scored runs between 50 and 80 and in which match*/
select match_m,name, runs
from bating_summary
where runs between 50 and 80
order by runs desc;

/* 13. Matches that were played on weekends*/
select team1,team2,winner, Match_Date
from match_summary
where dayname(Match_Date) in ("Saturday", "Sunday");

/* 14. Number of matches played in each ground*/
select ground,count(winner) No_of_matches_played
from match_summary
group by ground
order by  No_of_matches_played desc;

/* 15. List of the bowlers whose economy_rate is less than 5*/
select name, match_M, economy_rate
from bowling_summary
where economy_rate < 5
order by economy_rate asc;

/* 16. List of  batsman whose strike_rate is more than 200*/
select name, match_M, strike_rate 
from bating_summary 
where strike_rate > 200
order by strike_rate desc;

/* 17. Which matches was abandoned and which matches had no result*/
select team1, team2, winner
from match_summary
where winner = "abandoned" or winner= "No result";

/* 18. What is the Average economy_rate of all the bowlers combined*/
select round(avg(economy_rate),3) as Avg_Economy_Rate
from bowling_summary;

/* 19. Rank of the batsmen according to 6s*/
select name, sum(6s) as Total_sixes,
Dense_rank() over (order by sum(6s) desc) as rnk
from bating_summary
group by name;

/* 20. Rank of the bowlers according to the wickets taken*/
select name, sum(wickets) as Total_wickets_taken,
Dense_rank() over (order by sum(wickets) desc) as rnk
from bowling_summary
group by name;









