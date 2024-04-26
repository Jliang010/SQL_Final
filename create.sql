-- Create tables here
--hi
--:D
-- :P

SET FOREIGN_KEY_CHECKS=0;

CREATE table Theater (
TheaterID INT NOT NULL PRIMARY KEY,
TheaterName varchar(60) NOT NULL,
City varchar(60)
);

CREATE TABLE Screen (
    ScreenID INT PRIMARY KEY,
    TheaterID INT NOT NULL,
    Format VARCHAR(8),
    FOREIGN KEY (TheaterID) REFERENCES Theater(TheaterID),
    CONSTRAINT chk_Format CHECK (Format in ('Standard', 'IMAX', '4DX'))
);

CREATE TABLE Movie (
  MovieID 	INT NOT NULL PRIMARY KEY,
  Title		VARCHAR(60) NOT NULL,
  Rating 	VARCHAR(4) NOT NULL,
  CONSTRAINT chk_Rating CHECK (Rating in ('PG', 'PG13', 'R'))
);

CREATE TABLE Showing (
    ShowingID INT NOT NULL, 
    MovieID INT NOT NULL, 
    ScreenID INT NOT NULL, 
    Date DATETIME NOT NULL,
CONSTRAINT PK_Presentation PRIMARY KEY (ShowingID),
CONSTRAINT FK_MovieID FOREIGN KEY(MovieID) REFERENCES Movie (MovieID),
CONSTRAINT FK_ScreenID FOREIGN KEY(ScreenID) REFERENCES Screen (ScreenID) 
);

CREATE TABLE Ticket(
TicketID INT NOT NULL, 
ShowingID INT NOT NULL,
Price DECIMAL(5,2) NOT NULL,
Seat VARCHAR(3) NOT NULL,
CONSTRAINT PK_Ticket PRIMARY KEY (TicketID),
CONSTRAINT FK_TicketShowingID FOREIGN KEY (ShowingID) REFERENCES Showing (ShowingID)
);

CREATE TABLE Customer
(
CustomerID INT NOT NULL PRIMARY KEY,
TicketID INT NOT NULL,
FirstName VARCHAR(60) NOT NULL,
LastName VARCHAR(60) NOT NULL,

FOREIGN KEY(TicketID) REFERENCES Ticket(TicketID)

);

SET FOREIGN_KEY_CHECKS=1;


-- Dummy data here
-- Inserting data into the Theater table
INSERT INTO Theater (TheaterID, TheaterName, City) VALUES
(1, 'Cineworld Downtown', 'New York'),
(2, 'Regal Cinema', 'Los Angeles'),
(3, 'AMC Empire', 'Chicago'),
(4, 'Cineplex Odeon', 'Houston'),
(5, 'Landmark Theatre', 'Phoenix'),
(6, 'SilverCity Riverport', 'Philadelphia'),
(7, 'Sunset Drive-in', 'San Antonio'),
(8, 'The Picture House', 'San Diego'),
(9, 'Galaxy Cinema', 'Dallas'),
(10, 'Metro Theatre', 'San Jose');

-- Inserting data into the Movie table
INSERT INTO Movie (MovieID, Title, Rating) VALUES
(1, 'The Great Adventure', 'PG'),
(2, 'Space Journey', 'PG13'),
(3, 'Mystery Island', 'R'),
(4, 'Lost World', 'PG'),
(5, 'Haunted Night', 'PG13'),
(6, 'Fantasy Quest', 'R'),
(7, 'Secret Agent', 'PG'),
(8, 'Ocean Deep', 'PG13'),
(9, 'Mountain Climb', 'R'),
(10, 'Desert Run', 'PG');

-- Inserting data into the Screen table
INSERT INTO Screen (ScreenID, TheaterID, Format)
VALUES
(1, 2, 'Standard'),
(2, 5, 'IMAX'),
(3, 8, '4DX'),
(4, 3, 'Standard'),
(5, 7, 'IMAX'),
(6, 1, '4DX'),
(7, 9, 'Standard'),
(8, 6, 'IMAX'),
(9, 10, '4DX'),
(10, 4, 'Standard'),
(11, 2, 'IMAX'),
(12, 5, '4DX'),
(13, 8, 'Standard'),
(14, 3, 'IMAX'),
(15, 7, '4DX'),
(16, 1, 'Standard'),
(17, 9, 'IMAX'),
(18, 6, '4DX'),
(19, 10, 'Standard'),
(20, 4, 'IMAX'),
(21, 2, '4DX'),
(22, 5, 'Standard'),
(23, 8, 'IMAX'),
(24, 3, '4DX'),
(25, 7, 'Standard'),
(26, 9, 'IMAX'),
(27, 6, '4DX'),
(28, 10, 'Standard'),
(29, 4, 'IMAX'),
(30, 2, '4DX'),
(31, 5, 'Standard'),
(32, 8, 'IMAX'),
(33, 3, '4DX'),
(34, 7, 'Standard'),
(35, 9, 'IMAX'),
(36, 6, '4DX'),
(37, 10, 'Standard'),
(38, 4, 'IMAX'),
(39, 2, '4DX'),
(40, 5, 'Standard'),
(41, 8, 'IMAX'),
(42, 3, '4DX'),
(43, 7, 'Standard'),
(44, 9, 'IMAX'),
(45, 6, '4DX'),
(46, 10, 'Standard'),
(47, 4, 'IMAX'),
(48, 2, '4DX'),
(49, 5, 'Standard'),
(50, 8, 'IMAX');


