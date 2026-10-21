# Critical Hecke values over totally imaginary fields

This extends ray-class distributions and Katz’s CM-field interpolation to a totally imaginary field L of degree 2d containing a CM subfield. The objects connecting these values are integral, equivariant coherent Eisenstein–Kronecker classes. Their residue construction precedes analytic current formulas; the latter identify critical values, and their ordinary theta coordinates produce p-adic measures. A totally imaginary field need not itself have a CM involution. Critical algebraic types are pulled back from its maximal CM subfield K.

The final targets are critical-value integrality with the auxiliary-ideal factor, generalized Shimura algebraicity, a weak Deligne period relation, and bounded ordinary ray-class interpolation. All statements use the conventions below and the proof obligations G1–G3. The independent inert-prime central-value direction of Burungale–Kobayashi–Ota is assigned to NonordinaryCMSpecialValues; the ordinary constructor here rejects that prime.

## Conventions and boundaries

Fix embeddings of algebraic numbers into ℂ and ℂ_p and an ordered lifted type Σ. Its complementary embeddings are barΣ; a bar on a period denotes complex conjugation, while Ω∨ denotes the dual period and is not that conjugate. Value indices are α≥1, β≥0 and derivative indices are a=α−1. Powers of several periods and factorials mean products over the appropriate embeddings. Symmetric tensors mean divided invariant tensors TSym, with their imported shuffle multiplication. Hecke characters use the ideal-character convention specified in KV.5 and arithmetic Artin as in L0. A ramified ideal-character value is zero only under the explicitly stated Euler-factor convention.

R is a noetherian arithmetic model embedded in ℂ; p-adic objects are its indicated base changes. O_(ℂ_p) is not asserted noetherian. R[1/a] has the ideal-localization convention of Kings–Sprang Notation 1.18, not an unrestricted norm-denominator inversion. Fundamental cycles are integral for torsion-free unit groups. Division by a group index requires it to be a unit or a proved divisibility statement.

Generic abelian schemes, completed Poincaré bundles and all P0–P4 tensor/trivialization APIs come from AbelianSchemesAndArithmeticModuliPartII. CM Serre tensors, eigenspaces and pairings come from ComplexMultiplicationAndExplicitReciprocity CM.0–CM.1. SchemeAndStackFoundations owns equivariant cohomology and supports; ComplexComparisonPartII uses the current DifferentialGeometry development for generic forms and integration. PadicMeasuresIwasawaAlgebras owns Amice theory and convolution. L0 and AL.1 own Hecke carriers, avatars and analytic L-functions, and L3 owns the CM-field Katz specialization. This roadmap owns their EK/critical-value applications.

At the pins the continuation uses native one-dimensional Schwartz Poisson summation, the finite-dimensional Gaussian Fourier transform, mellin and the Gamma Euler integral; the finite-dimensional lattice iteration and its determinant are part of the KS continuation proof. The measure carrier is Mathlib’s AbstractMeasure, namely a continuous linear functional on continuous maps; its Dirac, addition and scalar operations are used directly. NumberField.IsCMField is the existing genuine CM-field predicate and is not imposed on the extension L. The compact suggested file states only light coordinate formulas and elementary milestones over those existing carriers. The heavy class, current, Hecke-motive and theta objects in this reader require their named supplier interfaces, so they have no stand-in Lean declarations.

The split restriction-of-scalars torus is handled by Tau Ceti’s native comodule weight decomposition and scalar point action. Its generic decomposition permits torsion modules; the formula selecting unit-invariant weights requires an R-torsion-free module. Mathlib’s logarithmic unit lattice and units-modulo-torsion equivalence supply the compact real unit torus. AlgebraicTopology Stages 5–6 supply the finite-cover and cap-product interfaces described below.

## Supplier contracts

- **SchemeAndStackFoundations:SF.2**: Supply the inverse-limit comparison for the actual finite-level equivariant coherent complexes of the completed Poincaré sheaf (including the required R¹lim vanishing), affine torsion evaluation into group cohomology, and a Borel smooth/coherent comparison for a discrete unit group. Use the existing equivariant-derived-functor and localization nodes; do not infer these comparisons from the spectral-sequence name alone.
- **ComplexComparisonPartII:C1**: Extend the imported Dolbeault comparison by LF topology on compactly supported test forms and the local regularization/Poincaré lemma proving a bundle-valued current resolution on the noncompact CM Borel manifold, compatible with the finite-level Poincaré connection. Generic manifolds/forms already belong to current DifferentialGeometry.
- **ComplexComparisonPartII:C5**: Supply integration of the top real unit-torus form, Stokes for the specified current model, and compatibility of analytic residue/trace with the algebraic coherent trace. Generic integration and de Rham theory remain with current DifferentialGeometry.
- **FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1**: Supply the ordinary connected–étale decomposition and perfect Cartier/Weil pairings for finite-flat p-power torsion with O_L-idempotents; prove compatibility of the two paired isogenies and levels. This roadmap only specializes them to the lifted CM type.
- **PadicMeasuresIwasawaAlgebras:L2**: Supply a basis-independent Amice equivalence between bounded O_(ℂ_p)-valued measures on the finite-free rank-2d ℤ_p-module O_L⊗ℤ_p and integral functions on its formal character torus. Include product/base-change naturality, translations and invariant differential moments, so changing the two CM bases commutes with the transform; the one-variable field-valued range theorem alone does not supply this integral interface.
- **PadicMeasuresIwasawaAlgebras:L3**: Supply localization of the commutative integral measure/Iwasawa algebra on a ray-class profinite abelian group and a criterion for a compatible fraction to be a bounded integral measure, stated by uniform Kummer congruences or integral divisibility. Include torsion components and common zeros of auxiliary atoms; a characterwise integrality assertion is insufficient.
- **PeriodsAndSpecialValues:PS.0**: Supply the rank-one Hecke motive M(χ), its comparison/period line and restriction-of-scalars/tensor and norm-pullback compatibilities in the convention χ of type β−α. Supply algebraic period factors for finite-order twists and Tate twists. Kings–Sprang §4.5 invokes Deligne Propositions 8.18 and 8.21; these are inputs, not assertions that those original pages were read here.
- **PeriodsAndSpecialValues:PS.1**: Supply Deligne criticality for the same Hecke-motive normalization, and the CM period expression for c⁺ modulo Qbar×. Keep the period relation (nonzero periods modulo Qbar×) separate from the normalized L-value, which can vanish.
- **AutomorphicPadicLFunctions:L0/locally-algebraic-characters**: Make the admissible Weil type set Ξ explicit: types trivial on some finite-index unit subgroup are norm pullbacks from the maximal CM subfield with parallel conjugate sum; when there is no CM subfield they are parallel norm powers. Identify Ξ with that classification, not just a necessary parallel-weight condition. Kings–Sprang §1.1, pp.7–8 supplies the needed interface; the original Serre source is not claimed as read here.
- **tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent**: Use Stage 5 items 3–4 for finite-cover transfer and the exterior-power homology of a product of circles. Supply the comparison between native discrete group (co)homology for a finite-rank free abelian Γ and singular (co)homology of Γ\EΓ through its contractible logarithmic universal cover, compatible with finite-index maps and the coefficient representation. The existing finite-deck Cartan–Leray theorem alone is not a comparison for the infinite deck group Γ. Dirichlet’s logarithmic lattice is already in Mathlib.
- **tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality**: Supply the singular local-coefficient cap product and fundamental class for the oriented compact connected real torus Γ\EΓ, with Γ torsion-free, and naturality under its finite covers. Use the existing orientation and Stage 5 comparison; identify the cap in top degree with the coefficient line and prove its projection formula. No surjective integral transfer through finite torsion is assumed.

## Mathematical proof obligations

### G1: Residue, current and p-adic sign comparison

Prove the single commuting comparison from the algebraic residue normalization through the corrected current and the oriented unit fundamental cycle to the invariant p-adic differential. Local exterior-algebra checks force the recurrence and the factor (−1)^(|β|+1), but do not alone determine its cancellation or transport in the final unsigned interpolation convention. Track every determinant permutation, conjugate-dual identification and t↦t⁻¹ coordinate change; do not assume Theorem 5.27’s proof Step 1 resolves it.

Consumers: AutomorphicPadicLFunctionsPartII:KV.3/current-equation, AutomorphicPadicLFunctionsPartII:KV.4/explicit-ek, AutomorphicPadicLFunctionsPartII:KV.5/partial-l-identity, AutomorphicPadicLFunctionsPartII:KV.8/smoothed-ray-measure, AutomorphicPadicLFunctionsPartII:KV.8/interpolation.

### G2: Uniform bounded division of smoothing factors

Prove the integral Iwasawa-algebra divisibility or uniform Kummer congruences in KV.8/bounded-desmoothing. The finite C_p example gives an explicit obstruction to deriving boundedness merely from integral individual character values. The cited de Shalit auxiliary-ideal argument was not accessible in a cleared source; no theorem from it is claimed as read.

Consumers: AutomorphicPadicLFunctionsPartII:KV.8/bounded-desmoothing, AutomorphicPadicLFunctionsPartII:KV.8/interpolation.

### G3: Integral descent to full unit groups

The torsion-free cap is integral; normalized full-unit cap can require division by the torsion order. Prove the required specific divisibility for the trace-zero residue classes at all nonunit unit-group indices. Proposition 2.27’s unrestricted homology-transfer argument does not provide it. This affects the integral critical-value theorem and the bounded p-adic construction, without asserting that either published theorem is false.

Consumers: AutomorphicPadicLFunctionsPartII:KV.5/eisenstein-integrality, AutomorphicPadicLFunctionsPartII:KV.5/partial-critical-integrality, AutomorphicPadicLFunctionsPartII:KV.5/critical-integrality, AutomorphicPadicLFunctionsPartII:KV.6/theta-class, AutomorphicPadicLFunctionsPartII:KV.7/eisenstein-measure, AutomorphicPadicLFunctionsPartII:KV.8/interpolation.

## KV.0 — Critical types and CM coefficient lines

Fix the lifted CM type of a totally imaginary field containing its maximal CM subfield, and distinguish the value index α from the derivative index a=α−1. Specify the based CM abelian datum over an arithmetic model and its two cotangent actions. Identify exactly the critical invariant divided-power coefficient lines. Generic diagonalizable-group weight decompositions, CM Serre tensors and Hodge eigenspaces are imported; only their critical-value specialization is owned here. Targets: Lifted CM types and critical coefficient indices; CM abelian data with bases and torsion; Critical coefficient invariants.

Layer dependencies: AbelianSchemesAndArithmeticModuliPartII:P0, AutomorphicPadicLFunctions:L0, ComplexMultiplicationAndExplicitReciprocity:CM.0, ComplexMultiplicationAndExplicitReciprocity:CM.1.

### KV.0/critical-types — Lifted CM types and critical coefficient indices

Let L be totally imaginary of degree 2d and contain its maximal CM subfield K. A CM type Σ_K of K determines Σ={σ:L→ℂ | σ|K∈Σ_K}; its complement is denoted barΣ, without assuming a conjugation automorphism of L. Write I_L=ℤ[Hom(L,ℂ)]. A Hecke type μ is a norm pullback from K of μ₀ with μ₀(τ)+μ₀(barτ)=w independent of τ. For finite-index Γ⊂O_L×, HCI_L(Γ) consists of these types trivial on Γ. A type is critical for Σ when μ=β−α with α:Σ→ℕ strictly positive and β:barΣ→ℕ; equivalently μ=β−a−1 with a≥0. The negative embeddings must be exactly the lifted type. Prove that these are precisely the algebraic Hecke types whose Γ-invariant coefficient lines occur below. Fields with no CM subfield contribute no such critical type.

Hypotheses:

- d≥1; specified embeddings into ℂ and a specified maximal CM subfield K when a critical type is present.

Construction / proof:

1. Import the infinity-type and unit-character classification from L0; restrict its admissibility condition along L/K.
2. Use the imported diagonalizable-group weight decomposition, then the unit theorem: a weight trivial on a finite-index subgroup is a Hecke type.
3. Separate the value exponent α from the derivative exponent a=α−1.

API:

- **critical_iff_indices** (characterisation): Criticality for fixed Σ is equivalent to the unique pair (a,β) with μ=β−a−1, a,β≥0 and μ admissible.
- **critical_restrict** (compatibility): Pullback of a critical type on K has the same positive indices on every embedding above a fixed embedding of K.
- **critical_change_units** (functoriality): Passing to Γ′⊂Γ preserves the critical type and its coefficient indices; admissible types may enlarge.

Unit tests:

- **elliptic_weight** (computation): For K=L=ℚ(i), μ(i↦i)=−2 and μ(i↦−i)=1 gives a=1, β=1, after taking Γ in the kernel of the finite unit character.
- **off_by_one** (degenerate): The type with μ|Σ=0 is not critical; a=0 corresponds to μ|Σ=−1.
- **non_cm_extension** (non-example): For L=ℚ(i,√(1+i)), the assignment α=(1,2), β=(0,0) fails norm-pullback admissibility although both α entries are positive.

Uses:

- AutomorphicPadicLFunctionsPartII:KV.0/coefficient-invariants: Select the invariant coefficient lines.
- AutomorphicPadicLFunctionsPartII:KV.8/interpolation: Specify exactly the characters being interpolated.

Checks:

- A nonconstant assignment on embeddings above the same embedding of K is rejected even when its signs fit Σ.
- No assertion that arbitrary totally imaginary fields are CM is used.

Direct dependencies: AutomorphicPadicLFunctions:L0/locally-algebraic-characters, ComplexMultiplicationAndExplicitReciprocity:CM.0/cm-type, ComplexMultiplicationAndExplicitReciprocity:CM.0/induced-and-primitive-type, mathlib:NumberField.IsCMField, tauceti:TauCeti.Comodule.isInternal_weightSpace, tauceti:TauCeti.Comodule.endOfPoint_tmul_of_mem_weightSpace.

Source: Kings–Sprang, **arXiv:1912.03657v4**, §1.1, Definition 1.2, Notation 1.3, Proposition 1.5, pp.6–8; Theorem 1.1, p.7.

Atlas planet: Critical Hecke types.

### KV.0/standard-datum — CM abelian data with bases and torsion

A standard datum consists of a noetherian affine R⊂ℂ that is an O_(L^gal)[1/d_L]-algebra; an abelian scheme A/R of dimension d with O_L-action and Lie(A) of lifted type Σ; ordered bases ω_A=(ω_A,σ) of the rank-one cotangent eigensheaves and ω_A∨=(ω_A∨,barσ) of its dual's cotangent eigensheaves; and an f-torsion section x fixed by Γ. Bases are chosen after a localization or extension where the eigensheaves become free, not postulated for every base. The covariant H=(H¹_dR(A/R))∨ has H=H(barΣ)⊕H(Σ), H(barΣ)≃ω_A∨, and H(Σ)≃Lie A. The action on ω_A,σ is σ(γ)⁻¹, while that on ω_A∨,barσ is barσ(γ). The bases identify A(ℂ) with ℂ^Σ/Λ. For an ideal a the notation R[1/a] means the intersection of localizations away from primes dividing a, as in Notation 1.18; it does not silently invert every norm denominator.

Hypotheses:

- Critical lifted type from KV.0/critical-types.
- Nf is a unit only for the unrefined torsion evaluation; KV.2/refined-evaluation has its own weaker assumption.

Construction / proof:

1. Apply the imported Serre tensor construction O_L⊗_(O_K)A₀ and its CM eigenspace theorem.
2. Trivialize the weight lines only after the permitted change of base and retain the isomorphisms under transport.

API:

- **datum_base_change** (functoriality): Transport the datum along an injective permitted base extension, carrying the bases and torsion section.
- **cotangent_weights** (characterisation): Identify the two cotangent actions with inverse Σ-weights and positive barΣ-weights.
- **datum_serre_tensor** (constructor): A CM datum for K and finite projective O_K-module O_L produce the lifted Lie type; freeness of chosen bases is an additional local condition.

Unit tests:

- **elliptic_dual** (compatibility): For a CM elliptic curve the cotangent weights on A and A∨ have the stated opposite embedding conventions.
- **basis_not_automatic** (non-example): A nontrivial invertible eigensheaf supplies a datum without a global basis until the indicated localization; the based constructor cannot accept it directly.
- **degree_four_non_cm** (compatibility): O_L⊗_(ℤ[i])A₀ for L=ℚ(i,√(1+i)) has dimension two and the lifted Σ even though L has no CM involution.

Uses:

- AutomorphicPadicLFunctionsPartII:KV.2/torsion-moments: Supply the actual Hodge coefficients.
- AutomorphicPadicLFunctionsPartII:KV.5/ideal-periods: Compare algebraic bases with periods.

Checks:

- Every use names the base, bases, lattice and Γ-action.
- No construction of abelian schemes, generic Serre tensors or CM Hodge decompositions is repeated here.

Direct dependencies: AutomorphicPadicLFunctionsPartII:KV.0/critical-types, ComplexMultiplicationAndExplicitReciprocity:CM.1/cm-serre-tensor, ComplexMultiplicationAndExplicitReciprocity:CM.1/cm-hodge-eigenspaces, ComplexMultiplicationAndExplicitReciprocity:CM.1/cm-period-pairings.

Source: Kings–Sprang, **arXiv:1912.03657v4**, Definition 1.15, Remark 1.16, equations (1.3.2)–(1.3.4), Notation 1.18, p.12; §1.2, pp.9–11.

Atlas planet: Based CM abelian data.

### KV.0/coefficient-invariants — Critical coefficient invariants

For a,β≥0 put C_(a,β)=TSym^a(ω_A)⊗TSym^β(ω_A∨)⊗det(ω_A), with multigraded divided symmetric powers imported from P0. Its Γ-action has weight β−a−1. Over R contained in a number field, C_(a,β)^Γ=C_(a,β) when that weight belongs to CI_L(Γ), and is zero otherwise. More generally, for an R-torsion-free algebraic torus module M, its Γ-invariants are the direct sum of the weights trivial on Γ, identified with HCI_L(Γ) by the imported Hecke-type classification. The coefficient lines above are finite locally free, so they satisfy the torsion-free hypothesis. The generic weight decomposition itself exists in Tau Ceti for arbitrary modules; the extra hypothesis concerns invariants under the unit subgroup, not that decomposition.

