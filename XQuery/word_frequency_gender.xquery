declare option saxon:output "method=html";
declare option saxon:output "doctype-public=-//W3C//DTD XHTML 1.0 Strict//EN";
(:whc note 5/3/2022: This is messy because it includes, normally commented out, a number of 
processes that could not be gotten to work in time for the conclusion of the project. They might
still serve as "what not to do/we tried that" object lessons for future students. :)
declare variable $files := collection('../XML/?select=*.xml');
declare variable $lyric-file := doc('../XML/clean-lyricsrevised.xml');
declare variable $song := $lyric-file//song[.//lyrics];
(:[((./lyrics/text() ! replace(., "he", " he ", "i") ! (tokenize(.)[. = 'he']) => count()) 
+ (./lyrics/text() ! replace(., "she", " she ", "i") ! (tokenize(.)[. = 'she']) => count()) 
+ (./lyrics/text() ! replace(., "him", " him ", "i") ! (tokenize(.)[. = 'him']) => count()) 
+ (./lyrics/text() ! replace(., "her", " her ", "i") ! (tokenize(.)[. = 'her']) => count())) > 0 ];:)

(:[.//lyrics]; whc: this predicate filters out instrumentals: This predicate currently isn't being used:)

declare variable $songName := $song/songName/text();
(: declare variable $heSongName := $song[lyrics/matches(.,'he','i')]/songName/text();
declare variable $sheSongName := $song[lyrics/matches(.,'she','i')]/songName/text();
declare variable $himSongName := $song[lyrics/matches(.,'him','i')]/songName/text();
declare variable $herSongName := $song[lyrics/matches(.,'her','i')]/songName/text(); :)

declare variable $songString := $song/lyrics//text()=>string-join()=>lower-case();
declare variable $songStringNorm := replace($songString, '\W+', ' ') => normalize-space();

declare variable $heSongTotal := $song[lyrics/matches(.,'he','i')] => count();
(:let $heSong := $s[./songName/text() = $songName]//lyrics/
                let $heSongClean := replace($heSong, '\W+', ' ') => normalize-space()
                let $numberHe := :)
declare variable $sheSongTotal := $song[lyrics/matches(.,'she','i')] => count();
declare variable $himSongTotal := $song[lyrics/matches(.,'him','i')] => count();
declare variable $herSongTotal := $song[lyrics/matches(.,'her','i')] => count();

declare variable $lyrics := //lyrics/text()=>string-join()=>lower-case();
declare variable $lyricsClean :=  replace($lyrics, '\W+', ' ') => normalize-space();

declare variable $heTotal := $lyricsClean ! (tokenize(.)[. = 'he']) => count();
declare variable $sheTotal := $lyricsClean ! (tokenize(.)[. = 'she']) => count();
declare variable $himTotal := $lyricsClean ! (tokenize(.)[. = 'him']) => count();
declare variable $herTotal := $lyricsClean ! (tokenize(.)[. = 'her']) => count();

declare variable $boyTotal := $lyricsClean ! (tokenize(.)[. = 'boy']) => count();
declare variable $girlTotal := $lyricsClean ! (tokenize(.)[. = 'girl']) => count();
declare variable $manTotal := $lyricsClean ! (tokenize(.)[. = 'man']) => count();
declare variable $womanTotal := $lyricsClean ! (tokenize(.)[. = 'woman']) => count();
declare variable $babyTotal := $lyricsClean ! (tokenize(.)[. = 'baby']) => count();
declare variable $honeyTotal := $lyricsClean ! (tokenize(.)[. = 'honey']) => count();
declare variable $friendTotal := $lyricsClean ! (tokenize(.)[. = 'friend']) => count();

declare variable $mascTotal := ($heTotal + $himTotal + $boyTotal + $manTotal + $friendTotal);
declare variable $femTotal := ($sheTotal + $herTotal + $girlTotal + $womanTotal + $babyTotal + $honeyTotal);
declare variable $femdex := ($femTotal - $mascTotal);



<html>
    <head>
        <title>Gender Word Frequency</title>
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
        <h1>Gender Word Frequency in The Beatles Discography</h1>
        <p>This table displays the frequency of words associated with gender in songs performed by The Beatles. This table started as a simple idea to show the difference in Beatles songs themed around women vs. those themed around men.</p>
        <p>Once we saw that "she" appears far more often than "he", and "her" than "him", we expanded the table to include other gendered words. The pattern became more complex at this point: "man" appears more often than "woman", and "boy" than "girl". However, this might be a trick of the light: both "man" and "boy" can often be used as expressions, as for example "Man I was mean" (in the song Getting Better) and "I read the news today oh, boy" (in "A Day in the Life"), or perhaps most markedly "Boy, you been a naughty girl" ("I Am The Walrus"). Another way in which the use of "boy" and "man" can mask an actual focus on women/girls in a song is that the singers, being all male, will often refer to themselves using those terms. For example, in the song "This Boy", the singer is speaking to his ex-girlfriend, comparing himself ("this boy") to the girl's current boyfriend ("that boy"), using the word "boy" eleven times, while the girl in question is only addressed with the gender-neutral "you". The fact that he is actually singing to a female listener, and trying to woo her back, is not at all apparent from the count of gendered words in the lyrics. </p>
        <p>In one point the comparison breaks down, after a fashion. We searched for "baby" and "honey", terms of romantic endearment most often used by a man speaking to a woman (in theory, they could be used by any gender, speaking to any gender, in any romantic relationship; but The Beatles were all men, and none of the songs they recorded jumps out as actually being written from a female perspective). The closest analogue we came up with for a man speaking to a man would be "friend" (which is really gender-neutral: "Can't Buy Me Love" is addressed to "my friend", but we never know if that friend's gender.)</p>
        <p>Still, the overwhelming result of these statistics is that somgs recorded by The Beatles, when they concern relationships, is that they are most often guys talking to women/girls, especially their female romantic interests (songs such as "I Wanna Hold Your Hand"), followed by guys talking to one another <em>about</em> women/girls, especially their female romantic interests (songs such as "Hey Jude"), followed by guys talking to other guys about other things.</p>
        <p>Why should we asssume that male-female relationships in Beatles songs are necessarily romantic? Surely not all of them are; but the fact that we have shown that "love" is <em>by far</em> the most frequently-used significant word in Beatles songs tells us that, on the whole, songs relating to romance are going to outweigh any other theme.</p>
        <p>The table below quantifies this, not only for each song, but for the songs as a whole.</p>
        <p>To gauge how far a song, or all the songs, lean towards feminine words, we created a "Femdex", which is simply the number of feminine words minus the number of masculine words. A negative femdex means a song that uses the masculine words more often; a positive femdex means a song that uses feminine words more often. We experimented with dividing instead of subtracting, but if the number of masculine words is zero, that would mean dividing by zero, which would give a femdex of infinity -- if XQuery would calculate it, which it immediately refused to do.</p>
        <p>(Note: we excluded all songs from the list that do not use any of these words, and ordered them by Femdex.)</p>
        <table>
            <tr>
                <th>Song</th>
                <th>He</th>
                <th>She</th>
                <th>Him</th>
                <th>Her</th>
                <th>Boy</th>
                <th>Girl</th>
                <th>Man</th>
                <th>Woman</th>
                <th>Baby</th>
                <th>Honey</th>
                <th>Friend</th>
                <th>Masc. Total</th>
                <th>Fem. Total</th>
                <th>Femdex</th>
            </tr>
            <tr>
                <td>Total Word Use Count</td>
                <td>{$heTotal}</td>
                <td>{$sheTotal}</td>
                <td>{$himTotal}</td>
                <td>{$herTotal}</td>
                <td>{$girlTotal}</td>
                <td>{$boyTotal}</td>
                <td>{$manTotal}</td>
                <td>{$womanTotal}</td>
                <td>{$babyTotal}</td>
                <td>{$honeyTotal}</td>
                <td>{$friendTotal}</td>
                <td>{$mascTotal}</td>
                <td>{$femTotal}</td>
                <td>{$femdex}</td>
                
            </tr>
            {
                for $s in $song
(:WHC: the following four sequences are somewhat redundant. Really, only the third line of each set differs. For the rest,
the outcome is the same. Thus the subsequent statements, after $numberHer, can all draw on $herSongClean, since there is
nothing specifically "her" about it. :)
                let $heSong := $s[./songName/text() = $songName]//lyrics/text()=>string-join()=>lower-case()
                let $heSongClean := replace($heSong, '\W+', ' ') => normalize-space()
                let $numberHe := (tokenize($heSongClean, '\s')[. = 'he'] => count())

                let $sheSong := $s[./songName/text() = $songName]//lyrics/text()=>string-join()=>lower-case()
                let $sheSongClean := replace($sheSong, '\W+', ' ') => normalize-space()
                let $numberShe := (tokenize($sheSongClean, '\s')[. = 'she'] => count())
     
                let $himSong := $s[./songName/text() = $songName]//lyrics/text()=>string-join()=>lower-case()
                let $himSongClean := replace($himSong, '\W+', ' ') => normalize-space()
                let $numberHim := (tokenize($himSongClean, '\s')[. = 'him'] => count())
                
                let $herSong := $s[./songName/text() = $songName]//lyrics/text()=>string-join()=>lower-case()
                let $herSongClean := replace($herSong, '\W+', ' ') => normalize-space()
                let $numberHer := (tokenize($herSongClean, '\s')[. = 'her'] => count())
                
                let $numberBoy := (tokenize($herSongClean, '\s')[. = 'boy'] => count())
                let $numberGirl := (tokenize($herSongClean, '\s')[. = 'girl'] => count())
                let $numberMan := (tokenize($herSongClean, '\s')[. = 'man'] => count())
                let $numberWoman := (tokenize($herSongClean, '\s')[. = 'woman'] => count())
                let $numberBaby := (tokenize($herSongClean, '\s')[. = 'baby'] => count())
                let $numberHoney := (tokenize($herSongClean, '\s')[. = 'honey'] => count())
                let $numberFriend := (tokenize($herSongClean, '\s')[. = 'friend'] => count())
                
                
                let $numberMascSongTotal := ($numberHe+$numberHim+$numberBoy+$numberMan+$numberFriend)
                let $numberFemSongTotal := ($numberShe+$numberHer+$numberGirl+$numberWoman+$numberBaby+$numberHoney)
                let $songFemdex := ($numberFemSongTotal - $numberMascSongTotal)
                let $numberTotal := $numberMascSongTotal+$numberFemSongTotal
                order by $songFemdex descending
                where $numberTotal > 0
                return <tr><td>{$s/songName/text()}</td> <td>{$numberHe}</td> <td>{$numberShe}</td> <td>{$numberHim}</td> <td>{$numberHer}</td>
                <td>{$numberBoy}</td><td>{$numberGirl}</td><td>{$numberMan}</td><td>{$numberWoman}</td><td>{$numberBaby}</td><td>{$numberHoney}</td><td>{$numberFriend}</td>
                <td>{$numberMascSongTotal}</td><td>{$numberFemSongTotal}</td><td>{$songFemdex}</td>
                </tr>
            }
            {(:<tr>
                <td>Total Songs Containing</td> 
                <td>{$heSongTotal}</td>
                <td>{$sheSongTotal}</td>
                <td>{$himSongTotal}</td>
                <td>{$herSongTotal}</td>
            </tr>:)}
            
        </table>
        </div>
    </body>
</html>