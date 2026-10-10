# Modular forms, Part II: GL₂ automorphic representations and transfer

This roadmap extends [ModularForms](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/ModularForms/README.md) from classical Hecke theory to local and adelic rank-two representations. It builds the newvector and Whittaker comparisons, the classical-to-adelic dictionary, quaternionic Jacquet–Langlands, cyclic and solvable base change, quadratic automorphic induction, and the solvable Artin and residual-modularity applications. These interfaces supply local types, multiplicity spaces and transfer data to Hilbert modular varieties, Shimura curves and modularity arguments.

Classical forms, primitive newspaces and their Hecke algebra retain their ModularForms definitions. Generic smooth representations, induction, Jacquet and Whittaker functors belong to SmoothRepresentationsOfLocalGroups (SR); adelic groups and quotient measures to AdelicAlgebraicGroups (AA); automorphic classes and archimedean globalizations to AutomorphicFormsOnReductiveGroups (AF); analytic local factors and converse theorems to AutomorphicLFunctionsAndLocalFactors (AL); spectral decompositions to AutomorphicSpectralTheory (AS); generic inner-form and twisted transfer to EndoscopicTransferAndUnitaryTraceComparison (ET). ArithmeticGaloisRepresentations (R01) supplies Galois, Weil–Deligne, conductor and recognition interfaces. This extension specializes those interfaces to GL₂. It does not rebuild them or construct Shimura-variety cohomology, p-adic Banach representations or general compatible systems.

## Conventions and existing objects

Use Mathlib's `Matrix.GeneralLinearGroup (Fin 2) R`, its determinant, scalar homomorphism and coefficient map, and `Matrix.ProjGenLinGroup` with its quotient map. Representations use `Representation` and `Representation.invariants`; Haar measure uses `MeasureTheory.Measure.haarMeasure` on a positive compact. A normalized compact measure alone does not define an adelic quotient measure. Classical normalized newforms use Tau Ceti's `HeckeRing.GL2.Newform`, which stores newspace membership, nebentypus, eigenvalues away from the level and first Fourier coefficient one. Its bad-prime eigenproperties are the theorems of ModularForms Layer 4. Its fixed-level, fixed-character strong multiplicity theorem is `Newform.eq_of_forall_notMem_eigenvalue_eq`; it is distinct from adelic strong multiplicity one.

Use `TauCeti.symPowerRep` for symmetric powers of the standard representation and Mathlib's finite tensor product for Hilbert coefficients. The algebraic factor-set theorem `TauCeti.IsProjectiveRep.exists_monoidHom_of_cohomologyClass_eq_zero` supplies a lift when its class vanishes; it neither proves arithmetic vanishing nor continuity. `TauCeti.simple_indFDRep_ofLinearCharacter_iff` concerns finite groups over algebraically closed characteristic-zero fields. Weil groups and characteristic-two induction require the stated additional comparisons. `TauCeti.Matrix.GeneralLinearGroup.not_isSolvable_fin_two` excludes solvability of the indicated full matrix group, not automorphic obstructions.

At a finite place write O, p, ϖ and q for the valuation ring, maximal ideal, chosen uniformizer and residue cardinality. Set ν(ϖ)=q⁻¹. The Borel is upper triangular and induction includes δ_B^(1/2), with δ_B(diag(a,d))=|a/d|. K₀(pⁿ) constrains the lower-left entry; K₁(pⁿ) fixes the last row modulo pⁿ. At n=0 both are GL₂(O). Under right translation the minimal line has K₀-character ω(d). Transport Casselman's top-left convention through π∨≅π⊗ω⁻¹det. Whittaker normalization fixes ψ trivial on O and nontrivial on ϖ⁻¹O and then W(1)=1. The complex local functional and model use SmoothRepresentationsOfLocalGroups `SR.2.3/whittaker-functionals`: `SmoothRep.whittakerFunctionals` is Hom_U(V,ψ), and `SmoothRep.whittakerMultiplicityOne_gl2` gives dimension one for irreducible infinite-dimensional V. The one-dimensional case has no Whittaker model; genericity and irreducibility are hypotheses of the normalization.

Local reciprocity sends ϖ to geometric Frobenius Φ, with ν_W(Φ)=q⁻¹. The standard `rec` matches normalized character induction; `recᵀ(π)=rec(π)⊗ν_W^(-1/2)`. This multiplies its rank-two Frobenius matrix by √q and preserves N. Local factors use (ker N)^I. Arithmetic Frobenius is Φ⁻¹: invert its eigenvalues before comparing at Φ, and state the cohomological dual convention. Satake parameters α,β are in unitary normalization; spherical T₁ acts by √q(α+β). The classical weight-k roots are q^((k−1)/2)α and q^((k−1)/2)β. Rationality uses π_alg=π_unitary⊗|det|^(-(k−2)/2).

At a real place use the full O(2) module: D_k, k≥2, restricts to holomorphic and antiholomorphic constituents of weights ±k. Weight one uses the limit with Weil parameter 1⊕sgn. At a complex place |z|_ℂ=|z|². Set Γℝ(s)=π^(-s/2)Γ(s/2), Γℂ(s)=2(2π)^(-s)Γ(s), so Γℝ(s)Γℝ(s+1)=Γℂ(s). Fix the global additive character by trace to ℚ, compatible self-dual local measures and additive quotient mass one. The analytic conductor is |Disc(F)|² N(𝔣π). Over ℚ, t=s+(k−1)/2 converts unitary to classical variables; their involutions are s↔1−s and t↔k−t.

Quaternion algebras have chosen split-place identifications. Global norm characters are excluded from cuspidal Jacquet–Langlands; local division-algebra characters are allowed and match Steinberg twists. Automorphic equality means equality of canonical isomorphism classes. Residual comparisons specify the coefficient place, residue embedding, stable lattice and semisimplification. In characteristic two determinant oddness imposes no condition and involutions need not be semisimple. Compatible families are supplied data with a common coefficient field and common good-place polynomials.

AlgebraicModularFormsAndSerreWeights (R15) supplies the geometric modular-form, Hasse invariant and eigenvalue-lifting interfaces. Within a layer, definitions precede their uses. Target labels retain R16/R17 numbering. API and test names in R16.1–R17.2 have namespace `TauCeti.GL2Blueprint`; those in R17.3–R17.6 have namespace `TauCeti.GL2Transfer`. Sources use the editions listed in the bibliography; page numbers are printed pages unless the locator says otherwise.

## R16.1. Local and adelic groups

<a id="r16-1-k0"></a>

### k0: The lower-left congruence subgroup

For a commutative valuation ring O, maximal ideal p and n≥0, K₀(pⁿ) is the subgroup of the existing GL₂(O) consisting of matrices g with g₂₁∈pⁿ. For a general commutative ring R and ideal I the same formula defines K₀(I). Its image in GL₂(F) uses the existing coefficient map. At n=0 this is all GL₂(O).

**Hypotheses.** O is the ring of integers of a nonarchimedean local field F; the algebraic subgroup definition works for any commutative ring.

**API.**

- `k0_mem`: g∈K₀(I) iff g₂₁∈I.
- `k0_mono`: I⊆J implies K₀(I)⊆K₀(J).
- `k0_top`: K₀(R)=GL₂(R), expressed as the top subgroup.
- `k0_scalar`: Every scalar unit matrix belongs to K₀(I).

**Tests.**

- `k0_identity`: The identity matrix is in K₀(I).
- `k0_level_zero`: K₀(p⁰) is the full group, including the Weyl matrix.
- `k0_wrong_entry`: Over ℤ/5ℤ and I=0, (1 1;0 1) belongs, whereas (1 0;1 1) does not.

**Prerequisites.** Mathlib `Matrix.GeneralLinearGroup`; Mathlib `Matrix.GeneralLinearGroup.map`.

**Sources.** [casselman73], p. 301, §1 definition of Γ₀(b).

<a id="r16-1-k1"></a>

### k1: The last-row congruence subgroup

K₁(pⁿ)={g∈GL₂(O): g₂₁∈pⁿ and g₂₂−1∈pⁿ}; over R write K₁(I). It is the inverse image of the stabilizer of row (0,1) under reduction modulo I, not the full principal congruence subgroup. K₁(p⁰)=GL₂(O).

**Hypotheses.** Commutative ring R and ideal I; use O,p for local compactness.

**API.**

- `k1_mem`: g∈K₁(I) iff g₂₁∈I and g₂₂−1∈I.
- `k1_le_k0`: K₁(I)⊆K₀(I).
- `k1_mono`: I⊆J implies K₁(I)⊆K₁(J); in particular K₁(pⁿ⁺¹)⊆K₁(pⁿ).
- `k1_top`: K₁(R) is the full matrix unit group.
- `k1_scalar`: Scalar u belongs to K₁(I) iff u−1∈I.

**Tests.**

- `k1_identity`: The identity belongs to K₁(I).
- `k1_level_zero`: K₁(p⁰)=GL₂(O).
- `k1_not_principal`: Over ℤ/5ℤ, (2 0;0 1) lies in K₁(0), although it is not the identity modulo 5.

**Prerequisites.** R16.1/k0; Mathlib `Matrix.GeneralLinearGroup`.

**Sources.** [aky22], §1.2, pp. 3–4, K(n,λ) and generic λπ.

Embed K₀(pⁿ) and K₁(pⁿ) through the valuation-ring coefficient map as localK0(n) and localK1(n). Both are compact open and antitone, with common level-zero value GL₂(O), and localK1(n)⊆localK0(n). The API states these identities, inclusions, compactness and openness. At level one an upper unipotent with entry 1 belongs to both, a lower unipotent does not, and diag(u,1) belongs to localK1 even for u−1∉p. The Weyl element belongs at level zero and is excluded at level one. A scalar u with u−1∉p belongs to localK0(1) but not localK1(1); this test assumes such a residue unit, so it does not require one over F₂. These tests distinguish the last row and exclude principal congruence.

<a id="r16-1-local-adelic-compact-comparison"></a>

### local-adelic-compact-comparison: GL₂ local and adelic compact subgroups

For any number field F, identify the generic reductive group GL₂(Fv) with existing matrix units. At finite v the standard maximal compact is GL₂(Ov); at real v it is O(2); at complex v it is U(2). The adelic compact is their product, and its finite part is compact open in the restricted product with respect to GL₂(Ov). K₀(pvⁿ), K₁(pvⁿ) and finite products of these are compact open at finite places. All topology and restricted-product identifications are those of AA.1.

**Hypotheses.** F a number field; chosen place completions and valuation rings.

**Prerequisites.** R16.1/k0; R16.1/k1; Mathlib `Matrix.GeneralLinearGroup`; AA `AA.1/adelic-points`; AA `AA.1/adelic-points-locally-compact`; ReductiveGroupsPartII `RG2.0`; AF `AF.1`.

**Sources.** [jl70], §2 printed p. 12, compact-subgroup and Haar convention.

<a id="r16-1-iwasawa-cartan"></a>

### iwasawa-cartan: Rank-two Iwasawa and Cartan coordinates

Specialize RG2.4 at finite places and AF.1 at infinity: GL₂(Fv)=B(Fv)K_v. At a finite place every double coset K_v g K_v has a unique representative diag(ϖᵃ,ϖᵇ) with a≥b integers. With upper triangular B and normalized induction, δB(diag(a,d))=|a/d|v. At infinity use positive singular values and O(2)/U(2).

**Hypotheses.** Chosen uniformizer at finite v; upper triangular B.

**Prerequisites.** R16.1/local-adelic-compact-comparison; ReductiveGroupsPartII `RG2.4`; Mathlib `Matrix.GeneralLinearGroup.det`; AF `AF.1`.

**Sources.** [jl70], §3 formula (3.1) and following compact realization, printed p. 46.

<a id="r16-1-haar-quotient-comparison"></a>

### haar-quotient-comparison: Haar and central-character quotient comparison

Fix local measures dg_v on GL₂(Fv), vol(GL₂(Ov))=1 at finite places outside a specified finite set; form AA.0’s restricted Haar product. GL₂ is unimodular. For a continuous unitary idele-class character ω use AA.2’s quotient measure and central-character L² space on Z(𝔸)GL₂(F)\GL₂(𝔸): f(zγg)=ω(z)f(g), with finite integral of |f|². The matrix realization is an isometric right-translation-equivariant identification with AA.2/central-character-l2. Measures on elliptic centralizers are fixed separately, not inferred from dg_v.

**Hypotheses.** ω unitary and trivial on F×; quotient is formed by the closed subgroup specified by AA.2.

**Prerequisites.** R16.1/local-adelic-compact-comparison; AA `AA.0/restricted-haar-product`; AA `AA.2/central-character-l2`; Mathlib `MeasureTheory.Measure.haarMeasure`; Mathlib `MeasureTheory.Measure.haarMeasure_self`.

**Sources.** [jl70], §10 and §16 fixed central character.

<a id="r16-1-finite-level-comparison"></a>

### finite-level-comparison: Finite-level automorphic functions

At compact open Kf, the GL₂ finite-level space is the Kf-fixed subspace of AF.2’s automorphic forms with chosen central character, finite K∞ types and infinitesimal-character ideal. Using the finite double-coset decomposition GL₂(𝔸)=⊔GL₂(F)tᵢGL₂(F∞)Kf, restriction identifies it with the direct sum of classical spaces on Γᵢ\GL₂(F∞), with Γᵢ the corresponding arithmetic stabilizer. The central character, growth, differential and right-translation conditions are transported, not redefined. AL.0 owns additive Schwartz–Bruhat/Fourier theory; SR.1 owns the compactly supported smooth Hecke carrier.

**Hypotheses.** Kf compact open; finite type and finite-codimension annihilator data as in AF.2.

**Prerequisites.** R16.1/haar-quotient-comparison; AF `AF.2/automorphic-form`; AF `AF.2/adelic-classical-bijection`; AL `AL.0/adelic-schwartz-bruhat-space`; SR `SR.1`.

**Sources.** [jl70], Definition 10.2 and following cusp-form definition.

## R16.2. Local representations and newvectors

<a id="r16-2-local-classification"></a>

### local-classification: Explicit nonarchimedean classification

Over any nonarchimedean characteristic-zero local field F, with ν=|·|F and complex coefficients, normalized induction I(χ₁,χ₂)=Ind_B^G(χ₁⊗χ₂) is irreducible iff χ₁χ₂⁻¹≠ν,ν⁻¹. Its central character is χ₁χ₂. If χ₁=χν¹ᐟ², χ₂=χν⁻¹ᐟ², it has the essentially Steinberg subrepresentation St⊗χdet and one-dimensional quotient χdet; reversing the order reverses the sub/quotient. Every irreducible admissible representation is a character of determinant, irreducible principal series, essentially Steinberg, or supercuspidal. Infinite-dimensional irreducibles are generic; one-dimensional characters are not. These are explicit calculations in the SR.2 induction/Jacquet carriers and ET.6 classification, including residue characteristic two.

**Hypotheses.** Smooth, irreducible, admissible complex representations; χᵢ smooth quasicharacters.

**Prerequisites.** R16.1/iwasawa-cartan; SR `SR.2`; SR `SR.3`; SR `SR.2.3/whittaker-functionals`; ET `ET.6`.

**Sources.** [casselman73], p. 305, principal/special classification.

<a id="r16-2-newvector-level-exists"></a>

### newvector-level-exists: Existence of a nonzero newvector level

For an irreducible admissible infinite-dimensional complex smooth representation π of GL₂(F), with F a nonarchimedean local field of characteristic zero, there is n≥0 and a nonzero vector fixed by the last-row K₁(pⁿ). This assertion neither uses a conductor exponent nor asserts the dimension formula; it supplies the nonempty level set before its minimum is defined.

Use Mathlib's `IsNonarchimedeanLocalField`, its valuation ring and maximal ideal, and `Representation.invariants` for the embedded subgroup. Smoothness means every vector stabilizer is open; admissibility means the invariant subspace of every compact open subgroup is finite-dimensional. Irreducibility is Mathlib's `Representation.IsIrreducible`. These conditions specialize the SR.3 theory without introducing replacement representation or local-field carriers.

**Hypotheses.** Irreducible admissible infinite-dimensional complex smooth π; K₁ is the last-row subgroup over the valuation ring.

**Prerequisites.** R16.1/k1; R16.2/local-classification; Mathlib `Representation.invariants`; SR `SR.3`; SR `SR.2.3/whittaker-functionals`.

**Sources.** [casselman73], §1 Theorem 1, printed p. 302; its proof and subgroup decomposition, printed pp. 303–306.

<a id="r16-2-newvector-conductor"></a>

### newvector-conductor: The newvector conductor exponent

For irreducible admissible infinite-dimensional π of GL₂(F), c(π) is the least n≥0 for which π^{K₁(pⁿ)} is nonzero. Define the ideal conductor p^{c(π)}. The same least-level construction is available for an existing representation with an explicit nonempty level set. Existence for the stated π is the preceding newvectorLevelExists theorem, not a field stored in a replacement representation. This specializes fixed vectors.

**Hypotheses.** π generic, equivalently infinite-dimensional irreducible in characteristic zero; O,p and K₁ fixed.

**API.**

- `conductor_min`: π^{K₁(p^{c(π)})}≠0 and π^{K₁(pⁿ)}=0 for n<c(π).
- `conductor_iso`: Isomorphic local representations have equal conductor exponent.
- `conductor_unramified_twist`: An unramified χ has c(π⊗χdet)=c(π), since χdet is trivial on GL₂(O).

**Tests.**

- `conductor_unramified`: An irreducible unramified generic principal series has conductor zero.
- `conductor_steinberg`: An unramified Steinberg twist has conductor one.
- `conductor_ramified_steinberg`: For χ of conductor a≥2, c(St⊗χdet)=2a≠1+a. At a=1 both formulas give2, so that case alone would not detect the incorrect rule.

**Prerequisites.** R16.1/k1; R16.2/local-classification; Mathlib `Representation`; Mathlib `Representation.invariants`; SR `SR.3`; R16.2/newvector-level-exists.

**Sources.** [casselman73], Theorem 1 p. 302 and epsilon remark p. 307.

<a id="r16-2-casselman-newvector"></a>

### casselman-newvector: Casselman’s newvector theorem

For π as above and every n≥0, dimℂ π^{K₁(pⁿ)}=max(0,n−c(π)+1). The minimal fixed space is a line. In the lower-last-row convention it is the ωπ(d)-isotypic line for K₀(p^{c(π)}), with ωπ the central character, when c>0; at c=0 it is the spherical line. With ψ trivial on O but nontrivial on ϖ⁻¹O, Whittaker evaluation W↦W(1) is nonzero on this line. Casselman’s printed top-left central-character convention is transported through the dual/twist convention; it is not silently identified with the lower-last-row subgroup. The theorem has no odd-residue-characteristic restriction.

**Hypotheses.** Irreducible admissible infinite-dimensional complex π; ψ of conductor O; n natural.

**Prerequisites.** R16.2/newvector-conductor; R16.2/local-classification; R16.1/k0; R16.1/k1; SR `SR.2.3/whittaker-functionals`; AL `AL.2`.

**Sources.** [casselman73], Theorem 1, printed p. 302; Corollary to the Proof, printed p. 306; Kirillov construction in the proof, printed pp. 303–306.

<a id="r16-2-normalized-newvector"></a>

### normalized-newvector: The normalized Whittaker newvector

For generic irreducible π and the chosen conductor-O ψ, take the unique K₁(p^{c(π)})-fixed vector in the Whittaker model of SR.2.3/whittaker-functionals with W(1)=1. Equivalently, in the existing fixed line and its Whittaker functional λ, choose the unique v with λ(v)=1. No arbitrary vector is made canonical before fixing ψ and λ. For an unramified determinant twist χ, Wχ(g)=χ(det g)W(g) under the corresponding Whittaker identification.

**Hypotheses.** The fixed line is one-dimensional and λ restricts nontrivially; the Whittaker model and functional are supplied by SR.2.3/whittaker-functionals.

**API.**

- `normalizedNewvector_fixed`: vnew is fixed by K₁(p^{c(π)}).
- `normalizedNewvector_eval`: λ(vnew)=1.
- `normalizedNewvector_unique`: Every fixed v with λ(v)=1 equals vnew.
- `normalizedNewvector_twist`: An unramified twist identifies Wnew with χ(det g)Wnew(g).

**Tests.**

- `normalizedNewvector_line`: For V=ℂ and λ(z)=2z the normalized vector is 1/2.
- `normalizedNewvector_rescale`: Replacing λ by aλ with a≠0 changes vnew to a⁻¹vnew.
- `normalizedNewvector_zero_functional`: The zero functional admits no vector of value one; it fails the input hypothesis.

**Prerequisites.** R16.2/casselman-newvector; Mathlib `Representation.invariants`; SR `SR.2.3/whittaker-functionals`.

**Sources.** [jl70], §11 following Proposition 11.1.1, printed p. 183; normalize the spherical local function at e.

<a id="r16-2-spherical-whittaker-values"></a>

### spherical-whittaker-values: The spherical Whittaker values

For an unramified generic principal series with unitary-normalized Satake parameters α=χ₁(ϖ), β=χ₂(ϖ), define h₀=1, h₁=α+β and hₘ₊₂=(α+β)hₘ₊₁−αβhₘ. The normalized spherical Whittaker function has W(diag(ϖᵐ,1))=q^{-m/2}hₘ for m≥0 and zero for m<0. This polynomial recurrence includes α=β; the expression (α^{m+1}−β^{m+1})/(α−β) is used only when α≠β.

**Hypotheses.** Unramified generic π and ψ conductor O; q the residue cardinality.

**API.**

- `sphericalValues_zero`: h₀(α,β)=1.
- `sphericalValues_recurrence`: hₘ₊₂=(α+β)hₘ₊₁−αβhₘ.
- `sphericalValues_swap`: hₘ(α,β)=hₘ(β,α).
- `sphericalValues_equal`: hₘ(α,α)=(m+1)αᵐ.

**Tests.**

- `sphericalValues_one`: h₁=α+β.
- `sphericalValues_two`: h₂=α²+αβ+β².
- `sphericalValues_collision`: h₂(1,1)=3, not an undefined quotient.

**Prerequisites.** R16.2/normalized-newvector; SR `SR.4`; SR `SR.2.3/whittaker-functionals`.

**Sources.** [jl70], §3 spherical functions and unramified zeta calculation.

<a id="r16-2-iwahori-oldforms"></a>

### iwahori-oldforms: The characteristic-zero Iwahori oldforms

Let π be complex, irreducible, smooth, admissible, infinite-dimensional and spherical over a characteristic-zero nonarchimedean local field F. Write K=GL₂(O), I=K₀(p). Then dim πᴷ=1 and dim πᴵ=2. With vol(I)=1, U=[I diag(ϖ,1) I] and spherical eigenvalue λ=√q(α+β), every nonzero spherical v is cyclic for U on πᴵ. Its polynomial is X²−λX+qαβ, including α=β.

**Fixed-space comparison.** The compact-open signatures supply the admissibility inputs. `localK0_invariants_eq_localK1` identifies the fixed submodules at every level when integral scalar units act trivially. The API decomposes every K₀ element as an integral scalar times a K₁ element, using the lower-right unit at positive level and scalar 1 at zero. In an irreducible spherical representation, these scalars fix a nonzero spherical vector and hence its GL₂(F)-span. If an integral scalar acts by a≠1 and K₁ has a nonzero fixed vector, K₀ has none; this tests the scalar-action hypothesis.

Choose residue representatives A⊂O; set gₐ=(ϖ a;0 1). Then U=∑ₐπ(gₐ), with |A|=q. Set s=diag(1,ϖ), c=ω(ϖ)=αβ. On πᴷ, the spherical double coset acts as T=U+π(s). From Tv=λv and π(ϖI₂)=c, the basis (v,π(s)v) gives Uv=λv−π(s)v and Uπ(s)v=qc v. Thus πᴵ=span(v,Uv), Uv is not proportional to v, and U²−λU+qc=0 on πᴵ. `iwahoriOldforms` uses these matrices and Mathlib invariant submodules.

**Tests.** For (2 1;−1 0), U−1 is nonzero and square-zero, testing repeated roots. The matrix (5 6;−1 0) satisfies X²−5X+6, and fails X²−5X+3. For unramified χdet on ℂ both invariant spaces are the whole line, of dimension one, even when χ≠1 (`iwahoriDeterminantCharacter`). Thus “not trivial” cannot replace infinite dimensionality.

**Prerequisites.** R16.2/casselman-newvector; R16.2/spherical-whittaker-values; SR `SR.1`; SR `SR.4`; Mathlib `Representation.invariants`.

**Sources.** [cg20], §1.3, printed pp. 805–806; [casselman73], Corollary to the Proof, printed p. 306.

<a id="r16-2-supercuspidal-kirillov"></a>

### supercuspidal-kirillov: The supercuspidal Kirillov comparison

For irreducible supercuspidal π with central character ω and nontrivial ψ, restricting the imported Whittaker function W to diag(x,1), x∈F×, identifies its Kirillov realization with C_c^∞(F×,ℂ). For b=(a u;0 d), the action is (π(b)f)(x)=ω(d)ψ(xu/d)f(xa/d). The Weyl action is the imported local functional equation; it is not a freely chosen transform. For the DLB variant, F=ℚp, ω=1 and π is defined over a finite extension L/ℚp. Put L∞=colim_n(L⊗_{ℚp}ℚp(μ_{pⁿ})) and Γ=Gal(ℚp(μ_{p∞})/ℚp), acting on the second factor. Give the smooth mirabolic realization on compactly supported locally constant functions φ:ℚp×→L∞ with φ(ax)=σ_a(φ(x)) for a∈ℤp×, where σ_a is the cyclotomic action. Its extension of scalars to L∞ is the ordinary Kirillov model using a chosen compatible p-power-root additive character. This coefficient-descent statement is additional to complex Whittaker multiplicity one. Locally analytic Kirillov–Colmez theory belongs to R30.

**Hypotheses.** Smooth characteristic-zero supercuspidal; additive-character and central-character choices visible.

**Prerequisites.** R16.2/local-classification; SR `SR.2.3/whittaker-functionals`; AL `AL.0/local-schwartz-bruhat-space`; AL `AL.2`.

**Sources.** [casselman73], p. 302, equation (1.2). [dlb17], §7.5, Remark 7.10, printed p. 39; §11.2, proof of Theorem 11.7, printed p. 62, for the L∞/Γ smooth comparison.

<a id="r16-2-henniart-unicity"></a>

### henniart-unicity: Henniart’s unicity of supercuspidal types

