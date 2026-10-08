# Modular forms — Hecke theory, newforms, and L-functions, Part II: GL₂ automorphic representations and transfer

The first prerequisite is the upstream [ModularForms roadmap](../../../content/tau-ceti/ModularForms/README.md). Its classical forms, Hecke operators, primitive newspace, coefficient fields and L-functions remain the objects used here. This extension adds their local and adelic representation comparisons and the rank-two calculations needed for quaternionic and cyclic transfer. It covers R16.1–R16.6 and R17.1–R17.2. Global transfer theorems in R17.3–R17.5, automorphic cohomology in R18, Galois construction in R19 and p-adic Banach theory in R30 consume this part.

Each declaration below has a mathematical statement, hypotheses, a proof or construction outline, direct prerequisites and an acceptance condition. Definitions and constructions also specify the API and discriminating examples. The [packet](../packets/GL2AutomorphicRepresentationsAndTransfer--R16.1.json) gives stable node identifiers; the [suggested file](../suggested/GL2AutomorphicRepresentationsAndTransfer--R16.1.lean) supplies provisional signature forms. Every declaration has implementation status `unchecked`. Signature elaboration is independent of implementation.

## Conventions

Write G=GL₂, using the existing matrix unit group on Fin 2. At a finite place F has ring of integers O, maximal ideal p, chosen uniformizer ϖ and residue cardinality q. The normalized absolute value ν satisfies ν(ϖ)=q⁻¹. The Borel is upper triangular, with unipotent n(x)=(1 x;0 1) and modulus δ_B(diag(a,d))=|a/d|. Induction includes δ_B^{1/2}. Thus the exceptional ratio χ₁/χ₂=ν gives a Steinberg subrepresentation and determinant-character quotient; reversing the inducing order reverses that sequence.

K₀(pⁿ) imposes a condition on the lower-left entry. K₁(pⁿ) fixes the last row modulo pⁿ: its diagonal condition is on d, not a. At n=0 both groups are GL₂(O). With right translation and central character ω, the minimal vector has K₀ character ω(d). Casselman prints a top-left convention. Apply that theorem to π∨≅π⊗ω⁻¹det and twist back before comparing the lines. Whittaker normalization uses ψ trivial on O and nontrivial on ϖ⁻¹O; W(1)=1 is fixed only after choosing ψ and the Whittaker functional.

For local reciprocity, Art_F(ϖ)=Φ is **geometric** Frobenius and ν_W(Φ)=q⁻¹. The standard `rec` matches character induction and central character. In rank two `recᵀ(π)=rec(π)⊗ν_W^{-1/2}`. Its Frobenius matrix is multiplied by √q and its determinant acquires ν_W⁻¹. This scalar twist preserves N. The local L-factor uses (ker N)^I; discarding N loses the Steinberg factor. Arithmetic Frobenius is Φ⁻¹. A Galois polynomial at arithmetic Frobenius is converted by inverting eigenvalues before comparison at Φ; the cohomological dual convention must also be stated.

At real places use the full O(2) module. For k≥2 the connected restriction of D_k has holomorphic and antiholomorphic pieces of lowest weights ±k. At k=1 use the full O(2) limit, whose Weil parameter splits as 1⊕sgn. At complex places |z|_ℂ=|z|² and there is no discrete series modulo center. Fix Γℝ(s)=π^{−s/2}Γ(s/2) and Γℂ(s)=2(2π)^{−s}Γ(s); in particular Γℝ(s)Γℝ(s+1)=Γℂ(s). AF.1 plans the archimedean Weil groups, Langlands classification and globalizations, GL₂ discrete and limit modules, SU(2) characters, and LLC with L- and epsilon factors. R16.2 and R16.3 import its exact nodes. Their native Lean carriers and original proof decomposition remain gaps; the AF.1b split is a proposal.

Unramified α,β are unitary-normalized Satake parameters. Spherical T₁ has eigenvalue √q(α+β), while the arithmetic weight-k polynomial has roots q^{(k−1)/2}α,q^{(k−1)/2}β. The algebraic representation used for a classical coefficient-field comparison is π_alg=π_unitary⊗|det|^{−(k−2)/2}. This makes T₁ act by a_p. Coefficient fields are compared in that algebraic normalization. The determinant twist does not change the local conductor.

AA.0 owns restricted Haar products, AA.1 owns adelic points and AA.2 owns quotient measures and central-character L². AL.0 is the sole owner of additive Schwartz–Bruhat and Fourier theory. SR.1 owns the smooth Hecke convolution carrier and its compact-mod-center variant. Finite spherical volumes are one outside a fixed exceptional set. At the Iwahori use its specified volume and distinguish its characteristic function from the normalized spherical idempotent. Orbital matching also fixes centralizer measures: ambient Haar normalizations alone do not determine them.

The global additive character is obtained by trace from F to ℚ, with self-dual local measures and additive quotient mass one. In rank two the analytic conductor in the completed functional equation is |Disc(F)|²N(𝔣π). For a weight-k form over ℚ, the unitary variable s and classical variable t satisfy t=s+(k−1)/2; the involutions are s↔1−s and t↔k−t.

## Existing libraries and imported objects

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The reviewed library audit leaves the eight stages in this part unbuilt. It already supplies their matrix group, ordinary representation, Haar and classical modular-form ingredients. The following declarations are imports, rather than targets of this extension.

| Pinned declaration | What its actual statement supplies |
| --- | --- |
| [mathlib:Matrix.GeneralLinearGroup](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean) | Existing unit group of square matrices over a semiring; GL₂ uses Fin 2, without a second group carrier. |
| [mathlib:Matrix.GeneralLinearGroup.det](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean) | Multiplicative determinant to R units over a commutative ring. |
| [mathlib:Matrix.GeneralLinearGroup.scalar](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean) | Scalar matrices form a monoid homomorphism R units → GL(n,R). |
| [mathlib:Matrix.GeneralLinearGroup.det_scalar](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean) | The determinant of scalar u is u to the cardinality of n; in rank two it is u squared. |
| [mathlib:Matrix.GeneralLinearGroup.map](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean) | A ring homomorphism induces the coefficient map on GL(n,R). |
| [mathlib:Matrix.GeneralLinearGroup.mkOfDetNeZero](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean) | Builds a matrix unit over a field from a nonzero determinant; used for explicit unipotents and diagonals. |
| [mathlib:Representation](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Basic.lean) | A representation is a monoid homomorphism into linear endomorphisms, over a semiring and module. |
| [mathlib:Representation.invariants](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Invariants.lean) | The submodule of vectors fixed by every element of a group; subgroup invariants are restriction to that subgroup. |
| [mathlib:Representation.mem_invariants](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Invariants.lean) | Membership is equivalent to the pointwise fixed-vector equations, with CommRing coefficients and group action. |
| [mathlib:MeasureTheory.Measure.haarMeasure](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/MeasureTheory/Measure/Haar/Basic.lean) | Existing Haar measure normalized on a positive compact; does not provide an automorphic quotient measure. |
| [mathlib:MeasureTheory.Measure.haarMeasure_self](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/MeasureTheory/Measure/Haar/Basic.lean) | The chosen positive compact has Haar mass one. |
| [tauceti:HeckeRing.GL2.Newform](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean) | Existing normalized new cusp form at Γ₁(N), nebentypus and eigenvalues only away from level, new subspace membership and first Fourier coefficient one. Bad-prime eigenconditions are not fields. |
| [tauceti:HeckeRing.GL2.Newform.qExpansion_coeff_one](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean) | The first q-expansion coefficient of a bundled newform equals one. |
| [tauceti:HeckeRing.GL2.Newform.eq_of_forall_notMem_eigenvalue_eq](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ModularForms/Newforms/StrongMultiplicityOne.lean) | At fixed positive level, weight and nebentypus, equality of every good-index eigenvalue outside a finite set gives equality of newforms. This is a classical fixed-level result, not number-field adelic multiplicity one. |
| [tauceti:CuspForm.LSeries_qExpansion_coeff_eq](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ModularForms/LFunction.lean) | For positive weight and Re(s)>k/2+1 the q-coefficient Dirichlet series equals strict cusp width to −s times ModularForm.L; width one gives direct equality. |
| [tauceti:TauCeti.symPowerRep](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/ClassicalGroups/SymmetricPower.lean) | Existing d-th symmetric power of the standard GL(n,k) representation on Sym[k]^d(k^n), over a commutative ring. |
| [tauceti:TauCeti.simple_indFDRep_ofLinearCharacter_iff](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Induction/Mackey/LinearCharacter.lean) | For a finite group, normal subgroup and algebraically closed characteristic-zero coefficients, a linear character induces simply iff each element outside the subgroup changes it under conjugation. The arbitrary Weil-character reduction is requested separately. |

The pinned `Newform` bundle stores good-index eigenvalues, nebentypus, membership in the newspace and first coefficient one. Bad-prime U_p eigenconditions are imported from the upstream primitive-form theory. The pinned classical strong multiplicity theorem fixes level, weight and character and asks for all good-index eigenvalues outside a finite set. It supplies a classical comparison test; it does not establish the number-field adelic theorem that recovers infinite places.

Generic representation categories, induction, Jacquet/Whittaker functors, local factors, spectral decomposition, Weil–Deligne parameters and inner-form transfer have their SR, AF, AL, AS, R01 and ET owners. The exact missing supplier contracts are collected below. Existing supplier nodes are cited directly in the prerequisites of each declaration. This part introduces neither a second smooth representation carrier nor a second automorphic class carrier.

## Stage order and acceptance

The Whittaker expansion is in R16.4, before multiplicity one. R16.5 consumes it for the Mellin comparison. Local LLC is specialized from ET.6 after the explicit R16.2 formulas. Quaternionic and cyclic matching then use those coordinates and the AS/ET distributions. Downstream geometric and transfer consumers are exports, never prerequisite edges returning from R17.3, R18 or R19.

