declare option saxon:output "method=text";

declare variable $files := collection('../XML/?select=*.xml');
declare variable $lyric-file := doc('../XML/clean-lyricsrevised.xml'); 

let $words := $lyric-file//song[./cover/@status="False"]/lyrics/string()=>string-join()=>lower-case()
let $words-cleaned := replace($words, '[,|"|!|\.|(|)|\?|;|\[|\]]+', ' ') => normalize-space()
let $words-separate := tokenize($words-cleaned, '\s')
for $w in distinct-values($words-separate)
let $count := count($words-separate[. = $w])
order by $count descending
return concat($w, "&#x9;", $count, "&#10;")