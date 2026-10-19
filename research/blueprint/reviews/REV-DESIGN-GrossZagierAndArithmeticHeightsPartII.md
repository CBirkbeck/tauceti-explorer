# Independent review: Gross–Zagier and arithmetic heights, Part II

**Accepted as a completed target-level planning pass.** Reviewer: Codex, session codex-cGbk3E; review job REV-DESIGN-GrossZagierAndArithmeticHeightsPartII, issue #3542; 19 October 2026. This reviewer did not write the design being reviewed.

All 104 nodes have individual verdicts in the packet: **52 verified, 52 corrected, zero added, zero unverifiable**. All 15 stages are planned and zero are closed. The packet retains 13 explicit gaps and now has 16 precise supplier requests. Acceptance does not discharge these gaps or certify the papers’ unresolved proof steps. It uses the protocol’s definition of a finished planning pass, rather than proof closure.

The reviewed plan contains 48 theorem, 20 construction, 19 definition, 16 comparison and one application targets. Its 39 definitions/constructions have 156 API items, including 39 added in this review, and 117 unit tests, at least three each. Twelve tests were sharpened to detect specific wrong definitions. All 36 planets remain attached to central definitions, constructions or named results. No heavyweight carrier was replaced by an arbitrary predicate or a sorry-filled data definition.

## Sources and baseline

I read every node’s cited locator in the seven public copies recorded in `sourceVersions`, checked their SHA-256 hashes, and checked the statement, hypotheses, conventions, proof outline and `match` against those copies. The locators remain alongside each node and in the reader. The copies are:

