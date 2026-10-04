# The Jacobian challenge, Part II

Unless narrowed explicitly, S is noetherian and π:X→S is smooth projective of relative dimension one, with geometrically connected fibres of constant genus g>0. Disconnected bases are handled componentwise. Picard objects are fppf sheaves; all equalities of bundles mean isomorphism classes unless a rigidification is specified.

The scope is the algebraic input to Yuan’s theta and shifted-family constructions and DGH’s section-free universal differences. The eight layers below state the required mathematics. A planning pass is complete when all targets are accounted for; the recorded proof and interface gaps do not certify mathematical closure.

Conventions: Pic denotes actual invertible-sheaf classes when its argument is a scheme. Pic_{X/S} denotes the imported fppf relative Picard sheaf. Pic⁻ is an actual axis-kernel subgroup, Pic⁰⁰ requires algebraic triviality along both projections, and a rigidification is specified data. P uses the negative addition formula; Θ is the dual diagonal pullback. The field identities are bundle-class equalities and require an explicit fibre normalization to produce a canonical scalar isomorphism.

The generic construction ends at JC5. JC6 imports stable generalized Jacobians and relative duality; JC7 applies the generic construction to the imported fine-level universal curve. The universal moduli scheme is not used to construct the generic relative Jacobian.

## JC0. Relative Picard degree components

Unless narrowed explicitly, S is noetherian and π:X→S is smooth projective of relative dimension one, with geometrically connected fibres of constant genus g>0. Disconnected bases are handled componentwise. Picard objects are fppf sheaves; all equalities of bundles mean isomorphism classes unless a rigidification is specified.

Dependencies: AlgebraicModuliForArithmeticGeometry:A0-extension, AlgebraicModuliForArithmeticGeometry:R09.2, AlgebraicModuliForArithmeticGeometry:R09.3, tauceti:TauCetiRoadmap/JacobianChallenge#layer-a-line-bundles-divisors-picard-group-degree, tauceti:TauCetiRoadmap/JacobianChallenge#layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality, tauceti:TauCetiRoadmap/JacobianChallenge#layer-c-relative-coherent-cohomology-and-base-change.

### Relative degree components

Declaration: JacobianChallengePartII:JC0/relative-degree-components.

For every d∈ℤ, Picᵈ_{X/S} is the sub-fppf-sheaf of the imported Pic_{X/S} whose geometric-fibre classes have degree d. A locally varying integer degree gives the disjoint union of these constant-degree pieces, not a single globally constant integer on disconnected T.

Hypotheses: Unless narrowed explicitly, S is noetherian and π:X→S is smooth projective of relative dimension one, with geometrically connected fibres of constant genus g>0. Disconnected bases are handled componentwise. Picard objects are fppf sheaves; all equalities of bundles mean isomorphism classes unless a rigidification is specified.

Construction or proof:

- Use the parent degree on each geometric fibre.
- Use cohomology and base change to make degree locally constant.
- Fppf descent of this condition gives the sub-sheaf; do not replace sheafification by actual global representatives.

Inputs: AlgebraicModuliForArithmeticGeometry:A0-extension/relative-picard-sheaf, tauceti:TauCetiRoadmap/JacobianChallenge#layer-a-line-bundles-divisors-picard-group-degree, tauceti:TauCetiRoadmap/JacobianChallenge#layer-c-relative-coherent-cohomology-and-base-change, JacobianChallengePartII:JC0/degree-locally-constant.

Source: yuan §2.2.1 pp.29–31; DGH §6.1 pp.23–24.

API:

- RelativeJacobian.RelativeDegreeComponents.mem (characterisation): A class lies in Picᵈ(T) iff its degree is d on every geometric fibre.
- RelativeJacobian.RelativeDegreeComponents.tensor (structure): Tensor product sends Picᵈ×Picᵉ to Picᵈ⁺ᵉ.
- RelativeJacobian.RelativeDegreeComponents.baseChange (functoriality): Picᵈ_{X/S} restricted to Sch/T identifies with Picᵈ_{X_T/T}.

Unit tests:

- RelativeJacobian.RelativeDegreeComponents.test_elliptic (computation): For an elliptic curve E/k, O_E(e) lies in Pic¹ and O_E lies in Pic⁰.
- RelativeJacobian.RelativeDegreeComponents.test_disconnected (non-example): On a disconnected T, a bundle of degrees 0 and 1 belongs to the whole Picard sheaf but neither constant-degree piece.
- RelativeJacobian.RelativeDegreeComponents.test_field (compatibility): Over Spec k the component is the parent degree-d Picard scheme, and is not the degree-d divisor set.

Uses:

- DGH §6.1: Construct the Pic¹ torsor without a section.
- Yuan §2.2.1: Locate d[x]−α in the identity component.

Acceptance:

- Retain the displayed hypotheses and functorial identifications under every base change; verify morphism identities on all test schemes, including nonreduced ones.

### Local constancy of relative degree

Declaration: JacobianChallengePartII:JC0/degree-locally-constant.

For an invertible L on X_T, the function t↦deg(L_t)=χ(L_t)−χ(O_{X_t}) is locally constant on T and unchanged after any base extension of residue fields.

Hypotheses: Unless narrowed explicitly, S is noetherian and π:X→S is smooth projective of relative dimension one, with geometrically connected fibres of constant genus g>0. Disconnected bases are handled componentwise. Picard objects are fppf sheaves; all equalities of bundles mean isomorphism classes unless a rigidification is specified.

Construction or proof:

- Apply constancy of Euler characteristics to the proper flat finitely presented family and its invertible sheaf.
- Subtract the structure-sheaf Euler characteristic and apply the parent divisor-degree comparison on fibres.

Inputs: tauceti:TauCetiRoadmap/JacobianChallenge#layer-a-line-bundles-divisors-picard-group-degree, tauceti:TauCetiRoadmap/JacobianChallenge#layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality, tauceti:TauCetiRoadmap/JacobianChallenge#layer-c-relative-coherent-cohomology-and-base-change.

Source: blr §9.1 degree discussion; §9.3 Theorem1 p.252.

Acceptance:

- Retain the displayed hypotheses and functorial identifications under every base change; verify morphism identities on all test schemes, including nonreduced ones.

### Relative curve Picard scheme

Declaration: JacobianChallengePartII:JC0/picard-representability.

Pic_{X/S} is represented by a smooth separated S-group scheme, with open-and-closed quasi-projective pieces Picᵈ_{X/S} for d∈ℤ. Its degree-zero piece is the identity component. Representability commutes with arbitrary change of base.

Hypotheses: Unless narrowed explicitly, S is noetherian and π:X→S is smooth projective of relative dimension one, with geometrically connected fibres of constant genus g>0. Disconnected bases are handled componentwise. Picard objects are fppf sheaves; all equalities of bundles mean isomorphism classes unless a rigidification is specified.

Construction or proof:

- Apply the relative-curve representability theorem to projective flat finitely presented X/S with geometrically reduced irreducible fibres.
- Use vanishing of H² on curves for smoothness.
- Use local constancy of degree and the fibre identity-component criterion.
- Transfer the group law and base change through Yoneda; smoothness of the Hilbert parameter scheme is not inferred from flatness of its universal family.

Inputs: JacobianChallengePartII:JC0/relative-degree-components, tauceti:TauCetiRoadmap/JacobianChallenge#layer-c-relative-coherent-cohomology-and-base-change, AlgebraicModuliForArithmeticGeometry:R09.2, AlgebraicModuliForArithmeticGeometry:R09.3.

Source: blr §9.3 Theorem1 and proof p.252.

Acceptance:

- Retain the displayed hypotheses and functorial identifications under every base change; verify morphism identities on all test schemes, including nonreduced ones.

### Picard degree torsors

Declaration: JacobianChallengePartII:JC0/picard-torsors.

Tensoring by degree-zero classes makes Picᵈ_{X/S} an fppf torsor under Pic⁰_{X/S}; Picᵈ need not have an S-point. Its difference morphism Picᵈ×_S Picᵈ→Pic⁰ sends (L,M) to M⊗L⁻¹.

Hypotheses: Unless narrowed explicitly, S is noetherian and π:X→S is smooth projective of relative dimension one, with geometrically connected fibres of constant genus g>0. Disconnected bases are handled componentwise. Picard objects are fppf sheaves; all equalities of bundles mean isomorphism classes unless a rigidification is specified.

Construction or proof:

- Obtain local sections after an fppf cover of S using relative degree-d divisors (negative d uses inverses).
- Translate Pic⁰ to Picᵈ using that section.
- Descend the torsor action and difference, defined intrinsically by tensor product.

Inputs: JacobianChallengePartII:JC0/picard-representability.

Source: blr §9.3 Theorem1 p.252.

API:

- RelativeJacobian.PicardTorsors.action (structure): J×Picᵈ→Picᵈ is tensor product.
- RelativeJacobian.PicardTorsors.difference (constructor): δ(L,M)=M⊗L⁻¹ belongs to J and is independent of local origins.
- RelativeJacobian.PicardTorsors.translation (equivalence): A chosen β∈Picᵈ(T) identifies Picᵈ_T with J_T by L↦L⊗β⁻¹.

Unit tests:

- RelativeJacobian.PicardTorsors.test_zero (degenerate): Pic⁰ is the trivial J-torsor with the structure-sheaf origin.
- RelativeJacobian.PicardTorsors.test_genusOne (non-example): A genus-one curve of period>1 has no k-point of Pic¹; a global origin cannot be inserted in the torsor definition.
- RelativeJacobian.PicardTorsors.test_swap (computation): δ(M,L)=−δ(L,M), whereas δ(L,L)=0.

Uses:

- DGH §6.1 pp.24–25: Defines the difference without choosing a section.
- Yuan §2.2.1: Normalizes degree-d classes using α.

Acceptance:

- Retain the displayed hypotheses and functorial identifications under every base change; verify morphism identities on all test schemes, including nonreduced ones.

Coverage: planned. Remaining refinements:

- Relative Picard representability proof inputs: BLR9.3/1 p.252 has been read with its proof; its nonroutine prerequisites 8.2/1, 8.2/5, 8.4/2 and the degree criterion9.2/13 must be supplied at declaration granularity. 8.4/2 and9.2/13 were read in this pass; the full representability/quotient proof of8.2/1 and8.2/5 was not read. Resolve the Hilbert/quotient supplier request rather than treating Theorem9.3/1 as a black-box baseline.
- Resolve supplier tauceti:TauCetiRoadmap/JacobianChallenge#layer-a-line-bundles-divisors-picard-group-degree: Picard group of actual invertible sheaves with duals, pullback and divisor-to-line-bundle comparison; line-bundle fibre degree agrees with weighted scheme-divisor degree.
- Resolve supplier tauceti:TauCetiRoadmap/JacobianChallenge#layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality: Curve Riemann–Roch, canonical degree2g−2 and Serre duality; their stable relative duality extension is required for the explicitly nodal Hodge comparison.
- Resolve supplier tauceti:TauCetiRoadmap/JacobianChallenge#layer-c-relative-coherent-cohomology-and-base-change: Proper-flat curve cohomology and arbitrary base-change comparisons, relative effective Cartier sections and diagonals, symmetric-power representability with universal relative divisors.
- Resolve supplier AlgebraicModuliForArithmeticGeometry:R09.2: Relative Hilbert/Div representability, the projective relative-curve Picard quotient infrastructure and the proper-family fibrewise ampleness criterion; parameter-space flatness must not be inferred from universal-family flatness.
- Resolve supplier AlgebraicModuliForArithmeticGeometry:R09.3: Effective fppf descent of the represented projective Picard objects, closed immersions, finiteness and actual invertible sheaves; maintain the distinction between descent of a bundle and of its class.
- Replace the exact prototype omissions for this stage when the imported geometric interfaces can express them; compile the complete geometric signatures without surrogate predicates.

## JC1. Relative Jacobians and principal polarization

Unless narrowed explicitly, S is noetherian and π:X→S is smooth projective of relative dimension one, with geometrically connected fibres of constant genus g>0. Disconnected bases are handled componentwise. Picard objects are fppf sheaves; all equalities of bundles mean isomorphism classes unless a rigidification is specified.

Dependencies: AbelianSchemesAndArithmeticModuli:A1, AbelianSchemesAndArithmeticModuli:A2, AlgebraicModuliForArithmeticGeometry:A0-extension, JacobianChallengePartII:JC0, tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme, tauceti:TauCetiRoadmap/JacobianChallenge#layer-e-abelian-varieties.

### Relative Jacobian

Declaration: JacobianChallengePartII:JC1/relative-jacobian.

J(X/S):=Pic⁰_{X/S}, with the tensor group law, is an abelian scheme of relative dimension g. No section of X/S is part of its data.

Hypotheses: Unless narrowed explicitly, S is noetherian and π:X→S is smooth projective of relative dimension one, with geometrically connected fibres of constant genus g>0. Disconnected bases are handled componentwise. Picard objects are fppf sheaves; all equalities of bundles mean isomorphism classes unless a rigidification is specified.

Construction or proof:

