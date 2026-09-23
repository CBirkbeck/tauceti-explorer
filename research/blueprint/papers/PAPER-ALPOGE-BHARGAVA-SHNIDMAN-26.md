# PAPER-ALPOGE-BHARGAVA-SHNIDMAN-26: rank stability and Hilbert’s tenth problem

Alpöge, Bhargava, **Ho**, and Shnidman, [*Rank stability in quadratic extensions and Hilbert’s tenth problem for the ring of integers of a number field*](https://doi.org/10.1007/s00222-025-01392-3), Inventiones mathematicae **243 (2026)**, 1129–1139. Online publication was 1 December 2025; the downloaded PDF header says 2025, while the journal landing page and Crossref print metadata place the issue in March 2026.

Extraction originally by Claude Code `cc-39fac3` (#1203); independently reviewed and corrected by Codex `codex-hjdg0j` (#1204), 23 September 2026. Review verdict: **revise**. The review is complete; the corrected extraction is **partial**, with explicit G1–G3. This is not a claim that the main theorems are false.

The [machine-readable extraction](PAPER-ALPOGE-BHARGAVA-SHNIDMAN-26.result.json) contains 59 items (3 library, 13 planned, 43 missing), all 44 original IDs, 14 definition/construction APIs, 42 planning tests, and seven independently reviewed source issues. Every missing item has exactly one route. The [route verdicts](PAPER-ALPOGE-BHARGAVA-SHNIDMAN-26.review.json) accept routes 1, 3 and 4 and reject routes 2 and 5.

## What is proved, and how

Theorem 1.1 says that every quadratic number-field extension K/F admits an abelian variety A/F with rank A(F)=rank A(K)>0. Corollary 1.2 says that Z is Diophantine over O_K for every number field K; consequently polynomial solvability over O_K is undecidable. The published introduction also states the consequence for every infinite finitely generated commutative Z-algebra, citing Eisenträger’s thesis Chapter 7.

Choose an odd prime ell not dividing Disc(K), and adjoin its roots of unity. Coprime discriminants give the required disjointness; finite etale base change gives unramifiedness above ell. Weil restriction later descends the constructed abelian variety. Over the enlarged field, J_n is the Jacobian of y²=x^ell+n and phi=1−ζ has degree ell. Its kernel has the quadratic character of F(√n). At primes away from ell which are inert or ramified in that quadratic extension, local Tate duality and the Euler characteristic make H¹ vanish. The ell-adic primes are protected in S; silence is not used there.

Yu’s rank-lowering argument supplies r≠0 with Sel_phi(J_(q^ell r²))=0 while preserving the unit condition at ramified primes. Further twisting by an admissible Sigma-unit leaves every local Selmer condition unchanged. Prime triples p_1+2r gamma^(n ell)p_2=p_3 give a=p_1/p_3 and b=gamma^(n ell)p_2/p_3. The corrected twisted Fermat cover gives a rational point with x=a≠0 on the opposite quadratic twist. Northcott for a **symmetric ample** canonical height on the fixed untwisted Jacobian bounds the exceptional twist classes with extra rational torsion. Injectivity of Abel–Jacobi then proves that the constructed point is outside the phi-kernel and has infinite order. The rational plus/minus decomposition gives the rank equality.

For Corollary 1.2, MRS Theorem 3.1 transfers positive rank stability to a Diophantine definition of O_F in O_K. MRS Theorem 4.8 uses finite-extension descent, finite intersections, Denef’s totally real case and transitivity. These operations are distinct; the review adds their separate statements. A Galois closure already totally real uses Denef directly. Reduction of systems to one polynomial equation also needs its own lemma, with the non-algebraically-closed fraction-field hypothesis.

## Corrections that affect planning

- The old citations for item 11 supply cyclotomic disjointness, not its entire bundled base-change conclusion. Item 53 now handles that application separately. Item 42 is now exactly class-group finiteness; item 56 constructs the supported elements from it.
- `TauCeti.Isogeny.degree` is a definition for **elliptic curves**, not arbitrary abelian varieties. General finite-isogeny degrees belong to A3/A6. Likewise the field Kummer map is only proved injective at the pin; it is not a ready curve-twist classification. The elliptic canonical height and quadratic-twist point equivalence are special cases, not implementations of the needed general results.
- Twist character formulas now specify the coordinate isomorphism and the variance of the Jacobian action. This is a convention clarification, not a newly alleged source error.
- The S-unit theorem needs a nonzero coefficient; I-primality needs a nonzero ideal and a residual prime of degree one. Good-prime Kummer images for phi:A→B begin with B(F_v)/phi A(F_v).
- The affine Fermat formula uses y≠0; the global map is its extension between smooth projective curves. The non-torsion step is explicit and does not require a new general reduced-divisor theory.
- Kai’s input is now its actual weighted theorem, with finite-index linear images, pairwise-kernel conditions, Lipschitz regions, local densities and error. The congruence set is an affine coset. Prime powers and higher-residue-degree primes are removed before asserting I-primality.
- The stronger prime count yields infinitely many **proportional classes**, since a fixed line has only O(N^d) lattice points compared with ≫N^(2d)/(log N)^3 triples. Repeated residual primes force unit ratios; remove their finitely many proportional families using the S-unit theorem before asserting multiplicity below ell.

## The dyadic repair and its limit

For F=Q(ζ_3), K=F(i), the ramified dyadic prime has conductor exponent two. The original r and gamma are dyadic units, so beta has valuation one. If t_1=t_3 and x,y,z are units, the printed congruence would give a square congruent to 1 modulo 2 but not modulo 4. In the unramified quadratic extension of Q_2, a square congruent to 1 modulo 2 is already 1 modulo 4. This contradicts the printed inference. Independently enumerating all 12^6 unit choices in Z[ζ_3]/4 confirms the contradiction.

Multiplying r by delta^ell with delta supported on the dyadic ramified primes makes beta vanish modulo their conductor powers. The Jacobian, its conductor and its zero-Selmer property are unchanged. The modified r is no longer a unit at those dyadic primes; it remains a unit at the odd ramified primes, where the conic argument applies. An odd residue field contains mu_ell, hence has at least 2ell+1≥7 elements. The smooth conic has q+1 points and at most six on the coordinate axes, so it has a point with all coordinates nonzero, which lifts.

This repairs the **existential choice** used in Theorem 1.1. It does not automatically prove Proposition 2.5 for its **originally fixed r**: delta is supported outside Sigma, so multiplying its witnesses by delta^ell does not preserve the Sigma-unit condition. The original extraction’s blanket claim that the proposition was repaired was too strong. G3 records exactly what remains.

## Routes

1. **ACCEPT — ExponentialSumsAndCircleMethod**: ES.3/ES.4 owns local densities and the separate prime-weighted endpoint. The corrected route includes the affine I-lattice, exact Kai input and quantitative non-proportional refinement, with the fixed exceptional families removed.

2. **REJECT — AnalyticNumberTheory**: Ownership in AN.4 is plausible, but item 33 is not an exact Mitsui theorem. G1 requires the archimedean/angular and uniform modulus/error contract before this source can be used.

3. **ACCEPT — AdditiveCombinatorics**: AC.5 owns finite-complexity prime patterns. Item 35 now states Kai v5 Theorem 13.1 with its actual lattice, weighted count and local-density hypotheses.

4. **ACCEPT — AbelianSchemesAndArithmeticModuli**: A6 owns the Weil-restriction/isogeny comparison. General quadratic descent and the rational plus/minus proof are explicit in 59/58; Mordell–Weil and descent foundations are imported, and the elliptic-only near miss is no longer overstated.

5. **REJECT — HilbertTenthProblemOverRingsOfIntegers**: The proposed LD.4 successor has the right direction, but the fixed-r dyadic proof G3 and the Eisenträger reduction G2 remain unresolved. The corrected brief names both and preserves exact target statements.

## Source findings

- **E1 — confirmed**, Proof of Proposition 2.7, arXiv v1 p. 5. Confirmed algebraically for ell=3,5,7,11 and by the general substitution x^ell=(1−2rb y^ell)/a. The published p. 1135 has y^(−2); the old version has y^(−1).
- **E2 — confirmed**, §1 (introduction), arXiv v1 p. 2. Confirmed by comparing v1 introduction p. 2 with published p. 1131 and substituting (1,1): the missing b changes the Fermat equation. The published version repairs it.
- **E3 — confirmed**, Proof of Proposition 2.5, case 𝔪 ≠ 1, p. 1137 (published version); the same text in arXiv v1 p. 7. Confirmed the printed dyadic inference fails. Independently checked all 12^6 unit choices in Z[zeta_3]/4 and gave the valuation argument. The proposed rescaling preserves the isomorphism class and Selmer vanishing, but loses the dyadic unit condition on r and does not prove the original fixed-r X is infinite. Those limitations are now explicit.
- **E4 — confirmed**, Proof of Proposition 3.1 (sketch), p. 1136 (published version); arXiv v1 p. 6. Confirmed by counting unit pairs modulo q^n for q=3,5,7,11 and n=1,2,3. The printed factor grows as q^(2n−2); dividing by that factor gives 1−(q−1)^(−2) away from beta.
- **E5 — confirmed**, Proof of Proposition 3.1 (sketch), p. 1135 (published version); arXiv v1 p. 6. Confirmed by trace duality and the explicit Q(zeta_3), C=3 example x=1+2zeta_3: x is not in 3O but Tr(alpha x) is divisible by 3 for all alpha∈O. The inverse-different character lattice is required.
- **E6 — confirmed**, End of the proof of Proposition 2.5, p. 1137 (published version), with the statement of Proposition 3.1, p. 1135; arXiv v1 pp. 5–7. Confirmed as a missing inference, not a counterexample to Proposition 2.5. Infinitude modulo global units does not imply infinitely many ratios. For beta=2, (pi,−pi,−pi) has multiplicity ell and fixed ratios. Item 52 derives the stronger count from the exact Kai statement and removes the finitely many associate-prime families using the S-unit theorem.
- **E7 — confirmed**, Published proof of Proposition 3.1, p. 1136; also arXiv v1 p. 7. Checked the published wording, the explicit nonzero residue example, the CRT translation, and Kai v5 Theorem 13.1 allowing affine-linear maps.

E1 and E2 were corrected in the published version. E3–E7 remain in the checked published text. The error register receives the independent verdicts from the JSON; no author was contacted. The search covered the journal landing page/PDF, arXiv history, Wei Ho’s writing page, Ari Shnidman’s current site, the author-hosted old preprint, Crossref metadata and title/author correction searches. No further correction was found; this is a bounded search.

## Remaining gaps

- **G1:** Mitsui’s major-arc input remains a schematic description. Obtain a primary statement and proof with the element-height/angular region, ideal class, residue condition, growing modulus range and exact error before accepting route 2. Route 1 can instead use the precise Kai theorem.
- **G2:** Eisenträger thesis Chapter 7 full proof was not obtained. Verify the reduction for every infinite finitely generated commutative Z-algebra, including zero divisors and positive characteristic. The published paper states the consequence but does not supply this proof; no contrary result is alleged.
- **G3:** The supported-delta repair changes r and therefore X. It repairs the existential choice used in Theorem 1.1, but does not establish Proposition 2.5 for the originally fixed r. Supply the dyadic residue argument for that fixed r, or explicitly formulate and prove the rescaled-r version while keeping the original statement’s proof gap visible.

## Sources and provenance

The main published PDF is open access under CC BY 4.0. Hashes identify the bytes checked, not a claim of formal verification.

- [published.pdf](https://link.springer.com/content/pdf/10.1007/s00222-025-01392-3.pdf), 11 pages; SHA-256 `94190b392b135905918368a0f52bb0ec1491488f65d9228fdabcee0bf08281ec`.
- [arxiv.pdf](https://arxiv.org/pdf/2501.18774v1), 10 pages; SHA-256 `3d36dff3653d7484c240f36484ddaff8c90bd8bb94c510113723a2538b859d5a`.
- [yu.pdf](https://arxiv.org/pdf/1511.07511v1), 30 pages; SHA-256 `5e66cacede08787ead82b9589fa0ecb8fab569b3e9e4b241cd7ce0bf6211d63e`.
- [mrs.pdf](https://arxiv.org/pdf/2208.09963v3), 56 pages; SHA-256 `ffff534a6645e66fdc21c0a67323692792465912e1896d3e58862cf927ad560c`.
- [kai.pdf](https://arxiv.org/pdf/2306.16983v5), 84 pages; SHA-256 `c5e9e91fd7c698d0296a5412620a4556cf56f39ed964d353e423802c7ab495a7`.

All eleven published pages were read. The earlier version was checked at the changed introduction, torsion proof, cover and finding locators. Yu was independently checked at Theorems 4/4.13, Proposition 4.2 and its proof, and the §4 setup and rank-raising proof. MRS was checked at Definition 2.2, Proposition 2.3(1), Theorem 3.1 and Lemmas 4.1–4.7/Theorem 4.8; Kai at v5 Theorem 13.1, pp. 56–57. The review does not claim a full independent reading of all three prerequisite papers. The nine-page author-hosted preprint was accessible through the public web reader at §§2.4–4 but returned 403 to direct download. Eisenträger’s institutional thesis record has no acquired Chapter 7 text.

## Item inventory

The JSON gives each statement, dependencies, status evidence and all APIs/tests.

| Item | Kind | Status | Target |
|---|---|---|---|
| 1 | definition | missing | Diophantine subsets of a ring; O_F Diophantine in O_K |
| 2 | theorem | planned | Hilbert's tenth problem over ℤ (Davis–Putnam–Robinson, Matiyasevich) |
| 3 | theorem | missing | Transfer of undecidability along Diophantine definitions |
| 4 | theorem | missing | Diophantine definitions from rank stability (Poonen, Cornelissen–Pheidas–Zahidi, Shlapentokh; Mazur–Rubin–Shlapentokh Theorem 3.1) |
| 5 | theorem | missing | ℤ is Diophantine over the ring of integers of a totally real field (Denef) |
| 6 | theorem | missing | Quadratic rank stability everywhere implies ℤ Diophantine over every 𝒪_K (Shlapentokh; MRS Theorem 4.8) |
| 7 | theorem | missing | Theorem 1.1 (rank stability in quadratic extensions) |
| 8 | theorem | missing | Corollary 1.2 (Hilbert's tenth problem over rings of integers) |
| 9 | theorem | missing | Hilbert's tenth problem over finitely generated infinite ℤ-algebras (Eisenträger) |
| 10 | theorem | planned | Mordell–Weil theorem and rank of an abelian variety over a number field |
| 11 | theorem | library | Cyclotomic disjointness from coprime discriminants |
| 12 | construction | planned | Weil restriction reduction |
| 13 | theorem | missing | Rank of an abelian variety over a quadratic extension |
| 14 | construction | missing | The curves C_n : y² = x^ℓ + n and their Jacobians with ℤ[ζ]-multiplication |
| 15 | construction | missing | Quadratic twists and μ_ℓ-twists of C_n and J_n |
| 16 | theorem | missing | The kernel of φ = 1 − ζ |
| 17 | definition | planned | The φ-Selmer group Sel_φ(J_n) |
| 18 | theorem | missing | Lemma 2.1 (Selmer bound for φ = 1 − ζ) |
| 19 | theorem | planned | Local Tate duality and the local Euler characteristic formula for finite modules |
| 20 | theorem | missing | Lemma 2.2 (silent primes) |
| 21 | theorem | planned | Local conditions at good primes |
| 22 | theorem | planned | Good reduction is preserved by twists unramified at 𝔭 |
| 23 | theorem | missing | Lemma 2.3 (Yu's theorem: a μ_ℓ-twist with trivial φ-Selmer group) |
| 24 | definition | missing | The prime sets S′, S, S_inert, Σ and the Σ-units |
| 25 | theorem | missing | Lemma 2.4 (silent twists preserve the Selmer group) |
| 26 | definition | missing | The classes t_{a,b} and the set X |
| 27 | theorem | missing | Proposition 2.5 (infinitely many admissible Σ-unit solutions) |
| 28 | theorem | planned | Northcott finiteness for points of height zero and bounded degree on an abelian variety |
| 29 | theorem | missing | Lemma 2.6 (only finitely many twists acquire extra torsion) |
| 30 | construction | missing | The twisted Fermat curve and its cover of C_{r²a^{ℓ−1}b²} |
| 31 | theorem | missing | Proposition 2.7 (the quadratic twist has positive rank) |
| 32 | definition | missing | I-primes |
| 33 | theorem | missing | Mitsui's generalized prime number theorem (Siegel–Walfisz over number fields) |
| 34 | theorem | missing | Proposition 3.1 (three primes in a linear equation over a number field, with congruences) |
| 35 | theorem | missing | Kai's theorem on linear patterns of prime elements in number fields |
| 36 | theorem | planned | Class field theory for K/F: ray class character, splitting and conductor |
| 37 | theorem | planned | Chebotarev for the abelian extension HK/F |
| 38 | theorem | planned | Siegel–Mahler finiteness for S-unit equations |
| 39 | theorem | planned | Units close to 1 are ℓ-th powers |
| 40 | theorem | missing | Local solvability of the residue conditions modulo 𝔪 |
| 41 | construction | missing | The Σ-unit solution (a, b) from a prime triple |
| 42 | theorem | library | Finiteness of the number-field ideal class group |
| 43 | theorem | missing | Assembly of the proof of Theorem 1.1 |
| 44 | theorem | missing | Siegel–Mahler support argument: infinitely many ℓ-th power classes |
| 45 | theorem | missing | Replace finite polynomial systems by one equation |
| 46 | theorem | missing | Transitivity of Diophantine definitions |
| 47 | theorem | missing | Finite intersections of Diophantine sets |
| 48 | theorem | missing | Descent through a finite extension of integer rings |
| 49 | theorem | missing | Denef’s definition of nonzero algebraic integers |
| 50 | theorem | missing | Recover the integer ring from a Diophantine set containing N |
| 51 | construction | missing | Affine lattice of admissible prime triples |
| 52 | theorem | missing | Prime triples outside finitely many proportional families |
| 53 | theorem | missing | Quadratic cyclotomic base change and unramifiedness |
| 54 | theorem | missing | A nonzero x-coordinate excludes the phi-kernel |
| 55 | theorem | planned | A degree-one divisor relation forces genus zero |
| 56 | construction | missing | Supported elements for S and for the dyadic rescaling |
| 57 | definition | library | Units away from an arbitrary set of primes |
| 58 | theorem | missing | Quadratic eigenspace rank decomposition |
| 59 | construction | missing | Quadratic twist of an abelian variety |

## Validation

The paper checker, intake file check, supplier/route/API/dependency checks and exact five-file archive comparison are run for submission. Symbolic and finite-ring computations support the seven finding verdicts. These are planning and review artifacts; no Lean file was required, written or compiled, and none of the arithmetic targets is claimed formalised.
