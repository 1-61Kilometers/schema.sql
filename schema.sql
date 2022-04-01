CREATE TABLE Users(
    ID int AUTO_INCREMENT,
    Username varchar(20) NOT NULL,
    Password varchar(20) NOT NULL,
	PRIMARY KEY(ID)
);
CREATE TABLE Chefs(
    Username varchar(20),
    FOREIGN KEY (Username) REFERENCES Users (Username)
);
CREATE TABLE Normal_Users(
    Username varchar(20),
    FOREIGN KEY (Username) REFERENCES Users (Username)
);
CREATE TABLE Recipe(
	ID varchar(20),
    
    PRIMARY KEY(ID)
);