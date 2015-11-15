CREATE DATABASE IF NOT EXISTS teste;
USE teste;


CREATE TABLE IF NOT EXISTS Albuns (
  Id int(10) unsigned NOT NULL AUTO_INCREMENT,
  Nome int(10) unsigned NOT NULL DEFAULT '0',
  DataLancamento date NOT NULL,
  PRIMARY KEY (Id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS AlbunsArtistas (
  ArtistaId int(10) unsigned NOT NULL,
  AlbumId int(10) unsigned NOT NULL,
  Principal enum('true','false') NOT NULL,
  PRIMARY KEY (ArtistaId,AlbumId),
  KEY album_AlbunsArtistas (AlbumId),
  CONSTRAINT album_AlbunsArtistas FOREIGN KEY (AlbumId) REFERENCES Albuns (Id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT artista_AlbunsArtistas FOREIGN KEY (ArtistaId) REFERENCES Artistas (Id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Relação MANY TO MANY de Albuns e Artistas';

CREATE TABLE IF NOT EXISTS Artistas (
  Id int(10) unsigned NOT NULL AUTO_INCREMENT,
  Nome varchar(50) NOT NULL,
  Genero int(10) unsigned NOT NULL,
  Country int(11) DEFAULT NULL,
  PRIMARY KEY (Id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS Genero (
  Id int(10) unsigned NOT NULL AUTO_INCREMENT,
  Nome varchar(50) NOT NULL,
  PRIMARY KEY (Id),
  KEY Nome (Nome)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS Musicas (
  Id int(10) unsigned NOT NULL AUTO_INCREMENT,
  Nome varchar(100) NOT NULL COMMENT 'Maior música ja feita: "Several Species Os Small Furry Animals Gathered Together In A Cave And Grooving With A Pict."',
  GeneroId int(10) unsigned NOT NULL,
  ArtistaId int(10) unsigned NOT NULL,
  AlbumId int(10) unsigned NOT NULL,
  PRIMARY KEY (Id),
  KEY buscaPorNome (Nome),
  KEY artista_musicas (ArtistaId),
  KEY genero_Musicas (GeneroId),
  KEY album_Musicas (AlbumId),
  CONSTRAINT artista_musicas FOREIGN KEY (ArtistaId) REFERENCES Artistas (Id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT genero_Musicas FOREIGN KEY (GeneroId) REFERENCES Genero (Id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE MusicasComArtistaEAlbum (
	NomeMusica VARCHAR(100) NOT NULL COMMENT 'Maior música ja feita: "Several Species Os Small Furry Animals Gathered Together In A Cave And Grooving With A Pict."' COLLATE 'latin1_swedish_ci',
	NomeArtista VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	NomeAlbum INT(10) UNSIGNED NOT NULL,
	DataLancamento DATE NOT NULL
) ENGINE=MyISAM;

CREATE TABLE IF NOT EXISTS Paises (
  Id int(10) unsigned NOT NULL AUTO_INCREMENT,
  Nome varchar(50) NOT NULL,
  PRIMARY KEY (Id),
  KEY SelectByNome (Nome)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Lista de países.';

DROP TABLE IF EXISTS MusicasComArtistaEAlbum;
CREATE ALGORITHM=UNDEFINED DEFINER=root@localhost SQL SECURITY DEFINER VIEW MusicasComArtistaEAlbum AS select Musicas.Nome AS NomeMusica,Artistas.Nome AS NomeArtista,Albuns.Nome AS NomeAlbum,Albuns.DataLancamento AS DataLancamento from (((Musicas join Albuns on((Musicas.AlbumId = Albuns.Id))) join AlbunsArtistas on((AlbunsArtistas.AlbumId = Albuns.Id))) join Artistas on((AlbunsArtistas.ArtistaId = Artistas.Id)));
