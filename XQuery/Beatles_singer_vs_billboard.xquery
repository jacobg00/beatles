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
                    y2="500"
                    stroke="black"
                    stroke-width="5"/>
            </g>
            {
                let $lyric-songs := $lyric-file//song
                let $lyric-song-titles := $lyric-songs/songName/data(@name)
                
                let $chart-songs := $bbSongs//billboardSong
                let $chart-song-titles := $chart-songs/songName/data(@name)
                
                
                let $songYear := $lyric-songs/year
                let $songYearDistinct := $songYear => distinct-values()
                
                for $year at $pos in $songYearDistinct
                
                let $songYearCount := $lyric-songs[./year = $year] => count()
                    
                    order by $year
                return <rect x="75" y="35*$pos" height="15" width="50" stroke="black" stroke-width="5" fill="blue"/>
                        (:concat("&#xa;", $year, " ", $pos, " ", $songYearCount):)
                    
            }
        </g>
    </g>
</svg>



