declare variable $files := collection('../XML/?select=*.xml');
declare variable $lyric-file := doc('../XML/clean-lyricsrevised.xml'); 
declare variable $words-sep := doc('../XML/words_separated_per_song.xml');
declare variable $word-score := doc('../XML/word_score_total.xml');
<html><head><title>Network Analysis</title>
<link rel="stylesheet" type="text/css" href="style.css"/>
</head>
<body>
<div id="content">

<svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%">
   <g alignment-baseline="baseline" transform="translate (200, 100)">
   
   
   {for $song in $words-sep//Q{}song[.//Q{}word]
let $words := $song/Q{}lyrics-counted/Q{}word,
    $score := avg(
        for $word in $words
        return $word/Q{}count/data() * 
        $word-score//Q{}word[./Q{}v/string() = $word/v/string()]/Q{}vScore/data()   )
order by $score descending
count $n
return <line x1="0" y1="{($n * 10)}" x2="{$score}" y2="{($n * 10)}" stroke="red" stroke-width="10"/>
   
   }</g></svg></div></body></html>