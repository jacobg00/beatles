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
</div>
</body>
</html>