- Use the identity-component representability of JC0.
- Prove properness of the identity component of a smooth proper curve Picard scheme.
- Apply the abelian-scheme definition and the tangent/cohomology dimension comparison.

Inputs: JacobianChallengePartII:JC0/picard-representability, AbelianSchemesAndArithmeticModuli:A1, tauceti:TauCetiRoadmap/JacobianChallenge#layer-e-abelian-varieties, JacobianChallengePartII:JC1/jacobian-proper.

Source: yuan §2.2.1 p.29; BLR §9.4 Proposition4 pp.260–261.

API:

- RelativeJacobian.RelativeJacobian.points (characterisation): J(T)=Pic⁰_{X/S}(T), with its fppf sheaf interpretation.
- RelativeJacobian.RelativeJacobian.baseChange (functoriality): J(X/S)×_S T≅J(X_T/T), with the group law preserved.
- RelativeJacobian.RelativeJacobian.field (compatibility): At every field-valued base the result is the parent Jacobian, as an abelian variety.

Unit tests:

- RelativeJacobian.RelativeJacobian.test_elliptic (compatibility): For an elliptic curve E with identity, J(E/k)≅E identifies the origins and group laws.
- RelativeJacobian.RelativeJacobian.test_unpointed (non-example): A genus-one torsor C/k has J(C/k) even when C(k)=∅.
- RelativeJacobian.RelativeJacobian.test_singular (non-example): For an irreducible one-nodal curve the generalized Pic⁰ has a torus and is not an abelian scheme; it is not in this smooth definition.

Uses:

- Yuan Definition2.4: Carries the twice-theta line bundle.
- DGH §6.1: Supplies the principally polarized relative Jacobian of the universal curve.

Acceptance:

- Retain the displayed hypotheses and functorial identifications under every base change; verify morphism identities on all test schemes, including nonreduced ones.

### Properness of the relative Jacobian

Declaration: JacobianChallengePartII:JC1/jacobian-proper.

For smooth projective geometrically connected X/S, Pic⁰_{X/S}→S is proper. Consequently it is projective locally over S and the canonical relatively ample twice-theta bundle of JC3 will make it projective over S.

Hypotheses: Unless narrowed explicitly, S is noetherian and π:X→S is smooth projective of relative dimension one, with geometrically connected fibres of constant genus g>0. Disconnected bases are handled componentwise. Picard objects are fppf sheaves; all equalities of bundles mean isomorphism classes unless a rigidification is specified.

Construction or proof:

- Apply the smooth-curve identity-component properness criterion, including its valuative separatedness argument.
- Do not infer properness from algebraic-space representability.

Inputs: JacobianChallengePartII:JC0/picard-representability, tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme, AbelianSchemesAndArithmeticModuli:A1.

Source: blr §9.4 Proposition4 and proof pp.260–261.

Acceptance:

- Retain the displayed hypotheses and functorial identifications under every base change; verify morphism identities on all test schemes, including nonreduced ones.

### Base change of the relative Jacobian

Declaration: JacobianChallengePartII:JC1/jacobian-base-change.

For every T→S, the Picard-sheaf base-change isomorphism restricts to a group-scheme isomorphism J(X/S)_T≅J(X_T/T), including infinitesimal base changes.

Hypotheses: Unless narrowed explicitly, S is noetherian and π:X→S is smooth projective of relative dimension one, with geometrically connected fibres of constant genus g>0. Disconnected bases are handled componentwise. Picard objects are fppf sheaves; all equalities of bundles mean isomorphism classes unless a rigidification is specified.

Construction or proof:

- Restrict the represented fppf sheaves to Sch/T.
- Identify degree-zero components by the geometric degree condition.
- Use Yoneda on all test schemes for the group-scheme isomorphism.

Inputs: JacobianChallengePartII:JC1/relative-jacobian, AlgebraicModuliForArithmeticGeometry:A0-extension/relative-picard-base-change, JacobianChallengePartII:JC0/relative-degree-components.

Source: milne §8 Generalizations, Theorem8.1 and following paragraph pp.27–28.

Acceptance:

- Retain the displayed hypotheses and functorial identifications under every base change; verify morphism identities on all test schemes, including nonreduced ones.

### Canonical principal polarization

Declaration: JacobianChallengePartII:JC1/principal-polarization.

There is a canonical principal polarization λ_X:J→J∨, functorial in base change, defined without a global degree-one bundle on X. After an fppf cover with a degree-one bundle it agrees with the classical theta polarization, with Yuan’s Poincaré sign convention pinned in JC3.

Hypotheses: Unless narrowed explicitly, S is noetherian and π:X→S is smooth projective of relative dimension one, with geometrically connected fibres of constant genus g>0. Disconnected bases are handled componentwise. Picard objects are fppf sheaves; all equalities of bundles mean isomorphism classes unless a rigidification is specified.

Construction or proof:

- Construct the local theta polarization after the cover acquiring a section.
- Compare two local origins by translation invariance of the associated polarization homomorphism.
- Descend the actual morphism and its inverse, with a cocycle verified on all test schemes; fibre equality alone is insufficient over nonreduced S.

Inputs: JacobianChallengePartII:JC1/relative-jacobian, JacobianChallengePartII:JC1/jacobian-base-change, AbelianSchemesAndArithmeticModuli:A2, tauceti:TauCetiRoadmap/JacobianChallenge#layer-e-abelian-varieties.

Source: yuan §2.2.1 p.30 (MFK §6.1 Proposition6.9).

API:

- RelativeJacobian.PrincipalPolarization.isIso (structure): λ_X is an isomorphism of abelian schemes.
- RelativeJacobian.PrincipalPolarization.baseChange (functoriality): λ_{X_T} is the base change of λ_X under the canonical J and dual comparisons.
- RelativeJacobian.PrincipalPolarization.theta (compatibility): The classical theta bundle on a field fibre induces λ_X with the specified polarization sign convention.

Unit tests:

- RelativeJacobian.PrincipalPolarization.test_elliptic (computation): For genus one, λ_X is the usual degree-one elliptic principal polarization.
- RelativeJacobian.PrincipalPolarization.test_noTheta (non-example): The construction exists when X has no global degree-one bundle; it cannot require a global theta divisor.
- RelativeJacobian.PrincipalPolarization.test_dualNumbers (characterisation): For S=Spec(k[ε]/ε²), overlap comparisons are equal as S-morphisms, not just on the reduced fibre.

Uses:

- Yuan Definition2.4: Pulls back the normalized Poincaré bundle.
- DGH §6.1: Defines the moduli map with level.

Acceptance:

- Retain the displayed hypotheses and functorial identifications under every base change; verify morphism identities on all test schemes, including nonreduced ones.

Coverage: planned. Remaining refinements:

- Relative properness and canonical polarization descent: BLR9.4 Proposition4 pp.260–262 and its theta-polarization construction were inspected, and Yuan explicitly cites MFK6.9. Verify the entire MFK6.9 proof and all nilpotent-base cocycles for the canonical principal polarization, and the exact proper identity-component criterion invoked in BLR8.4/3. A geometric-fibre polarization alone does not define an S-morphism.
- Resolve supplier tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme: Field Picard representability and properness; imported only for fibre and parent specialization checks, not as a theorem over an arbitrary noetherian base.
- Resolve supplier tauceti:TauCetiRoadmap/JacobianChallenge#layer-e-abelian-varieties: Field Jacobian tangent dimension, classical theta polarization and theta Cartier-divisor construction; no relative extension is silently assumed.
- Resolve supplier AbelianSchemesAndArithmeticModuli:A1: Abelian schemes, translations, rigidity over nonreduced bases, fibre powers, theorem of the square/cube, and homomorphism descent.
- Resolve supplier AbelianSchemesAndArithmeticModuli:A2: Dual abelian schemes, normalized Poincaré bundle, biduality, Pic⁰ translation invariance, polarization sign convention and normalized seesaw on products.
- Replace the exact prototype omissions for this stage when the imported geometric interfaces can express them; compile the complete geometric signatures without surrogate predicates.

## JC2. Section-free Abel and difference morphisms

Unless narrowed explicitly, S is noetherian and π:X→S is smooth projective of relative dimension one, with geometrically connected fibres of constant genus g>0. Disconnected bases are handled componentwise. Picard objects are fppf sheaves; all equalities of bundles mean isomorphism classes unless a rigidification is specified.

Dependencies: AbelianSchemesAndArithmeticModuli:A1, AbelianSchemesAndArithmeticModuli:A3, AlgebraicModuliForArithmeticGeometry:R09.3, JacobianChallengePartII:JC0, JacobianChallengePartII:JC1, tauceti:TauCetiRoadmap/JacobianChallenge#layer-c-relative-coherent-cohomology-and-base-change, tauceti:TauCetiRoadmap/JacobianChallenge#layer-f-abeljacobi-and-the-universal-property.

### Section-free Abel map

Declaration: JacobianChallengePartII:JC2/section-free-abel-map.

The diagonal relative effective Cartier divisor on X×_S X defines a canonical S-morphism a₁:X→Pic¹_{X/S}, taking a T-point x to O_{X_T}(Γ_x). It commutes with arbitrary base change and needs no section of π.

Hypotheses: Unless narrowed explicitly, S is noetherian and π:X→S is smooth projective of relative dimension one, with geometrically connected fibres of constant genus g>0. Disconnected bases are handled componentwise. Picard objects are fppf sheaves; all equalities of bundles mean isomorphism classes unless a rigidification is specified.

Construction or proof:

- Use smooth relative dimension one to make Γ_x a relative effective Cartier divisor.
- Take its invertible sheaf and map to the relative Picard sheaf.
- Use representability for the S-morphism and the pullback law of the diagonal.

Inputs: JacobianChallengePartII:JC0/picard-torsors, tauceti:TauCetiRoadmap/JacobianChallenge#layer-c-relative-coherent-cohomology-and-base-change.

Source: dgh §6.1 pp.24–25.

API:

- RelativeJacobian.SectionFreeAbelMap.value (simp): a₁(x)=[O(Γ_x)] in Pic¹(T).
- RelativeJacobian.SectionFreeAbelMap.baseChange (functoriality): The Abel map of X_T is the base change of a₁.
- RelativeJacobian.SectionFreeAbelMap.pointed (compatibility): If x₀ is chosen, subtracting a₁(x₀) gives the parent pointed Abel–Jacobi map.

Unit tests:

- RelativeJacobian.SectionFreeAbelMap.test_ellipticTorsor (compatibility): For a genus-one curve C, a₁:C→Pic¹_C is an isomorphism of torsors, including when C(k)=∅.
- RelativeJacobian.SectionFreeAbelMap.test_degree (computation): A geometric point gives degree1, not degree0.
- RelativeJacobian.SectionFreeAbelMap.test_noOrigin (non-example): Without an origin the codomain is Pic¹, not J; translating requires a specified relative degree-one class.

Uses:

- DGH §6.1: Constructs universal Faltings–Zhang morphisms without sections.
- Yuan §2.2.1: Constructs i_α through degree-d Picard arithmetic.

Acceptance:

- Retain the displayed hypotheses and functorial identifications under every base change; verify morphism identities on all test schemes, including nonreduced ones.

### Degree-d Abel–Jacobi morphism

Declaration: JacobianChallengePartII:JC2/degree-abel-map.

For an actual invertible α on X of constant relative degree d∈ℤ, i_α:X→J sends x to [O(dΓ_x)⊗α_T⁻¹]. The morphism exists for every d, including 0 and negative d.

Hypotheses: Unless narrowed explicitly, S is noetherian and π:X→S is smooth projective of relative dimension one, with geometrically connected fibres of constant genus g>0. Disconnected bases are handled componentwise. Picard objects are fppf sheaves; all equalities of bundles mean isomorphism classes unless a rigidification is specified.

Construction or proof:

- Multiply the Picard-sheaf class a₁(x) by d and subtract α.
- The degree becomes d−d=0.
- Represent the resulting natural transformation by a scheme morphism.

Inputs: JacobianChallengePartII:JC2/section-free-abel-map, JacobianChallengePartII:JC0/picard-torsors, JacobianChallengePartII:JC1/relative-jacobian.

Source: yuan §2.2.1 p.29.

API:

- RelativeJacobian.DegreeAbelMap.value (simp): i_α(x)=[dΓ_x−α_T].
- RelativeJacobian.DegreeAbelMap.baseChange (functoriality): i_{α_T} is the base change of i_α.
- RelativeJacobian.DegreeAbelMap.originChange (relation): For α,β of the same degree, i_β=t_{α−β}∘i_α.
- RelativeJacobian.DegreeAbelMap.pointed (compatibility): For α=O(x₀) and d=1, i_α is the parent pointed Abel–Jacobi morphism.

Unit tests:

- RelativeJacobian.DegreeAbelMap.test_zero (degenerate): For d=0 the map is the constant section −[α]; it is not finite on a nonempty positive-dimensional curve fibre.
- RelativeJacobian.DegreeAbelMap.test_one (compatibility): For d=1 and α=O(x₀), i_α(x₀)=0.
- RelativeJacobian.DegreeAbelMap.test_inseparable (non-example): For d=p in characteristic p, no étaleness of [p] is assumed in defining i_α.

