# RT-RS-20~3 — Fargues–Fontaine restructuring

Agent: Codex, session `codex-rtOQ9t`. Issue: #5112.
Read and checked 2026-09-30–2026-10-01.
Audited base: `5e3762c44fbdaf9f40e434f7f11dc809769dcdc4`.
Neither author nor reviewer of RS-20~3 or REV-RS-20~3.
Status: complete; three findings, one high and two medium.

The accepted round-three split is substantially sound. RF3's chartwise map
has domain U; the global map and tautological twists wait for VB2:ampleness.
The integral special fibre and arbitrary-base, all-E targets are conserved.
The remaining findings concern a second root-extension formula error and two
previously confirmed ownership/input gaps that remain in the accepted proposal.
The older findings are identified so that each gap is fixed once.

## Inputs and sources

Read the complete family brief, result, report, latest review and handoff, both
member README files, and all 24 inherited RelativeFarguesFontaine nodes,
15 links, 11 coverage rows and seven gaps. The final proposal has 18 layer
records (17 member stages and nonmember VB2:ampleness), 17 owners, 79 links
and 10 narrowings. Historical counts in earlier report sections are superseded
by round three and are not findings. All 24 directed family evidence records,
covering 15 unordered pairs, were read.

Read unchanged AdicSpaces Layer 6, the P1/P2 and D6 supplier contracts,
VectorBundlesAndIsocrystals' document, BG0, and all external consumer contracts
listed below. Read the RF0/RF4 partial packet requests and the accepted R06.1
period-ring node. The partial packets do not replace the integrated decomposition.

Primary source: Fargues–Scholze,
[Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf),
the author-hosted 356-page PDF, SHA-256
`9ab9efbd0df251bfa3b610d1d1d88a8dfb1bdf7c397bd04f4c277280d98ae905`.
Read printed pp.47–50, 55–56, 61, 64–68 and 190–193; the root formula on p.48
was also inspected as a rendered page. Checked the graded-piece passages
pp.194–195 and the geometric-point identification and characteristic-p
qualification pp.196–197. These locators refer to this PDF, not another edition.
This is a restructuring audit, not a new extraction of the whole book.

