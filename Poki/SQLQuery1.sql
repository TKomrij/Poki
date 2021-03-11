-- 1. What grades are stored in the database?
SELECT 
	Name
FROM Grade;

-- 2. What emotions may be associated with a poem?
SELECT
	Name
FROM Emotion;

-- 3. How many poems are in the database?
SELECT
	COUNT(Id)
FROM Poem;

-- 4. Sort authors alphabetically by name. What are the names of the top 76 authors?
SELECT
	Name
FROM Author
Where Id <= 76
ORDER BY Name;

-- 5. Starting with the above query, add the grade of each of the authors.
SELECT
	Name,
	GradeId
FROM Author
	Where Id <= 76
	ORDER BY Name;

-- 6. Starting with the above query, add the recorded gender of each of the authors.
SELECT* FROM Author
	Where Id <= 76
	ORDER BY Name;

-- 7. What is the total number of words in all poems in the database?
SELECT
	SUM(WordCount)
FROM Poem;

-- 8. Which poem has the fewest characters?
SELECT TOP 1 *
	FROM Poem
ORDER BY CharCount ASC;

-- 9. How many authors are in the third grade?
Select 
	COUNT(Author.Id) AS NumberOfAuthors, Grade.Name
FROM Author
	LEFT JOIN Grade ON Author.GradeId = Grade.Id
GROUP BY Grade.Name
HAVING Grade.Name = '3rd Grade';


-- 10. How many authors are in the first, second or third grades?
SELECT
	COUNT(Author.Id) AS NumberOfAuthors, Grade.Name
FROM Author
	LEFT JOIN Grade ON Author.GradeId = Grade.Id
GROUP BY Grade.Name
HAVING Grade.Name = '1st Grade'
	OR Grade.Name = '2nd Grade'
	OR Grade.Name = '3rd Grade';

-- 11. What is the total number of poems written by fourth graders?
SELECT
	COUNT(Poem.Id) As PoemsByFourthGraders, Author.GradeId
FROM Poem
	Left Join Author ON Poem.AuthorId = Author.GradeId
GROUP BY Author.GradeId
HAVING Author.GradeId = 4;

-- 12. How many poems are there per grade?
SELECT
	COUNT(Poem.Id) As NumberOfPoemsInEachGrade, Author.GradeId AS Grades
FROM Poem
	Left Join Author ON Poem.AuthorId = Author.GradeId
GROUP BY Author.GradeId
HAVING Author.GradeId = 1
	OR Author.GradeId = 2
	OR Author.GradeId = 3
	OR Author.GradeId = 4
	OR Author.GradeId = 5;

-- 13. How many authors are in each grade? (Order your results by grade starting with 1st Grade)
SELECT
	COUNT(Author.Id) As NumberOfAuthorsInEachGrade, Author.GradeId AS Grades
FROM Author
GROUP BY Author.GradeId
HAVING Author.GradeId = 1
	OR Author.GradeId = 2
	OR Author.GradeId = 3
	OR Author.GradeId = 4
	OR Author.GradeId = 5;

