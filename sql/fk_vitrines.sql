CREATE TABLE Fossielen
(
ID int AUTO_INCREMENT PRIMARY KEY,
omschrijving varchar(50),
waarde decimal(3),
aankoopdatum date,
leverancier varchar(20),
id_vitrine int,
CONSTRAINT fk_vitrines FOREIGN KEY (id_vitrine) REFERENCES vitrines(id_vitrine)
);