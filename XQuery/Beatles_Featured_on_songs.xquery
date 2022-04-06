declare option saxon:output "method=text";

declare variable $files := collection('../XML/?select=*.xml');
declare variable $lyric-file := doc('../XML/clean-lyricsrevised.xml'); 
declare variable $bbSongs := doc('../XML/beatles_billboard_songs_US.xml');
declare variable $bbAlbums := doc('../XML/beatles_billboard_albums_US.xml');

let $lyric-songs := $lyric-file//song
let $lyric-song-titles := $lyric-songs/songName/data(@name)

let $chart-songs := $bbSongs//billboardSong
let $chart-song-titles := $chart-songs/songName/data(@name)


let $lyric-album-titles := $lyric-songs/album/data(@title)
let $lyric-album-distinct := $lyric-album-titles => distinct-values()

for $album-name in $lyric-album-distinct 
let $count-album-distinct :=$lyric-album-distinct => count()
let $lyric-songWrite := $lyric-songs/songWrite/data(@writer) 


order by $album-name
return ($album-name, $lyric-songWrite)


