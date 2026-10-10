# PKG-ColemanIntegration — blocked checkpoint

Codex, session `codex-ekFPQM`, 10 October 2026. Issue [#7535](https://github.com/CBirkbeck/tauceti-explorer/issues/7535). Bot confirmation: [comment 6098922623](https://github.com/CBirkbeck/tauceti-explorer/issues/7535#issuecomment-6098922623). Branch `codex-ekFPQM-coleman-integration`.

## Status and binding scope conflict

**Checkpoint; the package remains incomplete.** This continuation improves the rational coefficient interface and removes an upstream duplication. It does not certify closure of the accepted plan.

The issue calls its input a complete plan, but the packet's accepted review explicitly accepts a completed target-level planning pass with open inputs. Its seven `gaps` and 23 `requests` are still present; the checker reports four planned stages and zero closed stages. Several gaps explicitly instruct a continuation to add mathematical nodes to the packet. The issue allows only the package's three files and this handoff and says: **“Change no packet; if the plan has a mistake, describe it in the handoff note.”** PROTOCOL sections 3 and 20 require prerequisite closure and a package supported by the accepted plan. The current scope cannot both repair that source of truth and package a repaired accepted plan. This is a scope blocker, not a timeout or compilation failure.

A complete submission needs an authorized planning repair and its independent assessment, especially for the general-curve and motivic chains listed below. Merely inserting names for the missing types, assuming the regulator formula, or declaring metadata does not provide that repair. The existing locally numbered foundations F/Fa/Fb/Fc/Fd remain requirements except for the now fully specified rational coefficient interface L0.F.

`metadata.toml` remains absent so the draft is not classified as a complete package. When the mathematical repairs are accepted, create it with `topic = "math.NT"` and finish packaging. Do not treat that file as the sole remaining work.

## Work in this continuation

- Read WORKERS, both protocols, UPSTREAM_GUIDE, the issue, previous handoff, accepted packet's review/coverage/gaps/requests, its independent review report and the four-layer library audit. Read current upstream ArithmeticDirichletSeries and Completed/ContourIntegration in full for form and density.
- Searched current TauCetiRoadmap and current Tau Ceti source trees, including the post-snapshot roadmaps, for Coleman integration, polylogarithms, syntomic regulators and Artin L-functions. The syntomic morphism API in Tau Ceti is not rigid syntomic cohomology. Coleman hits in power-series files are provenance of earlier Chabauty code, not an integration theory.
- Found the existing **AdelicAlgebraicGroups, AA.2.4, convergence-factors** contract. Read its README contract and `FiniteImageArtin.localFactor` in Suggested.lean: it is the inverse determinant of `1 − q^(−s) Frob` on the inertia-fixed space. The README also owns ramified induction, the convergent Euler product, finite-order Artin–Hecke comparison and meromorphic germs. Updated the dependency table and L3.Fd to import this complex theory. Do not construct it again in ColemanIntegration. Coefficient-valued assembly over the embeddings of E, and the p-adic Brauer/parity interface, remain additional requirements; the upstream complex theorem does not supply them.
- Completed L0.F's prototype with six API theorem signatures: Euler differentiation at every integer weight, uniqueness from the Euler derivative and zero constant term, geometric weight zero, the correct substitution into Mathlib's log(1+X), scalar coefficient transport and composition through any homomorphism of Q-algebras. Added three distinguishing examples to the inherited three coefficient examples: the positive cubic coefficient at weight one, the negative-weight geometric derivative, and the complex image of the weight-two quadratic coefficient. Kept all proofs as suggested `sorry` forms.
- Corrected L0.F's Furusho locator. The integer-weight rational series is in **§2, Remark 2.29, p.14**, not §3.1 (which starts on p.15 and concerns the associator). The depth-one specialization gives q_k. The differentiation/uniqueness/transport laws are coefficientwise deductions, with no analytic convergence assumption.
- Matched the README's L0.F API and six tests to the Lean forms. Condensed only introductory and boundary prose to retain the package's 200,000-byte limit. All 177 original targets, 257 original API assertions and 152 original test names remain represented. No packet, reader input, supplier, library source or atlas data was edited.

## Checks and provenance

- `python3 scripts/check_blueprint.py research/blueprint/packets/ColemanIntegration.json`: **0 errors, 0 warnings**. Counts: 177 nodes, 257 API items, 134 definition/construction test records, 22 planets, 124 baseline declarations, 23 requests, seven gaps; four planned stages, zero closed stages. The other 18 test records are on lemma nodes, giving 152 overall. The packet is unchanged.
- Whole-file `lean-check research/blueprint/packages/ColemanIntegration/Suggested.lean`: **exit 0; zero errors; 386 warnings, all `declaration uses sorry`; no other warnings**. Memory available before the check was 101 GB. The final comment edits only describe the upstream dependency; they change no elaborated declaration. No library build, update, cache fetch or language server was run, and no compilation remains running.
- Shared build Mathlib HEAD is `082e2d37e8b0463410cdb532e111cd43d5a66174`. Compared the imported Tau Ceti LogOneAdd/Basic source and LocalField/Teichmuller source byte-for-byte against the git objects at `f790474821cf4256814db967cb154e7af3d0c369`: both match. Read the native PowerSeries coefficient-map, derivative and formal-logarithm statements used by the new forms at the pinned Mathlib. This is not a fresh certification of all 124 inherited baseline entries.
- Mechanical correspondence: 177 unique original target anchors, with 25/44/71/37 in L0/L1/L2/L3; all 257 original API names remain in the README; all 152 original test names remain in Lean; no dangling source/hypothesis footnotes. Names written locally inside namespaces or as structure fields need not appear as their fully qualified strings in Lean; those inherited local declarations were checked separately. Six new rational API names are present in both files.
- `python3 research/blueprint/intake.py check-files` on the three changed deliverable paths: **0 problems**. `git diff --check`: passed.

Fresh source reading was confined to Furusho v2 §2 Remark 2.29, p.14, and RJW v2 §6.2 Remark 6.6/Theorem 6.7, pp.38–39, for the rational interface and locator. Public PDFs were obtained on 10 October 2026:

| Source | Public URL | SHA-256 |
|---|---|---|
| Furusho v2 | https://arxiv.org/pdf/math/0304085v2 | `fd2391bd4dbf328667f0fb1b46d979c4814892c2c2cd14051de8d674d4c5b9fb` |
| RJW v2 | https://arxiv.org/pdf/2309.15692v2 | `efa1e10168fb092ffb072bbf147f85f07bea72d2a8f4907d6e9e4fd559c039c4` |

Both match the accepted source register. Other source statements retain the accepted review's provenance; this continuation does not claim to have reread their proofs. No book was used; the cleared library index was read. No source passage or PDF is included in the repository.

The current upstream roadmap tree read was commit `3c18d9fbfceed0dc5c1edb1070a3927152d19e28`; the current Tau Ceti tree searched was `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. These are read-only overlap checks, not replacements for the pinned compilation baseline.

## Repairs needed before completion

1. **General-curve de Rham comparison.** Add the exact algebraic/dagger comparison for a smooth good-reduction affine curve, an algebraic differential basis, and dimension `2g + #D − 1`. The explicit punctured-line computation and rigid-cohomology finiteness do not give it. The packet itself directs adding a node here or an exact permitted RD4 request. Source leads: Baldassarri–Chiarellotto; Kedlaya's hyperelliptic reduction algorithm supplies a special case, not a general-curve proof.
2. **Nonfree differentials and gluing.** Add the direct Coleman sheaf property, affine covers with integral etale coordinates, restriction and overlap laws, uniform divided-derivative bounds and the cross-map Taylor estimates, then glue lift independence and pullback. Besser's Tannakian Proposition 4.21 does not automatically prove the sheaf property for this direct word realization.
3. **Field-general projective/Bloch comparison.** Define the genuine pre-Bloch quotient, prove all projective/infinity cases and construct the boundary in the antisymmetric tensor quotient. Keep its 2-torsion; alternating exterior squares and de Jeu's further quotient differ. Prove branch-change descent on the Bloch kernel. The scalar p-adic five-term identity is already decomposed, but a complex theorem cannot be transported to C_p by changing the field name.
4. **Syntomic regulator proof.** Develop BDJ §§3–7 for Theorem 1.10(2): multi-relative K-theory, localization, relative Chern classes, rigid syntomic cohomology, integration down and the special-element computation. Supply the genuine cyclotomic K-theory symbols and their spanning, complex regulator/rank and idempotent dimension interfaces. The current named regulators and `reg` formulas do not discharge this chain; importing higher-tier PadicHodgeRegulators or BorelRegulators violates the tier rule.
5. **Coefficient-valued Artin interface.** The old assertion that no complex Artin owner exists is now corrected by AA.2.4. Import its complex representation theory and meromorphic germs. Plan only E-valued assembly, coefficient/realization functoriality and the p-adic parity/Brauer induction and independence needed by L3.16. The packet's gap must be narrowed accordingly rather than deleted wholesale.
6. **Higher-pole tangential normalization.** Constant term of general Laurent germs is not multiplicative: CT(t^-1) CT(t)=0 while CT(1)=1. A change t'=t+a t² changes the constant term of t^-1. Either justify a logarithmic H1 basis or develop full-parameter regularization, shuffle and parameter-change laws. Keep simple-pole/tangent and regular-log endpoint hypotheses until that development supplies the stronger result.
7. **Dyadic comparison.** The typed Dirichlet L-function formula assumes p odd, while BBdJR Proposition 4.17 includes p=2. Supply torsion modulo 4, principal units 1+4Z_2, pure 2-power and trivial-character formulas, and the regulator normalization before asserting its full scope.

ColemanIntegration is tier 15, bundled with ComputationalNumberTheory and DirichletPadicLFunctions. The existing draft's downward ownership requirements remain: L0.F rational coefficients (now specified); L2.Fa complex boundary values; L2.Fb field-general Bloch algebra; L3.Fa cyclotomic motivic input; L3.Fb syntomic/Gros comparison; L3.Fc complex regulators; and L3.Fd the additional coefficient/p-adic Artin interface. Higher-tier Polylogarithms, PadicHodgeRegulators, BorelRegulators and AutomorphicPadicLFunctions must import the completed lower ownership where applicable. **Do not move AA.2.4's existing complex Artin theory:** it is an upstream supplier, never a new local owner.

No ownership change was applied to a packet, link map or order file. The maintainer must reconcile these requirements with the accepted source of truth. Remaining lower/bundle inputs are AS-F1/AS-R2, PH-P7, RD0/RD4–RD6, PM2/PM3, LA1 and DP0–DP3 as listed in the README. Read their exact contracts before treating a request as discharged.

## Resume order

1. Authorize and route the accepted-plan repairs, narrowing the complex Artin gap to the additional coefficient/p-adic requirements and preserving the remaining scope restrictions.
2. Develop and independently assess the seven mathematical repairs and the local foundations; keep source proofs, exact hypotheses, API and three discriminating tests per new definition together.
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