Hypotheses:

- Standard datum; finite-index Γ⊂O_L×; R embeds in a number field for the invariant-versus-zero assertion.
- For the general assertion on M, require M to be R-torsion-free (finite locally free suffices). R being a domain alone does not imply this.

Construction / proof:

1. Compute weights using the Hodge decomposition and determinant.
2. Apply the native comodule weight decomposition and point-action formula. On a nontrivial unit weight choose γ with μ(γ)−1≠0; R-torsion-freeness forces its invariant vectors to vanish. This is the missing hypothesis in Proposition 1.5 (E14).

Checks:

- At a=β=0 the determinant contributes −1 on each Σ embedding.
- Do not replace Γ-invariants by invariants of a finite torsion subgroup or assert this dichotomy over arbitrary torsion coefficient rings.
- For L=ℚ(ζ₃), R=ℤ[ζ₃,1/3], Γ=μ₆ and the weight 3σ, M=R/(2) has nonzero Γ-invariants although the weight is nontrivial over R: a primitive sixth root has weight −1, which becomes 1 modulo 2. The unrestricted-module version must be rejected.

Direct dependencies: AutomorphicPadicLFunctionsPartII:KV.0/critical-types, AutomorphicPadicLFunctionsPartII:KV.0/standard-datum, AbelianSchemesAndArithmeticModuliPartII:P0/multigrading, AbelianSchemesAndArithmeticModuliPartII:P0/shuffle-divided-powers, tauceti:TauCeti.Comodule.isInternal_weightSpace, tauceti:TauCeti.Comodule.endOfPoint_tmul_of_mem_weightSpace.

Source: Kings–Sprang, **arXiv:1912.03657v4**, Proposition 1.5, p.8; Corollary 1.14, p.11; Proposition 1.5 restricted to R-torsion-free modules as in E14.

Atlas planet: Critical coefficient invariants.

## KV.1 — Residues and equivariant Eisenstein–Kronecker classes

Specify trace-zero functions on finite étale torsion, the equivariant support-cohomology residue calculation and the completed inverse-limit comparison. Define the unique Eisenstein–Kronecker class with prescribed trace-zero residue and its invariant derivatives. Prove independence and functoriality using the existing completed Poincaré bundle. The construction retains the actual finite-level equivariant cohomology and its transition maps rather than treating a pro-sheaf as an ordinary coherent sheaf. Targets: Trace-zero functions on étale torsion; Equivariant residue and inverse-limit comparison; Equivariant coherent Eisenstein–Kronecker class; Flat derivatives of the coherent class.

Layer dependencies: AbelianSchemesAndArithmeticModuliPartII:P0, AbelianSchemesAndArithmeticModuliPartII:P1, AbelianSchemesAndArithmeticModuliPartII:P2, AutomorphicPadicLFunctionsPartII:KV.0, SchemeAndStackFoundations:SF.2.

### KV.1/trace-zero-data — Trace-zero functions on étale torsion

For an isogeny δ:A→A′ such that δ and δ∨ are étale and commute with Γ, take D=ker δ or ker δ minus the identity section, provided Γ-stable. Let U=A\D and R[D]=H⁰(D,O_D); R[D]⁰=ker(Tr_(D/R)) and R[D]^(0,Γ) its Γ-invariants. Trace is the finite-étale algebra trace, so the construction makes sense before D splits into rational points. For c-regularization use D=A[c] and f_c=Nc·1_e−1_(A[c]). If x=e choose a second coprime c′ and D=A[cc′] minus e: under the Chinese-remainder identification extend by zero the pullback of f_c from (A[c′] minus e)×A[c]. This function has trace (Nc′−1)Tr(f_c)=0; restricting f_c itself to A[c] minus e would not have trace zero.

Hypotheses:

- R affine; finite étale D/R; x∈U for every evaluation.
- For D=A[c], Nc∈R× and c prime to the relevant torsion conductor; the two-auxiliary construction also requires Nc′∈R×.

Construction / proof:

1. Use the imported finite-étale algebra and trace and restrict the induced Γ-action.
2. Check the equality deg[c]=Nc by the CM ideal action, then compute the trace of f_c.

API:

- **trace_zero_base_change** (functoriality): Finite étale base change carries R[D]⁰ into the corresponding kernel and commutes with Γ-invariants when justified, not as a blanket exactness assertion.
- **regularizer_trace** (characterisation): The CM regularizer f_c has trace zero, since rank_R R[A[c]]=Nc.
- **split_trace** (compatibility): Over a splitting base, trace agrees with the sum of function values at all geometric torsion points.

Unit tests:

- **degree_three** (computation): On a split kernel with three points f_c has values (2,−1,−1), hence trace zero.
- **constant_not_zero_trace** (non-example): On a nonempty split kernel in characteristic zero the constant function 1 is not trace zero.
- **evaluation_on_support** (non-example): With f=O_L and x=e the unmodified D=A[c] fails x∈U; a second auxiliary ideal is required.

Uses:

- AutomorphicPadicLFunctionsPartII:KV.1/ek-class: Provide residue data.
- AutomorphicPadicLFunctionsPartII:KV.5/torsion-distribution: Use f_c to smooth partial L-values.

Checks:

- Tr(f_c)=0 because A[c] has degree Nc, with no extra square on Nc.
- D and x are disjoint in every downstream application.

Direct dependencies: AutomorphicPadicLFunctionsPartII:KV.0/standard-datum, AbelianSchemesAndArithmeticModuliPartII:P2/torsion-splitting, SchemeAndStackFoundations:SF.2/localization.

Source: Kings–Sprang, **arXiv:1912.03657v4**, Definition 2.18, Notation 2.19, pp.19–20; Definition 2.26, p.22; §4.4, p.52.

Atlas planet: Trace-zero torsion data.

### KV.1/residue-calculation — Equivariant residue and inverse-limit comparison

Put F_n=P^(n)⊗Ω_A^d and F=P_hat⊗Ω_A^d. The imported completed Poincaré trace gives H^i(A,Γ,F)=0 for i<d and H^d(A,Γ,F)≃R. For I the ideal of D, local complete-intersection duality gives Ext^q(I^k/I^(k+1),F_n)=0 for q<d and H^(q−d)(D,Hom(I^k/I^(k+1),i*P^(n))) for q≥d. Consequently support cohomology vanishes below d and contains R[D]^Γ canonically in degree d; its map to H^d(A,Γ,F) is Tr_(D/R). Prove H^(d−1)(U,Γ,F)≃lim_n H^(d−1)(U,Γ,F_n), including the vanishing inverse-limit obstruction used in Corollary 2.35. Do not infer vanishing of higher equivariant cohomology from the underlying coherent calculation.

Hypotheses:

- Trace-zero datum, δ and δ∨ étale; finite symmetric levels and their compatible transition maps.
- Γ acts by automorphisms of A over the fixed base S; it acts trivially on S.

Construction / proof:

1. Import the top coherent Poincaré calculation and the equivariant spectral sequence.
2. Filter O_A/I^(k+1) by I^j/I^(j+1), use regular immersion duality and support localization.
3. Prove the required exactness/Milnor comparison for these particular pro-systems, using the SF.2 request rather than commuting cohomology and inverse limits formally.

Checks:

- The injection and trace square commute before passing to the trace-zero submodule.
- The assertion is compatible with a nontrivial Γ-action on A over the fixed base S and is not H^i(A,F)^Γ by definition.

Direct dependencies: AutomorphicPadicLFunctionsPartII:KV.1/trace-zero-data, AbelianSchemesAndArithmeticModuliPartII:P2/completed-cohomology, AbelianSchemesAndArithmeticModuliPartII:P2/poincare-top-cohomology-input, SchemeAndStackFoundations:SF.2/regular-immersion, SchemeAndStackFoundations:SF.2/support, SchemeAndStackFoundations:SF.2/spectral-sequence, SchemeAndStackFoundations:SF.2.

Source: Kings–Sprang, **arXiv:1912.03657v4**, Corollary 2.17, p.19; §2.6, Proposition 2.32 and Corollaries 2.33–2.35, pp.26–27.

Atlas planet: Equivariant residue calculation.

### KV.1/ek-class — Equivariant coherent Eisenstein–Kronecker class

Define EK_(Γ,A):R[D]^(0,Γ)→H^(d−1)(U,Γ,P_hat⊗Ω_A^d) as the unique preimage of the canonical degree-d support class of f under localization. This is an injective R-linear map with residue f and is compatible with its images at every finite Poincaré level. The definition uses derived equivariant sections in the category of Γ-linearized sheaves, not invariants taken after cohomology. Its naturality includes permitted flat base change, pullback through compatible isogeny/residue diagrams, and restriction of Γ.

Hypotheses:

- Trace-zero datum and the residue calculation.

Construction / proof:

1. The trace of f is zero, so its support class lies in the localization kernel.
2. Vanishing below d makes the preimage unique; retain the full trace square to prove injectivity and naturality.

API:

- **ek_residue** (characterisation): The localization boundary of EK(f) equals the canonical support class of f.
- **ek_linear** (structure): EK is R-linear and injective.
- **ek_naturality** (functoriality): A commuting support/trace/base-change diagram carries EK(f) to the class of the transported f, by uniqueness.

Unit tests:

- **zero_residue** (degenerate): EK(0)=0 and a class in its image with zero residue vanishes.
- **elliptic_section** (compatibility): For d=1 and Γ=1 the class is a section of P_hat⊗Ω¹ on U with the prescribed infinitesimal Kronecker residues.
- **invalid_residue** (non-example): A split two-point function with values (1,1) in characteristic zero does not lie in the constructor domain.

Uses:

- AutomorphicPadicLFunctionsPartII:KV.1/derivative-class: Differentiate its universal-vector-extension image.
- AutomorphicPadicLFunctionsPartII:KV.3/current-equation: Identify the analytic representative by residues.

Checks:

- Residue(EK(f))=f in the canonical supported submodule.
- Flatness or an explicit base-change theorem accompanies each claimed scalar-extension compatibility.

Direct dependencies: AutomorphicPadicLFunctionsPartII:KV.1/residue-calculation, AbelianSchemesAndArithmeticModuliPartII:P2/gamma-equivariance, SchemeAndStackFoundations:key/equivariant-sheaf-cohomology, SchemeAndStackFoundations:SF.2/localization.

Source: Kings–Sprang, **arXiv:1912.03657v4**, Theorem 2.20 and Definition 2.21, p.20; proof in §2.6, pp.26–27.

Atlas planet: Coherent Eisenstein–Kronecker class.

### KV.1/derivative-class — Flat derivatives of the coherent class

Let EK♮(f) be the image of EK(f) under P_hat→P_hat♮. Its a-th total derivative is ∇^a EK♮(f) in H^(d−1)(U,Γ,TSym^a Ω_A¹⊗P_hat♮⊗Ω_A^d). Iterate the integrable Poincaré connection with its symmetric tensor convention, so that subsequent projection to a multi-index a produces the factorial a! in the analytic evaluation. The construction is made at finite levels and assembled as a compatible pro-class.

Hypotheses:

- Standard residue data; the imported universal vector extension, Poincaré connection and divided symmetric power convention.

Construction / proof:

1. Apply the imported flat connection at each symmetric level and symmetrize by the P0 comparison convention.
2. Use integrability for the symmetric target and Γ-equivariance to descend to equivariant cohomology.

API:

- **derivative_zero** (simp): ∇⁰EK♮(f)=EK♮(f).
- **derivative_equivariance** (compatibility): The derivative commutes with the Γ-action and the permitted pullbacks.
- **derivative_multigrading** (relation): Projection to the a-index component agrees with iterated coordinate derivatives with the P0 factorial convention.

Unit tests:

- **degree_zero** (degenerate): At a=0 the image is the original pro-class, without an extra factorial.
- **second_coordinate_derivative** (computation): For a coordinate monomial z² the second ordinary derivative is 2; the divided-power basis conversion must account for this factor.
- **mixed_derivatives** (computation): For two commuting coordinate directions the (1,1) derivative of z₁z₂ is 1, not 2.

Uses:

- AutomorphicPadicLFunctionsPartII:KV.2/torsion-moments: Evaluate flat derivatives at torsion and take moments.

Checks:

- The zero-th derivative is EK♮ itself.
- The derivative/moment comparison records the ordinary versus divided-power factorial; no division by a! over a general integral R is made.

Direct dependencies: AutomorphicPadicLFunctionsPartII:KV.1/ek-class, AbelianSchemesAndArithmeticModuliPartII:P1/universal-vector-extension, AbelianSchemesAndArithmeticModuliPartII:P1/vector-extension-hodge, AbelianSchemesAndArithmeticModuliPartII:P0/divided-power-comparison, AbelianSchemesAndArithmeticModuliPartII:P2/completed-poincare.

Source: Kings–Sprang, **arXiv:1912.03657v4**, Definitions 2.21 and 2.23, pp.20–21.

## KV.2 — Critical evaluation and integral refinement

Evaluate at torsion by the imported splitting principle and group moment maps, then cap the critical group-cohomology component with the oriented free-unit fundamental cycle. Establish finite-index scaling, the refined evaluation that does not invert Nf, and its comparison with the unrefined value. Compare the residue class with the imported logarithm/polylogarithm construction. For unit groups with torsion, normalized evaluation is integral only where the torsion order is invertible or a separate divisibility theorem applies. Targets: Torsion specialization and group-cohomology moments; Orientation-normalized critical Eisenstein classes; Change of unit subgroup with its normalization; Refined evaluation without inverting the conductor norm; Comparison of refined and unrefined evaluations; Comparison with the de Rham polylogarithm.

Layer dependencies: AbelianSchemesAndArithmeticModuliPartII:P2, AbelianSchemesAndArithmeticModuliPartII:P3, AutomorphicPadicLFunctionsPartII:KV.0, AutomorphicPadicLFunctionsPartII:KV.1, ComplexMultiplicationAndExplicitReciprocity:CM.1, SchemeAndStackFoundations:SF.2, tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent, tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality.

### KV.2/torsion-moments — Torsion specialization and group-cohomology moments

Let x∈U(R) be fixed by Γ and killed by φ:A→B with φ∨ étale (equivalently the required lifted universal-extension map is étale). Pull ∇^a EK♮(f) back to x, apply the imported torsion splitting and the b-th moment, and use affine equivariant/coherent comparison. This defines Eis^(b,a)_Γ(f,x)∈H^(d−1)(Γ,TSym^a ω_A⊗TSym^b H⊗det ω_A). Here a,b are total nonnegative degrees; in multi-index notation a,β denote multi-indices with these total degrees. The splitting is the one normalized by the Poincaré rigidification, not an arbitrary trivialization at x.

Hypotheses:

- Affine standard datum; x avoids D; φ∨ étale; f trace zero and Γ-invariant.

Construction / proof:

1. Evaluate the finite-level derivative on x, then take mom_b using P2/torsion-splitting and P2/group-moment-map.
2. Apply the SF.2 affine comparison to identify equivariant coherent cohomology on Spec R with group cohomology.

API:

- **moment_naturality** (functoriality): Compatible isogenies, torsion sections and pullbacks commute with specialization and moment maps.
- **moment_degree_zero** (simp): For b=0 the moment is the rigidified augmentation.
- **moment_linear** (structure): For fixed (x,b,a), the class depends R-linearly on f.

Unit tests:

- **non_torsion_rejected** (non-example): An arbitrary non-torsion x has no canonical torsion splitting and cannot enter this constructor.
- **bad_integral_isogeny** (non-example): At residue characteristic p a p-torsion point whose killing dual is not étale only gives the generic-fiber construction.
- **elliptic_zero_degree** (compatibility): For d=1, Γ=1 and a=b=0 this is the scalar value of the augmented Kronecker section at x.

Uses:

- AutomorphicPadicLFunctionsPartII:KV.2/critical-evaluation: Project to invariant CM components.
- AutomorphicPadicLFunctionsPartII:KV.6/differential-moments: Match algebraic moments with canonical formal differentials.

Checks:

- The target contains H, not H¹_dR with the contravariant action.
- The zero moment is the augmentation of the torsion splitting.

Direct dependencies: AutomorphicPadicLFunctionsPartII:KV.1/derivative-class, AbelianSchemesAndArithmeticModuliPartII:P2/torsion-splitting, AbelianSchemesAndArithmeticModuliPartII:P2/group-moment-map, SchemeAndStackFoundations:SF.2.

Source: Kings–Sprang, **arXiv:1912.03657v4**, Definition 2.24 and equations (2.3.3)–(2.3.4), p.21; Remark 2.25, p.22.

Atlas planet: Torsion moments.

### KV.2/critical-evaluation — Orientation-normalized critical Eisenstein classes

First take Γ torsion-free of rank d−1. Project Eis^(b,a) through H→ω_A∨, then to the critical (a,β) component C_(a,β). Cap with the fundamental class of BΓ=Γ\EΓ, EΓ={(r_i)>0:∏r_i=1}, using the orientation ∧_(i<d)dr_i/r_i. An ordering of Σ also identifies det ω_A with the multidegree-one tensor line; the two permutation signs cancel. Use the rank-one divided-tensor identification u^[a]⊗u↦u^[a+1] on each weight line, rather than shuffle multiplication. This gives EK^(β,a)_Γ(f,x)∈TSym^(a+1)ω_A⊗TSym^βω_A∨. Its coordinate in the chosen divided-power bases is denoted e_(β,a). For Γ with finite torsion T, define the normalized version only after |T| is a unit: choose a free complement Γ₀, evaluate there, and divide by |T|. Prove independence of the complement after this localization. No integral map on arbitrary H^(d−1)(Γ,−) for all torsion Γ is asserted.

Hypotheses:

- Critical β−a−1∈CI_L(Γ); Nf∈R× for this evaluation; torsion-free Γ for the integral version.
- For the torsion-normalized extension, |Γ_tors|∈R× is an explicit extra hypothesis.

