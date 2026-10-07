# Generalized Heegner cycles and their Iwasawa variation

Part GH.0: Kuga–Sato geometry through Hida-family specialization (GH.0–GH.7).

## Purpose and planning status

This roadmap connects graph cycles on a modular Kuga–Sato variety with their Galois classes, p-adic Abel–Jacobi values, anticyclotomic universal norms and ordinary Hida-family specializations. The geometric starting point is the generalized Heegner cycle of Bertolini–Darmon–Prasanna. The fixed-weight arithmetic route follows Castella–Hsieh and Longo–Vigni; the family route follows Castella. These routes retain their own hypotheses and normalizations.

The target-level pass is complete: 66 declaration nodes cover all eight stages. All stages are **planned**, none is **closed**. There are 16 named gaps and 17 supplier requests. Every prerequisite chain ends in a checked baseline declaration, an exact foreign node, a requested stage or a recorded gap. Completion here records the finished planning pass, with proof closure still open. Every declaration has implementation status **unchecked**. GH.8, including its exceptional-zero applications, is outside this part.

The packet is [GeneralizedHeegnerCycles--GH.0.json](../packets/GeneralizedHeegnerCycles--GH.0.json). The [suggested file](../suggested/GeneralizedHeegnerCycles--GH.0.lean) gives proposed names and signatures against the available library interfaces. This document gives the definitive mathematical statements and hypotheses. The plan retains the thirteen sound checkpoint IDs and refines the six integrated source units at declaration granularity.

## Conventions

Write K for an imaginary quadratic field, H for a field containing its Hilbert class field, and O_c=Z+cO_K for the order of conductor c. A/H is a fixed CM elliptic curve with a specified O_K action. A marked isogeny is prime to the Γ₁(N) level precisely when its kernel meets A[N] trivially. Existence and canonical descent of these CM objects are imported. In the canonical CH application the chosen CM curve and its Weil restriction carry the Hecke character used in the coefficient projection; a general CM twist does not carry a good model merely because the modular level is prime to p.

Use **m=k−2** for the BDP fiber-power index. Its modular factor W_m has dimension m+1, its product X_m=W_m×A^m has dimension 2m+1, and the graph cycle has codimension m+1. In the CH and Castella convention **k=2r**, hence **m=2r−2**. A source locator may use BDP’s r for m; this does not identify it with the half-weight r. In particular the m=0 point case has CH half-weight r=1. It uses a degree-zero cusp correction, rather than the higher-weight cohomological vanishing argument.

The CM projector averages the signed action of Ξ_m=μ₂^m⋊S_m. Its denominator is 2^m m!. The permutation sign cancels the graded Künneth sign on degree-one factors, giving a symmetric power; unsigned geometric symmetrization selects the wrong summand. The imported modular projector also contains N-torsion averaging. Its product denominator is N^m2^{2m}(m!)². Localizing at 2N m! clears these geometric denominators, but it does not clear an independent Hecke congruence denominator.

The projected middle cohomology has Hodge piece Fil^{m+1}=S_{m+2}⊗Sym^m H¹_dR(A). The newform lattice uses the specified cohomological self-dual twist V_f(r). The CM differential is normalized by [α]*ω=αω and ⟨ω,η⟩=1. Rescaling ω by a rescales η by a⁻¹, so the component indexed by j changes by a^{2j−m}; period exponents must keep their signs.

For the selected BDP local comparison take a finite **unramified** F/Q_p and supplied smooth proper models over O_F. Conrad supplies the universal modular factor over Z[1/N]. The CM product is formed only after base change to a field defining A and verification of its own model. In the canonical conductor-c application one also checks p∤cNd_K. These assumptions specify the presentation used here; they do not assert that every possible Bloch–Kato containment theorem requires an unramified local field.

In the filtered Frobenius extension, Φ denotes the F-linear iterate Φ₀^[F:Q_p] of crystalline Frobenius. The extension class is **holomorphic lift minus Frobenius lift** modulo Fil⁰. Reversing this order changes the Abel–Jacobi sign. Neither semilinear fixed vectors alone nor a quotient with the opposite sign supplies the stated functional.

In CH, α is the unit root of X²−a_pX+p^{2r−1}. Positive p-conductor stabilization subtracts (p^{2r−2}/α) times the predecessor, whereas the bottom conductor uses two Euler operators. The inverse limit uses α^{-n}. CH’s u_c counts all units of O_c; Castella’s u_c counts units modulo ±1. A first-step adapter must account for this difference before comparing initial classes. The finite ring-class quotient Δ is kept separate from Γ≅Z_p and from a Δ-character projection.

The BDP measure identity is squared. CH’s big logarithm equals a **linear** square-root measure with its −c₀^{r−1} and σ_{−1,p} factors. Castella’s family reciprocity has its own normalization, with no inherited CH factor. The ramified logarithmic range, the unramified BDP boundary and the dual-exponential range are separate formulas; no Euler factor is transported between them without a comparison.

A characteristic-ideal divisibility is recorded with its direction: char(M) divides char(Selhat/Λκ₁), equivalently the latter ideal is contained in char(M). The plan does not assert equality. A nonzero class is also distinguished from a generator of the universal-norm module. The corrected growth slope is (1−ε)/2, and the root-sign parity residue uses the same expression.

## Ownership and imported mathematics

Reviewed RS-06 places the universal modular family, its relative realization and its higher-weight extension with ModularCurvesPartII:R14.3 and AbelianSchemesAndArithmeticModuli:A.3. GH.0 adds the fixed CM factor and cycle-specific coefficient adapter. Ordinary rational Chow groups and correspondence operations are requested from SchemeAndStackFoundations:SF.5. Geometric cohomology carriers are imported from their de Rham, étale and p-adic Hodge owners; a linear map parameter does not define a Chow group or a cohomology theory.

Howard’s self-dual DVR theory, hypotheses H0–H5 and auxiliary-group-valued system belong to EulerSystemsAndKolyvaginSystems:ES.5. Its Λ theorem belongs to ES.8. GH.5 verifies the higher-weight instance and supplies the corrected class. The CH bounded-error anticyclotomic descent needed by GH.6 is requested separately: LV big image and clean Howard hypotheses are not added silently to CH’s fixed-weight theorem. The source-qualified local verification and control obligations remain visible.

AutomorphicPadicLFunctions:L3h owns the single GL₂ BDP/CH square-root measure and family interpolation. GH.4 owns the generalized-cycle special value, including m=0. GrossZagierAndArithmeticHeights:GZ.9 imports the m=0 specialization and keeps its quaternionic and exceptional-zero branches. The restructuring proposal records L3h→GZ.9 and GH.4→GZ.9. The BDP construction does not require a modular-symbol measure; no such prerequisite is added here.

The preferred owner of the Yager module, unramified-tower exponential and ordinary two-variable regulator is **Padic Hodge regulators, Part II**, extending PadicHodgeRegulators:L3. Its current cyclotomic map does not itself provide these exports. GH.7 records consumer checkpoints rather than reconstructing the generic local theory. AutomorphicCongruences:L2 keeps its bounded fixed-weight Bloch–Kato logarithm application. Corrected self-dual family parity likewise requires a proposed Selmer cohomology Part II extending SelmerIwasawaCohomology:L4.

## Baseline and prototype limits

The checked baseline is Mathlib **082e2d37e8b0463410cdb532e111cd43d5a66174** and Tau Ceti **f790474821cf4256814db967cb154e7af3d0c369**. Their source statements were read before using them. The reviewed library audit finds the GH targets absent at those pins; it does not erase the algebraic, scheme-morphism and abelian-variety interfaces already present.

The suggested file uses the actual Tau Ceti abelian-variety and isogeny interfaces. Missing Chow, cohomology, filtration and distribution realizations are explicit module/map parameters supplied by their owners. It gives linear realizations and arithmetic formulas where expressible. Owner conditions and geometric identifications without an available type are omitted in the prototypes and retained in this document; an omitted hypothesis is not a claim about arbitrary maps or classes. In particular the partial conductor, isogeny-degree, local-condition, regulator and rank signatures must be completed with their definitive source hypotheses.

The full suggested file **was not elaborated**: the supplied build has no prebuilt Tau Ceti abelian-variety import. No library build was started. Its Mathlib commit equals the pin; its full Tau Ceti checkout is newer, although the eight-module abelian-variety isogeny import closure has identical source bytes at the pin. The extracted portion using only Mathlib, excluding the CM-curve and marked-isogeny nodes, elaborated with only placeholder-proof warnings. This partial check does not validate the omitted Tau Ceti declarations or the missing geometric hypotheses.

The baseline declarations used directly are:

- **tauceti:TauCeti.AlgebraicGeometry.AbelianVariety** (TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean): A proper geometrically integral group object over Spec K, for a field K; smoothness and the dimension interface are already available.
- **tauceti:TauCeti.AlgebraicGeometry.AbelianVariety.End** (TauCeti/AlgebraicGeometry/AbelianVariety/End/Basic.lean): Additive endomorphism ring of the existing abelian variety object, including toHom and integer multiplication.
- **tauceti:TauCeti.AlgebraicGeometry.AbelianVariety.mulBy** (TauCeti/AlgebraicGeometry/AbelianVariety/End/Basic.lean): mulBy A n is End.toHom of the integer n in End A; used by the scalar endomorphism compatibility test.
- **mathlib:LinearMap** (Mathlib/Algebra/Module/LinearMap/Defs.lean): The bundled semilinear map extends AddHom and MulActionHom; the identity-ring case supplies linear correspondence realizations.
- **mathlib:LinearMap.range** (Mathlib/Algebra/Module/Submodule/Range.lean): The image submodule of a linear map, with membership equivalent to existence of a preimage.
- **mathlib:Submodule.span** (Mathlib/LinearAlgebra/Span/Defs.lean): The infimum of submodules containing a supplied set; used for the coefficient eigenline and Selmer generation statements.
- **mathlib:AlgebraicGeometry.Smooth** (Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean): Smooth scheme morphisms, with composition and pullback stability already in the baseline.
- **mathlib:AlgebraicGeometry.IsProper** (Mathlib/AlgebraicGeometry/Morphisms/Proper.lean): Proper scheme morphisms, defined by separatedness, universal closedness and local finite type; composition and pullback stability are already available.
- **tauceti:TauCeti.AlgebraicGeometry.AbelianVariety.IsIsogeny** (TauCeti/AlgebraicGeometry/AbelianVariety/Isogeny.lean): The existing isogeny predicate is finiteness and surjectivity of the underlying scheme homomorphism; identities, composition and base change are already available.

## Stage map

| Stage | Nodes | Planets | Status |
|---|---:|---:|---|
| GeneralizedHeegnerCycles:GH.0 | 9 | 4 | planned |
| GeneralizedHeegnerCycles:GH.1 | 15 | 6 | planned |
| GeneralizedHeegnerCycles:GH.2 | 5 | 4 | planned |
| GeneralizedHeegnerCycles:GH.3 | 6 | 4 | planned |
| GeneralizedHeegnerCycles:GH.4 | 6 | 4 | planned |
| GeneralizedHeegnerCycles:GH.5 | 6 | 3 | planned |
| GeneralizedHeegnerCycles:GH.6 | 7 | 6 | planned |
| GeneralizedHeegnerCycles:GH.7 | 12 | 5 | planned |

## GH.0. Kuga–Sato geometry and coefficient projectors

Start with the imported universal modular family, then add the fixed CM factor and its character projector. The product is formed over a common field of definition. Cohomological concentration, duality and the newform/CM summand determine the coefficient representation; a good product model requires a good CM model as separate data.

Coverage: **planned**. Remaining proof closure: Higher-weight universal-family export; Product realizations and CM good model.

Atlas planets: Generalized Kuga–Sato variety; Projected middle cohomology; Projected Hodge filtration; Coefficient projector.

### GH.0.1. The CM elliptic curve A and the algebraic splitting of H¹_dR(A)

**Definition — TauCeti.GeneralizedHeegner.CMCurve.**

Node: `GeneralizedHeegnerCycles:GH.0/cm-elliptic-curve-and-its-hodge-splitting`.

A CM elliptic curve is an elliptic abelian variety A/H, with H containing the Hilbert class field of the imaginary quadratic K, and a specified isomorphism O_K ≅ End_H(A), normalized so [α]*ω=αω. For F⊇H, H¹_dR(A/F)=Fω⊕Fη, where η lies on the conjugate CM eigenline and ⟨ω,η⟩=1. At an ordinary good split prime this conjugate eigenline is the unit-root line. No good model is inferred from the level N.

Hypotheses and conventions:

- The normalization of the O_K-action is on differentials: [α]^*ω = αω. The opposite normalization swaps H^{1,0} and H^{0,1}.
- Existence of A over H with End_H(A) = O_K, and its descent, are HeegnerPointEulerSystems HE.1's and ComplexMultiplicationAndExplicitReciprocity CM.1's.

Construction or proof:

1. O_K acts on H¹_dR(A/F) through the two characters α and ᾱ, which are distinct since K is imaginary quadratic. The two eigenlines split the space, and the α-eigenline is Ω¹, because [α]^* acts on differentials by α.
2. Functoriality: morphisms commuting with O_K preserve the eigenlines.
3. Over ℂ, H^{0,1} = conj(Ω¹) is the ᾱ-eigenline, and over ℂ_p for ordinary A the unit-root line is O_K-stable and different from Ω¹.

Uses of this interface:

- **GeneralizedHeegnerCycles:GH.0/cm-character-decomposition**: Fixes the normalized eigenbasis and prevents a free choice of complementary line.
- **GeneralizedHeegnerCycles:GH.4/bdp-special-value-formula**: Tracks the power of a when the CM differential is rescaled.

Planning API:

- **TauCeti.GeneralizedHeegner.CMCurve.h10** (characterisation): The identity-character eigenvector ω lies in ker([α]*−α).
- **TauCeti.GeneralizedHeegner.CMCurve.h01** (characterisation): The conjugate-character eigenvector η lies in ker([α]*−ᾱ).
- **TauCeti.GeneralizedHeegner.CMCurve.hodgeSplitting** (equivalence): The two distinct CM eigenlines span the cohomology space and have zero intersection.
- **TauCeti.GeneralizedHeegner.CMCurve.etaOfOmega** (characterisation): Normalize a nonzero conjugate eigenvector η by dividing by ⟨ω,η⟩, giving cup product 1; the one-dimensional eigenline gives uniqueness.

Unit tests:

- **TauCeti.GeneralizedHeegner.cmCurve_i_action** (computation): For the ordered CM eigenbasis at K=Q(i), [i]* acts diagonally by i and −i.
- **TauCeti.GeneralizedHeegner.cmCurve_normalization** (characterisation): Scaling ω by a≠0 scales its normalized η by a⁻¹, preserving the cup product 1.
- **TauCeti.GeneralizedHeegner.cmCurve_scalar_endomorphism** (compatibility): Integer multiplication on the CM curve agrees with the existing abelian variety mulBy map.

Acceptance checks:

- A = ℂ/O_K for K = ℚ(i): [i]^* dz = i dz on Ω¹, and [i]^* dz̄ = −i dz̄ on H^{0,1}.

Direct prerequisites:

- `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety`
- `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety.End`
- `HeegnerPointEulerSystems:HE.1/canonical-model-cm-descent`
- `ComplexMultiplicationAndExplicitReciprocity:CM.1`
- `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety.mulBy`
- `mathlib:Submodule.span`

Source passages:

