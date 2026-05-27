CREATE DATABASE IF NOT EXISTS LocalFixDB;
USE LocalFixDB;

CREATE TABLE Users (
    ID_User INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(50) NOT NULL UNIQUE,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Parola_Hash VARCHAR(255) NOT NULL,
    Rol ENUM('Cetatean', 'Inspector', 'Admin') DEFAULT 'Cetatean',
    Confirmat BOOLEAN DEFAULT FALSE,
    Data_Inregistrare TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Issues (
    ID_Issue INT AUTO_INCREMENT PRIMARY KEY,
    ID_User INT,
    Descriere TEXT NOT NULL,
    Foto_URL VARCHAR(255),
    Categorie VARCHAR(50) NOT NULL,
    Latitudine DECIMAL(10, 8) NOT NULL,
    Longitudine DECIMAL(11, 8) NOT NULL,
    Status ENUM('In lucru', 'Rezolvat') DEFAULT 'In lucru',
    Nota_Inchidere TEXT,
    Data_Creare TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ID_User) REFERENCES Users(ID_User) ON DELETE SET NULL
);

CREATE TABLE Comments (
    ID_Comment INT AUTO_INCREMENT PRIMARY KEY,
    ID_User INT,
    ID_Issue INT,
    Text_Comentariu TEXT NOT NULL,
    Data_Postare TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ID_User) REFERENCES Users(ID_User) ON DELETE CASCADE,
    FOREIGN KEY (ID_Issue) REFERENCES Issues(ID_Issue) ON DELETE CASCADE
);

CREATE TABLE Votes (
    ID_User INT,
    ID_Issue INT,
    PRIMARY KEY (ID_User, ID_Issue),
    FOREIGN KEY (ID_User) REFERENCES Users(ID_User) ON DELETE CASCADE,
    FOREIGN KEY (ID_Issue) REFERENCES Issues(ID_Issue) ON DELETE CASCADE
);

CREATE TABLE Petitions (
    ID_Petition INT AUTO_INCREMENT PRIMARY KEY,
    ID_User INT,
    Titlu VARCHAR(150) NOT NULL,
    Descriere TEXT NOT NULL,
    Tinta_Semnaturi INT DEFAULT 100,
    Link_Distribuire VARCHAR(255) UNIQUE,
    Data_Creare TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ID_User) REFERENCES Users(ID_User) ON DELETE CASCADE
);

CREATE TABLE Signatures (
    ID_User INT,
    ID_Petition INT,
    Vizibil_Public BOOLEAN DEFAULT TRUE,
    PRIMARY KEY (ID_User, ID_Petition),
    FOREIGN KEY (ID_User) REFERENCES Users(ID_User) ON DELETE CASCADE,
    FOREIGN KEY (ID_Petition) REFERENCES Petitions(ID_Petition) ON DELETE CASCADE
);