USE world;

SELECT 
    *
FROM
    city;

SELECT 
    *
FROM
    country;

SELECT 
    *
FROM
    countrylanguage;

/* 

Wybranie miasta z krótkimi informacjami o kraju do którego należą.

*/ 

SELECT 
    a.CityName,
    b.AbbreviationCode,
    b.CountryName,
    b.Continent,
    b.Region,
    b.SurfaceArea
FROM
    city a
        RIGHT JOIN
    country b ON a.CountryCode = b.AbbreviationCode;
    
/* 

Policz liczbę miast w każdym kraju.

*/     

SELECT 
    a.CountryName, COUNT(b.CountryCode) AS NumberOfCity
FROM
    City b
        JOIN
    Country a ON b.CountryCode = a.AbbreviationCode
GROUP BY a.CountryName;

/* 

Znalezienie 10 najbardziej zaludnionych krajów.

*/ 

SELECT 
    CityName, Population
FROM
    City
ORDER BY Population DESC
LIMIT 10;

/* 

Oblicz średnią długość życia dla każdego kontynentu.

*/ 

SELECT 
    Continent,
    ROUND(AVG(lifeexpectancy), 0) AS AvgLifeExpectancyContinent
FROM
    Country
GROUP BY Continent;

/* 

Znalezienie krajów w których populacja przewyższa 5 milionów.

*/ 

SELECT 
    CountryName, Continent, Population
FROM
    Country
WHERE
    Population > 5000000
ORDER BY Population DESC;

/* 

Znalezienie krajów, które maja powierzchnię większą niż 500 000 i znajdują się w Europie.

*/ 

SELECT 
    CountryName, SurfaceArea
FROM
    country
WHERE
    Continent = 'Europe'
HAVING SurfaceArea > 500000
ORDER BY SurfaceArea DESC;