For the inertial class s of an irreducible supercuspidal π of GL₂(F), there is a unique isomorphism class of irreducible GL₂(O)-representation σ typical for s. It occurs with multiplicity one in every π⊗χdet with χ unramified. If σ occurs in an irreducible admissible π′, then π′≅π⊗χdet for an unramified χ. The type carrier and Bernstein inertial equivalence belong to SR.3/ET.6. No uniqueness is asserted for an arbitrary nonminimal K-constituent.

**Hypotheses.** Characteristic-zero algebraically closed coefficients; nonarchimedean F, including dyadic fields.

**Prerequisites.** R16.2/local-classification; SR `SR.3`; ET `ET.6`.

**Sources.** [bm02], Appendix A.1.4–A.1.5(1), pp. 75–76; A.3.

<a id="r16-2-supercuspidal-projective"></a>

### supercuspidal-projective: Supercuspidals in a fixed central-character category

A supercuspidal complex representation of GL₂(F) with fixed smooth central character ω is projective in the abelian category of smooth representations on which the center acts by ω. The DLB application is F=ℚp, ω=1, and characteristic-zero L coefficients with the required scalar extension. The category fixes ω and has characteristic-zero coefficients.

Concretely, let F be a finite extension of ℚp with its local-field topology,
G=GL₂(F), and Z its scalar center. Let π, σ and τ be complex representations
of G, each with open stabilizers for every vector, and with
ρ(zI)v=ω(z)v for the same character ω:F×→ℂ× with open kernel. Require π to
be irreducible and admissible: its invariants under every compact open subgroup
are finite-dimensional. Its supercuspidal condition can be expressed intrinsically
on this carrier. For v∈π and every linear functional λ whose stabilizer under
the contragredient action is open, the image of
{g∈G : λ(π(g)v)≠0} in G/Z has compact closure. This is the
compact-mod-center matrix-coefficient characterization; it only tests functionals
in the smooth dual. It imposes no normed or locally analytic topology on π.

For any surjective G-equivariant complex-linear map q:σ→τ and any
G-equivariant complex-linear map f:π→τ, construct a G-equivariant complex-linear
map h:π→σ with q∘h=f. Surjectivity of an underlying map of sets is insufficient
to discharge the conclusion: the lift must belong to the existing space of
intertwining maps. Taking τ=π and f the identity gives the splitting of every
surjection onto π. The source π is admissible and supercuspidal; the other two
smooth representations need neither be irreducible nor admissible.

Use SR.3.2's supercuspidal block decomposition and matrix-coefficient projector in SR.0's fixed-character subcategory. Fixing ω restricts unramified twists to those with trivial square on the center; in characteristic zero this gives a semisimple block and the equivariant lift. The L-coefficient Kirillov comparison retains its scalar-descent requirement.

**Hypotheses.** Fixed smooth central character; complex coefficients; F/ℚp finite;
smoothness of all three representations; admissibility, irreducibility and the
compact-mod-center coefficient condition for π. The category is SR.0’s
fixed-character subcategory.

**Prerequisites.** R16.2/henniart-unicity; SmoothRepresentationsOfLocalGroups
`SR.0:abelian-category`, `SR.3a.1:compact-representations` and
`SR.3.2:cuspidal-splitting`. This target specializes their complex smooth
representation theory to the fixed-character GL₂ category.

**Sources.** [dlb17], p. 64, footnote 52, for the fixed-character projectivity
application. [bz76], Theorem 3.21, pp. 34–35, for the coefficient
characterization; Theorem 2.44, p. 28, and Proposition 3.28, pp. 36–37,
for the decomposition used by the supercuspidal block argument.

<a id="r16-2-cdt-vexing-type"></a>

### cdt-vexing-type: The Conrad–Diamond–Taylor vexing type

Let x≠ℓ be a vexing prime: x≡−1 mod ℓ, residual local rank-two representation irreducible but its inertia restriction reducible; its conductor c_x=2n. From CDT’s regular character θ of the unramified quadratic extension with conductor xⁿ construct Θ(θ), an existing finite-group representation of GL₂(ℤ/xⁿℤ), and choose a stable O-lattice for a characteristic-zero coefficient field containing its values. The local selector σ_x is Θ(θ) restricted to the exact U_x/V_x used by CDT §5 (U₀(x)/U(xⁿ) in the vexing case), not an arbitrary type on that quotient. The larger GL₂ quotient representation Wσx in CG18 restricts to this selector.

**Hypotheses.** x and ℓ distinct primes; regular θ, θ≠θ^Frob; coefficient field contains values; choose an invariant lattice.

**API.**

- `cdtVexingType_restrict`: The selector is the restriction of Θ(θ) to U₀(x)/U(xⁿ).
- `cdtVexingType_lattice`: The chosen O-lattice is stable and scalar extension recovers Θ(θ).
- `cdtVexingType_unramified`: An unramified twist leaves the compact type and its selector unchanged.

**Tests.**

- `cdtVexingType_scalar_extension`: The lattice tensored with the coefficient field is isomorphic to Θ(θ).
- `cdtVexingType_distinct_inertia`: A local representation with inertial characters not θ,θ^Frob has no occurrence of the full Θ(θ) type.
- `cdtVexingType_unramified_twist`: π and π⊗ξdet for unramified ξ have equal Θ(θ) occurrence multiplicity.

**Prerequisites.** R16.2/henniart-unicity; ET `ET.6`; R01 `R01.1/compact-subgroups-stabilise-lattices`.

**Sources.** [cg18], §3.9.2 construction Wσx; CDT §5.1 p. 18.

<a id="r16-2-iwahori-center"></a>

### iwahori-center: The GL₂ Iwahori center

For the upper Iwahori I and a characteristic-zero coefficient ring in which q and q+1 are invertible, normalize vol(I)=1 and eK=1_K/vol(K). Put U₀=1_{I diag(ϖ,ϖ) I} and U₁=1_{I diag(ϖ,1) I}. The center of H(G,I) is the Laurent polynomial algebra in U₀^{±1} and z₁=U₁+qU₀U₁⁻¹. Multiplication by eK identifies it with the spherical algebra H(G,K), sending U₀ to T₀ and z₁ to T₁, with normalized spherical identity eK. Coefficient extensions used in BCGP invert p and the required idempotent denominators. The rank-independent Bernstein center and its parahoric comparison are imported from SR.4; the target here is the rank-two calculation.

**Hypotheses.** q is a unit; eK requires the I-index q+1 to be a unit; U₁ has its usual invertibility in the affine Hecke algebra.

**Prerequisites.** R16.1/k0; SR `SR.1`; SR `SR.4`.

**Sources.** [bcgp21], Lemma 2.4.15, pp. 178–179; HKP §4.6 (4.6.1); [hkp10], §2.3 Lemma 2.3.1; §4.6 equation (4.6.1).

<a id="r16-2-archimedean-classification"></a>

### archimedean-classification: The explicit archimedean GL₂ cases

Import the existing AF.1/weil-group-real, AF.1/archimedean-llc-gln and AF.1/casselman-wallach-globalization nodes of the single AF real-representation owner. For GL₂(ℝ), real reducible parameters χ₁⊕χ₂ correspond to the appropriate Langlands quotient of normalized induction, including its finite-dimensional exceptional quotients. An irreducible parameter Ind_{ℂ×}^{Wℝ}((z/|z|)^m|z|^{2t}), integer m≥1, corresponds to D_{m+1}⊗|det|^t, the full O(2) representation whose positive-determinant restriction has holomorphic and antiholomorphic pieces. For m=0 the parameter splits and one obtains the limit boundary; it is not an irreducible Weil parameter. For GL₂(ℂ), every parameter is a pair of continuous quasicharacters and the representation is the corresponding Langlands quotient; GL₂(ℂ) has no discrete series modulo center.

**Hypotheses.** Admissible irreducible Harish–Chandra modules with their Casselman–Wallach globalizations; explicit chamber/order in a Langlands quotient.

**Prerequisites.** AF `AF.1/weil-group-real`; AF `AF.1/gl2-real-discrete-series`; AF `AF.1/archimedean-llc-gln`; AF `AF.1/casselman-wallach-globalization`.

**Sources.** [jl70], §5 Lemmas 5.6–5.7; §6 Lemma 6.1, beginning printed p. 110.

## R16.3. Local parameters and factors

<a id="r16-3-principal-series-parameter"></a>

### principal-series-parameter: Principal-series parameters and factors

For F/ℚp finite, with Art_F:F×≃W_Fᵃᵇ the topological Weil-group reciprocity isomorphism normalized by Art_F(ϖ)=Φ geometric and ν(ϖ)=q⁻¹, rec(I(χ₁,χ₂))=(χ₁∘Art_F⁻¹)⊕(χ₂∘Art_F⁻¹), N=0, for an irreducible normalized principal series. Thus det rec=ωπ∘Art_F⁻¹ and L(s,π)=L(s,χ₁)L(s,χ₂). A ramified character contributes 1. At the reducible ratio ν^{±1}, this is the parameter of the one-dimensional Langlands quotient; the generic Steinberg constituent instead has nonzero N as below. The statement uses Frobenius-semisimple Weil–Deligne parameters, not semisimplification that discards N.

**Hypotheses.** Characteristic-zero nonarchimedean F; χ₁χ₂⁻¹≠ν^{±1} in the principal-series assertion. Art_F⁻¹ is evaluated on the topological Weil abelianization supplied by CFT Layer9, not on the absolute Galois abelianization of Layer7.

**Prerequisites.** R16.2/local-classification; ET `ET.6`; R01 `R01.2/weil-deligne-representation`; ClassFieldTheory Layer 7; AL `AL.1`; AL `AL.2`; ClassFieldTheory Layer 9.

**Sources.** [nt26], §1.2 printed p. 8, ArtK and recK.

<a id="r16-3-steinberg-monodromy"></a>

### steinberg-monodromy: Steinberg monodromy and its factors

For π=St⊗χdet, choose a basis e₁,e₂ of the existing rank-two parameter with Ne₂=e₁, Ne₁=0 and r(Φ)=diag(αq⁻¹ᐟ²,αq¹ᐟ²), α=χ(ϖ). For general w the diagonal characters are χ_Wν_W^{1/2},χ_Wν_W^{−1/2}, so r(w)Nr(w)⁻¹=ν_W(w)N. This gives det r=χ_W², L(s,π)=L(s+1/2,χ), and a(π)=1 when χ is unramified, 2a(χ) otherwise. In particular the invariant kernel of N, not all inertia invariants of r, defines L. An unramified twist preserves N and the conductor.

**Hypotheses.** Geometric Frobenius convention; choose the positive real square root of q for unitary normalization.

**Prerequisites.** R16.3/principal-series-parameter; R16.2/casselman-newvector; ET `ET.6`; R01 `R01.2/weil-deligne-representation`; R01 `R01.3/conductor-of-a-weil-deligne-representation`; AL `AL.2`.

**Sources.** [casselman73], p. 307 epsilon remark and special-representation calculation.

<a id="r16-3-supercuspidal-parameter"></a>

### supercuspidal-parameter: Supercuspidal parameters including wild cases

rec identifies supercuspidal GL₂(F) representations with irreducible two-dimensional Weil representations, with N=0; determinants, character twists, conductors and L/epsilon factors agree with the existing parameter conventions. Such a parameter has no inertia-fixed vector, hence its standard L-factor is 1. A quadratic induction gives a dihedral example when θ≠θ^σ, but this is not an exhaustive description at dyadic places: primitive wild parameters remain in the ET.6 carrier and use the full Swan conductor. R30’s p-adic Banach correspondence is a separate consumer.

**Hypotheses.** All finite extensions of ℚp, including p=2; smooth characteristic-zero correspondence.

**Prerequisites.** R16.2/supercuspidal-kirillov; ET `ET.6`; R01 `R01.2/weil-deligne-representation`; R01 `R01.3/conductor-of-a-weil-deligne-representation`; AL `AL.2`.

**Sources.** [nt26], §2 after Definition 2.4, printed p. 11.

<a id="r16-3-tate-unitary-normalization"></a>

### tate-unitary-normalization: The Tate and unitary normalization bridge

For rank two, recᵀ_F(π)=rec_F(π⊗ν^{-1/2})=rec_F(π)⊗ν_W^{-1/2}. At geometric Φ this multiplies Frobenius by q^{1/2}, multiplies determinant by ν_W^{-1}, preserves N and Artin conductor, and shifts standard factors by L(s,recᵀπ)=L(s−1/2,rec π), likewise epsilon factors with fixed ψ and Haar choices. The rank-two Tate normalization therefore has determinant ωπ·ν_W^{-1}, not ωπ. Frobenius inversion in an arithmetic convention must be applied to the entire WD datum, including the relation for N; it is not this half-twist.

**Hypotheses.** Fixed rec convention compatible with character Artin reciprocity; nonarchimedean ν_W(Φ)=q⁻¹.

**Prerequisites.** R16.3/principal-series-parameter; R16.3/steinberg-monodromy; R16.3/supercuspidal-parameter; ET `ET.6`; R01 `R01.2/weil-deligne-representation`; AL `AL.2`.

**Sources.** [nt26], §1.2 printed p. 8, normalization identity.

<a id="r16-3-conductor-epsilon-comparison"></a>

### conductor-epsilon-comparison: Conductor, twists and additive-character change

For every generic irreducible π, c(π)=a(rec π), with the same value for recᵀ. With ψ of conductor O and self-dual additive measure, ε(s,π,ψ)=ε(1/2,π,ψ)q^{-c(π)(s−1/2)}. For ψ_a(x)=ψ(ax), ε(s,π,ψ_a)=ωπ(a)|a|^{2s−1}ε(s,π,ψ); the measure is changed to the corresponding self-dual one. An unramified twist by ν^t replaces s by s+t and leaves c unchanged. For a ramified χ, one uses the full tensor-parameter conductor; c(π⊗χdet) is not generally c(π)+2a(χ).

**Hypotheses.** Use normalized AL.2 epsilon factors, not an unnormalized Fourier measure; π generic and characteristic zero.

**Prerequisites.** R16.2/newvector-conductor; R16.3/steinberg-monodromy; R16.3/supercuspidal-parameter; R16.3/tate-unitary-normalization; R01 `R01.3/conductor-of-a-weil-deligne-representation`; AL `AL.1`; AL `AL.2`.

**Sources.** [casselman73], p. 307 remark following the Corollary to the Proof.

<a id="r16-3-archimedean-factor-comparison"></a>

### archimedean-factor-comparison: The archimedean GL₂ factors

Use Γℝ(s)=π^{−s/2}Γ(s/2), Γℂ(s)=2(2π)^{−s}Γ(s). For a real character sign^ε|·|^u the factor is Γℝ(s+u+ε). For Ind_{ℂ×}^{Wℝ}((z/|z|)^m|z|^{2t}), m≥1, the factor is Γℂ(s+t+m/2); thus L(s,D_k)=Γℂ(s+(k−1)/2) for k≥2. At m=0 its split parameter has Γℝ(s+t)Γℝ(s+t+1)=Γℂ(s+t), without making it an irreducible Weil representation. Over ℂ, a character (z/|z|)^m|z|^{2t} has Γℂ(s+t+|m|/2), and the rank-two factor is the product. With ψℝ(x)=exp(2πix), the real-character epsilon is i^ε and the induced epsilon is i^{m+1}; complex places use ψℂ=ψℝ∘Trℂ/ℝ and AL.1’s convention.

**Hypotheses.** Archimedean local reciprocity, absolute value |z|ℂ=|z|², gamma and additive-character conventions fixed.

**Prerequisites.** R16.2/archimedean-classification; AF `AF.1/archimedean-llc-gln`; AL `AL.1`; AL `AL.2`.

**Sources.** [jl70], §5 printed pp. 96–97, explicit character L/epsilon formulas and induced-real factor.

<a id="r16-3-tamely-dihedral"></a>

### tamely-dihedral: Tamely dihedral representations of prime order

For odd prime ℓ with q≡−1 mod ℓ, an irreducible admissible π is tamely dihedral of order ℓ precisely when rec π=(Ind_{W_{F′}}^{W_F}θ,0), where F′/F is unramified quadratic and θ|I has exact order ℓ. Use the imported induced Weil representation and class of π; no second automorphic or WD carrier is defined. Induction is from W_{F′} to W_F. Since ℓ is prime to the residue characteristic, the inertia character is tame.

**Hypotheses.** ℓ odd prime, q residue cardinality and q≡−1 mod ℓ; θ continuous with open kernel on inertia.

**API.**

- `tamelyDihedral_parameter`: Membership is equivalent to the stated induced parameter with exact inertia order ℓ and N=0.
- `tamelyDihedral_unramified_twist`: An unramified determinant twist preserves tamely-dihedral order ℓ.
- `tamelyDihedral_conjugate`: Replacing θ by θ^σ gives the same induced parameter.

**Tests.**

- `tamelyDihedral_order_three`: At q=2, ℓ=3, an inertia character of order three satisfies θ^q=θ^{-1}≠θ.
- `tamelyDihedral_order_two_excluded`: ℓ=2 fails oddness and θ^{-1}=θ for order-two inertia, so this irreducibility argument fails.
- `tamelyDihedral_unramified_character`: An unramified θ has inertia order one and is not tamely dihedral of order ℓ>2.

**Prerequisites.** R16.3/supercuspidal-parameter; ET `ET.6`; R01 `R01.2/weil-deligne-representation`; Tau Ceti `TauCeti.simple_indFDRep_ofLinearCharacter_iff`.

**Sources.** [nt26], Definition 2.4 and following paragraph, printed p. 11.

<a id="r16-3-tamely-dihedral-supercuspidal"></a>

### tamely-dihedral-supercuspidal: The tamely dihedral supercuspidality consequence

Every tamely dihedral π of odd prime order ℓ is supercuspidal. Its parameter is irreducible, has N=0 and Swan conductor zero; since inertia has no fixed vector, a(rec π)=2 and L(s,π)=1. The exact-order argument works also at residue characteristic two, because ℓ is odd and prime to q.

**Hypotheses.** The complete hypotheses of tamelyDihedral, including q≡−1 mod ℓ.

**Prerequisites.** R16.3/tamely-dihedral; R16.3/supercuspidal-parameter; R01 `R01.3/conductor-of-a-weil-deligne-representation`; ET `ET.6`.

**Sources.** [nt26], Paragraph immediately after Definition 2.4.

<a id="r16-3-cdt-inertia-multiplicity"></a>

### cdt-inertia-multiplicity: The CDT inertial comparison and multiplicity one

For CDT’s regular θ of conductor xⁿ, write Θ(θ) for its full GL₂(ℤ/xⁿℤ) type. For infinite-dimensional irreducible admissible Π of GL₂(ℚx), Hom_K(Θ(θ),Π^{U(xⁿ)})≠0 iff rec Π|I≅θ∘η_{x²} ⊕ θ∘Frob∘η_{x²} in CDT’s reciprocity convention. In that case Π^{U(xⁿ)}≅Θ(θ) and the type multiplicity is one. Translate the Artin convention to R16.3. This comparison concerns the full K-type; its U₀(x) restriction used as a vexing selector can identify more than one finite-character twist. The special case in CDT’s surrounding discussion is translated with N retained, not as an N=0 parameter.

**Hypotheses.** x≠ℓ; regular θ and coefficient field containing its values; principal congruence U(xⁿ), full compact type. Use CFT Layer9 Weil reciprocity for ℚx and its unramified quadratic extension; Layer7 supplies the compatible absolute/finite-quotient map, not an inverse on all of G_Fᵃᵇ.

**Prerequisites.** R16.2/cdt-vexing-type; R16.2/henniart-unicity; R16.3/supercuspidal-parameter; ET `ET.6`; R01 `R01.2/weil-deligne-representation`; ClassFieldTheory Layer 7; ClassFieldTheory Layer 9.

**Sources.** [cdt99], Lemma 4.2.4(3), printed pp. 17–18.

## R16.4. Global cuspidal representations

<a id="r16-4-cuspidal-tensor-factorization"></a>

### cuspidal-tensor-factorization: The cuspidal restricted tensor factorization

For unitary central character ω trivial on F×, the smooth K∞-finite cuspidal spectrum in AA.2’s L² space is AS.4’s algebraic Hilbert-direct-sum decomposition with finite multiplicities. Every irreducible constituent has the AF.2 restricted tensor factorization ⊗′vπv, with spherical distinguished vectors at almost all finite v. Identify this algebraic factorization with the corresponding smooth vectors of its Hilbert completion and with the Whittaker tensor model. Multiplicity one is proved below; it is not assumed in this comparison. Nonunitary cuspidal representations are handled after an specified norm twist.

**Hypotheses.** F number field; central character unitary for L²; admissible local factors and AF.2 distinguished-vector data.

**Prerequisites.** R16.1/finite-level-comparison; R16.2/normalized-newvector; AF `AF.2/restricted-tensor-product`; AS `AS.4`; AA `AA.2/central-character-l2`; AL `AL.3/global-whittaker-factorization`.

**Sources.** [jl70], §11 product formula (11.1.2), printed p. 183.

<a id="r16-4-global-whittaker-expansion"></a>

### global-whittaker-expansion: The global GL₂ Whittaker expansion

Fix nontrivial ψ:F\𝔸→ℂ× and additive Haar mass vol(F\𝔸)=1. For a smooth K∞-finite cuspidal φ, Wφ(g)=∫_{F\𝔸}φ(n(x)g)ψ(−x)dx and φ(g)=Σ_{a∈F×}Wφ(diag(a,1)g), with the convergence appropriate to smooth cusp forms, locally uniform after the stated differentiability/growth estimates. The coefficient map is injective and equivariant. Specialize AL.3’s general GLn Fourier–Whittaker expansion; the GL₂ unipotent has a single additive coordinate. This declaration is in R16.4, upstream of both multiplicity and the integral comparison.

**Hypotheses.** Cuspidality supplies zero constant term; smooth automorphic form with imported growth estimates; global ψ and compatible self-dual local measures.

**Prerequisites.** R16.4/cuspidal-tensor-factorization; AL `AL.0/adelic-schwartz-bruhat-space`; AL `AL.3/gln-fourier-expansion`; SR `SR.2.3/whittaker-functionals`.

**Sources.** [jl70], Proposition 11.1.1 proof, printed pp. 182–183.

<a id="r16-4-global-multiplicity-one"></a>

### global-multiplicity-one: GL₂ global multiplicity one

Every irreducible cuspidal automorphic GL₂(𝔸F) representation occurs with multiplicity one in the smooth cuspidal spectrum with its central character. The Whittaker coefficient identifies its realization with the restricted tensor product of the local Whittaker models, uniquely once ψ and almost-all spherical normalizations are fixed. Equivalently, two equivariant embeddings of the same irreducible representation into the cusp space are scalar multiples.

**Hypotheses.** Number field F; characteristic-zero automorphic forms; unitary twist when working inside L².

**Prerequisites.** R16.4/global-whittaker-expansion; R16.4/cuspidal-tensor-factorization; SR `SR.2.3/whittaker-functionals`; AS `AS.4`; AL `AL.3/global-multiplicity-one`.

**Sources.** [jl70], Proposition 11.1.1, printed p. 183; [cogdell-fields], Lecture 4 §3, Theorem 4.2 and proof, printed pp.33–34 (PDF pp.37–38).

<a id="r16-4-strong-multiplicity-one"></a>

### strong-multiplicity-one: GL₂ strong multiplicity one

Let π,π′ be cuspidal automorphic representations of GL₂(𝔸F). If there is a finite set S of finite places containing their ramification and πv≅π′v for every finite v outside S, then π≅π′ globally, including every v in S and every infinite place. Equality at a density-one subset is not substituted for this cofinite condition. At an unramified place, equality means the unordered Satake pair, equivalently both standard Hecke trace and determinant data, not a single incomplete eigenvalue without central character.

**Hypotheses.** Cuspidal GL₂ over a number field; isomorphism at all finite places outside one finite set.

**Prerequisites.** R16.4/global-multiplicity-one; AL `AL.3/strong-multiplicity-one`; Tau Ceti `HeckeRing.GL2.Newform.eq_of_forall_notMem_eigenvalue_eq`.

**Sources.** [cogdell-fields], Theorem9.3 and proof, printed pp.74–75 (PDF pp.78–79); [casselman73], §2 Theorem 2 and proof, printed pp. 307–308.

<a id="r16-4-cohomological-rationality"></a>

### cohomological-rationality: Cohomological rationality and coefficient fields

For regular algebraic cuspidal GL₂ representations, import AF.4’s rationality field Q(π), the fixed field of automorphisms preserving the finite-part isomorphism class, and Clozel’s finite-part Q(π)-model. Specialize its semilinear Galois conjugation to the GL₂ Hecke operators and algebraic infinitesimal character. For a holomorphic newform f of weight k≥2 over ℚ, make this comparison for π_alg=π_f⊗|det|^{−(k−2)/2}, where π_f is unitary: the unnormalized spherical T₁ eigenvalue is a_p and T₀ eigenvalue is χ(p)p^{k−2}. Then Q(π_alg) is the field generated by the normalized newform coefficients and compatible nebentypus values. A claim about the field generated by raw unitary Satake roots is not this rationality theorem. Neither periods nor an integral lattice are canonical. Étale/cohomological rationality and Galois realization required by R19 belong to that geometric owner.

**Hypotheses.** Regular algebraic cuspidal π; distinguish field of rationality from a field of definition before invoking AF.4. Use the algebraic determinant twist just displayed in the holomorphic comparison; regular algebraicity is not inferred from arbitrary unitary normalization.

**Prerequisites.** R16.4/strong-multiplicity-one; AF `AF.4/rationality-field`; AF `AF.4/clozel-rationality`; ModularForms Layer 8; ModularForms Layer 8G.

**Sources.** [nt26], §1.2 printed pp. 8–9, regular algebraic weights and conjugation.

<a id="r16-4-non-cm-self-twists"></a>

### non-cm-self-twists: The non-CM self-twist condition

On the existing cuspidal GL₂ isomorphism classes, non-CM means that π⊗χdet≅π implies χ=1 for every Hecke character χ of F×\𝔸×. This is the self-twist formulation used by NT; it defines a subset of the AF.2 carrier rather than a second automorphic representation. Central characters imply any self-twist has χ²=1. Any specified nontrivial quadratic stabilizer excludes the class. R17.4’s automorphic-induction comparison consumes this self-twist definition; no automorphic-induction theorem is required to define it.

**Hypotheses.** Cuspidal GL₂ class and the imported determinant-twist action; all Hecke characters, not only unramified ones.

**API.**

