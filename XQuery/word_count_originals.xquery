declare variable $files := collection('../XML/?select=*.xml');
declare variable $lyric-file := doc('../XML/clean-lyricsrevised.xml'); 

<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css"/>
</head>
<body>
<h1>Word Count in Original Songs</h1>
<p>This page displays every individual word that shows up in an original song written and performed by The Beatles. It is displayed as a large block of text, rather than a table. It was decided that the large block of text is actually more fitting than a very long table that would need to extend very far down or across the page. This page was created as a way to compare the frequency of words in songs written by The Beatles with songs covered by The Beatles on the covers page, as well as with all songs performed by The Beatles on the discography page.</p>
<p>
{
let $words := $lyric-file//song[./cover/@status="False"]/lyrics/string()=>string-join()=>lower-case()
let $words-cleaned := replace($words, '[,|"|!|\.|(|)|\?|;|\[|\]]+', ' ') => normalize-space()
let $words-separate := tokenize($words-cleaned, '\s')
for $w in distinct-values($words-separate)
let $count := count($words-separate[. = $w])
order by $count descending
return (<b>{$w}</b>, "&#x9;", $count, "&#10;")
}
</p>
</body>
</html>