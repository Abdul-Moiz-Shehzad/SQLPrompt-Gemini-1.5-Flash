CREATE TABLE tblCategory (
    CategoryID int NOT NULL PRIMARY KEY,
    CategoryName nvarchar(255) NULL
);
CREATE TABLE tblContinent(
    ContinentID int NOT NULL PRIMARY KEY,
    ContinentName nvarchar(255) NULL
);
CREATE TABLE tblCountry(
    CountryID int NOT NULL PRIMARY KEY,
    CountryName nvarchar(255) NULL,
    ContinentID int NULL,
    FOREIGN KEY(ContinentID) REFERENCES tblContinent (ContinentID)
);
CREATE TABLE tblEvent(
    EventID int NOT NULL PRIMARY KEY,
    EventName varchar(8000) NULL,
    EventDate date NULL,
    CountryID int NULL,
    CategoryID int NULL,
    FOREIGN KEY(CategoryID) REFERENCES tblCategory (CategoryID)
);

-- Insert data into tblCategory
INSERT INTO tblCategory (CategoryID, CategoryName) VALUES 
    (1, 'Politics'), (2, 'Alien life'), (3, 'Exploration'), 
    (4, 'Natural world'), (5, 'Death and disaster'), (6, 'War and conflict'), 
    (7, 'Sports'), (8, 'Economy'), (9, 'Entertainment and culture'), 
    (10, 'Health and medicine'), (11, 'Love and relationships'), 
    (12, 'Science and technology'), (13, 'Old'), (14, 'Transport'), 
    (15, 'Energy'), (16, 'Royalty and monarchy'), (17, 'Crime and legal'), 
    (18, 'Religion'), (19, 'Education'), (20, 'General');

-- Insert data into tblContinent
INSERT INTO tblContinent (ContinentID, ContinentName) VALUES 
    (1, 'Asia'), (2, 'Africa'), (3, 'Europe'), (4, 'Australasia'), 
    (5, 'South America'), (6, 'North America'), (7, 'Antarctic'), 
    (8, 'Not applicable');

-- Insert data into tblCountry
INSERT INTO tblCountry (CountryID, CountryName, ContinentID) VALUES 
    (1, 'Ukraine', 3), (2, 'France', 3), (5, 'United States', 6), 
    (8, 'Japan', 1), (11, 'Russia', 3), (13, 'Space', 8), 
    (20, 'Not set', 1), (21, 'International', 8), 
    (24, 'India', 1), (26, 'South Africa', 2);

-- Insert data into tblEvent
INSERT INTO tblEvent (EventID, EventName, EventDate, CountryID, CategoryID) VALUES 
    (1, 'Chernobyl', '1986-04-26', 1, 5), 
    (2, 'Pearl Harbour', '1941-12-07', 5, 6), 
    (4, 'World War 1 ends', '1918-11-11', 2, 6), 
    (7, 'World War II ends', '1945-09-02', 8, 6), 
    (8, 'Hiroshima', '1945-08-06', 8, 6), 
    (9, 'Asian tsunami', '2004-12-26', 21, 5), 
    (11, '9/11 attacks', '2001-09-11', 5, 6), 
    (14, 'Lehman Brothers collapses', '2008-09-15', 5, 8), 
    (19, 'Channel Tunnel opens', '1994-05-06', 2, 14), 
    (22, 'Coup attempt in Russia', '1991-08-19', 11, 6), 
    (23, 'Google launched', '1998-09-04', 5, 12), 
    (328, 'First men land on the moon', '1969-07-20', 13, 3), 
    (204, 'Sputnik I launched by Soviet Union', '1957-10-04', 13, 12), 
    (136, 'NHS founded', '1948-07-05', 20, 10), 
    (133, 'Gandhi assassinated in Delhi', '1948-01-30', 24, 6), 
    (128, 'India gains independence', '1947-08-14', 21, 1);

-- Add a column to tblContinent
ALTER TABLE tblContinent ADD Summary varchar(100) NULL;

-- Update some values in tblContinent
UPDATE tblContinent SET Summary = 'Big' WHERE ContinentID = 1;
UPDATE tblContinent SET Summary = 'Biggish' WHERE ContinentID = 2;
UPDATE tblContinent SET Summary = 'Home' WHERE ContinentID = 3;
UPDATE tblContinent SET Summary = 'Lots of trees' WHERE ContinentID = 5;
UPDATE tblContinent SET Summary = 'Full of penguins' WHERE ContinentID = 7;