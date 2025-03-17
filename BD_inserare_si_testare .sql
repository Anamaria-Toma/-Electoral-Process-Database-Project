--inserare PARTID
INSERT INTO partid (nume_partid, lider_partid)
VALUES ('Partidul Social Democrat', 'Marcel Ciolacu');

INSERT INTO partid (nume_partid, lider_partid)
VALUES ('Uniunea Salva?i România', 'Dacian Ciolo?');

INSERT INTO partid (nume_partid, lider_partid)
VALUES ('Partidul Na?ional Liberal', 'Klaus Iohannis');

INSERT INTO partid (nume_partid, lider_partid)
VALUES ('Alian?a Liberalilor ?i Democra?ilor', 'Cãlin Popescu-Tãriceanu');

--inserare CIRCUMSCRIPTIE
INSERT INTO circumscriptie (nume, regiune)
VALUES ('Bucure?ti', 'Muntenia');

INSERT INTO circumscriptie (nume, regiune)
VALUES ('Cluj', 'Transilvania');

INSERT INTO circumscriptie (nume, regiune)
VALUES ('Timi?', 'Oltenia');
        --eviden?iere rela?ie many-to-many
INSERT INTO circumscriptie (nume, regiune)
VALUES ('Ia?i', 'Moldova');
INSERT INTO circumscriptie (nume, regiune)
VALUES ('Boto?ani','Moldova');
INSERT INTO circumscriptie (nume, regiune)
VALUES ('Suceava', 'Moldova');

--inserare SECTIE VOTARE
    --relatie one-to-many
INSERT INTO sectie_votare (numar_sectie, numar_maxim_alegatori, circumscriptie_id)
VALUES (10, 500, 1);
INSERT INTO sectie_votare (numar_sectie, numar_maxim_alegatori, circumscriptie_id)
VALUES (1, 800, 1);
INSERT INTO sectie_votare (numar_sectie, numar_maxim_alegatori, circumscriptie_id)
VALUES (2, 1000, 4);

INSERT INTO sectie_votare (numar_sectie, numar_maxim_alegatori, circumscriptie_id)
VALUES (12, 600, 2);

INSERT INTO sectie_votare (numar_sectie, numar_maxim_alegatori, circumscriptie_id)
VALUES (15, 700, 3);

INSERT INTO sectie_votare (numar_sectie, numar_maxim_alegatori, circumscriptie_id)
VALUES (14, 800, 4);

INSERT INTO sectie_votare (numar_sectie, numar_maxim_alegatori, circumscriptie_id)
VALUES (8, 800, 5);

--relatie one-to-many
INSERT INTO sectie_votare (numar_sectie, numar_maxim_alegatori, circumscriptie_id)
VALUES (9, 800, 6);
INSERT INTO sectie_votare (numar_sectie, numar_maxim_alegatori, circumscriptie_id)
VALUES (10, 800, 6);

-- Inserare CANDIDAT (corect pentru candidat_info_id = 5 pentru Referendum)
INSERT INTO candidat (nume_candidat, pozitie_buletin, partid_id, candidat_info_id)
VALUES ('Ion Popescu', 1, 1, 1);

INSERT INTO candidat (nume_candidat, pozitie_buletin, partid_id, candidat_info_id)
VALUES ('Maria Ionescu', 2, 2, 2);

INSERT INTO candidat (nume_candidat, pozitie_buletin, partid_id, candidat_info_id)
VALUES ('George Georgescu', 3, 3, 3);

INSERT INTO candidat (nume_candidat, pozitie_buletin, partid_id, candidat_info_id)
VALUES ('Elena Drãgan', 4, 4, 4);

-- Inserare ALEGERE
INSERT INTO alegere (tip_alegere, data_alegerilor, candidat_info_id)
VALUES ('Locale', TO_DATE('2024-05-01', 'YYYY-MM-DD'), 1);

INSERT INTO alegere (tip_alegere, data_alegerilor, candidat_info_id)
VALUES ('Parlamentare', TO_DATE('2024-11-10', 'YYYY-MM-DD'), 2);

INSERT INTO alegere (tip_alegere, data_alegerilor, candidat_info_id)
VALUES ('Preziden?iale', TO_DATE('2024-12-10', 'YYYY-MM-DD'), 3);

INSERT INTO alegere (tip_alegere, data_alegerilor, candidat_info_id)
VALUES ('Preziden?iale', TO_DATE('2024-12-10', 'YYYY-MM-DD'), 4);

