# Integral Galois modules and orders: CA.7 continuation

This roadmap continues the accepted CA.7 plan. It supplies the stable module interfaces, the semisimple ideal and cancellation arguments, and the character-determinant machinery used in the Fröhlich–Taylor obstruction theorem. The accepted packet remains the owner of its 55 target IDs. This document retains their exact contracts and adds 71 direct supplier targets; it does not reconstruct their carriers or rename their IDs.

The main result is the equality

\[
[\mathcal O_L]-[F:\mathbb Q][\mathbb Z[G]]=t(W_{L/F})\quad\text{in }\operatorname{Cl}(\mathbb Z[G])
\]

for a tame finite Galois extension L/F of number fields with group G. The right side is built from symplectic root signs. Squaring it gives the order-two corollary; absence of symplectic characters gives stable freeness. For odd-order G, Eichler cancellation converts stable freeness into freeness of rank [F:Q]. Neither stable freeness nor local freeness alone asserts a normal integral basis over the relative coefficient order.

Coverage is **planned**, with eight precise boundaries listed below. This is a completed target-level planning pass, not a claim of proof closure or implementation. Every definition and construction has an API, checks and consuming targets. Every prerequisite chain ends in the pinned libraries, a retained/new target, an exact existing-roadmap contract or a recorded boundary.

## Conventions and scope

- Group rings act on the left. The arithmetic idele construction is written for right lattices as in Fröhlich; its left-module application uses the opposite algebra and order throughout.
- An arithmetic order is a full finite central integer lattice in a semisimple number-field algebra. Its local rank is witnessed by an isomorphism with a finite number of copies of the order. It is not a dimension computed over a noncommutative ring.
- Generic Dedekind completion statements require a nonfield base. Over a field, height-one-prime completion tests are vacuous; a generic rank condition and the rational normal basis supply the separate field branch.
- The relative integer-ring class has rank one over O_F[G]. Restriction to Z[G] has rank d=[F:Q], and the class is [O_L]−d[Z[G]].
- K₀ is Tau Ceti's existing SplitK0 of the full subcategory of finite projective modules. The common finite-free stabilization criterion and scalar maps are new interfaces over that carrier.
- The Gauss sum is Mathlib's existing sum, with the trivial multiplicative character extended by zero at zero. Thus a nontrivial additive character has g(1)=−1. Conrad's normalized Stickelberger sum has the opposite sign.
- The resolvend uses g⁻¹ in the group-ring basis. Its absolute norm is an embedding-product character-hom norm, including transport of characters; it is not the scalar field norm of each coefficient.
- Positivity in the all-place kernel quotient is imposed on symplectic characters at every infinite component. Its finite-place presentation allows negative sign values but keeps a positive principal denominator. A sign at infinity cannot simply be copied from the finite representative.
- Our normalized logarithm ν=L/p has commutator image φ(A). CPT uses ν for the unnormalized map induced by L, whose image is pφ(A). Coefficient Frobenius acts before character evaluation.

## What the libraries already supply

The audited pins are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The actual source statements were read at those commits. Current upstream roadmaps and the current Tau Ceti library were screened separately, so work added after the atlas snapshot is imported too.


- `tauceti:TauCeti.finiteProjectiveModules` in `TauCeti/Algebra/Category/ModuleCat/CartanMap.lean`: Object property of ModuleCat R: finite generation and projectivity; its full subcategory has zero, finite biproducts and essential smallness. Actual pinned Lean statement read on 2026-10-14, lines107–160.
- `tauceti:TauCeti.SplitK0` in `TauCeti/CategoryTheory/GrothendieckGroup/Split.lean`: Split Grothendieck group of an essentially small category with finite biproducts. Actual pinned Lean statement read on 2026-10-14, definition and sections1–2.
- `tauceti:TauCeti.SplitK0.of` in `TauCeti/CategoryTheory/GrothendieckGroup/Split.lean`: Class map on objects Actual pinned Lean statement read on 2026-10-14, class-map section.
- `tauceti:TauCeti.SplitK0.of_biprod` in `TauCeti/CategoryTheory/GrothendieckGroup/Split.lean`: Biproduct class is the sum of the two classes Actual pinned Lean statement read on 2026-10-14, biproduct section.
- `tauceti:TauCeti.SplitK0.of_congr` in `TauCeti/CategoryTheory/GrothendieckGroup/Split.lean`: Isomorphic objects have equal classes Actual pinned Lean statement read on 2026-10-14, class-map section.
- `tauceti:TauCeti.SplitK0.map` in `TauCeti/CategoryTheory/GrothendieckGroup/Split.lean`: Additive functors induce group homomorphisms Actual pinned Lean statement read on 2026-10-14, functoriality section.
- `tauceti:TauCeti.SplitK0.map_of` in `TauCeti/CategoryTheory/GrothendieckGroup/Split.lean`: Formula on an object generator Actual pinned Lean statement read on 2026-10-14, functoriality section.
- `tauceti:TauCeti.SplitK0.map_id` in `TauCeti/CategoryTheory/GrothendieckGroup/Split.lean`: Identity functor induces identity Actual pinned Lean statement read on 2026-10-14, functoriality section.
- `tauceti:TauCeti.SplitK0.map_comp` in `TauCeti/CategoryTheory/GrothendieckGroup/Split.lean`: Composite functor induces composite map Actual pinned Lean statement read on 2026-10-14, functoriality section.
- `tauceti:TauCeti.SplitK0.grothendieckAddGroupEquiv` in `TauCeti/CategoryTheory/GrothendieckGroup/Split.lean`: Equivalence to the group completion of ObjectCode Actual pinned Lean statement read on 2026-10-14, line373.
- `mathlib:Module.Finite.exists_comp_eq_id_of_projective` in `Mathlib/RingTheory/Finiteness/Projective.lean`: A finite projective module is a retract of Fin n → R for some finite n. Actual pinned Lean statement read on 2026-10-14, lines27–34.
- `mathlib:Module.Projective.iff_split` in `Mathlib/Algebra/Module/Projective.lean`: Projectivity is equivalent to being a retract of a free module. Actual pinned Lean statement read on 2026-10-14, lines239–261.
- `mathlib:Localization.r_iff_exists` in `Mathlib/GroupTheory/MonoidLocalization/Basic.lean`: The multiplicative localization equality criterion carries to_additive, generating AddLocalization.r_iff_exists used for group completion. Actual pinned Lean statement read on 2026-10-14, line191 and generated additive declaration.
- `mathlib:ModuleCat.restrictScalars` in `Mathlib/Algebra/Category/ModuleCat/ChangeOfRings.lean`: Restriction functor on modules along any unital ring homomorphism. Actual pinned Lean statement read on 2026-10-14, line85.
- `mathlib:ModuleCat.extendScalars` in `Mathlib/Algebra/Category/ModuleCat/ChangeOfRings.lean`: Commutative-ring extension functor; this does not supply balanced extension for arbitrary noncommutative orders. Actual pinned Lean statement read on 2026-10-14, line400, CommRing hypotheses.
- `mathlib:ClassGroup` in `Mathlib/RingTheory/ClassGroup/Basic.lean`: Invertible fractional ideals modulo principal fractional ideals. Actual pinned Lean statement read on 2026-10-14, lines89–92.
- `mathlib:ClassGroup.mk` in `Mathlib/RingTheory/ClassGroup/Basic.lean`: Class homomorphism from invertible fractional ideals over a chosen fraction field. Actual pinned Lean statement read on 2026-10-14, lines107–111.
- `mathlib:ClassGroup.mk0_eq_mk0_iff_exists_fraction_ring` in `Mathlib/RingTheory/ClassGroup/Basic.lean`: Equality of integral ideal classes is equivalent to scaling by a nonzero fraction-field element. Actual pinned Lean statement read on 2026-10-14, lines279–295.
- `mathlib:FractionalIdeal.mem_inv_iff` in `Mathlib/RingTheory/FractionalIdeal/Inverse.lean`: For a nonzero fractional ideal I, x lies in I inverse iff xI is contained in the base ring. Actual pinned Lean statement read on 2026-10-14, line61.
- `mathlib:gaussSum` in `Mathlib/NumberTheory/GaussSum.lean`: Finite-ring Gauss sum of the existing MulChar and AddChar carriers Actual pinned Lean statement read on 2026-10-14, lines72–74.
- `mathlib:gaussSum_one_left` in `Mathlib/NumberTheory/GaussSum.lean`: The trivial multiplicative character has Gauss sum −1 for a nontrivial additive character over a finite field Actual pinned Lean statement read on 2026-10-14, lines126–128.
- `mathlib:gaussSum_mulShift_eq` in `Mathlib/NumberTheory/GaussSum.lean`: Additive-character scaling multiplies the sum by the inverse multiplicative-character value Actual pinned Lean statement read on 2026-10-14, lines83–85.
- `mathlib:gaussSum_mul_gaussSum_eq_card` in `Mathlib/NumberTheory/GaussSum.lean`: The product with both inverse characters is the finite-field cardinality under nontriviality and additive primitivity Actual pinned Lean statement read on 2026-10-14, lines188–190.
- `mathlib:gaussSum_mul` in `Mathlib/NumberTheory/GaussSum.lean`: A reindexed double-sum identity for the product of two Gauss sums Actual pinned Lean statement read on 2026-10-14, lines149–152.
- `mathlib:Module.FaithfullyFlat.of_flat_of_isLocalHom` in `Mathlib/RingTheory/Flat/FaithfullyFlat/Algebra.lean`: A flat local algebra map of local rings is faithfully flat. Actual pinned Lean statement read on 2026-10-14, lines60–61.

The accepted targets also retain their accepted baseline declarations. Current G₀ restriction acts on finite modules and does not supply the required projective-K₀ restriction. Current ring-equivalence functoriality does not supply arbitrary ring-hom scalar extension. The existing local normal-basis orbit lattice is distinct from a full tame integer-ring normal integral basis. Generic semisimple reduced norm, reduced characteristic polynomial, the Steinitz/K₀ comparison and the integral group logarithm were not found at the pins or in the current library.

## Imported mathematical contracts

These are dependencies on existing upstream targets. Their declarations are not new CA.7 targets.

- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`: The local Brauer invariant isomorphism and the finite-extension restriction formula inv_E(Res[C])=[E:F] inv_F([C]); combined with SemisimpleAlgebras splitting/embedding, a degree-d local extension embeds as a maximal subfield of a degree-d division algebra.
- `tauceti:TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras#layer-6-the-brauer-group-and-splitting-fields`: Wedderburn decomposition, simple-module dimensions, splitting-field descent and the Brauer/finite étale embedding criterion for central simple algebras. Current roadmap Layer6 read; reduced norms themselves are new CA.7 targets.
- `tauceti:TauCetiRoadmap/RepresentationTheory/CharacterTheory#layer-3-the-character-table-idempotents-completeness-second-orthogonality`: Character classification and full-character-table injectivity/orthogonality, including the virtual character evaluation used in the determinant and Adams constructions.
- `tauceti:TauCetiRoadmap/RepresentationTheory/CharacterTheory#layer-4-the-arithmetic-of-character-values`: Fields of character values and the absolute Galois action on irreducible characters and their coefficient embeddings.
- `tauceti:TauCetiRoadmap/RepresentationTheory/CharacterTheory#layer-7-the-frobenius-schur-indicator-and-realquaternionic-type`: Frobenius–Schur trichotomy, symplectic characters and the odd-order exclusion; the real Wedderburn correspondence detecting definite quaternion division components.
- `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-6-the-virtual-character-ring-artin-and-brauer-induction`: The virtual character ring, restriction/induction projection formula and generic integral Artin/Brauer induction. Q_p-rational elementary induction is an extra CA.7 supplier recorded in G-LOCALBRAUER.
- `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-5-the-global-local-dictionary-at-finite-places`: Finite-place completion algebras and valuation rings, the integral tensor/product dictionary and Galois transport of factors; finite integral bases and arithmetic lattice patching.
- `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-1-the-splitting-dictionary`: Dedekind Galois prime action, decomposition/inertia and residue action, with the inseparable residue case retained; no unconditional inertia-index=e assertion.
- `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-4-the-relative-discriminant`: Relative discriminant and integral trace/index-square compatibility for finite separable extensions over a Dedekind base.
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`: Normalized local Artin reciprocity and Artin conductors for finite-order characters, with the convention made explicit in the local Gauss sum.
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants`: Injectivity of the global Brauer class map into all local Brauer invariants, applied over every field factor of a finite étale splitting algebra.
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`: Kronecker–Weber supplies the initial cyclotomic embedding for the inherited squarefree-conductor target; CA.7 supplies only the inertia cut.
- `tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups`: Split determinant-one matrix group, geometric semisimplicity and simple connectedness and their descent under inner forms.
- `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius`: Finite unramified extensions and surjectivity of their field norm on integer-ring units, residue normal bases, Teichmüller lifts, Nakayama independence and the completion integral-basis dictionary.
- `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-3-ramification-the-tame-and-wild-cases-and-the-filtration`: The field-norm valuation formula v_F(N x)=f(E/F)v_E(x), including totally ramified Eisenstein extensions; tame uniformizer adjustment by Hensel, roots of unity, ramification towers, inertia quotients and splitting a tame extension after the stated unramified scalar extension.

The exact lower-tier node `AdelicAlgebraicGroups:AA.4/strong-approximation-theorem` supplies strong approximation for connected simply connected semisimple groups, with a noncompact factor in each almost-simple component. CA.7 proves the inner-form and archimedean noncompactness adapter. General K-theory, FiniteFieldsAndCharacterSums and analytic Artin L-function roadmaps are not upward dependencies.

## The proof architecture

The finite-projective group completion criterion first turns equality of classes into a common free stabilization. Steinitz identifies its rank-zero Dedekind part with the existing ideal class group. Balanced scalar extension supplies the actual maximal-overorder map.

For arithmetic orders, local bases give idele double cosets. Reduced norms and matrix strong approximation classify rank at least two without assuming a prior rank-one splitting. Local norm lifts then produce the rank-one ideal representative. Eichler strong approximation makes the rank-one stable fibre a singleton and gives Jacobinski cancellation. Matrix algebras over a definite quaternion division algebra are allowed; only the division algebra itself is excluded.

For Z[G], character determinants identify the stable class with a Hom quotient. The positive-unit kernel quotient receives the tame integer-ring class. Its symplectic sign representative defines t(W). The integral norm resolvend and finite Gauss homomorphisms give the local factors in Taylor’s proof.

The logarithm proves a commutator-image statement and identifies an explicit torsion kernel. Integral character twisting, elementary crossed-product reduction and fixed-point descent handle general groups. Taylor’s detecting congruences eliminate the remaining group-element determinant torsion. Diagonal and off-diagonal integral determinant factors then give the full obstruction equality. Equal valuations or equal logarithms alone never replace these determinant assertions.

## Stable modules and the Dedekind comparison

<a id="target-stable-equivalence"></a>

### Stable equivalence with a finite free summand

**Target:** `ClassicalArithmeticCompletion:CA.7/continuation/stable-equivalence` (definition).

For left R-modules P,Q over a unital ring R, StableEquivalent(P,Q) means that P⊕Rⁿ and Q⊕Rⁿ are R-linearly isomorphic for some natural n. The same finite free module occurs on both sides.

**Hypotheses.**

- R any unital ring; no commutativity or noetherian hypothesis.

**API.**

- `StableEquivalence.refl` (constructor): P is stably equivalent to itself, with n=0.
- `StableEquivalence.symm` (relation): StableEquivalent(P,Q) implies StableEquivalent(Q,P).
- `StableEquivalence.trans` (relation): StableEquivalent(P,Q) and StableEquivalent(Q,T) imply StableEquivalent(P,T).
- `StableEquivalence.of_equiv` (constructor): An R-linear isomorphism P≅Q gives stable equivalence with n=0.
- `StableEquivalence.prod` (compatibility): Stable equivalences are preserved by finite direct sums.

**Checks.**

- `stable_equivalence_1` (computation): Over ℤ, ℤ and ℤ are stably equivalent.
- `stable_equivalence_2` (degenerate): The zero module is stably equivalent to itself with n=0.
- `stable_equivalence_3` (non-example): Over ℤ, the zero module and ℤ are not stably equivalent: rational ranks differ.
- `stable_equivalence_4` (compatibility): For finite projectives, stable equivalence is exactly equality of their existing SplitK0 classes, by split-k0-stable-equality.

**Proof route.**

1. Use a finite natural-number witness and an actual linear isomorphism. Compose witnesses after reassociating and enlarging both sides by free summands.

**Dependencies:** Existing ring and module carriers; no additional target.

**Consumers.**

- [split-k0-stable-equality](#target-split-k0-stable-equality): Translate a K₀ equality into a finite free stabilization.

**Sources.**

- [The K-book, Chapter II: The Grothendieck Group K₀](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.II.pdf), II§1 Proposition1.1 and Corollary1.3, pp.1–2; II§2, p.5. Group-completion equality admits a common additive witness; finite projectives permit replacing that witness by a finite free module.

**Acceptance:** Check every API law and all discriminating tests below.

<a id="target-finite-projective-free-complement"></a>

### Finite projectives have finite free complements

**Target:** `ClassicalArithmeticCompletion:CA.7/continuation/finite-projective-free-complement` (theorem).

Every finitely generated projective left R-module P has a finitely generated projective complement N with P⊕N≅Rⁿ for some finite n.

**Proof route.**

1. Use the pinned finite-projective retract f:Rⁿ→P and section g. The kernel of f is a direct summand of Rⁿ and gives the complement. Its finite generation follows from the explicit complementary idempotent, without assuming R noetherian.

**Dependencies:** `mathlib:Module.Finite.exists_comp_eq_id_of_projective`.

**Sources.**

- [The K-book, Chapter I: Projective Modules and Vector Bundles](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.I.pdf), I§2, pp.6–7, split finite-free characterization. A finite projective is a direct summand of a finite free module.

**Acceptance:** Every finitely generated projective left R-module P has a finitely generated projective complement N with P⊕N≅Rⁿ for some finite n.

<a id="target-split-k0-stable-equality"></a>

### Stable equality in the existing split K₀

**Target:** `ClassicalArithmeticCompletion:CA.7/continuation/split-k0-stable-equality` (theorem).

For P,Q in (finiteProjectiveModules R).FullSubcategory, SplitK0.of(P)=SplitK0.of(Q) iff StableEquivalent(P,Q). In particular [P]=[Rⁿ] iff P⊕Rᵏ≅Rⁿ⁺ᵏ for some k.

**Proof route.**

1. Transport through SplitK0.grothendieckAddGroupEquiv. Apply additive-localization equality to isomorphism classes under biproduct. Replace the finite-projective witness T by T⊕T′≅Rᵏ using finite-projective-free-complement. The reverse implication is biproduct additivity and cancellation in the abelian group.

**Dependencies:** [stable-equivalence](#target-stable-equivalence), [finite-projective-free-complement](#target-finite-projective-free-complement), `tauceti:TauCeti.SplitK0`, `tauceti:TauCeti.finiteProjectiveModules`, `tauceti:TauCeti.SplitK0.grothendieckAddGroupEquiv`, `mathlib:Localization.r_iff_exists`, `tauceti:TauCeti.SplitK0.of_biprod`.

**Sources.**

- [The K-book, Chapter II: The Grothendieck Group K₀](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.II.pdf), II§1 Proposition1.1/Corollary1.3, pp.1–2; II§2, p.5. The universal group completion identifies two generators after one common summand; projectives have finite free complements.

**Acceptance:** For P,Q in (finiteProjectiveModules R).FullSubcategory, SplitK0.of(P)=SplitK0.of(Q) iff StableEquivalent(P,Q). In particular [P]=[Rⁿ] iff P⊕Rᵏ≅Rⁿ⁺ᵏ for some k.

<a id="target-balanced-extension"></a>

### Balanced extension for noncommutative orders

**Target:** `ClassicalArithmeticCompletion:CA.7/continuation/balanced-extension` (construction).

For a unital ring map f:R→S and a left R-module P, fₗ(P)=S⊗ᵣP is the abelian-group tensor product modulo sr⊗p=s⊗rp, where the right R-action on S is sf(r). Its left S-action is multiplication on the first factor. This gives an additive functor ModuleCat R→ModuleCat S.

**API.**

- `BalancedExtension.balanced_lift` (universal-property): S-linear maps S⊗ᵣP→Q correspond to additive maps P→Q satisfying r-linearity after restriction along f.
- `BalancedExtension.free` (compatibility): S⊗ᵣRⁿ≅Sⁿ with s⊗(rᵢ) sent to (sf(rᵢ)).
- `BalancedExtension.commutative` (compatibility): For commutative R,S this agrees naturally with ModuleCat.extendScalars f.
- `BalancedExtension.identity` (functoriality): R⊗ᵣP≅P, r⊗p↦rp.
- `BalancedExtension.composition` (functoriality): For R→S→T, T⊗ₛ(S⊗ᵣP)≅T⊗ᵣP, t⊗(s⊗p)↦ts⊗p.

**Checks.**

- `balanced_extension_1` (computation): For R=ℤ and S=M₂(ℤ), extension of ℤ gives the left regular module S, rather than its centre.
- `balanced_extension_2` (degenerate): Extension of the zero module is zero.
- `balanced_extension_3` (compatibility): For a commutative algebra map this is the existing tensor-extension functor on pure tensors.
- `balanced_extension_4` (non-example): Along augmentation ℤ[C₂]→ℤ, extension of the sign module ℤ is ℤ/2ℤ, so balancing does not mean forgetting the group action.

**Proof route.**

1. Present the additive group by symbols s⊗p with biadditivity and the balancing relation. Verify the left S-action preserves the relations. Descend additive morphisms by the universal property; define identity and composition isomorphisms on pure tensors.

**Dependencies:** `mathlib:ModuleCat.restrictScalars`, `mathlib:ModuleCat.extendScalars`.

**Consumers.**

- [extension-k0-map](#target-extension-k0-map): Supply the functor before applying the existing SplitK0.map.
- [semilocal-induction-comparison](#target-semilocal-induction-comparison): Induction of a left module is extension along a subgroup ring inclusion.

**Sources.**

- [The K-book, Chapter I: Projective Modules and Vector Bundles](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.I.pdf), I§2, pp.7–8; W-II II§2.8, p.12. Scalar extension of left modules uses a right-left balanced tensor and sends finite free modules and their retracts to finite free modules and their retracts.

**Acceptance:** Check every API law and all discriminating tests below.

<a id="target-finite-projective-scalar-change"></a>

### Scalar change preserves finite projectives under exact hypotheses

**Target:** `ClassicalArithmeticCompletion:CA.7/continuation/finite-projective-scalar-change` (theorem).

Extension along every unital R→S preserves finite projective left modules. Restriction of finite projective S-modules preserves finite projective R-modules if S is finitely generated projective as a left R-module through f; this condition is necessary, by testing P=S.

**Proof route.**

1. Extend a split finite-free presentation; no flatness is needed for a split sequence. For restriction, a finite projective S-module is a summand of Sⁿ, which is finite projective over R under the stated condition. Necessity tests the regular S-module.

**Dependencies:** [balanced-extension](#target-balanced-extension), [finite-projective-free-complement](#target-finite-projective-free-complement), `mathlib:ModuleCat.restrictScalars`.

**Sources.**

- [The K-book, Chapter II: The Grothendieck Group K₀](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.II.pdf), II§2.8 and Example2.8.1, pp.12–13; W-I I§2, pp.7–8. Extension acts on projective K₀ along an arbitrary ring map; restriction requires the target ring to be finite projective over the source.

**Acceptance:** Extension along every unital R→S preserves finite projective left modules. Restriction of finite projective S-modules preserves finite projective R-modules if S is finitely generated projective as a left R-module through f; this condition is necessary, by testing P=S.

<a id="target-extension-k0-map"></a>

### The extension map on projective K₀

**Target:** `ClassicalArithmeticCompletion:CA.7/continuation/extension-k0-map` (construction).

Every unital f:R→S induces fₗ:K₀(R)→K₀(S), [P]↦[S⊗ᵣP]. Here K₀ is the existing SplitK0 of finiteProjectiveModules, not G₀ of all finite modules.

**API.**

- `ExtensionK0Map.of` (simp): The map sends an object class to the class of its extension.
- `ExtensionK0Map.identity` (functoriality): The identity ring map induces identity.
- `ExtensionK0Map.composition` (functoriality): Composition of ring maps induces composition of K₀ maps, in the covariant direction for extension and the contravariant direction for restriction.
- `ExtensionK0Map.free` (compatibility): Extension sends [Rⁿ] to [Sⁿ]; restriction sends [Sⁿ] to n[S] as an R-module.

**Checks.**

- `extension_k0_map_1` (computation): For ℤ→ℤ[i], extension sends [ℤ] to [ℤ[i]], whereas restriction sends [ℤ[i]] to 2[ℤ].
- `extension_k0_map_2` (degenerate): The zero class maps to zero.
- `extension_k0_map_3` (compatibility): Along a ring identity, the map is SplitK0.map of the identity functor.
- `extension_k0_map_4` (non-example): Restriction along ℤ→ℚ has no finite-projective K₀ functor: the regular ℚ-module is not finitely generated over ℤ.

**Proof route.**

1. Restrict the additive module functor to the existing finite-projective subcategory using finite-projective-scalar-change. Apply SplitK0.map. Use the module-functor identity/composition isomorphisms and SplitK0.of_congr.

**Dependencies:** [finite-projective-scalar-change](#target-finite-projective-scalar-change), `tauceti:TauCeti.finiteProjectiveModules`, `tauceti:TauCeti.SplitK0.map`, `tauceti:TauCeti.SplitK0.map_of`, `tauceti:TauCeti.SplitK0.map_id`, `tauceti:TauCeti.SplitK0.map_comp`.

**Consumers.**

- [locally-free-class-group](#target-locally-free-class-group): Provide the scalar map used in the kernel group.
- [ring-of-integers-class](#target-ring-of-integers-class): Track absolute versus relative ranks.

**Sources.**

- [The K-book, Chapter II: The Grothendieck Group K₀](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.II.pdf), II§2.8 and Example2.8.1, pp.12–13. Additive scalar functors on finite projectives induce the claimed Grothendieck-group maps.

**Acceptance:** Check every API law and all discriminating tests below.

<a id="target-restriction-k0-map"></a>

### The restriction map on projective K₀

**Target:** `ClassicalArithmeticCompletion:CA.7/continuation/restriction-k0-map` (construction).

If S is finite projective over R through f:R→S, restriction induces f*:K₀(S)→K₀(R), [P]↦[Res_f P]. Here K₀ is the existing SplitK0 of finiteProjectiveModules, not G₀ of all finite modules.

**API.**

- `RestrictionK0Map.of` (simp): The map sends an object class to the class of its restriction.
- `RestrictionK0Map.identity` (functoriality): The identity ring map induces identity.
- `RestrictionK0Map.composition` (functoriality): Composition of ring maps induces composition of K₀ maps, in the covariant direction for extension and the contravariant direction for restriction.
- `RestrictionK0Map.free` (compatibility): Extension sends [Rⁿ] to [Sⁿ]; restriction sends [Sⁿ] to n[S] as an R-module.

**Checks.**

- `restriction_k0_map_1` (computation): For ℤ→ℤ[i], extension sends [ℤ] to [ℤ[i]], whereas restriction sends [ℤ[i]] to 2[ℤ].
- `restriction_k0_map_2` (degenerate): The zero class maps to zero.
- `restriction_k0_map_3` (compatibility): Along a ring identity, the map is SplitK0.map of the identity functor.
- `restriction_k0_map_4` (non-example): Restriction along ℤ→ℚ has no finite-projective K₀ functor: the regular ℚ-module is not finitely generated over ℤ.

**Proof route.**

1. Restrict the additive module functor to the existing finite-projective subcategory using finite-projective-scalar-change. Apply SplitK0.map. Use the module-functor identity/composition isomorphisms and SplitK0.of_congr.

**Dependencies:** [finite-projective-scalar-change](#target-finite-projective-scalar-change), `tauceti:TauCeti.finiteProjectiveModules`, `tauceti:TauCeti.SplitK0.map`, `tauceti:TauCeti.SplitK0.map_of`, `tauceti:TauCeti.SplitK0.map_id`, `tauceti:TauCeti.SplitK0.map_comp`.

**Consumers.**

- [locally-free-class-group](#target-locally-free-class-group): Provide the scalar map used in the kernel group.
- [ring-of-integers-class](#target-ring-of-integers-class): Track absolute versus relative ranks.

**Sources.**

- [The K-book, Chapter II: The Grothendieck Group K₀](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.II.pdf), II§2.8 and Example2.8.1, pp.12–13. Additive scalar functors on finite projectives induce the claimed Grothendieck-group maps.

**Acceptance:** Check every API law and all discriminating tests below.

<a id="target-locally-free-scalar-compatibility"></a>

### Scalar maps on locally free arithmetic classes

**Target:** `ClassicalArithmeticCompletion:CA.7/continuation/locally-free-scalar-compatibility` (theorem).

For a compatible homomorphism of arithmetic orders Λ→Γ, extension takes locally free rank-n Λ-lattices to locally free rank-n Γ-lattices and induces Cl(Λ)→Cl(Γ), whenever coefficient completions commute with this scalar change. If Γ itself is a locally free Λ-lattice of fixed rank d, restriction induces Cl(Γ)→Cl(Λ). On a rank-n Γ-lattice P its formula is Res(cΓ(P))=cΛ(Res P)−n·cΛ(Res Γ), with Res P of local rank nd. In particular it equals cΛ(Res P) only when the coefficient-order correction class vanishes. Merely being an overorder does not imply the restriction hypothesis.

**Proof route.**

1. Use the balanced universal property to commute extension with central coefficient completions, then compute on completed free bases. For restriction use Γ_v≅Λ_vᵈ. The defining class [P]−n[Γ] restricts to [Res P]−n[Res Γ]; add and subtract nd[Λ] to obtain cΛ(Res P)−n cΛ(Res Γ). For Z[G]→O_F[G], an integral Z-basis of O_F makes Res Γ globally free of rank [F:Q], so the correction class is zero.

**Dependencies:** [extension-k0-map](#target-extension-k0-map), [restriction-k0-map](#target-restriction-k0-map), [locally-free-lattice](#target-locally-free-lattice), [locally-free-class-group](#target-locally-free-class-group).

**Dependency facet:** [locally-free-class-group](#target-locally-free-class-group): Only the definition of Cl as the subgroup generated by [M]−n[Λ] inside the existing finite-projective SplitK0. The stable criterion, rank-one representation and comparison APIs are conclusions consuming this continuation, not hypotheses.

**Sources.**

- [Arithmetic and Galois module structure for tame extensions](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0286_0287/LOG_0033.pdf), Appendix VI Proposition2 and VII Proposition1, pp.434–436; §1 Theorem1, p.388. Change of coefficient ring and induction are tracked on module classes, with the class of the restricted coefficient ring explicitly retained.

**Acceptance:** For a compatible homomorphism of arithmetic orders Λ→Γ, extension takes locally free rank-n Λ-lattices to locally free rank-n Γ-lattices and induces Cl(Λ)→Cl(Γ), whenever coefficient completions commute with this scalar change. If Γ itself is a locally free Λ-lattice of fixed rank d, restriction induces Cl(Γ)→Cl(Λ). On a rank-n Γ-lattice P its formula is Res(cΓ(P))=cΛ(Res P)−n·cΛ(Res Γ), with Res P of local rank nd. In particular it equals cΛ(Res P) only when the coefficient-order correction class vanishes. Merely being an overorder does not imply the restriction hypothesis.

<a id="target-steinitz-ideal-product"></a>

### The product identity for invertible ideals

**Target:** `ClassicalArithmeticCompletion:CA.7/continuation/steinitz-ideal-product` (theorem).

For a Dedekind domain A with fraction field K and nonzero invertible fractional ideals I,J, I⊕J≅A⊕IJ as A-modules.

**Proof route.**

1. Replace I and J by scaled integral representatives with coprime support, using finite prime avoidance. For coprime representatives, the map I⊕J→A, (x,y)↦x+y, is onto with kernel {(z,−z):z∈I∩J=IJ}. Split the sequence because A is free. Transport back through the scaling isomorphisms.

**Dependencies:** `mathlib:ClassGroup.mk0_eq_mk0_iff_exists_fraction_ring`, `mathlib:FractionalIdeal.mem_inv_iff`.

**Sources.**

- [The K-book, Chapter I: Projective Modules and Vector Bundles](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.I.pdf), I§3, pp.16–19, ideal-class and Dedekind module discussion. Direct sums of invertible ideals are classified by their product class; the ideal-product identity supplies the constructive step.

**Acceptance:** For a Dedekind domain A with fraction field K and nonzero invertible fractional ideals I,J, I⊕J≅A⊕IJ as A-modules.

<a id="target-dedekind-projective-steinitz"></a>

### Steinitz decomposition over a Dedekind domain

**Target:** `ClassicalArithmeticCompletion:CA.7/continuation/dedekind-projective-steinitz` (theorem).

A nonzero finitely generated torsion-free module M over a Dedekind domain A of fraction-field rank n is isomorphic to Aⁿ⁻¹⊕I for a nonzero invertible fractional ideal I. Two such modules are isomorphic iff their ranks and ideal classes agree. The rank-zero case is M=0. Fields are handled separately by a vector-space basis.

**Proof route.**

1. Embed M in K⊗M. Choose a nonzero coordinate projection; its image is a fractional ideal. Invertibility supplies a dual basis and hence projectivity of that image, so the projection splits. Induct on rank to decompose M into ideals. Apply steinitz-ideal-product repeatedly. For uniqueness use the top exterior power and the existing principal-scaling class criterion.

**Dependencies:** [steinitz-ideal-product](#target-steinitz-ideal-product), `mathlib:ClassGroup.mk`, `mathlib:FractionalIdeal.mem_inv_iff`.

**Sources.**

- [The K-book, Chapter I: Projective Modules and Vector Bundles](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.I.pdf), I§3, Proposition3.4 and Dedekind discussion, pp.16–19; JOHN Theorem4.4, p.7. Finite torsion-free Dedekind modules have ideal summands and are classified by rank and determinant class.

**Acceptance:** A nonzero finitely generated torsion-free module M over a Dedekind domain A of fraction-field rank n is isomorphic to Aⁿ⁻¹⊕I for a nonzero invertible fractional ideal I. Two such modules are isomorphic iff their ranks and ideal classes agree. The rank-zero case is M=0. Fields are handled separately by a vector-space basis.

<a id="target-finite-dedekind-torsionfree-projective"></a>

### Finite torsion-free Dedekind modules are projective

**Target:** `ClassicalArithmeticCompletion:CA.7/continuation/finite-dedekind-torsionfree-projective` (theorem).

Every finitely generated torsion-free module over a Dedekind domain is projective; in particular the integral lattice underlying each number-field Galois module is projective over the coefficient ring.

**Proof route.**

1. Use the ideal decomposition in dedekind-projective-steinitz, whose coordinate splitting is independent of assuming projectivity of M. For an invertible ideal, a finite expression of 1 in II⁻¹ gives the dual-basis criterion. Finite direct sums of projectives are projective.

**Dependencies:** [dedekind-projective-steinitz](#target-dedekind-projective-steinitz), `mathlib:FractionalIdeal.mem_inv_iff`.

**Sources.**

- [The K-book, Chapter I: Projective Modules and Vector Bundles](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.I.pdf), I§3, pp.18–19; JOHN Theorem4.4(i)–(ii), p.7. The Dedekind ideal decomposition makes every finite torsion-free module projective.

**Acceptance:** Every finitely generated torsion-free module over a Dedekind domain is projective; in particular the integral lattice underlying each number-field Galois module is projective over the coefficient ring.

<a id="target-steinitz-class"></a>

### The Steinitz class on the existing ideal-class carrier

**Target:** `ClassicalArithmeticCompletion:CA.7/continuation/steinitz-class` (construction).

For a finitely generated torsion-free A-module M over a Dedekind domain, st(M)∈ClassGroup A is the class of I in its positive-rank Steinitz decomposition; st(0)=1. It is independent of the fraction field and decomposition.

**API.**

- `SteinitzClass.ideal` (compatibility): st(I)=ClassGroup.mk(I) for every invertible fractional ideal.
- `SteinitzClass.sum` (compatibility): st(M⊕N)=st(M)st(N), including zero modules.
- `SteinitzClass.free` (simp): st(Aⁿ)=1 for every n, including n=0.
- `SteinitzClass.iso` (extensionality): Isomorphic modules have the same Steinitz class.
- `SteinitzClass.scalar` (functoriality): For an injective map of Dedekind domains A→B, st(B⊗ₐM) is the extended ideal class of st(M).

**Checks.**

- `steinitz_class_1` (computation): For A=ℤ[√−5], I=(2,1+√−5) has nontrivial Steinitz class: norm2 would force a²+5b²=2, which has no integer solution.
- `steinitz_class_2` (degenerate): st(0)=1, with rank zero retained separately.
- `steinitz_class_3` (compatibility): For a nonzero ideal the answer is the existing ClassGroup.mk0 class.
- `steinitz_class_4` (non-example): The ideal I above and A both have rank one but different Steinitz classes, so rank alone does not classify modules.

**Proof route.**

1. Use uniqueness of the ideal class in dedekind-projective-steinitz. Treat zero separately rather than choosing a nonexistent rank-one ideal for rank zero. Identify this class with the top exterior-power line at positive rank.

**Dependencies:** [dedekind-projective-steinitz](#target-dedekind-projective-steinitz), `mathlib:ClassGroup`, `mathlib:ClassGroup.mk`.

**Consumers.**

- [dedekind-k0-comparison](#target-dedekind-k0-comparison): Identify the rank-zero K₀ subgroup with the existing ideal class group.

**Sources.**

- [The K-book, Chapter I: Projective Modules and Vector Bundles](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.I.pdf), I§3, Proposition3.4, pp.16–18; JOHN Theorem4.4(iii)–(v), p.7. The determinant ideal class is invariant under isomorphism, multiplicative under direct sum, and classifies a fixed positive rank.

**Acceptance:** Check every API law and all discriminating tests below.

<a id="target-dedekind-k0-comparison"></a>

### K₀ and the ideal class group of a Dedekind domain

**Target:** `ClassicalArithmeticCompletion:CA.7/continuation/dedekind-k0-comparison` (construction).

For a Dedekind domain A, the additive invariant P↦(rank(P),st(P)) induces K₀(A)≅Z⊕Additive(ClassGroup A). Its inverse sends (n,[I]) to n[A]+([I]−[A]). For a nonfield A this identifies inherited Cl(A) with Additive(ClassGroup A); for a field, ClassGroup A and the rank kernel are both zero, without invoking the vacuous completion definition.

**API.**

- `DedekindK0Comparison.of` (compatibility): The class [P] maps to (rank P,st(P)).
- `DedekindK0Comparison.rank_kernel` (characterisation): For nonfield A, the rank kernel is inherited Cl(A). For a field it is zero and equals Additive(ClassGroup A) by the separate field branch.
- `DedekindK0Comparison.ideal_inverse` (constructor): An ideal class [I] maps to [I]−[A] in rank zero.
- `DedekindK0Comparison.free` (simp): [Aⁿ] maps to (n,1).

**Checks.**

- `dedekind_k0_comparison_1` (computation): K₀(ℤ)≅ℤ and Cl(ℤ)=0.
- `dedekind_k0_comparison_2` (degenerate): The zero module maps to (0,1).
- `dedekind_k0_comparison_3` (compatibility): The rank-zero class of any invertible ideal maps to its existing ClassGroup.mk class.
- `dedekind_k0_comparison_4` (non-example): [I]−[A] for I=(2,1+√−5) over ℤ[√−5] is nonzero despite having rank zero.

**Proof route.**

1. Use steinitz-class additivity to descend through SplitK0. The product identity proves independence of the ideal representative and additivity of the inverse. Steinitz decomposition checks the inverse on all finite projective generators; include zero and field branches.

**Dependencies:** [steinitz-class](#target-steinitz-class), [split-k0-stable-equality](#target-split-k0-stable-equality), [steinitz-ideal-product](#target-steinitz-ideal-product), `tauceti:TauCeti.SplitK0`, `mathlib:ClassGroup`, [locally-free-class-group](#target-locally-free-class-group).

**Dependency facet:** [locally-free-class-group](#target-locally-free-class-group): Only the definition of Cl as the subgroup generated by [M]−n[Λ] inside the existing finite-projective SplitK0. The stable criterion, rank-one representation and comparison APIs are conclusions consuming this continuation, not hypotheses.

**Consumers.**

- [locally-free-not-free-example](#target-locally-free-not-free-example): Certify that the nonprincipal ideal class is nonzero.
- [locally-free-class-group](#target-locally-free-class-group): Supply the promised comparison with ClassGroup.

**Sources.**

- [The K-book, Chapter II: The Grothendieck Group K₀](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.II.pdf), W-II II§2 Proposition2.6 and Corollary2.6.3, pp.11–12; W-I I§3 Proposition3.4, pp.17–18. Rank and determinant identify projective K₀ of a Dedekind domain with the integer rank and the Picard/ideal class group.

**Acceptance:** Check every API law and all discriminating tests below.

<a id="target-projective-group-norm-surjectivity"></a>

### The norm of a projective group-ring module reaches all invariants

**Target:** `ClassicalArithmeticCompletion:CA.7/continuation/projective-group-norm-surjectivity` (theorem).

For a commutative ring A, finite group G and projective left A[G]-module P, the group norm induces an A-linear isomorphism P_G→P^G from coinvariants to invariants. In particular every invariant m is ∑g∈G gx for some x∈P. Restriction to a subgroup preserves projectivity and the same statement. For a Galois integral lattice the norm is the field trace.

**Proof route.**

1. For A[G], coinvariants are A by augmentation, and invariants are A times the group norm; the induced norm sends 1 to that basis element, so it is an isomorphism. Extend to arbitrary free modules and then transport the isomorphism to a projective retract, since norm commutes with the splitting maps. Restriction to H preserves projectivity because A[G] is free over A[H]. Identify the Galois norm with the sum defining the integral trace.

**Dependencies:** `mathlib:Module.Projective.iff_split`, [ring-of-integers-as-group-ring-module](#target-ring-of-integers-as-group-ring-module).

**Sources.**

- [Notes on Galois Modules](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), §15.1, pp.28–29, projectivity and trace discussion; §6 Corollary6.2, p.11; MART I, pp.17-01–17-02. The group norm on a projective module is onto its fixed module, explaining the projective-to-trace direction.

**Acceptance:** For a commutative ring A, finite group G and projective left A[G]-module P, the group norm induces an A-linear isomorphism P_G→P^G from coinvariants to invariants. In particular every invariant m is ∑g∈G gx for some x∈P. Restriction to a subgroup preserves projectivity and the same statement. For a Galois integral lattice the norm is the field trace.

## Orders, ideles and Eichler cancellation

<a id="target-order-ideles"></a>

### Ideles and lattice gluing for an arithmetic order

**Target:** `ClassicalArithmeticCompletion:CA.7/continuation/order-ideles` (construction).

For a finite-dimensional semisimple algebra B over a number field F, an O_F-order Λ and each finite place v, put B_v=F_v⊗B and Λ_v=O_v⊗Λ. J(B) is the restricted product of B_v× with respect to Λ_v×, with full B_v× at infinity; U(Λ) has Λ_v× at finite places and the full B_v× at infinite places. For α∈J(B), I(α)=B∩∏finite-v α_vΛ_v is a full right Λ-lattice with those completions. Left Λ-modules are obtained by applying this construction to Bᵒᵖ,Λᵒᵖ. All ensuing idele formulae use this opposite-algebra convention.

**Hypotheses.**

- Λ is a full finite torsion-free central O_F-lattice, F a number field.

**API.**

- `OrderIdeles.completion` (projection): I(α)_v=α_vΛ_v at every finite v.
- `OrderIdeles.unit_change` (characterisation): I(α)=I(β) iff αU(Λ)=βU(Λ).
- `OrderIdeles.principal_change` (compatibility): Left multiplication by b∈B× identifies I(α) with I(bα) as right modules.
- `OrderIdeles.opposite` (equivalence): A right Λᵒᵖ-lattice is precisely a left Λ-lattice with the same central coefficient structure.

**Checks.**

- `order_ideles_1` (computation): For Λ=ℤ, α_p=p at one prime and α_q=1 elsewhere gives I(α)=pℤ.
- `order_ideles_2` (degenerate): The identity idele gives Λ.
- `order_ideles_3` (compatibility): For a commutative number field this is the fractional ideal obtained from the existing local valuations.
- `order_ideles_4` (non-example): Having α_p=p at infinitely many rational primes is not an idele relative to ℤ_p×.

**Proof route.**

1. Only finitely many local lattices differ from Λ_v. Clear denominators and intersect the finitely many modified local conditions; the integral lattice patching in the global-local dictionary proves the completion formula and uniqueness. Changing the reference order changes only finitely many compact open factors.

**Dependencies:** [order-in-finite-dimensional-algebra](#target-order-in-finite-dimensional-algebra), [sublattice-eq-of-completions](#target-sublattice-eq-of-completions), `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-5-the-global-local-dictionary-at-finite-places`.

**Consumers.**

- [idele-genus-comparison](#target-idele-genus-comparison): Classify rank-one locally free lattices.
- [stable-idele-classification](#target-stable-idele-classification): Construct stable class representatives.

**Sources.**

- [Locally free modules over arithmetic orders](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0274_0275/LOG_0014.pdf), §2, (2.2), pp.113–114; §5D, p.121. Restricted ideles act on full lattices by prescribing all their completions, and local bases classify locally free lattices.

**Acceptance:** Check every API law and all discriminating tests below.

<a id="target-reduced-norm"></a>

### Reduced norm of a semisimple number-field algebra

**Target:** `ClassicalArithmeticCompletion:CA.7/continuation/reduced-norm` (construction).

Write B=∏i B_i with centres F_i. For a central simple component of degree d_i, Nrd:B_i→F_i is the polynomial whose scalar extension to a splitting field is the determinant on M_{d_i}; product these polynomials to obtain Nrd:B→Z(B). Restrict to units and extend placewise to ideles. Degree means the square root of dimension over the centre, not dimension over the original base field.

**API.**

- `ReducedNorm.split` (compatibility): After a chosen splitting B_i⊗E≅M_d(E), Nrd equals matrix determinant.
- `ReducedNorm.multiplicative` (structure): Nrd(xy)=Nrd(x)Nrd(y), Nrd(1)=1.
- `ReducedNorm.scalar` (simp): For central a in a component of degree d, Nrd(a)=aᵈ.
- `ReducedNorm.base_change` (functoriality): Central scalar extension and passage to opposite algebra commute with reduced norm.
- `ReducedNorm.idele` (constructor): Placewise reduced norm sends J(B) into J(Z(B)).

**Checks.**

- `reduced_norm_1` (computation): On M₂(ℚ), Nrd(diag(2,3))=6 and Nrd(2·1)=4.
- `reduced_norm_2` (degenerate): For a field component, Nrd is identity.
- `reduced_norm_3` (compatibility): On a split matrix algebra it is Mathlib matrix determinant.
- `reduced_norm_4` (non-example): On Hamilton quaternions the norm of i is 1, whereas the regular real-linear determinant is its norm squared.

**Proof route.**

1. Import Wedderburn and splitting of central simple algebras. Determinant is invariant under changing the splitting isomorphism by an inner automorphism; Galois descent gives central coefficients. Polynomial multiplicativity descends from matrix determinant.

**Dependencies:** `tauceti:TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras#layer-6-the-brauer-group-and-splitting-fields`.

