# Modular forms, Part II: GL₂ automorphic representations and transfer

Extends [ModularForms](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ModularForms/README.md) to local/adelic GL₂, newvectors, Whittaker models, classical comparisons, Jacquet–Langlands, base change, induction and Artin/residual modularity.

Owners: ModularForms (classical forms), SmoothRepresentationsOfLocalGroups (SR), AdelicAlgebraicGroups (AA), AutomorphicFormsOnReductiveGroups (AF), AutomorphicLFunctionsAndLocalFactors (AL), AutomorphicSpectralTheory (AS), EndoscopicTransferAndUnitaryTraceComparison (ET), ArithmeticGaloisRepresentations (R01). Import their carriers; Shimura cohomology, p-adic Banach theory and compatible systems retain their owners.

## Conventions and existing objects

Reuse Mathlib `Matrix.GeneralLinearGroup (Fin 2) R`, determinant/scalars/maps, `Matrix.ProjGenLinGroup`, `Representation.invariants` and Haar measure; construct adelic quotient measure separately. `HeckeRing.GL2.Newform` supplies newspace membership, nebentypus, good eigenvalues and a₁=1; ModularForms4 supplies bad eigenproperties. `eq_of_forall_notMem_eigenvalue_eq` fixes level/character; adelic strong multiplicity one compares classes. Hilbert coefficients use `TauCeti.symPowerRep` and Mathlib finite tensors.

`TauCeti.IsProjectiveRep.exists_monoidHom_of_cohomologyClass_eq_zero` supplies algebraic lifting, with arithmetic vanishing/continuity separate. `TauCeti.simple_indFDRep_ofLinearCharacter_iff` requires finite groups and algebraically closed characteristic-zero coefficients. `TauCeti.Matrix.GeneralLinearGroup.not_isSolvable_fin_two` excludes solvability of full GL₂.

At finite places O,p,ϖ,q denote valuation ring, maximal ideal, uniformizer and residue size; ν(ϖ)=q⁻¹. Upper-Borel induction includes δ_B^(1/2), δ_B(diag(a,d))=|a/d|. K₀(pⁿ) constrains the lower-left entry; K₁(pⁿ) fixes the last row. Both are GL₂(O) at n=0. Right translation gives K₀-character ω(d); transport Casselman's top-left convention through π∨≅π⊗ω⁻¹det. Fix ψ of conductor O and W(1)=1. SR.2.3/whittaker-functionals supplies `SmoothRep.whittakerFunctionals=Hom_U(V,ψ)` and `SmoothRep.whittakerMultiplicityOne_gl2`, dimension one for irreducible infinite-dimensional V. Normalization requires genericity; one-dimensional classes have no Whittaker model.

Reciprocity sends ϖ to geometric Φ, ν_W(Φ)=q⁻¹. `rec` matches normalized induction; `recᵀ(π)=rec(π)⊗ν_W^(-1/2)` multiplies rank-two Frobenius by √q and preserves N. Factors use (ker N)^I; arithmetic-Frobenius eigenvalues must be inverted with the cohomological dual specified. For unitary Satake α,β, T₁=√q(α+β); weight-k roots are q^((k−1)/2)α and q^((k−1)/2)β. Rationality uses π_alg=π_unitary⊗|det|^(-(k−2)/2).

Use full O(2) modules D_k, k≥2, with weights ±k on the positive-determinant pieces; weight one is the limit with parameter 1⊕sgn. At complex places |z|_ℂ=|z|²; gamma conventions are in R16.3. Fix the additive character by trace to ℚ, self-dual local measures and additive quotient mass one. Analytic conductor is |Disc(F)|²N(𝔣π). Over ℚ, t=s+(k−1)/2 converts s↔1−s to t↔k−t.

Fix quaternion split-place identifications. Cuspidal JL excludes norm characters; local division characters match Steinberg twists. Compare automorphic isomorphism classes. Residual comparisons fix coefficient place, residue embedding, lattice and semisimplification. Characteristic-two determinant oddness is vacuous; involutions need not be semisimple. Compatible families have a common coefficient field and good-place polynomials.

AlgebraicModularFormsAndSerreWeights (R15) supplies geometric forms, Hasse invariants and eigenvalue lifting. Namespaces: R16.1–R17.2 `TauCeti.GL2Blueprint`; R17.3–R17.6 and arithmetic character lemmas `TauCeti.GL2Transfer`. Locators use printed pages and the listed editions.

## R16.1. Local and adelic groups

<a id="r16-1-k0"></a>

### k0: The lower-left congruence subgroup

For a commutative valuation ring O, maximal ideal p and n≥0, K₀(pⁿ) is the subgroup of the existing GL₂(O) consisting of matrices g with g₂₁∈pⁿ. For a general commutative ring R and ideal I the same formula defines K₀(I). Its image in GL₂(F) uses the existing coefficient map. At n=0 this is all GL₂(O).

API:

- `k0_mem`: g∈K₀(I) iff g₂₁∈I.
- `k0_mono`: I⊆J implies K₀(I)⊆K₀(J).
- `k0_top`: K₀(R)=GL₂(R), expressed as the top subgroup.
- `k0_scalar`: Every scalar unit matrix belongs to K₀(I).

Tests:

- The identity matrix is in K₀(I).
- K₀(p⁰) is the full group, including the Weyl matrix.
- Over ℤ/5ℤ and I=0, (1 1;0 1) belongs, whereas (1 0;1 1) does not.

Uses: Mathlib `Matrix.GeneralLinearGroup`; Mathlib `Matrix.GeneralLinearGroup.map`.

Source: [casselman73], p. 301, §1 definition of Γ₀(b).

<a id="r16-1-k1"></a>

### k1: The last-row congruence subgroup

K₁(pⁿ)={g∈GL₂(O): g₂₁∈pⁿ and g₂₂−1∈pⁿ}; over R write K₁(I). It is the inverse image of the stabilizer of row (0,1) under reduction modulo I, not the full principal congruence subgroup. K₁(p⁰)=GL₂(O).

API:

- `k1_mem`: g∈K₁(I) iff g₂₁∈I and g₂₂−1∈I.
- `k1_le_k0`: K₁(I)⊆K₀(I).
- `k1_mono`: I⊆J implies K₁(I)⊆K₁(J); in particular K₁(pⁿ⁺¹)⊆K₁(pⁿ).
- `k1_top`: K₁(R) is the full matrix unit group.
- `k1_scalar`: Scalar u belongs to K₁(I) iff u−1∈I.

Tests:

- The identity belongs to K₁(I).
- K₁(p⁰)=GL₂(O).
- Over ℤ/5ℤ, (2 0;0 1) lies in K₁(0), although it is not the identity modulo 5.

Uses: R16.1/k0; Mathlib `Matrix.GeneralLinearGroup`.

Source: [aky22], §1.2, pp. 3–4, K(n,λ) and generic λπ.

Embed these groups in GL₂(F) as localK0(n), localK1(n). Their API gives compactness, openness, antitonicity, level-zero equality GL₂(O) and localK1(n)⊆localK0(n). At level one the upper unipotent with entry 1 belongs to both, the lower one to neither, and diag(u,1) belongs to localK1. The Weyl element belongs at level zero only. If u−1∉p, scalar u belongs to localK0(1), not localK1(1); this test requires such a residue unit, absent over F₂. The diagonal test distinguishes principal congruence.

<a id="r16-1-local-adelic-compact-comparison"></a>

### local-adelic-compact-comparison: GL₂ local and adelic compact subgroups

For any number field F, identify the generic reductive group GL₂(Fv) with existing matrix units. At finite v the standard maximal compact is GL₂(Ov); at real v it is O(2); at complex v it is U(2). The adelic compact is their product, and its finite part is compact open in the restricted product with respect to GL₂(Ov). K₀(pvⁿ), K₁(pvⁿ) and finite products of these are compact open at finite places. All topology and restricted-product identifications are those of AA.1.

Uses: R16.1/k0; R16.1/k1; Mathlib `Matrix.GeneralLinearGroup`; AA `AA.1/adelic-points`; AA `AA.1/adelic-points-locally-compact`; ReductiveGroupsPartII `RG2.0`; AF `AF.1`.

Source: [jl70], §2 p. 12, compact-subgroup and Haar convention.

<a id="r16-1-iwasawa-cartan"></a>

### iwasawa-cartan: Rank-two Iwasawa and Cartan coordinates

Specialize RG2.4 at finite places and AF.1 at infinity: GL₂(Fv)=B(Fv)K_v. At a finite place every double coset K_v g K_v has a unique representative diag(ϖᵃ,ϖᵇ) with a≥b integers. With upper triangular B and normalized induction, δB(diag(a,d))=|a/d|v. At infinity use positive singular values and O(2)/U(2).

Uses: R16.1/local-adelic-compact-comparison; ReductiveGroupsPartII `RG2.4`; Mathlib `Matrix.GeneralLinearGroup.det`; AF `AF.1`.

Source: [jl70], §3 formula (3.1) and following compact realization, p. 46.

<a id="r16-1-haar-quotient-comparison"></a>

### haar-quotient-comparison: Haar and central-character quotient comparison

Fix local measures dg_v on GL₂(Fv), vol(GL₂(Ov))=1 at finite places outside a specified finite set; form AA.0’s restricted Haar product. GL₂ is unimodular. For a continuous unitary idele-class character ω use AA.2’s quotient measure and central-character L² space on Z(𝔸)GL₂(F)\GL₂(𝔸): f(zγg)=ω(z)f(g), with finite integral of |f|². The matrix realization is an isometric right-translation-equivariant identification with AA.2/central-character-l2. Measures on elliptic centralizers are fixed separately, not inferred from dg_v.

ω unitary and trivial on F×; quotient is formed by the closed subgroup specified by AA.2.

Uses: R16.1/local-adelic-compact-comparison; AA `AA.0/restricted-haar-product`; AA `AA.2/central-character-l2`; Mathlib `MeasureTheory.Measure.haarMeasure`; Mathlib `MeasureTheory.Measure.haarMeasure_self`.

Source: [jl70], §10 and §16 fixed central character.

<a id="r16-1-finite-level-comparison"></a>

### finite-level-comparison: Finite-level automorphic functions

At compact open Kf, the GL₂ finite-level space is the Kf-fixed subspace of AF.2’s automorphic forms with chosen central character, finite K∞ types and infinitesimal-character ideal. Using the finite double-coset decomposition GL₂(𝔸)=⊔GL₂(F)tᵢGL₂(F∞)Kf, restriction identifies it with the direct sum of classical spaces on Γᵢ\GL₂(F∞), with Γᵢ the corresponding arithmetic stabilizer. The central character, growth, differential and right-translation conditions are transported, not redefined. AL.0 owns additive Schwartz–Bruhat/Fourier theory; SR.1 owns the compactly supported smooth Hecke carrier.

Kf compact open; finite type and finite-codimension annihilator data as in AF.2.

Uses: R16.1/haar-quotient-comparison; AF `AF.2/automorphic-form`; AF `AF.2/adelic-classical-bijection`; AL `AL.0/adelic-schwartz-bruhat-space`; SR `SR.1`.

Source: [jl70], Definition 10.2 and following cusp-form definition.

<a id="r16-1-chevalley-congruence"></a>

### chevalley-congruence: Congruences detecting finite-index subgroups of S-units

For a number field M, finitely generated subgroup E⊂M×, integer n>0 and finite set T of finite places, there is a modulus m with empty infinite part and support disjoint from T such that E∩congruenceSubgroup(m)⊂Eⁿ. Consequently, for every finite-index H⊂E one can require this intersection to lie in H: use n=exponent(E/H). These are `chevalley_power_congruence` and `chevalley_finiteIndex_congruence` on GlobalNumberFields' existing `Modulus` and `IsCongrOne`. The subsidiary `fg_of_units_outside_finset` proves finite generation of a subgroup whose elements are units outside one finite set S. Its valuation map has image a subgroup of ℤ^S and kernel a subgroup of (𝓞 M)×; Dirichlet's unit theorem and finite generation of extensions give the assertion.

Proof: The saturation E₀={y∈M×: yᵃ∈E for some a>0} lies in a finitely generated S-unit group. Hence E₀/E is a finite torsion group. If u kills this quotient, an nu-th root in M of x∈E has its u-th power in E. It therefore suffices to detect powers in M, with exponent nu.

Reduce r to prime powers pᵉ and combine their moduli. For p=2 with i∉M, work first in M(i) with exponent 2^(e+k), where 2ᵏ is its largest 2-power root-of-unity order. If y^(2^(e+k))∈M, the least f with y^(2^f)∈M satisfies f≤k: quadratic conjugation gives a primitive 2^f-th root as σ(y)/y. Thus y^(2^k)∈M gives the required root. This enlargement handles the dyadic exception.

For odd p, or i∈M, descend pᵉ-th roots from M(μ_{pᵉ}) one cyclotomic step at a time. The initial degree divides p−1, so the norm and Bézout give descent. In a degree-p step M(μ_{pʰ})⊂M(μ_{pʰ⁺¹}), write σ(y)/y=ζ_{pᵉ}ᶠ and σ(ζ)=ζᵍ. Since g≡1 mod pʰ and σᵖ(y)=y, pᵉ divides f(1+g+⋯+g^(p−1)). That sum is p modulo p²; for p=2 the hypothesis i∈M ensures h≥2. Hence σ(y)/y∈μ_p. Multiply y by a power of ζ_{pʰ⁺¹} to make it invariant without changing y^(pᵉ).

Over the cyclotomic field containing μ_{pᵉ}, the generator-root extension L is abelian of p-power degree. Choose a prime inert in each degree-p subextension, avoiding r, generator supports, ramification and rational primes below T. Their rational primes give a modulus. Congruence to 1 gives a local pᵉ-th root by Hensel. Here all roots have the same global root field, because μ_{pᵉ} is in the base. A nontrivial root field contains a degree-p subextension, contradicting the chosen inert prime. Cyclotomic descent and the dyadic enlargement return the root to M.

Uses: GlobalNumberFields Layer 7 (`Modulus`, `IsCongrOne`); Mathlib `NumberField.Units` and finitely generated abelian-group subgroups; NumberFieldArithmetic Layer 5 (valuations); Chebotarev Layer 10; LocalFieldsRamification Layer 1 (Hensel). The S-unit and cyclotomic deductions are owned here.

Source: [chevalley51], Theorem 1 p.36, primary proof §§1–5 pp.36–39.

Tests: Exponent one permits the unit modulus. For E=⟨2⟩⊂ℚ× and n=2, congruence modulo 3 detects exactly the even powers, while T={2} is avoided. For n=3, modulo 7 detects the powers divisible by three; imposing a modulus supported at 2 would fail the avoidance condition.

<a id="r16-1-full-local-character-prescription"></a>

### full-local-character-prescription: Finite Hecke characters with prescribed full local components

For any number field M, finite set S of finite places and continuous finite-image χ_v:M_v×→ℂ×, there exists a continuous finite-image Ψ:C_M→ℂ× restricting to χ_v on every **full** M_v× and trivial on every M_w× at infinity. Auxiliary finite ramification and growth of character order are allowed. `finite_hecke_full_local_prescription` uses Mathlib's `IdeleClassGroup` and `IdeleClassGroup.ofAdicCompletion`/`ofCompletion`; current Tau Ceti's `HeckeCharacter` abbreviates the same carrier.

Proof: In the S-units E let H=ker∏χ_v. Chevalley gives m away S with E-congruences contained in H. Put B=M_∞××∏_S M_v××∏_{v∉S}U_v(m). Then θ=∏χ_v kills B∩M×, exactly these S-unit congruences. Descend θ to D=image B in C_M and set N=image kerθ. The idele-class quotient is open, so N is open. Depths killed by χ_v at S, together with m, give a ray subgroup inside N; its finite quotient bounds [C_M:N]. Apply `finite_character_extension_iff` to D,N. Pullback agrees on all of B, including uniformizers and infinity, and has finite image. No prescribed character order is retained.

For one local quasi-character α, its restriction to compact units has finite image: continuity and the no-small-subgroups property of ℂ× kill an open unit subgroup. Choose s with q^{−s}=α(ϖ), write α=ν|·|^s with ν finite-image, extend ν by the theorem and multiply by the global norm character. Simultaneous quasi-character prescription needs compatible norm exponents and is not inferred from this one-place consequence. Multiplying a supplied infinity-type character by Ψ preserves its infinity components, as required below.

Tests are the uniformizer, auxiliary-ramification and order-growth examples in tunnell-primitive-globalization below.

Uses: R16.1/chevalley-congruence; GlobalNumberFields Layers 7 and 9 (idele ray subgroup and finite ray quotient); Mathlib `MonoidHom.domRestrict_surjective`; `finite_character_extension_iff`.

Source: [cht08], Lemma 4.1.1 and proof, p. 116; [chevalley51], Theorem 1, pp. 36–40. Finite image follows from the explicit ray quotient argument above.

## R16.2. Local representations and newvectors

<a id="r16-2-local-classification"></a>

### local-classification: Explicit nonarchimedean classification

Over any nonarchimedean characteristic-zero local field F, with ν=|·|F and complex coefficients, normalized induction I(χ₁,χ₂)=Ind_B^G(χ₁⊗χ₂) is irreducible iff χ₁χ₂⁻¹≠ν,ν⁻¹. Its central character is χ₁χ₂. If χ₁=χν¹ᐟ², χ₂=χν⁻¹ᐟ², it has the essentially Steinberg subrepresentation St⊗χdet and one-dimensional quotient χdet; reversing the order reverses the sub/quotient. Every irreducible admissible representation is a character of determinant, irreducible principal series, essentially Steinberg, or supercuspidal. Infinite-dimensional irreducibles are generic; one-dimensional characters are not. These are explicit calculations in the SR.2 induction/Jacquet carriers and ET.6 classification, including residue characteristic two.

Smooth, irreducible, admissible complex representations; χᵢ smooth quasicharacters.

Uses: R16.1/iwasawa-cartan; SR `SR.2`; SR `SR.3`; SR `SR.2.3/whittaker-functionals`; ET `ET.6`.

Source: [casselman73], p. 305, principal/special classification.

<a id="r16-2-newvector-level-exists"></a>

### newvector-level-exists: Existence of a nonzero newvector level

For an irreducible admissible infinite-dimensional complex smooth representation π of GL₂(F), with F a nonarchimedean local field of characteristic zero, there is n≥0 and a nonzero vector fixed by the last-row K₁(pⁿ). This assertion neither uses a conductor exponent nor asserts the dimension formula; it supplies the nonempty level set before its minimum is defined.

Use Mathlib's `IsNonarchimedeanLocalField`, its valuation ring and maximal ideal, and `Representation.invariants` for the embedded subgroup. Smoothness means every vector stabilizer is open; admissibility means the invariant subspace of every compact open subgroup is finite-dimensional. Irreducibility is Mathlib's `Representation.IsIrreducible`. These conditions specialize the SR.3 theory without introducing replacement representation or local-field carriers.

Uses: R16.1/k1; R16.2/local-classification; Mathlib `Representation.invariants`; SR `SR.3`; SR `SR.2.3/whittaker-functionals`.

Source: [casselman73], §1 Theorem 1, p. 302; its proof and subgroup decomposition, pp. 303–306.

<a id="r16-2-newvector-conductor"></a>

### newvector-conductor: The newvector conductor exponent

For irreducible admissible infinite-dimensional π of GL₂(F), c(π) is the least n≥0 for which π^{K₁(pⁿ)} is nonzero. Define the ideal conductor p^{c(π)}. The same least-level construction is available for an existing representation with an explicit nonempty level set. Existence for the stated π is the preceding newvectorLevelExists theorem, not a field stored in a replacement representation. This specializes fixed vectors.

π generic, equivalently infinite-dimensional irreducible in characteristic zero; O,p and K₁ fixed.

API:

- `conductor_min`: π^{K₁(p^{c(π)})}≠0 and π^{K₁(pⁿ)}=0 for n<c(π).
- `conductor_iso`: Isomorphic local representations have equal conductor exponent.
- `conductor_unramified_twist`: An unramified χ has c(π⊗χdet)=c(π), since χdet is trivial on GL₂(O).

Tests:

- An irreducible unramified generic principal series has conductor zero.
- An unramified Steinberg twist has conductor one.
- For χ of conductor a≥2, c(St⊗χdet)=2a≠1+a. At a=1 both formulas give2, so that case alone would not detect the incorrect rule.

Uses: R16.1/k1; R16.2/local-classification; Mathlib `Representation`; Mathlib `Representation.invariants`; SR `SR.3`; R16.2/newvector-level-exists.

Source: [casselman73], Theorem 1 p. 302 and epsilon remark p. 307.

<a id="r16-2-casselman-newvector"></a>

### casselman-newvector: Casselman’s newvector theorem

For π as above and every n≥0, dimℂ π^{K₁(pⁿ)}=max(0,n−c(π)+1). The minimal fixed space is a line. In the lower-last-row convention it is the ωπ(d)-isotypic line for K₀(p^{c(π)}), with ωπ the central character, when c>0; at c=0 it is the spherical line. With ψ trivial on O but nontrivial on ϖ⁻¹O, Whittaker evaluation W↦W(1) is nonzero on this line. Casselman’s printed top-left central-character convention is transported through the dual/twist convention; it is not silently identified with the lower-last-row subgroup. The theorem has no odd-residue-characteristic restriction.

Uses: R16.2/newvector-conductor; R16.2/local-classification; R16.1/k0; R16.1/k1; SR `SR.2.3/whittaker-functionals`; AL `AL.2`.

Source: [casselman73], Theorem 1, p. 302; Corollary to the Proof, p. 306; Kirillov construction in the proof, pp. 303–306.

<a id="r16-2-normalized-newvector"></a>

### normalized-newvector: The normalized Whittaker newvector

For generic irreducible π and the chosen conductor-O ψ, take the unique K₁(p^{c(π)})-fixed vector in the Whittaker model of SR.2.3/whittaker-functionals with W(1)=1. Equivalently, in the existing fixed line and its Whittaker functional λ, choose the unique v with λ(v)=1. No arbitrary vector is made canonical before fixing ψ and λ. For an unramified determinant twist χ, Wχ(g)=χ(det g)W(g) under the corresponding Whittaker identification.

The fixed line is one-dimensional and λ restricts nontrivially; the Whittaker model and functional are supplied by SR.2.3/whittaker-functionals.

API:

- `normalizedNewvector_fixed`: vnew is fixed by K₁(p^{c(π)}).
- `normalizedNewvector_eval`: λ(vnew)=1.
- `normalizedNewvector_unique`: Every fixed v with λ(v)=1 equals vnew.
- `normalizedNewvector_twist`: An unramified twist identifies Wnew with χ(det g)Wnew(g).

Tests:

- For V=ℂ and λ(z)=2z the normalized vector is 1/2.
- Replacing λ by aλ with a≠0 changes vnew to a⁻¹vnew.
- The zero functional admits no vector of value one; it fails the input hypothesis.

Uses: R16.2/casselman-newvector; Mathlib `Representation.invariants`; SR `SR.2.3/whittaker-functionals`.

Source: [jl70], §11 following Proposition 11.1.1, p. 183; normalize the spherical local function at e.

<a id="r16-2-spherical-whittaker-values"></a>

### spherical-whittaker-values: The spherical Whittaker values

For an unramified generic principal series with unitary-normalized Satake parameters α=χ₁(ϖ), β=χ₂(ϖ), define h₀=1, h₁=α+β and hₘ₊₂=(α+β)hₘ₊₁−αβhₘ. The normalized spherical Whittaker function has W(diag(ϖᵐ,1))=q^{-m/2}hₘ for m≥0 and zero for m<0. This polynomial recurrence includes α=β; the expression (α^{m+1}−β^{m+1})/(α−β) is used only when α≠β.

API:

- `sphericalValues_zero`: h₀(α,β)=1.
- `sphericalValues_recurrence`: hₘ₊₂=(α+β)hₘ₊₁−αβhₘ.
- `sphericalValues_swap`: hₘ(α,β)=hₘ(β,α).
- `sphericalValues_equal`: hₘ(α,α)=(m+1)αᵐ.

Tests:

- h₁=α+β.
- h₂=α²+αβ+β².
- h₂(1,1)=3, not an undefined quotient.

Uses: R16.2/normalized-newvector; SR `SR.4`; SR `SR.2.3/whittaker-functionals`.

Source: [jl70], §3 spherical functions and unramified zeta calculation.

<a id="r16-2-iwahori-oldforms"></a>

### iwahori-oldforms: The characteristic-zero Iwahori oldforms

Let π be complex, irreducible, smooth, admissible, infinite-dimensional and spherical over a characteristic-zero nonarchimedean local field F. Write K=GL₂(O), I=K₀(p). Then dim πᴷ=1 and dim πᴵ=2. With vol(I)=1, U=[I diag(ϖ,1) I] and spherical eigenvalue λ=√q(α+β), every nonzero spherical v is cyclic for U on πᴵ. Its polynomial is X²−λX+qαβ, including α=β.

**Fixed-space comparison.** The compact-open signatures supply the admissibility inputs. `localK0_invariants_eq_localK1` identifies the fixed submodules at every level when integral scalar units act trivially. The API decomposes every K₀ element as an integral scalar times a K₁ element, using the lower-right unit at positive level and scalar 1 at zero. In an irreducible spherical representation, these scalars fix a nonzero spherical vector and hence its GL₂(F)-span. If an integral scalar acts by a≠1 and K₁ has a nonzero fixed vector, K₀ has none; this tests the scalar-action hypothesis.

Choose residue representatives A⊂O; set gₐ=(ϖ a;0 1). Then U=∑ₐπ(gₐ), with |A|=q. Set s=diag(1,ϖ), c=ω(ϖ)=αβ. On πᴷ, the spherical double coset acts as T=U+π(s). From Tv=λv and π(ϖI₂)=c, the basis (v,π(s)v) gives Uv=λv−π(s)v and Uπ(s)v=qc v. Thus πᴵ=span(v,Uv), Uv is not proportional to v, and U²−λU+qc=0 on πᴵ. `iwahoriOldforms` uses these matrices and Mathlib invariant submodules.

Tests: For (2 1;−1 0), U−1 is nonzero and square-zero, testing repeated roots. The matrix (5 6;−1 0) satisfies X²−5X+6, and fails X²−5X+3. For unramified χdet on ℂ both invariant spaces are the whole line, of dimension one, even when χ≠1 (`iwahoriDeterminantCharacter`). Thus “not trivial” cannot replace infinite dimensionality.

