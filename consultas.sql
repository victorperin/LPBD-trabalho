SELECT
  Albuns.Id,
  Albuns.Nome,
  Albuns.AnoLancamento
FROM Albuns
  JOIN AlbunsArtistas ON AlbunsArtistas.AlbumId = Albuns.Id
  JOIN Artistas ON Artistas.Id = AlbunsArtistas.ArtistaId
WHERE
  Artistas.Nome like '%Asking%';

SELECT
  bandaEMusica(NomeMusica,NomeArtista)
FROM MusicasComArtistaEAlbum
WHERE
  NomeArtista = 'Sleeping With Sirens';

  SELECT
    NomeArtista,
    NomeAlbum,
    COUNT(NomeMusica) AS QuantidadeDeMusicas
  FROM MusicasComArtistaEAlbum
  GROUP BY  NomeArtista, NomeAlbum
  ORDER BY QuantidadeDeMusicas DESC;
