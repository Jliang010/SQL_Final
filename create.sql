-- Create tables here
hi
:D
CREATE table Theater (
TheaterID INT NOT NULL PRIMARY KEY,
TheaterName varchar(60),
City varchar(60)
);

CREATE TABLE Screen (
    ScreenID INT PRIMARY KEY,
    TheaterID INT,
    Format VARCHAR(8),
    FOREIGN KEY (TheaterID) REFERENCES Theater(TheaterID)
);

CREATE TABLE Show
(
    ShowID INT NOT NULL, 
    MovieID INT NOT NULL, 
    ScreenID INT NOT NULL, 
    Date DATETIME
CONSTRAINT PK_Show PRIMARY KEY (ShowID),
CONSTRAINT FK_MovieID FOREIGN KEY(MovieID) REFERENCES Movie (MovieID)
CONSTRAINT FK_ScreenID FOREIGN KEY(ScreenID) REFERENCES Screen (ScreenID) 
);

CREATE TABLE Customer
(
CustomerID INT NOT NULL PRIMARY KEY,
TicketID INT NOT NULL,
FirstName VARCHAR(60) NOT NULL,
LastName VARCHAR(60) NOT NULL,

FOREIGN KEY(TicketID) REFERENCES Ticket(TicketID)

);
