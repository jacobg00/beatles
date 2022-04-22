declare variable $song := //song[(./lyrics/text() ! replace(., "love", " love ", "i") ! (tokenize(.)[. = 'love']) => count()) + (./lyrics/text() ! replace(., "war", " war ", "i") ! (tokenize(.)[. = 'war']) => count()) + (./lyrics/text() ! replace(., "peace", " peace ", "i") ! (tokenize(.)[. = 'peace']) => count()) >0 ];
declare variable $songName := $song/songName/text();
declare variable $loveSongName := $song[lyrics/matches(.,'love','i')]/songName/text();
declare variable $warSongName := $song[lyrics/matches(.,'war','i')]/songName/text();
declare variable $peaceSongName := $song[lyrics/matches(.,'peace','i')]/songName/text();
declare variable $loveSongTotal := $song[lyrics/matches(.,'love','i')] => count();
declare variable $warSongTotal := $song[lyrics/matches(.,'war','i')] => count();
declare variable $peaceSongTotal := $song[lyrics/matches(.,'peace','i')] => count();
declare variable $loveTotal := (//lyrics/text() ! replace(., "love", " love ", "i") ! (tokenize(.)[. = 'love']) => count());
declare variable $warTotal := (//lyrics/text() ! replace(., "war", " war ", "i") ! (tokenize(.)[. = 'war']) => count());
declare variable $peaceTotal := (//lyrics/text() ! replace(., "peace", " peace ", "i") ! (tokenize(.)[. = 'peace']) => count());

<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css"/>
        <title>Love/War/Peace Frequency</title>
    </head>
    <body>
        <h1>Love/War/Peace Frequency in The Beatles Discography</h1>
        <p>This table was created with the intention of comparing words that we assumed would appear frequently in The Beatles discography. It turned out that 'war' and 'peace' actually appear very rarely in comparison to 'love'. Any motivation to further elaborate on this chart disappeared after that realization, so it was decided to use the lessons learned here to create other more complex pages of output.</p>
        <table>
            <tr>
                <th>Song</th>
                <th>Love</th>
                <th>War</th>
                <th>Peace</th>
            </tr>
            <tr>
                <td>Total Songs Containing</td> 
                <td>{$loveSongTotal}</td>
                <td>{$warSongTotal}</td>
                <td>{$peaceSongTotal}</td>
            </tr>
            <tr>
                <td>Total Word Count</td>
                <td>{$loveTotal}</td>
                <td>{$warTotal}</td>
                <td>{$peaceTotal}</td>
            </tr>
            <tr>
                <th>-</th>
                <th>-</th>
                <th>-</th>
                <th>-</th>
            </tr>
            {
                for $s in $song
                
                let $numberLove := $s[./songName/text() = $songName]//lyrics/text()
                ! replace(., "love", " love ", "i") 
                ! (tokenize(.)[. = 'love'] => count())

                let $numberWar := $s[./songName/text() = $songName]//lyrics/text()
                ! replace(., "war", " war ", "i") 
                ! (tokenize(.)[. = 'war'] => count())
     
                let $numberPeace := $s[./songName/text() = $songName]//lyrics/text()
                ! replace(., "peace", " peace ", "i") 
                ! (tokenize(.)[. = 'peace'] => count())
                
                return <tr><td>{$s/songName/text()}</td> <td>{$numberLove}</td> <td>{$numberWar}</td> <td>{$numberPeace}</td></tr>
            }

        </table>
    </body>
</html>