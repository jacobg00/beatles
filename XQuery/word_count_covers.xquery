declare variable $files := collection('../XML/?select=*.xml');
declare variable $lyric-file := doc('../XML/clean-lyricsrevised.xml'); 

<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css"/>
</head>
<body>
<h1>Word Count in Cover Songs</h1>
<p>This page displays every individual word that shows up in an original song written and performed by The Beatles. It is displayed as a large block of text, rather than a table. It was decided that the large block of text is actually more fitting than a very long table that would need to extend very far down or across the page. This page was created as a way to compare the frequency of words in songs covered by The Beatles with songs written by The Beatles on the originals page, as well as with all Beatles songs on the discography page.</p>
<p>
{
let $words := $lyric-file//song[./cover/@status="True"]/lyrics/string()=>string-join()=>lower-case()
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




(:The next step will be to remove most punctuation, with the likely exception of 
the apostrophe, at least for now. Look at the following XPath, which is designed
to take the second song (the first is an instrumental) and use the replace() function
to replace commas and periods with a single whitespace. Try to fit this in to the 
$words definition above. Note that string() and text() do nearly the same thing, though
sometimes there is reason to prefer one over the other. Once you get this to run, start
adding in other punctuation that you still see showing up in the results.:)

(: Here is the XPath mentioned above:
//song[2]/lyrics/string()!replace(., '[,\.]', ' ')
:)

(:  whc: To give due credit, the fundamental structure of this xquery was taken from 
https://stackoverflow.com/questions/15122641/count-number-of-word-occurrences-in-strings-using-xquery
 It was then adapted for the XML markup and XPath of the Beatles lyrics file.  :)