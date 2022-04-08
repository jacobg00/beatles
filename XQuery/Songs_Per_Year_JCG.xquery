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
        transform="translate (50, 50)">
        <g
            alignment-baseline="baseline">
            
            <g>
                <line
                    x1="75"
                    y1="25"
                    x2="75"
                    y2="600"
                    stroke="black"
                    stroke-width="5"/>
            </g>
            {
                let $lyric-songs := $lyric-file//Q{}song
                let $lyric-song-titles := $lyric-songs/Q{}songName/data(@name)
                let $songYear := $lyric-songs/Q{}year
                let $songYearDistinct := $songYear => distinct-values()
                
                
                
                let $chart-songs := $bbSongs//Q{}billboardSong
                let $chart-song-titles := $chart-songs/Q{}songName/data(@name) 
                let $chart-song-year:=$chart-songs//Q{}year
                let $chartYearDistinct := $chart-song-year => distinct-values()
                
                let $chartYearCount := $chart-songs[./Q{}year] => count()
                
                let $yspacer:= 40
                let $xspacer:= 5
                
                
                
                for $year in $songYearDistinct
                let $songYearCount := $lyric-songs[./Q{}year = $year] => count()
                
                order by $year
                count $n
                
                
                (:
                
                for $chartYear in $chartYearDistinct
                let $chartYearCount :=  $chartYearDistinct => count()
                order by $year
                count $z
                :)
                return 
                <g>
                <rect x="75" y="{$n*$yspacer}" height="20" width="{$songYearCount*$xspacer}" stroke="black" stroke-width="5" fill="red"/>
                <text x="25" y="{$n*$yspacer+15}" font-family="impact" font-size="18px" fill="black"> {$year}</text>
                <text x="{$songYearCount*$xspacer+85}" y="{$n*$yspacer+15}" font-family="impact" font-size="18px" fill="black"> {$songYearCount}</text>
                
                <text x="0" y="{$n*$yspacer+15}" font-family="impact" font-size="18px" fill="black"> {$chartYearCount}</text>
                <!--<rect x="75" y="{$z*$yspacer}" height="20" width="{$chartYearCount*$xspacer}" stroke="black" stroke-width="5" fill="blue"/>-->
                </g>
                    
            }
        </g>
    </g>
</svg>



