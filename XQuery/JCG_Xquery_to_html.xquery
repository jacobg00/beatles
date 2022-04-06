<html>
    <head>
        <title>Love Count</title>
    </head>
    
    <body>
        <h1>Love count in The Beatles songs</h1>
        <p>This page counts and shows all the times the word "love" is found throughout The Beatles lyrics.</p>
        <table>
             <tr><th>Song Name</th><th>Times Love is Said</th></tr>
        {
                let $song:=//song
                let $songName :=$song[lyrics/matches(.,'love','i')]/songName/text()
                for $songN in $songName
                let $numberLove := $song[./songName/text() = $songN]//lyrics/text() 
                ! replace(., "love", " love ", "i") 
                ! (tokenize(.)[. = 'love'] => count())
                where $song[./songName/text() = $songN]//songWrite[@writer/matches(.,'Lennon')]
                order by $songN
                (:return <li>{(concat ("&#xa;", "In ", $songN, ", love is said ", $numberLove, " times."))}</li>:)
                (:return<li>In the song <i>{$songN}</i>, <b>love</b> is said {$numberLove} times </li>:)
                return<tr><td>{$songN}</td> <td>{$numberLove}</td></tr>
                 
   
         }
        </table>                
    </body>
</html>

