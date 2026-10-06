# BP-Polylogarithms--P.2 handoff

Issue: #6387. Worker: Codex, session `codex-1MIcru`.
Branch: `codex-1MIcru-polylogarithms-p2`. Completed planning pass,
2026-10-06. The packet is **complete**, and its only stage,
`Polylogarithms:P.2`, is **planned**, with two recorded gaps. It is not closed
and makes no implementation claim. This is a completed target-level follow-up,
not a time-limited checkpoint.

## Deliverables and counts

The part packet, reader document and suggested file are
`research/blueprint/packets/Polylogarithms--P.2.json`,
`research/blueprint/readmes/Polylogarithms--P.2.md`, and
`research/blueprint/suggested/Polylogarithms--P.2.lean`.
The parent packet is unchanged. Its eight P.2 target IDs are referenced in
`coverage.inheritedNodes`, rather than copied or renamed.

The part adds 14 nodes: 2 definitions, 2 constructions, 7 theorems, 1 lemma,
and 2 comparisons. Its four definitions/constructions have 24 API items and
17 unit tests. There are 12 pinned baseline declarations, 3 supplier requests,
3 restructuring proposals, and 2 source issues. The two new planets,
Lobachevsky function and Kummer's formula, join the four inherited planets;
the combined P.2 count is six. Coverage: one planned stage, no closed stages.
All new nodes retain `implementationStatus: unchecked`.

## What this pass establishes in the plan

- Milnor's normalized Lobachevsky function, its integral API, Fourier formula
  and duplication identity, including the singular angles and the half-period
  and Catalan tests.
- The whole-unit-circle Fourier series for D, with the uniform tail bound
  1/N for N at least one; Kummer's three-unit-shape reduction for every complex
  z other than 0 and 1.
- An explicit computable rational-pair construction, rational power sums, and
  A(z,p) = one half the sum of three Fourier sums with N = 3 times 2^p.
  The error is at most 1/(2 times 2^p), hence at most 2^(-p).
  Strict positivity, negativity, nonvanishing, and weighted finite-combination
  radii follow. A(i,0)=8/9 and A(i,1)=209/225. This resolves the inherited
  numerical obstruction at the unit circle without needing a fast
  Li_2 expansion. The algorithm has exponentially many terms in p.
- Milnor's complete volume proof route, from the curvature -1 density h^(-3)
  through the sector integral Lambda(a)/2 and signed sector decomposition.
  Ordered volume uses r(infinity,0,1,z)=z, with upper-half-plane shapes positive.
  Relative to V.4's cr(0,infinity,1,z)=z this is -D(cr), not D(cr).
- A corrected elementary-matrix calibration of Goncharov's printed trace
  convention. This is a cochain computation, not a replacement theorem-level
  regulator scalar.

These are mathematical contracts and proof plans. Lean elaboration below
checks their signatures; it does not establish their analytic proofs.

## The two remaining gaps and where to resume

**Exact Burgos/Suslin scalar.** Goncharov's published equations (66)–(67)
define C2 = (1/2) Alt_3 Tr and E2 = e12 wedge e21 wedge e22, with unnormalized
alternation. On those ordered matrices the even-permutation traces are zero
and the odd-permutation traces are one. Thus Alt_3 Tr = -3 and C2(E2) = -3/2,
where the published proof on p.39 prints one. The independently owned R.4
polynomial Phi3 = -(1/6) Alt_3 Tr gives +1/2. Source issue Polylogarithms/E22
records the contradiction to the printed conventions; reversing the first two
matrices gives +3/2 and still fails the printed value. Do not infer a corrected
class coefficient from this finite calculation alone.

Resume at the published section 5.4 geodesic-simplex map beta_DR and sections
5.5–5.6: recompute its weight-two coefficient, identify it with the early AF.1a
van Est maps, and include the measurable-to-continuous comparison of the
D(cross-ratio) cocycle. Fix the R(1) generator 2 pi i and real-coordinate
division, the cross-ratio sign, and V.4's natural Suslin/Hurewicz maps after
rationalization. Theorem 5.7's printed 1/12 and Corollary 5.10's 1/24 are
unaudited for this endpoint. Export the resulting map-level scalar from P.2
into R.7's weight-two consumer. Do not use that R.7 endpoint as a premise.

