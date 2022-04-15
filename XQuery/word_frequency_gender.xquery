declare variable $song := //song[(./lyrics/text() ! replace(., "he", " he ", "i") ! (tokenize(.)[. = 'he']) => count()) + (./lyrics/text() ! replace(., "she", " she ", "i") ! (tokenize(.)[. = 'she']) => count()) + (./lyrics/text() ! replace(., "him", " him ", "i") ! (tokenize(.)[. = 'him']) => count()) + (./lyrics/text() ! replace(., "her", " her ", "i") ! (tokenize(.)[. = 'her']) => count()) >0 ];
declare variable $songName := $song/songName/text();
declare variable $heSongName := $song[lyrics/matches(.,'he','i')]/songName/text();
declare variable $sheSongName := $song[lyrics/matches(.,'she','i')]/songName/text();
declare variable $himSongName := $song[lyrics/matches(.,'him','i')]/songName/text();
declare variable $herSongName := $song[lyrics/matches(.,'her','i')]/songName/text();
declare variable $heSongTotal := $song[lyrics/matches(.,'he','i')] => count();
declare variable $sheSongTotal := $song[lyrics/matches(.,'she','i')] => count();
declare variable $himSongTotal := $song[lyrics/matches(.,'him','i')] => count();
declare variable $herSongTotal := $song[lyrics/matches(.,'her','i')] => count();
declare variable $heTotal := (//lyrics/text() ! replace(., "he", " he ", "i") ! (tokenize(.)[. = 'he']) => count());
declare variable $sheTotal := (//lyrics/text() ! replace(., "she", " she ", "i") ! (tokenize(.)[. = 'she']) => count());
declare variable $himTotal := (//lyrics/text() ! replace(., "him", " him ", "i") ! (tokenize(.)[. = 'him']) => count());
declare variable $herTotal := (//lyrics/text() ! replace(., "her", " her ", "i") ! (tokenize(.)[. = 'her']) => count());

<html>
    <head>
        <title>Gender Word Frequency</title>
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
                for $s in $song
                
                let $numberHe := $s[./songName/text() = $songName]//lyrics/text()
                ! replace(., "he", " he ", "i") 
                ! (tokenize(.)[. = 'he'] => count())

                let $numberShe := $s[./songName/text() = $songName]//lyrics/text()
                ! replace(., "she", " she ", "i") 
                ! (tokenize(.)[. = 'she'] => count())
     
                let $numberHim := $s[./songName/text() = $songName]//lyrics/text()
                ! replace(., "him", " him ", "i") 
                ! (tokenize(.)[. = 'him'] => count())
                
                let $numberHer := $s[./songName/text() = $songName]//lyrics/text()
                ! replace(., "her", " her ", "i") 
                ! (tokenize(.)[. = 'her'] => count())
                
                return <tr><td>{$s/songName/text()}</td> <td>{$numberHe}</td> <td>{$numberShe}</td> <td>{$numberHim}</td> <td>{$numberHer}</td></tr>
            }
            <tr>
                <td>Total Songs Containing</td> 
                <td>{$heSongTotal}</td>
                <td>{$sheSongTotal}</td>
                <td>{$himSongTotal}</td>
                <td>{$herSongTotal}</td>
            </tr>
            <tr>
                <td>Total Word Count</td>
                <td>{$heTotal}</td>
                <td>{$sheTotal}</td>
                <td>{$himTotal}</td>
                <td>{$herTotal}</td>
            </tr>
        </table>
    </body>
</html>