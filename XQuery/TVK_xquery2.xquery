(: written for demo purposes by Dr. Campbell 3/25/22 :)
let $song := //song
let $songName := $song/songName
for $s in $song
let $sName := $s/songName
let $sAlbum := $s[$sName = songName]/album
return concat("&#xa;", "The song ", $sName,
" appears on the album ", $sAlbum, ".")
