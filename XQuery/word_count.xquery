declare option saxon:output "method=text";

declare variable $files := collection('../XML/?select=*.xml');
declare variable $lyric-file := doc('../XML/clean-lyricsrevised.xml'); 

let $words := $lyric-file//song/lyrics/string()=>string-join()=>lower-case()
let $words-cleaned := replace($words, '[,|"|!|\.|(|)|\?|;|\[|\]]+', ' ') => normalize-space()
let $words-separate := tokenize($words-cleaned, '\s')
for $w in distinct-values($words-separate)
let $count := count($words-separate[. = $w])
order by $count descending
return concat($w, "&#x9;", $count, "&#10;")


(:whc: I made two changes. First, note the addition of the lower-case() function in the 
definition of the $words variable. This collapses the distinction between, say, "The" and "the".
Second, I got replace() to work. There are two options here. In the second argument, you could
use '[\W]+' which would pick up any non-letter, non-number, non-space character (i.e. any
punctuation at all). But then the word I'll gets reduced to two words, I and ll. So instead,
I systematically removed all other punctuation. Note the need for the pipe | operator between
each possibility and the + at the end in case there's more than one in a row. Now, if you want 
to get rid of apostrophes too, just make that switch; but it will play havoc with words such as
won't and shouldn't. Whether you want to go down that path depends on your textual analysis 
purposes. You could also get rid of 's which would at least remove one set of anomalies.:)

(:  whc: To give due credit, the fundamental structure of this xquery was taken from 
https://stackoverflow.com/questions/15122641/count-number-of-word-occurrences-in-strings-using-xquery
 It was then adapted for the XML markup and XPath of the Beatles lyrics file.  :)