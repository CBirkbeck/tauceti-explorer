# Arithmetic quantum topology, Habiro invariants and regulators

## Purpose

This roadmap builds the **unified Witten–Reshetikhin–Turaev invariant of integral homology spheres** and the
**extended Bloch class of a hyperbolic 3-manifold**, and states, without pretending to prove, the arithmetic
conjectures that relate them. The spine is Kazuo Habiro, *A unified Witten–Reshetikhin–Turaev invariant for
integral homology spheres* (arXiv:math/0605314v1; Invent. Math. **171** (2008) 1–81), which produces a single
element $J_M$ of the Habiro ring whose evaluation at every root of unity is the quantum invariant at that root
and whose Taylor expansion at $q=1$ is the Ohtsuki series. The geometric half is Walter D. Neumann, *Extended
Bloch group and the Cheeger–Chern–Simons class* (arXiv:math/0307092; Geom. Topol. **8** (2004) 413–474), which
attaches to a hyperbolic 3-manifold a class whose Rogers dilogarithm is $i(\mathrm{vol} + i\,\mathrm{cs})$.

The point of the unified invariant is that one ring element carries the whole family of quantum invariants.
That is what makes the arithmetic questions of this roadmap statable at all: integrality, Galois equivariance
and the $p$-adic behaviour of the quantum invariants become statements about a single element of a ring of
*analytic functions at roots of unity*, rather than about an unrelated family of algebraic numbers.

## How this document is organized

There is one section per layer. Each section gives the layer's objects (definitions and constructions, with the
suggested module, the statement, the API declarations and the unit tests that pin the definition down), then its
theorems (statement, hypotheses, proof outline and the results used), then the layer's dependencies and what is
still missing. The blueprint packet `research/blueprint/packets/ArithmeticQuantumTopology.json` carries the same
material with source locators and excerpts, and `research/blueprint/suggested/ArithmeticQuantumTopology.lean`
sketches the Lean signatures. Library paths are relative to `TauCeti/QuantumTopology`.

## Scope and boundaries

**In scope.** Habiro's construction and its consequences: the integral forms of $U_h(sl_2)$ and the braided Hopf
structure on the completed even form (§§2–3 of the source); bottom tangles and the universal $sl_2$ invariant (§4);
the coloured Jones polynomials, the cyclotomic basis and the cyclotomic expansion of a knot (§§5–6); integrality
and divisibility for algebraically split $0$-framed links (§8); the twist element and the twisting theorem (§9);
the unified invariant, its well-definedness, its divisibility and its multiplicativity (§§10, 12.1); evaluation at
roots of unity, integrality and Galois equivariance, determination by the family of quantum invariants, and the
Ohtsuki series (§§11, 12.2–12.6). On the geometric side: ideal tetrahedra, gluing and completeness equations,
combinatorial flattenings, the lifted five-term relation, the extended Bloch element and the volume and
Chern–Simons theorem.

**Out of scope in the first pass, and now partly in scope.** The first pass recorded four gaps of this kind. The
second pass (see the section at the end of this document) closes four of them: the general Lie type variants are
decomposed from Habiro–Lê; the rational homology sphere boundary is stated with its three reasons; and QT.6 and
QT.7, which the first pass left unread, are decomposed from Garoufalidis–Zagier. What remains out of scope, and
is still recorded as a gap, is the $p$-adic and mod $p$ quantum functions of §13 of the source; a primary
state-integral source, with its contour, its normalisation and the non-compact quantum dilogarithm; the
refinements of the quantum modularity conjecture; the construction of the integral core subalgebra for a general
simple Lie algebra; and a primary source for any *proved* quantum-modular example.

**Boundaries with neighbouring roadmaps.**

- `HabiroCyclotomicCompletions` owns the Habiro ring itself, its evaluation maps and their injectivity on subsets
  with a limit point, and the $q$-shifted factorial identities. This roadmap uses that ring and does not build it.
- The Tau Ceti geometric-topology roadmap owns framed and oriented link presentations, the Reidemeister moves,
  surgery and the classical Kirby calculus, and the Jones polynomial in the Kauffman-bracket normalisation. QT.0
  should import them and keep only the refinement to admissible links; QT.2 should import the Jones polynomial and
  state the comparison of normalisations. Both are recorded in the packet's `restructure` notes.
- `Polylogarithms` owns the dilogarithm, the Bloch–Wigner function and the weight-two regulator, including the
  identity between the Bloch–Wigner function and the volume of an ideal tetrahedron. QT.5 imports that identity.
- `K3BlochGroups` owns the Bloch group of a field; the extended Bloch group of QT.5 maps onto it.
- `HabiroNahmSeries` owns the Nahm series and the asymptotic toolkit that QT.6 would consume.

## Conventions

- $q = \exp(h)$ and $v = \exp(h/2)$, so $v^2 = q$; quantum integers are $[n] = (v^n - v^{-n})/(v - v^{-1})$.
- Framings are **Seifert-normalised**: the $0$-framing of a knot is the Seifert framing, and a diagram with the
  blackboard framing has framing equal to the writhe. This is the normalisation under which the linking matrix of
  an admissible link is diagonal with entries $\pm 1$.
- Surgery glues so that the meridian of the new solid torus goes to the slope $f_i$; the orientation of the result
  is the induced one, and "homeomorphic" always means orientation-preserving homeomorphic.
- The coloured Jones polynomial is **unreduced**: the $0$-framed unknot coloured by $V_n$ has value $[n+1]$. The
  reduced invariant is the quotient by that value.
- An ideal tetrahedron is **ordered**; its shape is the cross-ratio in that order, and its three edge parameters
  $z$, $1/(1-z)$, $1-1/z$ multiply to $-1$.

## QT.0 Framed links, surgery and normalization

*Coverage:* **partial**. The refinement this stage exists for is decomposed: admissible links, Hoste moves, the refined calculus and the existence of an admissible presentation. The classical Kirby and Fenn-Rourke theorems are stated as nodes but cited rather than decomposed, and belong to the geometric-topology roadmap.

### Objects

#### Definition. Framed oriented links and their linking matrix

*Module* `TauCeti/QuantumTopology/Surgery/FramedLinkAndLinkingMatrix.lean`. *Node* `ArithmeticQuantumTopology:QT.0/framed-link-and-linking-matrix`.

A framed oriented link L = L_1 cup ... cup L_m in the 3-sphere is an oriented link together with an integer f_i for each component, the framing, understood as the surgery coefficient of that component relative to the Seifert framing. Its linking matrix is the integer m-by-m symmetric matrix Lk(L) with off-diagonal entries lk(L_i, L_j) and diagonal entries f_i. L is algebraically split when lk(L_i, L_j) = 0 for all i different from j, and unit-framed when every f_i is 1 or -1.

*Hypotheses.* L is a link in the oriented 3-sphere with a chosen orientation of each component; the framing of each component is an integer, normalised against the Seifert framing (framing 0).

*API.*

- `linkingMatrix` (*data*) — linkingMatrix L is a symmetric integer matrix indexed by the components of L.
- `linkingMatrix_symm` (*characterisation*) — linkingMatrix L is symmetric: its (i,j) and (j,i) entries agree.
- `linkingMatrix_diag` (*projection*) — The (i,i) entry of linkingMatrix L is the framing of the i-th component.
- `IsAlgebraicallySplit` (*structure*) — IsAlgebraicallySplit L holds when every off-diagonal entry of linkingMatrix L vanishes.
- `linkingMatrix_of_move` (*compatibility*) — The linking matrix is unchanged by the moves of the chosen carrier, so it is an invariant of the framed link type.

*Used by.*

- `ArithmeticQuantumTopology:QT.0/admissible-framed-link` — Admissibility is a condition on the linking matrix: zero off the diagonal and plus or minus one on it.
- `ArithmeticQuantumTopology:QT.0/surgery-presentation` — The first homology of the surgered manifold is the cokernel of the linking matrix, so the matrix decides when the result is an integral homology sphere.
- `ArithmeticQuantumTopology:QT.2/integrality-algebraically-split` — The integrality theorem is stated for algebraically split 0-framed links, a condition on this matrix.

*Unit tests.* A wrong definition fails one of these.

- `linkingMatrix_unknot` — The linking matrix of the 0-framed unknot is the 1-by-1 zero matrix.
- `linkingMatrix_hopf` — The linking matrix of the 0-framed Hopf link is [[0,1],[1,0]], which is not diagonal, so the Hopf link is not algebraically split.
- `linkingMatrix_blackboard` — For a diagram with the blackboard framing, the diagonal entry of the linking matrix is the writhe of that component; this distinguishes the Seifert normalisation from the blackboard one.
- `not_algebraicallySplit_of_det_ne` — A two-component link whose linking matrix has a nonzero off-diagonal entry is not algebraically split; in particular the Hopf link is a non-example.

*Planet:* Framed link and linking matrix.

*Source.* A unified Witten-Reshetikhin-Turaev invariant for integral homology spheres, Section 10.1, e-print p. 51: “We call a framed link L in S^3 admissible if L is algebraically-split and each component has framing plus or minus 1.” Habiro fixes exactly this normalisation of framings and linking numbers before defining the class of links his surgery formula uses.

#### Construction. Surgery on a framed link and the homology of the result

*Module* `TauCeti/QuantumTopology/Surgery/SurgeryPresentation.lean`. *Node* `ArithmeticQuantumTopology:QT.0/surgery-presentation`.

For a framed oriented link L in the 3-sphere, let S^3(L) be the closed oriented 3-manifold obtained by removing an open tubular neighbourhood of L and regluing solid tori so that the meridian of the i-th new solid torus is sent to the curve of slope f_i on the corresponding torus boundary. The first homology of S^3(L) is the cokernel of the linking matrix of L. In particular S^3(L) is an integral homology sphere if and only if the linking matrix has determinant plus or minus 1, and S^3 itself is the result of surgery on the empty link.

*Hypotheses.* L is a framed oriented link in the oriented 3-sphere; the gluing is orientation-reversing on the boundary tori, so that S^3(L) carries an induced orientation.

*API.*

- `surgery` (*constructor*) — surgery L is the closed oriented 3-manifold obtained by surgery on the framed link L.
- `surgery_empty` (*example*) — Surgery on the empty framed link is the 3-sphere.
- `homology_surgery` (*characterisation*) — The first homology of surgery L is the cokernel of linkingMatrix L.
- `isIntegralHomologySphere_iff` (*characterisation*) — surgery L is an integral homology sphere if and only if the determinant of linkingMatrix L is a unit.
- `surgery_disjoint_union` (*functoriality*) — Surgery on a split union of framed links is the connected sum of the surgeries.

*Used by.*

- `ArithmeticQuantumTopology:QT.3/definition-of-JM` — The unified invariant is defined from a surgery presentation of the manifold and must be shown independent of it.
- `ArithmeticQuantumTopology:QT.0/refined-kirby-calculus` — The move theorem is a statement about when two framed links have orientation-preserving homeomorphic surgeries.

*Unit tests.* A wrong definition fails one of these.

- `surgery_empty_eq_sphere` — Surgery on the empty link is the 3-sphere, so the invariant of the empty presentation must be the invariant of the 3-sphere.
- `surgery_unknot_pm_one` — Surgery on the plus-one-framed unknot is again the 3-sphere: a definition that gave a different manifold here would be wrong.
- `homology_surgery_unknot_p` — Surgery on the p-framed unknot has first homology cyclic of order the absolute value of p; for p = 0 this is infinite cyclic, so that presentation is not an integral homology sphere.

*Planet:* Surgery along a framed link.

*Source.* A unified Witten-Reshetikhin-Turaev invariant for integral homology spheres, Section 10.2, e-print pp. 51-52: “Let M be an integral homology sphere, and let L be an admissible framed link in S^3 such that M is obtained from S^3 by surgery along L.” The construction of the unified invariant starts from exactly this surgery presentation.

#### Definition. Admissible framed links

*Module* `TauCeti/QuantumTopology/Surgery/AdmissibleFramedLink.lean`. *Node* `ArithmeticQuantumTopology:QT.0/admissible-framed-link`.

A framed link L in the 3-sphere is admissible if it is algebraically split, that is all pairwise linking numbers vanish, and every component has framing plus 1 or minus 1. Surgery on an admissible link always yields an integral homology sphere, since its linking matrix is diagonal with entries plus or minus 1 and hence unimodular; conversely every integral homology sphere is obtained by surgery on an admissible link.

*Hypotheses.* L is a framed oriented link in the 3-sphere.

*API.*

- `IsAdmissible` (*structure*) — IsAdmissible L holds when L is algebraically split and every framing is plus or minus one.
- `isAdmissible_iff` (*characterisation*) — IsAdmissible L holds if and only if linkingMatrix L is diagonal with all diagonal entries of absolute value one.
- `isIntegralHomologySphere_of_isAdmissible` (*compatibility*) — If L is admissible then surgery L is an integral homology sphere.
- `isAdmissible_empty` (*example*) — The empty framed link is admissible.

*Used by.*

- `ArithmeticQuantumTopology:QT.0/refined-kirby-calculus` — The refined move theorem is a statement about admissible links only.
- `ArithmeticQuantumTopology:QT.3/definition-of-JM` — The surgery formula for the unified invariant is evaluated on an admissible presentation, where the twist element can be inserted componentwise.

*Unit tests.* A wrong definition fails one of these.

- `isAdmissible_unknot_one` — The plus-one-framed unknot is admissible.
- `not_isAdmissible_unknot_zero` — The 0-framed unknot is not admissible; this is the case that separates admissibility from the algebraically split condition alone.
- `not_isAdmissible_hopf` — The unit-framed Hopf link is not admissible, since its off-diagonal linking number is 1.

*Planet:* Admissible framed link.

*Source.* A unified Witten-Reshetikhin-Turaev invariant for integral homology spheres, Section 10.1, e-print p. 51: “We call a framed link L in S^3 admissible if L is algebraically-split and each component has framing plus or minus 1.” Verbatim the definition this node records.

#### Definition. Kirby moves and the Fenn-Rourke move

*Module* `TauCeti/QuantumTopology/Surgery/KirbyAndFennRourkeMoves.lean`. *Node* `ArithmeticQuantumTopology:QT.0/kirby-and-fenn-rourke-moves`.

On framed links in the 3-sphere, the first Kirby move (blow-up and blow-down) adds or deletes a split unknotted component with framing plus or minus 1; the second Kirby move (handle slide) replaces a component L_i by a band sum of L_i with a parallel copy of L_j taken along the framing of L_j, and changes the framings by f_i becomes f_i + f_j + 2 lk(L_i, L_j). The Fenn-Rourke move is the single move that replaces the part of a framed link inside a ball meeting an unknotted component K of framing plus or minus 1 by the result of a full twist along a disc bounded by K, deleting K.

*Hypotheses.* the moves are performed inside the 3-sphere on framed oriented links; framings are the Seifert-normalised integers of the linking-matrix node.

*API.*

- `IsKirbyMove` (*structure*) — IsKirbyMove L L' holds when L' is obtained from L by one blow-up, blow-down or handle slide.
- `IsFennRourkeMove` (*structure*) — IsFennRourkeMove L L' holds when L' is obtained from L by one Fenn-Rourke twist.
- `surgery_eq_of_isKirbyMove` (*compatibility*) — A Kirby move does not change the surgered manifold up to orientation-preserving homeomorphism.
- `linkingMatrix_congr_of_handleSlide` (*compatibility*) — A handle slide changes the linking matrix by congruence with a unimodular matrix.
- `kirbyEquiv` (*relation*) — kirbyEquiv is the equivalence relation generated by isotopy and Kirby moves.

*Used by.*

- `ArithmeticQuantumTopology:QT.0/refined-kirby-calculus` — The refined theorem is stated for the sub-relation generated by the Fenn-Rourke moves that stay inside the admissible class.
- `ArithmeticQuantumTopology:QT.3/JM-well-defined` — Independence of the unified invariant is proved against this move relation.

*Unit tests.* A wrong definition fails one of these.

- `kirbyEquiv_empty_unknot_one` — The empty link and the plus-one-framed unknot are Kirby equivalent, since one blow-down relates them.
- `framing_of_handleSlide` — Sliding L_1 over L_2 in the 0-framed Hopf link changes the framing of the first component by f_2 + 2 lk = 0 + 2, which pins the sign convention.
- `not_kirbyEquiv_of_ne_homology` — Two framed links whose cokernels are non-isomorphic groups are not Kirby equivalent, since surgery is invariant; the 0-framed and 3-framed unknots are a non-example pair.

*Planet:* Kirby and Fenn-Rourke moves.

*Source.* A unified Witten-Reshetikhin-Turaev invariant for integral homology spheres, Section 10.1, e-print p. 51: “Recall that two framed links in S^3 yield orientation-preserving homeomorphic results of surgery if and only if they are related by a sequence of isotopies and Fenn-Rourke moves.” Habiro states the classical calculus in the Fenn-Rourke form before refining it to admissible links.

#### Definition. Hoste moves between admissible links

*Module* `TauCeti/QuantumTopology/Surgery/HosteMove.lean`. *Node* `ArithmeticQuantumTopology:QT.0/hoste-move`.