Uses: R16.2/casselman-newvector; R16.2/spherical-whittaker-values; SR `SR.1`; SR `SR.4`; Mathlib `Representation.invariants`.

Source: [cg20], §1.3, pp. 805–806; [casselman73], Corollary to the Proof, p. 306.

<a id="r16-2-supercuspidal-kirillov"></a>

### supercuspidal-kirillov: The supercuspidal Kirillov comparison

For irreducible supercuspidal π with central character ω and nontrivial ψ, restricting the imported Whittaker function W to diag(x,1), x∈F×, identifies its Kirillov realization with C_c^∞(F×,ℂ). For b=(a u;0 d), the action is (π(b)f)(x)=ω(d)ψ(xu/d)f(xa/d). The Weyl action is the imported local functional equation; it is not a freely chosen transform. For the DLB variant, F=ℚp, ω=1 and π is defined over a finite extension L/ℚp. Put L∞=colim_n(L⊗_{ℚp}ℚp(μ_{pⁿ})) and Γ=Gal(ℚp(μ_{p∞})/ℚp), acting on the second factor. Give the smooth mirabolic realization on compactly supported locally constant functions φ:ℚp×→L∞ with φ(ax)=σ_a(φ(x)) for a∈ℤp×, where σ_a is the cyclotomic action. After scalar extension to L∞ this is the ordinary Kirillov model for a compatible p-power-root additive character. Coefficient descent is additional to complex multiplicity one; locally analytic Kirillov–Colmez theory belongs to R30.

Smooth characteristic-zero supercuspidal; additive-character and central-character choices visible.

Uses: R16.2/local-classification; SR `SR.2.3/whittaker-functionals`; AL `AL.0/local-schwartz-bruhat-space`; AL `AL.2`.

Source: [casselman73], p. 302, equation (1.2). [dlb17], §7.5, Remark 7.10, p. 39; §11.2, proof of Theorem 11.7, p. 62, for the L∞/Γ smooth comparison.

<a id="r16-2-henniart-unicity"></a>

### henniart-unicity: Henniart’s unicity of supercuspidal types

A supercuspidal inertial class s of GL₂(F) has a unique irreducible GL₂(O)-type σ, occurring once in every unramified twist π⊗χdet. If σ occurs in an irreducible admissible π′, then π′≅π⊗χdet for unramified χ. Import types/inertial equivalence from SR.3/ET.6; arbitrary nonminimal K-constituents need not be unique.

Characteristic-zero algebraically closed coefficients; nonarchimedean F, including dyadic fields.

Uses: R16.2/local-classification; SR `SR.3`; ET `ET.6`.

Source: [bm02], Appendix A.1.4–A.1.5(1), pp. 75–76; A.3.

<a id="r16-2-supercuspidal-projective"></a>

### supercuspidal-projective: Supercuspidals in a fixed central-character category

A supercuspidal complex representation of GL₂(F) with fixed smooth central character ω is projective in the abelian category of smooth representations on which the center acts by ω. The DLB application is F=ℚp, ω=1, and characteristic-zero L coefficients with the required scalar extension. The category fixes ω and has characteristic-zero coefficients.

On SR.0's fixed-ω category of complex smooth representations of G=GL₂(F), π is irreducible admissible and supercuspidal: every matrix coefficient with a functional in the smooth dual has compact support modulo the scalar centre. For any equivariant surjection q:σ→τ and intertwiner f:π→τ, construct an intertwiner h:π→σ with qh=f. The other representations need not be admissible or irreducible. In particular every surjection onto π splits. SR.3.2's supercuspidal decomposition and coefficient projector give the lift; fixing ω makes the characteristic-zero block semisimple by restricting unramified twists to those with trivial square on the centre. The L-coefficient comparison needs scalar descent. This imposes no normed or locally analytic topology.

Uses: R16.2/henniart-unicity; SmoothRepresentationsOfLocalGroups
`SR.0:abelian-category`, `SR.3a.1:compact-representations` and
`SR.3.2:cuspidal-splitting`. This target specializes their complex smooth
representation theory to the fixed-character GL₂ category.

Source: [dlb17], p. 64, footnote 52, for the fixed-character projectivity
application. [bz76], Theorem 3.21, pp. 34–35, for the coefficient
characterization; Theorem 2.44, p. 28, and Proposition 3.28, pp. 36–37,
for the decomposition used by the supercuspidal block argument.

<a id="r16-2-cdt-vexing-type"></a>

### cdt-vexing-type: The Conrad–Diamond–Taylor vexing type

Let x≠ℓ be a vexing prime: x≡−1 mod ℓ, residual local rank-two representation irreducible but its inertia restriction reducible; its conductor c_x=2n. From CDT’s regular character θ of the unramified quadratic extension with conductor xⁿ construct Θ(θ), an existing finite-group representation of GL₂(ℤ/xⁿℤ), and choose a stable O-lattice for a characteristic-zero coefficient field containing its values. The local selector σ_x is Θ(θ) restricted to the exact U_x/V_x used by CDT §5 (U₀(x)/U(xⁿ) in the vexing case), not an arbitrary type on that quotient. The larger GL₂ quotient representation Wσx in CG18 restricts to this selector.

x and ℓ distinct primes; regular θ, θ≠θ^Frob; coefficient field contains values; choose an invariant lattice.

API:

- `cdtVexingType_restrict`: The selector is the restriction of Θ(θ) to U₀(x)/U(xⁿ).
- `cdtVexingType_lattice`: The chosen O-lattice is stable and scalar extension recovers Θ(θ).
- `cdtVexingType_unramified`: An unramified twist leaves the compact type and its selector unchanged.

Tests:

- The lattice tensored with the coefficient field is isomorphic to Θ(θ).
- A local representation with inertial characters not θ,θ^Frob has no occurrence of the full Θ(θ) type.
- π and π⊗ξdet for unramified ξ have equal Θ(θ) occurrence multiplicity.

Uses: R16.2/henniart-unicity; ET `ET.6`; R01 `R01.1/compact-subgroups-stabilise-lattices`.

Source: [cg18], §3.9.2 construction Wσx; CDT §5.1 p. 18.

<a id="r16-2-iwahori-center"></a>

### iwahori-center: The GL₂ Iwahori center

For the upper Iwahori I and a characteristic-zero coefficient ring in which q and q+1 are invertible, normalize vol(I)=1 and eK=1_K/vol(K). Put U₀=1_{I diag(ϖ,ϖ) I} and U₁=1_{I diag(ϖ,1) I}. The center of H(G,I) is the Laurent polynomial algebra in U₀^{±1} and z₁=U₁+qU₀U₁⁻¹. Multiplication by eK identifies it with the spherical algebra H(G,K), sending U₀ to T₀ and z₁ to T₁, with normalized spherical identity eK. Coefficient extensions used in BCGP invert p and the required idempotent denominators. The rank-independent Bernstein center and its parahoric comparison are imported from SR.4; the target here is the rank-two calculation.

q is a unit; eK requires the I-index q+1 to be a unit; U₁ has its usual invertibility in the affine Hecke algebra.

Uses: R16.1/k0; SR `SR.1`; SR `SR.4`.

Source: [bcgp21], Lemma 2.4.15, pp. 178–179; HKP §4.6 (4.6.1); [hkp10], §2.3 Lemma 2.3.1; §4.6 equation (4.6.1).

<a id="r16-2-archimedean-classification"></a>

### archimedean-classification: The explicit archimedean GL₂ cases

Specialize AF.1's LLC and Casselman–Wallach globalizations. Over ℝ write χᵢ=sgn^{εᵢ}|·|^{sᵢ}, εᵢ∈{0,1}, and order Re(s₁−s₂)≥0. Normalized induction is reducible exactly when r=s₁−s₂ is a nonzero integer with r−(ε₁−ε₂) odd. For r>0 its submodule is D_{r+1}⊗|det|^{(s₁+s₂)/2} and its Langlands quotient has dimension r; reversing the order reverses the exact sequence. At r=0 with opposite parities, induction is the irreducible full-O(2) weight-one limit, although its positive-determinant restriction splits. The raising/lowering coefficients r+1±n locate the breaks; reflection exchanges the two tails. For m≥1, Ind_{ℂ×}^{Wℝ}((z/|z|)^m|z|^{2t}) gives D_{m+1}⊗|det|^t. For m=0 the parameter splits.

Over ℂ order the real norm exponents likewise. Induction is reducible exactly when χ₁χ₂⁻¹=z^p z̄^q with p,q positive integers, or both negative integers. In the positive case the quotient has dimension pq; the infinite-dimensional submodule has SU(2)-types n≥p+q, n≡p+q mod2. Both constituents are Langlands quotients for suitable character pairs. There is no discrete series modulo centre. Import AF.1's unitary-dual classification separately; ordering alone does not imply unitarity.

Tests: Real ratio |·| gives the one-dimensional quotient and D₂ submodule; ratio sgn gives the irreducible weight-one limit; complex ratio z z̄ gives a one-dimensional quotient, whereas z z̄⁻¹ is irreducible.

Uses: AF.1/weil-group-real; AF.1/gl2-real-discrete-series; AF.1/normalized-real-parabolic-induction; AF.1/langlands-classification; AF.1/archimedean-llc-gln; AF.1/vogan-generic-unitary-dual; AF.1/casselman-wallach-globalization.

Source: [jl70-ubc], §5 Lemmas 5.6–10 and Theorem 5.11, pp.83–87; §6 Lemma 6.1 and Theorem 6.2, pp.111–113 (UBC retypeset pagination).

## R16.3. Local parameters and factors

<a id="r16-3-principal-series-parameter"></a>

### principal-series-parameter: Principal-series parameters and factors

For F/ℚp finite, with Art_F:F×≃W_Fᵃᵇ the topological Weil-group reciprocity isomorphism normalized by Art_F(ϖ)=Φ geometric and ν(ϖ)=q⁻¹, rec(I(χ₁,χ₂))=(χ₁∘Art_F⁻¹)⊕(χ₂∘Art_F⁻¹), N=0, for an irreducible normalized principal series. Thus det rec=ωπ∘Art_F⁻¹ and L(s,π)=L(s,χ₁)L(s,χ₂). A ramified character contributes 1. At the reducible ratio ν^{±1}, this is the parameter of the one-dimensional Langlands quotient; the generic Steinberg constituent instead has nonzero N as below. The statement uses Frobenius-semisimple Weil–Deligne parameters, not semisimplification that discards N.

Characteristic-zero nonarchimedean F; χ₁χ₂⁻¹≠ν^{±1} in the principal-series assertion. Art_F⁻¹ is evaluated on the topological Weil abelianization supplied by CFT Layer9, not on the absolute Galois abelianization of Layer7.

Uses: R16.2/local-classification; ET `ET.6`; R01 `R01.2/weil-deligne-representation`; ClassFieldTheory Layer 7; AL `AL.1`; AL `AL.2`; ClassFieldTheory Layer 9.

Source: [nt26], §1.2 p. 8, ArtK and recK.

<a id="r16-3-steinberg-monodromy"></a>

### steinberg-monodromy: Steinberg monodromy and its factors

For π=St⊗χdet, choose a basis e₁,e₂ of the existing rank-two parameter with Ne₂=e₁, Ne₁=0 and r(Φ)=diag(αq⁻¹ᐟ²,αq¹ᐟ²), α=χ(ϖ). For general w the diagonal characters are χ_Wν_W^{1/2},χ_Wν_W^{−1/2}, so r(w)Nr(w)⁻¹=ν_W(w)N. This gives det r=χ_W², L(s,π)=L(s+1/2,χ), and a(π)=1 when χ is unramified, 2a(χ) otherwise. In particular the invariant kernel of N, not all inertia invariants of r, defines L. An unramified twist preserves N and the conductor.

Geometric Frobenius convention; choose the positive real square root of q for unitary normalization.

Uses: R16.3/principal-series-parameter; R16.2/casselman-newvector; ET `ET.6`; R01 `R01.2/weil-deligne-representation`; R01 `R01.3/conductor-of-a-weil-deligne-representation`; AL `AL.2`.

Source: [casselman73], p. 307 epsilon remark and special-representation calculation.

<a id="r16-3-supercuspidal-parameter"></a>

### supercuspidal-parameter: Supercuspidal parameters including wild cases

rec identifies supercuspidal GL₂(F) representations with irreducible two-dimensional Weil representations, with N=0; determinants, character twists, conductors and L/epsilon factors agree with the existing parameter conventions. Such a parameter has no inertia-fixed vector, hence its standard L-factor is 1. A quadratic induction gives a dihedral example when θ≠θ^σ, but this is not an exhaustive description at dyadic places: primitive wild parameters remain in the ET.6 carrier and use the full Swan conductor. R30’s p-adic Banach correspondence is a separate consumer.

Uses: R16.2/supercuspidal-kirillov; ET `ET.6`; R01 `R01.2/weil-deligne-representation`; R01 `R01.3/conductor-of-a-weil-deligne-representation`; AL `AL.2`.

Source: [nt26], §2 after Definition 2.4, p. 11.

The ET.6 correspondence must include the fully local dyadic existence and bijectivity arguments of [bh06], Theorem 50.3 pp.309–313 and Theorem 52.1 pp.316–323. Minimal primitive parameters become imprimitive over a tame cubic extension; descend their stratum and type character, compare cubed ε-factors, and remove the cube ambiguity using the independently computed 2-power root-of-unity bound. For octahedral bijectivity, compare type-character depth and low-level twisted ε-ratios over the normal closure, then use the norm map on the relevant unit graded piece. The finite orbit counts give surjectivity from injectivity. This imports local LLC; compatibility of tame lifting with Weil restriction is a separate statement ([bh06], §52.9 p.324).

**Primitive dyadic test.** Take F=ℚ₂, the chain order A=((ℤ₂,ℤ₂),(2ℤ₂,ℤ₂)), its radical P, and α=((0,−1/2),(1,0)). Then α²=−1/2 and (A,1,α) is a ramified simple stratum. Choose an additive character ψ₁ nontrivial on ℤ₂ and trivial on 2ℤ₂. On U¹_A=1+P put ψ_α(1+x)=ψ₁(tr(αx)). Set E=F[α] and J=E×U¹_A. Extend ψ_α|U¹_E to a finite-order character φ of E× and define Λ(eu)=φ(e)ψ_α(u); the intertwining group is J, so π=c-Ind_J^{GL₂(F)}Λ is irreducible supercuspidal. This uses SR.2's compact induction, not finite-group induction. Its normalized level is 1/2. The explicit local-constant computation gives exponent 1 for ψ₁; replacing ψ₁(x) by ψ₁(2x), which has the roadmap's conductor ℤ₂, adds 2. Thus a(π)=3, a(rec π)=3, N=0 and Swan(rec π)=3−2=1. All ramification breaks of this irreducible parameter coincide, so its positive upper break is 1/2.

Every ramified quadratic extension of ℚ₂ has different exponent at least 2. The ordinary-case criterion would require 1≥3d, where d is that exponent minus 1; this is impossible. Hence rec π is primitive, despite the quadratic field E used to construct its compact type. The type field is not a field inducing its Weil parameter. Transfer π to the local quaternion division algebra by ET.6. A normalized supercuspidal matrix coefficient and its ET.1 matching test have trace 1 on π and its quaternionic partner, with the elliptic orbital sign −1. Test a=3 and Swan=1; test L(s,π)=1 with N=0; test failure of every quadratic-induction parameter description. These tests reject both the tame-dihedral shortcut and replacing wild conductor by Steinberg monodromy.

**Proof inputs.** [bh06], §15.1 intertwining theorem p.105; §15.3 p.106; §15.6 Proposition 1 pp.108–109; §25.2 pp.157–159; §24.3 pp.149–150; §44.3 pp.269–270 and §44.4–6 pp.270–273. The quadratic different bound is LocalFieldsRamification Layer 1; Artin/Swan and equal-break statements are R01.3. The full LLC and test transfer remain ET.6/ET.1 imports.

<a id="r16-3-tate-unitary-normalization"></a>

### tate-unitary-normalization: The Tate and unitary normalization bridge

For rank two recᵀ_F(π)=rec_F(π⊗ν^{-1/2})=rec_F(π)⊗ν_W^{-1/2}. This multiplies geometric Frobenius by √q and determinant by ν_W^{-1}, preserves N and conductor, and shifts L(s,recᵀπ)=L(s−1/2,rec π), likewise epsilon with fixed ψ/measures. Thus det recᵀπ=ωπν_W^{-1}. Arithmetic Frobenius inversion affects the whole WD datum, including its N relation, and differs from this half-twist.

Uses: R16.3/principal-series-parameter; R16.3/steinberg-monodromy; R16.3/supercuspidal-parameter; ET `ET.6`; R01 `R01.2/weil-deligne-representation`; AL `AL.2`.

Source: [nt26], §1.2 p. 8, normalization identity.

<a id="r16-3-conductor-epsilon-comparison"></a>

### conductor-epsilon-comparison: Conductor, twists and additive-character change

For every generic irreducible π, c(π)=a(rec π), with the same value for recᵀ. With ψ of conductor O and self-dual additive measure, ε(s,π,ψ)=ε(1/2,π,ψ)q^{-c(π)(s−1/2)}. For ψ_a(x)=ψ(ax), ε(s,π,ψ_a)=ωπ(a)|a|^{2s−1}ε(s,π,ψ); the measure is changed to the corresponding self-dual one. An unramified twist by ν^t replaces s by s+t and leaves c unchanged. For a ramified χ, one uses the full tensor-parameter conductor; c(π⊗χdet) is not generally c(π)+2a(χ).

Use normalized AL.2 epsilon factors, not an unnormalized Fourier measure; π generic and characteristic zero.

Uses: R16.2/newvector-conductor; R16.3/steinberg-monodromy; R16.3/supercuspidal-parameter; R16.3/tate-unitary-normalization; R01 `R01.3/conductor-of-a-weil-deligne-representation`; AL `AL.1`; AL `AL.2`.

Source: [casselman73], p. 307 remark following the Corollary to the Proof.

<a id="r16-3-archimedean-factor-comparison"></a>

### archimedean-factor-comparison: The archimedean GL₂ factors

Use Γℝ(s)=π^{−s/2}Γ(s/2), Γℂ(s)=2(2π)^{−s}Γ(s). For a real character sign^ε|·|^u the factor is Γℝ(s+u+ε). For Ind_{ℂ×}^{Wℝ}((z/|z|)^m|z|^{2t}), m≥1, it is Γℂ(s+t+m/2); thus L(s,D_k)=Γℂ(s+(k−1)/2). At m=0 its split parameter gives Γℝ(s+t)Γℝ(s+t+1)=Γℂ(s+t). A complex character (z/|z|)^m|z|^{2t} gives Γℂ(s+t+|m|/2); rank-two factors multiply. For ψℝ(x)=exp(2πix), real-character epsilon is i^ε and induced epsilon is i^{m+1}. For ψℂ=ψℝ∘Trℂ/ℝ, complex angular weight m gives i^{|m|}, by AL.2/archimedean-standard-epsilon. Norm twists leave these constants unchanged. Tests: D₂ has epsilon −1; angular weights ±1 both give i; weight zero gives 1, including the complex norm twist.

Archimedean local reciprocity, absolute value |z|ℂ=|z|², gamma and additive-character conventions fixed.

Uses: R16.2/archimedean-classification; AF `AF.1/archimedean-llc-gln`; AL `AL.1`; AL `AL.2`.

Source: [jl70], §5 pp. 96–97, explicit character L/epsilon formulas and induced-real factor.

<a id="r16-3-tamely-dihedral"></a>

### tamely-dihedral: Tamely dihedral representations of prime order

For odd prime ℓ with q≡−1 mod ℓ, an irreducible admissible π is tamely dihedral of order ℓ precisely when rec π=(Ind_{W_{F′}}^{W_F}θ,0), where F′/F is unramified quadratic and θ|I has exact order ℓ. Use the imported induced Weil representation and class of π; no second automorphic or WD carrier is defined. Induction is from W_{F′} to W_F. Since ℓ is prime to the residue characteristic, the inertia character is tame.

ℓ odd prime, q residue cardinality and q≡−1 mod ℓ; θ continuous with open kernel on inertia.

API:

- `tamelyDihedral_parameter`: Membership is equivalent to the stated induced parameter with exact inertia order ℓ and N=0.
- `tamelyDihedral_unramified_twist`: An unramified determinant twist preserves tamely-dihedral order ℓ.
- `tamelyDihedral_conjugate`: Replacing θ by θ^σ gives the same induced parameter.

Tests:

- At q=2, ℓ=3, an inertia character of order three satisfies θ^q=θ^{-1}≠θ.
- ℓ=2 fails oddness and θ^{-1}=θ for order-two inertia, so this irreducibility argument fails.
- An unramified θ has inertia order one and is not tamely dihedral of order ℓ>2.

Uses: R16.3/supercuspidal-parameter; ET `ET.6`; R01 `R01.2/weil-deligne-representation`; Tau Ceti `TauCeti.simple_indFDRep_ofLinearCharacter_iff`.

Source: [nt26], Definition 2.4 and following paragraph, p. 11.

<a id="r16-3-tamely-dihedral-supercuspidal"></a>

### tamely-dihedral-supercuspidal: The tamely dihedral supercuspidality consequence

Every tamely dihedral π of odd prime order ℓ is supercuspidal. Its parameter is irreducible, has N=0 and Swan conductor zero; since inertia has no fixed vector, a(rec π)=2 and L(s,π)=1. The exact-order argument works also at residue characteristic two, because ℓ is odd and prime to q.

The complete hypotheses of tamelyDihedral, including q≡−1 mod ℓ.

Uses: R16.3/tamely-dihedral; R16.3/supercuspidal-parameter; R01 `R01.3/conductor-of-a-weil-deligne-representation`; ET `ET.6`.

Source: [nt26], Paragraph immediately after Definition 2.4.

<a id="r16-3-cdt-inertia-multiplicity"></a>

### cdt-inertia-multiplicity: The CDT inertial comparison and multiplicity one

For CDT’s regular θ of conductor xⁿ, write Θ(θ) for its full GL₂(ℤ/xⁿℤ) type. For infinite-dimensional irreducible admissible Π of GL₂(ℚx), Hom_K(Θ(θ),Π^{U(xⁿ)})≠0 iff rec Π|I≅θ∘η_{x²} ⊕ θ∘Frob∘η_{x²} in CDT’s reciprocity convention. In that case Π^{U(xⁿ)}≅Θ(θ) and the type multiplicity is one. Translate the Artin convention to R16.3. This comparison concerns the full K-type; its U₀(x) restriction used as a vexing selector can identify more than one finite-character twist. The special case in CDT’s surrounding discussion is translated with N retained, not as an N=0 parameter.

x≠ℓ; regular θ and coefficient field containing its values; principal congruence U(xⁿ), full compact type. Use CFT Layer9 Weil reciprocity for ℚx and its unramified quadratic extension; Layer7 supplies the compatible absolute/finite-quotient map, not an inverse on all of G_Fᵃᵇ.

Uses: R16.2/cdt-vexing-type; R16.2/henniart-unicity; R16.3/supercuspidal-parameter; ET `ET.6`; R01 `R01.2/weil-deligne-representation`; ClassFieldTheory Layer 7; ClassFieldTheory Layer 9.

Source: [cdt99], Lemma 4.2.4(3), pp. 17–18.

## R16.4. Global cuspidal representations

<a id="r16-4-cuspidal-tensor-factorization"></a>

### cuspidal-tensor-factorization: The cuspidal restricted tensor factorization

For unitary central character ω trivial on F×, the smooth K∞-finite cuspidal spectrum in AA.2’s L² space is AS.4’s algebraic Hilbert-direct-sum decomposition with finite multiplicities. Every irreducible constituent has the AF.2 restricted tensor factorization ⊗′vπv, with spherical distinguished vectors at almost all finite v. Identify this algebraic factorization with the corresponding smooth vectors of its Hilbert completion and with the Whittaker tensor model. Multiplicity one is proved below; it is not assumed in this comparison. Nonunitary cuspidal representations are handled after an specified norm twist.

F number field; central character unitary for L²; admissible local factors and AF.2 distinguished-vector data.

Uses: R16.1/finite-level-comparison; R16.2/normalized-newvector; AF `AF.2/restricted-tensor-product`; AS `AS.4`; AA `AA.2/central-character-l2`; AL `AL.3/global-whittaker-factorization`.

Source: [jl70], §11 product formula (11.1.2), p. 183.

<a id="r16-4-global-whittaker-expansion"></a>

### global-whittaker-expansion: The global GL₂ Whittaker expansion

Fix nontrivial ψ:F\𝔸→ℂ× and additive Haar mass vol(F\𝔸)=1. For a smooth K∞-finite cuspidal φ, Wφ(g)=∫_{F\𝔸}φ(n(x)g)ψ(−x)dx and φ(g)=Σ_{a∈F×}Wφ(diag(a,1)g), with the convergence appropriate to smooth cusp forms, locally uniform after the stated differentiability/growth estimates. The coefficient map is injective and equivariant. Specialize AL.3’s general GLn Fourier–Whittaker expansion; the GL₂ unipotent has a single additive coordinate. This declaration is in R16.4, upstream of both multiplicity and the integral comparison.

Cuspidality supplies zero constant term; smooth automorphic form with imported growth estimates; global ψ and compatible self-dual local measures.

Uses: R16.4/cuspidal-tensor-factorization; AL `AL.0/adelic-schwartz-bruhat-space`; AL `AL.3/gln-fourier-expansion`; SR `SR.2.3/whittaker-functionals`.

Source: [jl70], Proposition 11.1.1 proof, pp. 182–183.

<a id="r16-4-global-multiplicity-one"></a>

### global-multiplicity-one: GL₂ global multiplicity one

Every irreducible cuspidal automorphic GL₂(𝔸F) representation occurs with multiplicity one in the smooth cuspidal spectrum with its central character. The Whittaker coefficient identifies its realization with the restricted tensor product of the local Whittaker models, uniquely once ψ and almost-all spherical normalizations are fixed. Equivalently, two equivariant embeddings of the same irreducible representation into the cusp space are scalar multiples.

Number field F; characteristic-zero automorphic forms; unitary twist when working inside L².

Uses: R16.4/global-whittaker-expansion; R16.4/cuspidal-tensor-factorization; SR `SR.2.3/whittaker-functionals`; AS `AS.4`; AL `AL.3/global-multiplicity-one`.

