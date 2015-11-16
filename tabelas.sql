CREATE DATABASE IF NOT EXISTS trabalho_lpbd;
USE trabalho_lpbd;

CREATE TABLE IF NOT EXISTS Albuns (
  Id SERIAL NOT NULL,
  Nome varchar(50) NOT NULL,
  AnoLancamento int NOT NULL,
  PRIMARY KEY (Id)
);

CREATE TABLE IF NOT EXISTS Genero (
  Id SERIAL NOT NULL,
  Nome varchar(50) NOT NULL,
  PRIMARY KEY (Id)
);
CREATE UNIQUE INDEX Nome ON Genero (Nome);

-- Lista de países.
CREATE TABLE IF NOT EXISTS Paises (
  Id SERIAL NOT NULL,
  Nome varchar(50) NOT NULL,
  PRIMARY KEY (Id)
);

CREATE TABLE IF NOT EXISTS Artistas (
  Id SERIAL NOT NULL,
  Nome varchar(50) NOT NULL,
  GeneroId int NOT NULL,
  CountryId int NOT NULL,
  PRIMARY KEY (Id),
  CONSTRAINT genero_Artistas FOREIGN KEY (GeneroId) REFERENCES Genero (Id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT contry_Artistas FOREIGN KEY (CountryId) REFERENCES Paises (Id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Relação MANY TO MANY de Albuns e Artistas
CREATE TABLE IF NOT EXISTS AlbunsArtistas (
  ArtistaId int NOT NULL,
  AlbumId int NOT NULL,
  Principal BOOLEAN NOT NULL,
  PRIMARY KEY (ArtistaId,AlbumId),
  CONSTRAINT album_AlbunsArtistas FOREIGN KEY (AlbumId) REFERENCES Albuns (Id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT artista_AlbunsArtistas FOREIGN KEY (ArtistaId) REFERENCES Artistas (Id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Musicas (
  Id SERIAL NOT NULL,
  Nome varchar(100) NOT NULL,
  GeneroId int NOT NULL,
  ArtistaId int NOT NULL,
  AlbumId int NOT NULL,
  PRIMARY KEY (Id),
  CONSTRAINT artista_musicas FOREIGN KEY (ArtistaId) REFERENCES Artistas (Id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT genero_Musicas FOREIGN KEY (GeneroId) REFERENCES Genero (Id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT album_Musicas FOREIGN KEY (AlbumId) REFERENCES Albuns (Id) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE SQL SECURITY DEFINER VIEW MusicasComArtistaEAlbum AS
  SELECT
    Musicas.Nome AS NomeMusica,
    Artistas.Nome AS NomeArtista,
    Albuns.Nome AS NomeAlbum,
    Albuns.AnoLancamento AS DataLancamento
  FROM
    Musicas
    join Albuns on Musicas.AlbumId = Albuns.Id
    join AlbunsArtistas on AlbunsArtistas.AlbumId = Albuns.Id
    join Artistas on AlbunsArtistas.ArtistaId = Artistas.Id;
