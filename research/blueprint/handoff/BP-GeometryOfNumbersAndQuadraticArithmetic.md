# BP-GeometryOfNumbersAndQuadraticArithmetic — attained minima, sharp lower bound and boundary linear forms

Codex — codex-hjdg0j, 2026-09-27. Refs #1030. Claim comment 5853637227; winning bot confirmation 5853638131. The issue was read again after confirmation. Partial checkpoint; all seven stages remain partial and all declarations remain unchecked.

## Delivered

Twenty-two new GN.1 nodes extend the nineteen inherited nodes, whose parsed objects are unchanged. The packet now has **41 nodes: 1 definition, 29 lemmas and 11 theorems**. It has **53 API entries, 64 packet contract tests, 74 typed examples, 9 planets, 84 baseline declarations, 6 sources, 9 source issues, 8 gaps and 0 outgoing requests**. The definition itself has 13 API items and seven tests; the checker reports those definition-only API/test counts.

The new scalar invariant is the real infimum of native gauge-rank thresholds, indexed by Fin(dim E). A finite minimization outside a proper subspace supplies a greedy independent family, positive attained minima, their strict-sublevel flag, and one real basis attaining them all. It does not claim that minimum vectors form an integral basis. The API includes closed-dilate rank and first-nonzero-vector characterizations, body/lattice monotonicity, positive body scaling, and simultaneous linear-equivalence invariance. No lattice, convex-body, gauge or measure carrier is reconstructed.

The sharp lower inequality is (2^d/d!) covol(L) ≤ product(minima) volume(K). Its proof is split into weighted cross-polytope volume, containment and a determinant/index bound. Mathlib’s existing lp-ball/Gamma volume supplies the cross-polytope constant. Prescribed boxes and cross-polytopes check the indexing and sharpness, including repeated minima and dimension zero. Symmetry is explicit in the lower inequality; the attainment API works for convex compact neighborhoods of zero without symmetry, by the stated worker generalization.

The new `GN.1/minkowski-linear-forms` directly supplies the existing request from DT.0/dirichlet-approximation-from-minkowski and DT.2/linear-form-dirichlet-exponent. It retains non-strict coordinate inequalities at the determinant boundary, positive dimension, and absolute determinant. A separate region-volume lemma reduces it to the pinned compact Minkowski first theorem. The Diophantine packet is not modified. Its request for the full two-sided second theorem remains partly unmet.

## Validation

The authorized suggested file elaborated at Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 with **115 warnings, all unproved-statement warnings; zero errors and zero other warnings**. Seed SHA-256: `da689a682ff57f84c14f4545e05051f4fadeb396e5c52651a4472552b140f18e`. Import closure: 8,482 Mathlib source files byte-verified against the pin; zero Tau Ceti imports. Tau Ceti pin remains f790474821cf4256814db967cb154e7af3d0c369. No auxiliary Lean file was created: even temporary signature inspection used only the authorized suggested file, with those inspection commands removed from the submitted result.

Elaborated signatures were inspected to confirm that the discrete/full lattice and zero-interior assumptions were retained; the prescribed-body signatures retain positive and ordered weights. Compiled examples distinguish closed from strict boundaries, minima from squared minima, scaled bodies from scaled lattices, a non-integral-basis attaining family, the empty-dimensional product, and failure of the lower constant without symmetry. These are proposed contracts, not proofs.

Exact rational checks: 80 body/lattice families, 382 rank thresholds, 208 greedy selections, 964 strict-flag conditions, 7552 scaling/sign identities, 80 product-volume comparisons, 64 independent cross-polytope polygon areas, 7 boundary assertions, 4464 independently computed inverse-image box areas, and 3264 integer linear-forms witnesses at admissible thresholds. Finite checks are not general proofs.

Completed checks: `scripts/check_blueprint.py` with the pinned declaration index reports zero errors and warnings; source-issue/version checks report no problems; `research/blueprint/intake.py check-files` reports four files and zero problems. Preservation and API/test-name parity pass. The acyclic dependency graph has 55 internal and 195 total edges. A fresh-main guard confirms all 89 relevant inputs unchanged and no new AGENTS instructions. Every new prerequisite is an existing packet node or a read pinned declaration. Only the packet, reader, suggested file and this handoff change.

## Sources and corrections

Evertse’s author-hosted `dio19-2.pdf` is linked by the Fall 2023 course page. Physical pp.1–7 and 10–18 were read; the complete successive-minima/closed-boundary linear-forms/lower-bound proof passages are within that slice. The full chapter and the Hermite-basis proof are not claimed read. SHA-256 `99194d1c4a670d42219e277d5b9945d5e80ef159c3969ac1e0e467c304586063`. The source gauge, convex-body, lattice/index and volume inputs are imported from native Mathlib APIs.

