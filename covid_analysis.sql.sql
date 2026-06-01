-- Select Data that we are going to be starting with

Select Location, date, total_cases, new_cases, total_deaths, population
From CovidDeaths
Where continent is not null 
order by 1,2


-- Total Cases vs Total Deaths
-- Shows likelihood of dying if you contract covid in your country

Select Location, date, total_cases,total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
From CovidDeaths
Where location like '%india%'
and continent is not null 
order by 1,2


-- Total Cases vs Population
-- Shows what percentage of population infected with Covid

Select Location, date, Population, total_cases,  
       (total_cases / NULLIF(population, 0)) * 100 as PercentPopulationInfected
From CovidDeaths
Where location like '%india%'
order by 1,2

-- Countries with Highest Infection Rate compared to Population

Select Location, Population,
       MAX(total_cases) as HighestInfectionCount,
       MAX(total_cases) * 100.0 / NULLIF(Population,0) as PercentPopulationInfected
From CovidDeaths
Group by Location, Population
order by PercentPopulationInfected desc


-- Countries with Highest Death Count per Population

SELECT Location, 
       MAX(CAST(NULLIF(TRIM(Total_deaths), '') AS UNSIGNED)) AS TotalDeathCount
FROM CovidDeaths
WHERE continent IS NOT NULL
GROUP BY Location
ORDER BY TotalDeathCount DESC


-- BREAKING THINGS DOWN BY CONTINENT
-- Showing contintents with the highest death count per population

SELECT continent, 
       MAX(CAST(NULLIF(TRIM(Total_deaths), '') AS UNSIGNED)) AS TotalDeathCount
FROM CovidDeaths
WHERE continent IS NOT NULL
  AND TRIM(continent) <> ''
GROUP BY continent
ORDER BY TotalDeathCount DESC;


-- GLOBAL NUMBERS

SELECT 
    SUM(CAST(NULLIF(TRIM(new_cases), '') AS UNSIGNED)) AS total_cases,
    SUM(CAST(NULLIF(TRIM(new_deaths), '') AS UNSIGNED)) AS total_deaths,
    (SUM(CAST(NULLIF(TRIM(new_deaths), '') AS UNSIGNED)) * 100.0 /
     NULLIF(SUM(CAST(NULLIF(TRIM(new_cases), '') AS UNSIGNED)), 0)
    ) AS death_percentage
FROM CovidDeaths
WHERE continent IS NOT NULL



-- Total Population vs Vaccinations
-- Shows Percentage of Population that has recieved at least one Covid Vaccine

SELECT 
    dea.continent,
    dea.location,
    dea.date,
    dea.population,
    vac.new_vaccinations,
    SUM(CAST(NULLIF(TRIM(vac.new_vaccinations), '') AS UNSIGNED))
        OVER (
            PARTITION BY dea.location 
            ORDER BY dea.location, dea.date
        ) AS RollingPeopleVaccinated
FROM CovidDeaths dea
JOIN CovidVaccinations vac
    ON dea.location = vac.location
    AND dea.date = vac.date
WHERE dea.continent IS NOT NULL
ORDER BY dea.location, dea.date


-- Using CTE to perform Calculation on Partition By in previous query

WITH PopvsVac AS (
    SELECT 
        dea.continent,
        dea.location,
        dea.date,
        dea.population,
        vac.new_vaccinations,
        SUM(
            CAST(NULLIF(TRIM(vac.new_vaccinations), '') AS UNSIGNED)
        ) OVER (
            PARTITION BY dea.location 
            ORDER BY dea.location, dea.date
        ) AS RollingPeopleVaccinated
    FROM CovidDeaths dea
    JOIN CovidVaccinations vac
        ON dea.location = vac.location
        AND dea.date = vac.date
    WHERE dea.continent IS NOT NULL
)

SELECT 
    *,
    (RollingPeopleVaccinated * 100.0 / Population) AS PercentVaccinated
FROM PopvsVac;



-- Using Temp Table to perform Calculation on Partition By in previous query

DROP TEMPORARY TABLE IF EXISTS PercentPopulationVaccinated

CREATE TEMPORARY TABLE PercentPopulationVaccinated (
    Continent VARCHAR(255),
    Location VARCHAR(255),
    `Date` DATE,
    Population DOUBLE,
    New_vaccinations DOUBLE,
    RollingPeopleVaccinated DOUBLE
)

INSERT INTO PercentPopulationVaccinated (
    Continent,
    Location,
    `Date`,
    Population,
    New_vaccinations,
    RollingPeopleVaccinated
)
SELECT 
    dea.continent,
    dea.location,
    STR_TO_DATE(dea.date, '%d-%m-%Y'),
    CAST(dea.population AS DOUBLE),
    CAST(NULLIF(TRIM(vac.new_vaccinations), '') AS DOUBLE),
    0
FROM CovidDeaths dea
JOIN CovidVaccinations vac
    ON dea.location = vac.location
    AND dea.date = vac.date
-- WHERE dea.continent IS NOT NULL
SELECT *,
       (RollingPeopleVaccinated * 100.0 / Population) AS PercentVaccinated
FROM PercentPopulationVaccinated




-- Creating View to store data for later visualizations

CREATE OR REPLACE VIEW PercentPopulationVaccinated AS
SELECT 
    dea.continent,
    dea.location,
    STR_TO_DATE(dea.date, '%d-%m-%Y') AS date,
    dea.population,
    vac.new_vaccinations,
    SUM(
        CAST(NULLIF(TRIM(vac.new_vaccinations), '') AS UNSIGNED)
    ) OVER (
        PARTITION BY dea.location 
        ORDER BY STR_TO_DATE(dea.date, '%d-%m-%Y')
    ) AS RollingPeopleVaccinated
FROM CovidDeaths dea
JOIN CovidVaccinations vac
    ON dea.location = vac.location
    AND dea.date = vac.date
WHERE dea.continent IS NOT NULL
