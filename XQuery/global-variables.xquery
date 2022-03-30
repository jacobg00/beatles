(:declare variable $files := collection('../XML/?select=*.xml'); :)
declare variable $lyric-file := ../XML/clean-lyricsrevised.xml;
(: declare variable $bbSongs := ../XML/beatles_billboard_songs_US.xml; :)
let $bbAlbums := ../XML/beatles_billboard_albums_US.xml

return $lyric-file//song[1]/songName/text()