# RT-PAPER-DADDEZIO-23

Complete red-team audit of the accepted extraction, with four findings: one high
and three medium. This does not reject the paper's main theorems. It identifies
one incorrectly typed comparison and three gaps in the proposed construction
and reuse contracts.

Worker: Codex, session `codex-rtOQ9t`, 1 October 2026. Issue #5056. Base:
`8d16ed9a21ed17b887df38ba654bc1c4581ab8b4`. The extraction was written by
Claude Code `cc-fb70e5`; its review was by Claude Code `cc-58621d`. This session
did neither. Claim comment 5926671939 was confirmed by bot comment 5926674840.

## Scope and sources

Read the complete accepted result, reader, review result, review report and
author handoff. Re-read all 30 pages of
[D'Addezio, arXiv:2012.12879v4](https://arxiv.org/pdf/2012.12879v4), including
proofs, footnotes and bibliography. SHA-256:
`f92379bec97564edc2b89f86f6bfc5c271abdc31c5d17cb9ba93b58e204a07a8`.
Visually checked pages 6, 7, 10 and 19 for the formulas used below.
All source access in this audit was on 1 October 2026.

The accepted extraction explicitly covers this preprint, not a collation with
the published Annals text. I preserve that limit. The
[Annals record](https://annals.math.princeton.edu/2023/198-2/p03),
[arXiv record](https://arxiv.org/abs/2012.12879) and
[author's publications page](https://daddezio.pages.math.cnrs.fr/papers.html)
did not identify an erratum correcting the formulas below. This is not proof
that no correction exists. The MPG repository page returned HTTP 403; the
published 38-page article was not read.

For the two cross-paper checks, read
[Abe, arXiv:1310.0528v3](https://arxiv.org/pdf/1310.0528v3), §§2.4.15–2.4.20,
pp. 86–88, and §§4.2.1–4.2.3, pp. 103–104. Read the accepted Abe item 25,
its two complete route briefs and its acceptance record; also the Xu–Zhu
Bessel route and its acceptance, and the Tsuzuki minimal-slope route and
relevant twisting entries. Tsuzuki's three routes have individual accept
verdicts, but its current overall review says `revise`; this audit does not
promote that extraction to a completed theorem implementation.

Checked the apparent de Jong citation mismatch against his own
[ICM account, Barsotti–Tate groups and crystals](https://ems.press/content/book-chapter-files/27155),
§3, Theorem 4, citing his 1998 Theorem 2.6. It supplies the Tate Hom theorem
used by item 17. That suspicion was rejected.

## 1. Arbitrary central characters need a twisting adapter — medium

**Where:** item 19 and route 4 of `PAPER-DADDEZIO-23.result.json`, with route
6's application item 68 as consumer.

Route 4 says it imports Abe's theorem **“exactly as that brief states it”**
and **“adds no target”**. Yet its stated input permits every cuspidal
representation. The accepted `PAPER-ABE-18` item 32 and route 2 restrict the
central character to finite order. This agrees with the definition of
`A_r` in Abe Theorem 4.2.2, p. 103: **“the order of the central character of π
is finite.”** The generality promised by the consumer therefore does not
match the imported theorem's signature.

This is an adapter gap, not a claim that the unrestricted correspondence is
false. A rank-one unramified character `a ↦ c^deg(a)` with `c` of infinite
order is already outside the literal imported set. It provides a concrete
acceptance case for the missing step.

**Repair:** keep the finite-order theorem and the general D'Addezio
application. Add a located, proved reduction to route 4's existing owner,
`GlobalShtukasPartIICrystallineCompanions`: use the degree quotient of the
idele class group and an appropriate root of the central character's degree
value to twist into the finite-order case. Apply Abe, then untwist by the
corresponding constant rank-one coefficient. Prove the Frobenius/Hecke
normalization and the induced slope shift. Reuse function-field class field
theory and the parent coefficient category. Do not create a second
Langlands owner or silently narrow item 68.

The search for an existing adapter included the accepted Abe brief, the
global-shtukas packet and structured paper/packet/key-definition/restructuring
entries discussing function-field central characters. The existing Tsuzuki
determinant-normalization entries concern isocrystals and purity; they do not
by themselves supply the automorphic central-character reduction and its
compatibility with this correspondence.

## 2. The bundled planned item hides the F-infinity construction — medium

**Where:** item 1, its sole owner `PadicDifferentialEquationsAndRigidCohomology:RD.3`,
and routes 1 and 6.

Item 1 combines the parent coefficient categories with a crystalline
description/comparison and the `F^∞` category. It marks the entire bundle
`planned`. Its own note concedes that the crystalline comparison is not
named in RD.3 and that the 2-colimit is **“this paper's construction”**.
No route contains item 1. RD.3's full contract defines frames, coherent
connections/descent, Frobenius structures and restriction; it supplies no
divisibility-indexed transition system or `F^∞` tensor category.

Route 6 starts using this missing carrier in its punctual structures,
`Λ_η` and exact sequences. Mentioning these consumers does not identify
which layer proves their common carrier's well-definedness. The accounting
is exact: all 63 `missing` items occur once in the six routes; the seven
`planned` items, including this mixed bundle, occur in none.

**Repair:** split covered foundations from additional obligations. Keep the
parent's coefficient-category construction at RD.3; route the crystalline
comparison there with its CR.3 input. Put the `F^∞` construction in an early
route-6 layer, before `Λ_η`. Specify positive integers ordered by divisibility,
the transition `n → nm`, coherence of iterated Frobenius, morphisms modulo
eventual transition, and exact symmetric tensor structure and scalar
conventions. Export it to every later monodromy construction.

There is a useful source-level guard: the displayed recursion on v4 p. 6
uses `F*` after starting with an `(F^n)*`-linearization. For `n > 1`, its
second iterate cannot compose as typed: the intermediate objects are
`F*M` and `(F^n)*M`. Use `(F^n)*` in that recursion (or the equivalent
explicit `nm`-iterate formula). Record this localized misprint if carrying
it into `sourceIssues`. Check `n=2, m=2` and a composite transition
`n → nm → nml`; do not copy a formula that only types for `n=1`.

## 3. The monodromy equalities use the wrong base field — high

**Where:** items 33, 35, 42 and 50, and route 6's layer (2) comparison.

Item 33 defines the group from the fibre functor at an `Ω`-valued point.
Its value field is `K(Ω)`. Item 35's lattice becomes that fibre after
extension to `K(Ω)`. Nevertheless item 42 identifies the group with a
group extended only to `K`, and item 50 intersects it with a group over
`K`. In the conventions being imported, `K = K(k)`, not `K(Ω)`.
The two different fields are explicit in v4 §2.2, p. 6, and §3.1, p. 7;
the problematic formulas are in Proposition 3.3.2, p. 10, and Corollary
4.3.6, p. 19. Page images confirm that this is not text-extraction damage.

Here is a direct type/counterexample check. Take `k = F_p^alg`,
`Ω = algebraic_closure(k(t))`, `X = Spec k` and the unit coefficient.
The tensor automorphism group for the stated fibre functor is the trivial
group scheme **over `K(Ω)`**, hence `Spec K(Ω)`. Extending the trivial
`Q_p^ur` group only to `K(k)` yields `Spec K(k)`. They are not isomorphic
as `K(k)`-schemes: a `K(k)`-algebra isomorphism from `K(k)` onto the proper
extension `K(Ω)` cannot be surjective. More generally, the intersection in
item 50 requires both subgroups inside the same `GL(ω_η M)`.

**Repair:** retain `K(k)` for the *category* scalar-extension equivalence.
For the group attached to the specified fibre functor, extend the
`Q_p^ur` group to `K(Ω)` and state the compatibility of fibre functors.
Use that same field for every factor and the ambient general linear group
in item 50. Alternatively explicitly name the descended `K(k)`-form and
then its base change, rather than identifying the two. Propagate the choice
through route 6's exact-square/intersection API and test a point with
`Ω ≠ k`, as well as a rational point. Record a source issue scoped to v4;
existing E2 corrects the dual construction's field but does not repair
these later formulas. The categorical equivalence itself is not the
finding, and the repair does not change the parabolicity conclusion.

## 4. Reconcile the basic Crew construction with Abe's existing route — medium

**Where:** item 33 and route 6, against accepted `PAPER-ABE-18/25`, route 1.

Route 6 justifies a fresh basic construction by saying **“No layer or
proposal plans Crew's monodromy groups”**. Abe item 25 explicitly plans
the isocrystal fundamental group, reconstruction and the Weil-group
extension, and calls them **“Crew's monodromy groups in the Weil-group
form Lafforgue uses”**. Its accepted owner is
`PadicDifferentialEquationsPartIIArithmeticDModules`. Abe §2.4.17 builds
the tensor automorphism group of the overconvergent fibre category;
restriction to the tensor subcategory generated by one object gives
the object monodromy quotient. The two routes do not name a common
construction or a comparison on this overlap.

The overlap is deliberately limited: Abe's algebraically extended
coefficient category and D'Addezio's `K(Ω)`-valued fibre functor must be
compared over a common coefficient field. Their groups are not literally
the same typed object. Abe does not supply all convergent objects,
arbitrary perfect-point descent, punctual `Q_p^ur` structures or the
parabolicity theorem. None of those should be deleted as duplicate.

**Repair:** in route 6, identify an early shared Crew construction,
coordinated with the already accepted arithmetic-D-module route. Import
the existing construction on its scope; prove the coefficient/fibre
comparison and object-generated quotient adapter. Retain the genuinely
additional scopes in route 6. Update its claim of no prior owner and the
Bessel consumer instruction accordingly. MC.6 continues to own generic
Tannakian reconstruction; a second general reconstruction is unnecessary.

Do not solve this by making the whole arithmetic-D-module roadmap depend
on the whole monodromy roadmap. Arithmetic D-modules feed Abe's
correspondence, which feeds D'Addezio's final applications. The common
construction must precede these endpoints. A shared prefix followed by
the separate extensions has an acyclic proof order.

## Coverage, counterevidence and checks

Every one of the 70 items, six routes, 17 prerequisite records and 14
existing source-issue records was compared with its role in the full
paper. The removed item 38 remains removed; item 71 remains present.
The existing E5 analytic-norm gap and E13 prime-order restriction are
already recorded and are not presented as new findings. Reading their
surrounding proofs did not justify discarding the independent curve
route or the paper's final theorems.

Read current assembled contracts for RD.0–RD.7, MC.6, VB0, CR.3,
R07.2, R34.2, FA.5 and A6. Read the reviewed coverage records available
for the queried owners; R34.2 and FA.5 have entries, whereas the queried
RD, VB, MC and finite-flat prefixes do not. An absent coverage entry is
not evidence that the whole pinned library lacks the mathematics.

At Mathlib commit `082e2d37e8b0463410cdb532e111cd43d5a66174`, read
`Mathlib/RingTheory/WittVector/Isocrystal.lean`: `WittVector.Isocrystal`
is a bijective Frobenius-semilinear operator, and
`WittVector.isocrystal_classification` assumes rank one. Item 3 correctly
distinguishes this from the full Dieudonné–Manin theorem.

At Tau Ceti commit `f790474821cf4256814db967cb154e7af3d0c369`, searched
the tracked Lean files for isocrystals/Tannakian constructions and read
`TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/Equivalence.lean`
(including `fgPointTensorIsoEquiv`) and the scope of
`TauCeti/CategoryTheory/Action/Tannaka.lean`. The former reconstructs an
already given commutative Hopf algebra from finite comodules; the latter
concerns group actions on sets. Neither is, by itself, the isocrystal
category, the `F^∞` transition construction or an identification between
the two proposed coefficient realizations. This audit makes no blanket
claim that generic Tannakian tools are absent.

The fresh assembled atlas at the stated base has 2,907 stages and 8,322
distinct stage edges; including external edge endpoints gives 2,958
vertices. It is acyclic. The previous review's requested edges
`CR.3 → RD.3`, `CR.3 → R07.2`, and `VB0 → RD.3` are not live edges;
adding all three remains acyclic. Their absence is already expressly
recorded by that review and is not a new finding. The candidate Part II
ids are still route briefs rather than live stage owners, so their proof
order was checked separately, not misrepresented as existing atlas edges.

Checks run:

- Full item/route accounting: 7 planned, 63 missing, 63 unique routed items.
- Kahn topological checks of the live graph and all three review additions.
- Shared-prefix proof-order check; the forbidden wholesale reverse import
  produces the anticipated cycle through arithmetic D-modules, Abe and
  D'Addezio's applications.
- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-PAPER-DADDEZIO-23.result.json`.
- `python3 research/blueprint/intake.py check-files` on the two deliverables.
- Staged `git diff --cached --check`.

No Lean file is delivered by this job and no Lean compilation was run.
No source theorem or roadmap plan is claimed to be formalised. The
four proposed fixes await independent verification. Unread external
supporting proofs and the uncollated published text remain limits of
this audit, rather than invented findings.
