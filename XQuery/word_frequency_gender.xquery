declare variable $song := //song[.//lyrics];
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

<html>
    <head>
        <title>Gender Word Frequency</title>
        <link rel="stylesheet" type="text/css" href="style.css"/>
    </head>
    <body>
        <h1>Gender Word Frequency in The Beatles Discography</h1>
        <table>
            <tr>
                <th>Song</th>
                <th>He</th>
                <th>She</th>
                <th>Him</th>
                <th>Her</th>
            </tr>
            {
                let $words := //song/lyrics/string()=>string-join()=>lower-case()
                let $words-cleaned := replace($words, '[,|"|!|\.|(|)|\?|;|\[|\]]+', ' ') => normalize-space()
                let $words-separate := tokenize($words-cleaned, '\s')
                for $s in $song
                
                let $heSong := $s[./songName/text() = $songName]//lyrics/text()=>string-join()=>lower-case()
                let $heSongClean := replace($heSong, '\W+', ' ') => normalize-space()
                let $numberHe := (tokenize($heSongClean, '\s')[. = 'he'] => count())
(:whc: $numberHe is now working corectly. Copy across the next three.:)
                let $sheSong := $s[./songName/text() = $songName]//lyrics/text()=>string-join()=>lower-case()
                let $sheSongClean := replace($sheSong, '\W+', ' ') => normalize-space()
                let $numberShe := (tokenize($sheSongClean, '\s')[. = 'she'] => count())
     
                let $himSong := $s[./songName/text() = $songName]//lyrics/text()=>string-join()=>lower-case()
                let $himSongClean := replace($himSong, '\W+', ' ') => normalize-space()
                let $numberHim := (tokenize($himSongClean, '\s')[. = 'him'] => count())
                
                let $herSong := $s[./songName/text() = $songName]//lyrics/text()=>string-join()=>lower-case()
                let $herSongClean := replace($herSong, '\W+', ' ') => normalize-space()
                let $numberHer := (tokenize($herSongClean, '\s')[. = 'her'] => count())
                
                return <tr><td>{$s/songName/text()}</td> <td>{$numberHe}</td> <td>{$numberShe}</td> <td>{$numberHim}</td> <td>{$numberHer}</td></tr>
            }
            {(:<tr>
                <td>Total Songs Containing</td> 
                <td>{$heSongTotal}</td>
                <td>{$sheSongTotal}</td>
                <td>{$himSongTotal}</td>
                <td>{$herSongTotal}</td>
            </tr>:)}
            <tr>
                <td>Total Word Use Count</td>
                <td>{$heTotal}</td>
                <td>{$sheTotal}</td>
                <td>{$himTotal}</td>
                <td>{$herTotal}</td>
            </tr>
        </table>
    </body>
</html>