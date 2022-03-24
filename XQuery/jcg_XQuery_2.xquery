(: This first expression returns the songs with love in them, the ones that were sung by Lennon, and prints out a statement about this:)
(:let $song := //song
let $lyricsLove := $song[lyrics/matches(.,'love','i')]=>count()
let $LennonLove := $song[lyrics/matches(.,'love','i') and songWrite[@writer/matches(.,'Lennon')]]=>count()

return (concat ("&#xa;", "Out of the ", $lyricsLove, " songs that have the word love in them, John Lennon sings ", $LennonLove, " of them."))
:)
(: On this second one I was trying to display the number of times love is said in that song:)
let $song:=//song
let $songName :=$song[lyrics/matches(.,'love','i')]/songName/text()
for $songN in $songName
(:let $numberLove := $song//count(//lyrics//text()[contains(..,'love')]) - Jacob - this was your original :)
let $numberLove := $song[./songName/text() = $songN]//lyrics/text() 
(: whc: note the predicate. It selects only each specific $song that has a songName string
that matches a specific $songN, and then only performs the following operations on that. :)
! replace(., "love", " love ", "i") 
(: whc: we're going to look for the word "love" as separated by whitespaces in the next line, so
first we need to make sure that there are whitespaces around it, and not, say, punctuation. The
replace() function does that: it does a regex search within argument 1 (here, the self node . ), 
finds argument 2 (here, the word "love", and it searches in a case-insensitive form, thanks to 
the fourth argument, "i", which is called a "flag"), and when it finds any instance of "love", 
the third argument adds a space before and after, to make sure it's separated and the next function
can find it. And that is: :)
! (tokenize(.)[. = 'love'] => count())
(: whc: so now we tokenize(), meaning look at each section of the string separated by whitespaces;
look only at those ones where the substring equals "love"; and count them. We do NOT need to make
this tokenize() search case-insensitive because we already replaced any capital-L Loves with " love "
in the replace() function.:)
where $song[./songName/text() = $songN]//songWrite[@writer/matches(.,'Lennon')]
(: whc: for demonstration purposes, I added the above line, which allows you to filter by songwriter.
Note the predicate on $song, which is exactly the same as the one used earlier, and likewise is needed
for the same purpose: to align the same song that we're talking about. :)
order by $songN
(: whc: the order by isn't doing anything because it already defaults to ordering by the sequence
in which things appeared in the input XML doc, and that is the same as what you told it to do.
However, you could try ordering by $numberLove and experiment with descending.:)

return (concat ("&#xa;", "In ", $songN, ", love is said ", $numberLove, " times."))