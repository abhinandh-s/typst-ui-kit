#import "colors.typ": latte

#let init = html.style("
pre {
    background: " + latte.base.to-hex() + ";
    padding: 1.33em;
    border-radius: 0.33em;
    font-family: monospace;
}
")