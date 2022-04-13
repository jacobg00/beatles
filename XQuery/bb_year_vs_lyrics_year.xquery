declare variable $files := collection('../XML/?select=*.xml');
declare variable $lyric-file := doc('../XML/clean-lyricsrevised.xml');
declare variable $bbSongs := doc('../XML/beatles_billboard_songs_US.xml');
declare variable $bbAlbums := doc('../XML/beatles_billboard_albums_US.xml');

<html>
    <head>
        <title>Song's Billboard Appearance vs. Release Date</title>
    </head>
    <body>
        <h1>Song's Billboard Appearance vs. Release Date</h1>
        <table>
            <tr>
                <th>Song</th>
                <th>Released </th>
                <th>&#x9;</th>
                <th>Billboard Charts</th>
            </tr>            
            {
                let $chart-songs := $bbSongs//Q{}billboardSong
                
                
                for $cs in $chart-songs
                let $chart-song-title := $cs/Q{}songName/text()
                let $chart-song-date := $cs/Q{}date/string()
                let $chart-song-year := $cs/Q{}date/Q{}year/string()
                let $chart-lyrics-year := $lyric-file//Q{}song[./Q{}songName/data(@name) =
                $cs/Q{}songName/data(@name)]/Q{}year/string()
                count $n
              
                 return <tr><td>{$chart-song-title}</td> <td>{$chart-lyrics-year}</td><td>&#x9;</td> <td>{$chart-song-year}</td></tr>
                   
            }  <!--whc: you also needed to add a curly brace here -->
        </table>
    </body>
</html>
