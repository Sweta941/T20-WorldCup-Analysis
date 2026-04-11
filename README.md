# 🏏 T20 World Cup 2022 — SQL Analysis

![SQL](https://img.shields.io/badge/SQL-MySQL-blue?style=flat-square&logo=mysql)
![Status](https://img.shields.io/badge/Status-Complete-brightgreen?style=flat-square)
![Topic](https://img.shields.io/badge/Topic-Cricket%20Analytics-orange?style=flat-square)

A comprehensive SQL-based data analysis project on the **ICC T20 World Cup 2022**, covering batting performance, bowling statistics, match outcomes, and player profiles.

---

## 📁 Project Structure

```
T20_WorldCup_2022/
│
├── T20_WorldCup_Analysis.sql   # Main SQL script with all queries
├── README.md                   # Project documentation
└── data/
    ├── bating_summary          # Ball-by-ball batting records
    ├── bowling_summary         # Bowling figures per match
    ├── match_summary           # Match-level results & metadata
    └── t20_players_2022        # Player profiles & playing roles
```

---

## 🗄️ Database Schema

| Table | Key Columns |
|---|---|
| `bating_summary` | `name`, `match_M`, `runs`, `balls`, `strike_rate`, `4s`, `6s` |
| `bowling_summary` | `name`, `match_m`, `wickets`, `economy_rate`, `maiden` |
| `match_summary` | `team1`, `team2`, `winner`, `ground`, `matchDate`, `Match_Date` |
| `t20_players_2022` | `name`, `team`, `playingRole`, `battingStyle` |

---

## ⚙️ Setup & Usage

### Prerequisites
- MySQL 8.0+
- Any SQL client (MySQL Workbench, DBeaver, DataGrip, etc.)

### Steps

```sql
-- 1. Create and select the database
CREATE DATABASE T20_WorldCup_2022;
USE T20_WorldCup_2022;

-- 2. Import your data tables (CSV or dump file)

-- 3. Run the analysis script
SOURCE T20_WorldCup_Analysis.sql;
```

---

## 📊 Analysis Queries (20 Total)

### 🧑‍🤝‍🧑 Team & Player Profiles
| # | Query |
|---|---|
| 1 | Number of players in each team |
| 5 | Player count by playing role category |
| 6 | List of all left-hand batsmen |
| 7 | Playing roles of all batsmen |

### 🏏 Batting Analysis
| # | Query |
|---|---|
| 3 | Highest individual score & match |
| 9 | Average runs per player |
| 10 | Top 2 batsmen: most runs in fewest balls |
| 11 | Total sixes hit by playing role |
| 12 | Batsmen who scored between 50–80 runs |
| 16 | Batsmen with strike rate > 200 |
| 19 | Batsmen ranked by total sixes (Dense Rank) |

### 🎳 Bowling Analysis
| # | Query |
|---|---|
| 4 | Highest wicket-taker & match |
| 8 | Bowlers who bowled maiden overs |
| 15 | Bowlers with economy rate < 5 |
| 18 | Average economy rate across all bowlers |
| 20 | Bowlers ranked by total wickets (Dense Rank) |

### 🏟️ Match Insights
| # | Query |
|---|---|
| 2 | Teams ranked by number of wins |
| 13 | Matches played on weekends |
| 14 | Matches played per ground |
| 17 | Abandoned matches and no-result games |

---

## 🔑 Key SQL Concepts Used

- `ALTER TABLE` — column renaming and schema modifications
- `STR_TO_DATE()` — date format parsing and transformation
- `INNER JOIN` — combining player profiles with performance tables
- `GROUP BY` + aggregate functions (`COUNT`, `SUM`, `AVG`, `ROUND`)
- `ORDER BY`, `LIMIT` — sorting and filtering top results
- `BETWEEN`, `WHERE`, `DAYNAME()` — conditional and date-based filtering
- `DENSE_RANK() OVER()` — window functions for ranking

---

## 💡 Sample Insights

```sql
-- Top scorer in a single match
SELECT match_M, Name, runs FROM bating_summary ORDER BY runs DESC LIMIT 1;

-- Most economical bowlers (economy < 5)
SELECT name, match_M, economy_rate FROM bowling_summary WHERE economy_rate < 5;

-- Weekend matches only
SELECT team1, team2, winner, Match_Date
FROM match_summary
WHERE DAYNAME(Match_Date) IN ('Saturday', 'Sunday');
```

---

## 📌 Notes

- The `bating_summary` table retains the original spelling (`bating`) as present in the source data.
- `SQL_SAFE_UPDATES` is temporarily disabled for the date migration update; re-enable after running.
- All ranking queries use `DENSE_RANK()` to handle tied values correctly.

---

## 🙌 Acknowledgements

- Data sourced from publicly available T20 World Cup 2022 records.
- Analysis designed for SQL learning and sports analytics practice.

---
## 👤 Author

**[Sweta Mehta]**  
 
