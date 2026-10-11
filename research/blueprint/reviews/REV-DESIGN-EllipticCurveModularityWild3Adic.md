# Independent review: the wild three-adic BCDT route

Accepted after corrections, 2026-10-11. Reviewer: Codex, session `codex-BkLWWH`, job `REV-DESIGN-EllipticCurveModularityWild3Adic` (#7105). The design was written by the separate `codex-DAAICL` session and submitted in #8806. This review covers the new roadmap definition, packet, reader and suggested file.

The final packet has 55 nodes: 8 definitions, 10 constructions and 37 theorems. Its review records 52 verified and 3 corrected nodes; no nodes were added or removed. All 14 baseline citations were confirmed, with none removed or replaced. There are 82 API items, 67 tests on definitions/constructions and one additional theorem counterexample, 38 planets, 16 supplier requests and 16 independently confirmed source findings. All seven stages are planned. The packet is a complete planning pass, with one explicit full-signature gap, `G-LEAN`; it claims no formalisation of the roadmap's targets.

## Corrections made

1. **Extended-model exhaustiveness.** `W3.5/extended-model-classification` had classified every cyclotomic residual extension, including split ones. BCDT Theorem 4.6.1(3), p.877, concerns the fixed très ramifié residual representation; the exclusions in Proposition 9.2.1's proof, pp.922–923, contradict nonsplitting. The statement now fixes that full-G₃ residual representation. The four individual generic-Ext isomorphisms still cover every parameter, including zero, within their respective families. A split model `M′_{2,1} ⊕ M′_{2,ω}` satisfies the special-fibre ideal condition but has weight pair `(2,2)`, outside the four families. Added that counterexample as a test and acceptance criterion, and synchronized the reader and Lean contract index.
2. **Exceptional forward filtration.** The native `extendedSixSixFiltration` incorrectly used `cu² + c′u⁶`, the diagonal self-extension polynomial of Lemma 9.3.4, pp.930–931. The forward family in Proposition 9.2.1(4), p.921, uses `c + c′u⁴`, as the packet already stated. Corrected the native definition, added the `c=1, c′=0` unit-cross-term test and proved its native filtration membership example without an admitted proof. Synchronized the test in the packet, reader and index.
3. **Lifting pagination.** Corrected the locators for BCDT Theorems 1.4.1–1.4.2 from pp.856–857 to pp.857–858 in the endpoint node, supplier request and reader.
4. **Elliptic supplier boundary.** Narrowed the EllipticCurves Layer 4 request to local reduction, family torsion calculations and CDT Proposition B.4.2's cross-prime comparison, pp.563–565. The cubic examples are Manoharmayum §5.3, Lemma 5.3.1 and Theorem 5.3.2, pp.750–751; the quadratic/extended families are §5.4 and Theorem 5.4.2, pp.751–753. The two-prime assembly of BCDT Corollary 2.3.2 and the exact extended Frobenius sign remain outputs of W3.1. The supplier is no longer asked to prove its consumer's local companion theorem.
5. **Current library reuse.** Narrowed the ClassFieldTheory Layer 5 request to the Q₃ dimension, unit/peu line and unramified pairing specializations. Current Tau Ceti already proves general Kummer equivalences and finite-module local duality; those are reused when the pin advances. Recorded this distinction in the request, reader and `upstreamNotes` without changing the pinned baseline.
6. **Source-version evidence and verdicts.** Added top-level `sourceVersions`, with public URLs, read date, hashes and version scope. Added an independent verdict to every finding. Scoped E4's Γ₁ point to a notation explanation, alongside the definite lemma-reference typo. Corrected E5's explanation to identify the quadratic dimension-bound theorem. E15–E16 remain explicitly restricted to the SBT author copy. Updated coverage notes to remove the now-completed hypothesis review from the remaining work.
7. **Review synchronization.** Added all 55 node verdicts to the packet, retained its complete/planned statuses and explicit signature gap, and updated the roadmap's embedded reader to exactly match the reader file. No roadmap layer, ownership allocation or planet was added.

## Sources and source findings

Only public texts were used. The read versions and hashes are in the packet:

- BCDT: the [archived published JAMS PDF](https://web.archive.org/web/2023id_/https://www.ams.org/journals/jams/2001-14-04/S0894-0347-01-00370-8/S0894-0347-01-00370-8.pdf), pp.843–939, with the [author copy](https://virtualmath1.stanford.edu/~conrad/papers/tswfinal.pdf) as a comparison. Published pagination governs the BCDT findings and node locators.
- CDT: the [author-hosted paper](https://virtualmath1.stanford.edu/~conrad/papers/cdtmaster.pdf), especially Theorems 7.2.1 and 7.2.4 and Appendix B.
- Manoharmayum: the [published MRL paper](https://archive.intlpress.com/site/pub/files/_fulltext/journals/mrl/1999/0006/0006/MRL-1999-0006-0006-a012.pdf), pp.735–754.
- Shepherd-Barron–Taylor: the [author copy](https://math.stanford.edu/~rltaylor/klein.pdf), with the twisting proof read at its own pp.3–4. The bibliographic published locator remains pp.285–286; the two reported label mistakes were checked only in the author copy.

Every node's cited mathematical contract was checked at its locator, including variance, arithmetic reciprocity, corrected wild descent, full versus inertial types, and the residual and determinant hypotheses. No source passages were copied into the deliverables.

| Findings | Independent conclusion |
| --- | --- |
| E1, p.866 | The target of the elliptic three-torsion representation is GL₂(F₃). |
| E2–E3, pp.900–902 | The involution has order two; the negative-field calculation must use its own field labels. |
| E4, p.899 | Lemma 5.2.1 is mislabelled as a theorem. Γ₁ denotes the first ramification subgroup implicitly; this part is a notation clarification. |
| E5, p.918 | The quadratic vanishing argument gives Theorem 4.7.4 and its dimension consequence Theorem 4.5.1. |
| E6, E10, p.910 | The two rank-four descent labels must preserve the four-vector basis and the earlier rank-three submodule. |
| E8, p.939 | Tate and Tunnell share a reference tag; author-qualified references disambiguate them. |
| E9, p.902 | `(α−1)/β` has valuation `1/12` and norm `−3`; `α/β` has valuation `−1/4`. |
| E11, p.908 | The weight-two self-extension uses the corrected `u²e′` filtration generator. |
| E12–E13, p.878 | The family is `ρ_N` over F₃ Artin coefficients. The nontrivial specialization requires `N≥2`, as the proof on p.933 itself states. |
| E14, p.879 | Extending an arbitrary endomorphism from `3D` is unjustified. The packet's annihilator proof repairs the step. |
| E15–E16, author p.3 | The field is K in the general projective-line assertion, and the group in the lift is SL₂(F₅). No verdict is given about the published printing. |
| E17, p.744 | The quartic splitting calculation is Proposition 3.5, not item 3.4. |

E14 was also checked independently of the source's argument. For `D = Z/9 ⊕ Z/3`, sending the generator of `3(Z/9)` to the nonzero second summand cannot extend to an endomorphism of D. In the actual filtered-model argument, exact contravariant realization identifies `D[3]` with the module of `G/3G`. Frobenius kills it, and the special-fibre ideal gives `F² = −3`. If `9x=0`, then `Fx` lies in `D[3]`, so `3x=0`. Thus `D[9]=D[3]`; bounded three-primary exponent implies `3D=0`. The passage back to the faithful finite-flat realization and each Artinian coefficient quotient proves the ring is wholly killed by three. This is a mathematical verification; the suggested annihilator theorem still has an admitted proof.

The authors' public copies/publication pages and title/erratum searches were checked for separate corrections on 2026-10-11. None was located in that search. This does not claim an exhaustive search of all literature or a published-version check of SBT. No authors were contacted.

## Baseline, ownership and closure

All declarations were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` or Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`:

| Declarations | What they actually supply |
| --- | --- |
| `Padic`, `AlgebraicClosure`, `IntermediateField.adjoin` | Native field carriers and the generated intermediate field, without an asserted extension valuation or ramification theorem. |
| `AdjoinRoot`, `Submodule.span` | Polynomial quotients and filtration submodules; a quotient is not assumed to be a field. |
| `Matrix.trace`, `AddValuation` | Native trace and additive valuations, with valuation extension an explicit hypothesis. |
| `ContRepresentation` | Continuous linear operators; continuity in the group variable remains an additional condition. |
| `WeierstrassCurve.IsElliptic` | The unit-discriminant elliptic condition. |
| `TauCeti.AbsoluteGaloisGroup` | The native separable-closure Galois group and topology. |
| `TauCeti.ContCohomology.Z1`, `H1` | Continuous cocycles and their quotient; the discrete topology is supplied separately by `DiscreteH1`. |
| `TauCeti.ContinuousCohomology.coeffMap`, `res` | Native TopRep coefficient maps and subgroup restriction. |

The reviewed library audit was checked against these uses. Current upstream was then read separately: TauCetiRoadmap `4d41db8550e23603fb93c65d363a8d521cca9cbe` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. ProfiniteArithmetic and LocalGaloisGroups were read in full, along with the relevant supplier contracts in ClassFieldTheory, LocalFieldsRamification, EllipticCurves and ModularCurves. No general theory from those roadmaps is planned again here.

In particular, current `TauCeti.ClassFieldTheory.kummerEquiv` in `MuNRep.lean` and `dualityMap1_kummerCoeff_bijective` in local `Duality/FiniteModule.lean` have proofs. The Q₃ arithmetic specializations remain a supplier request. Current ModularCurves §5C supplies the fixed-pairing twist and universal family with geometric connectedness conditional; ModularCurvesPartII R12.4 owns discharging that condition and the level-fifteen cover. R13.4a owns the actual rational compactification. Hilbert irreducibility with finite local conditions comes from IG.2, rather than ordinary weak approximation.

Every direct cross-roadmap input was checked against its supplier statement and, where necessary, the precise request. General wild Breuil correction operators and weak/strong filtration exactness remain with R07.1/R07.4; coefficient change, whole-representation category conditions and weak type quotients remain with R08.1/R08.6/R08.3. The parent supplies a proof-independent conditional modularity interface, and the lifting supplier must expose the classical BCDT/CDT contracts independently of an unconditional elliptic modularity theorem.

The direct 55-node prerequisite graph is acyclic. Each of the seven planned stages has its stated target nodes. W3.1 owns local companions before the extended Ext calculations need them, so those calculations do not depend back on the global endpoint. Proof details remain inside target-level nodes. Each definition/construction has at least three discriminating tests, and every API and test was checked. The 38 planets give 5–6 central objects/theorems per stage and fit the existing density limit.

## Validation and remaining work

- `python3 scripts/check_blueprint.py research/blueprint/packets/EllipticCurveModularityWild3Adic.json`: zero errors, zero warnings.
- `lean-check research/blueprint/suggested/EllipticCurveModularityWild3Adic.lean`: exit 0, exactly 45 warnings, all declarations using `sorry`; no other warnings or errors.
- Independent structural assertions: all 55 reviewed IDs are accounted for; the internal direct DAG is acyclic; all stages are realised; all contracts, APIs and tests agree with the reader and Lean index, allowing line wrapping; the embedded reader is identical.
- Source-issue and source-version validators: pass.
- Submission path/JSON checks and `git diff --check`: pass.

No question blocks acceptance. The maintainer should retain the exact Part II supplier requests and the current-upstream reuse note when scheduling packaging. `G-LEAN` records missing full native signatures honestly: the elaborated file contains available native fragments and an explicit contract index, not a completed formalisation. Packaging must preserve that distinction and use the actual supplier carriers when they become available.
