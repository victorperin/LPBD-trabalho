-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.0.21-MariaDB - MariaDB Server
-- OS do Servidor:               Linux
-- HeidiSQL Versão:              9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Copiando estrutura do banco de dados para trabalho_aps
CREATE DATABASE IF NOT EXISTS `trabalho_aps` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `trabalho_aps`;


-- Copiando estrutura para tabela trabalho_aps.Albuns
CREATE TABLE IF NOT EXISTS `Albuns` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Nome` int(10) unsigned NOT NULL DEFAULT '0',
  `DataLancamento` date NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Exportação de dados foi desmarcado.


-- Copiando estrutura para tabela trabalho_aps.AlbunsArtistas
CREATE TABLE IF NOT EXISTS `AlbunsArtistas` (
  `ArtistaId` int(10) unsigned NOT NULL,
  `AlbumId` int(10) unsigned NOT NULL,
  `Principal` enum('true','false') NOT NULL,
  PRIMARY KEY (`ArtistaId`,`AlbumId`),
  KEY `album_AlbunsArtistas` (`AlbumId`),
  CONSTRAINT `album_AlbunsArtistas` FOREIGN KEY (`AlbumId`) REFERENCES `Albuns` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `artista_AlbunsArtistas` FOREIGN KEY (`ArtistaId`) REFERENCES `Artistas` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Relação MANY TO MANY de Albuns e Artistas';

-- Exportação de dados foi desmarcado.


-- Copiando estrutura para tabela trabalho_aps.Artistas
CREATE TABLE IF NOT EXISTS `Artistas` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Nome` varchar(50) NOT NULL,
  `Genero` int(10) unsigned NOT NULL,
  `Country` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Exportação de dados foi desmarcado.


-- Copiando estrutura para tabela trabalho_aps.Genero
CREATE TABLE IF NOT EXISTS `Genero` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Nome` varchar(50) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `Nome` (`Nome`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Exportação de dados foi desmarcado.


-- Copiando estrutura para tabela trabalho_aps.Musicas
CREATE TABLE IF NOT EXISTS `Musicas` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Nome` varchar(100) NOT NULL COMMENT 'Maior música ja feita: "Several Species Os Small Furry Animals Gathered Together In A Cave And Grooving With A Pict."',
  `GeneroId` int(10) unsigned NOT NULL,
  `ArtistaId` int(10) unsigned NOT NULL,
  `AlbumId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `buscaPorNome` (`Nome`),
  KEY `artista_musicas` (`ArtistaId`),
  KEY `genero_Musicas` (`GeneroId`),
  KEY `album_Musicas` (`AlbumId`),
  CONSTRAINT `artista_musicas` FOREIGN KEY (`ArtistaId`) REFERENCES `Artistas` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `genero_Musicas` FOREIGN KEY (`GeneroId`) REFERENCES `Genero` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Exportação de dados foi desmarcado.


-- Copiando estrutura para view trabalho_aps.MusicasComArtistaEAlbum
-- Criando tabela temporária para evitar erros de dependência de VIEW
CREATE TABLE `MusicasComArtistaEAlbum` (
	`NomeMusica` VARCHAR(100) NOT NULL COMMENT 'Maior música ja feita: "Several Species Os Small Furry Animals Gathered Together In A Cave And Grooving With A Pict."' COLLATE 'latin1_swedish_ci',
	`NomeArtista` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`NomeAlbum` INT(10) UNSIGNED NOT NULL,
	`DataLancamento` DATE NOT NULL
) ENGINE=MyISAM;


-- Copiando estrutura para tabela trabalho_aps.Paises
CREATE TABLE IF NOT EXISTS `Paises` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Nome` varchar(50) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `SelectByNome` (`Nome`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Lista de países.';

-- Exportação de dados foi desmarcado.


-- Copiando estrutura para view trabalho_aps.MusicasComArtistaEAlbum
-- Removendo tabela temporária e criando a estrutura VIEW final
DROP TABLE IF EXISTS `MusicasComArtistaEAlbum`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `MusicasComArtistaEAlbum` AS select `Musicas`.`Nome` AS `NomeMusica`,`Artistas`.`Nome` AS `NomeArtista`,`Albuns`.`Nome` AS `NomeAlbum`,`Albuns`.`DataLancamento` AS `DataLancamento` from (((`Musicas` join `Albuns` on((`Musicas`.`AlbumId` = `Albuns`.`Id`))) join `AlbunsArtistas` on((`AlbunsArtistas`.`AlbumId` = `Albuns`.`Id`))) join `Artistas` on((`AlbunsArtistas`.`ArtistaId` = `Artistas`.`Id`)));
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