-- Inserting data into the Showing table
INSERT INTO Showing (ShowingID, MovieID, ScreenID, Date)
VALUES
(1, 3, 25, '2023-04-01 12:00:00'),
(2, 10, 10, '2023-04-01 15:00:00'),
(3, 6, 35, '2023-04-01 18:00:00'),
(4, 1, 7, '2023-04-02 12:00:00'),
(5, 9, 21, '2023-04-02 15:00:00'),
(6, 5, 12, '2023-04-02 18:00:00'),
(7, 8, 47, '2023-04-03 12:00:00'),
(8, 2, 27, '2023-04-03 15:00:00'),
(9, 4, 38, '2023-04-03 18:00:00'),
(10, 7, 6, '2023-04-04 12:00:00'),
(11, 3, 17, '2023-04-04 15:00:00'),
(12, 10, 32, '2023-04-04 18:00:00'),
(13, 6, 2, '2023-04-05 12:00:00'),
(14, 1, 11, '2023-04-05 15:00:00'),
(15, 9, 25, '2023-04-05 18:00:00'),
(16, 5, 6, '2023-04-06 12:00:00'),
(17, 8, 31, '2023-04-06 15:00:00'),
(18, 4, 45, '2023-04-06 18:00:00'),
(19, 7, 8, '2023-04-07 12:00:00'),
(20, 3, 41, '2023-04-07 15:00:00'),
(21, 10, 14, '2023-04-07 18:00:00'),
(22, 6, 26, '2023-04-08 12:00:00'),
(23, 1, 2, '2023-04-08 15:00:00'),
(24, 9, 19, '2023-04-08 18:00:00'),
(25, 5, 10, '2023-04-09 12:00:00'),
(26, 8, 27, '2023-04-09 15:00:00'),
(27, 4, 47, '2023-04-09 18:00:00'),
(28, 7, 4, '2023-04-10 12:00:00'),
(29, 3, 21, '2023-04-10 15:00:00'),
(30, 10, 33, '2023-04-10 18:00:00'),
(31, 6, 13, '2023-04-11 12:00:00'),
(32, 1, 26, '2023-04-11 15:00:00'),
(33, 9, 48, '2023-04-11 18:00:00'),
(34, 5, 9, '2023-04-12 12:00:00'),
(35, 8, 30, '2023-04-12 15:00:00'),
(36, 4, 42, '2023-04-12 18:00:00'),
(37, 7, 2, '2023-04-13 12:00:00'),
(38, 3, 15, '2023-04-13 15:00:00'),
(39, 10, 29, '2023-04-13 18:00:00'),
(40, 6, 5, '2023-04-14 12:00:00'),
(41, 1, 20, '2023-04-14 15:00:00'),
(42, 9, 34, '2023-04-14 18:00:00'),
(43, 5, 1, '2023-04-15 12:00:00'),
(44, 8, 18, '2023-04-15 15:00:00'),
(45, 4, 45, '2023-04-15 18:00:00'),
(46, 7, 7, '2023-04-16 12:00:00'),
(47, 3, 23, '2023-04-16 15:00:00'),
(48, 10, 38, '2023-04-16 18:00:00'),
(49, 6, 14, '2023-04-17 12:00:00'),
(50, 1, 27, '2023-04-17 15:00:00');


-- Inserting data into the Ticket table 
INSERT INTO Ticket (TicketID, ShowingID, Price, Seat)
VALUES
(1, 25, 12.50, 'A1'),
(2, 10, 15.00, 'A2'),
(3, 45, 14.00, 'A3'),
(4, 7, 13.00, 'A4'),
(5, 31, 16.00, 'A5'),
(6, 12, 14.50, 'A6'),
(7, 48, 12.00, 'A7'),
(8, 25, 15.50, 'A8'),
(9, 6, 13.50, 'A9'),
(10, 40, 14.00, 'A10'),
(11, 3, 12.50, 'B1'),
(12, 21, 15.00, 'B2'),
(13, 9, 14.00, 'B3'),
(14, 17, 13.00, 'B4'),
(15, 26, 16.00, 'B5'),
(16, 13, 14.50, 'B6'),
(17, 48, 12.00, 'B7'),
(18, 31, 15.50, 'B8'),
(19, 2, 13.50, 'B9'),
(20, 6, 14.00, 'B10'),
(21, 19, 12.50, 'C1'),
(22, 8, 15.00, 'C2'),
(23, 40, 14.00, 'C3'),
(24, 14, 13.00, 'C4'),
(25, 25, 16.00, 'C5'),
(26, 33, 14.50, 'C6'),
(27, 50, 12.00, 'C7'),
(28, 1, 15.50, 'C8'),
(29, 30, 13.50, 'C9'),
(30, 49, 14.00, 'C10'),
(31, 7, 12.50, 'D1'),
(32, 18, 15.00, 'D2'),
(33, 5, 14.00, 'D3'),
(34, 26, 13.00, 'D4'),
(35, 37, 16.00, 'D5'),
(36, 47, 14.50, 'D6'),
(37, 21, 12.00, 'D7'),
(38, 34, 15.50, 'D8'),
(39, 9, 13.50, 'D9'),
(40, 15, 14.00, 'D10'),
(41, 11, 12.50, 'E1'),
(42, 38, 15.00, 'E2'),
(43, 3, 14.00, 'E3'),
(44, 26, 13.00, 'E4'),
(45, 19, 16.00, 'E5'),
(46, 10, 14.50, 'E6'),
(47, 32, 12.00, 'E7'),
(48, 23, 15.50, 'E8'),
(49, 47, 13.50, 'E9'),
(50, 4, 14.00, 'E10');