- [Generalized Heegner cycles and p-adic Rankin L-series](https://www.math.mcgill.ca/darmon/pub/Articles/Research/51.BDP1/duke-publishedversion.pdf), §1.4, p. 1051. A over H with End_H(A) ≅ O_K.
- [Generalized Heegner cycles and p-adic Rankin L-series](https://www.math.mcgill.ca/darmon/pub/Articles/Research/51.BDP1/duke-publishedversion.pdf), §1.4, (1.4.1), p. 1051. The algebraic splitting of H¹_dR(A/F).
- [Generalized Heegner cycles and p-adic Rankin L-series](https://www.math.mcgill.ca/darmon/pub/Articles/Research/51.BDP1/duke-publishedversion.pdf), §1.4, (1.4.2), p. 1052. ⟨ω_A, η_A⟩ = 1.

### GH.0.2. The projector ε_A on A^r and Lemma 1.8

**Construction — TauCeti.GeneralizedHeegner.epsA.**

Node: `GeneralizedHeegnerCycles:GH.0/cm-projector-and-symmetric-power`.

For m≥0 let Ξ_m=μ₂^m⋊S_m act on A^m by inversion and permutation, and χ_m be the product of the inversion signs and the permutation sign. Define ε_A=(2^m m!)⁻¹Σ_g χ_m(g)Γ_g as a rational correspondence. Its realization is idempotent and projects H^j(A^m) to Sym^m H¹(A) in degree m and to zero otherwise. The permutation sign cancels the graded Künneth sign; it must not be replaced by unsigned geometric symmetrization.

Hypotheses and conventions:

- The denominator 2^r r! must be inverted. ε_A is not in ℤ[Aut(A^r)], so an integral projector needs 2 and r! invertible.
- The sign twist on S_r is essential. By the Koszul rule, geometric permutations act on H¹^{⊗r} with the sign, so the twisted sum is the symmetrization. Without the twist the sum projects to ∧^r H¹, which vanishes for r ≥ 3.
- Only μ_2 ⊂ O_K^× is used. For K = ℚ(i) or ℚ(√−3) the larger unit group gives further characters, which the node cm-character-decomposition records.

Construction or proof:

1. Idempotence: j is a character of Ξ_r, so ε_A = (1/|Ξ_r|) Σ j(ξ)ξ is the idempotent of the character j in ℚ[Ξ_r].
2. Künneth: H^*(A^r) = ⊕ H^{i_1} ⊗ … ⊗ H^{i_r}, and [−1] acts on H^i by (−1)^i. So the μ_2^r-part of ε_A kills every summand with some i_k ≠ 1, leaving H¹^{⊗r}.
3. On H¹^{⊗r}, the geometric action of σ ∈ S_r is sgn(σ) times the permutation of tensor factors (odd classes anticommute). The j-twisted average is therefore the symmetrizer, with image Sym^r H¹.
4. Correspondences: ε_A is an element of the ring of correspondences on A^r with ℚ-coefficients, acting on every cohomology theory by functoriality (MotivicEtaleKTheory M.4).

Uses of this interface:

- **GeneralizedHeegnerCycles:GH.0/cohomology-of-the-generalized-kuga-sato-variety**: Eliminates all CM-factor cohomology except middle symmetric power.
- **GeneralizedHeegnerCycles:GH.1/generalized-heegner-cycle**: Projects products of isogeny graphs without changing the intended symmetric tensor.

Planning API:

- **TauCeti.GeneralizedHeegner.epsA_idem** (relation): ε_A²=ε_A for the graph action of Ξ_m.
- **TauCeti.GeneralizedHeegner.epsA_image** (characterisation): Its range is the χ_m-isotypic subspace of the tensor realization.
- **TauCeti.GeneralizedHeegner.epsA_transpose** (compatibility): The inverse-graph involution fixes ε_A.

Unit tests:

- **TauCeti.GeneralizedHeegner.epsA_order** (computation): For m=2 the character average has denominator 8.
- **TauCeti.GeneralizedHeegner.epsA_weight_zero** (degenerate): At m=0 the projector acts as the identity on H⁰(A⁰)=F.
- **TauCeti.GeneralizedHeegner.epsA_koszul** (non-example): A transposition acts with −1 on H¹⊗H¹; multiplying by its character sign therefore selects symmetric tensors.

Acceptance checks:

- r = 2: ε_A H²(A²) = Sym² H¹(A), of dimension 3, while H²(A²) has dimension 6.

Direct prerequisites:

- `GeneralizedHeegnerCycles:GH.0/cm-elliptic-curve-and-its-hodge-splitting`
- `SchemeAndStackFoundations:SF.5`
- `mathlib:LinearMap`
- `mathlib:LinearMap.range`

Source passages:

- [Generalized Heegner cycles and p-adic Rankin L-series](https://www.math.mcgill.ca/darmon/pub/Articles/Research/51.BDP1/duke-publishedversion.pdf), §1.4, (1.4.4), p. 1052. ε_A = (1/2^r r!) Σ j(ξ)ξ.
- [Generalized Heegner cycles and p-adic Rankin L-series](https://www.math.mcgill.ca/darmon/pub/Articles/Research/51.BDP1/duke-publishedversion.pdf), §1.4, Lemma 1.8, p. 1052. ε_A H^*(A^r) = Sym^r H¹(A), in degree r.
- [Generalized Heegner cycles and p-adic Rankin L-series](https://www.math.mcgill.ca/darmon/pub/Articles/Research/51.BDP1/duke-publishedversion.pdf), §1.4, p. 1052. Sym^r as the S_r-fixed tensors.

### GH.0.3. The eigenbasis ω_A^jη_A^{r−j} of Sym^r H¹_dR(A) and its O_K-characters

**Theorem — TauCeti.GeneralizedHeegner.cmCharacterDecomposition.**

Node: `GeneralizedHeegnerCycles:GH.0/cm-character-decomposition`.

For 0 ≤ j ≤ r, the classes ω_A^jη_A^{r−j} := ε_A(p_1^*ω_A ∧ … ∧ p_j^*ω_A ∧ p_{j+1}^*η_A ∧ … ∧ p_r^*η_A) form a basis of ε_A H^r_dR(A^r/F) = Sym^r H¹_dR(A/F). The diagonal action of α ∈ O_K on A^r acts on ω_A^jη_A^{r−j} by α^jᾱ^{r−j}. Moreover ω_A^jη_A^{r−j} = (j!(r − j)!/r!) Σ_{|I| = j} p_1^*ϖ_{1,I} ∧ … ∧ p_r^*ϖ_{r,I}, where ϖ_{i,I} = ω_A for i ∈ I and η_A otherwise.

Hypotheses and conventions:

- The Hodge type of ω^jη^{r−j} is (j, r − j), and Fil^r Sym^r H¹ is spanned by ω^r.
- Rescaling ω_A by λ multiplies ω^jη^{r−j} by λ^{2j−r}, because η_A scales by λ⁻¹. Formulas of GH.4 depend on this normalization.

Construction or proof:

1. ε_A applied to a pure tensor of ω's and η's averages over S_r, with the sign twist compensating the Koszul sign. Each subset I with |I| = j arises from j!(r − j)! permutations.
2. The (r + 1) classes are linearly independent, since they have distinct bidegrees (j, r − j) for the O_K-action (for α ∉ ℤ, the characters α^jᾱ^{r−j} are distinct), and dim Sym^r H¹ = r + 1.
3. The O_K-action on p_i^*ω is by α and on p_i^*η by ᾱ (node cm-elliptic-curve-and-its-hodge-splitting).

Acceptance checks:

- r = 2: the basis is ω², ωη, η², with characters α², |α|², ᾱ².

Direct prerequisites:

- `GeneralizedHeegnerCycles:GH.0/cm-projector-and-symmetric-power`

Source passages:

- [Generalized Heegner cycles and p-adic Rankin L-series](https://www.math.mcgill.ca/darmon/pub/Articles/Research/51.BDP1/duke-publishedversion.pdf), §1.4, (1.4.6), p. 1053. ω^jη^{r−j} form a basis of Sym^r H¹_dR(A).

### GH.0.4. The variety X_r = W_r × A^r and the projector ε_X = ε_W ε_A

**Construction — TauCeti.GeneralizedHeegner.epsX.**

Node: `GeneralizedHeegnerCycles:GH.0/generalized-kuga-sato-variety-and-its-projector`.

Over F⊇H form X_m=W_m×_F A^m, dim X_m=2m+1, and ε_X=ε_W ε_A using commuting factor correspondences. ε_W is the imported universal-family projector, including the N-torsion averaging and sign projector. ε_X is self-transpose and is defined over Z[1/(2N m!)] at the level of denominators; this does not assert that X_m itself has a model over Z[1/N].

Hypotheses and conventions:

- The denominators are those of ε_W^{(1)} (N^r), ε_W^{(2)} (2^r r!) and ε_A (2^r r!), so ε_X is integral after 2N·r! is inverted. The atlas asks for this record before an integral projector is asserted.
- Characteristic 0 only: the desingularization and smoothness of W_r are used over F ⊇ H of characteristic 0, as imported. The integral model over ℤ[1/N] (Conrad's appendix) is not used here.
- N > 4 makes the universal generalized elliptic curve over X₁(N) exist as a scheme.

Construction or proof:

1. X_r is a product of smooth proper F-varieties, so it is smooth and proper of dimension (r + 1) + r.
2. π_r = (W_r → C) ∘ pr_1, whose fibres are those of W_r times A^r.
3. ε_W acts on the first factor and ε_A on the second, so they commute, and both preserve the fibres of π_r.
4. Transpose: the transpose of Σ c_g·g is Σ c_g·g⁻¹, and the coefficient functions of ε_W^{(1)}, ε_W^{(2)} and ε_A are invariant under g ↦ g⁻¹ (j(ξ⁻¹) = j(ξ)), so ε_X^t = ε_X.

Uses of this interface:

- **GeneralizedHeegnerCycles:GH.1/generalized-heegner-cycle**: Defines the ambient projected Chow group.
- **GeneralizedHeegnerCycles:GH.0/self-duality-of-the-projected-cohomology**: Self-transposition passes Poincaré duality to the image.

Planning API:

- **TauCeti.GeneralizedHeegner.epsX_commute** (relation): The two factor correspondences commute.
- **TauCeti.GeneralizedHeegner.epsX_idem** (relation): The commuting product of the two idempotents is idempotent.
- **TauCeti.GeneralizedHeegner.epsX_factor** (simp): ε_X acts by applying ε_A and then ε_W.
- **TauCeti.GeneralizedHeegner.epsX_denominator** (data): The product-projector denominator is N^m2^{2m}(m!)²; inverting 2N m! clears it.

Unit tests:

- **TauCeti.GeneralizedHeegner.X_dim** (computation): At m=2, X has dimension 5 and the graph cycle has codimension 3.
- **TauCeti.GeneralizedHeegner.epsX_weight_zero** (degenerate): With the CM factor trivial, ε_X=ε_W.
- **TauCeti.GeneralizedHeegner.epsX_factor_test** (compatibility): On a supplied tensor-factor realization the action is the composite, in the displayed order.

Acceptance checks:

- r = 0: X_0 = W_0 = C, and ε_X = 1.
- r = 1: X_1 = E × A, of dimension 3, a threefold fibred over X₁(N).

Direct prerequisites:

- `ModularCurvesPartII:R14.3`
- `GeneralizedHeegnerCycles:GH.0/cm-projector-and-symmetric-power`
- `SchemeAndStackFoundations:SF.5`

Source passages:

- [Generalized Heegner cycles and p-adic Rankin L-series](https://www.math.mcgill.ca/darmon/pub/Articles/Research/51.BDP1/duke-publishedversion.pdf), §2.2, p. 1060. X_r = W_r × A^r, fibred over C.
- [Generalized Heegner cycles and p-adic Rankin L-series](https://www.math.mcgill.ca/darmon/pub/Articles/Research/51.BDP1/duke-publishedversion.pdf), §2.2, (2.2.1), p. 1061. ε_X = ε_W ε_A with commuting factors.
- [Generalized Heegner cycles and p-adic Rankin L-series](https://www.math.mcgill.ca/darmon/pub/Articles/Research/51.BDP1/duke-publishedversion.pdf), §2.1, (2.1.2), p. 1057. The projector ε_W.

### GH.0.5. Projected middle cohomology

**Theorem — TauCeti.GeneralizedHeegner.epsX_middle.**

Node: `GeneralizedHeegnerCycles:GH.0/cohomology-of-the-generalized-kuga-sato-variety`.

For m≥1, ε_X H*_dR(X_m)=ε_X H^{2m+1}_dR(X_m)=H¹_par(C,L_m,∇)⊗Sym^m H¹_dR(A). In the p-adic étale realization, ε_X H^{2m+1}_et(X_m,Fbar,Q_p)≅H¹_par(C_Fbar,𝕃_m)⊗Sym^m H¹_et(A_Fbar,Q_p), Galois-equivariantly. The projector kills every other cohomological degree. In particular ε_X H^{2m+2}(X_m)=0. The Hodge-filtration identification is the separate projected-hodge-filtration theorem.

Hypotheses and conventions:

- The imported Scholl realization has ε_W H*(W_m)=H¹_par(C,L_m) in degree m+1. Both product realizations and their correspondence-compatible Künneth isomorphisms are supplied.
- The degree-2m+2 vanishing is the input for GH.1 null-homology; the m=0 divisor uses its degree-zero correction.

Construction or proof:

1. Apply the supplied de Rham Künneth decomposition for W_m×A^m, respecting both factor projectors.
2. The CM projector kills degrees other than m; the modular projector kills degrees other than m+1. Their surviving tensor summand is therefore in degree 2m+1.
3. Use the rational p-adic étale Künneth export and the same graph actions to obtain the Galois-equivariant identification.

Acceptance checks:

- For m=1 the projected H³ of the universal elliptic surface times A is H¹_par(C,L₁)⊗H¹(A), of dimension 4 dim S₃(Γ₁(N)).

Direct prerequisites:

- `ModularCurvesPartII:R14.3`
- `GeneralizedHeegnerCycles:GH.0/generalized-kuga-sato-variety-and-its-projector`
- `EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality`
- `DerivedDeRhamCohomology:DD.2`
- `EtaleDualityAndPerverseSheaves:EDC.6`

Source passages:

- [Generalized Heegner cycles and p-adic Rankin L-series](https://www.math.mcgill.ca/darmon/pub/Articles/Research/51.BDP1/duke-publishedversion.pdf), §2.2, Proposition 2.4, p. 1061. ε_X H^*_dR(X_r) = H¹_par(C, L_r, ∇) ⊗ Sym^r H¹_dR(A).
- [Generalized Heegner cycles and p-adic Rankin L-series](https://www.math.mcgill.ca/darmon/pub/Articles/Research/51.BDP1/duke-publishedversion.pdf), §2.2, proof of Proposition 2.4, p. 1062. Proof via Künneth.

### GH.0.6. Projected Hodge filtration

**Theorem — TauCeti.GeneralizedHeegner.projectedHodgeFiltration.**

Node: `GeneralizedHeegnerCycles:GH.0/projected-hodge-filtration`.

For m≥1 and X_m/F with its supplied de Rham realization, f⊗α↦ω_f∧α identifies S_{m+2}(Γ₁(N),F)⊗Sym^m H¹_dR(A/F) with Fil^{m+1}(ε_X H^{2m+1}_dR(X_m/F)). The entire symmetric CM factor occurs, not only its holomorphic line. This is the filtration piece used as the domain of the p-adic Abel–Jacobi dual functional.

Hypotheses and conventions:

- The modular projected factor has Hodge types (m+1,0) and (0,m+1), with Fil¹=Fil^{m+1}=S_{m+2}; the CM symmetric factor has Hodge filtration in degrees 0 through m.
- Use the field of definition and filtered de Rham product export of the preceding realization theorem.

Construction or proof:

1. Import the modular Hodge identification from R14.3 and the filtered Künneth theorem from DD.2.
2. The holomorphic modular summand of filtration m+1 tensored with Fil⁰ of the CM factor contributes the stated whole tensor. The antiholomorphic modular summand has filtration zero, while the CM factor has filtration at most m, so it contributes nothing to Fil^{m+1}.
3. Identify the surviving tensor by the wedge map, preserving the specified differential normalization.

Acceptance checks:

- At m=1 the filtration has dimension 2 dim S₃, and contains both ω_f⊗ω_A and ω_f⊗η_A; retaining only ω_A gives half the required space.

Direct prerequisites:

- `GeneralizedHeegnerCycles:GH.0/cohomology-of-the-generalized-kuga-sato-variety`
- `ModularCurvesPartII:R14.3`
- `DerivedDeRhamCohomology:DD.2`

Source passages:

- [Generalized Heegner cycles and p-adic Rankin L-series](https://www.math.mcgill.ca/darmon/pub/Articles/Research/51.BDP1/duke-publishedversion.pdf), §2.2, Proposition 2.5, p. 1062. The wedge map identifies the cusp-form tensor with Fil^{m+1} of the projected middle cohomology.

### GH.0.7. Self-duality of ε_X H^{2r+1}(X_r)(r + 1)

**Theorem — TauCeti.GeneralizedHeegner.projectedSelfDuality.**

Node: `GeneralizedHeegnerCycles:GH.0/self-duality-of-the-projected-cohomology`.

Poincaré duality on the smooth proper (2r + 1)-dimensional X_r restricts to a perfect pairing ε_X H^{2r+1}(X_r) × ε_X H^{2r+1}(X_r) → H^{4r+2}(X_r) ≅ ℚ_p(−2r − 1) in étale cohomology (and into F in de Rham). So V := ε_X H^{2r+1}_et(X_{r,F̄}, ℚ_p)(r + 1) is self-dual up to ℚ_p(1): V ≅ V^∨(1). The pairing is the one induced by (2.2.3) on L_{r,r} = L_r ⊗ Sym^r H¹(A). V is the coefficient representation of the generalized Heegner classes, and its f-isotypic part is V_f ⊗ Sym^r H¹(A)(r + 1).

Hypotheses and conventions:

- ε_X^t = ε_X (node generalized-kuga-sato-variety-and-its-projector) is what makes the pairing restrict to the image.
- The twist (r + 1) is the self-dual twist of a weight 2r + 1 representation: V is pure of weight −1 at good primes.
- The f-isotypic identification uses the Hecke action on H¹_par(C, 𝕃_r) and the newform f's Galois representation V_f, imported from ModularCurvesPartII R14.3.

Construction or proof:

1. Poincaré duality on X_r pairs H^{2r+1} with itself into H^{4r+2} = ℚ_p(−2r − 1) (EtaleDualityAndPerverseSheaves EDC.2).
2. For correspondences, ⟨εx, y⟩ = ⟨x, ε^t y⟩, and ε_X^t = ε_X. So ε_X H^{2r+1} is orthogonal to (1 − ε_X)H^{2r+1}, and the pairing restricts to a perfect pairing on ε_X H^{2r+1}.
3. Twisting by (r + 1) turns the target ℚ_p(−2r − 1) into ℚ_p(1).
4. Under node cohomology-of-the-generalized-kuga-sato-variety, the pairing is the tensor product of the pairing on H¹_par(C, L_r) and the one on Sym^r H¹(A), which is (2.2.3).

Acceptance checks:

- r = 0: V = H¹_par(C)(1) = V_p J₁(N), which is self-dual through the Weil pairing.

Direct prerequisites:

- `GeneralizedHeegnerCycles:GH.0/cohomology-of-the-generalized-kuga-sato-variety`
- `EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality`

Source passages:

- [Generalized Heegner cycles and p-adic Rankin L-series](https://www.math.mcgill.ca/darmon/pub/Articles/Research/51.BDP1/duke-publishedversion.pdf), §2.2, (2.2.3), p. 1061. The self-duality of L_{r,r} from Poincaré duality on the fibres.
- [Generalized Heegner cycles and p-adic Rankin L-series](https://www.math.mcgill.ca/darmon/pub/Articles/Research/51.BDP1/duke-publishedversion.pdf), §2.3, Proposition 2.7, p. 1063. Homological triviality from ε_X H^{2r+2} = 0.

### GH.0.8. Newform and CM coefficient projector

**Construction — TauCeti.GeneralizedHeegner.coefficientProjector.**

Node: `GeneralizedHeegnerCycles:GH.0/newform-cm-projector`.

For a normalized eigenform f of weight k=m+2, take the imported f-isotypic Hecke summand of ε_W cohomology and tensor the specified CM character line in Sym^m H¹(A). Extend the coefficient field enough to split both actions. Choose an integral stable lattice only after accounting for the denominators of ε_W, ε_A and the Hecke idempotent; p∤2N m! alone does not make the Hecke idempotent integral. The Tate twist is the cohomological self-dual one, V_f(r) when k=2r.

Hypotheses and conventions:

- N>4 for the chosen fine Γ₁ model; k≥2; supplied Hecke eigensystem and CM realization

Construction or proof:

1. Import the Hecke action and f projector from R14.3.
2. Apply the explicit CM character decomposition, record localization denominators, and use Poincaré duality for the twist.

Uses of this interface:

- **GeneralizedHeegnerCycles:GH.1/integral-abel-jacobi-comparison**: Fixes the coefficient lattice and denominator assumptions before integral descent.

Planning API:

- **TauCeti.GeneralizedHeegner.coefficientProjector_factor** (simp): The modular and CM projections compose.
- **TauCeti.GeneralizedHeegner.coefficientProjector_twist** (compatibility): For r≥1, the fiber-power index 2r−2 gives weight 2r and the self-dual modular twist V_f(r).
- **TauCeti.GeneralizedHeegner.coefficientProjector_lattice** (data): A recorded integral lattice is preserved by the composite only after both factor projectors preserve that lattice.

Unit tests:

- **TauCeti.GeneralizedHeegner.coefficientProjector_identity** (degenerate): Trivial CM character with its identity projector leaves the f summand.
- **TauCeti.GeneralizedHeegner.coefficientProjector_order** (compatibility): On commuting projectors the order of projection does not matter.
- **TauCeti.GeneralizedHeegner.coefficientProjector_denominator** (non-example): A rational idempotent with 1/2 entries need not preserve an integral lattice: the average of (1,0) and (0,1) is (1/2,1/2).

Acceptance checks:

- A congruence prime for f can divide the Hecke denominator even if p avoids 2N m!.

Direct prerequisites:

- `ModularCurvesPartII:R14.3`
- `GeneralizedHeegnerCycles:GH.0/cm-character-decomposition`
- `GeneralizedHeegnerCycles:GH.0/self-duality-of-the-projected-cohomology`

Source passages:

- [Heegner cycles and p-adic L-functions](https://www.math.ntu.edu.tw/~mlhsieh/research/HCES.pdf), §4.2, pp.14–15. Names the lattice and the self-dual Vf(r) representation.

### GH.0.9. Good model comparison for the CM product

**Comparison — TauCeti.GeneralizedHeegner.cmProductGoodModel.**

Node: `GeneralizedHeegnerCycles:GH.0/cm-product-good-model`.

If W_m and A have smooth proper models over O_F, their product has a smooth proper model over O_F. For BDP §3 take F/Q_p finite unramified, p∤N, and a chosen good CM model; in their canonical conductor-c application also p∤c d_K. An arbitrary CM twist is not made good by p∤N. The model of W_m over Z[1/N] supplied by Conrad belongs to R14.3; it is not a global model of X_m.

Hypotheses and conventions:

- Both factors have supplied models; F is the local field of the chosen comparison.
- Smooth/proper product stability is already in Mathlib; this node exports the chosen arithmetic models and local comparison data to the cycle construction, rather than re-planning that stability theorem.

Construction or proof:

1. Base change the universal-family model.
2. Use stability of smoothness and properness under products and the independently supplied model of A.

Acceptance checks:

- At p=5 the CM curve y²=x³−25x has bad reduction although 5∤7; the level criterion cannot apply to its CM factor.
- Positive product-model test: at p=5 the CM curve y²=x³−x has discriminant 64, a unit in Z₅. With the supplied smooth proper W_m model for level 13, the product after a common finite unramified base change is smooth proper. Smoothness and properness must be checked on both supplied factors.

Direct prerequisites:

- `ModularCurvesPartII:R14.3`
- `GeneralizedHeegnerCycles:GH.0/generalized-kuga-sato-variety-and-its-projector`
- `SchemeAndStackFoundations:SF.2`
- `mathlib:AlgebraicGeometry.Smooth`
- `mathlib:AlgebraicGeometry.IsProper`

Source passages:

- [Generalized Heegner cycles and p-adic Rankin L-series](https://www.math.mcgill.ca/darmon/pub/Articles/Research/51.BDP1/duke-publishedversion.pdf), §3.2, p.1066; appendix introduction, p.1139. The finite unramified local comparison requires the smooth models.

## GH.1. Algebraic cycles and Abel–Jacobi realizations

Marked CM isogenies give graph cycles. Their field of definition and null-homology precede the étale extension, its integral descent and its p-adic functional. The Coleman calculation supplies the evaluation used by explicit reciprocity. Syntomic and classical-cycle comparisons have distinct supplier contracts.

Coverage: **planned**. Remaining proof closure: Higher-weight universal-family export; Integral descent and CM character coefficient adapter; Geometric syntomic regulator comparison; Classical-cycle source comparison; Wide-open residue and Coleman comparison export.

Atlas planets: Generalized Heegner cycle; Étale Abel–Jacobi map; p-adic Abel–Jacobi map; Character-projected Heegner class; Coleman primitive; Coleman Abel–Jacobi formula.

### GH.1.1. The sets Isog_c^N(A) of CM isogenies of conductor c with kernel prime to A[N]

**Definition — TauCeti.GeneralizedHeegner.IsogPair.**

Node: `GeneralizedHeegnerCycles:GH.1/isogenies-of-conductor-c-prime-to-n`.

Assume the Heegner hypothesis: there is an ideal 𝔑 ⊂ O_K with O_K/𝔑 ≅ ℤ/Nℤ. Fix A with End(A) = O_K and a Γ₁(N)-level structure t_A ∈ A[𝔑] over the field H̃ ⊇ H over which A[𝔑] becomes constant. Isog(A) is the set of isomorphism classes of pairs (φ, A′) with φ : A → A′ an isogeny over K̄. (φ, A′) has conductor c if End(A′) = O_c = ℤ + cO_K. Isog^N(A) consists of the pairs with ker φ ∩ A[N] = 0, and Isog_c^N(A) = Isog_c(A) ∩ Isog^N(A). For (φ, A′) ∈ Isog^N(A), (A′, φ(t_A)) is a Γ₁(N)-structure and determines a point P_{A′} of C = X₁(N). The semigroup P(O_c) of invertible O_c-ideals prime to cN acts on Isog_c^N(A) by 𝔞 ⋆ (φ, A′) = (φ_𝔞φ, A′/A′[𝔞]).

Hypotheses and conventions:

- The kernel condition ker φ ∩ A[N] = 0 makes φ(t_A) a point of exact order N.
- The conductor c is determined by End(A′), an order of K.

Construction or proof:

1. The endomorphism ring of an isogenous curve is an order of K, hence O_c for a unique c ≥ 1.
2. φ is injective on A[N] and t_A has order N, so φ(t_A) has order N.
3. The action: 𝔞 prime to cN gives φ_𝔞 : A′ → A′/A′[𝔞], with kernel prime to N, and conductor c is preserved (the descent and CM facts are HeegnerPointEulerSystems HE.1's).

Uses of this interface:

- **GeneralizedHeegnerCycles:GH.1/generalized-heegner-cycle**: Specifies the graph in the fiber over the transported CM pair.
- **GeneralizedHeegnerCycles:GH.2/cycle-norm-relations**: Conductor-changing ideal isogenies index Hecke neighbors.

Planning API:

- **TauCeti.GeneralizedHeegner.IsogPair.conductor** (data): The target endomorphism order is O_c; the conductor is preserved under isomorphism of marked targets.
- **TauCeti.GeneralizedHeegner.IsogPair.level** (projection): The prime-to-N kernel condition transports a point of exact order N to one of exact order N.
- **TauCeti.GeneralizedHeegner.IsogPair.idealAction** (functoriality): The ideal-action transports the isogeny pair through the commutative CM reciprocity square.

Unit tests:

- **TauCeti.GeneralizedHeegner.isog_identity_conductor** (degenerate): The identity isogeny of A has target order O_K, conductor 1.
- **TauCeti.GeneralizedHeegner.isog_level_failure** (non-example): Multiplication by N kills an N-torsion level point and cannot satisfy the prime-to-N condition.
- **TauCeti.GeneralizedHeegner.isog_degree_multiplicativity** (compatibility): Composing finite isogenies multiplies their degree, in agreement with the elliptic-curve isogeny degree API supplied upstream.

Acceptance checks:

- K = ℚ(i), N = 5 = (2 + i)(2 − i): 𝔑 = (2 + i), with O_K/𝔑 ≅ ℤ/5ℤ.
- For A = ℂ/O_K, z ↦ cz defines an isogeny ℂ/O_K → ℂ/O_c with cyclic kernel c⁻¹O_c/O_K ≅ ℤ/cℤ, and End(ℂ/O_c) = O_c: a pair of conductor c.

Direct prerequisites:

- `HeegnerPointEulerSystems:HE.1/canonical-model-cm-descent`
- `HeegnerPointEulerSystems:HE.0/ring-class-tower-quotients`
- `ComplexMultiplicationAndExplicitReciprocity:CM.1`
- `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety.IsIsogeny`

Source passages:

- [Generalized Heegner cycles and p-adic Rankin L-series](https://www.math.mcgill.ca/darmon/pub/Articles/Research/51.BDP1/duke-publishedversion.pdf), §1.4, Assumption 1.9, p. 1053. The Heegner hypothesis.
- [Generalized Heegner cycles and p-adic Rankin L-series](https://www.math.mcgill.ca/darmon/pub/Articles/Research/51.BDP1/duke-publishedversion.pdf), §1.4, p. 1053. Conductor of a pair (φ, A′).
- [Generalized Heegner cycles and p-adic Rankin L-series](https://www.math.mcgill.ca/darmon/pub/Articles/Research/51.BDP1/duke-publishedversion.pdf), §1.4, p. 1054. Isog^N(A): kernel meets A[N] trivially.

### GH.1.2. The generalized Heegner cycle Δ_φ = ε_X Υ_φ

**Construction — TauCeti.GeneralizedHeegner.gHC.**

Node: `GeneralizedHeegnerCycles:GH.1/generalized-heegner-cycle`.

For (φ, A′) ∈ Isog^N(A), the pair (A′, φ(t_A)) gives an embedding ι_{A′} : (A′)^m → W_m onto the fibre of W_m over P_{A′}. Let Υ_φ be the image of Graph(φ)^m ⊂ (A × A′)^m ≅ (A′)^m × A^m in X_m = W_m × A^m under ι_{A′} × id. It is a codimension-(m + 1) cycle. The generalized Heegner cycle is Δ_φ := ε_X Υ_φ ∈ CH^{m+1}(X_m)_ℚ, supported on the fibre π_m^{−1}(P_{A′}) ≅ (A′)^m × A^m. For m = 0, Δ_φ is the CM point P_{A′} of C, and it is replaced by P_{A′} − ∞ for a cusp ∞.

Hypotheses and conventions:

- ε_X has denominators 2N·m! (GH.0), so Δ_φ is a class with ℚ-coefficients. It becomes integral after multiplying by (2N·m!)^2, which an integral theory must track.
- Graph(φ)^m has dimension m in the 2r-dimensional fibre, so it has codimension m + 1 in X_m (dimension 2r + 1).

Construction or proof:

1. ι_{A′} identifies (A′)^m with the fibre of the fibre-power E^m over P_{A′}, which lies in the smooth locus of W_m since P_{A′} is not a cusp.
2. Graph(φ) ⊂ A × A′ is a curve. Its m-th power is an m-dimensional subvariety of (A × A′)^m, reordered as (A′)^m × A^m.
3. Apply the correspondence ε_X (GH.0) on Chow groups with ℚ-coefficients (MotivicEtaleKTheory M.4). ε_X preserves the fibres of π_m, so the support stays in π_m^{−1}(P_{A′}).

Uses of this interface:

- **GeneralizedHeegnerCycles:GH.1/etale-abel-jacobi-map**: Provides the null-homologous Chow input to the Gysin extension.
- **GeneralizedHeegnerCycles:GH.4/bdp-special-value-formula**: Provides the isogeny-indexed cycle whose Abel–Jacobi image occurs in the formula.

Planning API:

- **TauCeti.GeneralizedHeegner.gHC_codim** (data): The m-dimensional graph product in X_m of dimension 2m+1 has codimension m+1.
- **TauCeti.GeneralizedHeegner.gHC_projector** (characterisation): ε_X fixes Δ_φ.
- **TauCeti.GeneralizedHeegner.gHC_rational_equivalence** (compatibility): Rationally equivalent graph representatives give the same cycle class.
- **TauCeti.GeneralizedHeegner.gHC_baseChange** (functoriality): Base change commutes with projection when graph correspondences and the projector are transported.

Unit tests:

- **TauCeti.GeneralizedHeegner.upsilon_codim** (computation): At m=2 the graph has dimension 2 and codimension 3 in X₂.
- **TauCeti.GeneralizedHeegner.gHC_weight_zero** (degenerate): At m=0 replace the point by point minus a chosen cusp; its degree is zero.
- **TauCeti.GeneralizedHeegner.gHC_projected_test** (characterisation): An idempotent projector fixes the projected graph, whereas an unprojected graph need not be fixed.

Acceptance checks:

- m = 1: Υ_φ = Graph(φ) ⊂ A′ × A = the fibre of E × A over P_{A′}, a curve in the threefold X_1.

Direct prerequisites:

- `GeneralizedHeegnerCycles:GH.0/generalized-kuga-sato-variety-and-its-projector`
- `GeneralizedHeegnerCycles:GH.1/isogenies-of-conductor-c-prime-to-n`
- `SchemeAndStackFoundations:SF.5`

Source passages:

- [Generalized Heegner cycles and p-adic Rankin L-series](https://www.math.mcgill.ca/darmon/pub/Articles/Research/51.BDP1/duke-publishedversion.pdf), §2.3, p. 1062. The cycle Υ_φ = Graph(φ)^r.
- [Generalized Heegner cycles and p-adic Rankin L-series](https://www.math.mcgill.ca/darmon/pub/Articles/Research/51.BDP1/duke-publishedversion.pdf), §2.3, p. 1063. Δ_φ = ε_X Υ_φ is supported on the fibre over P_{A′}, in CH^{r+1}(X_r)_ℚ.

### GH.1.3. BDP Remark 2.6: the field of definition of Δ_φ

**Theorem — TauCeti.GeneralizedHeegner.gHC_descent.**

Node: `GeneralizedHeegnerCycles:GH.1/field-of-definition-of-generalized-heegner-cycles`.

If (φ, A′) ∈ Isog_c^N(A), then Δ_φ is defined over the compositum H̃·H_c of the abelian extension H̃/K over which (A, t_A) is defined with the ring class field H_c of conductor c. So the Δ_φ are defined over abelian extensions of K.

Hypotheses and conventions:

- The descent of the pair (φ, A′) to H_c, compatibly with the level structure, is the main theorem of complex multiplication, imported from HeegnerPointEulerSystems HE.1.

Construction or proof:

1. The CM main theorem makes (A′, φ(t_A)) and φ defined over H̃·H_c for (φ, A′) of conductor c (HE.1).
2. W_r, A and ε_X are defined over H (GH.0), so ι_{A′}, Υ_φ and Δ_φ are defined over H̃·H_c.

Acceptance checks:

- c = 1: Δ_φ is defined over H̃, the field of definition of A[𝔑].

Direct prerequisites:

- `GeneralizedHeegnerCycles:GH.1/generalized-heegner-cycle`
- `HeegnerPointEulerSystems:HE.1/canonical-model-cm-descent`
- `HeegnerPointEulerSystems:HE.0/ring-class-tower-quotients`

Source passages:

- [Generalized Heegner cycles and p-adic Rankin L-series](https://www.math.mcgill.ca/darmon/pub/Articles/Research/51.BDP1/duke-publishedversion.pdf), §2.3, Remark 2.6, p. 1063. Δ_φ is defined over H̃·H_c.

### GH.1.4. BDP Proposition 2.7: Δ_φ is homologically trivial

**Theorem — TauCeti.GeneralizedHeegner.gHC_homologically_trivial.**

Node: `GeneralizedHeegnerCycles:GH.1/homological-triviality-of-generalized-heegner-cycles`.

For m ≥ 1, the cycle class of Δ_φ in ε_X H^{2r+2}(X_m) vanishes in every cohomology theory (de Rham, étale, Betti), so Δ_φ ∈ CH^{m+1}(X_m)_{0,ℚ}. For m = 0, P_{A′} − ∞ is homologically trivial.

Hypotheses and conventions:

- The vanishing of ε_X H^{2r+2}(X_m) is the only input for m ≥ 1.
- The cycle class map commutes with correspondences (EtaleDualityAndPerverseSheaves EDC.3).

Construction or proof:

1. cl(Δ_φ) = cl(ε_X Υ_φ) = ε_X cl(Υ_φ) ∈ ε_X H^{2r+2}(X_m) (EDC.3).
2. ε_X H^{2r+2}(X_m) = 0 for m ≥ 1 (GH.0/cohomology-of-the-generalized-kuga-sato-variety).
3. m = 0: a degree-zero divisor on a curve is homologically trivial.

Acceptance checks:

- m = 1: cl(Δ_φ) ∈ ε_X H⁴(E × A) = 0.

Direct prerequisites:

- `GeneralizedHeegnerCycles:GH.0/cohomology-of-the-generalized-kuga-sato-variety`
- `GeneralizedHeegnerCycles:GH.1/generalized-heegner-cycle`

Source passages:

- [Generalized Heegner cycles and p-adic Rankin L-series](https://www.math.mcgill.ca/darmon/pub/Articles/Research/51.BDP1/duke-publishedversion.pdf), §2.3, Proposition 2.7, p. 1063. Δ_φ is homologically trivial.

### GH.1.5. BDP Definition 3.1: the étale Abel–Jacobi map on ε_X-cycles supported on a fibre

**Construction — TauCeti.GeneralizedHeegner.ajEt.**

Node: `GeneralizedHeegnerCycles:GH.1/etale-abel-jacobi-map`.

For X_m/F and V=ε_XH_et^{2m+1}(X̄_m,Q_p)(m+1), the étale Abel–Jacobi map sends a projected null-homologous codimension m+1 cycle to H¹(F,V). Use the Gysin exact sequence for U=X minus its support, pull back along its cycle class in the residue term, then identify Ext¹_G(Q_p,V) with H¹(F,V). It is independent of support and representative, with restriction, proper pushforward and correspondence equivariance. For m=0 the degree-zero cusp correction is required.

Hypotheses and conventions:

- The exactness uses r ≥ 1: ε_X H^{2r−1}(X_P)(r) = 0, and ε_X H^{2r}(X_P)(r)^0 = ε_X H^{2r}(X_P)(r) because ε_X H^{2r+2}(X_r) = 0.
- The target is the rational Galois cohomology of the ε_X-part. An integral version needs a G_F-stable lattice and control of the denominators of ε_X; that is GH.1 work still to be planned.

Construction or proof:

1. Gysin sequence for the smooth divisor X_P ⊂ X_r with complement X_r^♮, twisted by (r + 1) (EDC.3).
2. Apply ε_X, which preserves X_P and X_r^♮ because it preserves the fibres of π_r. Then ε_X H^{2r−1}(X_P) = 0 (the ε_W part of the cohomology of a single fibre lives in degree r), and ε_X H^{2r+2}(X_r) = 0, giving the short exact sequence.
3. cl_P(Δ) ∈ ε_X H^{2r}(X̄_P)(r). Pull back along the map sending 1 to it; the class in Ext¹ = H¹ of Galois cohomology (SelmerIwasawaCohomology L0) is AJ^et_F(Δ).
4. Compatibility with the general definition: Nekovář's argument, Proposition II.2.4 of his work, as BDP Remark 3.2 says.

Uses of this interface:

- **GeneralizedHeegnerCycles:GH.2/local-condition-at-p-and-the-castella-hsieh-corrections**: The finite local condition is imposed on actual cohomology classes.
- **GeneralizedHeegnerCycles:GH.7/higher-weight-family-specialization**: Fixes the cycle class normalization being compared with Howard’s point tower.

Planning API:

- **TauCeti.GeneralizedHeegner.ajEt_add** (simp): The map is additive on projected null-homologous cycles.
- **TauCeti.GeneralizedHeegner.ajEt_correspondence** (compatibility): A correspondence acts compatibly on cycles and the coefficient representation.
- **TauCeti.GeneralizedHeegner.ajEt_restriction** (functoriality): Restriction to F′ carries AJ_F(Δ) to AJ_F′(Δ_F′).
- **TauCeti.GeneralizedHeegner.ajEt_extension** (characterisation): The cocycle is g↦g·lift(1)−lift(1), and changing the lift adds a coboundary.

Unit tests:

- **TauCeti.GeneralizedHeegner.ajEt_zero** (degenerate): The zero cycle gives the split extension and the zero cohomology class.
- **TauCeti.GeneralizedHeegner.ajEt_lift_change** (characterisation): Changing the lift by b adds precisely the coboundary g·b−b, with this sign.
- **TauCeti.GeneralizedHeegner.ajEt_weight_zero** (compatibility): On X₀ the degree-zero divisor map agrees with Jacobian Kummer under the imported Abel–Jacobi comparison.

Acceptance checks:

- r = 0 analogue: for P − ∞ on a curve, AJ^et is the Kummer class of the point of the Jacobian.

Direct prerequisites:

- `GeneralizedHeegnerCycles:GH.1/homological-triviality-of-generalized-heegner-cycles`
- `EtaleDualityAndPerverseSheaves:EDC.3/gysin-sequence`
- `ArithmeticGaloisDuality:R02.2/compact-five-term`
- `SchemeAndStackFoundations:SF.5`

Source passages:

- [Generalized Heegner cycles and p-adic Rankin L-series](https://www.math.mcgill.ca/darmon/pub/Articles/Research/51.BDP1/duke-publishedversion.pdf), §3.1, p. 1065. The Gysin sequence (3.1.1).
- [Generalized Heegner cycles and p-adic Rankin L-series](https://www.math.mcgill.ca/darmon/pub/Articles/Research/51.BDP1/duke-publishedversion.pdf), §3.1, Definition 3.1, p. 1066. AJ^et_F as the class of the pulled-back extension.
- [Generalized Heegner cycles and p-adic Rankin L-series](https://www.math.mcgill.ca/darmon/pub/Articles/Research/51.BDP1/duke-publishedversion.pdf), §3.1, Remark 3.2, p. 1067. Compatibility with the general definition.

### GH.1.6. BDP Proposition 3.5: Ext of the unit by a filtered Frobenius module of negative weight

**Lemma — TauCeti.GeneralizedHeegner.filteredFrobeniusExtension.**

Node: `GeneralizedHeegnerCycles:GH.1/extensions-of-filtered-frobenius-modules`.

For a negative-weight admissible filtered Frobenius module H over finite unramified F/Q_p, write Φ=Φ₀^[F:Q_p], the F-linear iterate of semilinear crystalline Frobenius. Weight separation gives 1−Φ invertible. Every extension 0→H→D→F→0 has a unique Φ-fixed lift of 1 and a lift in Fil⁰D; their difference, in the order holomorphic minus Frobenius, defines a class in H/Fil⁰H and induces Ext_ffm¹(F,H)≅H/Fil⁰H. Semilinear Φ₀-fixed elements alone do not form the required F-linear splitting.

Hypotheses and conventions:

- The weight hypothesis is used to make E^{Φ=1} → F an isomorphism, and to make the class independent of the lift η^frob.

Construction or proof:

1. Since H^{Φ=1} = 0, the map E^{Φ=1} → F^{Φ=1} = F is injective, and it is surjective because the extension of φ-modules splits (Φ − 1 is bijective on H by the weight hypothesis). This gives a φ-module splitting E = H ⊕ F with η^frob = (0, 1).
2. The filtration on E is determined by Fil⁰E = Fil⁰H + F·η^hol, with η^hol = (h, 1). Two choices give the same filtration iff h − h′ ∈ Fil⁰H.
3. Hence the class of h in H/Fil⁰H classifies the extension.

Acceptance checks:

- H = F(1), the Tate twist of weight −2 (Fil⁰H = 0): Ext¹_ffm(F, F(1)) ≅ F.

Direct prerequisites:

- `PadicHodgeTheory:R06.2`
- `PadicHodgeTheory:R06.5`

Source passages:

- [Generalized Heegner cycles and p-adic Rankin L-series](https://www.math.mcgill.ca/darmon/pub/Articles/Research/51.BDP1/duke-publishedversion.pdf), §3.3, p. 1068. The setting of Proposition 3.5.
- [Generalized Heegner cycles and p-adic Rankin L-series](https://www.math.mcgill.ca/darmon/pub/Articles/Research/51.BDP1/duke-publishedversion.pdf), §3.3, Proposition 3.5, p. 1069. Ext_ffm(F, H) = H/Fil⁰H.

### GH.1.7. The p-adic Abel–Jacobi map AJ_F : CH^{r+1}(X_r)_{0,ℚ}(F) → (S_{r+2}(Γ, F) ⊗ Sym^r H¹_dR(A/F))^∨

**Construction — TauCeti.GeneralizedHeegner.ajP.**

Node: `GeneralizedHeegnerCycles:GH.1/p-adic-abel-jacobi-map`.

Under BDP §3’s finite unramified F/Q_p and supplied smooth proper models, AJ_et(Δ) lies in H¹_f(F,V). The crystalline extension gives the filtered Frobenius extension of the preceding node; its holomorphic-minus-Frobenius class lies in D_dR(V)/Fil⁰. Poincaré duality identifies this quotient with (S_{m+2}⊗Sym^mH¹_dR(A/F))∨, yielding AJ_F. This use of an unramified F records the selected presentation, not a claim that Bloch–Kato theory requires unramified F in general.

Hypotheses and conventions:

- F unramified over ℚ_p with good reduction of C and X_r (p ∤ cNd_K). The comparison and Nekovář's theorem are imported from PadicHodgeTheory R06.5–R06.6.
- H = ε_X H^{2r+1}_dR(r + 1) has weight −1 < 0, as Proposition 3.5 requires.

Construction or proof:

1. AJ^et_F(CH^{r+1}_0) ⊆ H¹_f (Nekovář, Theorem 3.1.1; Nizioł), requested from PadicHodgeTheory R06.6.
2. Faltings: ε_X H^{2r+1}_et(X̄_r)(r + 1) is crystalline with D_cris equal to ε_X H^{2r+1}_dR(X_r/F)(r + 1) (R06.5). D_cris is fully faithful, and surjectivity onto Ext_ffm comes from the Bloch–Kato exponential (BDP Corollary 3.4; R06.2).
3. Proposition 3.5 with H = ε_X H^{2r+1}_dR(r + 1) of weight −1.
4. Poincaré duality makes Fil¹ε_X H^{2r+1}(r) and Fil⁰ε_X H^{2r+1}(r + 1) exact annihilators, so H/Fil⁰H = (Fil^{r+1} ε_X H^{2r+1}_dR)^∨ (GH.0/self-duality-of-the-projected-cohomology).
5. Fil^{r+1} ε_X H^{2r+1}_dR = S_{r+2}(Γ, F) ⊗ Sym^r H¹_dR(A) (GH.0/cohomology-of-the-generalized-kuga-sato-variety).

Uses of this interface:

- **GeneralizedHeegnerCycles:GH.1/coleman-abel-jacobi-formula**: Allows the analytic primitive to evaluate the cycle extension.
- **GeneralizedHeegnerCycles:GH.4/bdp-special-value-formula**: Fixes the functional and periods in the squared formula.

Planning API:

- **TauCeti.GeneralizedHeegner.ajP_etale** (compatibility): AJ_p is the crystalline/Bloch–Kato logarithm of AJ_et under the stated quotient and duality identification.
- **TauCeti.GeneralizedHeegner.ajP_add** (simp): AJ_p is additive in Δ.
- **TauCeti.GeneralizedHeegner.ajP_pairing** (data): Evaluation on ω_f⊗ω_A^jη_A^(m−j) uses the Poincaré dual functional and the fixed Tate twist.

Unit tests:

- **TauCeti.GeneralizedHeegner.ajP_zero** (degenerate): A split étale extension has zero p-adic Abel–Jacobi functional.
- **TauCeti.GeneralizedHeegner.ajP_filtration_independence** (characterisation): Changing the Hodge lift by Fil⁰ does not change its quotient class.
- **TauCeti.GeneralizedHeegner.ajP_sign** (non-example): The recipe is holomorphic lift minus Frobenius lift: swapping the order negates the quotient class.

Acceptance checks:

- r = 0: AJ_F(P − ∞)(ω_f) = ∫_∞^P ω_f, the Coleman integral, which BDP §3.6 recovers.

Direct prerequisites:

- `GeneralizedHeegnerCycles:GH.1/etale-abel-jacobi-map`
- `GeneralizedHeegnerCycles:GH.1/extensions-of-filtered-frobenius-modules`
- `GeneralizedHeegnerCycles:GH.0/cm-product-good-model`
- `PadicHodgeTheory:R06.5`
- `EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality`
- `PadicHodgeRegulators:L1/bloch-kato-logarithm`
- `GeneralizedHeegnerCycles:GH.0/projected-hodge-filtration`

Source passages:

- [Generalized Heegner cycles and p-adic Rankin L-series](https://www.math.mcgill.ca/darmon/pub/Articles/Research/51.BDP1/duke-publishedversion.pdf), §3.2, p. 1067. Hypotheses on F.
- [Generalized Heegner cycles and p-adic Rankin L-series](https://www.math.mcgill.ca/darmon/pub/Articles/Research/51.BDP1/duke-publishedversion.pdf), §3.2, Theorem 3.3, p. 1068. Faltings' crystalline comparison.
- [Generalized Heegner cycles and p-adic Rankin L-series](https://www.math.mcgill.ca/darmon/pub/Articles/Research/51.BDP1/duke-publishedversion.pdf), §3.4, p. 1069. AJ^et lands in H¹_f = Ext_cris.
- [Generalized Heegner cycles and p-adic Rankin L-series](https://www.math.mcgill.ca/darmon/pub/Articles/Research/51.BDP1/duke-publishedversion.pdf), §3.4, p. 1070. Definition of AJ_F.

### GH.1.8. Integral Abel–Jacobi comparison

**Comparison — TauCeti.GeneralizedHeegner.integralAJComparison.**

Node: `GeneralizedHeegnerCycles:GH.1/integral-abel-jacobi-comparison`.

For p∤2N m!, invert the remaining f-projector denominator and choose the specified stable lattice T in V_f(r), m=2r−2. The cycle extension gives an integral class in H¹(K̃_c,T⊗Sym^{2r−2}T_p(A)(1−r)); its rationalization is AJ_et in the displayed self-dual twist. Descent from the ray field K̃_c to K_c uses invariance together with the compact inflation–restriction sequence and vanishing of coefficient invariants, rather than invariance alone.

Hypotheses and conventions:

- The coefficient lattice and the f-projector denominator are fixed; r≥1; residual invariant vanishing is stated separately.

Construction or proof:

1. Track the localization of every correspondence in the Gysin sequence.
2. Use the integral Hecke lattice comparison requested from R14.3, then HS/compact-five-term to descend.

Acceptance checks:

- Integral descent fails without the invariant-vanishing input; rationalization alone does not remove a congruence denominator.

Direct prerequisites:

- `GeneralizedHeegnerCycles:GH.0/newform-cm-projector`
- `GeneralizedHeegnerCycles:GH.1/etale-abel-jacobi-map`
- `ArithmeticGaloisDuality:R02.2/compact-five-term`

Source passages:

- [Heegner cycles and p-adic L-functions](https://www.math.ntu.edu.tw/~mlhsieh/research/HCES.pdf), §4.2, (4.2), pp.14–15. Integral lattice, symmetric power and descent target are explicit.

### GH.1.9. Character-projected Heegner class

**Construction — TauCeti.GeneralizedHeegner.characterHeegnerClass.**

Node: `GeneralizedHeegnerCycles:GH.1/character-projected-heegner-class`.

For CH’s canonical CM A/H_K and B=Res_{H_K/K}A, let κ_A be its CM character and χ a locally algebraic anticyclotomic avatar of infinity type (j,−j), −r<j<r, with conductor c₀p^s, (c₀,Np)=1. After extending coefficients, choose the finite Hilbert class character χ_t so χ occurs in Sym^{2r−2}T_p(B)(1−r)⊗χ_t and use its eigenprojector e_χ. Twist the class by χ_t and apply e_χ, then corestrict with CH (4.7)’s χ ε_cyc^{1−r} weights to obtain z_{f,χ,c}∈H¹(K_c,T⊗χ). The Weil restriction and CM character are imported, not newly constructed here.

Hypotheses and conventions:

- CH §4.4 hypotheses and coefficient field containing CM and χ values.

Construction or proof:

1. Import CM reciprocity and the Weil restriction realization.
2. Use the CM decomposition, twist by χ_t, project, and apply the explicit weighted corestriction.

Uses of this interface:

- **GeneralizedHeegnerCycles:GH.4/ramified-character-abel-jacobi-formula**: Provides the correctly twisted class whose local logarithm is evaluated.
- **GeneralizedHeegnerCycles:GH.6/selmer-rank-one**: Supplies the actual nonzero class generating the Selmer space.

Planning API:

- **TauCeti.GeneralizedHeegner.characterHeegnerClass_eigen** (characterisation): The projector places the class in the χ-isotypic coefficient line.
- **TauCeti.GeneralizedHeegner.characterHeegnerClass_cores** (functoriality): Corestriction commutes with the character projector after coefficient descent.
- **TauCeti.GeneralizedHeegner.characterHeegnerClass_sum** (constructor): Weighted corestriction is additive in the conductor-indexed cycle classes.

Unit tests:

- **TauCeti.GeneralizedHeegner.characterHeegnerClass_trivial** (degenerate): The trivial CM component uses its identity projection.
- **TauCeti.GeneralizedHeegner.characterHeegnerClass_orthogonal** (non-example): Orthogonal idempotents kill the class projected to the other character.
- **TauCeti.GeneralizedHeegner.characterHeegnerClass_add_test** (compatibility): The construction agrees with the linear coefficient projection on a sum of two classes.

Acceptance checks:

- A class merely valued in Sym^mT_p(A) is not yet a G_K class when A is only defined over H_K.

Direct prerequisites:

- `GeneralizedHeegnerCycles:GH.1/integral-abel-jacobi-comparison`
- `GeneralizedHeegnerCycles:GH.0/cm-character-decomposition`
- `ComplexMultiplicationAndExplicitReciprocity:CM.1`
- `ArithmeticGaloisDuality:R02.2/compact-five-term`

Source passages:

- [Heegner cycles and p-adic L-functions](https://www.math.ntu.edu.tw/~mlhsieh/research/HCES.pdf), §4.4, (4.5)–(4.7), pp.17–18. The Weil restriction supplies a G_K action that A/H alone does not have.

### GH.1.10. Parabolic residue pairing

**Theorem — TauCeti.GeneralizedHeegner.parabolicResiduePairing.**

Node: `GeneralizedHeegnerCycles:GH.1/parabolic-residue-pairing`.

For BDP’s punctured good-reduction curve with coefficient isocrystal L_{m,m}, a de Rham class is parabolic exactly when its annular residues vanish, including the horizontal cusp residue. For parabolic representatives ω₁,ω₂, the Poincaré pairing is Σ_j res_{V_j}⟨F_{1,j},ω₂⟩, where ∇F_{1,j}=ω₁. Changing a local primitive by a horizontal section does not change the pairing.

Hypotheses and conventions:

- BDP §3.5 good model, distinct residue disks, annuli and self-dual coefficient system; both classes parabolic.

Construction or proof:

1. Import the rigid/algebraic comparison and residue theorem.
2. Use the Cech–de Rham description and zero residue to eliminate dependence on horizontal constants.

Acceptance checks:

- Adding a horizontal constant changes no parabolic residue pairing.

Direct prerequisites:

- `GeneralizedHeegnerCycles:GH.0/cm-product-good-model`
- `SchemeAndStackFoundations:SF.2`
- `EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality`
- `PadicDifferentialEquationsAndRigidCohomology:RD.4`
- `PadicDifferentialEquationsAndRigidCohomology:RD.3/overconvergent-f-isocrystal`

Source passages:

- [Generalized Heegner cycles and p-adic Rankin L-series](https://www.math.mcgill.ca/darmon/pub/Articles/Research/51.BDP1/duke-publishedversion.pdf), §3.5, Propositions 3.9–3.10, pp.1073–1074. The cup product is calculated as a sum of annular residues.

### GH.1.11. Coleman primitive for the modular differential

**Construction — TauCeti.GeneralizedHeegner.colemanPrimitive.**

Node: `GeneralizedHeegnerCycles:GH.1/coleman-primitive`.

For ω_f valued in L_m choose a Frobenius annihilator P killing its parabolic cohomology class, invertible on horizontal sections, with P(1)≠0. The Coleman primitive F_f is the locally analytic section with ∇F_f=ω_f and P(Φ)F_f rigid analytic on a Frobenius neighborhood. Weight separation and gluing make it choice independent; for m>0 it is unique and for m=0 unique modulo constants. Evaluation uses the specified ordinary CM residue disk and normalized basis.

Hypotheses and conventions:

- The good unramified local model and overconvergent Frobenius isocrystal are supplied; the weight-separation lemma applies.

Construction or proof:

1. Import overconvergent Frobenius and solve locally by an analytic primitive.
2. Invert P(Φ) on horizontal sections to impose the rigid condition; glue and track the m=0 constant ambiguity.

Uses of this interface:

- **GeneralizedHeegnerCycles:GH.1/coleman-abel-jacobi-formula**: Computes the holomorphic extension term and kills the Frobenius term.
- **GeneralizedHeegnerCycles:GH.1/coleman-depletion-calculation**: Relates component pairings to p-depleted modular forms.

Planning API:

- **TauCeti.GeneralizedHeegner.colemanPrimitive_differential** (characterisation): The Gauss–Manin connection of F_f is ω_f.
- **TauCeti.GeneralizedHeegner.colemanPrimitive_frobenius** (characterisation): P(Φ)F_f is a rigid section on a Frobenius neighborhood.
- **TauCeti.GeneralizedHeegner.colemanPrimitive_choice** (extensionality): Any two admissible primitives differ by a global horizontal section.

Unit tests:

- **TauCeti.GeneralizedHeegner.colemanPrimitive_zero** (degenerate): With the zero normalization the zero differential has zero Coleman primitive.
- **TauCeti.GeneralizedHeegner.colemanPrimitive_constants** (non-example): In weight zero adding a horizontal constant preserves the differential, so uniqueness without normalization is false.
- **TauCeti.GeneralizedHeegner.colemanPrimitive_residue_test** (compatibility): Changing a primitive by a horizontal constant does not change its pairing with a zero-residue differential.

Acceptance checks:

- For m=0 an arbitrary constant remains; at m>0 no global horizontal section remains.

Direct prerequisites:

- `GeneralizedHeegnerCycles:GH.1/parabolic-residue-pairing`
- `PadicDifferentialEquationsAndRigidCohomology:RD.4`
- `PadicDifferentialEquationsAndRigidCohomology:RD.3/overconvergent-f-isocrystal`

Source passages:

- [Generalized Heegner cycles and p-adic Rankin L-series](https://www.math.mcgill.ca/darmon/pub/Articles/Research/51.BDP1/duke-publishedversion.pdf), §3.6, Lemma 3.14, Theorem 3.15 and Remarks 3.16–3.17, pp.1076–1078. Choice independence and the weight-zero constant ambiguity are explicit.

### GH.1.12. Coleman Abel–Jacobi formula

**Theorem — TauCeti.GeneralizedHeegner.colemanAJ.**

Node: `GeneralizedHeegnerCycles:GH.1/coleman-abel-jacobi-formula`.

For an ordinary marked isogeny φ:A→A′ and α∈Sym^mH¹_dR(A), AJ_F(Δ_φ)(ω_f⊗α)=⟨F_f(P_{A′})⊗α,cl_{P_{A′}}Δ_φ⟩=⟨φ*F_f(P_{A′}),α⟩_A. If φ*ω′=ω and d=deg φ, then evaluation on ω_A^jη_A^{m−j} is d^jG_j(A′,t′,ω′).

Hypotheses and conventions:

- BDP §3.7 local hypotheses; 0≤j≤m; normalized isogeny differential.

Construction or proof:

1. Use the parabolic residue formula on the extension defining AJ_p.
2. The holomorphic term is the evaluation at the CM point (Lemma 3.19). The Frobenius term vanishes by P(1)≠0 and the rigid residue theorem (Lemma 3.20).
3. Apply the projection formula to the isogeny graph and φ*η′=dη.

Acceptance checks:

- At j=0 the degree factor is 1; at j=m it is d^m.

Direct prerequisites:

- `GeneralizedHeegnerCycles:GH.1/p-adic-abel-jacobi-map`
- `GeneralizedHeegnerCycles:GH.1/coleman-primitive`
- `GeneralizedHeegnerCycles:GH.1/parabolic-residue-pairing`

Source passages:

- [Generalized Heegner cycles and p-adic Rankin L-series](https://www.math.mcgill.ca/darmon/pub/Articles/Research/51.BDP1/duke-publishedversion.pdf), §3.7, Propositions 3.18, 3.21 and Lemma 3.22, pp.1078–1084. The residue computation evaluates AJ on the isogeny graph.

### GH.1.13. Depleted Coleman component calculation

**Theorem — TauCeti.GeneralizedHeegner.colemanDepletion.**

Node: `GeneralizedHeegnerCycles:GH.1/coleman-depletion-calculation`.

For the normalized components G_j=⟨F_f,ω^jη^{m−j}⟩ and f♭ the p-depletion, G_j♭=j! θ^{−1−j}f♭ on the ordinary locus. The negative power is the continuous p-adic extension of θ on p-depleted q-series. The proof uses the connection in the Tate-curve basis, the recurrence G_0♭=θ⁻¹f♭ and G_j♭=jθ⁻¹G_{j−1}♭, plus the q-expansion principle. θ, U, V, depletion and q-expansion principle belong to the modular-forms suppliers.

Hypotheses and conventions:

- 0≤j≤m; ordinary locus; supplied q-expansion principle and inverse θ on p-depleted forms.

Construction or proof:

1. Use the connection and unit-root splitting to obtain the component recurrence.
2. Check the q-expansion and apply the imported q-expansion principle.

Acceptance checks:

- The coefficient of q^n, p∤n, is j! a_n/n^{j+1}; at j=0 it is a_n/n.

Direct prerequisites:

- `GeneralizedHeegnerCycles:GH.1/coleman-primitive`
- `ModularCurvesPartII:R14.3`
- `AutomorphicPadicLFunctions:L3h`

Source passages:

- [Generalized Heegner cycles and p-adic Rankin L-series](https://www.math.mcgill.ca/darmon/pub/Articles/Research/51.BDP1/duke-publishedversion.pdf), §3.8, Proposition 3.24, (3.8.5)–(3.8.6), pp.1086–1088. States the factorial and negative Atkin–Serre power.

### GH.1.14. Syntomic Abel–Jacobi comparison

**Comparison — TauCeti.GeneralizedHeegner.syntomicAJComparison.**

Node: `GeneralizedHeegnerCycles:GH.1/syntomic-abel-jacobi-comparison`.

For the supplied smooth proper model of X_m and projected homologically trivial cycles, a geometric syntomic regulator and its étale comparison must identify the syntomic Abel–Jacobi image with AJ_p after Bloch–Kato logarithm and the exact Frobenius normalization. Besser’s regulator on Spec O_F, or its K₂ curve specialization, does not supply this higher-dimensional correspondence-compatible statement. This is a requested extension of D.2, with the precise comparison a gap until supplied.

Hypotheses and conventions:

- Good model, cycle support extension and the same Tate and Frobenius conventions as AJ_p.

Construction or proof:

1. Import the generic syntomic complex and Chern class formalism.
2. Obtain the higher-dimensional cycle regulator and compare its Gysin extension with the étale one. The absent supplier comparison is explicitly recorded.

Acceptance checks:

- At weight zero the syntomic regulator must reproduce the Abel–Jacobi/Kummer comparison, including the Frobenius factor.

Direct prerequisites:

- `PadicHodgeRegulators:D.2`
- `GeneralizedHeegnerCycles:GH.1/p-adic-abel-jacobi-map`
- `GeneralizedHeegnerCycles:GH.0/cm-product-good-model`

Source passages:

- [Generalized Heegner cycles and p-adic Rankin L-series](https://www.math.mcgill.ca/darmon/pub/Articles/Research/51.BDP1/duke-publishedversion.pdf), §3.4, pp.1068–1070. Identifies the realization to which a geometric syntomic regulator must compare.

### GH.1.15. Classical and generalized cycle comparison

**Comparison — TauCeti.GeneralizedHeegner.classicalGeneralizedComparison.**

Node: `GeneralizedHeegnerCycles:GH.1/classical-generalized-cycle-comparison`.

For m=2r−2, the trivial CM-character projection of the generalized cycle class agrees with the classical Heegner cycle on W_m with the normalization u_{c₀}(2√−D_K)^{r−1} appearing in Castella Theorem 6.5; Castella uses u_{c₀}=|O_{c₀}×|/2. The comparison is cited there from BDP (2017), Proposition 4.1.2 with r₁=2r−2,r₂=0,u=r−1. It is not established by the 2013 homological-triviality calculation. Its proof and precise cycle adapter are recorded as an outstanding source input.

Hypotheses and conventions:

- Canonical CM data and coefficient projection; r>1 in the family comparison; period and sign choices fixed.

Construction or proof:

1. Use the trivial CM-character projector.
2. Read and realize BDP 2017 Proposition 4.1.2 before identifying the generalized and classical class normalizations; this source is not silently replaced by BDP 2013.

Acceptance checks:

- The half-unit convention is distinct from CH Definition 5.2’s full-unit convention.

Direct prerequisites:

- `GeneralizedHeegnerCycles:GH.1/character-projected-heegner-class`
- `GeneralizedHeegnerCycles:GH.1/integral-abel-jacobi-comparison`

Source passages:

- [On the p-adic variation of Heegner points](https://web.math.ucsb.edu/~castella/Heegner.pdf), §6.2, proof of Theorem 6.5, p.28. States the unit convention and invokes BDP17 for the comparison.

## GH.2. Ring-class trace, congruence and local conditions

The conductor recurrences, complex conjugation and inert-prime local Frobenius relation are separate results. Finite local containment of geometric cycles is separated from the integral local condition of derivative classes. The latter uses the corrected Perrin–Riou argument, with its lattice and height-one local condition explicitly identified.

Coverage: **planned**. Remaining proof closure: Corrected integral p-condition adapter.

Atlas planets: Cycle norm relations; Conjugation relation; Cycle Frobenius congruence; Corrected local condition.

### GH.2.1. Heegner cycle norm relations

**Theorem — TauCeti.GeneralizedHeegner.cycleNormRelations.**

Node: `GeneralizedHeegnerCycles:GH.2/cycle-norm-relations`.

For CH’s classes with p∤c and split p, n>1, cor_{K_{cp^n}/K_{cp^{n−1}}}(z_{f,cp^n})=a_p z_{f,cp^{n−1}}−p^{2r−2}res(z_{f,cp^{n−2}}). For an inert ℓ∤cND_Kp, cor_{K_{cℓ}/K_c}(z_{f,cℓ})=a_ℓ z_{f,c}. These equations are transported through the character projection with the prescribed χ weights. The n=1 split relation includes units and both Artin operators and requires an additional normalization check; it is not asserted by Proposition 4.4 in the 2022 copy.

Hypotheses and conventions:

- CH canonical CM data, p∤c, r≥1, prime-to-projector denominators and the displayed conductor exclusions.

Construction or proof:

1. Classify conductor-changing Hecke neighbors using HE.2.
2. Compare graph cycles in the Néron–Severi group: the predecessor term contributes p^{2r−2}; use the torsion-translation invariance of the projected graph.
3. Apply the f-projector, AJ functoriality and CM coefficient projection.

Acceptance checks:

- For r=1 the predecessor coefficient is 1; for r=2 it is p².

Direct prerequisites:

- `GeneralizedHeegnerCycles:GH.1/character-projected-heegner-class`
- `GeneralizedHeegnerCycles:GH.1/etale-abel-jacobi-map`
- `HeegnerPointEulerSystems:HE.2/cm-hecke-conductor-classification`

Source passages:

- [Heegner cycles and p-adic L-functions](https://www.math.ntu.edu.tw/~mlhsieh/research/HCES.pdf), §4.3, Proposition 4.4 and (4.3)–(4.4), pp.15–17. States the split recurrence for n>1 and the inert trace.

### GH.2.2. Complex conjugation of Heegner classes

**Theorem — TauCeti.GeneralizedHeegner.cycleConjugation.**

Node: `GeneralizedHeegnerCycles:GH.2/cycle-conjugation`.

With τ complex conjugation, w_f the Atkin–Lehner eigenvalue and σ_N the fixed Artin class, (z_{f,χ,c})^τ=w_f χ(σ_N)(z_{f,χ^{-1},c})^{σ_N}. The CM curve is defined over H_K^+ so τ acts on the chosen geometric cycle. Conjugation changes the coefficient character to χ^{-1}; it is not a same-character identity unless χ²=1.

Hypotheses and conventions:

- The decomposition N O_K=𝔑 𝔑̄ and geometric/Artin normalization are fixed.

Construction or proof:

1. Apply the Atkin–Lehner correspondence to the conjugate graph; the cycle comparison has N^{r−1}.
2. Use CH Lemma 4.5’s weighted Galois action to absorb the norm factor.

Acceptance checks:

- At χ=1 the remaining sign is w_f and the fixed σ_N action.

Direct prerequisites:

- `GeneralizedHeegnerCycles:GH.1/character-projected-heegner-class`
- `ModularCurvesPartII:R14.3`
- `ComplexMultiplicationAndExplicitReciprocity:CM.1`

Source passages:

- [Heegner cycles and p-adic L-functions](https://www.math.ntu.edu.tw/~mlhsieh/research/HCES.pdf), §4.4, Lemma 4.6, p.18. States the character inversion and Artin coefficient.

### GH.2.3. Frobenius congruence for cycle classes

**Theorem — TauCeti.GeneralizedHeegner.cycleFrobeniusCongruence.**

Node: `GeneralizedHeegnerCycles:GH.2/cycle-frobenius-congruence`.

For ℓ∤cND_K inert, let λ_c and λ_{cℓ} be the chosen compatible local primes. Then res_{K_{λ_{cℓ}}/K_{λ_c}}(loc_{λ_c}(z_{f,χ,c})^{Frob_ℓ})=loc_{λ_{cℓ}}(z_{f,χ,cℓ}). The anticyclotomic χ is trivial on the relevant local decomposition group. This is an equality after restriction of local classes, deduced from reduction of the conductor-changing isogeny to Frobenius; it is not equality of global classes modulo ℓ.

Hypotheses and conventions:

- Compatible local embeddings; good reduction at ℓ; inert conductor-changing prime.

Construction or proof:

1. Import the geometric CM reduction congruence from HE.2.
2. Apply the graph correspondence, smooth specialization, AJ functoriality and local restriction.

Acceptance checks:

- The local Frobenius acts on the untwisted module because χ is trivial at this inert place.

Direct prerequisites:

- `GeneralizedHeegnerCycles:GH.1/character-projected-heegner-class`
- `HeegnerPointEulerSystems:HE.2/inert-reduction-frobenius-congruence`
- `PadicHodgeTheory:R06.5`

Source passages:

- [Heegner cycles and p-adic L-functions](https://www.math.ntu.edu.tw/~mlhsieh/research/HCES.pdf), §4.4, Lemma 4.7, pp.18–19. The local restriction and Frobenius equality are stated exactly.

### GH.2.4. Finite local Abel–Jacobi class

**Theorem — TauCeti.GeneralizedHeegner.finiteLocalAJ.**

Node: `GeneralizedHeegnerCycles:GH.2/finite-local-abel-jacobi-class`.

At a good unramified local model AJ_et(Δ) is crystalline and hence lies in H¹_f; outside p its unramified local class follows from the good integral support and specialization. CH Proposition 7.6’s propagation through coefficient quotients uses the corrected Fontaine–Laffaille hypothesis: the local field L must be absolutely unramified over Q_p, not just relatively unramified over K_{c,w}. A ramified conductor field requires a different argument. Bloch–Kato, Greenberg and a chosen regulator-image condition are identified only after the stated comparison is proved.

Hypotheses and conventions:

- Good models, admissible Hodge interval p>2r−1, and absolute unramifiedness when Fontaine–Laffaille is used.

Construction or proof:

1. Use the geometric crystalline extension theorem at p and proper smooth specialization away from p.
2. Import propagation and lattice comparison of local conditions; use CH Lemma 7.5 only with its erratum hypothesis.

Acceptance checks:

- A relatively unramified extension of a ramified base is still ramified over Q_p.

Direct prerequisites:

- `GeneralizedHeegnerCycles:GH.0/cm-product-good-model`
- `GeneralizedHeegnerCycles:GH.1/integral-abel-jacobi-comparison`
- `SelmerIwasawaCohomology:L4/bloch-kato-condition`
- `SelmerIwasawaCohomology:L2/condition-propagation`
- `PadicHodgeTheory:R06.5`

Source passages:

- [Heegner cycles and p-adic L-functions](https://www.math.ntu.edu.tw/~mlhsieh/research/HCES.pdf), §7.3, Lemma 7.5 and Proposition 7.6, p.31. The finite condition is propagated via the local coefficient quotient.
- [Erratum to Heegner cycles and p-adic L-functions](https://www.math.ntu.edu.tw/~mlhsieh/research/erratum2.pdf), Second correction, entire one-page erratum. Adds absolute unramifiedness and routes the replacement proof.

### GH.2.5. Corrected derivative local condition

**Theorem — TauCeti.GeneralizedHeegner.correctedDerivativeLocalCondition.**

Node: `GeneralizedHeegnerCycles:GH.2/local-condition-at-p-and-the-castella-hsieh-corrections`.

For the specialized anticyclotomic Heegner Euler system in CH Proposition 7.8, the derivative classes satisfy axiom (E5) at p by the integral Perrin–Riou lifting and orthogonality argument of KO Lemma 4.10. At a height-one P≠pΛ, use the integral regulator image defining F_P, lift the period vector through the unramified trace, apply Ω, specialize and use the local Tate pairing; use conjugation for p̄. The proof cannot use CH Lemma 7.5 over arbitrary ramified conductor fields. The identification of F_P with the CH local condition and its integral lattice must be checked explicitly.

Hypotheses and conventions:

- KO Condition 2.3 and CH specialization hypotheses as supplied; prime P≠pΛ; coefficient and local regulator normalizations matched.

Construction or proof:

1. Lift h∈R̃₁^{ψ=0}⊗D_cris(V_f)^{φ=α}(r) to h′ over the conductor coefficient ring using surjectivity of unramified trace.
2. Apply the integral Ω map to h′; use norm compatibility and the finite local pairing (KO (4.49)–(4.50)).
3. KO Lemma 4.7 makes regulator images orthogonal. Apply conjugation at p̄ and ordinary/regulator-image comparison where its hypotheses hold.

Acceptance checks:

- The same conclusion over a ramified local field cannot be deduced from the printed Fontaine–Laffaille proof.

Direct prerequisites:

- `GeneralizedHeegnerCycles:GH.2/finite-local-abel-jacobi-class`
- `GeneralizedHeegnerCycles:GH.2/cycle-conjugation`
- `PadicHodgeRegulators:L3`
- `EulerSystemsAndKolyvaginSystems:ES.5/howard-hypotheses`

Source passages:

- [Anticyclotomic main conjecture for modular forms and integral Perrin-Riou twists](https://www.math.keio.ac.jp/~kurihara/20.ASPMstyle.pdf), §4, Lemmas 4.7, 4.10, (4.47)–(4.50), pp.42–44. The load-bearing local lifting and orthogonality proof was read in full.
- [Erratum to Heegner cycles and p-adic L-functions](https://www.math.ntu.edu.tw/~mlhsieh/research/erratum2.pdf), Second correction. Routes the repaired argument to KO20 Lemma 4.10.

## GH.3. Ordinary stabilization and universal norms

The raw trace recurrence becomes an inverse-limit class after ordinary stabilization and the first-step normalization. Longo–Vigni’s trace-polynomial intersection and compact lifting give another universal-norm construction. These two constructions are not identified by a shared name: their initial operators, finite quotient and unit conventions must match.

Coverage: **planned**. Remaining proof closure: Bottom conductor and full/half unit normalization; LV universal-norm identification.

Atlas planets: Ordinary stabilized class; Iwasawa Heegner class; Trace polynomials; Universal norm Heegner class.

### GH.3.1. Ordinary stabilized Heegner class

**Construction — TauCeti.GeneralizedHeegner.stabilizedClass.**

Node: `GeneralizedHeegnerCycles:GH.3/ordinary-stabilized-class`.

For CH k=2r, ap a p-adic unit and α the unit root of X²−apX+p^{2r−1}, set z_{c,α}=z_c−(p^{2r−2}/α)res(z_{c/p}) when p|c. When p∤c set z_{c,α}=u_c^{-1}(1−p^{r−1}σ_p/α)(1−p^{r−1}σ_p̄/α)z_c, with CH’s u_c=|O_c×|. The factor at p∤c is a pair of Euler operators, not the same formula as at positive p-conductor.

Hypotheses and conventions:

- r≥1, p split, ap unit; lattice integral away from the recorded denominators; compatible Artin operators.

Construction or proof:

1. Use the unit-root factorization and the split predecessor relation.
2. Separate the bottom conductor case and track the source’s full-unit convention; the first-step trace adapter remains a gap.

Uses of this interface:

- **GeneralizedHeegnerCycles:GH.3/iwasawa-heegner-class**: Multiplying the conductor-n class by α^{-n} gives norm compatibility.
- **GeneralizedHeegnerCycles:GH.7/initial-family-specialization**: Tracks the unit convention before identifying Howard’s specialization.

Planning API:

- **TauCeti.GeneralizedHeegner.stabilizedClass_upper** (simp): At positive p-conductor the subtraction coefficient is p^{2r−2}/α.
- **TauCeti.GeneralizedHeegner.stabilizedClass_bottom** (constructor): The bottom class is u_c⁻¹ times the product of the p and p̄ Euler operators.
- **TauCeti.GeneralizedHeegner.stabilizedClass_trace** (relation): With the matched first-step normalization, cor(z_{cp,α})=α z_{c,α}.
- **TauCeti.GeneralizedHeegner.stabilizedClass_integral** (structure): The normalized subtraction preserves the integral lattice when both classes and its explicitly recorded scalar action preserve that lattice.

Unit tests:

- **TauCeti.GeneralizedHeegner.stabilizedClass_weight_two** (computation): For r=1 the predecessor coefficient is α⁻¹.
- **TauCeti.GeneralizedHeegner.stabilizedClass_zero_predecessor** (degenerate): A zero predecessor leaves the current class unchanged.
- **TauCeti.GeneralizedHeegner.stabilizedClass_root_relation** (characterisation): The unit-root equation gives α+p^{2r−1}/α=ap, which is the coefficient identity used in the trace computation.

Acceptance checks:

- At r=1 the upper-layer subtraction is α⁻¹z_{c/p}; the bottom layer still has two Artin operators.

Direct prerequisites:

- `GeneralizedHeegnerCycles:GH.2/cycle-norm-relations`
- `GeneralizedHeegnerCycles:GH.1/character-projected-heegner-class`
- `HeegnerPointEulerSystems:HE.0/ring-class-tower-quotients`

Source passages:

- [Heegner cycles and p-adic L-functions](https://www.math.ntu.edu.tw/~mlhsieh/research/HCES.pdf), §5.2, Definition 5.2, p.22. The two formulas and u_c are explicit.

### GH.3.2. First-step stabilization adapter

**Comparison — TauCeti.GeneralizedHeegner.stabilizedFirstStep.**

Node: `GeneralizedHeegnerCycles:GH.3/stabilized-first-step-adapter`.

The upper and lower formulas of CH Definition 5.2 must satisfy cor_{K_{cp}/K_c}(z_{cp,α})=α z_{c,α}. Prove the conductor-one trace from the Hecke neighbor classification with both Frobenius classes and the exact unit index. The July 2022 Proposition 4.4 states only n>1; its proof does not, by itself, discharge the n=1 assertion in Lemma 5.3. Compare CH’s full-unit and Castella’s half-unit conventions by an explicit scaling of the cycle classes.

Hypotheses and conventions:

- p∤c and the same geometric graph and AJ normalization in all three sources.

Construction or proof:

1. Import the first-step Heegner neighbor classification.
2. Compute the unit orbit multiplicities of the higher-weight graph cycle and both split ideal terms.
3. Substitute the unit-root relation; establish the normalization adapter before using an inverse limit.

Acceptance checks:

- The classical weight-two first-step check must reproduce the full versus half unit scaling.

Direct prerequisites:

- `GeneralizedHeegnerCycles:GH.3/ordinary-stabilized-class`
- `HeegnerPointEulerSystems:HE.2/split-ramified-first-step-recurrence`
- `GeneralizedHeegnerCycles:GH.1/classical-generalized-cycle-comparison`

Source passages:

- [Heegner cycles and p-adic L-functions](https://www.math.ntu.edu.tw/~mlhsieh/research/HCES.pdf), §5.2, Lemma 5.3, p.22. States the trace that needs the bottom-layer calculation.

### GH.3.3. Iwasawa Heegner class

**Construction — TauCeti.GeneralizedHeegner.iwasawaClass.**

Node: `GeneralizedHeegnerCycles:GH.3/iwasawa-heegner-class`.

After the first-step adapter, the sequence (α^{-n}z_{c₀p^n,α})_n, with its compatible coefficient projections, defines z_f in H¹_Iw(K_{c₀p∞},T). Keep the finite ring-class quotient Δ distinct from the anticyclotomic Γ≅Z_p and from a possible Δ-character projection. A finite-order nontrivial character of exact p-conductor n specializes to α^{-n}z_{f,χ}; Shapiro identifies the inverse limit with cohomology of the completed coefficient representation, with the inversion convention explicit.

Hypotheses and conventions:

- ap unit, compatible stable lattice, trace lemma including n=0, continuous coefficient twist.

Construction or proof:

1. Normalize by α^{-n}; use the exact trace equation at every layer.
2. Use IW and iwasawa-shapiro rather than rebuilding Iwasawa cohomology.
3. Take the finite Δ projection or corestriction before passing to the Γ module.

Uses of this interface:

- **GeneralizedHeegnerCycles:GH.4/castella-hsieh-abel-jacobi-formula-and-big-logarithm-reciprocity**: Supplies the functional class in the reciprocity law.
- **GeneralizedHeegnerCycles:GH.5/higher-weight-kolyvagin-class**: Supplies the inverse-limit class to which derivative operators are applied.

Planning API:

- **TauCeti.GeneralizedHeegner.iwasawaClass_level** (projection): The conductor-n projection is α^{-n}z_n.
- **TauCeti.GeneralizedHeegner.iwasawaClass_norm** (relation): The normalized sequence is corestriction compatible.
- **TauCeti.GeneralizedHeegner.iwasawaClass_character** (compatibility): A nontrivial exact conductor-n character specialization gives α^{-n} times the weighted finite-level class.

Unit tests:

- **TauCeti.GeneralizedHeegner.iwasawaClass_bottom** (degenerate): The bottom projection has normalization α⁰=1.
- **TauCeti.GeneralizedHeegner.iwasawaClass_unit_one** (computation): If α=1 the sequence is unchanged.
- **TauCeti.GeneralizedHeegner.iwasawaClass_sign** (non-example): At α=−1 level 1 changes sign; at α=2 and a nonzero class over Q it is one half of the class, not twice the class. The latter distinguishes α^{-n} from α^n.

Acceptance checks:

- Corestriction of α^{-(n+1)}z_{n+1,α} equals α^{-n}z_{n,α}.

Direct prerequisites:

- `GeneralizedHeegnerCycles:GH.3/stabilized-first-step-adapter`
- `SelmerIwasawaCohomology:L3/iwasawa-cohomology`
- `SelmerIwasawaCohomology:L3/iwasawa-shapiro`
- `HeegnerPointEulerSystems:HE.0/ring-class-tower-quotients`

Source passages:

- [Heegner cycles and p-adic L-functions](https://www.math.ntu.edu.tw/~mlhsieh/research/HCES.pdf), §5.2, following Lemma 5.3 and (5.8), pp.23–24. The norm-compatible class is the input to the big logarithm.

### GH.3.4. Longo–Vigni trace polynomials

**Construction — TauCeti.GeneralizedHeegner.tracePolynomial.**

Node: `GeneralizedHeegnerCycles:GH.3/longo-vigni-trace-polynomials`.

In O_p[G(n)] define ρ=p^{k/2}−a_pσ_p+p^{(k−2)/2}σ_p², its conjugate ρ̄, and Φ=ρρ̄. Let γ₀=a_p−p^{(k−2)/2}(σ_p+σ_p̄), γ₁=a_pγ₀−p^{k−2}δ and γ_m=a_pγ_{m−1}−p^{k−1}γ_{m−2} for m≥2. Here δ is the fixed ring-class-to-Γ degree in LV §4.1, not a freely chosen constant. LV Lemma 4.2 gives q_m with γ_m=q_mΦ+p^{(m−1)k/2}r_m for m≥2 and q_{m+1}≡a_pq_m mod p, q₂=1.

Hypotheses and conventions:

- Even k≥4, LV coefficient and tower conventions, finite quotient split from Γ; ordinary ap.

Construction or proof:

1. Obtain the raw trace sequence from the cycle norm recurrence and finite quotient corestriction.
2. Apply the polynomial recurrence and LV Lemma 4.2’s inductive division.

Uses of this interface:

- **GeneralizedHeegnerCycles:GH.3/trace-polynomial-intersection**: Controls the stable image of the corestriction sequence.
- **GeneralizedHeegnerCycles:GH.3/universal-norm-heegner-class**: Pins the bottom universal-norm class Φz_n.

Planning API:

- **TauCeti.GeneralizedHeegner.tracePolynomial_initial** (projection): The first two values are γ₀ and γ₁.
- **TauCeti.GeneralizedHeegner.tracePolynomial_recurrence** (relation): γ_{m+2}=a_pγ_{m+1}−p^{k−1}γ_m.
- **TauCeti.GeneralizedHeegner.tracePolynomial_remainder** (data): The higher terms equal q_mΦ plus the explicitly p-divisible remainder.

Unit tests:

- **TauCeti.GeneralizedHeegner.tracePolynomial_two** (computation): The second recurrence value is apγ₁−qγ₀.
- **TauCeti.GeneralizedHeegner.tracePolynomial_zero** (degenerate): Zero initial values give the zero sequence.
- **TauCeti.GeneralizedHeegner.tracePolynomial_error_power** (non-example): At k=4,m=2 the LV error is divisible by p², not p⁴.

Acceptance checks:

- γ₂ has leading term Φ; the error has p^{k/2} divisibility.

Direct prerequisites:

- `GeneralizedHeegnerCycles:GH.2/cycle-norm-relations`
- `HeegnerPointEulerSystems:HE.0/ring-class-tower-quotients`
- `mathlib:LinearMap`

Source passages:

- [Kolyvagin systems and Iwasawa theory of generalized Heegner cycles](https://arxiv.org/pdf/1605.03168), §4.1, Lemmas 4.1–4.2, pp.12–13. Controls the remainder and q_m modulo p.

### GH.3.5. Trace polynomial intersection theorem

**Theorem — TauCeti.GeneralizedHeegner.tracePolynomialIntersection.**

Node: `GeneralizedHeegnerCycles:GH.3/trace-polynomial-intersection`.

For a finitely generated O_p[G(n)]-module M in LV’s setting, ordinarity and the q_m estimates imply ΦM=⋂_m γ_mM. This is equality of images/submodules. After augmentation, eventual equality of the corresponding ideals is what is used, not literal equality γ_m=Φ.

Hypotheses and conventions:

- LV tower and p-adic finite coefficient ring; a_p unit; finitely generated M.

Construction or proof:

1. Reduce q_m modulo p, showing the successive q_m are units.
2. Use the increasingly p-divisible remainder and p-adic completeness to compute the stable intersection.

Acceptance checks:

- Multiplying a generator by a unit changes its value but not the principal ideal.

Direct prerequisites:

- `GeneralizedHeegnerCycles:GH.3/longo-vigni-trace-polynomials`

Source passages:

- [Kolyvagin systems and Iwasawa theory of generalized Heegner cycles](https://arxiv.org/pdf/1605.03168), §4.1, Corollary 4.3, p.13. Identifies ΦM with the intersection of γ_mM.

### GH.3.6. Universal norm Heegner class

**Construction — TauCeti.GeneralizedHeegner.universalNormClass.**

Node: `GeneralizedHeegnerCycles:GH.3/universal-norm-heegner-class`.

Let H_m[n] be the O_p[Gal(K_m[n]/K)] submodule generated by the restrictions of z_n and by the trace classes α_j[n], j≤m, and H_∞[n]=lim_cor H_m[n]. LV Proposition 4.5 constructs β[n]∈H_∞[n] with β₀[n]=Φz_n and cor_{K_∞[nℓ]/K_∞[n]}β[nℓ]=a_ℓβ[n] for the permitted inert ℓ. The finite Δ corestriction and p∤h_K are retained; this construction is not identified with the CH α-stabilized sequence without the normalization comparison.

Hypotheses and conventions:

- LV admissible triple; finite quotient of order prime to p; tower control.

Construction or proof:

1. Use the trace-polynomial stable image to make each finite bottom lift nonempty.
2. Use compactness of the inverse system of finite lift sets for a simultaneous norm-compatible class.
3. Transport the tame trace relation through the universal lift construction.

Uses of this interface:

- **GeneralizedHeegnerCycles:GH.5/higher-weight-kolyvagin-class**: Provides conductor-indexed universal norms for differentiation.
- **GeneralizedHeegnerCycles:GH.6/universal-norm-module-rank-one**: Defines the generator module H∞ whose nonvanishing is established separately.

Planning API:

- **TauCeti.GeneralizedHeegner.universalNormClass_bottom** (projection): β₀[n]=Φz_n.
- **TauCeti.GeneralizedHeegner.universalNormClass_norm** (relation): Each upper component corestricts to the preceding component.
- **TauCeti.GeneralizedHeegner.universalNormClass_tame** (functoriality): Corestriction along an inert auxiliary prime is multiplication by a_ℓ.

Unit tests:

- **TauCeti.GeneralizedHeegner.universalNormClass_bottom_test** (characterisation): The zero-level projection keeps Φ rather than dropping it.
- **TauCeti.GeneralizedHeegner.universalNormClass_zero** (degenerate): Choosing the zero lift for zero geometric input gives the zero sequence.
- **TauCeti.GeneralizedHeegner.universalNormClass_two_steps** (compatibility): Two successive corestrictions equal the corestriction across two levels.

Acceptance checks:

- The bottom class is Φz_n, not simply z_n.

Direct prerequisites:

- `GeneralizedHeegnerCycles:GH.3/trace-polynomial-intersection`
- `SelmerIwasawaCohomology:L3/iwasawa-cohomology`
- `HeegnerPointEulerSystems:HE.0/ring-class-tower-quotients`
- `SelmerIwasawaCohomology:L4/bloch-kato-condition`

Source passages:

- [Kolyvagin systems and Iwasawa theory of generalized Heegner cycles](https://arxiv.org/pdf/1605.03168), §4.2, Definition 4.4 and Proposition 4.5, pp.13–14. Constructs the compatible β[n] and fixes its bottom value.

## GH.4. Explicit reciprocity and p-adic Abel–Jacobi formulas

The BDP squared special value includes the unramified weight-two boundary. The CH ramified-character logarithm, its bounded regulator identity and its dual-exponential range are separate declarations. The linear square-root measure belongs to L3h; its cycle identity belongs here. Differential rescaling and regulator normalization connect their periods and Euler factors.

Coverage: **planned**. Remaining proof closure: Ramified conductor-one logarithm boundary; Generic local regulator Part II.

Atlas planets: BDP special value formula; Ramified Abel–Jacobi formula; Castella–Hsieh reciprocity law; Dual exponential formula.

### GH.4.1. BDP special value formula

**Theorem — TauCeti.GeneralizedHeegner.bdpSpecialValue.**

Node: `GeneralizedHeegnerCycles:GH.4/bdp-special-value-formula`.

Under BDP Assumption 5.12 (normalized f∈S_k(Γ₀(N),ε_f), odd c prime to Nd_K, odd discriminant K with the stated Heegner ideal, split p prime to Nc, and the finite-local-sign conditions on Σ_cc), let m=k−2 and χ∈Σ_cc^(1) have infinity type (k−1−j,1+j), 0≤j≤m. Then L_p(f,χ)/Ω_p^{2(m−2j)}=(1−χ^{-1}(p̄)a_p+χ^{-2}(p̄)ε_f(p)p^{k−1})² · (c^{−j}/j! · Σ_[a]∈Pic(O_c) χ^{-1}(a)N(a) AJ_F(Δ_{φ_aφ₀})(ω_f⊗ω_A^jη_A^{m−j}))². This is a special value of the squared BDP function, not a complex derivative. The underlying GL₂ square-root distribution and its interpolation are imported from L3h. GZ.9 consumes the m=0 specialization of this one owner; quaternionic formulas and exceptional branches remain in GZ.9.

Hypotheses and conventions:

- All five clauses of BDP Assumption 5.12; CM differential, periods, representatives and geometric reciprocity fixed.

Construction or proof:

1. Import BDP’s p-adic modular interpolation and continuity from L3h; approximate the noninterpolating character by characters in Σ_cc^(2).
2. Apply the depleted Coleman component calculation to the continued negative θ power.
3. Use the p-depletion Euler identity, change the ideal class variables, and apply the isogeny degree d=cN(a) in the Coleman AJ formula.

Acceptance checks:

- At m=j=0 the factorial and c power are 1; the degree-zero correction remains. A vanishing Euler polynomial forces this special value to vanish without forcing each cycle to vanish.

Direct prerequisites:

- `GeneralizedHeegnerCycles:GH.1/coleman-abel-jacobi-formula`
- `GeneralizedHeegnerCycles:GH.1/coleman-depletion-calculation`
- `AutomorphicPadicLFunctions:L3h`

Source passages:

- [Generalized Heegner cycles and p-adic Rankin L-series](https://www.math.mcgill.ca/darmon/pub/Articles/Research/51.BDP1/duke-publishedversion.pdf), §5.3, Assumption 5.12 and Theorem 5.13, pp.1137–1139. The range, squared Euler polynomial and c^{-j}/j! weighted AJ sum are explicit.

### GH.4.2. CM differential scaling

**Lemma — TauCeti.GeneralizedHeegner.cmDifferentialScaling.**

Node: `GeneralizedHeegnerCycles:GH.4/cm-differential-scaling`.

Under ω_A↦aω_A and η_A↦a^{-1}η_A with a≠0, the AJ evaluation on ω_A^jη_A^{m−j} scales by a^{2j−m}, and its square scales by a^{2(2j−m)}. The period Ω_p scales by a in the matching convention, so BDP’s normalized equation transforms consistently. These are signed integer exponents, not truncated natural subtraction.

Hypotheses and conventions:

- Nonzero a and the pairing normalization ⟨ω_A,η_A⟩=1.

Construction or proof:

1. Use multilinearity of the symmetric tensor evaluation and the reciprocal normalization of η.
2. Square and compare the signed period exponent on the other side.

Acceptance checks:

- For m=2,j=0 the evaluation scales by a^{-2}; using a^0 from natural subtraction fails.

Direct prerequisites:

- `GeneralizedHeegnerCycles:GH.0/cm-character-decomposition`
- `GeneralizedHeegnerCycles:GH.4/bdp-special-value-formula`

Source passages:

- [Generalized Heegner cycles and p-adic Rankin L-series](https://www.math.mcgill.ca/darmon/pub/Articles/Research/51.BDP1/duke-publishedversion.pdf), §1.4, (1.4.2)–(1.4.3), pp.1052–1053. The normalization determines reciprocal scaling of η.

### GH.4.3. Ramified character Abel–Jacobi formula

**Theorem — TauCeti.GeneralizedHeegner.ramifiedCharacterAJ.**

Node: `GeneralizedHeegnerCycles:GH.4/ramified-character-abel-jacobi-formula`.

In CH Theorem 4.9 let ψ have type (r,−r), conductor c₀ prime to Np, and φ type (r+j,−j−r), −r<j<r, with exact conductor p^n, n≥1; put χ=ψ̂^{-1}φ̂. Then L_{p,ψ}(f)(φ̂^{-1})/Ω_p^{−2j}=[g(φ_p^{-1})φ_p(p^n)c₀^{1−r}ψ̂_p^{-1}(p^n)/(r−1+j)!] · ⟨log_p z_{f,χ},ω_f⊗ω_A^{r−1+j}η_A^{r−1−j}t^{1−2r}⟩. This evaluates the linear square-root distribution, and the proof’s exact conductor cancellations cannot substitute for BDP’s unramified Euler polynomial.

Hypotheses and conventions:

- CH setup and critical interval; exact ramified conductor n≥1; periods and geometric reciprocity fixed.

Construction or proof:

1. Relate the weighted corestriction class to the CM sum using Lemma 4.5.
2. Use the CM expansion of the p-adic L-function, the Gauss sum identity and the Coleman AJ evaluation.
3. For the cancellation using exact conductor n>1, establish the n=1 boundary separately; the boundary is a recorded refinement.

Acceptance checks:

- At j=0 the factorial is (r−1)! and the t factor is t^{1−2r}; squaring is not part of this equation.

Direct prerequisites:

- `GeneralizedHeegnerCycles:GH.1/character-projected-heegner-class`
- `GeneralizedHeegnerCycles:GH.1/coleman-abel-jacobi-formula`
- `AutomorphicPadicLFunctions:L3h`

Source passages:

- [Heegner cycles and p-adic L-functions](https://www.math.ntu.edu.tw/~mlhsieh/research/HCES.pdf), §4.5, Theorem 4.9, pp.19–21. The ramified conductor, factorial and period/Tate factors are explicit.

### GH.4.4. Fixed-weight regulator specialization

**Comparison — TauCeti.GeneralizedHeegner.fixedWeightRegulator.**

Node: `GeneralizedHeegnerCycles:GH.4/fixed-weight-regulator-adapter`.

Apply the supplier’s relative Lubin–Tate Perrin–Riou map to V=V_f(r)⊗ψ̂^{-1}, whose F⁺ line is unramified after this twist. Pair with ω_f⊗t^{−2r} and the CM period identifications η_A=t_A^{-1}t, ω_A=t_A=Ω_pt. CH Theorem 5.1’s specialization in the positive logarithmic range and the dual exponential range supplies the epsilon, Euler and factorial factors; the density argument in Theorem 5.7 uses ramified n>1 characters and the epsilon identity ε(φ̂)=g(φ_p^{-1})φ_p(−p^n). The finite unramified base change and Γ̃ finite quotient are part of the map.

Hypotheses and conventions:

- Theorem 5.1 hypotheses: nonnegative Hodge–Tate weights, no trivial quotient and no invariants on the relevant tower; ordinary rank-one line and matched twists.

Construction or proof:

1. Import the relative Lubin–Tate regulator as an extension of L3 rather than a duplicate construction.
2. Match the de Rham differential and t powers, then compare the interpolation factor at exact ramified characters.

Acceptance checks:

- The line unramified before a Tate twist need not stay unramified after the twist; ψ is part of the repair.

Direct prerequisites:

- `PadicHodgeRegulators:L3`
- `GeneralizedHeegnerCycles:GH.3/iwasawa-heegner-class`
- `GeneralizedHeegnerCycles:GH.4/ramified-character-abel-jacobi-formula`

Source passages:

- [Heegner cycles and p-adic L-functions](https://www.math.ntu.edu.tw/~mlhsieh/research/HCES.pdf), §5.1 and §5.3, Theorem 5.1, Lemma 5.5 and proof of Theorem 5.7, pp.21–25. Supplies the relative regulator whose scalar normalization is used.

### GH.4.5. Castella–Hsieh explicit reciprocity law

**Theorem — TauCeti.GeneralizedHeegner.castellaHsiehReciprocity.**

Node: `GeneralizedHeegnerCycles:GH.4/castella-hsieh-abel-jacobi-formula-and-big-logarithm-reciprocity`.

Under CH §5, in Λ_{F̂^ur}(Γ̃), ⟨L_{p,ψ}(z_f),ω_f⊗t^{−2r}⟩=−c₀^{r−1} L_{p,ψ}(f)·σ_{−1,p}, where σ_{−1,p}=rec_p(−1)|_{K_{c₀p∞}} has order dividing 2. The analytic side is the linear square-root distribution. The sign, c₀ power and group-algebra translation remain in the identity; equality after squaring loses this normalization.

Hypotheses and conventions:

- Ordinary f; ψ of type (r,−r) and conductor c₀ prime to Np; the first-step class adapter and regulator interpolation checked.

Construction or proof:

1. Use the preceding regulator adapter and CH 4.9 at a dense set of exact-conductor n>1 characters with j=0.
2. The epsilon identity contributes φ_p(−1), producing σ_{−1,p}; collect c₀^{r−1} and the sign.
3. Use boundedness (Lemma 5.5) and Weierstrass density to conclude equality of Iwasawa algebra elements.

Acceptance checks:

- After augmenting the Artin operator one still has −c₀^{r−1}; a measure equality without these factors is a different normalization.

Direct prerequisites:

- `GeneralizedHeegnerCycles:GH.4/fixed-weight-regulator-adapter`
- `GeneralizedHeegnerCycles:GH.3/iwasawa-heegner-class`
- `AutomorphicPadicLFunctions:L3h`

Source passages:

- [Heegner cycles and p-adic L-functions](https://www.math.ntu.edu.tw/~mlhsieh/research/HCES.pdf), §5.3, Theorem 5.7 and proof, pp.24–25. The linear reciprocity law retains −c₀^{r−1} and σ_{−1,p}.

### GH.4.6. Dual exponential special value

**Theorem — TauCeti.GeneralizedHeegner.dualExponentialValue.**

Node: `GeneralizedHeegnerCycles:GH.4/dual-exponential-special-value`.

CH Corollary 5.8 gives, in the j≥r range, ⟨exp*loc(z_{f}^{χ^{-1}}),ω_f⊗ω_A^{−j−r}η_A^{j−r}⟩² = c_{f,K}(e′_p(f,χ))²(p^{2r−1}/α²)^n χ^{-1}ψ(𝔑)L_alg(f,χ,r)/Γ(j−r+1)², with c_{f,K}=8u_K²√D_K c₀^{2r−1}ε(f). For n>0 e′_p=1; for n=0 it is (1−α^{-1}χ(σ_p)p^{r−j−1})(1−α^{-1}χ(σ_p̄)p^{r−j−1}). This is the local nonvanishing input to rank zero, distinct from the logarithmic critical range.

Hypotheses and conventions:

- Ordinary f and CH’s locally algebraic character and period normalization; j≥r; α unit root.

Construction or proof:

1. Use the dual-exponential specialization of the regulator.
2. Combine CH 5.7 with the analytic interpolation and functional equation; square to express the normalized central complex value.

Acceptance checks:

- At positive conductor there is no unramified e′_p factor; a nonzero L-value gives nonzero local dual exponential.

Direct prerequisites:

- `GeneralizedHeegnerCycles:GH.4/castella-hsieh-abel-jacobi-formula-and-big-logarithm-reciprocity`
- `AutomorphicPadicLFunctions:L3h`
- `PadicHodgeRegulators:L3`

Source passages:

- [Heegner cycles and p-adic L-functions](https://www.math.ntu.edu.tw/~mlhsieh/research/HCES.pdf), §5.3, Corollary 5.8, pp.25–26. The squared exponential formula and the n=0/n>0 Euler factors are separate.

## GH.5. Higher-weight Kolyvagin system and arithmetic hypotheses

Admissibility, Howard hypotheses, local assumptions and specialization control are checked before importing generic descent. The geometric construction supplies the unit-corrected, auxiliary-group-valued Kolyvagin system. The abstract DVR and Λ theorems belong to ES.5 and ES.8. The nonzero initial class is an input from GH.6, so it is not presumed in the definition.

Coverage: **planned**. Remaining proof closure: Corrected integral p-condition adapter; LV local twist and integral local verification.

Atlas planets: Admissible triple; Higher-weight Kolyvagin system; Longo–Vigni bound.

### GH.5.1. Longo–Vigni admissible triple

**Definition — TauCeti.GeneralizedHeegner.admissibleTriple.**

Node: `GeneralizedHeegnerCycles:GH.5/longo-vigni-admissible-triple`.

LV Definition 2.1 excludes primes in Ξ: those dividing 6N(k−2)!φ(N)c_f, or for which im ρ_{f,p} does not contain {g∈GL₂(O_F⊗Z_p):det g∈(Z_p×)^{k−1}}. Require also p∤h_K, p unramified in F, p split in K, and a_p∈O_p×. Fix k≥4 even, (D_K,N)=1 with all primes of N split in K and O_K×={±1}; thus K=Q(i),Q(√−3) are excluded in this application. c_f is the integral index specified by the newform lattice, not an arbitrary normalizing scalar.

Hypotheses and conventions:

- LV §1–2 coefficient field and lattice conventions; all four admissibility clauses and its CM-unit restriction.

Construction or proof:

1. Import the newform lattice and residual representation from R14.3/R19.1.
2. Form the actual exceptional set and check each arithmetic and image condition separately.

Uses of this interface:

- **GeneralizedHeegnerCycles:GH.5/higher-weight-howard-hypotheses**: Provides the residual and finite-quotient input to H0–H5.
- **GeneralizedHeegnerCycles:GH.6/lambda-structure-consequence**: Limits the higher-weight Iwasawa application to the actual source hypotheses.

Planning API:

- **TauCeti.GeneralizedHeegner.admissibleTriple_exceptional** (projection): Admissibility implies p∤6N(k−2)!φ(N)c_f.
- **TauCeti.GeneralizedHeegner.admissibleTriple_classNumber** (projection): Admissibility implies p∤h_K, so the finite ring-class quotient has prime-to-p order.
- **TauCeti.GeneralizedHeegner.admissibleTriple_ordinary** (projection): The ordinary Fourier coefficient is a unit, not merely nonzero in F.
- **TauCeti.GeneralizedHeegner.admissibleTriple_bigImage** (data): The source p-adic image must contain the determinant-restricted subgroup, not merely be irreducible.

Unit tests:

- **TauCeti.GeneralizedHeegner.admissibleTriple_two** (non-example): p=2 always belongs to the excluded set.
- **TauCeti.GeneralizedHeegner.admissibleTriple_class_number** (non-example): If p divides h_K the triple is excluded even when its Fourier coefficient is a unit.
- **TauCeti.GeneralizedHeegner.admissibleTriple_unit** (compatibility): The ordinarity projection is Mathlib’s unit predicate in O_p.

Acceptance checks:

- Ordinary a_p alone is insufficient; p∤h_K and the specified big image are independent requirements.

Direct prerequisites:

- `GeneralizedHeegnerCycles:GH.0/newform-cm-projector`
- `HeegnerPointEulerSystems:HE.0/ring-class-tower-quotients`
- `AutomorphicGaloisRepresentations:R19.1`

Source passages:

- [Kolyvagin systems and Iwasawa theory of generalized Heegner cycles](https://arxiv.org/pdf/1605.03168), §2.2, Definition 2.1 and Remark 2.2, pp.4–5. The exceptional set and four clauses fix the application’s hypotheses.

### GH.5.2. Higher-weight Howard hypotheses

**Comparison — TauCeti.GeneralizedHeegner.higherWeightHowardHypotheses.**

Node: `GeneralizedHeegnerCycles:GH.5/higher-weight-howard-hypotheses`.

For LV’s T⊗Λ and each permitted height-one specialization S_P, verify the imported Howard H0–H5: rank two freeness; absolute residual irreducibility; the auxiliary extension and residual cohomology vanishing; Cartesian propagation of every local condition; a perfect self-dual pairing; and the τ-decomposition with its compatible sign. LV Lemma 2.4 gives A[p](K_∞)=0 from its determinant-restricted big image and solvable ring-class tower. Proposition 3.3 then verifies the specialization hypotheses. The pairing, local Cartier property and admissible auxiliary primes are actual verification obligations, not definitions of the source’s classes.

Hypotheses and conventions:

- LV admissibility; coefficients and τ action fixed; all hypotheses of ES.5 stated by its exact supplier node.

Construction or proof:

1. Use the residual representation and solvable tower to show invariant vanishing.
2. Apply compact inflation–restriction to propagate this to specializations.
3. Check each local condition and pairing against ES.5/howard-hypotheses and use its auxiliary-prime theorem.

Acceptance checks:

- A self-dual pairing alone does not imply Cartesian propagation at p.

Direct prerequisites:

- `GeneralizedHeegnerCycles:GH.5/longo-vigni-admissible-triple`
- `EulerSystemsAndKolyvaginSystems:ES.5/howard-hypotheses`
- `ArithmeticGaloisDuality:R02.2/compact-five-term`

Source passages:

- [Kolyvagin systems and Iwasawa theory of generalized Heegner cycles](https://arxiv.org/pdf/1605.03168), §5.1, verification of (H.0)–(H.5), pp.18–19; Lemma 2.4, p.5. The higher-weight application verifies generic Howard hypotheses at S_P.

### GH.5.3. Longo–Vigni local assumptions

**Comparison — TauCeti.GeneralizedHeegner.longoVigniLocalAssumptions.**

Node: `GeneralizedHeegnerCycles:GH.5/longo-vigni-local-assumptions`.

LV Assumption 3.2 requires V crystalline at p; a rank-one ordinary filtration of T whose F⁻T has trivial inertia; F⁺T and F⁺A exact annihilators under local duality; and finiteness of H⁰(K_{∞,v},F⁻A) and H⁰(K_v,F⁻A). These clauses are kept as application hypotheses. For the self-dual higher-weight twist, the untwisted ordinary quotient’s unramifiedness is not itself proof of trivial inertia on F⁻T: its Tate character must be tracked. Resolve this with the edition’s representation convention or a stronger applicable control theorem before claiming the unconditional application.

Hypotheses and conventions:

- LV §3.1 Assumption 3.2, rather than ordinarity alone; explicit local representation convention.

Construction or proof:

1. Write the local ordinary characters before and after the Tate twist.
2. Compare annihilators with the exact local duality pairing.
3. Check the two H⁰ groups and the control input; keep the missing twist verification as a gap.

Acceptance checks:

- Multiplying an unramified character by a nontrivial cyclotomic power usually changes its inertia action.

Direct prerequisites:

- `GeneralizedHeegnerCycles:GH.5/longo-vigni-admissible-triple`
- `SelmerIwasawaCohomology:L4/bloch-kato-condition`
- `EulerSystemsAndKolyvaginSystems:ES.5/howard-hypotheses`
- `PadicHodgeRegulators:L3`

Source passages:

- [Kolyvagin systems and Iwasawa theory of generalized Heegner cycles](https://arxiv.org/pdf/1605.03168), §3.1, Assumption 3.2, pp.8–9. All local clauses are necessary in the theorem’s hypothesis package.

### GH.5.4. Specialization and exceptional-prime control

**Comparison — TauCeti.GeneralizedHeegner.specializationControl.**

Node: `GeneralizedHeegnerCycles:GH.5/specialization-control`.

LV Proposition 3.4 compares the specialized Selmer module with the S_P Selmer group, with kernel and cokernel finite and bounded in terms of [S_P:Λ/P], away from a finite exceptional set. Use the actual H⁰ and local annihilator hypotheses of Assumption 3.2. This is the application’s control input for the ES.8 height-one patching theorem, including perturbed primes (g+p^m), rather than a blanket isomorphism at every prime.

Hypotheses and conventions:

- LV local assumptions, finite-exception exclusion, no residual tower invariants; finite degree specialization.

Construction or proof:

1. Use compact inflation–restriction and local-condition propagation to construct the specialization map.
2. Bound both global and local error terms and identify the finite exceptional set.
3. Feed the bounded comparison to ES.8’s patching hypothesis.

Acceptance checks:

- The pΛ prime is excluded from the unramified height-one comparison; its contribution is controlled separately.

Direct prerequisites:

- `GeneralizedHeegnerCycles:GH.5/higher-weight-howard-hypotheses`
- `GeneralizedHeegnerCycles:GH.5/longo-vigni-local-assumptions`
- `SelmerIwasawaCohomology:L2/galois-selmer-group`
- `EulerSystemsAndKolyvaginSystems:ES.8/self-dual-lambda-adic-kolyvagin-bound`

Source passages:

- [Kolyvagin systems and Iwasawa theory of generalized Heegner cycles](https://arxiv.org/pdf/1605.03168), §3.1, Proposition 3.4, pp.10–11. Provides bounded control outside finitely many primes.

### GH.5.5. Higher-weight Kolyvagin system

**Construction — TauCeti.GeneralizedHeegner.correctedKolyvaginClass.**

Node: `GeneralizedHeegnerCycles:GH.5/higher-weight-kolyvagin-class`.

Starting from LV β[n], apply D_n=∏_{ℓ|n}Σ_{i=1}^{|G_ℓ|−1}iσ_ℓ^i, sum over the specified coset representatives, reduce modulo I_n and descend uniquely using residual invariant vanishing. The raw κ_n satisfy the finite–singular relation up to units u_ℓ determined by Nekovář/CH’s local calculation. Set κ′_n=(∏_{ℓ|n}u_ℓ)^{-1}κ_n⊗⊗_{ℓ|n}σ_ℓ. This lies in the imported ES.3 Kolyvagin-system module and has κ′₁=κ₁. Transverse local membership and the p-condition are separate checks; κ₁≠0 is supplied by GH.6, not by the definition.

Hypotheses and conventions:

- LV admissible tower and the required local assumptions; choices of generators fixed then checked for independence; coefficient and admissible-prime ideals as in ES.5.

Construction or proof:

1. Apply the derivative norm identity and residual invariant vanishing to obtain descent.
2. Use the tame Frobenius congruence for finite–singular comparison and CH’s K2 correction units.
3. Verify local conditions at p and auxiliary primes, then apply the unit correction to obtain a genuine generic KS.

Uses of this interface:

- **GeneralizedHeegnerCycles:GH.5/longo-vigni-admissibility-and-the-lambda-adic-bound**: Supplies the nontrivial higher-weight input to generic Howard descent.
- **GeneralizedHeegnerCycles:GH.6/universal-norm-module-rank-one**: Its leading class generates H∞ after the nonvanishing proof.

Planning API:

- **TauCeti.GeneralizedHeegner.correctedKolyvaginClass_unit** (relation): The local correction is the inverse product of u_ℓ, with each u_ℓ a unit.
- **TauCeti.GeneralizedHeegner.correctedKolyvaginClass_bottom** (projection): At n=1 the correction leaves κ₁ unchanged.
- **TauCeti.GeneralizedHeegner.correctedKolyvaginClass_fs** (compatibility): The corrected localization satisfies the exact generic finite–singular square.
- **TauCeti.GeneralizedHeegner.correctedKolyvaginClass_generator** (functoriality): Changing σ_ℓ rescales the derivative coefficient and the G_ℓ tensor by reciprocal factors, preserving the intrinsic class.

Unit tests:

- **TauCeti.GeneralizedHeegner.correctedKolyvaginClass_empty** (degenerate): The empty correction product is 1 and κ′₁=κ₁.
- **TauCeti.GeneralizedHeegner.correctedKolyvaginClass_minus** (computation): A correction u=−1 negates the raw class.
- **TauCeti.GeneralizedHeegner.correctedKolyvaginClass_wrong_unit** (non-example): Replacing a correction unit by 0 kills the class and cannot give an equivalent system.

Acceptance checks:

- At n=1 the empty derivative and unit products are 1, so the initial class is unchanged.

Direct prerequisites:

- `GeneralizedHeegnerCycles:GH.3/universal-norm-heegner-class`
- `GeneralizedHeegnerCycles:GH.2/cycle-frobenius-congruence`
- `GeneralizedHeegnerCycles:GH.2/local-condition-at-p-and-the-castella-hsieh-corrections`
- `GeneralizedHeegnerCycles:GH.5/higher-weight-howard-hypotheses`
- `GeneralizedHeegnerCycles:GH.5/longo-vigni-local-assumptions`
- `EulerSystemsAndKolyvaginSystems:ES.3/kolyvagin-system-module`

Source passages:

- [Kolyvagin systems and Iwasawa theory of generalized Heegner cycles](https://arxiv.org/pdf/1605.03168), §4.3, Lemma 4.6 and Theorem 4.7, pp.14–16. The corrected classes form the KS; nonzero leading term has a separate proof.

### GH.5.6. Conditional Longo–Vigni bound

**Theorem — TauCeti.GeneralizedHeegner.longoVigniBound.**

Node: `GeneralizedHeegnerCycles:GH.5/longo-vigni-admissibility-and-the-lambda-adic-bound`.

Given the verified higher-weight H0–H5, local Assumption 3.2, bounded specialization control and κ′₁≠0, import ES.5’s DVR theorem and ES.8’s Λ theorem. The pro-Selmer module is torsion free of Λ-rank one and X is pseudo-isomorphic to Λ⊕M⊕M with M torsion, char(M)=char(M)^ι and char(M) dividing char(Selhat/Λκ′₁). In ideal-containment language char(Selhat/Λκ′₁)⊆char(M). This is a conditional application of generic descent; it does not re-plan Howard’s theory or reverse the divisibility. GH.6 supplies κ′₁≠0 and identifies Λκ′₁ with H∞.

Hypotheses and conventions:

- All application inputs explicitly verified; generic ES.8 patching assumptions, including height-one symmetry, hold.

Construction or proof:

1. Apply the imported generic DVR bound at each permitted S_P.
2. Use the finite exceptional-set and perturbed-prime control to patch and establish characteristic-ideal symmetry.
3. Keep κ′₁ nonzero as a hypothesis here to avoid a dependency cycle with GH.6.

Acceptance checks:

- The asserted inequality is an upper bound on the torsion length; equality is the separate main conjecture.

Direct prerequisites:

- `GeneralizedHeegnerCycles:GH.5/higher-weight-kolyvagin-class`
- `GeneralizedHeegnerCycles:GH.5/specialization-control`
- `EulerSystemsAndKolyvaginSystems:ES.8/self-dual-lambda-adic-kolyvagin-bound`

Source passages:

- [Kolyvagin systems and Iwasawa theory of generalized Heegner cycles](https://arxiv.org/pdf/1605.03168), §3.1, Theorem 3.5, pp.11–12. States the rank, paired torsion structure and oriented divisibility.

## GH.6. Nonvanishing and source-qualified Selmer consequences

Analytic nonvanishing and explicit reciprocity provide nonzero cycle classes or complementary local classes. Fixed-weight CH descent gives rank one or rank zero under its own hypotheses. Eventual growth and corrected family parity are distinct consequences. Universal-norm generation is checked separately before identifying the module in the Λ bound.

Coverage: **planned**. Remaining proof closure: Corrected integral p-condition adapter; LV local twist and integral local verification; Analytic nonvanishing supplier; CH versus clean Howard descent; LV universal-norm identification; Parity supplier and sign convention.

Atlas planets: Anticyclotomic nonvanishing; Rank-one Selmer theorem; Rank-zero Selmer theorem; Selmer growth formula; Selmer parity theorem; Universal norm module.

### GH.6.1. Anticyclotomic nonvanishing

**Theorem — TauCeti.GeneralizedHeegner.anticyclotomicNonvanishing.**

Node: `GeneralizedHeegnerCycles:GH.6/anticyclotomic-nonvanishing`.

Under CH Theorem 3.9’s extra (N_f,D_K)=1, the square-root measure L_{p,ψ}(f) has nonzero value at all but finitely many finite-order anticyclotomic p-power characters. Its proof chooses an auxiliary coefficient prime ℓ with absolutely irreducible residual restriction to G_K and invokes Hsieh’s Theorem C after switching the analytic tower and auxiliary prime roles; this analytic theorem is requested from L3h. Combining nonzero values with the ramified logarithm formula gives nonzero z_{f,χφ} for all but finitely many finite-order φ in the critical interval. The analytic and algebraic conclusions retain their own hypotheses.

Hypotheses and conventions:

- CH §3 setup, (N_f,D_K)=1 and the auxiliary residual condition of Hsieh’s input; −r<j<r for the algebraic logarithm implication.

Construction or proof:

1. Import the precise mod-ℓ central-value nonvanishing theorem from L3h.
2. Show the bounded one-variable measure is not identically zero and apply p-adic Weierstrass preparation.
3. Use the nonzero interpolation constants in CH 4.9 to deduce nonzero localized class, hence nonzero global class.

Acceptance checks:

- A nonzero class follows from a nonzero local logarithm; a complex simple zero alone has no such implication here.

Direct prerequisites:

- `AutomorphicPadicLFunctions:L3h`
- `GeneralizedHeegnerCycles:GH.4/ramified-character-abel-jacobi-formula`

Source passages:

- [Heegner cycles and p-adic L-functions](https://www.math.ntu.edu.tw/~mlhsieh/research/HCES.pdf), §3, Theorem 3.9 and proof, p.14; §6, Theorem 6.1(2), p.27. The nonvanishing theorem has an explicit discriminant-level hypothesis.

### GH.6.2. Rank-one Selmer consequence

**Theorem — TauCeti.GeneralizedHeegner.selmerRankOne.**

Node: `GeneralizedHeegnerCycles:GH.6/selmer-rank-one`.

For CH Hypothesis (H), canonical CM data and an anticyclotomic χ of type (j,−j) with −r<j<r, if z_{f,χ}≠0 then Sel(K,V_f(r)⊗χ)=F·z_{f,χ}. Ordinarity is not required for this fixed-weight implication. CH Theorem 7.7 identifies the source local conditions with Bloch–Kato and supplies Euler-system descent; its higher-weight verification uses the actual local p-condition. The eventual nonvanishing assertion is supplied separately by the preceding node.

Hypotheses and conventions:

- CH (H): p∤2(2r−1)!Nφ(N), conductor χ prime to N, every prime of N split in K, p split; class nonzero; canonical CM/period setup.

Construction or proof:

1. Use the cycle norm, Frobenius and conjugation relations to verify CH’s anticyclotomic Euler-system axioms.
2. Import generic self-dual descent through ES.5 and verify CH’s finite local conditions via 7.7.
3. The resulting dimension bound plus a nonzero Selmer class gives equality with its one-dimensional span.

Acceptance checks:

- For z=0 the conclusion cannot be inferred; the nonzero hypothesis is essential.

Direct prerequisites:

- `GeneralizedHeegnerCycles:GH.2/cycle-norm-relations`
- `GeneralizedHeegnerCycles:GH.2/cycle-frobenius-congruence`
- `GeneralizedHeegnerCycles:GH.2/cycle-conjugation`
- `GeneralizedHeegnerCycles:GH.2/finite-local-abel-jacobi-class`
- `EulerSystemsAndKolyvaginSystems:ES.5/howard-hypotheses`
- `SelmerIwasawaCohomology:L2/galois-selmer-group`
- `EulerSystemsAndKolyvaginSystems:ES.5`

Source passages:

- [Heegner cycles and p-adic L-functions](https://www.math.ntu.edu.tw/~mlhsieh/research/HCES.pdf), §6, Theorem 6.1(1), p.27; §7.3, Theorem 7.7, pp.31–32. The nonzero-cycle implication is the critical-range Selmer statement.

### GH.6.3. Rank-zero Selmer consequence

**Theorem — TauCeti.GeneralizedHeegner.selmerRankZero.**

Node: `GeneralizedHeegnerCycles:GH.6/selmer-rank-zero`.

Under CH (H), for ordinary f and χ of type (j,−j) with j≥r or j≤−r, L(f,χ,r)≠0 implies Sel(K,V_f(r)⊗χ)=0. The dual-exponential special value supplies a nonzero local class in the complementary Euler-system condition; CH Theorem 7.9 and the corrected Proposition 7.8 local proof then force vanishing of the Bloch–Kato Selmer group. Use χ^{-1} and conjugation for the opposite range.

Hypotheses and conventions:

- Ordinary a_p; CH (H); outside the critical interval; nonzero normalized central value; corrected local condition adapter.

Construction or proof:

1. Apply the dual-exponential formula and nonvanishing interpolation constants.
2. Verify the specialized anticyclotomic Euler-system local axioms by the KO replacement.
3. Use local duality and generic Euler-system descent to eliminate the Bloch–Kato subspace.

Acceptance checks:

- In the critical interval the root number is −1; this theorem’s nonzero central-value hypothesis applies to the opposite range.

Direct prerequisites:

- `GeneralizedHeegnerCycles:GH.4/dual-exponential-special-value`
- `GeneralizedHeegnerCycles:GH.2/local-condition-at-p-and-the-castella-hsieh-corrections`
- `EulerSystemsAndKolyvaginSystems:ES.5/howard-hypotheses`
- `SelmerIwasawaCohomology:L2/galois-selmer-group`
- `EulerSystemsAndKolyvaginSystems:ES.5`

Source passages:

- [Heegner cycles and p-adic L-functions](https://www.math.ntu.edu.tw/~mlhsieh/research/HCES.pdf), §6, Theorem 6.2 and proof, p.27; §7.3, Theorem 7.9, p.32. The ordinary central-value implication uses the specialized local class.

### GH.6.4. Corrected Selmer growth formula

**Theorem — TauCeti.GeneralizedHeegner.selmerGrowth.**

Node: `GeneralizedHeegnerCycles:GH.6/selmer-consequences-with-the-corrected-dimension-formula`.

For the CH anticyclotomic ring-class p-tower, the eventual dimension is dim_F Sel(K_{p^n},V_{f,χ})=((1−ε(V_{f,χ}))/2)[K_{p^n}:K]+e with e≥0 independent of n. The root sign is −1 exactly for −r<j<r and +1 outside; thus the slope is 1 or 0. This is CH Theorem 6.3 in its corrected form, with the finite quotient and coefficient extensions in the character decomposition tracked.

Hypotheses and conventions:

- The fixed-weight CH setup and hypotheses used by Theorems 6.1–6.2; n sufficiently large; ordinary assumption for the rank-zero branch.

Construction or proof:

1. Use finite-level Shapiro and decompose into characters of the finite abelian tower quotient, extending coefficients and accounting for multiplicities.
2. Apply eventual nonvanishing and the rank-one/rank-zero results; finitely many exceptional characters contribute the constant e.
3. Insert the corrected factor (1−ε)/2 from the erratum.

Acceptance checks:

- For ε=+1 the dimensions stabilize; for ε=−1 their leading term is the tower degree.

Direct prerequisites:

- `GeneralizedHeegnerCycles:GH.6/anticyclotomic-nonvanishing`
- `GeneralizedHeegnerCycles:GH.6/selmer-rank-one`
- `GeneralizedHeegnerCycles:GH.6/selmer-rank-zero`
- `SelmerIwasawaCohomology:L3/iwasawa-shapiro`
- `HeegnerPointEulerSystems:HE.0/ring-class-tower-quotients`

Source passages:

- [Heegner cycles and p-adic L-functions](https://www.math.ntu.edu.tw/~mlhsieh/research/HCES.pdf), §6, Theorem 6.3, p.27. The revised author copy carries the corrected growth factor.
- [Erratum to Heegner cycles and p-adic L-functions](https://www.math.ntu.edu.tw/~mlhsieh/research/erratum2.pdf), First correction. The factor is (1−ε)/2.

### GH.6.5. Selmer parity

**Theorem — TauCeti.GeneralizedHeegner.selmerParity.**

Node: `GeneralizedHeegnerCycles:GH.6/selmer-parity`.

For ordinary f under CH (H), ord_{s=r}L(f,χ,s)≡dim_F Sel(K,V_f(r)⊗χ) mod 2. The proof uses Nekovář’s self-dual family parity theorem and its 2009 correction, plus one sufficiently ramified specialization whose Selmer dimension is 0 or 1 according to the root sign. The residue is (1−ε)/2 mod 2; ±1 itself cannot represent the two different residues modulo 2.

Hypotheses and conventions:

- Ordinary f; the self-dual induced family and its local parity hypotheses are supplied; the corrected Nekovář theorem applies.

Construction or proof:

1. Form the induced self-dual family and track its local plus-submodule in each j range.
2. Use nonvanishing and the two fixed-weight Selmer theorems to choose a known parity specialization.
3. Apply the supplier’s corrected parity invariance theorem and the complex functional-equation sign.

Acceptance checks:

- The parity residue is 0 at ε=+1 and 1 at ε=−1.

Direct prerequisites:

- `GeneralizedHeegnerCycles:GH.6/selmer-rank-one`
- `GeneralizedHeegnerCycles:GH.6/selmer-rank-zero`
- `GeneralizedHeegnerCycles:GH.6/anticyclotomic-nonvanishing`
- `SelmerIwasawaCohomology:L4`

Source passages:

- [Heegner cycles and p-adic L-functions](https://www.math.ntu.edu.tw/~mlhsieh/research/HCES.pdf), §6.4, Theorem 6.4 and proof, pp.27–28. The proof invokes Nek07 and Nek09 for parity in a family.

### GH.6.6. Universal norm module of rank one

**Theorem — TauCeti.GeneralizedHeegner.universalNormModuleRankOne.**

Node: `GeneralizedHeegnerCycles:GH.6/universal-norm-module-rank-one`.

For LV’s admissible triple and its verified control and local assumptions, H∞, the Λ-submodule of the pro-Selmer module generated by the norm classes, is free of rank one and is generated by κ̃₁. Theorem 4.12 uses eventual nonzero generalized cycles from CH, the Φ image/intersection calculation and a universal-norm/Nakayama argument. Merely knowing κ̃₁≠0 does not prove that it generates all of H∞ or that H∞ is saturated.

Hypotheses and conventions:

- LV admissibility and verified application conditions; comparison of CH classes with the LV finite Δ norm convention.

Construction or proof:

1. Use CH nonvanishing to find a nonzero norm class at a finite level.
2. Compute the stable augmentation image using the trace-polynomial ideal equality.
3. Apply the cited universal-norm argument and Nakayama to show generation by κ̃₁, then use torsion freeness.

Acceptance checks:

- A nonzero element p of Λ is not a generator of Λ; nonvanishing alone cannot justify the module-generation conclusion.

Direct prerequisites:

- `GeneralizedHeegnerCycles:GH.3/universal-norm-heegner-class`
- `GeneralizedHeegnerCycles:GH.3/trace-polynomial-intersection`
- `GeneralizedHeegnerCycles:GH.6/anticyclotomic-nonvanishing`
- `GeneralizedHeegnerCycles:GH.5/specialization-control`
- `GeneralizedHeegnerCycles:GH.5/higher-weight-kolyvagin-class`

Source passages:

- [Kolyvagin systems and Iwasawa theory of generalized Heegner cycles](https://arxiv.org/pdf/1605.03168), §4.4, Definition 4.10 and Theorem 4.12, pp.16–18. Gives freeness and generation, a stronger statement than nonvanishing.

### GH.6.7. Higher-weight Iwasawa structure

**Application — TauCeti.GeneralizedHeegner.lambdaStructureConsequence.**

Node: `GeneralizedHeegnerCycles:GH.6/lambda-structure-consequence`.

With the GH.5 application hypotheses verified and GH.6’s H∞=Λκ̃₁ free of rank one, LV Theorem 1.1 follows by importing the generic Λ bound: X∞∼Λ⊕M⊕M, char(M)=char(M)^ι, char(M) divides char(Selhat/H∞). Equality of characteristic ideals is LV’s main conjecture and is not asserted here. This conditional structure consequence retains the local-filtration and normalization gaps until the supplier and source comparison obligations are discharged.

Hypotheses and conventions:

- The admissible triple, H0–H5, local Assumption 3.2, control and universal-norm identification are all verified.

Construction or proof:

1. Supply κ̃₁≠0 and H∞=Λκ̃₁ from the preceding theorem.
2. Apply the already imported generic Howard Λ theorem through the GH.5 adapter.

Acceptance checks:

- The quotient in the divisibility is Selhat/H∞ after identifying H∞, not a quotient by an arbitrary nonzero class.

Direct prerequisites:

- `GeneralizedHeegnerCycles:GH.5/longo-vigni-admissibility-and-the-lambda-adic-bound`
- `GeneralizedHeegnerCycles:GH.6/universal-norm-module-rank-one`

Source passages:

- [Kolyvagin systems and Iwasawa theory of generalized Heegner cycles](https://arxiv.org/pdf/1605.03168), Introduction Theorem 1.1 and §5.1, pp.2,18–19. The source distinguishes the proven divisibility from conjectural equality.

## GH.7. Hida-family classes and specialization

The critical and CM twists fix the ordinary local line. Howard’s finite-level point tower and the ordinary Hida representation supply the family classes. Ochiai, Yager and the two-variable regulator are imported checkpoints from a proposed regulator extension. Family reciprocity and injective localization then yield the initial and full higher-weight specialization formulas.

Coverage: **planned**. Remaining proof closure: Classical-cycle source comparison; Bottom conductor and full/half unit normalization; Generic local regulator Part II; Hida point and representation tower exports.

Atlas planets: Critical family twist; Howard family tower; Two-variable reciprocity law; Initial family specialization; Higher-weight specialization.

### GH.7.1. Critical character and CM family twist

**Construction — TauCeti.GeneralizedHeegner.criticalTwist.**

Node: `GeneralizedHeegnerCycles:GH.7/critical-character-twist`.

Fix the Hida component and a lift i modulo 2(p−1). Castella’s critical character is Θ=ω^{i/2}[⟨ε_cyc⟩^{1/2}]. Extend the branch to include the CM character λ, and construct Ξ and ξ=Ξ/Ξ̄ as in §2.6. The self-dual family is T†=T⊗Θ^{-1}; the regulator line is in T†|_{G_K}⊗ξ^{-1}. The induced unramified rank-one character Ψ at p, its Frobenius value and λ_reg=Ψ(Fr_p)−1 must be tracked through this precise twist. ξ is not substituted for an arbitrary anticyclotomic character.

Hypotheses and conventions:

- Fixed branch, geometric reciprocity, square-root lift and CM character λ; ordinary residual irreducible and p-distinguished family.

Construction or proof:

1. Import the Hida branch and continuous character algebra from PadicFamilies.
2. Apply the critical half-weight twist, then the CM anticyclotomic twist.
3. Compute the resulting local rank-one Frobenius character from the ordinary exact sequence.

Uses of this interface:

- **GeneralizedHeegnerCycles:GH.7/family-regulator-localization**: Makes the actual plus line unramified for the supplier regulator.
- **GeneralizedHeegnerCycles:GH.7/higher-weight-family-specialization**: Pins the self-dual representation identified with V_fν(rν).

Planning API:

- **TauCeti.GeneralizedHeegner.criticalTwist_apply** (simp): The twisting character is Θ(g)^{-1}ξ(g)^{-1}.
- **TauCeti.GeneralizedHeegner.criticalTwist_selfDual** (compatibility): The square of the critical half-weight character restores the determinant cyclotomic factor.
- **TauCeti.GeneralizedHeegner.criticalTwist_specialize** (functoriality): Specialization of the coefficient ring commutes with both inverse character factors.

Unit tests:

- **TauCeti.GeneralizedHeegner.criticalTwist_trivial** (degenerate): With both characters trivial the twist is trivial.
- **TauCeti.GeneralizedHeegner.criticalTwist_inverse** (characterisation): Multiplying the twist by Θξ gives the trivial character.
- **TauCeti.GeneralizedHeegner.criticalTwist_order** (compatibility): The CM and critical inverse factors commute in the coefficient unit group.

Acceptance checks:

- Different lifts of i modulo 2(p−1) can change the half-weight character; a square-root choice must be fixed.

Direct prerequisites:

- `PadicFamilies:L0/hida-control-theorem`
- `ComplexMultiplicationAndExplicitReciprocity:CM.1`
- `AutomorphicGaloisRepresentations:R19.6`
- `PadicHodgeRegulators:L3`

Source passages:

- [On the p-adic variation of Heegner points](https://web.math.ucsb.edu/~castella/Heegner.pdf), §2.6, (2.8)–(2.10); §4.1 and §5.1, pp.9–10,18,21. The family CM character and critical twist determine the regulator normalization.

### GH.7.2. Howard family class tower

**Construction — TauCeti.GeneralizedHeegner.howardTowerClass.**

Node: `GeneralizedHeegnerCycles:GH.7/howard-family-tower`.

On X₁(Np^s), form the ordinary divisor/Kummer classes from Howard’s CM points P_{c₀p^n,s} defined over K̃_{c₀p^n}(μ_{p^s}), with the diamond character ϑ²=ε_cyc and critical twist Θ^{-1}. The horizontal degeneracy trace is U_p; after U_p^{-s} normalization take the s-inverse limit to X_c. Then Z_{c₀,t}=U_p^{1−t}X_{c₀p^t} is corestriction compatible in t and defines Z_{c₀,∞}∈H¹_Iw(K̃_{c₀p∞},T†). It lies in the strict Greenberg condition when the required bad-prime residual ramification holds.

Hypotheses and conventions:

- Hida ordinary, residual irreducible and p-distinguished; fine-level CM data; bad-prime torsion freeness as in Castella Proposition 4.8.

Construction or proof:

1. Import Howard’s CM point tower from HE and the family representation from R19.6.
2. Apply the Kummer maps and ordinary control with the U_p^{-s} normalization.
3. Use the vertical trace relation to normalize by U_p^{1−t}; apply the local Greenberg verification at p and at bad primes.

Uses of this interface:

- **GeneralizedHeegnerCycles:GH.7/two-variable-explicit-reciprocity**: Supplies the global class to the localized regulator.
- **GeneralizedHeegnerCycles:GH.7/initial-family-specialization**: Fixes the precise bottom point class whose specialization is evaluated.

Planning API:

- **TauCeti.GeneralizedHeegner.howardTowerClass_level** (projection): The conductor-t class is U_p^{1−t}X_{c₀p^t}.
- **TauCeti.GeneralizedHeegner.howardTowerClass_trace** (relation): The normalized family classes are corestriction compatible.
- **TauCeti.GeneralizedHeegner.howardTowerClass_greenberg** (structure): The local family class lies in the strict Greenberg submodule under the source bad-prime hypotheses.

Unit tests:

- **TauCeti.GeneralizedHeegner.howardTowerClass_one** (computation): At t=1 the class is X₁.
- **TauCeti.GeneralizedHeegner.howardTowerClass_two** (computation): At t=2 the class is U_p^{-1}X₂.
- **TauCeti.GeneralizedHeegner.howardTowerClass_unit** (degenerate): With U_p=1 there is no renormalization.

Acceptance checks:

- The t=1 class has U_p⁰ normalization; omitting the +1 in 1−t changes its initial comparison.

Direct prerequisites:

- `GeneralizedHeegnerCycles:GH.7/critical-character-twist`
- `HeegnerPointEulerSystems:HE.1/canonical-model-cm-descent`
- `AutomorphicGaloisRepresentations:R19.6`
- `SelmerIwasawaCohomology:L3/iwasawa-cohomology`
- `ModularCurvesPartII:R14.3`
- `HeegnerPointEulerSystems:HE.1`

Source passages:

- [On the p-adic variation of Heegner points](https://web.math.ucsb.edu/~castella/Heegner.pdf), §4.2, Definitions 4.4–4.6 and Proposition 4.8, pp.19–20. The point tower, horizontal and vertical normalization are described.

### GH.7.3. Family representation specialization

**Comparison — TauCeti.GeneralizedHeegner.familyRepresentationSpecialization.**

Node: `GeneralizedHeegnerCycles:GH.7/family-representation-specialization`.

Castella’s T=lim_s e^ord T_p(J_s)⊗_h I is free of rank two under residual irreducibility and p-distinguishedness. It has trace ρ(Fr_ℓ^{-1})=a_ℓ and determinant ε_f(ℓ)[ℓ]ℓ, and its ordinary quotient is unramified with geometric Frobenius inverse eigenvalue a_p. At an arithmetic ν the critically twisted specialization identifies with T_{fν}(rν) after the specified coefficient extension and residual assumptions. This family representation and control belong to R19.6/PadicFamilies; this node checks their convention against the GH class.

Hypotheses and conventions:

- Normal finite-flat Hida branch and arithmetic ν of the source’s weight and character; ordinary/residual hypotheses.

Construction or proof:

1. Import the family representation, ordinary exact sequence and arithmetic specialization.
2. Compare geometric Frobenius, determinant and critical twist with the fixed-weight coefficient projector.

Acceptance checks:

- A trace convention at Fr_ℓ^{-1} cannot be silently replaced by arithmetic Fr_ℓ.

Direct prerequisites:

- `AutomorphicGaloisRepresentations:R19.6`
- `PadicFamilies:L0/hida-control-theorem`
- `GeneralizedHeegnerCycles:GH.7/critical-character-twist`
- `GeneralizedHeegnerCycles:GH.0/newform-cm-projector`

Source passages:

- [On the p-adic variation of Heegner points](https://web.math.ucsb.edu/~castella/Heegner.pdf), §4.1, Theorem 4.3, p.18. The exact representation and ordinary convention are stated.

### GH.7.4. Family square-root measure specialization checkpoint

**Comparison — TauCeti.GeneralizedHeegner.familyMeasureSpecialization.**

Node: `GeneralizedHeegnerCycles:GH.7/family-measure-specialization`.

Import L_{p,ξ}(f)∈I_W[[Γ̃]] from L3h. Castella Theorem 2.11 gives for ν of weight (kν,1), kν≥1, and φ type (ℓ,−ℓ), ℓ≥0, conductor c₀p^n: ν(L_{p,ξ}(f))(φ̂)²/Ω_p^{2kν+4ℓ}=L_alg(fν/K,χνξνφ,kν−1)E_p²φ(𝔑^{-1})8c₀ε(fν)w_K²√D_K. For n=0 E_p=(1−ν(a_p)(χνψ)_p(p)p^{-kν/2})(1−(χνψ)_p(p)p^{kν/2−1}ν(a_p)^{-1}); for n≥1 E_p=ε((χνψ)_p^{-1})p^{-n}. The χν norm factor converts kν−1 to the central kν/2 convention (Remark 2.12). The measure is square-root normalized; the displayed interpolation squares it.

Hypotheses and conventions:

- Castella §2.3–2.7’s CM and modular measure data; exact arithmetic ν and locally algebraic φ; complete unramified coefficient extension W.
- This is the consumer normalization comparison using the imported L3h interpolation theorem, not a second owner of the family distribution or Theorem 2.11.

Construction or proof:

1. Import the family CM modular measure and its toric interpolation from L3h.
2. Check specialization of χν, ξν, periods, gamma factors and the ramified/unramified Euler cases.
3. Match the fixed-weight CH distribution with the family measure at the chosen branch; do not define a second BDP measure in GH.7.

Acceptance checks:

- At n>0 the epsilon factor replaces the two unramified Euler factors.

Direct prerequisites:

- `AutomorphicPadicLFunctions:L3h`
- `PadicFamilies:L0/hida-control-theorem`
- `GeneralizedHeegnerCycles:GH.7/critical-character-twist`

Source passages:

- [On the p-adic variation of Heegner points](https://web.math.ucsb.edu/~castella/Heegner.pdf), §2.7, Theorem 2.11 and Remark 2.12, pp.11–12. The family interpolation and central normalization are explicit.

### GH.7.5. Ochiai exponential checkpoint

**Comparison — TauCeti.GeneralizedHeegner.ochiaiExponentialCheckpoint.**

Node: `GeneralizedHeegnerCycles:GH.7/ochiai-exponential-checkpoint`.

The local supplier must provide Castella Theorem 3.4: with Ical=I⊗̂Z_p[[Γ_cyc]], D=(F⁺T⊗Ẑ_p^ur)^{G_Qp} and J=(Ψ(Fr_p)−1,γ₀−1), an injective E_F^cyc:J(D⊗O_F)→H¹(F,F⁺Tcal) with pseudo-null cokernel for finite unramified F/Q_p. Its arithmetic specialization, including the weight-positive exponential interpolation, differs at conductor 0 and positive conductor. This ideal-restricted domain and pseudo-null error must survive every regulator adapter.

Hypotheses and conventions:

- Castella ordinary deformation Definition 3.1, rank-one unramified F⁺ line, determinant convention and finite unramified F.

Construction or proof:

1. Request the generic Ochiai exponential as a Part II extension of the cyclotomic regulator packet.
2. Verify the actual GH critical twist satisfies its local ordinary deformation input, and retain J and its specialization error.

Acceptance checks:

- At an exceptional arithmetic character the J-specialized map can vanish; an everywhere-isomorphism claim is invalid.

Direct prerequisites:

- `PadicHodgeRegulators:L3`
- `GeneralizedHeegnerCycles:GH.7/critical-character-twist`

Source passages:

- [On the p-adic variation of Heegner points](https://web.math.ucsb.edu/~castella/Heegner.pdf), §3.2, Theorem 3.4, pp.14–15. The map’s ideal domain, injectivity, interpolation and pseudo-null cokernel are the checkpoint.

### GH.7.6. Yager unramified descent checkpoint

**Comparison — TauCeti.GeneralizedHeegner.yagerUnramifiedCheckpoint.**

Node: `GeneralizedHeegnerCycles:GH.7/yager-unramified-checkpoint`.

The supplier’s Yager module S∞ is the inverse limit under trace of the finite unramified coefficient modules S_m generated by y_m(x)=Σ_σ x^σ[σ^{-1}]. It is free of rank one over Z_p[[U]], satisfies y^u=[u]y, and identifies with lim_trace O_{F_m}. Use this equivariance to descend the tensor of the cyclotomic local maps to the unramified×cyclotomic tower. Finite unramified base change of a cyclotomic regulator alone is not this construction.

Hypotheses and conventions:

- Unramified Z_p-tower with its Galois action and trace; Castella §3.3 coefficient convention.

Construction or proof:

1. Request Yager’s trace module and free rank-one basis/covariance theorem from the PHR local Part II owner.
2. Use trace compatibility and covariance to obtain the local two-variable map; retain finite-level corestriction checks.

Acceptance checks:

- The coefficient action is by [u], with σ^{-1} in the Yager sum; changing either inversion changes descent.

Direct prerequisites:

- `PadicHodgeRegulators:L3`
- `GeneralizedHeegnerCycles:GH.7/ochiai-exponential-checkpoint`

Source passages:

- [On the p-adic variation of Heegner points](https://web.math.ucsb.edu/~castella/Heegner.pdf), §3.3, Proposition 3.5 and Corollary 3.6, pp.15–16. The infinite unramified coefficient module is part of the construction.

### GH.7.7. Two-variable regulator checkpoint

**Comparison — TauCeti.GeneralizedHeegner.twoVariableRegulatorCheckpoint.**

Node: `GeneralizedHeegnerCycles:GH.7/two-variable-regulator-checkpoint`.

With G=U×Γ_cyc and λ_reg=Ψ(Fr_p)−1, the supplier map of Castella Theorem 3.7 has target λ_reg^{-1}J(D⊗Ô_{F∞}[[G]]), is injective, and interpolates the logarithm for w>0 at nonexceptional characters. Corollary 3.9 gives the dual exponential range w≤0 with its factorial and Euler factors. Keep the conductor-zero exceptional denominator and the integral ideal J; the target is not an unlocalized unrestricted coefficient algebra.

Hypotheses and conventions:

- The rank-one unramified ordinary line, Yager covariance and nonexceptional arithmetic specialization; all §3 conventions.

Construction or proof:

1. Combine the requested exponential and Yager module into the two-variable regulator.
2. Check logarithmic and dual-exponential interpolation against the same twists before passing to the anticyclotomic quotient.

Acceptance checks:

- At λ_reg=0 localization does not produce a value; exceptional arithmetic primes require a separate statement.

Direct prerequisites:

- `PadicHodgeRegulators:L3`
- `GeneralizedHeegnerCycles:GH.7/yager-unramified-checkpoint`
- `GeneralizedHeegnerCycles:GH.7/ochiai-exponential-checkpoint`

Source passages:

- [On the p-adic variation of Heegner points](https://web.math.ucsb.edu/~castella/Heegner.pdf), §3.4, Theorem 3.7 and Corollary 3.9, pp.16–17. The localized ideal target and both specialization ranges are the checkpoint.

### GH.7.8. Anticyclotomic family regulator

**Comparison — TauCeti.GeneralizedHeegner.familyRegulatorLocalization.**

Node: `GeneralizedHeegnerCycles:GH.7/family-regulator-localization`.

Castella Proposition 5.2 supplies L_ωf^Γ:H¹_Iw(K∞/F,F⁺T†⊗ξ^{-1})→I[λ_reg^{-1}]⊗W[[Γ]], injective with pseudo-null cokernel. It pairs the local map with the canonical family differential functional of Lemma 5.1. Passing from the two-variable tower to Γ uses the H² correction; the needed vanishing is checked through H⁰(K∞,F⁺T)=0. A quotient of the local regulator cannot be declared injective solely by tensoring its source and target.

Hypotheses and conventions:

- The critical/CM twist is the one giving Ψ; λ_reg is inverted; H⁰/H² condition and the canonical family differential are fixed.

Construction or proof:

1. Pair the imported map with the family ω functional and descend to Γ.
2. Use the specialization exact sequence and the H² correction to prove injectivity and the pseudo-null bound.

Acceptance checks:

- The nonexceptional condition λ_reg≠0 is retained in each arithmetic specialization.

Direct prerequisites:

- `GeneralizedHeegnerCycles:GH.7/two-variable-regulator-checkpoint`
- `GeneralizedHeegnerCycles:GH.7/family-representation-specialization`
- `GeneralizedHeegnerCycles:GH.7/critical-character-twist`
- `SelmerIwasawaCohomology:L3/iwasawa-shapiro`

Source passages:

- [On the p-adic variation of Heegner points](https://web.math.ucsb.edu/~castella/Heegner.pdf), §5.1, Lemma 5.1 and Proposition 5.2, pp.21–22. The localized scalar regulator uses a cohomological descent check.

### GH.7.9. Two-variable explicit reciprocity

**Theorem — TauCeti.GeneralizedHeegner.twoVariableReciprocity.**

Node: `GeneralizedHeegnerCycles:GH.7/two-variable-explicit-reciprocity`.

In I[λ_reg^{-1}]⊗W[[Γ̃]], L_ωf^Γ(res_p Z_{c₀,∞}^{ξ^{-1}})=L_{p,ξ}(f)·σ_{−1,p}. This is Castella Theorem 5.3 with its own class/measure normalization; it has no additional −c₀^{r−1} prefactor. Its specialization must be compared with CH 5.7 through the named normalization adapter, not by identifying the two unnormalized class towers.

Hypotheses and conventions:

- Castella’s ordinary residual irreducible/p-distinguished family, local regulator domain, CM tower and measure; localized λ_reg.

Construction or proof:

1. Verify the local restriction is in the plus-line Iwasawa source.
2. At a dense set of weight-two arithmetic specializations with sufficiently ramified φ, compute the Coleman evaluation and period-normalized CM measure (Theorem 5.4).
3. Apply family control and density; the local epsilon sign gives σ_{−1,p}.

Acceptance checks:

- Squaring conceals the class normalization; the family identity is kept linear.

Direct prerequisites:

- `GeneralizedHeegnerCycles:GH.7/howard-family-tower`
- `GeneralizedHeegnerCycles:GH.7/family-regulator-localization`
- `GeneralizedHeegnerCycles:GH.7/family-measure-specialization`
- `GeneralizedHeegnerCycles:GH.1/coleman-abel-jacobi-formula`

Source passages:

- [On the p-adic variation of Heegner points](https://web.math.ucsb.edu/~castella/Heegner.pdf), §5.2, Theorems 5.3–5.4 and proof, pp.22–25. The localized family reciprocity law uses the Artin sign translation.

### GH.7.10. Ordinary localization injectivity

**Lemma — TauCeti.GeneralizedHeegner.ordinaryLocalizationInjective.**

Node: `GeneralizedHeegnerCycles:GH.7/ordinary-localization-injective`.

For the ordinary fixed-weight specialization with residual restriction to G_K irreducible, Castella Lemma 6.4 makes the localization Sel_Gr(K_{c₀p∞}/K_{c₀},T_f(r))→H¹_Iw(local,F⁺T_f(r)) injective. The proof uses Λ-torsion freeness and infinitely many arithmetic specializations where the global rank-one class and its local logarithm are nonzero. This additional result is what turns equality of local regulator images into equality of global classes.

Hypotheses and conventions:

- Residual |G_K irreducibility, ordinary filtration, torsion-free global module and nonzero local classes at infinitely many finite characters.

Construction or proof:

1. Use the fixed-weight nonvanishing/reciprocity and Selmer rank-one result to show the finite-character localization kernels vanish.
2. Apply torsion freeness and infinitely many specializations to kill the global kernel.

Acceptance checks:

- Equality after a local regulator gives a global equality only after this injectivity input.

Direct prerequisites:

- `GeneralizedHeegnerCycles:GH.6/anticyclotomic-nonvanishing`
- `GeneralizedHeegnerCycles:GH.6/selmer-rank-one`
- `GeneralizedHeegnerCycles:GH.4/castella-hsieh-abel-jacobi-formula-and-big-logarithm-reciprocity`
- `SelmerIwasawaCohomology:L2/galois-selmer-group`
- `SelmerIwasawaCohomology:L3/iwasawa-cohomology`

Source passages:

- [On the p-adic variation of Heegner points](https://web.math.ucsb.edu/~castella/Heegner.pdf), §6.1, Lemma 6.4, pp.26–27. Localization injectivity is a distinct ingredient in the global comparison.

### GH.7.11. Initial family specialization

**Theorem — TauCeti.GeneralizedHeegner.initialFamilySpecialization.**

Node: `GeneralizedHeegnerCycles:GH.7/initial-family-specialization`.

Under Castella Theorem 6.5, at an arithmetic ν of trivial character and weight 2rν>2 with 2rν≡k mod 2(p−1), ν(Z_{c₀,0})=(1−p^{rν−1}/ν(a_p))² AJ_et(Δ_heeg_{rν})/[u_{c₀}(2√−D_K)^{rν−1}], u_{c₀}=|O_{c₀}×|/2. Require k≡2 mod p−1, residual |G_K irreducibility, p-distinguishedness and ramification at every q|(D_K,N), with Castella’s odd-discriminant Heegner and split-p setup. The weight-two p-new exceptional prime is outside this theorem.

Hypotheses and conventions:

- All Castella §6.2 hypotheses; α=ν(a_p) is the ordinary root; period and cycle normalization fixed.

Construction or proof:

1. Specialize family reciprocity and match it with CH’s fixed-weight identity using the normalization adapter.
2. Use the classical/generalized cycle comparison and its half-unit convention.
3. Use ordinary localization injectivity to promote the local equality to the global initial class.

Acceptance checks:

- At a vanishing ordinary Euler factor the initial class can vanish; no exceptional-branch claim is made.

Direct prerequisites:

- `GeneralizedHeegnerCycles:GH.7/two-variable-explicit-reciprocity`
- `GeneralizedHeegnerCycles:GH.7/ordinary-localization-injective`
- `GeneralizedHeegnerCycles:GH.7/family-representation-specialization`
- `GeneralizedHeegnerCycles:GH.1/classical-generalized-cycle-comparison`
- `GeneralizedHeegnerCycles:GH.3/stabilized-first-step-adapter`

Source passages:

- [On the p-adic variation of Heegner points](https://web.math.ucsb.edu/~castella/Heegner.pdf), §6.2, Theorem 6.5 and proof, pp.27–28. The first specialization and its stronger residual hypotheses are explicit.

### GH.7.12. Higher-weight family specialization

**Theorem — TauCeti.GeneralizedHeegner.higherWeightFamilySpecialization.**

Node: `GeneralizedHeegnerCycles:GH.7/higher-weight-family-specialization`.

Under the same source-qualified hypotheses as the initial formula, c₀^{rν−1}ν(Z_{c₀,∞})=z_{fν,c₀,α} in the strict Greenberg Iwasawa Selmer module, α=ν(a_p). The system comparison is global: it uses the family local reciprocity, CH’s fixed-weight reciprocity, exact differential and c₀ normalization, plus localization injectivity. It includes finite conductor moments through Shapiro and the specified character twists, while keeping λ_reg exceptional primes outside the localized comparison.

Hypotheses and conventions:

- Castella Theorem 6.5: weight and parity congruence, trivial arithmetic character, residual |G_K irreducibility, p-distinguishedness, required bad-prime ramification, odd CM discriminant, split p, c₀ prime to Np.

Construction or proof:

1. Compare both local regulator images at each nonexceptional arithmetic specialization with the exact c₀^{rν−1} factor.
2. Use Lemma 6.4 localization injectivity to identify global Iwasawa classes.
3. Project to finite conductor/character moments using the same Shapiro inversion and compare the initial formula.

Acceptance checks:

- The initial cycle equality and the full system equality are different conclusions; both retain their normalization factors.

Direct prerequisites:

- `GeneralizedHeegnerCycles:GH.7/initial-family-specialization`
- `GeneralizedHeegnerCycles:GH.7/ordinary-localization-injective`
- `GeneralizedHeegnerCycles:GH.7/two-variable-explicit-reciprocity`
- `GeneralizedHeegnerCycles:GH.4/castella-hsieh-abel-jacobi-formula-and-big-logarithm-reciprocity`
- `SelmerIwasawaCohomology:L3/iwasawa-shapiro`

Source passages:

- [On the p-adic variation of Heegner points](https://web.math.ucsb.edu/~castella/Heegner.pdf), §6.2, Theorem 6.5, (6.7), pp.27–28. Gives the full higher-weight Iwasawa class comparison, with c₀^{rν−1}.

## Supplier requests

These are precise exports needed by the consumer nodes. They are requests in this packet, not promises that the named stage already proves the stronger statement. A request beyond current scope is accompanied by the Part II or scope-extension proposal above.

### AutomorphicGaloisRepresentations:R19.1

Deligne newform representation with the exact geometric Frobenius, self-dual twist and lattice index used by LV Definition 2.1, plus its determinant-restricted big-image input and solvable-tower invariant-vanishing consequence under the stated nonexceptional prime conditions.

Consumers:

- `GeneralizedHeegnerCycles:GH.5/longo-vigni-admissible-triple`

### AutomorphicGaloisRepresentations:R19.6

The Hida ordinary branch representation T=lim_s e^ord T_pJ_s⊗_h I of Castella Theorem 4.3: free rank two under residual irreducibility/p-distinguishedness, trace and determinant conventions, rank-one ordinary sequence and arithmetic specialization after the critical twist. The current weight-two Hecke reconstruction nodes do not themselves prove this tower theorem.

Consumers:

- `GeneralizedHeegnerCycles:GH.7/critical-character-twist`
- `GeneralizedHeegnerCycles:GH.7/family-representation-specialization`
- `GeneralizedHeegnerCycles:GH.7/howard-family-tower`

### AutomorphicPadicLFunctions:L3h

One GL₂ BDP/CH square-root distribution owner, including p-depletion and negative θ powers on the CM ordinary locus, BDP 5.9–5.10 toric interpolation/continuity, CH Proposition 3.8 and Theorem 3.9’s Hsieh Theorem C nonvanishing with auxiliary residual hypotheses, and Castella Theorem 2.11 family interpolation with period, epsilon, Euler and gamma normalization. GH.4 owns the generalized-cycle special value identity, while GZ.9 imports m=0; do not rebuild the measure in either place.

Consumers:

- `GeneralizedHeegnerCycles:GH.1/coleman-depletion-calculation`
- `GeneralizedHeegnerCycles:GH.4/bdp-special-value-formula`
- `GeneralizedHeegnerCycles:GH.4/castella-hsieh-abel-jacobi-formula-and-big-logarithm-reciprocity`
- `GeneralizedHeegnerCycles:GH.4/dual-exponential-special-value`
- `GeneralizedHeegnerCycles:GH.4/ramified-character-abel-jacobi-formula`
- `GeneralizedHeegnerCycles:GH.6/anticyclotomic-nonvanishing`
- `GeneralizedHeegnerCycles:GH.7/family-measure-specialization`

### ComplexMultiplicationAndExplicitReciprocity:CM.1

General CM A/H with End_H(A)=O_K, including exceptional unit fields; the normalized two CM characters and the realization of B=Res_{H/K}A and its algebraic Hecke character κ_A; their ideal-action and geometric Artin convention, and the coefficient extension/finite Hilbert class character used in CH (4.5)–(4.7). The HE canonical descent node supplies only its stated restricted hypotheses.

Consumers:

- `GeneralizedHeegnerCycles:GH.0/cm-elliptic-curve-and-its-hodge-splitting`
- `GeneralizedHeegnerCycles:GH.1/character-projected-heegner-class`
- `GeneralizedHeegnerCycles:GH.1/isogenies-of-conductor-c-prime-to-n`
- `GeneralizedHeegnerCycles:GH.2/cycle-conjugation`
- `GeneralizedHeegnerCycles:GH.7/critical-character-twist`

### DerivedDeRhamCohomology:DD.2

Scheme-level algebraic de Rham realization for smooth proper schemes, filtered Künneth for W_m×A^m, cup product, compatibility with correspondence action and the classical smooth de Rham complex. Extend DD.2 beyond its present algebra/complex interface if this global filtered Künneth theorem is not yet included.

Consumers:

- `GeneralizedHeegnerCycles:GH.0/cohomology-of-the-generalized-kuga-sato-variety`
- `GeneralizedHeegnerCycles:GH.0/projected-hodge-filtration`

### EtaleDualityAndPerverseSheaves:EDC.6

Rational p-adic étale Künneth and correspondence compatibility for proper smooth products, obtained from integral/finite systems with derived-limit control; no torsion duality statement alone supplies the rational product formula.

Consumers:

- `GeneralizedHeegnerCycles:GH.0/cohomology-of-the-generalized-kuga-sato-variety`

### HeegnerPointEulerSystems:HE.1

Compatible finite-level CM points on X₁(Np^s) with p-power conductor, defined over K̃_c(μ_{p^s}), their diamond character ϑ²=ε_cyc and degeneracy/vertical trace in Castella §4.2. The existing prime-to-level canonical CM pair node is insufficient when conductor and level both have p-parts; extend that point interface, while GH.7 owns the family coefficient/class adapter.

Consumers:

- `GeneralizedHeegnerCycles:GH.7/howard-family-tower`

### ModularCurvesPartII:R14.3

RS-06 higher-weight extension of the universal-family carrier: W_m as canonical desingularized fiber power of the generalized elliptic curve over X₁(N), N>4; commuting N-torsion and signed Ξ_m projectors with denominator N^m2^m m!; Scholl projected degree m+1 cohomology, parabolic Hodge filtration Fil^{m+1}=S_{m+2}, Hecke action and f summand, integral stable lattice with an explicit Hecke congruence denominator, and smooth proper model over Z[1/N]. The current finite-level H¹ packet is insufficient for these higher fiber powers; extend the owner, not GH.

Consumers:

- `GeneralizedHeegnerCycles:GH.0/cm-product-good-model`
- `GeneralizedHeegnerCycles:GH.0/cohomology-of-the-generalized-kuga-sato-variety`
- `GeneralizedHeegnerCycles:GH.0/generalized-kuga-sato-variety-and-its-projector`
- `GeneralizedHeegnerCycles:GH.0/newform-cm-projector`
- `GeneralizedHeegnerCycles:GH.1/coleman-depletion-calculation`
- `GeneralizedHeegnerCycles:GH.2/cycle-conjugation`
- `GeneralizedHeegnerCycles:GH.7/howard-family-tower`
- `GeneralizedHeegnerCycles:GH.0/projected-hodge-filtration`

### PadicDifferentialEquationsAndRigidCohomology:RD.4

BDP §3.5 algebraic/rigid wide-open curve comparison with overconvergent coefficients, invariance under shrinking Frobenius neighborhoods, annular and cusp residues, rigid residue theorem and the Cech–de Rham cup-product formula. RD.3 supplies the F-isocrystal carrier separately; these exact wide-open comparisons need proof, not just a formal site map.

Consumers:

- `GeneralizedHeegnerCycles:GH.1/coleman-primitive`
- `GeneralizedHeegnerCycles:GH.1/parabolic-residue-pairing`

### PadicHodgeRegulators:D.2

Higher-dimensional Chow-cycle syntomic Abel–Jacobi regulator for smooth proper X_m with projector action, proper/flat functoriality, and comparison with the étale Gysin extension and BK logarithm with an explicit Frobenius normalization. The existing Spec O_F Tate regulator and K₂ curve comparison nodes do not supply this statement.

Consumers:

- `GeneralizedHeegnerCycles:GH.1/syntomic-abel-jacobi-comparison`

### PadicHodgeRegulators:L3

Part II of Padic Hodge regulators: integral relative Lubin–Tate Perrin–Riou twists Ω with coefficient-lattice and finite pairing compatibility (KO 3.7, 4.7, 4.10); CH Theorem 5.1 relative regulator with its two interpolation ranges; Castella Theorem 3.4 exponential on J=(Ψ(Fr_p)−1,γ₀−1) with injectivity and pseudo-null cokernel; Yager trace module for the unramified Z_p tower, its rank-one freeness and y^u=[u]y covariance; Theorem 3.7 two-variable map into λ_reg^{-1}J and Corollary 3.9, with arithmetic exceptional denominators. The accepted L3 packet is strictly cyclotomic and finite unramified scalar extension is not an infinite unramified tower. This extension is the preferred local owner required by RT-iwasawa-1/27; AC L2 keeps bounded fixed-weight BK logarithms.

Consumers:

- `GeneralizedHeegnerCycles:GH.2/local-condition-at-p-and-the-castella-hsieh-corrections`
- `GeneralizedHeegnerCycles:GH.4/dual-exponential-special-value`
- `GeneralizedHeegnerCycles:GH.4/fixed-weight-regulator-adapter`
- `GeneralizedHeegnerCycles:GH.5/longo-vigni-local-assumptions`
- `GeneralizedHeegnerCycles:GH.7/critical-character-twist`
- `GeneralizedHeegnerCycles:GH.7/ochiai-exponential-checkpoint`
- `GeneralizedHeegnerCycles:GH.7/two-variable-regulator-checkpoint`
- `GeneralizedHeegnerCycles:GH.7/yager-unramified-checkpoint`

### PadicHodgeTheory:R06.2

Negative-weight filtered Frobenius extensions over unramified F, admissible/crystalline extension comparison, Φ=Φ₀^[F:Q_p] convention and the quotient D_dR/Fil⁰ with the holomorphic-minus-Frobenius sign, as BDP §§3.2–3.4 uses.

Consumers:

- `GeneralizedHeegnerCycles:GH.1/extensions-of-filtered-frobenius-modules`

### PadicHodgeTheory:R06.5

Application of proper smooth comparison to projected X_m cohomology, including its Hodge/Tate normalization and the geometric Abel–Jacobi extension landing in H¹_f. The generic geometric comparison is imported from CP and the regulator extension must be compatible with the higher-dimensional Chow Gysin construction.

Consumers:

- `GeneralizedHeegnerCycles:GH.1/extensions-of-filtered-frobenius-modules`
- `GeneralizedHeegnerCycles:GH.1/p-adic-abel-jacobi-map`
- `GeneralizedHeegnerCycles:GH.2/cycle-frobenius-congruence`
- `GeneralizedHeegnerCycles:GH.2/finite-local-abel-jacobi-class`

### SchemeAndStackFoundations:SF.2

Proper smooth base change and relative Gysin/specialization with the coefficient levels used for the product model and graph support. The already existing smooth/proper stability under products is imported from Mathlib, not re-planned.

Consumers:

- `GeneralizedHeegnerCycles:GH.0/cm-product-good-model`
- `GeneralizedHeegnerCycles:GH.1/parabolic-residue-pairing`

### SchemeAndStackFoundations:SF.5

Ordinary rational Chow groups, rational equivalence, proper pushforward/flat pullback, isogeny graph products, correspondence composition and action, including base change and transpose. Compare degree-zero Bloch cycle complexes with this intersection-theory API instead of giving GH a private Chow carrier.

Consumers:

- `GeneralizedHeegnerCycles:GH.0/cm-projector-and-symmetric-power`
- `GeneralizedHeegnerCycles:GH.0/generalized-kuga-sato-variety-and-its-projector`
- `GeneralizedHeegnerCycles:GH.1/etale-abel-jacobi-map`
- `GeneralizedHeegnerCycles:GH.1/generalized-heegner-cycle`

### SelmerIwasawaCohomology:L4

Corrected Nekovář family parity theorem (Nek07 Corollary 5.3.2 with Nek09 correction), including the precise self-dual induced family and local plus-module hypotheses used by CH §6.4. This is a proposed Part II arithmetic-consequence extension, not an assertion that RJW criticality examples already prove family parity.

Consumers:

- `GeneralizedHeegnerCycles:GH.6/selmer-parity`

### EulerSystemsAndKolyvaginSystems:ES.5

CH §7.2–7.5 anticyclotomic Euler-system descent with its bounded local errors and Nekovář auxiliary constants: nonzero bottom class gives the one-dimensional self-dual Selmer bound, and a nonzero complementary local class kills the Bloch–Kato group. Supply the finite–singular coefficient correction, residual Kummer detection, admissible primes and p^C annihilator independently of the stronger clean Howard hypothesis package; verify that CH (H) satisfies this source-specific instance. Do not infer this theorem by silently imposing LV big image on CH Theorem 6.1.

Consumers:

- `GeneralizedHeegnerCycles:GH.6/selmer-rank-one`
- `GeneralizedHeegnerCycles:GH.6/selmer-rank-zero`

## Recorded proof gaps

Each gap identifies the missing argument or export and the nodes that require it. Their presence is why no stage is closed.

### Higher-weight universal-family export

R14.3 currently supplies finite-level H¹ rather than the full Scholl fiber-power/projector/lattice package. Its requested RS-06 extension must prove the integral Hecke denominator and the f-lattice comparison, beyond p∤2N m!.

Affected stages: GeneralizedHeegnerCycles:GH.0, GeneralizedHeegnerCycles:GH.1.

Required by:

- `GeneralizedHeegnerCycles:GH.0/newform-cm-projector`
- `GeneralizedHeegnerCycles:GH.1/integral-abel-jacobi-comparison`

### Product realizations and CM good model

Filtered de Rham and rational étale Künneth exports and the independently chosen CM good model are not supplied by level p∤N. Verify the selected canonical CM application over finite unramified F; do not extend it to arbitrary CM twists.

Affected stages: GeneralizedHeegnerCycles:GH.0.

Required by:

- `GeneralizedHeegnerCycles:GH.0/cohomology-of-the-generalized-kuga-sato-variety`
- `GeneralizedHeegnerCycles:GH.0/cm-product-good-model`
- `GeneralizedHeegnerCycles:GH.0/projected-hodge-filtration`

### Integral descent and CM character coefficient adapter

Prove vanishing of coefficient invariants for the K̃_c/K_c descent, and construct the Weil-restriction CM-character summand with all lattice/projector denominators. Invariance of a class alone does not identify the two H¹ groups.

Affected stages: GeneralizedHeegnerCycles:GH.1.

Required by:

- `GeneralizedHeegnerCycles:GH.1/integral-abel-jacobi-comparison`
- `GeneralizedHeegnerCycles:GH.1/character-projected-heegner-class`

### Geometric syntomic regulator comparison

Obtain the higher-dimensional Chow regulator and its exact Frobenius/Tate comparison. Current D.2 Spec O_F and D.5 K₂ curve comparison theorems are insufficient.

Affected stages: GeneralizedHeegnerCycles:GH.1.

Required by:

- `GeneralizedHeegnerCycles:GH.1/syntomic-abel-jacobi-comparison`

### Classical-cycle source comparison

BDP 2017, p-adic L-functions and the coniveau filtration on Chow groups, Proposition 4.1.2 was not read in this run. Castella’s use and constants were read. Acquire that source and verify the cycle adapter rather than claim BDP 2013 proves it.

Affected stages: GeneralizedHeegnerCycles:GH.1, GeneralizedHeegnerCycles:GH.7.

Required by:

- `GeneralizedHeegnerCycles:GH.1/classical-generalized-cycle-comparison`
- `GeneralizedHeegnerCycles:GH.7/initial-family-specialization`

### Wide-open residue and Coleman comparison export

The exact BDP §§3.5–3.6 wide-open algebraic/rigid comparison and residue theorem with L_{m,m} must be exported by RD.4. The F-isocrystal carrier alone does not prove the analytic primitive calculation.

Affected stages: GeneralizedHeegnerCycles:GH.1.

Required by:

- `GeneralizedHeegnerCycles:GH.1/parabolic-residue-pairing`
- `GeneralizedHeegnerCycles:GH.1/coleman-primitive`

### Corrected integral p-condition adapter

KO Lemma 4.10’s proof was read, but its Condition 2.3 and integral Ω construction are not discharged. Prove the requested lifting/orthogonality theorem and identify its height-one regulator-image local condition and lattice with the CH or LV condition at each required specialization.

Affected stages: GeneralizedHeegnerCycles:GH.2, GeneralizedHeegnerCycles:GH.5, GeneralizedHeegnerCycles:GH.6.

Required by:

- `GeneralizedHeegnerCycles:GH.2/local-condition-at-p-and-the-castella-hsieh-corrections`
- `GeneralizedHeegnerCycles:GH.5/higher-weight-kolyvagin-class`
- `GeneralizedHeegnerCycles:GH.6/selmer-rank-zero`

### Bottom conductor and full/half unit normalization

Compute the missing n=1 split trace in CH’s 2022 copy and the unit orbit multiplicity. CH u_c=|O_c×| differs from Castella u_c=|O_c×|/2. No equality of their raw initial classes is assumed.

Affected stages: GeneralizedHeegnerCycles:GH.3, GeneralizedHeegnerCycles:GH.7.

Required by:

- `GeneralizedHeegnerCycles:GH.3/stabilized-first-step-adapter`
- `GeneralizedHeegnerCycles:GH.3/iwasawa-heegner-class`
- `GeneralizedHeegnerCycles:GH.7/initial-family-specialization`

### Ramified conductor-one logarithm boundary

Theorem 4.9 states n≥1, while the conductor cancellation used in the density argument is n>1. Verify the n=1 calculation from the CM sum and lower conductor contributions; retain the separate BDP unramified Euler formula.

Affected stages: GeneralizedHeegnerCycles:GH.4.

Required by:

- `GeneralizedHeegnerCycles:GH.4/ramified-character-abel-jacobi-formula`

### Generic local regulator Part II

L3 presently proves the cyclotomic map. The relative Lubin–Tate and unramified×cyclotomic ordinary deformation contracts, ideal J, Yager module, λ_reg localization, pseudo-null errors and exceptional denominators require the precise proposed extension.

Affected stages: GeneralizedHeegnerCycles:GH.4, GeneralizedHeegnerCycles:GH.7.

Required by:

- `GeneralizedHeegnerCycles:GH.4/fixed-weight-regulator-adapter`
- `GeneralizedHeegnerCycles:GH.7/ochiai-exponential-checkpoint`
- `GeneralizedHeegnerCycles:GH.7/yager-unramified-checkpoint`
- `GeneralizedHeegnerCycles:GH.7/two-variable-regulator-checkpoint`

### LV local twist and integral local verification

Check Assumption 3.2 in the representation convention of the LV edition read: trivial inertia on the quotient is not implied just by ordinarity of the untwisted form. Prove the actual annihilator, H⁰ and Cartesian/control conditions or supply a corrected applicable control theorem. This is a verification gap against arXiv v1, not an accusation about the published version.

Affected stages: GeneralizedHeegnerCycles:GH.5, GeneralizedHeegnerCycles:GH.6.

Required by:

- `GeneralizedHeegnerCycles:GH.5/longo-vigni-local-assumptions`
- `GeneralizedHeegnerCycles:GH.5/specialization-control`
- `GeneralizedHeegnerCycles:GH.5/longo-vigni-admissibility-and-the-lambda-adic-bound`
- `GeneralizedHeegnerCycles:GH.6/lambda-structure-consequence`

### Analytic nonvanishing supplier

Hsieh’s Theorem C itself was not read; CH’s use and auxiliary-prime proof route were read. L3h must supply its exact level/discriminant/residual conditions and the resulting bounded nonzero measure before the eventual algebraic nonvanishing claim is applied.

Affected stages: GeneralizedHeegnerCycles:GH.6.

Required by:

- `GeneralizedHeegnerCycles:GH.6/anticyclotomic-nonvanishing`

### CH versus clean Howard descent

Import or extend ES.5 to the CH/Nekovář bounded-error descent under CH (H). The stronger clean Howard H0–H5 criterion or LV big image is not silently added to the fixed-weight CH conclusion.

Affected stages: GeneralizedHeegnerCycles:GH.6.

Required by:

- `GeneralizedHeegnerCycles:GH.6/selmer-rank-one`
- `GeneralizedHeegnerCycles:GH.6/selmer-rank-zero`

### LV universal-norm identification

Track finite Δ corestriction, p∤h_K, eventual augmented ideal equality and the Perrin–Riou universal-norm/Nakayama input. Verify generation of H∞ by κ̃₁ rather than infer it from nonvanishing of κ̃₁.

Affected stages: GeneralizedHeegnerCycles:GH.3, GeneralizedHeegnerCycles:GH.6.

Required by:

- `GeneralizedHeegnerCycles:GH.3/universal-norm-heegner-class`
- `GeneralizedHeegnerCycles:GH.6/universal-norm-module-rank-one`

### Parity supplier and sign convention

Supply Nekovář’s corrected family parity theorem and check its local family hypotheses. Use parity residue (1−ε)/2; the final congruence in the CH author-copy proof printed with ε alone cannot distinguish the two root signs modulo 2.

Affected stages: GeneralizedHeegnerCycles:GH.6.

Required by:

- `GeneralizedHeegnerCycles:GH.6/selmer-parity`

### Hida point and representation tower exports

Extend the finite-level CM point interface to shared p-parts of conductor/level; provide the ordinary rank-two Hida representation and specialization with its bad-prime residual hypotheses. A weight-two Hecke representation and fixed-weight Hida control alone do not give the complete tower contract.

Affected stages: GeneralizedHeegnerCycles:GH.7.

Required by:

- `GeneralizedHeegnerCycles:GH.7/howard-family-tower`
- `GeneralizedHeegnerCycles:GH.7/family-representation-specialization`

## Integrated units and structural proposals

The checkpoint IDs retained as declarations remain stable. The following six source units are refined as recorded in the packet; the two bundled GH.0/GH.1 IDs are aliases rather than duplicate declaration nodes.

**GeneralizedHeegnerCycles:GH.0/the-variety-X-r-and-its-smooth-proper-model** supplies:

- `GeneralizedHeegnerCycles:GH.0/generalized-kuga-sato-variety-and-its-projector`
- `GeneralizedHeegnerCycles:GH.0/cm-product-good-model`

**GeneralizedHeegnerCycles:GH.1/generalized-heegner-cycles-and-their-abel-jacobi-images** supplies:

- `GeneralizedHeegnerCycles:GH.1/generalized-heegner-cycle`
- `GeneralizedHeegnerCycles:GH.1/homological-triviality-of-generalized-heegner-cycles`
- `GeneralizedHeegnerCycles:GH.1/etale-abel-jacobi-map`
- `GeneralizedHeegnerCycles:GH.1/p-adic-abel-jacobi-map`
- `GeneralizedHeegnerCycles:GH.4/bdp-special-value-formula`

**GeneralizedHeegnerCycles:GH.2/local-condition-at-p-and-the-castella-hsieh-corrections** supplies:

- `GeneralizedHeegnerCycles:GH.2/finite-local-abel-jacobi-class`
- `GeneralizedHeegnerCycles:GH.2/local-condition-at-p-and-the-castella-hsieh-corrections`

**GeneralizedHeegnerCycles:GH.4/castella-hsieh-abel-jacobi-formula-and-big-logarithm-reciprocity** supplies:

- `GeneralizedHeegnerCycles:GH.4/ramified-character-abel-jacobi-formula`
- `GeneralizedHeegnerCycles:GH.4/castella-hsieh-abel-jacobi-formula-and-big-logarithm-reciprocity`

**GeneralizedHeegnerCycles:GH.5/longo-vigni-admissibility-and-the-lambda-adic-bound** supplies:

- `GeneralizedHeegnerCycles:GH.5/longo-vigni-admissible-triple`
- `GeneralizedHeegnerCycles:GH.5/longo-vigni-admissibility-and-the-lambda-adic-bound`

**GeneralizedHeegnerCycles:GH.6/selmer-consequences-with-the-corrected-dimension-formula** supplies:

- `GeneralizedHeegnerCycles:GH.6/selmer-rank-one`
- `GeneralizedHeegnerCycles:GH.6/selmer-rank-zero`
- `GeneralizedHeegnerCycles:GH.6/selmer-consequences-with-the-corrected-dimension-formula`
- `GeneralizedHeegnerCycles:GH.6/selmer-parity`

**GeneralizedHeegnerCycles, ModularCurvesPartII, AbelianSchemesAndArithmeticModuli**. Apply reviewed RS-06 ownership: R14.3 supplies the universal family/cohomology/projector carrier and A.3 its relative symmetric-power realization. GH.0 owns only the fixed CM factor, product and cycle-specific coefficients. Extend R14.3 to the explicitly requested higher fiber-power interface; keep GH.0 at the CM/product boundary. Add R14.3→GH.0 and A.3→GH.0 supplier edges when the exports are available.

**EulerSystemsAndKolyvaginSystems, GeneralizedHeegnerCycles, HeegnerPointEulerSystems**. RT-iwasawa-1/10 fixes generic Howard ownership at ES.5 and ES.8. The higher-weight application verifies hypotheses and supplies κ; it does not reproduce generic descent. Keep Howard DVR theory in ES.5 and Λ patching in ES.8. Add ES.5→GH.5 and ES.8→GH.5; keep the distinct bounded-error CH adapter as a requested ES.5 extension. Record HE.6→HE.8 for the point application without editing that owner.

**AutomorphicPadicLFunctions, GeneralizedHeegnerCycles, GrossZagierAndArithmeticHeights**. RT-iwasawa-1/11 separates one GL₂ square-root distribution owner from its generalized-cycle special value and weight-zero applications. L3h owns the GL₂ BDP/CH measure and family measure interpolation; GH.4 owns BDP Theorem 5.13 and the CH cycle identities; GZ.9 imports m=0 and owns its quaternionic/exceptional variants. Record L3h→GZ.9 and GH.4→GZ.9, with no duplicated BDP measure.

**PadicHodgeRegulators, GeneralizedHeegnerCycles, AutomorphicCongruences**. RT-iwasawa-1/27 prefers the local regulator owner for Yager/unramified tower and big exponentials. Current L3 scope is cyclotomic, so this requires a genuine supplier extension. Create Padic Hodge regulators, Part II: integral relative and ordinary-family regulators, immediately after L3, with the requested KO/CH/Castella statements and Yager module. GH.4/GH.7 import it; AC L2 retains only bounded fixed-weight BK-logarithm conventions.

**SelmerIwasawaCohomology, GeneralizedHeegnerCycles**. The arithmetic examples scope at L4 does not contain Nekovář family parity. Extend the Selmer arithmetic-consequence direction as Part II with the corrected self-dual family parity theorem; GH.6 remains its fixed-weight application.

**GeneralizedHeegnerCycles**. Six integrated source units bundled different constructions and contained an overstrong CM product-model claim. Refine the integrated GH.0 model unit into generalized-kuga-sato-variety-and-its-projector and cm-product-good-model; GH.1 bundle into cycle/descent/null-homology/AJ nodes and GH.4/bdp-special-value-formula; GH.2 into finite and corrected local conditions; GH.4 into its two fixed-weight formulas; GH.5 into admissibility, hypothesis verification and generic-bound application; GH.6 into four Selmer consequences. Keep the six integrated IDs as aliases to these refinements; the product model is local after base change, not globally over Z[1/N].

## Source corrections and editions

The three CH corrections are known author errata. The additional parity-proof slip and two LV proof/reference slips are scoped to the specific texts read. No conclusion about the inaccessible LV version of record is asserted. All findings await independent confirmation.

### GeneralizedHeegnerCycles/E1 — misprint

Theorem 6.3; corrected July 2, 2022 author copy p.27 and first item of author-hosted erratum.

Printed text (rendered transcription): “Theorem 6.3: The statement should read”.

Correction: Use ((1−ε(V_f,χ))/2)[K_p^n:K]+e, not an expression using the root sign itself as a slope.

Reason: A root number +1 gives eventual rank-zero characters and slope 0; root number −1 gives rank-one characters and slope 1.

Affects: a stated result. Existing correction: Castella–Hsieh erratum, first item; incorporated in the July 2, 2022 author copy.

Search record: Author-hosted revised HCES.pdf; Author-hosted erratum2.pdf.

### GeneralizedHeegnerCycles/E2 — error

Lemma 7.5 and its use in Proposition 7.8; author copy pp.31–32; second erratum item.

Printed text (rendered transcription): “Lemma 7.5: We have to assume further L/Qp to be unramified”.

Correction: Require absolute unramifiedness over Q_p for the Fontaine–Laffaille proof. Use KO20 Lemma 4.10’s integral Perrin–Riou argument for the required ramified-conductor derivative local condition.

Reason: Relative unramifiedness over a ramified conductor field does not put the base in the Fontaine–Laffaille setting; the authors explicitly state that the ramified version of Lemma 7.5 is not known.

Affects: the proof. Existing correction: Castella–Hsieh erratum, second item; correct replacement KO20 Lemma 4.10.

Search record: Author-hosted revised HCES.pdf and its Proposition 7.8 footnote; Author-hosted erratum2.pdf; KO author-hosted proceedings copy, Lemma 4.10.

### GeneralizedHeegnerCycles/E3 — misprint

Lemma 7.10 and explanation; author copy pp.32–33; third erratum item.

Printed text (rendered transcription): “Lemma 7.10: “...be a p-ramified extension..””.

Correction: The p-ramified extension in the lemma is abelian.

Reason: The character/class-field argument uses abelianity; it does not classify arbitrary p-ramified extensions.

Affects: a stated result. Existing correction: Castella–Hsieh erratum, third item; corrected in the July 2, 2022 author copy.

Search record: Author-hosted revised HCES.pdf; Author-hosted erratum2.pdf.

### GeneralizedHeegnerCycles/E4 — misprint

July 2, 2022 author copy, proof of Theorem 6.4, p.28, final displayed congruence; not a finding against the 2018 version of record.

Printed text (rendered transcription): “dimF Sel(K, Vf,χ ) ≡ dimF (φ) Sel(K, Vf,χφ ) ≡ ε(Vf,χ ) (mod 2),”.

Correction: The final parity residue is (1−ε(V_f,χ))/2 modulo 2, rather than ε(V_f,χ) modulo 2. The statement of Theorem 6.4 remains the parity equality.

Reason: The preceding paragraph gives dimension 0 for root sign +1 and dimension 1 for root sign −1. Both +1 and −1 are odd, so the printed residue cannot encode the former case.

Affects: the proof. Existing correction: new

Search record: CH July 2, 2022 author copy; Hsieh erratum2.pdf (all three corrections); Castella erratum.pdf (older author-hosted correction notice); Hsieh research page and exact theorem/parity web search; no correction to this proof line found.

### GeneralizedHeegnerCycles/E5 — misprint

arXiv:1605.03168v1, §5.1, p.18, opening paragraph; published text not accessible in this run.

Printed text (rendered transcription): “(5) of Assumption 2.3”.

Correction: Refer to the ordinarity clause (4) of Definition 2.1, imposed by Assumption 2.3.

Reason: Assumption 2.3 merely states admissibility; Definition 2.1 has four clauses, and its fourth clause is a_p a unit. This corrects the reference only; whether the self-dual twist satisfies the local quotient clause remains a separate recorded gap.

Affects: nothing. Existing correction: new

Search record: arXiv abstract and submission history: only v1 listed; Publisher DOI/full-text page: Incapsula access block; Longo publications page: timeout; no erratum found in primary-source search.

### GeneralizedHeegnerCycles/E6 — misprint

arXiv:1605.03168v1, §5.1, p.19, proof of Claim 2; published text not accessible in this run.

Printed text (rendered transcription): “aug(γℓ ) = aug(Φ)”.

Correction: Use equality of generated ideals aug(γ_ℓ)O_p=aug(Φ)O_p for all sufficiently large ℓ, as in the preceding paragraph. Scalar values need not become equal.

Reason: Corollary 4.3 and the recurrence prove eventual equality of ideals, with a unit factor permitted. For example, a nonzero scalar sequence satisfying x_(m+2)=a_p x_(m+1)−p^(k−1)x_m cannot be eventually constant unless a_p−p^(k−1)=1. The lifting argument only needs ideal equality.

Affects: the proof. Existing correction: new

Search record: arXiv abstract and submission history: only v1 listed; Publisher DOI/full-text page: Incapsula access block; Longo publications page: timeout; no erratum found in primary-source search.

## Sources read

Each source has its edition and file hash recorded in the packet. Only the listed sections and invoked arguments are claimed read; the full generic supplier theory is imported.

### M. Bertolini, H. Darmon, K. Prasanna; appendix B. Conrad: Generalized Heegner cycles and p-adic Rankin L-series

[Published Duke Math. J. 162 (2013), 1033–1148; 116 pages](https://www.math.mcgill.ca/darmon/pub/Articles/Research/51.BDP1/duke-publishedversion.pdf). Read 2026-10-07. SHA-256: `223bfdad6571c211a1b3e11c4688f2831f06a642eafef7c3552c9506a7188fbc`.

Passages read:

- §1.4, pp.1051–1054; §2.1–2.4, pp.1055–1064
- §3.1–3.7, pp.1064–1083; §3.8 Proposition 3.24 and its proof, pp.1086–1088
- §5.3, Assumption 5.12 and Theorem 5.13 with proof, pp.1137–1139; appendix introduction, pp.1139–1141

### F. Castella, M.-L. Hsieh: Heegner cycles and p-adic L-functions

[Author copy dated July 2, 2022, 40 pages; distinct from Math. Ann. 370 (2018)](https://www.math.ntu.edu.tw/~mlhsieh/research/HCES.pdf). Read 2026-10-07. SHA-256: `5c85ea3c0d53ce4825ade4213b930c6542bf628cba6d506bb8c3e46960f02bba`.

Passages read:

- Hypothesis (H); Proposition 3.8 and Theorem 3.9 nonvanishing statements and proof
- §4.1–4.7 cycle, norm, character and logarithm constructions
- §5.1–5.3 relative regulator, stabilization and reciprocity
- §6.1–6.4 with proofs; §7.1–7.5 descent and local condition arguments

### F. Castella, M.-L. Hsieh: Erratum to Heegner cycles and p-adic L-functions

[One-page author-hosted erratum](https://www.math.ntu.edu.tw/~mlhsieh/research/erratum2.pdf). Read 2026-10-07. SHA-256: `2a8b615daf100b0f2e8ee5890462a91dde9c860492ec920d2a1a7d5827028678`.

Passages read:

- Entire text, including all three corrections

### M. Longo, S. Vigni: Kolyvagin systems and Iwasawa theory of generalized Heegner cycles

[arXiv:1605.03168v1, May 10, 2016; findings and obligations refer to this edition](https://arxiv.org/pdf/1605.03168). Read 2026-10-07. SHA-256: `afc1a2146cae0397c5aabb337f5955d182a0dab3dd50949ec2e274426a9a5c75`.

Passages read:

- Introduction and Theorem 1.1; §2–5 (hypotheses, control, universal norms, Kolyvagin construction, rank-one module and bound)

Publisher full-text URL was opened on 2026-10-07 but returned an Incapsula access page. arXiv lists only v1; the author publications page timed out. This packet does not claim to have collated the 2019 version of record.

### F. Castella: On the p-adic variation of Heegner points

[31-page author-hosted copy of J. Inst. Math. Jussieu 19 (2020), 2127–2164](https://web.math.ucsb.edu/~castella/Heegner.pdf). Read 2026-10-07. SHA-256: `6ebd71311d6841d15d653183e9ca3adaabbe9720416e86f6731e7c1ecbb1156d`.

Passages read:

- §1 introduction and conventions; §2.1–2.7
- §3.1–3.4; §4.1–4.2; §5.1–5.2
- §6.1–6.2, through Theorem 6.5 and Remark 6.6; §6.3 is outside this part

### S. Kobayashi, K. Ota: Anticyclotomic main conjecture for modular forms and integral Perrin-Riou twists

[Author-hosted proceedings copy, 58 pages, cited by CH erratum](https://www.math.keio.ac.jp/~kurihara/20.ASPMstyle.pdf). Read 2026-10-07. SHA-256: `377cf3e5c53b00bed813a06e18ad8dac9315997497f2dabe57a435664b9764b4`.

Passages read:

- §4.7 Lemma 4.10 and its entire proof; Lemma 4.7 and Remark 4.8; integral twisting prerequisites are requested, not independently established

The invoked BDP 2017 Proposition 4.1.2 was not read. Its classical-cycle comparison is a recorded source gap, supported here only by Castella’s precise citation and normalization. Hsieh’s primary nonvanishing theorem and the full KO integral twisting prerequisites were not independently read; their exact exports remain supplier requests. The CH/Nekovář descent and parity inputs likewise require the source-qualified supplier checks stated above.

## Validation and continuation

The packet has 3 definitions, 15 constructions, 29 theorems, 3 lemmas, 15 comparisons and 1 application; 61 API items, 54 unit tests and 36 planets. Each of its 18 definition/construction nodes has at least three discriminating tests and a uses-driven API. Each stage has at most six planets. The packet checker reports no errors or warnings. Source excerpts were checked against the acquired texts, and the six source-issue records pass the errata checker through its standalone envelope.

Independent review should check source hypotheses and ownership, particularly the exact supplier contracts and three newly recorded slips. Follow-up proof closure begins at the 16 named gaps: the higher-weight modular/lattice export, cycle/regulator comparisons, bottom-conductor adapter, integral p-condition, LV local/control verification, analytic nonvanishing, source-qualified descent, universal-norm generation and family tower/regulator contracts. The [handoff](../handoff/BP-GeneralizedHeegnerCycles--GH.0.md) records their consumer nodes, source limitations and precise Lean-check status.
