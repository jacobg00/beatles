let $instrumental := //vocals[@vocalist="Instrumental"]
let $instrumental-count := $instrumental => count()


return (concat("&#xa;", "The Beatles' discography contains ", $instrumental-count, " instrumentals."))