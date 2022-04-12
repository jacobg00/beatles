declare option saxon:output "method=text";


(://song [.//@status='False'][./songWrite/ data(@writer)[contains(., 'Lennon')  and contains(., 'Harrison') ]] =>count() 






:)





let $hl := //song [.//@status='False'][./songWrite/ data(@writer)[contains(., 'Harrison')  and contains(., 'Lennon') ]] =>count() 
let $hm := //song [.//@status='False'][./songWrite/ data(@writer)[contains(., 'Harrison')  and contains(., 'McCartney') ]] =>count() 
let $hs := //song [.//@status='False'][./songWrite/ data(@writer)[contains(., 'Harrison')  and contains(., 'Starr') ]] =>count()  
let $lm := //song [.//@status='False'][./songWrite/ data(@writer)[contains(., 'Lennon')  and contains(., 'McCartney') ]] =>count()  
let $ls := //song [.//@status='False'][./songWrite/ data(@writer)[contains(., 'Lennon')  and contains(., 'Starr') ]] =>count() 
let $ms := //song [.//@status='False'][./songWrite/ data(@writer)[contains(., 'McCartney')  and contains(., 'Starr') ]] =>count() 

return concat(
'Harrison', '&#x9;', 'Lennon', '&#x9;', $hl, '&#10;', 
'Harrison', '&#x9;', 'McCartney', '&#x9;', $hm,  '&#10;',
'Harrison', '&#x9;', 'Starr',  '&#x9;', $hs, '&#10;',
'Lennon', '&#x9;', 'McCartney', '&#x9;', $lm,  '&#10;',
'Lennon', '&#x9;', 'Starr', '&#x9;', $ls,  '&#10;',
'McCartney', '&#x9;', 'Starr', '&#x9;', $ms,  '&#10;'

) 


