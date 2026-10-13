# BP-LocallyAnalyticDistributions--L1 handoff

Issue #9291; Codex session codex-oIMBvc; 13 October 2026. The winning claim was comment 6146527618, confirmed by bot comment 6146530699. Work is on branch `codex-oIMBvc-l1-amice`. This run handled one issue.

The planning pass is **complete** and its sole scoped stage, `LocallyAnalyticDistributions:L1`, is **planned**, not closed. Implementation status remains unchecked throughout. The part adds 19 nodes: one definition, five constructions, four comparisons and nine theorems, with 27 API items, 24 discriminating definition/construction tests, five new planets and 15 pinned baseline declarations. The parent’s 25 L1 nodes are imports; their ids and files are unchanged. Its existing Amice planet and these five make six for the combined layer.

## What is covered

Every stage target has an explicit target-coverage map. The new inputs cover the native-series R+ Frechet carrier and quantitative inverse Mahler pairing, topology of the bounded inclusion, convergent affine substitution with nonzero constant, finite coefficient extension/descent, derivative and dilation Gauss estimates, Hasse-stage and convolution bounds, multiplier/restriction/phi/psi continuity, the analytic unit reciprocal, coordinate division and its Dirac ambiguity, radius-loss ball primitives, the topology of the locally constant kernel, the bounded total set obstruction, strict dual logarithm quotient, torsion logarithm domains, local cancellation and independence of negative moments from primitive choices.

The source and support distinctions that review should preserve are:

- The distribution derivative is the positive transpose, so its transform is multiplication by log(1+T). Coordinate multiplication is instead the supplier’s Mahler derivation (1+T)D_T.
- Fixed-stage primitives exist after shrinking radius. Their stage maps are not declared compatible and do not define continuous global primitivation on LA.
- Unit division uses the reciprocal extended by zero on **all** nonunits. Negative moments have the broader admissible condition that their ball avoids zero, illustrated by 2+4Z_2 and moment 1/2.
- Character and torsion substitutions are convergent Gauss-algebra sums, not formal substitutions with an unsupported nonzero inner constant.
- The local criterion F(torsion point)=0 removes a simple logarithm pole locally. Global removal is asserted for the actual numerator A(dμ)=log(1+T)Aμ, not for an unproved arbitrary all-torsion-zero divisor theorem.
- The nonsplitting proof uses finite K and ordinary Z_p Mahler polynomials. It does not depend on the general-group completed scalar-extension step in Kohlhaase’s proof.

## Exact remaining input and ownership

There are two explicit gaps and one request to `LocallyAnalyticDistributions:L0`:

1. Supply the native nonarchimedean compact-type/LF interface and the closed-kernel comparison giving the induced topology on LC=ker d_x as strict ind_h LC_h, where LC_h consists of functions constant modulo p^h. It must include bounded-set confinement to a finite level, strictness/open mapping for the surjective differentiation map, strict strong-dual exactness and reflexive transfer of splittings. The parent compact-type duality statement alone does not prove that kernel-limit comparison. This is the precise input for the LC topology, bounded total obstruction and dual logarithm quotient nodes.
2. The global analytic carriers and their topologies are absent at the pins. Their API signatures and 24 tests are fully stated in the reader; they become Lean declarations after L0 supplies those carriers. The compact prototype does not simulate them with supplied conclusion-shaped predicates or placeholder data.

A follow-up should fulfill that L0 request, independently check the induced-kernel topology comparison, then instantiate the heavy global constructor signatures and tests from this reader. It should retain the current statement granularity; no expansion into hundreds of routine coefficient lemmas is required. No stage is claimed implementation-closed.

PMIA L2 retains bounded weighting, Amice inversion, phi/psi, unit inverse and the Mahler derivation. ColemanIntegration retains continuation and normalization; L2 retains C^r spaces and the closure-of-LC assertion. Current upstream AdicSpaces, ProfiniteArithmetic and OperatorTheory README/suggested files and the current Tau Ceti library were read/searched. No upstream ownership move is proposed. Generic real/complex functional analysis was not used as p-adic compact-type analysis.

## Sources read and sources missing

Six public primary PDFs were freshly obtained and read at the passages recorded in the packet, with hashes and date:

- Colmez, *Fonctions d’une variable p-adique*, author PDF pp. 13–16, 27–30 and 34–37; Theorem I.4.7, Theorem II.2.2, Proposition II.4.1 and Lemma II.4.2.
- Rodrigues Jacinto–Williams, arXiv:2309.15692v2, §§3.7–3.8, pp. 23–26; Theorem 3.43.
- Schneider–Teitelbaum, *p-adic Fourier theory*, arXiv:math/0102012v1, §1, pp. 3–6.
- Schneider–Teitelbaum, *Locally analytic distributions and p-adic representation theory*, arXiv:math/9912073v1, pp. 1–6; Theorem 1.1, Proposition 1.2, Corollary 1.4 and Lemma 2.1.
- Kohlhaase, *The cohomology of locally analytic representations*, author PDF §4, pp. 19–22; Proposition 4.2 and Corollary 4.3 with proofs.
- Colmez–Niziol, *The C_st-conjecture*, author PDF Appendix A, pp. 58–59; Remark A.6.

There is no missing source for a stage target and no newly alleged source error. General functional-analysis proofs cited by these primary papers are supplier-side inputs; this run did not independently read the nonarchimedean functional-analysis textbooks. No restricted book was used or copied. All repository statements are in the worker’s own words; no excerpt or source-section summary is recorded.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/LocallyAnalyticDistributions--L1.json`: zero errors and zero warnings against the unchanged pinned declaration index.
- `lean-check research/blueprint/suggested/LocallyAnalyticDistributions--L1.lean`: exit 0, 128 lines, 13 intended theorem/example placeholder warnings, no other warnings. Two light definitions have real bodies; eight scalar milestones and six examples use genuine native carriers. The final example resolves the generated additive summability theorem directly. The source index lists its multiplicative source declaration, as explained in the packet.
- `python3 scripts/check_sorry_data.py research/blueprint/suggested/LocallyAnalyticDistributions--L1.lean`: passes.
- Intake path/JSON checks: the four authorized files pass; no private paths, source passages, PDF files or edits outside this job’s deliverables.
- Exact rational/cyclotomic arithmetic: 11,958 assertions passed for p=2,3,5. Counts: 1,200 reciprocal-integer bounds; 6,015 factorial/Gauss bounds; 27 same-radius primitive failures; 34 reciprocal expansions and 34 reciprocal Gauss bounds; 128 positive-transpose logarithm coefficients; 48 finite-root orthogonality checks; 4,416 negative Dirac moment averages; six surviving constant ambiguities on zero-containing balls; 50 normalized primitive identities. These finite checks do not establish the L0 topology input.

The scratch directory is ephemeral and is removed after submission. All mathematical contracts, locators, API/test names, source hashes, validation results and exact remaining requests needed by the next worker are in the four deliverables. The next process should not claim another stage on the basis of this note until the normal worker ordering and claim rules allow it.
