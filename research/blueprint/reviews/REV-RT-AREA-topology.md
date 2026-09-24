# REV-RT-AREA-topology

**Job** REV-RT-AREA-topology (issue #1546) · **Date** 24 September 2026 · Claude Code, session
`cc-7b31c4` · **Verdict: all 123 findings confirmed, none rejected.** Red team by Claude Code, session
`cc-2aeb03` (issue #1547, PR #2758); a different session, as the job requires. I did no part of
`RT-AREA-topology`.

Repository baseline `45707f47`. Library baseline: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`,
Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

Twenty-three high, seventy-five medium and twenty-five low findings over six roadmaps —
`ArithmeticQuantumTopology` and the Tau Ceti roadmaps `AlgebraicTopology`,
`CombinatorialHeegaardFloer`, `GeometricTopology`, `HeegaardFloer` and `UniversalCovers` — by kind,
51 missing, 40 error, 12 duplicate, 11 other and 9 library-claim. I checked every finding at its own
evidence and found no error in any of them. The ninety-eight high and medium findings become
`FIX-RT-AREA-topology`.

## What was checked, and how

**Every declaration citation, at the pins.** The report makes 84 `file:line` citations into Mathlib
`082e2d3` and Tau Ceti `f790474`. **All 84 resolve**, in local checkouts of both repositories at those
commits, and in every case the line carries the declaration the report names. I also re-ran the
absence claims myself: no `exact couple` anywhere in Mathlib (finding 24), no spectral sequence
anywhere in Tau Ceti, no singular cohomology in either (22, 88), no manifold orientation and no degree
of a map (101), an exterior derivative only on normed spaces (103), no Jordan curve theorem (83), and
`LocPathConnectedSpace` a deprecated alias of `LocallyPathConnectedSpace` (123). There is no `sorry`
in any of the trees the library-claim findings read: 124 files under `TauCeti/KnotTheory`,
`TauCeti/LowDimTopology` and `TauCeti/Algebra/Bigraded`, 120 under `TauCeti/AlgebraicTopology`, 187
under `TauCeti/Topology`, 73 under `TauCeti/Geometry/Manifold` and 25 under `TauCeti/Analysis/Fredholm`.

**Every quoted repository string.** I extracted the quoted fragments from the claims and evidence and
matched them, whitespace- and markup-insensitively, against the roadmap documents, `data/atlas.json`,
the per-roadmap extracts, the restructuring and link files, the paper extractions, the audits and both
pinned Lean trees: **459 fragments matched verbatim**, and the remainder are quotations from books and
papers, which I checked separately. Nothing in the report paraphrases the repository into its evidence.

**The atlas, directly.** Every stage's `requires` and `consumers` that a finding names, every claim
that a roadmap has no stage edge (true of all five Tau Ceti roadmaps here), and the searches that
support the "planned nowhere" findings, recomputed over all 1968 stage descriptions. Those searches
are the backbone of the block and they hold: *unknotting*, *crossing change* and *torus knot* occur in
no stage (44); *Seifert genus*, *Goeritz*, *quasi-alternating*, *Fox calculus*, *link group*,
*Torres*, *contact structure*, *transverse knot*, *Kneser*, *Rasmussen* and *universal coefficient* in
none (46, 47, 48, 50, 51, 55, 59); *Legendrian*, *Thurston norm* and *multivariable Alexander* only
inside `CombinatorialHeegaardFloer` (48, 49, 50); *smooth triangulation* only in the consumer (71).
Finding 20's internal inconsistency reproduces exactly: the extract gives `QT.0` `requires: []` and no
`LI` edge where `data/atlas.json` gives both.

**Kirby's problem list, from the source.** The list is a 1996 dvips PostScript file with no text
layer; I decoded its show-strings into 380 pages of searchable text and read the problems the findings
turn on. Every number checks out: **3.34** is the Smale conjecture with the update recording Hatcher's
proof, **4.34** asks for `π₀(Diff(S⁴))`, **1.16** is Property R, **1.82** is the generalised
conjecture about framed links producing connected sums of `S¹ × S²` (with Gabai cited in its remarks
for the one-component case), **3.2** is Waldhausen's virtual Haken question, **3.51** is Thurston's
virtual fibering question, **4.4** is the Rokhlin-invariant-one question whose remarks cite
Galewski–Stern and Matumoto, **4.82** is Teichner's question about `⋆RP⁴ # ⋆CP²`, **1.19** is the
Akbulut–Kirby 0-surgery conjecture, **1.31** is Matsumoto's question about knots in homology spheres
bounding PL acyclic 4-manifolds, **1.53**'s update reads "No [Kearton 1989] … but if the knot is
oriented and the mutation … preserves orientation, then the problem is still open", **3.15**(vi)
records the Boileau–Zieschang rank-2 genus-3 examples, and **4.126(C)** is the inclusion
`SO(5) → SDiff(S⁴)`. Findings 70, 72–77, 92, 93 and 95 all rest on these, and all of them are right.

**Ozsváth–Szabó, from the LaTeX sources.** For `math/0101206v4` I recomputed the whole theorem
numbering from the `\include` order and the environment sequence, and **every numbered reference in
findings 97, 104, 105, 106, 108 and 117 lands exactly**: 2.6 `lemma:IdentifyPiOneSym`, 2.7
`prop:PiTwoSym`, 2.8 `lemma:ChernClass`, 2.15 `prop:WhitneyDisks` with Remark 2.16 next, 2.19
`lemma:VarySpinC`, 3.3 `lemma:MasClass`, 3.5 `lemma:EnergyBound`, 4.10 `def:NonTorsionAdmissible`,
4.12 `lemma:EnergyZero` (weak admissibility for all spinᶜ structures, by a volume form with zero-area
periodic domains), 4.13 `lemma:WeakFiniteness`, 4.14 `lemma:StrongFiniteness`, 8.2 `prop:HomologyOfX`,
8.4 `prop:AssocSpinC`, 8.5 `prop:SpinCForTriangles`, 8.16 `thm:Associativity`, 9.5
`thm:HandleslideInvariance`, 9.6 `lemma:Assoc`. The section order likewise confirms finding 117(a).
In Ozsváth–Stipsicz–Szabó `0912.0830v3` I read Definition 1.2, which makes `HF̂_st` the equivalence
class `[V, b]` and splits off the `S¹ × S²` summands by definition, and the sentence deferring spinᶜ
to the sequels — findings 55, 56 and 57.

**The grid-homology book and MOST.** The book's recorded hash `f914fc3181dcbd08…` reproduces. I
extracted its text and checked the page locators against the running heads: p. 79 (Lemma 4.6.9 and
Remark 4.6.10), p. 99, p. 105, p. 114, p. 121, p. 122, p. 136, p. 137 — **every one matches**. I read
Remark 4.6.10 verbatim ("Lemma 4.6.9 uses the fact that the grid diagram G represents a knot rather
than a link; in general, the actions of variables corresponding to different link components are not
chain homotopic"), which is finding 42's evidence, and Lemma 8.2.1. In Manolescu–Ozsváth–Szabó–Thurston's
LaTeX I read the two statements finding 41 and 42 quote: the per-component Alexander shift `−(nᵢ−1)/2`
and the fully blocked formula `⊗ᵢ Vᵢ^{⊗(nᵢ−1)}`, whose total exponent is `n − ℓ`.

## The findings that carry the most weight

**Finding 41, the link normalisation.** The standing conventions fix `A = ½(M_O − M_X) − (n−1)/2` and
`GH̃(G) ≅ GĤ(L) ⊗ W^{⊗(n−1)}`, which are the *knot* formulas; the book's are `(n − ℓ)` in both places.
For an even-component link every state then has strictly half-integral Alexander grading, so G.2's
lemma is false. Tau Ceti implemented the roadmap's formula and proved exactly that:
`Grid/Gradings.lean:91` carries the `(n−1)/2` shift and `Grid/Grading/Parity.lean:279` proves
integrality **iff** the component count is odd, which is why its bigraded statements are restricted to
`OddComponentGridDiagram` — while `Algebra/Bigraded/Stabilization.lean:17` already writes `W^{⊗(n−ℓ)}`
against the roadmap. This one finding propagates through G.2, G.3, G.4, G.9 and G.10.

**Finding 102, the Calderón–Zygmund inequality.** `‖u‖_{W^{1,p}} ≤ C‖∂̄u‖_{L^p}` with no hypothesis is
false for any holomorphic `u`, `u ≡ 1` included. Both repairs are the right ones: compact support (or a
lower-order term with interior shrinking) and `1 < p < ∞`, the Beurling transform being a
Calderón–Zygmund operator and unbounded at the endpoints.

**Finding 66, the Euler-class target.** As sketched the bound ranges over every embedded surface with
right-hand side `−χ(S)`, and an embedded 2-sphere gives `0 ≤ −2`; so the predicate holds of no
foliation and the disproof target is vacuously true, while the repaired version contradicts Thurston's
inequality, which is a theorem. The layer also plans neither the Thurston norm nor its dual.

**Finding 67, PL local flatness.** False in codimension two: the cone on a nontrivial knot in
`S³ = ∂D⁴` is a PL embedded disc that is not locally flat at the cone point, since local flatness there
would make every knot topologically slice. Codimension two is exactly where Layers 4 and 6 use the
predicate.

**Finding 113, the lens-space acceptance test.** In the standard genus-one diagram of `L(p,q)` the `p`
intersection points lie in `p` distinct spinᶜ structures, so `π₂(x,y)` is empty for distinct generators
and the differential vanishes for topological reasons — no moduli space is counted. Any definition with
the right generators and splitting passes the test, so it cannot validate the holomorphic theory.

**Findings 118–121, the built roadmap.** Every stated target of all five `UniversalCovers` stages is
built sorry-free at the pin (I resolved all thirteen citations), while the atlas marks every stage
`unknown` and the README still reads as a plan — and two consumers, `BelyiMaps` Layer 12.6 and
`LieGroups` Layers 4–5, re-plan what is already there. The finding that Mathlib's own `deck` has landed
(`Topology/Covering/Deck.lean:41`) while Tau Ceti keeps a second `TauCeti.Deck` is the same story one
level down.

## Limits of this check

**Hatcher's book could not be machine-read here.** Findings 22, 23, 26, 31, 32, 36 and 37 cite pages of
*Algebraic Topology*; the PDF defeated my text extractor in this environment, and there is no renderer
or OCR available. For those seven findings the page locators rest on the red team's reading, and I
checked the mathematics against my own knowledge of the book — the compactly supported duality theorem
and its role in the Mayer–Vietoris induction, Poincaré–Lefschetz through a collar, the relative
homotopy groups and the fibration sequence, CW approximation and the invariance of singular homology
under weak equivalence, `H₁ = π₁^{ab}`, the `§4.1` versus `§4.2` split that finding 37 turns on, and the
homotopy lifting property of fibre bundles over an arbitrary base. Each of those is standard and each
is as the report states, but I did not read these pages myself and say so here rather than imply
otherwise.

**The grid-homology book is only partly extracted.** My extractor produced 327 page streams for a book
of about 400 pages, skipping pages whose content streams it could not decode, so a few of the book
locators (Proposition 3.1.13, Corollary 3.2.3, Proposition 4.3.3, the "untied by crossing changes"
sentence) fall on pages I could not read. Every locator I *could* reach was exact, and the neighbouring
material (Definition 3.1.12 on p. 48, immediately before Proposition 3.1.13) is consistent with them.

**What I did not do.** I did not read the six roadmap documents end to end, only the stages and
sections the findings name and their neighbours; I did not re-derive the report's corpus-wide
duplication sweeps, only the ones a finding rests on; and I checked the remaining arXiv sources
(Perutz, Zemke, Lipshitz, Sarkar, Habiro, Piccirillo and the rest) by their statements rather than by
reading them through. I add no finding of my own. `AUDIT-44` and `AUDIT-45`, which would cover this
area, have job files and no results, which is itself findings 65 and 114.

## Checks

    python3 scripts/check_redteam.py research/blueprint/redteam/RT-AREA-topology.result.json \
                                     research/blueprint/redteam/RT-AREA-topology.review.json

Both report no errors. Two pairs should be fixed together, as the report says: findings 41 and 42 (the
link normalisation and the `V_i` action, which share the knot-versus-link boundary), and findings 45,
59 and 79 (the `GeometricTopology`–`CombinatorialHeegaardFloer` exchange, where the cycle, the missing
normal-form theorem and the `s` invariant are one knot of problems). Findings 24, 51 and 54 are three
views of the same missing homological algebra — the generic spectral sequence, the universal
coefficient theorem over a PID and filtered complexes — and a fixer should give the three of them one
owner between `AlgebraicTopology` and `CombinatorialHeegaardFloer`'s Lane ALG.
