# PKG-ColemanIntegration — blocked checkpoint

Codex, session `codex-7IeqDm`, 10 October 2026. Issue [#7535](https://github.com/CBirkbeck/tauceti-explorer/issues/7535). Claim confirmed by the bot on comment 6097908996; branch `codex-7IeqDm-coleman-package`.

## Submission status and reason

**This is a checkpoint, not a complete package or a closure certificate.** Packaging work is saved in README.md and Suggested.lean. The accepted source of truth is a completed target-level pass with seven open gaps, rather than a closed plan. Its independent review explicitly distinguishes those two meanings of acceptance. The packet checker confirms four planned stages, zero closed stages. The package issue nevertheless describes the input as a complete plan.

The blocking condition is the combination of that mathematical incompleteness with this job's scope: the issue forbids changing the packet and requires packaging its accepted plan, while WORKERS requires prerequisite closure and forbids higher-tier or outside-order imports. Several required motivic foundations have neither a permitted closed supplier nor an accepted local development. Renaming those dependencies would not supply their mathematics. A complete submission needs source-of-truth repairs and a developed replacement for those foundations. This is not a timeout, a Lean error, or a request to wait for another roadmap's implementation.

`metadata.toml` is intentionally absent from this checkpoint. The intake code regards a package as complete merely when all three outputs exist, without inspecting the mathematical gaps or handoff. Publishing the metadata now would cause this partial job to be automatically classified as complete. Once the repairs below are made, add exactly:

```toml
topic = "math.NT"
```

Do not silently add that file as the only continuation step. The README foundations labelled F, Fa, Fb, Fc and Fd describe requirements; except for the rational coefficient prototype they are not finished foundational plans. Their definitions, prerequisite chains, APIs and discriminating tests still need development and independent assessment. They are not additions to the accepted packet.

## Work completed

- Read WORKERS, both protocols, UPSTREAM_GUIDE, the issue, the accepted packet and its independent review; inspected the statement, hypotheses, API and tests of every original target. The older 675 KB reader was not copied as the package.
- Read two current upstream density examples in full: ArithmeticDirichletSeries and Completed/ContourIntegration. Checked the current roadmap and Tau Ceti trees for Coleman, polylogarithm and logarithm overlap. The nine post-snapshot roadmaps were included in the search. No existing implementation of these Coleman targets was found. Incidental Coleman attribution in elliptic-curve code is not an integration API.
- Built a reader with all **177 original targets**, in dependency order within four layers: 25 in L0, 44 in L1, 71 in L2, 37 in L3. Every original target retains an explicit hypothesis block and source locators. All **257 API names and assertions** are included. The **152 mathematical test assertions** are included; executable or comment identifiers are retained in Lean rather than repeated in README. All 30 original definitions/constructions retain at least three tests.
- Kept the mathematical qualifications of the review: arithmetic q-power versus auxiliary p-power lifts; reverse semilinear matrix product; simple-pole tangential CT; C_p rather than K constants after scalar extension; actual Chen rebasing at depth two; coordinate Taylor bounds; modified-polylogarithm domain restrictions; nontrivial primitive characters before Gauss inversion; odd-prime L-function normalization; and the Teichmüller twist in the headline formula.
- Replaced blueprint identifiers in the package by reader numbers, removed source-reading histories and review/process prose, used shared source and hypothesis footnotes, and condensed forty long assertions in our own words. Every numbered original target is present exactly once. No source excerpts, private source files or private paths are included.
- Joined the accepted Lean prototype into one import block and consistent namespace. Removed the import of the unavailable `research.blueprint.suggested.«DirichletPadicLFunctions--L1»` module. Its sole typed use was the smoothing-series comparison. `rotatedSmoothedTransform_one` now takes a native K[[X]] series F with the precise cleared finite-polynomial identity Q_b(1+X)F=R_b(1+X); uniqueness identifies it with the existing owner's series. This is an explicit mathematical interface, not a duplicate smoothing theory or a fake scalar extension.
- Added `rationalPolylogSeries : ℤ → PowerSeries ℚ`, its coefficient law, three distinguishing coefficient examples, and the coefficient-map comparison `polylogSer_eq_eval_polylogSeries`. It uses native PowerSeries and supplies the common rational coefficients without a higher-tier import.

## Verification

`python3 scripts/check_blueprint.py research/blueprint/packets/ColemanIntegration.json` completed with **0 errors, 0 warnings**. Its summary: 177 nodes, 257 API entries, 134 definition/construction test records, 22 planets, 124 baseline declarations, 23 requests, seven gaps, four planned stages and zero closed stages. The packet was not modified. The other eighteen tests belong to lemma nodes, giving 152 overall.

Final command:

```text
lean-check research/blueprint/packages/ColemanIntegration/Suggested.lean
```

**Exit 0; zero errors; 377 warnings, all `declaration uses sorry`; no other warnings.** Memory available before this check was 99 GB. The check used the existing shared build, with no library build, cache operation, update or language server. No compilation or download remains running. Earlier failed attempts exposed an unavailable import, the requirement that imports precede module docstrings, and a locally scoped PowerSeries notation; those were fixed in the submitted file. The final result applies to the entire file, not a stripped-import variant.

Mathlib HEAD in the shared build is `082e2d37e8b0463410cdb532e111cd43d5a66174`. The imported Tau Ceti LogOneAdd/Basic and LocalField/Teichmuller source files were compared byte-for-byte with the git objects at `f790474821cf4256814db967cb154e7af3d0c369`; both match. Their statements, and the relevant native analytic, power-series, character, Fourier, measure and completion declarations, were inspected. The accepted library audit for all four layers was read. The convergence theorem for logOneAdd with continuous rational-nonnegative scalar multiplication was not misapplied to p-adic fields.

A first baseline extraction matched similarly named declarations in four places; these were corrected by reading the actual declarations: `AdicCompletion` at Basic.lean:171, `Polynomial.cyclotomic` at Cyclotomic/Basic.lean:230, `bernoulli` at Bernoulli.lean:195, and the C_p-specific `PadicComplex.isUltrametricDist`/`isNonarchimedean` at Padics/Complex.lean:199/202. The corresponding algebraic-closure declarations earlier in that file are distinct. This checkpoint does not re-certify the entire independent baseline audit.

Mechanical reader checks verified: all 177 original target labels occur once, all 257 API names occur, all 152 test names occur in Lean, all 177 target hypothesis blocks occur, no dangling source/hypothesis footnotes, size below 200,000 bytes, and no forbidden higher-tier stage references in either package file. Intake `check-files` passed on the package draft. File sizes and SHA-256 receipts are recorded below after final editing.

Compilation does not prove the mathematics. Genuine wide-open, dagger, end-germ, regulator, K-theory and Artin carriers are still described in comments where the pinned libraries lack them. Commented tests and interfaces have not been elaborated. The tube prototype uses ordinary Teichmüller bases and an auxiliary p-power map; it does not itself implement the geometric arithmetic q-datum or tangential end normalization. Namespace-local API names elaborate under their actual namespaces even when their fully qualified spelling is absent from a comment.

## Tier repairs and ownership moves

ColemanIntegration is in tier 15, bundled with ComputationalNumberTheory and DirichletPadicLFunctions. The table below records the replacement requirements inserted in the reader. These move ownership downward, as WORKERS requires; they do not assert that the replacement development is already complete. Higher roadmaps must import the completed notions from these homes rather than plan them again. No packet, supplier packet, link map or order file was changed in this scope.

| Original dependency | Proposed local home | Exact role and continuation |
|---|---|---|
| Polylogarithms:P.1 rational coefficient series | L0.F | Native rational coefficients and scalar mapping; prototyped. Complete its derivative and formal-log API. |
| Polylogarithms:P.1 complex series, distribution, inversion and weight-one boundary | L2.Fa | Follow `Complex.polylog` terminology from open Mathlib PR #44531; connect to native expZeta. Develop the conditionally convergent weight-one boundary argument and all needed comparison laws. |
| Polylogarithms:P.1 field-general five-term and Bloch algebra | L2.Fb | Define the pre-Bloch quotient and Suslin antisymmetric tensor boundary, preserving 2-torsion; prove all projective/infinity cases and branch descent. Do not import the complex Bloch–Wigner theorem as a p-adic statement. |
| Polylogarithms:P.4 complexes, cyclotomic symbols and generation | L3.Fa | Develop symbol complexes, Adams weights, localization and the number-field comparison with the precise Beilinson–Soulé hypotheses. Cyclotomic symbol spanning is needed separately. |
| PadicHodgeRegulators:D.2 syntomic/Gros regulators and BDJ comparison | L3.Fb | Develop BDJ §§3–7, target identification and signs, with relative Chern classes and integration down. A named regulator map alone cannot discharge this input. |
| BorelRegulators:R.7 Beilinson regulator and ranks | L3.Fc | Construct the actual coefficient-valued pairing, prove the idempotent dimension criterion and compute the cyclotomic determinants. |
| AutomorphicPadicLFunctions:L3 p-adic Artin values, plus the unowned complex Artin interface | L3.Fd | Specify the Euler products with inertia invariants, Brauer induction and independence, parity/twist and coefficient laws. General Artin L-values cannot be replaced by Mathlib's abelian Dirichlet API. |

The allowed lower/bundle suppliers remain explicitly named: AdicSpacesPartII F1/R2; PadicHodgeTheory P7 annulus foundations; PadicDifferentialEquationsAndRigidCohomology RD0, RD4–RD6; PadicMeasuresIwasawaAlgebras L2/L3; LocallyAnalyticDistributions L1; DirichletPadicLFunctions L0–L3. Their required scalar extension, meromorphic pole removal, integral coordinate and cross-map Taylor contracts are retained as hypotheses. Do not infer those contracts from an unrelated generic library theorem.

## Seven inherited gaps and precise resume points

1. **General algebraic/dagger de Rham comparison (L1.6).** The explicit punctured-line calculation does not give the comparison for an arbitrary good-reduction affine curve, an algebraic differential basis, or dimension 2g+#D−1. Develop pole-order reduction, Riemann–Roch and the comparison theorem here or obtain an exact lower-tier RD4 contract; rigid cohomology finiteness alone is insufficient.
2. **Nonfree differential modules (L1.21–L1.22, L1.43).** The current Taylor proof assumes a global integral étale coordinate and uniform bounds. Develop free-coordinate covers, the direct Coleman sheaf property and gluing. Besser's Tannakian Proposition 4.21 is a source of the sheaf statement, not an already constructed direct-word sheaf. Preserve the cross-map estimates and avoid assuming a common fixed point of two lifts.
3. **Field-general projective/Bloch comparison (L2.Fb, L2.70).** L2.69 supplies the scalar identity. What remains is the projective cross-ratio equivalence, every infinity/denominator case, boundary descent and branch independence on the Bloch kernel. DJ §3 uses the antisymmetric tensor quotient, not the alternating exterior square; its modified quotient kills (-x)⊗x and also inversion relations. Keep these distinct, including torsion.
4. **BDJ Theorem 1.10(2) (L3.Fa–L3.Fb, L3.15, L3.36–L3.37).** The input explicitly does not decompose §§3–7. The required chain includes multi-relative K-theory, localization, relative Chern classes, rigid syntomic cohomology and integration down. This source must be read at that depth and turned into an actual plan; a formula with `reg` as an uninterpreted function does not satisfy it.
5. **Complex Artin L-functions (L3.Fd, L3.16).** Construct the genuine coefficient-valued Artin interface; a Dirichlet special case suffices only for the abelian theorem. Neither an existing permitted owner nor a closed local chain is present in the accepted plan.
6. **Higher-pole tangential regularization (L1.14–L1.19).** CT(t⁻¹)CT(t)=0 while CT(1)=1. The change t′=t+at² changes the constant term of t⁻¹. Plan a full-parameter regularization, shuffle and coordinate-change laws, or a justified logarithmic H¹ basis. Do not extend the simple-pole tangent result to arbitrary Laurent germs.
7. **Dyadic normalization (L3.36).** BBdJR Proposition 4.17 includes p=2, while the supplied proof and Dirichlet normalization here assume p odd. Develop torsion modulo 4, principal units 1+4Z_2, the corresponding pure 2-power character formula, trivial components and regulator comparison before asserting the full published theorem.

## Sources and public-library direction

Eight public PDFs were reopened in this run; all eight SHA-256 values match the packet's source register: RJW v2, Furusho v2, Besser Tannakian v1, Heidelberg lectures, BDJ version of record, BBdJR v2, Wojtkowiak version of record, de Jeu functional equations v1. This is not a claim to have freshly verified every source of every node. The other registered sources and the full baseline coverage retain the accepted independent review's provenance.

Direct reading concentrated on the input qualifications and boundary corrections: RJW Definition 5.18 and Theorem 6.7; BBdJR Theorem 4.14, Remark 4.16 and Proposition 4.17; BDJ introductory theorem statements and regulator scope; Besser's Frobenius/Taylor framework and sheaf statement; Furusho's Coleman and polylogarithm normalization; Wojtkowiak §4, Proposition 4.4, pp.362–365; DJ §§2–3, Proposition 2.10, pp.6–7 and proof pp.14–15, including the two different tensor quotients. BDJ §§3–7 were not read or developed sufficiently to close the regulator gap in this checkpoint. No book source was used; the cleared library index was consulted. Source PDFs and extracted text are not included in the repository.

Searched the public Lean Zulip and open Mathlib PRs for Coleman/polylogarithm work. No relevant Zulip result was returned; this is not evidence of absence. [Mathlib PR #44531](https://github.com/leanprover-community/mathlib4/pull/44531), open on 10 October, proposes `Complex.polylog`, `Complex.polylogSeries`, analytic continuation and recurrence. Its body and declaration summary were read at head `a5c3c1696d0e93e51fc083b322d0a3b84ee2ecac`. It is absent from the pinned Mathlib and is not imported or credited as an implemented baseline. Adopt its API direction for L2.Fa, building missing comparisons in Tau Ceti without waiting for a merge.

## Continuation order

1. Reconcile the accepted source of truth with the no-gap and tier rules. Route the seven inherited gaps and the local foundational ownership moves for substantive planning; do not treat this as a request for cosmetic packaging edits.
2. Develop the general geometric and motivic chains above, with exact definitions, APIs and at least three discriminating tests per new definition. Read the required source arguments, especially BDJ §§3–7, and preserve all sign, prime, coefficient and tangent restrictions.
3. Replace the draft local foundation requirements by those accepted precise plans, finish the genuine-carrier suggested forms as their interfaces permit, and reassess the source locators and dependencies. Keep all 177 original targets unless the authorized source of truth changes.
4. Run the packet checker on any authorized plan repair, verify complete target/API/test correspondence again, and run `lean-check` on the final whole package. Stay below 200,000 bytes.
5. Only then add metadata.toml and submit a complete package for independent review.

## Original target correspondence

The table below maps every accepted node to its reader target; all node names have the common `ColemanIntegration:` prefix omitted. This makes continuation independent of deleted scratch files.

| Reader target | Accepted node |
|---|---|
| L0.1 | `L0/ultrametric-natcast-bound` |
| L0.2 | `L0/formal-primitive` |
| L0.3 | `L0/derivative-formal-primitive` |
| L0.4 | `L0/formal-primitive-unique` |
| L0.5 | `L0/formal-primitive-radius` |
| L0.6 | `L0/closed-disc-primitive-failure` |
| L0.7 | `L0/disc-analytic-functions` |
| L0.8 | `L0/disc-primitive-unique` |
| L0.9 | `L0/locally-analytic-primitive-nonunique` |
| L0.10 | `L0/log-one-add-convergence` |
| L0.11 | `L0/annulus-residue` |
| L0.12 | `L0/annulus-exact-iff-residue-zero` |
| L0.13 | `L0/log-one-add-mul` |
| L0.14 | `L0/cp-unit-power-principal` |
| L0.15 | `L0/log-branch` |
| L0.16 | `L0/log-branch-change` |
| L0.17 | `L0/log-branch-field-compatibility` |
| L0.18 | `L0/iwasawa-logarithm` |
| L0.19 | `L0/log-branch-local-expansion` |
| L0.20 | `L0/annulus-log-ring` |
| L0.21 | `L0/annulus-log-transcendence` |
| L0.22 | `L0/annulus-log-primitive` |
| L0.23 | `L0/annulus-branch-change` |
| L0.24 | `L0/log-geometric-bound` |
| L0.25 | `L0/log-geometric-quotient` |
| L1.1 | `L1/good-reduction-pair` |
| L1.2 | `L1/wide-open-neighbourhood` |
| L1.3 | `L1/residue-disc-parametrisation` |
| L1.4 | `L1/locally-analytic-log-functions` |
| L1.5 | `L1/frobenius-lift` |
| L1.6 | `L1/teichmuller-point` |
| L1.7 | `L1/frobenius-h1-datum` |
| L1.8 | `L1/weil-weight-no-root-of-unity` |
| L1.9 | `L1/good-reduction-datum-exists` |
| L1.10 | `L1/frobenius-orbit-linear-algebra` |
| L1.11 | `L1/dwork-principle` |
| L1.12 | `L1/word-algebra` |
| L1.13 | `L1/word-algebra-integrability` |
| L1.14 | `L1/word-algebra-local-expansion` |
| L1.15 | `L1/word-algebra-frobenius` |
| L1.16 | `L1/coleman-realization` |
| L1.17 | `L1/coleman-functions` |
| L1.18 | `L1/coleman-uniqueness-principle` |
| L1.19 | `L1/coleman-integral` |
| L1.20 | `L1/coleman-integration-characterisation` |
| L1.21 | `L1/taylor-homotopy` |
| L1.22 | `L1/frobenius-lift-independence` |
| L1.23 | `L1/branch-independence-principle` |
| L1.24 | `L1/cohomological-analytic-pullback` |
| L1.25 | `L1/punctured-line` |
| L1.26 | `L1/punctured-line-mittag-leffler` |
| L1.27 | `L1/punctured-line-de-rham-h1` |
| L1.28 | `L1/punctured-line-frobenius` |
| L1.29 | `L1/punctured-line-datum` |
| L1.30 | `L1/punctured-line-coleman-functions` |
| L1.31 | `L1/punctured-line-based-primitive` |
| L1.32 | `L1/punctured-line-singular-disc-expansion` |
| L1.33 | `L1/special-unit-tube` |
| L1.34 | `L1/special-unit-line-good-reduction` |
| L1.35 | `L1/special-unit-line-principal-parts` |
| L1.36 | `L1/special-unit-line-de-rham` |
| L1.37 | `L1/special-unit-frobenius-error` |
| L1.38 | `L1/special-unit-frobenius-correction` |
| L1.39 | `L1/special-unit-frobenius-datum` |
| L1.40 | `L1/special-unit-maps` |
| L1.41 | `L1/fractional-disc-composition` |
| L1.42 | `L1/regular-image-end-pullback` |
| L1.43 | `L1/coleman-pullback` |
| L1.44 | `L1/special-unit-local-charts` |
| L2.1 | `L2/polylogarithm-power-series` |
| L2.2 | `L2/residue-discs-of-roots-of-unity` |
| L2.3 | `L2/existence-and-uniqueness-of-coleman-polylogarithms` |
| L2.4 | `L2/polylogarithms-on-the-punctured-residue-discs` |
| L2.5 | `L2/p-adic-polylogarithm` |
| L2.6 | `L2/tangential-base-point-at-zero` |
| L2.7 | `L2/differential-recursion` |
| L2.8 | `L2/distribution-relation` |
| L2.9 | `L2/inversion-relation` |
| L2.10 | `L2/branch-dependence` |
| L2.11 | `L2/value-at-one` |
| L2.12 | `L2/locally-analytic-antiderivatives-and-a-non-example` |
| L2.13 | `L2/integral-modified-polylogarithm` |
| L2.14 | `L2/overconvergent-expansion-of-the-modified-polylogarithm` |
| L2.15 | `L2/frobenius-relation` |
| L2.16 | `L2/elementary-characterisation` |
| L2.17 | `L2/galois-equivariance` |
| L2.18 | `L2/dilogarithm-identities` |
| L2.19 | `L2/abel-disc-rational-pair` |
| L2.20 | `L2/abel-composite-coefficients` |
| L2.21 | `L2/abel-series-disc-analyticity` |
| L2.22 | `L2/abel-series-unit-bidisc` |
| L2.23 | `L2/abel-branch-cancellation` |
| L2.24 | `L2/five-term-nested-discs` |
| L2.25 | `L2/values-at-tame-roots-of-unity` |
| L2.26 | `L2/values-in-finite-extensions` |
| L2.27 | `L2/values-at-roots-of-unity-of-p-power-order` |
| L2.28 | `L2/polylogarithm-expansion-at-a-root-of-unity` |
| L2.29 | `L2/sums-over-galois-conjugates` |
| L2.30 | `L2/complex-polylogarithm-at-roots-of-unity` |
| L2.31 | `L2/five-term-defect` |
| L2.32 | `L2/five-term-arguments` |
| L2.33 | `L2/defect-swap` |
| L2.34 | `L2/defect-complement` |
| L2.35 | `L2/defect-inversion` |
| L2.36 | `L2/defect-dilation` |
| L2.37 | `L2/defect-move-origin` |
| L2.38 | `L2/defect-fractional` |
| L2.39 | `L2/defect-mixed-norm` |
| L2.40 | `L2/defect-separated-discs` |
| L2.41 | `L2/defect-close-pair` |
| L2.42 | `L2/defect-small-first` |
| L2.43 | `L2/defect-special-unit-reduction` |
| L2.44 | `L2/five-term-from-special-units` |
| L2.45 | `L2/five-term-logarithmic-pullbacks` |
| L2.46 | `L2/five-term-defect-zero-differential` |
| L2.47 | `L2/polylogarithm-analytic-at` |
| L2.48 | `L2/polylogarithm-weight-one` |
| L2.49 | `L2/dilogarithm-continuous-at` |
| L2.50 | `L2/five-term-defect-continuous` |
| L2.51 | `L2/five-term-special-unit-open` |
| L2.52 | `L2/five-term-algebraic-density` |
| L2.53 | `L2/five-term-from-algebraic-special-units` |
| L2.54 | `L2/polylogarithm-at-zero` |
| L2.55 | `L2/dilogarithm-bounded-log-limit` |
| L2.56 | `L2/dilogarithm-geometric-limit` |
| L2.57 | `L2/dilogarithm-geometric-quotient-limit` |
| L2.58 | `L2/five-term-boundary-admissible` |
| L2.59 | `L2/five-term-boundary-expression` |
| L2.60 | `L2/five-term-boundary-limit` |
| L2.61 | `L2/five-term-boundary-constant` |
| L2.62 | `L2/five-term-from-algebraic-constancy` |
| L2.63 | `L2/log-laurent-end-determination` |
| L2.64 | `L2/log-laurent-infinity-determination` |
| L2.65 | `L2/five-term-defect-log-laurent` |
| L2.66 | `L2/five-term-defect-coleman` |
| L2.67 | `L2/five-term-defect-coleman-constant` |
| L2.68 | `L2/five-term-algebraic-special-unit-constancy` |
| L2.69 | `L2/five-term-scalar-global` |
| L2.70 | `L2/five-term-relation` |
| L2.71 | `L2/twisted-sums-for-primitive-characters` |
| L3.1 | `L3/padic-value-as-negative-moment` |
| L3.2 | `L3/padic-value-as-smoothed-negative-moment` |
| L3.3 | `L3/geometric-measure` |
| L3.4 | `L3/mu-theta-as-sum-of-geometric-measures` |
| L3.5 | `L3/polylog-primitive-on-residue-disc` |
| L3.6 | `L3/unit-moment-via-distribution-primitive` |
| L3.7 | `L3/negative-moments-of-geometric-measure` |
| L3.8 | `L3/negative-moment-riemann-sums` |
| L3.9 | `L3/primitive-character-fibre-sum-vanishes` |
| L3.10 | `L3/euler-factor-from-p-power-map` |
| L3.11 | `L3/gauss-sum-root-of-unity-independence` |
| L3.12 | `L3/complex-polylog-at-roots-of-unity` |
| L3.13 | `L3/complex-coleman-formula` |
| L3.14 | `L3/padic-regulator-polylogarithm` |
| L3.15 | `L3/syntomic-regulator-of-cyclotomic-elements` |
| L3.16 | `L3/padic-beilinson-conjecture` |
| L3.17 | `L3/rotated-smoothing-denominator` |
| L3.18 | `L3/rotated-smoothed-transform` |
| L3.19 | `L3/rotated-smoothed-coefficient-bound` |
| L3.20 | `L3/rotated-smoothed-open-disc` |
| L3.21 | `L3/rotated-smoothed-evaluation` |
| L3.22 | `L3/rotated-smoothed-off-centre` |
| L3.23 | `L3/rotated-smoothed-amice` |
| L3.24 | `L3/smoothed-twist-as-sum-of-rotated-measures` |
| L3.25 | `L3/smoothed-polylog-combination` |
| L3.26 | `L3/smoothed-polylog-distribution-relation` |
| L3.27 | `L3/negative-moments-of-smoothed-measure` |
| L3.28 | `L3/coleman-formula` |
| L3.29 | `L3/coleman-formula-trivial-character` |
| L3.30 | `L3/coleman-formula-rjw-normalisation` |
| L3.31 | `L3/recovers-leopoldt-formula` |
| L3.32 | `L3/comparison-with-rjw-distribution-argument` |
| L3.33 | `L3/comparison-with-bhyy-measure-argument` |
| L3.34 | `L3/coleman-functions-versus-locally-analytic` |
| L3.35 | `L3/independence-of-branch-and-frobenius-lift` |
| L3.36 | `L3/padic-beilinson-for-dirichlet-motives` |
| L3.37 | `L3/coleman-formula-as-syntomic-regulator-formula` |

## Final file receipts

- `README.md`: 199763 bytes; SHA-256 `389901a9dda1b34ef74f4e790cc463fbfd5305626892728eb6f9f3c64baaedc3`.
- `Suggested.lean`: 160823 bytes; SHA-256 `7cbcfc3aef54b31de08c625934a6a43640bec354fe38a99336fe135c625056a1`.