- `nonCM_iff`: π is non-CM iff every character fixing its isomorphism class is trivial.
- `nonCM_twist`: Twisting π by any Hecke character preserves non-CM.
- `nonCM_self_twist_square`: Every self-twist χ of a rank-two π satisfies χ²=1 by comparison of central characters.

**Tests.**

- `nonCM_free_action`: For the multiplication action of a group on itself every stabilizer is trivial.
- `nonCM_trivial_character`: The character χ=1 does not violate non-CM.
- `nonCM_quadratic_stabilizer`: A class fixed by a specified nonidentity quadratic character is not non-CM.

**Prerequisites.** R16.4/cuspidal-tensor-factorization; AF `AF.2`; AL `AL.3`.

**Sources.** [nt26], Lemma 2.1 introductory hypothesis, printed p. 9.

## R16.5. Whittaker integrals and analytic recognition

<a id="r16-5-whittaker-integral-comparison"></a>

### whittaker-integral-comparison: The GL₂ Whittaker Mellin comparison

For factorizable cusp φ and Wφ=⊗vWv, the integral ∫_{F×\𝔸×}φ(diag(a,1))χ(a)|a|^{s−1/2}d×a unfolds to ∫_{𝔸×}Wφ(diag(a,1))χ(a)|a|^{s−1/2}d×a and factors into the AL.2 local Whittaker zeta integrals in a common right half-plane. At unramified places with normalized spherical Wv the factor is L(s,πv⊗χv); at ramified places a imported test vector realizes the L-factor, rather than every newvector doing so for every ramified twist. Compare this integral with AL.2’s Godement–Jacquet standard factor and AL.3’s GL₂×GL₁ Rankin–Selberg integral, using their shared LLC normalization.

**Hypotheses.** Cuspidal φ, Hecke character χ; factorizable measures with standard unit volume at almost all finite places; absolute convergence first.

**Prerequisites.** R16.4/global-whittaker-expansion; R16.2/spherical-whittaker-values; R16.2/normalized-newvector; AL `AL.0/adelic-schwartz-bruhat-space`; AL `AL.1`; AL `AL.2`; AL `AL.3`.

**Sources.** [jl70], Theorem11.1 printed p.180; formula (11.1.2) and its Euler product, printed pp.183–184; Lemma11.1.3 printed p.184.

<a id="r16-5-full-gl2-converse"></a>

### full-gl2-converse: The GL₂ converse theorem with all twists

Let Π=⊗′vΠv be an irreducible admissible generic GL₂(𝔸F) tensor, with central character trivial on F×, spherical almost everywhere and the JL uniform exponent bound at the unramified principal-series places so its standard and dual Euler products converge absolutely in a right half-plane. At infinity use genuine irreducible admissible Harish–Chandra modules and their Casselman–Wallach globalizations. Suppose for EVERY Hecke quasicharacter χ, the completed L(s,Π⊗χdet) and L(s,Π̃⊗χ⁻¹det) extend to entire functions, are bounded in every vertical strip outside the standard excluded neighborhoods (here there are no poles), and satisfy L(s,Π⊗χ)=ε(s,Π⊗χ,ψ)L(1−s,Π̃⊗χ⁻¹). Then Π is cuspidal automorphic. Finite-order, unramified-only or one fixed-conductor twists are not substituted for this family. One-dimensional local constituents are excluded by genericity/infinite-dimensionality.

**Hypotheses.** Number field F; uniform bound |χᵢ,v(ϖv)| between qv^{−r} and qv^r for a common r at principal-series unramified places; all local constituents infinite-dimensional/generic; full archimedean and analytic conditions above.

**Prerequisites.** R16.5/whittaker-integral-comparison; R16.2/archimedean-classification; AL `AL.1`; AL `AL.2`; AL `AL.3`; AF `AF.1`; AF `AF.2`; AL `AL.3/gln-converse-full-rank`.

**Sources.** [jl70], Theorem 11.3, printed p. 186; [converse], §2 pp. 5–6; §3 Theorem 3.1, p. 6, n=2.

<a id="r16-5-classical-l-function-comparison"></a>

### classical-l-function-comparison: Classical and unitary L-function normalization

For a normalized primitive holomorphic newform f of weight k≥2, let πf be the AF.5 unitary adelization. With Lf(s)=Σ_{n≥1}a_n n^{−s}, L(s,πf)=Lf(s+(k−1)/2), including the bad-prime factors supplied by upstream newform theory. Its infinite factor is Γℂ(s+(k−1)/2). The factor 2 in Γℂ distinguishes this completion from the common classical (2π)^{−s}Γ(s)Lf(s); record the scalar and the conductor power rather than asserting equality of differently normalized completed functions. At width one the pinned CuspForm L-series theorem supplies the convergent-domain Mellin comparison; the global continuation is imported.

**Hypotheses.** f in the existing Γ₁(N) normalized newform carrier, nebentypus compatible with weight; AF.5 unitary normalization.

**Prerequisites.** R16.5/whittaker-integral-comparison; R16.3/archimedean-factor-comparison; AF `AF.5/gl2-classical-to-adelic`; AF `AF.5/gl2-dictionary`; ModularForms Layer 4; Tau Ceti `CuspForm.LSeries_qExpansion_coeff_eq`; ModularForms Layer 7.

**Sources.** [jl70], §11 classical specialization of standard factors.

<a id="r16-5-global-epsilon-normalization"></a>

### global-epsilon-normalization: Global functional equation and conductor normalization

For the standard global additive character obtained from the trace F/ℚ and compatible self-dual local measures, put A(π)=|Disc(F)|²·N(𝔣π) in rank two. In the unitary variable, Λ(s,π)=A(π)^{s/2}L_f(s,π)L_∞(s,π). Its functional equation is Λ(s,π)=ε(1/2,π)Λ(1−s,π̃), with ε(1/2,π) the product of the local root numbers in AL.1/AL.3’s convention. For a weight-k form over ℚ and t=s+(k−1)/2, the exchange is t↔k−t. Changing local ψ_v by a global a∈F× multiplies each local epsilon by ω_v(a)|a|_v^{2s−1}; their product is one by central-character automorphy and the product formula. The discriminant square is the rank-two conductor contribution; for F=ℚ it is one.

**Hypotheses.** Use AL.3 global completion, the trace-normalized global ψ and self-dual measures; finite conductor from conductorEpsilon.

**Prerequisites.** R16.3/conductor-epsilon-comparison; R16.5/classical-l-function-comparison; AL `AL.1`; AL `AL.3`.

**Sources.** [jl70], Theorem 11.1, printed p. 180.

## R16.6. Classical and Hilbert weights

<a id="r16-6-primitive-classical-bijection"></a>

### primitive-classical-bijection: Primitive newforms and holomorphic cuspidal classes

For fixed k≥2 and nebentypus χ with χ(−1)=(−1)^k, identify normalized primitive Γ₁(N) newforms in the existing HeckeRing.GL2.Newform carrier with cuspidal automorphic GL₂(𝔸ℚ) isomorphism classes of conductor N, central character determined by χ via AF.5, and infinite component D_k in unitary normalization. On the automorphic side take the finite newvector tensor and the holomorphic lowest-weight vector in the positive-determinant constituent; the full GL₂(ℝ) representation still contains both O(2) signs. Normalize its first Fourier coefficient to one. The all-bad-prime eigenproperty needed on the classical side is supplied by upstream primitive newform theory, not assumed to be a field of the pinned Newform structure.

**Hypotheses.** N>0, k≥2; primitive at exact conductor, existing newspace and AF.5 dictionary; chosen additive character for the vector comparison.

**API.**

- `primitiveBijection_conductor`: The product of the local conductor ideals is exactly N.
- `primitiveBijection_weight_character`: π∞=D_k and the central character is the AF.5 character attached to χ.
- `primitiveBijection_hecke`: For p∤N, α_p+β_p=a_p p^{−(k−1)/2} and α_pβ_p=χ(p).
- `primitiveBijection_normalized`: The recovered holomorphic newform has first q-coefficient one.
- `primitiveBijection_inverse`: The two maps are inverse on primitive forms and compatible automorphic classes.

**Tests.**

- `primitiveBijection_weight_two`: At k=2 the infinite component is D₂ and the good trace is a_p/√p.
- `primitiveBijection_old_level`: A primitive form of level M properly dividing N is not primitive of conductor N after the oldform inclusion.
- `primitiveBijection_scalar_normalization`: For a normalized eigenform with a₁=1, multiplying by a scalar c≠1 changes a₁ to c and fails normalization. Every nonzero c yields the same primitive class after renormalization; c=0 is excluded from the eigenform carrier.

**Prerequisites.** R16.2/casselman-newvector; R16.2/normalized-newvector; R16.2/archimedean-classification; R16.4/global-multiplicity-one; R16.4/strong-multiplicity-one; AF `AF.5/gl2-classical-to-adelic`; AF `AF.5/gl2-dictionary`; ModularForms Layer 4; Tau Ceti `HeckeRing.GL2.Newform`; Tau Ceti `HeckeRing.GL2.Newform.qExpansion_coeff_one`.

**Sources.** [jl70], §11 holomorphic specialization and §5 real lowest-weight modules.

<a id="r16-6-classical-hecke-and-level"></a>

### classical-hecke-and-level: The complete level and Hecke dictionary

For primitiveBijection, at p∤N the unitary Satake polynomial is X²−a_p p^{−(k−1)/2}X+χ(p), while the arithmetic Hecke polynomial is X²−a_pX+χ(p)p^{k−1}. The primitive level is ∏p p^{c(πp)}. At a ramified p the local standard factor has degree zero, one or two according to (ker N)^I in rec πp, and its coefficients match the upstream primitive U_p factor after the same variable shift; do not impose a degree-two good-prime polynomial there. The finite-unit central character is χ^{-1} in the AF.5 right-equivariance convention, whereas its value on a good local uniformizer is χ(p) after global rational invariance.

**Hypotheses.** Γ₁(N), weight k, nebentypus and primitive hypotheses of primitiveBijection.

**Prerequisites.** R16.6/primitive-classical-bijection; R16.3/principal-series-parameter; R16.3/steinberg-monodromy; R16.3/supercuspidal-parameter; R16.5/classical-l-function-comparison; ModularForms Layer 4; AF `AF.5/gl2-classical-to-adelic`.

**Sources.** [casselman73], §3 start, printed p. 308; §1 local conductor theorem.

<a id="r16-6-hilbert-algebraic-weights"></a>

### hilbert-algebraic-weights: Hilbert cohomological algebraic weights

For totally real F, embeddings Σ=Hom(F,ℝ), integers k_τ≥2 and m_τ with k_τ+2m_τ=w independent of τ, define the local algebraic representation V_τ=Sym^{k_τ−2}(standard₂)⊗det^{m_τ}, using TauCeti.symPowerRep and the existing determinant character, and V=⊗_{τ∈Σ}V_τ on (Res_{F/ℚ}GL₂)_ℂ. Its scalar action at τ is z^{k_τ−2+2m_τ}=z^{w−2}; its dimension is ∏τ(k_τ−1). The dual V∨ is used when the cohomological/local-system convention requires it; the choice is stated in the AF.4 comparison rather than silently interchanged. Parallel parity of k_τ follows from the existence of the integer m_τ.

**Hypotheses.** Finite embedding set of a totally real number field; k_τ≥2, m_τ∈ℤ, k_τ+2m_τ=w; characteristic-zero coefficients.

**API.**

- `hilbertWeightRepresentation_scalar`: A scalar at τ acts by z^{k_τ−2+2m_τ}; for cohomological weight this is z^{w−2}.
- `hilbertWeightRepresentation_dimension`: dim V=∏τ(k_τ−1).
- `hilbertWeightRepresentation_dual`: Dualizing inverts the scalar central character and agrees with the AF.4 local-system convention.
- `hilbertWeightRepresentation_base_change`: Extension of characteristic-zero coefficients commutes with the tensor construction.

**Tests.**

- `hilbertWeightRepresentation_weight_two`: For one embedding, k=2,m=0 gives the trivial one-dimensional representation.
- `hilbertWeightRepresentation_weight_three`: For one embedding, k=3,m=1 gives standard₂⊗det, dimension two and scalar exponent three.
- `hilbertWeightRepresentation_mixed_parity`: Weights (2,3) cannot satisfy k_τ+2m_τ=w for integer m_τ and one common w.

**Prerequisites.** Tau Ceti `TauCeti.symPowerRep`; Mathlib `Matrix.GeneralLinearGroup.det`; Mathlib `Representation`; AF `AF.4`; AF `AF.1`.

**Sources.** [nt26], §1.2 regular algebraic highest-weight convention, printed p. 8.

<a id="r16-6-weight-k-parameter-conversion"></a>

### weight-k-parameter-conversion: The weight-k arithmetic parameter conversion

At p∤N, put A_p=p^{(k−1)/2}α_p and B_p=p^{(k−1)/2}β_p for the unitary Satake pair. Then A_p+B_p=a_p and A_pB_p=χ(p)p^{k−1}. In the geometric-Artin WD carrier this arithmetic Hecke parameter is rec(πf,p)⊗ν_W^{−(k−1)/2}=recᵀ(πf,p)⊗ν_W^{−(k−2)/2}. To compare to the classical Galois representation whose determinant is ε·χ_cyc^{k−1} and whose ARITHMETIC Frobenius polynomial is the arithmetic Hecke polynomial, convert the Frobenius and dual conventions explicitly: that Galois representation on geometric Frobenius has the inverse eigenpair (A_p^{-1},B_p^{-1}). Its contragredient has the Hecke eigenpair at geometric Frobenius. A nebentypus/Galois reciprocity convention must be matched before identifying this dual with the Tate-normalized construction. R19 owns the actual Galois attachment and the equality of WD data at ramified places.

**Hypotheses.** Classical arithmetic Frobenius convention stated; χ_cyc(arithmetic Frob_p)=p; unitary AF.5 πf, integer k≥2.

**Prerequisites.** R16.3/tate-unitary-normalization; R16.6/classical-hecke-and-level; R16.6/hilbert-algebraic-weights; R01 `R01.2/weil-deligne-representation`.

**Sources.** [nt26], §1.2 recᵀ and Hodge–Tate conventions, printed p. 8.

<a id="r16-6-geometry-and-galois-exports"></a>

### geometry-and-galois-exports: Newvector and multiplicity exports

Export the exact local conductor dimensions, normalized Whittaker line, primitive classical comparison, coefficient field and Hilbert algebraic representation to R18’s automorphic cohomology and R19’s Galois construction. Each consumer records its central character, archimedean dual convention, local compact subgroup, Hecke normalization and coefficient lattice. The finite-part multiplicity remains one for a fixed compatible infinite type; no new claim of integral multiplicity one, torsion-freeness or Galois existence is made by this export.

**Hypotheses.** Consumer coefficient field, local level and infinite type fixed; geometric statements imported from their owners.

**Prerequisites.** R16.2/casselman-newvector; R16.4/global-multiplicity-one; R16.4/cohomological-rationality; R16.6/primitive-classical-bijection; R16.6/hilbert-algebraic-weights; R16.6/weight-k-parameter-conversion.

**Sources.** [cdn20], §5.2.1 printed pp. 347–348, archimedean weight two.

<a id="r16-6-weight-one-classical-comparison"></a>

### weight-one-classical-comparison: Primitive weight-one comparison

For N>0 and odd nebentypus χ, the existing primitive normalized weight-one cusp forms at conductor N correspond to cuspidal GL₂(𝔸ℚ) classes of exact conductor N and central character ω_χ whose unitary infinite component is the full-O(2) limit D₁(0). Its positive-determinant restriction has holomorphic and antiholomorphic limits of lowest weights ±1. Its real Weil parameter is 1⊕sgn, not an irreducible induction from ℂ×; its standard infinite factor is Γℝ(s)Γℝ(s+1)=Γℂ(s). Use AF.5’s k≥1 function dictionary, finite newvector normalization and global multiplicity. This comparison does not give a regular algebraic Hilbert coefficient Sym^{−1} or a weight-one Galois construction. The Casimir is −1/4 at k=1 in the convention Δ=(H²+2XY+2YX)/4.

**Hypotheses.** N>0; χ(−1)=−1; existing primitive newform carrier with k=1 and exact conductor; chosen AF.1 limit globalization and AF.5 dictionary.

**Prerequisites.** R16.2/archimedean-classification; R16.4/global-multiplicity-one; AF `AF.5/gl2-classical-to-adelic`; AF `AF.5/gl2-dictionary`; AF `AF.1`; AL `AL.1`; ModularForms Layer 4; R16.2/casselman-newvector; R16.2/normalized-newvector.

**Sources.** [getz15], §6.4 Lemma 6.19, p. 33, corrected as AF/E1; §6.5 limit module, p. 34.

## R17.1. Quaternionic local transfer

<a id="r17-1-local-quaternionic-comparison"></a>

### local-quaternionic-comparison: Quaternionic local Jacquet–Langlands

For a nonarchimedean F and quaternion division algebra D/F from the upstream quaternion carrier, ET.6 local Jacquet–Langlands identifies irreducible smooth D× representations with essentially square-integrable GL₂(F) representations. On corresponding regular elliptic d,g having the same reduced characteristic polynomial, Θ_JL(ρ)(g)=−Θ_ρ(d). Determinants/central characters and χ∘Nrd versus χ∘det twists agree. At a split place D=M₂(F) the comparison is the chosen algebra isomorphism and has sign +1. A principal series has no division-algebra preimage. This is a specialization of the general correspondence, not a second existence/bijectivity proof.

**Hypotheses.** Characteristic-zero smooth representations; compare matching elliptic conjugacy classes; square-integrability is essential.

**Prerequisites.** R16.3/steinberg-monodromy; R16.3/supercuspidal-parameter; ET `ET.6`; QuadraticFormInvariants Layer 2; QuadraticFormInvariants Layer 6D.

**Sources.** [jl70], Theorem 15.1 and following orthogonality discussion, printed pp. 249–250.

<a id="r17-1-norm-character-steinberg"></a>

### norm-character-steinberg: Norm characters and Steinberg twists

Under localQuaternionic, χ∘Nrd on D× transfers to St⊗χdet. Its central character is χ², its WD parameter is steinbergParameter with N≠0, and its standard conductor is 1 for unramified χ or 2a(χ) for ramified χ. The corresponding local L/epsilon factors are exactly those of that parameter; the one-dimensional D× dimension does not make the GL₂ WD parameter monodromy-free. The trivial D× representation is the unramified St case, used by the definite-quaternion applications.

**Hypotheses.** Nonarchimedean quaternion division algebra; smooth characteristic-zero χ.

**Prerequisites.** R17.1/local-quaternionic-comparison; R16.3/steinberg-monodromy; R16.3/conductor-epsilon-comparison; ET `ET.6`; QuadraticFormInvariants Layer 2.

**Sources.** [jl70], §15 special/norm-character correspondence; §16 p. 269.

<a id="r17-1-real-quaternionic-comparison"></a>

### real-quaternionic-comparison: The real quaternionic coefficient comparison

For D=Hamilton quaternions at a real place, an irreducible algebraic D× representation restricts to SU(2) as Sym^{k−2} for k≥2, with its specified positive-real central character. Its local JL image is D_k with the norm twist that gives the same central character. Under the complex splitting, the algebraic representation Sym^{k−2}⊗det^m has scalar action z^{k−2+2m}; comparison with the unitary D_k therefore includes the explicit |det|^{(k−2+2m)/2} twist and the same sign^k on ℝ×. For k=2,m=0 the trivial quaternionic representation transfers to D₂. One does not assert that an arbitrary unitary D_k is itself a finite-dimensional algebraic representation.

**Hypotheses.** Real place, k≥2 and m integer; AF.1b supplies full O(2) representation and archimedean LLC.

**Prerequisites.** R17.1/local-quaternionic-comparison; R16.2/archimedean-classification; R16.3/archimedean-factor-comparison; R16.6/hilbert-algebraic-weights; AF `AF.1`; QuadraticFormInvariants Layer 2.

**Sources.** [cdn20], §5.2.1 printed pp. 347–348.

<a id="r17-1-wild-dyadic-transfer"></a>

### wild-dyadic-transfer: Wild and dyadic quaternionic compatibility

For every essentially square-integrable GL₂(F) parameter, including primitive wild rank-two Weil representations at dyadic places, the ET.6 quaternionic preimage has the same central character and LLC parameter as GL₂, with the same standard factors and Artin conductor in R16.3’s convention. For a supercuspidal it has N=0; for a special representation it has rank-one N. Dihedral/tamely-dihedral examples are checks within this statement, not a replacement for primitive wild cases. No naive level exponent of a chosen order in D is equated to the GL₂ conductor without a separate comparison.

**Hypotheses.** ET.6 canonical inner-form correspondence at every finite extension of ℚp; characteristic zero.

**Prerequisites.** R17.1/local-quaternionic-comparison; R16.3/supercuspidal-parameter; R16.3/steinberg-monodromy; R16.3/tate-unitary-normalization; R16.3/tamely-dihedral-supercuspidal; ET `ET.6`; R01 `R01.3/conductor-of-a-weil-deligne-representation`.

**Sources.** [cdn23], §4.1.2, printed p. 38, local division/split identification.

<a id="r17-1-swapped-quaternion-invariants"></a>

### swapped-quaternion-invariants: Swapped quaternion invariants in arithmetic applications

Import upstream LOCAL quaternion classification and Hilbert reciprocity. Assume global quaternion algebras D₀,D with the prescribed ramification have been chosen; their global existence is a separate R17.3 construction, not a consequence of QFI Layer6D. In CDN23’s totally real F of even degree, D₀ ramifies at all real places and splits at all finite places. Interchange invariants at one chosen v₀|p and one real place τ₀: D ramifies at v₀ and all real places except τ₀, and has the same local algebra as D₀ away from {v₀,τ₀}. The ramified-place count stays even. Record chosen local splitting isomorphisms for Hecke comparison. Existence/globalization, auxiliary prime, small level and the resulting global spectral statement belong to R17.3/R18.3; here the local transfer at the two changed places is normCharacterSteinberg/realQuaternionic or the specified square-integrable type.

**Hypotheses.** Totally real F of even degree for this exact D₀ example; chosen v₀ and τ₀; general parity supplied upstream. Chosen global D₀,D with the displayed local invariants; this node proves their local comparisons and parity, conditional on that choice.

**Prerequisites.** R17.1/local-quaternionic-comparison; R17.1/norm-character-steinberg; R17.1/real-quaternionic-comparison; QuadraticFormInvariants Layer 6D; ClassFieldTheory Layer 14; GlobalQuadraticForms §4.4 (`exists_hilbertSymbol_eq_neg_one_iff_pair`); QuadraticFormInvariants Layer 2.

**Sources.** [cdn23], §4.1.2 and equation (4.6), printed pp. 38–39.

## R17.2. Test functions and trace comparisons

<a id="r17-2-steinberg-projector-difference"></a>

### steinberg-projector-difference: The Steinberg projector difference

At a nonarchimedean place, for unitary χ and ω=χ², work in SR.1’s compact-mod-center, ω⁻¹-equivariant Hecke space with AA.2 quotient measure. Put K=GL₂(O), I=K₀(p), and H=⟨Z,I,w⟩ where w=(0 1;ϖ 0). Let ξ(a)=(−1)^{v_F(a)}χ(a). Set e_K^χ(g)=χ(det g)⁻¹/vol(Z\ZK) on ZK and zero elsewhere, e_H^ξ(g)=ξ(det g)⁻¹/vol(Z\H) on H and zero elsewhere, and ζχ=e_H^ξ−e_K^χ. Then trace(St⊗χdet)(ζχ)=1, every other unitary infinite-dimensional irreducible with central character ω has trace zero, and trace(χdet)(ζχ)=−1; the other determinant characters with central character ω have trace zero. The construction is compact modulo Z, not necessarily compact in G. It is a trace projector, not an assertion that its operator is zero on every induced representation.

**Hypotheses.** χ unitary; nonarchimedean F; fixed central quotient measure, matching ω⁻¹ equivariance; exact extended-Iwahori H and ξ above.

**API.**

- `steinbergProjectorDifference_eval`: ζχ(g)=e_H^ξ(g)−e_K^χ(g) with the stated support and quotient volumes.
- `steinbergProjectorDifference_central`: ζχ(zg)=ω(z)⁻¹ζχ(g).
- `steinbergProjectorDifference_steinberg`: The corresponding Steinberg trace is one and all other unitary infinite-dimensional traces are zero.
- `steinbergProjectorDifference_character`: The corresponding determinant-character trace is minus one.
- `steinbergProjectorDifference_twist`: Replacing χ by χη multiplies ζχ(g) by η(det g)⁻¹ with the compatible central character.

**Tests.**

- `steinbergProjectorDifference_trivial_norm`: For χ=1, the St trace is 1 and the trivial GL₂-character trace is −1.
- `steinbergProjectorDifference_unramified_principal`: An irreducible unitary unramified principal series has trace zero, even though its Iwahori fixed space has dimension two.
- `steinbergProjectorDifference_outside_support`: At g outside H∪ZK, ζχ(g)=0.
- `steinbergProjectorDifference_scalar_twist`: A determinant-character twist multiplies both local idempotents by the same inverse character.

**Prerequisites.** R16.1/k0; R16.2/iwahori-center; R17.1/norm-character-steinberg; R16.1/haar-quotient-comparison; SR `SR.1`; AA `AA.2`.

**Sources.** [jl70], §16 printed pp. 268–269, properties (i)–(iv) and ζ″−ζ′.

<a id="r17-2-quaternionic-orbital-matching"></a>

### quaternionic-orbital-matching: Quaternionic orbital integrals and the sign

For matching regular elliptic d∈D× and g∈GL₂(F) with the same reduced polynomial, identify their centralizer torus and choose the same torus measure; specify each ambient quotient Haar measure. ET.3/ET.6 transfer supplies test functions f_D,f_G with O_g(f_G)=−O_d(f_D) and O_g(f_G)=0 at split regular semisimple g. With the matching rank-two character identity Θ_GL₂=−Θ_D this gives trace JL(ρ)(f_G)=trace ρ(f_D). For a chosen D× matrix coefficient the transferred f_G is the JL §16 elliptic character function; in the norm-character case use steinbergProjectorDifference. Compare formal degrees and the identity orbital term using the actual quotient-volume ratio; do not infer equality of formal degrees under unrelated ambient measures.

**Hypotheses.** Fixed unitary central character; compact modulo center functions; regular elliptic correspondence and common centralizer measure.

**Prerequisites.** R17.1/local-quaternionic-comparison; R17.2/steinberg-projector-difference; R16.1/haar-quotient-comparison; ET `ET.3`; ET `ET.6`.

**Sources.** [jl70], §16 character orthogonality and regular-elliptic orbital-integral identity, printed pp.269–270.