Source: [jl70], Proposition 11.1.1, p. 183; [cogdell-fields], Lecture 4 §3, Theorem 4.2 and proof, pp.33–34.

<a id="r16-4-strong-multiplicity-one"></a>

### strong-multiplicity-one: GL₂ strong multiplicity one

Let π,π′ be cuspidal automorphic representations of GL₂(𝔸F). If there is a finite set S of finite places containing their ramification and πv≅π′v for every finite v outside S, then π≅π′ globally, including every v in S and every infinite place. Equality at a density-one subset is not substituted for this cofinite condition. At an unramified place, equality means the unordered Satake pair, equivalently both standard Hecke trace and determinant data, not a single incomplete eigenvalue without central character.

Uses: R16.4/global-multiplicity-one; AL `AL.3/strong-multiplicity-one`; Tau Ceti `HeckeRing.GL2.Newform.eq_of_forall_notMem_eigenvalue_eq`.

Source: [cogdell-fields], Theorem9.3 and proof, pp.74–75; [casselman73], §2 Theorem 2 and proof, pp. 307–308.

<a id="r16-4-cohomological-rationality"></a>

### cohomological-rationality: Cohomological rationality and coefficient fields

For regular algebraic cuspidal GL₂ representations, import AF.4’s rationality field Q(π), the fixed field of automorphisms preserving the finite-part isomorphism class, and Clozel’s finite-part Q(π)-model. Specialize its semilinear Galois conjugation to the GL₂ Hecke operators and algebraic infinitesimal character. For a holomorphic newform f of weight k≥2 over ℚ, make this comparison for π_alg=π_f⊗|det|^{−(k−2)/2}, where π_f is unitary: the unnormalized spherical T₁ eigenvalue is a_p and T₀ eigenvalue is χ(p)p^{k−2}. Then Q(π_alg) is the field generated by the normalized newform coefficients and compatible nebentypus values. A claim about the field generated by raw unitary Satake roots is not this rationality theorem. Neither periods nor an integral lattice are canonical. Étale/cohomological rationality and Galois realization required by R19 belong to that geometric owner.

Regular algebraic cuspidal π; distinguish field of rationality from a field of definition before invoking AF.4. Use the algebraic determinant twist just displayed in the holomorphic comparison; regular algebraicity is not inferred from arbitrary unitary normalization.

Uses: R16.4/strong-multiplicity-one; AF `AF.4/rationality-field`; AF `AF.4/clozel-rationality`; ModularForms Layer 8; ModularForms Layer 8G.

Source: [nt26], §1.2 pp. 8–9, regular algebraic weights and conjugation.

<a id="r16-4-non-cm-self-twists"></a>

### non-cm-self-twists: The non-CM self-twist condition

On the existing cuspidal GL₂ isomorphism classes, non-CM means that π⊗χdet≅π implies χ=1 for every Hecke character χ of F×\𝔸×. This is the self-twist formulation used by NT; it defines a subset of the AF.2 carrier rather than a second automorphic representation. Central characters imply any self-twist has χ²=1. Any specified nontrivial quadratic stabilizer excludes the class. R17.4’s automorphic-induction comparison consumes this self-twist definition; no automorphic-induction theorem is required to define it.

Cuspidal GL₂ class and the imported determinant-twist action; all Hecke characters, not only unramified ones.

API:

- `nonCM_iff`: π is non-CM iff every character fixing its isomorphism class is trivial.
- `nonCM_twist`: Twisting π by any Hecke character preserves non-CM.
- `nonCM_self_twist_square`: Every self-twist χ of a rank-two π satisfies χ²=1 by comparison of central characters.

Tests:

- For the multiplication action of a group on itself every stabilizer is trivial.
- The character χ=1 does not violate non-CM.
- A class fixed by a specified nonidentity quadratic character is not non-CM.

Uses: R16.4/cuspidal-tensor-factorization; AF `AF.2`; AL `AL.3`.

Source: [nt26], Lemma 2.1 introductory hypothesis, p. 9.

## R16.5. Whittaker integrals and analytic recognition

<a id="r16-5-whittaker-integral-comparison"></a>

### whittaker-integral-comparison: The GL₂ Whittaker Mellin comparison

For factorizable cusp φ and Wφ=⊗vWv, the integral ∫_{F×\𝔸×}φ(diag(a,1))χ(a)|a|^{s−1/2}d×a unfolds to ∫_{𝔸×}Wφ(diag(a,1))χ(a)|a|^{s−1/2}d×a and factors into the AL.2 local Whittaker zeta integrals in a common right half-plane. At unramified places with normalized spherical Wv the factor is L(s,πv⊗χv); at ramified places a imported test vector realizes the L-factor, rather than every newvector doing so for every ramified twist. Compare this integral with AL.2’s Godement–Jacquet standard factor and AL.3’s GL₂×GL₁ Rankin–Selberg integral, using their shared LLC normalization.

Cuspidal φ, Hecke character χ; factorizable measures with standard unit volume at almost all finite places; absolute convergence first.

Uses: R16.4/global-whittaker-expansion; R16.2/spherical-whittaker-values; R16.2/normalized-newvector; AL `AL.0/adelic-schwartz-bruhat-space`; AL `AL.1`; AL `AL.2`; AL `AL.3`.

Source: [jl70], Theorem11.1 p.180; formula (11.1.2) and its Euler product, pp.183–184; Lemma11.1.3 p.184.

<a id="r16-5-full-gl2-converse"></a>

### full-gl2-converse: The GL₂ converse theorem with all twists

Let Π=⊗′vΠv be an irreducible admissible generic GL₂(𝔸F) tensor, with central character trivial on F×, spherical almost everywhere and the JL uniform exponent bound at the unramified principal-series places so its standard and dual Euler products converge absolutely in a right half-plane. At infinity use genuine irreducible admissible Harish–Chandra modules and their Casselman–Wallach globalizations. Suppose for EVERY Hecke quasicharacter χ, the completed L(s,Π⊗χdet) and L(s,Π̃⊗χ⁻¹det) extend to entire functions, are bounded in every vertical strip outside the standard excluded neighborhoods (here there are no poles), and satisfy L(s,Π⊗χ)=ε(s,Π⊗χ,ψ)L(1−s,Π̃⊗χ⁻¹). Then Π is cuspidal automorphic. Finite-order, unramified-only or one fixed-conductor twists are not substituted for this family. One-dimensional local constituents are excluded by genericity/infinite-dimensionality.

Number field F; uniform bound |χᵢ,v(ϖv)| between qv^{−r} and qv^r for a common r at principal-series unramified places; all local constituents infinite-dimensional/generic; full archimedean and analytic conditions above.

Uses: R16.5/whittaker-integral-comparison; R16.2/archimedean-classification; AL `AL.1`; AL `AL.2`; AL `AL.3`; AF `AF.1`; AF `AF.2`; AL `AL.3/gln-converse-full-rank`.

Source: [jl70], Theorem 11.3, p. 186; [converse], §2 pp. 5–6; §3 Theorem 3.1, p. 6, n=2.

<a id="r16-5-classical-l-function-comparison"></a>

### classical-l-function-comparison: Classical and unitary L-function normalization

For a normalized primitive holomorphic newform f of weight k≥2, let πf be the AF.5 unitary adelization. With Lf(s)=Σ_{n≥1}a_n n^{−s}, L(s,πf)=Lf(s+(k−1)/2), including the bad-prime factors supplied by upstream newform theory. Its infinite factor is Γℂ(s+(k−1)/2). The factor 2 in Γℂ distinguishes this completion from the common classical (2π)^{−s}Γ(s)Lf(s); record the scalar and the conductor power rather than asserting equality of differently normalized completed functions. At width one the pinned CuspForm L-series theorem supplies the convergent-domain Mellin comparison; the global continuation is imported.

f in the existing Γ₁(N) normalized newform carrier, nebentypus compatible with weight; AF.5 unitary normalization.

Uses: R16.5/whittaker-integral-comparison; R16.3/archimedean-factor-comparison; AF `AF.5/gl2-classical-to-adelic`; AF `AF.5/gl2-dictionary`; ModularForms Layer 4; Tau Ceti `CuspForm.LSeries_qExpansion_coeff_eq`; ModularForms Layer 7.

Source: [jl70], §11 classical specialization of standard factors.

<a id="r16-5-global-epsilon-normalization"></a>

### global-epsilon-normalization: Global functional equation and conductor normalization

For the standard global additive character obtained from the trace F/ℚ and compatible self-dual local measures, put A(π)=|Disc(F)|²·N(𝔣π) in rank two. In the unitary variable, Λ(s,π)=A(π)^{s/2}L_f(s,π)L_∞(s,π). Its functional equation is Λ(s,π)=ε(1/2,π)Λ(1−s,π̃), with ε(1/2,π) the product of the local root numbers in AL.1/AL.3’s convention. For a weight-k form over ℚ and t=s+(k−1)/2, the exchange is t↔k−t. Changing local ψ_v by a global a∈F× multiplies each local epsilon by ω_v(a)|a|_v^{2s−1}; their product is one by central-character automorphy and the product formula. The discriminant square is the rank-two conductor contribution; for F=ℚ it is one.

Use AL.3 global completion, the trace-normalized global ψ and self-dual measures; finite conductor from conductorEpsilon.

Uses: R16.3/conductor-epsilon-comparison; R16.5/classical-l-function-comparison; AL `AL.1`; AL `AL.3`.

Source: [jl70], Theorem 11.1, p. 180.

## R16.6. Classical and Hilbert weights

<a id="r16-6-primitive-classical-bijection"></a>

### primitive-classical-bijection: Primitive newforms and holomorphic cuspidal classes

For k≥2 and χ(−1)=(−1)^k, identify normalized primitive Γ₁(N) newforms with cusp GL₂(𝔸_ℚ) classes of conductor N, centre from χ via AF.5, and unitary infinite component D_k. Use the finite newvector tensor and holomorphic lowest-weight vector in the positive-determinant piece; full O(2) still has both signs. Set the first Fourier coefficient to one. ModularForms Layer4 supplies all bad-prime eigenproperties; pinned `Newform` alone does not store them.

N>0, k≥2; primitive at exact conductor, existing newspace and AF.5 dictionary; chosen additive character for the vector comparison.

API:

- `primitiveBijection_conductor`: The product of the local conductor ideals is exactly N.
- `primitiveBijection_weight_character`: π∞=D_k and the central character is the AF.5 character attached to χ.
- `primitiveBijection_hecke`: For p∤N, α_p+β_p=a_p p^{−(k−1)/2} and α_pβ_p=χ(p).
- `primitiveBijection_normalized`: The recovered holomorphic newform has first q-coefficient one.
- `primitiveBijection_inverse`: The two maps are inverse on primitive forms and compatible automorphic classes.

Tests:

- At k=2 the infinite component is D₂ and the good trace is a_p/√p.
- A primitive form of level M properly dividing N is not primitive of conductor N after the oldform inclusion.
- For a normalized eigenform with a₁=1, multiplying by a scalar c≠1 changes a₁ to c and fails normalization. Every nonzero c yields the same primitive class after renormalization; c=0 is excluded from the eigenform carrier.

Uses: R16.2/casselman-newvector; R16.2/normalized-newvector; R16.2/archimedean-classification; R16.4/global-multiplicity-one; R16.4/strong-multiplicity-one; AF `AF.5/gl2-classical-to-adelic`; AF `AF.5/gl2-dictionary`; ModularForms Layer 4; Tau Ceti `HeckeRing.GL2.Newform`; Tau Ceti `HeckeRing.GL2.Newform.qExpansion_coeff_one`.

Source: [jl70], §11 holomorphic specialization and §5 real lowest-weight modules.

<a id="r16-6-classical-hecke-and-level"></a>

### classical-hecke-and-level: The complete level and Hecke dictionary

For primitiveBijection, at p∤N the unitary Satake polynomial is X²−a_p p^{−(k−1)/2}X+χ(p), while the arithmetic Hecke polynomial is X²−a_pX+χ(p)p^{k−1}. The primitive level is ∏p p^{c(πp)}. At a ramified p the local standard factor has degree zero, one or two according to (ker N)^I in rec πp, and its coefficients match the upstream primitive U_p factor after the same variable shift; do not impose a degree-two good-prime polynomial there. The finite-unit central character is χ^{-1} in the AF.5 right-equivariance convention, whereas its value on a good local uniformizer is χ(p) after global rational invariance.

Write n=v_p(N) and c=v_p(cond χ). ModularForms Layer 4 gives a_p≠0 precisely when n=max(1,c). For n=c≥1, the local class is principal series with one unramified character α and a_p=p^((k−1)/2)α(ϖ); for n=1,c=0 it is an unramified Steinberg twist µ, with a_p=p^((k−2)/2)µ(ϖ) and a_p²=χ^(p)(p)p^(k−2), where χ^(p) is the character away from p. In all other ramified cases L_p=1 and a_p=0. Thus the classical ramified factor is (1−a_pp^(−t))⁻¹ in the first two cases, with t=s+(k−1)/2. Test the one-ramified-character case, the Steinberg square relation, and a supercuspidal with a_p=0. These specialize the existing bad-prime theorem rather than define new Hecke operators.

Uses: R16.6/primitive-classical-bijection; R16.3/principal-series-parameter; R16.3/steinberg-monodromy; R16.3/supercuspidal-parameter; R16.5/classical-l-function-comparison; ModularForms Layer 4; AF `AF.5/gl2-classical-to-adelic`.

Source: [casselman73], §3 start, p. 308; §1 local conductor theorem.

<a id="r16-6-hilbert-algebraic-weights"></a>

### hilbert-algebraic-weights: Hilbert cohomological algebraic weights

For totally real F, embeddings Σ=Hom(F,ℝ), integers k_τ≥2 and m_τ with k_τ+2m_τ=w independent of τ, define the local algebraic representation V_τ=Sym^{k_τ−2}(standard₂)⊗det^{m_τ}, using TauCeti.symPowerRep and the existing determinant character, and V=⊗_{τ∈Σ}V_τ on (Res_{F/ℚ}GL₂)_ℂ. Its scalar action at τ is z^{k_τ−2+2m_τ}=z^{w−2}; its dimension is ∏τ(k_τ−1). The dual V∨ is used when the cohomological/local-system convention requires it; the choice is stated in the AF.4 comparison rather than silently interchanged. Parallel parity of k_τ follows from the existence of the integer m_τ.

API:

- `hilbertWeightRepresentation_scalar`: A scalar at τ acts by z^{k_τ−2+2m_τ}; for cohomological weight this is z^{w−2}.
- `hilbertWeightRepresentation_dimension`: dim V=∏τ(k_τ−1).
- `hilbertWeightRepresentation_dual`: Dualizing inverts the scalar central character and agrees with the AF.4 local-system convention.
- `hilbertWeightRepresentation_base_change`: Extension of characteristic-zero coefficients commutes with the tensor construction.

Tests:

- For one embedding, k=2,m=0 gives the trivial one-dimensional representation.
- For one embedding, k=3,m=1 gives standard₂⊗det, dimension two and scalar exponent three.
- Weights (2,3) cannot satisfy k_τ+2m_τ=w for integer m_τ and one common w.

Uses: Tau Ceti `TauCeti.symPowerRep`; Mathlib `Matrix.GeneralLinearGroup.det`; Mathlib `Representation`; AF `AF.4`; AF `AF.1`.

Source: [nt26], §1.2 regular algebraic highest-weight convention, p. 8.

<a id="r16-6-weight-k-parameter-conversion"></a>

### weight-k-parameter-conversion: The weight-k arithmetic parameter conversion

At p∤N set (A_p,B_p)=p^((k−1)/2)(α_p,β_p); their sum is a_p and product χ(p)p^(k−1). The geometric-Artin Hecke parameter is rec(π_p)⊗ν_W^(−(k−1)/2)=recᵀ(π_p)⊗ν_W^(−(k−2)/2). The classical arithmetic attachment has the inverse pair at geometric Frobenius; its dual has (A_p,B_p) there. Match nebentypus reciprocity and dual conventions before identifying this with a Galois construction. R17.6 supplies the classical attachment and plans its ramified comparison; general Hilbert attachments keep their owner.

Classical arithmetic Frobenius convention stated; χ_cyc(arithmetic Frob_p)=p; unitary AF.5 πf, integer k≥2.

Uses: R16.3/tate-unitary-normalization; R16.6/classical-hecke-and-level; R16.6/hilbert-algebraic-weights; R01 `R01.2/weil-deligne-representation`.

Source: [nt26], §1.2 recᵀ and Hodge–Tate conventions, p. 8.

<a id="r16-6-geometry-and-galois-exports"></a>

### geometry-and-galois-exports: Newvector and multiplicity exports

Export the exact local conductor dimensions, normalized Whittaker line, primitive classical comparison, coefficient field and Hilbert algebraic representation to R18’s automorphic cohomology and R19’s Galois construction. Each consumer records its central character, archimedean dual convention, local compact subgroup, Hecke normalization and coefficient lattice. The finite-part multiplicity remains one for a fixed compatible infinite type; no new claim of integral multiplicity one, torsion-freeness or Galois existence is made by this export.

Consumer coefficient field, local level and infinite type fixed; geometric statements imported from their owners.

Uses: R16.2/casselman-newvector; R16.4/global-multiplicity-one; R16.4/cohomological-rationality; R16.6/primitive-classical-bijection; R16.6/hilbert-algebraic-weights; R16.6/weight-k-parameter-conversion.

Source: [cdn20], §5.2.1 pp. 347–348, archimedean weight two.

<a id="r16-6-weight-one-classical-comparison"></a>

### weight-one-classical-comparison: Primitive weight-one comparison

For N>0 and odd nebentypus χ, the existing primitive normalized weight-one cusp forms at conductor N correspond to cuspidal GL₂(𝔸ℚ) classes of exact conductor N and central character ω_χ whose unitary infinite component is the full-O(2) limit D₁(0). Its positive-determinant restriction has holomorphic and antiholomorphic limits of lowest weights ±1. Its real Weil parameter is 1⊕sgn, not an irreducible induction from ℂ×; its standard infinite factor is Γℝ(s)Γℝ(s+1)=Γℂ(s). Use AF.5’s k≥1 function dictionary, finite newvector normalization and global multiplicity. This comparison does not give a regular algebraic Hilbert coefficient Sym^{−1} or a weight-one Galois construction. The Casimir is −1/4 at k=1 in the convention Δ=(H²+2XY+2YX)/4.

N>0; χ(−1)=−1; existing primitive newform carrier with k=1 and exact conductor; chosen AF.1 limit globalization and AF.5 dictionary.

Uses: R16.2/archimedean-classification; R16.4/global-multiplicity-one; AF `AF.5/gl2-classical-to-adelic`; AF `AF.5/gl2-dictionary`; AF `AF.1`; AL `AL.1`; ModularForms Layer 4; R16.2/casselman-newvector; R16.2/normalized-newvector.

Source: [getz15], §6.4 Lemma 6.19, p. 33, corrected as AF/E1; §6.5 limit module, p. 34.

## R17.1. Quaternionic local transfer

<a id="r17-1-local-quaternionic-comparison"></a>

### local-quaternionic-comparison: Quaternionic local Jacquet–Langlands

For a nonarchimedean F and quaternion division algebra D/F from the upstream quaternion carrier, ET.6 local Jacquet–Langlands identifies irreducible smooth D× representations with essentially square-integrable GL₂(F) representations. On corresponding regular elliptic d,g having the same reduced characteristic polynomial, Θ_JL(ρ)(g)=−Θ_ρ(d). Determinants/central characters and χ∘Nrd versus χ∘det twists agree. At a split place D=M₂(F) the comparison is the chosen algebra isomorphism and has sign +1. A principal series has no division-algebra preimage. This is a specialization of the general correspondence, not a second existence/bijectivity proof.

Characteristic-zero smooth representations; compare matching elliptic conjugacy classes; square-integrability is essential.

Uses: R16.3/steinberg-monodromy; R16.3/supercuspidal-parameter; ET `ET.6`; QuadraticFormInvariants Layer 2; QuadraticFormInvariants Layer 6D.

Source: [jl70], Theorem 15.1 and following orthogonality discussion, pp. 249–250.

<a id="r17-1-norm-character-steinberg"></a>

### norm-character-steinberg: Norm characters and Steinberg twists

Under localQuaternionic, χ∘Nrd on D× transfers to St⊗χdet. Its central character is χ², its WD parameter is steinbergParameter with N≠0, and its standard conductor is 1 for unramified χ or 2a(χ) for ramified χ. The corresponding local L/epsilon factors are exactly those of that parameter; the one-dimensional D× dimension does not make the GL₂ WD parameter monodromy-free. The trivial D× representation is the unramified St case, used by the definite-quaternion applications.

Uses: R17.1/local-quaternionic-comparison; R16.3/steinberg-monodromy; R16.3/conductor-epsilon-comparison; ET `ET.6`; QuadraticFormInvariants Layer 2.

Source: [jl70], §15 special/norm-character correspondence; §16 p. 269.

<a id="r17-1-real-quaternionic-comparison"></a>

### real-quaternionic-comparison: The real quaternionic coefficient comparison

For Hamilton D, the algebraic representation Sym^{k−2}⊗det^m, k≥2, m integer, transfers to D_k⊗|det|^{(k−2+2m)/2}. Both have scalar exponent k−2+2m and sign^k on ℝ×. On SU(2) its character at diag(e^{iθ},e^{-iθ}), sinθ≠0, is sin((k−1)θ)/sinθ, dimension k−1. Summing the two D_k weight tails on the matched elliptic class gives its negative; this checks JL's sign −1 with the same norm twist. Tests: k=2 gives the trivial quaternion type and D₂; k=3 gives dimension two and character 2cosθ; k=1 is excluded since Sym^{-1} is undefined. Unitary D_k itself need not be algebraic.

Real place, k≥2 and m integer; AF.1 supplies the full O(2) representation and archimedean LLC.

Uses: R17.1/local-quaternionic-comparison; R16.2/archimedean-classification; R16.3/archimedean-factor-comparison; R16.6/hilbert-algebraic-weights; AF `AF.1`; QuadraticFormInvariants Layer 2.

Source: [cdn20], §5.2.1 pp.347–348; [jl70-ubc], §5 Lemmas 5.6 and 5.10 pp.83–86, §6 Lemma 6.1 pp.111–112 for the weight and SU(2) character calculations.

<a id="r17-1-wild-dyadic-transfer"></a>

### wild-dyadic-transfer: Wild and dyadic quaternionic compatibility

For every essentially square-integrable GL₂(F) parameter, including primitive wild rank-two Weil representations at dyadic places, the ET.6 quaternionic preimage has the same central character and LLC parameter as GL₂, with the same standard factors and Artin conductor in R16.3’s convention. For a supercuspidal it has N=0; for a special representation it has rank-one N. Dihedral/tamely-dihedral examples are checks within this statement, not a replacement for primitive wild cases. No naive level exponent of a chosen order in D is equated to the GL₂ conductor without a separate comparison.

ET.6 canonical inner-form correspondence at every finite extension of ℚp; characteristic zero.

Uses: R17.1/local-quaternionic-comparison; R16.3/supercuspidal-parameter; R16.3/steinberg-monodromy; R16.3/tate-unitary-normalization; R16.3/tamely-dihedral-supercuspidal; ET `ET.6`; R01 `R01.3/conductor-of-a-weil-deligne-representation`.

Source: [cdn23], §4.1.2, p. 38, local division/split identification.

<a id="r17-1-swapped-quaternion-invariants"></a>

### swapped-quaternion-invariants: Swapped quaternion invariants in arithmetic applications

**Ramification realization.** For a number field F, finite sets S_f,S_∞ of finite/infinite places are the nonsplit places of a quaternion algebra iff S_∞ is real and |S_f|+|S_∞| is even. Produce a,b∈F× and QuaternionAlgebra F a 0 b: weak approximation makes b a uniformizer at S_f and negative at S_∞; GlobalQuadraticForms §4.4's `exists_hilbertSymbol_eq_neg_one_iff_pair` prescribes (a,b)_v=−1 precisely on S. QuadraticFormInvariants Layer 2's splitting criterion gives the local algebras. The product formula proves necessity, including real signs.

Two quaternion algebras are F-isomorphic iff their splitting predicates agree at every finite and infinite place. Their local Brauer invariants are 0 or 1/2; ClassFieldTheory Layer 10's `eq_zero_of_localInv_eq_zero` kills the difference of their global classes. RepresentationTheory/SemisimpleAlgebras Layer 6's unique division representative and degree then give an algebra isomorphism: a degree-two algebra is M₂(F) or its quaternion division representative. Choose split identifications separately. Interfaces: `existsQuaternionRamification_iff`, `quaternionAlgEquivOfLocalSplitting`, using actual completions and `Nonempty (D_v ≃ₐ[F_v] M₂(F_v))`. Tests: empty support gives M₂(F); {p,∞} over Q is realized; a singleton finite support with split infinity is impossible. Source: [prr23], §1.5.1, Theorem 1.33 and consequences, pp.42–43.

For totally real F of even degree, D₀ ramifies at all real places and splits at finite places. Swap τ₀ with v₀|p: D ramifies at v₀ and all real places except τ₀, preserving even size. Local algebras agree elsewhere; at changed places use normCharacterSteinberg/realQuaternionic or the specified square-integrable type. Auxiliary primes, small levels and spectra use R17.3/R18.3. Tests: a real quadratic field gives two real places for D₀ and {v₀,τ} for D; adding v₀ alone gives an impossible odd set; F=Q has no all-real D₀.

Uses: R17.1/local-quaternionic-comparison; R17.1/norm-character-steinberg; R17.1/real-quaternionic-comparison; GlobalQuadraticForms §4.4; QuadraticFormInvariants Layers 2, 5–6D; ClassFieldTheory Layer 10; RepresentationTheory/SemisimpleAlgebras Layer 6.

Source: [cdn23], §4.1.2 and equation (4.6), pp. 38–39.

## R17.2. Test functions and trace comparisons

<a id="r17-2-steinberg-projector-difference"></a>

### steinberg-projector-difference: The Steinberg projector difference

