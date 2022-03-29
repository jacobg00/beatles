(: whc: this is a sample XQuery that counts how many songs were released in each year.
The source is expected to be the lyrics file.:)

let $song := //song

let $songYear := $song/year
let $songYearDistinct := $songYear => distinct-values()

for $year in $songYearDistinct

let $songYearCount := $song[./year = $year] => count()

order by $year
return concat("&#xa;", $year, " ", $songYearCount)