| Source | Exact copy used |
|---|---|
| Li–Zhang (LZ) | [arXiv:1908.01701v3](https://arxiv.org/pdf/1908.01701v3), preprint pagination |
| Zhang (Z) | [Annals 193 (2021), 863–978](https://archive.ymsc.tsinghua.edu.cn/pacm_download/21/12000-annals.2021.193.3.5.pdf), published pagination |
| Li–Liu I (LL1) | [20 October 2021 author final](https://www.math.columbia.edu/~chaoli/AIPF.pdf), 67 pages |
| Li–Liu II (LL2) | [16 January 2022 author copy](https://www.math.columbia.edu/~chaoli/AIPF2.pdf), 72 pages |
| He–Li–Shi–Yang (K) | [21 July 2023 author final](https://www.math.columbia.edu/~chaoli/Kramer.pdf), 82 pages |
| Li–Rapoport–Zhang (LRZ) | [arXiv:2404.02214v2](https://arxiv.org/pdf/2404.02214v2), May 2026 |
| Mihatsch–Zhang (MZ) | [published JEMS copy, DOI 10.4171/JEMS/1375](https://ems.press/content/serial-article-files/31452), selected normalization passages |

LL1, LL2 and K author copies were not collated with publisher copies. The review makes no claims about corrections in those uncollated versions. PDF glyph extraction was checked visually where it could turn a weak inequality into a strict one, notably LL2 Lemma 2.56, p.34. No source passages or source files are included in the deliverables.

All **five baseline citations were retained and confirmed**, with zero removals or replacements, at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`:

| Declaration | Module and line | Suitability |
|---|---|---|
| `Polynomial` | `Algebra/Polynomial/Basic.lean:73` | Existing polynomial carrier over a semiring; specialized to rational coefficients here. |
| `Polynomial.C` | `Algebra/Polynomial/Basic.lean:432` | Constant ring homomorphism into that carrier. |
| `Polynomial.X` | `Algebra/Polynomial/Basic.lean:479` | Degree-one monomial with coefficient one. |
| `Polynomial.eval` | `Algebra/Polynomial/Eval/Defs.lean:250` | Evaluation in the coefficient ring, with the argument order used in the witnesses. |
| `Polynomial.derivative` | `Algebra/Polynomial/Derivative.lean:46` | Formal derivative as a linear map; rational coefficients meet its semiring hypotheses. |

The cited Tau Ceti baseline remains `f790474821cf4256814db967cb154e7af3d0c369`; no packet baseline declaration is attributed to Tau Ceti. The reader records this distinction. The polynomial witnesses import existing carriers and use the intended negative derivative at one.

## Corrections to statements and dependency closure

- **U0:** Remove relative flatness from unramified special Cartier divisors; these may be vertical. For independent labels the special-cycle dimension theorem must establish codimension two before the regular-sequence Tor comparison (LZ §2.4, p.11, Lemma 2.8.1, pp.13–14). Add integrality of the complementary lattice to self-dual cancellation (Lemma 2.11.1, p.15).
- **U1–U3:** A finite-field hermitian space is nondegenerate, rather than carrying an inappropriate nonsplit qualification. Include the whole closed stratum among the Tate generators and retain the open complement’s H0 (LZ Theorem 5.3.2, pp.25–26). Add direct prerequisites for primitive degrees and the curve multiplicity calculation. Use the canonical differentiated weight m(0)=0 and m(1)=1; all full-rank contributing types in the nonsplit space are positive odd, so this fixes an unused extension without changing its sums (Definitions 3.5.1–3.5.2, p.17; §7.3, pp.44–45). The geometric horizontal function pairs the full sum of primitive cycles, not just one primitive.
- **U4:** Correct the LRZ locators to Theorem 14.6.2, pp.60–61, Corollary 16.1.5, p.69, and §16.4, pp.70–71. Preserve the comparison-functor dictionary and the distinction between original Y-intersections and degree-normalized auxiliary intersections. The split rank-one test now checks the empty valuation-zero cycle and valuation-two intersection one.
- **U5–U6:** State the exact exotic Tate-homology degree and squared-Frobenius ranges, including the whole stratum (LL2 Lemma 2.32, p.23). Keep U5’s rank-two formula geometric and make its density comparison through U6; the earlier sketch concealed a backward layer dependence. Add the unramified-base-field hypothesis in the relative/absolute comparison (LL2 §2.8, Corollaries 2.65–2.66, p.43). Tests retain both connected components and the actual zero-label complex.
- **U7:** Break the deformation/stratum proof loop. Define the lattice subfunctor before its incidence identification, make deformation a prerequisite of the strata theorem, and separate positive-type coordinate calculations from type-zero reducedness (K Definitions 3.4, 3.7, Lemmas 3.8–3.15, pp.17–25). The geometric Fourier argument uses Howard translation and proper stratum support, followed by trace-dual Fourier support; it does not import an unproved Tate-class reduction (K Theorems 4.14–4.16, pp.31–32).
- **U8:** Retain corrected positive-cone constancy, rather than independent analytic Fourier-support or Schwartz claims from Theorem 8.2. Give the negative-cone counterexample with norm −π0⁻¹ and its 2q residue classes, and make the test assert its nonzero partial integral (K §§8.1–8.9, pp.64–72). Spell out the H1 Gram matrix and distinguish fundamental-invariant valuation two from base norm valuation one in the counterexample to the odd-top step (Lemma 9.6, p.74). Theorem 9.7 and the resulting ASW target still require that recorded repair; Corollary 9.8 cannot be used to prove its own premise.
- **U10–U11:** Restrict the global K-class construction to LL1 §8’s smooth proper hyperspecial model, p-basic test functions and permitted finite étale level changes (pp.37–38, including footnote 17). Remove affine-formal filtration citations from this construction and from the virtual CM one-cycle. Request arithmetic-scheme codimension/dimension filtration and finite-pushforward compatibility from SF.5. Virtual dimension one does not assert actual dimension one of the fat support (Z §7.6, pp.915–916; §9.1, pp.924–926).
- **U12:** The generic-fiber Chow constant term uses Zhang’s unitary automorphic line; PEL’s determinant Hodge bundle is insufficient. Request eigenspace, descent and Petersson-metric comparisons (Z §8.1, pp.918–919). Add a>0 and the off-divisor domain to the Green function, use dd^c=−(2πi)⁻¹∂∂bar, and make its current equation and principal-divisor compatibility explicit. MZ’s nonnegative orthogonal projection norm is −2 times Zhang’s hermitian R, accounting for the repaired 4π scaling (MZ §6.6, p.37, footnote 4; §7.2, p.48, footnote 5).
- **U13–U14:** Specify the splitting character’s restriction and normalized induction exponent (LZ §12.1, pp.77–78). Specify the conductor sign and the GL2 conjugating matrix in the SL2 vanishing criterion (Z Lemma 13.6, pp.956–957). Preserve the corrected holomorphic derivative, maximal-order-bound repair, strict reverse-Cayley boundary and strongly regular Q_p scope; these were checked rather than silently generalized.

The added API items give concrete base-change, extensionality, linearity, quotient, current-equation and section-transformation operations. They are planning interfaces, with the same hypotheses and unresolved supplier leaves as their parent targets. The reader contains every final node statement, API item and test; its dependency summaries and the roadmap’s `requires` were rebuilt from the corrected graph. Coverage `remaining` obligations were recalculated as well.

## Existing owners and library audit

I checked the reviewed `data/library-coverage.json` audit, the current Tau Ceti library, and the current upstream roadmaps, including all nine roadmaps named in WORKERS.md as newer than the atlas snapshot. IntegralLattices and OrthogonalSpinGroups own their existing foundations; AlgebraicVectorBundles does not already supply arithmetic Chow theory, and the OperatorTheory bundle does not supply these geometric/relative trace targets. No audited projective-height, descent, elliptic-height or Gram-determinant result is proposed as a new node here. The audit’s missing unitary-cycle/density/Green/adelic-Eisenstein material is kept distinct from those existing results.

The supplier check found two additional ownership issues:

1. **Quasi-canonical lifts already have an owner.** Import `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.6/quasi-canonical-lift` and `LT.7/quadratic-degree` into the relevant U1/U5/U7 targets. I also read its quadratic order, marked classification and level dictionaries. Its existing packet does not provide the specific Gross–Keating or Shi/He–Shi–Yang intersection lengths. A precise LT.7 extension request replaces the suggestion that R07.4 classification alone could supply those lengths.
2. **Grothendieck–Messing has a delegation loop.** The current R07.2 packet assigns the Dieudonné crystal and deformation theorem to CR.7, whereas the inspected older CR.7 evaluation/filtration targets delegate their construction back to R07.2. Cite the actual CR.7 filtration interface directly, retain R07.2’s actual perfect-field covariant module by exact node id, and record the missing construction, nilpotent-PD hypotheses and covariant conversion in the request and RZ gap. Neither reciprocal citation closes this input. Supplier files were not edited.

The remaining supplier checks preserve the inspected contracts: GN.3’s existing interpolation is unramified; FK.2’s filtration product is affine formal and its comparison requires a resolution property; MC.2’s cycle classes are not a Tate conjecture; R35.1’s divisor/one-cycle pairing is not a higher arithmetic-Chow theory; MP’s Weil/dual-pair constructions and AS continuation are not Siegel–Weil; ET’s endoscopic matching is not Jacquet–Rallis relative matching. Missing extensions remain requested from those directions rather than being duplicated here.

## Source findings

Every `sourceIssues` entry now has a review verdict and reason. There are **24 findings: 22 confirmed and two rejected**. Original E5 is rejected because LL2 Proposition 2.44 already has inner upper limit j; original E19 is rejected because a sufficient extra hypothesis is not a source misprint. E6 and E8 are narrowed to the actual typographical omissions; their unsupported additional allegations are withdrawn. E2 and E3 have corrected locators. E12 and E13 now have explicit counterexample data and bounded conclusions.

Two findings were added: **E23**, the inconsistent type-zero weight extension between LZ §3.5, p.17, and §7.3, p.45, harmless for the nonsplit sums; and **E24**, an undefined conductor index in the proof of LL2 Proposition 2.44, equation (2.17), p.28 and its final sum on p.29, distinct from the rejected statement allegation. E4 is an acknowledged conditional input resolved by later LRZ geometry with its dictionary, rather than a hidden error. A source-stated theorem and an incomplete proof decomposition are kept separate throughout.

## Validation and maintainer decisions

- `python3 scripts/check_blueprint.py research/blueprint/packets/GrossZagierAndArithmeticHeightsPartII.json`: zero errors, zero warnings.
- The source-issue schema validator reports no errors. Both JSON deliverables parse; every node has one review verdict and every source finding has one verdict.
- The internal dependency graph is acyclic, has no missing internal references, and its derived stage requirements agree with the roadmap. Stage targets, API/test coverage and reader inclusion were checked.
- `lean-check research/blueprint/suggested/GrossZagierAndArithmeticHeightsPartII.lean`: elaborated successfully at the required Mathlib pin, exit zero, with 19 warnings, all declaration-uses-sorry. The existing 267-line suggested file required no edits: three real light definitions, representative statements and examples, and a comment inventory of the heavyweight targets. Its compilation checks signatures; its sorry proofs are not mathematical verification.

The orchestrator must resolve the CR.7/R07.2 ownership loop and assign the exact quasi-canonical intersection-length extension to the existing LT direction. The packet’s PEL Part II, ramified GN.3, formal-filtration, arithmetic-Chow and relative ET extension requests remain substantive. The specific Lusztig/Ichino/archimedean and maximal-order/base-case source leaves, Krämer type-zero/odd-top arguments and q=rank reverse-Cayley boundary remain open as recorded. The four separately allocated inner-product, p-adic, GSpin and higher-Green continuations remain proposals, not claims that their sources have been decomposed here. No extra node was needed at this job’s target granularity, and no supplier or atlas data was promoted or edited.
