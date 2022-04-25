declare variable $files := collection('../XML/?select=*.xml');
declare variable $lyric-file := doc('../XML/clean-lyricsrevised.xml'); 
declare variable $words-sep := doc('../XML/words_separated_per_song.xml');
declare variable $word-score := doc('../XML/word_score_total.xml');

<html><head><title>Song Modality</title>
<link rel="stylesheet" type="text/css" href="style.css"/>
</head><body>
<!--whc: header, navbar here-->
<div id="content">
<h1>Song Lyrics: Modality Score</h1>
<p>As we considered the lyrical content of the Beatles songs, we started to wonder: Which Beatles songs are most typical, most quintessentially "Beatles", in their vocabulary? Calculating this turned out to be possible, but very tricky, and it required us to break the problem into several smaller steps, generating three separate XQuery document and two ancillary XML documents along the way. Here are our steps.</p>
<ol><li>First, we needed to write an XQuery to string together the lyrics from all the songs, and then to "tokenize" the text (divide the lyrics into individual words). It would then count the frequency of each word across the entire corpus of Beatles lyrics. The <a href="https://github.com/jacobg00/beatles/blob/main/XQuery/word_count.xquery">first version</a> of this created [link Vince's HTML output here], for visual display; the <a href="https://github.com/jacobg00/beatles/blob/main/XQuery/word_score_to_xml.xquery">second version</a>  instead created a <a href="https://github.com/jacobg00/beatles/blob/main/XML/word_score_total.xml">new XML file</a> with the same data. This assigned each word an "overall frequency score" indicating how common it was across the whole discography.</li>
<li>Second, we needed to run <a href="https://github.com/jacobg00/beatles/blob/main/XQuery/word_score.xquery">a similar XQuery</a> to count the frequency of each word on a song-by-song basis. This generated <a href="https://github.com/jacobg00/beatles/blob/main/XML/words_separated_per_song.xml">another new XML file</a> in which each song had a list of the words used in it, and the number of times each one was used.</li>
<li>Third, bringing these together, was <a href="https://github.com/jacobg00/beatles/blob/main/XQuery/song_modality.xquery">a new XQuery</a> to generate the HTML page you are reading right now, and especially the table below. On a song-by-song basis, it cross-references the two new XML files. As it loops over each song (excluding instrumentals, which have no lyrics), it looks at the frequency of each word in that song, and then multiplies that by the frequency of that word's use in the whole discography. We then took the average of those multiples across the song.
</li></ol>
<p><b>What does this mean in practice?</b></p>

<p>The word "you" is used {$word-score//word[./v/text()="you"]/vScore/data()} times across the discography. It appears {$words-sep//song[./songName/string()="All I've Got to Do"]/lyrics-counted/word[./v/string()="you"]/count/data()} times in the song "All I've Got to Do". That means that, in that song, we multiply {$word-score//word[./v/text()="you"]/vScore/data()} times {$words-sep//song[./songName/string()="All I've Got to Do"]/lyrics-counted/word[./v/string()="you"]/count/data()} to get {$word-score//word[./v/text()="you"]/vScore/data() * $words-sep//song[./songName/string()="All I've Got to Do"]/lyrics-counted/word[./v/string()="you"]/count/data()}. This high number means that the song has used a very common word a large number of times. This contributes to a higher score for the song, meaning that is closer to the "modal" -- that is, the most typical -- Beatles song, as measured by word use frequency.</p>
<p>At the same time, looking at the same song, the word "whisper" appears only once, and "whisper" is an uncommon word in the discography overall, appearing just {$word-score//word[./v/text()="whisper"]/vScore/data()} times. Its appearance in the song "All I've Got to Do" is therefore only worth {$word-score//word[./v/text()="whisper"]/vScore/data()} points.</p>
<p>When we average these calculations for all the words in the song, we arrive at a final score for that song, which can be compared to all the other songs. Songs, then, that use more words like "you", and fewer words like "whisper", will have a higher modality score.</p>
<h1>Graphs and Patterns</h1>
<p>Further down on this page, you will see a table ranking all 251 songs with lyrics. To get a visual summary, though, you will want to look at some graphs produced with these data.</p>
<p>First, take a look at <a href="/beatles/HTML/song_modality_covers_bar_graph.html">a page showing how cover songs</a> (those written by others, but recorded by The Beatles) stack up in terms of how quintessentially "Beatles" their word-use patterns are. (See <a href="song_modality_covers_bar_graph.xquery">here</a> for the XQuery that generated that page.)</p>
<p>Then check out <a href="/beatles/HTML/song_modality_chart_songs_bar_graph.html">this page</a> to see how song modality scores relate to song popularity, as measured by which songs made the Billboard Top 100 Charts in the United States. (See <a href="song_modality_chartsongs_bar_graph.xquery">here</a> for the XQuery that generated that page.)</p>
<h1>And the winner is...</h1>
<p>...a song you may never have heard of: "I Want You (She's So Heavy)", with an exceedingly high score of nearly 8200. (For context, only a handful of songs have scores exceeding 2000, and only four other songs exceed 3000.) What could possibly account for a song being both the most linguistically typical of all Beatles songs, and yet also an obscure deep cut from the Abbey Road album?</p>
<p>The answer is simple: there are very few different words ({$words-sep//song[.//songName/text() = "I Want You (She's So Heavy)"]/lyrics-counted/count(word)}) used in this song; almost all of them are very common words; and they are repeated over and over. (<a href="https://en.wikipedia.org/wiki/Abbey_Road">Lennon said</a> that he had "made a deliberate choice to keep the lyrics simple and concise.") If you wanted to write a song to rack up the maximum score, this is exactly how you would do it.</p>
<p>In a sense, then, "I Want You (She's So Heavy)" really is an outlier that "wins" top score by a kind of linguistic accident. It is interesting that several other deep cuts from Abbey Road scored near or at the opposite end of the spectrum, such as "Sun King" (the very lowest score, at 168) and "Mean Mr. Mustard" (343). This simple calculation did not take into account the many other factors that a proper linguistic analysis would include: it is not stylometry. Nonetheless, while this method does not really tell us what a truly typical Beatles song lyric looks like, it certainly <b>does</b> help us to identify outliers. "Sun King" scores so low in large measure because it includes a <a href="https://en.wikipedia.org/wiki/Sun_King_(song)">more or less random collection of Spanish and other Romance-language words</a>, using most of them only once; and the second-lowest scoring song, "Komm gib mir deine Hand" (score 189), was recorded in German. Certainly these are thus true linguistic outliers.</p>
<p>Another way to calculate what might be a linguistically typical Beatles song, then, would be to look instead for a <i>medium</i> score. Perhaps a more typical Beatles song lyric contains a certain proportion of common words tapering off to a certain number of unique or unusual words. The average score across all songs is <b>
{round-half-to-even(avg(for $song in $words-sep//song[.//word](:whc: the predicate gets rid of instrumentals, which don't have any word elements :)
let $words := $song/lyrics-counted/word,
    $score := avg(
        for $word in $words
        return $word/count/data() * 
        $word-score//word[./v/string() = $word/v/string()]/vScore/data()   )
return ($score)))
}</b>. The songs closest to that are "It's All Too Much" (1148) and "Blackbird"(1138). </p>
<p>Finally, one could look for the median. There are 251 non-instrumental songs in our collection, which would make the song in position #126, "Don't Ever Change" (score 981), the most middle-of-the-road Beatles song lyric.</p>
<h2>Song Modality Score Table</h2>
{(:WHC: in constructing the table below, I acknowledge the assistance of 
https://stackoverflow.com/questions/71911039/xquery-how-do-i-use-the-results-of-an-inner-for-loop-to-order-the-results-of-an :)}

<table>
<tr><th>Rank</th><th>Song Title</th><th>Modality Score</th></tr>
{for $song in $words-sep//song[.//word]
let $words := $song/lyrics-counted/word,
    $score := round-half-to-even(avg(
        for $word in $words
        return $word/count/data() * 
        $word-score//word[./v/string() = $word/v/string()]/vScore/data()   ))
order by $score descending
count $n
return (<tr><td>{$n}</td><td>{$song/songName/string()}</td>
        <td>{$score}</td>
        </tr>)
}
</table>

</div>
</body>
</html>