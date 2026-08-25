#import "/src/lib.typ": alerts


= Text Formatting

*For getting loud* - bold \
_Mamma Mia!_ - italics \
This is #highlight[important]. - highlight \
#overline[A line over text.] - overline \
#smallcaps[Hello] - small capital \
This is #strike[not] relevant. - strikethrough \
Revenue#sub[yearly] - subscript \
1#super[st] try! - superscript \
This is #underline[important]. - underline \

= Code & Pre

Adding `rbx` to `rcx` gives
the desired result.

What is ```rust fn main()``` in Rust
would be ```c int main()``` in C.

```rust
fn hello() -> Result<(), Error> {
    println!("Hello World!");
    Ok(())
}
```

This has ``` `backticks` ``` in it
(but the spaces are trimmed). And
``` here``` the leading space is
also trimmed.

= Structure

title - H1

= Heading Level 01

= Lorem Ipsum

#quote(attribution: [Lorem])[Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...]

#quote(block: true, attribution: [Ipsum])["There is no one who loves pain itself, who seeks after it and wants to have it, simply because it is pain..."]





Donec _posuere mauris auctor quam malesuada_ faucibus. Nulla sollicitudin mauris quam, sed rhoncus nisi posuere in. Sed fringilla placerat metus sit amet accumsan. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean placerat finibus viverra. Donec lacinia libero ut diam ultrices eleifend. Curabitur tincidunt tellus eu sem mattis, eu dignissim enim faucibus. Vestibulum molestie, arcu in consequat auctor, lacus sapien tempus neque, sit amet ornare enim ante ac diam. Integer ligula mauris, imperdiet in ex eu, suscipit maximus lectus.#footnote[Vestibulum molestie, arcu in consequat auctor, lacus sapien tempus neque, sit amet ornare enim ante ac diam.]

Aliquam ut augue diam. Donec ac vulputate neque. Interdum et malesuada fames ac ante ipsum primis in faucibus. Donec nec tellus imperdiet, interdum neque ac, faucibus nunc. Suspendisse volutpat diam vel ullamcorper porttitor. Curabitur congue, augue at lacinia pretium, lorem mauris suscipit ipsum, nec aliquet nisi orci vitae enim. Etiam nunc ante, faucibus vel diam sit amet, ultricies pulvinar justo. Maecenas vitae elementum metus, eget tincidunt nibh.

Etiam eu lectus a libero aliquam imperdiet at quis quam. Curabitur tincidunt tincidunt urna, ut fringilla nisi suscipit sit amet. Aliquam in quam vel est venenatis lobortis eget eget metus. Fusce ultricies orci ac elit ullamcorper tincidunt. Etiam nec neque sodales, faucibus elit vel, mollis mauris. Vestibulum felis ante, tincidunt nec lobortis non, varius at ante. Morbi a purus blandit, fermentum turpis quis, rutrum sem. Duis dolor diam, tincidunt ut magna sit amet, lobortis ultricies massa. Phasellus lacinia aliquet dui, eget aliquam lorem cursus at.

Suspendisse commodo consequat elit ac ultrices. Mauris finibus non quam eu auctor. Curabitur pulvinar, felis sed condimentum tincidunt, nibh metus venenatis metus, ac vehicula augue arcu molestie enim. Integer ut arcu turpis. Cras viverra metus id dolor tristique accumsan. Mauris condimentum, orci id posuere venenatis, dui lorem tristique nibh, sed finibus nibh diam quis nulla. Quisque a lectus bibendum, semper massa at, aliquet enim.


#alerts.note[
  Suspendisse commodo consequat elit ac ultrices. Mauris finibus non quam eu auctor. 
]

#alerts.warning[
  Curabitur pulvinar, felis sed condimentum tincidunt, nibh metus venenatis metus, ac vehicula augue arcu molestie enim. 
]

#alerts.important[
  Integer ut arcu turpis. Cras viverra metus id dolor tristique accumsan. 
]

#alerts.tip[
  Mauris condimentum, orci id posuere venenatis, dui lorem tristique nibh, sed finibus nibh diam quis nulla. 
]

#alerts.caution[
  Quisque a lectus bibendum, semper massa at, aliquet enim.
]

#alerts.quote[
  Etiam eu lectus a libero aliquam imperdiet at quis quam. Curabitur tincidunt tincidunt urna, ut fringilla nisi suscipit sit amet. 
]

#alerts.decree[
  This Aliquam in quam vel est venenatis lobortis eget eget metus. Fusce ultricies orci ac elit ullamcorper tincidunt. Etiam nec neque sodales, faucibus elit vel, mollis mauris. Vestibulum felis ante, tincidunt nec lobortis non, varius at ante. Morbi a purus blandit, fermentum turpis quis, rutrum sem. Duis dolor diam, tincidunt ut magna sit amet, lobortis ultricies massa. Phasellus lacinia aliquet dui, eget aliquam lorem cursus at. \
  - point 01
  - point 02
]


= Bullet Lists

Normal list.
- Text
- Math
- Layout
- something

Multiple lines.
- This list item spans multiple
  lines because it is indented.

Function call.
#list(
  [Foundations],
  [Calculate],
  [Construct],
  [Data Loading],
)

= Divider

#divider()

= Links


https://example.com \

#link("https://example.com") \
#link("https://example.com")[
  See example.com
]


= Numbered List

Automatically numbered:
+ Preparations
+ Analysis
+ Conclusions

Manually numbered:
2. What is the first step?
5. I am confused.
+  Moving on ...

Multiple lines:
+ This enum item has multiple
  lines because the next line
  is indented.

Function call.
#enum[First][Second]

= Table

#set table(
  stroke: none,
  gutter: 0.2em,
  fill: (x, y) =>
    if x == 0 or y == 0 { gray },
  inset: (right: 1.5em),
)

#show table.cell: it => {
  if it.x == 0 or it.y == 0 {
    set text(white)
    strong(it)
  } else if it.body == [] {
    // Replace empty cells with 'N/A'
    pad(..it.inset)[_N/A_]
  } else {
    it
  }
}

#let a = table.cell(
  fill: green.lighten(60%),
)[A]
#let b = table.cell(
  fill: aqua.lighten(60%),
)[B]

#table(
  columns: (1.2fr, 1fr, 1fr, 1fr, 1.2fr, 1.8fr),
  align: (left, center, center, center, left, left),
  [*Type*], [*Contributes Capital*], [*Takes parts in Mngt.*], [*Known to public*], [*Liability*], [*Special Point*],
  [Active/Working], [yes], [yes], [yes], [unlimited], [shares profits and losses of firm],
  [Sleeping/Dormant], [yes], [no], [no], [unlimited], [shares profits and losses of firm],
  [Secret], [yes], [yes], [no], [unlimited], [shares profits and losses of firm],
  [Limited], [yes], [no], [possible], [limited to share & profit], [],
  [Partner in Profit], [yes (or goodwill)], [no], [possible], [unlimited], [shares profits only],
  [Nominal], [no], [no], [yes], [unlimited (to outsiders only)], [Does not shares profits and losses of firm],
  [Minor], [yes], [no], [possible], [limited to share & profit], [Shares profits only],
)



= Term List

/ Ligature: A merged glyph.
/ Kerning: A spacing adjustment
  between two adjacent letters.


= Highlight


This is #highlight[important].

#let today = datetime.today()

// Default ISO format (YYYY-MM-DD)
Today's date: #today.display()

// Custom formatted
Today's date: #today.display("[month repr:long] [day], [year]")
// Output: August 24, 2026

