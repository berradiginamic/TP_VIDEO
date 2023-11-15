DROP TABLE IF EXISTS Joueur ;
CREATE TABLE Joueur (ID_Joueur_Joueur INT AUTO_INCREMENT NOT NULL,
Nom_Joueur VARCHAR(50),
Prenom_Joueur VARCHAR(50),
Pseudo_Joueur VARCHAR(50),
Email_Joueur VARCHAR(100),
DateCreation_Joueur DATETIME,
MotDePass_Joueur VARCHAR(50),
PRIMARY KEY (ID_Joueur_Joueur)) ENGINE=InnoDB;

DROP TABLE IF EXISTS Partie ;
CREATE TABLE Partie (ID_Partie_Partie INT AUTO_INCREMENT NOT NULL,
DateHeure_Partie TIMESTAMP,
ID_Carte_Partie INT,
Score_Partie INT,
PRIMARY KEY (ID_Partie_Partie)) ENGINE=InnoDB;

DROP TABLE IF EXISTS Carte ;
CREATE TABLE Carte (ID_Carte_Carte INT AUTO_INCREMENT NOT NULL,
Nom_Carte_Carte VARCHAR(50),
PRIMARY KEY (ID_Carte_Carte)) ENGINE=InnoDB;

DROP TABLE IF EXISTS ScoreGlobal ;
CREATE TABLE ScoreGlobal (ID_ScoreGlobal_ScoreGlobal INT AUTO_INCREMENT NOT NULL,
ScoreTotal_ScoreGlobal INT,
Classement_ScoreGlobal INT,
PRIMARY KEY (ID_ScoreGlobal_ScoreGlobal)) ENGINE=InnoDB;

DROP TABLE IF EXISTS Skin ;
CREATE TABLE Skin (ID_Skin_Skin INT AUTO_INCREMENT NOT NULL,
NomSkin_Skin VARCHAR(50),
Description_Skin VARCHAR(100),
Image_Skin VARCHAR(250),
PRIMARY KEY (ID_Skin_Skin)) ENGINE=InnoDB;

DROP TABLE IF EXISTS Item ;
CREATE TABLE Item (ID_Item_Item INT AUTO_INCREMENT NOT NULL,
NomItem_Item VARCHAR(50),
Description_Item VARCHAR(100),
Image_Item VARCHAR(250),
PRIMARY KEY (ID_Item_Item)) ENGINE=InnoDB;

DROP TABLE IF EXISTS Equipe ;
CREATE TABLE Equipe (ID_Equipe_Equipe INT AUTO_INCREMENT NOT NULL,
NomEquipe_Equipe VARCHAR(50),
PRIMARY KEY (ID_Equipe_Equipe)) ENGINE=InnoDB;

DROP TABLE IF EXISTS JoueDans ;
CREATE TABLE JoueDans (ID_Joueur_Joueur **NOT FOUND** AUTO_INCREMENT NOT NULL,
ID_Partie_Partie **NOT FOUND** NOT NULL,
PRIMARY KEY (ID_Joueur_Joueur,
 ID_Partie_Partie)) ENGINE=InnoDB;

DROP TABLE IF EXISTS SeDeroule ;
CREATE TABLE SeDeroule (ID_Partie_Partie **NOT FOUND** AUTO_INCREMENT NOT NULL,
ID_Carte_Carte **NOT FOUND** NOT NULL,
PRIMARY KEY (ID_Partie_Partie,
 ID_Carte_Carte)) ENGINE=InnoDB;

DROP TABLE IF EXISTS PossedSkin ;
CREATE TABLE PossedSkin (ID_Joueur_Joueur **NOT FOUND** AUTO_INCREMENT NOT NULL,
ID_Skin_Skin **NOT FOUND** NOT NULL,
PRIMARY KEY (ID_Joueur_Joueur,
 ID_Skin_Skin)) ENGINE=InnoDB;

