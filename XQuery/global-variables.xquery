declare option saxon:output "method=text";

declare variable $files := collection('../XML/?select=*.xml');
declare variable $lyric-file := doc('../XML/clean-lyricsrevised.xml'); 
declare variable $bbSongs := doc('../XML/beatles_billboard_songs_US.xml');
declare variable $bbAlbums := doc('../XML/beatles_billboard_albums_US.xml');

let $chart-songs := $bbSongs//billboardSong

for $cs in $chart-songs
let $chart-song-title := $cs/songName/text()
let $chart-song-date := $cs/date/string()
let $chart-lyrics := $lyric-file//song[./songName/data(@name) =
$cs/songName/data(@name)]/lyrics/string()

return concat($chart-song-date, "&#x9;", $chart-song-title, "&#x9;", $chart-lyrics, "&#10;")