Construction / proof:

1. Use coefficient-invariants. The native logarithmic unit lattice and units-modulo-torsion equivalence identify Γ\EΓ with an oriented compact torus. Apply the requested comparison of group cohomology with its singular local-system model and the imported cap product. Glue the rank-one shift from local generators; its degree a+1 homogeneity makes it basis-independent.
2. Check ordering independence by simultaneous orientation and determinant changes.
3. Use transfer only in its valid form: in degree zero transfer across a finite-index subgroup multiplies by the index. The unrestricted surjectivity assertion in Proposition 2.27 is not used (E11).

API:

- **orientation_permutation** (compatibility): Permuting the ordered embeddings changes the fundamental orientation and determinant identification by the same sign, leaving EK unchanged.
- **critical_coordinate** (data): The selected bases identify the critical tensor line with R and define e_(β,a).
- **torsion_normalized_extension** (compatibility): When |T| is invertible, normalized evaluation is |T|⁻¹ times evaluation on a free complement and satisfies full-index change of group.
- **critical_rank_one_shift** (compatibility): For an invertible weight line, the canonical identification TSym^a(M)⊗M≃TSym^(a+1)(M) sends u^[a]⊗u to u^[a+1]. It is independent of the local generator and is distinct from shuffle multiplication, which gives (a+1)u^[a+1].

Unit tests:

- **rank_zero_cap** (degenerate): For d=1, Γ=1 and C=R, cap is the identity R→R.
- **two_embedding_swap** (compatibility): For d=2 a transposition reverses the BΓ orientation and the determinant basis, leaving the final tensor unchanged.
- **torsion_denominator** (non-example): For d=1 and Γ=μ₂ over a ring with 2 noninvertible, no extension of cap on all H⁰ with the claimed index rule can be integral: it would send 1 to 1/2.
- **rank_one_shift_degree_one** (computation): For a free rank-one line Ru and a=1, the determinant shift sends u⊗u to u^[2], whereas shuffle multiplication gives 2u^[2]. The shift remains an isomorphism when 2 is a nonunit.

Uses:

- AutomorphicPadicLFunctionsPartII:KV.4/explicit-ek: Compare cap evaluation with the orbit Eisenstein series.
- AutomorphicPadicLFunctionsPartII:KV.6/theta-class: Use the same cap convention on formal functions.

Checks:

- For d=1 and Γ=1 the cap product is ordinary degree-zero evaluation.
- For Γ=μ₂ and Γ₀=1, normalized evaluation requires 1/2; it is not an arbitrary integral R-linear operation.

Direct dependencies: AutomorphicPadicLFunctionsPartII:KV.2/torsion-moments, AutomorphicPadicLFunctionsPartII:KV.0/coefficient-invariants, SchemeAndStackFoundations:SF.2, mathlib:NumberField.Units.logEmbeddingEquiv, mathlib:NumberField.Units.instZLattice_unitLattice, AbelianSchemesAndArithmeticModuliPartII:P0/divided-power-comparison, tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent, tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality.

Source: Kings–Sprang, **arXiv:1912.03657v4**, Definitions 2.26 and 2.28, pp.22–23; Proposition 2.27 and diagram (2.4.2), pp.22–23, with the torsion correction E11.

Atlas planet: Critical Eisenstein classes.

### KV.2/finite-index — Change of unit subgroup with its normalization

For torsion-free Γ′⊂Γ of finite index m, restriction of the equivariant class followed by the critical cap construction satisfies EK^(β,a)_(Γ′)(f,x)=m·EK^(β,a)_Γ(f,x). The same formula holds for the torsion-normalized extensions when both torsion orders are units. For integral classes with torsion orders nonunits retain the torsion-free value and its multiplicity; do not cancel m without a divisibility theorem for that particular class.

Hypotheses:

- Both groups fix f and x; β−a−1 is trivial on Γ.

Construction / proof:

1. Use the finite covering BΓ′→BΓ, cap-product projection formula and orientation conventions.
2. For the localized extension reduce to free complements and compare their indices.

Checks:

- A covering of oriented circles of degree m scales the integral by m.
- The case μ₂⊃1 is not passed off as an integral surjective transfer.

Direct dependencies: AutomorphicPadicLFunctionsPartII:KV.2/critical-evaluation, tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent, tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality.

Source: Kings–Sprang, **arXiv:1912.03657v4**, Corollary 2.29, p.24, restricted or localized as explained for Proposition 2.27 (E11).

### KV.2/refined-evaluation — Refined evaluation without inverting the conductor norm

Let x be f-torsion, c≠O_L coprime to f, Nc∈R×, D=A[c], and B=A(f⁻¹). Without assuming Nf∈R×, map EK♮_A(f) to the pullback of P_hat♮_B via [f]_# and transport the determinant by [f]∨*. Differentiate using the connection on B, evaluate at x (whose image in B is zero), take the moment at e_B, project and cap for a torsion-free Γ. This gives _[f]EK^(β,a)_(Γ,B)(f,x)∈TSym^(a+1)ω_B⊗TSym^βω_B∨ over R. The symbol f for the residue function is distinguished from the ideal f in all formal signatures.

Hypotheses:

- Standard based data for A and B; x∈U and fixed by torsion-free Γ; critical indices.
- [f] itself and its dual may fail to be étale.

Construction / proof:

1. Push the Poincaré coefficient before differentiating so specialization takes place at the identity of B.
2. Use the identity splitting at e_B instead of an unavailable integral splitting at x on A.
3. Apply the same critical projection and torsion-free orientation as above.

API:

- **refined_identity** (simp): For the identity isogeny the refined procedure agrees with the ordinary evaluation whenever the latter is defined.
- **refined_integral_coordinate** (data): Chosen B-bases identify the refined tensor with a scalar in R, without inverting Nf.
- **refined_isogeny_naturality** (functoriality): Composition of compatible ideal isogenies agrees with iterated pushforward, connection pullback and identity moments.

Unit tests:

- **nonunit_conductor** (compatibility): At a prime dividing Nf the constructor still has an R-valued target, provided Nc is invertible.
- **nonunit_auxiliary** (non-example): If Nc is a nonunit, this theorem does not assert a residue-class construction from an étale c-kernel.
- **identity_map** (compatibility): With [f]=id the pushforward and transported connection are identities and the zero-th moment is unchanged.

Uses:

- AutomorphicPadicLFunctionsPartII:KV.2/integral-comparison: Control denominators in the ordinary class.
- AutomorphicPadicLFunctionsPartII:KV.5/eisenstein-integrality: Prove integral normalized Eisenstein sums.

Checks:

- The result lies over R, with no 1/Nf introduced in the constructor.
- Nc is still a unit; the refinement removes only the evaluation conductor denominator.
- Removing Nf from the denominators does not remove the separate unit-group torsion normalization; keep the hypotheses of critical-evaluation and G3.

Direct dependencies: AutomorphicPadicLFunctionsPartII:KV.1/derivative-class, AutomorphicPadicLFunctionsPartII:KV.2/critical-evaluation, AbelianSchemesAndArithmeticModuliPartII:P2/isogeny-functoriality, AbelianSchemesAndArithmeticModuliPartII:P2/poincare-comultiplication, ComplexMultiplicationAndExplicitReciprocity:CM.1/cm-serre-tensor.

Source: Kings–Sprang, **arXiv:1912.03657v4**, Theorem 2.30 and its construction, pp.24–25, with the torsion-free cap convention.

Atlas planet: Refined Eisenstein classes.

### KV.2/integral-comparison — Comparison of refined and unrefined evaluations