-- Inserting data into the Customer table
INSERT INTO Customer (CustomerID, TicketID, FirstName, LastName) VALUES
(1, 1, 'John', 'Doe'), (2, 2, 'Jane', 'Smith'),
(3, 3, 'Alice', 'Wonderland'), (4, 4, 'Bob', 'Builder'),
(5, 5, 'Charlie', 'Brown'), (6, 6, 'David', 'Blaine'),
(7, 7, 'Eve', 'Jobs'), (8, 8, 'Frank', 'Sinatra'),
(9, 9, 'Grace', 'Hopper'), (10, 10, 'Harry', 'Potter'),
(11, 11, 'Iris', 'West'), (12, 12, 'Jack', 'Sparrow'),
(13, 13, 'Kara', 'Danvers'), (14, 14, 'Liam', 'Neeson'),
(15, 15, 'Mona', 'Lisa'), (16, 16, 'Nina', 'Dobrev'),
(17, 17, 'Oliver', 'Queen'), (18, 18, 'Peter', 'Parker'),
(19, 19, 'Quinn', 'Fabray'), (20, 20, 'Rachel', 'Green'),
(21, 21, 'Stella', 'Gibson'), (22, 22, 'Tom', 'Hardy'),
(23, 23, 'Uma', 'Thurman'), (24, 24, 'Victor', 'Von Doom'),
(25, 25, 'Wendy', 'Darling'), (26, 26, 'Xavier', 'Niel'),
(27, 27, 'Yvonne', 'Strahovski'), (28, 28, 'Zachary', 'Levi'),
(29, 29, 'Amelia', 'Earhart'), (30, 30, 'Bruce', 'Wayne'),
(31, 31, 'Clark', 'Kent'), (32, 32, 'Diana', 'Prince'),
(33, 33, 'Edward', 'Cullen'), (34, 34, 'Fiona', 'Gallagher'),
(35, 35, 'George', 'Bluth'), (36, 36, 'Hannah', 'Montana'),
(37, 37, 'Indiana', 'Jones'), (38, 38, 'Jessica', 'Jones'),
(39, 39, 'Kyle', 'Rayner'), (40, 40, 'Lois', 'Lane'),
(41, 41, 'Mickey', 'Mouse'), (42, 42, 'Nancy', 'Drew'),
(43, 43, 'Oscar', 'Wilde'), (44, 44, 'Pamela', 'Anderson'),
(45, 45, 'Quincy', 'Jones'), (46, 46, 'Roger', 'Rabbit'),
(47, 47, 'Sarah', 'Connor'), (48, 48, 'Tony', 'Stark'),
(49, 49, 'Ulysses', 'Grant'), (50, 50, 'Vince', 'Lombardi');


--Question1: What movies are PG13?
Select *
FROM Movie
WHERE Rating= 'PG13';

--Question2: 
SELECT s.ShowingID, m.Title AS MovieTitle, s.Date, sc.Format
FROM Showing s
INNER JOIN Screen sc ON s.ScreenID = sc.ScreenID
INNER JOIN Theater t ON sc.TheaterID = t.TheaterID
INNER JOIN Movie m ON s.MovieID = m.MovieID
WHERE sc.Format = 'IMAX' AND t.City = 'San Diego';

--Question3: 
SELECT
    Theater.TheaterName,
    SUM(Ticket.Price) AS TotalTicketSales
FROM
    Ticket
INNER JOIN Showing ON Ticket.ShowingID = Showing.ShowingID
INNER JOIN Movie ON Showing.MovieID = Movie.MovieID
INNER JOIN Screen ON Showing.ScreenID = Screen.ScreenID
INNER JOIN Theater ON Screen.TheaterID = Theater.TheaterID
WHERE
    Movie.Title = 'Ocean Deep'
GROUP BY
    Theater.TheaterName;





