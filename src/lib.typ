#import "predefined.typ": *
#import "utils.typ": *

#let set-heading(body) = {
  set heading(numbering : "1.")
  body
}

#let show-heading(body) = {
  show heading: it => block[
    // TODO: Add resets for all counters once they add
    // classes / custom types
    // #context {
    //   counter("Envbox").update(0)
    // }
    #counter(heading).display(it.numbering) #it.body
  ]
  body
}

#let env-init(body) = {
  show: set-heading
  body
}
