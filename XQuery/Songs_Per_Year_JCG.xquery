declare variable $files := collection('../XML/?select=*.xml');
declare variable $lyric-file := doc('../XML/clean-lyricsrevised.xml');
declare variable $bbSongs := doc('../XML/beatles_billboard_songs_US.xml');
declare variable $bbAlbums := doc('../XML/beatles_billboard_albums_US.xml');


<svg
    xmlns="http://www.w3.org/2000/svg"
    width="100%"
    height="100%">
    <desc></desc>
    
    <g
        alignment-baseline="baseline"
        transform="translate (50, 10)">
        <g
            alignment-baseline="baseline">
            <g>
             <text x="550" y="50" font-family="impact" font-size="18px" fill="black"> Red = Songs Released That Year</text>
             <text x="550" y="100" font-family="impact" font-size="18px" fill="black"> Blue = Songs That made the Billboard Top 100 That Year</text>
             <text x="550" y="150" font-family="impact" font-size="18px" fill="black"> Gold = Albums That made the Billboard Top 100 That Year</text>
            </g>
            
            {
                let $lyric-songs := $lyric-file//Q{}song
                let $lyric-song-titles := $lyric-songs/Q{}songName/data(@name)
                let $songYear := $lyric-songs/Q{}year
                let $songYearDistinct := $songYear => distinct-values()
                
                
                
                let $chart-songs := $bbSongs//Q{}billboardSong
                let $chart-song-date:=$chart-songs//Q{}date
                let $chart-song-year :=$chart-song-date//Q{}year
                let $chartYearDistinct := $chart-song-year => distinct-values()

                let $chart-albums := $bbAlbums//Q{}billboardAlbum
                let $chart-album-date:=$chart-albums//Q{}date
                let $chart-album-year :=$chart-album-date//Q{}year
                let $chartAlbYearDistinct := $chart-album-year => distinct-values()
                
                let $yspacer:= 45
                let $xspacer:= 5
                
                
                
                for $year in $songYearDistinct
                let $songYearCount := $lyric-songs[./Q{}year = $year] => count()
                let $chartYearCount := $chart-songs/Q{}date[./Q{}year = $year] => count()
                let $chartAlbCount := $chart-albums/Q{}date[./Q{}year = $year] => count()
                order by $year
                count $n
                
               
                return 
              
                <g>
              
                <rect x="75" y="{$n*$yspacer+-5}" height="10" width="{$songYearCount*$xspacer}" stroke="black" stroke-width="1" fill="red"/>
                <text x="25" y="{$n*$yspacer+10}" font-family="impact" font-size="18px" fill="black"> {$year}</text>
                <text x="{$songYearCount*$xspacer+85}" y="{$n*$yspacer+8}" font-family="impact" font-size="15px" fill="black"> {$songYearCount}</text>
                 
                <text x="{$chartYearCount*$xspacer+90}" y="{$n*$yspacer+20}" font-family="impact" font-size="15px" fill="blue"> {$chartYearCount}</text>
                <rect x="75" y="{$n*$yspacer+5}" height="10" width="{$chartYearCount*$xspacer}" stroke="black" stroke-width="1" fill="blue"/>
                
                <text x="{$chartAlbCount*$xspacer+80}" y="{$n*$yspacer+30}" font-family="impact" font-size="15px" stroke="black" stroke-width="1" fill="gold"> {$chartAlbCount}</text>
                <rect x="75" y="{$n*$yspacer+15}" height="10" width="{$chartAlbCount*$xspacer}" stroke="black" stroke-width="1" fill="gold"/>
                
               
               
                <line
                    x1="75"
                    y1="25"
                    x2="75"
                    y2="700"
                    stroke="black"
                    stroke-width="5"/>
            </g>    
            }
        </g>
    </g>
</svg>



