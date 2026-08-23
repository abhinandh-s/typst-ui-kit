#import "../colors.typ": latte

#let init = html.style("
  /* unvisited link */
  a:link {
    color: " + latte.red.to-hex() + ";
  }

  /* visited link */
  a:visited {
    color: " + latte.rosewater.to-hex() + ";
  }

  /* mouse over link */
  a:hover {
    color: " + latte.sapphire.to-hex() + ";
    text-decoration: underline;
  }

  /* selected link */
  a:active {
    color: " + latte.green.to-hex() + ";
    text-decoration: underline;
  }
")