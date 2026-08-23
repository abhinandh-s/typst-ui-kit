#import "/src/lib.typ": alerts, init, checklist
// , theme-switcher
// #import "/src/topnav.typ": topnav
// #topnav()
// #theme-switcher()

#import "/src/toc.typ": floating-toc
#floating-toc()

#init.css()
#init.js()

#figure(
  image("8c346ecdd3a859b4d076baf9eb9698e1.jpg", width: 100%, height: auto),
  caption: [
    A step in the molecular testing
    pipeline of our lab.
  ],
)

= Headers

= First level title
== Second level title
=== Third level title
==== Fourth level title
===== Fifth level title

= Code

Inline `code span in` a paragraph.

```
This
  is
    code
      fence
```

```java
public class Main {
  public static void main(String[] args) {
    System.out.println("Hello, World!");
    System.out.println("This is some Java code!");
  }
}
```
This is a code block:

```
/**
 * Sorts the specified array into ascending numerical order.
 *
 * <p>Implementation note: The sorting algorithm is a Dual-Pivot Quicksort
 * by Vladimir Yaroslavskiy, Jon Bentley, and Joshua Bloch. This algorithm
 * offers O(n log(n)) performance on many data sets that cause other
 * quicksorts to degrade to quadratic performance, and is typically
 * faster than traditional (one-pivot) Quicksort implementations.
 *
 * @param a the array to be sorted
 */
public static void sort(byte[] a) {
    DualPivotQuicksort.sort(a);
}
```

= Admonishments / Alerts

#alerts.note[
  This is a GitHub-style note alert.
]

#alerts.warning[
  Be careful doing this!
]

#alerts.important[
  This is a very important message.
]

#alerts.tip[
  This is a GitHub-style note alert.
]

#alerts.caution[
  Be careful doing this!
]

#alerts.quote[
  This is a very important message.
]

#alerts.decree[
  This is a very important message. \
  - point 01
  - point 02
]

  = Addition Example

The sum of $4$ and $7$ is:

  $4 + 7 = #add(4, 7)$

#show: checklist

- [ ] Unchecked item
- [x] Checked item
