#import "/src/lib.typ": *

#table(
  columns: (1fr, auto),
  inset: 10pt,
  align: horizon,
  table.header(
    [*Movies/Series*], [*Rating*],
  ),
  [El Camino], [#rating(rating: 4.5, icon: "sparkle")],
  [Better Call Soul],
  [#rating(rating: 5)],
  [Shutter Island], [#rating(rating: 4.7, icon: "dot")],
  [Shawshank Redemption], [#rating(rating: 5, icon: "square")],
  [Breaking Bad], [#rating(rating: 5, icon: "heart")],
)

#lorem(25)

#codetabs(
  (
    name: "main.rs",
    code: ```rust
    fn main() {
      println!("Hello World!");
    }

    fn legendary() -> Result<&str, Error> {
      Ok("Ted! you are coming to Laser tags with me, and it's gonna be legen... wait for it... dary. Legendary.")
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

#lorem(15)


#accordion(
  (
    summary: "section 01",
    ctx: lorem(15)
  ),
  (
    summary: "section 02",
    ctx: lorem(15)
  ),
  (
    summary: "section 03",
    ctx: lorem(15)
  ),
)