At a nonarchimedean place, for unitary χ and ω=χ², work in SR.1’s compact-mod-center, ω⁻¹-equivariant Hecke space with AA.2 quotient measure. Put K=GL₂(O), I=K₀(p), and H=⟨Z,I,w⟩ where w=(0 1;ϖ 0). Let ξ(a)=(−1)^{v_F(a)}χ(a). Set e_K^χ(g)=χ(det g)⁻¹/vol(Z\ZK) on ZK and zero elsewhere, e_H^ξ(g)=ξ(det g)⁻¹/vol(Z\H) on H and zero elsewhere, and ζχ=e_H^ξ−e_K^χ. Then trace(St⊗χdet)(ζχ)=1, every other unitary infinite-dimensional irreducible with central character ω has trace zero, and trace(χdet)(ζχ)=−1; the other determinant characters with central character ω have trace zero. The construction is compact modulo Z, not necessarily compact in G. It is a trace projector, not an assertion that its operator is zero on every induced representation.

χ unitary; nonarchimedean F; fixed central quotient measure, matching ω⁻¹ equivariance; exact extended-Iwahori H and ξ above.

API:

- `steinbergProjectorDifference_eval`: ζχ(g)=e_H^ξ(g)−e_K^χ(g) with the stated support and quotient volumes.
- `steinbergProjectorDifference_central`: ζχ(zg)=ω(z)⁻¹ζχ(g).
- `steinbergProjectorDifference_steinberg`: The corresponding Steinberg trace is one and all other unitary infinite-dimensional traces are zero.
- `steinbergProjectorDifference_character`: The corresponding determinant-character trace is minus one.
- `steinbergProjectorDifference_twist`: Replacing χ by χη multiplies ζχ(g) by η(det g)⁻¹ with the compatible central character.

Tests:

- For χ=1, the St trace is 1 and the trivial GL₂-character trace is −1.
- An irreducible unitary unramified principal series has trace zero, even though its Iwahori fixed space has dimension two.
- At g outside H∪ZK, ζχ(g)=0.
- A determinant-character twist multiplies both local idempotents by the same inverse character.

Uses: R16.1/k0; R16.2/iwahori-center; R17.1/norm-character-steinberg; R16.1/haar-quotient-comparison; SR `SR.1`; AA `AA.2`.

Source: [jl70], §16 pp. 268–269, properties (i)–(iv) and ζ″−ζ′.

<a id="r17-2-quaternionic-orbital-matching"></a>

### quaternionic-orbital-matching: Quaternionic orbital integrals and the sign

For matching regular elliptic d∈D× and g∈GL₂(F) with the same reduced polynomial, identify their centralizer torus and choose the same torus measure; specify each ambient quotient Haar measure. ET.3/ET.6 transfer supplies test functions f_D,f_G with O_g(f_G)=−O_d(f_D) and O_g(f_G)=0 at split regular semisimple g. With the matching rank-two character identity Θ_GL₂=−Θ_D this gives trace JL(ρ)(f_G)=trace ρ(f_D). For a chosen D× matrix coefficient the transferred f_G is the JL §16 elliptic character function; in the norm-character case use steinbergProjectorDifference. Compare formal degrees and the identity orbital term using the actual quotient-volume ratio; do not infer equality of formal degrees under unrelated ambient measures.

Fixed unitary central character; compact modulo center functions; regular elliptic correspondence and common centralizer measure.

Uses: R17.1/local-quaternionic-comparison; R17.2/steinberg-projector-difference; R16.1/haar-quotient-comparison; ET `ET.3`; ET `ET.6`.

Source: [jl70], §16 character orthogonality and regular-elliptic orbital-integral identity, pp.269–270.

<a id="r17-2-cyclic-local-matching"></a>

### cyclic-local-matching: Concrete cyclic norm matching

Let E/F be a cyclic extension of nonarchimedean local fields with generator σ, and use the ET.3/ET.4 twisted orbital integrals. For φ∈C_c^∞(GL₂(E)), choose f∈C_c^∞(GL₂(F)) with O_γ(f)=TO_{δ,σ}(φ) whenever γ is a regular norm of δ, and O_γ(f)=0 for regular nonnorm classes, with centralizer measures identified as in AC89 Chapter 1 §3. A matching central character on E is pulled back from F by N_{E/F}; central equivariance must use this norm, not the raw same character. At an unramified place with unit volumes, choose the spherical transfer: 1_{GL₂(O_E)} maps to 1_{GL₂(O_F)}, and Satake transforms are related by (α,β)↦(α^d,β^d), d=[E:F]. At a completely split global place use the product norm δ₁…δ_d and the corresponding convolution of local functions. The function choice is unique only modulo the kernel of regular orbital integrals.

Cyclic local extension and generator; compatible centralizer Haar measures; unramified spherical assertion requires unramified E/F.

API:

- `cyclicMatching_norm`: Matching regular norm classes have equal ordinary and twisted orbital integrals with identified centralizer measures.
- `cyclicMatching_non_norm`: The ordinary orbital integral vanishes on regular classes that are not norms.
- `cyclicMatching_unit`: Unramified hyperspecial units match with hyperspecial volumes one.
- `cyclicMatching_satake`: On an unramified Satake pair the norm rule sends (α,β) to (α^d,β^d).
- `cyclicMatching_central`: The E central character is ω_F∘N_{E/F}; test functions use its inverse.

Tests:

- For E=F and σ=1 choose f=φ; ordinary and twisted orbital integrals agree.
- At an unramified quadratic place the pair (2,3) maps to (4,9), trace 13 and determinant 36.
- For E/F unramified quadratic, a regular γ with odd valuation of det γ cannot be a norm and its matching ordinary orbital integral is zero.

Uses: R16.3/principal-series-parameter; R16.3/tate-unitary-normalization; R17.2/quaternionic-orbital-matching; ET `ET.1`; ET `ET.3`; ET `ET.4`; SR `SR.4`.

Source: [ac89], Chapter 1 §3 Proposition 3.1 pp. 20–22; §4 p. 32.

<a id="r17-2-continuous-residual-ledger"></a>

### continuous-residual-ledger: The continuous and residual spectral ledger

Fix a unitary central character and Tamagawa measures. Retain the cuspidal spectrum, residual determinant characters χdet with χ²=ω, and normalized induced families I(μ,ωμ⁻¹). The ordinary GL₂ trace formula has the elliptic sum, the self-associate intertwining term −¼∑tr(MI(f)), the global normalizing-factor integral (4π)⁻¹∫(m′/m)tr I(f), the singular constant and logarithmic unipotent terms, and the local derivative integral (2π)⁻¹∫∑_v B_v(f_v,η_v)∏_{w≠v}tr I(f_w,η_w). Here B_v is half the trace of R_v⁻¹R_v′I(f_v) minus the Fourier transform of the split logarithmic orbital term. These are the six terms of [langlands80] §10; AS supplies Eisenstein continuation, truncation and trace-class estimates, not their rank-two transfer identities.

For cyclic E/F of degree d, the twisted formula has the corresponding elliptic, singular, global-normalizing and local-derivative terms. Its self-associate term is −¼∑_{η^σ=η̃}tr(I(φ)σM). Besides d copies of the twisted discrete spectrum, include ½∑τ(η) over η^σ=η̃≠η, with τ(σ)=σM; this exceptional induced summand occurs only for d=2. M(η^σ)M(η)=1 verifies the extension, and pairing η with η̃ explains the half weight. At η=η̃ the scalar M=−1 follows from the opposite residues of the two zeta factors and the identity local normalized operators. On a quaternion division algebra retain norm characters χNrd: the Steinberg projector difference has trace −1 on χdet, so this correction cannot be discarded.

API: Label every term and its measure; change local factors while retaining central character; identify the quadratic exceptional summand; restrict to strongly cuspidal test functions only after recording the induced operator identity.

Tests: For d odd the exceptional τ summand is zero; d=2 retains η^σ=η̃≠η with weight ½; a Steinberg projector has determinant-character trace −1 rather than zero.

Uses: R17.2/steinberg-projector-difference and local matching; AS.2, AS.4, AS.6 for generic spectral expansion, intertwining operators and truncation; AA.2 for measures. The explicit rank-two ledger belongs here.

Source: [langlands80], §10, (10.1)–(10.7), pp.112–115; (10.28)–(10.35), pp.126–128; §11, pp.129–131.

<a id="r17-2-strong-cuspidal-vanishing"></a>

### strong-cuspidal-vanishing: Vanishing with a strongly cuspidal local factor

If a finite local factor f_v satisfies ∫_{N(Fv)}f_v(xny)dn=0 for every x,y∈GL₂(Fv), then its operator on every representation parabolically induced from the proper Borel is zero. Consequently the induced continuous terms and their intertwining-derivative contributions vanish for the factorizable global test function; the same operator identity kills any residual determinant character arising as a subquotient of such an induction. A supercuspidal matrix coefficient compact modulo center supplies this condition. The K-averaged constant-term identity printed for the Steinberg projector is weaker and is not substituted for this all-x,y condition.

Compact-mod-center smooth test function, suitable integrability and fixed unitary central character; strong cuspidal constant-term condition for all x,y.

Uses: R16.2/supercuspidal-kirillov; R17.2/continuous-residual-ledger; SR `SR.2`; SR `SR.3`; AS `AS.6`.

Source: [jl70], §16 equation (16.1.7), p.277; preceding Steinberg averaged constant term, p.269.

<a id="r17-2-specialized-trace-comparison"></a>

### specialized-trace-comparison: The concrete quaternionic and cyclic trace comparisons

For matching factorizable functions, prove the ordinary/quaternion and cyclic twisted GL₂ trace identities with the preceding ledger. The cyclic identity is tr R(φ)R(σ)=tr r(f), where R contains d copies of the twisted discrete spectrum and the quadratic exceptional summand, and r excludes one-dimensional and induced continuous constituents as in [langlands80] §11.

**Cyclic proof.** Use AS.6 truncation. Match elliptic/scalar terms by the cyclic Hasse norm theorem, centralizer volumes and index d. Singular terms (10.4) and d(10.31) agree. Factor the Hecke L-functions over the norm-character fibre; logarithmic differentiation gives ∑m′/m=d·m_E′/m_E, cancelling (10.3) and d(10.28). For the unipotent terms, §9 gives A₃(c,φ)=−θ′(c,0,φ) and θ′(c,0,φ)=dθ′(Nc,0,f), including archimedean logarithmic corrections; this cancels (10.5) and d(10.32). The exceptional τ trace cancels (10.2) against d(10.30), using M=−1 and d self-associate preimages. The remaining B-discrepancy (11.1) vanishes at good spherical places, but its bad-place identity must be proved.

For Hecke separation require ∑|cᵢ|<∞ for the discrete coefficients and ∫|d(it)|dt<∞ for the periodized derivative density of (11.6)–(11.7). AS.6/fine-spectral-expansion supplies absolute convergence at each height, not this joint bound. Establish the rank-two estimate here before exchanging sums: smooth archimedean decay must dominate discrete spectral growth and the Hecke logarithmic derivatives. With these bounds, the two sides define finite measures on the compact unitary Satake set, including complementary parameters. Laurent-polynomial density and atomic/continuous separation kill every atom. Fixing and varying finitely many other factors then gives the identity with arbitrary bad-place functions.

**Quaternion proof.** Use AS.6's convergent trace formula with [jl70] §16's eight-term GL₂ expansion. Put a supercuspidal coefficient or Steinberg projector at every ramified place. Both satisfy (16.1.7), and there are at least two such places. Every split, singular and continuous term therefore has a zero factor, including each local derivative term. Elliptic matching identifies the remaining noncentral geometric terms. Initially retain the possible difference of scalar coefficients: trace separation and [jl70] Lemma 16.1.2 would turn a nonzero difference into a multiple of the regular-representation trace on the away-place group, forcing that noncompact group to be compact. This forces both trace equality and the volume/formal-degree identity. Retain norm characters on both sides until subtracting their equal traces; each Steinberg factor gives −1, whose global product is 1. Character independence gives the cuspidal transfer. AS supplies the analytic justification that the 1970 text explicitly leaves formal; ET.4's unitary transfer does not supply this GL₂ identity.

API: Equality with an arbitrary finite set of changed local factors; cyclic quadratic exceptional correction; strongly cuspidal specialization; the Steinberg/norm-character specialization retaining its correction.

Tests: The identity extension reduces to the ordinary formula; omitting the quadratic τ trace leaves (10.30) unmatched; a Steinberg/norm-character pair retains the residual correction.

Uses: R17.2 local matching, continuous-residual-ledger and strong-cuspidal-vanishing; AS.6 for generic trace formula infrastructure; AA.2–3; ClassFieldTheory cyclic norm theorem and reciprocity; R16.4 multiplicity one. The rank-two singular and derivative cancellations are owned by this target.

Source: [langlands80], §9, pp.97–111; §10, pp.112–128; Theorem 11.1 and its proof, pp.130–138. [jl70], §16, pp.262–278 and Theorem 16.1, pp.269–270.

## R17.3. Global Jacquet–Langlands

<a id="r17-3-global-jl"></a>

### global-jl: Global Jacquet–Langlands correspondence

For a number field F, quaternion algebra D with ramification set S, fixed split-place identifications and unitary Hecke character ω, let DS_D(ω) be the irreducible classes in the fixed-ω discrete L² spectrum modulo centre. For nonsplit D this quotient is compact; for split D the discrete spectrum consists of cusp classes and χdet with χ²=ω. There is a bijection JL_D from the non-one-dimensional members onto cusp GL₂ classes of centre ω square-integrable modulo centre at every v∈S. Components agree at split places and use R17.1 at ramified places: finite Steinberg/supercuspidal classes and real D_k, k≥2, with quaternionic partner of dimension k−1. The split-D map is the identity. Extend to nonunitary centres by real norm twists. The domain excludes both norm characters and split Eisenstein constituents.

API:

- `globalJL_local`: For every place v, local(GL₂,JL_D π′,v) equals the R17.1 local transfer of local(D,π′,v), using the split-place identification at split v.
- `globalJL_central`: The central character of JL_D π′ is the central character of π′.
- `globalJL_inverse`: The inverse of JL_D recovers every non-one-dimensional discrete series π′ of D×(A_F). JL_D of the inverse recovers every cuspidal π with π_v square-integrable at all v ∈ S.
- `globalJL_twist`: For a unitary Hecke character χ of F, JL_D(π′⊗χ∘Nrd) = JL_D(π′)⊗χ∘det; the central character becomes ωχ². For a non-unitary χ this holds after the twist reduction to unitary central character.
- `globalJL_split`: For D=M₂(F), using the identity identifications, JL_D is the identity equivalence on cuspidal classes.

Tests:

- For D=M₂(Q), JL_D fixes every cuspidal isomorphism class.
- For D/Q ramified at {p,∞} and an allowed weight-two cuspidal π with π_p=St⊗χ_p, local(JL_D inverse π,p)=χ_p∘Nrd under R17.1; local characters are not discarded.
- For every D-compatible cuspidal π, JL_D(JL_D inverse π)=π, and the split-place components of its inverse equal π_v.
- For D = M₂(Q) and unitary Hecke characters μ, ν of Q, the irreducible automorphic representation π(μ,ν) induced from μ⊗ν is not one-dimensional and does not factor through det. It is not in the domain of JL_D, because it does not occur in L²_disc(GL₂(Q)A^×\GL₂(A), μν).

Uses: R16.1; R16.4; R17.1; R17.2; R16.2; AF `AF.2/automorphic-representation`; AF `AF.2/flath-factorization`; AF `AF.3/cuspidal-automorphic-representation`.

Source: [br10], §1.5, definition of discrete series, p. 5; §18.1, Theorem 18.1(a), p. 44; also Theorem 1.4(a), p. 6; [jl70-global], §14, Theorem 14.4, p. 247; §16, Theorem 16.1, p. 261; §16, paragraph after Theorem 16.1, p. 261.

<a id="r17-3-norm-exception"></a>

### norm-exception: The reduced-norm character exception

For nonsplit D/F and a Hecke character χ, χNrd is excluded from cuspidal JL. Classical local transfer gives St⊗χdet at finite ramified places, D₂⊗χdet at real ramified places, and χdet at split places. This tensor is noncuspidal and JL70 says it is not an automorphic subrepresentation. Badulescu–Renard's extended discrete-spectrum map instead pairs unitary χNrd with the residual class χdet. Its local |LJ| maps both χdet and St⊗χdet to χNrd; this extension is not injective and differs from classical JL outside square-integrable classes.

Use fixed split-place identifications and the R17.1 classical local correspondence.

Uses: R17.3/global-jl; R16.2; R17.1; R16.4.

Source: [jl70-global], §14, paragraph after Theorem 14.4, p. 247; [br10], §15, Proposition 15.3(a), p. 39, with Theorem 18.1(a), p. 44.

<a id="r17-3-split-hecke"></a>

### split-hecke: Split-place Hecke compatibility

For π=JL_Dπ′, the fixed split-place identifications identify local representations, every K_v-invariant module and its Hecke action. At spherical v the common T_v=[K diag(ϖ,1)K] and S_v=[K diag(ϖ,ϖ)K] eigenvalues give 1−T_vX+q_vS_vX², equivalently the reciprocal polynomial X²−T_vX+q_vS_v. This does not identify integral global modules or multiplicities at different levels, and division places have no such spherical vector.

Uses: R17.3/global-jl; R16.2.

Source: [cdn23], §4.1.3, p. 39; §4.1.4, p. 41; §4.1.2, p. 39.

<a id="r17-3-local-factors"></a>

### local-factors: Local factors of quaternionic transfer

For π=JL_D(π′), compatible ψ and self-dual measures, every local character twist has equal standard and dual L-factors and equal normalized ε-factors on π_v and π′_v. At split places use the fixed identification; at ramified places use JL70's division factors. The division zeta functional equation has the extra sign −1. If its raw constant is called ε instead, the local constants differ by −1 at each ramified place; the global product is (−1)^|S|=1. Thus completed twisted L-functions, global ε-factors and functional equations agree.

Uses: R17.3/global-jl; R16.3; R17.1; R16.5.

Source: [jl70-global], §14, before Theorem 14.4, p. 247; §14, proof of Theorem 14.2, p. 241.

<a id="r17-3-strong-multiplicity-one"></a>

### strong-multiplicity-one: Quaternionic strong multiplicity one

Let π′ and σ′ be discrete series of D×(A_F): irreducible subrepresentations of L²(D×(F)A_F^×\D×(A_F), ω) for a unitary ω. For nonsplit D these are, up to a twist by |Nrd|^s, all irreducible automorphic representations. Assume they are not one-dimensional. If π′_v ≅ σ′_v for all finite v outside a finite set, then π′ ≅ σ′. In particular their components away from a finite set of places determine the components in that set, for example at a distinguished ramified place. This is a theorem about global representations, not a statement that one local Hecke scalar determines a local type.

Uses: R17.3/global-jl; R16.4.

Source: [br10], §1.5, Theorem 1.4(c), p. 6; §18.1, Theorem 18.1(b), second sentence, p. 44; [cdn20-global], §5.2.1, proof of Proposition 5.2, p. 45.

<a id="r17-3-multiplicity-one"></a>

### multiplicity-one: Multiplicity one in the non-norm spectrum

For a fixed unitary central character ω, every non-one-dimensional discrete series π′ of D×(A_F) occurs with multiplicity exactly one in L²_disc(D×(F)A_F^×\D×(A_F), ω). Together with local invariant-vector dimensions this computes its contribution at any fixed finite level; it does not say that the full level space is one-dimensional.

Uses: R17.3/global-jl; R17.2; R16.4.

Source: [br10], §1.5, Theorem 1.4(b), p. 6; §18.1, Theorem 18.1(b), first sentence, p. 44.

<a id="r17-3-coefficient-conjugation"></a>

### coefficient-conjugation: Coefficient conjugation of global transfer

For totally real F, quaternion D and cohomological π=JL_Dπ′, assume R16.4's rationality comparison supplies a cusp π^σ with finite part σπ_f and permuted real weights for every σ∈Aut(ℂ). It remains D-compatible: σ preserves finite square-integrability and the real components stay discrete series. Inverse JL gives π′^σ with finite part σπ′_f. At split finite places σ commutes with the identification and hence Hecke actions. Thus Q(π_f)=Q(π′_f). Equality of rationality fields alone does not construct models over that field.

At real ramified places π′ has the matching algebraic type. Use the arithmetic pair a_v=t_v, b_v=q_v s_v.

Uses: R17.3/split-hecke; R17.3/strong-multiplicity-one; R16.4; R17.3/global-jl; R17.1; AF `AF.4/rationality-field`; AF `AF.4/clozel-rationality`.

Source: [pan26-global], §5.5.5, p. 75.

<a id="r17-3-rational-models"></a>

### rational-models: Rational-model comparison under transfer

Let (π′, π) be the cohomological JL pair of coefficient-conjugation, and L ⊂ C a field containing Q(π_f) = Q(π′_f). A p-adic coefficient field such as CDN20's is used through a fixed isomorphism C ≅ Q̄_p. (i) If π′_f and π_f have L-models, then at every finite v ∉ S the fixed identification gives an L-linear isomorphism of the L-models of π′_v and π_v, hence of their K_v-invariants with Hecke actions; the arithmetic Hecke eigensystems agree in L and after every extension of L. The models are absolutely irreducible, so isomorphism over C descends to L. (ii) Equality of the fields of rationality does not by itself give an L-model of π′_f: a Schur/descent obstruction at places of S may force a finite extension of L. Consumers therefore fix L large enough. CDN20 §5.2.1 requires the Shimura-curve representation to be defined over its coefficient field L and allows a finite extension of L (footnote 21).

Uses: R17.3/coefficient-conjugation; R16.4; R17.3/split-hecke; AF `AF.4/rationality-field`; AF `AF.4/clozel-rationality`.

Source: [cdn20-global], §5.2.1, p. 44; §5.2.1, footnote 21, p. 44.

<a id="r17-3-definite-infinity"></a>

### definite-infinity: Definite quaternionic weights and cuspidal transfer

For totally real F and D ramified at every real place, algebraic real types of a non-norm π′ transfer to the matching discrete series, Sym^{k−2}↔D_k. In Pan's ℚ algebra ramified at {p,∞}, A_{(k,0)} uses W^{(k,0)}, dual to the algebraic D_p× type of highest weight (0,−k). For k≥1 its T_S spectrum is indexed by cusp π with that infinity infinitesimal character, (π^∞)^{K^p}≠0 and π_p special or supercuspidal, hence lies in σ_{k+2,1}^{K^p} on M_{k+2}(K^p)·t; t carries the cyclotomic action. For k=0 split A_{(0,0)}=A^c⊕A^1: A^1 factors through Nrd and has spectrum σ_0, while A^c gives σ_{2,1}. R18.3 constructs these form spaces.

In Pan's specialization K^p is identified through his main involution, T_S=ℤ_p[T_ℓ,S_ℓ:ℓ∉S], and coefficients are in the completion of Q̄_p. R18.3 supplies its comparison with complex automorphic forms.

Uses: R17.3/global-jl; R17.3/split-hecke; R17.1; R16.6.

Source: [pan26-global], §5.4.10, before Definition 5.4.11, p. 71; Definition 5.4.11(2), p. 71; §5.5.5, p. 75; §5.5.5, p. 76.

<a id="r17-3-indefinite-parity"></a>

### indefinite-parity: Indefinite transfer and the parity input

For totally real F of degree d, a quaternion B split at one real place has d−1 ramified real places. Its finite ramification has the parity of d−1 by ClassFieldTheory14. CDN20 §5.2.1 prescribes B̌ split at ∞₀, compact modulo centre elsewhere at infinity and ramified at 𝔭; it imposes no degree condition on F. Remaining finite ramification must satisfy parity. For such B and cusp π square-integrable at every ramified place, JL_B^{-1}(π) supplies the Shimura-curve automorphic representation, with unchanged components/Hecke data at split finite places. Geometry and cohomological realization belong to R18/R22.

Allow d=1. B is given, and π is square-integrable at every ramified place, including every ramified real place.

Uses: R17.3/global-jl; R17.3/split-hecke; ClassFieldTheory Layer 14; GlobalQuadraticForms §4.4 (`exists_hilbertSymbol_eq_neg_one_iff_pair`); QuadraticFormInvariants Layer 2.

Source: [cdn20-global], §5.2.1, p. 43.

<a id="r17-3-invariant-exchange"></a>

### invariant-exchange: Transfer after exchanging two quaternion invariants

In CDN23 §4.1 take p>2, an even-degree totally real E with p completely split, 𝔭|p and ∞₀. D⁰ ramifies at all real places; D exchanges its invariants at {𝔭,∞₀}. Identify the algebras away from these places by (4.6). A cusp π discrete series at every real place and 𝔭 transfers to both, with identical away-place Hecke actions. At 𝔭 the D⁰ component is π_𝔭 and the D component its division partner; at ∞₀ the D⁰ algebraic type matches π_{∞₀}. Transport CDN23's tame level, hyperspecial away w₁ and upper-unipotent modulo ϖ_{w₁} at w₁. The supplied auxiliary w₁ has N(w₁) prime to 2Np, N(w₁)≢1 mod p, and residual Frobenius eigenvalue ratio outside {1,N(w₁)^{±1}}; N is the product of effective finite stabilizer orders. Choosing w₁ and the globalized E remains separate from transfer.

Fix the maximal-order identifications (O_{D⁰})_v≅M₂(O_{E_v}) and the away-{𝔭,∞₀} algebra isomorphism (4.6). The auxiliary place and the globalized field are supplied data.

Uses: R17.3/global-jl; R17.3/split-hecke; ClassFieldTheory Layer 14; R17.1; GlobalQuadraticForms §4.4 (`exists_hilbertSymbol_eq_neg_one_iff_pair`); QuadraticFormInvariants Layer 2.

Source: [cdn23], §4.1.1, Proposition 4.5, p. 37; §4.1.2, p. 38; §4.1.2, equation (4.6), p. 38; §4.1.2, p. 38.

<a id="r17-3-supercuspidal-globalization"></a>

### supercuspidal-globalization: Quaternionic globalization of a supercuspidal type

In CDN20 §5.2.1 fix F₀/ℚ_p, a coefficient field L/ℚ_p, C≅Q̄_p, and supercuspidal τ=LL(M) with centre trivial on ϖ. Let E be totally real with E_𝔭≅F₀. B̌ ramifies at 𝔭 and every real place except ∞₀; B exchanges invariants at {𝔭,∞₀}. Construct an automorphic Π̌ with Π̌_𝔭=JL(τ), trivial types at compact real places, and weight-two holomorphic discrete series at ∞₀. Permit the central-character adjustment of footnote 21: twist τ by ηdet and its division partner by ηNrd, and replace L by a finite extension. Global JL then gives Π on B with Π_𝔭=τ and Π_f^𝔭=Π̌_f^𝔭. The latter determines Π̌_𝔭 by strong multiplicity one.

