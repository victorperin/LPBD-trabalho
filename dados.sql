INSERT INTO Paises (Id, Nome) VALUES
	(1, 'Inglaterra'),
	(2, 'Estados Unidos'),
	(3, 'Brasil'),
	(4, 'Canada'),
	(5, 'Russia');

INSERT INTO Albuns (Id, Nome, AnoLancamento) VALUES
	(1, 'From Death To Destiny', 2013),
	(2, 'Common Courtesy', 2013),
	(3, 'Reckless and Relentless', 2011),
	(4, 'Stand Up and Scream', 2009),
	(5, 'Madness', 2015),
	(6, 'Feel', 2013),
	(7, 'Lets Cheer To This', 2011),
	(8, 'With Ears To See And Eyes To Hear', 2010);

INSERT INTO Genero (Id, Nome) VALUES
	(1, 'Metalcore'),
	(2, 'Post-Hardcore'),
	(3, 'Pop Punk'),
	(4, 'Emocore'),
	(5, 'Country Rock'),
	(6, 'Rock'),
	(7, 'Eletronica');

INSERT INTO Artistas (Id, Nome, GeneroId, CountryId) VALUES
	(1, 'Asking Alexandria', 1, 1),
	(2, 'Escape The Fate', 2, 2),
	(3, 'Sleeping With Sirens', 2, 2),
	(4, 'In This Momment', 1, 2),
	(5, 'Falling in Reverse', 2, 2),
	(6, 'Nx0', 4, 3),
	(8, 'A Day To Remember', 1, 2),
	(9, 'Fresno', 4, 3);

INSERT INTO AlbunsArtistas (ArtistaId, AlbumId, Principal) VALUES
	(1, 1, true),
	(1, 3, true),
	(1, 4, true),
	(3, 5, true),
	(3, 6, true),
	(3, 7, true),
	(3, 8, true),
	(8, 2, true);

INSERT INTO Musicas (Id, Nome, GeneroId, ArtistaId, AlbumId) VALUES
	(1, 'Gold', 2, 3, 5),
	(2, 'Go Go Go', 2, 3, 5),
	(3, 'Fly', 2, 3, 5),
	(4, 'The Strays', 2, 3, 5),
	(5, 'Killing You', 1, 1, 1),
	(6, 'Poison', 1, 1, 1),
	(7, 'Welcome', 1, 1, 3);