**Consumers.**

- [norm-one-group](#target-norm-one-group): Define the group scheme used for approximation.
- [arithmetic-norm-images](#target-arithmetic-norm-images): Determine positivity restrictions on class representatives.

**Sources.**

- [Locally free modules over arithmetic orders](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0274_0275/LOG_0014.pdf), §2, (2.1) and reduced-norm paragraph, p.114; §4, p.118. The component reduced norms combine into the norm to the product centre and extend to all completions and ideles.
- [Algebraic Groups and Number Theory, Volume I](https://doi.org/10.1017/9781139017756), §1.4.1–1.4.3, pp.29–33. Splitting determinant and reduced characteristic polynomial descend to the centre.

**Acceptance:** Check every API law and all discriminating tests below.

<a id="target-arithmetic-norm-images"></a>

### Local and global reduced-norm images

**Target:** `ClassicalArithmeticCompletion:CA.7/continuation/arithmetic-norm-images` (theorem).

For each central simple number-field component C/F, Nrd(C×) consists exactly of a∈F× positive at every real place where C_v is a matrix algebra over Hamilton quaternions. At finite v the image is all F_v×; for a maximal O_v-order its unit image is O_v×. At a ramified real place it is ℝ_{>0}, otherwise the full local centre group. For any finite-place order, its norm-unit image is open. These statements apply componentwise to semisimple B.

**Proof route.**

1. Reduce each local simple component to M_r(D). Import the local Brauer invariant and its restriction formula: a degree-d extension kills the invariant of a division algebra D of degree d. The splitting/embedding criterion then embeds both the unramified degree-d extension and a degree-d totally ramified Eisenstein extension as maximal subfields. Their integral rings lie in the unique maximal order of D. Import unramified unit-norm surjectivity from LocalFieldsRamification Layer2 and the norm valuation formula from Layer3: the first supplies every unit and a uniformizer of the second supplies valuation one. Morita invariance and conjugacy of maximal orders give the asserted matrix-order unit image. At infinity compute split-real, complex and quaternionic determinants. For the global step, choose local regular elements with prescribed norm, approximate their separable reduced characteristic polynomials while fixing the constant term, and use prescribed-separable-polynomial to realize that polynomial globally. Split places supply companion matrices. This is Kneser’s §5.4 proof using the global Brauer splitting criterion. Openness follows from the reduced trace on sufficiently deep principal units.

**Dependencies:** [reduced-norm](#target-reduced-norm), [prescribed-separable-polynomial](#target-prescribed-separable-polynomial), `tauceti:TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras#layer-6-the-brauer-group-and-splitting-fields`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-3-ramification-the-tame-and-wild-cases-and-the-filtration`.

**Sources.**

- [Locally free modules over arithmetic orders](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0274_0275/LOG_0014.pdf), §4 Theorem2, p.118; §5A–B, pp.120–121. The norm image is locally surjective at finite places, globally governed by ramified-real positivity, and maximal-order unit norms are full finite units.
- [Lectures on Galois Cohomology of Classical Groups](https://mathweb.tifr.res.in/Documents/Publications/Lectures/tifr47.pdf), §5.4, retypeset pp.66–69, original pp.87–91. The local norm image and its global positive norm realization are proved using separable polynomial realization.

**Acceptance:** For each central simple number-field component C/F, Nrd(C×) consists exactly of a∈F× positive at every real place where C_v is a matrix algebra over Hamilton quaternions. At finite v the image is all F_v×; for a maximal O_v-order its unit image is O_v×. At a ramified real place it is ℝ_{>0}, otherwise the full local centre group. For any finite-place order, its norm-unit image is open. These statements apply componentwise to semisimple B.

<a id="target-norm-one-group"></a>

### The reduced-norm-one group scheme

**Target:** `ClassicalArithmeticCompletion:CA.7/continuation/norm-one-group` (construction).

For a central simple F-algebra C, SL₁(C) is the affine F-group whose points over every commutative F-algebra T are ker((C⊗F T)×→T×) under the reduced norm polynomial. For semisimple B use the product over its centres, then restriction of scalars to the original number field as needed. A field component has the trivial group.

**API.**

- `NormOneGroup.points` (characterisation): Its T-points are precisely units of reduced norm one, functorially in T.
- `NormOneGroup.split` (equivalence): After a splitting field, SL₁(C)≅SL_d.
- `NormOneGroup.product` (compatibility): The norm-one group of a semisimple product is the product of the component norm-one groups.
- `NormOneGroup.idele` (compatibility): Its adelic points identify with J(C)′=ker(Nrd), with compact-open order-unit factors.

**Checks.**

- `norm_one_group_1` (computation): For M₂(F), diag(a,a⁻¹) belongs to SL₁ for a≠0.
- `norm_one_group_2` (degenerate): For C=F, SL₁(C)(T)={1} for every T.
- `norm_one_group_3` (compatibility): For split C it agrees with the determinant-one matrix group from ReductiveGroups.
- `norm_one_group_4` (non-example): Over ℝ, SL₁(ℍ) is compact; it does not satisfy the archimedean noncompactness needed for strong approximation.

**Proof route.**

1. Represent the unit locus by the inverse of the norm polynomial and impose Nrd=1. Multiplication and inverse preserve this equation. Import the group-scheme and scalar-extension interfaces; identify the split fibre using ReducedNorm.split.

**Dependencies:** [reduced-norm](#target-reduced-norm), `tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups`, `tauceti:TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras#layer-6-the-brauer-group-and-splitting-fields`.

**Consumers.**

- [eichler-noncompact-adapter](#target-eichler-noncompact-adapter): Verify the precise hypotheses of the imported strong approximation theorem.

**Sources.**

- [Locally free modules over arithmetic orders](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0274_0275/LOG_0014.pdf), §3 VII and Lemma1, p.117; §2 norm kernels, p.114. Strong approximation applies to each component’s reduced-norm-one group; the split form is special linear.

**Acceptance:** Check every API law and all discriminating tests below.

<a id="target-eichler-condition"></a>

### Eichler’s condition for semisimple algebras

**Target:** `ClassicalArithmeticCompletion:CA.7/continuation/eichler-condition` (definition).

A semisimple number-field algebra B satisfies Eichler’s condition iff none of its simple components is itself a quaternion division algebra over a totally real centre ramified at every real place. A matrix algebra M_r(D) with r≥2 is allowed even when D is a totally definite quaternion division algebra.

**API.**

- `EichlerCondition.component` (characterisation): The condition is the conjunction of the condition on simple components.
- `EichlerCondition.opposite` (compatibility): B and Bᵒᵖ have the same Eichler condition.
- `EichlerCondition.matrix` (constructor): M_r(B) satisfies the condition for r≥2.
- `EichlerCondition.noncompact` (characterisation): Every nontrivial SL₁ component has a noncompact archimedean factor exactly when this condition holds.

**Checks.**

- `eichler_condition_1` (computation): M₂(ℍ_F) satisfies Eichler’s condition for any totally definite quaternion algebra ℍ_F.
- `eichler_condition_2` (degenerate): Every commutative semisimple algebra satisfies it.
- `eichler_condition_3` (compatibility): For a simple quaternion algebra it means that at least one archimedean place splits or the centre has a complex place.
- `eichler_condition_4` (non-example): A totally definite quaternion division algebra itself fails it.

**Proof route.**

1. Use the Wedderburn components, their centres and real completions. Make the excluded matrix size r=1 explicit. The predicate is invariant under algebra isomorphism and opposite algebra.

**Dependencies:** `tauceti:TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras#layer-6-the-brauer-group-and-splitting-fields`.

**Consumers.**

- [jacobinski-cancellation](#target-jacobinski-cancellation): Record the indispensable cancellation hypothesis.
- [stable-idele-classification](#target-stable-idele-classification): Apply it to matrix algebras, without assuming it for B.

**Sources.**

- [Locally free modules over arithmetic orders](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0274_0275/LOG_0014.pdf), §3 VII, pp.116–117; §5F, p.122. The exceptional components are totally definite quaternion algebras; matrix stabilization removes the exception.

**Acceptance:** Check every API law and all discriminating tests below.

<a id="target-eichler-noncompact-adapter"></a>

### Inner forms meet the strong-approximation hypotheses

**Target:** `ClassicalArithmeticCompletion:CA.7/continuation/eichler-noncompact-adapter` (theorem).

For a central simple C/F of degree d>1, SL₁(C) is connected semisimple and simply connected. Its archimedean product is noncompact unless C is itself a totally definite quaternion division algebra. Consequently, if semisimple B satisfies Eichler’s condition, J(B)′=B×′·(J(B)′∩U(Γ)) for every arithmetic order Γ, including every idele-conjugate order. Trivial field factors are omitted.

**Proof route.**

1. After a splitting field this is SL_d; descend the connected, semisimple and simply connected properties through the inner form. Inspect C⊗ℝ: SL_d(ℝ), SL_d(ℂ), or quaternionic SL_r; the sole compact nontrivial case is r=1 over ℍ. Apply AdelicAlgebraicGroups AA.4 with S the archimedean places and the compact open intersection with Γ-units. The inner-form identification is PRR Proposition2.37: a splitting trivialization gives an inner cocycle in PGL_d and descent of the determinant-one equations. Geometric connectedness and simple connectedness are preserved by this form. Explicit diagonal one-parameter subgroups prove noncompactness in all allowed real or complex matrix cases.

**Dependencies:** [norm-one-group](#target-norm-one-group), [eichler-condition](#target-eichler-condition), `tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups`, `AdelicAlgebraicGroups:AA.4/strong-approximation-theorem`.

**Sources.**

- [Locally free modules over arithmetic orders](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0274_0275/LOG_0014.pdf), §3 VII, Eichler theorem and Lemma1, p.117; J68 Theorem4.1, pp.17–18. Norm-one strong approximation under Eichler’s condition makes every relevant finite adelic double-coset fibre a singleton.
- [Algebraic Groups and Number Theory, Volume I](https://doi.org/10.1017/9781139017756), §2.3.4 Proposition2.37 and proof, pp.100–101. The determinant-one group of a central simple algebra is an inner form of SL_d.

**Acceptance:** For a central simple C/F of degree d>1, SL₁(C) is connected semisimple and simply connected. Its archimedean product is noncompact unless C is itself a totally definite quaternion division algebra. Consequently, if semisimple B satisfies Eichler’s condition, J(B)′=B×′·(J(B)′∩U(Γ)) for every arithmetic order Γ, including every idele-conjugate order. Trivial field factors are omitted.

<a id="target-idele-genus-comparison"></a>

### Rank-one lattices and idele double cosets

**Target:** `ClassicalArithmeticCompletion:CA.7/continuation/idele-genus-comparison` (comparison).

The map α↦I(α) induces a bijection B×\J(B)/U(Λ) with isomorphism classes of locally free rank-one right Λ-lattices. Applied to Λᵒᵖ it gives the left-module version. These are sets of double cosets, not groups.

**Proof route.**

1. Use order-ideles to glue each local basis. A module isomorphism extends over F and is multiplication by a unit of B; local equality of lattices is right multiplication by order units. Conversely each locally free rank-one lattice has a generic B-basis and compatible local unit bases.

**Dependencies:** [order-ideles](#target-order-ideles), [locally-free-lattice](#target-locally-free-lattice).

**Sources.**

- [Locally free modules over arithmetic orders](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0274_0275/LOG_0014.pdf), Theorem1(a), pp.114–115; §5D, p.121. Local bases identify rank-one lattice isomorphism classes with a noncommutative double-coset set.

**Acceptance:** The map α↦I(α) induces a bijection B×\J(B)/U(Λ) with isomorphism classes of locally free rank-one right Λ-lattices. Applied to Λᵒᵖ it gives the left-module version. These are sets of double cosets, not groups.

<a id="target-stable-idele-classification"></a>

### Stable idele classification in every semisimple case

**Target:** `ClassicalArithmeticCompletion:CA.7/continuation/stable-idele-classification` (theorem).

For an arithmetic order Λ in semisimple B, its locally free stable class group is J(B)/(J(B)′ B× U(Λ)). For each m≥2, locally free rank-m lattices are classified by this quotient via their GL_m(B) adelic basis matrices and reduced norms. No decomposition into rank-one ideals is assumed in constructing this classification. No Eichler hypothesis on B is needed. The quotient is abelian and identifies with inherited Cl(Λ) inside projective K₀.

**Proof route.**

1. First classify rank m by GL_m(B)\J(M_m(B))/GL_m(Λ). Semilocal elimination gives the same reduced-norm image for Λ_v× and GL_m(Λ_v). Since M_m(B) satisfies Eichler for m≥2, strong approximation removes its norm-one fibre. The stable equality theorem identifies equal stable classes in SplitK0 with these stabilized isomorphisms. To ensure no loss from the ambient projective K₀ use a finite free complement of every projective stabilization witness.

**Dependencies:** [idele-genus-comparison](#target-idele-genus-comparison), [arithmetic-norm-images](#target-arithmetic-norm-images), [eichler-noncompact-adapter](#target-eichler-noncompact-adapter), [split-k0-stable-equality](#target-split-k0-stable-equality), [finite-projective-free-complement](#target-finite-projective-free-complement), [locally-free-class-group](#target-locally-free-class-group), [semilocal-determinant-stability](#target-semilocal-determinant-stability).

**Dependency facet:** [locally-free-class-group](#target-locally-free-class-group): Only the definition of Cl as the subgroup generated by [M]−n[Λ] inside the existing finite-projective SplitK0. The stable criterion, rank-one representation and comparison APIs are conclusions consuming this continuation, not hypotheses.

**Sources.**

- [Locally free modules over arithmetic orders](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0274_0275/LOG_0014.pdf), Theorem1(b), pp.114–115; §2 II, p.115; §5C–G, pp.121–122. Matrix stabilization gives the abelian stable quotient even in the definite-quaternion case.

**Acceptance:** For an arithmetic order Λ in semisimple B, its locally free stable class group is J(B)/(J(B)′ B× U(Λ)). For each m≥2, locally free rank-m lattices are classified by this quotient via their GL_m(B) adelic basis matrices and reduced norms. No decomposition into rank-one ideals is assumed in constructing this classification. No Eichler hypothesis on B is needed. The quotient is abelian and identifies with inherited Cl(Λ) inside projective K₀.

<a id="target-positive-rank-ideal-splitting"></a>

### Positive-rank locally free lattices split off free summands

**Target:** `ClassicalArithmeticCompletion:CA.7/continuation/positive-rank-ideal-splitting` (theorem).

Every locally free rank-m lattice M over an arithmetic order Λ in a semisimple number-field algebra, with m≥1, is isomorphic to Λᵐ⁻¹⊕I for a locally free rank-one integral one-sided ideal I. For left modules I is a left ideal. The condition m≥1 is essential. This statement does not assume Eichler’s condition.

**Proof route.**

1. For m≥2 use local free bases and a generic B-basis of M to obtain an idele of M_m(B). Choose an idele α of B with the same reduced norm, using the local norm-image theorem componentwise. Glue I(α). The lattices M and Λᵐ⁻¹⊕I(α) have the same norm class in the rank-m classification and are therefore isomorphic. For m=1 glue M directly by its local bases. Clear central denominators to make I integral. This proof uses matrix strong approximation and never invokes a hereditary maximal-order splitting theorem.

**Dependencies:** [stable-idele-classification](#target-stable-idele-classification), [order-ideles](#target-order-ideles), [arithmetic-norm-images](#target-arithmetic-norm-images).

**Sources.**

- [Locally free modules over arithmetic orders](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0274_0275/LOG_0014.pdf), §2 I, p.115; Theorem1 and §5E–G, pp.121–122. Positive-rank lattices are a free part plus one ideal; the proof applies to general semisimple algebras.

**Acceptance:** Every locally free rank-m lattice M over an arithmetic order Λ in a semisimple number-field algebra, with m≥1, is isomorphic to Λᵐ⁻¹⊕I for a locally free rank-one integral one-sided ideal I. For left modules I is a left ideal. The condition m≥1 is essential. This statement does not assume Eichler’s condition.

<a id="target-semisimple-rank-one-class-supplier"></a>

### Idele representatives cover the whole locally free class group

**Target:** `ClassicalArithmeticCompletion:CA.7/continuation/semisimple-rank-one-class-supplier` (theorem).

Every element x of inherited Cl(Λ), including differences of locally free lattice classes, equals [I]−[Λ] for a locally free integral one-sided ideal I of an arithmetic order Λ in any semisimple number-field algebra. The zero class is represented by Λ. A common stabilization produces Λᵐ⁻¹⊕I only at positive total rank.

**Proof route.**

1. Translate each difference to the product/inverse in the abelian stable idele quotient. Choose an idele representative and glue its rank-one lattice; clear denominators. This treats negative classes and zero explicitly, rather than applying a positive-rank theorem to a zero module.

**Dependencies:** [stable-idele-classification](#target-stable-idele-classification), [positive-rank-ideal-splitting](#target-positive-rank-ideal-splitting), [order-ideles](#target-order-ideles), [locally-free-class-group](#target-locally-free-class-group).

**Dependency facet:** [locally-free-class-group](#target-locally-free-class-group): Only the definition of Cl as the subgroup generated by [M]−n[Λ] inside the existing finite-projective SplitK0. The stable criterion, rank-one representation and comparison APIs are conclusions consuming this continuation, not hypotheses.

**Sources.**

- [Locally free modules over arithmetic orders](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0274_0275/LOG_0014.pdf), §2 I–II, p.115; Theorem1, pp.114–115. Rank-one ideals realize all stable locally free classes, independently of cancellation.

**Acceptance:** Every element x of inherited Cl(Λ), including differences of locally free lattice classes, equals [I]−[Λ] for a locally free integral one-sided ideal I of an arithmetic order Λ in any semisimple number-field algebra. The zero class is represented by Λ. A common stabilization produces Λᵐ⁻¹⊕I only at positive total rank.

<a id="target-reduced-norm-fibres"></a>

### The fibre of stable rank-one classification

**Target:** `ClassicalArithmeticCompletion:CA.7/continuation/reduced-norm-fibres` (theorem).

For a right ideal I(α), the fibre of B×\J(B)/U(Λ)→Cl(Λ) above its class is the subset of B×\J(B)/U(αΛα⁻¹) represented by norm-one ideles. In particular, a norm-one approximation decomposition for every conjugate order makes the map injective.

**Proof route.**

1. Represent an equal stable class by β with β α⁻¹ in J(B)′ after changing its principal and unit factors. Translate by α⁻¹, conjugating the unit subgroup. Retain the subset of double cosets with norm-one representatives; do not replace the left action by B×′ without justifying the norm.

**Dependencies:** [stable-idele-classification](#target-stable-idele-classification), [idele-genus-comparison](#target-idele-genus-comparison), [order-ideles](#target-order-ideles), [reduced-norm](#target-reduced-norm).

**Sources.**

- [Locally free modules over arithmetic orders](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0274_0275/LOG_0014.pdf), §3 V–VI, p.116. Cancellation is equivalent to triviality of every norm-one double-coset fibre over a conjugate order.

**Acceptance:** For a right ideal I(α), the fibre of B×\J(B)/U(Λ)→Cl(Λ) above its class is the subset of B×\J(B)/U(αΛα⁻¹) represented by norm-one ideles. In particular, a norm-one approximation decomposition for every conjugate order makes the map injective.

<a id="target-jacobinski-cancellation"></a>

### Jacobinski cancellation under Eichler’s condition

**Target:** `ClassicalArithmeticCompletion:CA.7/continuation/jacobinski-cancellation` (theorem).

Let Λ be an arithmetic order in a semisimple number-field algebra satisfying Eichler’s condition. Locally free left Λ-lattices P,Q of the same rank with [P]=[Q] in projective K₀ are isomorphic. Equivalently, P⊕Λᵏ≅Q⊕Λᵏ implies P≅Q. The rank-zero case is zero. In particular a stably free locally free lattice is free of its given local rank.

**Proof route.**

1. Stable equality reduces to the stable idele quotient. Use positive-rank-ideal-splitting to reduce to rank-one representatives and reduced-norm-fibres. Strong approximation for every conjugate order makes that fibre a singleton. If the common rank is zero, torsion-freeness and a zero generic fibre imply P=Q=0.

**Dependencies:** [split-k0-stable-equality](#target-split-k0-stable-equality), [positive-rank-ideal-splitting](#target-positive-rank-ideal-splitting), [reduced-norm-fibres](#target-reduced-norm-fibres), [eichler-noncompact-adapter](#target-eichler-noncompact-adapter).

**Sources.**

- [Locally free modules over arithmetic orders](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0274_0275/LOG_0014.pdf), §3 VII, p.117; J68 Theorem4.1 and Lemma4.2, pp.17–19. Eichler’s hypothesis converts stable locally free equivalence into actual isomorphism.

**Acceptance:** Let Λ be an arithmetic order in a semisimple number-field algebra satisfying Eichler’s condition. Locally free left Λ-lattices P,Q of the same rank with [P]=[Q] in projective K₀ are isomorphic. Equivalently, P⊕Λᵏ≅Q⊕Λᵏ implies P≅Q. The rank-zero case is zero. In particular a stably free locally free lattice is free of its given local rank.

## Character determinants and the kernel quotient

<a id="target-prescribed-separable-polynomial"></a>

### Local–global realization of separable reduced characteristic polynomials

**Target:** `ClassicalArithmeticCompletion:CA.7/continuation/prescribed-separable-polynomial` (theorem).

Let C/F be central simple of degree d and f∈F[X] monic separable of degree d. There is c∈C with reduced characteristic polynomial f iff every local C_v has such an element; equivalently C splits over F[X]/g for every irreducible factor g of f. For a prescribed nonzero norm a, local witnesses can be chosen regular and their polynomials approximated with the constant coefficient (−1)ᵈa fixed.

**Proof route.**

1. For a separable algebra E=F[X]/f, its embedding in C with total degree d is equivalent to splitting each simple field factor; use simple-module dimension to prove both directions. Apply the global Brauer injectivity theorem over each field factor to convert local splitting into global splitting. Regularize a local norm witness by multiplying generic commutators; nonvanishing of the discriminant is a nonempty open condition over an infinite field. Weak approximation of the remaining polynomial coefficients preserves local finite étale algebra types at the finite set of nonsplit places, by Newton/Krasner stability; at split places use a companion matrix.

**Dependencies:** [reduced-norm](#target-reduced-norm), `tauceti:TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras#layer-6-the-brauer-group-and-splitting-fields`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants`, `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-5-the-global-local-dictionary-at-finite-places`, [reduced-characteristic-polynomial](#target-reduced-characteristic-polynomial).

**Sources.**

- [Lectures on Galois Cohomology of Classical Groups](https://mathweb.tifr.res.in/Documents/Publications/Lectures/tifr47.pdf), §5.4 Proposition and Lemmas a–c, retypeset pp.67–69, original pp.88–91. A separable reduced characteristic polynomial is realizable globally exactly when realizable at every completion, and this proves the global norm theorem.

**Acceptance:** Let C/F be central simple of degree d and f∈F[X] monic separable of degree d. There is c∈C with reduced characteristic polynomial f iff every local C_v has such an element; equivalently C splits over F[X]/g for every irreducible factor g of f. For a prescribed nonzero norm a, local witnesses can be chosen regular and their polynomials approximated with the constant coefficient (−1)ᵈa fixed.

<a id="target-semilocal-determinant-stability"></a>

### Semilocal elimination preserves the determinant image

**Target:** `ClassicalArithmeticCompletion:CA.7/continuation/semilocal-determinant-stability` (theorem).

For a semilocal ring R and n≥1, GL_n(R) is generated by elementary matrices and diagonal matrices with entries in R×. Consequently for a finite-place arithmetic order Λ_v, Nrd(GL_n(Λ_v))=Nrd(Λ_v×). For a semilocal group ring, matrix character-determinant images likewise equal unit character-determinant images.

**Proof route.**

1. Reduce a unimodular row modulo the Jacobson radical to the product of matrix rings over division rings. Elementary column operations make the first entry a unit in every simple quotient; lift them and use the unit criterion modulo the radical. Clear the first column and row and induct on n. Elementary matrices have determinant one in every splitting representation; multiply the diagonal unit determinants.

**Dependencies:** [reduced-norm](#target-reduced-norm).

**Sources.**

- [Locally free modules over arithmetic orders](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0274_0275/LOG_0014.pdf), F75 §5C, p.121; semilocal elimination argument. Semilocal matrix determinants have the same image as units, which is the stabilization input to the class description.

**Acceptance:** For a semilocal ring R and n≥1, GL_n(R) is generated by elementary matrices and diagonal matrices with entries in R×. Consequently for a finite-place arithmetic order Λ_v, Nrd(GL_n(Λ_v))=Nrd(Λ_v×). For a semilocal group ring, matrix character-determinant images likewise equal unit character-determinant images.

<a id="target-determinant-character-hom"></a>

### Determinants indexed by virtual characters

**Target:** `ClassicalArithmeticCompletion:CA.7/continuation/determinant-character-hom` (construction).

For a finite group G and a characteristic-zero coefficient algebra admitting a splitting field E, Det(u)(χ)=det(ρ_χ(u)) for u a group-algebra unit and χ an actual E-character. Extend multiplicatively to the virtual character group R_G, using inverses for negative coefficients. With the valuewise absolute Galois action this is an equivariant homomorphism whenever u is defined over the base field; do not confuse Det(u) with the one-dimensional character detχ of G.

**API.**

- `DeterminantCharacterHom.sum` (structure): Det(u)(χ+θ)=Det(u)(χ)Det(u)(θ).
- `DeterminantCharacterHom.product` (structure): Det(uv)=Det(u)Det(v).
- `DeterminantCharacterHom.galois` (functoriality): Det(u)(χ^ω)=Det(u)(χ)^ω for base-defined u.
- `DeterminantCharacterHom.norm` (compatibility): On irreducible centre coordinates Det is the reduced norm after embedding the centre into the splitting field.
- `DeterminantCharacterHom.induction` (compatibility): For H≤G and u∈E[H]×, Det_G(u)(χ)=Det_H(u)(Res_H χ).

**Checks.**

- `determinant_character_hom_1` (computation): For G=C₂ with generator s, Det(2+s) has values 3 on the trivial character and 1 on the sign character.
- `determinant_character_hom_2` (degenerate): Det(1) is the constant-one homomorphism.
- `determinant_character_hom_3` (compatibility): For G={1}, Det on scalar units is identity.
- `determinant_character_hom_4` (non-example): For scalar a and a character of degree d, Det(a)(χ)=aᵈ, not a.

**Proof route.**

1. Independence of a representation follows from isomorphism invariance and semisimple character classification. Direct sums multiply determinants, giving descent to virtual characters. Galois conjugation acts on the coefficients of the representation, and the reduced-norm splitting identity gives the centre-coordinate interpretation.

**Dependencies:** `tauceti:TauCetiRoadmap/RepresentationTheory/CharacterTheory#layer-3-the-character-table-idempotents-completeness-second-orthogonality`, `tauceti:TauCetiRoadmap/RepresentationTheory/CharacterTheory#layer-4-the-arithmetic-of-character-values`, `tauceti:TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras#layer-6-the-brauer-group-and-splitting-fields`, [reduced-norm](#target-reduced-norm), `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-6-the-virtual-character-ring-artin-and-brauer-induction`.

**Consumers.**

- [character-idele-quotient](#target-character-idele-quotient): Define principal and integral determinant denominators.
- [integral-group-log](#target-integral-group-log): Compare logarithms with character determinants.

**Sources.**

- [Arithmetic and Galois module structure for tame extensions](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0286_0287/LOG_0033.pdf), Appendix I (I.7)–(I.9), pp.427–428; T81 §1, pp.42–44. Unit determinants are virtual-character homomorphisms, equivariant over their field of definition and compatible with reduced norm.

**Acceptance:** Check every API law and all discriminating tests below.

<a id="target-character-idele-quotient"></a>

### The equivariant character-idele quotient

**Target:** `ClassicalArithmeticCompletion:CA.7/continuation/character-idele-quotient` (construction).

For finite G, let J(Q̄)=colim_E J(E), U(Q̄)=colim_E U(E), with U(E) the ideles unit at every finite place and unrestricted at infinity. Define H_G=Hom_Ω(R_G,J(Q̄))/(Hom_Ω(R_G,Q̄×)·Det U(ℤ[G])). Both factors in the denominator are subgroups of the numerator through the diagonal and placewise determinant maps. Use a finite Galois splitting field to realize any given element; the direct limit does not create an independent value at every irreducible orbit.

**API.**

- `CharacterIdeleQuotient.representative` (constructor): An equivariant idele-valued character homomorphism defines a class.
- `CharacterIdeleQuotient.equality` (characterisation): Two representatives agree exactly when their ratio is a product of a principal equivariant homomorphism and an integral-unit determinant.
- `CharacterIdeleQuotient.field_change` (functoriality): Enlarging the finite splitting field leaves the class unchanged.
- `CharacterIdeleQuotient.sum` (structure): Multiplication of representatives gives addition of module classes under the Hom comparison.

**Checks.**

- `character_idele_quotient_1` (computation): For G={1}, H_G is Cl(ℤ)=0.
- `character_idele_quotient_2` (degenerate): The constant-one homomorphism represents zero.
- `character_idele_quotient_3` (compatibility): In a commutative split component this is the usual idele/ideal class quotient with the stated coefficient field.
- `character_idele_quotient_4` (non-example): An arbitrary independently selected value on Galois-conjugate irreducibles need not be Ω-equivariant and is not a representative.

**Proof route.**

1. Build equivariant homomorphisms over a sufficiently large finite field, then take the direct limit. The product of the two denominator subgroups is normal because the ambient character-hom group is abelian. Apply determinant-character-hom and central field-of-values coordinates.

**Dependencies:** [determinant-character-hom](#target-determinant-character-hom), [order-ideles](#target-order-ideles), `tauceti:TauCetiRoadmap/RepresentationTheory/CharacterTheory#layer-4-the-arithmetic-of-character-values`.

**Consumers.**

- [froehlich-hom-description](#target-froehlich-hom-description): Compare the quotient with projective stable classes.
- [positive-unit-kernel](#target-positive-unit-kernel): Identify the maximal-order kernel.

**Sources.**

- [Arithmetic and Galois module structure for tame extensions](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0286_0287/LOG_0033.pdf), Appendix I (I.10) and (I.13), pp.428–429. The locally free class group is represented by character ideles modulo principal character homomorphisms and integral-unit determinants.

**Acceptance:** Check every API law and all discriminating tests below.

<a id="target-froehlich-hom-description"></a>

### Fröhlich’s Hom-description of stable module classes

**Target:** `ClassicalArithmeticCompletion:CA.7/continuation/froehlich-hom-description` (comparison).

There is an additive equivalence Cl(ℤ[G])≅H_G sending [P]−n[ℤ[G]] to Det of the adelic change-of-basis matrix from a rational basis of ℚ⊗P to local integral bases. More generally the coefficient O_F[G] version uses Ω_F. Rational basis change contributes the principal subgroup; local integral basis change contributes Det U(O_F[G]).

**Proof route.**

1. Identify centre units with equivariant character homomorphisms after a splitting field, using determinant-character-hom and reduced norm. Apply the general stable idele classification and arithmetic-norm-images. Weak approximation adjusts archimedean positivity so that the whole principal character-hom subgroup can occur in this all-place quotient. Check the displayed basis matrix orientation against F76 (I.13); matrix determinant stability makes the result independent of rank and bases.

**Dependencies:** [character-idele-quotient](#target-character-idele-quotient), [stable-idele-classification](#target-stable-idele-classification), [arithmetic-norm-images](#target-arithmetic-norm-images), [semilocal-determinant-stability](#target-semilocal-determinant-stability), [locally-free-class-group](#target-locally-free-class-group).

**Dependency facet:** [locally-free-class-group](#target-locally-free-class-group): Only the definition of Cl as the subgroup generated by [M]−n[Λ] inside the existing finite-projective SplitK0. The stable criterion, rank-one representation and comparison APIs are conclusions consuming this continuation, not hypotheses.

**Sources.**

- [Arithmetic and Galois module structure for tame extensions](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0286_0287/LOG_0033.pdf), Appendix I (I.8)–(I.13), pp.427–429; F75 Theorem2, p.118. The centre reduced-norm quotient is exactly the character Hom quotient, with a concrete adelic module-class representative.

**Acceptance:** There is an additive equivalence Cl(ℤ[G])≅H_G sending [P]−n[ℤ[G]] to Det of the adelic change-of-basis matrix from a rational basis of ℚ⊗P to local integral bases. More generally the coefficient O_F[G] version uses Ω_F. Rational basis change contributes the principal subgroup; local integral basis change contributes Det U(O_F[G]).

<a id="target-positive-unit-kernel"></a>

### Positive unit homomorphisms and the kernel group

**Target:** `ClassicalArithmeticCompletion:CA.7/continuation/positive-unit-kernel` (construction).

Let Hom_Ω⁺(R_G,U(Q̄)) mean the homomorphisms whose value on every virtual symplectic character is a positive real number at every archimedean component, including complex places. Set D_H=Hom_Ω⁺(R_G,U(Q̄))/(Hom_Ω⁺(R_G,O_Q̄×)·Det U(ℤ[G])). For S={p:p divides |G|}, this also has the finite-place presentation Hom_Ω(R_G,U_S)/(Hom_Ω⁺(R_G,O_Q̄×)·Det(ℤ_S[G]×)). Positivity remains in the principal denominator; the finite numerator has no archimedean component.

**API.**

- `PositiveUnitKernel.positive` (characterisation): Positivity is required on all virtual symplectic characters; inversion preserves it.
- `PositiveUnitKernel.kernel` (equivalence): D_H identifies with the kernel of extension to any compatible maximal overorder of ℤ[G].
- `PositiveUnitKernel.finite_places` (equivalence): The all-place and S-place presentations give the same class, with the positive algebraic-unit subgroup retained.
- `PositiveUnitKernel.maximal_order` (compatibility): This group is independent of the chosen maximal overorder containing ℤ[G].

**Checks.**

- `positive_unit_kernel_1` (computation): For G={1}, D_H=0.
- `positive_unit_kernel_2` (degenerate): The constant-one representative has the zero class in both presentations.
- `positive_unit_kernel_3` (compatibility): The module-side map is extension-k0-map along the actual inclusion ℤ[G]→Γ; Γ need not equal ℤ[G].
- `positive_unit_kernel_4` (non-example): In the all-place numerator, a value −1 at an infinite component on a symplectic character fails positivity. In the finite S presentation a sign representative is allowed, but arbitrary principal homomorphisms cannot replace the positive denominator.

**Proof route.**

1. Use ramified-real norm positivity to identify maximal-order determinant units with positive unit homomorphisms. Intersect the principal denominator with unit ideles: this gives algebraic units, with positive values on symplectic characters. Eliminate the infinite components and the finite places outside S by weak approximation and maximality there, retaining positivity in the diagonal algebraic-unit denominator.

**Dependencies:** [froehlich-hom-description](#target-froehlich-hom-description), [arithmetic-norm-images](#target-arithmetic-norm-images), `tauceti:TauCetiRoadmap/RepresentationTheory/CharacterTheory#layer-7-the-frobenius-schur-indicator-and-realquaternionic-type`, [locally-free-class-group](#target-locally-free-class-group), [extension-k0-map](#target-extension-k0-map), [maximal-order](#target-maximal-order).

**Dependency facet:** [locally-free-class-group](#target-locally-free-class-group): Only the definition of Cl as the subgroup generated by [M]−n[Λ] inside the existing finite-projective SplitK0. The stable criterion, rank-one representation and comparison APIs are conclusions consuming this continuation, not hypotheses.

**Consumers.**

- [root-number-class](#target-root-number-class): Construct the root-number obstruction class.
- [froehlich-kernel-membership](#target-froehlich-kernel-membership): Prove the tame integral class lies in this kernel.

**Sources.**

- [Arithmetic and Galois module structure for tame extensions](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0286_0287/LOG_0033.pdf), Appendix II (II.1)–(II.2), p.430; T81 (2.1), p.44. The kernel admits both a positive all-place unit quotient and an S-unit quotient with a positive principal denominator.

**Acceptance:** Check every API law and all discriminating tests below.

<a id="target-kernel-hom-comparison"></a>

### The Hom quotient is the actual maximal-order kernel

**Target:** `ClassicalArithmeticCompletion:CA.7/continuation/kernel-hom-comparison` (theorem).

For every maximal overorder Γ⊇ℤ[G] in ℚ[G] with its canonical compatible inclusion, ker(Cl(ℤ[G])→Cl(Γ))≅D_H, through froehlich-hom-description. The result is independent of Γ. Extension, rather than unrestricted restriction of modules, is the scalar functor defining the map.

**Proof route.**

1. The maximal-order norm-unit image at finite places is the full centre unit group, and its real image imposes positivity on the quaternionic/symplectic coordinates. The kernel of the resulting quotient map is represented by positive unit ideles. Intersect principal representatives with that subgroup exactly as in positive-unit-kernel.

**Dependencies:** [positive-unit-kernel](#target-positive-unit-kernel), [locally-free-scalar-compatibility](#target-locally-free-scalar-compatibility), [froehlich-hom-description](#target-froehlich-hom-description), [arithmetic-norm-images](#target-arithmetic-norm-images), [maximal-order](#target-maximal-order).

**Sources.**

- [Arithmetic and Galois module structure for tame extensions](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0286_0287/LOG_0033.pdf), Appendix II (II.1)–(II.3), p.430; F75 §4 IX and Theorem2, p.118. The character-unit quotient is precisely the compatible maximal-order extension kernel, not the kernel of an arbitrary ring map.

**Acceptance:** For every maximal overorder Γ⊇ℤ[G] in ℚ[G] with its canonical compatible inclusion, ker(Cl(ℤ[G])→Cl(Γ))≅D_H, through froehlich-hom-description. The result is independent of Γ. Extension, rather than unrestricted restriction of modules, is the scalar functor defining the map.

<a id="target-norm-resolvent"></a>

### Absolute and relative norm resolvents

**Target:** `ClassicalArithmeticCompletion:CA.7/continuation/norm-resolvent` (construction).

For a G-Galois number-field extension L/F and normal generator a, form r_G(a)=∑g∈G g(a)g⁻¹∈L[G]× and (a|χ)=Det(r_G(a))(χ). For absolute ℤ[G] classes apply the character-hom norm N_F/ℚ: (N f)(χ)=∏ω f(χ^{ω⁻¹})^ω, over a right transversal of Ω_F in Ω_ℚ. Use the same construction on semilocal integral generators a_v and take their ratio against a rational normal generator. The absolute integer-ring rank is [F:ℚ], not one unless F=ℚ.

**API.**

- `NormResolvent.basis_change` (compatibility): Changing a local integral normal generator multiplies its resolvent by an integral group-ring unit and its character function by that determinant.
- `NormResolvent.character_sum` (structure): (a|χ+θ)=(a|χ)(a|θ).
- `NormResolvent.transversal` (characterisation): Different embedding transversals change the absolute representative by Det of a group element, hence give the same class.
- `NormResolvent.class` (compatibility): Local norm-resolvent divided by rational norm-resolvent represents [O_L]−[F:ℚ][ℤ[G]].

**Checks.**

- `norm_resolvent_1` (computation): For G={1}, the resolvent is a and the absolute norm is the product of its F-embeddings.
- `norm_resolvent_2` (degenerate): For a trivial coefficient extension F=ℚ, the embedding product has one factor.
- `norm_resolvent_3` (compatibility): On a one-dimensional character the determinant resolvent is the inherited Lagrange resolvent with inverse-group convention.
- `norm_resolvent_4` (non-example): For nonabelian G, scalar field-norming each coefficient is not the character-hom norm; the character must also be transported by each embedding.

**Proof route.**

1. Normal-basis invertibility supplies the resolvent unit. Representation determinants supply character additivity and the twisted Galois rule. Norming the homomorphism over embeddings makes the absolute representative; a transversal change differs by a group determinant, so only its quotient class is canonical. The ratio of local and rational norm resolvents is the adelic basis matrix determinant.

**Dependencies:** [rational-normal-basis-map](#target-rational-normal-basis-map), [resolvend-invertibility](#target-resolvend-invertibility), [determinant-character-hom](#target-determinant-character-hom), [froehlich-hom-description](#target-froehlich-hom-description), [restriction-k0-map](#target-restriction-k0-map).

**Consumers.**

- [resolvent-gauss-valuation](#target-resolvent-gauss-valuation): Compare local valuations.
- [norm-resolvent-determinant](#target-norm-resolvent-determinant): Supply Taylor’s tame local determinant factor.

**Sources.**

- [Arithmetic and Galois module structure for tame extensions](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0286_0287/LOG_0033.pdf), §1 (1.1), Propositions1.3–1.5 and Theorem1, pp.384–388; Appendix VI Propositions1–4, pp.434–436; T81 (2.2), p.44. Local/rational resolvent ratios describe relative module classes, and the embedding-product norm describes their absolute ℤ[G] classes.

**Acceptance:** Check every API law and all discriminating tests below.

## Gauss sums, resolvends and symplectic signs

<a id="target-reduced-characteristic-polynomial"></a>

### Reduced characteristic polynomials

**Target:** `ClassicalArithmeticCompletion:CA.7/continuation/reduced-characteristic-polynomial` (construction).

For a central simple C/F of degree d, rchar_C(c) is the degree-d monic polynomial that becomes det(TI−ρ(c)) in any splitting representation C⊗E≅M_d(E). For semisimple B use one polynomial in each centre. The constant coefficient is (−1)ᵈ Nrd(c).

**API.**

- `ReducedCharacteristicPolynomial.monic` (structure): rchar_C(c) is monic of degree d.
- `ReducedCharacteristicPolynomial.split` (compatibility): Under a splitting isomorphism it is the usual matrix characteristic polynomial.
- `ReducedCharacteristicPolynomial.constant` (characterisation): Its constant coefficient is (−1)ᵈNrd(c).
- `ReducedCharacteristicPolynomial.conjugation` (simp): Conjugating c by a unit does not change rchar_C(c).

**Checks.**

- `reduced_characteristic_polynomial_1` (computation): For C=M₂(F) and c=diag(a,b), rchar=(T−a)(T−b).
- `reduced_characteristic_polynomial_2` (degenerate): For C=F the polynomial is T−c.
- `reduced_characteristic_polynomial_3` (non-example): For a scalar c in degree d the polynomial is (T−c)ᵈ, not T−c.
- `reduced_characteristic_polynomial_4` (compatibility): The constant term agrees with the reduced-norm construction including the parity sign.

**Proof route.**

1. The determinant polynomial is invariant under inner change of a splitting representation and Galois descent, so its coefficients lie in the centre. Descent and faithful extension give independence of the splitting field.

**Dependencies:** `tauceti:TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras#layer-6-the-brauer-group-and-splitting-fields`, [reduced-norm](#target-reduced-norm).

**Consumers.**

- [prescribed-separable-polynomial](#target-prescribed-separable-polynomial): Hold the norm fixed while approximating the other coefficients.

**Sources.**

- [Algebraic Groups and Number Theory, Volume I](https://doi.org/10.1017/9781139017756), §1.4.1, reduced norm and reduced characteristic polynomial, pp.29–30. Splitting matrix characteristic polynomials descend to the centre and recover the reduced norm.

**Acceptance:** Check every API law and all discriminating tests below.

<a id="target-resolvend-invertibility"></a>

### Normal bases and invertible resolvents

**Target:** `ClassicalArithmeticCompletion:CA.7/continuation/resolvend-invertibility` (theorem).

For a finite G-Galois algebra E/F and a∈E, the F[G]-map sending g to g(a) is bijective iff r_G(a)=Σg g(a)g⁻¹ is a unit in E[G]. Over a DVR, an integral resolvent is a unit in O_E[G] iff the integral algebra is étale and a is an integral normal-basis generator; this integral-unit criterion is not asserted for ramified tame extensions.

**Proof route.**

1. After scalar extension to a splitting field the regular multiplication matrix of the resolvent is the normal-basis conjugate matrix up to row and column permutations. A nonzero determinant is exactly bijectivity over the field. Over the integral ring invertibility is equivalent to a unit determinant, which is the discriminant criterion for the basis and étaleness.

**Dependencies:** [rational-normal-basis-map](#target-rational-normal-basis-map), [normal-integral-basis](#target-normal-integral-basis).

**Sources.**

- [Arithmetic and Galois module structure for tame extensions](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0286_0287/LOG_0033.pdf), §1 Proposition1.2, pp.385–386. Field resolvent invertibility detects normal bases; integral invertibility has the extra unramified condition.

**Acceptance:** For a finite G-Galois algebra E/F and a∈E, the F[G]-map sending g to g(a) is bijective iff r_G(a)=Σg g(a)g⁻¹ is a unit in E[G]. Over a DVR, an integral resolvent is a unit in O_E[G] iff the integral algebra is étale and a is an integral normal-basis generator; this integral-unit criterion is not asserted for ramified tame extensions.

<a id="target-finite-gauss-valuation"></a>

### Stickelberger’s finite Gauss-sum valuation

**Target:** `ClassicalArithmeticCompletion:CA.7/continuation/finite-gauss-valuation` (theorem).

Let q=pᶠ, P be a prime above p in Q(ζ_p,ζ_(q−1)), ω the Teichmüller character for its residue F_q, and ψ(x)=ζ_p^Tr(x). If 0≤a<q−1 has digits a_i, put s=Σa_i and h=∏a_i!. Then h·(−gaussSum(ω⁻ᵃ,ψ))≡(ζ_p−1)ˢ mod Pˢ⁺¹. Thus v_P(gaussSum)=s when v_P(ζ_p−1)=1, and the valuation with v_p(p)=1 is s/(p−1). The trivial-character case a=0 has valuation zero.

**Proof route.**

1. Expand normalized Jacobi sums modulo P using finite-field power sums; only the congruent exponents survive. Comparing coefficients in (1+ΣX_i)^m in characteristic p gives the digitwise multinomial congruence. Prove the a=1 base case directly: expand ζ_p^Tr(x) modulo (ζ_p−1)² and use Σx≠0 x⁻¹Tr(x)=−1 in F_q; this replaces Conrad’s unread Washington reference. Apply the two-Gauss double-sum identity to Jacobi sums, induct through the one-digit exponents, and use invariance under Frobenius to assemble the digits. The leading factorial is a unit, so the congruence gives the exact valuation.

**Dependencies:** `mathlib:gaussSum`, `mathlib:gaussSum_mul`, `mathlib:gaussSum_one_left`.

**Sources.**

- [Jacobi sums and Stickelberger’s congruence](https://kconrad.math.uconn.edu/articles/jacobistick.pdf), Theorem1, p.2; Theorem2 and coefficient congruences C1–C2, pp.3–4; proof of Theorem1, p.5. The first nonzero term of the normalized Gauss sum has digit-sum order and reciprocal digit factorial coefficient.

**Acceptance:** Let q=pᶠ, P be a prime above p in Q(ζ_p,ζ_(q−1)), ω the Teichmüller character for its residue F_q, and ψ(x)=ζ_p^Tr(x). If 0≤a<q−1 has digits a_i, put s=Σa_i and h=∏a_i!. Then h·(−gaussSum(ω⁻ᵃ,ψ))≡(ζ_p−1)ˢ mod Pˢ⁺¹. Thus v_P(gaussSum)=s when v_P(ζ_p−1)=1, and the valuation with v_p(p)=1 is s/(p−1). The trivial-character case a=0 has valuation zero.

<a id="target-finite-gauss-product"></a>

### The Hasse–Davenport product relation

**Target:** `ClassicalArithmeticCompletion:CA.7/continuation/finite-gauss-product` (theorem).

For F_q, a nontrivial additive character ψ, n≥1 dividing q−1, a multiplicative character λ of exact order n and any multiplicative χ (all extended by zero at zero), write g(θ)=gaussSum(θ,ψ). Then g(χⁿ)·∏_(j=1)^(n−1)g(λʲ)=χ(n)ⁿ·∏_(j=0)^(n−1)g(χλʲ). The trivial multiplicative character has g(1)=−1, so including j=0 in the left product changes the sign.

**Proof route.**

1. Reduce ψ to the trace-normalized additive character by the pinned scaling formula. Compare valuations and leading residues by finite-gauss-valuation and digit-factorial multiplication. The ratio has unit valuations and all complex conjugates of absolute value one, hence is a root of unity. Its leading residue fixes its prime-to-p part. The remaining p-power root-of-unity ambiguity must also be removed: this is the exact unread proof boundary G-DH, not an inference from valuations alone.

**Dependencies:** `mathlib:gaussSum`, `mathlib:gaussSum_one_left`, `mathlib:gaussSum_mulShift_eq`, [finite-gauss-valuation](#target-finite-gauss-valuation).

**Sources.**

- [Gauss and Jacobi sums on finite fields and Z/mZ](https://kconrad.math.uconn.edu/blurbs/gradnumthy/Gauss-Jacobi-sums.pdf), Appendix formula(A.6) and its normalization note, p.19. The product formula includes the factor χ(n)ⁿ and excludes the trivial-character Gauss sum from the fixed product.

**Acceptance:** For F_q, a nontrivial additive character ψ, n≥1 dividing q−1, a multiplicative character λ of exact order n and any multiplicative χ (all extended by zero at zero), write g(θ)=gaussSum(θ,ψ). Then g(χⁿ)·∏_(j=1)^(n−1)g(λʲ)=χ(n)ⁿ·∏_(j=0)^(n−1)g(χλʲ). The trivial multiplicative character has g(1)=−1, so including j=0 in the left product changes the sign.

<a id="target-tame-local-gauss-sum"></a>

### Tame local Galois Gauss sums

**Target:** `ClassicalArithmeticCompletion:CA.7/continuation/tame-local-gauss-sum` (construction).

Fix a finite extension F/Q_p, ψ_F=exp(2πi·Tr_F/Q_p(−)) with the usual rational p-adic additive character, and the local Artin convention of ClassFieldTheory. For a ramified one-dimensional finite-order character χ of conductor ideal fχ choose c generating D_F/Q_p·fχ and set τ_F(χ)=Σ_(u∈(O_F/fχ)×) χ(Art_F(u/c))ψ_F(u/c). For unramified χ set τ_F(χ)=χ(D_F/Q_p)⁻¹. Extend multiplicatively to virtual characters using the local-constant induction rule with its degree correction, and form the global finite product τ(χ). Independence and existence of this extension require G-LOCALCONSTANTS.

**API.**

- `TameLocalGaussSum.virtual` (structure): τ(χ+θ)=τ(χ)τ(θ), and τ(−χ)=τ(χ)⁻¹.
- `TameLocalGaussSum.unramified` (simp): For an unramified one-dimensional character τ_F(χ)=χ(D_F/Q_p)⁻¹.
- `TameLocalGaussSum.induction_zero` (compatibility): τ_F(Ind_E/F θ)=τ_E(θ) for virtual θ of degree zero; arbitrary degree has the local-constant correction.
- `TameLocalGaussSum.finite_field` (compatibility): A tame ramified degree-one sum is a finite-field Gauss sum multiplied by the stated χ(c⁻¹) factor.

**Checks.**

- `tame_local_gauss_sum_1` (degenerate): The zero virtual character has τ=1.
- `tame_local_gauss_sum_2` (computation): For F=Q_p and trivial χ, the different is the unit ideal and τ=1.
- `tame_local_gauss_sum_3` (compatibility): For a tame nontrivial residue character the valuation agrees with finite-gauss-valuation, with the local normalization converted explicitly.
- `tame_local_gauss_sum_4` (non-example): A ramified Gauss sum need not be a p-adic unit; a trivial local Artin character does not have τ=−1.

**Proof route.**

1. For degree one the conductor determines a finite sum independent of lifts; a change of generator is cancelled by character and additive-character reindexing. Import local Artin and conductor carriers. To extend beyond degree one use Brauer induction and the local-constant induction factor, checking all relations rather than choosing a Brauer expression arbitrarily. The unread relation/induction proof is explicitly G-LOCALCONSTANTS.

**Dependencies:** `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`, `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-6-the-virtual-character-ring-artin-and-brauer-induction`, `mathlib:gaussSum`.

**Consumers.**

- [symplectic-root-sign](#target-symplectic-root-sign): Normalize the root sign.
- [resolvent-gauss-valuation](#target-resolvent-gauss-valuation): Compare ramified valuations.
- [adjusted-gauss-sum](#target-adjusted-gauss-sum): Remove the unramified character factors.

**Sources.**

- [Arithmetic and Galois module structure for tame extensions](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0286_0287/LOG_0033.pdf), §2 (2.10)–(2.16), pp.391–393; Theorem3, p.392. The one-dimensional local formula, unramified normalization and degree-zero induction determine the Gauss homomorphism.

**Acceptance:** Check every API law and all discriminating tests below.

<a id="target-gauss-galois-compatibility"></a>

### Gauss sums have the resolvent Galois transformation law

**Target:** `ClassicalArithmeticCompletion:CA.7/continuation/gauss-galois-compatibility` (theorem).

For a finite G-Galois extension L/F, the character-hom quotient of a norm resolvent by τ is equivariant under absolute Galois action; the cocycle from conjugating the p-power roots of unity is the determinant of the corresponding local Artin element. Inflation preserves τ, and induction is compatible on degree-zero virtual characters. The statement uses the additive-character and Artin convention fixed above.

**Proof route.**

1. In the one-dimensional sum, transport all roots of unity and then reindex the residue units by the cyclotomic multiplier. This isolates a determinant character value of the local Artin symbol. Extend through the relation-checked local-constant formalism. Apply the same character transport to the resolvent, where the group element changes its determinant by the inverse factor.

**Dependencies:** [tame-local-gauss-sum](#target-tame-local-gauss-sum), [norm-resolvent](#target-norm-resolvent), `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`, `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-6-the-virtual-character-ring-artin-and-brauer-induction`.

**Sources.**

- [Arithmetic and Galois module structure for tame extensions](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0286_0287/LOG_0033.pdf), Theorem3 and the preceding transformation formulas, pp.391–393. The Gauss and resolvent Galois factors cancel in their quotient.

**Acceptance:** For a finite G-Galois extension L/F, the character-hom quotient of a norm resolvent by τ is equivariant under absolute Galois action; the cocycle from conjugating the p-power roots of unity is the determinant of the corresponding local Artin element. Inflation preserves τ, and induction is compatible on degree-zero virtual characters. The statement uses the additive-character and Artin convention fixed above.

<a id="target-resolvent-gauss-valuation"></a>

### Tame norm resolvents and Gauss sums have equal finite valuations

**Target:** `ClassicalArithmeticCompletion:CA.7/continuation/resolvent-gauss-valuation` (theorem).

If L/F is a tame G-Galois local extension and a is an integral normal-basis generator, then every character value of the absolute norm resolvent N_F/Q_p(a|χ) has the same p-adic valuation as τ_F(χ). The assertion includes virtual characters and the coefficient-field embedding norm; valuations may be nonzero.

**Proof route.**

1. Use degree-zero Brauer induction and twists to reduce to a tame abelian extension after an unramified scalar extension. For a cyclic Kummer extension of inertia degree e, the eigenresolvent valuation is the least nonnegative residue t/e. Compare the residue Gauss valuation using finite-gauss-valuation and its fractional-parts form. Unramified characters have zero valuation; multiplying a normal generator by a group-ring unit leaves these valuations unchanged.

**Dependencies:** [norm-resolvent](#target-norm-resolvent), [tame-local-gauss-sum](#target-tame-local-gauss-sum), [finite-gauss-valuation](#target-finite-gauss-valuation), `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-6-the-virtual-character-ring-artin-and-brauer-induction`, [local-noether](#target-local-noether).

**Sources.**

- [Arithmetic and Galois module structure for tame extensions](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0286_0287/LOG_0033.pdf), Theorem4, pp.393–394; §§6–7, Theorem8 and formula(7.9), pp.401–409. Tame resolvent and Gauss factors have matching local valuations, by Kummer reduction and Stickelberger’s valuation.

**Acceptance:** If L/F is a tame G-Galois local extension and a is an integral normal-basis generator, then every character value of the absolute norm resolvent N_F/Q_p(a|χ) has the same p-adic valuation as τ_F(χ). The assertion includes virtual characters and the coefficient-field embedding norm; valuations may be nonzero.

<a id="target-symplectic-root-sign"></a>

### Symplectic Artin root signs

**Target:** `ClassicalArithmeticCompletion:CA.7/continuation/symplectic-root-sign` (construction).

For a global actual character χ set W∞(χ)=∏_(v infinite)i^(−n₋(χ,v)), with n₋ the multiplicity of the negative conjugation eigenspace, and define the algebraic root factor W(χ)=(Nfχ)¹ᐟ²/(τ(χ)W∞(χ)), using the positive real square root. This equals the Artin functional-equation root factor by F76 (2.4)–(2.5). Define W_G on irreducibles to be this value on symplectic irreducibles and 1 on all others, and extend multiplicatively to R_G.

**API.**

- `SymplecticRootSign.irreducible` (characterisation): On a symplectic irreducible use the normalized root factor; on every other irreducible use 1.
- `SymplecticRootSign.virtual` (structure): W_G(χ+θ)=W_G(χ)W_G(θ).
- `SymplecticRootSign.archimedean` (data): W∞(χ)=∏i^(−n₋); the positive square root is part of the normalization.
- `SymplecticRootSign.functional_equation` (compatibility): Under the standard completed Artin equation W(χ) is its root factor, as in F76 (2.4).

**Checks.**

- `symplectic_root_sign_1` (degenerate): W_G(0)=1 and the trivial-group root homomorphism is one.
- `symplectic_root_sign_2` (non-example): A non-symplectic irreducible with a nontrivial analytic root factor still has W_G-value 1.
- `symplectic_root_sign_3` (compatibility): For symplectic χ the formula W(χ)τ(χ)=(Nfχ)¹ᐟ²W∞(χ)⁻¹ fixes the sign convention.
- `symplectic_root_sign_4` (computation): For an odd-order group every irreducible is non-symplectic, so W_G is one.

**Proof route.**

1. Import the Frobenius–Schur classification, local conductors and conjugation eigenspaces. The inverse Gauss formula fixes the convention without a complex-conjugation guess. The local/global symplectic duality identities give signs and tame Galois invariance via symplectic-root-sign-law. Comparison with analytic Artin functional equations is the explicit G-ARTIN boundary; the algebraic definition does not depend on having formalized Artin L-functions.

**Dependencies:** [tame-local-gauss-sum](#target-tame-local-gauss-sum), `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`, `tauceti:TauCetiRoadmap/RepresentationTheory/CharacterTheory#layer-7-the-frobenius-schur-indicator-and-realquaternionic-type`, `tauceti:TauCetiRoadmap/RepresentationTheory/CharacterTheory#layer-4-the-arithmetic-of-character-values`.

**Consumers.**

- [root-number-class](#target-root-number-class): Put the signs into the positive-denominator kernel quotient.
- [froehlich-taylor-equality](#target-froehlich-taylor-equality): Identify the entire integer-ring class.

**Sources.**

- [Arithmetic and Galois module structure for tame extensions](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0286_0287/LOG_0033.pdf), §2 (2.4)–(2.5), p.390; §8 Theorem9, p.410. The root factor uses the inverse Gauss sum and inverse infinite factor; tame symplectic root numbers are rational signs.

**Acceptance:** Check every API law and all discriminating tests below.

<a id="target-symplectic-root-sign-law"></a>

### Tame symplectic root factors are equivariant signs

**Target:** `ClassicalArithmeticCompletion:CA.7/continuation/symplectic-root-sign-law` (theorem).

For a tame G-Galois number-field extension and a symplectic character χ, W(χ)∈{1,−1} and W(χ^ω)=W(χ) for every absolute Galois ω. Thus W_G is an equivariant character homomorphism with W_G²=1. Tameness belongs to the Galois-invariance assertion.

**Proof route.**

1. Self-duality and the local-constant duality law give W(χ)²=1. Use determinant-one symplectic characters to remove the cyclotomic Galois factor. In the tame case the finite valuation and sign calculations of F76 §8 show that conjugation does not change the resulting sign. These calculations require the exact local-constant formalism boundary already recorded, not just complex absolute values.

**Dependencies:** [symplectic-root-sign](#target-symplectic-root-sign), [gauss-galois-compatibility](#target-gauss-galois-compatibility), [resolvent-gauss-valuation](#target-resolvent-gauss-valuation), `tauceti:TauCetiRoadmap/RepresentationTheory/CharacterTheory#layer-7-the-frobenius-schur-indicator-and-realquaternionic-type`.

**Sources.**

- [Arithmetic and Galois module structure for tame extensions](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0286_0287/LOG_0033.pdf), §8 Theorem9 and its proof, p.410. Tame symplectic root numbers are Galois-invariant rational signs.

**Acceptance:** For a tame G-Galois number-field extension and a symplectic character χ, W(χ)∈{1,−1} and W(χ^ω)=W(χ) for every absolute Galois ω. Thus W_G is an equivariant character homomorphism with W_G²=1. Tameness belongs to the Galois-invariance assertion.

<a id="target-root-number-class"></a>

### The root-number class in the kernel group

**Target:** `ClassicalArithmeticCompletion:CA.7/continuation/root-number-class` (construction).

For tame L/F with group G define t(W) as the class of the finite-S sign homomorphism W_G in D_H, for S containing the primes dividing |G|. In the all-place presentation use W_G at finite places and the constant positive value 1 at infinite places. The finite numerator permits negative signs; the diagonal algebraic-unit denominator retains its positivity requirement.

**API.**

- `RootNumberClass.representative` (constructor): The finite-S root-sign homomorphism defines t(W).
- `RootNumberClass.two_torsion` (structure): 2t(W)=0 because W_G²=1.
- `RootNumberClass.no_symplectic` (simp): If G has no symplectic irreducible, t(W)=0.
- `RootNumberClass.hom_comparison` (compatibility): Under the kernel/Hom comparison t(W) is the specified positive-unit class, not the class of a negative infinite representative.

**Checks.**

- `root_number_class_1` (degenerate): The trivial extension has t(W)=0.
- `root_number_class_2` (computation): Every odd-order group has t(W)=0.
- `root_number_class_3` (non-example): Using the same negative symplectic sign at infinity fails the all-place positive numerator condition.
- `root_number_class_4` (compatibility): Squaring any sign representative gives the constant-one homomorphism, hence the zero class.

**Proof route.**

1. Symplectic-root-sign-law gives the required equivariance and finite-unit condition. The positive-unit-kernel equivalence transfers the finite representative to an all-place positive one. Enlarge S only through the canonical quotient comparison.

**Dependencies:** [symplectic-root-sign-law](#target-symplectic-root-sign-law), [positive-unit-kernel](#target-positive-unit-kernel).

**Consumers.**

- [froehlich-taylor-equality](#target-froehlich-taylor-equality): State the obstruction equality.
- [taylor-class-of-order-two](#target-taylor-class-of-order-two): Obtain the order-two corollary.

**Sources.**

- [On Fröhlich’s conjecture for rings of integers of tame extensions](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0063/LOG_0010.pdf), §§1–2, Theorem1 and quotient(2.1), pp.41–44; F76 Appendix II, p.430. The symplectic sign homomorphism defines a canonical kernel-group class.

**Acceptance:** Check every API law and all discriminating tests below.

<a id="target-froehlich-kernel-membership"></a>

### The tame integer-ring class lies in the maximal-order kernel

**Target:** `ClassicalArithmeticCompletion:CA.7/continuation/froehlich-kernel-membership` (theorem).

For tame L/F with finite Galois group G, c=[O_L]−[F:Q][Z[G]] lies in D(Z[G]). Choose a∈O_L generating a normal integral basis at every place of F above S={ℓ:ℓ divides |G|}, and let A be its embedding-product norm resolvend. In the S-place positive-unit quotient, u=Det(A)·W_G·τ⁻¹ represents c. The associated all-place representative uses the archimedean positivity adjustment. This is kernel membership; equality c=t(W) needs the additional determinant theorems.

**Proof route.**

1. The finite valuations cancel by resolvent-gauss-valuation and the norm-resolvent class formula. At infinite places the symplectic determinant positivity is corrected by the normalized root signs and the infinite factors, using F76 Theorem10. Apply kernel-hom-comparison.

**Dependencies:** [norm-resolvent](#target-norm-resolvent), [resolvent-gauss-valuation](#target-resolvent-gauss-valuation), [symplectic-root-sign-law](#target-symplectic-root-sign-law), [kernel-hom-comparison](#target-kernel-hom-comparison), [ring-of-integers-class](#target-ring-of-integers-class).

**Dependency facet:** [ring-of-integers-class](#target-ring-of-integers-class): Only the relative/absolute class definitions and fixed rank; not the kernel-membership or Taylor conclusions.

**Sources.**

- [Arithmetic and Galois module structure for tame extensions](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0286_0287/LOG_0033.pdf), Theorems10–11 and formula(9.4), pp.411–413; T81 (2.2), p.44. The local integral class is a positive unit Hom class, represented by the Gauss-corrected resolvent.

**Acceptance:** For tame L/F with finite Galois group G, c=[O_L]−[F:Q][Z[G]] lies in D(Z[G]). Choose a∈O_L generating a normal integral basis at every place of F above S={ℓ:ℓ divides |G|}, and let A be its embedding-product norm resolvend. In the S-place positive-unit quotient, u=Det(A)·W_G·τ⁻¹ represents c. The associated all-place representative uses the archimedean positivity adjustment. This is kernel membership; equality c=t(W) needs the additional determinant theorems.

## Logarithms, determinant descent and the obstruction equality

<a id="target-adjusted-gauss-sum"></a>

### Adjusted tame Gauss homomorphisms

**Target:** `ClassicalArithmeticCompletion:CA.7/continuation/adjusted-gauss-sum` (construction).

For a tame local G-extension at p, choose the root-of-unity homomorphism y_p on characters specified by the unramified quotient and a local Artin element c_p. Put τ_p*=τ_p·y_p⁻¹·Det(c_p). The choices are recorded before taking determinant quotients. Taylor’s normalization makes τ_p*(χ)=−1 for an unramified one-dimensional χ, unlike the ordinary τ_p normalization. The y_p values are 1 on symplectic characters.

**API.**

- `AdjustedGaussSum.formula` (characterisation): τ_p*=τ_p y_p⁻¹ Det(c_p).
- `AdjustedGaussSum.unramified` (simp): For unramified degree-one χ, τ_p*(χ)=−1.
- `AdjustedGaussSum.symplectic` (compatibility): The y_p correction is one on symplectic characters, so its root-number-class contribution is zero.
- `AdjustedGaussSum.outside_p` (data): For ℓ≠p the character values of τ_p* are ℓ-adic units.

**Checks.**

- `adjusted_gauss_sum_1` (computation): On the trivial local character the adjusted value is −1, while ordinary τ over Q_p is 1.
- `adjusted_gauss_sum_2` (degenerate): The zero virtual character has adjusted value 1.
- `adjusted_gauss_sum_3` (non-example): The adjustment is not the ordinary Gauss homomorphism even for unramified characters.
- `adjusted_gauss_sum_4` (compatibility): Multiplying by Det(c_p) changes no integral-unit determinant quotient whenever c_p is an integral group element.

**Proof route.**

1. Use Taylor’s unramified correction on each character and the Artin determinant factor. Verify compatibility with degree-zero induction and Galois conjugation using gauss-galois-compatibility. At ℓ≠p the resulting factors are ℓ-adic units; at ℓ=p their valuations are the ordinary Gauss valuations.

**Dependencies:** [tame-local-gauss-sum](#target-tame-local-gauss-sum), [gauss-galois-compatibility](#target-gauss-galois-compatibility), [determinant-character-hom](#target-determinant-character-hom).

**Consumers.**

- [gauss-log-image](#target-gauss-log-image): Control logarithms on inertia characters.
- [gauss-determinant](#target-gauss-determinant): Construct the off-diagonal determinant factors.

**Sources.**

- [On Fröhlich’s conjecture for rings of integers of tame extensions](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0063/LOG_0010.pdf), §3 definitions(3.1)–(3.9), Proposition3.10, pp.45–50. The adjusted Gauss homomorphism removes unramified factors and has controlled equivariance and modular behavior.

**Acceptance:** Check every API law and all discriminating tests below.

<a id="target-adams-character-operation"></a>

### The p-th Adams operation on virtual characters

**Target:** `ClassicalArithmeticCompletion:CA.7/continuation/adams-character-operation` (construction).

For finite G and prime p, ψᵖ:R_G→R_G is the integral additive operation whose character function is (ψᵖχ)(g)=χ(gᵖ). Construct it using the Newton polynomial in exterior powers of an actual representation, then extend to the virtual character ring. It is not required to preserve irreducibility or positivity.

**API.**

- `AdamsCharacterOperation.evaluation` (characterisation): (ψᵖχ)(g)=χ(gᵖ).
- `AdamsCharacterOperation.ring` (structure): ψᵖ is a unital ring endomorphism of R_G.
- `AdamsCharacterOperation.degree` (simp): ψᵖ preserves degree.
- `AdamsCharacterOperation.one_dimensional` (simp): For a degree-one χ, ψᵖχ=χᵖ.

**Checks.**

- `adams_character_operation_1` (computation): For G=C_p and nontrivial degree-one χ, ψᵖχ is the trivial character.
- `adams_character_operation_2` (degenerate): For G={1}, ψᵖ is identity.
- `adams_character_operation_3` (non-example): For G=C₂ and p=2, the sign character maps to the trivial character, so ψ² is not identity.
- `adams_character_operation_4` (compatibility): Under the imported virtual-character-ring evaluation it is pullback along the function g↦gᵖ, even though that function need not be a group homomorphism.

**Proof route.**

1. Newton identities express the trace of the p-th power as an integer polynomial in exterior-power characters. Direct-sum identities make the resulting operation additive and multiplicative on virtual characters. Its character function determines it by the imported character-table injectivity.

**Dependencies:** `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-6-the-virtual-character-ring-artin-and-brauer-induction`, `tauceti:TauCetiRoadmap/RepresentationTheory/CharacterTheory#layer-3-the-character-table-idempotents-completeness-second-orthogonality`.

**Consumers.**

- [integral-group-log](#target-integral-group-log): Convert the conjugacy-class Frobenius into the character formula.

**Sources.**

- [The group logarithm past and present](https://www.mathi.uni-heidelberg.de/~otmar/workshopms/logsurvey10-3Final.pdf), §3, Adams operation and logarithm formula, pp.5–6; CPT §3a, pp.12–13. The character Adams operation evaluates a character on p-th powers and is integral on the virtual ring.

**Acceptance:** Check every API law and all discriminating tests below.

<a id="target-integral-group-log"></a>

### The integral group logarithm

**Target:** `ClassicalArithmeticCompletion:CA.7/continuation/integral-group-log` (construction).

Let p be prime, R a characteristic-zero integral domain, p-torsion-free and p-adically complete, with an endomorphism F satisfying F(r)≡rᵖ mod pR. Let G be a finite p-group, I the augmentation ideal of R[G], C_G its conjugacy classes and φ:R[G]→R[C_G] the additive class projection. Set Ψ(r[g])=F(r)[gᵖ] on the class module and L(1+x)=(p−Ψ)φ(log(1+x)), x∈I. The logarithm converges in Frac(R)[G] because I mod p is nilpotent. Ψ is semilinear on the class module; it is not a ring homomorphism on a nonabelian group ring. Use ν=p⁻¹L on determinant classes where integrality permits.

**API.**

- `IntegralGroupLog.identity` (simp): L(1)=0.
- `IntegralGroupLog.product` (structure): L(uv)=L(u)+L(v) on 1+I.
- `IntegralGroupLog.character` (compatibility): χ(L(u))=p log Det(u)(χ)−log Det(F_R(u))(ψᵖχ), with coefficientwise Frobenius before evaluation. Our ν=L/p differs from CPT’s ν by the factor p.
- `IntegralGroupLog.coefficients` (functoriality): A coefficient map commuting with Frobenius lifts preserves L.
- `IntegralGroupLog.conjugacy` (characterisation): The target is the free coefficient module on conjugacy classes, not R[G].

**Checks.**

- `integral_group_log_1` (degenerate): For G={1}, I=0 and the logarithm has zero domain group.
- `integral_group_log_2` (computation): For every group element g∈G, L(g)=0 since g has finite p-power order.
- `integral_group_log_3` (non-example): This does not make Det(g)=1: the determinant torsion kernel can be nontrivial.
- `integral_group_log_4` (compatibility): For abelian G, φ is the identity on the group basis and Ψ is the usual coefficient Frobenius together with g↦gᵖ.

**Proof route.**

1. Augmentation nilpotence modulo p gives I^N⊆pR[G], hence logarithmic convergence in R[1/p][G]. Project to conjugacy classes so logarithms are additive on products. Frobenius cancels denominators by group-log-integrality. For coefficientwise F_R on R[G], the exact character formula is χ(L(u))=p·log Det(u)(χ)−log Det(F_R(u))(ψᵖχ). F_R acts on coefficients before character evaluation; no extension of F_R fixing character roots is assumed. CPT denotes the map induced by L itself by ν; our normalized ν=L/p has image φ(A), while CPT’s ν has image pφ(A).

**Dependencies:** [determinant-character-hom](#target-determinant-character-hom), [adams-character-operation](#target-adams-character-operation).

**Consumers.**

- [group-log-integrality](#target-group-log-integrality): Identify its integral image.
- [group-log-commutator-isomorphism](#target-group-log-commutator-isomorphism): Isolate the torsion kernel.
- [gauss-log-image](#target-gauss-log-image): Lift the Gauss logarithm.

**Sources.**

- [K₁ of a p-adic group ring I. The determinantal image](https://arxiv.org/pdf/0904.2563v1), §3a equations(3.1)–(3.5), pp.12–13; LOGSURVEY §3, pp.5–6. The p-scaled logarithm is formed after the conjugacy-class projection and uses a coefficient Frobenius lift.

**Acceptance:** Check every API law and all discriminating tests below.

<a id="target-group-log-integrality"></a>

### Integral images of the group logarithm

**Target:** `ClassicalArithmeticCompletion:CA.7/continuation/group-log-integrality` (theorem).

Under the integral-group-log hypotheses, L(1+I)⊆pφ(I). If A=ker(R[G]→R[G_ab]), then L(1+A)=pφ(A). The second assertion is surjectivity onto the commutator ideal image, not merely a containment.

**Proof route.**

1. Use the Frobenius congruence to cancel the denominator at every p-power term of the logarithm. Induct on the p-group using a central element of order p. Separate the kernel of passage to the central quotient, and lift each desired conjugacy-class coefficient by successive p-adic approximations. Completeness makes the approximations converge to a unit with the chosen logarithm.

**Dependencies:** [integral-group-log](#target-integral-group-log).

**Sources.**

- [K₁ of a p-adic group ring I. The determinantal image](https://arxiv.org/pdf/0904.2563v1), Theorems3.4–3.5 and proofs, pp.13–17. The logarithm is p-integral, and on the commutator augmentation ideal it has exactly the displayed image.

**Acceptance:** Under the integral-group-log hypotheses, L(1+I)⊆pφ(I). If A=ker(R[G]→R[G_ab]), then L(1+A)=pφ(A). The second assertion is surjectivity onto the commutator ideal image, not merely a containment.

<a id="target-group-log-commutator-isomorphism"></a>

### The logarithm is injective only after controlling determinant torsion

**Target:** `ClassicalArithmeticCompletion:CA.7/continuation/group-log-commutator-isomorphism` (theorem).

For a finite p-group and the stated coefficient R, ker(ν:Det(1+I)→φ(I))=Det(G). On Det(1+A), with A=ker(R[G]→R[G_ab]), ν is an isomorphism onto φ(A). In particular equal logarithms alone imply a ratio in Det(G); they imply equality only after a separate torsion check or inside the commutator-ideal determinant subgroup.

**Proof route.**

1. The Appendix torsion theorem identifies all torsion in Det(1+I) with Det(G). The logarithm and determinant character formula identify the same kernel. Restricting to 1+A kills the group-element kernel because degree-one characters detect G_ab, while group-log-integrality gives surjectivity.

**Dependencies:** [integral-group-log](#target-integral-group-log), [group-log-integrality](#target-group-log-integrality).

**Sources.**

- [K₁ of a p-adic group ring I. The determinantal image](https://arxiv.org/pdf/0904.2563v1), Theorems3.14–3.16, pp.19–21; Appendix proof of Theorem3.14, pp.36–38. The full augmentation determinant kernel is group-element torsion, while the commutator-ideal restriction is an isomorphism.

**Acceptance:** For a finite p-group and the stated coefficient R, ker(ν:Det(1+I)→φ(I))=Det(G). On Det(1+A), with A=ker(R[G]→R[G_ab]), ν is an isomorphism onto φ(A). In particular equal logarithms alone imply a ratio in Det(G); they imply equality only after a separate torsion check or inside the commutator-ideal determinant subgroup.

<a id="target-integral-character-action"></a>

### Integral-character twisting of determinant homomorphisms

**Target:** `ClassicalArithmeticCompletion:CA.7/continuation/integral-character-action` (construction).

For an integral characteristic-zero character θ of a finite free G-stable Z_p-lattice, define (θ⋆f)(χ)=f(θχ). Twisting with the dual lattice preserves the matrix determinant subgroup Det(GL(R[G])) for every coefficient ring R; when R[G] is semilocal it preserves Det(R[G]×) by semilocal elimination. CPT uses the conjugate of the lattice character, so the dual is required for this convention. Restriction and induction satisfy the projection formula.

**API.**

- `IntegralCharacterAction.identity` (simp): The trivial lattice character acts as identity.
- `IntegralCharacterAction.sum` (structure): (θ+η)⋆f=(θ⋆f)(η⋆f).
- `IntegralCharacterAction.product` (structure): θ⋆(η⋆f)=(θη)⋆f.
- `IntegralCharacterAction.projection` (compatibility): Induction and restriction satisfy the projection formula on determinant images.

**Checks.**

- `integral_character_action_1` (degenerate): The zero character sends every f to the constant-one homomorphism.
- `integral_character_action_2` (computation): For a rank-m trivial lattice, θ⋆f=fᵐ.
- `integral_character_action_3` (non-example): An arbitrary rational virtual character without an integral lattice realization cannot be used as an integral-unit twisting construction.
- `integral_character_action_4` (compatibility): A non-real one-dimensional lattice requires the dual lattice when translating CPT’s conjugate-character action to the stated formula.

**Proof route.**

1. Tensoring with the integral dual lattice gives a representation into finite matrices over R[G]. Taking character determinants proves preservation of the matrix determinant image. Only in the semilocal case apply semilocal-determinant-stability to replace this by a unit determinant. Mackey and Frobenius reciprocity give the projection formula.

**Dependencies:** `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-6-the-virtual-character-ring-artin-and-brauer-induction`, [determinant-character-hom](#target-determinant-character-hom), [semilocal-determinant-stability](#target-semilocal-determinant-stability).

**Consumers.**

- [p-elementary-determinant-reduction](#target-p-elementary-determinant-reduction): Reduce the determinant quotient using integral character identities.

**Sources.**

- [K₁ of a p-adic group ring I. The determinantal image](https://arxiv.org/pdf/0904.2563v1), §5 equations(5.1)–(5.6) and Theorem5.5, pp.27–30; T81 §5, pp.52–53. Integral lattice characters act on determinant images, with an explicit conjugate-character convention.

**Acceptance:** Check every API law and all discriminating tests below.

<a id="target-p-elementary-determinant-reduction"></a>

### Local rational Brauer reduction for determinant quotients

**Target:** `ClassicalArithmeticCompletion:CA.7/continuation/p-elementary-determinant-reduction` (theorem).

Let R be a normal noetherian characteristic-zero integral domain, p-torsion-free and p-adically complete with a Frobenius lift. For a finite G, the determinant-quotient test reduces to Q_p-p-elementary subgroups C⋊P, with P a p-group and C cyclic of order prime to p, whose conjugation action is the Q_p cyclotomic Galois action. Restriction and integral-character twisting are initially operations on matrix determinant images. The local rational induction identity has multiplier prime to p, invertible on the pro-p quotient after radical reduction. For semilocal group rings matrix and unit conditions agree. The Q_p-rational refinement of generic Brauer induction is G-LOCALBRAUER.

**Proof route.**

1. Use the Q_ℓ-rational integral character identity with prime-to-ℓ multiplier. Apply integral-character-action and the projection formula to lift its induced terms. A quotient detected modulo the radical is pro-ℓ, hence multiplication by the prime-to-ℓ integer is invertible. For Taylor’s off-diagonal proof, the Q-elementary reduction and twists are applied before the same ℓ-adic quotient argument.

**Dependencies:** `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-6-the-virtual-character-ring-artin-and-brauer-induction`, [integral-character-action](#target-integral-character-action), [semilocal-determinant-stability](#target-semilocal-determinant-stability).

**Sources.**

- [K₁ of a p-adic group ring I. The determinantal image](https://arxiv.org/pdf/0904.2563v1), Theorems5.4–5.5, pp.29–30; T81 §5, pp.52–53. Local rational Brauer induction reduces determinant-image questions to cyclotomic elementary subgroups.

**Acceptance:** Let R be a normal noetherian characteristic-zero integral domain, p-torsion-free and p-adically complete with a Frobenius lift. For a finite G, the determinant-quotient test reduces to Q_p-p-elementary subgroups C⋊P, with P a p-group and C cyclic of order prime to p, whose conjugation action is the Q_p cyclotomic Galois action. Restriction and integral-character twisting are initially operations on matrix determinant images. The local rational induction identity has multiplier prime to p, invertible on the pro-p quotient after radical reduction. For semilocal group rings matrix and unit conditions agree. The Q_p-rational refinement of generic Brauer induction is G-LOCALBRAUER.

<a id="target-elementary-crossed-product-descent"></a>

### Crossed-product descent on elementary subgroups

**Target:** `ClassicalArithmeticCompletion:CA.7/continuation/elementary-crossed-product-descent` (theorem).

For a Q_ℓ-ℓ-elementary C⋊P and an ℓ-adic coefficient R satisfying CPT’s normal noetherian domain, completeness and Frobenius hypotheses, decompose R[C] into cyclotomic étale factors R[m]. If H is the kernel of P’s action on a factor and A the image, restriction induces an isomorphism Det(GL(R[m]◦P))≅Det(R[m][H]×)^A. The left matrix determinant image equals the determinant image of units of the crossed product.

**Proof route.**

1. Use the cyclic-character decomposition and the action on its coefficient factors. The crossed-product matrix description transfers restriction and norm between the subgroup and factor invariants. The p-group fixed-point theorem then identifies invariant determinants. The full matrix-ring identification needed here is G-CROSSEDPRODUCT: CPT cites Wall’s result rather than proving that identification in the passage read.

**Dependencies:** [p-elementary-determinant-reduction](#target-p-elementary-determinant-reduction), [group-log-commutator-isomorphism](#target-group-log-commutator-isomorphism), [p-group-determinant-fixed-point](#target-p-group-determinant-fixed-point).

**Sources.**

- [K₁ of a p-adic group ring I. The determinantal image](https://arxiv.org/pdf/0904.2563v1), §6a–b Theorem6.2 and its proof, pp.30–32. Elementary crossed products reduce to invariant determinant units of the p-group kernel.

**Acceptance:** For a Q_ℓ-ℓ-elementary C⋊P and an ℓ-adic coefficient R satisfying CPT’s normal noetherian domain, completeness and Frobenius hypotheses, decompose R[C] into cyclotomic étale factors R[m]. If H is the kernel of P’s action on a factor and A the image, restriction induces an isomorphism Det(GL(R[m]◦P))≅Det(R[m][H]×)^A. The left matrix determinant image equals the determinant image of units of the crossed product.

<a id="target-determinant-fixed-point"></a>

### Fixed-point descent for integral determinant units

**Target:** `ClassicalArithmeticCompletion:CA.7/continuation/determinant-fixed-point` (theorem).

Let R⊆S be normal noetherian characteristic-zero integral domains, p-torsion-free and p-adically complete, each with its own lift of Frobenius. Suppose S is finite free over R, Frac(S)/Frac(R) is Galois with finite group Δ, S^Δ=R and Tr_S/R is onto R. For any finite G, Det(S[G]×)^Δ=Det(R[G]×). For a p-group G the fixed-point theorem holds under the domain, completeness, Frobenius, finite-free Galois and invariant hypotheses without the extra normal/noetherian/trace assumptions. The two Frobenius lifts need not commute with the inclusion.

**Proof route.**

1. For p-groups use the logarithm on the commutator determinant subgroup and its exact integral image; handle group-element torsion separately. Descend abelian units by taking invariants in the augmentation sequence. For arbitrary G, use local rational Brauer reduction and crossed-product descent. Trace surjectivity is retained for the general coefficient statement; do not extrapolate the abbreviated survey hypothesis list.

**Dependencies:** [group-log-integrality](#target-group-log-integrality), [group-log-commutator-isomorphism](#target-group-log-commutator-isomorphism), [p-elementary-determinant-reduction](#target-p-elementary-determinant-reduction), [elementary-crossed-product-descent](#target-elementary-crossed-product-descent), [p-group-determinant-fixed-point](#target-p-group-determinant-fixed-point), [general-group-determinant-stability](#target-general-group-determinant-stability).

**Sources.**

- [K₁ of a p-adic group ring I. The determinantal image](https://arxiv.org/pdf/0904.2563v1), Theorem1.5, p.4; p-group Theorem4.1, pp.23–24; §6c, pp.33–36. Invariant determinant units descend, with precise coefficient and trace hypotheses.

**Acceptance:** Let R⊆S be normal noetherian characteristic-zero integral domains, p-torsion-free and p-adically complete, each with its own lift of Frobenius. Suppose S is finite free over R, Frac(S)/Frac(R) is Galois with finite group Δ, S^Δ=R and Tr_S/R is onto R. For any finite G, Det(S[G]×)^Δ=Det(R[G]×). For a p-group G the fixed-point theorem holds under the domain, completeness, Frobenius, finite-free Galois and invariant hypotheses without the extra normal/noetherian/trace assumptions. The two Frobenius lifts need not commute with the inclusion.

<a id="target-gauss-log-image"></a>

### The Gauss logarithm lifts through the commutator ideal

**Target:** `ClassicalArithmeticCompletion:CA.7/continuation/gauss-log-image` (theorem).

In Taylor’s cyclic prime-to-ℓ crossed-product reduction, the adjusted Gauss homomorphism f has logarithm in ℓ times the integral conjugacy-class module on inertia. Its restriction to the abelian quotient is the determinant of an integral unit T′. After removing that lift, ν(f) lies in the commutator-ideal image and is ν(Det z) for a unit z∈1+A supported on inertia. This supplies a logarithmic lift; it leaves possible group-element determinant torsion.

**Proof route.**

1. Use finite-gauss-product and the residue Gauss formulas to obtain Taylor’s inertia coefficient bounds. Lift the abelianized adjusted Gauss homomorphism by Fourier inversion. Saturation of the conjugacy-class commutator image permits the remaining logarithm to be lifted by group-log-commutator-isomorphism, retaining the inertia support.

**Dependencies:** [adjusted-gauss-sum](#target-adjusted-gauss-sum), [finite-gauss-product](#target-finite-gauss-product), [group-log-integrality](#target-group-log-integrality), [group-log-commutator-isomorphism](#target-group-log-commutator-isomorphism).

**Sources.**

- [On Fröhlich’s conjecture for rings of integers of tame extensions](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0063/LOG_0010.pdf), §7 Propositions7.5–7.7, pp.57–59; §8 formulas(8.1)–(8.8), pp.62–65. The Gauss logarithm and its abelianization have integral-unit lifts supported on inertia.

**Acceptance:** In Taylor’s cyclic prime-to-ℓ crossed-product reduction, the adjusted Gauss homomorphism f has logarithm in ℓ times the integral conjugacy-class module on inertia. Its restriction to the abelian quotient is the determinant of an integral unit T′. After removing that lift, ν(f) lies in the commutator-ideal image and is ν(Det z) for a unit z∈1+A supported on inertia. This supplies a logarithmic lift; it leaves possible group-element determinant torsion.

<a id="target-gauss-torsion-detection"></a>

### Taylor’s congruences detect the residual determinant torsion

**Target:** `ClassicalArithmeticCompletion:CA.7/continuation/gauss-torsion-detection` (theorem).

For the crossed-product Gauss factor f in gauss-log-image, let z and T′ be its commutator and abelian lifts. The quotient f/Det(zT′) lies in Det(G). Taylor’s four integral congruence families force this quotient to be trivial: induced characters of degree greater than two; degree-two characters with semiabelian action; degree-two inversion action; and degree-two semidihedral action. Hence f is an integral-unit determinant, rather than merely having the logarithm of one.

**Proof route.**

1. For induced characters compare Gauss factors and determinants against the transfer/cotransfer character at the next index-ℓ subgroup. For degree two the semiabelian branch compares modulo 2 times the radical; the inversion branch compares Gauss factors modulo 4 and determinants modulo 2 times the radical; the semidihedral branch uses the corresponding trace relation modulo 4. Group-element torsion is evaluated on these detecting characters, and the congruences eliminate it by induction on the group. Taylor §§9–10 prove these families, but the crucial degree>2 Gauss congruence invokes Fröhlich–Taylor 1980 §5.1: G-FTCONGRUENCE records that unread supplier. No injectivity of the unrestricted logarithm is used.

**Dependencies:** [gauss-log-image](#target-gauss-log-image), [group-log-commutator-isomorphism](#target-group-log-commutator-isomorphism), [p-elementary-determinant-reduction](#target-p-elementary-determinant-reduction).

**Sources.**

- [On Fröhlich’s conjecture for rings of integers of tame extensions](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0063/LOG_0010.pdf), §7 Theorem4 and its four branches, pp.59–61; §§9–10, pp.65–75. Four congruence families remove the torsion ambiguity left by the logarithm comparison.

**Acceptance:** For the crossed-product Gauss factor f in gauss-log-image, let z and T′ be its commutator and abelian lifts. The quotient f/Det(zT′) lies in Det(G). Taylor’s four integral congruence families force this quotient to be trivial: induced characters of degree greater than two; degree-two characters with semiabelian action; degree-two inversion action; and degree-two semidihedral action. Hence f is an integral-unit determinant, rather than merely having the logarithm of one.

<a id="target-gauss-determinant"></a>

### The off-diagonal local Gauss factor is an integral determinant

**Target:** `ClassicalArithmeticCompletion:CA.7/continuation/gauss-determinant` (theorem).

For a tame local G-Galois extension at a rational prime p and ℓ≠p, put K=Q(ζ_p). Taylor’s off-diagonal factor y_p⁻¹τ_p lies in Det(O_(K,ℓ)[G]×), where O_(K,ℓ) is the product of completed integer rings over ℓ. If p is unramified in the extension, y_p=τ_p=1. The assertion is membership in the integral-unit determinant subgroup, stronger than having unit character values.

**Proof route.**

1. Reduce by integral-character twisting and elementary induction. On the p-group factors use gauss-log-image and gauss-torsion-detection, then reassemble the cyclic crossed-product pieces. Det(c_p) is already an integral unit determinant and can be removed. Descent of invariant determinants uses determinant-fixed-point.

**Dependencies:** [adjusted-gauss-sum](#target-adjusted-gauss-sum), [gauss-log-image](#target-gauss-log-image), [gauss-torsion-detection](#target-gauss-torsion-detection), [elementary-crossed-product-descent](#target-elementary-crossed-product-descent), [determinant-fixed-point](#target-determinant-fixed-point).

**Sources.**

- [On Fröhlich’s conjecture for rings of integers of tame extensions](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0063/LOG_0010.pdf), Theorem2(b), p.45; §7 Theorem3, pp.54–61. Away from the ramified prime, the Gauss homomorphism modulo its root-of-unity correction is a determinant unit.

**Acceptance:** For a tame local G-Galois extension at a rational prime p and ℓ≠p, put K=Q(ζ_p). Taylor’s off-diagonal factor y_p⁻¹τ_p lies in Det(O_(K,ℓ)[G]×), where O_(K,ℓ) is the product of completed integer rings over ℓ. If p is unramified in the extension, y_p=τ_p=1. The assertion is membership in the integral-unit determinant subgroup, stronger than having unit character values.

<a id="target-norm-resolvent-determinant"></a>

### The diagonal tame norm-resolvent factor is a determinant unit

**Target:** `ClassicalArithmeticCompletion:CA.7/continuation/norm-resolvent-determinant` (theorem).

For tame L/F with group G, choose a∈O_L that is an integral normal generator at every place over S={ℓ:ℓ divides |G|}; let A be its embedding-product norm resolvend as in Taylor (2.2). For each ℓ∈S there is a finite Galois E/Q such that (y′_ℓ)⁻¹Det(A)∏_(𝔭|ℓ)τ_(G,𝔭)⁻¹ belongs to Det(∏_(𝔮|ℓ)(O_(E_𝔮)^P_𝔮[G])×), with P_𝔮 the wild inertia subgroup of Gal(E_𝔮/Q_ℓ). Here y′_ℓ is Taylor’s product of the local unramified correction factors. The coefficient ring is the ring fixed by wild inertia, hence a tame local coefficient extension; no unspecified inertia-norm modification is part of the statement.

**Proof route.**

1. Pass to a tame extension that splits cyclic inertia and contains the required roots of unity. Compare the inertia eigenresolvents with residue Gauss sums; resolvent-gauss-valuation gives unit coefficients. Unramified character twisting identifies the ratios on the cyclic inertia factors. Use the tame norm/base-change compatibility of F76 Theorem6 to reassemble the induced module; Taylor §11 then identifies the resulting unit as an integral group-ring determinant. This route uses the read F76 valuation proof rather than citing the unread 1980 theorem for that valuation.

**Dependencies:** [norm-resolvent](#target-norm-resolvent), [adjusted-gauss-sum](#target-adjusted-gauss-sum), [resolvent-gauss-valuation](#target-resolvent-gauss-valuation), [p-elementary-determinant-reduction](#target-p-elementary-determinant-reduction), [local-noether](#target-local-noether).

**Sources.**

- [On Fröhlich’s conjecture for rings of integers of tame extensions](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0063/LOG_0010.pdf), Theorem2(a), p.45; §11 Theorem5 and proof, pp.75–78; F76 Theorem6, pp.397–400. The diagonal factor of the integral embedding norm resolvend is a group-ring determinant over the wild-inertia fixed integer rings.

**Acceptance:** For tame L/F with group G, choose a∈O_L that is an integral normal generator at every place over S={ℓ:ℓ divides |G|}; let A be its embedding-product norm resolvend as in Taylor (2.2). For each ℓ∈S there is a finite Galois E/Q such that (y′_ℓ)⁻¹Det(A)∏_(𝔭|ℓ)τ_(G,𝔭)⁻¹ belongs to Det(∏_(𝔮|ℓ)(O_(E_𝔮)^P_𝔮[G])×), with P_𝔮 the wild inertia subgroup of Gal(E_𝔮/Q_ℓ). Here y′_ℓ is Taylor’s product of the local unramified correction factors. The coefficient ring is the ring fixed by wild inertia, hence a tame local coefficient extension; no unspecified inertia-norm modification is part of the statement.

<a id="target-froehlich-taylor-equality"></a>

### The Fröhlich–Taylor obstruction equality

**Target:** `ClassicalArithmeticCompletion:CA.7/continuation/froehlich-taylor-equality` (theorem).

For every tame finite G-Galois extension L/F of number fields, with d=[F:Q], [O_L]−d[Z[G]]=t(W_L/F) in Cl(Z[G]), under the compatible Hom-description and embedding-norm conventions. This is the equality of the full stable module class with the symplectic root-number class, not just a two-torsion assertion.

**Proof route.**

1. Represent the class by the norm-resolvent/Gauss homomorphism from froehlich-kernel-membership. At each ℓ separate the diagonal factor supplied by norm-resolvent-determinant and the off-diagonal factors supplied by gauss-determinant. The product differs from W only by integral-unit determinants after a finite tame scalar extension. Taylor §12 descends first through tame inertia of degree prime to ℓ and then through the unramified quotient; retain the exact coefficient hypotheses of determinant-fixed-point on each component. The positive principal denominator absorbs the rational basis choices. The remaining quotient is exactly t(W).

**Dependencies:** [froehlich-kernel-membership](#target-froehlich-kernel-membership), [root-number-class](#target-root-number-class), [norm-resolvent-determinant](#target-norm-resolvent-determinant), [gauss-determinant](#target-gauss-determinant), [determinant-fixed-point](#target-determinant-fixed-point), [kernel-hom-comparison](#target-kernel-hom-comparison).

**Sources.**

- [On Fröhlich’s conjecture for rings of integers of tame extensions](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0063/LOG_0010.pdf), Theorem1, pp.41–42; reduction(2.1)–(2.2), pp.44–45; §12 Theorem6 and conclusion, pp.78–79. Taylor identifies the integer-ring stable class with the root-number obstruction through local determinant factors and descent.

**Acceptance:** For every tame finite G-Galois extension L/F of number fields, with d=[F:Q], [O_L]−d[Z[G]]=t(W_L/F) in Cl(Z[G]), under the compatible Hom-description and embedding-norm conventions. This is the equality of the full stable module class with the symplectic root-number class, not just a two-torsion assertion.

## Direct suppliers for the inherited arithmetic contracts

<a id="target-odd-order-eichler"></a>

### Odd-order group algebras satisfy Eichler’s condition

**Target:** `ClassicalArithmeticCompletion:CA.7/continuation/odd-order-eichler` (theorem).

For a finite odd-order group G, Q[G] has no totally definite quaternion division simple component and therefore satisfies Eichler’s condition. It also has no symplectic irreducible character.

**Proof route.**

1. The Frobenius–Schur criterion excludes symplectic irreducibles for odd-order groups. A totally definite quaternion division component contributes a symplectic irreducible under the real Wedderburn/character correspondence, so such a component is excluded. Apply the precise matrix-size Eichler predicate.

**Dependencies:** `tauceti:TauCetiRoadmap/RepresentationTheory/CharacterTheory#layer-7-the-frobenius-schur-indicator-and-realquaternionic-type`, `tauceti:TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras#layer-6-the-brauer-group-and-splitting-fields`, [eichler-condition](#target-eichler-condition).

**Sources.**

- [On Fröhlich’s conjecture for rings of integers of tame extensions](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0063/LOG_0010.pdf), Corollary(c), p.42, with the real-character input; F76 §8, p.410. Odd-order groups have no symplectic obstruction and their rational group algebra has the required cancellation property.

**Acceptance:** For a finite odd-order group G, Q[G] has no totally definite quaternion division simple component and therefore satisfies Eichler’s condition. It also has no symplectic irreducible character.

<a id="target-p-group-determinant-fixed-point"></a>

### Fixed-point descent for p-group determinants

**Target:** `ClassicalArithmeticCompletion:CA.7/continuation/p-group-determinant-fixed-point` (theorem).

Let R⊆S be characteristic-zero integral domains, p-adically complete with Frobenius lifts, with S finite free over R, Frac(S)/Frac(R) Galois with group Δ and S^Δ=R. For a finite p-group G, Det(S[G]×)^Δ=Det(R[G]×). Neither trace surjectivity nor compatibility of the Frobenius lifts is required in this p-group assertion.

**Proof route.**

1. For the commutator determinant subgroup use the exact logarithm image and take invariants in the free conjugacy-class coefficient module. The argument compares the two coefficient Frobenius lifts through their p-divisible difference, rather than assuming they commute. Descend the abelian unit image by the augmentation sequence. Treat the group-element determinant torsion using the explicitly identified kernel.

**Dependencies:** [group-log-integrality](#target-group-log-integrality), [group-log-commutator-isomorphism](#target-group-log-commutator-isomorphism).

**Sources.**

- [K₁ of a p-adic group ring I. The determinantal image](https://arxiv.org/pdf/0904.2563v1), Theorem4.1 and proof, pp.23–24. The p-group determinant fixed-point theorem holds with the smaller displayed coefficient hypotheses.

**Acceptance:** Let R⊆S be characteristic-zero integral domains, p-adically complete with Frobenius lifts, with S finite free over R, Frac(S)/Frac(R) Galois with group Δ and S^Δ=R. For a finite p-group G, Det(S[G]×)^Δ=Det(R[G]×). Neither trace surjectivity nor compatibility of the Frobenius lifts is required in this p-group assertion.

<a id="target-general-group-determinant-stability"></a>

### Matrix and unit determinant images over complete coefficient domains

**Target:** `ClassicalArithmeticCompletion:CA.7/continuation/general-group-determinant-stability` (theorem).

For a normal noetherian characteristic-zero integral domain R, p-torsion-free and p-adically complete, with a lift of Frobenius, and any finite group G, Det(GL(R[G]))=Det(R[G]×). GL denotes the stable union over finite matrix sizes; no semilocality of R is assumed.

**Proof route.**

1. Use local rational Brauer reduction on matrix determinant classes. For each cyclotomic elementary subgroup apply elementary-crossed-product-descent, including its p-group fixed-point input, to identify the restriction image with unit determinants. Reassemble by the integral lattice-character action on matrix determinants. The prime-to-p induction multiplier is removed in the pro-p quotient.

**Dependencies:** [p-elementary-determinant-reduction](#target-p-elementary-determinant-reduction), [elementary-crossed-product-descent](#target-elementary-crossed-product-descent), [p-group-determinant-fixed-point](#target-p-group-determinant-fixed-point).

**Sources.**

- [K₁ of a p-adic group ring I. The determinantal image](https://arxiv.org/pdf/0904.2563v1), Theorem1.2, p.3; §6b, Theorems6.2–6.3 and proof, pp.31–33. Finite matrix determinants are represented by single group-ring units under the full coefficient-domain hypotheses.

**Acceptance:** For a normal noetherian characteristic-zero integral domain R, p-torsion-free and p-adically complete, with a lift of Frobenius, and any finite group G, Det(GL(R[G]))=Det(R[G]×). GL denotes the stable union over finite matrix sizes; no semilocality of R is assumed.

<a id="target-residue-trace-filtration"></a>

### Trace through the prime-power filtration

**Target:** `ClassicalArithmeticCompletion:CA.7/continuation/residue-trace-filtration` (theorem).

Let A⊆B be finite Dedekind domains and p a nonzero prime of A. For a prime P above p with ramification index e, the P-primary component of B/pB is a finite A/p-vector space with filtration whose e graded pieces are each one copy of B/P. Therefore the A/p-linear trace of multiplication by x on this component is e·Tr_(B/P)/(A/p)(x mod P). Apply ideal CRT to sum the component formulas. No B/P-vector-space structure on the entire nonreduced primary quotient is claimed. For an inseparable residue extension its field trace vanishes; separability is explicit when a nonzero residue trace is needed.

**Proof route.**

1. Use ideal CRT for the pairwise coprime powers P_iᵉ. In each quotient filter by P_iʲ/P_iʲ⁺¹; localization at the DVR identifies each nonzero graded piece with one copy of B/P_i. Multiplication by x is block triangular, so its trace is e times the residue trace. Integral trace commutes with quotient scalar change because B is finite projective over A. The Galois action permutes primes and induces the residue isomorphisms; the imported Dedekind prime-action dictionary supplies that normality.

**Dependencies:** [finite-dedekind-torsionfree-projective](#target-finite-dedekind-torsionfree-projective), `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-1-the-splitting-dictionary`.

**Sources.**

- [Notes on Galois Modules](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Proposition7.2 proof, equation(5), p.13. The nilpotent prime-power layers contribute the ramification-index multiplier to the residue trace.

**Acceptance:** Let A⊆B be finite Dedekind domains and p a nonzero prime of A. For a prime P above p with ramification index e, the P-primary component of B/pB is a finite A/p-vector space with filtration whose e graded pieces are each one copy of B/P. Therefore the A/p-linear trace of multiplication by x on this component is e·Tr_(B/P)/(A/p)(x mod P). Apply ideal CRT to sum the component formulas. No B/P-vector-space structure on the entire nonreduced primary quotient is claimed. For an inseparable residue extension its field trace vanishes; separability is explicit when a nonzero residue trace is needed.

<a id="target-normal-trace-descent"></a>

### Normal integral bases descend by trace to fixed fields

**Target:** `ClassicalArithmeticCompletion:CA.7/continuation/normal-trace-descent` (theorem).

Let A be integrally closed with fraction field F, L/F finite G-Galois, and B its finite integral closure. If B=A[G]a is a normal integral basis and H≤G, then B^H is free over A with basis {Σh∈H h(g(a)) : Hg∈H\G}. In particular Tr_L/F(a) is an A-basis of A, and the trace B→A is onto. When H is normal this is an A[G/H]-normal integral basis for the fixed extension. The statement covers complete DVRs as well as number-field integer rings.

**Proof route.**

1. In the permutation basis g(a), H-invariance says precisely that coefficients are constant on left cosets. Their orbit sums form an A-basis of invariants without division by |H|. Integral closedness identifies B^G with A and B^H with the integral closure in L^H. For a normal H the quotient G/H permutes the orbit sums regularly.

**Dependencies:** [normal-integral-basis](#target-normal-integral-basis), [ring-of-integers-as-group-ring-module](#target-ring-of-integers-as-group-ring-module), [projective-group-norm-surjectivity](#target-projective-group-norm-surjectivity).

**Sources.**

- [Notes on Galois Modules](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Proposition6.1 and Corollary6.2, p.11. Tracing a normal integral generator gives an integral normal generator in the fixed Galois extension.

**Acceptance:** Let A be integrally closed with fraction field F, L/F finite G-Galois, and B its finite integral closure. If B=A[G]a is a normal integral basis and H≤G, then B^H is free over A with basis {Σh∈H h(g(a)) : Hg∈H\G}. In particular Tr_L/F(a) is an A-basis of A, and the trace B→A is onto. When H is normal this is an A[G/H]-normal integral basis for the fixed extension. The statement covers complete DVRs as well as number-field integer rings.

<a id="target-finite-order-flat-hom"></a>

### Central flat scalar change for finite-order Hom modules

**Target:** `ClassicalArithmeticCompletion:CA.7/continuation/finite-order-flat-hom` (theorem).

Let A be commutative noetherian, Λ a finite central A-algebra, M a finitely presented left Λ-module, N any left Λ-module and S a flat commutative A-algebra. The canonical map S⊗ₐHom_Λ(M,N)→Hom_(S⊗ₐΛ)(S⊗ₐM,S⊗ₐN) is an isomorphism, compatible with composition and pure tensors. If S is faithfully flat, projectivity of S⊗M descends to M. For a family of flat central scalar maps jointly detecting A-module exactness, projectivity descends when it holds after every scalar change.

**Proof route.**

1. Present M by a finite free Λ-module and finitely many relations. Hom is the kernel of the associated finite matrix on copies of N; flatness preserves this kernel and finite products. A projective scalar extension makes Hom out of it preserve every surjection. Faithful flatness or joint detection reflects surjectivity of the Hom map, proving projectivity. No noncommutative commutative-ring localization theorem is applied to Λ.

**Dependencies:** [balanced-extension](#target-balanced-extension).

**Sources.**

- [The K-book, Chapter I: Projective Modules and Vector Bundles](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.I.pdf), I§2 finite-projective and local criteria, pp.6–8, with the finite-presentation Hom-kernel proof given here. Finite presentations permit central flat Hom base change and projectivity descent over an order.

**Acceptance:** Let A be commutative noetherian, Λ a finite central A-algebra, M a finitely presented left Λ-module, N any left Λ-module and S a flat commutative A-algebra. The canonical map S⊗ₐHom_Λ(M,N)→Hom_(S⊗ₐΛ)(S⊗ₐM,S⊗ₐN) is an isomorphism, compatible with composition and pure tensors. If S is faithfully flat, projectivity of S⊗M descends to M. For a family of flat central scalar maps jointly detecting A-module exactness, projectivity descends when it holds after every scalar change.

<a id="target-dedekind-completion-detection"></a>

### Dedekind completions jointly detect finite-module equality

**Target:** `ClassicalArithmeticCompletion:CA.7/continuation/dedekind-completion-detection` (theorem).

For a nonfield Dedekind domain A with fraction field F and a nonzero prime v, let Â_v be the valuation ring of v.adicCompletion F. The canonical map A_v→Â_v is a flat local homomorphism and hence faithfully flat. The family A→Â_v therefore detects exactness of A-modules; finite sublattice equality and finite-order projectivity descent are applications. For number fields the arithmetic completion dictionary is imported. The generic valuation-ring/localization adapter, including the local-map proof, is G-COMPLETION.

**Proof route.**

1. Construct A_v→Â_v by mapping denominators outside v to valuation units. The valuation identifies its maximal ideal and proves it is local. The completed valuation ring is torsion-free over the DVR A_v, hence flat. Its maximal ideal remains proper, so a flat local map is faithfully flat. A family over all maximal ideals detects exactness, because A is a nonfield Dedekind domain and every maximal ideal is nonzero. The canonical generic adapter and its local-map proof remain the exact formal supplier boundary G-COMPLETION.

**Dependencies:** `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-5-the-global-local-dictionary-at-finite-places`, [finite-order-flat-hom](#target-finite-order-flat-hom), `mathlib:Module.FaithfullyFlat.of_flat_of_isLocalHom`.

**Sources.**

- [Quaternion Algebras](https://jvoight.github.io/quat-book.pdf), §9.4 local-global lattice principle, as used by Lemma10.2.10, p.153; construction/proof supplied in this target. Lattice equality is detected at all localizations; faithful-flat completion transports this test.

**Acceptance:** For a nonfield Dedekind domain A with fraction field F and a nonzero prime v, let Â_v be the valuation ring of v.adicCompletion F. The canonical map A_v→Â_v is a flat local homomorphism and hence faithfully flat. The family A→Â_v therefore detects exactness of A-modules; finite sublattice equality and finite-order projectivity descent are applications. For number fields the arithmetic completion dictionary is imported. The generic valuation-ring/localization adapter, including the local-map proof, is G-COMPLETION.

<a id="target-semilocal-induction-comparison"></a>

### Balanced induction and the finite coset model

**Target:** `ClassicalArithmeticCompletion:CA.7/continuation/semilocal-induction-comparison` (comparison).

Let S be a commutative ring, G a finite group, H≤G and M a left S[H]-module. There is a canonical S[G]-linear isomorphism S[G]⊗_(S[H])M with functions f:G→M satisfying f(gh)=h⁻¹f(g), on which G acts by left translation. The tensor g⊗m maps to the function supported on gH with value h⁻¹m at gh. This is independent of coset representatives. For a G-equivariant product of modules indexed by G/H, applying the transport maps identifies this function model with the product.

**Proof route.**

1. The displayed function satisfies the H-equivariance condition. The identity gd⊗m=g⊗dm agrees with its value at gdh. Coset representatives identify both sides with a finite direct sum of copies of M, giving inverse maps; the balancing relation proves independence of the choice. Apply the imported NFA5 product of completed integer rings and its factor transport to obtain the inherited completed-ring induction target.

**Dependencies:** `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-5-the-global-local-dictionary-at-finite-places`, [balanced-extension](#target-balanced-extension).

**Sources.**

- [Notes on Galois Modules](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Proposition10.7 proof, p.20. The completed global integer module is the decomposition-group induction of the local integer module, with the left-module tensor order fixed.

**Acceptance:** Let S be a commutative ring, G a finite group, H≤G and M a left S[H]-module. There is a canonical S[G]-linear isomorphism S[G]⊗_(S[H])M with functions f:G→M satisfying f(gh)=h⁻¹f(g), on which G acts by left translation. The tensor g⊗m maps to the function supported on gH with value h⁻¹m at gh. This is independent of coset representatives. For a G-equivariant product of modules indexed by G/H, applying the transport maps identifies this function model with the product.

<a id="target-uniform-trace-dual-bound"></a>

### One trace-dual lattice bounds every overorder

**Target:** `ClassicalArithmeticCompletion:CA.7/continuation/uniform-trace-dual-bound` (theorem).

Let A be integrally closed noetherian with fraction field F, B finite-dimensional with nondegenerate regular trace pairing, and Λ an A-order. Choose an F-basis e_i inside Λ and r=det(Tr_reg(e_ie_j))≠0. Every overorder Γ⊇Λ is contained in r⁻¹Σ_i A e_i. The bound is independent of Γ; it makes the set of overorders satisfy the ascending-chain condition.

**Proof route.**

1. Every x∈Γ is integral over A by finite-module Cayley–Hamilton. Eigenvalues of left multiplication are roots of a monic integral polynomial; their sum is integral over A and lies in F, hence regular trace lies in A by normality. Apply this to xe_j, since e_j∈Λ⊆Γ. Cramer’s rule in the fixed Gram matrix puts every coordinate in r⁻¹A. A noetherian finite-module bound gives ascending-chain termination.

**Dependencies:** [order-in-finite-dimensional-algebra](#target-order-in-finite-dimensional-algebra), [maximal-order](#target-maximal-order).

**Sources.**

- [Quaternion Algebras](https://jvoight.github.io/quat-book.pdf), Lemma10.3.7 proof and paragraph10.4.2, p.155; regular-trace variant explained here. The trace-dual/Cramer bound uses a basis of the starting order and bounds all its overorders simultaneously.

**Acceptance:** Let A be integrally closed noetherian with fraction field F, B finite-dimensional with nondegenerate regular trace pairing, and Λ an A-order. Choose an F-basis e_i inside Λ and r=det(Tr_reg(e_ie_j))≠0. Every overorder Γ⊇Λ is contained in r⁻¹Σ_i A e_i. The bound is independent of Γ; it makes the set of overorders satisfy the ascending-chain condition.

<a id="target-integral-compositum-tensor"></a>

### Integral composita under arithmetic disjointness

**Target:** `ClassicalArithmeticCompletion:CA.7/continuation/integral-compositum-tensor` (comparison).

For finite extensions L/F and K/F of number fields or p-adic fields that are linearly disjoint and have coprime relative discriminant ideals, multiplication induces O_L⊗_(O_F)O_K≅O_(LK). If both are Galois, restriction gives Gal(LK/F)≅Gal(L/F)×Gal(K/F), and tensoring their normal integral bases gives the product normal integral basis. Trivial field intersection alone is not used as linear disjointness unless a Galois hypothesis justifies it.

**Proof route.**

1. Field linear disjointness gives the generic tensor isomorphism. Any failure of integral multiplication to be an isomorphism localizes at a prime dividing the index, which must divide both discriminants by the discriminant/index-square formula; coprimality excludes it. For the automorphism product, extend pairs of automorphisms through the tensor field and verify the inverse by restriction. The product group acts regularly on the tensor basis.

**Dependencies:** `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-4-the-relative-discriminant`, [balanced-extension](#target-balanced-extension).

**Sources.**

- [Notes on Galois Modules](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Theorem5.4 and Corollary5.6, pp.9–10. Coprime discriminants and linear disjointness identify the integral tensor product with the compositum integer ring.

**Acceptance:** For finite extensions L/F and K/F of number fields or p-adic fields that are linearly disjoint and have coprime relative discriminant ideals, multiplication induces O_L⊗_(O_F)O_K≅O_(LK). If both are Galois, restriction gives Gal(LK/F)≅Gal(L/F)×Gal(K/F), and tensoring their normal integral bases gives the product normal integral basis. Trivial field intersection alone is not used as linear disjointness unless a Galois hypothesis justifies it.

<a id="target-cyclotomic-inertia-cut"></a>

### A single tame cyclotomic conductor cut

**Target:** `ClassicalArithmeticCompletion:CA.7/continuation/cyclotomic-inertia-cut` (theorem).

Suppose L⊆Q(ζ_m) and L/Q is Galois and tame. For odd pᵃ∥m, wild p-inertia in Gal(Q(ζ_m)/Q) acts trivially on L, so L⊆Q(ζ_(m/pᵃ·p)). For 2ᵃ∥m, all 2-primary cyclotomic inertia acts trivially, so L⊆Q(ζ_(m/2ᵃ)). The fixed-field calculation retains all other conductor factors. Iterating gives the inherited squarefree embedding target once Kronecker–Weber supplies the initial embedding.

**Proof route.**

1. Use the CRT factorization of cyclotomic Galois groups and local cyclotomic ramification to identify inertia at p with the p-primary cyclotomic factor. A tame quotient has inertia order prime to p, so its Sylow p-subgroup dies. At 2 the full cyclotomic inertia is a 2-group, hence dies. The fixed-field identification gives the stated conductor cut, with all other factors retained.

**Dependencies:** `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-5-the-global-local-dictionary-at-finite-places`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-3-ramification-the-tame-and-wild-cases-and-the-filtration`.

**Sources.**

- [Notes on Galois Modules](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Theorem8.4 and proof, p.14. Tameness eliminates the wild cyclotomic inertia factors and therefore removes all nonsquarefree conductor powers.

**Acceptance:** Suppose L⊆Q(ζ_m) and L/Q is Galois and tame. For odd pᵃ∥m, wild p-inertia in Gal(Q(ζ_m)/Q) acts trivially on L, so L⊆Q(ζ_(m/pᵃ·p)). For 2ᵃ∥m, all 2-primary cyclotomic inertia acts trivially, so L⊆Q(ζ_(m/2ᵃ)). The fixed-field calculation retains all other conductor factors. Iterating gives the inherited squarefree embedding target once Kronecker–Weber supplies the initial embedding.

<a id="target-nonprincipal-ideal-witness"></a>

### The norm-two ideal in Z[√−5] is nonprincipal

**Target:** `ClassicalArithmeticCompletion:CA.7/continuation/nonprincipal-ideal-witness` (theorem).

For A=Z[√−5], I=(2,1+√−5) has quotient A/I≅F₂ and norm 2. It is nonprincipal: a principal generator a+b√−5 would have norm a²+5b²=2, which has no integer solution. Consequently I is locally free of rank one but not free, and [I]−[A] is a nonzero class in K₀(A).

**Proof route.**

1. Reduce √−5 to 1 in F₂ and identify the kernel as the displayed ideal. The principal ideal index is the absolute determinant of multiplication by a+b√−5, equal to a²+5b². If b≠0 this is at least5; if b=0 it is a square and cannot equal2. Apply the ideal-product/Steinitz and K₀ comparison.

**Dependencies:** [dedekind-projective-steinitz](#target-dedekind-projective-steinitz), [dedekind-k0-comparison](#target-dedekind-k0-comparison).

**Sources.**

- [Notes on Galois Modules](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Example3.3(i), p.4; W-I §3 Dedekind discussion, pp.18–19. A nonprincipal ideal gives the concrete local-free/global-nonfree acceptance test; its norm computation is supplied here.

**Acceptance:** For A=Z[√−5], I=(2,1+√−5) has quotient A/I≅F₂ and norm 2. It is nonprincipal: a principal generator a+b√−5 would have norm a²+5b²=2, which has no integer solution. Consequently I is locally free of rank one but not free, and [I]−[A] is a nonzero class in K₀(A).

## Retained targets and the 49-item review frontier

The following targets keep the accepted packet’s IDs, statements, APIs and checks. Their proof routes now name the direct continuation suppliers. Smaller proof constructions remain inside their target at the current target-level granularity. Definition facets precede their theorem APIs: define the retained Cl subgroup and class maps first, then prove the stable, scalar, Steinitz and Hom APIs from the continuation. Additional suppliers attach to the named theorem/API obligation, not to the definition of its own carrier. A review request to split every auxiliary map is assessed at the current target-level granularity. The eight boundaries are explicitly propagated to the affected contracts.

<a id="target-ring-of-integers-as-group-ring-module"></a>

### The ring of integers as a module over the group ring

**Target:** `ClassicalArithmeticCompletion:CA.7/ring-of-integers-as-group-ring-module` (construction).

Let A be a commutative ring, B a commutative A-algebra and G a group acting on B by ring automorphisms that commute with the action of A (G acts by A-algebra automorphisms). The Galois representation of G on B is the A-linear representation g ↦ (x ↦ g·x), and the group ring A[G] (Mathlib's MonoidAlgebra A G) acts on B on the left by (Σ_g a_g g)·x = Σ_g a_g g(x); this makes B a left A[G]-module whose restriction to A is the given A-module structure. The principal case is a finite Galois extension L/K of number fields with G = Gal(L/K), A = 𝓞_K and B = 𝓞_L, where the action is the restriction of the Galois action on L; the same construction with A = K and B = L gives L as a K[G]-module, and the inclusion 𝓞_L ⊆ L is 𝓞_K[G]-linear. When G is a Galois group for B/A in Mathlib's sense (IsGaloisGroup G A B: faithful action, commuting with A, with invariants the image of A), the norm element N = Σ_g g acts on B with values in A, and for rings of integers it acts as the trace.

**Hypotheses.**

- A is a commutative ring and B a commutative A-algebra.
- G is a group acting on B by ring automorphisms commuting with A: [MulSemiringAction G B] and [SMulCommClass G A B].
- The Galois-group hypothesis IsGaloisGroup G A B is needed only for the statements about invariants and the norm element; the norm element Σ_g g also needs G finite ([Fintype G]).
- The group ring acts on the left; a right action is never used.

**API.**

- `IntegralGaloisModule.galoisRep` (data): The A-linear representation of G on B, g ↦ (x ↦ g·x).
- `IntegralGaloisModule.galoisRep_apply` (simp): galoisRep A B G g x = g·x.
- `IntegralGaloisModule.GroupRingModule` (constructor): B as a left A[G]-module: the asModule of galoisRep.
- `IntegralGaloisModule.toGroupRingModule` (equivalence): The A-linear identification of B with its group-ring module.
- `IntegralGaloisModule.single_smul` (simp): single g a · x = a · g(x).
- `IntegralGaloisModule.of_smul` (simp): The image of g in A[G] acts as g.
- `IntegralGaloisModule.isScalarTower` (instance): The scalar tower A → A[G] → B.
- `IntegralGaloisModule.norm_smul` (relation): The norm element Σ_g g acts as x ↦ Σ_g g(x).
- `IntegralGaloisModule.mem_range_algebraMap_iff` (characterisation): For a Galois group G of B/A, x lies in the image of A exactly when g(x) = x for all g.
- `IntegralGaloisModule.sum_smul_mem_range_algebraMap` (relation): For a Galois group G of B/A, Σ_g g(x) lies in the image of A.
- `IntegralGaloisModule.galoisRep_numberField_apply` (compatibility): For number fields, the value of galoisRep at σ ∈ Gal(L/K) on x ∈ 𝓞_L is σ(x) computed in L.

**Checks.**

- `IntegralGaloisModule.galoisRep_test_trivialGroup` (degenerate): For the trivial group the norm element acts as the identity.
- `IntegralGaloisModule.galoisRep_test_augmentationKillsInvariants` (characterisation): For a Galois group of B/A, g − 1 kills the image of A in B.
- `IntegralGaloisModule.galoisRep_test_normIsTrace` (compatibility): For number fields, Σ_σ σ(x) equals the image of Tr_{𝓞_L/𝓞_K}(x) (Mathlib's Algebra.intTrace).

**Proof route.**

1. Keep the target and its existing Representation.asModule carrier. On the nontrivial C₂ action on Z[i], the generator sends i to −i and the norm sends a+bi to 2a. The group norm comparison supplies the trace API, without another module carrier.

**Dependencies:** `mathlib:Representation.ofDistribMulAction`, `mathlib:Representation.asModule`, `mathlib:Representation.asAlgebraHom`, `mathlib:MonoidAlgebra`, `mathlib:IsGaloisGroup`, `mathlib:Algebra.IsInvariant`, `mathlib:galRestrict`, `mathlib:trace_eq_sum_automorphisms`, `mathlib:Algebra.intTrace`, `mathlib:Algebra.algebraMap_intTrace`, `mathlib:Representation.single_smul`, `mathlib:Representation.norm_ofDistribMulAction_eq`, [projective-group-norm-surjectivity](#target-projective-group-norm-surjectivity).

**Inherited review contract:** Separate the representation transport and its trace compatibility in the planning API.

**Boundary:** Retained with the direct suppliers and current target-level API stated above..

**Consumers.**

- [normal-integral-basis](#target-normal-integral-basis): the normal integral basis is a basis of this module over A[G] of rank one
- [locally-free-lattice](#target-locally-free-lattice): local freeness of 𝓞_L is local freeness of this A[G]-lattice
- [associated-order](#target-associated-order): the associated order is the stabiliser of 𝓞_L inside K[G] acting on L through this construction
- [ring-of-integers-class](#target-ring-of-integers-class): the Galois module class is the class of this module in the locally free class group
- `Johnston, Notes on Galois modules, Section 1.3`: every statement about normal integral bases is a statement about 𝓞_L as an 𝓞_K[G]-module

**Sources.**

- [Notes on Galois Modules](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Definition 1.1 and Examples 1.3 (printed p. 1). The node is the left group-ring module structure on the ring of integers, Example 1.3(ii), over the group ring of the base ring of integers.
- [Notes on Galois Modules](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Definition 1.6 (printed p. 2). The definition presupposes exactly the O_K[G]-module structure constructed here.
- [Normal bases in Galois extensions of number fields](https://resolve.cambridge.org/core/services/aop-cambridge-core/content/view/CDAF1160D7312AB5A5E2D32BA8B540FF/S0027763000024521a.pdf/normal-bases-in-galois-extensions-of-number-fields.pdf), Chapter I, first paragraph (printed p. 154). The same structure in the AKLB generality used by the node.

<a id="target-rational-normal-basis-map"></a>

### The rational normal basis map K[G] ≅ L

**Target:** `ClassicalArithmeticCompletion:CA.7/rational-normal-basis-map` (construction).

Let L/K be a finite Galois extension of fields with group G. An element θ of L is a normal basis generator if its conjugates (σθ)_{σ∈G} are K-linearly independent, equivalently span L, equivalently form a K-basis of L. For a generator θ the map K[G] → L, x ↦ x·θ, is an isomorphism of left K[G]-modules, sending single σ c to c·σ(θ). Mathlib's IsGalois.normalBasis supplies the canonical generator θ₀ = normalBasis K L 1, and the normal basis map of L/K is the map attached to θ₀. For number fields, A = 𝓞_K and B = 𝓞_L, the map carries the group ring 𝓞_K[G] onto the 𝓞_K-lattice 𝓞_K[G]·θ₀ of L, which in general is not 𝓞_L.

**Hypotheses.**

- L/K is a finite Galois extension of fields: [FiniteDimensional K L] [IsGalois K L].
- The group ring acts on L through the Galois representation of the construction ring-of-integers-as-group-ring-module with A = K and B = L.

**API.**

- `NormalBasis.IsGenerator` (data): θ is a normal basis generator: its conjugates are K-linearly independent.
- `NormalBasis.isGenerator_normalBasis_one` (constructor): Mathlib's normal basis generator normalBasis K L 1 is a generator.
- `NormalBasis.isGenerator_iff_span` (characterisation): θ is a generator exactly when its conjugates span L.
- `NormalBasis.basisOfGenerator` (constructor): The K-basis (σθ)_σ of L defined by a generator.
- `NormalBasis.basisOfGenerator_apply` (simp): basisOfGenerator h σ = σθ.
- `NormalBasis.equivOfGenerator` (equivalence): The isomorphism K[G] ≃ L, x ↦ x·θ, for a generator θ.
- `NormalBasis.equivOfGenerator_single` (simp): single σ c ↦ c·σθ.
- `NormalBasis.equivOfGenerator_mul` (compatibility): equivOfGenerator (x * y) = x · equivOfGenerator y: the map is K[G]-linear.
- `NormalBasis.equiv` (data): The normal basis map attached to Mathlib's normal basis.

**Checks.**

- `NormalBasis.test_trivialGroup` (degenerate): Over the trivial group an element is a generator exactly when it is nonzero.
- `NormalBasis.test_one_not_generator` (non-example): In a nontrivial Galois extension 1 is not a generator: its conjugates are all equal.
- `NormalBasis.test_quadratic_generator` (computation): In a quadratic extension in characteristic different from two, with nontrivial sigma and sigma x=-x for x!=0, 1+x is a generator, as 1+i is for Q(i)/Q. In characteristic two this test is false (F4/F2,x=1).
- `NormalBasis.test_equiv_single_one` (compatibility): The normal basis map sends single σ 1 to σ(normalBasis K L 1), agreeing with Mathlib's normalBasis_apply.

**Proof route.**

1. Keep all three interfaces in one target API. In the quadratic worked example impose char K≠2; over F₄/F₂ the proposed 1+x test is excluded. Mathlib’s actual normal basis and equivariant coordinate map remain the suppliers.

**Dependencies:** `mathlib:IsGalois.normalBasis`, `mathlib:IsGalois.normalBasis_apply`, `mathlib:exists_linearIndependent_algEquiv_apply`, `mathlib:IsGalois.card_aut_eq_finrank`, [ring-of-integers-as-group-ring-module](#target-ring-of-integers-as-group-ring-module), `mathlib:basisOfLinearIndependentOfCardEqFinrank`.

**Inherited review contract:** Preserve the corrected quadratic hypothesis and basis/module equivalence.

**Boundary:** Retained with the direct suppliers and current target-level API stated above..

**Consumers.**

- [normal-basis-generators-differ-by-units](#target-normal-basis-generators-differ-by-units): two generators differ by a unit of K[G], computed through this map
- [associated-order](#target-associated-order): the associated order is defined inside K[G], identified with L by this map
- [lagrange-resolvent](#target-lagrange-resolvent): a normal basis generator is detected by its resolvents
- `Johnston, Remark 3.14(iii)`: via this isomorphism 𝓞_L is identified with an 𝓞_K-lattice in K[G]

**Sources.**

- [Notes on Galois Modules](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Theorem 1.4 (printed p. 1). The node packages the existence statement, which is Mathlib's IsGalois.normalBasis, as the K[G]-module isomorphism the theorem asserts.
- [Linear independence of characters](https://kconrad.math.uconn.edu/blurbs/galoistheory/linearchar.pdf), Section 3, Example 3.1 (p. 2). The example has base R and characteristic zero. Its quadratic generalisation needs 2!=0, as the determinant is -2x; it is false over F4/F2.

<a id="target-normal-basis-generators-differ-by-units"></a>

### Normal basis generators differ by units of the group algebra

**Target:** `ClassicalArithmeticCompletion:CA.7/normal-basis-generators-differ-by-units` (lemma).

Let L/K be finite Galois with group G and let θ be a normal basis generator. An element β of L is a normal basis generator if and only if β = u·θ for a unit u of K[G]; the unit is unique.

**Hypotheses.**

- L/K finite Galois; θ a normal basis generator.

**Proof route.**

1. By the normal basis map, β = u·θ for a unique u ∈ K[G].
2. β is a generator exactly when x ↦ x·β = (x u)·θ is bijective, that is when right multiplication by u on K[G] is bijective.
3. K[G] is finite dimensional over K, so right multiplication by u is bijective exactly when it is injective, exactly when u is a unit.

**Dependencies:** [rational-normal-basis-map](#target-rational-normal-basis-map), `mathlib:MonoidAlgebra`.

**Sources.**

- [Notes on Galois Modules](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Remark 1.5 (printed p. 2). The mathematical contract, with the conventions stated here; uniqueness of u is the injectivity of the normal basis map.

<a id="target-normal-integral-basis"></a>

### Normal integral bases

**Target:** `ClassicalArithmeticCompletion:CA.7/normal-integral-basis` (definition).

Let A be a commutative ring, B a commutative A-algebra and G a finite Galois group of B/A (IsGaloisGroup G A B). An element α of B generates a normal integral basis if its conjugates (g·α)_{g∈G} form an A-basis of B: they are A-linearly independent and span B. Equivalently the A[G]-linear map A[G] → B, x ↦ x·α, is bijective, so B is free of rank one over A[G] with basis α. B has a normal integral basis over A if some α generates one. For a finite Galois extension of number fields L/K the relevant case is A = 𝓞_K, B = 𝓞_L, G = Gal(L/K); for a finite Galois extension of nonarchimedean local fields it is A = 𝒪_K, B = 𝒪_L.

**Hypotheses.**

- G is finite and is a Galois group of B/A in Mathlib's sense.
- The basis is indexed by G itself, as in Mathlib's IsGalois.normalBasis, not by an arbitrary finite type.

**API.**

- `IntegralGaloisModule.IsNIBGenerator` (data): α generates a normal integral basis: (gα)_g is an A-basis of B.
- `IntegralGaloisModule.HasNIB` (data): B has a normal integral basis over A.
- `IntegralGaloisModule.IsNIBGenerator.basis` (constructor): The A-basis of B indexed by G defined by a generator.
- `IntegralGaloisModule.IsNIBGenerator.basis_apply` (simp): basis g = g·α.
- `IntegralGaloisModule.isNIBGenerator_iff_bijective` (characterisation): α generates exactly when x ↦ x·α, A[G] → B, is bijective (B free of rank one over A[G]).
- `IntegralGaloisModule.IsNIBGenerator.unit_smul` (relation): u·α generates for every unit u of A[G].
- `IntegralGaloisModule.IsNIBGenerator.exists_unit` (relation): Two generators differ by a unit of A[G].
- `IntegralGaloisModule.IsNIBGenerator.isGenerator` (compatibility): For number fields a normal integral basis generator is a normal basis generator of L/K.

**Checks.**

- `IntegralGaloisModule.nib_test_trivialGroup` (degenerate): For a trivial Galois group and an injective algebraMap A B, alpha generates exactly when it is a unit. Injectivity is necessary: Z->F2,alpha=1 is a counterexample without it.
- `IntegralGaloisModule.nib_test_one_not_generator` (non-example): For a nontrivial group 1 does not generate: its conjugates coincide.
- `IntegralGaloisModule.nib_test_cyclotomicPrime` (computation): For an odd prime p, ζ_p generates a normal integral basis of ℚ(ζ_p)/ℚ.

**Proof route.**

1. The trivial-group assertion that a generates A requires injective A→B. Z→F₂ is a discriminating failure. Generator predicate, existence predicate and basis are APIs of this single target; the integral lattice spans its fraction-field extension.

**Dependencies:** [ring-of-integers-as-group-ring-module](#target-ring-of-integers-as-group-ring-module), [rational-normal-basis-map](#target-rational-normal-basis-map), `mathlib:IsGaloisGroup`, `mathlib:MonoidAlgebra`, `mathlib:Module.Free`.

**Inherited review contract:** Keep the injective trivial-group test and field compatibility.

**Boundary:** Retained with the direct suppliers and current target-level API stated above..

**Consumers.**

- [tame-of-normal-integral-basis](#target-tame-of-normal-integral-basis): Speiser: an extension with a normal integral basis is tame
- [local-noether](#target-local-noether): Noether: a local extension has a normal integral basis exactly when it is tame
- [hilbert-speiser](#target-hilbert-speiser): Hilbert–Speiser: an abelian number field has a normal integral basis exactly when it is tame
- [gaussian-integers-have-no-normal-integral-basis](#target-gaussian-integers-have-no-normal-integral-basis): the counterexample gate is a negative statement about this predicate
- `Taylor 1981, Section 2`: Noether gives a ∈ 𝓞_M with a·𝓞_{N,l}Γ = 𝓞_{M,l}, a local normal integral basis at each l

**Sources.**

- [Notes on Galois Modules](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Definition 1.6 (printed p. 2). The definition in the conventions used here, stated for any Galois group of B/A so that the number-field and local cases are the same declaration.
- [Notes on Galois Modules](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Remark 3.14(ii) (printed p. 6). The compatibility item: a normal integral basis generator is a rational normal basis generator.
- [Normal bases in Galois extensions of number fields](https://resolve.cambridge.org/core/services/aop-cambridge-core/content/view/CDAF1160D7312AB5A5E2D32BA8B540FF/S0027763000024521a.pdf/normal-bases-in-galois-extensions-of-number-fields.pdf), Definition following Corollary 1.4 (printed p. 156). The same definition for the ring of integers.

<a id="target-trace-of-normal-integral-basis-generator"></a>

### The trace of a normal integral basis generator generates for a Galois subextension

**Target:** `ClassicalArithmeticCompletion:CA.7/trace-of-normal-integral-basis-generator` (lemma).

Let L/K be a finite Galois extension of number fields, or of nonarchimedean local fields, with group G, let F be an intermediate field with F/K Galois, H = Gal(L/F) and Γ = Gal(F/K) ≅ G/H, and let 𝒪 denote rings of integers (valuation rings in the local case). If α ∈ 𝒪_L generates a normal integral basis of L/K then Tr_{L/F}(α) ∈ 𝒪_F generates a normal integral basis of F/K. The proof uses only that G is a finite Galois group of 𝒪_L over 𝒪_K, H a Galois group of 𝒪_L over 𝒪_F and Γ one of 𝒪_F over 𝒪_K, so the statement is made in that Galois-group form, with Tr_{L/F}(α) replaced by the element of 𝒪_F whose image is Σ_{h∈H} h(α).

**Hypotheses.**

- L/K and F/K finite Galois, K ⊆ F ⊆ L number fields or nonarchimedean local fields; in Galois-group form A ⊆ B ⊆ C with C a domain, IsGaloisGroup G A C, IsGaloisGroup H B C for a subgroup H, and IsGaloisGroup Γ A B (H is then normal and restriction G → Γ is onto).
- The trace is Mathlib's Algebra.intTrace 𝓞_F 𝓞_L.

**Proof route.**

1. The orbit-sum theorem works over complete DVRs and integrally closed bases without dividing by |H|. For normal H its basis is the G/H-normal basis.

**Dependencies:** [normal-integral-basis](#target-normal-integral-basis), [ring-of-integers-as-group-ring-module](#target-ring-of-integers-as-group-ring-module), `mathlib:Algebra.intTrace`, `mathlib:trace_eq_sum_automorphisms`, `mathlib:IsGaloisGroup.restrictHom`, `mathlib:IsGaloisGroup.algebraMap_restrictHom_smul`, `mathlib:IsGaloisGroup.restrictHom_surjective`, [normal-trace-descent](#target-normal-trace-descent).

**Inherited review contract:** Supply a local and general-base trace descent.

**Boundary:** Retained with the direct suppliers and current target-level API stated above..

**Sources.**

- [Notes on Galois Modules](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Proposition 6.1 with its proof (printed pp. 10–11). The mathematical contract, with the conventions stated here.
- [Normal bases in Galois extensions of number fields](https://resolve.cambridge.org/core/services/aop-cambridge-core/content/view/CDAF1160D7312AB5A5E2D32BA8B540FF/S0027763000024521a.pdf/normal-bases-in-galois-extensions-of-number-fields.pdf), Proposition 1.6 (printed p. 156). The same statement for ambiguous ideals; the ring of integers is the case 𝔄 = O_K.
- [Linear independence of characters](https://kconrad.math.uconn.edu/blurbs/galoistheory/linearchar.pdf), Theorem 3.8 (p. 5). The rational analogue, whose proof is the same regrouping.

<a id="target-trace-surjective-of-normal-integral-basis"></a>

### A normal integral basis forces the trace to be surjective

**Target:** `ClassicalArithmeticCompletion:CA.7/trace-surjective-of-normal-integral-basis` (lemma).

Let L/K be a finite Galois extension of number fields with a normal integral basis, and F an intermediate field. Then Tr_{L/F}(𝓞_L) = 𝓞_F; in particular Tr_{L/K}(𝓞_L) = 𝓞_K. In the Galois-group form: if B has a normal integral basis over A for the Galois group G, then Tr_{B/A} : B → A is surjective.

**Hypotheses.**

- L/K finite Galois; F any intermediate field (F/K need not be Galois: the regrouping runs over the cosets of Gal(L/F) in G).

**Proof route.**

1. The same orbit-sum basis of B^H works for nonnormal H, giving surjective trace to any fixed field; quotient-group freeness is claimed only for normal H.

**Dependencies:** [trace-of-normal-integral-basis-generator](#target-trace-of-normal-integral-basis-generator), [normal-integral-basis](#target-normal-integral-basis), `mathlib:Algebra.intTrace`, `mathlib:trace_eq_sum_automorphisms`, `mathlib:Algebra.algebraMap_intTrace`, [normal-trace-descent](#target-normal-trace-descent).

**Inherited review contract:** Treat arbitrary intermediate fields and stabilizer sums.

**Boundary:** Retained with the direct suppliers and current target-level API stated above..

**Sources.**

- [Notes on Galois Modules](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Corollary 6.2 (printed p. 11). The mathematical contract, with the conventions stated here.

<a id="target-tamely-ramified"></a>

### Tamely ramified extensions of Dedekind domains

**Target:** `ClassicalArithmeticCompletion:CA.7/tamely-ramified` (definition).

Let B/A be an extension of commutative rings and P a prime of B lying over p = P ∩ A. B/A is tamely ramified at P if the residue extension (B/P)/(A/p) is separable and the characteristic of A/p does not divide the ramification index e(P|p) (Mathlib's P.ramificationIdx A). B/A is tamely ramified if it is tamely ramified at every nonzero prime of B. When the residue fields are finite (number fields, nonarchimedean local fields) the separability condition holds automatically and the condition is p ∤ e(P|p) for every P, which is the definition of the sources; the separability clause is the convention of Tau Ceti's NumberFieldArithmetic roadmap, so that the predicate is correct in every characteristic.

**Hypotheses.**

- The ramification index is the unprimed Mathlib P.ramificationIdx A (prime P of B first, base ring A second).
- The base prime is P.under A with the LiesOver instance Ideal.over_under.
- The residue characteristic is ringChar (A ⧸ P.under A).

**API.**

- `IntegralGaloisModule.IsTamelyRamifiedAt` (data): Tameness at a prime P of B: separable residue extension and residue characteristic not dividing e(P|p).
- `IntegralGaloisModule.IsTamelyRamified` (data): Tameness at every nonzero prime of B.
- `IntegralGaloisModule.isTamelyRamifiedAt_iff_of_finite` (characterisation): With finite residue fields, tameness at P is p ∤ e(P|p).
- `IntegralGaloisModule.isTamelyRamifiedAt_of_ramificationIdx_eq_one` (constructor): An unramified prime with separable residue extension is tame.
- `IntegralGaloisModule.isTamelyRamified_trans_iff` (functoriality): In a tower A ⊆ B ⊆ C of Dedekind domains, C/A is tame exactly when B/A and C/B are.
- `IntegralGaloisModule.isTamelyRamified_numberField_iff` (compatibility): For number fields, tameness is p ∤ e(P|p) at every nonzero prime P of 𝓞_L, the convention of the NumberFieldArithmetic roadmap.

**Checks.**

- `IntegralGaloisModule.tame_test_self` (degenerate): The trivial extension A/A of a Dedekind domain is tamely ramified.
- `IntegralGaloisModule.tame_test_cyclotomicPrime` (computation): ℚ(ζ_p)/ℚ is tamely ramified for an odd prime p.
- `IntegralGaloisModule.tame_test_gaussian_not_tame` (non-example): ℚ(i)/ℚ is not tamely ramified: e = 2 at the prime above 2.

**Proof route.**

1. Keep the existing predicate. Tower API uses e(top/base)=e(top/middle)e(middle/base) and separability transitivity under the finite integral-closure setup of LocalFieldsRamification Layer3; omit neither residue separability nor the tower setup.

**Dependencies:** `mathlib:Ideal.ramificationIdx`, `mathlib:Algebra.IsSeparable`, `mathlib:Ideal.LiesOver`, `mathlib:Ideal.ramificationIdxIn_mul_ramificationIdxIn`, `mathlib:IsDedekindDomain`, `mathlib:Ideal.ramificationIdx_tower`, `mathlib:Algebra.IsSeparable.trans`, `mathlib:Ideal.Quotient.algebraOfLiesOver`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-3-ramification-the-tame-and-wild-cases-and-the-filtration`.

**Inherited review contract:** Require finite injective torsion-free towers and residue separability.

**Boundary:** Retained with the direct suppliers and current target-level API stated above..

**Consumers.**

- [tame-iff-trace-surjective](#target-tame-iff-trace-surjective): tameness is characterised by surjectivity of the trace
- [noether-theorem](#target-noether-theorem): tameness is the condition in Noether's theorem
- [hilbert-speiser](#target-hilbert-speiser): tameness is the condition in the Hilbert–Speiser theorem
- [local-noether](#target-local-noether): local tameness gives a local normal integral basis
- `Taylor 1981, Introduction`: the theorem is stated for tame Galois extensions M/N

**Sources.**

- [Notes on Galois Modules](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Definition 7.1 (printed p. 13). The node is this definition, with the residue-separability clause made explicit.
- [Normal bases in Galois extensions of number fields](https://resolve.cambridge.org/core/services/aop-cambridge-core/content/view/CDAF1160D7312AB5A5E2D32BA8B540FF/S0027763000024521a.pdf/normal-bases-in-galois-extensions-of-number-fields.pdf), Definition, Chapter I (printed p. 154). The same definition; Ullom assumes separable residue extensions throughout, which is the separability clause.

<a id="target-trace-modulo-a-prime"></a>

### The trace modulo a prime in a Galois extension

**Target:** `ClassicalArithmeticCompletion:CA.7/trace-modulo-a-prime` (lemma).

Let B/A be a finite extension of Dedekind domains with a finite Galois group G (IsGaloisGroup G A B), p a nonzero prime of A with pB = (P_1⋯P_g)^e, and x ∈ B. In A/p, Tr_{(B/pB)/(A/p)}(x mod pB) = e·Σ_{i=1}^{g} Tr_{(B/P_i)/(A/p)}(x mod P_i); and by Mathlib this is (Tr_{B/A} x) mod p.

**Hypotheses.**

- p nonzero maximal; e = p.ramificationIdxIn B, the common ramification index of the primes over p in the Galois case.

**Proof route.**

1. The new target proves the nonroutine prime-power multiplier; the accepted ideal CRT and finite-projective scalar trace finish the displayed sum. The whole primary quotient is an A/p-vector space, not a B/P-vector space.

**Dependencies:** `mathlib:Algebra.trace_quotient_eq_of_isDedekindDomain`, `mathlib:Ideal.ramificationIdxIn`, `mathlib:Algebra.intTrace`, [tamely-ramified](#target-tamely-ramified), `mathlib:IsDedekindDomain.quotientEquivPiOfProdEq`, [residue-trace-filtration](#target-residue-trace-filtration), [finite-dedekind-torsionfree-projective](#target-finite-dedekind-torsionfree-projective), `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-1-the-splitting-dictionary`.

**Inherited review contract:** Supply the primary filtration trace after CRT.

**Boundary:** Retained with the direct suppliers and current target-level API stated above..

**Sources.**

- [Notes on Galois Modules](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Proof of Proposition 7.2, equation (5) (printed p. 13). The node is equation (5) with its proof.

<a id="target-prime-divides-trace-ideal-iff-not-tame"></a>

### A prime divides the trace ideal exactly when it is not tame

**Target:** `ClassicalArithmeticCompletion:CA.7/prime-divides-trace-ideal-iff-not-tame` (theorem).

Let B/A be a finite extension of Dedekind domains with a finite Galois group G, and p a nonzero prime of A. Then Tr_{B/A}(B) ⊆ p if and only if some prime P of B over p is not tamely ramified.

**Hypotheses.**

- Galois case: all primes over p have the same ramification index.
- Tr_{B/A}(B) is an ideal of A.

**Proof route.**

1. Use NFA1 for normal conjugate residue extensions. A finite normal separable residue trace is onto; an inseparable trace is zero. Combine with the ramification multiplier and CRT, keeping this dichotomy.

**Dependencies:** [trace-modulo-a-prime](#target-trace-modulo-a-prime), [tamely-ramified](#target-tamely-ramified), `mathlib:Algebra.trace_eq_zero_of_not_isSeparable`, `mathlib:Algebra.trace_ne_zero`, [residue-trace-filtration](#target-residue-trace-filtration), `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-1-the-splitting-dictionary`.

**Inherited review contract:** Expose residue action and inseparable traces.

**Boundary:** Retained with the direct suppliers and current target-level API stated above..

**Sources.**

- [Notes on Galois Modules](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Proposition 7.2 (printed p. 13). The node, with "wildly ramified" read as "not tame", which includes the residue-separability clause of the definition node.
- [Normal bases in Galois extensions of number fields](https://resolve.cambridge.org/core/services/aop-cambridge-core/content/view/CDAF1160D7312AB5A5E2D32BA8B540FF/S0027763000024521a.pdf/normal-bases-in-galois-extensions-of-number-fields.pdf), Corollary 1.2 (printed p. 155). For 𝔄 = O_K this is the tame direction: the trace of O_K is O_F.

<a id="target-tame-iff-trace-surjective"></a>

### Tame ramification is surjectivity of the trace

**Target:** `ClassicalArithmeticCompletion:CA.7/tame-iff-trace-surjective` (theorem).

Let B/A be a finite extension of Dedekind domains with a finite Galois group G. Then B/A is tamely ramified if and only if Tr_{B/A} : B → A is surjective. For a finite Galois extension of number fields L/K: L/K is tame if and only if Tr_{L/K}(𝓞_L) = 𝓞_K.

**Hypotheses.**

- Galois case, as in the previous theorem.

**Proof route.**

1. For a field A the integral closure is a finite separable field extension, whose nonzero trace is onto. For nonfields a proper trace ideal lies in a nonzero maximal prime; the residue criterion excludes it. No completion predicate is invoked in the field branch.

**Dependencies:** [prime-divides-trace-ideal-iff-not-tame](#target-prime-divides-trace-ideal-iff-not-tame), `mathlib:Algebra.intTrace`, `mathlib:Algebra.trace_surjective`.

**Inherited review contract:** Treat the coefficient-field case.

**Boundary:** Retained with the direct suppliers and current target-level API stated above..

**Sources.**

- [Notes on Galois Modules](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Corollary 7.3 (printed p. 13). The mathematical contract, with the conventions stated here.

<a id="target-tame-of-normal-integral-basis"></a>

### Speiser: a normal integral basis forces tame ramification

**Target:** `ClassicalArithmeticCompletion:CA.7/tame-of-normal-integral-basis` (theorem).

If B/A (a finite extension of Dedekind domains with finite Galois group G) has a normal integral basis, then B/A is tamely ramified. In particular a finite Galois extension of number fields or of nonarchimedean local fields with a normal integral basis is tamely ramified.

**Hypotheses.**

- Galois case.

**Proof route.**

1. A normal integral basis makes the trace surjective (trace-surjective-of-normal-integral-basis).
2. Surjectivity of the trace is tameness (tame-iff-trace-surjective).

**Dependencies:** [trace-surjective-of-normal-integral-basis](#target-trace-surjective-of-normal-integral-basis), [tame-iff-trace-surjective](#target-tame-iff-trace-surjective).

**Sources.**

- [Notes on Galois Modules](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Corollary 7.4 (printed p. 14). The mathematical contract, with the conventions stated here (the source has a slip of grammar, "Let L/K is").
- [Normal bases in Galois extensions of number fields](https://resolve.cambridge.org/core/services/aop-cambridge-core/content/view/CDAF1160D7312AB5A5E2D32BA8B540FF/S0027763000024521a.pdf/normal-bases-in-galois-extensions-of-number-fields.pdf), Introduction (printed p. 153). The attribution to Speiser.

<a id="target-gaussian-integers-have-no-normal-integral-basis"></a>

### ℚ(i)/ℚ: a rational normal basis that is not integral

**Target:** `ClassicalArithmeticCompletion:CA.7/gaussian-integers-have-no-normal-integral-basis` (application).

For the Gaussian field L = ℚ(i) with G = Gal(L/ℚ) = {1, σ}: 1 + i generates a normal basis of L/ℚ, but L/ℚ has no normal integral basis. Concretely, for α = a + bi ∈ ℤ[i] the conjugates a + bi, a − bi have change-of-basis determinant −2ab relative to {1, i}, never ±1; equivalently Tr(ℤ[i]) = 2ℤ ≠ ℤ, and 2 is wildly ramified.

**Hypotheses.**

- L is the cyclotomic field ℚ(ζ_4) = ℚ(i).

**Proof route.**

1. Compute Tr(a+bi)=2a, disc(1,i)=−4 and (2)=(1+i)² up to a unit. Hence trace is not onto and NIB is impossible. The four conclusions are checks of this example at current target level.

**Dependencies:** [tame-of-normal-integral-basis](#target-tame-of-normal-integral-basis), [rational-normal-basis-map](#target-rational-normal-basis-map), [tamely-ramified](#target-tamely-ramified), `mathlib:IsCyclotomicExtension.Rat.ramificationIdx_eq`.

**Inherited review contract:** Keep the full discriminant/trace/wild example as one acceptance target.

**Boundary:** Retained with the direct suppliers and current target-level API stated above..

**Sources.**

- [Notes on Galois Modules](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Example 3.16 (printed p. 6). Johnston notes that ℚ(i)/ℚ is wildly ramified at 2 and that 1 + i generates ℤ[i] over the associated order ℤ[e_1, e_{−1}], which strictly contains ℤ[G]; with his Proposition 3.15 this excludes a normal integral basis. The node records the two halves directly: 1 + i is a rational normal basis generator, and no element generates ℤ[i] over ℤ[G].
- [Linear independence of characters](https://kconrad.math.uconn.edu/blurbs/galoistheory/linearchar.pdf), Example 3.1 (p. 2). The same computation over ℝ: 1 + i and 1 − i form a normal basis of ℂ/ℝ; the identical determinant argument gives the rational half of the gate for ℚ(i)/ℚ.

<a id="target-rim-projectivity-criterion"></a>

### Rim's criterion for projectivity over a group ring

**Target:** `ClassicalArithmeticCompletion:CA.7/rim-projectivity-criterion` (lemma).

Let R be a commutative ring, G a finite group and M a left R[G]-module that is projective as an R-module. If there is an R-linear endomorphism φ of M with Σ_{g∈G} g·φ(g⁻¹·m) = m for all m ∈ M, then M is projective as an R[G]-module.

**Hypotheses.**

- G finite; M projective over R; the scalar tower R → R[G] → M.

**Proof route.**

1. The accepted Module.Projective.tensorProduct already allows a noncommutative algebra over central R. Keep μ(x⊗m)=xm and s(m)=Σg g⊗φ(g⁻¹m) as the proof construction; reindex to prove group-ring linearity and μs=id. Do not duplicate the pinned tensor carrier.

**Dependencies:** `mathlib:Module.Projective`, `mathlib:Module.Projective.of_split`, `mathlib:MonoidAlgebra`, `mathlib:Module.Projective.tensorProduct`.

**Inherited review contract:** Make the central tensor and split maps precise.

**Boundary:** Retained with the direct suppliers and current target-level API stated above..

**Sources.**

- [Normal bases in Galois extensions of number fields](https://resolve.cambridge.org/core/services/aop-cambridge-core/content/view/CDAF1160D7312AB5A5E2D32BA8B540FF/S0027763000024521a.pdf/normal-bases-in-galois-extensions-of-number-fields.pdf), Proof of Proposition 1.3 (printed p. 156). The criterion as Ullom quotes it; the proof steps are the standard splitting of the induced module.

<a id="target-projective-of-tame"></a>

### Ullom: tame ramification makes the integers projective over the group ring

**Target:** `ClassicalArithmeticCompletion:CA.7/projective-of-tame` (theorem).

Let B/A be a finite extension of Dedekind domains with finite Galois group G. If B/A is tamely ramified then B is a projective A[G]-module (and projective over A[H] for every subgroup H). In particular, for a tame finite Galois extension of number fields, 𝓞_L is a finitely generated projective 𝓞_K[G]-module.

**Hypotheses.**

- Galois case; tame.

**Proof route.**

1. Finite torsion-free Dedekind modules are projective by the constructive Steinitz argument. Trace-one multiplication satisfies Rim’s condition. Restrict a projective A[G]-module to A[H], since the larger ring is finite free on cosets.

**Dependencies:** [rim-projectivity-criterion](#target-rim-projectivity-criterion), [tame-iff-trace-surjective](#target-tame-iff-trace-surjective), [ring-of-integers-as-group-ring-module](#target-ring-of-integers-as-group-ring-module), `mathlib:IsDedekindDomain.flat_iff_torsion_eq_bot`, `mathlib:Module.Flat.projective_of_finitePresentation`, `mathlib:Module.finitePresentation_of_finite`, [finite-dedekind-torsionfree-projective](#target-finite-dedekind-torsionfree-projective), [projective-group-norm-surjectivity](#target-projective-group-norm-surjectivity).

**Inherited review contract:** Supply coefficient projectivity and subgroup restrictions.

**Boundary:** Retained with the direct suppliers and current target-level API stated above..

**Sources.**

- [Normal bases in Galois extensions of number fields](https://resolve.cambridge.org/core/services/aop-cambridge-core/content/view/CDAF1160D7312AB5A5E2D32BA8B540FF/S0027763000024521a.pdf/normal-bases-in-galois-extensions-of-number-fields.pdf), Proposition 1.3 with its proof (printed p. 156). The node is the case 𝔄 = O_K; Ullom allows any subgroup H of G, which the node records in parentheses. His proof takes ρ to be multiplication by an integer whose trace from K down to the fixed field of H is 1.

<a id="target-trace-surjective-of-projective"></a>

### Projectivity over the group ring forces the trace to be surjective

**Target:** `ClassicalArithmeticCompletion:CA.7/trace-surjective-of-projective` (lemma).

Let B/A be a finite extension of Dedekind domains with finite Galois group G. If B is projective as an A[G]-module then Tr_{B/A}(B) = A; hence B/A is tamely ramified.

**Hypotheses.**

- Galois case.

**Proof route.**

1. The strengthened norm target proves the isomorphism from coinvariants to invariants for free modules and projective retracts, so it also supplies the augmentation computation.

**Dependencies:** [tame-iff-trace-surjective](#target-tame-iff-trace-surjective), [ring-of-integers-as-group-ring-module](#target-ring-of-integers-as-group-ring-module), `mathlib:Module.Projective`, `mathlib:Algebra.IsInvariant`, [projective-group-norm-surjectivity](#target-projective-group-norm-surjectivity).

**Inherited review contract:** Identify the free norm map and transport to retracts.

**Boundary:** Retained with the direct suppliers and current target-level API stated above..

**Sources.**

- [Normal bases in Galois extensions of number fields](https://resolve.cambridge.org/core/services/aop-cambridge-core/content/view/CDAF1160D7312AB5A5E2D32BA8B540FF/S0027763000024521a.pdf/normal-bases-in-galois-extensions-of-number-fields.pdf), Corollary 1.4 (printed p. 156). Ullom states without proof that tame ambiguous ideals are cohomologically trivial, deducing it from their projectivity (Proposition 1.3). The node is the Ĥ⁰ part of the fact behind that deduction, that projective modules have B^G = N·B, used in the converse direction.
- [Notes on Galois Modules](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Proof of Proposition 9.9 (printed p. 19). The wild case is detected by the trace ideal, which is what the node's last step uses.

<a id="target-local-unramified-normal-integral-basis"></a>

### Unramified local extensions have a normal integral basis

**Target:** `ClassicalArithmeticCompletion:CA.7/local-unramified-normal-integral-basis` (theorem).

Let L/K be a finite unramified Galois extension of nonarchimedean local fields with group G. Then 𝒪_L has a normal integral basis over 𝒪_K; more precisely, any lift α ∈ 𝒪_L of a normal basis generator of the residue extension l/k generates one.

**Hypotheses.**

- A is a complete discrete valuation ring with finite residue field k of cardinality q and characteristic p (the ring of integers of a nonarchimedean local field K, in the vocabulary of the LocalFieldsRamification roadmap); K = Frac A.
- L/K is a finite Galois extension with group G and B is the integral closure of A in L (the valuation ring of L); IsGaloisGroup G A B.
- L/K unramified: e = 1.

**Proof route.**

1. For any integral lift of a residue normal generator, reduction of its conjugates is a basis. Nakayama gives generation, and equal finite DVR ranks give independence. Import the residue Galois action and lifting carrier from LFR2.

**Dependencies:** `mathlib:Submodule.le_of_le_smul_of_le_jacobson_bot`, [normal-integral-basis](#target-normal-integral-basis), `mathlib:exists_linearIndependent_algEquiv_apply`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius`.

**Inherited review contract:** State every residue-generator lift, not just existence.

**Boundary:** Retained with the direct suppliers and current target-level API stated above..

**Sources.**

- [Notes on Galois Modules](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Proposition 9.1 with its proof (printed p. 15). The mathematical contract; the proof is by Nakayama from a residue normal basis, as in the steps. Johnston states this for p-adic fields; the node's hypotheses (complete discrete valuation ring with finite residue field) also cover local fields of equal characteristic, where every step of the proof applies unchanged.

<a id="target-local-totally-tamely-ramified-normal-integral-basis"></a>

### Totally and tamely ramified local extensions have a normal integral basis

**Target:** `ClassicalArithmeticCompletion:CA.7/local-totally-tamely-ramified-normal-integral-basis` (theorem).

Let L/K be a totally and tamely ramified Galois extension of nonarchimedean local fields of degree e, with a uniformiser π_L of L satisfying π_L^e = π_K, a uniformiser of K. Then for any units u_0, …, u_{e−1} of 𝒪_K, α = Σ_{j=0}^{e−1} u_j π_L^j generates a normal integral basis of L/K.

**Hypotheses.**

- A is a complete discrete valuation ring with finite residue field k of cardinality q and characteristic p (the ring of integers of a nonarchimedean local field K, in the vocabulary of the LocalFieldsRamification roadmap); K = Frac A.
- L/K is a finite Galois extension with group G and B is the integral closure of A in L (the valuation ring of L); IsGaloisGroup G A B.
- L/K totally ramified of degree e = [L : K] with p ∤ e; π_L^e = π_K.

**Proof route.**

1. If e is prime to the residue characteristic, distinct e-th roots of unity stay distinct modulo the maximal ideal. The determinant of the matrix (ζ^(ij)) is the product of their pairwise differences, hence a unit. Transform the power basis of π_L into the conjugates of (1+π_L+⋯+π_L^(e−1))/e. All degree and tame hypotheses remain.

**Dependencies:** `mathlib:Matrix.det_vandermonde`, `mathlib:IsPrimitiveRoot.prod_one_sub_pow_eq_order`, [normal-integral-basis](#target-normal-integral-basis), `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-3-ramification-the-tame-and-wild-cases-and-the-filtration`.

**Inherited review contract:** Record the Vandermonde and unit-root argument.

**Boundary:** Retained with the direct suppliers and current target-level API stated above..

**Sources.**

- [Notes on Galois Modules](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Proposition 9.4 with its proof (printed p. 16). The mathematical contract. Johnston states this for p-adic fields; the node's hypotheses (complete discrete valuation ring with finite residue field) also cover local fields of equal characteristic, where every step of the proof applies unchanged.
- [Notes on Galois Modules](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Proposition 9.2 (printed p. 15). The Kummer structure used in the first step; it is the tame theorem of LocalFieldsRamification Layer 3 and is imported, not re-planned.

<a id="target-local-tame-uniformiser"></a>

### Normalising a uniformiser of a tame local extension

**Target:** `ClassicalArithmeticCompletion:CA.7/local-tame-uniformiser` (lemma).

Let L/K be a finite tamely ramified Galois extension of nonarchimedean local fields with ramification index e, residue degree f and residue field of K of cardinality q. Then e divides q^f − 1, and for every uniformiser π_K of K there are a uniformiser π_L of L and a (q^f − 1)-st root of unity v in L with π_L^e = v·π_K.

**Hypotheses.**

- A is a complete discrete valuation ring with finite residue field k of cardinality q and characteristic p (the ring of integers of a nonarchimedean local field K, in the vocabulary of the LocalFieldsRamification roadmap); K = Frac A.
- L/K is a finite Galois extension with group G and B is the integral closure of A in L (the valuation ring of L); IsGaloisGroup G A B.
- L/K tamely ramified: p ∤ e.

**Proof route.**

1. Write π_L^e=uπ_K, decompose u into its Teichmüller root and a principal unit. The principal-unit e-th root follows from Hensel since e is a unit. This is already LFR3’s target and is imported.

**Dependencies:** `tauceti:TauCeti.teichmuller`, `tauceti:TauCeti.residue_teichmuller`, `mathlib:HenselianLocalRing`, [tamely-ramified](#target-tamely-ramified), `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-3-ramification-the-tame-and-wild-cases-and-the-filtration`.

**Inherited review contract:** Specify the Hensel correction and roots-of-unity carrier.

**Boundary:** Retained with the direct suppliers and current target-level API stated above..

**Sources.**

- [Notes on Galois Modules](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Proof of Theorem 9.5, first paragraph of printed p. 17 (equation (8) and the divisibility e | q^f − 1), before the field diagram. The node, with the adaptation written out from the proof of Proposition 9.2(i).
- [Notes on Galois Modules](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Proof of Theorem 9.5 (printed p. 17). The divisibility half.

<a id="target-local-tame-split-extension"></a>

### The split tame extension above a tame local extension

**Target:** `ClassicalArithmeticCompletion:CA.7/local-tame-split-extension` (lemma).

Let L/K be a finite tamely ramified Galois extension of nonarchimedean local fields with ramification index e and residue degree f, and let L′ be the unramified extension of L of degree e. Then L′/K is Galois and tame; its maximal unramified subextension L′_0 has degree ef over K; there is π′ ∈ L′ with π′^e = π_K; K′ = K(π′) is totally and tamely ramified of degree e over K; L′_0 ∩ K′ = K and L′ = L′_0·K′. Writing I = Gal(L′/L′_0) and Γ = Gal(L′/K′), I is normal in G′ = Gal(L′/K), I ∩ Γ = 1 and IΓ = G′.

**Hypotheses.**

- A is a complete discrete valuation ring with finite residue field k of cardinality q and characteristic p (the ring of integers of a nonarchimedean local field K, in the vocabulary of the LocalFieldsRamification roadmap); K = Frac A.
- L/K is a finite Galois extension with group G and B is the integral closure of A in L (the valuation ring of L); IsGaloisGroup G A B.
- L/K tamely ramified with invariants e, f.

**Proof route.**

1. Keep L′_0/K of degree ef, not L′_0/L_0 of that degree. In the q^f−1 geometric factor each term is 1 modulo e, so e(q^f−1) divides q^(ef)−1. The root adjustment gives π′^e=π_K, the Eisenstein degree, compositum and I⋊Γ splitting.

**Dependencies:** [local-tame-uniformiser](#target-local-tame-uniformiser), [tamely-ramified](#target-tamely-ramified), `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-3-ramification-the-tame-and-wild-cases-and-the-filtration`.

**Inherited review contract:** Retain the corrected maximal-unramified base and splitting data.

**Boundary:** Retained with the direct suppliers and current target-level API stated above..

**Sources.**

- [Notes on Galois Modules](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Proof of Theorem 9.5 (printed pp. 16–17). The node collects the construction of the proof.
- [Notes on Galois Modules](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Remark 9.6 (printed p. 17). The group-theoretic splitting I ∩ Γ = 1, IΓ = G′.

<a id="target-normal-integral-basis-of-split-extension"></a>

### Normal integral bases multiply across a split extension

**Target:** `ClassicalArithmeticCompletion:CA.7/normal-integral-basis-of-split-extension` (lemma).

Let N/K be a finite Galois extension with group G (of number fields or of nonarchimedean local fields), I a normal subgroup and Γ a subgroup with I ∩ Γ = 1 and IΓ = G; put N_0 = N^I and M = N^Γ. If β ∈ 𝒪_{N_0} generates a normal integral basis of N_0/K (group G/I ≅ Γ) and α ∈ 𝒪_M generates a normal integral basis of N/N_0 (group I), then αβ generates a normal integral basis of N/K.

**Hypotheses.**

- G = IΓ with I normal and I ∩ Γ = 1, so every g ∈ G is uniquely hγ with h ∈ I, γ ∈ Γ.
- α ∈ N^Γ and β ∈ N^I.

**Proof route.**

1. The exact NIB definition remains inherited. A basis tower gives h(α)γ(β), and γ fixes α while I fixes β, so these are all conjugates of αβ. Local carrier names are taken from LFR2–3; no invented type occurs in the suggested file.

**Dependencies:** `mathlib:Module.Basis.smulTower`, `mathlib:Module.Basis.smulTower_apply`, [normal-integral-basis](#target-normal-integral-basis), `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-3-ramification-the-tame-and-wild-cases-and-the-filtration`.

**Inherited review contract:** Provide the owner-level local tensor interface.

**Boundary:** Retained with the direct suppliers and current target-level API stated above..

**Sources.**

- [Notes on Galois Modules](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Proof of Theorem 9.5, last display (printed p. 17). The node abstracts this step from the cyclic generators τ, σ to a split group G = IΓ.

<a id="target-local-noether"></a>

### Noether's theorem for local fields

**Target:** `ClassicalArithmeticCompletion:CA.7/local-noether` (theorem).

Let L/K be a finite Galois extension of nonarchimedean local fields with group G. Then 𝒪_L has a normal integral basis over 𝒪_K if and only if L/K is tamely ramified.

**Hypotheses.**

- A is a complete discrete valuation ring with finite residue field k of cardinality q and characteristic p (the ring of integers of a nonarchimedean local field K, in the vocabulary of the LocalFieldsRamification roadmap); K = Frac A.
- L/K is a finite Galois extension with group G and B is the integral closure of A in L (the valuation ring of L); IsGaloisGroup G A B.

**Proof route.**

1. The forward construction remains the unramified scalar extension, tame Vandermonde generator, split basis product and trace descent. The reverse direction uses normal-trace-descent over the complete DVR.

**Dependencies:** [local-tame-split-extension](#target-local-tame-split-extension), [local-unramified-normal-integral-basis](#target-local-unramified-normal-integral-basis), [local-totally-tamely-ramified-normal-integral-basis](#target-local-totally-tamely-ramified-normal-integral-basis), [normal-integral-basis-of-split-extension](#target-normal-integral-basis-of-split-extension), [trace-of-normal-integral-basis-generator](#target-trace-of-normal-integral-basis-generator), [tame-of-normal-integral-basis](#target-tame-of-normal-integral-basis), [normal-trace-descent](#target-normal-trace-descent), `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-3-ramification-the-tame-and-wild-cases-and-the-filtration`.

**Inherited review contract:** Use local NIB trace in the reverse direction.

**Boundary:** Retained with the direct suppliers and current target-level API stated above..

**Sources.**

- [Notes on Galois Modules](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Theorem 9.5 (printed p. 16). The tame direction.
- [Notes on Galois Modules](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Corollary 9.10 (printed p. 19). The mathematical contract. Johnston states this for p-adic fields; the node's hypotheses (complete discrete valuation ring with finite residue field) also cover local fields of equal characteristic, where every step of the proof applies unchanged.
- [Normal bases in Galois extensions of number fields](https://resolve.cambridge.org/core/services/aop-cambridge-core/content/view/CDAF1160D7312AB5A5E2D32BA8B540FF/S0027763000024521a.pdf/normal-bases-in-galois-extensions-of-number-fields.pdf), Introduction (printed p. 153). The attribution to Noether.

<a id="target-locally-free-lattice"></a>

### Locally free lattices over an order

**Target:** `ClassicalArithmeticCompletion:CA.7/locally-free-lattice` (definition).

Let A be a Dedekind domain that is not a field with fraction field K and Λ an A-algebra that is finitely generated as an A-module (an A-order in the K-algebra K ⊗ Λ when Λ is A-torsion-free). A left Λ-module M is a locally free Λ-lattice of rank n if M is finitely generated over A and, for every nonzero prime v of A, the completion Â_v ⊗_A M is isomorphic to (Â_v ⊗_A Λ)^n as an Â_v ⊗_A Λ-module: there is an Â_v-linear isomorphism Â_v ⊗ M ≅ Â_v ⊗ Λ^n commuting with the action of every element of Λ. For Λ = A[G] and M = B with its group-ring structure, rank one local freeness says that at every v the completed module has a normal basis: Â_v ⊗ B = Â_v[G]·α_v.

**Hypotheses.**

- A Dedekind domain, K its fraction field, Â_v = v.adicCompletionIntegers K.
- Λ an A-algebra (possibly noncommutative), M a left Λ-module with the scalar tower A → Λ → M.
- The rank n is a natural number; rank zero forces M = 0.
- A is not a field for completion detection, rank/zero consequences and projectivity. The raw completion predicate is vacuous over fields and does not imply these conclusions there.

**API.**

- `LocallyFree.IsLocallyFreeOfRank` (data): M is a locally free Λ-lattice of rank n.
- `LocallyFree.IsLocallyFreeOfRank.of_free` (constructor): Λ^n is locally free of rank n.
- `LocallyFree.IsLocallyFreeOfRank.prod` (structure): M ⊕ N is locally free of rank n + m.
- `LocallyFree.IsLocallyFreeOfRank.of_linearEquiv` (compatibility): Local freeness is invariant under Λ-isomorphism.
- `LocallyFree.IsLocallyFreeOfRank.finrank` (projection): dim_K(K ⊗ M) = n·dim_K(K ⊗ Λ). Requires A not a field.
- `LocallyFree.isLocallyFreeOfRank_one_groupRing_iff` (characterisation): For Λ = A[G] and M = B: rank one local freeness is the existence at every v of a basis of Â_v ⊗ B indexed by G with b_g = g·b_1.
- `LocallyFree.not_free_of_not_isPrincipal` (example): A nonzero nonprincipal ideal of A is locally free of rank one over A and not free.

**Checks.**

- `LocallyFree.test_self` (degenerate): Λ is locally free of rank one over itself.
- `LocallyFree.test_rank_zero` (degenerate): If A is not a field, a locally free lattice of rank zero is zero. Over A=Q the raw height-one completion predicate holds for M=Q even at rank zero.
- `LocallyFree.test_ideal_not_free` (non-example): A nonzero nonprincipal ideal of a Dedekind domain is locally free of rank one but not free.
- `LocallyFree.test_gaussian_not_locallyFree` (non-example): ℤ[i] is not locally free of rank one over ℤ[Gal(ℚ(i)/ℚ)].

**Proof route.**

1. The height-one completion predicate is vacuous over a field. Retain A nonfield in all rank/projectivity consequences; for a field define rank by an actual generic B-module isomorphism. Finite generation, torsion-freeness and a fixed local rank remain explicit.

**Dependencies:** `mathlib:IsDedekindDomain.HeightOneSpectrum.adicCompletionIntegers`, `mathlib:LinearMap.baseChange`, `mathlib:Module.Finite`, `mathlib:IsDedekindDomain`, [dedekind-completion-detection](#target-dedekind-completion-detection).

**Inherited review contract:** Preserve nonfield, finite and generic-rank requirements.

**Boundary:** G-COMPLETION.

**Consumers.**

- [noether-theorem](#target-noether-theorem): the conclusion of Noether's theorem
- [locally-free-class-group](#target-locally-free-class-group): the locally free class group is generated by the classes of these lattices
- [locally-free-lattice-is-projective](#target-locally-free-lattice-is-projective): locally free lattices define classes in K₀
- `Taylor 1981, Introduction`: By Noether's theorem 𝓞_M is a locally free ℤΓ-module, and Cl(ℤΓ) is the class group of locally free ℤΓ-modules

**Sources.**

- [Notes on Galois Modules](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Definition 10.2 (printed p. 20). The mathematical contract, with the conventions stated here, with M_p the completion (Section 4.2 of the source defines M_p = O_p ⊗_O M).
- [Notes on Galois Modules](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Example 10.6 (printed p. 20). The group-ring characterisation in the API.
- [Quaternion Algebras](https://jvoight.github.io/quat-book.pdf), 20.2.8 (printed p. 318). The same notion for orders, but Voight defines local freeness with localisations R_(p) at all primes p of R and requires r ≥ 1 (20.2.8, printed p. 318); the completion form used here is Johnston's Definition 10.2 and neither source proves the two forms equivalent.

<a id="target-locally-free-lattice-is-projective"></a>

### Locally free lattices are projective

**Target:** `ClassicalArithmeticCompletion:CA.7/locally-free-lattice-is-projective` (lemma).

Let A be a Dedekind domain that is not a field and Λ an A-algebra finitely generated as an A-module. A locally free Λ-lattice of rank n is a finitely generated projective Λ-module.

**Hypotheses.**

- Λ is module-finite over the noetherian ring A, hence left noetherian; M is finitely presented over Λ.
- A is not a field for completion detection, rank/zero consequences and projectivity. The raw completion predicate is vacuous over fields and does not imply these conclusions there.

**Proof route.**

1. For a finite order over noetherian A, finite generation gives a finite presentation. Central flat Hom base change plus joint exactness detection descends projectivity. The generic completion adapter remains explicit; number-field completions use NFA5.

**Dependencies:** [locally-free-lattice](#target-locally-free-lattice), `mathlib:Module.Projective`, `mathlib:Module.FaithfullyFlat`, `mathlib:Module.FaithfullyFlat.of_flat_of_isLocalHom`, `mathlib:Module.FinitePresentation`, `mathlib:Module.projective_of_localization_maximal`, `mathlib:IsDedekindDomain.flat_iff_torsion_eq_bot`, [finite-order-flat-hom](#target-finite-order-flat-hom), [dedekind-completion-detection](#target-dedekind-completion-detection).

**Inherited review contract:** Supply noncommutative central Hom descent.

**Boundary:** G-COMPLETION.

**Sources.**

- [Quaternion Algebras](https://jvoight.github.io/quat-book.pdf), 20.2.6 and 20.2.8 (printed p. 318). The mathematical contract, with the conventions stated here; the passage from completion to localisation is faithful flatness.
- [Notes on Galois Modules](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Section 14, first paragraph (printed p. 26). The same statement, whose proof the source omits.

<a id="target-sublattice-eq-of-completions"></a>

### Lattices are determined by their completions

**Target:** `ClassicalArithmeticCompletion:CA.7/sublattice-eq-of-completions` (lemma).

Let A be a Dedekind domain that is not a field, V an A-module, and N ⊆ P two A-submodules of V with P finitely generated. If Â_v ⊗ N → Â_v ⊗ P is surjective for every nonzero prime v of A, then N = P.

**Hypotheses.**

- A Dedekind domain; P finitely generated over A.
- A is not a field for completion detection, rank/zero consequences and projectivity. The raw completion predicate is vacuous over fields and does not imply these conclusions there.

**Proof route.**

1. Apply completion exactness detection to the quotient of the two finite sublattices. The field counterexample is excluded by A nonfield. The local flat-map theorem is already pinned Mathlib; only the generic completion adapter is missing.

**Dependencies:** `mathlib:Submodule.eq_of_localization_maximal`, `mathlib:Module.FaithfullyFlat.of_flat_of_isLocalHom`, `mathlib:LinearMap.baseChange`, `mathlib:IsDedekindDomain.flat_iff_torsion_eq_bot`, [dedekind-completion-detection](#target-dedekind-completion-detection).

**Inherited review contract:** Expose faithful flatness and the nonfield case.

**Boundary:** G-COMPLETION.

**Sources.**

- [Quaternion Algebras](https://jvoight.github.io/quat-book.pdf), Corollary 9.4.7 and Lemma 9.5.3 (printed pp. 140–142). The node is the containment half of the local–global dictionary, stated with completions.
- [Notes on Galois Modules](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Section 4.2 and Lemma 4.1 (printed p. 6). The convention for completed lattices used throughout the layer.

<a id="target-completed-ring-of-integers-is-induced"></a>

### The completed ring of integers is induced from a decomposition group

**Target:** `ClassicalArithmeticCompletion:CA.7/completed-ring-of-integers-is-induced` (lemma).

Let L/K be a finite Galois extension of number fields with group G, v a nonzero prime of 𝓞_K and w a prime of 𝓞_L above v with decomposition group G_w, identified with Gal(L_w/K_v). Then, as 𝒪̂_v[G]-modules, 𝒪̂_v ⊗ 𝓞_L ≅ Π_{w′|v} 𝒪_{L_{w′}} ≅ 𝒪̂_v[G] ⊗_{𝒪̂_v[G_w]} 𝒪_{L_w} (induction along G_w ⊆ G, with left modules).

**Hypotheses.**

- L/K finite Galois; v, w as stated; the completions are the canonical ones of the NumberFieldArithmetic roadmap.

**Proof route.**

1. Use NFA5’s actual product of completed integer rings and the balanced coset-model comparison. The image of g⊗b is supported at gw with value g(b); gd⊗b=g⊗db fixes the convention.

**Dependencies:** [ring-of-integers-as-group-ring-module](#target-ring-of-integers-as-group-ring-module), `mathlib:MonoidAlgebra`, `mathlib:Ideal.isPretransitive_of_isGaloisGroup`, [balanced-extension](#target-balanced-extension), [semilocal-induction-comparison](#target-semilocal-induction-comparison), `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-5-the-global-local-dictionary-at-finite-places`.

**Inherited review contract:** Fix left induction and factor transport.

**Boundary:** Retained with the direct suppliers and current target-level API stated above..

**Sources.**

- [Notes on Galois Modules](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Proof of Theorem 10.7 (printed p. 20). The node, with the induction written for left modules (see the recorded misprint).

<a id="target-locally-free-of-tame"></a>

### Noether: tame extensions have locally free rings of integers

**Target:** `ClassicalArithmeticCompletion:CA.7/locally-free-of-tame` (theorem).

Let L/K be a finite tamely ramified Galois extension of number fields with group G. Then 𝓞_L is a locally free 𝓞_K[G]-lattice of rank one.

**Hypotheses.**

- L/K finite Galois and tame.

**Proof route.**

1. The local Noether basis makes the induced product free at every finite place. Completion equality and projectivity descent then give the inherited locally free lattice contract.

**Dependencies:** [local-noether](#target-local-noether), [completed-ring-of-integers-is-induced](#target-completed-ring-of-integers-is-induced), [locally-free-lattice](#target-locally-free-lattice), [tamely-ramified](#target-tamely-ramified), [semilocal-induction-comparison](#target-semilocal-induction-comparison), [dedekind-completion-detection](#target-dedekind-completion-detection), `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-5-the-global-local-dictionary-at-finite-places`.

**Inherited review contract:** Connect local bases, induction and completion.

**Boundary:** G-COMPLETION.

**Sources.**

- [Notes on Galois Modules](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Theorem 10.7 (printed p. 20). The mathematical contract, with the conventions stated here.
- [On Fröhlich's conjecture for rings of integers of tame extensions](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0063/LOG_0010.pdf), Introduction and Results (printed p. 41). The theorem as Taylor uses it (over ℤΓ; see ring-of-integers-locally-free-over-integral-group-ring).

<a id="target-noether-theorem"></a>

### Noether's theorem

**Target:** `ClassicalArithmeticCompletion:CA.7/noether-theorem` (theorem).

Let L/K be a finite Galois extension of number fields with group G. The following are equivalent: (i) L/K is tamely ramified; (ii) 𝓞_L is a locally free 𝓞_K[G]-lattice of rank one; (iii) 𝓞_L is a projective 𝓞_K[G]-module.

**Hypotheses.**

- L/K finite Galois.

**Proof route.**

1. Over integer rings use local freeness→projectivity→trace onto→tame and tame→local Noether→local freeness. Over fields use the rational normal basis directly; no height-one predicate proves projectivity there.

**Dependencies:** [locally-free-of-tame](#target-locally-free-of-tame), [locally-free-lattice-is-projective](#target-locally-free-lattice-is-projective), [trace-surjective-of-projective](#target-trace-surjective-of-projective), [tame-iff-trace-surjective](#target-tame-iff-trace-surjective), [projective-of-tame](#target-projective-of-tame), [dedekind-completion-detection](#target-dedekind-completion-detection), [projective-group-norm-surjectivity](#target-projective-group-norm-surjectivity).

**Inherited review contract:** Keep the number-field/nonfield branch visible.

**Boundary:** G-COMPLETION.

**Sources.**

- [Notes on Galois Modules](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Section 1.3 (printed p. 2) and Corollary 9.10 (printed p. 19). The local form, combined with Theorem 10.7 and Example 10.6, is the equivalence (i) ⇔ (ii).
- [Normal bases in Galois extensions of number fields](https://resolve.cambridge.org/core/services/aop-cambridge-core/content/view/CDAF1160D7312AB5A5E2D32BA8B540FF/S0027763000024521a.pdf/normal-bases-in-galois-extensions-of-number-fields.pdf), Proposition 1.3 (printed p. 156). The projectivity form (i) ⇒ (iii).

<a id="target-ring-of-integers-locally-free-over-integral-group-ring"></a>

### The ring of integers is locally free over ℤ[G]

**Target:** `ClassicalArithmeticCompletion:CA.7/ring-of-integers-locally-free-over-integral-group-ring` (lemma).

Let L/K be a finite tamely ramified Galois extension of number fields with group G. Then 𝓞_L, with the action of ℤ[G] through G, is a locally free ℤ[G]-lattice of rank [K : ℚ].

**Hypotheses.**

- L/K finite Galois and tame.

**Proof route.**

1. At each rational prime, O_F⊗Z_l is free of rank d=[F:Q] over Z_l by the integral completion/basis dictionary. Restriction of the local O_F[G]-free rank-one module gives Z_l[G]-rank d. No noncommutative finrank is used.

**Dependencies:** [locally-free-of-tame](#target-locally-free-of-tame), [locally-free-lattice](#target-locally-free-lattice), [restriction-k0-map](#target-restriction-k0-map), `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-5-the-global-local-dictionary-at-finite-places`.

**Inherited review contract:** Fix the absolute rank.

**Boundary:** Retained with the direct suppliers and current target-level API stated above..

**Sources.**

- [On Fröhlich's conjecture for rings of integers of tame extensions](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0063/LOG_0010.pdf), Introduction and Results (printed p. 41). The node, with the rank made explicit.
- [Notes on Galois Modules](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Remark 3.17 (printed p. 6). The rank computation.

<a id="target-locally-free-not-free-example"></a>

### Local freeness is separate from freeness

**Target:** `ClassicalArithmeticCompletion:CA.7/locally-free-not-free-example` (application).

Let A be a Dedekind domain with a nonzero nonprincipal ideal I (for example A = ℤ[√−5], I = (2, 1 + √−5)). Then I is a locally free A-lattice of rank one (over the trivial group ring A[1] = A) but is not free. Hence a locally free lattice over an order need not be free, and the class of a locally free lattice in the locally free class group can be nonzero.

**Hypotheses.**

- A Dedekind domain; I ≠ 0 nonprincipal.

**Proof route.**

1. The norm-two calculation and a²+5b²≠2 certify nonprincipality. Its Dedekind local rank is one, so it is locally free but not free.

**Dependencies:** [locally-free-lattice](#target-locally-free-lattice), `mathlib:IsDedekindDomain`, `mathlib:ClassGroup`, [nonprincipal-ideal-witness](#target-nonprincipal-ideal-witness), [dedekind-k0-comparison](#target-dedekind-k0-comparison).

**Inherited review contract:** Prove the concrete nonprincipal ideal.

**Boundary:** Retained with the direct suppliers and current target-level API stated above..

**Sources.**

- [Notes on Galois Modules](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Examples 3.3(i) (printed p. 4). The non-freeness half.
- [Notes on Galois Modules](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Section 15.1 (printed p. 28). The source's own separation of local and global freeness.

<a id="target-order-in-finite-dimensional-algebra"></a>

### Orders in finite-dimensional algebras

**Target:** `ClassicalArithmeticCompletion:CA.7/order-in-finite-dimensional-algebra` (definition).

Let R be a noetherian domain with fraction field F and E a finite-dimensional F-algebra. An R-order in E is an R-subalgebra Λ of E (a subring containing 1 and the image of R) that is an R-lattice in E: finitely generated as an R-module and spanning E over F (Mathlib's Submodule.IsLattice F). Examples: the group ring R[G] in F[G] for a finite group G, the integral closure of an integrally closed R in a finite separable field extension of F, M_n(R) in M_n(F).

**Hypotheses.**

- R noetherian domain, F = Frac R, E a finite-dimensional F-algebra, not necessarily commutative.
- The integral-closure example requires R integrally closed. The integrality-to-order criterion additionally requires the regular-trace pairing to be nondegenerate; separability of a noncommutative algebra does not imply this in positive characteristic. For a separable algebra Voight's lemma uses the reduced trace, which Mathlib does not define; the regular-trace premise is a stronger Mathlib-expressible substitute and holds for F[G] exactly when |G| is invertible in F.

**API.**

- `IntegralOrder.IsOrder` (data): Λ is an R-order in E: an R-subalgebra that is an R-lattice.
- `IntegralOrder.isOrder_iff` (characterisation): Λ is an order exactly when it is finitely generated over R and spans E over F.
- `IntegralOrder.IsOrder.isIntegral` (relation): Every element of an order is integral over R.
- `IntegralOrder.isOrder_of_isIntegral` (constructor): Over an integrally closed noetherian R, a spanning subalgebra of integral elements is an order if the pairing (x,y) -> trace_F(leftMul(x*y)) is nondegenerate.
- `IntegralOrder.groupRingSubalgebra` (data): The group ring R[G] as a subalgebra of F[G].
- `IntegralOrder.groupRing_isOrder` (example): R[G] is an order in F[G] for a finite group G.
- `IntegralOrder.integralClosure_isOrder` (compatibility): For integrally closed noetherian R, its integral closure in a finite separable extension of F is an order. For number fields this agrees with the ring of integers and the GlobalNumberFields NumberFieldOrder convention.

**Checks.**

- `IntegralOrder.order_test_base` (degenerate): R is an order in F.
- `IntegralOrder.order_test_not_finitelyGenerated` (non-example): ℤ[1/2] ⊆ ℚ is not an order.
- `IntegralOrder.order_test_groupRing` (compatibility): ℤ[G] is an order in ℚ[G] for a finite group G.

**Proof route.**

1. Retain the subalgebra/lattice predicate with its group-ring embedding API. Module-finite Cayley–Hamilton proves integrality. IsIntegralClosure.finite and fraction-field localization are accepted baseline suppliers; the integrality converse retains normal/noetherian base and nondegenerate regular trace.

**Dependencies:** `mathlib:Submodule.IsLattice`, `mathlib:MonoidAlgebra`, `mathlib:IsIntegralClosure`, `mathlib:IsIntegralClosure.finite`, `mathlib:IsIntegralClosure.isLocalization`, [uniform-trace-dual-bound](#target-uniform-trace-dual-bound).

**Inherited review contract:** Keep the order predicate and examples at the accepted contract.

**Boundary:** Retained with the direct suppliers and current target-level API stated above..

**Consumers.**

- [left-order-of-lattice](#target-left-order-of-lattice): left orders of lattices are orders
- [maximal-order](#target-maximal-order): maximal orders are orders maximal for inclusion
- [associated-order](#target-associated-order): the associated order is an order in K[G]
- [locally-free-class-group](#target-locally-free-class-group): the locally free class group is defined for orders in semisimple algebras
- `Johnston, Section 14`: freeness over an order is tested inside a maximal order containing it

**Sources.**

- [Notes on Galois Modules](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Definition 3.8 and Examples 3.10 (printed p. 5). The definition in the conventions used here.
- [Quaternion Algebras](https://jvoight.github.io/quat-book.pdf), Definition 10.2.1 (printed p. 152) and Lemma 10.3.7 (printed pp. 154–155). The definition, and the integrality characterisation; Voight proves the latter for separable algebras with the reduced trace trd and without stating that R is integrally closed. The node uses the regular trace and the integrally closed premise instead.

<a id="target-left-order-of-lattice"></a>

### The left order of a lattice

**Target:** `ClassicalArithmeticCompletion:CA.7/left-order-of-lattice` (construction).

Let R be a noetherian domain with fraction field F, E a finite-dimensional F-algebra and M an R-lattice in E. The left order of M is O_l(M) = {x ∈ E | x·M ⊆ M}; it is an R-order in E. If M is itself an order then O_l(M) = M.

**Hypotheses.**

- R noetherian; M an R-lattice in E.

**API.**

- `IntegralOrder.leftOrder` (data): The left order {x ∈ E | x·M ⊆ M} of an R-submodule M of E.
- `IntegralOrder.mem_leftOrder_iff` (characterisation): x ∈ O_l(M) exactly when x·m ∈ M for all m ∈ M.
- `IntegralOrder.leftOrder_isOrder` (constructor): The left order of a lattice is an order.
- `IntegralOrder.leftOrder_eq_self` (compatibility): The left order of an order is itself.
- `IntegralOrder.leftOrder_smul` (relation): In a field, O_l(aM) = O_l(M) for a ≠ 0.

**Checks.**

- `IntegralOrder.leftOrder_test_self` (computation): The left order of R ⊆ F is R.
- `IntegralOrder.leftOrder_test_top_contains` (characterisation): Every left order contains R.
- `IntegralOrder.leftOrder_test_scale` (compatibility): The left order of 2M ⊆ ℚ equals that of M.

**Proof route.**

1. Choose 0≠s∈A with s·1∈M. Then O_l(M)⊆s⁻¹M, a fixed finite noetherian module. To span, clear the denominators of y acting on finite generators of M. This supplies the construction API without adding another target ID.

**Dependencies:** [order-in-finite-dimensional-algebra](#target-order-in-finite-dimensional-algebra), `mathlib:Submodule.IsLattice`.

**Inherited review contract:** Provide the stabilizer-order property and scaling proof.

**Boundary:** Retained with the direct suppliers and current target-level API stated above..

**Consumers.**

- [associated-order](#target-associated-order): the associated order is the left order of 𝓞_L transported into K[G]
- `Johnston, Remark 3.14(iii)`: the associated order is an order because it is a left order

**Sources.**

- [Notes on Galois Modules](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Definition 3.11 and Proposition 3.12 (printed p. 5). The mathematical contract, with the conventions stated here.
- [Quaternion Algebras](https://jvoight.github.io/quat-book.pdf), Lemma 10.2.7 (statement printed p. 152, proof p. 153). The same statement with its proof.

<a id="target-maximal-order"></a>

### Maximal orders

**Target:** `ClassicalArithmeticCompletion:CA.7/maximal-order` (definition).

Let R be a noetherian domain with fraction field F and E a finite-dimensional F-algebra. An R-order Λ in E is maximal if it is not properly contained in another R-order. The integral closure of an integrally closed R in a finite separable field extension is the unique maximal order there; for a nontrivial finite group G with |G| invertible in F, R[G] is not a maximal order in F[G] when |G| is not a unit in R.

**Hypotheses.**

- R noetherian domain; E finite-dimensional over F.

**API.**

- `IntegralOrder.IsMaximalOrder` (data): Λ is a maximal R-order in E.
- `IntegralOrder.IsMaximalOrder.eq_of_le` (characterisation): An order containing a maximal order equals it.
- `IntegralOrder.integralClosure_isMaximalOrder` (compatibility): The integral closure of a Dedekind domain in a finite separable field extension is the maximal order.
- `IntegralOrder.groupRing_not_isMaximalOrder` (other): R[G] is not maximal for G ≠ 1 when |G| is not a unit of R.

**Checks.**

- `IntegralOrder.maximalOrder_test_ringOfIntegers` (compatibility): 𝓞_K is a maximal ℤ-order in K.
- `IntegralOrder.maximalOrder_test_integers` (degenerate): ℤ is the maximal order of ℚ.
- `IntegralOrder.maximalOrder_test_groupRing_not_maximal` (non-example): ℤ[G] is not maximal in ℚ[G] for a nontrivial finite group G.

**Proof route.**

1. For nontrivial finite G in characteristic zero, e=|G|⁻¹Σg is central idempotent. A[G][e] is a finite A-module because e²=e, contains an element outside A[G] when |G| is not a unit, and is an order. Retain the source-scoped arithmetic statement; over fields the fraction algebra itself is the maximal order.

**Dependencies:** [order-in-finite-dimensional-algebra](#target-order-in-finite-dimensional-algebra), `mathlib:IsIntegralClosure`.

**Inherited review contract:** Make the averaging overorder finite.

**Boundary:** Retained with the direct suppliers and current target-level API stated above..

**Consumers.**

- [existence-of-maximal-orders](#target-existence-of-maximal-orders): every order in a separable algebra lies in a maximal order
- [locally-free-class-group](#target-locally-free-class-group): the kernel group D(Λ) is the kernel of extension of scalars to a maximal order
- [froehlich-kernel-group](#target-froehlich-kernel-group): Fröhlich's theorem puts [𝓞_L] in the kernel group
- `Taylor 1981, Section 2`: Let 𝔐 be any maximal order in ℚΓ which contains ℤΓ

**Sources.**

- [Notes on Galois Modules](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Definition 13.6 and Examples 13.7 (printed p. 24). The definition and the two examples used as tests.
- [Quaternion Algebras](https://jvoight.github.io/quat-book.pdf), Definition 10.4.1 (printed p. 155). The same definition.

<a id="target-existence-of-maximal-orders"></a>

### Every order with nondegenerate regular trace lies in a maximal order

**Target:** `ClassicalArithmeticCompletion:CA.7/existence-of-maximal-orders` (lemma).

Let R be an integrally closed noetherian domain with fraction field F, and let E be a finite-dimensional F-algebra whose regular-trace pairing (x,y) -> trace_F(leftMul(x*y)) is nondegenerate. Every R-order in E is contained in a maximal R-order.

**Hypotheses.**

- The regular-trace pairing is explicitly nondegenerate. In characteristic zero a separable algebra supplies this premise; separability by itself does not do so in positive characteristic.

**Proof route.**

1. The fixed Gram determinant of a basis inside the starting order gives r⁻¹ΣAe_i containing every overorder. Noetherian ascending-chain termination proves existence.

**Dependencies:** [maximal-order](#target-maximal-order), [order-in-finite-dimensional-algebra](#target-order-in-finite-dimensional-algebra), [uniform-trace-dual-bound](#target-uniform-trace-dual-bound).

**Inherited review contract:** Give one bound for all overorders.

**Boundary:** Retained with the direct suppliers and current target-level API stated above..

**Sources.**

- [Quaternion Algebras](https://jvoight.github.io/quat-book.pdf), 10.4.2 (printed p. 155). The existence statement for separable algebras. Voight argues by chains and Lemma 10.3.7 (whose proof, on p. 155, gives the trace-dual bound by Cramer's rule, with the reduced trace); the node's single trace-dual module r^-1 ΣRα_i is a variant with the regular trace.
- [Notes on Galois Modules](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Section 14, first paragraph (printed p. 25). The use in the source: Johnston takes a maximal order containing Λ without proof (printed p. 25).

<a id="target-maximal-order-of-cyclic-group-algebra"></a>

### The maximal order of ℚ[C_p]

**Target:** `ClassicalArithmeticCompletion:CA.7/maximal-order-of-cyclic-group-algebra` (application).

Let p be a prime and G cyclic of order p. Then ℚ[G] ≅ ℚ × ℚ(ζ_p) by x ↦ (ε(x), α(x)) (augmentation and g ↦ ζ_p); the maximal ℤ-order is M = ℤ[G][e₁] with e₁ = p⁻¹Σ_g g, corresponding to ℤ × ℤ[ζ_p]; and [M : ℤ[G]] = p, with ℤ[G] = {(x, y) ∈ ℤ × ℤ[ζ_p] : x ≡ y mod (1 − ζ_p)}.

**Hypotheses.**

- p prime; G cyclic of order p.

**Proof route.**

1. Use Q[X]/(X^p−1)≅Q×Q(ζ_p). For integral pairs, reduce both components to F_p; lifting their common residue by a polynomial gives the fibre product. The difference map onto F_p has kernel Z[C_p], so the index is p. The p=2 example has parity-matched pairs. These are required checks, even though the inherited suggested file contains fewer signatures.

**Dependencies:** [maximal-order](#target-maximal-order), `mathlib:IsCyclotomicExtension.Rat.adjoin_singleton_eq_top`, `mathlib:IsIntegralClosure`.

**Inherited review contract:** Retain the full algebra and fibre-product target.

**Boundary:** Retained with the direct suppliers and current target-level API stated above..

**Sources.**

- [Notes on Galois Modules](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Example 13.9 (printed p. 24). The mathematical contract; the source states it for odd p, and the node's p = 2 case is the same computation with ζ_2 = −1, 1 − ζ_2 = 2 (ℤ[C_2] = {(x,y) ∈ ℤ × ℤ : x ≡ y mod 2}).

<a id="target-associated-order"></a>

### The associated order of a Galois extension

**Target:** `ClassicalArithmeticCompletion:CA.7/associated-order` (construction).

Let A be a Dedekind domain with fraction field K, L/K a finite Galois extension with group G and B the integral closure of A in L. The associated order of L/K is A_{L/K} = {x ∈ K[G] | x·B ⊆ B}, where K[G] acts on L through the Galois representation. It is an A-order in K[G] containing A[G]; by the normal basis map it is the left order of the A-lattice in K[G] corresponding to B. If B is free over some A-order Γ ⊆ K[G] then Γ = A_{L/K}, and, when K is a number field (or a nonarchimedean local field), A_{L/K} = A[G] exactly when L/K is tamely ramified.

**Hypotheses.**

- A Dedekind domain; B the integral closure of A in the finite Galois extension L of K = Frac A (Mathlib's AKLB setting).

**API.**

- `IntegralGaloisModule.associatedOrder` (data): A_{L/K} = {x ∈ K[G] | x·B ⊆ B} as an A-subalgebra of K[G].
- `IntegralGaloisModule.mem_associatedOrder_iff` (characterisation): x ∈ A_{L/K} exactly when x·b ∈ B for every b ∈ B.
- `IntegralGaloisModule.groupRingSubalgebra_le_associatedOrder` (relation): A[G] ⊆ A_{L/K}.
- `IntegralGaloisModule.associatedOrder_isOrder` (structure): A_{L/K} is an A-order in K[G].
- `IntegralGaloisModule.associatedOrder_eq_of_free` (characterisation): If B is free of rank one over an A-order Γ ⊆ K[G], then Γ = A_{L/K}.
- `IntegralGaloisModule.associatedOrder_eq_groupRing_iff` (compatibility): A_{L/K} = A[G] exactly when B/A is tamely ramified.

**Checks.**

- `IntegralGaloisModule.associatedOrder_test_trivial` (degenerate): For the trivial group and Dedekind A, the associated order is A[G]=A. Integral closedness cannot be dropped: A=Z[2i],K=L=Q(i),B=Z[i].
- `IntegralGaloisModule.associatedOrder_test_contains_groupRing` (characterisation): Every group element lies in A_{L/K}.
- `IntegralGaloisModule.associatedOrder_test_gaussian_strict` (non-example): For ℚ(i)/ℚ, ℤ[G] is strictly smaller than A_{L/K}.

**Proof route.**

1. Transport the integral lattice through the rational normal-basis isomorphism and take its left stabilizer. The order property is the inherited left-order target. For trivial G require integrally closed A; Z[2i]⊂Z[i] is excluded by this hypothesis.

**Dependencies:** [left-order-of-lattice](#target-left-order-of-lattice), [rational-normal-basis-map](#target-rational-normal-basis-map), [ring-of-integers-as-group-ring-module](#target-ring-of-integers-as-group-ring-module), `mathlib:IsIntegralClosure`.

**Inherited review contract:** Keep normal-base independence and the corrected trivial test.

**Boundary:** Retained with the direct suppliers and current target-level API stated above..

**Consumers.**

- [associated-order-eq-group-ring-iff-tame](#target-associated-order-eq-group-ring-iff-tame): tameness is the equality of the associated order with the group ring
- [associated-order-of-gaussian-integers](#target-associated-order-of-gaussian-integers): the wild example
- `Johnston, Theorem 1.8 (Leopoldt)`: the associated order is the order over which 𝓞_K is free for abelian K/ℚ

**Sources.**

- [Notes on Galois Modules](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Definition 3.13 and Remark 3.14 (printed pp. 5–6). The mathematical contract, with the conventions stated here.

<a id="target-associated-order-of-free"></a>

### The only order over which the integers can be free

**Target:** `ClassicalArithmeticCompletion:CA.7/associated-order-of-free` (lemma).

In the setting of the associated order: if B = Γ·α is free of rank one over an A-order Γ ⊆ K[G], then Γ = A_{L/K}.

**Hypotheses.**

- Γ an A-order in K[G]; α ∈ B with B = Γ·α freely.

**Proof route.**

1. L = K[G]·α freely (tensor with K).
2. x ∈ A_{L/K}: xα ∈ B = Γα, so xα = yα with y ∈ Γ, and freeness gives x = y ∈ Γ.
3. γ ∈ Γ: γB = γΓα ⊆ Γα = B, so γ ∈ A_{L/K}.

**Dependencies:** [associated-order](#target-associated-order), [normal-integral-basis](#target-normal-integral-basis).

**Sources.**

- [Notes on Galois Modules](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Proposition 3.15 (printed p. 6). The mathematical contract, with the conventions stated here.

<a id="target-associated-order-eq-group-ring-iff-tame"></a>

### The associated order is the group ring exactly in the tame case

**Target:** `ClassicalArithmeticCompletion:CA.7/associated-order-eq-group-ring-iff-tame` (theorem).

Let L/K be a finite Galois extension of number fields (or of nonarchimedean local fields) with group G. Then A_{L/K} = 𝓞_K[G] if and only if L/K is tamely ramified.

**Hypotheses.**

- L/K finite Galois; number fields or local fields.

**Proof route.**

1. Use the local Noether theorem and local associated-order equality for a free module; commute the finite stabilizer equations with flat completion and detect equality globally. Conversely equality forces the trace obstruction to vanish. No general finite-Dedekind theorem beyond this arithmetic source scope is asserted.

**Dependencies:** [associated-order](#target-associated-order), [associated-order-of-free](#target-associated-order-of-free), [tame-iff-trace-surjective](#target-tame-iff-trace-surjective), [local-noether](#target-local-noether), [locally-free-of-tame](#target-locally-free-of-tame), [sublattice-eq-of-completions](#target-sublattice-eq-of-completions), [finite-order-flat-hom](#target-finite-order-flat-hom), [dedekind-completion-detection](#target-dedekind-completion-detection), `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-5-the-global-local-dictionary-at-finite-places`.

**Inherited review contract:** Respect the number/local-field scope.

**Boundary:** G-COMPLETION.

**Sources.**

- [Notes on Galois Modules](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Proposition 9.9 (printed pp. 18–19). The local case, restated in this roadmap’s notation.
- [Notes on Galois Modules](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Remark 9.11 (printed p. 19). The global case, which the source asserts without proof; the proof steps supply it.

<a id="target-associated-order-of-gaussian-integers"></a>

### The associated order of ℚ(i)/ℚ

**Target:** `ClassicalArithmeticCompletion:CA.7/associated-order-of-gaussian-integers` (application).

For L = ℚ(i) with G = {1, σ}: e₁ = (1 + σ)/2 and e₋₁ = (1 − σ)/2 lie in A_{L/ℚ}; A_{L/ℚ} = ℤe₁ ⊕ ℤe₋₁, the maximal order of ℚ[G]; and ℤ[i] = A_{L/ℚ}·(1 + i) since e₁(1 + i) = 1 and e₋₁(1 + i) = i.

**Hypotheses.**

- L = ℚ(i) = ℚ(ζ_4).

**Proof route.**

1. The projections e_+=(1+σ)/2 and e_-=(1−σ)/2 act as (a+bi)↦a and bi. Their integral span is the maximal order, so it is the associated order. Applying both to 1+i gives the basis 1,i and proves freeness of rank one.

**Dependencies:** [associated-order](#target-associated-order), [associated-order-of-free](#target-associated-order-of-free), [maximal-order-of-cyclic-group-algebra](#target-maximal-order-of-cyclic-group-algebra).

**Inherited review contract:** Keep equality and freeness, not only idempotent membership.

**Boundary:** Retained with the direct suppliers and current target-level API stated above..

**Sources.**

- [Notes on Galois Modules](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Example 3.16 (printed p. 6). The mathematical contract, with the conventions stated here.

<a id="target-normal-integral-basis-of-arithmetically-disjoint-compositum"></a>

### Normal integral bases of arithmetically disjoint composita

**Target:** `ClassicalArithmeticCompletion:CA.7/normal-integral-basis-of-arithmetically-disjoint-compositum` (lemma).

Let K₁, K₂ ⊆ N be Galois number fields over ℚ, linearly disjoint (their discriminants coprime, which forces this), with K₁K₂ = N, so that Gal(N/ℚ) = Gal(K₁/ℚ) × Gal(K₂/ℚ). If α_i generates a normal integral basis of K_i/ℚ, then α₁α₂ generates a normal integral basis of N/ℚ. More generally (Johnston 6.4(i)), over a base F with coprime different ideals, a normal integral basis of L/F stays one of LK/K.

**Hypotheses.**

- K₁, K₂ Galois over ℚ with coprime discriminants and compositum N.

**Proof route.**

1. Use the new integral tensor comparison with explicit linear disjointness and coprime relative discriminants. Tensor basis and product Galois group yield the integral normal basis; mere trivial intersection is insufficient without Galois hypotheses.

**Dependencies:** `mathlib:Module.Basis.ofIsCoprimeDifferentIdeal`, `mathlib:Module.Basis.ofIsCoprimeDifferentIdeal_apply`, `mathlib:NumberField.linearDisjoint_of_isGalois_isCoprime_discr`, `mathlib:NumberField.isCoprime_differentIdeal_of_isCoprime_discr`, `mathlib:Module.Basis.smulTower`, [normal-integral-basis](#target-normal-integral-basis), [integral-compositum-tensor](#target-integral-compositum-tensor).

**Inherited review contract:** Supply integral multiplication and the automorphism product.

**Boundary:** Retained with the direct suppliers and current target-level API stated above..

**Sources.**

- [Notes on Galois Modules](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Proposition 6.4 (printed p. 11). Part (i); part (ii), with K/F Galois of group H and generator β, gives O_{LK} = O_F[G × H]·αβ, which is the node over ℚ.
- [Normal bases in Galois extensions of number fields](https://resolve.cambridge.org/core/services/aop-cambridge-core/content/view/CDAF1160D7312AB5A5E2D32BA8B540FF/S0027763000024521a.pdf/normal-bases-in-galois-extensions-of-number-fields.pdf), Proposition 1.8 (printed p. 157). The same statement, proved through discriminants.

<a id="target-prime-cyclotomic-normal-integral-basis"></a>

### ζ_p generates a normal integral basis of ℚ(ζ_p)

**Target:** `ClassicalArithmeticCompletion:CA.7/prime-cyclotomic-normal-integral-basis` (lemma).

For an odd prime p, the primitive p-th root of unity ζ_p generates a normal integral basis of ℚ(ζ_p)/ℚ: its conjugates ζ_p, ζ_p², …, ζ_p^{p−1} form a ℤ-basis of ℤ[ζ_p].

**Hypotheses.**

- p an odd prime.

**Proof route.**

1. ℤ[ζ_p] = 𝓞 with power basis 1, ζ_p, …, ζ_p^{p−2} (IsPrimitiveRoot.integralPowerBasis, dimension φ(p) = p − 1).
2. ζ_p is a unit, so multiplying by ζ_p gives the basis ζ_p, …, ζ_p^{p−1}.
3. These are exactly the conjugates of ζ_p (Gal(ℚ(ζ_p)/ℚ) ≅ (ℤ/p)^×).

**Dependencies:** `mathlib:IsPrimitiveRoot.integralPowerBasis`, `mathlib:IsCyclotomicExtension.Rat.galEquivZMod`, [normal-integral-basis](#target-normal-integral-basis).

**Sources.**

- [Notes on Galois Modules](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Proof of Proposition 6.6, first paragraph (printed p. 12). The mathematical contract, with the conventions stated here.
- [Linear independence of characters](https://kconrad.math.uconn.edu/blurbs/galoistheory/linearchar.pdf), Example 3.2 (p. 2). The rational statement.

<a id="target-squarefree-cyclotomic-normal-integral-basis"></a>

### ζ_n generates a normal integral basis for odd squarefree n

**Target:** `ClassicalArithmeticCompletion:CA.7/squarefree-cyclotomic-normal-integral-basis` (theorem).

Let n be odd and squarefree. Then ζ_n generates a normal integral basis of ℚ(ζ_n)/ℚ.

**Hypotheses.**

- n odd squarefree.

**Proof route.**

1. From the accepted cyclotomic discriminant formula, every prime factor divides the conductor, so coprime conductors give coprime discriminants. Product primitive roots of coprime orders have product order; transport by a cyclotomic automorphism. Apply the integral tensor comparison.

**Dependencies:** [prime-cyclotomic-normal-integral-basis](#target-prime-cyclotomic-normal-integral-basis), [normal-integral-basis-of-arithmetically-disjoint-compositum](#target-normal-integral-basis-of-arithmetically-disjoint-compositum), `mathlib:IsCyclotomicExtension.Rat.natAbs_discr`, `mathlib:IntermediateField.isCyclotomicExtension_lcm_sup`, [integral-compositum-tensor](#target-integral-compositum-tensor).

**Inherited review contract:** Expose the discriminant support and root transport.

**Boundary:** Retained with the direct suppliers and current target-level API stated above..

**Sources.**

- [Notes on Galois Modules](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Proof of Proposition 6.6, second paragraph (printed p. 12). The mathematical contract, with the conventions stated here.

<a id="target-gauss-period-normal-integral-basis"></a>

### Gauss periods generate normal integral bases

**Target:** `ClassicalArithmeticCompletion:CA.7/gauss-period-normal-integral-basis` (theorem).

Let n be odd and squarefree and K ⊆ ℚ(ζ_n) a subfield. Then K/ℚ is Galois and the Gauss period Tr_{ℚ(ζ_n)/K}(ζ_n) generates a normal integral basis of K/ℚ.

**Hypotheses.**

- n odd squarefree; K ⊆ ℚ(ζ_n).

**Proof route.**

1. Every subgroup of the abelian cyclotomic Galois group is normal, so its fixed field is Galois. The orbit-sum descent takes ζ_n to the Gauss-period normal generator.

**Dependencies:** [squarefree-cyclotomic-normal-integral-basis](#target-squarefree-cyclotomic-normal-integral-basis), [trace-of-normal-integral-basis-generator](#target-trace-of-normal-integral-basis-generator), [normal-trace-descent](#target-normal-trace-descent).

**Inherited review contract:** Use trace descent and abelian fixed fields.

**Boundary:** Retained with the direct suppliers and current target-level API stated above..

**Sources.**

- [Notes on Galois Modules](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Proposition 6.6 (printed p. 11). The mathematical contract, with the conventions stated here.
- [Linear independence of characters](https://kconrad.math.uconn.edu/blurbs/galoistheory/linearchar.pdf), Example 3.9 (p. 6). The name.

<a id="target-tame-abelian-field-in-squarefree-cyclotomic-field"></a>

### A tame abelian number field has odd squarefree cyclotomic level

**Target:** `ClassicalArithmeticCompletion:CA.7/tame-abelian-field-in-squarefree-cyclotomic-field` (lemma).

Let K/ℚ be a finite abelian extension that is tamely ramified. Then K embeds in ℚ(ζ_n) for some odd squarefree n.

**Hypotheses.**

- K/ℚ finite abelian and tame.

**Proof route.**

1. Kronecker–Weber is the imported initial embedding. Apply the single conductor cut for each prime and remove the whole 2-primary factor. The smaller fixed cyclotomic fields retain every other conductor factor.

**Dependencies:** [tamely-ramified](#target-tamely-ramified), `mathlib:IsCyclotomicExtension.Rat.ramificationIdx_eq`, `mathlib:Ideal.card_inertia_eq_ramificationIdxIn`, `mathlib:Ideal.ramificationIdxIn_mul_ramificationIdxIn`, [cyclotomic-inertia-cut](#target-cyclotomic-inertia-cut), `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`.

**Inherited review contract:** Identify the wild inertia fixed field.

**Boundary:** Retained with the direct suppliers and current target-level API stated above..

**Sources.**

- [Notes on Galois Modules](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Proof of Theorem 8.4, (iii) implies (i) (printed p. 14). The node; n is the conductor, the least level, as in Definition 8.2.
- [Notes on Galois Modules](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Theorem 8.1 (printed p. 14). Kronecker–Weber, imported from the ClassFieldTheory roadmap.

<a id="target-hilbert-speiser"></a>

### The Hilbert–Speiser theorem

**Target:** `ClassicalArithmeticCompletion:CA.7/hilbert-speiser` (theorem).

Let K/ℚ be a finite abelian extension. The following are equivalent: (i) K has a normal integral basis over ℚ; (ii) K/ℚ is tamely ramified; (iii) K ⊆ ℚ(ζ_n) for some odd squarefree n. When they hold, the Gauss period Tr_{ℚ(ζ_n)/K}(ζ_n) generates a normal integral basis.

**Hypotheses.**

- K/ℚ finite abelian (IsAbelianGalois ℚ K).

**Proof route.**

1. (iii) ⇒ (i): gauss-period-normal-integral-basis.
2. (i) ⇒ (ii): Speiser (tame-of-normal-integral-basis).
3. (ii) ⇒ (iii): tame-abelian-field-in-squarefree-cyclotomic-field.

**Dependencies:** [gauss-period-normal-integral-basis](#target-gauss-period-normal-integral-basis), [tame-of-normal-integral-basis](#target-tame-of-normal-integral-basis), [tame-abelian-field-in-squarefree-cyclotomic-field](#target-tame-abelian-field-in-squarefree-cyclotomic-field).

**Sources.**

- [Notes on Galois Modules](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Theorem 8.4 (printed p. 14). The node; condition (iii) replaces the source's odd squarefree conductor by the existence of an odd squarefree level, which is equivalent and needs no conductor.
- [Tame Galois module structure revisited](https://arxiv.org/pdf/1805.12588), Introduction (p. 1). The theorem and its failure over larger bases.

<a id="target-lagrange-resolvent"></a>

### Lagrange resolvents and the resolvend

**Target:** `ClassicalArithmeticCompletion:CA.7/lagrange-resolvent` (construction).

Let L/K be a finite Galois extension with group G, E a field containing L, and χ : G → E^× a character. The resolvent of a ∈ L at χ is ⟨a | χ⟩ = Σ_{σ∈G} χ(σ⁻¹)·σ(a) ∈ E. The resolvend of a is r_G(a) = Σ_σ σ(a)·σ⁻¹ ∈ L[G], so that χ applied to r_G(a) is ⟨a | χ⟩. The resolvent is K-linear in a, satisfies ⟨τ(a) | χ⟩ = χ(τ)⟨a | χ⟩, equals the trace at the trivial character, and for abelian G (with E containing enough roots of unity) a is a normal basis generator exactly when all its resolvents are nonzero.

**Hypotheses.**

- L/K finite Galois; E an L-algebra field; characters valued in E^×.
- Convention (Fröhlich, Taylor): χ(σ⁻¹) in the resolvent, σ⁻¹ in the resolvend.

**API.**

- `GaloisResolvent.resolvent` (data): ⟨a | χ⟩ = Σ_σ χ(σ⁻¹)σ(a).
- `GaloisResolvent.resolvend` (data): r_G(a) = Σ_σ σ(a)σ⁻¹ ∈ L[G].
- `GaloisResolvent.resolvent_smul` (relation): ⟨τ(a) | χ⟩ = χ(τ)·⟨a | χ⟩.
- `GaloisResolvent.resolvent_one` (compatibility): At the trivial character the resolvent is the trace.
- `GaloisResolvent.resolvent_add` (simp): The resolvent is additive in a.
- `GaloisResolvent.resolvend_smul` (relation): r_G(τa) = τ·r_G(a).
- `GaloisResolvent.isGenerator_iff_forall_resolvent_ne_zero` (characterisation): For abelian G with |Hom(G, E^×)| = |G|, a is a normal basis generator exactly when every resolvent is nonzero.

**Checks.**

- `GaloisResolvent.resolvent_test_trivial` (compatibility): At the trivial character the resolvent is the trace.
- `GaloisResolvent.resolvent_test_base` (non-example): The resolvent of an element of K at a nontrivial character is 0.
- `GaloisResolvent.resolvent_test_quadratic` (computation): In a quadratic extension with σx = −x, the resolvent of 1 + x at the sign character is 2x.

**Proof route.**

1. The scalar character resolvent and group-algebra resolvend are APIs of the inherited target. The new resolvend-invertibility theorem derives invertibility directly from the normal-basis matrix; the abelian scalar criterion then follows by Fourier decomposition without depending on itself.

**Dependencies:** `mathlib:trace_eq_sum_automorphisms`, `mathlib:MonoidAlgebra`, [rational-normal-basis-map](#target-rational-normal-basis-map), [resolvend-invertibility](#target-resolvend-invertibility), [determinant-character-hom](#target-determinant-character-hom).

**Inherited review contract:** Keep separate scalar/group-algebra values and avoid criterion cycles.

**Boundary:** Retained with the direct suppliers and current target-level API stated above..

**Consumers.**

- [discriminant-of-normal-basis-resolvent-formula](#target-discriminant-of-normal-basis-resolvent-formula): the discriminant of the conjugates is the product of the squared resolvents
- [normal-integral-basis-discriminant-criterion](#target-normal-integral-basis-discriminant-criterion): the integral criterion is read off the resolvents
- `Taylor 1981, (2.2)`: the resolvend of a local normal integral basis generator represents the class of 𝓞_M

**Sources.**

- [On Fröhlich's conjecture for rings of integers of tame extensions](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0063/LOG_0010.pdf), Section 2, (2.2) (printed p. 44). The resolvend Σ_γ a^γ γ^{−1}, the factor of Taylor's representative, is the node's r_G.
- [On Fröhlich's conjecture for rings of integers of tame extensions](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0063/LOG_0010.pdf), Section 1 (printed p. 43). Evaluating at a character: for abelian χ, Det(r_G(a))(χ) is the resolvent.

<a id="target-group-determinant-factorisation"></a>

### Dedekind's factorisation of the group determinant

**Target:** `ClassicalArithmeticCompletion:CA.7/group-determinant-factorisation` (lemma).

Let G be a finite abelian group and E a field such that G has |G| characters with values in E^× (E contains a primitive root of unity of order the exponent of G). For variables (X_g)_{g∈G}, det(X_{gh⁻¹})_{g,h} = Π_{χ} Σ_{g} χ(g) X_g.

**Hypotheses.**

- G finite abelian; E has |G| characters of G.

**Proof route.**

1. The character-table matrix is invertible under the full |G|-character hypothesis, so it conjugates (X_(gh⁻¹)) to the diagonal eigenvalue matrix. The inverse-character permutation removes the convention difference. This is the proof construction of the accepted target, not another definition.

**Dependencies:** `mathlib:linearIndependent_monoidHom`, `mathlib:Matrix.det_vandermonde`, `tauceti:TauCetiRoadmap/RepresentationTheory/CharacterTheory#layer-3-the-character-table-idempotents-completeness-second-orthogonality`.

**Inherited review contract:** Use the full character basis for the matrix transport.

**Boundary:** Retained with the direct suppliers and current target-level API stated above..

**Sources.**

- [The origin of representation theory](https://math.uconn.edu/~kconrad/articles/groupdet.pdf), Theorem 2 (p. 5). The node over ℂ; the first proof works over any field with a full set of characters, as the source remarks for characteristic p.

<a id="target-discriminant-of-normal-basis-resolvent-formula"></a>

### The discriminant of a normal basis is the product of squared resolvents

**Target:** `ClassicalArithmeticCompletion:CA.7/discriminant-of-normal-basis-resolvent-formula` (theorem).

Let L/K be a finite abelian extension with group G, E ⊇ L a field with |G| characters of G, and a ∈ L. Then disc_{L/K}(σa)_{σ∈G} = det(Tr_{L/K}(σa·τa))_{σ,τ} = Π_χ ⟨a | χ⟩² in E.

**Hypotheses.**

- L/K finite abelian; E as in the group determinant lemma.

**Proof route.**

1. disc(σa) = det(Tr(σa·τa)) with Tr(σa·τa) = Σ_ρ ρσ(a)·ρτ(a) (trace_eq_sum_automorphisms), so the trace matrix is MᵀM for M = (ρσ(a))_{ρ,σ}; hence disc = det(M)² in L, then map to E.
2. det(ρσ(a)) = ±det(ρσ⁻¹(a)) (reindex σ ↦ σ⁻¹), the group determinant at X_g = g(a).
3. Apply the factorisation; Σ_g χ(g)g(a) = ⟨a | χ̄⟩ and χ ↦ χ̄ permutes the characters.

**Dependencies:** [group-determinant-factorisation](#target-group-determinant-factorisation), [lagrange-resolvent](#target-lagrange-resolvent), `mathlib:Algebra.discr`, `mathlib:trace_eq_sum_automorphisms`, `mathlib:Matrix.det_mul`, `mathlib:Matrix.det_transpose`.

**Sources.**

- [The origin of representation theory](https://math.uconn.edu/~kconrad/articles/groupdet.pdf), Section 3 (p. 4). The link between the discriminant of the conjugates and the group determinant.
- [Normal bases in Galois extensions of number fields](https://resolve.cambridge.org/core/services/aop-cambridge-core/content/view/CDAF1160D7312AB5A5E2D32BA8B540FF/S0027763000024521a.pdf/normal-bases-in-galois-extensions-of-number-fields.pdf), Proof of Proposition 1.8 (printed p. 157). The same identity used for normal integral bases.

<a id="target-normal-integral-basis-discriminant-criterion"></a>

### The discriminant criterion for a normal integral basis over ℚ

**Target:** `ClassicalArithmeticCompletion:CA.7/normal-integral-basis-discriminant-criterion` (theorem).

Let K/ℚ be a finite Galois extension and θ ∈ 𝓞_K. Then θ generates a normal integral basis if and only if disc_{K/ℚ}(σθ)_σ = d_K, the discriminant of K. For abelian K this reads Π_χ ⟨θ | χ⟩² = d_K.

**Hypotheses.**

- K/ℚ finite Galois; θ ∈ 𝓞_K.

**Proof route.**

1. The integral change-of-basis matrix C gives disc(conjugates)=det(C)² d_K. Its absolute determinant is the lattice index. The zero determinant branch is separated before the index argument. Import the index/discriminant dictionary rather than re-plan it.

**Dependencies:** [normal-integral-basis](#target-normal-integral-basis), [discriminant-of-normal-basis-resolvent-formula](#target-discriminant-of-normal-basis-resolvent-formula), `mathlib:Algebra.discr_of_matrix_mulVec`, `mathlib:NumberField.discr_eq_discr`, `mathlib:NumberField.discr`, `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-4-the-relative-discriminant`.

**Inherited review contract:** Expose the index-square identity at its existing owner.

**Boundary:** Retained with the direct suppliers and current target-level API stated above..

**Sources.**

- [Computing normal integral bases of abelian number fields](https://arxiv.org/pdf/1704.00359), Section 2 (p. 2). The mathematical contract, with the conventions stated here; the source states it without proof.
- [Notes on Galois Modules](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Lemma 4.6 and Remark 4.3 (printed pp. 7–8). The index formula of the proof.

<a id="target-locally-free-class-group"></a>

### The locally free class group of an order

**Target:** `ClassicalArithmeticCompletion:CA.7/locally-free-class-group` (construction).

Let A be a Dedekind domain that is not a field with fraction field K and Λ an A-order in a finite-dimensional semisimple K-algebra (for instance 𝓞_K[G] ⊆ K[G], or ℤ[G] ⊆ ℚ[G]). Let K₀(Λ) be the Grothendieck group of finitely generated projective Λ-modules (Tau Ceti's SplitK0 of the full subcategory (finiteProjectiveModules Λ).FullSubcategory of ModuleCat Λ). The locally free class group Cl(Λ) is the subgroup of K₀(Λ) generated by the classes [M] − n[Λ] of the locally free Λ-lattices M of rank n (projective by locally-free-lattice-is-projective). [M] − n[Λ] = 0 exactly when M is stably free: M ⊕ Λ^k ≅ Λ^{n+k}. For Λ = A, Cl(A) is the ideal class group. For an order Λ′ ⊇ Λ (a maximal order), extension of scalars gives Cl(Λ) → Cl(Λ′), whose kernel is the kernel group D(Λ).

**Hypotheses.**

- A Dedekind domain; Λ module-finite over A.
- K₀ is the split Grothendieck group of finitely generated projective left Λ-modules.
- A is not a field: height-one-prime completion conditions otherwise become vacuous and do not specify the generic rank. The separate field case must use an actual generic-rank condition, not this predicate.

**API.**

- `LocallyFree.classGroup` (data): Cl(Λ) ⊆ K₀(Λ), generated by the classes of locally free lattices.
- `LocallyFree.classOf` (constructor): The class [M] − n[Λ] of a locally free lattice of rank n.
- `LocallyFree.classOf_eq_zero_iff` (characterisation): The class vanishes exactly when M ⊕ Λ^k ≅ Λ^{n+k} for some k.
- `LocallyFree.classOf_prod` (simp): The class of a direct sum is the sum of the classes.
- `LocallyFree.classOf_free` (simp): The class of Λ^n is zero.
- `LocallyFree.exists_classOf_eq` (characterisation): Every element is the class of a locally free lattice of rank one.
- `LocallyFree.classGroupMap` (functoriality): Extension of scalars along a morphism of A-orders.
- `LocallyFree.kernelGroup` (data): The kernel group D(Λ) = ker(Cl(Λ) → Cl(Λ′)) for an order Λ′ ⊇ Λ.
- `LocallyFree.classGroupSelfEquiv` (compatibility): Cl(A) ≅ the ideal class group of A.

**Checks.**

- `LocallyFree.classGroup_test_integers` (degenerate): Cl(ℤ) is trivial.
- `LocallyFree.classGroup_test_ideal` (compatibility): The class of a nonzero nonprincipal ideal of A in Cl(A) is nonzero.
- `LocallyFree.classGroup_test_cyclicTwo` (computation): Cl(ℤ[C_2]) is trivial.

**Proof route.**

1. Use pinned SplitK0 of finiteProjectiveModules. Equality is common finite-free stabilization via the projective free complement. Define the existing subgroup by its locally free generators; use the new scalar maps and the Steinitz comparison. All finite/nonfield hypotheses remain.

**Dependencies:** [locally-free-lattice](#target-locally-free-lattice), [locally-free-lattice-is-projective](#target-locally-free-lattice-is-projective), `tauceti:TauCeti.SplitK0`, `tauceti:TauCeti.SplitK0.of`, `tauceti:TauCeti.SplitK0.of_biprod`, `tauceti:TauCeti.SplitK0.map`, `tauceti:TauCeti.finiteProjectiveModules`, `mathlib:ClassGroup`, [split-k0-stable-equality](#target-split-k0-stable-equality), [extension-k0-map](#target-extension-k0-map), [locally-free-scalar-compatibility](#target-locally-free-scalar-compatibility), [dedekind-k0-comparison](#target-dedekind-k0-comparison), [semisimple-rank-one-class-supplier](#target-semisimple-rank-one-class-supplier).

**Inherited review contract:** Supply genuine K₀, scalar and Steinitz interfaces.

**Boundary:** G-GENERALIDEAL, G-COMPLETION.

**Consumers.**

- [ring-of-integers-class](#target-ring-of-integers-class): the Galois module class of a tame extension lies here
- [taylor-class-of-order-two](#target-taylor-class-of-order-two): Taylor's theorem is a statement in Cl(ℤΓ)
- `Ferri–Greither, Introduction`: realisable classes and the Stickelberger ideal act on Cl(𝓞_K[G])

**Sources.**

- [Notes on Galois Modules](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Section 15.1 (printed pp. 27–28). The node, with Reiner's classes identified with [M] − n[Λ] in K₀.
- [Quaternion Algebras](https://jvoight.github.io/quat-book.pdf), Remark 20.7.13 (printed p. 328). The identification of the stable class group with a subgroup of K₀ (Voight proves it for orders in simple algebras, via Curtis–Reiner Thm 49.32; for non-simple algebras Cl(Λ) is defined here as the subgroup generated by the classes [M] − n[Λ]).
- [Tame Galois module structure revisited](https://arxiv.org/pdf/1805.12588), Introduction (pp. 2–3). The kernel group.

<a id="target-locally-free-class-represented-by-rank-one"></a>

### Every locally free class is represented by a locally free ideal

**Target:** `ClassicalArithmeticCompletion:CA.7/locally-free-class-represented-by-rank-one` (lemma).

Let Λ be an A-order in a finite-dimensional semisimple K-algebra, A a Dedekind domain that is not a field. For locally free Λ-lattices M, M′ of positive total rank there are t ≥ 0 and a locally free Λ-lattice M″ of rank one with M ⊕ M′ ≅ Λ^t ⊕ M″. Hence every element of Cl(Λ) is [M″] − [Λ] for a locally free lattice M″ of rank one.

**Hypotheses.**

- A Dedekind domain with fraction field a global field for the finiteness statements; semisimple ambient algebra.
- M and Mprime have positive total locally free rank. The displayed decomposition is false for both zero; the zero class is instead represented by Lambda itself.
- A is not a field: height-one-prime completion conditions otherwise become vacuous and do not specify the generic rank. The separate field case must use an actual generic-rank condition, not this predicate.

**Proof route.**

1. For arithmetic orders use the stable idele quotient, local norm lifts and matrix strong approximation. Zero is represented by Λ; differences use idele products/inverses. Positive total rank alone permits Λ^(m−1)⊕I. The broader inherited Dedekind scope remains an explicit boundary.

**Dependencies:** [locally-free-class-group](#target-locally-free-class-group), [locally-free-lattice](#target-locally-free-lattice), [positive-rank-ideal-splitting](#target-positive-rank-ideal-splitting), [semisimple-rank-one-class-supplier](#target-semisimple-rank-one-class-supplier).

**Inherited review contract:** Cover differences and positive-rank splitting in semisimple algebras.

**Boundary:** G-GENERALIDEAL.

**Sources.**

- [Notes on Galois Modules](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Section 15.1, (15) (printed p. 28). The node; the source cites Reiner without proof.
- [Quaternion Algebras](https://jvoight.github.io/quat-book.pdf), Proposition 20.7.4 (printed p. 326). The rank-one case for simple B, with proof.

<a id="target-ring-of-integers-class"></a>

### The Galois module class of the ring of integers

**Target:** `ClassicalArithmeticCompletion:CA.7/ring-of-integers-class` (construction).

Let L/K be a finite tamely ramified Galois extension of number fields with group G. The Galois module class of L/K is [𝓞_L] = [𝓞_L] − [𝓞_K[G]] ∈ Cl(𝓞_K[G]) (𝓞_L being locally free of rank one by Noether), and its restriction [𝓞_L]_ℤ = [𝓞_L] − [K:ℚ][ℤ[G]] ∈ Cl(ℤ[G]) (𝓞_L locally free of rank [K : ℚ] over ℤ[G]). The class is zero when L/K has a normal integral basis, vanishes exactly when 𝓞_L is stably free, and is killed by the augmentation Cl(𝓞_K[G]) → Cl(𝓞_K).

**Hypotheses.**

- L/K finite Galois and tame.

**API.**

- `IntegralGaloisModule.ringOfIntegersClass` (constructor): [𝓞_L] ∈ Cl(𝓞_K[G]) for tame L/K.
- `IntegralGaloisModule.ringOfIntegersClassInt` (constructor): [𝓞_L]_ℤ ∈ Cl(ℤ[G]).
- `IntegralGaloisModule.ringOfIntegersClass_eq_zero_of_hasNIB` (relation): A normal integral basis makes the class zero.
- `IntegralGaloisModule.ringOfIntegersClass_eq_zero_iff` (characterisation): The class is zero exactly when 𝓞_L is stably free over 𝓞_K[G].
- `IntegralGaloisModule.classGroupMap_augmentation_ringOfIntegersClass` (relation): The augmentation kills the class.

**Checks.**

- `IntegralGaloisModule.ringOfIntegersClass_test_trivial` (degenerate): For L = K the class is zero.
- `IntegralGaloisModule.ringOfIntegersClass_test_cyclotomic` (computation): For ℚ(ζ_p)/ℚ (p odd) the class is zero.
- `IntegralGaloisModule.ringOfIntegersClass_test_intZero` (compatibility): Over K = ℚ a normal integral basis makes the integral class zero.

**Proof route.**

1. The relative class is [O_L]−[O_F[G]], the absolute class [O_L]−d[Z[G]]. Projective norm identifies coinvariants with invariants O_F, so augmentation sends the relative class to zero. General restriction sends cΓ(P) to cΛ(Res P)−n cΛ(Res Γ); for O_F[G] over Z[G] the coefficient ring is globally free of rank d, so this correction vanishes.

**Dependencies:** [locally-free-class-group](#target-locally-free-class-group), [locally-free-of-tame](#target-locally-free-of-tame), [ring-of-integers-locally-free-over-integral-group-ring](#target-ring-of-integers-locally-free-over-integral-group-ring), [normal-integral-basis](#target-normal-integral-basis), [trace-surjective-of-projective](#target-trace-surjective-of-projective), [locally-free-scalar-compatibility](#target-locally-free-scalar-compatibility), [projective-group-norm-surjectivity](#target-projective-group-norm-surjectivity), [norm-resolvent](#target-norm-resolvent).

**Inherited review contract:** Provide both ranks and the augmentation proof.

**Boundary:** Retained with the direct suppliers and current target-level API stated above..

**Consumers.**

- [taylor-class-of-order-two](#target-taylor-class-of-order-two): Taylor computes [𝓞_L]_ℤ
- [froehlich-kernel-group](#target-froehlich-kernel-group): Fröhlich places [𝓞_L]_ℤ in the kernel group
- `Johnston, Section 15.5`: realisable classes R(𝓞_K[G]) are the classes of tame G-extensions

**Sources.**

- [Notes on Galois Modules](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Section 15.1 (printed p. 28). The mathematical contract, with the conventions stated here.
- [Tame Galois module structure revisited](https://arxiv.org/pdf/1805.12588), Introduction, McCulloh's theorem (p. 3). The augmentation map; McCulloh's description R(O_K[G]) = Cl^0(O_K[G])^J places realisable classes in its kernel.

<a id="target-froehlich-kernel-group"></a>

### Fröhlich: the Galois module class lies in the kernel group

**Target:** `ClassicalArithmeticCompletion:CA.7/froehlich-kernel-group` (theorem).

Let M/N be a tame Galois extension of number fields with group Γ, and 𝔐 a maximal order of ℚΓ containing ℤΓ. Then [𝓞_M]_ℤ ∈ D(ℤΓ) = ker(Cl(ℤΓ) → Cl(𝔐)): 𝓞_M becomes stably free over 𝔐.

**Hypotheses.**

- M/N tame Galois; 𝔐 ⊇ ℤΓ maximal.

**Proof route.**

1. The map is extension along Z[G]→Γ with Γ maximal and containing Z[G]. The Hom quotient and its positive unit presentation are supplied; valuations and archimedean signs give tame kernel membership.

**Dependencies:** [ring-of-integers-class](#target-ring-of-integers-class), [maximal-order](#target-maximal-order), [locally-free-class-group](#target-locally-free-class-group), [kernel-hom-comparison](#target-kernel-hom-comparison), [froehlich-kernel-membership](#target-froehlich-kernel-membership).

**Inherited review contract:** Use a compatible maximal overorder and full Hom proof.

**Boundary:** G-LOCALCONSTANTS.

**Sources.**

- [On Fröhlich's conjecture for rings of integers of tame extensions](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0063/LOG_0010.pdf), Section 2 (printed p. 44). The mathematical contract, with the conventions stated here; the proof is in Fröhlich's work, not in the sources read.

<a id="target-taylor-class-of-order-two"></a>

### Taylor's theorem: the Galois module class has order at most two

**Target:** `ClassicalArithmeticCompletion:CA.7/taylor-class-of-order-two` (theorem).

Let M/N be a tame Galois extension of number fields with group Γ. Then 2·[𝓞_M]_ℤ = 0 in Cl(ℤΓ). (Taylor's Theorem 1: [𝓞_M]_ℤ = t(W), the Cassou-Noguès–Fröhlich root number class, whose values are signs of Artin root numbers of symplectic characters.)

**Hypotheses.**

- M/N tame Galois.

**Proof route.**

1. Use [O_L]−d[Z[G]]=t(W), not a two-torsion shortcut. W²=1 gives 2c=0. The local constant, product, induction, crossed-product and torsion-congruence proof boundaries are explicit.

**Dependencies:** [ring-of-integers-class](#target-ring-of-integers-class), [locally-free-class-group](#target-locally-free-class-group), [froehlich-taylor-equality](#target-froehlich-taylor-equality), [root-number-class](#target-root-number-class).

**Inherited review contract:** Supply the full obstruction equality and then square it.

**Boundary:** G-LOCALCONSTANTS, G-DH, G-LOCALBRAUER, G-CROSSEDPRODUCT, G-FTCONGRUENCE.

**Sources.**

- [On Fröhlich's conjecture for rings of integers of tame extensions](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0063/LOG_0010.pdf), Theorem 1 (printed p. 41). The node is part (a); the source writes Cl(ℤΓ) multiplicatively.
- [Notes on Galois Modules](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Theorem 15.3 (printed p. 29). The same statement.

<a id="target-taylor-no-symplectic-stably-free"></a>

### Taylor: without symplectic characters the ring of integers is stably free

**Target:** `ClassicalArithmeticCompletion:CA.7/taylor-no-symplectic-stably-free` (theorem).

Let M/N be a tame Galois extension of number fields with group Γ. If Γ has no irreducible symplectic (quaternionic) character, that is no irreducible complex representation carries a nonzero Γ-invariant alternating form (Frobenius–Schur indicator −1), then [𝓞_M]_ℤ = 0: 𝓞_M is stably free over ℤΓ.

**Hypotheses.**

- M/N tame Galois; every irreducible character of Γ has Frobenius–Schur indicator 0 or 1.

**Proof route.**

1. When there are no symplectic irreducibles, W_G=1 and t(W)=0. The full equality gives zero class, and SplitK0 stable equality gives stable freeness of the absolute rank.

**Dependencies:** [taylor-class-of-order-two](#target-taylor-class-of-order-two), [ring-of-integers-class](#target-ring-of-integers-class), [root-number-class](#target-root-number-class), [froehlich-taylor-equality](#target-froehlich-taylor-equality), [split-k0-stable-equality](#target-split-k0-stable-equality).

**Inherited review contract:** Compute the obstruction, not just its order.

**Boundary:** G-LOCALCONSTANTS, G-DH, G-LOCALBRAUER, G-CROSSEDPRODUCT, G-FTCONGRUENCE.

**Sources.**

- [On Fröhlich's conjecture for rings of integers of tame extensions](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0063/LOG_0010.pdf), Theorem 1(b) (printed p. 41). The node is the case with no symplectic characters.
- [Notes on Galois Modules](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Section 15.4 (printed p. 29). The hypothesis.

<a id="target-taylor-odd-order-free"></a>

### Taylor: for groups of odd order the ring of integers is free over ℤΓ

**Target:** `ClassicalArithmeticCompletion:CA.7/taylor-odd-order-free` (theorem).

Let M/N be a tame Galois extension of number fields with group Γ of odd order. Then 𝓞_M is a free ℤΓ-module of rank [N : ℚ].

**Hypotheses.**

- M/N tame Galois; |Γ| odd.

**Proof route.**

1. Odd-order real character theory excludes definite quaternion division components. Jacobinski turns stable freeness into freeness of local rank d=[F:Q]. The rank is a witnessed module isomorphism with d copies of Z[G], not Module.finrank over a noncommutative ring.

**Dependencies:** [taylor-no-symplectic-stably-free](#target-taylor-no-symplectic-stably-free), [ring-of-integers-locally-free-over-integral-group-ring](#target-ring-of-integers-locally-free-over-integral-group-ring), [odd-order-eichler](#target-odd-order-eichler), [jacobinski-cancellation](#target-jacobinski-cancellation), [froehlich-taylor-equality](#target-froehlich-taylor-equality).

**Inherited review contract:** Add precise Eichler cancellation and absolute rank.

**Boundary:** G-LOCALCONSTANTS, G-DH, G-LOCALBRAUER, G-CROSSEDPRODUCT, G-FTCONGRUENCE.

**Sources.**

- [On Fröhlich's conjecture for rings of integers of tame extensions](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0063/LOG_0010.pdf), Corollary and its proof (printed pp. 41–42). The mathematical contract, with the conventions stated here; the rank is [N : ℚ] by local freeness.

## Worked acceptance examples

1. **Wild Gaussian integers.** In Q(i)/Q, Tr(a+bi)=2a, disc(1,i)=−4 and 2 ramifies with index two. This rules out a normal integral basis. Nevertheless the associated order is Z e₊⊕Z e₋, with e₊=(1+σ)/2 and e₋=(1−σ)/2, and 1+i is its free generator: the two projections yield 1 and i.
2. **Locally free without free.** In Z[√−5], I=(2,1+√−5) has quotient F₂. A principal generator would satisfy a²+5b²=2, impossible. Thus I is locally free rank one, its Steinitz class is nontrivial, and [I]−[A] is nonzero in K₀(A). This checks that the rank map alone loses the obstruction.
3. **Absolute rank.** For a tame extension with base F of degree d, restriction from O_F[G] gives local Z[G]-rank d. Even when G has odd order, the freeness corollary gives d copies, rather than one copy, of Z[G].
4. **Eichler matrix-size test.** A totally definite quaternion division algebra fails the predicate. Its 2×2 matrix algebra passes: the determinant-one archimedean group has noncompact diagonal subgroups. Stabilization therefore gives the stable classification in both cases, while rank-one cancellation requires the predicate on the original algebra.
5. **Logarithm torsion test.** A group element of finite p-power order has L(g)=0, but Det(g) can be nontrivial. The commutator subgroup comparison is injective; the full augmentation determinant logarithm has kernel Det(G). This forces the separate congruence step in Taylor’s argument.
6. **Gauss normalization.** A trivial multiplicative character and nontrivial additive character have sum −1. For n=1 Hasse–Davenport is the identity formula, without an additional sign. A tame ramified local Gauss factor can have positive valuation and is not asserted to be an integral unit.
7. **Vacuous completions.** A=Q has no height-one primes, so completion conditions hold for arbitrary asserted ranks. All nonfield rank/projectivity/equality consequences explicitly exclude this case; the field branch uses an actual generic basis.

## Precise proof boundaries

### G-LOCALCONSTANTS: Relations and induction for local Galois constants

F76 Theorem3, pp.392–393 uses the local-constant formalism to extend degree-one Gauss sums to R_G. Supply a proved relation-independent extension, the degree correction under induction, duality, change-of-additive-character and Galois formulas, with the stated Artin/different convention. The read one-dimensional formula alone does not prove these relations.

**Direct consumers:** [tame-local-gauss-sum](#target-tame-local-gauss-sum), [gauss-galois-compatibility](#target-gauss-galois-compatibility), [symplectic-root-sign-law](#target-symplectic-root-sign-law).

### G-ARTIN: Comparison with the analytic Artin root factor

The algebraic inverse-Gauss expression is specified and F76 equations(2.4)–(2.5), p.390 identify it with the root factor of the completed Artin functional equation. An exact lower-tier proof/interface for that analytic identification has not been read or found. This gap concerns the analytic comparison API, not the existence of the algebraic sign representative.

**Direct consumers:** [symplectic-root-sign](#target-symplectic-root-sign).

### G-DH: The residual p-power ambiguity in Hasse–Davenport

DH Appendix(A.6), p.19 states the exact product relation and refers its proof to an uncleared book. Digit-sum valuations and leading residues leave a p-power root-of-unity ambiguity; supply a full proof eliminating it. The formula is a target, not a conclusion inferred from equal valuations.

**Direct consumers:** [finite-gauss-product](#target-finite-gauss-product), [gauss-log-image](#target-gauss-log-image).

### G-LOCALBRAUER: Q_p-rational elementary induction

CPT Theorem5.4, p.29 cites Serre’s uncleared representation book for the Q_p-p-elementary refinement. The existing InductionRestriction Layer6 owns generic Brauer induction but not this refinement. Supply the exact prime-to-p multiplier identity in integral lattice characters with its cyclotomic-action condition.

**Direct consumers:** [p-elementary-determinant-reduction](#target-p-elementary-determinant-reduction).

### G-CROSSEDPRODUCT: The elementary crossed-product matrix identification

CPT Theorem6.2, pp.31–32 relies on Wall’s matrix-ring identification for a cyclotomic étale factor with its p-group action. Supply the full coefficient-equivariant isomorphism, its restriction/norm formula and the determinant invariant comparison. A split-field matrix isomorphism alone does not give this integral assertion.

**Direct consumers:** [elementary-crossed-product-descent](#target-elementary-crossed-product-descent).

### G-FTCONGRUENCE: The Gauss congruence supplier used in Taylor’s torsion test

Taylor Theorem4, pp.59–61 and its proof in §§9–10, pp.65–75 give four detecting congruence branches. The degree>2 Gauss congruence at §9 Ia invokes Fröhlich–Taylor 1980 §5.1; the adjusted Gauss equivariance input also invokes its Propositions3.6–3.7. The publisher refused the full text (DOI10.1098/rsta.1980.0242), and no cleared/public full copy was found. Read and prove these exact congruences before closing the determinant assertion.

**Direct consumers:** [adjusted-gauss-sum](#target-adjusted-gauss-sum), [gauss-torsion-detection](#target-gauss-torsion-detection).

### G-COMPLETION: Generic Dedekind localization-to-valuation-completion adapter

Construct the canonical A_v→valuationRing(v.adicCompletion(Frac A)) for a nonfield Dedekind domain; prove injectivity, localness and torsion-freeness over the DVR, then apply the pinned faithfully-flat local-map theorem. Current NumberFieldArithmetic Layer5 owns the number-field version, not this generic Dedekind adapter. Supply the compatibility with finite lattice scalar change needed for projectivity descent and sublattice equality.

**Direct consumers:** [dedekind-completion-detection](#target-dedekind-completion-detection).

### G-GENERALIDEAL: The inherited rank-one statement beyond arithmetic orders

F75 proves stable idele classification and rank-one realization for arithmetic orders in semisimple number-field algebras. The inherited rank-one target is stated for a nonfield Dedekind base without consistently restricting it to that arithmetic setting. Keep its ID and record the broader Dedekind statement as a scope/proof boundary: supply a general order decomposition theorem at that contract, or have the independent reviewer approve restricting that contract to arithmetic orders. No general theorem is inferred from the number-field strong-approximation proof.

**Direct consumers:** [semisimple-rank-one-class-supplier](#target-semisimple-rank-one-class-supplier).

## Source correction and reading record

- `ClassicalArithmeticCompletion/E901`, arXiv:0904.2563v1, Corollary3.3, p.13; finding scoped to this preprint: The zero logarithm implication ends with L(1+x)=1, although L takes values in an additive class module. The conclusion is L(1+x)=0. The determinant value is the multiplicative identity; the logarithm value is the additive identity. L=(p−Ψ)φlog and the preceding hypothesis gives φlog=0, so applying the additive operator gives 0. In particular x=0 has L(1)=0. The proof immediately below also uses zero. The mathematical conclusion is unchanged. The finding is scoped to the arXiv preprint; publisher full text was refused.

The accepted packet’s existing Johnston corrections are retained, including the intersection/linear-disjointness distinction, the discriminant index orientation, the residue-degree exponent and the maximal-unramified base. They are not new findings of this continuation.

- **F75**: [Locally free modules over arithmetic orders](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0274_0275/LOG_0014.pdf), Albrecht Fröhlich. Journal für die reine und angewandte Mathematik 274/275 (1975), 112–124. Read 2026-10-14: §§1–5, pp.112–122; §6 consulted only to delimit scope. SHA-256: `8922705dfcbf23d2b51b97690b4f59ba9dbc94adeddf31c2f1cb94b0cc8165f7`.
- **F76**: [Arithmetic and Galois module structure for tame extensions](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0286_0287/LOG_0033.pdf), Albrecht Fröhlich. Journal für die reine und angewandte Mathematik 286/287 (1976), 380–440. Read 2026-10-14: §§1–2, pp.384–394; §§3–11, pp.395–418; Appendix I–VII, pp.426–437. SHA-256: `75d601e33e27770954ce62b4c245ed30d14b05796b0cc18f396e8311052f8efb`.
- **T81**: [On Fröhlich’s conjecture for rings of integers of tame extensions](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0063/LOG_0010.pdf), Martin J. Taylor. Inventiones mathematicae 63 (1981), 41–79. Read 2026-10-14: Entire article, §§1–12, pp.41–79. SHA-256: `d90c558d0e03c52080d508ac7163118518984e55db4a3992902e8cfdbd5cc33d`.
- **J68**: [Genera and decompositions of lattices over orders](https://archive.ymsc.tsinghua.edu.cn/pacm_download/117/6057-11511_2006_Article_BF02391907.pdf), Heinz Jacobinski. Acta Mathematica 121 (1968), 1–29. Read 2026-10-14: Definitions and Theorem1.4; §§2–4, pp.5–19; §5.3–5.5. SHA-256: `dbadb7d3740e27135175ff8b508146d8e30a871142a282080ea43a4b7f3bd7a4`.
- **CPT**: [K₁ of a p-adic group ring I. The determinantal image](https://arxiv.org/pdf/0904.2563v1), Ted Chinburg, Georgios Pappas and Martin J. Taylor. arXiv:0904.2563v1 (2009), author preprint; printed PDF pages. Read 2026-10-14: Hypothesis and Theorems1.2–1.5, pp.2–4; §3, pp.12–22; §4a, pp.23–24; §§5–6, pp.26–36; Appendix pp.36–38. SHA-256: `1e322851f5cc785c3bc6ecd72f28ebceb55a5e1d68601fc027a733f4418ad885`.
- **LOGSURVEY**: [The group logarithm past and present](https://www.mathi.uni-heidelberg.de/~otmar/workshopms/logsurvey10-3Final.pdf), Ted Chinburg, Georgios Pappas and Martin J. Taylor. Author preprint dated 3 October 2011. Read 2026-10-14: §§2–3, pp.3–8; §5, pp.11–15; §6.2, pp.20–23. SHA-256: `1e485eb04e9d1a1666c70482b0890dfb04c83b91befe6efc38a04c58f7483d89`.
- **W-I**: [The K-book, Chapter I: Projective Modules and Vector Bundles](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.I.pdf), Charles A. Weibel. Author chapter accompanying the 2013 book; chapter-local pagination. Read 2026-10-14: I§2, pp.6–8; I§3, pp.16–19. SHA-256: `f9662904b3f3477a05025175f1f8fd2d063156d6599f6b806137cbb2cc61fd76`.
- **W-II**: [The K-book, Chapter II: The Grothendieck Group K₀](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.II.pdf), Charles A. Weibel. Author chapter accompanying the 2013 book; chapter-local pagination. Read 2026-10-14: II§1, pp.1–2; II§2, pp.5–13. SHA-256: `529ea8a5853e9fa55279e7ad79047155409b10847bd924b56f708f0950ebc607`.
- **JOHN**: [Notes on Galois Modules](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Henri Johnston. Author notes, version 18 October 2016. Read 2026-10-14: §§1–10 and §§13–15, pp.1–30; §12 inspected to delimit scope. SHA-256: `dbedcf63ddd0194aa064fdc2423114a3ab29e0c5c1ce26943849071b05c539f2`.
- **KNE**: [Lectures on Galois Cohomology of Classical Groups](https://mathweb.tifr.res.in/Documents/Publications/Lectures/tifr47.pdf), Martin Kneser; notes by P. Jothilingam. TIFR Lectures on Mathematics 47 (1969), retypeset PDF with original page numbers in margins. Read 2026-10-14: §5.4, retypeset pp.66–69, original pp.87–91. SHA-256: `55309defa8ea7b311d5d6959832029ee6a0245330b7d0e45b2524e62283809a0`.
- **PRR**: [Algebraic Groups and Number Theory, Volume I](https://doi.org/10.1017/9781139017756), Vladimir Platonov, Andrei Rapinchuk and Igor Rapinchuk. Second edition, Cambridge University Press (2023), Chapters1–5; maintainer-cleared reading copy. Read 2026-10-14: §1.4.1–1.4.3, pp.29–33; §1.5.2 Theorem1.34, p.43; §2.3.4 Proposition2.37 and proof, pp.100–101. Read from the maintainer-cleared library; no file or passage was copied.
- **MART**: [Modules projectifs sur un ordre](https://www.numdam.org/item/STNB_1970-1971____A15_0.pdf), Jacques Martinet. Séminaire de théorie des nombres de Bordeaux (1970–1971), exposé17, 17-01–17-05. Read 2026-10-14: Entire exposé, I–V, pp.17-01–17-05. SHA-256: `a0382a9e0606ee82abf1067cb037944c826dbe2d613ffa09d993f0e7a47c8c14`.
- **STICK**: [Jacobi sums and Stickelberger’s congruence](https://kconrad.math.uconn.edu/articles/jacobistick.pdf), Keith Conrad. International Mathematics Research Notices (1995), author PDF with pp.1–9. Read 2026-10-14: Theorems1–2 and their proofs, pp.1–5; pp.6–9 not used. SHA-256: `6aca7f746318bd051d64e31fd5c82e4ef2087af5bbdb8f229eceb05cbcf20f18`.
- **DH**: [Gauss and Jacobi sums on finite fields and Z/mZ](https://kconrad.math.uconn.edu/blurbs/gradnumthy/Gauss-Jacobi-sums.pdf), Keith Conrad. Author notes, PDF pp.1–19. Read 2026-10-14: Appendix, formula(A.6), p.19; its proof reference is not treated as a read proof. SHA-256: `546796c67f82b251c416dcfd10a20602e77efe3c63f0df8749d1e22831d163b7`.
- **VOIGHT**: [Quaternion Algebras](https://jvoight.github.io/quat-book.pdf), John Voight. Open-access book, author edition; printed pagination. Read 2026-10-14: §9.4, pp.139–142, localization and lattice gluing; Chapter10 §§10.2–10.4, pp.152–155, especially Lemmas10.2.7 and10.3.7 and paragraph10.4.2. SHA-256: `a9316b834dbd500c52cd3a981c3205c9f4145b217042b213d23f696aee84b0f0`.

The reader is organized by mathematical targets, not by a source’s sections. Source locators identify the supporting theorem or proof; the text states results in the roadmap’s own words.

## Structure, planets and assembly

- **Stable equality in K₀**: [split-k0-stable-equality](#target-split-k0-stable-equality).
- **Steinitz decomposition**: [dedekind-projective-steinitz](#target-dedekind-projective-steinitz).
- **Rank-one ideal representatives**: [semisimple-rank-one-class-supplier](#target-semisimple-rank-one-class-supplier).
- **Jacobinski cancellation**: [jacobinski-cancellation](#target-jacobinski-cancellation).
- **Fröhlich Hom-description**: [character-idele-quotient](#target-character-idele-quotient).
- **Fröhlich–Taylor theorem**: [froehlich-taylor-equality](#target-froehlich-taylor-equality).

The continuation has six markers, the maximum for its current stage. They must be reconciled with the six inherited markers during assembly rather than appended to make twelve. The proposed three-block split and combined unsplit palette are specified in the packet’s restructure records. CA.7 remains unchanged until the manager acts on that proposal.

KTheoryLowDegrees Z.1 and Z.4 import the moved-down stable/scalar/Steinitz inputs. FiniteFieldsAndCharacterSums FF.1 imports the two finite Gauss targets while retaining its wider character-sum programme. Neither upstream owner is edited by this job.

## Suggested statements and validation

The paired suggested file uses the actual finite-projective category and SplitK0 carrier, a light finite-free stable-equivalence predicate, and statable scalar-restriction, Steinitz, projective-norm and finite-Gauss signatures. Balanced tensor carriers over arbitrary rings, arithmetic orders/ideles, virtual-character Hom quotients and group logarithms are specified fully here because their carriers are absent at the pins. There are no substitute uninterpreted types or data constructions in the file.

Validation checks packet closure boundaries and references, exact inherited-ID coverage, the 49-item frontier, API/check coverage for every definition, the six-planet cap and elaboration at the pins. The handoff records the completed command results and source-access limits.