Proof: Extend ω_τ by full-local-character-prescription to finite Ψ, trivial at infinity. AA.3 gives compactness modulo centre for B̌×. A normalized JL(τ) matrix coefficient at 𝔭 has trace one on that class and kills norm characters, since dim JL(τ)>1. Average at compact real places. At ∞₀ balance the split centre and use (sl₂,O(2)). Its tangent representation has weights ±2; D₂ contains that O(2)-type once and has no weight zero. Thus relative cochains vanish in degrees 0,2 and have dimension one in degree 1. The negative AS.6 Euler–Poincaré function has D₂ trace +1 and identity value its positive formal degree. One-dimensional exceptions are killed at 𝔭. Using (gl₂,O(2)) without balancing would instead give zero Euler characteristic.

On AA.2's compact central quotient C of mass one, P_Ψ=∫_C Ψ(z)⁻¹R(z)dz projects onto the Ψ-isotypic space by character orthogonality. AS.6 gives trace-class T=R(f) and ‖R(z)T‖₁=‖T‖₁. Trace-norm continuity and AS.0's bounded trace justify tr(P_ΨT)=∫_C Ψ(z)⁻¹tr(R(z)T)dz. Apply this to the compact trace formula with the same centralizer measures.

Fix supports modulo centre and compact idempotents elsewhere; shrink an auxiliary split-place level. The rational central invariant Δ=(trd²−4Nrd)/Nrd is bounded on fixed supports and uniformly small at the shrinking place. The product formula forces Δ=0. A repeated characteristic root in a characteristic-zero division algebra forces γ scalar. Only the identity class remains, with positive volume times formal degrees and inverse auxiliary volume. Hence the spectral trace contains the prescribed Π̌ and no norm character.

Cohomological JL and AF.4 rationality give an actual number-field model after finite extension. Combine its p-adic completion with L, obtaining the allowed coefficient extension. Strong multiplicity one determines the missing 𝔭 component from Π̌_f^𝔭.

Uses: R17.3/global-jl; R17.3/strong-multiplicity-one; R17.3/rational-models; R16.1/full-local-character-prescription; AA.2; AA.3/compactness-anisotropic; AS.0/trace-class; AS.6/compact-trace-specialization; AS.6/general-euler-poincare; AF.1a relative cohomology; AF.1/gl2-real-discrete-series; AF.4/clozel-rationality.

Source: [cdn20-global], §5.2.1 pp.43–44, footnote 21; [getz15], §6.5 p.34 for the O(2)-types (AF.1 supplies corrected operators); [clozel86], §3.2 Lemmas 4–5 pp.271–272, Lemma 9 p.274, §4.3 Theorem 1B pp.279–280. The fixed-centre division-algebra argument removes unipotent terms; it does not enlarge Clozel's semisimple theorem.

## R17.4. Cyclic, solvable and cubic base change

<a id="r17-4-unramified-base-change"></a>

### unramified-base-change: Unramified base-change Satake rule

Use the existing arithmetic Satake conjugacy class A_v∈GL₂(C) at an unramified finite v. For an unramified local extension E_w/F_v of residue degree f≥1, define its base-change representative to be A_v^f; the conjugacy class is independent of the chosen representative. This is the transfer-specific rule, not a new Satake carrier. Its determinant is det(A_v)^f and its local Euler polynomial is det(1−A_v^f X). For a split global place each local degree is one. The formal degree-zero extension of the matrix-power function is the identity matrix and is not a degree-zero field extension.

API:

- `unramifiedBaseChange_one`: The degree-one rule fixes A.
- `unramifiedBaseChange_tower`: Applying residue degrees f and then g gives A^{fg}.
- `unramifiedBaseChange_conjugate`: For P∈GL₂(K), the rule sends P A P^{-1} to P A^f P^{-1}.
- `unramifiedBaseChange_det`: The determinant of the output is det(A)^f.
- `unramifiedBaseChange_map`: Every coefficient ring map commutes with the power rule.

Tests:

- Degree one returns every A∈GL₂(K).
- The identity matrix stays the identity for every f, including the formal f=0 case.
- For A=diag(2,3)∈GL₂(Q), degree two gives the matrix diag(4,9), trace 13 and determinant 36.
- For that A, degree two is different from degree one.
- Residue degrees two then three give diag(64,729), agreeing with degree six.

Uses: Mathlib `Matrix.GeneralLinearGroup`; Mathlib `Matrix.GeneralLinearGroup.det`; Mathlib `Matrix.GeneralLinearGroup.map`; R16.3.

Source: [ac89], Chapter 3 §1, formula (1.1) and Definition 1.1, p. 199; [langlands80], §2, local lifting criterion (i), p. 9; compare §1 formula (1.1), p. 2.

<a id="r17-4-cyclic-base-change"></a>

### cyclic-base-change: Prime-cyclic base change for GL₂

For a cyclic extension E/F of prime degree ℓ of number fields, there is a uniquely determined strong base-change map BC_{E/F} from isobaric automorphic GL₂ classes over F to isobaric automorphic GL₂ classes over E. BC(π) is the unique isobaric Π such that, at every place w|v, Π_w is the local base-change lift of π_v (Langlands §2, criteria (i)/(ii)). At an unramified w|v its Satake class is unramifiedBaseChange(A_v, f(w/v)); when v splits, Π_w ≅ π_v. A cuspidal input has a cuspidal output or, only for ℓ = 2, an output θ⊞θ^σ for a Hecke character θ of E. The central character is ω_π∘N_{E/F}. The output is invariant under Gal(E/F), and the map does not depend on the chosen generator σ. Neither cuspidality nor injectivity is automatic. The theorem local-compatibility identifies BC(π)_w with the restriction to W_{E_w} of the arithmetic-normalised LLC parameter of π_v.

Isobaric here means cuspidal or χ₁⊞χ₂. Arthur–Clozel uses induction from unitary cuspidal classes; the GL₂ extension without a unitarity restriction is Langlands's theorem.

API:

- `cyclicBaseChange_local`: At w|v, BC(π)_w is the local base-change lift of π_v in the sense of Langlands §2 (criteria (i)/(ii)); at split v it is π_v. Its description as the restriction of the normalised local parameter to W_{E_w} is the theorem local-compatibility.
- `cyclicBaseChange_unramified`: At unramified w|v, Satake equals unramifiedBaseChange(A_v,f(w/v)).
- `cyclicBaseChange_central`: The central character is pullback along the idele norm.
- `cyclicBaseChange_twist`: BC(π⊗χ)=BC(π)⊗(χ∘N_{E/F}).
- `cyclicBaseChange_galois`: Every output is Gal(E/F)-invariant; every invariant cuspidal class occurs, with the fibers described in cyclic-descent-fibers.
- `cyclicBaseChange_coefficients`: In the supplied rational/cohomological regime, coefficient conjugation commutes with BC after the algebraic normalization.

Tests:

- At a completely split v each local output equals the original component and its Satake representative A_v.
- At an inert unramified place of a quadratic extension, diag(2,3) becomes diag(4,9).
- For π=AI_{E/F}(θ) with θ≠θ^σ in a quadratic extension, BC(π)=θ⊞θ^σ and is not cuspidal.
- For prime ℓ>2, every cuspidal GL₂ input remains cuspidal.

Uses: R17.4/unramified-base-change; R17.2; R16.3; R16.4; GlobalNumberFields Layer 8.

Source: [langlands80], §2, global properties (A),(B), p. 14; proof in §11, Lemma 11.3 and Proposition 11.4, pp. 140–145; §8, split places, p. 93; [ac89], Chapter 3, Theorem 5.1 (with Theorem 4.2(a)–(c)), pp. 202 and 212.

<a id="r17-4-local-compatibility"></a>

### local-compatibility: All-place compatibility of cyclic base change

For the strong cyclic BC pair and every w|v, identify rec^{arith}(BC(π)_w) with rec^{arith}(π_v)|W_{E_w}, retaining N and R16.3's normalization twist. Principal series restrict both characters; Steinberg twists retain N≠0; a restricted supercuspidal parameter can become reducible. Real-to-complex transfer restricts the real Weil parameter. The global character identity supplies a local Shintani lift; proving that its parameter is the restriction is a further local comparison. Langlands treats reducible, special, dihedral and tetrahedral cases. Include the extraordinary dyadic case in every prime degree. R16.3's existence of local LLC alone does not prove this comparison, and [bh06] §52.9 p.324 explicitly distinguishes tame lifting from Weil restriction.

Use Frobenius-semisimple Weil–Deligne parameters and the R16.3 arithmetic normalization. E_w/F_v is trivial or cyclic of degree ℓ, at every finite and infinite place.

Uses: R17.4/cyclic-base-change; R16.3.

Source: [ac89], Chapter 3, Definition 1.2 and Theorem 5.1, pp. 199, 212–213; [langlands80], §2, local result (e), p. 10; §7, Lemma 7.6, p. 68; §11, Lemma 11.8, p. 151; [carayol86], §12.2.2, p. 457.

<a id="r17-4-cyclic-descent"></a>

### cyclic-descent: Prime-cyclic automorphic descent

For cyclic E/F of prime degree ℓ, a cuspidal automorphic GL₂ representation Π over E has a cuspidal descent over F if and only if Π^σ≅Π for a generator σ of Gal(E/F). The resulting descents are determined up to twisting by the ℓ characters of F×N_{E/F}(A_E×)\A_F×. This is descent of an automorphic representation, proved by the twisted trace formula comparison, not descent of a Galois representation. Invariant noncuspidal isobaric classes also have isobaric descents, with the two-character ambiguity described separately.

A descent is a preimage under strong cyclic base change; norm-kernel characters are identified by global reciprocity.

Uses: R17.4/cyclic-base-change; R17.2; ClassFieldTheory Layer 11.

Source: [langlands80], §11, Lemma 11.6(b), p. 151; §2, global property (C), p. 14.

<a id="r17-4-cuspidality"></a>

### cuspidality: The exact prime-cyclic cuspidality criterion

Let π be cuspidal GL₂ over F and E/F cyclic of prime degree ℓ; let η be a generator of the order-ℓ group of Hecke characters of F trivial on F^×N_{E/F}(A_E^×). Then BC_{E/F}(π) is noncuspidal if and only if π≅π⊗η. This can occur only for ℓ=2. In that case BC(π)=θ⊞θ^σ for a Hecke character θ with θ≠θ^σ. The identification of π with quadratic automorphic induction is provided by R17.4/quadratic-induction, after this base-change criterion. For prime ℓ>2 the output is always cuspidal. For composite cyclic extensions test each prime step; an odd prime criterion is not a criterion for every composite degree.

The criterion is independent of the chosen generator η. Reduce Arthur–Clozel's unitary statement by a |det|^s twist for a nonunitary cuspidal π.

Uses: R17.4/cyclic-base-change; R17.4/cyclic-descent; GlobalNumberFields Layer 9.

Source: [ac89], Chapter 3, Theorem 4.2(a),(b), p. 202; [langlands80], §11, Lemma 11.7, p. 151; §11, Lemma 11.3(b), p. 141; Lemma 11.3(a) on p. 140.

<a id="r17-4-cyclic-descent-fibers"></a>

### cyclic-descent-fibers: Cuspidal fibers and quadratic self-twists

If Π is a Gal(E/F)-invariant cuspidal GL₂ representation and π is one of its cyclic descents, then its cyclic descents are precisely π⊗η^i, 0≤i<ℓ; these ℓ classes are distinct and all cuspidal. If E/F is quadratic and the common output is noncuspidal θ⊞θ^σ with θ≠θ^σ, its descent is unique (and cuspidal): π⊗η≅π. The assertion of ℓ distinct descents therefore applies only when the output is cuspidal.

E/F is prime-cyclic and η generates its order-ℓ norm-kernel character group; σ generates Gal(E/F).

Uses: R17.4/cyclic-descent; R17.4/cuspidality.

Source: [langlands80], §11, Lemma 11.6(a), p. 150; (b) on p. 151; §2, global property (C), p. 14.

<a id="r17-4-isobaric-fibers"></a>

### isobaric-fibers: Isobaric character fibers

For π=χ₁⊞χ₂ over F, its cyclic base change is (χ₁∘N_{E/F})⊞(χ₂∘N_{E/F}). Equality of two such outputs is equality of the unordered pairs of pulled-back characters. The two characters can be twisted independently by characters trivial on the norm subgroup; the ambiguity is not in general a simultaneous twist of the whole rank-two representation. When an invariant pair over E is exchanged by σ (possible only for ℓ=2), it has the quadratic cuspidal descent of the exchanged character pair described above.

E/F is prime-cyclic; χ₁,χ₂ need not be unitary. Twisting characters are trivial on F×N(A_E×).

Uses: R17.4/cyclic-base-change; R17.4/cyclic-descent-fibers; GlobalNumberFields Layer 8; ClassFieldTheory Layer 11; R16.4.

Source: [langlands80], §2, global property (C), first sentence, p. 14; §11, verification of (A)–(G), p. 151; §11, verification of (B), p. 151.

<a id="r17-4-solvable-base-change"></a>

### solvable-base-change: Base change along a solvable normal tower

Let E/F be a finite Galois extension with solvable Galois group. Choose a subnormal tower F=F₀⊂F₁⊂⋯⊂F_r=E with each step cyclic of prime degree and define BC_{E/F} by composing the prime-cyclic maps on isobaric GL₂ classes. At every local place the normalized parameter is restricted from F to E; the map is independent of the chosen prime-cyclic tower by almost-everywhere Satake comparison and isobaric strong multiplicity one. It preserves twists through the total norm and preserves cuspidality exactly when no intermediate step meets its quadratic self-twist exception. A non-Galois cubic extension has no such prime-cyclic tower from F; it is not constructed here.

π is isobaric. Fix compatible embeddings and places; intermediate F_i need not be normal over F.

API:

- `solvableBaseChange_refl`: For E=F and the empty tower the map is identity.
- `solvableBaseChange_tower`: For a nested pair of solvable normal extensions the map agrees with composition, with the chosen compatible embeddings.
- `solvableBaseChange_local`: Every local parameter is restriction along the total local extension, and at completely split places it is unchanged.
- `solvableBaseChange_twist`: Twisting by χ before BC equals twisting after BC by χ∘N_{E/F}.

Tests:

- The empty tower fixes every isobaric class.
- For a biquadratic E/F, the towers through two different quadratic subfields give equal isobaric output.
- At a place with local residue degrees two then three, diag(2,3) becomes diag(64,729).
- A cuspidal input induced from the first quadratic step is already noncuspidal there, so no blanket solvable cuspidality theorem is asserted.

Uses: R17.4/cyclic-base-change; R17.4/cuspidality; R16.4; GlobalNumberFields Layer 8; R17.4/unramified-base-change; R17.4/local-compatibility.

Source: [ac89], Chapter 3 §7, proof of Theorem 7.3, p. 222; [langlands80], §3, Lemma 3.1, p. 15.

<a id="r17-4-tower-independence"></a>

### tower-independence: Independence of the solvable tower

Two prime-cyclic subnormal towers from F to the same solvable Galois E give the same isobaric base change. At good unramified places, residue degrees multiply and both outputs have A_v^f; isobaric strong multiplicity one identifies the global classes, hence all components. Strong local compatibility additionally describes those components by Weil restriction. No tower generator or diagonalization remains in the output.

Uses: R17.4/solvable-base-change; R17.4/unramified-base-change; R17.4/local-compatibility; R16.4.

Source: [ac89], Chapter 3 §7, proof of Theorem 7.3, p. 222; [langlands80], §3, Lemma 3.1, p. 15; §11, verification of (A)–(G), p. 151.

<a id="r17-4-solvable-descent"></a>

### solvable-descent: Descent along a solvable tower with character choices

For a prime-cyclic tower F=F₀⊂⋯⊂F_r=E, an isobaric Π over E descends along that tower precisely when a chain Π_r=Π,…,Π₀ exists with each Π_{i−1} a cyclic descent and, for i≥2, invariant for F_{i−1}/F_{i−2}. Each cuspidal upper class has ℓ_i twist descents. A quadratic θ⊞θ^σ with distinct characters has one cuspidal descent; a sum of two norm-pullback characters permits independent norm-kernel twists. The theorem records these choices, including prescribed-centre compatibility; invariance of Π alone does not produce the whole chain.

Uses: R17.4/cyclic-descent; R17.4/cyclic-descent-fibers; R17.4/isobaric-fibers; R17.4/solvable-base-change.

Source: [ac89], Chapter 3 §3, Theorem 3.1 and its introduction, p. 201; Chapter 3, Theorem 4.2(f) (and (d)), p. 203; [langlands80], §2, global properties (A),(B), p. 14.

<a id="r17-4-prescribed-local-base-change"></a>

### prescribed-local-base-change: Base change with prescribed local splitting

Suppose a solvable normal extension E/F has already been produced by the arithmetic/potential-modularity owner with chosen completions and splitting at a finite set T. Then BC_{E/F}(π)_w≅π_v at every w|v with v∈T completely split; elsewhere its parameter is the restriction to the prescribed completion. If cuspidality is required, check the quadratic self-twist criterion at every tower step. For potentially unramified or ordinary conditions stated by the consuming local owner, export only the consequences of this precise local restriction and normalization. The construction of the extension with prescribed points/splitting is not replanned here.

Uses: R17.4/solvable-base-change; R17.4/local-compatibility; R17.4/cuspidality.

Source: [carayol86], §12.3.2, p. 459; §12.3.1, pp. 458–459; [langlands80], §8, split places, p. 93.

<a id="r17-4-highly-ramified-converse"></a>

### highly-ramified-converse: Completing the excluded places in the GL₃ converse argument

Let T be a finite set of finite places of a number field F. Give irreducible admissible local GL₃ representations Π_v for v∉T with trivial central character, spherical almost everywhere, and convergent partial Euler products in a right half-plane. Use AL.2–3's factors and duals, including all archimedean factors. Suppose that, for every Hecke quasicharacter χ whose unit restriction at each v∈T has conductor above a fixed threshold, L^T(s,Π⊗χ) and L^T(s,Π̃⊗χ⁻¹) are entire, bounded in finite vertical strips, and satisfy

L^T(s,Π⊗χ)=ε^T(s,Π⊗χ)·∏_{v∈T}ε(s,χ_v,ψ_v)³·L^T(1−s,Π̃⊗χ⁻¹).

Then an automorphic GL₃ representation matches Π outside T. Cuspidality and the missing local components require the adjoint-lift argument; they are not consequences of this partial converse alone.

Proof: At each v∈T choose a finite-order local character of conductor above the threshold. Full-local-character-prescription gives a global finite-order χ₀ with these components. Complete Π at T by the irreducible normalized principal series I(1,1,1), and put Ξ=Π⊗χ₀. This is an admissible restricted tensor representation with idele-class central character χ₀³. For every χ unramified at T, χ₀χ is still sufficiently ramified there. The three local L-factors of Ξ_v⊗χ_v and its dual are 1, while ε(s,Ξ_v⊗χ_v,ψ_v)=ε(s,χ₀,vχ_v,ψ_v)³. Thus the displayed partial equation is exactly the full equation for Ξ⊗χ, with dual entireness and strip bounds unchanged. Apply AL.3/gln-converse-reduced-rank with n=3 and S=T, then untwist by χ₀. For T empty use that same converse theorem directly. This proves the required highly ramified variant from its distinct unramified twisting contract, rather than treating the two families as interchangeable.

Uses: AL.3/gln-converse-reduced-rank; AL.2 principal-series multiplicativity; AF.2 restricted tensor products and twisting; R16.1/full-local-character-prescription; LocalFieldsRamification Layer 1 unit quotients.

Source: [gj78], §9.1–2 pp.531–534; [jpss79], Theorem 13.7 pp.243–245 for the unramified-family converse. The filling-and-twisting reduction above supplies the change of twisting family. Tests: T=∅ returns the full GL₃ recognition theorem; for nonempty T the output is only an outside-T match; filling by an unramified scalar parameter without χ₀ leaves nontrivial Euler factors at T and fails the displayed functional equation.

<a id="r17-4-adjoint-lift"></a>

### adjoint-lift: The Gelbart–Jacquet adjoint lift

For unitary cusp π, Ad(π)=Sym²π⊗ω_π⁻¹ is self-dual isobaric automorphic GL₃ with centre1. At every place its twisted L-factor is L(s,(π_v⊗χ_v)×π̃_v)/L(s,χ_v), with matching ε; LLC pair-factor compatibility identifies the adjoint parameter. Good eigenvalues are α/β,1,β/α, and character twisting preserves the lift. It is cuspidal iff π has no nontrivial self-twist. Otherwise π=AI_{E/F}θ for quadratic E and Adπ=η_{E/F}⊞AI(θ/θ^σ), interpreting the induction isobarically when invariant. R01 G7 owns the Galois/WD adjoint.

Identify the local adjoint parameter through GL₂ pair-factor compatibility and the GL₃ local converse theorem (R16.3, ET.6). This input also covers extraordinary components; GJ78 alone does not prove that comparison.

API:

- `adjointLift_local`: Each local component of Ad(π) is the Gelbart–Jacquet local lift of π_v; under the GL₂ LLC its parameter is the adjoint of the local parameter of π.
- `adjointLift_unramified`: Satake eigenvalues (α,β) become (α/β,1,β/α).
- `adjointLift_twist`: Ad(π⊗χ)=Ad(π) for every Hecke character χ.
- `adjointLift_central`: The central character of Ad(π) is trivial.

Tests:

- The Satake class diag(2,3) gives diag(2/3,1,3/2) in GL₃(Q).
- Scalar Satake input diag(a,a), a≠0, gives the identity class.
- Multiplying both input eigenvalues by any u≠0 does not change the three adjoint eigenvalues.
- For diag(2,3), the adjoint output differs from diag(4,6,9); forgetting ω^{-1} gives the wrong lift.

Uses: R16.3; AL `AL.3`; AF `AF.2/automorphic-representation`; R01 `G7`; MetaplecticAutomorphicForms `MP.5`; ET `ET.6`; AF `AF.3/cuspidal-automorphic-representation`; R17.4/highly-ramified-converse.

Source: [gj78], Introduction, p. 472; §3.1, Definition 3.1.3 and the remark after it, p. 485; §3.6, p. 491; §9, Theorem 9.3, p. 534; Remark 9.9, p. 541; with §3.7, p. 491; §5 lead-in, Theorem 8.1, p. 496; proof in §§5–8.

<a id="r17-4-cubic-character-induction"></a>

### cubic-character-induction: Cyclic cubic induction of a character

For a cyclic cubic extension E/F of number fields and a unitary Hecke character θ of E, there is an isobaric automorphic GL₃ representation AI_{E/F}(θ) whose local parameter at every place is Ind_{W_{E_w}}^{W_{F_v}}(θ_w) (the direct sum over w|v at a split place), in the sense of equal GL₁-twisted L- and ε-factors, and whose standard L-function is L_E(s,θ). It is cuspidal if and only if θ,θ^σ,θ^{σ²} are pairwise distinct, i.e. θ≠θ^σ. If θ=χ∘N_{E/F}, the output is χ⊞χη⊞χη² for the order-three character η associated to E/F. This rank-three character case is the exact monomial input to the tetrahedral proof; the general GL_n automorphic-induction theory is not redeveloped here.

JPSS assumes θ unitary; a quasi-character is reduced by a norm twist. In the invariant case class field theory supplies χ with θ=χ∘N and the order-three norm-kernel character η.

Uses: AL `AL.3`; AF `AF.2/automorphic-representation`; GlobalNumberFields Layer 9; ClassFieldTheory Layer 11; AL `AL.1/hecke-l-functional-equation`; ET `ET.6`; AF `AF.3/cuspidal-automorphic-representation`; Tau Ceti `TauCeti.simple_indFDRep_ofLinearCharacter_iff`; AL `AL.3/gln-converse-reduced-rank`.

Source: [jpss79], Automorphic forms on GL(3) II, §14.2, Theorem (14.2), pp. 253–254; §14.2, remark on monomial representations after the proof, p. 255; [ac89], Chapter 3 §6, Definition 6.1 and Theorem 6.2, p. 215; Chapter 3 §6, Lemmas 6.3–6.4 and Corollary 6.5, pp. 217–218; [langlands80], §3(i), p. 17.

<a id="r17-4-gl3-recognition"></a>

### gl3-recognition: GL₃ analytic recognition for the Artin bridge

For an irreducible admissible restricted tensor GL₃ representation Π over a number field, idele-class centre and right-half-plane Euler convergence, AL.3/gln-converse-reduced-rank at n=3 gives cuspidal automorphy if every GL₁ twist and its dual are entire, bounded in finite vertical strips and satisfy their completed functional equation. Restricting the twisting family to characters unramified at finite S gives agreement outside S with an automorphic class. For the different highly ramified family use the preceding filling-and-twisting target. AL.3/rs-global-poles identifies two unitary cuspidal GL₃ classes with equal almost-everywhere Rankin–Selberg factors against the first dual: its self-pair has a pole at 1, and the mixed pair does so only for equal classes. These are the converse and pole inputs to the adjoint/tetrahedral argument; R16.5 separately uses the n=2 full-rank converse.

Require absolute convergence of the Euler product in some right half-plane. S contains finite places only.

Uses: R17.4/highly-ramified-converse; AL `AL.3/gln-converse-reduced-rank`; AL `AL.3/rs-global-poles`; AL `AL.3/rs-boundary-nonvanishing`; R17.4/adjoint-lift; R17.4/cubic-character-induction; AL `AL.2/jacquet-shalika-satake-bound`; AL `AL.3/rs-local-convergence`; AL `AL.3/rs-local-factor`.

Source: [converse], §3, sentence before Theorem 3.3 and Theorem 3.3, p. 9; §3, applications (iv)–(v), p. 10; [gj78], Introduction, p. 473; §9.2, pp. 532–534; [langlands80], §3(i), p. 18, with (3.1)–(3.2); [cogdell-fields], Lecture 9 §7, Theorem 9.3 proof, pp.74–75.

<a id="r17-4-quadratic-induction"></a>
<a id="r17-5-quadratic-induction"></a>

### quadratic-induction: Quadratic automorphic induction

