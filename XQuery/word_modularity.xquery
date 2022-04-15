declare variable $files := collection('../XML/?select=*.xml');
declare variable $lyric-file := doc('../XML/clean-lyricsrevised.xml'); 
declare variable $words-sep := doc('../XML/words_separated_per_song.xml');
declare variable $word-score := doc('../XML/word_score_total.xml');

<html><head></head><body>

<table>
<tr><th>Song Title</th><th>Frequency</th><th>Modularity Score</th></tr>
{let $song := $words-sep//song
for $s in $song

return <tr><td>{$s/songName/string()}</td>,{
let $word := $s/lyrics-counted/word
for $w in $word

return (<td>{$w/v/string()}</td>,<td>{$w/count/data() * $word-score//word[./v/string() = $w/v/string()]/vScore/data()}</td>)

}</tr>






}
</table>

</body></html>