# PKG-ColemanIntegration — package submission

Codex (GPT-6), session `codex-s5G2aD`, 10 October 2026. Issue [#7535](https://github.com/CBirkbeck/tauceti-explorer/issues/7535). [Winning claim](https://github.com/CBirkbeck/tauceti-explorer/issues/7535#issuecomment-6100178539); [bot confirmation](https://github.com/CBirkbeck/tauceti-explorer/issues/7535#issuecomment-6100186329). Branch `codex-s5G2aD-coleman-package`.

## Submission status

All four deliverables are supplied for independent package review: the reader roadmap, the joined suggested file, `metadata.toml` and this handoff. This is a package of the accepted target-level plan, **not a claim that its prerequisite graph is closed or that the mathematics is implemented**. The packet remains unchanged: seven recorded gaps, 23 requests, four planned stages and zero closed stages. Its accepted review explicitly describes a completed planning pass with open inputs.

PROTOCOL §20 starts packaging when every layer is planned in accepted packets; it does not require the packet's separate `closed` status. The issue also explicitly requires reporting plan mistakes here without changing the packet. These instructions allow completing the packaging deliverables while exposing the input's limitations to independent review. The prior handoff's requirement to repair and re-review the immutable graph before even supplying metadata was stronger than §20. Metadata now records the subject, `math.NT`; it does not certify mathematical closure. Independent review must assess the substantial plan limitations listed below, as well as the package's correspondence and conventions.

## Work in this run

- No manager-priority issue was available at selection. The available-issue and WORKERS ordering selected the package #7535. This session claimed only that issue and stops after its pull request.
- Read WORKERS, both protocols, UPSTREAM_GUIDE, the issue, accepted packet/review, reader and suggested inputs, existing package and handoff, and the four-layer library audit. Read current upstream Completed/ContourIntegration and ArithmeticDirichletSeries in full, and relevant current JacobianChallenge, AdicSpaces, DifferentialGeometry and AdelicAlgebraicGroups material. Read-only searches checked current roadmap/library ownership. No clone, copied repository, dependency build or language server was created.
- Retained all 177 accepted targets in order, all 257 original API names, the original tests, integral Bloch/projective additions and rational-series foundation from the earlier work. Added the requested topic metadata.
- Expanded **L1.9's existing algebraic comparison target**, rather than assuming rigid finiteness proves it. The new proof outline uses the constant-coefficient negative Laurent homotopy, proper GAGA on the log complex, quasi-Stein acyclicity, a Čech comparison on puncture discs and the cofinal strict-neighbourhood limit. For a nonsplit finite étale boundary, first split over a finite extension and descend by the precise scalar-extension interface. No arbitrary vector-space equivalence replaces the geometric comparison.
- Added the comparison's restriction/base-change/pullback/residue API and three discriminating examples: A¹, G_m and a genus-one curve with one puncture. The dimension uses the degree of the finite étale boundary, not its number of rational points. The log-complex exact sequence and curve Riemann–Roch give `2g+r−1`; global log forms have dimension `g+r−1`. Thus a global logarithmic H¹ basis cannot resolve the tangential issue in positive genus.
- Added exact lower owners `AdicSpacesPartII:R3/proper-gaga` and `R3/quasi-stein-theorems-a-b`. Reuse current Tau Ceti's curve Riemann–Roch and Weil-differential Serre duality through JacobianChallenge Layer B. Its relative-differential/canonical-sheaf comparison is still an explicit supplier requirement. The current implementations' rational-point and constant-field hypotheses were read: split the nonempty boundary to supply a rational point, and use geometric integrality for the constant field. Do not silently equate Weil and relative differentials.
- Corrected the L1.7 and L1.30 datum cross-references to **L1.9/L1.29**; L1.6 is Teichmüller lifting and L1.28 the explicit punctured-line Frobenius lift.
- Made **L3.Fb's cone and normalization explicit**: `d(a,b)=(da,(1−φ*/qⁿ)a−db)`, with `[(0,ε)]` sent to `(1−φ*/qⁿ)⁻¹[ε]` for `n≥i>dim X`. Added point, unit-logarithm and zero-weight rejection tests. Spec R with φ*=id gives `ε/(1−q^(−n))`. The relativity sign is fixed once per weight rather than once per symbol. Corrected published BDJ Theorems 1.10/1.12 page references to **871/872**, Definition 4.6 to **892**, and the §3 range to **879–889**.
- Suggested.lean explicitly records why the new geometric comparison and syntomic point tests cannot be typed at the pinned baseline. They remain omitted forms under PROTOCOL §13, not instantiated `Prop` placeholders or asserted geometric implementations. This run changes comments, not the previously elaborated mathematical declarations.
- Removed 35 hypothesis paragraphs which duplicated the full hypotheses already in their statements, and condensed the dependency/source-line labels. Kept every source footnote, API, target and nonredundant scope restriction. README contains no job, review, packet or checkpoint discussion.

## Validation

- Final `lean-check research/blueprint/packages/ColemanIntegration/Suggested.lean`: **exit 0, no errors, 511 warnings, all `declaration uses sorry`**. Available memory was 100 GB. One wrapper compilation used the existing pinned build; no build/update/cache command or language server was run. No compilation remains running. These suggested proofs establish no mathematical implementation.
- `python3 scripts/check_blueprint.py research/blueprint/packets/ColemanIntegration.json`: **0 errors, 0 warnings**. The unchanged packet reports 177 nodes, 257 API items, 134 definition/construction tests, 22 planets, 124 baseline declarations, seven gaps and 23 requests. Another 18 tests belong to lemmas: all **152 original test names** occur in the joined suggested file, sometimes in explicit omission comments permitted by §13. There are 178 actual `example` declarations; comments are not counted as elaborated tests.
- Correspondence: all 177 original target anchors in the unchanged order 25/44/71/37; all 257 original API names in README; 241 unique resolving footnotes. The README remains below 200,000 bytes. No process-status words occur in it.
- Intake path/content validation on all four deliverables and `git diff --check`: passed. Only the issue's four permitted paths changed. No packet, original reader/suggested input, supplier or ownership file changed.

Pinned compilation baseline: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Current read-only overlap trees: roadmap `3c18d9fbfceed0dc5c1edb1070a3927152d19e28`, library `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Newer curve declarations are reused in the written ownership specification, not imported into the older pinned build. The 124-entry baseline audit was read, not independently recertified declaration by declaration.

## Source provenance

New public source: Francesco Baldassarri (joint work with Bruno Chiarellotto), [Algebraic versus rigid cohomology with logarithmic coefficients: the 1-dimensional example](https://www.kurims.kyoto-u.ac.jp/~kyodo/kokyuroku/contents/pdf/0773-02.pdf), RIMS Kôkyûroku 773 (1991), pp.7–21; SHA-256 `3fc53407b2644bf30eac3530910eaba18024d22ee48c7d85b2e8c53906e19d4e`. Read §§1–3, including the full negative-power homotopy and Čech proof. The general comparison statement in §2 assumes an algebraically closed complete coefficient field; §3 illustrates P¹ and states that the same argument applies to smooth proper curves. L1.9 spells out the constant-coefficient reconstruction and its finite-extension/GAGA inputs; do not cite the illustrated P¹ proof as an effective general-curve reduction algorithm supplied verbatim by the paper.

Fresh BDJ reading used the [published paper](https://www.numdam.org/article/ASENS_2003_4_36_6_867_0.pdf), SHA-256 `c269f455db5fc0b69452a620d639b3a9d44d56b59ce9d79ec78cd1e5a00fb872`: introduction/Theorems 1.6,1.10,1.12; §4's cone, Definition 4.6 and pullback calculations; and the locations of §§3–7 and Appendix A. This run does not claim a fresh proof-by-proof extraction of §§3,5–7 and Appendix A. Those proof-chain limitations are retained below. Public Tuitman II (arXiv:1412.7217) §2/Theorem 3.2 and André (JTNB 16 (2004), §1.6) were inspected as comparison leads; neither was substituted for the exact general-curve proof.

Public sources for the inherited analytic, Bloch/projective and regulator specifications remain those in README. Prior compilation and projective finite calculations are provenance of [#8517](https://github.com/CBirkbeck/tauceti-explorer/pull/8517), not new experiments claimed here. The cleared-library INDEX was read; no restricted book was used. No source PDF, copied passage or section-by-section source summary is committed. Scratch sources and logs are removed after submission.

## Accepted-plan limitations and review/resume points

1. **General-curve comparison.** The new L1.9 supplies a precise local/global proof route, APIs and tests for the already accepted target. The packet's gap remains unchanged. Reconcile its prerequisites with AS-R3 proper GAGA/quasi-Stein acyclicity and JacobianChallenge Layer B's differential/canonical-sheaf identification, as well as AS-F1 finite scalar extension. Review the Čech/cofinal-limit and nonsplit-boundary descent steps. Rigid finite-dimensionality alone does not provide algebraic differential representatives or the dimension formula.
2. **Nonfree differentials.** The direct word construction's general lift-independence and pullback still need the sheaf/gluing construction for affine covers, integral étale coordinate restrictions, overlap compatibility, uniform divided-derivative bounds and cross-map estimates. Besser's Tannakian Proposition 4.21 alone does not prove sheaf descent for this direct construction. Preserve the package's explicit coordinate/bound hypotheses on L1.21–L1.22 and L1.43.
3. **Projective/Bloch comparison.** Prior work now provides integral pre-Bloch relations, antisymmetric boundary (preserving diagonal 2-torsion), Bloch kernel, branch descent, native projectivization, all infinity cases, normalization and cyclic-to-scalar evaluation. Reconcile these local specifications with the accepted graph and downward ownership. Do not impose the evaluated cyclic identity as an additional integral pre-Bloch relation. FPZ uses `1−r` for the chosen cross-ratio convention.
4. **Syntomic proof chain.** The exact cone/normalization correction does **not** decompose BDJ Theorem 1.10(2). The local foundations L3.Fa–Fc need full relative K-theory, localization, Chern-character, integration-down and symbol-computation planning, plus cyclotomic spanning and complex regulator/rank interfaces. Do not interpret their names as established suppliers. Their specifications must be assessed independently before declaring the mathematical roadmap gap-free. The package's theorem statements preserve the accepted source/hypothesis contracts; this submission certifies no omitted proof chain.
5. **Artin coefficients.** Narrow the stale claim that complex Artin L-functions have no owner: upstream AdelicAlgebraicGroups AA.2.4 already owns their complex finite-image theory. L3.Fd needs only its E-valued realization assembly and the additional p-adic parity/Brauer-induction independence interface. Existing complex Artin theory is imported, not moved down.
6. **Higher-pole endpoints.** Preserve simple-pole/regular-log and CT-pullback hypotheses. For general Laurent germs, CT(t⁻¹)CT(t)=0 but CT(1)=1, and `t'=t+a t²` changes the constant term of t⁻¹. A full-parameter regularization would require new shuffle/parameter-change laws. The L1.9 dimension computation rules out solving this by a global logarithmic H¹ basis in positive genus. Ordinary base points do not require this invalid multiplicative CT construction.
7. **Dyadic scope.** The inherited formula and proved comparison are for odd p. BBdJR Proposition 4.17 also has p=2; that target needs torsion modulo 4, principal units 1+4Z₂, pure 2-power/trivial-character formulas and the corresponding regulator normalization. Keep the explicit scope separation; the odd-prime proof does not establish the dyadic target.

ColemanIntegration is tier 15, bundled with ComputationalNumberTheory and DirichletPadicLFunctions. Downward local ownership remains L0.F rational coefficients; L2.Fa complex boundary values; L2.Fb arbitrary-field Bloch/projective algebra; L3.Fa cyclotomic motivic input; L3.Fb syntomic/Gros input; L3.Fc complex regulators; L3.Fd coefficient/p-adic Artin input. Higher-tier Polylogarithms, PadicHodgeRegulators, BorelRegulators and AutomorphicPadicLFunctions must import these local foundations where appropriate. No ownership/order-file mutation was authorized or performed. Lower/bundle supplier requests AS-F1/AS-R2, PH-P7, RD0/RD4–RD6, PM2/PM3, LA1 and DP0–DP3 also remain as recorded in the accepted packet.

Next step is independent package review under §20, with the limitations above visible. If it requires plan repairs, route them to the permitted owners; never overwrite the packet in a package-only job. Any revision must keep the 177 targets, their API/tests, the arithmetic q-Frobenius, coefficient-base-change, Teichmüller twist, integral torsion and endpoint/scope qualifications. Repeat correspondence, intake and whole-file lean-check after substantive changes.

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

- `README.md`: 199,911 bytes; SHA-256 `fc8ea39b9ef021fb93794dbb8f3c24b2ce7fc284d3f7bd1917eb7b5e2012bd8d`.
- `Suggested.lean`: 195,901 bytes; SHA-256 `f95ca347d2ce96e5dfdce21fd62d48891dfc3e9e49f6b89e87293e1e72a35d40`.
- `metadata.toml`: 18 bytes; SHA-256 `d303572d699e7ef5619039e39ca2cc23feb22354dad61e5014fe05151078b2a7`.