A Hoste move is a Fenn-Rourke move between two admissible framed links. Equivalently, it is a Fenn-Rourke move whose source and target are both algebraically split with all framings plus or minus one; the admissibility of both ends is part of the definition, not a consequence of it, since a Fenn-Rourke move applied to an admissible link generally leaves the admissible class.

*Hypotheses.* both the source and the target of the move are admissible framed links.

*API.*

- `IsHosteMove` (*structure*) — IsHosteMove L L' holds when L and L' are admissible and related by one Fenn-Rourke move.
- `hosteEquiv` (*relation*) — hosteEquiv is the equivalence relation on admissible framed links generated by isotopy and Hoste moves.
- `isFennRourkeMove_of_isHosteMove` (*compatibility*) — Every Hoste move is a Fenn-Rourke move.
- `hosteEquiv_refl` (*relation*) — hosteEquiv is reflexive on admissible links.

*Used by.*

- `ArithmeticQuantumTopology:QT.0/refined-kirby-calculus` — The refined calculus says exactly that Hoste equivalence detects orientation-preserving homeomorphism of the surgeries.
- `ArithmeticQuantumTopology:QT.3/JM-well-defined` — Well-definedness is proved by checking invariance of the surgery formula under a single Hoste move.

*Unit tests.* A wrong definition fails one of these.

- `isHosteMove_blowdown_unknot` — Deleting a split plus-one-framed unknot from an admissible link is a Hoste move.
- `not_isHosteMove_of_target_not_admissible` — A Fenn-Rourke move whose target has a component of framing 2 is not a Hoste move; this is the case that makes the refinement a genuine restriction.
- `hosteEquiv_of_isotopy` — Isotopic admissible links are Hoste equivalent.

*Planet:* Hoste move.

*Source.* A unified Witten-Reshetikhin-Turaev invariant for integral homology spheres, Theorem 10.1 and the sentence after it, e-print p. 51: “Here a Hoste move is defined to be a Fenn-Rourke move between two admissible framed links.” Verbatim the definition this node records.

### Theorems

#### Theorem. Refined Kirby calculus for admissible links (Hoste's conjecture)

*Node* `ArithmeticQuantumTopology:QT.0/refined-kirby-calculus`.

Two admissible framed links L and L' in the 3-sphere yield orientation-preserving homeomorphic results of surgery if and only if L and L' are related by a sequence of isotopies and Hoste moves.

*Hypotheses.* L and L' are admissible framed links in the oriented 3-sphere.

*Proof outline.*

1. The easy direction is that a Hoste move is a Fenn-Rourke move and therefore does not change the surgered manifold.
2. For the converse, take a sequence of Fenn-Rourke moves relating L to L' given by the classical calculus; the intermediate links need not be admissible.
3. Follow the cited refinement, which replaces that sequence by one staying inside the admissible class.
4. Conclude that Hoste equivalence of admissible links is exactly orientation-preserving homeomorphism of the surgeries.

*Acceptance.*

- Applied to the empty link and a plus-one-framed unknot, the theorem gives a Hoste move, which it must, since both present the 3-sphere.
- Any invariant of admissible links that is unchanged by a single Hoste move descends to an invariant of integral homology spheres.
- The theorem is false with 'Hoste move' replaced by 'Kirby move' as a statement about admissible links, since an intermediate link of a Kirby sequence need not be admissible.

*Uses.* `ArithmeticQuantumTopology:QT.0/hoste-move`, `ArithmeticQuantumTopology:QT.0/refined-presentation-existence`.

*Planet:* Refined Kirby calculus.

*Source.* A unified Witten-Reshetikhin-Turaev invariant for integral homology spheres, Theorem 10.1, e-print p. 51: “Two admissible framed links L and L' in S^3 yield orientation-preserving homeomorphic results of surgery if and only if L and L' are related by a sequence of isotopies and Hoste moves.” Verbatim the theorem this node records; Habiro attributes it to the refinement of Kirby calculus that settles Hoste's conjecture.

#### Theorem. Every integral homology sphere has an admissible surgery presentation

*Node* `ArithmeticQuantumTopology:QT.0/refined-presentation-existence`.

For every integral homology sphere M there is an admissible framed link L in the 3-sphere with surgery along L orientation-preserving homeomorphic to M.

*Hypotheses.* M is a closed oriented 3-manifold with the integral homology of the 3-sphere.

*Proof outline.*

1. Start from any surgery presentation of M, which exists by the classical theorem that every closed oriented 3-manifold is surgery on a framed link.
2. Diagonalise the linking matrix over the integers by handle slides and blow-ups, using unimodularity of the matrix of an integral homology sphere.
3. Blow up to change the diagonal entries to plus or minus one and to kill the remaining linking numbers, keeping the surgered manifold fixed.
4. Record the resulting link, which is algebraically split with unit framings, hence admissible.

*Acceptance.*

- The 3-sphere has the empty admissible presentation.
- The Poincare homology sphere, presented by plus or minus one surgery on the left trefoil, already has an admissible presentation with one component.
- A manifold with non-trivial first homology has no admissible presentation, since the linking matrix of an admissible link is unimodular.

*Uses.* `ArithmeticQuantumTopology:QT.0/admissible-framed-link`.

*Source.* A unified Witten-Reshetikhin-Turaev invariant for integral homology spheres, Section 10.2, e-print pp. 51-52: “Let M be an integral homology sphere, and let L be an admissible framed link in S^3 such that M is obtained from S^3 by surgery along L.” The definition of the unified invariant presupposes the existence of such a presentation, which this node isolates.

### What is missing

- A primary decomposition of the classical Kirby and Fenn-Rourke move theorems, or an import of them from the geometric-topology roadmap.
- The proof that every integral homology sphere has an admissible presentation, whose steps here are recorded but not sourced to a primary text.

## QT.1 Ribbon categories and quantum group invariants

*Coverage:* **partial**. The quantum-group side is decomposed in the form the source actually uses: the integral forms, the ribbon structure, the braided Hopf structure on the completed even form, bottom tangles, the universal invariant and its integrality.

### Objects

#### Definition. The h-adic quantized enveloping algebra of sl(2) and its integral forms

*Module* `TauCeti/QuantumTopology/QuantumGroup/QuantizedEnvelopingAlgebra.lean`. *Node* `ArithmeticQuantumTopology:QT.1/quantized-enveloping-algebra`.

Let U_h be the h-adically complete algebra over the ring of formal power series in h over the rationals generated by H, E and F with the usual relations, with q = exp(h), v = exp(h/2), K = exp(hH/2). Inside it sit the integral forms U_q, generated over the ring of Laurent polynomials in v by the divided powers of F, the powers of K and the element e = (q-1)F, and its even part U_q^ev generated by the same divided powers, the even powers of K and e. Their h-adic completions are written with a tilde. The even integral form is a left module over the odd one.

*Hypotheses.* the ground ring of U_h is the ring of formal power series in h over the rationals; v is a square root of q with q = exp(h).

*API.*

- `Uq` (*data*) — Uq is the integral form of U_h generated by the divided powers of F, the powers of K and the element e.
- `Uqev` (*data*) — Uqev is the even integral form, generated by the divided powers of F, the even powers of K and e.
- `basis_Uq` (*characterisation*) — The monomials in the divided powers of F, the powers of K and e freely span Uq over the Laurent polynomials in v.
- `Uqev_le_Uq` (*structure*) — Uqev is a subalgebra of Uq, and a left Uq-submodule under the adjoint action.
- `completion` (*constructor*) — The h-adic completions of Uq and Uqev, with their filtrations, are again algebras.

*Used by.*

- `ArithmeticQuantumTopology:QT.1/braided-hopf-structure` — The braided Hopf algebra structure is carried by the completed even integral form.
- `ArithmeticQuantumTopology:QT.1/universal-sl2-invariant` — The universal invariant of a bottom tangle takes values in completed tensor powers of these forms.

*Unit tests.* A wrong definition fails one of these.

- `basis_freeness` — The listed monomials are linearly independent over the Laurent polynomial ring; a spanning claim without freeness would not pin the form down.
- `Uqev_ne_Uq` — K itself lies in Uq and not in Uqev, so the two forms are different.
- `classical_limit` — Modulo h the algebra is the classical enveloping algebra of sl(2); a form with the wrong classical limit is wrong.

*Planet:* Integral forms of U_h(sl2).

*Source.* A unified Witten-Reshetikhin-Turaev invariant for integral homology spheres, Section 2.3, Lemma 2.1, e-print pp. 12-13: “Uq (resp. Uqev) is freely spanned over the Laurent polynomial ring by the elements F-divided-power K^j e^k (resp. F-divided-power K^{2j} e^k) with i, k at least 0 and j an integer.” The freeness statement this node records as the basis of both integral forms.

#### Construction. The ribbon structure of U_h(sl(2))

*Module* `TauCeti/QuantumTopology/QuantumGroup/RibbonStructure.lean`. *Node* `ArithmeticQuantumTopology:QT.1/ribbon-structure`.

The algebra U_h carries a ribbon Hopf algebra structure: a coproduct, counit and antipode, a universal R-matrix satisfying the hexagon identities, and a central ribbon element whose square is the product of the two Drinfeld elements. The category of topologically free U_h-modules of finite rank is then a ribbon category, so every framed oriented tangle diagram gives a morphism invariant under the framed Reidemeister moves.

*Hypotheses.* U_h is the h-adically complete quantized enveloping algebra of the previous node.

*API.*

- `universalR` (*data*) — The universal R-matrix of U_h, an invertible element of the completed tensor square.
- `yangBaxter` (*relation*) — The universal R-matrix satisfies the Yang-Baxter equation.
- `ribbonElement` (*data*) — The ribbon element is a central invertible element with the standard compatibility with the coproduct and antipode.
- `braidedCategory_modules` (*instance*) — The category of finite-rank topologically free U_h-modules is braided, with braiding given by the R-matrix.
- `rigidCategory_modules` (*instance*) — The same category is rigid, with duals given by the antipode and the grouplike element.

*Used by.*

- `ArithmeticQuantumTopology:QT.1/universal-sl2-invariant` — The universal invariant of a tangle is built from the R-matrix, the duality maps and the ribbon element.
- `ArithmeticQuantumTopology:QT.2/coloured-jones` — Colouring by finite-dimensional modules and taking quantum traces turns the universal invariant into the coloured Jones polynomials.

*Unit tests.* A wrong definition fails one of these.

- `ribbon_unknot_framing` — Changing the framing of a component by one multiplies the invariant by the scalar by which the ribbon element acts; this fixes the framing anomaly.
- `R_matrix_classical_limit` — Modulo h the R-matrix is the identity, so the braiding degenerates to the symmetry of the classical category.
- `quantum_dimension_V1` — The quantum dimension of the 2-dimensional module is the quantum integer [2], not 2; a definition returning the ordinary dimension is wrong.

*Planet:* Ribbon structure of U_h.

*Source.* A unified Witten-Reshetikhin-Turaev invariant for integral homology spheres, Section 3.1, e-print pp. 19-20: “Ribbon structure for U_h.” The section that records the ribbon Hopf algebra structure of U_h that this node fixes as its normalisation.

#### Definition. Bottom tangles and their closure

*Module* `TauCeti/QuantumTopology/QuantumGroup/BottomTangle.lean`. *Node* `ArithmeticQuantumTopology:QT.1/bottom-tangle`.

An n-component bottom tangle is a framed oriented tangle in a cube consisting of n arcs, the i-th running from the (2i)-th to the (2i-1)-th point of a row of 2n points on the bottom face, with no closed components. Closing each arc by an arc in the exterior gives an n-component framed oriented link, the closure, and every framed oriented link is the closure of a bottom tangle. Bottom tangles compose by stacking and tensor by juxtaposition.

*Hypotheses.* tangles are framed and oriented, and considered up to isotopy fixing the boundary.

*API.*

- `BottomTangle` (*structure*) — BottomTangle n is the type of n-component bottom tangles up to isotopy.
- `closure` (*constructor*) — closure sends a bottom tangle to a framed oriented link with the same number of components.
- `closure_surjective` (*characterisation*) — Every framed oriented link is the closure of some bottom tangle.
- `comp` (*functoriality*) — Bottom tangles compose by stacking, compatibly with the closure on the relevant part.
- `tensor` (*functoriality*) — Juxtaposition of bottom tangles corresponds to the split union of their closures.

*Used by.*

- `ArithmeticQuantumTopology:QT.1/universal-sl2-invariant` — The universal invariant is defined on bottom tangles, where the algebra structure of the target matches the stacking.
- `ArithmeticQuantumTopology:QT.2/cyclotomic-expansion` — The cyclotomic expansion of a knot is stated for a bottom knot and transported to its closure.

*Unit tests.* A wrong definition fails one of these.

- `closure_trivial` — The closure of the trivial bottom tangle is the zero-framed unlink.
- `closure_of_bottom_knot` — A one-component bottom tangle closes to a knot; the number of components is preserved.
- `bottomTangle_not_closed` — A tangle with a closed component is not a bottom tangle; this excludes the degenerate case where the universal invariant would already be a trace.

*Planet:* Bottom tangle.

*Source.* A unified Witten-Reshetikhin-Turaev invariant for integral homology spheres, Section 4.1, e-print pp. 26-27: “Bottom tangles.” The section that fixes the bottom tangle conventions used throughout, and on which the universal invariant is defined.

#### Construction. The universal sl(2) invariant of a bottom tangle

*Module* `TauCeti/QuantumTopology/QuantumGroup/UniversalSl2Invariant.lean`. *Node* `ArithmeticQuantumTopology:QT.1/universal-sl2-invariant`.

To an n-component bottom tangle T one associates an element J_T of the n-fold completed tensor power of U_h, by reading a tangle diagram of T from the bottom, assigning the universal R-matrix and its inverse to crossings, the duality elements to critical points and the ribbon element to framing changes. The result is invariant under the framed Reidemeister moves, and is multiplicative for the stacking and the juxtaposition.

*Hypotheses.* T is a framed oriented bottom tangle; the ribbon structure of U_h is the one fixed above.

*API.*

- `J` (*data*) — J T is the universal invariant of the bottom tangle T, an element of the completed n-fold tensor power.
- `J_trivial` (*example*) — The universal invariant of the trivial bottom tangle is the unit.
- `J_comp` (*functoriality*) — The universal invariant is multiplicative under stacking of bottom tangles.
- `J_tensor` (*functoriality*) — The universal invariant of a juxtaposition is the tensor product of the invariants.
- `J_mem_invariants` (*characterisation*) — The universal invariant lies in the adjoint-invariant part of the completed tensor power.

*Used by.*

- `ArithmeticQuantumTopology:QT.2/coloured-jones` — Applying quantum traces in finite-dimensional modules turns the universal invariant into the coloured Jones polynomials.
- `ArithmeticQuantumTopology:QT.3/definition-of-JM` — The surgery formula pairs the universal invariant of a bottom tangle with copies of the twist element.

*Unit tests.* A wrong definition fails one of these.

- `J_unknot_zero_framed` — The universal invariant of the 0-framed unknotted bottom tangle is the unit.
- `J_framing_change` — Adding a positive kink multiplies the invariant by the ribbon element; an assignment invariant under the first Reidemeister move would be the wrong, unframed, invariant.
- `J_hopf_nontrivial` — The universal invariant of the bottom tangle closing to the Hopf link is not the unit, so the invariant sees linking.

*Planet:* Universal sl(2) invariant.

*Source.* A unified Witten-Reshetikhin-Turaev invariant for integral homology spheres, Section 4.2, e-print pp. 27-28: “Universal sl_2 invariant of bottom tangles.” The construction this node records, in the normalisation used for the integrality theorem below.

### Theorems

#### Theorem. Braided Hopf algebra structure on the completed even integral form

*Node* `ArithmeticQuantumTopology:QT.1/braided-hopf-structure`.

The braided Hopf algebra structure of the braided transmutation of U_h induces a braided Hopf algebra structure with invertible antipode on the h-adic completion of the even integral form; that is, each of the braided structure maps, and the inverses of the braiding and the antipode, carries the completed even form into the appropriate completed tensor power.

*Hypotheses.* the completed even integral form is the one of the definition node; the braided Hopf structure on U_h is the transmutation of its ribbon Hopf structure.

*Proof outline.*

1. Recall the braided transmutation of U_h: the same algebra with the braided coproduct and antipode built from the R-matrix.
2. Check on the free basis of the even form that each structure map has image in the completed tensor power of the even form.
3. Extend to the completion by continuity, using that each structure map respects the defining filtration.
4. Record that the same holds for the odd form and for the Z/2-grading, which is the variant used for bottom knots.

*Acceptance.*

- Each of the braided product, unit, coproduct, counit, antipode and its inverse preserves the integral form.
- A structure map that left the integral form would break the integrality of the universal invariant, which is the point of the theorem.
- The statement fails for the non-completed form, so the completion is not cosmetic.

*Uses.* `ArithmeticQuantumTopology:QT.1/quantized-enveloping-algebra`, `ArithmeticQuantumTopology:QT.1/ribbon-structure`.

*Planet:* Braided Hopf structure on the integral form.

