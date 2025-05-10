#import "@math/envboxes:0.1.0": *

#show: env-init

= Initial test
#envbox[this is a test]

= Title test
#envbox(title: "abc")[abc is the title]

= Custom colours test
Splitting into sections of 2 to test subsection / section counter

== Red and Blue
#envbox(colour: red, title: "red box")[This box should be reddish]
#envbox(colour: blue, title: "blue box")[This box should be bluish]

== Green and Gray
#envbox(colour: green, title: "green box")[This box should be greenish]
#envbox(colour: gray, title: "gray box")[This box should be grayish]

== Purple and Orange
#envbox(colour: purple, title: "purple box")[This box should be purplish]
#envbox(colour: orange, title: "orange box")[This box should be orangish]

= Theorem box test
#theorem[This is a theorem without title]
#theorem(title: "Theorem title")[This is a theorem with a title]

= Proposition box test
#proposition[This is a proposition without title]
#proposition(title: "Proposition title")[This is a proposition with a title]

= Lemma box test
#lemma[This is a lemma without title]
#lemma(title: "Lemma title")[This is a lemma with a title]

= Corollary box test
#corollary[This is a corollary without title]
#corollary(title: "Corollary title")[This is a corollary with a title]

= Definition box test
#definition[This is a definition without title]
#definition(title: "Definition title")[This is a definition with a title]

= Example box test
#example[This is a example without title]
#example(title: "Example title")[This is a example with a title]

= Remark box test
#remark[This is a remark without title]
#remark(title: "Remark title")[This is a remark with a title]

= Note box test
#note[This is a note without title]
#note(title: "Note title")[This is a note with a title]

= Exercise box test
#exercise[This is a exercise without title]
#exercise(title: "Exercise title")[This is a exercise with a title]

= Algorithm box test
#algorithm[This is a algorithm without title]
#algorithm(title: "Algorithm title")[This is a algorithm with a title]

= Claim box test
#claim[This is a claim without title]
#claim(title: "Claim title")[This is a claim with a title]

= Axiom box test
#axiom[This is a axiom without title]
#axiom(title: "Axiom title")[This is a axiom with a title]
