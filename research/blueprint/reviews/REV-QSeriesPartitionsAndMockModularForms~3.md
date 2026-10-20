# Independent review of revision 3: QSeriesPartitionsAndMockModularForms

**Verdict: needs_changes. This is a completed review.** Codex, session `codex-Rzt2Nq`, reviewed [issue #10883](https://github.com/CBirkbeck/tauceti-explorer/issues/10883) independently of the three blueprint rounds. Clear corrections are applied to the packet and reader. The negative verdict concerns existing contracts with a missing non-routine proof step or an exact supplier mismatch. The honestly partial layers and their precise future-target lists do not cause rejection.

The input commit is `bd5a32fbe0247ab616097dbcd6b4ee40a096f90f`; the input packet SHA-256 is `545ebd4f1e747b3a8680d92bb1fc7cbd8a2342ca7aa38e640b898993bd53a29e`. The [claim bot confirmed this session](https://github.com/CBirkbeck/tauceti-explorer/issues/10883#issuecomment-6298147675). The worker, blueprint, expansion and upstream rules, full issue, preceding review and revision handoff were read. Earlier whole-plan and bounded reviews remain unchanged in `reviewHistory`.

| Checked item | Result |
| --- | --- |
| Existing nodes | All 537 checked once: 483 verified, 11 corrected, 43 unverifiable |
| Node changes | 12 existing contracts corrected; one still has a separate proof gap; none added or removed |
| Kinds | 113 definitions, 17 constructions, 250 lemmas, 153 theorems, 4 comparisons |
| Baseline | All 420 declaration statements confirmed at the pins; none removed or replaced |
| Definitions and constructions | All 130 APIs and tests checked; 774 API items and 514 tests; minimum 3 tests per object |
| Whole packet API/test inventory | 792 API items and 527 tests, including items attached to other node kinds |
| Sources | All cited passages in 57 sources checked; 658 distinct node/source locator records |
| Source findings | All 88 inherited findings freshly checked; E628 added; final 86 confirmed and 3 rejected |
| Dependencies | 1,279 internal prerequisite edges, acyclic; all 27 supplier requests compared with their suppliers |
| Gaps and planets | 19 explicit gaps retained; 42 planets, 6 per layer |
| Native file | Unchanged, 176 lines; 7 light definitions, 9 theorem signatures, 13 proved examples |

The packet contains the fresh verdict on every node, baseline declaration and source finding. The audit distinguishes a supported local planning contract from a completed implementation. No declaration is certified formalised by this review.

## Revision-3 replacement arguments

The five replacement proof routes are justified at target-planning depth. Their original missing steps are not silently imported from a source that merely asserts them.

| Node | Independent check |
| --- | --- |
| `QM.4/residue-function-modularity` | Substituting a rational characteristic in the elliptic/modular laws and calculating the phase on the stated congruence subgroup proves the transformation claim. No cusp-growth theorem is inferred from transformation laws alone. Zwegers Proposition 3.11, printed p.64. |
| `QM.5/gamma-vertical-decay` | Finite Euler summation gives the analytic logarithm of Gamma and a bounded periodic-Bernoulli integral remainder. The bound is uniform in the right half-plane; taking real parts and using recurrence transfers the relative estimate to compact vertical strips. This supplies both upper and eventual positive lower bounds. Brent §2, equations (5)–(12), Theorem 1, pp.3–5; the finite-sum derivation supplies the book-referenced step. |
| `QM.5/incomplete-gamma-mellin-poles` | Absolute Fubini in the initial intersection of half-planes gives the incomplete-beta integral. The substitution to an integral on [0,1], finite Taylor subtraction and Gamma recurrence give meromorphic continuation and residues. The Euler integral continues along the negative segment to −1 without evaluating an out-of-disc power series. Bringmann–Rolen Lemma 3.2 and §3, pp.8–11. |
| `QM.6/lattice-vertex-algebra-invariant-form` | Roitman's construction uses the vacuum functional annihilating L₁ of weight one. Momentum preservation and oscillator degree give local nilpotence even for an indefinite lattice. Moving oscillator modes across the form proves nondegeneracy on finite momentum/oscillator blocks, without finite-dimensional total weight spaces or the unavailable Dong/FHL route. Roitman Proposition 2 and Theorem 1, pp.4–7; Jurisich Lemma 6.1, pp.28–29. |
| `QM.6/no-ghost-transverse-generation` | Rechecked the PBW commutator argument at zero current and mixed central charges and nonzero K₀ eigenvalue. Lowest current degree excludes singular vectors; the induced contravariant form is then nondegenerate level by level. The finite-grade induction can therefore split the descendant space. It does not infer restricted nondegeneracy from ambient nondegeneracy. Billig Lemmas 2–3, pp.5–7; his Theorem 1, which has a different central-charge hypothesis, is not applied. Jurisich Appendix A.3, p.36. |

The repaired lattice-form and transverse-generation arguments also justify the local transverse, spurious, physical-quotient, no-ghost and Monster-Lie construction contracts. The latter constructs the object from the stated moonshine-module axioms; it does not construct FLM's module or identify its group with the presented Monster. Eleven formerly unverifiable nodes now have justified local routes, including the formal definition/equivalence discussed below. The Gamma part of `twisted-l-function-vertical-growth` is repaired, but its exact scalar Fricke input remains open.

## Corrections applied

Indices are the unchanged zero-based packet node indices. The packet audit lists their full ids.

| Nodes | Correction |
| --- | --- |
| 80, `ligozat-cusp-order` | Required N≥1 for the Γ₀(N) cusp-width formula. Divisibility of the eta support alone permits N=0, which does not have the claimed finite-index cusp-width description. Positive divisor representatives are explicit. Savitt §1 and Appendix A; Kong–Teo cusp-order calculation. |
| 108, `jacobi-form` | Restricted the index-zero comparison with Mₖ to integral weight and trivial multiplier and elliptic character. General multiplier spaces do not become the untwisted Mathlib modular-form space. DMZ §4, pp.20,23–25. |
| 180, `xi-operator` | Added real C¹ regularity for the product-rule raising identity and the equivalence between zero ξ-image and holomorphy. An arbitrary function with totalized derivatives does not satisfy that kernel theorem. Bruinier–Funke Proposition 3.2, p.10. |
| 308, `meromorphic-jacobi-transformation-laws` | Qualified the compatibility statement and test by Jₖ,ₘ(1,1). A form with a nontrivial multiplier or elliptic character satisfies twisted laws. Zwegers §3.1, pp.51–52. |
| 321, `real-analytic-residue` | Replaced an undefined naive Laurent-coefficient assertion by an actual derivative distinction: for the extended product conjugate(v−u), its Wirtinger derivative is zero and its real-direction derivative is one. This catches a wrong residue operator. Zwegers Definition 3.8, p.59. |
| 361–363 | Allowed possible poles of order at most one and removable zero-residue cases in both Mellin arguments. The zero cusp form is an immediate test. This applies the already confirmed E621 consistently; it does not change the asymptotic coefficients. Bringmann–Rolen §3.1–3.2, pp.8–11. |
| 400–401 | Required 1≤a<b and 1≤h<k, with the positive auxiliary integers and coprimality conditions stated explicitly. The source's local hypotheses allow a=b=1, yielding a 0/0 root ratio and a lattice pole of μ. The guard matches its main Theorem 1.2. The R-dissection proof gap remains at node 400. Folsom–Ono–Rhoades Theorem 3.2 and Proposition 3.3, pp.19–20; new E628. |
| 441, `no-ghost-theorem` | Explained the degree-zero form scale b=(1,1)ᵥ≠0. The lattice-plane summand initially has b times its standard hyperbolic form; rescaling one hyperbolic basis vector by b⁻¹ gives the stated isometry. No vacuum normalization is assumed. Jurisich Theorem 6.2, pp.32–34. |
| 456, `completely-replicable-function` | Added the formal Faber-polynomial/logarithm coefficient argument for Norton's equivalence. Finite root-of-unity sums descend coefficientwise over a characteristic-zero field; analytic τ-substitution is not part of that definition. This definition is independent of the unresolved general Monster presentation. Borcherds §8, pp.24–26. |

The old E202 review reason incorrectly described Theorem 5.3: it is Euler's pentagonal identity, not an eta-quotient theorem. The fresh reason corrects this while preserving the historical record. E206's fresh reason uses the reindexed fractional part and its denominator k, avoiding the predecessor's inaccurate description of the printed numerator. The broken Andrews–Garvan landing URL was replaced by the actual first page PDF, with links and hashes for all five page files.

The reader now reproduces every node's statement, hypotheses, prerequisites, proof steps, declaration name, API, tests and acceptance conditions from the corrected packet. In particular it incorporates the previously excluded bounded topology correction: the full Kontsevich lower-boundary multiplier, its negative-central-sign case and the direct eta transformation, nonvanishing and denominator-cocycle inputs. Source findings and acquisition receipts are synchronized as well. No suggested signature is affected by these twelve repairs.

## Preceding review and ownership findings

All 37 entries in `round2ReviewSummary.correctedInputNodeIndices` were compared with the present contracts, reader and compact native-file boundary. The following groups cover every entry.

| Round-2 indices | Disposition in this review |
| --- | --- |
| 82, 226, 236, 238, 250 | Corrected source locator, positive seed index, effective-coset normalization, strict Fourier-period divisor and unspecified off-domain Appell value are retained. The compact file makes no removed heavy-carrier assertion. |
| 277, 288, 295, 299 | Rectangle bounds use the current contour theorem; coincident rays, the positive real auxiliary form and the absolute-Jacobian distinction are retained. |
| 321, 322, 347 | Positive pole order, punctured holomorphic extension and the odd-periodic zero-value guard are present. The extra residue-test repair is recorded above. |
| 350, 352–354, 365, 366, 372, 375 | Lower-boundary branches, genuine construction tests, zero periods and the −2φ(24x) comparison are present. The complete corrected factor at −I is now in the reader; the analytic multiplier extension remains open. |
| 358–360 | Finite-strip Mellin scope and the denominator lower-bound requirement are retained. The new Euler-summation argument now supplies that quantitative Gamma input; the scalar half-weight Fricke comparison remains separate. |
| 384, 385 | The coefficient (60i)^(−1/2), positive Fourier phase and erfc scale agree with direct vertical integration. A representation is now supplied by MP.4; finite image and the exact χ± comparison are still separate. |
| 420, 426, 434, 442, 443 | Matsuo–Nagatomo Theorem 5.4.1 is located at p.35; Cartan/conformal guards, shifted grading and actual group-action laws remain present. The no-ghost replacement now supports the local construction. |
| 449, 451, 459, 473, 478, 482, 483 | Completed-product support, Cartan versus radical distinction, Milne p.58, the Delta slash constant, negative cone and genuine index-13 elliptic test are retained. The general Serre and analytic J comparisons remain open. |

RT-AREA-automorphic-1/20 is respected: MP.6 owns generic Jacobi theory, QM.1 owns the rank-one dictionary and applications, MP.8 uses its cover specialization, and only the verified AutomorphicCongruences L2s consumer is asserted. The MP.6 requests still specify the missing discrete, matrix-index, half-index and growth comparisons. An accepted bounded supplier fix does not establish those adapters.

RT-AREA-topology/13 is respected: QM.5 owns the weak scalar predicate, the conditional scalar cocycle law and the q-series examples. QT.7 retains knot-specific and matrix-valued laws, with the matrix interface explicitly requested from Part II. Scalar additive period theory is not substituted for a matrix multiplicative law. The central-sign check gives epsilon(−I)=−i and lower factor i, hence product 1. Root evaluation, formal Taylor expansion and analytic radial limits remain distinct. This review changes no live ownership edge or other roadmap.

## Remaining obligations

The 43 `unverifiable` entries in `review.checked` name the existing affected contracts individually. The following are the exact repair boundaries, rather than a request to finish every honestly unplanned extension.

| Node indices | Missing input |
| --- | --- |
| 125 | Exact classical finite-Weil/theta-decomposition and Jacobi-supplier comparison, beyond the representation itself. |
| 150–155, 488, 522 | Complete Dedekind-phase/Jacobi-symbol congruences and the Selberg–Whiteman Fourier/H-sum bridge, including nonunit and singular cases. |
| 300, 303 | Shifted multivariate real Poisson summation with the stated Gaussian normalization, beyond adelic Schwartz–Bruhat Poisson. |
| 359 | Exact scalar half-weight Fricke/functional-equation comparison; quantitative Gamma is now available locally. |
| 375, 384, 385 | Character/multiplier rational-boundary extension and finite-image/congruence-kernel plus χ± subrepresentation comparison for Z/60Z with Q(r)=r²/120. |
| 381–383 | Exact Poincaré-sphere finite WRT and Ohtsuki comparison with the general QT/Habiro contracts. |
| 392, 393, 396, 399, 400 | Winquist/11-dissection, Atkin–Swinnerton-Dyer dissections, Choi's identity and the required Bringmann–Folsom R-dissection/cancellation estimates. |
| 409–413 | Exact scalar Kohnen and finite-Weil comparison for the trace chain. |
| 418 | Arbitrary-ring alternation and divided-translation argument. Self-skew symmetry only kills twice the self-bracket. |
| 445, 447, 452–455, 458 | General Borcherds Serre/radical and root-pairing input, with its downstream presentation uses. The restricted negative-pairing free-subalgebra theorem is insufficient. |
| 459, 462, 464, 465 | Exact analytic JInputs identification and the all-positive-index weight-zero weakly holomorphic Hecke normalization. |
| 469 | Arithmetic congruence containment for moonshine-type Fuchsian overgroups. Existing quotient/degree geometry is sufficient for its actual scope. |
| 475, 476 | FLM module and Monster identification, finite character data, and Conway–Norton function/replicability comparisons. |

Hickerson and fifth-order Eulerian identifications remain honestly recorded source obligations. Their explicit sum definitions and transformation targets are not rejected merely because those later identifications are absent. QM.4 remains planned, with its represented target routes terminating in the explicit gap register where appropriate; the other six stages remain partial with precise remaining lists. None is closed. Packet `complete` records the finished inherited planning pass, not mathematical closure or a fresh expansion beyond its inherited node budget.

## Baseline, suppliers and sources

All 420 baseline declarations were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Generated additive declarations, namespace qualification, hypotheses and consumer conventions were checked. No citation needed removal or replacement. These confirmations do not attribute a complex-parameter, shifted-Poisson or scalar-metaplectic extension to a declaration with a narrower statement.

Current read-only TauCetiRoadmap was checked at `0d144d044dacebca17b654695b6f1ad58f159b27`, and the current library at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. IntegralLattices Layer 6E supplies the rootless rank-24 Leech reference lattice. ContourIntegration Layer 3 and `TauCeti.Contour.classicalResidueTheorem_nullHomologous`, `Cycle.lean` lines 226–234, supply the contour service. Both are current imports, not invented declarations at the historical pin. Neither checkout was edited or built.

All 27 requests were compared with actual supplier statements. This included MP.4/6/7, AdelicAnalysis Poisson, Habiro HC.1/3/4, quantum-topological QT.3/4, ClassicalArithmeticCompletion Farey input, ModularForms, FuchsianOrbifolds and LieHighestWeight. The current MP.4 finite-Weil representation repairs the predecessor's operator-only boundary; it does not by itself prove a congruence kernel or identify the two Lawrence–Zagier character vectors. Neighboring upstream ModularForms and FuchsianOrbifolds suggested files were read to check the native-file shape. The library audit was checked for existing partition, power-series, eta, analytic and lattice services; no duplicated library target or new ownership layer was introduced.

Every source was opened at the locators its nodes or findings cite, with adjacent arguments needed for the comparison. This is not a full-text or historical-version collation. The 57 fresh acquisition records retain the actual URL and hash where available. Historical hashes remain as historical evidence, including files whose currently served bytes differ. The Andrews–Garvan author scan uses five page files; the cited mathematics on printed pp.167–170 was read and all five file hashes are recorded. No restricted book or source passage was copied into the repository.

All 88 inherited source verdicts agree with the fresh checks: E205, E509 and E618 remain rejected. E605 is confirmed. The independent Hardy–Ramanujan diagnostic used exact rational Dedekind sums and 85-digit Decimal arithmetic, giving third term −87.5839128707296629… and first-eight total 3972999029387.975671134175… . It is not an interval enclosure. The BOR constant is exactly −65520/691, approximately −94.8191027496382055. Findings remain scoped to the versions actually inspected. New E628 concerns the published FOR local asymptotic domains; a bounded public author/publisher errata search found no correction in the inspected results, not proof that no correction exists.

## Validation and disposition

`check_blueprint.py` reports **0 errors and 0 warnings**. The complete ledger, all fresh source/baseline verdicts, unchanged node ids, all 537 reader contracts, API/test presence and minimum-three-tests rule were checked mechanically. `check_sorry_data.py`, intake `check-files` and `git diff --check` pass.

The unchanged suggested file elaborated with `lean-check` in the shared pinned build: **exit 0; nine warnings, all uses of `sorry`; no other diagnostics**. Its SHA-256 is `a3be98503ef9dbb782b4e654e4392b891e3405be51385548da7dead354d6519d`. Its thirteen examples are proved; its nine theorem signatures remain admitted proposals. No heavy carrier or data definition is admitted. Elaboration does not prove the nine theorems.

The orchestrator should route a mathematical revision to the 43 precise existing obligations, preserving the successful replacement arguments and the reader synchronization. The coarse MP/QM stage cycles still require the maintainer's integration of independent theta/special-function prefixes; this review does not reverse ownership edges to hide real inputs. The shorter campaign specification remains outside this issue's files and may need its historical MP.8 Jacobi account updated in an authorized job. No permission or ownership decision is needed to retain the corrections submitted here. The [handoff](../handoff/REV-QSeriesPartitionsAndMockModularForms~3.md) records the durable resumption points.
