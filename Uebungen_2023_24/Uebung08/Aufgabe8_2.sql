--Aufgabe 8.2 a)
--Geben Sie alle Daten der Tabelle gebiet aus. In der Anzeige soll an Stelle von gebietname
--das Attribut Gebiet (Groß geschrieben) erscheinen.
select id,gebietname as "GEBIET", regionid from auftragsverwaltung.gebiet;

--Aufgabe 8.2 b)
--Geben Sie aus der Tabelle bestellung die Datens¨atze mit Versanddatum gleich NULL
--aus. Angezeigt werden sollen Bestellnummer, Bestelldatum und Lieferdatum.
select bestellnummer, bestelldatum, lieferdatum from auftragsverwaltung.bestellung
where versanddatum is null;

--Aufgabe 8.2 c)
--Geben Sie aus der Tabelle artikel das Produkt aus Einzelpreis und Lagerbestand an
--und nennen Sie die Spalte Lagerwert. Angezeigt werden sollen alle Datens¨atze, die einen
--Wert zwischen 100 und 500 (beides eingeschlossen) aufweisen. Sortieren Sie beginnend
--mit dem gr¨ossten Produkt.
select einzelpreis*lagerbestand as "Lagerwert" from auftragsverwaltung.artikel 
where einzelpreis*lagerbestand between 100 and 500
order by "Lagerwert" DESC;

--Aufgabe 8.2 d)
--Geben Sie alle Kunden in bestellung aus. Aber jede nur einmal.
select distinct kunde from auftragsverwaltung.bestellung;

--Aufgabe 8.2 e)
--Geben Sie alle Bestellungen aus, bei denen der Kunde den Kundencode VINET hat.
select * from auftragsverwaltung.bestellung where kunde like 'VINET';

--Aufgabe 8.2 f)
--Geben Sie alle Lieferanten aus, die ein Ltd, KG oder AG im Firmennamen haben.
select * from auftragsverwaltung.lieferant where firmenname like '%LTD%' or
firmenname like '%KG%' or 
firmenname like '%AG%';#

--Aufgabe 8.2 g)
--Geben Sie alle Adressen mit Land Deutschland und Postleitzahl gleich 10785 oder 60439 an.
--Achtung: Uberpr ¨ ufen Sie, wie Deutschland in der Datenbank abgelegt ist. 
select * from auftragsverwaltung.adresse where land = 'germany' 
and postleitzahl = '10785' or postleitzahl = '60439';

--Aufgabe 8.2 h)
--Geben Sie alle Kontaktpersonen an, deren Vorname mit M beginnt und an der dritten
--Stelle ein r hat.
select * from auftragsverwaltung.kontaktperson where 
vorname like 'M_r%';

--Aufgabe 8.2 i)
--Geben Sie alle Artikel an, deren Mindestbestand ungleich 0 ist. Sortieren Sie nach der
--Differenz aus Lagerbestand und BestellteEinheiten und bei Gleichheit dieser Differenz
--nach dem Produktnamen beginnend jeweils mit dem kleinsten Wert.
select * from auftragsverwaltung.artikel
-- where mindestbestand <> 0 (Eklige variante)
where mindestbestand != 0
order by lagerbestand-bestellteeinheiten asc,
artikelname asc;

--Aufgabe 8.2 j)
-- Geben Sie alle Artikel an, die nicht von einem Lieferanten mit ID 1, 3, 5 oder 6 geliefert
-- werden
select * from auftragsverwaltung.artikel where lieferantid not in (1,3,5,6);

--Aufgabe 8.2 k)
-- Geben Sie alle Postleitzahlen in Kleinbuchstaben und Ziffern aus. 
--Es sollen nur die Datens¨atze ausgegeben werden, die auch einen Wert in der Datenbank haben.
select lower(postleitzahl) as "Postleitzahlen" from auftragsverwaltung.adresse 
where postleitzahl is not null;

--Aufgabe 8.2 l)
--  Geben Sie aus der Tabelle adresse alle St¨adtenamen sowie die L¨andernamen aus. Die
-- L¨andernamen sollen zum einen im Original ausgegeben werden und in einer weiteren
-- Spalte wie folgt ver¨andert werden: Fur das Land UK soll anstatt der Abk ¨ urzung UK der ¨
-- Name Great Britain und anstatt USA der Namen United States of America ausgegeben
-- werden. Die anderen L¨ander sollen unver¨andert ausgegeben werden. Nennen Sie die neue
-- Spalte Angepasste Laendernamen
Select stadt, land, case 
when land = 'UK' then 'Great Britain'
when land = 'USA' then 'United States of America'
end as "Laendernamen"
from auftragsverwaltung.adresse 
-- switch and case system

--Aufgabe 8.2 m)
--Betrachten Sie die Tabelle bestelldetails. Geben Sie die Versandkosten in Abh¨angigkeit
--von der Bestellmenge (Tabelle Bestelldetails) aus: Liegt die Bestellmenge unter 10,
--so betragen die Kosten 50, liegt sie zwischen 10 und 50, so betragen die Kosten 100, liegt sie
--uber 50, so wird als Kosten die doppelte Bestellmenge berechnet. Geben Sie bei dieser ¨
--Aufgabe die Bestellmenge zusammen mit den ermittelten Kosten aus.
select case 
	when bestellmenge < 10 then 50
	when bestellmenge between 10 and 50 then 100
	when bestellmenge > 50 then bestellmenge*2
end as "Versandkosten"
from auftragsverwaltung.bestelldetails;