Henk, arXiv math/0204158v1, was read in full, seven pages, including the complete §3 upper proof. SHA-256 `403d8f400cfd8a823260466713ef90bc7425c5be0677b986388b43da78608b60`. The publisher text was not obtained. This source is acquired and checked but its upper-volume proof is not fully decomposed in this packet. Source coverage remains partial.

E8 records Evertse Lemma 2.10’s coefficient-index typo (r vectors, not n coefficients). E9 records the floor/ceiling wording mismatch in Henk p.2; it is scoped to the preprint. Both page images were checked and bounded correction searches are recorded. Evertse’s use of “linear transformation” is **not** a third finding: p.15 explicitly defines it as invertible. E1–E7 and their previous provenance/review fields are unchanged. No independent-review verdict is added.

## Exact resumption point

The next proof chain is **Minkowski’s sharp upper bound**, using Henk §3, pp.5–7, with Definition 1.1 and (2.1)–(2.3), pp.1,3–4. Reuse the minimum invariant and witnessed strict-sublevel flag supplied here. Its main non-routine inputs must become separate declarations:

1. Extend the rational flag of spans of minimum vectors to an integral lattice basis. The existing GN.0 saturated adapted-basis node is for one cut; simultaneous adaptation of the whole flag still needs an induction with compatibility.
2. Normalize to Z^d using the linear-equivalence minimum API and the determinant/covolume formula. Use C_i=(λ_i/2)K and finite integer boxes M_q^d. First-minimum separation makes the interiors of z+C_1 disjoint; null convex boundaries turn this into exact finite-union volume.
3. For λ_i<λ_(i+1), partition translates by the last d−i coordinates. Distinct cosets have disjoint interiors because a shorter difference outside the first i-dimensional flag contradicts the supplied strict-sublevel assertion. Equal consecutive minima give the ratio inequality trivially.
4. Establish the fiber-volume comparison used in (3.4). If C is a convex fiber, c∈C and t≥1, then C⊆tC+(1−t)c. The same translation works for a finite union of translates of that fiber. Prove this pointwise inequality; do not posit a measurable choice of c. The compact sections and their volume functions are measurable, so Fubini integrates the inequality. Empty fibers and zero-dimensional fibers need explicit treatment.
5. Scale the complementary d−i coordinates by t=λ_(i+1)/λ_i, with Jacobian t^(d−i). Prove vol(M_q^d+C_(i+1))≥t^(d−i)vol(M_q^d+C_i). Telescope over i.
6. Bound the last union by a box of side 2q+γ, with γ independent of q. Divide by (2q+1)^d and pass to the limit; the result is product(λ) volume(K)≤2^d covol(L). Dimension zero is separate. This is the product bound the Couveignes consumer still needs; independent witnesses alone do not replace it.

GN.1 also needs complete source-coverage reconciliation beyond the supplied slices. Evertse’s Hermite-basis theorem, John’s ellipsoid result and related consequences have only had their statements read. In GN.4, Henk Lemma 2.1 and the strict Theorem 1.5 bound (d≥2, factor 2^(d−1), floor factors) still need decomposition; Conjecture 1.4 is not a theorem export. Existing GN.2–GN.6 gaps and the weighted number-field metric ownership remain in the packet.

All touching GN atlas links and applicable accepted RS-03/RS-07 decisions were read. RS-03 owns generic LLL in GN.5, while ED.1/ED.2 own arithmetic applications. RS-07 requires GN.4’s full bounded-semialgebraic-multiset/projection-volume estimate. Built first-theorem, number-field, rational integral lattice, field quadratic-form, quotient-measure and theta foundations retain their owners. Sources and style were checked against Completed/EffectiveBounds and Multiquadratic upstream documents. Retired Foundations stages are not imported.

## Previous checkpoint record (historical)

# BP-GeometryOfNumbersAndQuadraticArithmetic — orthogonal-covolume checkpoint

Codex — codex-a71f92, 2026-09-27. Refs #1030.

## State and preservation

Partial, not complete. Claim comment 5851605293 was confirmed by bot comment 5851606047; the whole issue was read before and after confirmation. Snapshot: 6f37c10db1e47b5578de4205e53f3116e2b092a1.

Continues merged #3128. All ten inherited node objects, IDs, statements and GN.1–GN.6 coverage are preserved. Only the named packet, reader, suggested file and this handoff are submitted. No source PDF/text, scratch proof, neighboring packet, audit, atlas or queue edit is published.

## Delivered

