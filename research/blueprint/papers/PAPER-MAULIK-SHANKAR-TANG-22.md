# Maulik–Shankar–Tang: current extraction disposition

Paper: *Picard ranks of K3 surfaces over function fields and the Hecke orbit conjecture* (Inventiones 228 (2022), 1075–1143).

Independent review: **revise**. Extraction: **partial**, with 97 items (4 library, 10 planned, 83 missing), each missing item provisionally routed exactly once. This is not a claim of formalization or proof closure. [Review report](../reviews/REV-PAPER-MAULIK-SHANKAR-TANG-22.md), [structured extraction](PAPER-MAULIK-SHANKAR-TANG-22.result.json), [route verdicts](PAPER-MAULIK-SHANKAR-TANG-22.review.json).

## Version and scope

The reviewer read the complete [47-page author manuscript](https://math.berkeley.edu/~ytang/GSpincharp.pdf), §§1–8 and references; PDF creation date 25 December 2021, SHA256 `53f4c42762f179fba71a2d344bee56f3de1fb189f4dd9aea968a4fcbfaedc494`. The original 45-page count omitted two reference pages. The [published landing page](https://link.springer.com/article/10.1007/s00222-022-01097-x), footnotes and [arXiv history](https://arxiv.org/abs/2011.08887) were checked; the full version of record was not accessible and was not read. The original extractor's arXiv-source comparison was not independently repeated. Every source-error verdict is restricted to this author PDF.

The paper proves infinitely many Picard-rank jumps in a generically ordinary non-isotrivial K3 family over a proper curve, with p≥5 and prime-to-p generic Picard discriminant; it uses the corresponding infinite special-divisor intersection theorem for proper generically ordinary curves in good-reduction GSpin models. It then proves ordinary prime-to-p Hecke-orbit density in the stated orthogonal and split unitary cases. The general μ-ordinary statement is a conjecture, not a proved endpoint. The generalized Newton-stratum decay extension is quarantined pending a corrected proof.

## Corrections and limits

Pinned Dirichlet L-functions/zeta are library material, while successive minima and local densities are already planned. Generic completed PD envelopes are added as item97 under CR.0; the specific lifting/coefficients obstruction is item51 under R07.2/R07.6. Universal elliptic families use fine prime-to-p level. Endomorphisms commute with F,V; they are not invariant vectors of the Dieudonné module. Weight-zero Frobenius need not preserve the integral special lattice.

The main-term comparison is an upper bound, not an asymptotic equality; the Hasse divisor degree sums over all of C. Three series constants are verified by exact identities. The t-adic horizontal product, cyclic basis and block indices, minimal-tuple closure and Moore determinant are corrected. Teichmüller lift cancellation, zero factors and small-index cases still block a complete decay proof. Normalization of the geometric Eisenstein series against the shared number-field bridge remains unproved.

There are 20 source findings: 18 confirmed in the author PDF and two rejected. E4's alleged χ_D/χ_D′ mistake is not established because the characters agree on the divisors in question. E19 is a notation/properness clarification, not a confirmed source misprint. Neither the finite diagnostics nor a failed auxiliary assertion is presented as a disproof of the paper's main theorems.

## Ownership

| Route | Owner | Review |
| --- | --- | --- |
| 1 | OrthogonalIntegralModelsAndKugaSatake (Part II of ShimuraVarieties) | reject |
| 2 | GSpinSpecialDivisorHeights (Part II of GrossZagierAndArithmeticHeights) | reject |
| 3 | ShimuraCompactificationsPartIIHodgeTypeIntegralBoundary (Part II of ShimuraCompactifications) | reject |
| 4 | SupersingularCrystalsAndOrdinaryHeckeOrbits (Part II of ShimuraVarieties) | reject |
| 5 | GeometryOfNumbersAndQuadraticArithmetic | accept |
| 6 | AnalyticNumberTheory | accept |
| 7 | FiniteFlatGroupsAndIntegralPadicHodgeTheory | reject |

Routes5–6 are accepted only as the bounded source additions described in their verdicts. Overall **revise** activates no routes. All four Part II identities must coalesce with shared proposals; these names are not implemented suppliers. Boundary geometry lives only in route3. Route4 extends ShimuraVarieties and must import K3/Hodge and generic monodromy inputs from common owners.

## Item index

Statements, locators, statuses and source qualifications are in the JSON; this index does not replace them. A source route may document an already planned item without rebuilding it.

| Item | Definition or result | Status | Route |
| --- | --- | --- | --- |
| 1 | Quadratic forms, Clifford algebras and the spin group | library | — |
| 2 | Lattices in a real vector space and their covolume | library | — |
| 3 | Witt vectors of a perfect field and their Frobenius | library | — |
| 4 | Shimura data and the analytic Shimura variety at a compact open level | planned | — |
| 5 | Baily–Borel algebraicity and the minimal compactification in characteristic zero | planned | — |
| 6 | Dieudonné theory for p-divisible groups over a perfect field | planned | — |
| 7 | Crystals and F-crystals on a crystalline site | planned | — |
| 8 | Serre–Tate theory and Grothendieck–Messing deformation theory | planned | — |
| 9 | The Weil representation of the metaplectic group | planned | — |
| 10 | Dirichlet characters, their complex L-functions and the Riemann zeta function | library | — |
| 11 | The modular curve and its universal elliptic curve | planned | — |
| 12 | Picard rank jumps in a generically ordinary family of K3 surfaces (Theorem 1.1) | missing | 4 |
| 13 | Generically ordinary curves meet the special divisors infinitely often (Theorem 1.2) | missing | 4 |
| 14 | Statement of the general μ-ordinary Chai–Oort conjecture | missing | 4 |
| 15 | The ordinary Hecke orbit conjecture for GSpin and unitary Shimura varieties (Theorem 1.4) | missing | 4 |
| 16 | The characteristic-zero comparison: density of Noether–Lefschetz points (Green, Oguiso) | missing | 4 |
| 17 | The GSpin Shimura datum and its canonical integral model | missing | 1 |
| 18 | The Kuga–Satake abelian scheme and its cohomological realisations | missing | 1 |
| 19 | The local systems 𝐋_? inside End_{C(L)}(𝐇_?) and the quadratic form 𝐐 | missing | 1 |
| 20 | Special endomorphisms of the Kuga–Satake scheme and of its p-divisible group | missing | 1 |
| 21 | Speciality is checked at one geometric point, and crystallinely in the special fibre | missing | 1 |
| 22 | Special endomorphisms carry a positive definite quadratic form | missing | 1 |
| 23 | Special divisors | missing | 1 |
| 24 | The tautological line bundle ω and the Hasse invariant | missing | 1 |
| 25 | Local intersection multiplicities are lattice point counts | missing | 1 |
| 26 | The nested lattices L_n and the supersingular rank dichotomy | missing | 1 |
| 27 | Cusps of the GSpin Baily–Borel compactification | missing | 3 |
| 28 | The fibres over a 1-dimensional cusp are abelian-scheme torsors over a modular curve | missing | 3 |
| 29 | The decay thresholds h_r and h'_r | missing | 4 |
| 30 | Decay of the index at a non-superspecial supersingular point (Theorem 3.2) | missing | 4 |
| 31 | Decay of the index at a superspecial point (Theorem 3.3) | missing | 4 |
| 32 | The heuristic count of branches and the balance with the global intersection | missing | 4 |
| 33 | A formal curve whose local multiplicities grow exponentially | missing | 4 |
| 34 | The crystal at a supersingular point and its Frobenius-invariants | missing | 4 |
| 35 | Ogus's orthogonal decomposition and the type of a supersingular point | missing | 4 |
| 36 | The induced decomposition of the crystal | missing | 4 |
| 37 | A normal form for 𝓛_0 (Lemma 4.3) | missing | 4 |
| 38 | Classification of the crystals 𝕃_0 over a fixed 𝓛_0 (Lemma 4.4) | missing | 4 |
| 39 | A cyclic Frobenius normal form (Lemma 4.5) | missing | 4 |
| 40 | The change-of-basis matrices S_0 and S'_0 | missing | 4 |
| 41 | The three cases for 𝓛_1 and the reduction to the split case | missing | 4 |
| 42 | Kisin's description of the deformation space and the F-crystal on it | missing | 4 |
| 43 | The equation of the non-ordinary locus in the crystal (Lemma 4.9) | missing | 4 |
| 44 | The explicit equation of the non-ordinary locus (Corollary 4.10) | missing | 4 |
| 45 | Frobenius in the φ-invariant basis | missing | 4 |
| 46 | Rapid decay of a special endomorphism | missing | 4 |
| 47 | The Decay Lemma in the generic case (Theorem 5.2) | missing | 4 |
| 48 | Why Grothendieck–Messing theory is not enough in equicharacteristic p | missing | 4 |
| 49 | Horizontal sections and the infinite Frobenius product | missing | 4 |
| 50 | Coordinates of the formal curve and the valuations a_i | missing | 4 |
| 51 | de Jong's criterion for lifting over a truncated base | missing | 7 |
| 52 | The matrices K_i and the decomposition of F_∞ | missing | 4 |
| 53 | The Frobenius action on the rows of (S'_0)^{-1} (Lemma 5.8) | missing | 4 |
| 54 | Products of the K_i have rank one with an explicit row (Lemma 5.9) | missing | 4 |
| 55 | Minimal index tuples and their weights | missing | 4 |
| 56 | Structure of the minimal tuples (Lemma 5.11) | missing | 4 |
| 57 | The row R-bar_{n+1} is F_p-anisotropic (Lemma 5.12) | missing | 4 |
| 58 | Kernels of linear combinations of twists of R-bar_{n+1} (Lemma 5.13) | missing | 4 |
| 59 | The reduction step and the Claim in the proof of Theorem 5.2 | missing | 4 |
| 60 | The Decay Lemma in a general Newton stratum (Theorem 5.15) | missing | 4 |
| 61 | Rapid and very rapid decay at a superspecial point | missing | 4 |
| 62 | The Decay Lemma in the superspecial case (Theorem 6.2) | missing | 4 |
| 63 | The superspecial setup and the Frobenius matrix | missing | 4 |
| 64 | The minimal-valuation terms in the superspecial expansion (Lemma 6.5) | missing | 4 |
| 65 | Evaluation of the minimal products (Lemma 6.6) | missing | 4 |
| 66 | A positive-density set of represented integers prime to p | missing | 4 |
| 67 | The vector-valued Eisenstein series E_0 of weight 1+b/2 | missing | 2 |
| 68 | Local representation densities of a quadratic lattice | planned | 5 |
| 69 | Kronecker-symbol Dirichlet characters and twisted divisor sums | missing | 6 |
| 70 | The Bruinier–Kuss formula for the Fourier coefficients of E_0 (Theorem 7.4) | missing | 2 |
| 71 | Modularity of the generating series and the global intersection asymptotic (Lemma 7.5) | missing | 2 |
| 72 | The expected local share g_P(m) of the global intersection number | missing | 4 |
| 73 | The global bound on local intersection multiplicities | missing | 4 |
| 74 | Successive minima of the lattices L_n | planned | 5 |
| 75 | Uniform lattice-point counts in terms of the successive minima | missing | 5 |
| 76 | A lower bound for the successive minima along the family (Lemma 7.9) | missing | 4 |
| 77 | Truncation of the lattice-count sum (Corollary 7.10) | missing | 4 |
| 78 | The local contribution at a non-supersingular point is negligible (Proposition 7.11) | missing | 4 |
| 79 | The splitting of the supersingular local contribution into a main term and an error | missing | 4 |
| 80 | The error term is uniformly small (Proposition 7.13) | missing | 4 |
| 81 | Theta series of the auxiliary lattices L'_n and their Eisenstein parts | missing | 4 |
| 82 | The Siegel mass formula for the auxiliary lattices (Theorem 7.15) | missing | 5 |
| 83 | The Eisenstein coefficients decay with the discriminant (Lemma 7.16) | missing | 4 |
| 84 | The supersingular main term is a fixed fraction of the expected share (Proposition 7.17) | missing | 4 |
| 85 | The total supersingular contribution (Theorem 7.18) | missing | 4 |
| 86 | Integral models of the minimal and toroidal compactifications of a Hodge-type Shimura variety | missing | 3 |
| 87 | Coordinates at a 0-dimensional cusp and the action of 𝔹_ℓ | missing | 3 |
| 88 | Invariant ideals at a 0-dimensional cusp lie in the boundary (Proposition 8.3) | missing | 4 |
| 89 | The Hecke action near a 1-dimensional cusp | missing | 3 |
| 90 | Hecke translates at a 1-dimensional cusp in characteristic zero (Proposition 8.6) | missing | 4 |
| 91 | Density of Hecke translates in a fibre over a 1-dimensional cusp (Corollary 8.7) | missing | 4 |
| 92 | The 1-dimensional-cusp dichotomy (Corollary 8.8) | missing | 4 |
| 93 | Existence of a generically ordinary proper curve in the Hecke closure (Proposition 8.9) | missing | 4 |
| 94 | Hecke stability and ℓ-adic monodromy (Lemma 8.10) | missing | 4 |
| 95 | The proper curve may be chosen outside every special divisor (Lemma 8.11) | missing | 4 |
| 96 | The unitary case (Remark 8.12) | missing | 4 |
| 97 | Completed PD envelope for the local lifting obstruction | planned | — |

## Work remaining

1. Coverage is not closed at §0/§16 granularity: split compound items (notably 18–23, 38–44, 62, 67/70, 87, 94–96) into definition/theorem leaves with explicit prerequisite edges, API/use/test outlines. Write every entry and change-of-basis map for Kisin's coordinate u/F matrices; replacing a formula by 'the displayed matrix' does not close an interface.

2. Repair the characteristic-zero lift/reduction valuation comparison in E14, the nonzero-scalar/empty-product cases in E15 and the r<e−1 superspecial branches in E16. The exact counterexamples establish failures of the displayed auxiliary assertions, not falsity of the main theorems. No accepted decay supplier until a corrected proof is written.

3. Keep the general Newton-stratum target5.15 quarantined under E13. The ordinary s=1 case does not use that extension. A proposed p^s-spaced rate still needs the correct PD cutoff and rank argument; it is not an established replacement theorem.

4. Extract the exact statements and hypotheses of Ogus79/82/01, Kisin10/17, Madapusi Pera16/19, Howard–Pappas17 and de Jong95, including weight twists, integral comparison and the special-tensor lifting obstruction. These are named suppliers, not independently checked proof closures. Separate CR.0's generic completed envelope from item51's coefficient lemma.

5. Prove the finite discriminant-module Weil comparison and the E_0 constant-term/cycle-pushforward normalizations against the sibling SSTT route (e_0 versus 2e_0). Resolve ±v, stack automorphisms and reduced support before using the global/local equality; the q^m correction alone is insufficient.

6. Extract the earlier MST arXiv:1812.11679 inputs for b=2 and b=3, especially the rank-three decay estimate needed by the small-rank tail. Preserve dependence of uniform constants on the fixed lattice/rank and the all-C Hasse divisor inequality; never restore the false main-term equalities.

7. Close proper-curve selection, finite-field descent and Hilbert irreducibility/Frattini specialization in Lemma8.11. BSE21 is a finite-constant-field supplier, not a theorem directly over F_p-bar(t). Combine monodromy preservation with boundary avoidance and ordinarity rather than assert this combination. Extract Kisin17 and the unitary RSZ20/21 model input; retain low-dimensional induction cases.

8. Resolve the K3 period-map/characteristic-zero Green–Oguiso comparison and reusable Hilbert/monodromy owners within existing directions. The K3 application does not justify a second uncoordinated roadmap. Coalesce proposed integral-model, generating-series and boundary bridges before any design; pending proposals are not available atlas layers.

9. All source findings are version-qualified to the 47-page author PDF. Reconcile with an accessible version of record or a later corrected author version if available; no independent arXiv-v1 source comparison or full published-PDF reading is claimed. Bibliographic supplier links inherited from the extraction still need full validation when those papers are read.

## Validation

The submission runs the paper checker, intake deliverable check, paper/queue/intake tests, and the exact-arithmetic diagnostic reproduced in the independent review. No Lean artifact is requested or compiled.