*Source.* A unified Witten-Reshetikhin-Turaev invariant for integral homology spheres, Theorem 3.1, e-print p. 22: “The braided Hopf algebra structure of the braided transmutation of U_h induces a braided Hopf algebra structure with invertible antipode for the completed even integral form.” Verbatim the theorem this node records.

#### Theorem. Integrality of the universal invariant on 0-framed bottom tangles

*Node* `ArithmeticQuantumTopology:QT.1/universal-invariant-integrality`.

If T is an n-component 0-framed bottom tangle then its universal invariant lies in the n-th integral submodule, namely the image of the completed n-fold tensor power of the even integral form inside the completed tensor power of U_h.

*Hypotheses.* T is a 0-framed bottom tangle with n components.

*Proof outline.*

1. Reduce to generators: the universal invariant of any bottom tangle is built from finitely many structure maps applied to the invariant of the elementary tangles.
2. Check that the invariant of each elementary 0-framed piece lies in the integral submodule.
3. Apply the theorem that the braided structure maps preserve the completed even integral form, so the property propagates through the construction.
4. Conclude by the closure property of the family of integral submodules under those maps.

*Acceptance.*

- The invariant of the 0-framed unknotted bottom tangle lies in the integral submodule, being the unit.
- The theorem fails for non-zero framings, where the ribbon element contributes denominators; this is why the framing hypothesis is present.
- Integrality is what makes the coloured Jones polynomials Laurent polynomials rather than rational functions.

*Uses.* `ArithmeticQuantumTopology:QT.1/universal-sl2-invariant`, `ArithmeticQuantumTopology:QT.1/braided-hopf-structure`.

*Source.* A unified Witten-Reshetikhin-Turaev invariant for integral homology spheres, Theorem 4.1, e-print p. 28: “If T is a 0-framed n-component bottom tangle then its universal invariant lies in the n-th integral submodule.” Verbatim the theorem this node records.

### What is missing

- The root-of-unity semisimplification and the Reshetikhin-Turaev surgery normalisation, which the stage text also asks for and which this source does not provide; they need a primary Reshetikhin-Turaev reference.
- The structure theorem for the centre of the completed even integral form, quoted here from a companion paper.

## QT.2 Colored Jones polynomials and cyclotomic expansions

*Coverage:* **partial**. The cyclotomic expansion, the cyclotomic basis and the integrality and divisibility theorem for algebraically split links are decomposed from the primary source.

### Objects

#### Construction. Coloured Jones polynomials from the universal invariant

*Module* `TauCeti/QuantumTopology/ColouredJones/ColouredJones.lean`. *Node* `ArithmeticQuantumTopology:QT.2/coloured-jones`.

For a framed oriented m-component link L presented as the closure of a bottom tangle T, and finite-dimensional U_h-modules V_{n_1}, ..., V_{n_m} of dimensions n_i + 1, the coloured Jones polynomial J_L(V_{n_1}, ..., V_{n_m}) is obtained by applying the quantum trace in V_{n_i} to the i-th tensor factor of the universal invariant of T. It is an invariant of the framed oriented link, multilinear in the colours, and normalised so that the 0-framed unknot coloured by V_n has value the quantum integer [n+1].

*Hypotheses.* L is a framed oriented link, presented as the closure of a bottom tangle; the colours are finite-dimensional U_h-modules.

*API.*

- `colouredJones` (*data*) — colouredJones L n is the coloured Jones polynomial of the framed link L with the given colours.
- `colouredJones_unknot` (*example*) — The 0-framed unknot coloured by V_n has value the quantum integer [n+1].
- `colouredJones_multilinear` (*functoriality*) — The coloured Jones invariant is multilinear in the colours, hence extends to the representation ring.
- `reducedJones` (*data*) — The reduced coloured Jones polynomial is the quotient by the value of the unknot with the same colour.
- `colouredJones_framing_change` (*compatibility*) — Changing the framing of a component multiplies the invariant by the ribbon scalar of its colour.

*Used by.*

- `ArithmeticQuantumTopology:QT.2/cyclotomic-expansion` — The cyclotomic expansion is an expansion of the reduced coloured Jones polynomials of a knot.
- `ArithmeticQuantumTopology:QT.3/definition-of-JM` — The surgery formula is a pairing of these invariants, extended to the completion, with the twist element.

*Unit tests.* A wrong definition fails one of these.

- `colouredJones_unknot_V1` — The 0-framed unknot coloured by the 2-dimensional module has value the quantum integer [2], not 1; a definition returning 1 is the reduced one.
- `colouredJones_trefoil_V1` — The 2-dimensional colour on the right trefoil gives the Jones polynomial of the trefoil in the pinned variable, which fixes the chirality convention.
- `colouredJones_split_union` — For a split union the invariant is the product of the invariants, so a definition that failed multiplicativity would be wrong.

*Planet:* Coloured Jones polynomial.

*Source.* A unified Witten-Reshetikhin-Turaev invariant for integral homology spheres, Sections 5.2 and 5.3, e-print pp. 33-35: “Colored Jones polynomials. Quantum trace and the colored Jones polynomial.” The two subsections that define the coloured invariants from the universal invariant in the normalisation used here.

#### Definition. The elements P_n and the cyclotomic basis of the representation ring

*Module* `TauCeti/QuantumTopology/ColouredJones/PBasis.lean`. *Node* `ArithmeticQuantumTopology:QT.2/p-basis`.

Inside the representation ring of U_h over the rationals in v, set P_n to be the product over i from 0 to n-1 of (V_1 - v^{2i+1} - v^{-2i-1}) up to the fixed normalisation, and P''_n its rescaling by the stated quantum binomial factor. These elements satisfy the two triangular change-of-basis formulas expressing P_n in the V_i and V_n in the P_i with quantum binomial coefficients, so that the P_n form a basis of the representation ring adapted to the cyclotomic expansion.

*Hypotheses.* the ground ring contains the Laurent polynomials in v.

*API.*

- `P` (*data*) — P n is the n-th cyclotomic element of the representation ring.
- `P_zero` (*example*) — P 0 is the unit of the representation ring.
- `V_eq_sum_P` (*characterisation*) — V n is the sum over i of the quantum binomial coefficient times P i.
- `P_eq_sum_V` (*characterisation*) — P n is the displayed alternating sum of the V_i with quantum binomial coefficients.
- `P_basis` (*structure*) — The family P n is a basis of the representation ring over the coefficient ring in which the change of basis is invertible.

*Used by.*

- `ArithmeticQuantumTopology:QT.2/cyclotomic-expansion` — The cyclotomic expansion is the expansion of the universal invariant of a bottom knot in the dual basis to the P''_n.
- `ArithmeticQuantumTopology:QT.2/algebra-P-and-completion` — The span of the P_n is the algebra whose completion carries the twist element.

*Unit tests.* A wrong definition fails one of these.

- `P_one` — P 1 equals V_1 minus the quantum integer [2]; a different constant would break the vanishing of the pairing below.
- `V_one_in_P` — Expanding V_1 in the P basis gives P_1 plus the quantum integer [2] times P_0, the inverse of the previous test.
- `P_change_of_basis_triangular` — The change of basis is triangular with invertible diagonal, so a non-triangular family is not this one.

*Planet:* Cyclotomic basis P_n.

*Source.* A unified Witten-Reshetikhin-Turaev invariant for integral homology spheres, Lemma 6.1 and equations (6.1)-(6.2), e-print pp. 36-37: “For n at least 0 we have the two displayed expansions of P_n in the V_i and of V_n in the P_i with quantum binomial coefficients.” The two change-of-basis formulas this node records.

#### Definition. The algebra spanned by the cyclotomic elements and its completion

*Module* `TauCeti/QuantumTopology/ColouredJones/AlgebraPAndCompletion.lean`. *Node* `ArithmeticQuantumTopology:QT.2/algebra-P-and-completion`.

Let P be the span over the Laurent polynomial ring in v of the elements P_n inside the representation ring over the rationals in v. Then P is a subalgebra, with the displayed structure constants expressing the product P_m P_n as a quantum binomial combination of the P_{m+n-i}, and its completion with respect to the filtration by the ideals generated by the P_n with n at least k is the ring in which the twist element lives.

*Hypotheses.* the coefficient ring is the Laurent polynomials in v.

*API.*

- `algebraP` (*data*) — algebraP is the span of the P_n inside the representation ring.
- `mul_P` (*characterisation*) — The product of P_m and P_n is the displayed quantum binomial combination of the P_{m+n-i}.
- `algebraP_isSubalgebra` (*structure*) — algebraP is a subalgebra of the representation ring over the Laurent polynomial ring.
- `filtration` (*data*) — The decreasing filtration of algebraP by the spans of the P_n with n at least k is multiplicative.
- `completion` (*constructor*) — The completion of algebraP with respect to the filtration, in which infinite sums of the P_n converge.

*Used by.*

- `ArithmeticQuantumTopology:QT.3/twist-element` — The twist element is an infinite sum of the P_n, so it lives in this completion and not in the algebra itself.
- `ArithmeticQuantumTopology:QT.2/integrality-algebraically-split` — The integrality theorem is stated for colours taken in the filtration steps of this algebra.

*Unit tests.* A wrong definition fails one of these.

- `P_zero_eq_one` — P 0 is the unit of the algebra.
- `mul_P_one_one` — The product of P_1 with itself expands with the stated quantum binomial coefficients; wrong constants would break the twisting theorem.
- `twistElement_not_mem` — The twist element lies in the completion and not in the algebra, so the completion step is necessary.

*Planet:* The algebra P and its completion.

*Source.* A unified Witten-Reshetikhin-Turaev invariant for integral homology spheres, Section 8.1 and Lemma 8.1, e-print pp. 44-45: “The algebra P is a subalgebra of the representation ring over the Laurent polynomial ring, with the displayed product formula for P_m P_n.” The subalgebra statement and structure constants this node records.

### Theorems

#### Lemma. The quantum trace pairing is dual to the cyclotomic basis

*Node* `ArithmeticQuantumTopology:QT.2/dual-basis-pairing`.

For all m and n at least 0, the quantum trace in the colour P''_m of the element sigma_n is the Kronecker delta of m and n.

*Hypotheses.* the sigma_n are the central elements of the completed even integral form used to expand the universal invariant of a bottom knot; P''_m is the rescaled cyclotomic element.

*Proof outline.*

1. Express the quantum trace in a colour as a pairing between the representation ring and the centre of the integral form.
2. Compute the pairing of P_m with the elements S_n and obtain the displayed quantum binomial normalisation.
3. Rescale to P''_m and deduce the Kronecker delta.
4. Record that this makes the two families dual bases, which is what turns the expansion of the universal invariant into an expansion of coloured Jones polynomials.

*Acceptance.*

- The pairing of P''_0 with sigma_0 is 1 and with sigma_1 is 0.
- Duality forces the coefficients in the cyclotomic expansion to be the reduced coloured Jones values at the colours P''_n.
- Without the rescaling the pairing is the stated quantum binomial rather than 1, so the normalisation is not cosmetic.

*Uses.* `ArithmeticQuantumTopology:QT.2/p-basis`.

*Source.* A unified Witten-Reshetikhin-Turaev invariant for integral homology spheres, Proposition 6.3, e-print p. 38: “For m, n at least 0 we have that the quantum trace in the colour P''_m of sigma_n is the Kronecker delta of m and n.” Verbatim the statement this node records.

#### Theorem. Cyclotomic expansion of the universal invariant of a bottom knot

*Node* `ArithmeticQuantumTopology:QT.2/cyclotomic-expansion`.

For a bottom knot T with closure the knot K, the universal invariant of T is the sum over n at least 0 of the coloured Jones value of K at the colour P''_n times the central element sigma_n. In particular the coefficients of the cyclotomic expansion of a knot are themselves coloured Jones values, at the cyclotomic colours.

*Hypotheses.* T is a one-component 0-framed bottom tangle with closure K.

*Proof outline.*

1. Write the universal invariant of the bottom knot in the unique expansion in the central elements sigma_p, which exists by the structure theorem for the centre of the completed even form.
2. Apply the quantum trace in the colour P''_m to both sides.
3. Use the duality lemma to see that the left side is the coloured Jones value at P''_m and the right side is the m-th coefficient.
4. Conclude the displayed identity.

*Acceptance.*

- For the unknot the expansion is the single term sigma_0, so all higher coefficients vanish.
- The coefficients are Laurent polynomials, by the integrality theorem, which is the point of the expansion.
- Summing the expansion against the change-of-basis formula recovers the ordinary coloured Jones polynomials.

*Uses.* `ArithmeticQuantumTopology:QT.2/dual-basis-pairing`, `ArithmeticQuantumTopology:QT.1/universal-invariant-integrality`.

*Planet:* Cyclotomic expansion of a knot.

*Source.* A unified Witten-Reshetikhin-Turaev invariant for integral homology spheres, Theorem 6.4 with Theorem 4.5, e-print pp. 38-39 and p. 31: “For a bottom knot T with closure K we have that the universal invariant of T is the sum over n of the coloured Jones value of K at P''_n times sigma_n.” Verbatim the theorem this node records, together with the uniqueness of the expansion it rests on.

#### Theorem. Integrality and divisibility for algebraically split 0-framed links

*Node* `ArithmeticQuantumTopology:QT.2/integrality-algebraically-split`.

Let L be an m-component algebraically split 0-framed link and for each i let x_i lie in the k_i-th filtration step of the algebra P. Then the coloured invariant of L at these colours lies in the ideal generated by the displayed quantum binomial coefficient divided by the first quantum integer, where k is the maximum of the k_i. In particular the invariant is a Laurent polynomial and is divisible by that explicit factor.

*Hypotheses.* L is algebraically split with all framings 0; each colour lies in the stated filtration step of the algebra P.

*Proof outline.*

1. Reduce to the universal invariant of a bottom tangle whose closure is L, using integrality of that invariant for 0-framed tangles.
2. Prove the auxiliary lemma that the quantum trace of an element of the even integral form in a colour from P lies in the Laurent polynomial ring.
3. Propagate the divisibility through the components by the multilinearity of the invariant and the filtration on P.
4. Assemble the divisibility bound with k the maximum of the filtration degrees.

*Acceptance.*

- For the unknot with colour in the k-th step the value is divisible by the stated factor, which is the one-component case.
- The divisibility fails for links that are not algebraically split, which is why the hypothesis is present.
- The theorem gives the convergence of the surgery sum used to define the unified invariant.

*Uses.* `ArithmeticQuantumTopology:QT.2/algebra-P-and-completion`, `ArithmeticQuantumTopology:QT.1/universal-invariant-integrality`, `ArithmeticQuantumTopology:QT.2/quantum-trace-integrality`.

*Planet:* Integrality for algebraically split links.

*Source.* A unified Witten-Reshetikhin-Turaev invariant for integral homology spheres, Theorem 8.2, e-print p. 46: “Let L be an m-component algebraically split 0-framed link and let each colour lie in the stated filtration step. Then the coloured invariant lies in the ideal generated by the displayed quantum binomial coefficient divided by the first quantum integer, where k is the maximum of the filtration degrees.” Verbatim the theorem this node records; it is the divisibility that makes the surgery sum converge.

#### Lemma. Quantum traces of the integral form in cyclotomic colours are integral

*Node* `ArithmeticQuantumTopology:QT.2/quantum-trace-integrality`.

If x lies in the even integral form and y lies in the algebra P, then the quantum trace of x in the colour y lies in the Laurent polynomial ring in v.

*Hypotheses.* x is in the even integral form of the quantized enveloping algebra; y is in the algebra spanned by the cyclotomic elements.

*Proof outline.*

1. Reduce to the basis monomials of the even integral form and to the generators P_n of the algebra.
2. Compute the quantum trace of a basis monomial in the colour P_n and show that it vanishes unless the divided-power and e-degrees agree.
3. In the surviving cases evaluate the trace explicitly and observe that it is a Laurent polynomial.
4. Extend by linearity and continuity to the whole integral form and to all of the algebra.

*Acceptance.*

- The trace of the unit in the colour P_0 is 1.
- The trace of a basis monomial with mismatched degrees vanishes, which is the vanishing that makes the computation finite.
- The lemma fails for colours outside the algebra P, where denominators appear, so the restriction on colours is necessary.

*Uses.* `ArithmeticQuantumTopology:QT.1/quantized-enveloping-algebra`, `ArithmeticQuantumTopology:QT.2/algebra-P-and-completion`.

*Source.* A unified Witten-Reshetikhin-Turaev invariant for integral homology spheres, Lemma 8.5 with Lemma 8.8, e-print pp. 47-49: “If x is in the even integral form and y is in the algebra P then the quantum trace of x in the colour y lies in the Laurent polynomial ring.” Verbatim the lemma this node records, together with the vanishing computation that proves it.

#### Theorem. Each coloured Jones polynomial is determined modulo an explicit ideal by the earlier ones

*Node* `ArithmeticQuantumTopology:QT.2/coloured-jones-determination`.

If K is a knot then for each n at least 0 the n-th coloured Jones polynomial of K is determined modulo the ideal generated by the displayed quantum integer product by the values at the colours V_0, ..., V_{n-1}.

*Hypotheses.* K is a knot, so the cyclotomic expansion is available.

*Proof outline.*

