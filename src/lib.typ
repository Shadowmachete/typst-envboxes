#let set-heading(body) = {
  set heading(numbering : "1.")
  body
}

#let show-heading(body) = {
  show heading: it => block[
    #context {
      counter("Envbox")
    }
    #counter(heading).display(it.numbering) #it.body
  ]
  body
}

#let env-init(body) = {
  show: set-heading
  body
}

#let box-colours = (
  default: (main: gray.darken(50%), body: gray.lighten(75%)),
  theorem: (main: rgb("#C5283D"), body: rgb("#C5283D").lighten(75%)),
  proposition: (main: rgb("#5F83D2"), body: rgb("#5F83D2").lighten(75%)),
  lemma: (main: rgb("#90C6B7"), body: rgb("#90C6B7").lighten(75%)),
  corollary: (main: rgb("#C34DD1"), body: rgb("#C34DD1").lighten(75%)),
  definition: (main: rgb("#FF851B"), body: rgb("#FF851B").lighten(75%)),
  example: (main: rgb("#8DC159"), body: rgb("#8DC159").lighten(75%)),
  remark: (main: rgb("#797979"), body: rgb("#797979").lighten(75%)),
  note: (main: rgb("#118D8D"), body: rgb("#118D8D").lighten(75%)),
  exercise: (main: rgb("#68B3FF"), body: rgb("#68B3FF").lighten(75%)),
  algorithm: (main: rgb("#66118D"), body: rgb("#66118D").lighten(75%)),
  claim: (main: rgb("#4A9952"), body: rgb("#4A9952").lighten(75%)),
  axiom: (main: rgb("#3FA1D2"), body: rgb("#3FA1D2").lighten(75%)),
)

#let display-counter(other-counter) = [
  #let heading-counter = counter(heading)
  #context { heading-counter.display() }#context { other-counter.display() }
]

#let no-counter = ("Example", "Remark", "Note", "Claim")

#let _state_headers = state("headers", ())

#let add_header(header) = {
  context {
    _state_headers.update(headers => {
      headers.push(header)
      headers
    })
  }
}

#let envbox(
  header: "Envbox",
  colour: "default",
  width: 100%,
  radius: 4pt,
  title: none,
  lighten_percent: 75%,
  darken_percent: 50%,
  provided-counter: none, // optional
  body
) = {
  let main-colour = gray.darken(darken_percent)
  let body-colour = gray.lighten(lighten_percent)

  if type(colour) == str {
    main-colour = box-colours.at(colour, default:(main: main-colour)).main
    body-colour = box-colours.at(colour, default:(body: body-colour)).body
  } else if type(colour) == dictionary {
    main-colour = colour.at("main", default: main-colour)
    body-colour = colour.at("body", default: body-colour)
  } else if type(colour) == color {
    main-colour = colour.darken(darken_percent)
    body-colour = colour.lighten(lighten_percent)
  }

  let resolved-counter = if provided-counter != none {
    provided-counter
  } else if not no-counter.contains(header) {
    counter(header)
  } else {
    none
  }

  return block[
    #context {
      if not _state_headers.get().contains(header) { 
        add_header(header)
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
          #text(fill: white)[#header
            #if resolved-counter != none {
              resolved-counter.step()
              display-counter(resolved-counter)
            }
            #if title != none { ": " + title}
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

#let theorem(
  title: none,
  body,
) = {
  return envbox(header: "Theorem", colour: "theorem", title: title)[#body]
}

#let proposition(
  title: none,
  body,
) = {
  return envbox(header: "Proposition", colour: "proposition", title: title)[#body]
}

#let lemma(
  title: none,
  body,
) = {
  return envbox(header: "Lemma", colour: "lemma", title: title)[#body]
}

#let corollary(
  title: none,
  body,
) = {
  return envbox(header: "Corollary", colour: "corollary", title: title)[#body]
}

#let definition(
  title: none,
  body,
) = {
  return envbox(header: "Definition", colour: "definition", title: title)[#body]
}

#let example(
  title: none,
  body,
) = {
  return envbox(header: "Example", colour: "example", title: title)[#body]
}

#let remark(
  title: none,
  body,
) = {
  return envbox(header: "Remark", colour: "remark", title: title)[#body]
}

#let note(
  title: none,
  body,
) = {
  return envbox(header: "Note", colour: "note", title: title)[#body]
}

#let exercise(
  title: none,
  body,
) = {
  return envbox(header: "Exercise", colour: "exercise", title: title)[#body]
}

#let algorithm(
  title: none,
  body,
) = {
  return envbox(header: "Algorithm", colour: "algorithm", title: title)[#body]
}

#let claim(
  title: none,
  body,
) = {
  return envbox(header: "Claim", colour: "claim", title: title)[#body]
}

#let axiom(
  title: none,
  body,
) = {
  return envbox(header: "Axiom", colour: "axiom", title: title)[#body]
}
