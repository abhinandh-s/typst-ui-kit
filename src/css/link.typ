import "../colors.typ": latte

#let init = html.style("
  /* unvisited link */
  a:link {
    color: " + latte.red + ";
  }

  /* visited link */
  a:visited {
    color: " + latte.rosewater + ";
  }

  /* mouse over link */
  a:hover {
    color: " + latte.sapphire + ";
    text-decoration: underline;
  }

  /* selected link */
  a:active {
    color: " + latte.green + ";
    text-decoration: underline;
  }
")