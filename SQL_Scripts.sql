SELECT * 
FROM new_schema.Covid_Deaths
Where continent is not null
order by 3,4;

-- Select Data that we are going to be using
SELECT Location, date, total_cases, new_cases, total_deaths, population
FROM new_schema.Covid_Deaths
order by 1,2;

-- Looking at Total Cases vs Total Deaths
-- Show likelihood of dying if you contract covid in your country
SELECT Location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as Deaths_Percentage
FROM new_schema.Covid_Deaths
Where Location like 'Mexico'
order by 1,2;

-- Looking at Total Cases Vs Population
-- Shows what percentage of population got covid
SELECT Location, date, total_cases, Population, (total_cases/population)*100 as Population_Percentage
FROM new_schema.Covid_Deaths
Where Location like 'Mexico'
order by 1,2;

-- Loking at Country with highest infeccion rate 
SELECT Location, Population, MAX(total_cases) as HighestInfeccionCount, (MAX(total_cases)/population)*100 as PopulationPercentageInfected
FROM new_schema.Covid_Deaths
Group by Location, Population
order by PopulationPercentageInfected desc;

-- Showing Countries with Highest Death Count per population
SELECT Location, MAX(cast(total_deaths as unsigned)) as TotalDeathCount
FROM new_schema.Covid_Deaths
Where continent is not null
Group by Location
order by TotalDeathCount desc;


-- Showing continent with the highest death death count per population
SELECT continent, MAX(cast(total_deaths as unsigned)) as TotalDeathCount
FROM new_schema.Covid_Deaths
Where continent is not null
Group by continent
order by TotalDeathCount desc;

-- Global numbers
SELECT SUM(new_cases) as total_cases, SUM(cast(new_deaths as unsigned)) as total_deaths,  SUM(cast(new_deaths as unsigned))/SUM(new_cases) * 100 as Death_Percentage
FROM new_schema.Covid_Deaths
Where continent is not null
-- group by date
order by 1,2;