DROP TABLE IF EXISTS PossedItem ;
CREATE TABLE PossedItem (ID_Joueur_Joueur **NOT FOUND** AUTO_INCREMENT NOT NULL,
ID_Item_Item **NOT FOUND** NOT NULL,
PRIMARY KEY (ID_Joueur_Joueur,
 ID_Item_Item)) ENGINE=InnoDB;

DROP TABLE IF EXISTS Appartient ;
CREATE TABLE Appartient (ID_Joueur_Joueur **NOT FOUND** AUTO_INCREMENT NOT NULL,
ID_Equipe_Equipe **NOT FOUND** NOT NULL,
PRIMARY KEY (ID_Joueur_Joueur,
 ID_Equipe_Equipe)) ENGINE=InnoDB;

DROP TABLE IF EXISTS Avoir ;
CREATE TABLE Avoir (ID_Partie_Partie **NOT FOUND** AUTO_INCREMENT NOT NULL,
ID_ScoreGlobal_ScoreGlobal **NOT FOUND** NOT NULL,
PRIMARY KEY (ID_Partie_Partie,
 ID_ScoreGlobal_ScoreGlobal)) ENGINE=InnoDB;

ALTER TABLE JoueDans ADD CONSTRAINT FK_JoueDans_ID_Joueur_Joueur FOREIGN KEY (ID_Joueur_Joueur) REFERENCES Joueur (ID_Joueur_Joueur);

ALTER TABLE JoueDans ADD CONSTRAINT FK_JoueDans_ID_Partie_Partie FOREIGN KEY (ID_Partie_Partie) REFERENCES Partie (ID_Partie_Partie);
ALTER TABLE SeDeroule ADD CONSTRAINT FK_SeDeroule_ID_Partie_Partie FOREIGN KEY (ID_Partie_Partie) REFERENCES Partie (ID_Partie_Partie);
ALTER TABLE SeDeroule ADD CONSTRAINT FK_SeDeroule_ID_Carte_Carte FOREIGN KEY (ID_Carte_Carte) REFERENCES Carte (ID_Carte_Carte);
ALTER TABLE PossedSkin ADD CONSTRAINT FK_PossedSkin_ID_Joueur_Joueur FOREIGN KEY (ID_Joueur_Joueur) REFERENCES Joueur (ID_Joueur_Joueur);
ALTER TABLE PossedSkin ADD CONSTRAINT FK_PossedSkin_ID_Skin_Skin FOREIGN KEY (ID_Skin_Skin) REFERENCES Skin (ID_Skin_Skin);
ALTER TABLE PossedItem ADD CONSTRAINT FK_PossedItem_ID_Joueur_Joueur FOREIGN KEY (ID_Joueur_Joueur) REFERENCES Joueur (ID_Joueur_Joueur);
ALTER TABLE PossedItem ADD CONSTRAINT FK_PossedItem_ID_Item_Item FOREIGN KEY (ID_Item_Item) REFERENCES Item (ID_Item_Item);
ALTER TABLE Appartient ADD CONSTRAINT FK_Appartient_ID_Joueur_Joueur FOREIGN KEY (ID_Joueur_Joueur) REFERENCES Joueur (ID_Joueur_Joueur);
ALTER TABLE Appartient ADD CONSTRAINT FK_Appartient_ID_Equipe_Equipe FOREIGN KEY (ID_Equipe_Equipe) REFERENCES Equipe (ID_Equipe_Equipe);
ALTER TABLE Avoir ADD CONSTRAINT FK_Avoir_ID_Partie_Partie FOREIGN KEY (ID_Partie_Partie) REFERENCES Partie (ID_Partie_Partie);
ALTER TABLE Avoir ADD CONSTRAINT FK_Avoir_ID_ScoreGlobal_ScoreGlobal FOREIGN KEY (ID_ScoreGlobal_ScoreGlobal) REFERENCES ScoreGlobal (ID_ScoreGlobal_ScoreGlobal);
