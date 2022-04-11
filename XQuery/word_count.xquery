declare option saxon:output "method=text";

declare variable $files := collection('../XML/?select=*.xml');
declare variable $lyric-file := doc('../XML/clean-lyricsrevised.xml'); 

let $words := $lyric-file//song/lyrics/text()/tokenize(normalize-space(.),'\s')
for $w in distinct-values($words)
let $count := count($words[. = $w])
return concat($w, "&#x9;", $count, "&#10;")


(:The next step will be to remove most punctuation, with the likely exception of 
the apostrophe, at least for now. Look at the following XPath, which is designed
to take the second song (the first is an instrumental) and use the replace() function
to replace commas and periods with a single whitespace. Try to fit this in to the 
$words definition above. Note that string() and text() do nearly the same thing, though
sometimes there is reason to prefer one over the other. Once you get this to run, start
adding in other punctuation that you still see showing up in the results.:)

(:  whc: To give due credit, the fundamental structure of this xquery was taken from 
https://stackoverflow.com/questions/15122641/count-number-of-word-occurrences-in-strings-using-xquery
 It was then adapted for the XML markup and XPath of the Beatles lyrics file.  :)