CREATE DATABASE IF NOT EXISTS trabalho_lpbd;
USE trabalho_lpbd;


CREATE TABLE IF NOT EXISTS Albuns (
  Id int(10) unsigned NOT NULL AUTO_INCREMENT,
  Nome varchar(50) NOT NULL,
  AnoLancamento int(10) NOT NULL,
  PRIMARY KEY (Id)
);

CREATE TABLE IF NOT EXISTS Genero (
  Id int(10) unsigned NOT NULL AUTO_INCREMENT,
  Nome varchar(50) NOT NULL,
  PRIMARY KEY (Id),
  UNIQUE INDEX Nome (Nome)
);

-- Lista de países.
CREATE TABLE IF NOT EXISTS Paises (
  Id int(10) unsigned NOT NULL AUTO_INCREMENT,
  Nome varchar(50) NOT NULL,
  PRIMARY KEY (Id),
  KEY SelectByNome (Nome)
);

CREATE TABLE IF NOT EXISTS Artistas (
  Id int(10) unsigned NOT NULL AUTO_INCREMENT,
  Nome varchar(50) NOT NULL,
  GeneroId int(10) unsigned NOT NULL,
  CountryId int(10) unsigned NOT NULL,
  PRIMARY KEY (Id),
  CONSTRAINT genero_Artistas FOREIGN KEY (GeneroId) REFERENCES Genero (Id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT contry_Artistas FOREIGN KEY (CountryId) REFERENCES Paises (Id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Relação MANY TO MANY de Albuns e Artistas
CREATE TABLE IF NOT EXISTS AlbunsArtistas (
  ArtistaId int(10) unsigned NOT NULL,
  AlbumId int(10) unsigned NOT NULL,
  Principal enum('true','false') NOT NULL,
  PRIMARY KEY (ArtistaId,AlbumId),
  KEY album_AlbunsArtistas (AlbumId),
  CONSTRAINT album_AlbunsArtistas FOREIGN KEY (AlbumId) REFERENCES Albuns (Id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT artista_AlbunsArtistas FOREIGN KEY (ArtistaId) REFERENCES Artistas (Id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Musicas (
  Id int(10) unsigned NOT NULL AUTO_INCREMENT,
  Nome varchar(100) NOT NULL,
  GeneroId int(10) unsigned NOT NULL,
  ArtistaId int(10) unsigned NOT NULL,
  AlbumId int(10) unsigned NOT NULL,
  PRIMARY KEY (Id),
  KEY buscaPorNome (Nome),
  KEY artista_musicas (ArtistaId),
  KEY genero_Musicas (GeneroId),
  KEY album_Musicas (AlbumId),
  CONSTRAINT artista_musicas FOREIGN KEY (ArtistaId) REFERENCES Artistas (Id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT genero_Musicas FOREIGN KEY (GeneroId) REFERENCES Genero (Id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT album_Musicas FOREIGN KEY (AlbumId) REFERENCES Albuns (Id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE MusicasComArtistaEAlbum (
	NomeMusica VARCHAR(100) NOT NULL,
	NomeArtista VARCHAR(50) NOT NULL,
	NomeAlbum INT(10) UNSIGNED NOT NULL,
	DataLancamento DATE NOT NULL
);

DROP TABLE IF EXISTS MusicasComArtistaEAlbum;
CREATE ALGORITHM=UNDEFINED DEFINER=root@localhost SQL SECURITY DEFINER VIEW MusicasComArtistaEAlbum AS select Musicas.Nome AS NomeMusica,Artistas.Nome AS NomeArtista,Albuns.Nome AS NomeAlbum,Albuns.AnoLancamento AS DataLancamento from (((Musicas join Albuns on((Musicas.AlbumId = Albuns.Id))) join AlbunsArtistas on((AlbunsArtistas.AlbumId = Albuns.Id))) join Artistas on((AlbunsArtistas.ArtistaId = Artistas.Id)));