1. Expand the n-th coloured Jones polynomial in the cyclotomic basis using the change-of-basis formula.
2. Observe that the terms with index below n are determined by the earlier values.
3. Bound the remaining term by the divisibility of the cyclotomic coefficients from the integrality theorem.
4. Conclude the stated congruence.

*Acceptance.*

- For n equal to 0 the statement is vacuous and for n equal to 1 it recovers a known congruence of the Jones polynomial.
- The ideal is not the zero ideal, so the statement is a congruence and not an equality; a stronger reading would be false.
- The result is a consequence of integrality and not of the definition, so it fails for invariants without the cyclotomic expansion.

*Uses.* `ArithmeticQuantumTopology:QT.2/cyclotomic-expansion`, `ArithmeticQuantumTopology:QT.2/integrality-algebraically-split`.

*Source.* A unified Witten-Reshetikhin-Turaev invariant for integral homology spheres, Proposition 6.5, e-print p. 39: “If K is a knot then for each n the n-th coloured Jones polynomial is determined modulo the displayed ideal by the values at the colours below n.” Verbatim the statement this node records.

### What is missing

- The comparison of the colour-one specialisation with the Jones polynomial of the geometric-topology roadmap, in that roadmap's normalisation.
- The two-variable and Melvin-Morton-Rozansky boundary material, which the source treats and which the stage text does not mention.

## QT.3 Unified invariants of integral homology spheres

*Coverage:* **partial**. The construction of the unified invariant, its well-definedness against the refined calculus, its first divisibility and its behaviour under connected sum and orientation reversal are decomposed from the primary source.

### Objects

#### Construction. The twist element in the completed cyclotomic algebra

*Module* `TauCeti/QuantumTopology/Unified/TwistElement.lean`. *Node* `ArithmeticQuantumTopology:QT.3/twist-element`.

There are elements omega_plus and omega_minus of the completion of the algebra P, the twist elements, characterised by the property that the pairing of omega_plus or omega_minus with any x in the representation ring equals the coloured invariant of the plus or minus one framed unknot at the colour x.

*Hypotheses.* the completion of the algebra spanned by the cyclotomic elements is the one constructed above.

*API.*

- `omega` (*data*) — omega is the twist element of the completed cyclotomic algebra, in the two sign variants.
- `pairing_omega` (*characterisation*) — The pairing of omega with a colour x is the coloured invariant of the unit-framed unknot at x.
- `omega_mul_inv` (*relation*) — The two twist elements are mutually inverse in the completed algebra.
- `omega_mem_completion` (*structure*) — The twist element lies in the completion of the cyclotomic algebra and not in the algebra itself.
- `omega_coeff` (*projection*) — The coefficients of the twist element in the cyclotomic basis are explicit Laurent polynomials.

*Used by.*

- `ArithmeticQuantumTopology:QT.3/twisting-theorem` — The twisting theorem computes the effect of a plus or minus one surgery as insertion of the twist element.
- `ArithmeticQuantumTopology:QT.3/definition-of-JM` — The surgery formula inserts one twist element for each component of the admissible presentation.

*Unit tests.* A wrong definition fails one of these.

- `pairing_omega_V0` — The pairing of the twist element with the trivial colour is the invariant of the unit-framed unknot; a normalisation giving 1 here is wrong.
- `omega_plus_mul_omega_minus` — The product of the two twist elements is 1, which is the algebraic shadow of blowing up and then blowing down.
- `omega_not_finite` — The twist element has infinitely many non-zero cyclotomic coefficients, so it is not an element of the uncompleted algebra.

*Planet:* Twist element.

*Source.* A unified Witten-Reshetikhin-Turaev invariant for integral homology spheres, Proposition 9.1 and Proposition 9.2, e-print pp. 49-50: “For each x in the representation ring we have that the pairing of the twist elements with x equals the invariant of the plus or minus one framed unknot at x. The two twist elements are inverse to each other in the completed algebra.” The two statements this node records as the definition and the first property of the twist element.

#### Construction. The unified invariant of an integral homology sphere

*Module* `TauCeti/QuantumTopology/Unified/DefinitionOfJm.lean`. *Node* `ArithmeticQuantumTopology:QT.3/definition-of-JM`.

Let M be an integral homology sphere and L an admissible framed link presenting it, with m components and framings epsilon_i in plus or minus one. Define the element of the Habiro ring by taking the coloured invariant of the 0-framed link underlying L with the twist element of sign epsilon_i inserted in the i-th slot, divided by the corresponding product of unknot normalisations. The divisibility theorem makes the resulting sum converge in the Habiro ring.

*Hypotheses.* L is an admissible framed link presenting M; the coefficient ring is the Habiro ring, the completion of the Laurent polynomial ring with respect to the ideals generated by the q-shifted factorials.

*API.*

- `unifiedInvariantOfPresentation` (*constructor*) — The element of the Habiro ring attached to an admissible framed link by the surgery formula.
- `unifiedInvariant_empty` (*example*) — The empty admissible link gives the element 1.
- `summable` (*characterisation*) — The defining sum converges in the Habiro ring, by the divisibility theorem.
- `unifiedInvariant_mirror` (*compatibility*) — Reversing the orientation of the presentation replaces q by its inverse in the formula.

*Used by.*

- `ArithmeticQuantumTopology:QT.3/JM-well-defined` — Well-definedness is the statement that this element does not depend on the admissible presentation.
- `ArithmeticQuantumTopology:QT.4/evaluation-theorem` — Evaluating the element at a root of unity gives the Witten-Reshetikhin-Turaev invariant.

*Unit tests.* A wrong definition fails one of these.

- `unified_empty` — The empty presentation gives 1, so the invariant of the 3-sphere is 1.
- `unified_unknot_pm_one` — The plus-one-framed unknot also presents the 3-sphere and must give 1; this is the first non-trivial instance of independence.
- `unified_converges` — The defining sum has terms divisible by higher and higher q-shifted factorials, so it converges in the Habiro ring; a formula without that divisibility would not define an element.

*Planet:* Unified invariant J_M.

*Source.* A unified Witten-Reshetikhin-Turaev invariant for integral homology spheres, Section 10.2, equation for J_M, e-print pp. 51-52: “Let M be an integral homology sphere, and let L be an admissible framed link in S^3 such that M is obtained from S^3 by surgery along L.” The surgery formula this node records, in the normalisation Habiro fixes.

### Theorems

#### Theorem. Twisting theorem: surgery along a unit-framed unknotted component

*Node* `ArithmeticQuantumTopology:QT.3/twisting-theorem`.

Let L_1 union ... union L_m union K be an (m+1)-component algebraically split 0-framed link whose last component K is unknotted, and let the twisted link denote the framed link obtained from the first m components by plus or minus one surgery along K. Then for colours x_1, ..., x_m in the completed cyclotomic algebra the coloured invariant of the twisted link at those colours equals the coloured invariant of the original link at the same colours together with the twist element in the last slot.

*Hypotheses.* the link is algebraically split and 0-framed; the distinguished component is unknotted.

*Proof outline.*

1. Interpret plus or minus one surgery along an unknotted component as a full twist applied to the strands passing through the spanning disc.
2. Express the effect of that twist on the universal invariant as insertion of the ribbon element on the relevant strands.
3. Identify the resulting insertion with the pairing against the twist element, using the characterising property of the twist element.
4. Check convergence of the resulting expression in the completion, using the integrality and divisibility theorem.

*Acceptance.*

- With no other components the theorem reduces to the characterising property of the twist element.
- Applying the theorem twice with opposite signs returns the original invariant, matching that the two twist elements are inverse.
- The identity is an identity in the completed algebra and requires the divisibility theorem for convergence.

*Uses.* `ArithmeticQuantumTopology:QT.3/twist-element`, `ArithmeticQuantumTopology:QT.2/integrality-algebraically-split`.

*Planet:* Twisting theorem.

*Source.* A unified Witten-Reshetikhin-Turaev invariant for integral homology spheres, Theorem 9.4, e-print p. 50: “Let the link be an (m+1)-component algebraically split 0-framed link whose last component is unknotted, and let the twisted link be obtained by plus or minus one framed surgery along it. Then the coloured invariant of the twisted link equals the invariant of the original link with the twist element in the last slot.” Verbatim the theorem this node records.

#### Theorem. The unified invariant does not depend on the admissible presentation

*Node* `ArithmeticQuantumTopology:QT.3/JM-well-defined`.

For an integral homology sphere M the element of the Habiro ring defined by the surgery formula does not depend on the choice of admissible framed link presenting M. Hence the assignment of that element to M is an invariant of integral homology spheres with values in the Habiro ring.

*Hypotheses.* M is an integral homology sphere; the presentations compared are admissible.

*Proof outline.*

1. By the refined Kirby calculus any two admissible presentations of M are related by isotopies and Hoste moves.
2. Check invariance of the surgery formula under an isotopy, which is immediate from invariance of the coloured invariant.
3. Check invariance under a single Hoste move, using the twisting theorem to compare the two sides.
4. Conclude by induction along the sequence of moves.

*Acceptance.*

- The empty link and the plus-one-framed unknot both give 1, matching that both present the 3-sphere.
- The proof uses the refined calculus and not the classical one, since the intermediate links of a classical sequence need not be admissible.
- The invariant of a connected sum is the product of the invariants, which is a consistency check on the normalisation.

*Uses.* `ArithmeticQuantumTopology:QT.3/definition-of-JM`, `ArithmeticQuantumTopology:QT.0/refined-kirby-calculus`.

*Planet:* Well-definedness of J_M.

*Source.* A unified Witten-Reshetikhin-Turaev invariant for integral homology spheres, Theorem 10.2, e-print p. 52: “For an integral homology sphere M, the element defined by the surgery formula does not depend on the choice of L. Hence the correspondence defines an invariant of integral homology spheres with values in the Habiro ring.” Verbatim the theorem this node records.

#### Lemma. First divisibility of the unified invariant

*Node* `ArithmeticQuantumTopology:QT.3/JM-divisibility`.

For every integral homology sphere M the element J_M minus 1 is divisible in the Habiro ring by the product of the second and third cyclotomic-type factors, namely by (q squared minus 1)(q cubed minus 1) divided by (q minus 1).

*Hypotheses.* M is an integral homology sphere.

*Proof outline.*

1. Expand the surgery formula and isolate the constant term, which is 1.
2. Bound the remaining terms by the divisibility theorem for algebraically split 0-framed links with colours in the first filtration step.
3. Combine the resulting factors and identify the product as the displayed one.
4. Record the stronger divisibility by q to the sixth minus 1, which follows by an extra argument.

*Acceptance.*

- For the 3-sphere the statement is trivial, since the difference is 0.
- The divisibility gives the first congruence for the Ohtsuki series and is the source of the integrality of its coefficients.
- The stronger statement, divisibility by q to the sixth minus 1, holds and is recorded separately.

*Uses.* `ArithmeticQuantumTopology:QT.3/JM-well-defined`, `ArithmeticQuantumTopology:QT.2/integrality-algebraically-split`.

*Source.* A unified Witten-Reshetikhin-Turaev invariant for integral homology spheres, Lemma 10.3 and Proposition 12.14, e-print pp. 52 and 62: “Let M be an integral homology sphere. Then J_M minus 1 is divisible by (q squared minus 1)(q cubed minus 1) divided by (q minus 1) in the Habiro ring. For any integral homology sphere, J_M minus 1 is divisible by q to the sixth minus 1.” The two divisibility statements this node records.

#### Theorem. Multiplicativity under connected sum and behaviour under orientation reversal

*Node* `ArithmeticQuantumTopology:QT.3/JM-connected-sum-and-orientation`.

The unified invariant is multiplicative under connected sum, so that the invariant of a connected sum is the product of the invariants, and the invariant of the 3-sphere is 1. Reversing the orientation of an integral homology sphere replaces the invariant by the image of the invariant under the ring involution sending q to its inverse.

*Hypotheses.* M and the second manifold are integral homology spheres.

*Proof outline.*

1. Present the connected sum by the split union of admissible presentations of the two summands.
2. Use multiplicativity of the coloured invariant on split unions to factor the surgery formula.
3. For orientation reversal, take the mirror image of the presentation and track the effect on the twist elements and on the coloured invariant.
4. Identify the result with the ring involution of the Habiro ring.

*Acceptance.*

- The invariant of the 3-sphere is 1, which is the empty case of multiplicativity.
- The invariant of the connected sum of a manifold with its own orientation reversal is the norm of the invariant under the involution.
- An invariant that failed multiplicativity would not evaluate to the Witten-Reshetikhin-Turaev invariants, which are multiplicative.

*Uses.* `ArithmeticQuantumTopology:QT.3/JM-well-defined`.

*Source.* A unified Witten-Reshetikhin-Turaev invariant for integral homology spheres, Proposition 12.1, e-print p. 57: “The invariant is multiplicative under connected sum and the invariant of the 3-sphere is 1. If the manifold with reversed orientation is taken, the invariant is the image under the involution sending q to its inverse.” Verbatim the two statements this node records.

### What is missing

- The rational homology sphere extension, which needs a different coefficient completion and is out of scope here.

## QT.4 WRT values, Ohtsuki series and general Lie type

*Coverage:* **partial**. The sl(2) half is decomposed: the evaluation theorem, integrality and Galois equivariance, determination by the family of quantum invariants, and the identification of the Taylor expansion with the Ohtsuki series.

### Objects

#### Definition. The Witten-Reshetikhin-Turaev invariant at a root of unity

*Module* `TauCeti/QuantumTopology/WRT/WrtInvariantAtARoot.lean`. *Node* `ArithmeticQuantumTopology:QT.4/WRT-invariant-at-a-root`.

For a primitive r-th root of unity zeta, the sl(2) Witten-Reshetikhin-Turaev invariant of a closed oriented 3-manifold is defined from a surgery presentation by the standard state sum over the admissible colours at level r, normalised by the invariants of the plus and minus one framed unknots so that the value on the 3-sphere is 1.

*Hypotheses.* zeta is a primitive r-th root of unity; the manifold is presented by a framed link.

*API.*

- `wrt` (*data*) — wrt zeta M is the Witten-Reshetikhin-Turaev invariant of M at the root zeta.
- `wrt_sphere` (*example*) — The value on the 3-sphere is 1.
- `wrt_kirby_invariant` (*compatibility*) — The state sum is unchanged by the Kirby moves, so it is an invariant of the manifold.
- `wrt_connected_sum` (*functoriality*) — The invariant is multiplicative under connected sum.

*Used by.*

- `ArithmeticQuantumTopology:QT.4/evaluation-theorem` — The evaluation theorem identifies the image of the unified invariant at a root with this invariant.
- `ArithmeticQuantumTopology:QT.4/determination-by-WRT` — The determination theorem compares the unified invariant with the whole family of these values.

*Unit tests.* A wrong definition fails one of these.

- `wrt_sphere_one` — The invariant of the 3-sphere is 1, which pins the normalisation.
- `wrt_lens_space` — For a lens space the state sum evaluates to the classical Gauss-sum expression; a definition disagreeing here has the wrong normalisation.
- `wrt_multiplicative` — The invariant of a connected sum is the product of the invariants.

*Planet:* WRT invariant at a root.

*Source.* A unified Witten-Reshetikhin-Turaev invariant for integral homology spheres, Section 11.2, e-print pp. 53-54: “Definition of the Witten-Reshetikhin-Turaev invariant at a root of unity.” The subsection that fixes the normalisation of the invariant this node records.

### Theorems

#### Theorem. Evaluation of the unified invariant at a root of unity

*Node* `ArithmeticQuantumTopology:QT.4/evaluation-theorem`.

Let M be an integral homology sphere and zeta a primitive r-th root of unity. Then the evaluation at zeta of the unified invariant of M equals the sl(2) Witten-Reshetikhin-Turaev invariant of M at zeta.

*Hypotheses.* M is an integral homology sphere; zeta is a primitive root of unity of any order.

*Proof outline.*

1. Evaluate the surgery formula for the unified invariant at the root, using that evaluation is a ring homomorphism from the Habiro ring to the ring of integers of the cyclotomic field.
2. Identify the evaluated twist elements with the finite Gauss sums appearing in the state sum.
3. Match the normalisations, using the auxiliary lemma on coloured invariants with colours in the representation ring at the root.
4. Conclude the equality for every root of unity, without restriction on the order.

*Acceptance.*

- Both sides are 1 on the 3-sphere.
- The theorem holds for every root of unity, including those of even and of non-prime-power order, which the earlier literature had excluded.
- As a corollary the Witten-Reshetikhin-Turaev invariant of an integral homology sphere is an algebraic integer in the cyclotomic field, and the family is Galois equivariant.

*Uses.* `ArithmeticQuantumTopology:QT.3/JM-well-defined`, `ArithmeticQuantumTopology:QT.4/WRT-invariant-at-a-root`.

*Planet:* Evaluation at roots of unity.

*Source.* A unified Witten-Reshetikhin-Turaev invariant for integral homology spheres, Theorem 11.1 with Theorem 1.2, e-print pp. 53 and 5: “Let M be an integral homology sphere and let zeta be a primitive r-th root of unity. Then the evaluation at zeta of the unified invariant equals the sl(2) Witten-Reshetikhin-Turaev invariant of M at zeta.” Verbatim the theorem this node records, in its introduction and its body form.

