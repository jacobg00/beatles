(: declare variable $files := collection('../XML/?select=*.xml');  :)
let $lyric-file := clean-lyricsrevised.xml  
(: declare variable $bbSongs := ../XML/beatles_billboard_songs_US.xml; :)
let $bbAlbums := ../XML/beatles_billboard_albums_US.xml




return //song[1]/songName/text()