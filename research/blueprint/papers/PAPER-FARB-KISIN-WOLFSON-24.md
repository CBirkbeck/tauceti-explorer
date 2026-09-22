# PAPER-FARB-KISIN-WOLFSON-24: extraction and routing

Issue #1308. Claude Code, session cc-442dc5. The extraction is complete. Implementation and proof closure are not claimed.

Farb, Kisin and Wolfson, *Essential dimension via prismatic cohomology*, Duke Math. J. 173 (2024), no. 15, 3059–3106 (doi 10.1215/00127094-2023-0071; arXiv 2110.05534).

The result has **143 items: 2 library, 40 planned and 101 missing**. Every missing item is routed exactly once, by one of thirteen routes: one new roadmap, five Part IIs and seven source routes. The paper was read in full. Eighteen mistakes are recorded under `sourceIssues`: eleven misprints, two errors and five gaps.

## What the paper proves

**Restriction theorem (Theorem 4, Corollaries 2.2.13 and 2.2.15).** Let Y be a smooth proper variety over an algebraically closed field C of characteristic 0, with a normal crossings divisor D and U = Y − D. Suppose (Y, D) has unramified good reduction at p and i < p − 2. Then for every dense open W ⊂ U, the image of H^i_ét(U, F_p) → H^i_ét(W, F_p) has dimension at least h^{0,i}_{Y,D} = dim H^0(Y, Ω^i(log D)). The same bound holds on the generic point for p ≫ 0. A cup-product variant bounds the image of ∧^i H^1 by the rank h^{0,1→i} of ∧^i H^0(Ω^1(log D)) → H^0(Ω^i(log D)) on a reduction mod p.

The proof descends to a Breuil–Kisin model over W(k). Take the image M of H^i of the mod p prismatic cohomology of (X, D) in that of W. The Frobenius and the map V_i with φV = Vφ = u^i make M a φ-module over k[[u]] of height i. Lemma 2.2.1 shows that M is torsion-free when i + 1 < p. The étale comparison over A_inf bounds the étale image from below by rank M. The de Rham comparison bounds rank M from below by the image in log de Rham cohomology. Deligne–Illusie and Cartier then reduce the problem to the injectivity of restriction on global log differentials. A derived-completeness lemma (2.1.8) controls the base change from k[[u]] to O_C^♭.

**Essential dimension (Proposition 2.3.3, Theorem 2).** Suppose h^{0,i} ≠ 0 and the classifying map H^i(G, F_p) → H^i_ét(U, F_p) is onto. Then ed(Y/U; p) ≥ i. The proof uses affine Artin vanishing on any compression and transfer along prime-to-p covers. Corollary 2.3.5 applies this to multiplication by p on an abelian variety, proving Brosnan's conjecture for p ≥ g + 2. Theorem 2.3.8, Proposition 2.3.10 and Corollary 2.3.12 (Theorem 1) show that the mod p homology cover of a variety of maximal Albanese dimension is p-incompressible for p ≫ 0.

**Congruence covers (§3, Theorem 3).** §3.1 treats central extensions of free abelian pro-p groups. They carry a Z_p^×-action with weights −1 and −2, which descends to mod p reductions that are finite Heisenberg groups. A weight count gives Proposition 3.1.9: H^•(Ē, F_p) → H^•(E, F_p) is onto for p > (rk H + 3 rk N + 1)/2.

§3.2 applies this to torus torsors U over abelian varieties, which are étale K(π,1)'s. Their Heisenberg covers are p-incompressible (Proposition 3.2.7). A tubular variant (Proposition 3.2.14, Corollaries 3.2.17 and 3.2.18) keeps the degree-d class alive on analytic neighbourhoods of the boundary. The proof uses iterated blow-ups of the zero-dimensional strata, a compact homotopy core of the base, and vanishing for Stein spaces.

§3.3 applies Pink's boundary charts. When the conjugacy class [μ_Σ̃] has a rational member, which holds when the Q-rank equals the R-rank, the parabolic of a zero-dimensional cusp has a unipotent radical that is a pro-p Heisenberg extension. Pulling a principal p-congruence cover back to the boundary chart then gives Theorem 3.3.17 and Corollaries 3.3.18 and 3.3.19 (Theorem 3).

## Sources inspected