#### Theorem. Integrality and Galois equivariance of the quantum invariants

*Node* `ArithmeticQuantumTopology:QT.4/integrality-and-galois`.

For every integral homology sphere M and every root of unity zeta, the Witten-Reshetikhin-Turaev invariant of M at zeta lies in the ring of integers generated by zeta, and for every field automorphism alpha of the cyclotomic field the invariant at the image of zeta is the image of the invariant.

*Hypotheses.* M is an integral homology sphere.

*Proof outline.*

1. Apply the evaluation theorem to write the invariant as the image of an element of the Habiro ring.
2. Observe that the Habiro ring has coefficients in the integers, so evaluation lands in the ring of integers generated by the root.
3. For equivariance, note that an automorphism of the cyclotomic field commutes with evaluation of a fixed element of the Habiro ring.
4. Conclude both statements.

*Acceptance.*

- The invariant is an algebraic integer, not merely an algebraic number; this is a strictly stronger statement than the state sum gives directly.
- Galois equivariance relates the values at all primitive roots of the same order, so one value determines the others in that orbit.
- The two statements fail for rational homology spheres without a modified coefficient ring.

*Uses.* `ArithmeticQuantumTopology:QT.4/evaluation-theorem`.

*Source.* A unified Witten-Reshetikhin-Turaev invariant for integral homology spheres, Corollary 1.3 and the following paragraph, e-print p. 5: “For any integral homology sphere M and for zeta a root of unity we have that the invariant lies in the ring of integers generated by zeta. The theorem immediately implies Galois equivariance of the invariant.” The two consequences this node records.

#### Theorem. The unified invariant is determined by the family of quantum invariants

*Node* `ArithmeticQuantumTopology:QT.4/determination-by-WRT`.

The unified invariant of an integral homology sphere is determined by the function assigning to each root of unity the Witten-Reshetikhin-Turaev invariant at that root; consequently the unified invariant and that function have the same power to distinguish integral homology spheres. Moreover both are determined by the values at any subset of roots of unity that has a limit point in the relevant sense.

*Hypotheses.* M is an integral homology sphere.

*Proof outline.*

1. Use the evaluation theorem to see that the function of roots is the image of the unified invariant under the product of the evaluation maps.
2. Apply the injectivity property of the Habiro ring: the product of evaluations over a subset with a limit point is injective.
3. Deduce that the unified invariant is recovered from the family of values.
4. Record the complementary statement that a subset without a limit point does not suffice.

*Acceptance.*

- Two integral homology spheres with the same quantum invariants at all roots have the same unified invariant.
- A subset of roots without a limit point is not enough, so the hypothesis is sharp.
- The statement is about the evaluation map on the Habiro ring, not about the manifolds, so it needs the ring-theoretic injectivity input.

*Uses.* `ArithmeticQuantumTopology:QT.4/evaluation-theorem`.

*Source.* A unified Witten-Reshetikhin-Turaev invariant for integral homology spheres, Theorem 1.4 with Proposition 1.1, e-print pp. 5 and 3: “The invariant J_M is determined by the WRT function. Moreover both are determined by the values at the roots in a subset with a limit point. If a subset of roots has a limit point then the corresponding product of evaluation maps on the Habiro ring is injective.” The determination statement and the injectivity property of the Habiro ring it rests on.

#### Theorem. Taylor expansion at q equal to 1 is the Ohtsuki series

*Node* `ArithmeticQuantumTopology:QT.4/ohtsuki-series`.

For every integral homology sphere M, the image of the unified invariant under the Taylor expansion homomorphism from the Habiro ring to the ring of formal power series in q minus 1 is the Ohtsuki series of M.

*Hypotheses.* M is an integral homology sphere; the Taylor expansion map is the canonical homomorphism from the Habiro ring to power series in q minus 1.

*Proof outline.*

1. Recall that the Ohtsuki series is characterised by congruences with the quantum invariants at roots of prime power order.
2. Evaluate the unified invariant at those roots using the evaluation theorem.
3. Compare the two sides through the commutative square relating the Taylor expansion and the evaluation maps.
4. Use injectivity of the product of the p-adic evaluations on power series to conclude equality.

*Acceptance.*

- The constant term is 1, matching that the Ohtsuki series begins with 1.
- The first non-trivial coefficient is the Casson invariant up to the standard normalisation, which fixes the convention.
- The theorem identifies two objects defined by different means, so it is a comparison and not a definition.

*Uses.* `ArithmeticQuantumTopology:QT.4/evaluation-theorem`, `ArithmeticQuantumTopology:QT.3/JM-divisibility`.

*Planet:* Ohtsuki series.

*Source.* A unified Witten-Reshetikhin-Turaev invariant for integral homology spheres, Theorem 12.6, e-print p. 59: “For every integral homology sphere M we have that the Taylor expansion of the unified invariant is the Ohtsuki series of M.” Verbatim the theorem this node records.

### What is missing

- The general Lie type variants, which are a separate paper that was not read.
- The p-adic and mod p Witten-Reshetikhin-Turaev functions, which the source also treats.

## QT.5 Hyperbolic geometry, Bloch classes and regulators

*Coverage:* **partial**. The extended Bloch group route is decomposed from a primary source: ideal tetrahedra and shapes, gluing and completeness equations, combinatorial flattenings, the five-term lemma behind the two-three move, the extended Bloch element and the volume and Chern-Simons theorem.

### Objects

#### Definition. Oriented ideal tetrahedra and their shape parameters

*Module* `TauCeti/QuantumTopology/Hyperbolic/IdealTetrahedronAndShape.lean`. *Node* `ArithmeticQuantumTopology:QT.5/ideal-tetrahedron-and-shape`.

An oriented ideal tetrahedron in hyperbolic 3-space is determined up to isometry by a shape parameter z in the complex numbers with z different from 0 and 1, the cross-ratio of its four ideal vertices in the chosen order. The three pairs of opposite edges carry the three parameters z, z' = 1/(1-z) and z'' = 1 - 1/z, which multiply to minus 1 and satisfy the two relations recorded below; the tetrahedron is positively oriented when the imaginary part of z is positive.

*Hypotheses.* the four ideal vertices are distinct points of the boundary sphere; an ordering of the vertices is chosen, and the parity of the ordering is recorded.

*API.*

- `IdealTetrahedron` (*structure*) — An ordered oriented ideal tetrahedron, recorded by its shape parameter in the complement of 0 and 1.
- `shape` (*data*) — shape T is the cross-ratio of the four ideal vertices in the chosen order.
- `shape_companions` (*characterisation*) — The three edge parameters are z, 1/(1-z) and 1-1/z, and their product is minus 1.
- `isometry_iff_shape_eq` (*characterisation*) — Two ordered ideal tetrahedra are orientation-preserving isometric if and only if their shapes agree.
- `positively_oriented` (*relation*) — A tetrahedron is positively oriented exactly when the imaginary part of its shape is positive.

*Used by.*

- `ArithmeticQuantumTopology:QT.5/combinatorial-flattening` — A flattening is a choice of logarithms of the three shape parameters with a linear condition.
- `ArithmeticQuantumTopology:QT.5/gluing-and-completeness-equations` — The gluing equations are polynomial equations in the shapes of the tetrahedra of a triangulation.

*Unit tests.* A wrong definition fails one of these.

- `shape_regular` — The regular ideal tetrahedron has shape the primitive sixth root of unity; a convention giving a different value is a different cross-ratio ordering.
- `shape_product` — The product of the three edge parameters is minus 1, not 1; this pins the convention.
- `shape_excludes_degenerate` — Shapes 0 and 1 are excluded, so a degenerate configuration is not an ideal tetrahedron.

*Planet:* Ideal tetrahedron and shape.