After the injective scalar extension R→R[1/Nf], the two classes satisfy TSym^(a+1)([f]*) (_[f]EK_(Γ,B)^(β,a))=TSym^β([f]_#)(EK_(Γ,A)^(β,a)), with coefficient lines transported as in equation (2.5.1). Thus the right-hand transported ordinary class has its coordinate in R in the mixed bases of A and B∨. The statement first uses torsion-free Γ; a torsion-normalized version carries its separate index/divisibility condition.

Hypotheses:

- Refined-evaluation hypotheses; R⊂ℂ so the indicated scalar extension is injective.

Construction / proof:

1. Compare the two torsion splittings after [f] and its dual become étale.
2. Use connection/isogeny compatibility and the moment comultiplication square; descend equality along the injective base extension.

Checks:

- The comparison map on ω_A and the map on ω_A∨ are not interchanged.
- An equality after localization is used only with the stated injective coefficient map.

Direct dependencies: AutomorphicPadicLFunctionsPartII:KV.2/refined-evaluation, AutomorphicPadicLFunctionsPartII:KV.2/torsion-moments, AbelianSchemesAndArithmeticModuliPartII:P2/isogeny-functoriality.

Source: Kings–Sprang, **arXiv:1912.03657v4**, Equation (2.5.1) and Proposition 2.31, p.25.

Atlas planet: Refined integrality comparison.

### KV.2/polylog — Comparison with the de Rham polylogarithm

For S=Spec(k), where k has characteristic zero, the Hodge-to-de Rham edge map sends EK♮_Γ(f) to the de Rham realization of the equivariant polylogarithm with residue f in degree 2d−1 on U. Its analytic image is the residue-normalized solution of ∇φ=δ_f·vol. This is a comparison of the existing Poincaré/logarithm-sheaf models with this residue class; no independent polylogarithm carrier is introduced.

Hypotheses:

- The base is the spectrum of a characteristic-zero field; take a chosen embedding into ℂ for the analytic assertion. No comparison over arbitrary characteristic-zero bases is claimed.
- Finite Poincaré levels, flat connection and equivariant support comparison; compatible residue trace.

Construction / proof:

1. Apply P3/logarithm-comparison, then the Hodge edge morphism.
2. Characterize both classes by their normalized residue and the vanishing computation.

Checks:

- The de Rham degree is 2d−1, distinct from the coherent degree d−1.
- Residue compatibility is checked rather than inferred from an isomorphism of unrigidified bundles.
- Do not use this field-base comparison as a theorem giving an absolute logarithm-sheaf connection over an arbitrary arithmetic model.

Direct dependencies: AutomorphicPadicLFunctionsPartII:KV.1/ek-class, AutomorphicPadicLFunctionsPartII:KV.1/derivative-class, AbelianSchemesAndArithmeticModuliPartII:P3/logarithm-comparison.

Source: Kings–Sprang, **arXiv:1912.03657v4**, Remark 2.37, p.29; Remark 3.21, p.41.

## KV.3 — Analytic representatives and current normalization

Construct the CM Borel differential complex using imported forms and the bundle-valued current resolution. Define the generalized lattice Eisenstein–Kronecker functions, their gamma-completed Mellin continuation and their phase-sensitive functional equation. Normalize the current by the corrected contraction recurrence and verify its differential equation with the specified residue. Distinguish the poles of K from those of π^(−s)Γ(s)K; keep the inverse covolume factor and the negative trace-Fourier convention. Targets: Unit Borel model and relative Dolbeault complex; Relative currents and residue-normalized integration; Generalized Eisenstein–Kronecker series; Poisson continuation with completed residues; Residue-normalized Eisenstein–Kronecker current; The current realizes the coherent class.

Layer dependencies: AbelianSchemesAndArithmeticModuliPartII:P0, AbelianSchemesAndArithmeticModuliPartII:P3, AutomorphicPadicLFunctionsPartII:KV.0, AutomorphicPadicLFunctionsPartII:KV.1, AutomorphicPadicLFunctionsPartII:KV.2, ComplexComparisonPartII:C1, ComplexComparisonPartII:C5, SchemeAndStackFoundations:SF.2.

### KV.3/borel-complex — Unit Borel model and relative Dolbeault complex

For torsion-free Γ of rank d−1 set EΓ={(r_i)>0:∏r_i=1} with γ·r=(|σ_iγ|²r_i), and BΓ=Γ\EΓ. On A(ℂ) let γ·z=(σ_iγ⁻¹z_i). The product action gives the Borel model. Define relative bidegrees by E^(1,0)=pr_A*E_A^(1,0) and E^(0,1)=pr_A*E_A^(0,1)⊕pr_E*E_E¹. The real dimension is 3d−1 and the maximum bidegree is (d,2d−1). With the imported smooth Poincaré connection, the complex of Γ-invariant (d,•)-forms with its ∇″ differential computes the equivariant coherent class at each finite level; assemble the pro-model using the verified inverse-limit comparison.

Hypotheses:

- Standard complex datum; torsion-free Γ; compact torus BΓ from the unit theorem.

Construction / proof:

1. Use the generic Borel comparison requested from SF.2.
2. Combine the relative real de Rham resolution on EΓ with the imported P3 Dolbeault resolution on A.
3. Verify the product action preserves the r-dependent Hermitian metric and the bidegree.

API:

- **borel_metric_invariance** (compatibility): H_(γr)(γz,γw)=H_r(z,w) for H_r(z,w)=Σr_i z_i barw_i.
- **borel_forms_comparison** (equivalence): The Γ-invariant relative Dolbeault complex calculates the stated equivariant coherent cohomology.
- **borel_orientation** (data): The ordered coordinates r₁,…,r_(d−1) give the orientation used by critical cap evaluation.

Unit tests:

- **rank_zero** (degenerate): For d=1 the constraint r₁=1 leaves EΓ a point.
- **metric_scale** (compatibility): Multiplying z_i by σ_iγ⁻¹ and r_i by |σ_iγ|² leaves r_i|z_i|² fixed; using γ instead breaks this test.
- **total_dimension** (computation): At d=2 the model has real dimension five and currents have complementary second degree 3−q, not 2−q.

Uses:

- AutomorphicPadicLFunctionsPartII:KV.3/current-resolution: Define test forms of the correct complementary degree.
- AutomorphicPadicLFunctionsPartII:KV.4/fibre-integral: Integrate over the oriented compact unit torus.

Checks:

- For d=1, EΓ is a point and the model reduces to the ordinary Dolbeault complex on A.
- The group action on z is inverse to that on units, while r scales by absolute squares.

Direct dependencies: AutomorphicPadicLFunctionsPartII:KV.0/standard-datum, AutomorphicPadicLFunctionsPartII:KV.1/residue-calculation, AbelianSchemesAndArithmeticModuliPartII:P3/smooth-dolbeault, SchemeAndStackFoundations:SF.2, mathlib:NumberField.Units.logEmbeddingEquiv, mathlib:NumberField.Units.instZLattice_unitLattice.

Source: Kings–Sprang, **arXiv:1912.03657v4**, §3.2, equation (3.2.1), Definition 3.7 and Lemma 3.8, pp.33–34.

Atlas planet: Unit Borel model.

### KV.3/current-resolution — Relative currents and residue-normalized integration

On A(ℂ)×EΓ define D^(p,q) as the continuous dual of compactly supported smooth test forms of bidegree (d−p,2d−1−q), with their usual inductive-limit smooth topology. For a smooth form ω its current is η↦∫η∧ω; extend the differential by this pairing with the graded sign fixed by Stokes. Construct the Γ-equivariant bundle-valued finite-level current complex and prove the inclusion from forms is a quasi-isomorphism. Fix its local Thom/residue normalization to match the algebraic support trace used in KV.1; in particular the current δ_t·vol has residue the rigidified unit at t. These are the relative bigraded complexes specific to the unit Borel model; generic test-form topology and local current regularization are supplied by the C1 request.

Hypotheses:

- Borel model; smooth Poincaré coefficients at finite levels; compact supports for tests.

Construction / proof:

1. Use C1 local regularization and its homotopy to compare smooth forms and currents, then glue by fine resolutions.
2. Apply the comparison equivariantly at finite levels and retain pro-compatibility.
3. Compute the local oriented-disc residue of δ_t·vol to fix the trace convention, not just its absolute scalar.

API:

- **form_to_current** (coercion): A smooth (p,q)-form defines a continuous functional on compact test forms by η↦∫η∧ω.
- **current_differential** (compatibility): The dual differential agrees with the smooth differential on embedded forms, with the graded sign from Stokes.
- **current_local_comparison** (equivalence): The finite-level form/current inclusion is a Γ-compatible quasi-isomorphism and preserves the local residue trace.

Unit tests:

- **complementary_degree** (computation): For d=1 a (1,0)-current tests (0,1)-forms, so their wedge is top real degree two.
- **delta_trace** (compatibility): A single point Thom current pairs to 1 against a test function equal to 1 near that point under the chosen residue convention.
- **noncontinuous_dual** (non-example): A discontinuous algebraic functional on the smooth test-form space is excluded, even if it has the correct linear type.

Uses:

- AutomorphicPadicLFunctionsPartII:KV.3/normalized-current: Interpret the Fourier sums as currents.
- AutomorphicPadicLFunctionsPartII:KV.3/current-equation: Identify the current with the coherent EK class by residue.

Checks:

- Continuity of the linear functional is required; the algebraic dual alone is too large.
- The order η∧ω is used consistently in differentiation, contraction and fibre integration.

Direct dependencies: AutomorphicPadicLFunctionsPartII:KV.3/borel-complex, AbelianSchemesAndArithmeticModuliPartII:P3/smooth-dolbeault, ComplexComparisonPartII:C1, ComplexComparisonPartII:C5.

Source: Kings–Sprang, **arXiv:1912.03657v4**, Definition 3.9 and Corollary 3.10, p.34; Corollary 3.22, p.41.

### KV.3/kronecker-series — Generalized Eisenstein–Kronecker series

For a full lattice Λ⊂ℂ^d, H(z,w)=Σh_i z_i barw_i with h_i>0 and alternating pairing ⟨z,w⟩=Im H(z,w), define K^ν(H,z,w,s,Λ)=Σ_(λ∈Λ,λ≠−z) overline(z+λ)^ν · exp(2πi⟨λ,w⟩)/‖z+λ‖_H^(2s). The numerator is antiholomorphic. The positive real power is defined through its real logarithm before analytic continuation. Define Λ*={ℓ:⟨ℓ,Λ⟩⊂ℤ} and the completed Mellin function M^ν(s)=π^(−s)Γ(s)K^ν(s). In Re(s)>d+|ν|/2 the series converges absolutely and normally on compact sets with a uniform distance from nonomitted lattice singularities. Periods and the chosen H fix the covolume vol_HΛ.

Hypotheses:

- ν∈ℕ^d; full real rank 2d lattice; positive diagonal Hermitian form.

Construction / proof:

1. Estimate numerator growth against the 2d-dimensional lattice count.
2. Construct the holomorphic-in-s sum in the convergence half-plane and its translation/multiplicative characters; reserve the continued object for the next target.

API:

- **kronecker_lattice_translation** (functoriality): Reindexing λ under a lattice translation of z gives the corresponding exponential multiplier.
- **kronecker_convergence** (characterisation): Absolute convergence holds in Re(s)>d+|ν|/2, locally uniformly away from moving lattice singularities.
- **kronecker_completion** (relation): In the convergence region M^ν=π^(−s)Γ(s)K^ν; continuation respects this identity.

Unit tests:

- **square_lattice** (computation): For d=1, ν=0, H standard and z=w=0, K is Σ_(m,n)≠(0,0)(m²+n²)^(−s).
- **conjugate_numerator** (computation): For ν=1 and z+λ=i the numerator is −i, rather than i.
- **omitted_zero** (degenerate): For z∈Λ the λ=−z term is excluded and never evaluated as 0 divided by 0.

Uses:

- AutomorphicPadicLFunctionsPartII:KV.3/mellin-continuation: Prove the functional equation by Poisson–Mellin analysis.
- AutomorphicPadicLFunctionsPartII:KV.4/fibre-integral: Convert r-dependent Kronecker series to unit-orbit sums.

Checks:

- A term with λ=−z is omitted before applying logarithms.
- K and M are separate names; their residues are not interchangeable.

Direct dependencies: AutomorphicPadicLFunctionsPartII:KV.3/borel-complex, ComplexComparisonPartII:C1, mathlib:Complex.Gamma_eq_integral.

Source: Kings–Sprang, **arXiv:1912.03657v4**, Definition 3.11 and Remark 3.12, p.35.

Atlas planet: Eisenstein–Kronecker series.

### KV.3/mellin-continuation — Poisson continuation with completed residues

K^ν extends meromorphically, and its completion satisfies M^ν(H,z,w,s,Λ)=exp(2πi⟨w,z⟩)/vol_HΛ · M^ν(H,w,z,d+|ν|−s,Λ*). The possible simple residues of M are −δ_(ν=0,z∈Λ) exp(2πi⟨−z,w⟩) at s=0 and δ_(ν=0,w∈Λ*)/vol_HΛ at s=d. Hence K is regular at zero and, when ν=0 and w∈Λ*, has residue π^d/(Γ(d)vol_HΛ) at d. These are corrected normalization statements, not the uncompleted residues attributed in Proposition 3.13 (E9).

Hypotheses:

- Kronecker-series hypotheses; the dual and volume use the same alternating pairing.

Construction / proof:

1. Choose a real lattice basis and reduce lattice Poisson summation to iterated native SchwartzMap.tsum_eq_tsum_fourier on ℤ. Transform the Gaussian using native fourier_gaussian_innerProductSpace, differentiate to obtain the antiholomorphic moments, and retain the linear-change determinant/covolume. Absolute Schwartz decay justifies the iteration and differentiation.
2. Use its phase exp(2πi⟨w,z⟩), split the Mellin integral at t=1 and isolate the zero-frequency terms.
3. Multiply by π^s/Γ(s) only after calculating residues of M.

Checks:

- Applying the functional equation twice gives identity using vol(Λ*)=vol(Λ)⁻¹ and ⟨z,w⟩=−⟨w,z⟩.
- For Λ=ℤ[i], K⁰(s) has residue π at 1 and no pole at zero.

Direct dependencies: AutomorphicPadicLFunctionsPartII:KV.3/kronecker-series, ComplexComparisonPartII:C1, mathlib:SchwartzMap.tsum_eq_tsum_fourier, mathlib:fourier_gaussian_innerProductSpace, mathlib:mellin, mathlib:Complex.Gamma_eq_integral.

Source: Kings–Sprang, **arXiv:1912.03657v4**, Proposition 3.13 and its theta transformation proof, pp.35–36, corrected for E1 and E9.

Atlas planet: Kronecker functional equation.

### KV.3/normalized-current — Residue-normalized Eisenstein–Kronecker current

Let C=(2πi)^d/vol(A), vol=C·∧_i(dz_i∧dbarz_i), χ_ℓ(z)=exp(2πi⟨ℓ,z⟩), and v_ℓ=Σ_i(barℓ_i/r_i)∂/∂barz_i for ℓ in the standard alternating dual lattice. For b,j≥0 set Φ_s^(b,j)=(-1)^(j+b)Γ(s)/j! · Σ_t f(t) Σ_(ℓ≠0) v_ℓ^[b] χ_ℓ(z−t) (π‖ℓ/√r‖²)^(−s) ι_(v_ℓ)(dι_(v_ℓ))^j vol. Define Φ^(n)=Σ_(b≤n,0≤j<d) Φ_(b+j+1)^(b,j), by meromorphic regularization in the current topology. Terms with j≥d vanish. The factor (-1)^b corrects the inverse-power binomial expansion in the d+ν convention (E3). With u_i=dr_i/r_i and E=−Σr_i∂_(r_i), contraction has coefficient (-1)^(j+1)j! C in the epsilon expansion of Lemma 3.16; at j=d−1 it is (-1)^(d(d+1)/2)d! C·(barℓ/r)^1·(∧_(i<d)u_i)∧(∧_i dz_i), correcting E2. Away from D these currents are smooth and have the corresponding corrected K-series expressions.

Hypotheses:

- Split torsion residue data after a permitted scalar extension; sum f(t)=0; finite symmetric level n.
- The normalization of currents is the one in KV.3/current-resolution.

Construction / proof:

1. Use polynomial-growth Fourier coefficients to define distributions, then apply the Mellin continuation to regularize and identify the smooth expression away from the support.
2. Compute ι_v dz_i∧dbarz_i=−(barℓ_i/r_i)dz_i and d(barℓ_i/r_i)=−(barℓ_i/r_i)u_i; the exterior algebra expansion gives the stated coefficient.
3. Expand (A+v)^(-j−1) with coefficient (-1)^b binomial(j+b,b), retaining divided-power conversion.

API:

- **current_finite_projection** (compatibility): Truncating symmetric degree from n+1 to n carries Φ^(n+1) to Φ^(n).
- **current_contraction_formula** (characterisation): The epsilon and top contraction coefficients are the corrected ones stated above; all j≥d terms vanish.
- **current_regular_locus** (relation): On U the current is the smooth regularized Kronecker expression with factor (-1)^(b+1) relative to the displayed expression of Proposition 3.17.

Unit tests:

- **one_dimensional_contraction** (computation): For d=1, ι_v(dz∧dbarz)=−v·dz.
- **two_dimensional_top** (computation): For d=2 and u₂=−u₁ the top contraction is −2C v₁v₂ u₁∧dz₁∧dz₂.
- **binomial_first_degree** (computation): (A+v)⁻¹=A⁻¹−vA⁻² modulo v²; using a positive linear term fails the flat-connection differential equation.

Uses:

- AutomorphicPadicLFunctionsPartII:KV.3/current-equation: Prove the residue differential equation.
- AutomorphicPadicLFunctionsPartII:KV.4/explicit-ek: Extract the top unit-degree component and its sign.

Checks:

- In d=1,b=0 the contraction is −C·barℓ/r·dz; changing it to +C reverses the residue.
- The b=1 coefficient has the opposite sign to b=0, as required for cancellation in d+ν.
- The j=d−1 top coefficient at d=2 is −2C, and at d=3 is +6C.

Direct dependencies: AutomorphicPadicLFunctionsPartII:KV.3/current-resolution, AutomorphicPadicLFunctionsPartII:KV.3/mellin-continuation, AbelianSchemesAndArithmeticModuliPartII:P3/smooth-dolbeault, AbelianSchemesAndArithmeticModuliPartII:P0/shuffle-divided-powers.

Source: Kings–Sprang, **arXiv:1912.03657v4**, Definitions 3.15 and 3.18, pp.37–39; Lemma 3.16, p.37; Proposition 3.17, p.38; binomial expansion in proof of Theorem 3.20, p.41, corrected for E2–E3.

Atlas planet: Eisenstein–Kronecker current.

### KV.3/current-equation — The current realizes the coherent class

The corrected compatible current Φ satisfies ∇″Φ=δ_f·vol and is ∇″-closed on U. Under the trace-normalized current/coherent comparison it represents EK_Γ(f). Its flat universal-extension image represents the equivariant de Rham polylogarithm. The zero Fourier term disappears because Tr(f)=0; no unregularized pointwise convergence at a torsion pole is asserted.

Hypotheses:

- Corrected current, residue convention, torsion-free Borel model and finite-level comparison.

Construction / proof:

1. At large Re(s) differentiate termwise in the current topology and telescope in symmetric degree.
2. Continue the identity and use trace zero to remove the constant mode.
3. Verify the supported residue is precisely f in the algebraic normalization; uniqueness in localization then identifies the class.

Checks:

- Check b=0 and b=1 directly in dimension one to test the d+ν cancellation.
- Residue equality includes the orientation sign, not only an unspecified nonzero scalar.

Direct dependencies: AutomorphicPadicLFunctionsPartII:KV.3/normalized-current, AutomorphicPadicLFunctionsPartII:KV.1/ek-class, AutomorphicPadicLFunctionsPartII:KV.2/polylog.

Source: Kings–Sprang, **arXiv:1912.03657v4**, Definition 3.19, Theorem 3.20 and Corollary 3.22, pp.39–41, with E2–E3 corrections.

Atlas planet: Current realization.

## KV.4 — Orbit sums and explicit critical classes

Define convergent unit-orbit Eisenstein series and their continuation by integration over the logarithmic unit torus. Prove the gamma-factor fibre integral with a fixed orientation and measure. Identify the analytically represented critical class, including the corrected weight-dependent sign and dual-period conversion. The full algebraic-residue/current/orientation comparison is an explicit theorem obligation, so the interpolation proof cannot silently drop its sign. Targets: Eisenstein series over unit orbits; Fibre integration of Kronecker series; Explicit critical class in analytic and algebraic bases.

Layer dependencies: AbelianSchemesAndArithmeticModuliPartII:P0, AutomorphicPadicLFunctionsPartII:KV.0, AutomorphicPadicLFunctionsPartII:KV.2, AutomorphicPadicLFunctionsPartII:KV.3, ComplexMultiplicationAndExplicitReciprocity:CM.1.

### KV.4/orbit-eisenstein — Eisenstein series over unit orbits

For an O_L-fractional lattice Λ⊂ℂ^Σ, a torsion class t∈(ℚ⊗Λ)/Λ, and Γ preserving Λ, define E^(β,α)(t,s;Λ,Γ)=Σ′_(λ∈Γ\(Λ+Γt)) barλ^β/(λ^α N(λ)^s), where N(λ)=∏_σ|λ_σ|² and zero is omitted. Require β−α∈CI_L(Γ), so the summand is well-defined on orbits. Initially take Re(s)>d+(|β|−|α|)/2 and then its meromorphic continuation supplied by fibre integration. The value depends on the Γ-orbit of t. For subgroup changes the orbit multiplicities, including any finite torsion, are explicit.

Hypotheses:

- α strictly positive on Σ; β≥0 on barΣ; lattice and unit actions compatible.

Construction / proof:

1. Check the Γ-invariance of the summand using the critical weight and |Norm γ|=1.
2. Use the convergence estimate for a unit fundamental domain; obtain continuation from the next target rather than assuming a value at s=0.

API:

- **orbit_representative** (extensionality): Changing a representative t within its Γ-orbit modulo Λ leaves E unchanged.
- **orbit_subgroup_index** (functoriality): If Γ fixes t modulo Λ then E(t,s;Λ,Γ′)=[Γ:Γ′]E(t,s;Λ,Γ). In general let t_i represent Γ′-orbits in Γt; then Σ_i E(t_i,s;Λ,Γ′)=[Γ:Γ′]E(t,s;Λ,Γ).
- **orbit_homothety** (compatibility): Scaling Λ and t by a nonzero L-element changes E by the specified monomial and norm factor.

Unit tests:

- **elliptic_units** (computation): For L=ℚ(i), Γ=μ₄ and α=4, β=0, one Γ-orbit contributes once, whereas the full lattice sum contributes four times.
- **inadmissible_weight** (non-example): For Γ=μ₄ the weight α=1, β=0 is not invariant and cannot define an orbit sum with that Γ.
- **zero_orbit** (degenerate): At t=0 the zero vector is excluded even when the continuation at s=0 exists.
- **moving_torsion_orbit** (computation): For L=ℚ(i), Γ=μ₄, Γ′=1 and t=1/3 mod ℤ[i], the four translates are distinct. With α=4, β=0 each single-coset Γ′ series equals the Γ series, not four times it; summing the four Γ′ torsion orbits supplies the factor four.

Uses:

- AutomorphicPadicLFunctionsPartII:KV.4/fibre-integral: Identify the Mellin integral.
- AutomorphicPadicLFunctionsPartII:KV.5/partial-l-identity: Express partial Hecke L-functions.

Checks:

- The λ=0 orbit is always omitted.
- An unrestricted lattice sum counts unit orbits infinitely often and is not this definition.

Direct dependencies: AutomorphicPadicLFunctionsPartII:KV.0/critical-types, AutomorphicPadicLFunctionsPartII:KV.3/kronecker-series.

Source: Kings–Sprang, **arXiv:1912.03657v4**, Definition 3.24 and Lemma 3.25, p.43; Lemma 3.25 corrected for E13.

Atlas planet: Unit-orbit Eisenstein series.

### KV.4/fibre-integral — Fibre integration of Kronecker series

Let Γ be torsion-free and let T_Γ(t′) be the finite orbit of the torsion class t′ in (ℚ⊗Λ)/Λ. For critical β−α with α≥1, Γ(α+s)E^(β,α)(t′,s;Λ,Γ) equals d·Σ_(t∈T_Γ(t′))∫_(BΓ) Γ(|α|+ds)·K^(β+α)(H_r,t,0,|α|+ds,Λ)·∏_i(πr_i)^(α_i+s)/π^(|α|+ds) ·∧_(i<d)dr_i/r_i. Here Γ(α+s)=∏_iΓ(α_i+s). The leading d is the Jacobian of (r,u)↦(ur_i) on the product-one r-torus. Establish the equality in the convergence half-plane and its meromorphic continuation to the regular critical evaluation. The sum is over every torsion point in the orbit, not over one orbit representative.

Hypotheses:

- Orbit-series hypotheses; convergence half-plane for initial unfolding; torsion-free Γ.

Construction / proof:

1. Unfold BΓ and the unit orbit simultaneously; use absolute convergence for Tonelli/Fubini initially.
2. Substitute positive coordinates to evaluate the product gamma integral.
3. Continue the identity meromorphically and evaluate at the regular critical point.

Checks:

- The product gamma factor at s=0, α=a+1, equals a!.
- For d=1 there is no r-integral and the identity reduces to the gamma factor times the lattice orbit sum.
- The Jacobian factor is d: at d=2, dlog(ur₁)∧dlog(ur₂) has absolute coefficient 2 in dlog u∧dlog r₁.

Direct dependencies: AutomorphicPadicLFunctionsPartII:KV.4/orbit-eisenstein, AutomorphicPadicLFunctionsPartII:KV.3/mellin-continuation, AutomorphicPadicLFunctionsPartII:KV.3/borel-complex, mathlib:Complex.Gamma_eq_integral, mathlib:mellin.

Source: Kings–Sprang, **arXiv:1912.03657v4**, Lemma 3.26, p.44.

Atlas planet: Unit fibre integral.

### KV.4/explicit-ek — Explicit critical class in analytic and algebraic bases

For torsion-free Γ the corrected conventions give EK^(β,a)_Γ(f,x)=ε(d,β)·a!·Σ_(t∈Γ\D) f(−t)E^(β,a+1)(t+x,0;Λ,Γ) dz^[a+1]⊗ubar^[β], where ε(d,β)=(-1)^(d(d−1)/2+|β|+1). The top-degree BΓ representative is the top contraction of the corrected current, projected to (a,β), differentiated by a, and evaluated at x; thus it has this same sign relative to Proposition 3.23. In the algebraic bases replace ubar^[β] by q^(−β)ω_A∨^[β], q=⟨barω_A,ω_A∨⟩_dR. The period conversion is Ω∨=2πi q/barΩ, so both the conjugation in q and this factor survive the comparison. For torsion Γ use only the localized normalization of KV.2. The formula is a target contingent on the full residue/orientation sign comparison recorded as gap G1; local contraction checks alone do not establish the final p-adic normalization.

Hypotheses:

- Standard datum, x outside D; β−a−1 critical; torsion-free Γ for the integral cap.
- The analytic trace convention of KV.3/current-resolution is used.

Construction / proof:

1. Extract the top (d−1)-form in r from Φ; the E2 contraction and E3 symmetric-degree correction multiply the printed formula by (-1)^(|β|+1).
2. Apply the fibre integral and compare the divided-power versus ordinary monomial bases.
3. Use the CM period pairing to pass to algebraic bases.
4. Complete G1 by verifying the local coherent trace comparison and the inverse-coordinate pushforward with one convention throughout.

Checks:

- At d=1, β=0 the proposed corrected coefficient is −a!, and at β=1 it is +a!.
- At d=2, β=0 the coefficient is +a!; omitting the original dimension sign reverses it.
- The pairing uses barω_A; writing ω_A without conjugation changes q.

Direct dependencies: AutomorphicPadicLFunctionsPartII:KV.3/current-equation, AutomorphicPadicLFunctionsPartII:KV.2/critical-evaluation, AutomorphicPadicLFunctionsPartII:KV.4/fibre-integral, ComplexMultiplicationAndExplicitReciprocity:CM.1/cm-period-pairings, AbelianSchemesAndArithmeticModuliPartII:P0/divided-power-comparison.

Source: Kings–Sprang, **arXiv:1912.03657v4**, Proposition 3.23, p.42; Theorem 3.27 and Corollary 3.28, pp.44–45; E2–E3 and the sign obligation G1.

Atlas planet: Explicit Eisenstein class.

## KV.5 — Periods and integral critical Hecke values

Attach periods and ideal structures to the Serre tensor datum and define the exact factorial and two-period normalizer. Identify ray-partial Hecke values with orbit Eisenstein sums; prove residue-value integrality, torsion distribution and full critical-value integrality with its auxiliary-ideal factor. Deduce algebraicity, the generalized Shimura formula and the weak Deligne period relation. The latter permits a zero L-value. Full-unit integral normalization is a separate divisibility obligation at nonunit torsion indices. Targets: Ideal structures and compatible complex periods; Critical-value normalization; Partial Hecke L-functions as unit-orbit series; Integrality of normalized Eisenstein sums; Torsion distribution and the smoothing identity; Integral differences of partial critical values; Regularized integrality and algebraicity; Katz–Shimura algebraicity for totally imaginary extensions; Deligne period comparison modulo algebraic units.

Layer dependencies: AbelianSchemesAndArithmeticModuliPartII:P2, AutomorphicLFunctionsAndLocalFactors:AL.1, AutomorphicPadicLFunctions:L0, AutomorphicPadicLFunctionsPartII:KV.0, AutomorphicPadicLFunctionsPartII:KV.1, AutomorphicPadicLFunctionsPartII:KV.2, AutomorphicPadicLFunctionsPartII:KV.4, ComplexMultiplicationAndExplicitReciprocity:CM.1, PeriodsAndSpecialValues:PS.0, PeriodsAndSpecialValues:PS.1.

### KV.5/ideal-periods — Ideal structures and compatible complex periods

An a-structure is an O_L-linear isomorphism ξ_a:a≃H₁(A(ℂ),ℤ), extended L-linearly on rational homology; it is not a generator of the possibly nonprincipal ideal a. The trace pairing identifies the dual lattice with a⁻¹d_L⁻¹, producing ξ_a∨. For an O_L-structure set Ω=⟨ω_A,ξ_L(1)⟩ and Ω∨=⟨ω_A∨,ξ_L∨(1)⟩. The algebraic de Rham pairing q=⟨barω_A,ω_A∨⟩ satisfies Ω∨=2πi q/barΩ. On A(a)=a⊗_(O_L)A the induced periods remain Ω and the lattice becomes aΩ. For a=f b⁻¹ transport bases by [f]*([b]*)⁻¹ when these maps are étale. The point Ω mod fΩ on A(f), after making it R-rational, transports under [b] to Ω mod f b⁻¹Ω. Serre construction from K repeats the K-periods on the embeddings above each embedding of K.

Hypotheses:

- Standard datum; imported integral Betti/de Rham pairing and CM Serre tensors.
- The dual ideal includes the inverse different; isogeny base changes retain all chosen bases and rationality of x_Ω.

Construction / proof:

1. Use the imported CM period pairing and its trace-dual description.
2. Tensor the integral Betti lattice and Lie comparison with a, rather than choosing a principal generator.
3. Compute the bilinear pairing between differential bases to obtain the 2πi factor and conjugation.

API:

- **ideal_period_lattice** (characterisation): A(a)(ℂ)≃ℂ^Σ/(aΩ) with the transported differential bases.
- **dual_period_pairing** (relation): Ω∨=2πi q/barΩ componentwise, for the trace-dual Betti structure.
- **period_isogeny_transport** (functoriality): Transport along [f] and [b] agrees with the Serre tensor identification when their cotangent maps are isomorphisms.

Unit tests:

- **nonprincipal_ideal** (compatibility): An a-structure for a nonprincipal ideal still exists in the formulation; replacing it by a single integral generator is disallowed.
- **period_rescale** (compatibility): Replacing ω_A by uω_A multiplies Ω by u and changes q by baru, with the dual period relation still valid.
- **different_factor** (compatibility): For an imaginary quadratic lattice O_KΩ, its trace-dual lattice is d_K⁻¹ rather than O_K unless the different is trivial.

Uses:

- AutomorphicPadicLFunctionsPartII:KV.5/eisenstein-integrality: Compare the refined algebraic coordinate to the common complex periods.
- AutomorphicPadicLFunctionsPartII:KV.6/padic-periods: Relate the algebraic bases to canonical p-adic bases.

Checks:

- A nonprincipal ideal is permitted and does not require ξ_a(1) to be integral; use its rational extension for that notation.
- The same Ω is used for all ray-class representatives.

Direct dependencies: AutomorphicPadicLFunctionsPartII:KV.0/standard-datum, ComplexMultiplicationAndExplicitReciprocity:CM.1/cm-serre-tensor, ComplexMultiplicationAndExplicitReciprocity:CM.1/cm-period-pairings, AbelianSchemesAndArithmeticModuliPartII:P2/isogeny-functoriality.

Source: Kings–Sprang, **arXiv:1912.03657v4**, Definitions 4.3 and 4.5, Proposition 4.6, pp.47–48; Proposition 4.7, pp.48–49; Definition 4.8, p.50; §4.5, pp.53–54.

Atlas planet: Compatible CM periods.

### KV.5/value-normalizer — Critical-value normalization

For α:Σ→ℕ with α≥1 and β:barΣ→ℕ set 𝒩_(α,β)(v)=(∏_σ(α_σ−1)!)·(2πi)^(Σβ)·v/(Ω^α(Ω∨)^β), with all period coordinates nonzero. Here Ω^α and (Ω∨)^β are products over their respective embedding sets and no factorial of a total degree is substituted for the product. This normalization is ℂ-linear in v. It is defined for any complex value; algebraicity and integrality of particular L-values are theorem targets, not fields of this definition.

Hypotheses:

- Nonzero complex periods with specified bases; positive α; β≥0.

Construction / proof:

1. Use finite products and ordinary complex powers on the existing carriers.
2. Derive the scaling rules directly, keeping Σ and barΣ separate.

API:

- **normalize_linear** (structure): 𝒩_(α,β)(u+v)=𝒩(u)+𝒩(v) and 𝒩(cv)=c𝒩(v).
- **normalize_period_rescale** (functoriality): Replacing Ω by uΩ and Ω∨ by vΩ∨ multiplies the result by u^(−α)v^(−β).
- **normalize_minimal_weight** (simp): For α=1, β=0 the normalizer is division by ∏Ω_σ.

Unit tests:

- **factorial_coordinate** (computation): In d=1, α=3 and β=0 the normalizer is 2v/Ω³.
- **dual_period_power** (computation): In d=1, α=2 and β=1 it is (2πi)v/(Ω²Ω∨).
- **zero_value** (degenerate): 𝒩_(α,β)(0)=0 even when all periods are nonzero; this prevents an erroneous target in algebraic units.

Uses:

- AutomorphicPadicLFunctionsPartII:KV.5/critical-integrality: State the arithmetic integrality target.
- AutomorphicPadicLFunctionsPartII:KV.8/interpolation: Use the same complex normalization in the p-adic interpolation formula.

Checks:

- A zero special value stays zero; the normalization has no nonvanishing axiom.
- Changing α from 2 to 3 in one coordinate introduces the required 2! factor.

Direct dependencies: AutomorphicPadicLFunctionsPartII:KV.5/ideal-periods, AutomorphicPadicLFunctionsPartII:KV.0/critical-types.

Source: Kings–Sprang, **arXiv:1912.03657v4**, Theorem 4.9, p.50; Theorem 4.10, p.51; Theorem 5.27, p.74.

### KV.5/partial-l-identity — Partial Hecke L-functions as unit-orbit series

Use the ideal-theoretic convention χ((λ))=λ^(β−α) for λ≡1 mod f. For a ray class [b] prime to f, L_f(χ,s,[b])=χ(b)Nb^(−s) E^(β,α)(1,s;f b⁻¹,O_f×). The L-function is the AL.1 Hecke L-function with the following explicit normalization: if μ(σ)+μ(barσ)=w, set χᵘ(a)=χ(a)Na^(−w/2), so L_f(χ,s)=L_f(χᵘ,s−w/2). At finite uniformizers the idelic unitary avatar takes value χᵘ(v); its archimedean component is fixed by triviality on L×. Apply AL.1 in that convention, transporting its gamma factors through the same shift. At s=0 the identity supplies its critical value, and finite sums over the ray classes give L_f(χ,0). For f=O_L omit the zero vector in the lattice sum.

Hypotheses:

- χ algebraic critical of conductor f; b integral prime to f; ideal/Artin convention fixed.

Construction / proof:

1. Bijection the ideals in a fixed ray class with generators in 1+f b⁻¹ modulo O_f×.
2. Check χ and norm factors on a principal ideal, then continue the equality from its absolute convergence domain.

Checks:

- No inverse of χ(b) is inserted into the displayed identity.
- The unitary norm shift is s−w/2; for χ(a)=Na^m it reduces to ζ_L(s−m), since w=2m.

Direct dependencies: AutomorphicPadicLFunctionsPartII:KV.4/orbit-eisenstein, AutomorphicPadicLFunctions:L0/hecke-character-avatar, AutomorphicLFunctionsAndLocalFactors:AL.1/completed-hecke-l-function, AutomorphicLFunctionsAndLocalFactors:AL.1/hecke-l-functional-equation.

Source: Kings–Sprang, **arXiv:1912.03657v4**, Lemma 4.2 and equations (4.1.2)–(4.1.3), p.47.

Atlas planet: Partial Hecke values.

### KV.5/eisenstein-integrality — Integrality of normalized Eisenstein sums

Let f,b,c be pairwise coprime integral ideals, a=f b⁻¹, and use the O_L-structured based abelian scheme and the R-rational x_Ω from ideal-periods. For a trace-zero O_f×-invariant torsion function h, prove 𝒩_(α,β)(Σ_(t∈O_f×\(c⁻¹a/a)) h(−t)E^(β,α)(t+1,0;a,O_f×))∈R[1/(f N(bc))]. Begin with the torsion-free-group formula, where the refined evaluation is integral, then justify the passage to the normalized full unit-orbit sum. When a torsion index is a unit its division is valid; when it is not, prove the specific divisibility statement for these residue classes. That latter passage is gap G3, not a consequence of the false unrestricted transfer claim.

Hypotheses:

- α≥1, β≥0 critical; h∈R[1/Nc][D]^(0,O_f×); x avoids D.
- The common period data and all cotangent transports are fixed.

Construction / proof:

1. Apply integral-comparison to A(a)→A(b⁻¹) with the bases [f]*([b]*)⁻¹ω_A and [b]_#ω_A∨.
2. Use explicit-ek and Ω∨=2πi q/barΩ; the remaining sign is a unit and does not affect integrality.
3. Track the stated ideal and norm localizations and complete the full-unit normalization/divisibility argument G3.

Checks:

- The theorem does not assume Nf is globally invertible in the initial datum.
- A proof that only gives |tors(O_f×)| times the claimed value integral is insufficient when that integer is a nonunit.

Direct dependencies: AutomorphicPadicLFunctionsPartII:KV.2/integral-comparison, AutomorphicPadicLFunctionsPartII:KV.4/explicit-ek, AutomorphicPadicLFunctionsPartII:KV.5/ideal-periods, AutomorphicPadicLFunctionsPartII:KV.5/value-normalizer, AutomorphicPadicLFunctionsPartII:KV.2/finite-index.

Source: Kings–Sprang, **arXiv:1912.03657v4**, Theorem 4.9 and equation (4.3.1), pp.50–51, with E11/G3 recorded.

### KV.5/torsion-distribution — Torsion distribution and the smoothing identity

For a=f b⁻¹ and c prime to fb, summing E^(β,α)(t+1,0;a,O_f×) over unit orbits t∈c⁻¹a/a gives E^(β,α)(1,0;c⁻¹a,O_f×). Thus the trace-zero function f_c=Nc·1_e−1 gives Nc E(1,0;a)−E(1,0;c⁻¹a). This identity uses a disjoint decomposition of the actual unit-orbit sets, not a sum over every point followed by division by the unit-group size.

Hypotheses:

- Critical indices; pairwise coprime integral f,b,c; evaluation class 1 modulo a.

Construction / proof:

1. Decompose c⁻¹a+1 into the Γ-translates of a+t+1 and pass to orbit sets.
2. Prove equality in the convergence region and continue to zero.

Checks:

- The first coefficient is Nc, the degree of the ideal isogeny.
- The lattice on the second term is c⁻¹a, not ca.

Direct dependencies: AutomorphicPadicLFunctionsPartII:KV.4/orbit-eisenstein, AutomorphicPadicLFunctionsPartII:KV.1/trace-zero-data.

Source: Kings–Sprang, **arXiv:1912.03657v4**, Equation (4.4.1) and Proposition 4.12, p.52.

Atlas planet: Torsion distribution relation.

### KV.5/partial-critical-integrality — Integral differences of partial critical values

For f≠O_L and the based period datum, 𝒩_(α,β)(χ(c)Nc L_f(χ,0,[b])−L_f(χ,0,[bc]))∈O_E R[1/(f N(bc))], where O_E R is the subring of ℂ generated by R and the integers of the character value field E. χ(b) may have denominators at Nb, so its integrality is proved in O_E[1/Nb] rather than asserted unconditionally.

Hypotheses:

- χ critical of conductor f with values in E; b,c prime to f and each other.

Construction / proof:

1. Insert f_c into eisenstein-integrality and apply the distribution relation.
2. Use partial-l-identity and prove the denominator statement for χ(b) by raising b to a principal ray-class power.

Checks:

- The smoothing difference pairs [b] with [bc] and has χ(c)Nc on the first term.
- All unresolved full-unit normalization assumptions are inherited from G3.

Direct dependencies: AutomorphicPadicLFunctionsPartII:KV.5/eisenstein-integrality, AutomorphicPadicLFunctionsPartII:KV.5/torsion-distribution, AutomorphicPadicLFunctionsPartII:KV.5/partial-l-identity.

Source: Kings–Sprang, **arXiv:1912.03657v4**, Corollary 4.13, p.52.

### KV.5/critical-integrality — Regularized integrality and algebraicity

For χ critical of conductor f and values in E, with the O_L-structure, differential bases and R-rational x_Ω, prove for f≠O_L and c prime to f: 𝒩_(α,β)((χ(c)Nc−1)L_f(χ,0))∈O_E R[1/(f Nc)]. For f=O_L and pairwise coprime c,c′, prove 𝒩_(α,β)((1−χ(c′))(χ(c)Nc−1)L_(O_L)(χ,0))∈O_E R[1/N(cc′)]. Choose k containing E and the field of definition, make the necessary torsion rational and bases free after the allowed extension/localization, and obtain a model R=O_k[1/(d_L f Nc)] in the sense of the indicated ideal localization. Vary the auxiliary ideals and show the smoothing factors can be chosen nonzero; consequently 𝒩_(α,β)(L_f(χ,0))∈k. Zero L-values are allowed.

Hypotheses:

- Standard global period data; f integral; c,c′ nonzero integral ideals with the specified coprimality.
- Good reduction and bases are obtained by an explicitly finite localization/extension, not assumed over every O_k.

Construction / proof:

1. Sum partial-critical-integrality over ray classes and choose representatives away from each prime at which integrality is tested.
2. For f=O_L introduce c′ and the support excluding the identity, then derive the second smoothing factor.
3. Control changes of model and exhibit nonvanishing smoothing factors to deduce algebraicity.

Checks:

- State both conductor cases; omitting (1−χ(c′)) in conductor one is incorrect.
- The claimed algebraicity is in a field, including zero, rather than automatically in its multiplicative group.

Direct dependencies: AutomorphicPadicLFunctionsPartII:KV.5/partial-critical-integrality, AutomorphicPadicLFunctionsPartII:KV.5/ideal-periods, AutomorphicPadicLFunctions:L0/ray-class-tower.

Source: Kings–Sprang, **arXiv:1912.03657v4**, Theorem 4.10 and its proof in §4.4, pp.51–53.

Atlas planet: Critical-value integrality.

### KV.5/shimura-formula — Katz–Shimura algebraicity for totally imaginary extensions

Let μ=β−α=N*_(L/K)(β₀−α₀), with K the maximal CM subfield and Ω₀ the compatible CM periods from a Serre construction. Then [ (2πi)^|β₀| / Ω₀^(α₀+barβ₀) ]^[L:K] ·L_f(χ,0)∈Qbar. Here barβ₀ is the conjugate-index transfer to Σ_K, not an unlabelled complex conjugate of the scalar L-value. The power [L:K] reflects repetition of every K-period among the lifted embeddings.

Hypotheses:

- Critical χ and compatible K/L period structures; α₀≥1, β₀≥0.

Construction / proof:

1. Construct the L-datum by the imported Serre tensor construction.
2. Use a K-linear polarization only to identify dual and conjugate periods modulo nonzero algebraic factors.
3. Apply critical-integrality for algebraicity and count the repeated periods.

Checks:

- At L=K the exponent [L:K] is one and the formula matches the CM-field normalization.
- At L=ℚ(i,√(1+i)) the K-period exponent doubles without assuming L is CM.
- The complex algebraicity statement has no p-ordinarity hypothesis; obtain its periods from CM.1 and ideal-periods, rather than the more restrictive ordinary L3/cm-periods node.

Direct dependencies: AutomorphicPadicLFunctionsPartII:KV.5/critical-integrality, AutomorphicPadicLFunctionsPartII:KV.5/ideal-periods, ComplexMultiplicationAndExplicitReciprocity:CM.1/cm-serre-tensor.

Source: Kings–Sprang, **arXiv:1912.03657v4**, §4.5 and equation (4.5.1), p.53; Corollary 4.14, p.54.

Atlas planet: Katz–Shimura period formula.

### KV.5/weak-deligne — Deligne period comparison modulo algebraic units

For the Hecke motive M(χ) over L with coefficient field E, assume Res_(L/ℚ)M(χ) is critical in the realization-theoretic sense and fix τ:E→ℂ. Its nonzero period satisfies c⁺_τ(Res M(χ))∼[(2πi)^(−|β₀|)Ω₀^(α₀+barβ₀)]^[L:K], where ∼ means equality modulo Qbar×. Consequently L_f(χ,0)/c⁺_τ∈Qbar. The ratio is in Qbar× only if L_f(χ,0)≠0. No assertion of the sharper E-rationality is made here; this is the weaker period statement in Corollary 4.15 with E4 corrected.

Hypotheses:

- Hecke motive, restriction of scalars, realizations and determinant periods supplied by PS.0–PS.1.
- The criticality of the restricted motive is an explicit assumption.

Construction / proof:

1. Import the motivic norm-pullback and finite-order/Tate comparison needed to compute its determinant period.
2. Compare the resulting period with the Serre CM periods modulo Qbar×.
3. Apply shimura-formula; keep the nonvanishing of the period separate from the possible vanishing of the L-value.

Checks:

- If L_f(χ,0)=0 the conclusion is the algebraic scalar zero.
- This does not identify an E×-ambiguity from a Qbar×-ambiguity.

Direct dependencies: AutomorphicPadicLFunctionsPartII:KV.5/shimura-formula, PeriodsAndSpecialValues:PS.0, PeriodsAndSpecialValues:PS.1.

Source: Kings–Sprang, **arXiv:1912.03657v4**, Corollary 4.15 and Remarks 4.16–4.17, pp.54–55, corrected for E4.

Atlas planet: Weak Deligne period relation.

## KV.6 — Ordinary levels and p-adic theta coordinates

Define p-ordinarity for the lifted type without requiring L itself to be a CM field. Specify connected multiplicative levels, paired étale isogenies, canonical differentials and unit p-adic periods. Construct the CM Eisenstein theta class using the imported integral Poincaré trivialization, and identify invariant differential moments with its algebraic critical evaluations. The finite-free multivariable Amice transform is an input from the measure roadmap. Targets: Ordinary lifted types and CM level structures; Canonical differentials and p-adic periods; The p-adic theta function of a residue class; Canonical formal derivatives and embedding monomials.

Layer dependencies: AbelianSchemesAndArithmeticModuliPartII:P2, AbelianSchemesAndArithmeticModuliPartII:P4, AutomorphicPadicLFunctions:L3, AutomorphicPadicLFunctionsPartII:KV.0, AutomorphicPadicLFunctionsPartII:KV.1, AutomorphicPadicLFunctionsPartII:KV.2, AutomorphicPadicLFunctionsPartII:KV.5, FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1, PadicMeasuresIwasawaAlgebras:L2.

### KV.6/ordinary-level — Ordinary lifted types and CM level structures

Fix a prime p∤d_L, p noninvertible on the arithmetic model, embeddings of algebraic numbers into ℂ and ℂ_p, and a lifted type Σ. It is p-ordinary when the sets of p-adic places induced by Σ and barΣ are disjoint and together cover all places over p; this definition applies to L containing K, without requiring L itself CM. Write O_L⊗ℤ_p=O_L(Σ_p)⊕O_L(barΣ_p). A Γ₀₀(p∞)-structure consists of O_L-equivariant compatible identifications μ_(p∞)⊗O_L(Σ_p)≃A[p∞]^connected and μ_(p∞)⊗O_L(barΣ_p)≃A∨[p∞]^connected. A Γ_arith-structure includes the compatible full connected and étale trivializations. Set p_Σ=∏_(v∈Σ_p)v and A_(n)=A(barp_Σ^n); q_n=[barp_Σ^n]:A_(n)→A is étale, with kernel A_(n)[barp_Σ^n], while its dual is connected. Via Weil pairings these data are equivalent to the specified trivializations of the complementary étale kernels. A prime-to-p ideal Betti structure induces them using the chosen compatible roots exp(2πi/p^n). In particular formal A≃Gm_hat⊗O_L(Σ_p), formal A∨≃Gm_hat⊗O_L(barΣ_p), with character modules the corresponding dual Tate modules. The paired isogeny [p_Σ^n]:A→A_(n) composes with q_n to [p^n].

Hypotheses:

- Ordinary standard datum over R followed by its chosen map to O_(ℂ_p); f prime to p.
- Ordinary finite-flat and Weil pairing theory is imported, not developed here.

Construction / proof:

1. Specialize the generic connected/étale and Cartier-dual theory to the CM idempotent decomposition.
2. Prove equivalence of multiplicative and complementary étale level structures using the two Weil pairings.
3. Transport a prime-to-p Betti ideal structure into the compatible étale levels and identify the formal character modules.

API:

- **ordinary_lifted_iff** (characterisation): The p-ordinary lifted type is equivalent to separation of the two place sets, and agrees with the K-condition at unramified p.
- **level_weil_equivalence** (equivalence): Multiplicative connected levels and complementary étale-kernel levels determine each other through the rigidified Weil pairings.
- **formal_character_modules** (data): The levels identify the Cartier-dual Tate modules of formal A and formal A∨ with O_L(Σ_p) and O_L(barΣ_p).

Unit tests:

- **split_elliptic** (compatibility): For K=ℚ(i) and p=5 the two CM embeddings induce distinct p-places, so the ordinary construction applies.
- **inert_elliptic** (non-example): For K=ℚ(i) and p=3 both embeddings induce the same inert place, so the ordinary constructor rejects it.
- **non_cm_ordinary** (compatibility): For L=ℚ(i,√(1+i)) and p=5, the lifted type separates the primes by their restrictions to K and gives a valid ordinary dimension-two datum.

Uses:

- AutomorphicPadicLFunctionsPartII:KV.6/padic-periods: Choose canonical differential bases.
- AutomorphicPadicLFunctionsPartII:KV.7/translation: Identify the correct étale isogeny and its paired torsion groups.

Checks:

- The bar on barp_Σ in A_(n) is essential: q_n has étale kernel.
- For L=K the predicate specializes to the imported CM-field p-ordinary predicate.

Direct dependencies: AutomorphicPadicLFunctionsPartII:KV.0/standard-datum, AutomorphicPadicLFunctionsPartII:KV.5/ideal-periods, AutomorphicPadicLFunctions:L3/cm-type-p-ordinary, FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1, AbelianSchemesAndArithmeticModuliPartII:P4/ordinary-completed-base-change.

Source: Kings–Sprang, **arXiv:1912.03657v4**, Notation 5.1, Definitions 5.2–5.3 and Propositions 5.4–5.6, pp.56–58.

Atlas planet: Ordinary CM level structures.

### KV.6/padic-periods — Canonical differentials and p-adic periods

The ordinary level structures induce canonical bases ω_can(A), ω_can(A∨) on the cotangent weight lines of the two formal tori. Define unit-valued periods Ω_p and Ω_p∨ by ω_A=Ω_p·ω_can(A) and ω_A∨=Ω_p∨·ω_can(A∨). These are componentwise units because both sides are bases. Prime-to-p O_L-isogenies transport the canonical bases and periods by Lemma 5.8. All algebraic objects are first built over the noetherian model and then base changed to O_(ℂ_p); no noetherianity assertion about O_(ℂ_p) is made.

Hypotheses:

- Ordinary based datum, chosen Γ₀₀-levels and compatible embeddings; algebraic bases integral at p.

Construction / proof:

1. Pull back invariant dlog differentials from the formal multiplicative groups.
2. Compare the two bases to obtain invertible coordinate ratios; verify isogeny transport on character modules.

API:

- **padic_period_rescale** (functoriality): Scaling the algebraic basis by a unit u scales Ω_p by u and leaves the canonical basis fixed.
- **padic_period_isogeny** (compatibility): Transport through a prime-to-p isogeny agrees with the induced level structure and cotangent pullback.
- **padic_period_unit** (characterisation): The periods lie in the unit groups of the corresponding coefficient lines because they compare bases.

Unit tests:

- **identity_level** (degenerate): When the algebraic basis is the canonical one, each p-adic period equals 1.
- **unit_rescale** (compatibility): Multiplying ω_A by a unit u multiplies Ω_p by u, rather than by u⁻¹.
- **nonunit_rescale** (non-example): Multiplication by p does not produce an integral basis and cannot be used to infer a unit period pΩ_p.

Uses:

- AutomorphicPadicLFunctionsPartII:KV.7/eisenstein-measure: Convert canonical moments to algebraic EK coordinates.
- AutomorphicPadicLFunctionsPartII:KV.8/interpolation: Normalize final moments in the same bases as the complex formula.

Checks:

- p-adic periods are not identified with the complex periods; each compares the same algebraic bases with a different canonical basis.
- If an algebraic differential is multiplied by a nonunit, it ceases to be a basis and the unit-period assertion no longer applies.

Direct dependencies: AutomorphicPadicLFunctionsPartII:KV.6/ordinary-level, AutomorphicPadicLFunctionsPartII:KV.5/ideal-periods, AbelianSchemesAndArithmeticModuliPartII:P4/ordinary-infinitesimal-trivialization.

Source: Kings–Sprang, **arXiv:1912.03657v4**, Definition 5.7 and Lemma 5.8, p.59.

Atlas planet: p-adic CM periods.

### KV.6/theta-class — The p-adic theta function of a residue class

For a torsion section y∈U killed by an isogeny with étale dual, restrict EK_Γ(f) to the formal neighborhood of y, translate to the identity, and use the imported ordinary Poincaré trivialization on formal A×formal A∨. Cap the resulting degree-(d−1) group-cohomology class with the same torsion-free oriented fundamental cycle and identify det ω_A using ω_can(A). This defines θ_Γ(f,y)∈H⁰(formal A×formal A∨,O). It is integral over O_(ℂ_p). For arbitrary torsion y the same procedure gives a generic-fiber theta function; integrality then requires an extra argument. Restriction to a finite-index torsion-free subgroup scales theta by the subgroup index.

Hypotheses:

- Torsion-free Γ fixes y and f; ordinary level structures; f trace zero.
- Integral version requires the killing dual étale; torsion-normalized Γ requires its order invertible or the G3 divisibility input.

Construction / proof:

1. Apply the P4 translation and infinitesimal trivializations and their compatibility with the rigidification.
2. Use Lemma 5.15 to cap formal functions with the canonical determinant differential.
3. Check integral and generic constructions agree under the injective base change.

API:

- **theta_linear** (structure): θ_Γ(f,y) is linear in the trace-zero residue function f.
- **theta_subgroup_index** (functoriality): For torsion-free Γ′⊂Γ, θ_(Γ′)=[Γ:Γ′]θ_Γ with the same bases.
- **theta_integral_generic** (compatibility): The integral theta function maps to its generic-fiber counterpart whenever the killing dual is étale.
- **theta_augmentation** (compatibility): When β=a=0 is critical for Γ, evaluating the formal theta function at the identity gives Ω_p^1 e_(0,0), with the same algebraic-to-canonical determinant conversion as in eisenstein_moments. This follows by applying the augmentation before capping.

Unit tests:

- **zero_residue** (degenerate): θ_Γ(0,y)=0 as a formal function.
- **prime_to_p_torsion** (compatibility): A prime-to-p torsion y has an étale killing dual and gives an integral theta function.
- **etale_kernel_warning** (non-example): For y in ker q_n on A_(n), q_n∨ is connected, so this argument gives its theta value only over the generic fiber.
- **theta_index_two** (compatibility): For torsion-free Γ′⊂Γ of index 2, fixed f,y and unchanged canonical bases, θ_(Γ′)(f,y)=2θ_Γ(f,y), including when p=2; no division by the index is part of this restriction.
- **theta_elliptic_augmentation** (compatibility): For d=1, Γ=1 and β=a=0, θ(f,y)(0,0)=Ω_p e_(0,0)(f,y). Thus a value with e_(0,0)≠0 cannot be replaced by the zero formal function.

Uses:

- AutomorphicPadicLFunctionsPartII:KV.7/eisenstein-measure: Take the inverse Amice transform.
- AutomorphicPadicLFunctionsPartII:KV.7/translation: Compare translates using Weil-pairing weights.

Checks:

- Do not declare every summand in the translation formula integral.
- The cap convention is identical to KV.2/critical-evaluation, including the determinant factor responsible for α=a+1.

Direct dependencies: AutomorphicPadicLFunctionsPartII:KV.1/ek-class, AutomorphicPadicLFunctionsPartII:KV.2/critical-evaluation, AutomorphicPadicLFunctionsPartII:KV.6/padic-periods, AbelianSchemesAndArithmeticModuliPartII:P4/translation-trivialization, AbelianSchemesAndArithmeticModuliPartII:P4/ordinary-infinitesimal-trivialization.

Source: Kings–Sprang, **arXiv:1912.03657v4**, Lemma 5.15, p.63; Definition 5.16 and Lemma 5.17, p.64.

Atlas planet: p-adic theta function.

### KV.6/differential-moments — Canonical formal derivatives and embedding monomials

For a≥0 on Σ and β≥0 on barΣ let ∂_A^a∂_(A∨)^β g be the coefficient of the invariant differentiated formal function in the canonical divided-power differential bases, evaluated at the identity. Under the level identification O_L⊗ℤ_p=O_L(Σ_p)⊕O_L(barΣ_p), define t^a s^β(t,s)=∏_(σ∈Σ)σ(t)^a_σ∏_(barσ∈barΣ)barσ(s)^β_barσ through the chosen embeddings into O_(ℂ_p). The generic Amice moment formula identifies these canonical derivatives with monomial integrals. This target specializes that formula to the CM bases and the Hodge moment maps; it does not re-own multivariate Amice theory.

Hypotheses:

- Ordinary levels and canonical bases; nonnegative indices; formal functions over O_(ℂ_p).

Construction / proof:

1. Identify invariant differentiation on each formal multiplicative coordinate with (1+T)∂/∂T.
2. Apply the imported moment and divided-power conventions, then the character-module embedding map.

API:

- **formal_derivative_monomial** (characterisation): For g=(1+T)^m the k-th invariant derivative at zero is m^k.
- **embedding_monomial_product** (structure): Products of the monomials add their multi-indices, t^a s^β·t^c s^δ=t^(a+c)s^(β+δ).
- **canonical_moment_compatibility** (compatibility): The moment map in canonical TSym bases agrees with ∂_A^a∂_(A∨)^β, with the stated factorial convention.

Unit tests:

- **second_invariant_derivative** (computation): For g=(1+T)^2 the second invariant derivative at zero is 4; the second ordinary derivative would give 2.
- **zero_exponents** (degenerate): The (0,0) monomial is 1 everywhere, including at zero.
- **mixed_product** (computation): In two coordinates, the (1,1) derivative of (1+T₁)^2(1+T₂)^3 at zero equals 6.

Uses:

- AutomorphicPadicLFunctionsPartII:KV.7/eisenstein-measure: Compute Eisenstein moments.
- AutomorphicPadicLFunctionsPartII:KV.7/locally-constant-moments: Evaluate locally constant twists with the same monomials.

Checks:

- The invariant derivative is not the ordinary ∂/∂T for higher moments.
- The determinant contributes the extra Ω_p factor only when relating theta to EK, not inside the definition of t^a.

Direct dependencies: AutomorphicPadicLFunctionsPartII:KV.6/ordinary-level, AutomorphicPadicLFunctionsPartII:KV.6/padic-periods, AbelianSchemesAndArithmeticModuliPartII:P2/group-moment-map, PadicMeasuresIwasawaAlgebras:L2.

Source: Kings–Sprang, **arXiv:1912.03657v4**, Definitions 5.18–5.19 and equation (5.4.1), pp.64–65; Proposition 5.20, p.65.

## KV.7 — Eisenstein measures and partial Fourier moments

Construct the bounded Eisenstein measure, retaining the extra Σ-period factor caused by the determinant line. Prove translation through the étale ordinary isogeny, define the normalized one-direction Weil-pairing Fourier transform, and compute locally constant twists of all critical moments. The transform divides by p^(dn), its character sign is negative, and its individual coefficients need not be integral even when the original theta measure is integral. Targets: The CM Eisenstein measure and its moments; p-power translation with Weil-pairing weights; Normalized partial Fourier transform; Locally constant twists of Eisenstein moments.

Layer dependencies: AbelianSchemesAndArithmeticModuliPartII:P2, AbelianSchemesAndArithmeticModuliPartII:P4, AutomorphicPadicLFunctionsPartII:KV.6, PadicMeasuresIwasawaAlgebras:L2.

### KV.7/eisenstein-measure — The CM Eisenstein measure and its moments

Let μ_Eis,Γ(f,x) be the bounded O_(ℂ_p)-valued measure on the additive finite free ℤ_p-module O_L⊗ℤ_p corresponding to θ_Γ(f,x) under the basis-independent multivariate Amice isomorphism. Use Mathlib AbstractMeasure for the underlying continuous linear functional. For critical β−a−1 its moments satisfy (Ω_p^(a+1)(Ω_p∨)^β)⁻¹∫t^a s^β dμ_Eis=e_(β,a), the coordinate of EK in the algebraic divided-power bases. More generally the projected noncritical coefficient components vanish under the corresponding Γ-weight condition. Dependence on f is linear and subgroup normalization follows that of theta.

Hypotheses:

- Integral theta data; coefficient ring O_(ℂ_p); finite free rank 2d module.
- The multivariate, coefficient-complete, equivariant Amice contract in the L2 request is needed; a one-variable field statement alone is insufficient.

Construction / proof:

1. Apply the inverse Amice equivalence to θ, which has integral bounded coefficients.
2. Compare invariant derivatives, Poincaré moments and the canonical cap with EK.
3. Rescale ω_A and ω_A∨ by their p-adic periods; the exponent on Ω_p is a+1.

API:

- **eisenstein_moments** (characterisation): All critical monomial integrals satisfy the displayed Ω_p^(a+1)(Ω_p∨)^β formula.
- **eisenstein_linear** (structure): The construction is linear in f and takes zero residue data to the zero measure.
- **eisenstein_amice** (compatibility): The Amice transform of μ_Eis is exactly θ_Γ, independently of a ℤ_p-basis.

Unit tests:

- **dirac_model** (compatibility): For the generic Amice test g=(1+T)^m, the measure is δ_m and its k-th moment is m^k; the CM specialization uses that same convention.
- **constant_model** (compatibility): A constant formal function c corresponds to cδ₀, not normalized Haar measure.
- **period_shift** (compatibility): At derivative index a=0 the algebraic-to-canonical moment conversion still contributes one Ω_p in each Σ coordinate.

Uses:

- AutomorphicPadicLFunctionsPartII:KV.7/locally-constant-moments: Interpolate locally algebraic functions at finite level.
- AutomorphicPadicLFunctionsPartII:KV.8/smoothed-ray-measure: Restrict to units and descend to the ray-class tower.

Checks:

- At a=β=0 the total mass is Ω_p^1 times the (0,0) EK coordinate, not just that coordinate.
- Transport under an integral basis change of O_L⊗ℤ_p gives the same measure.

Direct dependencies: AutomorphicPadicLFunctionsPartII:KV.6/theta-class, AutomorphicPadicLFunctionsPartII:KV.6/differential-moments, PadicMeasuresIwasawaAlgebras:L2, mathlib:AbstractMeasure.

Source: Kings–Sprang, **arXiv:1912.03657v4**, Definition 5.21 and Theorem 5.22, pp.65–66; Proposition 5.20 imported from the general Amice owner.

Atlas planet: CM Eisenstein measure.

### KV.7/translation — p-power translation with Weil-pairing weights

Let q_n:A_(n)=A(barp_Σ^n)→A be as in ordinary-level; pull back D and f to D′ and f′. For Γ-invariant s∈A[p_Σ^n], t∈A∨[barp_Σ^n], let s′ be the unique p_Σ^n-torsion lift of s and x′ the unique f-torsion lift of x. Then (T_s×T_t)*θ_(Γ,A)(f,x)=Σ_(u∈ker q_n)⟨u,t⟩_(q_n)·q_(n),# θ_(Γ,A_(n))(f′,x′+s′+u). The equality is interpreted through the formal isogeny identifications in the generic fiber. Its left side is integral; individual right-hand theta functions need not be integral because q_n∨ is not étale.

Hypotheses:

- Ordinary theta data, p∤f, Γ fixes the torsion translations.

Construction / proof:

1. Compare the supported residue functions under the Poincaré isogeny and translation diagrams.
2. Identify the multiplier by the rigidified Weil pairing, with the same order of its arguments.
3. Use uniqueness of the localized EK class and the compatibility of formal cap and trivialization.

Checks:

- The Weil pairing occurs with the positive power here; the inverse is in the Fourier transform below.
- Integrality of the sum is deduced from the left side, never termwise.

Direct dependencies: AutomorphicPadicLFunctionsPartII:KV.6/theta-class, AutomorphicPadicLFunctionsPartII:KV.6/ordinary-level, AbelianSchemesAndArithmeticModuliPartII:P4/translation-trivialization, AbelianSchemesAndArithmeticModuliPartII:P2/isogeny-functoriality.

Source: Kings–Sprang, **arXiv:1912.03657v4**, Theorem 5.23 and equations (5.5.1)–(5.5.8), pp.66–70, especially integrality remark p.67.

Atlas planet: Theta translation formula.

### KV.7/partial-fourier — Normalized partial Fourier transform

At level p^n let x∈A_(n)∨[p_Σ^n], y∈A_(n)[p_Σ^n], and z∈A_(n)[barp_Σ^n]. With q_n=[barp_Σ^n]:A_(n)→A, the perfect pairing for [p_Σ^n]:A→A_(n) pairs q_n(y) with x. For a function ρ on the two étale coordinate modules define P_Aρ(y,z)=p^(−dn)Σ_x⟨q_n(y),x⟩_[p_Σ^n]⁻¹ρ(x,z). Fourier transformation acts only in the Σ-direction; the other variable is retained. The generic-fiber denominator p^(dn) is mandatory. Under the complex ideal uniformization this becomes the normalized finite trace-exponential sum exp(−2πi Tr_(L/ℚ)(xy)) in equation (5.5.11), with the ideal-coordinate denominators specified there.

Hypotheses:

- Chosen compatible Γ₀₀-levels and primitive p^n-th roots; functions at a finite level; generic coefficient field containing the roots.

Construction / proof:

1. Define the transform from the perfect pairing and the actual finite group of order p^(dn).
2. Prove inversion and orthogonality by finite character sums, then compare the trace-pairing coordinates.

API:

- **partial_fourier_orthogonality** (characterisation): A character x↦⟨y₀,x⟩ transforms to the indicator of y=y₀, with the other coordinate retained.
- **partial_fourier_inversion** (equivalence): Summing against the positive pairing in the transformed variable recovers ρ.
- **partial_fourier_refinement** (compatibility): For an inflation ρ_m=ρ_n∘π along the level surjection π:X_m→X_n, the normalized transform is zero at characters nontrivial on ker π. At a character descended from X_n it equals the level-n transform there. In a cyclic coordinate X_n=ℤ/p^n, at m≥n this means zero unless p^(m−n) divides the frequency, and then F_mρ_m(k)=F_nρ_n(k/p^(m−n)); the retained coordinate is simply inflated.

Unit tests:

- **constant_to_delta** (computation): The constant function 1 in the transformed variable maps to the delta function at zero.
- **delta_to_constant** (computation): The indicator of x=0 maps to the constant p^(−dn), not to 1.
- **character_sign** (computation): The positive character ⟨y₀,x⟩ transforms to δ_(y₀), whereas the negative character transforms to δ_(−y₀).
- **fourier_inflation_annihilator** (computation): For the reduction ℤ/4→ℤ/2, inflate the zero-point indicator to the indicator of {0,2}. With ζ₄=i the normalized transform is 1/2 at frequencies 0 and 2, and zero at frequencies 1 and 3. It is supported on the kernel annihilator, rather than a constant inflation in the frequency variable.

Uses:

- AutomorphicPadicLFunctionsPartII:KV.7/locally-constant-moments: Compute locally constant twists of the measure.
- AutomorphicPadicLFunctionsPartII:KV.8/local-factor: Define Katz’s local factor with this exact normalization.

Checks:

- The denominator is the order of one direction, not p^(2dn).
- Fourier coefficients can have p-denominators even when ρ is integral.

Direct dependencies: AutomorphicPadicLFunctionsPartII:KV.6/ordinary-level, AutomorphicPadicLFunctionsPartII:KV.7/translation.

Source: Kings–Sprang, **arXiv:1912.03657v4**, Definition 5.24, p.70; equations (5.5.9)–(5.5.11), pp.71–72.

Atlas planet: Partial Fourier transform.

### KV.7/locally-constant-moments — Locally constant twists of Eisenstein moments

For ρ:O_L/p^nO_L→Qbar and critical β−a−1, (Ω_p^(a+1)(Ω_p∨)^β)⁻¹∫t^a s^βρ(t,s)dμ_Eis(f,x)=Σ_(u∈A_(n)[p^n]) (P_Aρ)(u)·e_(β,a),A_(n)(f′,x′+u). The differential bases on A_(n) and its dual are uniquely transported by the two paired isogenies so that the p-adic periods on the left remain the common periods. Every right-hand term is initially interpreted generically.

Hypotheses:

- Finite-level ρ; translation theorem and compatible bases; Γ may be replaced by a subgroup fixing the level, with its index explicitly included.

Construction / proof:

1. Expand ρ in the finite character basis.
2. Apply theta translation and the Amice invariant-derivative identity to each character.
3. Use partial Fourier orthogonality and transport the bases to obtain the displayed formula.

Checks:

- For ρ=1 the identity recovers the original moment formula after the correct distribution sum.
- A level increase does not multiply the integral by the size of the inflated group.

Direct dependencies: AutomorphicPadicLFunctionsPartII:KV.7/eisenstein-measure, AutomorphicPadicLFunctionsPartII:KV.7/translation, AutomorphicPadicLFunctionsPartII:KV.7/partial-fourier, AutomorphicPadicLFunctionsPartII:KV.6/padic-periods.

Source: Kings–Sprang, **arXiv:1912.03657v4**, Corollary 5.25, pp.71–72.

Atlas planet: Locally constant moment formula.

## KV.8 — Ray-class interpolation and bounded desmoothing

Define Katz’s local factor with its conductor decomposition and the correct extension at trivial Σ-components. Specify auxiliary-ideal Dirac smoothing atoms and construct smoothed ray-class measures using the tame-congruence unit closure. Prove bounded removal of the smoothing factors, then the fully normalized interpolation formula for critical characters with both complete p-Euler products. Sign compatibility, integral unit-index descent and uniform measure-algebra divisibility are explicit proof obligations; the CM-field case compares with the existing Katz measure. Targets: Katz’s local factor for a lifted ordinary type; Auxiliary-ideal smoothing measures; Smoothed ray-class measures from the CM Eisenstein measure; Bounded removal of auxiliary ideals; Critical Hecke-value interpolation over totally imaginary fields.

Layer dependencies: AutomorphicLFunctionsAndLocalFactors:AL.1, AutomorphicPadicLFunctions:L0, AutomorphicPadicLFunctions:L3, AutomorphicPadicLFunctionsPartII:KV.2, AutomorphicPadicLFunctionsPartII:KV.5, AutomorphicPadicLFunctionsPartII:KV.6, AutomorphicPadicLFunctionsPartII:KV.7, ComplexMultiplicationAndExplicitReciprocity:CM.1, PadicMeasuresIwasawaAlgebras:L1, PadicMeasuresIwasawaAlgebras:L3.

### KV.8/local-factor — Katz’s local factor for a lifted ordinary type

Let χ have infinity type β−α and conductor dividing p∞f. Define χ_fin on (O_L⊗ℤ_p)× by χ((λ))=χ_fin(λ)·λ^(β−α) for λ prime to pf and congruent to 1 modulo f, with μ evaluated at the embedding σ in the exponent (correction E5). Put Ftilde(x,y)=χ_fin(x⁻¹,y). For each v|p extend its v-component to O_(L,v) by the constant function 1 when v∈Σ_p and that unit-character component is trivial, and by zero off the units otherwise. Let F be the product. Choose ∏_(v∈Σ_p)v^(a_v)=(c)b with c≡1 mod f and b prime to p. Then Local(χ,Σ)=c^(α−β)·(PF)(c⁻¹)/χ(b), where c^(α−β) means (N_(L/K)c)^α₀/(overline(N_(L/K)c))^β₀ in the chosen embedding indices. Prove this scalar is nonzero, independent of the conductor decomposition, and compatible with the L0 Gauss-sum convention. Distinguish F from the zero extension of Ftilde; their difference at an unramified Σ-place produces an Euler factor.

Hypotheses:

- Ordinary lifted type; embeddings and additive trace character fixed; PF is exactly KV.7/partial-fourier.
- χ_fin uses the ideal-character convention of partial-l-identity, not its inverse.

Construction / proof:

1. Choose c by approximation in the required ray congruence class.
2. Factor the finite Fourier transform locally; use primitive-character Gauss-sum nonvanishing and the constant-function orthogonality at trivial Σ-components.
3. Change c by a principal ray element and check the monomial, finite-character and ideal factors cancel.

API:

- **local_factor_independence** (extensionality): Two permitted factorizations (c)b of the Σ-conductor give the same scalar.
- **local_factor_gauss** (compatibility): At a ramified Σ-place the factor is the normalized trace-character Gauss sum with the inverse finite character and the specified power of the uniformizer.
- **local_factor_unramified** (simp): For trivial p-local finite character, the constant extension in the Σ-direction gives Local=1 with c=b=1.

Unit tests:

- **trivial_component** (degenerate): A trivial Σ-component is extended by 1 on the entire local integer ring, including its nonunits.
- **ramified_gauss** (computation): For a primitive nontrivial character of a finite local unit quotient, the normalized Fourier coefficient at its conductor frequency is nonzero and includes the factor 1/N(v)^a_v.
- **decomposition_change** (compatibility): Replacing c by cλ and b by b(λ)⁻¹ for λ≡1 mod f changes the individual factors but leaves Local unchanged.

Uses:

- AutomorphicPadicLFunctionsPartII:KV.8/smoothed-ray-measure: Identify the finite Fourier term in each ray-class contribution.
- AutomorphicPadicLFunctionsPartII:KV.8/interpolation: State the exact local normalization in the final formula.

Checks:

- For all p-local components unramified take c=b=1; the local factor is 1.
- Replacing the constant extension by zero extension at a trivial Σ-place changes the expression and is rejected.

Direct dependencies: AutomorphicPadicLFunctionsPartII:KV.7/partial-fourier, AutomorphicPadicLFunctionsPartII:KV.5/partial-l-identity, AutomorphicPadicLFunctions:L0/gauss-sum-and-depleted-l-function, AutomorphicLFunctionsAndLocalFactors:AL.1/local-gauss-sum.

Source: Kings–Sprang, **arXiv:1912.03657v4**, §5.6, equation (5.6.1) and Definition 5.26, pp.72–73.

Atlas planet: Katz local factor.

### KV.8/smoothing-atom — Auxiliary-ideal smoothing measures

On G_f=Gal(L(p∞f)/L), with arithmetic Artin convention fixed by L0, define δ_c=Nc·δ_1−δ_(Art(c)⁻¹). Its value at a continuous character χ is Nc−χ(c)⁻¹. In conductor one also define δ′_(c′)=δ_1−δ_(Art(c′)), with value 1−χ(c′). The products of these atoms with a measure mean convolution in the imported Iwasawa/measure algebra. In particular δ_c is different from the scalar factor χ(c)Nc−1 in the complex integrality theorem; they differ by the unit χ(c).

Hypotheses:

- c prime to pf; c′ prime to pc when used; norm embedded into the coefficient ring.

Construction / proof:

1. Use Mathlib Dirac measures, addition and scalar multiplication; import convolution rather than define a private group algebra.
2. Evaluate a Dirac measure at χ, then apply χ(c⁻¹)=χ(c)⁻¹.

API:

- **smoothing_character_value** (characterisation): Integration of χ against δ_c equals Nc−χ(c)⁻¹.
- **smoothing_convolution** (compatibility): Convolution with δ_c multiplies any character moment by Nc−χ(c)⁻¹.
- **smoothing_total_mass** (simp): δ_c has mass Nc−1 and δ′_(c′) has mass zero.

Unit tests:

- **norm_inverse_distinction** (computation): For a test character value χ(c)=2 and Nc=7, δ_c evaluates to 13/2, while χ(c)Nc−1 is 13.
- **trivial_character** (degenerate): At χ=1, δ_c has value Nc−1; for Nc≡1 mod p it is not a p-adic unit.
- **conductor_one_atom** (degenerate): δ′_(c′) vanishes at the trivial character, so dividing by it requires cancellation rather than evaluating an inverse there.

Uses:

- AutomorphicPadicLFunctionsPartII:KV.8/smoothed-ray-measure: Describe the interpolation of regularized measures.
- AutomorphicPadicLFunctionsPartII:KV.8/bounded-desmoothing: State the compatible division problem in the measure algebra.

Checks:

- The Artin inverse belongs in the support of δ_c.
- For the trivial character its value is Nc−1, so this atom is not automatically invertible in every coefficient algebra.

Direct dependencies: AutomorphicPadicLFunctions:L0/euler-factor-elements, mathlib:AbstractMeasure.dirac, PadicMeasuresIwasawaAlgebras:L1/convolution-product, PadicMeasuresIwasawaAlgebras:L1/convolution-evaluation.

Source: Kings–Sprang, **arXiv:1912.03657v4**, Proof of Theorem 5.27, Step 2, p.77; Step 4, p.79.

### KV.8/smoothed-ray-measure — Smoothed ray-class measures from the CM Eisenstein measure

For f≠O_L construct bounded measures μ_(f,c) by choosing ray-class representatives a_i, the Serre tensors A_i=(a_i⁻¹f)⊗A and their compatible periods, evaluating μ_Eis at x_i=Ω mod a_i⁻¹fΩ, and restricting to (O_L⊗ℤ_p)×. Set U_f=O_f× (global units congruent to 1 mod f), G⁰_f=(O_L⊗ℤ_p)×/closure(U_f), and use the exact sequence 1→G⁰_f→G_f→Cl_f→1. On each coset push the weighted measure by (t,s)↦q_f(t⁻¹,s), with weight ∏_(σ∈Σ)σ(t)⁻¹, then sum the finitely many cosets. This uses U_f, not all global units for nontrivial tame f (E12). Under the completed sign normalization G1 and unit-index normalization G3, its moments are δ_c(χ) times the right side of the final interpolation formula. For f=O_L use two coprime auxiliaries and the function pulled back from f_c on (A[c′]\{e})×A[c], yielding μ_(O_L,c,c′) with the extra factor δ′_(c′)(χ).

Hypotheses:

- Ordinary based datum, tame f prime to p, compatible ideal structures and roots of unity.
- Unit subgroup changes used to fix finite levels carry their exact index; normalized integral descent requires G3.

Construction / proof:

1. Use the native abstract-measure pushforward and the imported L2 continuous weighting/projection formula. Restrict to the clopen unit locus by extension of test functions by zero, then apply the indicated continuous inversion and determinant weight; compactness makes these operations bounded.
2. Show the correct tame-unit quotient and representatives identify it with the ray-class tower.
3. Insert the locally constant moment formula; compute ramified local factors from PF and unramified corrections from the difference between F and the zero extension.
4. Use the corrected explicit EK formula and complete G1 before identifying its moment sign with the unsigned target.

API:

- **smoothed_moments** (characterisation): Critical character moments are the target expression multiplied by Nc−χ(c)⁻¹, and by 1−χ(c′) in tame conductor one, after G1/G3.
- **smoothed_auxiliary_relation** (compatibility): For b,c prime to pf, δ_b*μ_(f,c)=δ_c*μ_(f,b); establish equality using density of finite-order twists of a fixed critical character.
- **smoothed_ray_descent** (functoriality): Changing coset representatives transports the same weighted measure; the exact sequence uses the tame-congruence unit closure.

Unit tests:

- **critical_shift** (compatibility): A test local algebraic monomial with Σ-exponent α becomes t^(α−1)s^β after inversion and the determinant weight.
- **tame_unit_kernel** (non-example): For a global unit ε not congruent to 1 mod f, its p-component is not killed merely by calling it a global unit; only the actual image of U_f is quotiented out.
- **conductor_one_support** (non-example): At f=O_L and x=e a single f_c is invalid on U; the c′ support excluding e makes the residue evaluation admissible.

Uses:

- AutomorphicPadicLFunctionsPartII:KV.8/bounded-desmoothing: Remove the auxiliary ideal factors with a boundedness proof.
- AutomorphicPadicLFunctionsPartII:KV.8/interpolation: Supply the ray-class construction and all local Euler terms.

Checks:

- On a character monomial the inversion and extra t⁻¹ give derivative exponent a=α−1; missing the weight shifts the critical value.
- At nontrivial f, replacing closure(U_f) by closure(O_L×) can change the kernel and the available character moments.
- The unramified barΣ-depletion is the full product over barΣ_p, not a single prime.

Direct dependencies: AutomorphicPadicLFunctionsPartII:KV.7/eisenstein-measure, AutomorphicPadicLFunctionsPartII:KV.7/locally-constant-moments, AutomorphicPadicLFunctionsPartII:KV.8/local-factor, AutomorphicPadicLFunctionsPartII:KV.8/smoothing-atom, AutomorphicPadicLFunctionsPartII:KV.5/critical-integrality, AutomorphicPadicLFunctionsPartII:KV.2/finite-index, AutomorphicPadicLFunctions:L0/ray-class-tower, AutomorphicPadicLFunctions:L0/hecke-character-avatar, ComplexMultiplicationAndExplicitReciprocity:CM.1/cm-serre-tensor, PadicMeasuresIwasawaAlgebras:L2/weight, PadicMeasuresIwasawaAlgebras:L2/weight-pushforward.

Source: Kings–Sprang, **arXiv:1912.03657v4**, Theorem 5.27, proof Steps 1 and 3, equations (5.7.1)–(5.7.4), pp.74–78, with E6, E7, E11–E12.

Atlas planet: Smoothed ray-class measure.

### KV.8/bounded-desmoothing — Bounded removal of auxiliary ideals

Establish a bounded O_(ℂ_p)-valued measure μ_f independent of c such that δ_c*μ_f=μ_(f,c) when f≠O_L, and δ_c*δ′_(c′)*μ_(O_L)=μ_(O_L,c,c′) when f=O_L. The required output is a continuous O_(ℂ_p)-linear functional on C(G_f,O_(ℂ_p)) with norm at most one. Prove it by an integral measure-algebra divisibility argument or by Kummer congruences: every finite linear combination of admissible character twists that takes values in p^m O_(ℂ_p) must have the corresponding combination of proposed moments in p^m O_(ℂ_p), uniformly in the finite quotient and m. Treat torsion components of G_f, shared zeros of the smoothing factors and conductor one explicitly. Merely knowing that each individual character value is integral, or that the family has greatest common divisor one in an unspecified ring, does not prove this statement. This source-to-boundedness step is gap G2.

Hypotheses:

- Compatible smoothed measures and their cross-relations; the generic pseudomeasure localization and boundedness criterion are imported from PM:L3.
- All density arguments are made for continuous linear functionals with an established bound.

Construction / proof:

1. Use finite-order twists of one fixed critical algebraic character: they span locally constant functions times an invertible continuous function, hence are dense.
2. Prove the uniform congruences/divisibility before extending the candidate functional by continuity.
3. Show the auxiliary relations identify all resulting bounded extensions, including across the conductor-one cancellation.

Checks:

- On a finite cyclic group C_p, p⁻¹Σ_gδ_g has integral character values 1 or 0 but takes the indicator of the identity to 1/p; the proposed proof must rule out this failure.
- Do not assume every δ_c is a unit or equate a height-one gcd statement with a unit-ideal statement.

Direct dependencies: AutomorphicPadicLFunctionsPartII:KV.8/smoothed-ray-measure, AutomorphicPadicLFunctionsPartII:KV.8/smoothing-atom, AutomorphicPadicLFunctionsPartII:KV.5/critical-integrality, PadicMeasuresIwasawaAlgebras:L3, mathlib:AbstractMeasure.

Source: Kings–Sprang, **arXiv:1912.03657v4**, Theorem 5.27, proof Step 2, p.77, and Step 4, p.79; source issue E10 / gap G2.

Atlas planet: Bounded desmoothing.

### KV.8/interpolation — Critical Hecke-value interpolation over totally imaginary fields

For a p-ordinary lifted type Σ of L and a tame integral ideal f prime to p, construct a bounded O_(ℂ_p)-valued measure μ_f on G_f=Gal(L(p∞f)/L) such that for every critical algebraic χ of conductor dividing p∞f and infinity type β−α,
(Ω_p^α(Ω_p∨)^β)⁻¹∫_(G_f)χ(g)dμ_f(g)=𝒩_(α,β)(Local(χ,Σ)·∏_(v∈Σ_p)(1−χ(v⁻¹)/Nv)·∏_(v∈barΣ_p)(1−χ(v))·L_f(χ,0)).
At a prime ramified in χ set the corresponding ideal-character value to zero so the omitted Euler factor is one; χ(v⁻¹)=0 in that convention is not the inverse of zero. Primitive versus f-imprimitive L-functions are related by exactly the displayed depletion factors. Prove uniqueness from the finite-order-twist density after boundedness has been established. This is the target of Theorem 5.27 with the explicit G1–G3 proof obligations, not a claim that they have been discharged. At L=K, tame conductor f=O_K and the overlapping Katz infinity types −kΣ−Σ_σ d(σ)(σ−barσ), k≥1 and d(σ)≥0, compare with the existing L3 Katz measure under the same periods, Artin convention, local factors and primitive/imprimitive convention. The current L3 target does not supply a comparison for arbitrary tame f or every critical type.

Hypotheses:

- Ordinary standard datum, O_L Betti structure, complex and p-adic periods fixed; all characters read through the chosen embeddings.
- G1 sign comparison, G2 bounded desmoothing and G3 integral unit normalization must be proved.

Construction / proof:

1. Combine the corrected smoothed interpolation with bounded-desmoothing.
2. At ramified and unramified Σ-places compute the separate Fourier contributions; collect the complete barΣ-depletion.
3. Use density for uniqueness after boundedness. Compare with L3/katz-padic-l-function only at L=K, f=O_K and its stated overlapping infinity-type range, after transporting the conventions.

Checks:

- Test d=1 with a split ordinary prime, d>1 with L=K, and a non-CM quartic containing K.
- An inert prime for an imaginary quadratic K is outside this theorem; it belongs to the independent nonordinary direction.
- Period rescaling agrees with the algebraic differential scaling on both sides.
- The general interpolation target allows tame f prime to p and arbitrary admissible critical β−α; only its Katz comparison is restricted to the existing supplier’s smaller range.

Direct dependencies: AutomorphicPadicLFunctionsPartII:KV.8/bounded-desmoothing, AutomorphicPadicLFunctionsPartII:KV.8/local-factor, AutomorphicPadicLFunctionsPartII:KV.6/padic-periods, AutomorphicPadicLFunctionsPartII:KV.5/value-normalizer, AutomorphicPadicLFunctions:L3/katz-padic-l-function, AutomorphicPadicLFunctions:L0/gauss-sum-and-depleted-l-function.

Source: Kings–Sprang, **arXiv:1912.03657v4**, Theorem 5.27, p.74 and proof pp.74–79; E6–E7, E10–E12 and gaps G1–G3.

Atlas planet: Critical Hecke p-adic L-function.

## Source versions and normalization findings

All findings below refer to the checked arXiv v4 bytes. The published journal PDF was inaccessible; none is attributed to that unread text. The journal metadata, arXiv history and author publication lists were checked for corrections. Each finding was independently checked at its locator.

- **E1** (misprint; arXiv:1912.03657v4, Proposition 3.13, p.35): Use exp(2πi⟨w,z⟩) with the pairing convention of §3.2, retaining the inverse covolume factor. Check: Poisson summation and exchanging z,w reverse the alternating pairing; check a translated lattice term directly.
- **E2** (error; arXiv:1912.03657v4, Lemma 3.16 and Proposition 3.17, pp.37–38): For 0≤j≤d−1 the coefficient is (−1)^(j+1)j!C; the resulting top coefficient is (−1)^(d(d+1)/2)d!C. Carry the changed sign to the representative. Check: Exact exterior-algebra differentiation cancels adjacent terms only with these coefficients; in dimension one its first coefficient must be −C. Integer wedge computations for d=1,…,6 check the recurrence and the top coefficient.
- **E3** (error; arXiv:1912.03657v4, §3.4, expansion p.41; Theorem 3.27 and Corollary 3.28, pp.44–45): Expand (A+v)^(−j−1) with (−1)^b. Combined with E2 the critical representative gains (−1)^(|β|+1) relative to the printed global factor. Resolve the full comparison in G1. Check: The coefficient of v in (A+v)⁻¹ is −A⁻²; the binomial expansion and contraction recurrence give the stated weight dependence.
- **E4** (misprint; arXiv:1912.03657v4, Corollary 4.15 and Remark 4.16, p.54): State L(χ,0)/c⁺(χ)∈Qbar; membership in Qbar× additionally requires L(χ,0)≠0. Keep the separate period relation modulo Qbar×. Check: Algebraicity does not imply nonvanishing, whereas the period itself is nonzero.
- **E5** (misprint; arXiv:1912.03657v4, equation (5.6.1), p.72): Use μ(σ) in the product over σ. Check: μ is a function of embeddings; it cannot be evaluated at λ in this formula.
- **E6** (gap; arXiv:1912.03657v4, Theorem 5.27, proof Step 1, pp.75–76): Transport the dimension sign and the E2–E3 weight sign through the algebraic differential and period conventions; prove G1 before asserting the final unsigned moments. Check: The explicit representative and the Step 1 expression have different prefactors as printed; an orientation/coordinate comparison is needed.
- **E7** (misprint; arXiv:1912.03657v4, Theorem 5.27, proof Step 3, p.78): Take the product over all v∈barΣ_p of (1−χ(v)), with the ramified value convention. Check: The finite transform and unit restriction act at every complementary p-place; the one-prime expression only describes a special case.
- **E8** (misprint; arXiv:1912.03657v4, Appendix A.1, p.79): Use the fixed group Γ and the given linearized sheaf consistently in both composite functors. Check: The subsequent derived-functor spectral sequence requires the same Γ-action at every occurrence.
- **E9** (error; arXiv:1912.03657v4, Proposition 3.13, p.35): Write M(s)=π^(−s)Γ(s)K(s). M has the stated residues −δ_(ν=0)δ_(z∈Λ)exp(2πi⟨−z,w⟩) at 0 and vol(Λ)⁻¹δ_(ν=0)δ_(w∈Λ∨) at d. K is regular at 0 and has residue π^d/(Γ(d)vol(Λ))δ_(ν=0)δ_(w∈Λ∨) at d. Check: For d=1, z=w=ν=0 and the square lattice of covolume 1, the Epstein sum K has residue π at 1, not 1. Dividing M by Γ(s) also removes its pole at 0.
- **E10** (gap; arXiv:1912.03657v4, Theorem 5.27, proof Step 4, p.79, referring to Step 2 p.77): Prove the uniform Kummer congruences or integral measure-algebra divisibility in G2, including torsion components and common zeros. Check: On finite C_p, p⁻¹Σ_gδ_g has finite-character values 1 or 0 but sends the indicator at the identity to 1/p. Thus integral character values alone do not give an integral functional. This diagnoses a missing justification, not falsity of the interpolation theorem.
- **E11** (error; arXiv:1912.03657v4, Proposition 2.27, proof and diagram (2.4.2), pp.22–23): Use the integral fundamental cycle for torsion-free Γ. For torsion Γ localize at its torsion order to define the index-normalized cap; recover integrality for the special EK classes only after proving G3. Check: For d=1, Γ=μ₂ and Γ′=1, transfer H₀(Γ,ℤ)→H₀(Γ′,ℤ) is multiplication by 2. The diagram’s normalized cap on arbitrary trivial coefficients would send 1 to 1/2 over ℤ₂. This does not follow integrally from injectivity of multiplication by the index.
- **E12** (misprint; arXiv:1912.03657v4, Theorem 5.27, proof Step 1, ray-class exact sequence, pp.74–75): For nontrivial f use the closure of O_f×, the units congruent to 1 modulo f. For f=O_L these groups coincide. Check: The exact ray-class sequence retains the tame congruence condition when projecting to Cl_f; a unit with nontrivial tame residue does not belong to the indicated kernel merely because it is global.
- **E13** (error; arXiv:1912.03657v4, Lemma 3.25, p.43): If Γ fixes t modulo Λ the stated index rule holds. Otherwise sum E(t_i,s;Λ,Γ′) over the Γ′-orbits in Γt; that sum equals [Γ:Γ′]E(t,s;Λ,Γ). Check: For Γ=μ₄, Γ′=1, Λ=ℤ[i], t=1/3 and α=4, β=0, rotation identifies each of the four coset sums. A single Γ′ sum equals E_Γ, not 4E_Γ. The missing orbit multiplicity is recovered only by summing all four classes.
- **E14** (error; arXiv:1912.03657v4, Proposition 1.5, p.8): Require M to be R-torsion-free for this invariant-submodule formula. The finite locally free coefficient modules used by the EK construction satisfy this condition; generic torus weight decomposition itself remains valid without it. Check: Take L=ℚ(ζ₃), R=ℤ[ζ₃,1/3], Γ=μ₆ and the weight 3σ on M=R/(2). Its weight is nontrivial on Γ over R, since a primitive sixth root acts with weight −1; on M this action is trivial and M^Γ=M≠0. A domain coefficient ring does not prevent torsion in M.
- **E15** (misprint; arXiv:1912.03657v4, Theorem 2.30, p.24): Denote the second basis by ω(B∨), consistent with its cotangent sheaf and with the theorem’s evaluation formula. Check: The second basis belongs to ω_(B∨/R); the next displayed evaluation uses its dual-labelled basis. This is a label error, not an identification of the two eigenspaces.

## Source and requirement coverage

Primary source: Guido Kings and Johannes Sprang, [Eisenstein–Kronecker classes, integrality of critical values of Hecke L-functions and p-adic interpolation, v4](https://arxiv.org/pdf/1912.03657v4). Publication metadata: [Annals 202 (2025), 1–109](https://annals.math.princeton.edu/2025/202-1/p01). Source bytes have SHA-256 fab8e605123cf9c399753b7114c4fd65000e1863e3507abdd4129c8c940fbb72.

The split boundary uses Ashay A. Burungale, Shinichi Kobayashi and Kazuto Ota, [Rubin’s conjecture on local units in the anticyclotomic tower at inert primes](https://authors.library.caltech.edu/records/8svwt-jn031/files/annals.2021.194.3.8.pdf), §3, pp.950–954 and §6, pp.961–962, with introduction pp.943–944. No claim is made to have read Finis’s original paper, Kato’s original source or the uncleared de Shalit book. Their needed mathematical interfaces have explicit owners or proof obligations.

All 52 routed Kings–Sprang items are covered below. An item can feed several targets; generic weight decomposition in item 004 remains imported. The ten BKO items are all assigned to the four-layer split proposal in the packet, with the acyclic direction NonordinaryCMSpecialValues → AnticyclotomicLocalUnits → InertAnticyclotomicCMMainConjecture and the direct first-to-last edge.

| Routed item | Targets |
| --- | --- |
| 004 | KV.0/critical-types |
| 005 | KV.0/critical-types |
| 010 | KV.0/coefficient-invariants |
| 011 | KV.0/standard-datum |
| 032 | KV.1/residue-calculation |
| 033 | KV.1/trace-zero-data |
| 034 | KV.1/residue-calculation |
| 035 | KV.1/ek-class |
| 036 | KV.1/ek-class, KV.1/derivative-class |
| 037 | KV.2/torsion-moments |
| 038 | KV.2/critical-evaluation |
| 039 | KV.2/critical-evaluation |
| 040 | KV.2/finite-index |
| 041 | KV.2/refined-evaluation |
| 042 | KV.2/integral-comparison |
| 043 | KV.2/polylog |
| 044 | KV.3/borel-complex |
| 045 | KV.3/current-resolution |
| 046 | KV.3/kronecker-series |
| 047 | KV.3/mellin-continuation |
| 048 | KV.3/normalized-current |
| 049 | KV.3/normalized-current |
| 050 | KV.3/normalized-current |
| 051 | KV.3/current-equation |
| 052 | KV.3/current-equation |
| 053 | KV.4/explicit-ek |
| 054 | KV.4/orbit-eisenstein |
| 055 | KV.4/fibre-integral |
| 056 | KV.4/explicit-ek |
| 057 | KV.4/explicit-ek |
| 059 | KV.5/partial-l-identity |
| 060 | KV.5/ideal-periods |
| 061 | KV.5/ideal-periods |
| 062 | KV.5/value-normalizer, KV.5/eisenstein-integrality |
| 063 | KV.5/torsion-distribution |
| 064 | KV.5/partial-critical-integrality |
| 065 | KV.5/critical-integrality |
| 066 | KV.5/shimura-formula |
| 068 | KV.5/weak-deligne |
| 070 | KV.6/ordinary-level |
| 071 | KV.6/ordinary-level |
| 072 | KV.6/ordinary-level |
| 073 | KV.6/ordinary-level |
| 074 | KV.6/padic-periods |
| 075 | KV.6/theta-class |
| 076 | KV.6/theta-class |
| 077 | KV.6/differential-moments |
| 079 | KV.7/eisenstein-measure |
| 080 | KV.7/translation |
| 081 | KV.7/partial-fourier, KV.7/locally-constant-moments |
| 083 | KV.8/local-factor |
| 084 | KV.8/smoothing-atom, KV.8/smoothed-ray-measure, KV.8/bounded-desmoothing, KV.8/interpolation |
