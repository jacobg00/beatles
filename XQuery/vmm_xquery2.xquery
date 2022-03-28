let $instrumental := //vocals[@vocalist = "Instrumental"]
let $instrumental-count := $instrumental => count()

let $song := //song
let $cover := $song[cover[@status="True"]]
let $cover-count := $cover => count()
let $song-count := $song => count()

let $instrumental-cover := $cover[./vocals[@vocalist = "Instrumental"]]
let $instrumental-cover-count := $instrumental-cover => count()

return
    (concat(
    "&#xa;", "The Beatles' discography contains ", $song-count, " songs.",
    "&#xa;", "The Beatles' discography contains ",
    $instrumental-count, " instrumentals.", 
    "&#xa;", "Of the Beatles' songs, ", 
    (($instrumental-count div $song-count) * 100), "% are instrumentals.",
    "&#xa;", "It also contains ", $cover-count, " covers.", 
    "&#xa;", "Of those covers, ", $instrumental-cover-count, " are instrumentals." ))