Uses:

- Yuan Theorems2.9,2.10: Defines canonical-bundle embeddings and pullbacks.
- Yuan Proposition2.6: Induces pullback on Picard groups.

Acceptance:

- Retain the displayed hypotheses and functorial identifications under every base change; verify morphism identities on all test schemes, including nonreduced ones.

### Local pointed factorization

Declaration: JacobianChallengePartII:JC2/pointed-factorization.

After any base change with a section x₀:X_T/T, i_α=t_β∘[d]∘i_{O(x₀)}, where β=[dO(x₀)−α_T]∈J(T). The equality holds as T-morphisms.

Hypotheses: Unless narrowed explicitly, S is noetherian and π:X→S is smooth projective of relative dimension one, with geometrically connected fibres of constant genus g>0. Disconnected bases are handled componentwise. Picard objects are fppf sheaves; all equalities of bundles mean isomorphism classes unless a rigidification is specified.

Construction or proof:

- Evaluate both maps on arbitrary U→T using the relative Picard group law.
- Apply Yoneda, retaining nonreduced U.

Inputs: JacobianChallengePartII:JC2/degree-abel-map, tauceti:TauCetiRoadmap/JacobianChallenge#layer-f-abeljacobi-and-the-universal-property, AbelianSchemesAndArithmeticModuli:A1.

Source: yuan §2.2.1 pp.29–31.

Acceptance:

- Retain the displayed hypotheses and functorial identifications under every base change; verify morphism identities on all test schemes, including nonreduced ones.

### Degree-one Abel immersion

Declaration: JacobianChallengePartII:JC2/degree-one-closed-immersion.

If d=1, i_α:X→J is a closed immersion over every noetherian S in the standing scope. No global section of X/S is required.

Hypotheses: Unless narrowed explicitly, S is noetherian and π:X→S is smooth projective of relative dimension one, with geometrically connected fibres of constant genus g>0. Disconnected bases are handled componentwise. Picard objects are fppf sheaves; all equalities of bundles mean isomorphism classes unless a rigidification is specified.

Construction or proof:

- On a cover acquiring a section identify the map with a translation of the pointed Abel immersion.
- Verify the fibre immersion by the parent curve theory and tangent/cohomology test.
- Descend the closed immersion; the exact relative pointed-immersion bridge is recorded as a gap.

Inputs: JacobianChallengePartII:JC2/degree-abel-map, JacobianChallengePartII:JC2/pointed-factorization, tauceti:TauCetiRoadmap/JacobianChallenge#layer-f-abeljacobi-and-the-universal-property, AlgebraicModuliForArithmeticGeometry:R09.3.

Source: yuan §2.2.1 p.29; TheoremA.3 p.110.

Acceptance:

- For genus one it is an isomorphism X≅J when α exists.
- Works in characteristic2; no separability or perfectness premise is inserted.

### Finiteness of nonzero-degree Abel maps

Declaration: JacobianChallengePartII:JC2/nonzero-degree-finite.

For d≠0, i_α:X→J is finite over S. The statement allows negative d and characteristic dividing d. The degree-zero map is constant and is not finite on a nonempty curve fibre.

Hypotheses: Unless narrowed explicitly, S is noetherian and π:X→S is smooth projective of relative dimension one, with geometrically connected fibres of constant genus g>0. Disconnected bases are handled componentwise. Picard objects are fppf sheaves; all equalities of bundles mean isomorphism classes unless a rigidification is specified.

Construction or proof:

- Use the pointed factorization on a cover acquiring a degree-one bundle.
- Compose a closed immersion, finite locally free [d], and translation.
- Descend finiteness under the faithfully flat cover.

Inputs: JacobianChallengePartII:JC2/pointed-factorization, JacobianChallengePartII:JC2/degree-one-closed-immersion, AbelianSchemesAndArithmeticModuli:A3, AlgebraicModuliForArithmeticGeometry:R09.3.

Source: yuan §2.2.1 p.29; Proposition2.6 p.31.

Acceptance:

- For d=−1 obtain a closed immersion followed by inversion.
- For d=p in characteristic p finiteness survives inseparability.

### Curve difference morphism

Declaration: JacobianChallengePartII:JC2/curve-difference.

j:X×_S X→J is δ∘(a₁,a₁), with j(x,y)=[O(Γ_y−Γ_x)]; it is defined without a section.

Hypotheses: Unless narrowed explicitly, S is noetherian and π:X→S is smooth projective of relative dimension one, with geometrically connected fibres of constant genus g>0. Disconnected bases are handled componentwise. Picard objects are fppf sheaves; all equalities of bundles mean isomorphism classes unless a rigidification is specified.

Construction or proof:

- Use the Pic¹ torsor difference with the order (x,y).
- Represent the natural transformation and check diagonal, swap and base change.

Inputs: JacobianChallengePartII:JC2/section-free-abel-map, JacobianChallengePartII:JC0/picard-torsors.

Source: yuan Theorem2.10(2) p.37; DGH §6.1 pp.24–25.

API:

- RelativeJacobian.CurveDifference.value (simp): j(x,y)=[y]−[x].
- RelativeJacobian.CurveDifference.diagonal (simp): j∘Δ_X=e∘π.
- RelativeJacobian.CurveDifference.baseChange (functoriality): The morphism commutes with arbitrary T→S.
- RelativeJacobian.CurveDifference.pointed (compatibility): With a degree-one α, j(x,y)=i_α(y)−i_α(x).

Unit tests:

- RelativeJacobian.CurveDifference.test_equal (degenerate): j(x,x)=0 on every test scheme.
- RelativeJacobian.CurveDifference.test_sign (computation): For an elliptic curve with identity, j(0,y)=y and j(y,0)=−y.
- RelativeJacobian.CurveDifference.test_noSection (non-example): The construction applies to a nontrivial genus-one torsor and must not choose a point of it.

Uses:

- Yuan Theorem2.10(2): Supplies the morphism for the diagonal pullback identity.
- DGH §6.1: Gives each coordinate of Faltings–Zhang.

Acceptance:

- Retain the displayed hypotheses and functorial identifications under every base change; verify morphism identities on all test schemes, including nonreduced ones.

### Difference as the Abel map over X

Declaration: JacobianChallengePartII:JC2/diagonal-base-change.

View X×_S X over the first X-factor. Its diagonal is a section and its Jacobian is X×_S J. The Abel map for O(Δ_X) is (x,y)↦(x,j(x,y)); forgetting the first coordinate gives j.

Hypotheses: Unless narrowed explicitly, S is noetherian and π:X→S is smooth projective of relative dimension one, with geometrically connected fibres of constant genus g>0. Disconnected bases are handled componentwise. Picard objects are fppf sheaves; all equalities of bundles mean isomorphism classes unless a rigidification is specified.

Construction or proof:

- Base change J along X→S.
- Apply the degree-one Abel map to the diagonal relative divisor.
- Compare on all test schemes, using the degree-one point formula.

Inputs: JacobianChallengePartII:JC2/curve-difference, JacobianChallengePartII:JC2/degree-abel-map, JacobianChallengePartII:JC1/jacobian-base-change, tauceti:TauCetiRoadmap/JacobianChallenge#layer-c-relative-coherent-cohomology-and-base-change.

Source: yuan proof of Theorem2.10(2) pp.38–39.

Acceptance:

- Retain the displayed hypotheses and functorial identifications under every base change; verify morphism identities on all test schemes, including nonreduced ones.

Coverage: planned. Remaining refinements:

- Relative pointed Abel immersion bridge: The parent F gives the field pointed Abel map and universal property. Establish the pointed relative closed immersion from a proper monomorphism or a fully justified relative fibre/tangent criterion, then descend. The present packet does not claim that field immersions alone automatically prove relative immersion.
- Resolve supplier tauceti:TauCetiRoadmap/JacobianChallenge#layer-c-relative-coherent-cohomology-and-base-change: Proper-flat curve cohomology and arbitrary base-change comparisons, relative effective Cartier sections and diagonals, symmetric-power representability with universal relative divisors.
- Resolve supplier tauceti:TauCetiRoadmap/JacobianChallenge#layer-f-abeljacobi-and-the-universal-property: Pointed field Abel–Jacobi universal property and its pullback autoduality characterization; the relative pointed closed-immersion bridge is a gap in this packet.
- Resolve supplier AbelianSchemesAndArithmeticModuli:A1: Abelian schemes, translations, rigidity over nonreduced bases, fibre powers, theorem of the square/cube, and homomorphism descent.
- Resolve supplier AbelianSchemesAndArithmeticModuli:A3: For every nonzero integer d, multiplication[d] on an abelian scheme is finite locally free, with scheme-theoretic torsion and Weil pairing; no invertibility of d in the base is needed for finiteness.
- Resolve supplier AlgebraicModuliForArithmeticGeometry:R09.3: Effective fppf descent of the represented projective Picard objects, closed immersions, finiteness and actual invertible sheaves; maintain the distinction between descent of a bundle and of its class.
- Replace the exact prototype omissions for this stage when the imported geometric interfaces can express them; compile the complete geometric signatures without surrogate predicates.

## JC3. Theta and normalized Poincaré identities

Unless narrowed explicitly, S is noetherian and π:X→S is smooth projective of relative dimension one, with geometrically connected fibres of constant genus g>0. Disconnected bases are handled componentwise. Picard objects are fppf sheaves; all equalities of bundles mean isomorphism classes unless a rigidification is specified.

Dependencies: AbelianSchemesAndArithmeticModuli:A1, AbelianSchemesAndArithmeticModuli:A2, AlgebraicModuliForArithmeticGeometry:R09.2, JacobianChallengePartII:JC1, JacobianChallengePartII:JC2, tauceti:TauCetiRoadmap/JacobianChallenge#layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality, tauceti:TauCetiRoadmap/JacobianChallenge#layer-c-relative-coherent-cohomology-and-base-change, tauceti:TauCetiRoadmap/JacobianChallenge#layer-e-abelian-varieties, tauceti:TauCetiRoadmap/JacobianChallenge#layer-f-abeljacobi-and-the-universal-property.

### Normalized Jacobian Poincaré bundle

Declaration: JacobianChallengePartII:JC3/jacobian-poincare.

Let P_X on J×_S J be the pullback of the rigidified Poincaré bundle via the canonical identification of J with its dual, using Yuan’s convention: on a field fibre with theta line L, its class is m*L⁻¹⊗p₁*L⊗p₂*L. It is rigidified along both zero axes. The sign comparison between this convention and the supplier φ_L convention is a required named comparison.

Hypotheses: Unless narrowed explicitly, S is noetherian and π:X→S is smooth projective of relative dimension one, with geometrically connected fibres of constant genus g>0. Disconnected bases are handled componentwise. Picard objects are fppf sheaves; all equalities of bundles mean isomorphism classes unless a rigidification is specified.

Construction or proof:

- Import the dual and normalized universal bundle.
- Fix the sign by the displayed field formula, rather than by the informal word standard.
- Pull back the universal bundle and its two rigidifications; verify the supplier-convention comparison.

Inputs: JacobianChallengePartII:JC1/principal-polarization, AbelianSchemesAndArithmeticModuli:A2.

Source: yuan §2.2.1 p.30; TheoremA.3(2) pp.110–111.

API:

- RelativeJacobian.JacobianPoincare.axes (characterisation): Both zero-axis pullbacks are canonically trivial with compatible unit trivializations.
- RelativeJacobian.JacobianPoincare.baseChange (functoriality): The normalized bundle and rigidifications commute with base change.
- RelativeJacobian.JacobianPoincare.thetaSign (compatibility): Its class on a field fibre is m*L⁻¹+p₁*L+p₂*L in additive Picard notation.

Unit tests:

- RelativeJacobian.JacobianPoincare.test_zero (degenerate): P restricted to either zero axis is trivial.
- RelativeJacobian.JacobianPoincare.test_elliptic (computation): For a genus-one pointed curve, (i,i)*P has class Δ−p₁*0−p₂*0, fixing the sign.
- RelativeJacobian.JacobianPoincare.test_baseTwist (non-example): Twisting by a nontrivial line pulled from S fails the specified zero-axis rigidifications.

Uses:

- Yuan Definition2.4: Defines Θ by the dual diagonal pullback.
- Yuan TheoremA.3: Pins all five algebraic identities.

Acceptance:

- Retain the displayed hypotheses and functorial identifications under every base change; verify morphism identities on all test schemes, including nonreduced ones.

### Theta divisor with a degree-one class

Declaration: JacobianChallengePartII:JC3/degree-one-theta.

Over a field K, for a smooth projective geometrically connected C of genus g>0 and an actual degree-one divisor α, θ_α is the image of Sym^{g−1}C→J, D↦[D−(g−1)α], with its effective Cartier divisor structure. For g=1 the symmetric power is Spec K and θ_α is the origin. This translates the parent theta construction to arbitrary degree-one α, which need not be effective or a rational point.

Hypotheses: K is any field; C is smooth projective geometrically connected of genus g>0; α is a divisor of degree1.

Construction or proof:

- Import the parent symmetric power and theta-divisor theorem.
- Translate its degree-(g−1) Picard component by −(g−1)α.
- Retain the Cartier multiplicity, not just the set-theoretic image.

Inputs: JacobianChallengePartII:JC2/degree-abel-map, tauceti:TauCetiRoadmap/JacobianChallenge#layer-c-relative-coherent-cohomology-and-base-change, tauceti:TauCetiRoadmap/JacobianChallenge#layer-e-abelian-varieties.

Source: yuan TheoremA.3 pp.110–111.

API:

- RelativeJacobian.DegreeOneTheta.image (characterisation): The support is the effective degree-(g−1) locus translated by −(g−1)α.
- RelativeJacobian.DegreeOneTheta.originChange (relation): For α′=α+c with c∈Pic⁰(C), θ_{α′} is the translate of θ_α by −(g−1)c.
- RelativeJacobian.DegreeOneTheta.parent (compatibility): For α=O(x₀), this is the parent pointed theta divisor with its Cartier structure.

Unit tests:

- RelativeJacobian.DegreeOneTheta.test_genusOne (degenerate): For g=1 θ_α is the origin divisor on the elliptic Jacobian.
- RelativeJacobian.DegreeOneTheta.test_genusTwo (computation): For g=2 θ_α is the Abel image of C.
- RelativeJacobian.DegreeOneTheta.test_notSymmetric (non-example): An arbitrary θ_α is not assumed symmetric; inversion changes it unless the relevant canonical-class condition holds.

Uses:

- Yuan TheoremA.3: Supplies the field theta line in all five identities.
- Yuan Definition2.4: Identifies the fibre class of the section-free twice-theta bundle.

Acceptance:

- Retain the displayed hypotheses and functorial identifications under every base change; verify morphism identities on all test schemes, including nonreduced ones.

### Canonical twice-theta bundle

Declaration: JacobianChallengePartII:JC3/twice-theta.

Define Θ_X:=Δ_J*(P_X∨), an actual invertible sheaf on J with the induced zero rigidification. This is defined without a degree-one bundle on X; it is not a chosen theta divisor.

Hypotheses: Unless narrowed explicitly, S is noetherian and π:X→S is smooth projective of relative dimension one, with geometrically connected fibres of constant genus g>0. Disconnected bases are handled componentwise. Picard objects are fppf sheaves; all equalities of bundles mean isomorphism classes unless a rigidification is specified.

Construction or proof:

- Use the dual of the imported invertible sheaf P_X.
- Pull back along the diagonal morphism.
- Transport the zero-axis trivializations to the identity section.

Inputs: JacobianChallengePartII:JC3/jacobian-poincare, tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf.

Source: yuan Definition2.4 p.30.

API:

- RelativeJacobian.TwiceTheta.diagonal (characterisation): Θ=Δ_J*(P∨), with the dual, not Δ_J*P.
- RelativeJacobian.TwiceTheta.baseChange (functoriality): Θ_{X_T} identifies with Θ_X pulled to J_T, respecting rigidification.
- RelativeJacobian.TwiceTheta.normalization (structure): e*Θ≅O_S with the specified trivialization.

Unit tests:

- RelativeJacobian.TwiceTheta.test_elliptic (computation): On a pointed elliptic curve the class of Θ is 2[0], of degree2.
- RelativeJacobian.TwiceTheta.test_negative (non-example): Δ_J*P has negative degree on an elliptic fibre and is not the ample bundle Θ.
- RelativeJacobian.TwiceTheta.test_noDegreeOne (non-example): Θ exists without a global degree-one class; no arbitrary theta divisor is part of its definition.

Uses:

- Yuan Theorems2.9–2.10: The algebraic bundle underlying every theta pullback.
- ArakelovGeometryAndAbelianHeightsPartII: Consumes its algebraic polarization and zero rigidification.

Acceptance:

- Retain the displayed hypotheses and functorial identifications under every base change; verify morphism identities on all test schemes, including nonreduced ones.

### Pullback of inverse theta

Declaration: JacobianChallengePartII:JC3/theta-inverse-pullback.

i_α*O_J([-1]*θ_α)≅O_C(gα).

Hypotheses: K is any field; C is smooth projective geometrically connected of genus g>0; α is a degree-one divisor; J, i_α, θ_α and P have the conventions of JC2–JC3. Statements are equalities of Picard classes, not unchosen canonical scalar isomorphisms.

Construction or proof:

- Apply the translated theta pullback formula with c=0.
- Preserve the degree-one divisor hypothesis over K; a rational base point is not substituted.

Inputs: JacobianChallengePartII:JC3/degree-one-theta, JacobianChallengePartII:JC2/degree-abel-map, tauceti:TauCetiRoadmap/JacobianChallenge#layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality.

Source: yuan TheoremA.3(1), first identity, p.110; proof p.111.

Acceptance:

- For g=1 this is the degree-one α class.
- For g=2 the degree is2.

### Pullback of theta

Declaration: JacobianChallengePartII:JC3/theta-pullback.

i_α*O_J(θ_α)≅ω_{C/K}⊗O_C((2−g)α).

Hypotheses: K is any field; C is smooth projective geometrically connected of genus g>0; α is a degree-one divisor; J, i_α, θ_α and P have the conventions of JC2–JC3. Statements are equalities of Picard classes, not unchosen canonical scalar isomorphisms.

Construction or proof:

- Combine the inverse-theta pullback with the theta/inversion translation formula.
- The additional translated-theta identity invoked from Serre is recorded as a source gap.

Inputs: JacobianChallengePartII:JC3/degree-one-theta, JacobianChallengePartII:JC3/theta-inverse-pullback, tauceti:TauCetiRoadmap/JacobianChallenge#layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality.

Source: yuan TheoremA.3(1), second identity, p.110; proof p.111.

Acceptance:

- For g=2 the answer is ω_C, independently of α.
- The degree is g, not 2g−2.

### Poincaré addition identity

Declaration: JacobianChallengePartII:JC3/poincare-addition-identity.

In Pic(J×J), P=m*O_J(−θ_α)⊗p₁*O_J(θ_α)⊗p₂*O_J(θ_α). As a rigidified isomorphism, include the constant fibre normalization of O_J(θ_α) at the origin; the displayed formula alone is a class equality over the field.

Hypotheses: K is any field; C is smooth projective geometrically connected of genus g>0; α is a degree-one divisor; J, i_α, θ_α and P have the conventions of JC2–JC3. Statements are equalities of Picard classes, not unchosen canonical scalar isomorphisms.

Construction or proof:

- Use the normalized Poincaré universal property and the theta polarization.
- Compare the zero-axis restrictions; a one-dimensional K-vector-space factor is trivial as a Picard class but has no unchosen canonical trivialization.

Inputs: JacobianChallengePartII:JC3/jacobian-poincare, JacobianChallengePartII:JC3/degree-one-theta, AbelianSchemesAndArithmeticModuli:A1, AbelianSchemesAndArithmeticModuli:A2.

Source: yuan TheoremA.3(2), p.110; proof p.111.

Acceptance:

- Retain the displayed hypotheses and functorial identifications under every base change; verify morphism identities on all test schemes, including nonreduced ones.

### Poincaré pullback on the curve square

Declaration: JacobianChallengePartII:JC3/poincare-curve-square.

In Pic(C×C), (i_α,i_α)*P=O(Δ_C)⊗p₁*O_C(−α)⊗p₂*O_C(−α). There is no assumption (2g−2)α=ω_C.

Hypotheses: K is any field; C is smooth projective geometrically connected of genus g>0; α is a degree-one divisor; J, i_α, θ_α and P have the conventions of JC2–JC3. Statements are equalities of Picard classes, not unchosen canonical scalar isomorphisms.

Construction or proof:

- Compare the two families of degree-zero line classes by the Poincaré universal property.
- Compute their translated-theta restrictions with arbitrary α.
- Use normalized seesaw to remove the axis terms; the source’s extra computation beyond Serre’s canonical-class case remains an explicit gap.

Inputs: JacobianChallengePartII:JC3/poincare-addition-identity, JacobianChallengePartII:JC3/theta-inverse-pullback, JacobianChallengePartII:JC3/theta-pullback, tauceti:TauCetiRoadmap/JacobianChallenge#layer-f-abeljacobi-and-the-universal-property, AbelianSchemesAndArithmeticModuli:A2.

Source: yuan TheoremA.3(3) p.110; proof p.111.

Acceptance:

- For genus2 with arbitrary α, the formula still holds without 2α=ω_C.
- The diagonal has positive sign.

### Theta doubling formula

Declaration: JacobianChallengePartII:JC3/theta-doubling-formula.

[2]*O_J(θ_α)≅O_J(3θ_α+[-1]*θ_α) as a Picard class over K.

Hypotheses: K is any field; C is smooth projective geometrically connected of genus g>0; α is a degree-one divisor; J, i_α, θ_α and P have the conventions of JC2–JC3. Statements are equalities of Picard classes, not unchosen canonical scalar isomorphisms.

Construction or proof:

- Apply the theorem of the cube recurrence to the theta line.
- Keep the nonsymmetric inversion term instead of replacing it by θ_α.

Inputs: JacobianChallengePartII:JC3/degree-one-theta, AbelianSchemesAndArithmeticModuli:A1.

Source: yuan proof of TheoremA.3(4), p.111.

Acceptance:

- For a symmetric theta line this specializes to [2]*L≅L⁴.

### Poincaré diagonal identity

Declaration: JacobianChallengePartII:JC3/poincare-diagonal.

Δ_J*P≅O_J(−θ_α−[-1]*θ_α).

Hypotheses: K is any field; C is smooth projective geometrically connected of genus g>0; α is a degree-one divisor; J, i_α, θ_α and P have the conventions of JC2–JC3. Statements are equalities of Picard classes, not unchosen canonical scalar isomorphisms.

Construction or proof:

- Pull the addition identity back to the diagonal, obtaining [2]*O(−θ)+O(2θ).
- Substitute the doubling formula and cancel the theta classes.

Inputs: JacobianChallengePartII:JC3/poincare-addition-identity, JacobianChallengePartII:JC3/theta-doubling-formula.

Source: yuan TheoremA.3(4) p.111.

Acceptance:

- Dualizing gives the positive twice-theta class.

### Geometric fibre twice-theta class

Declaration: JacobianChallengePartII:JC3/geometric-twice-theta.

For every geometric point s of S, Θ_s is algebraically equivalent to twice a theta divisor on J_s. With a chosen degree-one α over the algebraically closed residue field, its Picard class is θ_α+[-1]*θ_α.

Hypotheses: Unless narrowed explicitly, S is noetherian and π:X→S is smooth projective of relative dimension one, with geometrically connected fibres of constant genus g>0. Disconnected bases are handled componentwise. Picard objects are fppf sheaves; all equalities of bundles mean isomorphism classes unless a rigidification is specified.

Construction or proof:

- Base change the normalized Poincaré bundle.
- Choose α on the geometric fibre only.
- Dualize the diagonal identity; inversion acts trivially on the Néron–Severi class.

Inputs: JacobianChallengePartII:JC3/twice-theta, JacobianChallengePartII:JC3/poincare-diagonal, JacobianChallengePartII:JC1/jacobian-base-change.

Source: yuan Definition2.4 p.30.

Acceptance:

- Retain the displayed hypotheses and functorial identifications under every base change; verify morphism identities on all test schemes, including nonreduced ones.

### Symmetry of twice-theta

Declaration: JacobianChallengePartII:JC3/twice-theta-symmetric.

[-1]*Θ_X≅Θ_X as zero-rigidified bundles over S, not merely on geometric fibres.

Hypotheses: Unless narrowed explicitly, S is noetherian and π:X→S is smooth projective of relative dimension one, with geometrically connected fibres of constant genus g>0. Disconnected bases are handled componentwise. Picard objects are fppf sheaves; all equalities of bundles mean isomorphism classes unless a rigidification is specified.

Construction or proof:

- Use simultaneous inversion invariance of the normalized biextension P.
- Pull the rigidified identity through Δ_J and dualization.

Inputs: JacobianChallengePartII:JC3/twice-theta, JacobianChallengePartII:JC3/jacobian-poincare, AbelianSchemesAndArithmeticModuli:A2.

Source: yuan Definition2.4 p.30.

Acceptance:

- Retain the displayed hypotheses and functorial identifications under every base change; verify morphism identities on all test schemes, including nonreduced ones.

### Zero rigidification of twice-theta

Declaration: JacobianChallengePartII:JC3/twice-theta-zero-rigidified.

The zero-axis trivializations of P induce e*Θ_X≅O_S, compatible with base change.

Hypotheses: Unless narrowed explicitly, S is noetherian and π:X→S is smooth projective of relative dimension one, with geometrically connected fibres of constant genus g>0. Disconnected bases are handled componentwise. Picard objects are fppf sheaves; all equalities of bundles mean isomorphism classes unless a rigidification is specified.

Construction or proof:

- Factor the zero diagonal through either zero axis.
- Dualize the trivialization and check the agreement at the unit.

Inputs: JacobianChallengePartII:JC3/twice-theta, JacobianChallengePartII:JC3/jacobian-poincare.

