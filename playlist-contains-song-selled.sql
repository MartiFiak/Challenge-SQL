select *
from (WITH SoldTracks AS (SELECT TrackId
                          FROM invoice_items
                          GROUP BY TrackId
                          HAVING COUNT(*) >= 2)
      SELECT p.PlaylistId,
             p.Name,
             case
                 when round((CAST(COUNT(DISTINCT CASE
                                                     WHEN st.TrackId IS NOT NULL THEN t.TrackId
                                                     when null then 0 END) AS FLOAT) /
                             CAST(COUNT(DISTINCT t.TrackId) AS FLOAT)) * 100, 4) is not null then round(
                             (CAST(COUNT(DISTINCT CASE
                                                      WHEN st.TrackId IS NOT NULL THEN t.TrackId
                                                      when null then 0 END) AS FLOAT) /
                              CAST(COUNT(DISTINCT t.TrackId) AS FLOAT)) * 100, 4)
                 else 0 end
                 AS [% song selled twice]
      FROM playlists p
               Left JOIN
           playlist_track pt ON p.PlaylistId = pt.PlaylistId
               Left JOIN
           tracks t ON pt.TrackId = t.TrackId
               LEFT JOIN
           SoldTracks st ON t.TrackId = st.TrackId
      GROUP BY p.PlaylistId, p.Name
      order by p.PlaylistId)