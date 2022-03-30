<html>
    <head>
        <title>Yearly Song Count</title>
    </head>
    
    <body>
        <h1>Yearly Song Count of The Beatles</h1>
        <p>Do you lie awake at night wondering how many songs The Beatles released each year? Well, wonder no longer, friends!</p>
        <table>
            <tr><th>Year</th><th>Songs Released</th></tr>
        {
            let $song := //song

            let $songYear := $song/year
            let $songYearDistinct := $songYear => distinct-values()

            for $year in $songYearDistinct

            let $songYearCount := $song[./year = $year] => count()

            order by $year
            (: return<li>{concat("&#xa;", $year, " ", $songYearCount)}</li> :)
            (: return<tr>The Beatles released {$songYearCount} song(s) in the year {$year}.</tr> :)
            return <tr><td>{$year}</td><td>{$songYearCount}</td></tr>
        }
        </table>
    </body>
</html>