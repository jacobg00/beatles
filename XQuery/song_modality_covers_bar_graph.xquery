declare option saxon:output "method=html";
declare option saxon:output "doctype-public=-//W3C//DTD XHTML 1.0 Strict//EN";

declare variable $files := collection('../XML/?select=*.xml');
declare variable $lyric-file := doc('../XML/clean-lyricsrevised.xml'); 
declare variable $words-sep := doc('../XML/words_separated_per_song.xml');
declare variable $word-score := doc('../XML/word_score_total.xml');
declare variable $bbSongs := doc('../XML/beatles_billboard_songs_US.xml');
(:This XQuery generates the file song_modality_covers_bar_graph.html:)
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<title>Modality: Covers</title>
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
<h1>Song Modality: Cover Songs</h1>
<p>Is there a noteworthy difference between songs <em>written</em> by members of the band and songs written by others but recorded by The Beatles?</p>

<svg xmlns="http://www.w3.org/2000/svg" width="1000" height="600">
   <g alignment-baseline="baseline" transform="translate(0,600)">
   <text x="100" y="-550" fill="white">Tall lines (left) indicate high song modality score (emphasis on using very common words).</text>
  <text x="100" y="-500" fill="white">Short lines (right) indicate low song modality score (emphasis on using rare words).</text>
  <text x="100" y="-450" fill="white">Blue lines indicate songs written by The Beatles; red lines indicate cover songs.</text>
   {for $song in $words-sep//Q{}song[.//Q{}word]
let $words := $song/Q{}lyrics-counted/Q{}word,
    $score := avg(
        for $word in $words
        return $word/Q{}count/data() * 
        $word-score//Q{}word[./Q{}v/string() = $word/Q{}v/string()]/Q{}vScore/data()   )
order by $score descending
count $n
return 
    if ($song/Q{}cover/string()="True") then
<line x1="{($n * 4)}" y1="0" x2="{($n * 4)}" y2="{($score div -14)}" stroke="red" stroke-width="4"/>
   else
   <line x1="{($n * 4)}" y1="0" x2="{($n * 4)}" y2="{($score div -14)}" stroke="blue" stroke-width="4"/>
   }</g></svg>
<h2>Analysis</h2> 
<p>There is a roughly even distribution of cover songs across the spectrum, but it is not entirely even. The most significant effect is that the seventeen songs with the highest scores are all written by members of The Beatles. By cross-referencing this with <a href="/beatles/HTML/song_modality.html">the song modality score table</a> and <a href="/beatles/HTML/song_modality_chart_songs_bar_graph.html">the bar graph of chart songs</a>, we find that this includes the hits "P.S. I Love You", "Love Me Do", "She Loves You", and "All You Need Is Love".</p>
   
   </div></body></html>