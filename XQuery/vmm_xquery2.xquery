<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css"/>
</head>
<body>
<h1>Word Count in Cover Songs</h1>
<p>This page displays every individual word that shows up in an original song written and performed by The Beatles. It is displayed as a large block of text, rather than a table. It was decided that the large block of text is actually more fitting than a very long table that would need to extend very far down or across the page. This page was created as a way to compare the frequency of words in songs covered by The Beatles with songs written by The Beatles on the originals page, as well as with all Beatles songs on the discography page.</p>
<p>
{
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
    }
</p>
</body>
</html>