- [arXiv 2110.05534v2](https://arxiv.org/abs/2110.05534v2) (27 February 2024, 40 pages, "Minor corrections and revisions"). The PDF has SHA-256 `f281f903…3b26b`. The TeX source ([e-print](https://arxiv.org/e-print/2110.05534v2), file `thirdessdimduke-revised_v3.tex`, SHA-256 `e0d0e743…1f64`) was read in full, bibliography included. This is the revised Duke version, and all locators refer to it.
- [Kisin's copy of the 2021 version](https://people.math.harvard.edu/~kisin/dvifiles/essdim3.pdf) (= arXiv v1, 31 pages, SHA-256 `8b56d61e…9a6`). It was compared at every recorded mistake. §2 was substantially revised between the versions: v1 has no Lemma 2.1.8, and its Corollary 2.3.9 is a Betti-number bound.
- The published Duke PDF could not be retrieved here (Project Euclid refused the request). Crossref records no correction for the DOI.

Everything above was accessed on 22 September 2026.

## Mistakes found (`sourceIssues`)

The five that change a statement or a proof:

- **E13 (error), Proposition 3.2.14.** V′ must be *dense* in V, not merely non-empty. Counterexample: V = N ⊔ B, with N a neighbourhood of the boundary and B a ball in U. Take V′ = B: it is Zariski open in V, and H^d(B) = 0. The only use (Corollary 3.2.17) has V′ dense.
- **E14 (gap), Proposition 3.2.7, Theorem 3.3.17, Corollary 3.3.19 / Theorem 3.** The proofs apply Proposition 2.3.3 (respectively 3.2.14) in degree d = dim, which needs p > d + 2. The printed bounds p > d + (dim of torus + 1)/2 imply this only when the torus has dimension at least 3. The failing cases are an abelian surface with a G_m-torsor at p = 5, and the complex 3-ball at p = 5, which satisfies Theorem 3's p > (3/2) dim X.
- **E15 (gap), Proposition 2.3.10(2) and Corollary 2.3.12.** The hypothesis p > max{dim + 1, 3} of Theorem 2.3.8 is missing. As printed, Corollary 2.3.12 would give p-incompressibility for abelian surfaces at p = 2 and 3.
- **E16 (gap), Theorem 3.3.17.** The proof applies results stated for *proper* torus embeddings with V ⊃ D^an to ξ_K(Σ) → C_K. There Σ is a cone decomposition of the positive cone, not a complete fan (for the modular curve it is the disc chart A^1 ⊃ G_m). The fix is to complete the fan and to work at a torus-fixed point of a top-dimensional cone of Σ.
- **E17 (gap), Corollary 3.2.17.** "Shrinking Y … we can assume Y is Stein" replaces a Zariski open by an analytic open, and Definition 3.2.15 allows compressions through arbitrary finite Y_1 → Y, not Ē-coverings. The argument is complete for compressions through Stein bases carrying Ē-coverings. Those are the only ones Theorem 3.3.17 needs, since they come from affine algebraic compressions.

The error E12 is expository. Paragraph 3.3.9 says that G^ad_R is split for types B, C and D_n with n even, but only type C is split: SO(2n−1, 2), SO(2n−2, 2) and SO^*(2n) have real rank 2, 2 and n/2. The last gap, E18, is a citation: Andreotti–Frankel covers Stein manifolds, while singular Stein spaces need Narasimhan (1967). The remaining entries are misprints whose meaning is clear:

- E1: the splitting in Lemma 2.1.8 projects onto N, not N′.
- E2: H^1(X, Ω^1) should read H^0(X, Ω^1) in 2.3.9.
- E3: n_i ∈ N_i should read n_i ∈ N.
- E4: Ẽ_3 = (Ē_3)_{i+2j}.
- E5: a_J, not a_I.
- E6: ω_r ⊗ ω_T.
- E7: "abelian variety" in Corollary 2.2.13.
- E8: the fan lives in X_*, not X^*.
- E9: L must be imaginary quadratic in Corollary 3.3.19.
- E10: the Q-rank should equal the R-rank of G_R, not of G_{0,R}.
- E11: W must be dense in Theorem 4.

Every item uses the corrected statement. No published correction was found; the places searched are listed with each entry.

## What the atlas and the libraries already have

**Library (2 items).**
- Rank-one valuations: `mathlib:Valuation.RankOne`, `mathlib:Valued`.
- A_inf and Fontaine's θ: `mathlib:PreTilt` and `mathlib:WittVector.fontaineTheta`, with θ([x]) = x^♯ and surjectivity (Mathlib/RingTheory/Perfectoid/FontaineTheta.lean).

Several planned or missing items cite library declarations as partial support: Tau Ceti's fans, regular cones and subdivisions (`TauCeti.Toric.Fan`, `Fan.IsComplete`, `Fan.IsRegular`, `IsRegularCone`, `Fan.IsSubdivision`); `TauCeti.longestElement`; Mathlib's `groupCohomology`, `groupCohomology.H1IsoOfIsTrivial`, `GroupExtension` and `Monoid.exponent`.

**Planned (40 items).**

| Topic | Planned in |
| --- | --- |
| Breuil–Kisin and A_inf prisms | PrismaticCohomology PR.0 |
| Log prismatic cohomology and its de Rham, Kummer-étale, base-change and perfectness comparisons | PR.1, PR.4, PR.8 |
| The Frobenius-image maps V_i | PR.3 (Lη factorization), PR.8 |
| Derived completeness | DerivedDeRhamCohomology DD.1 |
| Frobenius twist and Cartier isomorphism | DD.3, DD.6, CrystallineCohomology CR.5 |
| Log structures and Kummer étale sites | CR.5, HodgeTateAndCanonicalSubgroups T6:log-sites |
| Huber's comparison | ClassicalAdicEtaleCohomology H5 |
| Semicontinuity | Tau Ceti StableReduction Layer 2 |
| Étale-cohomology inputs (invariance under extension of algebraically closed fields, Artin vanishing, generic point) | SchemeAndStackFoundations SF.2, through the upstream Cohomological point counting roadmaps (PR196) |
| Spreading out | SF.4 |
| Corestriction and inflation | Tau Ceti ProfiniteCohomology Layers 6 and 10 |
| Maximal pro-p quotients | Tau Ceti ProfiniteProPGroups Layer 3 |
| Hochschild–Serre spectral sequence | ArithmeticGaloisDuality R02.2 |
| Tilt of C algebraically closed | PerfectoidSpaces P1, P3 |
| Toric varieties and relative torus embeddings | Tau Ceti AnalyticToricGeometry Layers 0 and 5, ShimuraCompactifications C0 |
| Analytic spaces | SF.2 (PR196 ComplexComparison), ComplexComparisonPartII C0 |
| Shimura data, μ_h, components | ShimuraData D1–D5, ShimuraVarieties V0–V2 |
| Galois action on the Dynkin diagram, parabolics from cocharacters, relative theory over a base | Tau Ceti ReductiveGroups Layers 7–8 and RootSystems Layer 4 |
| Pink's boundary torus torsor and toroidal chart (Proposition 3.3.13) | ShimuraCompactifications C0–C2 |

## Routes

1. **New roadmap `EssentialDimensionOfCovers`, "Essential dimension and p-incompressibility of covers"** (area: algebraic geometry; 69 items). No layer of the atlas plans essential dimension. The paper's argument is a new direction: prismatic restriction theorems, then characteristic-class bounds, then Heisenberg covers of torus torsors, then the toroidal boundary of Shimura varieties. It imports the prismatic, toric, group-cohomological and Shimura-theoretic suppliers above rather than extending any one of them. The brief states the four final results with the corrections. It asks for Proposition 3.2.14 for non-complete fans, and it gives the new roadmap ownership of the complex-analytic facts nothing else plans: compact homotopy cores, normalization and transfer for finite analytic covers, and vanishing for Stein spaces.
2. **Part II of Continuous cohomology of profinite groups** (`ProfiniteCohomologyPartIIHeisenbergCohomology`, "cohomology rings of abelian and Heisenberg p-groups"; 13 items). It covers the cohomology rings of elementary abelian and free abelian pro-p groups, central extensions from cocycles and their H^2 classification, finite Heisenberg groups and weights, Lemmas 3.1.2–3.1.8 and Proposition 3.1.9. This is general group cohomology beyond the Tau Ceti roadmap, which stops at the graded cup product and the Evens norm. It requests the multiplicative Hochschild–Serre spectral sequence from ArithmeticGaloisDuality R02.2.
3. **Prismatic cohomology, Part II: prismatic Dieudonné theory** (1 item). This is the same Part II that the Anschütz–Le Bras extraction proposed. The exterior-algebra theorem for abelian schemes, which Corollary 2.2.6 consumes, is its item PAPER-ANSCHUTZ-LEBRAS-23/104, so ownership stays in one place.
4. **Toroidal compactifications and boundary geometry, Part II: integral boundary charts of Hodge type** (1 item). Madapusi Pera's integral boundary torus torsors give the good reduction used in Corollary 3.3.18. C5 builds integral compactifications for PEL data only and disclaims Hodge type.
5. **Complex Shimura varieties, Part II: integral models and reduction** (the existing proposal `ShimuraVarietiesHondaTatePartII`; 1 item). Kisin's Lemma 3.4.13, the Hodge-type lift with a reductive model over Z_p used in Corollary 3.3.19, belongs with the integral-model Part II proposed by the Kisin and Kisin–Pappas extractions.
6. **Reductive algebraic groups, Part II** (the existing proposal `ReductiveGroupsArithmeticPartII`; 1 item). This is Prasad–Rapinchuk's existence of global forms with prescribed real form and maximal Q-rank, which is global Galois cohomology of reductive groups.
7. **Source routes.**
   - DerivedDeRhamCohomology DD.3/DD.6 take the log Deligne–Illusie decomposition and Lemma 2.1.2. DD.3 already names Deligne–Illusie with its bounds.
   - DD.1 takes Lemma 2.1.8(1)–(2), an exchange of completion and base change.
   - PrismaticCohomology PR.1/PR.4/PR.8 take the degreewise étale comparison, Katz's Frobenius-module lemma and Lemma 2.1.8(3).
   - HodgeTateAndCanonicalSubgroups T6:log-sites takes logarithmic purity and Lemma 2.2.10. That stage plans Kummer étale sites and the analytification comparison with log schemes.
   - SchemeAndStackFoundations SF.3/SF.4 takes the Albanese variety, Albanese dimension, Koizumi's specialization theorem and Proposition 2.3.10(1).
   - AdelicAlgebraicGroups AA.4 takes strong approximation for unipotent groups.
   - ShimuraData D0/D4 takes Deligne 2.3.4(a) and 2.3.10.

Tau Ceti roadmaps are extended only by Part IIs (routes 2 and 6); none is re-planned.

## Coverage crosswalk

Item numbers are the suffixes after `PAPER-FARB-KISIN-WOLFSON-24/`.

| Paper block | Items |
| --- | --- |
| §1: definitions, Theorems 1–4 | 001–012 |
| §2.1: de Rham, Cartier, Deligne–Illusie, prisms, 2.1.5(1)–(5), Lemmas 2.1.6 and 2.1.8 | 013–036 |
| §2.2: Lemma 2.2.1 to Corollary 2.2.15 | 037–060 |
| §2.3: characteristic classes, abelian varieties, Albanese | 061–073 (with 007–008) |
| §3.1: Heisenberg group cohomology | 074–087 |
| §3.2: torus torsors, torus embeddings, analytic ed | 088–111 |
| §3.3: Shimura data, rational cusps, boundary charts, Theorem 3.3.17 and corollaries | 112–143 |

## Prerequisite papers the atlas does not cover

- Farb–Kisin–Wolfson, *The essential dimension of congruence covers* (Compositio 2021): 2.1.4, 2.2.7, 4.3.12.
- Deligne–Illusie (1987).
- Illusie's overview of logarithmic étale cohomology (Astérisque 279).
- Katz, Antwerp III, Proposition 4.1.1.
- Benson–Carlson on extraspecial groups, with its 1993 corrigendum.
- Madapusi Pera, toroidal compactifications of Hodge type (2019).
- Kisin, abelian-type integral models (JAMS 2010).
- Prasad–Rapinchuk (2006).
- Koizumi (1960).
- Kempf–Knudsen–Mumford–Saint-Donat, *Toroidal embeddings I*.
- Burda (2012).
- Andreotti–Frankel (1959) and Narasimhan (1967).
- Łojasiewicz (1964).

Links and reasons are in `prerequisites`.
