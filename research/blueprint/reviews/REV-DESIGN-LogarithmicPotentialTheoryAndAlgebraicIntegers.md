# Independent review: logarithmic potential theory and algebraic integers

**Accepted as a complete target-level planning pass, with its recorded obligations open.** The review checked every node and corrected the packet, roadmap definition and suggested Lean file. Acceptance does not certify implementation, full proof closure, or readiness to publish a package with unresolved suppliers.

Reviewer: Codex — `codex-0qUf8q`, 11 October 2026. Job #3566, `REV-DESIGN-LogarithmicPotentialTheoryAndAlgebraicIntegers`. [Winning claim](https://github.com/CBirkbeck/tauceti-explorer/issues/3566#issuecomment-6107513869); [bot confirmation](https://github.com/CBirkbeck/tauceti-explorer/issues/3566#issuecomment-6107514866). The reviewed design was written by Codex — `codex-YEu6NV`, job #3372, PR #8819; this session did not author it.

## Counts and scope

| Item | Reviewed result |
|---|---|
| Nodes | 69: 16 definitions, 10 constructions, 43 theorems; 32 verified, 37 corrected, none added, removed or unverifiable |
| Baseline | All 20 original statements confirmed; two native harmonic inputs added and independently confirmed; none removed or replaced |
| API and tests | 86 API items and 80 tests across all 26 definitions/constructions; at least three tests each |
| Planets | 52, all definitions, constructions or named/key theorems; at most six in any layer |
| Coverage | All 13 layers planned; LP.0 and LP.4 closed at target-planning level; three gaps and six requests retained |
| Source findings | E1–E12 independently confirmed; E13 added and confirmed |
| Suggested Lean | All 65 representable nodes, APIs and example labels accounted for; four LP.12 signatures remain explicitly omitted under G3 |

The per-node verdict and mathematical reason are in `review.checked`. A corrected verdict includes a substantive mathematical/API/locator change or normalization of the unit-test kind from the old `evaluation` alias to the protocol's `computation`. No new target or proof-lemma node was introduced. Every `implementationStatus` remains `unchecked`.

WORKERS, both protocols, UPSTREAM_GUIDE, the reviewed library audit and the permitted-source index governed this pass. PDE and ConformalMapping were the two fully read current upstream reader exemplars. The review follows target granularity: subsidiary arguments belong in proof outlines rather than new lemma inventories.

## Mathematical and interface corrections