Source: yuan Definition2.4 p.30.

Acceptance:

- Retain the displayed hypotheses and functorial identifications under every base change; verify morphism identities on all test schemes, including nonreduced ones.

### Relative ampleness of twice-theta

Declaration: JacobianChallengePartII:JC3/twice-theta-relatively-ample.

Θ_X is relatively ample for J→S; hence J→S is projective. The proof uses properness and the fibrewise ampleness criterion over noetherian S.

Hypotheses: Unless narrowed explicitly, S is noetherian and π:X→S is smooth projective of relative dimension one, with geometrically connected fibres of constant genus g>0. Disconnected bases are handled componentwise. Picard objects are fppf sheaves; all equalities of bundles mean isomorphism classes unless a rigidification is specified.

Construction or proof:

- Twice the principal theta class is ample on every geometric fibre.
- Apply the relative ampleness criterion for an actual invertible sheaf on a proper finitely presented morphism; algebraic equivalence preserves ampleness on these fibres.

Inputs: JacobianChallengePartII:JC3/geometric-twice-theta, JacobianChallengePartII:JC1/jacobian-proper, AbelianSchemesAndArithmeticModuli:A2, AlgebraicModuliForArithmeticGeometry:R09.2.

Source: yuan Definition2.4 p.30.

Acceptance:

- Retain the displayed hypotheses and functorial identifications under every base change; verify morphism identities on all test schemes, including nonreduced ones.

Coverage: planned. Remaining refinements:

- Algebraic equivalence of geometric-fibre line classes: Verify the exact algebraic-equivalence definition used for projective geometric fibres, its tensor/inverse/pullback closure, and its comparison with the identity component of the represented Picard functor. Curve degree zero and abelian Picard duality supply the relevant specialization tests, but neither is a generic definition for arbitrary projective flat Y/S. This is a recorded boundary of the actual Picard subgroup and its two-projection version, rather than an assumed baseline predicate.
- Poincaré sign and normalized seesaw: Compare the A2 supplier’s convention for φ_L with Yuan’s negative addition formula on all test schemes. Prove the corresponding rigidified-bundle identity, including the fibre-at-zero normalization when a canonical map is claimed.
- Translated theta pullback calculation: Yuan TheoremA.3 and its proof pp.110–111 were read. The auxiliary Serre §5.6 equations on pp.74–76 were not obtained. Verify the translated theta formula for arbitrary degree-one divisor α, not just a point or a canonical root.
- Arbitrary-alpha curve-square computation: Yuan notes that Serre’s formula assumes(2g−2)α=ω but says an extra computation removes it. Supply that computation or a full normalized Poincaré universal-property proof over the given field. Do not add the canonical-root hypothesis to the routed target.
- Cube recurrence in the theta doubling formula: The source cites Serre p.33 for [2]*L=3L+[-1]*L. Read the exact recurrence proof and discharge it through A1; no symmetric-theta assumption is allowed.
- Resolve supplier tauceti:TauCetiRoadmap/JacobianChallenge#layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality: Curve Riemann–Roch, canonical degree2g−2 and Serre duality; their stable relative duality extension is required for the explicitly nodal Hodge comparison.
- Resolve supplier tauceti:TauCetiRoadmap/JacobianChallenge#layer-e-abelian-varieties: Field Jacobian tangent dimension, classical theta polarization and theta Cartier-divisor construction; no relative extension is silently assumed.
- Resolve supplier tauceti:TauCetiRoadmap/JacobianChallenge#layer-f-abeljacobi-and-the-universal-property: Pointed field Abel–Jacobi universal property and its pullback autoduality characterization; the relative pointed closed-immersion bridge is a gap in this packet.
- Resolve supplier AbelianSchemesAndArithmeticModuli:A1: Abelian schemes, translations, rigidity over nonreduced bases, fibre powers, theorem of the square/cube, and homomorphism descent.
- Resolve supplier AbelianSchemesAndArithmeticModuli:A2: Dual abelian schemes, normalized Poincaré bundle, biduality, Pic⁰ translation invariance, polarization sign convention and normalized seesaw on products.
- Resolve supplier AlgebraicModuliForArithmeticGeometry:R09.2: Relative Hilbert/Div representability, the projective relative-curve Picard quotient infrastructure and the proper-family fibrewise ampleness criterion; parameter-space flatness must not be inferred from universal-family flatness.
- Replace the exact prototype omissions for this stage when the imported geometric interfaces can express them; compile the complete geometric signatures without surrogate predicates.

## JC4. Actual Picard groups and descent

Unless narrowed explicitly, S is noetherian and π:X→S is smooth projective of relative dimension one, with geometrically connected fibres of constant genus g>0. Disconnected bases are handled componentwise. Picard objects are fppf sheaves; all equalities of bundles mean isomorphism classes unless a rigidification is specified.

Dependencies: AbelianSchemesAndArithmeticModuli:A2, AlgebraicModuliForArithmeticGeometry:A0-extension, JacobianChallengePartII:JC1, JacobianChallengePartII:JC2, tauceti:TauCetiRoadmap/JacobianChallenge#layer-a-line-bundles-divisors-picard-group-degree, tauceti:TauCetiRoadmap/JacobianChallenge#layer-c-relative-coherent-cohomology-and-base-change, tauceti:TauCetiRoadmap/JacobianChallenge#layer-f-abeljacobi-and-the-universal-property.

### Actual fibrewise Picard subgroup

Declaration: JacobianChallengePartII:JC4/actual-picard-zero.

For a projective flat Y→S, Pic⁰(Y/S) is the subgroup of the actual Pic(Y) formed by line-bundle classes algebraically trivial on every geometric fibre. It is not Pic⁰_{Y/S}(S); comparison to that sheaf group requires a separate obstruction statement.

Hypotheses: Unless narrowed explicitly, S is noetherian and π:X→S is smooth projective of relative dimension one, with geometrically connected fibres of constant genus g>0. Disconnected bases are handled componentwise. Picard objects are fppf sheaves; all equalities of bundles mean isomorphism classes unless a rigidification is specified.

Construction or proof:

- Define the subgroup by the fibre algebraic-triviality predicate.
- Use tensor, dual and pullback stability of algebraic equivalence.

Inputs: tauceti:TauCetiRoadmap/JacobianChallenge#layer-a-line-bundles-divisors-picard-group-degree, AlgebraicModuliForArithmeticGeometry:A0-extension/relative-picard-sheaf, AbelianSchemesAndArithmeticModuli:A2.

Source: yuan Proposition2.6 proof p.31.

API:

- RelativeJacobian.ActualPicardZero.mem (characterisation): Membership means algebraic triviality on every geometric fibre, not degree zero for higher-dimensional Y.
- RelativeJacobian.ActualPicardZero.pullback (functoriality): An S-morphism Y′→Y pulls these actual classes to fibrewise algebraically trivial classes.
- RelativeJacobian.ActualPicardZero.relativeClass (compatibility): The class map lands in Pic⁰_{Y/S}(S), with kernel the base classes under universal global-functions hypotheses.

Unit tests:

- RelativeJacobian.ActualPicardZero.test_base (degenerate): For Y=S, every class in Pic(S) belongs to this subgroup.
- RelativeJacobian.ActualPicardZero.test_curve (compatibility): For a smooth projective curve over a field, membership is equivalent to degree0.
- RelativeJacobian.ActualPicardZero.test_brauer (non-example): An obstructed point of the relative Picard sheaf is not an actual line-bundle class in this subgroup.

Uses:

- Yuan Proposition2.6: The actual pullback cokernel needed before choosing metrics.
- Yuan §A.3: Distinguishes axis-normalized actual bundles from sheaf points.

Acceptance:

- Retain the displayed hypotheses and functorial identifications under every base change; verify morphism identities on all test schemes, including nonreduced ones.

### Picard subgroup along both projections

Declaration: JacobianChallengePartII:JC4/actual-picard-bizero.

For projective flat Y₁,Y₂ over S, Pic⁰⁰(Y₁×_S Y₂) consists of actual line classes whose restrictions to every geometric fibre of each projection to Y₁ and to Y₂ are algebraically trivial.

Hypotheses: Unless narrowed explicitly, S is noetherian and π:X→S is smooth projective of relative dimension one, with geometrically connected fibres of constant genus g>0. Disconnected bases are handled componentwise. Picard objects are fppf sheaves; all equalities of bundles mean isomorphism classes unless a rigidification is specified.

Construction or proof:

- Intersect the two fibrewise algebraic-triviality subgroups.
- Check that tensor and inverse preserve both conditions.

Inputs: JacobianChallengePartII:JC4/actual-picard-zero, tauceti:TauCetiRoadmap/JacobianChallenge#layer-a-line-bundles-divisors-picard-group-degree.

Source: yuan Proposition2.6 proof pp.31–32.

API:

- RelativeJacobian.ActualPicardBizero.mem (characterisation): Both projection-fibre conditions are required.
- RelativeJacobian.ActualPicardBizero.pullback (functoriality): Products of S-morphisms preserve the two fibre conditions.
- RelativeJacobian.ActualPicardBizero.baseTwist (structure): Classes pulled from S lie in Pic⁰⁰; they are not quotiented out of the definition.

Unit tests:

- RelativeJacobian.ActualPicardBizero.test_trivial (degenerate): The structure sheaf and every base pullback lie in Pic⁰⁰.
- RelativeJacobian.ActualPicardBizero.test_oneAxis (non-example): On C×C, p₁*L of positive degree fails one projection condition, despite being trivial along the other projection fibres.
- RelativeJacobian.ActualPicardBizero.test_poincare (compatibility): A normalized Poincaré bundle on J×J belongs to Pic⁰⁰ because its restrictions are degree-zero Picard classes.

Uses:

- Yuan Proposition2.6: Controls simultaneous pullback from J×J to X×X.

Acceptance:

- Retain the displayed hypotheses and functorial identifications under every base change; verify morphism identities on all test schemes, including nonreduced ones.

### Relative curve autoduality

Declaration: JacobianChallengePartII:JC4/relative-autoduality-pullback.

There is a canonical base-change-compatible identification u:Pic⁰_{J/S}≅Pic⁰_{X/S} such that, for the actual degree-d α, i_α*= [d]∘u as morphisms of fppf group sheaves. The sign of u is characterized by degree-one Abel pullback.

Hypotheses: Unless narrowed explicitly, S is noetherian and π:X→S is smooth projective of relative dimension one, with geometrically connected fibres of constant genus g>0. Disconnected bases are handled componentwise. Picard objects are fppf sheaves; all equalities of bundles mean isomorphism classes unless a rigidification is specified.

Construction or proof:

- Over a cover with a section use the parent Abel pullback autoduality.
- Translation has trivial pullback action on Pic⁰ of an abelian scheme.
- Use the degree-d factorization and dual multiplication.
- Descend the natural identity on all T-points; an equality on geometric fibres is not used as a proof over nilpotent bases.

Inputs: JacobianChallengePartII:JC1/relative-jacobian, JacobianChallengePartII:JC1/principal-polarization, JacobianChallengePartII:JC2/degree-abel-map, tauceti:TauCetiRoadmap/JacobianChallenge#layer-f-abeljacobi-and-the-universal-property, AbelianSchemesAndArithmeticModuli:A2.

Source: yuan Proposition2.6 proof p.31.

Acceptance:

- For d=0 this morphism is zero.
- For d=−1 it is −u.

### Actual Picard classes and the Brauer obstruction

Declaration: JacobianChallengePartII:JC4/actual-to-relative-obstruction.

For proper flat Y/S with O_S≅f_*O_Y universally, 0→Pic(S)→Pic(Y)→Pic_{Y/S}(S)→Br(S)→Br(Y) is exact. For J/S its identity section kills the obstruction, so Pic⁰(J/S)/Pic(S)≅Pic⁰_{J/S}(S). For X/S the same map is only injective without a section.

Hypotheses: Unless narrowed explicitly, S is noetherian and π:X→S is smooth projective of relative dimension one, with geometrically connected fibres of constant genus g>0. Disconnected bases are handled componentwise. Picard objects are fppf sheaves; all equalities of bundles mean isomorphism classes unless a rigidification is specified.

Construction or proof:

- Apply BLR’s Leray low-degree sequence in the fppf topology under the universal global-functions hypothesis.
- Restrict to the algebraically trivial components.
- Use the identity section of J for surjectivity; do not use it as a section of X.

Inputs: AlgebraicModuliForArithmeticGeometry:A0-extension/relative-picard-kernel, AlgebraicModuliForArithmeticGeometry:A0-extension/section-picard-split, JacobianChallengePartII:JC4/actual-picard-zero, JacobianChallengePartII:JC1/relative-jacobian, tauceti:TauCetiRoadmap/JacobianChallenge#layer-c-relative-coherent-cohomology-and-base-change.

Source: blr §8.1 Proposition4 pp.203–205.

Acceptance:

- For a sectionless genus-one curve a relative class may have nonzero Brauer obstruction.

### Actual Picard pullback torsion cokernel

Declaration: JacobianChallengePartII:JC4/actual-pullback-torsion-cokernel.

