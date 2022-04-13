declare variable $files := collection('../XML/?select=*.xml');
declare variable $lyric-file := doc('../XML/clean-lyricsrevised.xml'); 

<html>
<head></head>
<body>
<ol>{
let $song := $lyric-file//song
for $s in $song
return <li>{$s/songName/text()}
<ul>{
let $words := $s/lyrics/string()=>string-join()=>lower-case()
let $words-cleaned := replace($words, '[,|"|!|\.|(|)|\?|;|\[|\]]+', ' ') => normalize-space()
let $words-separate := tokenize($words-cleaned, '\s')
for $w in distinct-values($words-separate)
let $count := count($words-separate[. = $w])
order by $count descending
return <li>{$w}, {$count}  </li>}
</ul>
</li>}
</ol>
</body>
</html>