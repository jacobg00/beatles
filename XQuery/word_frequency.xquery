(:
declare option saxon:output "method=text";

declare variable $files := collection('../XML/?select=*.xml');
declare variable $lyric-file := doc('../XML/clean-lyricsrevised.xml'); 
declare variable $bbSongs := doc('../XML/beatles_billboard_songs_US.xml');
declare variable $bbAlbums := doc('../XML/beatles_billboard_albums_US.xml');

let $lyric-songs := $lyric-file//song
let $lyric-song-titles := $lyric-songs/songName/data(@name)
let $chart-songs := $bbSongs//billboardSong
let $chart-song-titles := $chart-songs/songName/data(@name)
:)

<html>
    <head>
        <title>Word Frequency</title>
    </head>
    <body>
        <h1>Notable Word Frequency in The Beatles Discography</h1>
        <table>
            <tr>
                <th>Song</th>
                <th>Love</th>
                <th>War</th>
                <th>Peace</th>
            </tr>
            {
                let $song:=//song
                let $songN := $song/songName/text()
                let $loveSongName :=$song[lyrics/matches(.,'love','i')]/songName/text()
                let $warSongName := $song[lyrics/matches(.,'war','i')]/songName/text()
                let $peaceSongName := $song[lyrics/matches(.,'peace','i')]/songName/text()
                for $s in $song
                let $numberLove := $song[./songName/text() = $songN]//lyrics/text()
                ! replace(., "love", " love ", "i") 
                ! (tokenize(.)[. = 'love'] => count())

                let $numberWar := $song[./songName/text() = $songN]//lyrics/text()
                ! replace(., "war", " war ", "i") 
                ! (tokenize(.)[. = 'war'] => count())
     
                let $numberPeace := $song[./songName/text() = $songN]//lyrics/text()
                ! replace(., "peace", " peace ", "i") 
                ! (tokenize(.)[. = 'peace'] => count())
                return <tr><td>{$s/songName/text()}</td> <td>{$numberLove}</td> <td>{$numberWar}</td> <td>{$numberPeace}</td></tr>
            }
        </table>
    </body>
</html>