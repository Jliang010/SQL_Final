-- Create tables here
--hi
--:D
-- :P

CREATE table Theater (
TheaterID INT NOT NULL PRIMARY KEY,
TheaterName varchar(60),
City varchar(60)
);

CREATE TABLE Screen (
    ScreenID INT PRIMARY KEY,
    TheaterID INT,
    Format VARCHAR(8),
    FOREIGN KEY (TheaterID) REFERENCES Theater(TheaterID),
    CONSTRAINT chk_Format CHECK (Format in ('Standard', 'IMAX', '4DX'))
);

CREATE TABLE Movie (
  MovieID 	INT NOT NULL PRIMARY KEY,
  Title		VARCHAR(60) NOT NULL,
  Rating 	VARCHAR(4),
  CONSTRAINT chk_Rating CHECK (Rating in ('PG', 'PG13', 'R'))
);

CREATE TABLE Showing (
    ShowingID INT NOT NULL, 
    MovieID INT NOT NULL, 
    ScreenID INT NOT NULL, 
    Date DATETIME,
CONSTRAINT PK_Presentation PRIMARY KEY (ShowingID),
CONSTRAINT FK_MovieID FOREIGN KEY(MovieID) REFERENCES Movie (MovieID),
CONSTRAINT FK_ScreenID FOREIGN KEY(ScreenID) REFERENCES Screen (ScreenID) 
);

CREATE TABLE Ticket(
TicketID INT NOT NULL AUTO_INCREMENT, 
ShowingID INT NOT NULL,
Price DECIMAL(5,2),
Seat VARCHAR(3),
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
