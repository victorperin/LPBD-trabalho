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
-- Copiando dados para a tabela trabalho_lpbd.Albuns: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `Albuns` DISABLE KEYS */;
INSERT INTO `Albuns` (`Id`, `Nome`, `AnoLancamento`) VALUES
	(1, 'From Death To Destiny', 2013),
	(2, 'Common Courtesy', 2013),
	(3, 'Reckless and Relentless', 2011),
	(4, 'Stand Up and Scream', 2009),
	(5, 'Madness', 2015),
	(6, 'Feel', 2013),
	(7, 'Lets Cheer To This', 2011),
	(8, 'With Ears To See And Eyes To Hear', 2010);
/*!40000 ALTER TABLE `Albuns` ENABLE KEYS */;

-- Copiando dados para a tabela trabalho_lpbd.AlbunsArtistas: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `AlbunsArtistas` DISABLE KEYS */;
INSERT INTO `AlbunsArtistas` (`ArtistaId`, `AlbumId`, `Principal`) VALUES
	(1, 1, 'true'),
	(1, 3, 'true'),
	(1, 4, 'true'),
	(3, 5, 'true'),
	(3, 6, 'true'),
	(3, 7, 'true'),
	(3, 8, 'true'),
	(8, 2, 'true');
/*!40000 ALTER TABLE `AlbunsArtistas` ENABLE KEYS */;

-- Copiando dados para a tabela trabalho_lpbd.Artistas: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `Artistas` DISABLE KEYS */;
INSERT INTO `Artistas` (`Id`, `Nome`, `GeneroId`, `CountryId`) VALUES
	(1, 'Asking Alexandria', 1, 1),
	(2, 'Escape The Fate', 2, 2),
	(3, 'Sleeping With Sirens', 2, 2),
	(4, 'In This Momment', 1, 2),
	(5, 'Falling in Reverse', 2, 2),
	(6, 'Nx0', 4, 3),
	(8, 'A Day To Remember', 1, 2),
	(9, 'Fresno', 4, 3);
/*!40000 ALTER TABLE `Artistas` ENABLE KEYS */;

-- Copiando dados para a tabela trabalho_lpbd.Genero: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `Genero` DISABLE KEYS */;
INSERT INTO `Genero` (`Id`, `Nome`) VALUES
	(9, 'Country Rock'),
	(11, 'Eletronica'),
	(4, 'Emocore'),
	(1, 'Metalcore'),
	(3, 'Pop Punk'),
	(2, 'Post-Hardcore'),
	(10, 'Rock');
/*!40000 ALTER TABLE `Genero` ENABLE KEYS */;

-- Copiando dados para a tabela trabalho_lpbd.Musicas: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `Musicas` DISABLE KEYS */;
INSERT INTO `Musicas` (`Id`, `Nome`, `GeneroId`, `ArtistaId`, `AlbumId`) VALUES
	(1, 'Gold', 2, 3, 5),
	(3, 'Go Go Go', 2, 3, 5),
	(6, 'Fly', 2, 3, 5),
	(10, 'The Strays', 2, 3, 5),
	(11, 'Killing You', 1, 1, 1),
	(13, 'Poison', 1, 1, 1),
	(14, 'Welcome', 1, 1, 3);
/*!40000 ALTER TABLE `Musicas` ENABLE KEYS */;

-- Copiando dados para a tabela trabalho_lpbd.Paises: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `Paises` DISABLE KEYS */;
INSERT INTO `Paises` (`Id`, `Nome`) VALUES
	(3, 'Brasil'),
	(4, 'Canada'),
	(2, 'Estados Unidos'),
	(1, 'Inglaterra'),
	(5, 'Russia');
/*!40000 ALTER TABLE `Paises` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
