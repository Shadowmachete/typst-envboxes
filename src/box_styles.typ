#import "utils.typ": display-counter, _state_headers, add-header, z-stack

#let DefaultBox(
  header,
  main-colour,
  body-colour,
  width,
  radius,
  title,
  resolved-counter,
  body
) = {
  return block[
    #context {
      if not _state_headers.get().contains(header) { 
        add-header(header)
      }
    }
    #box(
      stroke: main-colour,
      radius: radius,
      width: width,
    )[
      #stack(
        // Header box
        box(
          fill: main-colour,
          inset: 8pt,
          radius: (top-left: radius, top-right: radius),
          width: width,
        )[
          #text(fill: white, weight: "bold")[#header
            #if resolved-counter != none {
              resolved-counter.step()
              display-counter(resolved-counter)
            }
            #if title != none { "- " + title}
          ]
        ],

        // Body box
        box(
          fill: body-colour,
          inset: 8pt,
          radius: (bottom-left: radius, bottom-right: radius),
          width: width,
        )[
          #body
        ],
      )
    ]
  ]
}

#let ClassicBox(
  header,
  main-colour,
  body-colour,
  width,
  title,
  resolved-counter,
  body
) = {
  return block[
    #context {
      if not _state_headers.get().contains(header) { 
        add-header(header)
      }
    }
    #box(
      stroke: (left: main-colour),
      fill: body-colour,
      width: width,
    )[
      #box(
        inset: 8pt,
        width: width,
      )[
        #text(fill: main-colour, weight: "bold")[#header
          #if resolved-counter != none {
            resolved-counter.step()
            display-counter(resolved-counter)
          }
          #if title != none { "- " + title}
        ] \
        #body
      ]
    ]
  ]
}

#let Kayie(
  header,
  main-colour,
  body-colour,
  width,
  title,
  resolved-counter,
  body
) = {
  let triangle(size) = {
    z-stack(
      polygon.regular(size: size, fill: body-colour, vertices: 3),
      line(
        start: (0pt, 3/4*size),
        end: (7/8*size/2, 3/4*size - 7/8*size/2 * calc.sqrt(3)),
        stroke: main-colour
      ),
      line(
        start: (7/8*size, 3/4*size),
        end: (7/8*size/2, 3/4*size - 7/8*size/2 * calc.sqrt(3)),
        stroke: main-colour
      ),
    )
  }

  let tail = curve(
    fill: body-colour,
    stroke: main-colour,
    curve.cubic(auto, (-10pt, 20pt), (70pt, 20pt)),
    curve.cubic((90pt, 20pt), (100pt, 15pt), (60pt, 0pt)),
    curve.line((30pt, 0pt)),
  )

  return block[
    #context {
      if not _state_headers.get().contains(header) { 
        add-header(header)
      }
    }
    #box[
      #stack(
        spacing: -0.5pt,
        grid(
          columns: (13.5pt, 23pt, 13.5pt, auto),
          triangle(15pt),
          line(start: (0pt, 10pt), end: (23pt, 10pt), stroke: main-colour),
          triangle(15pt),
          line(start: (0pt, 10pt), length: 100%, stroke: main-colour),
        ),
        box(
          stroke: (left: main-colour, right: main-colour),
          fill: body-colour,
          width: width,
        )[
          #box(
            inset: 8pt,
            width: width,
          )[
            #text(fill: main-colour, weight: "bold")[#header
              #if resolved-counter != none {
                resolved-counter.step()
                display-counter(resolved-counter)
              }
              #if title != none { "- " + title}
            ] \
            #body
          ]
        ],
        grid(
          columns: (auto, 30pt, 50pt),
          line(length: 100%, stroke: main-colour),
          tail,
          line(length: 100%, stroke: main-colour)
        )
      )
    ]
  ]
}
