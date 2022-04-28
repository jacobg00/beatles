declare variable $files := collection('../XML/?select=*.xml');
declare variable $lyric-file := doc('../XML/clean-lyricsrevised.xml'); 

<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css"/>
<script src="/beatles/js/sticky.js"></script>
</head>
<body>
<div class="header">
        <img src="/beatles/images/Beatles_logo.svg"/>
        </div>
        <div id="navbar">
            <div class="navbar">
                
                <a href="/beatles/index.html">Home</a>
                
                <div class="dropdown">
                    <button class="dropbtn">About</button>
                    <div class="dropdown-content">
                        <a href="/beatles/HTML/research.html">Research Questions</a>
                        <a href="/beatles/HTML/method.html">Methodology</a>
                        <a href="/beatles/HTML/team.html">Team</a>                 
                    </div>
                </div>      
                
                <div class="dropdown">
                    <button class="dropbtn">Analysis</button>
                    <div class="dropdown-content">
                        <a href="/beatles/HTML/Songs_Per_Year.html">Songs Per Year</a>
                        <a href="/beatles/HTML/TVK_network_output.html">Network: Co-writers</a>
                        <a href="/beatles/HTML/word_count.html">Word Frequency Analysis</a>
                        <a href="/beatles/HTML/song_modality.html">Song Modality Analysis</a>
                    </div>                                 
                </div>
                
                <div class="dropdown">
                    <button class="dropbtn">Sources</button>
                    <div class="dropdown-content">
                        <a href="https://github.com/moizmb/beatles-lyrics">Lyrics</a>
                        <a href="http://www.mybeatles.net/charts.html">Charts</a>
                    </div>                                 
                </div>
            </div>
        </div>
        <div id="content">
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
return (<b>{$w}</b>, "&#x9;", <i>{$count}</i>, "&#10;")
}
</p>
</div>
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