Let K/F be a quadratic extension of number fields, σ its nontrivial automorphism and θ a Hecke character of K. Quadratic automorphic induction AI_{K/F}(θ) is an isobaric GL₂ automorphic representation with local parameter Ind_{W_{K_w}}^{W_{F_v}}(θ_w), interpreted as the direct sum over w|v at a split place. It is cuspidal exactly when θ≠θ^σ. Its central character is η_{K/F}·θ|_{A_F×}, and L_F(s,AI θ)=L_K(s,θ). Its quadratic base change is θ⊞θ^σ. It commutes with twisting by χ of F using θ·(χ∘N_{K/F}); if θ=χ∘N, it is χ⊞χη, not cuspidal. Import finite-group induction and Mackey formulas.

API:

- `quadraticInduction_local`: Local LLC of AI θ is local induction of θ, with a direct sum at a split place.
- `quadraticInduction_central`: ω(AI θ)=η_{K/F}·θ|_{A_F×}.
- `quadraticInduction_baseChange`: BC_{K/F}(AI θ)=θ⊞θ^σ.
- `quadraticInduction_twist`: AI(θ·χ∘N)=AI(θ)⊗χ.
- `quadraticInduction_cuspidal`: AI θ is cuspidal if and only if θ≠θ^σ.

Tests:

- θ=χ∘N has output χ⊞χη and is not cuspidal.
- At v split as w,w′ the local parameter is θ_w⊕θ_w′.
- For a coset element with induced matrix [[0,a],[b,0]], its determinant is −ab, accounting for the quadratic character.
- When θ≠θ^σ, replacing AI θ by two F-characters contradicts cuspidality.

Uses: R17.4/cyclic-base-change; R16.3; GlobalNumberFields Layer 9; ClassFieldTheory Layer 11; R16.5; AL `AL.1/hecke-l-functional-equation`; Tau Ceti `TauCeti.simple_indFDRep_ofLinearCharacter_iff`.

Source: [jl70-global], §12, Proposition 12.1, p. 206; §12, paragraph before Proposition 12.1, p. 206; [ac89], Chapter 3 §6, Theorem 6.2, p. 215; Lemmas 6.3–6.4 and Corollary 6.5, pp. 217–218.

<a id="r17-4-nonnormal-cubic-base-change"></a>

### nonnormal-cubic-base-change: Non-normal cubic base change

For a non-Galois cubic K/F with S₃ normal closure, construct an isobaric automorphic BC_{K/F}(π) for each cusp GL₂ class π, with Satake powers A_v^{f(w/v)} almost everywhere. For π=μ⊞ν use (μ∘N)⊞(ν∘N). Twists and centre pull back by the norm, and the output is unique. This is weak transfer. Carayol §12.2.1 additionally quotes the global all-place lift, with local lifts characterized by L- and ε-factors; §12.2.2 identifies restriction of extraordinary parameters. These stronger statements are needed for conductor comparison. Neither a cyclic tower nor almost-everywhere uniqueness alone proves them.

API:

- `cubicBaseChange_unramified`: At unramified w|v the output Satake class is the f(w/v)-power of the input class.
- `cubicBaseChange_twist`: BC_{K/F}(π⊗χ)=BC_{K/F}(π)⊗(χ∘N_{K/F}).
- `cubicBaseChange_central`: The central character is ω_π∘N_{K/F}.
- `cubicBaseChange_unique`: The isobaric global output is uniquely determined by its almost-everywhere local Satake powers.

Tests:

- At a completely split place the three outputs are all the original Satake class A.
- For splitting type (1,2) and A=diag(2,3), the two outputs are diag(2,3) and diag(4,9).
- For residue degree three and A=diag(2,3), the output is diag(8,27).
- At splitting type (1,2), replacing every output by A³ gives the wrong local components.

**Construction.** Realize the oscillator on S(F××(F⊕K)), match local Kloosterman integrals for general discriminants and compare theta–Whittaker and Kuznetsov traces. Retain the continuous integral and quadratic-resolvent discrete term. Hecke separation gives a cusp or the exception π=AI_{E/F}(ξ)⊗ν, where E is the quadratic resolvent and ξ has order three cutting out the normal closure. Strong multiplicity one gives uniqueness and twisting. Local matching and convergence remain proof requirements; this does not prove all-place compatibility.

The local norm-phase calculation is a subsidiary target. For K=ℚ[t]/(t³−2), multiplication by a+bt+ct² in (1,t,t²) has matrix M=(a,2c,2b;b,a,2c;c,b,a). Define N=det M and Q=((tr M)²−tr(M²))/2. API: N=a³+2b³+4c³−6abc; Q=3a²−6bc; N(C+a,b,c)−3(C+a)=−2C+CQ(a,b,c)+N(a,b,c) for C=±1. The quadratic Gram determinant is −27=disc(t³−2)/4. Tests: M(0,1,0)³=2I and M(1,0,0)=I; N(0,1,0)=2, N(0,0,1)=4, N(1,1,1)=1; Q(1,1,1)=−3, Q(0,1,0)=0, Q(1,0,0)=3. Over ℚ₂ the discriminant has square class −3; its unit residue 5 has no square root modulo 8. Cubic local fields need not have square discriminant; the critical points have opposite quadratic terms. Stationary phase is separate.

Uses: R17.4/cyclic-base-change; R16.3–4; R17.4/quadratic-induction; GlobalNumberFields Layer 8; AF.5 and AS.3–4 spectral estimates; AA.2–3; AL.0 Fourier theory; MetaplecticAutomorphicForms MP.2 and MP.4. The cubic relative-trace specialization is part of this target.

Source: [mr00], Theorem 6 p.195 for weak transfer, §4 pp.185–186 for the norm-phase calculation; [tunnell81], Theorem [4] and following paragraph p.173; [carayol86], §12.2.1, p. 457; §12.2.1(b), p. 457.

## R17.5. Automorphic induction and solvable Artin representations

<a id="r17-5-dihedral-artin"></a>

### dihedral-artin: Dihedral Artin automorphy

Let ρ:G_F→GL₂(C) be continuous, irreducible and finite-image, with dihedral projective image. The imported classification gives a quadratic K/F and a finite-order character θ of G_K with ρ≅Ind_{G_K}^{G_F} θ. Reciprocity identifies θ with a finite-order Hecke character, and quadraticInduction(θ) is the unique cuspidal GL₂ automorphic representation whose normalized local parameter is ρ|_{W_{F_v}} at every place. Over totally real F, total oddness makes the infinite components the holomorphic parallel-weight-one parameters; this archimedean consequence is separate from finite-place automorphy.

Include projective V₄ (n=2). The inducing character is not invariant under the nontrivial automorphism.

Uses: R17.4/quadratic-induction; R01 `R01.4`; ClassFieldTheory Layer 11; R16.4.

Source: [jl70-global], §12, Proposition 12.1, p. 206; [langlands80], Introduction, p. 4.

<a id="r17-5-finite-hecke-extension"></a>

### finite-hecke-extension: Extension of finite-order idele-torsion characters

The torsion-idele quotient is a closed subgroup of C_F.

Let F be a number field, n≥1, and ω:μ_n(F)\μ_n(A_F)→S¹ a continuous character, where μ_n(F)\μ_n(A_F) is viewed inside the idele class group C_F. Then ω extends to a finite-order continuous character of C_F if and only if its component ω_v on μ_n(F_v) is trivial at every complex place v; real places impose no condition. In particular the obstruction vanishes when F has no complex place, e.g. for totally real F. Extensions are not unique. In the Grunwald–Wang special case the cokernel of μ_n(F)\μ_n(A_F)→C_F[n] has order two, so one first chooses one of two extensions of ω to C_F[n]; either choice admits a finite-order extension when the condition holds, and the case affects only uniqueness. This is an arithmetic extension theorem on the canonical GlobalNumberFields Hecke-character carrier, not a new character group.

Uses: GlobalNumberFields Layer 9; GlobalNumberFields Layer 7; GlobalNumberFields Layer 10.

Source: [patrikis], §2.3, Lemma 2.3.6, first bullet, p. 30; proof of Lemma 2.3.6, pp. 30–31.

<a id="r17-5-tate-vanishing"></a>

### tate-vanishing: Tate’s arithmetic obstruction vanishing

For any number field F, H²_cont(G_F,Q/Z)=0, where Q/Z is discrete with trivial G_F-action. Consequently a continuous finite-image projective representation over C has zero obstruction after enlarging its finite root-of-unity coefficient group. This does not assert H²(G_F,μ_n)=0 for fixed n, nor use Q/Z with cyclotomic action. Continuous cochains and connecting maps are supplied by ProfiniteCohomology; the arithmetic vanishing is proved here.

Uses: ProfiniteCohomology Layer 10; ClassFieldTheory Layer 10; ClassFieldTheory Layer 11; R17.5/finite-hecke-extension; ClassFieldTheory Layer 5; ClassFieldTheory Layer 6.

Source: [patrikis], §2.1, Theorem 2.1.1 and first line of proof, p. 17; proof of Theorem 2.1.1, p. 18; §2.1, proof of Proposition 2.1.4, p. 19.

<a id="r17-5-finite-projective-lift"></a>

### finite-projective-lift: Continuous finite-image arithmetic projective lifting

For a number field F and continuous finite-image r:G_F→PGL₂(ℂ), construct a continuous finite-image linear lift with identified projectivization. SL₂ representatives give a μ₂ factor set; tate-vanishing kills its class in H²(G_F,μ_M) for some even M. A continuous finite-valued correcting cochain gives a homomorphism with image in μ_M times the finite SL₂ preimage. Two such lifts differ by a continuous finite-order scalar character. If r(c) is a nontrivial involution at a real place, every lift has eigenvalues ±1 and is odd; scalar projective r(c) cannot lift oddly. Prescribed determinant or residual reduction is not asserted.

Uses: R17.5/tate-vanishing; RepresentationTheory/InductionRestriction Layer 7; Tau Ceti `TauCeti.IsProjectiveRep.exists_monoidHom_of_cohomologyClass_eq_zero`; Mathlib `Matrix.ProjGenLinGroup`; Mathlib `Matrix.ProjGenLinGroup.mk`; R01 `R01.1`.

Source: [patrikis], §2.1, Proposition 2.1.4, p. 19; proof of Proposition 2.1.4, p. 19; Remark 2.1.5, p. 19.

<a id="r17-5-artin-all-place-upgrade"></a>

### artin-all-place-upgrade: From weak Artin matching to every finite place

Let ρ:G_F→GL₂(ℂ) be continuous, irreducible and finite-image, and π a unitary cuspidal GL₂ representation. Assume their unramified Satake parameters agree outside a finite set and their archimedean parameters agree. Then rec(π_v)=ρ|W_Fv at every finite place, with all twisted L- and ε-factors and conductor exponents equal. The archimedean hypothesis is essential to the following isolation argument.

Proof: Let π_v^ρ be the generic tempered local representation of the finite Weil parameter (N=0), using ET.6. The central character of π is detρ under class field theory: their quotient agrees with 1 almost everywhere, hence is 1 by the GL₁ Hecke pole criterion. Brauer induction (RepresentationTheory/InductionRestriction Layer 6) writes ρ as an integral combination of induced finite-order characters. AL.1 Hecke functional equations, induction of local factors and the product formula therefore give a meromorphic functional equation for every global character twist of ρ. Artin entireness is not used. Compare this with the cuspidal functional equation of π.

Fix a bad finite place v and any unitary local χ_v. Prescribe χ_v there and sufficiently ramified characters at the other bad finite places. The full-local prescription and its one-place quasi-character variant produce a global χ; extra ramification at good places causes no difficulty because matching parameters give matching factors for every twist. At the other bad places, GL₂ stability gives identical γ-factors for π_w and π_w^ρ, since their central characters agree, and their twisted L-factors are 1. For supercuspidals stability follows by the finite type Gauss sum; for principal series and special representations it follows from Tate stability and the product formulas. Cancellation of the good, archimedean and other bad factors isolates γ(s,π_v⊗χ_v,ψ_v)=γ(s,π_v^ρ⊗χ_v,ψ_v).

Recover each L-factor from this identity. For a unitary generic GL₂ representation every pole of its local L-function has real part <1/2; poles of the dual factor at 1−s have real part >1/2. Thus they cannot cancel in γ=εL(1−s,dual)/L(s), and the zeros in the left half-plane determine the polynomial with constant term 1. Equality of γ gives equality of L and then ε. Nonunitary character twists follow by translating s. Rank-two factor recognition now identifies the representations: principal-series factors recover the unordered inducing characters and distinguish special representations; for supercuspidals the twisted ε Gauss sums recover the type character on minimal elements by finite Fourier inversion, then the inducing type and compact induction. This is the GL₂ argument of Bushnell–Henniart §27, including wild dyadic types.

Tests: Matching almost everywhere without matching infinity does not allow archimedean cancellation. A ramified auxiliary global character is harmless at a good place only after comparing the whole local parameter. L=1 does not distinguish two supercuspidals; twisted ε-factors and type recognition do.

Uses: R16.1/full-local-character-prescription; R16.3; ET `ET.6`; AF `AF.1` (unitary GL₂ classification); AL `AL.1` (Hecke pole criterion and functional equation), `AL.2` (local/global functional equations); R01 `R01.2` (inductive local constants); Tau Ceti roadmap RepresentationTheory/InductionRestriction Layer 6.

Source: [jl70], Theorem 12.2 and Lemma 12.5, pp. 208–213; [bh06], §23.8 pp. 146–147, §25.7 p. 162, §26.1 p. 162, §27.1–8 pp. 170–176. The cancellation and unitary pole separation are the derivation used here; the cited theorem does not remove the archimedean hypothesis.

<a id="r17-5-tetrahedral-artin"></a>

### tetrahedral-artin: Tetrahedral Artin automorphy

For continuous finite-image irreducible ρ:G_F→GL₂(ℂ) with projective image A₄, construct its unique all-place cusp π. Over the cyclic cubic field E fixed by V₄, ρ_E is dihedral. Descend its Galois-invariant automorphic class; determinant matching selects one cubic-twist descent π_ps. It has no self-twist. The Rankin–Selberg pole criterion identifies its cuspidal adjoint with cyclic induction of the V₄ character θ, since Ad ρ=Ind θ. At inert good places the remaining cube ambiguity would give order six in A₄, so π_ps matches ρ almost everywhere. All archimedean places split in E, giving the infinity hypothesis of artin-all-place-upgrade. That target proves equality everywhere. R17.4 supplies the GL₃ converse and pole inputs.

Uses: R17.5/artin-all-place-upgrade; R17.5/dihedral-artin; R17.4/cyclic-descent; R17.4/cyclic-descent-fibers; R17.4/adjoint-lift; R17.4/cubic-character-induction; R17.4/gl3-recognition; R01 `R01.4`; R16.5; R16.4; R16.3.

Source: [langlands80], §3(i), Theorem 3.3, p. 19; §3(i), pp. 16–17; §3(i), p. 18; §3(i), p. 19; §3 opening, p. 15.

<a id="r17-5-octahedral-artin"></a>

### octahedral-artin: Octahedral Artin automorphy

For continuous finite-image irreducible ρ:G_F→GL₂(ℂ) with projective image S₄, Tunnell constructs a unique cusp π matching ρ almost everywhere. Let E/F be its A₄ quadratic field, K/F the Sylow-two cubic field and M=EK. Tetrahedral automorphy and quadratic descent give π₁,π₂=π₁⊗ω_{E/F}, with the same centre. Exactly one has BC_K(π_i)=π(ρ_K): both outputs are distinct quadratic descents of π(ρ_M), because ρ_M is irreducible, and one is the monomial class π(ρ_K). A local cubic degree 1 or 3 then identifies good Satake classes; the alternative would yield order six in S₄. For all-place comparison apply artin-all-place-upgrade. Infinity matches by tetrahedral base change at split places; at real-to-complex places ρ(c) has eigenvalues ±1, since its projective image is a transposition. The real parameter of π restricts to 1⊕1 and has determinant sgn, hence is 1⊕sgn. The cubic input here is JPSS transfer. Langlands's earlier restricted octahedral theorems do not replace Tunnell's theorem.

Uses: R17.5/artin-all-place-upgrade; R17.5/tetrahedral-artin; R17.5/dihedral-artin; R17.4/cyclic-descent-fibers; R17.4/nonnormal-cubic-base-change; R16.5; R01 `R01.4`; R17.4/cyclic-descent; R17.4/cuspidality; R16.4; R16.3.

Source: [tunnell81], p. 173, first paragraph; p. 173, definition of π(ρ); Lemma and its proof, p. 174; Theorem and its proof, pp. 174–175; [langlands80], §3(ii), p. 19.

<a id="r17-5-solvable-artin"></a>

### solvable-artin: Langlands–Tunnell strong Artin theorem

For a number field F and continuous finite-image irreducible ρ:G_F→GL₂(C) with solvable projective image, construct the unique cusp π with rec(π_v)=ρ|W_Fv at every place, equivalently equality of all character-twisted local L- and ε-factors. The finite projective classification leaves dihedral, A₄ and S₄; cyclic image is reducible. Linear and projective solvability coincide because the scalar kernel is abelian. Quadratic induction treats the dihedral case; the tetrahedral/octahedral constructions and artin-all-place-upgrade treat the others. Total oddness over totally real F gives holomorphic parallel weight one, though automorphy itself requires no oddness.

Uses: R17.5/artin-all-place-upgrade; R17.5/dihedral-artin; R17.5/tetrahedral-artin; R17.5/octahedral-artin; R16.5; R16.6; R01 `R01.4`; R16.3; Tau Ceti `TauCeti.Matrix.GeneralLinearGroup.not_isSolvable_fin_two`.

Source: [rt83], §4, proof of Proposition 4.3, p. 41; §4, p. 40; [langlands80], §3 opening, p. 15; [tunnell81], p. 173, first paragraph.

<a id="r17-5-q-weight-one"></a>

### q-weight-one: Odd Artin representations and classical weight one

For solvable-artin over ℚ with detρ(c)=−1, the R16.6 dictionary gives a normalized cusp weight-one newform f of exact Artin conductor, nebentypus detρ and L(s,f)=L(s,ρ). At good arithmetic Frobenius its polynomial is X²−a_ℓX+detρ(Frob_ℓ). The Weil–Langlands theorem requires all twisted Artin L-functions entire, here supplied by cuspidality. Coefficients lie in a number field; reduction specifies λ|p, residue embedding and stable lattice. This is not the cohomological weight≥2 attachment.

Uses: R17.5/solvable-artin; R16.2; R16.6; R01 `R01.1`; R01 `R01.3`; R01 `R01.5`; AF `AF.5/gl2-dictionary`; ModularForms Layer 4.

Source: [ds74], §4(c), Théorème 4.10 (Weil–Langlands), p. 516; with Remarques 4.4–4.5 and Théorème 4.6, pp. 514–515; [langlands80], §3, octahedral case before Theorem 3.4, p.20; [rt97], §2, proof of the Theorem (case D<0), p. 307.

<a id="r17-5-tr-weight-one"></a>

### tr-weight-one: Totally odd Artin representations and Hilbert weight one

For totally real F and solvable-artin ρ with detρ(c_v)=−1 at every real place, π is holomorphic parallel-weight-one cusp. Each real component is Rogawski–Tunnell's unitary induction π(1,sgn), with parameter 1⊕sgn and a limit of discrete series. Conductor, centre and local factors equal those of ρ. This supplies residual-modularity input and constructs no weight-one cohomological attachment or Shimura geometry.

Uses: R17.5/solvable-artin; R16.6; R01 `R01.1`.

Source: [rt83], §1, definitions (ii) of π₁ and of 'holomorphic of weight k', p. 4; Introduction, p. 1.

<a id="r17-5-brauer-character"></a>

### brauer-character: Prime-regular characters and reduction comparison

For a finite group Γ, algebraically closed field k of characteristic p, and m prime to p divisible by every p-regular element order, fix a multiplicative identification τ:μ_m(k)≃μ_m(ℂ). For r:Γ→GL_n(k), `brauerCharacter` is the sum, with algebraic multiplicities, of the τ-lifts of the eigenvalues of r(g), defined only for p-regular g. Since X^m−1 has distinct roots, these eigenvalues lie in μ_m(k). This construction is independent of their ordering; extending m and extending τ compatibly preserves it. It is not a lift of the modular trace.

API: `brauerCharacter_spectrum` evaluates from a split characteristic polynomial; `brauerCharacter_one` gives n; `brauerCharacter_conjugate` proves conjugacy invariance. Additivity on exact sequences follows by writing matrices in a submodule-adapted basis. For a splitting modular system (E,R,k₀), reduction identifies prime-to-p roots uniquely by Hensel lifting. A Γ-stable full R-lattice in an E-representation then has Brauer character equal to its ordinary character on p-regular elements. Two k-representations have the same Brauer character precisely when they have the same composition factors with multiplicity. In particular, equality with the character of a simple module makes the whole reduction isomorphic to that simple module.

Tests: A one-dimensional prime-to-p root lifts to τ(a); eigenvalues a,a² with τ(a) a primitive cube root give −1, including in characteristic two; the rank-p identity has character p≠0 in ℂ, although its modular trace is zero.

Proof: Prove root lifting and the lattice comparison by the characteristic polynomial of each p-regular element. Prove character recognition by pairing simple Brauer characters with projective covers: the pairing is the dimension of Hom, so the two character families are dual and simple Brauer characters are independent. Additivity then identifies multiplicities. Projective covers are those of finite-dimensional group algebras; their existence uses the nilpotent Jacobson radical and lifting primitive idempotents. This supplies modular character recognition here, beyond RepresentationTheory's ordinary-character theory.

Uses: Mathlib `Representation`, `Matrix.charpoly`, `rootsOfUnity`, finite-dimensional group algebras and composition series; RepresentationTheory/InductionRestriction Layers 3–4 for ordinary induction; LocalFieldsRamification Layer 1 for prime-to-p Hensel lifting. Modular characters and their projective pairing are owned here.

Source: [webb16], Theorem 10.1.1 p. 170, Proposition 10.1.3(5)–(6) pp. 170–171, Theorem 10.2.2 p. 176 and Corollary 10.2.3(3) p. 177.

<a id="r17-5-solvable-integral-lift"></a>

### solvable-integral-lift: Fong–Swan lifting with a stable lattice

For any prime p, finite solvable Γ, algebraically closed k of characteristic p and irreducible r:Γ→GL_n(k), there exist a number field E, a prime λ of E above p, R=(𝓞_E)_λ, a residue embedding f:R→k with kernel the maximal ideal, a homomorphism ρ:Γ→GL_n(R), and P∈GL_n(k) such that r(g)=P·f(ρ(g))·P⁻¹ for every g. This is `solvable_finite_image_integral_lift`. Neither coprimality of |Γ| with p nor rank two is required. The conclusion supplies the actual residual module.

Proof: Descend the simple residual module to a finite splitting field. Choose a number-field splitting system with that residue field enlarged if necessary: cyclotomic fields supply ordinary splitting and the required finite residue extension. Fong–Swan gives an irreducible ordinary character χ lifting its Brauer character φ. Realize χ over E and take the R-span of the Γ-translates of a basis. This is a finite, torsion-free full stable lattice; the DVR structure makes it free of rank χ(1)=n. The preceding reduction comparison and character recognition make its reduction isomorphic to r, yielding P.

For Fong–Swan use Isaacs5.4's group-order induction. Brauer Clifford decomposition lifts a nontrivial normal-subgroup orbit over its proper inertia group and then induces. The invariant branch uses the normal p-group quotient extension with prime-to-p degree/determinantal order (4.2, with4.1) and the prime-to-p quotient's unique Brauer constituent (3.1); Galois-conjugate comparison gives p-rationality. Section6 completes the p-solvable lift. These modular Clifford/extension lemmas are subsidiary targets here; characteristic-p Maschke or an unspecified projective lift does not supply them.

API: The integral rank equals the residual rank; reduction gives an isomorphism of Γ-modules; extending coefficients preserves that comparison. Tests: A prime-to-p rank-one root lifts by Hensel; the rank-two simple S₃ module in characteristic two lifts despite 2 dividing |S₃|; changing the residual basis changes P, so entrywise equality is not required.

Uses: R17.5/brauer-character; ordinary character realization in RepresentationTheory/CharacterTable Layer 3; Mathlib `Group.IsSolvable`, `HeightOneSpectrum`, `Localization.AtPrime`; GlobalNumberFields Layer 7; NumberFieldArithmetic Layer 5. The modular Clifford and p-solvable character-lifting lemmas are owned here.

Source: [isaacs74], Theorem 1.2 p. 171, Theorem 5.4 pp. 179–180 and proof in §6 pp. 180–181; Theorem 3.1 pp. 174–175, Lemma 4.1 and Theorem 4.2 pp. 175–177, Lemma 5.1 pp. 178–179. [webb16], Proposition 9.2.6 p. 143, Propositions 9.4.6–7 pp. 152–153, and the preceding reduction-comparison locators.

<a id="r17-5-odd-residual-lift"></a>

### odd-residual-lift: Solvable residual lifting in odd characteristic

For totally real F, prime p>2 and continuous absolutely irreducible totally odd r̄:G_F→GL₂(F̄_p) with solvable image, a totally odd continuous finite-image lift over a number field exists with λ|p and a stable lattice reducing semisimply to r̄ under a residue embedding. Factor r̄ through its finite solvable image Γ. Apply solvable-integral-lift and inflate ρ along G_F→Γ. The open kernel gives continuity and the finite image gives an algebraic coefficient realization. Embed E into ℂ. Reduction conjugacy preserves determinants; at each real involution the oddness API forces determinant −1 because p>2. Absolute irreducibility follows from the simple reduction. No projective lifting or prescribed conductor is needed.

**Oddness API.** For a domain R, a field k with 2≠0, a ring map f:R→k and A∈GL₂(R), `involution_det_eq_neg_one_of_reduction` proves A²=1 and det(map f A)=−1 imply det A=−1. `involution_odd_of_reduction` applies to ρ(c), c²=1. `involution_det_eq_neg_one_of_residual_conjugacy` allows B=P(map f A)P⁻¹ and det B=−1; `involution_odd_of_residual_conjugacy` uses a common P. Determinant survives semisimplification.

Tests: Over ℤ, in any basis: diag(1,−1) is odd at 3; scalar −I is even; at 2 the identity has integral determinant +1 and residual determinant −1.

Uses: R17.5/solvable-integral-lift; R01 `R01.1`; R01 `R01.5`; Mathlib `Matrix.GeneralLinearGroup.map_det`.

Source: [bcgp21], Proposition 10.1.3, proof, solvable case, p. 474.

<a id="r17-5-residual-lt-application"></a>

### residual-lt-application: Solvable residual modularity over totally real fields

