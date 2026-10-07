# Igusa varieties, compactified period fibers and torsion concentration

This roadmap builds the geometry and the cohomological mechanisms of Caraiani–Scholze, *On the generic part of the cohomology of non-compact unitary Shimura varieties* (CSnc), §§2–6, and the local and product-formula parts of their compact paper (CS17, §§4 and 6). Its endpoint is the vanishing theorem: for the quasi-split unitary Shimura variety of signature (n, n) over a CM field F with F⁺ ≠ ℚ, the 𝔽_ℓ-cohomology localized at a maximal ideal 𝔪 of the Hecke algebra lies in degrees ≥ d and the compactly supported cohomology in degrees ≤ d, d = [F⁺:ℚ]n², whenever the residual representation ρ̄_𝔪 has at most two constituents and is generic at a prime p splitting completely in F. The roadmap also exports the middle-degree statement used for degree shifting (ACC+ Theorem 4.3.3) and Koshikawa's version without the length and [F⁺:ℚ] > 1 hypotheses.

The route is geometric. Central leaves and perfect Igusa varieties are built over the special fibre at a prime p of good reduction. Their partial toroidal and minimal compactifications are constructed, and the minimal ones are shown to be affine. The fibres of the Hodge–Tate period map on the perfectoid Shimura variety, open, toroidal and minimal, are identified with these Igusa varieties. Nearby cycles of the pushforward along the period map are semiperverse. Combined with Artin vanishing on the affine partial minimal compactification, with a Galois-theoretic obstruction from the Igusa trace formula, and with Pink's formula for the boundary of Igusa varieties, this leaves only the ordinary stratum, a profinite set of points of the flag variety, contributing in degrees ≥ d.

Ordinary canonical-subgroup Igusa torsors are not a replacement for central-leaf Igusa varieties at arbitrary Newton points, and finite-field purity alone is not a torsion-concentration theorem.

The plan is written at target level: one node for each object, construction and named theorem a layer states, and one for each definition or key theorem needed on the way, each with its exact statement, a proof sketch citing the source, its prerequisites, and, for definitions and constructions, the uses, API and unit tests a library needs. Nothing here is claimed to be formalised.

## Scope and standing hypotheses

**The geometric branch** (IG.0–IG.4) uses the PEL unitary similitude datum of CSnc §2.1: a CM field F with maximal totally real subfield F⁺, V = F^{2n} with the split skew-hermitian form ⟨x, y⟩ = Σ_{i≤n}(x_i ȳ_{2n+1−i} − x_{2n+1−i} ȳ_i), the alternating form (x, y) = tr_{F/ℚ}⟨x, y⟩, and an O_F-lattice L self-dual for it. The unitary similitude group G and the unitary group G⁰ are different groups with different locally symmetric spaces; IG.0 proves the comparison. At principal level K(N), N ≥ 3, the integral model lives over ℤ[1/Δ_F]; the special fibre is taken at a prime p unramified in F with p ∤ N. By the source route of Caraiani–Scholze 2017, the local theory of p-divisible groups (IG.0), the perfect and Mantovan Igusa varieties (IG.1), and the local period map and product formula (IG.3) are planned for unramified PEL data of type (A) or (C) with hyperspecial level at p and no compactness assumption. Two results are only for compact Shimura varieties: the stalk computation of CS17 Theorem 4.4.4, which assumes the integral model proper, and the full perversity of CS17 Proposition 6.1.3, which is for compact Shimura varieties of Hodge type. Both are kept separate from the non-compact statements.

**The generic-cohomology branch** (IG.5–IG.7) additionally requires F = F⁺F₀ with F₀ imaginary quadratic and F⁺ ≠ ℚ, a prime p splitting in F₀ (completely split in F for the final theorem), a character ϖ of 𝔸^×_{F₀}/F₀^× extending the quadratic character of F₀/ℚ, a finite set S of places containing ∞, the primes dividing pℓΔ_F and the ramification of ϖ, and a level N divisible only by primes in S ∖ {p} and by the integer N₀ of CSnc Remark 5.4.5. ACC+ calls its coefficient prime p and its auxiliary prime l; this roadmap calls them ℓ and p, and IG.7/cs-generic-maximal-ideal records the dictionary.

## Conventions

- **Primes.** p is the geometric prime (unramified in F, prime to N); ℓ ≠ p is the coefficient prime. k is an algebraically closed field of characteristic p (usually 𝔽̄_p); C is a complete algebraically closed extension of ℚ_p with ring of integers O_C and residue field k, with a fixed section k → O_C/p.
- **Dimensions.** d = [F⁺:ℚ]n² is the complex dimension of the Shimura variety. For b ∈ B(G_{ℚ_p}, μ^{−1}), d_b = ⟨2ρ, ν_b⟩ is the dimension of the central leaves and Igusa varieties in the class b, and the flag Newton stratum Fℓ^b has dimension d − d_b. These three numbers are kept distinct throughout.
- **Sign of μ.** The Shimura variety has Hodge cocharacter μ, and Newton strata are indexed by B(G_{ℚ_p}, μ^{−1}) in the covariant Dieudonné normalization of CS17 §4.2, where the slopes of b on V lie in [−1, 0]. B(G), J_b, the Newton and Kottwitz maps and the order are those of BunGAndNewtonStrata BG0–BG1. This roadmap plans only the PEL-specific map x ↦ [b_x] and its admissibility.
- **Igusa varieties.** Ig^X is the perfect Igusa variety. It parametrizes isomorphisms A[p^∞] ≅ X, is an Aut(X)-torsor over the leaf C^X, and a pro-étale Γ_X-torsor over (C^X)_perf with Γ_X = Aut(X)(k). It is written 𝔍𝔤^X in CSnc Corollary 2.3.2 and Ig^b in CS17. Ig^X_{Mant,m} is Mantovan's finite-level Igusa variety, defined for completely slope divisible X; CSnc writes it Ig^X_m, CS17 writes I^b_{Mant,m}. Ig^{b,*}_m is the normalization of C^{b,*} in Ig^b_{Mant,m}; it is finite over C^{b,*}. The limit Ig^{b,*} = lim_m Ig^{b,*}_m is only integral over C^{b,*}.
- **Cohomology.** H_{c−∂}(Ig^b, 𝔽_ℓ) := H(Ig^{b,*}, j_!𝔽_ℓ) is neither H_c nor H. The upper bound i ≤ d_b (IG.4) is for H_{c−∂}. The lower bound i ≥ d_b at a minimal Newton point (IG.4) is for ordinary H. They are combined only through the boundary comparison of IG.6.
- **Hecke algebras.** 𝕋^S is the abstract spherical Hecke algebra away from S at primes split in F₀, generated by the T_{i,v}. ι([KgK]) = [Kg^{−1}K] is its involution and 𝔪^∨ = ι(𝔪). Frobenius polynomials use geometric Frobenius: X^{2n} − T_{1,v}X^{2n−1} + … + (−1)^i q_v^{i(i−1)/2}T_{i,v}X^{2n−i} + … + q_v^{n(2n−1)}T_{2n,v}. Art_F sends uniformizers to geometric Frobenius.
- **Perversity.** "Semiperverse" means lying in ^pD^{≥d} of the special fibre of a formal model, after nearby cycles. This is a statement on schemes, for a cofinal system of affinoid étale neighbourhoods, not a perverse t-structure on Fℓ itself.
- **Genericity.** CS-generic (IG.7) means length ≤ 2 together with a completely split p ≠ ℓ at which ρ̄_𝔪 is unramified and α_i ≠ pα_j for i ≠ j; repeated eigenvalues are allowed. This differs from CS17 decomposed genericity (α_i/α_j ∉ {1, q}) and from non-Eisenstein (absolutely irreducible). The residual predicates themselves are owned by AutomorphicGaloisRepresentationsPartII AG2.7.

## Boundaries with other roadmaps

This roadmap is a consumer of many layers and plans none of their mathematics again.

- **Imported as prerequisites:**
  - PELModuli M0–M3: the PEL functor, representability and complex uniformization.
  - AbelianSchemesAndArithmeticModuli A4: classical Serre–Tate.
  - FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1–R07.2 and R07.6: p-divisible groups, Dieudonné theory, universal covers and Scholze–Weinstein Theorem A.
  - BunGAndNewtonStrata BG0–BG3: B(G), J_b, B(G, μ) and the Newton stratification of the flag variety.
  - ShimuraCompactifications C0–C5: cusp labels, fans, degenerations and integral toroidal and minimal compactifications.
  - PerfectoidShimuraVarieties S0–S6: perfectoid towers and the Hodge–Tate period maps.
  - HodgeTateAndCanonicalSubgroups T0–T2: the Hasse invariant, the global Hodge–Tate filtration and Scholze–Weinstein Theorem B.
  - DiamondEtaleCohomology C0, C4, C8, DiamondsAndVStacks D5 and DiamondSixOperations: canonical compactifications and dimension theory.
  - ClassicalAdicEtaleCohomology H0–H1: Huber's nearby-cycle comparison.
  - EtaleDualityAndPerverseSheaves EDC.2, EDC.4, EDC.5 and LefschetzPencilsAndVanishingCycles LPV.0, LPV.6: duality, perverse t-structures, Artin vanishing and nearby-cycle exactness.
  - EndoscopicTransferAndUnitaryTraceComparison ET.4–ET.7b: Shin's Igusa trace formula, the twisted trace formula and local transfer.
  - AutomorphicGaloisRepresentationsPartII AG2.0–AG2.7: Galois representations and the residual genericity predicates.
  - ArithmeticLocallySymmetricSpaces ALS.0–ALS.6: locally symmetric spaces, Borel–Serre, boundary Hecke maps and Hecke-adjoint duality.
  - IntegralHeckeAndGaloisDeterminants IHG.0–IHG.4: determinants.
  - TorsionCohomologyInfrastructure TC.3–TC.4.
  - ArithmeticGaloisDuality R02.2: Hochschild–Serre.
- **Exported:**
  - The finite-level and perfect Igusa varieties with their J_b(ℚ_p) × G(𝔸_f^p)-actions (IG.0–IG.1) go to EndoscopicTransferAndUnitaryTraceComparison ET.5 and AutomorphicGaloisRepresentationsPartII AG2.1b.
  - The finite-level formal models of IG.4 go to LefschetzPencilsAndVanishingCycles LPV.6.
  - The concentration theorem and the middle-degree export (IG.7) go to PotentialAutomorphyInfrastructure PA.1–PA.2, which own the degree-shifting applications.
- **Not this roadmap:**
  - The Katz–Hida ordinary tower over Hilbert modular varieties is planned in HodgeTateAndCanonicalSubgroups T5.
  - The compact endgame of CS17 (its Theorems 5.5.7 and 6.3.1, Kottwitz's simple Shimura varieties) belongs to the compact-unitary Part II, as does LTXZZ Appendix D.1 beyond its definition of cohomological genericity.
  - Li–Liu's vanishing lemmas for Drinfeld-level models belong to the unitary arithmetic inner product formula roadmap; this roadmap supplies their Igusa and Newton-stratum inputs.

## Sources

- **CSnc**: A. Caraiani, P. Scholze, *On the generic part of the cohomology of non-compact unitary Shimura varieties*, Ann. of Math. 199 (2024). Read: arXiv:1909.01898v2, §§1–4 and 6, §5.1 and Lemma 5.6.2 (the accepted version; PDF page = printed page); the rest of §5 is the trace-formula comparison imported from EndoscopicTransferAndUnitaryTraceComparison.
- **CS17**: A. Caraiani, P. Scholze, *On the generic part of the cohomology of compact unitary Shimura varieties*, Ann. of Math. 186 (2017), 649–766. Read: the published version, §§4 and 6, §5.2 and Lemma 6.2.2.
- **ACC+**: Allen, Calegari, Caraiani, Gee, Helm, Le Hung, Newton, Scholze, Taylor, Thorne, *Potential automorphy over CM fields*. Read: arXiv:1812.09999v2, Theorem 4.3.3, Definition 4.3.1, §2.2.19 and Theorems 2.3.5, 2.4.2.
- **CN23**: Caraiani–Newton, arXiv:2301.10509v3, Theorem 2.1.28.
- **Kos21**: Koshikawa, arXiv:2106.10602v1, Theorems 1.1, 1.3, 1.4 and 7.1.
- **LTXZZ**: Liu–Tian–Xiao–Zhang–Zhu, Invent. Math. 228 (2022), Appendix D.1.
- **Li–Liu**: Ann. of Math. 194 (2021), proof of Lemma 7.3 (authors' final version).
- **Li–Liu II**: Forum Math. Pi 10 (2022), §4.3.
- **Supporting sources**, cited at the nodes that use them:
  - Scholze–Weinstein, *Moduli of p-divisible groups*.
  - Lan–Stroh, *Compactifications of subschemes* and *Nearby cycles of automorphic étale sheaves*.
  - Boxer's thesis.
  - Nie, *Fundamental elements of an affine Weyl group*.
  - Mantovan (Duke 2005, preprint version).
  - Hamacher (Duke 2015).
  - Oort–Zink (Doc. Math. 2002).
  - Shin (2009).
- **Read to fix the boundaries**, not cited at any node because their content is owned elsewhere:
  - Scholze, *On torsion in the cohomology of locally symmetric varieties* (§§IV.1, V.4): torsion Galois determinants, owned by TorsionCohomologyInfrastructure.
  - Shin, *A stable trace formula for Igusa varieties* (2010, §7): imported from EndoscopicTransferAndUnitaryTraceComparison ET.5.
  - Pink, *On ℓ-adic sheaves on Shimura varieties and their higher direct images in the Baily–Borel compactification* (1992, §4): Theorem 4.2.1 computes i^*Rj_* along boundary strata; IG.6 applies it through the Lan–Stroh axiomatics and cites it through CSnc §6.3.
  - Zink, *On the slope filtration* (2001): the slope filtration enters through Oort–Zink and CS17.
  - Boxer–Calegari–Gee–Pilloni, *Modularity theorems for abelian surfaces* (§4.9): Lemma 4.9.6 belongs to AbelianSurfacesModularity.

Mistakes found in these sources are listed in the section "Mistakes found in the sources". The nodes use the corrected statements.

## Layer overview

| Layer | Title | Nodes | Planets |
|---|---|---|---|
| IG.0 | Newton strata, central leaves and local deformation data | 29 | Quasi-split unitary similitude datum; Newton stratification; Completely slope divisible p-divisible group; Automorphisms of the universal cover X̃_b; Central leaf; Rapoport–Zink space of PEL type |
| IG.1 | Igusa towers and their actions | 10 | Perfect Igusa variety; Mantovan Igusa varieties; Cohomology of Igusa varieties |
| IG.2 | Partial compactifications and affineness | 21 | Well-positioned subscheme; Partial compactifications of well-positioned subsets; Toroidal Igusa variety; Ekedahl–Oort strata and Hasse sections; Affineness of partial minimal compactifications; Partial minimal compactification of Igusa varieties |
| IG.3 | Fibers of compactified Hodge–Tate maps | 26 | Dimension of flag Newton strata; Local Hodge–Tate period map; Canonical lift of the Igusa variety; Product formula for Newton strata; Igusa varieties as Hodge–Tate fibres; Fibres of the compactified Hodge–Tate period map |
| IG.4 | Nearby-cycle semiperversity and support bounds | 10 | Semiperversity of nearby cycles; Partially compactly supported Igusa cohomology; Upper bound from Artin vanishing; Lower bound at a minimal Newton stratum |
| IG.5 | Rational Igusa trace comparison and genericity obstruction | 6 | Dual Hecke ideal; Galois representations of Igusa constituents; Genericity forces the ordinary stratum |
| IG.6 | Equivariant Igusa boundary formula | 7 | Pink formula for Igusa varieties; Boundary length obstruction |
| IG.7 | Localized concentration and arithmetic handoff | 11 | Generic maximal ideals; Caraiani–Scholze vanishing theorem; Middle-degree export (ACC+ Theorem 4.3.3); Koshikawa generic vanishing |

Within each layer the nodes are listed in dependency order. Every node gives its statement, hypotheses, proof or construction steps, acceptance checks, prerequisites and source passages; definitions and constructions also give their uses, API and unit tests. A star ★ marks the planets shown in the atlas. Identifiers of the form `IG.k/slug` abbreviate `IgusaVarietiesAndTorsionConcentration:IG.k/slug`.

## IG.0. Newton strata, central leaves and local deformation data

IG.0 fixes the datum and the special fibre, and develops the local theory of p-divisible groups with G-structure that the Igusa varieties rest on. The global objects are the quasi-split datum with its Hecke operators and the comparison between G and G⁰, the Hasse principle, G-structures, and the integral model S_K. That model is obtained by instantiating PELModuli at principal level and normalizing at primes dividing N. Then come the complex uniformization and the Newton map x ↦ [b_x] ∈ B(G_{ℚ_p}, μ^{−1}). The local objects are completely slope divisible groups and their existence in each isogeny class, Chai–Oort's internal Hom H_{G,G′} with its Dieudonné module and slopes, and the automorphism group Aut_G(X̃_b) of the universal cover. That group maps to J_b(ℚ_p) with fibres perfected formal balls of dimension ⟨2ρ, ν_b⟩. Further local objects are Rapoport–Zink spaces of PEL type, the non-noetherian Berthelot theorem and the isogeny equivalence over strictly henselian perfect rings, and the J_b(ℚ_p)-torsor of quasi-isogenies over a Newton stratum. Central leaves are locally closed and smooth, of dimension ⟨2ρ, ν_b⟩. The finite-level and profinite Igusa torsors exist over seminormal, perfect and regular bases. Serre–Tate extends to semi-abelian schemes, beyond the classical statement imported from A4. Finally, the Drinfeld-level Newton strata of Harris–Taylor type data serve the Li–Liu consumers.

Imports from other roadmaps in this layer: `AbelianSchemesAndArithmeticModuli:A4`, `AdelicAlgebraicGroups:AA.4/hasse-principle-simply-connected`, `AdicSpacesPartII:F0/locally-noetherian-formal-scheme`, `AdicSpacesPartII:R2/admissible-formal-scheme`, `AdicSpacesPartII:R2/formal-etale-site-invariance`, `BunGAndNewtonStrata:BG0/g-isocrystals-and-B-of-G`, `BunGAndNewtonStrata:BG0/sigma-centralizer-J-b`, `BunGAndNewtonStrata:BG1`, `BunGAndNewtonStrata:BG1/newton-and-kottwitz-maps`, `BunGAndNewtonStrata:BG1/partial-order-on-B-of-G`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-divisible-cartier-dual`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-divisible-connected-etale`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-divisible-group`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/dieudonne-p-divisible`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/dieudonne-slopes`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/isogeny-classification`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6/abelian-scheme-torsion-finite-flat`, `PELModuli:M0/determinant-condition`, `PELModuli:M0/integral-pel-datum`, `PELModuli:M0/similitude-group`, `PELModuli:M0/unramified-tau-decomposition`, `PELModuli:M1/moduli-problem`, `PELModuli:M1/principal-level-structure`, `PELModuli:M1/unitary-of-abelian-scheme`, `PELModuli:M2/representability`, `PELModuli:M2/unitary-deformation`, `PELModuli:M2/universal-family`, `PELModuli:M3/algebraization-of-components`, `PELModuli:M3/complex-points`, `PELModuli:M3/hasse-principle-cases`, `SchemeAndStackFoundations:SF.4`, `VectorBundlesAndIsocrystals:VB0/dieudonne-manin-isocrystals`.

### `quasi-split-unitary-datum` — The quasi-split unitary similitude datum (F, V, L, G, G⁰) and its locally symmetric spaces ★

Declaration `IgusaVarietiesAndTorsionConcentration:IG.0/quasi-split-unitary-datum` (definition). Planet: Quasi-split unitary similitude datum. Suggested home: `TauCeti/ShimuraVarieties/Igusa/Datum` (`TauCeti.Igusa.UnitarySimilitudeDatum`).

Fix a CM field F with maximal totally real subfield F⁺ and an integer n ≥ 1. Let V = F^{2n} with the skew-hermitian form ⟨x, y⟩ = Σ_{i=1}^{n} (x_i ȳ_{2n+1−i} − x_{2n+1−i} ȳ_i) and the alternating form (x, y) = tr_{F/ℚ}⟨x, y⟩, and fix an O_F-lattice L ⊂ V that is self-dual for (·,·) (for example L = O_F^n ⊕ 𝔡^{−1,n}, 𝔡^{−1} the inverse different). The unitary similitude group is the group scheme G over ℤ with G(R) = {(g, c) ∈ GL_{O_F}(L)(R) × 𝔾_m(R) : (gv, gw) = c(v, w) for all v, w ∈ L}, and the unitary group is G⁰ = ker(c : G → 𝔾_m). The symmetric space of G(ℝ) is X = ∏_{τ:F⁺↪ℝ} X_{τ,+} ⊔ ∏_τ X_{τ,−}, with X_{τ,±} the positive (negative) definite n-dimensional subspaces of V ⊗_{F⁺,τ} ℝ ≅ ℂ^{2n}, and X⁰ = ∏_τ X_{τ,+}. For a neat compact open K ⊂ G(𝔸_f), X_K = G(ℚ)\(X × G(𝔸_f)/K) is a real manifold of dimension 2d with d = [F⁺:ℚ]n²; X⁰_{K⁰} is defined in the same way for G⁰. For N ≥ 3, K(N) = {g ∈ G(ℤ̂) : g ≡ 1 mod N}. For a finite set S of rational primes, the Hecke algebra 𝕋^S is generated over ℤ by the double coset operators T_{i,v} (1 ≤ i ≤ 2n, v a prime of F above p ∉ S with p split in a fixed imaginary quadratic F₀ ⊂ F) inside ⊗_{p∉S, p split in F₀} ℤ[G(ℚ_p)//G(ℤ_p)], and 𝕋^{0,S} = ⊗ ℤ[G⁰(ℚ_p)//G⁰(ℤ_p)].

Hypotheses:

- F is a CM field, n ≥ 1, L ⊂ V is a self-dual O_F-lattice for (·,·).
- K ⊂ G(𝔸_f) is neat (K(N) with N ≥ 3 is neat).
- The Hecke operators T_{i,v} are only defined for v above primes p ∉ S split in the imaginary quadratic subfield F₀ ⊂ F; when F contains no such F₀ only the level and the space are used.

Proof or construction:

1. Define G and G⁰ as closed subgroup schemes of GL_{O_F}(L) × 𝔾_m cut out by the similitude equation; G_ℝ ≅ GU(n, n)^{[F⁺:ℚ]} up to the similitude factor and G⁰_ℝ ≅ U(n, n)^{[F⁺:ℚ]} is quasi-split.
2. Define X as the G(ℝ)-orbit of the definite n-dimensional subspaces; its two families of components are exchanged by elements of negative similitude factor.
3. Define X_K as the double quotient and record that for neat K it is a disjoint union of quotients of X by torsion-free congruence subgroups of G(ℚ), hence a manifold of real dimension 2d.
4. Define T_{i,v} as the characteristic function of GL_{2n}(O_{F_v}) diag(ϖ_v, …, ϖ_v, 1, …, 1) GL_{2n}(O_{F_v}) (i entries ϖ_v) times ∏_{w|p, w≠v} GL_{2n}(O_{F_w}) (times ℤ_p^× for G), using G(ℚ_p) ≅ ℚ_p^× × ∏_{w|p, w|𝔭} GL_{2n}(F_w) for p split in F₀ (CSnc §2.1; the second product runs over w | 𝔮, sourceIssues PAPER-CARAIANI-SCHOLZE-24/E4).

Uses:

- CSnc Theorem 1.1 and §2.8: X_K, d = [F⁺:ℚ]n² and 𝕋^S are the objects of the main vanishing theorem
- IG.0/integral-model: the PEL datum (O_F, *, V, (·,·), L) instantiates the PEL moduli problem S_K
- IG.7/caraiani-scholze-vanishing: the localized cohomology H^i(X_K, 𝔽_ℓ)_𝔪 is computed for this datum
- EndoscopicTransferAndUnitaryTraceComparison:ET.5: Shin's Igusa trace formula is applied to this G (no ker¹ factor by the Hasse principle)

API:

- `UnitarySimilitudeDatum.group` (data): The group scheme G over ℤ with its similitude character c : G → 𝔾_m.
- `UnitarySimilitudeDatum.unitaryGroup` (data): G⁰ = ker c, a closed subgroup scheme of G.
- `UnitarySimilitudeDatum.locallySymmetricSpace` (constructor): X_K = G(ℚ)\(X × G(𝔸_f)/K) for neat K.
- `UnitarySimilitudeDatum.dim_locallySymmetricSpace` (characterisation): dim_ℝ X_K = 2[F⁺:ℚ]n².
- `UnitarySimilitudeDatum.heckeOperator` (constructor): T_{i,v} ∈ 𝕋^S for 1 ≤ i ≤ 2n and v | p ∉ S split in F₀.
- `UnitarySimilitudeDatum.heckeRestrict_heckeOperator` (simp): The restriction 𝕋^S → 𝕋^{0,S} maps T_{i,v} to T⁰_{i,v}.
- `UnitarySimilitudeDatum.toPELDatum` (coercion): The underlying PEL datum (F, complex conjugation, V, (·,·), L) of PELModuli M0.

Unit tests:

- `UnitarySimilitudeDatum.dim_imagQuadratic_one` (computation): For F imaginary quadratic and n = 1 the space X_{K(N)} has real dimension 2 (d = 1).
- `UnitarySimilitudeDatum.selfDual_standardLattice` (characterisation): The lattice O_F^n ⊕ 𝔡^{−1,n} is self-dual for (x, y) = tr⟨x, y⟩.
- `UnitarySimilitudeDatum.unitaryGroup_ne_group` (non-example): G⁰(ℚ) ≠ G(ℚ): the scalar 2 ∈ ℚ^× ⊂ F^× lies in G(ℚ) with similitude factor c = 4 ≠ 1, so it is not in G⁰(ℚ).
- `UnitarySimilitudeDatum.unitaryGroup_compat` (compatibility): For a ℚ-algebra R, G⁰(R) = {g ∈ GL_{2n}(F ⊗ R) : gᵀ J ḡ = J}, J the antidiagonal matrix of ⟨·,·⟩ (signature (n, n)); this is not Mathlib's Matrix.unitaryGroup, which preserves the identity form, and over ℤ the lattice L ⊗ R need not be free over O_F ⊗ R unless the different is principal.

Acceptance:

- For F imaginary quadratic and n = 1, G⁰ is the quasi-split U(1, 1) and X_{K(N)} has real dimension 2.
- L = O_F^n ⊕ 𝔡^{−1,n} is self-dual for (·,·).
- The restriction map 𝕋^S → 𝕋^{0,S} sends T_{i,v} to T⁰_{i,v}.

Depends on: `PELModuli:M0/integral-pel-datum`, `PELModuli:M0/similitude-group`, `PELModuli:M0/unramified-tau-decomposition`, `tauceti:TauCeti.ReductiveAffineGroupSchemeCat`, `mathlib:Matrix.unitaryGroup`, `mathlib:NumberField.IsCMField`.

Used by: `unitary-subgroup-comparison`, `hasse-principle`, `g-structure`, `integral-model`, `unramified-local-pel-datum`, `unit-similitude-quasi-isogeny`, `dual-hecke-ideal`, `cs-generic-maximal-ideal`, `koshikawa-generic-vanishing`.

Sources:

- CSnc §2.1, p. 11 (csnc): “Fix any self-dual OF -lattice L ⊂ V , and deﬁne the group G over Z by G(R) = {(g,c) ∈ GLOF (L)(R) × Gm(R) | (gv,gw) = c(v,w) ∀v,w ∈ L} , which is a unitary similitude group. We let X = Y τ:F+֒→R Xτ,+ ⊔ Y τ:F+֒→R Xτ,− be” — Defines the unitary similitude group G over ℤ as the stabiliser of the alternating form up to a scalar.
- CSnc §2.1, p. 11 (csnc): “which is a unitary similitude group. We let X = Y τ:F+֒→R Xτ,+ ⊔ Y τ:F+֒→R Xτ,− be the symmetric space for G(R), where Xτ,+ (resp. Xτ,−) is the space of positive (resp. negative) deﬁnite” — The symmetric space X as a disjoint union of products of the spaces X_{τ,±}.

### `unitary-subgroup-comparison` — The unitary locally symmetric space is open and closed in the similitude one (CSnc Lemma 2.1.1)

Declaration `IgusaVarietiesAndTorsionConcentration:IG.0/unitary-subgroup-comparison` (theorem).

Let K ⊂ G(𝔸_f) be neat and K⁰ = K ∩ G⁰(𝔸_f). The inclusion G⁰ ↪ G induces an open and closed immersion X⁰_{K⁰} → X_K, and the induced maps H^i(X_K, ·) → H^i(X⁰_{K⁰}, ·) and H^i_c(X⁰_{K⁰}, ·) → H^i_c(X_K, ·) are equivariant for the restriction map 𝕋^S → 𝕋^{0,S}.

Hypotheses:

- K neat and K⁰ = K ∩ G⁰(𝔸_f).

Proof or construction:

1. Use the exact sequence 1 → G⁰ → G → 𝔾_m → 1 given by the similitude character; X⁰ is a connected component of X.
2. Injectivity: if (h₁, g₁) = γ(h₂, g₂)k with h_i ∈ X⁰, g_i ∈ G⁰(𝔸_f), γ ∈ G(ℚ), k ∈ K, then c(γ) = c(k)^{−1} ∈ ℚ^× ∩ ∏ℤ_p^× = {±1}, and h₁ = γh₂ forces c(γ) > 0, so γ ∈ G⁰(ℚ), k ∈ K⁰.
3. Both spaces are disjoint unions of quotients of X⁰ by congruence subgroups, so an injective local homeomorphism between them is an open and closed immersion; Hecke equivariance is immediate from the definitions of T_{i,v} and T⁰_{i,v}.

Acceptance:

- The localized vanishing for X_K (IG.7) implies the same vanishing for X⁰_{K⁰} at the restricted maximal ideal.
- For F imaginary quadratic and n = 1 the comparison exhibits the U(1, 1) locally symmetric space as a union of components of the GU(1, 1) one.

Depends on: `quasi-split-unitary-datum`.

Used by: `level-descent`.

Sources:

- CSnc §2.1, Lemma 2.1.1, p. 12 (csnc): “Lemma 2.1.1. Assume that K0 = K ∩ G0(Af ). The inclusion G0 ֒→ G induces a natural map X0 K0 → XK, which is an open and closed immersion. The induced map on cohomology and compactly supported cohomology is Hecke-equivariant for the restriction map TS → T0,S .” — States the open and closed immersion and the Hecke equivariance.

### `hasse-principle` — The Hasse principle for the unitary similitude group (CSnc Proposition 2.1.2)

Declaration `IgusaVarietiesAndTorsionConcentration:IG.0/hasse-principle` (theorem).

The map H¹(ℚ, G) → ∏_v H¹(ℚ_v, G), v running over all places of ℚ, is injective. Equivalently, a 2n-dimensional F-vector space V′ with an alternating form (·,·)′ satisfying (xv, w)′ = (v, x̄w)′ that is isomorphic to (V, (·,·)) up to a scalar after base change to every completion ℚ_v is isomorphic to it up to a scalar over ℚ.

Hypotheses:

- G is the unitary similitude group of the quasi-split datum.

Proof or construction:

1. The derived group G^der is simply connected, so H¹(ℚ, G^der) = 0 and it suffices to treat the torus D = G/G^der (CSnc, after Kottwitz [Kot92, §7]).
2. D is the subtorus of Res_{F/ℚ}𝔾_m × 𝔾_m of pairs (z, t) with Nm_{F/F⁺}(z) = t^n; (z, t) ↦ (z/t^n, t) identifies it with Res_{F⁺/ℚ}T × 𝔾_m for T = ker(Nm : Res_{F/F⁺}𝔾_m → 𝔾_m).
3. Both tori satisfy the Hasse principle (Hilbert 90 for 𝔾_m and the Hasse norm theorem for the cyclic extension F/F⁺).

Acceptance:

- ker¹(ℚ, G) = 1, so the PEL moduli space S_K(ℂ) is a single copy of X_K (used in IG.0/complex-uniformization) and Shin's Igusa trace formula carries no |ker¹(ℚ, G)| factor (CSnc §5.3).
- The printed statement lets v run over the places of F; the places of ℚ are meant (sourceIssues PAPER-CARAIANI-SCHOLZE-24/E1).

Depends on: `quasi-split-unitary-datum`, `AdelicAlgebraicGroups:AA.4/hasse-principle-simply-connected`, `PELModuli:M3/hasse-principle-cases`.

Used by: `complex-uniformization`.

Sources:

- CSnc §2.1, Proposition 2.1.2, p. 12 (csnc): “Proposition 2.1.2. The group G satisfies the Hasse principle, i.e. the map H1 (Q,G) → Y v H1 (Qv,G) is injective, where” — States the Hasse principle for G; the corrected index set is the places of ℚ.

### `g-structure` — Abelian varieties and p-divisible groups with G-structure (CSnc Definition 2.1.3)

Declaration `IgusaVarietiesAndTorsionConcentration:IG.0/g-structure` (definition). Suggested home: `TauCeti/ShimuraVarieties/Igusa/GStructure` (`TauCeti.Igusa.PDivGStructure`).

(1) For a scheme S over ℤ[1/Δ_F], an abelian variety with G-structure over S is a triple (A, ι, λ): an abelian scheme A/S of relative dimension [F:ℚ]n, an action ι : O_F → End(A) such that Lie A is a free O_F ⊗_ℤ O_S-module of rank n, and a principal polarization λ : A ≅ A^∨ whose Rosati involution induces complex conjugation on O_F. (2) For a prime p unramified in F and a scheme S on which p is locally nilpotent, a p-divisible group with G-structure over S is a triple (X, ι, λ) with X a p-divisible group of height 2[F:ℚ]n and dimension [F:ℚ]n, ι : O_F → End(X) with Lie X free of rank n over O_F ⊗_ℤ O_S, and λ : X ≅ X^∨ a principal polarization whose Rosati involution is complex conjugation via ι. Morphisms are O_F-linear maps respecting λ (isomorphisms may respect λ up to ℤ_p^× when stated, as in Igusa level structures).

Hypotheses:

- p unramified in F in (2); the rank condition on Lie is the determinant (Kottwitz) condition of the split signature (n, n) at every place.

Proof or construction:

1. Specialise the PEL data of PELModuli M0 to (O_F, complex conjugation, L, (·,·)) with signature (n, n) at every archimedean place; the Kottwitz determinant condition becomes freeness of Lie A of rank n over O_F ⊗ O_S because the signature is (n, n).
2. The p-divisible group A[p^∞] of an abelian variety with G-structure is a p-divisible group with G-structure (height 2[F:ℚ]n = 2 dim A).

Uses:

- IG.0/central-leaf: a central leaf is the locus where A[p^∞] is geometrically isomorphic to a fixed p-divisible group with G-structure
- IG.1/perfect-igusa-variety: Igusa level structures are isomorphisms of p-divisible groups with G-structure, respecting λ up to ℤ_p^×
- IG.3/compactified-igusa-to-shimura: the p-divisible group 𝒳_{O_C} over O_C attached to a flag point carries a G-structure

API:

- `PDivGStructure.ofAbelian` (constructor): A[p^∞] of an abelian variety with G-structure (A, ι, λ) is a p-divisible group with G-structure.
- `PDivGStructure.baseChange` (functoriality): Base change along T → S of a p-divisible group with G-structure is one, compatibly with composition.
- `PDivGStructure.height_eq` (characterisation): The height is 2[F:ℚ]n and the dimension [F:ℚ]n.
- `PDivGStructure.Iso` (data): Isomorphisms: O_F-linear isomorphisms carrying λ to a ℤ_p^×-multiple of λ′ (or exactly to λ′ for strict isomorphisms).
- `PDivGStructure.cartierDual` (relation): λ identifies X with X^∨ semilinearly for complex conjugation on O_F.

Unit tests:

- `PDivGStructure.ordinary_exists` (computation): Over 𝔽̄_p with p unramified in F (signature (n, n) makes the ordinary element admissible for every such p), μ_{p^∞} ⊗ O_F^n ⊕ (ℚ_p/ℤ_p) ⊗ O_F^n with the standard polarization is a p-divisible group with G-structure of height 2[F:ℚ]n.
- `PDivGStructure.lie_rank_condition` (non-example): An O_F-stable p-divisible group of the right height whose Lie algebra is free of rank ≠ n over O_F ⊗ O_S (signature (n+1, n−1)) is not a p-divisible group with G-structure.
- `PDivGStructure.ofAbelian_height` (compatibility): For an abelian variety with G-structure A, the height of A[p^∞] is 2 dim A = 2[F:ℚ]n.

Acceptance:

- A[p^∞] of an abelian variety with G-structure over an 𝔽_p-scheme is a p-divisible group with G-structure.
- Over k = 𝔽̄_p with p split in F, μ_{p^∞} ⊗ O_F^n ⊕ (ℚ_p/ℤ_p) ⊗ O_F^n with the evident polarization is a p-divisible group with G-structure (the ordinary one).

Depends on: `quasi-split-unitary-datum`, `PELModuli:M1/moduli-problem`, `PELModuli:M1/unitary-of-abelian-scheme`, `PELModuli:M0/determinant-condition`, `PELModuli:M1/principal-level-structure`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-divisible-group`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-divisible-cartier-dual`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-divisible-connected-etale`.

Used by: `integral-model`, `newton-map`, `splitting-symplectic-filtrations`, `liftable-automorphisms`, `central-leaf`, `isomorphism-locus-constructible`, `perfect-igusa-variety`, `ekedahl-oort-stratification`, `flag-points-and-p-divisible-groups`.

Sources:

- CSnc §2.1, Definition 2.1.3(2), p. 13 (csnc): “Let p be a prime that is unramified in F and let S be a scheme on which p is locally nilpotent. A p-divisible group with G-structure over S is a triple (X,ι,λ) where X is a p-divisible group of height 2[F : Q]n and dimension [F : Q]n, ι : OF → End(X) is an OF” — Defines p-divisible groups with G-structure; (1) is the analogous definition for abelian varieties.

### `integral-model` — The integral model S_K of the unitary Shimura variety (CSnc Definitions 2.1.4–2.1.5)

Declaration `IgusaVarietiesAndTorsionConcentration:IG.0/integral-model` (construction). Suggested home: `TauCeti/ShimuraVarieties/Igusa/IntegralModel` (`TauCeti.Igusa.IntegralModel`).

For N ≥ 3 and K = K(N), let S^pre_K over ℤ[1/Δ_F] parametrize over a test scheme S an abelian variety with G-structure (A, ι, λ), an O_F-linear map η : L/N → A[N] and a primitive N-th root of unity ζ_N ∈ μ_N(O_S) such that η carries (·,·) mod N to the Weil pairing of λ via ζ_N, and such that η extends to compatible O_F-linear maps L/Δ_F^m N → A[Δ_F^m N] for all m ≥ 1. It is a Deligne–Mumford stack, representable after base change to ℤ[1/(Δ_F N)] and after base change to ℤ_(p) whenever the prime-to-p part of N is at least 3. S_K is the normalization of S^pre_K in S^pre_K × ℤ[1/(Δ_F N)]. For p ∤ NΔ_F, S_K ×_ℤ ℤ_(p) is the smooth PEL integral model of PELModuli M2 with hyperspecial level at p; its special fibre S_{K,k} = S_K ×_{𝔽_p} k (k = 𝔽̄_p) carries the universal p-divisible group with G-structure A[p^∞].

Hypotheses:

- N ≥ 3, K = K(N); at primes dividing N the moduli problem has no claimed geometric properties and only its normalization is used.

Proof or construction:

1. Instantiate the PEL moduli functor of PELModuli M1 for the PEL datum underlying IG.0/quasi-split-unitary-datum with principal level N and the lifting condition at Δ_F; do not build a second PEL functor.
2. Representability: relatively representable over the Siegel moduli space of principal level N ≥ 3 (PELModuli M2); away from Δ_F N and over ℤ_(p) with the prime-to-p part of N ≥ 3 it is a quasi-projective scheme.
3. Normalize in the generic fibre to obtain S_K; over ℤ_(p) with p ∤ NΔ_F the normalization does nothing because S^pre_K is smooth there (PELModuli M2).

Uses:

- IG.0/central-leaf: central leaves are locally closed subschemes of the special fibre S_{K,k}
- IG.2/well-positioned-subscheme: the toroidal and minimal compactifications of S_K (ShimuraCompactifications C5) are the ambient spaces of the partial compactifications
- IG.3/good-reduction-locus: the good-reduction locus S° of the perfectoid Shimura variety is the generic fibre of the p-adic completion of S_K

API:

- `IntegralModel.moduli` (characterisation): S_K represents (A, ι, λ, η, ζ_N) with the lifting condition, away from Δ_F N.
- `IntegralModel.smooth_of_good` (instance): For p ∤ NΔ_F, S_K ⊗ ℤ_(p) → Spec ℤ_(p) is smooth of relative dimension d.
- `IntegralModel.universalPDiv` (data): The universal p-divisible group with G-structure A[p^∞] over S_K ⊗ ℤ_(p).
- `IntegralModel.hecke` (functoriality): Prime-to-p Hecke correspondences [g] for g ∈ G(𝔸_f^p), compatible with composition.
- `IntegralModel.toPELModuli` (coercion): Over ℤ_(p) with p ∤ NΔ_F, S_K is the PELModuli M2 integral model of the underlying PEL datum.

Unit tests:

- `IntegralModel.relDim` (computation): For p ∤ NΔ_F the relative dimension of S_K ⊗ ℤ_(p) is [F⁺:ℚ]n²; for F imaginary quadratic and n = 1 it is a relative curve.
- `IntegralModel.generic_points` (compatibility): S_K(ℂ) ≅ X_K (IG.0/complex-uniformization).
- `IntegralModel.not_smooth_at_N` (non-example): For F imaginary quadratic, n = 1 and N = p ≥ 3 with p ∤ Δ_F, S_K ⊗ ℤ_(p) is not smooth over ℤ_(p) (full level-p structure, as for Katz–Mazur modular curves); smoothness holds only away from N.

Acceptance:

- For p ∤ NΔ_F, S_K ⊗ ℤ_(p) is smooth of relative dimension d = [F⁺:ℚ]n².
- The Hecke action of G(𝔸_f^{p}) by prime-to-p isogenies on the tower (S_{K^pK_p})_{K^p} is the one of PELModuli M2.

Depends on: `quasi-split-unitary-datum`, `g-structure`, `PELModuli:M1/moduli-problem`, `PELModuli:M1/unitary-of-abelian-scheme`, `PELModuli:M0/determinant-condition`, `PELModuli:M1/principal-level-structure`, `PELModuli:M2/representability`, `PELModuli:M2/universal-family`, `PELModuli:M2/unitary-deformation`.

Used by: `complex-uniformization`, `newton-map`, `central-leaf`, `drinfeld-level-newton-strata`, `perfect-igusa-variety`, `well-positioned-subscheme`, `ekedahl-oort-stratification`, `good-reduction-locus`.

Sources:

- CSnc §2.1, Definition 2.1.4, p. 13 (csnc): “Let Spre K over SpecZ[ 1 ∆F ] parametrize over a test scheme S an abelian variety with G-structure A = (A,ι,λ) together with an OF -linear map L/N → A[N] and a primitive N-th root of unity ζN ∈” — Defines the moduli problem S^pre_K with its level structure and lifting condition.
- CSnc §2.1, Definition 2.1.5, p. 13 (csnc): “Let SK be the normalization of Spre K in Spre K × Z[ 1 ∆F N ]. The reason for” — Defines S_K as a normalization.

### `complex-uniformization` — Complex uniformization of the integral model (CSnc Proposition 2.1.6)

Declaration `IgusaVarietiesAndTorsionConcentration:IG.0/complex-uniformization` (theorem).

There is a natural isomorphism of complex manifolds X_K ≅ S_K(ℂ), equivariant for the Hecke action of G(𝔸_f).

Hypotheses:

- K = K(N) with N ≥ 3.

Proof or construction:

1. For (A, ι, λ) over ℂ, L′ = H₁(A, ℤ) is a finite projective O_F-module of rank 2n with a perfect alternating form; by the Hasse principle (IG.0/hasse-principle) there is an F-linear isomorphism L_ℚ ≅ L′_ℚ compatible with the forms up to scalar, since local isomorphisms exist: same signature at ∞ by the Lie condition, self-dual lattices at unramified primes, and the lifting condition of Definition 2.1.4 at ramified primes.
2. The choices of such isomorphisms form a G(ℚ)-torsor over S_K(ℂ); the Hodge filtration gives the point of X and the level structure the point of G(𝔸_f)/K (PELModuli M3).

Acceptance:

- S_K(ℂ) is a single copy of X_K (ker¹(ℚ, G) = 1).

Depends on: `integral-model`, `hasse-principle`, `PELModuli:M3/complex-points`, `PELModuli:M3/algebraization-of-components`.

Used by: `level-descent`.

Sources:

- CSnc §2.1, Proposition 2.1.6, p. 13 (csnc): “Proposition 2.1.6. There is a natural isomorphism of manifolds XK ∼ = SK(C).” — States X_K ≅ S_K(ℂ).

### `unramified-local-pel-datum` — Unramified local PEL data of type (A) or (C) and the p-divisible group X_b (CS17 §4.2)

Declaration `IgusaVarietiesAndTorsionConcentration:IG.0/unramified-local-pel-datum` (definition). Suggested home: `TauCeti/ShimuraVarieties/Igusa/LocalPEL` (`TauCeti.Igusa.LocalPELDatum`).

An unramified local PEL datum D^int = (B, *, V, (·,·), O_B, Λ, μ, b) consists of: a finite-dimensional semisimple ℚ_p-algebra B with anti-involution *, which is a product of matrix algebras over unramified extensions of ℚ_p; a *-stable maximal ℤ_p-order O_B; a finite left B-module V with an alternating form (·,·) : V × V → ℚ_p such that (bv, w) = (v, b*w); an O_B-stable lattice Λ ⊂ V self-dual for (·,·), so that G(R) = {(g, c) ∈ GL_{B⊗R}(V ⊗ R) × R^× : (gv, gw) = c(v, w)} extends to a reductive group G over ℤ_p, assumed connected (type D excluded); a conjugacy class μ : 𝔾_m → G_{ℚ̄_p} of cocharacters with weights 0 and 1 on V, V_{ℚ̄_p} = V₀ ⊕ V₁ with both summands totally isotropic and c ∘ μ = id, with field of definition E; and b ∈ G(L), L = W(𝔽̄_p)[1/p], with [b] ∈ B(G, μ^{−1}). The slopes of b on V lie in [−1, 0] in the paper's (nonstandard) covariant normalization of the Dieudonné module, so there is a p-divisible group X_b over 𝔽̄_p with O_B-action and principal polarization, unique up to quasi-isogeny, whose rational covariant Dieudonné module is V ⊗ L with Frobenius b σ. Global PEL data of type (A) or (C) unramified at p with hyperspecial level give such a datum at every b ∈ B(G_{ℚ_p}, μ^{−1}).

Hypotheses:

- B is a product of matrix algebras over unramified extensions of ℚ_p (unramified datum).
- G connected: data of type D are excluded.
- p = 2 is allowed in this unramified setting without type D.

Proof or construction:

1. Record the datum and the reductive model G_{ℤ_p} = Aut(Λ, (·,·) up to scalar).
2. Import B(G), the Newton and Kottwitz maps and B(G, μ^{−1}) from BunGAndNewtonStrata BG0–BG1; do not redefine them.
3. Construct X_b by Dieudonné–Manin and the classification of isocrystals (FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2): the isocrystal (V ⊗ L, bσ) has slopes in [0, 1], so it is the rational Dieudonné module of a p-divisible group; the O_B-action and the polarization come from the B-action on V and (·,·).
4. For the quasi-split unitary datum at p split in F, D^int is the product over places w | p of GL_{2n}(F_w) data together with the similitude factor (CSnc §5.1).

Uses:

- IG.0/pel-rapoport-zink-space: the Rapoport–Zink space 𝔐_{D^int} is the deformation space of X_b with its extra structures
- IG.0/automorphism-group-of-universal-cover: Aut_G(X̃_b) is defined from X_b with its O_B-action and polarization
- IG.0/newton-map: every point of the special fibre of a PEL Shimura variety gives such a datum at its Newton point
- IG.3/local-hodge-tate-period-map: the flag variety Fℓ_{G,μ} and its b-stratum are defined from the datum

API:

- `LocalPELDatum.reductiveModel` (data): The reductive group scheme G_{ℤ_p} stabilising Λ and (·,·) up to scalar.
- `LocalPELDatum.pdivOfB` (constructor): The p-divisible group X_b over 𝔽̄_p with O_B-action and principal polarization attached to b ∈ B(G, μ^{−1}).
- `LocalPELDatum.pdivOfB_isocrystal` (characterisation): The rational Dieudonné module of X_b is (V ⊗ L, bσ) with its O_B-action and pairing.
- `LocalPELDatum.pdivOfB_unique` (extensionality): X_b is unique up to quasi-isogeny respecting the extra structures.
- `LocalPELDatum.ofGlobal` (constructor): A global PEL datum of type (A) or (C), unramified at p with hyperspecial K_p, gives a local datum D^int_b for every b ∈ B(G_{ℚ_p}, μ^{−1}).
- `LocalPELDatum.J` (data): The group J_b(ℚ_p) of self-quasi-isogenies of X_b respecting the extra structures, identified with J_b of BunGAndNewtonStrata BG0.

Unit tests:

- `LocalPELDatum.pdivOfB_ordinary` (computation): For the unitary datum at p split in F and b ordinary, X_b ≅ (μ_{p^∞} ⊕ ℚ_p/ℤ_p) ⊗_{ℤ_p} O_F^n ⊗ ℤ_p with the standard polarization.
- `LocalPELDatum.pdivOfB_basic_isoclinic` (characterisation): For the quasi-split unitary datum and b basic, X_b is isoclinic of slope 1/2.
- `LocalPELDatum.typeD_excluded` (non-example): An orthogonal datum (* of type D, G disconnected) is not an unramified local PEL datum in this sense.
- `LocalPELDatum.J_compat` (compatibility): J_b(ℚ_p) = Aut(X_b, extra structures) ⊗ ℚ equals the σ-centraliser of b imported from BunGAndNewtonStrata BG0.

Acceptance:

- For the quasi-split unitary datum and b ordinary, X_b ≅ (μ_{p^∞} ⊕ ℚ_p/ℤ_p) ⊗ O_F^n with the standard polarization.
- For b basic X_b is isoclinic.

Depends on: `quasi-split-unitary-datum`, `BunGAndNewtonStrata:BG0/g-isocrystals-and-B-of-G`, `BunGAndNewtonStrata:BG0/sigma-centralizer-J-b`, `BunGAndNewtonStrata:BG1/newton-and-kottwitz-maps`, `BunGAndNewtonStrata:BG1`, `BunGAndNewtonStrata:BG1/partial-order-on-B-of-G`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/dieudonne-p-divisible`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/dieudonne-slopes`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/isogeny-classification`, `VectorBundlesAndIsocrystals:VB0/dieudonne-manin-isocrystals`.

Used by: `newton-map`, `automorphism-group-of-universal-cover`, `pel-rapoport-zink-space`, `unit-similitude-quasi-isogeny`, `igusa-cusp-labels`, `local-hodge-tate-period-map`.

Sources:

- CS17 §4.2, p. 697 (cs17): “weights of µ on V imply that the slopes of b on V are in [−1,0]. In particular, in our (nonstandard) normalization of the covariant Dieudonné module, there is a p-divisible group Xb over F̄p whose” — States that the slopes of b lie in the allowed range, so that the p-divisible group X_b exists.
- CS17 §4.2, p. 696 (cs17): “Fix a finite-dimensional, semisimple algebra B over Qp, endowed with an antiinvolution ∗, and a finite left B-module V equipped with an alternating bilinear form (·,·) : V ⊗Qp V → Qp such that (bv,w)” — Opens the definition of the local PEL data.

### `newton-map` — The Newton map x ↦ [b_x] and the Newton stratification of the special fibre (CS17 §4.3; CSnc §2.7) ★

Declaration `IgusaVarietiesAndTorsionConcentration:IG.0/newton-map` (construction). Planet: Newton stratification. Suggested home: `TauCeti/ShimuraVarieties/Igusa/Newton` (`TauCeti.Igusa`).

Let S be the special fibre over k = 𝔽̄_p of the integral model of a PEL Shimura variety of type (A) or (C) with hyperspecial level at p (for the quasi-split unitary datum: S_{K,k} with p ∤ NΔ_F). For a point x ∈ S with geometric point x̄, the rational Dieudonné module of A_x̄[p^∞] with its extra structures is an isocrystal with G-structure, classified by an element b_x ∈ B(G_{ℚ_p}); then [b_x] ∈ B(G_{ℚ_p}, μ^{−1}) (Rapoport–Richartz), with μ the Hodge cocharacter. The Newton stratum S^b = {x : [b_x] = b} is locally closed, and S = ⊔_{b ∈ B(G_{ℚ_p}, μ^{−1})} S^b. For each b fix a completely slope divisible X_b over k with G-structure in the isogeny class b (CS17 §4.3, after [Man05, §3]). The map x ↦ [b_x] is the PEL-specific map; B(G), the Newton map ν, the Kottwitz map κ, the order and B(G, μ) are those of BunGAndNewtonStrata BG0–BG1, with the sign of μ recorded: the Shimura variety has Hodge cocharacter μ and the strata are indexed by B(G, μ^{−1}).

Hypotheses:

- PEL datum of type (A) or (C) unramified at p with hyperspecial K_p; for the quasi-split unitary datum p ∤ NΔ_F.

Proof or construction:

1. Attach to A_x̄[p^∞] its covariant Dieudonné module with O_B-action and polarization (FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2); the rational module is an isocrystal with G-structure because the extra structures are tensors fixed by G.
2. Its class lies in B(G, μ^{−1}) by Mazur's inequality with the Kottwitz condition (Rapoport–Richartz; imported as the description of B(G, μ) in BunGAndNewtonStrata BG1).
3. Local constancy and semicontinuity of the Newton polygon (Grothendieck–Katz) give that S^b is locally closed and that the closure of S^b is contained in ⊔_{b′ ≤ b} S^{b′} for the order of BG1; the closure equality is not used.
4. Choose X_b completely slope divisible in its isogeny class (IG.0/slope-filtration-existence).

Uses:

- IG.0/central-leaf: every central leaf lies in a single Newton stratum S^b
- IG.3/newton-strata-correspond: on rank-one points the stratification corresponds under π_HT to the Newton strata Fℓ^b of the flag variety
- IG.4/minimal-stratum-lower-bound: the induction runs over b ∈ B(G_{ℚ_p}, μ^{−1}) ordered by d_b = ⟨2ρ, ν_b⟩
- EndoscopicTransferAndUnitaryTraceComparison:ET.5: Shin's counting formula sums over the Newton strata of the special fibre

API:

- `newtonPoint` (constructor): For x ∈ S(k), the class [b_x] ∈ B(G_{ℚ_p}, μ^{−1}).
- `newtonStratum` (constructor): S^b, a locally closed reduced subscheme of S.
- `newtonStratum_disjoint_union` (characterisation): S is the disjoint union of the S^b over b ∈ B(G_{ℚ_p}, μ^{−1}).
- `closure_newtonStratum_subset` (relation): The closure of S^b is contained in the union of S^{b′} for b′ ≤ b.
- `newtonPoint_hecke` (functoriality): The Newton point is constant along prime-to-p Hecke correspondences.
- `newtonPoint_isogeny` (compatibility): The Newton point depends only on A_x̄[p^∞] up to quasi-isogeny with G-structure.

Unit tests:

- `newtonStratum_ordinary_open` (computation): For the unitary datum with p split in F, the ordinary stratum is open and dense in S_{K,k}.
- `newtonStratum_modularCurve` (degenerate): For F imaginary quadratic, n = 1 and p split in F there are exactly two strata, ordinary and basic, the basic one finite.
- `newtonPoint_not_isoClass` (non-example): For n ≥ 2, two points with isogenous but non-isomorphic p-divisible groups have the same Newton point, so the Newton stratum is not a single central leaf (for F imaginary quadratic, n = 1 and p split every Newton stratum is one leaf).
- `newtonPoint_compat_BG` (compatibility): For the isocrystal of A_x̄[p^∞], newtonPoint agrees with the class in B(G) of BunGAndNewtonStrata BG0 and lies in its B(G, μ^{−1}).

Acceptance:

- Ordinary example: for the quasi-split unitary datum with p split in F, the ordinary b is the maximal element of B(G_{ℚ_p}, μ^{−1}) and S^{ord} is open and dense in S_{K,k} ([Wed99]).
- Basic example: the basic stratum is closed; for F imaginary quadratic and n = 1 it is the supersingular locus of the curve S_{K,k}, a finite set of points.
- The stratification is stable under the prime-to-p Hecke correspondences.

Depends on: `integral-model`, `g-structure`, `unramified-local-pel-datum`, `BunGAndNewtonStrata:BG0/g-isocrystals-and-B-of-G`, `BunGAndNewtonStrata:BG0/sigma-centralizer-J-b`, `BunGAndNewtonStrata:BG1/newton-and-kottwitz-maps`, `BunGAndNewtonStrata:BG1`, `BunGAndNewtonStrata:BG1/partial-order-on-B-of-G`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/dieudonne-p-divisible`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/dieudonne-slopes`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/isogeny-classification`, `VectorBundlesAndIsocrystals:VB0/dieudonne-manin-isocrystals`.

Used by: `central-leaf`, `quasi-isogeny-torsor`, `drinfeld-level-newton-strata`, `fundamental-eo-stratum-in-newton-stratum`, `flag-points-and-p-divisible-groups`, `newton-strata-correspond`.

Sources:

- CS17 §4.3, p. 714 (cs17): “admits a Newton stratification by locally closed strata Sb KpKp indexed by b ∈ B(G,µ−1); cf. [RR96]: A point x ∈ SKpKp ×OE,p Fq gives rise to a p-divisible group with extra” — Defines the Newton stratification of the special fibre by locally closed strata indexed by B(G, μ^{−1}).

### `splitting-symplectic-filtrations` — Splitting of symplectic filtrations of p-divisible groups with G-structure (CSnc Proposition 2.2.1)

Declaration `IgusaVarietiesAndTorsionConcentration:IG.0/splitting-symplectic-filtrations` (theorem).

Let (X, ι, λ) be a p-divisible group with G-structure over an algebraically closed field k of characteristic p. The connected–multiplicative filtration X^μ ⊂ X° ⊂ X is O_F-stable and symplectic and splits uniquely, X ≅ X^μ ⊕ X^{(0,1)} ⊕ X^{ét}, with λ decomposing accordingly; X is determined up to isomorphism by X^{(0,1)} with its O_F-action and polarization and by the finite projective O_F ⊗ ℤ_p-module T_p(X^{ét}). More generally, if Z_{−2} ⊂ Z_{−1} ⊂ X is an O_F-stable filtration by sub-p-divisible groups with Z_{−2} multiplicative, X/Z_{−1} étale and λ identifying Z_{−2} with (X/Z_{−1})^∨, then there is an O_F-linear splitting X ≅ Z_{−2} ⊕ Z_{−1}/Z_{−2} ⊕ X/Z_{−1} under which λ decomposes as a direct sum.

Hypotheses:

- k algebraically closed (perfect suffices for the connected–étale splitting).

Proof or construction:

1. Over a perfect field the connected–étale and multiplicative–connected sequences split canonically.
2. Decompose into multiplicative, biconnected and étale parts; only two splitting problems remain, on the étale and on the multiplicative part.
3. Choose the étale splitting arbitrarily and take the multiplicative one to be its dual under λ, so that λ decomposes.

Acceptance:

- For X = (μ_{p^∞} ⊕ ℚ_p/ℤ_p) ⊗ O_F^n the splitting is the given one and X^{(0,1)} = 0.
- The splitting of the filtration attached to an Igusa cusp label (IG.2/igusa-cusp-labels) exists.

Depends on: `g-structure`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-divisible-group`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-divisible-cartier-dual`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-divisible-connected-etale`.

Used by: `leaves-are-well-positioned`, `igusa-boundary-charts`, `unit-similitude-quasi-isogeny`, `igusa-cusp-labels`, `boundary-strata-by-parabolics`.

Sources:

- CSnc §2.2, Proposition 2.2.1, p. 14 (csnc): “Proposition 2.2.1. Assume that Z−2 ⊂ Z−1 ⊂ X is an OF -stable filtration by sub-p-divisible groups such that Z−2 is multiplicative, X/Z−1 is étale, and the polarization identifies Z−2 with X/Z−1. Then there is an OF -linear splitting X ∼ = Z−2 ⊕” — States the symplectic splitting of filtrations with multiplicative sub and étale quotient.

### `internal-hom-p-divisible-group` — The internal Hom p-divisible group H_{G,G′} of Chai and Oort (CS17 Lemmas 4.1.5–4.1.6)

Declaration `IgusaVarietiesAndTorsionConcentration:IG.0/internal-hom-p-divisible-group` (construction). Suggested home: `TauCeti/ShimuraVarieties/Igusa/InternalHom` (`TauCeti.Igusa.InternalHom`).

Let G, G′ be isoclinic p-divisible groups over a perfect field k of characteristic p. For n ≥ 1, H_n = 𝓗om(G[p^n], G′[p^n]) is a commutative group scheme of finite type over k; for m ≥ n the restriction r_{m,n} : H_m → H_n has closed kernel and H_n^{(m)} = H_m / ker r_{m,n} ⊂ H_n is a closed subgroup scheme, decreasing in m. (Lemma 4.1.5) H_n^{(m)} is constant for m ≫ 0, equal to a finite group scheme H′_n. (Lemma 4.1.6) The maps ι_n : H_n → H_{n+1} (precompose with p : G[p^{n+1}] → G[p^n], compose with G′[p^n] ↪ G′[p^{n+1}]) send H′_n into H′_{n+1}, and H_{G,G′} := colim_n H′_n is a p-divisible group over k with H_{G,G′}[p^n] = H′_n. The construction extends to O_F-linear Homs for p-divisible groups with an action of the ring of integers O_F of an unramified extension F/ℚ_p.

Hypotheses:

- G, G′ isoclinic over a perfect field k of characteristic p.

Proof or construction:

1. Finite type of H_n: G[p^n], G′[p^n] are finite flat, so 𝓗om is representable by a finite type group scheme.
2. Stabilisation (Lemma 4.1.5): the descending chain of closed subgroup schemes H_n^{(m)} of the finite type group scheme H_n stabilises by noetherianity; the stable value is finite because it is the image of homomorphisms that lift to all levels (Chai–Oort).
3. p-divisibility (Lemma 4.1.6): compatibility of ι_n with the stable images and exactness of 0 → H′_n → H′_{n+1} → H′_1 follow from the stabilisation; the colimit is p-divisible.

Uses:

- IG.0/automorphism-group-of-universal-cover: Aut(X̃_b) is a closed subfunctor of a product of universal covers of H_{X_i,X_j}
- IG.0/internal-hom-slopes: the slopes of H_{G,G′} decide whether 𝓗om(G, G′) is étale, connected or zero
- CS17 Proposition 4.2.11: its dimension ⟨2ρ, ν_b⟩ is the sum of the dimensions of the connected H_{X_i,X_j}

API:

- `InternalHom.pdiv` (constructor): H_{G,G′}, a p-divisible group over k for isoclinic G, G′.
- `InternalHom.torsion_eq` (characterisation): H_{G,G′}[p^n] = H′_n, the stable image of 𝓗om(G[p^m], G′[p^m]) → 𝓗om(G[p^n], G′[p^n]).
- `InternalHom.tateModule` (equivalence): T_p H_{G,G′} ≅ 𝓗om(G, G′) as fpqc sheaves (IG.0/internal-hom-dieudonne-module).
- `InternalHom.map` (functoriality): Contravariant in G and covariant in G′, compatible with composition and isogenies.
- `InternalHom.ofLinear` (constructor): The O_F-linear variant for p-divisible groups with O_F-action, F/ℚ_p unramified.

Unit tests:

- `InternalHom.etale_mu` (computation): H_{μ_{p^∞}, μ_{p^∞}} ≅ ℚ_p/ℤ_p (equal slopes give an étale group).
- `InternalHom.zero_of_slope_gt` (degenerate): H_{μ_{p^∞}, ℚ_p/ℤ_p} = 0 (slope of G greater than slope of G′).
- `InternalHom.connected` (computation): H_{ℚ_p/ℤ_p, μ_{p^∞}} ≅ μ_{p^∞}, of dimension 1.
- `InternalHom.not_naive_hom` (non-example): H′_n can be a proper subgroup of 𝓗om(G[p^n], G′[p^n]): homomorphisms of truncations that do not lift to all levels are excluded.

Acceptance:

- H_{ℚ_p/ℤ_p, μ_{p^∞}} ≅ μ_{p^∞} and H_{μ_{p^∞}, ℚ_p/ℤ_p} = 0.
- The height of H_{G,G′} is height(G)·height(G′) and its dimension is computed from the slopes (IG.0/internal-hom-slopes).

Depends on: `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-divisible-group`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-divisible-cartier-dual`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-divisible-connected-etale`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/dieudonne-p-divisible`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/dieudonne-slopes`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/isogeny-classification`, `VectorBundlesAndIsocrystals:VB0/dieudonne-manin-isocrystals`.

Used by: `internal-hom-dieudonne-module`, `automorphism-group-of-universal-cover`.

Sources:

- CS17 §4.1, Lemma 4.1.5, p. 693 (cs17): “Lemma 4.1.5. The subgroup scheme H (m) n stabilizes for m  0; let H0 n = H (m) n for m sufficiently large. Then H0 n” — States the stabilisation of H_n^{(m)}.
- CS17 §4.1, Lemma 4.1.6, p. 694 (cs17): “Lemma 4.1.6. The maps ιn : Hn → Hn+1 send H0 n into H0 n+1. The colimit H = HG,G0 = lim − → ιn H0 n is a p-divisible group over k with H[pn] = H0 n.” — States that the stable images form a p-divisible group H_{G,G′}.

### `internal-hom-dieudonne-module` — Tate module and Dieudonné module of the internal Hom (CS17 Lemmas 4.1.7–4.1.8)

Declaration `IgusaVarietiesAndTorsionConcentration:IG.0/internal-hom-dieudonne-module` (theorem).

Let G, G′ be isoclinic p-divisible groups over a perfect field k. (1) The Tate module T_p H_{G,G′} is identified with the sheaf 𝓗om(G, G′). (2) The rational Dieudonné module satisfies D(H_{G,G′})[1/p] = Hom(D(G)[1/p], D(G′)[1/p])^{≤0}, the part of slopes ≤ 0 of the internal Hom isocrystal (with the normalization of CS17 §4.1); the statement depends only on G, G′ up to quasi-isogeny. The analogous statements hold O_F-linearly for F/ℚ_p unramified, using D_F(G) = D(G)[1/p]_{τ₀}, an isocrystal for φ^{[F:ℚ_p]}.

Hypotheses:

- G, G′ isoclinic over a perfect field k.

Proof or construction:

1. (1) T_p H_{G,G′} = lim H′_n and a compatible system of stably liftable homomorphisms of truncations is a homomorphism G → G′.
2. (2) Evaluate on f-semiperfect rings R: Dieudonné theory up to isogeny over such rings (Scholze–Weinstein, Theorem A) gives H̃_{G,G′}(R) = (Hom(D(G)[1/p], D(G′)[1/p]) ⊗ B⁺_cris(R))^{φ=1}.
3. By the Dieudonné–Manin classification it suffices that there is no nonzero x ∈ A_cris(R) with p^a φ^b(x) = x for integers a, b > 0; this identifies the slope ≤ 0 part (the printed proof omits "nonzero", sourceIssues PAPER-CARAIANI-SCHOLZE-17/E36).

Acceptance:

- For G = ℚ_p/ℤ_p and G′ = μ_{p^∞}: Hom(D(G), D(G′)) is isoclinic of the slope giving H_{G,G′} ≅ μ_{p^∞}.

Depends on: `internal-hom-p-divisible-group`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/dieudonne-p-divisible`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/dieudonne-slopes`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/isogeny-classification`, `VectorBundlesAndIsocrystals:VB0/dieudonne-manin-isocrystals`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`.

Used by: `internal-hom-slopes`, `automorphism-group-of-universal-cover`.

Sources:

- CS17 §4.1, Lemma 4.1.7, p. 695 (cs17): “Lemma 4.1.7. The Tate module TpHG,G0 can be identified with the sheaf Hom(G,G0). Proof. The Tate module” — Identifies the Tate module of H_{G,G′} with 𝓗om(G, G′).
- CS17 §4.1, Lemma 4.1.8, p. 695 (cs17): “Lemma 4.1.8. The Dieudonné module D(HG,G0)[1/p] is equal to Hom(D(G)[1/p],D(G0 )[1/p])≤0 , where” — Computes the rational Dieudonné module of H_{G,G′}.

### `internal-hom-slopes` — Slopes of the internal Hom and the formal structure of 𝓗om(G, G′) (CS17 Corollaries 4.1.10–4.1.11)

Declaration `IgusaVarietiesAndTorsionConcentration:IG.0/internal-hom-slopes` (theorem).

Let G, G′ be isoclinic p-divisible groups over a perfect field k. (1) If the slope of G is strictly greater than that of G′, then H_{G,G′} = 0. (2) If the slopes are equal, H_{G,G′} is étale. (3) If the slope of G is strictly smaller than that of G′, H_{G,G′} is connected; if it has dimension r, the sheaf 𝓗om(G, G′) is representable by Spec k[[x₁^{1/p^∞}, …, x_r^{1/p^∞}]]/(x₁, …, x_r).

Hypotheses:

- G, G′ isoclinic over a perfect field k.

Proof or construction:

1. Read off from IG.0/internal-hom-dieudonne-module: H_{G,G′} is isoclinic of slope λ′ − λ when G, G′ have slopes λ, λ′ (no printed proof for Corollary 4.1.10).
2. For (3): 𝓗om(G, G′) = T_p H_{G,G′}, the Tate module of a connected p-divisible group of dimension r, is the universal cover modulo its torsion, represented by the stated perfected formal scheme (CS17 Proposition 4.1.2(4)).

Acceptance:

- Aut(X) of a non-isoclinic X is non-reduced: for X = μ_{p^∞} ⊕ ℚ_p/ℤ_p, 𝓗om(ℚ_p/ℤ_p, μ_{p^∞}) is the non-reduced Spec k[[x^{1/p^∞}]]/(x).

Depends on: `internal-hom-dieudonne-module`.

Used by: `structure-of-automorphism-group`, `liftable-automorphisms`, `isomorphism-torsors`.

Sources:

- CS17 §4.1, Corollary 4.1.10, p. 696 (cs17): “Corollary 4.1.10. Assume that G and G0 are isoclinic. (1) If the slope of G is strictly greater than the slope of G0, then HG,G0 vanishes. (2) If the slopes of G and G0 are equal, then HG,G0 is an” — States the trichotomy according to the slopes.
- CS17 §4.1, Corollary 4.1.11, p. 696 (cs17): “Corollary 4.1.11. If G and G0 are isoclinic and the slope of G is strictly less than the slope of G0 and HG,G0 has dimension r, then the sheaf Hom(G,G0) is representable by the scheme Spec k[[x 1/p∞” — States the representability of 𝓗om(G, G′) by a perfected formal scheme.

### `completely-slope-divisible` — Slope divisible and completely slope divisible p-divisible groups (CSnc Definition 2.3.3) ★

Declaration `IgusaVarietiesAndTorsionConcentration:IG.0/completely-slope-divisible` (definition). Planet: Completely slope divisible p-divisible group. Suggested home: `TauCeti/ShimuraVarieties/Igusa/SlopeDivisible` (`TauCeti.Igusa`).

Let T be an 𝔽_p-scheme and 𝒢/T a p-divisible group with relative Frobenius Frob_𝒢. (1) 𝒢 is isoclinic and slope divisible of slope λ ∈ ℚ_{≥0} if one can write λ = r/s so that the quasi-isogeny p^{−r} Frob^s_𝒢 : 𝒢 → 𝒢^{(p^s)} is an isomorphism. (2) 𝒢 is slope divisible with respect to λ = r/s if p^{−r} Frob^s_𝒢 is an isogeny. (3) 𝒢 is completely slope divisible if there are rational numbers λ₁ > … > λ_r ≥ 0 and a filtration 0 = 𝒢₀ ⊂ 𝒢₁ ⊂ … ⊂ 𝒢_r = 𝒢 by p-divisible groups such that each 𝒢_i is slope divisible with respect to λ_i and 𝒢_i/𝒢_{i−1} is isoclinic and slope divisible of slope λ_i. Such a filtration is unique and its formation is fpqc local on T.

Hypotheses:

- T an 𝔽_p-scheme; slopes in the covariant normalization of CSnc §2.3.

Proof or construction:

1. Define the three notions from the Frobenius quasi-isogeny (Oort–Zink, Definition 1.2).
2. Uniqueness: the filtration is recovered from the images of p^{−r_i}Frob^{s}, which are canonical.
3. Locality: the conditions are fpqc local because being an isomorphism or an isogeny is.

Uses:

- IG.1/mantovan-igusa-variety: Mantovan's Igusa varieties trivialise the graded pieces of the slope filtration of a completely slope divisible group
- IG.0/automorphism-group-of-universal-cover: X_b = ⊕X_i completely slope divisible makes Aut(X̃_b) lower triangular
- IG.2/toroidal-igusa-finite-level: finite-level toroidal Igusa varieties are defined for completely slope divisible X

API:

- `IsCompletelySlopeDivisible` (data): The predicate on a p-divisible group over an 𝔽_p-scheme, with the slopes λ₁ > … > λ_r.
- `IsCompletelySlopeDivisible.slopeFiltration` (projection): The unique filtration 𝒢₁ ⊂ … ⊂ 𝒢_r with isoclinic slope divisible graded pieces.
- `IsCompletelySlopeDivisible.baseChange` (functoriality): Stable under base change, with the slope filtration base-changed.
- `IsCompletelySlopeDivisible.of_generic` (other): Over a connected regular base, completely slope divisible at the geometric generic point implies completely slope divisible (Zink).
- `IsCompletelySlopeDivisible.split_of_perfect` (characterisation): Over a perfect base the slope filtration splits canonically: 𝒢 ≅ ⊕ 𝒢_i/𝒢_{i−1} (Oort–Zink Proposition 1.3).

Unit tests:

- `IsCompletelySlopeDivisible.mu` (computation): μ_{p^∞} ⊕ ℚ_p/ℤ_p over 𝔽̄_p is completely slope divisible with slopes 1 > 0.
- `IsCompletelySlopeDivisible.isoclinic` (degenerate): An isoclinic slope divisible group is completely slope divisible with r = 1.
- `IsCompletelySlopeDivisible.not_all` (non-example): A p-divisible group over a nonnormal base that is not isogenous to one with a slope filtration ([OZ02, Ex. 4.2]) is not completely slope divisible.
- `IsCompletelySlopeDivisible.etale_connected` (compatibility): For slopes in {0, 1} the slope filtration is the multiplicative–étale filtration of the p-divisible group.

Acceptance:

- μ_{p^∞} and ℚ_p/ℤ_p are isoclinic slope divisible, of slopes 1 and 0 for the Frobenius normalization of this definition (in the covariant Dieudonné normalization of CS17 §4.1 their Dieudonné slopes are −1 and 0).
- Over a connected regular base, complete slope divisibility at the geometric generic point implies it everywhere (CSnc Lemma 2.3.4, [Zin01, Thm 7]).

Depends on: `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-divisible-group`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-divisible-cartier-dual`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-divisible-connected-etale`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/dieudonne-p-divisible`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/dieudonne-slopes`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/isogeny-classification`, `VectorBundlesAndIsocrystals:VB0/dieudonne-manin-isocrystals`.

Used by: `slope-filtration-existence`, `mantovan-igusa-variety`, `toroidal-igusa-finite-level`.

Sources:

- CSnc §2.3, Definition 2.3.3, p. 18 (csnc): “Let T /SpecFp be a scheme and G/T a p-divisible group. Let FrobG denote the Frobenius morphism relative to T . (1) G is isoclinic and slope divisible of slope λ ∈ Q≥0 if one can write λ = r s so that” — Opens the definition of slope divisibility.
- CSnc §2.3, Lemma 2.3.4, p. 19 (csnc): “Lemma 2.3.4. Let T /SpecFp be a connected regular scheme and G/T a p-divisible group. Let η be the generic point of T , and η a geometric point above η. If Gη is completely slope divisible, then so is G. Proof. This is shown in” — Spreading out complete slope divisibility from the generic point.

### `slope-filtration-existence` — Completely slope divisible representatives and their behaviour over perfect bases and valuation rings (Oort–Zink)

Declaration `IgusaVarietiesAndTorsionConcentration:IG.0/slope-filtration-existence` (theorem).

(1) Every p-divisible group over an algebraically closed field of characteristic p is isogenous to a completely slope divisible one, which is a direct sum of isoclinic slope divisible groups defined over a finite field, with decreasing slopes; this holds compatibly with O_F-actions and polarizations (choose X_b with G-structure). (2) Over a perfect base a completely slope divisible p-divisible group is the direct sum of its isoclinic graded pieces [OZ02, Prop. 1.3]. (3) If V is a valuation ring of characteristic p with fraction field K and G/V has constant Newton polygon with G_K completely slope divisible, then G is completely slope divisible [OZ02, Prop. 2.3]. (4) Over a connected regular base, complete slope divisibility at the geometric generic point implies it everywhere [Zin01, Thm 7].

Hypotheses:

- Characteristic p bases; (3) needs constant Newton polygon.

Proof or construction:

1. (1) Dieudonné–Manin over k̄ and descent of a lattice stable under the slope decomposition; for G-structure take a lattice stable under O_B and self-dual (Mantovan [Man05, §3]).
2. (2) On a perfect base Frobenius is invertible, so the maps p^{−r_i}Frob^{s} split the filtration canonically.
3. (3), (4): cited from Oort–Zink and Zink; their proofs are planned here only as the cited statements, which IG.0/central-leaf, IG.0/berthelot-without-noetherian and IG.1/perfection-of-mantovan use.

Acceptance:

- For X_b of the unitary datum at p split in F, the completely slope divisible representative is ⊕_i X_i with the X_i isoclinic of slopes λ_i, and the polarization pairs X_i with X_j when λ_i + λ_j = 1.

Depends on: `completely-slope-divisible`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/dieudonne-p-divisible`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/dieudonne-slopes`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/isogeny-classification`, `VectorBundlesAndIsocrystals:VB0/dieudonne-manin-isocrystals`.

Used by: `berthelot-without-noetherian`, `constant-newton-polygon-over-perfect-rings`, `mantovan-igusa-variety`, `perfection-of-mantovan`.

Sources:

- Proposition 1.3, p. 186 (oz02): “1.3 Proposition. Let Y be a completely slope divisible p-divisible group over a perfect scheme S. Then Y is isomorphic to a direct sum of isoclinic and completely slope divisible p-divisible groups.” — Oort–Zink Proposition 1.3: splitting over a perfect base.
- Proposition 2.3, p. 189 (oz02): “2.3 Proposition. Let S be an integral scheme with function field K = κ(S). Let X be a p-divisible group over S with constant Newton polygon, such that XK is completely slope divisible with respect to the integers s ≥ r1 > r2 > . . . > rm ≥ 0.” — Oort–Zink Proposition 2.3: extension over a valuation ring with constant Newton polygon.
- CS17 §4.3, p. 714 (cs17): “choose a completely slope divisible p-divisible group Xb over F̄q with extra structures giving rise to the σ-conjugacy class b, as in [Man05, §3]. Let Dint,b” — Fixes a completely slope divisible X_b in each isogeny class b, after Mantovan.

### `automorphism-group-of-universal-cover` — The automorphism group Aut_G(X̃_b) of the universal cover of X_b (CS17 Definition 4.2.9, Lemma 4.2.10) ★

Declaration `IgusaVarietiesAndTorsionConcentration:IG.0/automorphism-group-of-universal-cover` (definition). Planet: Automorphisms of the universal cover X̃_b. Suggested home: `TauCeti/ShimuraVarieties/Igusa/AutUniversalCover` (`TauCeti.Igusa.AutUniversalCover`).

For an unramified local PEL datum with p-divisible group X_b over 𝔽̄_p, let X̃_b = lim_{×p} X_b be its universal cover. Aut_G(X̃_b) is the sheaf on Nilp^{op}_{W(𝔽̄_p)} with Aut_G(X̃_b)(R) = {(α, β) : α ∈ Aut_{O_B}(X̃_{b,R}), β ∈ Aut(μ̃_{p^∞,R}), α respects the polarization up to β}. It is representable by a formal scheme over Spf W(𝔽̄_p), locally of the form Spf W(R) for a perfect ring R. Its group of 𝔽̄_p-points (equivalently of W(𝔽̄_p)-points) is J_b(ℚ_p), the self-quasi-isogenies of X_b respecting the extra structures.

Hypotheses:

- Unramified local PEL datum of type (A) or (C); X_b chosen completely slope divisible.

Proof or construction:

1. Forgetting the extra structures is a closed embedding Aut_G(X̃_b) ↪ Aut(X̃_b) × Aut(μ̃_{p^∞}).
2. For X_b = ⊕X_i completely slope divisible, Aut(X̃_b) is a closed subfunctor of ∏_{i ≥ j} 𝓗om(X_i, X_j)[1/p], and each factor is the universal cover of H_{X_i,X_j} (IG.0/internal-hom-dieudonne-module), representable by CS17 Proposition 4.1.2.
3. Rigidity of universal covers (Scholze–Weinstein, Proposition 3.1.3) gives that Aut_G(X̃_b)(R) = Aut_G(X̃_b)(R/p) and the description locally as Spf W(R) with R perfect.

Uses:

- IG.1/perfect-igusa-variety: Aut_G(X̃_b) acts on Ig^b through ρ̃ (CS17 Corollary 4.3.5)
- IG.3/local-period-fibres: the fibres of the local period map π^b_HT are Aut_G(X̃_b)^ad_η-orbits (CS17 Proposition 4.2.14)
- IG.3/automorphism-group-dimension: its adic generic fibre is partially proper of dimension ⟨2ρ, ν_b⟩

API:

- `AutUniversalCover` (data): The group-valued sheaf Aut_G(X̃_b) on Nilp^{op}_{W(𝔽̄_p)}.
- `AutUniversalCover.representable` (characterisation): Representable by a formal scheme locally Spf W(R) with R perfect.
- `AutUniversalCover.points` (equivalence): Aut_G(X̃_b)(𝔽̄_p) = J_b(ℚ_p), the group of self-quasi-isogenies of X_b with G-structure.
- `AutUniversalCover.rigid` (other): Aut_G(X̃_b)(R) → Aut_G(X̃_b)(R/I) is bijective for I nilpotent.
- `AutUniversalCover.toJ` (projection): The natural map Aut_G(X̃_b) → J_b(ℚ_p) of IG.0/structure-of-automorphism-group.

Unit tests:

- `AutUniversalCover.etale_case` (degenerate): For X_b isoclinic, Aut_G(X̃_b) = J_b(ℚ_p) is the constant locally profinite formal scheme (d = 0).
- `AutUniversalCover.ordinary_GL2` (computation): For X_b = μ_{p^∞} × ℚ_p/ℤ_p, each fibre over J_b(ℚ_p) = ℚ_p^× × ℚ_p^× is Spf W(𝔽̄_p)[[x^{1/p^∞}]] (d = 1).
- `AutUniversalCover.not_aut_Xb` (non-example): Aut_G(X̃_b) is not the automorphism group scheme Aut(X_b): its 𝔽̄_p-points are J_b(ℚ_p), not the compact Aut(X_b)(𝔽̄_p).
- `AutUniversalCover.J_compat` (compatibility): The group of 𝔽̄_p-points equals J_b(ℚ_p) of BunGAndNewtonStrata BG0 for the isocrystal of X_b.

Acceptance:

- For X_b = μ_{p^∞} × ℚ_p/ℤ_p without extra structures, Aut(X̃_b) is lower triangular with diagonal ℚ_p^× × ℚ_p^× and off-diagonal entry the universal cover of μ_{p^∞} (CS17 Remark 4.2.12).

Depends on: `unramified-local-pel-datum`, `internal-hom-p-divisible-group`, `internal-hom-dieudonne-module`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`, `SchemeAndStackFoundations:SF.4`, `AdicSpacesPartII:F0/locally-noetherian-formal-scheme`, `AdicSpacesPartII:R2/admissible-formal-scheme`, `AdicSpacesPartII:R2/formal-etale-site-invariance`.

Used by: `structure-of-automorphism-group`, `perfect-igusa-variety`, `local-period-fibres`.

Sources:

- CS17 §4.2, Lemma 4.2.10, p. 703 (cs17): “Lemma 4.2.10. The sheaf AutG(‹ Xb) is representable by a formal scheme over Spf W(F̄p), locally of the form Spf W(R) for a perfect ring R.” — Representability of Aut_G(X̃_b) by a formal scheme locally of the form Spf W(R), R perfect.
- CS17 §4.2, Definition 4.2.9, p. 703 (cs17): “Define the sheaf AutG(‹ Xb) on Nilpop W(F̄p) by AutG(‹ Xb)(R) = {α ∈ AutB(‹ Xb,R),β ∈” — Defines Aut_G(X̃_b) on Nilp^{op}_{W(𝔽̄_p)}.

### `structure-of-automorphism-group` — Structure of Aut_G(X̃_b): fibres over J_b(ℚ_p) and the dimension ⟨2ρ, ν_b⟩ (CS17 Proposition 4.2.11)

Declaration `IgusaVarietiesAndTorsionConcentration:IG.0/structure-of-automorphism-group` (theorem).

Regard the locally profinite set J_b(ℚ_p) as a formal scheme over W(𝔽̄_p) (sections over U ⊂ J_b(ℚ_p) are the continuous maps U → W(𝔽̄_p)). For unramified local PEL data of type (A) or (C) there is a natural map Aut_G(X̃_b) → J_b(ℚ_p) all of whose fibres are isomorphic to Spf W(𝔽̄_p)[[x₁^{1/p^∞}, …, x_d^{1/p^∞}]] with d = ⟨2ρ, ν_b⟩, ρ the half-sum of the positive roots.

Hypotheses:

- Unramified local PEL data of type (A) or (C); X_b completely slope divisible.

Proof or construction:

1. Reduce to EL data and simple PEL data (Hamacher, §4.1, Cor. 4.5): Res_{F/ℚ_p}GL_n, GSp_n/O_F and GU_n/O_{F⁺}.
2. In the EL case Aut(X̃_b) is block lower triangular with diagonal blocks Aut(X̃_i) = J_{b,i}(ℚ_p) (étale by IG.0/internal-hom-slopes(2)) and off-diagonal blocks the universal covers of H_{X_i,X_j} for λ_i < λ_j, of dimension d_{ij} = m_i m_j(λ_j − λ_i).
3. The d_{ij} add up to ⟨2ρ, ν_b⟩ (Hamacher, Appendix A); the PEL case cuts out the polarization-compatible part (with the corrected bookkeeping of sourceIssues PAPER-CARAIANI-SCHOLZE-17/E42–E43, the middle slope treated separately).

Acceptance:

- For X_b = μ_{p^∞} × ℚ_p/ℤ_p: d = 1 = ⟨2ρ, ν_b⟩ for GL₂ with ν_b = (1, 0).
- For b basic, d = 0 and Aut_G(X̃_b) = J_b(ℚ_p).
- d agrees with the dimension of central leaves in the Newton stratum of b (IG.0/central-leaf-dimension, CS17 Remark 4.2.13).

Depends on: `automorphism-group-of-universal-cover`, `internal-hom-slopes`, `BunGAndNewtonStrata:BG0/g-isocrystals-and-B-of-G`, `BunGAndNewtonStrata:BG0/sigma-centralizer-J-b`, `BunGAndNewtonStrata:BG1/newton-and-kottwitz-maps`.

Used by: `central-leaf-dimension`, `automorphism-group-dimension`.

Sources:

- CS17 §4.2, Proposition 4.2.11, p. 704 (cs17): “There is a natural map AutG(‹ Xb) → Jb(Qp) all of whose fibres are isomorphic to SpfW(F̄p)[[x 1/p∞ 1 ,...,x 1/p∞ d ]], where d = h2ρ,νbi. Remark 4.2.12. Let us” — States the map to J_b(ℚ_p) and the shape of its fibres.

### `liftable-automorphisms` — Liftable automorphisms of truncations and finite-level Igusa torsors over seminormal bases (CSnc Proposition 2.2.3, Theorem 2.2.4)

Declaration `IgusaVarietiesAndTorsionConcentration:IG.0/liftable-automorphisms` (theorem).

Let k be algebraically closed of characteristic p and X/k an isoclinic p-divisible group with extra structures of EL or PEL type. (1) For m ≥ 1 let Γ_m be the group of automorphisms of X[p^m] commuting with the extra structures that lift to automorphisms of X[p^{m′}] for all m′ ≥ m; the finite étale group scheme Γ_{m,k} represents the functor of T-automorphisms of X_T[p^m] commuting with the extra structures that lift fppf locally to X_T[p^{m′}] for all m′ ≥ m (and one m′ suffices). (2) Let 𝒳/k be a seminormal scheme and 𝒢/𝒳 a p-divisible group with the same kind of extra structures, geometrically isomorphic to X at every point. Then the functor on 𝒳-schemes T of isomorphisms ρ_m : 𝒢[p^m] ×_𝒳 T ≅ X[p^m] ×_k T compatible with the extra structures that lift fppf locally to isomorphisms of p^{m′}-truncations for all m′ ≥ m is representable by a Γ_m-torsor J_m(𝒢/𝒳) → 𝒳.

Hypotheses:

- X isoclinic; 𝒳 seminormal; 𝒢 geometrically isomorphic to X at all points.

Proof or construction:

1. (1) The functor of stably liftable endomorphisms of X[p^m] is represented by a finite étale scheme H_{m,k} by the second part of CS17 Corollary 4.1.10 (X isoclinic), and Γ_m is a subfunctor; finite presentation gives one m′.
2. (2) Reduce to the strictly henselian local rings of 𝒳; using seminormality (Swan) and CS17 Lemma 4.3.15 the group 𝒢 is constant over the perfection, and the truncated Rapoport–Zink space argument (IG.0/truncated-rz-isomorphism-locus) shows the map from Spec R to the truncated Rapoport–Zink space is constant, giving a section; then the quasi-torsor is a torsor (generalizing Mantovan [Man05] from central leaves).

Acceptance:

- For X = μ_{p^∞} ⊗ O_F^n ⊕ ℚ_p/ℤ_p ⊗ O_F^n over the ordinary locus (after splitting into isoclinic pieces), J_m is the classical ordinary Igusa cover of level p^m.

Depends on: `internal-hom-slopes`, `truncated-rz-isomorphism-locus`, `constant-newton-polygon-over-perfect-rings`, `g-structure`.

Used by: `isomorphism-torsors`, `central-leaf`, `mantovan-igusa-variety`, `toroidal-igusa-finite-level`.

Sources:

- CSnc §2.2, Proposition 2.2.3, p. 15 (csnc): “Proposition 2.2.3. The finite étale group scheme Γm,k represents the functor FΓm : Speck − Schemes → Sets for which FΓm (T ) is the set of T -automorphisms of XT [pm ] which commute with the extra” — Representability of liftable automorphisms by the finite étale Γ_{m,k}.
- CSnc §2.2, Theorem 2.2.4, p. 15 (csnc): “Theorem 2.2.4. Let m ∈ Z≥1. Consider the functor from X-schemes to sets which sends a scheme T /X to the set of isomorphisms ρm : G[pm ] ×X T ∼ → X[pm ] ×k T compatible with the” — Opens the statement on Igusa torsors J_m(𝒢/𝒳) over seminormal bases.

### `truncated-rz-isomorphism-locus` — The isomorphism locus in a truncated Rapoport–Zink space is finite (CSnc Lemma 2.2.5)

Declaration `IgusaVarietiesAndTorsionConcentration:IG.0/truncated-rz-isomorphism-locus` (lemma).

Let Y/k be a p-divisible group with extra structures over an algebraically closed field k, and M^{0,d}_Y the reduced special fibre of the truncated Rapoport–Zink space of quasi-isogenies with kernel in Y[p^d]; let H be the universal p-divisible group over it. The subset Z = {x ∈ M^{0,d}_Y : H_x̄ ≅ Y_x̄ compatibly with extra structures} consists of finitely many points, all defined over k.

Hypotheses:

- Y need not be isoclinic.

Proof or construction:

1. Z is constructible by Oort [Oor04, Cor. 2.5].
2. The scheme Z̃ → M^{0,d}_Y of isomorphisms H ≅ Y surjects onto Z; for k′/k algebraically closed, Z̃(k′) is the set of self-isogenies of Y_{k′} of degree ≤ d, and End(Y) = End(Y_{k′}), so Z̃(k′) = Z̃(k).
3. Hence every point of Z is k-rational and Z is finite (generalizing Mantovan [Man04, L 3.4]).

Acceptance:

- For Y étale, M^{0,d}_Y is a finite set of points and Z is all of it.

Depends on: `pel-rapoport-zink-space`, `isomorphism-locus-constructible`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-divisible-group`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-divisible-cartier-dual`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-divisible-connected-etale`.

Used by: `liftable-automorphisms`.

Sources:

- CSnc §2.2, Lemma 2.2.5, p. 16 (csnc): “Lemma 2.2.5. Let H be the universal p-divisible group over M 0,d Y . The subset Z := {x ∈ M 0,d Y | H × k(x̄) ∼ = Y ×k k(x̄)} ⊆ M 0,d Y consists of finitely” — States finiteness of the locus where the universal group is isomorphic to Y.

### `isomorphism-torsors` — Isomorphism torsors: profinite Γ over perfect bases, the non-reduced Aut(X) over regular bases (CSnc Propositions 2.2.6–2.2.7)

Declaration `IgusaVarietiesAndTorsionConcentration:IG.0/isomorphism-torsors` (theorem).

Let X/k be a p-divisible group with EL or PEL extra structure over algebraically closed k (not necessarily isoclinic), Γ = lim_m Γ_m = Aut(X)(k) the profinite group of its automorphisms with extra structure, and Aut(X) the group scheme of automorphisms with extra structure (in general highly non-reduced). Let 𝒢 be a p-divisible group with the same extra structure over a scheme 𝒳/k, geometrically isomorphic to X at every point. (1) If 𝒳 is perfect, the functor on perfect 𝒳-schemes T of isomorphisms 𝒢 ×_𝒳 T ≅ X ×_k T is representable by a Γ-torsor J(𝒢/𝒳) → 𝒳. (2) If 𝒳 is regular, the functor on all 𝒳-schemes T of such isomorphisms is representable by an Aut(X)-torsor over 𝒳.

Hypotheses:

- (1) 𝒳 perfect; (2) 𝒳 regular; 𝒢 geometrically isomorphic to X with extra structures.

Proof or construction:

1. (1) For constant 𝒢 use that over a strictly henselian perfect ring all automorphisms of X_R are constant (IG.0/constant-newton-polygon-over-perfect-rings); in general the functor is affine over 𝒳, and faithful flatness is checked on strictly henselian perfect local rings, where 𝒢 is constant by the argument of IG.0/liftable-automorphisms.
2. (2) The functor is a quasi-torsor; (1) applied to 𝒢 ×_𝒳 𝒳_perf gives a section over the faithfully flat 𝒳_perf → 𝒳 (𝒳 regular, so Frobenius is flat by Kunz), hence a torsor.

Acceptance:

- For X = μ_{p^∞} ⊕ ℚ_p/ℤ_p, Aut(X) contains the non-reduced 𝓗om(ℚ_p/ℤ_p, μ_{p^∞}) and the torsor of (2) is not étale, while the Γ-torsor of (1) is pro-étale.

Depends on: `liftable-automorphisms`, `internal-hom-slopes`, `constant-newton-polygon-over-perfect-rings`, `mathlib:PerfectRing`.

Used by: `perfect-igusa-variety`, `igusa-faithfully-flat`, `perfect-toroidal-igusa-variety`.

Sources:

- CSnc §2.2, Proposition 2.2.6, p. 17 (csnc): “Proposition 2.2.6. The functor on perfect X-schemes T parametrizing isomorphisms G ×X T ∼ = X ×k T is representable by a Γ-torsor J(G/X) → X. Proof.” — The Γ-torsor of isomorphisms over perfect bases.
- CSnc §2.2, Proposition 2.2.7, p. 17 (csnc): “Proposition 2.2.7. The functor on all X-schemes T parametrizing isomorphisms G ×X T ∼ = X ×k T is representable by an Aut(X)-torsor over X. Proof. It” — The Aut(X)-torsor over regular bases.

### `central-leaf` — The central leaf C^X of a p-divisible group with G-structure (CSnc Definition 2.3.1; CS17 Definition 4.3.6) ★

Declaration `IgusaVarietiesAndTorsionConcentration:IG.0/central-leaf` (definition). Planet: Central leaf. Suggested home: `TauCeti/ShimuraVarieties/Igusa/CentralLeaf` (`TauCeti.Igusa`).

Let X be a p-divisible group with G-structure over k = 𝔽̄_p (more generally with the extra structures of a PEL datum of type (A) or (C), unramified at p, hyperspecial level). The central leaf C^X ⊂ S_{K,k} is the subset of points x such that A[p^∞]_x̄ ≅ X ×_k k(x̄) compatibly with the extra structures, for one (equivalently every) geometric point x̄ over x. It is locally closed (closed in the Newton stratum S^b of X) and, with its reduced structure, a smooth subscheme of S_{K,k} (Mantovan [Man05, Prop. 1]). It is stable under prime-to-p Hecke correspondences; unlike the Newton stratum and the Igusa variety, it depends on X within its isogeny class.

Hypotheses:

- PEL datum of type (A) or (C) unramified at p with hyperspecial level; X over 𝔽̄_p with extra structures.

Proof or construction:

1. The locus is constructible and closed in S^b by Oort's theory of leaves (geometric isomorphism class of a p-divisible group in a family with constant Newton polygon).
2. Smoothness: over C^X (reduced) the group A[p^∞] is geometrically constant, the Igusa torsor of IG.0/liftable-automorphisms is finite étale, and the deformation theory (Serre–Tate, IG.0/serre-tate-semi-abelian, with the isomorphism class fixed) shows the reduced leaf is smooth (Mantovan [Man05, Prop. 1]).
3. Hecke stability: prime-to-p isogenies do not change A[p^∞].

Uses:

- IG.1/perfect-igusa-variety: Ig^X → C^X_perf is a Γ_X-torsor
- IG.2/leaves-well-positioned: central leaves are well-positioned, so they have partial toroidal and minimal compactifications
- IG.2/leaf-minimal-compactification-affine: C^{X,*} is affine
- EndoscopicTransferAndUnitaryTraceComparison:ET.5: Mantovan's product formula and Shin's point counting run over the leaves

API:

- `centralLeaf` (constructor): C^X ⊂ S_{K,k} as a reduced locally closed subscheme.
- `centralLeaf_smooth` (instance): C^X is smooth over k.
- `centralLeaf_subset_newtonStratum` (relation): C^X ⊂ S^b, closed in S^b, for b the class of X.
- `mem_centralLeaf_iff` (characterisation): x ∈ C^X iff A[p^∞]_x̄ ≅ X ×_k k(x̄) with extra structures.
- `centralLeaf_hecke` (functoriality): Prime-to-p Hecke correspondences preserve C^X.
- `centralLeaf_universal_iso` (other): Over C^X the group A[p^∞] is geometrically isomorphic to X at every point, so the Igusa torsors of IG.0/isomorphism-torsors exist.

Unit tests:

- `centralLeaf_ordinary_eq_stratum` (computation): For b ordinary, C^{X_b} equals the ordinary Newton stratum.
- `centralLeaf_modularCurve_basic` (degenerate): For F imaginary quadratic and n = 1 and b basic, C^{X_b} is a finite set of supersingular points.
- `centralLeaf_ne_newtonStratum` (non-example): In general C^X ⊊ S^b: for a non-ordinary, non-basic b with d_b < dim S^b the leaf is a proper closed subset of the stratum.
- `centralLeaf_dim` (characterisation): dim C^{X_b} = ⟨2ρ, ν_b⟩.

Acceptance:

- Ordinary example: for b ordinary the central leaf is the whole ordinary stratum (all ordinary p-divisible groups with G-structure over k are isomorphic).
- Basic example: for F imaginary quadratic and n = 1 the basic leaves are points of the supersingular locus.
- dim C^X = ⟨2ρ, ν_b⟩ (IG.0/central-leaf-dimension).

Depends on: `integral-model`, `g-structure`, `newton-map`, `liftable-automorphisms`, `isomorphism-locus-constructible`.

Used by: `central-leaf-dimension`, `perfect-igusa-variety`, `mantovan-igusa-variety`, `leaves-are-well-positioned`, `fundamental-eo-stratum-in-newton-stratum`.

Sources:

- CSnc §2.3, Definition 2.3.1, p. 17 (csnc): “The central leaf8 corresponding to X is the subset of SK,k := SK ×Fp k where the fibers of the p-divisible group A[p∞ ] at all geometric points are 8In [Oor04], Oort calls these objects central” — Defines the central leaf as the locus where the p-divisible group is geometrically isomorphic to X.
- CS17 §4.3, Definition 4.3.6, p. 716 (cs17): “The (pro-)Igusa variety is the map Ib Mant → Cb that over a Cb-scheme S parametrizes tuples (ρi)r i=1 of isomorphisms” — Mantovan's Igusa variety lives over the central leaf C^b in the Newton stratum.

### `central-leaf-dimension` — Dimension of central leaves: dim C^{X_b} = ⟨2ρ, ν_b⟩ (Hamacher)

Declaration `IgusaVarietiesAndTorsionConcentration:IG.0/central-leaf-dimension` (theorem).

For a PEL datum of type (A) or (C) unramified at p with hyperspecial level and b ∈ B(G_{ℚ_p}, μ^{−1}), every central leaf C^{X} with X in the isogeny class b is smooth of pure dimension d_b = ⟨2ρ, ν_b⟩, where ν_b is the Newton point and ρ the half-sum of positive roots; the perfect Igusa variety Ig^b has the same dimension d_b (CSnc §2.7).

Hypotheses:

- PEL type (A) or (C), unramified at p, hyperspecial level.

Proof or construction:

1. Hamacher [Ham15, Cor. 7.8] computes the dimension of central leaves in the PEL case.
2. Alternatively (CS17 Corollary 4.3.9, sketch): Ig^b → C^b is a torsor under the non-reduced group Aut(X_b) of dimension 0 whose perfection has the fibres of IG.0/structure-of-automorphism-group; comparing cotangent complexes of the perfect torsor gives dim C^b = d.

Acceptance:

- Ordinary b: d_b = dim S_{K,k} = [F⁺:ℚ]n².
- Basic b: d_b = 0, so basic leaves are finite sets of points.
- For the unitary datum, d_b is the dimension of the flag-variety complement: dim Fℓ^b = d − d_b (IG.3/flag-newton-strata-dimension).

Depends on: `central-leaf`, `structure-of-automorphism-group`, `BunGAndNewtonStrata:BG0/g-isocrystals-and-B-of-G`, `BunGAndNewtonStrata:BG0/sigma-centralizer-J-b`, `BunGAndNewtonStrata:BG1/newton-and-kottwitz-maps`.

Sources:

- Corollary 7.8 (2), p. 30 (arXiv:1312.0490v2) (ham15): “(2) Any central leaf in A0b has dimension h2ρ, νG (b)i. (3) We have dim A0b = dim MG (b, µ) + h2ρ, νG (b)i.” — Hamacher's computation of the dimension of central leaves.
- CS17 §4.2, Remark 4.2.13, p. 708 (cs17): “Remark 4.2.13. In view of the theory developed in Section 4.3 and Corollary 4.3.9 in particular, the dimension of AutG(‹ Xb) should match the dimension of central leaves inside the Newton stratum” — Relates the dimension of Aut_G(X̃_b) to the dimension of central leaves.

### `serre-tate-semi-abelian` — Serre–Tate theory up to isogeny and for semi-abelian schemes, without noetherian hypotheses (CSnc Theorems 2.4.1–2.4.2)

Declaration `IgusaVarietiesAndTorsionConcentration:IG.0/serre-tate-semi-abelian` (theorem).

Let S′ ↠ S be a surjection of rings in which p is nilpotent, with nilpotent kernel. (1) Base change from S′ to S is an equivalence on p-divisible groups up to isogeny, on abelian schemes up to p-power isogeny, and on semi-abelian schemes that are global extensions of abelian schemes by split tori (with Hom ⊗ ℤ[1/p]). (2) Extensions G_{S′} of abelian schemes by split tori over S′ are equivalent to triples (G_S, 𝒢_{S′}, ρ) with G_S such an extension over S, 𝒢_{S′} a p-divisible group over S′ and ρ : G_S[p^∞] ≅ 𝒢_{S′} ×_{S′} S. No noetherian hypotheses are needed. The classical statement for abelian schemes (CSnc Theorem 2.4.2(1)) is imported from AbelianSchemesAndArithmeticModuli A4; this node owns the isogeny-level, non-noetherian and semi-abelian extensions used for toroidal boundary charts.

Hypotheses:

- p nilpotent in S′, kernel of S′ → S nilpotent.

Proof or construction:

1. Follow Drinfeld's proof (Katz [Kat81], André [And03]): if p^N kills the kernel and the p-divisible groups are killed by p^M on the kernel, multiplication by p^{N+M} factors through the reduction, which gives the isogeny-level equivalence (Messing [Mes72], Illusie [Ill85, Thm 4.4]).
2. For triples, deform A_S using the deformation of A_S[p^∞] given by 𝒢_{S′} and the isogeny-level equivalence to construct and identify A_{S′}; for semi-abelian extensions by split tori, use [DG70, IX 3.6 bis] for the torus part.

Acceptance:

- For S′ = W_2(k) → S = k and A ordinary, the deformations of A correspond to deformations of A[p^∞], recovering Serre–Tate coordinates.

Depends on: `AbelianSchemesAndArithmeticModuli:A4`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6/abelian-scheme-torsion-finite-flat`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-divisible-group`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-divisible-cartier-dual`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-divisible-connected-etale`.

Used by: `canonical-lift-of-igusa`, `compactified-igusa-to-shimura`.

Sources:

- CSnc §2.4, Theorem 2.4.1, p. 20 (csnc): “Theorem 2.4.1. Let S′ ։ S be a surjection of rings in which p is nilpotent, with nilpotent kernel I ⊂ S′ . (1) The functor GS′ 7→ GS := GS′ ×S′ S from p-divisible groups up to” — Opens the Serre–Tate equivalence for p-divisible groups up to isogeny.
- CSnc §2.4, Theorem 2.4.2, p. 21 (csnc): “Theorem 2.4.2. Let S′ ։ S be a surjection of rings in which p is nilpotent, with nilpotent kernel I ⊂ S′ . (1) Consider the category of triples (AS,GS′,ρ), where AS is an abelian” — Opens the equivalence with triples for abelian schemes and semi-abelian extensions.

### `pel-rapoport-zink-space` — The Rapoport–Zink space of PEL type 𝔐_{D^int} (CS17 Definition 4.2.1, Theorem 4.2.2) ★

Declaration `IgusaVarietiesAndTorsionConcentration:IG.0/pel-rapoport-zink-space` (construction). Planet: Rapoport–Zink space of PEL type. Suggested home: `TauCeti/ShimuraVarieties/Igusa/RapoportZink` (`TauCeti.Igusa.RZSpace`).

For an unramified local PEL datum D^int with p-divisible group X_b, Ĕ the completion of the maximal unramified extension of E and O_Ĕ its ring of integers, 𝔐_{D^int} is the functor on Nilp^{op}_{O_Ĕ} (O_Ĕ-algebras R on which p is nilpotent) sending R to the isomorphism classes of pairs (G, ρ) with G a p-divisible group over R with O_B-action satisfying the determinant condition and a principal polarization whose Rosati involution is compatible with *, and ρ : X_b ×_{𝔽̄_p} R/p → G ×_R R/p an O_B-linear quasi-isogeny respecting the polarizations up to an automorphism of μ̃_{p^∞,R/p}. It is representable by a formal scheme over Spf O_Ĕ that locally admits a finitely generated ideal of definition, and it is formally smooth (Rapoport–Zink [RZ96, Thm 3.25, §3.82]). J_b(ℚ_p) acts by composition on ρ.

Hypotheses:

- Unramified local PEL datum of type (A) or (C) (p = 2 allowed without type D).

Proof or construction:

1. Representability: Rapoport–Zink [RZ96, Thm 3.25] via Grothendieck–Messing deformation theory (AbelianSchemesAndArithmeticModuli A4 / FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2) and rigidity of quasi-isogenies.
2. Formal smoothness from Grothendieck–Messing: lifts of the Hodge filtration with the extra structures are unobstructed because the datum is unramified with hyperspecial Λ.
3. The printed definition writes O_{Ĕ₀} for O_Ĕ (sourceIssues PAPER-CARAIANI-SCHOLZE-17/E5); the base is O_Ĕ.

Uses:

- IG.3/infinite-level-rz-space: its generic fibre at infinite level M_{D,∞} carries the local Hodge–Tate period map
- IG.3/canonical-lift-of-igusa: the product formula identifies 𝔛^b_{O_K} ≅ Ig^b_{O_K} ×_{O_Ĕ} 𝔐^b
- IG.0/liftable-automorphisms: truncated Rapoport–Zink spaces M^{0,d}_Y control the Igusa torsors over seminormal bases

API:

- `RZSpace` (constructor): The formal scheme 𝔐_{D^int} over Spf O_Ĕ.
- `RZSpace.represents` (characterisation): 𝔐_{D^int}(R) = {(G, ρ)} up to isomorphism for R ∈ Nilp_{O_Ĕ}.
- `RZSpace.formallySmooth` (instance): 𝔐_{D^int} is formally smooth over Spf O_Ĕ.
- `RZSpace.jAction` (functoriality): J_b(ℚ_p) acts on 𝔐_{D^int} by g·(G, ρ) = (G, ρ ∘ g^{−1}).
- `RZSpace.genericFibre` (projection): M_{D^int} = (𝔐_{D^int})^{ad}_η over Spa(Ĕ, O_Ĕ).
- `RZSpace.truncated` (constructor): The truncated spaces M^{0,d} of quasi-isogenies with kernel in X_b[p^d].

Unit tests:

- `RZSpace.lubinTate` (computation): For the unramified PEL datum GL_n × 𝔾_m (B = ℚ_p × ℚ_p with the exchange involution, V = ℚ_p^n ⊕ ℚ_p^n), μ = (1, 0, …, 0) and b basic, 𝔐 ≅ ⊔_{ℤ×ℤ} Spf W(𝔽̄_p)[[x₁, …, x_{n−1}]] (one ℤ for the height of ρ, one for the valuation of the similitude factor); the EL datum GL_n alone gives ⊔_ℤ, the Lubin–Tate case.
- `RZSpace.etale_points` (degenerate): For X_b étale (μ trivial), 𝔐_{D^int} is the discrete set J_b(ℚ_p)/Aut(X_b).
- `RZSpace.not_isomorphisms` (non-example): ρ is only a quasi-isogeny: requiring ρ to be an isomorphism gives the Igusa-type locus, a proper subfunctor.
- `RZSpace.dim` (characterisation): The formal dimension of 𝔐_{D^int} is ⟨2ρ, μ⟩.

Acceptance:

- For the Lubin–Tate datum (GL_n, μ = (1, 0, …, 0), b basic) 𝔐 is ⊔_{ℤ} Spf W[[x₁, …, x_{n−1}]].
- J_b(ℚ_p) acts on 𝔐_{D^int} and the action is compatible with the period maps.

Depends on: `unramified-local-pel-datum`, `AbelianSchemesAndArithmeticModuli:A4`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6/abelian-scheme-torsion-finite-flat`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/dieudonne-p-divisible`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/dieudonne-slopes`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/isogeny-classification`, `VectorBundlesAndIsocrystals:VB0/dieudonne-manin-isocrystals`, `SchemeAndStackFoundations:SF.4`, `AdicSpacesPartII:F0/locally-noetherian-formal-scheme`, `AdicSpacesPartII:R2/admissible-formal-scheme`, `AdicSpacesPartII:R2/formal-etale-site-invariance`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`.

Used by: `truncated-rz-isomorphism-locus`, `local-hodge-tate-period-map`, `canonical-lift-of-igusa`, `sw-infinite-level-rz-space`.

Sources:

- CS17 §4.2, Definition 4.2.1, p. 697 (cs17): “The Rapoport-Zink space MDint of PEL type associated to Dint is the functor on Nilpop OĔ sending an OĔ0 -algebra R to the set of isomorphism” — Defines the PEL Rapoport–Zink functor.
- CS17 §4.2, Theorem 4.2.2, p. 698 (cs17): “Theorem 4.2.2. The functor MDint is representable by a formal scheme that locally admits a finitely generated ideal of definition. Moreover, MDint is formally smooth. We” — Representability and formal smoothness.

### `berthelot-without-noetherian` — Homomorphisms of p-divisible groups with constant Newton polygon over valuation rings and normal domains of characteristic p (CS17 Lemma 4.2.16, Remark 4.2.17)

Declaration `IgusaVarietiesAndTorsionConcentration:IG.0/berthelot-without-noetherian` (theorem).

(1) Let V be a valuation ring of characteristic p with fraction field K, and G, H p-divisible groups over V with constant Newton polygon. Then Hom(G, H) → Hom(G_K, H_K) is a bijection. (2) The same holds for an integral domain R of characteristic p, integrally closed in its fraction field K, in place of V (removing the noetherian hypothesis from Berthelot's theorem).

Hypotheses:

- Constant Newton polygon of G and H over Spec V (resp. Spec R).

Proof or construction:

1. Enlarge K to be algebraically closed, so that V is perfect.
2. Reduce to completely slope divisible groups (IG.0/slope-filtration-existence (3)), which are base changed from 𝔽̄_p.
3. By Berthelot's full faithfulness of the Dieudonné functor over perfect valuation rings, reduce to W(V)[1/p]^{φ^r = p^{−s}} = W(K)[1/p]^{φ^r = p^{−s}} (corrected sign of the exponent, sourceIssues PAPER-CARAIANI-SCHOLZE-17/E46).
4. (2) Whether a homomorphism over K extends is whether certain matrices have entries in R; as R is integrally closed this is checked on the valuation rings of K containing R (the extension statement for general domains needs this reduction, sourceIssues PAPER-CARAIANI-SCHOLZE-17/E45).

Acceptance:

- Over V = k[[t]]^{perf}, a homomorphism μ_{p^∞,K} → μ_{p^∞,K} extends over V.

Depends on: `slope-filtration-existence`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/dieudonne-p-divisible`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/dieudonne-slopes`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/isogeny-classification`, `VectorBundlesAndIsocrystals:VB0/dieudonne-manin-isocrystals`, `mathlib:ValuationRing`.

Used by: `constant-newton-polygon-over-perfect-rings`, `integral-extension-lemma`.

Sources:

- CS17 §4.2, Lemma 4.2.16, p. 710 (cs17): “Lemma 4.2.16. Let V be a valuation ring of characteristic p with quotient field K. Let G, H be p-divisible groups over V with constant Newton polygon. Then the map Hom(G,H) → Hom(GK,HK) is a” — States the bijection over valuation rings of characteristic p.
- CS17 §4.2, Remark 4.2.17, p. 710 (cs17): “Remark 4.2.17. Using this lemma, one can remove the noetherian hypothesis from the main result of [Ber80]; i.e., the same fully faithfulness result holds true for any integral” — Removes the noetherian hypothesis from Berthelot's result.

### `constant-newton-polygon-over-perfect-rings` — p-divisible groups with constant Newton polygon over strictly henselian perfect rings (CS17 Lemma 4.3.15, Remark 4.3.16)

Declaration `IgusaVarietiesAndTorsionConcentration:IG.0/constant-newton-polygon-over-perfect-rings` (theorem).

Let R be a strictly henselian perfect ring with residue field k. Then G ↦ G_k is an equivalence from p-divisible groups over R with constant Newton polygon, up to isogeny, to p-divisible groups over k up to isogeny; every such G is isogenous to G₀ ×_{𝔽̄_p} R for a completely slope divisible G₀ over 𝔽̄_p. Moreover there is a constant c depending only on the heights such that for every homomorphism ψ_k : G_k → H_k of such groups, p^c ψ_k lifts uniquely to G → H. In particular all automorphisms of X_R for X over 𝔽̄_p are constant.

Hypotheses:

- R strictly henselian and perfect; constant Newton polygon.

Proof or construction:

1. Full faithfulness of the Dieudonné functor over perfect rings (Gabber, after Berthelot; cf. Lau [Lau13, Thm D]).
2. For domains use IG.0/berthelot-without-noetherian; in general pass to the minimal primes and to a v-cover R → R̃ by products of valuation rings (Bhatt–Scholze [BS17, Thm 4.1(i)]), with a quasi-isogeny of bounded degree (corrected in sourceIssues PAPER-CARAIANI-SCHOLZE-17/E56–E57).
3. Compare with Oort–Zink [OZ02, Cor. 3.4, 3.6].

Acceptance:

- For R = k a field the statement is tautological.

Depends on: `berthelot-without-noetherian`, `slope-filtration-existence`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/dieudonne-p-divisible`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/dieudonne-slopes`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/isogeny-classification`, `VectorBundlesAndIsocrystals:VB0/dieudonne-manin-isocrystals`, `mathlib:PerfectRing`.

Used by: `liftable-automorphisms`, `isomorphism-torsors`, `quasi-isogeny-torsor`.

Sources:

- CS17 §4.3, Lemma 4.3.15, p. 721 (cs17): “Lemma 4.3.15. Let R be a strictly henselian perfect ring with residue field k. Then the functor G 7→ Gk from the category of p-divisible groups over R with constant Newton polygon, up to isogeny, to p-divisible groups over k up” — States the equivalence up to isogeny.
- CS17 §4.3, Remark 4.3.16, p. 721 (cs17): “Remark 4.3.16. In fact, the proof will show that if G and H are p-divisible groups with constant Newton polygon over R, then there is a constant c” — Bounded lifting constant.

### `quasi-isogeny-torsor` — The J_b(ℚ_p)-torsor of quasi-isogenies over a Newton stratum (CS17 Proposition 4.3.13 = Proposition 1.13)

Declaration `IgusaVarietiesAndTorsionConcentration:IG.0/quasi-isogeny-torsor` (theorem).

Let S be a scheme over 𝔽̄_p and X a p-divisible group with PEL extra structures over S such that, for some b ∈ B(G), all geometric fibres of X are quasi-isogenous to X_b compatibly with extra structures. Then there is a natural J_b(ℚ_p)-torsor over S_proét (a torsor under the sheaf of groups attached to the topological group J_b(ℚ_p), in the sense of Bhatt–Scholze) whose fibre at a geometric point x̄ is the set of quasi-isogenies X_x̄ → X_b compatible with extra structures; it depends only on X up to isogeny. If S is connected and locally topologically noetherian, it corresponds to a continuous homomorphism π₁^proét(S, x̄) → J_b(ℚ_p). Applied to A[p^∞] over a Newton stratum S^b, this gives a J_b(ℚ_p)-torsor over S^b.

Hypotheses:

- All geometric fibres quasi-isogenous to X_b with extra structures.

Proof or construction:

1. Over the perfection, locally for the pro-étale topology the group X is isogenous to the constant X_b (IG.0/constant-newton-polygon-over-perfect-rings applied on w-local strictly henselian perfect rings).
2. The sheaf of quasi-isogenies to X_b is then a J_b(ℚ_p)-torsor; perfection does not change the pro-étale site.
3. The torsor descends from S_perf to S since the pro-étale sites agree.

Acceptance:

- On the leaf C^b the monodromy takes values in a compact subgroup; for the basic stratum the image is discrete cocompact (CS17 Remark 4.3.14, stated without proof; the claim about the basic stratum is corrected in sourceIssues PAPER-CARAIANI-SCHOLZE-17/E15 and E55).

Depends on: `constant-newton-polygon-over-perfect-rings`, `newton-map`, `mathlib:AlgebraicGeometry.Scheme.proetaleTopology`.

Sources:

- CS17 §4.3, Proposition 4.3.13, p. 720 (cs17): “Proposition 4.3.13. Let S be a scheme over F̄p, and let X be a p-divisible group with extra structure over S. Assume that there is some b ∈ B(G) such that all fibres of X are quasi-isogenous to Xb (compatibly with extra” — States the hypotheses of the J_b(ℚ_p)-torsor.

### `drinfeld-level-newton-strata` — Newton strata of the special fibre at Drinfeld level for the Harris–Taylor type datum (Li–Liu, proof of Lemma 7.3)

Declaration `IgusaVarietiesAndTorsionConcentration:IG.0/drinfeld-level-newton-strata` (construction). Suggested home: `TauCeti/ShimuraVarieties/Igusa/DrinfeldStrata` (`TauCeti.Igusa.DrinfeldStratum`).

In the setting of Li–Liu §§6–7 (a unitary Shimura variety of signature (1, n−1) at one archimedean place and (0, n) at the others, with Drinfeld level 𝔭^m at a place u of F⁺ split in F, of residue characteristic p), let 𝒳_m be the integral model at Drinfeld level m and Y_m = 𝒳_m ⊗ k. For 0 ≤ j ≤ n − 1 let Y_{m,j} ⊂ Y_m^{red} be the closed locus where the formal part of the one-dimensional O_{F_u}-divisible group A[u^{c,∞}] has height at least j + 1, and Y°_{m,j} = Y_{m,j} ∖ Y_{m,j+1}. Then Y°_{m,j} is smooth over k of pure dimension n − 1 − j, Y_{m,0} = Y_m^{red}, and the strata are stable under the prime-to-p Hecke action.

Hypotheses:

- Harris–Taylor type unitary datum with u split in F, Drinfeld level structure at u.
- The smoothness and dimension statements are those of Harris–Taylor [HT01, Cor. III.4.4] at Drinfeld level.

Proof or construction:

1. Stratify by the étale height h of A[u^{c,∞}] (a one-dimensional formal O_{F_u}-module plus an étale part); the closed conditions "formal height ≥ j + 1" give a filtration by closed subsets.
2. Smoothness and dimension of Y°_{m,j}: Harris–Taylor [HT01, Cor. III.4.4] (Drinfeld level structures are regular, the strata are cut out by vanishing of the Drinfeld basis on the formal part).
3. These strata are the Newton strata of this datum: the isocrystal of A[u^{c,∞}] has slopes determined by j.

Uses:

- IG.5/li-liu-drinfeld-vanishing: the proof of Li–Liu Lemma 7.3 computes H^{2r}(𝒳_m) from the cohomology of the strata Y°_{m,j}
- IG.1/harris-taylor-igusa-varieties: Y°_{m,j} is a finite disjoint union of Igusa varieties of the first kind I_{m,j}

API:

- `DrinfeldStratum` (constructor): Y°_{m,j} ⊂ Y_m, a locally closed reduced subscheme.
- `DrinfeldStratum.closed` (characterisation): Y_{m,j} = ⊔_{j′ ≥ j} Y°_{m,j′} is closed.
- `DrinfeldStratum.smooth` (instance): Y°_{m,j} is smooth over k of pure dimension n − 1 − j.
- `DrinfeldStratum.hecke` (functoriality): Stable under prime-to-p Hecke correspondences.
- `DrinfeldStratum.levelZero` (compatibility): At m = 0 the strata are the Newton strata of IG.0/newton-map.

Unit tests:

- `DrinfeldStratum.n_two` (computation): For n = 2, Y°_{m,1} is zero-dimensional (the supersingular locus).
- `DrinfeldStratum.top` (degenerate): Y°_{m,0} is open and dense in Y_m^{red}, of dimension n − 1.
- `DrinfeldStratum.not_regular_m` (non-example): For m ≥ 1, Y_m itself is not reduced in general; only Y_m^{red} is stratified.

Acceptance:

- For n = 2 (j ∈ {0, 1}) Y°_{m,1} is the supersingular locus, of dimension 0.
- At m = 0 these are the Newton strata of IG.0/newton-map for this datum.

Depends on: `newton-map`, `integral-model`.

Used by: `refined-drinfeld-strata`, `harris-taylor-igusa-varieties`.

Sources:

- Proof of Lemma 7.3 and footnote 14, p. 34 (lil21): “denote by Ym,j the Zariski closed subset of Ym on which the formal part of A[uc,∞ ] has height at least j + 1. By the similar argument of [HT01, Corollary III.4.4], we know that” — Li–Liu, proof of Lemma 7.3 and footnote 14: the strata Y_{m,j}, Y°_{m,j}, smooth of pure dimension n − 1 − j.

### `isomorphism-locus-constructible` — Constructibility of isomorphism loci of p-divisible groups (Oort, Foliations, Corollary 2.5)

Declaration `IgusaVarietiesAndTorsionConcentration:IG.0/isomorphism-locus-constructible` (theorem).

Let 𝒢 be a p-divisible group with PEL extra structure over a scheme T of finite type over an algebraically closed field k of characteristic p, and Y a p-divisible group with the same kind of structure over k. The set of points t ∈ T with 𝒢_t̄ ≅ Y ⊗ k(t̄) (compatibly with the extra structure) is constructible, and it is closed in any locally closed subset of T on which the Newton polygon of 𝒢 is constant.

Hypotheses:

- T of finite type over k; extra structures of PEL type.

Proof or construction:

1. The isomorphism class of 𝒢_t̄ is determined by its p^N-truncation for N depending only on the height (Oort; Traverso's truncation bound), so the locus is the image of the scheme of isomorphisms 𝒢[p^N] ≅ Y[p^N] that lift to all levels, a constructible set by Chevalley.
2. Closedness in a Newton stratum: Oort [Oor04, Thm 2.2, Cor. 2.5] (not read here; cited through CSnc and Mantovan); with PEL structure, Mantovan [Man05, Prop. 1]. The truncation bound is Traverso's, proved by Vasiu.

Acceptance:

- For T a Newton stratum of a modular curve, the isomorphism locus of the supersingular p-divisible group is the whole finite stratum.

Depends on: `g-structure`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-divisible-group`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-divisible-cartier-dual`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-divisible-connected-etale`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/dieudonne-p-divisible`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/dieudonne-slopes`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/isogeny-classification`, `VectorBundlesAndIsocrystals:VB0/dieudonne-manin-isocrystals`.

Used by: `truncated-rz-isomorphism-locus`, `central-leaf`.

Sources:

- CSnc §2.2, proof of Lemma 2.2.5, p. 17 (csnc): “We know that the subset Z is constructible by [Oor04, Corollary 2.5]. To show” — Cites Oort for the constructibility of the isomorphism locus.
- Proposition 1, §3, p. 7 of the Caltech preprint (proof p. 8) (man05): “We define CΣ = {x ∈ X̄|Gx̄ ≃ Σk(x) } ⊂ X̄ (b) ×k F̄p . This is closed subset of the stratum X̄ (b) and as a subscheme of X̄ (b) ×k F¯p endowed with the induced reduced structure is smooth.” — Mantovan Proposition 1: central leaves are closed in the Newton stratum and smooth with the reduced structure.

### `refined-drinfeld-strata` — Refined Newton strata Y^(M)_m by the kernel of the Drinfeld structure (Li–Liu II §4.3)

Declaration `IgusaVarietiesAndTorsionConcentration:IG.0/refined-drinfeld-strata` (construction). Suggested home: `TauCeti/ShimuraVarieties/Igusa/DrinfeldStrata` (`TauCeti.Igusa.RefinedStratum`).

In the Harris–Taylor type setting of IG.0/drinfeld-level-newton-strata (n arbitrary), for x ∈ Y_m(𝔽̄_p) the group A_x[u^{c,∞}] is a one-dimensional O_{F_u}-divisible group of height n; let 0 ≤ h(x) ≤ n − 1 be the height of its étale part. Y^[h]_m (h(x) ≤ h) is closed and reduced, and Y^(h)_m := Y^[h]_m ∖ Y^[h−1]_m is smooth of pure dimension h. For m ≥ 1, 𝔖^h_m is the set of free O_{F_u}/𝔭_u^m-submodules of (𝔭_u^{−m}/O_{F_u})^n of rank n − h, and Y^(M)_m ⊂ Y^(h)_m (M ∈ 𝔖^h_m) is the open and closed locus where the Drinfeld level structure has kernel M; with Y^[M]_m the scheme-theoretic closure, Y^[M]_m = ⋃_{M ⊆ M′ ∈ 𝔖_m} Y^(M′)_m set-theoretically (display (4.1)). The strata are preserved by Hecke operators away from u.

Hypotheses:

- Harris–Taylor type datum with Drinfeld level m ≥ 1 at a split place u.

Proof or construction:

1. The étale height is upper semicontinuous, so Y^[h]_m is closed; smoothness and dimension of Y^(h)_m as in IG.0/drinfeld-level-newton-strata (h = n − 1 − j).
2. On Y^(h)_m the Drinfeld structure restricted to the étale part has a locally constant kernel M, which defines the open and closed pieces Y^(M)_m.
3. Display (4.1) is asserted in Li–Liu without proof: a specialization of a point with kernel M has kernel containing M (kernels grow under specialization of the étale part).

Uses:

- Li–Liu II, Proposition 4.25 and Theorem 4.21: the localized cohomology of the closed strata Y^[M]_m is computed stratum by stratum
- IG.0/refined-strata-closures-smooth: the closures Y^[M]_m are smooth (Mantovan)

API:

- `RefinedStratum` (constructor): Y^(M)_m ⊂ Y^(h)_m for M ∈ 𝔖^h_m.
- `RefinedStratum.closure` (constructor): Y^[M]_m, the scheme-theoretic closure.
- `RefinedStratum.closure_eq` (characterisation): Y^[M]_m = ⋃_{M ⊆ M′} Y^(M′)_m set-theoretically.
- `RefinedStratum.decomp` (other): Y^(h)_m = ⊔_{M ∈ 𝔖^h_m} Y^(M)_m.
- `RefinedStratum.hecke` (functoriality): Preserved by Hecke operators away from u.

Unit tests:

- `RefinedStratum.n_two_supersingular` (computation): For n = 2, 𝔖^0_m has exactly one element and Y^(0)_m is the supersingular locus.
- `RefinedStratum.top` (degenerate): For h = n − 1, 𝔖^{n−1}_m consists of rank-one submodules and Y^(n−1)_m is dense in Y_m.
- `RefinedStratum.not_closed` (non-example): Y^(M)_m is not closed for h ≥ 1: its closure contains strata Y^(M′)_m with M ⊊ M′.

Acceptance:

- For n = 2: Y^(0)_m is the supersingular locus (M of rank 2, the whole (𝔭^{−m}/O)²), and Y^(1)_m decomposes by the lines M of rank 1.

Depends on: `drinfeld-level-newton-strata`.

Used by: `refined-strata-closures-smooth`.

Sources:

- §4.3, after Theorem 4.21, p. 58 (lil22): “height n and we let 0 ⩽ ℎ(𝑥) ⩽ 𝑛 − 1 be the height of its étale part. For 0 ⩽ ℎ ⩽ 𝑛 − 1, let 𝑌𝑚[ℎ] be the” — Li–Liu II §4.3: the strata Y^[h]_m, Y^(h)_m, 𝔖^h_m, Y^(M)_m.
- §4.3, display (4.1), p. 58 (lil22): “Let 𝑌𝑚[𝑀 ] be the scheme-theoretic closure of 𝑌𝑚( 𝑀 ) inside 𝑌𝑚 . Then we have” — Li–Liu II display (4.1).

## IG.1. Igusa towers and their actions

IG.1 builds the Igusa towers. The perfect Igusa variety Ig^X trivializes A[p^∞] over the leaf. It is an Aut(X)-torsor, a pro-étale Γ_X-torsor on perfect schemes, perfect, and depends on X only up to isogeny. Through quasi-isogenies the formal group Aut_G(X̃) acts on it, hence J_b(ℚ_p) does. Mantovan's finite-level varieties are finite étale Galois over the leaf, and Ig^X is the perfection of their limit; the two torsor structures, under the non-reduced Aut(X_b) and under the profinite Γ_X, are kept apart. The layer then constructs the J_b(ℚ_p) × G(𝔸_f^p)-action on the tower with its stabilizers, the cohomology complexes as filtered colimits over finite levels (integral complexes, never defined from a virtual character), and the alternating cohomology in the Grothendieck group that Shin's trace formula computes. The Harris–Taylor Igusa varieties of the first kind, and the smoothness of the closures of refined Newton strata, are the Igusa inputs of Li–Liu's arguments.

Imports from other roadmaps in this layer: `EtaleDualityAndPerverseSheaves:EDC.0/enhanced-compact-pushforward`, `SmoothRepresentationsOfLocalGroups:SR.0`, `SmoothRepresentationsOfLocalGroups:SR.2`.

### `perfect-igusa-variety` — The perfect Igusa variety Ig^X over a central leaf (CSnc Corollary 2.3.2; CS17 Definition 4.3.1–Corollary 4.3.5) ★

Declaration `IgusaVarietiesAndTorsionConcentration:IG.1/perfect-igusa-variety` (construction). Planet: Perfect Igusa variety. Suggested home: `TauCeti/ShimuraVarieties/Igusa/Igusa` (`TauCeti.Igusa.Igusa`).

Let X be a p-divisible group with G-structure over k = 𝔽̄_p (more generally, with the extra structures of a PEL datum of type (A) or (C), unramified at p, with hyperspecial level), lying in the isogeny class b, and C^X ⊂ S_{K,k} its central leaf. The Igusa variety Ig^X → C^X is the scheme parametrizing isomorphisms ρ : A[p^∞] ≅ X of p-divisible groups with G-structure (respecting the polarizations up to ℤ_p^×). (1) It is representable by an Aut(X)-torsor over C^X, Aut(X) the (generally non-reduced) group scheme of automorphisms of X with G-structure; its restriction to perfect schemes is a pro-étale Γ_X-torsor over (C^X)_perf, Γ_X = Aut(X)(k) profinite. (2) Ig^X is perfect. (3) Equivalently (CS17 Lemma 4.3.4), Ig^X(R) is the set of pairs (A, ρ̃) with A an abelian variety with G-structure over R up to p-power isogeny and ρ̃ : A[p^∞] → X ×_k R a quasi-isogeny respecting the extra structures; hence the formal group Aut_G(X̃) acts on Ig^X through ρ̃, extending the action of Aut(X), and in particular J_b(ℚ_p) = Aut_G(X̃)(k) acts on Ig^X. Ig^X depends only on the isogeny class b (Ig^b := Ig^{X_b}), and G(𝔸_f^p) acts on the tower (Ig^X_{K^p})_{K^p} by prime-to-p Hecke correspondences, commuting with J_b(ℚ_p).

Hypotheses:

- PEL datum of type (A) or (C), unramified at p, hyperspecial K_p (for the quasi-split unitary datum: p ∤ NΔ_F).
- K^p sufficiently small (neat).

Proof or construction:

1. Representability and the Aut(X)-torsor structure: apply IG.0/isomorphism-torsors (2) to 𝒢 = A[p^∞] over the regular (smooth) leaf C^X (CSnc Corollary 2.3.2); the Γ_X-torsor over (C^X)_perf is IG.0/isomorphism-torsors (1).
2. Moduli up to isogeny (CS17 Lemma 4.3.4): given (A, ρ̃) there is a unique A′ with a p-power isogeny A′ → A such that the induced quasi-isogeny A′[p^∞] → X is an isomorphism; this uses Serre–Tate-free arguments over 𝔽_p-algebras (kernel of a quasi-isogeny), with the corrected statement of sourceIssues PAPER-CARAIANI-SCHOLZE-17/E49.
3. Perfectness (CS17 Corollary 4.3.5): pullback along Frobenius is an equivalence on abelian varieties up to p-power isogeny (Verschiebung is an inverse up to p) and on p-divisible groups up to quasi-isogeny, so the moduli description up to isogeny is invariant under Frobenius.
4. Actions: quasi-isogenies of X with extra structure act on ρ̃; prime-to-p isogenies of A act through the level structure, giving the G(𝔸_f^p)-Hecke correspondences.

Uses:

- IG.2/perfect-toroidal-igusa-variety: the Γ_X-torsor Ig^X → C^X_perf extends uniquely over C^{X,tor}_perf
- IG.3/canonical-lift-of-igusa: being perfect, Ig^b lifts uniquely to a flat p-adic formal scheme over W(k), whose generic fibre computes the fibres of π_HT
- IG.4/artin-vanishing-upper-bound: H^i(Ig^b, 𝔽_ℓ) with its 𝕋^S-action is the object of the degree bounds
- EndoscopicTransferAndUnitaryTraceComparison:ET.5: Shin's trace formula computes the alternating cohomology of the Igusa varieties with their J_b(ℚ_p) × G(𝔸_f^p)-action
- AutomorphicGaloisRepresentationsPartII:AG2.1b: imports the Igusa varieties and their quasi-isogeny and Hecke actions for its unitary datum

API:

- `Igusa` (constructor): Ig^X → C^X for X a p-divisible group with G-structure over k.
- `Igusa.isTorsor` (characterisation): Ig^X → C^X is an Aut(X)-torsor; on perfect schemes a pro-étale Γ_X-torsor over (C^X)_perf.
- `Igusa.isPerfect` (instance): Ig^X is a perfect 𝔽_p-scheme.
- `Igusa.isoUpToIsogeny` (equivalence): For a perfect k-algebra R, Ig^X(R) ≅ {(A, ρ̃)} with A up to p-power isogeny and ρ̃ a quasi-isogeny with extra structure (for non-perfect R, isogeny classes of A do not describe Ig^X(R)).
- `Igusa.jAction` (functoriality): J_b(ℚ_p) acts on Ig^X, compatibly with composition, through ρ̃ ↦ g ∘ ρ̃.
- `Igusa.heckeAction` (functoriality): G(𝔸_f^p) acts on the tower (Ig^X_{K^p})_{K^p} by Hecke correspondences, commuting with J_b(ℚ_p).
- `Igusa.ofIsogeny` (compatibility): An isogeny φ : X → X′ with G-structure induces Ig^X ≅ Ig^{X′} over the correspondence C^X ← Ig ≅ Ig → C^{X′}.

Unit tests:

- `Igusa.ordinary` (computation): For b ordinary (unitary datum, p split in F), Γ_X = Aut(X_b)(k) ≅ GL_n(O_F ⊗ ℤ_p) × ℤ_p^×: automorphisms of the étale part (O_F ⊗ ℚ_p/ℤ_p)^n, the multiplicative part being determined by the polarization up to the similitude scalar.
- `Igusa.basic_pointwise` (degenerate): For F imaginary quadratic, n = 1 and b basic, C^b is a finite set of points, so Ig^b is a profinite set: over each point of C^b a Γ_X-torsor of points.
- `Igusa.not_mantovan` (non-example): Ig^X is not of finite type: it is the perfection of Mantovan's pro-finite étale tower (IG.1/perfection-of-mantovan), not any finite level of it.
- `Igusa.frobenius_bijective` (characterisation): The absolute Frobenius of Ig^X is an isomorphism.

Acceptance:

- Ordinary example: for b ordinary and the unitary datum with p split in F, Ig^b is the perfection of the ordinary Igusa tower trivializing μ_{p^∞} ⊗ O_F^n and ℚ_p/ℤ_p ⊗ O_F^n, a Γ_X = GL_n(O_F ⊗ ℤ_p)-torsor (up to the similitude factor) over the ordinary locus.
- Basic example: for b basic, C^b is finite and Ig^b is a pro-finite set of points with J_b(ℚ_p) acting.
- Non-example: over Hilbert modular varieties (Res_{F/ℚ}GL₂) the Katz–Hida ordinary tower of trivializations of the canonical subgroup is a different object and is supplied by HodgeTateAndCanonicalSubgroups T5, not by this construction.

Depends on: `central-leaf`, `isomorphism-torsors`, `automorphism-group-of-universal-cover`, `g-structure`, `integral-model`, `mathlib:PerfectRing`.

Used by: `igusa-isogeny-invariance`, `perfection-of-mantovan`, `igusa-group-actions`, `igusa-cohomology`, `perfect-toroidal-igusa-variety`, `canonical-lift-of-igusa`.

Sources:

- CSnc §2.3, Corollary 2.3.2, p. 18 (csnc): “Corollary 2.3.2. The scheme IgX → CX ⊂ SK,k parametrizing isomorphisms A[p∞ ] ∼ = X of p-divisible groups with G-structure is representable by an Aut(X)-torsor over CX .” — Representability of Ig^X as an Aut(X)-torsor over the leaf.
- CS17 §4.3, Corollary 4.3.5, p. 715 (cs17): “Corollary 4.3.5. The formal group scheme AutG(‹ Xb) acts canonically on Igb . Moreover, Igb is perfect; i.e., the Frobenius map is an automorphism.” — Aut_G(X̃_b) acts on Ig^b and Ig^b is perfect.
- CS17 §4.3, Lemma 4.3.4, p. 715 (cs17): “Lemma 4.3.4. For an F̄q-algebra R, Igb (R) can be identified with the set of isomorphism classes of pairs (A,ρ̃), where A ∈ SKpKp(R) is an abelian variety considered up to p-power isogeny (respecting” — The moduli description up to p-power isogeny.

### `igusa-isogeny-invariance` — Isogeny invariance of the open Igusa variety and the pro-finite correspondences between leaves (CSnc §2.3; CS17 Lemma 4.3.4)

Declaration `IgusaVarietiesAndTorsionConcentration:IG.1/igusa-isogeny-invariance` (theorem).

An isogeny φ : X → X′ of p-divisible groups with G-structure (compatible with the extra structures up to a common similitude scalar) induces an isomorphism Ig^X ≅ Ig^{X′}, equivariant for J_b(ℚ_p) × G(𝔸_f^p) after identifying J_b(ℚ_p) for X and X′ through φ. Hence the perfect Igusa variety Ig^b depends only on the isogeny class b, and there are pro-finite correspondences C^X ← Ig^X ≅ Ig^{X′} → C^{X′} between different leaves in the same Newton stratum. This invariance is for the open Igusa variety; the toroidal statement (IG.2/toroidal-isogeny-invariance) needs separate hypotheses.

Hypotheses:

- φ compatible with the extra structures (O_F-linear, polarizations up to a scalar).

Proof or construction:

1. By the moduli description up to isogeny (IG.1/perfect-igusa-variety (3)), composing ρ̃ with φ identifies the functors Ig^X and Ig^{X′}.
2. Equivariance is clear since the identification J_b(ℚ_p) ≅ J_{b}(ℚ_p)′ is conjugation by φ.

Acceptance:

- For X ordinary and X′ = X/X^μ[p] (similitude scalar p), Ig^X ≅ Ig^{X′} while the leaves C^X and C^{X′} coincide.

Depends on: `perfect-igusa-variety`.

Used by: `igusa-cohomology`, `toroidal-isogeny-invariance`.

Sources:

- CSnc §2.3, after Corollary 2.3.2, p. 18 (csnc): “Moreover, IgX can be reinterpreted in terms of a moduli space of abelian varieties with G-structures up to p-power isogeny, and isomorphisms of A[p∞ ] with G-action up to p-power isogeny, cf. [CS17, Lemma 4.3.4]. This shows in particular that IgX is perfect,” — Perfectness and isogeny invariance of Ig^X, with the correspondences between leaves.

### `mantovan-igusa-variety` — Mantovan's finite-level Igusa varieties Ig^X_{Mant,m} for completely slope divisible X (CSnc Definition 2.3.5, Remark 2.3.6; CS17 Definition 4.3.6) ★

Declaration `IgusaVarietiesAndTorsionConcentration:IG.1/mantovan-igusa-variety` (construction). Planet: Mantovan Igusa varieties. Suggested home: `TauCeti/ShimuraVarieties/Igusa/Mantovan` (`TauCeti.Igusa.MantovanIgusa`).

Let X = ⊕_{i=1}^r X_i be completely slope divisible with G-structure over k, with isoclinic X_i of strictly decreasing slopes, and 𝒢 = A[p^∞]|_{C^X}, which is completely slope divisible with slope filtration 𝒢₁ ⊂ … ⊂ 𝒢_r and graded pieces 𝒢^i. The (pro-)Igusa variety Ig^X_Mant → C^X parametrizes over a C^X-scheme T tuples (ρ_i)_{i=1}^r of isomorphisms ρ_i : 𝒢^i ×_{C^X} T ≅ X_i ×_k T compatible with the O_F ⊗ ℤ_p-actions and commuting with the polarizations 𝒢^i → (𝒢^j)^∨ (λ_i + λ_j = 1) up to an element of ℤ_p^×(T) independent of i. For m ≥ 0, Ig^X_{Mant,m} parametrizes isomorphisms ρ_{i,m} : 𝒢^i[p^m] ×_{C^X} T ≅ X_i[p^m] ×_k T that lift fppf locally to every m′ ≥ m and respect the extra structures up to (ℤ/p^m)^×. Then Ig^X_{Mant,m} → C^X is a finite étale Galois cover with group Γ_{m,X} (by IG.0/liftable-automorphisms), the transition maps are finite étale, and Ig^X_Mant = lim_m Ig^X_{Mant,m} is a pro-finite étale Γ_X-cover of C^X. Each Ig^X_{Mant,m} is smooth over k of dimension d_b.

Hypotheses:

- X completely slope divisible with G-structure; C^X the central leaf (smooth, so seminormal).

Proof or construction:

1. The slope filtration of 𝒢 over C^X exists because 𝒢 is geometrically constant with completely slope divisible fibres and C^X is regular (IG.0/completely-slope-divisible, Lemma 2.3.4).
2. Apply IG.0/liftable-automorphisms (2) to each isoclinic graded piece 𝒢^i over the seminormal C^X, with the polarization pairing the pieces of slopes λ and 1 − λ, to get the finite étale Γ_{m,X}-torsor Ig^X_{Mant,m}.
3. Smoothness: finite étale over the smooth leaf.

Uses:

- IG.1/igusa-cohomology: the cohomology of Igusa varieties is the colimit over m of the cohomology of the finite-level Ig^b_{Mant,m}
- IG.2/toroidal-igusa-finite-level: Ig^X_{Mant,m} → C^X extends to a finite étale cover of C^{X,tor}
- IG.2/minimal-igusa-compactification: Ig^{b,*}_m is the normalization of C^{b,*} in Ig^b_{Mant,m}
- EndoscopicTransferAndUnitaryTraceComparison:ET.5: Shin's point counting and Mantovan's product formula are stated for the finite-level varieties J_m = Ig^b_{Mant,m}

API:

- `MantovanIgusa` (constructor): Ig^X_{Mant,m} → C^X for completely slope divisible X and m ≥ 0.
- `MantovanIgusa.finiteEtale` (instance): Ig^X_{Mant,m} → C^X is finite étale Galois with group Γ_{m,X}.
- `MantovanIgusa.transition` (projection): The transition maps Ig^X_{Mant,m+1} → Ig^X_{Mant,m}, finite étale.
- `MantovanIgusa.smooth` (instance): Ig^X_{Mant,m} is smooth of dimension d_b over k.
- `MantovanIgusa.pro` (constructor): Ig^X_Mant = lim_m Ig^X_{Mant,m}, a pro-finite étale Γ_X-cover of C^X.
- `MantovanIgusa.monoidAction` (functoriality): Only the submonoid of J_b(ℚ_p) of elements preserving ⊕X_i integrally with nonnegative valuations on the graded pieces acts on the tower, by finite correspondences.

Unit tests:

- `MantovanIgusa.ordinary_level_one` (computation): For F imaginary quadratic, n = 1 and b ordinary, Ig^b_{Mant,1} is the Igusa curve of level p over the ordinary locus, Galois with group (O_F/p)^× (up to the similitude factor).
- `MantovanIgusa.level_zero` (degenerate): Ig^X_{Mant,0} = C^X.
- `MantovanIgusa.not_whole_group` (non-example): Trivializing all of A[p^m] rather than the graded pieces gives a different (non-finite-étale) moduli problem when X is not isoclinic.
- `MantovanIgusa.galoisGroup` (characterisation): The Galois group of Ig^X_{Mant,m} → C^X is Γ_{m,X}, the image of Aut(X) in the automorphisms of ⊕X_i[p^m].

Acceptance:

- For b ordinary (unitary datum, p split in F), Ig^b_{Mant,m} is the classical ordinary Igusa variety of level p^m over the ordinary locus.
- The transition maps Ig^X_{Mant,m+1} → Ig^X_{Mant,m} are finite étale and Galois with group ker(Γ_{m+1,X} → Γ_{m,X}).

Depends on: `completely-slope-divisible`, `liftable-automorphisms`, `central-leaf`, `slope-filtration-existence`.

Used by: `perfection-of-mantovan`, `igusa-faithfully-flat`, `igusa-group-actions`, `igusa-cohomology`, `harris-taylor-igusa-varieties`, `toroidal-igusa-finite-level`, `minimal-igusa-compactification`.

Sources:

- CSnc §2.3, Definition 2.3.5, p. 19 (csnc): “The (pro-)Igusa variety is the map IgX → CX which over a CX -scheme T parametrizes tuples (ρi)r i=1 of isomorphisms ρi : Gi ×CX T ∼ → Xi ×k T which are compatible with the OF ⊗Z Zp-actions on Gi and Xi and commute with the” — Defines Mantovan's pro-Igusa variety via isomorphisms of the graded pieces.
- CS17 §4.3, Remark 4.3.7, p. 716 (cs17): “Rather than trivializing the whole isoclinic p-divisible group Gi b, one trivializes” — Explains the difference with trivializing the whole p-divisible group.
- Definition 5.3, §5, p. 16 of the Berkeley preprint (shi09): “Definition 5.3. Let m be a positive integer. The Igusa variety Igb,U p ,m is defined to be the moduli space of the set of the following isomorphisms of finite flat group schemes over Cb,U p ∼ univ jm,i : Σi [pm ] ×Fp Cb,U p → gri G [pm ], 1≤i≤r” — Shin's finite-level Igusa varieties Ig_{b,U^p,m}, the objects of his point-counting formula.
- Proposition 4, §4, p. 11 of the Caltech preprint (man05): “Proposition 4. For any m ≥ 1, the Igusa variety Jb,m → Cb is finite étale and Galois, with Galois group Γb,m . In particular, the Igusa varieties are smooth.” — Mantovan: the finite-level Igusa varieties are finite étale Galois over the leaf.

### `perfection-of-mantovan` — The perfect Igusa variety is the perfection of Mantovan's Igusa variety (CS17 Proposition 4.3.8; CSnc Remark 2.3.7)

Declaration `IgusaVarietiesAndTorsionConcentration:IG.1/perfection-of-mantovan` (theorem).

For completely slope divisible X_b in the isogeny class b, the natural map Ig^b → Ig^b_Mant = lim_m Ig^b_{Mant,m} identifies the perfect scheme Ig^b with the perfection of Ig^b_Mant. Consequently H^i(Ig^b, ℤ/ℓ^n) = colim_m H^i(Ig^b_{Mant,m}, ℤ/ℓ^n) and H^i_c(Ig^b, ℤ/ℓ^n) = colim_m H^i_c(Ig^b_{Mant,m}, ℤ/ℓ^n) for ℓ ≠ p. The group J_b(ℚ_p) acts on Ig^b, whereas only a submonoid of J_b(ℚ_p) acts on Ig^b_Mant; on cohomology the two actions agree.

Hypotheses:

- X_b completely slope divisible; ℓ ≠ p.

Proof or construction:

1. Over a perfect base the slope filtration of A[p^∞] splits canonically using the isomorphisms p^{−t_i}F^s (IG.0/slope-filtration-existence (2)), so a tuple of isomorphisms of graded pieces is an isomorphism A[p^∞] ≅ X_b over perfect schemes (with the corrected bookkeeping of sourceIssues PAPER-CARAIANI-SCHOLZE-17/E52).
2. Hence Ig^b and Ig^b_Mant have the same perfect-scheme points, and Ig^b, being perfect, is the perfection.
3. Étale cohomology is invariant under perfection (universal homeomorphism) and commutes with cofiltered limits of qcqs schemes along affine transition maps.
4. Compatibility of the J_b(ℚ_p)-actions on cohomology with Mantovan's: the paper leaves this check to the reader; it is part of this node's proof (compare the action of the submonoid by finite correspondences with the action on the perfection).

Acceptance:

- For b ordinary the identification recovers the perfection of the classical Igusa tower.

Depends on: `perfect-igusa-variety`, `mantovan-igusa-variety`, `slope-filtration-existence`.

Used by: `igusa-faithfully-flat`, `igusa-cohomology`, `harris-taylor-igusa-varieties`, `minimal-igusa-compactification`, `compact-fibre-theorem`.

Sources:

- CS17 §4.3, Proposition 4.3.8, p. 717 (cs17): “Proposition 4.3.8. The perfect scheme Igb is the perfection of Ib Mant, via the natural map Igb → Ib Mant. Proof. Let (Ib” — Ig^b is the perfection of Mantovan's Igusa variety.
- CSnc §2.3, Remark 2.3.7, p. 20 (csnc): “Remark 2.3.7. The scheme IgX maps naturally to IgX (as is evident from the moduli description), and then even to its perfection. The resulting map” — The map from Mantovan's Igusa variety to the perfect one.

### `igusa-faithfully-flat` — Ig^b → C^b is faithfully flat, a torsor under the non-reduced Aut(X_b) (CS17 Corollary 4.3.9)

Declaration `IgusaVarietiesAndTorsionConcentration:IG.1/igusa-faithfully-flat` (theorem).

The map Ig^b → C^b is faithfully flat. Since it is a quasi-torsor under the group scheme Aut(X_b) of automorphisms of X_b respecting the extra structures, it is an fpqc Aut(X_b)-torsor. This torsor is distinct from the pro-étale Γ_X-torsor Ig^b → (C^b)_perf: Aut(X_b) is highly non-reduced (like Spec k[[x₁^{1/p^∞}, …, x_d^{1/p^∞}]]/(x₁, …, x_d)) when X_b is not isoclinic, while Γ_X = Aut(X_b)(k) is profinite.

Hypotheses:

- X_b completely slope divisible.

Proof or construction:

1. Ig^b_Mant is a cofiltered limit of smooth schemes along affine maps, so its Frobenius is faithfully flat; hence Ig^b → Ig^b_Mant (the perfection) is faithfully flat.
2. Ig^b_Mant → C^b is faithfully flat (pro-finite étale); compose.
3. A faithfully flat quasi-torsor is a torsor.

Acceptance:

- The dimension statement dim C^b = d sketched in CS17 after Corollary 4.3.9 is not used in the rest of the argument; the dimension is imported from IG.0/central-leaf-dimension.

Depends on: `perfection-of-mantovan`, `mantovan-igusa-variety`, `isomorphism-torsors`.

Sources:

- CS17 §4.3, Corollary 4.3.9, p. 718 (cs17): “Corollary 4.3.9. The map Igb → Cb is faithfully flat. As the map is obviously a quasitorsor under the automorphisms of Xb respecting the extra structure, this implies that it is in fact a torsor” — Faithful flatness and the torsor structure.

### `igusa-group-actions` — The J_b(ℚ_p) × G(𝔸_f^p)-action on the Igusa tower: effective groups and stabilizers

Declaration `IgusaVarietiesAndTorsionConcentration:IG.1/igusa-group-actions` (construction). Suggested home: `TauCeti/ShimuraVarieties/Igusa/Actions` (`TauCeti.Igusa.IgusaTower`).

Let Ig^b_{K^p} denote the perfect Igusa variety at prime-to-p level K^p ⊂ G(𝔸_f^p) and Ig^b_∞ = lim_{K^p} Ig^b_{K^p}. The group J_b(ℚ_p) × G(𝔸_f^p) acts on Ig^b_∞ (J_b(ℚ_p) through quasi-isogenies of X_b, G(𝔸_f^p) through the prime-to-p level structure), continuously for the profinite topology on the tower: the stabilizer of each finite-level quotient Ig^b_{K^p} contains K^p, and for each compact open K^p and each m the subgroup ker(Γ_{X_b} → Γ_{m,X_b}) × K^p acts trivially on Ig^b_{Mant,K^p,m}. The group ℤ[1/p]^× = {±p^k}, embedded diagonally as scalars in J_b(ℚ_p) × G(𝔸_f^p), acts trivially on Ig^b_∞ (−1 is an automorphism of A, and p is a p-power isogeny of A acting on ρ̃ and on the prime-to-p level structure); the effective group acting on the tower is the quotient by this subgroup. On cohomology this gives a smooth J_b(ℚ_p) × G(𝔸_f^p)-representation.

Hypotheses:

- K^p neat; ℓ ≠ p for the statements on cohomology.

Proof or construction:

1. Define the actions on the moduli description (IG.1/perfect-igusa-variety (3)): g ∈ J_b(ℚ_p) sends (A, ρ̃) to (A, g ∘ ρ̃); h ∈ G(𝔸_f^p) acts on the level structure η, through Hecke correspondences at finite level.
2. Continuity: a point of Ig^b_{K^p} is fixed by K^p, and the Γ_X-torsor is pro-étale with finite quotients Γ_{m,X}.
3. Global scalars: z ∈ ℤ[1/p]^× acts on (A, ρ̃, η) by (A, ρ̃ ∘ z, η ∘ z), and z is a quasi-isogeny of A (an automorphism for z = −1, a p-power isogeny for z = p), which is an isomorphism in the moduli problem up to p-power isogeny (IG.1/perfect-igusa-variety (3)); so the diagonal ℤ[1/p]^× acts trivially.

Uses:

- IG.1/igusa-cohomology: makes H^i_c(Ig^b, Λ) a smooth J_b(ℚ_p) × G(𝔸_f^p)-representation
- IG.6/igusa-pink-formula: the boundary formula is an isomorphism of J_b(ℚ_p) × G(𝔸_f^p)-equivariant complexes
- EndoscopicTransferAndUnitaryTraceComparison:ET.5: traces of φ ∈ C^∞_c(G(𝔸_f^p) × J_b(ℚ_p)) on Igusa cohomology

API:

- `IgusaTower.action` (functoriality): The action of J_b(ℚ_p) × G(𝔸_f^p) on Ig^b_∞, with action laws (gh)·x = g·(h·x), 1·x = x.
- `IgusaTower.stabilizer_open` (characterisation): The stabilizer in Γ_X × G(𝔸_f^p) of each finite-level projection Ig^X_∞ → Ig^X_{Mant,K(N),m} is open (it contains ker(Γ_X → Γ_{m,X}) × K^p(N)); stabilizers of individual points need not be open (for basic b they are p-arithmetic groups).
- `IgusaTower.levelQuotient` (projection): Ig^b_{K^p} = Ig^b_∞ / K^p.
- `IgusaTower.globalUnits_trivial` (relation): ℤ[1/p]^× = {±p^k}, embedded diagonally as scalars in J_b(ℚ_p) × G(𝔸_f^p), acts trivially on Ig^b_∞.
- `IgusaTower.hecke_compat` (compatibility): The G(𝔸_f^p)-action is compatible with the prime-to-p Hecke action on S_K under Ig^b → C^b ⊂ S_{K,k}.

Unit tests:

- `IgusaTower.ordinary_J` (computation): For b ordinary (unitary datum, p split in F), J_b(ℚ_p) ≅ ℚ_p^× × ∏_{w|p, w|𝔭} GL_n(F_w) × GL_n(F_w), the Levi of the Siegel-type parabolic.
- `IgusaTower.trivial_level` (degenerate): For neat K^p ⊂ K^{p′} with K^p normal in K^{p′}, the transition Ig^b_{K^p} → Ig^b_{K^{p′}} is finite étale Galois with group K^{p′}/K^p; for K^p = K^{p′} it is the identity.
- `IgusaTower.not_free` (non-example): The action of J_b(ℚ_p) × G(𝔸_f^p) on Ig^b_∞ is not free: the diagonal scalar (p, p) fixes every point.
- `IgusaTower.smooth_cohomology` (characterisation): For every i the J_b(ℚ_p) × G(𝔸_f^p)-representation H^i_c(Ig^b_∞, 𝔽_ℓ) is smooth.

Acceptance:

- For b ordinary and the unitary datum with p split in F, J_b(ℚ_p) is the Levi subgroup (ℚ_p^× × ∏_{w|p} GL_n(F_w) × GL_n(F_w)), and its maximal compact Γ_X fixes the components of Ig^b over C^b.

Depends on: `perfect-igusa-variety`, `mantovan-igusa-variety`.

Used by: `igusa-cohomology`.

Sources:

- CS17 §4.3, after Proposition 4.3.8, p. 718 (cs17): “However, only a certain submonoid of Jb(Qp) acts on Ib Mant; Mantovan, [Man05], does however construct a canonical action of Jb(Qp) on the étale cohomology of Ib Mant. From Proposition 4.3.8, it” — The J_b(ℚ_p)-action on the cohomology of the Igusa varieties.

### `igusa-cohomology` — The cohomology complexes of Igusa varieties as filtered colimits over finite levels ★

Declaration `IgusaVarietiesAndTorsionConcentration:IG.1/igusa-cohomology` (construction). Planet: Cohomology of Igusa varieties. Suggested home: `TauCeti/ShimuraVarieties/Igusa/Cohomology` (`TauCeti.Igusa.IgusaCohomology`).

For ℓ ≠ p and Λ ∈ {ℤ/ℓ^n, 𝔽_ℓ, ℤ_ℓ, ℚ_ℓ, ℚ̄_ℓ}, define RΓ_c(Ig^b_∞, Λ) := colim_{K^p, m} RΓ_c(Ig^b_{Mant,K^p,m}, Λ) and RΓ(Ig^b_∞, Λ) := colim_{K^p, m} RΓ(Ig^b_{Mant,K^p,m}, Λ) (for ℤ_ℓ, ℚ_ℓ take the derived limit over n of the torsion coefficients at each finite level first), with transition maps the pullbacks along the finite étale transition maps. They are complexes of smooth Λ[J_b(ℚ_p) × G(𝔸_f^p)]-modules; at each finite level H^i_c(Ig^b_{Mant,K^p,m}, Λ) is finitely generated over Λ and vanishes outside [0, 2d_b]. Coefficient change holds: RΓ_c(·, ℤ/ℓ^n) ⊗^L_{ℤ/ℓ^n} 𝔽_ℓ ≅ RΓ_c(·, 𝔽_ℓ). The integral complex is defined by this colimit; no rational virtual-character formula enters its definition. The Hecke algebra 𝕋^S (S ⊃ {p, ℓ} ∪ bad primes) acts through the G(𝔸_f^S)-action, and H^i(Ig^b, 𝔽_ℓ)_𝔪 denotes the localization at a maximal ideal 𝔪 ⊂ 𝕋^S at fixed level K^p(N).

Hypotheses:

- ℓ ≠ p; K^p neat.

Proof or construction:

1. Each Ig^b_{Mant,K^p,m} is a smooth variety of dimension d_b over k, so its compactly supported cohomology is finite and concentrated in [0, 2d_b] (SGA 4 finiteness; EtaleDualityAndPerverseSheaves).
2. Pullbacks along finite étale transitions give the filtered systems; perfection does not change étale cohomology (IG.1/perfection-of-mantovan).
3. Smoothness of the actions: each class is defined at a finite level and is fixed by the corresponding open compact subgroup (IG.1/igusa-group-actions).
4. Coefficient change: proper base change and the projection formula at each finite level, then exactness of filtered colimits.

Uses:

- IG.4/minimal-stratum-lower-bound: the lower bound is for H^i(Ig^b, 𝔽_ℓ)_𝔪
- IG.5/galois-representations-for-igusa-constituents: the alternating ℚ̄_ℓ-cohomology [H_c(Ig^b, ℚ̄_ℓ)] is decomposed into J_b(ℚ_p) × 𝕋^S-constituents
- IG.6/igusa-pink-formula: RΓ_c(Ig^{b_P}_∞, 𝔽_ℓ) of the lower-rank Igusa variety is a tensor factor of the boundary formula

API:

- `IgusaCohomology.compactSupport` (constructor): RΓ_c(Ig^b_∞, Λ) as the filtered colimit over (K^p, m).
- `IgusaCohomology.ordinary` (constructor): RΓ(Ig^b_∞, Λ) as the filtered colimit over (K^p, m).
- `IgusaCohomology.smooth` (instance): Each H^i is a smooth Λ[J_b(ℚ_p) × G(𝔸_f^p)]-module.
- `IgusaCohomology.finite_level` (characterisation): H^i_c(Ig^b_{Mant,K^p,m}, Λ) is finitely generated and zero outside 0 ≤ i ≤ 2d_b.
- `IgusaCohomology.changeCoeff` (compatibility): RΓ_c(·, ℤ/ℓ^n) ⊗^L 𝔽_ℓ ≅ RΓ_c(·, 𝔽_ℓ), equivariantly.
- `IgusaCohomology.heckeAction` (functoriality): 𝕋^S acts on RΓ_c(Ig^b_{K^p}, Λ) for K^p = K_S K^S, compatibly with the transition maps.
- `IgusaCohomology.forgetToCompact` (projection): The natural map RΓ_c → RΓ, equivariant.

Unit tests:

- `IgusaCohomology.basic_degree0` (computation): For b basic, Ig^b is pro-finite over a finite leaf, so H^i_c(Ig^b, 𝔽_ℓ) = 0 for i ≠ 0 and H^0_c is the smooth induction of the trivial representation along the global group.
- `IgusaCohomology.ordinary_top` (degenerate): For b ordinary, H^i_c(Ig^b_{Mant,K^p,m}, 𝔽_ℓ) vanishes for i > 2d.
- `IgusaCohomology.not_euler` (non-example): The virtual character Σ(−1)^i[H^i_c] does not determine the individual H^i_c: the integral complex is defined by the colimit, not by the trace formula.
- `IgusaCohomology.perfection_invariant` (compatibility): H^i(Ig^b, 𝔽_ℓ) (perfect Igusa variety) agrees with colim_m H^i(Ig^b_{Mant,m}, 𝔽_ℓ).

Acceptance:

- For b basic the complexes are concentrated in degree 0 and are smooth inductions of functions on a profinite set.
- Under perfection and change of the completely slope divisible representative X_b within its isogeny class the complexes are unchanged (IG.1/igusa-isogeny-invariance).

Depends on: `perfect-igusa-variety`, `mantovan-igusa-variety`, `perfection-of-mantovan`, `igusa-group-actions`, `igusa-isogeny-invariance`, `EtaleDualityAndPerverseSheaves:EDC.0/enhanced-compact-pushforward`, `mathlib:AlgebraicGeometry.Scheme.smallEtaleTopology`, `SmoothRepresentationsOfLocalGroups:SR.0`, `SmoothRepresentationsOfLocalGroups:SR.2`.

Used by: `alternating-igusa-cohomology`, `mantovan-formula`, `compact-minimal-stratum-concentration`, `partial-support-cohomology`, `minimal-stratum-lower-bound`, `igusa-poincare-duality`, `concentrated-cohomology-gives-constituent`, `boundary-comparison-map`.

Sources:

- CSnc §2.8, Proposition 2.8.2, p. 34 (csnc): “Proposition 2.8.2. For any ℓ 6= p, the cohomology group Hi c−∂(Igb ,Fℓ) is nonzero only for i ≤ db = dim Igb . Proof. This is a direct” — The cohomology groups of Igusa varieties with their Hecke action are the objects of the degree bounds.
- CS17 §4.3, after Proposition 4.3.8, p. 718 (cs17): “From Proposition 4.3.8, it follows that the étale cohomology of Ib Mant is also the étale cohomology of Igb , on” — The cohomology of Ig^b is the colimit of the cohomology of Mantovan's finite levels.

### `alternating-igusa-cohomology` — The alternating Igusa cohomology [H_c(Ig^b, ℚ̄_ℓ)] in the Grothendieck group and its S-unramified part (CS17 §5.2)

Declaration `IgusaVarietiesAndTorsionConcentration:IG.1/alternating-igusa-cohomology` (construction). Suggested home: `TauCeti/ShimuraVarieties/Igusa/Cohomology` (`TauCeti.Igusa.AltIgusaCohomology`).

Fix b and X_b. Define [H_c(Ig^b, ℚ̄_ℓ)] := Σ_k (−1)^k lim_{K^p, m} H^k_c(Ig^b_{Mant,K^p,m}, ℚ̄_ℓ) ∈ Groth(G(𝔸_f^p) × J_b(ℚ_p)), a virtual admissible representation: every π ∈ Groth(G(𝔸_f^p) × J_b(ℚ_p)) is a possibly infinite sum Σ n_i π_i of irreducibles such that for each compact open K only finitely many i have n_i ≠ 0 and π_i^K ≠ 0. For a finite set S of places containing p, ∞ and the ramified places and K^S = ∏_{q∉S} K_q hyperspecial, π^{S-ur} := Σ_{i : π_i^{K^S} ≠ 0} n_i π_i. The trace pairing with C^∞_c(G(𝔸_f^p) × J_b(ℚ_p)) determines an element of Groth by its traces; the S-unramified part carries an action of the unramified Hecke algebra 𝕋^S through characters.

Hypotheses:

- ℓ ≠ p; each H^k_c at each finite level is finite-dimensional, so the limits are admissible.

Proof or construction:

1. Admissibility: for a compact open K = K^p × K_p in G(𝔸_f^p) × J_b(ℚ_p), the K-invariants of lim H^k_c are H^k_c of a finite level (finite-dimensional) by Hochschild–Serre for finite groups with ℚ̄_ℓ-coefficients.
2. Grothendieck group of admissible representations with the stated finiteness, trace pairing as in CS17 §5.2; the S-unramified projector.

Uses:

- EndoscopicTransferAndUnitaryTraceComparison:ET.5: the left-hand side of Shin's stable trace formula for Igusa varieties
- IG.5/galois-representations-for-igusa-constituents: the S-unramified constituents n_j π_j ⊗ ψ_j of [H_c(Ig^b, ℚ̄_ℓ)] receive Galois representations
- AutomorphicGaloisRepresentationsPartII:AG2.1b: Shin's route reads Galois representations off the alternating Igusa cohomology

API:

- `AltIgusaCohomology` (constructor): [H_c(Ig^b, ℚ̄_ℓ)] ∈ Groth(G(𝔸_f^p) × J_b(ℚ_p)).
- `AltIgusaCohomology.admissible` (characterisation): For each compact open K only finitely many constituents have K-invariants.
- `AltIgusaCohomology.trace` (projection): tr(φ | [H_c]) = Σ_k (−1)^k tr(φ | H^k_c) for φ ∈ C^∞_c.
- `AltIgusaCohomology.unramifiedPart` (projection): The S-unramified part [H_c]^{S-ur} with its 𝕋^S-action through characters ψ_j.
- `AltIgusaCohomology.ext_trace` (extensionality): Two elements of Groth with equal traces against all φ are equal.

Unit tests:

- `AltIgusaCohomology.basic` (computation): For b basic, [H_c(Ig^b, ℚ̄_ℓ)] = [H^0_c] is a genuine (not virtual) representation.
- `AltIgusaCohomology.zero_test_function` (degenerate): tr(0 | [H_c]) = 0 and the trace is additive in φ.
- `AltIgusaCohomology.cancellation` (non-example): A constituent appearing in H^k_c and H^{k+1}_c with the same multiplicity cancels in [H_c]; the virtual class does not detect it.

Acceptance:

- For b basic the alternating cohomology is H^0_c, an automorphic-type space of functions on the finite set of basic points.
- Shin's stable trace formula (ET.5) computes tr(φ | [H_c(Ig^b, ℚ̄_ℓ)]) for acceptable φ.

Depends on: `igusa-cohomology`, `SmoothRepresentationsOfLocalGroups:SR.0`, `SmoothRepresentationsOfLocalGroups:SR.2`.

Used by: `galois-representations-for-igusa-constituents`.

Sources:

- CS17 §5.2, p. 731 (cs17): “we think of [Hc(Ib Mant,Q̄`)] as a virtual representation in Groth(G(Ap f) × Jb(Qp)). Often, we will fix a finite set S” — Defines the alternating cohomology of the Igusa variety as a virtual representation.

### `harris-taylor-igusa-varieties` — Harris–Taylor Igusa varieties of the first kind and their relation to Mantovan's and the perfect Igusa varieties (Li–Liu, proof of Lemma 7.3)

Declaration `IgusaVarietiesAndTorsionConcentration:IG.1/harris-taylor-igusa-varieties` (construction). Suggested home: `TauCeti/ShimuraVarieties/Igusa/HarrisTaylor` (`TauCeti.Igusa.IgusaFirstKind`).

In the Harris–Taylor type unitary setting of IG.0/drinfeld-level-newton-strata (signature (1, n−1) at one place, u split in F, A[u^{c,∞}] one-dimensional of height n), for 0 ≤ j ≤ n − 1 the Igusa variety of the first kind I_{m,j} → Y°_{0,j} parametrizes Drinfeld level structures of level m on the étale part of A[u^{c,∞}] together with an isomorphism of the formal part with the fixed one-dimensional formal O_{F_u}-module of height j + 1 up to level m (Harris–Taylor [HT01, §IV.1]); the I_{m,j} form a projective system with finite étale transition maps, and Y°_{m,j} is a finite disjoint union of copies of I_{m,j}. Mantovan's I^j_{Mant,m} (IG.1/mantovan-igusa-variety for this datum) are finite Galois covers of I_{m,j}, and the perfection Ig_j of lim_m I^j_{Mant,m} is the perfect Igusa variety of the stratum (IG.1/perfection-of-mantovan).

Hypotheses:

- Harris–Taylor type unitary datum; Drinfeld level at u.

Proof or construction:

1. Construct I_{m,j} as the moduli of Igusa structures of the first kind on the stratum Y°_{0,j} (finite étale by Drinfeld–Katz–Mazur level theory on the étale part and rigidity of the formal part).
2. Identify Y°_{m,j} with a disjoint union of copies of I_{m,j} indexed by the Drinfeld level structures on the formal part (Harris–Taylor).
3. Compare with Mantovan: trivializing the isoclinic pieces gives finite Galois covers I^j_{Mant,m} → I_{m,j}; take the perfection of the limit.

Uses:

- Li–Liu, proof of Lemma 7.3: the cohomology of Y°_{m,j} is computed from the Igusa varieties of the first kind and [CS17, Cor. 6.1.4] on Ig_j
- IG.4/compact-minimal-stratum-concentration: the concentration statement is applied to the perfect Igusa varieties Ig_j of the strata

API:

- `IgusaFirstKind` (constructor): I_{m,j} → Y°_{0,j} for 0 ≤ j ≤ n − 1 and m ≥ 0.
- `IgusaFirstKind.finiteEtale` (instance): The transition maps I_{m+1,j} → I_{m,j} are finite étale.
- `IgusaFirstKind.stratum_decomp` (characterisation): Y°_{m,j} ≅ ⊔ I_{m,j} (a finite disjoint union of copies).
- `IgusaFirstKind.mantovanCover` (compatibility): I^j_{Mant,m} → I_{m,j} is a finite Galois cover, and Ig_j = (lim_m I^j_{Mant,m})_perf.

Unit tests:

- `IgusaFirstKind.n_two_ordinary` (computation): For n = 2 and j = 0, I_{m,0} is the Igusa curve of level m over the ordinary locus.
- `IgusaFirstKind.level_zero` (degenerate): I_{0,j} = Y°_{0,j}.
- `IgusaFirstKind.not_perfect` (non-example): For j < n − 1, I_{m,j} is a smooth k-scheme of positive dimension n − 1 − j, hence not perfect: it is not the perfect Igusa variety Ig_j, which is the perfection of lim_m I^j_{Mant,m}.

Acceptance:

- For n = 2, j = 0: I_{m,0} is the ordinary Igusa curve of level m over the ordinary locus of the Shimura curve.

Depends on: `drinfeld-level-newton-strata`, `mantovan-igusa-variety`, `perfection-of-mantovan`.

Used by: `refined-strata-closures-smooth`.

Sources:

- Proof of Lemma 7.3 and footnote 15, p. 35 (lil21): “15The Galois cover comes from the fact that in the definition of I j Mant,m , there is also a level structure on the formal part of A[uc,∞ ].” — Li–Liu, proof of Lemma 7.3 and footnote 15: Igusa varieties of the first kind, Mantovan's covers and the perfection Ig_j.

### `refined-strata-closures-smooth` — Closures of refined Newton strata are smooth and the open strata are Igusa varieties of the first kind (Mantovan; Li–Liu II)

Declaration `IgusaVarietiesAndTorsionConcentration:IG.1/refined-strata-closures-smooth` (theorem).

For m ≥ 1, 0 ≤ h ≤ n − 1 and M ∈ 𝔖^h_m, the closure Y^[M]_m is smooth (and proper) over k of pure dimension h (Mantovan [Man08, Prop. 12]), and Y^(M)_m is isomorphic as a k-scheme (not over Y^(h)_0) to the Harris–Taylor Igusa variety of the first kind I^h_m.

Hypotheses:

- Harris–Taylor type datum with Drinfeld level m ≥ 1 at u; the comparison of Mantovan's integral model with Li–Liu's X_m is part of the claim.

Proof or construction:

1. Mantovan, "A compactification of Igusa varieties" (Math. Ann. 340 (2008)), Proposition 12: the closures of the refined strata are smooth of the stated dimension.
2. Y^(M)_m ≅ I^h_m: the Drinfeld structure with kernel M is equivalent to a level structure on the étale part plus an Igusa structure of the first kind on the formal part (Harris–Taylor §IV.1).

Acceptance:

- For n = 2 and h = 0, Y^[M]_m is a finite set of points.

Depends on: `refined-drinfeld-strata`, `harris-taylor-igusa-varieties`.

Sources:

- Proof of Proposition 4.25, p. 62; proof of Theorem 4.21, p. 63; introduction p. 7 (lil22): “Finally, by [Man08, Proposition 12], we know that 𝑌𝑚[𝑀 ] is smooth over k of pure dimension h.” — Li–Liu II cite Mantovan [Man08, Proposition 12] for the smoothness of Y^[M]_m.

## IG.2. Partial compactifications and affineness

IG.2 compactifies leaves and Igusa varieties. Well-positioned subsets, in the sense of Lan–Stroh and Boxer, have partial toroidal and minimal compactifications whose boundary charts are those of the ambient compactification restricted to the boundary data. Central leaves are well-positioned and their toroidal compactifications are smooth. Over C^{X,tor} the connected part of 𝒜[p^∞] is a p-divisible group, and the finite-level and perfect Igusa covers extend uniquely to finite étale (resp. pro-finite étale) covers of the toroidal compactification. Their boundary charts are explicit in terms of embeddings G[p^∞] ↪ X and torsors of symmetric lifts. The affineness of C^{X,*} is proved through Ekedahl–Oort strata, whose partial minimal compactifications are affine by their Hasse sections (Boxer), Nie's fundamental Ekedahl–Oort stratum inside each Newton stratum, and a transfer lemma along proper correspondences. As printed, that transfer uses an isogeny invariance of toroidal Igusa varieties (CSnc Corollary 3.2.14) which holds only for isomorphisms; the plan records the gap. The main argument instead takes X_b to be the minimal representative, so that no transfer is needed. The finite-level Ig^{b,*}_m is finite and the limit integral. Igusa cusp labels describe the boundary strata of Ig^{b,tor}_m and Ig^{b,*}_m.

Imports from other roadmaps in this layer: `AdicSpacesPartII:F0/grothendieck-algebraization`, `BunGAndNewtonStrata:BG1`, `BunGAndNewtonStrata:BG1/partial-order-on-B-of-G`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-divisible-cartier-dual`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-divisible-connected-etale`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-divisible-group`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/dieudonne-p-divisible`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/dieudonne-slopes`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/isogeny-classification`, `HodgeTateAndCanonicalSubgroups:T0`, `NeronModelsAndSemistableAbelianVarieties:R11.3/raynaud-extension-comparison`, `ShimuraCompactifications:C0/arithmetic-admissible-fan`, `ShimuraCompactifications:C0/smooth-projective-refinement`, `ShimuraCompactifications:C1/arithmetic-stabilizer`, `ShimuraCompactifications:C1/cusp-label`, `ShimuraCompactifications:C3/hecke-span`, `ShimuraCompactifications:C3/refinement-map`, `ShimuraCompactifications:C4/degeneration-effectivity`, `ShimuraCompactifications:C4/formal-universal-degeneration`, `ShimuraCompactifications:C4/polarized-degeneration-data`, `ShimuraCompactifications:C5/formal-completion`, `ShimuraCompactifications:C5/higher-level-toroidal-normalization`, `ShimuraCompactifications:C5/integral-minimal-space`, `ShimuraCompactifications:C5/integral-toroidal-space`, `ShimuraCompactifications:C5/minimal-hodge-ampleness`, `VectorBundlesAndIsocrystals:VB0/dieudonne-manin-isocrystals`.

### `well-positioned-subscheme` — Well-positioned locally closed subsets of the special fibre (CSnc Definition 3.1.1; Lan–Stroh Definition 2.2.1) ★

Declaration `IgusaVarietiesAndTorsionConcentration:IG.2/well-positioned-subscheme` (definition). Planet: Well-positioned subscheme. Suggested home: `TauCeti/ShimuraVarieties/Igusa/WellPositioned` (`TauCeti.Igusa`).

A locally closed subset Y ⊆ S_k is well-positioned if there is a family Y^♮ = {Y^♮_Z} indexed by the cusp labels Z at level K such that (1) each Y^♮_Z is a locally closed subset of the boundary Shimura variety S_{Z,k}, and (2) for every complete algebraically closed nonarchimedean C over k and every x = (A, ι, λ, η) ∈ S_k(C) degenerating into the cusp Z, with Raynaud extension 0 → T → G → B → 0 over O_C, x lies in Y if and only if the point π(x) = (B, …) ∈ S_{Z,k}(C) lies in Y^♮_Z. Equivalently (Lan–Stroh), for every affine open Spf R of the formal chart 𝔛°_σ of the toroidal boundary, Y ×_S W⁰ = Y^♮_Z ×_{S_Z} W⁰ with W⁰ ⊂ Spec R the preimage of the interior. The notion is independent of Σ, agrees with Boxer's [Box15, Def. 3.4.1] when good integral models exist, and is preserved by the prime-to-p Hecke correspondences that extend to the compactifications.

Hypotheses:

- Standing hypotheses of CSnc §§3–4: p unramified in F, N ≥ 3 prime to p, K = K(N), and Σ a compatible family of smooth projective cone decompositions with trivial stabilizers (CSnc Remark 2.5.6); S = S_K and S_k = S ×_ℤ k for k algebraically closed of characteristic p.

Proof or construction:

1. Define Y^♮ through the Raynaud extension at points of degeneration (ShimuraCompactifications C4).
2. Prove the equivalence with Lan–Stroh's chart-wise definition on the formal charts 𝔛°_σ (formal completion along Ξ(σ)⁺ := ⋃_{τ ⊂ σ} Ξ_τ, with Ŝ^tor ≃ 𝔛°_σ, [LS18a, Prop. 2.1.3]): both stratifications of W = Spec R agree, and the identification can be checked on points (CSnc Remark 3.1.2).
3. Independence of Σ: compare along the refinement maps of ShimuraCompactifications C3 ([LS18a, Lemma 2.2.2]).
4. Hecke stability: a Hecke correspondence [g] extends to the toroidal compactifications for compatible cone decompositions and is compatible with Raynaud extensions, so Y^♮ is transported to the boundary data of [g]Y.

Uses:

- IG.2/partial-compactifications: well-positioned subsets have partial toroidal and minimal compactifications with explicit boundary
- IG.2/leaves-are-well-positioned: central leaves are the well-positioned subsets of interest
- Boxer, Theorem C: Ekedahl–Oort strata are well-positioned and their partial minimal compactifications are affine

API:

- `IsWellPositioned` (data): The predicate on locally closed subsets of S_k, with the boundary data Y^♮_Z.
- `IsWellPositioned.boundaryData` (projection): Y^♮_Z ⊂ S_{Z,k}, uniquely determined by Y.
- `isWellPositioned_iff_chart` (characterisation): Equivalent to Lan–Stroh's condition Y ×_S W⁰ = Y^♮_Z ×_{S_Z} W⁰ on all charts.
- `IsWellPositioned.indep_cone` (other): The notion does not depend on the choice of Σ.
- `IsWellPositioned.hecke` (functoriality): Images under prime-to-p Hecke correspondences of well-positioned subsets are well-positioned.
- `IsWellPositioned.closure` (relation): If Y is well-positioned, so are its closure in S_k and the complement Y₀ of Y in its closure.

Unit tests:

- `IsWellPositioned.univ` (degenerate): S_k itself is well-positioned, with Y^♮_Z = S_{Z,k} for every cusp label Z.
- `IsWellPositioned.empty` (degenerate): The empty set is well-positioned with all Y^♮_Z empty.
- `IsWellPositioned.ordinary` (computation): The ordinary locus of S_k is well-positioned, with Y^♮_Z the ordinary locus of S_{Z,k}.
- `IsWellPositioned.not_point` (non-example): For n = 1 and [F⁺:ℚ] = 2 (d = 2, boundary Shimura varieties S_Z are points), a closed curve Y ⊂ S_k whose closure in S^*_k meets a cusp Z is not well-positioned: Y^♮_Z ⊂ S_{Z,k} = point would force Y to contain all points degenerating into Z or none.

Acceptance:

- The whole special fibre S_k is well-positioned with Y^♮_Z = S_{Z,k}.
- Central leaves are well-positioned (IG.2/leaves-are-well-positioned).
- An arbitrary closed subset of the open Shimura variety need not be well-positioned (its boundary behaviour need not be detected on the abelian part B).

Depends on: `integral-model`, `ShimuraCompactifications:C1/cusp-label`, `ShimuraCompactifications:C1/arithmetic-stabilizer`, `ShimuraCompactifications:C4/polarized-degeneration-data`, `ShimuraCompactifications:C4/degeneration-effectivity`, `ShimuraCompactifications:C4/formal-universal-degeneration`, `NeronModelsAndSemistableAbelianVarieties:R11.3/raynaud-extension-comparison`, `ShimuraCompactifications:C5/integral-toroidal-space`, `ShimuraCompactifications:C5/formal-completion`, `ShimuraCompactifications:C5/higher-level-toroidal-normalization`, `ShimuraCompactifications:C0/arithmetic-admissible-fan`, `ShimuraCompactifications:C0/smooth-projective-refinement`, `ShimuraCompactifications:C3/refinement-map`, `ShimuraCompactifications:C3/hecke-span`.

Used by: `partial-compactifications`, `lan-stroh-boundary-charts`, `partial-minimal-closed`, `leaves-are-well-positioned`, `ekedahl-oort-stratification`.

Sources:

- CSnc §3.1, Definition 3.1.1, p. 37 (csnc): “A locally closed subset Y ⊆ Sk = S ×k is well-positioned if there exists a family Y ♮ = {Y ♮ Z} indexed by the cusp labels Z at level K such that (1) Y ♮ Z is a locally closed subset of SZ,k. (2) For any C over k and x =” — Defines well-positioned subsets through the abelian part of the Raynaud extension.
- CSnc §3.1, Remark 3.1.2, p. 38 (csnc): “In particular, the deﬁnition is independent of the choice of Σ, cf. also [LS18a, Lemma 2.2.2]. Remark 2.3.8 of [LS18a] shows that this notion is consistent (in our particular case, when there exist good integral models) with” — Independence of Σ and agreement with Boxer's definition.

### `partial-compactifications` — Partial toroidal and minimal compactifications of a well-positioned subset (CSnc §3.1; Lan–Stroh Theorem 2.3.2) ★

Declaration `IgusaVarietiesAndTorsionConcentration:IG.2/partial-compactifications` (construction). Planet: Partial compactifications of well-positioned subsets. Suggested home: `TauCeti/ShimuraVarieties/Igusa/WellPositioned` (`TauCeti.Igusa`).

Let Y ⊂ S_k be well-positioned, Ỹ its closure in S_k and Y₀ = Ỹ ∖ Y. Let Ỹ^* and Y^*₀ (resp. Ỹ^tor, Y^tor₀) be the closures of Y and Y₀ in the minimal compactification S^*_k (resp. in the toroidal compactification S^tor_{K,Σ,k}). The partial minimal and partial toroidal compactifications are Y^* := Ỹ^* ∖ Y^*₀ and Y^tor := Ỹ^tor ∖ Y^tor₀, locally closed in S^*_k and S^tor_k with their reduced structures. They satisfy Y^* ×_{S^*_k} S_{Z,k} = Y^♮_Z for every cusp label Z, Y^tor is the preimage of Y^* under π : S^tor → S^*, the map Y^tor → Y^* is proper and surjective with π_*O = O after normalization, and Y^tor (resp. Y^*) is stratified by the (Z, [σ]) (resp. Z) as S^tor (resp. S^*) is.

Hypotheses:

- Standing hypotheses of CSnc §§3–4: p unramified in F, N ≥ 3 prime to p, K = K(N), and Σ a compatible family of smooth projective cone decompositions with trivial stabilizers (CSnc Remark 2.5.6); S = S_K and S_k = S ×_ℤ k for k algebraically closed of characteristic p.
- Y well-positioned.

Proof or construction:

1. Form the closures and complements as stated.
2. Lan–Stroh [LS18a, Thm 2.3.2] (cited in CSnc as "Theorem 2.3.3", the number of a display inside it; sourceIssues IgusaVarietiesAndTorsionConcentration/E5): Y^tor = π^{−1}(Y^*), properness and surjectivity of Y^tor → Y^*, and the identification of the boundary strata with Y^♮_Z, using the toroidal charts and the well-positioned condition.
3. Compatibility with refinements of Σ (ShimuraCompactifications C3) and with Hecke correspondences.

Uses:

- IG.2/leaf-minimal-compactification-affine: C^{X,*} is the partial minimal compactification of the leaf
- IG.2/perfect-toroidal-igusa-variety: Ig^{X,tor} lives over C^{X,tor}
- IG.3/compactified-fibre-theorem: the fibres of π^*_HT and π^tor_HT are compared with the partially compactified Igusa varieties

API:

- `partialMinimal` (constructor): Y^* ⊂ S^*_k for Y well-positioned.
- `partialToroidal` (constructor): Y^tor ⊂ S^tor_{K,Σ,k} for Y well-positioned.
- `partialToroidal_eq_preimage` (characterisation): Y^tor = π^{−1}(Y^*) for π : S^tor → S^*.
- `partialMinimal_inter_boundary` (simp): Y^* ×_{S^*_k} S_{Z,k} = Y^♮_Z.
- `partialToroidal_to_partialMinimal_proper` (instance): Y^tor → Y^* is proper and surjective.
- `partialCompactification_hecke` (functoriality): Compatible with prime-to-p Hecke correspondences and with refinements of Σ.

Unit tests:

- `partialMinimal_univ` (degenerate): (S_k)^* = S^*_k and (S_k)^tor = S^tor_k.
- `partialMinimal_ordinary` (computation): For Y the ordinary locus, Y^* is the non-vanishing locus of the Hasse invariant on S^*_k.
- `partialMinimal_ne_closure` (non-example): Y^* is not the closure of Y in S^*_k: the closure of Y₀ is removed.
- `partialMinimal_compat_open` (compatibility): Y^* ∩ S_k = Y.

Acceptance:

- For Y = S_k the construction returns S^*_k and S^tor_k.
- For Y the ordinary locus, Y^* is the ordinary locus of S^*_k (the complement of the vanishing locus of the Hasse invariant).

Depends on: `well-positioned-subscheme`, `ShimuraCompactifications:C5/integral-toroidal-space`, `ShimuraCompactifications:C5/formal-completion`, `ShimuraCompactifications:C5/higher-level-toroidal-normalization`, `ShimuraCompactifications:C5/integral-minimal-space`, `ShimuraCompactifications:C5/minimal-hodge-ampleness`, `ShimuraCompactifications:C3/refinement-map`, `ShimuraCompactifications:C3/hecke-span`.

Used by: `lan-stroh-boundary-charts`, `partial-minimal-closed`, `eo-strata-minimal-affine`, `leaf-minimal-compactification-affine`.

Sources:

- CSnc §3.1, p. 38 (csnc): “A well-positioned subset admits partial toroidal and minimal compactiﬁcations that satisfy many nice properties. Let Y ⊂ Sk be a well-positioned subset. Let e Y be the closure of Y in Sk, with” — Defines the partial compactifications Y^* = Ỹ^* ∖ Y^*₀ and Y^tor.
- Theorem 2.3.2 (with display (2.3.3)), pp. 21–23; Definition 2.3.1 (ls18a): “(Cf. [45, Proposition 2.2] or Proposition 2.1.2). For each well- positioned subset (respectively subscheme) Y of (XH )T with a collection Y\ = {Y\Z }Z as in Definition 2.2.1, its partial minimal and toroidal compactifications” — Lan–Stroh Theorem 2.3.2: properties of the partial compactifications.
- CSnc §3.1, p. 38 (csnc): “See [LS18a, Theorem 2.3.3] for the ﬁrst basic properties of these partial compactiﬁcations. We have an identiﬁcation Y ∗ ×S∗ k SZ,k = Y ♮ Z as subsets of SZ,k. We need the following basic” — Basic properties from Lan–Stroh and the identification of boundary strata with Y^♮_Z.

### `lan-stroh-boundary-charts` — Boundary charts of partial toroidal compactifications (Lan–Stroh Theorem 2.3.2)

Declaration `IgusaVarietiesAndTorsionConcentration:IG.2/lan-stroh-boundary-charts` (theorem).

Let Y ⊂ S_k be well-positioned and Z a cusp label. The formal completion of Y^tor along its Z-stratum is canonically isomorphic to the Γ_Z-quotient of the formal completion of Ξ_{Z,Σ_Z} ×_{S_Z} Y^♮_Z along its toroidal boundary ∂_{Z,Σ_Z} ×_{S_Z} Y^♮_Z, compatibly with the corresponding description of Ŝ^tor_Z in ShimuraCompactifications C5. If Y is smooth (resp. regular), so is Y^tor.

Hypotheses:

- Standing hypotheses of CSnc §§3–4: p unramified in F, N ≥ 3 prime to p, K = K(N), and Σ a compatible family of smooth projective cone decompositions with trivial stabilizers (CSnc Remark 2.5.6); S = S_K and S_k = S ×_ℤ k for k algebraically closed of characteristic p.
- Y well-positioned; Σ smooth with trivial stabilizers.

Proof or construction:

1. Restrict the isomorphism Ŝ^tor_Z ≅ 𝔛_{Z,Σ_Z}/Γ_Z of ShimuraCompactifications C5 to the closed formal subscheme cut out by Y; the well-positioned condition identifies it with the completion of Ξ_{Z,Σ_Z} ×_{S_Z} Y^♮_Z ([LS18a, Thm 2.3.2(5)]).
2. Smoothness/regularity: the chart is a torus embedding over Y^♮_Z (smooth cones), so Y^tor is regular when Y^♮_Z and Y are ([LS18a, Prop. 2.3.13]).

Acceptance:

- For Y = S_k it is the boundary chart description of S^tor.
- Used for C^{X,tor} in CSnc Theorem 3.2.6 ("cf. [LS18a, Theorem 2.3.2 (5)]").

Depends on: `partial-compactifications`, `well-positioned-subscheme`, `ShimuraCompactifications:C5/integral-toroidal-space`, `ShimuraCompactifications:C5/formal-completion`, `ShimuraCompactifications:C5/higher-level-toroidal-normalization`, `ShimuraCompactifications:C4/polarized-degeneration-data`, `ShimuraCompactifications:C4/degeneration-effectivity`, `ShimuraCompactifications:C4/formal-universal-degeneration`, `NeronModelsAndSemistableAbelianVarieties:R11.3/raynaud-extension-comparison`.

Used by: `leaves-are-well-positioned`, `toroidal-igusa-finite-level`, `igusa-boundary-charts`, `toroidal-igusa-boundary-strata`.

Sources:

- CSnc §3.2, p. 41 (citing [LS18a, Thm 2.3.2(5)]) (csnc): “Because CX is well-positioned, we can identify b CX,tor Z with the quotient by ΓZ of the formal completion of CX Z,ΣZ := ΞZ,ΣZ ×SZ CX Z along ∂Z,ΣZ ×SZ CX Z , cf. [LS18a, Theorem 2.3.2 (5)]. We would like to give a similar” — Identifies the completion of the partial toroidal compactification of a leaf with the Γ_Z-quotient of the boundary chart.

### `partial-minimal-closed` — Closed subsets give closed partial minimal compactifications (CSnc Proposition 3.1.3)

Declaration `IgusaVarietiesAndTorsionConcentration:IG.2/partial-minimal-closed` (theorem).

Let Y ⊂ Y′ ⊂ S_k be well-positioned locally closed subsets with Y closed in Y′. Then Y^* is a closed subset of Y′^*, and Y^♮_Z is closed in Y′^♮_Z for every cusp label Z.

Hypotheses:

- Standing hypotheses of CSnc §§3–4: p unramified in F, N ≥ 3 prime to p, K = K(N), and Σ a compatible family of smooth projective cone decompositions with trivial stabilizers (CSnc Remark 2.5.6); S = S_K and S_k = S ×_ℤ k for k algebraically closed of characteristic p.

Proof or construction:

1. The maps W⁰ → S_Z from the formal charts form an fpqc cover, so Y^♮_Z is closed in Y′^♮_Z; with Y^* ×_{S^*} S_Z = Y^♮_Z this gives Y^* ⊂ Y′^*.
2. Ỹ^* is closed in the closure of Y′ in S^*, and Y^* = Ỹ^* ∖ Y^*₀ is a closed subset of the latter minus Y^*₀; as Y′^* ⊂ (closure of Y′)^* ∖ Y^*₀ (because Y₀ ⊂ Y′₀), the claim follows.

Acceptance:

- A central leaf C^X, closed in an Ekedahl–Oort stratum, has C^{X,*} closed in that stratum's partial minimal compactification.

Depends on: `partial-compactifications`, `well-positioned-subscheme`.

Used by: `leaf-minimal-compactification-affine`.

Sources:

- CSnc §3.1, Proposition 3.1.3, p. 38 (csnc): “Proposition 3.1.3. Let Y ⊂ Y ′ ⊂ Sk be well-positioned locally closed subsets such that Y is closed in Y ′ . Then Y ∗ is a closed subset of Y ′∗ . Proof. The” — States that closed well-positioned subsets have closed partial minimal compactifications.

### `leaves-are-well-positioned` — Central leaves are well-positioned; their partial toroidal compactifications are smooth (CSnc Proposition 3.1.4, Lemma 3.1.5)

Declaration `IgusaVarietiesAndTorsionConcentration:IG.2/leaves-are-well-positioned` (theorem).

For every p-divisible group X with G-structure over k, the central leaf C^X ⊂ S_k is well-positioned. For a cusp label Z = (Z_N, X) (X of O_F-rank r), (C^X)^♮_Z is the central leaf C^{X_Z}_Z of S_{Z,k} for the unique p-divisible group X_Z with G-structure (for the group with n replaced by n − r) such that X ≅ Hom(X, μ_{p^∞}) ⊕ X_Z ⊕ X ⊗ ℚ_p/ℤ_p, or empty if no such X_Z exists. Writing C^X_Z := C^{X,*} ×_{S^*} S_Z, this identifies C^X_Z = C^{X_Z}_Z. The partial toroidal compactification C^{X,tor} is a smooth variety over k.

Hypotheses:

- Standing hypotheses of CSnc §§3–4: p unramified in F, N ≥ 3 prime to p, K = K(N), and Σ a compatible family of smooth projective cone decompositions with trivial stabilizers (CSnc Remark 2.5.6); S = S_K and S_k = S ×_ℤ k for k algebraically closed of characteristic p.

Proof or construction:

1. For x ∈ S_k(C) degenerating into Z with Raynaud extension 0 → T → G → B → 0 and X the cocharacter group of T, the exact sequences 0 → G_C[p^m] → A_C[p^m] → (X/p^m)_C → 0 and 0 → T_C[p^m] → G_C[p^m] → B_C[p^m] → 0 give an O_F-linear symplectic filtration of A_C[p^∞] with graded pieces Hom(X, μ_{p^∞}), B_C[p^∞], X ⊗ ℚ_p/ℤ_p.
2. By IG.0/splitting-symplectic-filtrations, X_C ≅ Hom(X, μ_{p^∞}) ⊕ B_C[p^∞] ⊕ X ⊗ ℚ_p/ℤ_p, and B_C[p^∞] ≅ (X_Z)_C is unique up to isomorphism; so x ∈ C^X iff π(x) ∈ C^{X_Z}_Z ([LS18a, Prop. 3.4.2]).
3. Smoothness: over the perfect field k it suffices that C^{X,tor} is regular, which follows from smoothness of C^X and IG.2/lan-stroh-boundary-charts ([LS18a, Prop. 2.3.13]).

Acceptance:

- If X has no étale part (X^{ét} = 0), then (C^X)^♮_Z = ∅ for every Z ≠ the open cusp and C^{X,tor} = C^{X,*} = C^X.
- For X ordinary, (C^X)^♮_Z is the ordinary locus of S_{Z,k}.

Depends on: `well-positioned-subscheme`, `central-leaf`, `splitting-symplectic-filtrations`, `lan-stroh-boundary-charts`, `ShimuraCompactifications:C4/polarized-degeneration-data`, `ShimuraCompactifications:C4/degeneration-effectivity`, `ShimuraCompactifications:C4/formal-universal-degeneration`, `NeronModelsAndSemistableAbelianVarieties:R11.3/raynaud-extension-comparison`.

Used by: `connected-part-at-boundary`.

Sources:

- CSnc §3.1, Proposition 3.1.4, p. 38 (csnc): “Proposition 3.1.4. For any p-divisible group X with extra structure over k, the associated Oort central leaf CX ⊂ Sk is well-positioned. For a cusp label Z = (ZN′,X), the subset (CX )♮ Z is either the central leaf CXZ Z on SZ,k” — Central leaves are well-positioned with boundary data the leaves of the smaller Shimura varieties.
- CSnc §3.1, Lemma 3.1.5, p. 39 (csnc): “Lemma 3.1.5. The partial toroidal compactification CX,tor is a smooth variety. Proof. Since we are working” — Smoothness of C^{X,tor}.

### `connected-part-at-boundary` — The connected part of A[p^∞] over C^{X,tor} is a p-divisible group, and the biconnected part carries a polarization (CSnc Propositions 3.2.1–3.2.2)

Declaration `IgusaVarietiesAndTorsionConcentration:IG.2/connected-part-at-boundary` (theorem).

Let 𝒜 be the semi-abelian scheme over C^{X,tor} (restriction of the universal one over S^tor). The groups 𝒜[p^m] are quasi-finite flat but not finite, so 𝒜[p^∞] is not a p-divisible group; but its connected part 𝒜[p^∞]° (the ind-scheme 𝒜̂[p^∞] of the formal completion along the identity) is a p-divisible group over C^{X,tor} with O_F-action, geometrically isomorphic at every point to X° = Hom(X, μ_{p^∞}) ⊕ X°_Z. Its multiplicative part 𝒜[p^∞]^μ has constant rank, and the biconnected part 𝒜[p^∞]^{(0,1)} = 𝒜[p^∞]°/𝒜[p^∞]^μ carries a principal polarization extending the one over C^X.

Hypotheses:

- Standing hypotheses of CSnc §§3–4: p unramified in F, N ≥ 3 prime to p, K = K(N), and Σ a compatible family of smooth projective cone decompositions with trivial stabilizers (CSnc Remark 2.5.6); S = S_K and S_k = S ×_ℤ k for k algebraically closed of characteristic p.

Proof or construction:

1. On the completed strict local ring R of C^{X,tor} at a point of the Z-stratum, the Raynaud extension 0 → T → G → B → 0 maps to 𝒜 over Spf R and gives Ĝ ≅ 𝒜̂, defined over Spec R by formal GAGA (both finite over Spf R modulo powers of the augmentation ideal).
2. G[p^∞] is a p-divisible group whose connected part has constant rank because B maps to the leaf C^{X_Z}_Z; hence 𝒜[p^∞]° ≅ G[p^∞]° is a p-divisible group.
3. The biconnected part is identified with that of B[p^∞], which is principally polarized compatibly with the generic fibre.

Acceptance:

- For the modular curve (n = 1, F imaginary quadratic) at a cusp, 𝒜[p^∞]° is the multiplicative μ_{p^∞} ⊗ O_F of the Tate curve and the biconnected part is 0.

Depends on: `leaves-are-well-positioned`, `ShimuraCompactifications:C4/polarized-degeneration-data`, `ShimuraCompactifications:C4/degeneration-effectivity`, `ShimuraCompactifications:C4/formal-universal-degeneration`, `NeronModelsAndSemistableAbelianVarieties:R11.3/raynaud-extension-comparison`, `AdicSpacesPartII:F0/grothendieck-algebraization`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-divisible-group`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-divisible-cartier-dual`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-divisible-connected-etale`.

Used by: `toroidal-igusa-finite-level`, `perfect-toroidal-igusa-variety`.

Sources:

- CSnc §3.2, Proposition 3.2.1, p. 39 (csnc): “Proposition 3.2.1. The connected part A[p∞ ]◦ of A[p∞ ] is a p-divisible group over CX,tor . Proof. We can check this on the” — The connected part of A[p^∞] over C^{X,tor} is a p-divisible group.
- CSnc §3.2, Proposition 3.2.2, p. 40 (csnc): “Proposition 3.2.2. There exists a polarization on A[p∞ ](0,1) extending the polarization that exists after restriction to CX .” — Polarization on the biconnected part.

### `toroidal-igusa-finite-level` — Finite-level partial toroidal compactifications of Igusa varieties Ig^{X,tor}_m (CSnc Theorem 3.2.4, Definition 3.2.5, Theorem 3.2.6)

Declaration `IgusaVarietiesAndTorsionConcentration:IG.2/toroidal-igusa-finite-level` (construction). Suggested home: `TauCeti/ShimuraVarieties/Igusa/Toroidal` (`TauCeti.Igusa.ToroidalIgusa`).

Let X = ⊕ X_i be completely slope divisible with G-structure. (1) The finite étale Γ_{m,X}-cover Ig^X_{Mant,m} → C^X extends uniquely to a finite étale cover Ig^{X,tor}_m → C^{X,tor}, Galois with group Γ_{m,X}. It represents Igusa level-p^m structures on C^{X,tor}-schemes T: for each i with λ_i > 0, an isomorphism ρ_{i,m} : 𝒜[p^∞]_i[p^m] ×T ≅ X_i[p^m] × T commuting with O_F and lifting fppf locally to all p^{m′}, together with a scalar in (ℤ/p^m)^×(T) such that ρ_{i,m}, ρ_{j,m} commute with the polarizations up to that scalar whenever λ_i + λ_j = 1. (2) With the splitting of Z_N of ShimuraCompactifications C5 fixed, for each cusp label Z the formal completion of Ig^{X,tor}_m along its Z-stratum is canonically isomorphic to 𝔜_{Z,Σ_Z}/Γ_Z, where 𝔜_{Z,Σ_Z} is the completion along the boundary of the Γ_{m,X}-torsor Ig^X_{Z,Σ_Z} → Ξ_{Z,Σ_Z} ×_{S_Z} C^X_Z defined by Igusa level structures on the completely slope divisible connected part H_Z of the Raynaud extension G_Z over C_Z ×_{S_Z} C^X_Z.

Hypotheses:

- Standing hypotheses of CSnc §§3–4: p unramified in F, N ≥ 3 prime to p, K = K(N), and Σ a compatible family of smooth projective cone decompositions with trivial stabilizers (CSnc Remark 2.5.6); S = S_K and S_k = S ×_ℤ k for k algebraically closed of characteristic p.
- X completely slope divisible with G-structure.

Proof or construction:

1. 𝒜[p^∞]° is completely slope divisible (IG.2/connected-part-at-boundary), giving pieces 𝒜[p^∞]_i of slopes λ_i > 0 with extra structure.
2. Apply IG.0/liftable-automorphisms (2) to 𝒜[p^∞]_i for λ_i > 1/2 as EL-type groups and to the slope-1/2 piece as a PEL-type group over the smooth (hence seminormal) C^{X,tor}; the isomorphisms for 0 < λ_i < 1/2 are determined by duality. Take the fibre product of the finite étale covers.
3. Over C^X this recovers Ig^X_{Mant,m}, since the polarization determines the structure on the étale quotient from the multiplicative one.
4. Boundary charts: compare the pullbacks of 𝒜[p^∞]° and H_Z to the completion along the Z-stratum through Ĝ ≅ 𝒜̂ on affine pieces Spf R, using IG.2/lan-stroh-boundary-charts.

Uses:

- IG.2/toroidal-igusa-boundary-strata: the boundary of Ig^{b,tor}_m decomposes over Igusa cusp labels
- IG.2/minimal-igusa-compactification: Ig^{b,*}_m is computed from Ig^{b,tor}_m by Stein factorization
- IG.4/ell-power-boundary-killing: the toroidal Igusa varieties at ℓ-power tame level have normal-crossings boundary

API:

- `ToroidalIgusa` (constructor): Ig^{X,tor}_m → C^{X,tor}, finite étale Galois with group Γ_{m,X}.
- `ToroidalIgusa.represents` (characterisation): Represents Igusa level-p^m structures on the slope pieces of 𝒜[p^∞]° with a common similitude scalar.
- `ToroidalIgusa.restrict_open` (compatibility): Its restriction to C^X is Ig^X_{Mant,m}.
- `ToroidalIgusa.unique` (extensionality): Any finite étale extension of Ig^X_{Mant,m} over C^{X,tor} is isomorphic to it.
- `ToroidalIgusa.boundaryChart` (other): Completion along the Z-stratum ≅ 𝔜_{Z,Σ_Z}/Γ_Z.
- `ToroidalIgusa.transition` (projection): Finite étale transition maps Ig^{X,tor}_{m+1} → Ig^{X,tor}_m.

Unit tests:

- `ToroidalIgusa.level_zero` (degenerate): Ig^{X,tor}_0 = C^{X,tor}.
- `ToroidalIgusa.no_etale_part` (degenerate): If X^{ét} = 0 then Ig^{X,tor}_m = Ig^X_{Mant,m}.
- `ToroidalIgusa.ordinary_modular_curve` (computation): For n = 1, F imaginary quadratic and b ordinary, Ig^{b,tor}_1 is the Igusa curve of level p with its cusps, finite étale over the ordinary locus with its cusps.
- `ToroidalIgusa.not_whole_torsion` (non-example): Trivializing all of 𝒜[p^m] (which is only quasi-finite at the boundary) does not give a finite étale cover of C^{X,tor}.

Acceptance:

- For b ordinary, Ig^{b,tor}_m → C^{b,tor} is the classical extension of the ordinary Igusa cover of level p^m over the cusps (trivializing the multiplicative part of the Raynaud extension's connected part).
- Uniqueness: the extension is unique because C^{X,tor} is normal and the cover is given on a dense open.

Depends on: `mantovan-igusa-variety`, `connected-part-at-boundary`, `liftable-automorphisms`, `lan-stroh-boundary-charts`, `completely-slope-divisible`.

Used by: `perfect-toroidal-igusa-variety`, `toroidal-igusa-boundary-strata`, `ell-power-boundary-killing`.

Sources:

- CSnc §3.2.3, Theorem 3.2.4, p. 40 (csnc): “Theorem 3.2.4. The finite étale cover IgX m → CX extends uniquely to a finite étale cover IgX,tor m → CX,tor , Galois with group Γm,X. In fact, we can be more precise,” — Finite étale extension of the finite-level Igusa cover over the partial toroidal compactification.
- CSnc §3.2.3, Theorem 3.2.6, p. 41 (csnc): “Theorem 3.2.6. With the same choice of a splitting of the filtration ZN as in Theorem 2.5.9 (3), there is a canonical isomorphism of formal schemes b Ig X,tor m,Z ∼ →” — Boundary charts of the finite-level toroidal Igusa varieties.

### `perfect-toroidal-igusa-variety` — The perfect toroidal Igusa variety Ig^{X,tor} (CSnc Theorem 3.2.8, Definition 3.2.9, Remark 3.2.10) ★

Declaration `IgusaVarietiesAndTorsionConcentration:IG.2/perfect-toroidal-igusa-variety` (construction). Planet: Toroidal Igusa variety. Suggested home: `TauCeti/ShimuraVarieties/Igusa/Toroidal` (`TauCeti.Igusa.PerfectToroidalIgusa`).

For any p-divisible group X with G-structure over k (not necessarily completely slope divisible), the pro-finite étale Γ_X-cover Ig^X → C^X_perf extends uniquely to a pro-finite étale cover Ig^{X,tor} → C^{X,tor}_perf, Galois with group Γ_X. It represents perfect Igusa level structures on perfect C^{X,tor}-schemes T: an O_F-linear isomorphism ρ : 𝒜[p^∞]° ×T ≅ X° × T together with a scalar in ℤ_p^×(T) such that the induced isomorphism of biconnected parts ρ^{(0,1)} commutes with the polarizations up to that scalar. If X is completely slope divisible, Ig^{X,tor} is the perfection of lim_m Ig^{X,tor}_m. Ig^X is an fpqc Aut(X)-torsor over C^X before perfection, but this fails over the toroidal boundary strata.

Hypotheses:

- Standing hypotheses of CSnc §§3–4: p unramified in F, N ≥ 3 prime to p, K = K(N), and Σ a compatible family of smooth projective cone decompositions with trivial stabilizers (CSnc Remark 2.5.6); S = S_K and S_k = S ×_ℤ k for k algebraically closed of characteristic p.

Proof or construction:

1. Uniqueness: the base C^{X,tor}_perf is normal and the cover is given on a dense open.
2. Existence: as for IG.2/toroidal-igusa-finite-level, using IG.0/isomorphism-torsors (1) (the Γ-torsor over perfect bases) for 𝒜[p^∞]° with its extra structure.
3. The failure of the Aut(X)-torsor property at the boundary already occurs for modular curves (Howe, §3).

Uses:

- IG.3/compactified-igusa-to-shimura: W(Ig^{X,tor}) ⊗ O_C maps to the toroidal compactification at infinite level
- IG.3/toroidal-fibre-theorem: Ig^{X,tor}_C is identified with an open subspace of the fibre of π^tor_HT
- IG.2/perfect-minimal-igusa: Ig^{X,*} = Spec H^0(Ig^{X,tor}, O)

API:

- `PerfectToroidalIgusa` (constructor): Ig^{X,tor} → C^{X,tor}_perf, pro-finite étale Γ_X-Galois.
- `PerfectToroidalIgusa.represents` (characterisation): Represents perfect Igusa level structures ρ : 𝒜[p^∞]° ≅ X° with a ℤ_p^×-scalar on the biconnected part.
- `PerfectToroidalIgusa.restrict_open` (compatibility): Restricts to Ig^X over C^X_perf.
- `PerfectToroidalIgusa.eq_perf_lim` (equivalence): For completely slope divisible X, ≅ (lim_m Ig^{X,tor}_m)_perf.
- `PerfectToroidalIgusa.action` (functoriality): J_b(ℚ_p)-quasi-isogenies inducing isomorphisms on étale and multiplicative parts, and prime-to-p Hecke operators compatible with Σ, act on the tower.

Unit tests:

- `PerfectToroidalIgusa.no_etale` (degenerate): If X^{ét} = 0 then Ig^{X,tor} = Ig^X.
- `PerfectToroidalIgusa.modular_curve` (computation): For the modular-curve case and X ordinary, the fibre of Ig^{X,tor} over a cusp is a Γ_X-torsor of trivializations of μ_{p^∞} only (the étale part of the Tate curve is not trivialized).
- `PerfectToroidalIgusa.not_aut_torsor` (non-example): Ig^{X,tor} → C^{X,tor} is not an Aut(X)-torsor at the boundary (Howe).

Acceptance:

- For X completely slope divisible, Ig^{X,tor} ≅ (lim_m Ig^{X,tor}_m)_perf.
- For X with X^{ét} = 0, Ig^{X,tor} = Ig^X.

Depends on: `perfect-igusa-variety`, `connected-part-at-boundary`, `isomorphism-torsors`, `toroidal-igusa-finite-level`, `mathlib:PerfectRing`.

Used by: `igusa-boundary-charts`, `toroidal-isogeny-invariance`, `perfect-minimal-igusa`, `compactified-igusa-to-shimura`.

Sources:

- CSnc §3.2.7, Theorem 3.2.8, p. 42 (csnc): “Theorem 3.2.8. The pro-finite étale cover IgX → CX perf extends uniquely to a profinite étale cover IgX,tor → CX,tor perf , Galois with group ΓX. We remark that if X is” — Unique extension of the perfect Igusa variety over the perfected partial toroidal compactification.
- CSnc §3.2.7, Remark 3.2.10, p. 42 (csnc): “Remark 3.2.10. By Corollary 2.3.2, IgX is an fpqc Aut(X)-torsor over CX (before perfection). However, this no longer holds true over the boundary strata of the partial toroidal compactiﬁcation. This” — The torsor property under the non-reduced Aut(X) fails at the boundary.

### `igusa-boundary-charts` — Boundary charts of the perfect toroidal Igusa variety (CSnc Propositions 3.2.11–3.2.12, Theorem 3.2.13)

Declaration `IgusaVarietiesAndTorsionConcentration:IG.2/igusa-boundary-charts` (theorem).

(1) The Γ_X-torsor C^{Ig,X}_Z → (C_Z ×_{S_Z} C^X_Z)_perf parametrizing O_F-linear isomorphisms H_Z ≅ X° with a ℤ_p^×-scalar compatible on biconnected parts is the perfect scheme parametrizing (B, ι, λ, η) ∈ S_Z, an extension 0 → T → G → B → 0 by the split torus with cocharacter group X, and an O_F-linear embedding ρ : G[p^∞] ↪ X such that T[p^∞] ⊂ G[p^∞] ⊂ X is symplectic and B[p^∞] = G[p^∞]/T[p^∞] ≅ Gr_{−1} compatibly with principal polarizations. (2) The 𝐒_{Z,perf}-torsor Ξ^{Ig,X}_Z → C^{Ig,X}_Z is the perfection of the 𝐒_Z-torsor of symmetric lifts f : X → G of f₀ : X → B^∨ ≅ B; after choosing a symplectic splitting δ_X of the filtration of X, it parametrizes symmetric lifts f̃ : X[1/p] → G of the induced f̃₀ : X[1/p] → B. (3) With the splitting of Z_N fixed, the completion of Ig^{X,tor} along its Z-stratum is canonically isomorphic to 𝔜_{Z,Σ_Z}/Γ_Z, 𝔜_{Z,Σ_Z} the completion of Ξ^{Ig,X}_{Z,Σ_Z} := Ξ^{Ig,X}_Z ×_{Ξ_Z} Ξ_{Z,Σ_Z} along its toroidal boundary.

Hypotheses:

- Standing hypotheses of CSnc §§3–4: p unramified in F, N ≥ 3 prime to p, K = K(N), and Σ a compatible family of smooth projective cone decompositions with trivial stabilizers (CSnc Remark 2.5.6); S = S_K and S_k = S ×_ℤ k for k algebraically closed of characteristic p.

Proof or construction:

1. (1) Over a perfect base the étale part of G[p^∞] splits off and, by duality with the multiplicative part, maps canonically into the étale part of X, giving the extension G[p^∞] ↪ X.
2. (2) The first description is the definition; the second defines a lift of the given 𝐒_Z-torsor to an 𝐒_{Z,perf}-torsor, which is unique.
3. (3) As in IG.2/toroidal-igusa-finite-level (2).

Acceptance:

- For X ordinary, C^{Ig,X}_Z is the Igusa variety of the smaller Shimura variety S_Z with the torus part trivialized.

Depends on: `perfect-toroidal-igusa-variety`, `lan-stroh-boundary-charts`, `splitting-symplectic-filtrations`, `ShimuraCompactifications:C4/polarized-degeneration-data`, `ShimuraCompactifications:C4/degeneration-effectivity`, `ShimuraCompactifications:C4/formal-universal-degeneration`, `NeronModelsAndSemistableAbelianVarieties:R11.3/raynaud-extension-comparison`.

Used by: `toroidal-isogeny-invariance`, `compactified-igusa-to-shimura`.

Sources:

- CSnc §3.2.7, Proposition 3.2.11, p. 43 (csnc): “Proposition 3.2.11. The perfect scheme CIg,X Z parametrizes points (B,ι,λ,η) ∈ SZ together with an extension 0 → T → G → B → 0 by the split torus T with cocharacter group X, and an OF -linear” — Moduli description of C^{Ig,X}_Z via embeddings G[p^∞] ↪ X.
- CSnc §3.2.7, Theorem 3.2.13, p. 44 (csnc): “Theorem 3.2.13. With the same choice of a splitting of the filtration ZN as in Theorem 2.5.9 (3), there is a canonical isomorphism of formal schemes c Ig X,tor Z ∼ →” — Boundary charts of Ig^{X,tor}.

### `unit-similitude-quasi-isogeny` — Existence of unit-similitude G-quasi-isogenies that are isomorphisms on étale and multiplicative parts (p split in F₀)

Declaration `IgusaVarietiesAndTorsionConcentration:IG.2/unit-similitude-quasi-isogeny` (lemma).

Assume p splits in the imaginary quadratic F₀ ⊂ F. Let X, X′ be p-divisible groups with G-structure over k in the same isogeny class b. Then there is a G-quasi-isogeny φ : X′ → X with similitude factor 1 that restricts to isomorphisms X′^{ét} ≅ X^{ét} and X′^μ ≅ X^μ.

Hypotheses:

- p split in F₀ (so G_{ℚ_p} ≅ ℚ_p^× × ∏_{v|𝔭} GL_{2n}(F_v) for 𝔭 a prime of F₀ above p).

Proof or construction:

1. Decompose X = ⊕_{v|𝔭}(X_v ⊕ X_{v^c}) with λ identifying X_{v^c} with the dual of X_v; a G-quasi-isogeny is a family of O_{F_v}-linear quasi-isogenies ψ_v : X′_v → X_v together with a similitude c, the v^c-component being c·(ψ_v^∨)^{−1}.
2. Split each X_v into multiplicative, biconnected and étale parts (IG.0/splitting-symplectic-filtrations); the étale (resp. multiplicative) parts are given by O_{F_v}-lattices in isomorphic F_v-modules and are therefore isomorphic (CSnc footnote 15).
3. Choose ψ_v as an isomorphism on the étale and multiplicative parts and any O_{F_v}-linear quasi-isogeny on the biconnected parts (same isogeny class), and take c = 1.

Acceptance:

- For p inert in F₀ the similitude of G-quasi-isogenies is constrained by J_b(ℚ_p), and the existence of a unit-similitude quasi-isogeny of biconnected parts is not established (recorded gap).

Depends on: `splitting-symplectic-filtrations`, `quasi-split-unitary-datum`, `unramified-local-pel-datum`.

Used by: `leaf-minimal-compactification-affine`.

Sources:

- CSnc §3.3.1, footnote 15, p. 45 (csnc): “Indeed, X and X′ decompose into the sum of their biconnected part, and their étale and multiplicative part, and one can choose the quasi-isogeny on these parts individually. The étale and multiplicative parts are given by OF ⊗” — Choosing the quasi-isogeny separately on biconnected, étale and multiplicative parts.

### `toroidal-isogeny-invariance` — Quasi-isogeny invariance of toroidal Igusa varieties (CSnc Corollary 3.2.14, corrected)

Declaration `IgusaVarietiesAndTorsionConcentration:IG.2/toroidal-isogeny-invariance` (theorem).

Let φ : X → X′ be a quasi-isogeny of p-divisible groups with G-structure over k, with similitude factor in ℤ_p^×, inducing isomorphisms on étale and multiplicative parts. Then the isomorphism Ig^X ≅ Ig^{X′} induced by φ (IG.1/igusa-isogeny-invariance) extends uniquely to an isomorphism Ig^{X,tor} ≅ Ig^{X′,tor} over the correspondence of partial toroidal compactifications, equivariantly for the prime-to-p Hecke action. As printed, the corollary is stated for isogenies compatible with G-structures, which are then isomorphisms whenever X^μ ≠ 0 (sourceIssues IgusaVarietiesAndTorsionConcentration/E1); the proof works with a map on biconnected parts of similitude p^m that is not a G-isogeny.

Hypotheses:

- Standing hypotheses of CSnc §§3–4: p unramified in F, N ≥ 3 prime to p, K = K(N), and Σ a compatible family of smooth projective cone decompositions with trivial stabilizers (CSnc Remark 2.5.6); S = S_K and S_k = S ×_ℤ k for k algebraically closed of characteristic p.
- φ a G-quasi-isogeny with unit similitude, isomorphism on X^{ét} and X^μ.

Proof or construction:

1. Write the biconnected part of φ as ψ₂^{−1} ∘ ψ₁ with isogenies, extended by the identity on the outer parts; these are not G-isogenies, and the proof must construct, at each cusp Z, isomorphisms of the boundary charts of IG.2/igusa-boundary-charts directly.
2. On C^{Ig,X}_Z: from ρ : G[p^∞] ↪ X and the kernel K of the isogeny (inside X°, not meeting X^μ) form G′ = G/ρ^{−1}(K), B′ = B/ρ^{−1}(K), with ρ′ : G′[p^∞] ↪ X′ (CSnc proof of Cor. 3.2.14).
3. Compare the perfect torus torsors: f₀ composed with B → B′ is p^m f′₀, so the pullback torsor is the pushout along p^m : 𝐒_Z → 𝐒_Z, an isomorphism after perfection preserving the cone decompositions.
4. Gap: the principal polarization of B′ and the compatibility of the interior identification with these boundary isomorphisms for a non-G-isogeny are not established in the source; recorded as a gap of this packet.

Acceptance:

- For φ an isomorphism the statement is the identity.
- The open-part statement (IG.1/igusa-isogeny-invariance) needs no hypothesis on étale and multiplicative parts; the toroidal one does.

Depends on: `igusa-boundary-charts`, `igusa-isogeny-invariance`, `perfect-toroidal-igusa-variety`.

Used by: `leaf-minimal-compactification-affine`.

Sources:

- CSnc §3.2.7, before Corollary 3.2.14, p. 44 (csnc): “A corollary of this description is that IgX,tor Z only depends on X up to quasi-isogenies inducing an isomorphism on étale and multiplicative parts. Corollary 3.2.14. Let φ : X → X′ be an isogeny” — States the dependence of the toroidal Igusa variety on X only up to quasi-isogenies inducing isomorphisms on étale and multiplicative parts.
- CSnc §3.2.7, Corollary 3.2.14, p. 44 (csnc): “Corollary 3.2.14. Let φ : X → X′ be an isogeny between p-divisible groups with Gstructure over k. Assume that φ induces an isomorphism on étale and multiplicative parts. Then the isomorphism IgX ∼ =” — The printed statement for isogenies.

### `ekedahl-oort-stratification` — Ekedahl–Oort strata via G-zips and their Hasse sections ★

Declaration `IgusaVarietiesAndTorsionConcentration:IG.2/ekedahl-oort-stratification` (construction). Planet: Ekedahl–Oort strata and Hasse sections. Suggested home: `TauCeti/ShimuraVarieties/Igusa/EkedahlOort` (`TauCeti.Igusa`).

For the PEL datum of IG.0 at p unramified, the p-torsion A[p] of the universal abelian scheme over S_k with its O_F-action and polarization defines an F-zip with G-structure (Moonen–Wedhorn; Pink–Wedhorn–Ziegler), hence a morphism ζ : S_k → [E_𝒵\G_k] to the stack of G-zips, which is smooth. The Ekedahl–Oort strata S^w, w ∈ ^JW (minimal-length coset representatives for the Weyl group of the Levi of μ), are the locally closed fibres of ζ over the points of [E_𝒵\G_k]; dim S^w = ℓ(w). Each stratum closure carries Hasse sections: sections of a power of the Hodge line bundle ω^{⊗N} on the closure of S^w whose non-vanishing locus is exactly S^w (Boxer; Goldring–Koskivirta). EO strata extend to the toroidal and minimal compactifications as well-positioned subsets, and the Hasse sections extend to S^* using the ample Hodge line bundle there.

Hypotheses:

- Standing hypotheses of CSnc §§3–4: p unramified in F, N ≥ 3 prime to p, K = K(N), and Σ a compatible family of smooth projective cone decompositions with trivial stabilizers (CSnc Remark 2.5.6); S = S_K and S_k = S ×_ℤ k for k algebraically closed of characteristic p.
- PEL datum of type (A) or (C) unramified at p (here the quasi-split unitary datum).

Proof or construction:

1. Attach to A[p] the F-zip (H^1_dR, conjugate and Hodge filtrations, Frobenius and Verschiebung isomorphisms on graded pieces) with O_F ⊗ 𝔽_p-action and pairing; this is a G-zip of type μ (Moonen–Wedhorn).
2. Smoothness of ζ follows from Serre–Tate and Grothendieck–Messing (deformations of A[p] versus deformations of the Hodge filtration; Wedhorn, Zhang).
3. Define S^w as the preimage of the E_𝒵-orbit O^w; dimension ℓ(w) from smoothness of ζ and the dimension of the orbits.
4. Hasse sections: pull back the sections of the stack of G-zips constructed by Goldring–Koskivirta (or Boxer's determinant construction for the PEL case) through ζ.
5. Extension to compactifications: the p-torsion of the semi-abelian scheme gives a G-zip on the toroidal compactification (Boxer, §3); the strata are well-positioned with boundary data the EO strata of S_Z.

Uses:

- IG.2/eo-strata-minimal-affine: partial minimal compactifications of EO strata are affine via their Hasse sections
- IG.2/fundamental-eo-stratum-in-newton-stratum: Nie produces an EO stratum inside each Newton stratum
- IG.2/leaf-minimal-compactification-affine: a central leaf is closed in such an EO stratum

API:

- `ekedahlOortStratum` (constructor): S^w ⊂ S_k for w ∈ ^JW, locally closed.
- `ekedahlOortStratum_dim` (characterisation): S^w is smooth of dimension ℓ(w) when nonempty.
- `zipMorphism_smooth` (instance): ζ : S_k → [E_𝒵\G_k] is smooth.
- `hasseSection` (constructor): A section of ω^{⊗N} on the closure of S^w with non-vanishing locus S^w.
- `ekedahlOortStratum_wellPositioned` (other): S^w is well-positioned, with boundary data the EO strata of S_Z.
- `ekedahlOortStratum_ordinary` (compatibility): The open EO stratum equals the ordinary Newton stratum, and its Hasse section is the classical Hasse invariant.

Unit tests:

- `ekedahlOortStratum_modularCurve` (computation): For n = 1 and F imaginary quadratic there are exactly two strata: ordinary (dimension 1) and supersingular (dimension 0).
- `ekedahlOortStratum_ordinary_open` (degenerate): The stratum of the longest element of ^JW is open and dense.
- `ekedahlOortStratum_ne_leaf` (non-example): For n ≥ 2, an EO stratum is in general not contained in a single Newton stratum; Nie's fundamental strata are the exceptions used here (for n = 1 the EO strata are the Newton strata).
- `hasseSection_ordinary_compat` (compatibility): On the ordinary stratum the Hasse section is a power of the classical Hasse invariant det(V : ω^{(p)} → ω).

Acceptance:

- The ordinary EO stratum is open and equal to the ordinary Newton stratum; its Hasse section is the classical Hasse invariant (compatible with the Hasse invariant of HodgeTateAndCanonicalSubgroups T0 on the ordinary locus).
- For F imaginary quadratic and n = 1 there are two EO strata, ordinary and supersingular.

Depends on: `integral-model`, `g-structure`, `well-positioned-subscheme`, `HodgeTateAndCanonicalSubgroups:T0`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/dieudonne-p-divisible`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/dieudonne-slopes`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/isogeny-classification`, `VectorBundlesAndIsocrystals:VB0/dieudonne-manin-isocrystals`, `ShimuraCompactifications:C5/integral-minimal-space`, `ShimuraCompactifications:C5/minimal-hodge-ampleness`.

Used by: `eo-strata-minimal-affine`, `fundamental-eo-stratum-in-newton-stratum`.

Sources:

- CSnc §3.3.1, proof of Theorem 3.3.2, p. 45 (csnc): “there is an Ekedahl–Oort stratum that is completely contained in the given Newton stratum. Taking X so that X[p] deﬁnes such an Ekedahl–Oort stratum, the leaf CX is a closed subset of the” — The Ekedahl–Oort strata used in the affineness argument.
- Theorem C, p. 17 (§1.5 of the Introduction; with Theorem B, p. 17); in the text Theorem 6.2.3 and Corollary 6.2.4, p. 190 (box15): “Theorem C. The open Ekedahl-Oort strata of the minimal compactification Xwmin are affine.” — Boxer Theorem C: affineness of partial minimal compactifications of Ekedahl–Oort strata, via Hasse sections.

### `eo-strata-minimal-affine` — Partial minimal compactifications of Ekedahl–Oort strata are affine (Boxer, Theorem C)

Declaration `IgusaVarietiesAndTorsionConcentration:IG.2/eo-strata-minimal-affine` (theorem).

For every w ∈ ^JW, the partial minimal compactification (S^w)^* of the Ekedahl–Oort stratum S^w (a well-positioned subset) is affine.

Hypotheses:

- Standing hypotheses of CSnc §§3–4: p unramified in F, N ≥ 3 prime to p, K = K(N), and Σ a compatible family of smooth projective cone decompositions with trivial stabilizers (CSnc Remark 2.5.6); S = S_K and S_k = S ×_ℤ k for k algebraically closed of characteristic p.

Proof or construction:

1. The closure of (S^w)^* in S^*_k is projective, and the Hasse section of IG.2/ekedahl-oort-stratification extends to a section of an ample line bundle (a power of the Hodge bundle, ample on S^*: ShimuraCompactifications C5) on that closure whose non-vanishing locus is (S^w)^*.
2. The complement of the zero locus of a section of an ample line bundle on a projective scheme is affine.

Acceptance:

- For the ordinary stratum: (S^{ord})^* = S^*_k ∖ V(Ha) is affine.

Depends on: `ekedahl-oort-stratification`, `partial-compactifications`, `ShimuraCompactifications:C5/integral-minimal-space`, `ShimuraCompactifications:C5/minimal-hodge-ampleness`.

Used by: `leaf-minimal-compactification-affine`.

Sources:

- Theorem C, p. 17 (§1.5 of the Introduction; with Theorem B, p. 17); in the text Theorem 6.2.3 and Corollary 6.2.4, p. 190 (box15): “Theorem C. The open Ekedahl-Oort strata of the minimal compactification Xwmin are affine.” — Boxer Theorem C.
- CSnc §3.3.1, proof of Theorem 3.3.2, p. 45 (csnc): “By [Box15, Theorem C], the partial minimal compactiﬁcations of Ekedahl-Oort strata are aﬃne. As mentioned above, the deﬁnitions of partial minimal” — Cites Boxer Theorem C.

### `fundamental-eo-stratum-in-newton-stratum` — Every Newton stratum contains an Ekedahl–Oort stratum, which is a central leaf (Nie, Proposition 1.5, Corollary 1.6)

Declaration `IgusaVarietiesAndTorsionConcentration:IG.2/fundamental-eo-stratum-in-newton-stratum` (theorem).

For every b ∈ B(G_{ℚ_p}, μ^{−1}) there is a fundamental element w ∈ ^JW such that the Ekedahl–Oort stratum S^w is contained in the Newton stratum S^b; for such w, the p-divisible groups with G-structure at the points of S^w are all isomorphic, so S^w is a central leaf C^{X_w} with X_w the minimal p-divisible group with G-structure in the class b.

Hypotheses:

- PEL datum of type (A) or (C) unramified at p (Nie's results are for unramified groups with minuscule μ).

Proof or construction:

1. Nie [Nie15, Prop. 1.5]: for every b ∈ B(G, μ) there is a fundamental (P-)alcove element w with b = [ẇσ].
2. Nie [Nie15, Cor. 1.6]: the EO stratum of a fundamental element lies in a single Newton stratum and the isomorphism class of the p-divisible group with extra structure is constant on it (minimality, after Viehmann–Wedhorn).

Acceptance:

- For b ordinary, w is the longest element and S^w is the ordinary locus.
- For b basic and F imaginary quadratic, n = 1, w = 1 and S^w is the supersingular locus.

Depends on: `ekedahl-oort-stratification`, `newton-map`, `central-leaf`, `BunGAndNewtonStrata:BG1`, `BunGAndNewtonStrata:BG1/partial-order-on-B-of-G`.

Used by: `leaf-minimal-compactification-affine`, `minimal-igusa-compactification`.

Sources:

- Proposition 1.5, p. 3 (arXiv:1310.2229v2; proof on p. 12) (nie15): “Proposition 1.5. Let µ be a minuscule cocharacter. Then each σ- conjugacy class intersecting with Kµ(ǫ)K contains a fundamental el- ement in W µ(ǫ)W . Here W = NG T (L)/T (L) denotes the (absolute) Weyl group of G.” — Nie Proposition 1.5.
- Corollary 1.6, p. 4 (arXiv:1310.2229v2) (nie15): “Corollary 1.6. Let A0 be the reduction (modulo p) of a Shimura va- riety defined in [VW]. Then each Newton stratum of A0 contains a fundamental Ekedahl-Oort stratum. In particular, all Newton strata of A0 are non-empty.” — Nie Corollary 1.6.

### `affineness-transfer-lemma` — Transfer of affineness through proper correspondences (CSnc Lemma 3.3.3)

Declaration `IgusaVarietiesAndTorsionConcentration:IG.2/affineness-transfer-lemma` (lemma).

Consider schemes X ← C → Y with maps π₁, π₂, and closed subschemes X₀ ⊂ X, C₀ ⊂ C, Y₀ ⊂ Y with C₀ topologically the preimage of both X₀ and Y₀. Assume X, X₀ and Y₀ are affine, and π₁, π₂ are proper, surjective and finite away from C₀. Then Y is affine.

Hypotheses:

- π₁, π₂ proper surjective, finite away from C₀; X, X₀, Y₀ affine.

Proof or construction:

1. Replace C by the Stein factorization C′ of π₂ (H⁰(C′, O) = H⁰(C, O), so C → X factors through C′, and C′ → X is proper surjective [Stacks 03GN]); now π₂ is finite surjective.
2. Affineness descends along finite surjections (Chevalley), so it suffices that C is affine, i.e. that π₁ is finite, i.e. quasi-finite.
3. π₁ is quasi-finite away from X₀; over X₀, C₀ → X₀ is a proper map of affine schemes (C₀ → Y₀ finite, Y₀ affine), hence finite.

Acceptance:

- With C₀ = ∅ the lemma says: a scheme admitting a finite surjective correspondence to an affine scheme is affine.

Depends on: `mathlib:AlgebraicGeometry.IsAffine`, `mathlib:AlgebraicGeometry.IsProper`, `mathlib:AlgebraicGeometry.IsFinite`, `mathlib:AlgebraicGeometry.Scheme.Hom.normalization`.

Used by: `leaf-minimal-compactification-affine`.

Sources:

- CSnc §3.3.1, Lemma 3.3.3, p. 46 (csnc): “Lemma 3.3.3. Consider a diagram X0  _  C0  _  oo //” — States the affineness transfer lemma.
- CSnc §3.3.1, Lemma 3.3.3, p. 46 (csnc): “of schemes, where the vertical arrows are closed immersions and C0 ⊂ C is topologically the preimage both of X0 ⊂ X and of Y0 ⊂ Y . Assume that X, X0 and Y0 are affine, and that π1 and π2 are proper and surjective and finite away” — Hypotheses and conclusion of the lemma.

### `leaf-minimal-compactification-affine` — Partial minimal compactifications of central leaves are affine (CSnc Theorem 3.3.2) ★

Declaration `IgusaVarietiesAndTorsionConcentration:IG.2/leaf-minimal-compactification-affine` (theorem). Planet: Affineness of partial minimal compactifications.

For every p-divisible group X with G-structure over k, the partial minimal compactification C^{X,*} is affine. In the form proved here: (1) for X = X_w the minimal p-divisible group of a fundamental element (IG.2/fundamental-eo-stratum-in-newton-stratum), C^{X,*} is affine unconditionally; (2) for an arbitrary X in the same isogeny class, C^{X,*} is affine provided there is a unit-similitude G-quasi-isogeny X_w → X that is an isomorphism on étale and multiplicative parts (IG.2/unit-similitude-quasi-isogeny, available for p split in F₀) and the toroidal invariance IG.2/toroidal-isogeny-invariance holds for it (recorded gap).

Hypotheses:

- Standing hypotheses of CSnc §§3–4: p unramified in F, N ≥ 3 prime to p, K = K(N), and Σ a compatible family of smooth projective cone decompositions with trivial stabilizers (CSnc Remark 2.5.6); S = S_K and S_k = S ×_ℤ k for k algebraically closed of characteristic p.

Proof or construction:

1. (1) C^{X_w} is closed in its Newton stratum, hence closed in S^w (in fact equal to it), and (S^w)^* is affine (IG.2/eo-strata-minimal-affine); conclude by IG.2/partial-minimal-closed.
2. (2) Use the correspondence C^{X_w,*} ← Ig^{X,tor} → C^{X,*} extending C^{X_w} ← Ig^X → C^X (IG.2/toroidal-isogeny-invariance); Ig^{X,tor} is a limit of finite type schemes along finite surjective maps (finite étale and Frobenius), so both maps factor through a finite level by finite presentation.
3. Apply IG.2/affineness-transfer-lemma, with induction on the boundary strata (the boundary of C^{X,*} is a union of leaves of smaller Shimura varieties) to make C^{X,*}_0 affine.
4. The printed proof uses Corollary 3.2.14 for an isogeny that, as a G-isogeny, cannot exist (sourceIssues IgusaVarietiesAndTorsionConcentration/E1); for the main argument (1) suffices once X_b is chosen minimal and completely slope divisible (see IG.2/minimal-igusa-compactification).

Acceptance:

- For X ordinary, C^{X,*} is the ordinary locus of S^*_k, the non-vanishing locus of the Hasse invariant.
- For X with X^{ét} = 0 (e.g. basic for n ≥ 1 when non-ordinary at all places), C^{X,*} = C^X is affine, closed in an affine EO stratum.

Depends on: `eo-strata-minimal-affine`, `fundamental-eo-stratum-in-newton-stratum`, `partial-minimal-closed`, `affineness-transfer-lemma`, `toroidal-isogeny-invariance`, `unit-similitude-quasi-isogeny`, `partial-compactifications`.

Used by: `perfect-minimal-igusa`, `minimal-igusa-compactification`, `artin-vanishing-upper-bound`.

Sources:

- CSnc §3.3.1, Theorem 3.3.2, p. 45 (csnc): “Theorem 3.3.2. The partial minimal compactification CX,∗ is affine. Proof. First, we” — Affineness of C^{X,*}.
- CSnc §3.3.1, proof of Theorem 3.3.2, p. 45 (csnc): “First, we prove that there exists some X in the given isogeny class for which the result is true. By a result of Nie, [Nie15, Proposition 1.5, Corollary 1.6], there is an Ekedahl–Oort stratum that is” — The proof first treats a leaf inside an Ekedahl–Oort stratum.

### `perfect-minimal-igusa` — The partial minimal compactification Ig^{X,*} of the perfect Igusa variety (CSnc Proposition 3.3.4)

Declaration `IgusaVarietiesAndTorsionConcentration:IG.2/perfect-minimal-igusa` (construction). Suggested home: `TauCeti/ShimuraVarieties/Igusa/Minimal` (`TauCeti.Igusa.PerfectMinimalIgusa`).

Define Ig^{X,*} as the normalization of C^{X,*} in the perfect Igusa variety Ig^X. Then Ig^{X,*} → C^{X,*} is integral, so Ig^{X,*} is affine when C^{X,*} is; it agrees with the Stein factorization of Ig^{X,tor} → C^{X,*}, so Ig^{X,*} = Spec H⁰(Ig^{X,tor}, O). A G-quasi-isogeny φ : X → X′ as in IG.2/toroidal-isogeny-invariance induces Ig^{X,*} ≅ Ig^{X′,*}.

Hypotheses:

- Standing hypotheses of CSnc §§3–4: p unramified in F, N ≥ 3 prime to p, K = K(N), and Σ a compatible family of smooth projective cone decompositions with trivial stabilizers (CSnc Remark 2.5.6); S = S_K and S_k = S ×_ℤ k for k algebraically closed of characteristic p.

Proof or construction:

1. Integrality: Ig^X is a cofiltered limit of finite (étale and Frobenius) covers of C^X, and normalization commutes with such limits.
2. Stein factorization: Ig^{X,tor} → C^{X,*} is proper on finite levels; its Stein factorization is finite over C^{X,*} and normal, contains Ig^X as a dense open, hence is the normalization.
3. Isogeny invariance follows from IG.2/toroidal-isogeny-invariance by taking H⁰.

Uses:

- IG.3/minimal-fibre-theorem: Ig^{X,*}_C is an affinoid perfectoid open in the fibre of π^*_HT, and H⁰ of the toroidal and minimal fibres agree
- IG.4/artin-vanishing-upper-bound: affineness of Ig^{X,*} gives Artin vanishing for H^i(Ig^{X,*}, j_!𝔽_ℓ)

API:

- `PerfectMinimalIgusa` (constructor): Ig^{X,*}, the normalization of C^{X,*} in Ig^X.
- `PerfectMinimalIgusa.integral` (instance): Ig^{X,*} → C^{X,*} is integral.
- `PerfectMinimalIgusa.eq_spec_H0` (characterisation): If C^{X,*} is affine (unconditionally for X = X_w fundamental, IG.2/leaf-minimal-compactification-affine), Ig^{X,*} = Spec H⁰(Ig^{X,tor}, O).
- `PerfectMinimalIgusa.isAffine` (instance): Ig^{X,*} is affine when C^{X,*} is.
- `PerfectMinimalIgusa.open` (compatibility): Ig^X ⊂ Ig^{X,*} is a dense open.

Unit tests:

- `PerfectMinimalIgusa.no_etale` (degenerate): If X^{ét} = 0 then Ig^{X,*} = Ig^X.
- `PerfectMinimalIgusa.modular_curve` (computation): For n = 1, F imaginary quadratic and X ordinary, the boundary of Ig^{X,*} over each cusp of C^{X,*} is a profinite set (dimension 0), in bijection with the Igusa cusp labels above that cusp (IG.2/minimal-igusa-boundary-strata).
- `PerfectMinimalIgusa.not_finite` (non-example): Ig^{X,*} → C^{X,*} is integral but not finite (Γ_X is infinite).

Acceptance:

- For X^{ét} = 0, Ig^{X,*} = Ig^X.
- For X ordinary, Ig^{X,*} is the normalization of the ordinary locus of S^* in the perfect ordinary Igusa tower.

Depends on: `perfect-toroidal-igusa-variety`, `leaf-minimal-compactification-affine`, `mathlib:AlgebraicGeometry.Scheme.Hom.normalization`.

Used by: `minimal-igusa-compactification`, `minimal-fibre-theorem`.

Sources:

- CSnc §3.3.1, Proposition 3.3.4, p. 46 (csnc): “Proposition 3.3.4. The map IgX,∗ → CX,∗ is integral, and in particular IgX,∗ is affine. It agrees with the Stein factorization of IgX,tor → CX,∗ . In particular, IgX,∗ = H0 (IgX,tor ,OIgX,tor ), and a G-isogeny φ : X → X′” — Integrality, affineness and the Stein factorization description of Ig^{X,*}.

### `minimal-igusa-compactification` — Finite-level partial minimal compactifications Ig^{b,*}_m of Igusa varieties (CSnc Definition 3.3.7, Lemma 3.3.8, corrected) ★

Declaration `IgusaVarietiesAndTorsionConcentration:IG.2/minimal-igusa-compactification` (construction). Planet: Partial minimal compactification of Igusa varieties. Suggested home: `TauCeti/ShimuraVarieties/Igusa/Minimal` (`TauCeti.Igusa.MinimalIgusa`).

Fix b ∈ B(G_{ℚ_p}, μ^{−1}) and a completely slope divisible X_b with G-structure in the class b; when possible take X_b = X_w minimal for a fundamental w (IG.2/fundamental-eo-stratum-in-newton-stratum), which is completely slope divisible. Let C^b = C^{X_b} and Ig^b_m = Ig^{X_b}_{Mant,m}. Define Ig^{b,*}_m as the normalization of C^{b,*} in Ig^b_m and Ig^{b,*} := lim_m Ig^{b,*}_m. Then: (1) h^{b,*}_m : Ig^{b,*}_m → C^{b,*} is finite and surjective, so Ig^{b,*}_m is affine whenever C^{b,*} is; (2) Ig^b_m ↪ Ig^{b,*}_m is a dense open immersion and Ig^{b,*}_m is normal; (3) Ig^{b,*} → C^{b,*} is integral (not finite) and Ig^{b,*} is affine; its perfection is Ig^{X_b,*} of IG.2/perfect-minimal-igusa. As printed, Lemma 3.3.8 calls Ig^{b,*} → C^{b,*} finite for the pro-Igusa variety (sourceIssues IgusaVarietiesAndTorsionConcentration/E2).

Hypotheses:

- Standing hypotheses of CSnc §§3–4: p unramified in F, N ≥ 3 prime to p, K = K(N), and Σ a compatible family of smooth projective cone decompositions with trivial stabilizers (CSnc Remark 2.5.6); S = S_K and S_k = S ×_ℤ k for k algebraically closed of characteristic p.
- X_b completely slope divisible.

Proof or construction:

1. (1)–(2): normalization of a normal scheme in a finite étale cover of a dense open is finite (C^{b,*} is excellent of finite type over k) and normal, containing Ig^b_m densely.
2. (3): normalization commutes with the cofiltered limit along finite transition maps; integral over an affine scheme is affine.
3. Comparison with the perfect version: perfection commutes with normalization in this setting, as Ig^X is the perfection of lim Ig^b_m (IG.1/perfection-of-mantovan).

Uses:

- IG.4/partial-support-cohomology: H^i_{c−∂}(Ig^b, 𝔽_ℓ) := H^i(Ig^{b,*}, j_!𝔽_ℓ)
- IG.4/artin-vanishing-upper-bound: Artin vanishing on the affine Ig^{b,*}_m
- IG.6/boundary-strata-by-parabolics: the boundary of Ig^{b,*} is decomposed by rational parabolics

API:

- `MinimalIgusa` (constructor): Ig^{b,*}_m, the normalization of C^{b,*} in Ig^b_m.
- `MinimalIgusa.finite` (instance): Ig^{b,*}_m → C^{b,*} is finite surjective.
- `MinimalIgusa.normal` (instance): Ig^{b,*}_m is normal, with Ig^b_m dense open.
- `MinimalIgusa.isAffine` (instance): Ig^{b,*}_m and Ig^{b,*} = lim_m Ig^{b,*}_m are affine.
- `MinimalIgusa.lim_integral` (characterisation): Ig^{b,*} → C^{b,*} is integral.
- `MinimalIgusa.perf` (compatibility): (Ig^{b,*})_perf ≅ Ig^{X_b,*}.
- `MinimalIgusa.hecke` (functoriality): The prime-to-p Hecke correspondences and the monoid of J_b(ℚ_p) acting on Ig^b_Mant extend to the Ig^{b,*}_m.

Unit tests:

- `MinimalIgusa.level_zero` (degenerate): Ig^{b,*}_0 = C^{b,*}.
- `MinimalIgusa.ordinary` (computation): For the modular-curve case and b ordinary, Ig^{b,*}_1 is the Igusa curve of level p with its cusps added, finite over the ordinary locus of the minimal compactification.
- `MinimalIgusa.not_finite_limit` (non-example): Ig^{b,*} → C^{b,*} is not finite when Γ_X is infinite: only the finite levels are finite.
- `MinimalIgusa.not_etale` (non-example): For n ≥ 2 there is a level m for which Ig^{b,*}_m → C^{b,*} is not étale over the boundary (the boundary strata are lower-rank Igusa varieties with smaller covering groups); the non-example needs n ≥ 2, since for n = 1 the minimal and toroidal compactifications of the leaf agree.

Acceptance:

- Ordinary case: Ig^{ord,*}_m is the normalization of the ordinary locus of S^*_k in the level-p^m ordinary Igusa cover; its boundary strata are the Igusa varieties of the smaller Shimura varieties S_Z (IG.2/minimal-igusa-boundary-strata).
- Affineness of Ig^{b,*} (CSnc Theorem 2.8.1) follows from (3) and IG.2/leaf-minimal-compactification-affine (1) for X_b = X_w.

Depends on: `mantovan-igusa-variety`, `leaf-minimal-compactification-affine`, `fundamental-eo-stratum-in-newton-stratum`, `perfect-minimal-igusa`, `perfection-of-mantovan`, `mathlib:AlgebraicGeometry.Scheme.Hom.normalization`, `mathlib:AlgebraicGeometry.IsFinite`.

Used by: `minimal-igusa-boundary-strata`, `minimal-fibre-theorem`, `partial-support-cohomology`, `artin-vanishing-upper-bound`.

Sources:

- CSnc §3.3.6, Definition 3.3.7, p. 46 (csnc): “Definition 3.3.7. Define the partial minimal compactification Igb,∗ of Igb to be the normalization of Cb,∗ in Igb .” — Defines Ig^{b,*} by normalization.
- CSnc §3.3.6, Lemma 3.3.8, p. 47 (csnc): “(1) The morphism hb,∗ : Igb,∗ → Cb,∗ is finite and surjective. In particular, Igb,∗ is affine. (2) The morphism Igb ֒→” — The printed finiteness statement, valid at finite level.
- CSnc §2.8, Theorem 2.8.1, p. 33 (csnc): “Theorem 2.8.1. The partial minimal compactification Igb,∗ is affine.” — Affineness of Ig^{b,*}, used for Artin vanishing.

### `igusa-cusp-labels` — Igusa cusp labels (CSnc Definition 3.3.10)

Declaration `IgusaVarietiesAndTorsionConcentration:IG.2/igusa-cusp-labels` (definition). Suggested home: `TauCeti/ShimuraVarieties/Igusa/CuspLabels` (`TauCeti.Igusa.IgusaCuspLabel`).

An Igusa cusp label is a triple Z̃ = (Z_b, Z^p, X) where (1) Z_b is an O_F-stable filtration Z_{b,−2} ⊂ Z_{b,−1} ⊂ X_b with Gr_{−2} = Z_{b,−2} multiplicative, Gr_0 = X_b/Z_{b,−1} étale, identified as Cartier dual by the polarization (so Gr_{−1} is principally polarized); (2) Z^p is an O_F-stable symplectic filtration Z^p_{−2} ⊂ Z^p_{−1} ⊂ L ⊗ ℤ̂^p; (3) X is a finite projective O_F-module with isomorphisms X ⊗ ℚ_p/ℤ_p ≅ Gr^{Z_b}_0 and X ⊗ ℤ̂^p ≅ Gr^{Z^p}_0. J_b(ℚ_p) × G(𝔸_f^p) acts on Igusa cusp labels; at level K (compact open) an Igusa cusp label is a K-orbit, and for K = Γ_b(p^m)K^p(N) these are triples (Z_{m,b}, Z_N, X) with Z = (Z_N, X) a cusp label at level K(N) and Z_{m,b} an O_F-linear symplectic filtration of X_b[p^m] with X/p^m ≅ Gr_0. Its stabilizer is Γ_Z̃ = {γ ∈ Aut_{O_F}(X) : γ ≡ 1 mod p^mN}.

Hypotheses:

- Standing hypotheses of CSnc §§3–4: p unramified in F, N ≥ 3 prime to p, K = K(N), and Σ a compatible family of smooth projective cone decompositions with trivial stabilizers (CSnc Remark 2.5.6); S = S_K and S_k = S ×_ℤ k for k algebraically closed of characteristic p.
- X_b completely slope divisible.

Proof or construction:

1. Define the triples and the action of J_b(ℚ_p) × G(𝔸_f^p) through its action on X_b (quasi-isogenies) and on L ⊗ ℤ̂^p.
2. At level Γ_b(p^m)K^p(N): the filtration of X_b[p^m] with étale Gr_0 ≅ X/p^m forces Gr_{−2} multiplicative by the pairing and lifts to higher p-power levels.

Uses:

- IG.2/toroidal-igusa-boundary-strata: the completion of Ig^{b,tor}_m along a Z-stratum decomposes over Igusa cusp labels above Z
- IG.6/boundary-strata-by-parabolics: Igusa cusp labels of corank r give the strata Ig^{b,*}_{[P]} indexed by parabolics

API:

- `IgusaCuspLabel` (data): Triples (Z_b, Z^p, X) as above.
- `IgusaCuspLabel.toCuspLabel` (projection): The underlying cusp label (Z^p, X) of the Shimura variety.
- `IgusaCuspLabel.action` (functoriality): Action of J_b(ℚ_p) × G(𝔸_f^p).
- `IgusaCuspLabel.atLevel` (characterisation): At level Γ_b(p^m)K^p(N), Igusa cusp labels correspond to triples (Z_{m,b}, Z_N, X).
- `IgusaCuspLabel.stabilizer` (constructor): Γ_Z̃ = {γ ∈ Aut_{O_F}(X) : γ ≡ 1 mod p^mN}.
- `IgusaCuspLabel.rank` (projection): r = rk_{O_F} X ∈ {0, …, n}.

Unit tests:

- `IgusaCuspLabel.trivial` (degenerate): The label with X = 0 corresponds to the open stratum Ig^b_m.
- `IgusaCuspLabel.ordinary_count` (computation): At m = 0 (level Γ_b K^p(N)) the filtration Z_{0,b} of X_b[p⁰] = 0 is trivial, so the Igusa cusp labels above a cusp label Z of the leaf correspond to Z itself; for n = 1, F imaginary quadratic and b ordinary there is exactly one above each cusp.
- `IgusaCuspLabel.basic_none` (non-example): If X_b^{ét} = 0 there are no Igusa cusp labels with X ≠ 0.

Acceptance:

- For b ordinary, Z_b is determined by a sub-O_F-module of the étale part of X_b of rank rk_{O_F} X.
- For X = 0, Z̃ is the trivial label of the open stratum.

Depends on: `splitting-symplectic-filtrations`, `ShimuraCompactifications:C1/cusp-label`, `ShimuraCompactifications:C1/arithmetic-stabilizer`, `unramified-local-pel-datum`.

Used by: `toroidal-igusa-boundary-strata`, `minimal-igusa-boundary-strata`, `toroidal-fibre-theorem`, `boundary-strata-by-parabolics`, `boundary-parabolic-induction`, `local-boundary-computation`.

Sources:

- CSnc §3.3.9, Definition 3.3.10, p. 47 (csnc): “Definition 3.3.10. An Igusa cusp label is a triple Z̃ = (Zb,Zp ,X) where (1) Zb is an OF -stable filtration of Xb of the form Zb,−2 ⊂ Zb,−1 ⊂ Xb such that GrZb −2 = Zb,−2 is multiplicative, GrZb 0 =” — Defines Igusa cusp labels.
- CSnc §3.3.9, p. 47 (csnc): “There is an action of Jb(Qp) × G(Ap f) on Igusa cusp labels. If K ⊂ Jb(Qp) × G(Ap f) is a compact open subgroup, then an Igusa cusp label at level K” — The group action and levels.

### `toroidal-igusa-boundary-strata` — Boundary strata of finite-level toroidal Igusa varieties over Igusa cusp labels (CSnc Theorem 3.3.12, Definition 3.3.13)

Declaration `IgusaVarietiesAndTorsionConcentration:IG.2/toroidal-igusa-boundary-strata` (theorem).

(1) The completion of Ig^{b,tor}_m along its Z-stratum decomposes into open and closed formal subschemes indexed by Igusa cusp labels Z̃ at level Γ_b(p^m)K^p(N) above Z. (2) Fix a symplectic O_F-linear splitting δ_{m,b} of X_b[p^m] along Z_{m,b} and the splitting of Z_N. There is an abelian scheme C_Z̃ = Hom_{O_F}((1/N)X, (B/B[p^m]^μ)^∨) over the level-p^m Igusa variety Ig^b_{Z,m} of the boundary leaf C^b_Z ⊂ S_Z, mapping to C_Z over S_Z, such that, with Ξ_{Z̃,Σ_Z} the pullback of Ξ_{Z,Σ_Z} → C_Z to C_Z̃ and 𝔛_{Z̃,Σ_Z} its completion along the toroidal boundary, the Z̃-piece is Γ_Z̃-equivariantly 𝔛_{Z̃,Σ_Z}/Γ_Z̃; the moduli interpretation is by Igusa level-p^m structures compatible with Z̃ and δ_{m,b} (Definition 3.3.13). The natural map C_Z̃ → C_Z ×_{S_Z} Ig^b_{Z,m} is finite étale.

Hypotheses:

- Standing hypotheses of CSnc §§3–4: p unramified in F, N ≥ 3 prime to p, K = K(N), and Σ a compatible family of smooth projective cone decompositions with trivial stabilizers (CSnc Remark 2.5.6); S = S_K and S_k = S ×_ℤ k for k algebraically closed of characteristic p.
- X_b completely slope divisible.

Proof or construction:

1. Over the completion, the identification H^μ_Z[p^m] ≅ X^μ_b[p^m] restricted to T[p^m] gives a locally constant multiplicative subspace and, with its dual, a symplectic filtration Z_{m,b} of X_b[p^m]: this is the Igusa cusp label, giving (1).
2. Fixing Z̃ and δ_{m,b}, an Igusa level structure is (i) an Igusa level structure on B, (ii) a splitting of 0 → T[p^m] → G[p^m]^μ → B[p^m]^μ → 0, (iii) data on the remaining graded pieces; comparing moduli problems with IG.2/toroidal-igusa-finite-level (2) gives the chart, the change from Γ_Z to Γ_Z̃ being accounted for by T[p^m] ≅ Z_{m,b,−2}.
3. C_Z parametrizes Raynaud extensions with a splitting over N, i.e. Hom_{O_F}((1/N)X, B^∨); adding (ii) gives Hom_{O_F}((1/N)X, (B/B[p^m]^μ)^∨).

Acceptance:

- For b ordinary and the modular curve, the formal completion at a cusp is a disjoint union over Igusa cusp labels of quotients of Spf k[[q]] by Γ_Z̃.

Depends on: `toroidal-igusa-finite-level`, `igusa-cusp-labels`, `lan-stroh-boundary-charts`, `ShimuraCompactifications:C4/polarized-degeneration-data`, `ShimuraCompactifications:C4/degeneration-effectivity`, `ShimuraCompactifications:C4/formal-universal-degeneration`, `NeronModelsAndSemistableAbelianVarieties:R11.3/raynaud-extension-comparison`, `ShimuraCompactifications:C5/integral-toroidal-space`, `ShimuraCompactifications:C5/formal-completion`, `ShimuraCompactifications:C5/higher-level-toroidal-normalization`.

Used by: `minimal-igusa-boundary-strata`, `local-boundary-computation`.

Sources:

- CSnc §3.3.11, Theorem 3.3.12, p. 48 (csnc): “(1) There exists a decomposition into open and closed formal subschemes b Ig b,tor m,Z = G Z̃ b Ig b,tor m,Z̃ where Z̃” — Decomposition of the boundary completion over Igusa cusp labels.
- CSnc §3.3.11, proof of Theorem 3.3.12, p. 50 (csnc): “This means that CZ̃ → Igb Z,m is given by HomOF ( 1 N X,(B/B[pm ]µ )∨ ), which is an abelian scheme. (We note that this explicit description also” — Identification of the abelian scheme C_Z̃.

### `minimal-igusa-boundary-strata` — Boundary strata of Ig^{b,*}_m (CSnc Theorem 3.3.15)

Declaration `IgusaVarietiesAndTorsionConcentration:IG.2/minimal-igusa-boundary-strata` (theorem).

There is a decomposition into locally closed strata Ig^{b,*}_m = ⊔_{Z̃} Ig^b_{Z̃}, Z̃ running over Igusa cusp labels at level Γ_b(p^m)K^p(N), with Ig^b_{Z̃} ≅ Ig^b_{Z,m}, the level-p^m Igusa variety over the boundary leaf C^b_Z in S_Z (for the smaller unitary group of rank 2(n − r)). The stratum of Z̃ lies in the closure of that of Z̃′ according to the order on the underlying cusp labels.

Hypotheses:

- Standing hypotheses of CSnc §§3–4: p unramified in F, N ≥ 3 prime to p, K = K(N), and Σ a compatible family of smooth projective cone decompositions with trivial stabilizers (CSnc Remark 2.5.6); S = S_K and S_k = S ×_ℤ k for k algebraically closed of characteristic p.
- X_b completely slope divisible.

Proof or construction:

1. Ig^{b,*}_m is the Stein factorization of Ig^{b,tor}_m → C^{b,*} (IG.2/perfect-minimal-igusa and IG.2/minimal-igusa-compactification).
2. Zariski's main theorem and the Fourier–Jacobi expansion argument as for Shimura varieties (Lan §7), applied to the charts of IG.2/toroidal-igusa-boundary-strata: H⁰ of the abelian scheme C_Z̃ and of the torus embedding contribute only the constants, so the fibre over a Z̃-point is a point; the situation is simpler because Ig^{b,*}_m is affine.

Acceptance:

- For b ordinary, the boundary strata of Ig^{ord,*}_m are ordinary Igusa varieties of the smaller unitary Shimura varieties.
- If X_b^{ét} = 0 there is no boundary.

Depends on: `minimal-igusa-compactification`, `toroidal-igusa-boundary-strata`, `igusa-cusp-labels`, `ShimuraCompactifications:C5/integral-minimal-space`, `ShimuraCompactifications:C5/minimal-hodge-ampleness`.

Used by: `boundary-strata-by-parabolics`, `boundary-comparison-map`.

Sources:

- CSnc §3.3.14, Theorem 3.3.15, p. 50 (csnc): “Theorem 3.3.15. We have a decomposition into locally closed strata Igb,∗ m = G Z̃ Igb Z̃ , where Z̃ runs over Igusa” — States the boundary stratification of Ig^{b,*}_m.

## IG.3. Fibers of compactified Hodge–Tate maps

IG.3 identifies the fibres of the Hodge–Tate period maps. Locally (CS17 §4.2): the PEL Rapoport–Zink space at infinite level is preperfectoid, a closed subspace of the Scholze–Weinstein space, and its local period map lands in the b-stratum, is surjective there on (C, O_C)-points, and has fibres the orbits of Aut_G(X̃_b)^ad. With the dimension count this gives dim Fℓ^b = d − d_b. Globally: the perfect Igusa variety lifts canonically over W(k). The product formula identifies the infinite-level Newton stratum with Igusa variety × Rapoport–Zink space over the flag variety, and the étale cohomology of a perfect scheme agrees with that of its lift and of the perfectoid generic fibre. For proper Shimura varieties this gives the stalks of Rπ_HT* (CS17 Theorem 4.4.4); for the non-compact datum it gives the open-fibre theorem on the good-reduction locus. On compactifications (CSnc §4): the period map is explicit on boundary charts; the p-divisible group of a flag point is constant modulo p^ε; the Serre–Tate map from the W-lift of Ig^{X,tor} extends over the toroidal compactification; and the maps Ig^{X,tor}_C → (π^tor_HT)^{−1}(x), Ig^{X,*}_C → (π^*_HT)^{−1}(x) are open immersions with the same rank-one points whose targets are canonical compactifications. They are not isomorphisms of adic spaces. The minimal case uses connected Stein fibres and the relative primitive comparison, never a vanishing of the cohomology of proper fibres. Mantovan's formula, the filtration of the cohomology by Igusa and local Shimura contributions, is recorded for Koshikawa's argument.

Imports from other roadmaps in this layer: `AbelianSchemesAndArithmeticModuli:A4`, `AdicEtaleGeometry:A1/finite-etale-tower`, `AdicEtaleGeometry:A1/pro-etale-site-corrected`, `AdicEtaleGeometry:A2/relative-dimension-rank-one-fibres`, `AdicSpacesPartII:F0/locally-noetherian-formal-scheme`, `AdicSpacesPartII:R2/admissible-formal-scheme`, `AdicSpacesPartII:R2/formal-etale-site-invariance`, `BunGAndNewtonStrata:BG1`, `BunGAndNewtonStrata:BG1/partial-order-on-B-of-G`, `BunGAndNewtonStrata:BG2:uniformization/semicontinuity-and-local-constancy`, `BunGAndNewtonStrata:BG3`, `ClassicalAdicEtaleCohomology:H0/geometric-stalks-at-field-pairs`, `ClassicalAdicEtaleCohomology:H0/overconvergent-etale-sheaves`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/formal-nearby-cycles-comparison`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/scheme-completion-comparison-3-5-13`, `DiamondEtaleCohomology:C0/etale-cohomology-continuity`, `DiamondEtaleCohomology:C0/etale-site`, `DiamondEtaleCohomology:C0/quasi-pro-etale-site`, `DiamondEtaleCohomology:C4/canonical-compactification`, `DiamondEtaleCohomology:C4/canonical-compactification-universal`, `DiamondEtaleCohomology:C4/relative-compactification-properties`, `DiamondEtaleCohomology:C8/partially-proper-dimension`, `DiamondSixOperations:S1/qcqs-diamond-continuity`, `DiamondsAndVStacks:D5`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/dieudonne-p-divisible`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/dieudonne-slopes`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/isogeny-classification`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6/abelian-scheme-torsion-finite-flat`, `HeckeStacksAndLocalShtukas:HS2/levels-and-tower-limit`, `HeckeStacksAndLocalShtukas:HS2/minuscule-rigidification`, `HodgeTateAndCanonicalSubgroups:T1`, `HodgeTateAndCanonicalSubgroups:T2`, `LefschetzPencilsAndVanishingCycles:LPV.0/derived-functorialities-and-specialization-sequence`, `LefschetzPencilsAndVanishingCycles:LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle`, `NeronModelsAndSemistableAbelianVarieties:R11.3/raynaud-extension-comparison`, `PadicHodgeTheory:P8`, `PerfectoidShimuraVarieties:S0/infinite-level-diamond`, `PerfectoidShimuraVarieties:S1/perfectoid-toroidal-siegel-tower`, `PerfectoidShimuraVarieties:S1/rational-flags-preimage`, `PerfectoidShimuraVarieties:S2/hodge-genuine-minimal-perfectoid-tower`, `PerfectoidShimuraVarieties:S3/hodge-compactified-period-maps`, `PerfectoidShimuraVarieties:S3/hodge-open-period-map`, `PerfectoidShimuraVarieties:S3/levi-torsor-over-flag-variety`, `PerfectoidShimuraVarieties:S4/preabelian-minimal-perfectoid`, `PerfectoidShimuraVarieties:S6/general-toroidal-period-map`, `PerfectoidShimuraVarieties:S6/minimal-toroidal-period-map-compatibility`, `PerfectoidSpaces:P0/almost-basic-setup`, `PerfectoidSpaces:P1/tilting-equivalence-and-explicit-tilt`, `PerfectoidSpaces:P2/perfectoid-space`, `PerfectoidSpaces:P2/sheaf-theorem-and-almost-acyclicity`, `PerfectoidSpaces:P7/perfectoid-tilde-limit`, `SchemeAndStackFoundations:SF.4`, `ShimuraCompactifications:C4/degeneration-effectivity`, `ShimuraCompactifications:C4/formal-universal-degeneration`, `ShimuraCompactifications:C4/polarized-degeneration-data`, `ShimuraCompactifications:C5/formal-completion`, `ShimuraCompactifications:C5/higher-level-toroidal-normalization`, `ShimuraCompactifications:C5/integral-toroidal-space`, `SmoothRepresentationsOfLocalGroups:SR.0`, `SmoothRepresentationsOfLocalGroups:SR.2`, `VectorBundlesAndIsocrystals:VB0/dieudonne-manin-isocrystals`, `VectorBundlesAndIsocrystals:VB2`, `VectorBundlesAndIsocrystals:VB2:classification/dieudonne-manin-classification-of-bundles`.

### `good-reduction-locus` — The good-reduction locus S° and its infinite-level tower (CSnc §2.6)

Declaration `IgusaVarietiesAndTorsionConcentration:IG.3/good-reduction-locus` (construction). Suggested home: `TauCeti/ShimuraVarieties/Igusa/GoodReduction` (`TauCeti.Igusa`).

Inside the adic space S_{K(N),ℚ_p} attached to S_{K(N)} ⊗ ℚ_p, the good-reduction locus S°_{K(N),ℚ_p} is the locus of points where the universal abelian variety has good reduction; it is a Hecke-equivariant quasicompact open subspace, equal for p ∤ NΔ_F to the adic generic fibre of the p-adic completion of S_{K(N)} ⊗ ℤ_p. At infinite level, S°_{K(p^∞N)} := lim_m S°^◇_{K(p^mN),ℚ_p} is representable by a perfectoid space (Scholze, Theorem 4.1.1), open in S^*_{K(p^∞N)}, and the Hodge–Tate period map restricts to π°_HT : S°_{K(p^∞N)} → Fℓ. Here S^*_{K(p^∞N)} = lim_m S^{*,◇}_{K(p^mN),ℚ_p} and S^tor_{K(p^∞N)} = lim_m S^{tor,◇}_{K(p^mN),ℚ_p} (limits of spatial diamonds), both representable by perfectoid spaces (S^tor for a cofinal choice of Σ).

Hypotheses:

- p unramified in F, N ≥ 3 prime to p, Σ as in CSnc Remark 2.5.6; C a complete algebraically closed nonarchimedean extension of ℚ_p with ring of integers O_C, residue field k and a fixed section k → O_C/p.

Proof or construction:

1. Define S° as the set of points whose abelian variety extends to the valuation ring (good reduction); quasicompact openness via the formal model at good primes (adic generic fibre of the completion).
2. Infinite level: limits of spatial diamonds along qcqs maps exist and are spatial (PerfectoidShimuraVarieties S0); perfectoidness from Scholze's theorem for the minimal compactification and Bhatt–Scholze for the normalized tower (PerfectoidShimuraVarieties S1–S4), and Pilloni–Stroh for the toroidal tower (S6).
3. Hecke equivariance: prime-to-p Hecke correspondences preserve good reduction.

Uses:

- IG.3/good-reduction-locus-cohomology: the good-reduction locus carries all the cohomology of the Shimura variety
- IG.3/open-fibre-theorem: the fibres of π°_HT on S° are open Igusa varieties
- IG.7/only-ordinary-contributes: H^i(S°_{K(p^∞N),C}, 𝔽_ℓ)_𝔪 is computed through Rπ°_HT*

API:

- `goodReductionLocus` (constructor): S°_{K(N),ℚ_p} ⊂ S_{K(N),ℚ_p}, quasicompact open.
- `goodReductionLocus_eq_genericFibre` (characterisation): For p ∤ NΔ_F it is the adic generic fibre of the p-adic completion of S_{K(N)} ⊗ ℤ_p.
- `goodReductionLocus_hecke` (functoriality): Stable under prime-to-p Hecke correspondences and the transition maps in p-level.
- `goodReductionLocus_infinite` (constructor): S°_{K(p^∞N)} = lim S°^◇_{K(p^mN)}, a perfectoid space open in S^*_{K(p^∞N)}.
- `goodReductionLocus_piHT` (projection): The restriction π°_HT of π^*_HT.

Unit tests:

- `goodReductionLocus_supersingular` (computation): S° is not the tube of the ordinary locus: for the modular curve (F imaginary quadratic, n = 1, p split), the residue discs of the supersingular points of the special fibre lie in S°.
- `goodReductionLocus_modular` (computation): For the modular-curve case the complement of S° in S_{ℚ_p} is the union of the open residue discs at the cusps.
- `goodReductionLocus_not_closed` (non-example): S° is not closed in S_{ℚ_p} when the Shimura variety is non-compact.

Acceptance:

- For n = 1 and F imaginary quadratic, S°_{K(N)} is the complement in the analytified modular-type curve of the residue discs of the cusps.

Depends on: `integral-model`, `PerfectoidShimuraVarieties:S0/infinite-level-diamond`, `PerfectoidShimuraVarieties:S2/hodge-genuine-minimal-perfectoid-tower`, `PerfectoidShimuraVarieties:S4/preabelian-minimal-perfectoid`, `PerfectoidShimuraVarieties:S1/perfectoid-toroidal-siegel-tower`, `PerfectoidShimuraVarieties:S3/hodge-open-period-map`, `PerfectoidShimuraVarieties:S3/hodge-compactified-period-maps`, `SchemeAndStackFoundations:SF.4`, `AdicSpacesPartII:F0/locally-noetherian-formal-scheme`, `AdicSpacesPartII:R2/admissible-formal-scheme`, `AdicSpacesPartII:R2/formal-etale-site-invariance`.

Used by: `good-reduction-locus-cohomology`, `open-fibre-theorem`, `period-map-on-boundary`, `finite-level-formal-models`, `semiperversity`.

Sources:

- CSnc §2.6, p. 31 (csnc): “where the universal abelian variety has good reduction. This is a Hecke-equivariant quasicompact open subspace. If p is a prime of good reduction, this can also be deﬁned as the adic generic ﬁbre of the p-adic completion SK(N),Zp” — Defines the good-reduction locus and its infinite-level tower.
- CSnc §2.6, Theorem 2.6.2, p. 30 (csnc): “Theorem 2.6.2. The diamonds S∗ K(p∞N) and, for a cofinal choice of cone decompositions Σ, Stor K(p∞N) are representable by perfectoid spaces. Proof. In [Sch15,” — Perfectoidness of the infinite-level compactified Shimura varieties.

### `good-reduction-locus-cohomology` — The good-reduction locus carries all the cohomology (CSnc Proposition 2.6.4)

Declaration `IgusaVarietiesAndTorsionConcentration:IG.3/good-reduction-locus-cohomology` (theorem).

Let C be a complete algebraically closed extension of ℚ_p and N ≥ 3 prime to p. The natural Hecke-equivariant map H^i(S_{K(N),ℚ̄}, 𝔽_ℓ) → H^i(S°_{K(N),C}, 𝔽_ℓ) is an isomorphism for every i and every ℓ ≠ p. (Lan–Stroh prove it for every N ≥ 3, also divisible by p; only N prime to p is used and planned here.)

Hypotheses:

- p unramified in F, N ≥ 3 prime to p, Σ as in CSnc Remark 2.5.6; C a complete algebraically closed nonarchimedean extension of ℚ_p with ring of integers O_C, residue field k and a fixed section k → O_C/p.
- ℓ ≠ p.

Proof or construction:

1. For N prime to p, S_{K(N)} ⊗ ℤ_p has a toroidal compactification with relative normal-crossings boundary (ShimuraCompactifications C5), so H^i(S_{K(N),ℚ̄}, 𝔽_ℓ) ≅ H^i(S_{K(N),k}, Rψ𝔽_ℓ) (nearby cycles commute with the boundary for tame normal crossings; Lan–Stroh, Nearby cycles of automorphic étale sheaves, Cor. 5.20, cited in CSnc as "[LS18a, Corollary 5.20]", sourceIssues IgusaVarietiesAndTorsionConcentration/E8).
2. H^i(S°_{K(N),C}, 𝔽_ℓ) → H^i(S_{K(N),k}, Rψ𝔽_ℓ) is an isomorphism by Huber's comparison of algebraic and adic nearby cycles [Hub96, Thm 3.5.13].
3. Conclude by invariance of nearby cycles and cohomology under extension of algebraically closed fields.

Acceptance:

- For S proper over ℤ_p this is proper base change.

Depends on: `good-reduction-locus`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/scheme-completion-comparison-3-5-13`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/formal-nearby-cycles-comparison`, `ShimuraCompactifications:C5/integral-toroidal-space`, `ShimuraCompactifications:C5/formal-completion`, `ShimuraCompactifications:C5/higher-level-toroidal-normalization`, `LefschetzPencilsAndVanishingCycles:LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle`, `LefschetzPencilsAndVanishingCycles:LPV.0/derived-functorialities-and-specialization-sequence`.

Used by: `mantovan-formula`, `level-descent`.

Sources:

- CSnc §2.6, Proposition 2.6.4, p. 31 (csnc): “Proposition 2.6.4. Let C be a complete algebraically closed extension of Qp. For any N ≥ 3 (not necessarily prime to p), the natural Hecke-equivariant map Hi (SK(N),Q,Fℓ) → Hi (S◦ K(N),C,Fℓ) 11We” — Statement of the good-reduction comparison.
- CSnc §2.6, proof of Proposition 2.6.4, p. 32 (csnc): “by the comparison of nearby cycles in the algebraic and adic setting, [Hub96, Theorem 3.5.13]. We conclude by” — Uses Huber's Theorem 3.5.13.
- Corollary 5.20, p. 25 of the authors' compilation (ls18b): “Corollary 5.20. We have canonical isomorphisms ∼ (5.21) RΓ((XH )η̄ , V) → RΓ((XH )s̄ , RΨXH (V)) and ∼ (5.22) RΓc ((XH )s̄ , RΨXH (V)) → RΓc ((XH )η̄ , V), which are compatible with their natural continuous Gal(K̄/K)-actions.” — Lan–Stroh Corollary 5.20: cohomology of the generic fibre through nearby cycles on the (possibly non-proper) integral model.

### `flag-points-and-p-divisible-groups` — Flag points give p-divisible groups with G-structure over O_C and their Newton points (Scholze–Weinstein Theorem B with PEL structure)

Declaration `IgusaVarietiesAndTorsionConcentration:IG.3/flag-points-and-p-divisible-groups` (theorem).

Let Fℓ be the adic space over ℚ_p attached to the flag variety of totally isotropic F-linear subspaces of V. For C as above, points x ∈ Fℓ(C) correspond bijectively to isomorphism classes of pairs (𝒳_{O_C}, α) with 𝒳_{O_C} a p-divisible group with G-structure over O_C and α : T_p𝒳_{O_C} ≅ L ⊗ ℤ_p an isomorphism compatible with G-structures; the subspace is the Hodge–Tate filtration Lie 𝒳 ⊗ C(1) ⊂ T_p𝒳 ⊗ C. The special fibre X_k = 𝒳_{O_C} ⊗ k is a p-divisible group with G-structure over k, whose isogeny class defines b(x) ∈ B(G_{ℚ_p}, μ^{−1}). The filtration 𝒳^μ ⊂ 𝒳° ⊂ 𝒳 transported by α is a symplectic O_F-linear filtration of L ⊗ ℤ_p; fixing a symplectic splitting δ gives a splitting δ_{𝒳} of 𝒳 and δ_X of X.

Hypotheses:

- p unramified in F, N ≥ 3 prime to p, Σ as in CSnc Remark 2.5.6; C a complete algebraically closed nonarchimedean extension of ℚ_p with ring of integers O_C, residue field k and a fixed section k → O_C/p.

Proof or construction:

1. Scholze–Weinstein [SW13, Thm B]: p-divisible groups over O_C are equivalent to pairs (T, W) with T finite free over ℤ_p and W ⊂ T ⊗ C(−1) a C-subspace (requested from HodgeTateAndCanonicalSubgroups T2, the owner of the Hodge–Tate period of p-divisible groups).
2. PEL adapter: O_F-actions and principal polarizations on 𝒳 correspond to O_F-actions and perfect alternating forms on T preserving W with W totally isotropic of the right rank (Lie condition); with α : T ≅ L ⊗ ℤ_p this is a point of Fℓ(C).
3. b(x): the isocrystal of X_k with G-structure (IG.0/newton-map) lies in B(G_{ℚ_p}, μ^{−1}).

Acceptance:

- For x ∈ Fℓ(ℚ_p) (rational flags), 𝒳_{O_C} is ordinary: b(x) is the ordinary class (CSnc §2.7).

Depends on: `g-structure`, `newton-map`, `HodgeTateAndCanonicalSubgroups:T2`, `PerfectoidShimuraVarieties:S3/levi-torsor-over-flag-variety`.

Used by: `local-period-surjective-on-stratum`, `open-fibre-theorem`, `pdiv-constant-mod-p-epsilon`, `toroidal-fibre-theorem`.

Sources:

- CSnc §4.1, p. 51 (csnc): “which by [SW13, Theorem B] gives rise to a p-divisible group XOC with G-structure over OC, equipped with an isomorphism α : Tp(XOC ) ∼ = L⊗Z Zp compatible with G-structures. Associated to the special ﬁbre Xk, we get the perfect” — Points of the flag variety give p-divisible groups with G-structure and a trivialized Tate module.
- CSnc §2.7, p. 33 (csnc): “In particular, the special ﬁber Xk deﬁnes a p-divisible group with G-structure, and this is classiﬁed up to isogeny by an element b = b(x) ∈ B(GQp ,µ−1 ). The following theorem asserts that this” — The Newton point b(x) of a flag point.

### `flag-newton-strata-dimension` — Dimension of the Newton strata of the flag variety: dim Fℓ^b = d − d_b (CS17 Proposition 4.2.23; CSnc Theorem 2.7.3) ★

Declaration `IgusaVarietiesAndTorsionConcentration:IG.3/flag-newton-strata-dimension` (theorem). Planet: Dimension of flag Newton strata.

Let Fℓ = ⊔_{b ∈ B(G_{ℚ_p}, μ^{−1})} Fℓ^b be the Newton stratification (x ∈ Fℓ^b(C) iff b(x) = b), with locally closed partially proper strata and Fℓ^{≥b} closed (BunGAndNewtonStrata BG3). Then the Krull dimension of |Fℓ^b| is ⟨2ρ, μ⟩ − ⟨2ρ, ν_b⟩ = d − d_b, where d = [F⁺:ℚ]n² and d_b = ⟨2ρ, ν_b⟩ = dim Ig^b. Since the reflex field is ℚ, the ordinary element is the largest in B(G_{ℚ_p}, μ^{−1}) and Fℓ^{ord} = Fℓ(ℚ_p) is 0-dimensional; d_{b′} ≥ d_b whenever b′ ≥ b.

Hypotheses:

- p unramified in F, N ≥ 3 prime to p, Σ as in CSnc Remark 2.5.6; C a complete algebraically closed nonarchimedean extension of ℚ_p with ring of integers O_C, residue field k and a fixed section k → O_C/p.
- Unramified PEL data of type (A) or (C) (for the local argument).

Proof or construction:

1. Fℓ_{G,μ} and M_{D,∞} are partially proper of dimension ⟨2ρ, μ⟩ (IG.3/local-hodge-tate-period-map, with the dimension theory of partially proper adic spaces: DiamondEtaleCohomology C8, CS17 Props. 4.2.19–4.2.21).
2. For a rank-one point x ∈ M_{D,∞} over y ∈ Fℓ^b, the fibre of π^b_HT is an Aut_G(X̃_b)^ad_η-orbit (IG.3/local-period-fibres) of dimension ⟨2ρ, ν_b⟩ (IG.3/automorphism-group-dimension); π^b_HT is surjective on rank-one points (IG.3/local-period-surjective-on-stratum).
3. Hence dim Fℓ^b + ⟨2ρ, ν_b⟩ = ⟨2ρ, μ⟩ (both inequalities, the converse with y chosen in Fℓ^b, correcting sourceIssues PAPER-CARAIANI-SCHOLZE-17/E7).
4. Ordinary stratum: Wedhorn [Wed99, Thm 1.6.3] for maximality (BG1 order), and Fℓ^{ord} = Fℓ(ℚ_p) ([CGH+20, Prop. 3.3.8]; PerfectoidShimuraVarieties S1 rational flags).

Acceptance:

- For n = 1, F imaginary quadratic: Fℓ = ℙ¹, Fℓ^{ord} = ℙ¹(ℚ_p) of dimension 0 = d − d_{ord} with d = d_{ord} = 1, and the basic stratum (Drinfeld upper half plane) has dimension 1 = d − 0.

Depends on: `local-hodge-tate-period-map`, `local-period-fibres`, `automorphism-group-dimension`, `local-period-surjective-on-stratum`, `BunGAndNewtonStrata:BG3`, `BunGAndNewtonStrata:BG2:uniformization/semicontinuity-and-local-constancy`, `BunGAndNewtonStrata:BG1`, `BunGAndNewtonStrata:BG1/partial-order-on-B-of-G`, `DiamondEtaleCohomology:C8/partially-proper-dimension`, `AdicEtaleGeometry:A2/relative-dimension-rank-one-fibres`, `PerfectoidShimuraVarieties:S1/rational-flags-preimage`.

Used by: `compact-minimal-stratum-concentration`, `minimal-stratum-lower-bound`, `only-ordinary-contributes`.

Sources:

- CS17 §4.2, Proposition 4.2.23, p. 713 (cs17): “Proposition 4.2.23.The dimension of F`b G,µ is equal to h2ρ,µi−h2ρ,νbi. Proof. Both F`G,µ and MD,∞ are” — The dimension formula for the Newton strata of the flag variety.
- CSnc §2.7, Theorem 2.7.3, p. 33 (csnc): “The dimension of Fℓb (i.e., the Krull dimension of the locally spectral space |Fℓb |) is given by d − db. Moreover, the” — The dimension d − d_b in the non-compact paper, quoted from CS17.
- CSnc §2.7, p. 33 (csnc): “Since the reﬂex ﬁeld of the Shimura datum is Q, the largest element of B(GQp ,µ−1 ) is the ordinary one, cf. [Wed99, Theorem 1.6.3]. We have Fℓord = Fℓ(Qp) (see, for example, [CGH+ 20, Proposition 3.3.8]) and in” — The ordinary stratum is the rational flags, of dimension 0.

### `local-hodge-tate-period-map` — Rapoport–Zink spaces at infinite level and the local Hodge–Tate period map (CS17 Definition 4.2.3, Theorem 4.2.4, Propositions 4.2.5–4.2.6) ★

Declaration `IgusaVarietiesAndTorsionConcentration:IG.3/local-hodge-tate-period-map` (construction). Planet: Local Hodge–Tate period map. Suggested home: `TauCeti/ShimuraVarieties/Igusa/LocalPeriodMap` (`TauCeti.Igusa`).

For an unramified local PEL datum D^int, let M_{D^int} = (𝔐_{D^int})^ad_η and, for n ≥ 0, M_{D^int,n} the finite étale covers parametrizing O_B-linear Λ/p^n → G[p^n]^ad_η matching the pairings (with ζ_{p^n} fixed). M_{D^int,∞} sends a complete affinoid (Ĕ(ζ_{p^∞}), O)-algebra (R, R⁺) to triples (G, ρ, α) with (G, ρ) ∈ M_{D^int}(R, R⁺) and α : Λ → T_pG^ad_η(R, R⁺) an O_B-linear map matching the pairing and an isomorphism at all geometric points. (1) M_{D^int,∞} is representable by an adic space, preperfectoid, with M_{D^int,∞} ∼ lim_n M_{D^int,n}; it depends only on D (write M_{D,∞}) and is the sheafification of B-linear maps V → (X̃_b)^ad_η(R, R⁺) matching the polarization, with totally isotropic image in D(X_b)[1/p] ⊗ R, locally free quotient W locally ≅ V₁ ⊗ R, and exact 0 → V → X̃_b(C, C⁺) → W ⊗ C → 0 at geometric points. (2) There is a G(ℚ_p)-equivariant local Hodge–Tate period map π_HT : M_{D,∞} → Fℓ_{G,μ} (Fℓ_{G,μ} parametrizing B-equivariant quotients V ⊗ R → W′ with totally isotropic kernel, W′ locally ≅ V₀ ⊗ R), sending a point to the kernel of V ⊗ R → D(X_b)[1/p] ⊗ R. (3) π_HT factors through the b-stratum: π^b_HT : M_{D,∞} → Fℓ^b_{G,μ}.

Hypotheses:

- Unramified local PEL datum of type (A) or (C).

Proof or construction:

1. Closed subfunctor of the Scholze–Weinstein space M_∞ for X_b without extra structure (preperfectoid by [SW13, Thm 6.3.4, Prop. 2.3.7], rational description by [SW13, Lemma 6.3.6, Prop. 3.4.2(v)]); the O_B-action and polarization conditions are closed by Grothendieck–Messing, and the isogeny condition open and closed (with the corrected third condition of sourceIssues PAPER-CARAIANI-SCHOLZE-17/E37).
2. The local period map is the quasi-logarithm image; equivariance is clear from the moduli description.
3. Factoring through Fℓ^b: the G-bundle ℰ_V obtained by modifying V ⊗ O at ∞ by the lattice Ξ with Ξ/(V ⊗ B⁺_dR) = Lie G ⊗ C is the bundle of G ×_{O_C} O_C/p ([SW13, proof of Prop. 5.1.6]), isomorphic to ℰ_b via ρ (citing CS17 Corollary 3.5.9; sourceIssues PAPER-CARAIANI-SCHOLZE-17/E6).

Uses:

- IG.3/product-formula: the fibre of π_HT over a flag point is a fibre product of the Igusa variety with M^b_∞ over Fℓ_{G,μ}
- IG.3/flag-newton-strata-dimension: dimension count dim Fℓ^b = ⟨2ρ, μ⟩ − ⟨2ρ, ν_b⟩
- IG.3/compact-fibre-theorem: lifting a flag point to M^b_∞ fixes the isomorphism of the stalk with Igusa cohomology

API:

- `RZSpaceInfinite` (constructor): M_{D,∞}, a preperfectoid adic space over Spa(Ĕ(ζ_{p^∞})).
- `RZSpaceInfinite.tilde_lim` (characterisation): M_{D,∞} ∼ lim_n M_{D^int,n}.
- `RZSpaceInfinite.rational_description` (equivalence): The description through B-linear maps V → X̃_b^ad_η with conditions (1)–(3).
- `localHodgeTate` (constructor): π_HT : M_{D,∞} → Fℓ_{G,μ}, G(ℚ_p)-equivariant.
- `localHodgeTate_mem_stratum` (characterisation): π_HT(M_{D,∞}) ⊂ Fℓ^b_{G,μ}.
- `RZSpaceInfinite.groupActions` (functoriality): Commuting actions of G(ℚ_p) (on α) and J_b(ℚ_p) (on ρ); π_HT is J_b(ℚ_p)-invariant.

Unit tests:

- `localHodgeTate_etale` (degenerate): For μ trivial (X_b étale, no deformations) Fℓ_{G,μ} is a point and π_HT is constant.
- `localHodgeTate_lubinTate` (computation): For GL₂ with μ = (1, 0) and b basic, π_HT maps M_{LT,∞} onto the Drinfeld upper half plane Ω ⊂ ℙ¹ = Fℓ.
- `localHodgeTate_not_surjective_Fl` (non-example): π_HT is not surjective onto Fℓ_{G,μ}: its image is the single stratum Fℓ^b.

Acceptance:

- For the Lubin–Tate datum, π_HT : M_{LT,∞} → ℙ^{n−1} is the Gross–Hopkins-dual Hodge–Tate map with image the Drinfeld space complement structure of Scholze–Weinstein.

Depends on: `pel-rapoport-zink-space`, `unramified-local-pel-datum`, `sw-infinite-level-rz-space`, `PerfectoidShimuraVarieties:S3/levi-torsor-over-flag-variety`, `BunGAndNewtonStrata:BG3`, `BunGAndNewtonStrata:BG2:uniformization/semicontinuity-and-local-constancy`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/dieudonne-p-divisible`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/dieudonne-slopes`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/isogeny-classification`, `VectorBundlesAndIsocrystals:VB0/dieudonne-manin-isocrystals`.

Used by: `flag-newton-strata-dimension`, `local-period-fibres`, `local-period-surjective-on-stratum`, `infinite-level-newton-space`, `product-formula`, `newton-strata-correspond`.

Sources:

- CS17 §4.2, Theorem 4.2.4, p. 699 (cs17): “Theorem 4.2.4. The functor MDint,∞ is representable by an adic space over Spa(Ĕ(ζp∞),OĔ(ζp∞)). The space MDint,∞ is preperfectoid, and MDint,∞ ∼ lim ← − n MDint,n. Moreover, there is the following” — Representability and preperfectoidness of the infinite-level Rapoport–Zink space.
- CS17 §4.2, Proposition 4.2.5, p. 702 (cs17): “Proposition 4.2.5. There is a local Hodge-Tate period map πHT : MD,∞ → F`G,µ, sending an (R,R+)-valued point” — The local Hodge–Tate period map.
- CS17 §4.2, Proposition 4.2.6, p. 702 (cs17): “Proposition 4.2.6. The local Hodge-Tate period map factors through πb HT : MD,∞ → F`b G,µ. Proof.” — Factorisation through the b-stratum.

### `local-period-fibres` — Fibres of the local Hodge–Tate period map are Aut_G(X̃_b)-orbits (CS17 Proposition 4.2.14)

Declaration `IgusaVarietiesAndTorsionConcentration:IG.3/local-period-fibres` (theorem).

Aut_G(X̃_b) acts on 𝔐_{D^int}; the action of its adic generic fibre Aut_G(X̃_b)^ad_η on M_{D^int} extends to M_{D,∞}, and π^b_HT is invariant. The action map M̂_{D,∞} ×_{Spa(L,O_L)} Aut_G(X̃_b)^ad_η → (M_{D,∞} ×_{Fℓ_{G,μ}} M_{D,∞})^∧ is an isomorphism of perfectoid spaces, where M̂_{D,∞} and (M_{D,∞} ×_{Fℓ} M_{D,∞})^∧ are the perfectoid spaces attached to the preperfectoid spaces.

Hypotheses:

- Unramified local PEL datum of type (A) or (C); fibre products taken over a common base field (corrected in sourceIssues PAPER-CARAIANI-SCHOLZE-17/E44).

Proof or construction:

1. Two points of M_{D,∞} with the same Hodge–Tate period give p-divisible groups over R⁺ with the same (T, W) data on geometric rank-one points; by Scholze–Weinstein Theorem B they are isomorphic over O_C, and IG.3/integral-extension-lemma extends the isomorphism over R⁺.
2. Thus the difference of the two quasi-isogenies to X_b is a quasi-self-isogeny of X_b over R⁺/p, i.e. a point of Aut_G(X̃_b).
3. The perfectoid spaces are strong completions of preperfectoid spaces [SW13, Props. 2.3.6–2.3.7]; the paper does not show that the target is a torsor in any topology.

Acceptance:

- For b basic, Aut_G(X̃_b)^ad_η = J_b(ℚ_p) and the fibres are J_b(ℚ_p)-orbits.

Depends on: `local-hodge-tate-period-map`, `automorphism-group-of-universal-cover`, `integral-extension-lemma`, `HodgeTateAndCanonicalSubgroups:T2`, `PerfectoidSpaces:P2/perfectoid-space`, `PerfectoidSpaces:P2/sheaf-theorem-and-almost-acyclicity`, `PerfectoidSpaces:P7/perfectoid-tilde-limit`.

Used by: `flag-newton-strata-dimension`.

Sources:

- CS17 §4.2, Proposition 4.2.14, p. 709 (cs17): “Proposition 4.2.14. The action map ” MD,∞ ×Spa(L,OL) AutG(‹ Xb)ad η → (MD,∞ ×F`G,µ MD,∞)∧ is an isomorphism of perfectoid spaces. Proof. Let (R,R+) be a perfectoid affinoid algebra over Ĕ.20 We have” — The action map is an isomorphism onto the fibre product over the flag variety.

### `integral-extension-lemma` — Extending morphisms of p-divisible groups over R⁺ from rank-one points (CS17 Lemma 4.2.15)

Declaration `IgusaVarietiesAndTorsionConcentration:IG.3/integral-extension-lemma` (lemma).

Let R⁺ be a ℤ_p-algebra integrally closed in R = R⁺[1/p], and G, H p-divisible groups over R⁺ whose Newton polygons at points of Spec(R⁺/p) are constant. A morphism f_R : G_R → H_R over R extends (necessarily uniquely) to f : G → H over R⁺ if and only if for every geometric rank-one point Spa(C, O_C) of Spa(R, R⁺) the base change f_C extends to O_C.

Hypotheses:

- R⁺ integrally closed in R⁺[1/p]; constant Newton polygons.

Proof or construction:

1. R⁺ = {f ∈ R : |f(x)| ≤ 1 for all x ∈ Spa(R, R⁺)}, so integrality of matrix coefficients is checked at valuations; reduce to a valuation ring.
2. Over the valuation ring C⁺, reduce modulo the maximal ideal of O_C to the characteristic-p valuation ring C⁺/𝔪_{O_C} and apply IG.0/berthelot-without-noetherian.

Acceptance:

- For R⁺ = O_C the condition is tautological.

Depends on: `berthelot-without-noetherian`, `mathlib:ValuationRing`.

Used by: `local-period-fibres`, `automorphism-group-dimension`, `product-formula`.

Sources:

- CS17 §4.2, Lemma 4.2.15, p. 709 (cs17): “Lemma 4.2.15. Let R+ be a Zp-algebra that is integrally closed in R = R+[1/p]. Let G, H be p-divisible groups over R+. Assume that the Newton polygon of Gs is independent of s ∈ Spec(R+/p) and that” — States the extension criterion.

### `local-period-surjective-on-stratum` — Surjectivity of the local period map onto the b-stratum on (C, O_C)-points (CS17 Lemma 4.2.18)

Declaration `IgusaVarietiesAndTorsionConcentration:IG.3/local-period-surjective-on-stratum` (theorem).

For C/Ĕ(ζ_{p^∞}) complete algebraically closed, π^b_HT : M_{D,∞}(C, O_C) → Fℓ^b_{G,μ}(C, O_C) is surjective.

Hypotheses:

- Unramified local PEL datum of type (A) or (C).

Proof or construction:

1. A point x ∈ Fℓ^b(C) gives, by IG.3/flag-points-and-p-divisible-groups (Scholze–Weinstein Theorem B), a p-divisible group 𝒢 over O_C with trivialized Tate module, O_B-action and principal polarization.
2. Its G-bundle is ℰ_x ≅ ℰ_b (x ∈ Fℓ^b), so by the classification of p-divisible groups over O_C/p up to isogeny through bundles on the Fargues–Fontaine curve (CS17 Theorem 4.1.4) there is a quasi-isogeny ρ : X_b ⊗ O_C/p → 𝒢 ⊗ O_C/p; (𝒢, ρ, α) is the preimage.

Acceptance:

- For b ordinary, every rational flag lifts to the ordinary Rapoport–Zink space at infinite level.

Depends on: `local-hodge-tate-period-map`, `flag-points-and-p-divisible-groups`, `VectorBundlesAndIsocrystals:VB2`, `VectorBundlesAndIsocrystals:VB2:classification/dieudonne-manin-classification-of-bundles`.

Used by: `flag-newton-strata-dimension`, `newton-strata-correspond`, `compact-fibre-theorem`.

Sources:

- CS17 §4.2, Lemma 4.2.18, p. 711 (cs17): “Lemma 4.2.18. Let C/Ĕ(ζp∞) be a complete algebraically closed extension with ring of integers OC. Then the map πb HT : MD,∞(C,OC) → F`b G,µ(C,OC) is” — Surjectivity on (C, O_C)-points.

### `automorphism-group-dimension` — The adic generic fibre of Aut_G(X̃_b) is partially proper of dimension ⟨2ρ, ν_b⟩ (CS17 Proposition 4.2.22)

Declaration `IgusaVarietiesAndTorsionConcentration:IG.3/automorphism-group-dimension` (theorem).

For every complete nonarchimedean field K over O_Ĕ, Aut_G(X̃_b)^ad ×_{Spa(O_Ĕ)} Spa(K, O_K) is partially proper over Spa(K, O_K), of dimension ⟨2ρ, ν_b⟩; each connected component is Spa(O_Ĕ[[x₁^{1/p^∞}, …, x_d^{1/p^∞}]]) ×_{Spa O_Ĕ} Spa(K, O_K), topologically (after tilting) a d-dimensional open unit disc.

Hypotheses:

- Unramified local PEL data of type (A) or (C); K of characteristic 0 (the case of characteristic p needs a separate argument, sourceIssues PAPER-CARAIANI-SCHOLZE-17/E47).

Proof or construction:

1. Partial properness: a quasi-self-isogeny over Spa(C, O_C) extending to Spa(C, C⁺) respects the extra structures there (IG.3/integral-extension-lemma and IG.0/berthelot-without-noetherian).
2. Dimension: from IG.0/structure-of-automorphism-group and the dimension theory of partially proper adic spaces (DiamondEtaleCohomology C8).

Acceptance:

- For b basic the dimension is 0.

Depends on: `structure-of-automorphism-group`, `integral-extension-lemma`, `DiamondEtaleCohomology:C8/partially-proper-dimension`, `AdicEtaleGeometry:A2/relative-dimension-rank-one-fibres`.

Used by: `flag-newton-strata-dimension`.

Sources:

- CS17 §4.2, Proposition 4.2.22, p. 712 (cs17): “Proposition 4.2.22. For any complete nonarchimedean field K/OĔ, the space AutG(‹ Xb)ad ×Spa(OĔ,OĔ) Spa(K,OK) is partially proper over Spa(K,OK), of” — Partial properness and dimension of the automorphism group.

### `canonical-lift-of-igusa` — The canonical formal lift of the perfect Igusa variety and the space 𝔛^b (CS17 Lemmas 4.3.10, 4.3.12, Definition 4.3.11; CSnc §4.3) ★

Declaration `IgusaVarietiesAndTorsionConcentration:IG.3/canonical-lift-of-igusa` (construction). Planet: Canonical lift of the Igusa variety. Suggested home: `TauCeti/ShimuraVarieties/Igusa/CanonicalLift` (`TauCeti.Igusa`).

Being perfect, Ig^b (and Ig^{X,tor}, Ig^{X,*}) lifts uniquely to a flat p-adic formal scheme W(Ig^b) over W(k) = O_Ĕ (apply Witt vectors to an affine cover and glue); for K/Ĕ complete, Ig^b_{O_K} := W(Ig^b) ⊗_{W(k)} O_K, and similarly Ig^{X,tor}_{O_C} := W(Ig^{X,tor}) ×_{W(k)} O_C, the unique flat formal lift of Ig^{X,tor}_{O_C/p^ε}. On Nilp_{O_Ĕ}, Ig^b_{O_Ĕ} parametrizes abelian varieties with G-structure up to p-power isogeny with an isomorphism of the universal cover of A[p^∞] with that of the canonical lift of X_b. Fixing a lift (X_b)_{O_K} ∈ 𝔐^b(O_K) of X_b (exists with K = Ĕ by formal smoothness), Ig^b_{O_K}(R) = {(A, ρ) : ρ : A[p^∞] ≅ (X_b)_{O_K} ⊗ R} for R ∈ Nilp_{O_K}. The functor 𝔛^b on Nilp_{O_Ĕ} of pairs (A, ρ) with A ∈ S_{K_pK^p}(R) and ρ : A[p^∞] ⊗ R/p → X_b ⊗ R/p a quasi-isogeny with extra structures satisfies 𝔛^b_{O_K} ≅ Ig^b_{O_K} ×_{O_Ĕ} 𝔐^b (Lemma 4.3.12), with base Nilp_{O_Ĕ} (sourceIssues PAPER-CARAIANI-SCHOLZE-17/E53) and the direction of the quasi-isogeny as in E54.

Hypotheses:

- PEL data of type (A) or (C) unramified at p with hyperspecial level; X_b completely slope divisible.

Proof or construction:

1. Perfect schemes have vanishing cotangent complex over 𝔽_p, so flat lifts over W(k) exist uniquely and are given by W(−) on affines.
2. Moduli description: Serre–Tate (IG.0/serre-tate-semi-abelian and AbelianSchemesAndArithmeticModuli A4) identifies deformations of A with deformations of A[p^∞], and over the perfect base these are deformations of the universal cover, which is rigid ([SW13, Prop. 3.1.3]).
3. Lemma 4.3.12: (A, ρ) ↦ ((A, ρ ∘ ρ_{X_b}^{−1}), (A[p^∞], ρ)) with the given lift; inverse via Serre–Tate.

Uses:

- IG.3/product-formula: its generic fibre times M^b_∞ is the infinite-level space X^b_∞
- IG.3/compactified-igusa-to-shimura: Ig^{X,tor}_{O_C} maps to the toroidal compactification at infinite level
- IG.3/perfect-scheme-lift-cohomology: étale cohomology of the perfect scheme equals that of its lift and of the perfectoid generic fibre

API:

- `canonicalLift` (constructor): W(Y), the unique flat p-adic formal lift over W(k) of a perfect k-scheme Y.
- `canonicalLift_unique` (extensionality): Any flat formal scheme over W(k) with special fibre Y is canonically W(Y).
- `canonicalLift_genericFibre_perfectoid` (characterisation): Its generic fibre over C is a perfectoid space.
- `canonicalLift_moduli` (equivalence): Ig^b_{O_K} represents (A, ρ : A[p^∞] ≅ (X_b)_{O_K} ⊗ R) on Nilp_{O_K}.
- `XbSpace_decomp` (other): 𝔛^b_{O_K} ≅ Ig^b_{O_K} ×_{O_Ĕ} 𝔐^b.

Unit tests:

- `canonicalLift_point` (degenerate): W(Spec k) = Spf W(k).
- `canonicalLift_perfection_Fp` (computation): For Y = Spec 𝔽_p[t^{1/p^∞}], W(Y) = Spf ℤ_p⟨t^{1/p^∞}⟩ (p-adically completed).
- `canonicalLift_not_nonperfect` (non-example): Flat lifts of a non-perfect smooth k-scheme are not canonical: the lift Spf W(k)⟨t⟩ of 𝔸¹_k has an automorphism other than the identity reducing to the identity mod p (t ↦ t + p), whereas for perfect Y every such automorphism of W(Y) is the identity.

Acceptance:

- For b ordinary, W(Ig^b) is the Katz–Igusa canonical lift tower (Serre–Tate canonical coordinates at 0).

Depends on: `perfect-igusa-variety`, `pel-rapoport-zink-space`, `serre-tate-semi-abelian`, `AbelianSchemesAndArithmeticModuli:A4`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6/abelian-scheme-torsion-finite-flat`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`, `mathlib:WittVector`.

Used by: `infinite-level-newton-space`, `perfect-scheme-lift-cohomology`, `open-fibre-theorem`, `compactified-igusa-to-shimura`.

Sources:

- CS17 §4.3, Lemma 4.3.10, p. 719 (cs17): “Lemma 4.3.10. The points of the formal scheme Igb OK = Igb OĔ ×OĔ OK over R ∈ Nilpop OK are given by the pairs (A,ρ), where A ∈ SKpKp(R) is an” — Moduli description of the canonical lift of Ig^b.
- CS17 §4.3, Lemma 4.3.12, p. 720 (cs17): “Lemma 4.3.12. The map constructed above induces an isomorphism and fits into a commutative diagram Igb OK ×OĔ Mb  ∼” — The decomposition of 𝔛^b.
- CSnc §4.3, p. 54 (csnc): “where W(IgX,tor ) is the p-adic formal scheme over Spf W(k) obtained by taking an aﬃne cover of IgX,tor , applying Witt vectors, and gluing. This is” — The flat formal lift W(Ig^{X,tor}) ×_{W(k)} O_C.

### `infinite-level-newton-space` — The infinite-level space X^b_∞ over the Newton stratum (CS17 Definition 4.3.17, Remark 4.3.18, Corollary 4.3.19)

Declaration `IgusaVarietiesAndTorsionConcentration:IG.3/infinite-level-newton-space` (construction). Suggested home: `TauCeti/ShimuraVarieties/Igusa/LocalPeriodMap` (`TauCeti.Igusa`).

Let X^b = (𝔛^b)^ad_η. X^b_∞ sends a complete affinoid (Ĕ(ζ_{p^∞}), O)-algebra (R, R⁺) to triples (𝒜, ρ, α) with (𝒜, ρ) ∈ X^b(R, R⁺) and α : Λ → T_p𝒜 an O_B-linear map matching the pairings (with the fixed p-power roots of unity) and an isomorphism at every geometric point. Sending an abelian variety to its p-divisible group gives X^b → M^b and X^b_∞ = X^b ×_{M^b} M^b_∞, representable by an adic space; and (Ig^b_{O_K})^ad_η ×_{Spa Ĕ} M^b_∞ ≅ X^b_{∞,K}, so X^b_∞ is preperfectoid.

Hypotheses:

- PEL data of type (A) or (C) unramified at p with hyperspecial level.

Proof or construction:

1. Define X^b_∞ by the moduli problem; the fibre product description is a check on moduli problems.
2. Corollary 4.3.19 follows from IG.3/canonical-lift-of-igusa (Lemma 4.3.12) on generic fibres; preperfectoidness because M^b_∞ is preperfectoid and Ig^b_{O_K} is locally W(R) ⊗ O_K with R perfect, whose generic fibre is perfectoid for K perfectoid.

Uses:

- IG.3/product-formula: X̂^b_∞ is identified with the fibre product of M^b_∞ and the good-reduction Newton locus over Fℓ

API:

- `XbInfinite` (constructor): X^b_∞ as an adic space over Spa(Ĕ(ζ_{p^∞})).
- `XbInfinite.eq_fibreProduct` (characterisation): X^b_∞ = X^b ×_{M^b} M^b_∞.
- `XbInfinite.product` (equivalence): (Ig^b_{O_K})^ad_η ×_{Spa Ĕ} M^b_∞ ≅ X^b_{∞,K}.
- `XbInfinite.preperfectoid` (instance): X^b_∞ is preperfectoid.

Unit tests:

- `XbInfinite.ordinary` (computation): For b ordinary, Fℓ^{ord} = Fℓ(ℚ_p) is 0-dimensional, but the fibre of the local period map over a rational flag is an Aut_G(X̃_b)^{ad}-torsor of dimension ⟨2ρ, ν_ord⟩ = ⟨2ρ, μ⟩ = d > 0 (IG.3/local-period-fibres, IG.3/automorphism-group-dimension), not a profinite set.
- `XbInfinite.level_compat` (degenerate): Forgetting α gives X^b_∞ → X^b, a pro-finite étale G(ℤ_p)-torsor over the generic fibre.
- `XbInfinite.not_shimura` (non-example): X^b_∞ is not the Newton stratum of the perfectoid Shimura variety; it maps to it with fibres the fibres of Ig^b × M^b over the leaf.

Acceptance:

- For b basic, X^b_∞ is a disjoint union of copies of M^b_∞ indexed by the finite set Ig^b(k) modulo level.

Depends on: `canonical-lift-of-igusa`, `local-hodge-tate-period-map`.

Used by: `product-formula`.

Sources:

- CS17 §4.3, Definition 4.3.17, p. 724 (cs17): “Definition 4.3.17. Let Xb ∞ be the functor that sends a complete affinoid (Ĕ(ζp∞),OĔ(ζp∞))-algebra (R,R+) to the set of triples (A,ρ,α), where” — Defines X^b_∞.
- CS17 §4.3, Corollary 4.3.19, p. 724 (cs17): “Corollary 4.3.19. We have an isomorphism (Igb OK )ad η ×Spa(Ĕ,OĔ) Mb ∞ ∼ → Xb” — Product decomposition of X^b_∞.

### `product-formula` — The product formula for Newton strata at infinite level (CS17 Lemma 4.3.20) ★

Declaration `IgusaVarietiesAndTorsionConcentration:IG.3/product-formula` (theorem). Planet: Product formula for Newton strata.

Let X̂^b_∞ be the perfectoid space attached to X^b_∞ and 𝒮^b_{K^p} ⊂ 𝒮_{K^p} the locus of the perfectoid Shimura variety (infinite level at p) of points Spa(K, K⁺) over which the universal abelian variety extends to K⁺ with reduction in the Newton stratum S^b (a locally closed subset, the preimage of S^b under specialization). Then X̂^b_∞ maps to 𝒮^b_{K^p} by forgetting ρ and to M^b_∞ by (𝒜, ρ, α) ↦ (𝒜[p^∞], ρ, α), compatibly with π_HT and π^b_HT, and the induced map X̂^b_∞ → (M^b_∞ ×_{Fℓ_{G,μ}} 𝒮^b_{K^p})^∧ is an isomorphism of perfectoid spaces.

Hypotheses:

- PEL data of type (A) or (C) unramified at p with hyperspecial level; no compactness needed.

Proof or construction:

1. Commutativity of the square: the global Hodge–Tate period of A[p^∞] agrees with the local one (CS17 Remark 4.2.8, from HodgeTateAndCanonicalSubgroups T1).
2. Bijectivity on (C, O_C)-points from Scholze–Weinstein Theorem B; for general perfectoid (R, R⁺), extend the quasi-isogeny over R⁺ by IG.3/integral-extension-lemma.
3. The printed statement writes X̂^b for X̂^b_∞ and omits α in the map to M^b_∞ (noted in the PAPER-CARAIANI-SCHOLZE-17 extraction).

Acceptance:

- For b ordinary, it identifies the ordinary locus at infinite level with the ordinary Igusa tower times the profinite set of rational flags over each point.

Depends on: `infinite-level-newton-space`, `local-hodge-tate-period-map`, `integral-extension-lemma`, `HodgeTateAndCanonicalSubgroups:T2`, `HodgeTateAndCanonicalSubgroups:T1`, `PerfectoidShimuraVarieties:S3/hodge-open-period-map`, `PerfectoidShimuraVarieties:S3/hodge-compactified-period-maps`.

Used by: `compact-fibre-theorem`, `open-fibre-theorem`, `mantovan-formula`.

Sources:

- CS17 §4.3, Lemma 4.3.20, p. 725 (cs17): “Lemma 4.3.20. The perfectoid space “ Xb maps to Sb Kp by forgetting the quasi-isogeny ρ and to Mb ∞ by sending (A,ρ) to (A[p∞],ρ). The induced map “ Xb ∞ → (Mb ∞ ×F`G,µ Sb Kp)∧ is an isomorphism of” — States the product formula.

### `rank-one-cohomology-lemma` — Stalks and cohomology are determined by rank-one points (CS17 Lemmas 4.4.1–4.4.2)

Declaration `IgusaVarietiesAndTorsionConcentration:IG.3/rank-one-cohomology-lemma` (lemma).

(1) Let f : Y → X be a qcqs map of analytic adic spaces, X locally strongly noetherian or perfectoid and Y perfectoid; for a geometric point x̄ of X the stalk (R^if_*𝒢)_x̄ is the cohomology of the fibre f^{−1}(x̄) (an adic space over Spa(C(x̄), C(x̄)⁺)). (2) Let X be a qcqs analytic adic space (perfectoid, or strongly noetherian) and U ⊂ X a quasicompact open containing all rank-one points. Then H^i(X, 𝒢) → H^i(U, 𝒢) is an isomorphism for every locally constant 𝒢 and every i.

Hypotheses:

- X qcqs, U quasicompact open containing all rank-one points; 𝒢 locally constant.

Proof or construction:

1. (1) Write Spa(C(x̄), C(x̄)⁺) ∼ lim of étale neighbourhoods and use continuity of étale cohomology for qcqs limits (corrected limit statement of sourceIssues PAPER-CARAIANI-SCHOLZE-17/E59).
2. (2) It suffices that 𝒢 → Rj_*𝒢 is an isomorphism; by (1) check at a geometric point Spa(C, C⁺), where U = Spa(C, D⁺) and both spaces are strictly local (ClassicalAdicEtaleCohomology H0: global sections on Spa(C, C⁺) are the stalk at the closed point).

Acceptance:

- For X = Spa(C, C⁺) and U the generic point Spa(C, O_C): H^i(X, 𝒢) = H^i(U, 𝒢) = 0 for i > 0.

Depends on: `ClassicalAdicEtaleCohomology:H0/geometric-stalks-at-field-pairs`, `DiamondEtaleCohomology:C0/etale-cohomology-continuity`, `DiamondSixOperations:S1/qcqs-diamond-continuity`, `PerfectoidSpaces:P2/perfectoid-space`, `PerfectoidSpaces:P2/sheaf-theorem-and-almost-acyclicity`, `PerfectoidSpaces:P7/perfectoid-tilde-limit`.

Used by: `newton-strata-correspond`, `compact-fibre-theorem`, `open-fibre-theorem`, `compactified-fibre-theorem`.

Sources:

- CS17 §4.4, Lemma 4.4.2, p. 727 (cs17): “Lemma 4.4.2. Let X be a quasicompact and quasiseparated analytic adic space, and for definiteness, assume that X is a perfectoid space.26 Let U ⊂ X be a quasicompact open subset that contains all rank 1 points of X. Then, for any” — Cohomology is unchanged by passing to a quasicompact open containing the rank-one points.
- CS17 §4.4, Lemma 4.4.1, p. 726 (cs17): “Lemma 4.4.1. Let f : Y → X be a quasicompact and quasiseparated map of analytic adic spaces, and for definiteness, assume that X is either a locally strongly” — Stalks as cohomology of fibres.

### `perfect-scheme-lift-cohomology` — Étale cohomology of a perfect scheme, of its canonical lift and of the perfectoid generic fibre agree (CS17 Lemma 4.4.3)

Declaration `IgusaVarietiesAndTorsionConcentration:IG.3/perfect-scheme-lift-cohomology` (theorem).

Let ℓ ≠ p, X a perfect scheme over 𝔽̄_p, C complete algebraically closed with residue field containing 𝔽̄_p, 𝔛_{O_C} the unique flat formal lift of X ⊗ O_C/p over Spf O_C and 𝒳_C its (perfectoid) generic fibre. Then H^i(X, ℤ/ℓ^n) ← H^i(𝔛_{O_C}, ℤ/ℓ^n) → H^i(𝒳_C, ℤ/ℓ^n) are isomorphisms for all i (the maps being the canonical ones of sourceIssues PAPER-CARAIANI-SCHOLZE-17/E61).

Hypotheses:

- X perfect over 𝔽̄_p (in the application: qcqs, a perfection of a finite type scheme); ℓ ≠ p.

Proof or construction:

1. Reduce to the perfection of an affine X₀ of finite type; the formal scheme has the étale site of its special fibre, and invariance under change of algebraically closed field gives the first isomorphism.
2. Tilting reduces to C of characteristic p, where 𝒳_C ∼ lim_Frob X_{0,C}; Huber [Hub96, Cor. 3.5.17], [SGA 7 XIII 2.1.4] and the universal local acyclicity of X₀ → Spec 𝔽̄_p (Deligne, Th. finitude 2.13) show the nearby cycles are ℤ/ℓ^n (with the base change of sourceIssues PAPER-CARAIANI-SCHOLZE-17/E62).

Acceptance:

- For X = Spec k the three groups are ℤ/ℓ^n in degree 0.

Depends on: `canonical-lift-of-igusa`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/scheme-completion-comparison-3-5-13`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/formal-nearby-cycles-comparison`, `LefschetzPencilsAndVanishingCycles:LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle`, `LefschetzPencilsAndVanishingCycles:LPV.0/derived-functorialities-and-specialization-sequence`, `PerfectoidSpaces:P1/tilting-equivalence-and-explicit-tilt`.

Used by: `compact-fibre-theorem`, `open-fibre-theorem`, `compactified-fibre-theorem`.

Sources:

- CS17 §4.4, Lemma 4.4.3, p. 728 (cs17): “Lemma 4.4.3. Let X/F̄p be a perfect scheme, and let C be a complete algebraically closed nonarchimedean field whose residue field contains F̄p. Let XOC be the flat formal scheme over Spf OC that is the unique lifting of X ×F̄p” — States the comparison of cohomology.

### `newton-strata-correspond` — On rank-one points the Newton stratifications correspond under π_HT, and fibres over Fℓ^b lie in the good-reduction Newton locus (CS17 §4.2–4.4)

Declaration `IgusaVarietiesAndTorsionConcentration:IG.3/newton-strata-correspond` (theorem).

Assume S_{K^pK_p} proper over O_{E,𝔭} (or replace 𝒮_{K^p} by the good-reduction locus). (1) A rank-one point y of 𝒮_{K^p} lies in 𝒮^b_{K^p} if and only if π_HT(y) ∈ Fℓ^b_{G,μ}. (2) For a rank-one point x ∈ Fℓ^b(C, O_C), every geometric rank-one point of the fibre 𝒮_{K^p,x} lies in 𝒮^b_{K^p}; hence 𝒮^b_{K^p,x} is a quasicompact open subset of 𝒮_{K^p,x} with the same rank-one points, and (R^iπ_HT* ℤ/ℓ^n)_x = H^i(𝒮^b_{K^p,x}, ℤ/ℓ^n).

Hypotheses:

- PEL data of type (A) or (C) unramified at p with hyperspecial level; properness (or restriction to the good-reduction locus).

Proof or construction:

1. If y ∈ 𝒮^b, π_HT(y) is the local period of A_y[p^∞] (Remark 4.2.8), which lies in Fℓ^b by IG.3/local-hodge-tate-period-map (3).
2. Conversely, if π_HT(y) ∈ Fℓ^b, the G-bundle of A_y[p^∞] is ℰ_x ≅ ℰ_b and CS17 Theorem 4.1.4 gives a quasi-isogeny of the reduction with X_b (argument of IG.3/local-period-surjective-on-stratum); properness makes every rank-one point extend over O_C.
3. (2) follows from (1) and IG.3/rank-one-cohomology-lemma.

Acceptance:

- For b ordinary: the rank-one points over rational flags are exactly the ordinary good-reduction points.

Depends on: `local-hodge-tate-period-map`, `local-period-surjective-on-stratum`, `rank-one-cohomology-lemma`, `newton-map`, `HodgeTateAndCanonicalSubgroups:T1`, `PerfectoidShimuraVarieties:S3/hodge-open-period-map`, `PerfectoidShimuraVarieties:S3/hodge-compactified-period-maps`.

Used by: `compact-fibre-theorem`, `mantovan-formula`.

Sources:

- CS17 §4.2, Proposition 4.2.6, p. 702 (with Remark 4.2.8, p. 703) (cs17): “Proposition 4.2.6. The local Hodge-Tate period map factors through πb HT : MD,∞ → F`b G,µ. Proof.” — The period of a point of the b-stratum lies in Fℓ^b.
- CS17 §4.2, Remark 4.2.8, p. 703 (cs17): “Remark 4.2.8. We have defined the Hodge-Tate filtration in Section 2 in terms of the p-adic étale cohomology of a universal family of abelian varieties. If A/OC is an abelian variety and G = A[p∞],” — The global Hodge–Tate filtration of A[p^∞] is the local one.

### `compact-fibre-theorem` — Stalks of Rπ_HT* are the cohomology of Igusa varieties: the compact PEL case (CS17 Theorem 4.4.4 = Theorem 1.15) ★

Declaration `IgusaVarietiesAndTorsionConcentration:IG.3/compact-fibre-theorem` (theorem). Planet: Igusa varieties as Hodge–Tate fibres.

Assume a PEL datum of type (A) or (C), unramified at p, with K_p hyperspecial, and S_{K^pK_p} proper over O_{E,𝔭} (equivalently G^ad anisotropic over ℚ, the condition on G^ad corrected in sourceIssues PAPER-CARAIANI-SCHOLZE-17/E58). Let ℓ ≠ p, K^p sufficiently small, π_HT : 𝒮_{K^p} → Fℓ_{G,μ} and b ∈ B(G, μ^{−1}). For every geometric point x̄ of Fℓ_{G,μ} lying in Fℓ^b_{G,μ} and all i there are isomorphisms (R^iπ_HT* ℤ/ℓ^n)_x̄ ≅ H^i(Ig^b, ℤ/ℓ^n) ≅ colim_m H^i(Ig^b_{Mant,m}, ℤ/ℓ^n), depending only on a lift of x̄ to M^b_∞ and compatible with the Hecke action of G(𝔸_f^p).

Hypotheses:

- Proper integral model (compact Shimura variety); K^p small; ℓ ≠ p.

Proof or construction:

1. Reduce to a rank-one point (IG.3/rank-one-cohomology-lemma) and compute the stalk as the cohomology of the fibre (Lemma 4.4.1).
2. Every rank-one point of the fibre lies in 𝒮^b_{K^p} (IG.3/newton-strata-correspond); lift x̄ to M^b_∞ (IG.3/local-period-surjective-on-stratum).
3. By the product formula (IG.3/product-formula) and Corollary 4.3.19, the fibre is (Ig^b_{O_C})^ad_η.
4. Pass to the special fibre by IG.3/perfect-scheme-lift-cohomology and to Mantovan's tower by IG.1/perfection-of-mantovan.

Acceptance:

- For b basic, the stalk is ℤ/ℓ^n[Ig^b(k)] in degree 0 (a profinite set).

Depends on: `rank-one-cohomology-lemma`, `newton-strata-correspond`, `local-period-surjective-on-stratum`, `product-formula`, `perfect-scheme-lift-cohomology`, `perfection-of-mantovan`.

Used by: `compact-minimal-stratum-concentration`.

Sources:

- CS17 §4.4, Theorem 4.4.4, p. 729 (cs17): “Theorem 4.4.4. For any geometric point x̄ of F`G,µ contained in F`b G,µ, there is an isomorphism (Ri πHT∗Z/`n Z)x̄ = Hi (Igb ,Z/`n Z) = lim − → m Hi” — States the stalk computation.

### `open-fibre-theorem` — Fibres of π°_HT on the good-reduction locus (CSnc Theorem 2.7.2)

Declaration `IgusaVarietiesAndTorsionConcentration:IG.3/open-fibre-theorem` (theorem).

For x ∈ Fℓ(C) with p-divisible group 𝒳_{O_C} with G-structure and special fibre X_k, there is a canonical open immersion Ig^{X_k}_C ↪ (π°_HT)^{−1}(x) whose image contains all rank-one points, where Ig^{X_k}_C is the generic fibre of the canonical lift of the perfect Igusa variety (prime-to-p level the part of N prime to p). Consequently, for ℓ ≠ p, (R(π°_HT)_*𝔽_ℓ)_x ≅ RΓ(Ig^{X_k}, 𝔽_ℓ) canonically and Hecke-equivariantly.

Hypotheses:

- p unramified in F, N ≥ 3 prime to p, Σ as in CSnc Remark 2.5.6; C a complete algebraically closed nonarchimedean extension of ℚ_p with ring of integers O_C, residue field k and a fixed section k → O_C/p.
- The quasi-split unitary datum (non-compact); only the good-reduction locus is used, so no properness is needed.

Proof or construction:

1. The map: Serre–Tate lifting of the universal abelian variety over Ig^{X_k}_{O_C/p^ε} along the isomorphism of IG.3/pdiv-constant-mod-p-epsilon, with level structure from α (the open part of IG.3/compactified-igusa-to-shimura).
2. Open immersion with the same rank-one points: on rank-one points of the fibre the abelian variety has good reduction (by definition of S°) with p-divisible group 𝒳_{O_C}; the argument of IG.3/compact-fibre-theorem with the product formula applies verbatim on S°.
3. Cohomology: IG.3/rank-one-cohomology-lemma and IG.3/perfect-scheme-lift-cohomology.

Acceptance:

- For x a rational flag, Ig^{X_k} is the ordinary Igusa variety and the stalk is RΓ(Ig^{ord}, 𝔽_ℓ).

Depends on: `good-reduction-locus`, `flag-points-and-p-divisible-groups`, `product-formula`, `rank-one-cohomology-lemma`, `perfect-scheme-lift-cohomology`, `pdiv-constant-mod-p-epsilon`, `canonical-lift-of-igusa`.

Used by: `compactified-fibre-theorem`, `ell-power-boundary-killing`, `minimal-stratum-lower-bound`, `only-ordinary-contributes`.

Sources:

- CSnc §2.7, Theorem 2.7.2, p. 33 (csnc): “Theorem 2.7.2. There is a canonical open immersion IgXk C ֒→ (π◦ HT)−1 (x) whose image contains all points of rank 1. In particular, for a prime ℓ 6= p, there is a canonical Hecke-equivariant isomorphism (R(π◦ HT)∗Fℓ)x ∼ =” — Open Igusa varieties as fibres of π°_HT.

### `period-map-on-boundary` — The Hodge–Tate period map on toroidal boundary charts and on minimal boundary strata (CSnc Theorem 4.2.1, Corollary 4.2.2)

Declaration `IgusaVarietiesAndTorsionConcentration:IG.3/period-map-on-boundary` (theorem).

(1) Let Ŝ^tor_{K(p^∞N),Z,ℤ_p} be the completion of the infinite-level naive integral model along the Z-boundary, with π₁ to (G/P_r)(ℚ_p) (symplectic O_F-filtrations Z_{p^∞,−2} ⊂ Z_{p^∞,−1} ⊂ L ⊗ ℤ_p with rk Z_{−2} = r) and the local system L_Z = Gr_{−1} with its perfect form. The Hodge–Tate filtration Lie B(1) ⊂ L_Z ⊗ O of the abelian part B of the Raynaud extension, pulled back to Z_{p^∞,−1} ⊗ O, is a totally isotropic subspace of L ⊗ O; the resulting π_{HT,Z} agrees with π^tor_HT restricted to the generic fibre of Ŝ^tor_Z. (2) On a boundary stratum S_{K(p^∞N),Ẑ} of the infinite-level minimal compactification, π^*_HT is the Hodge–Tate period map of the smaller Shimura variety followed by the embedding Fℓ_Ẑ ↪ Fℓ (preimage of a totally isotropic subspace of L_Z ⊗ ℚ_p in Z_{p^∞,−1} ⊗ ℚ_p).

Hypotheses:

- p unramified in F, N ≥ 3 prime to p, Σ as in CSnc Remark 2.5.6; C a complete algebraically closed nonarchimedean extension of ℚ_p with ring of integers O_C, residue field k and a fixed section k → O_C/p.

Proof or construction:

1. Away from the boundary, π_{HT,Z} = π^tor_HT by Scholze [Sch15, Prop. 3.3.1] (the forgetful map to the Siegel flag variety is injective).
2. Continuity: the locus of agreement is closed; if the maps differed on a quasicompact open U, U would be the preimage of a quasicompact open at finite level contained in the boundary, but the boundary contains no nonempty open subspace.
3. (2) follows from (1) by projecting to the minimal compactification (PerfectoidShimuraVarieties S6 compatibility of toroidal and minimal period maps).

Acceptance:

- For the modular curve at a cusp, π_{HT,Z} is the constant map to the rational point of ℙ¹ given by the filtration (Tate curve: ordinary at the cusp).

Depends on: `PerfectoidShimuraVarieties:S3/hodge-open-period-map`, `PerfectoidShimuraVarieties:S3/hodge-compactified-period-maps`, `PerfectoidShimuraVarieties:S6/general-toroidal-period-map`, `PerfectoidShimuraVarieties:S6/minimal-toroidal-period-map-compatibility`, `ShimuraCompactifications:C4/polarized-degeneration-data`, `ShimuraCompactifications:C4/degeneration-effectivity`, `ShimuraCompactifications:C4/formal-universal-degeneration`, `NeronModelsAndSemistableAbelianVarieties:R11.3/raynaud-extension-comparison`, `ShimuraCompactifications:C5/integral-toroidal-space`, `ShimuraCompactifications:C5/formal-completion`, `ShimuraCompactifications:C5/higher-level-toroidal-normalization`, `good-reduction-locus`.

Used by: `toroidal-fibre-theorem`.

Sources:

- CSnc §4.2, Theorem 4.2.1, p. 53 (csnc): “Theorem 4.2.1. The map πHT,Z constructed above agrees with the composite ( c Stor K(p∞N),Z,Qp )♦ → (Stor K(p∞N),Qp )♦” — Explicit description of π^tor_HT on boundary charts.
- CSnc §4.2, Corollary 4.2.2, p. 53 (csnc): “Corollary 4.2.2. The restriction of π∗ HT : S∗ K(p∞N) → Fℓ to SK(p∞N),b Z agrees with the composition SK(p∞N),b Z → Fℓb Z ֒→ Fℓ, where the first” — π^*_HT on minimal boundary strata.

### `pdiv-constant-mod-p-epsilon` — The p-divisible group of a flag point is constant modulo p^ε (CSnc Proposition 4.3.1)

Declaration `IgusaVarietiesAndTorsionConcentration:IG.3/pdiv-constant-mod-p-epsilon` (theorem).

For x ∈ Fℓ(C) with (𝒳_{O_C}, α), splitting δ_{𝒳} and special fibre X = 𝒳 ⊗ k with induced δ_X, there is ε ∈ ℚ ∩ (0, 1] and an isomorphism ρ : X ⊗_k O_C/p^ε ≅ 𝒳_{O_C} ⊗ O_C/p^ε of p-divisible groups with G-structure lifting the identity, which can be chosen with δ_{𝒳} ⊗ O_C/p^ε = δ_X ⊗ O_C/p^ε.

Hypotheses:

- p unramified in F, N ≥ 3 prime to p, Σ as in CSnc Remark 2.5.6; C a complete algebraically closed nonarchimedean extension of ℚ_p with ring of integers O_C, residue field k and a fixed section k → O_C/p.

Proof or construction:

1. By Scholze–Weinstein Theorem A (Dieudonné theory over O_C/p up to isogeny) it suffices to find an isomorphism of G-Dieudonné modules over B⁺_cris = A_cris[1/p] between those of 𝒳 ⊗ O_C/p and X ⊗ O_C/p reducing to the identity over W(k)[1/p].
2. G-Dieudonné modules over B⁺_cris are equivalent to G-bundles on the Fargues–Fontaine curve and are determined by their restriction to W(k)[1/p] (Fargues [Far20, Thm 5.1, 5.6]); any isomorphism can be adjusted by an automorphism of the target.
3. The quasi-isogeny is an isomorphism over k, hence over O_C/p^ε for small ε; treat the three summands separately (outer ones Cartier dual) for the compatibility with δ.

Acceptance:

- For 𝒳 = X ⊗ O_C (constant), ε = 1 works.

Depends on: `flag-points-and-p-divisible-groups`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`, `VectorBundlesAndIsocrystals:VB2`, `VectorBundlesAndIsocrystals:VB2:classification/dieudonne-manin-classification-of-bundles`.

Used by: `open-fibre-theorem`, `compactified-igusa-to-shimura`.

Sources:

- CSnc §4.3, Proposition 4.3.1, p. 54 (csnc): “Proposition 4.3.1. There exists ǫ ∈ Q, 1 ≥ ǫ > 0 such that there exists an isomorphism ρ : X ×k OC/pǫ ∼ = XOC ×OC OC/pǫ of p-divisible groups with G-structures, lifting the identity. Moreover, we can” — Constancy of the p-divisible group modulo p^ε.

### `compactified-igusa-to-shimura` — The map from compactified Igusa varieties over O_C to compactified Shimura varieties at infinite level (CSnc Theorem 4.3.2)

Declaration `IgusaVarietiesAndTorsionConcentration:IG.3/compactified-igusa-to-shimura` (construction). Suggested home: `TauCeti/ShimuraVarieties/Igusa/Fibres` (`TauCeti.Igusa`).

Let Ig^{X,tor}_{O_C} = W(Ig^{X,tor}) ×_{W(k)} O_C. The map g : Ig^X_{O_C} → S_{K(p^∞N),O_C} — Serre–Tate lift of the universal abelian scheme over Ig^X_{O_C/p^ε} along A[p^∞] ≅ 𝒳_{O_C} (IG.3/pdiv-constant-mod-p-epsilon), with level structure at p from α — extends to a morphism of p-adic formal schemes g^tor : Ig^{X,tor}_{O_C} → S^tor_{K(p^∞N),O_C}, and composing with the projection gives f^tor : Ig^{X,tor}_{O_C} → S^*_{K(p^∞N),O_C}. On boundary charts, Igusa cusp labels map to cusp labels and g^tor is given by deforming G[p^∞] ↪ X (Serre–Tate for Raynaud extensions) and the torus torsor of symmetric lifts.

Hypotheses:

- p unramified in F, N ≥ 3 prime to p, Σ as in CSnc Remark 2.5.6; C a complete algebraically closed nonarchimedean extension of ℚ_p with ring of integers O_C, residue field k and a fixed section k → O_C/p.

Proof or construction:

1. Open part: over Ig^X_{O_C/p^ε} the abelian scheme with G-structure and A[p^∞] ≅ 𝒳 ⊗ O_C/p^ε lifts uniquely to O_C by Serre–Tate (IG.0/serre-tate-semi-abelian), with A[p^∞] ≅ 𝒳_{O_C} ⊗ Ig and level structure from α.
2. Boundary charts: on Î g^{b,tor}_{Z,O_C} use IG.2/igusa-boundary-charts: deform G[p^∞] ↪ X to O_C via Serre–Tate for Raynaud extensions, map the torus torsor of symmetric lifts to the torsor of lifts of f_m : (1/p^m)X → B_{O_C}, and obtain level structures by normality.
3. Gluing: on U_R ⊂ Spec R (complement of the boundary) the two maps to S_{K(p^∞N),O_C/p^M} agree, since both factor through Ig^b_{O_C/p^M}, all schemes are flat lifts of relatively perfect schemes (vanishing cotangent complex) and they agree over O_C/p^ε.

Uses:

- IG.3/toroidal-fibre-theorem: g^tor induces the map from Ig^{b,tor}_C to the fibre of π^tor_HT
- IG.3/minimal-fibre-theorem: f^tor induces the map from Ig^{b,*}_C to the fibre of π^*_HT

API:

- `igusaToShimura` (constructor): g^tor : Ig^{X,tor}_{O_C} → S^tor_{K(p^∞N),O_C}.
- `igusaToShimura_open` (compatibility): Restricts to the Serre–Tate map g on Ig^X_{O_C}.
- `igusaToShimura_cusp` (characterisation): Maps the Z̃-boundary chart into the Z-boundary chart, Z the cusp label underlying Z̃.
- `igusaToShimura_hecke` (functoriality): Equivariant for the prime-to-p Hecke action.
- `igusaToShimura_piHT` (other): The composite with π^tor_HT is constant equal to x.

Unit tests:

- `igusaToShimura_constant_period` (characterisation): π^tor_HT ∘ g^tor_C is the constant map to x.
- `igusaToShimura_ordinary_modular` (computation): For n = 1, F imaginary quadratic and x a rational flag, the image of g^tor_C is the locus of the infinite-level toroidal curve where the trivialized Tate module carries the canonical subgroup to the line x (an ordinary locus), together with its cusps.
- `igusaToShimura_not_surjective` (non-example): For the modular curve and a rational (ordinary) flag x, g^tor_C is not surjective onto the fibre (π^tor_HT)^{−1}(x): it misses higher-rank points, which the canonical compactification adds. (When Ig^{b,tor} is already proper, e.g. for basic x, g^tor_C is onto.)

Acceptance:

- For b ordinary and the modular curve, g^tor is the Katz–Mazur map from the canonical lift of the Igusa tower (with cusps) to the modular curve at infinite level.

Depends on: `canonical-lift-of-igusa`, `perfect-toroidal-igusa-variety`, `igusa-boundary-charts`, `pdiv-constant-mod-p-epsilon`, `serre-tate-semi-abelian`, `ShimuraCompactifications:C4/polarized-degeneration-data`, `ShimuraCompactifications:C4/degeneration-effectivity`, `ShimuraCompactifications:C4/formal-universal-degeneration`, `NeronModelsAndSemistableAbelianVarieties:R11.3/raynaud-extension-comparison`, `ShimuraCompactifications:C5/integral-toroidal-space`, `ShimuraCompactifications:C5/formal-completion`, `ShimuraCompactifications:C5/higher-level-toroidal-normalization`.

Used by: `toroidal-fibre-theorem`, `minimal-fibre-theorem`.

Sources:

- CSnc §4.3, Theorem 4.3.2, p. 55 (csnc): “Theorem 4.3.2. The morphism g constructed above extends to a morphism of p-adic formal schemes gtor : IgX,tor OC → Stor K(p∞N),OC . Proof. By” — Extension of g over the toroidal compactification.
- CSnc §4.3, proof of Theorem 4.3.2, p. 57 (csnc): “As thus the cotangent complex vanishes, it suﬃces to see that these maps agree over OC/pǫ . But in that case,” — Gluing via the vanishing cotangent complex of relatively perfect lifts.

### `canonical-compactification-criterion` — A bijection on rank-one points to a proper diamond identifies the canonical compactification (CSnc Lemma 4.4.2)

Declaration `IgusaVarietiesAndTorsionConcentration:IG.3/canonical-compactification-criterion` (lemma).

Let f : X → Y be a map from a quasicompact separated perfectoid space X to a proper diamond Y over Spd C. If X(C′, O_{C′}) → Y(C′, O_{C′}) is bijective for every complete algebraically closed C′/C, then f induces an isomorphism X̄ ≅ Y from the canonical compactification X̄ of X over Spd C; in particular, if X/Spd C is compactifiable, f is an open immersion.

Hypotheses:

- Y proper over Spd C (not merely partially proper; the fibre of π^tor_HT is proper, sourceIssues IgusaVarietiesAndTorsionConcentration/E4).

Proof or construction:

1. Replace X by X̄ (canonical compactification, Scholze [Sch17, Prop. 18.6]); then f is a map of proper diamonds bijective on (C′, C′⁺)-points for all C′⁺ ⊃ O_C (by properness these agree with (C′, O_{C′})-points).
2. Conclude by [Sch17, Lemma 11.11] (a map of qcqs diamonds bijective on geometric points is an isomorphism).

Acceptance:

- For X = Spa(C, O_C) and Y = Spd C: X̄ = Spd C.

Depends on: `DiamondEtaleCohomology:C4/canonical-compactification`, `DiamondEtaleCohomology:C4/canonical-compactification-universal`, `DiamondsAndVStacks:D5`.

Used by: `toroidal-fibre-theorem`.

Sources:

- CSnc §4.4, Lemma 4.4.2, p. 59 (csnc): “Lemma 4.4.2. Let f : X → Y be a map from a quasicompact separated perfectoid space X to a proper diamond Y over Spd C for some complete algebraically closed extension C of Qp. Assume that for all complete algebraically closed C′” — States the canonical compactification criterion.

### `toroidal-fibre-theorem` — The fibre of π^tor_HT is the canonical compactification of the toroidal Igusa variety (CSnc Theorem 4.4.1)

Declaration `IgusaVarietiesAndTorsionConcentration:IG.3/toroidal-fibre-theorem` (theorem).

The morphism g^tor induces a map of diamonds Ig^{b,tor}_C → (π^tor_HT)^{−1}(x) which is an open immersion with the same rank-one points; since the fibre (π^tor_HT)^{−1}(x) is proper over Spd C (a closed fibre of a proper map), it is the canonical compactification of Ig^{b,tor}_C.

Hypotheses:

- p unramified in F, N ≥ 3 prime to p, Σ as in CSnc Remark 2.5.6; C a complete algebraically closed nonarchimedean extension of ℚ_p with ring of integers O_C, residue field k and a fixed section k → O_C/p.
- x ∈ Fℓ^b(C).

Proof or construction:

1. By IG.3/canonical-compactification-criterion it suffices to check bijectivity on (C, O_C)-points for all larger C.
2. Both sides decompose according to Igusa cusp labels of level K^p(N) (for the target via IG.3/period-map-on-boundary and Scholze–Weinstein Theorem B), compatibly.
3. For a fixed Igusa cusp label Z̃, match the data (1)–(4) on the Igusa side (B, extension, G[p^∞] ≅ Z_{b,−1}, symmetric positive lift f̃ in the torus embedding) with (1′)–(4′) on the Shimura side (B with T_p(B) ≅ Gr_{−1}, extension, splitting, lift): (3) is equivalent to (3′) plus the extra datum of (1′).

Acceptance:

- For the modular curve and x a rational flag: the fibre is the ordinary canonical-subgroup locus at infinite level with its cusps, and the open immersion is an isomorphism on rank-one points.

Depends on: `compactified-igusa-to-shimura`, `canonical-compactification-criterion`, `period-map-on-boundary`, `igusa-cusp-labels`, `flag-points-and-p-divisible-groups`, `DiamondEtaleCohomology:C4/canonical-compactification`, `DiamondEtaleCohomology:C4/canonical-compactification-universal`, `DiamondsAndVStacks:D5`.

Used by: `minimal-fibre-theorem`, `compactified-fibre-theorem`.

Sources:

- CSnc §4.4, Theorem 4.4.1, p. 57 (csnc): “Theorem 4.4.1. The morphism gtor constructed in Theorem 4.3.2 induces a map of diamonds Igb,tor C → (πtor HT)−1 (x) that is an open immersion with the same rank 1 points. As the target is partially proper over Spa(C,OC), this” — The toroidal fibre theorem.

### `minimal-fibre-theorem` — The fibre of π^*_HT and the partial minimal Igusa variety (CSnc Theorem 4.5.1, Lemma 4.5.2)

Declaration `IgusaVarietiesAndTorsionConcentration:IG.3/minimal-fibre-theorem` (theorem).

f^tor induces an open immersion f^* : Ig^{b,*}_C → (π^*_HT)^{−1}(x) of affinoid perfectoid spaces with the same rank-one points. Moreover (1) Ig^{b,tor}_C → Ig^{b,*}_C induces an isomorphism on global sections, and (2) F^tor := (π^tor_HT)^{−1}(x) → F^* := (π^*_HT)^{−1}(x) induces an isomorphism on global sections, via the almost isomorphism O⁺ᵃ_{F^*}/p^n ≅ π_*O⁺ᵃ_{F^tor}/p^n.

Hypotheses:

- p unramified in F, N ≥ 3 prime to p, Σ as in CSnc Remark 2.5.6; C a complete algebraically closed nonarchimedean extension of ℚ_p with ring of integers O_C, residue field k and a fixed section k → O_C/p.

Proof or construction:

1. Ig^{b,*}_C is affinoid perfectoid: Ig^{b,*} is affine (IG.2/perfect-minimal-igusa, IG.2/minimal-igusa-compactification; the printed proof cites Lemma 3.3.8, sourceIssues IgusaVarietiesAndTorsionConcentration/E2), and the generic fibre of the W-lift of an affine perfect scheme is affinoid perfectoid.
2. F^* is affinoid perfectoid (Scholze, Theorem 4.1.1 for the finite normalized tower, and Bhatt–Scholze Theorem 1.17 for S^* itself).
3. (1) Known over k, hence over O_C/p^ε by base change, lift to O_C and invert p.
4. (2) Reduce to the almost isomorphism O⁺ᵃ_{S^*}/p^n → π_*O⁺ᵃ_{S^tor}/p^n on (S^*_{K(p^∞N),C})_ét by quasi-pro-étale base change ([Sch17, Prop. 14.8, Cor. 16.9]); at each finite level, ℤ/p^n ≅ π_*ℤ/p^n because the Stein factorization has geometrically connected fibres ([Sch17, Cor. 16.10]), tensor with O⁺/p^n and apply the relative primitive comparison theorem ([Sch13, Thm 3.13]; PadicHodgeTheory P8); take the colimit over finite levels.
5. The theorem follows from IG.3/toroidal-fibre-theorem on global sections.

Acceptance:

- The argument does not assert that proper fibres have trivial cohomology; it uses only connectedness of Stein fibres and the primitive comparison.

Depends on: `toroidal-fibre-theorem`, `compactified-igusa-to-shimura`, `perfect-minimal-igusa`, `minimal-igusa-compactification`, `PadicHodgeTheory:P8`, `DiamondEtaleCohomology:C0/etale-site`, `DiamondEtaleCohomology:C0/quasi-pro-etale-site`, `AdicEtaleGeometry:A1/pro-etale-site-corrected`, `AdicEtaleGeometry:A1/finite-etale-tower`, `PerfectoidSpaces:P0/almost-basic-setup`, `PerfectoidShimuraVarieties:S0/infinite-level-diamond`, `PerfectoidShimuraVarieties:S2/hodge-genuine-minimal-perfectoid-tower`, `PerfectoidShimuraVarieties:S4/preabelian-minimal-perfectoid`, `PerfectoidShimuraVarieties:S1/perfectoid-toroidal-siegel-tower`, `PerfectoidSpaces:P2/perfectoid-space`, `PerfectoidSpaces:P2/sheaf-theorem-and-almost-acyclicity`, `PerfectoidSpaces:P7/perfectoid-tilde-limit`.

Used by: `compactified-fibre-theorem`.

Sources:

- CSnc §4.5, Theorem 4.5.1, p. 59 (csnc): “Theorem 4.5.1. The morphism ftor induces an open immersion f∗ : Igb,∗ C → (π∗ HT)−1 (x). of affinoid perfectoid spaces with the same rank 1 points.” — The minimal fibre theorem.
- CSnc §4.5, proof of Lemma 4.5.2, p. 60 (csnc): “apply the relative primitive comparison isomorphism in the form of [Sch13, Theorem 3.13]; this gives an almost” — Uses the relative primitive comparison theorem.

### `compactified-fibre-theorem` — Fibres of the compactified Hodge–Tate period maps and their cohomology (CSnc Theorem 4.1.1, Corollary 4.1.2) ★

Declaration `IgusaVarietiesAndTorsionConcentration:IG.3/compactified-fibre-theorem` (theorem). Planet: Fibres of the compactified Hodge–Tate period map.

For x ∈ Fℓ(C) with (𝒳_{O_C}, α) and special fibre X, there are natural maps Ig^{X,*}_C → (π^*_HT)^{−1}(x) and Ig^{X,tor}_C → (π^tor_HT)^{−1}(x), open immersions of perfectoid spaces with the same rank-one points, whose targets are the canonical compactifications of the sources. Consequently there are natural Hecke-equivariant isomorphisms RΓ(Ig^{X,*}, 𝔽_ℓ) ≅ (Rπ^*_HT*𝔽_ℓ)_x and RΓ(Ig^{X,tor}, 𝔽_ℓ) ≅ (Rπ^tor_HT*𝔽_ℓ)_x, and the stalks at higher-rank points agree with those at the corresponding rank-one points. These maps are compatible with the prime-to-p Hecke action, with passage between p-levels (the transition maps of the towers), with the flag Newton strata (x ∈ Fℓ^b iff X is in the class b) and with the good-reduction open part (IG.3/open-fibre-theorem).

Hypotheses:

- p unramified in F, N ≥ 3 prime to p, Σ as in CSnc Remark 2.5.6; C a complete algebraically closed nonarchimedean extension of ℚ_p with ring of integers O_C, residue field k and a fixed section k → O_C/p.

Proof or construction:

1. Toroidal case: IG.3/toroidal-fibre-theorem; minimal case: IG.3/minimal-fibre-theorem.
2. Cohomology: the stalk is the cohomology of the fibre (IG.3/rank-one-cohomology-lemma (1)); passing to the canonical compactification does not change étale cohomology of overconvergent sheaves (DiamondEtaleCohomology C4), and IG.3/perfect-scheme-lift-cohomology identifies the cohomology of the perfectoid generic fibre with that of the perfect scheme (arguments of CS17 §4.4).

Acceptance:

- For x a rational flag (b ordinary): (Rπ^*_HT*𝔽_ℓ)_x ≅ RΓ(Ig^{ord,*}, 𝔽_ℓ).
- The statement is not an isomorphism of adic spaces Ig_C ≅ fibre; only an open immersion with the same rank-one points.

Depends on: `toroidal-fibre-theorem`, `minimal-fibre-theorem`, `rank-one-cohomology-lemma`, `perfect-scheme-lift-cohomology`, `open-fibre-theorem`, `DiamondEtaleCohomology:C4/relative-compactification-properties`, `ClassicalAdicEtaleCohomology:H0/overconvergent-etale-sheaves`.

Used by: `ell-power-boundary-killing`.

Sources:

- CSnc §4.1, Theorem 4.1.1, p. 51 (csnc): “Theorem 4.1.1. There are natural maps IgX,∗ C → (π∗ HT)−1” — Statement of the fibre theorem.
- CSnc §4.1, Theorem 4.1.1, p. 51 (csnc): “They are open immersions of perfectoid spaces with the same rank-1-points; in fact, the target is the canonical compactification of the source. In particular,” — Open immersions with the same rank-one points, targets the canonical compactifications.
- CSnc §4.1, Corollary 4.1.2, p. 51 (csnc): “Corollary 4.1.2. There are natural Hecke-equivariant isomorphisms RΓ(IgX,∗ ,Fℓ) ∼ = (R(π∗ HT)∗Fℓ)x,” — Cohomological consequence.

### `sw-infinite-level-rz-space` — The Scholze–Weinstein Rapoport–Zink space at infinite level M_∞ of a p-divisible group (SW13 §6.3; CS17 proof of Theorem 4.2.4)

Declaration `IgusaVarietiesAndTorsionConcentration:IG.3/sw-infinite-level-rz-space` (construction). Suggested home: `TauCeti/ShimuraVarieties/Igusa/LocalPeriodMap` (`TauCeti.Igusa`).

Let H be a p-divisible group of height h and dimension d over a perfect field k of characteristic p, M the Rapoport–Zink space of deformations of H up to quasi-isogeny (no extra structure) and M_n its level-p^n covers. M_∞ sends a complete affinoid (W(k)[1/p], W(k))-algebra (R, R⁺) to triples (G, ρ, α) with (G, ρ) ∈ M(R, R⁺) and α : ℤ_p^h → T_pG^ad_η(R, R⁺) an isomorphism at all geometric points. M_∞ is representable by an adic space, preperfectoid, with M_∞ ∼ lim_n M_n (Scholze–Weinstein Theorem 6.3.4). After base change to Spa(W(k)[1/p](ζ_{p^∞})), M_∞ ≅ M′_∞, the functor of h-tuples (s₁, …, s_h) ∈ H̃^ad_η(R, R⁺) whose quasi-logarithms span a rank-(h − d) subspace with locally free quotient W of rank d of M(H) ⊗ R, and such that 0 → ℤ_p^h → H̃^ad_η(C, C⁺) → W ⊗ C → 0 is exact at every geometric point (Lemma 6.3.6). For an unramified local PEL datum, M_{D^int,∞} (IG.3/local-hodge-tate-period-map) is a closed subspace of M_∞ for H = X_b.

Hypotheses:

- H a p-divisible group over a perfect field k; "∼ lim" in the sense of Scholze–Weinstein Definition 2.4.1.

Proof or construction:

1. Representability and the description M′_∞: Scholze–Weinstein §6.3 (Theorem 6.3.4, Lemma 6.3.6), using the universal cover H̃ and its quasi-logarithm into M(H) ⊗ B⁺_cris (IG.3/flag-points-and-p-divisible-groups for the (T, W) classification at points).
2. Preperfectoid: M′_∞ is a closed subspace of the perfectoid H̃^{ad,h}_η (perfectoid open polydisc), cut out by the rank conditions.
3. The PEL version is the closed subfunctor respecting O_B-action and polarization.

Uses:

- IG.3/local-hodge-tate-period-map: M_{D^int,∞} is the closed subspace of M_∞ respecting the PEL structure
- CS17 Theorem 4.2.4: preperfectoidness and the rational description of M_{D^int,∞} are inherited from M_∞

API:

- `SWInfiniteLevel` (constructor): M_∞ for a p-divisible group H over a perfect field.
- `SWInfiniteLevel.preperfectoid` (instance): M_∞ is a preperfectoid adic space with M_∞ ∼ lim_n M_n.
- `SWInfiniteLevel.eq_tuples` (equivalence): M_∞ ≅ M′_∞ (tuples in the universal cover with the rank and exactness conditions).
- `SWInfiniteLevel.actions` (functoriality): GL_h(ℚ_p) acts on α and J_H(ℚ_p) on ρ, compatibly with the period maps.
- `SWInfiniteLevel.pel` (other): For an unramified local PEL datum, M_{D^int,∞} ⊂ M_∞ is closed.

Unit tests:

- `SWInfiniteLevel.mu` (computation): For H = μ_{p^∞}, M_∞ is a profinite set (no positive-dimensional deformation, d = h).
- `SWInfiniteLevel.etale` (degenerate): For H étale (d = 0), M_∞ ≅ GL_h(ℚ_p), a locally profinite set: deformations are unique and points are quasi-isogenies with trivialized Tate modules.
- `SWInfiniteLevel.tower_not_stationary` (non-example): For H of height h ≥ 1, no transition map M_{n+1} → M_n is an isomorphism (it is a finite étale torsor under the nontrivial kernel of GL_h(ℤ/p^{n+1}) → GL_h(ℤ/p^n), resp. GL_h(𝔽_p) for n = 0), so M_∞ is not any finite-level M_n.

Acceptance:

- For H = μ_{p^∞} (h = d = 1), M_∞ is the profinite set ℤ_p^× × ℤ (as the moduli of trivialized deformations of μ_{p^∞} up to quasi-isogeny is discrete).

Depends on: `pel-rapoport-zink-space`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`, `HodgeTateAndCanonicalSubgroups:T2`, `PerfectoidSpaces:P2/perfectoid-space`, `PerfectoidSpaces:P2/sheaf-theorem-and-almost-acyclicity`, `PerfectoidSpaces:P7/perfectoid-tilde-limit`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`.

Used by: `local-hodge-tate-period-map`.

Sources:

- Theorem 6.3.4, p. 59 (§6.3; Definition 6.3.3 of M_∞); proof pp. 59–62 (sw13): “Theorem 6.3.4. The functor M∞ is representable by an adic space over Spa(W (k)[ 1p ], W (k)). Moreover, M∞ is preperfectoid, and” — Scholze–Weinstein Theorem 6.3.4: representability and preperfectoidness of M_∞.
- Definition 6.3.5 and Lemma 6.3.6, p. 60; proof pp. 60–62 (sw13): “Lemma 6.3.6. There is a natural isomorphism of functors M∞ ∼” — Scholze–Weinstein Lemma 6.3.6: the description M_∞ ≅ M′_∞.
- CS17 §4.2, proof of Theorem 4.2.4, p. 701 (cs17): “Lemma 6.3.6 of [SW13] shows that M∞ ∼ → M0 ∞, and we have a commutative diagram” — CS17 uses the Scholze–Weinstein description of M_∞.

### `mantovan-formula` — Mantovan's formula: a filtration of the cohomology of the good-reduction Shimura variety by Igusa and Rapoport–Zink contributions (Koshikawa Theorem 7.1)

Declaration `IgusaVarietiesAndTorsionConcentration:IG.3/mantovan-formula` (theorem).

For an integral PEL datum of type (A) or (C) unramified at p with hyperspecial level and ℓ ≠ p, there is a filtration of RΓ(S_{K^p,ℚ̄_p}, 𝔽_ℓ) by complexes of smooth G(ℚ_p) × W_{E_p}-representations whose graded pieces are indexed by b ∈ B(G_{ℚ_p}, μ^{−1}) (ordered compatibly with the closure relations) and equal to RΓ(Ig^b, 𝔽_ℓ)^{op} ⊗^L_{C_c(J_b(ℚ_p))} RΓ_c(M_{(G,b,μ),∞}, 𝔽_ℓ(d_b))[2d_b], with Ig^b the perfect Igusa variety (dimension d_b = ⟨2ρ, ν_b⟩) and M_{(G,b,μ),∞} the local Shimura variety at infinite level.

Hypotheses:

- PEL type (A) or (C) unramified at p, hyperspecial K_p; for non-proper Shimura varieties, use the good-reduction locus and IG.3/good-reduction-locus-cohomology.

Proof or construction:

1. Stratify the perfectoid Shimura variety S°_{K^p} by the preimages of the Newton strata S^b (IG.3/newton-strata-correspond); the excision filtration has graded pieces RΓ_c-type cohomology of the strata.
2. By the product formula (IG.3/product-formula) each stratum is (Ig^b × M^b_∞)/J_b(ℚ_p) on perfectoid points, giving the tensor product over the Hecke algebra C_c(J_b(ℚ_p)) by a Künneth formula for the J_b(ℚ_p)-quotient (Koshikawa §7; Mantovan, Hamacher–Kim).
3. Poincaré duality on the smooth Igusa varieties converts RΓ_c into RΓ with the twist (d_b)[2d_b].

Acceptance:

- For b basic, the graded piece is the cohomology of the basic Rapoport–Zink uniformization; for b ordinary it is the parabolic induction of Igusa cohomology.

Depends on: `product-formula`, `newton-strata-correspond`, `igusa-cohomology`, `good-reduction-locus-cohomology`, `HeckeStacksAndLocalShtukas:HS2/minuscule-rigidification`, `HeckeStacksAndLocalShtukas:HS2/levels-and-tower-limit`, `SmoothRepresentationsOfLocalGroups:SR.0`, `SmoothRepresentationsOfLocalGroups:SR.2`.

Used by: `koshikawa-generic-vanishing`.

Sources:

- §7 'Mantovan’s formula', Theorem 7.1 and Remark 7.2, pp. 9–10 (perfect Igusa varieties Ig^b recalled in §6, p. 9) (kos21): “Theorem 7.1. There is a filtration of RΓ(SK p ,Q , Fℓ ) by complexes of smooth rep- resentations of G(Qp ) × WEp whose graded pieces are” — Koshikawa Theorem 7.1: Mantovan's formula as a filtration with Igusa and local Shimura variety graded pieces.

## IG.4. Nearby-cycle semiperversity and support bounds

IG.4 proves the two degree bounds. Equivariant sites and the finite-level formal models give, for a cofinal system of affinoid neighbourhoods U of a flag point, formal models whose mod-p maps from finite level are integral. The finite-level models are what LefschetzPencilsAndVanishingCycles LPV.6 needs. In the compact case the nearby cycles are perverse, and the minimal stratum has Igusa cohomology in exactly one degree (CS17 Proposition 6.1.3, Corollary 6.1.4). In the non-compact case, ℓ-power tame level kills the toroidal boundary, and the nearby cycles of Rπ°_HT*𝔽_ℓ are semiperverse (^pD^{≥d}), by left t-exactness of nearby cycles and the filtered-colimit support criterion imported from LPV.6. The partially compactly supported cohomology H_{c−∂} vanishes above d_b by Artin vanishing on the affine Ig^{b,*}. Ordinary cohomology H vanishes below d_b at a Newton point with d_b minimal among those with nonzero localized cohomology. The two bounds concern different complexes.

Imports from other roadmaps in this layer: `AdicCoefficientsAndComparisons:L5/normal-crossing-local-comparison`, `AdicSpacesPartII:F0/locally-noetherian-formal-scheme`, `AdicSpacesPartII:R2/admissible-formal-scheme`, `AdicSpacesPartII:R2/formal-etale-site-invariance`, `ArithmeticGaloisDuality:R02.2/hochschild-serre-spectral-sequence`, `ArithmeticLocallySymmetricSpaces:ALS.6/finite-cover-hochschild-serre`, `BunGAndNewtonStrata:BG2:uniformization/semicontinuity-and-local-constancy`, `BunGAndNewtonStrata:BG3`, `ClassicalAdicEtaleCohomology:H0/overconvergent-etale-sheaves`, `ClassicalAdicEtaleCohomology:H0/overconvergent-morphisms-maximal-stalks`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/formal-nearby-cycles-comparison`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/scheme-completion-comparison-3-5-13`, `DiamondEtaleCohomology:C0/etale-site`, `DiamondEtaleCohomology:C0/quasi-pro-etale-site`, `EtaleDualityAndPerverseSheaves:EDC.0/enhanced-compact-pushforward`, `EtaleDualityAndPerverseSheaves:EDC.4/affine-vanishing-hypercohomology`, `EtaleDualityAndPerverseSheaves:EDC.5/affine-perverse-artin-vanishing`, `EtaleDualityAndPerverseSheaves:EDC.5/perverse-t-structure`, `EtaleDualityAndPerverseSheaves:EDC.5/t-exact-functor`, `LefschetzPencilsAndVanishingCycles:LPV.0/scheme-adic-trait-comparison`, `LefschetzPencilsAndVanishingCycles:LPV.6`, `LefschetzPencilsAndVanishingCycles:LPV.6/filtered-colimit-support-criterion`, `LefschetzPencilsAndVanishingCycles:LPV.6/nearby-perverse-exactness`, `PerfectoidShimuraVarieties:S3/affinoid-perfectoid-basis-of-flag-variety`, `PerfectoidShimuraVarieties:S3/hodge-compactified-period-maps`, `PerfectoidShimuraVarieties:S3/hodge-open-period-map`, `SchemeAndStackFoundations:SF.4`, `ShimuraCompactifications:C5/formal-completion`, `ShimuraCompactifications:C5/higher-level-toroidal-normalization`, `ShimuraCompactifications:C5/integral-toroidal-space`.

### `equivariant-sites-and-nearby-cycles` — Equivariant étale sites of the flag variety and nearby cycles of K_p-equivariant formal models (CS17 §6.1)

Declaration `IgusaVarietiesAndTorsionConcentration:IG.4/equivariant-sites-and-nearby-cycles` (construction). Suggested home: `TauCeti/ShimuraVarieties/Igusa/Semiperversity` (`TauCeti.Igusa`).

For a locally profinite group acting continuously, Scholze's equivariant étale sites give (Fℓ_{G,μ}/G(ℚ_p))_ét and (𝒮_{K^p}/G(ℚ_p))_ét with π_HT/G(ℚ_p) between them; R(π_HT/G(ℚ_p))_*𝔽_ℓ pulls back to Rπ_HT*𝔽_ℓ along (Fℓ_{G,μ})_ét → (Fℓ_{G,μ}/G(ℚ_p))_ét (pass to slice categories to replace G(ℚ_p) by a compact open K_p, then to the limit). For an étale U = Spa(A, A°) → Fℓ_{G,μ}, every sufficiently small K_p ⊂ G(ℚ_p) acts continuously on U and trivially on U_s = Spec(A°/p) (finite generation of A°/p), so étale maps to U_s̄ lift K_p-equivariantly to 𝔘_{O_C}, 𝔘 = Spf A°, giving the nearby-cycle morphism of sites λ_{U/K_p} : (U_η̄/K_p)_ét → U_{s̄,ét}.

Hypotheses:

- Continuous action of a locally profinite group on an analytic adic space (Scholze, Lubin–Tate paper §2).

Proof or construction:

1. Define the equivariant sites as in Scholze [Sch15b, §2] (the bibliography entry of CS17 for [Sch15b] duplicates [Sch15a]; sourceIssues PAPER-CARAIANI-SCHOLZE-17/E13).
2. Pullback compatibility: [Sch15b, Props. 2.8–2.9].
3. Extension of the K_p-action to small étale neighbourhoods [Sch15b, Cor. 2.5]; triviality on U_s by continuity; equivariant lifting of étale maps through the formal-scheme étale site (AdicSpacesPartII R2: the étale site of a formal scheme is that of its special fibre).

Uses:

- IG.4/compact-perversity: the perversity statement is for Rλ_{U/K_p*} of the equivariant pushforward
- IG.4/finite-level-formal-models: nearby cycles of the equivariant pushforward are computed on finite-level formal models

API:

- `equivariantSite` (constructor): (X/G)_ét for a continuous action of a locally profinite group G on X.
- `equivariantSite.pullback` (compatibility): R(π/G)_*F pulls back to Rπ_*F along X_ét → (X/G)_ét.
- `equivariantSite.slice` (characterisation): For K ⊂ G compact open, (X/K)_ét is a slice of (X/G)_ét.
- `nearbyCyclesEquivariant` (constructor): λ_{U/K_p} : (U_η̄/K_p)_ét → U_{s̄,ét} for small K_p.

Unit tests:

- `equivariantSite.trivial_group` (degenerate): For G trivial, (X/G)_ét = X_ét.
- `equivariantSite.finite_group` (computation): For a finite group G acting freely on X, (X/G)_ét ≅ (X/G)_ét of the quotient space.
- `equivariantSite.not_quotient` (non-example): For G(ℚ_p) acting on Fℓ, (Fℓ/G(ℚ_p))_ét is not the étale site of any adic space (the action has positive-dimensional orbits).

Acceptance:

- For K_p acting trivially on Fℓ (e.g. the Hecke operators away from p), the equivariant site is the ordinary one.

Depends on: `DiamondEtaleCohomology:C0/etale-site`, `DiamondEtaleCohomology:C0/quasi-pro-etale-site`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/scheme-completion-comparison-3-5-13`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/formal-nearby-cycles-comparison`, `SchemeAndStackFoundations:SF.4`, `AdicSpacesPartII:F0/locally-noetherian-formal-scheme`, `AdicSpacesPartII:R2/admissible-formal-scheme`, `AdicSpacesPartII:R2/formal-etale-site-invariance`, `PerfectoidShimuraVarieties:S3/hodge-open-period-map`, `PerfectoidShimuraVarieties:S3/hodge-compactified-period-maps`.

Used by: `finite-level-formal-models`, `compact-perversity`.

Sources:

- CS17 §6.1, p. 751 (cs17): “Thus, we work with the equivariant sites introduced in [Sch15b, §2]. First, note that RπHT∗F` is a canonically a” — Introduces the equivariant sites.
- CS17 §6.1, p. 751 (cs17): “It follows that any étale map to Us lifts to a Kp-equivariant étale map to UOC (where C = Cp), giving a natural morphism of sites λU/Kp : (Uη̄/Kp)ét →” — Construction of the nearby-cycle morphism λ_{U/K_p}.

### `finiteness-from-rank-one-valuative-criterion` — Affine maps of finite type over 𝔽_p satisfying the rank-one valuative criterion are finite (CS17 proof of Proposition 6.1.3)

Declaration `IgusaVarietiesAndTorsionConcentration:IG.4/finiteness-from-rank-one-valuative-criterion` (lemma).

Let f : X → Y be a morphism of affine schemes of finite type over 𝔽_p such that, for every algebraically closed field K with a rank-one valuation ring V ⊂ K, every V-point of Y together with a K-point of X lifting its generic point extends to a V-point of X. Then f is proper, hence finite.

Hypotheses:

- X, Y affine of finite type over 𝔽_p.

Proof or construction:

1. For finite type schemes over a field, the valuative criterion may be tested on discrete (in particular rank-one) valuation rings with algebraically closed fraction fields (EGA II 7.3.8 / Stacks 0CM2 restricted to rank one).
2. Existence part of the criterion gives universally closed; f is separated (affine), and of finite type; so f is proper (Mathlib IsProper.of_valuativeCriterion after reducing to the rank-one case).
3. Proper and affine implies finite.

Acceptance:

- A closed immersion satisfies the criterion; an open immersion Spec 𝔽_p[t, t^{−1}] → Spec 𝔽_p[t] does not.

Depends on: `mathlib:AlgebraicGeometry.IsProper.of_valuativeCriterion`, `mathlib:AlgebraicGeometry.ValuativeCriterion`, `mathlib:AlgebraicGeometry.IsFinite`.

Used by: `finite-level-formal-models`, `compact-perversity`.

Sources:

- CS17 §6.1, proof of Proposition 6.1.3, p. 753 (cs17): “Thus, πHT,Kp,Us is a map of affine schemes of finite type over Fp that satisfies the valuative criterion of properness; i.e., it is finite.32 Now consider the following” — The valuative criterion gives finiteness.

### `finite-level-formal-models` — Cofinal affinoid neighbourhoods of the flag variety with finite-level formal models of their preimages (CSnc proof of Theorem 4.6.1; CS17 Proposition 6.1.3)

Declaration `IgusaVarietiesAndTorsionConcentration:IG.4/finite-level-formal-models` (construction). Suggested home: `TauCeti/ShimuraVarieties/Igusa/Semiperversity` (`TauCeti.Igusa`).

Every geometric point x of Fℓ_C has a cofinal system of affinoid étale neighbourhoods U = Spa(A) → Fℓ_C such that: (1) S^*_{K(p^∞N),U} := S^*_{K(p^∞N),C} ×_{Fℓ_C} U is affinoid perfectoid, = Spa(R_{K(p^∞N),U}), and is the preimage of an affinoid U′ = S^*_{K(p^mN),U} étale over S^*_{K(p^mN),C} for m large; (2) with 𝔘 = Spf(A°), the reduction modulo p of Spf(R°_{K(p^∞N),U}) → 𝔘 factors over Spec(R°_{K(p^mN),U}/p) → Spec(A°/p) for m large, and this map of affine schemes is integral (finite at each finite level), so pushforward along it preserves the perverse lower bound ^pD^{≥d}; (3) the same holds with toroidal compactifications and with auxiliary ℓ-power tame level. These formal models, with the transition maps in p-level and ℓ-level and the boundary maps, are the finite-level geometry from which the semiperverse bound is deduced.

Hypotheses:

- p unramified in F, N ≥ 3 prime to p, Σ as in CSnc Remark 2.5.6; C complete algebraically closed over ℚ_p with residue field k; ℓ ≠ p; d = [F⁺:ℚ]n².

Proof or construction:

1. (1) Scholze [Sch15, Thm 4.1.1] (PerfectoidShimuraVarieties S3 affinoid perfectoid basis of the flag variety) gives affinoid perfectoid preimages coming from finite level; refining by composites of finite étale maps and rational embeddings keeps the property and is cofinal.
2. (2) A°/p is of finite presentation over O_C/p, so the map factors through a finite level; it satisfies the rank-one valuative criterion because π^*_HT is partially proper (argument of CS17 Prop. 6.1.3), hence is integral by IG.4/finiteness-from-rank-one-valuative-criterion at each finite level.
3. Integral maps preserve ^pD^{≥d} under pushforward (finite pushforward is t-exact: EtaleDualityAndPerverseSheaves EDC.5).

Uses:

- IG.4/semiperversity: the semiperverse bound is proved on these formal models
- LefschetzPencilsAndVanishingCycles:LPV.6: its Igusa semiperversity interface takes these finite-level formal models and transition maps as input, before the filtered-colimit step

API:

- `FormalNeighbourhood` (constructor): U = Spa(A) → Fℓ_C with 𝔘 = Spf A° and the finite-level affinoid U′ = S^*_{K(p^mN),U}.
- `FormalNeighbourhood.cofinal` (characterisation): Such U form a cofinal system of étale neighbourhoods of each geometric point.
- `FormalNeighbourhood.integral` (other): Spec(R°_{K(p^mN),U}/p) → Spec(A°/p) is integral (finite at each level).
- `FormalNeighbourhood.pushforward_ge` (relation): Pushforward along it preserves ^pD^{≥d}.
- `FormalNeighbourhood.transition` (functoriality): Compatible with the transition maps in p-level and ℓ-level and with the toroidal boundary.

Unit tests:

- `FormalNeighbourhood.rational_point` (characterisation): The system is stable under refinement: if U belongs to it, so does every composite V → U of finite étale maps and rational embeddings (CS17 proof of Proposition 6.1.3).
- `FormalNeighbourhood.level_zero` (degenerate): At finite level m the map Spec(R°/p) → Spec(A°/p) is finite.
- `FormalNeighbourhood.not_proper_generic` (non-example): If d_{b(x)} > 0, the generic-fibre map π_{HT,U} has positive-dimensional fibres although its mod-p model is ind-finite (CS17 footnote 32); for basic x the fibres are 0-dimensional.

Acceptance:

- For x a rational flag (ordinary point), U can be taken a small disc around x and S^*_{K(p^∞N),U} is the ordinary locus over U.

Depends on: `equivariant-sites-and-nearby-cycles`, `finiteness-from-rank-one-valuative-criterion`, `good-reduction-locus`, `PerfectoidShimuraVarieties:S3/affinoid-perfectoid-basis-of-flag-variety`, `EtaleDualityAndPerverseSheaves:EDC.5/perverse-t-structure`, `EtaleDualityAndPerverseSheaves:EDC.5/affine-perverse-artin-vanishing`, `EtaleDualityAndPerverseSheaves:EDC.5/t-exact-functor`, `PerfectoidShimuraVarieties:S3/hodge-open-period-map`, `PerfectoidShimuraVarieties:S3/hodge-compactified-period-maps`.

Used by: `compact-perversity`, `semiperversity`.

Sources:

- CSnc §4.6, proof of Theorem 4.6.1, p. 62 (csnc): “satisﬁes the valuative criterion of properness (cf. proof of [CS17, Proposition 6.1.3]), so is an integral map. In particular, pushforward preserves” — The mod-p map is integral, so pushforward preserves the perverse lower bound.
- CSnc §4.6, proof of Theorem 4.6.1, p. 61 (csnc): “By [Sch15, Theorem 4.1.1], for a coﬁnal collection of U, the ﬁbre product S ∗ K(p∞N),U := S ∗ K(p∞N),C ×FℓC U is aﬃnoid perfectoid; moreover, it arises via base change from some” — Affinoid perfectoid preimages from finite level.

### `compact-perversity` — Perversity of the nearby cycles of Rπ_HT*𝔽_ℓ for compact Hodge-type Shimura varieties (CS17 Proposition 6.1.3)

Declaration `IgusaVarietiesAndTorsionConcentration:IG.4/compact-perversity` (theorem).

Let π_HT : 𝒮_{K^p} → Fℓ_{G,μ} be the Hodge–Tate period map of a compact Shimura variety of Hodge type, K^p ⊂ G(𝔸_f^p) sufficiently small, and x̄ a geometric point of Fℓ_{G,μ}. Then x̄ has a neighbourhood basis of affinoid étale neighbourhoods U = Spa(A, A°) such that, with 𝔘 = Spf(A°), Rλ_{U/K_p*}(R(π_HT/G(ℚ_p))_*𝔽_ℓ)|_{U_η̄/K_p}[⟨2ρ, μ⟩] is a perverse sheaf on 𝔘_s̄ for every sufficiently small pro-p compact open K_p ⊂ G(ℚ_p). This is the compact-case strengthening (full perversity), not merged with the non-compact one-sided bound of IG.4/semiperversity.

Hypotheses:

- Compact Shimura variety of Hodge type (Prop. 6.1.3 is stated for Hodge type; CS17 §6.1).

Proof or construction:

1. Choose U as in IG.4/finite-level-formal-models: S_{K^p,U} affinoid perfectoid, preimage of an affinoid S_{K_pK^p,U} étale over finite level for small K_p, with the equivalence of sites (S_{K^p,U}/K_p)_ét ≅ S_{K_pK^p,U,ét} ([Sch15b, Prop. 2.12]).
2. π_HT is partially proper, so the mod-p map π_{HT,K_p,U_s} : 𝔖_{K_pK^p,U,s} → U_s of affine finite type 𝔽_p-schemes satisfies the rank-one valuative criterion and is finite (IG.4/finiteness-from-rank-one-valuative-criterion; with the corrected first step of sourceIssues PAPER-CARAIANI-SCHOLZE-17/E91).
3. Compute the pushforward via the lower-left corner: the nearby cycles of 𝔽_ℓ on the smooth proper finite-level model are perverse up to the shift ⟨2ρ, μ⟩ = dim (Illusie's t-exactness of nearby cycles [Ill94, Cor. 4.5] and Huber's comparison [Hub96, Thm 3.5.13]), and finite pushforward preserves perversity.

Acceptance:

- Valid with 𝔽_ℓ replaced by ℤ/ℓ^n or ℚ̄_ℓ (Li–Liu use the ℚ̄_ℓ version).

Depends on: `equivariant-sites-and-nearby-cycles`, `finite-level-formal-models`, `finiteness-from-rank-one-valuative-criterion`, `LefschetzPencilsAndVanishingCycles:LPV.6/nearby-perverse-exactness`, `LefschetzPencilsAndVanishingCycles:LPV.0/scheme-adic-trait-comparison`, `LefschetzPencilsAndVanishingCycles:LPV.6`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/scheme-completion-comparison-3-5-13`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/formal-nearby-cycles-comparison`, `EtaleDualityAndPerverseSheaves:EDC.5/perverse-t-structure`, `EtaleDualityAndPerverseSheaves:EDC.5/affine-perverse-artin-vanishing`, `EtaleDualityAndPerverseSheaves:EDC.5/t-exact-functor`, `PerfectoidShimuraVarieties:S3/hodge-open-period-map`, `PerfectoidShimuraVarieties:S3/hodge-compactified-period-maps`.

Used by: `compact-minimal-stratum-concentration`.

Sources:

- CS17 §6.1, Proposition 6.1.3, p. 751 (cs17): “Proposition 6.1.3. Let πHT : SKp → F`G,µ be the Hodge-Tate period map for a compact Shimura variety of Hodge type and any sufficiently small compact open subgroup Kp ⊂ G(Ap f). Let x̄ ∈ F`G,µ be a geometric point. Then there” — States the perversity of nearby cycles in the compact Hodge-type case.

### `compact-minimal-stratum-concentration` — Concentration of generic Igusa cohomology at a minimal stratum: the compact case (CS17 Corollary 6.1.4)

Declaration `IgusaVarietiesAndTorsionConcentration:IG.4/compact-minimal-stratum-concentration` (theorem).

Suppose the Shimura variety is compact, of PEL type (A) or (C) with good reduction at p (as in IG.3/compact-fibre-theorem), ℓ ≠ p. Let S be a finite set of primes containing p with K^p = K^p_S K^S, K^S hyperspecial, 𝕋^S = ℤ[G(𝔸_f^S)//K^S] (or any subalgebra of it acting on Rπ_HT*𝔽_ℓ), and 𝔪 ⊂ 𝕋^S maximal. Among the b ∈ B(G, μ^{−1}) with H^i(Ig^b, 𝔽_ℓ)[𝔪] ≠ 0 for some i, choose b with d_b = ⟨2ρ, ν_b⟩ minimal. Then H^i(Ig^b, 𝔽_ℓ)[𝔪] is nonzero only for i = d_b. The same holds with ℚ̄_ℓ-coefficients, and (Li–Liu, footnote 16) the argument is asserted to apply when only one factor of the level at p is hyperspecial in their Harris–Taylor type setting.

Hypotheses:

- Compact PEL type (A) or (C) Shimura variety with good reduction at p; S ∋ p (implicit in CS17, sourceIssues of PAPER-CARAIANI-SCHOLZE-17 item 117).

Proof or construction:

1. H^i(Ig^b, 𝔽_ℓ) = colim_m H^i(Ig^b_{Mant,m}, 𝔽_ℓ) with split injective transitions (averaging over compact opens of J_b(ℚ_p)), so 𝔪-torsion is nonzero iff the 𝔪-localization is.
2. (Rπ_HT*𝔽_ℓ)_𝔪 is concentrated on Fℓ^{≥d_b} := ⋃_{d_{b′} ≥ d_b} Fℓ^{b′}, closed of dimension ⟨2ρ, μ⟩ − d_b (IG.3/flag-newton-strata-dimension and IG.3/compact-fibre-theorem).
3. By IG.4/compact-perversity its nearby cycles on formal models are perverse; on the largest stratum of the support a perverse sheaf is concentrated in one degree, and computing stalks at rank-one points of dimension ⟨2ρ, μ⟩ − d_b as filtered colimits over the neighbourhood basis gives the claim (with the corrected displays of sourceIssues PAPER-CARAIANI-SCHOLZE-17/E92–E94).

Acceptance:

- If b is ordinary and minimal, H^i(Ig^{ord}, 𝔽_ℓ)[𝔪] ≠ 0 only for i = d.

Depends on: `compact-perversity`, `compact-fibre-theorem`, `flag-newton-strata-dimension`, `igusa-cohomology`, `EtaleDualityAndPerverseSheaves:EDC.5/perverse-t-structure`, `EtaleDualityAndPerverseSheaves:EDC.5/affine-perverse-artin-vanishing`, `EtaleDualityAndPerverseSheaves:EDC.5/t-exact-functor`.

Sources:

- CS17 §6.1, Corollary 6.1.4, p. 753 (cs17): “Corollary 6.1.4. Fix a maximal ideal m ⊂ TS, and among all b ∈ B(G,µ−1) with the property that the m-torsion Hi (Igb ,F`)[m] 6= 0 for some i ∈ Z, take some b with d = h2ρ,νbi minimal. Then Hi(Igb ,F`)[m] is nonzero only for i =” — Concentration at the minimal stratum in the compact case.
- Proof of Lemma 7.3 and footnote 16, p. 35 (lil21): “16Strictly speaking, the authors assumed that the level at p is hyperspecial maximal. In our case, we only require that Lu is hyperspecial. However, by our special signature condition, the argument of [CS17] works in our case verbatim.” — Li–Liu footnote 16: the use of CS17 Corollary 6.1.4 with ℚ̄_ℓ coefficients and the relaxed level at p.

### `ell-power-boundary-killing` — At ℓ^∞ tame level the toroidal boundary carries no cohomology (CSnc Lemmas 4.6.2–4.6.3)

Declaration `IgusaVarietiesAndTorsionConcentration:IG.4/ell-power-boundary-killing` (theorem).

(1) For j_{Nℓ^∞} : S_{K(Nℓ^∞),ℚ̄} ↪ S^tor_{K(Nℓ^∞),ℚ̄} (inverse limits over the levels Nℓ^m taken in schemes), the natural map 𝔽_ℓ → Rj_{Nℓ^∞,*}𝔽_ℓ is an isomorphism. (2) For any Igusa variety Ig^X, the restriction H^i(Ig^{X,tor}_{K(Nℓ^∞)}, 𝔽_ℓ) → H^i(Ig^X_{K(Nℓ^∞)}, 𝔽_ℓ) is an isomorphism. Consequently Rπ^tor_{HT,ℓ^∞,*}𝔽_ℓ → Rπ°_{HT,ℓ^∞,*}𝔽_ℓ is an isomorphism.

Hypotheses:

- p unramified in F, N ≥ 3 prime to p, Σ as in CSnc Remark 2.5.6; C complete algebraically closed over ℚ_p with residue field k; ℓ ≠ p; d = [F⁺:ℚ]n².

Proof or construction:

1. At each finite level the toroidal boundary is a normal-crossings divisor, so R¹j_*𝔽_ℓ is freely generated at each point by the local Kummer classes of the divisors through it and R^ij_*𝔽_ℓ = Λ^i R¹j_*𝔽_ℓ (purity; HodgeTateAndCanonicalSubgroups T6:log-sites Kummer computation, or the scheme version of Pink [Pin92, §2.7]).
2. Going up the ℓ-power tower, the boundary divisors become more ramified with transition maps of degree divisible by ℓ, which kill R^ij_* for i > 0 in the colimit.
3. (2) Reduce to completely slope divisible X and the finite-level Ig^X_{m,K(Nℓ^∞)} ⊂ Ig^{X,tor}_{m,K(Nℓ^∞)}, which have the same local structure as Shimura varieties along the boundary (IG.2/toroidal-igusa-finite-level).
4. The consequence: combine (2) with IG.3/open-fibre-theorem and IG.3/compactified-fibre-theorem stalkwise.

Acceptance:

- For the modular curve: at full ℓ-power level the cusp neighbourhoods are punctured discs whose fundamental group ℤ_ℓ(1) is killed, so H¹ gains nothing from the cusps.

Depends on: `toroidal-igusa-finite-level`, `open-fibre-theorem`, `compactified-fibre-theorem`, `AdicCoefficientsAndComparisons:L5/normal-crossing-local-comparison`, `ShimuraCompactifications:C5/integral-toroidal-space`, `ShimuraCompactifications:C5/formal-completion`, `ShimuraCompactifications:C5/higher-level-toroidal-normalization`.

Used by: `semiperversity`.

Sources:

- CSnc §4.6, Lemma 4.6.2, p. 61 (csnc): “Lemma 4.6.2. The natural map Fℓ → RjNℓ∞,∗Fℓ is an isomorphism. Proof. This is a standard” — Boundary-killing at ℓ^∞ level.
- CSnc §4.6, Lemma 4.6.3, p. 61 (csnc): “Lemma 4.6.3. For any Igusa variety IgX , the restriction map Hi (IgX,tor K(Nℓ∞),Fℓ) → Hi (IgX K(Nℓ∞),Fℓ) is an isomorphism. Proof. One can assume” — The Igusa version.

### `semiperversity` — Semiperversity of the nearby cycles of Rπ°_HT*𝔽_ℓ (CSnc Theorem 4.6.1 = Theorem 2.8.3) ★

Declaration `IgusaVarietiesAndTorsionConcentration:IG.4/semiperversity` (theorem). Planet: Semiperversity of nearby cycles.

Consider Rπ°_HT*𝔽_ℓ ∈ D(Fℓ_C, 𝔽_ℓ) for π°_HT : S°_{K(p^∞N),C} → Fℓ_C. Every geometric point x of Fℓ_C has a cofinal system of affinoid étale neighbourhoods U = Spa(A) → Fℓ_C such that, with 𝔘 = Spf(A°), the nearby cycles satisfy Rψ(Rπ°_HT*𝔽_ℓ)|_𝔘 ∈ ^pD^{≥d}(𝔘_k, 𝔽_ℓ), d = [F⁺:ℚ]n². The statement is local (for such cofinal U), in the scheme-theoretic perverse t-structure on the special fibres 𝔘_k; it is not a statement about a perverse t-structure on Fℓ itself.

Hypotheses:

- p unramified in F, N ≥ 3 prime to p, Σ as in CSnc Remark 2.5.6; C complete algebraically closed over ℚ_p with residue field k; ℓ ≠ p; d = [F⁺:ℚ]n².

Proof or construction:

1. By Hochschild–Serre it suffices to treat π°_{HT,ℓ^∞} with ℓ^∞ tame level; by IG.4/ell-power-boundary-killing replace it by π^tor_{HT,ℓ^∞}.
2. Choose U as in IG.4/finite-level-formal-models; nearby cycles commute with pushforward, so reduce to Rψ(Rg^{∞,∞}_{m*}𝔽_ℓ) ∈ ^pD^{≥d}(Spec(R°_{K(p^mN),U}/p)) for g^{∞,∞}_m : S^tor_{K(p^∞Nℓ^∞),U} → U′ = S^*_{K(p^mN),U}.
3. Write Rg^{∞,∞}_{m*}𝔽_ℓ = colim_{m₁,m₂} Rg^{m₁,m₂}_{m*}𝔽_ℓ; for fixed m₁, colim_{m₂} Rg_*𝔽_ℓ ≅ colim_{m₂} Rg_*Rj_*𝔽_ℓ (scheme-level boundary killing), which is the pushforward from the open Shimura variety, an algebraization of an étale map to S^*_{K(p^mN),C}.
4. On the scheme level, 𝔽_ℓ on the smooth open Shimura variety of dimension d lies in ^pD^{≥d} (𝔽_ℓ[d] is perverse), and its nearby cycles stay in ^pD^{≥d} by t-exactness of nearby cycles (Illusie [Ill94]; LefschetzPencilsAndVanishingCycles LPV.6) and Huber's comparison [Hub96, Thm 3.5.13]; the filtered colimit over levels preserves the lower bound (LefschetzPencilsAndVanishingCycles LPV.6 filtered-colimit support criterion), and so does pushforward along the integral map of IG.4/finite-level-formal-models.

Acceptance:

- For F imaginary quadratic and n = 1 (d = 1): the nearby cycles at a supersingular (basic) point have no cohomology below degree 1 after the perverse shift.
- The compact analogue is full perversity (IG.4/compact-perversity); here only the lower bound holds.

Depends on: `finite-level-formal-models`, `ell-power-boundary-killing`, `good-reduction-locus`, `LefschetzPencilsAndVanishingCycles:LPV.6/nearby-perverse-exactness`, `LefschetzPencilsAndVanishingCycles:LPV.0/scheme-adic-trait-comparison`, `LefschetzPencilsAndVanishingCycles:LPV.6`, `LefschetzPencilsAndVanishingCycles:LPV.6/filtered-colimit-support-criterion`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/scheme-completion-comparison-3-5-13`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/formal-nearby-cycles-comparison`, `EtaleDualityAndPerverseSheaves:EDC.5/perverse-t-structure`, `EtaleDualityAndPerverseSheaves:EDC.5/affine-perverse-artin-vanishing`, `EtaleDualityAndPerverseSheaves:EDC.5/t-exact-functor`, `ArithmeticGaloisDuality:R02.2/hochschild-serre-spectral-sequence`, `ArithmeticLocallySymmetricSpaces:ALS.6/finite-cover-hochschild-serre`.

Used by: `minimal-stratum-lower-bound`.

Sources:

- CSnc §4.6, Theorem 4.6.1, p. 60 (csnc): “Theorem 4.6.1. Consider Rπ◦ HT∗Fℓ ∈ D(FℓC,Fℓ). Any geometric point x of FℓC has a cofinal system of affinoid étale neighborhoods U = Spa(A) → FℓC such that, denoting U = Spf(A◦ ), the nearby cycles Rψ(Rπ◦ HT∗Fℓ)|U ∈ p D≥d (Uk,Fℓ)” — Semiperversity statement in local form.
- CSnc §4.6, end of proof of Theorem 4.6.1, p. 63 (csnc): “Now the result follows from t-exactness of nearby cycles for the perverse t-structure, cf. [Ill94] (and compatibility of nearby cycles between” — Uses t-exactness of nearby cycles and Huber's comparison.

### `partial-support-cohomology` — Partially compactly supported Igusa cohomology H^i_{c−∂}(Ig^b, 𝔽_ℓ) (CSnc §2.8) ★

Declaration `IgusaVarietiesAndTorsionConcentration:IG.4/partial-support-cohomology` (definition). Planet: Partially compactly supported Igusa cohomology. Suggested home: `TauCeti/ShimuraVarieties/Igusa/Semiperversity` (`TauCeti.Igusa`).

For b ∈ B(G_{ℚ_p}, μ^{−1}) with completely slope divisible X_b and j : Ig^b ↪ Ig^{b,*} the open immersion into the partial minimal compactification (IG.2/minimal-igusa-compactification), define RΓ_{c−∂}(Ig^b, 𝔽_ℓ) := RΓ(Ig^{b,*}, j_!𝔽_ℓ) and H^i_{c−∂}(Ig^b, 𝔽_ℓ) := H^i(Ig^{b,*}, j_!𝔽_ℓ), at each finite level and in the colimit over levels. It carries the action of 𝕋^S and the natural map H^i_{c−∂}(Ig^b, 𝔽_ℓ) → H^i(Ig^b, 𝔽_ℓ) induced by j_!𝔽_ℓ → Rj_*𝔽_ℓ. This is not the ordinary compactly supported cohomology RΓ_c(Ig^b) (Ig^{b,*} is not proper), and not RΓ(Ig^b) unless the boundary is empty.

Hypotheses:

- p unramified in F, N ≥ 3 prime to p, Σ as in CSnc Remark 2.5.6; C complete algebraically closed over ℚ_p with residue field k; ℓ ≠ p; d = [F⁺:ℚ]n².
- X_b completely slope divisible.

Proof or construction:

1. Define by the formula at each finite level Ig^{b,*}_m and pass to the colimit along the finite transition maps.
2. The Hecke action: prime-to-p Hecke correspondences extend to Ig^{b,*}_m (normalization is functorial), and j_! is compatible with them.

Uses:

- IG.4/artin-vanishing-upper-bound: H^i_{c−∂} vanishes above d_b by Artin vanishing on the affine Ig^{b,*}
- IG.6/boundary-length-obstruction: the failure of H_{c−∂} → H to be an isomorphism is measured by the boundary complex RΓ(∂Ig^{b,*}, i^*Rj_*𝔽_ℓ)
- IG.7/only-ordinary-contributes: the upper bound on H_{c−∂} is played off against the lower bound on H

API:

- `partialSupportCohomology` (constructor): RΓ_{c−∂}(Ig^b, 𝔽_ℓ) := RΓ(Ig^{b,*}, j_!𝔽_ℓ).
- `partialSupportCohomology.toCohomology` (projection): The natural map RΓ_{c−∂}(Ig^b) → RΓ(Ig^b), 𝕋^S-equivariant.
- `partialSupportCohomology.triangle` (relation): Distinguished triangle RΓ_{c−∂}(Ig^b) → RΓ(Ig^b) → RΓ(∂Ig^{b,*}, i^*Rj_*𝔽_ℓ) →.
- `partialSupportCohomology.fromCompact` (projection): The natural map RΓ_c(Ig^b) → RΓ_{c−∂}(Ig^b).
- `partialSupportCohomology.hecke` (functoriality): Equivariant for 𝕋^S and the prime-to-p Hecke action.

Unit tests:

- `partialSupportCohomology.no_boundary` (degenerate): If X_b^{ét} = 0 then RΓ_{c−∂}(Ig^b) = RΓ(Ig^b).
- `partialSupportCohomology.ordinary_modular` (computation): For the modular curve and b ordinary at finite level m, H⁰_{c−∂}(Ig^b_m, 𝔽_ℓ) = 0 (j_! kills global sections on the affine curve with cusps added) while H⁰(Ig^b_m, 𝔽_ℓ) ≠ 0.
- `partialSupportCohomology.ne_compact` (non-example): RΓ_{c−∂}(Ig^b) ≠ RΓ_c(Ig^b) in general: Ig^{b,*} is affine, not proper, when the leaf is non-proper.

Acceptance:

- If X_b^{ét} = 0 then Ig^{b,*} = Ig^b and H^i_{c−∂} = H^i.
- For Ig^{b,*} proper (never the case for nonempty non-compact leaves) it would be H^i_c.

Depends on: `minimal-igusa-compactification`, `igusa-cohomology`, `EtaleDualityAndPerverseSheaves:EDC.0/enhanced-compact-pushforward`, `mathlib:AlgebraicGeometry.Scheme.smallEtaleTopology`.

Used by: `artin-vanishing-upper-bound`, `boundary-length-obstruction`.

Sources:

- CSnc §2.8, p. 33 (csnc): “In Section 3, we deﬁne a partial minimal compactiﬁcation j : Igb ֒→ Igb,∗ , and set Hi c−∂(Igb ,Fℓ) = Hi (Igb,∗ ,j!Fℓ). The ﬁrst result we need is” — Defines H^i_{c−∂}(Ig^b, 𝔽_ℓ) := H^i(Ig^{b,*}, j_!𝔽_ℓ).

### `artin-vanishing-upper-bound` — Upper bound: H^i_{c−∂}(Ig^b, 𝔽_ℓ) = 0 for i > d_b (CSnc Theorem 2.8.1, Proposition 2.8.2) ★

Declaration `IgusaVarietiesAndTorsionConcentration:IG.4/artin-vanishing-upper-bound` (theorem). Planet: Upper bound from Artin vanishing.

The partial minimal compactification Ig^{b,*} is affine (Theorem 2.8.1); consequently, for every ℓ ≠ p, H^i_{c−∂}(Ig^b, 𝔽_ℓ) = H^i(Ig^{b,*}, j_!𝔽_ℓ) is nonzero only for i ≤ d_b = dim Ig^b.

Hypotheses:

- p unramified in F, N ≥ 3 prime to p, Σ as in CSnc Remark 2.5.6; C complete algebraically closed over ℚ_p with residue field k; ℓ ≠ p; d = [F⁺:ℚ]n².

Proof or construction:

1. Affineness: IG.2/minimal-igusa-compactification (3) with IG.2/leaf-minimal-compactification-affine for X_b minimal (the printed proof of Theorem 2.8.1 cites Lemma 3.3.8; the affineness rests on Theorem 3.3.2 and Proposition 3.3.4).
2. Artin vanishing: for an affine scheme of finite type of dimension d_b over k and a constructible sheaf, H^i = 0 for i > d_b (EtaleDualityAndPerverseSheaves EDC.4 affine vanishing); apply at each finite level Ig^{b,*}_m (affine of dimension d_b) and pass to the colimit.

Acceptance:

- For b ordinary, H^i_{c−∂}(Ig^{ord}, 𝔽_ℓ) = 0 for i > d.

Depends on: `partial-support-cohomology`, `minimal-igusa-compactification`, `leaf-minimal-compactification-affine`, `EtaleDualityAndPerverseSheaves:EDC.4/affine-vanishing-hypercohomology`.

Used by: `boundary-length-obstruction`, `only-ordinary-contributes`, `koshikawa-generic-vanishing`.

Sources:

- CSnc §2.8, Proposition 2.8.2, p. 34 (csnc): “Proposition 2.8.2. For any ℓ 6= p, the cohomology group Hi c−∂(Igb ,Fℓ) is nonzero only for i ≤ db = dim Igb . Proof. This is a direct” — The upper bound from Artin vanishing.

### `minimal-stratum-lower-bound` — Lower bound at a minimal Newton stratum: H^i(Ig^b, 𝔽_ℓ)_𝔪 ≠ 0 implies i ≥ d_b (CSnc Lemma 2.8.4) ★

Declaration `IgusaVarietiesAndTorsionConcentration:IG.4/minimal-stratum-lower-bound` (theorem). Planet: Lower bound at a minimal Newton stratum.

Let S be a finite set of places containing ∞ and all primes dividing pℓNΔ_F, 𝔪 ⊂ 𝕋^S a maximal ideal containing ℓ, and choose b ∈ B(G_{ℚ_p}, μ^{−1}) with d_b minimal among those with H^*(Ig^b, 𝔽_ℓ)_𝔪 ≠ 0. Then H^i(Ig^b, 𝔽_ℓ)_𝔪 ≠ 0 implies i ≥ d_b. (No constructibility of the perverse sheaves is needed; Remark 2.8.5: the dual variant for Rπ^*_HT*(j_!𝔽_ℓ) would only reprove the upper bound.)

Hypotheses:

- p unramified in F, N ≥ 3 prime to p, Σ as in CSnc Remark 2.5.6; C complete algebraically closed over ℚ_p with residue field k; ℓ ≠ p; d = [F⁺:ℚ]n².

Proof or construction:

1. Let A = (Rπ°_HT*𝔽_ℓ)_𝔪 on Fℓ_C; by IG.3/open-fibre-theorem (also at higher-rank points: qcqs pushforwards of overconvergent sheaves are overconvergent) A is concentrated on ⋃_{d_{b′} ≥ d_b} Fℓ^{b′}, of dimension ≤ d − d_b (IG.3/flag-newton-strata-dimension).
2. For any formal model 𝔘 of an étale U → Fℓ_C, RψA|_𝔘 is supported on a closed subscheme of dimension ≤ d − d_b (the specialization map is specializing).
3. By IG.4/semiperversity and since localization at 𝔪 is a filtered colimit (preserving ^pD^{≥d}), RψA|_𝔘 ∈ ^pD^{≥d}; hence its stalks at points of dimension d − d_b are in degrees ≥ d − (d − d_b) = d_b.
4. For a geometric rank-one point x of dimension d − d_b, A_x is the filtered colimit of the stalks of RψA|_𝔘 at its specializations over the cofinal U; so A_x, i.e. RΓ(Ig^b, 𝔽_ℓ)_𝔪, lives in degrees ≥ d_b.

Acceptance:

- For b ordinary minimal (only the ordinary stratum contributes): H^i(Ig^{ord}, 𝔽_ℓ)_𝔪 ≠ 0 implies i ≥ d.

Depends on: `semiperversity`, `open-fibre-theorem`, `flag-newton-strata-dimension`, `igusa-cohomology`, `BunGAndNewtonStrata:BG3`, `BunGAndNewtonStrata:BG2:uniformization/semicontinuity-and-local-constancy`, `ClassicalAdicEtaleCohomology:H0/overconvergent-etale-sheaves`, `ClassicalAdicEtaleCohomology:H0/overconvergent-morphisms-maximal-stalks`, `EtaleDualityAndPerverseSheaves:EDC.5/perverse-t-structure`, `EtaleDualityAndPerverseSheaves:EDC.5/affine-perverse-artin-vanishing`, `EtaleDualityAndPerverseSheaves:EDC.5/t-exact-functor`.

Used by: `boundary-length-obstruction`, `only-ordinary-contributes`, `koshikawa-generic-vanishing`.

Sources:

- CSnc §2.8, Lemma 2.8.4, p. 34 (csnc): “Lemma 2.8.4. If Hi (Igb ,Fℓ)m 6= 0 then i ≥ db. Remark 2.8.5. One could prove a” — The lower bound at a minimal stratum.
- CSnc §2.8, proof of Lemma 2.8.4, p. 34 (csnc): “the authors wanted their perverse sheaves to be constructible, not realizing that the theory works well without constructibility. This explains the” — No constructibility is needed.

## IG.5. Rational Igusa trace comparison and genericity obstruction

IG.5 turns concentration into Galois information. The dual ideal 𝔪^∨ = ι(𝔪) of the Hecke involution carries the twisted dual Galois representation, with Frobenius eigenvalues q_v^{2n−1}α_{i,v}^{−1}; unramifiedness, length and the ratio condition survive. Poincaré duality on Igusa varieties exchanges 𝔪 and 𝔪^∨. Through the Igusa trace comparison of EndoscopicTransferAndUnitaryTraceComparison, each constituent of the alternating ℚ̄_ℓ-cohomology carries a Galois representation whose local parameter at v | p matches that of the J_b-constituent twisted by |·|^{1/2−n}. When the mod-ℓ cohomology is concentrated in one degree, the compactly supported integral cohomology at 𝔪^∨ is torsion-free and a constituent lifting 𝔪^∨ exists. Since generic principal series do not transfer to nontrivial inner forms, and lifts of generic unramified residual representations split into characters with no cyclotomic ratio, a non-ordinary b is impossible.

Imports from other roadmaps in this layer: `ArithmeticGaloisDuality:D7/derived-local-duality`, `AutomorphicGaloisRepresentationsPartII:AG2.0/frobenius-polynomial-and-conventions`, `AutomorphicGaloisRepresentationsPartII:AG2.0/galois-representation-attached-at-good-places`, `AutomorphicGaloisRepresentationsPartII:AG2.0/the-normalization-dictionary-fixed-by-the-sources`, `AutomorphicGaloisRepresentationsPartII:AG2.1a/polarized-construction-inputs-shin-and-chenevier-harris`, `AutomorphicGaloisRepresentationsPartII:AG2.5/caraiani-upgrade-away-from-p-and-temperedness`, `AutomorphicGaloisRepresentationsPartII:AG2.5/varma-semisimplified-comparison-and-monodromy-bound`, `AutomorphicGaloisRepresentationsPartII:AG2.7/completely-split-generic-prime`, `AutomorphicGaloisRepresentationsPartII:AG2.7/dual-and-character-twist-hecke-comparison`, `AutomorphicGaloisRepresentationsPartII:AG2.7/existential-decomposed-genericity`, `AutomorphicGaloisRepresentationsPartII:AG2.7/genericity-transfer-and-projective-qualification`, `AutomorphicGaloisRepresentationsPartII:AG2.7/residual-hecke-ideal-independence`, `AutomorphicGaloisRepresentationsPartII:AG2.7/residual-representation-of-pi`, `AutomorphicGaloisRepresentationsPartII:AG2.7/strong-local-decomposed-genericity`, `AutomorphicGaloisRepresentationsPartII:AG2.7/the-residual-ratio-condition-for-taylor-wiles-primes`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4`, `EndoscopicTransferAndUnitaryTraceComparison:ET.5`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7b`, `EtaleDualityAndPerverseSheaves:EDC.2:pairings/galois-frobenius-equivariance`, `EtaleDualityAndPerverseSheaves:EDC.2:pairings/poincare-duality-torsion`, `IntegralHeckeAndGaloisDeterminants:IHG.3/frobenius-conversion`, `SmoothRepresentationsOfLocalGroups:SR.1`, `tauceti:HeckeAntiInvolution.ofAmbient`, `tauceti:HeckeAntiInvolution.onHeckeCoset`, `tauceti:HeckeCosetModule.instRingHeckeRing`.

### `dual-hecke-ideal` — The dual Hecke ideal 𝔪^∨ = ι(𝔪) for the unitary similitude Hecke algebra and its Galois dictionary ★

Declaration `IgusaVarietiesAndTorsionConcentration:IG.5/dual-hecke-ideal` (definition). Planet: Dual Hecke ideal. Suggested home: `TauCeti/ShimuraVarieties/Igusa/DualIdeal` (`TauCeti.Igusa`).

Let ι : 𝕋^S → 𝕋^S be the anti-involution [K_qgK_q] ↦ [K_qg^{−1}K_q] of the spherical Hecke algebra (commutative, so an involution), obtained from the inversion g ↦ g^{−1} of G(ℚ_q) by the double-coset anti-involution formalism (Tau Ceti HeckeAntiInvolution.ofAmbient; the smooth-representation owner is SmoothRepresentationsOfLocalGroups SR.1). For a maximal ideal 𝔪 ⊂ 𝕋^S with finite residue field set 𝔪^∨ := ι(𝔪). At a prime v | q ∉ S split in F₀, G(ℚ_q) = GL_{2n}(F_v) × ∏_{w|𝔮, w≠v} GL_{2n}(F_w) × ℚ_q^× and ι(T_{i,v}) = T_{2n,v}^{−1}T_{2n−i,v}; if 𝔪 is of Galois type with ρ_𝔪 (Frobenius polynomial X^{2n} − T_{1,v}X^{2n−1} + … + q_v^{n(2n−1)}T_{2n,v}, geometric Frobenius), then 𝔪^∨ is of Galois type with ρ_{𝔪^∨} ≅ ρ_𝔪^∨ ⊗ |Art_F^{−1}|^{1−2n}, Art_F sending uniformizers to geometric Frobenius; the Frobenius eigenvalues of ρ_{𝔪^∨} at v are q_v^{2n−1}α_{i,v}^{−1}. Hence ρ_𝔪 = ρ_{𝔪^∨}^∨ ⊗ |Art_F^{−1}|^{1−2n}, and unramifiedness at v, the length of ρ_𝔪 and the condition α_i ≠ q_vα_j (i ≠ j) are preserved by 𝔪 ↦ 𝔪^∨.

Hypotheses:

- Standing assumptions of CSnc §5: p unramified in F; F contains an imaginary quadratic F₀ in which p splits; F⁺ ≠ ℚ; a character ϖ : 𝔸^×_{F₀}/F₀^× → ℂ^× extending the quadratic character of F₀/ℚ; S ⊇ {∞} ∪ {primes dividing pℓΔ_F} ∪ {primes where ϖ ramifies}; level N ≥ 3 divisible only by primes in S^p_f = S_fin ∖ {p} and by the integer N₀ of CSnc Remark 5.4.5; ι_ℓ : ℚ̄_ℓ ≅ ℂ fixed.

Proof or construction:

1. Construct ι on each local Hecke algebra ℤ[G(ℚ_q)//G(ℤ_q)] from g ↦ g^{−1} (it preserves G(ℤ_q) and maps double cosets to double cosets), and tensor over q ∉ S split in F₀.
2. Compute ι(T_{i,v}): the double coset of diag(ϖ_v^{(i)}, 1^{(2n−i)})^{−1} equals that of ϖ_v^{−1}·diag(ϖ_v^{(2n−i)}, 1^{(i)}) by the Weyl group, giving T_{2n,v}^{−1}T_{2n−i,v}.
3. Galois dictionary: the Satake parameters of ι-transformed characters are the inverses; with the normalisation of the Frobenius polynomial this gives eigenvalues q_v^{2n−1}α_{i,v}^{−1} (AutomorphicGaloisRepresentationsPartII AG2.7 dual comparison with n replaced by 2n; geometric Frobenius conversion of IntegralHeckeAndGaloisDeterminants IHG.3; the global Artin map with geometric normalization from the Tau Ceti class field theory roadmap).
4. Invariance of length, unramifiedness and the ratio condition under dual and twist (AG2.7 genericity transfer).

Uses:

- IG.5/genericity-forces-ordinary: the rational constituent obtained from H_c(Ig^b, ℤ_ℓ) has Hecke eigenvalues lifting 𝔪^∨, not 𝔪
- IG.7/caraiani-scholze-vanishing: part (2) for H_c is deduced from part (1) at 𝔪^∨ by Poincaré duality
- IG.6/boundary-length-obstruction: the boundary obstruction is computed at 𝔪^∨

API:

- `heckeInvolution` (constructor): ι : 𝕋^S → 𝕋^S, [KgK] ↦ [Kg^{−1}K], a ring involution of the commutative Hecke algebra.
- `heckeInvolution_involutive` (simp): ι ∘ ι = id.
- `dualIdeal` (constructor): 𝔪^∨ := ι(𝔪), a maximal ideal with the same residue field.
- `heckeInvolution_T` (simp): ι(T_{i,v}) = T_{2n,v}^{−1}T_{2n−i,v}.
- `dualIdeal_galois` (relation): ρ_{𝔪^∨} ≅ ρ_𝔪^∨ ⊗ |Art_F^{−1}|^{1−2n}; eigenvalues q_v^{2n−1}α_{i,v}^{−1}.
- `dualIdeal_preserves` (other): Length, unramifiedness at places v ∤ ℓ and the condition α_i ≠ q_vα_j are invariant under 𝔪 ↦ 𝔪^∨ (above ℓ the twist |Art_F^{−1}|^{1−2n} reduced mod ℓ is in general ramified).
- `heckeInvolution_compat_tauceti` (compatibility): ι agrees with the Tau Ceti HeckeAntiInvolution.ofAmbient construction for the inversion anti-automorphism.

Unit tests:

- `dualIdeal_dual` (degenerate): (𝔪^∨)^∨ = 𝔪.
- `dualIdeal_rank_two` (computation): For 2n = 2 and eigenvalues {α, β} of ρ_𝔪(Frob_v), the eigenvalues for 𝔪^∨ are {q_v/α, q_v/β}.
- `dualIdeal_ne` (non-example): 𝔪^∨ ≠ 𝔪 in general: for ρ_𝔪 with eigenvalues {1, 2} at q_v = 7 over 𝔽_ℓ, ℓ = 11, the dual has eigenvalues {7, 7/2}.
- `heckeInvolution_compat` (compatibility): ι is induced by HeckeAntiInvolution.ofAmbient applied to g ↦ g^{−1} (Tau Ceti, TauCeti/NumberTheory/HeckeRing/Commutativity.lean).

Acceptance:

- For n = 1 (rank 2) and ρ_𝔪 with eigenvalues {α, β}, ρ_{𝔪^∨} has eigenvalues {q_v/α, q_v/β}.

Depends on: `tauceti:HeckeAntiInvolution.ofAmbient`, `tauceti:HeckeAntiInvolution.onHeckeCoset`, `tauceti:HeckeCosetModule.instRingHeckeRing`, `SmoothRepresentationsOfLocalGroups:SR.1`, `AutomorphicGaloisRepresentationsPartII:AG2.7/dual-and-character-twist-hecke-comparison`, `IntegralHeckeAndGaloisDeterminants:IHG.3/frobenius-conversion`, `AutomorphicGaloisRepresentationsPartII:AG2.7/genericity-transfer-and-projective-qualification`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`, `quasi-split-unitary-datum`.

Used by: `igusa-poincare-duality`, `concentrated-cohomology-gives-constituent`, `genericity-forces-ordinary`, `boundary-length-obstruction`, `caraiani-scholze-vanishing`.

Sources:

- CSnc §5.1, proof of Corollary 5.1.3, p. 66 (csnc): “Recall the involution ι : TS → TS , as in [ACC+ 23, §2.2.11] and set m∨ := ι(m). By the assumption of” — The involution of the Hecke algebra and the dual ideal.
- §2.2.19 'Duality and twisting', pp. 35–37: anti-involutions ι, ι̃ (p. 35), m^∨ := ι(m) (p. 36), Proposition 2.2.20 and Corollary 2.2.21 (pp. 36–37) (acc23): “is a maximal ideal with residue field a finite exten- sion of k, then we define m e ∨ = ιe(m) (resp. m∨ = ι(m)).” — ACC+ §2.2.19: the anti-involutions ι and m^∨ := ι(m), Proposition 2.2.20, Corollary 2.2.21.

### `igusa-poincare-duality` — Hecke-equivariant Poincaré duality for Igusa varieties with the dual ideal

Declaration `IgusaVarietiesAndTorsionConcentration:IG.5/igusa-poincare-duality` (theorem).

Let Ig = Ig^b_{Mant,m,K(N)} be a finite-level Igusa variety (smooth of dimension d_b over k) and Λ = ℤ/ℓ^n or ℤ_ℓ. Then RΓ_c(Ig, Λ) ≅ RHom_Λ(RΓ(Ig, Λ), Λ)[−2d_b](−d_b), and under this isomorphism T ∈ 𝕋^S acts on the left through ι(T) on the right. Consequently, for 𝔪 ⊂ 𝕋^S, RΓ_c(Ig, Λ)_{𝔪^∨} ≅ RHom_Λ(RΓ(Ig, Λ)_𝔪, Λ)[−2d_b](−d_b), compatibly with the transition maps: pullback on RΓ along a finite étale transition Ig_{m′} → Ig_m is dual to the trace on RΓ_c. (Since a dual turns colimits into limits, this is not a duality between colim_m RΓ_c and colim_m RΓ.)

Hypotheses:

- Standing assumptions of CSnc §5: p unramified in F; F contains an imaginary quadratic F₀ in which p splits; F⁺ ≠ ℚ; a character ϖ : 𝔸^×_{F₀}/F₀^× → ℂ^× extending the quadratic character of F₀/ℚ; S ⊇ {∞} ∪ {primes dividing pℓΔ_F} ∪ {primes where ϖ ramifies}; level N ≥ 3 divisible only by primes in S^p_f = S_fin ∖ {p} and by the integer N₀ of CSnc Remark 5.4.5; ι_ℓ : ℚ̄_ℓ ≅ ℂ fixed.
- ℓ ≠ p.

Proof or construction:

1. Poincaré–Verdier duality for the smooth variety Ig over the separably closed k with torsion or ℓ-adic coefficients (EtaleDualityAndPerverseSheaves EDC.2 pairings).
2. Hecke correspondences: the transpose of the correspondence for [KgK] is the correspondence for [Kg^{−1}K], so duality intertwines T and ι(T) (EDC.2 equivariance of the pairing).
3. Localization: 𝔪-localization on one side corresponds to ι(𝔪)-localization on the other.

Acceptance:

- If H^i(Ig, 𝔽_ℓ)_𝔪 is nonzero in exactly one degree i₀, then H^j_c(Ig, ℤ_ℓ)_{𝔪^∨} is nonzero only for j = 2d_b − i₀ and is torsion-free.

Depends on: `dual-hecke-ideal`, `igusa-cohomology`, `EtaleDualityAndPerverseSheaves:EDC.2:pairings/poincare-duality-torsion`, `EtaleDualityAndPerverseSheaves:EDC.2:pairings/galois-frobenius-equivariance`.

Used by: `concentrated-cohomology-gives-constituent`, `boundary-length-obstruction`.

Sources:

- CSnc §5.1, proof of Corollary 5.1.3, p. 66 (csnc): “By the assumption of concentration in one degree and Poincaré duality, it follows that Hi c(Igb K(N),Zℓ)m∨ is also concentrated in one degree and torsion-free, so there must be some j ∈ J such that ψj : TS → Qℓ reduces to m∨ .” — Poincaré duality with the dual ideal gives concentration and torsion-freeness of compactly supported cohomology.

### `galois-representations-for-igusa-constituents` — Galois representations attached to the constituents of Igusa cohomology (CSnc Theorem 5.1.2) ★

Declaration `IgusaVarietiesAndTorsionConcentration:IG.5/galois-representations-for-igusa-constituents` (theorem). Planet: Galois representations of Igusa constituents.

Under the standing assumptions of §5 (listed in the hypotheses), write [H_c(Ig^b_{K(N)}, ℚ̄_ℓ)] := Σ_i (−1)^i [colim_m H^i_c(Ig^b_{m,K(N)}, ℚ̄_ℓ)] = Σ_{j∈J} n_j π_j ⊗ ψ_j as a virtual representation of J_b(ℚ_p) × 𝕋^S (π_j irreducible smooth, ψ_j : 𝕋^S → ℚ̄_ℓ characters, n_j ≠ 0, pairwise distinct). For each j there is a continuous semisimple ρ_j : Gal(F̄/F) → GL_{2n}(ℚ̄_ℓ), almost everywhere unramified, unramified at every v | q ∉ S with q split in F₀, with characteristic polynomial of ρ_j(Frob_v) equal to X^{2n} − ψ_j(T_{1,v})X^{2n−1} + … + (−1)^i q_v^{i(i−1)/2}ψ_j(T_{i,v})X^{2n−i} + … + q_v^{n(2n−1)}ψ_j(T_{2n,v}); and for v | p the semisimple Langlands parameter of π_{j,v}|·|^{1/2−n} (via Badulescu's Jacquet–Langlands for the inner form J_{b_v} of a Levi of GL_{2n}(F_v)) equals the semisimple parameter of ρ_j|_{Gal(F̄_v/F_v)}.

Hypotheses:

- Standing assumptions of CSnc §5: p unramified in F; F contains an imaginary quadratic F₀ in which p splits; F⁺ ≠ ℚ; a character ϖ : 𝔸^×_{F₀}/F₀^× → ℂ^× extending the quadratic character of F₀/ℚ; S ⊇ {∞} ∪ {primes dividing pℓΔ_F} ∪ {primes where ϖ ramifies}; level N ≥ 3 divisible only by primes in S^p_f = S_fin ∖ {p} and by the integer N₀ of CSnc Remark 5.4.5; ι_ℓ : ℚ̄_ℓ ≅ ℂ fixed.
- Semisimple Langlands parameters as in CSnc Remark 5.1.1: restriction of a Frobenius-semisimple WD representation along w ↦ (w, diag(|w|^{1/2}, |w|^{−1/2})).

Proof or construction:

1. Shin's stable trace formula for Igusa varieties (EndoscopicTransferAndUnitaryTraceComparison ET.5) and its comparison with the twisted trace formula for 𝒢_n⃗ without proper cuspidal subsets for F⁺ ≠ ℚ (ET.4, ET.7b) express tr(φ | [H_c(Ig^b)]) through θ-stable cohomological isobaric Π^n⃗ on Res_{F/ℚ}GL_n⃗ (CSnc Theorem 5.6.1, Lemma 5.6.2).
2. Use the corrected normalisation: Red^b with the δ̄^{1/2}_{P(ν_b)} twist applied exactly once, and cohomologicality with respect to Ξ(φ_n⃗) rather than the trivial representation (inherited CS17 errors PAPER-CARAIANI-SCHOLZE-17/E74, E77, recorded for CSnc as IgusaVarietiesAndTorsionConcentration/E6).
3. Attach Galois representations to the pieces Π_i of Π^n⃗ (CSnc Theorem 5.7.1, from AutomorphicGaloisRepresentationsPartII AG2.1a/AG2.5 with the Harris–Taylor normalisation), and combine with the character of F₀ to obtain ρ_j.
4. Local–global compatibility at v | p through Red^b and the semisimple parameter (ET.6 local Langlands for GL_m and inner forms, Badulescu).

Acceptance:

- For b ordinary, the constituents π_j are (twists of) parabolic inductions from the Levi, and ρ_j|_{Gal(F̄_v/F_v)} is a sum of characters matching the Jacquet module.
- Recheck at v | p: the normalisation |·|^{1/2−n} matches the corrected Red^b (RT-PAPER-CARAIANI-SCHOLZE-24/30).

Depends on: `alternating-igusa-cohomology`, `EndoscopicTransferAndUnitaryTraceComparison:ET.5`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7b`, `AutomorphicGaloisRepresentationsPartII:AG2.1a/polarized-construction-inputs-shin-and-chenevier-harris`, `AutomorphicGaloisRepresentationsPartII:AG2.0/galois-representation-attached-at-good-places`, `AutomorphicGaloisRepresentationsPartII:AG2.5/caraiani-upgrade-away-from-p-and-temperedness`, `AutomorphicGaloisRepresentationsPartII:AG2.5/varma-semisimplified-comparison-and-monodromy-bound`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6`, `AutomorphicGaloisRepresentationsPartII:AG2.0/the-normalization-dictionary-fixed-by-the-sources`, `AutomorphicGaloisRepresentationsPartII:AG2.0/frobenius-polynomial-and-conventions`.

Used by: `concentrated-cohomology-gives-constituent`, `genericity-forces-ordinary`, `boundary-length-obstruction`.

Sources:

- CSnc §5.1, Theorem 5.1.2, p. 65 (csnc): “Theorem 5.1.2. Assume that the level N is divisible by some N0 ≥ 3 as in Remark 5.4.5; in particular, N0 is only divisible by primes in Sp f := Sfin \ {p}. For each j ∈ J, there is a continuous” — Galois representations for the constituents of Igusa cohomology.
- CSnc §5.1, p. 64 (csnc): “In this section, we make the following further assumptions: (1) The CM ﬁeld F contains an imaginary quadratic ﬁeld F0 in which p is split; (2) The totally real subﬁeld F+ is not equal to Q. We also” — The standing assumptions of §5.

### `concentrated-cohomology-gives-constituent` — From mod-ℓ Igusa cohomology concentrated in one degree to a rational constituent with the dual residual Hecke system

Declaration `IgusaVarietiesAndTorsionConcentration:IG.5/concentrated-cohomology-gives-constituent` (theorem).

Under the standing assumptions, suppose H^i(Ig^b_{K(N)}, 𝔽_ℓ)_𝔪 is nonzero for exactly one i. Then H^*_c(Ig^b_{K(N)}, ℤ_ℓ)_{𝔪^∨} is concentrated in one degree and torsion-free, the corresponding ℚ̄_ℓ-cohomology is a nonzero lattice-bearing 𝕋^S-module whose eigencharacters lift 𝔪^∨, and in the decomposition of [H_c(Ig^b_{K(N)}, ℚ̄_ℓ)] there is j ∈ J with ψ_j ≡ 𝔪^∨ (mod the maximal ideal of ℤ̄_ℓ) and n_j ≠ 0 (no cancellation, since only one degree contributes). The semisimplified reduction ρ̄_{𝔪^∨} of ρ_j (IG.5/galois-representations-for-igusa-constituents) is independent of the choice of j and of the lattice.

Hypotheses:

- Standing assumptions of CSnc §5: p unramified in F; F contains an imaginary quadratic F₀ in which p splits; F⁺ ≠ ℚ; a character ϖ : 𝔸^×_{F₀}/F₀^× → ℂ^× extending the quadratic character of F₀/ℚ; S ⊇ {∞} ∪ {primes dividing pℓΔ_F} ∪ {primes where ϖ ramifies}; level N ≥ 3 divisible only by primes in S^p_f = S_fin ∖ {p} and by the integer N₀ of CSnc Remark 5.4.5; ι_ℓ : ℚ̄_ℓ ≅ ℂ fixed.

Proof or construction:

1. Concentration and torsion-freeness: IG.5/igusa-poincare-duality and the universal coefficient theorem (H^*(·, 𝔽_ℓ) = H^*(·, ℤ_ℓ) ⊗^L 𝔽_ℓ): a localized finite complex of ℤ_ℓ-modules whose reduction mod ℓ is concentrated in one degree has torsion-free cohomology in that degree only.
2. Finiteness at each finite level (IG.1/igusa-cohomology) and smoothness give a lattice in the ℚ̄_ℓ-cohomology stable under 𝕋^S and J_b(ℚ_p)-open compacts; the alternating sum has no cancellation because only one degree is nonzero.
3. Eigencharacters of 𝕋^S on a nonzero lattice reduce to 𝔪^∨; Brauer–Nesbitt and Chebotarev make ρ̄_{𝔪^∨} independent of choices (AutomorphicGaloisRepresentationsPartII AG2.7 residual representation).

Acceptance:

- If H^i(Ig^b, 𝔽_ℓ)_𝔪 is nonzero in two degrees, the virtual class may cancel and no constituent need exist: the hypothesis is essential.

Depends on: `igusa-poincare-duality`, `galois-representations-for-igusa-constituents`, `igusa-cohomology`, `dual-hecke-ideal`, `AutomorphicGaloisRepresentationsPartII:AG2.7/residual-representation-of-pi`, `AutomorphicGaloisRepresentationsPartII:AG2.7/residual-hecke-ideal-independence`.

Used by: `genericity-forces-ordinary`.

Sources:

- CSnc §5.1, proof of Corollary 5.1.3, p. 66 (csnc): “so there must be some j ∈ J such that ψj : TS → Qℓ reduces to m∨ . Then we can apply Theorem 5.1.2, deﬁne ρm∨ as the semisimpliﬁcation of the” — The constituent with eigencharacter reducing to the dual ideal.

### `generic-lift-splits` — Local lifts of an unramified generic residual representation (CS17 Lemma 6.2.2; CSnc proof of Corollary 5.1.3)

Declaration `IgusaVarietiesAndTorsionConcentration:IG.5/generic-lift-splits` (lemma).

Let L/ℚ_p be finite with residue cardinality q, ℓ ≠ p, and ρ : Gal(L̄/L) → GL_m(ℚ̄_ℓ) continuous whose semisimplified reduction ρ̄ is unramified with Frobenius eigenvalues α₁, …, α_m satisfying α_i ≠ qα_j for i ≠ j. (1) If ρ̄ is moreover decomposed generic at L (α_i/α_j ∉ {1, q} for i ≠ j), then ρ ≅ ⊕χ_i is a sum of characters with χ_a/χ_b not the cyclotomic character for a ≠ b, so the corresponding representation of GL_m(L) is a generic principal series. (2) Without assuming the α_i distinct: if q ≢ 1 mod ℓ then ρ is unramified; if q ≡ 1 mod ℓ then ρ is a direct sum of characters whose pairwise ratios are not the cyclotomic character (repeated eigenvalues are allowed).

Hypotheses:

- ℓ ≠ p; α_i ≠ qα_j for i ≠ j.

Proof or construction:

1. Conjugate ρ into GL_m(O_K), diagonal modulo ϖ; successively conjugate to be diagonal modulo higher powers of ϖ. The obstructions lie in H¹(Gal(L̄/L), χ_a/χ_b) for unramified χ with eigenvalue λ, which vanishes for λ ∉ {1, q} (local Euler characteristic and Tate duality).
2. (2) (CSnc footnote 17): compare the deformation theory of the unramified sum of characters as representations of Gal(L̄/L) and of Gal(𝔽̄_q/𝔽_q): under α_i ≠ qα_j the obstructions, deformations and automorphisms coincide; if q ≢ 1 mod ℓ the tame inertia acts through ℓ-power-order quotients on which q acts with no fixed points, forcing ρ unramified; if q ≡ 1 mod ℓ only the splitting into characters survives.

Acceptance:

- For m = 2 and α₁ = α₂ = 1 with q ≢ 1 mod ℓ, every lift is unramified (no Steinberg-type lift exists since 1 ≠ q·1 mod ℓ).

Depends on: `AutomorphicGaloisRepresentationsPartII:AG2.7/the-residual-ratio-condition-for-taylor-wiles-primes`, `AutomorphicGaloisRepresentationsPartII:AG2.7/completely-split-generic-prime`, `AutomorphicGaloisRepresentationsPartII:AG2.7/strong-local-decomposed-genericity`, `AutomorphicGaloisRepresentationsPartII:AG2.7/existential-decomposed-genericity`, `ArithmeticGaloisDuality:D7/derived-local-duality`.

Used by: `genericity-forces-ordinary`.

Sources:

- CS17 §6.2, Lemma 6.2.2, p. 756 (cs17): “Lemma 6.2.2. Assume that ρ : Gal(L̄/L) → GLn(Q̄`) is a continuous representation such that the reduction ρ is decomposed generic. Then ρ decomposes as a sum ρ = Ln i=1 χi of characters, and χa/χb is” — Lifts of decomposed generic residual representations split into characters.
- CSnc §5.1, proof of Corollary 5.1.3, p. 66 (csnc): “Now we distinguish two cases. If p 6≡ 1 mod ℓ, then we claim that ρj must be unramiﬁed at v; necessarily no two Frobenius eigenvalues can have ratio” — The two cases p ≢ 1 and p ≡ 1 mod ℓ.

### `genericity-forces-ordinary` — Generic residual eigenvalues at a split prime force the ordinary stratum (CSnc Corollary 5.1.3 = Theorem 2.8.6) ★

Declaration `IgusaVarietiesAndTorsionConcentration:IG.5/genericity-forces-ordinary` (theorem). Planet: Genericity forces the ordinary stratum.

Assume the standing assumptions and let 𝔪 ⊂ 𝕋^S be a maximal ideal such that H^i(Ig^b_{K(N)}, 𝔽_ℓ)_𝔪 ≠ 0 in exactly one degree. Then there is a continuous semisimple ρ̄_𝔪 : Gal(F̄/F) → GL_{2n}(𝔽̄_ℓ), unramified at every v | q ∉ S with q split in F₀, with ρ̄_𝔪(Frob_v) of characteristic polynomial the reduction modulo 𝔪 of X^{2n} − T_{1,v}X^{2n−1} + … + (−1)^i q_v^{i(i−1)/2}T_{i,v}X^{2n−i} + … + q_v^{n(2n−1)}T_{2n,v}; namely ρ̄_𝔪 := (ρ̄_{𝔪^∨})^∨ ⊗ |Art_F^{−1}|^{1−2n} (the source prints the formula without the contragredient, sourceIssues IgusaVarietiesAndTorsionConcentration/E3). If moreover p splits completely in F and for all v | p, ρ̄_𝔪 is unramified at v with Frobenius eigenvalues α_{1,v}, …, α_{2n,v} satisfying α_{i,v} ≠ pα_{j,v} for i ≠ j (the residual ratio predicate owned by AutomorphicGaloisRepresentationsPartII AG2.7; repeated eigenvalues allowed), then b is ordinary.

Hypotheses:

- Standing assumptions of CSnc §5: p unramified in F; F contains an imaginary quadratic F₀ in which p splits; F⁺ ≠ ℚ; a character ϖ : 𝔸^×_{F₀}/F₀^× → ℂ^× extending the quadratic character of F₀/ℚ; S ⊇ {∞} ∪ {primes dividing pℓΔ_F} ∪ {primes where ϖ ramifies}; level N ≥ 3 divisible only by primes in S^p_f = S_fin ∖ {p} and by the integer N₀ of CSnc Remark 5.4.5; ι_ℓ : ℚ̄_ℓ ≅ ℂ fixed.
- p splits completely in F for the last assertion.

Proof or construction:

1. Existence: IG.5/concentrated-cohomology-gives-constituent gives j with ψ_j lifting 𝔪^∨ and ρ̄_{𝔪^∨}; set ρ̄_𝔪 := (ρ̄_{𝔪^∨})^∨ ⊗ |Art_F^{−1}|^{1−2n} and use IG.5/dual-hecke-ideal for the characteristic polynomials.
2. Ordinarity: if b is not ordinary, J_b is a nontrivial inner form of a Levi of G_{ℚ_p}, so for some v | p, J_{b_v} is a nontrivial inner form of a Levi of GL_{2n}(F_v) = GL_{2n}(ℚ_p); no irreducible π_v of J_{b_v}(F_v) has semisimple parameter a sum of characters χ₁ ⊕ … ⊕ χ_{2n} with no χ_i/χ_j cyclotomic (generic principal series do not transfer to nontrivial inner forms: CS17 Lemma 5.4.3, EndoscopicTransferAndUnitaryTraceComparison ET.6).
3. By IG.5/galois-representations-for-igusa-constituents, the parameter of π_{j,v}|·|^{1/2−n} is that of ρ_j|_{Gal(F̄_v/F_v)}; ρ_j reduces to ρ̄_{𝔪^∨}, whose eigenvalues p^{2n−1}α_{i,v}^{−1} still satisfy the ratio condition (IG.5/dual-hecke-ideal), so by IG.5/generic-lift-splits ρ_j|_{G_{F_v}} is a sum of characters with no cyclotomic ratio (both cases p ≢ 1 and p ≡ 1 mod ℓ): contradiction.

Acceptance:

- For b basic and n = 1 (Shimura curve-type datum), generic ρ̄_𝔪 at p forces the basic Igusa cohomology to vanish after localization.
- Distinct from AG2.7's predicate: IG.5 proves the dual-Hecke-normalized Igusa obstruction using that predicate (RS-12).

Depends on: `concentrated-cohomology-gives-constituent`, `galois-representations-for-igusa-constituents`, `dual-hecke-ideal`, `generic-lift-splits`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6`, `AutomorphicGaloisRepresentationsPartII:AG2.7/the-residual-ratio-condition-for-taylor-wiles-primes`, `AutomorphicGaloisRepresentationsPartII:AG2.7/completely-split-generic-prime`, `AutomorphicGaloisRepresentationsPartII:AG2.7/strong-local-decomposed-genericity`, `AutomorphicGaloisRepresentationsPartII:AG2.7/existential-decomposed-genericity`, `AutomorphicGaloisRepresentationsPartII:AG2.7/residual-representation-of-pi`, `AutomorphicGaloisRepresentationsPartII:AG2.7/residual-hecke-ideal-independence`.

Used by: `boundary-length-obstruction`, `only-ordinary-contributes`.

Sources:

- CSnc §5.1, Corollary 5.1.3, p. 66 (csnc): “Corollary 5.1.3. Let N be divisible by N0 as above. Assume that m ⊂ TS is a maximal ideal such that Hi (Igb K(N),Fℓ)m 6= 0 in exactly one degree. Then there exists a continuous semisimple Galois” — Statement of the genericity obstruction.
- CSnc §2.8, Theorem 2.8.6, p. 35 (csnc): “Theorem 2.8.6. Assume that F+ 6= Q, that p is split in the imaginary quadratic field F0 ⊂ F, and that b ∈ B(GQp ,µ−1 ) is such that Hi (Igb ,Fℓ)m is nonzero for exactly one i. Then there exists a” — The same statement as used in the main argument.

## IG.6. Equivariant Igusa boundary formula

IG.6 computes the boundary of Igusa varieties. The boundary of Ig^{b,*} is stratified by the maximal rational parabolics P_r, and each stratum is parabolically induced from P_b(ℚ_p) × P(𝔸_f^p). The comparison map is the cup product of the lower-rank Igusa cohomology (b_P) with the cohomology of the GL_r locally symmetric space. The latter is realized through a continuous map from the punctured perfectoid neighbourhood to GL_r(F)\(X_r × GL_r(𝔸_{F,f})). A toroidal computation on Igusa cusp labels shows it is an isomorphism, which is Pink's formula for Igusa varieties. It is an equivariant isomorphism of complexes, not an equality of Euler characteristics. With the Hecke restriction maps for parabolic induction and inflation, the boundary obstruction follows by induction on n, using IG.4 and IG.5 at every rank: Galois representations exist for every nonzero localized Igusa cohomology, and a failure of H_{c−∂} → H at a non-ordinary b forces at least three constituents.

Imports from other roadmaps in this layer: `AdicCoefficientsAndComparisons:L5/normal-crossing-local-comparison`, `ArithmeticLocallySymmetricSpaces:ALS.0/locally-symmetric-space`, `ArithmeticLocallySymmetricSpaces:ALS.1/betti-complexes`, `ArithmeticLocallySymmetricSpaces:ALS.2/borel-serre-bordification`, `ArithmeticLocallySymmetricSpaces:ALS.2/boundary-stratification`, `ArithmeticLocallySymmetricSpaces:ALS.4/boundary-stratum-hecke-comparison`, `ArithmeticLocallySymmetricSpaces:ALS.4/parabolic-hecke-maps`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/generic-fibre-cohomology-3-5-14`, `EtaleDualityAndPerverseSheaves:EDC.0/enhanced-compact-pushforward`, `IntegralHeckeAndGaloisDeterminants:IHG.0/determinant`, `IntegralHeckeAndGaloisDeterminants:IHG.0/determinant-direct-sum`, `IntegralHeckeAndGaloisDeterminants:IHG.1/algebraically-closed-reconstruction`, `IntegralHeckeAndGaloisDeterminants:IHG.4/inverse-limit-determinant`, `NeronModelsAndSemistableAbelianVarieties:R11.3/raynaud-extension-comparison`, `ShimuraCompactifications:C4/degeneration-effectivity`, `ShimuraCompactifications:C4/formal-universal-degeneration`, `ShimuraCompactifications:C4/polarized-degeneration-data`, `SmoothRepresentationsOfLocalGroups:SR.0`, `SmoothRepresentationsOfLocalGroups:SR.2`, `TorsionCohomologyInfrastructure:TC.4`.

### `boundary-strata-by-parabolics` — Boundary strata of Ig^{b,*} indexed by rational parabolics and the lower-rank Igusa datum b_P (CSnc §6.1)

Declaration `IgusaVarietiesAndTorsionConcentration:IG.6/boundary-strata-by-parabolics` (construction). Suggested home: `TauCeti/ShimuraVarieties/Igusa/Boundary` (`TauCeti.Igusa`).

The boundary ∂Ig^{b,*} ⊂ Ig^{b,*} is stratified by the conjugacy classes [P] of maximal rational parabolics of G_ℚ, represented by P_r = Stab(0 ⊂ F^r ⊂ F^{2n−r} ⊂ F^{2n}), r = 1, …, n: Ig^{b,*}_{[P_r]} is the preimage of the strata S_Z ⊂ S^* whose cusp label Z = (Z_N, X) has rk_{O_F} X = r; the strata are Hecke-equivariant and pass to the limit Ig^{b,*}_{∞,[P]}. The Levi of the standard P = P_r is M = Res_{F/ℚ}GL_r × G_{2(n−r)} (G_{2(n−r)} the analogue of G with n replaced by n − r, and for r = n, G_0 = 𝔾_m is the similitude factor; printed as G_{n−r}, sourceIssues PAPER-CARAIANI-SCHOLZE-24/E11). Let X_r = (∏_{τ:F⁺↪ℝ} M^{herm,>0}_r(ℂ))/ℝ_{>0} be the symmetric space of GL_r(F ⊗ ℝ). Fix an O_F-stable symplectic filtration Z_b : 0 ⊂ Z_{b,−2} ⊂ Z_{b,−1} ⊂ X_b with Z_{b,−2} ≅ Hom(O_F^r, μ_{p^∞}); it defines the parabolic P_b(ℚ_p) ⊂ J_b(ℚ_p) of self-quasi-isogenies preserving it and the p-divisible group X_P = Z_{b,−1}/Z_{b,−2} with G_{2(n−r)}-structure (printed as Z_{b,−2}/Z_{b,−1}, sourceIssues PAPER-CARAIANI-SCHOLZE-24/E9), with isocrystal class b_P ∈ B(G_{2(n−r),ℚ_p}, μ^{−1}). With j : Ig^b_∞ ↪ Ig^{b,*}_∞ and i_{[P]} the inclusion of the stratum, RΓ_c(Ig^{b,*}_{∞,[P]}, i^*_{[P]}Rj_*𝔽_ℓ) is a complex of smooth J_b(ℚ_p) × G(𝔸_f^p)-representations.

Hypotheses:

- p unramified in F; X a p-divisible group with G-structure over k with class b; N ≥ 3 prime to p; ℓ ≠ p; Ig^b_∞ = lim_N Ig^b_{K(N)} and similarly Ig^{b,*}_∞, Ig^{b,tor}_∞; compactly supported cohomology of schemes with integral maps to schemes of finite type in Hamacher's sense (colimit over an approximating tower with finite transitions).

Proof or construction:

1. Use IG.2/minimal-igusa-boundary-strata: strata of Ig^{b,*} lie over cusp labels; group them by the rank r of X, which determines [P_r].
2. The filtration Z_b is the p-adic part of an Igusa cusp label (IG.2/igusa-cusp-labels); X_P with its polarization inherits a G_{2(n−r)}-structure (IG.0/splitting-symplectic-filtrations).
3. Compactly supported cohomology of the non-finite-type limit schemes is defined following Hamacher [Ham19].

Uses:

- IG.6/igusa-pink-formula: the cohomology of each stratum with i^*Rj_* coefficients is computed by the boundary formula
- IG.6/boundary-length-obstruction: the boundary filtration of RΓ(∂Ig^{b,*}, i^*Rj_*𝔽_ℓ) has graded pieces indexed by [P_r]

API:

- `boundaryStratum` (constructor): Ig^{b,*}_{∞,[P_r]} ⊂ ∂Ig^{b,*}_∞ for r = 1, …, n.
- `boundaryStratum_union` (characterisation): ∂Ig^{b,*}_∞ = ⊔_r Ig^{b,*}_{∞,[P_r]}, and the closure of the stratum of rank r lies in the union of the strata of rank ≥ r (equality can fail when strata are empty).
- `levelSubgroup` (constructor): P_b(ℚ_p) ⊂ J_b(ℚ_p), the stabilizer of Z_b.
- `lowerRankDatum` (constructor): X_P = Z_{b,−1}/Z_{b,−2} with G_{2(n−r)}-structure and its class b_P.
- `levi` (data): M = Res_{F/ℚ}GL_r × G_{2(n−r)} with the projections from P_b(ℚ_p) × P(𝔸_f^p) to J_{b_P}(ℚ_p) × G_{2(n−r)}(𝔸_f^p) and GL_r(𝔸_{F,f}).
- `boundaryStratum_hecke` (functoriality): The strata are stable under J_b(ℚ_p) × G(𝔸_f^p).

Unit tests:

- `boundaryStratum_n_one` (computation): For n = 1 there is exactly one boundary class (r = 1) and X_P = 0, b_P trivial.
- `boundaryStratum_basic` (degenerate): If X_b^{ét} = 0 every boundary stratum is empty.
- `lowerRankDatum_not_quotient` (non-example): X_P is the middle graded piece Z_{b,−1}/Z_{b,−2}, not Z_{b,−2}/Z_{b,−1} (which is not defined as Z_{b,−2} ⊂ Z_{b,−1}).

Acceptance:

- For n = 1 there is a single parabolic class P_1 (the Borel), M = Res_{F/ℚ}GL_1 × G_0, and the boundary strata are the cusps of the Igusa curve.
- If X_b^{ét} = 0 all strata are empty.

Depends on: `minimal-igusa-boundary-strata`, `igusa-cusp-labels`, `splitting-symplectic-filtrations`, `ArithmeticLocallySymmetricSpaces:ALS.2/borel-serre-bordification`, `ArithmeticLocallySymmetricSpaces:ALS.2/boundary-stratification`, `EtaleDualityAndPerverseSheaves:EDC.0/enhanced-compact-pushforward`, `mathlib:AlgebraicGeometry.Scheme.smallEtaleTopology`.

Used by: `boundary-parabolic-induction`, `boundary-comparison-map`, `igusa-pink-formula`, `boundary-length-obstruction`.

Sources:

- CSnc §6.1, p. 79 (csnc): “It admits a natural stratiﬁcation in terms of conjugacy classes [P] of maximal rational parabolic subgroups P ( GQ: Note that a set of representatives for these are given by the” — Stratification of the boundary by rational parabolics.
- CSnc §6.1, p. 80 (csnc): “This induces a parabolic subgroup Pb(Qp) ⊂ Jb(Qp) of the self-quasi-isogenies preserving this ﬁltration, and a p-divisible group XP = Zb,−2/Zb,−1 with G2(n−r)-structure; we denote” — The parabolic P_b(ℚ_p) and the lower-rank group X_P.

### `boundary-parabolic-induction` — The boundary strata are parabolically induced (CSnc §6.2.1)

Declaration `IgusaVarietiesAndTorsionConcentration:IG.6/boundary-parabolic-induction` (theorem).

There is a natural J_b(ℚ_p) × G(𝔸_f^p)-equivariant map Ig^{b,*}_{∞,[P]} → J_b(ℚ_p)/P_b(ℚ_p) × G(𝔸_f^p)/P(𝔸_f^p) induced by the cusp labels (the target parametrizes pairs (Z_b, Z^p) of rank r). With Ig^{b,*}_{∞,P} its fibre over the identity, RΓ_c(Ig^{b,*}_{∞,[P]}, i^*_{[P]}Rj_*𝔽_ℓ) ≅ Ind^{J_b(ℚ_p)×G(𝔸_f^p)}_{P_b(ℚ_p)×P(𝔸_f^p)} RΓ_c(Ig^{b,*}_{∞,P}, i^*_P Rj_*𝔽_ℓ) (unnormalized smooth induction).

Hypotheses:

- p unramified in F; X a p-divisible group with G-structure over k with class b; N ≥ 3 prime to p; ℓ ≠ p; Ig^b_∞ = lim_N Ig^b_{K(N)} and similarly Ig^{b,*}_∞, Ig^{b,tor}_∞; compactly supported cohomology of schemes with integral maps to schemes of finite type in Hamacher's sense (colimit over an approximating tower with finite transitions).

Proof or construction:

1. The map is defined by sending a boundary point to the p-part and prime-to-p part of its Igusa cusp label (IG.2/igusa-cusp-labels); equivariance is clear.
2. Compactly supported cohomology of a space fibred equivariantly over the discrete homogeneous space J_b/P_b × G(𝔸_f^p)/P(𝔸_f^p) is the induced representation of the cohomology of the fibre.

Acceptance:

- For r = n and b not ordinary, the stratum is empty, so the induction is zero.

Depends on: `boundary-strata-by-parabolics`, `igusa-cusp-labels`, `SmoothRepresentationsOfLocalGroups:SR.0`, `SmoothRepresentationsOfLocalGroups:SR.2`.

Used by: `boundary-comparison-map`, `igusa-pink-formula`.

Sources:

- CSnc §6.2.1, p. 80 (csnc): “More precisely, we note that there is a natural Jb(Qp) × G(Ap f )-equivariant map Igb,∗ ∞,[P] → Jb(Qp)/Pb(Qp) × G(Ap f)/P(Ap f) induced by cusp labels, as Jb(Qp)/Pb(Qp)×G(Ap f )/P(Ap f) parametrizes” — The map to the homogeneous space and the induced structure.

### `boundary-comparison-map` — The comparison map: cup product of the lower-rank Igusa factor and the GL_r locally symmetric factor (CSnc §§6.2.2–6.2.3)

Declaration `IgusaVarietiesAndTorsionConcentration:IG.6/boundary-comparison-map` (construction). Suggested home: `TauCeti/ShimuraVarieties/Igusa/Boundary` (`TauCeti.Igusa`).

There is a natural P_b(ℚ_p) × P(𝔸_f^p)-equivariant map RΓ(GL_r(F)\(X_r × GL_r(𝔸_{F,f})), 𝔽_ℓ) ⊗ RΓ_c(Ig^{b_P}_∞, 𝔽_ℓ) → RΓ_c(Ig^{b,*}_{∞,P}, i^*_P Rj_*𝔽_ℓ), the cup product of (1) RΓ_c(Ig^{b_P}_∞, 𝔽_ℓ) → RΓ_c(Ig^{b,*}_{∞,P}, 𝔽_ℓ), pullback along the profinite map Ig^{b,*}_{∞,P} → Ig^{b_P}_∞ (limit of IG.2/minimal-igusa-boundary-strata), and (2) RΓ(GL_r(F)\(X_r × GL_r(𝔸_{F,f})), 𝔽_ℓ) → RΓ(Ig^{b,*}_{∞,P}, i^*_P Rj_*𝔽_ℓ), constructed from a continuous P_b(ℚ_p) × P(𝔸_f^p)-equivariant map f (CSnc prints J_b(ℚ_p) × P(𝔸_f^p), sourceIssues IgusaVarietiesAndTorsionConcentration/E10) : |Ig^b_{∞,P}| → GL_r(F)\(X_r × GL_r(𝔸_{F,f})) on the punctured perfectoid formal neighbourhood (the logarithms of the norms of the sections of the Poincaré bundle of the Raynaud extension give the point of X_r, well defined up to ℝ_{>0}; the level structures give the adelic component), together with RΓ(Ig^{b,*}_{∞,P}, i^*_P Rj_*𝔽_ℓ) ≅ colim_{m,N} RΓ(Ig^b_{m,K(N),P}, 𝔽_ℓ) (Huber, Cor. 3.5.14, at each finite level) and RΓ(GL_r(F)\(X_r × GL_r(𝔸_{F,f})), 𝔽_ℓ) ≅ colim_K RΓ(GL_r(F)\(X_r × GL_r(𝔸_{F,f})/K), 𝔽_ℓ) (Borel–Serre). Both maps are equivariant for P_b(ℚ_p) × P(𝔸_f^p) acting through J_{b_P}(ℚ_p) × G_{2(n−r)}(𝔸_f^p), respectively GL_r(𝔸_{F,f}) (the source calls them P_b(𝔸_f^p) × G(𝔸_f^p)-equivariant, sourceIssues PAPER-CARAIANI-SCHOLZE-24/E10).

Hypotheses:

- p unramified in F; X a p-divisible group with G-structure over k with class b; N ≥ 3 prime to p; ℓ ≠ p; Ig^b_∞ = lim_N Ig^b_{K(N)} and similarly Ig^{b,*}_∞, Ig^{b,tor}_∞; compactly supported cohomology of schemes with integral maps to schemes of finite type in Hamacher's sense (colimit over an approximating tower with finite transitions).

Proof or construction:

1. (1) is pullback along the limit of the finite-level maps of IG.2/minimal-igusa-boundary-strata.
2. (2) On the punctured formal neighbourhood, X_ℚ is an F-vector space of rank r and the Raynaud extension gives a hermitian form on X ⊗ ℝ from the norms of the Poincaré-bundle sections; with the prime-to-p level structure (V^p_f(A) ≅ V ⊗ 𝔸^p_f matching V^p_f(T) with F^r ⊗ 𝔸^p_f) and the Igusa structure at p this gives f, continuous and equivariant.
3. Huber [Hub96, Cor. 3.5.14] (ClassicalAdicEtaleCohomology H1) identifies RΓ(Ig^{b,*}_{∞,P}, i^*_PRj_*𝔽_ℓ) with the colimit of the cohomology of the finite-level punctured neighbourhoods; f is the limit of maps of pro-systems to the finite-level locally symmetric spaces.
4. Borel–Serre: X_r and its Borel–Serre compactification are contractible and the compactified quotients are compact Hausdorff, giving the colimit description of RΓ (CSnc footnote 18; ArithmeticLocallySymmetricSpaces ALS.2).
5. Cup product RΓ_c(Ig^{b,*}_{∞,P}, 𝔽_ℓ) ⊗ RΓ(Ig^{b,*}_{∞,P}, i^*_PRj_*𝔽_ℓ) → RΓ_c(Ig^{b,*}_{∞,P}, i^*_PRj_*𝔽_ℓ).

Uses:

- IG.6/igusa-pink-formula: the boundary formula asserts that the induced map is an isomorphism
- IG.6/local-boundary-computation: checked to be an isomorphism on each Igusa cusp label by a toroidal computation

API:

- `boundaryComparison` (constructor): The P_b(ℚ_p) × P(𝔸_f^p)-equivariant map RΓ(GL_r locally symmetric) ⊗ RΓ_c(Ig^{b_P}_∞) → RΓ_c(Ig^{b,*}_{∞,P}, i^*_PRj_*𝔽_ℓ).
- `igusaFactor` (projection): The pullback RΓ_c(Ig^{b_P}_∞) → RΓ_c(Ig^{b,*}_{∞,P}).
- `lsFactor` (projection): The map RΓ(GL_r(F)\(X_r × GL_r(𝔸_{F,f}))) → RΓ(Ig^{b,*}_{∞,P}, i^*_PRj_*𝔽_ℓ) from f.
- `lsFactor_equivariant` (functoriality): Equivariant through the projection P(𝔸_f^p) → GL_r(𝔸^p_{F,f}) and the Igusa structure at p.
- `boundaryComparison_levi` (compatibility): The unipotent radicals of P_b(ℚ_p) and P(𝔸_f^p) act trivially on the source.

Unit tests:

- `boundaryComparison_n_one` (computation): For n = 1 and F⁺ = ℚ (F imaginary quadratic, so X_1 is a point), the map is the identification of the cohomology of the cusps of the Igusa curve with functions on GL_1(F)\GL_1(𝔸_{F,f}) tensored with RΓ_c of the 0-dimensional b_P Igusa variety; for [F⁺:ℚ] > 1, X_1 ≅ ℝ^{[F⁺:ℚ]−1} and the GL_1 factor is the cohomology of a union of tori, not concentrated in degree 0.
- `boundaryComparison_empty` (degenerate): If X_b^{ét} = 0, both sides vanish.
- `lsFactor_not_pullback_scheme` (non-example): The GL_r factor is not induced by a map of schemes: |Ig^b_{∞,P}| maps only continuously to a real manifold, through the perfectoid punctured neighbourhood.

Acceptance:

- For n = 1 and r = 1, (2) is the map from the cohomology of the finite set GL_1(F)\GL_1(𝔸_{F,f})/K (times the contractible X_1 = point) to the cohomology of punctured discs around the cusps, i.e. the constant classes.

Depends on: `boundary-parabolic-induction`, `boundary-strata-by-parabolics`, `minimal-igusa-boundary-strata`, `igusa-cohomology`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/generic-fibre-cohomology-3-5-14`, `ArithmeticLocallySymmetricSpaces:ALS.2/borel-serre-bordification`, `ArithmeticLocallySymmetricSpaces:ALS.2/boundary-stratification`, `ArithmeticLocallySymmetricSpaces:ALS.1/betti-complexes`, `ArithmeticLocallySymmetricSpaces:ALS.0/locally-symmetric-space`, `ShimuraCompactifications:C4/polarized-degeneration-data`, `ShimuraCompactifications:C4/degeneration-effectivity`, `ShimuraCompactifications:C4/formal-universal-degeneration`, `NeronModelsAndSemistableAbelianVarieties:R11.3/raynaud-extension-comparison`.

Used by: `local-boundary-computation`, `igusa-pink-formula`.

Sources:

- CSnc §6.2.2, p. 81 (csnc): “It remains to construct a map RΓ(GLr(F)\(Xr × GLr(AF,f)),Fℓ) ⊗ RΓc(IgbP ∞ ,Fℓ) → RΓc(Igb,∗ ∞,P ,i∗ P Rj∗Fℓ) as a” — The two maps whose cup product is the comparison map.
- CSnc §6.2.3, p. 83 (csnc): “Then it follows from [Hub96, Corollary 3.5.14] applied at each of these ﬁnite levels, plus passage to the limit on the left-hand side, that RΓ(Igb,∗ ∞,P ,i∗ P” — The colimit description through punctured formal neighbourhoods.

### `local-boundary-computation` — The local computation on Igusa cusp labels (CSnc Proposition 6.3.1, Remark 6.3.2)

Declaration `IgusaVarietiesAndTorsionConcentration:IG.6/local-boundary-computation` (theorem).

Decompose Ig^{b,*}_{∞,P} by Igusa cusp labels above P: finite projective O_F-modules X of rank r with X ⊗ ℤ̂^p ≅ O_F^r ⊗ ℤ̂^p and X ⊗ ℤ_p ≅ O_F^r ⊗ ℤ_p, giving ⊔_{X/≅} GL_{O_F}(X)\GL_{O_F}(X ⊗ ℤ̂) ≅ GL_r(F)\GL_r(𝔸_{F,f}), compatibly with f. For the closed subset Ig^{b,*}_{∞,Z̃} of a fixed label, the map RΓ_c(Ig^{b_P}_∞, 𝔽_ℓ) ⊗ colim_{Γ ⊂ GL_{O_F}(X)} RΓ(Γ, 𝔽_ℓ) → RΓ_c(Ig^{b,*}_{∞,Z̃}, i^*_{Z̃}Rj_*𝔽_ℓ) (Γ running over congruence subgroups) is an isomorphism. The same method proves Pink's original formula Hecke-equivariantly (alternative to Pink §4.8).

Hypotheses:

- p unramified in F; X a p-divisible group with G-structure over k with class b; N ≥ 3 prime to p; ℓ ≠ p; Ig^b_∞ = lim_N Ig^b_{K(N)} and similarly Ig^{b,*}_∞, Ig^{b,tor}_∞; compactly supported cohomology of schemes with integral maps to schemes of finite type in Hamacher's sense (colimit over an approximating tower with finite transitions).

Proof or construction:

1. Compute with the toroidal compactification and the boundary charts of IG.2/toroidal-igusa-boundary-strata: the fibre of Ig^{b,tor} over a point of Ig^{b,*}_{Z̃} is a quotient by Γ_Z̃ of torus embeddings over an abelian scheme C_Z̃ over the lower-rank Igusa variety.
2. The inverse system (Ig^{b,tor}_{K^p})_{K^p} satisfies the axiomatic properties of Lan–Stroh [LS18a, Lemma 4.3.2], so Pink's computation [Pin92, Thm 4.2.1] (Lan–Stroh [LS18a, Thm 4.3.10]) applies: i^*Rj_* along the stratum is the group cohomology of Γ_Z̃ acting on the cohomology of the torus torsor fibres, which (after the colimit over levels) is colim_Γ RΓ(Γ, 𝔽_ℓ).
3. X_r is contractible, so this matches the GL_r-factor on the corresponding component.

Acceptance:

- For n = 1: the stalk of i^*Rj_*𝔽_ℓ at a cusp of an Igusa curve is RΓ(Γ, 𝔽_ℓ) for Γ ⊂ O_F^× the relevant congruence units acting on the punctured disc.

Depends on: `boundary-comparison-map`, `toroidal-igusa-boundary-strata`, `igusa-cusp-labels`, `AdicCoefficientsAndComparisons:L5/normal-crossing-local-comparison`, `ShimuraCompactifications:C4/polarized-degeneration-data`, `ShimuraCompactifications:C4/degeneration-effectivity`, `ShimuraCompactifications:C4/formal-universal-degeneration`, `NeronModelsAndSemistableAbelianVarieties:R11.3/raynaud-extension-comparison`.

Used by: `igusa-pink-formula`.

Sources:

- CSnc §6.3, Proposition 6.3.1, p. 84 (csnc): “Proposition 6.3.1. The map RΓc(IgbP ∞ ,Fℓ) ⊗ lim − → Γ⊂GLOF” — The local isomorphism on Igusa cusp labels.
- CSnc §6.3, proof of Proposition 6.3.1, p. 84 (csnc): “this is a by now standard computation due to Pink, [Pin92, Theorem 4.2.1], see also [LS18a, Theorem 4.3.10]. The key” — Pink's computation via the axiomatics of Lan–Stroh.
- §4.3 'Pink's formula', Assumption 4.3.1 (p. 76), Definition 4.3.8 and Theorem 4.3.10 (pp. 79–80) (ls18a): “(Pink). Let Vξ be an algebraic representation of G ⊗Z Q on a finite-dimensional vector space over Q̄` , which defines Vξ , and so on, as in Definition 4.3.8.” — Lan–Stroh Theorem 4.3.10: Pink's formula in their setting.

### `igusa-pink-formula` — Pink's formula for Igusa varieties (CSnc Theorem 6.1.1) ★

Declaration `IgusaVarietiesAndTorsionConcentration:IG.6/igusa-pink-formula` (theorem). Planet: Pink formula for Igusa varieties.

There is a natural J_b(ℚ_p) × G(𝔸_f^p)-equivariant isomorphism RΓ_c(Ig^{b,*}_{∞,[P]}, i^*_{[P]}Rj_*𝔽_ℓ) ≅ Ind^{J_b(ℚ_p)×G(𝔸_f^p)}_{P_b(ℚ_p)×P(𝔸_f^p)} RΓ(GL_r(F)\(X_r × GL_r(𝔸_{F,f})), 𝔽_ℓ) ⊗ RΓ_c(Ig^{b_P}_∞, 𝔽_ℓ), with unnormalized smooth induction and P_b(ℚ_p) × P(𝔸_f^p) acting on the tensor product through its Levi quotient (J_{b_P}(ℚ_p) × G_{2(n−r)}(𝔸_f^p) on the Igusa factor, GL_r(𝔸_{F,f}) on the locally symmetric factor). No Tate twist or cohomological shift enters (𝔽_ℓ coefficients, degrees as written). The isomorphism is an equivariant isomorphism of complexes, not only an equality of Euler characteristics.

Hypotheses:

- p unramified in F; X a p-divisible group with G-structure over k with class b; N ≥ 3 prime to p; ℓ ≠ p; Ig^b_∞ = lim_N Ig^b_{K(N)} and similarly Ig^{b,*}_∞, Ig^{b,tor}_∞; compactly supported cohomology of schemes with integral maps to schemes of finite type in Hamacher's sense (colimit over an approximating tower with finite transitions).

Proof or construction:

1. Reduce to P_b(ℚ_p) × P(𝔸_f^p)-representations by IG.6/boundary-parabolic-induction.
2. Construct the map by IG.6/boundary-comparison-map.
3. Check it is an isomorphism Igusa cusp label by Igusa cusp label (IG.6/local-boundary-computation), using the bijection ⊔_X GL_{O_F}(X)\GL_{O_F}(X ⊗ ℤ̂) ≅ GL_r(F)\GL_r(𝔸_{F,f}) and the contractibility of X_r.

Acceptance:

- For n = 1, r = 1: the boundary of the Igusa curve with i^*Rj_* coefficients is induced from the Borel of J_b(ℚ_p) × G(𝔸_f^p) of the cohomology of GL_1(F)\GL_1(𝔸_{F,f}) (a profinite set) tensored with the trivial b_P-Igusa factor.
- Euler-characteristic shadow: in the Grothendieck group the formula recovers the boundary term of the Igusa trace formula.

Depends on: `boundary-parabolic-induction`, `boundary-comparison-map`, `local-boundary-computation`, `boundary-strata-by-parabolics`.

Used by: `boundary-length-obstruction`, `koshikawa-generic-vanishing`.

Sources:

- CSnc §6.1, Theorem 6.1.1, p. 80 (csnc): “Theorem 6.1.1. There is a natural Jb(Qp) × G(Ap f )-equivariant isomorphism RΓc(Igb,∗” — Pink's formula for Igusa varieties.
- CSnc §6.1, Theorem 6.1.1, p. 80 (csnc): “The action of Pb(Qp) × P(Ap f) on RΓ(GLr(F)\(Xr × GLr(AF,f)),Fℓ) ⊗ RΓc(IgbP ∞ ,Fℓ) is through its Levi quotient. We will prove this result in several” — The Levi quotient acts.

### `parabolic-induction-derived-invariants` — Derived invariants of induced and inflated smooth representations and the Hecke restriction maps (CSnc Lemmas 6.4.2–6.4.3)

Declaration `IgusaVarietiesAndTorsionConcentration:IG.6/parabolic-induction-derived-invariants` (theorem).

Let P = MN be a standard rational parabolic of G, K^S = ∏_{v∉S} hyperspecial, K^S_P = K^S ∩ P(𝔸^S), K^S_M its image in M(𝔸^S), r_P : 𝕋^S → 𝕋^S_P restriction of functions and r_M : 𝕋^S_P → 𝕋^S_M integration along unipotent fibres (so r_M ∘ r_P is the unnormalized Satake transform; ArithmeticLocallySymmetricSpaces ALS.4). Then (1) RΓ_cont(K^S, Ind^{G(𝔸^S)}_{P(𝔸^S)}(−)) ≅ r_P^* RΓ_cont(K^S_P, −) as functors D^+_sm(P(𝔸^S), 𝔽_ℓ) → D^+(𝕋^S_P); (2) r_M^* RΓ_cont(K^S_M, −) ≅ RΓ_cont(K^S_P, Inf^{P(𝔸^S)}_{M(𝔸^S)}(−)) as functors D^+_sm(M(𝔸^S), 𝔽_ℓ) → D^+(𝕋^S_P).

Hypotheses:

- K^S hyperspecial at every place outside S (Iwasawa decomposition G(𝔸^S) = K^S P(𝔸^S)); K^S_N pro-prime-to-ℓ.

Proof or construction:

1. (1) On non-derived functors the Iwasawa decomposition gives Γ(K^S, Ind(−)) = r_P^*Γ(K^S_P, −) Hecke-equivariantly; Ind is exact and preserves injectives, so derive (after Newton–Thorne [NT16, Cor. 2.6]).
2. (2) Natural transformation from [NT16, Lemma 2.1]; it is an isomorphism because RΓ_cont(K^S_P, −) = RΓ_cont(K^S_M, −) ∘ Γ(K^S_N, −), Γ(K^S_N, −) is exact on smooth representations (K^S_N profinite of order prime to ℓ) and Γ(K^S_N, −) ∘ Inf = Id.

Acceptance:

- For P = G both statements are tautologies.

Depends on: `ArithmeticLocallySymmetricSpaces:ALS.4/parabolic-hecke-maps`, `ArithmeticLocallySymmetricSpaces:ALS.4/boundary-stratum-hecke-comparison`, `SmoothRepresentationsOfLocalGroups:SR.0`, `SmoothRepresentationsOfLocalGroups:SR.2`.

Used by: `boundary-length-obstruction`.

Sources:

- CSnc §6.4, Lemma 6.4.2, p. 85 (csnc): “Lemma 6.4.2. There is a natural isomorphism of functors RΓcont  KS” — Derived invariants of parabolic induction.
- CSnc §6.4, Lemma 6.4.3, p. 86 (csnc): “Lemma 6.4.3. There is a natural isomorphism of functors r∗” — Derived invariants of inflation.

### `boundary-length-obstruction` — Galois representations for Igusa cohomology and the boundary length obstruction (CSnc Theorem 6.4.1 = Theorem 2.8.7) ★

Declaration `IgusaVarietiesAndTorsionConcentration:IG.6/boundary-length-obstruction` (theorem). Planet: Boundary length obstruction.

Assume p unramified in F, F contains properly an imaginary quadratic F₀ in which p splits, F⁺ ≠ ℚ, S and N ≥ 3 as in §5 (N prime to p, divisible only by primes of S^p_f and by N₀), and 𝔪 ⊂ 𝕋^S a maximal ideal containing ℓ; Igusa varieties at tame level K^p(N). (1) If for some b ∈ B(G_{ℚ_p}, μ^{−1}) one of H^i_{c−∂}(Ig^b, 𝔽_ℓ)_𝔪, H^i(Ig^b, 𝔽_ℓ)_𝔪 is nonzero, then there is a continuous semisimple ρ̄_𝔪 : Gal(F̄/F) → GL_{2n}(𝔽̄_ℓ) with ρ̄_𝔪(Frob_v) of characteristic polynomial X^{2n} − T_{1,v}X^{2n−1} + … + (−1)^i q_v^{i(i−1)/2}T_{i,v}X^{2n−i} + … + q_v^{n(2n−1)}T_{2n,v} mod 𝔪 for all v | q ∉ S split in F₀. (2) If moreover H^i_{c−∂}(Ig^b, 𝔽_ℓ)_𝔪 → H^i(Ig^b, 𝔽_ℓ)_𝔪 is not an isomorphism for some i and b is not ordinary, then ρ̄_𝔪 has at least 3 Jordan–Hölder constituents. Both parts are proved together, by induction on n, uniformly for all the unitary groups G_{2m}, m ≤ n. The hypothesis that ρ̄_𝔪 has length at most two is not assumed here; it is the hypothesis under which (2) is applied in IG.7.

Hypotheses:

- As stated; the induction uses the theorem for G_{2(n−r)}, 1 ≤ r ≤ n, and the torsion Galois determinants for GL_r over F.

Proof or construction:

1. Boundary case: if H^i_{c−∂} → H^i fails to be an isomorphism at 𝔪, then by Poincaré duality (IG.5/igusa-poincare-duality) H^i_c(Ig^b)_{𝔪^∨} → H^i_c(Ig^{b,*}, Rj_*𝔽_ℓ)_{𝔪^∨} is not an isomorphism at some finite level, so by the stratification (IG.6/boundary-strata-by-parabolics) RΓ_cont(K^S, RΓ_c(Ig^{b,*}_{∞,[P_r]}, i^*Rj_*𝔽_ℓ))_{𝔪^∨} ≠ 0 for some 1 ≤ r ≤ n.
2. By IG.6/igusa-pink-formula and IG.6/parabolic-induction-derived-invariants, this is the localization at 𝔪^∨ of r_M^*r_P^* of the K^S_M-invariants of the GL_r locally symmetric complex tensored with RΓ_c(Ig^{b_P}): 𝔪^∨ is pulled back along the unnormalized Satake transform from 𝔪₁ ⊗ 𝔪₂ for GL_r/F and G_{2(n−r)}.
3. Galois representations for 𝔪₁ come from Scholze's torsion Galois representations for GL_r over F ([Sch15, Cor. 5.4.3] or [ACC+23, Thm 2.3.5]; TorsionCohomologyInfrastructure, see the recorded gap), for 𝔪₂ from the induction hypothesis (part (1) for G_{2(n−r)}); the Satake transform gives ρ̄_{𝔪^∨} ≅ ρ̄_{𝔪₁} ⊕ ρ̄_{𝔪₁}^{c,∨}(twist) ⊕ ρ̄_{𝔪₂}, which has at least three constituents when r < n; P_n contributes no stratum unless b is ordinary.
4. Non-boundary case (H_{c−∂} → H an isomorphism): IG.4/artin-vanishing-upper-bound and IG.4/minimal-stratum-lower-bound force concentration in one degree for minimal d_b, and IG.5/genericity-forces-ordinary (via IG.5/galois-representations-for-igusa-constituents) gives ρ̄_𝔪 (the last step of the paper cites "Proposition 2.8.4 and Corollary 2.8.2", sourceIssues PAPER-CARAIANI-SCHOLZE-24/E12).
5. Pass from 𝔪^∨ to 𝔪 by IG.5/dual-hecke-ideal.

Acceptance:

- Residual length two with nonzero boundary is allowed: if ρ̄_𝔪 = ρ̄₁ ⊕ ρ̄₂ with b ordinary, H_{c−∂} → H need not be an isomorphism.
- For an absolutely irreducible ρ̄_𝔪, (2) shows H_{c−∂} ≅ H at every non-ordinary b.

Depends on: `igusa-pink-formula`, `parabolic-induction-derived-invariants`, `boundary-strata-by-parabolics`, `igusa-poincare-duality`, `dual-hecke-ideal`, `artin-vanishing-upper-bound`, `minimal-stratum-lower-bound`, `genericity-forces-ordinary`, `galois-representations-for-igusa-constituents`, `partial-support-cohomology`, `TorsionCohomologyInfrastructure:TC.4`, `IntegralHeckeAndGaloisDeterminants:IHG.0/determinant`, `IntegralHeckeAndGaloisDeterminants:IHG.0/determinant-direct-sum`, `IntegralHeckeAndGaloisDeterminants:IHG.1/algebraically-closed-reconstruction`, `IntegralHeckeAndGaloisDeterminants:IHG.4/inverse-limit-determinant`, `ArithmeticLocallySymmetricSpaces:ALS.4/parabolic-hecke-maps`.

Used by: `only-ordinary-contributes`.

Sources:

- CSnc §6.4, Theorem 6.4.1, p. 84 (csnc): “Theorem 6.4.1. Assume that for some b ∈ B(GQp ,µ−1 ) one of the cohomology groups Hi c−∂(Igb ,Fℓ)m,Hi (Igb ,Fℓ)m is nonzero. Then there exists a continuous semisimple Galois representation ρm :” — Both assertions of the theorem.
- CSnc §6.4, proof of Theorem 6.4.1, p. 86 (csnc): “We argue by induction on n, so we may assume that the analogous result is known for Igusa varieties on smaller unitary groups. Assume ﬁrst that the” — The proof is an induction on n.
- CSnc §2.8, Theorem 2.8.7, p. 35 (csnc): “Theorem 2.8.7. Assume that F+ 6= Q, that p is split in the imaginary quadratic field F0 ⊂ F, and that the map Hi c−∂(Igb ,Fℓ)m → Hi (Igb ,Fℓ)m is not an isomorphism for some i.” — The form used in the main argument.

## IG.7. Localized concentration and arithmetic handoff

IG.7 assembles the concentration theorem. Under the CS-generic hypotheses, the minimal-Newton-dimension argument leaves only the ordinary stratum, a profinite set of points of the flag variety, contributing in degrees ≥ d. Hochschild–Serre and the good-reduction comparison descend this to finite level, and the unitary/similitude comparison gives the unitary group. Part (2), for H_c, follows by duality at 𝔪^∨. The integral and local-system versions, torsion-freeness of H^d, and the boundary exact sequence follow formally. For absolutely irreducible ρ̄_𝔪 the boundary vanishing is imported and the stronger concentration deduced. The layer does not claim that H and H_c are both concentrated in degree d in the reducible boundary case. The exported statement is ACC+ Theorem 4.3.3: H^d(V_λ)_𝔪 injects into H^d(V_λ[1/p])_𝔪 and surjects onto H^d(∂)_𝔪. Koshikawa's theorem removes [F⁺:ℚ] > 1 and the length condition, through Mantovan's formula and the vanishing of generic local Shimura cohomology for non-quasi-split J_b; it gives Caraiani–Newton's Theorem 2.1.28 for F⁺ = ℚ.

Imports from other roadmaps in this layer: `ArithmeticGaloisDuality:R02.2/hochschild-serre-spectral-sequence`, `ArithmeticLocallySymmetricSpaces:ALS.4/boundary-triangle`, `ArithmeticLocallySymmetricSpaces:ALS.4/gln-boundary-eisenstein`, `ArithmeticLocallySymmetricSpaces:ALS.4/siegel-stratum-localization`, `ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality/hecke-adjoint-duality`, `ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality/verdier-poincare-duality`, `ArithmeticLocallySymmetricSpaces:ALS.6/finite-cover-hochschild-serre`, `ArithmeticLocallySymmetricSpaces:ALS.6/lowest-degree-descent`, `AutomorphicGaloisRepresentationsPartII:AG2.7/completely-split-generic-prime`, `AutomorphicGaloisRepresentationsPartII:AG2.7/existential-decomposed-genericity`, `AutomorphicGaloisRepresentationsPartII:AG2.7/hecke-maximal-ideal-of-galois-type`, `AutomorphicGaloisRepresentationsPartII:AG2.7/non-eisenstein-maximal-ideal`, `AutomorphicGaloisRepresentationsPartII:AG2.7/strong-local-decomposed-genericity`, `AutomorphicGaloisRepresentationsPartII:AG2.7/the-residual-ratio-condition-for-taylor-wiles-primes`, `ExcursionOperatorsAndSpectralAction:ES5`, `ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison`, `HeckeStacksAndLocalShtukas:HS2/levels-and-tower-limit`, `HeckeStacksAndLocalShtukas:HS2/minuscule-rigidification`, `TorsionCohomologyInfrastructure:TC.3`.

### `cs-generic-maximal-ideal` — Caraiani–Scholze generic maximal ideals: the hypotheses of the concentration theorem ★

Declaration `IgusaVarietiesAndTorsionConcentration:IG.7/cs-generic-maximal-ideal` (definition). Planet: Generic maximal ideals. Suggested home: `TauCeti/ShimuraVarieties/Igusa/Concentration` (`TauCeti.Igusa`).

A maximal ideal 𝔪 ⊂ 𝕋^S of Galois type (with semisimple ρ̄_𝔪 : Gal(F̄/F) → GL_{2n}(𝔽̄_ℓ) whose Frobenius polynomials are those of IG.5/genericity-forces-ordinary) is CS-generic if (i) F⁺ ≠ ℚ; (ii) ρ̄_𝔪 has at most two Jordan–Hölder constituents; (iii) some prime p ≠ ℓ splits completely in F and ρ̄_𝔪 is unramified at every v | p with Frobenius eigenvalues satisfying α_{i,v} ≠ pα_{j,v} for i ≠ j (a decomposed-generic prime in the sense of AutomorphicGaloisRepresentationsPartII AG2.7; repeated eigenvalues are allowed, so the distinctness α_i ≠ α_j of CS17 is not required). This is distinct from (a) non-Eisenstein (ρ̄_𝔪 absolutely irreducible), which is neither implied by nor implies (iii), and (b) the stronger CS17 decomposed genericity α_i/α_j ∉ {1, q}. The renaming dictionary for ACC+: the coefficient prime called ℓ here is called p in ACC+, and the auxiliary split prime called p here is called l there.

Hypotheses:

- F = F⁺F₀ CM with F₀ imaginary quadratic and F⁺ ≠ ℚ; G⁰ the quasi-split unitary group of IG.0 with d = [F⁺:ℚ]n²; ℓ a prime; S a finite set of places containing ∞, ℓ, the primes ramified in F and those where K is not hyperspecial; 𝕋^S the unramified Hecke algebra over ℤ; 𝔪 ⊂ 𝕋^S a maximal ideal in the support of H^*(X_K, 𝔽_ℓ) with associated ρ̄_𝔪 : Gal(F̄/F) → GL_{2n}(𝔽̄_ℓ).

Proof or construction:

1. Package (i)–(iii) as stated, importing the residual predicates from AG2.7 (RS-12 owner of the ratio predicate).
2. Record the dictionary to ACC+ Definition 4.3.1 (decomposed generic: some l ≠ p splits completely and ρ̄|_{G_{F_v}} is generic at all v | l) and to CN23 Definition 2.1.27.

Uses:

- IG.7/caraiani-scholze-vanishing: the hypotheses of the vanishing theorem
- IG.7/acc-middle-degree-export: ACC+ Theorem 4.3.3 is stated for decomposed generic ρ̄_𝔪 of length at most two
- Boxer–Calegari–Gee–Pilloni, Lemma 4.9.6: irreducible localization (non-Eisenstein) and decomposed genericity are used as distinct conditions

API:

- `IsCSGeneric` (data): The predicate (i)–(iii) on a Galois-type maximal ideal 𝔪.
- `IsCSGeneric.dual` (other): 𝔪 CS-generic iff 𝔪^∨ CS-generic (IG.5/dual-hecke-ideal).
- `IsCSGeneric.of_strong` (relation): CS17 decomposed genericity (α_i/α_j ∉ {1, q}) at a completely split p with length ≤ 2 implies CS-generic.
- `IsCSGeneric.infinitely_many_primes` (other): If some p witnesses (iii), infinitely many do, avoiding any finite set (AG2.7, Chebotarev).
- `IsCSGeneric.acc_dictionary` (compatibility): Equivalent to ACC+ "decomposed generic and length ≤ 2" after exchanging the names of the two primes.

Unit tests:

- `IsCSGeneric.reducible_ok` (computation): For 2n = 2, ρ̄ = χ₁ ⊕ χ₂ with χ₁, χ₂ unramified at all v | p (p completely split) and χ₁(Frob_v)/χ₂(Frob_v) ∉ {p, p^{−1}} is CS-generic of length two; ρ̄ = 1 ⊕ ε̄^{−1} is not (its eigenvalue ratio at every such v is p).
- `IsCSGeneric.length_three` (non-example): A ρ̄_𝔪 with three or more Jordan–Hölder constituents (for instance a sum of three nonzero subrepresentations of GL_{2n}) is never CS-generic (condition (ii) fails), whatever its eigenvalues.
- `IsCSGeneric.not_noneisenstein` (non-example): CS-generic does not imply non-Eisenstein: the reducible χ₁ ⊕ χ₂ of IsCSGeneric.reducible_ok is CS-generic and Eisenstein.
- `IsCSGeneric.repeated_eigenvalues` (degenerate): Repeated eigenvalues α_i = α_j are allowed when α_i ≠ pα_j (CSnc Remark 1.4).

Acceptance:

- ρ̄_𝔪 = ρ̄₁ ⊕ ρ̄₂ reducible of length two with ρ̄₁, ρ̄₂ generic at a split p is CS-generic but not non-Eisenstein.

Depends on: `AutomorphicGaloisRepresentationsPartII:AG2.7/the-residual-ratio-condition-for-taylor-wiles-primes`, `AutomorphicGaloisRepresentationsPartII:AG2.7/completely-split-generic-prime`, `AutomorphicGaloisRepresentationsPartII:AG2.7/strong-local-decomposed-genericity`, `AutomorphicGaloisRepresentationsPartII:AG2.7/existential-decomposed-genericity`, `AutomorphicGaloisRepresentationsPartII:AG2.7/hecke-maximal-ideal-of-galois-type`, `AutomorphicGaloisRepresentationsPartII:AG2.7/non-eisenstein-maximal-ideal`, `quasi-split-unitary-datum`.

Used by: `cohomologically-generic`, `only-ordinary-contributes`, `caraiani-scholze-vanishing`, `acc-middle-degree-export`.

Sources:

- CSnc §2.8, proof of Theorem 1.1, p. 36 (csnc): “Now assume all of our hypotheses: that F = F0 · F+ with F+ 6= Q, that p is totally split in F, and that m is so that ρm is unramiﬁed and generic at all places dividing p, and of length at most 2.” — The hypotheses of Theorem 1.1.
- Definition 4.3.1, pp. 76–77 (recalled from [CS17, Defn. 1.9] with p and l swapped) (acc23): “We say that a prime l 6= p is decomposed generic for r if l splits completely in L and for all places v|l of L, r|GLv is generic.” — ACC+ Definition 4.3.1: generic and decomposed generic, with p and l swapped.

### `cohomologically-generic` — Cohomologically generic Hecke homomorphisms (LTXZZ Definition D.1.1)

Declaration `IgusaVarietiesAndTorsionConcentration:IG.7/cohomologically-generic` (definition). Suggested home: `TauCeti/ShimuraVarieties/Igusa/Concentration` (`TauCeti.Igusa`).

Let N ≥ 1, Σ⁺ a finite set of nonarchimedean places of F⁺ containing Σ⁺_bad, and 𝕋_N^{Σ⁺} the abstract spherical Hecke algebra of the unitary groups U(V) of N-dimensional hermitian spaces over F. A homomorphism φ : 𝕋_N^{Σ⁺} → κ to a field is cohomologically generic if H^i_ét(Sh(V, K)_{F̄}, κ)_{𝕋_N^{Σ⁺′} ∩ ker φ} = 0 for every finite Σ⁺′ ⊇ Σ⁺, every i ≠ N − 1, every standard indefinite hermitian space V of dimension N and every K = K_{Σ⁺′} × ∏_{v∉Σ⁺_∞∪Σ⁺′} U(Λ)(O_{F⁺_v}) with Λ self-dual. It is the cohomological conclusion of the compact-case concentration theorem, used as a hypothesis by Liu–Tian–Xiao–Zhang–Zhu.

Hypotheses:

- Notation of LTXZZ §3: standard indefinite hermitian spaces have signature (N − 1, 1) at one archimedean place and (N, 0) at the others.

Proof or construction:

1. Define by the stated vanishing; localization at the prime 𝕋_N^{Σ⁺′} ∩ ker φ of the subalgebra.
2. Record that it is implied, for F⁺ ≠ ℚ, by decomposed genericity at a split place (LTXZZ Proposition D.1.3, a compact-case theorem owned by the compact-unitary Part II; see the coverage notes).

Uses:

- LTXZZ Remark 6.1.5 and condition (L7): cohomological genericity implies their Assumption 6.1.4 through Lemma 5.2.7 and universal coefficients
- LTXZZ Corollary D.1.4: reductions of Π are cohomologically generic for almost all λ

API:

- `IsCohomologicallyGeneric` (data): The vanishing predicate on φ : 𝕋_N^{Σ⁺} → κ.
- `IsCohomologicallyGeneric.mono` (other): Stable under enlarging Σ⁺.
- `IsCohomologicallyGeneric.field_ext` (functoriality): Invariant under extension of the field κ.
- `IsCohomologicallyGeneric.of_decomposedGeneric` (relation): Implied by decomposed genericity at a split place when F⁺ ≠ ℚ (LTXZZ Proposition D.1.3).

Unit tests:

- `IsCohomologicallyGeneric.N_one` (degenerate): For N = 1 every φ is cohomologically generic.
- `IsCohomologicallyGeneric.trivial_char` (non-example): The Eisenstein homomorphism attached to the trivial representation (degree of H^0) is not cohomologically generic for N ≥ 2, since H^0 ≠ 0 and 0 ≠ N − 1.
- `IsCohomologicallyGeneric.N_two` (computation): For N = 2 (Shimura curves), φ is cohomologically generic iff, for every V and K as in the definition, the localized H⁰ and H² vanish.

Acceptance:

- For N = 1 every φ is cohomologically generic (the Shimura varieties are 0-dimensional, so only i = 0 = N − 1 occurs).

Depends on: `cs-generic-maximal-ideal`, `AutomorphicGaloisRepresentationsPartII:AG2.7/hecke-maximal-ideal-of-galois-type`, `AutomorphicGaloisRepresentationsPartII:AG2.7/non-eisenstein-maximal-ideal`.

Sources:

- Appendix D, §D.1 'Vanishing of cohomology off middle degree', Definition D.1.1, p. 365 (ltxzz): “κ with κ a field. We say that φ is cohomologically generic if” — LTXZZ Definition D.1.1.

### `only-ordinary-contributes` — Under CS-genericity only the ordinary stratum contributes, in degrees ≥ d (CSnc proof of Theorem 1.1, first part)

Declaration `IgusaVarietiesAndTorsionConcentration:IG.7/only-ordinary-contributes` (theorem).

Assume p unramified in F, N ≥ 3 prime to p, divisible only by primes in S^p_f and by N₀, S ⊇ {∞} ∪ {primes dividing pℓNΔ_F} ∪ {ramification of ϖ}, and 𝔪 ⊂ 𝕋^S CS-generic with witness prime p (completely split in F). Then H^i(Ig^b, 𝔽_ℓ)_𝔪 ≠ 0 only if b is ordinary, and then only for i ≥ d. Consequently (Rπ°_HT*𝔽_ℓ)_𝔪 is concentrated on the ordinary locus Fℓ(ℚ_p) and in degrees ≥ d, and H^i(S°_{K(p^∞N),C}, 𝔽_ℓ)_𝔪 ≅ H^i(Fℓ, (Rπ°_HT*𝔽_ℓ)_𝔪) vanishes for i < d.

Hypotheses:

- F = F⁺F₀ CM with F₀ imaginary quadratic and F⁺ ≠ ℚ; G⁰ the quasi-split unitary group of IG.0 with d = [F⁺:ℚ]n²; ℓ a prime; S a finite set of places containing ∞, ℓ, the primes ramified in F and those where K is not hyperspecial; 𝕋^S the unramified Hecke algebra over ℤ; 𝔪 ⊂ 𝕋^S a maximal ideal in the support of H^*(X_K, 𝔽_ℓ) with associated ρ̄_𝔪 : Gal(F̄/F) → GL_{2n}(𝔽̄_ℓ).
- Witness prime p ≠ ℓ completely split in F.

Proof or construction:

1. Pick b with d_b minimal among those with H^*(Ig^b, 𝔽_ℓ)_𝔪 ≠ 0 (IG.4/minimal-stratum-lower-bound): H^i(Ig^b)_𝔪 ≠ 0 implies i ≥ d_b.
2. If b is not ordinary, H^i_{c−∂}(Ig^b)_𝔪 → H^i(Ig^b)_𝔪 is an isomorphism since ρ̄_𝔪 has length ≤ 2 (IG.6/boundary-length-obstruction (2)); with IG.4/artin-vanishing-upper-bound both sides are concentrated in degree d_b, and IG.5/genericity-forces-ordinary gives a contradiction. So the minimal b is ordinary, hence (ordinary being the largest element and d_ord = d) every b with nonzero localized Igusa cohomology is ordinary.
3. For b ordinary, the lower bound gives i ≥ d. By IG.3/open-fibre-theorem the stalks of (Rπ°_HT*𝔽_ℓ)_𝔪 at x ∈ Fℓ^b are RΓ(Ig^b, 𝔽_ℓ)_𝔪, so the complex lives on Fℓ^{ord} = Fℓ(ℚ_p) (IG.3/flag-newton-strata-dimension) in degrees ≥ d; Fℓ(ℚ_p) is profinite, so H^i(Fℓ, −) has no higher cohomology.

Acceptance:

- If ρ̄_𝔪 has length ≥ 3, non-ordinary strata may contribute through the boundary (IG.6), and the argument does not apply.

Depends on: `minimal-stratum-lower-bound`, `artin-vanishing-upper-bound`, `boundary-length-obstruction`, `genericity-forces-ordinary`, `open-fibre-theorem`, `flag-newton-strata-dimension`, `cs-generic-maximal-ideal`.

Used by: `level-descent`, `caraiani-scholze-vanishing`.

Sources:

- CSnc §2.8, proof of Theorem 1.1, p. 36 (csnc): “It follows that Hi (Igb ,Fℓ)m can be nonzero only if b is ordinary. By Lemma 2.8.4, this shows that also in this case Hi (Igb ,Fℓ)m 6= 0 only for i ≥ d = db. By Theorem 2.7.2, this shows that (R(π◦” — Only the ordinary b contributes, in degrees ≥ d.

### `level-descent` — Descent from infinite level at p and to general neat level (CSnc proof of Theorem 1.1; RT-PAPER-CARAIANI-SCHOLZE-24/4)

Declaration `IgusaVarietiesAndTorsionConcentration:IG.7/level-descent` (theorem).

(1) If H^i(S°_{K(p^∞N),C}, 𝔽_ℓ)_𝔪 = 0 for i < d, then H^i(X_{K(N)}, 𝔽_ℓ)_𝔪 = 0 for i < d. (2) For the unitary group, H^i(X⁰_{K⁰}, 𝔽_ℓ)_{𝔪⁰} = 0 for i < d at K⁰ = K(N) ∩ G⁰(𝔸_f), 𝔪⁰ the image of 𝔪 under 𝕋^S → 𝕋^{0,S}. (3) For an arbitrary neat K⁰ = ∏K⁰_q ⊂ G⁰(𝔸_f) and S containing the primes where K⁰_q ≠ G⁰(ℤ_q): enlarge S to S′ = S ∪ {p, ℓ} ∪ {primes of N₀ and of the ramification of ϖ}, replace 𝔪 by its contraction to 𝕋^{S′} (the 𝔪-part is a direct summand); if K⁰_p = G⁰(ℤ_p), choose N as above with K(N) ∩ G⁰(𝔸_f) ⊂ K⁰ normal and apply Hochschild–Serre along the finite free cover; if K⁰_p ⊊ G⁰(ℤ_p), use Hochschild–Serre from infinite level at p and the good-reduction comparison at level p^mN (Lan–Stroh). The paper states Theorem 1.1 for general neat K but writes the descent only at level K(N) (sourceIssues IgusaVarietiesAndTorsionConcentration/E9; gap recorded).

Hypotheses:

- F = F⁺F₀ CM with F₀ imaginary quadratic and F⁺ ≠ ℚ; G⁰ the quasi-split unitary group of IG.0 with d = [F⁺:ℚ]n²; ℓ a prime; S a finite set of places containing ∞, ℓ, the primes ramified in F and those where K is not hyperspecial; 𝕋^S the unramified Hecke algebra over ℤ; 𝔪 ⊂ 𝕋^S a maximal ideal in the support of H^*(X_K, 𝔽_ℓ) with associated ρ̄_𝔪 : Gal(F̄/F) → GL_{2n}(𝔽̄_ℓ).

Proof or construction:

1. (1) Hochschild–Serre for the pro-p cover S°_{K(p^∞N)} → S°_{K(N)} (ArithmeticGaloisDuality R02.2 continuous Hochschild–Serre; ArithmeticLocallySymmetricSpaces ALS.6 lowest-degree descent along a p-group cover), Hecke-equivariant for 𝕋^S; then IG.3/good-reduction-locus-cohomology and IG.0/complex-uniformization (X_K = S_K(ℂ), comparison of étale and singular cohomology).
2. (2) IG.0/unitary-subgroup-comparison: X⁰_{K⁰} is open and closed in X_K, Hecke-equivariantly for 𝕋^S → 𝕋^{0,S}.
3. (3) Contraction of Hecke algebras and Hochschild–Serre for finite covers (ALS.6 finite-cover Hochschild–Serre); for p-power level use (1) at level p^mN and Lan–Stroh for N divisible by p (IG.3/good-reduction-locus-cohomology states only p ∤ N; this case is part of the recorded gap).

Acceptance:

- For K⁰ already of the form K(N) ∩ G⁰ the statement is (2).

Depends on: `only-ordinary-contributes`, `good-reduction-locus-cohomology`, `complex-uniformization`, `unitary-subgroup-comparison`, `ArithmeticGaloisDuality:R02.2/hochschild-serre-spectral-sequence`, `ArithmeticLocallySymmetricSpaces:ALS.6/finite-cover-hochschild-serre`, `ArithmeticLocallySymmetricSpaces:ALS.6/lowest-degree-descent`.

Used by: `caraiani-scholze-vanishing`.

Sources:

- CSnc §2.8, proof of Theorem 1.1, p. 36 (csnc): “By a Hochschild-Serre spectral sequence, this implies that Hi (S◦ K(N),C,Fℓ)m is concentrated in” — Hochschild–Serre descent from infinite level.

### `caraiani-scholze-vanishing` — The generic part of the cohomology lies on the correct side of the middle degree (Caraiani–Scholze, Theorem 1.1) ★

Declaration `IgusaVarietiesAndTorsionConcentration:IG.7/caraiani-scholze-vanishing` (theorem). Planet: Caraiani–Scholze vanishing theorem.

Let F be a CM field containing an imaginary quadratic field with F⁺ ≠ ℚ, G⁰ the quasi-split unitary group of signature (n, n) at each archimedean place, K ⊂ G⁰(𝔸_f) neat, d = [F⁺:ℚ]n², and 𝔪 ⊂ 𝕋^S a maximal ideal in the support of H^*(X_K, 𝔽_ℓ) such that (ii) ρ̄_𝔪 has length at most 2 and (iii) there is a prime p ≠ ℓ splitting completely in F with ρ̄_𝔪 unramified at all v | p and α_{i,v} ≠ pα_{j,v} for i ≠ j. Then (1) H^i(X_K, 𝔽_ℓ)_𝔪 ≠ 0 implies i ≥ d, and (2) H^i_c(X_K, 𝔽_ℓ)_𝔪 ≠ 0 implies i ≤ d. It is not asserted that ordinary and compactly supported cohomology are both concentrated in degree d (false in the reducible boundary case).

Hypotheses:

- F = F⁺F₀ CM with F₀ imaginary quadratic and F⁺ ≠ ℚ; G⁰ the quasi-split unitary group of IG.0 with d = [F⁺:ℚ]n²; ℓ a prime; S a finite set of places containing ∞, ℓ, the primes ramified in F and those where K is not hyperspecial; 𝕋^S the unramified Hecke algebra over ℤ; 𝔪 ⊂ 𝕋^S a maximal ideal in the support of H^*(X_K, 𝔽_ℓ) with associated ρ̄_𝔪 : Gal(F̄/F) → GL_{2n}(𝔽̄_ℓ).
- 𝔪 CS-generic (IG.7/cs-generic-maximal-ideal).

Proof or construction:

1. (1): IG.7/only-ordinary-contributes and IG.7/level-descent.
2. (2): By Poincaré duality on X_K with the dual ideal, H^i_c(X_K, 𝔽_ℓ)_𝔪 is dual to H^{2d−i}(X_K, 𝔽_ℓ)_{𝔪^∨} (ArithmeticLocallySymmetricSpaces ALS.5 finite-level Hecke-adjoint duality); 𝔪^∨ is CS-generic with ρ̄_{𝔪^∨} ≅ ρ̄_𝔪^∨ ⊗ |Art_F^{−1}|^{1−2n}, eigenvalues p^{2n−1}α_{i,v}^{−1} satisfying the same ratio condition (IG.5/dual-hecke-ideal); apply (1) to 𝔪^∨.

Acceptance:

- For n = 1 and F with [F⁺:ℚ] = 2 (d = 2): H^0 and H^1 of X_K localized at a CS-generic 𝔪 vanish, and H^3_c, H^4_c vanish.
- The theorem gives no information on H^d itself.

Depends on: `only-ordinary-contributes`, `level-descent`, `cs-generic-maximal-ideal`, `dual-hecke-ideal`, `ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality/hecke-adjoint-duality`, `ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality/verdier-poincare-duality`.

Used by: `integral-and-local-system-versions`, `irreducible-specialization`, `acc-middle-degree-export`.

Sources:

- CSnc §1, Theorem 1.1, p. 5 (csnc): “Theorem 1.1. Assume the following conditions. (i) F+ 6= Q; (ii) ρm is of length at most 2; (iii) there is a prime p 6= ℓ that splits completely in F and such that for all primes v|p of F, the representation ρm is unramified at v” — Statement of the main theorem.

### `integral-and-local-system-versions` — Integral coefficients, local systems, torsion-freeness and the boundary exact sequence (CSnc Remark 1.5)

Declaration `IgusaVarietiesAndTorsionConcentration:IG.7/integral-and-local-system-versions` (theorem).

Under the hypotheses of IG.7/caraiani-scholze-vanishing: (1) H^i(X_K, ℤ_ℓ)_𝔪 = 0 for i < d and H^i_c(X_K, ℤ_ℓ)_𝔪 = 0 for i > d; (2) H^d(X_K, ℤ_ℓ)_𝔪 is torsion-free; (3) the sequence 0 → H^{d−1}(∂X_K, ℤ_ℓ)_𝔪 → H^d_c(X_K, ℤ_ℓ)_𝔪 → H^d(X_K, ℤ_ℓ)_𝔪 → H^d(∂X_K, ℤ_ℓ)_𝔪 → 0 is exact (∂X_K the Borel–Serre boundary); (4) the same hold for the local systems V_λ attached to algebraic representations with ℤ_ℓ-lattices (via Hochschild–Serre from a deeper ℓ-power level where V_λ/ℓ^m is trivial).

Hypotheses:

- F = F⁺F₀ CM with F₀ imaginary quadratic and F⁺ ≠ ℚ; G⁰ the quasi-split unitary group of IG.0 with d = [F⁺:ℚ]n²; ℓ a prime; S a finite set of places containing ∞, ℓ, the primes ramified in F and those where K is not hyperspecial; 𝕋^S the unramified Hecke algebra over ℤ; 𝔪 ⊂ 𝕋^S a maximal ideal in the support of H^*(X_K, 𝔽_ℓ) with associated ρ̄_𝔪 : Gal(F̄/F) → GL_{2n}(𝔽̄_ℓ).
- 𝔪 CS-generic.

Proof or construction:

1. (1)–(2): from the 𝔽_ℓ statement by the long exact sequences for 0 → ℤ_ℓ → ℤ_ℓ → 𝔽_ℓ → 0 and Nakayama (finite generation of the localized cohomology); torsion in H^d would give nonzero H^{d−1}(𝔽_ℓ).
2. (3): the boundary long exact sequence H^i_c → H^i → H^i(∂X_K) (ArithmeticLocallySymmetricSpaces ALS.4 boundary triangle) together with (1).
3. (4): V_λ/ℓ^m is trivial on a deeper ℓ-power level K′ ⊂ K; Hochschild–Serre for the ℓ-power cover K′/K (ALS.6) and the vanishing at level K′ with trivial coefficients.

Acceptance:

- For ρ̄_𝔪 absolutely irreducible the boundary terms vanish (IG.7/irreducible-specialization) and (3) gives H^d_c ≅ H^d.

Depends on: `caraiani-scholze-vanishing`, `ArithmeticLocallySymmetricSpaces:ALS.4/boundary-triangle`, `ArithmeticGaloisDuality:R02.2/hochschild-serre-spectral-sequence`, `ArithmeticLocallySymmetricSpaces:ALS.6/finite-cover-hochschild-serre`, `ArithmeticLocallySymmetricSpaces:ALS.6/lowest-degree-descent`.

Used by: `irreducible-specialization`, `acc-middle-degree-export`, `middle-degree-without-length-hypothesis`.

Sources:

- CSnc §1, Remark 1.5, pp. 5–6 (csnc): “Remark 1.5. The theorem implies formally that the same conclusion holds for Hi (XK,Zℓ)m and Hi c(XK,Zℓ)m, and in addition that Hd (XK,Zℓ)m is” — Integral and local-system consequences.

### `irreducible-specialization` — Absolutely irreducible residual representations: boundary vanishing and middle-degree concentration (CSnc Remark 1.6)

Declaration `IgusaVarietiesAndTorsionConcentration:IG.7/irreducible-specialization` (theorem).

If moreover ρ̄_𝔪 is absolutely irreducible (so 𝔪 is non-Eisenstein), then H^i(∂X_K, 𝔽_ℓ)_𝔪 = 0 for all i, hence H^i_c(X_K, 𝔽_ℓ)_𝔪 ≅ H^i(X_K, 𝔽_ℓ)_𝔪 vanish outside i = d; integrally, H^i(X_K, ℤ_ℓ)_𝔪 is concentrated in degree d and torsion-free. This is a separate specialization: the boundary vanishing is imported (Borel–Serre boundary strata and their Hecke eigenvalues), and only the deduction of concentration is proved here.

Hypotheses:

- F = F⁺F₀ CM with F₀ imaginary quadratic and F⁺ ≠ ℚ; G⁰ the quasi-split unitary group of IG.0 with d = [F⁺:ℚ]n²; ℓ a prime; S a finite set of places containing ∞, ℓ, the primes ramified in F and those where K is not hyperspecial; 𝕋^S the unramified Hecke algebra over ℤ; 𝔪 ⊂ 𝕋^S a maximal ideal in the support of H^*(X_K, 𝔽_ℓ) with associated ρ̄_𝔪 : Gal(F̄/F) → GL_{2n}(𝔽̄_ℓ).
- 𝔪 CS-generic and ρ̄_𝔪 absolutely irreducible.

Proof or construction:

1. Boundary vanishing: the boundary of X_K is stratified by rational parabolics whose Levi cohomology carries Galois representations of the form ρ̄₁ ⊕ ρ̄₁^{c,∨}(twist) ⊕ ρ̄₂; an absolutely irreducible ρ̄_𝔪 cannot appear (ArithmeticLocallySymmetricSpaces ALS.4 Siegel-stratum localization and GL_n boundary Eisenstein theorem, TorsionCohomologyInfrastructure TC.3; as in the proof of ACC+ Theorem 2.4.2).
2. Combine with IG.7/caraiani-scholze-vanishing via the boundary sequence and IG.7/integral-and-local-system-versions.

Acceptance:

- For n = 1 the boundary is a union of circles fibered over finite sets, whose localized cohomology at a non-Eisenstein 𝔪 vanishes.

Depends on: `caraiani-scholze-vanishing`, `integral-and-local-system-versions`, `ArithmeticLocallySymmetricSpaces:ALS.4/siegel-stratum-localization`, `ArithmeticLocallySymmetricSpaces:ALS.4/gln-boundary-eisenstein`, `TorsionCohomologyInfrastructure:TC.3`, `ArithmeticLocallySymmetricSpaces:ALS.4/boundary-triangle`.

Sources:

- CSnc §1, Remark 1.6, p. 6 (csnc): “Remark 1.6. If m is non-Eisenstein, i.e. if ρm is absolutely irreducible, the theorem and the excision long exact sequence with Fℓ-coeﬃcients imply” — The absolutely irreducible specialization.
- Theorem 2.4.2, p. 46 (§2.4); proof pp. 46–49 (acc23): “Theorem 2.4.2. Let m ⊂ TS (K, λ) be a non-Eisenstein maximal ideal” — ACC+ Theorem 2.4.2: the localized boundary is the Siegel stratum; its proof gives the vanishing for non-Eisenstein ideals.

### `acc-middle-degree-export` — The middle-degree injection and boundary surjection exported to potential automorphy (ACC+ Theorem 4.3.3) ★

Declaration `IgusaVarietiesAndTorsionConcentration:IG.7/acc-middle-degree-export` (theorem). Planet: Middle-degree export (ACC+ Theorem 4.3.3).

Assume [F⁺:ℚ] > 1, F contains an imaginary quadratic field, and the set S satisfies: for every finite place v ∉ S of residue characteristic l, either S contains no l-adic place and l is unramified in F, or l splits in an imaginary quadratic subfield of F. Let 𝔪̃ ⊂ 𝕋̃^S(K̃, λ̃) be a maximal ideal of the Hecke algebra of the quasi-split unitary group G̃ in 2n variables acting on cohomology with coefficients V_λ̃ (an O-lattice in an algebraic representation, O the ring of integers of a finite extension of ℚ_p, p the coefficient prime in ACC+ notation) such that ρ̄_𝔪̃ has length at most 2 and is decomposed generic (ACC+ Definition 4.3.1). Then, with d = n²[F⁺:ℚ], H^d(X̃_K̃, V_λ̃)_𝔪̃ → H^d(X̃_K̃, V_λ̃[1/p])_𝔪̃ is injective and H^d(X̃_K̃, V_λ̃)_𝔪̃ → H^d(∂X̃_K̃, V_λ̃)_𝔪̃ is surjective. Renaming dictionary: ACC+'s coefficient prime p is ℓ here and its auxiliary prime l is p here.

Hypotheses:

- As stated (ACC+ §4.3); the level and ramification conditions on S are those of ACC+.

Proof or construction:

1. Injectivity: H^d torsion-free because H^{d−1}(X̃, V/ϖ)_𝔪̃ = 0 (IG.7/integral-and-local-system-versions, applied to V_λ̃/ϖ by Hochschild–Serre).
2. Surjectivity: the cokernel of H^d → H^d(∂) injects into H^{d+1}_c(X̃, V_λ̃)_𝔪̃ = 0 (part (2) of IG.7/caraiani-scholze-vanishing with local systems).
3. Translate the hypotheses through the dictionary of IG.7/cs-generic-maximal-ideal.

Acceptance:

- Consumers PotentialAutomorphyInfrastructure PA.1 and PA.2 use exactly this injection/surjection for degree shifting; they own the applications.

Depends on: `caraiani-scholze-vanishing`, `integral-and-local-system-versions`, `cs-generic-maximal-ideal`, `ArithmeticLocallySymmetricSpaces:ALS.4/boundary-triangle`.

Used by: `middle-degree-without-length-hypothesis`.

Sources:

- Theorem 4.3.3, p. 77 (§4.3 'Cohomology in the middle degree'); proof pp. 77–78 (acc23): “Suppose that ρ em is decomposed generic, in the sense of Definition 4.3.1. Then we have” — ACC+ Theorem 4.3.3.

### `koshikawa-local-vanishing` — Generic part of the cohomology of local Shimura varieties with non-quasi-split J_b (Koshikawa Theorem 1.1)

Declaration `IgusaVarietiesAndTorsionConcentration:IG.7/koshikawa-local-vanishing` (theorem).

Let F/ℚ_p be finite with residue field 𝔽_q, (G, b, μ) a local Shimura datum with G = ∏_{i∈I} GL_{n_i}, K = ∏GL_{n_i}(O_F) and M_{(G,b,μ),K} the local Shimura variety, ℓ ≠ p. Let 𝔪 ⊂ ℤ_ℓ[K\G(F)/K] be a maximal ideal whose unramified L-parameter ρ̄_𝔪 is generic (the eigenvalues of ρ̄_𝔪(Frob_F) in each GL_{n_i} satisfy α_{j′}/α_j ≠ q for j ≠ j′). If J_b is not quasi-split, then H^i_c(M_{(G,b,μ),K}, ℤ_ℓ)_𝔪 = 0 for every i (cohomology over the completed algebraic closure).

Hypotheses:

- G a product of GL_{n_i}, hyperspecial K; ρ̄_𝔪 generic in Koshikawa's sense.

Proof or construction:

1. Realize H^*_c(M_{(G,b,μ),K}) through the cohomology of Bun_G and Hecke operators (Fargues–Scholze), so that the spectral action and semisimple L-parameters act (ExcursionOperatorsAndSpectralAction ES5).
2. The Fargues–Scholze parameters of the J_b(F)-representations occurring agree with the semisimplified local Langlands parameters for GL_n and its inner forms (ES7 GL_n comparison; Hansen–Kaletha–Weinstein); a generic unramified parameter is not relevant for a non-quasi-split J_b, so its localized contribution vanishes.
3. The local Shimura varieties are those of HeckeStacksAndLocalShtukas HS2.

Acceptance:

- For b basic and G = GL_2, μ = (1, 0): the Lubin–Tate tower; J_b = D^× is not quasi-split, so the cohomology localized at a generic unramified parameter vanishes.

Depends on: `HeckeStacksAndLocalShtukas:HS2/minuscule-rigidification`, `HeckeStacksAndLocalShtukas:HS2/levels-and-tower-limit`, `ExcursionOperatorsAndSpectralAction:ES5`, `ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison`.

Used by: `koshikawa-generic-vanishing`.

Sources:

- Theorem 1.1, p. 1 (§1.1 'Local vanishing'); proof §4 (kos21): “Theorem 1.1. If ρm is generic and Jb is not quasi-split, then the localized coho- mology Hci (M(G,b,µ),K , Zℓ )m vanishes for every integer i.” — Koshikawa Theorem 1.1.
- §1.1, p. 1 (definition of 'generic' for the unramified L-parameter ρ_m); used globally in Conjecture 1.2, p. 2 (kos21): “Let us say that ρm is generic if, for every i ∈ I, the eigenvalues α1 , . . . , αni of ρm (FrobF ) regarded as an element of GLni (Fℓ ) satisfy αj ′ /αj 6= q for all j 6= j ′ .” — Koshikawa's definition of generic.

### `koshikawa-generic-vanishing` — Generic vanishing with localization at p only, without [F⁺:ℚ] > 1 or the length condition (Koshikawa Theorem 1.3) ★

Declaration `IgusaVarietiesAndTorsionConcentration:IG.7/koshikawa-generic-vanishing` (theorem). Planet: Koshikawa generic vanishing.

Let F be a CM field, B = F, V = F^{2n} with the quasi-split unitary similitude group G (the datum of IG.0), p a prime splitting completely in F, K_p hyperspecial, K = K_pK^p sufficiently small, d = dim S_K and ℓ ≠ p. Let 𝔪_p ⊂ ℤ_ℓ[K_p\G(ℚ_p)/K_p] be a maximal ideal of the local Hecke algebra at p whose unramified parameter ρ̄_{𝔪_p} is generic. Then H^i(S_K, 𝔽_ℓ)_{𝔪_p} ≠ 0 only for i ≥ d and H^i_c(S_K, 𝔽_ℓ)_{𝔪_p} ≠ 0 only for i ≤ d. In particular the conclusion of IG.7/caraiani-scholze-vanishing and of IG.7/acc-middle-degree-export holds without the hypotheses [F⁺:ℚ] > 1 and "ρ̄_𝔪 of length at most two" (Caraiani–Newton Theorem 2.1.28, which cites this result as "[Kos21, Theorem 1.4]"; the quasi-split case is Theorem 1.3, sourceIssues IgusaVarietiesAndTorsionConcentration/E7).

Hypotheses:

- p completely split in F; K_p hyperspecial; ρ̄_{𝔪_p} generic (α_{j′}/α_j ≠ q).

Proof or construction:

1. Mantovan's formula (IG.3/mantovan-formula) filters RΓ(S_{K^p}, 𝔽_ℓ) with graded pieces RΓ(Ig^b) ⊗^L_{J_b} RΓ_c(M_{(G,b,μ),∞}).
2. For non-ordinary b, J_b is not quasi-split and the localized local factor vanishes (IG.7/koshikawa-local-vanishing), so only b ordinary contributes.
3. For b ordinary, the Igusa variety is affine-type and its partial minimal compactification bound gives the degree estimates (IG.4/minimal-stratum-lower-bound, IG.4/artin-vanishing-upper-bound), with the boundary handled as in IG.6 (Koshikawa §9).

Acceptance:

- For F imaginary quadratic (F⁺ = ℚ), where the twisted trace formula of IG.5 has proper cuspidal subsets, this theorem still applies.

Depends on: `koshikawa-local-vanishing`, `mantovan-formula`, `minimal-stratum-lower-bound`, `artin-vanishing-upper-bound`, `igusa-pink-formula`, `quasi-split-unitary-datum`.

Used by: `middle-degree-without-length-hypothesis`.

Sources:

- Theorem 1.3, p. 2; proof §9, pp. 14–16 (kos21): “Theorem 1.3. Assume B = F , V = F 2n , and G is a quasi-split similitude unitary group. Then, Conjecture 1.2 holds true.” — Koshikawa Theorem 1.3 (quasi-split case of Conjecture 1.2).
- Proof of Theorem 2.1.28, p. 25 (cn23): “Moreover, we can remove the technical hypotheses that [F + : Q] > 1 and ρ̄ em has length at most two by appealing to Koshikawa’s work [Kos21, Theorem 1.4].” — Caraiani–Newton use Koshikawa to remove the hypotheses [F⁺:ℚ] > 1 and length at most two.

### `middle-degree-without-length-hypothesis` — Middle-degree injection and boundary surjection without [F⁺:ℚ] > 1 or length two (Caraiani–Newton Theorem 2.1.28)

Declaration `IgusaVarietiesAndTorsionConcentration:IG.7/middle-degree-without-length-hypothesis` (theorem).

Let F be an imaginary CM field containing an imaginary quadratic field, T ⊇ S_p a finite set of finite places with T = T^c such that every finite v ∉ T of residue characteristic l either has T free of l-adic places and l unramified in F, or l split in an imaginary quadratic subfield of F. Let 𝔪̃ ⊂ 𝕋̃^T(K̃, λ̃) be a maximal ideal with ρ̄_𝔪̃ decomposed generic (Caraiani–Newton Definition 2.1.27: some ℓ ≠ p splits completely in F with ρ̄|_{G_{F_v}} unramified and α_i/α_j ≠ ℓ for all v | ℓ), and d = dim_ℂ X̃_K̃. Then there are 𝕋̃^T-equivariant maps H^d(X̃_K̃, V_λ̃[1/p])_𝔪̃ ↩ H^d(X̃_K̃, V_λ̃)_𝔪̃ ↠ H^d(∂X̃_K̃, V_λ̃)_𝔪̃, the first injective and the second surjective.

Hypotheses:

- As stated; this is the form needed for F⁺ = ℚ.

Proof or construction:

1. As for IG.7/acc-middle-degree-export, replacing IG.7/caraiani-scholze-vanishing by IG.7/koshikawa-generic-vanishing (localization at the local Hecke algebra at the decomposed-generic prime, which dominates the global maximal ideal).

Acceptance:

- For F imaginary quadratic and n = 1 this is the input used by Caraiani–Newton for the modularity of elliptic curves over imaginary quadratic fields.

Depends on: `koshikawa-generic-vanishing`, `acc-middle-degree-export`, `integral-and-local-system-versions`, `ArithmeticLocallySymmetricSpaces:ALS.4/boundary-triangle`.

Sources:

- Theorem 2.1.28 and its proof, p. 25 (§2.1) (cn23): “Theorem 2.1.28. Keep the same assumptions on F as in Theorem 2.1.26. Let” — Caraiani–Newton Theorem 2.1.28.
- Theorem 2.1.26, p. 24 (same hypotheses on F as Theorem 2.1.20, p. 22); setup §2.1.11, p. 15 (cn23): “λ̃) be a maximal ideal. Suppose F contains an imaginary quadratic field, the finite set of finite places T of F is stable under complex conjugation, and the following condition is satisfied:” — The hypotheses on F and T referred to.

## Requests to other roadmaps

Each request names the supplier stage, the precise statement needed and the consuming nodes.

- **`AbelianSchemesAndArithmeticModuli:A4`**: Classical Serre–Tate theorem: for S′ → S a nilpotent thickening on which p is nilpotent, abelian schemes over S′ (with endomorphisms and polarization) are equivalent to triples (A_S, 𝒢_{S′}, A_S[p^∞] ≅ 𝒢 ⊗ S), and the p-divisible group A[p^∞] of an abelian scheme; IG.0 extends it to semi-abelian schemes and non-noetherian bases. Needed by: `serre-tate-semi-abelian`, `pel-rapoport-zink-space`, `canonical-lift-of-igusa`.
- **`BunGAndNewtonStrata:BG1`**: The Kottwitz set B(G, μ) = {b : κ(b) = μ^♮, ν_b ≤ μ^◇} with its partial order (the ordinary element is maximal when the reflex field is ℚ), using only the algebraic B(G)/Newton/Kottwitz data; and the Rapoport–Richartz statement that the isocrystal of a point of a PEL special fibre lies in B(G_{ℚ_p}, μ^{−1}). No analytic torsor comparison is needed. Needed by: `unramified-local-pel-datum`, `newton-map`, `fundamental-eo-stratum-in-newton-stratum`, `flag-newton-strata-dimension`.
- **`BunGAndNewtonStrata:BG3`**: The Newton stratification of the flag variety Fℓ_{G,μ} = ⊔_{b∈B(G,μ^{−1})} Fℓ^b (pullback of the Bun_G strata along the Beauville–Laszlo map Fℓ_{G,μ} → Bun_G, CS17 §3): locally closed partially proper strata with Fℓ^{≥b} closed and x ∈ Fℓ^b iff the bundle ℰ_x is ℰ_b. The dimension formula dim Fℓ^b = d − d_b is proved in IG.3, not requested. Needed by: `flag-newton-strata-dimension`, `local-hodge-tate-period-map`, `minimal-stratum-lower-bound`.
- **`DiamondsAndVStacks:D5`**: Geometry of canonical compactifications of separated maps of diamonds (Scholze, Étale cohomology of diamonds, Proposition 18.6) and the criterion that a map of quasicompact quasiseparated (spatial) diamonds that is bijective on (C, C⁺)-points for all complete algebraically closed C is an isomorphism (Lemma 11.11). Needed by: `canonical-compactification-criterion`, `toroidal-fibre-theorem`.
- **`EndoscopicTransferAndUnitaryTraceComparison:ET.4`**: For the groups 𝒢_n⃗ = (Res_{F₀/ℚ}𝔾_m × Res_{F/ℚ}GL_n⃗) ⋊ {1, θ}: the stabilized twisted trace formula with no proper cuspidal subsets when [F⁺:ℚ] ≥ 2, base-change transfers, the level N₀ at bad places (CSnc §§5.2–5.5). Needed by: `galois-representations-for-igusa-constituents`.
- **`EndoscopicTransferAndUnitaryTraceComparison:ET.5`**: Shin's stable trace formula for the Igusa varieties of IG.1 (Shin 2010, Theorem 7.2; CSnc Theorem 5.3.2): tr(φ | H_c(Ig^b, ℚ̄_ℓ)) = Σ ι(G, G_n⃗) ST_e^{G_n⃗}(φ^n⃗) for acceptable φ, with no ker¹ factor. Needed by: `galois-representations-for-igusa-constituents`.
- **`EndoscopicTransferAndUnitaryTraceComparison:ET.6`**: Local Langlands for GL_m and its inner forms with full Weil–Deligne parameters (Badulescu's Jacquet–Langlands), the semisimple Langlands parameters of CSnc Remark 5.1.1, and the nontransfer of generic principal series to nontrivial inner forms of Levi subgroups (CS17 Lemma 5.4.3). Needed by: `galois-representations-for-igusa-constituents`, `genericity-forces-ordinary`.
- **`EndoscopicTransferAndUnitaryTraceComparison:ET.7b`**: The rational Igusa trace comparison (CSnc Theorem 5.6.1, Lemma 5.6.2): tr(φ | [H_c(Ig^b, ℚ̄_ℓ)]) as a combination of traces of Red^b_n⃗(π_p^n⃗) and θ-stable cohomological isobaric Π^n⃗, with the corrected Red^b normalization (δ̄^{1/2}_{P(ν_b)} applied once) and Ξ(φ_n⃗)-cohomologicality. Needed by: `galois-representations-for-igusa-constituents`.
- **`ExcursionOperatorsAndSpectralAction:ES5`**: Fargues–Scholze semisimple L-parameters of smooth irreducible representations of the groups J_b(F) and the spectral action on the cohomology of local Shimura varieties. Needed by: `koshikawa-local-vanishing`.
- **`ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison`**: Compatibility of the Fargues–Scholze parameters with the semisimplified local Langlands correspondence for GL_n and its inner forms (and Hansen–Kaletha–Weinstein's consequences for the cohomology of local Shimura varieties), as used by Koshikawa Theorem 1.1. Needed by: `koshikawa-local-vanishing`.
- **`FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`**: The universal cover X̃ = lim_{×p} X of a p-divisible group over a ring on which p is nilpotent: invariance under isogenies, rigidity under nilpotent thickenings (X̃(R) = X̃(R/I) for I nilpotent; Scholze–Weinstein Proposition 3.1.3), its representability by a formal scheme over perfect bases (CS17 Proposition 4.1.2), and quasi-isogenies of p-divisible groups as isomorphisms of universal covers. Needed by: `automorphism-group-of-universal-cover`, `pel-rapoport-zink-space`, `canonical-lift-of-igusa`, `sw-infinite-level-rz-space`.
- **`FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`**: Scholze–Weinstein Theorem A: on an f-semiperfect ring R (e.g. O_C/p) the Dieudonné module functor on p-divisible groups up to isogeny is fully faithful, with values in φ-modules over B⁺_cris(R); used for the internal Hom of Chai–Oort and for the constancy of the p-divisible group of a flag point modulo p^ε. Needed by: `internal-hom-dieudonne-module`, `pdiv-constant-mod-p-epsilon`, `sw-infinite-level-rz-space`.
- **`HodgeTateAndCanonicalSubgroups:T0`**: The Hasse invariant Ha = det(V : ω^{(p)} → ω) of the p-torsion of a p-divisible group (BT₁) over an 𝔽_p-scheme, as a section of ω^{⊗(p−1)}; IG.2 compares it with the Ekedahl–Oort Hasse section of the ordinary stratum. Needed by: `ekedahl-oort-stratification`.
- **`HodgeTateAndCanonicalSubgroups:T1`**: For an abelian variety A over O_C, the Hodge–Tate filtration of H¹_ét(A_C, ℤ_p) ⊗ C agrees with the Hodge–Tate filtration of the p-divisible group A[p^∞] (CS17 Remark 4.2.8, Scholze 2013 Proposition 4.15), so the global period map restricts to the local one. Needed by: `product-formula`, `newton-strata-correspond`.
- **`HodgeTateAndCanonicalSubgroups:T2`**: Scholze–Weinstein Theorem B: p-divisible groups over O_C are equivalent to pairs (T, W) with T a finite free ℤ_p-module and W ⊂ T ⊗ C(−1) a C-subspace, via G ↦ (T_pG, Lie G ⊗ C); IG.3 adds the O_F-action and polarization (PEL) adapter. Needed by: `flag-points-and-p-divisible-groups`, `local-period-fibres`, `product-formula`, `sw-infinite-level-rz-space`.
- **`LefschetzPencilsAndVanishingCycles:LPV.6`**: Left t-exactness of nearby cycles for the perverse t-structure with torsion coefficients 𝔽_ℓ (Illusie, Autour du théorème de monodromie locale, Cor. 4.5), over the valuation ring O_C of a complete algebraically closed field through finite-type models over complete discretely valued subrings; the packet node is stated for rational ℓ-adic coefficients. Needed by: `compact-perversity`, `semiperversity`.
- **`PadicHodgeTheory:P8`**: Scholze's primitive comparison theorem and its relative form (Scholze 2013, Theorems 1.3, 3.13 and 5.1): for a proper (smooth) map of rigid spaces over C the map O⁺ᵃ/p^n → π_*O⁺ᵃ/p^n is an almost isomorphism when ℤ/p^n → π_*ℤ/p^n is (geometrically connected Stein fibres); intended owner the proposed sub-stage PadicHodgeTheory:P8:primitive (RT-AREA-padic-1/24, RT-AREA-padic-2/3). Needed by: `minimal-fibre-theorem`.
- **`SchemeAndStackFoundations:SF.4`**: Formal schemes: locally noetherian and adic formal schemes over Spf W(k) and Spf O_C, completions along closed subschemes, and the identification of the étale site of a formal scheme with that of its special fibre (route of PAPER-CARAIANI-SCHOLZE-17: IG.0 imports SF.4); the packet nodes of AdicSpacesPartII F0/R2 are used where they exist. Needed by: `automorphism-group-of-universal-cover`, `pel-rapoport-zink-space`, `good-reduction-locus`, `equivariant-sites-and-nearby-cycles`.
- **`SmoothRepresentationsOfLocalGroups:SR.0`**: The abelian category of smooth representations of a locally profinite group with coefficients in 𝔽_ℓ, ℤ_ℓ or ℚ̄_ℓ, its bounded-below derived category D^+_sm and derived invariants RΓ_cont(K, −) for compact open K. Needed by: `igusa-cohomology`, `alternating-igusa-cohomology`, `mantovan-formula`, `boundary-parabolic-induction`, `parabolic-induction-derived-invariants`.
- **`SmoothRepresentationsOfLocalGroups:SR.1`**: The opposite anti-involution [KgK] ↦ [Kg^{−1}K] of Hecke algebras of compact-open double cosets over rings, as an involution of the commutative spherical Hecke algebra. Needed by: `dual-hecke-ideal`.
- **`SmoothRepresentationsOfLocalGroups:SR.2`**: Unnormalized smooth parabolic induction Ind^{G}_{P} and inflation from a Levi, with exactness and adjunctions, for locally profinite groups of the form J_b(ℚ_p) × G(𝔸_f^p). Needed by: `igusa-cohomology`, `alternating-igusa-cohomology`, `mantovan-formula`, `boundary-parabolic-induction`, `parabolic-induction-derived-invariants`.
- **`TorsionCohomologyInfrastructure:TC.3`**: Boundary induction for GL_n and unitary Borel–Serre strata: the Levi/determinant factor extraction showing that an absolutely irreducible residual representation does not occur in the localized boundary cohomology (as in the proof of ACC+ Theorem 2.4.2). Needed by: `irreducible-specialization`.
- **`TorsionCohomologyInfrastructure:TC.4`**: Scholze's torsion Galois determinants for GL_r over a CM field F: for a maximal ideal 𝔪₁ of the Hecke algebra acting on H^*(GL_r locally symmetric space, 𝔽_ℓ) there is a continuous semisimple ρ̄_{𝔪₁} with the expected Frobenius polynomials (Scholze 2015 Corollary 5.4.3 / Theorem 5.4.1; ACC+ Theorem 2.3.5). RT-AREA-langlands-1/9 proposes a new stage TorsionCohomologyInfrastructure:TC.5 owning it; TC.4 is the existing stage. Needed by: `boundary-length-obstruction`.
- **`VectorBundlesAndIsocrystals:VB2`**: Fargues: G-Dieudonné modules over B⁺_cris(O_C/p) are equivalent to G-bundles on the Fargues–Fontaine curve X_{C♭}, determined up to isomorphism by their restriction to W(k)[1/p] (Fargues 2020, Théorèmes 5.1, 5.6), and the classification of p-divisible groups over O_C/p up to isogeny by such bundles (CS17 Theorem 4.1.4). Needed by: `local-period-surjective-on-stratum`, `pdiv-constant-mod-p-epsilon`.
- **`tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`**: The global Artin map of the CM field F and its geometric normalization (the composite with inversion, sending uniformizers to geometric Frobenius), used for the twist |Art_F^{−1}|^{1−2n} of the dual Hecke ideal. Needed by: `dual-hecke-ideal`.

## Gaps

- **Toroidal quasi-isogeny invariance of Igusa varieties (CSnc Corollary 3.2.14)** (needed by `toroidal-isogeny-invariance`, `leaf-minimal-compactification-affine`, `perfect-minimal-igusa`). As printed the corollary concerns G-isogenies inducing isomorphisms on étale and multiplicative parts, which are isomorphisms when X^μ ≠ 0 (sourceIssues /E1, RT-PAPER-CARAIANI-SCHOLZE-24/1). The proof treats a map of similitude p^m on Gr_{−1} and 1 on the outer parts, which is not a G-isogeny; the principal polarization of B′ = B/ρ^{−1}(K) and the compatibility of the boundary isomorphisms with the interior one are not established. Needed: a proof for unit-similitude G-quasi-isogenies, or a different route.
- **Minimal p-divisible groups with G-structure are completely slope divisible** (needed by `minimal-igusa-compactification`, `leaf-minimal-compactification-affine`). The route around the previous gap chooses X_b = X_w, the p-divisible group of a fundamental element (Nie), so that C^{X_b,*} is affine by Boxer and Lan–Stroh without isogeny transfer. This needs X_w to be completely slope divisible with G-structure (Oort's minimal p-divisible groups; Viehmann–Wedhorn for the identification of the minimal EO stratum with a central leaf). Not read: Oort, "Minimal p-divisible groups" (Ann. of Math. 161 (2005)); Viehmann–Wedhorn, Math. Ann. 356 (2013).
- **Unit-similitude quasi-isogenies of biconnected parts for p inert in F₀** (needed by `unit-similitude-quasi-isogeny`). IG.2/unit-similitude-quasi-isogeny proves existence for p split in F₀ (the case of the main theorem). For p inert in F₀ (allowed in CSnc §3) the similitude factors of J_b(ℚ_p) may not reach every valuation; existence is not established.
- **Torsion Galois determinants for GL_r over F have no owner node** (needed by `boundary-length-obstruction`). The induction of CSnc Theorem 6.4.1 uses Galois representations for maximal ideals in the cohomology of GL_r locally symmetric spaces over F ([Sch15, Cor. 5.4.3] or [ACC+23, Thm 2.3.5]). No packet node plans them; RT-AREA-langlands-1/9 (confirmed) proposes TorsionCohomologyInfrastructure:TC.5, not yet in the atlas. Requested from TC.4 meanwhile.
- **Relative primitive comparison theorem** (needed by `minimal-fibre-theorem`). CSnc Lemma 4.5.2 uses the relative primitive comparison theorem [Sch13, Thm 3.13] for the finite-level maps S^tor → S^* with geometrically connected Stein fibres. No packet node states it; the proposed owner PadicHodgeTheory:P8:primitive (RT-AREA-padic-1/24, 2/3) is not yet in the atlas. Requested from P8.
- **Scholze–Weinstein Theorem B with PEL structure and Fargues' G-bundle classification** (needed by `flag-points-and-p-divisible-groups`, `pdiv-constant-mod-p-epsilon`, `local-period-surjective-on-stratum`). Both are requested (HodgeTateAndCanonicalSubgroups T2, which has no packet; VectorBundlesAndIsocrystals VB2, whose node classifies vector bundles, not G-bundles or G-Dieudonné modules over B⁺_cris). RT-AREA-padic-1/25 proposes a FiniteFlatGroupsAndIntegralPadicHodgeTheory stage for the Scholze–Weinstein results; not live.
- **Torsion left t-exactness of nearby cycles over O_C** (needed by `semiperversity`, `compact-perversity`). LefschetzPencilsAndVanishingCycles:LPV.6/nearby-perverse-exactness is stated for rational ℓ-adic coefficients over a henselian trait; IG.4 needs 𝔽_ℓ coefficients and only the lower bound ^pD^{≥d}, over O_C via finite-type models (Illusie 1994, Cor. 4.5). Requested from LPV.6.
- **Harris–Taylor Drinfeld-level integral models and Igusa varieties of the first kind** (needed by `drinfeld-level-newton-strata`, `refined-drinfeld-strata`, `harris-taylor-igusa-varieties`). Smoothness and dimension of the strata Y°_{m,j} at Drinfeld level and the Igusa varieties of the first kind are from Harris–Taylor [HT01, §§III.4, IV.1], which is not freely available and was not read; Li–Liu justify them "by the similar argument of [HT01, Cor. III.4.4]". No layer plans the Harris–Taylor models.
- **Mantovan's compactification of Igusa varieties (Math. Ann. 340 (2008)) not read** (needed by `refined-strata-closures-smooth`). The smoothness of the closures Y^[M]_m is cited from [Man08, Prop. 12] through Li–Liu II; the matching of Mantovan's integral model with Li–Liu's X_m was not checked.
- **Koshikawa's local vanishing: Fargues–Scholze and Hansen–Kaletha–Weinstein inputs** (needed by `koshikawa-local-vanishing`). Theorem 1.1 of Koshikawa rests on Fargues–Scholze parameters and their compatibility with local Langlands for GL_n and inner forms; requested from ExcursionOperatorsAndSpectralAction ES5 and ES7:GLn-comparison. The exact form of the Hansen–Kaletha–Weinstein statement used was not checked.
- **Descent of Theorem 1.1 to arbitrary neat level with p-power level** (needed by `level-descent`). CSnc proves the vanishing at K(N) ∩ G⁰ with N prime to p (sourceIssues /E9, RT-PAPER-CARAIANI-SCHOLZE-24/4). For K⁰_p ≠ G⁰(ℤ_p) the descent uses the Lan–Stroh comparison of the good-reduction locus for N divisible by p (Lan–Stroh, Nearby cycles, Cor. 5.20), which IG.3/good-reduction-locus-cohomology plans only for p ∤ N.
- **Applications of Li–Liu and LTXZZ handed to roadmaps not yet in the atlas** (needed by no node of this roadmap (handed to other roadmaps)). Li–Liu Lemma 7.3 and Remark 7.4, Li–Liu II Lemmas 4.22–4.24, Proposition 4.25 and Theorem 4.21 (owner: the proposed UnitaryArithmeticInnerProductFormula, route 1 of PAPER-LI-LIU-21/22, per RT-PAPER-LI-LIU-21/1), and LTXZZ Proposition D.1.3 with its auxiliary datum, honest-unitary Igusa trace formula and Corollary D.1.4 (owner: the proposed compact-unitary Part II of this roadmap, DESIGN pending) are not planned here; their owners are not in the atlas, so no request can be made.

## Mistakes found in the sources

New findings of this plan (the nodes use the corrected statements):

- **IgusaVarietiesAndTorsionConcentration/E1** (gap; On the generic part of the cohomology of non-compact unitary Shimura varieties, §3.2.7, Corollary 3.2.14 and its proof, pp. 44–45, with footnote 15 to the proof of Theorem 3.3.2, p. 45 (arXiv v2)). Printed: “Let φ : X → X′ be an isogeny between p-divisible groups with G-structure over k. Assume that φ induces an isomorphism on étale and multiplicative parts.” Correction: State the corollary for G-quasi-isogenies with unit similitude inducing isomorphisms on étale and multiplicative parts, and supply a proof (the printed proof treats a map with similitude p^m on Gr_{−1} and 1 on the outer parts, which is not a G-isogeny); footnote 15 should ask for such a quasi-isogeny. Reason: A G-isogeny satisfies φ^∨λ′φ = cλ; restricted to X^μ ≅ (X^{ét})^∨ this forces c ∈ ℤ_p^× when φ is an isomorphism on X^μ ≠ 0, and then deg(φ)² = |X[c]| = 1, so φ is an isomorphism. By Proposition 3.1.4 the leaf meets the boundary only when X^{ét} ≠ 0, so the corollary as printed extends only isomorphisms. Reported by RT-PAPER-CARAIANI-SCHOLZE-24/1 (confirmed). Affects: the proof. Known: new.
- **IgusaVarietiesAndTorsionConcentration/E2** (error; On the generic part of the cohomology of non-compact unitary Shimura varieties, §3.3.6, Lemma 3.3.8(1), p. 47; proof of Theorem 2.8.1, p. 34; proof of Theorem 4.5.1, p. 59 (arXiv v2)). Printed: “(1) The morphism h^{b,∗} : Ig^{b,∗} → C^{b,∗} is finite and surjective. In particular, Ig^{b,∗} is affine.” Correction: Finite and surjective holds for Ig^{b,*}_m, the normalization of C^{b,*} in the finite-level Ig^b_m; for the pro-Igusa variety Ig^b the map is integral (not finite) and Ig^{b,*} is affine because C^{b,*} is (Theorem 3.3.2, Proposition 3.3.4). The proofs of Theorem 2.8.1 ("This is Lemma 3.3.8") and Theorem 4.5.1 should cite Theorem 3.3.2 and Proposition 3.3.4. Reason: Ig^b is a pro-finite étale cover with infinite Galois group Γ_X, so its normalization over C^{b,*} has infinitely generated coordinate ring over that of C^{b,*}. Reported by RT-PAPER-CARAIANI-SCHOLZE-24/7 and /39 (confirmed). Affects: nothing. Known: new.
- **IgusaVarietiesAndTorsionConcentration/E3** (misprint; On the generic part of the cohomology of non-compact unitary Shimura varieties, §5.1, proof of Corollary 5.1.3, p. 66 (arXiv v2)). Printed: “ρ̄_m := ρ̄_{m∨}|Art_F^{−1}|^{1−2n}” Correction: ρ̄_m := (ρ̄_{m∨})^∨ |Art_F^{−1}|^{1−2n} Reason: The paper's own relation on p. 36 is ρ̄_{m∨} ≅ ρ̄_m^∨|Art_F^{−1}|^{1−2n}; without the contragredient, Frob_v would have eigenvalues q_v^{4n−2}α_{i,v}^{−1} and the corollary's characteristic polynomial would fail. Reported by RT-PAPER-CARAIANI-SCHOLZE-24/12 (confirmed on the page image). Affects: nothing. Known: new.
- **IgusaVarietiesAndTorsionConcentration/E4** (misprint; On the generic part of the cohomology of non-compact unitary Shimura varieties, §4.4, Theorem 4.4.1, p. 57 (arXiv v2)). Printed: “As the target is partially proper over Spa(C,O_C), this implies that it is the canonical compactification of Ig^{b,tor}_C.” Correction: As the target is proper over Spd C (a closed fibre of the proper map π^tor_HT), Lemma 4.4.2 applies and the target is the canonical compactification. Reason: Lemma 4.4.2 is stated for a proper diamond Y; partial properness alone does not give the canonical compactification of a quasicompact source. Reported by RT-PAPER-CARAIANI-SCHOLZE-24/41 (confirmed). Affects: nothing. Known: new.
- **IgusaVarietiesAndTorsionConcentration/E5** (misprint; On the generic part of the cohomology of non-compact unitary Shimura varieties, §3.1, before Proposition 3.1.3, p. 38 (arXiv v2)). Printed: “See [LS18a, Theorem 2.3.3] for the ﬁrst basic properties of these partial compactiﬁcations.” Correction: See [LS18a, Theorem 2.3.2]. Reason: In Lan–Stroh, Forum Math. Sigma 6 (2018), e18, the partial-compactification theorem is Theorem 2.3.2; "(2.3.3)" is a display (the Stein factorization) inside its item (2), and there is no Theorem 2.3.3. Affects: nothing. Known: new.
- **IgusaVarietiesAndTorsionConcentration/E6** (error; On the generic part of the cohomology of non-compact unitary Shimura varieties, §5.6, Lemma 5.6.2 and the definition of Red^b_n⃗ "from Section 5.4 of [CS17]", p. 75; proof of Theorem 5.1.2, p. 77 (arXiv v2)). Printed: “is cohomological (with respect to the trivial algebraic representation)” Correction: Π^n⃗_∞ is cohomological with respect to the algebraic representation Ξ(φ_n⃗) determined by the test function at ∞ (not the trivial one) for proper endoscopic groups, and Red^b must include the twist by δ̄^{1/2}_{P(ν_b)} exactly once (either twist the representation or the test function), as corrected for CS17 in PAPER-CARAIANI-SCHOLZE-17/E74 and E77. Reason: CSnc copies CS17 Lemma 5.5.1 and Red^b from CS17 §5.4, which carry these two errors (recorded and confirmed for CS17); the infinity functions on CSnc pp. 74–75 and Shin (6.7) use Ξ(φ). Reported by RT-PAPER-CARAIANI-SCHOLZE-24/30 (confirmed); the normalization |·|^{1/2−n} of Theorem 5.1.2 should be rechecked against the corrected Red^b. Affects: the proof. Known: inherited from Caraiani–Scholze 2017 (PAPER-CARAIANI-SCHOLZE-17/E74, E77); no published correction found.
- **IgusaVarietiesAndTorsionConcentration/E7** (misprint; On the modularity of elliptic curves over imaginary quadratic fields, Proof of Theorem 2.1.28, p. 25, arXiv:2301.10509v3). Printed: “by appealing to Koshikawa’s work [Kos21, Theorem 1.4]” Correction: [Kos21, Theorem 1.3] Reason: In arXiv:2106.10602v1 (the only version, the one cited), Theorem 1.3 is the quasi-split unitary similitude case (Caraiani–Scholze's non-compact setting) and Theorem 1.4 is the case of G anisotropic modulo centre; Theorem 2.1.28 concerns the quasi-split group G̃. Affects: nothing. Known: new.
- **IgusaVarietiesAndTorsionConcentration/E8** (misprint; On the generic part of the cohomology of non-compact unitary Shimura varieties, §2.6, proof of Proposition 2.6.4, p. 32 (arXiv v2)). Printed: “Then [LS18a, Corollary 5.20] shows that” Correction: Then [LS18b, Corollary 5.20] shows that Reason: Corollary 5.20 (RΓ of the generic fibre equals RΓ of the special fibre with nearby cycles, for the possibly non-proper integral models) is in Lan–Stroh, "Nearby cycles of automorphic étale sheaves" (= [LS18b]); [LS18a] (compactifications of subschemes) has four sections and no Corollary 5.20. Affects: nothing. Known: new.
- **IgusaVarietiesAndTorsionConcentration/E9** (gap; On the generic part of the cohomology of non-compact unitary Shimura varieties, §1, Theorem 1.1 with the set-up on p. 4 ("For any neat compact open subgroup K ⊂ G(A_f)"); proof of Theorem 1.1, §2.8, p. 36 (arXiv v2)). Printed: “is concentrated in degrees ≥ d, which is what we wanted to prove (by Lemma 2.1.1 and Proposition 2.1.6).” Correction: Add the reduction from K(N) ∩ G⁰(𝔸_f) (N ≥ 3 prime to p, N₀ | N, S enlarged by p, ℓ and the ramification of ϖ) to a general neat K: contraction of the Hecke algebra to 𝕋^{S′}, Hochschild–Serre along K(N) ∩ G⁰ ⊂ K⁰ (normal, free action) and, if K⁰_p ≠ G⁰(ℤ_p), Hochschild–Serre from infinite level at p with the good-reduction comparison at level p^mN. Reason: Lemma 2.1.1 and Proposition 2.1.6 are used at the auxiliary level K(N); the passage to the general neat level of the statement is not written. Reported by RT-PAPER-CARAIANI-SCHOLZE-24/4 (confirmed as a missing descent step, not a counterexample). Affects: the proof. Known: new.
- **IgusaVarietiesAndTorsionConcentration/E10** (misprint; On the generic part of the cohomology of non-compact unitary Shimura varieties, §6.2.3, construction of f, p. 82 (arXiv v2)). Printed: “and it follows from the construction that it is J_b(Q_p) × P(A^p_f)-equivariant.” Correction: and it follows from the construction that it is P_b(ℚ_p) × P(𝔸_f^p)-equivariant. Reason: f is defined on |Ig^b_{∞,P}|, the fibre of Ig^{b,∗}_{∞,[P]} → J_b(ℚ_p)/P_b(ℚ_p) × G(𝔸_f^p)/P(𝔸_f^p) over the identity (§6.2.1), which only P_b(ℚ_p) × P(𝔸_f^p) preserves, and the p-adic coordinate of f is the element of GL_r(F ⊗ ℚ_p) given by the action on Z_{b,−2}, through which only P_b(ℚ_p) acts. The closing sentence of §6.2 (P_b(ℚ_p) × P(𝔸_f^p)-actions) has the corrected group; the parallel misprint on p. 81 is PAPER-CARAIANI-SCHOLZE-24/E10. Affects: nothing. Known: new.

Mistakes already recorded in the paper extractions and used here: PAPER-CARAIANI-SCHOLZE-17/E5, PAPER-CARAIANI-SCHOLZE-17/E6, PAPER-CARAIANI-SCHOLZE-17/E7, PAPER-CARAIANI-SCHOLZE-17/E13, PAPER-CARAIANI-SCHOLZE-17/E15, PAPER-CARAIANI-SCHOLZE-17/E36, PAPER-CARAIANI-SCHOLZE-17/E37, PAPER-CARAIANI-SCHOLZE-17/E42, PAPER-CARAIANI-SCHOLZE-17/E44, PAPER-CARAIANI-SCHOLZE-17/E45, PAPER-CARAIANI-SCHOLZE-17/E46, PAPER-CARAIANI-SCHOLZE-17/E47, PAPER-CARAIANI-SCHOLZE-17/E49, PAPER-CARAIANI-SCHOLZE-17/E52, PAPER-CARAIANI-SCHOLZE-17/E53, PAPER-CARAIANI-SCHOLZE-17/E56, PAPER-CARAIANI-SCHOLZE-17/E58, PAPER-CARAIANI-SCHOLZE-17/E59, PAPER-CARAIANI-SCHOLZE-17/E61, PAPER-CARAIANI-SCHOLZE-17/E62, PAPER-CARAIANI-SCHOLZE-17/E74, PAPER-CARAIANI-SCHOLZE-17/E91, PAPER-CARAIANI-SCHOLZE-17/E92, PAPER-CARAIANI-SCHOLZE-24/E1, PAPER-CARAIANI-SCHOLZE-24/E4, PAPER-CARAIANI-SCHOLZE-24/E9, PAPER-CARAIANI-SCHOLZE-24/E10, PAPER-CARAIANI-SCHOLZE-24/E11, PAPER-CARAIANI-SCHOLZE-24/E12.

## Restructuring proposals

- **rescope** (IgusaVarietiesAndTorsionConcentration, AutomorphicPadicLFunctions, IntegralIwasawaTheory, PadicFamilies, AutomorphicCongruences, HodgeTateAndCanonicalSubgroups). RT-AREA-langlands-1/8 (confirmed): RS-14 makes IG.1 the Igusa supplier of Hilbert-modular consumers, but IG.1 constructs perfect Γ_X-torsors over central leaves of PEL unitary data, not the Katz–Hida ordinary tower of the Hilbert modular variety. Proposal: Remove the seven RS-14 links IG.1 → AutomorphicPadicLFunctions:L3, L3h, KU-hilberteisenstein, IntegralIwasawaTheory:I.3, PadicFamilies:L5, AutomorphicCongruences:L5 and AutomorphicCongruences:L5w (all seven were derived from the Hilbert layer AutomorphicPadicLFunctions:L3), and route them to HodgeTateAndCanonicalSubgroups:T5 (the Hilbert ordinary tower), extended in HilbertModularVarietiesAndShimuraCurves by the formal ordinary Igusa tower and its CM points, as the finding asks. Keep IG.1 → AutomorphicPadicLFunctions:L4, L4e, L5 and AutomorphicCongruences:L1 (derived from the unitary layer L4: EHLS, Eischen–Wan, Skinner–Urban on GU(2,2) over an imaginary quadratic field), which are unitary PEL data with p unramified and so lie in the widened scope of IG.0–IG.1. IG.1 supplies only special-fibre Igusa varieties, their finite-level models and their actions; Hida's ordinary Igusa tower over the ordinary locus and the mixed-characteristic EHLS lifts stay with the consumers.
- **rescope** (TorsionCohomologyInfrastructure, IgusaVarietiesAndTorsionConcentration, PotentialAutomorphyInfrastructure). RT-AREA-langlands-1/9 (confirmed): Scholze's torsion Galois determinants for GL_n (Annals 182, Theorems 5.3.1 and 5.4.1, with the GL_n Borel–Serre boundary induction) are owned by no layer, yet IG.6/boundary-length-obstruction needs them for GL_r over F. Proposal: Add TorsionCohomologyInfrastructure:TC.5 "Galois determinants for torsion in GL_n cohomology" (requires TC.4, ArithmeticLocallySymmetricSpaces:ALS.4, IntegralHeckeAndGaloisDeterminants:IHG.4, IHG.5), with edges TC.5 → IG.6 and TC.5 → PotentialAutomorphyInfrastructure:PA.0; then re-point this packet's request from TC.4 to TC.5.
- **rescope** (PadicHodgeTheory, IgusaVarietiesAndTorsionConcentration). RT-AREA-padic-1/24 and RT-AREA-padic-2/3 (confirmed): Scholze's primitive comparison theorem (2013, Theorems 1.3, 3.13, 5.1) has no owner stage; IG.3/minimal-fibre-theorem uses the relative form. Proposal: Add the sub-stage PadicHodgeTheory:P8:primitive after P8:local-rational, with an edge P8:primitive → IG.3 (and to CP.3, CP.4, AI.5, AI.6, TC.2, T6:log-primitive as in FIX-RT-AREA-padic-1/2); re-point this packet's request from P8 to it.
- **rescope** (BunGAndNewtonStrata, IgusaVarietiesAndTorsionConcentration, EndoscopicTransferAndUnitaryTraceComparison). RT-AREA-geomlanglands/32 (confirmed): the algebraic B(G) theory (G-isocrystals, J_b, Newton and Kottwitz maps, B(G, μ)) sits in BG0/BG1 behind analytic prerequisites, and IG.0 restated it. Proposal: Split BG0 and BG1 into an early algebraic part (B(G), J_b, ν, κ, the order and B(G, μ) with κ(b) = μ^♮, ν_b ≤ μ^◇) and the analytic torsor/bundle comparison; link the algebraic part to IG.0 and ET.5. This packet already imports the algebraic nodes and plans only the PEL-specific Newton map x ↦ [b_x], its admissibility and the μ^{−1} convention (IG.0/newton-map).
- **rescope** (IgusaVarietiesAndTorsionConcentration). RT-PAPER-CARAIANI-SCHOLZE-24/13 (confirmed): CSnc Theorem 6.4.1 is proved by induction on n using the lower bound (IG.4) and the genericity obstruction (IG.5) at every rank; IG.6 requires neither in the atlas. Proposal: Declare the stage edges IG.4 → IG.6 and IG.5 → IG.6 (IG.6/boundary-length-obstruction has prerequisites in both). No cycle: IG.6's only consumer is IG.7, and IG.4, IG.5 do not depend on IG.6. Promotion does not draw same-roadmap cross-layer edges, so the maintainer must add them.
- **split** (IgusaVarietiesAndTorsionConcentration, LefschetzPencilsAndVanishingCycles). LefschetzPencilsAndVanishingCycles:LPV.6/igusa-semiperversity-interface requires the stage IG.4, while IG.4 requires LPV.6 (filtered-colimit support criterion and nearby-cycle t-exactness): a stage cycle. Proposal: Create the sub-layer IG.4:formal-models holding IG.4/finite-level-formal-models (cofinal affinoid neighbourhoods, finite-level formal models, integrality of the mod-p maps, transition maps), with no LPV prerequisite. LPV.6/igusa-semiperversity-interface cites that node; IG.4 (semiperversity and the degree bounds) keeps importing LPV.6.
- **split** (IgusaVarietiesAndTorsionConcentration). IG.0 (30 nodes) mixes the local theory of p-divisible groups with G-structure (internal Hom, Aut(X̃_b), Rapoport–Zink spaces, slope filtrations, quasi-isogeny torsors) and the global PEL geometry (datum, integral model, Newton stratification, central leaves); IG.3 (28 nodes) mixes the CS17 local period map and product formula with the CSnc compactified fibre theorem. Proposal: Sub-layers for the atlas: IG.0:local (internal-hom-p-divisible-group, internal-hom-dieudonne-module, internal-hom-slopes, completely-slope-divisible, slope-filtration-existence, automorphism-group-of-universal-cover, structure-of-automorphism-group, unramified-local-pel-datum, pel-rapoport-zink-space, berthelot-without-noetherian, constant-newton-polygon-over-perfect-rings, quasi-isogeny-torsor) before IG.0; IG.3:local (sw-infinite-level-rz-space, local-hodge-tate-period-map, local-period-fibres, integral-extension-lemma, local-period-surjective-on-stratum, automorphism-group-dimension, flag-newton-strata-dimension) before IG.3.
- **rescope** (IgusaVarietiesAndTorsionConcentration, GrossZagierAndArithmeticHeights, AbelianSurfacesModularity). The maintainer's source list routes Li–Liu Lemma 7.3 (and its generalization Li–Liu II Theorem 4.21), LTXZZ Appendix D.1 and BCGP Lemma 4.9.6 to IG.5/IG.7. RT-PAPER-LI-LIU-21/1 (confirmed) shows that Lemma 7.3 is an application in Li–Liu's own setting (𝔪^R_π, Hypothesis 6.6, Proposition 6.9, Corollary B.15) and that planning it in IG reverses a dependency; the same holds for Li–Liu II Theorem 4.21 and Proposition 4.25 (situation of Proposition 4.20). LTXZZ D.1.3–D.1.4 are compact-case theorems resting on CS17 Theorem 5.5.7, owned by the compact-unitary Part II. BCGP Lemma 4.9.6 is a GSp₄ higher-Hida statement. Proposal: Plan Li–Liu Lemma 7.3, Remark 7.4 and Li–Liu II Lemmas 4.22–4.24, Proposition 4.25, Theorem 4.21 in UnitaryArithmeticInnerProductFormula (Part II of GrossZagierAndArithmeticHeights), importing IG.0/drinfeld-level-newton-strata, IG.0/refined-drinfeld-strata, IG.1/refined-strata-closures-smooth, IG.1/harris-taylor-igusa-varieties and IG.4/compact-minimal-stratum-concentration; plan LTXZZ Proposition D.1.3 and Corollary D.1.4 in IgusaVarietiesAndTorsionConcentrationPartIICompactUnitary, importing IG.7/cohomologically-generic; plan BCGP Lemma 4.9.6 in AbelianSurfacesModularity, importing IG.7/cs-generic-maximal-ideal for the distinction between decomposed genericity and irreducible localization.

## Coverage

| Layer | Status | What remains |
|---|---|---|
| IG.0 | planned | Lemma-level refinement of the CS17 §4.1–4.2 local theory (Chai–Oort internal Hom, Proposition 4.2.11 case by case: EL, GSp, GU) once the roadmap reaches lemma level. Harris–Taylor integral models at Drinfeld level and Mantovan's [Man08] smoothness are cited, not planned (gaps "Harris–Taylor Drinfeld-level models" and "Mantovan compactification of Igusa varieties"). B(G, μ) and the algebraic B(G)/J_b data are imported from BunGAndNewtonStrata BG0–BG1 (requested); re-point to an algebraic substage if RT-AREA-geomlanglands/32 is applied. |
| IG.1 | planned | Igusa varieties of the first kind rest on the Harris–Taylor Drinfeld-level models (recorded gap). Hilbert/Katz–Hida ordinary towers are not this layer's objects; the RS-14 links to Hilbert consumers are proposed for removal (restructure). |
| IG.2 | planned | CSnc Corollary 3.2.14 (toroidal quasi-isogeny invariance) rests on a recorded gap; the main argument is routed through the minimal (fundamental) representative instead, which needs the gap "minimal p-divisible groups are completely slope divisible". The Lan–Stroh erratum on separate powers of p (§3.6, Kottwitz–Rapoport strata) could not be obtained; it concerns parahoric level, not the good-reduction level used here. |
| IG.3 | planned | Scholze–Weinstein Theorem B (requested from HodgeTateAndCanonicalSubgroups T2) and Fargues' G-bundle classification (requested from VectorBundlesAndIsocrystals VB2) are imported, not planned. The relative primitive comparison theorem is requested from PadicHodgeTheory P8 (proposed sub-stage P8:primitive). |
| IG.4 | planned | Torsion (𝔽_ℓ) left t-exactness of nearby cycles over O_C is requested from LefschetzPencilsAndVanishingCycles LPV.6 (its packet node is stated for rational coefficients). The cycle with LefschetzPencilsAndVanishingCycles:LPV.6/igusa-semiperversity-interface is to be broken by citing IG.4/finite-level-formal-models (restructure proposal). |
| IG.5 | planned | Li–Liu Lemma 7.3 / Remark 7.4 and Li–Liu II Lemmas 4.22–4.24, Proposition 4.25, Theorem 4.21 are applications in Li–Liu's setting; following RT-PAPER-LI-LIU-21/1 they are handed to the proposed UnitaryArithmeticInnerProductFormula (restructure proposal), and only their Igusa and Newton-stratum inputs are planned here (IG.0, IG.1, IG.4). The rational Igusa trace comparison itself is requested from EndoscopicTransferAndUnitaryTraceComparison ET.4, ET.5, ET.7b. |
| IG.6 | planned | Scholze's torsion Galois determinants for GL_r over F are requested from TorsionCohomologyInfrastructure TC.4 (proposed TC.5, recorded gap). Declared edges IG.4 → IG.6 and IG.5 → IG.6 are needed for the induction in Theorem 6.4.1 (restructure proposal). |
| IG.7 | planned | LTXZZ Proposition D.1.3 and Corollary D.1.4 (compact case) are handed to the proposed compact-unitary Part II (restructure proposal); only Definition D.1.1 is planned here. Koshikawa's local vanishing rests on Fargues–Scholze inputs requested from ExcursionOperatorsAndSpectralAction ES5 and ES7:GLn-comparison. The descent of Theorem 1.1 to arbitrary neat level with p-power level uses the Lan–Stroh comparison for N divisible by p (recorded gap). |

## Acceptance tests

The roadmap's validation requirements, and where the plan meets them:

- **Ordinary, basic and proper non-basic Newton examples.** The ordinary and basic cases are acceptance items of IG.0/newton-map, IG.0/central-leaf, IG.1/perfect-igusa-variety and IG.3/flag-newton-strata-dimension. The non-basic, non-ordinary case is in IG.0/central-leaf.
- **Open versus toroidal isogeny invariance.** IG.1/igusa-isogeny-invariance proves the open statement. IG.2/toroidal-isogeny-invariance states the toroidal one under its own hypotheses, with the recorded gap.
- **The dual Hecke involution.** Tested in IG.5/dual-hecke-ideal.
- **Residual length two with nonzero boundary.** An acceptance item of IG.6/boundary-length-obstruction and a test of IG.7/cs-generic-maximal-ideal.
- **Every use of ℓ ≠ p.** Stated in the hypotheses of IG.1/igusa-cohomology, IG.4 and IG.5.
- **The main concentration statement is a theorem.** It is proved (IG.7/caraiani-scholze-vanishing), not assumed, and it is not a claim of general GL_n torsion vanishing.
- **The non-compact endpoint checks every hypothesis.** It checks the field, the level, length ≤ 2 and the split auxiliary prime. Genericity is α_i ≠ qα_j for i ≠ j, with unramifiedness separate; repeated eigenvalues are allowed.
- **Acceptance derives H^i = 0 below d and H_c^i = 0 above d.** It does not strengthen this to concentration of ordinary cohomology in degree d without further boundary input.

## Library baseline

Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Declarations cited (each statement read at the pinned commit):

- `tauceti:TauCeti.ReductiveAffineGroupSchemeCat` (abbrev, `TauCeti/AlgebraicGeometry/AffineGroupScheme/Reductive.lean`): For a field k, the full subcategory of finite-type affine group schemes over Spec k whose coordinate Hopf algebra satisfies reductiveCommHopfAlgProperty (smooth, geometrically connected, and no nontrivial connected normal smooth unipotent closed subgroup over an algebraic closure).
- `mathlib:Matrix.unitaryGroup` (abbrev, `Mathlib/LinearAlgebra/UnitaryGroup.lean`): For a commutative StarRing α and finite n, unitaryGroup n α := unitary (Matrix n n α), matrices with star A * A = 1 (relative to the star on α; no hermitian form parameter).
- `mathlib:NumberField.IsCMField` (class, `Mathlib/NumberTheory/NumberField/CMField.lean`): For a field K of characteristic 0, IsCMField K: K is totally complex (IsTotallyComplex) and a quadratic extension of its maximal real subfield K⁺; IsCMField.complexConj : K ≃ₐ[K⁺] K is complex conjugation (needs Algebra.IsIntegral ℚ K). NumberField.IsTotallyReal (all infinite places real) and NumberField.InfinitePlace (absolute values from embeddings K →+* ℂ) are in .../InfinitePlace/.
- `mathlib:PerfectRing` (class, `Mathlib/FieldTheory/Perfect.lean`): For [Pow R ℕ] and p : ℕ, PerfectRing R p is the Prop-class asserting that x ↦ x ^ p is bijective on R (Serre's perfect ring; primality of p comes from separate CharP/ExpChar hypotheses); with [ExpChar R p] it yields frobeniusEquiv R p : R ≃+* R, and PerfectField K (every irreducible polynomial separable) follows via PerfectRing.toPerfectField.
- `mathlib:ValuationRing` (class, `Mathlib/RingTheory/Valuation/ValuationRing.lean`): For a commutative ring A that is a domain, ValuationRing A says that for all a, b ∈ A either a divides b or b divides a.
- `mathlib:AlgebraicGeometry.Scheme.proetaleTopology` (abbrev, `Mathlib/AlgebraicGeometry/Sites/Proetale.lean`): The big pro-étale topology on schemes (Bhatt–Scholze Definition 4.1.1): generated by fpqc covers by weakly étale morphisms; it is finer than the étale and coarser than the fpqc topology, and subcanonical. Scheme.ProEt S is the small pro-étale site of weakly étale S-schemes.
- `mathlib:AlgebraicGeometry.Scheme.smallEtaleTopology` (def, `Mathlib/AlgebraicGeometry/Sites/Etale.lean`): For X : Scheme.{u}, X.smallEtaleTopology : GrothendieckTopology X.Etale is the small étale site, induced from the big étale topology on the category X.Etale := MorphismProperty.Over @Etale ⊤ X of schemes étale over X (objects built by Scheme.Etale.mk from an étale f : Y ⟶ X).
- `mathlib:AlgebraicGeometry.IsAffine` (class, `Mathlib/AlgebraicGeometry/AffineScheme.lean`): IsAffine X says the canonical morphism X ⟶ Spec Γ(X, ⊤) (X.toSpecΓ) is an isomorphism.
- `mathlib:AlgebraicGeometry.IsProper` (class, `Mathlib/AlgebraicGeometry/Morphisms/Proper.lean`): f is proper if it is separated (IsSeparated: the diagonal pullback.diagonal f is a closed immersion), universally closed and locally of finite type (isProper_eq records the MorphismProperty identity).
- `mathlib:AlgebraicGeometry.IsFinite` (class, `Mathlib/AlgebraicGeometry/Morphisms/Finite.lean`): f is finite if it is affine (IsAffineHom f: preimages of affine opens are affine) and for every affine open U ⊆ Y the ring map f.app U is finite.
- `mathlib:AlgebraicGeometry.Scheme.Hom.normalization` (def, `Mathlib/AlgebraicGeometry/Normalization.lean`): For a (qcqs, as the file's universal property assumes) morphism f : X ⟶ Y, f.normalization is the relative normalization of Y in X (Stacks 035H), glued from Spec of integral closures of Γ(Y,U) in Γ(X,f⁻¹U); f = toNormalization ≫ fromNormalization with fromNormalization integral and toNormalization dominant, universal among factorizations through integral T ⟶ Y (normalizationDesc).
- `mathlib:WittVector` (structure, `Mathlib/RingTheory/WittVector/Defs.lean`): WittVector p R (notation 𝕎 R) is the structure of p-typical Witt vectors with coefficients coeff : ℕ → R; for [Fact p.Prime] [CommRing R] an anonymous instance `instance : CommRing (𝕎 R)` (Mathlib/RingTheory/WittVector/Basic.lean l.244, not listed in the index) gives the ring structure.
- `mathlib:AlgebraicGeometry.IsProper.of_valuativeCriterion` (lemma, `Mathlib/AlgebraicGeometry/ValuativeCriterion.lean`): If f is quasi-compact, quasi-separated and locally of finite type and satisfies ValuativeCriterion f, then IsProper f (Stacks 0BX5); IsProper.eq_valuativeCriterion gives IsProper = ValuativeCriterion ⊓ QuasiCompact ⊓ QuasiSeparated ⊓ LocallyOfFiniteType, and UniversallyClosed.of_valuativeCriterion (quasi-compact + ValuativeCriterion.Existence ⇒ universally closed, Stacks 01KF) is the existence half.
- `mathlib:AlgebraicGeometry.ValuativeCriterion` (def, `Mathlib/AlgebraicGeometry/ValuativeCriterion.lean`): ValuativeCriterion : MorphismProperty Scheme holds for f when every valuative commutative square (Spec K → X, Spec R → Y, R a valuation ring with fraction field K, ValuativeCommSq) has a unique lift; ValuativeCriterion.Existence / .Uniqueness are the halves.
- `tauceti:HeckeAntiInvolution.ofAmbient` (def, `TauCeti/NumberTheory/HeckeRing/Commutativity.lean`): An involutive anti-homomorphism f : G →* Gᵐᵒᵖ of the ambient group preserving H and Δ restricts to a HeckeAntiInvolution Δ H of the Hecke datum (Δ, H) (Shimura's anti-involution data; ofAmbient_bar computes it).
- `tauceti:HeckeAntiInvolution.onHeckeCoset` (def, `TauCeti/NumberTheory/HeckeRing/Commutativity.lean`): The induced action of a Hecke anti-involution on double cosets H\Δ/H, sending the class of g to the class of bar g; it is an involution (onHeckeCoset_onHeckeCoset) under IsHeckeTriple.
- `tauceti:HeckeCosetModule.instRingHeckeRing` (instance, `TauCeti/NumberTheory/HeckeRing/Associativity.lean`): For [IsHeckeTriple Δ H H] and a ring R', 𝕋 Δ H R' is a Ring under the double-coset convolution product (instSemiringHeckeRing gives the semiring for semiring coefficients); root namespace, extends Mathlib's HeckeRing. Abstract double-coset Hecke algebras only: no Hecke algebras of compactly supported smooth functions on locally profinite groups.

Nothing in this roadmap is in either library: the reviewed audit finds every layer not built, apart from Mathlib's one-dimensional isocrystal classification. The declarations above are the existing carriers the plan builds on.
