<html><head><title>Network Analysis</title>
<link rel="stylesheet" type="text/css" href="style.css"/>
</head>
<body>
<div id="content">
<h1>Network Analysis </h1>
<p>A network analysis is a graph that uses nodes, the circles, to represent people, places organizations, or some other thing. The lines connecting them, known as edges indicate a relationship between them. In this instance, the nodes are the beatles and those who have written songs with them. The width of the edges represent how many times they have written songs together. As you can see the strongest cowriting relationship is between John Lennon and Paul McCartney. The size of the node indicates the number of songs written by that person. </p>
   <svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%">
   <g alignment-baseline="baseline" transform="translate (200, 100)">
   
   
   {
let $h := //Q{}song [.//@status='False'][./Q{}songWrite/ data(@writer)[contains(., 'Harrison')]] =>count() 
let $l := //Q{}song [.//@status='False'][./Q{}songWrite/ data(@writer)[contains(., 'Lennon') ]] =>count() 
let $m := //Q{}song [.//@status='False'][./Q{}songWrite/ data(@writer)[contains(., 'McCartney')]] =>count() 
let $s := //Q{}song [.//@status='False'][./Q{}songWrite/ data(@writer)[contains(., 'Starr') ]] =>count() 
let $D :=//Q{}song [.//@status='False'][./Q{}songWrite/ data(@writer)[contains(., 'Donovan') ]] =>count()
let $JN :=//Q{}song [.//@status='False'][./Q{}songWrite/ data(@writer)[contains(., 'Jean_Nicolas') ]] =>count()
let $HH :=//Q{}song [.//@status='False'][./Q{}songWrite/ data(@writer)[contains(., 'Heinz_Hellmer') ]] =>count()
let $YO :=//Q{}song [.//@status='False'][./Q{}songWrite/ data(@writer)[contains(., 'Yoko_Ono') ]] =>count()
let $Lee :=//Q{}song [.//@status='False'][./Q{}songWrite/ data(@writer)[contains(., 'Lee_Montogue') ]] =>count()
let $hl := //Q{}song [.//@status='False'][./Q{}songWrite/ data(@writer)[contains(., 'Harrison')  and contains(., 'Lennon') ]] =>count() 
let $hm := //Q{}song [.//@status='False'][./Q{}songWrite/ data(@writer)[contains(., 'Harrison')  and contains(., 'McCartney') ]] =>count() 
let $hs := //Q{}song [.//@status='False'][./Q{}songWrite/ data(@writer)[contains(., 'Harrison')  and contains(., 'Starr') ]] =>count()  
let $lm := //Q{}song [.//@status='False'][./Q{}songWrite/ data(@writer)[contains(., 'Lennon')  and contains(., 'McCartney') ]] =>count()  
let $ls := //Q{}song [.//@status='False'][./Q{}songWrite/ data(@writer)[contains(., 'Lennon')  and contains(., 'Starr') ]] =>count() 
let $ms := //Q{}song [.//@status='False'][./Q{}songWrite/ data(@writer)[contains(., 'McCartney')  and contains(., 'Starr') ]] =>count() 
let $DML := //Q{}song [.//@status='False'][./Q{}songWrite/ data(@writer)[contains(., 'Donovan')  and contains(., 'McCartney') and contains(., 'Lennon') ]] =>count() 
let $HhM  := //Q{}song [.//@status='False'][./Q{}songWrite/ data(@writer)[contains(., 'Heinz_Hellmer')  and contains(., 'McCartney')   ]] =>count() 
let $HhL  := //Q{}song [.//@status='False'][./Q{}songWrite/ data(@writer)[contains(., 'Heinz_Hellmer')   and contains(., 'Lennon')  ]] =>count() 
let $HhJN  := //Q{}song [.//@status='False'][./Q{}songWrite/ data(@writer)[contains(., 'Heinz_Hellmer') and contains(., 'Jean_Nicolas') ]] =>count() 
let $hYO := //Q{}song [.//@status='False'][./Q{}songWrite/ data(@writer)[contains(., 'Harrison') and contains(., 'Yoko_Ono') ]] =>count() 
let $lYO := //Q{}song [.//@status='False'][./Q{}songWrite/ data(@writer)[ contains(., 'Lennon') and contains(., 'Yoko_Ono') ]] =>count() 
let $JNLee := //Q{}song [.//@status='False'][./Q{}songWrite/ data(@writer)[ contains(., 'Jean_Nicolas') and contains(., 'Lee_Montogue') ]] =>count() 
let $JNL := //Q{}song [.//@status='False'][./Q{}songWrite/ data(@writer)[ contains(., 'Lennon') and contains(., 'Jean_Nicolas') ]] =>count() 
let $JNM := //Q{}song [.//@status='False'][./Q{}songWrite/ data(@writer)[contains(., 'McCartney') and contains(., 'Jean_Nicolas')  ]] =>count() 
let $LeeM := //Q{}song [.//@status='False'][./Q{}songWrite/ data(@writer)[contains(., 'McCartney')  and contains(., 'Lee_Montogue') ]] =>count() 
let $LeeL := //Q{}song [.//@status='False'][./Q{}songWrite/ data(@writer)[contains(., 'Lennon') and contains(., 'Lee_Montogue') ]] =>count() 
  
return 
<g>
 <line x1="50" y1="50" x2="300" y2="50" stroke="black" stroke-width="{$hm}"/> <!--hm edge-->
        <line x1="50" y1="50" x2="50" y2="300" stroke="black" stroke-width="{$hl}"/><!--hl edge-->
        <line x1="50" y1="50" x2="300" y2="300" stroke="black" stroke-width="{$hs}"/><!--hs edge-->
        <line x1="50" y1="300" x2="300" y2="50" stroke="black" stroke-width="{$lm}"/><!--lm edge-->
        <line x1="50" y1="300" x2="300" y2="300" stroke="black" stroke-width="{$ls}"/><!--ls edge-->
        <line x1="300" y1="50" x2="300" y2="300" stroke="black" stroke-width="{$ms}"/><!--ms edge-->
        
        
        
        <line x1="-10" y1="0" x2="300" y2="50" stroke="red" stroke-width="{$DML}"/><!--DM edge-->
        <line x1="-10" y1="0" x2="50" y2="300" stroke="purple" stroke-width="{$DML}"/><!--DL edge-->
        <line x1="-10" y1="150" x2="50" y2="50" stroke="blue" stroke-width="{$hYO}"/><!--h YO edge-->
        <line x1="-10" y1="150" x2="50" y2="300" stroke="purple" stroke-width="{$lYO}"/><!--l YO edge-->
      
       
        <line x1="-40" y1="-30" x2="50" y2="300" stroke="purple" stroke-width="{$JNL}"/><!--JN L edge-->
        <line x1="-40" y1="-30" x2="300" y2="50" stroke="red" stroke-width="{$JNM}"/><!--JN M edge-->
        <line x1="-25" y1="-15" x2="-40" y2="-30" stroke="black" stroke-width="{$HhJN}"/><!--Hh JN edge-->   
        <line x1="-40" y1="-30" x2="-55" y2="-45" stroke="black" stroke-width="{$JNLee}"/><!--JN Lee edge-->
        <line x1="-55" y1="-45" x2="300" y2="50" stroke="red" stroke-width="{$LeeM}"/><!--Lee M edge-->
        <line x1="-55" y1="-45" x2="50" y2="300" stroke="purple" stroke-width="{$LeeL}"/><!--Lee L edge-->
        <line x1="-25" y1="-15" x2="300" y2="50" stroke="red" stroke-width="{$HhM}"/><!--Hh M edge-->
        <line x1="-25" y1="-15" x2="50" y2="300" stroke="purple" stroke-width="{$HhL}"/><!--Hh L edge-->
       
       
        <line x1="50" y1="50" x2="300" y2="300" stroke="black" stroke-width="{$hs}"/><!--hs edge-->
        <line x1="50" y1="300" x2="300" y2="50" stroke="black" stroke-width="{$lm}"/><!--lm edge-->
        <line x1="50" y1="300" x2="300" y2="300" stroke="black" stroke-width="{$ls}"/><!--ls edge-->
        <line x1="300" y1="50" x2="300" y2="300" stroke="black" stroke-width="{$ms}"/><!--ms edge-->
        
        <circle cx="50" cy="50" r="{$h}" stroke="blue" stroke-width="1" fill="white" /> <!--h node-->
        <circle cx="300" cy="300" r="{$s}" stroke="green" stroke-width="1" fill="white" /><!--s node-->
        <circle cx="300" cy="50" r="{$m}" stroke="red" stroke-width="" fill="white" /><!--m node-->
        <circle cx="50" cy="300" r="{$l}" stroke="purple" stroke-width="1" fill="white" /><!--l node-->
        
        
        <circle cx="-10" cy="0" r="{$D}" stroke="Black" stroke-width="1" fill="white" /><!--Donovan node-->
        <circle cx="-55" cy="-45" r="{$Lee}" stroke="Black" stroke-width="1" fill="white" /><!--Lee_Montogue node-->
        <circle cx="-40" cy="-30" r="{$JN}" stroke="Black" stroke-width="1" fill="white" /><!--Jean_Nicolas node-->
        <circle cx="-25" cy="-15" r="{$HH}" stroke="Black" stroke-width="1" fill="white" /><!--Heinz_Hellmer node-->
        
        
        <circle cx="-10" cy="150" r="{$YO}" stroke="Black" stroke-width="1" fill="white" /><!--Yoko_Ono node-->
       
        
        <text x="35" y="50" stroke="black" stroke-width="0.5" font-size="10">Harrison</text>
        <text x="35" y="303" stroke="black" stroke-width="0.5" font-size="10">Lennon</text>
        <text x="280" y="50" stroke="black" stroke-width="0.5" font-size="10">McCartney</text>
        <text x="289" y="303" stroke="black" stroke-width="0.5" font-size="10">Starr</text>
        
        
        <text x="-121" y="-44" stroke="black" stroke-width="0.5" font-size="10">Lee Montogue</text>
        <text x="-121" y="-27" stroke="black" stroke-width="0.5" font-size="10">Jean Nicolas</text>
        <text x="-121" y="-10" stroke="black" stroke-width="0.5" font-size="10">Heinz Hellmer</text>
        <text x="-121" y="7" stroke="black" stroke-width="0.5" font-size="10">Donovan</text>
        <text x="-60" y="155" stroke="black" stroke-width="0.5" font-size="10">Yoko Ono</text>
</g>
}
   
   </g>
</svg>
<p></p>
</div>
</body>
</html>
