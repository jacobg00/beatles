(: This first expression returns the songs with love in them, the ones that were sung by Lennon, and prints out a statement about this:)
(:let $song := //song
let $lyricsLove := $song[lyrics/matches(.,'love','i')]=>count()
let $LennonLove := $song[lyrics/matches(.,'love','i') and songWrite[@writer/matches(.,'Lennon')]]=>count()

return (concat ("&#xa;", "Out of the ", $lyricsLove, " songs that have the word love in them,John Lennon sings ", $LennonLove, " of them."))
:)
(: On this seccond one I was trying to display the number of times love is said in that song:)
let $song:=//song
let $numberLove := $song//count(//lyrics//text()[contains(..,'love')])
let $songName :=$song[lyrics/matches(.,'love','i')]/songName/text()
for $songN in $songName
order by $songN
return (concat ("&#xa;", "In ", $songN, "love is said", $numberLove))