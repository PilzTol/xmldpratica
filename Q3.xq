declare namespace xsl = "http://www.w3.org/1999/XSL/Transform";
let $movies := doc("movies.xml")/Movies/Movie
for $range in distinct-values(for $movie in $movies return floor($movie/Title/@runtime div 100))
order by $range
let $range-movies := $movies[floor(Title/@runtime div 100) = $range]
return
  <ul data-range="{concat($range * 100, '-', ($range + 1) * 100 - 1)}" data-count="{count($range-movies)}">
    {
      for $movie in $range-movies
      order by $movie/Title/@runtime
      return
        <li data-runtime="{$movie/Title/@runtime}">
          {data($movie/Title)}
        </li>
    }
  </ul>
