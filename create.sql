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
(1, 'Central Theater', 'New York'),
(2, 'Westside Cinema', 'Los Angeles'),
(3, 'East Bay Theater', 'San Francisco'),
(4, 'Downtown Cinema', 'Chicago'),
(5, 'Northend Theater', 'Seattle'),
(6, 'South Park Theater', 'Houston'),
(7, 'Uptown Cinema', 'Boston'),
(8, 'Suburban Cinema', 'Phoenix'),
(9, 'Grand Avenue Theater', 'Dallas'),
(10, 'Broadway Theater', 'Denver'),
(11, 'Pacific Cinema', 'San Diego'),
(12, 'Mountain View Cinema', 'Salt Lake City');

-- Insert records into the Screen table
INSERT INTO Screen (ScreenID, TheaterID, Format) VALUES
(1, 1, 'Standard'),
(2, 1, 'IMAX'),
(3, 2, '4DX'),
(4, 3, 'Standard'),
(5, 3, 'IMAX'),
(6, 4, '4DX'),
(7, 5, 'Standard'),
(8, 6, 'IMAX'),
(9, 7, '4DX'),
(10, 8, 'Standard'),
(11, 9, 'IMAX'),
(12, 10, '4DX');

-- Insert records into the Movie table
INSERT INTO Movie (MovieID, Title, Rating) VALUES
(1, 'The Adventure', 'PG'),
(2, 'Space Wars', 'PG13'),
(3, 'Horror Night', 'R'),
(4, 'The Comedy Club', 'PG'),
(5, 'Romantic Getaway', 'PG13'),
(6, 'Action Unleashed', 'R'),
(7, 'Mystery Quest', 'PG13'),
(8, 'Dream World', 'PG'),
(9, 'Science Fiction', 'PG13'),
(10, 'The Haunted House', 'R'),
(11, 'Fantasy Lands', 'PG'),
(12, 'The Final Showdown', 'PG13');

-- Insert records into the Showing table
INSERT INTO Showing (ShowingID, MovieID, ScreenID, Date) VALUES
(1, 1, 1, '2024-04-25 10:00:00'),
(2, 2, 2, '2024-04-25 12:00:00'),
(3, 3, 3, '2024-04-25 14:00:00'),
(4, 4, 4, '2024-04-25 16:00:00'),
(5, 5, 5, '2024-04-25 18:00:00'),
(6, 6, 6, '2024-04-25 20:00:00'),
(7, 7, 7, '2024-04-25 22:00:00'),
(8, 8, 8, '2024-04-26 10:00:00'),
(9, 9, 9, '2024-04-26 12:00:00'),
(10, 10, 10, '2024-04-26 14:00:00'),
(11, 11, 11, '2024-04-26 16:00:00'),
(12, 12, 12, '2024-04-26 18:00:00');

-- Insert records into the Ticket table
INSERT INTO Ticket (TicketID, ShowingID, Price, Seat) VALUES
(1, 1, 10.00, 'A1'),
(2, 2, 12.00, 'B2'),
(3, 3, 15.00, 'C3'),
(4, 4, 18.00, 'D4'),
(5, 5, 20.00, 'E5'),
(6, 6, 25.00, 'F6'),
(7, 7, 30.00, 'G7'),
(8, 8, 35.00, 'H8'),
(9, 9, 40.00, 'I9'),
(10, 10, 45.00, 'J10'),
(11, 11, 50.00, 'K11'),
(12, 12, 55.00, 'L12');

-- Insert records into the Customer table
INSERT INTO Customer (CustomerID, TicketID, FirstName, LastName) VALUES
(1, 1, 'John', 'Smith'),
(2, 2, 'Mary', 'Johnson'),
(3, 3, 'David', 'Williams'),
(4, 4, 'Jennifer', 'Jones'),
(5, 5, 'Michael', 'Brown'),
(6, 6, 'Jessica', 'Davis'),
(7, 7, 'Matthew', 'Miller'),
(8, 8, 'Emily', 'Wilson'),
(9, 9, 'Ashley', 'Moore'),
(10, 10, 'James', 'Taylor'),
(11, 11, 'Sarah', 'Anderson'),
(12, 12, 'Daniel', 'Thomas');


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
