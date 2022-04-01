CREATE TABLE Users(
    Username varchar(20) NOT NULL,
    Password varchar(20) NOT NULL,
	PRIMARY KEY(Username)
);
CREATE TABLE Chefs(
    Username varchar(20),
    FOREIGN KEY (Username) REFERENCES Users (Username)
);
CREATE TABLE Normal_Users(
    Username varchar(20),
    FOREIGN KEY (Username) REFERENCES Users (Username)
);
CREATE TABLE Nutritional_Value(
    ID int AUTO_INCREMENT,
    Carbohydrate int NOT NULL,
    Total_Fat int NOT NULL,
    Serving_Size int NOT NULL,
    Protein int NOT NULL,
    Sodium int NOT NULL,
    Total_Sugar int NOT NULL,
    PRIMARY KEY(ID)
);
CREATE TABLE Recipe(
	ID int,
    Name varchar(20) NOT NULL,
    Price int,
    Recipe_Preview varchar(20),
    Expiration_Date date,
    Date_of_Post date,
    rating varchar(10),
    description varchar(50),
    Views int,
    NutritinalValue int,
    PRIMARY KEY(ID),
    FOREIGN KEY (NutritinalValue) REFERENCES Nutritional_Value (ID)
);
CREATE TABLE User_Recipe(
	username varchar(20),
    ID int AUTO_INCREMENT,
    PRIMARY KEY(ID, username),
    FOREIGN KEY (username) REFERENCES Users (Username)
);
CREATE TABLE Official_Recipes(
	ID int,
    PRIMARY KEY(ID),
    FOREIGN KEY (ID) REFERENCES Recipe (ID)
);
CREATE TABLE Community_Recipes(
	ID int,
    PRIMARY KEY(ID),
    FOREIGN KEY (ID) REFERENCES Recipe (ID)
);
CREATE TABLE Tags(
	ID int AUTO_INCREMENT,
    name varchar(20),
    PRIMARY KEY(ID)
);
CREATE TABLE Tags_Recipe(
	recipe_ID int,
    tags_ID int,
    PRIMARY KEY(recipe_ID, tags_ID),
    FOREIGN KEY (recipe_ID) REFERENCES Recipe (ID),
    FOREIGN KEY (tags_ID) REFERENCES Tags (ID)
);
CREATE TABLE Equipment(
	ID int AUTO_INCREMENT,
    equipment_Name varchar(20),
    PRIMARY KEY(ID)
);
CREATE TABLE Recipe_Equipment(
	recipe_ID int,
    equipment_ID int,
    quantity int,
    PRIMARY KEY(recipe_ID, equipment_ID),
    FOREIGN KEY (recipe_ID) REFERENCES Recipe (ID),
    FOREIGN KEY (equipment_ID) REFERENCES Equipment (ID)
);
CREATE TABLE Ingredients(
	name varchar(20),
    Price int NOT NULL,
    PRIMARY KEY(name)
);
CREATE TABLE Recipe_Ingredient(
	recipe_ID int,
    ingredient_Name varchar(20),
    quantity int,
    PRIMARY KEY(recipe_ID, ingredient_Name),
    FOREIGN KEY (recipe_ID) REFERENCES Recipe (ID),
    FOREIGN KEY (ingredient_Name) REFERENCES Ingredients (name)
);
CREATE TABLE Inventory(
	ID int AUTO_INCREMENT,
    Num_of_Uniq_Ingredients int NOT NULL,
	PRIMARY KEY(ID)
); 
CREATE TABLE Ingredients_inventory(
	inventory_ID int,
    ingredients_name varchar(20),
    quantity int,
    PRIMARY KEY(inventory_ID,ingredients_name),
    FOREIGN KEY (inventory_ID) REFERENCES Inventory (ID),
    FOREIGN KEY (ingredients_name) REFERENCES Ingredients (name)
);