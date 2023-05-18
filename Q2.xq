declare namespace xsl = "http://www.w3.org/1999/XSL/Transform";
<table border="1">
  <thead>
    <tr>
      <th>Rating</th>
      <th>Title</th>
    </tr>
  </thead>
  <tbody>
    {
      for $movie in doc("movies.xml")/Movies/Movie
      order by $movie/@rating
      where not($movie/preceding-sibling::Movie[@rating = $movie/@rating])
      return
        (
        <tr>
          <td rowspan="{count($movie/following-sibling::Movie[@rating = $movie/@rating]) + 1}">
            {data($movie/@rating)}
          </td>
          <td>{data($movie/Title)}</td>
        </tr>,
        for $sibling in $movie/following-sibling::Movie[@rating = $movie/@rating]
        return
          <tr>
            <td>{data($sibling/Title)}</td>
          </tr>
        )
    }
  </tbody>
</table>
