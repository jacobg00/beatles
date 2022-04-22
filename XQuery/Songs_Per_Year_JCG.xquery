declare variable $files := collection('../XML/?select=*.xml');
declare variable $lyric-file := doc('../XML/clean-lyricsrevised.xml');
declare variable $bbSongs := doc('../XML/beatles_billboard_songs_US.xml');
declare variable $bbAlbums := doc('../XML/beatles_billboard_albums_US.xml');

<html>
    <head>
        <title>The Beatles' music Billboard Appearances vs. Release Dates</title>
        <link rel="stylesheet" type="text/css" href="style.css"/>
    </head>
    <body>
    
        <h1>The Beatles By Years: When They Released Their Music and When It Made the Billboard Charts </h1>
       <p>This page utilizes SVG graphs in addition to Xquery to look at the music by The Beatles over the years. In addition to the year of release, The Beatles music that appeard on Billboard Top 100 is displayed.
       </p>
       <p>
        <div class="graph">
        <p>
        
        <h2>Graph 1</h2>
        <h3>This first graph looks at when The Beatles released their songs, when they had their BillBoard top 100 hits, and when their albums made the BillBoard charts.</h3>
        <h3>*Note: The Year That A Particular Song Appeared on the Charts Isn't Necessarily When It Was Released* </h3></p>
        <svg
            xmlns="http://www.w3.org/2000/svg"
            width="100%"
            viewBox="0 0 1000 700"
            >
            <desc></desc>
            
            <g
                alignment-baseline="baseline"
                transform="translate (50, 5)">
                <g
                    alignment-baseline="baseline">
                    <g>
                        <text
                            x="400"
                            y="50"
                            font-weight="bold"
                            font-family="arial"
                            font-size="18px"
                            fill="#e8edf1"> Red = Songs Released That Year</text>
                        <text
                            x="400"
                            y="100"
                            font-weight="bold"
                            font-family="arial"
                            font-size="18px"
                            fill="#e8edf1"> Blue = Songs That made the Billboard Top 100 That Year</text>
                        <text
                            x="400"
                            y="150"
                            font-weight="bold"
                            font-family="arial"
                            font-size="18px"
                            fill="#e8edf1"> Gold = Albums That made the Billboard Top 100 That Year</text>
                    </g>
                    
                    {
                        let $lyric-songs := $lyric-file//Q{}song
                        let $lyric-song-titles := $lyric-songs/Q{}songName/data(@name)
                        let $songYear := $lyric-songs/Q{}year
                        let $songYearDistinct := $songYear => distinct-values()
                        
                        
                        
                        let $chart-songs := $bbSongs//Q{}billboardSong
                        let $chart-song-date := $chart-songs//Q{}date
                        let $chart-song-year := $chart-song-date//Q{}year
                        let $chartYearDistinct := $chart-song-year => distinct-values()
                        
                        let $chart-albums := $bbAlbums//Q{}billboardAlbum
                        let $chart-album-date := $chart-albums//Q{}date
                        let $chart-album-year := $chart-album-date//Q{}year
                        let $chartAlbYearDistinct := $chart-album-year => distinct-values()
                        
                        let $yspacer := 45
                        let $xspacer := 5
                        
                        
                        
                        for $year in $songYearDistinct
                        let $songYearCount := $lyric-songs[./Q{}year = $year] => count()
                        let $chartYearCount := $chart-songs/Q{}date[./Q{}year = $year] => count()
                        let $chartAlbCount := $chart-albums/Q{}date[./Q{}year = $year] => count()
                            order by $year
                            count $n
                        
                        
                        return
                            
                            <g>
                                
                                <rect
                                    x="75"
                                    y="{$n * $yspacer + -5}"
                                    height="10"
                                    width="{$songYearCount * $xspacer}"
                                    stroke="black"
                                    stroke-width="1"
                                    fill="red"/>
                                <text
                                    x="25"
                                    y="{$n * $yspacer + 10}"
                                    font-family="impact"
                                    font-size="18px"
                                    fill="black">
                                    {$year}</text>
                                <text
                                    x="{$songYearCount * $xspacer + 90}"
                                    y="{$n * $yspacer + 8}"
                                    font-family="impact"
                                    font-size="15px"
                                    fill="black">
                                    {$songYearCount}</text>
                                
                                <text
                                    x="{$chartYearCount * $xspacer + 90}"
                                    y="{$n * $yspacer + 20}"
                                    font-family="impact"
                                    font-size="15px"
                                    fill="blue">
                                    {$chartYearCount}</text>
                                <rect
                                    x="75"
                                    y="{$n * $yspacer + 5}"
                                    height="10"
                                    width="{$chartYearCount * $xspacer}"
                                    stroke="black"
                                    stroke-width="1"
                                    fill="blue"/>
                                
                                <text
                                    x="{$chartAlbCount * $xspacer + 80}"
                                    y="{$n * $yspacer + 30}"
                                    font-family="impact"
                                    font-size="15px"
                                    stroke="black"
                                    stroke-width="1"
                                    fill="gold">
                                    {$chartAlbCount}</text>
                                <rect
                                    x="75"
                                    y="{$n * $yspacer + 15}"
                                    height="10"
                                    width="{$chartAlbCount * $xspacer}"
                                    stroke="black"
                                    stroke-width="1"
                                    fill="gold"/>
                                
                                
                                
                                <line
                                    x1="75"
                                    y1="25"
                                    x2="75"
                                    y2="675"
                                    stroke="black"
                                    stroke-width="5"/>
                            </g>
                    }
                </g>
            </g>
        </svg>
        <p>By looking at this first graph we can see that as a band, The Beatles peak output for music was 1963, but their popularity peaked in 1964. From there, their music's popularity decreases steadily. However the amount of music The Beatles released dipped over the next 3 years before rising again to 45 in 1968. </p>
 
    </div>
       </p>
       <p>
     <div class="graph" >
    
    
    <H2>Graph 2: Billboard Songs</H2>
    <h3>This graph shows how many per year of The Beatles' songs made the BillBoard Top 100s</h3>
        <svg
            xmlns="http://www.w3.org/2000/svg"
            width="100%"
             viewBox="0 0 1000 575">
            <desc></desc>
            
            <g
                alignment-baseline="baseline"
                transform="translate (50, 5)">
                <g
                    alignment-baseline="baseline">
                    
                    <g>
                        <line
                            x1="75"
                            y1="25"
                            x2="75"
                            y2="560"
                            stroke="black"
                            stroke-width="5"/>
                    </g>
                    {
                        
                        let $chart-songs := $bbSongs//Q{}billboardSong
                        (:let $chart-song-titles := $chart-songs/Q{}songName/data(@name):)
                        let $chart-song-date := $chart-songs//Q{}date
                        let $chart-song-year := $chart-song-date//Q{}year
                        let $chartYearDistinct := $chart-song-year => distinct-values()
                        
                        
                        let $yspacer := 40
                        let $xspacer := 5
                        
                        
                        for $year in $chartYearDistinct
                        let $chartYearCount := $chart-songs/Q{}date[./Q{}year = $year] => count()
                            order by $year
                            count $n
                        
                        return
                            <g>
                                <rect
                                    x="75"
                                    y="{$n * $yspacer}"
                                    height="20"
                                    width="{$chartYearCount * $xspacer}"
                                    stroke="black"
                                    stroke-width="5"
                                    fill="red"/>
                                <text
                                    x="25"
                                    y="{$n * $yspacer + 15}"
                                    font-family="impact"
                                    font-size="18px"
                                    fill="black">
                                    {$year}</text>
                                <text
                                    x="{$chartYearCount * $xspacer + 85}"
                                    y="{$n * $yspacer + 15}"
                                    font-family="impact"
                                    font-size="18px"
                                    fill="black">
                                    {$chartYearCount}</text>
                            
                            </g>
                    
                    }
                </g>
            </g>
        </svg>
    <p>This graph shows us that out of The Beatles music that made the Billboard Charts, how many songs each year made the charts.</p>
    </div>
    </p>
    
    <div class="graph">
    <p>
    
    <h2>Graph 3: BillBoard Albums</h2>
    <h3>This graph shows how many per year of The Beatles' albums made the BillBoard Top 100s</h3>

        
        <svg
            xmlns="http://www.w3.org/2000/svg"
            width="100%"
            viewBox="0 0 1000 650">
            <desc></desc>
            
            <g
                alignment-baseline="baseline"
                transform="translate (50, 5)">
                <g
                    alignment-baseline="baseline">
                    
                    <g>
                        <line
                            x1="75"
                            y1="25"
                            x2="75"
                            y2="625"
                            stroke="black"
                            stroke-width="5"/>
                    </g>
                    {
                        
                        let $chart-albums := $bbAlbums//Q{}billboardAlbum
                        let $chart-album-date := $chart-albums//Q{}date
                        let $chart-album-year := $chart-album-date//Q{}year
                        let $chartAlbYearDistinct := $chart-album-year => distinct-values()
                        
                        
                        let $yspacer := 30
                        let $xspacer := 5
                        
                        
                        for $year in $chartAlbYearDistinct
                        let $chartYearCount := $chart-albums/Q{}date[./Q{}year = $year] => count()
                            order by $year
                            count $n
                        
                        return
                            <g>
                                <rect
                                    x="75"
                                    y="{$n * $yspacer}"
                                    height="20"
                                    width="{$chartYearCount * $xspacer}"
                                    stroke="black"
                                    stroke-width="5"
                                    fill="gold"/>
                                <text
                                    x="25"
                                    y="{$n * $yspacer + 15}"
                                    font-family="impact"
                                    font-size="18px"
                                    fill="black">
                                    {$year}</text>
                                <text
                                    x="{$chartYearCount * $xspacer + 85}"
                                    y="{$n * $yspacer + 15}"
                                    font-family="impact"
                                    font-size="18px"
                                    fill="black">
                                    {$chartYearCount}</text>
                            
                            </g>
                    
                    }
                </g>
            </g>
        </svg>
        <p>This graph is interesting becuase of how long The Beatles' albums stayed on the Billboard Charts. This is primarily attributed to rereleases and remasters of their music, along with new compilations.</p>
    </p>
    </div>
    <div class="graph">
    <p>
        <h1>Song's Billboard Appearance vs. Release Date</h1>
        <text> This chart illistrates the fact that the year a song was released isn't typically the same year it made the Billboard charts  </text>
        <div class="table">
        <table>
            <tr>
                <th>Song</th>
                <th>Released </th>
                <th>Billboard Charts</th>
                
            </tr>            
            {
                let $chart-songs := $bbSongs//Q{}billboardSong
                
                
                for $cs in $chart-songs
                let $chart-song-title := $cs/Q{}songName/text()
                let $chart-song-date := $cs/Q{}date/string()
                let $chart-song-year := $cs/Q{}date/Q{}year/string()
                let $chart-lyrics-year := $lyric-file//Q{}song[./Q{}songName/data(@name) =
                $cs/Q{}songName/data(@name)]/Q{}year/string()
                count $n
                
                 return <tr><td>{$chart-song-title}</td><td>{$chart-lyrics-year}</td><td>{$chart-song-year}</td></tr>
                   
            }  <!--whc: you also needed to add a curly brace here -->
        </table>
        </div>
         <p> By using this chart in addition to our other graphs, we can begin to see how relevent The Beatles' music was at a given point in time, and even pick out trends. An example of this can be found when looking at graph 2, where we see that in 1986, 1 song made the Billboard charts. Checking the chart above, we can see that the song was Twist And Shout. 
         How is this interesting? Well in 1986 the movie "Ferris Bueller's Day Off" was released which was very popular, and a song that was featured in the film was none other than Twist and Shout.  </p>
         </p>
         </div>
    </body>
</html>