Let S be a normal integral quasi-projective scheme flat over ℤ or over a field, and let α have relative degree d>0. Every L∈Pic⁰(X/S) has a positive tensor power in the image of i_α*:Pic⁰(J/S)→Pic⁰(X/S). In particular the cokernel is a torsion group. No integral surjectivity is asserted.

Hypotheses: Unless narrowed explicitly, S is noetherian and π:X→S is smooth projective of relative dimension one, with geometrically connected fibres of constant genus g>0. Disconnected bases are handled componentwise. Picard objects are fppf sheaves; all equalities of bundles mean isomorphism classes unless a rigidification is specified.

Construction or proof:

- View the class of L in Pic⁰_{X/S}(S).
- Use u⁻¹ to obtain a relative class on J, and the identity section to represent it by an actual M.
- The relative equality i_α*[M]=d[L] says that i_α*M−dL is a base pullback.
- Absorb this base pullback in M using J→S, proving the actual-class statement, with the necessary global-functions and fibre-triviality checks.

Inputs: JacobianChallengePartII:JC4/relative-autoduality-pullback, JacobianChallengePartII:JC4/actual-to-relative-obstruction, JacobianChallengePartII:JC4/actual-picard-zero.

Source: yuan Proposition2.6 proof p.31.

Acceptance:

- For d=1 the argument gives surjectivity under the stated comparison hypotheses.
- For d>1, torsion cokernel does not mean [d] is surjective on S-points.

### Lift preserving both fibre conditions

Declaration: JacobianChallengePartII:JC4/bizero-lift-one-factor.

In the arithmetic normal-base scope and for positive-degree i_α, every Pic⁰⁰ class on X×_S X has a positive power lifted through id_X×i_α to a class on X×_S J lying in Pic⁰⁰. The corresponding assertion through i_α×id_J lifts Pic⁰⁰(X×J) to Pic⁰⁰(J×J).

Hypotheses: Unless narrowed explicitly, S is noetherian and π:X→S is smooth projective of relative dimension one, with geometrically connected fibres of constant genus g>0. Disconnected bases are handled componentwise. Picard objects are fppf sheaves; all equalities of bundles mean isomorphism classes unless a rigidification is specified.

Construction or proof:

- Apply the actual Picard pullback statement to the curve after base change to the other factor.
- Check that the lift retains algebraic triviality along the second projection, correcting any base pullback.
- The second condition is a separate lifting obligation; a surjection on unrestricted Pic⁰ groups does not imply it.

Inputs: JacobianChallengePartII:JC4/actual-pullback-torsion-cokernel, JacobianChallengePartII:JC4/actual-picard-bizero, JacobianChallengePartII:JC1/jacobian-base-change, AbelianSchemesAndArithmeticModuli:A2.

Source: yuan Proposition2.6 proof pp.31–32.

Acceptance:

- A lift that acquires a positive-degree restriction on the other axis fails this lemma.

### Bi-Picard pullback torsion cokernel

Declaration: JacobianChallengePartII:JC4/bizero-pullback-torsion-cokernel.

Under the same S, X, α and d>0 hypotheses, (i_α,i_α)*:Pic⁰⁰(J×_S J)→Pic⁰⁰(X×_S X) has torsion cokernel.

Hypotheses: Unless narrowed explicitly, S is noetherian and π:X→S is smooth projective of relative dimension one, with geometrically connected fibres of constant genus g>0. Disconnected bases are handled componentwise. Picard objects are fppf sheaves; all equalities of bundles mean isomorphism classes unless a rigidification is specified.

Construction or proof:

- Factor the pullback through X×_S J.
- Use the two one-factor lifting assertions and multiply their class-dependent exponents.
- Do not assume a uniform exponent without verifying its separate proof.

Inputs: JacobianChallengePartII:JC4/bizero-lift-one-factor, JacobianChallengePartII:JC4/actual-picard-bizero.

Source: yuan Proposition2.6 proof pp.31–32.

Acceptance:

- Retain the displayed hypotheses and functorial identifications under every base change; verify morphism identities on all test schemes, including nonreduced ones.

### Axis-normalized Picard subgroup

Declaration: JacobianChallengePartII:JC4/axis-normalized-picard.

Over a field K, with a rational x₀∈C(K), Pic⁻(C²) is the subgroup of actual Pic(C²) whose restrictions to C×{x₀} and {x₀}×C are trivial; Pic⁻(J²) uses the two zero axes. These are classes with trivial restrictions, not chosen rigidifications and not the larger Pic⁰⁰ subgroup.

Hypotheses: K is a field; C/K is smooth projective geometrically connected of genus>0; x₀∈C(K). The routed application additionally assumes K complete nontrivially nonarchimedean.

Construction or proof:

- Take the intersection of the kernels of the two actual restriction maps.
- Retain the distinction between existence of a trivialization and a specified trivialization.

Inputs: JacobianChallengePartII:JC4/actual-picard-zero, JacobianChallengePartII:JC4/actual-picard-bizero, tauceti:TauCetiRoadmap/JacobianChallenge#layer-a-line-bundles-divisors-picard-group-degree.

Source: yuan §A.3 p.109.

API:

- RelativeJacobian.AxisNormalizedPicard.mem (characterisation): Both actual axis restrictions have the trivial Picard class.
- RelativeJacobian.AxisNormalizedPicard.pullback (functoriality): Pointed product morphisms pull back axis-normalized classes.
- RelativeJacobian.AxisNormalizedPicard.biextension (compatibility): The normalized Poincaré class belongs to Pic⁻(J²), with an additional rigidification available from its construction.

Unit tests:

- RelativeJacobian.AxisNormalizedPicard.test_unit (degenerate): The trivial line class lies in Pic⁻.
- RelativeJacobian.AxisNormalizedPicard.test_positiveBase (non-example): On C², p₁*L for a nontrivial degree-zero L fails one axis restriction despite belonging to Pic⁰⁰.
- RelativeJacobian.AxisNormalizedPicard.test_elliptic (compatibility): With C=J an elliptic curve and x₀=0 the two axis-normalized groups are literally the same.

Uses:

- Yuan §A.3: Transfers actual square line bundles along pointed Abel pullback.

Acceptance:

- Retain the displayed hypotheses and functorial identifications under every base change; verify morphism identities on all test schemes, including nonreduced ones.

### Pointed square Picard comparison

Declaration: JacobianChallengePartII:JC4/pointed-square-picard-isomorphism.

With x₀ as above and i=i_{O(x₀)}, (i,i)*:Pic⁻(J²)→Pic⁻(C²) is an isomorphism. The application over complete nonarchimedean K uses only this algebraic assertion here; its metrics belong to the Arakelov owner.

Hypotheses: Unless narrowed explicitly, S is noetherian and π:X→S is smooth projective of relative dimension one, with geometrically connected fibres of constant genus g>0. Disconnected bases are handled componentwise. Picard objects are fppf sheaves; all equalities of bundles mean isomorphism classes unless a rigidification is specified.

Construction or proof:

- Identify an axis-normalized line class with its pointed Picard-valued family.
- Use the parent Albanese universal property to extend it uniquely from C to J in each variable.
- Apply normalized seesaw to recover the original actual class; Zhang’s three auxiliary lemmas remain a source gap.

Inputs: JacobianChallengePartII:JC4/axis-normalized-picard, JacobianChallengePartII:JC2/degree-abel-map, tauceti:TauCetiRoadmap/JacobianChallenge#layer-f-abeljacobi-and-the-universal-property, AbelianSchemesAndArithmeticModuli:A2, JacobianChallengePartII:JC4/relative-autoduality-pullback.

Source: yuan §A.3 p.109, citing Zhang Lemmas2.2.1–2.2.3.

Acceptance:

- For C elliptic and x₀ its identity the map is the identity.
- The rational point x₀ is required; this statement does not choose a rational point on an arbitrary curve.

Coverage: planned. Remaining refinements:

- Algebraic equivalence of geometric-fibre line classes: Verify the exact algebraic-equivalence definition used for projective geometric fibres, its tensor/inverse/pullback closure, and its comparison with the identity component of the represented Picard functor. Curve degree zero and abelian Picard duality supply the relevant specialization tests, but neither is a generic definition for arbitrary projective flat Y/S. This is a recorded boundary of the actual Picard subgroup and its two-projection version, rather than an assumed baseline predicate.
- Relative autoduality over nonreduced bases: BLR8.1/4 has now been read exactly, removing the formerly unverified Leray-sequence source boundary. The remaining issue is the construction/descent of u and the equality i_α*=[d]∘u on all test schemes. Yuan’s fibrewise sentence is a lead, not a valid general nilpotent-base proof.
- Bi-Picard lifting retains the other projection condition: Proposition2.6’s two pullback factorizations were read, but the chosen lifts must remain algebraically trivial on every geometric fibre of the other projection. Verify this using relative autoduality/normalized seesaw, with correction of any base line; unrestricted Pic⁰ torsion cokernels alone do not prove the Pic⁰⁰ statement.
- Axis-normalized square comparison proof: The rational point and the exact two axis conditions in Yuan §A.3 p.109 were read. Obtain and inspect Zhang Lemmas2.2.1–2.2.3 cited there, or give the full Picard-family currying plus Albanese/seesaw argument. The target is an isomorphism of actual groups over K, not a rationalized or geometric-point comparison.
- Resolve supplier tauceti:TauCetiRoadmap/JacobianChallenge#layer-a-line-bundles-divisors-picard-group-degree: Picard group of actual invertible sheaves with duals, pullback and divisor-to-line-bundle comparison; line-bundle fibre degree agrees with weighted scheme-divisor degree.
- Resolve supplier tauceti:TauCetiRoadmap/JacobianChallenge#layer-c-relative-coherent-cohomology-and-base-change: Proper-flat curve cohomology and arbitrary base-change comparisons, relative effective Cartier sections and diagonals, symmetric-power representability with universal relative divisors.
- Resolve supplier tauceti:TauCetiRoadmap/JacobianChallenge#layer-f-abeljacobi-and-the-universal-property: Pointed field Abel–Jacobi universal property and its pullback autoduality characterization; the relative pointed closed-immersion bridge is a gap in this packet.
- Resolve supplier AbelianSchemesAndArithmeticModuli:A2: Dual abelian schemes, normalized Poincaré bundle, biduality, Pic⁰ translation invariance, polarization sign convention and normalized seesaw on products.
- Replace the exact prototype omissions for this stage when the imported geometric interfaces can express them; compile the complete geometric signatures without surrogate predicates.

## JC5. Faltings–Zhang and canonical shifts

Unless narrowed explicitly, S is noetherian and π:X→S is smooth projective of relative dimension one, with geometrically connected fibres of constant genus g>0. Disconnected bases are handled componentwise. Picard objects are fppf sheaves; all equalities of bundles mean isomorphism classes unless a rigidification is specified.

Dependencies: AbelianSchemesAndArithmeticModuli:A1, AbelianSchemesAndArithmeticModuli:A3, JacobianChallengePartII:JC2, tauceti:TauCetiRoadmap/JacobianChallenge#layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality, tauceti:TauCetiRoadmap/JacobianChallenge#layer-c-relative-coherent-cohomology-and-base-change.

### Canonical-bundle Abel morphism

Declaration: JacobianChallengePartII:JC5/canonical-abel-map.

For g>1, ω_{X/S} has relative degree 2g−2, so i_ω(x)=[(2g−2)Γ_x−ω_{X/S}] is a finite S-morphism X→J.

Hypotheses: Unless narrowed explicitly, S is noetherian and π:X→S is smooth projective of relative dimension one, with geometrically connected fibres of constant genus g>0. Disconnected bases are handled componentwise. Picard objects are fppf sheaves; all equalities of bundles mean isomorphism classes unless a rigidification is specified.

Construction or proof:

- Use the fibre canonical degree and dualizing base change.
- Apply the nonzero-degree finiteness theorem.

Inputs: JacobianChallengePartII:JC2/degree-abel-map, JacobianChallengePartII:JC2/nonzero-degree-finite, tauceti:TauCetiRoadmap/JacobianChallenge#layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality, tauceti:TauCetiRoadmap/JacobianChallenge#layer-c-relative-coherent-cohomology-and-base-change.

Source: yuan Theorem2.10(1) p.37.

Acceptance:

- Retain the displayed hypotheses and functorial identifications under every base change; verify morphism identities on all test schemes, including nonreduced ones.

### Universal shifted canonical morphism

Declaration: JacobianChallengePartII:JC5/universal-shift.

For g>1, τ:J×_S X→J×_S J is (y,x)↦(y,y+i_ω(x)); it is a morphism over the first J-factor and has no global-section hypothesis.

Hypotheses: Unless narrowed explicitly, S is noetherian and π:X→S is smooth projective of relative dimension one, with geometrically connected fibres of constant genus g>0. Disconnected bases are handled componentwise. Picard objects are fppf sheaves; all equalities of bundles mean isomorphism classes unless a rigidification is specified.

Construction or proof:

- Take id_J×i_ω and apply addition in the second J coordinate.
- Verify the first projection is unchanged.

Inputs: JacobianChallengePartII:JC5/canonical-abel-map, AbelianSchemesAndArithmeticModuli:A1.