-- Elena Drãgan ?i George Georgescu vor participa la ambele date ale alegerilor preziden?iale
INSERT INTO alegere (tip_alegere, data_alegerilor, candidat_info_id)
VALUES ('Preziden?iale', TO_DATE('2025-03-10', 'YYYY-MM-DD'), 4);  -- Elena Drãgan

INSERT INTO alegere (tip_alegere, data_alegerilor, candidat_info_id)
VALUES ('Preziden?iale', TO_DATE('2025-03-10', 'YYYY-MM-DD'), 3);  -- George Georgescu

-- Inserare ALEGERE Referendum
-- Trebuie sã ai candidat_info_id = 5
INSERT INTO alegere (tip_alegere, data_alegerilor,candidat_info_id)
VALUES ('Referendum', TO_DATE('2024-08-25', 'YYYY-MM-DD'), 5);  -- Adãugãm un candidat pentru Referendum

-- Inserare CANDIDAT_ALEGERE_INFO
INSERT INTO candidat_alegere_info (candidat_id, alegere_id)
VALUES (1, 1);  -- Ion Popescu participa la alegerile 'Locale'

INSERT INTO candidat_alegere_info (candidat_id, alegere_id)
VALUES (2, 2);  -- Maria Ionescu participa la alegerile 'Parlamentare'

INSERT INTO candidat_alegere_info (candidat_id, alegere_id)
VALUES (3, 3);  -- George Georgescu participa la alegerile 'Preziden?iale' pe 2024-12-10

-- Inserãm pentru George Georgescu la alegerile preziden?iale pe 2025-03-10
INSERT INTO candidat_alegere_info (candidat_id, alegere_id)
VALUES (3, 6);  -- George Georgescu participa la alegerile 'Preziden?iale' pe 2025-03-10

INSERT INTO candidat_alegere_info (candidat_id, alegere_id)
VALUES (4, 4);  -- Elena Drãgan participa la alegerile 'Preziden?iale' pe 2024-12-10

-- Elena Drãgan participã ?i la alegerile din 2025-03-10
INSERT INTO candidat_alegere_info (candidat_id, alegere_id)
VALUES (4, 5);  -- Elena Drãgan participa la alegerile 'Preziden?iale' pe 2025-03-10

SELECT a.tip_alegere, a.data_alegerilor, c.nume_candidat
FROM alegere a
JOIN candidat_alegere_info cai ON a.id = cai.alegere_id
JOIN candidat c ON cai.candidat_id = c.id
ORDER BY a.data_alegerilor;

--inserare CETATEAN
INSERT INTO cetatean (sectie_id, cod_vot)
VALUES (1, 'CV12345');

INSERT INTO cetatean (sectie_id, cod_vot)
VALUES (2, 'CV98765');

INSERT INTO cetatean (sectie_id, cod_vot)
VALUES (3, 'CV11223');

INSERT INTO cetatean (sectie_id, cod_vot)
VALUES (4, 'CV55667');

INSERT INTO cetatean (sectie_id, cod_vot)
VALUES (4, 'CV55668');

INSERT INTO cetatean (sectie_id, cod_vot)
VALUES (4, 'CV55669');

--inserare CANDIDAT_DETALII
INSERT INTO cetatean_detalii (nume, cnp, serie, numar, varsta, adresa, id1, id2, cetatean_id)
VALUES ('Andrei Mihai', 1234567890123, 'AB', 123456, 30, 'Str. Mihai Eminescu 10, Bucure?ti', 1, 1, 1);

INSERT INTO cetatean_detalii (nume, cnp, serie, numar, varsta, adresa, id1, id2, cetatean_id)
VALUES ('Ioana Popa', 2345678901234, 'CD', 654321, 28, 'Str. Calea Mo?ilor 20, Cluj', 2, 2, 2);

INSERT INTO cetatean_detalii (nume, cnp, serie, numar, varsta, adresa, id1, id2, cetatean_id)
VALUES ('Gabriel Ionescu', 3456789012345, 'EF', 789012, 35, 'Str. Unirii 25, Timi?oara', 3, 3, 3);

INSERT INTO cetatean_detalii (nume, cnp, serie, numar, varsta, adresa, id1, id2, cetatean_id)
VALUES ('Raluca Georgescu', 4567890123456, 'GH', 987654, 40, 'Str. Revolu?iei 30, Ia?i', 4, 4, 4);

