# PKG-ColemanIntegration — blocked checkpoint

Codex (GPT-6), session `codex-VjbYzk`, 10 October 2026. Issue [#7535](https://github.com/CBirkbeck/tauceti-explorer/issues/7535). [Bot confirmation](https://github.com/CBirkbeck/tauceti-explorer/issues/7535#issuecomment-6099837726) of claim comment 6099836441. Branch `codex-VjbYzk-coleman-package`.

## Status and scope blocker

**Checkpoint; the package remains incomplete.** This continuation supplies the missing arbitrary-field projective/infinity comparison in L2.Fb: native projectivization, cross-ratio, normalization, field transport, conversion from scalar to cyclic five-term identities, and evaluation through the actual p-adic dilogarithm/pre-Bloch interface. It retains the integral quotient, antisymmetric boundary and branch descent from [#8476](https://github.com/CBirkbeck/tauceti-explorer/pull/8476), rational coefficient foundation and upstream Artin dependency from [#8470](https://github.com/CBirkbeck/tauceti-explorer/pull/8470), and joined package from [#8432](https://github.com/CBirkbeck/tauceti-explorer/pull/8432).

The accepted review is dated 5 October 2026 and explicitly accepts a completed target-level planning pass with open inputs. The unchanged packet has **seven gaps, 23 requests, four planned stages and zero closed stages**. In particular, gaps 1, 2 and 4 require new algebraic/dagger comparison or supplier contracts, direct sheaf/gluing nodes, and the syntomic-regulator proof decomposition. These are prerequisites of retained targets, not proofs which the signatures here discharge. The issue fixes the accepted plan as the source of truth and instructs: **“Change no packet; if the plan has a mistake, describe it in the handoff note.”** [PROTOCOL §20](../PROTOCOL.md) also requires the README to claim nothing unsupported by that plan. Those repairs and assessment must be routed before this package can be certified complete. No packet, supplier or ownership file was changed, and `metadata.toml` remains absent. Adding metadata alone would misclassify this draft as complete.

The present pass makes mathematical progress within the permitted files; it does not mark gap 3 closed in the source of truth. The concrete projective and inherited Bloch specifications need reconciliation with the accepted dependency/ownership graph. Compilation and source availability for this new algebraic comparison are resolved; the remaining blockage is the accepted-plan scope above.

## This continuation

- Read WORKERS, both protocols, UPSTREAM_GUIDE, issue, accepted packet/review, reader/suggested inputs, previous handoff and four-layer audit. Read current upstream ArithmeticDirichletSeries and Completed/ContourIntegration in full. No manager-priority issue was available at selection. An attempted claim on #7592 was rejected because another session won; this session's only successful claim is #7535.
- Checked current read-only upstream roadmap/library owners for projective, Bloch and dilogarithm APIs. Read pinned `LinearAlgebra/Projectivization/Basic.lean`: `mk`, `rep`, `mk_rep`, `mk_eq_mk_iff'`, `map`, `map_mk`, and `linearIndependent_pair_iff_ne`. The new `Point` is a native alias, not a new projective carrier. The open Mathlib PR search for cross ratio returned no result; the [Biratio Zulip discussion](https://leanprover-community.github.io/archive/stream/217875-Is-there-code-for-X%3F/topic/Biratio.html) supports an arbitrary-field/projectivization design. No external Lean code was copied.
- Added **seven definitions, one carrier alias, 34 API theorem forms and 29 examples** under `TauCeti.ColemanIntegration.ProjectiveAlgebra`. Definitions use actual homogeneous vectors, determinants, native projective maps and a coordinatewise semilinear field map. Every new definition has at least three discriminating examples. No dummy `Prop` fields, substitute complex theorem or asserted integral cyclic relation was introduced.
- Defined r(a,b,c,d)=Δ(a,b)Δ(c,d)/(Δ(a,d)Δ(c,b)); gave representative independence, finite-chart and all four infinity formulas, nonzero/nonone and denominator checks, permutations, linear-equivariance, normalization and field transport. The arbitrary-field coordinate map remains injective on projective lines even for a nonsurjective embedding; it does not misuse Mathlib's `map_injective`, whose general semilinear statement assumes an inverse ring homomorphism.
- The normalized five-tuple is (∞,0,1,x,y), with x,y≠0,1 and x≠y. Its five cyclic ratios are **(1−x, (x−y)/(y(x−1)), (x−1)/(x−y), (x−y)/x, 1/(1−y))**. With q=(1−x⁻¹)/(1−y⁻¹) and r=(1−x)/(1−y), the second is 1−q⁻¹ and the third r/(r−1). Inverse/complement laws identify the cyclic sum with the **negative** scalar defect. `cyclic_relation_of_scalar` isolates this algebraic conversion; `dilogD_cyclic` uses the actual L2.18/L2.69 theorems and has a proof term applying them. Field-general and pre-Bloch evaluation signatures are explicit. Their proofs remain suggested `sorry` forms.
- Fresh source reading: Faber–Pardue–Zelinsky §6, pp.19–22 (including the determinant criterion preceding it); Wojtkowiak §4, pp.361–365; GSWZ §3.1, pp.37–38, equations (173)–(174); de Jeu §§2–3, pp.6–8. FPZ's cross-ratio is **1−r**, not r. The README records this convention conversion and attributes the cyclic-to-scalar calculation as the explicit deduction, not to FPZ or W. W §4 supplies analytic functional-equation background, not the missing general-field projective construction; the inherited misattribution was corrected. Earlier source/proof provenance is inherited, not claimed freshly reread.
- Matched all new definitions/API and example assertions in the README. Compacted repeated hypothesis prose and section labels to keep the complete target set below 200,000 bytes. Preserved the uniform Taylor, coefficient-base-change, simple-pole/CT, character twist and dyadic restrictions. No accepted target, original API name, original test name or source/hypothesis footnote was removed.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/ColemanIntegration.json`: **0 errors, 0 warnings**. Unchanged: 177 nodes (19 definitions, 11 constructions, 98 lemmas, 39 theorems, 10 comparisons), 257 API items, 134 definition/construction tests plus 18 lemma tests, 22 planets, 124 baseline declarations, seven gaps and 23 requests.
- Final joined-file `lean-check research/blueprint/packages/ColemanIntegration/Suggested.lean`: **exit 0; zero errors; 511 warnings, all `declaration uses sorry`; no other warnings**. Available memory exceeded 20 GB. The wrapper used the existing pinned build, one compilation at a time. No Lake build/update/cache fetch or language server was run. Elaboration certifies types, not mathematical implementation. No compile remains running.
- A separate exact-rational computation tested 120 ordered distinct four-tuples selected from ∞,0,1,2,3, all four infinity positions, inverse/complement/pair-swap conventions, three normalized five-tuples and the substitutions through q,r. It passed. This finite computation supplements the suggested signatures; it proves no universal theorem.
- Mechanical correspondence passed: 177 original target anchors in unchanged order (25/44/71/37); all 257 original API names in README and 152 original test names in Lean; 241 unique resolving footnotes; every one of the 42 new projective declaration names in README; at least three examples per new definition. README **199,905 bytes**, Suggested.lean **194,149 bytes**.
- `python3 research/blueprint/intake.py check-files` on README, Suggested.lean and this handoff: **0 problems**. `git diff --check`: passed. Only these three deliverables changed. Accepted packet, reader, original suggested input and metadata remain untouched.

Pinned compilation baseline: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Current read-only overlap trees: roadmap `3c18d9fbfceed0dc5c1edb1070a3927152d19e28`, library `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The current trees were read only; their newer APIs were not substituted for the pinned compilation baseline. The inherited 124-entry audit was read, not independently recertified in full.

Public source PDFs read on 10 October 2026; all prior registered hashes match. FPZ is a new public algebraic source:

| Source | Public PDF | SHA-256 |
|---|---|---|
| FPZ v1 | https://arxiv.org/pdf/2012.03073v1 | `cd19adfaaaffeade4e58710b759dc4268f8f55357c161bba8342277174cb8e84` |
| W, version of record | https://www.numdam.org/item/BSMF_1991__119_3_343_0.pdf | `3c29dd4f28f92bf84357ac423860d43b2aab91f840a3620333fabe84fd22e97e` |
| GSWZ v2 | https://arxiv.org/pdf/2412.04241v2 | `308d1dd1c42bd979e5d5c31d9d95215a1808f604031b49c0ce2a1eb767273de9` |
| DJ v1 | https://arxiv.org/pdf/2007.11014v1 | `6d96d3d58d55e4c55506271e5cd0058b8ea8406995ca642febe868be87440b68` |

The cleared-library index was read; no book or restricted source was used. No source PDF, passage or section-by-section summary is in the repository. DJ's branch-change proof, pp.14–15, and the L0.F Furusho/RJW reading retain the provenance of earlier checkpoints. Scratch and extracted public texts are deleted after submission; everything needed to resume is recorded here and in the deliverables.

## Repairs needed before completion

1. **General-curve de Rham comparison.** Add the exact algebraic/dagger comparison for a smooth good-reduction affine curve, an algebraic differential basis, and dimension `2g + #D − 1`. The explicit punctured-line computation and rigid-cohomology finiteness do not give it. The packet itself directs adding a node here or an exact permitted RD4 request. Source leads: Baldassarri–Chiarellotto; Kedlaya's hyperelliptic reduction algorithm supplies a special case, not a general-curve proof.
2. **Nonfree differentials and gluing.** Add the direct Coleman sheaf property, affine covers with integral etale coordinates, restriction and overlap laws, uniform divided-derivative bounds and the cross-map Taylor estimates, then glue lift independence and pullback. Besser's Tannakian Proposition 4.21 does not automatically prove the sheaf property for this direct word realization.
3. **Field-general projective/Bloch comparison.** The package now specifies the integral pre-Bloch quotient, antisymmetric boundary, actual Bloch kernel and branch descent (30 inherited examples), plus native arbitrary-field cross-ratio, every infinity/denominator case, normalization, field transport and the cyclic-to-scalar/evaluation comparisons (29 new examples). Preserve diagonal 2-torsion and the distinction from de Jeu's modified quotient. The cyclic identity is for the evaluated dilogarithm, not a newly imposed integral pre-Bloch relation. Reconcile all these concrete specifications with the accepted graph and downward ownership before closing this gap; review the normalization proof and the factor 1/2 independently.
4. **Syntomic regulator proof.** Develop BDJ §§3–7 for Theorem 1.10(2): multi-relative K-theory, localization, relative Chern classes, rigid syntomic cohomology, integration down and the special-element computation. Supply the genuine cyclotomic K-theory symbols and their spanning, complex regulator/rank and idempotent dimension interfaces. The current named regulators and `reg` formulas do not discharge this chain; importing higher-tier PadicHodgeRegulators or BorelRegulators violates the tier rule.
5. **Coefficient-valued Artin interface.** The old assertion that no complex Artin owner exists is now corrected by AA.2.4. Import its complex representation theory and meromorphic germs. Plan only E-valued assembly, coefficient/realization functoriality and the p-adic parity/Brauer induction and independence needed by L3.16. The packet's gap must be narrowed accordingly rather than deleted wholesale.
6. **Higher-pole tangential normalization.** Constant term of general Laurent germs is not multiplicative: CT(t^-1) CT(t)=0 while CT(1)=1. A change t'=t+a t² changes the constant term of t^-1. Either justify a logarithmic H1 basis or develop full-parameter regularization, shuffle and parameter-change laws. Keep simple-pole/tangent and regular-log endpoint hypotheses until that development supplies the stronger result.
7. **Dyadic comparison.** The typed Dirichlet L-function formula assumes p odd, while BBdJR Proposition 4.17 includes p=2. Supply torsion modulo 4, principal units 1+4Z_2, pure 2-power and trivial-character formulas, and the regulator normalization before asserting its full scope.

ColemanIntegration is tier 15, bundled with ComputationalNumberTheory and DirichletPadicLFunctions. The existing draft's downward ownership requirements remain: L0.F rational coefficients (now specified); L2.Fa complex boundary values; L2.Fb field-general Bloch/projective algebra (quotient, boundary, branch and cyclic comparison forms now specified); L3.Fa cyclotomic motivic input; L3.Fb syntomic/Gros comparison; L3.Fc complex regulators; and L3.Fd the additional coefficient/p-adic Artin interface. Higher-tier Polylogarithms, PadicHodgeRegulators, BorelRegulators and AutomorphicPadicLFunctions must import the completed lower ownership where applicable. **Do not move AA.2.4's existing complex Artin theory:** it is an upstream supplier, never a new local owner.

No ownership change was applied to a packet, link map or order file. The maintainer must reconcile these requirements with the accepted source of truth. Remaining lower/bundle inputs are AS-F1/AS-R2, PH-P7, RD0/RD4–RD6, PM2/PM3, LA1 and DP0–DP3 as listed in the README. Read their exact contracts before treating a request as discharged.

## Resume order

1. Authorize and route the accepted-plan repairs, narrowing the complex Artin gap to the additional coefficient/p-adic requirements and preserving the remaining scope restrictions.
2. Develop and independently assess the mathematical repairs and the remaining local foundations. Begin with gap 1's exact comparison contract and gap 2's direct sheaf/gluing construction; independently assess the new gap 3 projective interface, retaining the integral carriers and branch-pair formula. Keep source proofs, exact hypotheses, API and three discriminating tests per new definition together.
3. Reconcile the package against that accepted repaired plan, keeping the 177 original targets and the existing Teichmuller twist, arithmetic q-Frobenius, C_p constant field, simple-pole and uniform-coordinate qualifications.
4. Repeat target/API/test and footnote correspondence, intake validation and the final whole-file `lean-check`; stay below 200,000 bytes.
5. Add `metadata.toml` and submit a complete package for independent review only after closure is established.

The original target table below is inherited from the previous checkpoint so a continuation can find every accepted target after scratch is deleted.

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

- `README.md`: 199951 bytes; SHA-256 `9c3873a83db22f5fde2c66ff63d3ca2c05ceaf922070f67044fd7554cc2d67b0`.
- `Suggested.lean`: 163738 bytes; SHA-256 `468ee456f7ba64dd8f027aa3ef1147d4a1dc6dca10602bf82ba7b06721e2f991`.
