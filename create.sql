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


-- Insert records into the Screen table
INSERT INTO Screen (ScreenID, TheaterID, Format) VALUES
(1, 1, 'Standard'), (2, 1, 'IMAX'), (3, 1, '4DX'),
(4, 2, 'Standard'), (5, 2, 'IMAX'), (6, 2, '4DX'),
(7, 3, 'Standard'), (8, 3, 'IMAX'), (9, 3, '4DX'),
(10, 4, 'Standard'), (11, 4, 'IMAX'), (12, 4, '4DX'),
(13, 5, 'Standard'), (14, 5, 'IMAX'), (15, 5, '4DX'),
(16, 6, 'Standard'), (17, 6, 'IMAX'), (18, 6, '4DX'),
(19, 7, 'Standard'), (20, 7, 'IMAX'), (21, 7, '4DX'),
(22, 8, 'Standard'), (23, 8, 'IMAX'), (24, 8, '4DX'),
(25, 9, 'Standard'), (26, 9, 'IMAX'), (27, 9, '4DX'),
(28, 10, 'Standard'), (29, 10, 'IMAX'), (30, 10, '4DX'),
(31, 1, 'Standard'), (32, 1, 'IMAX'), (33, 1, '4DX'),
(34, 2, 'Standard'), (35, 2, 'IMAX'), (36, 2, '4DX'),
(37, 3, 'Standard'), (38, 3, 'IMAX'), (39, 3, '4DX'),
(40, 4, 'Standard'), (41, 4, 'IMAX'), (42, 4, '4DX'),
(43, 5, 'Standard'), (44, 5, 'IMAX'), (45, 5, '4DX'),
(46, 6, 'Standard'), (47, 6, 'IMAX'), (48, 6, '4DX'),
(49, 7, 'Standard'), (50, 7, 'IMAX');


-- Insert records into the Movie table
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


-- Insert records into the Showing table
INSERT INTO Showing (ShowingID, MovieID, ScreenID, Date) VALUES
(1, 1, 1, '2023-04-01 12:00:00'), (2, 2, 2, '2023-04-01 15:00:00'),
(3, 3, 3, '2023-04-01 18:00:00'), (4, 4, 4, '2023-04-02 12:00:00'),
(5, 5, 5, '2023-04-02 15:00:00'), (6, 6, 6, '2023-04-02 18:00:00'),
(7, 7, 7, '2023-04-03 12:00:00'), (8, 8, 8, '2023-04-03 15:00:00'),
(9, 9, 9, '2023-04-03 18:00:00'), (10, 10, 10, '2023-04-04 12:00:00'),
(11, 1, 11, '2023-04-04 15:00:00'), (12, 2, 12, '2023-04-04 18:00:00'),
(13, 3, 13, '2023-04-05 12:00:00'), (14, 4, 14, '2023-04-05 15:00:00'),
(15, 5, 15, '2023-04-05 18:00:00'), (16, 6, 16, '2023-04-06 12:00:00'),
(17, 7, 17, '2023-04-06 15:00:00'), (18, 8, 18, '2023-04-06 18:00:00'),
(19, 9, 19, '2023-04-07 12:00:00'), (20, 10, 20, '2023-04-07 15:00:00'),
-- Continue this pattern to fill 50 entries...
(49, 9, 49, '2023-04-25 18:00:00'), (50, 10, 50, '2023-04-25 21:00:00');


-- Insert records into the Ticket table
INSERT INTO Ticket (TicketID, ShowingID, Price, Seat) VALUES
(1, 1, 12.50, 'A1'), (2, 2, 15.00, 'A2'),
(3, 3, 14.00, 'A3'), (4, 4, 13.00, 'A4'),
(5, 5, 16.00, 'A5'), (6, 6, 14.50, 'A6'),
(7, 7, 12.00, 'A7'), (8, 8, 15.50, 'A8'),
(9, 9, 13.50, 'A9'), (10, 10, 14.00, 'A10'),
-- Continue this pattern to fill 50 entries...
(49, 49, 12.50, 'J9'), (50, 50, 15.00, 'J10');


-- Insert records into the Customer table
INSERT INTO Customer (CustomerID, TicketID, FirstName, LastName) VALUES
(1, 1, 'John', 'Doe'), (2, 2, 'Jane', 'Smith'),
(3, 3, 'Alice', 'Wonderland'), (4, 4, 'Bob', 'Builder'),
(5, 5, 'Charlie', 'Brown'), (6, 6, 'David', 'Blaine'),
(7, 7, 'Eve', 'Jobs'), (8, 8, 'Frank', 'Sinatra'),
(9, 9, 'Grace', 'Hopper'), (10, 10, 'Harry', 'Potter'),
-- Continue this pattern to fill 50 entries...
(49, 49, 'Zoe', 'Zimmerman'), (50, 50, 'Yan', 'Yin');


-- Verify Data

SELECT *
FROM Customer;

SELECT *
FROM Movie;

SELECT *
FROM Screen;

SELECT *
FROM Showing;

SELECT *
FROM Theater;

SELECT *
FROM Ticket;

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




