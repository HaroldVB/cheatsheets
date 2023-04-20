"Hoeveel dagen wordt een auto gemiddeld gehuurd?"
SELECT round(avg(datediff(datumretour, datumverhuur))) AS "gemiddelde huurduur" FROM `verhuur`;

"Laat het kenteken zien en het aantal keren dat die auto is verhuurd"
SELECT kenteken,COUNT(datumverhuur) FROM `verhuur` GROUP BY kenteken

"Laat het aantal klanten per plaatsnaam zien:"
SELECT klpbplaats,count(klantnr) FROM `klanten` GROUP BY klpbplaats;

"Laat de auto's zien die vaker dan 3 keer zijn verhuurd"
SELECT kenteken,COUNT(datumverhuur) FROM `verhuur` GROUP BY kenteken

"Laat alle gegevens uit Verhuur zien met de naam van de klant erbij"
SELECT huurders.naam,verhuur.* FROM `verhuur`,`huurders` WHERE huurders.huurdernr = verhuur.huurdernr;

"Laat alle gegevens zien uit verhuur met het merk en type auto erbij:"
SELECT verhuur.*, auto.merk, auto.type FROM `auto`,`verhuur` WHERE verhuur.kenteken = auto.kenteken; 

"Laat het kenteken, het merk, het type, datumverhuur en de klantnaam zien van alle verhuurde auto's:"
SELECT auto.merk, auto.type, auto.kenteken, huurders.naam, verhuur.datumverhuur, huurders.plaats FROM `auto`,`verhuur`,`huurders` WHERE verhuur.kenteken = auto.kenteken AND huurders.huurdernr = verhuur.huurdernr AND huurders.plaats = "rotterdam";

"Laat alle namen van huurders zien en andere belangrijke gegevens, die ooit een Volkswagen hebben gehuurd:"
SELECT huurders.naam, huurders.plaats, auto.merk, verhuur.datumverhuur FROM `auto`,`verhuur`,`huurders` WHERE verhuur.kenteken = auto.kenteken AND huurders.huurdernr = verhuur.huurdernr AND auto.merk = "volkswagen"; 

"Maak een overzicht van alle auto's met de verhuurprijzen:"
SELECT auto.merk, auto.type, prijs.prijsperdag,prijs.prijsperdagdeel, prijs.prijsperweek FROM `prijs`,`auto` WHERE auto.merk = prijs.merk AND auto.type = prijs.type; 

"Overzicht per huurder met zijn naam en het aantal keren dat die een auto heeft gehuurd:"
SELECT huurders.huurdernr,huurders.naam,COUNT(verhuur.identificatie) FROM `verhuur`,`huurders` WHERE huurders.huurdernr = verhuur.huurdernr GROUP BY huurdernr; 

"Hoe vaak is een auto verhuurd per merk ?"
SELECT auto.merk,COUNT(identificatie) FROM `verhuur`,`auto` WHERE auto.kenteken = verhuur.kenteken GROUP BY auto.merk; 

"Wat is de totale omzet als alle auto's tegen prijsperdag zijn verhuurd:"
SELECT sum(prijs.prijsperdagdeel) FROM `prijs`,`auto` WHERE auto.merk = prijs.merk AND auto.type = prijs.type; 

"Laat het kenteken en het merk zien van de auto die de meeste kilometers heeft gereden."
SELECT merk,kenteken,MAX(kilometerstand) FROM `auto`; 

"Laat het kenteken en het merk zien van de auto die het meest aantal keren is verhuurd."
SELECT verhuur.kenteken, auto.merk, MAX(verhuurd) FROM `verhuur`,`auto`, (SELECT COUNT(verhuur.kenteken) AS Verhuurd FROM `verhuur` GROUP BY verhuur.kenteken) AS Resultaat WHERE auto.kenteken = verhuur.kenteken;

"Tel het aantal keren dat een auto is verhuurd aan een Rotterdammer:"
SELECT huurders.plaats,COUNT(*) FROM `verhuur`,`huurders` WHERE huurders.huurdernr = verhuur.huurdernr AND huurders.plaats = "rotterdam" GROUP BY huurders.plaats;

"Voeg een nieuwe auto toe met het kenteken 56-ST-NK, merk Toyota, type Avensis, APKdatum 01-01-2007 en kilometerstand 580"
INSERT INTO auto(kenteken,merk,type,datumAPK,kilometerstand)
VALUES("56-ST-NK","Toyota","Avensis","2007-01-01",580)

"Voeg een nieuwe auto toe met het kenteken 56-ST-KN, merk Volkswagen, type Touran"
INSERT INTO auto(kenteken,merk,type)
VALUES("56-ST-KN","Volkswagen","Touran")

"Wijzig de kilometerstand van de citroen XM met het kenteken DT-LT-87 in 85000"
UPDATE auto
SET kilometerstand=85000
WHERE kenteken="DT-LT-87"

"Wijzig de apk-datum van de citroen XM met het kenteken TT-PR-73 in 01-01-2003"
UPDATE auto
SET datumAPK="2003-01-01"
WHERE kenteken="TT-PR-73"

"Verwijder de Ford Fiesta. Is dit gelukt??"
DELETE
FROM auto
WHERE type="fiesta"

"Maak met een SQL-opdracht een nieuwe tabel aan met de naam SCOOTERS en de velden"
CREATE TABLE SCOOTERS(
    scnr int,
    scmerk varchar(20),
    sctype varchar(20),
    scdatum date
)

"Voeg de volgende scooter toe met een SQL-opdracht:"
INSERT INTO SCOOTERS(scnr,scmerk,sctype,scdatum)
VALUES(1,"Peugeot","Camero","2004-12-12")