Source: yuan Theorem2.10(3) p.37.

API:

- RelativeJacobian.UniversalShift.value (simp): τ(y,x)=(y,y+(2g−2)[x]−ω).
- RelativeJacobian.UniversalShift.overJ (structure): q₁∘τ=p₁.
- RelativeJacobian.UniversalShift.baseChange (functoriality): τ commutes with arbitrary T→S.

Unit tests:

- RelativeJacobian.UniversalShift.test_zeroShift (computation): τ(0,x)=(0,i_ω(x)).
- RelativeJacobian.UniversalShift.test_genusOne (non-example): The asserted finite canonical Abel map uses g>1; in genus1 its degree is0 and it is constant.
- RelativeJacobian.UniversalShift.test_firstCoordinate (characterisation): Changing x leaves the first coordinate y fixed on every test scheme.

Uses:

- Yuan Theorem2.10(3): The family morphism over J used before taking pairings.
- Yuan Theorem4.17(3),(5): Creates canonical shifted fibre powers.

Acceptance:

- Retain the displayed hypotheses and functorial identifications under every base change; verify morphism identities on all test schemes, including nonreduced ones.

### Faltings–Zhang morphism

Declaration: JacobianChallengePartII:JC5/faltings-zhang.

For m≥1, FZ_m:X^{m+1}_S→J^m_S sends (x₀,…,x_m) to (j(x₀,x₁),…,j(x₀,x_m)). It is defined without a section and without a maximal-variation hypothesis.

Hypotheses: Unless narrowed explicitly, S is noetherian and π:X→S is smooth projective of relative dimension one, with geometrically connected fibres of constant genus g>0. Disconnected bases are handled componentwise. Picard objects are fppf sheaves; all equalities of bundles mean isomorphism classes unless a rigidification is specified.

Construction or proof:

- Use the actual fibre-power projections and form each difference coordinate.
- Use the product universal property to assemble the morphism.
- Check base change through the fibre-power comparisons.

Inputs: JacobianChallengePartII:JC2/curve-difference, AbelianSchemesAndArithmeticModuli:A1.

Source: yuan §4.6.2 Theorem4.17 pp.98–99; DGH §6.1 pp.24–25.

API:

- RelativeJacobian.FaltingsZhang.coordinate (simp): The r-th coordinate is [x_r]−[x₀], for 1≤r≤m.
- RelativeJacobian.FaltingsZhang.baseChange (functoriality): The morphism pulls back to FZ_m of X_T/T.
- RelativeJacobian.FaltingsZhang.pointed (compatibility): Fixing x₀=P₀ on a fibre gives the m-fold product of the pointed Abel embedding C−P₀.

Unit tests:

- RelativeJacobian.FaltingsZhang.test_one (computation): FZ₁(x₀,x₁)=j(x₀,x₁).
- RelativeJacobian.FaltingsZhang.test_diagonal (degenerate): The small diagonal maps to the zero tuple.
- RelativeJacobian.FaltingsZhang.test_originChange (characterisation): With any degree-one α, all coordinates equal i_α(x_r)−i_α(x₀), independent of α.

Uses:

- DGH §6.1: Constructs the universal difference family.
- Yuan Theorem4.17(4): The algebraic input to nondegeneracy; the nondegeneracy theorem is an external consumer.

Acceptance:

- Retain the displayed hypotheses and functorial identifications under every base change; verify morphism identities on all test schemes, including nonreduced ones.

### Shifted Faltings–Zhang morphism

Declaration: JacobianChallengePartII:JC5/shifted-faltings-zhang.

For g>1 and m≥1, τ_m:X^m_S×_S J→J^m_S sends (x₁,…,x_m,y) to (i_ω(x₁)+y,j(x₁,x₂),…,j(x₁,x_m)). The source order, first shift and unscaled remaining differences are part of the definition.

Hypotheses: Unless narrowed explicitly, S is noetherian and π:X→S is smooth projective of relative dimension one, with geometrically connected fibres of constant genus g>0. Disconnected bases are handled componentwise. Picard objects are fppf sheaves; all equalities of bundles mean isomorphism classes unless a rigidification is specified.

Construction or proof:

- Assemble the first coordinate from addition and i_ω.
- Assemble the remaining coordinates from j and use the product universal property.

Inputs: JacobianChallengePartII:JC5/universal-shift, JacobianChallengePartII:JC5/faltings-zhang, JacobianChallengePartII:JC2/curve-difference.

Source: yuan §4.6.2 pp.98–99.

API:

- RelativeJacobian.ShiftedFaltingsZhang.first (simp): The first coordinate is (2g−2)[x₁]−ω+y.
- RelativeJacobian.ShiftedFaltingsZhang.tail (simp): Coordinate r>1 is [x_r]−[x₁], with no factor 2g−2.
- RelativeJacobian.ShiftedFaltingsZhang.baseChange (functoriality): The shifted morphism commutes with T→S.

Unit tests:

- RelativeJacobian.ShiftedFaltingsZhang.test_one (degenerate): For m=1 the map is i_ω(x₁)+y; there is no tail coordinate.
- RelativeJacobian.ShiftedFaltingsZhang.test_sign (computation): For m=2 the second coordinate is x₂−x₁, not x₁−x₂.
- RelativeJacobian.ShiftedFaltingsZhang.test_diagonal (characterisation): If all x_r=x₁, every tail coordinate is0 and the first remains i_ω(x₁)+y.

Uses:

- Yuan Theorem4.17(5): Uses the triangular coordinate change from the universal shifted Abel powers.

Acceptance:

- Retain the displayed hypotheses and functorial identifications under every base change; verify morphism identities on all test schemes, including nonreduced ones.

### Triangular change on represented points

Declaration: JacobianChallengePartII:JC5/triangular-coordinate-equivalence.

For any scheme S, any group object A of Over(S), any T∈Over(S), and n≥0, there is a natural equivalence of (n+1)-tuples of T-valued points of A: R(q)₀=q₀, R(q)_r=q_r q₀⁻¹ for r≠0. Its inverse sends r to (r₀,r₁r₀,…,r_nr₀). Multiplicative notation is Mathlib’s notation for group objects; on the Jacobian it means subtraction and addition. The construction uses actual morphisms T→A, not an abstract point-set replacement for A.

Hypotheses: S is a scheme, A is a group object in Over(S), T is an object of Over(S), n is a natural number. Commutativity is not needed for this equivalence.

Construction or proof:

- Define the two coordinate operations on the native Hom group.
- Use group cancellation to check both inverse composites.
- Precomposition preserves products and inverses, so the equivalence is natural in every test scheme.

Inputs: mathlib:CategoryTheory.Hom.group, mathlib:CategoryTheory.GrpObj.comp_div.

Source: yuan proof of Theorem4.17(5), p.99.

API:

- RelativeJacobian.TriangularCoordinateEquivalence.first (simp): R(q)₀=q₀.
- RelativeJacobian.TriangularCoordinateEquivalence.tail (simp): R(q)_r=q_r/q₀ for r≠0.
- RelativeJacobian.TriangularCoordinateEquivalence.inverse (characterisation): R⁻¹(r)_i is r₀ for i=0 and r_i*r₀ otherwise.
- RelativeJacobian.TriangularCoordinateEquivalence.natural (functoriality): For h:U→T, R(i↦h∘q_i)=i↦h∘R(q)_i.

Unit tests:

- RelativeJacobian.TriangularCoordinateEquivalence.test_lengthOne (degenerate): For n=0 the equivalence on one-coordinate tuples is identity.
- RelativeJacobian.TriangularCoordinateEquivalence.test_lengthTwo (computation): R⁻¹ applied to the pair (f,g/f) is the pair (f,g) of actual T-valued points.
- RelativeJacobian.TriangularCoordinateEquivalence.test_constant (computation): A constant tuple f transforms to f in coordinate0 and the identity point in every tail coordinate.

Uses:

- Yuan proof Theorem4.17(5) p.99: Removes the common first coordinate from the shifted canonical tuple before the tail isogeny.

Acceptance:

- Retain the displayed hypotheses and functorial identifications under every base change; verify morphism identities on all test schemes, including nonreduced ones.

### Shifted-power factorization

Declaration: JacobianChallengePartII:JC5/shifted-power-factorization.

Let B_m(x₁,…,x_m,y)=(i_ω(x₁)+y,…,i_ω(x_m)+y). After the triangular change R on J^m, R∘B_m=D∘τ_m, where D fixes the first coordinate and multiplies each tail by 2g−2. This equality holds as S-morphisms; D is a finite locally free isogeny for g>1.

Hypotheses: Unless narrowed explicitly, S is noetherian and π:X→S is smooth projective of relative dimension one, with geometrically connected fibres of constant genus g>0. Disconnected bases are handled componentwise. Picard objects are fppf sheaves; all equalities of bundles mean isomorphism classes unless a rigidification is specified.

Construction or proof:

- Evaluate the triangular map on every test scheme.
- Subtract the common first coordinate: i_ω(x_r)−i_ω(x₁)=(2g−2)j(x₁,x_r).
- Apply the nonzero multiplication theorem to the tail factors.
- Do not identify τ_m itself with the tuple of all shifted canonical Abel coordinates.

Inputs: JacobianChallengePartII:JC5/triangular-coordinate-equivalence, JacobianChallengePartII:JC5/shifted-faltings-zhang, JacobianChallengePartII:JC2/degree-abel-map, AbelianSchemesAndArithmeticModuli:A3.

Source: yuan proof Theorem4.17(5) p.99.

Acceptance:

- For m=1 D is identity.
- In characteristic dividing 2g−2, D is finite but need not be étale.

Coverage: planned. Remaining refinements:

- Resolve supplier tauceti:TauCetiRoadmap/JacobianChallenge#layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality: Curve Riemann–Roch, canonical degree2g−2 and Serre duality; their stable relative duality extension is required for the explicitly nodal Hodge comparison.
- Resolve supplier AbelianSchemesAndArithmeticModuli:A1: Abelian schemes, translations, rigidity over nonreduced bases, fibre powers, theorem of the square/cube, and homomorphism descent.
- Resolve supplier AbelianSchemesAndArithmeticModuli:A3: For every nonzero integer d, multiplication[d] on an abelian scheme is finite locally free, with scheme-theoretic torsion and Weil pairing; no invertibility of d in the base is needed for finiteness.
- Replace the exact prototype omissions for this stage when the imported geometric interfaces can express them; compile the complete geometric signatures without surrogate predicates.

## JC6. Stable curve–Jacobian Hodge comparison

Unless narrowed explicitly, S is noetherian and π:X→S is smooth projective of relative dimension one, with geometrically connected fibres of constant genus g>0. Disconnected bases are handled componentwise. Picard objects are fppf sheaves; all equalities of bundles mean isomorphism classes unless a rigidification is specified.

Dependencies: NeronModelsAndSemistableAbelianVarieties:R11.4, tauceti:TauCetiRoadmap/JacobianChallenge#layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality, tauceti:TauCetiRoadmap/JacobianChallenge#layer-c-relative-coherent-cohomology-and-base-change.

### Picard Lie algebra and coherent cohomology

Declaration: JacobianChallengePartII:JC6/picard-lie-cohomology.

For an integral noetherian S and a stable connected nodal genus-g>1 family π:X→S, let G=Pic⁰_{X/S} be the smooth separated semi-abelian group supplied by Néron R11.4. There is a canonical O_S-linear isomorphism Lie(G/S)≅R¹π_*O_X, compatible with base change.

Hypotheses: Integral noetherian S; a stable connected nodal relative curve of genus g>1; the Picard-space and cohomological-flatness inputs of BLR8.4/1.

Construction or proof:

- Verify O_S≅π_*O_X universally for the stable connected reduced fibres.
- For the dual-number extension use 1+εO_X to identify the infinitesimal Picard kernel with H¹(O_X).
- Apply BLR8.4/1 to the represented Picard space and restrict to its open identity component.

Inputs: NeronModelsAndSemistableAbelianVarieties:R11.4, tauceti:TauCetiRoadmap/JacobianChallenge#layer-c-relative-coherent-cohomology-and-base-change, tauceti:TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology.

Source: blr §8.4 Theorem1 and proof pp.231–232; Yuan Lemma3.4 pp.43–44.

Acceptance:

- An irreducible one-node fibre has the Lie algebra of its semi-abelian generalized Jacobian, not of an abelian scheme.

### Curve and Jacobian Hodge bundles

Declaration: JacobianChallengePartII:JC6/curve-jacobian-hodge-bundles.

Under the hypotheses of the Picard Lie comparison, relative duality gives π_*ω_{X/S}≅e*Ω¹_{G/S}. Both are locally free of rank g and commute with the allowed base changes; the right side uses invariant differentials of the semi-abelian G.

Hypotheses: The same stable-family hypotheses as the Lie comparison; relative duality and its base-change comparison.

Construction or proof:

- Dualize the Lie/cohomology isomorphism.
- Apply relative Serre duality for the stable Gorenstein curve to identify (R¹π_*O_X)∨ with π_*ω_{X/S}.
- Identify the dual Lie sheaf with invariant differentials at e.

