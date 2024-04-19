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

