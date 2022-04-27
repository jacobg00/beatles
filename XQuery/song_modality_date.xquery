declare variable $files := collection('../XML/?select=*.xml');
declare variable $lyric-file := doc('../XML/clean-lyricsrevised.xml'); 
declare variable $words-sep := doc('../XML/words_separated_per_song.xml');
declare variable $word-score := doc('../XML/word_score_total.xml');
declare variable $bbSongs := doc('../XML/beatles_billboard_songs_US.xml');
(:This XQuery generates the file song_modality_over_time.html :)
<html><head><title>Modality: Date</title>
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
<h1>Song Modality: Trends Over Time</h1>
<p>Is there a noteworthy difference in word usage patterns over time? </p>
<p>Chronologically, the key date to look for is <b>1964</b>, since The Beatles began their first US tour -- commonly known as 
<a href="https://www.britannica.com/event/British-Invasion">"The British Invasion"</a> -- with a concert in New York City
on February 7th of that year. This tour made them a phenomenal success; it also represented their exposure to a new 
music market that, while it clearly loved them, could have different tastes. Their songwriting, and their choice of cover
 songs to record, may have responded to some extent to that market. Did it, and if so, to what extent?</p>

<svg xmlns="http://www.w3.org/2000/svg" width="1200" height="600">
   <g alignment-baseline="baseline" transform="translate(0,600)">
   <text x="100" y="-550" fill="white">Tall lines (left) indicate high song modality score (emphasis on using very common words).</text>
  <text x="100" y="-500" fill="white">Short lines (right) indicate low song modality score (emphasis on using rare words).</text>
  <text x="100" y="-450" fill="white">Red: 1960-1962. Orange: 1963. Yellow: 1964. Green: 1965. Cyan: 1966. Blue: 1967. Purple: 1968. Black: 1969 and after.</text>
   {for $song in $words-sep//Q{}song[.//Q{}word]
let $words := $song/Q{}lyrics-counted/Q{}word,
    $score := avg(
        for $word in $words
        return $word/Q{}count/data() * 
        $word-score//Q{}word[./Q{}v/string() = $word/Q{}v/string()]/Q{}vScore/data()   )
order by $score descending
count $n
return 
    if ($song/Q{}year/data() < 1963) then
<line x1="{($n * 4)}" y1="0" x2="{($n * 4)}" y2="{($score div -14)}" stroke="red" stroke-width="4"/>
    
    else if ($song/Q{}year/data() = 1963) then
<line x1="{($n * 4)}" y1="0" x2="{($n * 4)}" y2="{($score div -14)}" stroke="orange" stroke-width="4"/>
    
    else if ($song/Q{}year/data() = 1964) then
<line x1="{($n * 4)}" y1="0" x2="{($n * 4)}" y2="{($score div -14)}" stroke="yellow" stroke-width="4"/>
    
    else if ($song/Q{}year/data() = 1965) then
<line x1="{($n * 4)}" y1="0" x2="{($n * 4)}" y2="{($score div -14)}" stroke="green" stroke-width="4"/>
    
    else if ($song/Q{}year/data() = 1966) then
<line x1="{($n * 4)}" y1="0" x2="{($n * 4)}" y2="{($score div -14)}" stroke="cyan" stroke-width="4"/>
    
    else if ($song/Q{}year/data() = 1967) then
<line x1="{($n * 4)}" y1="0" x2="{($n * 4)}" y2="{($score div -14)}" stroke="blue" stroke-width="4"/>
    
    else if ($song/Q{}year/data() = 1968) then
<line x1="{($n * 4)}" y1="0" x2="{($n * 4)}" y2="{($score div -14)}" stroke="purple" stroke-width="4"/>
    else (:this would mean 1969 and following:)
   <line x1="{($n * 4)}" y1="0" x2="{($n * 4)}" y2="{($score div -14)}" stroke="black" stroke-width="4"/>
   }</g></svg>
<h2>Visual subdivision</h2> 
<p>The graph above is visually confusing, yet it is full of data. Even a brief glance
will show that the "warm" colors (red, orange, yellow) are most represented in the upper
 half of the spectrum, while the cooler colors (especially cyan, blue, purple, and black) 
 are more heavily represented in the lower half.</p>
 <p>What does this mean? Let's break it down. We know that the left has 
high scores (focus on fewer common words, repeated often) and the right has low scores (focus on uncommon words, 
or words used fewer times per song, so more linguistical variety); so we can cut out 
the height element that is used to indicate that. We can also disaggregate the bars by year, and set the background to light grey so the blue 
background of the website is eliminated as a visually confusing factor.</p>

<svg xmlns="http://www.w3.org/2000/svg" width="1200" height="200" style="background-color:#d9d9d9">
   <g alignment-baseline="baseline" transform="translate(0,200)">
   
  
  <text x="1050" y="-165" fill="red">1960-1962</text>
  <text x="1050" y="-145" fill="orange">1963</text>
  <text x="1050" y="-125" fill="yellow">1964</text>
  <text x="1050" y="-105" fill="green">1965</text>
  <text x="1050" y="-85" fill="cyan">1966</text>
  <text x="1050" y="-65" fill="blue">1967</text>
  <text x="1050" y="-45" fill="purple">1968</text>
  <text x="1050" y="-25" fill="black">1969-</text>
  
  {for $song in $words-sep//Q{}song[.//Q{}word]
let $words := $song/Q{}lyrics-counted/Q{}word,
    $score := avg(
        for $word in $words
        return $word/Q{}count/data() * 
        $word-score//Q{}word[./Q{}v/string() = $word/Q{}v/string()]/Q{}vScore/data()   )
order by $score descending
count $n
return 
    if ($song/Q{}year/data() < 1963) then
<line x1="{($n * 4)}" y1="-160" x2="{($n * 4)}" y2="-180" stroke="red" stroke-width="4"/>
    
    else if ($song/Q{}year/data() = 1963) then
<line x1="{($n * 4)}" y1="-140" x2="{($n * 4)}" y2="-160" stroke="orange" stroke-width="4"/>
    
    else if ($song/Q{}year/data() = 1964) then
<line x1="{($n * 4)}" y1="-120" x2="{($n * 4)}" y2="-140" stroke="yellow" stroke-width="4"/>
    
    else if ($song/Q{}year/data() = 1965) then
<line x1="{($n * 4)}" y1="-100" x2="{($n * 4)}" y2="-120" stroke="green" stroke-width="4"/>
    
    else if ($song/Q{}year/data() = 1966) then
<line x1="{($n * 4)}" y1="-80" x2="{($n * 4)}" y2="-100" stroke="cyan" stroke-width="4"/>
    
    else if ($song/Q{}year/data() = 1967) then
<line x1="{($n * 4)}" y1="-60" x2="{($n * 4)}" y2="-80" stroke="blue" stroke-width="4"/>
    
    else if ($song/Q{}year/data() = 1968) then
<line x1="{($n * 4)}" y1="-40" x2="{($n * 4)}" y2="-60" stroke="purple" stroke-width="4"/>
    else (:this would mean 1969 and following:)
   <line x1="{($n * 4)}" y1="-20" x2="{($n * 4)}" y2="-40" stroke="black" stroke-width="4"/>
   }</g></svg>
<h2>Trends</h2>
<p>Vertically disaggregated this way into a kind of lyrical spectroscopy, we can see some trends over time emerging.</p>
<p><b>1960-1962</b> (red): While there are few songs, and some occur further down the spectrum, there is a clear cluster towards
the high end of the scale, emphasizing use of common words. This may represent an early and less linguistically ambitious or
 sophisticated phase of their songwriting.</p>
 <p><b>1963</b> (orange): This was their single most productive year of their recording career. There are definitely more 
 songs to the bottom of the scale, indicating more willingness to use uncommon words, suggesting a moving on from writing 
 simplistic ditties; but the center of gravity is still to the left (high end) of the scale.</p>
 <p><b>1964</b> (yellow): The year of the British Invasion. The center of gravity contracts sharply towards the higher end of 
 the scale, indicating a move back away from uncommon words. This may represent a commercial, market-driven response to 
 an American musical consumer assumed to be less linguistically sophisticated, more interested in simple, catchy lyrics. </p>
<p><b>1965</b> (green): The year following the British Invasion. Visually, the bars pull further in towards the center than 
in either 1964 or 1963, though there is a returning willingness to flirt with the bottom end of the scale. Sometimes 
when a band has been phenomenally successful, they have more ability to push back against a record label's insistence for 
maximally marketable music and indulge their artistic ambitions; they have much less to prove at that point.</p>
<p><b>1966</b> (cyan): This certainly bears out the supposition that The Beatles were interested in recording songs that 
relied much less heavily on repeating common words and much more heavily on using uncommon ones. Compare the 1960-1962 
(red) bars to the 1966 (cyan) bars: those two represent the greatest difference of any two years.</p>
<p><b>1967</b> (blue): In Hegelian terms, if the early (red) songs are the thesis and the 1966 (cyan) songs are the 
antithesis, then the blue bars of 1967 represent the synthesis. There are a handful of songs at the higher end of the scale,
a return to linguistic simplicity; yet also, and outweighing them, an even stronger focus on the bottom end of the scale,
representing linguistic complexity.</p>
<p><b>1968 and following</b> (purple, black): In the last two years in which The Beatles recorded together (1968-1969), 
they returned at last to distributions akin to their most productive year, 1963, yet still weighted slightly to the right,
the more linguistically complex end of the scale.</p>
<h2>Conclusions</h2>
<p>This exercise has suggested that songs recorded by The Beatles follow a certain pattern in linguistic complexity driven 
in part by The Beatles' desire (or their record label's desire) to cater to the perceived tastes of the American market. 
Following their massive commercial success, they showed more interest in experimental and challenging lyrics. While they 
finally settled, in their most mature years, into a return to the full span of lyrical complexities, from simple ditties
to the challenging, obscure, or specific, the willingness to lean in towards the latter type of songs remained greater in
 1967-1969 than in the earlier part of their recording career.</p>
   </div></body></html>