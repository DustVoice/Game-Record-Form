// License: This work © 2025 by David Holland is licensed under CC BY-NC-SA 4.0. To view a copy of this license, visit https://creativecommons.org/licenses/by-nc-sa/4.0/

#import "@preview/cetz:0.3.4"
#import "@preview/showybox:2.0.4": showybox

#let gen(
  page-size: "a4",
  spacing: 10mm,
  line-width: .2mm,
  board-size: 19,
  overlap-rows: 4,
  overlap-separator: sym.mapsto,
  overlap-spacing: 10mm,
  print-on-bigger: false,
  base-color: luma(25%),
  grid-color: green.lighten(50%),
  circle-color: green.lighten(75%),
) = {
  let (width, height) = if page-size == "a4" {
    (210mm, 297mm)
  } else if page-size == "a5" {
    (148mm, 210mm)
  } else if page-size == "a6" {
    (105mm, 148mm)
  } else {
    panic("Unsupported page-size provided: " + page-size)
  }

  set text(size: if page-size == "a4" { 11pt } else if page-size == "a5" { 8pt } else { 7pt })

  let hoshi = if board-size == 19 {
    ((16, 4), (16, 10), (16, 16),
     (10, 4), (10, 10), (10, 16),
     (4, 4), (4, 10), (4, 16))
  } else if board-size == 13 {
    ((10, 4), (10, 10),
     (7, 7),
     (4, 4), (4, 10))
  } else if board-size == 9 {
    ((7, 3), (7, 7),
     (5, 5),
     (3, 3), (3, 7))
  } else {
    panic("Unsupported board-size provided: " + board-size)
  }.map(val => (val.at(0) - 1, val.at(1) - 1))

  let line_normal = (paint: grid-color, thickness: line-width);
    
  let underline_box = box(width: 1fr, line(length: 100%, stroke: (dash: "dotted")))

  let margin_normal = spacing;
  let width_avail = width - (margin_normal * 2);

  let meta = (
    [#emoji.pin Event],
    [#emoji.calendar Date],
    [#emoji.clock Round],
    [#emoji.circle.black Black],
    [#emoji.circle.white White],
    [#emoji.plaster Handicap],
    [#emoji.hourglass Time],
    [#emoji.chart Komi],
    [#emoji.flag.red Result],
  )

  let comment-cols = calc.floor(width_avail / (spacing * 2))

  set text(fill: base-color)
  set line(stroke: base-color)
  
  let titlebox(height: auto, title, body) = showybox(
    frame: (
      border-color: base-color,
      inset: .5em,
      title-color: white,
      thickness: line-width
    ),
    title-style: (
      color: base-color,
      align: center,
      boxed-style: (
        anchor: (
          y: horizon,
          x: center
        )
      )
    ),
    body-style: (
      align: center
    ),
    align: center,
    spacing: 1em,
    width: 100% - spacing,
    title: title,
    body
  )
  
  let duplicate(count, content) = {
    for _ in range(count) {
      content
      colbreak()
    }
  }
  
  let columnize_duplicate(count, content) = {
    columns(count)[#duplicate(count, content)]
  }

  let page-content = [
    // Metadata
    #titlebox(
      [
        #heading[Game Record Form]
      ],
      grid(columns: 3, inset: .5em,  
        ..meta.map(c => c + h(1em) + underline_box)
      )
    )

    // Goban
    #align(center,
      cetz.canvas(debug: false, length: spacing, {
        import cetz.draw: *
    
        // Grid lines (horizontal)
        for row in range(board-size) {
          line(
            (0, row),
            (board-size - 1, row),
            stroke: line_normal
          )
        }
    
        // Grid lines (vertical)
        for col in range(board-size) {
          line(
            (col, 0),
            (col, board-size - 1),
            stroke: line_normal
          )
        }
    
        // Star points
        for h in hoshi {
          circle(h, radius: 4 * line-width, fill: grid-color, stroke: none)
        }
    
        // Circles
        for row in range(board-size) {
          for col in range(board-size) {
            circle((col, row), radius: spacing / 2, fill: none, stroke: (paint: circle-color, thickness: line-width))
          }
        }
      })
    )

    // Move mappings / Comments
    #if (overlap-rows > 0) {
      titlebox(
        [*Current* Move #sym.numero #overlap-separator *Existing* Move #sym.numero ],
        stack[
          #duplicate(overlap-rows,
            repeat(gap: .5em)[#box(width: overlap-spacing, underline_box) #overlap-separator #box(width: overlap-spacing, underline_box)] 
          )
        ]
      )
    }
  ]
  
  let footer_content = align(center)[This work © 2025 by David Holland is licensed under CC BY-NC-SA 4.0]
  
  set page(
    page-size,
    margin: (x: margin_normal, top: margin_normal, bottom: margin_normal * 2),
    footer: footer_content
  )

  if (not print-on-bigger) {
    page-content
  } else {
    set page(
      paper: {
        if page-size == "a4" { "a3" }
        else if page-size == "a5" { "a4" }
        else if page-size == "a6" { "a5" }
      },
      flipped: true,
      columns: 2,
      footer: columnize_duplicate(2, footer_content)
    )

    set text(size: if (page-size == "a6") { .5em } else { 1em })
    
    duplicate(2, page-content)
  }
}

// 19x19 - A4
#gen()

// 19x19 - A4 (2 on 1)
#gen(
  print-on-bigger: true,
  page-size: "a5",
  spacing: 7mm,
  line-width: .1mm)

// 13x13 - A4
#gen(board-size: 13)

// 13x13 - A4 (2 on 1)
#gen(
  board-size: 13,
  print-on-bigger: true,
  page-size: "a5",
  spacing: 7.5mm)

// 9x9 - A4
#gen(
  board-size: 9,
  spacing: 15mm)

// 9x9 - A4 (2 on 1)
#gen(
  board-size: 9,
  print-on-bigger: true,
  page-size: "a5",
  spacing: 10mm)

// 19x19 - A4 - ePaper
#gen(
  line-width: 0.25mm,
  base-color: luma(0%),
  grid-color: luma(33.3%),
  circle-color: luma(66.6%))
