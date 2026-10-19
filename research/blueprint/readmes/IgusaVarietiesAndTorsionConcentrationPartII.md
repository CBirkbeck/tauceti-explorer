# Roadmap: Igusa varieties, compactified period fibres and torsion concentration, Part II — compact unitary Shimura varieties

**Summary.** This roadmap proves the compact theorem of Caraiani and Scholze, *On the generic part of the cohomology of compact unitary Shimura varieties* (Ann. of Math. 186 (2017)): for a compact unitary Shimura variety S\_K of Kottwitz's simple type or of quasi-split type with F⁺ ≠ ℚ, every system of Hecke eigenvalues 𝔪 in H^\*(S\_K, 𝔽\_ℓ) has a Galois representation ρ\_𝔪, and if ρ\_𝔪 is decomposed generic at a suitable auxiliary prime split in the imaginary quadratic field 𝒦, the localized cohomology H^\*(S\_K, 𝔽\_ℓ)\_𝔪 is concentrated in the middle degree dim S\_K. Layer IG.8 fixes the data, the Hecke algebras, the dual ideal and Poincaré duality, and the auxiliary primes; Layer IG.9 proves that generic Igusa cohomology lives on the μ-ordinary stratum for the quasi-split datum (Theorem 5.5.7); Layer IG.10 does the same for Kottwitz's simple Shimura varieties (Corollaries 5.6.2–5.6.3); Layer IG.11 assembles Theorem 6.3.1, Theorem 1.1 and their integral and twisted-coefficient forms.

This roadmap is Part II of *Igusa varieties, compactified period fibres and torsion concentration* (IgusaVarietiesAndTorsionConcentration) and starts where that roadmap stops. The parent constructs central leaves, perfect and Mantovan Igusa varieties for unramified PEL data of type (A) and (C), identifies the stalks of the pushforward along the Hodge–Tate period map with Igusa cohomology for compact PEL data (its IG.3, CS17 Theorem 4.4.4), proves the perversity of nearby cycles and the concentration at a minimal Newton stratum for compact data (its IG.4, CS17 Proposition 6.1.3 and Corollary 6.1.4), and owns Lemma 6.2.2 on lifts of decomposed-generic representations (its IG.5). Its trace-formula and end-theorem layers are written for the quasi-split U(n, n) datum of the non-compact sequel at a totally split prime. This Part II supplies the compact data of every rank and signature, auxiliary primes that are only split in 𝒦, the trace comparisons for these data, and the end theorems of the compact paper.

## Scope and ownership

**Owned here.** Compact unitary PEL data of Cases 1 and 2 with their signatures, dimension and moduli problem; smooth proper integral models at good primes; the local datum at a prime split in 𝒦, the sets S\_i, the product decomposition of B(G, μ^{−1}) with the central correction; the Hecke algebra 𝕋^S, the operators T\_{i,v} and the Hecke polynomial; the dual ideal and Hecke-equivariant Poincaré duality on S\_K and on Mantovan's Igusa varieties; CS-auxiliary pairs and their existence (IG.8). The stable Igusa trace identity, the spectral expansion and the r-part of the Igusa class for the quasi-split compact datum of rank n and any signature; the Newton reduction lemma for generic principal series; the lemma on non-μ-ordinary classes and Theorem 5.5.7 (IG.9). The absence of endoscopy for Kottwitz's simple Shimura varieties, the stable Lefschetz identity for the proper Shimura variety, the Igusa cohomology formula, the r-part and Corollary 5.6.3; the statement of the Case 1 Galois representations (IG.10). The contraction lemma, Hochschild–Serre to perfectoid level, the Leray reduction to Igusa varieties, the minimal-stratum constituent, Theorem 6.3.1, Theorem 1.1 and Remarks 1.3 and 1.7.1 (IG.11).

**Built in the libraries and cited.** Mathlib's CM fields (`NumberField.IsCMField`, `NumberField.maximalRealSubfield`), the Hecke ring `HeckeRing` of double cosets, localization (`Localization.AtPrime`, `IsLocalization`) and free modules (`Module.Free`); Tau Ceti's ring structure on the Hecke ring (`HeckeCosetModule.instRingHeckeRing`) and its anti-involution formalism (`HeckeAntiInvolution.ofAmbient`, `HeckeAntiInvolution.onHeckeCoset`).

**Built in other roadmaps and cited.** The parent IgusaVarietiesAndTorsionConcentration IG.0–IG.5 (local PEL data, Mantovan Igusa varieties and their cohomology, the compact fibre theorem, compact perversity and minimal-stratum concentration, the dual-ideal formalism, Igusa Poincaré duality, Lemma 6.2.2). EndoscopicTransferAndUnitaryTraceComparison ET.0, ET.4–ET.7b (elliptic endoscopic data of unitary similitude groups of every rank, Shin's stable trace formula for Igusa varieties of PEL type (A), the stable–twisted identity for every rank and archimedean signature, archimedean Lefschetz functions, the twisted spectral side, Newton reduction and its trace duality, the Frobenius-twist extension, Badulescu's principal-series nontransfer). AutomorphicGaloisRepresentationsPartII AG2.1a–AG2.7 (Galois representations of conjugate self-dual automorphic representations, the Caraiani–Scholze discrete normalization of Corollary 5.5.5 and Remark 5.5.6, local–global compatibility, decomposed genericity, Galois-type maximal ideals and dual ideals, Chebotarev for generic primes). BunGAndNewtonStrata BG0–BG1 (J\_b, products and restriction of scalars, the ordinary class, Lemma 5.5.8). PELModuli M0–M6, ShimuraCompactifications C1 and C5, PerfectoidShimuraVarieties S2–S3, AutomorphicSpectralTheory AS.4 and AS.6, ArithmeticLocallySymmetricSpaces ALS.5, EtaleDualityAndPerverseSheaves EDC.2 and EDC.6, ClassicalAdicEtaleCohomology H0 and H5, DiamondEtaleCohomology C0, SchemeAndStackFoundations SF.2, ArithmeticGaloisDuality R02.2 and D7, ArithmeticGaloisRepresentations R01.1 and R01.5, AlgebraicModularFormsAndSerreWeights R15.5, AutomorphicLFunctionsAndLocalFactors AL.3, IntegralHeckeAndGaloisDeterminants IHG.1, SmoothRepresentationsOfLocalGroups SR.1, SR.2, SR.4.

**Not here.** The ordinary Igusa formal schemes of Siegel varieties over ℤ\_p of Boxer–Pilloni are a separate direction of the same parent and are proposed as a roadmap of their own (see Restructuring). Base change for the division-algebra groups of Case 1 is requested from AutomorphicGaloisRepresentationsPartII AG2.2 and recorded as a gap.

## Conventions

F = F⁺·𝒦 is a CM field with F⁺ totally real and 𝒦 ⊂ F imaginary quadratic; c is complex conjugation. Spl\_{F/F⁺} is the set of rational primes all of whose places in F⁺ split in F, Spl\_{𝒦/ℚ} the set of primes split in 𝒦. G is the unitary similitude group of the datum, (p\_τ, q\_τ) its signature at τ : F ↪ ℂ, μ the Hodge cocharacter (μ(t) = diag(t^{(p\_τ)}, 1^{(q\_τ)}) in the τ-factor), E the reflex field and d = Σ\_{τ∈Φ} p\_τq\_τ = ⟨2ρ, μ⟩ = dim S\_K. Newton classes lie in B(G, μ^{−1}) with the covariant normalization of the parent (slopes in \[−1, 0\]); d\_b = ⟨2ρ, ν\_b⟩, and the μ-ordinary class is the maximal element of B(G, μ^{−1}).

ι\_ℓ : ℚ̄\_ℓ ≅ ℂ is fixed. At an auxiliary prime p = uu^c split in 𝒦, ι\_p : ℚ̄\_p ≅ ℂ is compatible with a chosen prime 𝔭 | p of E, the primes 𝔭\_1, …, 𝔭\_m of F lie above u, and S\_i = {τ | ι\_p^{−1}∘τ induces 𝔭\_i}; the source prints ι\_p∘τ. Hecke polynomials P\_v(X) = Σ\_i (−1)^i q\_v^{i(i−1)/2}T\_{i,v}X^{n−i} are matched with geometric Frobenius as in AutomorphicGaloisRepresentationsPartII AG2.0; decomposed genericity (λ\_a/λ\_b ∉ {1, q} for a ≠ b) does not depend on the choice of Frobenius. The involution ι of 𝕋^S sends \[KgK\] to \[Kg^{−1}K\], and 𝔪^∨ = ι(𝔪).

Red^b\_n⃗ is the normalized Newton reduction including the modulus twist δ̄^{1/2}\_{P(ν\_b)} (PAPER-CARAIANI-SCHOLZE-17/E74). In the trace layers S′ = S ∪ {∞, p} ∪ Ram(ϖ), with ϖ a Hecke character of 𝒦 extending the quadratic character of 𝒦/ℚ and ramified only at primes of Spl\_{F/F⁺}; BC^{S′} is the base change outside S′ used throughout (E85). Localization at 𝔪 is always replaced, at infinite level at p, by localization at its contraction to 𝕋^{S∪{p}} (E97). All cohomology is étale cohomology after base change to an algebraically closed field.

## How to read the build

| Layer | Title | Headline targets |
| --- | --- | --- |
| IG.8 | Compact unitary PEL data, Hecke algebras and duality | `CompactUnitaryDatum`, `SplitPrimeDatum`, `compactUnitaryHecke`, dual ideal, Hecke-equivariant Poincaré duality, `IsCSAuxiliaryPair` |
| IG.9 | Generic principal series and the μ-ordinary obstruction for the quasi-split datum | stable Igusa trace identity, Newton reduction lemma, spectral expansion, `igusaGaloisPart`, Theorem 5.5.7 |
| IG.10 | Kottwitz's simple Shimura varieties | simple Igusa trace identity, stable Lefschetz identity, Corollary 5.6.2, `simpleIgusaGaloisPart`, Corollary 5.6.3 |
| IG.11 | Torsion concentration for compact unitary Shimura varieties | Hochschild–Serre to perfectoid level, Leray reduction, Theorem 6.3.1(1)–(2), Theorem 1.1, Remarks 1.3 and 1.7.1 |

IG.8 is used by every other layer. IG.9 (Case 2) and IG.10 (Case 1) are parallel, except that IG.10 reuses the two local lemmas of IG.9 (Newton reduction of generic principal series, non-μ-ordinary classes). IG.11 combines both cases with the parent's geometry: Hochschild–Serre and the Leray sequence for π\_HT reduce the statement to Igusa varieties, the parent's minimal-stratum concentration concentrates the minimal Newton class in one degree, and IG.9 or IG.10 forces it to be μ-ordinary.

## Layer IG.8: Compact unitary PEL data, Hecke algebras and duality

The datum, its integral models and the local picture at an auxiliary prime split in 𝒦; the Hecke algebra with its involution and Poincaré duality; the condition on an auxiliary prime and how to find one. Each of the following layers states its theorems for a datum of this layer.

*Layer dependencies:* parent IG.0, parent IG.1, parent IG.5, PELModuli M0, PELModuli M1, PELModuli M2, PELModuli M3, PELModuli M4, PELModuli M5, ShimuraCompactifications C1, ShimuraCompactifications C5, BunGAndNewtonStrata BG0, BunGAndNewtonStrata BG1, SmoothRepresentationsOfLocalGroups SR.1, SmoothRepresentationsOfLocalGroups SR.4, AutomorphicGaloisRepresentationsPartII AG2.7, EtaleDualityAndPerverseSheaves EDC.2:pairings, ArithmeticLocallySymmetricSpaces ALS.5:finite-level-duality, ArithmeticGaloisRepresentations R01.1, ArithmeticGaloisRepresentations R01.5.

### IG.8.1 Compact unitary PEL data of Caraiani–Scholze (Cases 1 and 2)

Define (definition, node `IG.8/compact-unitary-pel-datum`): Let F⁺ be a totally real field, 𝒦 an imaginary quadratic field and F = F⁺·𝒦 their compositum, a CM field with complex conjugation c. A compact unitary PEL datum of Caraiani–Scholze type is a rational PEL datum (B, \*, V, ⟨·,·⟩, h) of type (A) whose similitude group G over ℚ satisfies one of the following.