**Canonical ideal-region interface.** Existing GeometricTopology layers 7–8
own the hyperbolic metric, volume and model framework. They do not state the
early ideal-boundary/region interface needed here. The proposed
GeometricTopology, Part II: Ideal boundary and finite-volume geodesic regions
must supply the boundary identification with CP^1 and PGL_2(C) compatibility,
measurable geodesic hulls, ordered orientation, finite-region volume,
upper-half-space density/change-of-model compatibility, almost-everywhere
signed sector decompositions, and exhaustion/integration compatibility.
Then instantiate the stated Milnor and inherited D-volume theorems on that
canonical carrier. The suggested file names the unavailable geometric theorem
in a comment and states its analytic sector calculation; it does not substitute
an arbitrary carrier with an assumed volume.

Source issue Polylogarithms/E23 records Appendix 7.2's undeveloped conversion
to c3 = -1/(6 pi), including the missing boundary measure-ratio/orientation
calibration from 7.1. It is a proof gap, not an assertion that the volume
identity is false. Milnor's independent density calculation supplies the
volume theorem's route in this pass.

## Suppliers and confirmed red-team findings

The three requests import GeometricTopology layer 7's metric/volume, layer 8's
hyperbolic model, and AF.1a's degree-three continuous/differentiable/van Est
comparison. The measurable-cocycle comparison is explicitly requested as an
extension of AF.1a's stated scope. The generic ideal-region extension is recorded
as the second gap and a Part II proposal; upstream work is not replanned.

- **RT-AREA-ktheory-2/23:** P.2 is the analytic real-regulator comparison owner.
  The current reviewed V.6 packet already treats regulator agreement as
  transport, but still names R.7 as an exact-scalar supplier. The proposal
  removes the duplicate analytic endpoint from V.6's scope, retaining only
  algebraic comparisons and transport of P.2's statement. P.2 uses V.4's natural
  maps, so this pass adds no whole-V.6 prerequisite. P.2 supplies R.7 and V.6's
  transport; no reverse R.7-to-P.2 edge is proposed. The p-adic half belongs to
  D.2 and is not replanned here.
- **RT-AREA-ktheory-2/25** and **RT-AREA-topology/7:** P.2 alone owns ideal
  tetrahedron volume = D with its orientation convention, importing the native
  GeometricTopology metric and measure. Add P.2 to QT.5's prerequisites.
  QT.5 retains geometric triangulations, gluing/completeness, flattenings,
  manifold volume sums and Bloch invariants, and the Chern–Simons comparison.

No other packet, campaign document, atlas data or upstream document was edited.
All 28 link-packet entries mentioning Polylogarithms were negative examined
screens; no positive link supplied an additional declaration. Existing atlas
stage edges were checked separately, including the P.2-to-R.7 direction.

## Verification

- `python3 scripts/check_blueprint.py research/blueprint/packets/Polylogarithms--P.2.json`
  passes. The same check against the pinned declaration index also reports
  **zero errors and zero warnings**.
- `lean-check research/blueprint/suggested/Polylogarithms--P.2.lean` elaborated
  successfully against Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174.
  Its only warnings are declarations using proof placeholders. The file imports
  individual Mathlib modules and no Tau Ceti modules; the library search used
  Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. No private Lake project or
  library build was created.
- A transitive audit from the 14 new nodes visited 34 known nodes and 47 baseline
  or requested-stage leaves. It found no cycle, unresolved node-shaped ID, or
  R.7 prerequisite. All 24 API names and 17 named tests occur in the suggested
  file; the geometric signature omission is explicit.
- Independent exact rational arithmetic checked the test values, conjugation,
  unit norms and all six matrix products. A direct Lean evaluation of the
  rational matrix expression also returned traces 0,0,0,1,1,1 and calibrated
  values -3,-3/2,1/2, without proof placeholders. A separate 80-digit evaluation of D
  checked 32 approximation bounds at real, upper/lower-half-plane, near-zero
  and near-one inputs. The largest observed error/bound ratio was approximately
  0.282047. These numerical checks support the formulas; they are not analytic
  proofs of the universal bound.

The source versions, public URLs, reading dates and SHA-256 hashes are in the
packet. Milnor's Appendix pp.17–20, Zagier I.3–I.4, and Goncharov's published
sections 5.1–5.6 and Appendix 7 were read; the normalization passage was also
collated with arXiv v3. The published p.39 was visually checked. Targeted
publisher/title erratum searches, the arXiv revision history and the author's
site yielded no correction of the recorded passages. No source required by
this new analytic/numerical proof route was inaccessible. The missing work is
the two mathematical interfaces above, not an unread replacement for Milnor's
proof. The GeometricTopology and AlgebraicTopology upstream documents were
both read in full for scope and style. Scratch files need not be retained:
all information needed to resume is in these four deliverables.
