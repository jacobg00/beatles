declare variable $files := collection('../XML/?select=*.xml');
declare variable $lyric-file := doc('../XML/clean-lyricsrevised.xml');
declare variable $bbSongs := doc('../XML/beatles_billboard_songs_US.xml');
declare variable $bbAlbums := doc('../XML/beatles_billboard_albums_US.xml');
(:
<svg
    xmlns="http://www.w3.org/2000/svg"
    width="100%"
    height="100%">
    <desc></desc>
    
    <g
        alignment-baseline="baseline"
        transform="translate (50, 10)">
        <g
            alignment-baseline="baseline">:)
<html>
    <head>
        <title>Song's Billboard Appearance vs. Release Date</title>
    </head>
    <body>
        <h1>Song's Billboard Appearance vs. Release Date</h1>
        <table>
            <tr>
                <th>Song</th>
                <th>Year of Release</th>
                <th>Year on the Billboard Charts</th>
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
              
                 return <tr><td>{$chart-song-title}</td> <td>{$chart-lyrics-year}</td> <td>{$chart-song-year}</td></tr>
                    (:whc: you needed to use XPath/XQuery comment tags below, not XML tags:)
                    (:<g>
                        <text x="25" y="{10*$n}" font-family="impact" font-size="10px" fill="black"> {$chart-song-title}</text>
                        <text x="250" y="{10*$n}" font-family="impact" font-size="10px" fill="black"> {$chart-lyrics-year}</text>
                        <text x="325" y="{10*$n}" font-family="impact" font-size="10px" fill="black"> {$chart-song-year}</text>
                    </g>:)
            }  <!--whc: you also needed to add a curly brace here -->
        </table>
    </body>
</html>
(:<!--
            }
        </g>
    </g>
</svg>
-->
:)