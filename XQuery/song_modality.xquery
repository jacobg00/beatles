declare variable $files := collection('../XML/?select=*.xml');
declare variable $lyric-file := doc('../XML/clean-lyricsrevised.xml'); 
declare variable $words-sep := doc('../XML/words_separated_per_song.xml');
declare variable $word-score := doc('../XML/word_score_total.xml');

<html><head>Song Modality</head><body>
<!--whc: header, navbar here-->
<h1>Song Lyrics: Modality Score</h1>
<p>As we considered the lyrical content of the Beatles songs, we started to wonder: Which Beatles songs are most typical, most quintessentially "Beatles", in their vocabulary? Calculating this turned out to be possible, but very tricky, and it required us to break the problem into several smaller steps, generating three separate XQuery document and two ancillary XML documents along the way. Here are our steps.</p>
<ol><li>First, we needed to write an XQuery to string together the lyrics from all the songs, and then to "tokenize" the text (divide the lyrics into individual words). It would then count the frequency of each word across the entire corpus of Beatles lyrics. The first version of this created [link Vince's XQuery and HTML output here], for visual display; the second version [link WHC XQuery here] instead created a new XML file [link here] with the same data. This assigned each word an "overall frequency score" indicating how common it was across the whole discography.</li>
<li>Second, we needed to run [link here] a similar XQuery to count the frequency of each word on a song-by-song basis. This generated [link here] another new XML file in which each song had a list of the words used in it, and the number of times each one was used.</li>
<li>Third, and offering the greatest challenge of the three, was a new XQuery [link] to generate the HTML page you are reading right now, and especially the table below. On a song-by-song basis, it cross-references the two new XML files. As it loops over each song (excluding instrumentals, which have no lyrics), it looks at the frequency of each word in that song, and then multiplies that by the frequency of that word's use in the whole discography. We then took the average of those multiples across the song.
</li></ol>
<p>In practice, here is what that means:</p>

<p>The word "you" is used {$word-score//word[./v/text()="you"]/vScore/data()} times across the discography. It appears {$words-sep//song[./songName/string()="All I've Got to Do"]/lyrics-counted/word[./v/string()="you"]/count/data()} times in the song "All I've Got to Do". That means that, in that song, we multiply {$word-score//word[./v/text()="you"]/vScore/data()} times {$words-sep//song[./songName/string()="All I've Got to Do"]/lyrics-counted/word[./v/string()="you"]/count/data()} to get {$word-score//word[./v/text()="you"]/vScore/data() * $words-sep//song[./songName/string()="All I've Got to Do"]/lyrics-counted/word[./v/string()="you"]/count/data()}. This high number means that the song has used a very common word a large number of times. This contributes to a higher score for the song, meaning that is closer to the "modal" -- that is, the most typical -- Beatles song, as measured by word use frequency.</p>
<p>At the same time, looking at the same song, the word "whisper" only once, and "whisper" is an uncommon word in the discography overall, appearing just {$word-score//word[./v/text()="whisper"]/vScore/data()} times. Its appearance in the song "All I've Got to Do" is therefore only worth {$word-score//word[./v/text()="you"]/vScore/data()} points.</p>
<p>When we average these calculations for all the words in the song, we arrive at a final score for that song, which can be compared to all the other songs. Songs, then, that use more words like "you", and fewer words like "whisper", will have a higher modality score.</p>
<h1>And the winner is...</h1>
<p>...a song you may never have heard of: "I Want You (She's So Heavy)", with an exceedingly high score of just under 8200. (For context, only a handful of songs have scores exceeding 2000, and only one other song, "I Wanna Be Your Man", exceeds 4000.) What could possibly account for a song being both the most linguistically typical of all Beatles songs, and yet also an obscure deep cut from the Abbey Road album?</p>
<p>The answer is simple: there are very few different words used; almost all of them are very common words; and they are repeated over and over. If you wanted to write a song to rack up the maximum score, this is exactly how you would do it.</p>
<p>In a sense, then, "I Want You (She's So Heavy)" really is an outlier that "wins" top score by a kind of linguistic accident. This simple calculation did not take into account the many other factors that a proper linguistic analysis would include. Yet if we eliminate this one song and look at the other songs scoring over 2000, most of them do turn out to be more familiar, more in line with what one might imagine to be the Beatles archetype.</p>
<h2>Song Modality Score Table</h2>
<table>
<tr><th>Song Title</th><th>Modality Score</th></tr>
{let $song := $words-sep//song[.//word](:whc: the predicate should get rid of instrumentals, which don't have any word elements :)
for $s in $song
let $word := $s/lyrics-counted/word
let $word-count-per-song := count($word)

return (<tr><td>{$s/songName/string()}</td><td>{avg(

for $w in $word

return ($w/count/data() * $word-score//word[./v/string() = $w/v/string()]/vScore/data())

)}</td></tr>)

}
</table>

</body></html>