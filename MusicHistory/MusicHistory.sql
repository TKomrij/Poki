-- 1. Query all of the entries in the Genre table
SELECT
  Label
FROM Genre;


-- 2. Query all the entries in the Artist table and order by the artist's name. HINT: use the ORDER BY keywords
SELECT
  ArtistName
FROM Artist
ORDER BY ArtistName;


-- 3. Write a SELECT query that lists all the songs in the Song table and include the Artist name
SELECT s.Title,
       a.ArtistName
FROM Song s
       LEFT JOIN Artist a on s.ArtistId = a.id;


-- 4. Write a SELECT query that lists all the Artists that have a Pop Album
SELECT
    g.Id,
    a.ArtistName
FROM Genre g
LEFT JOIN Artist a on g.Id = a.Id
WHERE g.Id = 7;


-- 5. Write a SELECT query that lists all the Artists that have a Jazz or Rock Album
SELECT
    g.Id,
    a.ArtistName
FROM Genre g
LEFT JOIN Artist a on g.Id = a.id
WHERE g.Id = 4 OR g.Id = 2;


-- 6. Write a SELECT statement that lists the Albums with no songs
SELECT DISTINCT
  al.Id,
  al.Title
FROM Album al
LEFT JOIN Song s ON al.Id = s.AlbumId
Where AlbumId IS NULL
ORDER BY Title;


-- 7. Using the INSERT statement, add one of your favorite artists to the Artist table.
INSERT INTO Artist (ArtistName) VALUES ('Michael Jackson');