TEMĂ: Alegerile electorale

DESCRIERE NON-TEHNICĂ:

	Se gestionează informații despre toți cetățenii eligibili să voteze.
	Fiecare cetățean trebuie să aibă un cod unic de vot pentru a putea fi identificat.
	Cetățenii sunt repartizați pentru a vota la o circumscripție.
	Fiecare circumscripție va avea mai mulți candidați, și sistemul trebuie să permită stocarea informațiilor despre aceștia.
	Sistemul trebuie să permită cetățenilor să voteze electronic.
	Voturile trebuie să fie înregistrate și legate de candidații din circumscripția lor.
	Fiecare vot trebuie să fie asociat atât cu cetățeanul care a votat, cât și cu candidatul votat. 
	Datele despre circumscripții, inclusiv regiunea geografică și numele circumscripției, trebuie să fie gestionate eficient. 
	Fiecare cetățean și candidat trebuie să fie asociat cu o anumită circumscripție electorală.
	Sistemul trebuie să fie flexibil și să gestioneze mai multe alegeri de-a lungul timpului.
	Se vor înregistra datele despre fiecare eveniment electoral: când au avut loc, în ce circumscripții și care au fost candidaturi implicate.
	Partidele politice trebuie să fie înregistrate, împreună cu liderii lor și candidații care îi sunt asociate.
	Fiecare candidat trebuie să fie legat de un partid (dacă există).

Limitări: 
	Un cetățean poate vota doar la circumscripția din care face parte.
	Nu se va verifica dacă alegerile au loc la o anumită perioadă de timp( de exemplu o dată la patru ani).


DESCRIERE SEMI-TEHNICĂ:

Entitatea Cetățean
	ID (NUMERIC, primary key, auto-increment): Identificator unic.
	Cod_de_vot (varchar, max. 10, unique): Cod unic pentru votul electronic.

Enditatea Detalii_Cetățean
	Nume (varchar, aproximativ 55): Numele complet.
	CNP (varchar, max. 13, unique): Cod numeric personal, unic.
	Serie(varchar, 2) 
	Numar(NUMERIC, 6)
	Varsta(NUMERIC, 3) 
	Adresă (varchar, max. 100): Adresa completă.
	ID_Secție (integer, foreign key, references Secții(ID)): Legătura cu secția de votare.
	-> Constrângeri: CNP unic, Cod de vot unic unic, ID_Secție trebuie să fie un ID valid din Secții
			Serie+Numar => UNIC
			Varsta >=18

Entitatea Secție de votare 
	ID (NUMERIC, primary key, auto-increment): Identificator unic.
	Număr_secție (NUMERIC, unique): Număr unic al secției în cadrul circumscripției.
	ID_Circumscripție (NUMERIC, foreign key, references Circumscripții(ID)): Circumscripția de care aparține secția.
	Număr_maxim_de_alegători (integer): Capacitatea maximă de alegători.
	-> Constrângeri: Număr_secție unic per circumscripție, ID_Circumscripție referință validă.


Entitatea Circumscripție
	ID (NUMERIC, primary key, auto-increment): Identificator unic.
	Nume (varchar, max. 21, unique): Numele circumscripției.
	Regiune_geografică (varchar, max. 12): Regiunea în care se află circumscripția.
	-> Constrângeri: Nume unic in lista de valori (Alba, Arad, etc...)
			 Regiuni geografica in lista de valori(Transilvania, Moldova, Muntenia, Dobrogea, Oltenia, Banat, etc...) .
	

Entitatea Candidat
	ID (NUMERIC, primary key, auto-increment): Identificator unic.
	Nume_candidat (varchar, max. 55): Numele complet al candidatului.
	ID_Partid (NUMERIC, foreign key, nullable, references Partide(ID)): Partidul candidatului.
	Poziția pe buletin (NUMERIC): Poziția pe buletinul de vot.
	ID_Circumscripție (NUMERIC, foreign key, references Circumscripții(ID)): Circumscripția de care aparține.
	-> Constrângeri: Poziția pe buletin nu poate depăși numărul candidaților din circumscripția respectivă.

Entitatea Vot
	ID (NUMERIC, max. 8 cifre, primary key, auto-increment): Identificator unic.
	ID_Alegător (integer, foreign key, references Cetățeni(ID)): Legătura cu cetățeanul care a votat.
	ID_Secție (integer, foreign key, references Secții(ID)): Secția la care a votat.
	ID_Candidat (integer, foreign key, references Candidați(ID)): Candidatul votat.
	Timpul votului (timestamp): Data și ora votului.
	-> ID_Alegător și ID_Alegeri unice per vot

Entitatea Alegeri
	ID (integer, primary key, auto-increment): Identificator unic.
	Tipul_alegerilor (varchar, max. 22): Tipul alegerilor (locale, parlamentare, prezidențiale).
	Data_alegerilor (date): Data desfășurării alegerilor.
	ID_Circumscripție (integer, foreign key, references Circumscripții(ID)): Circumscripția implicată.
	-> Constrângeri: Tipul_alegerilor se află în lista de valori (Parlamentare,  Locale, Prezidențiale, Parlamentul European, Referendum).

Entitatea Partide
	ID (integer, primary key, auto-increment): Identificator unic.
	Nume_partid (varchar, max. 40, unique): Numele partidului.
	Lider partid (varchar, max. 55): Numele liderului.
	-> Constrângeri: Nume_partid unic.

Petru relatia many-to-many s-a creat tabela Candidat-Alegeri 
( Un candidat poate participa la mai multe alegeri ( din perioade diferite sau de un tip diferit).
  La un anumit tip de alegeri pot fi mai multi candidati. )