<a id="r17-2-cyclic-local-matching"></a>

### cyclic-local-matching: Concrete cyclic norm matching

Let E/F be a cyclic extension of nonarchimedean local fields with generator σ, and use the ET.3/ET.4 twisted orbital integrals. For φ∈C_c^∞(GL₂(E)), choose f∈C_c^∞(GL₂(F)) with O_γ(f)=TO_{δ,σ}(φ) whenever γ is a regular norm of δ, and O_γ(f)=0 for regular nonnorm classes, with centralizer measures identified as in AC89 Chapter 1 §3. A matching central character on E is pulled back from F by N_{E/F}; central equivariance must use this norm, not the raw same character. At an unramified place with unit volumes, choose the spherical transfer: 1_{GL₂(O_E)} maps to 1_{GL₂(O_F)}, and Satake transforms are related by (α,β)↦(α^d,β^d), d=[E:F]. At a completely split global place use the product norm δ₁…δ_d and the corresponding convolution of local functions. The function choice is unique only modulo the kernel of regular orbital integrals.

**Hypotheses.** Cyclic local extension and generator; compatible centralizer Haar measures; unramified spherical assertion requires unramified E/F.

**API.**

- `cyclicMatching_norm`: Matching regular norm classes have equal ordinary and twisted orbital integrals with identified centralizer measures.
- `cyclicMatching_non_norm`: The ordinary orbital integral vanishes on regular classes that are not norms.
- `cyclicMatching_unit`: Unramified hyperspecial units match with hyperspecial volumes one.
- `cyclicMatching_satake`: On an unramified Satake pair the norm rule sends (α,β) to (α^d,β^d).
- `cyclicMatching_central`: The E central character is ω_F∘N_{E/F}; test functions use its inverse.

**Tests.**

- `cyclicMatching_degree_one`: For E=F and σ=1 choose f=φ; ordinary and twisted orbital integrals agree.
- `cyclicMatching_quadratic_satake`: At an unramified quadratic place the pair (2,3) maps to (4,9), trace 13 and determinant 36.
- `cyclicMatching_non_norm_test`: For E/F unramified quadratic, a regular γ with odd valuation of det γ cannot be a norm and its matching ordinary orbital integral is zero.

**Prerequisites.** R16.3/principal-series-parameter; R16.3/tate-unitary-normalization; R17.2/quaternionic-orbital-matching; ET `ET.1`; ET `ET.3`; ET `ET.4`; SR `SR.4`.

**Sources.** [ac89], Chapter 1 §3 Proposition 3.1 pp. 20–22; §4 p. 32.

<a id="r17-2-continuous-residual-ledger"></a>

### continuous-residual-ledger: The continuous and residual spectral ledger

In the fixed-unitary-central-character GL₂ L² spectrum, identify AS.2, AS.4 and AS.6’s cuspidal terms, residual determinant characters χdet with χ²=ω, and continuous families of normalized inductions I(μ,ωμ⁻¹). The invariant trace formula includes the continuous integrals of normalized intertwining operators and their logarithmic derivatives, together with the residual/exceptional contributions prescribed by AS.6. On the anisotropic quaternion side identify norm characters χNrd and the non-norm cuspidal/discrete spectrum. For steinbergProjectorDifference, a matching χdet has trace −1; hence compare its residual term against the quaternion norm-character term rather than declaring both absent. In a cyclic quadratic comparison retain the σ-invariant induced families and their exceptional automorphic-induction terms, including the one-half Weyl weights, until the ET.4/AS.6 identities identify them. Local regular-elliptic matching alone does not remove the identity or continuous distributions.

**Hypotheses.** Use the same global Haar, central quotient and normalized intertwining conventions throughout; generic spectral carriers belong to AS.2, AS.4 and AS.6.

**Prerequisites.** R17.2/steinberg-projector-difference; R17.2/quaternionic-orbital-matching; R17.2/cyclic-local-matching; AS `AS.4`; AS `AS.2`; AS `AS.6`; ET `ET.4`; AA `AA.2`.

**Sources.** [langlands80], §10 opening spectral decomposition; §11 opening comparison.

<a id="r17-2-strong-cuspidal-vanishing"></a>

### strong-cuspidal-vanishing: Vanishing with a strongly cuspidal local factor

If a finite local factor f_v satisfies ∫_{N(Fv)}f_v(xny)dn=0 for every x,y∈GL₂(Fv), then its operator on every representation parabolically induced from the proper Borel is zero. Consequently the induced continuous terms and their intertwining-derivative contributions vanish for the factorizable global test function; the same operator identity kills any residual determinant character arising as a subquotient of such an induction. A supercuspidal matrix coefficient compact modulo center supplies this condition. The K-averaged constant-term identity printed for the Steinberg projector is weaker and is not substituted for this all-x,y condition.

**Hypotheses.** Compact-mod-center smooth test function, suitable integrability and fixed unitary central character; strong cuspidal constant-term condition for all x,y.

**Prerequisites.** R16.2/supercuspidal-kirillov; R17.2/continuous-residual-ledger; SR `SR.2`; SR `SR.3`; AS `AS.6`.

**Sources.** [jl70], §16 equation (16.1.7), printed p.277; preceding Steinberg averaged constant term, printed p.269.

<a id="r17-2-specialized-trace-comparison"></a>

### specialized-trace-comparison: The concrete quaternionic and cyclic trace comparisons

For factorizable test functions with the local matching, central-character and Haar conventions above, specialize AS.6’s invariant trace identities to GL₂/quaternion and GL₂ cyclic base change. Every regular geometric term matches with the stated sign/norm, and the identity, singular/unipotent, residual and continuous terms are compared using the full spectralLedger. Under the all-x,y local cuspidality hypothesis use strongCuspidalVanishing for precisely the indicated terms; in the Steinberg/norm-character case retain the residual correction and match its norm-character contribution. The resulting equality of distributions is the prerequisite exported to R17.3 and R17.4. Use the complete AS.6/ET.4 singular and intertwining-term comparison, including the identity and residual terms.

**Hypotheses.** Supplier invariant trace formula and local transfer valid for the stated test-function space; compatible measures, central characters, cyclic generator and full spectral-term comparisons.

**Prerequisites.** R17.2/quaternionic-orbital-matching; R17.2/cyclic-local-matching; R17.2/continuous-residual-ledger; R17.2/strong-cuspidal-vanishing; AS `AS.6`; ET `ET.1`; ET `ET.3`; ET `ET.4`.

**Sources.** [jl70], Introduction printed p. vi and §16 opening printed p. 262.

## R17.3. Global Jacquet–Langlands

<a id="r17-3-global-jl"></a>

### global-jl: Global Jacquet–Langlands correspondence

Let F be a number field, D/F a quaternion algebra with ramification set S (finite and real places; complex places are split), fixed isomorphisms D⊗F_v ≅ M₂(F_v) for v ∉ S, and ω a unitary character of F^×\A_F^×. Let DS_D(ω) be the set of isomorphism classes of irreducible subrepresentations of the right regular representation of D×(A_F) on L²(D×(F)A_F^×\D×(A_F), ω). For nonsplit D the quotient is compact and DS_D(ω) consists of all irreducible automorphic representations with central character ω. For D = M₂(F) it consists of the cuspidal representations and the characters χ∘det with χ² = ω. There is a bijection JL_D from the members of DS_D(ω) that are not one-dimensional (not of the form χ∘Nrd) onto the cuspidal automorphic representations π of GL₂(A_F) with central character ω such that π_v is square-integrable modulo the centre at every v ∈ S. At a finite v ∈ S this means a Steinberg twist or a supercuspidal representation; at a real v ∈ S, a discrete series D_k⊗χ (k ≥ 2), whose partner is the algebraic D_v× type of dimension k−1. At v ∉ S the components agree via the fixed isomorphisms; at v ∈ S they match by the R17.1 correspondence JL_v. For D = M₂(F) it is the identity on cuspidal classes. The inverse is part of the assertion. For a non-unitary central quasi-character, twist by a real power of |Nrd| (resp. |det|); the correspondence commutes with such twists. For split D the restriction to the discrete spectrum is essential: Eisenstein constituents are automorphic, do not factor through det, and are not in the domain.

**Hypotheses.** The finite and real ramification set has even cardinality; the empty set is allowed.

**API.**

- `globalJL_local`: For every place v, local(GL₂,JL_D π′,v) equals the R17.1 local transfer of local(D,π′,v), using the split-place identification at split v.
- `globalJL_central`: The central character of JL_D π′ is the central character of π′.
- `globalJL_inverse`: The inverse of JL_D recovers every non-one-dimensional discrete series π′ of D×(A_F). JL_D of the inverse recovers every cuspidal π with π_v square-integrable at all v ∈ S.
- `globalJL_twist`: For a unitary Hecke character χ of F, JL_D(π′⊗χ∘Nrd) = JL_D(π′)⊗χ∘det; the central character becomes ωχ². For a non-unitary χ this holds after the twist reduction to unitary central character.
- `globalJL_split`: For D=M₂(F), using the identity identifications, JL_D is the identity equivalence on cuspidal classes.

**Tests.**

- `jl_split_test`: For D=M₂(Q), JL_D fixes every cuspidal isomorphism class.
- `jl_steinberg_test`: For D/Q ramified at {p,∞} and an allowed weight-two cuspidal π with π_p=St⊗χ_p, local(JL_D inverse π,p)=χ_p∘Nrd under R17.1; local characters are not discarded.
- `jl_inverse_test`: For every D-compatible cuspidal π, JL_D(JL_D inverse π)=π, and the split-place components of its inverse equal π_v.
- `jl_eisenstein_excluded_test`: For D = M₂(Q) and unitary Hecke characters μ, ν of Q, the irreducible automorphic representation π(μ,ν) induced from μ⊗ν is not one-dimensional and does not factor through det. It is not in the domain of JL_D, because it does not occur in L²_disc(GL₂(Q)A^×\GL₂(A), μν).

**Prerequisites.** R16.1; R16.4; R17.1; R17.2; R16.2; AF `AF.2/automorphic-representation`; AF `AF.2/flath-factorization`; AF `AF.3/cuspidal-automorphic-representation`.

**Sources.** [br10], §1.5, definition of discrete series, p. 5 (preprint page = PDF page); [br10], §18.1, Theorem 18.1(a), p. 44; also Theorem 1.4(a), p. 6; [jl70-global], §14, Theorem 14.4, printed p. 247 (IAS; PDF p. 253); [jl70-global], §16, Theorem 16.1, printed p. 261 (IAS; PDF p. 267); [jl70-global], §16, paragraph after Theorem 16.1, printed p. 261 (IAS; PDF p. 267).

<a id="r17-3-norm-exception"></a>

### norm-exception: The reduced-norm character exception

Let D/F be a nonsplit quaternion algebra with ramification set S and χ a Hecke character of F^×\A_F^×. The one-dimensional automorphic representation χ∘Nrd of D×(A_F) is not in the domain of the cuspidal JL bijection. Its classical local transfers are: St_v⊗χ_v at finite v ∈ S, the weight-two discrete series twisted by χ_v at real v ∈ S, and the one-dimensional χ_v∘det at v ∉ S. Their restricted tensor product therefore has one-dimensional components at almost all places and is not cuspidal. JL70 notes that it acts on no subspace of the automorphic forms on GL₂(A_F), and leaves open whether it is a constituent. In Badulescu–Renard's extended discrete-spectrum correspondence (χ unitary), χ∘Nrd corresponds instead to the residual one-dimensional discrete series χ∘det of GL₂(A_F). There the local map |LJ_v| sends χ_v∘det to χ_v∘Nrd. So |LJ_v| agrees with classical JL_v on square-integrable representations but is not injective on all compatible unitary ones, since both χ_v∘det and St_v⊗χ_v go to χ_v∘Nrd. The two branches must not be identified.

**Hypotheses.** Use fixed split-place identifications and the R17.1 classical local correspondence.

**Prerequisites.** R17.3/global-jl; R16.2; R17.1; R16.4.

**Sources.** [jl70-global], §14, paragraph after Theorem 14.4, printed p. 247 (IAS; PDF p. 253); [br10], §15, Proposition 15.3(a), p. 39, with Theorem 18.1(a), p. 44.

<a id="r17-3-split-hecke"></a>

### split-hecke: Split-place Hecke compatibility

Let π′ and π = JL_D π′ be as in global-jl. At every finite v ∉ S the fixed algebra identification identifies their local representations, hence their K_v-invariant modules for every compact open K_v and the action of the local Hecke algebra on them. In particular, at a spherical v the eigenvalues t_v of T_v = [K_v diag(ϖ_v,1)K_v] and s_v of S_v = [K_v diag(ϖ_v,ϖ_v)K_v] agree. Consequently the arithmetic degree-two Euler polynomial 1 − a_v X + b_v X², with a_v = t_v and b_v = q_v s_v, agrees; its reciprocal is the polynomial X² − T_vX + N(v)S_v of CDN23. This does not assert an integral global Hecke-module isomorphism, equality of multiplicities at unrelated levels, or spherical vectors at division places.

**Prerequisites.** R17.3/global-jl; R16.2.

**Sources.** [cdn23], §4.1.3, p. 39 (journal page = PDF page); [cdn23], §4.1.4, p. 41; [cdn23], §4.1.2, p. 39.

<a id="r17-3-local-factors"></a>

### local-factors: Local factors of quaternionic transfer

For π′ in the domain of global-jl, π = JL_D π′, a fixed nontrivial additive character ψ = ⊗ψ_v of F\A_F, every place v and every quasi-character ω_v of F_v^×: L(s, ω_v⊗π_v) = L(s, ω_v⊗π′_v), L(s, ω_v^{-1}⊗π̃_v) = L(s, ω_v^{-1}⊗π̃′_v) and ε(s, ω_v⊗π_v, ψ_v) = ε(s, ω_v⊗π′_v, ψ_v). Here, at v ∈ S, the factors of π′_v are JL70's and the GL₂ factors are in the R16.3 normalization; at v ∉ S the equalities are the fixed identification. In this normalization the local functional equation of the zeta integrals on D_v carries the extra sign h_v = −1 for v ∈ S. If instead the constant of that functional equation is taken as the ε-factor of π′_v, then ε(s, ω_v⊗π′_v, ψ_v) = −ε(s, ω_v⊗π_v, ψ_v) at each v ∈ S, and the global product of these signs is (−1)^{|S|} = 1. Hence for every Hecke character ω the completed L-functions agree, L(s, ω⊗π′) = L(s, ω⊗π), as do the global ε-factors and the functional equations, with compatible measures and the same ψ.

**Prerequisites.** R17.3/global-jl; R16.3; R17.1; R16.5.

**Sources.** [jl70-global], §14, before Theorem 14.4, printed p. 247 (IAS; PDF p. 253); [jl70-global], §14, before Theorem 14.4, printed p. 247 (IAS; PDF p. 253); [jl70-global], §14, proof of Theorem 14.2, printed p. 241 (PDF p. 247).

<a id="r17-3-strong-multiplicity-one"></a>

### strong-multiplicity-one: Quaternionic strong multiplicity one

Let π′ and σ′ be discrete series of D×(A_F): irreducible subrepresentations of L²(D×(F)A_F^×\D×(A_F), ω) for a unitary ω. For nonsplit D these are, up to a twist by |Nrd|^s, all irreducible automorphic representations. Assume they are not one-dimensional. If π′_v ≅ σ′_v for all finite v outside a finite set, then π′ ≅ σ′. In particular their components away from a finite set of places determine the components in that set, for example at a distinguished ramified place. This is a theorem about global representations, not a statement that one local Hecke scalar determines a local type.

**Prerequisites.** R17.3/global-jl; R16.4.

**Sources.** [br10], §1.5, Theorem 1.4(c), p. 6 (preprint page = PDF page); [br10], §18.1, Theorem 18.1(b), second sentence, p. 44; [cdn20-global], §5.2.1, proof of Proposition 5.2, author p. 45 (author pagination = PDF page).

<a id="r17-3-multiplicity-one"></a>

### multiplicity-one: Multiplicity one in the non-norm spectrum

For a fixed unitary central character ω, every non-one-dimensional discrete series π′ of D×(A_F) occurs with multiplicity exactly one in L²_disc(D×(F)A_F^×\D×(A_F), ω). Together with local invariant-vector dimensions this computes its contribution at any fixed finite level; it does not say that the full level space is one-dimensional.

**Prerequisites.** R17.3/global-jl; R17.2; R16.4.

**Sources.** [br10], §1.5, Theorem 1.4(b), p. 6 (preprint page = PDF page); [br10], §18.1, Theorem 18.1(b), first sentence, p. 44.

<a id="r17-3-coefficient-conjugation"></a>

### coefficient-conjugation: Coefficient conjugation of global transfer

Let F be totally real, D/F a quaternion algebra with ramification set S, and π = JL_D π′ cohomological: π_v is a discrete series of weight k_v ≥ 2 at every real place, all k_v of the same parity. Suppose, by the R16.4 rationality interface, that for σ ∈ Aut(C) the conjugate σπ_f is the finite part of a cuspidal cohomological π^σ, whose weights are those of π permuted by σ acting on the real embeddings. Then π^σ is again D-compatible: square-integrability at finite places of S is preserved by σ, and all real components are discrete series. Its inverse transfer π′^σ := JL_D^{-1}(π^σ) has finite part σπ′_f, the σ-conjugated algebraic infinity type, and central character with finite part σ∘ω_f. Hence Q(π′_f) = Q(π_f), and both equal the field generated by the arithmetic away-S Hecke eigenvalues (a_v, b_v). This holds only in the cohomological setting supplied by R16.4; it is not a claim of rationality for Maass forms or weight-one Artin forms.

**Hypotheses.** At real ramified places π′ has the matching algebraic type. Use the arithmetic pair a_v=t_v, b_v=q_v s_v.

**Prerequisites.** R17.3/split-hecke; R17.3/strong-multiplicity-one; R16.4; R17.3/global-jl; R17.1; AF `AF.4/rationality-field`; AF `AF.4/clozel-rationality`.

**Sources.** [pan26-global], §5.5.5, p. 75 (arXiv v1 page = PDF page).

<a id="r17-3-rational-models"></a>

### rational-models: Rational-model comparison under transfer

Let (π′, π) be the cohomological JL pair of coefficient-conjugation, and L ⊂ C a field containing Q(π_f) = Q(π′_f). A p-adic coefficient field such as CDN20's is used through a fixed isomorphism C ≅ Q̄_p. (i) If π′_f and π_f have L-models, then at every finite v ∉ S the fixed identification gives an L-linear isomorphism of the L-models of π′_v and π_v, hence of their K_v-invariants with Hecke actions; the arithmetic Hecke eigensystems agree in L and after every extension of L. The models are absolutely irreducible, so isomorphism over C descends to L. (ii) Equality of the fields of rationality does not by itself give an L-model of π′_f: a Schur/descent obstruction at places of S may force a finite extension of L. Consumers therefore fix L large enough. CDN20 §5.2.1 requires the Shimura-curve representation to be defined over its coefficient field L and allows a finite extension of L (footnote 21).

**Prerequisites.** R17.3/coefficient-conjugation; R16.4; R17.3/split-hecke; AF `AF.4/rationality-field`; AF `AF.4/clozel-rationality`.

**Sources.** [cdn20-global], §5.2.1, author p. 44 (author pagination = PDF page); [cdn20-global], §5.2.1, footnote 21, author p. 44.

<a id="r17-3-definite-infinity"></a>

### definite-infinity: Definite quaternionic weights and cuspidal transfer

Let F be totally real and D ramified at every real place. A representation π′ in the domain of global-jl whose real components are irreducible algebraic representations of D_v× ≅ H× (of the highest weights normalized by R17.1) transfers to a cuspidal π whose real components are discrete series with the same infinitesimal characters (Sym^{k−2} ↔ D_k). Over Q with D ramified exactly at {p,∞}, take Pan's space A_{(k,0)} = A_{D,−χ}, χ = (−k,0), of W^{(k,0)}-valued quaternionic forms. Here W^{(k,0)} has highest weight (k,0) and is the dual of the irreducible algebraic D_p×-representation of highest weight (0,−k). For k ≥ 1, A_{(k,0)} decomposes under T_S into eigenspaces indexed by cuspidal π of GL₂(A_Q) such that π_∞ has the infinitesimal character of the algebraic GL₂-representation of highest weight (0,−k), (π^∞)^{K^p} ≠ 0, and π_p is special or supercuspidal. So the spectrum lies in σ^{K^p}_{k+2,1}, the T_S-spectrum on M_{k+2}(K^p)·t, where GL₂(A_f) acts on t through the cyclotomic character. For k = 0, A_{(0,0)} = A^c ⊕ A^1 with A^1 the forms factoring through Nrd: norm-factor eigenforms have weight-zero spectrum σ_0^{K^p}, and the weight-two cuspidal branch σ^{K^p}_{2,1} lives on A^c. So the norm-factor subspace must be removed to get the weight-two cuspidal branch. Construction of the algebraic form space and its identification with automorphic representations of D×(A_Q) remain the R18.3 owner's work.

**Hypotheses.** In Pan's specialization K^p is identified through his main involution, T_S=ℤ_p[T_ℓ,S_ℓ:ℓ∉S], and coefficients are in the completion of Q̄_p. R18.3 supplies its comparison with complex automorphic forms.

**Prerequisites.** R17.3/global-jl; R17.3/split-hecke; R17.1; R16.6.

**Sources.** [pan26-global], §5.4.10, before Definition 5.4.11, p. 71 (arXiv v1 page = PDF page); [pan26-global], Definition 5.4.11(2), p. 71; [pan26-global], §5.5.5, p. 75; [pan26-global], §5.5.5, p. 76.

<a id="r17-3-indefinite-parity"></a>

### indefinite-parity: Indefinite transfer and the parity input

For totally real F of degree d, a quaternion algebra B split at exactly one real place and ramified at the other d−1 has a ramification set of even cardinality, so its number of ramified finite places has the parity of d−1. In CDN20 §5.2.1, B̌ is split at ∞₀, compact modulo the centre at the other real places and ramified at 𝔭; CDN20 puts no degree condition on F, and the parity of the remaining finite ramification is forced by the product formula. Given such B and a cuspidal π of GL₂(A_F) that is square-integrable at every place of Ram(B), the inverse transfer JL_B^{-1}(π) is the automorphic representation used on the associated Shimura curve. It has the same components, hence the same Hecke data, at every split finite place. The geometry and integral/cohomological realization belong to R18/R22. Parity is applied from ClassFieldTheory Layer 14, not reproved.

**Hypotheses.** Allow d=1. B is given, and π is square-integrable at every ramified place, including every ramified real place.

**Prerequisites.** R17.3/global-jl; R17.3/split-hecke; ClassFieldTheory Layer 14; GlobalQuadraticForms §4.4 (`exists_hilbertSymbol_eq_neg_one_iff_pair`); QuadraticFormInvariants Layer 2.

**Sources.** [cdn20-global], §5.2.1, author p. 43 (author pagination = PDF page).

<a id="r17-3-invariant-exchange"></a>

### invariant-exchange: Transfer after exchanging two quaternion invariants

In CDN23 §4.1 (F = Q_p, p > 2), E is a totally real field of even degree in which p splits completely, supplied by a globalization (Prop. 4.5), with a place 𝔭 | p (so E_𝔭 = Q_p) and a real place ∞₀. D⁰ is a quaternion algebra over E ramified exactly at the real places. D has the invariants of D⁰ exchanged at {𝔭,∞₀}: it is ramified at 𝔭 and at the real places other than ∞₀, and split at ∞₀. Both ramification sets have [E:Q] elements. The algebras are identified away from {𝔭,∞₀} by the fixed isomorphism (4.6). Any cuspidal π of GL₂(A_E) that is square-integrable at all real places and at 𝔭 lies in the image of both global-jl correspondences. This gives π⁰ = JL_{D⁰}^{-1}(π) and π^D = JL_D^{-1}(π), whose components away from {𝔭,∞₀} correspond under (4.6), with equal Hecke actions on invariants under any compact open U^𝔭 transported by (4.6). At 𝔭, π⁰_𝔭 is the special or supercuspidal π_𝔭 (via the fixed identification) and π^D_𝔭 = JL_𝔭^{-1}(π_𝔭). At ∞₀, π⁰_{∞₀} is the algebraic type matching the discrete series π_{∞₀} = π^D_{∞₀}. In particular CDN23's tame level U^𝔭, with U_v = GL₂(O_{E_v}) for v ≠ w₁ and U_{w₁} = {g ≡ (1 *; 0 1) mod ϖ_{w₁}}, is carried to D× through (4.6). Here w₁ is CDN23's auxiliary place: N(w₁) is prime to 2Np and not ≡ 1 mod p, and the ratio of the eigenvalues of ρ̄(Frob_{w₁}) is not 1 or N(w₁)^{±1}. N is the product of the orders of the finite groups (U_max A_f^× ∩ t_iG(E)t_i^{-1})/E^×. Existence of w₁ and the small-level geometry are separate supplied inputs, not consequences of JL.

**Hypotheses.** Fix the maximal-order identifications (O_{D⁰})_v≅M₂(O_{E_v}) and the away-{𝔭,∞₀} algebra isomorphism (4.6). The auxiliary place and the globalized field are supplied data.

**Prerequisites.** R17.3/global-jl; R17.3/split-hecke; ClassFieldTheory Layer 14; R17.1; GlobalQuadraticForms §4.4 (`exists_hilbertSymbol_eq_neg_one_iff_pair`); QuadraticFormInvariants Layer 2.

**Sources.** [cdn23], §4.1.1, Proposition 4.5, p. 37 (journal page = PDF page); [cdn23], §4.1.2, p. 38; [cdn23], §4.1.2, equation (4.6), p. 38; [cdn23], §4.1.2, p. 38.

<a id="r17-3-supercuspidal-globalization"></a>

### supercuspidal-globalization: Quaternionic globalization of a supercuspidal type

