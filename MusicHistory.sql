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
INSERT INTO Artist(ArtistName, YearEstablished) VALUES ('Michael Jackson', 1982);


-- 8. Using the INSERT statement, add one, or more, albums by your artist to the Album table.


-- 9. Using the INSERT statement, add some songs that are on that album to the Song table.


-- 10. Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added.
SELECT s.Title AS SongTitle, al.Title AS AlbumTitle, ar.ArtistName
    FROM Song s
         JOIN Album al ON s.AlbumId = al.Id
         JOIN Artist ar ON s.ArtistId = ar.Id
    WHERE s.Title = 'TV Party'
          OR s.Title = 'Thug'
          OR ar.ArtistName = 'Beatles'


-- 11. Write a SELECT statement to display how many songs exist for each album. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT count(s.Id) AS SongCount, al.Title AS AlbumTitle, ar.ArtistName
    FROM Song s
        LEFT JOIN  Album al ON s.AlbumId = al.Id
        LEFT JOIN Artist ar ON al.ArtistId = ar.Id
        GROUP BY al.Title, ar.ArtistName

-- 12. Write a SELECT statement to display how many songs exist for each artist. You'll need to use the COUNT() function and the GROUP BY keyword sequence.


-- 13. Write a SELECT statement to display how many songs exist for each genre. You'll need to use the COUNT() function and the GROUP BY keyword sequence.


-- 14. Write a SELECT query that lists the Artists that have put out records on more than one record label. Hint: When using GROUP BY instead of using a WHERE clause, use the HAVING keyword
SELECT *
    FROM Artist ar JOIN Album al ON ar.Id = al.ArtistId

SELECT count(distinct al.Label), ar.ArtistName
    FROM Artist ar JOIN Album al ON ar.Id = al.ArtistId
    GROUP BY ar.ArtistName
        HAVING count(distinct al.Label) > 1


-- 15. Using MAX() function, write a select statement to find the album with the longest duration. The result should display the album title and the duration.


-- 16. Using MAX() function, write a select statement to find the song with the longest duration. The result should display the song title and the duration.
SELECT s.Title, s.SongLength
    FROM Song s
    WHERE s.SongLength = (
        SELECT max(s.SongLength)
        FROM song s
    );

SELECT top 1 s.Title, s.SongLength
    FROM Song s
    ORDER BY s.SongLength desc;


-- 17. Modify the previous query to also display the title of the album.