For odd-residual-lift's F,p,r̄, apply Langlands–Tunnell to its finite totally odd lift. The resulting parallel-weight-one Hilbert cusp form has chosen residual attachment r̄. BCGP10.1.3 uses this over a totally real quadratic E with p=3 or5; 10.2.6 uses it through10.1.3(1). Ordinary weight-two lifts, auxiliary extensions and GSp₄ transfer are separate inputs. No minimal conductor or ordinary local condition is asserted.

Uses: R17.5/odd-residual-lift; R17.5/tr-weight-one; R01 `R01.1`; R01 `R01.5`; R17.5/solvable-artin.

Source: [bcgp21], Proposition 10.1.3, proof, solvable case, p. 474; Theorem 10.2.6, proof, p. 481.

<a id="r17-5-tunnell-primitive-globalization"></a>

### tunnell-primitive-globalization: Tunnell's globalisation of a local two-dimensional Weil representation (Tunnell 1978, Theorem 1.3)

Let K/Q_p be finite and σ:W_K→GL₂(ℂ) continuous. Tunnell's Theorem 1.3 gives a number field F, a place v with F_v≅K, and continuous ρ:W_F→GL₂(ℂ) with ρ_v≅σ. Reducible, induced, A₄ and S₄ projective types can be preserved. For K=ℚ₂ and S₄ type one may take F=ℚ and det ρ(c)=−1. In the primitive case (A₄ or S₄, necessarily p=2), the proof constructs ρ=ρ₀⊗χ̃ with ρ₀:G_F→GL₂(ℂ) of finite image, the same projective type, and χ̃ a Hecke quasi-character; in the S₄ case ρ₀ is odd at every real place. If primitive σ has finite image, Carayol's application requires finite-image ρ on G_F. This needs finite-order χ̃ prescribing the scalar discrepancy on **all** F_v×. Roots of unity alone determine neither the uniformizer value nor the principal-unit character. The quasi-character form suffices for automorphy by twisting ρ₀. Tunnell also treats positive-characteristic local and global fields; only characteristic zero is in scope here.

Irreducibility is unnecessary for existence. Restriction uses a chosen place above v; its isomorphism class is independent of that choice. Primitive types force p=2.

Uses: R17.5/finite-projective-lift; R16.3; R01 `R01.4`; ClassFieldTheory Layer 11; GlobalNumberFields Layers 1 and 9; NumberFieldArithmetic Layer 5. R16.1/full-local-character-prescription supplies full-local finite-order extension and its one-place norm-twist consequence, allowing auxiliary ramification. R17.5/finite-hecke-extension has the different domain μ_n(F)\μ_n(𝔸_F).

The full-local extension is R16.1/full-local-character-prescription; its finite-quotient step is the proved `finite_character_extension_iff`.

**Domain test.** `unramifiedQuadraticTwo`, x↦(−1)^v₂(x), kills ℚ₂× units and torsion but sends 2 to −1. `quadraticDirichletFive` has χ(0)=0, χ(2)=−1, χ(−1)=1, χ²=1, is nontrivial and primitive of conductor 5. These Dirichlet data are proved in Lean; GlobalNumberFields Layer 9's Dirichlet–Hecke comparison gives an even extension with auxiliary ramification at 5.

**Order test.** On ℤ/4ℤ, `quarticCharacter` a↦i^a extends the nontrivial quadratic character of {0,2}, has fourth power one and nontrivial square. Every extension has χ(1)²=χ(2)=−1; for a+a=0, χ(a)²=1. These proved tests concern finite-group order growth; arithmetic prescription and Grunwald–Wang require separate arguments.

Source: [tunnell78], §1, Theorem 1.3 and proof, pp. 182–183; [carayol86], §12.2.3, proof of Proposition 12.2.2, p. 458.

<a id="r17-5-prescribed-local-induction"></a>

### prescribed-local-induction: Automorphic induction with prescribed local and archimedean components (Carayol 11.2)

Let F be totally real of degree d, k_i≥2 and w of common parity. Write D_{k,w}=𝒲(ℂ,ζ_{k,w}), ζ_{k,w}(z)=(z z̄)^{(−w−k+1)/2}z^{k−1}, with central character t^{−w}. At distinct finite places 𝔭,v prescribe a quadratic field L_𝔭/F_𝔭 and a character ξ_𝔭 not factoring through norm, with ξ_𝔭|·|^{w/2} finite-order. Construct CM L/F with this completion, nonsplit at v, and a Hecke quasicharacter ξ with ξ_𝔭 as prescribed, infinity components ζ_{k_i,w}, and ξ_v not factoring through norm. Then π′=AI_{L/F}(ξ) is cuspidal, ordinary supercuspidal at 𝔭 and v, and has the prescribed D_{k_i,w}. For even d take v to be Carayol's fixed discrete-series place; for odd d it is auxiliary. Full-local prescription supplies the finite correction to an angular infinity-type character; global norm-twisted angular characters need not have finite image.

If d is even, v is Carayol's fixed place of Theorem (B); if d is odd it is any auxiliary finite place. The finite-order condition is equivalent to the local central character being |·|^(−w) times a finite-order character. At a split place 𝒲 denotes the principal series of its two characters.

Uses: R17.4/quadratic-induction; R16.2; R16.3; GlobalNumberFields Layer 1; GlobalNumberFields Layer 7; GlobalNumberFields Layer 9; GlobalNumberFields Layer 10. R16.1/full-local-character-prescription supplements these carriers.

**Construction and local finiteness.** Weak approximation gives a CM L/F with the chosen quadratic completion at 𝔭 and nonsplit at v. Let σ be CM conjugation and 𝔓 the unique prime above 𝔭. Patrikis, Lemma 2.3.1, p. 28, gives unitary ψ₀ with infinity components (z/|z|)^(k_i−1). Choose h>0 and a∈L× with (a)=𝔓^h. Since σ𝔓=𝔓, a/σa is an integer unit of absolute value one at every embedding; Mathlib's `NumberField.Units.mem_torsion` makes it torsion. Each phase ι(a)/|ι(a)| has finite order, since its square is ι(a/σa). Thus ψ₀,∞(a) is torsion. At other finite places a is a unit; continuity gives finite character image on units and only finitely many nontrivial factors. The principal-idele relation makes ψ₀,𝔓(a) torsion. As a^ℤ O_𝔓× has index h in L_𝔓×, ψ₀,𝔓 has finite order on the full local group.

Put ψ=ψ₀|·|_𝔸_L^(−w/2); then μ=ξ_𝔭/ψ_𝔓 has finite order. At 𝔙 above v choose finite-order θ with ψ_𝔙θ not σ-invariant: θ=1 if ψ_𝔙 already is not invariant, otherwise a finite local quotient character detecting σx/x≠1. Full-local prescription at {𝔓,𝔙} gives finite-order χ with components μ,θ and trivial infinity components. Then ξ=ψχ satisfies (a)–(c). Hilbert 90 identifies local norm factorization with σ-invariance. The CM construction thus uses full-local finite-character prescription.

Source: [carayol86], §11.2, character formula, conditions (a)–(c) and conclusion, p. 450; [jl70-global], §12, Proposition 12.1, p. 206, and §4, Theorem 4.6(iii), p. 71; [patrikis], §2.3, Lemma 2.3.1 and its CM consequence, p. 28.

<a id="r17-5-octahedral-mod-three-application"></a>

### octahedral-mod-three-application: The octahedral mod-3 application: odd mod-3 representations come from weight-one forms

For continuous absolutely irreducible odd r̄:G_ℚ→GL₂(𝔽₃), put λ=(1+√−2) and use the finite section s:GL₂(𝔽₃)→GL₂(ℤ[√−2]) reducing to identity with √−2↦−1. It sends the generators ((1,1),(0,1)) and ((0,1),(1,0)) respectively to ((−2,−1+√−2),(1+√−2,1)) and ((−1−√−2,−2),(−1+√−2,1+√−2)); their generated group has order 48. Then ρ=s∘r̄ is finite-image irreducible odd, detρ is the ±1 lift of detr̄, and its projective image is the same subgroup of PGL₂(𝔽₃)=S₄. Langlands–Tunnell gives a weight-one newform g of Artin conductor N(ρ) and nebentypus detρ. Its stable ℤ[√−2]_λ lattice reduces to r̄; at good ℓ, a_ℓ(g)=tr s(r̄(Frob_ℓ)) and both traces and determinants reduce correctly. N(ρ) may exceed N(r̄). DDT's later passage to weight two is separate.

Arithmetic Frobenius and the reciprocity identification of det ρ agree with q-weight-one. Enumerating the 48 generated matrices verifies the stated section.

Uses: R17.5/solvable-artin; R17.5/q-weight-one; R01 `R01.1`; R01 `R01.4`; R01 `R01.5`; Mathlib `Matrix.GeneralLinearGroup.map`; Tau Ceti `TauCeti.Matrix.GeneralLinearGroup.not_isSolvable_fin_two`.

Source: [ddt], §3.2, Theorem 3.14(a), p. 90; §3.2, sketch of proof of Theorem 3.14, case (a), p. 90; §3.2, Theorem 3.9, p. 89; §3.2, Definition 3.12, p. 89.

## R17.6. Characteristic two and residual modularity

### classical-parabolic-realization: The classical rank-two cohomological summand

For neat full level m≥3 prime to ℓ, set V_k=Sym^(k−2)R¹h_*ℚ_ℓ for the universal elliptic curve h:E→Y(m), and H¹_par=image(H¹_c→H¹). Transport coefficients through level changes and Hecke pullback/trace. Equivariant Betti–étale comparison gives S_k⊕overline(S_k), with character components. Extract Hom_{GL₂(𝔸_f)}(π_f,H¹_par) in the tower, or the exact-level newvector projector: its dimension is two, one holomorphic and one antiholomorphic contribution. Larger-level oldvectors do not enlarge this multiplicity.

Proof: The coefficient de Rham resolution maps cusp forms to vector-valued differentials. Hodge filtration and Serre duality identify their holomorphic and conjugate subspaces with all H¹_par (Deligne2.10); taking the image H¹_c→H¹ removes the boundary. Equivariant Betti–étale comparison transports Hecke correspondences. Multiplicity one and old/new decomposition extract the primitive rank-two multiplicity. Compact quaternionic H¹ is a different carrier.

API: Parabolic realization commutes with extension of coefficient fields; the Hecke projector commutes with Galois and level maps; the primitive multiplicity has dimension two independent of the auxiliary full level; pullback is adjoint to trace under the coefficient pairing.

Tests: For k=2 the coefficient is constant and H¹_par is the Jacobian realization; for the weight-twelve level-one cusp form the multiplicity is two despite a larger full-level cohomology space; an Eisenstein boundary class maps to zero in the cuspidal projector.

Uses: ModularCurves Layers 5 and 10 for universal elliptic curves and compactification; ClassicalAdicEtaleCohomology H0 and H3 for cohomology and duality; CohomologicalPointCounting/ComplexComparison Layers 8–12 and EllAdicRealization Layer 10 for equivariant finite- and adic-coefficient Artin comparison; AlgebraicCurves Layer 12E and JacobianChallenge Layers A–B for the curve de Rham sequence and Serre duality; R16.4; ModularForms Layers 4 and 8G; Tau Ceti `TauCeti.symPowerRep`. The parabolic coefficient realization and primitive projector are the specialization planned here.

Source: [deligne69], §§1–2, Theorem 2.10, pp.141–148; Definition 3.9 and (3.10)–(3.12), pp.153–154; Propositions 3.18–19 and pairing (3.20), pp.158–159.

### classical-higher-weight-attachment: Classical eigenforms of weight at least two

For a nonzero holomorphic eigenform f of weight k≥2, level N and character ε, a coefficient number field K containing a_p and ε(p), and λ|ℓ, construct a continuous semisimple ρ_{f,λ}:G_ℚ→GL₂(K_λ), unramified outside Nℓ, with arithmetic Frobenius polynomial X²−a_pX+ε(p)p^(k−1) at p∤Nℓ. Its image is compact and need not be finite. Good-place semisimple recognition proves uniqueness. For an Eisenstein eigensystem with a_p=ψ₁(p)+ψ₂(p)p^(k−1), construct ψ₁⊕ψ₂χ_cyc^(k−1) directly by reciprocity.

For cusp forms dualize the primitive cohomological multiplicity. The good-fibre p-isogeny correspondence gives T_p=F+ε(p)V and FV=p^(k−1), with F geometric Frobenius, hence det(1−FT)=1−a_pT+ε(p)p^(k−1)T². The dual has this polynomial at arithmetic Frobenius. Proper/parabolic specialization and tame cusps give unramifiedness away Nℓ. Descent to K_λ uses the trace algebra of degree ≤2: complex conjugation's rank-one idempotent (1+c)/2 splits its possible central simple obstruction. In the reducible case, traces of g and cg recover the two character values, so they descend too. This constructs a model, beyond equality of rationality fields.

API: Good-place trace and determinant; determinant εχ_cyc^(k−1); coefficient embeddings and auxiliary-level independence; uniqueness of semisimple attachments; finite generation of a compact-image stable lattice over the coefficient valuation ring.

Tests: E₄ has attachment 1⊕χ_cyc³ and infinite image; the weight-twelve level-one cusp form has polynomial X²−τ(p)X+p¹¹; a weight-two form has determinant εχ_cyc, and replacing arithmetic Frobenius by geometric Frobenius in that same polynomial fails the convention.

Uses: R17.6/classical-parabolic-realization; R01.1 and R01.5; ModularForms Layers 0, 4 and 8G; ClassFieldTheory Layer 11 for the Eisenstein branch. The rank-two eigenprojector and coefficient descent are part of this attachment.

Source: [deligne69], §4, Theorem 4.1 and Propositions 4.2–8, pp.160–166; Theorem 4.9, p.167; [ds74], Theorem 6.1 and Remarks 6.2–5, pp.520–521. The latter uses higher-weight attachment as an input.

### classical-weight-one-attachment: The Artin representation of a classical weight-one form

For a nonzero holomorphic eigenform f of weight one, level N≥1 and odd Dirichlet character ε, construct a continuous finite-image semisimple ρ_f:G_ℚ→GL₂(ℂ), unramified outside N. At arithmetic Frobenius p∤N its polynomial is X²−a_p(f)X+ε(p). It is unique up to isomorphism, irreducible exactly when f is cuspidal, has determinant ε, and complex conjugation has eigenvalues 1,−1. Reductions specify a number field, coefficient place, residue embedding and stable lattice.

Proof: Eisenstein forms give their two Dirichlet characters. For cusp forms, integrality of all conjugates and their Rankin–Selberg second moments bound a_p in a fixed finite set outside arbitrarily small prime density. At infinitely many split ℓ, multiply by an Eisenstein form ≡1, then apply DS lifting and higher-weight attachment. Chebotarev transfers the polynomial-density bound to the finite residual image. DS7.2 bounds its order uniformly: torus fibres have at most two elements, a torus normalizer has index two, exceptional projective groups and their determinant-controlled scalar kernels are bounded, and SL₂ polynomial fibres have at most ℓ²+ℓ elements, forcing ℓ bounded in that branch.

Adjoin roots of unity of orders ≤A, the image-order bound. Their finite polynomial set Y contains every good polynomial of f, by infinitely many reductions. Choose ℓ>A preserving distinct elements of Y. Prime-to-order Maschke averaging kills deformation obstructions at successive complete-DVR levels and lifts the residual finite-group representation; a number-field splitting realization supplies its integral model. Injectivity on Y identifies the characteristic-zero polynomials. This permits icosahedral images and uses no Fong–Swan assumption. Recognition with a second ℓ removes the extra ℓ-ramification. Reducibility gives two Dirichlet characters and a double Rankin–Selberg pole, contradicting the cusp simple pole. Determinant recognition gives ε and oddness.

API: Good-prime trace and determinant; cusp iff irreducible; uniqueness; realization over a number field and lattice reduction; no regular-algebraic coefficient or finiteness assertion is imported from higher-weight cohomology.

Tests: A weight-one Eisenstein eigensystem gives the sum of its two finite Dirichlet characters; every cuspidal weight-one attachment is irreducible and finite-image; complex conjugation has trace zero and determinant −1, excluding the scalar involution. Ramified factors require the separate local comparison.

Uses: R17.6/classical-higher-weight-attachment; R15.5/deligne-serre-eigenvalue-lifting-lemma; R01.4 finite-image classification and R01.5 recognition; ModularForms Layers 0, 4, 8G and 8W; AL.3 Rankin–Selberg pole/second-moment theorem; ClassFieldTheory Layer 11. The uniform finite-image bound and prime-to-order integral lifting are the key finite-group steps here.

Source: [ds74], Theorem 4.1, Corollary 4.2 and Remarks 4.4–5, pp.513–515; Propositions 5.1 and 5.5, pp.517–520; Proposition 6.7 and Lemmas 6.11–13, pp.521–523; Proposition 7.2, pp.524–525; §8.1–7, pp.525–527.

### classical-conductor-comparison: The conductor bound needed for exact residual level

For a primitive newform f of weight k≥2, exact level M and character ε, its attachment at λ|ℓ has conductor away from ℓ equal to M's prime-to-ℓ part. Frobenius-semisimple Weil–Deligne compatibility, including N, identifies ramified factors. Stable-lattice reduction cannot increase it. Thus a semisimple residual representation of odd conductor N at ℓ=2, arising from a primitive form of level M|N, forces M=N. Apply this to the actual attachment of f.

For p≠ℓ set ν_W(Φ)=p⁻¹; π_p is unitary-normalized. The arithmetic attachment satisfies WD(ρ_{f,λ})=rec(π_p)^∨⊗ν_W^((k−1)/2); its dual matches rec(π_p)⊗ν_W^(−(k−1)/2). Dualizing sends N to −Nᵗ. Conductor is unchanged by this dual and unramified twist.

**Parabolic comparison.** For F=ℚ, Carayol uses M₂(ℚ) and classical parabolic H¹. The primitive π_f multiplicity in the Sym^(k−2) modular-curve tower has dimension two; level, Hecke and Galois actions commute. Good-prime recognition identifies its dual with ρ_{f,λ}.

For a semistable model set X=ker(H¹_par(special fibre)→H¹(normalization)). Keep cusp extension by zero in the coefficient nearby-cycle sequence. Picard–Lefschetz surjects generic H¹(1) onto X through the nondegenerate pairing of the node branch-difference cokernel and dual incidence kernel, forcing rank-one N on special summands. Principal series come from the normalized fibre; ordinary supercuspidals use CM induction and good-prime recognition of the same multiplicity.

Ramified trace specialization: let c₁,c₂:C→X be maps of smooth proper curves over an algebraically closed field, ℓ invertible. For constructible ℓ-adic F on X and u:c₂*F→c₁!F, suppose every fixed branch has c₁*t=αtᵃ, c₂*t=βtᵈ with units α,β and positive unequal a,d. The alternating cohomological trace is the sum of ordinary stalk traces for d>a and Verdier-dual stalk traces for a>d, including cusp extension by zero.

Proof: use Varshavsky on the **reordered** correspondence (c₂,c₁), with morphism c₁!c₂*F→F. For d>a, pullback ideals (tᵈ),(tᵃ) satisfy d≥a and da≥a(a+1), giving contraction with n=a (`ramification_contraction`). The fixed ideal is (tᵃ) up to a unit. The contracting theorem replaces its local term by the restricted point trace; nonreduced length a adds no factor. For a>d dualize and reverse, using n=d. Evaluation and biduality preserve the alternating local trace under transpose. Proper Lefschetz–Verdier sums these terms. At a cusp j!F has zero stalk, but D(j!F)=Rj*DF can contribute; retain the dual complex.

At odd p every supercuspidal is ordinary, so the ℓ=2 odd-conductor application uses Theorem (B), without cubic transfer. For p=2≠ℓ use Carayol §12.2's strong cubic comparison and field-change identification. Residual inequality gives N|M, hence M=N when M|N.
API: Ramified Frobenius-semisimple compatibility with N; equality of characteristic-zero conductor and primitive level away from ℓ; independence of stable lattice for the semisimple residual class; residual conductor inequality.

Tests: An unramified Steinberg twist has conductor one despite unramified semisimple Weil action; supercuspidals retain Swan conductor; reduction can lower conductor. For trace specialization, (a,d)=(1,pᵐ), m>0, uses the ordinary stalk, (2,3) has a length-two fixed scheme without an extra factor two, and (3,2) uses the dual stalk. Equal orders are excluded: the identity correspondence has a positive-dimensional fixed locus.

Uses: R17.6/classical-higher-weight-attachment; R16.3; R16.6/classical-hecke-and-level; R01.3 and R01.5; R17.5/prescribed-local-induction; R17.4/nonnormal-cubic-base-change. Parabolic comparison, ramified trace and field-change identification are subsidiary targets here.

Source: [ddt], Theorem 3.1(d)–(e), p.86 (weight two); [carayol86], Theorems (A)–(B), pp.409–412; §§2.2, 4.9, 11.1–9, 12.2, pp.419–420, 426, 449–454, 457–458; [langlands73], Proposition 3.1 p.27, Theorems 7.1 and 7.5 pp.67, 70, Proposition 7.12 pp.89–90, Lemma 7.14 pp.94–98 (author pagination); [varshavsky05], §1.2.2 pp.8–9, Corollary 1.2.6 p.10, §1.5.7 p.16, Definition 2.1.1 and Theorem 2.1.3 pp.17–18; [rt97], pp.302–306.

<a id="r17-6-solvable-dihedral"></a>

### solvable-dihedral: Solvable characteristic-two images are dihedral

A continuous absolutely irreducible r̄:G_ℚ→GL₂(F̄₂) with solvable projective image has image D_n, n≥3 odd, projectively. Apply R01.4: PGL₂(F̄₂)≅SL₂(F̄₂); a nontrivial normal two-subgroup fixes a unique line, excluding Borel groups, V₄ and A₄, and odd cyclic groups are reducible. S₄ cannot embed, since its Sylow-two group is nonabelian whereas these two-subgroups are elementary abelian. A dihedral rotation subgroup has odd order. Determinant-untwist removes scalars and gives linear image D_n. This is an application of the existing classification. Characteristic-two determinant oddness does not ensure an odd complex lift.

The coefficient field is discrete, so continuity gives finite image. R01.4 supplies the characteristic-two finite-subgroup classification.

Uses: R01 `R01.1`; R01 `R01.4`; R17.6/determinant-untwist.

Source: [wiese04], Introduction, p. 123; [rt97], §2, first paragraph, p. 306; Introduction, p. 299.

<a id="r17-6-determinant-untwist"></a>

### determinant-untwist: Removing the characteristic-two scalar character

For continuous absolutely irreducible r̄:G_Q→GL₂(F̄₂) with dihedral projective image D_n, n odd ≥3, the determinant character det r̄ has odd order and a unique square root ξ:G_Q→F̄₂^× (unique among all characters, since a²=1 forces a=1 in characteristic two); ξ has odd order and is unramified at 2. The twist r̄₀=r̄⊗ξ^{-1} has determinant one and its image maps isomorphically onto the projective image, so it is dihedral of order 2n: a finite scalar in SL₂(F̄₂) is trivial. Conversely, a projective-dihedral r̄ has linear-dihedral image exactly when det r̄=1, because D_n (n odd) is generated by involutions and involutions in GL₂(F̄₂) are unipotent. Twisting a residual modular form for r̄₀ back by ξ (via reciprocity, a Teichmüller lift of ξ and a finite coefficient extension) recovers r̄; level and nebentypus are then recomputed using the actual twist, not held fixed.

Global reciprocity identifies ξ with an odd-order Dirichlet character. The modular-form twist uses its Teichmüller lift and a finite coefficient extension.

Uses: R01 `R01.1`; R01 `R01.3`; R01 `R01.4`; ClassFieldTheory Layer 11; GlobalNumberFields Layer 9.

Source: [wiese04], §4, proof of Theorem 10, p. 131; Introduction, p. 125; [rt97], Introduction, p. 300.

<a id="r17-6-teichmuller-conductor"></a>

### teichmuller-conductor: Teichmüller lift and the four dyadic conductor cases

Let r̄₀:G_Q→GL₂(F̄₂) be irreducible with linear-dihedral image of order 2n, n odd ≥3. Then r̄₀=Ind_{G_K}^{G_Q}φ for the uniquely determined quadratic field K and a character φ:G_K→F̄₂^× of odd order. Let φ̃ be the unique complex character of G_K of the same order with φ̃≡φ modulo the fixed prime l|2 (the place λ), and ρ̃=Ind φ̃. For every σ the 1-eigenspaces of ρ̃(σ) and r̄₀(σ) have equal dimension: rotations have eigenvalues φ̃(σ)^{±1}, odd-order roots of unity on which reduction is injective; a reflection has complex eigenvalues 1,−1 and its residual image is a nontrivial unipotent involution, never semisimple. Every subgroup of D_n is cyclic or contains a nontrivial rotation, so the invariants of all ramification groups at odd primes agree and the prime-to-two Artin conductor of ρ̃ is N=N(r̄₀): |D|·N_{K/Q}f(φ̃)=2^νN, D=disc K. If 2 splits or ramifies in K then N f(φ̃) is odd; if 2 is inert it is odd or an odd multiple of 4. The four cases are: (i) D and N f(φ̃) odd, ν=0; (ii) D≡5 mod 8 (printed 'D≡±5 (mod 8)'; −5≡3 mod 8 is not a discriminant) and N f(φ̃)≡4 mod 8, ν=2; (iii) D≡4 mod 8 and N f(φ̃) odd, ν=2; (iv) D≡0 mod 8 and N f(φ̃) odd, ν=3. The exponent ν=3 belongs to case (iv).

Fix Q̄⊂ℂ and the prime l above two, with compatible residue embeddings. φ̃ is also viewed as an odd-order ray-class character; f(φ̃) is its finite conductor.

Uses: R01 `R01.3`; R01 `R01.4`; ClassFieldTheory Layer 11; GlobalNumberFields Layer 7; GlobalNumberFields Layer 9.

Source: [rt97], §2, first paragraph, p. 306; §2, second paragraph, p. 306; §2, second paragraph, list (i)–(iv), p. 306; §2, sentence after the list, p. 307.

<a id="r17-6-rt-technical-lemma"></a>

### rt-technical-lemma: Rohrlich–Tunnell’s weight and level lemma