Let F₀ be a finite extension of Q_p, L a finite extension of Q_p (CDN20's coefficient field; complex representations are viewed over Q̄_p through a fixed isomorphism C ≅ Q̄_p), and τ = LL(M) an irreducible supercuspidal representation of GL₂(F₀) whose central character is trivial on a fixed uniformizer ϖ. The setting is CDN20 §5.2.1: E totally real with a place 𝔭 | p and E_𝔭 = F₀, a real place ∞₀, B̌ split at ∞₀, compact modulo the centre at the other real places and ramified at 𝔭, and B with the invariants of B̌ exchanged at {𝔭,∞₀}. The globalization sought is an automorphic Π̌ of B̌×(A_E), defined over L, with Π̌_∞ containing σ₂ and Π̌_𝔭 ≅ JL(τ). Here σ₂ is trivial at the real places other than ∞₀ and is the holomorphic discrete series of weight 2 with trivial central character at ∞₀. By footnote 21 this may require adjusting the central character, hence twisting everything by a character: τ by η∘det and JL(τ) by η∘Nrd for a character η of F₀^×, which changes ϖ. It may also require replacing L by a finite extension. The result is stated for the twisted data over the extended field. Given Π̌, global JL through GL₂ gives Π on B×(A_E) with Π^𝔭_f ≅ Π̌^𝔭_f under the fixed identifications and Π_𝔭 ≅ τ (twisted as above). Π̌^𝔭_f determines Π̌_𝔭 by quaternionic strong multiplicity one. Construct Π̌ by the prescribed-supercuspidal limit-multiplicity theorem; local transfer is applied only after this globalization.

**Prerequisites.** R17.3/global-jl; R17.3/strong-multiplicity-one; AS `AS.6`.

**Sources.** [cdn20-global], §5.2.1, footnote 21, author p. 44 (author pagination = PDF page); [cdn20-global], §5.2.1, author p. 44; [cdn20-global], §5.2.1, author p. 43.

## R17.4. Cyclic, solvable and cubic base change

<a id="r17-4-unramified-base-change"></a>

### unramified-base-change: Unramified base-change Satake rule

Use the existing arithmetic Satake conjugacy class A_v∈GL₂(C) at an unramified finite v. For an unramified local extension E_w/F_v of residue degree f≥1, define its base-change representative to be A_v^f; the conjugacy class is independent of the chosen representative. This is the transfer-specific rule, not a new Satake carrier. Its determinant is det(A_v)^f and its local Euler polynomial is det(1−A_v^f X). For a split global place each local degree is one. The formal degree-zero extension of the matrix-power function is the identity matrix and is not a degree-zero field extension.

**Hypotheses.** The matrix-power rule works over any coefficient field K; its coefficient functoriality uses ring homomorphisms K→L.

**API.**

- `unramifiedBaseChange_one`: The degree-one rule fixes A.
- `unramifiedBaseChange_tower`: Applying residue degrees f and then g gives A^{fg}.
- `unramifiedBaseChange_conjugate`: For P∈GL₂(K), the rule sends P A P^{-1} to P A^f P^{-1}.
- `unramifiedBaseChange_det`: The determinant of the output is det(A)^f.
- `unramifiedBaseChange_map`: Every coefficient ring map commutes with the power rule.

**Tests.**

- `bc_degree_one_test`: Degree one returns every A∈GL₂(K).
- `bc_identity_test`: The identity matrix stays the identity for every f, including the formal f=0 case.
- `bc_diagonal_square_test`: For A=diag(2,3)∈GL₂(Q), degree two gives the matrix diag(4,9), trace 13 and determinant 36.
- `bc_not_identity_test`: For that A, degree two is different from degree one.
- `bc_tower_test`: Residue degrees two then three give diag(64,729), agreeing with degree six.

**Prerequisites.** Mathlib `Matrix.GeneralLinearGroup`; Mathlib `Matrix.GeneralLinearGroup.det`; Mathlib `Matrix.GeneralLinearGroup.map`; R16.3.

**Sources.** [ac89], Chapter 3 §1, formula (1.1) and Definition 1.1, printed p. 199 (PDF p. 215); [langlands80], §2, local lifting criterion (i), Digital Math Archive typescript p. 9 (PDF p. 12); compare §1 formula (1.1), p. 2.

<a id="r17-4-cyclic-base-change"></a>

### cyclic-base-change: Prime-cyclic base change for GL₂

For a cyclic extension E/F of prime degree ℓ of number fields, there is a uniquely determined strong base-change map BC_{E/F} from isobaric automorphic GL₂ classes over F to isobaric automorphic GL₂ classes over E. BC(π) is the unique isobaric Π such that, at every place w|v, Π_w is the local base-change lift of π_v (Langlands §2, criteria (i)/(ii)). At an unramified w|v its Satake class is unramifiedBaseChange(A_v, f(w/v)); when v splits, Π_w ≅ π_v. A cuspidal input has a cuspidal output or, only for ℓ = 2, an output θ⊞θ^σ for a Hecke character θ of E. The central character is ω_π∘N_{E/F}. The output is invariant under Gal(E/F), and the map does not depend on the chosen generator σ. Neither cuspidality nor injectivity is automatic. The theorem local-compatibility identifies BC(π)_w with the restriction to W_{E_w} of the arithmetic-normalised LLC parameter of π_v.

**Hypotheses.** Isobaric here means cuspidal or χ₁⊞χ₂. Arthur–Clozel uses induction from unitary cuspidal classes; the GL₂ extension without a unitarity restriction is Langlands's theorem.

**API.**

- `cyclicBaseChange_local`: At w|v, BC(π)_w is the local base-change lift of π_v in the sense of Langlands §2 (criteria (i)/(ii)); at split v it is π_v. Its description as the restriction of the normalised local parameter to W_{E_w} is the theorem local-compatibility.
- `cyclicBaseChange_unramified`: At unramified w|v, Satake equals unramifiedBaseChange(A_v,f(w/v)).
- `cyclicBaseChange_central`: The central character is pullback along the idele norm.
- `cyclicBaseChange_twist`: BC(π⊗χ)=BC(π)⊗(χ∘N_{E/F}).
- `cyclicBaseChange_galois`: Every output is Gal(E/F)-invariant; every invariant cuspidal class occurs, with the fibers described in cyclic-descent-fibers.
- `cyclicBaseChange_coefficients`: In the supplied rational/cohomological regime, coefficient conjugation commutes with BC after the algebraic normalization.

**Tests.**

- `cyclic_split_test`: At a completely split v each local output equals the original component and its Satake representative A_v.
- `cyclic_inert_test`: At an inert unramified place of a quadratic extension, diag(2,3) becomes diag(4,9).
- `cyclic_induced_test`: For π=AI_{E/F}(θ) with θ≠θ^σ in a quadratic extension, BC(π)=θ⊞θ^σ and is not cuspidal.
- `cyclic_odd_degree_test`: For prime ℓ>2, every cuspidal GL₂ input remains cuspidal.

**Prerequisites.** R17.4/unramified-base-change; R17.2; R16.3; R16.4; GlobalNumberFields Layer 8.

**Sources.** [langlands80], §2, global properties (A),(B), Digital Math Archive typescript p. 14 (PDF p. 17); proof in §11, Lemma 11.3 and Proposition 11.4, pp. 140–145; [langlands80], §8, split places, Digital Math Archive typescript p. 93 (PDF p. 96); [ac89], Chapter 3, Theorem 5.1 (with Theorem 4.2(a)–(c)), printed pp. 202 and 212 (PDF pp. 218, 228).

<a id="r17-4-local-compatibility"></a>

### local-compatibility: All-place compatibility of cyclic base change

For the strong cyclic BC pair and every place w|v, rec^{arith}_{E_w}(BC(π)_w) equals rec^{arith}_{F_v}(π_v) restricted to W_{E_w}, including the monodromy operator and the normalization twist specified by R16.3. For a principal series restrict both characters; for a Steinberg twist retain nonzero monodromy; for a supercuspidal the restricted parameter may become reducible. At real-to-complex places restrict the real Weil parameter. A merely almost-everywhere Satake match is not this all-place statement. The global input gives only that BC(π)_w is the local Shintani lift of π_v (character identities). The passage to restricted parameters is local: Langlands covers reducible, special, dihedral and tetrahedral parameters; R16.3 supplies the octahedral (extraordinary) dyadic case for every ℓ. The local restriction comparison is required in every prime degree, including extraordinary dyadic parameters; the degree-at-most-three comparison alone does not imply it.

**Hypotheses.** Use Frobenius-semisimple Weil–Deligne parameters and the R16.3 arithmetic normalization. E_w/F_v is trivial or cyclic of degree ℓ, at every finite and infinite place.

**Prerequisites.** R17.4/cyclic-base-change; R16.3.

**Sources.** [ac89], Chapter 3, Definition 1.2 and Theorem 5.1, printed pp. 199, 212–213 (PDF pp. 215, 228–229); [langlands80], §2, local result (e), Digital Math Archive typescript p. 10 (PDF p. 13); [langlands80], §7, Lemma 7.6, Digital Math Archive typescript p. 68 (PDF p. 71); [langlands80], §11, Lemma 11.8, Digital Math Archive typescript p. 151 (PDF p. 154); [carayol86], §12.2.2, printed p. 457 (PDF p. 50).

<a id="r17-4-cyclic-descent"></a>

### cyclic-descent: Prime-cyclic automorphic descent

For cyclic E/F of prime degree ℓ, a cuspidal automorphic GL₂ representation Π over E has a cuspidal descent over F if and only if Π^σ≅Π for a generator σ of Gal(E/F). The resulting descents are determined up to twisting by the ℓ characters of F×N_{E/F}(A_E×)\A_F×. This is descent of an automorphic representation, proved by the twisted trace formula comparison, not descent of a Galois representation. Invariant noncuspidal isobaric classes also have isobaric descents, with the two-character ambiguity described separately.

**Hypotheses.** A descent is a preimage under strong cyclic base change; norm-kernel characters are identified by global reciprocity.

**Prerequisites.** R17.4/cyclic-base-change; R17.2; ClassFieldTheory Layer 11.

**Sources.** [langlands80], §11, Lemma 11.6(b), Digital Math Archive typescript p. 151 (PDF p. 154); [langlands80], §2, global property (C), Digital Math Archive typescript p. 14 (PDF p. 17).

<a id="r17-4-cuspidality"></a>

### cuspidality: The exact prime-cyclic cuspidality criterion

Let π be cuspidal GL₂ over F and E/F cyclic of prime degree ℓ; let η be a generator of the order-ℓ group of Hecke characters of F trivial on F^×N_{E/F}(A_E^×). Then BC_{E/F}(π) is noncuspidal if and only if π≅π⊗η. This can occur only for ℓ=2. In that case BC(π)=θ⊞θ^σ for a Hecke character θ with θ≠θ^σ. The identification of π with quadratic automorphic induction is provided by R17.5/quadratic-induction, after this base-change criterion. For prime ℓ>2 the output is always cuspidal. For composite cyclic extensions test each prime step; an odd prime criterion is not a criterion for every composite degree.

**Hypotheses.** The criterion is independent of the chosen generator η. Reduce Arthur–Clozel's unitary statement by a |det|^s twist for a nonunitary cuspidal π.

**Prerequisites.** R17.4/cyclic-base-change; R17.4/cyclic-descent; GlobalNumberFields Layer 9.

**Sources.** [ac89], Chapter 3, Theorem 4.2(a),(b), printed p. 202 (PDF p. 218); [langlands80], §11, Lemma 11.7, Digital Math Archive typescript p. 151 (PDF p. 154); [langlands80], §11, Lemma 11.3(b), Digital Math Archive typescript p. 141 (PDF p. 144); Lemma 11.3(a) on p. 140.

<a id="r17-4-cyclic-descent-fibers"></a>

### cyclic-descent-fibers: Cuspidal fibers and quadratic self-twists

If Π is a Gal(E/F)-invariant cuspidal GL₂ representation and π is one of its cyclic descents, then its cyclic descents are precisely π⊗η^i, 0≤i<ℓ; these ℓ classes are distinct and all cuspidal. If E/F is quadratic and the common output is noncuspidal θ⊞θ^σ with θ≠θ^σ, its descent is unique (and cuspidal): π⊗η≅π. The assertion of ℓ distinct descents therefore applies only when the output is cuspidal.

**Hypotheses.** E/F is prime-cyclic and η generates its order-ℓ norm-kernel character group; σ generates Gal(E/F).

**Prerequisites.** R17.4/cyclic-descent; R17.4/cuspidality.

**Sources.** [langlands80], §11, Lemma 11.6(a), Digital Math Archive typescript p. 150 (PDF p. 153); (b) on p. 151; [langlands80], §2, global property (C), Digital Math Archive typescript p. 14 (PDF p. 17).

<a id="r17-4-isobaric-fibers"></a>

### isobaric-fibers: Isobaric character fibers

For π=χ₁⊞χ₂ over F, its cyclic base change is (χ₁∘N_{E/F})⊞(χ₂∘N_{E/F}). Equality of two such outputs is equality of the unordered pairs of pulled-back characters. The two characters can be twisted independently by characters trivial on the norm subgroup; the ambiguity is not in general a simultaneous twist of the whole rank-two representation. When an invariant pair over E is exchanged by σ (possible only for ℓ=2), it has the quadratic cuspidal descent of the exchanged character pair described above.

**Hypotheses.** E/F is prime-cyclic; χ₁,χ₂ need not be unitary. Twisting characters are trivial on F×N(A_E×).

**Prerequisites.** R17.4/cyclic-base-change; R17.4/cyclic-descent-fibers; GlobalNumberFields Layer 8; ClassFieldTheory Layer 11; R16.4.

**Sources.** [langlands80], §2, global property (C), first sentence, Digital Math Archive typescript p. 14 (PDF p. 17); [langlands80], §11, verification of (A)–(G), Digital Math Archive typescript p. 151 (PDF p. 154); [langlands80], §11, verification of (B), Digital Math Archive typescript p. 151 (PDF p. 154).

<a id="r17-4-solvable-base-change"></a>

### solvable-base-change: Base change along a solvable normal tower

Let E/F be a finite Galois extension with solvable Galois group. Choose a subnormal tower F=F₀⊂F₁⊂⋯⊂F_r=E with each step cyclic of prime degree and define BC_{E/F} by composing the prime-cyclic maps on isobaric GL₂ classes. At every local place the normalized parameter is restricted from F to E; the map is independent of the chosen prime-cyclic tower by almost-everywhere Satake comparison and isobaric strong multiplicity one. It preserves twists through the total norm and preserves cuspidality exactly when no intermediate step meets its quadratic self-twist exception. A non-Galois cubic extension has no such prime-cyclic tower from F; it is not constructed here.

**Hypotheses.** π is isobaric. Fix compatible embeddings and places; intermediate F_i need not be normal over F.

**API.**

- `solvableBaseChange_refl`: For E=F and the empty tower the map is identity.
- `solvableBaseChange_tower`: For a nested pair of solvable normal extensions the map agrees with composition, with the chosen compatible embeddings.
- `solvableBaseChange_local`: Every local parameter is restriction along the total local extension, and at completely split places it is unchanged.
- `solvableBaseChange_twist`: Twisting by χ before BC equals twisting after BC by χ∘N_{E/F}.

**Tests.**

- `solvable_empty_test`: The empty tower fixes every isobaric class.
- `solvable_two_towers_test`: For a biquadratic E/F, the towers through two different quadratic subfields give equal isobaric output.
- `solvable_degree_six_test`: At a place with local residue degrees two then three, diag(2,3) becomes diag(64,729).
- `solvable_cuspidality_test`: A cuspidal input induced from the first quadratic step is already noncuspidal there, so no blanket solvable cuspidality theorem is asserted.

**Prerequisites.** R17.4/cyclic-base-change; R17.4/cuspidality; R16.4; GlobalNumberFields Layer 8; R17.4/unramified-base-change; R17.4/local-compatibility.

**Sources.** [ac89], Chapter 3 §7, proof of Theorem 7.3, printed p. 222 (PDF p. 238); [ac89], Chapter 3 §7, proof of Theorem 7.3, printed p. 222 (PDF p. 238); [langlands80], §3, Lemma 3.1, Digital Math Archive typescript p. 15 (PDF p. 18).

<a id="r17-4-tower-independence"></a>

### tower-independence: Independence of the solvable tower

For two prime-cyclic subnormal towers from F to the same solvable Galois extension E, the composed GL₂ isobaric base changes coincide. At all places unramified in the towers and in π, both Satake classes are A_v^{f(w/v)}, because residue degrees multiply along each tower. Isobaric strong multiplicity one therefore gives an isomorphism of the two global outputs, hence equality of every local component. Strong local compatibility is not needed for independence; it describes each common component as the restriction of the parameter of π_v. No chosen ordered diagonalization or chosen generator of a cyclic Galois group survives in the output.

**Hypotheses.** π is isobaric; use R16.4 isobaric strong multiplicity one over E.

**Prerequisites.** R17.4/solvable-base-change; R17.4/unramified-base-change; R17.4/local-compatibility; R16.4.

**Sources.** [ac89], Chapter 3 §7, proof of Theorem 7.3, printed p. 222 (PDF p. 238); [langlands80], §3, Lemma 3.1, Digital Math Archive typescript p. 15 (PDF p. 18); [langlands80], §11, verification of (A)–(G), Digital Math Archive typescript p. 151 (PDF p. 154).

<a id="r17-4-solvable-descent"></a>

### solvable-descent: Descent along a solvable tower with character choices

Fix a prime-cyclic subnormal tower F=F₀⊂F₁⊂⋯⊂F_r=E and an isobaric automorphic GL₂ representation Π over E. Then Π is the composed base change of an isobaric π over F along this tower if and only if there is a chain Π_r=Π, Π_{r−1}, …, Π₀=π in which each Π_{i−1} is a cyclic descent of Π_i along F_i/F_{i−1} and, for i≥2, Π_{i−1} is invariant under Gal(F_{i−1}/F_{i−2}). At each step the possible Π_{i−1} are given by the cyclic fibre theorems. If Π_i is cuspidal there are ℓ_i distinct twists. If ℓ_i=2 and Π_i=θ⊞θ^σ with θ≠θ^σ, there is a unique cuspidal descent. If Π_i=(χ₁∘N)⊞(χ₂∘N), the two characters can be twisted independently by norm-kernel characters. The theorem supplies descent once these stepwise choices exist and records their ambiguities. It does not assert that Gal(E/F)-invariance of Π alone yields a descent to F: an invariant choice at each step, and compatibility with prescribed central characters, is a hypothesis, not a conclusion.

**Hypotheses.** Fix a generator at every prime-cyclic step. Prescribed central characters must be compatible with every chosen descent.

**Prerequisites.** R17.4/cyclic-descent; R17.4/cyclic-descent-fibers; R17.4/isobaric-fibers; R17.4/solvable-base-change.

**Sources.** [ac89], Chapter 3 §3, Theorem 3.1 and its introduction, printed p. 201 (PDF p. 217); [ac89], Chapter 3, Theorem 4.2(f) (and (d)), printed p. 203 (PDF p. 219); [langlands80], §2, global properties (A),(B), Digital Math Archive typescript p. 14 (PDF p. 17).

<a id="r17-4-prescribed-local-base-change"></a>

### prescribed-local-base-change: Base change with prescribed local splitting

Suppose a solvable normal extension E/F has already been produced by the arithmetic/potential-modularity owner with chosen completions and splitting at a finite set T. Then BC_{E/F}(π)_w≅π_v at every w|v with v∈T completely split; elsewhere its parameter is the restriction to the prescribed completion. If cuspidality is required, check the quadratic self-twist criterion at every tower step. For potentially unramified or ordinary conditions stated by the consuming local owner, export only the consequences of this precise local restriction and normalization. The construction of the extension with prescribed points/splitting is not replanned here.

**Prerequisites.** R17.4/solvable-base-change; R17.4/local-compatibility; R17.4/cuspidality.

**Sources.** [carayol86], §12.3.2, printed p. 459 (PDF p. 52); [carayol86], §12.3.1, printed pp. 458–459 (PDF pp. 51–52); [langlands80], §8, split places, Digital Math Archive typescript p. 93 (PDF p. 96).

<a id="r17-4-adjoint-lift"></a>

### adjoint-lift: The Gelbart–Jacquet adjoint lift

For a unitary cuspidal GL₂ automorphic representation π over a number field F, the adjoint lift Ad(π)=Sym²(π)⊗ω_π^{-1} (the Gelbart–Jacquet lift) is an isobaric automorphic GL₃ representation with trivial central character, self-dual, whose component at every place is the Gelbart–Jacquet local lift: L(s,Ad(π)_v⊗χ_v)=L(s,(π_v⊗χ_v)×π̃_v)/L(s,χ_v), with the matching ε-factors, for every character χ_v. Through the GL₂ local Langlands correspondence and its pair-factor compatibility these are the factors of the adjoint of the rank-two LLC parameter. At an unramified v with eigenvalues α,β its eigenvalues are α/β,1,β/α. It is invariant under character twist of π. It is cuspidal exactly when π has no nontrivial self-twist (GJ78 Theorem 9.3 and Remark 9.9). If π≅π⊗η with η≠1, then η=η_{E/F} is quadratic, π=AI_{E/F}(θ), and Ad(π)=η_{E/F}⊞AI_{E/F}(θ/θ^σ), with the rank-two induction interpreted isobarically if its character is invariant. The adjoint of a Galois or Weil–Deligne parameter is taken from ArithmeticGaloisRepresentations G7.

**Hypotheses.** Identify the local adjoint parameter through GL₂ pair-factor compatibility and the GL₃ local converse theorem (R16.3, ET.6). This input also covers extraordinary components; GJ78 alone does not prove that comparison.

**API.**

- `adjointLift_local`: Each local component of Ad(π) is the Gelbart–Jacquet local lift of π_v; under the GL₂ LLC its parameter is the adjoint of the local parameter of π.
- `adjointLift_unramified`: Satake eigenvalues (α,β) become (α/β,1,β/α).
- `adjointLift_twist`: Ad(π⊗χ)=Ad(π) for every Hecke character χ.
- `adjointLift_central`: The central character of Ad(π) is trivial.

**Tests.**

- `adjoint_diagonal_test`: The Satake class diag(2,3) gives diag(2/3,1,3/2) in GL₃(Q).
- `adjoint_scalar_test`: Scalar Satake input diag(a,a), a≠0, gives the identity class.
- `adjoint_twist_test`: Multiplying both input eigenvalues by any u≠0 does not change the three adjoint eigenvalues.
- `adjoint_not_sym_square_test`: For diag(2,3), the adjoint output differs from diag(4,6,9); forgetting ω^{-1} gives the wrong lift.

**Prerequisites.** R16.3; AL `AL.3`; AF `AF.2/automorphic-representation`; R01 `G7`; MetaplecticAutomorphicForms `MP.5`; ET `ET.6`; AF `AF.3/cuspidal-automorphic-representation`; AL `AL.3/gln-converse-reduced-rank`.

**Sources.** [gj78], Introduction, printed p. 472 (PDF p. 3); [gj78], §3.1, Definition 3.1.3 and the remark after it, printed p. 485 (PDF p. 16); [gj78], §3.6, printed p. 491 (PDF p. 22); [gj78], §9, Theorem 9.3, printed p. 534 (PDF p. 65); [gj78], Remark 9.9, printed p. 541 (PDF p. 72); with §3.7, printed p. 491; [gj78], §5 lead-in, Theorem 8.1, printed p. 496 (PDF p. 27); proof in §§5–8.

<a id="r17-4-cubic-character-induction"></a>

### cubic-character-induction: Cyclic cubic induction of a character

For a cyclic cubic extension E/F of number fields and a unitary Hecke character θ of E, there is an isobaric automorphic GL₃ representation AI_{E/F}(θ) whose local parameter at every place is Ind_{W_{E_w}}^{W_{F_v}}(θ_w) (the direct sum over w|v at a split place), in the sense of equal GL₁-twisted L- and ε-factors, and whose standard L-function is L_E(s,θ). It is cuspidal if and only if θ,θ^σ,θ^{σ²} are pairwise distinct, i.e. θ≠θ^σ. If θ=χ∘N_{E/F}, the output is χ⊞χη⊞χη² for the order-three character η associated to E/F. This rank-three character case is the exact monomial input to the tetrahedral proof; the general GL_n automorphic-induction theory is not redeveloped here.

**Hypotheses.** JPSS assumes θ unitary; a quasi-character is reduced by a norm twist. In the invariant case class field theory supplies χ with θ=χ∘N and the order-three norm-kernel character η.

**Prerequisites.** AL `AL.3`; AF `AF.2/automorphic-representation`; GlobalNumberFields Layer 9; ClassFieldTheory Layer 11; AL `AL.1/hecke-l-functional-equation`; ET `ET.6`; AF `AF.3/cuspidal-automorphic-representation`; Tau Ceti `TauCeti.simple_indFDRep_ofLinearCharacter_iff`; AL `AL.3/gln-converse-reduced-rank`.

**Sources.** [jpss79], Automorphic forms on GL(3) II, §14.2, Theorem (14.2), printed pp. 253–254 (PDF pp. 42–43 of the author-site scan; visual transcription); [jpss79], §14.2, remark on monomial representations after the proof, printed p. 255 (PDF p. 44); [ac89], Chapter 3 §6, Definition 6.1 and Theorem 6.2, printed p. 215 (PDF p. 231); [ac89], Chapter 3 §6, Lemmas 6.3–6.4 and Corollary 6.5, printed pp. 217–218 (PDF pp. 233–234); [langlands80], §3(i), DMA text p. 17 (PDF p. 20).

<a id="r17-4-gl3-recognition"></a>

### gl3-recognition: GL₃ analytic recognition for the Artin bridge

Let F be a number field. (i) GL₃ converse theorem (Jacquet–Piatetski-Shapiro–Shalika; Cogdell Theorem 3.3 with n=3, twists of rank n−2=1): let Π=⊗Π_v be an irreducible admissible representation of GL₃(A_F) whose central character is an idele class character and whose Euler product converges in a right half-plane. If for every idele class character χ the functions L(s,Π⊗χ) and L(s,Π̃⊗χ^{-1}) extend to entire functions bounded in vertical strips and satisfy L(s,Π⊗χ)=ε(s,Π⊗χ)L(1−s,Π̃⊗χ^{-1}), then Π is cuspidal automorphic. If this is required only for χ unramified at a finite set S of finite places, Π agrees outside that set with an automorphic representation. (ii) Jacquet–Shalika pole criterion: if π¹,π² are unitary cuspidal automorphic representations of GL₃(A_F) with L(s,π²_v×π̃¹_v)=L(s,π¹_v×π̃¹_v) for almost all v, then π²≅π¹, because L^S(s,π¹×π̃¹) has a pole at s=1 and L^S(s,π²×π̃¹) has one only if π²≅π¹. These inputs recognise the adjoint lift (via (i)) and identify it with the cyclic cubic induction of Ad(ρ) in Langlands's tetrahedral argument (via (ii)). In that application both representations are cuspidal, so no GL₃ isobaric strong multiplicity one is used. GL₂ strong multiplicity one and an untwisted L-function alone do not supply these results. The generic converse input is AL.3/gln-converse-reduced-rank at n=3; the pole criterion is AL.3/rs-global-poles. For the adjoint application also use the highly ramified T-twist version of the converse theorem in Gelbart–Jacquet §9.2. R16.5 uses AL.3/gln-converse-full-rank at n=2 with its own checked hypotheses, not this GL₃ statement.

**Hypotheses.** Require absolute convergence of the Euler product in some right half-plane. S contains finite places only.

**Prerequisites.** AL `AL.3/gln-converse-reduced-rank`; AL `AL.3/rs-global-poles`; AL `AL.3/rs-boundary-nonvanishing`; R17.4/adjoint-lift; R17.4/cubic-character-induction; AL `AL.2/jacquet-shalika-satake-bound`; AL `AL.3/rs-local-convergence`; AL `AL.3/rs-local-factor`.

**Sources.** [converse], §3, sentence before Theorem 3.3 and Theorem 3.3, p. 9; [converse], §3, applications (iv)–(v), p. 10; [gj78], Introduction, printed p. 473 (PDF p. 4); §9.2, printed pp. 532–534; [langlands80], §3(i), DMA text p. 18 (PDF p. 21), with (3.1)–(3.2); [cogdell-fields], Lecture 9 §7, Theorem 9.3 proof, printed pp.74–75 (PDF pp.78–79).

<a id="r17-4-nonnormal-cubic-base-change"></a>

### nonnormal-cubic-base-change: Non-normal cubic base change

Let K/F be a separable non-Galois cubic extension of number fields, with S₃ normal closure. The Jacquet–Piatetski-Shapiro–Shalika cubic transfer associates to a cuspidal GL₂ automorphic π over F an automorphic GL₂ representation BC_{K/F}(π) over K, taken isobaric, whose Satake class at almost every w|v is A_v^{f(w/v)}. In Tunnell's statement of [JPSS], Π_w=π(Res ρ_v) whenever π_v=π(ρ_v), for almost all v. For an isobaric π=π(μ,ν) the transfer is π(μ∘N_{K/F},ν∘N_{K/F}). This stage constructs only this weak transfer. Carayol §12.2.1 also records local lifts for extensions of degree at most three (for non-Galois cubic extensions defined by L- and ε-factors) and states that the global lift has these local lifts as components at every place. The target here is the weak transfer; an all-place cubic comparison additionally requires the restriction rule for principal series, special and ordinary cuspidal parameters in Carayol §12.2.2. The transfer respects twists via the norm and preserves the central character by norm pullback. A cuspidal input can cease to be cuspidal; for the primitive tetrahedral/octahedral dyadic parameters of Carayol §12.2.2, the restricted local parameter is irreducible. Use the non-normal cubic transfer theorem stated by Tunnell and Carayol; its construction requires the GL₃ and GL₂×GL₃ analytic inputs.

**Hypotheses.** Use unitary normalization. The unramified equality determines the output up to isomorphism among isobaric classes; it is an almost-all-place assertion.

**API.**

- `cubicBaseChange_unramified`: At unramified w|v the output Satake class is the f(w/v)-power of the input class.
- `cubicBaseChange_twist`: BC_{K/F}(π⊗χ)=BC_{K/F}(π)⊗(χ∘N_{K/F}).
- `cubicBaseChange_central`: The central character is ω_π∘N_{K/F}.
- `cubicBaseChange_unique`: The isobaric global output is uniquely determined by its almost-everywhere local Satake powers.

**Tests.**

- `cubic_split_test`: At a completely split place the three outputs are all the original Satake class A.
- `cubic_one_two_test`: For splitting type (1,2) and A=diag(2,3), the two outputs are diag(2,3) and diag(4,9).
- `cubic_inert_test`: For residue degree three and A=diag(2,3), the output is diag(8,27).
- `cubic_not_three_test`: At splitting type (1,2), replacing every output by A³ gives the wrong local components.

**Prerequisites.** R17.4/cyclic-base-change; R17.4/gl3-recognition; R16.3; R16.4; GlobalNumberFields Layer 8; R16.5; AL `AL.3`.

**Sources.** [tunnell81], Theorem [4] (Tunnell's statement of JPSS), printed p. 173; [tunnell81], paragraph after Theorem [4], printed p. 173; [carayol86], §12.2.1, printed p. 457 (PDF p. 50); [carayol86], §12.2.1(b), printed p. 457 (PDF p. 50).

## R17.5. Automorphic induction and solvable Artin representations

<a id="r17-5-quadratic-induction"></a>

### quadratic-induction: Quadratic automorphic induction

Let K/F be a quadratic extension of number fields, σ its nontrivial automorphism and θ a Hecke character of K. Quadratic automorphic induction AI_{K/F}(θ) is an isobaric GL₂ automorphic representation with local parameter Ind_{W_{K_w}}^{W_{F_v}}(θ_w), interpreted as the direct sum over w|v at a split place. It is cuspidal exactly when θ≠θ^σ. Its central character is η_{K/F}·θ|_{A_F×}, and L_F(s,AI θ)=L_K(s,θ). Its quadratic base change is θ⊞θ^σ. It commutes with twisting by χ of F using θ·(χ∘N_{K/F}); if θ=χ∘N, it is χ⊞χη, not cuspidal. The finite-group induction carrier and Mackey formulas are imported, not defined here.

**API.**

- `quadraticInduction_local`: Local LLC of AI θ is local induction of θ, with a direct sum at a split place.
- `quadraticInduction_central`: ω(AI θ)=η_{K/F}·θ|_{A_F×}.
- `quadraticInduction_baseChange`: BC_{K/F}(AI θ)=θ⊞θ^σ.
- `quadraticInduction_twist`: AI(θ·χ∘N)=AI(θ)⊗χ.
- `quadraticInduction_cuspidal`: AI θ is cuspidal if and only if θ≠θ^σ.

**Tests.**

- `induction_invariant_test`: θ=χ∘N has output χ⊞χη and is not cuspidal.
- `induction_split_test`: At v split as w,w′ the local parameter is θ_w⊕θ_w′.
- `induction_determinant_test`: For a coset element with induced matrix [[0,a],[b,0]], its determinant is −ab, accounting for the quadratic character.
- `induction_noninvariant_test`: When θ≠θ^σ, replacing AI θ by two F-characters contradicts cuspidality.

**Prerequisites.** R17.4/cyclic-base-change; R16.3; GlobalNumberFields Layer 9; ClassFieldTheory Layer 11; R16.5; AL `AL.1/hecke-l-functional-equation`; Tau Ceti `TauCeti.simple_indFDRep_ofLinearCharacter_iff`.

**Sources.** [jl70-global], §12, Proposition 12.1, printed p. 206 (PDF p. 212 of the IAS scan); [jl70-global], §12, paragraph before Proposition 12.1, printed p. 206; [ac89], Chapter 3 §6, Theorem 6.2, printed p. 215; Lemmas 6.3–6.4 and Corollary 6.5, printed pp. 217–218.

<a id="r17-5-dihedral-artin"></a>

### dihedral-artin: Dihedral Artin automorphy

Let ρ:G_F→GL₂(C) be continuous, irreducible and finite-image, with dihedral projective image. The imported classification gives a quadratic K/F and a finite-order character θ of G_K with ρ≅Ind_{G_K}^{G_F} θ. Reciprocity identifies θ with a finite-order Hecke character, and quadraticInduction(θ) is the unique cuspidal GL₂ automorphic representation whose normalized local parameter is ρ|_{W_{F_v}} at every place. Over totally real F, total oddness makes the infinite components the holomorphic parallel-weight-one parameters; this archimedean consequence is separate from finite-place automorphy.

**Hypotheses.** Include projective V₄ (n=2). The inducing character is not invariant under the nontrivial automorphism.

**Prerequisites.** R17.5/quadratic-induction; R01 `R01.4`; ClassFieldTheory Layer 11; R16.4.

**Sources.** [jl70-global], §12, Proposition 12.1, printed p. 206 (PDF p. 212); [langlands80], Introduction, DMA text p. 4 (PDF p. 7).

<a id="r17-5-finite-hecke-extension"></a>

### finite-hecke-extension: Extension of finite-order idele-torsion characters

Let F be a number field, n≥1, and ω:μ_n(F)\μ_n(A_F)→S¹ a continuous character, where μ_n(F)\μ_n(A_F) is viewed inside the idele class group C_F. Then ω extends to a finite-order continuous character of C_F if and only if its component ω_v on μ_n(F_v) is trivial at every complex place v; real places impose no condition. In particular the obstruction vanishes when F has no complex place, e.g. for totally real F. Extensions are not unique. In the Grunwald–Wang special case the cokernel of μ_n(F)\μ_n(A_F)→C_F[n] has order two, so one first chooses one of two extensions of ω to C_F[n]; either choice admits a finite-order extension when the condition holds, and the case affects only uniqueness. This is an arithmetic extension theorem on the canonical GlobalNumberFields Hecke-character carrier, not a new character group.

**Hypotheses.** The torsion-idele quotient is a closed subgroup of C_F. Finite order means finite image; ω has order dividing n.

**Prerequisites.** GlobalNumberFields Layer 9; GlobalNumberFields Layer 7; GlobalNumberFields Layer 10.

**Sources.** [patrikis], §2.3, Lemma 2.3.6, first bullet, printed p. 30 (PDF p. 34); [patrikis], proof of Lemma 2.3.6, printed pp. 30–31 (PDF pp. 34–35).

<a id="r17-5-tate-vanishing"></a>

### tate-vanishing: Tate’s arithmetic obstruction vanishing

For any number field F, H²_cont(G_F,Q/Z)=0, where Q/Z is discrete with trivial G_F-action. Consequently a continuous finite-image projective representation over C has zero obstruction after enlarging its finite root-of-unity coefficient group. This does not assert H²(G_F,μ_n)=0 for fixed n, nor use Q/Z with cyclotomic action. Continuous cochains and connecting maps are supplied by ProfiniteCohomology; the arithmetic vanishing is proved here.

**Prerequisites.** ProfiniteCohomology Layer 10; ClassFieldTheory Layer 10; ClassFieldTheory Layer 11; R17.5/finite-hecke-extension; ClassFieldTheory Layer 5; ClassFieldTheory Layer 6.

**Sources.** [patrikis], §2.1, Theorem 2.1.1 and first line of proof, printed p. 17 (PDF p. 21); [patrikis], proof of Theorem 2.1.1, printed p. 18 (PDF p. 22); [patrikis], §2.1, proof of Proposition 2.1.4, printed p. 19 (PDF p. 23).

<a id="r17-5-finite-projective-lift"></a>

### finite-projective-lift: Continuous finite-image arithmetic projective lifting

Let F be a number field and r:G_F→PGL₂(C) a continuous finite-image homomorphism. There exist a continuous finite-image ρ:G_F→GL₂(C) and an identification of its projectivization with r. Choose representatives in SL₂(C) of the finite projective image, so the factor set takes values in μ₂. By tate-vanishing its class dies in H²(G_F,μ_M) for some even M, giving a continuous cochain with values in the finite group μ_M. Correcting the representatives by this cochain gives a homomorphism whose image lies in μ_M times the preimage in SL₂(C) of r(G_F), a finite group; continuity holds because both factors are locally constant. Any two continuous finite-image lifts of the same identified projective homomorphism differ by a continuous finite-order scalar character. At a real place where r(c) is a nontrivial involution, every linear lift is odd (eigenvalues +1,−1); trivial projective r(c) cannot give an odd two-dimensional lift. No determinant-one or prescribed residual reduction is asserted.

**Prerequisites.** R17.5/tate-vanishing; RepresentationTheory/InductionRestriction Layer 7; Tau Ceti `TauCeti.IsProjectiveRep.exists_monoidHom_of_cohomologyClass_eq_zero`; Mathlib `Matrix.ProjGenLinGroup`; Mathlib `Matrix.ProjGenLinGroup.mk`; R01 `R01.1`.

**Sources.** [patrikis], §2.1, Proposition 2.1.4, printed p. 19 (PDF p. 23); [patrikis], proof of Proposition 2.1.4, printed p. 19 (PDF p. 23); [patrikis], Remark 2.1.5, printed p. 19 (PDF p. 23).

<a id="r17-5-tetrahedral-artin"></a>

### tetrahedral-artin: Tetrahedral Artin automorphy

Let F be a number field and ρ:G_F→GL₂(C) be continuous finite-image irreducible with projective image A₄. There is a unique cuspidal GL₂ automorphic representation π with normalized all-place local parameters ρ. Over the cyclic cubic field E fixed by the preimage of the normal V₄, the restriction P is dihedral and therefore automorphic. Its automorphic representation is Galois-stable, and cyclic descent gives a finite twist fiber over F. Matching the determinant removes the cubic twist ambiguity, giving π_ps(ρ). The adjoint Ad(π_ps) is cuspidal because π_ps has no self-twist, and it is identified with the cyclic cubic induction of the V₄ character θ (Ad ρ=Ind θ) by the Jacquet–Shalika Rankin–Selberg pole criterion. At places inert in E this leaves A(π_v)=diag(ξa,ξ²b) with ξ³=1, and ξ≠1 would give an element of order 6 in A₄. Langlands proves π_v=π(ρ_v) for almost all v (Theorem 3.3 records the consequence that L(s,ρ) is entire); the all-place statement uses his equivalence of the two definitions of π(ρ), whose proof he only sketches. The GL₃ inputs are the converse and pole comparisons in R17.4/gl3-recognition.

**Prerequisites.** R17.5/dihedral-artin; R17.4/cyclic-descent; R17.4/cyclic-descent-fibers; R17.4/adjoint-lift; R17.4/cubic-character-induction; R17.4/gl3-recognition; R01 `R01.4`; R16.5; R16.4; R16.3.

**Sources.** [langlands80], §3(i), Theorem 3.3, DMA text p. 19 (PDF p. 22); [langlands80], §3(i), DMA text pp. 16–17 (PDF pp. 19–20); [langlands80], §3(i), DMA text p. 18 (PDF p. 21); [langlands80], §3(i), DMA text p. 19 (PDF p. 22); [langlands80], §3 opening, DMA text p. 15 (PDF p. 18).

<a id="r17-5-octahedral-artin"></a>

### octahedral-artin: Octahedral Artin automorphy

For a number field F and a continuous irreducible finite-image ρ:G_F→GL₂(C) with projective image S₄, there is a unique cuspidal automorphic π with π_v≅π(ρ_v) for almost all v (Tunnell). By the same all-place upgrade as in the tetrahedral case, π has normalized local parameter ρ|_{W_{F_v}} at every place. Let E/F be the quadratic field cut out by the preimage of A₄, K/F the non-Galois cubic field cut out by the preimage of a Sylow-2 subgroup, and M=EK. The tetrahedral theorem over E gives π(ρ_E), which is the base change of exactly two cuspidal π₁ and π₂=π₁⊗ω_{E/F}. These have the same central character, so determinant matching cannot choose between them. Tunnell's lemma: exactly one i has BC_{K/F}(π_i)≅π(ρ_K), where ρ_K is monomial. Both BC_{K/F}(π_i) base change to π(ρ_M); they differ by ω_{M/K}=ω_{E/F}∘N_{K/F} and are distinct because ρ_M is irreducible, so they are the two quadratic descents of π(ρ_M), one of which is π(ρ_K). For this π, a place w|v of K with [K_w:F_v]∈{1,3} shows that the Satake class of π_v is that of ρ_v: the only alternative gives an element of order 6 in S₄. GL₃ and GL₂×GL₃ theory enters only through the JPSS cubic transfer, which Tunnell quotes without proof. Langlands's earlier octahedral results (Theorems 3.4–3.5, over Q with conditions on complex conjugation) are not substituted for Tunnell's theorem.

**Prerequisites.** R17.5/tetrahedral-artin; R17.5/dihedral-artin; R17.4/cyclic-descent-fibers; R17.4/nonnormal-cubic-base-change; R16.5; R01 `R01.4`; R17.4/cyclic-descent; R17.4/cuspidality; R16.4; R16.3.

**Sources.** [tunnell81], p. 173, first paragraph; [tunnell81], p. 173, definition of π(ρ); [tunnell81], Lemma and its proof, p. 174; [tunnell81], Theorem and its proof, pp. 174–175; [langlands80], §3(ii), DMA text p. 19 (PDF p. 22).

<a id="r17-5-solvable-artin"></a>

### solvable-artin: Langlands–Tunnell strong Artin theorem

Let F be a number field and ρ:G_F→GL₂(C) be continuous finite-image irreducible with solvable projective image. There is a unique cuspidal GL₂ automorphic representation π such that, in the fixed Artin/LLC normalization, rec_Fv(π_v)≅ρ|_{W_Fv} for every place v. Equivalently (Jacquet–Langlands §12), the L- and ε-factors of all character twists agree at every place, so L(s,π)=L(s,ρ). The finite-image projective classification leaves dihedral, A₄ and S₄; a cyclic projective image would make the representation reducible. Solvability of linear and projective finite images is equivalent because their scalar kernel is abelian. Over totally real F, total oddness gives holomorphic parallel weight one; automorphy itself has no oddness requirement. This is the strong rank-two theorem, not merely holomorphy of the Artin L-function. Rogawski–Tunnell §4 state it as the strong Artin conjecture (cuspidal π(σ) with L(s,π(σ))=L(s,σ)), known for solvable image by Langlands and Tunnell. The published proofs give almost-everywhere equality; the all-place and ε-factor clause rests on Langlands's equivalence of the two definitions of π(ρ) (§3, proof sketched).

**Prerequisites.** R17.5/dihedral-artin; R17.5/tetrahedral-artin; R17.5/octahedral-artin; R16.5; R16.6; R01 `R01.4`; R16.3; Tau Ceti `TauCeti.Matrix.GeneralLinearGroup.not_isSolvable_fin_two`.

**Sources.** [rt83], §4, proof of Proposition 4.3, printed p. 41; [rt83], §4, printed p. 40; [langlands80], §3 opening, DMA text p. 15 (PDF p. 18); [tunnell81], p. 173, first paragraph.

<a id="r17-5-q-weight-one"></a>

### q-weight-one: Odd Artin representations and classical weight one

For ρ as in solvable-artin over Q with det ρ(c)=−1, the R16.6 dictionary yields a normalized holomorphic cuspidal weight-one newform f with exact Artin conductor N(ρ), nebentypus det ρ under reciprocity, L(s,f)=L(s,ρ), and, for ℓ∤N(ρ) and arithmetic Frobenius, characteristic polynomial X²−a_ℓ(f)X+det ρ(Frob_ℓ) of ρ(Frob_ℓ). This is the Weil–Langlands theorem (Deligne–Serre Théorème 4.10); its hypothesis that every L(s,ρ⊗χ) is entire follows here from cuspidality of the Langlands–Tunnell representation. Its coefficients lie in a number field. To reduce modulo p choose a place λ above p, an embedding of its residue field into a common algebraic closure, and a stable lattice in a coefficient realization of ρ. Weight one here is not the weight≥2 cohomological construction used in Hilbert varieties.

**Prerequisites.** R17.5/solvable-artin; R16.2; R16.6; R01 `R01.1`; R01 `R01.3`; R01 `R01.5`; AF `AF.5/gl2-dictionary`; ModularForms Layer 4.

**Sources.** [ds74], §4(c), Théorème 4.10 (Weil–Langlands), printed p. 516 (PDF p. 11); with Remarques 4.4–4.5 and Théorème 4.6, pp. 514–515; [langlands80], §3, octahedral case before Theorem 3.4, p. 20 of the Digital Math Archive text (PDF p. 23); [rt97], §2, proof of the Theorem (case D<0), printed p. 307 (PDF p. 9).

<a id="r17-5-tr-weight-one"></a>

### tr-weight-one: Totally odd Artin representations and Hilbert weight one

For F totally real and ρ as in solvable-artin with det ρ(c_v)=−1 at every real place, the automorphic π is holomorphic parallel-weight-one Hilbert cuspidal in the R16.6 extended dictionary. At every real place π_v is Rogawski–Tunnell's π₁, the representation of GL₂(R) unitarily induced from the Borel character (a b;0 d)↦sign(a) (isomorphic to π(1,sign)), whose parameter is 1⊕sign; it is a limit of discrete series, not a cohomological weight≥2 discrete-series representation. The finite conductor, central character and local Artin factors are those of ρ. This node exports the weight-one input to residual modularity arguments, without duplicating Hilbert Shimura-variety geometry or constructing a weight-one cohomological Galois representation.

**Prerequisites.** R17.5/solvable-artin; R16.6; R01 `R01.1`.

**Sources.** [rt83], §1, definitions (ii) of π₁ and of 'holomorphic of weight k', printed p. 4 (rt83.txt page 4; article PDF p. 5); [rt83], Introduction, printed p. 1.

<a id="r17-5-odd-residual-lift"></a>

### odd-residual-lift: Solvable residual lifting in odd characteristic

Let F be totally real, p>2, and r̄:G_F→GL₂(F̄_p) be continuous, absolutely irreducible and totally odd with solvable image. There is a totally odd continuous finite-image characteristic-zero lift ρ over a number field, a place λ above p and a stable lattice whose semisimplified reduction is r̄ after a specified residue-field embedding. The proof uses the finite-subgroup classification (projective image dihedral, A₄ or S₄), a reduction-compatible lift of that finite projective image to characteristic zero, Tate's theorem (finite-projective-lift) and a Teichmüller twist; Tate alone only lifts a projective homomorphism and does not ensure the prescribed residual reduction. Coefficient enlargement is allowed. Construct the reduction-compatible finite projective lift and the final scalar twist separately; the arithmetic obstruction-vanishing theorem by itself does not control reduction.

**Hypotheses.** p is prime. The residue-field embedding is into F̄_p and the comparison is semisimplified.

**Prerequisites.** R17.5/finite-projective-lift; R01 `R01.1`; R01 `R01.4`; RepresentationTheory/InductionRestriction Layer 7.

**Sources.** [bcgp21], Proposition 10.1.3, proof, solvable case, printed p. 474 (PDF p. 322).

<a id="r17-5-residual-lt-application"></a>

### residual-lt-application: Solvable residual modularity over totally real fields

For F,p,r̄ as in odd-residual-lift, apply Langlands–Tunnell to its totally odd finite-image lift and obtain a parallel-weight-one Hilbert cuspidal form whose chosen λ-adic reduction realizes r̄. This is the qualitative residual modularity input of the solvable case in the proof of BCGP Proposition 10.1.3 (there over a totally real quadratic extension E of the base field, with p=3 or 5). The proof of Theorem 10.2.6 uses it only through Proposition 10.1.3(1). Subsequent ordinary weight-two lifts, auxiliary solvable extensions and GSp₄ transfer in those arguments require their own lifting/weight-change owners and are not consequences of Langlands–Tunnell alone. No unchanged conductor or ordinary local condition is promised by this application.

**Prerequisites.** R17.5/odd-residual-lift; R17.5/tr-weight-one; R01 `R01.1`; R01 `R01.5`; R17.5/solvable-artin.

**Sources.** [bcgp21], Proposition 10.1.3, proof, solvable case, printed p. 474 (PDF p. 322); [bcgp21], Theorem 10.2.6, proof, printed p. 481 (PDF p. 329).

<a id="r17-5-tunnell-primitive-globalization"></a>

### tunnell-primitive-globalization: Tunnell's globalisation of a local two-dimensional Weil representation (Tunnell 1978, Theorem 1.3)

Tunnell, Invent. Math. 46 (1978), Theorem 1.3, for a p-adic field. Let K be a finite extension of Q_p and σ: W_K → GL₂(C) a continuous two-dimensional representation. There exist a number field F, a finite place v of F with an isomorphism F_v ≅ K, and a continuous representation ρ: W_F → GL₂(C) whose restriction ρ_v to W_{F_v} is isomorphic to σ. If σ is reducible, induced from a proper subgroup, of A₄-type or of S₄-type (the type is the image in PGL₂(C)), then ρ can be chosen of the same type. If K = Q₂ and σ is of S₄-type, one can take F = Q and ρ with det ρ(c) = −1 for complex conjugation c. In the primitive case (A₄- or S₄-type, which forces p = 2) the proof gives ρ = ρ₀ ⊗ χ̃, where ρ₀: G_F → GL₂(C) has finite image and the same projective image as σ, χ̃ is a Hecke quasi-character of F, and in the S₄ case det ρ₀(c) = −1 at every real place. Finite-image form, as Carayol 12.2.3 uses it: if σ is primitive with finite image, ρ can be taken to be a continuous representation of G_F with finite image, tetrahedral or octahedral as σ is. This form needs a finite-order Hecke character χ̃ whose component on the full group F_v× is the scalar discrepancy between σ and (ρ₀)_v. Restricting that discrepancy to local roots of unity does not determine the uniformizer value or the character on all principal units. For automorphy the quasi-character form suffices, because ρ is then a twist of the finite-image ρ₀. Tunnell states the theorem for every nonarchimedean local field and a global field F; positive characteristic is not planned here.

**Hypotheses.** No irreducibility is needed for the existence assertion. Restriction uses a chosen place above v; its isomorphism class is independent of that choice. A₄ and S₄ types are primitive and force p=2. Only characteristic-zero local fields are in scope.

**Prerequisites.** R17.5/finite-projective-lift; R16.3; R01 `R01.4`; ClassFieldTheory Layer 11; GlobalNumberFields Layer 9; GlobalNumberFields Layer 1; NumberFieldArithmetic Layer 5. The character-extension input must extend a prescribed continuous quasi-character of F_v× to F×\𝔸_F×; for the finite-image form it must preserve finite order, allowing auxiliary ramification. R17.5/finite-hecke-extension prescribes only μ_n(F)\μ_n(𝔸_F) and has a different domain.

**Sources.** [tunnell78], §1, Theorem 1.3, printed p. 182 (GDZ article PDF p. 5; page 4 of the OCR text); [tunnell78], §1, Theorem 1.3, second and third sentences, printed p. 182 (GDZ PDF p. 5); [tunnell78], proof of Theorem 1.3, first paragraph, printed p. 182 (GDZ PDF p. 5); [tunnell78], proof of Theorem 1.3, primitive case, printed p. 183 (GDZ PDF p. 6); [tunnell78], proof of Theorem 1.3, S₄ case, printed p. 183 (GDZ PDF p. 6); [carayol86], 12.2.3, proof of Proposition 12.2.2, printed p. 458 (PDF p. 51).

<a id="r17-5-prescribed-local-induction"></a>

### prescribed-local-induction: Automorphic induction with prescribed local and archimedean components (Carayol 11.2)

Carayol 1986, 11.2, with the global Weil construction of Jacquet–Langlands §12. Let F be a totally real field of degree d with real places τ₁,…,τ_d, let k₁,…,k_d ≥ 2 and w be integers of the same parity, and let D_{k,w} be the essentially square-integrable representation of GL₂(R) of Carayol 0.2 (central character t ↦ t^{−w}), so that D_{k,w} ≅ 𝒲(C, ζ_{k,w}) with ζ_{k,w}(z) = (z z̄)^{(−w−k+1)/2} z^{k−1}. Let 𝔭 ≠ v be finite places of F, L_𝔭/F_𝔭 a quadratic field extension and ξ_𝔭 a quasi-character of L_𝔭^× that does not factor through the norm, with ξ_𝔭·|·|^{w/2} of finite order; so 𝒲(L_𝔭, ξ_𝔭) is ordinary cuspidal. Then there exist a totally imaginary quadratic extension L/F and a quasi-character ξ of 𝔸_L^×/L^× such that (a) L ⊗_F F_𝔭 ≅ L_𝔭 and the 𝔭-component of ξ is ξ_𝔭; (b) at the complex place of L above τ_i, ξ is ζ_{k_i,w}; (c) L/F is not split at v and ξ_v does not factor through the norm L_v^× → F_v^×. The automorphic induction π′ = 𝒲(L, ξ) = quadraticInduction(ξ) is cuspidal, with π′_u ≅ 𝒲(L_u, ξ_u) at every place u; in particular π′_{τ_i} ≅ D_{k_i,w}, π′_𝔭 ≅ 𝒲(L_𝔭, ξ_𝔭) and π′_v is supercuspidal. Hence, when 𝒲(L_𝔭, ξ_𝔭) is the component π_𝔭 of a π as in Carayol (0.3) and v is the place fixed in Theorem (B), π′ satisfies the hypotheses of Theorem (B) and has the same 𝔭-component as π. Carayol calls the existence of (L, ξ) standard and gives no proof. The finite-order condition on ξ_𝔭·|·|^{w/2}, automatic for such π_𝔭, cannot be dropped. It is a local condition: the global ξ·|·|^{w/2} still has angular infinity component (z/|z|)^{k_i−1}, which has infinite order for k_i≥2. The character-existence step must prescribe ξ on all of L_𝔭×, together with its complex components and a non-norm component at v. It must respect the product relation on diagonal L× and establish continuity after choosing an auxiliary finite modulus. The torsion-idele extension in R17.5/finite-hecke-extension does not by itself supply these simultaneous prescriptions; Patrikis Lemma 2.3.1 supplies the criterion for an infinity type without prescribed finite components.

**Hypotheses.** If d is even, v is Carayol's fixed place of Theorem (B); if d is odd it is any auxiliary finite place. The finite-order condition is equivalent to the local central character being |·|^(−w) times a finite-order character. At a split place 𝒲 denotes the principal series of its two characters.

**Prerequisites.** R17.5/quadratic-induction; R16.2; R16.3; GlobalNumberFields Layer 1; GlobalNumberFields Layer 7; GlobalNumberFields Layer 9; GlobalNumberFields Layer 10. In addition to those carriers, use a simultaneous local/infinity-type character-existence theorem preserving the stated finite-order-after-norm-twist condition at 𝔭 and proving global-unit compatibility; merely constructing a Hecke character from an already given ray-class character is insufficient.

**Sources.** [carayol86], 11.2, printed p. 450 (PDF p. 43); [carayol86], 11.2, condition (a), printed p. 450 (PDF p. 43); [carayol86], 11.2, condition (c), printed p. 450 (PDF p. 43); [carayol86], 11.2, conclusion, printed p. 450 (PDF p. 43); [carayol86], 11.2, archimedean components, printed p. 450 (PDF p. 43); [jl70-global], §12, Proposition 12.1, printed p. 206 (PDF p. 212); [jl70-global], §4, Theorem 4.6(iii), printed p. 71 (PDF p. 77); [patrikis], §2.3, Lemma 2.3.1 and the sentence after it, printed p. 28 (PDF p. 32).

<a id="r17-5-octahedral-mod-three-application"></a>

### octahedral-mod-three-application: The octahedral mod-3 application: odd mod-3 representations come from weight-one forms

Let ρ̄: G_Q → GL₂(F₃) be continuous, absolutely irreducible and odd (det ρ̄(c) = −1). Let λ = (1+√−2), so that Z[√−2]/λ ≅ F₃ with √−2 ↦ −1, and let s: GL₂(F₃) → GL₂(Z[√−2]) be an injective homomorphism with s(x) ≡ x mod λ. For example, s is determined by s([[1,1],[0,1]]) = [[−2, −1+√−2],[1+√−2, 1]] and s([[0,1],[1,0]]) = [[−1−√−2, −2],[−1+√−2, 1+√−2]]: these generate a group of order 48 that reduction maps bijectively onto GL₂(F₃). Fix Q(√−2) ⊂ C and put ρ = s∘ρ̄: G_Q → GL₂(C). Then ρ is continuous, irreducible and odd, with finite image isomorphic to that of ρ̄; det ρ is the ±1-valued lift of det ρ̄; and the projective image of ρ is isomorphic to the image of ρ̄ in PGL₂(F₃) ≅ S₄, so it is solvable (S₄, octahedral, exactly when ρ̄ is surjective). By solvable-artin and q-weight-one there is a normalized weight-one newform g of level N(ρ), the Artin conductor of s∘ρ̄, and odd quadratic nebentypus ε = det ρ, with ρ_g ≅ ρ. For every prime ℓ ∤ N(ρ), a_ℓ(g) = tr s(ρ̄(Frob_ℓ)) ∈ Z[√−2], a_ℓ(g) ≡ tr ρ̄(Frob_ℓ) and ε(ℓ) ≡ det ρ̄(Frob_ℓ) mod λ. Reducing ρ_g along the stable lattice Z[√−2]_λ² gives exactly ρ̄, so ρ̄_{g,λ} ≅ ρ̄. This particular mod-three lifting uses the explicit finite section rather than the general odd-characteristic lifting theorem. The level N(ρ) can exceed Serre's conductor of ρ̄. Darmon–Diamond–Taylor, Theorem 3.14(a), state the conclusion as modularity in weight two (their Definition 3.12) and pass from g to a weight-two form by Remark 3.6; that step is not part of this node.

**Hypotheses.** Arithmetic Frobenius and the reciprocity identification of det ρ agree with q-weight-one. Enumerating the 48 generated matrices verifies the stated section.

**Prerequisites.** R17.5/solvable-artin; R17.5/q-weight-one; R01 `R01.1`; R01 `R01.4`; R01 `R01.5`; Mathlib `Matrix.GeneralLinearGroup.map`; Tau Ceti `TauCeti.Matrix.GeneralLinearGroup.not_isSolvable_fin_two`.

**Sources.** [ddt], §3.2, Theorem 3.14(a), p. 90; [ddt], §3.2, sketch of proof of Theorem 3.14, case (a), p. 90; [ddt], §3.2, Theorem 3.9, p. 89; [ddt], §3.2, Definition 3.12, p. 89.

## R17.6. Characteristic two and residual modularity

### classical-higher-weight-attachment: Classical eigenforms of weight at least two

For a nonzero holomorphic eigenform f of weight k≥2, level N and character ε, a coefficient number field K containing a_p and ε(p), and a place λ|ℓ, construct a continuous semisimple ρ_{f,λ}:G_ℚ→GL₂(K_λ), unramified outside Nℓ, with arithmetic Frobenius polynomial X²−a_pX+ε(p)p^(k−1) for p∤Nℓ. Semisimple recognition makes it unique up to isomorphism. This representation has compact ℓ-adic image, which need not be finite. Construction uses the rank-two eigenprojector realization in modular-curve/Jacobian cohomology for k=2 and the symmetric-power coefficient realization for k≥3; take the arithmetic dual and descend the coefficient field. These constructions must provide the trace and determinant equalities before using recognition.

**Prerequisites.** R01 `R01.1` and `R01.5`; ModularForms Layers 0, 4 and 8G; HilbertModularVarietiesAndShimuraCurves `R18.4` for the modular-curve cohomological realization, with the appropriate coefficient local system from R16.6/hilbert-algebraic-weights. The eigenprojector, two-dimensionality and coefficient descent are required parts of this attachment.

**Source.** [ds74], Theorem 6.1 and Remarks 6.2–6.5, pp. 520–521. Deligne–Serre uses this as an input: its statement does not constitute a proof of the geometric realization.

### classical-weight-one-attachment: The Artin representation of a classical weight-one form

For a nonzero holomorphic eigenform f of weight one, level N≥1 and Dirichlet character ε with ε(−1)=−1, construct a continuous finite-image representation ρ_f:G_ℚ→GL₂(ℂ). At each arithmetic Frobenius p∤N its polynomial is X²−a_p(f)X+ε(p). The representation is semisimple, unique up to isomorphism, unramified outside N and irreducible exactly when f is cuspidal. Its determinant is ε through class field theory and complex conjugation has eigenvalues 1,−1. Choose a coefficient number field, a place λ and a stable lattice when reducing it. Weight-one attachment is distinct from weight-at-least-two étale cohomology.

**Prerequisites.** R17.6/classical-higher-weight-attachment; R15 `R15.5/deligne-serre-eigenvalue-lifting-lemma`; R01 `R01.5`; ModularForms Layers 0, 4 and 8W. Construct the finite-image representation using Deligne–Serre's weight-one lifting, bounded-coefficient and Frobenius-recognition argument in §8, including both the Eisenstein and cuspidal branches.

**Source.** [ds74], Theorem 4.1, Corollary 4.2 and Remarks 4.4–4.5, pp. 513–515; §8, pp. 525–529. The initial Frobenius polynomial assertion is at good primes; it does not alone determine the ramified factors.

### classical-conductor-comparison: The conductor bound needed for exact residual level

For a primitive newform f of weight k≥2, exact level M and character ε, and its classical attachment at λ|ℓ, prove that the Artin conductor away from ℓ equals the prime-to-ℓ part of M. Full Frobenius-semisimple Weil–Deligne compatibility, including the nilpotent operator, identifies the ramified factors. Reduction of a stable lattice does not increase the prime-to-ℓ conductor. Thus, if a semisimple residual representation has odd conductor N, ℓ=2 and comes from a primitive form of level M|N, then M=N. The required bound concerns the actual attachment of f, not any representation with the same unramified traces.

**Prerequisites.** R17.6/classical-higher-weight-attachment; R16.3 and R16.6/classical-hecke-and-level; R01 `R01.3` and `R01.5`; HilbertModularVarietiesAndShimuraCurves `R18.4` for the cohomological realization. Prove the integral ramified local–global comparison before passing to the residual conductor.

**Sources.** [ddt], Theorem 3.1(d)–(e), p. 86, for weight two; [carayol86], Theorem (A), pp. 409–411, for the local–global comparison; [rt97], Lemma and its level argument, pp. 302–306, for the residual application.

<a id="r17-6-solvable-dihedral"></a>

### solvable-dihedral: Solvable characteristic-two images are dihedral

Let r̄:G_Q→GL₂(F̄₂) be continuous and absolutely irreducible, with solvable projective image. Then its projective image is a dihedral group D_n of order 2n with n odd ≥3. Reason, from the R01.4 classification in characteristic two: PGL₂(F̄₂)=PSL₂(F̄₂)≅SL₂(F̄₂); every 2-subgroup of SL₂(F̄₂) is elementary abelian and unipotent, so it fixes a unique line; hence a finite subgroup with a nontrivial normal 2-subgroup (every Borel-type group, the Klein four group, and A₄, which here is the Borel subgroup of SL₂(F₄)) fixes a point of P¹, as does a cyclic group of odd order, and makes r̄ reducible; S₄ does not embed because its Sylow 2-subgroup is nonabelian; an even-order element of a dihedral subgroup is an involution, so n is odd. After removing a scalar character (determinant-untwist), the linear image is dihedral of order 2n. This is a Galois application of the existing finite-group classification, not a second classification proof. In characteristic two the determinant condition at complex conjugation is vacuous, so it cannot be used to deduce that a naive complex lift is odd.

**Hypotheses.** The coefficient field is discrete, so continuity gives finite image. R01.4 supplies the characteristic-two finite-subgroup classification.

**Prerequisites.** R01 `R01.1`; R01 `R01.4`; R17.6/determinant-untwist.

**Sources.** [wiese04], Introduction, printed p. 123 (PDF p. 1); [rt97], §2, first paragraph, printed p. 306 (PDF p. 8); [rt97], §2, first paragraph, printed p. 306 (PDF p. 8); [rt97], Introduction, printed p. 299 (PDF p. 1).

<a id="r17-6-determinant-untwist"></a>

### determinant-untwist: Removing the characteristic-two scalar character

For continuous absolutely irreducible r̄:G_Q→GL₂(F̄₂) with dihedral projective image D_n, n odd ≥3, the determinant character det r̄ has odd order and a unique square root ξ:G_Q→F̄₂^× (unique among all characters, since a²=1 forces a=1 in characteristic two); ξ has odd order and is unramified at 2. The twist r̄₀=r̄⊗ξ^{-1} has determinant one and its image maps isomorphically onto the projective image, so it is dihedral of order 2n: a finite scalar in SL₂(F̄₂) is trivial. Conversely, a projective-dihedral r̄ has linear-dihedral image exactly when det r̄=1, because D_n (n odd) is generated by involutions and involutions in GL₂(F̄₂) are unipotent. Twisting a residual modular form for r̄₀ back by ξ (via reciprocity, a Teichmüller lift of ξ and a finite coefficient extension) recovers r̄; level and nebentypus are then recomputed using the actual twist, not held fixed.

**Hypotheses.** Global reciprocity identifies ξ with an odd-order Dirichlet character. The modular-form twist uses its Teichmüller lift and a finite coefficient extension.

**Prerequisites.** R01 `R01.1`; R01 `R01.3`; R01 `R01.4`; ClassFieldTheory Layer 11; GlobalNumberFields Layer 9.

**Sources.** [wiese04], §4, proof of Theorem 10, printed p. 131 (PDF p. 9); [wiese04], Introduction, printed p. 125 (PDF p. 3); [rt97], Introduction, printed p. 300 (PDF p. 2).

<a id="r17-6-teichmuller-conductor"></a>

### teichmuller-conductor: Teichmüller lift and the four dyadic conductor cases

Let r̄₀:G_Q→GL₂(F̄₂) be irreducible with linear-dihedral image of order 2n, n odd ≥3. Then r̄₀=Ind_{G_K}^{G_Q}φ for the uniquely determined quadratic field K and a character φ:G_K→F̄₂^× of odd order. Let φ̃ be the unique complex character of G_K of the same order with φ̃≡φ modulo the fixed prime l|2 (the place λ), and ρ̃=Ind φ̃. For every σ the 1-eigenspaces of ρ̃(σ) and r̄₀(σ) have equal dimension: rotations have eigenvalues φ̃(σ)^{±1}, odd-order roots of unity on which reduction is injective; a reflection has complex eigenvalues 1,−1 and its residual image is a nontrivial unipotent involution, never semisimple. Every subgroup of D_n is cyclic or contains a nontrivial rotation, so the invariants of all ramification groups at odd primes agree and the prime-to-two Artin conductor of ρ̃ is N=N(r̄₀): |D|·N_{K/Q}f(φ̃)=2^νN, D=disc K. If 2 splits or ramifies in K then N f(φ̃) is odd; if 2 is inert it is odd or an odd multiple of 4. The four cases are: (i) D and N f(φ̃) odd, ν=0; (ii) D≡5 mod 8 (printed 'D≡±5 (mod 8)'; −5≡3 mod 8 is not a discriminant) and N f(φ̃)≡4 mod 8, ν=2; (iii) D≡4 mod 8 and N f(φ̃) odd, ν=2; (iv) D≡0 mod 8 and N f(φ̃) odd, ν=3. The exponent ν=3 belongs to case (iv).

**Hypotheses.** Fix Q̄⊂ℂ and the prime l above two, with compatible residue embeddings. φ̃ is also viewed as an odd-order ray-class character; f(φ̃) is its finite conductor.

**Prerequisites.** R01 `R01.3`; R01 `R01.4`; ClassFieldTheory Layer 11; GlobalNumberFields Layer 7; GlobalNumberFields Layer 9.

**Sources.** [rt97], §2, first paragraph, printed p. 306 (PDF p. 8); [rt97], §2, first paragraph, printed p. 306 (PDF p. 8); [rt97], §2, second paragraph, printed p. 306 (PDF p. 8); [rt97], §2, second paragraph, list (i)–(iv), printed p. 306 (PDF p. 8); [rt97], §2, sentence after the list, printed p. 307 (PDF p. 9).

<a id="r17-6-rt-technical-lemma"></a>

### rt-technical-lemma: Rohrlich–Tunnell’s weight and level lemma

Fix Q̄⊂C and a prime ideal l of the algebraic integers above 2 (the coefficient place λ). Let g=Σb(n)q^n∈Prim₁(2^νNr,χ), a normalized newform of weight one, exact level 2^νNr and character χ with χ²=1, where ν∈{0,2,3}, N is odd and r is either 1 or an odd prime not dividing N. Assume N=N(ρ_g); if r≠1 assume b(r)≢1 mod l; if ν=2 assume b(n)=0 whenever n is even; if ν=3 assume b(2)≢0 mod l. Put k=2 if ν∈{0,2} and k=4 if ν=3. Then there is f∈Prim_k(N), a normalized newform of weight k, exact level N and trivial character, with ρ_f≅ρ_g. The Fourier conditions are used in the proof (RT Remark 2: without b(n)=0 for even n, formula (3) in Case 2 is false); the source does not show they are necessary. The theorem is a specialized arithmetic application of the imported Deligne–Serre lifting and old/newform theory, not a replacement for them.

**Hypotheses.** ρ_h means the semisimple residual representation at the fixed place, with good-prime traces and determinants of h.

**Prerequisites.** R15 `R15.5/deligne-serre-eigenvalue-lifting-lemma`; R15 `R15.5/reduction-to-weight-at-least-two-and-to-a-true-eigenform`; R01 `R01.3`; R01 `R01.5`; R17.6/classical-conductor-comparison; R15 `R15.6/residual-modularity-witness`; ModularForms Layer 4; ModularForms Layer 6; R17.6/classical-weight-one-attachment; R17.6/classical-higher-weight-attachment.

**Sources.** [rt97], §1, Lemma, printed p. 302 (PDF p. 4); [rt97], §1, Lemma, printed p. 302 (PDF p. 4); [rt97], §1, printed p. 301 (PDF p. 3); [rt97], §1, proof of the Lemma, step (iii), printed p. 302 (PDF p. 4); [rt97], §1, preliminary remark, printed p. 302 (PDF p. 4); [rt97], §1, Case 2 (ν=2), printed p. 304 (PDF p. 6).

<a id="r17-6-serre-odd-trick"></a>

### serre-odd-trick: The real-quadratic odd-lift trick

Let r̄₀=Ind_{G_K}^{G_Q}φ, φ̃, N and ν be as in teichmuller-conductor with K real quadratic (D>0) and D odd or divisible by 8; let ∞₁,∞₂ be the real places of K. There exist a prime ideal 𝔯 of K of degree one, prime to 2N, and a quadratic Hecke character ξ of K ramified precisely at ∞₁ and 𝔯, with φ̃(𝔯)≠1. Put r=N𝔯, an odd prime not dividing N and split in K, and g=Σb(n)q^n where L(s,φ̃ξ)=Σb(n)n^{−s}. Then Ind(φ̃ξ) is odd because ξ has mixed signature, its Artin conductor is 2^νN·r, and g∈Prim₁(2^νNr,χ) with χ the product of the Kronecker symbol at D and the (odd) Legendre symbol at r. Since ξ≡1 mod l, ρ_g≅r̄₀ and N(ρ_g)=N. Moreover b(r)≡φ̃(𝔯′)=φ̃(𝔯)^{−1}≢1 mod l, in case (ii) b(n)=0 for even n, and in case (iv) b(2)≢0 mod l. Thus g satisfies every hypothesis of rt-technical-lemma. This controlled auxiliary ramification is the Serre trick used by Rohrlich–Tunnell, distinct from Wiese's trace-zero choice of auxiliary primes.

**Hypotheses.** Use degree-one primes in the specified narrow ray class modulo 4f(φ̃), by Chebotarev.

**Prerequisites.** R17.6/teichmuller-conductor; R17.5/dihedral-artin; R17.5/q-weight-one; ClassFieldTheory Layer 11; GlobalNumberFields Layer 7; R01 `R01.3`; R17.5/quadratic-induction; Chebotarev Layer 10; GlobalNumberFields Layer 9.

**Sources.** [rt97], §2, proof of the Theorem, case D>0, printed p. 307 (PDF p. 9); [rt97], §2, proof of the Theorem, case D>0, printed p. 307 (PDF p. 9); [rt97], §2, proof of the Theorem, case D>0, printed p. 307 (PDF p. 9); [rt97], §2, construction of 𝔯 and ξ, printed p. 308 (PDF p. 10); [rt97], Remark 1, printed p. 308 (PDF p. 10).

<a id="r17-6-rohrlich-tunnell"></a>

### rohrlich-tunnell: Rohrlich–Tunnell characteristic-two modularity

Fix Q̄⊂C and a prime ideal l above 2 (the coefficient place λ). Let r̄₀:G_Q→GL₂(F̄₂) be continuous and irreducible with linear-dihedral image (so det r̄₀=1), K the uniquely determined quadratic field with r̄₀=Ind_{G_K}^{G_Q}φ, D its discriminant, N=N(r̄₀) the (odd) prime-to-two conductor, ν defined by |D|·N_{K/Q}f(φ̃)=2^νN, and k=2 if ν∈{0,2}, k=4 if ν=3 (Serre's weight, which RT cite from Serre 1987, p. 188). If D is odd or divisible by 8, that is in cases (i), (ii) and (iv) of teichmuller-conductor, there is f∈Prim_k(N), a normalized newform of exact level N, trivial character and weight k, with ρ_f≅r̄₀ at l. Thus odd D gives weight 2 (ν=0 or 2) and 8|D gives weight 4 (ν=3). For D<0 use the odd induction of φ̃; for D>0 use serre-odd-trick and remove its auxiliary prime with the technical lemma. The theorem makes no assertion when D≡4 mod 8 (case (iii)); the authors know neither examples nor counterexamples there. A projective-dihedral r̄ with nontrivial determinant is outside the theorem and is reached only through determinant-untwist, with recomputed level and character.

**Prerequisites.** R17.6/teichmuller-conductor; R17.6/serre-odd-trick; R17.6/rt-technical-lemma; R17.5/q-weight-one; R17.5/dihedral-artin; R17.5/quadratic-induction.

**Sources.** [rt97], §2, Theorem, printed p. 307 (PDF p. 9); [rt97], §2, paragraph before the Theorem, printed p. 307 (PDF p. 9); [rt97], §2, proof, case D<0, printed p. 307 (PDF p. 9); [rt97], Remark 2, printed p. 308 (PDF p. 10); [rt97], Remark 3, printed p. 308 (PDF p. 10).

<a id="r17-6-wiese-odd-lift"></a>

### wiese-odd-lift: Odd characteristic-zero lifts of mod-two dihedral representations

Let r̄:G_Q→GL₂(F̄₂) be continuous and dihedral in Wiese's sense: r̄≅Ind_{G_K}^{G_Q}χ for a quadratic field K and a character χ:G_K→F̄₂^× with χ≠χ^σ (equivalently r̄ is irreducible with projective image D_n, n≥3; n is odd in characteristic two). Wiese's oddness hypothesis is vacuous in characteristic two. Let m be the order of r̄(G_Q), ζ_m a primitive m-th root of unity and P any prime of Q(ζ_m) above 2. (Wiese Lemma 3) There is an odd dihedral r̂:G_Q→GL₂(Z[ζ_m]) whose reduction modulo P is isomorphic to r̄: r̂=Ind χ̃ for the same-order lift χ̃ of χ when this is odd, and otherwise (which forces K real quadratic) r̂=Ind(χ̃ξ) with ξ the quadratic character of K(√λ)/K for some λ∈O_K of negative norm. No conductor is controlled in this general case. (Wiese Lemma 2) If moreover r̄ is unramified at 2 with conductor N, then either (a) some such r̂ has Artin conductor N, or (b) K is real quadratic and there is an infinite set S of primes ℓ, which may be taken odd, split in K and prime to N, with tr r̄(Frob_ℓ)=0, such that for each ℓ∈S some odd dihedral r̂_ℓ:G_Q→GL₂(Z[ζ_m]) of Artin conductor Nℓ reduces to r̄ modulo P. The result covers projective-dihedral images (scalar twists of linear-dihedral ones), not only the linear-dihedral images of Rohrlich–Tunnell.

**Hypotheses.** Embed ℤ[ζ_m]/P in F̄₂ compatibly with χ. N is the prime-to-two Artin conductor in the unramified refinement.

**Prerequisites.** R17.5/quadratic-induction; R01 `R01.1`; R01 `R01.3`; R01 `R01.4`; ClassFieldTheory Layer 11; GlobalNumberFields Layer 7; Chebotarev Layer 10.

**Sources.** [wiese04], Lemma 2, printed p. 126 (PDF p. 4); [wiese04], Lemma 2(b), printed p. 126 (PDF p. 4); [wiese04], Lemma 3 and proof, printed p. 127 (PDF p. 5); [wiese04], proof of Lemma 2, printed p. 127 (PDF p. 5).

<a id="r17-6-unramified-katz"></a>

### unramified-katz: Unramified mod-two dihedral Katz weight one

Let r̄:G_Q→GL₂(F̄₂) be continuous and dihedral in Wiese's sense, unramified at 2, with conductor N=N(r̄) (the prime-to-2 Artin conductor, an odd integer) and ε=det r̄ viewed as a character of (Z/NZ)^×. Then there is a cuspidal Katz eigenform f∈S₁(Γ₁(N),ε,F̄₂)_Katz for all Hecke operators, which may be normalised (a₁=1), whose associated Galois representation is isomorphic to r̄: a_ℓ(f)=tr r̄(Frob_ℓ) and ε(ℓ)=det r̄(Frob_ℓ) for primes ℓ∤2N. This is Wiese Theorem 9 for p=2: the level is the conductor of r̄ and the character is det r̄. No condition at 2 beyond unramifiedness is imposed, so representations exceptional at 2 (restriction to a decomposition group at 2 a sum of two copies of one unramified character, for example K=Q(√229) with 2 inert) are included. The theorem does not assert a characteristic-zero weight-one form of level N reducing to r̄. Wiese's Introduction states, without proof, that none exists when K is real quadratic of discriminant N with fundamental units of norm −1 (example Q(√229)). The oldform and descent inputs (Wiese Proposition 4, Corollary 5, Proposition 7, Corollary 8) are imported through the R15.2 request; the new arithmetic combination is this theorem.

**Hypotheses.** Katz forms use Wiese's non-compactified Γ₁(N) definition; N is invertible in F̄₂. Unramifiedness at two is equivalent to the minimal weight being one.

**Prerequisites.** R17.6/wiese-odd-lift; R17.5/q-weight-one; R15 `R15.1/hodge-bundle-with-tate-curve-normalization`; R15 `R15.1/cusp-ideal-section-forms`; R15 `R15.2/q-expansion-principle-and-its-vanishing-theorem`; R15 `R15.2`; R16.6; R01 `R01.5`; R15 `R15.2/integral-hecke-operators-from-q-expansions`; R15 `R15.6/modularity-formulations-and-determinant`.

**Sources.** [wiese04], Theorem 9, printed p. 130 (PDF p. 8); [wiese04], proof of Theorem 9, printed p. 131 (PDF p. 9); [wiese04], Proposition 7, printed p. 129 (PDF p. 7); [wiese04], Introduction, printed p. 124 (PDF p. 2).

<a id="r17-6-qualitative-residual-modularity"></a>

### qualitative-residual-modularity: Characteristic-two solvable residual modularity

Every continuous absolutely irreducible r̄:G_Q→GL₂(F̄₂) with solvable projective image is realized by a holomorphic cuspidal weight-one newform, after choosing a coefficient number field, λ|2, a residue-field embedding and a stable lattice. The newform's level is the Artin conductor of the chosen odd lift and is not controlled in general. The qualitative proof applies the finite classification (such an r̄ has projective image D_n with n odd ≥3, so it is dihedral in Wiese's sense), Wiese’s odd lift (Lemma 3), and then dihedral Artin weight-one automorphy (Weil–Langlands, as in Wiese's proof of Theorem 1). If one wants a weight≥2 witness, apply the existing R15.5 reduction/true-eigenform result: Eisenstein multiplication for the reduction of a characteristic-zero form, and Hasse powers only when a Katz form is the input and the integral lifting criterion has been met. This broad existence theorem does not claim the exact minimal weight, level or trivial character of the restricted Rohrlich–Tunnell theorem.

**Hypotheses.** The residual comparison is semisimplified at the chosen place and residue embedding.

**Prerequisites.** R17.6/solvable-dihedral; R17.6/wiese-odd-lift; R17.5/q-weight-one; R15 `R15.5/reduction-to-weight-at-least-two-and-to-a-true-eigenform`; R15 `R15.6/residual-modularity-witness`.

**Sources.** [wiese04], proof of Theorem 1, printed p. 131 (PDF p. 9); [wiese04], Introduction, printed p. 123 (PDF p. 1); [wiese04], Lemma 3, printed p. 127 (PDF p. 5).

<a id="r17-6-weight-two-witness"></a>

### weight-two-witness: Transfer to the weight-at-least-two residual witness

Given either an odd complex weight-one dihedral form reducing to r̄ or the preceding unramified Katz form, obtain the R15.6 residual-modularity witness with some weight k≥2 and its actual primitive level. For the reduction of a characteristic-zero weight-one form, use R15.5's Eisenstein multiplication (E₄≡1 mod 2). For a Katz input in characteristic two, the Hasse invariant has weight one and q-expansion one, so multiplying by a power of it preserves the q-expansion and the residual away-two eigencharacter. Wiese's Introduction uses a single factor (weight 2, which is Serre's weight for r̄ unramified at 2), together with the classicality of Katz forms of weight ≥2 on Γ₁(N). That classicality holds for N≥5, which covers N(r̄) here: an irreducible dihedral r̄ unramified at 2 has N(r̄)≥5. The lifting uses R15.5’s finite-free integral realization and cohomological lifting criterion, with R15.2's base change (stated at full level n≥3, weight ≥2), so choose the weight and an auxiliary level satisfying that criterion. Multiplication alone does not produce a characteristic-zero eigenform. Apply the DS lemma to the commuting Hecke action over a dominating DVR, then the true-eigenform/old-newform reduction. Record K_f, λ|2, common residue-field embeddings and a stable lattice realizing r̄ semisimply. The character of the witness lifts det r̄ but need not be its Teichmüller lift. This application imports Hasse, DS and the witness definition unchanged.

**Hypotheses.** At an odd ℓ the factor ℓ^(k−1) is one modulo two, so the Hasse shift preserves that eigencharacter. Use the cusp-sheaf H¹ vanishing and integral character conditions in R15.5.

**Prerequisites.** R17.6/qualitative-residual-modularity; R17.6/unramified-katz; R15 `R15.3/hasse-invariant-as-a-form-of-weight-p-minus-one`; R15 `R15.5/deligne-serre-eigenvalue-lifting-lemma`; R15 `R15.5/reduction-to-weight-at-least-two-and-to-a-true-eigenform`; R15 `R15.6/residual-modularity-witness`; R01 `R01.5`; R15 `R15.2/base-change-for-spaces-of-forms-and-the-weight-one-boundary`; R15 `R15.6/modularity-formulations-and-determinant`; R17.6/classical-higher-weight-attachment.

**Sources.** [wiese04], Introduction, printed p. 124 (PDF p. 2); [wiese04], Introduction, printed p. 124 (PDF p. 2); [wiese04], proof of Lemma 11, printed p. 132 (PDF p. 10).

<a id="r17-6-disjoint-irreducibility"></a>

### disjoint-irreducibility: Residual irreducibility under disjoint base change

Let F be a number field and r̄:G_F→GL₂(k̄) be continuous and absolutely irreducible with finite projective image, k̄ algebraically closed. Let M/F be the finite Galois extension fixed by the projective kernel. For any finite E/F linearly disjoint from M over F, the projective image of r̄|_{G_E} equals that of r̄, and the restriction is absolutely irreducible. Since M is contained in the field L fixed by ker r̄, linear disjointness from L (a stronger hypothesis) also suffices. Solvability of E/F by itself does not preserve irreducibility. This is the exact finite-image application exported to Moret–Bailly/potential modularity; the construction of E with prescribed local conditions and disjointness belongs to R23.1.

**Hypotheses.** E/F need not be Galois or solvable. Linear disjointness is tested against the projective-kernel field M; the stronger test against L also suffices.

**Prerequisites.** R01 `R01.1`; R01 `R01.4`.

**Sources.** [langlands80], §2, Digital Math Archive text p. 13 (PDF p. 16); [wiese04], §2, printed p. 125 (PDF p. 3).

<a id="r17-6-quadratic-restriction"></a>

### quadratic-restriction: The bad-dihedral quadratic restriction condition

For a finite-image irreducible rank-two r=Ind_{G_K}^{G_F}θ, with K/F quadratic and coefficients in an algebraically closed field of any characteristic, and a finite E/F: r|_{G_E} is irreducible exactly when G_E is not contained in G_K and θ|_{G_{EK}}≠θ^σ|_{G_{EK}}. If E contains K, the restriction is reducible: it is the sum of the two restricted characters. When K⊄E, the restriction is Ind_{G_{EK}}^{G_E}(θ|_{G_{EK}}), since G_EG_K=G_F, and conjugation by any element of G_E∖G_{EK} acts on θ|_{G_{EK}} as σ does. The index-two irreducibility criterion holds in every characteristic. Restricted to G_{EK} the representation is the sum of the two distinct characters θ and θ^σ, which an element of G_E∖G_{EK} swaps. If they coincide, θ extends to G_E and Frobenius reciprocity gives a one-dimensional quotient. Quadratic or solvable base changes must be checked against this criterion; the same loss of cuspidality occurs in quadratic automorphic induction/base change. Generic induction and Clifford theory remain with InductionRestriction/R01.4; the Layer 4 Mackey criterion there assumes the group order invertible, so it is not used in characteristic two.

**Hypotheses.** θ is continuous of finite image and θ≠θ^σ. E/F need not be Galois. The characteristic-zero Mackey theorem requiring invertible group order cannot be used for the even-order characteristic-two case.

**Prerequisites.** R01 `R01.4`; R17.5/quadratic-induction; R17.4/cuspidality; RepresentationTheory/InductionRestriction Layer 3; Tau Ceti `TauCeti.simple_indFDRep_ofLinearCharacter_iff`.

**Sources.** [wiese04], §2, printed p. 125 (PDF p. 3); [langlands80], §2, Digital Math Archive text p. 13 (PDF p. 16).

<a id="r17-6-compatible-base-change"></a>

### compatible-base-change: Base change of a supplied compatible system

Let {ρ_λ} be a compatible family over F with a common coefficient field and good-place characteristic polynomials P_v, and π a GL₂ automorphic representation matching those polynomials in the fixed arithmetic normalization. For a finite solvable Galois E/F, restriction to G_E matches BC_{E/F}(π) at every good w|v (π_v and ρ_λ unramified at v, v prime to the residue characteristic of λ) by the Frobenius power formula: if P_v has roots α,β, the new polynomial has roots α^{f(w/v)},β^{f(w/v)}. On the automorphic side this is the unramified local lifting π(µ,ν)↦π(µ∘N,ν∘N) at each prime-cyclic step; on the Galois side it is Frob_w↦Frob_v^{f(w/v)}. Keep the residual cuspidality/irreducibility conditions from cyclic-base-change and disjoint-irreducibility; apply quadratic-restriction for dihedral exceptions. This theorem takes the compatible system as data. Existence of an attached family, its integral lattices and the geometric realization belong to R19/R24 and are not proved here.

**Hypotheses.** Each ρ_λ is continuous and semisimple. The P_v lie in M[X] and are λ-independent. Since q_w=q_v^f, the half-power normalization also commutes with restriction. A good v may ramify in E.

**Prerequisites.** R17.4/solvable-base-change; R17.4/local-compatibility; R17.6/disjoint-irreducibility; R17.6/quadratic-restriction; R01 `R01.1`; R01 `R01.5`.

**Sources.** [langlands80], §2 local lifting, condition (i), Digital Math Archive text p. 9 (PDF p. 12); [langlands80], §2 after properties (A)–(F), Digital Math Archive text p. 14 (PDF p. 17); [ac89], Chapter 3 §1 before Definition 1.1, eq. (1.1), printed p. 199 (PDF p. 215).

<a id="r17-6-compatible-descent"></a>

### compatible-descent: Automorphic descent with a consistent compatible-system twist

Let E/F be cyclic of prime degree ℓ, η a character of F^×N(A_E^×)\A_F^× of order ℓ, and Π cuspidal over E with Π^σ≅Π. By AC89 Theorem 4.2(d) (Langlands Lemma 11.6(b) for GL₂), the cuspidal descents of Π are exactly π⊗η^i, 0≤i<ℓ, pairwise non-isomorphic, for one chosen descent π. Let {r_λ} be supplied semisimple representations of G_F over a common coefficient field whose restrictions to G_E match the family attached to Π. A matching descent is a single index i, independent of λ, such that the good-place characteristic polynomials of π⊗η^i agree with those of every r_λ. Under that equality, R01.5 identifies each r_λ with the corresponding member attached to π⊗η^i, and i is unique. Suppose each r_λ|_{G_E} is absolutely irreducible and a family {ρ_{π,λ}} attached to π is supplied. Then for each λ, r_λ≅ρ_{π,λ}⊗η^{i(λ)} for some i(λ) (Schur's lemma on the cyclic step). If {r_λ} is compatible, a match at one λ forces the same i at every λ, because both families have λ-independent polynomials. Galois descents chosen independently at different λ, without this common index, do not give one automorphic descent matching the family. In a solvable tower impose this condition at each prime-cyclic step, with its actual descent fiber and local data.

**Hypotheses.** The representations r_λ are continuous. Good places exclude ramification of π, η and r_λ, and the residue characteristic of λ. The intermediate attached families are supplied data.

**Prerequisites.** R17.4/cyclic-descent; R17.4/cyclic-descent-fibers; R17.4/solvable-descent; R01 `R01.5`; ClassFieldTheory Layer 11.

**Sources.** [ac89], Chapter 3 Theorem 4.2(d), printed p. 202 (PDF p. 218); [ac89], Chapter 3 Theorem 3.1, printed p. 201 (PDF p. 217); [langlands80], §11 Lemma 11.6(b), Digital Math Archive text p. 151 (PDF p. 154); [bcgp21], proof of Lemma 8.3.2, printed p. 452 (PDF p. 300).

<a id="r17-6-potential-modularity-interface"></a>

### potential-modularity-interface: Transfer interface for potential modularity

Let E/F be a finite solvable Galois extension with the prescribed local completions and disjointness hypotheses supplied by potential modularity, ρ a rank-two Galois representation of G_F, and Π a cuspidal automorphic representation over E matching ρ|_{G_E} at almost all places. Export the following conditional interface. Irreducibility survives under the disjointness criterion. Local transfer uses the exact completion-wise restriction (strong lifting at each prime-cyclic step). Descent to F goes through a prime-cyclic tower. At each step, once the cuspidal representation over the upper field matches the restriction of ρ there, its invariance under the cyclic step is automatic: for Π, Π^τ matches (ρ|_{G_E})^τ≅ρ|_{G_E}, so Π^τ≅Π by strong multiplicity one. AC89 Theorem 4.2(d) then gives a cuspidal descent with its ℓ twists. What is not automatic is the stepwise consistent character matching of compatible-descent. It needs absolute irreducibility of the restriction and representations attached to the intermediate descents; without them, Galois descent of ρ does not identify which automorphic twist matches. Extension construction, potential automorphy and compatible-family existence stay with R23/R24.

**Hypotheses.** ρ is continuous and its restriction to G_E is absolutely irreducible. Check the common-index condition with the supplied representations of intermediate descents at each prime-cyclic step. Non-Galois extensions are excluded.

**Prerequisites.** R17.4/prescribed-local-base-change; R17.6/disjoint-irreducibility; R17.6/compatible-base-change; R17.6/compatible-descent; R16.4.

**Sources.** [ac89], Chapter 3 Theorem 4.2, printed p. 202 (PDF p. 218); [ac89], Chapter 3 Theorem 5.1, printed p. 212 (PDF p. 228); [bcgp21], proof of Lemma 8.3.2, printed p. 452 (PDF p. 300).

## Bibliography

[jl70]: https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl_9.pdf "Automorphic forms on GL(2)"
[casselman73]: https://lesesvre.perso.math.cnrs.fr/newforms-references/casselman.pdf "On some results of Atkin and Lehner"
[nt26]: https://arxiv.org/pdf/2212.03595v2 "Symmetric power functoriality for Hilbert modular forms"
[dlb17]: https://arxiv.org/pdf/1509.00606v2 "Revêtements du demi-plan de Drinfeld et correspondance de Langlands p-adique"
[bz76]: https://www.math.tau.ac.il/~bernstei/Publication_list/publication_texts/B-Zel-RepsGL-Usp.pdf "Representations of the group GL(n, F), where F is a non-archimedean local field"
[bm02]: https://www.imo.universite-paris-saclay.fr/m/~breuil/PUBLICATIONS/multiplicite.pdf "Multiplicités modulaires et représentations de GL₂(ℤp) et de Gal(Q̄p/Qp), Appendix: Sur l’unicité des types pour GL₂"
[cdt99]: https://math.stanford.edu/~conrad/papers/cdtmaster.pdf "Modularity of certain potentially Barsotti–Tate Galois representations"
[cg18]: https://math.uchicago.edu/~fcale/papers/CG.pdf "Modularity lifting beyond the Taylor–Wiles method"
[cg20]: https://par.nsf.gov/servlets/purl/10184292 "Minimal modularity lifting for nonregular symplectic representations"
[bcgp21]: https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf "Abelian surfaces over totally real fields are potentially modular"
[hkp10]: https://www.math.umd.edu/~tjh/IHA.apr.09.pdf "Iwahori–Hecke algebras"
[aky22]: https://arxiv.org/pdf/2110.09070v4 "Local newforms for the general linear groups over a non-archimedean local field"
[cdn20]: https://www.ams.org/journals/jams/2020-33-02/S0894-0347-2019-00935-5/S0894-0347-2019-00935-5.pdf "Cohomologie p-adique de la tour de Drinfeld: le cas de la dimension 1"
[cdn23]: https://www.cambridge.org/core/services/aop-cambridge-core/content/view/79733067FC7CB7574B408744E4387F91/S205050862300015Xa.pdf/factorisation-de-la-cohomologie-etale-p-adique-de-la-tour-de-drinfeld.pdf "Factorisation de la cohomologie étale p-adique de la tour de Drinfeld"
[pan26]: https://arxiv.org/pdf/2209.06366 "On locally analytic vectors of the completed cohomology of modular curves II"
[converse]: https://people.math.osu.edu/cogdell.1/PSCT-www.pdf "Piatetski-Shapiro’s work on converse theorems"
[langlands80]: https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf "Base change for GL(2)"
[ac89]: https://www.claymath.org/library/cw/arthur/pdf/30.pdf "Simple algebras, base change, and the advanced theory of the trace formula"
[getz15]: https://sites.math.duke.edu/~jgetz/aut_reps.pdf "An introduction to automorphic representations"
[cogdell-fields]: https://people.math.osu.edu/cogdell.1/fields-www.pdf "Lectures on L-functions, converse theorems, and functoriality for GL(n)"
[jl70-global]: https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl.pdf "Automorphic forms on GL(2)"
[br10]: https://imag.umontpellier.fr/~ioan-badulescu/Files/br_jl.pdf "Unitary dual of GL(n) at archimedean places and global Jacquet–Langlands correspondence"
[gj78]: https://www.numdam.org/article/ASENS_1978_4_11_4_471_0.pdf "A relation between automorphic representations of GL(2) and GL(3)"
[patrikis]: https://people.math.osu.edu/patrikis.1/variationsrevision.pdf "Variations on a theorem of Tate"
[carayol86]: https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf "Sur les représentations l-adiques associées aux formes modulaires de Hilbert"
[rt97]: https://msp.org/pjm/1997/181-3/pjm-v181-n3-p16-p.pdf "An elementary case of Serre’s conjecture"
[wiese04]: https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-09/07.pdf "Dihedral Galois representations and Katz modular forms"
[cdn20-global]: https://webusers.imj-prg.fr/~wieslawa.niziol/GPW5.pdf "Cohomologie p-adique de la tour de Drinfeld: le cas de la dimension 1"
[pan26-global]: https://arxiv.org/pdf/2209.06366v1 "On locally analytic vectors of the completed cohomology of modular curves II"
[rt83]: https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0074/LOG_0007.pdf "On Artin L-functions associated to Hilbert modular forms of weight one"
[ds74]: https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf "Formes modulaires de poids 1"
[tunnell81]: https://www.ams.org/journals/bull/1981-05-02/S0273-0979-1981-14936-3/S0273-0979-1981-14936-3.pdf "Artin's conjecture for representations of octahedral type"
[jpss79]: https://www.math.columbia.edu/~hj/Automorphic%20forms%20on%20GL(3)%20II.pdf "Automorphic forms on GL(3). II"
[tunnell78]: https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0046/LOG_0017.pdf "On the local Langlands conjecture for GL(2)"
[ddt]: https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf "Fermat's Last Theorem"

- **[jl70]** Hervé Jacquet and Robert P. Langlands, *Automorphic forms on GL(2)*. LNM 114 (1970), IAS retypeset editorial PDF (2026); locators use printed section pagination in this PDF.
- **[casselman73]** William Casselman, *On some results of Atkin and Lehner*. Math. Ann. 201 (1973), 301–314, public Göttingen scan.
- **[nt26]** James Newton and Jack A. Thorne, *Symmetric power functoriality for Hilbert modular forms*. Annals 203 (2026); arXiv 2212.03595v2 author version.
- **[dlb17]** Gabriel Dospinescu and Arthur-César Le Bras, *Revêtements du demi-plan de Drinfeld et correspondance de Langlands p-adique*. Annals 186 (2017); arXiv 1509.00606v2.
- **[bz76]** I. N. Bernstein and A. V. Zelevinsky, *Representations of the group GL(n, F), where F is a non-archimedean local field*. Russian Math. Surveys 31:3 (1976), 1–68; English article on Bernstein’s publication page, with printed pagination.
- **[bm02]** Christophe Breuil, Ariane Mézard; appendix by Guy Henniart, *Multiplicités modulaires et représentations de GL₂(ℤp) et de Gal(Q̄p/Qp), Appendix: Sur l’unicité des types pour GL₂*. Duke 115 (2002), author manuscript.
- **[cdt99]** Brian Conrad, Fred Diamond and Richard Taylor, *Modularity of certain potentially Barsotti–Tate Galois representations*. JAMS 12 (1999), author manuscript.
- **[cg18]** Frank Calegari and David Geraghty, *Modularity lifting beyond the Taylor–Wiles method*. Inventiones (2018), author PDF.
- **[cg20]** Frank Calegari and David Geraghty, *Minimal modularity lifting for nonregular symplectic representations*. Duke Math. J. 169 (2020), 801–896; NSF published copy.
- **[bcgp21]** George Boxer, Frank Calegari, Toby Gee and Vincent Pilloni, *Abelian surfaces over totally real fields are potentially modular*. Publ. Math. IHÉS (2021), published PDF.
- **[hkp10]** Thomas Haines, Robert Kottwitz and Amritanshu Prasad, *Iwahori–Hecke algebras*. J. Ramanujan Math. Soc. 25 (2010), author April 2009 version.
- **[aky22]** Hiraku Atobe, Satoshi Kondo and Seidai Yasuda, *Local newforms for the general linear groups over a non-archimedean local field*. Forum Math. Pi (2022); arXiv 2110.09070v4.
- **[cdn20]** Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł, *Cohomologie p-adique de la tour de Drinfeld: le cas de la dimension 1*. JAMS 33 (2020), published PDF.
- **[cdn23]** Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł, *Factorisation de la cohomologie étale p-adique de la tour de Drinfeld*. Forum Math. Pi (2023), published PDF.
- **[pan26]** Lue Pan, *On locally analytic vectors of the completed cohomology of modular curves II*. Annals 203 (2026); arXiv 2209.06366 public version accessed 2026-10-07.
- **[converse]** James W. Cogdell, *Piatetski-Shapiro’s work on converse theorems*. Author survey, 2013.
- **[langlands80]** Robert P. Langlands, *Base change for GL(2)*. Annals Studies 96 (1980), author Digital Math Archive version.
- **[ac89]** James Arthur and Laurent Clozel, *Simple algebras, base change, and the advanced theory of the trace formula*. Annals Studies 120 (1989), public Clay scan.
- **[getz15]** Jayce R. Getz, *An introduction to automorphic representations*. Author-hosted course notes, 13 March 2015 (89 pages).
- **[cogdell-fields]** James W. Cogdell, *Lectures on L-functions, converse theorems, and functoriality for GL(n)*. Fields Institute lecture notes, author-hosted PDF; printed pagination retained.
- **[jl70-global]** Hervé Jacquet and Robert P. Langlands, *Automorphic forms on GL(2)*. Lecture Notes in Mathematics 114 (1970), author scan.
- **[br10]** Alexandru Ioan Badulescu, with an appendix by David Renard, *Unitary dual of GL(n) at archimedean places and global Jacquet–Langlands correspondence*. Author preprint of Compositio Math. 146 (2010), 1115–1164; preprint page = PDF page.
- **[gj78]** Stephen Gelbart and Hervé Jacquet, *A relation between automorphic representations of GL(2) and GL(3)*. Ann. Sci. ÉNS (4) 11 (1978), 471–542, published Numdam scan.
- **[patrikis]** Stefan Patrikis, *Variations on a theorem of Tate*. Author revision, 31 July 2016, submitted memoir version.
- **[carayol86]** Henri Carayol, *Sur les représentations l-adiques associées aux formes modulaires de Hilbert*. Ann. Sci. ÉNS (4) 19 (1986), 409–468, published Numdam scan.
- **[rt97]** David E. Rohrlich and Jerrold B. Tunnell, *An elementary case of Serre’s conjecture*. Pacific J. Math. 181, special issue (1997), 299–309, published PDF.
- **[wiese04]** Gabor Wiese, *Dihedral Galois representations and Katz modular forms*. Documenta Mathematica 9 (2004), 123–133, published PDF.
- **[cdn20-global]** Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł, *Cohomologie p-adique de la tour de Drinfeld: le cas de la dimension 1*. Author final GPW5; published JAMS 33 (2020), 311–362; locators below use author pagination.
- **[pan26-global]** Lue Pan, *On locally analytic vectors of the completed cohomology of modular curves II*. arXiv:2209.06366v1; published Annals 203 (2026), 121–281; only v1 used for locators.
- **[rt83]** Jonathan D. Rogawski and Jerrold B. Tunnell, *On Artin L-functions associated to Hilbert modular forms of weight one*. Invent. Math. 74 (1983), 1–42, GDZ article scan (43 PDF pages: cover + pp. 1–42), read through the GDZ OCR pages gdzocr/PPN356556735_0074/00000007–00000048 and page images.
- **[ds74]** Pierre Deligne and Jean-Pierre Serre, *Formes modulaires de poids 1*. Ann. Sci. École Norm. Sup. (4) 7 (1974), 507–530, published Numdam scan.
- **[tunnell81]** Jerrold Tunnell, *Artin's conjecture for representations of octahedral type*. Bull. Amer. Math. Soc. (N.S.) 5 (1981), no. 2, 173–175 (research announcement); AMS PDF with OCR text layer.
- **[jpss79]** Hervé Jacquet, Ilja I. Piatetski-Shapiro and Joseph Shalika, *Automorphic forms on GL(3). II*. Ann. of Math. (2) 109 (1979), 213–258; scan on H. Jacquet's Columbia page without text layer; locators use printed pagination.
- **[tunnell78]** Jerrold B. Tunnell, *On the local Langlands conjecture for GL(2)*. Inventiones Mathematicae 46 (1978), 179–200; GDZ scan of the article (LOG_0017 of PPN356556735_0046, 23 pages including a GDZ cover sheet, so PDF page = printed page − 177), read with the GDZ OCR pages 00000185–00000206 and against the page images of pp. 182–183.
- **[ddt]** Henri Darmon, Fred Diamond and Richard Taylor, *Fermat's Last Theorem*. Author version dated September 9, 2007 (167 pp., printed page = PDF page) of the article in Elliptic Curves, Modular Forms & Fermat's Last Theorem (Hong Kong, 1993), International Press, 1997, 2–140; theorem numbers as in this version.