Nineteen unchecked nodes: thirteen lemmas and six theorems; nineteen theorem APIs, 57 packet contract tests, five planets, 49 checked baseline declarations, eight gaps and no requests. All seven stages remain partial. No new definition/construction or replacement carrier.

The nine-node GN.0 addition decomposes the fourth Couveignes route:

1. Saturated integral basis completion, reducing the nontrivial step to pinned Smith normal form and unit rescaling.
2. A projected real basis and its integral span, proving projection discreteness/fullness rather than assuming them.
3. Adapted block Gram determinant factorization.
4. Biorthogonal Gram determinant product.
5. General dual-projection/comap identity, retaining the ambient dual.
6. Full orthogonal intersection in a self-dual ambient lattice.
7. Factor-lattice covolume quotient.
8. Reciprocal intrinsic dual covolume.
9. Primitive orthogonal equal covolumes, including all zero/full-rank cases and the explicitly deduced self-dual ambient generality.

The four Couveignes consequences are now decomposed, not implemented. Number-field weighted metrics and norm-floor specializations remain consumer-owned. Completed IntegralLattices rational discriminants/gluing and built generic dual-submodule/dual-basis/double-dual APIs are not replanned.

## Reading and source issues

Read all seven current reviewed library-audit rows and accepted AUDIT-02 review before planning. Rechecked the current campaign/atlas. Confirmed that applicable RS-03/07 assignments, all four matching GN link entries, Couveignes extraction/review/errata, and already-read IntegralLattices, EffectiveBounds and GlobalNumberFields documents are unchanged from the prior reading.

Read the selected published Horesh–Karasik Appendix A.1–A.4 and B.1–B.7 with complete proofs, visually checking published pp.1290–1291. Read orientation Definitions 2.1–2.2 and the published A.5–A.6 discussion for source-version checks. Compared the specified arXiv v2 passages. The main equidistribution paper is not claimed read. Martinet, Siegel and later-stage primary proofs remain unread.

E1 retains the inherited confirmed Couveignes finding. Six source findings E2–E7 are recorded without review verdicts: projected torsion; missing determinant sign choice; preprint adjugate argument and residual published prose typo; superseded projected-column index; preprint measure-preservation gap repaired in print; arbitrary-complement orientation normalization. Each records its exact version, correction and bounded correction search. Use the published B.5 proof, not the preprint proof.

## Checks

- Packet checker against the exact declaration index: 0 errors, 0 warnings.
- Suggested file: nineteen signatures plus 54 examples, exactly 73 expected unproved-statement warnings, no errors or other warnings.
- New separate scratch Lean file: four genuinely proved general lemmas (inner nondegeneracy, dual-projection identity, standard orthonormal self-duality, real basis spanning the inner dual) and five finite examples; no placeholders, errors or warnings.
- Exact Fraction-based regressions, dimensions 0–5: 1,260 unimodular rank cuts; 1,260 general nonunimodular rank cuts; 360 integral dual-basis checks; 1,320 zero/full-rank cuts counted across the two families; 150 orientation-reversed matrices; 320 nonsaturation cases. Also fixed determinant/orientation/torsion and index-two counterexamples.
- Inherited evidence remains: six small proved Lean examples; 6,561 Gaussian-integer vector pairs, 9,009 ordered-tail cases, 368 primitive rank-one checks and 530 cube vertices.
- 8,482 imported Mathlib source files byte-checked against the pin before cache reuse; no Tau Ceti imports. Tau Ceti's algebraic DualLattice source was read, not recompiled.
- Fresh-main/input preservation guard and the four-file intake check are run before publication. Type/finite checks do not prove the general nineteen-node plan.

Pins: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174; Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

## Resume

1. Acquire/read a complete genuine Minkowski second-theorem proof. Source-decompose successive minima on the existing lattice/body carriers, API and tests, positivity, attainment, independent witnesses, both constants, and dimension-zero/body-boundary conventions. The first theorem is already built.
2. Preserve the now-decomposed primitive-orthogonal chain, particularly intrinsic ambient spaces, saturation, ambient self-duality and determinant signs. It does not assert an integral orthogonal direct sum.
3. Keep the weighted/unweighted number-field normalization and integer/field norm floors with EffectiveBoundsCompactModels.
4. Read/source-decompose GN.2–GN.6 following the unchanged ownership ledger: imported field invariants/local-global forms/rational integral lattices; new integral genera/hermitian variants; genuine mass/local-density results; the full Davenport multiset/projection-volume estimate and dynamics/geometry branches; generic verified LLL; exact-category duality and hermitian K theory. K.6 is only needed by the nonconnective branch.

Opening the PR ends this claim. Continue the ordered queue; do not unclaim a submitted job or manually merge/close/label anything.
