# Hodge–Tate theory, canonical subgroups, and automorphic period maps: T0–T5

This part plans layers T0–T5 of the roadmap: the concrete abelian and Hilbert route that Birkbeck–Heuer–Williams, Scholze's Siegel construction and the Andreatta–Iovita–Pilloni coefficient sheaves use. Layer T6 (logarithmic sites and the comparison for general canonical local systems) is the roadmap's second part and is planned separately; T0–T5 do not wait for it. The plan starts from the finite-level Hodge–Tate map of a finite locally free group scheme, which the pinned Tau Ceti already almost contains (its augmentation cotangent space and Cartier duality), and ends at the comparison of the AIP torsor with the Hodge–Tate trivialisation on the anticanonical tower.

What this part does not plan, and who does:

- p-divisible groups, their Cartier duals, Tate modules, dimension and Tate's Hodge–Tate decomposition over a discretely valued base: FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1. This part never defines a second p-divisible group.
- The Hasse invariant Ha(G) = det V* of a BT₁ over an arbitrary 𝔽_p-scheme, Fargues's isomorphism LF and the BT₁ Hodge–Tate sequence: FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2 (RT-AREA-padic-1/26). T0 keeps only their extension to semi-abelian schemes and to the boundary.
- The Hodge–Tate period map on the perfectoid tower, its equivariance, the pullback of the Levi torsor and of automorphic bundles, the elliptic formula π_HT*𝒪(1) = ω and the Hilbert Res_{𝒪_F/ℤ}ℙ¹ identification: PerfectoidShimuraVarieties S3 (RT-AREA-padic-1/22). The Siegel canonical Frobenius lift, the anticanonical open immersions, the anticanonical tower and its perfectoidness: PerfectoidShimuraVarieties S1 and S5.
- Scholze–Weinstein's classification of p-divisible groups over O_C and O_C/p and the modification at ∞ (Caraiani–Scholze items 52, 53, 143): a proposed FiniteFlatGroupsAndIntegralPadicHodgeTheory stage after R07.2 (RT-AREA-padic-1/25).
- The relative de Rham comparison for proper smooth morphisms: PadicHodgeTheory P8. Continuous torsor descent: PerfectoidSpaces P9. Toroidal and minimal compactifications: ShimuraCompactifications C4–C6. Hilbert integral models and level structures: HilbertModularVarietiesAndShimuraCurves H2, H4.

## Conventions

These conventions are part of every statement below.

**Valuations and radii.** On O_K and O_C (C a complete algebraically closed extension of ℚ_p) the valuation is normalised by v(p) = 1 and |x| = p^{−v(x)}. A radius ε is an element of v(ℤ_p^cycl) (Scholze) or of log|L^×| (BHW), and p^ε denotes any element of that valuation. Hasse neighbourhoods are 𝒳(ε) = {|Ha| ≥ |p|^ε}; smaller ε means closer to the ordinary locus.

**Group schemes.** H^D = Hom(H, 𝔾_m) is the Cartier dual. ω_H = e*Ω¹_{H/S} is the conormal module of the unit section; over Spec R with H = Spec A it is (ker ε)/(ker ε)², Tau Ceti's `TauCeti.Bialgebra.CotangentSpace`. For a p-divisible group G over a p-adically complete ring, ω_G = lim ω_{G[p^n]}.

**The Hodge–Tate map.** α_H: H(S) → ω_{H^D}, x ↦ x*(dt/t), where x is read as a character of H^D by Cartier duality; over Spec R it is g ↦ [g − 1] on group-like elements. For a p-divisible group, α_G: T_pG → ω_{G^D}. For an abelian variety A over C this is applied to G = A^∨[p^∞], whose Cartier dual is A[p^∞] by the Weil pairing, and gives the roadmap's sequence

0 → Lie(A^∨)(1) → T_pA^∨ ⊗ C → ω_A → 0.

The rank-one quotient of T_pA^∨ ⊗ C (for g = 1) is ω_A, so the tautological quotient bundle pulls back to the Hodge line: points of the flag variety are quotients, not lines. Scholze's Lemma 3.3.4 records the same point as the subspace Lie A ⊂ T_pA ⊗ C = C^{2g}; the two descriptions agree through the Weil pairing (T0/hodge-tate-map-compatibilities (3)).

**Twists and weights** are those of CohomologyComparisons CP.0 and ClassicalAdicEtaleCohomology H0: ℤ_p(1) = T_pμ_{p^∞}, C(i) = C ⊗ ℤ_p(1)^{⊗i}, the cyclotomic character has Hodge–Tate weight +1, Fil^r B_dR = t^r B_dR⁺. So V_pA has weights 0 and 1, and the weight-1 part is Lie(A) ⊗ C(1).

**Parabolics** follow AutomorphicBundles B0/hodge-parabolic-convention: the Hodge–Tate filtration has stabiliser P_HT = P(μ) for the Hodge cocharacter μ, opposite to the stabiliser P_H = P(μ^{−1}) of the Hodge filtration, with common Levi M_μ = Z_G(μ).

**Hasse invariants.** For a semi-abelian S-scheme over 𝔽_p, Ha = det(V*: ω → ω^{(p)}) ∈ (det ω)^{⊗(p−1)}, Pilloni's convention. Fargues defines H̃a(G) through F on ω_{G^D}; the two agree up to LF (R07.2). Over O_K the Hasse valuation Ha(G) ∈ [0, 1] is the valuation of Ha computed modulo p, truncated at 1. Hilbert data use the total Hasse invariant.

**Canonical subgroups.** A (weak) canonical subgroup of level m exists when Ha^{(p^m−1)/(p−1)} divides p^ε with ε < 1/2; it is strong when Ha^{p^m} divides p^ε. The construction (Scholze) works for every p including 2; Fargues's Harder–Narasimhan characterisation needs p ≠ 2 and Ha < 1/(2p^{m−1}) (p ≥ 5) or Ha < 1/3^m (p = 3). Small-prime constants are part of the statements: BHW's c_p = 2, 3, 4 for p ≥ 5, p = 3, p = 2, and BHW's ε_m^can = p^{−(m+1)}.