Case 1 (Kottwitz's simple Shimura varieties). B is a central division algebra over F of degree n, \* is an involution of the second kind (it restricts to c on F), and V ≅ B is the simple left B-module.

Case 2. B = F, \* = c, V is an F-vector space of dimension n with an alternating form ⟨·,·⟩ hermitian for c, F⁺ ≠ ℚ, G is quasi-split at every finite place, and every rational prime ramified in F lies in Spl\_{F/F⁺}, the set of rational primes q such that every place of F⁺ above q splits in F.

In both cases one assumes the Shimura varieties are compact: G^ad is anisotropic over ℚ. The datum fixes: the signatures (p\_τ, q\_τ) of G\_ℝ at each embedding τ : F ↪ ℂ, with p\_τ + q\_τ = n and (p\_{τc}, q\_{τc}) = (q\_τ, p\_τ); the Hodge cocharacter μ and the reflex field E ⊂ ℂ; a finite set S of rational primes such that F and G are unramified outside S (in Case 2 with S ⊂ Spl\_{F/F⁺}); and a sufficiently small compact open K = K\_S·K^S ⊂ G(𝔸\_f) with K^S a product of hyperspecial maximal compact subgroups K\_q ⊂ G(ℚ\_q). S\_K denotes the PEL moduli problem over E, which is the disjoint union of |ker¹(ℚ, G)| copies of the Shimura variety Sh\_K(G, X), and d := dim S\_K = Σ\_{τ∈Φ} p\_τq\_τ for any CM type Φ of F; equivalently d = ⟨2ρ, μ⟩.

*Hypotheses.*
- F = F⁺·𝒦 with F⁺ totally real and 𝒦 imaginary quadratic; the field 𝒦 is part of the datum.
- Case 1: B a central division algebra over F with an involution of the second kind, V ≅ B.
- Case 2: B = F, F⁺ ≠ ℚ, G quasi-split at all finite places, ramified primes of F in Spl\_{F/F⁺}, S ⊂ Spl\_{F/F⁺}.
- Compactness: G^ad anisotropic over ℚ (automatic in Case 1).
- K = K\_S K^S sufficiently small (neat), K^S hyperspecial.

*Construction.*
- Take the rational PEL datum, its similitude group and its signatures from PELModuli M0 (PELModuli M0 (node `rational-pel-datum`), PELModuli M0 (node `similitude-group`), PELModuli M0 (node `signatures`)); for Case 2 the unitary PEL data with prescribed signatures are PELModuli M5 (node `unitary-pel-datum`).
- The involution of the second kind gives type (A) in Kottwitz's classification (PELModuli M0 (node `albert-types`); the page reference of CS17 p. 730 is corrected to \[Kot92b\] in PAPER-CARAIANI-SCHOLZE-17/E63).
- The moduli problem S\_K and its decomposition into |ker¹(ℚ, G)| copies of Sh\_K(G, X) are PELModuli M3 (node `ker1-classification`) and PELModuli M4 (node `canonical-model-identification`); the dimension formula is PELModuli M2 (node `kodaira-spencer-dimension`).
- Record the two cases as two constructors of one structure, so that every statement of Layers IG.9–IG.11 names the case it uses.

*Sources.* \[CS17\], §6.3, opening paragraphs, pp. 756–757: Fixes a compact PEL Shimura variety of type A with F = F⁺𝒦 and states the two cases (division algebra with V ≅ B; or B = F, F⁺ ≠ ℚ, quasi-split at finite places, ramified primes split over F⁺), the set S, the level K = K\_S K^S and the Hecke algebra. \[CS17\], §5.1, pp. 730–731: States the Case 2 assumptions (1)–(3) with footnote 27 that (2) implies (1), the PEL datum (F, c, V, ⟨·,·⟩, h) of type (A), and that S\_K denotes the moduli problem, |ker¹| copies of the Shimura variety. \[CS17\], §5.6, p. 749: Describes Kottwitz's simple Shimura varieties: B a division algebra with centre F, V simple, \* of the second kind; S\_K is proper and G has no endoscopy.

*Uses.* CS17 Theorem 6.3.1 and Theorem 1.1: the two cases are the hypotheses of the main theorem; CS17 §5.1–5.5: Case 2 is the setting of the twisted trace formula comparison; CS17 §5.6: Case 1 is the setting of the simple trace formula comparison; Layer IG.11 of this roadmap: every concentration statement is stated for a datum of this type.

The API:
- `CompactUnitaryDatum` (structure): The data (F⁺, 𝒦, B, \*, V, ⟨·,·⟩, h) with the case tag and the compactness hypothesis.
- `CompactUnitaryDatum.case1` (constructor): Builds a Case 1 datum from a central division algebra B over F with an involution of the second kind and V = B.
- `CompactUnitaryDatum.case2` (constructor): Builds a Case 2 datum from a hermitian F-space of dimension n with F⁺ ≠ ℚ, quasi-split local groups at finite places and ramification inside Spl\_{F/F⁺}.
- `CompactUnitaryDatum.signature` (projection): τ ↦ (p\_τ, q\_τ) with p\_τ + q\_τ = n and signature(τ ∘ c) = swap(signature τ).
- `CompactUnitaryDatum.dim` (projection): d = Σ\_{τ∈Φ} p\_τ q\_τ, independent of the CM type Φ.
- `CompactUnitaryDatum.dim_eq_two_rho_mu` (characterisation): d = ⟨2ρ, μ⟩ for the Hodge cocharacter μ.
- `CompactUnitaryDatum.toPELDatum` (coercion): The underlying rational PEL datum of PELModuli M0, of type (A).
- `CompactUnitaryDatum.moduli_eq_ker1_copies` (relation): S\_K is the disjoint union over ker¹(ℚ, G) of Sh\_K of the inner forms G^{(i)} (PELModuli M3–M4).

*Needs:* PELModuli M0 (node `rational-pel-datum`); PELModuli M0 (node `similitude-group`); PELModuli M0 (node `signatures`); PELModuli M0 (node `albert-types`); PELModuli M0 (node `reflex-field`); PELModuli M5 (node `unitary-pel-datum`); PELModuli M3 (node `ker1-classification`); PELModuli M4 (node `canonical-model-identification`); PELModuli M2 (node `kodaira-spencer-dimension`); Mathlib `NumberField.IsCMField`; Mathlib `NumberField.maximalRealSubfield`.

**Checks.**

- `CompactUnitaryDatum.dim_torus` (degenerate): For n = 1 (Case 2) every signature is (1,0) or (0,1) and dim = 0.
- `CompactUnitaryDatum.dim_harris_taylor` (computation): For \[F⁺:ℚ\] = 2, n = 3 and signatures (1,2) at τ₀, (0,3) at τ₁ (τ₀, τ₁ ∈ Φ), dim = 1·2 + 0·3 = 2.
- `CompactUnitaryDatum.signature_conj` (characterisation): signature(τ ∘ c) = (q\_τ, p\_τ); a definition storing an independent signature at τc fails this.
- `CompactUnitaryDatum.case2_not_imaginaryQuadratic` (non-example): F = 𝒦 (F⁺ = ℚ) with B = F does not give a Case 2 datum.
- `CompactUnitaryDatum.case2_indefinite_not_compact` (non-example): Case 2 with n = 3 and signature (1, 2) at every τ ∈ Φ is not compact: a hermitian space of dimension ≥ 3 is isotropic at every finite place, so by the Hasse principle for hermitian forms it is isotropic when indefinite at every real place of F⁺, and G^ad is then isotropic.
- `CompactUnitaryDatum.toPELDatum_typeA` (compatibility): The underlying PEL datum has type (A) in the classification of PELModuli M0 (node `albert-types`).
- In Case 2 with n = 1 the group G is a torus, S\_K is finite étale over E and d = 0.
- For the Harris–Taylor signature ((1, n−1) at one τ₀ ∈ Φ and (0, n) at the other τ ∈ Φ) one has d = n − 1.
- Case 2 with F⁺ = ℚ is excluded: then F = 𝒦 and the trace-formula input of Layer IG.9 is not available.

### IG.8.2 Smooth proper integral models of compact unitary Shimura varieties at good primes

Prove (theorem, node `IG.8/proper-smooth-integral-model`): Let (B, \*, V, ⟨·,·⟩, h) be a compact unitary datum (Case 1 or 2) and p a prime outside S, so that F and G are unramified at p (in Case 1, B is split at every place of F above p), and let K = K\_pK^p with K\_p hyperspecial and K^p neat. For a prime 𝔭 | p of E the PEL moduli problem gives a scheme 𝒮\_K over O\_{E,𝔭} which is smooth and proper of relative dimension d, with generic fibre S\_K ⊗\_E E\_𝔭; the prime-to-p Hecke correspondences extend to finite étale correspondences of the 𝒮\_K. In particular every compact unitary datum satisfies the hypothesis 'S\_{K^pK\_p} proper over O\_{E,𝔭}' of the compact fibre theorem.

*Hypotheses.*
- p ∉ S; K\_p hyperspecial; K^p neat.
- Case 1 or Case 2 with G^ad anisotropic over ℚ.

*Proof sketch.*
- Representability and smoothness of the PEL moduli problem at a good prime: PELModuli M2 (node `representability`); relative dimension d from PELModuli M2 (node `kodaira-spencer-dimension`).
- Case 1: End\_B(V) = B^op is a division algebra, so the moduli problem is proper by PELModuli M2 (node `properness-when-division`).
- Case 2: the boundary of the smooth toroidal compactification of ShimuraCompactifications C5 (node `integral-toroidal-space`) is indexed by cusp labels (ShimuraCompactifications C1 (node `cusp-label`)), which come from rational parabolic subgroups of G; G^ad anisotropic means there are none, so the toroidal compactification equals the moduli problem and the latter is proper (valuative properness of the toroidal compactification).
- Prime-to-p Hecke correspondences: level change and Hecke action PELModuli M1 (node `hecke-action`) and finite étaleness of level-forgetting maps PELModuli M6 (node `level-forgetting-maps`).

*Sources.* \[CS17\], §5.1, pp. 730–731: States that since p is unramified in F, good integral models of S\_K exist over O\_{E\_𝔭} at hyperspecial level. \[CS17\], §4.4, statement of Theorem 4.4.4, p. 726, and §6.3, p. 756: The compact fibre theorem assumes the integral model proper; §6.3 fixes a compact Shimura variety of PEL type, so the properness used there is that of the integral model.

*Needs:* PELModuli M2 (node `representability`); PELModuli M2 (node `kodaira-spencer-dimension`); PELModuli M2 (node `properness-when-division`); ShimuraCompactifications C5 (node `integral-toroidal-space`); ShimuraCompactifications C1 (node `cusp-label`); PELModuli M1 (node `hecke-action`); PELModuli M6 (node `level-forgetting-maps`); IG.8.1.

**Checks.**

- n = 1 (Case 2): 𝒮\_K is finite étale over O\_{E,𝔭}.
- A Case 2 datum with G^ad isotropic (not allowed here) has nonempty boundary and its moduli problem is not proper.

### IG.8.3 The local datum at an auxiliary prime split in 𝒦 and the sets S_i

Construct (construction, node `IG.8/split-prime-decomposition`): Let p ∉ S be a rational prime split in 𝒦, p = u·u^c, and let 𝔭\_1, …, 𝔭\_m be the primes of F above u (so pO\_F = ∏\_i 𝔭\_i𝔭\_i^c and the 𝔭\_i correspond to the primes of F⁺ above p). Fix a prime 𝔭 | p of E and an isomorphism ι\_p : ℚ̄\_p ≅ ℂ compatible with E ↪ ℂ and E ↪ E\_𝔭 ↪ ℚ̄\_p. Then:

(1) G\_{ℚ\_p} ≅ ∏\_{i=1}^m Res\_{F\_{𝔭\_i}/ℚ\_p} GL\_n × 𝔾\_m, the last factor being the similitude factor, through the projection V ⊗ ℚ\_p → ⊕\_i V ⊗\_F F\_{𝔭\_i} (in Case 1 after a choice of splitting of B ⊗\_F F\_{𝔭\_i}); hence G(ℚ\_p) ≅ ∏\_i GL\_n(F\_{𝔭\_i}) × ℚ\_p^× and every irreducible π\_p of G(ℚ\_p) is ⊗\_i π\_{𝔭\_i} ⊗ π\_0.

(2) S\_i := {τ : F ↪ ℂ | ι\_p^{−1} ∘ τ : F ↪ ℚ̄\_p induces 𝔭\_i}; the S\_i are pairwise disjoint and their union is the set of embeddings inducing a prime above u.

(3) μ = ((μ\_i)\_i, μ\_0) with μ\_i = (μ\_{i,τ})\_{τ∈S\_i} and μ\_{i,τ}(t) = diag(t^{(p\_τ)}, 1^{(q\_τ)}) in GL\_n.

(4) B(G, μ^{−1}) = ∏\_i B(G\_i, μ\_i^{−1}) with G\_i = Res\_{F\_{𝔭\_i}/ℚ\_p} GL\_n, and for b = ((b\_i), b\_0) one has J\_b ≅ ∏\_i J\_{b\_i} × 𝔾\_m.

(5) If S\_i contains exactly one τ with p\_τq\_τ ≠ 0, let c\_i be the number of τ′ ∈ S\_i with signature (n, 0); Shapiro's bijection and multiplication by the central element p^{c\_i} identify B(G\_i, μ\_i^{−1}) with B(GL\_n/F\_{𝔭\_i}, μ\_{i,τ}^{−1}), preserving J\_b up to restriction of scalars and the μ-ordinary class. If S\_i contains no such τ, μ\_i is central and B(G\_i, μ\_i^{−1}) is a single point.

*Hypotheses.*
- p ∉ S, p split in 𝒦; in Case 1, B split above p (automatic for p ∉ S).
- ι\_p compatible with the chosen 𝔭 | p of E.

*Construction.*
- The decomposition of G\_{ℚ\_p} follows from F ⊗ ℚ\_p = ∏\_i (F\_{𝔭\_i} × F\_{𝔭\_i^c}) and the hermitian pairing identifying the 𝔭\_i^c-part with the dual of the 𝔭\_i-part (PELModuli M0 (node `unramified-tau-decomposition`); the local datum is parent IG.0 (node `IG.0/unramified-local-pel-datum`)).
- The sets S\_i are defined with ι\_p^{−1} ∘ τ; CS17 prints ι\_p ∘ τ, which is undefined (PAPER-CARAIANI-SCHOLZE-17/E86).
- Products and unramified restriction of scalars in B(G): BunGAndNewtonStrata BG1 (node `product-and-unramified-norm`), with J\_b^G ≅ Res J\_{Nm(b)}^H.
- The central correction p^{c\_i} is PAPER-CARAIANI-SCHOLZE-17/E87: the Shapiro bound is the sum of the components μ\_{i,τ′} over τ′ ∈ S\_i, i.e. μ\_{i,τ} + c\_i·z with z(t) = t·I\_n; multiplication by the central Frobenius-fixed p^{c\_i} is a bijection of Kottwitz sets preserving J\_b and the maximal element.

*Sources.* \[CS17\], §5.4, p. 740: Writes p = uu^c in 𝒦, the primes 𝔭\_i of F⁺ and of F above u, the decomposition G\_{ℚ\_p} = ∏ Res GL\_n × 𝔾\_m via the projection of V ⊗ ℚ\_p, the decomposition of b ∈ B(G), J\_b and of irreducible representations. \[CS17\], Theorem 5.5.7 and its proof, pp. 747–748: Defines the sets S\_i, decomposes μ, identifies B(G, μ^{−1}) with the product of the B(G\_i, μ\_i^{−1}) and each nontrivial factor with a Kottwitz set of GL\_n over F\_{𝔭\_i}; footnote 30 notes the restriction-of-scalars identification.

*Uses.* CS17 Theorem 5.5.7: the hypothesis on the sets S\_i and the reduction to Lemma 5.5.8; CS17 Lemma 5.4.3: representations of G\_n⃗(ℚ\_p) factor over the 𝔭\_i; CS17 Theorem 6.3.1(2): the auxiliary-prime condition is stated through the sets S\_i.

The API:
- `SplitPrimeDatum.places` (data): The primes 𝔭\_1, …, 𝔭\_m of F above u, in bijection with the primes of F⁺ above p.
- `SplitPrimeDatum.embeddingSet` (data): S\_i = {τ | ι\_p^{−1}∘τ induces 𝔭\_i}.
- `SplitPrimeDatum.embeddingSet_disjoint` (relation): S\_i ∩ S\_j = ∅ for i ≠ j, and τ ∈ ⋃S\_i iff τc ∉ ⋃S\_i.
- `SplitPrimeDatum.groupIso` (equivalence): G\_{ℚ\_p} ≅ ∏\_i Res\_{F\_{𝔭\_i}/ℚ\_p} GL\_n × 𝔾\_m.
- `SplitPrimeDatum.kottwitzSet_prod` (equivalence): B(G, μ^{−1}) ≅ ∏\_i B(G\_i, μ\_i^{−1}), compatible with J\_b.
- `SplitPrimeDatum.kottwitzSet_shapiro` (equivalence): For S\_i with a single nontrivial τ: B(G\_i, μ\_i^{−1}) ≅ B(GL\_n/F\_{𝔭\_i}, μ\_{i,τ}^{−1}) through Shapiro and the central twist p^{c\_i}.
- `SplitPrimeDatum.kottwitzSet_central` (characterisation): If S\_i has no τ with p\_τq\_τ ≠ 0 then B(G\_i, μ\_i^{−1}) is a singleton.

*Needs:* PELModuli M0 (node `unramified-tau-decomposition`); parent IG.0 (node `IG.0/unramified-local-pel-datum`); BunGAndNewtonStrata BG1 (node `product-and-unramified-norm`); BunGAndNewtonStrata BG0 (node `sigma-centralizer-J-b`); BunGAndNewtonStrata BG1 (node `admissible-pair`); IG.8.1.

**Checks.**

- `SplitPrimeDatum.totally_split` (computation): If p splits completely in F then |S\_i| = 1 for all i and m = \[F⁺:ℚ\].
- `SplitPrimeDatum.harris_taylor_single` (computation): For the Harris–Taylor signature and a suitable 𝔭, exactly one S\_i contains an embedding with p\_τq\_τ ≠ 0, namely τ₀ with (p,q) = (1, n−1).
- `SplitPrimeDatum.central_twist` (characterisation): If S\_i = {τ, τ′} with (p\_τ,q\_τ) = (1,1) and (p\_{τ′},q\_{τ′}) = (2,0) (n = 2), the Shapiro bound is diag(t²,t) = μ\_{i,τ}·z, and multiplication by p gives a bijection onto B(GL\_2/F\_{𝔭\_i}, μ\_{i,τ}^{−1}); without the twist the two Kottwitz sets have different κ.
- `SplitPrimeDatum.composite_undefined` (non-example): The printed set {τ | ι\_p ∘ τ induces 𝔭\_i} is not defined: τ lands in ℂ and ι\_p has source ℚ̄\_p.
- If p splits completely in F then every S\_i is a singleton and m = \[F⁺:ℚ\].
- For n = 1 every B(G\_i, μ\_i^{−1}) is a point.

### IG.8.4 The Hecke algebra 𝕋^S, the operators T_{i,v} and the Hecke polynomial

Define (definition, node `IG.8/hecke-algebra-and-polynomial`): Let Spl\_{𝒦/ℚ} be the set of rational primes split in 𝒦 and ℓ a prime. The abstract Hecke algebra is 𝕋^S := ⊗'\_{q ∈ Spl\_{𝒦/ℚ} ∖ (S ∪ {ℓ})} ℤ\[G(ℚ\_q)//K\_q\], the restricted tensor product of the spherical Hecke rings. For q ∈ Spl\_{𝒦/ℚ} ∖ (S ∪ {ℓ}) and a place v of F above q, G(ℚ\_q) = ∏\_w GL\_n(F\_w) × ℚ\_q^× with w over the place of 𝒦 below v; T\_{i,v} ∈ ℤ\[G(ℚ\_q)//K\_q\] (0 ≤ i ≤ n) is the characteristic function of GL\_n(O\_{F\_v})·diag(ϖ\_v^{(i)}, 1^{(n−i)})·GL\_n(O\_{F\_v}) × ∏\_{w≠v} GL\_n(O\_{F\_w}) × ℤ\_q^×, with i entries ϖ\_v, and T\_{n,v} is invertible. The Hecke polynomial at v is P\_v(X) = Σ\_{i=0}^n (−1)^i q\_v^{i(i−1)/2} T\_{i,v} X^{n−i} ∈ 𝕋^S\[X\], q\_v = |O\_F/𝔭\_v|. 𝕋^S acts on H^i(S\_{K,Ē}, Λ) for every coefficient ring Λ through the Hecke correspondences, and on the cohomology of Igusa varieties through the action of G(𝔸\_f^p). A maximal ideal 𝔪 ⊂ 𝕋^S has finite residue field 𝕋^S/𝔪 of characteristic ℓ when it is in the support of H^\*(S\_K, 𝔽\_ℓ).

*Hypotheses.*
- S as in the datum; ℓ any prime; v above q ∈ Spl\_{𝒦/ℚ} ∖ (S ∪ {ℓ}).

*Construction.*
- The spherical Hecke ring at q is the double-coset ring of SmoothRepresentationsOfLocalGroups SR.1 (node `hecke-ring-comparison`) (Mathlib's HeckeRing with Tau Ceti's ring structure HeckeCosetModule.instRingHeckeRing).
- At q split in 𝒦 the group G(ℚ\_q) is a product of general linear groups and a similitude factor; T\_{i,v} is the GL\_n(F\_v) generator of SmoothRepresentationsOfLocalGroups SR.4 (node `gln-generators`) placed in the v-factor; T\_{n,v} is the class of the central element ϖ\_v and is invertible.
- CS17 prints ℤ\_p^× and ℚ\_p^× in the definition of T\_{i,v}; the similitude factor at q is ℤ\_q^× ⊂ ℚ\_q^× (PAPER-CARAIANI-SCHOLZE-17/E12).
- Galois-type maximal ideals and their residual representations follow AutomorphicGaloisRepresentationsPartII AG2.7 (node `hecke-maximal-ideal-of-galois-type`) with this polynomial and geometric Frobenius.

*Sources.* \[CS17\], §6.3, p. 757 (definition of 𝕋^S) and Theorem 6.3.1(1), p. 757: Defines 𝕋^S as the tensor product over q ∈ Spl\_{𝒦/ℚ} ∖ (S ∪ {ℓ}) of the spherical Hecke rings, the operators T\_{i,v} as characteristic functions of the displayed double cosets inside G(ℚ\_q) = ∏\_w GL\_n(F\_w) × ℚ\_q^×, and the polynomial whose image modulo 𝔪 is the characteristic polynomial of ρ\_𝔪(Frob\_v). \[CS17\], §5.5, paragraph before Corollary 5.5.5, p. 745: The same operators for the base-change group 𝒢, with the similitude factor; the printed ℤ\_p^× is a misprint for ℤ\_q^×.

*Uses.* CS17 Theorem 6.3.1(1): the characteristic polynomial of ρ\_𝔪(Frob\_v) is P\_v modulo 𝔪; CS17 Corollary 6.1.4: the Hecke algebra away from p acts on Rπ\_HT\*𝔽\_ℓ and is localized there; Layer IG.8, dual Hecke ideal: the involution ι is computed on the T\_{i,v}; AutomorphicGaloisRepresentationsPartII AG2.7: Galois-type maximal ideals.

The API:
- `compactUnitaryHecke` (constructor): 𝕋^S as the restricted tensor product of the spherical Hecke rings over q ∈ Spl\_{𝒦/ℚ} ∖ (S ∪ {ℓ}).
- `compactUnitaryHecke.T` (data): T\_{i,v} for 0 ≤ i ≤ n and v above such q; T\_{0,v} = 1.
- `compactUnitaryHecke.T_top_isUnit` (simp): T\_{n,v} is a unit, with inverse the class of ϖ\_v^{−1}.
- `compactUnitaryHecke.heckePoly` (data): P\_v(X) = Σ\_i (−1)^i q\_v^{i(i−1)/2} T\_{i,v} X^{n−i}.
- `compactUnitaryHecke.heckePoly_monic` (simp): P\_v is monic of degree n with constant term (−1)^n q\_v^{n(n−1)/2} T\_{n,v}.
- `compactUnitaryHecke.commutative` (instance): 𝕋^S is commutative (spherical Hecke algebras of unramified groups).
- `compactUnitaryHecke.restrict` (functoriality): For S ⊂ S′ the inclusion 𝕋^{S′} → 𝕋^S; localization at a maximal ideal 𝔪 ⊂ 𝕋^S restricts to localization at 𝔪 ∩ 𝕋^{S′} (Layer IG.11).
- `compactUnitaryHecke.satake` (compatibility): Under the Satake isomorphism of SR.4 the image of P\_v is Π\_j (X − q\_v^{(n−1)/2} x\_j) in the Satake variables of GL\_n(F\_v), so P\_v matches the GL\_n generators of SR.4/gln-generators.

*Needs:* SmoothRepresentationsOfLocalGroups SR.1 (node `hecke-ring-comparison`); SmoothRepresentationsOfLocalGroups SR.4 (node `gln-generators`); SmoothRepresentationsOfLocalGroups SR.4 (node `satake-isomorphism`); Mathlib `HeckeRing`; Tau Ceti `HeckeCosetModule.instRingHeckeRing`; AutomorphicGaloisRepresentationsPartII AG2.7 (node `hecke-maximal-ideal-of-galois-type`); PELModuli M1 (node `hecke-action`); IG.8.1.

**Checks.**

- `compactUnitaryHecke.heckePoly_n1` (computation): For n = 1, P\_v(X) = X − T\_{1,v}.
- `compactUnitaryHecke.heckePoly_n2` (computation): For n = 2, P\_v(X) = X² − T\_{1,v}X + q\_v T\_{2,v}.
- `compactUnitaryHecke.T_zero` (degenerate): T\_{0,v} is the unit of 𝕋^S.
- `compactUnitaryHecke.similitude_factor` (non-example): The operator defined with the factor ℤ\_p^× at a prime q ≠ p is not an element of ℤ\[G(ℚ\_q)//K\_q\]; the definition uses ℤ\_q^×.
- `compactUnitaryHecke.satake_compat` (compatibility): For n = 2 the Satake image of P\_v is (X − q\_v^{1/2}x\_1)(X − q\_v^{1/2}x\_2), agreeing with SR.4/gln-generators: S(T\_1) = q\_v^{1/2}(x\_1 + x\_2), S(T\_2) = x\_1x\_2.
- For n = 1, T\_{1,v} is the class of ϖ\_v ∈ F\_v^× and P\_v(X) = X − T\_{1,v}.

### IG.8.5 The dual ideal 𝔪^∨ and its Galois representation

Prove (theorem, node `IG.8/dual-hecke-ideal`): Let ι be the involution of 𝕋^S induced by \[K\_qgK\_q\] ↦ \[K\_qg^{−1}K\_q\] (an anti-involution of a commutative ring, hence an involution) and 𝔪^∨ := ι(𝔪) for a maximal ideal 𝔪. Then (1) ι(T\_{i,v}) = T\_{n,v}^{−1}T\_{n−i,v}; (2) if λ\_1, …, λ\_n are the roots of P\_v modulo 𝔪 (in 𝔽̄\_ℓ), the roots of P\_v modulo 𝔪^∨ are q\_v^{n−1}λ\_1^{−1}, …, q\_v^{n−1}λ\_n^{−1}; (3) if 𝔪 is of Galois type with semisimple ρ\_𝔪 : Gal(F̄/F) → GL\_n(𝔽̄\_ℓ) unramified outside the places above S ∪ {ℓ}, then 𝔪^∨ is of Galois type with ρ\_{𝔪^∨} ≅ ρ\_𝔪^∨ ⊗ ε̄^{1−n} (ε̄ the mod ℓ cyclotomic character, geometric Frobenius conventions of AutomorphicGaloisRepresentationsPartII AG2.0); (4) for a place 𝔭\_i of F not above S ∪ {ℓ}, ρ\_𝔪 is unramified and decomposed generic at 𝔭\_i if and only if ρ\_{𝔪^∨} is; hence (p, 𝔭) satisfies the auxiliary-prime condition for 𝔪 if and only if it does for 𝔪^∨.

*Hypotheses.*
- 𝔪 ⊂ 𝕋^S maximal with finite residue field; (3)–(4) for Galois-type 𝔪.

*Proof sketch.*
- (1): the double coset of diag(ϖ\_v^{(i)}, 1^{(n−i)})^{−1} equals ϖ\_v^{−1}·GL\_n(O)diag(1^{(i)}, ϖ\_v^{(n−i)})GL\_n(O), and multiplication by the central double coset T\_{n,v}^{−1} is a single double coset; the other factors are unchanged.
- (2): T\_{i,v} ≡ q\_v^{−i(i−1)/2}e\_i(λ) mod 𝔪; substituting (1) gives coefficients (−1)^i q\_v^{i(n−1)} e\_i(λ^{−1}) for 𝔪^∨, i.e. the polynomial with roots q\_v^{n−1}λ\_j^{−1}.
- (3) is AutomorphicGaloisRepresentationsPartII AG2.7 (node `dual-and-character-twist-hecke-comparison`) at rank n, which uses the same Hecke polynomial convention; uniqueness of the semisimple realization is Brauer–Nesbitt with Chebotarev.
- (4): the condition λ\_a/λ\_b ∉ {1, q\_v} for all ordered pairs a ≠ b is invariant under λ ↦ q\_v^{n−1}λ^{−1}, which sends the ratio λ\_a/λ\_b to λ\_b/λ\_a; unramifiedness at 𝔭\_i is unchanged by duals and cyclotomic twists at 𝔭\_i ∤ ℓ.
- The formalism of ι is the parent's parent IG.5 (node `IG.5/dual-hecke-ideal`) (stated there for the rank-2n quasi-split datum) and Tau Ceti's HeckeAntiInvolution.ofAmbient.

*Sources.* \[CS17\], §6.3, proof of Theorem 6.3.1, p. 759: Uses Poincaré duality 'with the dual set of Hecke eigenvalues' and the result for the 'dual' ideal, which satisfies the same hypothesis; the computation of ι(T\_{i,v}) is not printed (made explicit in PAPER-CARAIANI-SCHOLZE-17/E98 and item 147).

*Needs:* parent IG.5 (node `IG.5/dual-hecke-ideal`); Tau Ceti `HeckeAntiInvolution.ofAmbient`; Tau Ceti `HeckeAntiInvolution.onHeckeCoset`; AutomorphicGaloisRepresentationsPartII AG2.7 (node `dual-and-character-twist-hecke-comparison`); AutomorphicGaloisRepresentationsPartII AG2.7 (node `strong-local-decomposed-genericity`); ArithmeticGaloisRepresentations R01.1 (node `brauer-nesbitt`); IG.8.4.

**Checks.**

- (𝔪^∨)^∨ = 𝔪.
- For n = 2, q\_v = 7, ℓ = 11 and roots {1, 2} for 𝔪, the roots for 𝔪^∨ are {7, 7/2} = {7, 9} in 𝔽\_11.
- If ρ\_𝔪 is decomposed generic at 𝔭\_i then so is ρ\_{𝔪^∨}.

### IG.8.6 Hecke-equivariant Poincaré duality on S_K and on Mantovan's Igusa varieties

Prove (theorem, node `IG.8/hecke-poincare-duality`): (1) Let d = dim S\_K and Λ = ℤ/ℓ^r. The Poincaré pairing H^i(S\_{K,Ē}, Λ) × H^{2d−i}(S\_{K,Ē}, Λ(d)) → Λ of the smooth proper E-variety S\_K is perfect, and the transpose of the action of t ∈ 𝕋^S is the action of ι(t). Hence for every maximal ideal 𝔪 ⊂ 𝕋^S, RΓ(S\_{K,Ē}, Λ)\_𝔪 ≅ RHom\_Λ(RΓ(S\_{K,Ē}, Λ)\_{𝔪^∨}, Λ)\[−2d\](−d); in particular H^i(S\_K, 𝔽\_ℓ)\_𝔪 = 0 for all i > d as soon as H^i(S\_K, 𝔽\_ℓ)\_{𝔪^∨} = 0 for all i < d. The same holds for 𝔽\_ℓ-local systems L on S\_K attached to finite 𝔽\_ℓ\[K/K′\]-modules, with L^∨ on the dual side. (2) Let p ∉ S ∪ {ℓ} be split in 𝒦, b ∈ B(G, μ^{−1}) and I^b\_{Mant,m} Mantovan's Igusa variety of level m (smooth of dimension d\_b = ⟨2ρ, ν\_b⟩ over 𝔽̄\_p). For the Hecke operators at primes q ∉ S ∪ {p, ℓ}, which act through G(𝔸\_f^p), RΓ\_c(I^b\_{Mant,m}, Λ)\_{𝔪^∨} ≅ RHom\_Λ(RΓ(I^b\_{Mant,m}, Λ)\_𝔪, Λ)\[−2d\_b\](−d\_b), compatibly with pullback along the finite étale transition maps on RΓ and trace on RΓ\_c.

*Hypotheses.*
- (1) K neat, S\_K smooth proper of dimension d (IG.8 integral model, or directly over E).
- (2) p ∉ S ∪ {ℓ} split in 𝒦; localization at maximal ideals of 𝕋^{S∪{p}}.

*Proof sketch.*
- Perfectness of the pairing for smooth separated varieties with torsion coefficients: EtaleDualityAndPerverseSheaves EDC.2:pairings (node `poincare-duality-torsion`) (H\_c = H for the proper S\_K).
- Hecke correspondences: a double coset \[KgK\] acts by the correspondence S\_{K∩gKg^{−1}} ⇉ S\_K (pullback then trace); its transpose under the cup-product pairing is the correspondence with the two maps exchanged, which is \[Kg^{−1}K\]; this is the étale form of ArithmeticLocallySymmetricSpaces ALS.5:finite-level-duality (node `hecke-adjoint-duality`).
- Localization: the pairing is 𝕋^S-equivariant for t on the left and ι(t) on the right, so the 𝔪-part pairs perfectly with the ι(𝔪)-part.
- (2) is the parent's parent IG.5 (node `IG.5/igusa-poincare-duality`), whose argument uses only that I^b\_{Mant,m} is smooth of dimension d\_b (parent IG.1 (node `IG.1/mantovan-igusa-variety`)) and the away-from-p Hecke action; it applies verbatim to the unramified PEL data of this roadmap.

*Sources.* \[CS17\], §6.3, proof of Theorem 6.3.1, p. 759: Applies Poincaré duality to the proper smooth S\_K (vanishing above the middle degree follows from the result for the dual ideal) and to the Igusa varieties I^b\_{Mant,m} (passing from H to H\_c). \[CS17\], §5, introduction, p. 729: Notes that by Poincaré duality it suffices to compute the alternating sum of compactly supported Igusa cohomology.

*Needs:* EtaleDualityAndPerverseSheaves EDC.2:pairings (node `poincare-duality-torsion`); EtaleDualityAndPerverseSheaves EDC.2:pairings (node `galois-frobenius-equivariance`); ArithmeticLocallySymmetricSpaces ALS.5:finite-level-duality (node `hecke-adjoint-duality`); parent IG.5 (node `IG.5/igusa-poincare-duality`); parent IG.1 (node `IG.1/mantovan-igusa-variety`); parent IG.1 (node `IG.1/igusa-cohomology`); IG.8.2; IG.8.5.

**Checks.**

- For d = 0 (n = 1) the statement is the perfect pairing on functions on a finite set, with T and ι(T) transposes.
- Taking Λ = 𝔽\_ℓ: H^d(S\_K, 𝔽\_ℓ)\_𝔪 ≠ 0 iff H^d(S\_K, 𝔽\_ℓ)\_{𝔪^∨} ≠ 0.

### IG.8.7 Caraiani–Scholze auxiliary primes for a residual representation

Define (definition, node `IG.8/auxiliary-prime-condition`): Let ρ̄ : Gal(F̄/F) → GL\_n(𝔽̄\_ℓ) be a continuous semisimple representation unramified outside the places above S ∪ {ℓ}. A pair (p, 𝔭), with p ∈ Spl\_{𝒦/ℚ} ∖ (S ∪ {ℓ}) and 𝔭 | p a prime of the reflex field E (equivalently a compatible ι\_p), is a CS-auxiliary pair for ρ̄ if for every prime 𝔭\_i of F above u (p = uu^c) the set S\_i contains at most one τ with p\_τq\_τ ≠ 0, and, if it contains one, ρ̄|\_{Gal(F̄\_{𝔭\_i}/F\_{𝔭\_i})} is decomposed generic: unramified with Frobenius eigenvalues λ\_1, …, λ\_n satisfying λ\_a/λ\_b ∉ {1, q\_{𝔭\_i}} for all a ≠ b.

*Hypotheses.*
- ρ̄ semisimple, unramified outside S ∪ {ℓ}; p ∈ Spl\_{𝒦/ℚ} ∖ (S ∪ {ℓ}).

*Construction.*
- Decomposed genericity at a place is AutomorphicGaloisRepresentationsPartII AG2.7 (node `strong-local-decomposed-genericity`) (Caraiani–Scholze's Definition 1.9 = 6.2.1 over an arbitrary finite extension of ℚ\_p); the sets S\_i are those of the split-prime decomposition.
- The condition depends on the semisimplification only and is unchanged by replacing arithmetic by geometric Frobenius.

*Sources.* \[CS17\], Theorem 6.3.1(2), p. 757: States the condition on p ∈ Spl\_{𝒦/ℚ} ∖ (S ∪ {ℓ}) and the prime 𝔭 of E: each S\_i has at most one τ with p\_τq\_τ ≠ 0, and ρ\_𝔪 is decomposed generic at 𝔭\_i whenever it has one. \[CS17\], Definition 6.2.1, p. 755; Definition 1.9, p. 652: Defines decomposed genericity of an unramified mod-ℓ representation of a p-adic Galois group by λ\_a/λ\_b ∉ {1, q}.

*Uses.* CS17 Theorem 6.3.1(2): hypothesis of middle-degree concentration; CS17 Remarks 6.3.2–6.3.3: the two ways to produce such a pair; Layer IG.8, dual Hecke ideal: invariance under 𝔪 ↦ 𝔪^∨.

The API:
- `IsCSAuxiliaryPair` (characterisation): The predicate on (ρ̄, p, 𝔭) stated above.
- `IsCSAuxiliaryPair.of_totally_split` (constructor): If p splits completely in F and ρ̄ is unramified and decomposed generic at all places above p, every 𝔭 | p gives an auxiliary pair.
- `IsCSAuxiliaryPair.dual_twist` (relation): (p, 𝔭) is auxiliary for ρ̄ iff it is for ρ̄^∨ ⊗ ε̄^{1−n}.
- `IsCSAuxiliaryPair.semisimplification` (relation): The predicate depends only on ρ̄^{ss}.
- `IsCSAuxiliaryPair.trivial_if_definite` (example): If p\_τq\_τ = 0 for every τ (definite G\_ℝ) every (p, 𝔭) with p ∈ Spl\_{𝒦/ℚ} ∖ (S ∪ {ℓ}) is auxiliary.

*Needs:* AutomorphicGaloisRepresentationsPartII AG2.7 (node `strong-local-decomposed-genericity`); IG.8.3.

**Checks.**

- `IsCSAuxiliaryPair.n1` (degenerate): For n = 1 decomposed genericity is automatic (no pairs a ≠ b), so the condition reduces to the cardinality condition on the S\_i.
- `IsCSAuxiliaryPair.repeated_eigenvalue` (non-example): ρ̄ = χ ⊕ χ at 𝔭\_i (n = 2) is not decomposed generic (ratio 1), although it satisfies the weaker ACC+ condition λ\_a ≠ qλ\_b.
- `IsCSAuxiliaryPair.ratio_q` (non-example): Eigenvalues {1, q\_{𝔭\_i}} fail the condition.
- `IsCSAuxiliaryPair.generic_pair` (computation): For q\_{𝔭\_i} = 7, ℓ = 11 and eigenvalues {1, 2} the condition holds at 𝔭\_i (2 ∉ {1, 7}, 1/2 = 6 ∉ {1, 7} in 𝔽\_11).
- `IsCSAuxiliaryPair.two_nontrivial` (non-example): If some S\_i contains two embeddings with p\_τq\_τ ≠ 0 the pair is not auxiliary, whatever ρ̄ is.
- If p splits completely in F and ρ̄ is unramified and decomposed generic at every place above p, (p, 𝔭) is CS-auxiliary for every 𝔭.

### IG.8.8 Existence of auxiliary primes (Remarks 6.3.2–6.3.3, corrected)

Prove (theorem, node `IG.8/auxiliary-prime-existence`): Let ρ̄ be as in the auxiliary-prime condition. (a) If some rational prime p₀ ≠ ℓ splits completely in F and ρ̄ is unramified and decomposed generic at every place above p₀, then there are infinitely many such primes, they can be chosen outside any finite set (in particular outside S ∪ {ℓ}), and for each such p every (p, 𝔭) is a CS-auxiliary pair. (b) Suppose the signature of G is definite ((0, n) or (n, 0)) at all but one infinite place of F⁺ and ρ̄ is unramified and decomposed generic at some finite place v₀ of F. Then there are infinitely many places v of F of degree one over a rational prime p ∉ S ∪ {ℓ}, split in 𝒦, at which ρ̄ is unramified and decomposed generic; for such v, taking u the place of 𝒦 below v and choosing ι\_p (hence 𝔭) so that ι\_p^{−1} ∘ τ₀ induces v for the embedding τ₀ with p\_{τ₀}q\_{τ₀} ≠ 0 lying over u, (p, 𝔭) is a CS-auxiliary pair.

*Hypotheses.*
- ρ̄ continuous semisimple, unramified outside a finite set.
- (b): definite signature at all infinite places of F⁺ but one.

*Proof sketch.*
- (a) Let L be the Galois closure over ℚ of the compositum of F, the field cut out by ρ̄ and ℚ(ζ\_ℓ). The Frobenius class of p₀ in Gal(L/ℚ) is trivial on F and determines the eigenvalue ratios at all places above p₀ and p₀ mod ℓ; Chebotarev (ArithmeticGaloisRepresentations R01.5 (node `haar-measure-chebotarev-clopen`)) gives a positive density of primes with the same class, each of which is again a witness; this is the argument of AutomorphicGaloisRepresentationsPartII AG2.7 (node `infinitely-many-decomposed-generic-primes`) with the strong condition λ\_a/λ\_b ∉ {1, q} in place of λ\_a ≠ qλ\_b.
- Complete splitting puts p in Spl\_{𝒦/ℚ} and makes every S\_i a singleton, so the cardinality condition holds.
- (b) Apply Chebotarev to Frob\_{v₀} in Gal(L/F): only places of degree one contribute to the Dirichlet density (CS17 footnote 33), so there are infinitely many degree-one places v with the same Frobenius class, hence decomposed generic; the rational prime p below v splits in 𝒦 because v has degree one over p.
- Corrected count (PAPER-CARAIANI-SCHOLZE-17/E95): when the non-definite place of F⁺ is indefinite there are exactly two embeddings τ₀, τ₀c with p\_τq\_τ ≠ 0, one over u and one over u^c; only τ₀ lies in ⋃\_i S\_i, and choosing ι\_p with ι\_p^{−1}∘τ₀ inducing v puts it in S\_i for 𝔭\_i = v. If that place is also definite there is none and the condition holds trivially.

*Sources.* \[CS17\], Remarks 6.3.2–6.3.3, p. 758, with footnote 33: Remark 6.3.2: a completely decomposed decomposed-generic prime gives many by Chebotarev, all S\_i are singletons. Remark 6.3.3: with definite signature at all but one infinite place, one decomposed-generic place suffices, choosing the prime of the reflex field suitably; footnote 33 notes that only degree-one places contribute to the density. \[CS17\], Theorem 1.1 and Remark 1.5, pp. 651–652: The main theorem assumes a completely decomposed prime with decomposed-generic ρ\_𝔪; Remark 1.5 announces the weaker hypothesis for definite-but-one signatures.

*Needs:* ArithmeticGaloisRepresentations R01.5 (node `haar-measure-chebotarev-clopen`); AutomorphicGaloisRepresentationsPartII AG2.7 (node `infinitely-many-decomposed-generic-primes`); IG.8.7; IG.8.3.

**Checks.**

- For p splitting completely in F, the S\_i are singletons.
- In the Harris–Taylor case one decomposed-generic place suffices.

## Layer IG.9: Generic principal series and the μ-ordinary obstruction for the quasi-split datum

For the datum quasi-split at finite places, the trace formula identifies the alternating Igusa cohomology with the spectral side of twisted trace formulas; the Newton reduction kills generic principal series at non-quasi-split factors; together with Lemma 5.5.8 this shows that a generic Galois representation sees only the μ-ordinary class.

*Layer dependencies:* IG.8, parent IG.1, EndoscopicTransferAndUnitaryTraceComparison ET.0, EndoscopicTransferAndUnitaryTraceComparison ET.4, EndoscopicTransferAndUnitaryTraceComparison ET.5, EndoscopicTransferAndUnitaryTraceComparison ET.6, EndoscopicTransferAndUnitaryTraceComparison ET.7b, AutomorphicGaloisRepresentationsPartII AG2.2, AutomorphicGaloisRepresentationsPartII AG2.5, AutomorphicGaloisRepresentationsPartII AG2.7, BunGAndNewtonStrata BG1, SmoothRepresentationsOfLocalGroups SR.2, AutomorphicLFunctionsAndLocalFactors AL.3.

### IG.9.1 The stable Igusa trace identity for the compact quasi-split datum (CS17 Theorem 5.3.2)

Prove (theorem, node `IG.9/igusa-trace-identity`): In the Case 2 setting, fix b ∈ B(G, μ^{−1}) and test functions (f\_n)^{S′} ∈ H^ur(𝒢\_n(𝔸^{S′})) and f\_{n,S′\_fin∖{p}} ∈ C\_c^∞(𝒢\_n(𝔸\_{S′\_fin∖{p}})) with BC-transfers φ^{S′}, φ\_{S′\_fin∖{p}} to G\_n = G over 𝔸\_f, and an acceptable φ\_p ∈ C\_c^∞(J\_b(ℚ\_p)); put φ = φ^{S′}φ\_{S′\_fin∖{p}}φ\_p. For each elliptic endoscopic group G\_n⃗ of G (n⃗ = (n) or (n₁, n₂) with n₁ ≥ n₂ > 0, n₁ + n₂ = n, the pairs excluded by Kottwitz's condition omitted) let φ^n⃗ be Shin's endoscopic test function and f^n⃗ = (f^n⃗)^{S′}(f^n⃗)\_{S′\_fin∖{p}}f^n⃗\_p f^n⃗\_∞ a BC-matching function on 𝒢\_n⃗ = Res\_{𝒦/ℚ}(G\_n⃗ ×\_ℚ 𝒦), with f^n⃗\_∞ the combination of twisted Lefschetz functions attached to the signature of G\_ℝ. Then tr(φ | ι\_ℓ\[H\_c(I^b\_Mant, ℚ̄\_ℓ)\]) = |ker¹(ℚ, G)| τ(G) Σ\_n⃗ ε\_n⃗ I^{𝒢\_n⃗θ}\_spec(f^n⃗θ), with ε\_n⃗ = 1/2 if n⃗ = (n/2, n/2) and ε\_n⃗ = 1 otherwise.

*Hypotheses.*
- Case 2 datum of Layer IG.8 with p ∉ S split in 𝒦 and K\_p hyperspecial; S′ := S ∪ {∞, p} ∪ Ram(ϖ) for a Hecke character ϖ : 𝔸\_𝒦^×/𝒦^× → ℂ^× extending the quadratic character of 𝒦/ℚ and ramified only at primes of Spl\_{F/F⁺}; ι\_ℓ : ℚ̄\_ℓ ≅ ℂ fixed.
- φ\_p acceptable in Shin's sense; \[F⁺:ℚ\] ≥ 2 (assumption (1) of §5.1).
- G\_ℝ an inner form of G\_n of arbitrary signature; trivial coefficient system.

*Proof sketch.*
- Shin's stable trace formula for Igusa varieties of PEL type (A) (CS17 Theorem 5.2.3 = \[Shi10, Thm 7.2\]): EndoscopicTransferAndUnitaryTraceComparison ET.5 (node `stable-trace-with-normalizations`), applied to the alternating Igusa cohomology of ET.5/rational-igusa-cohomology for this unramified PEL datum.
- G quasi-split at all finite places, so E\_ell(G) = E\_ell(G\_n) with the representatives of ET.0/unitary-elliptic-endoscopic-data (n₂ > 0 for proper data, PAPER-CARAIANI-SCHOLZE-17/E66); ι(G, G\_n⃗) = τ(G)τ(G\_n⃗)^{−1}|Out|^{−1} with |Out| = 2 exactly for n₁ = n₂ (CS17 Remark 5.2.6).
- Stable–twisted identity ST^{G\_n⃗}\_e(φ^n⃗) = τ(G\_n⃗) I^{𝒢\_n⃗θ}\_spec(f^n⃗θ) for BC-matching pairs: ET.4/stable-twisted-identity, valid for every rank and both parities and for G\_ℝ of arbitrary signature, using \[F⁺:ℚ\] ≥ 2 (ET.4/no-proper-cuspidal-subsets) and the archimedean matching of ET.4/archimedean-lefschetz-functions.
- Matching at the other places: ET.4/unramified-transfers away from S′, ET.4/base-change-transfer-of-functions at S′\_fin ⊂ Spl\_{F/F⁺}, and surjectivity of BC\* at the split prime p.
- Combine: |ker¹| Σ ι(G, G\_n⃗) ST^{G\_n⃗}\_e = |ker¹| τ(G) Σ ε\_n⃗ I\_spec, with θ defined by g^♯ = Φ ᵗ(g^c)^{−1} Φ^{−1} (PAPER-CARAIANI-SCHOLZE-17/E69).

*Sources.* \[CS17\], §5.2, Theorem 5.2.3, Corollary 5.2.5 and Remark 5.2.6, pp. 733–735: Recalls Shin's stable trace formula for the alternating compactly supported Igusa cohomology, its form for the unitary similitude group with the groups G\_n⃗, and the explicit constants ι(G, G\_n⃗). \[CS17\], §5.3, Proposition 5.3.1 and Theorem 5.3.2, pp. 737–738: Compares the stable elliptic terms with the geometric side of the twisted trace formula for 𝒢\_n⃗θ (using \[F⁺:ℚ\] ≥ 2) and obtains the identity with the spectral sides weighted by ε\_n⃗; the archimedean functions are for an inner form of arbitrary signature.

*Needs:* EndoscopicTransferAndUnitaryTraceComparison ET.5 (node `stable-trace-with-normalizations`); EndoscopicTransferAndUnitaryTraceComparison ET.5 (node `rational-igusa-cohomology`); EndoscopicTransferAndUnitaryTraceComparison ET.0 (node `unitary-elliptic-endoscopic-data`); EndoscopicTransferAndUnitaryTraceComparison ET.4 (node `stable-elliptic-distribution`); EndoscopicTransferAndUnitaryTraceComparison ET.4 (node `stable-twisted-identity`); EndoscopicTransferAndUnitaryTraceComparison ET.4 (node `twisted-geometric-side`); EndoscopicTransferAndUnitaryTraceComparison ET.4 (node `no-proper-cuspidal-subsets`); EndoscopicTransferAndUnitaryTraceComparison ET.4 (node `archimedean-lefschetz-functions`); EndoscopicTransferAndUnitaryTraceComparison ET.4 (node `base-change-groups`); EndoscopicTransferAndUnitaryTraceComparison ET.4 (node `unramified-transfers`); EndoscopicTransferAndUnitaryTraceComparison ET.4 (node `base-change-transfer-of-functions`); EndoscopicTransferAndUnitaryTraceComparison ET.5 (node `acceptable-functions-with-geometry`); parent IG.1 (node `IG.1/alternating-igusa-cohomology`); IG.8.1; IG.8.3.

**Checks.**

- For n⃗ = (n) only the stable term remains when G has no proper endoscopy contributions; with φ\_p = 0 both sides vanish.
- For n = 2 the proper datum (1, 1) has ε = 1/2, not 1.

### IG.9.2 Newton reduction kills generic principal series at a non-quasi-split factor (CS17 Lemma 5.4.3, corrected)

Prove (lemma, node `IG.9/red-kills-generic-principal-series`): In the split-prime decomposition at p, let π^n⃗\_p = ⊗\_{i=1}^m π^n⃗\_{𝔭\_i} ⊗ π^n⃗\_0 ∈ Irr(G\_n⃗(ℚ\_p)), G\_n⃗(ℚ\_p) = ∏\_i GL\_n⃗(F\_{𝔭\_i}) × ℚ\_p^×. Suppose some i satisfies: the transfer of π^n⃗\_{𝔭\_i} to GL\_n(F\_{𝔭\_i}) along η̃\_n⃗ (normalized induction twisted by the ϖ-character) is a generic principal series, and J\_{b\_i} is a non-quasi-split inner form of M\_{b\_i}. Then Red^b\_n⃗(π^n⃗\_p) = 0, where Red^b\_n⃗ is the normalized Newton reduction including the modulus twist δ̄^{1/2}\_{P(ν\_b)}.

*Hypotheses.*
- p split in 𝒦 and unramified in F; b = ((b\_i), b\_0) ∈ B(G, μ^{−1}).
- Red^b\_n⃗ the twisted reduction of ET.7b (PAPER-CARAIANI-SCHOLZE-17/E74); the twist does not affect vanishing.

*Proof sketch.*
- Red^b\_n⃗ is the composite of normalized Jacquet functors to the effective endoscopic Levi subgroups, transfer along η̃\_n⃗ to M\_b (a normalized parabolic induction between products of general linear groups), and the Langlands–Jacquet map Groth(M\_b(ℚ\_p)) → Groth(J\_b(ℚ\_p)) (ET.7b/newton-reduction), all factoring over the 𝔭\_i (split-prime decomposition).
- If the transfer of π^n⃗\_{𝔭\_i} is a generic principal series, its Langlands parameter is a sum of characters with no ratio equal to |·|^{±1}; the L-morphism LM\_{G\_n⃗} → LM\_b is the restriction of η̃\_{n₁,n₂}, so every constituent of the image of π^n⃗\_{𝔭\_i} in Groth(M\_{b\_i}(F\_{𝔭\_i})) is a generic irreducible principal series (Jacquet modules of principal series: SmoothRepresentationsOfLocalGroups SR.2 (node `principal-series-jacquet`)).
- The Langlands–Jacquet map of a non-quasi-split inner form kills every irreducible generic principal series: EndoscopicTransferAndUnitaryTraceComparison ET.6 (node `principal-series-nontransfer`) (Badulescu); the J\_{b\_i}-factor of Red^b\_n⃗(π^n⃗\_p) is therefore zero, and so is the tensor product.
- CS17 prints the conclusion as Red^b\_n⃗(π\_p) = 0; the representation is π^n⃗\_p (PAPER-CARAIANI-SCHOLZE-17/E75).

*Sources.* \[CS17\], §5.4, Lemma 5.4.3 and proof, p. 741: If some factor transfers to a generic principal series and J\_{b\_i} is a non-quasi-split inner form of M\_{b\_i}, the Newton reduction vanishes, because the image in Groth(M\_b) has only generic principal series at that factor and these lie in the kernel of the Langlands–Jacquet map (Badulescu, Theorem 3.1 and Proposition 3.3). \[CS17\], §5.4, definition of Red^b\_n⃗, p. 739: Defines the reduction as Jacquet functors, transfer along η̃\_n⃗, and the Langlands–Jacquet map.

*Needs:* EndoscopicTransferAndUnitaryTraceComparison ET.7b (node `newton-reduction`); EndoscopicTransferAndUnitaryTraceComparison ET.7b (node `red-trace-duality`); EndoscopicTransferAndUnitaryTraceComparison ET.6 (node `principal-series-nontransfer`); EndoscopicTransferAndUnitaryTraceComparison ET.5 (node `decent-levi-and-jb`); SmoothRepresentationsOfLocalGroups SR.2 (node `principal-series-jacquet`); EndoscopicTransferAndUnitaryTraceComparison ET.4 (node `unramified-transfers`); IG.8.3.

**Checks.**

- For n = 2, b\_i basic with J\_{b\_i} = D^× (quaternion) and π^n⃗\_{𝔭\_i} an unramified generic principal series, Red = 0; the trivial representation of GL\_2 is not generic and its Langlands–Jacquet image is −1\_{D^×} ≠ 0.

### IG.9.3 Spectral expansion of Igusa cohomology for the compact quasi-split datum (CS17 Lemma 5.5.1 and Corollary 5.5.2, corrected)

Prove (theorem, node `IG.9/igusa-spectral-expansion`): In the Case 2 setting fix b, (f\_n)^{S′} ∈ H^ur(𝒢\_n(𝔸^{S′})), f\_{n,S′\_fin∖{p}} and their BC-transfers, and let φ\_p ∈ C\_c^∞(J\_b(ℚ\_p)) be arbitrary (not necessarily acceptable). (1) tr(φ | ι\_ℓ\[H\_c(I^b\_Mant, ℚ̄\_ℓ)\]) is a finite linear combination of products tr((Π^n⃗)^{S′}((f^n⃗)^{S′}) ∘ A^{S′}) · tr((Π^n⃗)\_{S′\_fin∖{p}}(f^n⃗\_{S′\_fin∖{p}}) ∘ A) · tr(Red^b\_n⃗(π^n⃗\_p)(φ\_p)), where Π^n⃗ runs over θ-stable irreducible isobaric automorphic representations of 𝒢\_n⃗ of the form n-Ind(Π\_M)\_ξ with Π\_M in the discrete spectrum of a Levi M, Π^n⃗\_∞ is cohomological for one of the coefficient systems Ξ(φ\_n⃗) entering f^n⃗\_∞ (trivial exactly when n⃗ = (n)), and π^n⃗\_p ∈ Irr(G\_n⃗(ℚ\_p)) is the unique representation base-changing to Π^n⃗\_p. (2) Fix φ\_{S′\_fin∖{p}} and φ\_p and put Π^{S′} := ζ̃\_{n⃗,\*}(Π^n⃗)^{S′}. If the sum of the terms of (1) over all n⃗′ and Π^{n⃗′} with ζ̃\_{n⃗′,\*}(Π^{n⃗′})^{S′} ≅ Π^{S′} is a nonzero function of (f\_n)^{S′}, then Π^{S′} occurs in BC^{S′}(\[H\_c(I^b\_Mant, ℚ̄\_ℓ)\]^{S′-ur}); conversely every irreducible 𝒢\_n(𝔸^{S′})-subrepresentation of BC^{S′}(\[H\_c(I^b\_Mant, ℚ̄\_ℓ)\]^{S′-ur}) is of the form ζ̃\_{n⃗,\*}(Π^n⃗)^{S′}.

*Hypotheses.*
- Case 2 datum of Layer IG.8 with p ∉ S split in 𝒦 and K\_p hyperspecial; S′ := S ∪ {∞, p} ∪ Ram(ϖ) for a Hecke character ϖ : 𝔸\_𝒦^×/𝒦^× → ℂ^× extending the quadratic character of 𝒦/ℚ and ramified only at primes of Spl\_{F/F⁺}; ι\_ℓ : ℚ̄\_ℓ ≅ ℂ fixed.
- Finite-level and infinity-type data fixed; finiteness is for fixed test functions, not uniform in the level.

*Proof sketch.*
- For acceptable φ\_p combine the stable Igusa trace identity with the spectral side of ET.4/twisted-spectral-side (Weyl-group denominator corrected, PAPER-CARAIANI-SCHOLZE-17/E71): a finite sum of tr(n-Ind(Π\_M)\_ξ(f^n⃗) ∘ A′).
- Each n-Ind(Π\_M)\_ξ is irreducible and isobaric (ET.4/unitary-induction-irreducibility; Mœglin–Waldspurger classification ET.7a/residual-spectrum-classification), determined by its component outside S′ (AutomorphicLFunctionsAndLocalFactors AL.3 (node `isobaric-strong-multiplicity-one`)).
- Cohomological type at ∞: Π^n⃗\_∞ is cohomological for Ξ(φ\_n⃗), not for the trivial representation, when n⃗ is proper (PAPER-CARAIANI-SCHOLZE-17/E77; ET.4/archimedean-lefschetz-functions).
- At p: base change at the split prime p is injective, so tr(Π^n⃗\_p(f^n⃗\_p) ∘ A′\_p) = ± tr π^n⃗\_p(φ^n⃗\_p), and Lemma 5.4.2 (ET.7b/red-trace-duality) rewrites it as tr Red^b\_n⃗(π^n⃗\_p)(φ\_p).
- Extension to all φ\_p: the Frobenius-twist argument of \[Shi09, Lemma 6.4\] (ET.5/central-shift-character-separation; the printed reference is corrected in PAPER-CARAIANI-SCHOLZE-17/E78 and /E88).
- (2): rewrite the (f^n⃗)^{S′} traces through ζ̃\* (ET.4/unramified-transfers) and BC\*, and separate unramified Hecke characters by linear independence, as in ET.7b/hecke-character-separation; only the total coefficient of an eigensystem is detected (PAPER-CARAIANI-SCHOLZE-17/E79), so the hypothesis of (2) is on that total.

*Sources.* \[CS17\], §5.5, Lemma 5.5.1 and proof, pp. 741–743: Writes the trace as a finite combination of products of traces of θ-stable isobaric Π^n⃗ away from S, at S\_fin ∖ {p}, and of Red^b\_n⃗(π^n⃗\_p) at p; first for acceptable φ\_p, then for all φ\_p by the Frobenius-twist argument. \[CS17\], §5.5, Corollary 5.5.2 and proof, p. 743; Remark 5.5.3: Relates contributing Π^n⃗ to subrepresentations of BC^S of the S-unramified Igusa class by linear independence of unramified Hecke characters; the remark notes that one Π^S may come from several n⃗.

*Needs:* IG.9.1; EndoscopicTransferAndUnitaryTraceComparison ET.4 (node `twisted-spectral-side`); EndoscopicTransferAndUnitaryTraceComparison ET.4 (node `unitary-induction-irreducibility`); EndoscopicTransferAndUnitaryTraceComparison ET.7a (node `residual-spectrum-classification`); AutomorphicLFunctionsAndLocalFactors AL.3 (node `isobaric-strong-multiplicity-one`); EndoscopicTransferAndUnitaryTraceComparison ET.4 (node `archimedean-lefschetz-functions`); EndoscopicTransferAndUnitaryTraceComparison ET.7b (node `red-trace-duality`); EndoscopicTransferAndUnitaryTraceComparison ET.7b (node `newton-reduction`); EndoscopicTransferAndUnitaryTraceComparison ET.5 (node `central-shift-character-separation`); EndoscopicTransferAndUnitaryTraceComparison ET.4 (node `unramified-transfers`); EndoscopicTransferAndUnitaryTraceComparison ET.7b (node `hecke-character-separation`); parent IG.1 (node `IG.1/alternating-igusa-cohomology`).

**Checks.**

- With φ\_p = 0 every term vanishes.
- Two terms with the same unramified eigensystem and coefficients 1 and −1 cancel; (2) then asserts nothing for that eigensystem.

### IG.9.4 The r-part of the base-changed Igusa class

Construct (construction, node `IG.9/galois-summand`): In the Case 2 setting, let r : Gal(F̄/F) → GL\_n(ℚ̄\_ℓ) be a continuous semisimple representation unramified outside the places above S′ ∪ {ℓ}. Write BC^{S′}(\[H\_c(I^b\_Mant, ℚ̄\_ℓ)\]^{S′-ur}) as a sum Σ\_j n\_j \[Π\_j^{S′} ⊗ σ\_j\] with Π\_j^{S′} irreducible unramified representations of 𝒢\_n(𝔸^{S′}) and σ\_j irreducible representations of G(𝔸\_{S′\_fin∖{p}}) × J\_b(ℚ\_p). The r-part BC^{S′}(\[H\_c(I^b\_Mant, ℚ̄\_ℓ)\]^{S′-ur})\_r is the sub-sum over the j with r\_{Π\_j^{S′},ℓ} ≅ r, where r\_{Π^{S′},ℓ} is the Galois representation attached to Π^{S′} (CS17 Corollary 5.5.5, exported by AutomorphicGaloisRepresentationsPartII AG2.7/unitary-discrete-parameter-export).

*Hypotheses.*
- Case 2 datum of Layer IG.8 with p ∉ S split in 𝒦 and K\_p hyperspecial; S′ := S ∪ {∞, p} ∪ Ram(ϖ) for a Hecke character ϖ : 𝔸\_𝒦^×/𝒦^× → ℂ^× extending the quadratic character of 𝒦/ℚ and ramified only at primes of Spl\_{F/F⁺}; ι\_ℓ : ℚ̄\_ℓ ≅ ℂ fixed.
- r semisimple; one base change BC^{S′} is used throughout (PAPER-CARAIANI-SCHOLZE-17/E85).

*Construction.*
- Every Π\_j^{S′} that occurs is ζ̃\_{n⃗,\*}(Π^n⃗)^{S′} by the converse part of the spectral expansion, so r\_{Π\_j^{S′},ℓ} is defined: AutomorphicGaloisRepresentationsPartII AG2.2 (node `cs-discrete-polarization-normalization`) and AG2.7/unitary-discrete-parameter-export give r\_{Π^{S′},ℓ} = ⊕\_i r\_i ⊗ ε\_i with the Hecke polynomials at the places above q ∈ Spl\_{𝒦/ℚ} ∖ (S′ ∪ {ℓ}).
- r\_{Π^{S′},ℓ} depends only on Π^{S′} (Chebotarev and Brauer–Nesbitt), so the sub-sum is well defined, and it is a summand of the Grothendieck-group element.

*Sources.* \[CS17\], §5.5, paragraph after Remark 5.5.6, p. 746: Fixes r unramified outside S ∪ {ℓ} and restricts attention to the summand of the base-changed S-unramified Igusa class coming from Π^S with r\_{Π^S,ℓ} ≅ r (the printed BC^p is read as BC^S, PAPER-CARAIANI-SCHOLZE-17/E85).

*Uses.* CS17 Theorem 5.5.7: the vanishing statement is about this summand; CS17 Theorem 6.3.1, proof: a lift r of ρ\_𝔪 with nonzero r-part is produced and Theorem 5.5.7 is applied to it; Layer IG.11 of this roadmap: the minimal Newton stratum argument.

The API:
- `igusaGaloisPart` (constructor): BC^{S′}(\[H\_c(I^b\_Mant, ℚ̄\_ℓ)\]^{S′-ur})\_r as an element of Groth(𝒢\_n(𝔸^{S′}) × G(𝔸\_{S′\_fin∖{p}}) × J\_b(ℚ\_p)).
- `igusaGaloisPart_add` (relation): The class is the (locally finite) sum of its r-parts over isomorphism classes of r.
- `igusaGaloisPart_eq_zero_of_not_occurs` (characterisation): The r-part is zero iff no constituent Π^{S′} has r\_{Π^{S′},ℓ} ≅ r.
- `igusaGaloisPart_iso` (extensionality): The r-part depends only on the isomorphism class of r.
- `igusaGaloisPart_frobenius` (compatibility): For a constituent of the r-part, the Satake parameters of Π^{S′} at v | q ∈ Spl\_{𝒦/ℚ} ∖ (S′ ∪ {ℓ}) are the roots of the characteristic polynomial of r(Frob\_v) (via ι\_ℓ).

*Needs:* IG.9.3; AutomorphicGaloisRepresentationsPartII AG2.2 (node `cs-discrete-polarization-normalization`); AutomorphicGaloisRepresentationsPartII AG2.7 (node `unitary-discrete-parameter-export`); ArithmeticGaloisRepresentations R01.1 (node `brauer-nesbitt`); parent IG.1 (node `IG.1/alternating-igusa-cohomology`).

**Checks.**

- `igusaGaloisPart_zero_class` (degenerate): For the zero class every r-part is zero.
- `igusaGaloisPart_sum` (characterisation): Σ\_r igusaGaloisPart r = BC^{S′}(\[H\_c\]^{S′-ur}) in the Grothendieck group, the sum being locally finite.
- `igusaGaloisPart_not_bcp` (non-example): Replacing BC^{S′} by a base change at the single place p (the printed BC^p) does not define a sub-sum indexed by Galois representations, since r\_{Π,ℓ} depends on the component outside S′.
- `igusaGaloisPart_n1` (computation): For n = 1 every Π^{S′} is a character, each r\_{Π^{S′},ℓ} is a character of Gal(F̄/F), and the r-parts are the isotypic parts for pairwise distinct characters: two constituents with different unramified characters lie in different r-parts.
- The sum over all r of the r-parts is the whole class.
- If no constituent has r\_{Π^{S′},ℓ} ≅ r the r-part is 0.

### IG.9.5 A non-μ-ordinary class has a non-quasi-split factor at a nontrivial 𝔭_i

Prove (lemma, node `IG.9/nonordinary-nonquasisplit-factor`): In the split-prime decomposition at p, assume each S\_i contains at most one τ with p\_τq\_τ ≠ 0. If b = ((b\_i), b\_0) ∈ B(G, μ^{−1}) is not μ-ordinary, then there is an index i such that S\_i contains a τ with p\_τq\_τ ≠ 0 and J\_{b\_i} is not quasi-split. Conversely the μ-ordinary class has every J\_{b\_i} quasi-split, J\_{b\_i} ≅ Res\_{F\_{𝔭\_i}/ℚ\_p}(GL\_{p\_τ} × GL\_{q\_τ}) at the nontrivial indices.

*Hypotheses.*
- p ∉ S split in 𝒦; each S\_i contains at most one τ with p\_τq\_τ ≠ 0.

*Proof sketch.*
- B(G, μ^{−1}) = ∏\_i B(G\_i, μ\_i^{−1}) and the maximal element is the product of the maximal elements (BunGAndNewtonStrata BG1 (node `product-and-unramified-norm`), BG1/ordinary-class).
- If S\_i contains no τ with p\_τq\_τ ≠ 0, μ\_i is central and B(G\_i, μ\_i^{−1}) is a point, the μ\_i-ordinary one.
- If S\_i contains exactly one such τ, the corrected identification B(G\_i, μ\_i^{−1}) ≅ B(GL\_n/F\_{𝔭\_i}, μ\_{i,τ}^{−1}) of the split-prime decomposition (PAPER-CARAIANI-SCHOLZE-17/E87) preserves J\_b up to Res\_{F\_{𝔭\_i}/ℚ\_p} and the μ-ordinary class; by Lemma 5.5.8 (BunGAndNewtonStrata BG1 (node `gl-minuscule-quasisplit-centralizer`)) only the μ-ordinary class has quasi-split J\_b, and restriction of scalars preserves (non-)quasi-splitness.
- If b is not μ-ordinary some factor b\_i is not μ\_i-ordinary; by the previous two steps that index has a nontrivial τ and a non-quasi-split J\_{b\_i}.

*Sources.* \[CS17\], Proof of Theorem 5.5.7, pp. 747–748, and Lemma 5.5.8, p. 748: Shows that a non-μ-ordinary b has some i with a nontrivial τ in S\_i and J\_{b\_i} not quasi-split, by decomposing B(G, μ^{−1}) as a product, treating central μ\_i and reducing the single-τ case to Lemma 5.5.8 for GL\_n over F\_{𝔭\_i}.

*Needs:* BunGAndNewtonStrata BG1 (node `product-and-unramified-norm`); BunGAndNewtonStrata BG1 (node `ordinary-class`); BunGAndNewtonStrata BG1 (node `gl-minuscule-quasisplit-centralizer`); BunGAndNewtonStrata BG0 (node `sigma-centralizer-J-b`); IG.8.3.

**Checks.**

- For n = 2 and (p\_τ, q\_τ) = (1, 1): B(GL\_2/F\_{𝔭\_i}, μ^{−1}) has two classes, the ordinary one (J = GL\_1 × GL\_1) and the basic one of slope −1/2 (J = D^×, non-quasi-split).

### IG.9.6 Genericity forces the μ-ordinary Newton stratum (CS17 Theorem 5.5.7)

Prove (theorem, node `IG.9/genericity-forces-mu-ordinary`): In the Case 2 setting fix ι\_p compatible with the chosen 𝔭 | p of E and let r : Gal(F̄/F) → GL\_n(ℚ̄\_ℓ) be continuous semisimple, unramified outside the places above S′ ∪ {ℓ}. Assume (i) each S\_i = {τ | ι\_p^{−1}∘τ induces 𝔭\_i} contains at most one τ with p\_τq\_τ ≠ 0, and (ii) for each i such that S\_i contains such a τ, r|\_{Gal(F̄\_{𝔭\_i}/F\_{𝔭\_i})} ≅ χ\_{i,1} ⊕ ⋯ ⊕ χ\_{i,n} with χ\_{i,a}χ\_{i,b}^{−1} not the cyclotomic character for all a ≠ b. Then for every b ∈ B(G, μ^{−1}) that is not μ-ordinary, BC^{S′}(\[H\_c(I^b\_Mant, ℚ̄\_ℓ)\]^{S′-ur})\_r = 0.

*Hypotheses.*
- Case 2 datum of Layer IG.8 with p ∉ S split in 𝒦 and K\_p hyperspecial; S′ := S ∪ {∞, p} ∪ Ram(ϖ) for a Hecke character ϖ : 𝔸\_𝒦^×/𝒦^× → ℂ^× extending the quadratic character of 𝒦/ℚ and ramified only at primes of Spl\_{F/F⁺}; ι\_ℓ : ℚ̄\_ℓ ≅ ℂ fixed.
- Hypotheses (i) and (ii) as stated; the sets S\_i use ι\_p^{−1}∘τ (PAPER-CARAIANI-SCHOLZE-17/E86).

*Proof sketch.*
- Suppose the r-part is nonzero for a non-μ-ordinary b. By the spectral expansion (2) there is a θ-stable isobaric Π^n⃗ whose total contribution is nonzero, with r\_{ζ̃\_\*(Π^n⃗)^{S′},ℓ} ≅ r, and π^n⃗\_p its base-change preimage.
- Local–global compatibility at 𝔭\_i (CS17 Remark 5.5.6, exported in AutomorphicGaloisRepresentationsPartII AG2.7 (node `unitary-discrete-parameter-export`) with AG2.5/caraiani-upgrade-away-from-p-and-temperedness): hypothesis (ii) makes the transfer of π^n⃗\_{𝔭\_i} a generic principal series of GL\_n(F\_{𝔭\_i}) at every nontrivial index i.
- By the lemma on non-μ-ordinary classes there is a nontrivial index i with J\_{b\_i} not quasi-split; by the Newton reduction lemma Red^b\_n⃗(π^n⃗\_p) = 0.
- So every term of the spectral expansion attached to such Π^n⃗ vanishes for every φ\_p, contradicting the nonzero total contribution.

*Sources.* \[CS17\], §5.5, Theorem 5.5.7 and proof, pp. 747–748: States and proves that, under the condition on the sets S\_i and the decomposition of r at the 𝔭\_i into characters with non-cyclotomic ratios, the r-part of the base-changed Igusa class vanishes for non-μ-ordinary b, via Remark 5.5.6, Lemma 5.4.3, Lemma 5.5.1 and Lemma 5.5.8.

*Needs:* IG.9.3; IG.9.4; IG.9.2; IG.9.5; AutomorphicGaloisRepresentationsPartII AG2.7 (node `unitary-discrete-parameter-export`); AutomorphicGaloisRepresentationsPartII AG2.5 (node `caraiani-upgrade-away-from-p-and-temperedness`); IG.8.3.

**Checks.**

- If every S\_i contains no τ with p\_τq\_τ ≠ 0 (G\_ℝ definite), B(G, μ^{−1}) is a point and the statement is empty.
- For \[F⁺:ℚ\] = 2, n = 2, signature (1,1) at τ₀ and (2,0) at τ₁ ∈ Φ (a compact Case 2 datum: the hermitian plane is definite at τ₁) and p totally split in F, B(G, μ^{−1}) has two classes, ordinary and basic at the factor of τ₀; for a generic r the basic class does not contribute.

## Layer IG.10: Kottwitz's simple Shimura varieties

For the division-algebra datum there is no endoscopy: the Igusa class is the Newton reduction of the cohomology of the proper Shimura variety, which Matsushima's formula expresses through automorphic representations. The Galois representations of this case rest on a base-change input recorded as a gap.

*Layer dependencies:* IG.8, IG.9, EndoscopicTransferAndUnitaryTraceComparison ET.0, EndoscopicTransferAndUnitaryTraceComparison ET.4, EndoscopicTransferAndUnitaryTraceComparison ET.5, EndoscopicTransferAndUnitaryTraceComparison ET.7b, AutomorphicSpectralTheory AS.4, AutomorphicSpectralTheory AS.6, ArithmeticLocallySymmetricSpaces ALS.5, EtaleDualityAndPerverseSheaves EDC.6, AutomorphicGaloisRepresentationsPartII AG2.1a, AutomorphicGaloisRepresentationsPartII AG2.2, AutomorphicGaloisRepresentationsPartII AG2.5.

### IG.10.1 Igusa trace formula for Kottwitz's simple Shimura varieties: only the stable term (CS17 Proposition 5.6.1)

Prove (theorem, node `IG.10/simple-igusa-trace-identity`): In the Case 1 setting, let b ∈ B(G, μ^{−1}) and φ = φ^pφ\_p ∈ C\_c^∞(G(𝔸\_f^p) × J\_b(ℚ\_p)) with φ\_p acceptable. Then tr(φ | ι\_ℓ\[H\_c(I^b\_Mant, ℚ̄\_ℓ)\]) = |ker¹(ℚ, G)| ι(G, G\_n) ST^{G\_n}\_e(φ^{G\_n}), where φ^{G\_n} is Shin's endoscopic test function for the trivial endoscopic datum.

*Hypotheses.*
- Case 1 datum of Layer IG.8 (B a central division algebra of degree n over F with an involution of the second kind, V ≅ B), p ∉ S split in 𝒦 (so B is split at every place of F above p and G(ℚ\_p) ≅ ∏\_i GL\_n(F\_{𝔭\_i}) × ℚ\_p^×), K\_p hyperspecial, G\_n the quasi-split inner form of G over ℚ with a fixed isomorphism G\_n ≅ G over ℚ\_p; ι\_ℓ fixed.
- φ\_p acceptable.

*Proof sketch.*
- Start from Shin's stable trace formula for Igusa varieties of PEL type (A): EndoscopicTransferAndUnitaryTraceComparison ET.5 (node `stable-trace-with-normalizations`), a sum over E\_ell(G) = E\_ell(G\_n).
- Vanishing of the proper terms (\[Shi10, Lemma 7.1\], cited by CS17): for a proper datum G\_{n₁,n₂}, let d\_v be the local index of B at a place v of F; since B has degree n and is a division algebra, lcm\_v(d\_v) = n, so some v has d\_v ∤ n₁. At that place the local factor of G is GL\_{n/d\_v}(D\_v) and that of H is GL\_{n₁} × GL\_{n₂}; an element of GL\_n(F\_v) that comes from GL\_{n/d\_v}(D\_v) has characteristic polynomial whose irreducible factors all have degree divisible by d\_v, which for the image of a (G, H)-regular γ\_H would force d\_v | n₁. So no such γ\_H has an image (ET.0/norm-correspondence), the transfer of φ\_v to H vanishes on all (G, H)-regular classes and ST^H\_e(φ^H) = 0.
- The surviving term is the trivial datum with coefficient ι(G, G\_n) = τ(G)τ(G\_n)^{−1}.
- CS17 follows \[Shi12, §6\], which assumes p inert in F⁺; that assumption is not used.

*Sources.* \[CS17\], §5.6, Proposition 5.6.1 and proof, p. 749: For the simple Shimura varieties with B split above p and acceptable φ\_p, the Igusa trace equals |ker¹| ι(G, G\_n) times the stable elliptic term for G\_n; the other terms vanish by Shin's Lemma 7.1, and the inert hypothesis of \[Shi12, §6\] is not needed.

*Needs:* EndoscopicTransferAndUnitaryTraceComparison ET.5 (node `stable-trace-with-normalizations`); EndoscopicTransferAndUnitaryTraceComparison ET.5 (node `rational-igusa-cohomology`); EndoscopicTransferAndUnitaryTraceComparison ET.0 (node `unitary-elliptic-endoscopic-data`); EndoscopicTransferAndUnitaryTraceComparison ET.0 (node `norm-correspondence`); EndoscopicTransferAndUnitaryTraceComparison ET.4 (node `stable-elliptic-distribution`); EndoscopicTransferAndUnitaryTraceComparison ET.4 (node `simple-division-algebra-trace-identity`); parent IG.1 (node `IG.1/alternating-igusa-cohomology`); IG.8.1; IG.8.3.

**Checks.**

- With φ\_p = 0 both sides vanish.
- For n = 1 there is no proper endoscopy and the identity is the trivial-datum case of Shin's formula.

### IG.10.2 Newton reduction of the cohomology of the simple Shimura variety (stable Lefschetz identity)

Prove (theorem, node `IG.10/simple-stable-lefschetz`): In the Case 1 setting put \[H(Sh, ℚ̄\_ℓ)\] := Σ\_i (−1)^i lim→\_K H^i(S\_{K,Ē}, ℚ̄\_ℓ) ∈ Groth(G(𝔸\_f)), and let Red^b\_n : Groth(G(ℚ\_p)) → Groth(J\_b(ℚ\_p)) be the Newton reduction for the trivial datum (normalized Jacquet functor, then the Langlands–Jacquet map, with the modulus twist), applied to the p-component through G(ℚ\_p) ≅ G\_n(ℚ\_p). Then Red^b\_n(\[H(Sh, ℚ̄\_ℓ)\]) = ε\_G · d(G\_ℝ) · \[H\_c(I^b\_Mant, ℚ̄\_ℓ)\] in Groth(G(𝔸\_f^p) × J\_b(ℚ\_p)), with ε\_G, d(G\_ℝ) nonzero constants depending only on G.

*Hypotheses.*
- Case 1 datum of Layer IG.8 (B a central division algebra of degree n over F with an involution of the second kind, V ≅ B), p ∉ S split in 𝒦 (so B is split at every place of F above p and G(ℚ\_p) ≅ ∏\_i GL\_n(F\_{𝔭\_i}) × ℚ\_p^×), K\_p hyperspecial, G\_n the quasi-split inner form of G over ℚ with a fixed isomorphism G\_n ≅ G over ℚ\_p; ι\_ℓ fixed.
- The constants are those produced by comparing the Euler–Poincaré function of G(ℝ) with Shin's archimedean test function for the trivial datum.

*Proof sketch.*
- Since S\_K is proper, H^\*(S\_{K,Ē}, ℚ̄\_ℓ) ≅ H^\*(S\_K(ℂ), ℂ) through ι\_ℓ and Artin's comparison (EtaleDualityAndPerverseSheaves EDC.6 (node `complex-analytic-comparison`)), Hecke-equivariantly.
- Arthur's L²-Lefschetz formula, here for a compact quotient: for f ∈ C\_c^∞(G(𝔸\_f)), tr(f | \[H(Sh)\]) = Σ\_π m(π) tr π\_f(f) ep(π\_∞) = I^G(f · f\_EP) (AutomorphicSpectralTheory AS.6 (node `l2-lefschetz`) with AS.6/compact-trace-specialization and the Euler–Poincaré function AS.6/general-euler-poincare); the geometric side has only elliptic terms because f\_EP is stable cuspidal.
- Stabilize the elliptic terms (ET.4/elliptic-stabilization); the proper endoscopic terms vanish by the local-index argument of the simple Igusa trace identity, leaving ι(G, G\_n) ST^{G\_n}\_e(f^{G\_n}) (\[Shi12, Prop. 6.3\] as cited in CS17).
- Take f = φ^p · f\_p with f\_p := φ^{G\_n}\_p transported to G(ℚ\_p): by Lemma 5.4.2 (ET.7b/red-trace-duality) tr π\_p(f\_p) = tr Red^b\_n(π\_p)(φ\_p). The archimedean test functions differ by the nonzero factor ε\_G d(G\_ℝ) (ET.4/archimedean-lefschetz-functions). Comparing with the simple Igusa trace identity gives the trace identity for acceptable φ\_p.
- Extend to all φ\_p ∈ C\_c^∞(J\_b(ℚ\_p)) by \[Shi09, Lemma 6.4\] (ET.5/central-shift-character-separation; the printed reference \[Shi11\] is corrected in PAPER-CARAIANI-SCHOLZE-17/E88), and conclude in the Grothendieck group by nondegeneracy of the trace pairing.

*Sources.* \[CS17\], §5.6, paragraph between Proposition 5.6.1 and Corollary 5.6.2, p. 749: Combines Proposition 5.6.1 with the stable trace formula for S\_K (Arthur's formula for Lefschetz numbers of Hecke operators, simplified as in Shin's Proposition 6.3 since G has no endoscopy) and Lemma 5.4.2 to get the Newton reduction of the cohomology of S\_K equal to a nonzero constant times the Igusa class, first for acceptable φ\_p and then for all φ\_p.

*Needs:* EtaleDualityAndPerverseSheaves EDC.6 (node `complex-analytic-comparison`); AutomorphicSpectralTheory AS.6 (node `l2-lefschetz`); AutomorphicSpectralTheory AS.6 (node `compact-trace-specialization`); AutomorphicSpectralTheory AS.6 (node `general-euler-poincare`); EndoscopicTransferAndUnitaryTraceComparison ET.4 (node `elliptic-stabilization`); EndoscopicTransferAndUnitaryTraceComparison ET.4 (node `archimedean-lefschetz-functions`); EndoscopicTransferAndUnitaryTraceComparison ET.7b (node `newton-reduction`); EndoscopicTransferAndUnitaryTraceComparison ET.7b (node `red-trace-duality`); EndoscopicTransferAndUnitaryTraceComparison ET.5 (node `central-shift-character-separation`); EndoscopicTransferAndUnitaryTraceComparison ET.0 (node `norm-correspondence`); IG.10.1; IG.8.2.

**Checks.**

- For b basic in the Harris–Taylor case this specializes to the formula expressing the Igusa class of the basic stratum through the Jacquet–Langlands transfer of the global cohomology.
- Applying the identity to the zero element is trivial; for the μ-ordinary b, Red^b\_n is a normalized Jacquet functor to M\_b = J\_b.

### IG.10.3 Igusa cohomology of simple Shimura varieties in terms of automorphic representations (CS17 Corollary 5.6.2)

Prove (theorem, node `IG.10/simple-igusa-cohomology`): In the Case 1 setting, in Groth(G(𝔸\_f^p) × J\_b(ℚ\_p)), \[ι\_ℓH\_c(I^b\_Mant, ℚ̄\_ℓ)\] = (−1)^{q(G)} Σ\_{π\_f} c(π\_f) \[π\_f^p\] \[Red^b\_n(π\_p)\], the sum over the irreducible admissible π\_f of G(𝔸\_f) such that π\_f ⊗ π\_∞ is automorphic for some π\_∞ cohomological for the trivial representation, with c(π\_f) := (−1)^{q(G)}(ε\_G d(G\_ℝ))^{−1} Σ\_{π\_∞} m(π\_f ⊗ π\_∞) ep(π\_∞), where m is the automorphic multiplicity, ep(π\_∞) = Σ\_i (−1)^i dim H^i(𝔤, K\_∞; π\_∞) and q(G) = ½ dim G(ℝ)/K\_∞A\_{G,∞}^0. The sum is locally finite: for each compact open subgroup only finitely many terms have invariants.

*Hypotheses.*
- Case 1 datum of Layer IG.8 (B a central division algebra of degree n over F with an involution of the second kind, V ≅ B), p ∉ S split in 𝒦 (so B is split at every place of F above p and G(ℚ\_p) ≅ ∏\_i GL\_n(F\_{𝔭\_i}) × ℚ\_p^×), K\_p hyperspecial, G\_n the quasi-split inner form of G over ℚ with a fixed isomorphism G\_n ≅ G over ℚ\_p; ι\_ℓ fixed.

*Proof sketch.*
- Matsushima's formula for the compact quotient: H^\*(S\_K(ℂ), ℂ) = ⊕\_π m(π) π\_f^K ⊗ H^\*(𝔤, K\_∞; π\_∞) (ArithmeticLocallySymmetricSpaces ALS.5 (node `automorphic-comparison`), with the discrete decomposition of the compact quotient AutomorphicSpectralTheory AS.4 (node `compact-quotient-spectrum`)); hence \[H(Sh)\] = Σ\_{π\_f}(Σ\_{π\_∞} m(π\_fπ\_∞) ep(π\_∞))\[π\_f\].
- Apply the stable Lefschetz identity and divide by ε\_G d(G\_ℝ); Red^b\_n acts only on the p-component.
- Only π\_∞ with H^\*(𝔤, K\_∞; π\_∞) ≠ 0 contribute, i.e. cohomological for the trivial representation.

*Sources.* \[CS17\], §5.6, Corollary 5.6.2, p. 749: Expresses the Igusa class as (−1)^{q(G)} times a sum over π\_f with π\_f π\_∞ automorphic, π\_∞ cohomological for the trivial representation, of c(π\_f)\[π\_f^p\]\[Red^b\_n(π\_p)\], with c(π\_f) related to the automorphic multiplicity; obtained from the stable Lefschetz identity and Matsushima's formula.

*Needs:* ArithmeticLocallySymmetricSpaces ALS.5 (node `automorphic-comparison`); AutomorphicSpectralTheory AS.4 (node `compact-quotient-spectrum`); EtaleDualityAndPerverseSheaves EDC.6 (node `complex-analytic-comparison`); IG.10.2.

**Checks.**

- When every contributing π\_∞ is a discrete series, ep(π\_∞) = (−1)^{q(G)} and c(π\_f) = (ε\_G d(G\_ℝ))^{−1} Σ\_{π\_∞} m(π\_f ⊗ π\_∞), a multiple of the automorphic multiplicity.
- One-dimensional automorphic representations (π\_∞ trivial) contribute with ep(1) = Euler characteristic of the compact dual.

### IG.10.4 Galois representations for cohomological automorphic representations of the division-algebra unitary group

Prove (theorem, node `IG.10/simple-base-change-galois`): In the Case 1 setting, let π = π\_f ⊗ π\_∞ be an automorphic representation of G(𝔸) with π\_∞ cohomological for the trivial representation, and S\_π the finite set of primes where G or π ramifies. Then there is an isobaric automorphic representation Π = ψ ⊗ Π⁰ of GL\_1(𝔸\_𝒦) × GL\_n(𝔸\_F), Π⁰ = Π\_1 ⊞ ⋯ ⊞ Π\_r with Π\_j discrete and conjugate self-dual, such that Π\_v ≅ BC\_v(π\_v) for every finite place v ∉ S\_π and for every v ∈ S\_π split in 𝒦 at which B is split above v, and Π⁰\_∞ has the infinitesimal character of the base change of the trivial representation. Consequently there is a continuous semisimple r\_{π,ℓ} : Gal(F̄/F) → GL\_n(ℚ̄\_ℓ), unramified at the places above primes q ∈ Spl\_{𝒦/ℚ} ∖ (S\_π ∪ {ℓ}), with the characteristic polynomial of r\_{π,ℓ}(Frob\_v) the image of P\_v under the Satake parameters of π\_v, and with WD(r\_{π,ℓ}|\_{Gal(F̄\_w/F\_w)})^{F-ss} ≅ ι\_ℓ^{−1}rec(Π⁰\_w|det|^{(1−n)/2}) at every place w ∤ ℓ of F above a prime split in 𝒦 at which B is split.

*Hypotheses.*
- Case 1 datum of Layer IG.8 (B a central division algebra of degree n over F with an involution of the second kind, V ≅ B), p ∉ S split in 𝒦 (so B is split at every place of F above p and G(ℚ\_p) ≅ ∏\_i GL\_n(F\_{𝔭\_i}) × ℚ\_p^×), K\_p hyperspecial, G\_n the quasi-split inner form of G over ℚ with a fixed isomorphism G\_n ≅ G over ℚ\_p; ι\_ℓ fixed.
- π\_∞ cohomological for the trivial representation.
- This node records the input CS17 attributes to Shin's appendix to \[Gol14\]; see the gap recorded for the division-algebra case.

*Proof sketch.*
- Base change (Shin's appendix, Theorem 1.1): the Kottwitz point-counting formula for the proper Shimura variety S\_K, its stabilization against the twisted trace formula of Res\_{𝒦/ℚ}G\_𝒦, and purity of weights to rule out cancellation; for B = F this is Theorem 1.1 of the appendix. For B a division algebra the base change lands on the inner form Res\_{𝒦/ℚ}(G ×\_ℚ 𝒦) whose finite-adelic points involve (B ⊗ F\_w)^× at the places where B ramifies, so the transfer to GL\_n(𝔸\_F) also needs the global Jacquet–Langlands correspondence; this step is not in the cited appendix (gap recorded; requested from AutomorphicGaloisRepresentationsPartII AG2.2).
- Galois representations of the conjugate self-dual discrete pieces Π\_j (after the algebraic twist): AutomorphicGaloisRepresentationsPartII AG2.1a (node `polarized-construction-inputs-shin-and-chenevier-harris`) and the discrete assembly AG2.2/discrete-unitary-galois-assembly; local–global compatibility away from ℓ: AG2.5/caraiani-upgrade-away-from-p-and-temperedness.
- Hecke polynomial matching at v | q ∈ Spl\_{𝒦/ℚ} ∖ (S\_π ∪ {ℓ}): unramified base change identity (ET.4/unramified-transfers) and the Satake normalization of the Hecke algebra node.

*Sources.* \[CS17\], §5.6, p. 749: States that for the simple Shimura varieties the stable base change of such π to GL\_n is established by Shin in the appendix to \[Gol14\], giving Galois representations r\_{π,ℓ}. \[Shin-BCU\], Theorem 1.1 and §1.1, pp. 1–5: For a unitary similitude group of a hermitian form on an n-dimensional F-space (F containing an imaginary quadratic field, no quasi-splitness or archimedean condition) and a discrete π cohomological for ξ, constructs an isobaric Π on GL\_1 × GL\_n with Π\_v = BC(π\_v) outside S\_ram and at the places of S\_ram split in E, by Morel's point counting with intersection cohomology, purity of weights, and two auxiliary primes.

*Needs:* AutomorphicGaloisRepresentationsPartII AG2.2; AutomorphicGaloisRepresentationsPartII AG2.1a (node `polarized-construction-inputs-shin-and-chenevier-harris`); AutomorphicGaloisRepresentationsPartII AG2.2 (node `discrete-unitary-galois-assembly`); AutomorphicGaloisRepresentationsPartII AG2.5 (node `caraiani-upgrade-away-from-p-and-temperedness`); EndoscopicTransferAndUnitaryTraceComparison ET.4 (node `simple-division-algebra-trace-identity`); EndoscopicTransferAndUnitaryTraceComparison ET.4 (node `unramified-transfers`); EndoscopicTransferAndUnitaryTraceComparison ET.4 (node `stable-twisted-identity`); IG.8.4; IG.8.1.

**Checks.**

- For n = 1, B = F and the statement is class field theory for the torus G.
- In the Harris–Taylor setting of ET.4/simple-division-algebra-trace-identity the conclusion is the classical one obtained there through Clozel's base change and the global Jacquet–Langlands correspondence.

### IG.10.5 The r-part of the Igusa class of a simple Shimura variety

Construct (construction, node `IG.10/simple-galois-summand`): In the Case 1 setting, let r : Gal(F̄/F) → GL\_n(ℚ̄\_ℓ) be continuous semisimple. The r-part \[H\_c(I^b\_Mant, ℚ̄\_ℓ)\]\_r is (−1)^{q(G)} Σ\_{π\_f : r\_{π,ℓ} ≅ r} c(π\_f)\[π\_f^p\]\[Red^b\_n(π\_p)\], the sub-sum of the formula for the Igusa class over the π\_f whose attached Galois representation is isomorphic to r. It is well defined: r\_{π,ℓ} depends only on the components of π\_f at almost all places split in 𝒦.

*Hypotheses.*
- Case 1 datum of Layer IG.8 (B a central division algebra of degree n over F with an involution of the second kind, V ≅ B), p ∉ S split in 𝒦 (so B is split at every place of F above p and G(ℚ\_p) ≅ ∏\_i GL\_n(F\_{𝔭\_i}) × ℚ\_p^×), K\_p hyperspecial, G\_n the quasi-split inner form of G over ℚ with a fixed isomorphism G\_n ≅ G over ℚ\_p; ι\_ℓ fixed.

*Construction.*
- Use the expression of the Igusa class from the simple Igusa cohomology formula and the Galois representations of the previous node.
- Two π\_f with the same components outside a finite set have isomorphic r\_{π,ℓ} (Chebotarev and Brauer–Nesbitt), so the sub-sum is determined by the Grothendieck-group element and r.

*Sources.* \[CS17\], §5.6, paragraph before Corollary 5.6.3, pp. 749–750: Restricts attention to the summand of the Igusa class coming from π with r\_{π,ℓ} ≅ r.

*Uses.* CS17 Corollary 5.6.3: the vanishing statement is about this summand; CS17 Theorem 6.3.1, Case 1: a lift r of ρ\_𝔪 with nonzero r-part is produced.

The API:
- `simpleIgusaGaloisPart` (constructor): \[H\_c(I^b\_Mant, ℚ̄\_ℓ)\]\_r ∈ Groth(G(𝔸\_f^p) × J\_b(ℚ\_p)).
- `simpleIgusaGaloisPart_sum` (relation): The Igusa class is the sum of its r-parts over isomorphism classes of r.
- `simpleIgusaGaloisPart_iso` (extensionality): Depends only on the isomorphism class of r.
- `simpleIgusaGaloisPart_eq_zero_iff` (characterisation): The r-part vanishes iff the coefficients c(π\_f)\[π\_f^p\]\[Red^b\_n(π\_p)\] of the π\_f with r\_{π,ℓ} ≅ r sum to zero.
- `simpleIgusaGaloisPart_frobenius` (compatibility): Each π\_f in the r-part has Satake parameters at v | q ∈ Spl\_{𝒦/ℚ} ∖ (S\_π ∪ {ℓ}) given by the eigenvalues of r(Frob\_v).

*Needs:* IG.10.3; IG.10.4; ArithmeticGaloisRepresentations R01.1 (node `brauer-nesbitt`); ArithmeticGaloisRepresentations R01.5 (node `haar-measure-chebotarev-clopen`).

**Checks.**

- `simpleIgusaGaloisPart_zero` (degenerate): The r-part of the zero class is zero.
- `simpleIgusaGaloisPart_n1` (computation): For n = 1 the r-part is the sum over the automorphic characters π of G(𝔸) whose attached ℓ-adic character is r.
- `simpleIgusaGaloisPart_red_zero` (characterisation): If Red^b\_n(π\_p) = 0 for every π\_f with r\_{π,ℓ} ≅ r, the r-part is zero.
- `simpleIgusaGaloisPart_not_pointwise` (non-example): A single π\_f with c(π\_f) ≠ 0 and r\_{π,ℓ} ≅ r need not give a nonzero r-part: two π\_f with equal π\_f^p, equal Red^b\_n(π\_p) and opposite coefficients cancel.
- The Igusa class is the locally finite sum of its r-parts.

### IG.10.6 Genericity forces μ-ordinarity for simple Shimura varieties (CS17 Corollary 5.6.3)

Prove (theorem, node `IG.10/simple-genericity-forces-mu-ordinary`): In the Case 1 setting, with ι\_p compatible with the chosen 𝔭 | p of E, let r : Gal(F̄/F) → GL\_n(ℚ̄\_ℓ) be continuous semisimple. Assume each S\_i contains at most one τ with p\_τq\_τ ≠ 0, and that for each i such that S\_i contains such a τ, r|\_{Gal(F̄\_{𝔭\_i}/F\_{𝔭\_i})} is a direct sum of characters χ\_{i,1} ⊕ ⋯ ⊕ χ\_{i,n} with χ\_{i,a}χ\_{i,b}^{−1} not the cyclotomic character for a ≠ b. Then \[H\_c(I^b\_Mant, ℚ̄\_ℓ)\]\_r = 0 for every b ∈ B(G, μ^{−1}) that is not μ-ordinary.

*Hypotheses.*
- Case 1 datum of Layer IG.8 (B a central division algebra of degree n over F with an involution of the second kind, V ≅ B), p ∉ S split in 𝒦 (so B is split at every place of F above p and G(ℚ\_p) ≅ ∏\_i GL\_n(F\_{𝔭\_i}) × ℚ\_p^×), K\_p hyperspecial, G\_n the quasi-split inner form of G over ℚ with a fixed isomorphism G\_n ≅ G over ℚ\_p; ι\_ℓ fixed.
- Sets S\_i defined with ι\_p^{−1} ∘ τ (PAPER-CARAIANI-SCHOLZE-17/E86).

*Proof sketch.*
- For π\_f in the r-part, local–global compatibility at 𝔭\_i (previous nodes; B is split above p) and the hypothesis make π\_{𝔭\_i} a generic principal series at every nontrivial index i.
- For a non-μ-ordinary b pick a nontrivial index i with J\_{b\_i} not quasi-split (the lemma on non-μ-ordinary classes, Layer IG.9).
- The Newton reduction lemma for the trivial datum n⃗ = (n) gives Red^b\_n(π\_p) = 0; hence every term of the r-part vanishes.

*Sources.* \[CS17\], §5.6, Corollary 5.6.3, p. 750: Under the same hypotheses on the sets S\_i and on r at the 𝔭\_i as Theorem 5.5.7, the r-part of the Igusa class of the simple Shimura variety vanishes for non-μ-ordinary b, proved in the same way.

*Needs:* IG.10.5; IG.10.4; IG.9.2; IG.9.5; IG.8.3.

**Checks.**

- For definite G\_ℝ (all p\_τq\_τ = 0) B(G, μ^{−1}) is a point and the statement is empty.

## Layer IG.11: Torsion concentration for compact unitary Shimura varieties

The end theorems. Hochschild–Serre passes to infinite level at the auxiliary prime, the Leray sequence for π\_HT reduces to Igusa cohomology, and at a minimal Newton class the parent's perversity concentrates that cohomology in one degree; the trace layers then attach Galois representations and force the minimal class to be μ-ordinary.

*Layer dependencies:* IG.8, IG.9, IG.10, parent IG.1, parent IG.3, parent IG.4, parent IG.5, PerfectoidShimuraVarieties S2, PerfectoidShimuraVarieties S3, DiamondEtaleCohomology C0, ClassicalAdicEtaleCohomology H0, ClassicalAdicEtaleCohomology H5, SchemeAndStackFoundations SF.2, ArithmeticGaloisDuality R02.2, ArithmeticGaloisDuality D7, AlgebraicModularFormsAndSerreWeights R15.5, ArithmeticGaloisRepresentations R01.1, ArithmeticGaloisRepresentations R01.5, IntegralHeckeAndGaloisDeterminants IHG.1, AutomorphicGaloisRepresentationsPartII AG2.7.

### IG.11.1 Contraction of a maximal ideal to the Hecke operators away from p

Prove (lemma, node `IG.11/hecke-contraction`): Let S′ ⊇ S be finite with ℓ ∉ S′ ∖ S, 𝕋^{S′} ⊂ 𝕋^S the subalgebra generated by the spherical algebras at the primes of Spl\_{𝒦/ℚ} ∖ (S′ ∪ {ℓ}), and 𝔪 ⊂ 𝕋^S a maximal ideal with finite residue field. Then 𝔪′ := 𝔪 ∩ 𝕋^{S′} is a maximal ideal of 𝕋^{S′}, and for every 𝕋^S-module M (such as H^i(S\_K, 𝔽\_ℓ) or the cohomology of Igusa varieties) M\_𝔪 is a localization of M\_{𝔪′}; hence M\_{𝔪′} = 0 implies M\_𝔪 = 0, and M\_𝔪 ≠ 0 implies M\_{𝔪′} ≠ 0. If M is finite over a finite ring, M\_{𝔪′} = ⊕\_{𝔐 ∩ 𝕋^{S′} = 𝔪′} M\_𝔐.

*Hypotheses.*
- 𝔪 maximal with finite residue field (true for the support of H^\*(S\_K, 𝔽\_ℓ)).

*Proof sketch.*
- 𝕋^{S′} → 𝕋^S/𝔪 has image a subring of a finite field, hence a field, so 𝔪′ is maximal.
- Elements of 𝕋^{S′} ∖ 𝔪′ lie outside 𝔪, so localizing at 𝔪 factors through localizing at 𝔪′.
- For M finite over a finite ring, M is a finite module over the Artinian image of 𝕋^S and splits as the sum of its localizations at the maximal ideals.

*Sources.* \[CS17\], §6.3, proof of Theorem 6.3.1, p. 759: Notes that only the Hecke operators away from p act at infinite level at p, and localizes at the corresponding contraction; the explicit reduction is PAPER-CARAIANI-SCHOLZE-17/E97.

*Needs:* Mathlib `Localization.AtPrime`; Mathlib `IsLocalization`; IG.8.4.

**Checks.**

- For S′ = S the statement is trivial.
- Used with S′ = S ∪ {p} (PAPER-CARAIANI-SCHOLZE-17/E97).

### IG.11.2 Hochschild–Serre between finite level and the perfectoid Shimura variety

Prove (theorem, node `IG.11/perfectoid-hochschild-serre`): Let 𝒮\_{K^p} ∼ lim←\_{K′\_p} 𝒮\_{K^pK′\_p} be the perfectoid Shimura variety over C at infinite level at p and H^b(𝒮\_{K^p}, 𝔽\_ℓ) = lim→\_{K′\_p} H^b(S\_{K^pK′\_p}, 𝔽\_ℓ). There is a convergent spectral sequence E\_2^{a,b} = H^a\_cts(K\_p, H^b(𝒮\_{K^p}, 𝔽\_ℓ)) ⇒ H^{a+b}(S\_K, 𝔽\_ℓ), equivariant for 𝕋^{S∪{p}}. Consequently, for a maximal ideal 𝔪 of 𝕋^{S∪{p}}: (a) if H^i(S\_K, 𝔽\_ℓ)\_𝔪 ≠ 0 then H^j(𝒮\_{K^p}, 𝔽\_ℓ)\_𝔪 ≠ 0 for some j ≤ i, in particular RΓ(𝒮\_{K^p}, 𝔽\_ℓ)\_𝔪 ≠ 0; (b) if H^b(𝒮\_{K^p}, 𝔽\_ℓ)\_𝔪 = 0 for all b < d then H^i(S\_K, 𝔽\_ℓ)\_𝔪 = 0 for all i < d.

*Hypotheses.*
- Compact unitary datum (Case 1 or 2) of Layer IG.8 with S, K = K\_SK^S, ℓ a prime and 𝕋^S its Hecke algebra; p a prime in Spl\_{𝒦/ℚ} ∖ (S ∪ {ℓ}) with K = K\_pK^p, K\_p hyperspecial; all cohomology is étale cohomology after base change to an algebraically closed field (C = ℂ\_p for the adic spaces).
- K^p sufficiently small for the perfectoid tower; localization at 𝔪 ⊂ 𝕋^{S∪{p}}.

*Proof sketch.*
- The perfectoid representative 𝒮\_{K^p} of the Hodge-type tower (a PEL datum of type A is of Hodge type): PerfectoidShimuraVarieties S2 (node `hodge-open-perfectoid-tower`); continuity of étale cohomology along the tower: DiamondEtaleCohomology C0 (node `etale-cohomology-continuity`).
- Algebraic and analytic étale cohomology of the proper varieties S\_{K^pK′\_p} agree (ClassicalAdicEtaleCohomology H5 (node `proper-comparison-3-7-2`)).
- 𝒮\_{K^p} → 𝒮\_K is a pro-finite-étale K\_p-torsor; the Cartan–Leray spectral sequence with continuous-cohomology E\_2 for étale coefficients is ClassicalAdicEtaleCohomology H0 (node `cartan-leray-spectral-sequence`) (b) (equivalently the colimit of the finite Hochschild–Serre sequences of SchemeAndStackFoundations SF.2 (node `hochschild-serre-galois-covering`)).
- Hecke operators at q ∉ S ∪ {p, ℓ} commute with the K\_p-action, so the spectral sequence is 𝕋^{S∪{p}}-equivariant and localization (exact) can be applied termwise.
- (a): if j₀ is the least degree with H^{j₀}(𝒮\_{K^p})\_𝔪 ≠ 0 then E\_2^{a,b}\_𝔪 = 0 for b < j₀, so H^i(S\_K)\_𝔪 = 0 for i < j₀. CS17 claims H^i(𝒮\_{K^p})\_𝔪 ≠ 0 for the least i with H^i(S\_K)\_𝔪 ≠ 0, which needs H^a\_cts(K\_p, −) to vanish in positive degrees (true for pro-p K\_p, not for hyperspecial K\_p); only the weaker statement is used (PAPER-CARAIANI-SCHOLZE-17/E96). (b) is the same vanishing in the other direction.

*Sources.* \[CS17\], §6.3, proof of Theorem 6.3.1(1)–(2), pp. 758–759, with footnote 34: Invokes a Hochschild–Serre spectral sequence relating the cohomology of the perfectoid Shimura variety S\_{K^p} and of S\_K, to pass nonvanishing up to infinite level and vanishing below the middle degree down to S\_K; all groups are étale cohomology over an algebraically closed field.

*Needs:* PerfectoidShimuraVarieties S2 (node `hodge-open-perfectoid-tower`); DiamondEtaleCohomology C0 (node `etale-cohomology-continuity`); ClassicalAdicEtaleCohomology H5 (node `proper-comparison-3-7-2`); ClassicalAdicEtaleCohomology H0 (node `cartan-leray-spectral-sequence`); SchemeAndStackFoundations SF.2 (node `hochschild-serre-galois-covering`); ArithmeticGaloisDuality R02.2 (node `hochschild-serre-spectral-sequence`); IG.11.1; IG.8.2.

**Checks.**

- If K\_p is pro-p (not the case here) the edge map H^i(S\_K)\_𝔪 → H^i(𝒮\_{K^p})\_𝔪^{K\_p} is injective in the least degree.
- For d = 0 the statement (b) is empty.

### IG.11.3 Reduction of perfectoid-level cohomology to Igusa cohomology through π_HT

Prove (theorem, node `IG.11/leray-reduction-to-igusa`): Let π\_HT : 𝒮\_{K^p} → Fℓ\_{G,μ} be the Hodge–Tate period map and 𝔪 ⊂ 𝕋^{S∪{p}} maximal. Then Rπ\_HT\*𝔽\_ℓ is a complex of sheaves of 𝕋^{S∪{p}}-modules, and for every geometric point x̄ of Fℓ^b\_{G,μ}, ((Rπ\_HT\*𝔽\_ℓ)\_𝔪)\_x̄ ≅ RΓ(Ig^b, 𝔽\_ℓ)\_𝔪. Consequently: (a) if RΓ(Ig^b, 𝔽\_ℓ)\_𝔪 = 0 for every b ∈ B(G, μ^{−1}), then RΓ(𝒮\_{K^p}, 𝔽\_ℓ)\_𝔪 = 0; (b) if H^i(Ig^b, 𝔽\_ℓ)\_𝔪 = 0 for all i < d and all b, then H^i(𝒮\_{K^p}, 𝔽\_ℓ)\_𝔪 = 0 for all i < d.

*Hypotheses.*
- Compact unitary datum (Case 1 or 2) of Layer IG.8 with S, K = K\_SK^S, ℓ a prime and 𝕋^S its Hecke algebra; p a prime in Spl\_{𝒦/ℚ} ∖ (S ∪ {ℓ}) with K = K\_pK^p, K\_p hyperspecial; all cohomology is étale cohomology after base change to an algebraically closed field (C = ℂ\_p for the adic spaces).
- Compact PEL datum of type (A) with good reduction at p (Layer IG.8 integral model).

*Proof sketch.*
- The Hodge–Tate period map for Hodge type: PerfectoidShimuraVarieties S3 (node `hodge-open-period-map`); the Hecke operators away from p act trivially on Fℓ\_{G,μ}, so the pushforward is a sheaf of 𝕋^{S∪{p}}-modules and localization commutes with stalks and with RΓ (filtered colimit).
- Stalks: the compact fibre theorem parent IG.3 (node `IG.3/compact-fibre-theorem`) (CS17 Theorem 4.4.4), Hecke-equivariantly, for the proper integral model of Layer IG.8.
- Stalks at all geometric points (including higher-rank points) are controlled by rank-one points (parent IG.3 (node `IG.3/rank-one-cohomology-lemma`)); the strata Fℓ^b cover Fℓ\_{G,μ}.
- Leray: RΓ(𝒮\_{K^p}, 𝔽\_ℓ)\_𝔪 = RΓ(Fℓ\_{G,μ}, (Rπ\_HT\*𝔽\_ℓ)\_𝔪) (ArithmeticGaloisDuality D7 (node `grothendieck-spectral-sequence`) on the étale sites of DiamondEtaleCohomology C0 (node `etale-site`)); if all stalks vanish the complex is zero, and if all stalks lie in degrees ≥ d so does the complex and its hypercohomology.

*Sources.* \[CS17\], §6.3, proof of Theorem 6.3.1(1) and the end of the proof of (2), pp. 758–760: If no Igusa variety has nonzero localized cohomology then (Rπ\_HT\*𝔽\_ℓ)\_𝔪 = 0 and the cohomology of S\_{K^p} vanishes by the Leray spectral sequence; at the end, vanishing of (R^iπ\_HT\*𝔽\_ℓ)\_𝔪 for i < dim S\_K gives the vanishing on S\_{K^p}. \[CS17\], Theorem 4.4.4, p. 726, and proof of Corollary 6.1.4, p. 754: The stalks of Rπ\_HT\* at points of the b-stratum are the cohomology of Ig^b, compatibly with the Hecke action away from p.

*Needs:* PerfectoidShimuraVarieties S3 (node `hodge-open-period-map`); parent IG.3 (node `IG.3/compact-fibre-theorem`); parent IG.3 (node `IG.3/rank-one-cohomology-lemma`); parent IG.1 (node `IG.1/igusa-cohomology`); ArithmeticGaloisDuality D7 (node `grothendieck-spectral-sequence`); DiamondEtaleCohomology C0 (node `etale-site`); IG.11.1; IG.8.2.

**Checks.**

- For the μ-ordinary class, Fℓ^{b\_ord} is the set of ℚ\_p-rational flags (dimension 0) and the stalks there are the ordinary Igusa cohomology.

### IG.11.4 From the minimal Newton stratum to a nonzero dual Galois summand

Prove (theorem, node `IG.11/minimal-stratum-constituent`): Let 𝔪 ⊂ 𝕋^{S∪{p}} be maximal and b ∈ B(G, μ^{−1}) with d\_b = ⟨2ρ, ν\_b⟩ minimal among the classes with RΓ(Ig^b, 𝔽\_ℓ)\_𝔪 ≠ 0. Then: (1) H^i(Ig^b, 𝔽\_ℓ)\_𝔪 ≠ 0 only for i = d\_b; for every Mantovan level m large enough the finite-level H^i(I^b\_{Mant,m}, 𝔽\_ℓ)\_𝔪 is nonzero exactly for i = d\_b; (2) H^\*(I^b\_{Mant,m}, ℤ\_ℓ)\_𝔪 is free over ℤ\_ℓ and concentrated in degree d\_b, and H^\*\_c(I^b\_{Mant,m}, ℤ\_ℓ)\_{𝔪^∨} is free and concentrated in degree d\_b, nonzero; (3) the 𝔪^∨-part of \[H\_c(I^b\_Mant, ℚ̄\_ℓ)\]^{S′-ur} (the sum of the constituents whose Hecke eigenvalues away from S ∪ {p, ℓ} reduce to 𝔪^∨) is a nonzero element of the Grothendieck group; (4) there is a constituent whose unramified component Π^{S′} (Case 2: an irreducible subrepresentation of BC^{S′}(\[H\_c(I^b\_Mant, ℚ̄\_ℓ)\]^{S′-ur}); Case 1: π\_f^{S′} for π\_f in the simple Igusa cohomology formula) has Hecke eigenvalues lifting 𝔪^∨, and the r-part of the Igusa class for r = r\_{Π^{S′},ℓ} (resp. r\_{π,ℓ}) is nonzero.

*Hypotheses.*
- Compact unitary datum (Case 1 or 2) of Layer IG.8 with S, K = K\_SK^S, ℓ a prime and 𝕋^S its Hecke algebra; p a prime in Spl\_{𝒦/ℚ} ∖ (S ∪ {ℓ}) with K = K\_pK^p, K\_p hyperspecial; all cohomology is étale cohomology after base change to an algebraically closed field (C = ℂ\_p for the adic spaces).
- Localization at 𝔪 ⊂ 𝕋^{S∪{p}} (contracted ideal).
- S′ = S ∪ {∞, p} ∪ Ram(ϖ) in Case 2.

*Proof sketch.*
- (1): compact minimal-stratum concentration parent IG.4 (node `IG.4/compact-minimal-stratum-concentration`) (CS17 Corollary 6.1.4) with S ∪ {p} in place of S and the subalgebra 𝕋^{S∪{p}}; m-torsion and m-localization vanish together since H^i(Ig^b) = lim→ H^i(I^b\_{Mant,m}) with split injective transition maps. Taking invariants under a pro-p compact open of J\_b(ℚ\_p) is exact on 𝔽\_ℓ-modules (ℓ ≠ p), giving the finite-level statement (IG.1/perfection-of-mantovan, IG.1/igusa-group-actions).
- (2): a bounded complex of finite ℤ\_ℓ-modules whose reduction mod ℓ is concentrated in one degree has free cohomology in that degree only (universal coefficients and Nakayama). Hecke-equivariant Poincaré duality on I^b\_{Mant,m} (Layer IG.8) turns this into the statement for H\_c at 𝔪^∨.
- (3): after ⊗ℚ̄\_ℓ the 𝔪^∨-part of H\_c^\* is concentrated in degree d\_b and nonzero, so no cancellation occurs in the alternating sum; the S′-unramified part keeps it since the level outside S′ is hyperspecial.
- (4): Case 2: by the spectral expansion (Layer IG.9) and its part (2), some Π^{S′} occurs in BC^{S′} with nonzero total contribution; its Hecke eigenvalues lie in a finite extension and reduce to 𝔪^∨ by the Deligne–Serre lemma (AlgebraicModularFormsAndSerreWeights R15.5 (node `deligne-serre-eigenvalue-lifting-lemma`)) applied to the finite free ℤ\_ℓ-lattice H^{d\_b}\_c(I^b\_{Mant,m}, ℤ\_ℓ)\_{𝔪^∨}. Case 1: the same with the simple Igusa cohomology formula. The printed 'Theorem 5.5.5' is Corollary 5.5.5 (PAPER-CARAIANI-SCHOLZE-17/E99); the dual ideal enters through PAPER-CARAIANI-SCHOLZE-17/E98.

*Sources.* \[CS17\], §6.3, proof of Theorem 6.3.1(1), pp. 758–759: Takes b with minimal ⟨2ρ, ν\_b⟩, uses Corollary 6.1.4 and pro-p invariants to get concentration of the finite-level Igusa cohomology in the middle degree, deduces flatness of the ℤ\_ℓ-cohomology, passes to compact supports by Poincaré duality with the dual eigenvalues, and finds a Π^S as in Lemma 5.5.1 whose eigenvalues lift the ideal. \[CS17\], Corollary 6.1.4 and proof, pp. 753–755: Concentration of the localized Igusa cohomology at a minimal stratum; m-torsion and localization vanish together.

*Needs:* parent IG.4 (node `IG.4/compact-minimal-stratum-concentration`); parent IG.1 (node `IG.1/perfection-of-mantovan`); parent IG.1 (node `IG.1/igusa-group-actions`); parent IG.1 (node `IG.1/igusa-cohomology`); parent IG.1 (node `IG.1/alternating-igusa-cohomology`); IG.8.6; IG.8.5; IG.9.3; IG.9.4; IG.10.3; IG.10.5; AlgebraicModularFormsAndSerreWeights R15.5 (node `deligne-serre-eigenvalue-lifting-lemma`); IG.11.1.

**Checks.**

- If b is μ-ordinary, d\_b = d = dim S\_K.
- For n = 1, every b is μ-ordinary and the statement is about the cohomology of a finite set.

### IG.11.5 Galois representations for torsion Hecke eigensystems (CS17 Theorem 6.3.1(1))

Prove (theorem, node `IG.11/torsion-galois-representations`): Let 𝔪 ⊂ 𝕋^S be a maximal ideal with H^i(S\_K, 𝔽\_ℓ)\_𝔪 ≠ 0 for some i. There is a unique continuous semisimple ρ\_𝔪 : Gal(F̄/F) → GL\_n(𝔽̄\_ℓ), unramified outside the places above S ∪ {ℓ}, such that for every finite place v of F above q ∈ Spl\_{𝒦/ℚ} ∖ (S ∪ {ℓ}) the characteristic polynomial of ρ\_𝔪(Frob\_v) is the image of P\_v(X) = Σ\_i (−1)^i q\_v^{i(i−1)/2} T\_{i,v} X^{n−i} under a fixed embedding 𝕋^S/𝔪 ↪ 𝔽̄\_ℓ.

*Hypotheses.*
- Compact unitary datum (Case 1 or 2) of Layer IG.8 with S, K = K\_SK^S, ℓ a prime and 𝕋^S its Hecke algebra; all cohomology is étale cohomology after base change to an algebraically closed field (C = ℂ\_p for the adic spaces).
- Case 1 or Case 2; no condition at an auxiliary prime.

*Proof sketch.*
- Choose p ∈ Spl\_{𝒦/ℚ} ∖ (S ∪ {ℓ}) and contract 𝔪 to 𝔪′ ⊂ 𝕋^{S∪{p}} (hecke-contraction). By Hecke-equivariant Poincaré duality on S\_K, H^\*(S\_K, 𝔽\_ℓ)\_{𝔪^∨} ≠ 0 too.
- Hochschild–Serre (perfectoid-hochschild-serre (a)) gives RΓ(𝒮\_{K^p}, 𝔽\_ℓ)\_{𝔪′} ≠ 0, so by the Leray reduction some RΓ(Ig^b, 𝔽\_ℓ)\_{𝔪′} ≠ 0; take b with d\_b minimal.
- The minimal-stratum node gives Π^{S′} with eigenvalues lifting (𝔪′)^∨ and nonzero r-part; its Galois representation (AG2.7/unitary-discrete-parameter-export in Case 2, simple-base-change-galois in Case 1) has semisimplified reduction ρ\_{(𝔪′)^∨} with the required Frobenius polynomials at the places above Spl\_{𝒦/ℚ} ∖ (S ∪ {p, ℓ}) (reduction of characteristic polynomials: AG2.7/residual-representation-of-pi); dualize and twist by the dual-ideal node to get ρ\_{𝔪′} = ρ\_𝔪 at those places.
- Uniqueness: two semisimple representations with the same Frobenius characteristic polynomials on a density-one set of places are isomorphic (Chebotarev ArithmeticGaloisRepresentations R01.5 (node `haar-measure-chebotarev-clopen`) and Brauer–Nesbitt R01.1/brauer-nesbitt).
- Places above p: run the argument with a second auxiliary prime p′ ∈ Spl\_{𝒦/ℚ} ∖ (S ∪ {ℓ, p}); by uniqueness the two representations agree, and the second one is unramified with the required polynomial at the places above p (PAPER-CARAIANI-SCHOLZE-17/E97).

*Sources.* \[CS17\], §6.3, Theorem 6.3.1(1), p. 757, and proof, pp. 758–759: States the existence and uniqueness of the semisimple ρ\_𝔪 with the displayed Frobenius polynomials at the places above Spl\_{𝒦/ℚ} ∖ (S ∪ {ℓ}) (the factor ℤ\_q^× corrected, E12), and proves it via Hochschild–Serre, the Leray sequence for π\_HT, Corollary 6.1.4, Poincaré duality, Lemma 5.5.1 and Corollary 5.5.5; in Case 1 via Corollary 5.6.2. \[CS17\], Theorem 1.1(1) and Remark 1.2, p. 651: The existence of ρ\_𝔪 for compact unitary Shimura varieties, here proved at p ≠ ℓ through the Hodge–Tate period map.

*Needs:* IG.11.1; IG.11.2; IG.11.3; IG.11.4; IG.8.6; IG.8.5; AutomorphicGaloisRepresentationsPartII AG2.7 (node `unitary-discrete-parameter-export`); AutomorphicGaloisRepresentationsPartII AG2.7 (node `residual-representation-of-pi`); IG.10.4; ArithmeticGaloisRepresentations R01.5 (node `haar-measure-chebotarev-clopen`); ArithmeticGaloisRepresentations R01.1 (node `brauer-nesbitt`); IntegralHeckeAndGaloisDeterminants IHG.1 (node `algebraically-closed-reconstruction`).

**Checks.**

- For n = 1, ρ\_𝔪 is the reduction of the Galois character attached by class field theory to the Hecke character of G.
- ρ\_{𝔪^∨} ≅ ρ\_𝔪^∨ ⊗ ε̄^{1−n}.

### IG.11.6 Middle-degree concentration of the generic part (CS17 Theorem 6.3.1(2))

Prove (theorem, node `IG.11/middle-degree-concentration`): Let 𝔪 ⊂ 𝕋^S be a maximal ideal with H^\*(S\_K, 𝔽\_ℓ)\_𝔪 ≠ 0 and ρ\_𝔪 as above. Suppose there is a CS-auxiliary pair (p, 𝔭) for ρ\_𝔪 (Layer IG.8): p ∈ Spl\_{𝒦/ℚ} ∖ (S ∪ {ℓ}) and a prime 𝔭 | p of E such that each S\_i contains at most one τ with p\_τq\_τ ≠ 0 and ρ\_𝔪 is decomposed generic at 𝔭\_i whenever S\_i contains such a τ. Then H^j(S\_K, 𝔽\_ℓ)\_𝔪 ≠ 0 only for j = d = dim S\_K.

*Hypotheses.*
- Compact unitary datum (Case 1 or 2) of Layer IG.8 with S, K = K\_SK^S, ℓ a prime and 𝕋^S its Hecke algebra; p a prime in Spl\_{𝒦/ℚ} ∖ (S ∪ {ℓ}) with K = K\_pK^p, K\_p hyperspecial; all cohomology is étale cohomology after base change to an algebraically closed field (C = ℂ\_p for the adic spaces).
- Case 1 or Case 2; (p, 𝔭) a CS-auxiliary pair for ρ\_𝔪.

*Proof sketch.*
- By Hecke-equivariant Poincaré duality on S\_K and the dual-ideal node (𝔪^∨ has a CS-auxiliary pair whenever 𝔪 does), it suffices to prove H^i(S\_K, 𝔽\_ℓ)\_𝔪 = 0 for i < d for every such 𝔪; contract to 𝔪′ ⊂ 𝕋^{S∪{p}}.
- By Hochschild–Serre (b) it suffices to show H^i(𝒮\_{K^p}, 𝔽\_ℓ)\_{𝔪′} = 0 for i < d.
- Let b have d\_b minimal with RΓ(Ig^b)\_{𝔪′} ≠ 0. The minimal-stratum node gives a Galois representation r (attached to the constituent it produces) with nonzero r-part of the Igusa class of b; by part (1) and Chebotarev with Brauer–Nesbitt its semisimplified reduction is ρ\_{𝔪^∨} = ρ\_𝔪^∨ ⊗ ε̄^{1−n}, globally and hence at every 𝔭\_i.
- At each nontrivial 𝔭\_i, ρ\_{(𝔪′)^∨} is decomposed generic, so by CS17 Lemma 6.2.2 (parent IG.5 (node `IG.5/generic-lift-splits`), over the finite extension F\_{𝔭\_i} of ℚ\_p) r|\_{Gal(F̄\_{𝔭\_i}/F\_{𝔭\_i})} is a sum of characters with non-cyclotomic ratios. Theorem 5.5.7 (Case 2) or Corollary 5.6.3 (Case 1) forces b to be μ-ordinary, so d\_b = ⟨2ρ, μ⟩ = d.
- Since ⟨2ρ, ν\_{b′}⟩ ≤ ⟨2ρ, μ⟩ = d with equality only for the μ-ordinary class, minimality forces every b′ with RΓ(Ig^{b′})\_{𝔪′} ≠ 0 to be μ-ordinary; its cohomology is concentrated in degree d by minimal-stratum concentration. So H^i(Ig^{b′}, 𝔽\_ℓ)\_{𝔪′} = 0 for i < d and all b′, and the Leray reduction (b) gives H^i(𝒮\_{K^p}, 𝔽\_ℓ)\_{𝔪′} = 0 for i < d.

*Sources.* \[CS17\], §6.3, Theorem 6.3.1(2), p. 757, and proof, pp. 759–760: Under the auxiliary-prime condition, the localized cohomology is concentrated in degree dim S\_K: reduce by Poincaré duality to the lower bound, pass to infinite level by Hochschild–Serre, take a minimal stratum, use Lemma 6.2.2 and Theorem 5.5.7 (or Corollary 5.6.3) to see that it is μ-ordinary, then conclude by Corollary 6.1.4, Theorem 4.4.4 and the Leray spectral sequence. \[CS17\], §6.2, Lemma 6.2.2, p. 756: A characteristic-zero lift of a decomposed-generic unramified representation is a sum of characters with non-cyclotomic ratios and corresponds to a generic principal series.

*Needs:* IG.11.2; IG.11.3; IG.11.4; IG.11.5; IG.11.1; IG.8.6; IG.8.5; IG.8.7; parent IG.5 (node `IG.5/generic-lift-splits`); parent IG.4 (node `IG.4/compact-minimal-stratum-concentration`); IG.9.6; IG.10.6.

**Checks.**

- Concentration fails without localization: H^0(S\_K, 𝔽\_ℓ) ≠ 0 always (CS17 Remark 1.7).
- For d = 0 the statement is that all localized cohomology is in degree 0.

### IG.11.7 Caraiani–Scholze's theorem for compact unitary Shimura varieties (CS17 Theorem 1.1)

Prove (theorem, node `IG.11/compact-generic-vanishing`): Let (G, X) be a compact unitary datum (Case 1 or 2), K = K\_SK^S neat as in Layer IG.8, and 𝔪 ⊂ 𝕋^S a maximal ideal with H^i(S\_K, 𝔽\_ℓ)\_𝔪 ≠ 0. (1) There is an associated ρ\_𝔪 : Gal(F̄/F) → GL\_n(𝔽̄\_ℓ). (2) If some rational prime p ≠ ℓ splits completely in F and ρ\_𝔪 is unramified and decomposed generic at every place of F above p, then i = d. (3) If G\_ℝ is definite at all infinite places of F⁺ but one and ρ\_𝔪 is unramified and decomposed generic at some finite place of F, then i = d. In both (2) and (3) H^\*(S\_K, 𝔽\_ℓ)\_𝔪 is concentrated in degree d. CS17 states Theorem 1.1 for the locally symmetric spaces X\_Γ = Γ\X and gives its precise form as Theorem 6.3.1 for S\_K(ℂ) = ⊔\_j Γ\_j\X; the statement here is that precise form.

*Hypotheses.*
- Case 1 or Case 2; K neat with K^S hyperspecial (in Case 2, S ⊂ Spl\_{F/F⁺}, so the level is hyperspecial at every prime outside Spl\_{F/F⁺}).

*Proof sketch.*
- (1) is torsion-galois-representations.
- (2): by auxiliary-prime-existence (a) there is such p outside S ∪ {ℓ}, and every (p, 𝔭) is a CS-auxiliary pair; apply middle-degree-concentration.
- (3): auxiliary-prime-existence (b) produces a CS-auxiliary pair (corrected Remark 6.3.3, PAPER-CARAIANI-SCHOLZE-17/E95); apply middle-degree-concentration.
- The comparison with the locally symmetric spaces of the introduction is S\_K(ℂ) = ⊔\_j Γ\_j\X with Γ\_j = G^{(i)}(ℚ) ∩ g\_jKg\_j^{−1} (PELModuli M3 (node `complex-points`)); no statement about the localized cohomology of a single component is made.

*Sources.* \[CS17\], §1, Theorem 1.1 with footnote 2, p. 651; Remarks 1.2–1.5, pp. 651–652: Main theorem: Galois representations for systems of Hecke eigenvalues in the mod-ℓ cohomology of compact unitary locally symmetric spaces of Kottwitz's simple type (and the quasi-split case of footnote 2), and concentration in the middle degree when ρ\_𝔪 is unramified and decomposed generic above a completely decomposed prime; Remark 1.5 weakens the hypothesis for definite-but-one signatures. \[CS17\], §6.3, Remarks 6.3.2–6.3.3, p. 758: Explain how the conditions of the introduction give the hypothesis of Theorem 6.3.1(2).

*Needs:* IG.11.5; IG.11.6; IG.8.8; IG.8.7; PELModuli M3 (node `complex-points`); IG.8.1.

**Checks.**

- n = 1: d = 0 and the statement is trivially true.
- Harris–Taylor signature: (3) needs only one decomposed-generic place (CS17 Remark 1.5).

### IG.11.8 Integral coefficients and twisted coefficient systems (CS17 Remarks 1.3 and 1.7.1)

Prove (theorem, node `IG.11/integral-and-twisted-coefficients`): Let 𝔪 ⊂ 𝕋^S satisfy the conclusion of middle-degree concentration: H^i(S\_K, 𝔽\_ℓ)\_𝔪 = 0 for i ≠ d. (1) Then H^i(S\_K, ℤ\_ℓ)\_𝔪 = 0 for i ≠ d and H^d(S\_K, ℤ\_ℓ)\_𝔪 is a free ℤ\_ℓ-module. (2) Let K′ ⊂ K be a normal compact open subgroup with K′\_q = K\_q for q ∉ S′ (S′ ⊇ S finite), V a finite 𝔽\_ℓ\[K/K′\]-module and L\_V the associated local system on S\_K. Let 𝔪 ⊂ 𝕋^{S′} be maximal and suppose that, if H^\*(S\_{K′}, 𝔽\_ℓ)\_𝔪 ≠ 0, the representation ρ\_𝔪 attached at level K′ (Galois representations for torsion eigensystems with S′ in place of S) admits a CS-auxiliary pair. Then H^i(S\_K, L\_V)\_𝔪 ≠ 0 only for i = d. (3) For an irreducible algebraic representation ξ of G over a finite extension E\_λ/ℚ\_ℓ with a K-stable O\_λ-lattice, the same holds for the ℤ\_ℓ-local system L\_ξ under the hypothesis of (2) at a normal compact open K′ ⊂ K on which L\_ξ ⊗ 𝔽\_ℓ becomes constant: H^i(S\_K, L\_ξ)\_𝔪 = 0 for i ≠ d and H^d(S\_K, L\_ξ)\_𝔪 is free over O\_λ.

*Hypotheses.*
- Compact unitary datum (Case 1 or 2) of Layer IG.8 with S, K = K\_SK^S, ℓ a prime and 𝕋^S its Hecke algebra; all cohomology is étale cohomology after base change to an algebraically closed field (C = ℂ\_p for the adic spaces).
- (2)–(3): Hecke operators only at primes where K′ = K.

*Proof sketch.*
- (1): RΓ(S\_K, ℤ\_ℓ)\_𝔪 is a perfect complex of ℤ\_ℓ-modules with RΓ(S\_K, ℤ\_ℓ)\_𝔪 ⊗^L 𝔽\_ℓ = RΓ(S\_K, 𝔽\_ℓ)\_𝔪 concentrated in degree d; the universal coefficient sequences 0 → H^i(ℤ\_ℓ)\_𝔪/ℓ → H^i(𝔽\_ℓ)\_𝔪 → H^{i+1}(ℤ\_ℓ)\_𝔪\[ℓ\] → 0 and Nakayama give vanishing for i ≠ d and torsion-freeness in degree d.
- (2): the finite Galois cover S\_{K′} → S\_K with group K/K′ trivializes L\_V; the Hochschild–Serre spectral sequence (SchemeAndStackFoundations SF.2 (node `hochschild-serre-galois-covering`)) E\_2^{a,b} = H^a(K/K′, H^b(S\_{K′}, 𝔽\_ℓ) ⊗ V) ⇒ H^{a+b}(S\_K, L\_V) is 𝕋^{S′}-equivariant. Localized at 𝔪, the E\_2 page vanishes outside the row b = d by middle-degree concentration at level K′ (and vanishes entirely if H^\*(S\_{K′}, 𝔽\_ℓ)\_𝔪 = 0), so H^i(S\_K, L\_V)\_𝔪 = 0 for i < d.
- Upper bound: Poincaré duality with local-system coefficients (EtaleDualityAndPerverseSheaves EDC.2:pairings (node `poincare-duality-torsion`) for locally constant constructible sheaves) identifies H^i(S\_K, L\_V)\_𝔪 with the dual of H^{2d−i}(S\_K, L\_{V^∨}(d))\_{𝔪^∨}, which vanishes for 2d − i < d by the lower bound for V^∨ and 𝔪^∨.
- (3): apply (1)–(2) to L\_ξ/ℓ (a local system attached to a finite 𝔽\_ℓ\[K/K′\]-module) and pass to ℤ\_ℓ by (1).

*Sources.* \[CS17\], Remark 1.3, p. 651: States that concentration of the localized ℤ\_ℓ-cohomology in the middle degree, with torsion-free middle cohomology, is a formal consequence of the theorem. \[CS17\], Remark 1.7.1, p. 652: States that an argument with the Hochschild–Serre spectral sequence and Poincaré duality gives the theorem for nontrivial Hecke-equivariant coefficient systems; neither remark is proved in the paper (PAPER-CARAIANI-SCHOLZE-17 item 2).

*Needs:* IG.11.6; IG.8.6; IG.8.5; SchemeAndStackFoundations SF.2 (node `hochschild-serre-galois-covering`); EtaleDualityAndPerverseSheaves EDC.2:pairings (node `poincare-duality-torsion`); Mathlib `Module.Free`; IG.11.1.

**Checks.**

- For V = 𝔽\_ℓ (trivial module, K′ = K), (2) is middle-degree concentration itself.
- Without localization, H^0(S\_K, L\_V) = V^{K/K′} ⊗ H^0 may be nonzero.

## Recorded gap and request

**Base change for division-algebra unitary groups of arbitrary signature (Case 1 Galois representations).** Case 1 of Theorem 6.3.1 needs, for every π on the division-algebra unitary group G with π\_∞ cohomological for the trivial representation, an isobaric base change Π to GL\_1 × GL\_n with compatibility at the split places where B is split, and the attached Galois representations. CS17 cites Shin's appendix to \[Gol14\], whose Theorem 1.1 assumes B = F (sourceIssues E1). The missing step is the passage from the inner form Res\_{𝒦/ℚ}(G\_𝒦) to GL\_n(𝔸\_F) (global Jacquet–Langlands for GL\_m(D)) combined with the base change of the appendix, or an alternative published reference (Labesse's CM base change for inner forms, Kottwitz 1992 for simple Shimura varieties, neither read here). Requested from AutomorphicGaloisRepresentationsPartII AG2.2. Case 2 does not use this input. *Needed by:* IG.10.4, IG.10.5, IG.10.6, IG.11.5, IG.11.6, IG.11.7.

**Request to AutomorphicGaloisRepresentationsPartII AG2.2.** For the unitary similitude group G of a central division algebra B of degree n over a CM field F = F⁺·𝒦 with an involution of the second kind (Kottwitz's simple Shimura varieties, arbitrary signature), and π automorphic on G(𝔸) with π\_∞ cohomological for the trivial representation: an isobaric conjugate self-dual Π on GL\_1(𝔸\_𝒦) × GL\_n(𝔸\_F) with Π\_v ≅ BC\_v(π\_v) at all finite places outside the ramification of π and G and at the ramified places split in 𝒦 where B is split, hence Galois representations r\_{π,ℓ} with Frobenius polynomials given by Satake parameters and local–global compatibility away from ℓ at those places. CS17 §5.6 (p. 749) attributes this to Shin's appendix to Goldring (2014), whose Theorem 1.1 covers only B = F (recorded as E1); the PAPER-CARAIANI-SCHOLZE-17 route (item 156) assigns it to AG2.2.

## Corrections to the sources

**E1 (gap; §5.6, paragraph after Corollary 5.6.2, p. 749 (the same sentence is in arXiv v1, §5.6)).** For Kottwitz's simple Shimura varieties (B a division algebra with centre F, V simple, involution of the second kind) the source says that the stable base change to GL\_n of the relevant π has been established by Shin in the appendix to \[Gol14\], and uses the resulting Galois representations r\_{π,ℓ} to define the r-parts of Corollary 5.6.3. *Correction:* Cite a base-change theorem that covers unitary similitude groups of central division algebras with an involution of the second kind and arbitrary signature, with compatibility at the split places where B is split (for the auxiliary prime p ∉ S this is where it is needed), or supply the missing step: the cited Theorem 1.1 together with the global Jacquet–Langlands correspondence for the inner forms of GL\_n involved. *Reason:* Theorem 1.1 of the appendix is stated for G the unitary similitude group of a hermitian form on an n-dimensional F-vector space (Shin-BCU, p. 1, setting before (1.1)), i.e. B = F; its proof applies Morel's point counting to that group and the twisted trace formula for Res\_{E/ℚ}G\_E, which for B = F has general linear Levi factors. For B a central division algebra of degree n > 1 the group Res\_{𝒦/ℚ}(G ×\_ℚ 𝒦) has factors (B ⊗\_F F\_w)^× at the places w where B ramifies, so a transfer to GL\_n(𝔸\_F) additionally requires the global Jacquet–Langlands correspondence; this step is not in the appendix. *Affects:* the proof; *known:* new.

The corrected statements of the paper extraction are used throughout: E12, E63, E64, E66, E69, E71, E74, E75, E77, E78, E79, E85, E86, E87, E88, E95, E96, E97, E98, E99 (PAPER-CARAIANI-SCHOLZE-17), in particular E74 (Red^b with the modulus twist), E77 (cohomological type at ∞), E79 (occurrence of eigensystems by total contribution), E85 (one base change BC^{S′}), E86 (ι\_p^{−1}∘τ), E87 (central correction in the Shapiro identification), E95 (Remark 6.3.3), E96–E99 (the proof of Theorem 6.3.1).

## Restructuring

**Split: IgusaVarietiesAndTorsionConcentrationPartII, IgusaVarietiesAndTorsionConcentrationPartIISiegelOrdinary.** The design brief combines two continuations of IgusaVarietiesAndTorsionConcentration: the compact unitary endgame of Caraiani–Scholze 2017 (PAPER-CARAIANI-SCHOLZE-17, 15 items) and the ordinary Igusa formal schemes of Siegel varieties over ℤ\_p of Boxer–Pilloni, Higher Hida theory for Siegel modular forms, §3.4 (PAPER-BOXER-PILLONI-26, 31 items). The second brief itself records that the two Part IIs share no layer and neither imports the other: one is mod-ℓ cohomology of compact unitary Shimura varieties and the trace formula, the other is integral p-adic formal geometry of the Siegel ordinary locus (J\_ord, schematic closures of level groups, partial toroidal compactifications, open immersions into integral models). *Proposal:* This roadmap plans only the compact unitary direction (Layers IG.8–IG.11). Create a separate design job DESIGN-IgusaVarietiesAndTorsionConcentrationPartIISiegelOrdinary with the PAPER-BOXER-PILLONI-26 route and its 31 items, titled 'Igusa varieties, compactified period fibers and torsion concentration, Part II: ordinary Igusa formal schemes of Siegel varieties' (or Part III, if two Part IIs of one parent are not allowed), with parent IgusaVarietiesAndTorsionConcentration and the suppliers named in its brief (ShimuraCompactificationsPartII C7–C14 for the normalized Siegel models, FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1 for universal covers, PELModuli M5 for the Siegel datum). It imports nothing from this roadmap.

**Rescope: IgusaVarietiesAndTorsionConcentrationPartII, EndoscopicTransferAndUnitaryTraceComparison.** The PAPER-CARAIANI-SCHOLZE-17 source route asked EndoscopicTransferAndUnitaryTraceComparison to widen ET.5/ET.7b to the groups G\_n⃗ of every rank and inner forms of arbitrary archimedean signature. Its accepted plan did so for the general pieces (ET.5/stable-trace-with-normalizations for PEL type (A)/(C), ET.4/stable-twisted-identity for every rank and signature, ET.4/archimedean-lefschetz-functions, ET.7b/newton-reduction and red-trace-duality), but its three CSnc-specific nodes ET.7b/signed-igusa-trace, local-factorization and hecke-character-separation remain stated for the rank-2n quasi-split datum. *Proposal:* Layer IG.9 here owns the compact rank-n versions (igusa-trace-identity = CS17 Theorem 5.3.2, igusa-spectral-expansion = CS17 Lemma 5.5.1 and Corollary 5.5.2), proved from ET's general nodes and stated so as to specialize to ET.7b for the CSnc datum. If ET states those three nodes for an arbitrary unitary similitude datum quasi-split at finite places, replace IG.9/igusa-trace-identity and IG.9/igusa-spectral-expansion by citations of ET.7b.

**Rescope: IgusaVarietiesAndTorsionConcentrationPartII, AutomorphicGaloisRepresentationsPartII.** PAPER-CARAIANI-SCHOLZE-17 item 156 (stable base change for Kottwitz's simple Shimura varieties) was routed to AG2.2, which has no node for it; the cited source covers only B = F (sourceIssues E1). *Proposal:* AG2.2 (or an AutomorphicGaloisRepresentationsPartII continuation) owns base change and Galois representations for the division-algebra unitary groups of arbitrary signature; IG.10/simple-base-change-galois then becomes a citation. Until then this roadmap records the gap and the request.

## Downstream consumers

Allen et al., *Potential automorphy over CM fields*, and the non-compact sequel of Caraiani and Scholze cite the compact theorems; through the parent, PotentialAutomorphyInfrastructure uses the vanishing theorems, and the compact case of Theorem 6.3.1 is the model for the torsion vanishing results that EllipticCurveModularityImaginaryQuadratic and CrystallineLocalGlobalCompatibilityCM import from the parent.

## References

- **CS17** — Ana Caraiani, Peter Scholze, *On the generic part of the cohomology of compact unitary Shimura varieties*. Annals of Mathematics 186 (2017), no. 3, 649–766 (published PDF; page numbers are journal pages). <https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf> (read 2026-10-19; §1, pp. 649–658: Theorem 1.1, Remarks 1.2–1.7.1, Definition 1.9, Theorems 1.10–1.15 (statements); §5, pp. 729–750: §5.1 setup, §5.2 Theorem 5.2.3–Remark 5.2.6, §5.3 Proposition 5.3.1–Proposition 5.3.3, §5.4 Lemmas 5.4.2–5.4.3, §5.5 Lemma 5.5.1–Lemma 5.5.8, §5.6 Proposition 5.6.1–Corollary 5.6.3; §6, pp. 750–760: Theorems 6.1.1–6.1.2, Proposition 6.1.3 and Corollary 6.1.4 with proofs, §6.2 Definition 6.2.1 and Lemma 6.2.2, §6.3 Theorem 6.3.1, Remarks 6.3.2–6.3.3 and the proof; References \[Art89\], \[Gol14\], \[Kot92a\], \[Shi09\]–\[Shi12\]).
- **CS17v1** — Ana Caraiani, Peter Scholze, *On the generic part of the cohomology of compact unitary Shimura varieties (arXiv preprint)*. arXiv:1511.02418v1, 8 November 2015 (the only arXiv version). <https://arxiv.org/abs/1511.02418v1> (read 2026-10-19; §5.6 (simple Shimura varieties): the sentence attributing stable base change to Shin's appendix to \[Gol14\], and the bibliography entry \[Gol14\]).
- **Shin-BCU** — Sug Woo Shin, *On the cohomological base change for unitary similitude groups (appendix to Wushi Goldring's paper)*. Author's copy, 5 pages; published as the appendix to W. Goldring, Galois representations associated to holomorphic limits of discrete series, Compositio Math. 150 (2014), 191–228. <https://math.berkeley.edu/~swshin/BCofU.pdf> (read 2026-10-19; §1: setting, Theorem 1.1, Remark 1.2, §1.1 proof (Lemma 1.3, Proposition 1.4, the claim and the two-prime argument), pp. 1–5).
