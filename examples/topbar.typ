#import "/src/lib.typ": *

#table(
  columns: (1fr, auto),
  inset: 10pt,
  align: horizon,
  table.header(
    [*Movies/Series*], [*Rating*],
  ),
  [Breaking Bad], [#rating(rating: 4, icon: "sparkle")],
  [Better Call Soul],
  [#rating(rating: 4)],
  [Breaking Bad], [#rating(rating: 4.5, icon: "dot")],
  [Breaking Bad], [#rating(rating: 4.9, icon: "square")],
  [Breaking Bad], [#rating(rating: 4.3, icon: "heart")],
)

#rating(rating: 3.4) \
#rating(rating: 4.8, icon: "heart") \
#rating(rating: 1.5, icon: "sparkle") \
#rating(rating: 7.8, total: 10, icon: "heart") \

#codetabs(
  (
    name: "main.rs",
    code: ```rust
    fn main() {
      println!("Hello World!");
    }

    fn legendary() -> Result<&str, Error> {
      "Ted! you are coming to Laser tags with me, and it's gonna be legen... wait for it... dary. Legendary."
    }
    ```
  ),
  (
    name: "run.sh",
    code: ```sh
    cargo run --release
    ```
  ),
)