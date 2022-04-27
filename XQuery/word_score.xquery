declare variable $files := collection('../XML/?select=*.xml');
declare variable $lyric-file := doc('../XML/clean-lyricsrevised.xml'); 
declare variable $word-score := doc ('../XML/word_score_total.xml');
(:whc: This xquery generates the XML file words_separated_per_song.xml.:)
<root>
{let $song := $lyric-file//song
for $s in $song
return <song><songName>{$s/songName/text()}</songName>
<cover>{$s/cover/string()}</cover>
<year>{$s/year/data()}</year>
<lyrics-counted>{
let $words := $s/lyrics/string()=>string-join()=>lower-case()
let $words-cleaned := replace($words, '[,|"|!|\.|(|)|\?|;|\[|\]]+', ' ') => normalize-space()
let $words-separate := tokenize($words-cleaned, '\s')
for $w in distinct-values($words-separate)
let $count := count($words-separate[. = $w])
order by $count descending
return <word><v>{$w}</v><count>{$count}</count></word>}
</lyrics-counted>
</song>}
</root>