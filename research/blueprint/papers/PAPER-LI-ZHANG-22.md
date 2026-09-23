# PAPER-LI-ZHANG-22: GSpin arithmetic Siegel–Weil

Chao Li and Wei Zhang, *On the arithmetic Siegel–Weil formula for GSpin Shimura varieties*, [Invent. Math.228 (2022), 1353–1460](https://doi.org/10.1007/s00222-022-01106-z).

Original extraction: Claude Code, cc-fb70e5, issue#1278 / PR#1950.
Independent correction: Codex, codex-a71f92, REV-PAPER-LI-ZHANG-22 / issue#1279, 2026-09-23.
The review is complete with verdict **revise**; the extraction is **partial**.

The [result](PAPER-LI-ZHANG-22.result.json) now contains 64 items: 9 library, 10 planned, 45 missing; five routes; 15 prerequisite entries; 12 individually reviewed source issues. Every missing item occurs in exactly one route. The [review report](../reviews/REV-PAPER-LI-ZHANG-22.md) gives the evidence, changes and remaining obligations.

## Sources and reading scope

The independent review read the entire **published** article, 108 PDF pages, from the [NSF public copy](https://par.nsf.gov/servlets/purl/10338689). SHA-256:
`e340b6e1213b365b47e5839f9297ff9f5116c40cf261d08b89115f7dde6c0ee7`.
Journal pages run1353–1460.

Retained original item locators usually refer to the 80-page [author manuscript](https://www.math.columbia.edu/~chaoli/KRO.pdf), dated 2 March2022, hash
`c02a94d47eee2634fda148a162b54bb9aa90855eb140fb809959ab195cabfbdd`.
The reviewer compared selected error passages, not every word, with [arXiv v1](https://arxiv.org/pdf/2106.15038v1), hash
`e7bcfc430c8be5a416ab7bf340b582c8b4fd7f04e72f07486b035d5abfc0fb5c`.
The published PDF is not identical to the author-final: its p.1434 still has a dual-basis typo corrected in the manuscript.

The reviewer also read the [unitary companion](https://www.math.columbia.edu/~chaoli/KRProof.pdf) §§5.2–5.3 and the relevant [Howard–Pappas](https://arxiv.org/pdf/1509.03914) spinor/component passages. Other prerequisite papers were not freshly read in full. Version hashes and exact scope are in `source.readSections`.

## Main targets and proof structure

For F=Q_p, p odd, m=n+1≥3, the paper states
`Int^ε(L)=∂Den^ε(L)` for rank-n nondegenerate lattices in its special quasi-endomorphism space. Here `∂Den=−D′(1)`, with the minus sign. It then states, over Q at a hyperspecial odd prime and for p-admissible test functions,
`Int_{T,p}(ϕ_K) exp(πi tr(Tz)) = c_K ∂Eis_{T,p}(z,ϕ_K)`,
for positive definite T, with `c_K=(−1)^n/vol(K)` under the paper's measure convention.

The local proof splits along a rank n−1 lattice. Horizontal cycles reduce to quasi-canonical/Gross–Keating calculations. Vertical intersection functions are compared with Deligne–Lusztig curves through **Tate cycle classes**. This does not make those curves equal in Chow or K-theory. The specialization argument uses **SO(W)**, a torus for a nondegenerate plane, not the disconnected full O(W). The analytic and geometric recurrences then use the plane's isotropic/anisotropic cases. Proposition 9.1.3 has dimension2k only for k≥1; at k=0 its distribution space is one-dimensional.

The review records false auxiliary statements and unresolved proof steps; it does **not** claim either main identity is false.

## Existing providers

The blanket statement “Library: nothing” has been removed. Items 46–54 cite declarations read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`: Clifford algebra, discriminants, Witt extension, spinor norm and its kernel theorem, the general Fourier integral, derived category, algebraic cycles, and abelian varieties over fields.

None alone supplies the RZ spaces, formal-scheme support K-theory, p-adic Fourier inversion, integral GSpin group scheme or Kuga–Satake family. Items 55–58 explicitly import the scheme K/Chow/cycle-map and generic canonical-model layers. Items 63–64 import the existing Tau Ceti local/global quadratic-classification roadmaps; they must not be re-planned in GN or GSpin heights. Item 5 is now planned in GN.3, whose contract explicitly includes local densities.

## Routes

| Route | Decision | Scope |
|---|---|---|
|1: GSpinSpecialDivisorHeights |reject |26 residual item references; separate generic suppliers and repair the proof/statement issues before design |
|2: OrthogonalIntegralModelsAndKugaSatake |reject |8 bundles; exact moduli/tensor statements and the shared stratum/cycle boundary remain unresolved |
|3: GeometryOfNumbersAndQuadraticArithmetic GN.3 |accept, bounded source |10 references including planned item 5; corrected density/counting statements and explicit E10 repair tasks |
|4: MetaplecticAutomorphicForms MP.3 |accept, bounded source |the orthogonal–SL₂ coinvariant/distribution specialization, with MP.2/AL.0 imports and its actual newform input |
|5: FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1 |accept, bounded source |Tate full-faithfulness, distinct from Raynaud's finite-flat theorem and ramification bound |

The two Part II identifiers are shared candidates, not already proved suppliers. No new roadmap is promoted by this review. Route acceptance is not a proof certificate.

## Source corrections

All original E1–E7 were checked, with reach/version qualifications. E1 affects a stated counting result, not “nothing”; E3 remains a proof gap; E7's final-manuscript correction does not remove the surviving journal typo.

New findings E8–E12 are:

- E8: Corollary 3.6.2 omits a derivative term when εχ(L^♭)=1. The explicit Q_3 example gives−4 where the printed formula gives 0. Its use in Corollary 3.8.3 stays within the unaffected cases.
- E9: an extension to arbitrary distributions is not unique: add a delta mass at0. Specify and justify the intended regular extension.
- E10: same-type index-q overlattices in Lemmas8.2.4/8.2.6 need extra hypotheses; even excluding minimal determinant valuations is insufficient.
- E11: the Cartier-divisor complex has class[O]−[O(−Z)], reversing the printed Chern-character sign and introducing(−1)^d in two numerical formulas.
- E12: the annulus indicator has the opposite sign; co-isotropic recurrence references need parts(ii); positive definiteness in rank m means signature(m, 0).

The JSON contains locators, exact calculations, searched correction sources and individual verdicts. Bounded author/arXiv/Crossref searches found no external correction for the new findings; that is not a claim of exhaustive novelty.

## Remaining work and checks

Split the original bundled definitions and multipart results; close the formal K-theory, crystalline/tensor, deformation, DL-cohomology and analytic-continuation inputs. Give each residual construction a unique owner and exact hypothesis/API boundary. Supply the source-specific repairs E3/E9/E10/E11 before treating the proof chain as executable.

The paper checker, five-file intake check and55 relevant unit tests passed. Exact finite diagnostics for E1/E6/E8/E10 passed; they are reproduced or explained in the review. No Lean file was requested, written or compiled. No mathematics is claimed formalized.