Also read Scholze,
[p-adic Hodge theory for rigid-analytic varieties](https://people.mpim-bonn.mpg.de/scholze/pAdicHodgeTheory.pdf),
author version dated November 3, 2012, Section 6 pp.35–36: definitions,
Lemma 6.3 and Corollary 6.4 with proofs. Access date: 2026-10-01.
The hash in its older extraction was not independently recomputed here.

At the audited commit the principal input Git blob IDs are:

| Input | Git blob |
| --- | --- |
| RS-20.result.json | `827e358a93762813e7c3d5d98b8f50937c4fff3e` |
| RS-20.md | `97b133c8c0bb32cfd6ec064b4ebfa9cdf65b2888` |
| Integrated RelativeFarguesFontaine decomposition | `ce1bc300f98ebfe64eeec12eae154049cd98b0f0` |
| Integrated PadicHodgeTheory decomposition | `91172f301b740b267affe49a4b068eb17a7dd06c` |
| RF0 partial packet | `9505e20edf7115b8285c55e477eebcd77d2e8e35` |

### Library baseline

Mathlib: `082e2d37e8b0463410cdb532e111cd43d5a66174`.
Tau Ceti: `f790474821cf4256814db967cb154e7af3d0c369`.
The audited library-coverage aggregate has no live entries for these members.
AUDIT-37 is unreviewed and only a lead; AUDIT-39 has an accepted review but
aggregate integration is pending. Relevant target claims were checked against
source declarations; this is not a new certification of every audit entry.

Read the actual Mathlib statements at the pin:

- `RingTheory/Perfectoid/BDeRham.lean`: `fontaineThetaInvertP`, `BDeRhamPlus`
  and `BDeRham`, with their ring, prime, nonunit and p-adic-completeness
  hypotheses. The definitions provide the completion/localization carriers;
  the file still lists principal-kernel/DVR work as future work. Its
  characteristic-p vanishing rules out replacing all integral relative rings.
- `RingTheory/WittVector/Complete.lean`: the p-torsion statement,
  `quotientPEquiv` and `isAdicCompleteIdealSpanP` under their characteristic-p
  and perfect-ring hypotheses. They do not establish the mixed `(pi,[varpi])`
  topology.
- `RingTheory/WittVector/Truncated.lean`: `WittVector.lift` has compatible maps
  into truncated Witt vectors as input. It is not the ramified strict-lift
  universal property.
- `AlgebraicGeometry/ProjectiveSpectrum/StructureSheaf.lean`: the existing
  `AlgebraicGeometry.Proj.toLocallyRingedSpace` construction is positive
  evidence for generic Proj reuse, not an invertibility theorem for arbitrary
  degree-one twists.

No exhaustive new absence claim is made about either pinned library.

## Conservation and ownership

F denotes FarguesFontaineDiamonds, RF denotes RelativeFarguesFontaine and VB
denotes VectorBundlesAndIsocrystals. Retaining a target preserves its planning
obligation; it does not claim formalization.

| Stage | Disposition checked against its document |
| --- | --- |
| F0 | Import fixed-field Witt Huber pair, generic Y and annulus foundations from unchanged AdicSpaces Layer 6; retain marked field-level interfaces, conventions and comparisons. |
| F1 | Keep independent generic product diamond, bounded theta/plus-ring maps and marked-untilt functor of points. Do not derive the early branch from relative bundle theory. |
| F2 | Import underlying adic Frobenius windows and quotient; retain equivariant effective diamond quotient and marked generator. |
| F3 | Import D6's general diamondification/site theorem; retain fixed-field instantiation and its actual descent cocycle. |
| F4 | Import P1's p-typical primitive correspondence; retain analytic norm, Shilov-boundary and closed-image argument. Ramified arbitrary-base assembly remains additional work. |
| F5 | Keep separately gated coefficient comparison; no dependency back into integral-Y or early quotients. |
| RF0 | Import fixed-field case; keep all-E strict-lift coefficients, functorial topology and relative assembly. Its raw coefficient prefix precedes integral-Y while its aggregate completes later. |
| RF0:integral-Y | Keep mixed-adic space, plus rings, special fibre, root-extension comparison, split-module sheafiness, gluing and integral product. Finding /1 corrects the retained formula. |
| RF0:annuli | Import fixed-field annulus case; retain relative radii, restrictions, Frobenius scaling, exhaustion and higher-acyclicity obligations. |
| RF1 | Import fixed-field quotient/site comparisons from F2/F3 and D6; retain relative quotient, product formula, base functoriality and descent. |
| RF2 | Keep divisor/period-geometry aggregate in its existing order. Finding /2 needs an explicitly later property child. |
| RF2:integral-divisors | Keep early ramified primitive presentation and single-leg closed-Cartier proof, then all-degree products, unordered ideals, collisions, v-descent, completion and punctured rings. |
| RF2:untilts | Import P1 and integral-divisors; retain generic E-linear interpretation, residue, filtration, graded lines and base-field conventions. Findings /2–/3 refine the property owner and matching arithmetic supplier. |
| RF3 | Keep rank-one O(n), pi/eigenvalue sign and API, graded algebra, Proj carrier, chart maps and gluing over U. Full-rank/rational-slope functor goes to VB1; global map and tautological twists go to VB2:ampleness. |
| RF4 | Keep linear/torsor patching aggregate, with the linear stage preceding the G-torsor stage. |
| RF4:vector-bundles | Keep module gluing, meromorphic modification and their hypotheses. The linear argument is not replaced by torsor formalism. |
| RF4:G-torsors | Import BG0's generic equivalence of torsor descriptions; retain relative application, v-descent and local triviality. |
| VB2:ampleness (nonmember) | Own global morphism and twist/pullback conclusions after positive generation. Classification is not used as an early supplier. |

All 17 owner records were checked. In particular, p-typical correspondence and
ramified presentation, generic torsor equivalence and relative descent, and
fixed-field analytic estimates and all-base closed-Cartier assembly remain
distinct responsibilities.

### All inherited node payloads

These groups account for all 24 nodes. Existing IDs remain references when
only part of a statement moves.

| Group | Count | Checked placement |
| --- | ---: | --- |
| RF0 ramified-Witt universal property | 1 | Prefix at the start of integral-Y; RF0 remains an aggregate reference. |
| integral-Y definition, charts/sheafiness, functor of points, gluing | 4 | Retain all; correct both root formulas, not only the reciprocal. |
| annuli/radius and Stein exhaustion | 2 | Retain relative topology, restrictions and cohomology. |
| RF1 quotient and product diamond | 2 | Retain relative statements and import fixed-field/site comparisons. |
| integral-divisors moduli, product, degree criterion, descent, completed rings | 5 | Retain all-degree/integral scope and recorded unread-import gaps. |
| untilts primitive correspondence | 1 | Early ramified presentation at integral-divisors; generic marked-untilt comparison stays at untilts with P1 import. |
| untilts closed-Cartier norm estimate | 1 | All-E single-leg proof moves to integral-divisors before its product construction; F4 supplies its limited analytic input. |
| untilts Div1 and de Rham comparison | 2 | Separate late properties and name the matching R06.1 supplier as findings /2–/3 require. |
| RF3 sign/rank-one and graded algebra/map | 2 | Split rank-one/full-rank and U/global payloads without deleting targets. |
| RF4 linear gluing and modification | 2 | Retain linear hypotheses and proof steps. |
| RF4 torsor descriptions and descent | 2 | Import generic equivalence from BG0; keep relative descent. |

The two backwards inherited placements are the ramified-Witt node into
integral-Y's definition and the closed-Cartier node into the integral-divisor
product. Accepted relocation fixes both. The primitive correspondence also
needs its early presentation split, as round three now specifies; moving only
the closed-Cartier proof would leave a hidden early/late dependency. All 15
links pass after these proof-fragment placements. This does not claim the
unchanged base node texts have already been rewritten.

The old gap that F4 does not supply all-E assembly is addressed by the new
integral-divisors owner. Other inherited source/import gaps remain explicit;
this restructuring is not represented as proving them.

## Findings

### /1 — high: take roots of the whole quotient

RS-20 repairs `t_1^sharp = [varpi]/pi` to `pi/[varpi]` but retains a third
proof step adjoining `b_m = pi^(1/p^m)/[varpi]`. The source's displayed tower
at II.1.1, p.48, adjoins
`a_m = (pi/[varpi])^(1/p^m) = pi^(1/p^m)/[varpi]^(1/p^m)`.

Here is an independent check. On a rank-one boundary valuation of the n=1
chart, write `|pi| = |[varpi]| = c`, with `0 < c < 1`. Then

- `|a_m| = 1`;
- `|b_m| = c^(1/p^m - 1) > 1` for `m > 0`;
- `a_(m+1)^p = a_m`, whereas `b_(m+1)^p = b_m/[varpi]^(p-1)`.

For p=2, m=1 and c=1/4, the wrong generator has norm 2. It cannot lie in the
asserted integral subring of A-plus. The inherited reduction relation itself
puts a root on `[varpi]`, so it also disagrees with the preceding ring definition.
This changes the integral object, which is why severity is high.

Extend the reconciliation instruction, then the authorized RF0 blueprint,
reader and suggested signatures, to adjoin compatible roots of the quotient
before completing. Check coherence, boundary boundedness and the reduction
relation separately. Preserve the pi=0 fibre and split-module sheafiness.
The malformed tower remains in both the integrated decomposition and partial
RF0 packet/reader. This is separate from the reciprocal correction already
recorded in RS-20 and is not an allegation of a published-source error.

### /2 — medium: Div1 properties still lack routed inputs

RF2:untilts retains properness/smoothness, and its node ledger says late
properties need inputs. Neither an actual supplier route nor a precise later
owner is supplied. C4 and S5 are absent from its ancestor set.

The proof of II.1.21 on p.56 uses ECD 18.3 and 24.5. Checked owners are
DiamondEtaleCohomology:C4 and DiamondSixOperations:S5. The RF0 partial packet's
S4 request supplies a formalism, not the missing example in S5.

This is the confirmed [RT-AREA-padic-1/17](RT-AREA-padic-1.review.json) gap.
Its [fix proposal](RT-AREA-padic-1.fixes.md) gives a suitable later stage,
`RF2:div1-properness`. Incorporate that split into RS-20's keeps/owners/links
and the authorized blueprint. Its inputs are RF2:untilts, C4 and S5, retaining
the finite-extension/equal-characteristic argument. Add `RF2 ->
RF2:div1-properness`: without this parent-to-child edge, the graph builder can
infer the opposite aggregate dependency.

Forward the theorem to HS0 and VS1; HS1 is already downstream. The checked
GS0:loop-geometry contract needs leg/divisor construction, not this property,
so no extra input is inferred there. Do not place the whole RF2, RF3, RF4,
VB1 or BG0 behind the six-operation formalism. Move the proof rather than
delete its conclusions. Coordinate with /17 to fix this once.

### /3 — medium: import the matching affinoid period-ring plan

RS-20 correctly separates integral-divisor completion from its generic
interpretation and names Mathlib's carriers. It omits R06.1 from suppliedBy,
owners and links even for the matching p-typical mixed-characteristic case.

The accepted node `PadicHodgeTheory:R06.1/bdr-plus-of-perfectoid-affinoid-algebras`
already handles characteristic-zero perfectoid K and perfectoid affinoid
(K,K-plus)-algebras. Its construction/filtration statement matches Scholze's
Section 6, pp.35–36. An older repair beginning by generalizing a C_p-only
statement therefore no longer describes this supplier accurately.

Add an explicit R06.1-to-RF2:untilts comparison/import. Identify completion,
residue map and generator before transferring the filtration results. Keep
all-E coefficient change, arbitrary-base descent, integral/equal-characteristic
specializations and geometric DVR assertions wherever no supplier has proved
them. Do not replace general graded lines by global trivializations.

This is the scoped overlap confirmed by
[RT-AREA-padic-1/20](RT-AREA-padic-1.review.json) and
[RT-AREA-padic-2/21](RT-AREA-padic-2.review.json). The latter rejects blanket
replacement by Mathlib/R06.1, and this finding preserves that qualification.
The characteristic-p Witt specialization and Mathlib's zero carrier are not
interchangeable. No second all-E period-ring construction is being requested.

## Graph checks and rejected counterexamples

A fresh assembly at the audited base has 2907 stage/node records and 8322
distinct directed edges; it is acyclic and includes every one of the 79 RS-20
links. The browser extract at that commit has only 3458 edges and was not used
as a substitute for assembly.

Checked all 28 external parent-stage exports to these 12 distinct stages:

- AInfCohomology:AI.2;
- BunGAndNewtonStrata:BG0 and BG2:uniformization;
- GeometricSatakeAndFusion:GS0:Witt-geometry, GS0:loop-geometry, GS3:fusion;
- HeckeStacksAndLocalShtukas:HS0 and HS2;
- VStackSheavesAndLisseCategories:VS1;
- VectorBundlesAndIsocrystals:VB0, VB1 and VB2:ampleness.

For each narrowing/supplier and consumer, tested reachability with the narrowed
stage excluded from traversal. There are 60 tests and 57 surviving routes.
The three exceptions were checked against actual consumer contracts:

| Missing bypass | Assessment |
| --- | --- |
| F3 to RF2:integral-divisors when RF1 is removed | This consumer needs RF1's retained relative quotient/divisor geometry, not the removed fixed-field site theorem. No forwarding gap. |
| VB2:ampleness to BG0 when RF3 is removed | BG0 uses early objects, not the global Proj comparison. No additional link needed. |
| VB2:ampleness to VB1 when RF3 is removed | VB1 does not need the global map; the reverse link would make a cycle. |

The Proj correction passes: the chart maps glue over U, and positive generation
precedes the global map. Quasicompactness does not invent a missing cover.

The following paths are absent: F5 to integral-Y; untilts to integral-divisors;
RF0 aggregate to integral-Y; RF4:G-torsors to BG0; VB2:ampleness to RF3.
C4/S5 and R06.1 also do not currently reach RF2:untilts.

The union of the following proposed repairs is acyclic:

```text
R06.1 -> RF2:untilts
RF2:untilts -> RF2:div1-properness
RF2 -> RF2:div1-properness
C4 -> RF2:div1-properness
S5 -> RF2:div1-properness
RF2:div1-properness -> HS0
RF2:div1-properness -> VS1
```

S5 still does not reach RF2, RF3, RF4:vector-bundles, VB1 or BG0. The named
property child is proposed, not already present in the atlas.

To reproduce, check out the audited base, add `scripts` to Python's import
path, import `assemble` from `build`, and call
`assemble(require_distances=False)[0]`. Deduplicate `(source,target)` pairs
in `stageEdges`; use Kahn's algorithm for acyclicity and breadth-first search
for reachability. Include decomposition nodes in the record set. For node
order, map the 24 nodes to parent stages, then place the raw Witt prefix at
integral-Y and the closed-Cartier and early primitive prefixes at
integral-divisors. Check reverse reachability for all 15 inherited links.
An aggregate reference is not permission to invert proof order.

## Validation and limits

The graph reproduction assertions, `scripts/check_redteam.py`, intake
`check-files` for both deliverables, and staged `git diff --check` pass.
The boundary norm check gives 2 for the wrong generator in the example above.
Only the two issue deliverables change. There are no upstreamNotes; Tau Ceti
roadmaps and links between them are unchanged.

No Lean file is required or compiled. No library build, cache download or
language server was run. The recorded source/import gaps are not asserted
closed, and this audit does not certify every external proof cited by the
inherited decomposition.