Fix λ|2 in Q̄⊂ℂ. Let g=Σb(n)q^n∈Prim₁(2^νNr,χ), χ²=1, ν∈{0,2,3}, N odd and r=1 or an odd prime prime to N. Require N=N(ρ_g), b(r)≢1 modλ if r≠1, b(n)=0 for even n if ν=2, and b(2)≢0 if ν=3. Then some normalized f∈Prim_k(N), trivial character, has ρ_f≅ρ_g, with k=2 for ν=0,2 and k=4 for ν=3. The Fourier conditions are used by the proof; necessity is not claimed. RT Remark2 says Case2 formula(3) fails without the even-index vanishing. Import DS lifting and old/new theory unchanged.

ρ_h means the semisimple residual representation at the fixed place, with good-prime traces and determinants of h.

Uses: R15 `R15.5/deligne-serre-eigenvalue-lifting-lemma`; R15 `R15.5/reduction-to-weight-at-least-two-and-to-a-true-eigenform`; R01 `R01.3`; R01 `R01.5`; R17.6/classical-conductor-comparison; R15 `R15.6/residual-modularity-witness`; ModularForms Layer 4; ModularForms Layer 6; R17.6/classical-weight-one-attachment; R17.6/classical-higher-weight-attachment.

Source: [rt97], §1, Lemma, p. 302; §1, p. 301; §1, proof of the Lemma, step (iii), p. 302; §1, preliminary remark, p. 302; §1, Case 2 (ν=2), p. 304.

<a id="r17-6-serre-odd-trick"></a>

### serre-odd-trick: The real-quadratic odd-lift trick

Let r̄₀=Ind_{G_K}^{G_Q}φ, φ̃, N and ν be as in teichmuller-conductor with K real quadratic (D>0) and D odd or divisible by 8; let ∞₁,∞₂ be the real places of K. There exist a prime ideal 𝔯 of K of degree one, prime to 2N, and a quadratic Hecke character ξ of K ramified precisely at ∞₁ and 𝔯, with φ̃(𝔯)≠1. Put r=N𝔯, an odd prime not dividing N and split in K, and g=Σb(n)q^n where L(s,φ̃ξ)=Σb(n)n^{−s}. Then Ind(φ̃ξ) is odd because ξ has mixed signature, its Artin conductor is 2^νN·r, and g∈Prim₁(2^νNr,χ) with χ the product of the Kronecker symbol at D and the (odd) Legendre symbol at r. Since ξ≡1 mod l, ρ_g≅r̄₀ and N(ρ_g)=N. Moreover b(r)≡φ̃(𝔯′)=φ̃(𝔯)^{−1}≢1 mod l, in case (ii) b(n)=0 for even n, and in case (iv) b(2)≢0 mod l. Thus g satisfies every hypothesis of rt-technical-lemma. This controlled auxiliary ramification is the Serre trick used by Rohrlich–Tunnell, distinct from Wiese's trace-zero choice of auxiliary primes.

Use degree-one primes in the specified narrow ray class modulo 4f(φ̃), by Chebotarev.

Uses: R17.6/teichmuller-conductor; R17.5/dihedral-artin; R17.5/q-weight-one; ClassFieldTheory Layer 11; GlobalNumberFields Layer 7; R01 `R01.3`; R17.4/quadratic-induction; Chebotarev Layer 10; GlobalNumberFields Layer 9.

Source: [rt97], §2, proof of the Theorem, case D>0, p. 307; §2, construction of 𝔯 and ξ, p. 308; Remark 1, p. 308.

<a id="r17-6-rohrlich-tunnell"></a>

### rohrlich-tunnell: Rohrlich–Tunnell characteristic-two modularity

Fix Q̄⊂ℂ and λ|2. For continuous irreducible linear-dihedral r̄₀:G_ℚ→GL₂(F̄₂), use its inducing field K, D=disc K, odd conductor N, Teichmüller induction and dyadic exponent ν. If D is odd or 8|D, construct a normalized newform f of exact level N, trivial character and weight k=2 for ν=0,2, or k=4 for ν=3, whose residual attachment is r̄₀. For D<0 induce the Teichmüller character; for D>0 use serre-odd-trick and the technical lemma to remove the auxiliary prime. Case D≡4 mod8 is outside this theorem; the authors give neither examples nor counterexamples. Projective-dihedral classes with nontrivial determinant require determinant-untwist and recomputed level/character.

Uses: R17.6/teichmuller-conductor; R17.6/serre-odd-trick; R17.6/rt-technical-lemma; R17.5/q-weight-one; R17.5/dihedral-artin; R17.4/quadratic-induction.

Source: [rt97], §2, Theorem, p. 307; §2, paragraph before the Theorem, p. 307; §2, proof, case D<0, p. 307; Remark 2, p. 308; Remark 3, p. 308.

<a id="r17-6-wiese-odd-lift"></a>

### wiese-odd-lift: Odd characteristic-zero lifts of mod-two dihedral representations

Let r̄=Ind_{G_K}^{G_ℚ}χ over F̄₂, with K quadratic and χ≠χ^σ; its projective image is D_n, n≥3 odd. For m=|im r̄| and P|2 in ℚ(ζ_m), construct an odd lift r̂:G_ℚ→GL₂(ℤ[ζ_m]) reducing to r̄. Induce the same-order lift χ̃ when it is odd. Otherwise K is real and induce χ̃ξ, where ξ cuts out K(√λ)/K for λ∈𝓞_K of negative norm. This gives no conductor bound. If r̄ is unramified at2 with conductor N, either a lift has conductor N, or K is real and infinitely many odd ℓ∤N split in K with tr r̄(Frob_ℓ)=0 admit lifts of conductor Nℓ. This covers projective-dihedral scalar twists as well as linear-dihedral images; determinant oddness in characteristic two is vacuous.

Embed ℤ[ζ_m]/P in F̄₂ compatibly with χ. N is the prime-to-two Artin conductor in the unramified refinement.

Uses: R17.4/quadratic-induction; R01 `R01.1`; R01 `R01.3`; R01 `R01.4`; ClassFieldTheory Layer 11; GlobalNumberFields Layer 7; Chebotarev Layer 10.

Source: [wiese04], Lemma 2, p. 126; Lemma 2(b), p. 126; Lemma 3 and proof, p. 127; proof of Lemma 2, p. 127.

<a id="r17-6-unramified-katz"></a>

### unramified-katz: Unramified mod-two dihedral Katz weight one

For Wiese-dihedral r̄:G_ℚ→GL₂(F̄₂) unramified at2, odd conductor N and ε=detr̄, construct a normalized cusp Katz eigenform f∈S₁(Γ₁(N),ε,F̄₂) for all Hecke operators, with ρ_f≅r̄ and good-prime trace/determinant matching. Exceptional local restrictions at2, including two equal unramified characters, are allowed. This does not assert a characteristic-zero weight-one lift of level N; Wiese states nonexistence for real quadratic discriminant N with norm−1 fundamental unit, for example ℚ(√229). Import the oldform and descent inputs of Propositions4,7 and Corollaries5,8 through R15.2.

Katz forms use Wiese's non-compactified Γ₁(N) definition; N is invertible in F̄₂. Unramifiedness at two is equivalent to the minimal weight being one.

Uses: R17.6/wiese-odd-lift; R17.5/q-weight-one; R15 `R15.1/hodge-bundle-with-tate-curve-normalization`; R15 `R15.1/cusp-ideal-section-forms`; R15 `R15.2/q-expansion-principle-and-its-vanishing-theorem`; R15 `R15.2`; R16.6; R01 `R01.5`; R15 `R15.2/integral-hecke-operators-from-q-expansions`; R15 `R15.6/modularity-formulations-and-determinant`.

Source: [wiese04], Theorem 9, p. 130; proof of Theorem 9, p. 131; Proposition 7, p. 129; Introduction, p. 124.

<a id="r17-6-qualitative-residual-modularity"></a>

### qualitative-residual-modularity: Characteristic-two solvable residual modularity

Every continuous absolutely irreducible r̄:G_ℚ→GL₂(F̄₂) with solvable projective image is the semisimple reduction of a holomorphic cusp weight-one newform, after choosing coefficient field, λ|2, residue embedding and stable lattice. Apply solvable-dihedral, Wiese's odd lift and dihedral Artin automorphy. Its level is the chosen lift's Artin conductor and is not controlled in general. For a weight≥2 witness use R15.5 Eisenstein multiplication on characteristic-zero reductions; for Katz input use Hasse multiplication together with the integral lifting criterion. Exact minimal weight, level and trivial character require the more restricted Rohrlich–Tunnell theorem.

Uses: R17.6/solvable-dihedral; R17.6/wiese-odd-lift; R17.5/q-weight-one; R15 `R15.5/reduction-to-weight-at-least-two-and-to-a-true-eigenform`; R15 `R15.6/residual-modularity-witness`.

Source: [wiese04], proof of Theorem 1, p. 131; Introduction, p. 123; Lemma 3, p. 127.

<a id="r17-6-weight-two-witness"></a>

### weight-two-witness: Transfer to the weight-at-least-two residual witness

From an odd characteristic-zero dihedral weight-one form reducing to r̄, or the unramified Katz form above, obtain an R15.6 witness of weight k≥2 at its primitive level. Use R15.5's E₄≡1 mod2 multiplication for characteristic-zero reductions. For Katz forms the weight-one Hasse invariant preserves q-expansion and the away-two eigencharacter; one factor gives weight two. Wiese's classicality input holds for N≥5, as here. To obtain a characteristic-zero eigenform, choose weight and auxiliary full level meeting R15.5's H¹-vanishing/integral lifting criterion and R15.2's base change; then apply the DS lemma over a dominating DVR and old/new reduction. Record coefficient field, λ|2, residue embeddings and stable lattice. The character lifts detr̄ and need not be its Teichmüller lift.

At an odd ℓ the factor ℓ^(k−1) is one modulo two, so the Hasse shift preserves that eigencharacter. Use the cusp-sheaf H¹ vanishing and integral character conditions in R15.5.

Uses: R17.6/qualitative-residual-modularity; R17.6/unramified-katz; R15 `R15.3/hasse-invariant-as-a-form-of-weight-p-minus-one`; R15 `R15.5/deligne-serre-eigenvalue-lifting-lemma`; R15 `R15.5/reduction-to-weight-at-least-two-and-to-a-true-eigenform`; R15 `R15.6/residual-modularity-witness`; R01 `R01.5`; R15 `R15.2/base-change-for-spaces-of-forms-and-the-weight-one-boundary`; R15 `R15.6/modularity-formulations-and-determinant`; R17.6/classical-higher-weight-attachment.

Source: [wiese04], Introduction, p. 124; proof of Lemma 11, p. 132.

<a id="r17-6-disjoint-irreducibility"></a>

### disjoint-irreducibility: Residual irreducibility under disjoint base change

For continuous absolutely irreducible r̄:G_F→GL₂(k̄) with finite projective image, let M be its projective-kernel field. Any finite E/F linearly disjoint from M preserves the projective image and absolute irreducibility. Disjointness from the linear-kernel field L⊃M also suffices. E need not be Galois or solvable; solvability alone is insufficient. R23.1 constructs E with local and disjointness conditions; this target exports the representation criterion.

Uses: R01 `R01.1`; R01 `R01.4`.

Source: [langlands80], §2, p. 13; [wiese04], §2, p. 125.

<a id="r17-6-quadratic-restriction"></a>

### quadratic-restriction: The bad-dihedral quadratic restriction condition

For finite-image irreducible r=Ind_{G_K}^{G_F}θ, K/F quadratic, algebraically closed coefficients of any characteristic and finite E/F, r|G_E is irreducible iff K⊄E and θ|G_EK≠θ^σ|G_EK. If K⊂E it is a sum of characters. Otherwise Mackey restriction is Ind_{G_EK}^{G_E}θ; distinct character lines are swapped by the other coset, proving irreducibility. If they coincide, θ extends to G_E (choose a square root of its value on the coset representative's square), and Frobenius reciprocity gives a one-dimensional quotient. This proof works in characteristic two; the ordinary Mackey criterion requiring invertible group order does not. The same condition controls cuspidality of quadratic automorphic induction after base change.

θ is continuous of finite image and θ≠θ^σ. E/F need not be Galois. The characteristic-zero Mackey theorem requiring invertible group order cannot be used for the even-order characteristic-two case.

Uses: R01 `R01.4`; R17.4/quadratic-induction; R17.4/cuspidality; RepresentationTheory/InductionRestriction Layer 3; Tau Ceti `TauCeti.simple_indFDRep_ofLinearCharacter_iff`.

Source: [wiese04], §2, p. 125; [langlands80], §2, p. 13.

<a id="r17-6-compatible-base-change"></a>

### compatible-base-change: Base change of a supplied compatible system

For a supplied continuous semisimple compatible family {ρ_λ} over F with common coefficient field and polynomials P_v, and a matching automorphic π, restriction to finite solvable Galois E/F matches BC_{E/F}(π) at good w|v. Roots α,β of P_v become α^f,β^f, f=f(w/v), since Frob_w maps to Frob_v^f and local character lifting is norm pullback. Require v unramified for π and ρ_λ and prime to the coefficient characteristic; v may ramify in E. Check cuspidality and residual irreducibility by their separate criteria. Family construction and integral realization stay with their owners.

Each ρ_λ is continuous and semisimple. The P_v lie in M[X] and are λ-independent. Since q_w=q_v^f, the half-power normalization also commutes with restriction. A good v may ramify in E.

Uses: R17.4/solvable-base-change; R17.4/local-compatibility; R17.6/disjoint-irreducibility; R17.6/quadratic-restriction; R01 `R01.1`; R01 `R01.5`.

Source: [langlands80], §2 local lifting, condition (i), p. 9; §2 after properties (A)–(F), p. 14; [ac89], Chapter 3 §1 before Definition 1.1, eq. (1.1), p. 199.

<a id="r17-6-compatible-descent"></a>

### compatible-descent: Automorphic descent with a consistent compatible-system twist

For prime-cyclic E/F of degree ℓ and invariant cusp Π, its descents are the distinct π⊗η^i, 0≤i<ℓ, where η generates the norm-kernel characters. A supplied compatible family {r_λ} matches one descent exactly when one index i gives equality of good-place polynomials for every λ; R01.5 then identifies the representations and proves uniqueness. If r_λ|G_E is absolutely irreducible and a family {ρ_{π,λ}} is supplied, Schur's lemma gives r_λ≅ρ_{π,λ}⊗η^{i(λ)}. Compatibility and a match at one λ force a common index, since both polynomial families are independent of λ. Impose this condition at each step of a solvable tower; separate choices at different λ do not supply a matching automorphic descent.

Uses: R17.4/cyclic-descent; R17.4/cyclic-descent-fibers; R17.4/solvable-descent; R01 `R01.5`; ClassFieldTheory Layer 11.

Source: [ac89], Chapter 3 Theorem 4.2(d), p. 202; Chapter 3 Theorem 3.1, p. 201; [langlands80], §11 Lemma 11.6(b), p. 151; [bcgp21], proof of Lemma 8.3.2, p. 452.

<a id="r17-6-potential-modularity-interface"></a>

### potential-modularity-interface: Transfer interface for potential modularity

For supplied solvable Galois E/F with prescribed completions/disjointness, continuous rank-two ρ with absolutely irreducible restriction, and a cusp Π matching ρ|G_E almost everywhere, export conditional descent along a prime-cyclic tower. Strong multiplicity one proves cyclic invariance at each matching step, hence gives a descent and its twist fibre. Selecting the twist requires compatible-descent's common-index condition and supplied Galois representations of intermediate descents. Local transfer is restriction at every completion. Extension construction, potential automorphy and family existence stay with R23/R24.

ρ is continuous and its restriction to G_E is absolutely irreducible. Check the common-index condition with the supplied representations of intermediate descents at each prime-cyclic step. Non-Galois extensions are excluded.

Uses: R17.4/prescribed-local-base-change; R17.6/disjoint-irreducibility; R17.6/compatible-base-change; R17.6/compatible-descent; R16.4.

Source: [ac89], Chapter 3 Theorem 4.2, p. 202; Chapter 3 Theorem 5.1, p. 212; [bcgp21], proof of Lemma 8.3.2, p. 452.

## Bibliography

[jl70]: https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl_9.pdf "H. Jacquet and R. P. Langlands, Automorphic forms on GL(2). LNM 114 (1970), IAS retypeset (2026)."
[jl70-ubc]: https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/jl-ps.pdf "H. Jacquet and R. P. Langlands, Automorphic forms on GL(2), LNM 114 (1970); UBC author retypeset pagination."
[casselman73]: https://lesesvre.perso.math.cnrs.fr/newforms-references/casselman.pdf "W. Casselman, On some results of Atkin and Lehner. Math. Ann. 201 (1973), 301–314."
[nt26]: https://arxiv.org/pdf/2212.03595v2 "Newton–Thorne, Symmetric power functoriality for Hilbert modular forms. Annals203 (2026); arXiv2212.03595v2."
[dlb17]: https://arxiv.org/pdf/1509.00606v2 "Dospinescu–Le Bras, Revêtements du demi-plan de Drinfeld et correspondance de Langlands p-adique. Annals186 (2017); arXiv1509.00606v2."
[bz76]: https://www.math.tau.ac.il/~bernstei/Publication_list/publication_texts/B-Zel-RepsGL-Usp.pdf "Bernstein–Zelevinsky, Representations of GL(n,F), F nonarchimedean. Russian Math. Surveys31:3 (1976),1–68."
[bm02]: https://www.imo.universite-paris-saclay.fr/m/~breuil/PUBLICATIONS/multiplicite.pdf "Breuil–Mézard, Multiplicités modulaires; Henniart appendix, Sur l’unicité des types pour GL₂. Duke115 (2002)."
[cdt99]: https://math.stanford.edu/~conrad/papers/cdtmaster.pdf "Conrad–Diamond–Taylor, Modularity of certain potentially Barsotti–Tate Galois representations. JAMS12 (1999)."
[cg18]: https://math.uchicago.edu/~fcale/papers/CG.pdf "Calegari–Geraghty, Modularity lifting beyond the Taylor–Wiles method. Inventiones (2018), author PDF."
[cg20]: https://par.nsf.gov/servlets/purl/10184292 "Calegari–Geraghty, Minimal modularity lifting for nonregular symplectic representations. Duke169 (2020),801–896."
[bcgp21]: https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf "Boxer–Calegari–Gee–Pilloni, Abelian surfaces over totally real fields are potentially modular. IHÉS (2021)."
[hkp10]: https://www.math.umd.edu/~tjh/IHA.apr.09.pdf "Haines–Kottwitz–Prasad, Iwahori–Hecke algebras. JRMS25 (2010); April 2009 author version."
[aky22]: https://arxiv.org/pdf/2110.09070v4 "Atobe–Kondo–Yasuda, Local newforms for general linear groups over a nonarchimedean local field. Forum Math. Pi (2022); arXiv2110.09070v4."
[cdn20]: https://www.ams.org/journals/jams/2020-33-02/S0894-0347-2019-00935-5/S0894-0347-2019-00935-5.pdf "Colmez–Dospinescu–Nizioł, Cohomologie p-adique de la tour de Drinfeld: dimension1. JAMS33 (2020)."
[cdn23]: https://www.cambridge.org/core/services/aop-cambridge-core/content/view/79733067FC7CB7574B408744E4387F91/S205050862300015Xa.pdf/factorisation-de-la-cohomologie-etale-p-adique-de-la-tour-de-drinfeld.pdf "Colmez–Dospinescu–Nizioł, Factorisation de la cohomologie étale p-adique de la tour de Drinfeld. Forum Math. Pi (2023)."
[pan26]: https://arxiv.org/pdf/2209.06366 "Pan, On locally analytic vectors of completed cohomology of modular curves II. Annals203 (2026); arXiv2209.06366."
[converse]: https://people.math.osu.edu/cogdell.1/PSCT-www.pdf "J. W. Cogdell, Piatetski-Shapiro’s work on converse theorems. Author survey, 2013."
[langlands80]: https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf "R. P. Langlands, Base change for GL(2). Annals Studies 96 (1980), author version."
[ac89]: https://www.claymath.org/library/cw/arthur/pdf/30.pdf "Arthur–Clozel, Simple algebras, base change, and the advanced theory of the trace formula. Annals Studies120 (1989), Clay scan."
[getz15]: https://sites.math.duke.edu/~jgetz/aut_reps.pdf "Getz, An introduction to automorphic representations. Author notes,13 March 2015,89pp."
[cogdell-fields]: https://people.math.osu.edu/cogdell.1/fields-www.pdf "Cogdell, Lectures on L-functions, converse theorems, and functoriality for GL(n). Fields Institute author notes."
[jl70-global]: https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl.pdf "H. Jacquet and R. P. Langlands, Automorphic forms on GL(2). Lecture Notes in Mathematics 114 (1970), author scan."
[br10]: https://imag.umontpellier.fr/~ioan-badulescu/Files/br_jl.pdf "Badulescu, Renard appendix, Unitary dual of GL(n) at archimedean places and global Jacquet–Langlands correspondence. Compositio146 (2010),1115–1164; author preprint pagination."
[gj78]: https://www.numdam.org/article/ASENS_1978_4_11_4_471_0.pdf "Gelbart–Jacquet, A relation between automorphic representations of GL(2) and GL(3). ASENS11 (1978),471–542."
[patrikis]: https://people.math.osu.edu/patrikis.1/variationsrevision.pdf "Patrikis, Variations on a theorem of Tate. Author revision31 July 2016, submitted memoir."
[carayol86]: https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf "Carayol, Sur les représentations l-adiques associées aux formes modulaires de Hilbert. ASENS19 (1986),409–468."
[rt97]: https://msp.org/pjm/1997/181-3/pjm-v181-n3-p16-p.pdf "Rohrlich–Tunnell, An elementary case of Serre’s conjecture. Pacific J. Math.181 special issue (1997),299–309."
[wiese04]: https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-09/07.pdf "G. Wiese, Dihedral Galois representations and Katz modular forms. Documenta Mathematica 9 (2004), 123–133."
[cdn20-global]: https://webusers.imj-prg.fr/~wieslawa.niziol/GPW5.pdf "Colmez–Dospinescu–Nizioł, Cohomologie p-adique de la tour de Drinfeld: dimension1. JAMS33 (2020),311–362; GPW5 author pagination."
[pan26-global]: https://arxiv.org/pdf/2209.06366v1 "Pan, On locally analytic vectors of completed cohomology of modular curves II. Annals203 (2026),121–281; arXiv2209.06366v1 pagination."
[rt83]: https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0074/LOG_0007.pdf "Rogawski–Tunnell, On Artin L-functions associated to Hilbert modular forms of weight one. Inventiones74 (1983),1–42; GDZ scan."
[ds74]: https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf "Deligne–Serre, Formes modulaires de poids1. ASENS7 (1974),507–530."
[tunnell81]: https://www.ams.org/journals/bull/1981-05-02/S0273-0979-1981-14936-3/S0273-0979-1981-14936-3.pdf "J. Tunnell, Artin's conjecture for representations of octahedral type. Bull. Amer. Math. Soc. (N.S.) 5 (1981), no. 2, 173–175."
[jpss79]: https://www.math.columbia.edu/~hj/Automorphic%20forms%20on%20GL(3)%20II.pdf "Jacquet–Piatetski-Shapiro–Shalika, Automorphic forms on GL(3),II. Annals109 (1979),213–258."
[tunnell78]: https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0046/LOG_0017.pdf "Tunnell, On the local Langlands conjecture for GL(2). Inventiones46 (1978),179–200; GDZ article scan, OCR00000185–00000206, pp.182–183 image check."
[ddt]: https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf "Darmon–Diamond–Taylor, Fermat’s Last Theorem. International Press1997,2–140;9 September 2007 author version and theorem numbering."

[chevalley51]: https://www.jstage.jst.go.jp/article/jmath1948/3/1/3_1_36/_pdf/-char/en "Deux théorèmes d’arithmétique"
[cht08]: https://pmihes.centre-mersenne.org/item/10.1007/s10240-008-0016-1.pdf "Automorphy for some l-adic lifts of automorphic mod l Galois representations"

[isaacs74]: https://msp.org/pjm/1974/53-1/pjm-v53-n1-p15-s.pdf "I. M. Isaacs, Lifting Brauer characters of p-solvable groups, Pacific J. Math. 53 (1974), 171–188"
[webb16]: https://www-users.cse.umn.edu/~webb/RepBook/RepBookLatex.pdf "P. Webb, A Course in Finite Group Representation Theory, 23 February 2016"

[bh06]: https://doi.org/10.1007/3-540-31511-X "C. J. Bushnell and G. Henniart, The Local Langlands Conjecture for GL(2), Springer 2006"
[clozel86]: https://backend.production.deepblue-documents.lib.umich.edu/server/api/core/bitstreams/3f8e76bd-61fa-4e50-b374-9c7298d7e482/content "Clozel, On limit multiplicities of discrete series representations in spaces of automorphic forms. Inventiones83 (1986),265–284."

[mr00]: https://www.cambridge.org/core/services/aop-cambridge-core/content/view/5049F4E78E15635E58E158F1CF1C93FC/S0008414X00008798a.pdf/cubic_base_change_for_textgl2.pdf "Mao–Rallis, Cubic Base Change for GL(2). Canadian J. Math.52 (2000),172–196."
[jy96]: https://www.math.columbia.edu/~hj/S0002-9947-96-01549-8.pdf "Jacquet–Ye, Distinguished representations and quadratic base change for GL(3). Trans. AMS348 (1996),913–939."
[ag11]: https://www.wisdom.weizmann.ac.il/~dimagur/SmoothTransfer.pdf "Aizenbud–Gourevitch, Smooth transfer of Kloosterman integrals (Archimedean case).1 June 2011 version,28pp."

[deligne69]: https://www.numdam.org/article/SB_1968-1969__11__139_0.pdf "Deligne, Formes modulaires et représentations ℓ-adiques. Bourbaki355 (1969),139–172."

[langlands73]: https://www.sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/antwerp-ps.pdf "R. P. Langlands, Modular Forms and ℓ-adic Representations, LNM 349 (1973), 361–500; retypeset pp.1–100."
[prr23]: https://doi.org/10.1017/9781139017756 "V. Platonov, A. Rapinchuk and I. Rapinchuk, Algebraic Groups and Number Theory, Volume I, second edition, Cambridge 2023."
[varshavsky05]: https://arxiv.org/pdf/math/0505564v2 "Y. Varshavsky, Lefschetz–Verdier trace formula and a generalization of a theorem of Fujiwara, arXiv:math/0505564v2 (25 November 2005); v2 pagination."
