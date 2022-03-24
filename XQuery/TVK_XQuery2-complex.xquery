let $song := //song
let $albname := //@title =>string-join("&#xa;") (: only returns 292 results tried distinct-values but couldn't make it work:)
let $songAnt2 := //$song[.//@title="Anthology 2"]
let $songLIB := //$song[.//@title="Let_It_Be"]
let $songHelp := //$song[.//@title="Help!"]
let $songAnt1 := //$song[.//@title="Anthology 1"]
let $songWTB := //$song[.//@title="With_the_Beatles"]
let $songAnt3 := //$song[.//@title="Anthology 3"]
let $songYS := //$song[.//@title="Yellow_Submarine"]
let $SongMMT := //$song[.//@title="Magical_Mystery_Tour"]
let $SongAHDN := //$song[.//@title=" A_Hard_Day's_Night"]
let $SongRev := //$song[.//@title="Revolver"]
let $SongPPM := //$song[.//@title="Please_Please_Me"]
let $SongBFS := //$song[.//@title="Beatles_for_Sale"]
let $SongTB := //$song[.//@title="The_Beatles"]
let $SongOldies := //$song[.//@title="A_Collection_of_Beatles_Oldies"]
let $SongBoot := //$song[.//@title="The_Beatles_Bootleg_Recordings_1963"]
let $Song67-70 := //$song[.//@title="1967-1970"]
let $SongBBC2 := //$song[.//@title="On_Air – Live_at_the_BBC_Volume 2"]
let $SongAbro := //$song[.//@title="Abbey Road"]
let $SongFly :=//$song[.//@title="Let_It_Be..._Naked_-_Fly_on_the_Wall_bonus_disc"]
let $SongSgtPep := //$song[.//@title="Sgt._Pepper's_Lonely_Hearts_Club_Band"]
let $SongBBC1 := //$song[.//@title="Live_at_the_BBC"]
let $SongXmas := //$song[.//@title="The_Beatles'_Christmas_Album"]
let $SongRS := //$song[.//@title="Rubber_Soul"]
let $SongUR := //$song[.//@title="Unreleased"]
let $SongSall := //$song[.//@title="Long_Tall_Sally_EP"]
let $SongPast := //$song[.//@title="Past_Masters_Volume 1"]
let $SongRNR := //$song[.//@title="Rock 'n' Roll_Music"]
let $Songhamburg := //$song[.//@title="Live! at_the_Star-Club_in_Hamburg, Germany; 1962"]
let $SongRare := //$song[.//@title="Rarities"]
let $SongLIBFilm := //$song[.//@title="Let_it_Be_film"]
let $year :=//year
for $date  in $year
return (concat ("&#xa;", "On the album, ", $albname," the song ", $song, " was written in ", $year ))