**Hilbert data.** 𝒪_p = 𝒪_F ⊗ ℤ_p; level structures are put on A^∨ (BHW's convention). The flag variety is Res_{𝒪_F/ℤ}ℙ¹, with C-points ℙ¹(𝒪_p ⊗ C); balls are defined through the integral closure of 𝒪_F ⊗ O_C, which is what makes the period estimates meaningful when p ramifies in F.

**Fractional-linear action.** GL₂ acts on the left by z(γx) = (az(x) + b)/(cz(x) + d), with automorphy factor j(γ, x) = cz(x) + d and cocycle law j(γδ, x) = j(γ, δx)j(δ, x).

## Sources and their versions

- **FAR10**: Laurent Fargues, *La filtration de Harder–Narasimhan des schémas en groupes finis et plats*. J. reine angew. Math. 645 (2010), 1–39; author copy HNgp.pdf (29 pp.), whose page numbers differ from Crelle's. Read: §§1–4 (codifferent, δ_G, degree, slopes, Harder–Narasimhan filtration); §6 (monogenic groups); §9 (Hodge–Tate triples, Théorèmes 6–7). <https://webusers.imj-prg.fr/~laurent.fargues/HNgp.pdf> (SHA-256 `67b58427c00ea67b…`, read 2026-10-07).
- **FAR11**: Laurent Fargues, *La filtration canonique des points de torsion des groupes p-divisibles (avec la collaboration de Yichao Tian)*. Ann. Sci. ÉNS 44 (2011), 905–961; author copy canoniqueHN.pdf dated 20 October 2011 (46 pp.). Read: §2 (α_G, Hasse invariant, Proposition 2); §5 (Théorèmes 1–3); §§6–7 (Théorèmes 4–6, Propositions 7–15); §§8–9 (families, Théorèmes 7–8). <https://webusers.imj-prg.fr/~laurent.fargues/canoniqueHN.pdf> (SHA-256 `2424f3b23fa138b4…`, read 2026-10-07).
- **SCH15**: Peter Scholze, *On torsion in the cohomology of locally symmetric varieties*. arXiv:1306.2070v2 (2 June 2015); published Ann. of Math. 182 (2015), 945–1066 (numbering III.x.y = 3.x.y). Read: §III.1 (Lemma 3.1.3); §III.2 (Theorem 3.2.1 – Lemma 3.2.26); §III.3 (Proposition 3.3.1 – Theorem 3.3.18). <https://arxiv.org/abs/1306.2070> (SHA-256 `e15abf4e7ab3e400…`, read 2026-10-07).
- **BHW**: Christopher Birkbeck, Ben Heuer, Chris Williams, *Overconvergent Hilbert modular forms via perfectoid modular varieties*. arXiv:1902.03985v4 (10 May 2021); published Ann. Inst. Fourier 73 (2023), 1709–1794 (not collated). Read: §§2–4 (elliptic case); §5 (Hilbert set-up, Hasse neighbourhoods, Theorem 5.11, Propositions 5.18–5.19); §§6–7 (weights, ω^int, AIP torsor, Theorem 7.14). <https://arxiv.org/abs/1902.03985> (SHA-256 `8ee48970dc500f60…`, read 2026-10-07).
- **PIL20**: Vincent Pilloni, *Higher coherent cohomology and p-adic modular forms of singular weights*. Duke Math. J. 169 (2020), 1647–1807; author copy complexhidatheorygsp4.pdf (113 pp.). Read: §6 (Hasse invariants, LF, Lemma 6.3.4.1); §§7, 9 (degrees of subgroups, Hodge–Tate isomorphism); §12 (ω^mod, ω^{mod,+}, 𝔛(p^n)^{⋆−mod}); §14 (Fargues degree, δ_H, inverse different). <https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf> (SHA-256 `4c05724efeab1dbb…`, read 2026-10-07).
- **PS16**: Vincent Pilloni, Benoît Stroh, *Cohomologie cohérente et représentations galoisiennes*. Ann. Math. Québec 40 (2016), 167–202; author copy koko.pdf (31 pp.), numbered differently from the published version. Read: §1 (Propositions 1.2, 1.5, Corollaire 1.7, Théorème 1.9, Lemma 1.12, Proposition 1.13, Théorème 1.22); Appendix A.5 (Corollaire A.10). <https://www.imo.universite-paris-saclay.fr/~pilloni/koko.pdf> (SHA-256 `2c9f90c39f0efacd…`, read 2026-10-07).
- **BP26**: George Boxer, Vincent Pilloni, *Higher Hida theory for Siegel modular forms*. Invent. Math. (2026); author copy higherhidaSiegel.pdf (65 pp.). Read: §4.1 (Iwahori flags, divisors D_i); §4.2 (degrees, Proposition 4.2.8, Corollary 4.2.10, Propositions 4.2.14–4.2.15); §6.1.8. <https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf> (SHA-256 `af70d084612b1b75…`, read 2026-10-07).
- **BCGP21**: George Boxer, Frank Calegari, Toby Gee, Vincent Pilloni, *Abelian surfaces over totally real fields are potentially modular*. arXiv:1812.09269v3 (28 Nov 2021); published Publ. Math. IHÉS 134 (2021) (not collated). Read: §4.3.6; §6.1.4 (Hodge–Tate map at level p^n, ω^mod); §6.2.1 (minimal compactification at level p^n); §6.5.1 (degree, δ_H). <https://arxiv.org/abs/1812.09269> (SHA-256 `7c8d74b0628d8b9c…`, read 2026-10-07).
- **CS17**: Ana Caraiani, Peter Scholze, *On the generic part of the cohomology of compact unitary Shimura varieties*. arXiv:1511.02418v1 (8 Nov 2015); published Ann. of Math. 186 (2017) (not collated). Read: §2.1–2.3 (Theorems 2.1.2–2.1.3, relative Hodge–Tate filtration, Lemmas 2.3.6–2.3.8, Proposition 2.3.9); §4.1–4.2 (Theorem 4.1.4, Propositions 4.2.5–4.2.6, Remark 4.2.8). <https://arxiv.org/abs/1511.02418> (SHA-256 `aa93df3947e57ab7…`, read 2026-10-07).
- **SW13**: Peter Scholze, Jared Weinstein, *Moduli of p-divisible groups*. arXiv:1211.6357v2 (13 Apr 2013); Camb. J. Math. 1 (2013). Read: Introduction; §§4.1–4.3 (Theorem 4.1.4, Proposition 4.3.6); §5 (Theorem 5.1.4, Proposition 5.1.6, Theorem 5.2.1); §7.1 (Proposition 7.1.1). <https://arxiv.org/abs/1211.6357> (SHA-256 `984411ef6c3d735a…`, read 2026-10-07).
- **AIPH**: Fabrizio Andreatta, Adrian Iovita, Vincent Pilloni, *The adic, cuspidal, Hilbert eigenvarieties*. Res. Math. Sci. 3 (2016); author copy Hilbert_adicfinal.pdf dated 16 May 2016 (40 pp.). Read: §3 (Hilbert canonical subgroups, Propositions 3.2–3.3, Igusa covers); §4 (Proposition 4.1, the torsor F_{n,r,I}, Proposition 4.7). <https://www.imo.universite-paris-saclay.fr/~pilloni/Hilbert_adicfinal.pdf> (SHA-256 `34f517fd8d02d778…`, read 2026-10-07).
- **AIP15**: Fabrizio Andreatta, Adrian Iovita, Vincent Pilloni, *p-adic families of Siegel modular cuspforms*. arXiv:1212.3812v1 (16 Dec 2012); published Ann. of Math. 181 (2015), 623–697 (not collated). Read: §3 (Theorem 3.1.1 after Fargues, Propositions 3.1.2, 3.2.1, 3.2.2); Appendix (quotients by canonical and anticanonical subgroups). <https://arxiv.org/abs/1212.3812> (SHA-256 `546120d2dcbf50bc…`, read 2026-10-07).

Bijakowski–Pilloni–Stroh (Annals 183, 2016) is a source of T0 through its use of Fargues's degree; the publisher served only a 6-page stub, so its text was not read and the degree is planned from Fargues 2010 directly. The Fargues–Genestier–Lafforgue book is cited for the integral Hodge–Tate sequence through Fargues 2011, Théorème 2, which restates it; the book itself was not read.

## Pinned library boundary

data/library-coverage.json has no reviewed record for HodgeTateAndCanonicalSubgroups:T0–T5; the unreviewed AUDIT-37 finds every target not built (only Cartier duality, the cotangent space of a Hopf ideal, Kähler differentials, Module.Grassmannian, BDeRhamPlus and the dynamic parabolic exist).

Tau Ceti's TauCeti.Bialgebra.CotangentSpace (ker ε/(ker ε)² over any commutative ring) is ω_H for an affine group scheme, and FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDuality gives H(S) = Hom(H^D, 𝔾_m): together they carry the finite-level Hodge–Tate map. No Fitting-ideal API exists in Mathlib (only LieModule Fitting decompositions).

Baseline declarations cited (statements read at the pins):

- `tauceti:TauCeti.Bialgebra.AugmentationIdeal` (abbrev, `TauCeti/Algebra/AlgebraicGroup/Tangent/Cotangent.lean`): The augmentation ideal ker ε of a commutative bialgebra over a commutative ring.
- `tauceti:TauCeti.Bialgebra.CotangentSpace` (abbrev, `TauCeti/Algebra/AlgebraicGroup/Tangent/Cotangent.lean`): The cotangent space (ker ε)/(ker ε)² at the identity of the affine monoid of a commutative bialgebra over any commutative ring: ω_H for an affine group scheme.
- `tauceti:TauCeti.Bialgebra.cotangentMap` (def, `TauCeti/Algebra/AlgebraicGroup/Tangent/Cotangent.lean`): The R-linear map a ↦ [a − ε(a)] into the cotangent space; on a group-like element g it is the class of g − 1, i.e. dt/t pulled back.
- `tauceti:TauCeti.Bialgebra.cotangentMap_mul` (lemma, `TauCeti/Algebra/AlgebraicGroup/Tangent/Cotangent.lean`): Leibniz rule cotangentMap(ab) = ε(a)·cotangentMap(b) + ε(b)·cotangentMap(a), giving additivity on group-like elements.
- `tauceti:TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat` (abbrev, `TauCeti/AlgebraicGeometry/AffineGroupScheme/CartierDuality/FiniteLocallyFree.lean`): The category of finite locally free (finite, flat, locally of finite presentation) commutative affine group schemes over an affine base.
- `tauceti:FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDuality` (def, `TauCeti/AlgebraicGeometry/AffineGroupScheme/CartierDuality/FiniteLocallyFree.lean`): Cartier duality, an anti-equivalence of finite locally free commutative affine group schemes over any commutative ring (declared in namespace TauCeti; the declaration index lists it without the prefix).
- `tauceti:TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDualBaseChangeIso` (abbrev, `TauCeti/AlgebraicGeometry/AffineGroupScheme/CartierDuality/BaseChange.lean`): Cartier duality commutes with base change R → S.
- `tauceti:TauCeti.Cocharacter.parabolic` (def, `TauCeti/Algebra/AlgebraicGroup/Dynamic/Parabolic.lean`): The dynamic parabolic subgroup P(λ) of a cocharacter of an affine group over a ring (points g with lim_{t→0} λ(t)gλ(t)^{-1} existing).
- `tauceti:TauCeti.Cocharacter.levi` (def, `TauCeti/Algebra/AlgebraicGroup/Dynamic/Parabolic.lean`): The dynamic Levi subgroup Z(λ), the centraliser of the cocharacter.
- `tauceti:TauCeti.Huber.Pair` (structure, `TauCeti/RingTheory/Huber/Pair.lean`): A Huber pair (A, A⁺): a ring of integral elements of a Huber ring.
- `mathlib:Ideal.Cotangent` (def, `Mathlib/RingTheory/Ideal/Cotangent.lean`): I/I² as a module, the carrier of TauCeti.Bialgebra.CotangentSpace.
- `mathlib:KaehlerDifferential` (def, `Mathlib/RingTheory/Kaehler/Basic.lean`): Kähler differentials Ω_{S/R} of a ring map.
- `mathlib:IsGroupLikeElem` (structure, `Mathlib/RingTheory/Coalgebra/GroupLike.lean`): Group-like elements of a coalgebra: ε(a) = 1 and Δ(a) = a ⊗ a; these are the characters of the Cartier dual.
- `mathlib:Module.Grassmannian` (structure, `Mathlib/RingTheory/Grassmannian.lean`): Submodules of M with locally free quotient of rank k (rank-k quotients), with base change: the ambient space of the Hodge–Tate flag point.
- `mathlib:Module.Invertible` (class, `Mathlib/RingTheory/PicardGroup.lean`): Invertible modules (line bundles over a ring).
- `mathlib:Module.length` (def, `Mathlib/RingTheory/Length.lean`): The length of a module; used only to state that the Fargues degree is not the length.
- `mathlib:LinearMap.det` (irreducible_def, `Mathlib/LinearAlgebra/Determinant.lean`): Determinant of an endomorphism of a free module.
- `mathlib:Valuation` (structure, `Mathlib/RingTheory/Valuation/Basic.lean`): Valuations with values in a linearly ordered group with zero.
- `mathlib:ValuationSubring` (structure, `Mathlib/RingTheory/Valuation/ValuationSubring.lean`): Valuation subrings of a field.
- `mathlib:PadicInt` (def, `Mathlib/NumberTheory/Padics/PadicIntegers.lean`): The p-adic integers ℤ_p.
- `mathlib:PadicComplex` (abbrev, `Mathlib/NumberTheory/Padics/Complex.lean`): ℂ_p, the completion of an algebraic closure of ℚ_p.
- `mathlib:IsAdicComplete` (class, `Mathlib/RingTheory/AdicCompletion/Basic.lean`): I-adic completeness (Hausdorff and precomplete).
- `mathlib:AlgebraicGeometry.Scheme` (structure, `Mathlib/AlgebraicGeometry/Scheme.lean`): Schemes.
- `mathlib:AlgebraicGeometry.Scheme.Hom.normalization` (def, `Mathlib/AlgebraicGeometry/Normalization.lean`): The relative normalisation of a morphism of schemes.

## Requests to other roadmaps

- **FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2**: For a BT₁ G over an arbitrary 𝔽_p-scheme S (not only over a field): relative Frobenius and Verschiebung of commutative finite locally free group schemes; the Hasse invariant Ha(G) = det V* ∈ H⁰(S, (det ω_G)^{⊗(p−1)}); Fargues's isomorphism LF: (det ω_G)^{⊗(p−1)} ≅ (det ω_{G^D})^{⊗(p−1)} with LF(Ha(G)) = Ha(G^D); quasi-polarisations and LF ∘ λ* = id; and the BT₁ Hodge–Tate sequence 0 → ker F → G → ω_{G^D} → ω_{G^D}^{(p)} → 0 (Fargues 2011 §2.1.2, Pilloni 2020 §6.3). Ownership per RT-AREA-padic-1/26. Needed by: `T0/semi-abelian-hasse-invariant`, `T0/hasse-invariant-ordinary-locus`, `T3/hasse-neighbourhood`.
- **AbelianSchemesAndArithmeticModuli:A2**: Abelian schemes over a general base with their dual abelian scheme, Frobenius and Verschiebung isogenies (V the dual of Frobenius of the dual), and polarisations. Needed by: `T0/semi-abelian-hasse-invariant`, `T5/igusa-torsor`.
- **AbelianSchemesAndArithmeticModuli:A3**: The Weil pairing e_n: A[p^n] × A^∨[p^n] → μ_{p^n} identifying A[p^n]^D with A^∨[p^n], with its sign convention and compatibility with polarisations; p-power torsion of abelian schemes as p-divisible groups. Needed by: `T0/hodge-tate-map-compatibilities`, `T2/abelian-hodge-tate-sequence`, `T3/canonical-subgroup-properties`.
- **AbelianSchemesAndArithmeticModuli:A4**: H¹_dR(A/S) of an abelian scheme with its Hodge filtration 0 → ω_A → H¹_dR → Lie(A^∨) → 0 and Gauss–Manin connection, and the Hodge filtration triangle for an isogeny used in Fargues's δ_G + δ_{G^D} = div|G|. Needed by: `T0/fargues-degree-properties`, `T1/abelian-relative-comparison`, `T2/abelian-hodge-tate-sequence`.
- **PadicHodgeTheory:P8**: The relative de Rham comparison of Scholze (2013, Theorem 8.8) for a proper smooth morphism of smooth adic spaces over a p-adic field: R^if_*ℤ_p ⊗ OB_dR ≅ R^if_*Ω^•_{X/Y} ⊗ OB_dR compatibly with filtrations and connections, functorial and multiplicative. Needed by: `T1/abelian-relative-comparison`.
- **ShimuraCompactifications:C5**: For the normalised toroidal model 𝔛_{K(p^n)} at full level p^n and its Stein factorisation over the minimal compactification: a Koecher principle for sections of ω/p^n over the boundary (Hilbert–Siegel data, F ≠ ℚ; BCGP cite Lan 2017, Theorem 8.7) and f_*O/p^k = f_*(O/p^k) for f: 𝔛_{K(p^n)} → 𝔛^*_{K(p^n)} (Pilloni–Stroh Corollaire A.10 for GSp₄/F). Needed by: `T0/hodge-tate-boundary-extension`, `T5/modified-minimal-model`.
- **HilbertModularVarietiesAndShimuraCurves:H2**: The total Hasse invariant of Hilbert–Blumenthal abelian schemes over the Deligne–Pappas (or Rapoport) integral models at arbitrary p, its lift and the formal Hasse neighbourhoods 𝔛(ε) = {|H̃a| ≥ |p|^ε} with their formal models. Needed by: `T3/hasse-neighbourhood`, `T3/hilbert-canonical-subgroup`.
- **HilbertModularVarietiesAndShimuraCurves:H4**: Γ₀(p^n)- and Γ(p^n)-level structures on Hilbert–Blumenthal abelian schemes in BHW's convention (𝒪_F-submodule schemes of A^∨[p^n] étale-locally 𝒪_F/p^n), as finite étale covers of the generic fibre. Needed by: `T4/canonical-anticanonical-loci`.
- **PerfectoidSpaces:P9**: For a pro-étale profinite-group torsor Y → X of diamonds or adic spaces (the anticanonical tower over Γ₀(p^n)-level), (O⁺_Y)^{Γ} = O⁺_X, and continuous torsor descent of the sheaves of κ-equivariant functions (Kedlaya–Liu, Theorem 8.2.3, as used by BHW Lemma 3.7). Needed by: `T5/aip-torsor`, `T5/aip-hodge-tate-comparison`.

## Ownership and proposed restructuring

- Owner of *Hodge-type π_HT on the tower: equivariance, Levi-torsor/automorphic-bundle pullback, elliptic π_HT*𝒪(1)=ω and Hilbert Res_{O_F/Z}P¹ identification*: PerfectoidShimuraVarieties:S3 (formerly HodgeTateAndCanonicalSubgroups:T2).
- Owner of *Hasse invariant Ha(G) = det V* of a BT₁ over any 𝔽_p-scheme, Fargues's isomorphism LF and the BT₁ Hodge–Tate exact sequence*: FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2 (formerly HodgeTateAndCanonicalSubgroups:T0).

- **rescope** (HodgeTateAndCanonicalSubgroups, PerfectoidShimuraVarieties). RT-AREA-padic-1/22 (confirmed): the Hodge-type π_HT on the tower and its properties were planned in T2 and in PerfectoidShimuraVarieties S3. *Proposal:* Owners entry above (owner S3). T2 is narrowed to the finite-level Hodge–Tate exact sequences (p-divisible, abelian, relative), the pointwise flag point with the Lagrangian charts, the PEL and Hodge-tensor flag conditions, the Hodge–Tate parabolic reduction with its Levi torsor and its comparison with the de Rham torsor. S3 imports T2/hodge-tate-flag-point, T2/hodge-tate-parabolic-reduction and T2/de-rham-hodge-tate-levi-comparison.
- **rescope** (HodgeTateAndCanonicalSubgroups, FiniteFlatGroupsAndIntegralPadicHodgeTheory, HilbertModularVarietiesAndShimuraCurves, AlgebraicModularFormsAndSerreWeights, ShimuraCompactifications). RT-AREA-padic-1/26 (confirmed): the Hasse invariant of a BT₁, LF and the BT₁ Hodge–Tate sequence were routed to T0, which is upstream of none of H2, C6, R15.3, IG.2. *Proposal:* Owners entry above (owner R07.2, which must extend Frobenius/Verschiebung from fields to arbitrary 𝔽_p-schemes; see requests). T0 keeps T0/semi-abelian-hasse-invariant (boundary extension, compatibility with R07.2, split-torus unit) and the Siegel minimal-compactification statements. Add stage edges R07.2 → H2, R07.2 → C6, R07.2 → AlgebraicModularFormsAndSerreWeights:R15.3, R07.2 → IgusaVarietiesAndTorsionConcentration:IG.2.
- **rescope** (HodgeTateAndCanonicalSubgroups, FiniteFlatGroupsAndIntegralPadicHodgeTheory, VectorBundlesAndIsocrystals, IgusaVarietiesAndTorsionConcentration, EndoscopicTransferAndUnitaryTraceComparison). RT-AREA-padic-1/25 (confirmed): Caraiani–Scholze items 52, 53, 143 (Scholze–Weinstein Theorem 4.1.4 over O_C/p, Theorem B/5.2.1 over O_C, the modification at ∞) were routed to T2, downstream of the whole global Shimura construction; no T2 target needs them. *Proposal:* Create a FiniteFlatGroupsAndIntegralPadicHodgeTheory stage after R07.2, 'p-divisible groups over O_C and vector bundles on the Fargues–Fontaine curve', importing VectorBundlesAndIsocrystals VB1, VB2:ampleness and VB2:classification and T2/p-divisible-hodge-tate-sequence's input T0/p-divisible-hodge-tate-map, owning the three items; add edges from it to T2 (as a source of examples only), IG.3 and ET.6a. This packet plans none of the three items.
- **rescope** (HodgeTateAndCanonicalSubgroups, TorsionCohomologyInfrastructure, HigherHidaAndColemanTheory). RT-AREA-padic-1/23 (confirmed): BCGP-25 items 4.4.1-usual/-cusp/-analytic-usual/-analytic-cusp were routed to T4, T5, T6, which plan none of them. *Proposal:* Remove them from route 23; route 4.4.1-usual/-cusp to TorsionCohomologyInfrastructure TC.2 and the analytic ones to HigherHidaAndColemanTheory (BCGP-25 route 22). This packet plans none of them.
- **rescope** (HodgeTateAndCanonicalSubgroups). Stage dependency lines do not list what the plan uses: T0 uses ShimuraCompactifications C5 (toroidal/minimal models, Koecher) and NeronModelsAndSemistableAbelianVarieties R11.3; T2 uses ShimuraData D3 (compact dual) and PELModuli M0; T3 uses T0's Hasse invariant for Siegel data; T4 uses PELModuli M1 and T2's flag point; T5 uses PerfectoidShimuraVarieties S0 (the infinite-level tower) and PerfectoidSpaces P9. T1's dependency text cites 'ClassicalAdicEtaleCohomology C0', which does not exist (RT-AREA-padic-1/32). *Proposal:* Add the stage edges C5 → T0, R11.3 → T0 (already from RS-32), D3 → T2, PELModuli:M0 → T2, T0 → T3, PELModuli:M1 → T4, T2 → T4, PerfectoidShimuraVarieties:S0 → T5, P9 → T5 (already from RS-05); correct T1's dependency text to ClassicalAdicEtaleCohomology H0. None of these creates a cycle (checked against the recorded stage edges).
- **split** (HodgeTateAndCanonicalSubgroups). T0 contains two coherent groups: finite-level Hodge–Tate theory and Fargues's degree of finite flat group schemes over a valuation ring (local, no Shimura varieties), and the semi-abelian/boundary extension (Hasse invariant of semi-abelian schemes, minimal compactification, toroidal extension of HT), which needs ShimuraCompactifications C4/C5. *Proposal:* Sub-layers of T0: 'T0:local' (conormal-module, finite-hodge-tate-map, hodge-tate-map-compatibilities, p-divisible-hodge-tate-map, fargues-hodge-tate-cokernel, fargues-degree, fargues-degree-properties, fargues-degree-generic-isomorphism, fargues-divisor, multiplicative-hodge-tate-isomorphism, normalized-multiplicative-pullback) and 'T0:boundary' (isogeny-divisor, semi-abelian-torsion, semi-abelian-hasse-invariant, hasse-invariant-ordinary-locus, hasse-invariant-minimal-compactification, hodge-tate-boundary-extension, raynaud-hodge-tate-filtration). T0:local has no dependency on C4/C5; IG.2, H2 and FaltingsFinitenessAndIsogenyTheorems could then import it without the boundary theory.

### Routed sources

- *Bijakowski–Pilloni–Stroh 2016, item 10 (Fargues's degree)*: Planned as T0/fargues-degree and T0/fargues-degree-properties from Fargues 2010 directly; the Annals PDF served by the publisher was a 6-page stub, so BPS's own text was not read; its use is the degree of Fargues 2010, which is read.
- *Boxer–Pilloni 2026, items fargues-degree-divisor, fargues-degree-comparison-generic-isomorphism, fargues-degree-of-truncated-BT-and-extreme-values*: T0/fargues-divisor, T0/fargues-degree-generic-isomorphism, T0/fargues-degree-properties. In the author copy read, the divisor of an isogeny via det Lie(f) is not in Boxer–Pilloni; it is planned from Pilloni 2020 §14 and BCGP §6.5.1 (T0/isogeny-divisor). The Siegel identity D_i + D_{2g+1−i} = V(p^n) stays with HigherHidaAndColemanTheory.
- *Pilloni 2020 route 8*: Ha(G), LF, quasi-polarisations, LF∘λ* and the BT₁ Hodge–Tate sequence: requested from R07.2 (RT-AREA-padic-1/26). Degree items: T0 degree nodes; Hodge–Tate isomorphism for multiplicative H_n: T0/multiplicative-hodge-tate-isomorphism; Lemma 6.3.4.1: T0/normalized-multiplicative-pullback; HT over the toroidal boundary: T0/hodge-tate-boundary-extension; deg L⁰ = 1/(p+1): acceptance of T0/fargues-degree (computed from Fargues 2010 §6); ω^mod, ω^{mod,+}, 𝔛(p^n)^{⋆−mod}: T5/modified-hodge-bundle, T5/modified-plus-sheaf, T5/modified-minimal-model; the inverse different (§14.9): T0/fargues-degree (δ_G and the codifferent).
- *BCGP 2021 route 13 (items 144, 251, 253)*: 144: T0/fargues-degree and T0/isogeny-divisor (with the corrected degree Σ v(x_i), sourceIssues); 251: T0/hodge-tate-boundary-extension and T5/modified-hodge-bundle; 253: T5/modified-minimal-model.
- *Scholze 2015 route 2*: Items 28, 29: T3/subgroup-lifting, T3/section-rigidity; 30, 57: T0/semi-abelian-hasse-invariant, T0/hasse-invariant-ordinary-locus, T0/hasse-invariant-minimal-compactification; 31–35: T3/canonical-subgroup, T3/canonical-subgroup-theorem, T3/canonical-subgroup-properties, T3/quotient-hasse-radius; 39–41: canonical Frobenius lifts and the anticanonical open immersions are PerfectoidShimuraVarieties S1's nodes (T4/canonical-anticanonical-loci and T4/atkin-lehner-anticanonical give the general loci and radius bookkeeping they use); 56: T0/raynaud-hodge-tate-filtration; 59: T2/hodge-tate-flag-point (on points); 61: PerfectoidShimuraVarieties S1/rational-flags-preimage.
- *Caraiani–Scholze 2017 route 6 (items 52, 53, 143)*: Not planned here: restructure entry for RT-AREA-padic-1/25.
- *BCGP 2025 route 23 (4.4.1 items)*: Not planned here: restructure entry for RT-AREA-padic-1/23.
- *Consumer requests (PerfectoidShimuraVarieties, OverconvergentAutomorphicForms O0/O8, ShimuraCompactifications C6)*: PSV→T0: T0/semi-abelian-hasse-invariant, hasse-invariant-ordinary-locus, hasse-invariant-minimal-compactification, raynaud-hodge-tate-filtration, fargues-hodge-tate-cokernel. PSV→T2: T2/hodge-tate-flag-point (Plücker coordinates, Lagrangian charts), T2/abelian-hodge-tate-sequence (Lagrangian, defined over K), T2/relative-hodge-tate-sequence. PSV→T3: T3/canonical-subgroup, -theorem, -properties, quotient-hasse-radius, section-rigidity. PSV→T4: T4/canonical-anticanonical-loci, atkin-lehner-anticanonical, period-map-inclusions, ramified-period-comparison (the ramified case requested there). PSV→T5: T5/modified-hodge-bundle, modified-minimal-model, igusa-full-level-comparison. O0→T4: T4/hodge-tate-coordinate (left action, cocycle), period-map-inclusions (c_p), atkin-lehner-anticanonical; the partial-Hasse improvements under U_𝔭 are O6's Hecke statements and are not planned here. O0→T5: T5/integral-differential-lattice, integral-lattice-properties, igusa-torsor, aip-torsor, aip-hodge-tate-comparison. O8→T3 (Siegel p > 2g domain comparison of DRW §3.6): not planned in this pass (coverage remaining). C6→T0: T0/semi-abelian-hasse-invariant (split-torus unit, chart compatibility).

<a id="t0"></a>

## T0. p-divisible groups and integral differentials: `HodgeTateAndCanonicalSubgroups:T0`

T0 builds the integral differential calculus from which T1–T5 read their Hodge–Tate data. Its local half needs only finite flat group schemes over a ring: the conormal module, the finite-level Hodge–Tate map through Cartier duality and dt/t, its compatibilities, its p-divisible and completed forms, Fargues's bound on its cokernel, and Fargues's degree theory (degree, additivity, duality, generic isomorphisms, the Harder–Narasimhan filtration, the divisor D_H and the different). Its boundary half extends the calculus to semi-abelian schemes on degeneration charts: the divisor of an isogeny via det Lie(f), the p-power torsion of a semi-abelian scheme (whose height drops at the boundary), the semi-abelian Hasse invariant with its ordinary locus and its extension to toroidal and minimal compactifications, the extension of the level-p^n Hodge–Tate map over the toroidal boundary, and Scholze's description of the Hodge–Tate filtration through the Raynaud extension.

*Dependencies: FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1 (p-divisible groups, Cartier duality, Tate modules) and R07.2 (Frobenius, Verschiebung, Ha of BT₁ groups, LF; requested); AbelianSchemesAndArithmeticModuli A2–A4 (requested); ShimuraCompactifications C4 (semi-abelian schemes, degeneration data) and C5 (toroidal and minimal compactifications, normalised level-p^n models, Koecher); NeronModelsAndSemistableAbelianVarieties R11.3 (Raynaud extensions); AdicSpacesPartII R2 (formal models).*

Coverage: **planned**. Refinements left: Refine the semi-abelian Hasse invariant's chart-overlap compatibility into lemma nodes once C4's degeneration data are planned at lemma level. Tate's full-faithfulness theorem (RT-PAPER-LI-ZHANG-22-B/11) would sit after T0/p-divisible-hodge-tate-map if routed here; it is not a T0 target and is not planned.

### The conormal module ω_H of a finite locally free group scheme

`T0/conormal-module` (definition)

Let S be a scheme and H a finite locally free commutative group scheme over S with unit section e. Its conormal module (co-Lie module) is ω_H := e*Ω¹_{H/S}, the conormal sheaf of the unit section; over an affine base S = Spec R with H = Spec A, A a commutative and cocommutative finite locally free Hopf R-algebra with counit ε, it is the R-module I/I² with I = ker ε, and every global invariant differential of H/S is the pullback of a unique element of ω_H. ω_H is a finitely presented O_S-module, contravariant in H (a homomorphism f: H → H′ induces f*: ω_{H′} → ω_H), compatible with base change S′ → S (ω_{H_{S′}} = ω_H ⊗ O_{S′}) and right exact on short exact sequences 0 → H′ → H → H″ → 0 (ω_{H″} → ω_H → ω_{H′} → 0 exact). For a p-divisible group G = (G_v) over a p-adically complete ring R, ω_G := lim_v ω_{G_v}, with ω_{G_v} = ω_G/p^v ω_G; ω_G is locally free of rank dim G when R is local with residue characteristic p, and ω_{G[p^n]} is locally free of rank dim G over R/p^n.

*Hypotheses and conventions.* H finite locally free (finite, flat, finitely presented) and commutative over S; the definition does not use p or a valuation. The p-divisible statements need R p-adically complete so that ω_G is defined as an inverse limit; local freeness of rank dim G needs the dimension of R07.1/p-divisible-dimension.

*Proof outline.*
1. Over S = Spec R, identify e*Ω¹_{H/S} with I/I² (I = ker ε) through the conormal sequence of the section e, and take the augmentation cotangent space of Tau Ceti (TauCeti.Bialgebra.CotangentSpace) for the Hopf algebra of H.
2. Contravariance, base change and right exactness follow from the corresponding properties of I/I² for Hopf algebra maps; base change uses that I is a direct summand of A as an R-module (A = R ⊕ I through ε).
3. For a truncated Barsotti–Tate group of level n, ω is locally free over O_S/p^n (Fargues 2010, Exemple 2 and the computation of deg for BT_n); pass to the limit for p-divisible groups.

*Prerequisites.* other roadmaps: `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-divisible-group`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-divisible-dimension`; libraries: `tauceti:TauCeti.Bialgebra.CotangentSpace`, `tauceti:TauCeti.Bialgebra.cotangentMap`, `tauceti:TauCeti.Bialgebra.AugmentationIdeal`, `tauceti:TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat`, `mathlib:Ideal.Cotangent`, `mathlib:KaehlerDifferential`.

*Uses.* Fargues 2010, §2, Définition 3: δ_G = Fitt₀ ω_G defines the degree. Scholze–Weinstein 2013 and Fargues 2010, Définition 17: target of the Hodge–Tate map α_G: G(O_C̄) → ω_{G^D}. HodgeTateAndCanonicalSubgroups:T5 (ω^int, ω^mod): the modified lattices are sub-O⁺-modules of ω_A = ω_{A[p^∞]} generated by Hodge–Tate images.

*API.*

- `TauCeti.HodgeTate.conormal` (constructor): ω_H := e*Ω¹_{H/S}, over Spec R the augmentation cotangent space I/I² of the Hopf algebra of H.
- `TauCeti.HodgeTate.conormal_eq_cotangentSpace` (compatibility): Over Spec R, ω_H is TauCeti.Bialgebra.CotangentSpace R A for H = Spec A (definitional for the affine carrier).
- `TauCeti.HodgeTate.conormal_map` (functoriality): A homomorphism f: H → H′ induces f*: ω_{H′} → ω_H, with (id)* = id and (g∘f)* = f*∘g*.
- `TauCeti.HodgeTate.conormal_baseChange` (functoriality): For R → R′, ω_{H_{R′}} ≅ R′ ⊗_R ω_H, naturally in H and compatibly with composition of base changes.
- `TauCeti.HodgeTate.conormal_rightExact` (relation): For 0 → H′ → H → H″ → 0 exact (fppf), ω_{H″} → ω_H → ω_{H′} → 0 is exact.
- `TauCeti.HodgeTate.conormal_finitePresentation` (instance): ω_H is a finitely presented R-module, killed by the order |H| when |H| is a non-zero-divisor.
- `TauCeti.HodgeTate.conormal_eq_zero_iff_etale` (characterisation): ω_H = 0 if and only if H is étale over S.
- `TauCeti.HodgeTate.pDivisibleConormal` (constructor): For a p-divisible group G over a p-adically complete R, ω_G := lim ω_{G[p^v]}, with ω_G/p^v ≅ ω_{G[p^v]}; locally free of rank dim G when R is local of residue characteristic p.

*Unit tests.*

- `TauCeti.HodgeTate.conormal_constant_eq_zero` (degenerate): For the constant group (ℤ/p^n)_R over any ring R, ω = 0.
- `TauCeti.HodgeTate.conormal_mu` (computation): For μ_{p^n} = Spec R[t]/(t^{p^n} − 1), ω ≅ R/p^n R, generated by the class of t − 1.
- `TauCeti.HodgeTate.conormal_alphaP` (non-example): For α_p = Spec 𝔽_p[t]/(t^p) over 𝔽_p, ω is one-dimensional although α_p has order p and is not étale; ω_{α_p} ≠ 0 = ω_{ℤ/p}, so the order of H does not determine ω.
- `TauCeti.HodgeTate.conormal_eq_cotangentSpace_test` (compatibility): For the Hopf algebra A of H over R, the R-module ω_H equals (ker ε)/(ker ε)², i.e. TauCeti.Bialgebra.CotangentSpace R A.

*Acceptance.* ω_{ℤ/p^n} = 0 over any base (étale group). ω_{μ_{p^n}} over ℤ_p is ℤ_p/p^n, generated by the class of t − 1 (= dt/t). ω_{α_p} over 𝔽_p is one-dimensional, so ω does not detect the order of H alone.

*Sources.* FAR10, §2, before Définition 3, PDF p. 7.

### The finite-level Hodge–Tate map

`T0/finite-hodge-tate-map` (construction) — planet: *Hodge–Tate map*

Let H be a finite locally free commutative group scheme over a scheme S, with Cartier dual H^D = Hom(H, 𝔾_m). A point x ∈ H(S) is, by Cartier duality, a homomorphism x: H^D_S → 𝔾_{m,S}; the Hodge–Tate map α_H: H(S) → ω_{H^D} sends x to x*(dt/t), the pullback of the invariant differential dt/t of 𝔾_m. Over S = Spec R, x corresponds to a group-like element g_x of the Hopf algebra of H^D and α_H(x) is the class of g_x − 1 in I/I². α_H is a homomorphism of groups, natural in H and compatible with base change; its R-linearisation is α_H ⊗ 1: H(R) ⊗_ℤ R → ω_{H^D}. When H(S) is replaced by H(S′) for an S-scheme S′ (for S = Spec O_K, S′ = Spec O_K̄), the same formula gives α_H: H(O_K̄) → ω_{H^D} ⊗ O_K̄.

*Hypotheses and conventions.* H finite locally free and commutative over S. Convention (pinned): α_H goes from points of H to the conormal module of the dual H^D. For an abelian scheme A, applied to H = A^∨[p^n] (whose Cartier dual is A[p^n] by the Weil pairing) it gives A^∨[p^n] → ω_A/p^n, the finite level of the map T_pA^∨ ⊗ C → ω_A displayed in the roadmap.

*Proof outline.*
1. Identify H(S) with Hom(H^D, 𝔾_m) by Cartier duality (Tau Ceti FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDuality) and, over Spec R, with the group-like units of the Hopf algebra of H^D.
2. Additivity: (gh − 1) = (g − 1) + (h − 1) + (g − 1)(h − 1) and the last term lies in I², so x ↦ [g_x − 1] is additive (the Leibniz rule TauCeti.Bialgebra.cotangentMap_mul).
3. Naturality and base change follow from those of Cartier duality (cartierDualBaseChangeIso) and of ω (T0/conormal-module).

*Prerequisites.* this roadmap: `T0/conormal-module`; other roadmaps: `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-divisible-cartier-dual`; libraries: `tauceti:FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDuality`, `tauceti:TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDualBaseChangeIso`, `tauceti:TauCeti.Bialgebra.cotangentMap_mul`, `mathlib:IsGroupLikeElem`.

*Uses.* Fargues 2010, Théorème 7: its cokernel after ⊗ O_K̄ is bounded by p^{1/(p−1)}. Fargues 2011 and AIP 2015: the canonical subgroup is characterised through α of the dual. HodgeTateAndCanonicalSubgroups:T2: the Hodge–Tate exact sequence is built from α. HodgeTateAndCanonicalSubgroups:T5: ω^int and ω^mod are generated by the image of α at level p^n.

*API.*

- `TauCeti.HodgeTate.hodgeTateMap` (constructor): α_H: H(S) → ω_{H^D}, x ↦ x*(dt/t), through Cartier duality.
- `TauCeti.HodgeTate.hodgeTateMap_add` (simp): α_H(x + y) = α_H(x) + α_H(y) and α_H(0) = 0.
- `TauCeti.HodgeTate.hodgeTateMap_apply_groupLike` (characterisation): Over Spec R, α_H(x) is the class of g_x − 1 in I/I², g_x the group-like element of the Hopf algebra of H^D attached to x.
- `TauCeti.HodgeTate.hodgeTateMap_natural` (functoriality): For f: H → H′ with Cartier dual f^D: H′^D → H^D, α_{H′}(f(x)) = (f^D)*(α_H(x)) in ω_{H′^D}, where (f^D)*: ω_{H^D} → ω_{H′^D}.
- `TauCeti.HodgeTate.hodgeTateMap_baseChange` (functoriality): For R → R′, α_{H_{R′}} restricted to H(R) is α_H followed by ω_{H^D} → R′ ⊗ ω_{H^D}.
- `TauCeti.HodgeTate.hodgeTateLinear` (constructor): The linearisation α_H ⊗ 1: H(R′) ⊗_ℤ R′ → R′ ⊗_R ω_{H^D} for an R-algebra R′.

*Unit tests.*

- `TauCeti.HodgeTate.hodgeTateMap_constant` (computation): For H = (ℤ/p^n)_R, α_H(1) is the class of t − 1 in ω_{μ_{p^n}} = R/p^n, a generator.
- `TauCeti.HodgeTate.hodgeTateMap_mu_eq_zero` (degenerate): For H = μ_{p^n,R}, α_H = 0 because ω_{H^D} = ω_{ℤ/p^n} = 0.
- `TauCeti.HodgeTate.hodgeTateMap_depends_on_model` (non-example): Over R = ℤ_p[ζ_p] the groups ℤ/p and μ_p have isomorphic generic fibres, yet α_{ℤ/p}(1) generates ω_{μ_p} ≅ R/p while α_{μ_p} = 0: the Hodge–Tate map depends on the integral model, not only on the generic fibre.
- `TauCeti.HodgeTate.hodgeTateMap_cotangentMap` (compatibility): Over Spec R, α_H(x) = TauCeti.Bialgebra.cotangentMap R A(g_x) for A the Hopf algebra of H^D.

*Acceptance.* α_{μ_{p^n}}: μ_{p^n}(R) → ω_{ℤ/p^n} = 0 is zero, and α_{ℤ/p^n}: ℤ/p^n → ω_{μ_{p^n}} = R/p^n sends 1 to dt/t. α_H is additive and natural in H.

*Sources.* FAR10, §9.2, Définition 17, PDF p. 25; SW13, §5.1, Proposition 5.1.6 and its proof (arXiv:1211.6357v2), PDF p. 50; AIP15, §3.2, the Hodge–Tate map (arXiv:1212.3812), PDF p. 12.

### Functoriality, endomorphisms and polarisations of the Hodge–Tate map

`T0/hodge-tate-map-compatibilities` (theorem)

Let S be a scheme. (1) For a homomorphism f: H → H′ of finite locally free commutative S-group schemes, α_{H′} ∘ f = (f^D)* ∘ α_H as maps H(S) → ω_{H′^D}. (2) If a ring 𝒪 acts on H by endomorphisms, α_H is 𝒪-equivariant for the induced action on ω_{H^D} through the dual action a ↦ (a^D)*. (3) For an abelian scheme A/S with polarisation λ: A → A^∨ and n ≥ 1, write e_n: A[p^n] × A^∨[p^n] → μ_{p^n} for the Weil pairing; then, identifying A[p^n]^D = A^∨[p^n] by e_n, the maps α_{A[p^n]}: A[p^n](S) → ω_{A^∨}/p^n and α_{A^∨[p^n]}: A^∨[p^n](S) → ω_A/p^n satisfy α_{A^∨[p^n]}(λx) = λ*(α_{A[p^n]}(x)) for x ∈ A[p^n](S), where λ*: ω_{A^∨} → ω_A; so λ exchanges the Hodge–Tate maps of A and A^∨. (4) The same holds for p-divisible groups with a quasi-polarisation λ: G → G^D (R07.1/p-divisible-cartier-dual).

*Hypotheses and conventions.* (3) uses the sign convention of the Weil pairing fixed in AbelianSchemesAndArithmeticModuli A3; with the opposite convention α is exchanged up to −1.

*Proof outline.*
1. (1) and (2) are the naturality of T0/finite-hodge-tate-map applied to f and to the endomorphisms.
2. (3) The polarisation identifies A[p^n] → A^∨[p^n] compatibly with Cartier duality and the Weil pairing (A3); apply (1) to λ and use (λ^∨)|_{A[p^n]} = λ up to the symmetry of λ.
3. (4) is (1) for the levels of λ.

*Prerequisites.* this roadmap: `T0/finite-hodge-tate-map`; other roadmaps: `AbelianSchemesAndArithmeticModuli:A3`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-divisible-cartier-dual`.

*Acceptance.* For E an elliptic curve with its principal polarisation, α_{E[p^n]} and α_{E^∨[p^n]} coincide under E ≅ E^∨. For 𝒪_F acting on a Hilbert–Blumenthal abelian scheme, α is 𝒪_F-linear, so its image is an 𝒪_F ⊗ R-submodule of ω.

*Sources.* FAR10, §9.2, Définition 17, PDF p. 25.

### The Hodge–Tate map of a p-divisible group and its completed linearisation

`T0/p-divisible-hodge-tate-map` (construction) — planet: *Hodge–Tate map of a p-divisible group*

Let R be a p-adically complete ring and G a p-divisible group over R with Cartier dual G^D (R07.1). Define T_pG(R) := lim_n G[p^n](R) and α_G: T_pG(R) → ω_{G^D} as the inverse limit of the maps α_{G[p^n]}: G[p^n](R) → ω_{G[p^n]^D} = ω_{G^D}/p^n (T0/finite-hodge-tate-map, T0/conormal-module). For R = O_C with C a complete algebraically closed extension of ℚ_p, T_pG := T_pG(O_C) is free of rank ht G over ℤ_p, and the completed linearisation is α_G ⊗ 1: T_pG ⊗_{ℤ_p} O_C → ω_{G^D}; its C-linearisation T_pG ⊗ C → ω_{G^D} ⊗ C is the rational Hodge–Tate map. Reduction modulo p^n recovers α_{G[p^n]} ⊗ 1, and for G over O_K (K/ℚ_p complete discretely valued) the map is Gal(K̄/K)-equivariant on T_pG ⊗ O_C → ω_{G^D} ⊗ O_C.

*Hypotheses and conventions.* R p-adically complete; for the rank statement R = O_C (or a henselian local domain with fraction field of characteristic 0 as in R07.1/p-divisible-tate-module). Convention: for an abelian scheme A over O_C, applied to G = A^∨[p^∞] (G^D = A[p^∞]) this is HT: T_pA^∨ ⊗ O_C → ω_A, the convention of the roadmap's displayed sequence.

*Proof outline.*
1. The maps α_{G[p^n]} are compatible with the transition maps p: G[p^{n+1}] → G[p^n] and ω_{G^D}/p^{n+1} → ω_{G^D}/p^n by naturality (T0/hodge-tate-map-compatibilities (1)).
2. Pass to the limit; ω_{G^D} = lim ω_{G^D}/p^n by p-adic completeness.
3. Galois equivariance from the naturality in O_K̄-points.

*Prerequisites.* this roadmap: `T0/finite-hodge-tate-map`, `T0/hodge-tate-map-compatibilities`, `T0/conormal-module`; other roadmaps: `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-divisible-tate-module`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-divisible-cartier-dual`; libraries: `mathlib:PadicInt`, `mathlib:PadicComplex`, `mathlib:IsAdicComplete`.

*Uses.* Scholze–Weinstein 2013, §4: the Hodge–Tate sequence of a p-divisible group over O_C. HodgeTateAndCanonicalSubgroups:T2: the abelian Hodge–Tate sequence T_pA^∨ ⊗ C → ω_A. PerfectoidShimuraVarieties:S1/continuous-hodge-tate-map: the period map is built from α on the tower.

*API.*

- `TauCeti.HodgeTate.pDivisibleHodgeTateMap` (constructor): α_G: T_pG(R) → ω_{G^D}, the inverse limit of α_{G[p^n]}.
- `TauCeti.HodgeTate.pDivisibleHodgeTateMap_mod` (compatibility): α_G mod p^n equals α_{G[p^n]} composed with T_pG → G[p^n].
- `TauCeti.HodgeTate.pDivisibleHodgeTateLinear` (constructor): α_G ⊗ 1: T_pG ⊗_{ℤ_p} O_C → ω_{G^D} over O_C, and its C-linearisation.
- `TauCeti.HodgeTate.pDivisibleHodgeTateMap_natural` (functoriality): Natural in homomorphisms of p-divisible groups, 𝒪-linear for endomorphism actions, exchanged under a quasi-polarisation.
- `TauCeti.HodgeTate.pDivisibleHodgeTateMap_galois` (functoriality): For G over O_K, α_G ⊗ 1 is Gal(K̄/K)-equivariant.

*Unit tests.*

- `TauCeti.HodgeTate.pDivisibleHodgeTateMap_QpZp` (computation): For G = ℚ_p/ℤ_p over O_C, α_G(1) = dt/t, so α_G ⊗ 1 is an isomorphism ℤ_p ⊗ O_C ≅ ω_{μ_{p^∞}}.
- `TauCeti.HodgeTate.pDivisibleHodgeTateMap_mu` (degenerate): For G = μ_{p^∞}, α_G = 0.
- `TauCeti.HodgeTate.pDivisibleHodgeTateMap_not_surjective_integrally` (non-example): For G = E[p^∞] with E supersingular over O_C, α_G ⊗ 1 is not surjective: its cokernel is nonzero and killed by p^{1/(p−1)} (T0/fargues-hodge-tate-cokernel), so the integral map is not a split surjection.
- `TauCeti.HodgeTate.pDivisibleHodgeTateMap_tate` (compatibility): For G over the ring of integers of a complete discretely valued K with perfect residue field, α_G ⊗ C: T_pG ⊗ C → ω_{G^D} ⊗ C is the projection of Tate's decomposition T_pG ⊗ C ≅ (t_{G^D}(K)^∨ ⊗ C) ⊕ (t_G(K) ⊗ C(1)) (FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1/hodge-tate-p-divisible) onto its first summand, t_{G^D}(K)^∨ = ω_{G^D} ⊗ K.

*Acceptance.* For G = μ_{p^∞} over O_C, α_G: T_pμ_{p^∞} = ℤ_p(1) → ω_{ℚ_p/ℤ_p} = 0 is zero; for G = ℚ_p/ℤ_p, α_G: ℤ_p → ω_{μ_{p^∞}} = O_C·dt/t sends 1 to dt/t. For an abelian variety with good ordinary reduction the C-linearisation is surjective with kernel the Tate module of the multiplicative part tensored with C(1).

*Sources.* SW13, §5.1, Proposition 5.1.6 and its proof (arXiv:1211.6357v2), PDF p. 50.

### Fargues's bound on the cokernel of the Hodge–Tate map

`T0/fargues-hodge-tate-cokernel` (theorem) — planet: *Fargues's Hodge–Tate cokernel bound*

Let K be a complete valued extension of ℚ_p, v(p) = 1, and C = the completion of K̄. (1) For a finite flat commutative group scheme G of p-power order over O_K, the cokernel of α_G ⊗ 1: G(O_K̄) ⊗ O_C → ω_{G^D} ⊗ O_C is killed by every element of valuation ≥ 1/(p−1). (2) For a p-divisible group H over O_C, the cokernel of α_H ⊗ 1: T_pH ⊗ O_C → ω_{H^D} is killed by every element of valuation ≥ 1/(p−1).

*Hypotheses and conventions.* Fargues 2010, Théorème 7 states (1) for p ≠ 2; Fargues 2011, Théorème 3 restates it without hypothesis on p, Remark 2 there explaining that the required parts of Faltings's theorem hold for p = 2. The packet records both; consumers that need p = 2 cite Fargues 2011, Théorème 3. (2) is Fargues 2011, Théorème 2 (= Fargues–Genestier–Lafforgue, Théorème II.1.1, the book itself not read): the cohomology of the integral Hodge–Tate sequence of H is killed by every element of valuation ≥ 1/(p−1); Scholze–Weinstein, Proposition 4.3.6, give the weaker p^{1/(p−1)+ε}. Scholze 2015 uses the bound p^{g/(p−1)} on determinants (proof of Theorem 3.3.18(vi), p ≠ 2).

*Proof outline.*
1. Embed G in a p-divisible group H over O_K with quotient H′ = H/G (Raynaud), and compare the Hodge–Tate maps of T_pH → T_pH′ → G(O_K̄) → 0 and ω_{H^D} → ω_{H′^D} → ω_{G^D} → 0 (Fargues 2010, proof of Théorème 7).
2. The p-divisible case (2) for H′ gives the bound; right exactness of ω transfers it to G.

*Prerequisites.* this roadmap: `T0/finite-hodge-tate-map`, `T0/p-divisible-hodge-tate-map`; other roadmaps: `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-divisible-group`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/oort-tate-classification`.

*Acceptance.* For G = μ_p over O_K the cokernel is ω_{ℤ/p} = 0; for G = ℤ/p the map is onto ω_{μ_p} = O_K/p. The bound is uniform: it depends neither on ht G nor on the ramification of K.

*Sources.* FAR10, §9.2, Théorème 7, PDF p. 26; FAR10, §9.2, Théorème 7, PDF p. 26; FAR11, §5.4, Théorème 3 (author copy), PDF p. 25; FAR11, §5.3, Théorème 2 (author copy), PDF p. 24.

### Fargues's degree of a finite flat group scheme

`T0/fargues-degree` (definition) — planet: *Fargues degree*

Let S be a scheme and G a finite locally free commutative group scheme over S which is étale over a schematically dense open subscheme. Its discriminant divisor is the effective Cartier divisor δ_G := Div(ℓ_{G/S}) = Fitt₀(ω_G) (ℓ_{G/S} the co-Lie complex, perfect of rank 0); its support is the complement of the largest open over which G is étale. Now let K be a field of characteristic 0 complete for a valuation v: K → ℝ ∪ {∞} with v(p) = 1 (not necessarily discrete), and G a finite flat commutative group scheme of p-power order over O_K, of height ht G (|G| = p^{ht G}). Then ω_G ≅ ⊕_{i∈I} O_K/x_iO_K for a finite family x_i ∈ O_K, and the degree of G is deg G := v(δ_G) = Σ_i v(x_i) ∈ ℝ_{≥0}; the slope of G ≠ 0 is μ(G) := deg G / ht G ∈ [0, 1].

*Hypotheses and conventions.* The general-base δ_G needs G étale over a schematically dense open; over O_K this holds since K has characteristic 0. The valuation is normalised by v(p) = 1, so degrees are rational numbers when K is discretely valued and real numbers in general; the degree is invariant under extension of the valued field (T0/fargues-degree-properties).

*Proof outline.*
1. Define δ_G as the Fitting ideal Fitt₀ ω_G of the finitely presented module ω_G (T0/conormal-module); Fargues identifies it with Div ℓ_{G/S}.
2. Over a valuation ring every finitely presented torsion module is a finite direct sum of cyclic modules O_K/x_i, so Fitt₀ ω_G = (∏ x_i) and deg G = Σ v(x_i).
3. Locally G = V(f_1,…,f_n) ⊂ 𝔸^n_S with unit section 0, δ_G = det(∂f_i/∂T_j(0)) (Fargues 2010, §2).

*Prerequisites.* this roadmap: `T0/conormal-module`; other roadmaps: `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-divisible-group`; libraries: `mathlib:Valuation`, `mathlib:ValuationSubring`, `mathlib:Module.length`.

*Uses.* Fargues 2010, §§4–9: slopes and the Harder–Narasimhan filtration of finite flat group schemes. Fargues 2011, Théorème principal: the canonical subgroup has degree d − w. Bijakowski–Pilloni–Stroh 2016 and Pilloni 2020, §§6–13: degree functions on Siegel varieties cut out the loci where U_p improves. Boxer–Pilloni (Siegel), §4.2: the divisors D_i and generic isomorphisms.

*API.*

- `TauCeti.HodgeTate.discriminantDivisor` (constructor): δ_G = Fitt₀ ω_G as an invertible ideal of O_S, for G generically étale over S.
- `TauCeti.HodgeTate.farguesDegree` (constructor): deg G := v(Fitt₀ ω_G) ∈ ℝ_{≥0} for G finite flat over O_K.
- `TauCeti.HodgeTate.farguesDegree_eq_sum` (characterisation): If ω_G ≅ ⊕ O_K/x_i then deg G = Σ v(x_i).
- `TauCeti.HodgeTate.fargueSlope` (constructor): μ(G) := deg G / ht G for G ≠ 0.
- `TauCeti.HodgeTate.farguesDegree_isogeny` (compatibility): If G = ker(f: A → B) for an isogeny of abelian schemes or p-divisible groups over O_K, deg G = v(det(f*: ω_B → ω_A)).
- `TauCeti.HodgeTate.farguesDegree_monogenic` (example): For G = Spec O_K[T]/(f) with unit section T = 0, deg G = v(f′(0)) = Σ_{x ∈ G(O_K̄)∖0} v(x).

*Unit tests.*

- `TauCeti.HodgeTate.farguesDegree_constant` (degenerate): deg (ℤ/p^n)_{O_K} = 0.
- `TauCeti.HodgeTate.farguesDegree_mu` (computation): deg μ_{p^n, O_K} = n, since ω = O_K/p^n.
- `TauCeti.HodgeTate.farguesDegree_not_length` (non-example): deg is not the O_K-length of ω_G: for K with value group ℚ and G with ω_G ≅ O_K/p^{1/2}, the length is infinite (O_K is not noetherian) while deg G = 1/2.
- `TauCeti.HodgeTate.farguesDegree_ellipticTorsion` (computation): For E an elliptic curve over O_K with good reduction, deg E[p] = 1 (BT_1 of dimension 1).

*Acceptance.* deg (ℤ/p^n) = 0, deg μ_{p^n} = n, deg G[p^n] = n·dim G for a p-divisible group G. For G = Spec O_K[T]/(f), f monic with f(0) = 0, deg G = v(f′(0)).

*Sources.* FAR10, §2, Définition 3, PDF p. 7; FAR10, §3, Définition 4, PDF p. 9; FAR10, Introduction, PDF p. 2.

### Additivity, duality and extreme values of the degree

`T0/fargues-degree-properties` (lemma)

Let G be finite flat commutative of p-power order over O_K (K, v as in T0/fargues-degree). (1) For an exact sequence 0 → G₁ → G₂ → G₃ → 0 of such group schemes, deg G₂ = deg G₁ + deg G₃ (over a general base, δ_{G₂} = δ_{G₁} + δ_{G₃}). (2) deg G + deg G^D = ht G (over a base where |G| is a non-zero-divisor, δ_G + δ_{G^D} = div |G|). (3) For a valued extension L/K, deg(G ⊗_{O_K} O_L) = deg G; for a flat S′ → S, δ commutes with pullback. (4) 0 ≤ deg G ≤ ht G; deg G = 0 iff G is étale, and deg G = ht G iff G is of multiplicative type; μ(G^D) = 1 − μ(G). (5) A truncated Barsotti–Tate group of level n and dimension d has degree nd; in particular deg G[p^n] = n·dim G for a p-divisible group G, and μ(G[p^n]) = dim G / ht G.

*Hypotheses and conventions.* (2) over a general base needs |G| locally a non-zero-divisor on S.

*Proof outline.*
1. (1) from the distinguished triangle of co-Lie complexes ℓ_{G₃} → ℓ_{G₂} → ℓ_{G₁} (Fargues 2010, Lemme 1).
2. (2) locally write G = ker(f: A → B) for an isogeny of abelian schemes; the Hodge filtration triangle ℓ_G[−1] → H¹_dR(B) → H¹_dR(A) → ℓ^∨_{G^D} gives δ_G + δ_{G^D} = Div(det f* on H¹_dR) = div deg f = div |G| (Lemme 2).
3. (3) Lemme 3 and the valuation of a Fitting ideal under faithfully flat base change.
4. (4) from (2), Fitt₀ ω_G ⊂ O_K, and ω_G = 0 ⇔ G étale; (5) because ω of a BT_n of dimension d is locally free of rank d over O_K/p^n (Exemple 2).

*Prerequisites.* this roadmap: `T0/fargues-degree`; other roadmaps: `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-divisible-cartier-dual`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-divisible-dimension`, `AbelianSchemesAndArithmeticModuli:A4`.

*Acceptance.* deg μ_p + deg ℤ/p = 1 = ht. deg E[p] = 1 for an elliptic curve E with good reduction, and E[p] is neither étale nor multiplicative when E is supersingular.

*Sources.* FAR10, §2, Lemme 1, PDF p. 7; FAR10, §3, Lemme 4, PDF p. 9; FAR10, §3, Exemple 2, PDF p. 9; FAR10, §3, Exemple 2, PDF p. 9.

### The degree increases along generic isomorphisms

`T0/fargues-degree-generic-isomorphism` (theorem) — planet: *Degree along generic isomorphisms*

Let f: G → G′ be a homomorphism of finite flat commutative group schemes over O_K inducing an isomorphism of generic fibres. Then deg G ≤ deg G′, with equality if and only if f is an isomorphism; more precisely deg G′ = deg G + (2/|G|)·χ(A, f*A′) where G = Spec A, G′ = Spec A′ and χ(A, f*A′) = v(Fitt₀(A/f*A′)) ≥ 0. Consequently, for G′ ↪ G → G″ with the first map a closed immersion, the composite zero and G/G′ → G″ a generic isomorphism, deg G ≤ deg G′ + deg G″ with equality iff G → G″ is flat (an fppf epimorphism). Over a discrete valuation ring the degree is strictly increasing on Raynaud's lattice of prolongations of a given generic group, and it is exchanged with ht − deg under Cartier duality.

*Hypotheses and conventions.* K of characteristic 0 complete for v with v(p) = 1; f an isomorphism on generic fibres (equivalently f*: A′ → A injective with torsion cokernel).

*Proof outline.*
1. Reduce to S = Spec A₀ affine with free Hopf algebras; with M the matrix of f*: B₂ ↪ B₁ and Q_i the trace forms, Q₂ = ᵗM Q₁ M, so (by different = discriminant, Fargues 2010 Proposition 1) δ_{G₂}^n = det(M)² δ_{G₁}^n (Proposition 2).
2. Take valuations (Proposition 3); χ ≥ 0 with equality iff f* is onto, i.e. f is an isomorphism (Corollaire 3).

*Prerequisites.* this roadmap: `T0/fargues-degree`, `T0/fargues-degree-properties`; other roadmaps: `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/finite-flat-prolongations`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/raynaud-uniqueness`.

*Acceptance.* The isogeny μ_p → … : for the generic isomorphism ℤ/p → μ_p over ℤ_p[ζ_p] given by 1 ↦ ζ_p, deg ℤ/p = 0 < 1 = deg μ_p, and the map is not an isomorphism. Boxer–Pilloni use the equality case: a generic isomorphism H₁ → H₂ with deg H₁ = deg H₂ is an isomorphism.

*Sources.* FAR10, §2, Proposition 2, PDF p. 8; FAR10, §3, Corollaire 3, PDF p. 10; BP26, §4.2.8, proof of Proposition 4.2.8 (author copy), PDF p. 45.

### The divisor D_H of a generically étale finite flat group scheme

`T0/fargues-divisor` (definition)

Let X be a normal ℤ_p-flat scheme or formal scheme (or a normal adic space over ℚ_p with an integral model) and H a finite locally free commutative group scheme over X of order p^h which is étale after inverting p. Its divisor D_H is the effective Cartier divisor δ_H = Fitt₀(ω_H) of T0/fargues-degree; its support is the complement of the étale locus of H, D_H + D_{H^D} = V(p^h), and at a point valued in a complete rank-one valuation ring V with v(p) = 1 one has D_H = (x) with deg H_x = v(x).

*Hypotheses and conventions.* X normal and ℤ_p-flat so that a Cartier divisor is determined by its valuations at codimension-one points; H generically étale (automatic after inverting p). Values: v(p) = 1, matching T0/fargues-degree.

*Proof outline.*
1. D_H := δ_H; effectivity and support from T0/fargues-degree; the identity D_H + D_{H^D} = V(p^h) is the general-base duality of T0/fargues-degree-properties (2) with |H| = p^h.
2. At a rank-one point, pull back along Spec V → X and use base change of δ (T0/fargues-degree-properties (3)).

*Prerequisites.* this roadmap: `T0/fargues-degree`, `T0/fargues-degree-properties`; other roadmaps: `AdicSpacesPartII:R2/admissible-formal-scheme`; libraries: `mathlib:AlgebraicGeometry.Scheme`.

*Uses.* Boxer–Pilloni (Siegel), §§4.1.8, 4.2.7: the divisors D_i of the Siegel Hecke correspondences and D_i + D_{2g+1−i} = V(p^n). BCGP 2021, §6.5.1: δ_H at rank-one points computes Fargues's degree.

*API.*

- `TauCeti.HodgeTate.farguesDivisor` (constructor): D_H = Fitt₀ ω_H as an effective Cartier divisor of X.
- `TauCeti.HodgeTate.farguesDivisor_support` (characterisation): X ∖ Supp D_H is the largest open over which H is étale.
- `TauCeti.HodgeTate.farguesDivisor_add_dual` (relation): D_H + D_{H^D} = V(p^h) for H of order p^h.
- `TauCeti.HodgeTate.farguesDivisor_pullback` (functoriality): For a flat (or rank-one point) map f: Y → X, D_{f*H} = f*D_H.
- `TauCeti.HodgeTate.farguesDivisor_rankOne` (compatibility): At x: Spec V → X with V rank one, v(p) = 1, x*D_H = (a) with v(a) = deg H_x.

*Unit tests.*

- `TauCeti.HodgeTate.farguesDivisor_mu` (computation): D_{μ_{p^n}} = V(p^n).
- `TauCeti.HodgeTate.farguesDivisor_etale` (degenerate): D_H = 0 for H étale over X.
- `TauCeti.HodgeTate.farguesDivisor_not_reduced` (non-example): D_{μ_p} = V(p) is not the reduced special fibre when X = Spf ℤ_p[p^{1/2}]: there V(p) = 2·V(p^{1/2}), so D_H records multiplicities, not only support.

*Acceptance.* D_{μ_{p^n}} = V(p^n), D_{ℤ/p^n} = ∅. deg H_x is a locally constant function on the rigid generic fibre exactly when D_H is a multiple of V(p) locally.

*Sources.* BP26, §4.1.8 (author copy), PDF p. 41.

### The divisor of an isogeny of semi-abelian schemes and the section δ_H

`T0/isogeny-divisor` (construction)

Let X be a normal ℤ_p-flat scheme (or formal scheme) and f: G → G′ an isogeny of semi-abelian schemes over X which is étale after inverting p. Lie(f): Lie G → Lie G′ is a map of locally free modules of the same rank; its determinant det Lie(f) is a section of det Lie(G)^{-1} ⊗ det Lie(G′), and the divisor of f is D_f := div(det Lie(f)). D_f is an effective Cartier divisor, D_{g∘f} = D_f + D_g, and over the open where ker f is finite D_f = D_{ker f} (T0/fargues-divisor). Over an analytic adic space 𝒳 with such an isogeny on a formal model, δ_H := det Lie(f) for H = ker f is a section with v_x(δ_H) = deg H_x at every rank-one point x.

*Hypotheses and conventions.* ker f is in general only quasi-finite and flat at the boundary (ShimuraCompactifications C4/extended-isogeny-kernel), so D_f is defined through Lie(f), not through a finite group scheme. X normal and ℤ_p-flat, f étale after inverting p (so det Lie(f) is a non-zero-divisor).

*Proof outline.*
1. Lie G, Lie G′ are locally free of rank dim G (semi-abelian, C4/semi-abelian-scheme); det Lie(f) is a non-zero-divisor because f is étale after inverting p.
2. Additivity: Lie(g∘f) = Lie(g)∘Lie(f).
3. Where ker f = H is finite, ω_H = coker(f*: ω_{G′} → ω_G), so Fitt₀ ω_H = (det f*) = (det Lie f) (Fargues 2010, introduction).
4. At rank-one points, T0/fargues-divisor gives v_x(δ_H) = deg H_x.

*Prerequisites.* this roadmap: `T0/fargues-divisor`; other roadmaps: `ShimuraCompactifications:C4/semi-abelian-scheme`, `ShimuraCompactifications:C4/extended-isogeny-kernel`; libraries: `mathlib:LinearMap.det`.

*Uses.* Boxer–Pilloni (Siegel), §4.2: the divisors D_i of the Hecke correspondences, D_i + D_{2g+1−i} = V(p^n) (planned in HigherHidaAndColemanTheory). BCGP 2021, §6.5: the degree function on the Klingen tower via δ_H.

*API.*

- `TauCeti.HodgeTate.isogenyDivisor` (constructor): D_f := div(det Lie(f)) for an isogeny f of semi-abelian schemes, étale after inverting p.
- `TauCeti.HodgeTate.isogenyDivisor_comp` (relation): D_{g∘f} = D_f + D_g.
- `TauCeti.HodgeTate.isogenyDivisor_eq_farguesDivisor` (compatibility): Over the open where ker f is finite flat, D_f = D_{ker f}.
- `TauCeti.HodgeTate.deltaSection` (constructor): δ_H := det Lie(f) on an analytic adic space with formal model, with v_x(δ_H) = deg H_x at rank-one points.
- `TauCeti.HodgeTate.isogenyDivisor_mulP` (example): D_{[p]} = V(p^{dim G}).

*Unit tests.*

- `TauCeti.HodgeTate.isogenyDivisor_id` (degenerate): D_{id} = 0.
- `TauCeti.HodgeTate.isogenyDivisor_mulP_test` (computation): For [p] on an abelian scheme of relative dimension g, D_{[p]} = V(p^g).
- `TauCeti.HodgeTate.isogenyDivisor_kernel_not_finite` (non-example): For the quotient of the Tate curve by μ_p, D_f = V(p) is defined although the kernel is not finite over the cusp, so D_f cannot be defined as D_{ker f}.

*Acceptance.* For f = [p] on an abelian scheme of dimension g, D_f = V(p^g). For a Tate curve with f the quotient by μ_p ⊂ 𝔾_m, D_f = V(p) although ker f is not finite over the cusp.

*Sources.* PIL20, §14.1 (author copy), PDF p. 92; BCGP21, §6.5.1 (arXiv:1812.09269v3), PDF p. 154; PIL20, §14.3 (author copy), PDF p. 93.

### The Hodge–Tate map of a group of multiplicative type is an isomorphism

`T0/multiplicative-hodge-tate-isomorphism` (lemma)

Let R be a ring and H a finite locally free commutative group scheme over R which is étale-locally isomorphic to μ_{p^n}^r (equivalently H^D étale-locally constant (ℤ/p^n)^r). Then α_{H^D} ⊗ 1: H^D(R′) ⊗ R′ → ω_H ⊗ R′ is an isomorphism for every étale R-algebra R′ trivialising H^D, and ω_H is locally free of rank r over R/p^n. In particular, for the universal multiplicative subgroup H_n of a Siegel or Hilbert–Siegel tower, HT ⊗ O: H_n^D ⊗ O → ω_{H_n} is an isomorphism.

*Hypotheses and conventions.* H étale-locally of multiplicative type μ_{p^n}^r; no hypothesis on p.

*Proof outline.*
1. Reduce étale-locally to H = μ_{p^n}^r, H^D = (ℤ/p^n)^r; the standard basis maps to the r forms dt_i/t_i, a basis of ω_H ≅ (R/p^n)^r (T0/finite-hodge-tate-map, test hodgeTateMap_constant).
2. Both sides commute with étale base change (T0/finite-hodge-tate-map, T0/conormal-module).

*Prerequisites.* this roadmap: `T0/finite-hodge-tate-map`, `T0/conormal-module`.

*Acceptance.* For H = μ_{p^n}, α_{ℤ/p^n}(1) = dt/t generates ω_{μ_{p^n}} = R/p^n.

*Sources.* PIL20, §9.4 (author copy), PDF p. 56.

### Normalised pullback along isogenies of multiplicative p-divisible groups

`T0/normalized-multiplicative-pullback` (lemma)

Let S be a scheme on which p is locally nilpotent or a p-adic formal scheme, and λ: G → G′ an isogeny of p-divisible groups of multiplicative type of height h, with T, T′ their (étale) character groups. Through the canonical identification det ω_G ≅ (det T)^{-1} ⊗ ω_{μ_{p^∞}}^{⊗h} (and likewise for G′), the transpose of p^{−r} det λ₀ (λ₀: T′ → T the map on characters, p^r its determinant up to a unit) defines a normalised pullback λ̃*: det ω_{G′} → det ω_G which is an isomorphism; it differs from det(λ*) by the factor p^r.

*Hypotheses and conventions.* Pilloni's Lemma 6.3.4.1 is used in the corrected form recorded by the Pilloni 2020 extraction (its source issue E47): λ̃* is the transpose of p^{−r} det λ₀ through det ω_G ≅ (det T)^{-1} ⊗ ω_{μ_{p^∞}}^{⊗h}.

*Proof outline.*
1. Étale-locally G ≅ μ_{p^∞} ⊗ T^∨; then ω_G ≅ T ⊗ ω_{μ_{p^∞}} and λ* corresponds to λ₀ ⊗ 1.
2. Take determinants; divide by p^r = det λ₀ up to a unit to obtain an isomorphism; descend from the étale cover.

*Prerequisites.* this roadmap: `T0/conormal-module`, `T0/multiplicative-hodge-tate-isomorphism`; other roadmaps: `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-divisible-group`.

*Acceptance.* For λ = [p] on μ_{p^∞}, λ* = p on ω and λ̃* = id.

*Sources.* PIL20, §6.3.4, Lemma 6.3.4.1 (author copy), PDF p. 34.

### p-power torsion of semi-abelian schemes on degeneration charts

`T0/semi-abelian-torsion` (construction)

Let S be a scheme and G a semi-abelian scheme over S whose torus part has locally constant rank r on a locally closed stratum Z ⊂ S, with Raynaud extension 0 → T → G̃ → B → 0 over the formal completion along Z (C4). For n ≥ 1, G[p^n] is a quasi-finite flat separated group scheme over S; over Z its finite part G[p^n]^f sits in 0 → T[p^n] → G[p^n]^f → B[p^n] → 0 with T[p^n] of multiplicative type of order p^{nr} and B[p^n] finite locally free of order p^{2n(g−r)}, so the order of G[p^n]^f drops from p^{2ng} on the abelian locus to p^{n(2g−r)} on Z. On the generic fibre of a degeneration chart, the Tate module of G is an extension 0 → T_pG̃ → T_pG → X ⊗ ℤ_p → 0 of the character-lattice term X ⊗ ℤ_p by the Tate module of the Raynaud extension. With the convention α_H: H(S) → ω_{H^D} (T0/finite-hodge-tate-map), the Hodge–Tate map of the finite part vanishes on the toric piece T[p^n] (its Cartier dual is étale, so ω_{T[p^n]^D} = 0) and induces α_{B[p^n]} on the abelian quotient; dually, the Hodge–Tate map of the Cartier dual of T[p^n], an étale group, is an isomorphism onto ω_{T[p^n]} (T0/multiplicative-hodge-tate-isomorphism), which is how the forms dt_i/t_i of the torus appear in ω_G.

*Hypotheses and conventions.* The height of the p-divisible part is not constant across the boundary; statements about G[p^∞] near Z use G[p^∞]^f on Z and the Mumford-quotient description on the chart, never a constant-height p-divisible group. Degeneration data and Raynaud extensions are imported from ShimuraCompactifications C4 and NeronModelsAndSemistableAbelianVarieties R11.3.

*Proof outline.*
1. C4/semiabelian-tate-module gives the Tate module extension on the chart; C4/extended-isogeny-kernel gives quasi-finite flatness of G[p^n].
2. On Z, the connected–finite decomposition of the quasi-finite group G[p^n] (R07.1/finite-part-of-quasi-finite-group over a henselian base) and the Raynaud extension give the finite part and its filtration.
3. Naturality of α (T0/hodge-tate-map-compatibilities) along T[p^n] → G[p^n]^f → B[p^n] gives the vanishing on T[p^n] and the induced map on B[p^n]; T0/multiplicative-hodge-tate-isomorphism applied to T[p^n] gives the toric forms dt_i/t_i.

*Prerequisites.* this roadmap: `T0/finite-hodge-tate-map`, `T0/multiplicative-hodge-tate-isomorphism`; other roadmaps: `ShimuraCompactifications:C4/semi-abelian-scheme`, `ShimuraCompactifications:C4/semiabelian-tate-module`, `ShimuraCompactifications:C4/extended-isogeny-kernel`, `ShimuraCompactifications:C4/formal-universal-degeneration`, `NeronModelsAndSemistableAbelianVarieties:R11.3/raynaud-extension-comparison`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/finite-part-of-quasi-finite-group`.

*Uses.* Scholze 2015, Proposition 3.3.1 and Lemma 3.3.2: Hodge–Tate filtration and Hasse invariant at boundary points. Pilloni–Stroh 2016, Proposition 1.2; Pilloni 2020 p. 74: extension of HT over the toroidal boundary. ShimuraCompactifications:C6/hilbert-hasse-boundary-comparison: the Hilbert Hasse ideal at the boundary.

*API.*

- `TauCeti.HodgeTate.semiAbelianTorsion` (constructor): G[p^n] for a semi-abelian G, quasi-finite flat, with its finite part on each stratum of constant torus rank.
- `TauCeti.HodgeTate.semiAbelianTorsion_finitePart_exact` (relation): 0 → T[p^n] → G[p^n]^f → B[p^n] → 0 on a stratum Z of torus rank r.
- `TauCeti.HodgeTate.semiAbelianTorsion_card` (characterisation): The finite part has order p^{n(2g−r)} on Z.
- `TauCeti.HodgeTate.semiAbelianTateModule_extension` (relation): 0 → T_pG̃ → T_pG → X ⊗ ℤ_p → 0 on the generic fibre of a degeneration chart.
- `TauCeti.HodgeTate.semiAbelianHodgeTate_toric` (compatibility): α vanishes on the toric piece T[p^n], and the Hodge–Tate map of the dual of T[p^n] is the isomorphism of T0/multiplicative-hodge-tate-isomorphism onto ω_{T[p^n]}.

*Unit tests.*

- `TauCeti.HodgeTate.semiAbelianTorsion_abelian` (degenerate): For r = 0 (G abelian) the construction is A[p^n], finite locally free of order p^{2ng}.
- `TauCeti.HodgeTate.semiAbelianTorsion_torus` (computation): For G = 𝔾_m^g a split torus, G[p^n] = μ_{p^n}^g, of degree ng.
- `TauCeti.HodgeTate.semiAbelianTorsion_not_constant_height` (non-example): For the Tate curve over ℤ_p[[q]], E[p] is not finite over q = 0: its finite part there has order p, not p²; a constant-height p-divisible group over the chart does not exist.

*Acceptance.* For the Tate curve 𝔾_m/q^ℤ over ℤ_p((q)), E[p^n] = μ_{p^n} extended by ℤ/p^n generated by q^{1/p^n}, and over the cusp only μ_{p^n} remains finite.

*Sources.* SCH15, §3.3, Proposition 3.3.1 (arXiv v2, III.3.1), PDF p. 54; PIL20, §12.2.1 (author copy), PDF p. 74.

### The Hasse invariant of a semi-abelian scheme

`T0/semi-abelian-hasse-invariant` (construction) — planet: *Hasse invariant of a semi-abelian scheme*

Let S be an 𝔽_p-scheme and G a semi-abelian scheme of relative dimension g over S, with ω_G = e*Ω¹_{G/S} (locally free of rank g) and det ω_G its Hodge line. Let G^{(p)} be the pullback of G along the absolute Frobenius of S. The Verschiebung V: G^{(p)} → G (dual to Frobenius on the dual semi-abelian scheme, defined on the abelian locus by duality and on degeneration charts through the Raynaud extension) induces V*: ω_G → ω_{G^{(p)}} ≅ ω_G^{(p)}, and Ha(G/S) := det V* ∈ H⁰(S, (det ω_G)^{⊗(p−1)}). For G = A abelian this is Scholze's Ha(A/S), and it equals FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2's Hasse invariant Ha(A[p]) of the BT₁ A[p] under ω_{A[p]} = ω_A/p. On a split torus 𝔾_m^g, V* is an isomorphism and Ha is a unit; on a degeneration chart Ha(G) = Ha(B) ⊗ (unit of the torus part) through det ω_G ≅ det ω_T ⊗ det ω_B.

*Hypotheses and conventions.* Ownership (RT-AREA-padic-1/26): the Hasse invariant Ha(G) = det V* of a BT₁ over any 𝔽_p-scheme, Fargues's isomorphism LF and the BT₁ Hodge–Tate sequence are FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2's; this node owns only the semi-abelian and boundary extension and its comparison with R07.2. S of characteristic p; semi-abelian schemes and their degeneration data from ShimuraCompactifications C4.

*Proof outline.*
1. On the abelian locus, V is the dual of the Frobenius of the dual abelian scheme (AbelianSchemesAndArithmeticModuli A2/A3) and V* on ω_A agrees with V* on ω_{A[p]} = ω_A/p (R07.2).
2. On a chart, the Raynaud extension 0 → T → G̃ → B → 0 gives 0 → ω_B → ω_G̃ → ω_T → 0; V is compatible with it, and on a split torus V is the identity of 𝔾_m^g after Frobenius twist, so its determinant on ω_T is a unit.
3. Glue: the two descriptions agree on overlaps because both are det V* on ω_G (C4/homomorphism-extension).

*Prerequisites.* this roadmap: `T0/conormal-module`, `T0/semi-abelian-torsion`; other roadmaps: `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/frobenius-verschiebung`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`, `ShimuraCompactifications:C4/semi-abelian-scheme`, `ShimuraCompactifications:C4/homomorphism-extension`, `AbelianSchemesAndArithmeticModuli:A2`; libraries: `mathlib:LinearMap.det`, `mathlib:Module.Invertible`.

*Uses.* Scholze 2015, §3.2: Hasse domains 𝒳(ε) = {|Ha| ≥ |p|^ε} and canonical subgroups. ShimuraCompactifications:C6/hilbert-hasse-boundary-comparison: Hilbert Hasse ideal at the boundary (split-torus Verschiebung determinant a unit). PerfectoidShimuraVarieties:S1/siegel-finite-level-spaces: Siegel Hasse domains. HodgeTateAndCanonicalSubgroups:T3: the Hasse neighbourhoods on which canonical subgroups exist.

*API.*

- `TauCeti.HodgeTate.semiAbelianHasse` (constructor): Ha(G/S) = det V* ∈ H⁰(S, (det ω_G)^{⊗(p−1)}).
- `TauCeti.HodgeTate.semiAbelianHasse_eq_bt1Hasse` (compatibility): For G = A abelian, Ha(A/S) = Ha(A[p]) of R07.2 under ω_{A[p]} = ω_A/p.
- `TauCeti.HodgeTate.semiAbelianHasse_baseChange` (functoriality): Ha commutes with base change S′ → S.
- `TauCeti.HodgeTate.semiAbelianHasse_torus` (compatibility): On a split torus Ha is a unit (det V* is an isomorphism on ω_T).
- `TauCeti.HodgeTate.semiAbelianHasse_raynaud` (relation): On a degeneration chart, Ha(G) = Ha(B)·u with u a unit, through det ω_G ≅ det ω_T ⊗ det ω_B.
- `TauCeti.HodgeTate.semiAbelianHasse_isUnit_iff` (characterisation): Ha(G/S) is a unit iff every geometric fibre is ordinary (T0/hasse-invariant-ordinary-locus).

*Unit tests.*

- `TauCeti.HodgeTate.semiAbelianHasse_tateCurve` (computation): For the Tate curve over 𝔽_p((q)), Ha = 1 with respect to the canonical differential dt/t.
- `TauCeti.HodgeTate.semiAbelianHasse_torus_test` (degenerate): For G = 𝔾_m^g over S, Ha(G/S) is a unit.
- `TauCeti.HodgeTate.semiAbelianHasse_supersingular` (non-example): For a supersingular elliptic curve over 𝔽̄_p, Ha = 0: Ha is not a unit on every fibre, and Ha does not detect supersingularity only through the order of E[p](𝔽̄_p) without V.
- `TauCeti.HodgeTate.semiAbelianHasse_bt1` (compatibility): For A abelian, Ha(A/S) equals R07.2's Ha(A[p]).

*Acceptance.* For an ordinary elliptic curve Ha is a unit, for a supersingular one Ha = 0. For the Tate curve, Ha = 1 in the q-expansion normalisation.

*Sources.* SCH15, §3.2.1, before Lemma 3.2.5, p. 33 (arXiv v2); SCH15, §3.2.1, before Lemma 3.2.5, p. 33 (arXiv v2).

### The Hasse invariant is invertible exactly on the ordinary locus

`T0/hasse-invariant-ordinary-locus` (theorem)

Let S be an 𝔽_p-scheme and A → S an abelian scheme of dimension g. Then Ha(A/S) is invertible if and only if A is ordinary, i.e. for every geometric point x̄ of S, A[p](x̄) has p^g elements. For a semi-abelian G with abelian part B on a stratum, Ha(G/S) is invertible at x̄ iff B_x̄ is ordinary.

*Hypotheses and conventions.* S of characteristic p.

*Proof outline.*
1. Ha invertible ⇔ V: A^{(p)} → A is an isomorphism on tangent spaces ⇔ V is finite étale ⇔ ker V has p^g geometric points over every x̄ (deg V = p^g).
2. Since VF = p and F is purely inseparable, A[p](x̄) = (ker V)(x̄).
3. The semi-abelian statement follows from T0/semi-abelian-hasse-invariant (Ha(G) = Ha(B)·unit).

*Prerequisites.* this roadmap: `T0/semi-abelian-hasse-invariant`; other roadmaps: `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/frobenius-verschiebung`.

*Acceptance.* The Tate curve is ordinary: Ha is a unit near the cusp. A supersingular elliptic curve has Ha = 0.

*Sources.* SCH15, §3.2.1, Lemma 3.2.5, p. 33 (arXiv v2); SCH15, §3.2.1, proof of Lemma 3.2.5, p. 33.

### The Hasse invariant on toroidal and minimal compactifications

`T0/hasse-invariant-minimal-compactification` (theorem)

Let X be the Siegel moduli space of principally polarised abelian schemes of dimension g with level K^p (prime to p, neat) over ℤ_(p), X^tor a toroidal and X* the minimal compactification (ShimuraCompactifications C5). Then Ha ∈ H⁰(X_{𝔽_p}, ω^{⊗(p−1)}) extends to Ha ∈ H⁰(X^tor_{𝔽_p}, ω^{⊗(p−1)}) as the Hasse invariant of the universal semi-abelian scheme, and descends to Ha ∈ H⁰(X*_{𝔽_p}, ω^{⊗(p−1)}): for g ≥ 2 by Hartogs, the boundary of X* having codimension g, and for g = 1 by inspection at the cusps (Tate curve). At a point x of X* lying in the boundary stratum of genus g′ < g, Ha(x) is the Hasse invariant of the abelian part of the Raynaud extension at any preimage of x in X^tor (Lemma 3.3.2), so the ordinary locus of X* contains the whole boundary in characteristic p's toric directions and is described by the abelian parts.

*Hypotheses and conventions.* The same holds for PEL data and Hilbert–Blumenthal data with the minimal compactifications of C5/C6; the Hilbert boundary comparison is ShimuraCompactifications C6/hilbert-hasse-boundary-comparison, which consumes this node.

*Proof outline.*
1. On X^tor apply T0/semi-abelian-hasse-invariant to the universal semi-abelian scheme (C5/integral-toroidal-space).
2. ω descends to X* (C5/integral-minimal-space, minimal-hodge-ampleness); for g ≥ 2 extend from X by Hartogs on the normal X*_{𝔽_p}; for g = 1 compute on the Tate curve.
3. Lemma 3.3.2: the pullback of Ha to a boundary point of X^tor is Ha of the Raynaud extension, equal to Ha(B)·unit (T0/semi-abelian-hasse-invariant).

*Prerequisites.* this roadmap: `T0/semi-abelian-hasse-invariant`, `T0/hasse-invariant-ordinary-locus`; other roadmaps: `ShimuraCompactifications:C5/integral-toroidal-space`, `ShimuraCompactifications:C5/integral-minimal-space`, `ShimuraCompactifications:C5/minimal-hodge-ampleness`.

*Acceptance.* For g = 1, Ha extends to the cusps with value 1 (the Tate curve is ordinary). Ha is a section of an ample line bundle on X*_{𝔽_p}, so its non-vanishing locus is affine.

*Sources.* SCH15, §3.2.2, p. 37 (arXiv v2); SCH15, §3.3, Lemma 3.3.2 (arXiv v2, III.3.2), PDF p. 54.

### The finite-level Hodge–Tate map over the toroidal boundary

`T0/hodge-tate-boundary-extension` (theorem)

Let 𝔛^tor(p^n) be the normalisation of a toroidal compactification of the Siegel (or Hilbert–Siegel, or Hilbert) variety in its full level-p^n generic fibre (C5/higher-level-toroidal-normalization), with universal semi-abelian scheme G and universal level structure. The Hodge–Tate map of the finite part, HT: G[p^n]^D ⊗ O → ω_G/p^n (T0/finite-hodge-tate-map, T0/semi-abelian-torsion), defined on the open part, extends uniquely to 𝔛^tor(p^n), compatibly with the toric/abelian pieces at the boundary. For Hilbert–Siegel data with F ≠ ℚ the extension uses the Koecher principle.

*Hypotheses and conventions.* Normality of 𝔛^tor(p^n) (C5/higher-level-toroidal-normalization) is what allows extension of sections across the boundary of codimension ≥ 1 through the description on charts; for F ≠ ℚ the Koecher principle (C5/normalized-koecher) replaces the chart computation.

*Proof outline.*
1. On a degeneration chart compute HT on the Mumford quotient (T0/semi-abelian-torsion): it vanishes on the toric part T[p^n], is HT of B[p^n] on the abelian part, and sends the classes of the p^n-th roots of the periods (the character-lattice part) to the toric forms dt_i/t_i (T0/multiplicative-hodge-tate-isomorphism); these glue to a map over the chart.
2. Uniqueness: 𝔛^tor(p^n) is normal and the open part is dense.
3. For Hilbert–Siegel data, extend the sections over the boundary by C5/normalized-koecher (BCGP §6.1.4).

*Prerequisites.* this roadmap: `T0/semi-abelian-torsion`, `T0/finite-hodge-tate-map`, `T0/multiplicative-hodge-tate-isomorphism`; other roadmaps: `ShimuraCompactifications:C5/higher-level-toroidal-normalization`, `ShimuraCompactifications:C5/normalized-koecher`, `ShimuraCompactifications:C4/formal-universal-degeneration`.

*Acceptance.* For the modular curve at level Γ(p^n), HT at the cusp ∞ vanishes on μ_{p^n} ⊂ E_q[p^n] and sends a point lifting the generator q^{1/p^n} of the quotient ℤ/p^n to dt/t, a generator of ω/p^n (Pilloni–Stroh: the map is trivial on the toric part).

*Sources.* PS16, §1.4, Proposition 1.5 (author copy; published Proposition 1.2), PDF p. 4; BCGP21, §6.1.4 (arXiv:1812.09269v3), PDF p. 141.

### The Hodge–Tate filtration of an abelian variety through its Raynaud extension

`T0/raynaud-hodge-tate-filtration` (theorem)

Let C be a complete algebraically closed extension of ℚ_p and A an abelian variety over C of dimension g. After semistable reduction (NeronModelsAndSemistableAbelianVarieties R11.3), let 𝒢̃ over O_C be the Raynaud extension of the connected Néron model, 0 → T → 𝒢̃ → B → 0 with T a torus of rank r and B an abelian scheme of dimension g − r, so that A^an = 𝒢̃^rig/Λ with Λ a lattice of rank r. Then T_pA is an extension 0 → T_p(𝒢̃[p^∞]) → T_pA → Λ ⊗ ℤ_p → 0, Lie A = Lie 𝒢̃, and the Hodge–Tate filtration of A is that of the p-divisible group 𝒢̃[p^∞] (height 2g − r, dimension g): Lie A ⊗ C(1) = Lie 𝒢̃ ⊗ C(1) ⊂ T_p(𝒢̃[p^∞]) ⊗ C ⊂ T_pA ⊗ C. Dually, under the Weil pairing the C-linear Hodge–Tate map T_pA^∨ ⊗ C → ω_A is computed on the dual Raynaud extension; the torus part T_p(T) = ℤ_p(1)^r of T_pA lies in the Hodge–Tate filtration, and the lattice part Λ ⊗ ℤ_p maps isomorphically onto the toric forms of the graded piece.

*Hypotheses and conventions.* C complete algebraically closed of residue characteristic p; A arbitrary (no good reduction hypothesis): this is how Scholze obtains the Hodge–Tate filtration for all points of the Siegel variety, including those reducing to the boundary.

*Proof outline.*
1. Pass to the semistable model and its Raynaud extension over O_C (R11.3/raynaud-extension-comparison, R11.3/rigid-uniformisation): A^an = 𝒢̃^rig/Λ and the p-adic uniformisation gives the extension of Tate modules.
2. The p-divisible group 𝒢̃[p^∞] is an extension of B[p^∞] by T[p^∞] = μ_{p^∞}^r; its Hodge–Tate map (T0/p-divisible-hodge-tate-map) kills T_p(T) (T0/semi-abelian-torsion) and Lie 𝒢̃ = Lie A.
3. Apply the naturality of the Hodge–Tate map (T0/hodge-tate-map-compatibilities) to T_p(𝒢̃[p^∞]) → T_pA and to the uniformisation 𝒢̃^rig → A^an; dimension count (g in 2g) identifies the filtrations (Scholze, proof of Proposition 3.3.1, following Scholze–Weinstein Proposition 4.15).

*Prerequisites.* this roadmap: `T0/p-divisible-hodge-tate-map`, `T0/hodge-tate-map-compatibilities`, `T0/semi-abelian-torsion`; other roadmaps: `NeronModelsAndSemistableAbelianVarieties:R11.3/raynaud-extension-comparison`, `NeronModelsAndSemistableAbelianVarieties:R11.3/rigid-uniformisation`, `NeronModelsAndSemistableAbelianVarieties:R11.3/semistable-reduction`.

*Acceptance.* For a Tate curve E_q, the Hodge–Tate filtration is ℤ_p(1) ⊗ C = T_pμ_{p^∞} ⊗ C ⊂ T_pE_q ⊗ C, the line spanned by the μ_{p^∞}-part.

*Sources.* SCH15, §3.3, Proposition 3.3.1 (arXiv v2, III.3.1), PDF p. 54.

### The Harder–Narasimhan filtration of a finite flat group scheme

`T0/harder-narasimhan-filtration` (definition)

Let K, v be as in T0/fargues-degree and G ≠ 0 a finite flat commutative group scheme of p-power order over O_K; 'subgroup' means closed finite flat subgroup scheme. G is semi-stable if μ(G′) ≤ μ(G) for every nonzero subgroup G′. Every such G has a unique filtration 0 = G₀ ⊊ G₁ ⊊ … ⊊ G_k = G by subgroups with G_{i+1}/G_i semi-stable and μ(G_i/G_{i−1}) > μ(G_{i+1}/G_i); its Harder–Narasimhan polygon HN(G) is the concave polygon from (0, 0) to (ht G, deg G) with slopes μ(G_i/G_{i−1}) of multiplicity ht(G_i/G_{i−1}). For every subgroup G′, deg G′ ≤ HN(G)(ht G′), and HN(G) is the concave envelope of the points (ht G′, deg G′). The filtration is Aut(G)-stable, compatible with valued extensions (K henselian), its slope-1 step is the multiplicative part and its slope-0 quotient the étale part, and Cartier duality exchanges the filtration of G^D with the orthogonals of the steps of G, slopes λ ↦ 1 − λ.

*Hypotheses and conventions.* Slopes and degrees from T0/fargues-degree; the existence proof is the formal Harder–Narasimhan argument in an exact category with a degree function that increases along generic isomorphisms (T0/fargues-degree-generic-isomorphism).

*Proof outline.*
1. Show that every G not semi-stable has a unique semi-stable subgroup of maximal slope and maximal height among those (Fargues 2010, Proposition 4), using Corollaire 5 (slopes in exact sequences and along generic isomorphisms).
2. Induct on the height to build the filtration (Théorème 2), exactly as for vector bundles; uniqueness from the uniqueness of the maximal destabilising subgroup.
3. Polygon properties (Proposition 7), functoriality (Remark 1), duality (Lemme 9, Corollaire 8) and Galois descent (Proposition 6).

*Prerequisites.* this roadmap: `T0/fargues-degree`, `T0/fargues-degree-properties`, `T0/fargues-degree-generic-isomorphism`.

*Uses.* Fargues 2011, §§7–8: the canonical subgroup is a Harder–Narasimhan step. Bijakowski–Pilloni–Stroh 2016; Pilloni 2020 §14: degree functions and HN polygons on Siegel varieties.

*API.*

- `TauCeti.HodgeTate.farguesSlope_le_of_semistable` (characterisation): G is semi-stable iff μ(G′) ≤ μ(G) for all nonzero subgroups G′, iff μ(G) ≤ μ(G/G′) for all proper nonzero G′.
- `TauCeti.HodgeTate.harderNarasimhanFiltration` (constructor): The unique filtration with semi-stable graded pieces of strictly decreasing slopes.
- `TauCeti.HodgeTate.harderNarasimhanPolygon` (constructor): HN(G): the concave polygon of the filtration.
- `TauCeti.HodgeTate.degree_le_harderNarasimhanPolygon` (relation): deg G′ ≤ HN(G)(ht G′) for every subgroup G′.
- `TauCeti.HodgeTate.harderNarasimhanFiltration_dual` (relation): The filtration of G^D is formed by the Cartier duals of the quotients G/G_i, with slopes 1 − μ_i.
- `TauCeti.HodgeTate.harderNarasimhanFiltration_aut` (functoriality): Every automorphism of G preserves the filtration; it commutes with valued field extensions.

*Unit tests.*

- `TauCeti.HodgeTate.harderNarasimhanFiltration_ordinary` (computation): For G = μ_p × ℤ/p over O_K the filtration is 0 ⊂ μ_p ⊂ G with slopes 1 and 0.
- `TauCeti.HodgeTate.harderNarasimhanFiltration_semistable` (degenerate): If G is semi-stable (e.g. G = E[p] for E supersingular with Ha(E) ≥ p/(p+1)) the filtration is 0 ⊂ G.
- `TauCeti.HodgeTate.harderNarasimhanFiltration_not_connectedEtale` (non-example): The HN filtration is not the connected–étale filtration: for E with Ha(E) < p/(p+1) the first step is the canonical subgroup, which is neither connected-étale nor multiplicative in general (deg C ∈ (0, 1)).

*Acceptance.* For G ordinary BT_n (μ_{p^n}^d × (ℤ/p^n)^{h−d}) the filtration is 0 ⊂ G^0 ⊂ G with slopes 1, 0. Fargues 2011: for a BT_n with small Hasse invariant the canonical subgroup is a step of the filtration (T3/canonical-subgroup-theorem (2)).

*Sources.* FAR10, §4.6, Théorème 2, PDF p. 13; FAR10, §4.9, Définition 9, PDF p. 14; FAR10, §4.9, Proposition 7, PDF p. 14.

### The discriminant divisor is the different of the group algebra

`T0/degree-different` (lemma)

Let A be a ring, t ∈ A a regular element and B a finite syntomic A-algebra étale outside V(t). The codifferent D^{-1}_{B/A} := {b ∈ B[1/t] | tr_{B/A}(bB) ⊂ A} is an invertible fractional ideal whose inverse, the different D_{B/A}, equals the discriminant ideal Δ_{B/A} = Fitt₀ Ω¹_{B/A}. For G = Spec B a finite locally free commutative group scheme over S = Spec A, generically étale, with structure map f, Δ_{G/S} = f*δ_G; consequently the conormal sheaf of the unit section of G is identified with the restriction of the inverse different along e, and for G monogenic, G = Spec O_K[T]/(f) with f(0) = 0, deg G = v(f′(0)) = Σ_{x ∈ G(O_K̄)∖0} v(x).

*Hypotheses and conventions.* B syntomic over A (finite flat group schemes over a valuation ring are), t regular.

*Proof outline.*
1. Grothendieck duality for Spec B ↪ Y smooth over S: f^!O_S = det L_{B/A}, and the trace identifies Hom_A(B, A) with Γ(det L); the section defining Δ maps to tr_{B/A} (Fargues 2010, Proposition 1).
2. For a group scheme, translation invariance gives Ω¹_{G/S} = f*ω_G, so Fitt₀ Ω¹ = f*Fitt₀ ω_G = f*δ_G (Fargues 2010, §2).
3. Monogenic case: ω_G = O_K/f′(0) and f′(0) = ∏_{x ≠ 0} (−x) up to a unit.

*Prerequisites.* this roadmap: `T0/fargues-degree`; libraries: `mathlib:KaehlerDifferential`.

*Acceptance.* For μ_p over ℤ_p[ζ_p]: f = (1 + T)^p − 1, f′(0) = p, deg μ_p = 1 = Σ_{x≠0} v(ζ_p^i − 1) = (p − 1)·1/(p − 1). Pilloni 2020 §14.9 uses the inverse different I^{-1} of the Cartier dual's algebra as the conormal sheaf along the unit section.

*Sources.* FAR10, §1.4, Proposition 1, PDF p. 5; FAR10, §2, PDF p. 7; PIL20, §14.9, before Lemma 14.9.2.1, PDF p. 105.

### Acceptance tests for T0

- α_{ℤ/p^n}(1) = dt/t generates ω_{μ_{p^n}} and α_{μ_{p^n}} = 0; Fargues's bound is sharp in the sense that the cokernel is uniform in ht G.
- deg μ_{p^n} = n, deg ℤ/p^n = 0, deg E[p] = 1, deg L⁰ = 1/(p+1) for an order-p subgroup of a supersingular E[p] over W(l).
- Ha of the Tate curve is 1; Ha of a supersingular elliptic curve is 0; Ha extends to X* (Hartogs for g ≥ 2, cusps for g = 1).

<a id="t1"></a>

## T1. Period rings and relative comparison: `HodgeTateAndCanonicalSubgroups:T1`

T1 applies the relative de Rham comparison of PadicHodgeTheory P8 to abelian schemes in degree one, with connection, filtration, the Weil pairing and Hodge tensors, and identifies the graded piece of the comparison with T0's Hodge–Tate map. It plans no period ring and no general comparison theorem. It fixes for the whole roadmap (including T6:comparison, which asked for it) the twist, Hodge–Tate weight and tensor-filtration conventions, imported from CohomologyComparisons CP.0 and ClassicalAdicEtaleCohomology H0.

*Dependencies: PadicHodgeTheory P8 and R06.5; CohomologyComparisons CP.0, CP.1; ClassicalAdicEtaleCohomology H0; AdicEtaleGeometry A1; PerfectoidSpaces P0; AutomorphicBundles B1 (absolute Hodge tensors); T0.*

Coverage: **planned**. Refinements left: Decompose the CM-point propagation of Hodge tensors once AutomorphicBundles B1 is planned at lemma level (gap).

### The relative de Rham comparison for abelian schemes

`T1/abelian-relative-comparison` (comparison)

Let K be a complete discretely valued extension of ℚ_p with perfect residue field, X a smooth adic space over K and f: A → X an abelian scheme of relative dimension g (the analytification of an algebraic abelian scheme over a smooth K-variety, as in the Shimura-variety applications). Let 𝕃 = (R¹f_*ℤ_p)^∨ ≅ T_pA, viewed as a ℤ_p-local system on X_proét, and ℋ = H¹_dR(A/X) with its Gauss–Manin connection ∇ and Hodge filtration 0 → ω_A → ℋ → Lie(A^∨) → 0. Then there is a canonical isomorphism of OB_dR-modules with connection and filtration R¹f_*ℤ_p ⊗ OB_dR ≅ ℋ ⊗_{O_X} OB_dR on X_proét, compatible with Frobenius-free tensor operations (duals, tensor products, the Weil pairing up to the twist ℤ_p(1)) and functorial in homomorphisms of abelian schemes. Taking gr⁰ gives the relative Hodge–Tate sequence of HodgeTateAndCanonicalSubgroups T2. Conventions (pinned by CohomologyComparisons CP.0 and ClassicalAdicEtaleCohomology H0): ℤ_p(1) = T_pμ_{p^∞}, C(i) = C ⊗ ℤ_p(1)^{⊗i}, the cyclotomic character has Hodge–Tate weight +1, Fil^r B_dR = t^r B_dR⁺ decreasing; so V_pA = T_pA ⊗ ℚ_p has Hodge–Tate weights 0 and 1, the weight-1 part being Lie(A) ⊗ C(1). These are the twist, weight and tensor-filtration conventions that HodgeTateAndCanonicalSubgroups T6:comparison imports from this layer.

*Hypotheses and conventions.* The proper smooth relative comparison (Scholze 2013, Theorem 8.8) is imported from PadicHodgeTheory P8 and not re-proved; this node is its degree-one abelian instance with the polarisation and tensor compatibilities.

*Proof outline.*
1. Apply the relative de Rham comparison of PadicHodgeTheory P8 to the proper smooth morphism f in degree one.
2. Identify R¹f_*ℤ_p with Hom(T_pA, ℤ_p) ≅ T_pA^∨(−1) through the Weil pairing (A3), and H¹_dR with its Hodge filtration (A4).
3. Functoriality and tensor compatibility follow from the functoriality of the comparison in proper smooth morphisms and its multiplicativity (cup products).

*Prerequisites.* other roadmaps: `PadicHodgeTheory:P8`, `PadicHodgeTheory:R06.5/abelian-variety-hodge-tate-weights`, `CohomologyComparisons:CP.0/twist-frobenius-filtration-normalization`, `ClassicalAdicEtaleCohomology:H0/tate-twists`, `AbelianSchemesAndArithmeticModuli:A4`, `AdicEtaleGeometry:A1/pro-etale-site-corrected`, `PerfectoidSpaces:P0/almost-basic-setup`.

*Acceptance.* For X a point and A = E an elliptic curve over K, the comparison reduces to the de Rham comparison of V_pE (PadicHodgeTheory R06.5/abelian-variety-hodge-tate-weights).

*Sources.* CS17, §2.2, Theorem 2.2.2 (arXiv:1511.02418v1), PDF p. 14.

### The graded comparison is the Hodge–Tate map of T0

`T1/hodge-tate-graded-comparison` (comparison)

In the situation of T1/abelian-relative-comparison with X = Spa(C, O_C) a point (C complete algebraically closed), the map T_pA^∨ ⊗ C → ω_A obtained from the de Rham comparison by taking gr⁰ (Fil⁰ OB_dR → OB_dR/Fil¹ = Ô) agrees with the C-linear Hodge–Tate map α_{A^∨[p^∞]} ⊗ C of HodgeTateAndCanonicalSubgroups T0 (the map x ↦ x*(dt/t) through the Weil pairing), with no sign, for A with good reduction and, through T0/raynaud-hodge-tate-filtration, for all A. In families, the relative gr⁰ map T_pA^∨ ⊗ Ô_X → ω_A ⊗ Ô_X agrees with the fibrewise Hodge–Tate maps. In particular the local Hodge–Tate map of the p-divisible group and the global one from the comparison agree (Caraiani–Scholze, Remark 4.2.8).

*Hypotheses and conventions.* Convention pinned by the roadmap: the map goes T_pA^∨ ⊗ C → ω_A with kernel Lie(A^∨)(1); a construction using T_pA must first apply the Weil-pairing duality of T0/hodge-tate-map-compatibilities (3).

*Proof outline.*
1. Both maps are natural in A and compatible with isogenies; reduce to the universal case over a Siegel tower, and there to a CM or Tate-curve point, where both are computed explicitly (the Tate curve: both send the generator of the character part to dt/t).
2. Rigidity: two natural transformations between the same functors that agree on a dense set of points agree (the ordinary locus is dense); alternatively compare through Faltings's construction as in Caraiani–Scholze Remark 4.2.8.

*Prerequisites.* this roadmap: `T1/abelian-relative-comparison`, `T0/p-divisible-hodge-tate-map`, `T0/hodge-tate-map-compatibilities`, `T0/raynaud-hodge-tate-filtration`; other roadmaps: `CohomologyComparisons:CP.1/hodge-tate-specialization`.

*Acceptance.* For the Tate curve both maps send the class corresponding to μ_{p^∞} to 0 and the class of ℚ_p/ℤ_p to dt/t.

*Sources.* CS17, §4.2, Remark 4.2.8 (arXiv:1511.02418v1), PDF p. 47; CS17, §4.2, Remark 4.2.8 (arXiv:1511.02418v1), PDF p. 47.

### Hodge tensors under the p-adic comparison

`T1/hodge-tensor-comparison` (theorem) — planet: *Hodge tensors under the p-adic comparison*

Let (G, X) be a Shimura datum of Hodge type with a symplectic embedding G ↪ GSp(V) and tensors (s_α) ⊂ V^⊗ cutting out G, and A → Sh_K the induced abelian scheme. The tensors s_α define absolute Hodge cycles s_{α,dR} ∈ ℋ^⊗ and s_{α,ét} ∈ (R¹f_*ℤ_p)^⊗ (AutomorphicBundles B1), and under the relative comparison of T1/abelian-relative-comparison, s_{α,ét} ⊗ 1 ↦ s_{α,dR} ⊗ 1. Consequently the comparison isomorphism and its Hodge–Tate graded piece are compatible with the G-structures, and the resulting torsors are G-torsors.

*Hypotheses and conventions.* The input that the tensors are absolute Hodge (Deligne) and that p-adic comparisons respect absolute Hodge cycles (Blasius, Wintenberger) is a proved dependency supplied by AutomorphicBundles B1/absolute-hodge-propagation, not an assumption of the Hodge conjecture.

*Proof outline.*
1. Blasius: for an abelian variety over a number field the de Rham comparison maps the étale components of absolute Hodge cycles to the de Rham components.
2. Propagate to families by AutomorphicBundles B1/absolute-hodge-propagation (horizontality and the principle B), and to the relative comparison by density of CM points.

*Prerequisites.* this roadmap: `T1/abelian-relative-comparison`; other roadmaps: `AutomorphicBundles:B1/absolute-hodge-propagation`, `AutomorphicBundles:B1/hodge-tensor-realizations`.

*Acceptance.* For G = GSp(V) the only tensor is the symplectic form, and the statement is the compatibility of the comparison with the Weil pairing.

*Sources.* CS17, §2.3, after Lemma 2.3.6 (arXiv:1511.02418v1), PDF p. 20.

### Acceptance tests for T1

- For an elliptic curve over K the comparison gives Hodge–Tate weights 0 and 1, and gr⁰ is α_{E^∨[p^∞]} ⊗ C with no sign.
- For GSp the tensor condition is the Weil pairing.

<a id="t2"></a>

## T2. Hodge–Tate exact sequence and torsors: `HodgeTateAndCanonicalSubgroups:T2`

T2, narrowed by RT-AREA-padic-1/22, owns the finite-level Hodge–Tate exact sequences (of a p-divisible group over O_C, of an abelian variety over C including bad reduction, and relatively on the pro-étale site of a smooth base), the Hodge–Tate filtration as a point of the (Lagrangian) flag variety with Plücker coordinates and the charts Fl_J, the PEL and Hodge-tensor flag conditions, the Tannakian notion of a filtered fibre functor of type μ, the Hodge–Tate parabolic reduction with its Levi torsor and the canonical isomorphism of that Levi torsor with the de Rham one. The period map on the perfectoid tower and the identifications built on it are PerfectoidShimuraVarieties S3's.

*Dependencies: T0, T1; AbelianSchemesAndArithmeticModuli A3–A4; AutomorphicBundles B0–B2; ShimuraData D3; PELModuli M0; AdicEtaleGeometry A1; Tau Ceti's dynamic parabolic and Levi subgroups; Mathlib's Grassmannian.*

Coverage: **planned**. Refinements left: Hecke and base-change compatibility of the parabolic reduction is an API item; promote it to a lemma node if a consumer needs it as a prerequisite.

### The Hodge–Tate exact sequence of a p-divisible group over O_C

`T2/p-divisible-hodge-tate-sequence` (theorem) — planet: *Hodge–Tate exact sequence*

Let C be a complete algebraically closed extension of ℚ_p and G a p-divisible group over O_C of height h and dimension d, with Cartier dual G^D. Then the sequence 0 → Lie(G) ⊗_{O_C} C(1) → T_pG ⊗_{ℤ_p} C → ω_{G^D} ⊗_{O_C} C → 0 is exact, where the second map is α_G ⊗ C (T0/p-divisible-hodge-tate-map) and the first is the C-linearisation of the dual map α_{G^D}^∨ twisted by ℤ_p(1) through the Cartier pairing T_pG × T_pG^D → ℤ_p(1). Integrally, α_G ⊗ 1: T_pG ⊗ O_C → ω_{G^D} has cokernel killed by p^{1/(p−1)} (T0/fargues-hodge-tate-cokernel) and the composite of the two maps is zero.

*Hypotheses and conventions.* Exactness holds after inverting p; integrally only the stated bounds hold.

*Proof outline.*
1. The composite vanishes by the Cartier pairing and the definition of α through dt/t (Scholze–Weinstein).
2. Ranks: dim C (Lie G ⊗ C) = d, dim ω_{G^D} ⊗ C = h − d (R07.1/dimension-plus-dual-dimension), and T_pG has rank h.
3. Surjectivity of α_G ⊗ C from T0/fargues-hodge-tate-cokernel; injectivity of the first map by the same applied to G^D and duality; exactness in the middle by counting dimensions.

*Prerequisites.* this roadmap: `T0/p-divisible-hodge-tate-map`, `T0/fargues-hodge-tate-cokernel`, `T0/hodge-tate-map-compatibilities`; other roadmaps: `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/dimension-plus-dual-dimension`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-divisible-tate-module`, `ClassicalAdicEtaleCohomology:H0/tate-twists`.

*Acceptance.* For G = μ_{p^∞}: 0 → C(1) → C(1) → 0 → 0; for G = ℚ_p/ℤ_p: 0 → 0 → C → C → 0. For G = E[p^∞] with E elliptic over O_C, both outer terms are one-dimensional.

*Sources.* SW13, Introduction, the Hodge–Tate sequence (arXiv:1211.6357v2), PDF p. 4; SW13, §4.3, Proposition 4.3.6 (arXiv:1211.6357v2), PDF p. 39.

### The Hodge–Tate sequence of an abelian variety

`T2/abelian-hodge-tate-sequence` (theorem) — planet: *Hodge–Tate sequence of an abelian variety*

Let C be a complete algebraically closed extension of ℚ_p and A an abelian variety over C of dimension g. There is a canonical exact sequence 0 → Lie(A^∨)(1) → T_pA^∨ ⊗_{ℤ_p} C → ω_A → 0 (the roadmap's convention, with Lie(A^∨)(1) := Lie(A^∨) ⊗ C(1)), functorial in A, compatible with isogenies, with endomorphisms and with polarisations; for A defined over a complete discretely valued K ⊂ C it is Gal(C/K)-equivariant. Dually, the Hodge–Tate filtration Lie A ⊗ C(1) ⊂ T_pA ⊗ C is a Lagrangian subspace for the Weil pairing of any principal polarisation. For A with good reduction it is the sequence of T2/p-divisible-hodge-tate-sequence for G = A^∨[p^∞]; in general it is obtained through the Raynaud extension (T0/raynaud-hodge-tate-filtration).

*Hypotheses and conventions.* No good-reduction hypothesis; the sequence for the analytification of A over C is the de Rham comparison's gr⁰ (T1/hodge-tate-graded-comparison).

*Proof outline.*
1. Good reduction: apply T2/p-divisible-hodge-tate-sequence to A^∨[p^∞], whose Cartier dual is A[p^∞] (Weil pairing, A3), so ω_{G^D} = ω_A and Lie G = Lie A^∨.
2. General A: semistable reduction after a finite extension and the Raynaud extension (T0/raynaud-hodge-tate-filtration): the toric part of T_pA^∨ lies in the kernel Lie(A^∨)(1), and the lattice part maps onto the toric forms of ω_A.
3. Lagrangian: the Weil pairing pairs Lie A ⊗ C(1) with itself to zero since the composite Lie A(1) → T_pA ⊗ C → ω_{A^∨} vanishes, and dimensions are g = half of 2g.

*Prerequisites.* this roadmap: `T2/p-divisible-hodge-tate-sequence`, `T0/raynaud-hodge-tate-filtration`, `T0/hodge-tate-map-compatibilities`, `T1/hodge-tate-graded-comparison`; other roadmaps: `AbelianSchemesAndArithmeticModuli:A3`, `AbelianSchemesAndArithmeticModuli:A4`.

*Acceptance.* For E elliptic with ordinary reduction, the filtration is T_pE^0 ⊗ C, the line of the connected part. Scholze's Lemma 3.3.4 reads the point of the flag variety off this sequence.

*Sources.* BHW, §5.3, Remark 5.15 (arXiv:1902.03985v4), PDF p. 23; SCH15, §3.3, Lemma 3.3.4 (arXiv v2, III.3.4), PDF p. 55.

### The relative Hodge–Tate sequence on the pro-étale site

`T2/relative-hodge-tate-sequence` (theorem)

Let X be a smooth adic space over a complete algebraically closed C/ℚ_p and A → X an abelian scheme (analytified). On X_proét there is a canonical exact sequence of Ô_X-modules 0 → Lie(A^∨) ⊗ Ô_X(1) → T_pA^∨ ⊗_{ℤ_p} Ô_X → ω_A ⊗ Ô_X → 0, with T_pA^∨ the ℤ_p-local system of A^∨, specialising at every rank-one point to T2/abelian-hodge-tate-sequence and compatible with pullback, isogenies, endomorphisms, polarisations and (for Hodge type) the tensors s_α.

*Hypotheses and conventions.* Only the finite-level relative sequence is planned here; its incarnation on the perfectoid tower and the period map are PerfectoidShimuraVarieties S1/S3's (owners entry RT-AREA-padic-1/22).

*Proof outline.*
1. gr⁰ of the relative comparison T1/abelian-relative-comparison (Fil⁰OB_dR → Ô_X), or directly: the relative Hodge–Tate map T_pA^∨ ⊗ Ô_X → ω_A ⊗ Ô_X is defined fibrewise by T0/p-divisible-hodge-tate-map on affinoid perfectoid objects.
2. Exactness is checked at rank-one points (T2/abelian-hodge-tate-sequence) since the terms are locally free Ô_X-modules (Scholze 2013, Ô is almost acyclic on affinoid perfectoids).
3. Compatibilities from T0/hodge-tate-map-compatibilities and T1/hodge-tensor-comparison.

*Prerequisites.* this roadmap: `T2/abelian-hodge-tate-sequence`, `T1/abelian-relative-comparison`, `T1/hodge-tensor-comparison`; other roadmaps: `AdicEtaleGeometry:A1/pro-etale-site-corrected`, `PerfectoidSpaces:P0/almost-basic-setup`.

*Acceptance.* For the universal elliptic curve over the modular curve, the sequence is 0 → ω^{-1}(1) → T_pE ⊗ Ô → ω → 0.

*Sources.* CS17, §2.2, the relative Hodge–Tate filtration (arXiv:1511.02418v1), PDF p. 15.

### The Hodge–Tate filtration as a point of the flag variety

`T2/hodge-tate-flag-point` (construction) — planet: *Hodge–Tate period point*

Let Λ be a free ℤ_p-module of rank 2g with a perfect alternating pairing ψ (the Siegel case; Λ with an 𝒪-action and hermitian or symplectic form in the PEL case), and Fl the Lagrangian Grassmannian of rank-g quotients Λ ⊗ C ↠ W with Lagrangian kernel (Fl ⊂ Gr(g, Λ), Mathlib's Module.Grassmannian of rank-g quotients). For an abelian variety A over C with a symplectic similitude trivialisation β: Λ ≅ T_pA^∨, the Hodge–Tate quotient T_pA^∨ ⊗ C ↠ ω_A defines π_HT(A, β) ∈ Fl(C). Fl carries the Plücker coordinates s_J (J ⊂ {1, …, 2g}, |J| = g, J containing exactly one of i, g + i for the Lagrangian charts) and the 2^g affinoid charts Fl_J = {|s_{J′}| ≤ |s_J| for all J′}, which cover Fl and are permuted transitively by GSp_2g(ℤ_p). The construction is functorial: for γ ∈ GSp(Λ ⊗ ℚ_p) with γΛ ⊂ Λ, π_HT(A′, β′) = γ·π_HT(A, β) when (A′, β′) is the corresponding isogenous pair.

*Hypotheses and conventions.* This node is the finite-level, pointwise construction (Scholze's Lemma 3.3.4 on points); the period map on the perfectoid tower, its continuity, equivariance and the pullback of 𝒪(1) are PerfectoidShimuraVarieties S1/S3's (RT-AREA-padic-1/22). Convention: quotients, not lines; for g = 1 the quotient line is ω_A, so the tautological quotient bundle pulls back to ω (the BHW convention).

*Proof outline.*
1. Define the point from the quotient map of T2/abelian-hodge-tate-sequence transported by β; the kernel Lie(A^∨)(1) is Lagrangian (T2/abelian-hodge-tate-sequence).
2. Plücker coordinates: the rank-g quotient is determined by the g × g minors of the 2g × g matrix of β-coordinates; Fl_J is the locus where s_J has maximal absolute value, and every point lies in some Fl_J.
3. Equivariance under isogenies from T0/hodge-tate-map-compatibilities.

*Prerequisites.* this roadmap: `T2/abelian-hodge-tate-sequence`, `T0/hodge-tate-map-compatibilities`; other roadmaps: `ShimuraData:D3/compact-dual`, `PELModuli:M0/symplectic-o-lattice`; libraries: `mathlib:Module.Grassmannian`.

*Uses.* Scholze 2015, Lemma 3.3.4 and §3.3: π_HT on C-points and the charts Fl_J. PerfectoidShimuraVarieties:S1/continuous-hodge-tate-map and S3: the period map on the tower is built from this pointwise construction. HodgeTateAndCanonicalSubgroups:T4: the balls B_r around integral points of Fl.

*API.*

- `TauCeti.HodgeTate.hodgeTateFlagPoint` (constructor): π_HT(A, β) ∈ Fl(C), the Hodge–Tate quotient of T_pA^∨ ⊗ C transported by β.
- `TauCeti.HodgeTate.hodgeTateFlagPoint_isLagrangian` (characterisation): The kernel of the quotient is Lagrangian for ψ.
- `TauCeti.HodgeTate.plucker` (constructor): The Plücker coordinates s_J of a rank-g quotient of Λ ⊗ C.
- `TauCeti.HodgeTate.lagrangianChart` (constructor): Fl_J = {|s_{J′}| ≤ |s_J| ∀J′} for the 2^g Lagrangian index sets J.
- `TauCeti.HodgeTate.lagrangianChart_cover` (relation): The Fl_J cover Fl and GSp_2g(ℤ_p) permutes them transitively.
- `TauCeti.HodgeTate.hodgeTateFlagPoint_equivariant` (functoriality): π_HT(A′, β′) = γ·π_HT(A, β) for the isogenous pair attached to γ.

*Unit tests.*

- `TauCeti.HodgeTate.hodgeTateFlagPoint_ordinaryElliptic` (computation): For E with ordinary reduction and β adapted to the connected–étale sequence, π_HT(E, β) is a ℚ_p-rational point of ℙ¹.
- `TauCeti.HodgeTate.hodgeTateFlagPoint_grassmannian` (compatibility): π_HT(A, β) is an element of Mathlib's Module.Grassmannian C (C^{2g}) g (rank-g quotients), lying in the Lagrangian locus.
- `TauCeti.HodgeTate.lagrangianChart_count` (computation): There are exactly 2^g Lagrangian charts Fl_J.
- `TauCeti.HodgeTate.hodgeTateFlagPoint_not_line` (non-example): For g = 1, using the line Lie(A^∨)(1) ⊂ T_pA^∨ ⊗ C instead of the quotient gives the point 'orthogonal' to π_HT; the two agree only after the Weil-pairing identification, so the quotient convention must be fixed.

*Acceptance.* For g = 1, Fl = ℙ¹ with coordinates s_1, s_2 and charts {|s_2| ≤ |s_1|}, {|s_1| ≤ |s_2|}.

*Sources.* SCH15, §3.3, the affinoids Fℓ_J (arXiv v2), PDF p. 58; SCH15, §3.3, Lemma 3.3.4 (arXiv v2, III.3.4), PDF p. 55.

### PEL and Hodge-type conditions on the Hodge–Tate filtration

`T2/pel-hodge-type-filtration` (theorem)

(PEL) Let (B, *, V, ψ) be a PEL datum with order 𝒪_B and A an abelian variety over C with 𝒪_B-action and polarisation of the corresponding type. Then the Hodge–Tate filtration Lie A ⊗ C(1) ⊂ T_pA ⊗ C is 𝒪_B ⊗ C-stable and Lagrangian for ψ, so π_HT lies in the closed subvariety Fl_{G,μ} ⊂ Fl of 𝒪_B-stable Lagrangian quotients with the Kottwitz determinant condition of the Hodge cocharacter μ. (Hodge type) For (G, X) of Hodge type with tensors (s_α) and β: Λ ≅ T_pA^∨ carrying s_α to s_{α,ét}, π_HT(A, β) lies in Fl_{G,μ} = G/P_μ ⊂ Fl, the flag variety of filtrations of type μ preserved by the tensors.

*Hypotheses and conventions.* μ is the Hodge cocharacter of the datum; the identification of Fl_{G,μ} with G/P_μ uses the parabolic convention of AutomorphicBundles B0/hodge-parabolic-convention (P_μ the stabiliser of the Hodge–Tate filtration, opposite to the Hodge filtration's parabolic).

*Proof outline.*
1. PEL: 𝒪_B-equivariance and isotropy from T0/hodge-tate-map-compatibilities (2), (3); the determinant condition from Lie A having the Kottwitz type (PELModuli M0/determinant-condition).
2. Hodge type: the tensors s_{α,ét} lie in Fil⁰ and are horizontal for the comparison (T1/hodge-tensor-comparison), so the filtration is split by a cocharacter of G_C conjugate to μ (Caraiani–Scholze Lemmas 2.3.6–2.3.7).

*Prerequisites.* this roadmap: `T2/hodge-tate-flag-point`, `T2/filtered-fibre-functor`, `T1/hodge-tensor-comparison`, `T0/hodge-tate-map-compatibilities`; other roadmaps: `PELModuli:M0/determinant-condition`, `PELModuli:M0/integral-pel-datum`, `AutomorphicBundles:B0/hodge-parabolic-convention`, `ShimuraData:D3/compact-dual`.

*Acceptance.* For the Siegel datum Fl_{G,μ} is the full Lagrangian Grassmannian; for the Hilbert datum it is Res_{F/ℚ}ℙ¹ ⊗ C = ∏_{τ: F → C} ℙ¹.

*Sources.* CS17, §2.3, Lemma 2.3.6 (arXiv:1511.02418v1), PDF p. 19.

### The Hodge–Tate parabolic reduction and its Levi torsor

`T2/hodge-tate-parabolic-reduction` (construction) — planet: *Hodge–Tate parabolic reduction*

Let (G, X) be a Shimura datum of Hodge (or PEL) type, Sh_K → Spec E its Shimura variety at level K = K_pK^p, 𝒮 the adic space over C of Sh_K, and A → 𝒮 the abelian scheme with tensors. On 𝒮_proét, the sheaf of trivialisations β: Λ ⊗ ℤ_p ≅ T_pA^∨ respecting tensors (up to the similitude) is a G(ℤ_p)-torsor 𝒫_ét, and the relative Hodge–Tate filtration (T2/relative-hodge-tate-sequence) defines a reduction of 𝒫_ét ×^{G(ℤ_p)} G_{Ô} to the parabolic P_μ: the P_μ-torsor 𝒫_HT of trivialisations sending the standard filtration of type μ to the Hodge–Tate filtration. Its Levi quotient ℳ_HT := 𝒫_HT ×^{P_μ} M_μ is the Hodge–Tate Levi torsor. Both are functorial in K (finite-level Hecke maps), in morphisms of data and in base change of C.

*Hypotheses and conventions.* Only the finite-level reduction on 𝒮_proét is planned here; its descent along π_HT on the perfectoid tower and the identification with the pullback of the Levi torsor of Fl_{G,μ} are PerfectoidShimuraVarieties S3's (RT-AREA-padic-1/22).

*Proof outline.*
1. 𝒫_ét is a torsor by the tensor-compatible comparison (T1/hodge-tensor-comparison) and pro-étale local triviality of T_pA^∨.
2. The Hodge–Tate filtration is of type μ at every point (T2/pel-hodge-type-filtration), so the subsheaf of filtration-adapted frames is a P_μ-torsor (Tau Ceti's dynamic parabolic P(μ) and Levi Z(μ) for the group-theoretic carriers).
3. Push out along P_μ → M_μ.

*Prerequisites.* this roadmap: `T2/relative-hodge-tate-sequence`, `T2/pel-hodge-type-filtration`, `T2/filtered-fibre-functor`, `T1/hodge-tensor-comparison`; other roadmaps: `AutomorphicBundles:B1/tensor-frame-torsor`, `AdicEtaleGeometry:A1/pro-etale-site-corrected`; libraries: `tauceti:TauCeti.Cocharacter.parabolic`, `tauceti:TauCeti.Cocharacter.levi`.

*Uses.* Caraiani–Scholze 2017, §2.3: M_dR ≅ M_p, from which automorphic bundles pull back along π_HT. PerfectoidShimuraVarieties:S3/hodge-levi-pullback: pullback of the Levi torsor along π_HT. HodgeTateAndCanonicalSubgroups:T6:comparison: the general logarithmic comparison agrees with this reduction for Hodge type.

*API.*

- `TauCeti.HodgeTate.etaleFrameTorsor` (constructor): 𝒫_ét, the G(ℤ_p)-torsor of tensor-preserving trivialisations of T_pA^∨ on 𝒮_proét.
- `TauCeti.HodgeTate.hodgeTateParabolicReduction` (constructor): 𝒫_HT ⊂ 𝒫_ét ×^{G(ℤ_p)} G_Ô, the P_μ-reduction given by the Hodge–Tate filtration.
- `TauCeti.HodgeTate.hodgeTateLeviTorsor` (constructor): ℳ_HT = 𝒫_HT ×^{P_μ} M_μ.
- `TauCeti.HodgeTate.hodgeTateParabolicReduction_hecke` (functoriality): Compatible with the finite-level Hecke maps Sh_{K′} → Sh_K and with prime-to-p Hecke correspondences.
- `TauCeti.HodgeTate.hodgeTateParabolicReduction_baseChange` (functoriality): Compatible with base change C → C′ and with morphisms of Shimura data.

*Unit tests.*

- `TauCeti.HodgeTate.hodgeTateLeviTorsor_modularCurve` (computation): For GL₂ and the modular curve, ℳ_HT corresponds to the pair of line bundles (ω^{-1}(1), ω) ⊗ Ô.
- `TauCeti.HodgeTate.hodgeTateParabolicReduction_torus` (degenerate): For a torus datum (G = T, μ central), P_μ = M_μ = T and 𝒫_HT = 𝒫_ét ×^{T(ℤ_p)} T_Ô.
- `TauCeti.HodgeTate.hodgeTateParabolicReduction_not_hodge` (non-example): The Hodge–Tate parabolic P_μ is opposite to the parabolic stabilising the Hodge filtration (AutomorphicBundles B0/hodge-parabolic-convention); using the Hodge filtration's parabolic gives a different reduction whose Levi torsor differs by the inverse of μ.

*Acceptance.* For the modular curve, ℳ_HT is the 𝔾_m × 𝔾_m-torsor of trivialisations of (ω^{-1}(1), ω) ⊗ Ô.

*Sources.* CS17, §2.3, before Lemma 2.3.6 (arXiv:1511.02418v1), PDF p. 19.

### The de Rham and Hodge–Tate Levi torsors agree

`T2/de-rham-hodge-tate-levi-comparison` (theorem) — planet: *Comparison of de Rham and Hodge–Tate torsors*

In the situation of T2/hodge-tate-parabolic-reduction, let ℳ_dR be the M_μ-torsor obtained from the Hodge filtration of H¹_dR(A/𝒮) with its tensors (the de Rham Levi torsor of AutomorphicBundles B1/filtration-reduction), pulled back to 𝒮_proét and extended to Ô. Then there is a canonical isomorphism of M_μ-torsors ℳ_dR ×^{M_μ} M_{μ,Ô} ≅ ℳ_HT, compatible with Hecke maps and morphisms of data, given on graded pieces by gr⁰ of the relative comparison (Caraiani–Scholze Lemma 2.3.8, Proposition 2.3.9). Consequently the automorphic vector bundle 𝒱_ρ of a representation ρ of M_μ satisfies 𝒱_ρ ⊗ Ô ≅ ℳ_HT ×^{M_μ} ρ.

*Hypotheses and conventions.* Uses the cyclotomic twist conventions of the comparison: the graded pieces of the Hodge filtration correspond to those of the Hodge–Tate filtration after twisting by Ô(i).

*Proof outline.*
1. The relative comparison (T1/abelian-relative-comparison) identifies gr^i of the Hodge filtration ⊗ Ô(−i) with the graded pieces of the Hodge–Tate filtration (T1/hodge-tate-graded-comparison).
2. Tensors match (T1/hodge-tensor-comparison), so the identification is one of M_μ-torsors.
3. Functoriality from that of the comparison.

*Prerequisites.* this roadmap: `T2/hodge-tate-parabolic-reduction`, `T1/abelian-relative-comparison`, `T1/hodge-tate-graded-comparison`, `T1/hodge-tensor-comparison`; other roadmaps: `AutomorphicBundles:B1/filtration-reduction`, `AutomorphicBundles:B2/automorphic-vector-bundles-from-representations-of-the-centralizer`.

*Acceptance.* For the modular curve: gr⁰ = ω ↔ ω ⊗ Ô and gr¹ = ω^{-1} ↔ ω^{-1}(1).

*Sources.* CS17, §2.3, Proposition 2.3.9 (arXiv:1511.02418v1), PDF p. 21.

### Filtered fibre functors and their type

`T2/filtered-fibre-functor` (definition)

Let G be a reductive group over a field E of characteristic 0, R an E-algebra and ω_R: Rep_E(G) → Mod_R the fibre functor V ↦ V ⊗ R. An exact tensor filtration of ω_R is a functorial decreasing (or, in Caraiani–Scholze's normalisation, ascending) filtration Fil^• of each V ⊗ R by direct summands, compatible with tensor products, duals and exact sequences. Its type at a geometric point is the conjugacy class of a cocharacter μ: 𝔾_m → G splitting it. Fpqc-locally on R (étale-locally when R is a field extension, and pro-étale locally on Ô-modules of perfectoid spaces), an exact tensor filtration of constant type μ is split by a cocharacter in the class of μ, so the frames transforming the standard filtration Fil^•(μ) into Fil^• form a P_μ-torsor, P_μ the parabolic stabilising Fil^•(μ). Exact tensor filtrations of type μ on ω_R are in bijection with R-points of the flag variety G/P_μ.

*Hypotheses and conventions.* Characteristic 0 coefficients (E ⊂ ℚ_p or ℚ_p itself); for integral coefficients only Rep of reductive G over ℤ_p with the same splitting result over a strictly henselian base. The convention for which parabolic stabilises which filtration is AutomorphicBundles B0/hodge-parabolic-convention: the Hodge–Tate filtration has stabiliser P_HT = P(μ) and the Hodge filtration P_H = P(μ^{-1}).

*Proof outline.*
1. Splitting of exact tensor filtrations by cocharacters (Saavedra Rivano; Ziegler) over fields, and fpqc-locally over rings; the stabiliser of the standard filtration is the dynamic parabolic P(μ) (Tau Ceti TauCeti.Cocharacter.parabolic).
2. Frames form a P_μ-torsor; points of G/P_μ classify the filtrations of type μ.

*Prerequisites.* other roadmaps: `AutomorphicBundles:B0/hodge-parabolic-convention`, `ShimuraData:D3/filtration-parabolic`; libraries: `tauceti:TauCeti.Cocharacter.parabolic`, `tauceti:TauCeti.Cocharacter.levi`, `mathlib:Module.Grassmannian`.

*Uses.* Caraiani–Scholze 2017, Lemma 2.3.6: the Hodge–Tate filtration has type μ, giving the P_μ-torsor P_p. HodgeTateAndCanonicalSubgroups:T6:comparison/lattice-hodge-tate-filtration: the Tannakian extraction of a flag of prescribed type (requested from T2). HodgeTateAndCanonicalSubgroups:T2/hodge-tate-parabolic-reduction: the P_μ-reduction.

*API.*

- `TauCeti.HodgeTate.ExactTensorFiltration` (structure): Exact tensor filtrations of the fibre functor ω_R of Rep_E(G).
- `TauCeti.HodgeTate.ExactTensorFiltration.type` (projection): The type: the conjugacy class of a splitting cocharacter (locally constant on Spec R).
- `TauCeti.HodgeTate.ExactTensorFiltration.splitLocally` (characterisation): Fpqc-locally a filtration of type μ is Fil^•(gμg^{-1}) for some g.
- `TauCeti.HodgeTate.ExactTensorFiltration.frameTorsor` (constructor): The P_μ-torsor of frames carrying Fil^•(μ) to the given filtration.
- `TauCeti.HodgeTate.ExactTensorFiltration.equivFlag` (equivalence): Filtrations of type μ ≅ (G/P_μ)(R).

*Unit tests.*

- `TauCeti.HodgeTate.ExactTensorFiltration.gl_grassmannian` (compatibility): For G = GL_n and μ of type (1^r, 0^{n−r}), filtrations of type μ are the elements of Mathlib's Module.Grassmannian R (R^n) (n − r).
- `TauCeti.HodgeTate.ExactTensorFiltration.trivial` (degenerate): For μ central (e.g. G a torus) the only filtration of type μ is the one given by the weights of μ, and the frame torsor is the trivial G-torsor.
- `TauCeti.HodgeTate.ExactTensorFiltration.not_arbitrary_filtration` (non-example): For G = GSp_{2g}, a filtration of the standard representation by a rank-g summand that is not Lagrangian is not an exact tensor filtration: it is not compatible with the symplectic form, an invariant tensor.

*Acceptance.* For G = GL_n and μ = (1, …, 1, 0, …, 0), an exact tensor filtration of type μ is a two-step filtration of the standard representation by a direct summand of rank r, and G/P_μ is the Grassmannian.

*Sources.* CS17, §2.3, before Lemma 2.3.6 (arXiv:1511.02418v1), PDF p. 19.

### Acceptance tests for T2

- μ_{p^∞} and ℚ_p/ℤ_p give the degenerate Hodge–Tate sequences; E[p^∞] gives one-dimensional outer terms.
- The Hodge–Tate filtration of a principally polarised A is Lagrangian; for the Siegel datum Fl_{G,μ} is the Lagrangian Grassmannian with 2^g charts; for the Hilbert datum it is ∏_τ ℙ¹.
- For the modular curve the Hodge–Tate Levi torsor is (ω^{−1}(1), ω) ⊗ Ô and matches the de Rham one.

<a id="t3"></a>

## T3. Canonical subgroups with quantitative bounds: `HodgeTateAndCanonicalSubgroups:T3`

T3 constructs canonical subgroups wherever the Hasse invariant is small, with the constants in the statements. Two independent routes are kept: Scholze's deformation-theoretic construction over p-adically complete flat ℤ_p^cycl-algebras (all p, ε < 1/2), and Fargues's pointwise characterisation over O_C as a Harder–Narasimhan step and as the kernel of a truncated Hodge–Tate map (p ≠ 2, Ha < 1/(2p^{n−1}) or 1/3^n). The layer proves levels, functoriality, isotropy and duality, the structure of geometric generic points, the change of Hasse radius under quotients by canonical and anticanonical subgroups, the Hodge–Tate map of the dual canonical subgroup, and the Hilbert canonical subgroup at arbitrary p, which is an 𝒪_F/p^n-module of rank one on geometric points but not the constant group scheme.

*Dependencies: T0 (Hasse invariants, Hodge–Tate maps, degrees, HN filtration), T2; HilbertModularVarietiesAndShimuraCurves H2 and ShimuraCompactifications C6 (Hilbert Hasse neighbourhoods); AdicSpacesPartII R2 (section domains); FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1–R07.2.*

Coverage: **planned**. Refinements left: Siegel extension of the quantitative domain comparison requested by OverconvergentAutomorphicForms O8 (Diao–Rosso–Wu §3.6, p > 2g, c_g + n − 1 < w ≤ n). p = 2 Hodge–Tate estimates of the dual canonical subgroup (gap; AIP 2018 appendix unread).

### The Hasse valuation and Hasse neighbourhoods

`T3/hasse-neighbourhood` (definition) — planet: *Hasse neighbourhood*

(Points) For a truncated Barsotti–Tate group G over O_K (K complete valued over ℚ_p, v(p) = 1), the Hasse valuation is Ha(G) := min(v(Ha(G ⊗ O_K/p)), 1) ∈ [0, 1], where Ha(G ⊗ O_K/p) is the Hasse invariant of the BT₁ G[p] ⊗ O_K/p (FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2) computed in a basis of det ω; it is independent of the basis and of valued extensions, and Ha(G) = Ha(G^D). (Families) For R a p-adically complete flat ℤ_p^cycl-algebra (or O_K-algebra) and A/R an abelian (or semi-abelian) scheme with reduction A₁/(R/p), A satisfies the Hasse condition of radius ε (0 ≤ ε < 1, ε ∈ v(ℤ_p^cycl)) if Ha(A₁) divides p^ε, i.e. there is u ∈ H⁰(Spf R, ω^{⊗(1−p)}) with u·Ha(A₁) = p^ε in R/p. For a formal model 𝔛 of a Shimura variety with universal A, the Hasse neighbourhood 𝔛(ε) is the formal scheme of pairs (f, u) as above modulo u ∼ u(1 + p^{1−ε}h); its generic fibre 𝒳(ε) is the open {|Ha| ≥ |p|^ε} of the generic fibre, and 𝒳(ε) ⊂ 𝒳(ε′) for ε ≤ ε′.

*Hypotheses and conventions.* Hasse invariant of BT₁ groups: owned by FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2 (RT-AREA-padic-1/26); for (semi-)abelian schemes it is T0/semi-abelian-hasse-invariant. Hilbert data use the total Hasse invariant (product of the partial Hasse invariants) of HilbertModularVarietiesAndShimuraCurves H2/ShimuraCompactifications C6; the Siegel and PEL data use T0's Ha. 𝔛(ε) is an open chart of the admissible blow-up of the ideal (H̃a, p^ε), not the whole blow-up (PAPER-SCHOLZE-15/E3).

*Proof outline.*
1. Pointwise: Fargues 2011 §2.2.1 (valuation of det ψ_G, truncated at 1); duality Ha(G) = Ha(G^D) from R07.2's LF.
2. Families: Scholze, Definition 3.2.12 and Lemma 3.2.13: locally 𝔛(ε) = Spf(R⟨u⟩/(u·H̃a − p^ε)) for a lift H̃a, flat over ℤ_p^cycl; this is the section domain of AdicSpacesPartII R2/section-valuation-domain and its formal model R2/section-domain-formal-model.

*Prerequisites.* this roadmap: `T0/semi-abelian-hasse-invariant`, `T0/hasse-invariant-minimal-compactification`; other roadmaps: `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`, `AdicSpacesPartII:R2/section-valuation-domain`, `AdicSpacesPartII:R2/section-domain-formal-model`, `HilbertModularVarietiesAndShimuraCurves:H2`, `ShimuraCompactifications:C6/hilbert-hasse-boundary-comparison`.

*Uses.* Scholze 2015, §§3.2.1–3.2.2: canonical subgroups exist on 𝔛(ε), ε < 1/2. Fargues 2011, Théorèmes 4 and 6: explicit bounds on Ha(G). BHW 2019, §§3–5: Hilbert Hasse neighbourhoods X(ε) and overconvergence radii.

*API.*

- `TauCeti.HodgeTate.hasseValuation` (constructor): Ha(G) ∈ [0, 1] for a truncated BT group over O_K.
- `TauCeti.HodgeTate.hasseValuation_dual` (relation): Ha(G^D) = Ha(G).
- `TauCeti.HodgeTate.hasseValuation_eq_zero_iff` (characterisation): Ha(G) = 0 iff G is ordinary.
- `TauCeti.HodgeTate.hasseNeighbourhood` (constructor): 𝔛(ε): pairs (f, u) with u·Ha = p^ε mod p, modulo u ∼ u(1 + p^{1−ε}h).
- `TauCeti.HodgeTate.hasseNeighbourhood_generic` (characterisation): The generic fibre of 𝔛(ε) is {|Ha| ≥ |p|^ε}.
- `TauCeti.HodgeTate.hasseNeighbourhood_mono` (relation): 𝔛(ε) → 𝔛(ε′) is an open immersion on generic fibres for ε ≤ ε′.

*Unit tests.*

- `TauCeti.HodgeTate.hasseValuation_ordinary` (degenerate): Ha(μ_{p^∞}[p] ⊕ ℚ_p/ℤ_p[p]) = 0.
- `TauCeti.HodgeTate.hasseValuation_le_one` (characterisation): 0 ≤ Ha(G) ≤ 1 for every BT₁ over O_K (truncation at 1, because it is computed in O_K/p).
- `TauCeti.HodgeTate.hasseNeighbourhood_zero` (computation): 𝒳(0) is the ordinary locus {|Ha| = 1}.
- `TauCeti.HodgeTate.hasseNeighbourhood_not_blowup` (non-example): 𝔛(ε) is not the full admissible blow-up of (H̃a, p^ε): the chart where p^ε generates is omitted.

*Acceptance.* For an ordinary BT₁, Ha = 0; for E[p] with E supersingular, Ha(E[p]) ∈ (0, 1]. 𝒳(0) is the ordinary locus of the generic fibre.

*Sources.* FAR11, §2.2.1, PDF p. 7; SCH15, §3.2.2, Definition 3.2.12, p. 38 (arXiv v2); SCH15, §3.2.2, after Lemma 3.2.13, p. 38.

### Lifting subgroups modulo p with explicit error

`T3/subgroup-lifting` (theorem)

Let R be a p-adically complete flat ℤ_p^cycl-algebra, G a finite locally free commutative group scheme over R and C₁ ⊂ G ⊗_R R/p a finite locally free subgroup. If, for H = (G ⊗ R/p)/C₁, multiplication by p^ε on the co-Lie complex ℓ̌_H is homotopic to 0 for some 0 ≤ ε < 1/2, then there is a finite locally free subgroup C ⊂ G over R with C ⊗ R/p^{1−ε} = C₁ ⊗ R/p^{1−ε}.

*Hypotheses and conventions.* The deformation input is Illusie's obstruction theory for flat commutative group schemes (Illusie, Complexe cotangent et déformations II, Théorème VII.4.2.5), recorded as a gap of the libraries: no roadmap plans Illusie's cotangent-complex deformation theory of group schemes (see gaps). Remark 3.2.3 gives an elementary alternative through ring deformation theory with worse, unspecified constants; the packet uses the explicit form.

*Proof outline.*
1. Apply Illusie's theorem with A = R/p, B₁ = R/p^{2−ε}, B₂ = {(x, y) ∈ R/p^{2−2ε} × R/p | x ≡ y mod p^{1−ε}}; the transition J₁ → J₂ is multiplication by p^ε, so the obstruction o₂ vanishes.
2. This lifts from R/p^{1−ε} to R/p^{2−2ε} preserving the reduction; since 2 − 2ε > 1, iterate and pass to the limit by p-adic completeness.

*Prerequisites.* libraries: `mathlib:IsAdicComplete`, `tauceti:TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat`.

*Acceptance.* For ε = 0 and H étale, C₁ lifts uniquely (H étale means ℓ̌_H ≃ 0).

*Sources.* SCH15, §3.2.1, Corollary 3.2.2, p. 32 (arXiv v2); SCH15, §3.2.1, Corollary 3.2.2, p. 32.

### Sections agreeing to high order are equal

`T3/section-rigidity` (lemma)

Let R be a p-adically complete flat ℤ_p^cycl-algebra and X/R a scheme with Ω¹_{X/R} killed by p^ε, ε ≥ 0. If s, t ∈ X(R) agree in X(R/p^δ) for some δ > ε, then s = t.

*Hypotheses and conventions.* δ > ε strictly.

*Proof outline.*
1. Lifts of s̄ to R/p^{2δ} form a torsor under Hom(Ω¹ ⊗ R/p^δ, R/p^δ); every such homomorphism lands in p^{δ−ε}R/p^δ, so s and t agree in X(R/p^{2δ−ε}).
2. Iterate, gaining δ − ε > 0 each time, and use p-adic completeness.

*Prerequisites.* libraries: `mathlib:IsAdicComplete`, `mathlib:KaehlerDifferential`.

*Acceptance.* Used with Ω¹ of A[p^m]/C killed by p^ε to show that two candidate canonical subgroups coincide.

*Sources.* SCH15, §3.2.1, Lemma 3.2.4, p. 32 (arXiv v2).

### Weak and strong canonical subgroups of level m

`T3/canonical-subgroup` (definition) — planet: *Canonical subgroup*

Let R be a p-adically complete flat ℤ_p^cycl-algebra and A → Spec R an abelian scheme of dimension g with reduction A₁ over R/p, and m ≥ 1. A has a weak canonical subgroup of level m if Ha(A₁)^{(p^m−1)/(p−1)} divides p^ε for some ε < 1/2; it is then the unique closed subgroup C_m ⊂ A[p^m], finite locally free over R, with C_m ≡ ker F^m modulo p^{1−ε} (T3/canonical-subgroup-theorem). If moreover Ha(A₁)^{p^m} divides p^ε, C_m is a (strong) canonical subgroup. In valuation terms at a rank-one point, weak means Ha ≤ ε(p−1)/(p^m − 1) and strong means Ha ≤ ε/p^m. The same definition applies to truncated Barsotti–Tate groups of level ≥ m over R, and to semi-abelian schemes on the toroidal boundary through the finite part (T0/semi-abelian-torsion).

*Hypotheses and conventions.* p is arbitrary, including p = 2: the deformation-theoretic construction (Scholze) is uniform in p; Fargues's pointwise Harder–Narasimhan construction needs p ≠ 2 and the bounds of T3/canonical-subgroup-theorem (2). The base ring may be replaced by any p-adically complete flat algebra over a sufficiently ramified extension of ℤ_p containing elements of valuation ε.

*Proof outline.*
1. Existence and uniqueness by T3/canonical-subgroup-theorem.
2. Strong ⇒ weak since (p^m − 1)/(p − 1) ≤ p^m.

*Prerequisites.* this roadmap: `T3/hasse-neighbourhood`, `T0/semi-abelian-hasse-invariant`, `T0/semi-abelian-torsion`.

*Uses.* Scholze 2015, Theorem 3.2.15: canonical Frobenius lifts and the anticanonical tower (PerfectoidShimuraVarieties S1). BHW 2019, §§3–5: Hilbert canonical subgroups and the anticanonical tower. HodgeTateAndCanonicalSubgroups:T4: canonical and anticanonical loci at Γ₀(p^n) level. HodgeTateAndCanonicalSubgroups:T5: Igusa torsors of the dual canonical subgroup and ω^int.

*API.*

- `TauCeti.HodgeTate.canonicalSubgroup` (constructor): C_m ⊂ A[p^m] on the locus where Ha^{(p^m−1)/(p−1)} | p^ε, ε < 1/2.
- `TauCeti.HodgeTate.canonicalSubgroup_modFrobenius` (characterisation): C_m ≡ ker F^m mod p^{1−ε}, and C_m is the unique closed finite locally free subgroup with this property.
- `TauCeti.HodgeTate.canonicalSubgroup_points` (characterisation): C_m(R′) ⊇ {s ∈ A[p^m](R′) | s ≡ 0 mod p^{(1−ε)/p^m}}, with equality for R′ integrally closed in R′[1/p] (corrected form of Scholze's Corollary 3.2.6, PAPER-SCHOLZE-15/E17).
- `TauCeti.HodgeTate.canonicalSubgroup_degree` (relation): At a rank-one point with Ha(A[p^m]) < 1/(2p^{m−1}) (p ≥ 5), deg C_m = mg − ((p^m − 1)/(p − 1))·Ha.
- `TauCeti.HodgeTate.canonicalSubgroup_isotropic` (relation): C_m is maximal totally isotropic for the Weil pairing of a principal polarisation.
- `TauCeti.HodgeTate.canonicalSubgroup_baseChange` (functoriality): Formation of C_m commutes with base change R → R′ of p-adically complete flat algebras.
- `TauCeti.HodgeTate.canonicalSubgroup_level` (relation): C_{m′} = C_m[p^{m′}] for m′ ≤ m (strong subgroups).

*Unit tests.*

- `TauCeti.HodgeTate.canonicalSubgroup_ordinary` (degenerate): If Ha(A₁) is a unit, C_m = A[p^m]^0 (multiplicative).
- `TauCeti.HodgeTate.canonicalSubgroup_ellipticDegree` (computation): For E elliptic over O_C with Ha(E[p]) = w < 1/2 and p ≥ 5, deg C₁ = 1 − w and deg(E[p]/C₁) = w.
- `TauCeti.HodgeTate.canonicalSubgroup_not_constant` (non-example): C_m is in general not isomorphic to the constant group (ℤ/p^m)^g over R: for A ordinary it is multiplicative, μ_{p^m}^g étale-locally; only its geometric generic points are (ℤ/p^m)^g.
- `TauCeti.HodgeTate.canonicalSubgroup_points_strict` (non-example): The printed equality of Corollary 3.2.6 fails over non-normal R′: for R′ = {(a, b) ∈ O_C² | a ≡ b mod p^{1/(p−1)}}, A ordinary, ε = 0, s = (ζ_p, 1) ∈ C₁(R′) is not ≡ 0 mod p^{1/p}.

*Acceptance.* For A ordinary (Ha a unit) C_m is the connected part A[p^m]^0, of multiplicative type.

*Sources.* SCH15, §3.2.1, Definition 3.2.7, p. 34 (arXiv v2); SCH15, §3.2.1, Definition 3.2.7, p. 34.

### Existence, uniqueness and characterisations of canonical subgroups

`T3/canonical-subgroup-theorem` (theorem) — planet: *Canonical subgroup theorem*

(1) (Families, all p.) Let R be a p-adically complete flat ℤ_p^cycl-algebra and A/R an abelian scheme with Ha(A₁)^{(p^m−1)/(p−1)} | p^ε, ε < 1/2. There is a unique closed subgroup C_m ⊂ A[p^m], finite locally free over R, with C_m = ker F^m modulo p^{1−ε}; for every p-adically complete flat R-algebra R′, C_m(R′) ⊇ {s ∈ A[p^m](R′) | s ≡ 0 mod p^{(1−ε)/p^m}}, with equality when R′ is integrally closed in R′[1/p]. (2) (Points, p ≠ 2.) Let G be a truncated Barsotti–Tate group of level n, height h and dimension d < h over O_C with Ha(G) < 1/(2p^{n−1}) if p ≥ 5 and Ha(G) < 1/3^n if p = 3. Then the Harder–Narasimhan filtration of G (Fargues 2010) has a step C with C(O_C) free of rank d over ℤ/p^n; deg(G/C) = ((p^n − 1)/(p − 1))·Ha(G); for 1 ≤ k ≤ n, C_k := C[p^k] is the analogous step of G[p^k] and C_k ⊗ O_C/p^{1−p^{k−1}Ha(G)} is the kernel of F^k; C(O_C) = ker α_{G, n−((p^n−1)/(p−1))Ha(G)}, the kernel of the Hodge–Tate map of G reduced modulo p^{n−((p^n−1)/(p−1))Ha(G)}; and C(O_C)^⊥ ⊂ G^D(O_C) is the corresponding step of G^D. When G = A[p^n] for A as in (1) over R = O_C and both apply, the two subgroups coincide.

*Hypotheses and conventions.* (1) is Scholze's Corollary 3.2.6 with the integral-points formula corrected as recorded in PAPER-SCHOLZE-15/E17 (equality only for R′ integrally closed in R′[1/p]); uniqueness is proved through T3/section-rigidity, not through the printed formula. (2) is Fargues 2011, Théorèmes 4 and 6, stated for p ≠ 2; p = 2 is covered by (1) only. For n = 1 and p ≥ 5 the bound is Ha(G) < 1/2; for p = 3 it is Ha(G) < 1/3.

*Proof outline.*
1. (1) Existence: H₁ := ker(V^m: A₁^{(p^m)} → A₁) has co-Lie complex Lie A₁^{(p^m)} → Lie A₁ with determinant Ha^{(p^m−1)/(p−1)}, so p^ε ≃ 0 on ℓ̌_{H₁}; apply T3/subgroup-lifting to ker F^m ⊂ A₁[p^m].
2. (1) Uniqueness and points: if C, C′ are both ≡ ker F^m mod p^{1−ε}, the universal point of C maps to a point of A[p^m]/C′ vanishing mod p^{1−ε}, and Ω¹ of A[p^m]/C′ is killed by p^ε < p^{1−ε}, so T3/section-rigidity gives C ⊂ C′.
3. (2) Fargues: for n = 1, C is the closure of ker α_{G,1−Ha(G)} (T0/finite-hodge-tate-map) and deg(G/C) = Ha(G) by T0/fargues-hodge-tate-cokernel and the Oort–Tate computation; induct on n using T3/quotient-hasse-radius (Ha(p^{-1}C/C) = p·Ha(G)) and the Harder–Narasimhan formalism (degree properties T0/fargues-degree-properties, T0/fargues-degree-generic-isomorphism).

*Prerequisites.* this roadmap: `T3/subgroup-lifting`, `T3/section-rigidity`, `T3/canonical-subgroup`, `T0/finite-hodge-tate-map`, `T0/fargues-hodge-tate-cokernel`, `T0/harder-narasimhan-filtration`, `T0/fargues-degree-properties`, `T0/fargues-degree-generic-isomorphism`; other roadmaps: `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/oort-tate-classification`.

*Acceptance.* For E ordinary, C₁ = E[p]^0 = μ_p étale-locally and ker α_{E[p]} = E[p]^0(O_C). For E with Ha(E) = 1/4 and p ≥ 5, deg C₁ = 3/4.

*Sources.* SCH15, §3.2.1, Corollary 3.2.6, p. 33 (arXiv v2); SCH15, §3.2.1, proof of Corollary 3.2.6, p. 33; FAR11, §7.5, Théorème 6, PDF p. 38; FAR11, §7.5, Théorème 6 (7), PDF p. 38; FAR11, §6.5, Théorème 4, PDF p. 32.

### Levels, functoriality, duality and generic points of canonical subgroups

`T3/canonical-subgroup-properties` (theorem)

Let R be a p-adically complete flat ℤ_p^cycl-algebra and A, B abelian schemes over R; canonical means strong (T3/canonical-subgroup). (i) If A has a canonical subgroup C_m of level m, it has one of every level m′ ≤ m, and C_{m′} = C_m[p^{m′}] ⊂ C_m. (ii) If f: A → B is a homomorphism and both have canonical subgroups of level m, then f(C_m) ⊂ D_m; in particular C_m is stable under endomorphisms (e.g. an 𝒪_F-action). (iii) For a principal polarisation λ, C_m is maximal totally isotropic for the Weil pairing on A[p^m], and pointwise C_m(O_C)^⊥ ⊂ A^∨[p^m](O_C) is the canonical subgroup of A^∨ at every rank-one point (p ≠ 2: Fargues 2011, Proposition 11 and Corollaire 1). (iv) If x̄ is a geometric point of Spec R[1/p], C_m(x̄) ≅ (ℤ/p^m)^g. (v) Formation of C_m commutes with base change R → R′.

*Hypotheses and conventions.* (iv) needs the strong condition (Ha^{p^m} | p^ε, ε < 1/2); for m = 1 the weak subgroup already has (ℤ/p)^g geometric points since it has order p^g and is killed by p. The printed proofs of (i)–(ii) use the incorrect equality of Corollary 3.2.6 (PAPER-SCHOLZE-15/E17); the packet proves them through T3/section-rigidity. The duality statement over families: totally isotropic by uniqueness (the orthogonal of C_m also satisfies the defining congruence).

*Proof outline.*
1. (i), (ii), (v): uniqueness in T3/canonical-subgroup-theorem (1) applied to C_m[p^{m′}], f(C_m) and the base change, each of which satisfies the defining congruence modulo p^{1−ε}, via T3/section-rigidity.
2. (iii): ker F^m is totally isotropic mod p^{1−ε}, so C_m^⊥ satisfies the defining congruence of the canonical subgroup and equals C_m by uniqueness; pointwise duality from Fargues 2011 Proposition 11.
3. (iv): reduce to R = O_K with K algebraically closed (open-and-closed locus and specialisation); if C_m(K) ≇ (ℤ/p^m)^g there is s ∈ C_m ∩ A[p] outside C₁, whose image t in A[p]/C₁ is ≡ 0 mod p^{(1−ε)/p^m}; T3/section-rigidity with δ = (1 − ε)/p^m > ε/p^m gives t = 0, a contradiction.

*Prerequisites.* this roadmap: `T3/canonical-subgroup-theorem`, `T3/section-rigidity`, `T3/canonical-subgroup`; other roadmaps: `AbelianSchemesAndArithmeticModuli:A3`.

*Acceptance.* For A ordinary, C_m = A[p^m]^0 and C_m(x̄) = μ_{p^m}^g(x̄) ≅ (ℤ/p^m)^g.

*Sources.* SCH15, §3.2.1, Proposition 3.2.8(i), p. 34 (arXiv v2); SCH15, §3.2.1, Proposition 3.2.8(ii), p. 34; SCH15, §3.2.1, Proposition 3.2.8(iv), p. 34.

### Quotients by canonical and anticanonical subgroups and the Hasse radius

`T3/quotient-hasse-radius` (theorem)

(1) Let A/R have a canonical subgroup C_{m₁} of level m₁ (radius ε < 1/2). Then Ha(A/C_{m₁}) = Ha(A)^{p^{m₁}} modulo p^{1−ε}, and B := A/C_{m₁} has a canonical subgroup D_{m₂} of level m₂ iff A has one of level m = m₁ + m₂; then 0 → C_{m₁} → C_m → D_{m₂} → 0 is exact and compatible with 0 → C_{m₁} → A → B → 0. (2) (Points, p ≠ 2.) For a BT₂ G over O_C with Ha(G) < 1/(p+1) and C its canonical subgroup of level 1, Ha(p^{-1}C/C) = p·Ha(G); if 1/(p+1) ≤ Ha(G) < 1/2 then Ha(p^{-1}C/C) ≥ 1 − Ha(G). (3) (Anticanonical quotients.) If A′ has a weak canonical subgroup C′ of level 1 on 𝔛(ε), ε < 1/2, and D ⊂ A′[p] is a subgroup of order p^g with D ∩ C′ = 0, then A′/D has Hasse valuation Ha(A′)/p, and (A′/D)/(A′[p]/D) ≅ A′: dividing by a canonical subgroup multiplies the Hasse radius by p, dividing by an anticanonical subgroup divides it by p.

*Hypotheses and conventions.* (1) needs the strong condition at level m₁; the exactness in (1) also uses p^{m₂}C_m ⊂ C_{m₁}, proved by the same congruence argument (not written in Scholze's proof). (3) is the content of Scholze's Theorem 3.2.15(iii): 𝒳(p^{-1}ε) ≅ 𝒳_{Γ₀(p)}(ε)_a by A ↦ (A/C, A[p]/C).

*Proof outline.*
1. (1): modulo p^{1−ε}, A/C_{m₁} = A/ker F^{m₁} = A^{(p^{m₁})}, whose Hasse invariant is Ha(A)^{p^{m₁}}; the exact sequence by uniqueness and T3/section-rigidity, using 0 → ker F^{m₁}_A → ker F^m_A → ker F^{m₂}_B → 0 mod p^{1−ε}.
2. (2): E = p^{-1}ker F/ker F ≅ G[p]^{(p)} has H̃a(E) = H̃a(G)^{⊗p}, and C ≡ ker F mod p^{1−w} (Fargues 2011, Théorème 5).
3. (3): for A with |Ha| ≥ |p|^{ε/p}, A′ = A/C has radius ε by (1), and D = A[p]/C meets the weak canonical subgroup of A′ trivially (T3/section-rigidity); conversely A′/D ≅ A.

*Prerequisites.* this roadmap: `T3/canonical-subgroup-theorem`, `T3/canonical-subgroup-properties`, `T3/section-rigidity`.

*Acceptance.* For E ordinary, E/E[p]^0 ≅ E^{(p)} is ordinary (Ha 0 ↦ 0). For E with Ha(E) = 1/(2p), Ha(E/C₁) = 1/2 and Ha(E/D) = 1/(2p²) for D anticanonical.

*Sources.* SCH15, §3.2.1, proof of Proposition 3.2.8(iii), p. 35 (arXiv v2); FAR11, §7.4, Théorème 5, PDF p. 37; SCH15, §3.2.2, Theorem 3.2.15(iii), p. 40 (arXiv v2); AIP15, Appendix, quotient by an anticanonical subgroup (arXiv:1212.3812), PDF p. 29.

### The Hodge–Tate map of the dual canonical subgroup

`T3/canonical-subgroup-hodge-tate` (theorem) — planet: *Hodge–Tate map of the canonical subgroup*

Let C be a complete algebraically closed extension of ℚ_p, A/O_C an abelian scheme (or truncated BT_n of dimension g) with Hasse valuation w = Ha(A[p]) satisfying the bound of T3/canonical-subgroup-theorem (2) (p ≥ 3), and C_n its canonical subgroup of level n. Then C_n(O_C) = ker(α_{A[p^n]} mod p^{n−((p^n−1)/(p−1))w}), and the Hodge–Tate map of the Cartier dual of the canonical subgroup, α_{C_n^D} ⊗ 1: C_n^D(O_C) ⊗ O_C → ω_{C_n} = ω_A/p^n, induces an isomorphism C_n^D(O_C) ⊗ O_C/p^{n−w/(p−1)} ≅ ω_A ⊗ O_C/p^{n−w/(p−1)}, so that ω_A ⊗ O_C contains the O_C-span of α(C_n^D(O_C)) with cokernel killed by p^{w/(p−1)}. In families over a Hasse neighbourhood 𝒳(ε) these statements hold on O⁺ with w replaced by the radius ε (Andreatta–Iovita–Pilloni).

*Hypotheses and conventions.* p ≥ 3 for the Fargues bounds; the families version over Hasse neighbourhoods follows AIP (Siegel) and AIP (Hilbert); constants as in AIP. C_n^D is identified with A^∨[p^n]/C_n^⊥ through the Weil pairing (T3/canonical-subgroup-properties (iii)).

*Proof outline.*
1. Pointwise: Fargues 2011 Théorème 6 (7) gives C_n(O_C) as the kernel of the truncated Hodge–Tate map; T0/fargues-hodge-tate-cokernel bounds the cokernel of α; the degree deg(A[p^n]/C_n) = ((p^n−1)/(p−1))w controls the image.
2. Families: apply over each rank-one point and use normality of the formal model of 𝒳(ε) (AIP).

*Prerequisites.* this roadmap: `T3/canonical-subgroup-theorem`, `T3/canonical-subgroup-properties`, `T0/fargues-hodge-tate-cokernel`, `T0/multiplicative-hodge-tate-isomorphism`, `T0/finite-hodge-tate-map`.

*Acceptance.* For A ordinary (w = 0), C_n = A[p^n]^0, C_n^D is étale and α identifies (C_n^D)(O_C) ⊗ O_C/p^n with ω_A/p^n (T0/multiplicative-hodge-tate-isomorphism).

*Sources.* FAR11, §7.5, Théorème 6 (7), PDF p. 38; AIP15, §3.2, Proposition 3.2.1 (arXiv:1212.3812), PDF p. 12.

### Canonical subgroups of Hilbert–Blumenthal abelian schemes at arbitrary p

`T3/hilbert-canonical-subgroup` (theorem) — planet: *Hilbert canonical subgroup*

Let F be a totally real field of degree g, p any prime (possibly ramified in F, possibly 2), 𝒪_p = 𝒪_F ⊗ ℤ_p, and A a Hilbert–Blumenthal abelian scheme (𝒪_F-action, Rapoport or Deligne–Pappas condition as in HilbertModularVarietiesAndShimuraCurves H2) over a p-adically complete flat O-algebra R lying over the Hasse neighbourhood X(ε) for the total Hasse invariant. If ε ≤ p^{−(n+1)} (a uniform sufficient radius for every p, used in the BHW formal construction), then A has a canonical subgroup C_n ⊂ A[p^n] of level n (T3/canonical-subgroup); it is 𝒪_F-stable (T3/canonical-subgroup-properties (ii)); its integral group scheme is finite locally free of rank p^{ng} over R and in general not étale (its special fibre may be multiplicative); and at every geometric point x̄ of the generic fibre C_n(x̄) is a free 𝒪_F/p^n-module of rank one. The Hodge–Tate position bounds of HodgeTateAndCanonicalSubgroups T4 use stronger bounds, recorded separately there.

*Hypotheses and conventions.* The integral subgroup is not identified with the constant group 𝒪_F/p^n: only its geometric generic points are. p = 2 is included through Scholze's construction (T3/canonical-subgroup-theorem (1)), which needs only ε < 1/2 and the strong condition; the BHW radius ε ≤ p^{−(n+1)} implies Ha^{p^n} | p^{1/p} and 1/p < 1/2 for every p. The total Hasse invariant and the Hilbert Hasse neighbourhoods come from HilbertModularVarietiesAndShimuraCurves H2 and ShimuraCompactifications C6.

*Proof outline.*
1. Existence: on X(ε) with ε ≤ p^{−(n+1)}, Ha^{p^n} divides p^{p^n ε} with p^nε ≤ 1/p < 1/2, so T3/canonical-subgroup-theorem (1) applies (strong canonical subgroup of level n).
2. 𝒪_F-stability from functoriality (T3/canonical-subgroup-properties (ii)); rank p^{ng} because C_n ≡ ker F^n modulo p^{1−ε} and ker F^n has rank p^{ng}.
3. Generic points: T3/canonical-subgroup-properties (iv) gives (ℤ/p^n)^g; 𝒪_F-stability and the Rapoport condition (Lie A locally free of rank one over 𝒪_F ⊗ R) make it a free 𝒪_F/p^n-module of rank one (BHW).

*Prerequisites.* this roadmap: `T3/canonical-subgroup`, `T3/canonical-subgroup-theorem`, `T3/canonical-subgroup-properties`, `T3/hasse-neighbourhood`; other roadmaps: `HilbertModularVarietiesAndShimuraCurves:H2`, `ShimuraCompactifications:C6/hilbert-near-ordinary-model`.

*Acceptance.* For F = ℚ, C_n ⊂ E[p^n] is the classical canonical subgroup of the modular curve, cyclic of order p^n on geometric generic points.

*Sources.* BHW, §7.1, Definition 7.1(1) (arXiv:1902.03985v4), PDF p. 28.

### Acceptance tests for T3

- Ordinary A: C_m = A[p^m]^0.
- p ≥ 5, Ha(E) = 1/4: deg C₁ = 3/4.
- Quotient radii: Ha(A/C) = p·Ha(A), Ha(A/D) = Ha(A)/p for D anticanonical.
- Hilbert, p = 2 and p = 3, ramified F: existence for ε ≤ p^{−(n+1)}; generic points free of rank one over 𝒪_F/p^n; integral group of rank p^{ng} not constant.

<a id="t4"></a>

## T4. Canonical/anticanonical geometry and period estimates: `HodgeTateAndCanonicalSubgroups:T4`

T4 defines the canonical and anticanonical loci at Γ₀(p^n)-level by subgroup conditions, shows that the canonical locus is a section, and does the radius bookkeeping of the Atkin–Lehner isomorphisms AL_n: X_{Γ₀(p^n)}(p^nε)_a ≅ X(ε) and the Frobenius tower. It fixes the Hodge–Tate coordinate z, the left fractional-linear action and the automorphy factor cz + d with its cocycle law, defines the balls B_r(𝒪_p : 1), B_r(1 : p𝒪_p) in Res ℙ¹, and proves BHW's Proposition 5.18 with its constants c_p, including the case of p ramified in F, which BHW's own proof does not cover.

*Dependencies: T2 (flag point), T3; HilbertModularVarietiesAndShimuraCurves H4; PELModuli M1; ShimuraData D3; AdicSpacesPartII R2.*

Coverage: **planned**. Refinements left: The partial-Hasse improvement under U_𝔭 and the all-direction v/p improvement requested by O0 belong with O6's Hecke operators; confirm ownership there.

### Canonical and anticanonical loci at Γ₀(p^n)-level

`T4/canonical-anticanonical-loci` (definition) — planet: *Canonical and anticanonical loci*

Let X be the Siegel, Hilbert or PEL Shimura variety at prime-to-p level with Hasse neighbourhoods X(ε) (T3/hasse-neighbourhood), ε small enough that the universal (semi-)abelian scheme A over X(ε) has a weak canonical subgroup C ⊂ A[p] of level 1 and, where needed, a canonical subgroup C_n of level n (T3/canonical-subgroup). Let X_{Γ₀(p^n)} parametrise (A, D) with D ⊂ A[p^n] a totally isotropic (𝒪_F-stable, for Hilbert data locally free of rank one over 𝒪_F/p^n on geometric points) subgroup of the appropriate order, and X_{Γ₀(p^n)}(ε) the preimage of X(ε) under (A, D) ↦ A. The canonical locus X_{Γ₀(p^n)}(ε)_c is the open and closed subspace where D = C_n; the anticanonical locus X_{Γ₀(p^n)}(ε)_a is the open and closed subspace where D[p] ∩ C = 0. Both are defined on generic fibres by these subgroup conditions, and on formal models through the integral C_n and the schematic closure of D.

*Hypotheses and conventions.* Hilbert data: X_{Γ₀*(p^n)} with BHW's level structure Φ_n: C ↪ A^∨[p^n] étale locally isomorphic to 𝒪_F/p^n (the dual abelian variety carries the level structure in BHW's convention). The canonical locus needs a canonical subgroup of level n, i.e. ε within the radius of T3/hilbert-canonical-subgroup or T3/canonical-subgroup-theorem; the anticanonical locus only needs the level-1 weak canonical subgroup.

*Proof outline.*
1. Openness and closedness: the conditions D = C_n and D[p] ∩ C = 0 are open and closed on the finite étale cover X_{Γ₀(p^n)}(ε) → X(ε) (comparison of finite étale subgroups).
2. For the Siegel case these loci and their open immersions are PerfectoidShimuraVarieties S1/anticanonical-open-immersions and S1/anticanonical-locus-level-p; this node gives the general definition they use.

*Prerequisites.* this roadmap: `T3/canonical-subgroup`, `T3/hilbert-canonical-subgroup`, `T3/hasse-neighbourhood`; other roadmaps: `HilbertModularVarietiesAndShimuraCurves:H4`, `PELModuli:M1/level-structure`.

*Uses.* Scholze 2015, Theorem 3.2.15: anticanonical open immersions (PerfectoidShimuraVarieties S1). BHW 2019, §5.2, Theorem 5.11: the anticanonical tower is perfectoid. OverconvergentAutomorphicForms:O2: domains of overconvergent Hilbert forms.

*API.*

- `TauCeti.HodgeTate.canonicalLocus` (constructor): X_{Γ₀(p^n)}(ε)_c = {(A, D) : D = C_n}.
- `TauCeti.HodgeTate.anticanonicalLocus` (constructor): X_{Γ₀(p^n)}(ε)_a = {(A, D) : D[p] ∩ C = 0}.
- `TauCeti.HodgeTate.anticanonicalLocus_isClopen` (characterisation): Both loci are open and closed in X_{Γ₀(p^n)}(ε).
- `TauCeti.HodgeTate.anticanonicalLocus_forget` (functoriality): The forgetful maps X_{Γ₀(p^{n+1})}(ε)_a → X_{Γ₀(p^n)}(ε)_a, (A, D) ↦ (A, D[p^n]), give the anticanonical tower.
- `TauCeti.HodgeTate.canonicalLocus_section` (relation): X(ε) → X_{Γ₀(p^n)}(ε)_c, A ↦ (A, C_n), is an isomorphism (T4/canonical-locus-isomorphism).

*Unit tests.*

- `TauCeti.HodgeTate.anticanonicalLocus_ordinary` (degenerate): At ε = 0 (ordinary locus), the anticanonical locus parametrises D étale-locally complementary to A[p]^0, i.e. D ≅ (ℤ/p)^g étale-locally.
- `TauCeti.HodgeTate.canonicalLocus_modularCurve` (computation): For the modular curve and n = 1 the two loci partition X_{Γ₀(p)}(ε) into the canonical component (degree 1 over X(ε)) and the anticanonical component (degree p over X(ε)).
- `TauCeti.HodgeTate.anticanonicalLocus_not_complement` (non-example): For Hilbert data with several primes above p, 'D different from C' is not 'D ∩ C = 0': the anticanonical condition must be imposed at every prime above p.

*Acceptance.* For the modular curve and n = 1, X_{Γ₀(p)}(ε) = X_{Γ₀(p)}(ε)_c ⊔ X_{Γ₀(p)}(ε)_a for ε < p/(p+1).

*Sources.* BHW, §5.2 (arXiv:1902.03985v4), PDF p. 21; SCH15, §3.2.2, Theorem 3.2.15(iii), p. 40 (arXiv v2).

### The canonical locus is a section of the Γ₀(p^n)-cover

`T4/canonical-locus-isomorphism` (theorem)

In the situation of T4/canonical-anticanonical-loci, A ↦ (A, C_n) defines an isomorphism X(ε) ≅ X_{Γ₀(p^n)}(ε)_c of adic spaces (and of formal models after normalisation), inverse to the forgetful map; it is compatible with the forgetful maps in n, with prime-to-p Hecke correspondences and with base change.

*Hypotheses and conventions.* ε within the radius of existence of the strong canonical subgroup of level n.

*Proof outline.*
1. C_n is totally isotropic and (for Hilbert data) 𝒪_F-stable of the right type (T3/canonical-subgroup-properties), so A ↦ (A, C_n) is a section of the finite étale map X_{Γ₀(p^n)}(ε) → X(ε) landing in the canonical locus.
2. A section of a finite étale map is an open and closed immersion; its image is X_{Γ₀(p^n)}(ε)_c by uniqueness of C_n.

*Prerequisites.* this roadmap: `T4/canonical-anticanonical-loci`, `T3/canonical-subgroup-properties`, `T3/canonical-subgroup-theorem`.

*Acceptance.* For the modular curve, X_{Γ₀(p)}(ε)_c → X(ε) has degree 1.

*Sources.* SCH15, §3.2.2, Theorem 3.2.15(ii), p. 39 (arXiv v2).

### Atkin–Lehner identifies the anticanonical locus with a smaller Hasse neighbourhood

`T4/atkin-lehner-anticanonical` (theorem) — planet: *Atkin–Lehner and the anticanonical tower*

For n ≥ 1 and ε within the radius of T3/hilbert-canonical-subgroup (Hilbert data) or ε < 1/2 (Siegel data), the map AL_n: X_{Γ₀(p^n)}(p^nε)_a → X(ε), (A, D) ↦ A/D, is an isomorphism; its inverse sends B ∈ X(ε) to (B/C_n(B), B[p^n]/C_n(B)) up to the identification (B/C_n)/(B[p^n]/C_n) ≅ B. Equivalently X(p^{−n}ε) ≅ X_{Γ₀(p^n)}(ε)_a by A ↦ (A/C_n, A[p^n]/C_n). Under these isomorphisms the anticanonical tower … → X_{Γ₀(p^{n+1})}(ε)_a → X_{Γ₀(p^n)}(ε)_a corresponds to the Frobenius tower … → X(p^{−n−1}ε) → X(p^{−n}ε) given by division by the canonical subgroup of level 1, which reduces to the relative Frobenius modulo p^{1−δ}, δ = ((p+1)/p)ε. The radius changes by the factor p^n: dividing by C_n multiplies the Hasse valuation by p^n, dividing by an anticanonical subgroup divides it by p^n (T3/quotient-hasse-radius).

*Hypotheses and conventions.* The Hilbert statement uses the total Hasse invariant; the Siegel statement is Scholze's Theorem 3.2.15(ii)–(iii) (whose open immersions are PerfectoidShimuraVarieties S1's); this node is the radius bookkeeping both use. BHW use the radius change p^nε ↔ ε for AL_n without separate proof; it is the inverse of T3/quotient-hasse-radius (1) iterated.

*Proof outline.*
1. A ↦ (A/C_n, A[p^n]/C_n) is well defined on X(p^{−n}ε) by T3/quotient-hasse-radius (1): A/C_n has radius ε; A[p^n]/C_n meets the canonical subgroup of A/C_n trivially (T3/quotient-hasse-radius (3)).
2. The inverse is (A′, D) ↦ A′/D; composition is the identity since (A/C_n)/(A[p^n]/C_n) = A/A[p^n] ≅ A.
3. Frobenius tower: T3/quotient-hasse-radius (1) at level 1 and the congruence C₁ ≡ ker F.

*Prerequisites.* this roadmap: `T4/canonical-anticanonical-loci`, `T3/quotient-hasse-radius`, `T3/canonical-subgroup-properties`.

*Acceptance.* For the modular curve, AL₁: X_{Γ₀(p)}(pε)_a ≅ X(ε) is the Atkin–Lehner involution w_p restricted to the anticanonical component.

*Sources.* BHW, §5.2, proof of Theorem 5.11 (arXiv:1902.03985v4), PDF p. 22; SCH15, §3.2.2, after the proof of Theorem 3.2.15, p. 41 (arXiv v2).

### The Hodge–Tate coordinate, the fractional-linear action and the factor cz + d

`T4/hodge-tate-coordinate` (definition)

Let F be totally real of degree g, 𝒪_p = 𝒪_F ⊗ ℤ_p, and Fl = Res_{𝒪_F/ℤ}ℙ¹ (the flag variety of the Hilbert datum; for F = ℚ, Fl = ℙ¹), with Fl(C) = ℙ¹(𝒪_p ⊗ C) for C complete algebraically closed. On the affine chart {(z : 1)} = Res_{𝒪_F/ℤ}𝔾_a, z is the Hodge–Tate coordinate: for a point (A, α: 𝒪_p² ≅ T_pA^∨) of the infinite-level tower, ω_A is a rank-one 𝒪_p ⊗ C-module (on the generic fibre) and π_HT(A, α) is the point (HT(α(1, 0)) : HT(α(0, 1))) of ℙ¹(𝒪_p ⊗ C) given by the Hodge–Tate images of the two basis vectors (T2/hodge-tate-flag-point); z is its affine coordinate where HT(α(0, 1)) generates, with BHW's normalisation (Definition 2.3). GL₂(𝒪_p) acts on Fl by fractional-linear transformations on the left, z(γx) = (az(x) + b)/(cz(x) + d) for γ = (a b; c d), and j(γ, x) := cz(x) + d satisfies the cocycle law j(γδ, x) = j(γ, δx)·j(δ, x). On the anticanonical tower, where c ∈ p𝒪_p for γ ∈ Γ₀(p), j(γ, x) ∈ 𝒪_p^× ⊗ (1 + p^x·…) is a unit. Calculations done after splitting F in the coefficient field descend to the original coefficient field because z and j are defined over ℚ_p ⊗ 𝒪_F-points without choosing embeddings.

*Hypotheses and conventions.* Convention: left action and the formula z(γx) = (az + b)/(cz + d); converting to a right action inverts γ explicitly (OverconvergentAutomorphicForms O0 request). The pullback of 𝒪(1) along π_HT and the period map on the tower are PerfectoidShimuraVarieties S3's (owners entry RT-AREA-padic-1/22); this node fixes only the coordinate and the automorphy factor.

*Proof outline.*
1. Define z on the chart {s₂ ≠ 0} of Res ℙ¹ as s₁/s₂ in the Plücker coordinates of T2/hodge-tate-flag-point.
2. The fractional-linear formula is the action of GL₂ on ℙ¹ in homogeneous coordinates; the cocycle law is the chain rule for j = d(γz)/dz up to det γ.
3. Descent: z ∈ 𝒪_p ⊗ C is defined without splitting F; after a finite extension splitting F, z = (z_σ)_σ and each z_σ is the coordinate of the σ-component (BHW Remark 5.21).

*Prerequisites.* this roadmap: `T2/hodge-tate-flag-point`; other roadmaps: `ShimuraData:D3/compact-dual`; libraries: `mathlib:Module.Grassmannian`.

*Uses.* BHW 2019, §§3, 5, 7: overconvergent weights κ(cz + d) define the automorphy factor. OverconvergentAutomorphicForms:O2/hilbert-automorphy-factor: the Hilbert automorphy factor and cocycle law. HodgeTateAndCanonicalSubgroups:T5/aip-hodge-tate-comparison: s equivariant for cz + d.

*API.*

- `TauCeti.HodgeTate.hodgeTateCoordinate` (constructor): z: the affine coordinate s₁/s₂ on the chart {s₂ ≠ 0} of Res_{𝒪_F/ℤ}ℙ¹.
- `TauCeti.HodgeTate.fractionalLinear_action` (functoriality): z(γx) = (az(x) + b)/(cz(x) + d) for γ = (a b; c d) ∈ GL₂(𝒪_p).
- `TauCeti.HodgeTate.automorphyFactor` (constructor): j(γ, x) := cz(x) + d.
- `TauCeti.HodgeTate.automorphyFactor_cocycle` (relation): j(γδ, x) = j(γ, δx)·j(δ, x).
- `TauCeti.HodgeTate.automorphyFactor_unit` (relation): For γ ∈ Γ₀(p) and x on the anticanonical tower, j(γ, x) is a unit in 𝒪_p ⊗ O⁺.
- `TauCeti.HodgeTate.hodgeTateCoordinate_descent` (compatibility): After splitting F, z = (z_σ)_{σ: F → L} with z_σ the coordinate of the σ-factor; the formulas descend to 𝒪_p ⊗ O⁺.

*Unit tests.*

- `TauCeti.HodgeTate.automorphyFactor_identity` (degenerate): j(1, x) = 1.
- `TauCeti.HodgeTate.fractionalLinear_upperTriangular` (computation): For γ = (a b; 0 d), z(γx) = (a z(x) + b)/d.
- `TauCeti.HodgeTate.automorphyFactor_cocycle_test` (characterisation): For γ = (1 0; c 1), δ = (1 0; c′ 1): j(γδ, x) = (c + c′)z + 1 = j(γ, δx)·j(δ, x).
- `TauCeti.HodgeTate.automorphyFactor_not_rightAction` (non-example): With the right action x·γ the factor is cz + d for γ^{-1}, not for γ: the cocycle law fails for the naive formula j(γ, x) = cz + d with z(xγ) = (az + b)/(cz + d).

*Acceptance.* For F = ℚ and γ = (1 0; c 1), z(γx) = z/(cz + 1).

*Sources.* BHW, §2, Definition 2.3 (arXiv:1902.03985v4), PDF p. 8; BHW, §3.3, Lemma 3.19 (arXiv:1902.03985v4), PDF p. 13.

### Balls around the integral points of the Hilbert flag variety

`T4/flag-variety-balls` (definition)

For L a complete extension of ℚ_p, r ∈ (0, 1] ∩ |L^×| and x ∈ Res_{𝒪_F/ℤ}𝔾_a(𝒪_p), the ball B_r(x) := x + t·Res_{𝒪_F/ℤ}𝔾̂_a with |t| = r is an open affinoid subspace of Res_{𝒪_F/ℤ}ℙ¹ over L; B_0(𝒪_p : 1) := 𝒪_p ⊂ ℙ¹(𝒪_p) via a ↦ (a : 1), and B_r(𝒪_p : 1) is the union of the balls of radius r around the points of 𝒪_p; analogously B_r(𝒪_p^× : 1) and B_r(1 : p𝒪_p) (around the points (1 : pb)). On C-points, B_r(𝒪_p : 1)(C) = 𝒪_p + t·(𝒪_p ⊗ O_C) inside 𝒪_p ⊗ C, where 𝒪_p ⊗ O_C is the integral closure (BHW's convention), so the definition is meaningful for p ramified in F.

*Hypotheses and conventions.* The integral structure Res 𝔾̂_a(C) = (𝒪_p ⊗ O_C)^∼ is the integral closure of 𝒪_F ⊗ O_C in F ⊗ C = C^Σ; for p unramified this is 𝒪_p ⊗ O_C itself.

*Proof outline.*
1. Define the balls as images of the closed unit polydisc under affine maps over L, glued for the finitely many cosets of t𝒪_p in 𝒪_p (Res 𝔾̂_a is a product of discs after splitting).
2. GL₂(𝒪_p) permutes the balls: Γ₀(p) preserves B_r(𝒪_p : 1) and B_r(1 : p𝒪_p) (T4/hodge-tate-coordinate).

*Prerequisites.* this roadmap: `T4/hodge-tate-coordinate`; other roadmaps: `AdicSpacesPartII:R2/generic-fibre-functor-d`; libraries: `tauceti:TauCeti.Huber.Pair`.

*Uses.* BHW 2019, Proposition 5.18: images of the canonical and anticanonical loci under π_HT. OverconvergentAutomorphicForms:O2: evaluation of locally analytic weights on cz + d.

*API.*

- `TauCeti.HodgeTate.flagBall` (constructor): B_r(x) = x + t·Res 𝔾̂_a, |t| = r.
- `TauCeti.HodgeTate.integralBall` (constructor): B_r(𝒪_p : 1), B_r(𝒪_p^× : 1), B_r(1 : p𝒪_p) as unions of balls.
- `TauCeti.HodgeTate.integralBall_points` (characterisation): B_r(𝒪_p : 1)(C) = 𝒪_p + t(𝒪_p ⊗ O_C)^∼.
- `TauCeti.HodgeTate.integralBall_mono` (relation): B_r ⊂ B_{r′} for r ≤ r′.
- `TauCeti.HodgeTate.integralBall_gamma0` (functoriality): Γ₀(p) preserves B_r(𝒪_p : 1) and B_r(1 : p𝒪_p).

*Unit tests.*

- `TauCeti.HodgeTate.integralBall_one` (degenerate): B_1(ℤ_p : 1) is the closed unit disc {|z| ≤ 1} for F = ℚ.
- `TauCeti.HodgeTate.integralBall_disjoint` (computation): For F = ℚ and r < 1, B_r(ℤ_p : 1) and B_r(1 : pℤ_p) are disjoint.
- `TauCeti.HodgeTate.integralBall_ramified` (non-example): For p ramified in F, 𝒪_p ⊗ O_C is not the integral closure: B_r must be defined with the integral closure, or the ball misses points of 𝒪_p ⊗ C of norm ≤ r.

*Acceptance.* For F = ℚ, B_r(ℤ_p : 1) = {z : |z − a| ≤ r for some a ∈ ℤ_p}.

*Sources.* BHW, §5.3, Definition 5.17, PDF p. 24 (arXiv:1902.03985v4).

### Hodge–Tate images of the canonical and anticanonical loci (BHW Proposition 5.18)

`T4/period-map-inclusions` (theorem) — planet: *Hodge–Tate period estimates (BHW Prop. 5.18)*

Let 1 > r > 0, m ≥ 1 with p^{−m} ≤ r, and 0 ≤ ε ≤ 1/(c_p p^m) with c_p = 2 for p ≥ 5, c_p = 3 for p = 3, c_p = 4 for p = 2. Then π_HT(X_{Γ(p^∞)}(ε)_c) ⊂ B_r(1 : p𝒪_p) and π_HT(X_{Γ(p^∞)}(ε)_a) ⊂ B_r(𝒪_p : 1). More precisely, with n = m + 1 and x = n − p^nε/(p−1), every point of the anticanonical locus has π_HT ∈ B_{|p^x|}(𝒪_p : 1). The same ε serves all primes above p. The inequalities are exactly what is needed to evaluate a locally analytic weight on cz + d.

*Hypotheses and conventions.* π_HT on the perfectoid tower is PerfectoidShimuraVarieties S1/S3's; the inclusions are statements about its values at (C, C⁺)-points, which are T2/hodge-tate-flag-point. Ramified p: BHW's proof identifies ℙ¹(𝒪_p ⊗ O_C) with ℙ¹(O_C)^Σ, true only for p unramified (sourceIssues); the packet's proof uses only the generic point π_HT(z) ∈ ℙ¹(C^Σ) and the integral-closure balls of T4/flag-variety-balls, which covers ramified p (see T4/ramified-period-comparison).

*Proof outline.*
1. Let A₀^∨ be the semi-abelian model over O_C and V := ker(T_pA₀^∨ ⊗ O_C → ω_{A₀}) the kernel of the integral Hodge–Tate map; it is saturated, and π_HT(z) is read off V (T2/hodge-tate-flag-point).
2. With n = m + 1, the canonical subgroup H_n of A₀^∨ exists (ε ≤ 1/(c_p p^{n−1})) and its Hodge–Tate map has cokernel of degree ε/(p − 1) (T3/canonical-subgroup-hodge-tate).
3. Degree count in the kernel N of the truncated Hodge–Tate map (y = n − ε(p^n−1)/(p−1)): V/p^y and H_n ⊗ O_C/p^y are free of rank g inside N and agree modulo p^x, x = n − p^nε/(p−1).
4. Canonical case: H_n has coordinates (1 : 0) mod p, so z ∈ p𝒪_p + p^x(…); anticanonical: (c : 1) mod p, so z ∈ 𝒪_p + p^x(…); and |p^x| ≤ p^{−m} ≤ r since p^nε/(p−1) < 1.

*Prerequisites.* this roadmap: `T2/hodge-tate-flag-point`, `T4/flag-variety-balls`, `T4/canonical-anticanonical-loci`, `T3/canonical-subgroup-hodge-tate`, `T3/hilbert-canonical-subgroup`, `T0/fargues-degree-properties`.

*Acceptance.* For F = ℚ, p ≥ 5, m = 1, r = 1/p and ε = 1/(2p): π_HT of the anticanonical locus lies in the union of discs of radius 1/p around ℤ_p.

*Sources.* BHW, §5.3, Proposition 5.18, PDF p. 24 (arXiv:1902.03985v4); BHW, §5.3, Proposition 5.18, PDF p. 24.

### The period estimates at primes ramified in F

`T4/ramified-period-comparison` (theorem)

Let p be ramified in F. In the situation of T4/period-map-inclusions, every point z of the anticanonical locus X_{Γ(p^∞)}(ε)_a satisfies π_HT(z) ∈ B_{|p^x|}(𝒪_p : 1), x = m + 1 − p^{m+1}ε/(p−1), with balls defined through the integral closure of 𝒪_F ⊗ O_C (T4/flag-variety-balls); likewise for the canonical locus and B_{|p^x|}(1 : p𝒪_p). Consequently the conclusions of BHW Proposition 5.18 hold for every rational prime p with the same constants c_p.

*Hypotheses and conventions.* This closes the case PerfectoidShimuraVarieties requested for ramified p (its source issue E36). The argument avoids the false identification 𝒪_p ⊗ O_C ≅ O_C^Σ and the local freeness of V over 𝒪_p ⊗ O_C.

*Proof outline.*
1. Only the generic point π_HT(z) ∈ ℙ¹(C^Σ) and the congruence V/p^x = H_n ⊗ O_C/p^x of the proof of T4/period-map-inclusions are used; that congruence is an O_C-module degree count and does not use 𝒪_p ⊗ O_C-freeness.
2. In the anticanonical case H_n = α(𝒪_p/p^n·(c, 1)): a free rank-one 𝒪_p/p^n-submodule of (𝒪_p/p^n)² meeting ⟨(1, 0)⟩ trivially has unit second coordinate in every local factor, also for ramified p.
3. Write (c, 1) = v + p^x(e, f) with v ∈ V; projecting along σ: 𝒪_p ⊗ O_C → O_C gives a vector of the σ-line with second coordinate 1 − p^xσ(f) a unit, so z_σ ∈ σ(c) + p^xO_C; hence z ∈ 𝒪_p + p^x(𝒪_p ⊗ O_C)^∼ = B_{|p^x|}(𝒪_p : 1).

*Prerequisites.* this roadmap: `T4/period-map-inclusions`, `T4/flag-variety-balls`, `T4/hodge-tate-coordinate`, `T3/hilbert-canonical-subgroup`.

*Acceptance.* For F = ℚ(√p) and p ≥ 5 the statement gives the same radius as for p split.

*Sources.* BHW, §5.3, proof of Proposition 5.18 (arXiv:1902.03985v4), PDF p. 24.

### Acceptance tests for T4

- p = 2 and p = 3 use c₂ = 4 and c₃ = 3 in Proposition 5.18; the radius change under AL_n is p^n.
- A ramified quadratic F (e.g. ℚ(√p)) satisfies the same inclusions.
- j(1, z) = 1 and the cocycle law for lower unipotent matrices.

<a id="t5"></a>

## T5. Igusa trivializations and the modified integral lattice: `HodgeTateAndCanonicalSubgroups:T5`

T5 constructs the Igusa torsors of trivialisations of the dual canonical subgroup and the ordinary inverse tower, and compares them with the full-level tower through the quotient by the canonical subgroup. It constructs the lattice ω^int from the finite-level Hodge–Tate image (locally free over 𝒪_F ⊗ O⁺ even at ramified p, with explicit bounds and level independence), Pilloni–Stroh's modified Hodge bundle ω^mod and modified minimal model, the étale sheaf ω^{mod,+}, and the AIP torsor, and proves the comparison of the AIP torsor with the Hodge–Tate trivialisation on the anticanonical tower, which is the input of OverconvergentAutomorphicForms O5.

*Dependencies: T0, T3, T4; PerfectoidShimuraVarieties S0 (the infinite-level tower as a diamond; its perfectoidness is S5's and is not used); PerfectoidSpaces P0, P9; ShimuraCompactifications C5, C6; AdicSpacesPartII R2.*

Coverage: **planned**. Refinements left: Split the AIP comparison's Hecke equivariance at p into O6 (it is cited, not planned, here).

### Igusa torsors of the dual canonical subgroup and the ordinary inverse tower

`T5/igusa-torsor` (construction) — planet: *Igusa tower*

Let F be totally real of degree g (F = ℚ for the modular curve), m ≥ 1 and 0 ≤ ε ≤ ε_m^can := p^{−(m+1)}, so that the universal semi-abelian A over X(ε) has a canonical subgroup H_m ⊂ A[p^m], étale-locally 𝒪_F/p^m on geometric generic points (T3/hilbert-canonical-subgroup). Its Cartier dual H_m^∨ = A^∨[p^m]/H_m^⊥ is étale on the generic fibre. The Igusa torsor X_{Ig(p^m)}(ε) → X(ε) is the finite étale (𝒪_F/p^m)^×-torsor representing 𝒪_F-linear isomorphisms 𝒪_F/p^m ≅ H_m^∨; these form a tower in m with transition maps reduction modulo p^m, and over the ordinary locus ε = 0 the limit X_{Ig(p^∞)}(0) = lim_m X_{Ig(p^m)}(0) is a pro-étale 𝒪_p^×-torsor parametrising 𝒪_p ≅ T_pH^∨ (H the multiplicative p-divisible subgroup), with a finite étale formal model at each finite level (the ordinary inverse tower). A partial Igusa trivialisation (of H_m^∨ only) is not a trivialisation of the whole Tate module.

*Hypotheses and conventions.* ε ≤ p^{−(m+1)}: within the radius of T3/hilbert-canonical-subgroup at level m. Over the boundary the construction uses the finite part of the semi-abelian A (T0/semi-abelian-torsion); at the cusps H_m is the toric part, which is multiplicative.

*Proof outline.*
1. H_m^∨ is finite étale over the generic fibre of X(ε), étale-locally isomorphic to 𝒪_F/p^m (T3/hilbert-canonical-subgroup, T3/canonical-subgroup-properties); Isom_{𝒪_F}(𝒪_F/p^m, H_m^∨) is then a finite étale (𝒪_F/p^m)^×-torsor.
2. Over ε = 0, H = A[p^∞]^0 is multiplicative and H^∨ étale over the whole formal model, so the torsor extends to a finite étale formal model; take the limit.

*Prerequisites.* this roadmap: `T3/hilbert-canonical-subgroup`, `T3/canonical-subgroup-properties`, `T0/semi-abelian-torsion`; other roadmaps: `AbelianSchemesAndArithmeticModuli:A2`, `AdicEtaleGeometry:A1/pro-etale-site-corrected`.

*Uses.* BHW 2019, §§3.4, 7: the Igusa tower receives the map from the anticanonical perfectoid tower. OverconvergentAutomorphicForms:O7: ordinary Igusa forms and the Hida comparison. AIP (Hilbert) §§3–4: the torsor 𝔉 lives over the Igusa tower.

*API.*

- `TauCeti.HodgeTate.igusaTorsor` (constructor): X_{Ig(p^m)}(ε) → X(ε), the (𝒪_F/p^m)^×-torsor of 𝒪_F-linear isomorphisms 𝒪_F/p^m ≅ H_m^∨.
- `TauCeti.HodgeTate.igusaTorsor_transition` (functoriality): Reduction mod p^m gives X_{Ig(p^{m+1})}(ε′) → X_{Ig(p^m)}(ε′) for ε′ ≤ ε_{m+1}^can, equivariant for (𝒪_F/p^{m+1})^× → (𝒪_F/p^m)^×.
- `TauCeti.HodgeTate.ordinaryIgusaTower` (constructor): X_{Ig(p^∞)}(0) = lim X_{Ig(p^m)}(0), a pro-étale 𝒪_p^×-torsor over X(0) with finite étale formal models.
- `TauCeti.HodgeTate.igusaTorsor_universalTrivialisation` (data): The tautological isomorphism ψ_univ: 𝒪_F/p^m ≅ H_m^∨ over X_{Ig(p^m)}(ε).
- `TauCeti.HodgeTate.igusaTorsor_baseChange` (functoriality): Compatible with base change, prime-to-p Hecke correspondences and the 𝒪_F^{×,+}-action on polarisations.

*Unit tests.*

- `TauCeti.HodgeTate.igusaTorsor_degree` (computation): X_{Ig(p^m)}(ε) → X(ε) is finite étale of degree #(𝒪_F/p^m)^×; for F = ℚ, of degree p^{m−1}(p − 1).
- `TauCeti.HodgeTate.igusaTorsor_cusp` (degenerate): At a cusp of the modular curve (Tate curve), H_m = μ_{p^m} and H_m^∨ = ℤ/p^m, so the torsor is trivial over the cusp neighbourhood.
- `TauCeti.HodgeTate.igusaTorsor_not_fullLevel` (non-example): X_{Ig(p^m)}(ε) is not X_{Γ(p^m)}(ε): its fibres have #(𝒪_F/p^m)^× points, not #GL₂(𝒪_F/p^m); a partial Igusa trivialisation is not a Tate-module basis.

*Acceptance.* For the modular curve, X_{Ig(p)}(0) → X(0) is the classical Igusa curve of level p over the ordinary locus, a (ℤ/p)^×-torsor.

*Sources.* BHW, §7.1, Definition 7.1(2), PDF p. 28 (arXiv:1902.03985v4); BHW, §3.4, PDF p. 14.

### Igusa trivialisations and the full p-level tower

`T5/igusa-full-level-comparison` (comparison)

For 0 ≤ ε ≤ ε_m^can, let X_{Γ(p^∞)}(ε)_a be the anticanonical part of the infinite-level tower (the diamond of PerfectoidShimuraVarieties S0; its perfectoidness, PerfectoidShimuraVarieties S5, is not used), with universal α: 𝒪_p² ≅ T_pA^∨. The map φ: X_{Γ(p^∞)}(ε)_a → X_{Ig(p^m)}(ε), (A, α) ↦ (𝒪_p/p^m → (𝒪_p/p^m)² → A^∨[p^m] → H_m^∨), the first map e ↦ (e, 0) and the last the quotient by H_m^⊥ = canonical subgroup of A^∨, is well defined, equivariant for the action of the diagonal torus of Γ₀(p) through (a b; c d) ↦ d mod p^m, and an isomorphism onto the Igusa torsor exactly on the anticanonical locus: there α(1, 0) generates a complement of H_m^⊥, so its image in H_m^∨ is a generator. Through the quotient by the canonical subgroup, X_{Γ(p^m)}(ε)_a → X_{Ig(p^m)}(ε) factors through the Γ₀-level anticanonical locus and the Atkin–Lehner identification of T4/atkin-lehner-anticanonical.

*Hypotheses and conventions.* Uses the corrected indexing of BHW Proposition 7.11 (m, not n, in 'the dual of the inclusion H_m → A[p^m]' and '(1, 0) mod p^m').

*Proof outline.*
1. Check on (C, C⁺)-points: in the anticanonical locus α(1, 0) mod p^m ∉ H_m^⊥ + p(…), so its image generates H_m^∨ (T4/canonical-anticanonical-loci, T3/canonical-subgroup-properties (iii)).
2. Equivariance from the definition of the Γ₀(p)-action on α; factorisation through Γ₀-level since the map only depends on α(1, 0) modulo the lower-triangular part.

*Prerequisites.* this roadmap: `T5/igusa-torsor`, `T4/canonical-anticanonical-loci`, `T4/atkin-lehner-anticanonical`, `T3/canonical-subgroup-properties`; other roadmaps: `PerfectoidShimuraVarieties:S0/infinite-level-diamond`, `PerfectoidShimuraVarieties:S0/p-level-tower`.

*Acceptance.* For the modular curve at ε = 0, φ sends (E, α) to the image of α(1, 0) in E[p^m]/E[p^m]^0 ≅ H_m^∨.

*Sources.* BHW, §7.2, Proposition 7.11 (arXiv:1902.03985v4), PDF p. 30.

### The modified integral lattice ω^int

`T5/integral-differential-lattice` (construction) — planet: *Modified integral lattice ω^int*

Let m ≥ 1, 0 ≤ ε ≤ ε_m^can, and ω⁺ the integral structure on ω_A over X_{Ig(p^m)}(ε) (pushforward of the conormal sheaf of the formal model; BHW Definition 4.2), Hdg the Hasse ideal (generated locally by a lift of Ha) and I_m := p^m Hdg^{−(p^m−1)/(p−1)}, I′_m := p^m Hdg^{−p^m/(p−1)} ⊇ I_m. The map ψ: 𝒪_F/p^m → H_m^∨ → ω⁺_{H_m} → ω⁺/I_m ω⁺, 1 ↦ ψ(1), is the Hodge–Tate map of the dual canonical subgroup composed with the universal Igusa trivialisation (T3/canonical-subgroup-hodge-tate). Then ω^int ⊂ ω⁺ is the preimage of the 𝒪_F ⊗ O⁺-submodule of ω⁺/I_mω⁺ generated by ψ(1). Properties (T5/integral-lattice-properties): ω^int is locally free of rank one over 𝒪_F ⊗ O⁺ (even at ramified p, where ω⁺ need not be), Hdg^{1/(p−1)}ω⁺ ⊂ ω^int ⊂ ω⁺, and 1 ↦ ψ(1) induces HT′: 𝒪_F ⊗ O⁺/I′_m ≅ ω^int/I′_m ω^int.

*Hypotheses and conventions.* The submodule generated by ψ(1) is the 𝒪_F ⊗ O⁺-submodule (BHW Definition 7.3 writes '𝒪_F-submodule'; Proposition 7.4(2) uses the correct one). Only the factorisation ω⁺ → ω⁺/I_mω⁺ through ω⁺_{H_m} is used; BHW Lemma 7.2's exactness in the middle fails for g ≥ 2 (sourceIssues), and the construction does not use it. ω^int is not replaced by ω⁺ at ramified primes: ω⁺ fails to be locally free over 𝒪_F ⊗ O⁺ off the Rapoport locus.

*Proof outline.*
1. Construct ψ from T5/igusa-torsor and the Hodge–Tate map of H_m^∨ (T0/finite-hodge-tate-map, T3/canonical-subgroup-hodge-tate).
2. Define ω^int as the preimage; it contains I_mω⁺ and is an 𝒪_F ⊗ O⁺-submodule.
3. Local freeness and the bounds: the determinant of the linearised Hodge–Tate map generates Hdg^{1/(p−1)} (AIP), and the adjugate argument gives a generator of ω^int; well-definedness of HT′ modulo I′_m.

*Prerequisites.* this roadmap: `T5/igusa-torsor`, `T3/canonical-subgroup-hodge-tate`, `T0/finite-hodge-tate-map`, `T0/conormal-module`, `T0/multiplicative-hodge-tate-isomorphism`, `T3/hasse-neighbourhood`; libraries: `mathlib:Module.Invertible`.

*Uses.* BHW 2019, §7: comparison of the perfectoid and AIP overconvergent sheaves. AIP (Hilbert) §4: the torsor 𝔉 and the sheaves w^κ. OverconvergentAutomorphicForms:O3/ramified-modified-lattice: integral coefficients at ramified primes.

*API.*

- `TauCeti.HodgeTate.igusaHodgeTateClass` (constructor): ψ(1) ∈ ω⁺/I_mω⁺, the Hodge–Tate image of the universal Igusa generator.
- `TauCeti.HodgeTate.integralDifferentialLattice` (constructor): ω^int := preimage in ω⁺ of the 𝒪_F ⊗ O⁺-span of ψ(1).
- `TauCeti.HodgeTate.integralDifferentialLattice_locallyFree` (instance): ω^int is locally free of rank one over 𝒪_F ⊗ O⁺.
- `TauCeti.HodgeTate.integralDifferentialLattice_bounds` (relation): Hdg^{1/(p−1)}ω⁺ ⊂ ω^int ⊂ ω⁺.
- `TauCeti.HodgeTate.integralDifferentialLattice_hodgeTate` (characterisation): HT′: 𝒪_F ⊗ O⁺/I′_m ≅ ω^int/I′_mω^int, 1 ↦ ψ(1).
- `TauCeti.HodgeTate.integralDifferentialLattice_indep` (compatibility): For m′ ≥ m (and ε within both radii) the lattices defined at levels m and m′ agree.

*Unit tests.*

- `TauCeti.HodgeTate.integralDifferentialLattice_ordinary` (degenerate): On the ordinary locus (ε = 0), ω^int = ω⁺.
- `TauCeti.HodgeTate.integralDifferentialLattice_colength` (computation): At a rank-one point of Hodge height w (F = ℚ), ω⁺/ω^int ≅ O_C/p^{w/(p−1)}.
- `TauCeti.HodgeTate.integralDifferentialLattice_ne_plus` (non-example): At a non-ordinary point ω^int ≠ ω⁺ (its colength is w/(p−1) > 0), so ω^int is not the natural formal-model lattice; at ramified p, ω⁺ is not even locally free over 𝒪_F ⊗ O⁺.

*Acceptance.* At an ordinary point (Hdg = O⁺), ω^int = ω⁺ and HT′ is the Hodge–Tate isomorphism of the multiplicative H_m (T0/multiplicative-hodge-tate-isomorphism).

*Sources.* BHW, §7.1, Definition 7.3 (arXiv:1902.03985v4), PDF p. 29; BHW, §7.1, PDF p. 28 (arXiv:1902.03985v4); AIPH, §4.1, Proposition 4.1 (author copy), PDF p. 15.

### Local freeness, independence of level and cokernel estimates for ω^int

`T5/integral-lattice-properties` (theorem)

In the situation of T5/integral-differential-lattice: (1) ω^int is a locally free 𝒪_F ⊗ O⁺-module of rank one on X_{Ig(p^m)}(ε); (2) the cokernel of ω^int ⊂ ω⁺ is annihilated by Hdg^{1/(p−1)}, so ω^int/I_mω⁺ ⊂ ω⁺/I_mω⁺ is the 𝒪_F ⊗ O⁺-submodule generated by ψ(1); (3) 1 ↦ ψ(1) induces an isomorphism HT′: 𝒪_F ⊗ O⁺/I′_m ≅ ω^int/I′_m; (4) any lift w ∈ ω⁺ of ψ(1) ∈ ω⁺_{H_m} lies in ω^int and satisfies w ≡ HT′(1) modulo I′_m; (5) ω^int is independent of m (for ε within the radii) and compatible with the transition maps of the Igusa tower, base change and prime-to-p Hecke correspondences; (6) on the formal model of the ordinary locus ω^int coincides with the natural lattice ω⁺.

*Hypotheses and conventions.* (5) independence of level and (6) are the comparisons the stage asks for; BHW transfer (1)–(3) from AIP's normal formal schemes IG_{n,r,I} to the analytic O⁺ setting without further argument, and the packet records that transfer as a proof step, not as a separate theorem.

*Proof outline.*
1. (1)–(3): AIP (Hilbert) Proposition 4.1: the determinant of the linearised Hodge–Tate matrix generates Hdg^{1/(p−1)} (T3/canonical-subgroup-hodge-tate, through AIP's Proposition A.3); adjugate argument; a surjection of free modules of equal rank is an isomorphism.
2. (4): a lift of ψ(1) agrees with ψ(1) in ω⁺/I_mω⁺, hence lies in ω^int, and I_mω⁺ ⊂ I′_mω^int because Hdg^{1/(p−1)}ω⁺ ⊂ ω^int (BHW Corollary 7.6).
3. (5): the Hodge–Tate images at levels m and m′ are compatible under reduction (T0/hodge-tate-map-compatibilities), so the preimages agree; (6) from Hdg = O⁺ on the ordinary locus.

*Prerequisites.* this roadmap: `T5/integral-differential-lattice`, `T3/canonical-subgroup-hodge-tate`, `T0/hodge-tate-map-compatibilities`, `T5/igusa-torsor`.

*Acceptance.* At a rank-one point of Hodge height w for F = ℚ and m = 1: I′₁ = p^{1 − pw/(p−1)} and ω^int/I′₁ ≅ O_C/p^{1−pw/(p−1)}.

*Sources.* BHW, §7.1, Proposition 7.4 (arXiv:1902.03985v4), PDF p. 29; BHW, §7.1, Corollary 7.6, PDF p. 29 (arXiv:1902.03985v4).

### The modified Hodge bundle ω^mod at full level p^n

`T5/modified-hodge-bundle` (construction) — planet: *Modified Hodge bundle ω^mod*

Let 𝔛 = 𝔛_{K(p^n)} be the normalisation of the toroidal formal model of the Siegel, Hilbert–Siegel (GSp₄ over F) or Hilbert variety in its full level-p^n generic fibre, with universal semi-abelian 𝒢 and the extended Hodge–Tate map HT: (𝒪_p/p^n)^{2g} ⊗ O_𝔛 → ω_𝒢/p^n (T0/hodge-tate-boundary-extension). Let ω_𝒢^{mod} ⊂ ω_𝒢 be the subsheaf generated by p^{1/(p−1)}ω_𝒢 and local lifts of the image of HT (equivalently, for n ≥ 1, the preimage of the image of HT); after normalising the blow-up of the ideal locally generated by the minors of the Hodge–Tate matrix (the 2 × 2 minors at each v | p for GSp₄/F; minors of sizes g, …, 1 for GSp_{2g}), giving 𝔛^mod → 𝔛, an isomorphism on generic fibres, its pullback ω^mod is locally free (over 𝒪_F ⊗ O_{𝔛^mod} of rank 2 for GSp₄/F; of rank g for GSp_{2g}), p^{1/(p−1)}ω ⊂ ω^mod ⊂ ω, and HT factors through a surjection (𝒪_p/p^n)^{2g} ⊗ O_{𝔛^mod} → ω^mod/p^{n−1/(p−1)}.

*Hypotheses and conventions.* p ≥ 3 for the Fargues bound p^{1/(p−1)} (Pilloni–Stroh Théorème 1.9); for p = 2 the bound is replaced by 2 (Pilloni–Stroh Remark 1.10) and the statement changes accordingly. n ≥ 1 is needed for the three descriptions of ω^mod to agree (Nakayama with n > 1/(p−1)); BCGP's level vector allows n_v = 0, which is excluded here. For F ≠ ℚ the extension of HT over the boundary is T0/hodge-tate-boundary-extension, whose Koecher input is a recorded gap.

*Proof outline.*
1. Define ω^mod as the image of local lifts plus p^{1/(p−1)}ω; Fargues's bound (T0/fargues-hodge-tate-cokernel), applied at rank-one points and propagated by normality, gives p^{1/(p−1)}ω ⊂ ω^mod.
2. Blow up the minor ideal (finitely generated, containing a power of p) and normalise (AdicSpacesPartII R2/admissible-blow-up); once the minor ideal is invertible, Cramer's rule shows the image is free on the columns of a generating minor.
3. HT factors through ω^mod/p^{n−1/(p−1)} since p^nω ⊂ p^{n−1/(p−1)}ω^mod.

*Prerequisites.* this roadmap: `T0/hodge-tate-boundary-extension`, `T0/fargues-hodge-tate-cokernel`, `T0/conormal-module`; other roadmaps: `AdicSpacesPartII:R2/admissible-blow-up`, `AdicSpacesPartII:R2/generic-fibre-inverts-admissible-blow-ups`; libraries: `mathlib:AlgebraicGeometry.Scheme.Hom.normalization`.

*Uses.* Pilloni–Stroh 2016, §1.8; Pilloni 2020, §12: coherent cohomology at infinite level. BCGP 2021, §§6.1–6.2: higher Coleman theory for GSp₄ over F. PerfectoidShimuraVarieties:S3/hodge-tate-formal-models: normalised formal models with Hodge–Tate sections.

*API.*

- `TauCeti.HodgeTate.modifiedModel` (constructor): 𝔛^mod → 𝔛, the normalised blow-up of the minor ideal of the Hodge–Tate matrix.
- `TauCeti.HodgeTate.modifiedHodgeBundle` (constructor): ω^mod ⊂ ω on 𝔛^mod, generated by p^{1/(p−1)}ω and lifts of the Hodge–Tate image.
- `TauCeti.HodgeTate.modifiedHodgeBundle_locallyFree` (instance): ω^mod is locally free (over 𝒪_F ⊗ O for Hilbert–Siegel data).
- `TauCeti.HodgeTate.modifiedHodgeBundle_bounds` (relation): p^{1/(p−1)}ω ⊂ ω^mod ⊂ ω (p ≥ 3).
- `TauCeti.HodgeTate.modifiedHodgeBundle_hodgeTate_surjective` (characterisation): HT ⊗ 1: (𝒪_p/p^n)^{2g} ⊗ O → ω^mod/p^{n−1/(p−1)} is surjective.
- `TauCeti.HodgeTate.modifiedModel_generic` (compatibility): 𝔛^mod → 𝔛 is an isomorphism on adic generic fibres.

*Unit tests.*

- `TauCeti.HodgeTate.modifiedHodgeBundle_ordinary` (degenerate): Over the ordinary locus ω^mod = ω and 𝔛^mod = 𝔛.
- `TauCeti.HodgeTate.modifiedHodgeBundle_colength` (computation): For g = 1 at a rank-one point with a canonical subgroup and Hodge height w, ω/ω^mod ≅ O_C/p^{w/(p−1)}.
- `TauCeti.HodgeTate.modifiedHodgeBundle_not_locallyFree_before_blowup` (non-example): Before the blow-up, the image sheaf is not locally free in general (it is generated by 2g sections with non-invertible minor ideal).

*Acceptance.* On the ordinary locus ω^mod = ω. For the modular curve (g = 1), ω^mod is generated by the Hodge–Tate images of the basis of (ℤ/p^n)² and p^{1/(p−1)}ω.

*Sources.* BCGP21, §6.1.4, p. 141 (arXiv:1812.09269v3); BCGP21, §6.1.4, p. 141; PS16, §1.8, construction before Proposition 1.13 (author copy; published Proposition 1.10), PDF p. 6; PIL20, §12.2.1, PDF p. 74.

### The modified minimal model and the descent of the Hodge–Tate determinant

`T5/modified-minimal-model` (construction)

Let 𝔛^*_{K(p^n)} be the Stein factorisation of 𝔛_{K(p^n)} → 𝔛^* (𝔛^* the minimal compactification, ShimuraCompactifications C5/C6); it is a normal admissible formal scheme. The determinant Λ^{g}HT: Λ^{g}((𝒪_p/p^n)^{2g}) → det ω/p^n of the Hodge–Tate map (for GSp₄/F, its O_F-direct factor ⊗_{v|p} Λ²(𝒪_{F_v}/p^n)^4 → det ω/p^n) descends from 𝔛_{K(p^n)} to 𝔛^*_{K(p^n)}. Normalising the blow-up of the ideal generated by the coefficients of local lifts of the descended map gives 𝔛^{*−mod}_{K(p^n)} → 𝔛^*_{K(p^n)}, an isomorphism on generic fibres, carrying an invertible det ω^mod ⊂ det ω with p^{2[F:ℚ]/(p−1)} det ω ⊂ det ω^mod ⊂ det ω for GSp₄/F (p^{g/(p−1)} for GSp_{2g}), and Λ^gHT factors through a surjection onto det ω^mod/p^{n − 2[F:ℚ]/(p−1)}. 𝔛^mod_{K(p^n)} maps to 𝔛^{*−mod}_{K(p^n)} compatibly.

*Hypotheses and conventions.* Pilloni–Stroh prove the descent of Λ^gHT only for Siegel varieties over ℚ; for GSp₄/F the analogue of their Corollaire A.10 (f_*O/p^k = f_*(O/p^k) for toroidal → minimal at level p^n) is a recorded gap (BCGP apply it without comment). n ≥ n₀ with n₀ the least integer > g/(p−1) (n₀ = 2g + 1 if p = 2) in Pilloni–Stroh's construction.

*Proof outline.*
1. Descent: projection formula and f_*(O)/p^k = f_*(O/p^k) for f: 𝔛_{K(p^n)} → 𝔛^*_{K(p^n)} (Pilloni–Stroh Corollaire 1.7 with Corollaire A.10).
2. Use the 𝒪_F-action to see that the determinant factors through ⊗_v Λ²(𝒪_{F_v}/p^n)^4 (BCGP Remark 6.2.2).
3. Blow up and normalise; the bounds follow placewise from T5/modified-hodge-bundle, p^{2/(p−1)} det ω_v ⊂ det ω_v^mod at each of the [F:ℚ] places.

*Prerequisites.* this roadmap: `T5/modified-hodge-bundle`, `T0/hodge-tate-boundary-extension`; other roadmaps: `ShimuraCompactifications:C5/integral-minimal-space`, `ShimuraCompactifications:C6/hilbert-minimal-normal-projective`, `AdicSpacesPartII:R2/admissible-blow-up`.

*Uses.* BCGP 2021, Theorem 6.2.6: vanishing of higher coherent cohomology on affinoids of the minimal compactification. Pilloni 2020, §12.9: Siegel threefolds. PerfectoidShimuraVarieties:S3/hodge-tate-formal-models: det ω^mod descending to an ample sheaf.

*API.*

- `TauCeti.HodgeTate.minimalLevelModel` (constructor): 𝔛^*_{K(p^n)}, the Stein factorisation of 𝔛_{K(p^n)} → 𝔛^*.
- `TauCeti.HodgeTate.hodgeTateDeterminant_descends` (relation): Λ^gHT is the pullback of a map on 𝔛^*_{K(p^n)}.
- `TauCeti.HodgeTate.modifiedMinimalModel` (constructor): 𝔛^{*−mod}_{K(p^n)}, the normalised blow-up of the coefficient ideal of Λ^gHT.
- `TauCeti.HodgeTate.modifiedDetHodge_bounds` (relation): p^{2[F:ℚ]/(p−1)} det ω ⊂ det ω^mod ⊂ det ω (GSp₄/F).
- `TauCeti.HodgeTate.modifiedDetHodge_surjective` (characterisation): Λ^gHT ⊗ 1 surjects onto det ω^mod/p^{n−2[F:ℚ]/(p−1)}.

*Unit tests.*

- `TauCeti.HodgeTate.modifiedMinimalModel_ordinary` (degenerate): Over the ordinary locus 𝔛^{*−mod} = 𝔛^* and det ω^mod = det ω.
- `TauCeti.HodgeTate.modifiedDetHodge_factor` (computation): For F of degree d and GSp₄/F, Λ^{2d}HT factors through ⊗_{v|p} Λ²(𝒪_{F_v}/p^n)^4, which is free of rank 6 over 𝒪_{F_v}/p^n at each v | p.
- `TauCeti.HodgeTate.modifiedMinimalModel_not_toroidal` (non-example): det ω^mod on 𝔛^{*−mod} is not ω^mod's determinant pulled back from a toroidal model: it is constructed on the minimal side, where ω itself does not descend, only det ω does.

*Acceptance.* For the modular curve, 𝔛^*_{K(p^n)} is the normalisation of the minimal compactification at full level p^n, and det ω^mod = ω^mod.

*Sources.* BCGP21, §6.2.1, p. 143 (arXiv:1812.09269v3); BCGP21, §6.2.1, Remark 6.2.2, p. 144; PS16, §1.4, Corollaire 1.7 (author copy; published Corollaire 1.4), PDF p. 5; PIL20, §12.9.1, PDF p. 80.

### The étale sheaf ω^{mod,+}

`T5/modified-plus-sheaf` (definition)

Over the analytic Siegel (or Hilbert–Siegel) variety 𝒳 at spherical level, ω_G^{mod,+} is the sheaf of O⁺_𝒳-modules on 𝒳_ét whose sections over U → 𝒳 étale are the integral differentials at the origin of G generated by the image of the Hodge–Tate period map over the full-level cover U ×_𝒳 𝒳(p^n), descended; its pullback to 𝒳(p^n) for n ≥ 1 (n ≥ 2 if p = 2) is the generic-fibre incarnation of ω^mod (T5/modified-hodge-bundle). It does not come from the analytic site of 𝒳 in general, and it satisfies p^{1/(p−1)}ω⁺ ⊂ ω^{mod,+} ⊂ ω⁺ (p ≥ 3).

*Hypotheses and conventions.* Defined on the étale site, not the analytic site; this is why consumers use ω^{mod,+} only after pullback to finite level or as an étale sheaf.

*Proof outline.*
1. Define on 𝒳(p^n) as the O⁺-span of Hodge–Tate images and p^{1/(p−1)}ω⁺; independence of n ≥ 1 (Pilloni–Stroh Lemma 1.12) and GSp_{2g}(ℤ/p^n)-invariance allow étale descent to 𝒳.
2. Bounds from T5/modified-hodge-bundle.

*Prerequisites.* this roadmap: `T5/modified-hodge-bundle`; other roadmaps: `AdicEtaleGeometry:A1/pro-etale-site-corrected`, `PerfectoidSpaces:P0/almost-basic-setup`.

*Uses.* Pilloni 2020, §12.7: integral structures for higher Hida theory. PerfectoidShimuraVarieties:S3: comparison with π_HT^*ω_Fl⁺.

*API.*

- `TauCeti.HodgeTate.modifiedPlusSheaf` (constructor): ω^{mod,+} on 𝒳_ét, the O⁺-span of Hodge–Tate images, descended from finite level.
- `TauCeti.HodgeTate.modifiedPlusSheaf_pullback` (compatibility): Its pullback to 𝒳(p^n), n ≥ 1 (n ≥ 2 if p = 2), is the generic fibre of ω^mod.
- `TauCeti.HodgeTate.modifiedPlusSheaf_bounds` (relation): p^{1/(p−1)}ω⁺ ⊂ ω^{mod,+} ⊂ ω⁺ (p ≥ 3).
- `TauCeti.HodgeTate.modifiedPlusSheaf_indep` (compatibility): Independent of the auxiliary level n used to define it.

*Unit tests.*

- `TauCeti.HodgeTate.modifiedPlusSheaf_ordinary` (degenerate): ω^{mod,+} = ω⁺ over the ordinary locus.
- `TauCeti.HodgeTate.modifiedPlusSheaf_rankOne` (computation): At a rank-one point of an elliptic curve with Hodge height w < 1/(p+1), ω⁺/ω^{mod,+} ≅ O_C/p^{w/(p−1)}.
- `TauCeti.HodgeTate.modifiedPlusSheaf_not_analytic` (non-example): ω^{mod,+} is not a sheaf on the analytic site of 𝒳 in general: its sections over an affinoid need not be determined by a single analytic formal model at spherical level.

*Acceptance.* Over the ordinary locus ω^{mod,+} = ω⁺.

*Sources.* PIL20, §12.7.1, PDF p. 77; PIL20, §12.7.1, PDF p. 77; PIL20, §12.7.1, PDF p. 77.

### The Andreatta–Iovita–Pilloni torsor

`T5/aip-torsor` (construction) — planet: *Andreatta–Iovita–Pilloni torsor*

In the situation of T5/integral-differential-lattice, let 𝔉_m := {w ∈ ω^int : w ≡ HT′(1) mod I′_m ω^int}. Its analytic total space 𝔉_m(ε) → X_{Ig(p^m)}(ε) is a torsor for the analytic topology under 1 + I′_m·Res_{𝒪_F/ℤ}𝔾̂_a, and 𝔉_m(ε) → X(ε) is an étale torsor under B_m := 𝒪_p^×·(1 + I′_m·Res_{𝒪_F/ℤ}𝔾̂_a) ⊂ Res_{𝒪_F/ℤ}𝔾_m; 𝔉_m(ε) → T(ω) (the total space of ω^×) is an open immersion. Over X(ε) and for x := m − εp^m/(p − 1), B_m ⊂ 𝒪_p^×(1 + p^x Res 𝔾̂_a), with equality where |Ha| = |p|^ε. For a weight κ: 𝒪_p^× → R^× analytic on B_m, the AIP sheaf ω^κ_AIP is the sheaf of κ^{-1}-equivariant functions on 𝔉_m(ε).

*Hypotheses and conventions.* The inclusion goes B_m ⊂ 𝒪_p^×(1 + p^x Res 𝔾̂_a), not the reverse as printed in BHW (7.1) (sourceIssues); where the reverse inclusion is used, use the point's own Hodge height or c ∈ p𝒪_p. The level m is tied to the weight: m = k + r − 1 for κ on the k-th piece of weight space (r = 3, or 5 for p = 2); BHW's Definition 7.9 prints m = k + r (sourceIssues). Continuous torsor descent with coefficients is PerfectoidSpaces P9's (RS-05 owners entry).

*Proof outline.*
1. 𝔉_m is an O⁺-torsor under 1 + I′_m by T5/integral-lattice-properties (3); adjoin the 𝒪_p^×-action from the Igusa torsor to get the B_m-torsor over X(ε).
2. Open immersion into T(ω): 𝔉_m is defined by a congruence on a generator of the locally free ω^int.
3. Bound on B_m: p^ε ∈ Hdg gives |p^mHdg^{−p^m/(p−1)}| ≤ |p^x|.

*Prerequisites.* this roadmap: `T5/integral-differential-lattice`, `T5/integral-lattice-properties`, `T5/igusa-torsor`; other roadmaps: `PerfectoidSpaces:P9`; libraries: `mathlib:Module.Invertible`.

*Uses.* Andreatta–Iovita–Pilloni (Hilbert, Siegel): overconvergent sheaves of weight κ. BHW 2019, Theorem 7.14: comparison with the perfectoid sheaf. OverconvergentAutomorphicForms:O5/aip-independent-coefficients: the independent AIP construction.

*API.*

- `TauCeti.HodgeTate.aipTorsor` (constructor): 𝔉_m(ε) := {w ∈ ω^int : w ≡ HT′(1) mod I′_m}, a torsor under 1 + I′_m Res 𝔾̂_a over X_{Ig(p^m)}(ε).
- `TauCeti.HodgeTate.aipTorsor_structureGroup` (structure): 𝔉_m(ε) → X(ε) is an étale B_m-torsor, B_m = 𝒪_p^×(1 + I′_m Res 𝔾̂_a).
- `TauCeti.HodgeTate.aipTorsor_openImmersion` (characterisation): 𝔉_m(ε) → T(ω) is an open immersion.
- `TauCeti.HodgeTate.aipTorsor_bound` (relation): B_m ⊂ 𝒪_p^×(1 + p^x Res 𝔾̂_a) over X(ε), x = m − εp^m/(p−1).
- `TauCeti.HodgeTate.aipSheaf` (constructor): ω^κ_AIP: κ^{-1}-equivariant functions on 𝔉_m(ε) for κ analytic on B_m.
- `TauCeti.HodgeTate.aipTorsor_lift` (relation): Every lift in ω⁺ of ψ(1) ∈ ω⁺_{H_m} is a section of 𝔉_m (T5/integral-lattice-properties (4)).

*Unit tests.*

- `TauCeti.HodgeTate.aipTorsor_ordinary` (degenerate): At ε = 0, B_m = 𝒪_p^×(1 + p^m Res 𝔾̂_a) and 𝔉_m is the torsor of generators of ω⁺ congruent to the Igusa generator mod p^m.
- `TauCeti.HodgeTate.aipSheaf_classical` (compatibility): For κ = (x ↦ x^k), ω^κ_AIP ≅ ω^{⊗k} (the classical Hodge-line power) on X(ε).
- `TauCeti.HodgeTate.aipTorsor_bound_direction` (non-example): The reverse inclusion 𝒪_p^×(1 + p^x Res 𝔾̂_a) ⊂ B_m fails at points where |Ha| > |p|^ε, since there I′_m ⊊ p^xO⁺.

*Acceptance.* For F = ℚ at ε = 0, 𝔉_m is the set of generators of ω⁺ congruent to the Hodge–Tate image of the Igusa generator modulo p^m.

*Sources.* BHW, §7.1, Definition 7.5, PDF p. 29 (arXiv:1902.03985v4); BHW, §7.1, Definition 7.5, PDF p. 29; AIPH, §4.2, the torsor F_{n,r,I} (author copy), PDF p. 16.

### The AIP torsor and the Hodge–Tate trivialisation on the anticanonical tower

`T5/aip-hodge-tate-comparison` (theorem) — planet: *AIP–Hodge–Tate comparison*

Let 0 ≤ ε ≤ ε_m^can and s: X_{Γ(p^∞)}(ε)_a → T(ω), s(A, α) := HT_A(α(1, 0)) ∈ ω_A, the Hodge–Tate trivialisation on the anticanonical part of the infinite-level tower (the diamond of PerfectoidShimuraVarieties S0, pulled back along T4/canonical-anticanonical-loci). Then s factors through 𝔉_m(ε) (T5/aip-torsor), and for γ = (a b; c d) ∈ Γ₀(p) one has γ*s = j(γ, ·)·s with j = cz + d (T4/hodge-tate-coordinate), j landing in B_m. Consequently, for a bounded smooth weight κ with ε ≤ ε_κ and every n ∈ ℤ_{≥0} ∪ {∞}, pullback along s̃ := s ∘ u_n (u_n the action of (p^n 0; 0 1)) induces a Hecke-equivariant isomorphism of invertible O⁺-modules between the perfectoid sheaf ω^{κ,+}_n on X_{Γ₀(p^n)}(ε)_a (functions f with γ*f = κ^{-1}(cz + d)f) and AL_{n*}ω^{κ,+}_AIP; in particular ω^κ ≅ ω^κ_AIP. This is the substantive comparison consumed by OverconvergentAutomorphicForms O5, not a redefinition of one sheaf as the other.

*Hypotheses and conventions.* The factorisation through 𝔉_m uses T4/period-map-inclusions (π_HT of the anticanonical locus lies in B_{|p^x|}(𝒪_p : 1)), so cz + d ∈ 𝒪_p^×(1 + p^{1+x}…) ⊂ B_m with the corrected inclusion of T5/aip-torsor. Hecke equivariance away from p is formal; at p it is OverconvergentAutomorphicForms O6's.

*Proof outline.*
1. Check on (C, C⁺)-points: φ to the Igusa tower (T5/igusa-full-level-comparison) sends α(1, 0) to the Igusa generator; functoriality of HT (T0/hodge-tate-map-compatibilities) shows s(x) = HT(α(1, 0)) lifts ψ(1), hence lies in 𝔉_m (T5/integral-lattice-properties (4)).
2. Equivariance γ*s = (cz + d)s: s is HT of the first basis vector and γ acts on α (BHW Lemma 3.19 / 5.31).
3. Isomorphism of sheaves: ω_AIP is locally generated by an invertible equivariant function f, f ∘ s̃ is κ^{-1}(cz + d)-equivariant, and Γ₀(p^n)-invariants of O⁺ on the pro-étale torsor X_{Γ(p^∞)}(ε)_a → X_{Γ₀(p^n)}(ε)_a are O⁺ (PerfectoidSpaces P9).

*Prerequisites.* this roadmap: `T5/aip-torsor`, `T5/igusa-full-level-comparison`, `T5/integral-lattice-properties`, `T4/hodge-tate-coordinate`, `T4/period-map-inclusions`, `T0/hodge-tate-map-compatibilities`; other roadmaps: `PerfectoidSpaces:P9`, `PerfectoidShimuraVarieties:S0/infinite-level-diamond`.

*Acceptance.* For F = ℚ, κ = x^k, both sheaves are ω^{⊗k} and the isomorphism is the identity on q-expansions at ∞.

*Sources.* BHW, §7.2, Theorem 7.14, PDF p. 30 (arXiv:1902.03985v4); BHW, §5.3, PDF p. 26; BHW, §3.3, Lemma 3.19, PDF p. 12.

### Acceptance tests for T5

- At ε = 0: ω^int = ω⁺ = ω^mod = ω^{mod,+} and the AIP torsor is the torsor of generators congruent to the Igusa generator modulo p^m.
- For F = ℚ at Hodge height w: ω⁺/ω^int ≅ O_C/p^{w/(p−1)}.
- For κ = x^k, ω^κ_AIP ≅ ω^{⊗k} and the comparison with the perfectoid sheaf is the identity on q-expansions.

## Gaps

- **Illusie's deformation theory of flat commutative group schemes and the co-Lie complex** (needed by `T3/subgroup-lifting`, `T0/fargues-degree`). Corollary 3.2.2 (Scholze) uses Illusie, Complexe cotangent et déformations II, Théorème VII.4.2.5 (obstructions to lifting a morphism of flat commutative group schemes along square-zero thickenings, in terms of the co-Lie complex), and Fargues's δ_G = Div(ℓ_{G/S}) uses the co-Lie complex. No atlas stage plans the co-Lie complex of a group scheme or its deformation theory, and neither library has the cotangent complex. The degree node uses the equivalent Fitting-ideal definition Fitt₀ ω_G, which needs no cotangent complex; the lifting theorem needs Illusie's theorem. Owner to be decided (a cotangent-complex roadmap, see the restructure entry).
- **p = 2 estimates for canonical subgroups of p-divisible groups (AIP 'Le halo spectral', Appendix)** (needed by `T3/canonical-subgroup-hodge-tate`, `T4/period-map-inclusions`). BHW Proposition 5.19(2)–(3) for p = 2 rest on Andreatta–Iovita–Pilloni, Le halo spectral (Ann. Sci. ÉNS 2018), Corollary A.2.4 and Proposition A.3, which were not read. Fargues 2011 excludes p = 2. The existence of canonical subgroups for p = 2 is covered by Scholze's Corollary 3.2.6 (T3/canonical-subgroup-theorem (1)); the Hodge–Tate cokernel estimate of the dual canonical subgroup with the constant c₂ = 4 is not established from the sources read.
- **Koecher principle and boundary descent for normalised level-p^n models of GSp₄/F** (needed by `T0/hodge-tate-boundary-extension`, `T5/modified-minimal-model`). BCGP §6.1.4 extend HT over the toroidal boundary for F ≠ ℚ by citing Lan 2017, Theorem 8.7, without checking that it applies to the normalised level-p^n model with coefficients ω/p^n; §6.2.1 apply Pilloni–Stroh's descent of Λ²HT (proved for Siegel varieties over ℚ) to GSp₄/F without comment. The packet requests both inputs from ShimuraCompactifications C5 and records them here until supplied. The F = ℚ case is complete (Pilloni–Stroh Proposition 1.5, Corollaire 1.7).
- **Absolute Hodge cycles under the relative comparison in families** (needed by `T1/hodge-tensor-comparison`). Blasius's theorem is for abelian varieties over number fields; its propagation to the relative comparison over a Shimura variety (Caraiani–Scholze §2.3, by horizontality and density of CM points) is taken from AutomorphicBundles B1/absolute-hodge-propagation, whose own plan is cited; the CM-point density argument in the p-adic relative setting is not decomposed here.

## Mistakes found in the sources

- **HodgeTateAndCanonicalSubgroups/E14** (misprint, FAR10, §3, Définition 5, PDF p. 9 (author copy)). Printed: “χ(Λ1 , Λ2 ) = χ(Λ1 , pk Λ2 ) + k”. Correction: For Λ₂ ⊂ Λ₁, χ(Λ₁, Λ₂) = v(Fitt₀(Λ₁/Λ₂)), and in general χ(Λ₁, Λ₂) = χ(Λ₁, p^kΛ₂) − k·dim_K V for k large. Reason: By additivity χ(Λ₁, p^kΛ₂) = χ(Λ₁, Λ₂) + k·dim V, so the printed sign and the missing factor dim V are wrong; the printed quotient Λ₂/Λ₁ should be Λ₁/Λ₂. Proposition 3 uses only the case Λ₂ ⊂ Λ₁.
- **HodgeTateAndCanonicalSubgroups/E15** (misprint, FAR10, §4.3, Corollaire 5(5), PDF p. 12 (author copy)). Printed: “immersion fermée et le morphisme G/G′ −→ G est un isomorphisme en fibre générique.”. Correction: … le morphisme G/G′ → G″ est un isomorphisme en fibre générique. Reason: The hypothesis concerns the map to G″, as in Corollaire 3(b); G/G′ → G is not defined.
- **HodgeTateAndCanonicalSubgroups/E16** (misprint, FAR11, §6.5, Proposition 11, PDF p. 34 (author copy)). Printed: “si p 6= 2 et Ha(G) < 3 si p = 3.”. Correction: Ha(G) < 1/2 si p ≠ 3 et Ha(G) < 1/3 si p = 3 (with the standing p ≠ 2). Reason: Corollaires 1 and 2 on the same page and Théorème 4 use 'si p ≠ 3'; with 'p ≠ 2' the two cases overlap at p = 3.
- **HodgeTateAndCanonicalSubgroups/E17** (misprint, FAR11, §5.4, before Théorème 3, PDF p. 25 (author copy)). Printed: “on déduit le théorème 6 de [16], auquel on renvoie pour la preuve.”. Correction: le théorème 7 de [16]. Reason: Théorème 3 is Théorème 7 of Fargues 2010; Théorème 6 there is the HN/HT polygon comparison. §5 of the same paper cites 'théorème 7 de [16]' correctly.
- **HodgeTateAndCanonicalSubgroups/E18** (misprint, FAR11, §7.5, proof of Théorème 6, PDF p. 38 (author copy)). Printed: “n − 1, p−(n−1) C/C. Soit donc C tel que D ⊂ C ⊂ p−(n−1) D et C/D soit le sous-groupe donné”. Correction: … au groupe de Barsotti–Tate tronqué d'échelon n − 1, p^{−(n−1)}D/D. Reason: C is defined in the next sentence from the induction hypothesis applied to p^{−(n−1)}D/D (D the canonical subgroup of G[p]).
- **HodgeTateAndCanonicalSubgroups/E19** (misprint, BP26, §4.1.8, PDF p. 41 (author copy)). Printed: “complement of Di is the locus where Gri is étale. We have Di + D2g+1−i = V (pn ) ([Far10], sect.”. Correction: Cite Fargues 2010, §2, Lemme 2 (δ_G + δ_{G^D} = div|G|). Reason: Lemme 3 of Fargues 2010 is flat base change δ_{h*G} = h*δ_G; the duality identity is Lemme 2.
- **HodgeTateAndCanonicalSubgroups/E20** (error, BHW, §7.1, after Definition 7.5, display (7.1), PDF p. 29 (arXiv:1902.03985v4)). Printed: “immersion. Finally, we note that since pǫ ∈ Hdg, we have for x := m − ǫpm /(p − 1) that”. Correction: B_m ⊂ 𝒪_p^×(1 + p^x Res_{𝒪_F/ℤ}𝔾̂_a) on X(ε) (the printed inclusion is reversed); equality holds only where |Ha| = |p|^ε. Reason: p^ε ∈ Hdg means |H̃a| ≥ |p|^ε, so |p^m H̃a^{−p^m/(p−1)}| ≤ |p|^{m−εp^m/(p−1)} = |p^x|, i.e. I′_m ⊂ p^xO⁺. The proof of Lemma 7.12 uses the reversed inclusion; it is repaired by using the point's own Hodge height or by c ∈ p𝒪_p (cz + d ∈ 𝒪_p^×(1 + p^{1+x}…)).
- **HodgeTateAndCanonicalSubgroups/E21** (error, BHW, §7.1, Lemma 7.2, PDF p. 28 (arXiv:1902.03985v4)). Printed: “Lemma 7.2 ([AIP18, Cor. A.4]). We have a right exact sequence of OX+Ig(pm ) (ǫ) -modules”. Correction: Only: ω⁺ → ω⁺/I_mω⁺ factors through ω⁺_{H_m} (ker π ⊂ I_mω⁺); exactness in the middle holds for g = 1. Reason: For g ≥ 2, deg ω_{A[p^m]/H_m} = ((p^m−1)/(p−1))ε in total (Fargues), while I_mω⁺/p^m has degree g(p^m−1)ε/(p−1), so ker π ≠ I_mω⁺. Only the factorisation is used afterwards, in Definition 7.3 and Corollary 7.6.
- **HodgeTateAndCanonicalSubgroups/E22** (error, BHW, §5.2, PDF p. 21 (arXiv:1902.03985v4)). Printed: “kernel of the n-th iterated power of the Frobenius map modulo p1−ǫ . Following [Sch15], we let”. Correction: Modulo p^{1−ε(p^n−1)/(p−1)} (BHW's own Proposition 5.19(1); AIP: modulo p·Hdg^{−(p^n−1)/(p−1)}). Reason: For n ≥ 2 the congruence modulo p^{1−ε} is stronger than anything in the cited sources; it holds for n = 1. Nothing downstream uses the stronger form.
- **HodgeTateAndCanonicalSubgroups/E23** (gap, BHW, §5.3, proof of Proposition 5.18, PDF p. 24 (arXiv:1902.03985v4)). Printed: “OC ) ∼= P1 (OC )Σ with a = (av )v , b = (bv )v ∈ OCΣ , which is the image of z under πHT .”. Correction: Work only with the generic point π_HT(z) ∈ ℙ¹(C^Σ) and the congruence V/p^x = H_n ⊗ O_C/p^x; project along each σ: 𝒪_p ⊗ O_C → O_C (T4/ramified-period-comparison). Reason: 𝒪_p ⊗_{ℤ_p} O_C ≅ O_C^Σ holds only for p unramified in F; for ramified p the left side is not integrally closed and V need not be locally free over 𝒪_p ⊗ O_C. The paper claims all p. Also noted by the PerfectoidShimuraVarieties packet (its E36).
- **HodgeTateAndCanonicalSubgroups/E24** (error, BHW, §7.2, Definition 7.9 and proof of Theorem 7.14, PDF p. 29–30 (arXiv:1902.03985v4)). Printed: “k ∈ Z≥0 , let m = k + r (this is the variable “n” in [AIP16a]), so that ǫκ ≤ ǫcan m . The sheaf ωAIP”. Correction: m = k + r − 1 (as in the elliptic Definition 4.7). Reason: On W*_k, v(δ_κ) ∈ [p^{−k}, p^{−(k−1)}], so ε_κ ∈ [p^{−(k+r+1)}, p^{−(k+r)}] while ε^can_{k+r} = p^{−(k+r+1)}: 'ε_κ ≤ ε^can_m' fails for m = k + r except at the boundary; AIP (Hilbert) §4.2 requires n ≤ r + k − 1.
- **HodgeTateAndCanonicalSubgroups/E25** (misprint, BHW, §5.3, proof of Proposition 5.19, PDF p. 24 (arXiv:1902.03985v4)). Printed: “(3) The Hodge–Tate map Hn (K)∨ ⊗Z OK → ωHn ⊗OK OK has cokernel of degree ǫ/(p − 1).”. Correction: Cite AIP (Siegel), Proposition 3.2.1, not Proposition 3.2.2. Reason: The content of (2) and (3) is AIP Proposition 3.2.1 (isomorphism modulo p^{n−v(p^n−1)/(p−1)}, cokernel of degree v/(p−1)); Proposition 3.2.2 concerns HT of G[p^n] and needs v < (p−1)/(p(p^n−1)).
- **HodgeTateAndCanonicalSubgroups/E26** (misprint, BCGP21, §6.5.1, PDF p. 154 (arXiv:1812.09269v3)). Printed: “write M ∼ = ⊕ri=1 OK /xi for some xi ∈ OK , and we set deg M := i=1 v(xi mod p).”. Correction: deg M := Σ_i v(x_i) (Fargues's degree, not truncated at 1). Reason: Subgroups not killed by p occur (M_{1,w} ⊂ 𝒢_w[p²] in Lemma 6.5.12), for which the truncated sum is not Fargues's degree; the PAPER-BOXER-CALEGARI-GEE-PILLONI-21 route already corrects the item statement.
- **HodgeTateAndCanonicalSubgroups/E27** (gap, BCGP21, §6.1.4, PDF p. 141 (arXiv:1812.09269v3)). Printed: “F we can use the Koecher principle of [Lan17, Thm. 8.7].”. Correction: State the needed Koecher principle for the normalised level-p^n model with coefficients ω/p^n, or extend HT by the 1-motive argument of Pilloni–Stroh Proposition 1.5. Reason: The toroidal boundary is a divisor, so a Hartogs-type Koecher principle does not apply directly, and the citation does not address the normalised model at level p^n.

Mistakes already recorded elsewhere and used here in corrected form: PAPER-SCHOLZE-15/E3 (𝔛(ε) is a chart of the blow-up), E5 (level 1 in Theorem 3.2.15(iii)), E17 (the integral-points formula of Corollary 3.2.6 is only an inclusion in general), E25 (algebraically closed in Proposition 3.2.8(iv)); PAPER-PILLONI-20/E47 (det ω_G for multiplicative G); OverconvergentAutomorphicForms' record of BHW Definition 7.1 (order p^{mg}).
