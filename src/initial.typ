#import "colors.typ": latte

#let init() = context {
  if target() == "html" {
    html.style("
      pre {
        line-height: 1.2;
        background: " + latte.base.to-hex() + ";
        padding: 1.33em;
        border-radius: 0.33em;
        font-family: monospace;
        page-break-inside: avoid;
        overflow: auto;
        overflow-x: auto;
        white-space: pre-wrap;
        display: block;
        word-wrap: break-word;
        max-width: 100%;
      }
      figure img {
        max-width: 100%;
        height: auto !important;
      }
      figcaption {
        font-style: italic;
        padding: 2px;
        text-align: center;
      }
    ")
  }
}