| Stage | Targets | Coverage |
| --- | --- | --- |
| [R16.1](#r16-1) | Locally compact groups and automorphic functions (6 declarations) | planned |
| [R16.2](#r16-2) | Local smooth representation theory (13 declarations) | planned |
| [R16.3](#r16-3) | Local Langlands formulas and factors (9 declarations) | planned |
| [R16.4](#r16-4) | Global cuspidal factorization and multiplicity (6 declarations) | planned |
| [R16.5](#r16-5) | Integral comparison and the converse theorem (4 declarations) | planned |
| [R16.6](#r16-6) | Classical and cohomological comparisons (6 declarations) | planned |
| [R17.1](#r17-1) | Quaternionic local transfer (5 declarations) | planned |
| [R17.2](#r17-2) | Concrete matching and trace terms (6 declarations) | planned |

All eight stages are planned at target level. None is closed: supplier contracts and the explicitly recorded mathematical/signature gaps remain. The acceptance conditions below specify what closure must establish. Each selected planet names a definition, construction or central theorem; the stage has at most six.

<a id="r16-1"></a>

## R16.1. Locally compact groups and automorphic functions

The local matrix coordinates connect the generic adelic and automorphic constructions to concrete congruence groups. The algebraic K₀/K₁ definitions work over any commutative ring and ideal; only their compact-open interpretation needs a local field. Compact, measure and finite-level comparisons transport the suppliers’ objects without repeating their definitions.

**Planets:** Congruence subgroups, Newform subgroup, Maximal compact subgroups, Iwasawa decomposition, Central character quotient, Finite-level automorphic forms.

<a id="R16-1-k0"></a>

### The lower-left congruence subgroup

**Declaration:** `TauCeti.GL2Blueprint.k0`; definition; node `GL2AutomorphicRepresentationsAndTransfer:R16.1/k0`.

For a commutative valuation ring O, maximal ideal p and n≥0, K₀(pⁿ) is the subgroup of the existing GL₂(O) consisting of matrices g with g₂₁∈pⁿ. For a general commutative ring R and ideal I the same formula defines K₀(I). Its image in GL₂(F) uses the existing coefficient map. At n=0 this is all GL₂(O).

**Hypotheses.**

- O is the ring of integers of a nonarchimedean local field F; the algebraic subgroup definition works for any commutative ring.

**Construction or proof.**

1. Use multiplication and the two-by-two inverse formula to preserve the ideal condition.
2. Map GL₂(O) injectively to GL₂(F); compactness/openness is supplied by the local-field and reductive-group owners.

**Consumers determining the API.**

- Casselman §1: Defines the central-character isotypic newvector line.
- R17.2: Fixes the Iwahori idempotent and its Haar normalization.

**API.**

- `TauCeti.GL2Blueprint.k0_mem` (characterisation): g∈K₀(I) iff g₂₁∈I.
- `TauCeti.GL2Blueprint.k0_mono` (functoriality): I⊆J implies K₀(I)⊆K₀(J).
- `TauCeti.GL2Blueprint.k0_top` (compatibility): K₀(R)=GL₂(R), expressed as the top subgroup.
- `TauCeti.GL2Blueprint.k0_scalar` (simp): Every scalar unit matrix belongs to K₀(I).

**Unit tests.**

- `TauCeti.GL2Blueprint.k0_identity` (computation): The identity matrix is in K₀(I).
- `TauCeti.GL2Blueprint.k0_level_zero` (degenerate): K₀(p⁰) is the full group, including the Weyl matrix.
- `TauCeti.GL2Blueprint.k0_wrong_entry` (non-example): Over ℤ/5ℤ and I=0, (1 1;0 1) belongs, whereas (1 0;1 1) does not.

**Direct prerequisites.** `mathlib:Matrix.GeneralLinearGroup`, `mathlib:Matrix.GeneralLinearGroup.map`.

**Proposed library location.** `TauCeti/RepresentationTheory/GL2/R161`, namespace `TauCeti.GL2Blueprint`.

**Acceptance checks.**

- K₀(p) is the upper Iwahori; the name refers to the lower-left entry.

**Sources.**

- [William Casselman, On some results of Atkin and Lehner](https://lesesvre.perso.math.cnrs.fr/newforms-references/casselman.pdf), p. 301, §1 definition of Γ₀(b). The passage supplies the the lower-left congruence subgroup input or motivating calculation. The statement explicitly separates the supplier-owned general theorem from the GL₂ calculation; any unverified extension is in gaps.

**Atlas planet:** Congruence subgroups.

**Implementation status:** `unchecked`.


<a id="R16-1-k1"></a>

### The last-row congruence subgroup

**Declaration:** `TauCeti.GL2Blueprint.k1`; definition; node `GL2AutomorphicRepresentationsAndTransfer:R16.1/k1`.

K₁(pⁿ)={g∈GL₂(O): g₂₁∈pⁿ and g₂₂−1∈pⁿ}; over R write K₁(I). It is the inverse image of the stabilizer of row (0,1) under reduction modulo I, not the full principal congruence subgroup. K₁(p⁰)=GL₂(O).

**Hypotheses.**

- Commutative ring R and ideal I; use O,p for local compactness.

**Construction or proof.**

1. Reduce matrices modulo I and take the stabilizer of the last row.
2. Compare entry conditions to AKY K(2,(0,n)); the first row has depth zero.

**Consumers determining the API.**

- AKY §1.2: The rank-two conductor vector is (0,cπ).
- R16.6: The primitive level is the product of the local K₁ conductor levels.

**API.**

- `TauCeti.GL2Blueprint.k1_mem` (characterisation): g∈K₁(I) iff g₂₁∈I and g₂₂−1∈I.
- `TauCeti.GL2Blueprint.k1_le_k0` (compatibility): K₁(I)⊆K₀(I).
- `TauCeti.GL2Blueprint.k1_mono` (functoriality): I⊆J implies K₁(I)⊆K₁(J); in particular K₁(pⁿ⁺¹)⊆K₁(pⁿ).
- `TauCeti.GL2Blueprint.k1_top` (simp): K₁(R) is the full matrix unit group.
- `TauCeti.GL2Blueprint.k1_scalar` (characterisation): Scalar u belongs to K₁(I) iff u−1∈I.

**Unit tests.**

- `TauCeti.GL2Blueprint.k1_identity` (computation): The identity belongs to K₁(I).
- `TauCeti.GL2Blueprint.k1_level_zero` (degenerate): K₁(p⁰)=GL₂(O).
- `TauCeti.GL2Blueprint.k1_not_principal` (non-example): Over ℤ/5ℤ, (2 0;0 1) lies in K₁(0), although it is not the identity modulo 5.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R16.1/k0`, `mathlib:Matrix.GeneralLinearGroup`.

**Proposed library location.** `TauCeti/RepresentationTheory/GL2/R161`, namespace `TauCeti.GL2Blueprint`.

**Acceptance checks.**

- At n≥1 the scalar intersection consists of units congruent to one modulo pⁿ.

**Sources.**

- [Hiraku Atobe, Satoshi Kondo and Seidai Yasuda, Local newforms for the general linear groups over a non-archimedean local field](https://arxiv.org/pdf/2110.09070v4), §1.2, pp. 3–4, K(n,λ) and generic λπ. The passage supplies the the last-row congruence subgroup input or motivating calculation. The statement explicitly separates the supplier-owned general theorem from the GL₂ calculation; any unverified extension is in gaps.

**Atlas planet:** Newform subgroup.

**Implementation status:** `unchecked`.


<a id="R16-1-local-adelic-compact-comparison"></a>

### GL₂ local and adelic compact subgroups

**Declaration:** `TauCeti.GL2Blueprint.compactComparison`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R16.1/local-adelic-compact-comparison`.

For any number field F, identify the generic reductive group GL₂(Fv) with existing matrix units. At finite v the standard maximal compact is GL₂(Ov); at real v it is O(2); at complex v it is U(2). The adelic compact is their product, and its finite part is compact open in the restricted product with respect to GL₂(Ov). K₀(pvⁿ), K₁(pvⁿ) and finite products of these are compact open at finite places. All topology and restricted-product identifications are those of AA.1.

**Hypotheses.**

- F a number field; chosen place completions and valuation rings.

**Construction or proof.**

1. Apply AA.1 restricted-product comparison to the integral GL₂ model.
2. Use compactness of Ov and the nonvanishing unit determinant condition in GL₂(Ov); reductions have open kernels.
3. Identify real/complex maximal compacts by the transpose/conjugate-transpose equations.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R16.1/k0`, `GL2AutomorphicRepresentationsAndTransfer:R16.1/k1`, `mathlib:Matrix.GeneralLinearGroup`, `AdelicAlgebraicGroups:AA.1/adelic-points`, `AdelicAlgebraicGroups:AA.1/adelic-points-locally-compact`, `ReductiveGroupsPartII:RG2.0`, `AutomorphicFormsOnReductiveGroups:AF.1`.

**Proposed library location.** `TauCeti/RepresentationTheory/GL2/R161`, namespace `TauCeti.GL2Blueprint`.

**Acceptance checks.**

- Includes a dyadic completion and both real and complex places.

**Sources.**

- [Hervé Jacquet and Robert P. Langlands, Automorphic forms on GL(2)](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl_9.pdf), §2 printed p. 12, compact-subgroup and Haar convention. The passage supplies the gl₂ local and adelic compact subgroups input or motivating calculation. The statement explicitly separates the supplier-owned general theorem from the GL₂ calculation; any unverified extension is in gaps.

**Atlas planet:** Maximal compact subgroups.

**Implementation status:** `unchecked`.


<a id="R16-1-iwasawa-cartan"></a>

### Rank-two Iwasawa and Cartan coordinates

**Declaration:** `TauCeti.GL2Blueprint.iwasawaCartan`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R16.1/iwasawa-cartan`.

Specialize RG2.4 at finite places and AF.1 at infinity: GL₂(Fv)=B(Fv)K_v. At a finite place every double coset K_v g K_v has a unique representative diag(ϖᵃ,ϖᵇ) with a≥b integers. With upper triangular B and normalized induction, δB(diag(a,d))=|a/d|v. At infinity use positive singular values and O(2)/U(2).

**Hypotheses.**

- Chosen uniformizer at finite v; upper triangular B.

**Construction or proof.**

1. Apply RG2.4 finite-place Cartan/Iwasawa and the requested AF.1 real/complex Iwasawa and singular-value decompositions.
2. Compute the unique positive root a/d and hence the modulus; uniqueness at finite places follows from invariant factors.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R16.1/local-adelic-compact-comparison`, `ReductiveGroupsPartII:RG2.4`, `mathlib:Matrix.GeneralLinearGroup.det`, `AutomorphicFormsOnReductiveGroups:AF.1`.

**Proposed library location.** `TauCeti/RepresentationTheory/GL2/R161`, namespace `TauCeti.GL2Blueprint`.

**Acceptance checks.**

- The identity has exponents (0,0); diag(ϖ,1) has (1,0); scalar ϖ has (1,1).

**Sources.**

- [Hervé Jacquet and Robert P. Langlands, Automorphic forms on GL(2)](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl_9.pdf), §3 formula (3.1) and following compact realization, printed p. 46. The compact realization uses G=BK and formula (3.1) has the square-root modulus |a/d|¹ᐟ². Cartan uniqueness and archimedean decompositions are the separately requested supplier results.

**Atlas planet:** Iwasawa decomposition.

**Implementation status:** `unchecked`.


<a id="R16-1-haar-quotient-comparison"></a>

### Haar and central-character quotient comparison

**Declaration:** `TauCeti.GL2Blueprint.haarComparison`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R16.1/haar-quotient-comparison`.

Fix local measures dg_v on GL₂(Fv), vol(GL₂(Ov))=1 at finite places outside a specified finite set; form AA.0’s restricted Haar product. GL₂ is unimodular. For a continuous unitary idele-class character ω use AA.2’s quotient measure and central-character L² space on Z(𝔸)GL₂(F)\GL₂(𝔸): f(zγg)=ω(z)f(g), with finite integral of |f|². The matrix realization is an isometric right-translation-equivariant identification with AA.2/central-character-l2. Measures on elliptic centralizers are fixed separately, not inferred from dg_v.

**Hypotheses.**

- ω unitary and trivial on F×; quotient is formed by the closed subgroup specified by AA.2.

**Construction or proof.**

1. Use AA.0 product and rescaling law and AA.2 quotient integration.
2. Compute the root characters in inverse pairs to get GL₂ unimodularity.
3. Transport the central-character transformation rule and norm under the matrix/adelic identification.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R16.1/local-adelic-compact-comparison`, `AdelicAlgebraicGroups:AA.0/restricted-haar-product`, `AdelicAlgebraicGroups:AA.2/central-character-l2`, `mathlib:MeasureTheory.Measure.haarMeasure`, `mathlib:MeasureTheory.Measure.haarMeasure_self`.

**Proposed library location.** `TauCeti/RepresentationTheory/GL2/R161`, namespace `TauCeti.GL2Blueprint`.

**Acceptance checks.**

- Rescaling one local dg rescales the product and quotient norms by the same stated positive factor.

**Sources.**

- [Hervé Jacquet and Robert P. Langlands, Automorphic forms on GL(2)](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl_9.pdf), §10 and §16 fixed central character. The passage supplies the haar and central-character quotient comparison input or motivating calculation. The statement explicitly separates the supplier-owned general theorem from the GL₂ calculation; any unverified extension is in gaps.

**Atlas planet:** Central character quotient.

**Implementation status:** `unchecked`.


<a id="R16-1-finite-level-comparison"></a>

### Finite-level automorphic functions

**Declaration:** `TauCeti.GL2Blueprint.finiteLevelComparison`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R16.1/finite-level-comparison`.

At compact open Kf, the GL₂ finite-level space is the Kf-fixed subspace of AF.2’s automorphic forms with chosen central character, finite K∞ types and infinitesimal-character ideal. Using the finite double-coset decomposition GL₂(𝔸)=⊔GL₂(F)tᵢGL₂(F∞)Kf, restriction identifies it with the direct sum of classical spaces on Γᵢ\GL₂(F∞), with Γᵢ the corresponding arithmetic stabilizer. The central character, growth, differential and right-translation conditions are transported, not redefined. AL.0 owns additive Schwartz–Bruhat/Fourier theory; SR.1 owns the compactly supported smooth Hecke carrier.

**Hypotheses.**

- Kf compact open; finite type and finite-codimension annihilator data as in AF.2.

**Construction or proof.**

1. Apply AF.2/adelic-classical-bijection and compute Γᵢ from tᵢKftᵢ⁻¹.
2. Transport matrix determinant/central scalars; cite AL.0 for every Fourier input.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R16.1/haar-quotient-comparison`, `AutomorphicFormsOnReductiveGroups:AF.2/automorphic-form`, `AutomorphicFormsOnReductiveGroups:AF.2/adelic-classical-bijection`, `AutomorphicLFunctionsAndLocalFactors:AL.0/adelic-schwartz-bruhat-space`, `SmoothRepresentationsOfLocalGroups:SR.1`.

**Proposed library location.** `TauCeti/RepresentationTheory/GL2/R161`, namespace `TauCeti.GL2Blueprint`.

**Acceptance checks.**

- For F=ℚ, compare the chosen K₀(N) character convention with AF.5; no claim that all finite-level spaces are spherical.

**Sources.**

- [Hervé Jacquet and Robert P. Langlands, Automorphic forms on GL(2)](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl_9.pdf), Definition 10.2 and following cusp-form definition. The passage supplies the finite-level automorphic functions input or motivating calculation. The statement explicitly separates the supplier-owned general theorem from the GL₂ calculation; any unverified extension is in gaps.

**Atlas planet:** Finite-level automorphic forms.

**Implementation status:** `unchecked`.


**Closure requirements for this stage.** Resolve the applicable gaps and supplier contracts listed below. The packet’s coverage record lists every applicable contract under this stage.

<a id="r16-2"></a>

## R16.2. Local smooth representation theory

Work in the imported smooth characteristic-zero category. Explicit induced-series calculations identify the generic representations, newvector levels and their dimensions. The spherical recurrence, compact types and Iwahori center provide the APIs used by oldforms, patching and transfer. Irreducibility and infinite-dimensionality are stated separately, and dyadic supercuspidals remain in scope.

**Planets:** Principal series and Steinberg, Newvector theorem, Kirillov model, Unicity of types, Iwahori center, Archimedean classification.

<a id="R16-2-local-classification"></a>

### Explicit nonarchimedean classification

**Declaration:** `TauCeti.GL2Blueprint.localClassification`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R16.2/local-classification`.

Over any nonarchimedean characteristic-zero local field F, with ν=|·|F and complex coefficients, normalized induction I(χ₁,χ₂)=Ind_B^G(χ₁⊗χ₂) is irreducible iff χ₁χ₂⁻¹≠ν,ν⁻¹. Its central character is χ₁χ₂. If χ₁=χν¹ᐟ², χ₂=χν⁻¹ᐟ², it has the essentially Steinberg subrepresentation St⊗χdet and one-dimensional quotient χdet; reversing the order reverses the sub/quotient. Every irreducible admissible representation is a character of determinant, irreducible principal series, essentially Steinberg, or supercuspidal. Infinite-dimensional irreducibles are generic; one-dimensional characters are not. These are explicit calculations in the SR.2 induction/Jacquet carriers and ET.6 classification, including residue characteristic two.

**Hypotheses.**

- Smooth, irreducible, admissible complex representations; χᵢ smooth quasicharacters.

**Construction or proof.**

1. Compute the standard intertwining operator in the compact realization and its exceptional ratios (Casselman p. 305; JL §3).
2. Identify the length-two exceptional composition series; use ET.6 for exhaustion including wild supercuspidals.
3. Use SR.5 local Whittaker uniqueness and derivatives to identify genericity.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R16.1/iwasawa-cartan`, `SmoothRepresentationsOfLocalGroups:SR.2`, `SmoothRepresentationsOfLocalGroups:SR.3`, `SmoothRepresentationsOfLocalGroups:SR.5`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6`.

**Proposed library location.** `TauCeti/RepresentationTheory/GL2/R162`, namespace `TauCeti.GL2Blueprint`.

**Acceptance checks.**

- At χ₁=χ₂=1 the normalized principal series is irreducible; χdet is a different one-dimensional quotient at ratio ν.

**Sources.**

- [William Casselman, On some results of Atkin and Lehner](https://lesesvre.perso.math.cnrs.fr/newforms-references/casselman.pdf), p. 305, principal/special classification. The passage supplies the explicit nonarchimedean classification input or motivating calculation. The statement explicitly separates the supplier-owned general theorem from the GL₂ calculation; any unverified extension is in gaps.

**Atlas planet:** Principal series and Steinberg.

**Implementation status:** `unchecked`.


<a id="R16-2-newvector-conductor"></a>

### The newvector conductor exponent

**Declaration:** `TauCeti.GL2Blueprint.conductorExponent`; definition; node `GL2AutomorphicRepresentationsAndTransfer:R16.2/newvector-conductor`.

For irreducible admissible infinite-dimensional π of GL₂(F), c(π) is the least n≥0 for which π^{K₁(pⁿ)} is nonzero. Define the ideal conductor p^{c(π)}. The same least-level construction is available for an existing representation with an explicit nonempty level set. Existence for the stated π is the preceding newvectorLevelExists theorem, not a field stored in a replacement representation. This is a specialization of fixed vectors, not a new admissibility predicate.

**Hypotheses.**

- π generic, equivalently infinite-dimensional irreducible in characteristic zero; O,p and K₁ fixed.

**Construction or proof.**

1. Restrict the existing representation to K₁(pⁿ) and use Representation.invariants.
2. Apply newvectorLevelExists to make the subset of ℕ nonempty, then take its least member; this does not depend on the subsequent Casselman dimension formula.

**Consumers determining the API.**

- Casselman Theorem 1: Supplies the unique primitive fixed line.
- R16.3 and R16.6: Compares the Artin conductor and the global primitive level.

**API.**

- `TauCeti.GL2Blueprint.conductor_min` (characterisation): π^{K₁(p^{c(π)})}≠0 and π^{K₁(pⁿ)}=0 for n<c(π).
- `TauCeti.GL2Blueprint.conductor_iso` (functoriality): Isomorphic local representations have equal conductor exponent.
- `TauCeti.GL2Blueprint.conductor_unramified_twist` (compatibility): An unramified χ has c(π⊗χdet)=c(π), since χdet is trivial on GL₂(O).

**Unit tests.**

- `TauCeti.GL2Blueprint.conductor_unramified` (computation): An irreducible unramified generic principal series has conductor zero.
- `TauCeti.GL2Blueprint.conductor_steinberg` (computation): An unramified Steinberg twist has conductor one.
- `TauCeti.GL2Blueprint.conductor_ramified_steinberg` (non-example): For χ of conductor a≥2, c(St⊗χdet)=2a≠1+a. At a=1 both formulas give2, so that case alone would not detect the incorrect rule.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R16.1/k1`, `GL2AutomorphicRepresentationsAndTransfer:R16.2/local-classification`, `mathlib:Representation`, `mathlib:Representation.invariants`, `SmoothRepresentationsOfLocalGroups:SR.3`, `GL2AutomorphicRepresentationsAndTransfer:R16.2/newvector-level-exists`.

**Proposed library location.** `TauCeti/RepresentationTheory/GL2/R162`, namespace `TauCeti.GL2Blueprint`.

**Acceptance checks.**

- Compare to the epsilon exponent with additive character conductor O.

**Sources.**

- [William Casselman, On some results of Atkin and Lehner](https://lesesvre.perso.math.cnrs.fr/newforms-references/casselman.pdf), Theorem 1 p. 302 and epsilon remark p. 307. The passage supplies the the newvector conductor exponent input or motivating calculation. The statement explicitly separates the supplier-owned general theorem from the GL₂ calculation; any unverified extension is in gaps.

**Implementation status:** `unchecked`.


<a id="R16-2-casselman-newvector"></a>

### Casselman’s newvector theorem

**Declaration:** `TauCeti.GL2Blueprint.casselmanNewvector`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R16.2/casselman-newvector`.

For π as above and every n≥0, dimℂ π^{K₁(pⁿ)}=max(0,n−c(π)+1). The minimal fixed space is a line. In the lower-last-row convention it is the ωπ(d)-isotypic line for K₀(p^{c(π)}), with ωπ the central character, when c>0; at c=0 it is the spherical line. With ψ trivial on O but nontrivial on ϖ⁻¹O, Whittaker evaluation W↦W(1) is nonzero on this line. Casselman’s printed top-left central-character convention is transported through the dual/twist convention; it is not silently identified with the lower-last-row subgroup. The theorem has no odd-residue-characteristic restriction.

**Hypotheses.**

- Irreducible admissible infinite-dimensional complex π; ψ of conductor O; n natural.

**Construction or proof.**

1. Use the Kirillov proof for supercuspidals (Casselman pp. 302–304).
2. Use B(O) double cosets for principal series and subtract the determinant-character constituent for special representations (pp. 305–306).
3. Apply the Corollary to the Proof for all n and translate the printed character convention; apply SR.5 Whittaker realization for evaluation.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R16.2/newvector-conductor`, `GL2AutomorphicRepresentationsAndTransfer:R16.2/local-classification`, `GL2AutomorphicRepresentationsAndTransfer:R16.1/k0`, `GL2AutomorphicRepresentationsAndTransfer:R16.1/k1`, `SmoothRepresentationsOfLocalGroups:SR.5`, `AutomorphicLFunctionsAndLocalFactors:AL.2`.

**Proposed library location.** `TauCeti/RepresentationTheory/GL2/R162`, namespace `TauCeti.GL2Blueprint`.

**Acceptance checks.**

- c=0 gives dimensions 1,2,3 at n=0,1,2; c=1 gives 0,1,2; a one-dimensional character is excluded.

**Sources.**

- [William Casselman, On some results of Atkin and Lehner](https://lesesvre.perso.math.cnrs.fr/newforms-references/casselman.pdf), Theorem 1; Corollary to the Proof pp. 302–307. The passage supplies the casselman’s newvector theorem input or motivating calculation. The statement explicitly separates the supplier-owned general theorem from the GL₂ calculation; any unverified extension is in gaps.

**Atlas planet:** Newvector theorem.

**Implementation status:** `unchecked`.


<a id="R16-2-normalized-newvector"></a>

### The normalized Whittaker newvector

**Declaration:** `TauCeti.GL2Blueprint.normalizedNewvector`; construction; node `GL2AutomorphicRepresentationsAndTransfer:R16.2/normalized-newvector`.

For generic irreducible π and the chosen conductor-O ψ, take the unique K₁(p^{c(π)})-fixed vector in SR.5’s Whittaker model with W(1)=1. Equivalently, in the existing fixed line and its Whittaker functional λ, choose the unique v with λ(v)=1. No arbitrary vector is made canonical before fixing ψ and λ. For an unramified determinant twist χ, Wχ(g)=χ(det g)W(g) under the corresponding Whittaker identification.

**Hypotheses.**

- The fixed line is one-dimensional and λ restricts nontrivially; the Whittaker model and functional are supplied by SR.5.

**Construction or proof.**

1. Use the fixed-line theorem, divide a nonzero fixed vector by its nonzero λ-value and prove uniqueness.
2. Transport through the supplier’s Whittaker realization and unramified twist isomorphism.

**Consumers determining the API.**

- R16.4: Normalizes the restricted tensor product of Whittaker factors.
- R16.6: Identifies q-expansion normalization a₁=1 with local vector normalization.

**API.**

- `TauCeti.GL2Blueprint.normalizedNewvector_fixed` (data): vnew is fixed by K₁(p^{c(π)}).
- `TauCeti.GL2Blueprint.normalizedNewvector_eval` (simp): λ(vnew)=1.
- `TauCeti.GL2Blueprint.normalizedNewvector_unique` (universal-property): Every fixed v with λ(v)=1 equals vnew.
- `TauCeti.GL2Blueprint.normalizedNewvector_twist` (functoriality): An unramified twist identifies Wnew with χ(det g)Wnew(g).

**Unit tests.**

- `TauCeti.GL2Blueprint.normalizedNewvector_line` (computation): For V=ℂ and λ(z)=2z the normalized vector is 1/2.
- `TauCeti.GL2Blueprint.normalizedNewvector_rescale` (compatibility): Replacing λ by aλ with a≠0 changes vnew to a⁻¹vnew.
- `TauCeti.GL2Blueprint.normalizedNewvector_zero_functional` (non-example): The zero functional admits no vector of value one; it fails the input hypothesis.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R16.2/casselman-newvector`, `mathlib:Representation.invariants`, `SmoothRepresentationsOfLocalGroups:SR.5`.

**Proposed library location.** `TauCeti/RepresentationTheory/GL2/R162`, namespace `TauCeti.GL2Blueprint`.

**Acceptance checks.**

- Changing λ to aλ rescales v by a⁻¹; the scalar ambiguity is visible.

**Sources.**

- [Hervé Jacquet and Robert P. Langlands, Automorphic forms on GL(2)](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl_9.pdf), §11 following Proposition 11.1.1, printed p. 183; normalize the spherical local function at e. The passage supplies the the normalized whittaker newvector input or motivating calculation. The statement explicitly separates the supplier-owned general theorem from the GL₂ calculation; any unverified extension is in gaps.

**Implementation status:** `unchecked`.


<a id="R16-2-spherical-whittaker-values"></a>

### The spherical Whittaker values

**Declaration:** `TauCeti.GL2Blueprint.sphericalValues`; construction; node `GL2AutomorphicRepresentationsAndTransfer:R16.2/spherical-whittaker-values`.

For an unramified generic principal series with unitary-normalized Satake parameters α=χ₁(ϖ), β=χ₂(ϖ), define h₀=1, h₁=α+β and hₘ₊₂=(α+β)hₘ₊₁−αβhₘ. The normalized spherical Whittaker function has W(diag(ϖᵐ,1))=q^{-m/2}hₘ for m≥0 and zero for m<0. This polynomial recurrence includes α=β; the expression (α^{m+1}−β^{m+1})/(α−β) is used only when α≠β.

**Hypotheses.**

- Unramified generic π and ψ conductor O; q the residue cardinality.

**Construction or proof.**

1. Specialize SR.4 Satake and SR.5 Casselman–Shalika to the rank-two diagonal.
2. Use the complete symmetric polynomial recurrence to remove the apparent equal-parameter singularity.

**Consumers determining the API.**

- R16.5: Evaluates the unramified local Mellin integral.
- CG20 §1.3: Controls the characteristic-zero oldform recurrence.

**API.**

- `TauCeti.GL2Blueprint.sphericalValues_zero` (simp): h₀(α,β)=1.
- `TauCeti.GL2Blueprint.sphericalValues_recurrence` (relation): hₘ₊₂=(α+β)hₘ₊₁−αβhₘ.
- `TauCeti.GL2Blueprint.sphericalValues_swap` (compatibility): hₘ(α,β)=hₘ(β,α).
- `TauCeti.GL2Blueprint.sphericalValues_equal` (characterisation): hₘ(α,α)=(m+1)αᵐ.

**Unit tests.**

- `TauCeti.GL2Blueprint.sphericalValues_one` (computation): h₁=α+β.
- `TauCeti.GL2Blueprint.sphericalValues_two` (computation): h₂=α²+αβ+β².
- `TauCeti.GL2Blueprint.sphericalValues_collision` (degenerate): h₂(1,1)=3, not an undefined quotient.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R16.2/normalized-newvector`, `SmoothRepresentationsOfLocalGroups:SR.4`, `SmoothRepresentationsOfLocalGroups:SR.5`.

**Proposed library location.** `TauCeti/RepresentationTheory/GL2/R162`, namespace `TauCeti.GL2Blueprint`.

**Acceptance checks.**

- Equal parameters give hₘ=(m+1)αᵐ.

**Sources.**

- [Hervé Jacquet and Robert P. Langlands, Automorphic forms on GL(2)](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl_9.pdf), §3 spherical functions and unramified zeta calculation. The passage supplies the the spherical whittaker values input or motivating calculation. The statement explicitly separates the supplier-owned general theorem from the GL₂ calculation; any unverified extension is in gaps.

**Implementation status:** `unchecked`.


<a id="R16-2-iwahori-oldforms"></a>

### The characteristic-zero Iwahori oldforms

**Declaration:** `TauCeti.GL2Blueprint.iwahoriOldforms`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R16.2/iwahori-oldforms`.

Let π be an irreducible admissible infinite-dimensional unramified representation of GL₂(F). Then dim π^{K₀(p)}=2 and dim π^{GL₂(O)}=1. With vol(K₀(p))=1, U=[K₀(p)diag(ϖ,1)K₀(p)], the spherical vector v generates the Iwahori fixed space under ℂ[U], even if the Satake parameters coincide. The U polynomial is X²−q^{1/2}(α+β)X+qαβ in this unnormalized double-coset convention. A nontrivial unramified χdet has dimensions 1 and 1, so the printed CG20 condition “not trivial” must be replaced by infinite-dimensional.

**Hypotheses.**

- Complex characteristic zero; π unramified and infinite-dimensional, not just nontrivial.

**Construction or proof.**

1. Use Casselman with c=0 and trivial restriction of the central character to O units.
2. Evaluate U in the two oldvector basis using the spherical recurrence; the off-diagonal coefficient ensures cyclicity even at a repeated root.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R16.2/casselman-newvector`, `GL2AutomorphicRepresentationsAndTransfer:R16.2/spherical-whittaker-values`, `SmoothRepresentationsOfLocalGroups:SR.1`, `SmoothRepresentationsOfLocalGroups:SR.4`.

**Proposed library location.** `TauCeti/RepresentationTheory/GL2/R162`, namespace `TauCeti.GL2Blueprint`.

**Acceptance checks.**

- Repeated Satake eigenvalues do not imply a semisimple U action; integral doubling is routed to the defect-one roadmap.

**Sources.**

- [Frank Calegari and David Geraghty, Modularity lifting for non-regular symplectic representations](https://math.uchicago.edu/~fcale/papers/Siegel.pdf), §1.3 printed pp. 805–806. The passage supplies the the characteristic-zero iwahori oldforms input or motivating calculation. The statement explicitly separates the supplier-owned general theorem from the GL₂ calculation; any unverified extension is in gaps.

**Implementation status:** `unchecked`.


<a id="R16-2-supercuspidal-kirillov"></a>

### The supercuspidal Kirillov comparison

**Declaration:** `TauCeti.GL2Blueprint.supercuspidalKirillov`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R16.2/supercuspidal-kirillov`.

For irreducible supercuspidal π with central character ω and nontrivial ψ, restricting the imported Whittaker function W to diag(x,1), x∈F×, identifies its Kirillov realization with C_c^∞(F×,ℂ). For b=(a u;0 d), the action is (π(b)f)(x)=ω(d)ψ(xu/d)f(xa/d). The Weyl action is the supplier local functional equation; it is not a freely chosen transform. For π over a finite extension L/ℚp, DLB’s scalar extension with L∞ and Γ descent is requested from SR.5; locally analytic Kirillov–Colmez theory belongs to R30.

**Hypotheses.**

- Smooth characteristic-zero supercuspidal; additive-character and central-character choices visible.

**Construction or proof.**

1. Use JL §2 restriction to the mirabolic and the supercuspidal compact-support characterization.
2. Compute the Borel action by multiplication of n(xu/d) and diag(xa/d,1).
3. Import the gamma-factor Weyl operator and request the coefficient-descent variant for the DLB consumer.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R16.2/local-classification`, `SmoothRepresentationsOfLocalGroups:SR.5`, `AutomorphicLFunctionsAndLocalFactors:AL.0/local-schwartz-bruhat-space`, `AutomorphicLFunctionsAndLocalFactors:AL.2`.

**Proposed library location.** `TauCeti/RepresentationTheory/GL2/R162`, namespace `TauCeti.GL2Blueprint`.

**Acceptance checks.**

- For a=d the action is ω(d); for u=0,a/d=1 it does not translate the argument.

**Sources.**

- [William Casselman, On some results of Atkin and Lehner](https://lesesvre.perso.math.cnrs.fr/newforms-references/casselman.pdf), p. 302, equation (1.2). The passage supplies the the supercuspidal kirillov comparison input or motivating calculation. The statement explicitly separates the supplier-owned general theorem from the GL₂ calculation; any unverified extension is in gaps.

**Atlas planet:** Kirillov model.

**Implementation status:** `unchecked`.


<a id="R16-2-henniart-unicity"></a>

### Henniart’s unicity of supercuspidal types

**Declaration:** `TauCeti.GL2Blueprint.henniartUnicity`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R16.2/henniart-unicity`.

For the inertial class s of an irreducible supercuspidal π of GL₂(F), there is a unique isomorphism class of irreducible GL₂(O)-representation σ typical for s. It occurs with multiplicity one in every π⊗χdet with χ unramified. If σ occurs in an irreducible admissible π′, then π′≅π⊗χdet for an unramified χ. The type carrier and Bernstein inertial equivalence belong to SR.3/ET.6. No uniqueness is asserted for an arbitrary nonminimal K-constituent.

**Hypotheses.**

- Characteristic-zero algebraically closed coefficients; nonarchimedean F, including dyadic fields.

**Construction or proof.**

1. Apply Henniart Appendix A.1.5(1) and A.3; transport the unique typical K-type through unramified twists.
2. Use the characterization of the supercuspidal Bernstein component to deduce the DLB minimal-type conclusion.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R16.2/local-classification`, `SmoothRepresentationsOfLocalGroups:SR.3`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6`.

**Proposed library location.** `TauCeti/RepresentationTheory/GL2/R162`, namespace `TauCeti.GL2Blueprint`.

**Acceptance checks.**

- An occurrence in π′ determines the inertial class, not the individual unramified twist.

**Sources.**

- [Christophe Breuil, Ariane Mézard; appendix by Guy Henniart, Multiplicités modulaires et représentations de GL₂(ℤp) et de Gal(Q̄p/Qp), Appendix: Sur l’unicité des types pour GL₂](https://www.imo.universite-paris-saclay.fr/m/~breuil/PUBLICATIONS/multiplicite.pdf), Appendix A.1.4–A.1.5(1), pp. 75–76; A.3. The passage supplies the henniart’s unicity of supercuspidal types input or motivating calculation. The statement explicitly separates the supplier-owned general theorem from the GL₂ calculation; any unverified extension is in gaps.

**Atlas planet:** Unicity of types.

**Implementation status:** `unchecked`.


<a id="R16-2-supercuspidal-projective"></a>

### Supercuspidals in a fixed central-character category

**Declaration:** `TauCeti.GL2Blueprint.supercuspidalProjective`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R16.2/supercuspidal-projective`.

A supercuspidal complex representation of GL₂(F) with fixed smooth central character ω is projective in the abelian category of smooth representations on which the center acts by ω. The DLB application is F=ℚp, ω=1, and characteristic-zero L coefficients with the required scalar extension. This does not assert projectivity in the unrestricted smooth category or in a mod-p category.

**Hypotheses.**

- Fixed central character; characteristic zero; the category is SR.0’s fixed-character subcategory.

**Construction or proof.**

1. Use compact-mod-center induction/type description and exactness of invariants of compact open subgroups in characteristic zero.
2. Apply the block decomposition within the fixed-character category; request this general categorical input from SR.0:abelian-category.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R16.2/henniart-unicity`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category`, `SmoothRepresentationsOfLocalGroups:SR.3`.

**Proposed library location.** `TauCeti/RepresentationTheory/GL2/R162`, namespace `TauCeti.GL2Blueprint`.

**Acceptance checks.**

- The claimed splitting is valid only inside the specified fixed-central-character category.

**Sources.**

- [Gabriel Dospinescu and Arthur-César Le Bras, Revêtements du demi-plan de Drinfeld et correspondance de Langlands p-adique](https://arxiv.org/pdf/1509.00606v2), p. 64, footnote 52. The passage supplies the supercuspidals in a fixed central-character category input or motivating calculation. The statement explicitly separates the supplier-owned general theorem from the GL₂ calculation; any unverified extension is in gaps.

**Implementation status:** `unchecked`.


<a id="R16-2-cdt-vexing-type"></a>

### The Conrad–Diamond–Taylor vexing type

**Declaration:** `TauCeti.GL2Blueprint.cdtVexingType`; construction; node `GL2AutomorphicRepresentationsAndTransfer:R16.2/cdt-vexing-type`.

Let x≠ℓ be a vexing prime: x≡−1 mod ℓ, residual local rank-two representation irreducible but its inertia restriction reducible; its conductor c_x=2n. From CDT’s regular character θ of the unramified quadratic extension with conductor xⁿ construct Θ(θ), an existing finite-group representation of GL₂(ℤ/xⁿℤ), and choose a stable O-lattice for a characteristic-zero coefficient field containing its values. The local selector σ_x is Θ(θ) restricted to the exact U_x/V_x used by CDT §5 (U₀(x)/U(xⁿ) in the vexing case), not an arbitrary type on that quotient. The larger GL₂ quotient representation Wσx in CG18 restricts to this selector.

**Hypotheses.**

- x and ℓ distinct primes; regular θ, θ≠θ^Frob; coefficient field contains values; choose an invariant lattice.

**Construction or proof.**

1. Import the finite-group Θ construction from ET.6/SR.3 and its lattice from R01.1.
2. Use CDT §5 definitions to restrict Θ to U₀(x); retain both the full K-type and selector restriction.
3. Use CG18 §3.9.2 to identify its Wσx convention.

**Consumers determining the API.**

- CG18 §3.9.2: Cuts out the minimal vexing-prime lifts in the coefficient sheaf.
- R16.3/CDT multiplicity comparison: Identifies the selected local factor with its inertia parameter.

**API.**

- `TauCeti.GL2Blueprint.cdtVexingType_restrict` (compatibility): The selector is the restriction of Θ(θ) to U₀(x)/U(xⁿ).
- `TauCeti.GL2Blueprint.cdtVexingType_lattice` (structure): The chosen O-lattice is stable and scalar extension recovers Θ(θ).
- `TauCeti.GL2Blueprint.cdtVexingType_unramified` (functoriality): An unramified twist leaves the compact type and its selector unchanged.

**Unit tests.**

- `TauCeti.GL2Blueprint.cdtVexingType_scalar_extension` (compatibility): The lattice tensored with the coefficient field is isomorphic to Θ(θ).
- `TauCeti.GL2Blueprint.cdtVexingType_distinct_inertia` (non-example): A local representation with inertial characters not θ,θ^Frob has no occurrence of the full Θ(θ) type.
- `TauCeti.GL2Blueprint.cdtVexingType_unramified_twist` (characterisation): π and π⊗ξdet for unramified ξ have equal Θ(θ) occurrence multiplicity.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R16.2/henniart-unicity`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6`, `ArithmeticGaloisRepresentations:R01.1/compact-subgroups-stabilise-lattices`.

**Proposed library location.** `TauCeti/RepresentationTheory/GL2/R162`, namespace `TauCeti.GL2Blueprint`.

**Acceptance checks.**

- The selector detects the minimal inertial lift, not all representations of conductor c_x.

**Sources.**

- [Frank Calegari and David Geraghty, Modularity lifting beyond the Taylor–Wiles method](https://math.uchicago.edu/~fcale/papers/CG.pdf), §3.9.2 construction Wσx; CDT §5.1 p. 18. The passage supplies the the conrad–diamond–taylor vexing type input or motivating calculation. The statement explicitly separates the supplier-owned general theorem from the GL₂ calculation; any unverified extension is in gaps.

**Implementation status:** `unchecked`.


<a id="R16-2-iwahori-center"></a>

### The GL₂ Iwahori center

**Declaration:** `TauCeti.GL2Blueprint.iwahoriCenter`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R16.2/iwahori-center`.

For the upper Iwahori I and a characteristic-zero coefficient ring in which q and q+1 are invertible, normalize vol(I)=1 and eK=1_K/vol(K). Put U₀=1_{I diag(ϖ,ϖ) I} and U₁=1_{I diag(ϖ,1) I}. The center of H(G,I) is the Laurent polynomial algebra in U₀^{±1} and z₁=U₁+qU₀U₁⁻¹. Multiplication by eK identifies it with the spherical algebra H(G,K), sending U₀ to T₀ and z₁ to T₁, with normalized spherical identity eK. Coefficient extensions used in BCGP invert p and the required idempotent denominators. The rank-independent Bernstein center belongs to SmoothRepresentationsPartIIParahoricCenters; until that proposed roadmap exists, SR.4 supplies the requested contract.

**Hypotheses.**

- q is a unit; eK requires the I-index q+1 to be a unit; U₁ has its usual invertibility in the affine Hecke algebra.

**Construction or proof.**

1. Import the Bernstein presentation and HKP §4.6 compatibility.
2. Compute the two symmetric Laurent generators in rank two; keep U₀ inverse in the algebra.
3. Evaluate eK on them, correcting the GSp₄ symbol in BCGP’s second identity.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R16.1/k0`, `SmoothRepresentationsOfLocalGroups:SR.1`, `SmoothRepresentationsOfLocalGroups:SR.4`.

**Proposed library location.** `TauCeti/RepresentationTheory/GL2/R162`, namespace `TauCeti.GL2Blueprint`.

**Acceptance checks.**

- The sphere map has unit eK, not 1_I; the central determinant generator is invertible.

**Sources.**

- [George Boxer, Frank Calegari, Toby Gee and Vincent Pilloni, Abelian surfaces over totally real fields are potentially modular](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf), Lemma 2.4.15, pp. 178–179; HKP §4.6 (4.6.1). The passage supplies the the gl₂ iwahori center input or motivating calculation. The statement explicitly separates the supplier-owned general theorem from the GL₂ calculation; any unverified extension is in gaps.
- [Thomas Haines, Robert Kottwitz and Amritanshu Prasad, Iwahori–Hecke algebras](https://www.math.umd.edu/~tjh/IHA.apr.09.pdf), §2.3 Lemma 2.3.1; §4.6 equation (4.6.1). The Bernstein center is the Weyl-invariant Laurent algebra, and h=e_K z identifies its spherical projection. BCGP supplies the concrete rank-two generators in the convention used here.

**Atlas planet:** Iwahori center.

**Implementation status:** `unchecked`.


<a id="R16-2-archimedean-classification"></a>

### The explicit archimedean GL₂ cases

**Declaration:** `TauCeti.GL2Blueprint.archimedeanClassification`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R16.2/archimedean-classification`.

Import the existing AF.1/weil-group-real, AF.1/archimedean-llc-gln and AF.1/casselman-wallach-globalization nodes of the single AF real-representation owner. The proposed AF.1b split preserves these contracts; it is not an installed stage. For GL₂(ℝ), real reducible parameters χ₁⊕χ₂ correspond to the appropriate Langlands quotient of normalized induction, including its finite-dimensional exceptional quotients. An irreducible parameter Ind_{ℂ×}^{Wℝ}((z/|z|)^m|z|^{2t}), integer m≥1, corresponds to D_{m+1}⊗|det|^t, the full O(2) representation whose positive-determinant restriction has holomorphic and antiholomorphic pieces. For m=0 the parameter splits and one obtains the limit boundary; it is not an irreducible Weil parameter. For GL₂(ℂ), every parameter is a pair of continuous quasicharacters and the representation is the corresponding Langlands quotient; GL₂(ℂ) has no discrete series modulo center.

**Hypotheses.**

- Admissible irreducible Harish–Chandra modules with their Casselman–Wallach globalizations; explicit chamber/order in a Langlands quotient.

**Construction or proof.**

1. Specialize AF.1/archimedean-llc-gln and AF.1/weil-group-real to rank two, using AF.1/casselman-wallach-globalization for the smooth realization.
2. Compare the lowest SO(2) weights with JL §5 and the complex principal-series coordinates with JL §6.
3. Keep full O(2), connected-group constituents, finite-dimensional quotients and limit cases distinct.

**Direct prerequisites.** `AutomorphicFormsOnReductiveGroups:AF.1/weil-group-real`, `AutomorphicFormsOnReductiveGroups:AF.1/gl2-real-discrete-series`, `AutomorphicFormsOnReductiveGroups:AF.1/archimedean-llc-gln`, `AutomorphicFormsOnReductiveGroups:AF.1/casselman-wallach-globalization`.

**Proposed library location.** `TauCeti/RepresentationTheory/GL2/R162`, namespace `TauCeti.GL2Blueprint`.

**Acceptance checks.**

- D₂ has weights ±2,±4,…; a full GL₂(ℝ) holomorphic representation is not just one connected-group constituent.

**Sources.**

- [Hervé Jacquet and Robert P. Langlands, Automorphic forms on GL(2)](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl_9.pdf), §5 Lemmas 5.6–5.7; §6 Lemma 6.1, beginning printed p. 110. JL §5–§6 give the concrete real/complex modules and boundary cases. Modern archimedean Weil parametrization and globalization are imported from the exact AF.1 nodes, not asserted to be proved by these passages.

**Atlas planet:** Archimedean classification.

**Implementation status:** `unchecked`.


<a id="R16-2-newvector-level-exists"></a>

### Existence of a nonzero newvector level

**Declaration:** `TauCeti.GL2Blueprint.newvectorLevelExists`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R16.2/newvector-level-exists`.

For an irreducible admissible infinite-dimensional complex smooth representation π of GL₂(F), with F a nonarchimedean local field of characteristic zero, there is n≥0 and a nonzero vector fixed by the last-row K₁(pⁿ). This assertion neither uses a conductor exponent nor asserts the dimension formula; it supplies the nonempty level set before its minimum is defined.

**Hypotheses.**

- Irreducible admissible infinite-dimensional complex smooth π; K₁ is the last-row subgroup over the valuation ring.

**Construction or proof.**

1. Use SR.5 genericity/Kirillov realization of π∨ with ψ of conductor O. Choose the nonzero compactly supported function f(u)=ωπ∨(u) on O×, extended by zero. The Borel action gives the top-left character on upper triangular matrices in GL₂(O); smoothness gives invariance under a sufficiently small lower unipotent subgroup.
2. Use the elementary K₀ decomposition into upper-triangular and lower-unipotent factors (Casselman p.303) to obtain Casselman’s top-left ωπ∨(a) transformation law at some level, enlarging the level to contain the central-character conductor.
3. Apply SR.3’s π∨≅π⊗ωπ⁻¹det and twist back. Since det(g)≡ad modulo pⁿ and ωπ is trivial on 1+pⁿ, the resulting law is ωπ(d); restriction to last-row K₁(pⁿ) is trivial.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R16.1/k1`, `GL2AutomorphicRepresentationsAndTransfer:R16.2/local-classification`, `mathlib:Representation.invariants`, `SmoothRepresentationsOfLocalGroups:SR.3`, `SmoothRepresentationsOfLocalGroups:SR.5`.

**Proposed library location.** `TauCeti/RepresentationTheory/GL2/R162`, namespace `TauCeti.GL2Blueprint`.

**Acceptance checks.**

- The existence proof never takes the minimum of an unproved nonempty set or invokes the subsequent Casselman dimension theorem.

**Sources.**

- [William Casselman, On some results of Atkin and Lehner](https://lesesvre.perso.math.cnrs.fr/newforms-references/casselman.pdf), §1 Theorem1 and Kirillov setup, printed p.302; elementary subgroup decomposition, printed p.303. The Kirillov realization and smoothness give existence at some level independently of the least-level/dimension calculation; the stated contragredient translation converts the paper’s top-left character convention to last-row invariants.

**Implementation status:** `unchecked`.


**Closure requirements for this stage.** Resolve the applicable gaps and supplier contracts listed below. The packet’s coverage record lists every applicable contract under this stage.

<a id="r16-3"></a>

## R16.3. Local Langlands formulas and factors

ET.6 owns the canonical correspondence. These declarations compute its principal-series, special and supercuspidal parameters and translate the normalizations used by arithmetic applications. The special parameter retains N; tame dihedral examples are checks within the all-field theorem. Archimedean factors use the AF.1 classification contract and AL.1 conventions.

**Planets:** Principal-series parameters, Steinberg monodromy, Local normalization bridge, Archimedean local factors, Tamely dihedral representations, CDT local multiplicity one.

<a id="R16-3-principal-series-parameter"></a>

### Principal-series parameters and factors

**Declaration:** `TauCeti.GL2Blueprint.principalParameter`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R16.3/principal-series-parameter`.

For F/ℚp finite, with Art_F:F×≃W_Fᵃᵇ the topological Weil-group reciprocity isomorphism normalized by Art_F(ϖ)=Φ geometric and ν(ϖ)=q⁻¹, rec(I(χ₁,χ₂))=(χ₁∘Art_F⁻¹)⊕(χ₂∘Art_F⁻¹), N=0, for an irreducible normalized principal series. Thus det rec=ωπ∘Art_F⁻¹ and L(s,π)=L(s,χ₁)L(s,χ₂). A ramified character contributes 1. At the reducible ratio ν^{±1}, this is the parameter of the one-dimensional Langlands quotient; the generic Steinberg constituent instead has nonzero N as below. The statement uses Frobenius-semisimple Weil–Deligne parameters, not semisimplification that discards N.

**Hypotheses.**

- Characteristic-zero nonarchimedean F; χ₁χ₂⁻¹≠ν^{±1} in the principal-series assertion.
- Art_F⁻¹ is evaluated on the topological Weil abelianization supplied by CFT Layer9, not on the absolute Galois abelianization of Layer7.

**Construction or proof.**

1. Apply ET.6 compatibility with normalized induction and AL.1 character factors.
2. Evaluate on Φ using the geometric local Artin map; take determinant and inertia-invariant characteristic polynomial.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R16.2/local-classification`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6`, `ArithmeticGaloisRepresentations:R01.2/weil-deligne-representation`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`, `AutomorphicLFunctionsAndLocalFactors:AL.1`, `AutomorphicLFunctionsAndLocalFactors:AL.2`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group`.

**Proposed library location.** `TauCeti/RepresentationTheory/GL2/R163`, namespace `TauCeti.GL2Blueprint`.

**Acceptance checks.**

- For unramified χᵢ, L(s)=((1−χ₁(ϖ)q⁻ˢ)(1−χ₂(ϖ)q⁻ˢ))⁻¹; no factor is manufactured for a ramified character.

**Sources.**

- [James Newton and Jack A. Thorne, Symmetric power functoriality for Hilbert modular forms](https://arxiv.org/pdf/2212.03595v2), §1.2 printed p. 8, ArtK and recK. NT §1.2 pins geometric Artin reciprocity and the rec convention. The normalized principal-series parameter calculation is an ET.6 specialization, with its explicit local character factors in JL §3 and AL.1.

**Atlas planet:** Principal-series parameters.

**Implementation status:** `unchecked`.


<a id="R16-3-steinberg-monodromy"></a>

### Steinberg monodromy and its factors

**Declaration:** `TauCeti.GL2Blueprint.steinbergParameter`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R16.3/steinberg-monodromy`.

For π=St⊗χdet, choose a basis e₁,e₂ of the existing rank-two parameter with Ne₂=e₁, Ne₁=0 and r(Φ)=diag(αq⁻¹ᐟ²,αq¹ᐟ²), α=χ(ϖ). For general w the diagonal characters are χ_Wν_W^{1/2},χ_Wν_W^{−1/2}, so r(w)Nr(w)⁻¹=ν_W(w)N. This gives det r=χ_W², L(s,π)=L(s+1/2,χ), and a(π)=1 when χ is unramified, 2a(χ) otherwise. In particular the invariant kernel of N, not all inertia invariants of r, defines L. An unramified twist preserves N and the conductor.

**Hypotheses.**

- Geometric Frobenius convention; choose the positive real square root of q for unitary normalization.

**Construction or proof.**

1. Specialize ET.6 segment correspondence and translate R01.2’s Sp(2) coordinates by reversing the basis and twisting by ν^{-1/2}.
2. Compute r(Φ)N=q⁻¹Nr(Φ) and ker N, then apply the R01.3 conductor formula Sw(r)+dim V−dim(ker N)^I.
3. Use AL.2 compatibility of the representation factors with the parameter.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R16.3/principal-series-parameter`, `GL2AutomorphicRepresentationsAndTransfer:R16.2/casselman-newvector`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6`, `ArithmeticGaloisRepresentations:R01.2/weil-deligne-representation`, `ArithmeticGaloisRepresentations:R01.3/conductor-of-a-weil-deligne-representation`, `AutomorphicLFunctionsAndLocalFactors:AL.2`.

**Proposed library location.** `TauCeti/RepresentationTheory/GL2/R163`, namespace `TauCeti.GL2Blueprint`.

**Acceptance checks.**

- N²=0 but N≠0; at χ=1 the parameter has L=(1−q^{−s−1/2})⁻¹ and conductor one.

**Sources.**

- [William Casselman, On some results of Atkin and Lehner](https://lesesvre.perso.math.cnrs.fr/newforms-references/casselman.pdf), p. 307 epsilon remark and special-representation calculation. The passage supplies the steinberg monodromy and its factors input or motivating calculation. The statement explicitly separates the supplier-owned general theorem from the GL₂ calculation; any unverified extension is in gaps.

**Atlas planet:** Steinberg monodromy.

**Implementation status:** `unchecked`.


<a id="R16-3-supercuspidal-parameter"></a>

### Supercuspidal parameters including wild cases

**Declaration:** `TauCeti.GL2Blueprint.supercuspidalParameter`; comparison; node `GL2AutomorphicRepresentationsAndTransfer:R16.3/supercuspidal-parameter`.

rec identifies supercuspidal GL₂(F) representations with irreducible two-dimensional Weil representations, with N=0; determinants, character twists, conductors and L/epsilon factors agree with the existing parameter conventions. Such a parameter has no inertia-fixed vector, hence its standard L-factor is 1. A quadratic induction gives a dihedral example when θ≠θ^σ, but this is not an exhaustive description at dyadic places: primitive wild parameters remain in the ET.6 carrier and use the full Swan conductor. R30’s p-adic Banach correspondence is a separate consumer.

**Hypotheses.**

- All finite extensions of ℚp, including p=2; smooth characteristic-zero correspondence.

**Construction or proof.**

1. Import the supercuspidal/irreducible-parameter part of ET.6.
2. An inertia-fixed subspace would be Weil-stable; irreducibility would force trivial inertia and a rank-two irreducible representation of a cyclic quotient, a contradiction.
3. Use parameter compatibility and R01.3, without replacing a wild parameter by a tame quadratic character.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R16.2/supercuspidal-kirillov`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6`, `ArithmeticGaloisRepresentations:R01.2/weil-deligne-representation`, `ArithmeticGaloisRepresentations:R01.3/conductor-of-a-weil-deligne-representation`, `AutomorphicLFunctionsAndLocalFactors:AL.2`.

**Proposed library location.** `TauCeti/RepresentationTheory/GL2/R163`, namespace `TauCeti.GL2Blueprint`.

**Acceptance checks.**

- L(s)=1 for every supercuspidal, but its conductor can be wild and is not fixed at two.

**Sources.**

- [James Newton and Jack A. Thorne, Symmetric power functoriality for Hilbert modular forms](https://arxiv.org/pdf/2212.03595v2), §2 after Definition 2.4, printed p. 11. The passage supplies the supercuspidal parameters including wild cases input or motivating calculation. The statement explicitly separates the supplier-owned general theorem from the GL₂ calculation; any unverified extension is in gaps.

**Implementation status:** `unchecked`.


<a id="R16-3-tate-unitary-normalization"></a>

### The Tate and unitary normalization bridge

**Declaration:** `TauCeti.GL2Blueprint.normalizationBridge`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R16.3/tate-unitary-normalization`.

For rank two, recᵀ_F(π)=rec_F(π⊗ν^{-1/2})=rec_F(π)⊗ν_W^{-1/2}. At geometric Φ this multiplies Frobenius by q^{1/2}, multiplies determinant by ν_W^{-1}, preserves N and Artin conductor, and shifts standard factors by L(s,recᵀπ)=L(s−1/2,rec π), likewise epsilon factors with fixed ψ and Haar choices. The rank-two Tate normalization therefore has determinant ωπ·ν_W^{-1}, not ωπ. Frobenius inversion in an arithmetic convention must be applied to the entire WD datum, including the relation for N; it is not this half-twist.

**Hypotheses.**

- Fixed rec convention compatible with character Artin reciprocity; nonarchimedean ν_W(Φ)=q⁻¹.

**Construction or proof.**

1. Use NT §1.2 definition of recᵀ and ET.6 character-twist compatibility.
2. Compute scalar multiplication on the inertia-fixed kernel of N; invoke AL.2 twist/shift compatibility.
3. Compare the geometric versus arithmetic presentation of R01.2 without discarding monodromy.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R16.3/principal-series-parameter`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/steinberg-monodromy`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/supercuspidal-parameter`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6`, `ArithmeticGaloisRepresentations:R01.2/weil-deligne-representation`, `AutomorphicLFunctionsAndLocalFactors:AL.2`.

**Proposed library location.** `TauCeti/RepresentationTheory/GL2/R163`, namespace `TauCeti.GL2Blueprint`.

**Acceptance checks.**

- For unramified St the Tate-normalized Frobenius is diag(α,αq), with N e₂=e₁ and determinant α²q.

**Sources.**

- [James Newton and Jack A. Thorne, Symmetric power functoriality for Hilbert modular forms](https://arxiv.org/pdf/2212.03595v2), §1.2 printed p. 8, normalization identity. The passage supplies the the tate and unitary normalization bridge input or motivating calculation. The statement explicitly separates the supplier-owned general theorem from the GL₂ calculation; any unverified extension is in gaps.

**Atlas planet:** Local normalization bridge.

**Implementation status:** `unchecked`.


<a id="R16-3-conductor-epsilon-comparison"></a>

### Conductor, twists and additive-character change

**Declaration:** `TauCeti.GL2Blueprint.conductorEpsilon`; comparison; node `GL2AutomorphicRepresentationsAndTransfer:R16.3/conductor-epsilon-comparison`.

For every generic irreducible π, c(π)=a(rec π), with the same value for recᵀ. With ψ of conductor O and self-dual additive measure, ε(s,π,ψ)=ε(1/2,π,ψ)q^{-c(π)(s−1/2)}. For ψ_a(x)=ψ(ax), ε(s,π,ψ_a)=ωπ(a)|a|^{2s−1}ε(s,π,ψ); the measure is changed to the corresponding self-dual one. An unramified twist by ν^t replaces s by s+t and leaves c unchanged. For a ramified χ, one uses the full tensor-parameter conductor; c(π⊗χdet) is not generally c(π)+2a(χ).

**Hypotheses.**

- Use normalized AL.2 epsilon factors, not an unnormalized Fourier measure; π generic and characteristic zero.

**Construction or proof.**

1. Compare Casselman’s minimal congruence level with the epsilon exponent, using ET.6 factor compatibility.
2. Specialize AL.1/AL.2 additive-character and tensor-twist formulas to dimension two.
3. Check principal, special and supercuspidal parameters using the kernel-of-N conductor.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R16.2/newvector-conductor`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/steinberg-monodromy`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/supercuspidal-parameter`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/tate-unitary-normalization`, `ArithmeticGaloisRepresentations:R01.3/conductor-of-a-weil-deligne-representation`, `AutomorphicLFunctionsAndLocalFactors:AL.1`, `AutomorphicLFunctionsAndLocalFactors:AL.2`.

**Proposed library location.** `TauCeti/RepresentationTheory/GL2/R163`, namespace `TauCeti.GL2Blueprint`.

**Acceptance checks.**

- Ramified St⊗χ has conductor 2a(χ), whereas its untwisted conductor is one; this refutes the naive additive rule.

**Sources.**

- [William Casselman, On some results of Atkin and Lehner](https://lesesvre.perso.math.cnrs.fr/newforms-references/casselman.pdf), p. 307 remark following the Corollary to the Proof. The passage supplies the conductor, twists and additive-character change input or motivating calculation. The statement explicitly separates the supplier-owned general theorem from the GL₂ calculation; any unverified extension is in gaps.

**Implementation status:** `unchecked`.


<a id="R16-3-archimedean-factor-comparison"></a>

### The archimedean GL₂ factors

**Declaration:** `TauCeti.GL2Blueprint.archimedeanFactors`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R16.3/archimedean-factor-comparison`.

Use Γℝ(s)=π^{−s/2}Γ(s/2), Γℂ(s)=2(2π)^{−s}Γ(s). For a real character sign^ε|·|^u the factor is Γℝ(s+u+ε). For Ind_{ℂ×}^{Wℝ}((z/|z|)^m|z|^{2t}), m≥1, the factor is Γℂ(s+t+m/2); thus L(s,D_k)=Γℂ(s+(k−1)/2) for k≥2. At m=0 its split parameter has Γℝ(s+t)Γℝ(s+t+1)=Γℂ(s+t), without making it an irreducible Weil representation. Over ℂ, a character (z/|z|)^m|z|^{2t} has Γℂ(s+t+|m|/2), and the rank-two factor is the product. With ψℝ(x)=exp(2πix), the real-character epsilon is i^ε and the induced epsilon is i^{m+1}; complex places use ψℂ=ψℝ∘Trℂ/ℝ and AL.1’s convention.

**Hypotheses.**

- Archimedean local reciprocity, absolute value |z|ℂ=|z|², gamma and additive-character conventions fixed.

**Construction or proof.**

1. Import AF.1/archimedean-llc-gln and AL.1 archimedean character factors; the proposed AF.1b split does not change the current supplier node.
2. Decompose the Weil parameter into its real one-dimensional or induced two-dimensional summands.
3. Apply the gamma duplication formula for the m=0 boundary and compare D_k lowest weights.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R16.2/archimedean-classification`, `AutomorphicFormsOnReductiveGroups:AF.1/archimedean-llc-gln`, `AutomorphicLFunctionsAndLocalFactors:AL.1`, `AutomorphicLFunctionsAndLocalFactors:AL.2`.

**Proposed library location.** `TauCeti/RepresentationTheory/GL2/R163`, namespace `TauCeti.GL2Blueprint`.

**Acceptance checks.**

- D₂ contributes Γℂ(s+1/2); the complex angular exponent is absolute-valued.

**Sources.**

- [Hervé Jacquet and Robert P. Langlands, Automorphic forms on GL(2)](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl_9.pdf), §5 printed pp. 96–97, explicit character L/epsilon formulas and induced-real factor. JL pp. 96–97 state the real/complex character factors and the real induced factor. The modern parameter classification is the separate AF.1/archimedean-llc-gln input; AL.1 fixes the gamma/epsilon conventions.

**Atlas planet:** Archimedean local factors.

**Implementation status:** `unchecked`.


<a id="R16-3-tamely-dihedral"></a>

### Tamely dihedral representations of prime order

**Declaration:** `TauCeti.GL2Blueprint.tamelyDihedral`; definition; node `GL2AutomorphicRepresentationsAndTransfer:R16.3/tamely-dihedral`.

For odd prime ℓ with q≡−1 mod ℓ, an irreducible admissible π is tamely dihedral of order ℓ precisely when rec π=(Ind_{W_{F′}}^{W_F}θ,0), where F′/F is unramified quadratic and θ|I has exact order ℓ. Use the supplier’s induced Weil representation and class of π; no second automorphic or WD carrier is defined. The induction direction corrects the reversed indices in NT Definition 2.4. Since ℓ is prime to the residue characteristic, the inertia character is tame.

**Hypotheses.**

- ℓ odd prime, q residue cardinality and q≡−1 mod ℓ; θ continuous with open kernel on inertia.

**Construction or proof.**

1. Express the property on ET.6’s isomorphism classes using its existing induction functor.
2. Conjugation by a lift of Frobenius raises the tame inertia character to q, hence θ^σ|I=θ^{-1}|I≠θ|I.
3. Reduce the index-two irreducibility calculation to the finite inertia quotient, keeping the unramified character twist; the finite-group baseline alone does not identify the full Weil representation.

**Consumers determining the API.**

- NT §2 Definition 2.4: Supplies explicitly forced supercuspidal local components.
- NT residual-image applications: Keeps the prime order of tame inertia visible for the separate large-image theorem.

**API.**

- `TauCeti.GL2Blueprint.tamelyDihedral_parameter` (characterisation): Membership is equivalent to the stated induced parameter with exact inertia order ℓ and N=0.
- `TauCeti.GL2Blueprint.tamelyDihedral_unramified_twist` (functoriality): An unramified determinant twist preserves tamely-dihedral order ℓ.
- `TauCeti.GL2Blueprint.tamelyDihedral_conjugate` (compatibility): Replacing θ by θ^σ gives the same induced parameter.

**Unit tests.**

- `TauCeti.GL2Blueprint.tamelyDihedral_order_three` (computation): At q=2, ℓ=3, an inertia character of order three satisfies θ^q=θ^{-1}≠θ.
- `TauCeti.GL2Blueprint.tamelyDihedral_order_two_excluded` (non-example): ℓ=2 fails oddness and θ^{-1}=θ for order-two inertia, so this irreducibility argument fails.
- `TauCeti.GL2Blueprint.tamelyDihedral_unramified_character` (non-example): An unramified θ has inertia order one and is not tamely dihedral of order ℓ>2.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R16.3/supercuspidal-parameter`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6`, `ArithmeticGaloisRepresentations:R01.2/weil-deligne-representation`, `tauceti:TauCeti.simple_indFDRep_ofLinearCharacter_iff`.

**Proposed library location.** `TauCeti/RepresentationTheory/GL2/R163`, namespace `TauCeti.GL2Blueprint`.

**Acceptance checks.**

- The definition fixes the exact order, not just an order divisible by ℓ.

**Sources.**

- [James Newton and Jack A. Thorne, Symmetric power functoriality for Hilbert modular forms](https://arxiv.org/pdf/2212.03595v2), Definition 2.4 and following paragraph, printed p. 11. Definition 2.4 gives the exact prime-order inertia and unramified quadratic induction property. Its induction indices are corrected as recorded in E12.

**Atlas planet:** Tamely dihedral representations.

**Implementation status:** `unchecked`.


<a id="R16-3-tamely-dihedral-supercuspidal"></a>

### The tamely dihedral supercuspidality consequence

**Declaration:** `TauCeti.GL2Blueprint.tamelyDihedralSupercuspidal`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R16.3/tamely-dihedral-supercuspidal`.

Every tamely dihedral π of odd prime order ℓ is supercuspidal. Its parameter is irreducible, has N=0 and Swan conductor zero; since inertia has no fixed vector, a(rec π)=2 and L(s,π)=1. The exact-order argument works also at residue characteristic two, because ℓ is odd and prime to q.

**Hypotheses.**

- The complete hypotheses of tamelyDihedral, including q≡−1 mod ℓ.

**Construction or proof.**

1. Use θ^σ|I=θ^{-1}|I≠θ|I to prove irreducibility of the index-two induction.
2. Apply supercuspidalParameter and the R01.3 conductor formula; tame inertia removes Swan.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R16.3/tamely-dihedral`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/supercuspidal-parameter`, `ArithmeticGaloisRepresentations:R01.3/conductor-of-a-weil-deligne-representation`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6`.

**Proposed library location.** `TauCeti/RepresentationTheory/GL2/R163`, namespace `TauCeti.GL2Blueprint`.

**Acceptance checks.**

- q=2, ℓ=3 is included; nothing here treats all dyadic supercuspidals as dihedral.

**Sources.**

- [James Newton and Jack A. Thorne, Symmetric power functoriality for Hilbert modular forms](https://arxiv.org/pdf/2212.03595v2), Paragraph immediately after Definition 2.4. The following paragraph proves supercuspidality from irreducibility. The conductor-two/L=1 calculation is a stated application of the imported tame parameter conductor formula.

**Implementation status:** `unchecked`.


<a id="R16-3-cdt-inertia-multiplicity"></a>

### The CDT inertial comparison and multiplicity one

**Declaration:** `TauCeti.GL2Blueprint.cdtInertiaMultiplicity`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R16.3/cdt-inertia-multiplicity`.

For CDT’s regular θ of conductor xⁿ, write Θ(θ) for its full GL₂(ℤ/xⁿℤ) type. For infinite-dimensional irreducible admissible Π of GL₂(ℚx), Hom_K(Θ(θ),Π^{U(xⁿ)})≠0 iff rec Π|I≅θ∘η_{x²} ⊕ θ∘Frob∘η_{x²} in CDT’s reciprocity convention. In that case Π^{U(xⁿ)}≅Θ(θ) and the type multiplicity is one. Translate the Artin convention to R16.3. This comparison concerns the full K-type; its U₀(x) restriction used as a vexing selector can identify more than one finite-character twist. The special case in CDT’s surrounding discussion is translated with N retained, not as an N=0 parameter.

**Hypotheses.**

- x≠ℓ; regular θ and coefficient field containing its values; principal congruence U(xⁿ), full compact type.
- Use CFT Layer9 Weil reciprocity for ℚx and its unramified quadratic extension; Layer7 supplies the compatible absolute/finite-quotient map, not an inverse on all of G_Fᵃᵇ.

**Construction or proof.**

1. Apply CDT Lemma 4.2.4(3) in both directions and compare the inertial characters through the local Artin map.
2. Use the irreducibility of Θ to turn the displayed full fixed-space identification into Hom multiplicity one.
3. Restrict to the selector only after retaining the full-type statement; keep the nilpotent operator in any surrounding Steinberg comparison.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R16.2/cdt-vexing-type`, `GL2AutomorphicRepresentationsAndTransfer:R16.2/henniart-unicity`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/supercuspidal-parameter`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6`, `ArithmeticGaloisRepresentations:R01.2/weil-deligne-representation`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group`.

**Proposed library location.** `TauCeti/RepresentationTheory/GL2/R163`, namespace `TauCeti.GL2Blueprint`.

**Acceptance checks.**

- A different inertial pair has multiplicity zero for the full type; an unramified twist has multiplicity one.

**Sources.**

- [Brian Conrad, Fred Diamond and Richard Taylor, Modularity of certain potentially Barsotti–Tate Galois representations](https://math.stanford.edu/~conrad/papers/cdtmaster.pdf), Lemma 4.2.4(3), printed pp. 17–18. The passage supplies the the cdt inertial comparison and multiplicity one input or motivating calculation. The statement explicitly separates the supplier-owned general theorem from the GL₂ calculation; any unverified extension is in gaps.

**Atlas planet:** CDT local multiplicity one.

**Implementation status:** `unchecked`.


**Closure requirements for this stage.** Resolve the applicable gaps and supplier contracts listed below. The packet’s coverage record lists every applicable contract under this stage.

<a id="r16-4"></a>

## R16.4. Global cuspidal factorization and multiplicity

AS.4 supplies the Hilbert decomposition and AF.2 its smooth restricted tensor realization. The global Whittaker expansion is established before multiplicity one. Strong multiplicity compares every finite place outside one finite set and recovers the other places. Rationality is imported in algebraic normalization; non-CM is a trivial-stabilizer condition on the existing classes.

**Planets:** Cuspidal tensor factorization, Global Whittaker expansion, Global multiplicity one, Strong multiplicity one, Cohomological rationality, Non-CM self-twists.

<a id="R16-4-cuspidal-tensor-factorization"></a>

### The cuspidal restricted tensor factorization

**Declaration:** `TauCeti.GL2Blueprint.cuspidalTensor`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R16.4/cuspidal-tensor-factorization`.

For unitary central character ω trivial on F×, the smooth K∞-finite cuspidal spectrum in AA.2’s L² space is AS.4’s algebraic Hilbert-direct-sum decomposition with finite multiplicities. Every irreducible constituent has the AF.2 restricted tensor factorization ⊗′vπv, with spherical distinguished vectors at almost all finite v. Identify this algebraic factorization with the corresponding smooth vectors of its Hilbert completion and with the Whittaker tensor model. Multiplicity one is proved below; it is not assumed in this comparison. Nonunitary cuspidal representations are handled after an explicitly recorded norm twist.

**Hypotheses.**

- F number field; central character unitary for L²; admissible local factors and AF.2 distinguished-vector data.

**Construction or proof.**

1. Apply AS.4 cuspidal discreteness/admissibility and AF.2 restricted tensor product.
2. Specialize AL.3/global-whittaker-factorization after its Fourier reconstruction and global-genericity argument. Keep the algebraic restricted tensor and its smooth Hilbert completion distinct.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R16.1/finite-level-comparison`, `GL2AutomorphicRepresentationsAndTransfer:R16.2/normalized-newvector`, `AutomorphicFormsOnReductiveGroups:AF.2/restricted-tensor-product`, `AutomorphicSpectralTheory:AS.4`, `AdelicAlgebraicGroups:AA.2/central-character-l2`, `AutomorphicLFunctionsAndLocalFactors:AL.3/global-whittaker-factorization`.

**Proposed library location.** `TauCeti/RepresentationTheory/GL2/R164`, namespace `TauCeti.GL2Blueprint`.

**Acceptance checks.**

- Changing finitely many spherical vector normalizations gives the canonical restricted tensor isomorphism, not a new automorphic class.

**Sources.**

- [Hervé Jacquet and Robert P. Langlands, Automorphic forms on GL(2)](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl_9.pdf), §11 product formula (11.1.2), printed p. 183. The passage supplies the the cuspidal restricted tensor factorization input or motivating calculation. The statement explicitly separates the supplier-owned general theorem from the GL₂ calculation; any unverified extension is in gaps.

**Atlas planet:** Cuspidal tensor factorization.

**Implementation status:** `unchecked`.


<a id="R16-4-global-whittaker-expansion"></a>

### The global GL₂ Whittaker expansion

**Declaration:** `TauCeti.GL2Blueprint.globalWhittakerExpansion`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R16.4/global-whittaker-expansion`.

Fix nontrivial ψ:F\𝔸→ℂ× and additive Haar mass vol(F\𝔸)=1. For a smooth K∞-finite cuspidal φ, Wφ(g)=∫_{F\𝔸}φ(n(x)g)ψ(−x)dx and φ(g)=Σ_{a∈F×}Wφ(diag(a,1)g), with the convergence appropriate to smooth cusp forms, locally uniform after the stated differentiability/growth estimates. The coefficient map is injective and equivariant. Specialize AL.3’s general GLn Fourier–Whittaker expansion; the GL₂ unipotent has a single additive coordinate. This declaration is in R16.4, upstream of both multiplicity and the integral comparison.

**Hypotheses.**

- Cuspidality supplies zero constant term; smooth automorphic form with supplier growth estimates; global ψ and compatible self-dual local measures.

**Construction or proof.**

1. Apply AL.0 adelic Fourier theory on the compact additive quotient.
2. Cuspidality removes the zero coefficient; conjugation by diag(a,1) identifies the remaining coefficients.
3. Use AL.3 convergence/injectivity theorem and local uniqueness SR.5 for factorization.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R16.4/cuspidal-tensor-factorization`, `AutomorphicLFunctionsAndLocalFactors:AL.0/adelic-schwartz-bruhat-space`, `AutomorphicLFunctionsAndLocalFactors:AL.3/gln-fourier-expansion`, `SmoothRepresentationsOfLocalGroups:SR.5`.

**Proposed library location.** `TauCeti/RepresentationTheory/GL2/R164`, namespace `TauCeti.GL2Blueprint`.

**Acceptance checks.**

- If Wφ=0, then φ=0; the constant term cannot be retained for a cusp form.

**Sources.**

- [Hervé Jacquet and Robert P. Langlands, Automorphic forms on GL(2)](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl_9.pdf), Proposition 11.1.1 proof, printed pp. 182–183. The passage supplies the the global gl₂ whittaker expansion input or motivating calculation. The statement explicitly separates the supplier-owned general theorem from the GL₂ calculation; any unverified extension is in gaps.

**Atlas planet:** Global Whittaker expansion.

**Implementation status:** `unchecked`.


<a id="R16-4-global-multiplicity-one"></a>

### GL₂ global multiplicity one

**Declaration:** `TauCeti.GL2Blueprint.globalMultiplicityOne`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R16.4/global-multiplicity-one`.

Every irreducible cuspidal automorphic GL₂(𝔸F) representation occurs with multiplicity one in the smooth cuspidal spectrum with its central character. The Whittaker coefficient identifies its realization with the restricted tensor product of the local Whittaker models, uniquely once ψ and almost-all spherical normalizations are fixed. Equivalently, two equivariant embeddings of the same irreducible representation into the cusp space are scalar multiples.

**Hypotheses.**

- Number field F; characteristic-zero automorphic forms; unitary twist when working inside L².

**Construction or proof.**

1. Specialize AL.3/global-multiplicity-one at n=2, using globalWhittakerExpansion and the actual smooth cuspidal embedding space.
2. Use the AS.4/AF.3 smooth-versus-Hilbert realization to identify that embedding multiplicity with the cuspidal spectral multiplicity. This comparison does not reprove the generic Fourier/uniqueness theorem.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R16.4/global-whittaker-expansion`, `GL2AutomorphicRepresentationsAndTransfer:R16.4/cuspidal-tensor-factorization`, `SmoothRepresentationsOfLocalGroups:SR.5`, `AutomorphicSpectralTheory:AS.4`, `AutomorphicLFunctionsAndLocalFactors:AL.3/global-multiplicity-one`.

**Proposed library location.** `TauCeti/RepresentationTheory/GL2/R164`, namespace `TauCeti.GL2Blueprint`.

**Acceptance checks.**

- Two copies of the same cuspidal local tensor cannot give a two-dimensional automorphic multiplicity space.

**Sources.**

- [Hervé Jacquet and Robert P. Langlands, Automorphic forms on GL(2)](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl_9.pdf), Proposition 11.1.1, printed p. 183. The passage supplies the gl₂ global multiplicity one input or motivating calculation. The statement explicitly separates the supplier-owned general theorem from the GL₂ calculation; any unverified extension is in gaps.
- [James W. Cogdell, Lectures on L-functions, converse theorems, and functoriality for GL(n)](https://people.math.osu.edu/cogdell.1/fields-www.pdf), Lecture 4 §3, Theorem 4.2 and proof, printed pp.33–34 (PDF pp.37–38). The single general GL_n producer is AL.3/global-multiplicity-one; this node specializes its embedding-space result to GL₂.

**Atlas planet:** Global multiplicity one.

**Implementation status:** `unchecked`.


<a id="R16-4-strong-multiplicity-one"></a>

### GL₂ strong multiplicity one

**Declaration:** `TauCeti.GL2Blueprint.strongMultiplicityOne`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R16.4/strong-multiplicity-one`.

Let π,π′ be cuspidal automorphic representations of GL₂(𝔸F). If there is a finite set S of finite places containing their ramification and πv≅π′v for every finite v outside S, then π≅π′ globally, including every v in S and every infinite place. Equality at a density-one subset is not substituted for this cofinite condition. At an unramified place, equality means the unordered Satake pair, equivalently both standard Hecke trace and determinant data, not a single incomplete eigenvalue without central character.

**Hypotheses.**

- Cuspidal GL₂ over a number field; isomorphism at all finite places outside one finite set.

**Construction or proof.**

1. Apply AL.3’s Rankin–Selberg pole criterion: L(s,π×π̃) has a simple pole at one, while the corresponding mixed factor has one only for π≅π′.
2. Cancel equal cofinite Euler factors; import nonvanishing and absence of poles at s=1 for every omitted finite AND archimedean Rankin–Selberg factor, as in Cogdell Theorem9.3. Infinite-place equality is a conclusion, not an input.
3. Compare the classical fixed-level baseline after the AF.5 dictionary; Casselman Theorem 2 supplies a parallel local-converse proof when the infinite-place factors are already identified.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R16.4/global-multiplicity-one`, `AutomorphicLFunctionsAndLocalFactors:AL.3/strong-multiplicity-one`, `tauceti:HeckeRing.GL2.Newform.eq_of_forall_notMem_eigenvalue_eq`.

**Proposed library location.** `TauCeti/RepresentationTheory/GL2/R164`, namespace `TauCeti.GL2Blueprint`.

**Acceptance checks.**

- The theorem recovers the infinite-place factors; the pinned classical theorem alone does not prove this number-field statement.

**Sources.**

- [James W. Cogdell, Lectures on L-functions, converse theorems, and functoriality for GL(n)](https://people.math.osu.edu/cogdell.1/fields-www.pdf), Theorem9.3 and proof, printed pp.74–75 (PDF pp.78–79). The finite exceptional set may contain all archimedean places. The Rankin–Selberg pole criterion together with zero/pole-free omitted local factors recovers the whole cuspidal representation from cofinite finite-place agreement. Casselman supplies only the weaker parallel statement assuming the archimedean factors already agree.
- [William Casselman, On some results of Atkin and Lehner](https://lesesvre.perso.math.cnrs.fr/newforms-references/casselman.pdf), §2 Theorem 2 and proof, printed pp. 307–308. Casselman Theorem 2 proves the fixed-classical comparison using all twists and local converse. The statement recovering arbitrary infinite-place factors from cofinite finite-place data uses the explicitly requested AL.3 Rankin–Selberg pole criterion, not the pinned classical theorem alone.

**Atlas planet:** Strong multiplicity one.

**Implementation status:** `unchecked`.


<a id="R16-4-cohomological-rationality"></a>

### Cohomological rationality and coefficient fields

**Declaration:** `TauCeti.GL2Blueprint.cohomologicalRationality`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R16.4/cohomological-rationality`.

For regular algebraic cuspidal GL₂ representations, import AF.4’s rationality field Q(π), the fixed field of automorphisms preserving the finite-part isomorphism class, and Clozel’s finite-part Q(π)-model. Specialize its semilinear Galois conjugation to the GL₂ Hecke operators and algebraic infinitesimal character. For a holomorphic newform f of weight k≥2 over ℚ, make this comparison for π_alg=π_f⊗|det|^{−(k−2)/2}, where π_f is unitary: the unnormalized spherical T₁ eigenvalue is a_p and T₀ eigenvalue is χ(p)p^{k−2}. Then Q(π_alg) is the field generated by the normalized newform coefficients and compatible nebentypus values. A claim about the field generated by raw unitary Satake roots is not this rationality theorem. Neither periods nor an integral lattice are canonical. Étale/cohomological rationality and Galois realization required by R19 belong to that geometric owner.

**Hypotheses.**

- Regular algebraic cuspidal π; distinguish field of rationality from a field of definition before invoking AF.4.
- Use the algebraic determinant twist just displayed in the holomorphic comparison; regular algebraicity is not inferred from arbitrary unitary normalization.

**Construction or proof.**

1. Use AF.4/rationality-field and AF.4/clozel-rationality.
2. Apply strongMultiplicityOne to compare Galois-conjugate finite Hecke systems, with the algebraic normalization of eigenvalues.
3. Use upstream ModularForms Layer 8 and 8g for the coefficient-field description; export the comparison to R19 without replanning its geometry.
4. Compute T₁=√p(α+β) and T₀=αβ, apply the twist p^{(k−2)/2}, and compare the upstream primitive coefficient field. Use strong multiplicity one to identify the field from cofinite eigenvalues.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R16.4/strong-multiplicity-one`, `AutomorphicFormsOnReductiveGroups:AF.4/rationality-field`, `AutomorphicFormsOnReductiveGroups:AF.4/clozel-rationality`, `tauceti:TauCetiRoadmap/ModularForms#layer-8-modular-symbols-the-integral-hecke-algebra-and-coefficient-fields`, `tauceti:TauCetiRoadmap/ModularForms#layer-8g-galois-stability-the-character-field-and-rationality`.

**Proposed library location.** `TauCeti/RepresentationTheory/GL2/R164`, namespace `TauCeti.GL2Blueprint`.

**Acceptance checks.**

- An arbitrary noncohomological cusp representation is not asserted to have a number-field model.

**Sources.**

- [James Newton and Jack A. Thorne, Symmetric power functoriality for Hilbert modular forms](https://arxiv.org/pdf/2212.03595v2), §1.2 printed pp. 8–9, regular algebraic weights and conjugation. The passage supplies the cohomological rationality and coefficient fields input or motivating calculation. The statement explicitly separates the supplier-owned general theorem from the GL₂ calculation; any unverified extension is in gaps.

**Atlas planet:** Cohomological rationality.

**Implementation status:** `unchecked`.


<a id="R16-4-non-cm-self-twists"></a>

### The non-CM self-twist condition

**Declaration:** `TauCeti.GL2Blueprint.nonCM`; definition; node `GL2AutomorphicRepresentationsAndTransfer:R16.4/non-cm-self-twists`.

On the existing cuspidal GL₂ isomorphism classes, non-CM means that π⊗χdet≅π implies χ=1 for every Hecke character χ of F×\𝔸×. This is the self-twist formulation used by NT; it defines a subset of the AF.2 carrier rather than a second automorphic representation. Central characters imply any self-twist has χ²=1. Any specified nontrivial quadratic stabilizer excludes the class. R17.4’s automorphic-induction comparison consumes this self-twist definition; no automorphic-induction theorem is required to define it.

**Hypotheses.**

- Cuspidal GL₂ class and the supplier determinant-twist action; all Hecke characters, not only unramified ones.

**Construction or proof.**

1. Express triviality of the stabilizer of the determinant-twist action on isomorphism classes.
2. Compare central characters to obtain χ²=1; the non-CM property is exactly trivial stabilizer, including all ramified characters.

**Consumers determining the API.**

- NT Lemma 2.1: Provides irreducibility of the symmetric-power Galois representations under the theorem’s separate algebraicity hypotheses.
- R17.4 quadratic base change: Distinguishes the quadratic automorphic-induction exception to cuspidality.

**API.**

- `TauCeti.GL2Blueprint.nonCM_iff` (characterisation): π is non-CM iff every character fixing its isomorphism class is trivial.
- `TauCeti.GL2Blueprint.nonCM_twist` (functoriality): Twisting π by any Hecke character preserves non-CM.
- `TauCeti.GL2Blueprint.nonCM_self_twist_square` (compatibility): Every self-twist χ of a rank-two π satisfies χ²=1 by comparison of central characters.

**Unit tests.**

- `TauCeti.GL2Blueprint.nonCM_free_action` (computation): For the multiplication action of a group on itself every stabilizer is trivial.
- `TauCeti.GL2Blueprint.nonCM_trivial_character` (degenerate): The character χ=1 does not violate non-CM.
- `TauCeti.GL2Blueprint.nonCM_quadratic_stabilizer` (non-example): A class fixed by a specified nonidentity quadratic character is not non-CM.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R16.4/cuspidal-tensor-factorization`, `AutomorphicFormsOnReductiveGroups:AF.2`, `AutomorphicLFunctionsAndLocalFactors:AL.3`.

**Proposed library location.** `TauCeti/RepresentationTheory/GL2/R164`, namespace `TauCeti.GL2Blueprint`.

**Acceptance checks.**

- The trivial character is allowed; a nontrivial quadratic stabilizer violates the definition.

**Sources.**

- [James Newton and Jack A. Thorne, Symmetric power functoriality for Hilbert modular forms](https://arxiv.org/pdf/2212.03595v2), Lemma 2.1 introductory hypothesis, printed p. 9. The passage supplies the the non-cm self-twist condition input or motivating calculation. The statement explicitly separates the supplier-owned general theorem from the GL₂ calculation; any unverified extension is in gaps.

**Atlas planet:** Non-CM self-twists.

**Implementation status:** `unchecked`.


**Closure requirements for this stage.** Resolve the applicable gaps and supplier contracts listed below. The packet’s coverage record lists every applicable contract under this stage.

<a id="r16-5"></a>

## R16.5. Integral comparison and the converse theorem

Unfold the existing Fourier expansion and compare it with the suppliers’ local and global integrals. The converse theorem records the entire family of Hecke-character twists and every analytic condition. The classical completion is matched by a change of variable, with the gamma scalar, finite conductor and field discriminant retained.

**Planets:** Whittaker Mellin comparison, GL₂ converse theorem, Classical L-function comparison.

<a id="R16-5-whittaker-integral-comparison"></a>

### The GL₂ Whittaker Mellin comparison

**Declaration:** `TauCeti.GL2Blueprint.whittakerIntegral`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R16.5/whittaker-integral-comparison`.

For factorizable cusp φ and Wφ=⊗vWv, the integral ∫_{F×\𝔸×}φ(diag(a,1))χ(a)|a|^{s−1/2}d×a unfolds to ∫_{𝔸×}Wφ(diag(a,1))χ(a)|a|^{s−1/2}d×a and factors into the AL.2 local Whittaker zeta integrals in a common right half-plane. At unramified places with normalized spherical Wv the factor is L(s,πv⊗χv); at ramified places a supplier test vector realizes the L-factor, rather than every newvector doing so for every ramified twist. Compare this integral with AL.2’s Godement–Jacquet standard factor and AL.3’s GL₂×GL₁ Rankin–Selberg integral, using their shared LLC normalization.

**Hypotheses.**

- Cuspidal φ, Hecke character χ; factorizable measures with standard unit volume at almost all finite places; absolute convergence first.

**Construction or proof.**

1. Use globalWhittakerExpansion to unfold the multiplicative quotient and AL.0 estimates to justify exchange of sum and integral.
2. Apply restricted tensor factorization and sphericalValues for the good-place geometric series.
3. Import AL.2/AL.3 local fractional-ideal and functional-equation comparisons, then their global analytic continuation.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R16.4/global-whittaker-expansion`, `GL2AutomorphicRepresentationsAndTransfer:R16.2/spherical-whittaker-values`, `GL2AutomorphicRepresentationsAndTransfer:R16.2/normalized-newvector`, `AutomorphicLFunctionsAndLocalFactors:AL.0/adelic-schwartz-bruhat-space`, `AutomorphicLFunctionsAndLocalFactors:AL.1`, `AutomorphicLFunctionsAndLocalFactors:AL.2`, `AutomorphicLFunctionsAndLocalFactors:AL.3`.

**Proposed library location.** `TauCeti/RepresentationTheory/GL2/R165`, namespace `TauCeti.GL2Blueprint`.

**Acceptance checks.**

- For α=β the recurrence still gives the squared unramified Euler denominator; ramified test-vector choice is explicit.

**Sources.**

- [Hervé Jacquet and Robert P. Langlands, Automorphic forms on GL(2)](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl_9.pdf), Theorem11.1 printed p.180; formula (11.1.2) and its Euler product, printed pp.183–184; Lemma11.1.3 printed p.184. Formula (11.1.2) unfolds the multiplicative quotient integral to the global Whittaker integral; its factorizable Euler product is on p.184. Lemma11.1.3 supplies the right-half-plane estimate. AL.2/AL.3 supply the local test-vector and integral comparisons.

**Atlas planet:** Whittaker Mellin comparison.

**Implementation status:** `unchecked`.


<a id="R16-5-full-gl2-converse"></a>

### The GL₂ converse theorem with all twists

**Declaration:** `TauCeti.GL2Blueprint.gl2Converse`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R16.5/full-gl2-converse`.

Let Π=⊗′vΠv be an irreducible admissible generic GL₂(𝔸F) tensor, with central character trivial on F×, spherical almost everywhere and the JL uniform exponent bound at the unramified principal-series places so its standard and dual Euler products converge absolutely in a right half-plane. At infinity use genuine irreducible admissible Harish–Chandra modules and their Casselman–Wallach globalizations. Suppose for EVERY Hecke quasicharacter χ, the completed L(s,Π⊗χdet) and L(s,Π̃⊗χ⁻¹det) extend to entire functions, are bounded in every vertical strip outside the standard excluded neighborhoods (here there are no poles), and satisfy L(s,Π⊗χ)=ε(s,Π⊗χ,ψ)L(1−s,Π̃⊗χ⁻¹). Then Π is cuspidal automorphic. Finite-order, unramified-only or one fixed-conductor twists are not substituted for this family. One-dimensional local constituents are excluded by genericity/infinite-dimensionality.

**Hypotheses.**

- Number field F; uniform bound |χᵢ,v(ϖv)| between qv^{−r} and qv^r for a common r at principal-series unramified places; all local constituents infinite-dimensional/generic; full archimedean and analytic conditions above.

**Construction or proof.**

1. Use the full-rank AL.3 converse contract at n=2 as the generic analytic owner. Verify the displayed JL growth, full quasicharacter family and archimedean hypotheses separately; the n≥3 reduced-rank contract is inapplicable.
2. Use JL Theorem 11.3/Cogdell Theorem 3.1 with n=2 and all GL₁ cuspidal twists, i.e. all Hecke characters.
3. Construct the Whittaker sum; Mellin inversion and every character functional equation prove Weyl invariance and the growth estimates.
4. Entireness removes constant terms/pole obstructions; the constructed nonzero tensor is a cusp form.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R16.5/whittaker-integral-comparison`, `GL2AutomorphicRepresentationsAndTransfer:R16.2/archimedean-classification`, `AutomorphicLFunctionsAndLocalFactors:AL.1`, `AutomorphicLFunctionsAndLocalFactors:AL.2`, `AutomorphicLFunctionsAndLocalFactors:AL.3`, `AutomorphicFormsOnReductiveGroups:AF.1`, `AutomorphicFormsOnReductiveGroups:AF.2`, `AutomorphicLFunctionsAndLocalFactors:AL.3/gln-converse-full-rank`.

**Proposed library location.** `TauCeti/RepresentationTheory/GL2/R165`, namespace `TauCeti.GL2Blueprint`.

**Acceptance checks.**

- A tensor whose twisted completed L-function has a pole fails the theorem; analytic continuation by itself does not meet the hypotheses.

**Sources.**

- [Hervé Jacquet and Robert P. Langlands, Automorphic forms on GL(2)](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl_9.pdf), Theorem 11.3, printed p. 186. The passage supplies the the gl₂ converse theorem with all twists input or motivating calculation. The statement explicitly separates the supplier-owned general theorem from the GL₂ calculation; any unverified extension is in gaps.
- [James W. Cogdell, Piatetski-Shapiro’s work on converse theorems](https://people.math.osu.edu/cogdell.1/PSCT-www.pdf), §2 pp. 5–6; §3 Theorem 3.1, p. 6, n=2. For n=2 the full twist family T(n−1) is the Hecke-character family. The survey explicitly lists entire continuation, bounded vertical strips and the functional equation, as well as convergence and automorphic central character.

**Atlas planet:** GL₂ converse theorem.

**Implementation status:** `unchecked`.


<a id="R16-5-classical-l-function-comparison"></a>

### Classical and unitary L-function normalization

**Declaration:** `TauCeti.GL2Blueprint.classicalLFunction`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R16.5/classical-l-function-comparison`.

For a normalized primitive holomorphic newform f of weight k≥2, let πf be the AF.5 unitary adelization. With Lf(s)=Σ_{n≥1}a_n n^{−s}, L(s,πf)=Lf(s+(k−1)/2), including the bad-prime factors supplied by upstream newform theory. Its infinite factor is Γℂ(s+(k−1)/2). The factor 2 in Γℂ distinguishes this completion from the common classical (2π)^{−s}Γ(s)Lf(s); record the scalar and the conductor power rather than asserting equality of differently normalized completed functions. At width one the pinned CuspForm L-series theorem supplies the convergent-domain Mellin comparison; the global continuation is imported.

**Hypotheses.**

- f in the existing Γ₁(N) normalized newform carrier, nebentypus compatible with weight; AF.5 unitary normalization.

**Construction or proof.**

1. Apply AF.5’s classical-to-adelic map and upstream Hecke Euler factors to identify good eigenvalues a_p p^{−(k−1)/2}.
2. Compare the local Mellin integral and archimedean factor, then the pinned convergent-domain LSeries identity.
3. Transport the equality by AL.3 continuation and include the upstream primitive bad-prime factors.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R16.5/whittaker-integral-comparison`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/archimedean-factor-comparison`, `AutomorphicFormsOnReductiveGroups:AF.5/gl2-classical-to-adelic`, `AutomorphicFormsOnReductiveGroups:AF.5/gl2-dictionary`, `tauceti:TauCetiRoadmap/ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor`, `tauceti:CuspForm.LSeries_qExpansion_coeff_eq`, `tauceti:TauCetiRoadmap/ModularForms#layer-7-l-functions`.

**Proposed library location.** `TauCeti/RepresentationTheory/GL2/R165`, namespace `TauCeti.GL2Blueprint`.

**Acceptance checks.**

- Weight two shifts the Dirichlet variable by 1/2; the classical a_p is not the unitary Hecke eigenvalue.

**Sources.**

- [Hervé Jacquet and Robert P. Langlands, Automorphic forms on GL(2)](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl_9.pdf), §11 classical specialization of standard factors. The passage supplies the classical and unitary l-function normalization input or motivating calculation. The statement explicitly separates the supplier-owned general theorem from the GL₂ calculation; any unverified extension is in gaps.

**Atlas planet:** Classical L-function comparison.

**Implementation status:** `unchecked`.


<a id="R16-5-global-epsilon-normalization"></a>

### Global functional equation and conductor normalization

**Declaration:** `TauCeti.GL2Blueprint.globalEpsilon`; comparison; node `GL2AutomorphicRepresentationsAndTransfer:R16.5/global-epsilon-normalization`.

For the standard global additive character obtained from the trace F/ℚ and compatible self-dual local measures, put A(π)=|Disc(F)|²·N(𝔣π) in rank two. In the unitary variable, Λ(s,π)=A(π)^{s/2}L_f(s,π)L_∞(s,π). Its functional equation is Λ(s,π)=ε(1/2,π)Λ(1−s,π̃), with ε(1/2,π) the product of the local root numbers in AL.1/AL.3’s convention. For a weight-k form over ℚ and t=s+(k−1)/2, the exchange is t↔k−t. Changing local ψ_v by a global a∈F× multiplies each local epsilon by ω_v(a)|a|_v^{2s−1}; their product is one by central-character automorphy and the product formula. The discriminant square is the rank-two conductor contribution; for F=ℚ it is one.

**Hypotheses.**

- Use AL.3 global completion, the trace-normalized global ψ and self-dual measures; finite conductor from conductorEpsilon.

**Construction or proof.**

1. Multiply the local epsilon-change formula and apply the product formula.
2. Apply the unitary/classical variable substitution and upstream classical completion over ℚ.
3. Import global discriminant bookkeeping from AL.1 rather than choose inconsistent local measures.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R16.3/conductor-epsilon-comparison`, `GL2AutomorphicRepresentationsAndTransfer:R16.5/classical-l-function-comparison`, `AutomorphicLFunctionsAndLocalFactors:AL.1`, `AutomorphicLFunctionsAndLocalFactors:AL.3`.

**Proposed library location.** `TauCeti/RepresentationTheory/GL2/R165`, namespace `TauCeti.GL2Blueprint`.

**Acceptance checks.**

- For k=2, t↔2−t; changing the global additive character leaves the global epsilon factor unchanged.

**Sources.**

- [Hervé Jacquet and Robert P. Langlands, Automorphic forms on GL(2)](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl_9.pdf), Theorem 11.1, printed p. 180. The passage supplies the global functional equation and conductor normalization input or motivating calculation. The statement explicitly separates the supplier-owned general theorem from the GL₂ calculation; any unverified extension is in gaps.

**Implementation status:** `unchecked`.


**Closure requirements for this stage.** Resolve the applicable gaps and supplier contracts listed below. The packet’s coverage record lists every applicable contract under this stage.

<a id="r16-6"></a>

## R16.6. Classical and cohomological comparisons

The holomorphic dictionary uses existing newforms and the normalized local vectors. Its k≥2 discrete-series comparison, the k=1 limit comparison, and the Hilbert algebraic coefficients have distinct signatures. The geometric export records exactly which characteristic-zero multiplicity and normalization facts R18/R19 consume; it provides no integral torsion or Galois-existence theorem.

**Planets:** Primitive adelization, Hecke and level dictionary, Hilbert algebraic weights, Weight normalization, Weight-one forms.

<a id="R16-6-primitive-classical-bijection"></a>

### Primitive newforms and holomorphic cuspidal classes

**Declaration:** `TauCeti.GL2Blueprint.primitiveBijection`; construction; node `GL2AutomorphicRepresentationsAndTransfer:R16.6/primitive-classical-bijection`.

For fixed k≥2 and nebentypus χ with χ(−1)=(−1)^k, identify normalized primitive Γ₁(N) newforms in the existing HeckeRing.GL2.Newform carrier with cuspidal automorphic GL₂(𝔸ℚ) isomorphism classes of conductor N, central character determined by χ via AF.5, and infinite component D_k in unitary normalization. On the automorphic side take the finite newvector tensor and the holomorphic lowest-weight vector in the positive-determinant constituent; the full GL₂(ℝ) representation still contains both O(2) signs. Normalize its first Fourier coefficient to one. The all-bad-prime eigenproperty needed on the classical side is supplied by upstream primitive newform theory, not assumed to be a field of the pinned Newform structure.

**Hypotheses.**

- N>0, k≥2; primitive at exact conductor, existing newspace and AF.5 dictionary; chosen additive character for the vector comparison.

**Construction or proof.**

1. Apply AF.5 gl2-classical-to-adelic and gl2-dictionary to the existing form carrier.
2. Use casselmanNewvector and normalizedNewvector to recover the primitive line at every finite place; use a₁=1 to fix the global scalar.
3. Use globalMultiplicityOne and strongMultiplicityOne to prove the maps inverse and verify exact conductor with upstream Layer 4.

**Consumers determining the API.**

- R19.1: Supplies automorphic normalization for the Galois representation attached to an existing newform.
- R18 Hilbert/Shimura geometry: Provides the primitive finite-level comparison used to locate Hecke eigensystems.

**API.**

- `TauCeti.GL2Blueprint.primitiveBijection_conductor` (compatibility): The product of the local conductor ideals is exactly N.
- `TauCeti.GL2Blueprint.primitiveBijection_weight_character` (compatibility): π∞=D_k and the central character is the AF.5 character attached to χ.
- `TauCeti.GL2Blueprint.primitiveBijection_hecke` (characterisation): For p∤N, α_p+β_p=a_p p^{−(k−1)/2} and α_pβ_p=χ(p).
- `TauCeti.GL2Blueprint.primitiveBijection_normalized` (simp): The recovered holomorphic newform has first q-coefficient one.
- `TauCeti.GL2Blueprint.primitiveBijection_inverse` (universal-property): The two maps are inverse on primitive forms and compatible automorphic classes.

**Unit tests.**

- `TauCeti.GL2Blueprint.primitiveBijection_weight_two` (computation): At k=2 the infinite component is D₂ and the good trace is a_p/√p.
- `TauCeti.GL2Blueprint.primitiveBijection_old_level` (non-example): A primitive form of level M properly dividing N is not primitive of conductor N after the oldform inclusion.
- `TauCeti.GL2Blueprint.primitiveBijection_scalar_normalization` (characterisation): For a normalized eigenform with a₁=1, multiplying by a scalar c≠1 changes a₁ to c and fails normalization. Every nonzero c yields the same primitive class after renormalization; c=0 is excluded from the eigenform carrier.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R16.2/casselman-newvector`, `GL2AutomorphicRepresentationsAndTransfer:R16.2/normalized-newvector`, `GL2AutomorphicRepresentationsAndTransfer:R16.2/archimedean-classification`, `GL2AutomorphicRepresentationsAndTransfer:R16.4/global-multiplicity-one`, `GL2AutomorphicRepresentationsAndTransfer:R16.4/strong-multiplicity-one`, `AutomorphicFormsOnReductiveGroups:AF.5/gl2-classical-to-adelic`, `AutomorphicFormsOnReductiveGroups:AF.5/gl2-dictionary`, `tauceti:TauCetiRoadmap/ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor`, `tauceti:HeckeRing.GL2.Newform`, `tauceti:HeckeRing.GL2.Newform.qExpansion_coeff_one`.

**Proposed library location.** `TauCeti/RepresentationTheory/GL2/R166`, namespace `TauCeti.GL2Blueprint`.

**Acceptance checks.**

- A newform at lower conductor embedded as an oldform at N is not sent to a class of conductor N.

**Sources.**

- [Hervé Jacquet and Robert P. Langlands, Automorphic forms on GL(2)](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl_9.pdf), §11 holomorphic specialization and §5 real lowest-weight modules. The passage supplies the primitive newforms and holomorphic cuspidal classes input or motivating calculation. The statement explicitly separates the supplier-owned general theorem from the GL₂ calculation; any unverified extension is in gaps.

**Atlas planet:** Primitive adelization.

**Implementation status:** `unchecked`.


<a id="R16-6-classical-hecke-and-level"></a>

### The complete level and Hecke dictionary

**Declaration:** `TauCeti.GL2Blueprint.classicalHeckeLevel`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R16.6/classical-hecke-and-level`.

For primitiveBijection, at p∤N the unitary Satake polynomial is X²−a_p p^{−(k−1)/2}X+χ(p), while the arithmetic Hecke polynomial is X²−a_pX+χ(p)p^{k−1}. The primitive level is ∏p p^{c(πp)}. At a ramified p the local standard factor has degree zero, one or two according to (ker N)^I in rec πp, and its coefficients match the upstream primitive U_p factor after the same variable shift; do not impose a degree-two good-prime polynomial there. The finite-unit central character is χ^{-1} in the AF.5 right-equivariance convention, whereas its value on a good local uniformizer is χ(p) after global rational invariance.

**Hypotheses.**

- Γ₁(N), weight k, nebentypus and primitive hypotheses of primitiveBijection.

**Construction or proof.**

1. Compare the AF.5 finite right-equivariance formula with global central invariance.
2. Apply principalParameter, steinbergParameter and supercuspidalParameter for the good and bad local factors.
3. Use upstream primitive Hecke/newform theory for the bad U_p eigenproperty absent from the pinned bundle.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R16.6/primitive-classical-bijection`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/principal-series-parameter`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/steinberg-monodromy`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/supercuspidal-parameter`, `GL2AutomorphicRepresentationsAndTransfer:R16.5/classical-l-function-comparison`, `tauceti:TauCetiRoadmap/ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor`, `AutomorphicFormsOnReductiveGroups:AF.5/gl2-classical-to-adelic`.

**Proposed library location.** `TauCeti/RepresentationTheory/GL2/R166`, namespace `TauCeti.GL2Blueprint`.

**Acceptance checks.**

- For an unramified Steinberg local factor the standard Euler polynomial has degree one, although the WD representation has dimension two.

**Sources.**

- [William Casselman, On some results of Atkin and Lehner](https://lesesvre.perso.math.cnrs.fr/newforms-references/casselman.pdf), §3 start, printed p. 308; §1 local conductor theorem. The passage supplies the the complete level and hecke dictionary input or motivating calculation. The statement explicitly separates the supplier-owned general theorem from the GL₂ calculation; any unverified extension is in gaps.

**Atlas planet:** Hecke and level dictionary.

**Implementation status:** `unchecked`.


<a id="R16-6-hilbert-algebraic-weights"></a>

### Hilbert cohomological algebraic weights

**Declaration:** `TauCeti.GL2Blueprint.hilbertWeightRepresentation`; construction; node `GL2AutomorphicRepresentationsAndTransfer:R16.6/hilbert-algebraic-weights`.

For totally real F, embeddings Σ=Hom(F,ℝ), integers k_τ≥2 and m_τ with k_τ+2m_τ=w independent of τ, define the local algebraic representation V_τ=Sym^{k_τ−2}(standard₂)⊗det^{m_τ}, using TauCeti.symPowerRep and the existing determinant character, and V=⊗_{τ∈Σ}V_τ on (Res_{F/ℚ}GL₂)_ℂ. Its scalar action at τ is z^{k_τ−2+2m_τ}=z^{w−2}; its dimension is ∏τ(k_τ−1). The dual V∨ is used when the cohomological/local-system convention requires it; the choice is stated in the AF.4 comparison rather than silently interchanged. Parallel parity of k_τ follows from the existence of the integer m_τ.

**Hypotheses.**

- Finite embedding set of a totally real number field; k_τ≥2, m_τ∈ℤ, k_τ+2m_τ=w; characteristic-zero coefficients.

**Construction or proof.**

1. Use the existing symmetric-power standard representation and determinant z-power character.
2. Tensor over the finite embedding set; compute dimension and scalar character factorwise.
3. Apply AF.4 relative Lie algebra cohomology with its precise dual convention to the D_{k_τ} factors.

**Consumers determining the API.**

- R18 cohomological coefficient systems: Defines the algebraic coefficients imported into Hilbert and quaternionic geometry.
- R19 Hodge–Tate comparisons: Pins the weight/dual normalization used to compare automorphic and Galois parameters.

**API.**

- `TauCeti.GL2Blueprint.hilbertWeightRepresentation_scalar` (characterisation): A scalar at τ acts by z^{k_τ−2+2m_τ}; for cohomological weight this is z^{w−2}.
- `TauCeti.GL2Blueprint.hilbertWeightRepresentation_dimension` (data): dim V=∏τ(k_τ−1).
- `TauCeti.GL2Blueprint.hilbertWeightRepresentation_dual` (compatibility): Dualizing inverts the scalar central character and agrees with the AF.4 local-system convention.
- `TauCeti.GL2Blueprint.hilbertWeightRepresentation_base_change` (functoriality): Extension of characteristic-zero coefficients commutes with the tensor construction.

**Unit tests.**

- `TauCeti.GL2Blueprint.hilbertWeightRepresentation_weight_two` (degenerate): For one embedding, k=2,m=0 gives the trivial one-dimensional representation.
- `TauCeti.GL2Blueprint.hilbertWeightRepresentation_weight_three` (computation): For one embedding, k=3,m=1 gives standard₂⊗det, dimension two and scalar exponent three.
- `TauCeti.GL2Blueprint.hilbertWeightRepresentation_mixed_parity` (non-example): Weights (2,3) cannot satisfy k_τ+2m_τ=w for integer m_τ and one common w.

**Direct prerequisites.** `tauceti:TauCeti.symPowerRep`, `mathlib:Matrix.GeneralLinearGroup.det`, `mathlib:Representation`, `AutomorphicFormsOnReductiveGroups:AF.4`, `AutomorphicFormsOnReductiveGroups:AF.1`.

**Proposed library location.** `TauCeti/RepresentationTheory/GL2/R166`, namespace `TauCeti.GL2Blueprint`.

**Acceptance checks.**

- Mixed parity k_τ admits no common integer w and m_τ.

**Sources.**

- [James Newton and Jack A. Thorne, Symmetric power functoriality for Hilbert modular forms](https://arxiv.org/pdf/2212.03595v2), §1.2 regular algebraic highest-weight convention, printed p. 8. The passage supplies the hilbert cohomological algebraic weights input or motivating calculation. The statement explicitly separates the supplier-owned general theorem from the GL₂ calculation; any unverified extension is in gaps.

**Atlas planet:** Hilbert algebraic weights.

**Implementation status:** `unchecked`.


<a id="R16-6-weight-k-parameter-conversion"></a>

### The weight-k arithmetic parameter conversion

**Declaration:** `TauCeti.GL2Blueprint.weightKParameterConversion`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R16.6/weight-k-parameter-conversion`.

At p∤N, put A_p=p^{(k−1)/2}α_p and B_p=p^{(k−1)/2}β_p for the unitary Satake pair. Then A_p+B_p=a_p and A_pB_p=χ(p)p^{k−1}. In the geometric-Artin WD carrier this arithmetic Hecke parameter is rec(πf,p)⊗ν_W^{−(k−1)/2}=recᵀ(πf,p)⊗ν_W^{−(k−2)/2}. To compare to the classical Galois representation whose determinant is ε·χ_cyc^{k−1} and whose ARITHMETIC Frobenius polynomial is the arithmetic Hecke polynomial, convert the Frobenius and dual conventions explicitly: that Galois representation on geometric Frobenius has the inverse eigenpair (A_p^{-1},B_p^{-1}). Its contragredient has the Hecke eigenpair at geometric Frobenius. A nebentypus/Galois reciprocity convention must be matched before identifying this dual with the Tate-normalized construction. R19 owns the actual Galois attachment and the equality of WD data at ramified places.

**Hypotheses.**

- Classical arithmetic Frobenius convention stated; χ_cyc(arithmetic Frob_p)=p; unitary AF.5 πf, integer k≥2.

**Construction or proof.**

1. Compute the two scalar twists on the unramified matrix and its trace/determinant.
2. Use normalizationBridge for the Tate half-twist and invert eigenvalues when changing arithmetic to geometric Frobenius.
3. Request R19.1’s explicit dual/nebentypus normalization and ramified local-global comparison, keeping N for special places.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R16.3/tate-unitary-normalization`, `GL2AutomorphicRepresentationsAndTransfer:R16.6/classical-hecke-and-level`, `GL2AutomorphicRepresentationsAndTransfer:R16.6/hilbert-algebraic-weights`, `ArithmeticGaloisRepresentations:R01.2/weil-deligne-representation`.

**Proposed library location.** `TauCeti/RepresentationTheory/GL2/R166`, namespace `TauCeti.GL2Blueprint`.

**Acceptance checks.**

- At k=2 the Hecke parameter equals recᵀπ; its determinant on geometric Φ is χ(p)p, so it cannot be identified unchanged with a Galois representation having determinant χ_cyc at geometric Φ.

**Sources.**

- [James Newton and Jack A. Thorne, Symmetric power functoriality for Hilbert modular forms](https://arxiv.org/pdf/2212.03595v2), §1.2 recᵀ and Hodge–Tate conventions, printed p. 8. The passage supplies the the weight-k arithmetic parameter conversion input or motivating calculation. The statement explicitly separates the supplier-owned general theorem from the GL₂ calculation; any unverified extension is in gaps.

**Atlas planet:** Weight normalization.

**Implementation status:** `unchecked`.


<a id="R16-6-geometry-and-galois-exports"></a>

### Newvector and multiplicity exports

**Declaration:** `TauCeti.GL2Blueprint.geometricExports`; application; node `GL2AutomorphicRepresentationsAndTransfer:R16.6/geometry-and-galois-exports`.

Export the exact local conductor dimensions, normalized Whittaker line, primitive classical comparison, coefficient field and Hilbert algebraic representation to R18’s automorphic cohomology and R19’s Galois construction. Each consumer records its central character, archimedean dual convention, local compact subgroup, Hecke normalization and coefficient lattice. The finite-part multiplicity remains one for a fixed compatible infinite type; no new claim of integral multiplicity one, torsion-freeness or Galois existence is made by this export.

**Hypotheses.**

- Consumer coefficient field, local level and infinite type fixed; geometric statements imported from their owners.

**Construction or proof.**

1. Use newvector and globalMultiplicityOne to identify the characteristic-zero automorphic multiplicity factors.
2. Transport primitiveBijection and hilbertWeightRepresentation to the consumer’s existing local system.
3. Use cohomologicalRationality and weightKParameterConversion to state the exact normalization expected of the geometric construction.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R16.2/casselman-newvector`, `GL2AutomorphicRepresentationsAndTransfer:R16.4/global-multiplicity-one`, `GL2AutomorphicRepresentationsAndTransfer:R16.4/cohomological-rationality`, `GL2AutomorphicRepresentationsAndTransfer:R16.6/primitive-classical-bijection`, `GL2AutomorphicRepresentationsAndTransfer:R16.6/hilbert-algebraic-weights`, `GL2AutomorphicRepresentationsAndTransfer:R16.6/weight-k-parameter-conversion`.

**Proposed library location.** `TauCeti/RepresentationTheory/GL2/R166`, namespace `TauCeti.GL2Blueprint`.

**Acceptance checks.**

- An integral congruence between eigensystems does not imply the characteristic-zero multiplicity statement integrally.

**Sources.**

- [Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł, Cohomologie p-adique de la tour de Drinfeld: le cas de la dimension 1](https://www.ams.org/journals/jams/2020-33-02/S0894-0347-2019-00935-5/S0894-0347-2019-00935-5.pdf), §5.2.1 printed pp. 347–348, archimedean weight two. The passage supplies the newvector and multiplicity exports input or motivating calculation. The statement explicitly separates the supplier-owned general theorem from the GL₂ calculation; any unverified extension is in gaps.

**Implementation status:** `unchecked`.


<a id="R16-6-weight-one-classical-comparison"></a>

### Primitive weight-one comparison

**Declaration:** `TauCeti.GL2Blueprint.weightOneClassicalComparison`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R16.6/weight-one-classical-comparison`.

For N>0 and odd nebentypus χ, the existing primitive normalized weight-one cusp forms at conductor N correspond to cuspidal GL₂(𝔸ℚ) classes of exact conductor N and central character ω_χ whose unitary infinite component is the full-O(2) limit D₁(0). Its positive-determinant restriction has holomorphic and antiholomorphic limits of lowest weights ±1. Its real Weil parameter is 1⊕sgn, not an irreducible induction from ℂ×; its standard infinite factor is Γℝ(s)Γℝ(s+1)=Γℂ(s). Use AF.5’s k≥1 function dictionary, finite newvector normalization and global multiplicity. This comparison does not give a regular algebraic Hilbert coefficient Sym^{−1} or a weight-one Galois construction. The Casimir is −1/4 at k=1 in the convention Δ=(H²+2XY+2YX)/4.

**Hypotheses.**

- N>0; χ(−1)=−1; existing primitive newform carrier with k=1 and exact conductor; chosen AF.1 limit globalization and AF.5 dictionary.

**Construction or proof.**

1. Apply the existing AF.5 adelic/classical holomorphic dictionary at k=1, retaining the full O(2) extension and its lowering-operator condition.
2. Use the newvector line and global multiplicity one as in primitiveBijection to isolate the primitive normalized eigenform.
3. Use AF.1’s m=0 limit parameter and AL.1 gamma duplication to obtain the infinite factor; retain the corrected Casimir from AF.5/E1.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R16.2/archimedean-classification`, `GL2AutomorphicRepresentationsAndTransfer:R16.4/global-multiplicity-one`, `AutomorphicFormsOnReductiveGroups:AF.5/gl2-classical-to-adelic`, `AutomorphicFormsOnReductiveGroups:AF.5/gl2-dictionary`, `AutomorphicFormsOnReductiveGroups:AF.1`, `AutomorphicLFunctionsAndLocalFactors:AL.1`, `tauceti:TauCetiRoadmap/ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor`, `GL2AutomorphicRepresentationsAndTransfer:R16.2/casselman-newvector`, `GL2AutomorphicRepresentationsAndTransfer:R16.2/normalized-newvector`.

**Proposed library location.** `TauCeti/RepresentationTheory/GL2/R166`, namespace `TauCeti.GL2Blueprint`.

**Acceptance checks.**

- At k=1 the Casimir is −1/4 and the Weil parameter splits; do not call it a discrete series with irreducible parameter.
- Odd nebentypus is required, and no negative symmetric power is defined.

**Sources.**

- [Jayce R. Getz, An introduction to automorphic representations](https://sites.math.duke.edu/~jgetz/aut_reps.pdf), §6.4 Lemma 6.19, p. 33, corrected as AF/E1; §6.5 limit module, p. 34. The notes explicitly include k=1 and give the full O(2) module whose connected constituents are the two limits. The displayed Casimir ideal in §6.4 is corrected using the notes’ §6.5 computation, as independently confirmed in the AF packet. The Weil/gamma and primitive comparisons import the listed owners.

**Atlas planet:** Weight-one forms.

**Implementation status:** `unchecked`.


**Closure requirements for this stage.** Resolve the applicable gaps and supplier contracts listed below. The packet’s coverage record lists every applicable contract under this stage.

<a id="r17-1"></a>

## R17.1. Quaternionic local transfer

The general inner-form LLC and quaternion algebra classifications are imports. Rank two supplies the regular-elliptic minus sign, the norm-character/Steinberg example and the explicit archimedean weight comparison. Swapping one finite and one real invariant preserves the parity constraint in the CDN example; auxiliary-level and global spectral arguments belong to their consumers.

**Planets:** Local Jacquet–Langlands, Norm characters and Steinberg, Real quaternionic transfer, Swapped quaternion invariants.

<a id="R17-1-local-quaternionic-comparison"></a>

### Quaternionic local Jacquet–Langlands

**Declaration:** `TauCeti.GL2Blueprint.localQuaternionic`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.1/local-quaternionic-comparison`.

For a nonarchimedean F and quaternion division algebra D/F from the upstream quaternion carrier, ET.6 local Jacquet–Langlands identifies irreducible smooth D× representations with essentially square-integrable GL₂(F) representations. On corresponding regular elliptic d,g having the same reduced characteristic polynomial, Θ_JL(ρ)(g)=−Θ_ρ(d). Determinants/central characters and χ∘Nrd versus χ∘det twists agree. At a split place D=M₂(F) the comparison is the chosen algebra isomorphism and has sign +1. A principal series has no division-algebra preimage. This is a specialization of the general correspondence, not a second existence/bijectivity proof.

**Hypotheses.**

- Characteristic-zero smooth representations; compare matching elliptic conjugacy classes; square-integrability is essential.

**Construction or proof.**

1. Apply ET.6 inner-form LLC/JL, and identify its regular-elliptic character identity with JL Theorem 15.1.
2. Compute the rank-two sign (−1)^{2−1} and transport scalar centers and reduced norm through the upstream splitting comparison.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R16.3/steinberg-monodromy`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/supercuspidal-parameter`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6`, `tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-2-quaternion-algebras-and-the-four-fold-splitting-criterion`, `tauceti:TauCetiRoadmap/QuadraticFormInvariants#6d-the-classification-and-its-corollaries`.

**Proposed library location.** `TauCeti/RepresentationTheory/GL2/R171`, namespace `TauCeti.GL2Blueprint`.

**Acceptance checks.**

- At a division place a nontrivial χ∘Nrd transfers to Steinberg, not χ∘det.

**Sources.**

- [Hervé Jacquet and Robert P. Langlands, Automorphic forms on GL(2)](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl_9.pdf), Theorem 15.1 and following orthogonality discussion, printed pp. 249–250. The passage supplies the quaternionic local jacquet–langlands input or motivating calculation. The statement explicitly separates the supplier-owned general theorem from the GL₂ calculation; any unverified extension is in gaps.

**Atlas planet:** Local Jacquet–Langlands.

**Implementation status:** `unchecked`.


<a id="R17-1-norm-character-steinberg"></a>

### Norm characters and Steinberg twists

**Declaration:** `TauCeti.GL2Blueprint.normCharacterSteinberg`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.1/norm-character-steinberg`.

Under localQuaternionic, χ∘Nrd on D× transfers to St⊗χdet. Its central character is χ², its WD parameter is steinbergParameter with N≠0, and its standard conductor is 1 for unramified χ or 2a(χ) for ramified χ. The corresponding local L/epsilon factors are exactly those of that parameter; the one-dimensional D× dimension does not make the GL₂ WD parameter monodromy-free. The trivial D× representation is the unramified St case, used by the definite-quaternion applications.

**Hypotheses.**

- Nonarchimedean quaternion division algebra; smooth characteristic-zero χ.

**Construction or proof.**

1. Apply ET.6’s segment of length two for the norm character and JL §15 special correspondence.
2. Insert steinbergParameter and conductorEpsilon; compare the central scalar reduced norm z².

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R17.1/local-quaternionic-comparison`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/steinberg-monodromy`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/conductor-epsilon-comparison`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6`, `tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-2-quaternion-algebras-and-the-four-fold-splitting-criterion`.

**Proposed library location.** `TauCeti/RepresentationTheory/GL2/R171`, namespace `TauCeti.GL2Blueprint`.

**Acceptance checks.**

- χ=1 gives conductor one and N rank one; it does not give an unramified principal series.

**Sources.**

- [Hervé Jacquet and Robert P. Langlands, Automorphic forms on GL(2)](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl_9.pdf), §15 special/norm-character correspondence; §16 p. 269. The passage supplies the norm characters and steinberg twists input or motivating calculation. The statement explicitly separates the supplier-owned general theorem from the GL₂ calculation; any unverified extension is in gaps.

**Atlas planet:** Norm characters and Steinberg.

**Implementation status:** `unchecked`.


<a id="R17-1-real-quaternionic-comparison"></a>

### The real quaternionic coefficient comparison

**Declaration:** `TauCeti.GL2Blueprint.realQuaternionic`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.1/real-quaternionic-comparison`.

For D=Hamilton quaternions at a real place, an irreducible algebraic D× representation restricts to SU(2) as Sym^{k−2} for k≥2, with its specified positive-real central character. Its local JL image is D_k with the norm twist that gives the same central character. Under the complex splitting, the algebraic representation Sym^{k−2}⊗det^m has scalar action z^{k−2+2m}; comparison with the unitary D_k therefore includes the explicit |det|^{(k−2+2m)/2} twist and the same sign^k on ℝ×. For k=2,m=0 the trivial quaternionic representation transfers to D₂. One does not assert that an arbitrary unitary D_k is itself a finite-dimensional algebraic representation.

**Hypotheses.**

- Real place, k≥2 and m integer; AF.1b supplies full O(2) representation and archimedean LLC.

**Construction or proof.**

1. Use AF.1’s requested SU(2) highest-weight and GL₂(ℝ) Harish–Chandra character interfaces. Compare the characters on matching regular elliptic elements with the rank-two minus sign to characterize the real local JL image; the current ET.6 theorem covers finite extensions of ℚp only.
2. Compare SU(2) highest weight k−2, SO(2) lowest weight k, and the scalar characters; apply the determinant/norm twist.
3. Match the weight-two convention of CDN20 with the general Hilbert algebraic weight construction.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R17.1/local-quaternionic-comparison`, `GL2AutomorphicRepresentationsAndTransfer:R16.2/archimedean-classification`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/archimedean-factor-comparison`, `GL2AutomorphicRepresentationsAndTransfer:R16.6/hilbert-algebraic-weights`, `AutomorphicFormsOnReductiveGroups:AF.1`, `tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-2-quaternion-algebras-and-the-four-fold-splitting-criterion`.

**Proposed library location.** `TauCeti/RepresentationTheory/GL2/R171`, namespace `TauCeti.GL2Blueprint`.

**Acceptance checks.**

- k=2,m=0 has Γℂ(s+1/2); no limit k=1 representation comes from a finite-dimensional quaternionic highest weight −1.

**Sources.**

- [Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł, Cohomologie p-adique de la tour de Drinfeld: le cas de la dimension 1](https://www.ams.org/journals/jams/2020-33-02/S0894-0347-2019-00935-5/S0894-0347-2019-00935-5.pdf), §5.2.1 printed pp. 347–348. CDN20 fixes the weight-two trivial quaternionic/holomorphic discrete-series convention in its global application. The general weight/central-character comparison uses the requested AF.1 archimedean character interfaces; finite-place ET.6 is not a real-place proof.

**Atlas planet:** Real quaternionic transfer.

**Implementation status:** `unchecked`.


<a id="R17-1-wild-dyadic-transfer"></a>

### Wild and dyadic quaternionic compatibility

**Declaration:** `TauCeti.GL2Blueprint.wildDyadicTransfer`; comparison; node `GL2AutomorphicRepresentationsAndTransfer:R17.1/wild-dyadic-transfer`.

For every essentially square-integrable GL₂(F) parameter, including primitive wild rank-two Weil representations at dyadic places, the ET.6 quaternionic preimage has the same central character and LLC parameter as GL₂, with the same standard factors and Artin conductor in R16.3’s convention. For a supercuspidal it has N=0; for a special representation it has rank-one N. Dihedral/tamely-dihedral examples are checks within this statement, not a replacement for primitive wild cases. No naive level exponent of a chosen order in D is equated to the GL₂ conductor without a separate comparison.

**Hypotheses.**

- ET.6 canonical inner-form correspondence at every finite extension of ℚp; characteristic zero.

**Construction or proof.**

1. Specialize parameter compatibility from ET.6 and apply supercuspidalParameter/steinbergParameter.
2. Retain the full Swan term from R01.3 and the geometric/Tate bridge.
3. Use CDN23 and DLB as consumers; request an explicit primitive dyadic worked example and its matching function if absent from the supplier.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R17.1/local-quaternionic-comparison`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/supercuspidal-parameter`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/steinberg-monodromy`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/tate-unitary-normalization`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/tamely-dihedral-supercuspidal`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6`, `ArithmeticGaloisRepresentations:R01.3/conductor-of-a-weil-deligne-representation`.

**Proposed library location.** `TauCeti/RepresentationTheory/GL2/R171`, namespace `TauCeti.GL2Blueprint`.

**Acceptance checks.**

- A primitive wild example must not be claimed to arise from a character of the unramified quadratic extension.

**Sources.**

- [Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł, Factorisation de la cohomologie étale p-adique de la tour de Drinfeld](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/79733067FC7CB7574B408744E4387F91/S205050862300015Xa.pdf/factorisation-de-la-cohomologie-etale-p-adique-de-la-tour-de-drinfeld.pdf), §4.1.2, printed p. 38, local division/split identification. The passage supplies the wild and dyadic quaternionic compatibility input or motivating calculation. The statement explicitly separates the supplier-owned general theorem from the GL₂ calculation; any unverified extension is in gaps.

**Implementation status:** `unchecked`.


<a id="R17-1-swapped-quaternion-invariants"></a>

### Swapped quaternion invariants in arithmetic applications

**Declaration:** `TauCeti.GL2Blueprint.quaternionSwap`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.1/swapped-quaternion-invariants`.

Import upstream LOCAL quaternion classification and Hilbert reciprocity. Assume global quaternion algebras D₀,D with the prescribed ramification have been chosen; their global existence is a separate R17.3 construction, not a consequence of QFI Layer6D. In CDN23’s totally real F of even degree, D₀ ramifies at all real places and splits at all finite places. Interchange invariants at one chosen v₀|p and one real place τ₀: D ramifies at v₀ and all real places except τ₀, and has the same local algebra as D₀ away from {v₀,τ₀}. The ramified-place count stays even. Record chosen local splitting isomorphisms for Hecke comparison. Existence/globalization, auxiliary prime, small level and the resulting global spectral statement belong to R17.3/R18.3; here the local transfer at the two changed places is normCharacterSteinberg/realQuaternionic or the specified square-integrable type.

**Hypotheses.**

- Totally real F of even degree for this exact D₀ example; chosen v₀ and τ₀; general parity supplied upstream.
- Chosen global D₀,D with the displayed local invariants; this node proves their local comparisons and parity, conditional on that choice.

**Construction or proof.**

1. For the chosen global algebras, use the local split/division classification from QFI Layer6D at every finite place and the real split/Hamilton classification. Verify the invariant sum/parity by CFT Layer14; neither local uniqueness nor parity alone constructs a global quaternion algebra.
2. At finite places outside the swap use QFI Layer6D local uniqueness, and at real places use the split/Hamilton classification, to choose equal-local-algebra identifications.
3. Apply the two local JL comparisons and route the auxiliary/global geometric work to its owners.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R17.1/local-quaternionic-comparison`, `GL2AutomorphicRepresentationsAndTransfer:R17.1/norm-character-steinberg`, `GL2AutomorphicRepresentationsAndTransfer:R17.1/real-quaternionic-comparison`, `tauceti:TauCetiRoadmap/QuadraticFormInvariants#6d-the-classification-and-its-corollaries`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-14-hilbert-reciprocity-and-quadratic-reciprocity`.

**Proposed library location.** `TauCeti/RepresentationTheory/GL2/R171`, namespace `TauCeti.GL2Blueprint`.

**Acceptance checks.**

- Removing one real ramification without adding v₀ would violate parity.

**Sources.**

- [Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł, Factorisation de la cohomologie étale p-adique de la tour de Drinfeld](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/79733067FC7CB7574B408744E4387F91/S205050862300015Xa.pdf/factorisation-de-la-cohomologie-etale-p-adique-de-la-tour-de-drinfeld.pdf), §4.1.2 and equation (4.6), printed pp. 38–39. The passage supplies the swapped quaternion invariants in arithmetic applications input or motivating calculation. The statement explicitly separates the supplier-owned general theorem from the GL₂ calculation; any unverified extension is in gaps.

**Atlas planet:** Swapped quaternion invariants.

**Implementation status:** `unchecked`.


**Closure requirements for this stage.** Resolve the applicable gaps and supplier contracts listed below. The packet’s coverage record lists every applicable contract under this stage.

<a id="r17-2"></a>

## R17.2. Concrete matching and trace terms

Ordinary and twisted transfer use the existing ET test-function distributions. This stage fixes the functions, measures, signs and central-character changes in rank two. The Steinberg trace projector leaves a determinant-character correction. Strong all-x,y cuspidality supplies a separate operator-vanishing result; only that result justifies the stated continuous and residual cancellations.

**Planets:** Steinberg projector, Quaternionic orbital matching, Cyclic norm matching, Spectral term comparison, Cuspidal trace vanishing, Specialized trace comparison.

<a id="R17-2-steinberg-projector-difference"></a>

### The Steinberg projector difference

**Declaration:** `TauCeti.GL2Blueprint.steinbergProjectorDifference`; construction; node `GL2AutomorphicRepresentationsAndTransfer:R17.2/steinberg-projector-difference`.

At a nonarchimedean place, for unitary χ and ω=χ², work in SR.1’s compact-mod-center, ω⁻¹-equivariant Hecke space with AA.2 quotient measure. Put K=GL₂(O), I=K₀(p), and H=⟨Z,I,w⟩ where w=(0 1;ϖ 0). Let ξ(a)=(−1)^{v_F(a)}χ(a). Set e_K^χ(g)=χ(det g)⁻¹/vol(Z\ZK) on ZK and zero elsewhere, e_H^ξ(g)=ξ(det g)⁻¹/vol(Z\H) on H and zero elsewhere, and ζχ=e_H^ξ−e_K^χ. Then trace(St⊗χdet)(ζχ)=1, every other unitary infinite-dimensional irreducible with central character ω has trace zero, and trace(χdet)(ζχ)=−1; the other determinant characters with central character ω have trace zero. The construction is compact modulo Z, not necessarily compact in G. It is a trace projector, not an assertion that its operator is zero on every induced representation.

**Hypotheses.**

- χ unitary; nonarchimedean F; fixed central quotient measure, matching ω⁻¹ equivariance; exact extended-Iwahori H and ξ above.

**Construction or proof.**

1. Use JL §16’s explicit ζ″−ζ′ formula on printed p. 269 and the preceding projection statements.
2. Compare the K and H character-isotypic idempotents and use the local classification/oldvector calculation.
3. Compute the determinant-character trace separately; it supplies the residual correction in the global ledger.

**Consumers determining the API.**

- JL §16 global JL comparison: Matches the division-place norm character while retaining its residual correction.
- R17.2 spectral ledger: Provides the explicit test against a determinant residual constituent.

**API.**

- `TauCeti.GL2Blueprint.steinbergProjectorDifference_eval` (data): ζχ(g)=e_H^ξ(g)−e_K^χ(g) with the stated support and quotient volumes.
- `TauCeti.GL2Blueprint.steinbergProjectorDifference_central` (compatibility): ζχ(zg)=ω(z)⁻¹ζχ(g).
- `TauCeti.GL2Blueprint.steinbergProjectorDifference_steinberg` (characterisation): The corresponding Steinberg trace is one and all other unitary infinite-dimensional traces are zero.
- `TauCeti.GL2Blueprint.steinbergProjectorDifference_character` (characterisation): The corresponding determinant-character trace is minus one.
- `TauCeti.GL2Blueprint.steinbergProjectorDifference_twist` (functoriality): Replacing χ by χη multiplies ζχ(g) by η(det g)⁻¹ with the compatible central character.

**Unit tests.**

- `TauCeti.GL2Blueprint.steinbergProjectorDifference_trivial_norm` (computation): For χ=1, the St trace is 1 and the trivial GL₂-character trace is −1.
- `TauCeti.GL2Blueprint.steinbergProjectorDifference_unramified_principal` (non-example): An irreducible unitary unramified principal series has trace zero, even though its Iwahori fixed space has dimension two.
- `TauCeti.GL2Blueprint.steinbergProjectorDifference_outside_support` (computation): At g outside H∪ZK, ζχ(g)=0.
- `TauCeti.GL2Blueprint.steinbergProjectorDifference_scalar_twist` (compatibility): A determinant-character twist multiplies both local idempotents by the same inverse character.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R16.1/k0`, `GL2AutomorphicRepresentationsAndTransfer:R16.2/iwahori-center`, `GL2AutomorphicRepresentationsAndTransfer:R17.1/norm-character-steinberg`, `GL2AutomorphicRepresentationsAndTransfer:R16.1/haar-quotient-comparison`, `SmoothRepresentationsOfLocalGroups:SR.1`, `AdelicAlgebraicGroups:AA.2`.

**Proposed library location.** `TauCeti/RepresentationTheory/GL2/R172`, namespace `TauCeti.GL2Blueprint`.

**Acceptance checks.**

- Its corresponding determinant-character trace is −1, so it cannot annihilate the whole residual spectrum.

**Sources.**

- [Hervé Jacquet and Robert P. Langlands, Automorphic forms on GL(2)](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl_9.pdf), §16 printed pp. 268–269, properties (i)–(iv) and ζ″−ζ′. JL §16 explicitly constructs ζ=ζ″−ζ′ with the stated H and determinant characters and gives the Steinberg trace 1 and matching determinant-character trace −1.

**Atlas planet:** Steinberg projector.

**Implementation status:** `unchecked`.


<a id="R17-2-quaternionic-orbital-matching"></a>

### Quaternionic orbital integrals and the sign

**Declaration:** `TauCeti.GL2Blueprint.quaternionicOrbitalMatching`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.2/quaternionic-orbital-matching`.

For matching regular elliptic d∈D× and g∈GL₂(F) with the same reduced polynomial, identify their centralizer torus and choose the same torus measure; specify each ambient quotient Haar measure. ET.3/ET.6 transfer supplies test functions f_D,f_G with O_g(f_G)=−O_d(f_D) and O_g(f_G)=0 at split regular semisimple g. With the matching rank-two character identity Θ_GL₂=−Θ_D this gives trace JL(ρ)(f_G)=trace ρ(f_D). For a chosen D× matrix coefficient the transferred f_G is the JL §16 elliptic character function; in the norm-character case use steinbergProjectorDifference. Compare formal degrees and the identity orbital term using the actual quotient-volume ratio; do not infer equality of formal degrees under unrelated ambient measures.

**Hypotheses.**

- Fixed unitary central character; compact modulo center functions; regular elliptic correspondence and common centralizer measure.

**Construction or proof.**

1. Apply ET.3 local smooth transfer and ET.6 character identity to the common torus.
2. Use the local Weyl integration formula, including its Weyl denominator and rank-two sign.
3. For norm characters insert the explicit projector difference; for supercuspidals use compact-mod-center matrix coefficients and the formal-degree normalization.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R17.1/local-quaternionic-comparison`, `GL2AutomorphicRepresentationsAndTransfer:R17.2/steinberg-projector-difference`, `GL2AutomorphicRepresentationsAndTransfer:R16.1/haar-quotient-comparison`, `EndoscopicTransferAndUnitaryTraceComparison:ET.3`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6`.

**Proposed library location.** `TauCeti/RepresentationTheory/GL2/R172`, namespace `TauCeti.GL2Blueprint`.

**Acceptance checks.**

- Changing one torus measure requires the corresponding orbital-integral scalar; it cannot preserve the displayed matching identity unchanged.

**Sources.**

- [Hervé Jacquet and Robert P. Langlands, Automorphic forms on GL(2)](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl_9.pdf), §16 character orthogonality and regular-elliptic orbital-integral identity, printed pp.269–270. The identity on p.270 gives the negative GL₂ character divided by the common torus quotient volume. The unrelated averaged constant-term equation (16.1.7) is on p.277. General matching existence and singular terms are requested from ET.3.

**Atlas planet:** Quaternionic orbital matching.

**Implementation status:** `unchecked`.


<a id="R17-2-cyclic-local-matching"></a>

### Concrete cyclic norm matching

**Declaration:** `TauCeti.GL2Blueprint.cyclicMatching`; construction; node `GL2AutomorphicRepresentationsAndTransfer:R17.2/cyclic-local-matching`.

Let E/F be a cyclic extension of nonarchimedean local fields with generator σ, and use the ET.3/ET.4 twisted orbital integrals. For φ∈C_c^∞(GL₂(E)), choose f∈C_c^∞(GL₂(F)) with O_γ(f)=TO_{δ,σ}(φ) whenever γ is a regular norm of δ, and O_γ(f)=0 for regular nonnorm classes, with centralizer measures identified as in AC89 Chapter 1 §3. A matching central character on E is pulled back from F by N_{E/F}; central equivariance must use this norm, not the raw same character. At an unramified place with unit volumes, choose the spherical transfer: 1_{GL₂(O_E)} maps to 1_{GL₂(O_F)}, and Satake transforms are related by (α,β)↦(α^d,β^d), d=[E:F]. At a completely split global place use the product norm δ₁…δ_d and the corresponding convolution of local functions. The function choice is unique only modulo the kernel of regular orbital integrals.

**Hypotheses.**

- Cyclic local extension and generator; compatible centralizer Haar measures; unramified spherical assertion requires unramified E/F.

**Construction or proof.**

1. Specialize AC89 Proposition 3.1 transfer existence to rank two via ET.3.
2. Apply ET.4 unramified fundamental lemma and compute the Satake norm power rule.
3. Compute the split-place twisted norm by cycling the d factors; record central character pullback and the convolution measure.

**Consumers determining the API.**

- R17.4 cyclic base change: Supplies actual local matching and the Satake norm normalization.
- R17.2 twisted trace comparison: Provides the chosen local functions and measure/central-character ledger.

**API.**

- `TauCeti.GL2Blueprint.cyclicMatching_norm` (characterisation): Matching regular norm classes have equal ordinary and twisted orbital integrals with identified centralizer measures.
- `TauCeti.GL2Blueprint.cyclicMatching_non_norm` (characterisation): The ordinary orbital integral vanishes on regular classes that are not norms.
- `TauCeti.GL2Blueprint.cyclicMatching_unit` (compatibility): Unramified hyperspecial units match with hyperspecial volumes one.
- `TauCeti.GL2Blueprint.cyclicMatching_satake` (data): On an unramified Satake pair the norm rule sends (α,β) to (α^d,β^d).
- `TauCeti.GL2Blueprint.cyclicMatching_central` (functoriality): The E central character is ω_F∘N_{E/F}; test functions use its inverse.

**Unit tests.**

- `TauCeti.GL2Blueprint.cyclicMatching_degree_one` (degenerate): For E=F and σ=1 choose f=φ; ordinary and twisted orbital integrals agree.
- `TauCeti.GL2Blueprint.cyclicMatching_quadratic_satake` (computation): At an unramified quadratic place the pair (2,3) maps to (4,9), trace 13 and determinant 36.
- `TauCeti.GL2Blueprint.cyclicMatching_non_norm_test` (non-example): For E/F unramified quadratic, a regular γ with odd valuation of det γ cannot be a norm and its matching ordinary orbital integral is zero.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R16.3/principal-series-parameter`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/tate-unitary-normalization`, `GL2AutomorphicRepresentationsAndTransfer:R17.2/quaternionic-orbital-matching`, `EndoscopicTransferAndUnitaryTraceComparison:ET.1`, `EndoscopicTransferAndUnitaryTraceComparison:ET.3`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4`, `SmoothRepresentationsOfLocalGroups:SR.4`.

**Proposed library location.** `TauCeti/RepresentationTheory/GL2/R172`, namespace `TauCeti.GL2Blueprint`.

**Acceptance checks.**

- Residue degree one gives identity Satake transfer; determinant pulls back by norm.

**Sources.**

- [James Arthur and Laurent Clozel, Simple algebras, base change, and the advanced theory of the trace formula](https://www.claymath.org/library/cw/arthur/pdf/30.pdf), Chapter 1 §3 Proposition 3.1 pp. 20–22; §4 p. 32. The passage supplies the concrete cyclic norm matching input or motivating calculation. The statement explicitly separates the supplier-owned general theorem from the GL₂ calculation; any unverified extension is in gaps.

**Atlas planet:** Cyclic norm matching.

**Implementation status:** `unchecked`.


<a id="R17-2-continuous-residual-ledger"></a>

### The continuous and residual spectral ledger

**Declaration:** `TauCeti.GL2Blueprint.spectralLedger`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.2/continuous-residual-ledger`.

In the fixed-unitary-central-character GL₂ L² spectrum, identify AS.2, AS.4 and AS.6’s cuspidal terms, residual determinant characters χdet with χ²=ω, and continuous families of normalized inductions I(μ,ωμ⁻¹). The invariant trace formula includes the continuous integrals of normalized intertwining operators and their logarithmic derivatives, together with the residual/exceptional contributions prescribed by AS.6. On the anisotropic quaternion side identify norm characters χNrd and the non-norm cuspidal/discrete spectrum. For steinbergProjectorDifference, a matching χdet has trace −1; hence compare its residual term against the quaternion norm-character term rather than declaring both absent. In a cyclic quadratic comparison retain the σ-invariant induced families and their exceptional automorphic-induction terms, including the one-half Weyl weights, until the ET.4/AS.6 identities identify them. Local regular-elliptic matching alone does not remove the identity or continuous distributions.

**Hypotheses.**

- Use the same global Haar, central quotient and normalized intertwining conventions throughout; generic spectral carriers belong to AS.2, AS.4 and AS.6.

**Construction or proof.**

1. Import AS.4 discrete/residual classification and AS.6 invariant distributions.
2. Insert the local projector’s traces into each part, including determinant residual constituents.
3. Apply ET.4 cyclic spectral comparison, explicitly separating induced, exceptional and cuspidal terms rather than comparing just the cuspidal sums.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R17.2/steinberg-projector-difference`, `GL2AutomorphicRepresentationsAndTransfer:R17.2/quaternionic-orbital-matching`, `GL2AutomorphicRepresentationsAndTransfer:R17.2/cyclic-local-matching`, `AutomorphicSpectralTheory:AS.4`, `AutomorphicSpectralTheory:AS.2`, `AutomorphicSpectralTheory:AS.6`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4`, `AdelicAlgebraicGroups:AA.2`.

**Proposed library location.** `TauCeti/RepresentationTheory/GL2/R172`, namespace `TauCeti.GL2Blueprint`.

**Acceptance checks.**

- The χdet residual trace is −1 for the norm-character projector; a trace-zero assertion on every infinite-dimensional irreducible does not prove this term vanishes.

**Sources.**

- [Robert P. Langlands, Base change for GL(2)](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf), §10 opening spectral decomposition; §11 opening comparison. The passage supplies the the continuous and residual spectral ledger input or motivating calculation. The statement explicitly separates the supplier-owned general theorem from the GL₂ calculation; any unverified extension is in gaps.

**Atlas planet:** Spectral term comparison.

**Implementation status:** `unchecked`.


<a id="R17-2-strong-cuspidal-vanishing"></a>

### Vanishing with a strongly cuspidal local factor

**Declaration:** `TauCeti.GL2Blueprint.strongCuspidalVanishing`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.2/strong-cuspidal-vanishing`.

If a finite local factor f_v satisfies ∫_{N(Fv)}f_v(xny)dn=0 for every x,y∈GL₂(Fv), then its operator on every representation parabolically induced from the proper Borel is zero. Consequently the induced continuous terms and their intertwining-derivative contributions vanish for the factorizable global test function; the same operator identity kills any residual determinant character arising as a subquotient of such an induction. A supercuspidal matrix coefficient compact modulo center supplies this condition. The K-averaged constant-term identity printed for the Steinberg projector is weaker and is not substituted for this all-x,y condition.

**Hypotheses.**

- Compact-mod-center smooth test function, suitable integrability and fixed unitary central character; strong cuspidal constant-term condition for all x,y.

**Construction or proof.**

1. Use the induced-model kernel formula and the all-x,y constant term to prove the induced operator is zero before taking its trace.
2. Apply AS.6’s induced/intertwining terms and pass the operator identity to residual subquotients.
3. Use SR.2/SR.3 supercuspidal matrix-coefficient cuspidality; compare JL §16’s merely K-averaged identity.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R16.2/supercuspidal-kirillov`, `GL2AutomorphicRepresentationsAndTransfer:R17.2/continuous-residual-ledger`, `SmoothRepresentationsOfLocalGroups:SR.2`, `SmoothRepresentationsOfLocalGroups:SR.3`, `AutomorphicSpectralTheory:AS.6`.

**Proposed library location.** `TauCeti/RepresentationTheory/GL2/R172`, namespace `TauCeti.GL2Blueprint`.

**Acceptance checks.**

- A Steinberg projector gives trace −1 on χdet and therefore cannot satisfy the stated all-x,y hypothesis.

**Sources.**

- [Hervé Jacquet and Robert P. Langlands, Automorphic forms on GL(2)](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl_9.pdf), §16 equation (16.1.7), printed p.277; preceding Steinberg averaged constant term, printed p.269. Equation (16.1.7) is K-averaged and yields induced traces zero. The stronger all-x,y condition stated here kills the whole induced operator by the requested SR.2 kernel formula; it is not attributed to the Steinberg projector. AS.6 supplies the resulting distributional vanishing.

**Atlas planet:** Cuspidal trace vanishing.

**Implementation status:** `unchecked`.


<a id="R17-2-specialized-trace-comparison"></a>

### The concrete quaternionic and cyclic trace comparisons

**Declaration:** `TauCeti.GL2Blueprint.specializedTraceComparison`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.2/specialized-trace-comparison`.

For factorizable test functions with the local matching, central-character and Haar conventions above, specialize AS.6’s invariant trace identities to GL₂/quaternion and GL₂ cyclic base change. Every regular geometric term matches with the stated sign/norm, and the identity, singular/unipotent, residual and continuous terms are compared using the full spectralLedger. Under the all-x,y local cuspidality hypothesis use strongCuspidalVanishing for precisely the indicated terms; in the Steinberg/norm-character case retain the residual correction and match its norm-character contribution. The resulting equality of distributions is the prerequisite exported to R17.3 and R17.4. Its proof requires the complete AS.6/ET.4 singular and intertwining-term comparison; the sketch in JL §16 is not accepted as that verification.

**Hypotheses.**

- Supplier invariant trace formula and local transfer valid for the stated test-function space; compatible measures, central characters, cyclic generator and full spectral-term comparisons.

**Construction or proof.**

1. Match regular semisimple geometric distributions via quaternionicOrbitalMatching/cyclicMatching.
2. Compare the identity/formal-degree and singular/unipotent distributions from AS.6/ET.3 with the same measures.
3. Apply spectralLedger and only the proved cancellation hypotheses; import ET.4 for cyclic exceptional/intertwining contributions.
4. Use the resulting distribution equality downstream; record the explicit term calculations not yet verified as gaps.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R17.2/quaternionic-orbital-matching`, `GL2AutomorphicRepresentationsAndTransfer:R17.2/cyclic-local-matching`, `GL2AutomorphicRepresentationsAndTransfer:R17.2/continuous-residual-ledger`, `GL2AutomorphicRepresentationsAndTransfer:R17.2/strong-cuspidal-vanishing`, `AutomorphicSpectralTheory:AS.6`, `EndoscopicTransferAndUnitaryTraceComparison:ET.1`, `EndoscopicTransferAndUnitaryTraceComparison:ET.3`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4`.

**Proposed library location.** `TauCeti/RepresentationTheory/GL2/R172`, namespace `TauCeti.GL2Blueprint`.

**Acceptance checks.**

- A comparison dropping all residual terms for a Steinberg local factor is rejected; every such term must appear in the ledger.

**Sources.**

- [Hervé Jacquet and Robert P. Langlands, Automorphic forms on GL(2)](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl_9.pdf), Introduction printed p. vi and §16 opening printed p. 262. The introduction explicitly warns that §16 is a sketch with unverified details. This motivates the recorded analytical gap; AS.6/ET.4, not this sketch, must supply the complete specialized trace proof.

**Atlas planet:** Specialized trace comparison.

**Implementation status:** `unchecked`.


**Closure requirements for this stage.** Resolve the applicable gaps and supplier contracts listed below. The packet’s coverage record lists every applicable contract under this stage.

## Supplier contracts

These contracts use the suppliers’ existing carriers. A request records the exact interface needed by the listed consumers.

### `ReductiveGroupsPartII:RG2.4`

Import finite-place Iwasawa/Cartan decompositions with the local integral maximal compact and dominant invariant factors; RG2.0 supplies integral-point topology, while AF.1 supplies real/complex decompositions.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R16.1/local-adelic-compact-comparison`, `GL2AutomorphicRepresentationsAndTransfer:R16.1/iwasawa-cartan`.

### `ArithmeticGaloisRepresentations:R01.1/compact-subgroups-stabilise-lattices`

Use the existing compact-subgroup stable-lattice theorem for the finite CDT type over a finite nonarchimedean coefficient field; choose an invariant O-lattice and preserve coefficient extension, without asserting canonicity.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R16.2/cdt-vexing-type`.

### `AdelicAlgebraicGroups:AA.2`

Import quotient measures for Z(Fv)\G(Fv), central-character L² and compatible torus quotient measures; AL.0 alone owns Schwartz–Bruhat/Fourier theory.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R17.2/steinberg-projector-difference`, `GL2AutomorphicRepresentationsAndTransfer:R17.2/continuous-residual-ledger`.

### `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category`

The fixed-smooth-central-character abelian category in characteristic zero, exact compact-open invariants and projectivity of supercuspidal blocks. Include the L/ℚp scalar-extension case used by Dospinescu–Le Bras. No unrestricted-category or mod-p projectivity claim.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R16.2/supercuspidal-projective`.

### `SmoothRepresentationsOfLocalGroups:SR.1`

Use the existing C_c^∞ Hecke convolution carrier and its compact-mod-center ω⁻¹-equivariant variant, quotient Haar measure, character-isotypic compact-mod-center idempotents, double-coset operators, scalar extension and integrated representation. Keep 1_I and normalized e_K distinct.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R16.1/finite-level-comparison`, `GL2AutomorphicRepresentationsAndTransfer:R16.2/iwahori-oldforms`, `GL2AutomorphicRepresentationsAndTransfer:R16.2/iwahori-center`, `GL2AutomorphicRepresentationsAndTransfer:R17.2/steinberg-projector-difference`.

### `SmoothRepresentationsOfLocalGroups:SR.2`

Normalized induction with δ_B^{1/2}, its compact and Jacquet models, contragredients, finite-length exceptional principal series and induced-operator kernels. Supply the all-x,y constant-term criterion that makes an induced operator zero.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R16.2/local-classification`, `GL2AutomorphicRepresentationsAndTransfer:R17.2/strong-cuspidal-vanishing`.

### `SmoothRepresentationsOfLocalGroups:SR.3`

Admissibility, contragredient identity π∨≅π⊗ωπ⁻¹det for GL₂, compact-mod-center supercuspidal matrix coefficients, Bernstein inertial equivalence and typical K-types. Include characteristic-zero stable lattices for CDT finite-group types without declaring every integral realization canonical.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R16.2/local-classification`, `GL2AutomorphicRepresentationsAndTransfer:R16.2/newvector-conductor`, `GL2AutomorphicRepresentationsAndTransfer:R16.2/henniart-unicity`, `GL2AutomorphicRepresentationsAndTransfer:R16.2/supercuspidal-projective`, `GL2AutomorphicRepresentationsAndTransfer:R17.2/strong-cuspidal-vanishing`, `GL2AutomorphicRepresentationsAndTransfer:R16.2/newvector-level-exists`.

### `SmoothRepresentationsOfLocalGroups:SR.4`

Normalized Satake coordinates and the Bernstein/Iwahori presentation, center≅spherical via e_K, scalar-extension hypotheses and GL₂ generator conventions U₀,U₁,T₀,T₁. The general parahoric-center extension is the proposed SmoothRepresentationsPartIIParahoricCenters owner; use SR.4 until that roadmap is installed.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R16.2/spherical-whittaker-values`, `GL2AutomorphicRepresentationsAndTransfer:R16.2/iwahori-oldforms`, `GL2AutomorphicRepresentationsAndTransfer:R16.2/iwahori-center`, `GL2AutomorphicRepresentationsAndTransfer:R17.2/cyclic-local-matching`.

### `SmoothRepresentationsOfLocalGroups:SR.5`

The single local Whittaker/Kirillov functor, uniqueness, explicit Borel action, genericity, nonzero newvector evaluation for conductor-O ψ, spherical Whittaker values and Weyl operator from the gamma factor. Supply the finite L/ℚp Kirillov scalar extension/Γ descent used by Dospinescu–Le Bras; locally analytic theory remains R30.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R16.2/local-classification`, `GL2AutomorphicRepresentationsAndTransfer:R16.2/casselman-newvector`, `GL2AutomorphicRepresentationsAndTransfer:R16.2/normalized-newvector`, `GL2AutomorphicRepresentationsAndTransfer:R16.2/spherical-whittaker-values`, `GL2AutomorphicRepresentationsAndTransfer:R16.2/supercuspidal-kirillov`, `GL2AutomorphicRepresentationsAndTransfer:R16.4/global-whittaker-expansion`, `GL2AutomorphicRepresentationsAndTransfer:R16.4/global-multiplicity-one`, `GL2AutomorphicRepresentationsAndTransfer:R16.2/newvector-level-exists`.

### `AutomorphicFormsOnReductiveGroups:AF.1`

Through the verified RT-AREA-automorphic-1/2 fix, split off proposed AF.1b after AF.1: archimedean Wℝ,Wℂ representations, Langlands classification/globalization for GLn(ℝ),GLn(ℂ), nondegenerate limits, full-O(2) GL₂ discrete series and archimedean LLC with L/epsilon factors. The present request names current AF.1; no uninstalled AF.1b stage is treated as an existing dependency. Include real/complex O(2), U(2) compact subgroups, Iwasawa/singular-value decompositions, SU(2) algebraic highest-weight characters and GL₂(ℝ) Harish–Chandra characters needed to prove the explicit real-quaternionic comparison. This archimedean input is not supplied by finite-place ET.6.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R16.5/full-gl2-converse`, `GL2AutomorphicRepresentationsAndTransfer:R16.6/hilbert-algebraic-weights`, `GL2AutomorphicRepresentationsAndTransfer:R17.1/real-quaternionic-comparison`, `GL2AutomorphicRepresentationsAndTransfer:R16.6/weight-one-classical-comparison`, `GL2AutomorphicRepresentationsAndTransfer:R16.1/local-adelic-compact-comparison`, `GL2AutomorphicRepresentationsAndTransfer:R16.1/iwasawa-cartan`.

### `AutomorphicFormsOnReductiveGroups:AF.2`

The existing smooth automorphic/cuspidal isomorphism classes, determinant-twist action and Hecke-character classes, so non-CM is a subset of this carrier. Supply classical/adelic finite-level comparison and growth conditions; do not create another representation structure.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R16.4/non-cm-self-twists`, `GL2AutomorphicRepresentationsAndTransfer:R16.5/full-gl2-converse`.

### `AutomorphicFormsOnReductiveGroups:AF.4`

The relative-Lie-algebra-cohomological criterion for Sym^{kτ−2}⊗det^{mτ} at real GL₂, with explicit coefficient-dual and central-character convention, and compatibility under coefficient extension. Use existing rationality-field/clozel-rationality nodes for the general number-field model.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R16.6/hilbert-algebraic-weights`.

### `AutomorphicLFunctionsAndLocalFactors:AL.1`

Character L/epsilon factors over nonarchimedean and archimedean fields, ψ/measure change, ν-shifts and the discriminant convention in global products. Fix Γℝ,Γℂ, |z|ℂ and geometric Artin conventions explicitly.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R16.3/principal-series-parameter`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/conductor-epsilon-comparison`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/archimedean-factor-comparison`, `GL2AutomorphicRepresentationsAndTransfer:R16.5/whittaker-integral-comparison`, `GL2AutomorphicRepresentationsAndTransfer:R16.5/full-gl2-converse`, `GL2AutomorphicRepresentationsAndTransfer:R16.5/global-epsilon-normalization`, `GL2AutomorphicRepresentationsAndTransfer:R16.6/weight-one-classical-comparison`.

### `AutomorphicLFunctionsAndLocalFactors:AL.2`

The sole local standard-factor and Whittaker zeta-integral carrier, compatibility with LLC, local fractional ideal/test-vector theorem, epsilon shifts/conductor exponents, and archimedean gamma conventions. A normalized newvector realizes the untwisted standard L-factor; arbitrary ramified twists require their own test-vector statement.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R16.2/casselman-newvector`, `GL2AutomorphicRepresentationsAndTransfer:R16.2/supercuspidal-kirillov`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/principal-series-parameter`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/steinberg-monodromy`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/supercuspidal-parameter`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/tate-unitary-normalization`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/conductor-epsilon-comparison`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/archimedean-factor-comparison`, `GL2AutomorphicRepresentationsAndTransfer:R16.5/whittaker-integral-comparison`, `GL2AutomorphicRepresentationsAndTransfer:R16.5/full-gl2-converse`.

### `AutomorphicLFunctionsAndLocalFactors:AL.3`

General GLn global Fourier–Whittaker expansion (including convergence/injectivity) BEFORE multiplicity applications; GL₂×GL₁ integral comparison, full Hecke-character twisted functional equations and Mellin-inversion estimates; Rankin–Selberg pole criterion for π×π̃, nonvanishing and absence of poles at s=1 for omitted finite and archimedean Rankin–Selberg factors for cofinite strong multiplicity one. No second GL₂ carrier is created. Ordinary multiplicity one is the exact AL.3/global-multiplicity-one output; global genericity is deduced after its Fourier reconstruction, not imported from AF.3.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R16.4/global-whittaker-expansion`, `GL2AutomorphicRepresentationsAndTransfer:R16.4/strong-multiplicity-one`, `GL2AutomorphicRepresentationsAndTransfer:R16.4/non-cm-self-twists`, `GL2AutomorphicRepresentationsAndTransfer:R16.5/whittaker-integral-comparison`, `GL2AutomorphicRepresentationsAndTransfer:R16.5/full-gl2-converse`, `GL2AutomorphicRepresentationsAndTransfer:R16.5/global-epsilon-normalization`, `GL2AutomorphicRepresentationsAndTransfer:R16.4/global-multiplicity-one`.

### `AutomorphicSpectralTheory:AS.4`

Cuspidal Hilbert decomposition with finite multiplicity, algebraic smooth restricted-tensor realization and its relation to the completion. Supply GL₂ discrete residual determinant-character identification from the generic spectral carrier; multiplicity one is not presupposed.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R16.4/cuspidal-tensor-factorization`, `GL2AutomorphicRepresentationsAndTransfer:R16.4/global-multiplicity-one`, `GL2AutomorphicRepresentationsAndTransfer:R17.2/continuous-residual-ledger`.

### `AutomorphicSpectralTheory:AS.2`

Import normalized global/local intertwining operators, their factorization, meromorphic continuation and residues from AS.2; AS.6 supplies their operator-valued derivative distributions in the trace formula. Use the same ψ/Haar and normalization. AS.5 weighted cohomology supplies none of this.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R17.2/continuous-residual-ledger`.

### `AutomorphicSpectralTheory:AS.6`

The invariant trace formula on compact-mod-center test functions, all identity/elliptic/unipotent terms, residual characters, continuous intertwining-derivative distributions and their measure normalization. Its specialization must expose every term needed by the concrete quaternionic/cyclic ledger.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R17.2/continuous-residual-ledger`, `GL2AutomorphicRepresentationsAndTransfer:R17.2/strong-cuspidal-vanishing`, `GL2AutomorphicRepresentationsAndTransfer:R17.2/specialized-trace-comparison`.

### `EndoscopicTransferAndUnitaryTraceComparison:ET.1`

The transfer-factor and norm conventions, regular centralizer identifications and measure factors for GL₂ ordinary, inner-form and cyclic twisted transfer. Provide archimedean input through the proposed AF.1b, not a second LLC classification.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R17.2/cyclic-local-matching`, `GL2AutomorphicRepresentationsAndTransfer:R17.2/specialized-trace-comparison`.

### `EndoscopicTransferAndUnitaryTraceComparison:ET.3`

Local transfer on the existing smooth test-function carriers, quaternionic matching with rank-two sign and common torus measure, cyclic ordinary/twisted orbital-integral transfer, and identity/singular-term compatibility. General transfer existence remains here.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R17.2/quaternionic-orbital-matching`, `GL2AutomorphicRepresentationsAndTransfer:R17.2/cyclic-local-matching`, `GL2AutomorphicRepresentationsAndTransfer:R17.2/specialized-trace-comparison`.

### `EndoscopicTransferAndUnitaryTraceComparison:ET.4`

The unramified spherical fundamental lemma and simple cyclic trace comparison with normalized norm/central-character pullback. Include quadratic exceptional induced and residual terms with their one-half Weyl weights, and the exact continuous/intertwining identities used in the GL₂ specialization.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R17.2/cyclic-local-matching`, `GL2AutomorphicRepresentationsAndTransfer:R17.2/continuous-residual-ledger`, `GL2AutomorphicRepresentationsAndTransfer:R17.2/specialized-trace-comparison`.

### `EndoscopicTransferAndUnitaryTraceComparison:ET.6`

The canonical characteristic-zero GLn local LLC and GLr(D) inner-form/JL carrier, including normalized induction/segments, twisting, determinant, Artin conductor and L/epsilon compatibility. Supply all finite extensions of ℚp including dyadic primitive wild parameters, index-two Weil induction, Henniart typical-type interface and CDT Θ(θ) inertial comparison; no dependence on this GL₂ specialization.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R16.2/local-classification`, `GL2AutomorphicRepresentationsAndTransfer:R16.2/henniart-unicity`, `GL2AutomorphicRepresentationsAndTransfer:R16.2/cdt-vexing-type`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/principal-series-parameter`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/steinberg-monodromy`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/supercuspidal-parameter`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/tate-unitary-normalization`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/tamely-dihedral`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/tamely-dihedral-supercuspidal`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/cdt-inertia-multiplicity`, `GL2AutomorphicRepresentationsAndTransfer:R17.1/local-quaternionic-comparison`, `GL2AutomorphicRepresentationsAndTransfer:R17.1/norm-character-steinberg`, `GL2AutomorphicRepresentationsAndTransfer:R17.1/real-quaternionic-comparison`, `GL2AutomorphicRepresentationsAndTransfer:R17.1/wild-dyadic-transfer`, `GL2AutomorphicRepresentationsAndTransfer:R17.2/quaternionic-orbital-matching`.

### `tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-2-quaternion-algebras-and-the-four-fold-splitting-criterion`

Import the upstream quaternion algebra/reduced norm, local split/division classification and chosen splitting isomorphisms. This packet only applies these objects.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R17.1/local-quaternionic-comparison`, `GL2AutomorphicRepresentationsAndTransfer:R17.1/norm-character-steinberg`, `GL2AutomorphicRepresentationsAndTransfer:R17.1/real-quaternionic-comparison`.

### `tauceti:TauCetiRoadmap/QuadraticFormInvariants#6d-the-classification-and-its-corollaries`

Import the LOCAL uniqueness of the quaternion division algebra over a nonarchimedean local field and the split/division comparison. This layer supplies no global prescribed-ramification existence theorem; the swapped global example assumes chosen algebras and records that missing realization separately.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R17.1/local-quaternionic-comparison`, `GL2AutomorphicRepresentationsAndTransfer:R17.1/swapped-quaternion-invariants`.

### `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`

Import the absolute Artin homomorphism with dense image, finite-quotient reciprocity, arithmetic/geometric Frobenius conversion and character conductors. This is NOT an isomorphism F×→G_Fᵃᵇ; inverse character transport uses Layer9 topological Weil-group reciprocity for F/ℚp finite.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R16.3/principal-series-parameter`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/cdt-inertia-multiplicity`.

### `tauceti:TauCetiRoadmap/ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor`

Import existing primitive newform/newspace and exact conductor theory, including bad-prime Hecke eigenproperties beyond the pinned Newform fields and their classical Euler factors.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R16.5/classical-l-function-comparison`, `GL2AutomorphicRepresentationsAndTransfer:R16.6/primitive-classical-bijection`, `GL2AutomorphicRepresentationsAndTransfer:R16.6/classical-hecke-and-level`, `GL2AutomorphicRepresentationsAndTransfer:R16.6/weight-one-classical-comparison`.

### `tauceti:TauCetiRoadmap/ModularForms#layer-8-modular-symbols-the-integral-hecke-algebra-and-coefficient-fields`

Import the upstream coefficient-field theorem for primitive normalized forms and its compatibility with algebraic Hecke eigenvalues.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R16.4/cohomological-rationality`.

### `tauceti:TauCetiRoadmap/ModularForms#layer-7-l-functions`

Import the upstream primitive classical finite Euler factors, Mellin completion and functional equation, with exact width, conductor, nebentypus and weight normalization.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R16.5/classical-l-function-comparison`.

### `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-14-hilbert-reciprocity-and-quadratic-reciprocity`

Import upstream reciprocity/parity of quaternion ramification for the swapped-invariant example; this is not a new global existence proof.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R17.1/swapped-quaternion-invariants`.

### `ReductiveGroupsPartII:RG2.0`

Import topology and compactness of integral GL₂ points and openness of congruence kernels; use determinant a unit, not merely nonzero. AA.1 then supplies the adelic restricted-product identification.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R16.1/local-adelic-compact-comparison`.

### `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group`

Use localWeilArtinEquiv:F×≃ₜ*W_Fᵃᵇ onto the topological abelianization, with the Layer7 absolute-map compatibility and inversion for geometric Frobenius. This reciprocity export is available here only for finite extensions of ℚp.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R16.3/principal-series-parameter`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/cdt-inertia-multiplicity`.

### `tauceti:TauCetiRoadmap/ModularForms#layer-8g-galois-stability-the-character-field-and-rationality`

Import Galois stability/conjugate primitive newforms, CharacterField χ≤CoefficientField f, and rationality of the Hecke characteristic polynomials. Layer8 alone gives coefficient-field algebraicity and does not justify Galois conjugation of analytic forms.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R16.4/cohomological-rationality`.

## Interfaces and calculations required for closure

### 1. Archimedean owner and complete comparison signatures

AF.1b is proposed by the verified RT finding but not installed in the current atlas. The current AF.1 nodes weil-group-real, gl2-real-discrete-series, langlands-classification, archimedean-llc-gln and casselman-wallach-globalization state the classification and globalization, but carry no Lean declarations and their original proofs remain AF gaps; the comparison of L- and ε-factors of Weil parameters is AL.2’s. Obtain the complete real/complex chamber, limit and epsilon signatures from those suppliers before closing these nodes; the suggested file records these targets in explicit §13 omission blocks, with true Gammaℝ/Gammaℂ normalization fragments. In particular, prove the real quaternionic comparison through the SU(2)/GL₂(ℝ) character interfaces; current finite-place ET.6 does not provide it.

Affected declarations: `GL2AutomorphicRepresentationsAndTransfer:R16.2/archimedean-classification`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/archimedean-factor-comparison`, `GL2AutomorphicRepresentationsAndTransfer:R17.1/real-quaternionic-comparison`, `GL2AutomorphicRepresentationsAndTransfer:R16.6/hilbert-algebraic-weights`, `GL2AutomorphicRepresentationsAndTransfer:R16.6/weight-one-classical-comparison`.

### 2. Supplier test-function and automorphic carriers in Lean

The pins lack actual smooth/automorphic isomorphism-class, analytic test-function, quotient-measure, LLC and trace-distribution carriers. The assigned R16.1 topology, R16.4 Fourier/multiplicity/rationality, R16.5 integral/converse/classical-L and R16.6 primitive/weight-one/geometric comparison signatures are explicitly omitted by name with their full source hypotheses, API and tests in the suggested file (§13). They are not declarations over arbitrary replacement types. Obtain the actual supplier objects before giving those signatures. The inherited local-model, archimedean, quaternionic-comparison and trace prototypes that were false as written (arbitrary modules, multiplicity maps or scalars) are likewise recorded as §13 omission blocks since REV-FIX-RT-AREA-automorphic-1~4; the remaining declarations of the suggested file are intended to be true as written.

Affected declarations: `GL2AutomorphicRepresentationsAndTransfer:R16.1/finite-level-comparison`, `GL2AutomorphicRepresentationsAndTransfer:R16.4/cuspidal-tensor-factorization`, `GL2AutomorphicRepresentationsAndTransfer:R16.4/global-whittaker-expansion`, `GL2AutomorphicRepresentationsAndTransfer:R16.4/global-multiplicity-one`, `GL2AutomorphicRepresentationsAndTransfer:R16.4/strong-multiplicity-one`, `GL2AutomorphicRepresentationsAndTransfer:R16.4/cohomological-rationality`, `GL2AutomorphicRepresentationsAndTransfer:R16.4/non-cm-self-twists`, `GL2AutomorphicRepresentationsAndTransfer:R16.5/whittaker-integral-comparison`, `GL2AutomorphicRepresentationsAndTransfer:R16.5/full-gl2-converse`, `GL2AutomorphicRepresentationsAndTransfer:R16.6/primitive-classical-bijection`, `GL2AutomorphicRepresentationsAndTransfer:R16.6/geometry-and-galois-exports`, `GL2AutomorphicRepresentationsAndTransfer:R17.1/local-quaternionic-comparison`, `GL2AutomorphicRepresentationsAndTransfer:R17.2/steinberg-projector-difference`, `GL2AutomorphicRepresentationsAndTransfer:R17.2/quaternionic-orbital-matching`, `GL2AutomorphicRepresentationsAndTransfer:R17.2/cyclic-local-matching`, `GL2AutomorphicRepresentationsAndTransfer:R17.2/continuous-residual-ledger`, `GL2AutomorphicRepresentationsAndTransfer:R17.2/specialized-trace-comparison`, `GL2AutomorphicRepresentationsAndTransfer:R16.6/weight-one-classical-comparison`, `GL2AutomorphicRepresentationsAndTransfer:R16.1/local-adelic-compact-comparison`, `GL2AutomorphicRepresentationsAndTransfer:R16.1/iwasawa-cartan`, `GL2AutomorphicRepresentationsAndTransfer:R16.1/haar-quotient-comparison`, `GL2AutomorphicRepresentationsAndTransfer:R16.5/classical-l-function-comparison`, `GL2AutomorphicRepresentationsAndTransfer:R16.2/archimedean-classification`, `GL2AutomorphicRepresentationsAndTransfer:R16.2/casselman-newvector`, `GL2AutomorphicRepresentationsAndTransfer:R16.2/cdt-vexing-type`, `GL2AutomorphicRepresentationsAndTransfer:R16.2/henniart-unicity`, `GL2AutomorphicRepresentationsAndTransfer:R16.2/iwahori-center`, `GL2AutomorphicRepresentationsAndTransfer:R16.2/iwahori-oldforms`, `GL2AutomorphicRepresentationsAndTransfer:R16.2/local-classification`, `GL2AutomorphicRepresentationsAndTransfer:R16.2/newvector-conductor`, `GL2AutomorphicRepresentationsAndTransfer:R16.2/newvector-level-exists`, `GL2AutomorphicRepresentationsAndTransfer:R16.2/supercuspidal-kirillov`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/archimedean-factor-comparison`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/cdt-inertia-multiplicity`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/conductor-epsilon-comparison`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/principal-series-parameter`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/supercuspidal-parameter`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/tamely-dihedral`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/tamely-dihedral-supercuspidal`, `GL2AutomorphicRepresentationsAndTransfer:R16.6/hilbert-algebraic-weights`, `GL2AutomorphicRepresentationsAndTransfer:R17.1/norm-character-steinberg`, `GL2AutomorphicRepresentationsAndTransfer:R17.1/real-quaternionic-comparison`, `GL2AutomorphicRepresentationsAndTransfer:R17.1/wild-dyadic-transfer`, `GL2AutomorphicRepresentationsAndTransfer:R17.2/strong-cuspidal-vanishing`.

### 3. Full newvector and ramified factor interface

Translate Casselman’s top-left ω(a) convention by applying the theorem to π∨≅π⊗ω⁻¹det and twisting back, giving ω(d), hence last-row K₁ invariants. Verify the exact newvector Whittaker evaluation and ramified primitive U_p factor in SR.5/AL.2/upstream Layer 4. The public scan was read; it does not by itself provide the complete modern supplier signature.

Affected declarations: `GL2AutomorphicRepresentationsAndTransfer:R16.2/casselman-newvector`, `GL2AutomorphicRepresentationsAndTransfer:R16.2/normalized-newvector`, `GL2AutomorphicRepresentationsAndTransfer:R16.2/cdt-vexing-type`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/cdt-inertia-multiplicity`, `GL2AutomorphicRepresentationsAndTransfer:R16.6/classical-hecke-and-level`, `GL2AutomorphicRepresentationsAndTransfer:R16.6/weight-one-classical-comparison`.

### 4. Primitive wild dyadic worked example

The all-field theorem is imported from ET.6, but no explicit primitive dyadic parameter together with its Swan computation and quaternion matching function was verified in the source passages read. Add a worked primitive example, not a tame quadratic replacement, and compute a(r), L=1 and its matching function in the supplier normalization.

Affected declarations: `GL2AutomorphicRepresentationsAndTransfer:R16.3/supercuspidal-parameter`, `GL2AutomorphicRepresentationsAndTransfer:R17.1/wild-dyadic-transfer`, `GL2AutomorphicRepresentationsAndTransfer:R17.2/quaternionic-orbital-matching`.

### 5. Geometric versus arithmetic Galois normalization handoff

The algebraic Satake half-twist and Frobenius inversion are specified. R19.1 must match its nebentypus reciprocity and dual convention to the Galois representation with determinant ε·χ_cyc^{k−1}, and prove ramified WD compatibility with N preserved. This is a downstream interface requirement, not a prerequisite edge from R19 back to R16.

Affected declarations: `GL2AutomorphicRepresentationsAndTransfer:R16.6/weight-k-parameter-conversion`, `GL2AutomorphicRepresentationsAndTransfer:R16.6/geometry-and-galois-exports`.

### 6. Concrete singular and continuous trace-term calculations

JL §16 explicitly supplies a formal sketch; it does not verify all analytic details. Langlands §10 also says its analytical proof is scamped. Read and specialize the complete AS.6/ET.4 identity, unipotent, intertwining-derivative and quadratic exceptional terms with the exact measure convention; compute the norm-character/residual correction and one-half Weyl weights rather than claim generic cancellation.

Affected declarations: `GL2AutomorphicRepresentationsAndTransfer:R17.2/continuous-residual-ledger`, `GL2AutomorphicRepresentationsAndTransfer:R17.2/specialized-trace-comparison`.

### 7. Suggested-file supplier conditions and full tensor coefficient types

The suggested file prototypes the actual algebraic pieces and explicitly lists omitted supplier conditions. The full Weil-induction property, geometric Hilbert tensor representation, primitive cusp subtype, compact-mod-center supports/volumes and orbital integrals cannot be stated at the pins. Replace the parameters by supplier carriers and add their conditions; do not interpret provisional statements as unconditional mathematics.

Affected declarations: `GL2AutomorphicRepresentationsAndTransfer:R16.3/tamely-dihedral`, `GL2AutomorphicRepresentationsAndTransfer:R16.6/hilbert-algebraic-weights`, `GL2AutomorphicRepresentationsAndTransfer:R16.6/primitive-classical-bijection`, `GL2AutomorphicRepresentationsAndTransfer:R17.2/steinberg-projector-difference`, `GL2AutomorphicRepresentationsAndTransfer:R17.2/cyclic-local-matching`.

### 8. Global realization of prescribed quaternion ramification

QFI Layer6D proves only local classification. CFT Layer14 proves reciprocity/parity, which is necessary but alone does not construct a global algebra. The present local swap/parity comparison assumes chosen D₀,D as in CDN23. Before the R17.3 global transfer application, identify the owner and prove the global prescribed-ramification existence/uniqueness theorem on the existing QuaternionAlgebra carrier (with the global Brauer/degree-index comparison); do not infer it from local classification or add a second carrier.

Affected declarations: `GL2AutomorphicRepresentationsAndTransfer:R17.1/swapped-quaternion-invariants`.

## Ownership and consumer boundaries

The proposed AF.1→AF.1b split assigns archimedean classification, discrete/limit modules, globalization and archimedean LLC to the generic supplier. The prerequisites use current AF.1 until that split is installed. The R16.4/R16.5 rescope places the expansion before multiplicity. The R16.1 rescope assigns additive Schwartz–Bruhat theory to AL.0 while preserving the distinct AA.0/AA.1/AA.2 contracts. These proposals change the graph’s ownership; they do not duplicate its carriers.

The routed sources supply the following local interfaces and retain the following consumers:

- Newton–Thorne uses the geometric/Tate LLC bridge, prime-order tamely dihedral inertia, Hilbert algebraic weights and the all-character non-CM condition here. Cyclic base change, automorphic induction and their exceptional cases belong to R17.4.
- Dospinescu–Le Bras uses Henniart’s typical type, fixed-central-character supercuspidal projectivity and scalar-extension/Γ-descent Kirillov theory. Its locally analytic and p-adic Banach constructions belong to R30; R17.1 supplies the smooth quaternionic parameter.
- Calegari–Geraghty (2018) and Conrad–Diamond–Taylor use the full compact Θ(θ), its stable coefficient lattice and its precisely restricted vexing-prime selector. Their integral patched modules and homology remain in the modularity/locally symmetric owners. The multiplicity test concerns the full Θ-type, rather than all occurrences of its selector restriction.
- Calegari–Geraghty (2020) provides the characteristic-zero oldform cyclicity test. Its integral failure mechanism is a consumer limitation, not an integral multiplicity-one conclusion of this part.
- Boxer–Calegari–Gee–Pilloni’s GL₂ Iwahori center and spherical projection are calculated here. Its parahoric generality belongs to the proposed parahoric-center extension of SR.4. Its GSp₄ exceptional spectrum and genus-two global transfer belong to R17.5 and that group’s owners.
- Atobe–Kondo–Yasuda supplies the rank-two K(n,λ) compatibility check; its higher-rank newform construction remains with generic smooth representation theory.
- Colmez–Dospinescu–Nizioł (2020, 2023) uses the weight-two norm-character/Steinberg comparison and the two-place swap. The auxiliary place, sufficiently small global level, Shimura geometry and completed/étale tower cohomology remain in R17.3/R18 and the Drinfeld/p-adic geometric owners.
- Pan uses the algebraic quaternionic coefficients, reduced-norm character quotient and the Hecke-compatible global JL comparison. Local norm-character and archimedean conventions come from this part; the global spectral exclusion of norm characters and the completed-cohomology eigenspaces belong to R17.3/R18 and his p-adic geometric extension.
- The functional-equation/completion formulas export to the classical upstream L-function comparison. R19 owns the Galois representation with determinant εχ_cyc^{k−1}; it must match arithmetic/geometric Frobenius, the nebentypus and the cohomological dual before identifying WD data. Ramified comparison keeps N.

## Source corrections

The packet carries four source issues, with exact versions, locators and the prior independent confirmations. No independent review of this packet is claimed.

- `GL2AutomorphicRepresentationsAndTransfer/E12` (Definition 2.4, arXiv v2 p. 11; the same slip in the proof of Lemma 3.1, p. 14): Ind_{W_{F′_v}}^{W_{F_v}} χ_v and Ind_{G_{F′_{v₀}}}^{G_{F_{v₀}}} ψ̄. The character is on W_{F′}, so induction runs to W_F. Previously recorded and confirmed as PAPER-NEWTON-THORNE-26/E3 by REV-PAPER-NEWTON-THORNE-26
- `GL2AutomorphicRepresentationsAndTransfer/E13` (§1.3 (speculative remarks on geometric doubling), p. 805, last paragraph and display at the foot of the page. arXiv:1907.08691v1 has the same wording and display: the sentence starts on p. 4 and the display is on p. 5.): Replace "which is not trivial" with "which is not one-dimensional" (equivalently "infinite-dimensional" or "generic"). Then π_p is an irreducible unramified principal series Ind_B^G(χ1⊗χ2), with χ1, χ2 unramified and χ1χ2^{-1} ≠ |·|^{±1}, and the display holds. This one-word change is the minimal fix. A nontrivial unramified χ∘det satisfies the printed hypothesis and has both fixed spaces of dimension one. Previously recorded and confirmed as PAPER-CALEGARI-GERAGHTY-20/E8 by REV-PAPER-CALEGARI-GERAGHTY-20
- `GL2AutomorphicRepresentationsAndTransfer/E14` (Published §2.4.15, printed p. 179, second spherical projection identity): T^{GL₂}_{v,1} in the second identity, matching the rank-two algebra on both sides. The entire lemma concerns GL₂; the final right-hand symbol is the GSp₄ notation whereas the preceding definitions supply T^{GL₂}_{v,1}. Already noted in accepted PAPER-BOXER-CALEGARI-GEE-PILLONI-21/20 and in the job routing brief
- `GL2AutomorphicRepresentationsAndTransfer/E15` (§6.4, Lemma 6.19 and Remark 6.20 (p. 33), repeated in §6.5 (p. 34); notes version of 13 March 2015): With ∆ = (1/4)(H² + 2XY + 2YX), a weight-k form φ_f killed by the lowering operator satisfies ∆φ_f = (k(k−2)/4)φ_f; the ideal is ⟨∆ − k(k−2)/4, Z⟩. The notes' own §6.5 gives ∆v_ℓ = (k(k−2)/4)v_ℓ on the discrete series π_k generated by such forms. Check at k = 2: weight-2 holomorphic forms have the infinitesimal character of the trivial representation, on which ∆ acts by 0, whereas (k²−1)/4 = 3/4. With the printed ideal the target space of Lemma 6.19 is 0 for k ≥ 2, so the stated isomorphism is false as printed. Previously independently confirmed as AutomorphicFormsOnReductiveGroups/E1 by REV-AutomorphicFormsOnReductiveGroups; this packet uses that correction.

## Public source inventory

The recorded editions and section ranges determine the locators used above. The packet records access date and SHA-256 for each downloaded version. All 18 sources are publicly accessible; no private reference library is required. Reading is restricted to the passages needed by these targets and their consumers.

- **jl70** — Hervé Jacquet and Robert P. Langlands, [*Automorphic forms on GL(2)*](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl_9.pdf). LNM 114 (1970), IAS retypeset editorial PDF (2026); locators use printed section pagination in this PDF. Passages read: §2 Kirillov theory and Corollary 2.19 (printed p. 40); §3 principal-series/spherical formulas.; §5 Lemmas 5.6–5.7, real modules and archimedean character factors on printed pp. 96–97; §6 Lemma 6.1 and complex classification discussion.; §10 Definition 10.2 and cuspidality; §11 Theorem 11.1, Proposition 11.1.1 and Theorem 11.3, pp. 180–187; §15 Theorem 15.1 and character discussion; §16 Theorem 16.1 and local functions on pp. 268–270. The introductory warning that §16 is a sketch is retained.
- **casselman73** — William Casselman, [*On some results of Atkin and Lehner*](https://lesesvre.perso.math.cnrs.fr/newforms-references/casselman.pdf). Math. Ann. 201 (1973), 301–314, public Göttingen scan. Passages read: Printed pp. 301–308 viewed as images: §1 Theorem 1, proof in supercuspidal/principal/special cases, Corollary to the Proof and epsilon remark; §2 Theorem 2 and proof; start of §3.
- **nt26** — James Newton and Jack A. Thorne, [*Symmetric power functoriality for Hilbert modular forms*](https://arxiv.org/pdf/2212.03595v2). Annals 203 (2026); arXiv 2212.03595v2 author version. Passages read: §1.2 pp. 7–8, geometric Artin convention and rec versus recᵀ; §2 Lemma 2.1 non-CM hypothesis (p. 9), Definition 2.4 and following supercuspidality paragraph (p. 11).
- **dlb17** — Gabriel Dospinescu and Arthur-César Le Bras, [*Revêtements du demi-plan de Drinfeld et correspondance de Langlands p-adique*](https://arxiv.org/pdf/1509.00606v2). Annals 186 (2017); arXiv 1509.00606v2. Passages read: §5 proof of Theorem 5.5, minimal type and Henniart invocation, pp. 26–27; §12 pp. 61–64 classical scalar-extension Kirillov model and footnote 52 fixed-central-character projectivity.
- **bm02** — Christophe Breuil, Ariane Mézard; appendix by Guy Henniart, [*Multiplicités modulaires et représentations de GL₂(ℤp) et de Gal(Q̄p/Qp), Appendix: Sur l’unicité des types pour GL₂*](https://www.imo.universite-paris-saclay.fr/m/~breuil/PUBLICATIONS/multiplicite.pdf). Duke 115 (2002), author manuscript. Passages read: Henniart Appendix A.1.3–A.1.6 pp. 74–76 and A.3 supercuspidal cases, including minimal/twisted types.
- **cdt99** — Brian Conrad, Fred Diamond and Richard Taylor, [*Modularity of certain potentially Barsotti–Tate Galois representations*](https://math.stanford.edu/~conrad/papers/cdtmaster.pdf). JAMS 12 (1999), author manuscript. Passages read: §4.2 pp. 16–18, Lemma 4.2.4(3); §5.1 pp. 18–19, σS,p and Lemma 5.1.1.
- **cg18** — Frank Calegari and David Geraghty, [*Modularity lifting beyond the Taylor–Wiles method*](https://math.uchicago.edu/~fcale/papers/CG.pdf). Inventiones (2018), author PDF. Passages read: §3.9.2 construction of Wσx from CDT §5 and final multiplicity-one remark using CDT Lemma 4.2.4(3).
- **cg20** — Frank Calegari and David Geraghty, [*Modularity lifting for non-regular symplectic representations*](https://math.uchicago.edu/~fcale/papers/Siegel.pdf). Duke (2020), author published PDF. Passages read: §1.3 printed pp. 805–806: GL₂ characteristic-zero oldform remark and integral contrast.
- **bcgp21** — George Boxer, Frank Calegari, Toby Gee and Vincent Pilloni, [*Abelian surfaces over totally real fields are potentially modular*](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf). Publ. Math. IHÉS (2021), published PDF. Passages read: §2.4.14–2.4.15 printed pp. 178–179, GL₂ Hecke operators, center and spherical projection.
- **hkp10** — Thomas Haines, Robert Kottwitz and Amritanshu Prasad, [*Iwahori–Hecke algebras*](https://www.math.umd.edu/~tjh/IHA.apr.09.pdf). J. Ramanujan Math. Soc. 25 (2010), author April 2009 version. Passages read: §1–2 Bernstein algebra conventions and §4.6, equation (4.6.1), center/Satake compatibility.
- **aky22** — Hiraku Atobe, Satoshi Kondo and Seidai Yasuda, [*Local newforms for the general linear groups over a non-archimedean local field*](https://arxiv.org/pdf/2110.09070v4). Forum Math. Pi (2022); arXiv 2110.09070v4. Passages read: §1.2 printed pp. 3–4: K(n,λ), conductor and generic λ=(0,…,0,cπ); rank-two comparison.
- **cdn20** — Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł, [*Cohomologie p-adique de la tour de Drinfeld: le cas de la dimension 1*](https://www.ams.org/journals/jams/2020-33-02/S0894-0347-2019-00935-5/S0894-0347-2019-00935-5.pdf). JAMS 33 (2020), published PDF. Passages read: §5.2.1 printed pp. 347–348: quaternion pair, local identifications and weight-two archimedean representation.
- **cdn23** — Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł, [*Factorisation de la cohomologie étale p-adique de la tour de Drinfeld*](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/79733067FC7CB7574B408744E4387F91/S205050862300015Xa.pdf/factorisation-de-la-cohomologie-etale-p-adique-de-la-tour-de-drinfeld.pdf). Forum Math. Pi (2023), published PDF. Passages read: §4.1.2–4.1.3 printed pp. 38–40: swapped invariants, equation (4.6), auxiliary place and level.
- **pan26** — Lue Pan, [*On locally analytic vectors of the completed cohomology of modular curves II*](https://arxiv.org/pdf/2209.06366). Annals 203 (2026); arXiv 2209.06366 public version accessed 2026-10-07. Passages read: §5.4.11 p. 71: quaternionic coefficients and norm quotient; §5.5.5 pp. 75–76: Hecke spectrum and Jacquet–Langlands.
- **converse** — James W. Cogdell, [*Piatetski-Shapiro’s work on converse theorems*](https://people.math.osu.edu/cogdell.1/PSCT-www.pdf). Author survey, 2013. Passages read: §2 pp. 5–6 convergence, central character and nice twists; §3 Theorem 3.1 and spectral inversion.
- **langlands80** — Robert P. Langlands, [*Base change for GL(2)*](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf). Annals Studies 96 (1980), author Digital Math Archive version. Passages read: §4 Lemmas 4.5–4.8 and split-place norm, pp. 24–25; §10 opening spectral decomposition and analytical caveat; §11 opening comparison and quadratic exceptional principal-series contribution.
- **ac89** — James Arthur and Laurent Clozel, [*Simple algebras, base change, and the advanced theory of the trace formula*](https://www.claymath.org/library/cw/arthur/pdf/30.pdf). Annals Studies 120 (1989), public Clay scan. Passages read: Chapter 1 §3 Proposition 3.1 and measure conventions, pp. 20–22; Chapter 1 §4 opening unramified spherical transfer statement p. 32.
- **getz15** — Jayce R. Getz, [*An introduction to automorphic representations*](https://sites.math.duke.edu/~jgetz/aut_reps.pdf). Author-hosted course notes, 13 March 2015 (89 pages). Passages read: §6.4–6.5, printed pp. 32–34: holomorphic adelization for k≥1, corrected Casimir and full-O(2) limit module at k=1.

## Signature companion and acceptance of the pass

The suggested file retains typed algebraic fragments and discriminating computations. Every remaining declaration is intended to be true as written. Section 13 lists the omitted source-specific declarations, API lemmas and tests, together with their full mathematical contracts. The unavailable automorphic, analytic, Weil-parameter, coefficient and trace-distribution carriers must be supplied before those signatures can be restored.

The pinned Tau Ceti newform and symmetric-power declarations remain imports from their actual source statements. The companion does not substitute arbitrary types or unrelated operations for source theorems. Elaboration with placeholder proofs checks the retained fragments; it establishes no omitted representation-theoretic theorem.

Acceptance requires valid packet references, no internal dependency cycle, complete target coverage, and a matching reader and signature companion with definition APIs and tests. Closure also requires the exact supplier contracts, the primitive dyadic example, the full ramified/newvector comparison, the singular and continuous trace calculations, and the downstream normalization handoff.
