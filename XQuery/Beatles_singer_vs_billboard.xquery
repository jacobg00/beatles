declare variable $files := collection('../XML/?select=*.xml');
declare variable $lyric-file := doc('../XML/clean-lyricsrevised.xml'); 
declare variable $bbSongs := doc('../XML/beatles_billboard_songs_US.xml');
declare variable $bbAlbums := doc('../XML/beatles_billboard_albums_US.xml');

let $lyric-songs := $lyric-file//song
let $lyric-song-titles := $lyric-songs/songName/data(@name)

let $chart-songs := $bbSongs//billboardSong
let $chart-song-titles := $chart-songs/songName/data(@name)


let $songYear := $lyric-songs/year
let $songYearDistinct := $songYear => distinct-values()

for $year in $songYearDistinct

let $songYearCount := $lyric-songs[./year = $year] => count()

order by $year
return concat("&#xa;", $year, " ", $songYearCount)


