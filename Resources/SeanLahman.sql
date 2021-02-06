-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/NTnH3C
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "hof" (
    "playerID" varchar   NOT NULL,
    "yearID" integer   NOT NULL,
    "votedBy" varchar   NOT NULL,
    "ballots" integer   NOT NULL,
    "needed" integer   NOT NULL,
    "votes" integer   NOT NULL,
    "inducted" boolean   NOT NULL,
    "category" varchar   NOT NULL,
    "needed_note" varchar   NOT NULL,
    CONSTRAINT "pk_hof" PRIMARY KEY (
        "playerID"
     )
);

CREATE TABLE "people" (
    "playerID" varchar   NOT NULL,
    "birthYear" integer   NOT NULL,
    "birthMonth" integer   NOT NULL,
    "birthDay" integer   NOT NULL,
    "birthCountry" varchar   NOT NULL,
    "birthState" varchar   NOT NULL,
    "birthCity" varchar   NOT NULL,
    "deathYear" integer   NOT NULL,
    "deathMonth" integer   NOT NULL,
    "deathDay" integer   NOT NULL,
    "deathCountry" varchar   NOT NULL,
    "deathState" varchar   NOT NULL,
    "deathCity" varchar   NOT NULL,
    "nameFirst" varchar   NOT NULL,
    "nameLast" varchar   NOT NULL,
    "nameGiven" varchar   NOT NULL,
    "weight" integer   NOT NULL,
    "height" integer   NOT NULL,
    "bats" varchar(1)   NOT NULL,
    "throws" varchar(1)   NOT NULL,
    "debut" date   NOT NULL,
    "finalGame" date   NOT NULL,
    "retroID" varchar   NOT NULL,
    "bbrefID" varchar   NOT NULL,
    CONSTRAINT "pk_people" PRIMARY KEY (
        "playerID"
     )
);

CREATE TABLE "awards" (
    "playerID" varchar   NOT NULL,
    "awardID" varhar   NOT NULL,
    "lgID" varchar   NOT NULL,
    "tie" varchar   NOT NULL,
    "notes" varchar   NOT NULL
);

CREATE TABLE "player_college" (
    "playerID" varchar   NOT NULL,
    "schoolID" varchar   NOT NULL,
    "yearID" integer   NOT NULL
);

CREATE TABLE "colleges" (
    "schoolID" varchar   NOT NULL,
    "name_full" varchar   NOT NULL,
    "city" varchar   NOT NULL,
    "state" varchar   NOT NULL,
    "country" varchar   NOT NULL
);

CREATE TABLE "pitching" (
    "playerID" varchar   NOT NULL,
    "yearID" integer   NOT NULL,
    "stint" integer   NOT NULL,
    "teamID" varchar   NOT NULL,
    "lgID" varchar   NOT NULL,
    "W" integer   NOT NULL,
    "L" integer   NOT NULL,
    "G" integer   NOT NULL,
    "GS" integer   NOT NULL,
    "CG" integer   NOT NULL,
    "SHO" integer   NOT NULL,
    "SV" integer   NOT NULL,
    "IPouts" integer   NOT NULL,
    "H" integer   NOT NULL,
    "ER" integer   NOT NULL,
    "HR" integer   NOT NULL,
    "BB" integer   NOT NULL,
    "SO" integer   NOT NULL,
    "BAOpp" integer   NOT NULL,
    "ERA" integer   NOT NULL,
    "IBB" integer   NOT NULL,
    "WP" integer   NOT NULL,
    "HBP" integer   NOT NULL,
    "BK" integer   NOT NULL,
    "BFP" integer   NOT NULL,
    "GF" integer   NOT NULL,
    "R" integer   NOT NULL,
    "SH" integer   NOT NULL,
    "SF" integer   NOT NULL,
    "GIDP" integer   NOT NULL
);

CREATE TABLE "batting" (
    "playerID" varchar   NOT NULL,
    "yearID" integer   NOT NULL,
    "stint" integer   NOT NULL,
    "teamID" varchar   NOT NULL,
    "lgID" varchar   NOT NULL,
    "G" integer   NOT NULL,
    "AB" integer   NOT NULL,
    "R" integer   NOT NULL,
    "H" integer   NOT NULL,
    "2B" integer   NOT NULL,
    "3B" integer   NOT NULL,
    "HR" integer   NOT NULL,
    "RBI" integer   NOT NULL,
    "SB" integer   NOT NULL,
    "CS" integer   NOT NULL,
    "BB" integer   NOT NULL,
    "SO" integer   NOT NULL,
    "IBB" integer   NOT NULL,
    "HBP" integer   NOT NULL,
    "SH" integer   NOT NULL,
    "SF" integer   NOT NULL,
    "GIDP" integer   NOT NULL
);

ALTER TABLE "people" ADD CONSTRAINT "fk_people_playerID" FOREIGN KEY("playerID")
REFERENCES "hof" ("playerID");

ALTER TABLE "awards" ADD CONSTRAINT "fk_awards_playerID" FOREIGN KEY("playerID")
REFERENCES "people" ("playerID");

ALTER TABLE "player_college" ADD CONSTRAINT "fk_player_college_playerID" FOREIGN KEY("playerID")
REFERENCES "people" ("playerID");

ALTER TABLE "player_college" ADD CONSTRAINT "fk_player_college_schoolID" FOREIGN KEY("schoolID")
REFERENCES "colleges" ("schoolID");

ALTER TABLE "pitching" ADD CONSTRAINT "fk_pitching_playerID" FOREIGN KEY("playerID")
REFERENCES "people" ("playerID");

ALTER TABLE "batting" ADD CONSTRAINT "fk_batting_playerID" FOREIGN KEY("playerID")
REFERENCES "people" ("playerID");

