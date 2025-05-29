#import "box_styles.typ": *
#import "COLOURS.typ": box-colours
#import "utils.typ": *

#let envbox(
  header: "Envbox",
  colour: "default",
  width: 100%,
  radius: 4pt,
  title: none,
  lighten_percent: 75%,
  darken_percent: 50%,
  provided-counter: none, // optional
  style: none,
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
      let actual-style = if style != none {
        style
      } else {
        get-envbox-style()
      }

      if actual-style == "classic" {
        ClassicBox(header, main-colour, body-colour, width, title, resolved-counter, body)
      } else if actual-style == "kayie" {
        Kayie(header, main-colour, body-colour, width, title, resolved-counter, body)
      } else {
        DefaultBox(header, main-colour, body-colour, width, radius, title, resolved-counter, body)
      }
    }
  ]

  // if resolved-style == "classic" {
  // } else {
  //   return DefaultBox(header, main-colour, body-colour, width, radius, title, resolved-counter, body)
  // }
}