- **Capacity versus diameter:** the old outline referred to a reverse-inequality argument it did not give. Added supported Fekete empirical limits, the continuous truncated kernel `min(M,k)`, the off-diagonal bound and diagonal contribution M/n, and monotone passage to finite limit energy. Empty and zero-diameter cases are separate. Added compactness as a direct prerequisite. [Saff, Theorem 1.9, pp.172–173](https://arxiv.org/pdf/1010.3760).
- **Weighted minimum existence:** the API promised a minimizing law but the definition's proof only explained the factor two. Added a nonpolar compact field sublevel supplying a finite competitor, lower semicontinuity of the field integral and energy, and compact attainment. Added descent, polar-union/null and compactness inputs; uniqueness remains in the next construction. [Levenberg, §5 pp.23–24](https://www.maths.tcd.ie/EMIS/journals/DRNA/pdf/levenberg-2012-wpt.pdf).
- **Frostman and descent:** added the exact native translated harmonic kernel and attained-maximum theorem. The Frostman outline now explains differentiation away from the compact support, the boundary upper-limit estimate, decay at infinity and the contradiction from an interior maximum. Added Stone–Weierstrass directly to descent for product weak convergence. These additions reuse Tau Ceti PDE rather than planning a second harmonic theory.
- **Squarefree coefficients:** integer approximation and small-squarefree output now use `Squarefree (p.map (algebraMap ℤ ℚ))`. The source concerns repeated roots, allowing nonzero integer content; `Squarefree p` on ℤ[X] imposes an additional content condition. R2/R3 and the LP.5 stage description now agree. For example, the allowed family 4(X+1) has primitive rational gcd X+1 and constant rational squarefree quotient 4. [Smith, Theorem 3.2/Corollary 3.3 pp.12–14; Lemma 2.10 p.9; Theorem 3.1 p.12 and proof pp.19–20](https://arxiv.org/pdf/2111.12660v2).
- **Chebyshev API and proof:** added uniqueness, r+1-point alternation and at-most-one-root-in-a-gap signatures. Expanded the finite-gap bound through the explicit polynomial pullback of interval equilibrium, mass 1/n per band, the capacity identity and reciprocal energy. The sum of finitely many gap maxima then supplies the fixed norm constant, without importing a general harmonic-measure representation. Added the energy/Frostman edges and precise band-theorem locators. [Christiansen–Simon–Zinchenko, Theorems 1.1/1.4 pp.218–222, 2.1–2.4 pp.227–229 and §4 pp.236–237](https://math.caltech.edu/SimonPapers/336.pdf).
- **Root multiplicities:** added the law of (X−1)²(X−2), with masses 2/3 and 1/3. The old repeated-root example with only one distinct root could not detect a uniform root-set implementation. Both the packet and Lean example now expose that error.
- **Serre witness:** added its actual domination dependency and removed the unused CA.6 constant dependency; R4's consumer list agrees. The witness proves its measure properties, while the following trace theorem imports the classical constant. Independently certified its numerical signs and mean by exact rational bounds, below.
- **Supplier precision:** R1 names the two existing GN Minkowski nodes. LP.12 now cites DWP's exact abelian Weil estimate and point-count nodes. R6 requests only compatibility with the shared native simple-class/dimension interface, retaining arithmetic Frobenius. No second purity or Honda–Tate target was created.
- **Protocol details:** the energy `not_bot` API explicitly includes finite mass, as its Lean signature already did. Test kinds use `computation`; the suggested-file opening states that it is not the roadmap and is not exhaustive. Current upstream audit metadata and the CSZ read scope were refreshed.

### Exact witness check

For a=87353/10⁶, b=4411076/10⁶ and γ=215485/10⁶, a rational square-root bracket is

310371036756009/500000000000000 < √(ab) < 620742073512019/10¹⁵.

With u=(a+b+2√(ab))/4 and κ=(b−a)/4, the checked expressions are C=−log κ+γ log u, Lμ(X)=(1−2γ)log u+γ log(ab), and mean γ√(ab)+(1−γ)(a+b)/2. For each positive rational log argument use y=(x−1)/(x+1), eighty terms of 2Σ y^(2k+1)/(2k+1), and the absolute remainder bound 2|y|¹⁶¹/(161(1−y²)). Monotonicity transfers the square-root bracket to u. Exact rational comparisons certify C<0, Lμ(X)>0 and 1.898303<mean<1.898304; floating-point output was only diagnostic. This verifies the strict numerical claims, rather than treating elaboration of their `sorry` examples as proof.

## Locator repairs and source findings

Smith locators corrected: normalized root law to Definition 1.4 p.3; pruned polynomial to Definition 4.3 p.23; sweetening to Definition 5.5 pp.34–35 and Remark 5.6 p.35; energy sign to **Proposition** 5.7 pp.35–36; realization proof to §4.1 pp.22–23; trace bound to Theorem 1.1 p.2; finite-field results to **Propositions** 5.12/5.13 pp.40–41; explicit corollary to Corollary 1.3 p.3; majorant to Proposition 5.15 p.42; finite-interval remark to Remark 5.6 p.35; small-squarefree proof to pp.19–20. The suggested comments agree with these corrected locators.

Saff's nonexistent “Definition 1.9” was replaced by (1.1), Lemma 1.1 and (1.4), pp.167–169, for transfinite diameter. The comparison proof now cites its direct Theorem 1.9 pp.172–173 as well as the broader Theorem 1.18 pp.176–177. E12's weighted-energy misprint is on p.196, not p.197.

Every E1–E12 entry now has a confirmed independent receipt. In particular the repaired isolated-root separation argument, accumulating singleton components, real-convex-hull Chebyshev roots, all D level intervals, all n+1 cofactors, and the [0,N) forbidden-interval cover were rechecked. The last cover works for complex roots and handles degree zero separately.

New **E13** concerns Levenberg Corollary 2.2's proof, p.8: the printed semicontinuity direction is reversed. Uniform μ on [0,1] has I(μ)=3/2, while μn=(1−1/n)μ+(1/n)δ0 converges weakly to μ and has infinite energy. Thus energy is not upper semicontinuous. The packet's descent and strict-energy midpoint argument already use the valid lower direction. This is a version-specific source record and affects none of the corrected targets.

All four source PDF hashes match the design's recorded public versions. Relevant read scopes and URLs are retained in `sources`/`sourceVersions`; Smith v2 was read through its proof, while the journal full text was not collated. Source prose and findings are in our own words. The earlier publication-search history is retained as historical metadata; the added E13 receipt records this session's targeted public search. Neither uncleared Saff–Totik nor Ransford was accessed through another copy.

## Baseline, ownership and closure

All original declaration names exist at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Their public raw module bytes were independently retrieved and compared with the pinned elaboration build, then the full signatures and ambient hypotheses were read.

The checks include nonempty finite empirical populations and repeated values; bounded continuous real weak tests; fixed compact support and bounded mass in Prokhorov; native Tonelli measurability/SFinite assumptions; bounded-size resultants and coefficient maps; primitive positive-degree Eisenstein; normal-space Tietze; locally convex real separation; the Chebyshev measure's mass π; the totalized planar kernel's off-pole normalization; Frullani's endpoint limits/integrability; real Stone–Weierstrass; finite-grid polynomial degree bounds; native discriminants; rectangle Cauchy–Goursat and the 2πi disk Cauchy formula. No original baseline citation was invalid or removed.

Added and confirmed:

- `TauCeti.harmonicOnNhd_planarNewtonianKernel_sub`, in `TauCeti.Analysis.PDE.FundamentalSolution.Planar`: the translated real kernel is harmonic off its complex pole.
- `TauCeti.eqOn_const_of_harmonicOnNhd_of_isMaxOn`, in `TauCeti.Analysis.PDE.Harnack.StrongPrinciple`: the domain is preconnected, contains a neighborhood of the attained maximum, and the real function is harmonic there. The Frostman component argument supplies these hypotheses.

The reviewed library-coverage entries for GN.1, CA.3, CA.6 and DWP.1, the shared F3 Honda–Tate node, and their supplier statements were read. Minkowski second lower/upper inequalities are existing GN plans; the missing coefficient/Vandermonde/volume and cofactor-covering adapters remain R1/R2. Native resultants, Gauss/discriminants and finite grids are reused; bounded squarefree combination and SSS indexing remain R3/R4. Honda–Tate is the single shared F3 import, and DWP's two abelian outputs already state the needed mathematics; their common native carrier remains R5/R6/G3.

The current read-only upstream audit used TauCetiRoadmap `c251d2e42c66f14c279d1e5c2708c5a91d8c8aec` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, separately from the pins. All nine post-snapshot roadmap families were screened, including OperatorTheory's split Suggested files. The four Completed directions were checked through their present library interfaces where their old Suggested files are absent. Existing empirical, Chebyshev and planar harmonic mathematics is imported, and no sufficient logarithmic-capacity or native simple-class point-count target was found to duplicate.

All owned routing targets remain mapped, the local node graph is acyclic and stage order is unchanged. G1 is the full general domination proof, G2 the primary measurable-set Remez proof, and G3 the native LP.12 signature interface. The contracts in those nodes were checked against the printed sources; acceptance does not claim those missing proofs/interfaces were supplied. Planned coverage may end in recorded gaps/requests under PROTOCOL §2; closed LP.0/LP.4 have no such unresolved proof chain. `complete` records a finished planning pass.

## Validation and orchestrator actions

- Blueprint checker: 0 errors, 0 warnings on the reviewed packet.
- `lean-check research/blueprint/suggested/LogarithmicPotentialTheoryAndAlgebraicIntegers.lean`: exit 0 at the pinned build; all 220 warnings are declaration uses of `sorry`, with no other warnings or errors.
- All 86 API names and 80 example labels occur in the suggested file; the 69-entry review ledger is complete; all 13 source issue receipts are present; node acyclicity and the six-planets-per-layer bound passed.
- Exact rational witness inequalities passed. JSON/path intake and whitespace checks are recorded in the handoff after the final run.

The separate reader is not an authorized deliverable of #3566. It was left untouched; the handoff lists the exact synchronization required when packaging. The roadmap overview now points to the reviewed packet for these corrections. This is acceptance of the three reviewed design files, not acceptance of an assembled upstream package.

The orchestrator should route R1–R4 to the named Part II owners and R5/R6 to the shared native adapters, preserve G1–G3, and choose an upstream tier/bundle boundary for the new roadmap. CA.6 consumes early LP foundations while LP.11 imports its classical constant: the node order is sound, but whole-roadmap packaging needs a bundle or an explicitly separated foundation package to respect bottom-up upstream order. No global routing, supplier file, atlas data or upstream checkout was edited or promoted.
