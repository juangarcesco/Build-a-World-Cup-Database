#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=worldcup --no-align --tuples-only -c"

# Do not change code above this line. Use the PSQL variable above to query your database.

# Total number of goals in all games from winning teams
echo -e "\nTotal number of goals in all games from winning teams:"
echo "$($PSQL "SELECT SUM(winner_goals) FROM games;")"

# Total number of goals in all games from both teams combined
echo -e "\nTotal number of goals in all games from both teams combined:"
echo "$($PSQL "SELECT SUM(winner_goals + opponent_goals) FROM games;")"

# Average number of goals in all games from the winning teams
echo -e "\nAverage number of goals in all games from the winning teams:"
echo "$($PSQL "SELECT AVG(winner_goals) FROM games;")"

# Average number of goals in all games from the winning teams rounded to two decimal places
echo -e "\nAverage number of goals in all games from the winning teams rounded to two decimal places:"
echo "$($PSQL "SELECT ROUND(AVG(winner_goals), 2) FROM games;")"

# Average number of goals in all games from both teams
echo -e "\nAverage number of goals in all games from both teams:"
echo "$($PSQL "SELECT AVG(winner_goals + opponent_goals) FROM games;")"

# Most goals scored in a single game by one team
echo -e "\nMost goals scored in a single game by one team:"
echo "$($PSQL "SELECT MAX(GREATEST(winner_goals, opponent_goals)) FROM games;")"

# Number of games where the winning team scored more than two goals
echo -e "\nNumber of games where the winning team scored more than two goals:"
echo "$($PSQL "SELECT COUNT(*) FROM games WHERE winner_goals > 2;")"

# Winner of the 2018 tournament team name
echo -e "\nWinner of the 2018 tournament team name:"
echo "$($PSQL "SELECT teams.name FROM games FULL JOIN teams ON games.winner_id = teams.team_id WHERE games.year = 2018 AND games.round = 'Final'")"

# List of teams who played in the 2014 'Eighth-Final' round
echo -e "\nList of teams who played in the 2014 'Eighth-Final' round:"
echo "$($PSQL "SELECT DISTINCT(teams.name) FROM games FULL JOIN teams ON games.winner_id = teams.team_id OR games.opponent_id = teams.team_id WHERE games.year = 2014 AND games.round = 'Eighth-Final'")"

# List of unique winning team names in the whole data set
echo -e "\nList of unique winning team names in the whole data set:"
echo "$($PSQL "SELECT DISTINCT((SELECT name FROM teams WHERE team_id=games.winner_id)) as winner FROM games")"

# Year and team name of all the champions
echo -e "\nYear and team name of all the champions:"
echo "$($PSQL "SELECT games.year, teams.name FROM games LEFT JOIN teams ON games.winner_id = teams.team_id WHERE games.round='Final' ORDER BY games.year")"

# Year and team name of all the champions
echo -e "\nList of teams that start with 'Co':"
echo "$($PSQL "SELECT name FROM teams WHERE name LIKE 'Co%'")"




