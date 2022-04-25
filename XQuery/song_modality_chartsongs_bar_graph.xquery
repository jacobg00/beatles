declare variable $files := collection('../XML/?select=*.xml');
declare variable $lyric-file := doc('../XML/clean-lyricsrevised.xml'); 
declare variable $words-sep := doc('../XML/words_separated_per_song.xml');
declare variable $word-score := doc('../XML/word_score_total.xml');
declare variable $bbSongs := doc('../XML/beatles_billboard_songs_US.xml');
<html><head><title>Network Analysis</title>
<link rel="stylesheet" type="text/css" href="style.css"/>
</head>
<body>
<div id="content">

<svg xmlns="http://www.w3.org/2000/svg" width="1300" height="1300">
   <g alignment-baseline="baseline" transform="rotate(270,500,500)">
   
   
   {for $song in $words-sep//Q{}song[.//Q{}word]
let $words := $song/Q{}lyrics-counted/Q{}word,
    $score := avg(
        for $word in $words
        return $word/Q{}count/data() * 
        $word-score//Q{}word[./Q{}v/string() = $word/Q{}v/string()]/Q{}vScore/data()   )
order by $score descending
count $n
return 
    if ($song/Q{}songName/text() = $bbSongs//Q{}billboardSong/Q{}songName/text()) then
<line x1="0" y1="{($n * 5)}" x2="{($score div 8)}" y2="{($n * 5)}" stroke="red" stroke-width="5"/>
   else
   <line x1="0" y1="{($n * 5)}" x2="{($score div 8)}" y2="{($n * 5)}" stroke="blue" stroke-width="5"/>
   }</g></svg></div></body></html>