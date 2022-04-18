
   <svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%">
   <g alignment-baseline="baseline" transform="translate (100, 200)">
   
   

   {
let $h := //Q{}song [.//@status='False'][./Q{}songWrite/ data(@writer)[contains(., 'Harrison')]] =>count() 
let $l := //Q{}song [.//@status='False'][./Q{}songWrite/ data(@writer)[contains(., 'Lennon') ]] =>count() 
let $m := //Q{}song [.//@status='False'][./Q{}songWrite/ data(@writer)[contains(., 'McCartney')]] =>count() 
let $s := //Q{}song [.//@status='False'][./Q{}songWrite/ data(@writer)[contains(., 'Starr') ]] =>count() 

let $hl := //Q{}song [.//@status='False'][./Q{}songWrite/ data(@writer)[contains(., 'Harrison')  and contains(., 'Lennon') ]] =>count() 
let $hm := //Q{}song [.//@status='False'][./Q{}songWrite/ data(@writer)[contains(., 'Harrison')  and contains(., 'McCartney') ]] =>count() 
let $hs := //Q{}song [.//@status='False'][./Q{}songWrite/ data(@writer)[contains(., 'Harrison')  and contains(., 'Starr') ]] =>count()  
let $lm := //Q{}song [.//@status='False'][./Q{}songWrite/ data(@writer)[contains(., 'Lennon')  and contains(., 'McCartney') ]] =>count()  
let $ls := //Q{}song [.//@status='False'][./Q{}songWrite/ data(@writer)[contains(., 'Lennon')  and contains(., 'Starr') ]] =>count() 
let $ms := //Q{}song [.//@status='False'][./Q{}songWrite/ data(@writer)[contains(., 'McCartney')  and contains(., 'Starr') ]] =>count() 



return 
<g>
 <line x1="50" y1="50" x2="300" y2="50" stroke="black" stroke-width="{$hm}"/> <!--hm edge-->
        <line x1="50" y1="50" x2="50" y2="300" stroke="black" stroke-width="{$hl}"/><!--hl edge-->
        <line x1="50" y1="50" x2="300" y2="300" stroke="black" stroke-width="{$hs}"/><!--hs edge-->
        <line x1="50" y1="300" x2="300" y2="50" stroke="black" stroke-width="{$lm}"/><!--lm edge-->
        <line x1="50" y1="300" x2="300" y2="300" stroke="black" stroke-width="{$ls}"/><!--ls edge-->
        <line x1="300" y1="50" x2="300" y2="300" stroke="black" stroke-width="{$ms}"/><!--ms edge-->
        <circle cx="50" cy="50" r="{$h}" stroke="blue" stroke-width="2" fill="white" /> <!--h node-->
        <circle cx="300" cy="300" r="{$s}" stroke="green" stroke-width="2" fill="white" /><!--s node-->
        <circle cx="300" cy="50" r="{$m}" stroke="red" stroke-width="2" fill="white" /><!--m node-->
        <circle cx="50" cy="300" r="{$l}" stroke="purple" stroke-width="2" fill="white" /><!--l node-->
       
        
        
        <text x="50" y="50" stroke="black" stroke-width="1">H</text>
        <text x="50" y="300" stroke="black" stroke-width="1">L</text>
        <text x="300" y="50" stroke="black" stroke-width="1">M</text>
        <text x="300" y="300" stroke="black" stroke-width="1">S</text>
</g>
}
   
   </g>
</svg>


