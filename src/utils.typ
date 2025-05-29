#let display-counter(other-counter) = [
  #let heading-counter = counter(heading)
  #context { heading-counter.display() }#context { other-counter.display() }
]

#let no-counter = ("Example", "Remark", "Note", "Claim", "Question")

#let _state_headers = state("headers", ())

#let add-header(header) = {
  context {
    _state_headers.update(headers => {
      headers.push(header)
      headers
    })
  }
}

#let _envbox_style = state("envbox-style", "default")

#let set-envbox-style(style) = {
  context {
    _envbox_style.update(style)
  }
}

#let get-envbox-style() = _envbox_style.get()

#let z-stack(..items) = {
  grid(
    columns: items.pos().len() * (1fr,),
    column-gutter: -100%,
    rows: 1,
    ..items
  )
}

