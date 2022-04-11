declare option saxon:output "method=text";

declare variable $files := collection('../XML/?select=*.xml');
declare variable $lyric-file := doc('../XML/clean-lyricsrevised.xml'); 

let $words := $lyric-file//song/lyrics/text()/tokenize(normalize-space(.),'\s')
for $w in distinct-values($words)
let $count := count($words[. = $w])
return concat($w, "&#x9;", $count, "&#10;")

(:  whc: To give due credit, the fundamental structure of this xquery was taken from 
https://stackoverflow.com/questions/15122641/count-number-of-word-occurrences-in-strings-using-xquery
 It was then adapted for the XML markup and XPath of the Beatles lyrics file.  :)