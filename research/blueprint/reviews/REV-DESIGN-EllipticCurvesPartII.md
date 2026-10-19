# Independent review: Elliptic curves, Part II

Job: `REV-DESIGN-EllipticCurvesPartII`, issue [#3522](https://github.com/CBirkbeck/tauceti-explorer/issues/3522).
Reviewer: Codex, session `codex-7VH71V`, 2026-10-19.
The design was written by Codex session `codex-36tJxY`; this review is independent.

## Verdict

**Accepted as an import index and merger proposal.** The seven routed targets
already belong to the accepted EllipticLegendreCharacterInterfaces plan.
Creating another mathematical plan would duplicate that work. The six alias
layers correctly import that owner's layers, with no reverse dependency.
Acceptance completes the import review; it closes no mathematical layer and
does not apply the proposed merger.

All 37 imported nodes were checked against their owner statements,
hypotheses, direct prerequisites, proof routes and cited source locations.
The packet's `review.checked` gives an individual verdict for every import.
The exact statements of the three finer supplier nodes, and the conductor
supplier's local-independence prerequisite, were also read. Their planned
status and the owner's existing obligations remain explicit.

| Inventory | Reviewed count | New ownership here |
| --- | ---: | ---: |
| Routed source targets | 7 | 0 |
| Mathematical nodes | 37 imports: 2 definitions, 6 constructions, 14 lemmas, 14 theorems, 1 comparison | 0 |
| Definition/construction contracts | 8 | 0 |
| API items | 33 | 0 |
| Definition tests | 27 | 0 |
| Planets | 19 | 0 |
| Pinned baseline declarations | 16 | 0 |
| Alias layers | 6 `source_decomposed` import records | 0 closed layers |
| Inherited gaps / supplier requests | 4 / 3 | 0 additional obligations |

## Changes made

- Added the accepted review object with 37 individual import verdicts.
- Added a confirming review to the existing source-finding reference
  EllipticLegendreCharacterInterfaces/E1, prior PAPER-BENNETT-SIKSEK-20/E14.
- Added the independent review receipt to the reader and wrote this report
  and the handoff.

No mathematical statement, hypothesis, prerequisite, API, test or planet
needed correction. No baseline citation was removed or replaced; no node
was added. The roadmap definition and suggested Lean file were reviewed
and left unchanged. The canonical owner's files were not edited.

## Source and mathematical checks

Read Michael A. Bennett and Samir Siksek, *A conjecture of Erdős,
supersingular primes and short character sums*, Annals of Mathematics
191 (2020), no. 2, 355–392, in the
[publisher version](https://annals.math.princeton.edu/2020/191-2/p02).
The [PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf)
read on 2026-10-19 has SHA-256
`3920a7524a37870942fe3591ac858db23cb604f4331bccd2a6dc5f11a1671fbf`,
matching both deliverables. Pages 365–372 cover every imported locator.
All statements below and in the review record are in our own words.

| Owner layer | Mathematical boundary verified |
| --- | --- |
| LG.0 | Equation (17), p.367, and the six ratios in Lemma 6.2's proof, p.368: normalization gives a scalar twist; the six root-ordering labels may repeat. Coefficient and invariant identities are explicit calculations, not claims that the paper states every adapter. |
| LG.1 | Lemma 6.2(i)–(ii), pp.367–368, and the unit-model step in Lemma 6.4's proof, p.368: good reduction is tested on minimal models; integral j suffices; conductor 1 is allowed; the actual elliptic conductor requires its separate supplier. The alternative j-valuation proof is correctly identified as such. |
| LG.2 | Lemma 6.3's proof, p.368, and the split-descent discussion, p.370: CRT reads the existing native μ. A root is represented by the derivative correction, never by a zero unit class. The three-square halving criterion includes this root case. |
| LG.3 | Lemma 6.3, p.368, and Lemma 6.5, p.370: the subgroup is Z/2×Z/4, and the minus-one count has exact 2-adic valuation three. The proof excludes Z/4×Z/4 separately; absence of order eight alone would be insufficient. |
| LG.4 | The local calculation in Lemma 6.6's proof, p.371: the existing corrected point has y=8itv(t+iv). With r=2t and s=2iv, r²−s²=2, its coordinates are x=r(r+s), y=rs(r+s); its tangent slope is r+s and its double is (r²,0). These identities justify the local generality without progression hypotheses. |
| LG.5 | Lemma 5.2's proof, p.366: the symmetric cubic has trace zero by a direct character count. The twist sign in Lemma 6.6's proof, p.371, specializes the existing BSD.0 generic target at the exact native scalar. |

The source-finding confirmation uses the existing local F₅ witness:
t=v=2, i=3 and λ=3 give the corrected point (4,3), whose double is (1,0).
The printed pair (4,4) fails the curve equation. This checks the existing
finding and its general correction; it is not a new erratum, a fresh
correction search, or a claim that the small field satisfies the global
hypotheses of Lemma 6.6. `sourceIssues` therefore remains empty, with the
confirmed finding retained under `sourceIssueReferences`.

## Pinned baseline

Read all 16 declarations, including ambient hypotheses, at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`.
The five inspected source files agree byte-for-byte with their pinned git
objects and the source in the shared build. This is the alias's
16-declaration audit, not a new audit of the owner's 56 citations.

Names in this table are in the `WeierstrassCurve` namespace; `Affine`
qualifiers are retained where applicable. Line numbers refer to the pins.

| Declaration | Pinned module and line | Fit |
| --- | --- | --- |
| `WeierstrassCurve` | Mathlib `EllipticCurve/Weierstrass.lean:77` | Five coefficient fields over an arbitrary type. |
| `b₂` | Same module, 101 | Native commutative-ring invariant. |
| `b₄` | Same module, 105 | Native commutative-ring invariant. |
| `b₆` | Same module, 109 | Native commutative-ring invariant. |
| `b₈` | Same module, 113 | Native commutative-ring invariant. |
| `Δ` | Same module, 132 | Native sign and discriminant polynomial. |
| `Affine.Equation` | Mathlib `EllipticCurve/Affine/Basic.lean:149` | Equation solutions, before requiring nonsingularity. |
| `Affine.equation_iff` | Same module, 156 | The five-coefficient affine equation over a commutative ring. |
| `quadraticTwistOf` | Tau Ceti `EllipticCurve/QuadraticTwist.lean:163` | Commutative ring; discriminant parameter t²−4n. Scalar d requires (0,−d/4) in characteristic other than two. |
| `Affine.μ` | Tau Ceti `EllipticCurve/MordellWeil/XSubT.lean:817` | Field, decidable equality, characteristic-not-two normal form and ellipticity; multiplicatively transported native points to unit squareclasses. |
| `Affine.ker_μ_eq` | Same module, 991 | Same hypotheses; kernel equals the transported range of doubling. |
| `pointCount` | Tau Ceti `EllipticCurve/PointCount.lean:69` | Field; all affine equation solutions plus O, including singular solutions. |
| `pointCount_def` | Same module, 76 | Public defining equation across the module boundary. |
| `pointCount_eq_card_point` | Same module, 82 | Finite affine solution type and ellipticity; equality with native group cardinality. |
| `frobeniusTrace` | Same module, 97 | Finite field; integer-valued q+1−pointCount. |
| `frobeniusTrace_def` | Same module, 105 | Same finite-field convention using Nat.card and integer casts. |

The module roots are
[Mathlib/AlgebraicGeometry](https://github.com/leanprover-community/mathlib4/tree/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry)
and
[TauCeti/AlgebraicGeometry](https://github.com/TauCetiProject/TauCeti/tree/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry).

## Ownership, APIs and closure

The seven extraction items are exactly 28,29,30,31,34,69,77 of
PAPER-BENNETT-SIKSEK-20. Its route names the canonical owner. All 37 imported
identifiers and kinds match that packet; all eight proposed definition
names, 33 API names, 27 test names and 19 planet names match as well. Every
definition/construction has at least three discriminating tests. Each
layer has at most six planets. The internal dependency graph is acyclic,
and no imported node depends on the alias.

The API contracts cover the operations consumers need: coefficient and
equation evaluation, ring/field transport, root-ordering labels, native
point coordinates, CRT equality and unit detection, quotient triviality,
doubling, exact order and descent compatibility. The tests distinguish
singular parameters, scalar normalization, repeated labels, a nonunit root,
square versus nonsquare constants, and the printed versus corrected point.

Read the reviewed library audit entries for parent elliptic Layers 2–4,
CA.1, R01.3 and BSD.0 (AUDIT-11, AUDIT-18, AUDIT-31 and AUDIT-27).
Read current upstream EllipticCurves and ArithmeticDirichletSeries READMEs,
and ModularCurves Layers 4C/9E with their corresponding suggested sections.
The inspected current roadmap commit is
`0d144d044dacebca17b654695b6f1ad58f159b27`; current Tau Ceti is
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
Bounded searches over those source trees, including the nine newer
roadmaps, found no additional equation-level owner. The Legendre
rigidifier and parameter-line S₃ theory remain with ModularCurves.

The owner retains four gaps and three requests, with their consumers
unchanged. The current CA.1 character, R01.3 actual-conductor and BSD.0
finite-field twist statements fit the recorded refinements; none is
promoted to a pinned theorem. In particular, current EllipticCurves
Layer 4's algorithmic Ogg exponent does not discharge the actual-conductor
request. The historical unavailable-build gap concerns the owner's full
prototype; compiling the alias's examples does not close it.

## Validation and maintainer action

- `python3 scripts/check_blueprint.py research/blueprint/packets/EllipticCurvesPartII.json`:
  zero errors and warnings. Its aggregate reports six planned stages;
  the explicit records are six import-accounting `source_decomposed`
  stages, with zero closed layers and zero local nodes.
- `lean-check research/blueprint/suggested/EllipticCurvesPartII.lean`:
  exit 0, no errors or warnings, all 13 anonymous examples. Memory was
  checked first; no library build or language server was started.
- `python3 research/blueprint/intake.py check-files` on all five review
  deliverables and the handoff: six files, zero problems.
- `git diff --check`: passed.
- Exact inventory, inherited-obligation and dependency assertions passed.
- Independent finite arithmetic assertions passed: 4 root-ordering tuples,
  1,071 rational j-valuation cases, the halving criterion at 12,876 affine
  points, 2,436 corrected root triples, 160 explicit eight-element
  subgroups, exact minus-one two-primary checks at 6 primes, 616 corrected
  halving tuples, 448 symmetric trace cases and 4,160 twist-trace cases
  including square scalars. The handoff specifies the finite ranges.

These finite checks support the conventions and counterexamples; they do
not replace general proofs or native μ compatibility. The suggested file
under review develops no new theory and is consistent with the import-only
packet. The owner's full suggested file was read, not compiled or certified.

There is no unresolved question blocking acceptance. The maintainer still
needs to apply the existing merger proposal: retain
EllipticLegendreCharacterInterfaces as sole owner, map LG.0–LG.5 there,
check inbound references and queue metadata, then retire the four alias
publication files. The review does not apply that restructuring or assign
another Legendre design.