*Source.* Extended Bloch group and the Cheeger-Chern-Simons class, Section 3, e-print Definition 3.1 and the surrounding text: “We shall call any triple of the form (log z + p pi i, log z' + q pi i, log z'' + r pi i) with integers p, q, r and the three entries summing to zero a combinatorial flattening for our simplex.” The passage that fixes the three edge parameters of an ideal simplex, on which this node's conventions rest.

#### Definition. Gluing and completeness equations of an ideal triangulation

*Module* `TauCeti/QuantumTopology/Hyperbolic/GluingAndCompletenessEquations.lean`. *Node* `ArithmeticQuantumTopology:QT.5/gluing-and-completeness-equations`.

Given an ideal triangulation of the interior of a compact 3-manifold with torus boundary, with a shape assigned to each tetrahedron, the edge (gluing) equation at an edge asserts that the product of the edge parameters around that edge is 1 and that the sum of the corresponding logarithms is two pi i; the completeness equation at a cusp asserts that the derived holonomy of each generator of the cusp group is trivial. A positively oriented solution of the gluing and completeness equations gives a complete finite-volume hyperbolic structure on the interior.

*Hypotheses.* the triangulation is an ideal triangulation of the interior of a compact 3-manifold whose boundary is a union of tori.

*API.*

- `IdealTriangulation` (*structure*) — An ideal triangulation with a shape assigned to each tetrahedron.
- `edgeEquation` (*relation*) — At each edge, the product of the incident edge parameters is 1 and the sum of their logarithms is two pi i.
- `cuspEquation` (*relation*) — At each cusp, the derived holonomy of each generator is trivial.
- `isGeometricSolution` (*characterisation*) — A solution all of whose shapes have positive imaginary part gives a complete finite-volume structure.
- `volume_eq_sum` (*compatibility*) — The volume of the structure is the sum of the volumes of its tetrahedra.

*Used by.*

- `ArithmeticQuantumTopology:QT.5/bloch-element-of-a-triangulation` — The Bloch element is the sum of the shapes of a solution, and its well-definedness rests on the edge equations.
- `ArithmeticQuantumTopology:QT.5/volume-and-chern-simons` — The comparison of the regulator with volume and Chern-Simons is stated for a solution of these equations.

*Unit tests.* A wrong definition fails one of these.

- `figure_eight_solution` — The two-tetrahedron triangulation of the figure-eight knot complement has the solution with both shapes the primitive sixth root of unity; this is the running example.
- `edge_equation_log_form` — The logarithmic edge equation fixes the branch: the product form alone does not, and the two differ by multiples of two pi i.
- `not_geometric_of_negative_imaginary` — A solution with a shape of negative imaginary part is not geometric, so the positivity condition is not redundant.

*Planet:* Gluing and completeness equations.

*Source.* Extended Bloch group and the Cheeger-Chern-Simons class, Section 3, the edge sums and the flattening condition: “We say that the terms satisfy the flattening condition if each of the above linear combinations of log-parameters is equal to zero.” The logarithmic edge relations of a triangulation, which this node records in their geometric form before the flattening refinement.

#### Definition. Combinatorial flattenings and the extended pre-Bloch group

*Module* `TauCeti/QuantumTopology/Hyperbolic/CombinatorialFlattening.lean`. *Node* `ArithmeticQuantumTopology:QT.5/combinatorial-flattening`.

A combinatorial flattening of an ideal tetrahedron with shape z is a triple of the form (log z + p pi i, log z' + q pi i, log z'' + r pi i) with integers p, q and r whose three entries sum to zero. The set of flattenings is in bijection with a Riemann surface covering the complement of 0 and 1, and the extended pre-Bloch group is the quotient of the free abelian group on flattenings by the lifted five-term relation.

*Hypotheses.* the logarithms are taken on the principal branch and the integers record the branch corrections.

*API.*

- `Flattening` (*structure*) — A combinatorial flattening of an ideal tetrahedron, recorded as a shape together with two integers.
- `flattening_sum_zero` (*characterisation*) — The three log-parameters of a flattening sum to zero.
- `flatteningEquiv` (*equivalence*) — Flattenings correspond bijectively to the points of the covering surface of the complement of 0 and 1.
- `extendedPreBloch` (*constructor*) — The extended pre-Bloch group is the quotient of the free abelian group on flattenings by the lifted five-term relation.
- `forget` (*functoriality*) — Forgetting the flattening is a surjection onto the ordinary pre-Bloch group.

*Used by.*

- `ArithmeticQuantumTopology:QT.5/bloch-element-of-a-triangulation` — The Bloch element of a hyperbolic manifold is built from a flattening of each tetrahedron of a triangulation.
- `ArithmeticQuantumTopology:QT.5/volume-and-chern-simons` — The Rogers dilogarithm is defined on flattenings and descends to the extended pre-Bloch group.

*Unit tests.* A wrong definition fails one of these.

- `flattening_zero_zero` — The flattening with both integers zero is the principal one; a different default would move the Chern-Simons term by a period.
- `flattening_determines_shape` — Two flattenings with the same log-parameters have the same shape.
- `lifted_five_term_general` — The lifted five-term relation is a lift of the classical one, so it maps onto it under forgetting; a relation that did not lift the classical one would be wrong.

*Planet:* Combinatorial flattening.

*Source.* Extended Bloch group and the Cheeger-Chern-Simons class, Definition 3.1 and Definition 2.2, e-print sections 2 and 3: “We shall call any triple of the form (log z + p pi i, log z' + q pi i, log z'' + r pi i) with p, q, r integers and the three entries summing to zero a combinatorial flattening for our simplex. This map is a bijection, so the covering may be identified with the set of all combinatorial flattenings of ideal tetrahedra.” The definition of a flattening and the identification of the covering surface with the set of flattenings.

#### Construction. The extended Bloch element of a hyperbolic 3-manifold

*Module* `TauCeti/QuantumTopology/Hyperbolic/BlochElementOfATriangulation.lean`. *Node* `ArithmeticQuantumTopology:QT.5/bloch-element-of-a-triangulation`.

For a complete hyperbolic 3-manifold presented by a flattened ideal triangulation, the alternating sum of the flattened shapes of its tetrahedra is an element of the extended pre-Bloch group that lies in the extended Bloch group, and depends only on the underlying homology class; for a closed or finite-volume manifold this gives a well-defined element attached to the manifold. A flattening always exists.

*Hypotheses.* the triangulation is an ordered cycle in the sense of the source; a flattening of the cycle is chosen.

*API.*

- `blochElement` (*constructor*) — blochElement M is the class in the extended Bloch group attached to a flattened ideal triangulation of M.
- `blochElement_exists` (*structure*) — A flattening of the triangulation exists, so the element is defined.
- `blochElement_indep` (*characterisation*) — The element does not depend on the chosen flattening, only on the homology class.
- `blochElement_mem_extendedBloch` (*compatibility*) — The element lies in the extended Bloch group, the kernel of the map to the exterior square.

*Used by.*

- `ArithmeticQuantumTopology:QT.5/volume-and-chern-simons` — The volume and Chern-Simons invariant are read off from the Rogers dilogarithm of this element.
- `ArithmeticQuantumTopology:QT.6` — The arithmetic of the shape field of the triangulation and the regulator of this element are the inputs to the asymptotic statements planned in the next stage.

*Unit tests.* A wrong definition fails one of these.

- `blochElement_figure_eight` — The figure-eight knot complement gives the class of twice the flattened regular simplex; a construction giving a different class has the wrong signs.
- `blochElement_flattening_independent` — Changing the flattening by an admissible amount does not change the class.
- `blochElement_not_in_prebloch_kernel` — The element is non-zero for a hyperbolic manifold, since its Rogers dilogarithm has non-zero imaginary part equal to the volume.

*Planet:* Extended Bloch element.

*Source.* Extended Bloch group and the Cheeger-Chern-Simons class, Theorem 4.5 with Theorem 4.6, e-print section 4: “For each choice of the auxiliary point a strong flattening of the cycle exists. For any flattening of the cycle the alternating sum of the flattened shapes only depends on the homology class, it lies in the extended Bloch group, and the resulting map is defined.” The existence and invariance statements this node records.

### Theorems

#### Lemma. The flattening condition makes a two-three move an instance of the lifted five-term relation

*Node* `ArithmeticQuantumTopology:QT.5/five-term-and-pachner`.

A geometric five-term relation among five ideal simplices is an instance of the lifted five-term relation in the extended pre-Bloch group if and only if the chosen flattenings satisfy the flattening condition, namely that the relevant linear combinations of log-parameters around each edge vanish.

*Hypotheses.* five ideal simplices arranged as in the five-term configuration, each with a chosen flattening.

*Proof outline.*

1. Write the five-term configuration and its log-parameters explicitly.
2. Compute the linear combinations of log-parameters around each edge of the configuration.
3. Show that the vanishing of those combinations is equivalent to the corresponding relation holding in the covering, which is the lifted five-term relation.
4. Record the extension lemma, that flattenings specified on part of the configuration extend when the adjusted angle sums vanish.

*Acceptance.*

- The classical five-term relation is recovered by forgetting the flattenings.
- Without the flattening condition the lifted relation fails, so the condition is not automatic.
- The lemma is what makes a two-three Pachner move on an ideal triangulation act trivially on the Bloch element.

*Uses.* `ArithmeticQuantumTopology:QT.5/combinatorial-flattening`.

*Source.* Extended Bloch group and the Cheeger-Chern-Simons class, Lemma 3.4 with Lemma 3.5, e-print section 3: “The geometric five-term relation is an instance of the lifted five term relation if and only if the terms satisfy the flattening condition. If the flattenings are specified for a subset of the five ideal simplices and the sum of adjusted angles is zero around each edge, then they extend.” The two statements this node records.

#### Theorem. The Rogers dilogarithm computes volume and Chern-Simons

*Node* `ArithmeticQuantumTopology:QT.5/volume-and-chern-simons`.

The Rogers dilogarithm gives a well-defined map from the covering surface to the complex numbers modulo pi squared times the integers, and the relations defining the extended pre-Bloch group are functional equations for it. There is an isomorphism from the third homology of the discrete group of orientation-preserving isometries of hyperbolic 3-space onto the extended Bloch group such that the composition with the Rogers dilogarithm is the characteristic class given by i times the sum of the volume and i times the Chern-Simons invariant.

*Hypotheses.* the extended Bloch group and the flattened Rogers dilogarithm are the ones defined above.

*Proof outline.*

1. Define the flattened Rogers dilogarithm by the displayed formula and prove that it is well defined modulo pi squared.
2. Prove that the lifted five-term relation and the transfer relations are functional equations for it.
3. Construct the map from the third homology group by sending a class to the extended Bloch element of a representing flattened cycle.
4. Prove that it is an isomorphism and that the composition with the Rogers dilogarithm is the stated characteristic class.

*Acceptance.*

- The imaginary part of the value is the volume, so the real regulator computes volume.
- The real part is the Chern-Simons invariant, defined modulo the stated period.
- For the figure-eight knot complement the imaginary part is twice the volume of the regular ideal tetrahedron.

*Uses.* `ArithmeticQuantumTopology:QT.5/bloch-element-of-a-triangulation`.

*Planet:* Volume and Chern-Simons from the regulator.

*Source.* Extended Bloch group and the Cheeger-Chern-Simons class, Proposition 2.5 and Theorem 2.6, e-print section 2: “The Rogers dilogarithm gives a well defined map to the complex numbers modulo pi squared. There exists an isomorphism from the third homology of the discrete isometry group onto the extended Bloch group such that the composition with the Rogers dilogarithm is the characteristic class given by i times the volume plus i times the Chern-Simons invariant.” The two statements this node records, which are the comparison the stage asks for.

### What is missing

- Cusped hyperbolic 3-manifolds, Mostow-Prasad rigidity and the theorem that a positively oriented solution gives the complete structure, which no layer of the atlas owns.
- The comparison of the real regulator with the weight-two regulator of the polylogarithm layers, which is where the duplication recorded in the restructure notes sits.

## QT.6 State integrals, Nahm series and arithmetic asymptotics

Decomposed in the second pass from Garoufalidis–Zagier, *Knots, perturbative series and quantum modularity*
(arXiv:2111.06645v3). The first pass left this layer unread and proposed no signature. What is decomposed is the
Kashaev invariant and the conjectural asymptotics; **the state integral itself remains unread**, and that is now
the layer's only substantive gap.

### Objects and statements

#### The Kashaev invariant, its identification with a colored Jones evaluation, and the periodic function it defines

`ArithmeticQuantumTopology:QT.6/the-kashaev-invariant-and-the-function-on-the-rationals` · *definition* · planet **The Kashaev invariant**

For a knot and a positive integer the Kashaev invariant is an element of the ring of integers with a primitive root of unity of that order adjoined. Murakami and Murakami proved that it is the evaluation of the colored Jones polynomial in the corresponding colour at that root of unity, in the normalisation of the earlier layer. The Kashaev invariant is the value at minus one over the integer of a one-periodic function on the rationals, determined uniquely by the further requirement that it be a Galois-invariant function of the exponential of its argument; the uniqueness holds because every primitive root of a given order is a Galois conjugate of the standard one. For the figure-eight knot the invariant has the closed form given by the sum over the indices below the order of the squared absolute value of the q-Pochhammer symbol at the root of unity, and its first values are the integers one, five, thirteen, twenty-seven, forty-six plus twice the square root of five, and eighty-nine. This function on the rationals is the object all the asymptotic statements of this layer and the next are about.

*Hypotheses.* (1) The knot is arbitrary for the definition; the asymptotic statements later add hyperbolicity. (2) The one-periodic function is determined by the Galois-invariance requirement, and that determination is part of the definition. (3) The identification with a colored Jones evaluation is a theorem, attributed, and fixes the normalisation.

*Outline.* (1) Define the Kashaev invariant and record its value ring. (2) Record the identification with the colored Jones evaluation and the normalisation it fixes. (3) Construct the one-periodic function on the rationals and prove its uniqueness from the Galois-invariance requirement. (4) Record the closed form and the first values for the figure-eight knot, as the standing example.

*Acceptance.* (1) The value ring is recorded. (2) The uniqueness of the periodic function is proved from the Galois requirement. (3) The standing example is given with explicit values.

*API.* `kashaevInvariant` (constructor) The element of the ring of integers with a root of unity adjoined attached to a knot and a positive integer.; `kashaevInvariant_eq_colouredJones` (equivalence) Its identification with the evaluation of the colored Jones polynomial in the corresponding colour.; `kashaevFunction` (constructor) The one-periodic Galois-invariant function on the rationals whose value at minus one over the integer is the invariant.; `kashaevFunction_unique` (characterisation) The uniqueness of that function, from the Galois-invariance requirement.; `figureEightKashaev` (example) The closed form and the first values for the figure-eight knot.

*Unit tests.* `kashaev_unknot` — For the unknot the Kashaev invariant is one for every order, and the periodic function is constant. `figureEightKashaev_small` — The first six values for the figure-eight knot are one, five, thirteen, twenty-seven, forty-six plus twice the square root of five, and eighty-nine; a wrong normalisation would not reproduce them. `kashaevFunction_periodic` — The function satisfies that its value at an argument plus one equals its value at the argument; this is what makes the statement at minus one over the integer meaningful. `galoisInvariance_needed` — Without the Galois-invariance requirement the extension of the invariant to a function on the rationals is not unique; this is the non-example showing the requirement is not decorative.

*Sources.* Section 1, on the original quantum modularity conjecture: The definition, the uniqueness of the periodic function and the identification with the colored Jones polynomial. Section 1, the displayed formula for the figure-eight knot: The closed form and the first values of the standing example.

#### The conjectural asymptotic expansion, its normalisation, and the field its coefficients lie in

`ArithmeticQuantumTopology:QT.6/the-asymptotic-series-and-its-arithmetic` · *comparison*

For a hyperbolic knot the conjecture, refining Kashaev's volume conjecture and made precise in the cited works, is that the Kashaev invariant has a full asymptotic expansion to all orders in the reciprocal of the integer: it is asymptotic to the three-halves power of the integer, times the exponential of the suitably normalised complexified volume times the integer, times a formal power series evaluated at twice pi times the imaginary unit over the integer. The complexified volume is the one of the previous layer, the combination of volume and Chern-Simons invariant. The power series is divergent, and it is further conjectured that its coefficients are algebraic: that it lies in the eighth root of unity times the inverse square root of a non-zero element of the trace field, times the power series ring over the trace field. For the figure-eight knot the trace field is the rationals with the square root of minus three adjoined and the first coefficients are the displayed ones; for the knot five two the trace field is the cubic field generated by the root with negative imaginary part of the displayed cubic. All of this is conjectural: nothing in this layer asserts that the expansion exists or that its coefficients are algebraic.

*Hypotheses.* (1) The knot is hyperbolic; the complexified volume is the one attached to the complete structure. (2) The statement is an asymptotic expansion to all orders in the reciprocal, not a convergent expansion; the series is divergent. (3) The conjecture about the field of the coefficients is separate from the conjecture that the expansion exists.

*Outline.* (1) Record the conjectured expansion with its exact prefactors: the three-halves power, the exponential of the complexified volume times the integer, and the argument of the series. (2) Record the conjecture about the coefficients and the field they lie in, with the eighth root of unity and the inverse square root of the element of the trace field. (3) Record the two worked examples with their trace fields and their first coefficients. (4) Record that the layer asserts none of this and that the statements are labelled conjectural.

*Acceptance.* (1) Every prefactor of the expansion is written out. (2) The conjecture about the coefficients is stated separately from the existence conjecture. (3) The conjectural status is recorded on each clause.

*Sources.* Section 1, the displayed asymptotic expansion: The conjectured expansion and the conjecture about its coefficients, with the exact prefactors. Section 1, the two worked examples: The two standing examples with their trace fields.

#### The comparisons with the Habiro ring that are actually proved, and the ones that are not

`ArithmeticQuantumTopology:QT.6/what-is-exported-to-the-habiro-roadmaps` · *comparison*

The asymptotic layer and the Habiro roadmaps meet at exactly two places, and only those two are exported. First, the coefficients of the cyclotomic expansion of a knot and the unified invariant of a surgered homology sphere are elements of the cyclotomic completion, whose evaluation and Taylor theory is owned by the completion roadmap; every statement here about values at roots of unity or about expansions at a root goes through that theory and adds nothing to it. Second, the source of this layer constructs further elements of the Habiro ring attached to a knot and studies their relation to the asymptotic series; those constructions are recorded here as statements of that source, with their hypotheses, and are not re-proved. Everything else is not exported: in particular no statement of this layer produces a q-series belonging to the Habiro ring merely because it has values at roots of unity, and no asymptotic statement is used to prove an algebraic property of an element of the completion.

*Hypotheses.* (1) The two export points are the only ones; the restriction is checkable against the prerequisites of this packet. (2) The further Habiro-ring elements of the source are recorded with their hypotheses and are not re-proved. (3) This node records an ownership boundary.

*Outline.* (1) Name the first export point and the theory it goes through. (2) Name the second and record that it is quoted, not proved. (3) Record the two prohibitions and check them against the other nodes.

*Acceptance.* (1) Both export points are named. (2) The quoted status of the second is recorded. (3) The two prohibitions are checkable.

*Sources.* Section 4, the subsection on new elements of the Habiro ring: The second export point, recorded as a statement of the source.

#### What a formal expansion establishes and what it does not

`ArithmeticQuantumTopology:QT.6/formal-and-analytic-asymptotics-are-different-outputs` · *comparison*

A formal expansion and an analytic asymptotic statement are different outputs and are kept apart throughout. A formal expansion is an identity in a ring of formal power series or a statement about the coefficients of such a series; it carries no error estimate and no domain. An analytic asymptotic statement asserts that a sequence of complex numbers is asymptotic to an expression, with a specified error at each order and a specified range of validity. The asymptotic expansion of the previous node is of the second kind and is conjectural; the constructions of the series by the four routes the source gives are of the first kind. Two prohibitions follow and are recorded. A stationary phase or saddle point computation that produces a series does not establish that the series is the asymptotic expansion of anything, unless the error analysis is carried out. And the volume conjecture and the quantum modularity conjecture are not established by exhibiting a formal expansion with the expected shape, however many coefficients agree numerically.

*Hypotheses.* (1) The distinction is one of the kind of statement and is not about the difficulty of the proof. (2) The prohibitions are checkable against the statements of this packet. (3) Numerical agreement is evidence and is labelled as such in the next layer's ledger.

*Outline.* (1) State the two kinds of output and what each carries. (2) Classify the statements of this layer into the two kinds. (3) Record the two prohibitions and check them against the other nodes. (4) Record that numerical agreement is evidence and is labelled in the ledger.

*Acceptance.* (1) The two kinds are defined and every statement of the layer is classified. (2) The prohibitions are stated and checkable. (3) The status of numerical agreement is recorded.

*Sources.* Section 1, on the original quantum modularity conjecture: That the statements in question are conjectures, which is the classification this node records.

### What is missing

A primary state-integral source: the integral, its contour, its normalisation and the non-compact quantum
dilogarithm. And the refinements of the asymptotics source, which are named in the nodes and not decomposed.

## QT.7 Quantum modularity and arithmetic research statements

Decomposed in the second pass from the same source. **This layer contains no theorem of this roadmap**: every
mathematical statement in it is a conjecture of its source, and the rest is the ledger and the labelling
discipline that keep the conjectures from being read as results.

### Objects and statements

#### The conjecture, with its exact normalisation and its domain

`ArithmeticQuantumTopology:QT.7/the-quantum-modularity-conjecture` · *comparison*

The quantum modularity conjecture, in its original form, asserts the following. Let a hyperbolic knot be given and let its one-periodic function on the rationals be as defined above. For a matrix in the modular group with lower left entry non-zero, the value of that function at the image of a large integer under the matrix is asymptotic to the lower left entry times the integer plus the lower right entry, raised to the three-halves power, times the exponential of the complexified volume times the integer plus the ratio of the lower right to the lower left entry, times a power series attached to the ratio of the upper left to the lower left entry, evaluated at twice pi times the imaginary unit divided by the lower left entry times the quantity lower left times the integer plus lower right. The case of the matrix with entries zero, minus one, one, zero recovers the asymptotic expansion of the previous layer. The conjecture is a conjecture: this roadmap states it with its exact normalisation, its domain and the power series it involves, and asserts no case of it. The source refines it in several directions, including a generalised form indexed by a set attached to the knot, a lift from constant terms to power series, and a refined form involving a matrix-valued cocycle; each refinement is a separate statement with its own hypotheses.

*Hypotheses.* (1) The knot is hyperbolic; the matrix lies in the modular group with non-zero lower left entry. (2) The power series depends on the ratio of the upper left to the lower left entry and is one of the family the source constructs. (3) Every clause is conjectural, and the refinements are separate conjectures.

*Outline.* (1) State the conjecture with all its prefactors and the argument of the power series. (2) Record that the case of the inversion matrix is the expansion of the previous layer. (3) Name the three refinements the source gives and record that each has its own hypotheses. (4) Record that no case is asserted here.

*Acceptance.* (1) Every prefactor and the argument of the series are written out. (2) The specialisation to the previous layer's expansion is recorded. (3) The conjectural status of the statement and of each refinement is recorded.

*Sources.* Section 1, the displayed generalisation of the volume conjecture: The conjecture with its exact normalisation, and the identification of the special case.

#### A reproducible ledger linking the four kinds of data, for two knots

`ArithmeticQuantumTopology:QT.7/the-example-ledger` · *construction* · planet **The example ledger**

The layer's deliverable is a ledger with one row per example and one column per kind of datum, in which every entry names the node that produces it and the status of the statement that produces it. Two knots are carried in full. For the figure-eight knot: the cyclotomic coefficients of its colored Jones polynomials, which are Laurent polynomials produced by the expansion theorem and are proved; its Kashaev invariants at small orders, which are the displayed integers and are computed; the Reshetikhin-Turaev invariants of manifolds obtained by admissible surgery on it, which are evaluations of the unified invariant and are proved; its trace field and the Bloch and extended Bloch classes of its complement, which require a true ideal triangulation with a flattening and are proved subject to that; the volume and Chern-Simons invariant obtained from the regulator, proved; and the asymptotic series with its first coefficients, which is conjectural. For the knot five two the same columns, with the cubic trace field. The ledger's discipline is that a numerical agreement is recorded as a numerical agreement, a heuristic saddle computation as a heuristic, and a conjectural identity as a conjecture, each in its own column, and that a theorem entry names its primary proof and the exact family over which it holds.

*Hypotheses.* (1) Each entry names the node producing it and the status of that node. (2) The two knots are the source's standing examples and the numbers quoted are the source's. (3) The ledger is a deliverable of this layer and is not a proof of anything.

*Outline.* (1) Fix the columns: cyclotomic coefficients, Kashaev values, Reshetikhin-Turaev values at roots of unity, trace field and Bloch classes, volume and Chern-Simons, asymptotic series. (2) Fill the two rows from the nodes of this packet, recording for each entry the node and the status. (3) Record the labelling discipline: proved, computed, numerical, heuristic, conjectural. (4) Record that a theorem entry names its primary proof and the family over which it holds.

*Acceptance.* (1) Every entry names its node and its status. (2) The labelling discipline is stated and applied. (3) No entry is labelled proved whose node is conjectural.

*API.* `Ledger` (structure) The table with one row per example and one column per kind of datum.; `LedgerColumn` (data) The six columns: cyclotomic coefficients, Kashaev values, invariants at roots of unity, trace field and Bloch classes, volume and Chern-Simons, asymptotic series.; `LedgerEntry.node` (data) For each entry, the node that produces it.; `LedgerEntry.status` (data) For each entry, one of the five labels: proved, imported, computed, numerical, conjectural.; `ledgerRows` (example) The two rows, for the figure-eight knot and for the knot five two.

*Unit tests.* `ledger_figureEight_row` — Every entry of the figure-eight row is filled, and the Kashaev column reproduces the six values of the source. `ledger_status_consistent` — No entry is labelled proved whose producing node is conjectural; the asymptotic-series column is conjectural in both rows. `ledger_traceField` — The trace field of the figure-eight knot is the rationals with the square root of minus three adjoined, and of the knot five two the cubic field of the displayed polynomial. `ledger_empty_column` — A column that cannot be filled for a row is recorded as empty and not as agreement; this is the discipline the ledger exists to enforce.

*Sources.* Section 1, the table of values and the two displayed series: The two rows of the ledger, with the numbers the source gives.

#### The labelling discipline, and what the suggested Lean file contains

`ArithmeticQuantumTopology:QT.7/proved-cases-conjectures-and-the-executable-boundary` · *application*

Two things are fixed here. The labelling discipline: every statement of this roadmap carries one of five labels, and the labels are visible in the packet. Proved means a primary source is named together with the exact family over which the statement holds. Imported means the statement is proved in a roadmap named in the requests and is used as a hypothesis here. Computed means a finite calculation, reproducible from the definitions. Numerical means agreement observed in examples, which is evidence and not a proof. Conjectural means the source states it as a conjecture; the volume conjecture, the quantum modularity conjecture and all its refinements, and the conjecture that the asymptotic series has algebraic coefficients are of this kind. The executable boundary: the suggested Lean file states what the pinned libraries support. That is:
- the linking-matrix layer of QT.0 (algebraic splitness, admissibility, the homology of the surgered manifold as a cokernel, handle slides as unimodular congruences);
- the quantum integers;
- the representation ring of sl(2), with the Chebyshev colours and the cyclotomic elements P_n;
- ideal tetrahedra, flattenings, ideal triangulations with their edge equations, and the extended pre-Bloch group;
- the figure-eight Kashaev function;
- the provenance ledger.
Everything else, from ribbon Hopf algebras to the unified invariant, appears as a comment that names its missing machinery. No statement has type True. No proposition standing for a conjecture is introduced as a hypothesis, and no axiom is used.

*Hypotheses.* (1) The five labels are exhaustive for the statements of this packet and are checkable against the node kinds and the source references. (2) The pinned libraries contain monoidal, braided and rigid categories, Chebyshev polynomials, matrices and the complex logarithm, and nothing else relevant. (3) The file elaborates with the Lean toolchain of Mathlib 082e2d3 against its prebuilt library, with sorry as the only warning.

*Outline.* (1) Fix the five labels and their meanings. (2) Classify the statements of this packet and check that the conjectural ones are exactly those whose sources state them as conjectures. (3) List the executable content of the suggested Lean file and the libraries it uses. (4) List the signature-only content and name, for each, the missing machinery. (5) Record the prohibition on placeholder propositions and axioms.

*Acceptance.* (1) The five labels are defined and the classification is checkable. (2) The executable content is small and named exactly. (3) For each signature the missing machinery is named.

*Sources.* Section 1, on the original quantum modularity conjecture: The source's own labelling of its central statements as conjectures, which the discipline records. Section 13, the conjecture on the p-adic and mod p functions: An example of a statement in the main source that is a conjecture and must be labelled as one.

### What is missing

A primary source for any *proved* quantum-modular example, so that the ledger's asymptotic column has an entry
labelled proved rather than conjectural; and the three refinements of the conjecture, which are named and not
decomposed.

## Dependencies on other roadmaps

Each entry is a request recorded in the packet, with the exact statement wanted.

- **`HabiroCyclotomicCompletions:HC.1`** — The Habiro ring itself: the completion of the Laurent polynomial ring in q with respect to the ideals generated by the q-shifted factorials, its ring structure, the evaluation homomorphisms at roots of unity and the Taylor expansion homomorphism at q equal to 1. Every node of QT.3 and QT.4 takes values in this ring; this packet uses it and does not build it.
- **`HabiroCyclotomicCompletions:HC.4`** — Injectivity of the product of the evaluation maps over a set of roots of unity with a limit point, and the failure of injectivity without a limit point. The determination theorem of QT.4 is exactly the transport of this ring-theoretic statement along the evaluation theorem.
- **`HabiroCyclotomicCompletions:HC.3`** — Compatibility of the Taylor expansion map at q equal to 1 with the evaluations at roots of prime power order, in the commutative square used to identify the Taylor expansion of the unified invariant with the Ohtsuki series.
- **`HabiroCyclotomicCompletions:HC.6`** — The q-shifted factorial and quantum binomial identities in the completed ring, in particular the divisibility of the quantum binomial coefficient used as the bound in the integrality theorem of QT.2.
- **`tauceti:TauCetiRoadmap/GeometricTopology#layer-4-knot-theory-done-properly-owned-here`** — Framed oriented link presentations as first-class types with their equivalences, the Reidemeister moves, the geometric-to-diagram correspondence and the Jones polynomial in the pinned Kauffman-bracket normalisation. QT.0 and QT.2 should import these rather than build a second carrier and a second Jones polynomial; the comparison of the two normalisations is part of the import.
- **`tauceti:TauCetiRoadmap/GeometricTopology#layer-5-dehn-surgery`** — Surgery on a framed link, the resulting closed oriented 3-manifold, and the classical Kirby and Fenn-Rourke move theorems. QT.0 needs the classical calculus as the input to the refined calculus for admissible links; only the refinement is new here.
- **`Polylogarithms:P.1`** — The dilogarithm and the Bloch-Wigner function with the five-term relation, on which the Rogers dilogarithm of QT.5 is built. Neither pinned library has any dilogarithm.
- **`Polylogarithms:P.2`** — The weight-two regulator and the comparison of the Bloch-Wigner function with hyperbolic volume. QT.5 should import this identity rather than prove it again; the red team of this area recorded the duplication.
- **`K3BlochGroups:V.3`** — The Bloch group of a field with its exact sequence conventions, so that the extended Bloch group of QT.5 can be compared with it along the forgetful map.
- **`HabiroNahmSeries:HB.9`** — The theorem that the Nahm-type series attached to a symmetric matrix lie in the K-theory-indexed Habiro modules of the associated field. QT.6 needs this as the target of its comparison; this packet does not plan QT.6.
- **`HabiroNahmSeries:HB.4`** — The asymptotic toolkit (Euler-Maclaurin summation, critical points, Hessians, formal Gaussian integration and remainder bounds) that QT.6's stationary-phase statements would import rather than rebuild.

## Restructuring notes

These are recorded in the packet and are for the coordinator, not for a worker to apply unilaterally.

- **QT.0, import.** QT.0 should import framed and oriented link presentations, their equivalences and surgery from the Tau Ceti geometric-topology roadmap (its layers 4 and 5) instead of constructing them, and keep only the refinement to admissible links, Hoste moves and the refined calculus. Its current inputs are the two library-integration layers, which supply nothing a framed link construction uses. *Evidence:* The stage's requires in data/atlas.json are the two FoundationsAndLibraryIntegration layers only; the geometric-topology roadmap's layer 4 owns knot and link presentations carrying orientation and framing, and its layer 5 owns surgery on framed links.
- **QT.2, import.** QT.2 should import the Jones polynomial from the geometric-topology roadmap and state the comparison between its Kauffman-bracket normalisation and the colour-one specialisation of the coloured Jones polynomial, rather than leaving two unrelated Jones polynomials in the atlas. *Evidence:* That roadmap's layer 4 fixes the Jones polynomial via the Kauffman bracket with the substitution of A to the minus fourth power, with two algorithms and an agreement theorem; QT.2 constructs coloured link polynomials with no reference to it.
- **QT.5, prerequisite.** QT.5's dependence on the K-theory Bloch-group layers should be narrowed to the Bloch-group conventions it actually uses, and the dilogarithm and weight-two regulator should be imported from the polylogarithm layers, which own them. Its dependence on QT.0 should be dropped: no node of QT.5 uses framed links or Kirby calculus. *Evidence:* The stage requires QT.0 together with two K3BlochGroups layers; none of the ideal-tetrahedron, gluing-equation, flattening or regulator material uses framed links, and the hyperbolic volume identity is owned by the weight-two regulator layer.
- **QT.6, prerequisite.** QT.6 requires the finite-index modular-function layer of the Nahm-series roadmap and the whole unified-invariant chain through QT.4. Neither is used by state integrals of cusped manifolds; the inputs it does need are the coloured Jones and Kashaev invariants and the hyperbolic data of QT.5. *Evidence:* The stage's requires are QT.4, QT.5 and two HabiroNahmSeries layers; its text is about state integrals, gluing equations and their asymptotics.

## Gaps

- **The general Lie type half of QT.4 is not decomposed.** QT.4 asks for the variants of the unified invariant for quantum groups of an arbitrary simple Lie algebra, with their own integral forms and admissible root orders. That is the Habiro-Le construction, a separate paper, which was not read for this packet. The nodes here cover only the sl(2) case of Habiro's paper. The roadmap's second source entry, which names that work, also carries a year range rather than a version, so the exact text to read is not pinned.
- **The classical Kirby calculus is cited, not decomposed.** QT.0's nodes state the classical Fenn-Rourke and Kirby move theorems and the existence of a surgery presentation, but their proofs are not decomposed here: the excerpt cited is Habiro's recollection of them, not a primary decomposition. They belong to the Tau Ceti geometric-topology roadmap, and a request records that. Only the refinement to admissible links and Hoste moves is decomposed from a primary source.
- **QT.6 and QT.7 are not read.** No node is written for the state-integral, Nahm-series and asymptotics stage or for the quantum-modularity stage. Their sources were not acquired: Faddeev's non-compact quantum dilogarithm, the Andersen-Kashaev state integral, the Dimofte-Garoufalidis series with the Neumann-Zagier datum, the resurgence toolkit and the quantum-modularity conjecture. The coverage records for those two stages are not_read, and the requests list what the eventual nodes would import.
- **The Kashaev invariant and the volume conjecture are named nowhere in the roadmap.** QT.7's quantum-modularity and refined-volume targets are statements about the Kashaev invariant, which the roadmap text never mentions; neither does it name any proved case of the volume conjecture. A blueprint for QT.7 needs those definitions first, and this packet does not supply them.
- **The centre of the completed even integral form is used as a black box.** The cyclotomic expansion of a bottom knot rests on the structure theorem identifying the centre of the completed even integral form with an inverse limit of polynomial quotients. That theorem is quoted from a companion paper of the source and is not decomposed here; the node that uses it cites it as part of its source reference rather than as its own statement.
- **Rational homology spheres are out of scope.** The unified invariant of this packet is defined for integral homology spheres only. The extension to rational homology spheres needs a different coefficient completion, with the order of the first homology inverted, and a separate invariance theorem. The roadmap's own boundary sentence says so, and no node here covers it.

## Handoff note

**What is closed.** Nothing: the packet's status is `partial` and no layer is closed. Six of the eight layers have
nodes; QT.6 and QT.7 have none.

**What is decomposed.** 38 nodes, of which 19 are definitions or constructions carrying 90 API declarations and 58
unit tests, and 19 are lemmas and theorems. Every node cites a primary source with a locator and an excerpt: the
Habiro e-print (sha256 `79069d6a…`) for QT.0–QT.4 and the Neumann e-print (sha256 `0553bc88…`) for QT.5. Statement
numbers in both were recomputed from the sources' own theorem counters rather than taken from a secondary list.

**What remains.** The general Lie type half of QT.4; the classical Kirby calculus, which is cited and should be
imported rather than decomposed here; the root-of-unity semisimplification and the Reshetikhin–Turaev normalisation
of QT.1, which this source does not supply; the whole of QT.6 and QT.7, whose sources were not acquired; and the
six gaps recorded in the packet.

**The restructuring proposal RS-10** touches this family and is **not accepted**: its review records *needs
changes*, and it is not in `data/restructure`. This packet therefore works with the current structure, as the job
instructions require, and records its own structural observations in the `restructure` field rather than assuming
any of RS-10's changes.

**The Lean file.** The third checkpoint rewrote `research/blueprint/suggested/ArithmeticQuantumTopology.lean`
and elaborated it with the Lean toolchain of Mathlib 082e2d3 against its prebuilt library, with `sorry` as the only
warning. It imports Mathlib only. Items that need objects the atlas has not built are listed as
`-- name: not stated; needs …`; the earlier sketch instead stated about sixty items with type `True`. Those objects are:
- framed links and 3-manifolds;
- `U_h(sl₂)` and its completions;
- the Habiro ring;
- the dilogarithm;
- the Bloch groups.

`implementationStatus` stays `unchecked`.

## Second pass: what was added to QT.0 through QT.5

The first pass of this blueprint (merged as pull request 2767) decomposed QT.0 to QT.5 from Habiro's paper and
Neumann's paper. The second pass keeps all of it and adds sixteen nodes, of which the seven below sit in those
layers; the other nine are the whole of QT.6 and QT.7 above. Two further primary sources were obtained for the
purpose: Habiro–Lê, *Unified quantum invariants for integral homology spheres associated with simple Lie
algebras* (arXiv:1503.03549v2), and the Garoufalidis–Zagier paper.

### QT.1 — Ribbon Hopf algebras over a formal power series ring, and the category they present

#### Ribbon Hopf algebras over a formal power series ring, and the category they present

`ArithmeticQuantumTopology:QT.1/topological-ribbon-hopf-algebras` · *definition*

Work over the ring of formal power series in one variable over the complex numbers, a local ring whose maximal ideal is generated by that variable and in which an element is invertible exactly when its constant term is non-zero. A topological ribbon Hopf algebra over it is a complete Hopf algebra in the adic topology equipped with a universal R-matrix, an invertible element of the completed tensor square satisfying the quasi-triangularity identities, and a ribbon element, a central invertible element whose square is the product of the Drinfeld element with its image under the antipode and which behaves as prescribed under the coproduct and the antipode. Modules that are topologically free over the ground ring form a braided monoidal category with duals and a twist, that is a ribbon category, and the braiding is given by the R-matrix followed by the flip while the twist is the action of the ribbon element. The pinned libraries contain the categorical half of this: braided monoidal categories, left and right rigid categories and their duals. They contain no quantised enveloping algebra, no R-matrix and no ribbon element, so the algebra half is entirely new work. This node states the abstract framework; the concrete instance over the three-dimensional simple Lie algebra, with its explicit ribbon element and its integral forms, is the subject of the neighbouring nodes of this layer and is where the atlas shows a planet.

*Hypotheses.* (1) The ground ring is the formal power series ring in one variable over the complex numbers; completeness and separation in its adic topology are standing hypotheses on every module. (2) Topological freeness is required for the duality and trace constructions; a module that is not topologically free is outside the framework. (3) The correspondence with ribbon categories is a statement about topologically free modules, not about all modules.

*Outline.* (1) Record the ground ring and its local structure, and the adic topology on modules with the notion of a zero-convergent family. (2) Define a topological ribbon Hopf algebra: the complete Hopf algebra, the R-matrix with the quasi-triangularity identities, and the ribbon element with its axioms. (3) Construct the braiding and the twist on topologically free modules and check the ribbon axioms. (4) Record which parts are present in the pinned libraries and which are not.

*Acceptance.* (1) The axioms of the R-matrix and the ribbon element are listed in full. (2) The topological hypotheses are stated where they are used, in particular for duality. (3) The boundary with the pinned libraries is recorded.

*API.* `TopologicalRibbonHopfAlgebra` (structure) A complete Hopf algebra over the power series ring with an R-matrix and a ribbon element satisfying the listed axioms.; `TopologicalRibbonHopfAlgebra.R` (data) The invertible element of the completed tensor square, with the quasi-triangularity identities.; `TopologicalRibbonHopfAlgebra.ribbon` (data) The central invertible element with its coproduct and antipode axioms.; `TopologicalRibbonHopfAlgebra.moduleCategory` (equivalence) Topologically free modules form a ribbon category, with braiding from the R-matrix and twist from the ribbon element.; `TopologicalRibbonHopfAlgebra.duals` (structure) Left and right duals on topologically free modules, with the evaluation and coevaluation maps.; `ZeroConvergent` (characterisation) Zero-convergent families and the sums they define, which is what makes infinite expansions meaningful.

*Unit tests.* `trivialRibbonHopf` — The ground ring itself, with trivial R-matrix and ribbon element, is a topological ribbon Hopf algebra whose universal invariant is constant; this is the degenerate case. `twist_unit` — The twist on the tensor unit is the identity, which is the statement that the ribbon element acts trivially on the trivial module. `braiding_not_symmetric` — For the quantised enveloping algebra the braiding is not a symmetry: its square on a two-dimensional module is not the identity, which is exactly what makes the invariant see the knotting. `groupAlgebra_symmetric` — The completed group algebra of an abelian group with trivial R-matrix gives a symmetric, not merely braided, category; its universal invariant cannot distinguish a knot from the unknot.

*Sources.* Section 2, the subsections on modules over the power series ring and on topological ribbon Hopf algebras: The ground ring, its local structure and the convergence notion the universal invariant needs. Section 3, the subsection on the ribbon structure: The standing example, which is what the later layers actually use.

### QT.1 — The abstract data that turns a ribbon Hopf algebra into an invariant of homology spheres

#### The abstract data that turns a ribbon Hopf algebra into an invariant of homology spheres

`ArithmeticQuantumTopology:QT.1/core-subalgebras-and-twist-forms` · *definition* · planet **Core subalgebras and twist forms**

A core subalgebra of a topological ribbon Hopf algebra is a subalgebra, stable under the adjoint action and under the mirror automorphism, which contains the values of the universal invariant of algebraically split bottom tangles in the appropriate sense and on which the twist forms are defined. A twist form is a linear functional, defined on the core subalgebra or only partially defined there, which computes the effect of a plus or minus one framed surgery on a component; the two signs give two forms. The surgery normalisation of the Reshetikhin-Turaev type divides by the value of the twist form on the unit, and the construction requires that value to be invertible in the coefficient ring, which is a hypothesis on the algebra and the chosen root of unity and not an automatic fact. Given a core subalgebra with its twist forms, the value of the universal invariant of an admissible link at the twist elements is invariant under the Hoste moves and so defines an invariant of integral homology spheres; that is the abstract theorem the concrete constructions instantiate.

*Hypotheses.* (1) The subalgebra must be stable under the adjoint action and the mirror automorphism; these are exactly the stabilities the Hoste-move invariance proof uses. (2) The twist forms may be only partially defined, and the construction then carries the domain of definition as a hypothesis. (3) Invertibility of the normalising denominator is a hypothesis to be checked at each root of unity, not a consequence.

*Outline.* (1) Define a core subalgebra with its stability conditions and the requirement on the values of the universal invariant. (2) Define the twist forms, in both the everywhere-defined and the partially defined versions, and the surgery normalisation they give. (3) Record that the normalising denominator must be invertible and that this is checked case by case. (4) State the abstract theorem: a core subalgebra with twist forms gives an invariant of integral homology spheres, by invariance under the Hoste moves.

*Acceptance.* (1) The stability conditions are stated and matched to the steps of the invariance proof. (2) The partial definition of the twist forms is carried, not suppressed. (3) The invertibility of the denominator is a stated hypothesis.

*API.* `CoreSubalgebra` (structure) A subalgebra with the stated stabilities on which the twist forms are defined.; `CoreSubalgebra.twistForm` (data) The linear functional computing a plus or minus one framed surgery, possibly partially defined.; `CoreSubalgebra.normalisation` (constructor) The surgery normalisation, dividing by the value of the twist form on the unit.; `CoreSubalgebra.twistForm_one_isUnit` (characterisation) The requirement that the normalising denominator be invertible, stated as a hypothesis.; `CoreSubalgebra.invariant` (universal-property) The theorem that a core subalgebra with twist forms gives an invariant of integral homology spheres.

*Unit tests.* `integralCoreSubalgebra_sl2` — For the quantised enveloping algebra of the three-dimensional simple Lie algebra there is an integral core subalgebra, and the resulting invariant is the one of the later layers. `twistForm_one_at_root` — At a root of unity the normalising denominator is a Gauss sum, and its non-vanishing is a condition on the order; it fails for some small orders, which is the excluded case. `mirror_stability_needed` — Without stability under the mirror automorphism the invariance under the inverse Hoste move fails; this is the non-example showing the condition is not decorative. `coreInvariant_empty` — For the empty admissible link the construction returns the unit, which is the value on the three-sphere.

*Sources.* Section 2, the subsection introducing core subalgebras: The abstract framework, in the companion paper's own words. Section 2, the subsection on partially defined twist forms and the theorem constructing the invariant: The theorem the whole roadmap instantiates.

### QT.1 — What specialising at a root of unity does and does not give

#### What specialising at a root of unity does and does not give

`ArithmeticQuantumTopology:QT.1/root-of-unity-categories-are-not-generically-semisimple` · *comparison*

Three distinct settings must be kept apart, and the roadmap keeps them apart. The first is the algebra over the formal power series ring, where the category of topologically free modules is a ribbon category and the universal invariant lives; nothing here is semisimple in the finite-dimensional sense and nothing is specialised. The second is an integral form over a ring of Laurent polynomials, where the colored invariants take their values and where the integrality statements are proved; passing from the first to the second is a theorem about the values of the universal invariant, not a change of notation. The third is the specialisation at a root of unity, where the representation category is not semisimple: tilting modules of zero quantum dimension must be discarded and the semisimplified quotient taken before a modular category is obtained, and the normalising denominators must be checked to be invertible. This roadmap never asserts semisimplicity at a root of unity, never identifies the integral form with the generic algebra, and states each comparison between the three settings as a separate statement with its own hypotheses.

*Hypotheses.* (1) The three settings are distinguished throughout the packet; no node moves between them without a comparison statement. (2) Semisimplicity at a root of unity holds only after semisimplification and only for the admissible orders. (3) The comparison between the integral form and the generic algebra is a theorem of the sources and is cited, not assumed.

*Outline.* (1) Name the three settings and the objects that live in each. (2) Record that the passage from the first to the second is the integrality theorem of the next layer. (3) Record that the passage to a root of unity requires discarding the modules of zero quantum dimension and taking the semisimplified quotient, and requires the admissible orders. (4) Record that no node of this packet asserts semisimplicity at a root of unity.

*Acceptance.* (1) The three settings are named and separated. (2) Each passage between them is identified with a named statement elsewhere in the packet. (3) The absence of a semisimplicity claim is checkable against the other nodes.

*Sources.* Section 8, the introduction to the recovery of the Reshetikhin-Turaev invariant: The statement that the specialised category is not semisimple and what has to be done instead. Section 11, the definition of the invariant at a root of unity: The localisation that makes the denominators invertible, which is the third setting.

### QT.2 — Finite truncations, integrality of coefficients, and the order of operations

#### Finite truncations, integrality of coefficients, and the order of operations

`ArithmeticQuantumTopology:QT.2/truncations-and-what-may-be-done-before-completion` · *construction*

Before any completion is taken, the cyclotomic expansion may be truncated at a finite order, giving a Laurent polynomial in the variable with integer coefficients which agrees with the colored invariant for every colour up to that order. The truncations are compatible: the truncation at a lower order is obtained from the one at a higher order by discarding the later terms, and evaluation at a root of unity of order at most the truncation order factors through the truncation, because the q-Pochhammer factor of index at least the order of the root vanishes there. That last observation is the whole reason the completion of the next layer is the right one: an element of the completion may be evaluated at a root of unity precisely because the defining tower kills the factors that vanish there. The order of operations matters and is fixed here: expand, prove integrality of the coefficients, truncate, and only then complete; completing first and expanding afterwards is a different and unsupported operation.

*Hypotheses.* (1) The truncation is of the expansion in the fixed conventions, and its coefficients are the cyclotomic coefficients up to the given order. (2) The factorisation of the evaluation through the truncation uses the vanishing of the Pochhammer factor at a root of unity of small order. (3) The order of operations is a discipline of this roadmap and is checkable against the other nodes.

*Outline.* (1) Define the truncation of the expansion at a finite order and record that it is a Laurent polynomial with integer coefficients. (2) Prove the compatibility of the truncations with each other. (3) Prove that evaluation at a root of unity of order at most the truncation order factors through the truncation. (4) Record the order of operations and check that every later node respects it.

*Acceptance.* (1) The truncations and their compatibility are defined and proved. (2) The factorisation of the evaluation is proved from the vanishing of the Pochhammer factor. (3) The order of operations is stated and is checkable.

*API.* `cyclotomicTruncation` (constructor) The truncation of the cyclotomic expansion at a finite order, a Laurent polynomial with integer coefficients.; `cyclotomicTruncation_trunc` (compatibility) The truncations at different orders are compatible under discarding terms.; `eval_cyclotomicTruncation` (characterisation) Evaluation at a root of unity of order at most the truncation order factors through the truncation.; `cyclotomicTruncation_before_completion` (relation) Expand, prove integrality, truncate, complete, in that order.

*Unit tests.* `cyclotomicTruncation_unknot` — Every truncation of the expansion of the unknot is one, since all higher cyclotomic coefficients vanish. `eval_small_root` — At a root of unity of order n the truncation at order n already computes the value, because the next Pochhammer factor vanishes. `cyclotomicTruncation_compat` — The truncation at order n of the truncation at order m, for n at most m, is the truncation at order n. `completion_first_differs` — Completing the ring of Laurent polynomials first and then attempting an expansion does not give the same coefficients; the expansion is a theorem about the invariant, not about the completed ring.

*Sources.* Section 1, the subsection on the ring of analytic functions on the set of roots of unity: The vanishing that makes evaluation factor through a truncation, which is the content of the node.

### QT.2 — What a cyclotomic expansion is not

#### What a cyclotomic expansion is not

`ArithmeticQuantumTopology:QT.2/an-expansion-is-a-theorem-about-an-invariant` · *comparison*

A cyclotomic expansion is a theorem about a specific invariant in a specific normalisation, and not a property that a q-series acquires by being evaluable at roots of unity. Three things follow. The expansion is stated for the reduced colored Jones invariant of a knot in the conventions fixed above; the unreduced invariant has a different expansion and the coefficients are not the same. The expansion for links is not the expansion for knots: for links the statement available is the divisibility of the universal invariant on algebraically split zero-framed links, which is what the surgery sum needs, and it is weaker than a basis expansion. And a q-series that happens to lie in the cyclotomic completion has no canonical cyclotomic expansion attached to it by that membership alone; assigning one requires a theorem identifying it with an invariant in these conventions.

*Hypotheses.* (1) The three statements are about the scope of the expansion theorem and prove nothing new. (2) The second point distinguishes the knot statement from the link statement, which is the one the surgery sum uses. (3) The third point is the boundary the stage text insists on.

*Outline.* (1) Record that the expansion is stated for the reduced invariant in the fixed conventions. (2) Record that the link statement is a divisibility and not a basis expansion. (3) Record that membership in the completion does not produce an expansion. (4) Check that no node of this packet assigns a cyclotomic expansion to a q-series on the strength of membership alone.

*Acceptance.* (1) The three points are stated and each is checkable against the other nodes. (2) The distinction between the knot and the link statements is explicit. (3) No node of this packet violates the third point.

*Sources.* Section 1, the subsection on the ring of analytic functions: The property that membership in the completion does give, which is evaluation and determination, and not an expansion.

### QT.3 — The domain of the invariant, and what a larger domain would require

#### The domain of the invariant, and what a larger domain would require

`ArithmeticQuantumTopology:QT.3/rational-homology-spheres-are-not-in-this-domain` · *comparison*

The invariant of this layer is defined for integral homology spheres and not for general closed three-manifolds. Three reasons combine. The admissible presentations exist only for integral homology spheres, so the construction has no input for a rational homology sphere. The framing anomaly, and hence the dependence on a fourth root of the root of unity, disappears only for integral homology spheres, so the target ring would have to change. And the divisibility theorem that gives convergence is proved for algebraically split zero-framed links, which is what admissibility supplies. Extensions to rational homology spheres exist in the literature, with modified coefficient rings depending on the order of the first homology, and they are separate theorems with separate targets; this roadmap records them as such and does not silently include lens spaces in its domain.

*Hypotheses.* (1) The three reasons are independent; removing any one of them still leaves the construction undefined. (2) The extensions cited change the target ring, so their statements are not this one with a weaker hypothesis. (3) Lens spaces are the standard example outside the domain.

*Outline.* (1) Record that admissible presentations exist only for integral homology spheres. (2) Record that the fourth-root dependence returns for general manifolds. (3) Record that the divisibility theorem is about algebraically split zero-framed links. (4) Record the literature extending the invariant to rational homology spheres, with the changed targets, and state that they are separate theorems.

*Acceptance.* (1) All three reasons are recorded. (2) The extensions are attributed and their changed targets are stated. (3) No node of this packet applies the invariant outside the domain.

*Sources.* Section 1, the subsection on the main result and consequences: The literature extending the domain, and the fact that the target is modified.

### QT.4 — The same theorem for every simple Lie algebra, with the restrictions it carries

#### The same theorem for every simple Lie algebra, with the restrictions it carries

`ArithmeticQuantumTopology:QT.4/general-simple-lie-type` · *theorem* · planet **General simple Lie type**

For each finite dimensional simple complex Lie algebra there is a unique invariant of integral homology spheres with values in the cyclotomic completion of the polynomial ring in the variable whose evaluation at each root of unity in the admissible set for that Lie algebra is the Reshetikhin-Turaev invariant of the manifold at that root for that Lie algebra. The admissible set is a subset of the roots of unity determined by the Lie algebra, defined by a restriction on the order; there is a second such set for the projective version of the invariant, and on the intersection the two invariants agree. Outside the admissible set the evaluation of the unified invariant is still defined, and the source proposes to take it as the definition of the invariant there, an analytic continuation rather than a theorem. The consequences of the previous nodes carry over: algebraic integrality on the admissible set, Galois equivariance, determination by the values on a subset with a limit point and by the Taylor expansion at any root, and the value one at the trivial root. The proof is the instance, for the integral core subalgebra of the quantised enveloping algebra of the Lie algebra, of the abstract theorem that a core subalgebra with twist forms gives an invariant of integral homology spheres.

*Hypotheses.* (1) The Lie algebra is finite dimensional simple complex; the admissible set of orders depends on it and is listed in the source. (2) The agreement with the projective version holds on the intersection of the two admissible sets. (3) The extension outside the admissible set is a definition by analytic continuation and is labelled as such.

*Outline.* (1) Record the admissible sets for the invariant and for its projective version. (2) State the existence and uniqueness of the unified invariant for the Lie algebra. (3) Record the agreement with the projective version on the intersection. (4) Record the proposal to define the invariant outside the admissible set by evaluation, and mark it as a definition. (5) Record that the consequences of the previous nodes carry over, and that the proof is the instance of the abstract core subalgebra theorem.

*Acceptance.* (1) The admissible sets are named and the restriction on the order is recorded as a hypothesis. (2) The analytic continuation is labelled as a definition, not a theorem. (3) The proof is identified with the abstract theorem of the ribbon layer.

*Sources.* Section 1, Theorem 1.1: The main theorem of the companion paper, with its admissible set. Section 1, the subsection on analytic continuation: The proposal to extend the definition outside the admissible set, which is a definition and not a theorem. Section 1, Proposition 1.2 and Corollary 1.4: The projective comparison and the integrality in general Lie type.

### QT.4 — Why the determination theorems do not transfer to other completions

#### Why the determination theorems do not transfer to other completions

`ArithmeticQuantumTopology:QT.4/the-coefficient-ring-may-not-be-changed` · *comparison*

The determination and injectivity statements of this layer are about the cyclotomic completion of the polynomial ring over the integers, and they depend on that ground ring in an essential way. Over the rationals the analogous completion behaves differently: it is not an integral domain, and the Taylor expansion map is surjective but not injective, so an element is not determined by its expansion at a root. Consequently a statement proved here may not be imported into a localised or a twisted completion without a comparison theorem. Three concrete prohibitions follow. The determination by values on a set with a limit point may not be quoted for the rational completion. The integrality statement may not be quoted after inverting any integer, since the target of the evaluation changes. And the invariants of rational homology spheres constructed in the literature live in modified completions, so their determination statements are separate theorems and are not this one.

*Hypotheses.* (1) The contrast is with the completion of the polynomial ring over the rationals, and is the source's own. (2) The prohibitions are about quoting, not about the mathematics being false in a modified setting; a modified setting needs its own theorem. (3) This node proves nothing and records a boundary.

*Outline.* (1) Record the two failures over the rationals: the completion is not a domain, and the Taylor map is not injective. (2) Record the three prohibitions and check them against the other nodes of this packet. (3) Record that the rational homology sphere extensions live in modified completions.

*Acceptance.* (1) The contrast with the rational completion is stated with both failures. (2) The three prohibitions are stated and checkable. (3) No node of this packet quotes a determination statement outside the integral completion.

*Sources.* Section 1, the subsection on the ring of analytic functions: The contrast with the rational completion, which is the whole content of the boundary. Section 1, the subsection on the ring of analytic functions: The same point in the main source.

### QT.5 — The four proof obligations between a knot diagram and a number-field Bloch class

#### The four proof obligations between a knot diagram and a number-field Bloch class

`ArithmeticQuantumTopology:QT.5/a-diagram-does-not-produce-a-bloch-class` · *comparison*

Passing from a knot or a link to an element of the Bloch group of a number field is not automatic, and four obligations stand between them. Geometric existence: the complement must carry a complete hyperbolic structure of finite volume, which is a theorem about the manifold and not a property of a diagram. Triangulation: a true ideal triangulation must be exhibited, since the simplicial formula is stated for those and the triangulations produced by the standard software are not true. Flattening and branch data: a flattening must exist and be chosen, and the extended class depends on it through the chosen logarithms. Algebraicity and normalisation: the shape parameters must be shown to lie in a number field, the trace field, before a class in the Bloch group of that field is obtained, and the regulator normalisation must be fixed, since the target is only defined modulo pi squared. A numerical solution of the gluing equations discharges none of the four.

*Hypotheses.* (1) The four obligations are independent; discharging three leaves the construction incomplete. (2) The dependence of the extended class on the flattening is genuine, and the class in the ordinary Bloch group is what is independent of it. (3) This node records a boundary and proves nothing.

*Outline.* (1) List the four obligations and, for each, name the statement that discharges it. (2) Record that the standard software produces triangulations that are not true, so the simplicial formula does not apply to them directly. (3) Record the dependence on the flattening and on the branch choices. (4) Record that a numerical solution is not a geometric structure.

*Acceptance.* (1) All four obligations are named with the statement that discharges each. (2) The status of software-produced triangulations is recorded. (3) No node of this packet produces a Bloch class from a diagram.

*Sources.* Section 1, the introduction: The status of the triangulations the software produces, and that a separate theorem is needed for them.

