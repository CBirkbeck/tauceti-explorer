# PAPER-CARAIANI-NEWTON-23: Caraiani–Newton, *On the modularity of elliptic curves over imaginary quadratic fields*

Ana Caraiani and James Newton, preprint, [arXiv:2301.10509](https://arxiv.org/abs/2301.10509). Read: v3 (27 March 2025, 106 pages, SHA-256 `57abc79a…d0c3`), the latest version. Caraiani's papers page lists it with no journal, and Crossref has no published version (both checked 29 September 2026).

Extraction by Claude Code, session `cc-fb70e5`, 29 September 2026 (issue #4490). Status: **complete**. `check_paper.py` passes.

The extraction has 166 items: 1 library, 36 planned and 129 missing. Every missing item is routed once, along six routes.

## What the paper proves

**Main theorems.**
- **Theorem 1.1 (= Corollary 7.1.2).** Every elliptic curve over an imaginary quadratic field F is modular, provided X₀(15)(F) is finite. This covers Q(√−d) for d = 1, 2, 3, 5 and infinitely many other fields.
- **Theorem 1.2 (= Corollary 6.1.2).** Over an imaginary CM field that is Galois over Q and does not contain ζ₅, 100% of Weierstrass equations, ordered by height, define modular curves.

**Key new ingredient (Theorems 1.3 and 4.2.15).** Local–global compatibility at p for the Galois representations that Scholze attached to torsion in the cohomology of GL_n locally symmetric spaces over a CM field. It holds in the crystalline case and in P-ordinary and ordinary variants, for any n and any weight. The prime p may be small and highly ramified; the price is a degree condition at a second p-adic place and decomposed genericity.

Its proof has three parts:
1. **P-ordinary Hida theory (§2.2).** Ordinary parts are taken for the Siegel parabolic of the unitary group G̃ in the Betti cohomology of the Shimura varieties X̃_K̃. This comes with independence of level and weight, and with the P-ordinary part of a parabolic induction computed along the Bruhat filtration (§2.3).
2. **Degree shifting at deep auxiliary level (§4.2).** The level is raised at the other p-adic places, as Scholze suggested. RΓ(U₀, O/ϖ^m) then splits (Lemma 2.3.17), and a descending induction compares spectral sequences over O and over O/ϖ^m. This replaces the hypothesis p > n², p unramified of Allen et al. (ACC+).
3. **A determinant argument (§3.2).** It turns 2n-dimensional P-ordinary crystalline characteristic-zero representations, each with an n-dimensional block congruent to ρ_m, into an integral local lift of ρ_m (Proposition 3.2.4). Theorem 3.1.2 gives the block-triangular shape of Q-ordinary automorphic Galois representations.

A characteristic-zero corollary (Theorem 4.3.1) gives crystallinity at p for regular algebraic cuspidal representations of GL_n over CM and totally real fields.

**Modularity of elliptic curves (§§5–7).**
- **§5.** A potentially Barsotti–Tate automorphy lifting theorem for GL₂ over imaginary CM fields (Theorem 5.2). It uses patching with local rings that have two components; Proposition 5.4.2 carries automorphy between components that meet in the special fibre.
- **§6.** Theorem 6.1 combines Theorem 5.2 with Allen–Khare–Thorne's mod 3 and mod 5 residual modularity, through switching propositions that prescribe the reduction types (6.1.5, 6.1.6).
- **§7.** Imaginary quadratic points are determined on X(ns3°,b5), X(b3,ns5), X(ns3°,ns5) and X(s3,ns5). The methods are rational divisor classes, a genus-2 Jacobian, and Box's relative symmetric-square Chabauty with a Mordell–Weil sieve. The remaining curves are Q-curves, curves with rational j-invariant, or explicit LMFDB curves proved modular by Faltings–Serre.

## What the atlas already has

The ten-author infrastructure is planned:
- PotentialAutomorphyInfrastructure PA.0–PA.4: the integral cohomology interface, Fontaine–Laffaille and Borel-ordinary degree shifting, derived support and auxiliary primes;
- ArithmeticLocallySymmetricSpaces ALS.0–ALS.6;
- IntegralHeckeAndGaloisDeterminants IHG.0–IHG.5;
- TorsionCohomologyInfrastructure TC.2–TC.3;
- AutomorphicGaloisRepresentationsPartII AG2.2, AG2.5, AG2.7;
- IgusaVarietiesAndTorsionConcentration IG.7 (Caraiani–Scholze concentration);
- local and global deformation rings (R08.x, L7, L8, R04.x) and patching (P8).

These give the 36 planned items. Goursat's lemma is in Mathlib (`Subgroup.goursat_surjective`).

What the atlas lacks:
- local–global compatibility at p beyond the Fontaine–Laffaille and ordinary cases. PAPER-BOXER-CALEGARI-GEE-ETAL-25 imports exactly this result from the present paper, noting that PA.1–PA.2 stop there;
- P-ordinary Hida theory for the Siegel parabolic;
- the new degree-shifting argument;
- automorphy lifting for GL₂ over CM fields with potentially Barsotti–Tate conditions at ramified p;
- modularity of elliptic curves over any field other than Q;
- quadratic points on modular curves with Cartan level.

## Routes

| Route | Kind | Owner | Items / missing |
| --- | --- | --- | ---: |
| 1 | part-ii | CrystallineLocalGlobalCompatibilityCM, Part II of PotentialAutomorphyInfrastructure | 83 / 83 |
| 2 | part-ii | EllipticCurveModularityImaginaryQuadratic, Part II of EllipticCurveModularity | 30 / 30 |
| 3 | source | EffectiveDiophantineMethods ED.4/ED.5 | 3 / 2 |
| 4 | source | LocalGaloisDeformationRings L7/L8/R08.4 | 9 / 4 |
| 5 | source | IntegralHeckeAndGaloisDeterminants IHG.1 | 7 / 4 |
| 6 | source | ArithmeticLocallySymmetricSpaces ALS.3/ALS.6 | 9 / 6 |

1. **Part II of PotentialAutomorphyInfrastructure: P-ordinary degree shifting, crystalline local–global compatibility and Barsotti–Tate lifting.** This route covers §§2–5 beyond what ALS, IHG and the local-ring layers own.
   - Its final theorems are Theorems 4.2.15, 4.3.1 and 5.2, stated exactly in the brief.
   - `make_queue.py` folds part-ii routes by parent into DESIGN-PotentialAutomorphyInfrastructurePartII (pending), with the siblings WeightZeroCrystallineAutomorphyLifting, AutomorphyLiftingBeyondTaylorWiles, PolarizedAutomorphyLifting and PotentialAutomorphyDworkMotivesPartII.
   - The brief records that WeightZeroCrystallineAutomorphyLifting imports Theorems 4.2.15 and 4.3.1, Lemma 5.3.3, Proposition 5.4.2 and Corollary 5.4.3 from here, so this route owns them.
2. **Part II of EllipticCurveModularity: elliptic curves over imaginary quadratic and CM fields.** This route covers §§6–7 and Theorems 1.1 and 1.2, as the maintainer's note asks: a Part II of the Serre-modularity direction. It folds with Bennett–Siksek's EllipticModularityEffectiveComparisons into DESIGN-EllipticCurveModularityPartII (pending). It imports Theorem 5.2 from route 1.
3. **Source for EffectiveDiophantineMethods ED.4/ED.5.** Box's relative symmetric-square Chabauty set-up, Proposition 7.4.1 and the sieve criterion of Theorem 7.4.2. The explicit curves stay in route 2.
4. **Source for LocalGaloisDeformationRings L7/L8/R08.4.** The semistable-ordinary lifting ring (Lemma 3.3.2), fixed-determinant power series (Lemma 3.3.6), Snowden's two-component ordinary ring (Proposition 5.3.2) and unique generalisation for the Barsotti–Tate ring (Lemma 5.3.3). Kisin's rings themselves (Theorem 3.3.3) and the Barsotti–Tate components (Lemma 5.3.4) are planned there already.
5. **Source for IntegralHeckeAndGaloisDeterminants IHG.1.** The §3.2 determinant argument: idempotent lifting over a Henselian base (Lemma 3.2.1), the local idempotent (Lemma 3.2.2) and the integral local lift (Proposition 3.2.4), next to the planned generalized matrix algebras and reducibility ideals.
6. **Source for ArithmeticLocallySymmetricSpaces ALS.3/ALS.6.** The topological adelic set-up of §2.1: the limit spaces, the comparison with Newton–Thorne's discrete set-up, and the projection formulas making completed cohomology independent of the weight.

## Prerequisites not covered by the atlas

- P. B. Allen, C. Khare and J. A. Thorne, Modularity of GL₂(F_p)-representations over CM fields, Camb. J. Math. 11 (2023), no. 1, 1–158. Residual modularity mod 3 and 5 (Props. 9.12–9.15), PGL₂ cohomology at non-neat level (§5), Taylor–Wiles primes and the base-change argument (Appendix A); used throughout §§5–6.
- N. Freitas, B. V. Le Hung and S. Siksek, Elliptic curves over real quadratic fields are modular, Invent. Math. 201 (2015), no. 1, 159–206. The model for §7: modular curves X(H₁,H₂), Lemma 2.2 on Cartan images, Q-curves (§12).
- J. Newton and J. A. Thorne, Torsion Galois representations over CM fields and Hecke algebras in the derived category, Forum Math. Sigma 4 (2016), e21. The equivariant-sheaf formalism, Hecke algebras in the derived category, boundary stratification and Satake maps used in §§2 and 4.
- T. Koshikawa, On the generic part of the cohomology of local and global Shimura varieties, preprint, arXiv:2106.10602. Theorem 1.4 removes the length-two and [F⁺:Q] > 1 hypotheses of Caraiani–Scholze in Theorem 2.1.28.
- D. Geraghty, Modularity lifting theorems for ordinary Galois representations, Math. Ann. 373 (2019), 1341–1427. Rescaled Hecke actions, semistable-ordinary representations and their deformation rings (Defs. 2.8, 3.8, Lemmas 3.9–3.10, 5.6).
- A. Snowden, Singularities of ordinary deformation rings, Math. Z. 288 (2018), 759–781. Components of the two-dimensional ordinary lifting ring (Prop. 5.3.2).
- A. Caraiani, M. Emerton, T. Gee and D. Savitt, The geometric Breuil–Mézard conjecture for two-dimensional potentially Barsotti–Tate Galois representations, Algebra Number Theory 19 (2025), 287–312. Generic reducedness of Barsotti–Tate special fibres (Theorem 1.3), used in Lemma 5.3.3.
- J. Box, Quadratic points on modular curves with infinite Mordell–Weil group, Math. Comp. 90 (2021), 321–343. The relative symmetric-square Chabauty method and Mordell–Weil sieve of §7.4.
- S. Siksek, Chabauty for symmetric powers of curves, Algebra Number Theory 3 (2009), 209–236. Symmetric-power Chabauty underlying Box's method.
- J. Hauseux, Parabolic induction and extensions, Algebra Number Theory 12 (2018), 779–831; and Extensions entre séries principales p-adiques et modulo p, J. Inst. Math. Jussieu 15 (2016), 225–270. The Bruhat filtration of parabolic induction and its ordinary parts (§2.3.1).
- M. Emerton, Ordinary parts of admissible representations of p-adic reductive groups I, II, Astérisque 331 (2010), 355–402, 403–459. The ordinary-part functors and top-degree U₀-cohomology used in §§2.2–2.3.
- F. Herzig, K. Koziol and M.-F. Vignéras, On the existence of admissible supersingular representations of p-adic reductive groups, Forum Math. Sigma 8 (2020), e2. Lemma 6.4.1 (Newton above Hodge with its equality case), used in Lemmas 3.1.3 and 3.3.2.
- J. Tilouine and E. Urban, Several-variable p-adic families of Siegel–Hilbert cusp eigensystems and their Galois representations, Ann. Sci. ÉNS 32 (1999), 499–574. The P-ordinary Hida theory for GSp₄ that §2.2 extends.
- P. B. Allen and J. Newton, Monodromy for some rank two Galois representations over CM fields, Doc. Math. 25 (2020), 2487–2506. Lemma 2.3 (big image implies decomposed generic), used in Corollary 6.1.2.
- D. Zywina, Elliptic curves with maximal Galois action on their torsion points, Bull. London Math. Soc. 42 (2010), 811–826. Quantitative Hilbert irreducibility (Prop. 5.2), used in Corollary 6.1.2.
- M. Harris, K.-W. Lan, R. Taylor and J. Thorne, On the rigid cohomology of certain Shimura varieties, Res. Math. Sci. 3 (2016), 37. The Galois representations r_ι(π) of Theorem 4.3.1.
- B. Hevesi, Ordinary parts and local-global compatibility at ℓ = p, preprint, arXiv:2311.13514. The potentially semistable generalisation of Theorem 1.3 (Remark 1.3.1).

Scholze's torsion paper and the Caraiani–Scholze papers are already in the paper list.

## Source issues

Eleven misprints, each checked on the page image of v3. None affects a result, and all are new (no newer version or erratum exists).

| id | where | slip |
| --- | --- | --- |
| E1 | Theorem 3.3.3 (1), (3) and (5), p.52 | ρ^{univ}_v ⊗_{R^□_{ρ̄_v},ζ} B |
| E2 | §3.3.5, p.52 | R^{△,λ_v,ψ}_{ρ̄_v} = R^{△,λ_v}_{ρ̄_v} ⊗_{R^□_{ρ̄_v}} R^{□,ψ}_{ρ̄_v} |
| E3 | Lemma 3.1.3, second part, p.44 | σ ∈ S_m |
| E4 | Propositions 6.1.5 (3) and 6.1.6 (3), pp.89–90 | E_{L_w} |
| E5 | Proof of Corollary 7.1.2, last paragraph, p.93 | the only quadratic field F with X(s3,b5)(Q) ⊊ X(s3,b5)(F)^{tors} is F = Q(√5) |
| E6 | Lemma 2.2.16, statement, p.31 | V_{λ_τ̃} ⊗ V_{−w_{0,n}λ_{τ̃c}} |
| E7 | Proposition 2.1.14, p.18 | defined at the end of §2.1.2 |
| E8 | §2.1.13, p.21, rescaled action for G | g ·_λ x = α^{Q_v̄}_λ(g)^{−1} g · x |
| E9 | Proposition 7.4.4 (3) and proof of Proposition 7.4.5, pp.100–101 | ⟨5G₂, Jac_{C₂}(Q)[2]⟩ |
| E10 | Proof of Lemma 4.2.5, even case, p.62 | Σ_{v̄∉S̄} n²[F⁺_{v̄} : Q_p] |
| E11 | (2.1.6), p.18 | (−1)^j q_v^{j(j−1)/2} T̃_{v,j} X^{2n−j} |

Not recorded: the spelling slips 'Them E is modular' (Corollary 6.1.1), 'ireducible' (Theorem 6.1) and 'strenghtens' (Remark 5.2.3).

## How the items were checked

- Every numbered statement of the paper appears in an item locator. Remarks 1.2.1, 1.3.2 and 5.2.1–5.2.3 are recorded in item notes.
- Planned statuses cite the stage texts of data/atlas.json read on 29 September 2026.
- Library citations were checked in the pinned declaration index (Mathlib 082e2d3, Tau Ceti f790474).
- The Magma computations of §7 (the files cited in the paper) are recorded as the paper's claims. The route 2 brief asks for checkable certificates.