Inputs: JacobianChallengePartII:JC6/picard-lie-cohomology, tauceti:TauCetiRoadmap/JacobianChallenge#layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality, tauceti:TauCetiRoadmap/JacobianChallenge#layer-c-relative-coherent-cohomology-and-base-change, NeronModelsAndSemistableAbelianVarieties:R11.4.

Source: yuan Lemma3.4 and proof pp.43–44.

Acceptance:

- Retain the displayed hypotheses and functorial identifications under every base change; verify morphism identities on all test schemes, including nonreduced ones.

### Curve–Jacobian Hodge line isomorphism

Declaration: JacobianChallengePartII:JC6/hodge-line-isomorphism.

For the same stable family, λ_X:=det(π_*ω_{X/S}) is canonically isomorphic to det(e*Ω¹_{G/S}); the isomorphism is the determinant of the vector-bundle comparison and is compatible with its base-change isomorphisms.

Hypotheses: Unless narrowed explicitly, S is noetherian and π:X→S is smooth projective of relative dimension one, with geometrically connected fibres of constant genus g>0. Disconnected bases are handled componentwise. Picard objects are fppf sheaves; all equalities of bundles mean isomorphism classes unless a rigidification is specified.

Construction or proof:

- Take the determinant of the identified rank-g locally free sheaves.
- Use functoriality of determinant on the actual comparison map.
- Keep the analytic metric equality outside this algebraic roadmap.

Inputs: JacobianChallengePartII:JC6/curve-jacobian-hodge-bundles.

Source: yuan Lemma3.4 pp.43–44.

Acceptance:

- For a smooth fibre this recovers the abelian Jacobian Hodge line.
- For a one-nodal stable fibre G is semi-abelian and the determinant still has rank-g input.

Coverage: planned. Remaining refinements:

- Stable relative duality and determinant API: BLR8.4/1 pp.231–232 and Yuan Lemma3.4 pp.43–44 were read with proofs, establishing the exact Lie input hypotheses. Resolve the stable Gorenstein relative-duality and base-change maps in the parent/coherent-curve supplier, and the determinant/invariant-differential identifications on the imported semi-abelian object.
- Resolve supplier tauceti:TauCetiRoadmap/JacobianChallenge#layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality: Curve Riemann–Roch, canonical degree2g−2 and Serre duality; their stable relative duality extension is required for the explicitly nodal Hodge comparison.
- Resolve supplier tauceti:TauCetiRoadmap/JacobianChallenge#layer-c-relative-coherent-cohomology-and-base-change: Proper-flat curve cohomology and arbitrary base-change comparisons, relative effective Cartier sections and diagonals, symmetric-power representability with universal relative divisors.
- Resolve supplier NeronModelsAndSemistableAbelianVarieties:R11.4: For stable connected nodal curves, represent Pic⁰ by a smooth separated semi-abelian group, with the Picard-space identity-component comparison and invariant-differential/Lie sheaf API; no properness of this generalized Jacobian is assumed.
- Replace the exact prototype omissions for this stage when the imported geometric interfaces can express them; compile the complete geometric signatures without surrogate predicates.

## JC7. Universal curves with full level

Unless narrowed explicitly, S is noetherian and π:X→S is smooth projective of relative dimension one, with geometrically connected fibres of constant genus g>0. Disconnected bases are handled componentwise. Picard objects are fppf sheaves; all equalities of bundles mean isomorphism classes unless a rigidification is specified.

Dependencies: AbelianSchemesAndArithmeticModuli:A3, JacobianChallengePartII:JC1, JacobianChallengePartII:JC2, JacobianChallengePartII:JC5, StableReductionPartII:MC.4.

### Universal Jacobian with full level

Declaration: JacobianChallengePartII:JC7/universal-level-jacobian.

Fix g≥2, ℓ≥3 invertible on the base, and the same pairing component and cyclotomic convention as the imported fine-level curve scheme. Apply JC0–JC3 to its smooth projective universal curve: obtain Pic=⨆_d Picᵈ, the principally polarized J, its induced full symplectic level-ℓ structure, and the section-free C→Pic¹ morphism.

Hypotheses: The exact base, pairing component and level flavour of StableReductionPartII MC.4/full-level and fine-level-scheme.

Construction or proof:

- Read the full-level datum as an identification of the curve Jacobian ℓ-torsion with the fixed standard paired group.
- Apply the relative Jacobian and polarization with the same flavour of Weil pairing.
- Keep the fine-level curve scheme as a downstream application, so its existing need for curve Jacobians cannot produce an earlier-stage cycle.

Inputs: JacobianChallengePartII:JC1/relative-jacobian, JacobianChallengePartII:JC1/principal-polarization, JacobianChallengePartII:JC2/section-free-abel-map, AbelianSchemesAndArithmeticModuli:A3, StableReductionPartII:MC.4/fine-level-scheme, StableReductionPartII:MC.4/full-level.

Source: dgh §6.1 pp.23–25.

Acceptance:

- A universal family is pulled from the fine scheme, not inserted on an arbitrary coarse space.
- For ℓ noninvertible this étale full-level application is not asserted.

### Faltings–Zhang for the universal curve

Declaration: JacobianChallengePartII:JC7/universal-faltings-zhang.

For every S→M_g[ℓ] in the chosen level convention and m≥1, base change the universal curve and its Jacobian. FZ_m:C_S^{m+1}→J_S^m is a morphism over S. On a field fibre with P₀∈C(k), fixing its first coordinate gives the m-fold pointed Abel embedding C−P₀.

Hypotheses: Unless narrowed explicitly, S is noetherian and π:X→S is smooth projective of relative dimension one, with geometrically connected fibres of constant genus g>0. Disconnected bases are handled componentwise. Picard objects are fppf sheaves; all equalities of bundles mean isomorphism classes unless a rigidification is specified.

Construction or proof:

- Use the arbitrary-base-change comparisons of the generic construction.
- Apply the coordinate formula with the chosen field point only in the fibre specialization.

Inputs: JacobianChallengePartII:JC7/universal-level-jacobian, JacobianChallengePartII:JC5/faltings-zhang, JacobianChallengePartII:JC1/jacobian-base-change.

Source: dgh §6.1 equations(6.1),(6.3) pp.24–25.

Acceptance:

- Retain the displayed hypotheses and functorial identifications under every base change; verify morphism identities on all test schemes, including nonreduced ones.

Coverage: planned. Remaining refinements:

- Fine-level supplier assembly: StableReductionPartII MC.4/fine-level-scheme and full-level are exact proposed supplier nodes, but MC.4 is absent from the accepted atlas at the immutable base. Current candidate-only atlas assembly therefore retains precisely the pending MC.4→JC7 link. Verify the combined proposed supplier assembly for cycles, and integrate this edge after independent acceptance of the fine-level supplier; the generic JC0–JC5 construction must never acquire MC.4 as an input.
- Resolve supplier AbelianSchemesAndArithmeticModuli:A3: For every nonzero integer d, multiplication[d] on an abelian scheme is finite locally free, with scheme-theoretic torsion and Weil pairing; no invertibility of d in the base is needed for finiteness.
- The supplier fine-level scheme and Jacobian-torsion convention are planned input nodes, not implemented declarations; complete their independent accepted assembly.
- Replace the exact prototype omissions for this stage when the imported geometric interfaces can express them; compile the complete geometric signatures without surrogate predicates.

## Routed source coverage

| Item | Declarations |
| --- | --- |
| PAPER-YUAN-26/39 | JacobianChallengePartII:JC2/degree-abel-map |
| PAPER-YUAN-26/40 | JacobianChallengePartII:JC3/twice-theta |
| PAPER-YUAN-26/44 | JacobianChallengePartII:JC4/actual-picard-zero, JacobianChallengePartII:JC4/actual-picard-bizero |
| PAPER-YUAN-26/45 | JacobianChallengePartII:JC4/relative-autoduality-pullback |
| PAPER-YUAN-26/61 | JacobianChallengePartII:JC2/curve-difference |
| PAPER-YUAN-26/64 | JacobianChallengePartII:JC5/universal-shift |
| PAPER-YUAN-26/79 | JacobianChallengePartII:JC6/hodge-line-isomorphism |
| PAPER-YUAN-26/175 | JacobianChallengePartII:JC5/faltings-zhang |
| PAPER-YUAN-26/176 | JacobianChallengePartII:JC5/shifted-faltings-zhang |
| PAPER-YUAN-26/209 | JacobianChallengePartII:JC4/pointed-square-picard-isomorphism |
| PAPER-YUAN-26/211 | JacobianChallengePartII:JC3/theta-inverse-pullback |
| PAPER-YUAN-26/212 | JacobianChallengePartII:JC3/theta-pullback |
| PAPER-YUAN-26/213 | JacobianChallengePartII:JC3/poincare-addition-identity |
| PAPER-YUAN-26/214 | JacobianChallengePartII:JC3/poincare-curve-square |
| PAPER-YUAN-26/215 | JacobianChallengePartII:JC3/poincare-diagonal |
| PAPER-YUAN-26/242 | JacobianChallengePartII:JC2/nonzero-degree-finite |
| PAPER-YUAN-26/243 | JacobianChallengePartII:JC2/degree-one-closed-immersion |
| PAPER-YUAN-26/244 | JacobianChallengePartII:JC3/twice-theta-symmetric |
| PAPER-YUAN-26/245 | JacobianChallengePartII:JC3/twice-theta-zero-rigidified |
| PAPER-YUAN-26/246 | JacobianChallengePartII:JC3/twice-theta-relatively-ample |
| PAPER-YUAN-26/247 | JacobianChallengePartII:JC3/geometric-twice-theta |
| PAPER-YUAN-26/248 | JacobianChallengePartII:JC4/actual-pullback-torsion-cokernel |
| PAPER-YUAN-26/249 | JacobianChallengePartII:JC4/bizero-pullback-torsion-cokernel |
| PAPER-DIMITROV-GAO-HABEGGER-21/11 | JacobianChallengePartII:JC0/picard-representability, JacobianChallengePartII:JC7/universal-level-jacobian, JacobianChallengePartII:JC7/universal-faltings-zhang |

## Sources and source issue

- [Arithmetic bigness and a uniform Bogomolov-type result](http://faculty.bicmr.pku.edu.cn/~yxy/preprints/bigness_and_bogomolov.pdf), Xinyi Yuan. Author manuscript dated21 August2024,126 pages; printed page equals PDF page. The Annals203(2026) typeset text was not obtained. Read2026-10-04: §2.2.1–2.2.2 pp.29–32 including Proposition2.6 algebraic argument; Theorems2.9–2.10 and proof pp.35–39 for algebraic morphisms; metric statements are external consumers; Lemma3.4 and proof pp.43–44; §4.6.2 Theorem4.17 and proof pp.98–99 for the FZ and shifted coordinate constructions; §A.3 p.109 axis-normalized classes; TheoremA.3 and proof pp.110–111.
- [Uniformity in Mordell–Lang for curves](https://arxiv.org/pdf/2001.10276v3), Vesselin Dimitrov, Ziyang Gao, Philipp Habegger. arXiv2001.10276v3,49 pages; printed pp.23–25 correspond to PDF pages23–25. Published Annals194(2021) wording not collated. Read2026-10-04: §6.1 pp.23–25 through the universal Picard, section-free Abel, difference and Faltings–Zhang construction; numerical heights are outside this algebraic roadmap.
- [Néron Models](https://archive.math.arizona.edu/cais/scans/BLR-Neron_Models/neron4.pdf), Siegfried Bosch, Werner Lütkebohmert, Michel Raynaud. Springer1990, public scan neron4.pdf containing printed pp.170–261; each scan page is a two-page spread. Read2026-10-04: §8.1 pp.199–205, in particular Proposition4 and its Leray/rigidification argument; §8.4 Theorem1 and proof pp.231–232, Proposition2 and Theorem3 p.232; §9.2 Corollaries11–14 pp.250–251; §9.3 Theorem1 and proof, Remark2 and symmetric-power/Abel chart construction pp.252–258; §9.4 Theorem1 and Proposition4 with the beginning of its canonical-theta proof pp.259–261.
- [Jacobian Varieties](https://www.jmilne.org/math/xnotes/JVs.pdf), J. S. Milne. Public notes, §8 Theorem8.1 and following paragraph, printed pp.27–28, inspected through the web PDF text; PDF download returned406, so no byte hash is claimed. Read2026-10-04: §8 Theorem8.1 and the base-change/abelian-scheme paragraph pp.27–28.

The degree-zero finiteness misprint is the already confirmed PAPER-YUAN-26/E13. The author manuscript calls the map finite without d≠0; d=0 instead gives the constant section −α. All targets above use the corrected nonzero hypothesis. The published typeset text was not collated.

## Prototype boundary

The suggested file elaborates the native Hom-valued triangular equivalence, its four API signatures and three examples. Other exact definitions, APIs, tests and named targets are individually recorded as omissions because their geometric supplier interfaces are absent at the pins. Compiling that subset makes no assertion about the omitted relative Picard, theta, descent or Hodge statements.
