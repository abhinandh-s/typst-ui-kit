#import "/src/lib.typ": alerts

= Lorem Ipsum

#quote(attribution: [Lorem])["Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit..."]

#quote(block: true, attribution: [Ipsum])["There is no one who loves pain itself, who seeks after it and wants to have it, simply because it is pain..."]

*Lorem ipsum* dolor sit amet, consectetur adipiscing elit. Sed eu ante ut sapien dignissim dapibus quis ut sem. Nullam justo lectus, mattis non nisi sit amet, lacinia pulvinar tellus. Vestibulum pellentesque aliquam velit, a commodo felis feugiat a. Nunc lobortis nunc sem, non pellentesque nisl pharetra non. Fusce laoreet porta tortor id hendrerit. Sed neque velit, viverra a nunc et, convallis varius neque. In finibus tellus ut consectetur bibendum. Integer euismod leo nec euismod tristique. Fusce dignissim, felis et tempor fermentum, turpis metus feugiat leo, vel luctus magna neque ut sapien. Phasellus porttitor commodo ornare. Sed ultricies neque neque, et ornare libero aliquet quis. Pellentesque cursus sollicitudin metus at ultricies. Suspendisse vel imperdiet lorem, vitae convallis leo.

Donec _posuere mauris auctor quam malesuada_ faucibus. Nulla sollicitudin mauris quam, sed rhoncus nisi posuere in. Sed fringilla placerat metus sit amet accumsan. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean placerat finibus viverra. Donec lacinia libero ut diam ultrices eleifend. Curabitur tincidunt tellus eu sem mattis, eu dignissim enim faucibus. Vestibulum molestie, arcu in consequat auctor, lacus sapien tempus neque, sit amet ornare enim ante ac diam. Integer ligula mauris, imperdiet in ex eu, suscipit maximus lectus.

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
  columns: 4,
  [], [Exam 1], [Exam 2], [Exam 3],

  [John], [], a, [],
  [Mary], [], a, a,
  [Robert], b, a, b,
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