INSERT INTO cetatean_detalii (nume, cnp, serie, numar, varsta, adresa, id1, id2, cetatean_id)
VALUES ('Maria Atonescu', 4597990123456, 'GH', 999654, 38, 'Str. Revolu?iei 31, Ia?i', 4, 4, 5);

INSERT INTO cetatean_detalii (nume, cnp, serie, numar, varsta, adresa, id1, id2, cetatean_id)
VALUES ('Vlad Cristescu', 4888890123456, 'GH', 987666, 49, 'Str. Revolu?iei 32, Ia?i', 4, 4, 6);

--inserare VOT
INSERT INTO vot (timp, cetatean_id, candidat_info_id)
VALUES (TO_TIMESTAMP('2024-05-01 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1, 1);

INSERT INTO vot (timp, cetatean_id, candidat_info_id)
VALUES (TO_TIMESTAMP('2024-11-10 15:00:00', 'YYYY-MM-DD HH24:MI:SS'),2, 2);

INSERT INTO vot (timp, cetatean_id, candidat_info_id) 
VALUES (TO_TIMESTAMP('2024-12-10 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 3, 3); 

INSERT INTO vot (timp, cetatean_id, candidat_info_id)
VALUES (TO_TIMESTAMP('2024-12-10 16:00:00', 'YYYY-MM-DD HH24:MI:SS'), 4, 4);

INSERT INTO vot (timp, cetatean_id, candidat_info_id)
VALUES (TO_TIMESTAMP('2025-03-10 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), 5, 4);

INSERT INTO vot (timp, cetatean_id, candidat_info_id)
VALUES (TO_TIMESTAMP('2025-03-10 16:30:00', 'YYYY-MM-DD HH24:MI:SS'), 6, 4);

INSERT INTO vot (timp, cetatean_id, candidat_info_id)
VALUES (TO_TIMESTAMP('2024-05-01 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), 6, 1);

--TESTARE DATE--
-- Afi?eazã datele despre sec?iile de votare ?i circumscrip?iile aferente.
SELECT s.numar_sectie, s.numar_maxim_alegatori, c.nume AS circumscriptie, c.regiune
FROM sectie_votare s
JOIN circumscriptie c ON s.circumscriptie_id = c.id;

--  Afi?eazã informa?iile despre cetã?eni ?i sec?iile de votare.
SELECT cd.nume, cd.cnp, cd.varsta, s.numar_sectie, s.numar_maxim_alegatori
FROM cetatean_detalii cd
JOIN cetatean ce ON cd.cetatean_id = ce.id
JOIN sectie_votare s ON ce.sectie_id = s.id;

-- Testarea constrângerii PRIMARY KEY (PK)
INSERT INTO cetatean (id, sectie_id, cod_vot)
VALUES (1, 2, 'DEF456'); -- A doua inserare cu eroare

-- Testarea constrângerii NOT NULL (NN)
INSERT INTO cetatean (id, sectie_id, cod_vot)
VALUES (2, NULL, 'GHI789');

-- Testarea constrângerii FOREIGN KEY (FK)
INSERT INTO cetatean (id, sectie_id, cod_vot)
VALUES (5, 999, 'MNO345'); -- Sec?ia de votare cu ID 999 nu existã

-- Testarea ?tergerii legate de FOREIGN KEY (FK)
-- Încercãm sã ?tergem o sec?ie de votare care este referitã de tabelul 'cetatean'
DELETE FROM sectie_votare
WHERE id = 1;

-- Testarea modificãrii legate de FOREIGN KEY (FK)
-- Încercãm sã modificãm 'sectie_id' în tabelul 'cetatean' cu o valoare care nu existã în 'sectie_votare'
UPDATE cetatean
SET sectie_id = 995
WHERE id = 1;

-- Testarea constrângerii CHECK (CK)
-- Încercãm sã inserãm un nume de jude? ?i regiune care nu existã în România
INSERT INTO circumscriptie (id, nume, regiune)
VALUES (7, 'Paris', 'Île-de-France');

--Testare constrângerii CHECK (CK)
-- Încercãm sã inserãm un vot cu o datã la care nu au avut loc alegeri
INSERT INTO vot (timp, cetatean_id, candidat_info_id)
VALUES (TO_TIMESTAMP('2025-05-01 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), 6, 1);
