#import "envbox.typ": envbox

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

