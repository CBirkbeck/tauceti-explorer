# Selmer groups, continuous integral cohomology, and Iwasawa cohomology

Selmer groups are kernels of localization maps with specified local conditions. Their integral, rational and discrete forms use different coefficient topologies; passing between them introduces invariant and derived-limit terms. This roadmap builds those comparisons, then their mapping-fibre complexes, Iwasawa control maps and arithmetic specializations. Its last layer constructs the minimum period and integral crystalline interfaces needed to define finite conditions, and computes criticality from an actual archimedean Hodge realization.

The five layers are:

| Layer | Targets |
| --- | --- |
| L0 | Multiplicative completions, norm-compatible Kummer maps, cohomological coefficient limits and weak semisimplicity. |
| L1 | Parametric orthogonal conditions, duality of Selmer mapping fibres, ordinary annihilator corrections and nonsingular finite-coefficient duality. |
| L2 | Compact and rational extensions of discrete Selmer structures; propagation, limits, restriction descent and exact correction complexes. |
| L3 | Iwasawa cohomology, derived specialization, local Euler factors, Selmer control, determinant lines and structure criteria for characteristic ideals. |
| L4 | Period and small-weight finite conditions, Hodge Gamma factors, the Tate class/unit dictionary, arithmetic conjectures and the routed elliptic/adjoint/parity examples. |

## Notation and conventions

Fix a prime p. For a finite extension E/ℚ_p, write O for its integer ring, λ for a uniformizer and D=E/O. A lattice T is finite free over O with continuous Galois action, V=T[1/p], A=V/T, and T^*=Hom_O(T,D)(1); V^*=Hom_E(V,E)(1) is the Tate dual. When an ordinary filtration is present, T^+ is saturated and stable under the **local** decomposition group and T^−=T/T^+. Neither a global stable filtration nor residual irreducibility is silently assumed.

For a number field F, S is finite and contains all places above p, all archimedean places and all primes of ramification of the coefficients. G_(F,S) is the Galois group of the maximal extension unramified outside S. At a finite place v, I_v is inertia and Fr_v is arithmetic Frobenius. Real places use modified Tate terms when required, particularly at p=2. The notation H^i always refers to the canonical continuous-cochain carrier for the specified discrete, compact or rational topology.

For an abelian group B, B̂ denotes lim_m B/p^mB; multiplicatively this is lim_m B/(B)^(p^m). It agrees with ℤ_p⊗B for finitely generated B. The full multiplicative group of a number field and the unit factors of a local field must retain the completion comparison. Inverse limits in an extension tower use **corestriction/norm**, whereas direct limits of discrete cohomology use restriction. These maps are data, not interchangeable conventions.

For Γ≅ℤ_p, Λ=O[[Γ]] and ι sends γ to γ^−1. Pontryagin duals carry the contragredient action through ι. The inverse-determinant convention is 𝔇(C)=det_Λ(C)^−1. A non-torsion module does not have a torsion characteristic ideal; positive-rank assertions use specialized determinant lattices and an explicitly normalized regulator.

The archimedean realization is a finite-dimensional pure Hodge structure with its antilinear coefficient conjugation and, at a real place, a separate complex-linear Betti involution F∞. In the L-function convention used here, ℚ_p(n) has type (n,n), sign (−1)^n and L(V,s)=ζ(s−n). Tau Ceti's existing cohomological Tate Hodge object of index −n supplies this type. Its p-adic Hodge–Tate weight remains −n. The two realizations require comparison data; one is not inferred from the other.

## Foundations and ownership

The pinned baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` with Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The declaration statements listed below were read at those commits. The current Tau Ceti library and TauCetiRoadmap were also screened; their later Kummer implementations and the upstream local multiplicative completion are imported rather than planned again.

Generic continuous compact cochains, local/global Tate duality, Hochschild–Serre and derived limits belong to ArithmeticGaloisDuality. It is a companion in the same upstream bundle. This roadmap takes its canonical carriers and specializes their maps to local conditions. Tau Ceti EllipticCurves Layer 7 supplies the general **discrete** Selmer interface, finite elliptic Selmer groups and Sha. L2 adds the compact/rational diagrams and compares their discrete propagation with that interface. LocalGaloisGroups Layer 7 supplies A(K), the local multiplicative completion.

PadicMeasuresIwasawaAlgebras supplies completed group algebras, involutions, characteristic/Fitting ideals and the requested perfect-determinant operations. PerfectoidSpaces supplies the tilt and A_inf foundations; ArithmeticGaloisRepresentations supplies Weil–Deligne purity. SchemeAndStackFoundations supplies the arithmetic étale K(π,1) comparison, not merely the classification of finite étale covers.

The minimal C_p, B_cris, finite-period, Fontaine–Laffaille and unit/class-tower constructions in L4 are owned here in the bottom-up tier order. Higher p-adic Hodge, finite-flat, crystalline and integral Iwasawa roadmaps import these targets. Their geometric comparison theorems remain with their own owners. The Tate Selmer/characteristic-ideal dictionary is supplied to EulerSystemsCyclotomicMainConjecture; constructing a cyclotomic Euler system or proving a main conjecture is its work. No higher-tier theorem enters the prerequisites below.

A prerequisite written as Lk/name abbreviates SelmerIwasawaCohomology:Lk/name.

Every definition and construction below includes its reusable API and at least three tests that distinguish its conventions. The companion suggested file prototypes available library carriers and records exact mathematical contracts where a supplier carrier is still needed. None of these targets is asserted to be implemented.

## How the comparisons fit together

At finite coefficient level, Kummer turns p-power maps on roots of unity into quotient maps on multiplicative power classes. The H⁰ roots-of-unity tower is finite and its derived limit vanishes. The H¹ Kummer tower is surjective even for a full number field, so its infinitude does not by itself obstruct the Mittag–Leffler argument. These facts identify continuous H¹ with the multiplicative completion; the S-unit version also retains the finite class-group error before its Tate module vanishes.

A Selmer kernel remembers only the H¹ localization condition. Its mapping fibre remembers chosen local **complexes** and therefore the H⁰ correction to the kernel comparison. Derived duality and specialization are formulated for that fibre. Their cohomology consequences retain the Tor/H² and local error terms; a control isomorphism is asserted only after those terms are proved zero. The ordinary condition defined using inertia differs from the strict image through the unramified quotient of V^−. Its annihilator and its relation to the finite condition must use that quotient, including exceptional Frobenius-one terms.

For étale coefficients on j:Spec O_F[1/S]→Spec O_F[1/p], j_* is distinct from Rj_*. The degree-one comparison is an unramified kernel with an inertia edge map. Universal norms in an infinite non-p local tower kill that singular localization, which yields the degree-one Iwasawa comparison. It does not identify the two complexes in every degree.

The characteristic ideal of a local Euler factor or a cotorsion Selmer dual is a torsion invariant. Equating it with a Fitting ideal in dimension two requires the absence of finite submodules and the resulting square resolution. Local/global surjectivity and no-pseudo-null conclusions use Greenberg's explicit RFX, LOC1, LOC2, LEO, CRK and divisibility hypotheses. Those conditions are verified separately in the stated ordinary elliptic specialization.

## Layer L0: Integral and rational continuous cohomology

The constructions in this layer connect actual completion and finite Kummer carriers to compact continuous cohomology. Norm and cup-product conventions remain visible. Weak semisimplicity refers to the invariants-to-coinvariants map, not diagonalizability of the entire representation.

### Comparison of the multiplicative completion with Mathlib adic completion

Target `SelmerIwasawaCohomology:L0/padic-completion` · construction.

Import Mathlib AdicCompletion (p) A and its canonical map and functoriality. Identify its quotients with A/p^m A, or Aˣ/(Aˣ)^(p^m) in multiplicative notation, and identify AdicCompletion (p) ℤ with ℤ_p. Transport its module and inverse-limit topology through these identifications. The finitely generated tensor comparison is the existing ofTensorProduct theorem, not a new completion construction.

**Hypotheses and conventions.** p prime; no finiteness on A for the definition. Rubin's Definition I.6.2 double-dual completion agrees with this Â for finitely generated A and whenever every A/p^mA is finite; Example I.2.1 uses the inverse limit, which is the object used here.

**Prerequisites.** `mathlib:AdicCompletion`, `mathlib:AdicCompletion.of`, `mathlib:AdicCompletion.map`, `mathlib:AdicCompletion.ofTensorProduct`, `mathlib:AdicCompletion.ofTensorProduct_bijective_of_finite_of_isNoetherian`, `mathlib:PadicInt`, `mathlib:PadicInt.toZModPow`.

**Proof plan.**

1. Definition: AdicCompletion (span {p}) A.
2. ℤ_p ⊗ A ≅ Â for finitely generated A: AdicCompletion.ofTensorProduct_bijective_of_finite_of_isNoetherian over the Noetherian ring ℤ.
3. AdicCompletion(p)ℤ ≅ ℤ_p: both are lim ℤ/p^m (PadicInt.toZModPow).

**Sources.** [RUBIN-ES], Chapter I, §2, Example 2.1, printed p. 3 (PDF p. 13). [RUBIN-ES], Chapter I, §6.2, Definition 6.2, printed p. 14 (PDF p. 24).

**API.**

- `TauCeti.Selmer.toPCompletion` (constructor): The canonical map A → Â.
- `TauCeti.Selmer.ker_toPCompletion` (characterisation): ker(A → Â) = ⋂_m p^mA.
- `TauCeti.Selmer.pCompletionMap` (functoriality): A homomorphism A → B induces Â → B̂, with identity and composition laws.
- `TauCeti.Selmer.adicCompletion_int_equiv_padicInt` (equivalence): AdicCompletion(p)ℤ ≅ ℤ_p, making Â a ℤ_p-module.
- `TauCeti.Selmer.pCompletion_bijective_of_finite` (compatibility): For finitely generated A, ℤ_p ⊗ A → Â is bijective (Mathlib's ofTensorProduct).

**Discriminating tests.**

- `pCompletion_prime_to_p` (degenerate): A finite group of order prime to p has Â = 0 (ℤ/2 with p = 3).
- `pCompletion_int` (computation): ℤ̂ = ℤ_p: ℤ_p ⊗ ℤ → ℤ̂ is bijective.
- `pCompletion_rat` (degenerate): ℚ is p-divisible, so ℚ̂ = 0.
- `pCompletion_free_infinite` (non-example): For A = ℤ^(ℕ), ℤ_p ⊗ A → Â is not surjective (∑ p^i e_i is not a finite sum).
- `pCompletion_Zl` (non-example): For ℓ ≠ p, ℤ_ℓ is p-divisible, so its completion is 0 although ℤ_p ⊗_ℤ ℤ_ℓ ≠ 0.

**Acceptance.** The failure for infinitely generated A is the reason the stage forbids replacing (Fˣ)^ by Fˣ ⊗ ℤ_p.

### Profinite topology on the local Kummer comparison

Target `SelmerIwasawaCohomology:L0/local-power-class-finite` · comparison.

Use the current Tau Ceti theorem finiteIndex_range_powMonoidHom for K/ℚ_ℓ finite and n≥1, and the current kummerIso, to put the finite discrete topology on Kˣ/(Kˣ)^(p^m) and H¹(K,μ_(p^m)). Their compatible Kummer isomorphisms induce a homeomorphism of inverse limits. This node plans the comparison of topologies, not the already implemented power-class finiteness.

**Hypotheses and conventions.** K/ℚ_ℓ finite; n ≥ 1.

**Prerequisites.** `tauceti:TauCeti.powerClassQuotient`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-1-units-the-filtration-and-the-multiplicative-group`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-9-the-galois-interface-hilbert-90-and-kummer-theory`.

**Proof plan.**

1. Take finite power quotients and finite-level Kummer isomorphisms from the current library, exposed through the upstream supplier interface.
2. Endow both towers with finite discrete topologies. Compatibility identifies the closed subsets of products defining the inverse limits.
3. The resulting algebraic isomorphism and its inverse are continuous by the inverse-limit universal property.

**Sources.** [RUBIN-ES], Appendix B, §2, Proposition 2.7, printed p. 153 (PDF p. 163).

**Acceptance.** For global F, F^×/(F^×)^n is infinite; this is why the global limit is not profinite.

### Kummer maps along the μ_{p^m} tower

Target `SelmerIwasawaCohomology:L0/kummer-level-compatibility` · lemma.

Let K be a field with p invertible in K and m ≥ 0. The p-th power map μ_{p^{m+1}} → μ_{p^m} carries the Kummer class κ_{p^{m+1}}(a) ∈ H^1(G_K, μ_{p^{m+1}}) to κ_{p^m}(a) for every a ∈ K^×.

**Hypotheses and conventions.** p invertible in K (Tau Ceti's hypothesis IsUnit (n : K)).

**Prerequisites.** `tauceti:TauCeti.kummerMap`, `tauceti:TauCeti.kummerShortExact`, `tauceti:TauCeti.kummerMap_apply`, `tauceti:TauCeti.ContCohomology.DiscreteShortExact.explicitDelta0_coeffMap`.

**Proof plan.**

1. (x ↦ x^p on μ_{p^{m+1}} and on (Kˢ)ˣ, identity on the right-hand (Kˢ)ˣ) is a map of Kummer short exact sequences, because (x^p)^{p^m} = x^{p^{m+1}}.
2. δ⁰ is natural for maps of short exact sequences (TauCeti.ContCohomology.DiscreteShortExact.explicitDelta0_coeffMap), and kummerMap is δ⁰ read on Kˣ (TauCeti.kummerMap_apply).

**Sources.** [RUBIN-ES], Chapter I, §2, Example 2.1, printed p. 3 (PDF p. 13). [RJW-PADIC-L], §10.5, display (10.7), printed p. 52 (arXiv v2).

**Acceptance.** For m = 0 the target is H^1(G_K, μ_1) = 0.

### The system μ_{p^m}(K) is Mittag-Leffler

Target `SelmerIwasawaCohomology:L0/roots-of-unity-mittag-leffler` · lemma.

For any field K, the inverse system m ↦ μ_{p^m}(K) = H^0(G_K, μ_{p^m}) with the p-th power maps consists of finite groups (at most p^m elements), so it is Mittag-Leffler and lim^1_m H^0(G_K, μ_{p^m}) = 0.

**Hypotheses and conventions.** K any field with p invertible.

**Prerequisites.** `mathlib:card_rootsOfUnity`, `mathlib:rootsOfUnity`, `mathlib:CategoryTheory.Functor.isMittagLeffler_of_exists_finite_range`, `ArithmeticGaloisDuality:R02.1/mittag-leffler-lim-one`.

**Proof plan.**

1. μ_{p^m}(K) has at most p^m elements (card_rootsOfUnity).
2. A system of finite sets is Mittag-Leffler (CategoryTheory.Functor.isMittagLeffler_of_exists_finite_range).
3. lim^1 of a Mittag-Leffler system of groups vanishes (ArithmeticGaloisDuality:R02.1).

**Sources.** [RUBIN-ES], Appendix B, §2, Proposition 2.3, printed p. 152 (PDF p. 162).

**Acceptance.** This is the finiteness hypothesis of Rubin's Proposition B.2.3 for i = 1.

### Weak semisimplicity at the invariant eigenvalue

Target `SelmerIwasawaCohomology:L0/weak-semisimplicity` · definition.

For a finite-type ℤ_p-module or finite-dimensional ℚ_p-space M with continuous action of a procyclic group Γ=Ẑ, let can:M^Γ→M_Γ be inclusion followed by quotient. M is weakly semisimple when can is an isomorphism. With a topological generator σ, this is the direct decomposition M=ker(σ−1)⊕im(σ−1); it is weaker than semisimplicity of every eigenvalue. Supply the same definition after restriction of an O-action to ℤ_p.

**Hypotheses and conventions.** Γ procyclic; continuity in the natural p-adic topology; finite type for integral modules.

**Prerequisites.** `ArithmeticGaloisDuality:R02.2/finite-index-descent`.

**Proof plan.**

1. Use the upstream invariants/coinvariants and procyclic generator description.
2. Define the canonical map, independent of generator. Kernel zero and surjectivity are exactly the direct decomposition.
3. Transport through equivariant isomorphisms and direct sums.

**Sources.** [LIU-ETAL-22], Definition 2.1.2, p. 121.

**API.**

- `TauCeti.Selmer.IsWeaklySemisimple` (constructor): can:M^Γ→M_Γ is bijective.
- `TauCeti.Selmer.weaklySemisimple_iff_split` (characterisation): Equivalent to ker(σ−1)⊕im(σ−1)=M.
- `TauCeti.Selmer.weaklySemisimple_congr` (equivalence): An equivariant module equivalence preserves the condition.
- `TauCeti.Selmer.weaklySemisimple_sum` (compatibility): Finite direct sums are weakly semisimple iff every summand is.

**Discriminating tests.**

- `TauCeti.Selmer.Tests.weak_ss_trivial` (degenerate): The trivial action is weakly semisimple, with can=id.
- `TauCeti.Selmer.Tests.weak_ss_unipotent` (non-example): The linear invariants-to-coinvariants criterion fails for σ=[[1,1],[0,1]] on ℚ²; its invariant line maps to zero. The same computation holds over ℚ_p² with the continuous procyclic unipotent action.
- `TauCeti.Selmer.Tests.weak_ss_other_jordan` (computation): The linear criterion holds for σ=[[2,1],[0,2]] on ℚ² because σ−1 is invertible, although σ is not semisimple. The same computation applies over ℚ_p for p odd.

**Acceptance.** On ℚ_p², σ=[[1,1],[0,1]] is not weakly semisimple; the invariant line maps to zero. For p odd, a nontrivial Jordan block at eigenvalue 2 is weakly semisimple because σ−1 is invertible, although the action is not semisimple.

### Completion of global units

Target `SelmerIwasawaCohomology:L0/units-completion` · lemma.

For a number field F, the unit group E_F = 𝓞_F^× is finitely generated, so ℤ_p ⊗ E_F ≅ Ê_F; and the map Ê_F → (F^×)^ induced by E_F ⊆ F^× is injective, because E_F ∩ (F^×)^{p^m} = E_F^{p^m}: a p^m-th root in F of a unit is a unit.

**Hypotheses and conventions.** F a number field, p prime, m ≥ 0.

**Prerequisites.** `L0/padic-completion`, `mathlib:NumberField.Units.exist_unique_eq_mul_prod`, `mathlib:IsIntegral.of_pow`, `mathlib:NumberField.RingOfIntegers`.

**Proof plan.**

1. E_F is finitely generated by Dirichlet's theorem (NumberField.Units.exist_unique_eq_mul_prod: every unit is torsion times a product of fundamental units); apply padic-completion.
2. If x ∈ F^× and x^{p^m} = u ∈ E_F, then x and x^{−1} are integral over 𝓞_F (IsIntegral.of_pow), so x ∈ E_F.
3. Hence the subspace topology on E_F from the p-adic topology of F^× is its own p-adic topology, and the completion map is injective.

**Sources.** [RUBIN-ES], Chapter I, §6.2, Definition 6.2, printed p. 14 (PDF p. 24).

**Acceptance.** The image is closed but not all of (F^×)^; the quotient (F^×)^/Ê_F involves the ideal group.

### Local completion and algebraic tensor comparison

Target `SelmerIwasawaCohomology:L0/local-completion` · lemma.

Import the local multiplicative completion A(K) and its p-adic module from Tau Ceti LocalGaloisGroups Layer 7. Identify it with the L0 Mathlib completion through their common quotient tower. For K/ℚ_ℓ finite the canonical Kˣ⊗ℤℤ_p→A(K) is surjective and not injective: valuation contributes ℤ_p; principal units contribute their p-adic completion, not their algebraic tensor product. For ℓ=p the noninjectivity includes a⊗1−1⊗a in ℤ_p⊗ℤℤ_p with a∉ℚ; for ℓ≠p the nonzero tensor of the pro-ℓ unit factor is killed by completion.

**Hypotheses and conventions.** K/ℚ_ℓ finite, ℓ any prime (ℓ = p allowed).

**Prerequisites.** `L0/padic-completion`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-1-units-the-filtration-and-the-multiplicative-group`.

**Proof plan.**

1. Import the valuation/unit decomposition and A(K) from the current LocalGaloisGroups roadmap; construct the comparison through the quotient tower, without a second local completion carrier.
2. The finite roots-of-unity factor and valuation factor are in the tensor image. For ℓ=p, multiplication ℤ_p⊗ℤℤ_p→ℤ_p is onto; for ℓ≠p multiplication by p is invertible on principal units, so their completion vanishes.
3. Rationalize the principal-unit tensor factor to prove the asserted kernel is nonzero; the same argument embeds the ℓ=p antisymmetric tensor in ℚ_p⊗ℚℚ_p.

**Sources.** [RJW-PADIC-L], §10.5, (10.8), printed p. 53 (arXiv v2).

**Acceptance.** For ℓ ≠ p, the kernel contains U^1_K ⊗ ℤ_p ≠ 0.

### The limit Kummer map

Target `SelmerIwasawaCohomology:L0/kummer-limit-map` · construction.

For a field K with p invertible, κ_∞ : lim_m K^×/(K^×)^{p^m} → lim_m H^1(G_K, μ_{p^m}) is the limit of the Kummer class maps (TauCeti.kummerClassMap) along the tower of kummer-level-compatibility. It is injective, and bijective once the finite-level Kummer maps are surjective (Hilbert 90, ProfiniteCohomology Layer 9).

**Hypotheses and conventions.** p invertible in K.

**Prerequisites.** `L0/kummer-level-compatibility`, `L0/padic-completion`, `tauceti:TauCeti.kummerClassMap`, `tauceti:TauCeti.kummerClassMap_injective`, `tauceti:TauCeti.powerClassQuotient`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-9-the-galois-interface-hilbert-90-and-kummer-theory`.

**Proof plan.**

1. Levelwise injectivity (TauCeti.kummerClassMap_injective) passes to inverse limits.
2. Levelwise bijectivity (Hilbert 90) gives an isomorphism of inverse systems, hence of limits.

**Sources.** [RJW-PADIC-L], §10.5, display (10.7), printed p. 52 (arXiv v2).

**API.**

- `TauCeti.Selmer.kummerLimit_injective` (characterisation): κ_∞ is injective.
- `TauCeti.Selmer.kummerLimit_bijective` (equivalence): κ_∞ is bijective given Hilbert 90 at every level.
- `TauCeti.Selmer.kummerLimit_res` (functoriality): For finite separable L/K with an embedding, κ_∞ commutes with restriction and the inclusion Kˣ → Lˣ.
- `TauCeti.Selmer.kummerLimit_cor` (compatibility): κ_∞ carries the norm N_{L/K} to corestriction.
- `TauCeti.Selmer.kummerLimit_zp_linear` (structure): κ_∞ is ℤ_p-linear.

**Discriminating tests.**

- `kummerLimit_sepClosed` (degenerate): K separably closed: both sides are 0.
- `kummerLimit_real` (computation): K = ℝ, p = 2: ℝ^×/(ℝ^×)^{2^m} = ℤ/2 = H^1(ℤ/2, μ_{2^m}), so both limits are ℤ/2.
- `kummerLimit_finite_field` (computation): K = 𝔽_q: both sides are the p-part of 𝔽_q^× (Ẑ-cohomology H^1 = μ_{p^m}/(Fr − 1)).
- `kummerLimit_rational` (non-example): K = ℚ: the limit is not ℤ_p ⊗ ℚ^× (padic-completion, pCompletion_free_infinite).

**Acceptance.** The limit is taken of groups; topologies are compared in padic-kummer-identification.

### Procyclic invariants and integral lifting

Target `SelmerIwasawaCohomology:L0/procyclic-integral-criteria` · lemma.

For finite-type integral M with procyclic Γ: M_Γ=0 implies M^Γ=0; surjectivity of can:M^Γ→M_Γ implies bijectivity. Weak semisimplicity is preserved by equivariant subquotients and finite sums. If M is a free O-lattice, M/λM is weakly semisimple and dim_E(M⊗E)^Γ≥dim_k(M/λM)^Γ, then equality holds and M is weakly semisimple.

**Hypotheses and conventions.** O the integers of E/ℚ_p; λ a uniformizer; M free for the last assertion.

**Prerequisites.** `L0/weak-semisimplicity`.

**Proof plan.**

1. For coinvariants zero, σ−1 is a surjective endomorphism of a Noetherian module, hence injective. Apply this to the image summand to prove the surjective-can criterion.
2. Use the induced invariant/image splitting for subquotients and finite sums.
3. Reduction bounds the invariant rank above by the residual invariant dimension; the assumed opposite inequality forces equality. Lift the invariant summand and apply Nakayama to its complement, following Lemma 2.1.5.

**Sources.** [LIU-ETAL-22], Lemmas 2.1.3–2.1.5, pp. 121–123.

**Discriminating tests.**

- `TauCeti.Selmer.Tests.procyclic_1_plus_p` (non-example): M=ℤ_p with σ=1+p has rational invariants zero and residual invariants one, so the dimension hypothesis fails and can is not bijective.
- `TauCeti.Selmer.Tests.procyclic_unipotent_reduction` (non-example): The residual unipotent two-dimensional action fails the weak-semisimplicity hypothesis.
- `TauCeti.Selmer.Tests.procyclic_trivial_rank` (computation): The trivial free rank-r action satisfies both dimensions r and can=id.

### Completion of S-units

Target `SelmerIwasawaCohomology:L0/s-units-completion` · lemma.

For a number field F and a finite set S of places containing the archimedean ones, 𝓞_{F,S}^× is finitely generated, so ℤ_p ⊗ 𝓞_{F,S}^× ≅ (𝓞_{F,S}^×)^, and (𝓞_{F,S}^×)^ → (F^×)^ is injective.

**Hypotheses and conventions.** S finite, containing the archimedean places.

**Prerequisites.** `L0/padic-completion`, `L0/units-completion`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-6-additive-strong-approximation-and-ideles`.

**Proof plan.**

1. Finite generation is Dirichlet's S-unit theorem (requested from Tau Ceti GlobalNumberFields).
2. An element of F^× whose p^m-th power is an S-unit has valuation zero outside S, so it is an S-unit; conclude as in units-completion.

**Sources.** [RUBIN-ES], Chapter I, §6.2, Definition 6.2, printed p. 14 (PDF p. 24).

**Acceptance.** For S = S_∞ this is units-completion.

### The p-adic Kummer identification

Target `SelmerIwasawaCohomology:L0/padic-kummer-identification` · theorem.

For a field K with p invertible, H^1(G_K, ℤ_p(1)) ≅ lim_m K^×/(K^×)^{p^m} = (K^×)^, where ℤ_p(1) = lim μ_{p^m} is a compact coefficient module and H^1 is continuous-cochain cohomology (ArithmeticGaloisDuality:R02.1). The map is H^1(G_K, ℤ_p(1)) → lim_m H^1(G_K, μ_{p^m}), an isomorphism because the Milnor term lim^1 H^0(G_K, μ_{p^m}) vanishes, followed by κ_∞^{−1}. It is an algebraic isomorphism for every K; when every K^×/(K^×)^{p^m} is finite (local fields) both sides are profinite and it is a homeomorphism. It is compatible with restriction and with corestriction versus the norm for finite separable extensions.

**Hypotheses and conventions.** p invertible in K. No finite generation of K^× is assumed; the target is the completion, not K^× ⊗ ℤ_p.

**Prerequisites.** `L0/kummer-limit-map`, `L0/roots-of-unity-mittag-leffler`, `L0/local-power-class-finite`, `ArithmeticGaloisDuality:R02.1/milnor-sequence`, `ArithmeticGaloisDuality:R02.1/carrier-comparison`.

**Proof plan.**

1. Milnor sequence 0 → lim^1 H^0(G_K, μ_{p^m}) → H^1(G_K, ℤ_p(1)) → lim H^1(G_K, μ_{p^m}) → 0 (ArithmeticGaloisDuality:R02.1; Rubin Proposition B.2.3).
2. roots-of-unity-mittag-leffler kills the lim^1 term.
3. kummer-limit-map identifies the limit with (K^×)^.
4. For local K, local-power-class-finite makes both sides profinite, and a continuous bijection of compact Hausdorff groups is a homeomorphism.

**Sources.** [RUBIN-ES], Chapter I, §2, Example 2.1, printed p. 3 (PDF p. 13). [RUBIN-ES], Appendix B, §2, Proposition 2.3, printed p. 152 (PDF p. 162). [RJW-PADIC-L], §10.5, display (10.7), printed p. 52 (arXiv v2).

**Acceptance.** For K = ℚ the identification holds with the completion, and ℚ^× ⊗ ℤ_p → H^1(G_ℚ, ℤ_p(1)) is not surjective (sourceIssues E1).

### The Kummer identification for S-units

Target `SelmerIwasawaCohomology:L0/s-unit-kummer-identification` · theorem.

Let F be a number field and S a finite set of places containing those above p and ∞. Then H^1(G_{F,S}, ℤ_p(1)) ≅ ℤ_p ⊗ 𝓞_{F,S}^×, compatibly with restriction to finite extensions inside F_S and with corestriction versus the norm.

**Hypotheses and conventions.** S ⊇ {v | p∞}, so μ_{p^m} is a G_{F,S}-module and p is an S-unit.

**Prerequisites.** `L0/roots-of-unity-mittag-leffler`, `L0/s-units-completion`, `ArithmeticGaloisDuality:R02.1/milnor-sequence`, `ArithmeticGaloisDuality:R02.3/s-unit-kummer-sequence`.

**Proof plan.**

1. The Kummer sequence for G_{F,S}: 0 → 𝓞_{F,S}^×/p^m → H^1(G_{F,S}, μ_{p^m}) → Pic(𝓞_{F,S})[p^m] → 0 (ArithmeticGaloisDuality:R02.3).
2. Pass to the limit: roots-of-unity-mittag-leffler removes lim^1 H^0; the terms 𝓞_{F,S}^×/p^m are finite; lim_m Pic[p^m] = T_p Pic = 0 because Pic(𝓞_{F,S}) is finite.
3. lim 𝓞_{F,S}^×/p^m = ℤ_p ⊗ 𝓞_{F,S}^× (s-units-completion).

**Sources.** [BURUNGALE-TIAN-26], Footnote 3 to Theorem 2.1, p. 4, and §2.2.3 (arXiv v2). [RUBIN-ES], Appendix B, §2, Proposition 2.3, printed p. 152 (PDF p. 162).

**Acceptance.** This is the finite-level statement behind Burungale–Tian's units-kummer item; the tower limit belongs to L3.

### Cup products and Shapiro under p-adic Kummer

Target `SelmerIwasawaCohomology:L0/kummer-cup-shapiro` · comparison.

The p-adic Kummer equivalence intertwines restriction with extension of scalars, corestriction with the field norm, and cup product with the inverse limit of the finite μ_(p^m) cup products. For a finite separable extension L/K, Shapiro followed by evaluation at the identity identifies the induced Kummer class with its L-class; composing the induced-coefficient trace with Shapiro is norm/corestriction. In particular cor(κ_L(a)∪res x)=κ_K(N_(L/K)a)∪x. The cup target is H²(K,ℤ_p(1)⊗ℤ_p M), not H²(K,M) without a twist.

**Hypotheses and conventions.** char K≠p; L/K finite separable; M finite or compact finite free, with the continuous tensor product and coefficient comparison supplied by ArithmeticGaloisDuality.

**Prerequisites.** `L0/padic-kummer-identification`, `ArithmeticGaloisDuality:R02.1/cochains-inverse-limit`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-7-coinduced-modules-and-shapiros-lemma`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-12-the-graded-cup-product-in-all-degrees`.

**Proof plan.**

1. Use the finite connecting-map squares and the upstream Kummer norm/restriction identities.
2. Apply cup naturality and the projection formula at every finite coefficient level; pass through the Milnor comparison with the actual derived-limit term when it does not vanish.
3. Use Shapiro evaluation and its trace/corestriction compatibility at finite level, then the coefficient-limit comparison. No new cup or Shapiro theory is introduced.

**Sources.** [RUBIN-ES], Appendix B §§4–5, pp. 155–158; Chapter I Example 2.1, p. 3.

**Discriminating tests.**

- `TauCeti.Selmer.Tests.kummer_degree_one` (degenerate): For L=K, Shapiro and the norm are the identity.
- `TauCeti.Selmer.Tests.kummer_projection` (compatibility): For x=κ_K(b), the formula has the Tate-twist-two cup target.
- `TauCeti.Selmer.Tests.kummer_norm_not_res` (non-example): For a base-field a, κ_K(N a)=[L:K]κ_K(a), so replacing corestriction by restriction fails.

### Which inverse-limit hypotheses hold

Target `SelmerIwasawaCohomology:L0/inverse-limit-hypotheses` · lemma.

For every field K with char K≠p, the μ_(p^m)(K) tower is finite and hence Mittag–Leffler. The H¹(K,μ_(p^m)) tower is Mittag–Leffler for every such K as well: under finite-level Kummer its transitions are the surjections Kˣ/(Kˣ)^(p^(m+1))→Kˣ/(Kˣ)^(p^m). Thus both H¹(K,ℤ_p(1)) and H²(K,ℤ_p(1)) have their ordinary inverse-limit descriptions. For G_(F,S), S⊇{p,∞}, finite H¹ gives Mittag–Leffler separately. Infinite cardinality of the full number-field H¹ does not obstruct Mittag–Leffler; surjectivity proves it.

**Hypotheses and conventions.** p invertible; F a number field; S finite.

**Prerequisites.** `L0/roots-of-unity-mittag-leffler`, `L0/local-power-class-finite`, `L0/s-unit-kummer-identification`, `ArithmeticGaloisDuality:R02.1/milnor-sequence`, `L0/kummer-level-compatibility`, `ArithmeticGaloisDuality:R02.1/mittag-leffler-lim-one`.

**Proof plan.**

1. H⁰: use roots-of-unity-mittag-leffler.
2. H¹ for the full G_K: finite-level Kummer and kummer-level-compatibility identify transitions with surjective quotient maps. Apply the supplier Mittag–Leffler theorem, without assuming finiteness.
3. H¹ for G_(F,S): use finite restricted-ramification cohomology.
4. Apply the imported Milnor exact sequences in degrees one and two; other coefficient towers require their own hypotheses.

**Sources.** [RUBIN-ES], Appendix B, §2, Proposition 2.3, printed p. 152 (PDF p. 162). [RUBIN-ES], Appendix B, §2, Proposition 2.7, printed p. 153 (PDF p. 163).

**Acceptance.** Consumers must cite (b) or (c) before interchanging H^2 and limits.

## Layer L1: Local and global duality

Orthogonal conditions are first stated for a given pairing. Their arithmetic use imports local Tate duality; finite double-orthogonal and quotient-perfectness assertions retain their perfect-duality hypotheses. Selmer-complex duality is a specialization of the imported compact-support theory.

### Orthogonal complements of local conditions

Target `SelmerIwasawaCohomology:L1/orthogonal-complement` · construction.

Let O be the ring of integers of a finite extension Φ of ℚ_p, D = Φ/O, and b : X × X′ → Y a bilinear pairing of O-modules (Y = Φ, O/MO or D). For an O-submodule F ⊆ X, F^⊥ = {x′ ∈ X′ : b(F, x′) = 0}. Applied to the local Tate pairings H¹(K, A) × H¹(K, A^*) → Y for A = V, W_M, T and A^* = V^*, W^*_M, W^* (Rubin, Theorem 4.1), F^⊥ is the dual local condition F^* of Mazur–Rubin, Definition 1.6.

**Hypotheses and conventions.** b bilinear; perfectness, where used, is a hypothesis of the lemma that uses it.

**Prerequisites.** `mathlib:PontryaginDual`, `mathlib:Submodule.map_le_iff_le_comap`.

**Proof plan.**

1. F^⊥ is an O-submodule, and F ↦ F^⊥ is antitone.
2. If b is perfect (nondegenerate on both sides) and X is finite, a finite-dimensional Φ-space, or a finitely generated O-module paired perfectly with a cofinitely generated one, then F^⊥⊥ = F: in the last case every finitely generated submodule is closed, and Pontryagin duality applies.
3. Image and preimage: if π : X → Z and ι : Z′ → X′ are adjoint (b_Z(π x, z′) = b(x, ι z′)), then (π F)^⊥ = ι^{−1}(F^⊥); dually (π^{−1} G)^⊥ = ι(G^⊥) when b and b_Z are perfect.
4. Counting: for X finite and b perfect, #F · #F^⊥ = #X; for Φ-spaces, dim F + dim F^⊥ = dim X.
5. If F^⊥ = F′, then b induces a perfect pairing (X/F) × F′ → Y.

**Sources.** [RUBIN-ES], Chapter I, §4, Theorem 4.1, printed p. 8 (PDF p. 18). [MAZUR-RUBIN-16], §1, Definition 1.6, p. 5 (arXiv v1).

**API.**

- `TauCeti.Selmer.orthogonal` (constructor): F ↦ F^⊥ for a bilinear pairing of O-modules.
- `TauCeti.Selmer.orthogonal_antitone` (functoriality): F ≤ G ⇒ G^⊥ ≤ F^⊥.
- `TauCeti.Selmer.orthogonal_top` (simp): For a perfect pairing, X^⊥ = 0: relaxed ↦ strict.
- `TauCeti.Selmer.orthogonal_bot` (simp): 0^⊥ = X′: strict ↦ relaxed.
- `TauCeti.Selmer.orthogonal_orthogonal` (characterisation): F^⊥⊥ = F for perfect pairings of finite modules, of Φ-spaces, and of finitely generated O-modules against cofinitely generated ones.
- `TauCeti.Selmer.orthogonal_map_eq_comap` (compatibility): (π F)^⊥ = ι^{−1}(F^⊥) for adjoint π, ι.
- `TauCeti.Selmer.orthogonal_comap_eq_map` (compatibility): (π^{−1} G)^⊥ = ι(G^⊥) for adjoint π, ι and perfect pairings.
- `TauCeti.Selmer.card_mul_card_orthogonal` (relation): #F · #F^⊥ = #X for finite X, b perfect.
- `TauCeti.Selmer.quotientPairing_perfect` (relation): For a perfect pairing in the finite, finite-dimensional or compact/discrete dual categories above, F^⊥=F′ induces a perfect pairing (X/F)×F′→Y, with the quotient and dual topologies retained.

**Discriminating tests.**

- `relax_strict` (computation): For a perfect pairing, X^⊥ = 0 and 0^⊥ = X′.
- `zmod_p` (computation): The standard pairing ℤ/p × ℤ/p → ℤ/p: 0^⊥ = ℤ/p and (ℤ/p)^⊥ = 0; the pairing on (ℤ/p)² with F the first axis gives F^⊥ the second axis.
- `local_example` (computation): K = ℚ_ℓ with ℓ ≠ p and ℓ ≢ 1 (mod p): H¹(K, ℤ/p) ≅ ℤ/p is all unramified, and its orthogonal complement in H¹(K, μ_p) = K^×/K^{×p} ≅ ℤ/p is 0, which is H¹_ur(K, μ_p) = 𝒪_K^×/𝒪_K^{×p}.
- `zero_pairing` (non-example): For the zero pairing F^⊥ = X′ for every F, so F^⊥⊥ = X ≠ F whenever F ≠ X.

**Acceptance.** The parametric lemma RS-08 asks L1 to state before L2 instantiates named conditions. Stated for a named pairing; a statement quantified over arbitrary pairings would admit the zero pairing, for which F^⊥ = X′ for every F.

### Compatibility of the local pairings for T, V, W and W_M

Target `SelmerIwasawaCohomology:L1/lattice-pairing-compatibility` · lemma.

Let K be a finite extension of ℚ_ℓ, ℝ or ℂ and T a p-adic representation of G_K. The local Tate pairings of Rubin's Theorem 4.1 are compatible with the coefficient maps: for c ∈ H¹(K, T) and d ∈ H¹(K, V^*), ⟨φ(c), d⟩ = ⟨c, φ^*(d)⟩ in D, where φ : H¹(K, T) → H¹(K, V) and φ^* : H¹(K, V^*) → H¹(K, W^*); and for c ∈ H¹(K, T), d ∈ H¹(K, W^*_M), ⟨π_M(c), d⟩_M = ⟨c, ι_M(d)⟩ in O/MO ⊆ D, where π_M : T ↠ W_M = M^{−1}T/T and ι_M : W^*_M ↪ W^*.

**Hypotheses and conventions.** The pairings of Rubin's Theorem 4.1, perfect by ArithmeticGaloisDuality's local duality.

**Prerequisites.** `ArithmeticGaloisDuality:R02.4`, `ArithmeticGaloisDuality:R02.1/continuous-section-long-exact`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-12-the-graded-cup-product-in-all-degrees`.

**Proof plan.**

1. Each pairing is cup product followed by the invariant map, so the identities are the naturality of the cup product in the coefficients (ProfiniteCohomology Layer 12) together with the compatibility of the invariant maps H²(K, Φ(1)) → Φ, H²(K, D(1)) → D and H²(K, O(1)/M) → O/MO with the maps O(1)/M ↪ D(1) and Φ(1) ↠ D(1).
2. For the lattice and rational pairings, the continuous cochains and limits are those of ArithmeticGaloisDuality R02.1.

**Sources.** [RUBIN-ES], Chapter I, §4, proof of Proposition 4.3, printed p. 9 (PDF p. 19).

**Acceptance.** These are the pairing comparisons RS-08 keeps in L1 for the stated coefficient modules; the perfectness of each pairing is imported, not reproved.

### Nonsingular torsion classes away from p

Target `SelmerIwasawaCohomology:L1/nonsingular-pairing` · theorem.

For K/ℚ_ℓ finite with ℓ≠p and a finite O-torsion G_K-module R, define H¹_ns as the kernel of the singular map H¹(K,R)→H¹(I_K,R)^(Fr=1). This is H¹_ur and the map is surjective, by residue cohomological dimension one. The cup pairing H¹_ns(K,R)×H¹_ns(K,R^∨(1))→E/O vanishes. This assertion is annihilation, not exact complementarity for arbitrary ramified R; exactness for unramified finite modules comes from the supplier theorem.

**Hypotheses and conventions.** Finite torsion R; Tate dual is Hom_O(R,E/O)(1).

**Prerequisites.** `ArithmeticGaloisDuality:R02.2/hochschild-serre-spectral-sequence`, `ArithmeticGaloisDuality:R02.4/unramified-exact-annihilators`.

**Proof plan.**

1. Apply the inertia Hochschild–Serre edge sequence with vanishing residue H².
2. Identify nonsingular classes with inflated residue H¹.
3. Their cup factors through residue H² of the Tate coefficient, which vanishes. Invoke exact-annihilator theory only with its separate unramified hypotheses.

**Sources.** [LIU-ETAL-22], Definition 2.2.2 and Lemma 2.2.3, p. 124.

### Local conditions and derived orthogonal complements

Target `SelmerIwasawaCohomology:L1/derived-local-complements` · construction.

Given actual local cochain complexes C_X,C_Y with the supplier perfect degree-two cup duality and maps U_X^+→C_X, U_Y^+→C_Y, include a chosen nullhomotopy of their cup product as orthogonality data. Put U_Y^−=Cone(U_Y^+→C_Y). The adjoint U_X^+→RHom(U_Y^−,J)[−2] defines Err_v as its cone. Derived complementarity means Err_v is acyclic; H¹-annihilation alone does not imply it. For complementary finite-free coefficient subcomplexes X^+,Y^+ under X⊗Y→J(1), the coefficient adjoint X/X^+→D_J(Y^+)(1) gives the vanishing criterion.

**Hypotheses and conventions.** Bounded local conditions and coefficient finiteness/cofiniteness satisfying Nekovář 6.2.5; p=2 real places use the supplier modified complexes, or exclude real places. J is the chosen injective or dualizing coefficient complex.

**Prerequisites.** `ArithmeticGaloisDuality:D7/derived-local-duality`, `L1/orthogonal-complement`.

**Proof plan.**

1. Form the actual cones and the chain-level adjoint using the nullhomotopy.
2. Define the error cone and its long exact sequence; derive the comparison with ordinary H¹ annihilators only under the necessary H⁰/H² hypotheses.
3. For elementary subcomplexes, use the supplier derived local duality and the coefficient exact triangle to identify the error with the cohomology of the coefficient adjoint cone.

**Sources.** [NEKOVAR-SC], §§6.2.1–6.2.7, pp. 137–140; §6.7, pp. 151–154.

**API.**

- `TauCeti.Selmer.LocalConditionMorphism` (constructor): A morphism U^+→C on the actual continuous cochain carrier.
- `TauCeti.Selmer.localMinus` (constructor): The cone of U^+→C.
- `TauCeti.Selmer.localDualError` (constructor): Cone of the cup-adjoint U_X^+→D(U_Y^−)[−2].
- `TauCeti.Selmer.derivedComplement_iff` (characterisation): Derived complementarity iff the error cone is acyclic.
- `TauCeti.Selmer.localDualError_congr` (functoriality): Compatible quasi-isomorphisms and nullhomotopies give equivalent error cones.

**Discriminating tests.**

- `TauCeti.Selmer.Tests.derived_strict_relaxed` (degenerate): The zero and identity local-condition maps are derived complements under perfect local duality.
- `TauCeti.Selmer.Tests.derived_h0_matters` (non-example): Adding a nonzero degree-zero complex with zero map to U^+ leaves its H¹ image unchanged but changes the error cone.
- `TauCeti.Selmer.Tests.derived_nonperfect_pairing` (non-example): For a zero coefficient pairing on nonzero modules, H¹ cup annihilation does not produce complementary derived local conditions.

### Duality for a global mapping fibre with local conditions

Target `SelmerIwasawaCohomology:L1/derived-selmer-duality` · theorem.

Let F_X=Fib(C_global(X)⊕⊕U_X,v^+→⊕C_v(X)), and F_Y similarly, with the arrow res−i and pairings/nullhomotopies as in derived-local-complements. Transport the ArithmeticGaloisDuality D7 global compact-support duality to a map F_X→D_J(F_Y)[−3]. Its error triangle has third vertex ⊕_v Err_v. It is an isomorphism if the local adjoints are quasi-isomorphisms, and otherwise the error cone remains in the statement. This L1 theorem is parametric in local-condition maps; L2 instantiates it, avoiding an L1→L2 dependency.

**Hypotheses and conventions.** Finite S; bounded complexes; the supplier global-duality coefficient hypotheses and modified real-place convention. Chain-level orthogonality data, not just orthogonal H¹ subspaces.

**Prerequisites.** `L1/derived-local-complements`, `ArithmeticGaloisDuality:D7/derived-global-duality`, `ArithmeticGaloisDuality:D7/compact-support-cochains`.

**Proof plan.**

1. Import the compact-support triangle and its perfect degree-three duality.
2. Use the local nullhomotopies to define the fibre pairing; use the octahedral axiom on the global and local duality triangles.
3. Identify the remaining cone with the finite direct sum of local adjoint cones (Nekovář 6.3.4). Take cohomology for the exact error sequence.

**Sources.** [NEKOVAR-SC], Proposition 6.3.4, pp. 142–143.

**Discriminating tests.**

- `TauCeti.Selmer.Tests.selmer_duality_shift` (compatibility): Over a field, complementary conditions pair H^i(F_X) with H^(3−i)(F_Y), rather than degree 2−i.
- `TauCeti.Selmer.Tests.selmer_duality_errors` (non-example): A nonacyclic Err_v is retained even if the H¹ local conditions annihilate each other.
- `TauCeti.Selmer.Tests.selmer_duality_real_two` (non-example): At p=2 with a real place, the unmodified compact-support complex is not an allowed substitution.

### Strict ordinary and inertia ordinary annihilators

Target `SelmerIwasawaCohomology:L1/ordinary-annihilator-correction` · theorem.

For a perfect Tate-dual pairing M×M^*(1) and saturated G_v-stable M^+⊂M, put M^−=M/M^+ and (M^*(1))^+=ann(M^+). The strict ordinary condition is im H¹(G_v,M^+) = ker(H¹(G_v,M)→H¹(G_v,M^−)); its dual is the corresponding strict ordinary condition for the dual coefficient filtration, whenever derived coefficient complements and their exact cohomology hypotheses hold. The inertia ordinary condition ker(H¹(G_v,M)→H¹(I_v,M^−)) contains it, with quotient exactly im[H¹(G_v,M)→H¹(G_v,M^−)]∩H¹_ur(G_v,M^−). Thus its annihilator is a subcondition of the strict dual, cut out by pairing with this correction. Equality requires this correction to vanish.

**Hypotheses and conventions.** The quotient and dual lattice must be saturated/finite free in the compact case. Perfect local Tate pairings are imported; no assumed universal equality between strict and inertia ordinary conditions. In this derived-pairing notation M^*(1) is the coefficient-appropriate untwisted linear dual followed by the Tate twist; for a lattice paired with a discrete module the target is E/O. Rubin’s separate star notation already includes its Tate twist.

**Prerequisites.** `L1/derived-local-complements`, `ArithmeticGaloisDuality:R02.1/continuous-section-long-exact`, `ArithmeticGaloisDuality:R02.2/compact-five-term`.

**Proof plan.**

1. Use the long exact sequence for 0→M^+→M→M^−→0 to identify the strict image with the kernel.
2. Use inflation–restriction for I_v to compute the difference between the two kernels.
3. Apply derived-local-complements to complementary coefficients; identify the dual of the larger condition by orthogonality to the calculated correction.

**Sources.** [NEKOVAR-SC], §6.7.1–6.7.6, pp. 151–153; §8.9.6–8.9.7, pp. 240–244.

**Discriminating tests.**

- `TauCeti.Selmer.Tests.ordinary_full` (degenerate): M^+=M gives the relaxed condition and strict dual.
- `TauCeti.Selmer.Tests.ordinary_zero` (non-example): M^+=0 gives strict zero but inertia unramified; these differ when H¹_ur(M)≠0.
- `TauCeti.Selmer.Tests.ordinary_exceptional_trivial` (non-example): For M^− trivial rational at p, H¹_ur(M^−) has dimension one, so it cannot be dropped.

## Layer L2: Selmer structures and duals

Start with the upstream discrete Selmer structures. The targets here extend them to lattice and rational coefficients, specify how conditions propagate and preserve every invariant/localization error in coefficient and field changes. The local finite condition at p is supplied by L4; the constructions here are parametric in it.

### Compact/rational compact and rational extensions of the upstream Selmer structure

Target `SelmerIwasawaCohomology:L2/selmer-data` · construction.

Extend the general discrete Selmer interface imported from Tau Ceti EllipticCurves Layer 7 to compact lattice T and rational V cohomology, and compare coefficient propagation on A=V/T with that interface. Selmer data over a commutative ring R indexed by a set of places ι: a global R-module H (for example H^1(G_{K,Σ}, M)), local R-modules H_v (for example H^1(K_v, M)), R-linear localisation maps res_v : H → H_v, and local conditions L_v ⊆ H_v (R-submodules). Modifications replace the conditions: relaxed (L_v = H_v) on a set of places, strict (L_v = 0) on a set of places.

**Hypotheses and conventions.** The data are module-theoretic, so the same API serves discrete (Tau Ceti), compact and rational coefficients (ArithmeticGaloisDuality:R02.1). Tau Ceti EllipticCurves Layer 7 supplies the general discrete Selmer structure and kernel. This node plans its compact/rational extension and the comparison with A=V/T, not a second discrete definition.

**Prerequisites.** `mathlib:Submodule.map_le_iff_le_comap`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`.

**Proof plan.**

1. Use the supplier’s discrete datum without introducing a second discrete carrier. Instantiate the same module-theoretic localization diagram with compact/rational cohomology and compare the maps under coefficient change.

**Sources.** [MAZUR-RUBIN-16], §1, Definition 1.1, p. 4 (arXiv v1). [MAZUR-RUBIN-16], §2, Definition 2.1, p. 6 (arXiv v1).

**API.**

- `TauCeti.Selmer.SelmerData.withCond` (constructor): Replace the local conditions.
- `TauCeti.Selmer.SelmerData.relax` (constructor): Relaxed condition H_v at the places of a set B.
- `TauCeti.Selmer.SelmerData.strict` (constructor): Strict condition 0 at the places of a set A.
- `TauCeti.Selmer.SelmerData.selmer_strict_le_le_relax` (relation): Sel_strict ≤ Sel ≤ Sel_relaxed.

**Discriminating tests.**

- `selmer_all_relaxed` (degenerate): All conditions relaxed: the Selmer module is H.
- `selmer_all_strict` (computation): All conditions strict: the Selmer module is ⋂_v ker res_v.
- `selmer_no_places` (degenerate): No places: the Selmer module is H.
- `selmer_strict_le_relax` (computation): Strict ≤ relaxed.

**Acceptance.** Mazur–Rubin's F^b_a(n) is withCond with strict conditions at a and relaxed ones at b; transverse conditions belong to EulerSystemsAndKolyvaginSystems:ES.1.

### Propagating local conditions

Target `SelmerIwasawaCohomology:L2/condition-propagation` · construction.

Along a coefficient map inducing g : H^1(K_v, X) → H^1(K_v, Y), a condition L ⊆ H^1(K_v, X) propagates forwards to g(L) (quotients T ↠ T/IT, V → W), and a condition L' ⊆ H^1(K_v, Y) propagates backwards to g^{−1}(L') (submodules T[I] ↪ T, T → V). The two form a Galois connection.

**Hypotheses and conventions.** Any R-linear g.

**Prerequisites.** `mathlib:Submodule.map_le_iff_le_comap`.

**Proof plan.**

1. Image and preimage of submodules; Galois connection Submodule.map_le_iff_le_comap.

**Sources.** [MAZUR-RUBIN-16], §1, Definition 1.1, p. 4 (arXiv v1).

**API.**

- `TauCeti.Selmer.propagateImage` (constructor): Forward propagation g(L).
- `TauCeti.Selmer.propagatePreimage` (constructor): Backward propagation g^{−1}(L').
- `TauCeti.Selmer.propagate_gc` (universal-property): g(L) ≤ L' ↔ L ≤ g^{−1}(L').
- `TauCeti.Selmer.propagateImage_top` (simp): The relaxed condition propagates forwards along a surjection to the relaxed one.
- `TauCeti.Selmer.propagatePreimage_bot` (simp): The strict condition propagates backwards to ker g.

**Discriminating tests.**

- `propagate_top_surjective` (computation): Forward propagation of ⊤ along a surjection is ⊤.
- `propagate_bot_preimage` (computation): Backward propagation of ⊥ is the kernel.
- `propagate_comp` (compatibility): Propagation along g ∘ h is propagation along h then g.

**Acceptance.** Mazur–Rubin propagate by image to T/IT and by inverse image to T[I].

### Pontryagin duals with the contragredient action

Target `SelmerIwasawaCohomology:L2/pontryagin-dual` · construction.

For a discrete p-primary module M with a continuous G-action, M^∨ = Hom_cont(M, ℚ_p/ℤ_p) (Mathlib's PontryaginDual for the circle, restricted to p-primary M) with the contragredient action (g·f)(x) = f(g^{−1}x). Over a group ring ℤ_p[[Γ]] the dual is a module through the involution γ ↦ γ^{−1}.

**Hypotheses and conventions.** M discrete p-primary; G acts continuously.

**Prerequisites.** `mathlib:PontryaginDual`, `mathlib:ContinuousMonoidHom.comp`, `mathlib:MulDistribMulAction.toMonoidHom`.

**Proof plan.**

1. ContinuousMonoidHom.comp with the action of g^{−1}; the left-action law uses (gh)^{−1} = h^{−1}g^{−1}.

**Sources.** [BURUNGALE-TIAN-26], §1.0.1 and §3.1, pp. 1 and 6 (arXiv v2).

**API.**

- `TauCeti.Selmer.contragredient` (constructor): (g·f)(x) = f(g^{−1}x).
- `TauCeti.Selmer.contragredient_mul` (structure): The contragredient action is a left action.
- `TauCeti.Selmer.dual_involution` (compatibility): As a ℤ_p[[Γ]]-module, M^∨ is the dual twisted by the involution γ ↦ γ^{−1}.
- `TauCeti.Selmer.dual_selmer` (functoriality): Selmer maps dualise contravariantly.

**Discriminating tests.**

- `dual_QpZp` (computation): (ℚ_p/ℤ_p)^∨ = ℤ_p.
- `dual_finite` (degenerate): A finite module has a finite dual of the same order.
- `dual_trivial_action` (degenerate): Trivial action dualises to trivial action.

**Acceptance.** Dualising twice returns M; (ℚ_p/ℤ_p)^∨ = ℤ_p.

### Selmer complex as a mapping fibre

Target `SelmerIwasawaCohomology:L2/selmer-complex` · construction.

For a finite set S and a bounded compact/rational/discrete coefficient complex X on the canonical continuous carrier, a complex local condition consists of actual maps i_v^+:U_v^+→C_cont(G_v,X). Define RΓ_f(F,S,X;U^+) as Cone(C_cont(G_(F,S),X)⊕⊕_v U_v^+ --res−i-->⊕_v C_cont(G_v,X))[−1]. Supply the triangles RΓ_f→RΓ_global→⊕U_v^− and RΓ_c→RΓ_f→⊕U_v^+. Strict uses U^+=0 and relaxed uses i=id. Submodules of H¹ are not by themselves a unique choice of U^+.

**Hypotheses and conventions.** Actual continuous complexes and localization maps are supplier objects; finite S; use modified real local complexes at p=2 where required.

**Prerequisites.** `ArithmeticGaloisDuality:D7/compact-support-cochains`, `L1/derived-local-complements`, `ArithmeticGaloisDuality:R02.1/carrier-comparison`.

**Proof plan.**

1. Form the finite direct sums, res−i arrow and its shifted cone in Mathlib derived categories.
2. Give chain-level maps for both triangles, and prove their naturality via cone functoriality and the octahedral axiom.
3. For discrete X identify the continuous carrier with upstream locally constant cohomology; compare its H¹ kernel after the next node computes H⁰ corrections.

**Sources.** [NEKOVAR-SC], Definitions 6.1.1–6.1.2 and triangles 6.1.3, pp. 135–136.

**API.**

- `TauCeti.Selmer.selmerComplex` (constructor): Cone(res−i)[−1] on canonical continuous complexes.
- `TauCeti.Selmer.selmerComplex_globalTriangle` (structure): RΓ_f→RΓ_global→⊕Cone(i_v^+) is an exact triangle.
- `TauCeti.Selmer.selmerComplex_compactTriangle` (structure): RΓ_c→RΓ_f→⊕U_v^+ is an exact triangle.
- `TauCeti.Selmer.selmerComplex_map` (functoriality): Coefficient/field/local-condition maps and homotopies induce a fibre map, with identity and composition.
- `TauCeti.Selmer.selmerComplex_quasiIso` (equivalence): Compatible quasi-isomorphic conditions give equivalent Selmer complexes.

**Discriminating tests.**

- `TauCeti.Selmer.Tests.selmer_complex_relaxed` (degenerate): If every i_v=id, RΓ_f is quasi-isomorphic to RΓ_global.
- `TauCeti.Selmer.Tests.selmer_complex_strict` (compatibility): If every U_v^+=0, RΓ_f is compact-support cohomology with the same real-place convention.
- `TauCeti.Selmer.Tests.selmer_complex_empty` (degenerate): For S empty, the fibre is the global complex, without an extra shift.
- `TauCeti.Selmer.Tests.selmer_complex_same_h1` (non-example): Two local conditions with equal H¹ image can give different Selmer H¹ because their H⁰ differs.

### Compact/rational compact/rational Selmer kernel and discrete comparison

Target `SelmerIwasawaCohomology:L2/selmer-kernel` · construction.

Extend the general discrete Selmer interface imported from Tau Ceti EllipticCurves Layer 7 to compact lattice T and rational V cohomology, and compare coefficient propagation on A=V/T with that interface. For Selmer data D, Sel(D) = {c ∈ H : res_v(c) ∈ L_v for all v} = ker(H → ∏_v H_v/L_v).

**Hypotheses and conventions.** For infinitely many places the product is the right target; in the Galois instance only finitely many conditions are nontrivial (Rubin's remark after Definition 5.1). Tau Ceti EllipticCurves Layer 7 supplies the general discrete Selmer structure and kernel. This node plans its compact/rational extension and the comparison with A=V/T, not a second discrete definition.

**Prerequisites.** `L2/selmer-data`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`.

**Proof plan.**

1. Intersection of the preimages of the L_v; equality with the kernel of the product of quotient maps.

**Sources.** [MAZUR-RUBIN-16], §2, Definition 2.1, p. 6 (arXiv v1). [RUBIN-ES], Chapter I, §5, Definition 5.1, printed pp. 11–12 (PDF pp. 21–22).

**API.**

- `TauCeti.Selmer.SelmerData.mem_selmer` (characterisation): c ∈ Sel iff res_v c ∈ L_v for all v.
- `TauCeti.Selmer.SelmerData.selmer_eq_ker` (equivalence): Sel = ker(H → ∏_v H_v/L_v).
- `TauCeti.Selmer.SelmerData.selmer_mono` (relation): Monotone in the local conditions.

**Discriminating tests.**

- `selmer_kernel_relaxed` (degenerate): Relaxed everywhere gives H.
- `selmer_kernel_strict` (computation): Strict everywhere gives ⋂ ker res_v.
- `selmer_kernel_empty` (degenerate): An empty index set gives H.

**Acceptance.** Rubin's S^Σ and S_Σ are relax and strict applied to Σ.

### From V to T and W; saturation

Target `SelmerIwasawaCohomology:L2/lattice-passage` · lemma.

Given L_V ⊆ H^1(K_v, V), put L_T = inverse image under H^1(K_v, T) → H^1(K_v, V) and L_W = image under H^1(K_v, V) → H^1(K_v, W) (Rubin's H^1_f(K_v, T), H^1_f(K_v, W)). Then H^1(K_v, T)/L_T is torsion-free (L_T is saturated) and L_W is divisible.

**Hypotheses and conventions.** T a finitely generated free ℤ_p- or O-module with continuous action, V = T[1/p], W = V/T; L_V a ℚ_p-subspace.

**Prerequisites.** `L2/condition-propagation`, `ArithmeticGaloisDuality:R02.1/lattice-torsion-sequence`.

**Proof plan.**

1. If n·x ∈ L_T with n ≠ 0 then n·x ↦ n·y ∈ L_V, and y ∈ L_V as L_V is a ℚ_p-subspace, so x ∈ L_T.
2. L_W is the image of a ℚ_p-vector space, hence divisible.
3. The maps H^1(T) → H^1(V) → H^1(W) come from ArithmeticGaloisDuality:R02.1.

**Sources.** [RUBIN-ES], Chapter I, §3.2, Definition 3.4, printed p. 5 (PDF p. 15). [RUBIN-ES], Chapter I, §3.2, proof of Lemma 3.5, printed p. 6 (PDF p. 16).

**Acceptance.** The saturation of the condition on T and the divisibility on W are separate statements, as the stage asks.

### The unramified condition

Target `SelmerIwasawaCohomology:L2/unramified-condition` · construction.

For a decomposition group G_v with inertia subgroup I_v and a G_v-module B, H^1_ur(K_v, B) = ker(H^1(G_v, B) → H^1(I_v, B)). By inflation–restriction it is the image of H^1(G_v/I_v, B^{I_v}), and for procyclic G_v/I_v generated by Fr it is B^{I_v}/(Fr − 1)B^{I_v}.

**Hypotheses and conventions.** B discrete, a finitely generated ℤ_p-module, or a finite-dimensional ℚ_p-space (Rubin Lemma I.3.2).

**Prerequisites.** `L2/selmer-data`, `ArithmeticGaloisDuality:R02.2/compact-five-term`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-5-exact-sequences`.

**Proof plan.**

1. Kernel of restriction to inertia.
2. Inflation–restriction (Tau Ceti ProfiniteCohomology Layer 5; Rubin Proposition B.2.5(i)).
3. H^1(Ẑ, C) = C/(Fr − 1)C by evaluation at Fr (Rubin Lemma B.2.8).

**Sources.** [RUBIN-ES], Chapter I, §3.1, Definition 3.1, printed p. 4 (PDF p. 14). [RUBIN-ES], Chapter I, §3.1, Lemma 3.2(i), printed p. 4 (PDF p. 14).

**API.**

- `TauCeti.Selmer.unramified` (constructor): ker(res to inertia).
- `TauCeti.Selmer.unramified_eq_range_inflation` (characterisation): = image of inflation from G_v/I_v.
- `TauCeti.Selmer.unramified_equiv_coinvariants` (equivalence): ≅ B^{I}/(Fr − 1)B^{I}.
- `TauCeti.Selmer.greenberg_zero` (compatibility): The Greenberg condition with F^+ = 0.

**Discriminating tests.**

- `unramified_trivial_Zp` (computation): B = ℤ/p with trivial action over ℚ_ℓ: H^1_ur = Hom(Gal(K^ur/K), ℤ/p) = ℤ/p.
- `unramified_divisible_W` (computation): For unramified T, H^1_f(K, W) = H^1_ur(K, W) (Rubin Lemma 3.5(iv)).
- `unramified_non_example` (non-example): For ramified B the inclusion H^1_ur(K, T) ⊆ H^1_f(K, T) can be strict, with quotient (W^I/(W^I)_div)^{Fr=1} (Rubin Lemma 3.5(iii)).

**Acceptance.** Unramified B: H^1_ur = B/(Fr − 1)B.

### Coranks

Target `SelmerIwasawaCohomology:L2/corank` · construction.

For a cofinitely generated discrete ℤ_p-module M, corank_{ℤ_p} M = dim_{ℚ_p}(M^∨ ⊗_{ℤ_p} ℚ_p).

**Hypotheses and conventions.** M cofinitely generated, so M^∨ is a finitely generated ℤ_p-module.

**Prerequisites.** `L2/pontryagin-dual`, `mathlib:Module.finrank`.

**Proof plan.**

1. Module.finrank over ℚ_p of the rationalised dual.

**Sources.** [BURUNGALE-TIAN-26], §1.0.1, the exact sequence and (1.1), p. 1 (arXiv v2).

**API.**

- `TauCeti.Selmer.corank` (constructor): dim_{ℚ_p}(M^∨ ⊗ ℚ_p).
- `TauCeti.Selmer.corank_finite` (simp): Finite modules have corank 0.
- `TauCeti.Selmer.corank_add` (relation): Additive in short exact sequences.
- `TauCeti.Selmer.corank_pi_padicInt` (simp): ℤ_p^r, the dual of (ℚ_p/ℤ_p)^r, has corank r.

**Discriminating tests.**

- `corank_Zp` (computation): The dual ℤ_p of ℚ_p/ℤ_p has corank 1.
- `corank_finite_zero` (degenerate): ℤ_p/(p) has corank 0.
- `corank_Zp2` (computation): ℤ_p² has corank 2.

**Acceptance.** Additive in short exact sequences of cofinitely generated modules.

### Lattice changes with global and local errors

Target `SelmerIwasawaCohomology:L2/lattice-change-cone` · theorem.

For stable lattices T⊂T′⊂V with finite Q=T′/T and compatible local-condition complexes, the cone of RΓ_f(T)→RΓ_f(T′) is the fibre of the global coefficient cone RΓ(Q) and the local-condition cones mapping to the local RΓ(Q). If the local conditions form exact triangles with their Q-condition, this is RΓ_f(Q); otherwise retain their discrepancy cones. For this fibre C_Q, the exact fragment H⁰_f(T′)→H⁰(C_Q)→H¹_f(T)→H¹_f(T′)→H¹(C_Q)→H²_f(T) controls the kernel and cokernel. The discrete map A=V/T→A′=V/T′ has kernel Q and has the corresponding exact triangle in the other order. Rationalization identifies both lattice complexes with the same V-complex, but finite integral errors need not vanish.

**Hypotheses and conventions.** Continuous coefficient exact sequences and compatible local maps; Q finite. Saturated propagation of rational conditions does not imply local exactness on every finite quotient.

**Prerequisites.** `L2/selmer-complex`, `L2/condition-propagation`, `ArithmeticGaloisDuality:R02.1/lattice-torsion-sequence`.

**Proof plan.**

1. Import the cochain coefficient exact triangle for T→T′→Q.
2. Take the diagram of localization and local-condition triangles; its fibre identifies the cone, including any nonexact local propagation.
3. Read the LES, then invert p to eliminate Q and the finite lattice discrepancies only under the rational comparison hypotheses.

**Sources.** [NEKOVAR-SC], §6.1.3, pp. 136–137; §8.10, pp. 249–251. [RUBIN-ES], Chapter I, Lemma 5.4 and Remark 5.5, pp. 11–12.

**Discriminating tests.**

- `TauCeti.Selmer.Tests.lattice_equal` (degenerate): T=T′ gives Q=0 and an equivalence.
- `TauCeti.Selmer.Tests.lattice_scaling` (non-example): T′=p^−1T has nonzero finite Q; integral H⁰ and H² errors cannot be removed by rational equality.
- `TauCeti.Selmer.Tests.lattice_tamagawa` (non-example): At a bad Tamagawa prime, the raw inertia condition on Q need not equal the condition propagated from V.

### Change of local conditions

Target `SelmerIwasawaCohomology:L2/change-of-conditions` · lemma.

If L_v ≤ L'_v for all v, then Sel_L ⊆ Sel_{L'} and the sequence 0 → Sel_L → Sel_{L'} → ∏_v L'_v/L_v is exact.

**Hypotheses and conventions.** Same global module and localisation maps for both conditions.

**Prerequisites.** `L2/selmer-kernel`.

**Proof plan.**

1. Monotonicity; a class of Sel_{L'} lies in Sel_L iff each res_v c lies in L_v, that is, iff its image in ∏ L'_v/L_v vanishes.

**Sources.** [MAZUR-RUBIN-16], §2, Definition 2.3 and display (2.4), pp. 6–7 (arXiv v1).

**Acceptance.** Mazur–Rubin (2.4) is the case L' = L relaxed at the primes dividing n/m.

### Functoriality of Selmer modules

Target `SelmerIwasawaCohomology:L2/selmer-functoriality` · lemma.

A map of Selmer data (R-linear f : H → H', f_v : H_v → H'_v with f_v ∘ res_v = res'_v ∘ f and f_v(L_v) ⊆ L'_v) maps Sel(D) into Sel(D').

**Hypotheses and conventions.** Compatibility squares and inclusion of conditions.

**Prerequisites.** `L2/selmer-kernel`.

**Proof plan.**

1. Chase: res'_v(f c) = f_v(res_v c) ∈ f_v(L_v) ⊆ L'_v.

**Sources.** [RUBIN-ES], Chapter I, §5, Lemma 5.4, printed p. 12 (PDF p. 22).

**Acceptance.** Applied to T → V → W with the propagated conditions of lattice-passage.

### Greenberg's local condition

Target `SelmerIwasawaCohomology:L2/greenberg-condition` · construction.

For a decomposition group G_v at p with inertia I_v and a G_v-stable submodule F^+M ⊆ M, L^Gr_v = ker(H^1(G_v, M) → H^1(I_v, M/F^+M)). F^+M need only be stable under G_v, not under the global Galois group.

**Hypotheses and conventions.** F^+ stable under G_v; for W = V/T use the image F^+W of F^+V.

**Prerequisites.** `L2/unramified-condition`, `L2/selmer-data`.

**Proof plan.**

1. Kernel of the composite of restriction to I_v and the map induced by M → M/F^+M.

**Sources.** [RJW-PADIC-L], §13.5.1, Definition 13.19(1), p. 70 (arXiv v2).

**API.**

- `TauCeti.Selmer.greenberg` (constructor): ker(H^1(G_v, M) → H^1(I_v, M/F^+M)).
- `TauCeti.Selmer.greenberg_zero` (simp): F^+ = 0 gives the unramified condition.
- `TauCeti.Selmer.greenberg_top` (simp): F^+ = M gives the relaxed condition.
- `TauCeti.Selmer.unramified_le_greenberg` (relation): H^1_ur ⊆ L^Gr.

**Discriminating tests.**

- `greenberg_F_zero` (degenerate): F^+ = 0: L^Gr = H^1_ur.
- `greenberg_F_top` (degenerate): F^+ = M: L^Gr = H^1.
- `greenberg_decomposition_only` (non-example): For an ordinary elliptic curve, the ordinary line of V_pE is G_{ℚ_p}-stable but not G_ℚ-stable; the condition is still defined.

**Acceptance.** For M = W_n = (ℚ_p/ℤ_p)(n) over ℚ(μ_{p^∞})^+ with Fil^1 = W_n (n ≥ 1) or 0 (n ≤ 0), L^Gr is everything or the unramified condition (RJW §13.5.2).

### Compact/rational galois-cohomological Selmer groups

Target `SelmerIwasawaCohomology:L2/galois-selmer-group` · construction.

Extend the general discrete Selmer interface imported from Tau Ceti EllipticCurves Layer 7 to compact lattice T and rational V cohomology, and compare coefficient propagation on A=V/T with that interface. For a number field K, a finite set Σ of places containing those above p∞ and the ramified primes, and a coefficient module M (discrete, compact or rational), Sel_L(K, M) is the Selmer module of the data H = H^1(G_{K,Σ}, M), H_v = H^1(K_v, M), res_v the localisation (restriction to a decomposition group), with local conditions L_v for v ∈ Σ. It equals the classes of H^1(K, M) that are unramified outside Σ and satisfy L_v at Σ (Rubin Lemma I.5.3).

**Hypotheses and conventions.** Σ ⊇ {v | p∞} ∪ {ramified primes}; the conditions at v ∉ Σ are unramified. Tau Ceti EllipticCurves Layer 7 supplies the general discrete Selmer structure and kernel. This node plans its compact/rational extension and the comparison with A=V/T, not a second discrete definition.

**Prerequisites.** `L2/selmer-kernel`, `L2/unramified-condition`, `ArithmeticGaloisDuality:R02.3/restricted-ramification-group`, `ArithmeticGaloisDuality:R02.3/localisation-maps`, `ArithmeticGaloisDuality:R02.1/carrier-comparison`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`.

**Proof plan.**

1. G_{K,Σ}, decomposition groups and localisation maps come from ArithmeticGaloisDuality:R02.3.
2. Rubin's Lemma I.5.3: the unramified conditions outside Σ cut out H^1(K_Σ/K, M) inside H^1(K, M).

**Sources.** [MAZUR-RUBIN-16], §2, Definition 2.1, p. 6 (arXiv v1). [RUBIN-ES], Chapter I, §5, Lemma 5.3, printed p. 12 (PDF p. 22).

**API.**

- `TauCeti.Selmer.galoisSelmer_eq_rubin` (equivalence): Sel_L(K, M) = {c ∈ H^1(K, M) : c_v ∈ L_v (v ∈ Σ), c_v unramified (v ∉ Σ)}.
- `TauCeti.Selmer.galoisSelmer_enlarge` (compatibility): Enlarging Σ with unramified conditions leaves Sel unchanged.
- `TauCeti.Selmer.galoisSelmer_relax_eq` (simp): Relaxed at every v ∈ Σ: Sel = H^1(G_{K,Σ}, M).
- `TauCeti.Selmer.galoisSelmer_map` (functoriality): Maps of coefficient modules with compatible conditions induce maps.

**Discriminating tests.**

- `galoisSelmer_relaxed` (degenerate): Relaxed on Σ: H^1(G_{K,Σ}, M).
- `galoisSelmer_mu_p` (computation): With coefficients μ_p and relaxed conditions on Σ={v|p∞}, the Selmer group is H¹(G_(K,Σ),μ_p), fitting into the S-unit/p and Pic[p] Kummer sequence. Requiring unramifiedness also at p cuts this group down.
- `galoisSelmer_strict_zero` (computation): Strict on Σ for M with H^1(G_{K,Σ}, M) = 0 gives 0.

**Acceptance.** Enlarging Σ with unramified conditions does not change the group.

### Dimensions of unramified classes

Target `SelmerIwasawaCohomology:L2/unramified-dimension-count` · lemma.

Let K/ℚ_ℓ be finite with ℓ ≠ p and V a finite-dimensional ℚ_p[G_K]-module. Then dim H¹_ur(K, V) = dim V^{G_K}, and dim H¹(K, V)/H¹_ur(K, V) = dim H²(K, V).

**Hypotheses and conventions.** ℓ ≠ p.

**Prerequisites.** `L2/unramified-condition`, `ArithmeticGaloisDuality:R02.2/hochschild-serre-spectral-sequence`.

**Proof plan.**

1. unramified-condition: H¹_ur(K, V) = V^I/(Fr − 1)V^I, so 0 → V^{G_K} → V^I → V^I → H¹_ur(K, V) → 0 gives (i).
2. I has a unique maximal subgroup I′ of pro-order prime to p with I/I′ ≅ ℤ_p (the tame quotient, LocalFieldsRamification Layer 4), so I and Gal(K^ur/K) have p-cohomological dimension 1 (ProfiniteCohomology Layer 11).
3. Hochschild–Serre (ArithmeticGaloisDuality R02.2) gives H¹(K^ur/K, H¹(I, V)) = H²(K, V) and H¹(K, V)/H¹_ur(K, V) = H¹(I, V)^{Fr=1}; the sequence 0 → H¹/H¹_ur → H¹(I, V) → H¹(I, V) → H²(K, V) → 0 gives (ii).

**Sources.** [RUBIN-ES], Chapter I, §3.1, Corollary 3.3, printed p. 5 (PDF p. 15).

**Acceptance.** Only for ℓ ≠ p; at ℓ = p the finite condition is chosen, not computed.

### Finite against unramified classes at bad primes

Target `SelmerIwasawaCohomology:L2/finite-unramified-comparison` · lemma.

Let K/ℚ_ℓ be finite with ℓ ≠ p, H¹_f(K, V) = H¹_ur(K, V), and H¹_f(K, T), H¹_f(K, W), H¹_f(K, W_M) as in lattice-passage. Put 𝒲 = W^I/(W^I)_div, a finite module. (i) H¹_f(K, W) = H¹_ur(K, W)_div. (ii) H¹_ur(K, T) ⊆ H¹_f(K, T) with finite index, and H¹_s(K, T) is torsion-free. (iii) H¹_ur(K, W)/H¹_f(K, W) ≅ 𝒲/(Fr − 1)𝒲 and H¹_f(K, T)/H¹_ur(K, T) ≅ 𝒲^{Fr=1}. (iv) If T is unramified, H¹_f = H¹_ur for T and W. Moreover H¹_f(K, W_M) is the image of H¹_f(K, T), and equals H¹_ur(K, W_M) when T is unramified. At an archimedean place H¹_f(K, W) = 0, H¹_f(K, T) = H¹(K, T) and H¹_f(K, W_M) = W^{G_K}/M W^{G_K}, all zero unless K = ℝ and p = 2.

**Hypotheses and conventions.** ℓ ≠ p for (i)–(iv); T a lattice.

**Prerequisites.** `L2/lattice-passage`, `L2/unramified-condition`, `ArithmeticGaloisDuality:R02.1/continuous-section-long-exact`, `ArithmeticGaloisDuality:R02.1/lattice-torsion-sequence`.

**Proof plan.**

1. The diagram of the rows 0 → H¹_ur(K, A) → H¹(K, A) → H¹(I, A) for A = T, V, W gives H¹_f(W) ⊆ H¹_ur(W) and H¹_ur(T) ⊆ H¹_f(T) (ArithmeticGaloisDuality R02.1's long exact sequences).
2. The image of V^I in W^I is (W^I)_div; taking I-cohomology and Frobenius invariants of 0 → T → V → W → 0 gives 0 → 𝒲^{Fr=1} → H¹(I, T)^{Fr=1} → H¹(I, V)^{Fr=1}, and with unramified-condition this gives (iii); (i), (ii) follow since 𝒲 is finite; (iv) since W^I = W is divisible when T is unramified.
3. Image of H¹_f(K, T): the diagram H¹(K, T) → H¹(K, W_M) → H²(K, T) over H¹(K, V) → H¹(K, W) → H²(K, T) (Rubin Lemma 3.8).
4. Archimedean: H¹(K, V) = 0 (Rubin Remark 3.7).

**Sources.** [RUBIN-ES], Chapter I, §3.2, Lemma 3.5, printed p. 6 (PDF p. 16). [RUBIN-ES], Chapter I, §3.2, Remark 3.7, printed p. 7 (PDF p. 17).

**Acceptance.** These are the unramified and bad-prime comparison terms the L1 stage asks for; they are planned here because the conditions are L2's.

### The H⁰ correction before the classical Selmer kernel

Target `SelmerIwasawaCohomology:L2/selmer-complex-h1` · theorem.

Assume H¹(U_v^+)→H¹(C_v) is injective. With L_v its image, the fibre LES gives 0→J→H¹(RΓ_f)→Sel_L→0, where J=coker[H⁰(C_global)⊕⊕H⁰(U_v^+) --res−i-->⊕H⁰(C_v)]. The right map forgets the uniquely determined local H¹ lifts. Hence H¹(RΓ_f)=Sel_L when this H⁰ arrow is onto; a sufficient hypothesis is H⁰(i_v^+) bijective for every v. Without H¹-injectivity, retain ker(⊕H¹(U_v^+)→⊕H¹(C_v)) in the kernel calculation.

**Hypotheses and conventions.** Use the fibre of selmer-complex; no unconditional identification of fibre H¹ with the classical kernel.

**Prerequisites.** `L2/selmer-complex`, `L2/selmer-kernel`.

**Proof plan.**

1. Write the LES segment in degrees zero and one, including both global and local-condition H⁰.
2. Project ker[H¹global⊕H¹U→H¹local] to H¹global. Injectivity of H¹i makes each local lift unique.
3. Take the displayed cokernel as J. Without the injectivity hypothesis use the full LES rather than deleting its local kernel.

**Sources.** [NEKOVAR-SC], §6.1.4, pp. 136–137.

**Discriminating tests.**

- `TauCeti.Selmer.Tests.selmer_h0_boundary` (non-example): For global complex 0, one local complex k[0] and strict condition, Sel=0 while H¹(fibre)=k.
- `TauCeti.Selmer.Tests.selmer_h1_local_kernel` (non-example): For a nonzero U^+ in degree one mapping to zero, the extra local H¹ survives; H¹i injectivity fails.
- `TauCeti.Selmer.Tests.selmer_h0_surjective` (compatibility): Bijective local H⁰ and injective local H¹ give the classical kernel.

### The p^∞-Selmer group of an elliptic curve

Target `SelmerIwasawaCohomology:L2/elliptic-selmer-instance` · comparison.

For an elliptic curve E over a number field F and a prime p, Sel_{p^∞}(E/F) is the Galois Selmer group of M = E[p^∞] with local conditions the images of E(F_v) ⊗ ℚ_p/ℤ_p under the local Kummer maps; equivalently ker(H^1(F, E[p^∞]) → ∏_v H^1(F_v, E)[p^∞]), and the direct limit of the Sel_{p^m}. It sits in 0 → E(F) ⊗ ℚ_p/ℤ_p → Sel_{p^∞}(E/F) → Ш(E/F)[p^∞] → 0.

**Hypotheses and conventions.** E/F elliptic; the finite-level Selmer groups and local Kummer maps come from Tau Ceti EllipticCurves Layer 7. Tau Ceti EllipticCurves Layer 7 supplies the general discrete Selmer structure and kernel. This node plans its compact/rational extension and the comparison with A=V/T, not a second discrete definition.

**Prerequisites.** `L2/galois-selmer-group`, `L2/corank`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`.

**Proof plan.**

1. Instantiate galois-selmer-group; identify the local conditions with the Kummer images; pass to the direct limit over m.

**Sources.** [BURUNGALE-TIAN-26], §1.0.1, the exact sequence and (1.1), p. 1 (arXiv v2).

**Acceptance.** The Bloch–Kato comparison of these conditions on V_pE belongs to L4.

### Dual Selmer structures

Target `SelmerIwasawaCohomology:L2/dual-selmer-structure` · construction.

Extend the upstream discrete structure by orthogonal local conditions on the compact/rational adapters and their dual coefficient diagrams. A Selmer structure F on T (Mazur–Rubin, Definition 2.1) is a finite set Σ(F) of places containing the archimedean places, the places above p and the primes where T is ramified, with a local condition H¹_F(K_q, T) for each q ∈ Σ(F); its Selmer module H¹_F(K, T) is the kernel of H¹(K_{Σ(F)}/K, T) → ⊕_{q∈Σ(F)} H¹(K_q, T)/H¹_F(K_q, T). The dual Selmer structure F^* on T^* = Hom(T, μ_{p^∞}) has Σ(F^*) = Σ(F) and H¹_{F^*}(K_q, T^*) = H¹_F(K_q, T)^⊥ under the local Tate pairing (Mazur–Rubin, Definition 2.5).

**Hypotheses and conventions.** T finitely generated over O with continuous G_K-action, unramified outside a finite set.

**Prerequisites.** `L1/orthogonal-complement`, `L1/lattice-pairing-compatibility`, `L2/galois-selmer-group`, `L2/selmer-data`.

**Proof plan.**

1. Import the upstream discrete Selmer carrier and its finite place set; instantiate the compact/rational adapter and its localization maps.
2. The dual conditions are orthogonal-complement for the local Tate pairings.
3. F^{**} = F from orthogonal-complement's double-orthogonal rule; strict and relaxed modifications swap under duality; the structure induced on T/IT is dual to the one induced on T^*[I] = (T/IT)^* by the image/preimage rule and lattice-pairing-compatibility.

**Sources.** [MAZUR-RUBIN-16], §2, Definition 2.1, p. 6 (arXiv v1). [MAZUR-RUBIN-16], §2, Definition 2.5, p. 7 (arXiv v1).

**API.**

- `TauCeti.Selmer.SelmerStructure` (constructor): Σ(F) with local conditions at each q ∈ Σ(F).
- `TauCeti.Selmer.SelmerStructure.selmerModule` (projection): H¹_F(K, T) as galois-selmer-group for these data.
- `TauCeti.Selmer.SelmerStructure.dual` (constructor): F^* on T^*.
- `TauCeti.Selmer.SelmerStructure.dual_dual` (characterisation): F^{**} = F.
- `TauCeti.Selmer.SelmerStructure.dual_modify` (compatibility): (F^b_a)^* = (F^*)^a_b: strict at a ↔ relaxed at a (Mazur–Rubin, Definition 2.3).
- `TauCeti.Selmer.SelmerStructure.dual_induced` (compatibility): The structure induced on T/IT is dual to the one induced on T^*[I].
- `TauCeti.Selmer.SelmerStructure.rubin_dual` (example): Rubin's S^Σ(K, W_M) and S_Σ(K, W^*_M) are the Selmer modules of dual structures (finite-condition-lattice-duality).

**Discriminating tests.**

- `relaxed_dual_strict` (computation): The structure relaxed at every q ∈ Σ has dual strict at every q ∈ Σ; the dual Selmer module is Ш¹_Σ(K, T^*) (ArithmeticGaloisDuality R02.4/restricted-product-cohomology).
- `finite_selfdual` (computation): For T unramified at q ∤ p, the finite condition at q is its own dual.
- `archimedean` (computation): At a real place H¹(ℝ, W_M) = 0 for p odd, so every archimedean condition is 0 = its dual; for p = 2 it can be nonzero (Rubin, Remark 3.7).
- `enlarged_sigma` (non-example): Adding a place q ∉ Σ(F) to Σ(F^*) with the relaxed condition does not give the dual structure: the dual keeps the finite condition at q.

**Acceptance.** Σ(F^*) = Σ(F); the dual conditions are orthogonal complements for the named local Tate pairing.

### Local duality for the finite condition on V

Target `SelmerIwasawaCohomology:L2/finite-condition-rational-duality` · theorem.

If K is archimedean, or nonarchimedean of residue characteristic ℓ ≠ p, then H¹_f(K, V) and H¹_f(K, V^*) are exact orthogonal complements under the local Tate pairing.

**Hypotheses and conventions.** ℓ ≠ p or K archimedean.

**Prerequisites.** `L2/unramified-dimension-count`, `L1/orthogonal-complement`, `ArithmeticGaloisDuality:R02.4`.

**Proof plan.**

1. Archimedean K: all the groups vanish.
2. The pairing of two unramified classes factors through H²(K^ur/K, Φ(1)) = 0, as Gal(K^ur/K) has cohomological dimension 1.
3. dim H¹_f(K, V^*) = dim H⁰(K, V^*) = dim H²(K, V) = dim H¹(K, V) − dim H¹_f(K, V), by unramified-dimension-count, local duality for V (ArithmeticGaloisDuality R02.4) and unramified-dimension-count again; conclude with orthogonal-complement's dimension count.

**Sources.** [RUBIN-ES], Chapter I, §4, Proposition 4.2, printed p. 9 (PDF p. 19).

**Acceptance.** The dimension count, not only orthogonality, is proved.

### Selmer groups of T and W as limits

Target `SelmerIwasawaCohomology:L2/selmer-limits` · lemma.

For a finite set Σ of places: (i) S^Σ(K, T) = lim_M S^Σ(K, W_M) and S_Σ(K, T) = lim_M S_Σ(K, W_M); (ii) S^Σ(K, W) = colim_M S^Σ(K, W_M) and S_Σ(K, W) = colim_M S_Σ(K, W_M); the finite and singular parts of the local cohomology commute with these limits. The map ι_M : H¹(K, W_M) → H¹(K, W) induces a surjection S^Σ(K, W_M) ↠ S^Σ(K, W)[M], which can fail for S_Σ. S^Σ(K, W_M) is finite, S^Σ(K, T) is finitely generated over O, and the Pontryagin dual of S^Σ(K, W) is finitely generated over O.

**Hypotheses and conventions.** Σ finite; T a lattice unramified outside a finite set.

**Prerequisites.** `L2/galois-selmer-group`, `L2/lattice-passage`, `L2/finite-unramified-comparison`, `ArithmeticGaloisDuality:R02.1/tate-inverse-limit`, `ArithmeticGaloisDuality:R02.3/h1-finite`, `mathlib:PontryaginDual`.

**Proof plan.**

1. H¹(K, W) = colim_M H¹(K, W_M), and H¹(K, T) = lim_M H¹(K, W_M) by Tate's inverse-limit theorem (ArithmeticGaloisDuality R02.1/tate-inverse-limit; the H⁰ are finite).
2. The local groups at level M are finite, so the finite parts and singular quotients commute with the limits (Rubin, Corollary 3.10, using finite-unramified-comparison's description of H¹_f(K, W_M)).
3. ι_M(H¹(K, W_M)) = H¹(K, W)[M], and ι_M^{−1}(S^Σ(K, W)[M]) = S^Σ(K, W_M) by definition; for S_Σ the strict condition at Σ is not preserved under ι_M^{−1} (Rubin, Remark 5.5).
4. Enlarging Σ, S^Σ(K, A) = H¹(K_Σ/K, A) (galois-selmer-group), which is finite for A = W_M (ArithmeticGaloisDuality R02.3/h1-finite); the other two statements follow by the limits.

**Sources.** [RUBIN-ES], Chapter I, §5, Proposition 5.6, printed p. 12 (PDF p. 22). [RUBIN-ES], Chapter I, §5, Remark 5.5, printed p. 12 (PDF p. 22).

**Acceptance.** Both the relaxed and the strict Selmer groups are covered, with the failure of Lemma 5.4 for the strict ones recorded.

### Primitive, imprimitive and strict condition-change triangles

Target `SelmerIwasawaCohomology:L2/condition-change-triangle` · theorem.

For local-condition maps U^+→U′^+ commuting with their maps to C_v, let D_v=Cone(U_v^+→U′_v^+). There is a triangle RΓ_f(U)→RΓ_f(U′)→⊕D_v. At H¹-submodule level L⊆L′ it gives 0→Sel_L→Sel_L′→⊕_v L′_v/L_v, exact at the first three terms, with the remaining cokernel governed by the fibre H² map and H⁰ corrections. Relaxation at Σ replaces U_v^+ by C_v and D_v by U_v^−; strict modification uses zero. Surjectivity of the displayed localization to local quotients is a separate theorem, never part of the definition of imprimitive Selmer.

**Hypotheses and conventions.** Finite changed set; maps/homotopies on actual complexes. Kernel-level conclusion uses selmer-complex-h1 or its correction.

**Prerequisites.** `L2/selmer-complex`, `L2/selmer-complex-h1`, `L2/change-of-conditions`.

**Proof plan.**

1. Use cone functoriality and the octahedral axiom on res−i.
2. Write the LES of the triangle and compare it with the kernel-level localization map.
3. Record precisely which cokernel is killed by global surjectivity or dual Selmer vanishing in later applications.

**Sources.** [NEKOVAR-SC], §6.1, pp. 135–137; §7.8, pp. 187–192.

**Discriminating tests.**

- `TauCeti.Selmer.Tests.change_identical` (degenerate): Identical conditions have acyclic difference and equivalent fibres.
- `TauCeti.Selmer.Tests.change_not_surjective` (non-example): With global module 0 and one nonzero local quotient, Sel_L′→L′/L is not onto.
- `TauCeti.Selmer.Tests.change_one_prime` (compatibility): Relaxing one place retains exactly its U_v^−, including its degree-zero terms.

### Selmer vanishing descends under injective restriction

Target `SelmerIwasawaCohomology:L2/restriction-injective-descent` · theorem.

For a finite extension F′/F and a Selmer structure stable under restriction at every place, restriction maps Sel_F(M) to Sel_F′(M). If p∤[F′:F] for a p-primary O-module M, cor∘res=[F′:F] makes it injective. Alternatively, if M^(G_L)=0 for the Galois closure L/F of F′, inflation–restriction gives injectivity to L, hence to F′. Therefore Sel_F′(M)=0 implies Sel_F(M)=0 under either hypothesis. For M=ad⁰(r)⊗E/O, vanishing of (ad⁰ r̄)^(G_L) implies vanishing of M^(G_L) by taking the lowest nonzero λ-primary torsion level.

**Hypotheses and conventions.** The local conditions must be preserved by restriction. The prime-to-p or invariant-vanishing condition is essential; arbitrary finite extensions do not suffice.

**Prerequisites.** `L2/selmer-functoriality`, `ArithmeticGaloisDuality:R02.2/finite-index-descent`, `ArithmeticGaloisDuality:R02.2/compact-five-term`.

**Proof plan.**

1. Build the semilocal restriction squares and apply the Selmer functoriality API.
2. Prove injectivity using restriction/corestriction or the supplier five-term sequence over the Galois closure.
3. For discrete lattice quotients, every nonzero invariant has a nonzero λ-torsion invariant after multiplying by a power of λ; conclude the residual criterion.

**Sources.** [CG-APPENDIX-20], Remark after Theorem 1.2, preprint p. 3 (published Appendix A, p. 882).

**Discriminating tests.**

- `TauCeti.Selmer.Tests.descent_degree_one` (degenerate): The identity extension preserves the Selmer group and restriction is injective.
- `TauCeti.Selmer.Tests.descent_p_quotient` (non-example): A nonzero Hom(Gal(L/F),ℤ/p) class restricts to zero when Gal(L/F)=ℤ/p and the coefficient action is trivial.
- `TauCeti.Selmer.Tests.descent_residual` (compatibility): For p-degree extensions, the residual-invariant criterion may still give injectivity.

### Local duality for the finite conditions on T and W_M

Target `SelmerIwasawaCohomology:L2/finite-condition-lattice-duality` · theorem.

Suppose K is archimedean, or nonarchimedean of residue characteristic ℓ ≠ p, or nonarchimedean with ℓ = p and H¹_f(K, V), H¹_f(K, V^*) chosen to be orthogonal complements. Then H¹_f(K, T) and H¹_f(K, W^*) are exact orthogonal complements, and so are H¹_f(K, W_M) and H¹_f(K, W^*_M) for every nonzero M ∈ O. In particular, for T unramified and ℓ ≠ p, the unramified conditions on T and T^* are exact annihilators (Mazur–Rubin, Proposition 1.7(i)).

**Hypotheses and conventions.** The case ℓ = p needs the chosen orthogonal pair H¹_f(K, V), H¹_f(K, V^*).

**Prerequisites.** `L2/finite-condition-rational-duality`, `L1/orthogonal-complement`, `L1/lattice-pairing-compatibility`, `L2/finite-unramified-comparison`, `L2/lattice-passage`, `ArithmeticGaloisDuality:R02.4/unramified-exact-annihilators`.

**Proof plan.**

1. lattice-pairing-compatibility: ⟨φ(c), d⟩ = ⟨c, φ^*(d)⟩.
2. By finite-condition-rational-duality (or the hypothesis at ℓ = p), H¹_f(K, V)^⊥ = H¹_f(K, V^*). Since H¹_f(K, W^*) = φ^*(H¹_f(K, V^*)) and H¹_f(K, T) = φ^{−1}(H¹_f(K, V)) (lattice-passage), orthogonal-complement's image/preimage rule gives H¹_f(K, W^*)^⊥ = H¹_f(K, T).
3. For W_M, use T ↠ W_M and W^*_M ↪ W^* in the same way, with H¹_f(K, W_M) the image of H¹_f(K, T) (finite-unramified-comparison).
4. Unramified T with ℓ ≠ p: finite-unramified-comparison (iv) identifies the finite and unramified conditions; at finite level this agrees with ArithmeticGaloisDuality's unramified-exact-annihilators.

**Sources.** [RUBIN-ES], Chapter I, §4, Proposition 4.3, printed p. 9 (PDF p. 19). [MAZUR-RUBIN-16], §1, Proposition 1.7, p. 5 (arXiv v1).

**Acceptance.** At ℓ = p nothing is claimed without the chosen orthogonal pair; that Bloch–Kato's subspaces for potentially semistable V are such a pair (Rubin, Remark 7.1) belongs to L4.

### Poitou–Tate for Selmer groups

Target `SelmerIwasawaCohomology:L2/selmer-structure-poitou-tate` · theorem.

Let K be a number field, T a p-adic representation of G_K ramified at finitely many primes, with H¹_f(K_v, V) and H¹_f(K_v, V^*) orthogonal complements at the places above p; let M ∈ O be nonzero and Σ_0 ⊆ Σ finite sets of places. (i) 0 → S^{Σ_0}(K, W_M) → S^Σ(K, W_M) → ⊕_{v∈Σ−Σ_0} H¹_s(K_v, W_M) and 0 → S_Σ(K, W^*_M) → S_{Σ_0}(K, W^*_M) → ⊕_{v∈Σ−Σ_0} H¹_f(K_v, W^*_M) are exact. (ii) The images loc^s(S^Σ(K, W_M)) and loc^f(S_{Σ_0}(K, W^*_M)) are exact orthogonal complements under Σ_{v∈Σ−Σ_0}⟨ , ⟩_v. (iii) S_{Σ_0}(K, W^*_M)/S_Σ(K, W^*_M) ≅ Hom_O(coker(loc^s_{Σ,Σ_0}), O/MO); in particular |S_{Σ_0}(K, W^*_M)| = |coker(loc^s_{Σ,Σ_0})| when S_Σ(K, W^*_M) = 0.

**Hypotheses and conventions.** Orthogonal finite conditions at the places above p; Σ_0 ⊆ Σ finite.

**Prerequisites.** `L2/finite-condition-lattice-duality`, `L2/dual-selmer-structure`, `L2/galois-selmer-group`, `L2/change-of-conditions`, `L1/orthogonal-complement`, `ArithmeticGaloisDuality:R02.4/poitou-tate`, `ArithmeticGaloisDuality:R02.4/restricted-product-cohomology`.

**Proof plan.**

1. (i) is immediate from the definitions (change-of-conditions).
2. For Σ containing the archimedean places, the places above p and the ramified primes, S^Σ(K, A) = H¹(K_Σ/K, A) (galois-selmer-group). The segment H¹(G_Σ, W_M) → P¹_Σ(K, W_M) → H¹(G_Σ, W^*_M)^∨ of Poitou–Tate (ArithmeticGaloisDuality R02.4/poitou-tate), finite-condition-lattice-duality (H¹_s(W_M) is dual to H¹_f(W^*_M), by orthogonal-complement's quotient pairing) and the dual of the tautological sequence for S_Σ(K, W^*_M) splice to the exact sequence 0 → S^{Σ_0} → S^Σ → ⊕ H¹_s → S_{Σ_0}(W^*_M)^∨ → S_Σ(W^*_M)^∨ → 0, whose exactness in the centre is (ii).
3. General Σ: take Σ′ ⊇ Σ large; the snake lemma on the diagram for Σ_0 ⊆ Σ′ and Σ ⊆ Σ′ gives the sequence for Σ_0 ⊆ Σ (the map there is (loc^f_{Σ,Σ_0})^∨, SelmerIwasawaCohomology/E3).
4. (iii) restates (ii).

**Sources.** [RUBIN-ES], Chapter I, §7, Theorem 7.3, printed p. 17 (PDF p. 27).

**Acceptance.** Uses the global duality of ArithmeticGaloisDuality R02.4; summing local pairings alone does not prove (ii). The real places enter through ArithmeticGaloisDuality's modified groups, which agree with ordinary cohomology in degree 1.

### Poitou–Tate for the Selmer group of W^*

Target `SelmerIwasawaCohomology:L2/selmer-poitou-tate-limit` · theorem.

With Σ_p the places above p: S(K, W^*)/S_{Σ_p}(K, W^*) ≅ Hom_O(coker(loc^s_{Σ_p}), D), where loc^s_{Σ_p} : S^{Σ_p}(K, T) → ∏_{v|p} H¹_s(K_v, T).

**Hypotheses and conventions.** As in selmer-structure-poitou-tate.

**Prerequisites.** `L2/selmer-structure-poitou-tate`, `L2/selmer-limits`, `ArithmeticGaloisDuality:R02.1/lim-one-six-term`, `ArithmeticGaloisDuality:R02.1/mittag-leffler-lim-one`, `mathlib:PontryaginDual`.

**Proof plan.**

1. selmer-structure-poitou-tate (iii) with Σ = Σ_p and Σ_0 = ∅ at each level M; take the direct limit over M.
2. selmer-limits identifies lim_M S(K, W^*_M)/S_{Σ_p}(K, W^*_M) with S(K, W^*)/S_{Σ_p}(K, W^*), lim_M S^{Σ_p}(K, W_M) with S^{Σ_p}(K, T), and the singular quotients.
3. All groups at level M are finite: Hom_O(−, O/MO) turns the inverse limit of the cokernels into the direct limit of their duals (Pontryagin duality), and the inverse limit of the cokernels is the cokernel of the limit, as lim¹ of finite groups vanishes (ArithmeticGaloisDuality R02.1).

**Sources.** [RUBIN-ES], Chapter I, §7, Corollary 7.5, printed p. 19 (PDF p. 29).

**Acceptance.** The lim¹ bookkeeping is explicit.

## Layer L3: Iwasawa cohomology and control

The fundamental object is the corestriction Iwasawa complex. Shapiro identifies its completed group-ring action; derived specialization gives control with exact errors. Local computations and global structure criteria then support the determinant and characteristic-ideal comparisons.

### Iwasawa cohomology

Target `SelmerIwasawaCohomology:L3/iwasawa-cohomology` · construction.

Let R be a complete local noetherian ring with finite residue field of characteristic p, G a profinite group, H a closed normal subgroup, Γ = G/H, 𝒰 the open subgroups U ⊇ H, and M an ind-admissible R[G]-module; M_U = M ⊗_R R[G/U]. RΓ_Iw(G, H; M) is the complex lim_U C^•_cont(G, M_U) of R̄-modules, R̄ = R⟦Γ⟧, and H^i_Iw(G, H; M) its cohomology. There is a spectral sequence E₂^{ij} = lim^{(i)}_{U,cor} H^j_cont(U, M) ⇒ H^{i+j}_Iw(G, H; M); if M is of finite type over R and G satisfies (F) (finite cohomology of finite modules on open subgroups), then H^j_Iw(G, H; M) = lim_{U,cor} H^j_cont(U, M). If moreover 𝒰 has a cofinal chain and p^∞ divides the pro-finite order of Γ, then H⁰_Iw(G, H; M) = 0.

**Hypotheses and conventions.** R complete local noetherian; M of finite type over R for the corestriction-limit description; condition (F), which G_{K,S} and local Galois groups satisfy (ArithmeticGaloisDuality R02.4/global-finiteness).

**Prerequisites.** `L2/galois-selmer-group`, `ArithmeticGaloisDuality:R02.1/mittag-leffler-lim-one`, `ArithmeticGaloisDuality:R02.1/tate-inverse-limit`, `ArithmeticGaloisDuality:R02.4/global-finiteness`.

**Proof plan.**

1. The transition maps C^•_cont(G, M_V) → C^•_cont(G, M_U) are surjective, so the projective system is weakly flabby and the first hypercohomology spectral sequence for lim collapses (Jannsen); the second is the stated one, with corestriction transitions by Shapiro's lemma at finite level (ProfiniteCohomology Layer 7).
2. For finite R-length coefficient quotients, (F) gives finite cohomology groups and vanishing higher derived limits. For finite-type complete R-coefficients the cohomology groups are compact, not necessarily finite-length: use exactness of inverse limits of compatible compact groups and the coefficient-limit spectral sequence. Do not assert a Mittag–Leffler condition for an arbitrary corestriction tower of lattices. This compact-limit interface is requested from ArithmeticGaloisDuality R02.1.
3. H⁰: M^{U_n} stabilises to N, and the corestrictions N → N are multiplication by [U_n : U_{n′}], whose p-part tends to infinity; so the limit vanishes (Rubin, Lemma B.3.2).

**Sources.** [NEKOVAR-SC], Chapter 8, 8.3.4–8.3.5, p. 203 (Numdam PDF p. 212). [RUBIN-ES], Appendix B, §3, Lemmas 3.1–3.2, printed p. 154 (PDF p. 164).

**API.**

- `TauCeti.Selmer.iwasawaComplex` (constructor): RΓ_Iw(G, H; M) = lim_U C^•_cont(G, M_U).
- `TauCeti.Selmer.iwasawaCohomology` (constructor): H^i_Iw(G, H; M), an R⟦Γ⟧-module.
- `TauCeti.Selmer.iwasawaCohomology_equiv_limit` (equivalence): Under (F): H^j_Iw(G, H; M) ≅ lim_{U,cor} H^j_cont(U, M) (Nekovář 8.3.5(ii)).
- `TauCeti.Selmer.iwasawaCohomology_zero_eq_bot` (simp): H⁰_Iw(G, H; M) = 0 when p^∞ divides #Γ (8.3.5(iii); Rubin B.3.2).
- `TauCeti.Selmer.iwasawaCohomology_one_equiv` (equivalence): lim_F H¹(F, T) = lim_n H¹(F_n, T/p^nT) along a tower (Rubin, Lemma B.3.1).
- `TauCeti.Selmer.iwasawaCohomology_map` (functoriality): Natural in M and exact on distinguished triangles.

**Discriminating tests.**

- `finite_gamma` (computation): Γ = 1: H^i_Iw(G, G; M) = H^i_cont(G, M).
- `h0_vanishes` (computation): Cyclotomic ℤ_p-extension, M=ℤ_p with trivial action: every finite-level H⁰ is ℤ_p, while corestriction multiplies by p along consecutive levels and H⁰_Iw=0. Replacing these transitions by restrictions gives ℤ_p instead.
- `kato_convention` (compatibility): Burungale–Tian §2.2.3: Kato's H^q(T) = lim_n H^q(ℤ[ζ_{p^n}, 1/p], T) with corestrictions is this construction for G = G_{ℚ,S}, S = {p, ∞} ∪ {bad primes}, once Kato's étale convention (j_*) is matched with Galois cohomology of G_{ℚ,S}.
- `restriction_limit_nonexample` (non-example): With restriction instead of corestriction transitions, lim H⁰(F_n, ℚ_p/ℤ_p) = ℚ_p/ℤ_p ≠ 0: the transition maps are part of the definition.

**Acceptance.** H⁰_Iw = 0 is a consequence of p^∞ | #Γ, not an assumption; torsion of H²_Iw is not asserted here (see iwasawa-torsion-criterion).

### Checkable hypotheses for ordinary Selmer structure

Target `SelmerIwasawaCohomology:L3/greenberg-structure-hypotheses` · definition.

For Λ=O[[T]], D=T₀⊗_ΛΛ^∨ with T₀ finite free and D* = Hom(D,μ_(p∞)), record RFX (T₀ reflexive), LOC2_v (D*/H⁰(F_v,D*) reflexive), LOC1_η (H⁰(F_η,D*)=0 at one finite η), LEO (ker[H²(global,D)→⊕H²(local,D)] Λ-cotorsion), CRK (corank H¹global=corank Sel+corank Q), and almost divisibility of the chosen local conditions (multiplication by each height-one parameter is onto except for finitely many height-one primes). Record additionally Greenberg’s alternative (a), (b) or (c): residual exclusion of μ_p as subquotient; cofree D with exclusion as quotient; or a finite η with dual H⁰ zero and Q_η divisible/coreflexive as required by the theorem. These are explicit propositions on modules and maps, not inferred from residual irreducibility alone.

**Hypotheses and conventions.** Finite S; p odd for the applications here; finitely generated compact duals. In dimension two, pseudo-null finitely generated modules are finite O-torsion. Higher-dimensional pseudo-null is not synonymous with finite. The residual module in alternatives (a),(b) is D[𝔪_Λ] as a G_(F,S)-module, and μ_p has its mod-p cyclotomic action. In alternative (c), η is finite and H⁰(F_η,D*)=0; the localization-surjectivity theorem requires divisible Q_η, while the no-pseudo-null theorem requires coreflexive Q_η.

**Prerequisites.** `L2/pontryagin-dual`, `L2/corank`, `PadicMeasuresIwasawaAlgebras:L4`.

**Proof plan.**

1. Define every hypothesis using the actual localization maps, reflexive duals and height-one localizations.
2. Translate almost divisibility of a discrete module into absence of nonzero pseudo-null submodules of its compact dual.
3. Provide proof fields only for the hypotheses a concrete representation establishes; keep LEO and CRK separate.

**Sources.** [GREENBERG-STRUCTURE], §2, pp. 5–11; §4.1, pp. 19–20.

**API.**

- `TauCeti.Selmer.GreenbergStructureHypotheses` (constructor): The listed module and localization predicates, with the chosen alternative.
- `TauCeti.Selmer.almostDivisible_dual` (characterisation): Equivalent to the compact dual having no nonzero pseudo-null submodule.
- `TauCeti.Selmer.greenbergHypotheses_imprimitive` (compatibility): Tracks exactly which LOC1 and local divisibility hypotheses are supplied by relaxing a finite place.

**Discriminating tests.**

- `TauCeti.Selmer.Tests.greenberg_zero` (degenerate): The zero representation satisfies the zero-rank, local and localization predicates.
- `TauCeti.Selmer.Tests.greenberg_residual_not_leo` (non-example): A residual irreducibility proof supplies the residual exclusion for rank at least two, but supplies neither LEO nor CRK.
- `TauCeti.Selmer.Tests.greenberg_dimension` (non-example): Over O[[T₁,T₂]], Λ/(T₁,T₂) is pseudo-null and can be infinite; the finite equivalence must be restricted to dimension two.

### Shapiro's lemma for Iwasawa cohomology

Target `SelmerIwasawaCohomology:L3/iwasawa-shapiro` · theorem.

With 𝓕_Γ(M) = lim_U M_U: for M of finite type over R there are canonical R̄[G]-isomorphisms 𝓕_Γ(M) ≅ (M ⊗_R R̄) ⟨−1⟩ and 𝓕_Γ(M)^ι ≅ (M ⊗_R R̄^ι)⟨−1⟩ ≅ (M ⊗_R R̄)⟨1⟩, where ⟨n⟩ twists the G-action by χ_Γ^n, χ_Γ : G → Γ ⊂ R̄^× the tautological character, and ι is the involution γ ↦ γ^{−1}; 𝓕_Γ(M) is of finite type over R̄. The canonical morphism C^•_cont(G, 𝓕_Γ(M)) → lim_U C^•_cont(G, M_U) is an isomorphism, so RΓ_cont(G, 𝓕_Γ(M)) ≅ RΓ_Iw(G, H; M).

**Hypotheses and conventions.** M ind-admissible of finite type over R; Γ abelian, Γ ≅ Γ₀ × Δ with Γ₀ ≅ ℤ_p^r and Δ finite.

**Prerequisites.** `L3/iwasawa-cohomology`, `ArithmeticGaloisDuality:R02.1/carrier-comparison`, `PadicMeasuresIwasawaAlgebras:L1`.

**Proof plan.**

1. N ⊗_R R̄ = N ⊗_R lim R_U ≅ lim (N ⊗_R R_U) for N of finite type; on 𝓕_Γ(M), x ∈ R̄ acts by id ⊗ ι(x) and g ∈ G by g ⊗ χ_Γ(g), which gives the two isomorphisms (Nekovář 8.4.4.1).
2. The two projective-limit topologies on 𝓕_Γ(M), the m̄-adic and the (U, n)-adic, coincide, because {m̄^N} and {J_U + m^n R̄} are cofinal (J_U = ker(R̄ → R[G/U])); so continuous cochains commute with the limit (8.4.4.2).

**Sources.** [NEKOVAR-SC], Chapter 8, Proposition 8.4.4.1, p. 206 (Numdam PDF p. 215). [NEKOVAR-SC], Chapter 8, Proposition 8.4.4.2, p. 207 (Numdam PDF p. 216).

**Acceptance.** The inverse action is explicit: with the tautological character the Galois action on T ⊗ Λ is g ⊗ χ_Γ(g)^{−1}, as the stage and Burungale–Tian's items require; the opposite convention is 𝓕_Γ(M)^ι.

### Universal norms are unramified away from p

Target `SelmerIwasawaCohomology:L3/universal-norms-unramified` · theorem.

Let T be finitely generated over ℤ_p. (i) If K/ℚ_ℓ is finite with ℓ ≠ p and K_∞ its unramified ℤ_p-extension, every norm-compatible {c_F} ∈ lim H¹(F, T) has c_F ∈ H¹_ur(F, T). (ii) If K is a number field, K_∞/K abelian with Gal(K_∞/K) ≅ ℤ_p^d, and λ ∤ p a prime of F whose decomposition group in Gal(K_∞/K) is infinite, then (c_F)_λ ∈ H¹_ur(F_λ, T). (iii) If S contains the primes where T is ramified, those above p, those with finite decomposition group in Gal(K_∞/K) and the infinite places, then lim_F H¹(F, T) = lim_F H¹(K_S/F, T).

**Hypotheses and conventions.** ℓ ≠ p in (i); d ≥ 1.

**Prerequisites.** `L3/iwasawa-cohomology`, `L2/unramified-condition`, `ArithmeticGaloisDuality:R02.3/restricted-ramification-group`.

**Proof plan.**

1. (i) 0 → H¹_ur(F, T) → H¹(F, T) → H¹(I, T)^{G_F}, with H¹(I, T) finitely generated over ℤ_p (Rubin, Proposition B.2.7(iii)); the limit of the last terms vanishes by iwasawa-cohomology's H⁰ statement (Lemma B.3.2).
2. (ii) Choose F′ ⊆ F_∞ with Gal(F_∞/F′) ≅ ℤ_p undecomposed at λ̄ and apply (i); corestrict.
3. (iii) By (ii) the restriction of c_F to each inertia group outside S vanishes, so its cocycles factor through Gal(K_S/F).

**Sources.** [RUBIN-ES], Appendix B, §3, Proposition 3.3, printed p. 154 (PDF p. 164).

**Acceptance.** Only for primes not above p; the places above p and those that split finitely are kept in S.

### Semilocal cohomology and descent of local classes

Target `SelmerIwasawaCohomology:L3/semilocal-cohomology` · theorem.

Let K be a number field, q a prime of K, F/K finite and S the primes of F above q, with decomposition groups D_Q = g_Q^{−1} D g_Q. For a discrete G_K-module T and a D-submodule T′, H^i(F, Ind_D^{G_K}(T′)) ≅ ⊕_{Q∈S} H^i(F_Q, T′_Q); in particular H^i(G_F, Ind_D(T)) ≅ ⊕_Q H^i(F_Q, T) and H^i(G_F, Ind_D(T^I)) ≅ ⊕_Q H^i(F_Q, T^{I_Q}). For F/K finite Galois and T finitely generated over ℤ_p, restriction gives H¹(K_q, T) ≅ (⊕_{Q|q} H¹(F_Q, T))^{Gal(F/K)} if [F : K] is prime to p, and H¹(K_q, V) ≅ (⊕_{Q|q} H¹(F_Q, V))^{Gal(F/K)} always.

**Hypotheses and conventions.** T discrete for the induction statements; finitely generated over ℤ_p for the descent.

**Prerequisites.** `L3/iwasawa-cohomology`, `ArithmeticGaloisDuality:R02.2/finite-index-descent`.

**Proof plan.**

1. D\G_K/G_F ↔ S by D g G_F ↦ g^{−1}Q₀; the double-coset form of Shapiro's lemma (Rubin, Proposition B.4.2; ProfiniteCohomology Layers 6–7) gives the decomposition.
2. Descent: ArithmeticGaloisDuality R02.2/finite-index-descent applied to the semilocal module; for V, finite groups have no rational cohomology.

**Sources.** [RUBIN-ES], Appendix B, §5, Proposition 5.1, printed p. 157 (PDF p. 167).

**Acceptance.** This is how infinite-level local conditions are defined: as limits of semilocal conditions, not as conditions over a 'completion' of K_∞.

### Descent and control for Iwasawa cohomology

Target `SelmerIwasawaCohomology:L3/iwasawa-descent` · theorem.

(i) For M supported at the maximal ideal there is the Hochschild–Serre spectral sequence E₂^{ij} = H^i_cont(Γ, H^j_cont(H, M)) ⇒ H^{i+j}_cont(G, M). (ii) If Γ ≅ ℤ_p^r, then RΓ_Iw(G, H; T) ⊗^L_{R̄} R ≅ RΓ_cont(G, T), with a homological spectral sequence E²_{ij} = H_{i,cont}(Γ, H^{−j}_Iw(G, H; T)) ⇒ H^{−i−j}_cont(G, T), each term of finite type over R when G satisfies (F). If Γ ≅ ℤ_p it degenerates into 0 → H^j_Iw(G, H; T)_Γ → H^j_cont(G, T) → H^{j+1}_Iw(G, H; T)^Γ → 0; and if cd_p(G) = e < ∞ and τ_{≤n}T ≅ T, then H^{e+n}_Iw(G, H; T)_Γ ≅ H^{e+n}_cont(G, T). (iii) For a closed Γ′ ≅ ℤ_p^{r′} in Γ with preimage H′, RΓ_Iw(G, H; T) ⊗^L R⟦Γ/Γ′⟧ ≅ RΓ_Iw(G, H′; T), with the analogous spectral sequence and, for Γ′ ≅ ℤ_p, the analogous short exact sequences.

**Hypotheses and conventions.** Γ ≅ ℤ_p^r (or Γ′ ≅ ℤ_p^{r′}); T a bounded-below complex of finite type over R.

**Prerequisites.** `L3/iwasawa-shapiro`, `ArithmeticGaloisDuality:R02.2/hochschild-serre-spectral-sequence`, `ArithmeticGaloisDuality:R02.2/first-quadrant-spectral-sequence`, `PadicMeasuresIwasawaAlgebras:L1`.

**Proof plan.**

1. (i) is ArithmeticGaloisDuality's Hochschild–Serre spectral sequence (R02.2).
2. (ii) γ₁ − 1, …, γ_r − 1 is a regular sequence in R̄ with R̄/x ≅ R; tensoring the exact sequences 0 → R̄_{i−1} → R̄_{i−1} → R̄_i → 0 with T and applying iwasawa-shapiro gives the isomorphism; the Koszul filtration gives the spectral sequence (Nekovář 8.4.8.1).
3. For r = 1 the spectral sequence has two columns (8.4.8.2); (iii) replaces x by the generators of Γ′ (8.4.8.3–8.4.8.4).

**Sources.** [NEKOVAR-SC], Chapter 8, Proposition 8.4.8.1, p. 214 (Numdam PDF p. 223). [NEKOVAR-SC], Chapter 8, Corollary 8.4.8.2 and Proposition 8.4.8.3, p. 215 (Numdam PDF p. 224).

**Acceptance.** The control statements carry their error terms (coinvariants and invariants); no isomorphism H^j_Iw(G, H; T)_Γ ≅ H^j(G, T) is claimed in general.

### Iwasawa Selmer complex and completed action

Target `SelmerIwasawaCohomology:L3/infinite-selmer-complex` · construction.

For Γ=Gal(F∞/F)≅ℤ_p^d, Λ=O[[Γ]], define the infinite compact Selmer complex as Rlim_n RΓ_f(F_n,T;U_n), with corestriction, and the discrete complex as colim_n RΓ_f(F_n,A;U_n), with restriction. Choose actual local maps, transition maps and their coherent comparison homotopies. Shapiro identifies the compact complex with the finite-S fibre for T_Λ=Λ⊗̂_O T on which g acts by [g]^−1⊗g. At a place v use the induced semilocal Λ-module from its decomposition subgroup Γ_v. The completed action is continuous, and the compact/discrete actions are paired contragrediently. F∞,v is never treated as a locally compact local field.

**Hypotheses and conventions.** Finite S containing p, infinite places and coefficient ramification; finitely generated compatible local coefficient complexes. Nekovář condition (U): added non-p places are unramified in the tower, or their ramification errors are retained.

**Prerequisites.** `L2/selmer-complex`, `L3/iwasawa-shapiro`, `L3/semilocal-cohomology`, `PadicMeasuresIwasawaAlgebras:L1`.

**Proof plan.**

1. Import completed induction, infinite Shapiro and derived coefficient limits from AGD and the completed group ring from PMIA.
2. Form the inverse-limit diagram of L2 fibres. Identify global and semilocal vertices by Shapiro, including the inverse Γ-action.
3. Transport the compatible local maps and homotopies; take the fibre and its continuous Λ-action. For the discrete tower use filtered restriction colimits and its Pontryagin dual.

**Sources.** [NEKOVAR-SC], §8.5.6, p. 220; §§8.6 and 8.8, pp. 221–237.

**API.**

- `TauCeti.Selmer.iwasawaSelmerComplex` (constructor): The corestriction derived inverse limit of the finite-level fibres.
- `TauCeti.Selmer.discreteInfiniteSelmerComplex` (constructor): The restriction colimit of the discrete finite-level fibres.
- `TauCeti.Selmer.iwasawaSelmerComplex_shapiro` (equivalence): Equivalent to the induced-coefficient finite-S fibre.
- `TauCeti.Selmer.iwasawaSelmerComplex_action` (instance): Continuous Λ-action with inverse action on the induced factor.
- `TauCeti.Selmer.iwasawaSelmerComplex_semilocal` (compatibility): Induction from Γ_v represents the sum over all places above v.

**Discriminating tests.**

- `TauCeti.Selmer.Tests.iw_fibre_degree_zero` (degenerate): A constant tower of relaxed conditions reduces to global Iwasawa cohomology.
- `TauCeti.Selmer.Tests.iw_inverse_action` (non-example): Under a generator γ, evaluation on an induced function translates by γ^−1; direct γ-translation gives the wrong Shapiro map.
- `TauCeti.Selmer.Tests.iw_semilocal_split` (non-example): If Γ_v=1, the finite-level local sum has [Γ:Γ_n] summands; one local factor is incorrect.

### Finite generation, amplitude and local Euler ranks

Target `SelmerIwasawaCohomology:L3/iwasawa-finiteness-euler` · theorem.

For the cyclotomic ℤ_p-extension, p odd, finite S and finite free T, global Iwasawa cohomology is finitely generated over Λ and concentrated in degrees one and two under the standard global H⁰-vanishing hypothesis; with real p=2 terms state the corrected amplitude. Its rank difference is rank_Λ H¹_Iw−rank_Λ H²_Iw=Σ_(v real) rank_O T^(c_v=−1)+Σ_(v complex) rank_O T. At a p-adic place K, rank_Λ H¹_Iw(K,T)=[K:ℚ_p]rank_O T and H²_Iw(K,T) is torsion. Global H² torsion is an additional weak-Leopoldt assertion. For arbitrary ℤ_p^d extensions the conclusion is finite generation/perfectness only with the supplier finite-resolution and local conditions, not a universal cyclotomic rank formula.

**Hypotheses and conventions.** Canonical compact cochains; cyclotomic tower for the displayed rank formulas. At p=2 use AGD modified compact support or invert 2.

**Prerequisites.** `L3/iwasawa-shapiro`, `ArithmeticGaloisDuality:R02.4/global-finiteness`, `ArithmeticGaloisDuality:D7/compact-support-euler-characteristic`, `PadicMeasuresIwasawaAlgebras:L1`.

**Proof plan.**

1. Use induced coefficients, finite mod-λ cohomology and compact Nakayama for finite generation.
2. Use the supplier cohomological-dimension and H⁰ statements to establish the amplitude actually available.
3. Apply global and local Euler characteristics after passage to finite levels and normalize by tower degree. Retain the global H² rank rather than asserting its vanishing.

**Sources.** [KATO-04], Theorem 12.2, pp. 220–221; §13.8, pp. 227–229.

### Étale j-star and continuous cohomology comparison

Target `SelmerIwasawaCohomology:L3/etale-iwasawa-comparison` · comparison.

Put X=Spec O_F[1/p], U=X minus the finite non-p ramification set, j:U→X, and let T be a lisse lattice on U. Import the arithmetic K(π,1) identification RΓ_et(U,T)≅RΓ_cont(G_(F,S),T), with integral coefficients defined by derived inverse limits. At finite coefficient level the Leray edge sequence is 0→H¹_et(X,j_*T)→H¹(G_(F,S),T)→⊕_(v∈S,v∤p) H¹(I_v,T)^(Fr_v=1); the lattice version retains the coefficient-limit H⁰ corrections unless their Mittag–Leffler hypotheses hold. Thus j_* imposes unramified H¹ at the omitted non-p primes and no finite condition at p. In a cyclotomic norm tower whose decomposition subgroup at every such non-p prime is infinite, universal norm classes are unramified there, and inverse-corestriction H¹_et(X_n,j_*T) identifies with H¹_Iw(G_(F,S),T), under these coefficient-limit hypotheses. This assertion is in degree one: higher R^q j_* inertia terms obstruct a general j_*/Rj_* complex equivalence.

**Hypotheses and conventions.** Finite S and finite ramification of T. Derived inverse-limit comparison and the actual residue extension at each omitted prime. Import the arithmetic K(π,1) comparison for p-primary lisse coefficients on Spec O_F[1/S] with p inverted (and the modified real convention), not merely the equivalence of finite étale covers with π₁-sets.

**Prerequisites.** `L3/iwasawa-shapiro`, `ArithmeticGaloisDuality:R02.1/carrier-comparison`, `SchemeAndStackFoundations:SF.6`, `L3/universal-norms-unramified`.

**Proof plan.**

1. Use the imported arithmetic K(π,1) comparison and finite-coefficient Leray spectral sequence. Identify the stalks R^q j_*T with H^q(I_v,T), giving the displayed degree-one edge sequence.
2. Pass to lattice coefficients by the Milnor exact sequence; retain lim¹ H⁰ until its finiteness/Mittag–Leffler hypothesis is verified.
3. Apply universal-norms-unramified at every omitted non-p place in the cyclotomic tower. The norm-compatible global H¹ classes have zero singular localization, so the finite-level injections identify their inverse-corestriction limits. Unramified restriction colimits also vanish locally, but are a different limit.

**Sources.** [KATO-04], §§8.2 and 8.5, pp. 180–184; §12.2, pp. 220–221. [RUBIN-ES], Appendix B, Proposition 5.1, printed p. 157 (PDF p. 167).

### Local cofreedom and an away-p Euler factor

Target `SelmerIwasawaCohomology:L3/local-cofree-euler` · theorem.

In the CGLS anticyclotomic setting K imaginary quadratic, p odd split, Γ≅ℤ_p and Λ=ℤ_p[[Γ]], let M_θ=ℤ_p(θ)⊗Λ^∨ with action θ⊗Ψ^−1. At w∤p with finite-index decomposition subgroup, H¹(K_w,M_θ)^∨ is torsion with characteristic ideal generated by P_w(ℓ^−1γ_w), P_w(X)=det(1−Fr_w X|V_θ^I_w), using arithmetic Frobenius γ_w; its μ-invariant is zero. At w|p, θ|G_w≠1,ω implies H⁰=H²=0, restriction H¹→H¹(I_w)^G_w/I_w is an isomorphism, and H¹ is Λ-cofree rank one. For an elliptic curve satisfying Lemma 1.3.1’s good-reduction and E(K_w)[p]=0 hypotheses, the corresponding local H¹ is cofree rank two. These are the stated cases, not every representation at every place.

**Hypotheses and conventions.** CGLS §1.1’s finite character and anticyclotomic tower. The mod-p trivial and cyclotomic characters are explicitly excluded in the at-p character case. θ is the Teichmüller lift of a character G_K→𝔽_pˣ with conductor supported on split primes, as in CGLS §1.1. For the non-p formula w lies above a rational split prime ℓ; then Norm(w)=ℓ and its decomposition subgroup has finite index. The elliptic specialization uses E/ℚ with the stated good ordinary p-reduction.

**Prerequisites.** `L3/semilocal-cohomology`, `ArithmeticGaloisDuality:R02.4/poitou-tate`, `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal`.

**Proof plan.**

1. Compute away-p inertia/residue cohomology and identify its dual presentation by 1−ℓ^−1γ_w Fr_w.
2. At p use local duality and the excluded characters to kill H⁰,H²; reduction gives a torsion-free free specialization.
3. Apply Lemma 1.1.2’s compact Nakayama criterion X[γ−1]=0 and free X/(γ−1) to obtain Λ-freeness. For the elliptic case apply Lemma 1.3.1.

**Sources.** [CGLS-22], §1.1, Lemma 1.1.2 and Proposition 1.1.3, pp. 6–7; Lemma 1.3.1, p. 10.

**Discriminating tests.**

- `TauCeti.Selmer.Tests.local_cofree_trivial` (non-example): The trivial residual character can have H⁰ and is excluded.
- `TauCeti.Selmer.Tests.local_cofree_cyclotomic` (non-example): The cyclotomic residual character can have dual H⁰ and is excluded.
- `TauCeti.Selmer.Tests.local_euler_frobenius` (non-example): Replacing arithmetic γ_w by its inverse without changing conventions changes the displayed Euler polynomial.

### A criterion for torsion Iwasawa cohomology

Target `SelmerIwasawaCohomology:L3/iwasawa-torsion-criterion` · theorem.

Assume Γ ≅ ℤ_p^r, G satisfies (F) and cd_p(G) < ∞. Let 𝔭 ∈ Spec(R) and 𝔭̄ ∈ Spec(R̄) its preimage under the augmentation R̄ → R. If T ∈ D^b of finite type over R has RΓ_cont(G, T)_𝔭 ≅ 0, then RΓ_cont(G, 𝓕_Γ(T))_𝔭̄ ≅ 0.

**Hypotheses and conventions.** The vanishing of the specialised complex at 𝔭 is a hypothesis.

**Prerequisites.** `L3/iwasawa-descent`, `L3/iwasawa-shapiro`.

**Proof plan.**

1. iwasawa-descent (ii) localised at 𝔭 gives E²_{ij} = H_{i,cont}(Γ, H^{−j})_𝔭 ⇒ H^{−i−j}_cont(G, T)_𝔭 = 0, with finitely many nonzero terms.
2. If E²_{0,j} = 0 then all E²_{i,j} = 0 (Nekovář 7.2.7 and Lemma 8.10.5); by induction on j, (H^{−j})_𝔭̄/J = 0 for the augmentation ideal J ⊆ 𝔭̄, and Nakayama's lemma gives H^{−j}_𝔭̄ = 0.

**Sources.** [NEKOVAR-SC], Chapter 8, Proposition 8.4.8.5, p. 216 (Numdam PDF p. 225).

**Acceptance.** This is the form in which torsion of H²_Iw and of Selmer duals is proved; it is a separate conclusion from a specialisation hypothesis, never a default (the stage's warning).

### Twisting Iwasawa cohomology

Target `SelmerIwasawaCohomology:L3/iwasawa-twist` · theorem.

For the cyclotomic Γ = Gal(ℚ(ζ_{p^∞})/ℚ) with compatible roots (ζ_{p^n}) fixed, κ the cyclotomic character and k ∈ ℤ, cup product with the norm-compatible system (ζ_{p^n}^{⊗k})_n gives a ℤ_p-linear isomorphism φ_k : H^q_Iw(T) ≅ H^q_Iw(T(k)) with φ_k(λx) = Tw_k(λ)φ_k(x), where Tw_k is the ring automorphism of Λ = 𝒪⟦Γ⟧ with Tw_k(σ) = κ(σ)^{−k}σ. Composing with the specialisation of iwasawa-descent at the augmentation gives H¹_Iw(V) → H¹(ℤ[1/p], T(k)) ⊗ ℚ, which factors through the localisation at ker(Λ → 𝒪, σ_c ↦ c^{−k}).

**Hypotheses and conventions.** Cyclotomic tower; compatible roots of unity fixed (they trivialise ℤ_p(1) over the tower).

**Prerequisites.** `L3/iwasawa-cohomology`, `L3/iwasawa-descent`, `ArithmeticGaloisDuality:R02.2/hochschild-serre-spectral-sequence`, `PadicMeasuresIwasawaAlgebras:L1`.

**Proof plan.**

1. The system (ζ_{p^n}^{⊗k}) is restriction-compatible, so by the projection formula cor(x ∪ res y) = cor(x) ∪ y the cup products are corestriction-compatible (ProfiniteCohomology Layer 12; ArithmeticGaloisDuality R02.2's cup products).
2. σ(x ∪ ζ^{⊗k}) = σx ∪ κ(σ)^kζ^{⊗k}, which is the Tw_k-semilinearity; the inverse is cup product with (ζ_{p^n}^{⊗−k}).
3. The specialisation is iwasawa-descent (ii); augmentation ∘ Tw_k sends σ_c to c^{−k}.

**Sources.** [BURUNGALE-TIAN-26], §3, (3.2), p. 6 (arXiv v2).

**Acceptance.** Semilinear, not Λ-linear for an unchanged action (Burungale–Tian's warning); changing the compatible roots changes coordinates, not the module.

### Derived specialization and control spectral sequence

Target `SelmerIwasawaCohomology:L3/derived-control` · theorem.

For compatible induced local conditions with derived base-change equivalences, RΓ_f,Iw⊗^L_Λ Λ_n≃RΓ_f(F_n,T), where Λ_n=O[Γ/Γ_n]. The spectral sequence Tor_i^Λ(H^j_f,Iw,Λ_n)⇒H^(j−i)_f(F_n,T) has its natural edge maps. For Γ=ℤ_p and Λ_n=Λ/(γ^(p^n)−1), this yields 0→H^j_f,Iw/(γ^(p^n)−1)→H^j_f(F_n,T)→H^(j+1)_f,Iw[γ^(p^n)−1]→0. Local conditions without derived base change contribute the correction complex of correction-complex. No unconditional specialization isomorphism is asserted.

**Hypotheses and conventions.** Bounded cohomology and supplier derived-completion/base-change hypotheses. Local maps, not only their H¹ images, must commute with derived specialization.

**Prerequisites.** `L3/infinite-selmer-complex`, `ArithmeticGaloisDuality:R02.1/cochains-inverse-limit`, `PadicMeasuresIwasawaAlgebras:L5`.

**Proof plan.**

1. Use infinite Shapiro for each vertex of the fibre and derived base change for the coefficient complexes.
2. Tensor the fibre triangle, using the stated local base-change equivalences; obtain the comparison map.
3. Use a projective resolution of Λ_n. For d=1 the two-term resolution yields the displayed short exact sequence, including the degree j+1 torsion.

**Sources.** [NEKOVAR-SC], §8.10, especially §§8.10.1–8.10.5, pp. 249–251.

**Discriminating tests.**

- `TauCeti.Selmer.Tests.control_torsion` (non-example): A complex with only H²=Λ/(γ−1) contributes O to finite-level H¹.
- `TauCeti.Selmer.Tests.control_flat` (compatibility): A complex with only a Λ-free H¹ specializes without a Tor error.
- `TauCeti.Selmer.Tests.control_rank_two` (non-example): For Γ=ℤ_p², higher Tor can survive; a universal short exact sequence is false.

### Iwasawa duality with the involution and local errors

Target `SelmerIwasawaCohomology:L3/iwasawa-selmer-duality` · theorem.

For perfect coefficient duals T and T^*(1), transport L1 duality to induced coefficients. For Γ≅ℤ_p^d and the regular local ring Λ=O[[Γ]], use coefficient duality with Λ placed in degree zero and obtain RΓ_f,Iw(T)→RHom_Λ(RΓ_f,Iw(T^*(1)),Λ)^ι[−3], where ι(γ)=γ^−1. Its cone is the sum of the induced local complement errors. With elementary coefficient complements at p and the precise unramified conditions elsewhere, calculate which errors vanish and which survive (including Tamagawa terms); derived duality is an equivalence only after those errors vanish. This is compatible with finite-level specialization, global degree-three duality and local degree-two pairings.

**Hypotheses and conventions.** Perfectness/dualizing coefficient hypotheses of Nekovář §8.9 and the imported AGD duality; tower condition (U). Modified real terms at p=2. A height-one disappearance of an error is weaker than its integral acyclicity. Here the compact dual T^*(1) means Hom_O(T,O)(1); it is distinct from Rubin’s discrete T^*=Hom_O(T,E/O)(1). Λ is the degree-zero coefficient dualizing module in this normalization; using an absolute dualizing complex shifted by dim Λ requires the compensating shift. The displayed shift is the arithmetic degree-three normalization.

**Prerequisites.** `L1/derived-selmer-duality`, `L3/infinite-selmer-complex`, `L2/pontryagin-dual`, `PadicMeasuresIwasawaAlgebras:L5`.

**Proof plan.**

1. Identify compact and discrete tower duals using Shapiro and the Pontryagin involution.
2. Apply the parametric global-fibre duality to the induced coefficients.
3. Compute the elementary ordinary complements and the unramified local adjoint cones; retain the nonacyclic cones and apply derived control to specialize.

**Sources.** [NEKOVAR-SC], §8.5.6, p. 220; §§8.9.6–8.9.7, pp. 240–244.

**Discriminating tests.**

- `TauCeti.Selmer.Tests.iw_duality_inverse` (non-example): A γ-eigencharacter c is paired with c^−1, rather than c.
- `TauCeti.Selmer.Tests.iw_duality_tamagawa` (non-example): A nontrivial local Tamagawa error prevents an integral quasi-isomorphism.
- `TauCeti.Selmer.Tests.iw_duality_height_one` (non-example): A finite Λ-error disappears at height one but must remain in the integral triangle.

### Determinant line and its height-one characteristic divisor

Target `SelmerIwasawaCohomology:L3/selmer-determinant` · construction.

For a perfect Λ-Selmer complex C, define its arithmetic determinant line 𝔇(C)=(det_Λ C)⁻¹ using the PMIA L5 determinant functor. If C⊗Frac(Λ) is acyclic, the canonical fraction-field trivialization identifies 𝔇(C) with a fractional invertible lattice whose height-one valuation is Σ_i(−1)^i length_(Λ_𝔭) H^i(C)_𝔭. Thus for cohomology only in degrees one and two its divisor is char H²/char H¹. The inverse determinant is essential for this sign convention. If generic cohomology has positive rank, determinant is a line without a canonical scalar trivialization; a regulator/leading-term trivialization is separate input. Base change and duality induce the determinant comparisons only for the corresponding perfect derived complexes.

**Hypotheses and conventions.** Λ Noetherian normal domain, C perfect, torsion cohomology for the scalar divisor statement. For nonregular multi-variable coefficients request the precise perfectness rather than infer it from finite generation.

**Prerequisites.** `L3/infinite-selmer-complex`, `PadicMeasuresIwasawaAlgebras:L5`, `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal`.

**Proof plan.**

1. Import determinant functor, exact-triangle multiplicativity and fraction-field trivialization from PMIA L5.
2. Localize at a height-one DVR and compute the determinant of a two-term free resolution of each torsion cohomology module.
3. Multiply with the cohomological signs and transport through specialization/duality. Record local-error determinants as factors in these comparisons.

**Sources.** [NEKOVAR-SC], §8.9, pp. 238–244; §8.10, pp. 249–251. [KATO-04], §12.2, pp. 220–221.

**API.**

- `TauCeti.Selmer.selmerDeterminant` (constructor): The arithmetic line (det_Λ C)⁻¹ of a perfect Selmer complex, with the stated cohomological sign.
- `TauCeti.Selmer.selmerDeterminant_triangle` (compatibility): Exact triangles give multiplicative line equivalences.
- `TauCeti.Selmer.selmerDeterminant_torsionDivisor` (characterisation): The signed height-one cohomology lengths give the divisor.
- `TauCeti.Selmer.selmerDeterminant_baseChange` (functoriality): Derived base change gives the corresponding line equivalence.

**Discriminating tests.**

- `TauCeti.Selmer.Tests.det_acyclic` (degenerate): An acyclic perfect complex has the unit line and zero divisor.
- `TauCeti.Selmer.Tests.det_two_degrees` (non-example): For H¹=Λ/(a), H²=Λ/(b), the divisor is (b)/(a), so reversing the cohomological sign fails.
- `TauCeti.Selmer.Tests.det_positive_rank` (non-example): A free nonzero H¹ prevents a canonical torsion scalar trivialization.

### Surjectivity of global ordinary localization

Target `SelmerIwasawaCohomology:L3/localization-surjective` · theorem.

Under Greenberg Proposition 2.6.3’s hypotheses D Λ-divisible, LEO, CRK and one of alternatives (a), (b), (c) recorded above (with Q_η divisible in (c)), the map H¹(G_(F,S),D)→Q=⊕H¹(F_v,D)/L_v is onto. Thus primitive/imprimitive change of conditions has the asserted right exact local-quotient map only under these hypotheses. For ordinary elliptic curves in the cyclotomic tower, p odd, good ordinary reduction, E(F)[p]=0 and cotorsion Selmer imply the hypotheses by §4.4’s local/Euler computation. For general ordinary representations these hypotheses remain explicit.

**Hypotheses and conventions.** The exact Proposition 2.6.3 alternative is part of the input. Residual irreducibility of rank at least two rules out a μ_p subquotient but does not replace LEO or CRK.

**Prerequisites.** `L3/greenberg-structure-hypotheses`, `L2/selmer-structure-poitou-tate`, `L3/iwasawa-finiteness-euler`.

**Proof plan.**

1. Apply Poitou–Tate and the localization corank equality to show its cokernel is cotorsion.
2. Use LEO and the selected residual/local alternative to eliminate that cotorsion cokernel as in Greenberg Proposition 2.6.3.
3. For the elliptic application compute the local quotient ranks, H⁰ and Euler rank difference; cotorsion Selmer gives CRK and the stated weak-Leopoldt condition.

**Sources.** [GREENBERG-STRUCTURE], Proposition 2.6.3, p. 11; §4.4, pp. 24–25.

**Discriminating tests.**

- `TauCeti.Selmer.Tests.localization_cotorsion_not_zero` (non-example): A cotorsion localization cokernel alone need not vanish.
- `TauCeti.Selmer.Tests.localization_imprimitive` (compatibility): After relaxing Σ, the surjective map gives Sel^Σ/Sel≅⊕_(v∈Σ)Q_v.
- `TauCeti.Selmer.Tests.localization_residual_rank_one` (non-example): An irreducible residual rank-one cyclotomic character contains μ_p and does not satisfy alternative (a).

### Classical restriction control with invariants and localization errors

Target `SelmerIwasawaCohomology:L3/kernel-control` · theorem.

Put H_n=H¹(G_(F_n,S),A), H∞=H¹(G_(F∞,S),A), and Q_n=⊕H¹(F_n,w,A)/L_n,w. Inflation–restriction gives ker(H_n→H∞^Γ_n)=H¹(Γ_n,A^G_(F∞,S)); its cokernel is the appropriate subgroup of H²(Γ_n,A^G_(F∞,S)). Compute local restriction by the same sequence for Γ_n,w and by the maps of inertia quotients. Let I_n=im(H_n→Q_n) and I∞,n=im(H∞^Γ_n→Q∞^Γ_n). Snake on 0→Sel→H→I→0 gives 0→ker SelRes→ker HRes→ker(I_n→I∞,n)→coker SelRes→coker HRes→coker(I_n→I∞,n)→0. Identify I-errors through the Q-errors and localization cokernels C=Q/I. Only when localization is onto at both levels may I be replaced by Q. Thus the control criterion is vanishing or boundedness of these explicitly computed invariant, inertia and C-errors. The bottom short exact row uses I∞,n; it is generally smaller than (im(H∞→Q∞))^Γ_n. Its comparison with that larger group has the H¹(Γ_n,Sel∞) error.

**Hypotheses and conventions.** A is discrete p-primary; local conditions are restriction-compatible; use invariants of the exact infinite-level sequence, including H¹(Γ_n,Sel∞) when comparing its image with I∞^Γ_n. The superscript invariants does not preserve right exactness.

**Prerequisites.** `L2/selmer-functoriality`, `L2/condition-change-triangle`, `ArithmeticGaloisDuality:R02.2/compact-five-term`, `L3/derived-control`.

**Proof plan.**

1. Apply the supplier five-term sequences globally and locally, including the decomposition subgroup and inertia maps.
2. Use the actual image of the localization map and take invariants with their derived terms; construct the commuting short exact rows.
3. Apply the snake lemma to those rows. Compare I with Q by their cokernel sequences; retain H¹ of the Γ-invariants functor and localization failures.

**Sources.** [NEKOVAR-SC], §§8.10.1–8.10.5, pp. 249–251. [RUBIN-ES], Appendix B §3, pp. 153–155.

**Discriminating tests.**

- `TauCeti.Selmer.Tests.control_zero_invariants` (non-example): A^G∞=0 kills the global five-term kernel but does not by itself kill every local-condition error.
- `TauCeti.Selmer.Tests.control_nononto_localization` (non-example): If H=0 and Q≠0, localization is not onto and replacing I by Q in the snake sequence is invalid.
- `TauCeti.Selmer.Tests.control_exceptional` (non-example): A trivial ordinary quotient at p can have a nonzero unramified control term even when generic specialization is exact.

### Local specialization correction complex

Target `SelmerIwasawaCohomology:L3/correction-complex` · construction.

For a specialization Λ→R and a specified local condition i:U^+→C_v,Iw with specialized finite-level condition i_R:U_R^+→C_v,R, define E_v(R)=Cone(U^+⊗^L_ΛR→U_R^+) using the actual comparison map. When ambient global/local cochains satisfy derived base change, the cone of RΓ_f,Iw⊗^L R→RΓ_f,R is ⊕E_v(R), with the orientation determined by the condition-change triangle. Its LES records all local correction groups. An exceptional eigenvalue or finite-slope condition is encoded by the provided local map; this node constructs no higher-tier (φ,Γ)-module regulator.

**Hypotheses and conventions.** A specified coherent specialization map on U^+ and ambient cochains; finite changed set.

**Prerequisites.** `L2/condition-change-triangle`, `L3/derived-control`.

**Proof plan.**

1. Construct the comparison arrow and its cone in the same derived category as the Selmer fibre.
2. Use the diagram of fibres and the octahedral axiom; the ambient comparison cones are zero by hypothesis.
3. Read the resulting LES and prove naturality under a second specialization.

**Sources.** [NEKOVAR-SC], §6.1, pp. 135–137; §8.10, pp. 249–251.

**API.**

- `TauCeti.Selmer.localSpecializationError` (constructor): Cone of the local-condition specialization map.
- `TauCeti.Selmer.localSpecializationError_acyclic_iff` (characterisation): Acyclic iff the specified local comparison is a quasi-isomorphism.
- `TauCeti.Selmer.selmerSpecialization_errorTriangle` (structure): The fibre comparison has the direct sum of these errors as its cone.
- `TauCeti.Selmer.localSpecializationError_map` (functoriality): Coherent specialization maps induce maps of error triangles.

**Discriminating tests.**

- `TauCeti.Selmer.Tests.specialization_error_identity` (degenerate): Identity comparison has acyclic error.
- `TauCeti.Selmer.Tests.specialization_error_h0` (non-example): A failed degree-zero comparison contributes to the control LES even if local H¹ images agree.
- `TauCeti.Selmer.Tests.specialization_error_tor` (non-example): Nonflat U^+ must be derived-tensored; ordinary tensor can delete a Tor correction.

### Lattice independence, twists and degree-one specialization

Target `SelmerIwasawaCohomology:L3/rational-specialization` · theorem.

The rationalized Iwasawa complex and its rational specializations depend only on V: finite lattice quotients disappear after inverting p. A Tate twist by k is semilinear for Tw_k(γ)=χ_cyc(γ)^−kγ on the Λ factor; specialization for V(k) is at the kernel of γ↦χ_cyc(γ)^−k with the convention of iwasawa-twist. For Γ=ℤ_p, the degree-one specialization sequence retains H²_Iw[𝔮]. If the specialized H² vanishes and the localized complex has amplitude ≤2, derived control and Nakayama kill H²_Iw,𝔮 and hence that Tor correction. The finite-level H² calculation itself retains H³_Iw[𝔮] until the amplitude theorem removes it.

**Hypotheses and conventions.** Rational coefficients at specialization; a specified character convention; the vanishing assertion and amplitude are separate inputs.

**Prerequisites.** `L2/lattice-change-cone`, `L3/iwasawa-twist`, `L3/derived-control`, `L3/iwasawa-finiteness-euler`.

**Proof plan.**

1. Apply lattice-change-cone and rationalization to finite quotient errors.
2. Compute the induced coefficient action after twisting, yielding the stated automorphism and specialization prime.
3. Apply derived-control in degrees one and two. Use the amplitude hypothesis and Nakayama at 𝔮 for the asserted H² vanishing implication.

**Sources.** [BURUNGALE-TIAN-26], Version 2, §2, p. 4; §3, pp. 5–6, equation (3.1).

### No pseudo-null submodule of the ordinary Selmer dual

Target `SelmerIwasawaCohomology:L3/selmer-no-pseudonull` · theorem.

Assume RFX, LEO, LOC2 at every place, LOC1 at one finite place, local-condition almost divisibility, CRK and one of Greenberg Proposition 4.1.1’s alternatives, using coreflexive Q_η in its third alternative. Then Sel is almost divisible, and X=Sel^∨ has no nonzero pseudo-null Λ-submodule. For Λ=O[[T]] this means no nonzero finite submodule. Proposition 4.2.1 supplies the imprimitive version when the relaxed set contains a suitable finite LOC1 place. The cyclotomic ordinary elliptic case of §4.4 follows under p odd, E(F)[p]=0, good ordinary p-reduction and cotorsion Selmer. CGLS Corollary 1.4.3 concerns its stated imprimitive anticyclotomic Selmer dual and is not a universal primitive assertion.

**Hypotheses and conventions.** Finite generated X; retain all Greenberg local/global hypotheses and distinguish the primitive and imprimitive conditions.

**Prerequisites.** `L3/greenberg-structure-hypotheses`, `L3/localization-surjective`, `PadicMeasuresIwasawaAlgebras:L4`.

**Proof plan.**

1. Use the quotient diagram and almost divisibility of the local conditions to show that the Selmer kernel is almost divisible, with the selected alternative handling the exceptional cokernel.
2. Dualize the height-one multiplication criterion to exclude every pseudo-null submodule.
3. For the dimension-two cyclotomic algebra identify pseudo-null finite generated modules with finite modules. Verify the elliptic and stated imprimitive examples separately.

**Sources.** [GREENBERG-STRUCTURE], Propositions 4.1.1 and 4.2.1, pp. 19–21; §§4.3–4.4, pp. 21–25.

**Discriminating tests.**

- `TauCeti.Selmer.Tests.selmer_finite_counterexample` (non-example): The module Λ/(p,T) is torsion but has a nonzero finite submodule; torsion does not suffice.
- `TauCeti.Selmer.Tests.selmer_primitive_distinction` (non-example): The imprimitive theorem cannot be transferred to a primitive dual without controlling its local quotient.
- `TauCeti.Selmer.Tests.selmer_elliptic_cyclotomic` (compatibility): The stated elliptic cyclotomic hypotheses imply the no-finite-submodule conclusion.

### Fitting equals characteristic under the structure criterion

Target `SelmerIwasawaCohomology:L3/selmer-fitting-characteristic` · theorem.

Let Λ=O[[T]] with O a complete DVR and X a finitely generated torsion Λ-module with no nonzero finite submodule. Then depth_Λ X≥1 and pd_Λ X≤1. A finite free resolution 0→Λ^r→Λ^r→X→0 gives Fitt_Λ X=(det A)=char_Λ X as ideals. Apply this to the ordinary Selmer dual only after selmer-no-pseudonull and cotorsion establish the hypotheses. For modules with finite submodules or higher-dimensional Λ, equality is not asserted. This criterion is supplied to ModularIwasawaMainConjectures L1 and RankZeroOneBSD BSD.6/BSD.6a/BSD.7a.

**Hypotheses and conventions.** Λ regular local of dimension two; X finitely generated torsion. The zero module uses the unit ideal convention.

**Prerequisites.** `L3/selmer-no-pseudonull`, `PadicMeasuresIwasawaAlgebras:L6/quadratic-presentation`, `PadicMeasuresIwasawaAlgebras:L6/fitting-quadratic`, `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal`.

**Proof plan.**

1. The maximal-ideal torsion submodule is finite; its absence gives a nonzerodivisor on X and depth at least one.
2. Use the dimension-two Auslander–Buchsbaum formula to obtain a projective resolution of length at most one. Local free modules and rank zero give a square presentation.
3. Invoke PMIA quadratic presentation/Fitting and characteristic-ideal height-one formulas; identify both with its determinant.

**Sources.** [GREENBERG-STRUCTURE], §1, pp. 1–4; Theorem 4.1.1, pp. 19–20 (arithmetic no-pseudo-null input).

**Discriminating tests.**

- `TauCeti.Selmer.Tests.fitting_cyclic` (compatibility): For X=Λ/(f), f nonzero, both ideals equal (f).
- `TauCeti.Selmer.Tests.fitting_finite` (non-example): For X=Λ/(p,T), char X=Λ but Fitt X=(p,T); the no-finite-submodule hypothesis is necessary.
- `TauCeti.Selmer.Tests.fitting_zero` (degenerate): For X=0, both ideals are Λ.

## Layer L4: Arithmetic examples and conjectures

The finite condition must be defined on genuine period and filtered-Frobenius carriers before it can be compared with ordinary or elliptic Kummer conditions. The Hodge recipe independently determines Gamma factors and criticality. The class/unit dictionary and conjecture statements retain the same coefficient, sign and determinant conventions. The two parity targets have exact statements; their remaining proof inputs are specified after the targets.

### Local units and the cyclotomic Euler system in Iwasawa cohomology

Target `SelmerIwasawaCohomology:L4/local-units-iwasawa-cohomology` · lemma.

For K_n=ℚ_p(μ_(p^n)), the completion K̂_n^×≃H¹(K_n,ℤ_p(1)) intertwines norms with corestriction and gives lim_n K̂_n^×≃H¹_Iw(ℚ_p,ℤ_p(1)). Principal-unit inclusions give U∞→H¹_Iw. Every specified norm-compatible unit sequence maps to its compatible local Kummer sequence. For an external cyclotomic-unit Euler system, localization of its norm identities must retain the Frobenius operator on the field/class, rather than replace it by the scalar coefficient action. This is the cohomological reinterpretation of RJW §10.5; constructing those Euler-system classes is an output consumer’s task.

**Hypotheses and conventions.** p odd; D ≥ 1 prime to p; completions as in SelmerIwasawaCohomology L0.

**Prerequisites.** `L0/padic-kummer-identification`, `L0/local-completion`, `L3/iwasawa-cohomology`.

**Proof plan.**

1. Apply the local Kummer norm squares at every finite level and take the inverse limit.
2. Restrict the comparison to principal units and prove compatibility with the completed Γ-action.
3. Apply this map to any supplied norm-compatible sequence; for external Euler-system sequences use the actual Frobenius class action in each identity.

**Sources.** [RJW-PADIC-L], §10.5, (10.5)–(10.8) and Definition 10.16, pp. 52–53 (arXiv v2); published pp. 170–172.

**Acceptance.** Coleman's map Col′ and Perrin-Riou's big logarithm, which RJW mention after (10.8), are owned by ColemanPowerSeries and PadicHodgeRegulators; they are not planned here.

### The completed algebraic closure and existing de Rham period rings

Target `SelmerIwasawaCohomology:L4/cp-period-comparison` · comparison.

Let C_p be the completion of an algebraic closure of ℚ_p with its unique extended valuation, with continuous G_K-action for each finite K/ℚ_p. Import its perfectoid tilt and A_inf=W(O_Cp^♭) and θ from PerfectoidSpaces P1. Identify Mathlib BDeRhamPlus/BDeRham with completion of A_inf[1/p] at ker θ and its localization. Give the canonical quotient B_dR^+→C_p, its complete DVR structure, and the canonical topology defined as the inverse limit of the p-adic quotient topologies (not the discrete topology on the quotients). For a compatible primitive roots-of-unity sequence ε, t=log[ε] is a uniformizer, g(t)=χ(g)t, Fil^i B_dR=t^i B_dR^+, and gr^i B_dR≃C_p(i).

**Hypotheses and conventions.** Finite K/ℚ_p; algebraic closure valuation/completion imported from the local-field supplier. The ring definition is already Mathlib baseline; only these comparisons and structures are new.

**Prerequisites.** `PerfectoidSpaces:P1/fontaine-theta-and-primitive-kernel`, `PerfectoidSpaces:P1/fontaine-theta-comparison-with-mathlib`, `PerfectoidSpaces:P1/completed-colimit-of-perfectoid-tate-rings`, `PerfectoidSpaces:P3/finite-extensions-of-perfectoid-fields`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-1-units-the-filtration-and-the-multiplicative-group`.

**Proof plan.**

1. Extend the valuation and Galois isometries to the algebraic-closure completion. Obtain its perfectoid structure from completed filtered finite extensions of the cyclotomic perfectoid field.
2. Compare the lower-tier θ with Mathlib fontaineThetaInvertP and identify their adic completions by the universal property.
3. Use the primitive kernel and first-order thickening to show t is a uniformizer; extend the action and compute its associated graded via g(t)=χ(g)t.

**Sources.** [FONTAINE-94], §§1.5.1–1.5.7, pp. 71–74.

**Discriminating tests.**

- `TauCeti.Selmer.Tests.period_residue` (compatibility): B_dR^+/(t)≃C_p; replacing ker θ completion by p-adic completion fails.
- `TauCeti.Selmer.Tests.period_tate_action` (non-example): g(t)=χ(g)t, so gr¹ is C_p(1), with positive Tate twist.
- `TauCeti.Selmer.Tests.period_topology` (non-example): The G_K action is continuous for the canonical inverse-limit topology; the t-adic topology with discrete C_p quotients is not a substitute.

### Archimedean realization on the existing Hodge carrier

Target `SelmerIwasawaCohomology:L4/archimedean-realization` · definition.

At a real place, extend the existing TauCeti.Hodge.HodgeStructureOn(W,ω,w), finite-dimensional over ℂ, by a ℂ-linear involution F∞ commuting with the antilinear coefficient conjugation ω and taking H^(a,w−a) to H^(w−a,a). These involutions are different data. On a diagonal piece H^(a,a), let h_a^ε be the dimension of the F∞=(-1)^(a+ε) eigenspace, ε=0,1. At a complex place use the Hodge numbers without real eigenspaces. Require an explicit comparison specifying which Hodge realization defines L(V,s); in RJW’s Tate convention V=ℚ_p(n) has archimedean type (n,n), F∞=(-1)^n and L(V,s)=ζ(s−n). The usual cohomological Tate Hodge convention must be dualized to this L-function convention.

**Hypotheses and conventions.** Finite-dimensional pure Hodge realization on the actual opposed-filtration carrier. No conversion from a p-adic representation to Hodge data without comparison data.

**Prerequisites.** `L2/pontryagin-dual`, `tauceti:TauCeti.Hodge.HodgeStructureOn.dual`, `tauceti:TauCeti.Hodge.HodgeStructureOn.finrank_dual_piece`, `tauceti:TauCeti.Hodge.HodgeStructureOn.tateTwist`, `tauceti:TauCeti.Hodge.tate`, `tauceti:TauCeti.Hodge.tate_hodgeNumber`.

**Proof plan.**

1. Import HodgeStructureOn, its pieces, symmetry and finite support, and add the Betti involution with its actual compatibility equations.
2. Restrict F∞ to diagonal pieces and use the ± eigenspace decomposition in characteristic zero.
3. Import the existing Hodge dual and Tate twist: the L-function Tate-dual Hodge carrier is H.dual.tateTwist(−1), with types (1−a,1−b). Extend it by the negative transpose of F∞; this changes the Betti involution, not the underlying Hodge dual construction. Prove the diagonal eigenspace formulas and direct-sum compatibility.

**Sources.** [DELIGNE-79], §5.2–5.3 and Table 5.3, pp. 328–329. [RJW-PADIC-L], §13.5.3, preprint pp. 71–72.

**API.**

- `TauCeti.Selmer.ArchimedeanRealization` (constructor): Existing HodgeStructureOn plus the real involution and its compatibility.
- `TauCeti.Selmer.archRealization_diagonalMultiplicity` (projection): The (-1)^(a+ε) eigenspace dimension on H^(a,a).
- `TauCeti.Selmer.archRealization_sum` (structure): Direct sum with both conjugations and summed multiplicities.
- `TauCeti.Selmer.archRealization_tateDual` (functoriality): The L-function Tate-dual types and involution.
- `TauCeti.Selmer.archRealization_hodgeCarrier` (coercion): Projection to the existing opposed-filtration Hodge structure.

**Discriminating tests.**

- `TauCeti.Selmer.Tests.arch_zero` (degenerate): Zero Hodge structure gives zero diagonal and off-diagonal multiplicities.
- `TauCeti.Selmer.Tests.arch_real_involution` (non-example): Two weight-zero rank-one structures with the same Hodge filtration and opposite F∞ give different real Gamma factors.
- `TauCeti.Selmer.Tests.arch_tate_convention` (compatibility): For ℚ_p(n) in the RJW convention, the type is (n,n) and F∞=(-1)^n; using type (−n,−n) without changing L(V,s) gives the wrong criticality.

### Class groups, p-ramified Galois groups and unit towers

Target `SelmerIwasawaCohomology:L4/arithmetic-tower-data` · construction.

For F_n=ℚ(μ_(p^n)), p odd, define Y_n as the p-primary ideal class group, identified by global reciprocity with the everywhere-unramified maximal abelian pro-p Galois group. Define X_n as the maximal abelian pro-p Galois group unramified outside p, equivalently the p-completed idèle class quotient with the local unit groups away from p killed. Let U_n,1 be principal units at p and E_n,1 the closed image of the global units in U_n,1 (intersecting with principal units). Define U∞,1,E∞,1,Y∞ by norm limits and X∞ as the corresponding p-ramified Galois group over F∞; prove its comparison with the finite-level norm/transfer system, retaining decomposition/splitting terms until the cyclotomic ramification hypotheses remove them. For complex conjugation c, use e±=(1±c)/2 to form the plus/minus parts and identify X∞^+,Y∞^+ with the groups over the real tower. A chosen closed norm-compatible unit submodule C∞,1^+⊆E∞,1^+ is parameter data here; constructing cyclotomic Euler systems belongs to its consumer.

**Hypotheses and conventions.** Cyclotomic tower and p odd; closed unit images rather than algebraic unit images; global Artin reciprocity normalized with arithmetic Frobenius.

**Prerequisites.** `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`, `L0/units-completion`, `L3/semilocal-cohomology`.

**Proof plan.**

1. Import finite-level global reciprocity, class-group identification and local unit norm maps from ClassFieldTheory and GlobalNumberFields.
2. Construct the closed p-ramified idèle quotient, prove the finite-level exact unit/class-group sequence, and take the compatible norm limits.
3. Compute the tower Galois action and plus/minus idempotents; prove descent to the real tower using the prime-to-p group of order two.

**Sources.** [RJW-PADIC-L], §13.2 and Definition 13.12, preprint pp. 65–67; Proposition 13.13 and Corollary 13.14, pp. 67–68.

**API.**

- `TauCeti.Selmer.pRamifiedModule` (constructor): The maximal abelian pro-p group unramified outside p with its continuous tower action.
- `TauCeti.Selmer.unramifiedModule` (constructor): The class-group norm limit and its unramified Galois comparison.
- `TauCeti.Selmer.closedGlobalUnitTower` (constructor): Norm limit of the closed global-unit images in principal units.
- `TauCeti.Selmer.arithmeticPlusMinus` (structure): The e± decomposition for p odd.
- `TauCeti.Selmer.arithmeticTower_reciprocity` (equivalence): Global reciprocity identifies the stated idèle and Galois quotients, compatibly with norms.

**Discriminating tests.**

- `TauCeti.Selmer.Tests.tower_closed_units` (non-example): A dense proper algebraic unit subgroup has the same closed image; replacing closure by raw image changes the compact quotient.
- `TauCeti.Selmer.Tests.tower_plus_minus` (degenerate): For c=1 the minus part is zero and the plus part is the whole module.
- `TauCeti.Selmer.Tests.tower_two` (non-example): At p=2, division by 2 is unavailable and the e± integral direct sum is not an allowed construction.

### Greenberg Selmer groups of Tate twists

Target `SelmerIwasawaCohomology:L4/tate-twist-greenberg-selmer` · theorem.

Give V_n = ℚ_p(n) the filtration Fil^iℚ_p(n) = ℚ_p(n) for i ≤ n and 0 for i > n. Then L^Gr_{v_p} = H^1(K_∞^+, W_n) for n ≥ 1 and L^Gr_{v_p} = H^1_ur(K_∞^+, W_n) for n ≤ 0. Inflation–restriction gives H^1(F, W_n) = Hom_{cts,{±1}}(G_{F_∞}, W_n), and hence H^1_{L^Gr}(F, W_n) = Hom_cts(X_∞^{c=(−1)^n}, W_n) for n ≥ 1 and Hom_cts(Y_∞^{c=(−1)^n}, W_n) for n ≤ 0. Since (X_∞)^{c=1} ≅ X_∞^+, for even n > 0, H^1_{L^Gr}(F, W_n) = Hom_cts(X_∞^+, W_n), whose Pontryagin dual is X_∞^+(−n), the module X_∞^+ with its Λ(Γ^+)-action twisted by χ^{−n} (RJW §13.5.2, Example 13.22).

**Hypotheses and conventions.** p odd; F_∞ = ℚ(μ_{p^∞}), F = F_∞^+ = ℚ(μ_{p^∞})^+, Gal(F_∞/F) = {1, c}; K_∞^+ = ⋃_n ℚ_p(μ_{p^n})^+ denotes the local tower, with cohomology defined by finite-level restriction colimits; χ is the cyclotomic character, T_n = ℤ_p(n), V_n = ℚ_p(n), W_n = (ℚ_p/ℤ_p)(n); X_∞ = Gal(M_∞/F_∞) and Y_∞ = Gal(L_∞/F_∞) for the maximal abelian pro-p extensions unramified outside p and everywhere unramified, with X_∞^+ = Gal(M_∞^+/F_∞^+) (arithmetic-tower-data).

**Prerequisites.** `L2/greenberg-condition`, `L2/unramified-condition`, `L2/galois-selmer-group`, `L2/pontryagin-dual`, `L2/selmer-kernel`, `L4/arithmetic-tower-data`.

**Proof plan.**

1. Local condition: W_n/Fil^1W_n is 0 for n ≥ 1 and W_n for n ≤ 0, so L^Gr is everything or the unramified condition (L2/greenberg-condition).
2. G_{F_∞} acts trivially on W_n, so H^1(F_∞, W_n) = Hom_cts(G_{F_∞}, W_n); since #{1, c} = 2 is prime to p, inflation–restriction gives H^1(F, W_n) = Hom_cts(G_{F_∞}, W_n)^{{1,c}}.
3. A class is p-power torsion with abelian image, so it factors through the maximal abelian pro-p extension of F_∞; the unramified conditions away from p factor it through X_∞, and for n ≤ 0 the condition at p factors it through Y_∞.
4. c acts on W_n by (−1)^n and X_∞ = X_∞^{c=1} ⊕ X_∞^{c=−1} (p odd), so {±1}-equivariant homomorphisms are those on the (−1)^n-eigenspace; restriction identifies X_∞^{c=1} with X_∞^+.
5. Pontryagin duality with the contragredient action (L2/pontryagin-dual) turns Hom_cts(X_∞^+, W_n) into X_∞^+(−n).

**Sources.** [RJW-PADIC-L], §13.5.2, pp. 70–71 (arXiv v2); published pp. 196–197.

**Acceptance.** RJW write H^1_{L^Gr}(F_∞, W_n) for the group over F = F_∞^+ in steps (3)–(4), and "n ≥ 0" for n ≤ 0 (finding E5). The odd-n and n ≤ 0 cases give the minus part of X_∞ and the parts of Y_∞; only even n > 0 recovers X_∞^+.

### Crystalline period ring and its structures

Target `SelmerIwasawaCohomology:L4/crystalline-period-ring` · construction.

Inside A_inf[1/p], form the subring generated by A_inf and ξ^n/n!, n≥1, for a primitive generator ξ of ker θ. Its separated p-adic completion is A_cris. Define B_cris^+=A_cris[1/p], B_cris=B_cris^+[1/t]. The ring is independent of ξ and the generator of ℤ_p(1); give the Galois action, Frobenius φ extending Witt Frobenius, φ(t)=pt, θ and the injective map B_cris→B_dR. For K with residue field k, K₀=Frac W(k) embeds, φ is σ-semilinear there and commutes with G_K. The induced filtration is the intersection with Fil^i B_dR. This is the minimal period construction owned here; no geometric crystalline comparison theorem is included.

**Hypotheses and conventions.** C_p, t, A_inf, θ from cp-period-comparison; canonical divided powers on (p). Mathlib already has divided powers and adic completion, but a universal divided-power envelope is not assumed available.

**Prerequisites.** `L4/cp-period-comparison`, `PerfectoidSpaces:P1/witt-vectors-of-perfect-plus-ring`.

**Proof plan.**

1. Construct the explicit subalgebra generated by divided powers in A_inf[1/p], then use Mathlib adic completion at (p).
2. Prove the universal p-adic PD-thickening property by lifting Teichmüller coordinates and taking the limits of p-power lifts (Fontaine 2.2.2); prove independence of ξ by binomial divided-power identities.
3. Extend Frobenius and Galois action by continuity, compute φ(t)=pt and invert p,t. Expand elements as convergent divided-power series to prove the embedding into B_dR (Fontaine 4.1). The stronger scalar-extension injectivity K⊗K₀ B_cris→B_dR follows by restricting Fontaine Theorem 4.2.4; use that theorem for the crystalline-to-de Rham comparison.

**Sources.** [FONTAINE-94], Theorem 2.2.1 and proof, pp. 76–77; §§2.3.1–2.3.4, pp. 78–79; §4.1, pp. 83–84; Theorem 4.2.4, p. 86, proof §4.3, pp. 87–89.

**API.**

- `TauCeti.Selmer.aCris` (constructor): Separated p-adic completion of the explicit PD-generated A_inf-subalgebra.
- `TauCeti.Selmer.bCris` (constructor): Invert p and the logarithmic Tate period.
- `TauCeti.Selmer.aCris_pdUniversal` (universal-property): Initial among p-adically complete PD-thickenings of O_Cp with compatible PD on (p).
- `TauCeti.Selmer.bCris_toBDR` (coercion): Injective Galois-compatible period map.
- `TauCeti.Selmer.bCris_frobenius` (structure): σ-semilinear Frobenius, commuting with G_K and sending t to pt.
- `TauCeti.Selmer.bCris_generatorIndependent` (equivalence): Changing ξ or a primitive Tate generator gives the canonical same ring.

**Discriminating tests.**

- `TauCeti.Selmer.Tests.cris_tate` (computation): The logarithmic period is nonzero and φ(t)=pt, not t.
- `TauCeti.Selmer.Tests.cris_theta` (non-example): θ(t)=0 before t is inverted; θ cannot extend as a unital map B_cris→C_p.
- `TauCeti.Selmer.Tests.cris_embedding` (compatibility): The period map to B_dR is injective and respects G_K; a free formal PD variable does not satisfy this comparison.

### Gamma factor and its integer pole order

Target `SelmerIwasawaCohomology:L4/hodge-gamma-factor` · construction.

For a real place, each off-diagonal pair (a,b),(b,a), a<b, contributes Γ_ℂ(s−a) raised to h^(a,b), and the diagonal sign ε contributes Γ_ℝ(s+ε−a) raised to h_a^ε. For a complex place each type (a,b) contributes Γ_ℂ(s−min(a,b)) with its multiplicity. Here Γ_ℝ(s)=π^(−s/2)Γ(s/2), Γ_ℂ(s)=2(2π)^−sΓ(s), already Mathlib definitions. Finite support makes the product finite. At an integer m the pole order is the sum of multiplicities of complex factors with m−min(a,b)≤0 and real factors with m+ε−a a nonpositive even integer. Compare this combinatorial order with the meromorphic continuation, using the analytic reciprocal Gamma function. Mathlib’s totalized values are zero at Gamma poles, so nonzero value is not the definition of a meromorphic pole.

**Hypotheses and conventions.** ArchimedeanRealization and finite support; diagonal eigenspaces in the real case. Products and pole orders include every archimedean place.

**Prerequisites.** `L4/archimedean-realization`.

**Proof plan.**

1. Read Hodge numbers and diagonal eigenspace dimensions from the existing carrier; form the finite list of shifted factors using Deligne Table 5.3.
2. Use the poles and zero-free meromorphic Gamma function, or the zeros of its entire reciprocal, to identify the pole order at integers.
3. Prove direct-sum multiplicativity, Tate-dual shift compatibility and the correspondence with Mathlib Gammaℝ/Gammaℂ off the poles.

**Sources.** [DELIGNE-79], §5.3 and Table 5.3, p. 329. [RJW-PADIC-L], §13.5.3, preprint p. 71.

**API.**

- `TauCeti.Selmer.hodgeGammaFactors` (constructor): Finite multiset of shifted real and complex Gamma factors.
- `TauCeti.Selmer.hodgeGammaFactor` (constructor): Product of the existing Mathlib Gamma factors off their pole set.
- `TauCeti.Selmer.gammaPoleOrder` (projection): Weighted integer pole count for the derived multiset.
- `TauCeti.Selmer.gammaFactor_sum` (compatibility): Direct sum multiplies factors and adds pole orders.
- `TauCeti.Selmer.gammaPoleOrder_analytic` (characterisation): Pole count equals the meromorphic order, using reciprocal Gamma at totalized zeros.

**Discriminating tests.**

- `TauCeti.Selmer.Tests.gamma_zero` (degenerate): Zero realization gives product 1 and pole order 0.
- `TauCeti.Selmer.Tests.gamma_tate` (computation): The Tate type (n,n), sign (-1)^n gives Γ_ℝ(s−n).
- `TauCeti.Selmer.Tests.gamma_real_sign` (non-example): Weight-zero real sign + gives Γ_ℝ(s), sign − gives Γ_ℝ(s+1); their pole orders at 0 differ.
- `TauCeti.Selmer.Tests.gamma_elliptic` (compatibility): A real weight-one structure with h^(0,1)=h^(1,0)=1 gives Γ_ℂ(s), counted once rather than twice.

### The closed-unit and class-group exact sequence

Target `SelmerIwasawaCohomology:L4/unit-class-exact-sequence` · theorem.

In the cyclotomic plus tower with the objects of arithmetic-tower-data, 0→E∞,1^+→U∞,1^+→X∞^+→Y∞^+→0 is exact. For any closed Λ-submodule C∞,1^+⊆E∞,1^+, quotienting gives 0→E∞,1^+/C∞,1^+→U∞,1^+/C∞,1^+→X∞^+→Y∞^+→0. In particular ker(X∞^+→Y∞^+)≃U∞,1^+/E∞,1^+, with the quotient in that direction. The inverse-limit surjectivity is proved from the compatible compact finite-level exact sequences, by compact inverse-limit exactness or finite-quotient limits and their derived coefficient comparison. No Mittag–Leffler assertion for the full lattice tower is made; surjectivity is not automatic for arbitrary noncompact towers. The image E_n,1 is a closure; equality with the abstract completed unit lattice requires the separate Leopoldt assertion.

**Hypotheses and conventions.** p odd; actual finite-level reciprocity maps and cyclotomic ramification; C closed and contained in E. This comparison constructs no cyclotomic units.

**Prerequisites.** `L4/arithmetic-tower-data`, `L0/roots-of-unity-mittag-leffler`, `ArithmeticGaloisDuality:R02.1/mittag-leffler-lim-one`.

**Proof plan.**

1. Use finite-level global reciprocity to identify the kernel of the p-ramified-to-unramified map with local principal units modulo closed global units.
2. Prove compatible compactness and exactness at finite level; use exactness of compatible compact inverse limits, then take plus idempotents. Alternatively justify finite-quotient Mittag–Leffler and the derived coefficient comparison, without asserting Mittag–Leffler for the entire lattice tower.
3. Apply the quotient exact sequence for C⊆E⊆U and check the quotient orientation in the reciprocity kernel.

**Sources.** [RJW-PADIC-L], Proposition 13.13 and Corollary 13.14, preprint pp. 67–68 (published pp. 195–196).

**Discriminating tests.**

- `TauCeti.Selmer.Tests.unit_sequence_c_zero` (degenerate): C=0 gives the original unit/class-group sequence.
- `TauCeti.Selmer.Tests.unit_sequence_c_e` (compatibility): C=E gives 0→0→U/E→X→Y→0.
- `TauCeti.Selmer.Tests.unit_sequence_direction` (non-example): E⊆U, so U/E is defined while E/U is not; this rejects the reversed printed quotient.

### The Gamma factor, r_V and criticality

Target `SelmerIwasawaCohomology:L4/criticality` · definition.

For explicit archimedean realization data attached to L(V,s), define r_V=gammaPoleOrder(V,1) from hodge-gamma-factor. Define Greenberg criticality by r_V=r_(V*(1))=0, using the Tate-dual Hodge types and real signs from archimedean-realization. For ℚ_p(n), r_V is one exactly for positive odd n, and the dual is ℚ_p(1−n); consequently the critical integers are positive even n or negative odd n. At n=0 the dual factor has a pole, so n=0 is not critical. Criticality is a computed predicate, not a supplied Boolean or Gamma factor.

**Hypotheses and conventions.** A finite-dimensional Hodge realization and its comparison to the chosen L-function convention, together with the compatible Tate-dual realization.

**Prerequisites.** `L4/hodge-gamma-factor`, `L4/archimedean-realization`.

**Proof plan.**

1. Apply Deligne’s Hodge/sign recipe and its proven integer pole count.
2. Apply the Tate-dual transformation to compute the second order.
3. For Tate types, the real factor gives poles at n,n−2,…; evaluate at 1 for n and 1−n to obtain the exact parity table.

**Sources.** [RJW-PADIC-L], §13.5.3, pp. 71–72 (arXiv v2), with Remark 13.23; published pp. 197–198.

**API.**

- `TauCeti.Selmer.gammaFactor` (data): L_∞(V,s) computed from the explicit Hodge/sign realization by hodge-gamma-factor, in the chosen L-function convention.
- `TauCeti.Selmer.poleOrderAtOne` (constructor): r_V, the order of the pole of L_∞(V, s) at s = 1.
- `TauCeti.Selmer.tateDual` (constructor): V^∨ = Hom_cts(V, ℚ_p(1)).
- `TauCeti.Selmer.IsGreenbergCritical` (constructor): r_V = 0 and r_{V^∨} = 0.
- `TauCeti.Selmer.poleOrderAtOne_tateTwist` (simp): r_{ℚ_p(n)} = 1 if n is odd and positive, 0 otherwise.
- `TauCeti.Selmer.isGreenbergCritical_tateTwist_iff` (characterisation): ℚ_p(n) is critical iff n is even and positive or odd and negative.

**Discriminating tests.**

- `twist_two` (computation): n = 2: r_V = r_{V^∨} = 0, so ℚ_p(2) is critical.
- `twist_zero` (non-example): n = 0: r_{ℚ_p(1)} = 1, so ℚ_p is not critical, although Theorem 13.8 is its main conjecture (Remark 13.23).
- `twist_one` (non-example): n = 1: r_{ℚ_p(1)} = 1 (the pole of Γ(s/2 − 1/2) at s = 1).
- `twist_minus_one` (computation): n = −1: critical (odd and negative).
- `parity_table` (computation): For −6 ≤ n ≤ 6, criticality agrees with the parity rule (suggested file).

**Acceptance.** This is Greenberg's Gamma-factor notion; it agrees with Deligne's criticality for Tate twists (L(ℚ_p(n), 1) = ζ(1 − n) and L(ℚ_p(n)^∨, 1) = ζ(n) both critical).

### Fundamental period sequences with continuous sections

Target `SelmerIwasawaCohomology:L4/period-fundamental-sequences` · theorem.

The following G_K-equivariant sequences are exact: 0→ℚ_p→B_cris^(φ=1)⊕B_dR^+→B_dR→0, with diagonal first map and difference last map; and 0→ℚ_p→B_cris⊕B_dR^+→B_cris⊕B_dR→0 with (x,y)↦((1−φ)x,x−y). Tensoring with a finite-dimensional continuous V gives the continuous-cohomology LES because the quotient maps admit continuous nonequivariant sections on the canonical topologies. Supply the boundary map D_dR(V)/Fil⁰→H¹(K,V) and its compatibility with coefficient/twist maps. A merely algebraically exact sequence is not enough for this LES.

**Hypotheses and conventions.** Canonical period topologies; finite-dimensional V; the AGD cochain interface extended to these topological coefficients with continuous-section exactness.

**Prerequisites.** `L4/crystalline-period-ring`, `ArithmeticGaloisDuality:R02.1/continuous-section-long-exact`, `ArithmeticGaloisDuality:R02.1`.

**Proof plan.**

1. Prove B_cris^(φ=1)∩B_dR^+=ℚ_p and surjectivity of 1−φ using divided-power Frobenius estimates.
2. Use Bloch–Kato Lemma 1.17.3: logarithms of lifted roots span the successive de Rham quotients and provide the required Frobenius eigenvectors; deduce difference-map surjectivity.
3. Construct the continuous sections as in Remark 1.18 and apply the supplier continuous-section LES after tensoring with V.

**Sources.** [BLOCH-KATO-90], Proposition 1.17, Lemma 1.17.3 and Remark 1.18, pp. 340–341.

### Period fixed fields and dimension bounds

Target `SelmerIwasawaCohomology:L4/period-fixed-fields` · theorem.

For finite K/ℚ_p, (B_dR^+)^G_K=B_dR^G_K=K and B_cris^G_K=K₀. The invariant comparison maps for finite-dimensional V are injective, yielding dim_K D_dR(V)≤dim_ℚp V and dim_K₀ D_cris(V)≤dim_ℚp V. For B_dR use its filtration and the Tate C_p(i) cohomology calculation; for B_cris use the divided-power expansions and Frobenius structure. These are minimal period facts moved down to L4.

**Hypotheses and conventions.** Finite K; canonical topologies and embeddings. The fixed-field theorem for C_p and its twisted cohomology is a separate local-field supplier request.

**Prerequisites.** `L4/cp-period-comparison`, `L4/crystalline-period-ring`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-1-units-the-filtration-and-the-multiplicative-group`.

**Proof plan.**

1. Import the Tate–Sen calculation of H⁰ and H¹(G_K,C_p(i)) with its exact range and coefficient conventions.
2. Use the Tate C_p(i) calculation on de Rham filtration quotients and their completed limit (Fontaine Exposé II 1.5.7). For the crystalline fixed field use injectivity of K⊗K₀ B_cris→B_dR: the two copies of K₀ are precisely the intersection of the scalar copies of K and B_cris (Exposé III 5.1.2).
3. For B_dR use the minimal-dependence argument. For B_cris transfer injectivity through the scalar extension embedding and prove regularity using Exposé III 5.1.3’s classification of Galois-stable one-dimensional period lines. Its invertibility statement, not mere injectivity, gives the dimension-equality criterion.

**Sources.** [FONTAINE-94], §1.5.7, p. 74; §4.1, pp. 83–84. [FONTAINE-REP-94], Proposition 1.4.2, pp. 123–124; Proposition 5.1.2 and Lemma 5.1.3, pp. 155–156. [NIZIOL-93], §2, pp. 749–750.

### Small-weight filtered Frobenius modules

Target `SelmerIwasawaCohomology:L4/fontaine-laffaille-data` · definition.

For K₀/ℚ_p finite unramified, W=O_K₀ and p>2, an integral Fontaine–Laffaille object has a finite W-module M, an exhaustive separated decreasing filtration Fil^i M and σ-semilinear maps φ_i:Fil^i M→M satisfying φ_i|Fil^(i+1)=p φ_(i+1), with Σ_i im φ_i=M. In the free case each filtration step is a direct summand. Restrict to a weight interval [a,b] of width ≤p−2, and form morphisms preserving the filtration and all φ_i. Use the covariant convention of Nizioł §2; translating Fontaine–Laffaille’s contravariant Hom realization requires a dual. For torsion exactness use the abelian enlarged category with separate filtration modules and their inclusion maps, not an assertion that the entire category of all filtered modules is abelian.

**Hypotheses and conventions.** K₀ unramified; small weights; integral and torsion coefficient variants distinguished. The Tate representation ℤ_p(1) has weight −1.

**Prerequisites.** `L4/crystalline-period-ring`.

**Proof plan.**

1. Define the finite module, filtration, divided Frobenius maps and morphisms on native module carriers.
2. Embed in the category of diagrams with separate filtration modules as Fontaine–Laffaille §1.11; establish exactness on strongly divisible torsion objects.
3. Give induced direct sums, interval restriction, allowed tensor/dual operations and the scalar-forgetting convention.

**Sources.** [FONTAINE-LAFFAILLE-82], §§0.4–0.6, pp. 550–551; §1.11, pp. 558–559; §§7.12–7.15, pp. 593–594. [NIZIOL-93], §2, pp. 750–751.

**API.**

- `TauCeti.Selmer.FontaineLaffailleModule` (constructor): Finite filtered W-module with compatible generating divided Frobenius maps.
- `TauCeti.Selmer.FontaineLaffailleHom` (constructor): Filtration- and Frobenius-preserving linear maps.
- `TauCeti.Selmer.fontaineLaffaille_sum` (structure): Direct sums and their divided Frobenius maps.
- `TauCeti.Selmer.fontaineLaffaille_interval` (characterisation): The explicit interval support predicate.
- `TauCeti.Selmer.fontaineLaffaille_dual` (functoriality): Dual/twist shifts the interval according to the weight convention.

**Discriminating tests.**

- `TauCeti.Selmer.Tests.fl_zero` (degenerate): The zero module with zero filtration is an object in every allowed interval.
- `TauCeti.Selmer.Tests.fl_rank_one` (non-example): The rank-one weight-zero object has Fil⁰=M, Fil¹=0 and unit Frobenius; omitting generation would admit φ₀=0.
- `TauCeti.Selmer.Tests.fl_range` (non-example): A tensor product with combined width >p−2 is not covered by the small-weight comparison theorem.

### Leopoldt and the strict-at-p Tate Selmer group

Target `SelmerIwasawaCohomology:L4/leopoldt-selmer` · theorem.

For a number field F and W*=ℚ_p/ℤ_p(1), choose the Selmer condition strict at every p-adic place and the propagated finite condition away from p. The resulting Selmer group is finite iff the p-adic unit localization map O_F^×⊗ℤ_p→⊕_(v|p) completed O_Fv^× has rank r₁+r₂−1 (Leopoldt). For a finite character χ of prime-to-p order, the corresponding χ-component is finite when Leopoldt holds for its splitting field; use the character idempotent only under the prime-to-p hypothesis. This is a statement/equivalence, not a proof of Leopoldt for all number fields.

**Hypotheses and conventions.** Finite F; p-primary coefficient and local conditions specified. The strict p condition cannot be replaced by relaxed or the full finite unit condition.

**Prerequisites.** `L0/s-unit-kummer-identification`, `L4/unit-class-exact-sequence`, `L2/selmer-kernel`.

**Proof plan.**

1. Use global Kummer and the finite class group to write the exact unit/class-group Selmer sequence.
2. Strictness at p cuts out the kernel of the unit localization map; its corank is precisely the Leopoldt rank defect.
3. The remaining class-group and finite torsion terms are finite. For χ use the prime-to-p idempotent and apply the same argument to the splitting field.

**Sources.** [RUBIN-ES], Corollary I.6.4, p. 16; Remark II.2.7, p. 25.

**Discriminating tests.**

- `TauCeti.Selmer.Tests.leopoldt_q` (computation): For ℚ the unit rank is zero and the strict Selmer group is finite.
- `TauCeti.Selmer.Tests.leopoldt_wrong_local` (non-example): Relaxing p admits local unit Kummer classes and no longer expresses the same rank-defect kernel.
- `TauCeti.Selmer.Tests.leopoldt_character_degree` (non-example): If p divides the character group order, its integral averaging idempotent is unavailable.

### The Iwasawa–Greenberg main conjecture (as a proposition)

Target `SelmerIwasawaCohomology:L4/greenberg-main-conjecture` · definition.

For a p-ordinary G_ℚ-representation V with saturated G_{ℚ_p}-stable filtration, stable global lattice T and A=V/T, explicit archimedean realization and a specified analytic p-adic L-function L_p(V) in Frac Λ(Γ^+), state Greenberg’s proposition: corank_Λ Sel_Gr(F∞^+,A)=r_V; and, if V is critical, its torsion dual has characteristic ideal (L_p(V)). If L_p(V) is only a fraction, equality is an equality of fractional ideals with the integral characteristic ideal, and hence asserts integrality of that ideal. The datum carries the normalization/interpolation hypothesis appropriate to V; no general existence theorem is asserted. Positive corank leads to a determinant/leading-term proposition with a regulator trivialization, not this rank-zero characteristic-ideal equation.

**Hypotheses and conventions.** V p-ordinary at p (Greenberg filtration, stable under G_{ℚ_p}; see E2); L_p(V) is supplied data.

**Prerequisites.** `L2/greenberg-condition`, `L2/galois-selmer-group`, `L2/corank`, `L2/pontryagin-dual`, `L4/criticality`, `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal`, `PadicMeasuresIwasawaAlgebras:L4/character-decomposition`.

**Proof plan.**

1. Definitions only: (i) uses the corank (L2/corank) and (ii) the characteristic ideal of a finitely generated torsion Λ(Γ^+)-module (PadicMeasuresIwasawaAlgebras L4, with the isotypic decomposition over Λ(Γ^+)).

**Sources.** [RJW-PADIC-L], §13.5.3, Conjecture 13.21, p. 71 (arXiv v2); published p. 197.

**API.**

- `TauCeti.Selmer.PadicLFunctionDatum` (structure): An element L_p(V) of Frac Λ(Γ^+), recorded as data with its conjectural interpolation.
- `TauCeti.Selmer.GreenbergCorankConjecture` (constructor): Proposition (i): corank_{Λ(Γ^+)} H^1_{L^Gr}(F, W) = r_V.
- `TauCeti.Selmer.GreenbergCharIdealConjecture` (constructor): Proposition (ii): r_V = r_{V^∨} = 0 → char(H^1_{L^Gr}(F, W)^∨) = (L_p(V)).
- `TauCeti.Selmer.GreenbergMainConjecture` (constructor): The conjunction of (i) and (ii).
- `TauCeti.Selmer.greenbergCharIdealConjecture_of_not_critical` (relation): (ii) holds vacuously when V is not critical.

**Discriminating tests.**

- `even_twist` (computation): V = ℚ_p(n), n even > 0: (ii) is the twisted Iwasawa main conjecture (greenberg-conjecture-tate-twists).
- `trivial_rep` (non-example): V = ℚ_p: r_{V^∨} = 1, so (ii) says nothing, although Theorem 13.8 is proved (Remark 13.23).
- `not_a_theorem` (non-example): At the torsion ideal-comparison interface over Λ=O[[T]], X=Λ/(f) with f≠0 has characteristic ideal (f). The predicate with supplied element f is true, whereas the predicate with pf is false, since p is a nonunit. A unit multiple of f preserves the predicate. Thus supplying an element does not make the ideal assertion automatic.
- `lattice_independence` (non-example): Changing the lattice preserves rationalized Iwasawa cohomology and corank. Its integral finite-coefficient tower errors need not be finite Λ-modules; a Λ/(p) error changes a height-one characteristic divisor. Do not assert integral characteristic-ideal independence without a proved error cancellation.

**Acceptance.** The rank-zero characteristic-ideal statement (ii) and any positive-rank leading-term statement are distinct propositions; only (i) and (ii) are stated. RJW state the conjecture over F = ℚ(μ_{p^∞})^+, not over the cyclotomic ℤ_p-extension used by Greenberg (their Remark 13.9).

### Crystalline and de Rham realization data

Target `SelmerIwasawaCohomology:L4/period-realization` · definition.

For a finite-dimensional continuous G_K-representation V define D_cris(V)=(V⊗B_cris)^G_K over K₀ and D_dR(V)=(V⊗B_dR)^G_K over K, with inherited Frobenius and filtration. Define crystalline and de Rham by equality of their dimension with dim_ℚp V, together with the canonical comparison-map isomorphism formulation. Crystalline implies de Rham. Hodge–Tate weight −1 is the convention for ℚ_p(1). This p-adic realization is independent of the archimedean Hodge carrier.

**Hypotheses and conventions.** Finite K/ℚ_p; continuous period tensor action and its invariants. Include the coefficient extension for E/ℚ_p by scalar restriction, not an unspecified Frobenius-linear E-action.

**Prerequisites.** `L4/crystalline-period-ring`, `L4/period-fixed-fields`.

**Proof plan.**

1. Take invariants of the actual period tensor modules; restrict the structures and define the comparison maps.
2. Use the period-ring regularity and fixed-field results to bound dimensions and prove equality iff the canonical comparison map is an isomorphism.
3. Use the embedding K⊗K₀ B_cris→B_dR to prove crystalline implies de Rham and compute the Tate generators t^−n.

**Sources.** [NIZIOL-93], §2, pp. 748–751. [BLOCH-KATO-90], §1, pp. 337–340.

**API.**

- `TauCeti.Selmer.dCris` (constructor): Period tensor invariants over K₀.
- `TauCeti.Selmer.dDeRham` (constructor): Period tensor invariants over K with filtration.
- `TauCeti.Selmer.IsCrystalline` (constructor): The canonical B_cris comparison map is an isomorphism.
- `TauCeti.Selmer.IsDeRham` (constructor): The canonical B_dR comparison map is an isomorphism.
- `TauCeti.Selmer.crystalline_iff_dim` (characterisation): Dimension equality characterizes crystalline representations.
- `TauCeti.Selmer.crystalline_isDeRham` (relation): Crystalline implies de Rham via the canonical embedding.

**Discriminating tests.**

- `TauCeti.Selmer.Tests.realization_zero` (degenerate): The zero representation is crystalline and de Rham with zero realization.
- `TauCeti.Selmer.Tests.realization_tate` (computation): D_cris(ℚ_p(n)) is generated by t^−n, Frobenius p^−n and filtration jump −n.
- `TauCeti.Selmer.Tests.realization_scalar` (non-example): For ramified K, D_cris is a K₀-space while D_dR is a K-space; identifying their scalar rings is wrong.

### Equivalence of the critical Tate-twist main-conjecture propositions

Target `SelmerIwasawaCohomology:L4/greenberg-conjecture-tate-twists` · theorem.

For n positive even, the Tate Selmer dictionary identifies its compact dual with X∞^+(−n). The specified analytic element is the corresponding nth twist of Kubota–Leopoldt. By the characteristic-ideal twist automorphism, Greenberg’s rank-zero ideal proposition for ℚ_p(n) is equivalent to the cyclotomic main-conjecture proposition char X∞^+=(the normalized zeta element). This node proves the equivalence of propositions, not the cyclotomic main-conjecture theorem. Its corank assertion is equivalent to torsion of X∞^+. The n=0 case remains excluded by criticality of the Tate dual.

**Hypotheses and conventions.** p odd; F_∞ = ℚ(μ_{p^∞}), F = F_∞^+ = ℚ(μ_{p^∞})^+, Gal(F_∞/F) = {1, c}; K_∞^+ denotes the finite-level local tower; χ is the cyclotomic character, T_n = ℤ_p(n), V_n = ℚ_p(n), W_n = (ℚ_p/ℤ_p)(n); X_∞ = Gal(M_∞/F_∞) and Y_∞ = Gal(L_∞/F_∞) for the maximal abelian pro-p extensions unramified outside p and everywhere unramified, with X_∞^+ = Gal(M_∞^+/F_∞^+) (arithmetic-tower-data).

**Prerequisites.** `L4/tate-twist-greenberg-selmer`, `L4/criticality`, `L4/greenberg-main-conjecture`, `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal`, `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal-api-7`.

**Proof plan.**

1. Use the explicit plus/Tate-dual dictionary, including the contragredient Λ action.
2. Transport the characteristic ideal along the twist automorphism and compare the supplied analytic twist.
3. State the equivalence in both directions; no higher-tier main-conjecture result is a prerequisite.

**Sources.** [RJW-PADIC-L], §13.5.3, Example 13.22 and Remark 13.23, pp. 71–72 (arXiv v2); published pp. 197–198.

**Acceptance.** This is the acceptance item "RJW §13.5" of the stage: the even-positive restriction is proved from the parity table, and n = 0 is excluded as the source says.

### The Bloch–Kato local condition on T and W

Target `SelmerIwasawaCohomology:L4/bloch-kato-condition` · construction.

For finite K/ℚ_p define H¹_f(K,V)=ker[H¹(K,V)→H¹(K,V⊗B_cris)] on the canonical continuous cochain carrier, with the period topology. Define the T-condition by inverse image and the A=V/T condition by image. Away from p use the unramified rational condition and its propagated lattice/discrete conditions; the raw unramified condition on a finite quotient may differ. Give coefficient, restriction and duality compatibility. For de Rham V, the fundamental sequences give the exponential/finiteness exact fragments; for crystalline V, 0→H⁰(K,V)→D_cris(V)→D_cris(V)⊕D_dR(V)/Fil⁰→H¹_f(K,V)→0, with x↦((1−φ)x,x mod Fil⁰). Thus dim H¹_f=dim(D_dR/Fil⁰)+dim H⁰. Values on ℚ_p and ℚ_p(1) are respectively unramified classes and Kummer completed-unit classes.

**Hypotheses and conventions.** Finite K/ℚ_p and finite-dimensional continuous V with stable lattice T; finite-condition definition makes sense generally, the realization exact sequence is asserted with crystalline/de Rham hypotheses as specified.

**Prerequisites.** `L4/period-realization`, `L4/period-fundamental-sequences`, `L2/condition-propagation`, `L0/padic-kummer-identification`, `ArithmeticGaloisDuality:R02.1`.

**Proof plan.**

1. Use crystalline-period-ring and the AGD topological coefficient interface to form the kernel.
2. Tensor the period-fundamental-sequences with V and take the continuous-cohomology LES; identify the invariants and its finite-kernel fragment.
3. Propagate through T→V→A, then compute Tate examples through Kummer and local units. Apply local Tate duality for the exact finite-condition annihilator.

**Sources.** [BLOCH-KATO-90], §3.7, Proposition 3.8, Corollary 3.8.4 and Example 3.9, pp. 352–359. [RJW-PADIC-L], Definition 13.19(2), preprint p. 70.

**API.**

- `TauCeti.Selmer.blochKatoCondition` (constructor): L^BK_v on W as the image of H^1_f(F_v, V).
- `TauCeti.Selmer.blochKatoCondition_T` (constructor): The preimage on T.
- `TauCeti.Selmer.blochKatoStructure` (constructor): The structure uses finite period conditions at p, unramified rational conditions away from p, and their image/preimage propagation on A/T. Raw finite-coefficient unramified conditions may differ.
- `TauCeti.Selmer.blochKatoCondition_eq_propagate` (compatibility): Agreement with L2/condition-propagation applied to H^1_f.

**Discriminating tests.**

- `trivial_coefficients` (computation): V = ℚ_p: H^1_f(F_v, ℚ_p) = H^1_ur(F_v, ℚ_p), so L^BK is the image of the unramified classes.
- `tate_twist_one` (computation): V = ℚ_p(1): H^1_f(F_v, ℚ_p(1)) is the image of 𝒪_{F_v}^× ⊗ ℚ_p under Kummer (Bloch–Kato), so L^BK on W is the image of the units.
- `not_greenberg_in_general` (non-example): The Bloch–Kato and Greenberg conditions differ by exceptional factors in general; only their coincidence in special cases is recorded (Remark 13.20).

**Acceptance.** The comparison with Greenberg's condition (Kato; Perrin-Riou §2.4.7) is not read and is listed as remaining; no universal equality is asserted.

### Small-weight crystalline realization and extension exactness

Target `SelmerIwasawaCohomology:L4/fontaine-laffaille-comparison` · theorem.

On the small-weight category over an unramified p-adic field, the covariant period realization gives an exact fully faithful functor to finite ℤ_p-Galois modules whose essential image is the torsion crystalline representations of the specified interval. For free objects pass to the inverse limit of the mod-p^m realizations; the resulting free lattice has the same rank and its rationalization is crystalline. The reverse functor is the filtered Frobenius module inside the crystalline tensor invariants, and the two maps are canonical inverse comparisons. Tensor/dual compatibility holds only when the combined interval remains in the permitted range.

**Hypotheses and conventions.** p>2; interval width ≤p−2; Nizioł’s covariant normalization. Endpoint width p−1 needs extra nilpotence/unipotence hypotheses and is outside this target.

**Prerequisites.** `L4/fontaine-laffaille-data`, `L4/period-realization`.

**Proof plan.**

1. Construct the Hom period realization and dualize to the chosen covariant convention.
2. Reduce exactness and rank to simple residual filtered objects and solve the divided Frobenius equations in the period ring; descend from an algebraically closed residue field.
3. Use the evaluation map and Fontaine–Laffaille §6.1 full faithfulness after excluding the endpoint; take mod-p^m limits and identify rational period invariants by §§7.15–8.5.

**Sources.** [FONTAINE-LAFFAILLE-82], Theorem 3.3 and proof §§3.5–3.10, pp. 562–564; Theorem 6.1, pp. 581–583; Propositions 7.15 and 7.17, pp. 593–594; Theorem 8.4 and Remark 8.5, pp. 595–596. [NIZIOL-93], §2, pp. 750–751.

### Positive-rank determinant formulation as a separate proposition

Target `SelmerIwasawaCohomology:L4/positive-rank-leading-term` · definition.

Specify O a complete DVR with fraction field E, a perfect integral Selmer complex C, a specialization χ, a parameter u at χ, a series f(u)∈E[[u]], and r=dim_E H¹(C⊗^L_χ E)>0. A supplied nondegenerate regulator, with its normalization, must induce an actual line equivalence θ_reg:𝔇(C⊗^L_χ O)⊗E≃E; for each retained perfect local correction E_v supply the corresponding line trivialization. Let J be the product of θ_reg(𝔇(C⊗^L_χ O)) and the local-error fractional lattices, with the inverse-determinant convention of L3. Define the proposed leading-term assertion by f_k=0 for k<r, f_r≠0 and O·f_r=J. Record the regulator construction as input, not an unconstrained asserted equality. Specialization rank r is distinct from generic Λ-corank. This is an explicitly proposed arithmetic schema, not a claim that RJW Conjecture 13.21(ii) states it or that a non-torsion module has a characteristic ideal.

**Hypotheses and conventions.** Perfectness, specialization, chosen parameter, analytic series and actual regulator/line maps. All determinant factors are defined before the assertion. No existence of these analytic/regulator data is asserted.

**Prerequisites.** `L3/selmer-determinant`, `L3/correction-complex`, `L4/greenberg-main-conjecture`.

**Proof plan.**

1. Use the L3 determinant line without a canonical scalar trivialization in positive rank.
2. Specify the regulator-induced comparison of generic determinant lines and the specialized exterior powers.
3. Define equality of the resulting fractional lattices with the analytic leading coefficient, including order and local factors.

**Sources.** [RJW-PADIC-L], Conjecture 13.21(ii) and Remark 13.24, preprint pp. 71–72. [NEKOVAR-SC], §§8.9–8.10, pp. 238–251.

**API.**

- `TauCeti.Selmer.LeadingTermData` (constructor): Actual perfect complex, parameterized analytic series, specialized rank and regulator line equivalences.
- `TauCeti.Selmer.LeadingTermStatement` (constructor): Coefficients below r vanish, coefficient r is nonzero and its principal fractional lattice equals the defined determinant product.
- `TauCeti.Selmer.leadingTerm_changeTrivialization` (compatibility): Scaling the regulator equivalence by a∈Eˣ scales J by a; an O-unit leaves its fractional ideal unchanged.
- `TauCeti.Selmer.leadingTerm_reparameterize` (compatibility): For u′=a u plus higher terms, a∈Oˣ, the leading coefficient scales by a^−r and its fractional lattice is unchanged.

**Discriminating tests.**

- `TauCeti.Selmer.Tests.leading_rank_zero` (compatibility): For generically acyclic C the regulator input reduces to the L3 torsion determinant convention.
- `TauCeti.Selmer.Tests.leading_zero_regulator` (non-example): A degenerate regulator cannot give a determinant trivialization.
- `TauCeti.Selmer.Tests.leading_local_factor` (non-example): Deleting a nonunit local-error determinant changes the leading-term lattice.

### Integral crystalline modules and nonsingular extensions

Target `SelmerIwasawaCohomology:L4/torsion-crystalline-condition` · definition.

For unramified K/ℚ_p, call a finite ℤ_p-module R crystalline in [a,b] if it is a quotient R″/R′ of stable lattices in a crystalline rational representation with weights in [a,b]. A finite-type integral module is crystalline if every R/p^mR is so; for O-coefficients apply the underlying ℤ_p-module functor. If a≤0≤b, define H¹_ns(K,R) as extension classes 0→R→R_s→ℤ_p→0 whose middle term is crystalline in that interval. The extension set is an O-submodule. It is not defined by a nonexistent tensor R⊗B_cris, which would be zero for finite p-torsion R.

**Hypotheses and conventions.** K unramified and coefficient weight conventions fixed; weights of ℚ_p(1) are −1. Scalar restriction precedes the crystalline test.

**Prerequisites.** `L4/period-realization`, `L4/fontaine-laffaille-comparison`, `ArithmeticGaloisDuality:R02.1/continuous-section-long-exact`.

**Proof plan.**

1. Define the quotient-lattice and all-reductions predicates with genuine Galois representations.
2. Use continuous Ext¹/cohomology to identify classes with extensions and pull back the crystalline extension predicate.
3. Use the exact small-weight filtered-module category to prove the submodule and functoriality properties, with the interval hypotheses where required.

**Sources.** [LIU-ETAL-22], Definitions 2.2.4–2.2.5, pp. 124–125.

**API.**

- `TauCeti.Selmer.IsTorsionCrystalline` (constructor): Stable-lattice quotient with bounded crystalline weights.
- `TauCeti.Selmer.IsIntegralCrystalline` (constructor): All finite p-power reductions satisfy the torsion predicate.
- `TauCeti.Selmer.crystallineNonsingular` (constructor): Submodule of cohomology represented by crystalline extensions.
- `TauCeti.Selmer.crystallineNonsingular_map` (functoriality): Compatible coefficient maps induce the extension-class map.
- `TauCeti.Selmer.crystallineNonsingular_scalarRestriction` (compatibility): O-coefficient predicate agrees with the underlying ℤ_p predicate.

**Discriminating tests.**

- `TauCeti.Selmer.Tests.torsion_crys_zero` (degenerate): Zero is crystalline and has zero nonsingular extension group.
- `TauCeti.Selmer.Tests.torsion_crys_tate` (computation): ℤ/p^m(1) is crystalline in any permitted interval containing −1.
- `TauCeti.Selmer.Tests.torsion_crys_not_tensor` (non-example): R⊗ℚ_p B_cris=0 for finite R; using that as the definition would declare every extension finite and lose the crystalline condition.

### Finite versus ordinary local conditions with explicit exceptional terms

Target `SelmerIwasawaCohomology:L4/ordinary-finite-comparison` · comparison.

For a de Rham ordinary V with saturated G_K-stable V^+ and V^−, compare L_f=H¹_f(K,V), L_str=im H¹(K,V^+) and L_Gr=ker[H¹(K,V)→H¹(I_K,V^−)]. Use the coefficient LES, the finite-period exact sequence and L1 ordinary-annihilator-correction to calculate L_str/(L_str∩L_f), L_f/(L_str∩L_f), and L_Gr/L_str=im H¹(K,V)→H¹(K,V^−) ∩ H¹_ur(K,V^−). The first two are measured by the kernel/cokernel of the induced finite-period maps and the H⁰ coefficient boundary; the third is the displayed unramified quotient. Under the separate vanishings H¹_f(K,V^+)=H¹(K,V^+), H¹_f(K,V^−)=0 and exactness of the finite-extension sequence, L_f=L_str; under zero unramified intersection L_str=L_Gr. Verify these conditions in each arithmetic example, retaining φ=1, Fil⁰ and H⁰ factors when they fail.

**Hypotheses and conventions.** Finite K/ℚ_p; de Rham coefficient sequence and compatible finite-period complexes. No universal equality of Bloch–Kato and Greenberg conditions is assumed. Infinite-level comparison uses the limits and correction-complex, not a period ring at an infinite local field.

**Prerequisites.** `L4/bloch-kato-condition`, `L4/period-fundamental-sequences`, `L1/ordinary-annihilator-correction`, `L2/lattice-change-cone`, `L3/correction-complex`.

**Proof plan.**

1. Write the H⁰/H¹ coefficient LES and the two finite-period exact sequences as a commuting diagram.
2. Compute the two intersections and their quotient kernels/cokernels by the snake lemma, preserving the boundary and (1−φ)/Fil⁰ maps.
3. Combine with the inertia/unramified quotient of L1. When every displayed defect vanishes conclude equality; otherwise propagate each actual defect through T→V→A and the tower.

**Sources.** [BLOCH-KATO-90], §3.7–3.8, pp. 352–359. [RJW-PADIC-L], Remark 13.20, preprint p. 70. [NEKOVAR-SC], §6.7, pp. 151–154.

**Discriminating tests.**

- `TauCeti.Selmer.Tests.ordinary_trivial` (non-example): For V=ℚ_p, V^+=0, L_str=0 but L_f=L_Gr=H¹_ur is one dimensional.
- `TauCeti.Selmer.Tests.ordinary_tate_one` (non-example): For V=ℚ_p(1), V^+=V, L_str=L_Gr=H¹, while L_f consists of unit Kummer classes and omits the valuation line.
- `TauCeti.Selmer.Tests.ordinary_good_elliptic` (compatibility): In the good ordinary elliptic case, the nonexceptional unit-root eigenvalue and local Euler dimensions eliminate the finite/strict defect.

### Elliptic Bloch–Kato and classical Selmer vanishing

Target `SelmerIwasawaCohomology:L4/elliptic-finite-kummer` · comparison.

For E/F and V=V_p E, identify H¹_f(F_v,V) with E(F_v)⊗ℚ_p under Kummer at every finite place; at v∤p this space is zero, and the propagated finite condition on E[p∞] is zero; finite E[p^m] Kummer conditions can still retain Tamagawa contributions. Globally the rational finite Selmer group is (lim_m Sel_(p^m)(E/F), with multiplication-by-p coefficient transitions)⊗ℤpℚ_p, equivalently T_p Sel_(p∞)(E/F)⊗ℤpℚ_p, and H¹_f(F,V)=0 iff the classical p∞ Selmer group is finite (equivalently its ℤ_p-corank is zero). The Weil pairing gives V*(1)≃V, so its Tate-dual finite Selmer group vanishes under the same hypothesis. No finiteness of the full Tate–Shafarevich group is inferred.

**Hypotheses and conventions.** Stable Tate module and upstream finite-level Kummer/Selmer exact sequences. At p the p-adic comparison for the elliptic Kummer map is part of this target, after the minimal period foundations.

**Prerequisites.** `L2/elliptic-selmer-instance`, `L4/bloch-kato-condition`, `L2/selmer-limits`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`.

**Proof plan.**

1. Import the finite-level elliptic Kummer and Selmer/Sha sequences from EllipticCurves Layer 7.
2. Use Bloch–Kato’s abelian-variety Kummer comparison at p and the away-p rational unramified dimension calculation; distinguish rational zero from finite torsion Kummer images.
3. Pass to the Tate-module limit and rationalization; compact Selmer finiteness gives finite rank, so rational zero iff the discrete classical group has corank zero and hence is finite. Apply the Weil pairing for the dual.

**Sources.** [BLOCH-KATO-90], Example 3.11, pp. 359–361. [BURUNGALE-TIAN-26], §3.1, preprint pp. 5–6. [SKINNER-20], §2.2.1, preprint p. 8.

**Discriminating tests.**

- `TauCeti.Selmer.Tests.elliptic_away_p` (non-example): Rational local finite cohomology is zero away from p, but finite p-torsion Kummer images need not be zero.
- `TauCeti.Selmer.Tests.elliptic_dual` (compatibility): The Weil pairing identifies the Tate dual with V, so both rational finite Selmer vanishings are obtained together.
- `TauCeti.Selmer.Tests.elliptic_sha` (non-example): Corank zero implies finiteness of the p-primary Selmer group, not the full Sha group at every prime.
- `TauCeti.Selmer.Tests.elliptic_discrete_tensor` (non-example): The torsion discrete Sel_(p∞) tensor ℚ_p is zero regardless of corank, so it cannot be the rational finite Selmer group.

### Finite-image adjoint Selmer finiteness with descent errors

Target `SelmerIwasawaCohomology:L4/artin-adjoint-finiteness` · theorem.

Let ρ be a finite-image characteristic-zero representation over E with stable lattice, L/F its finite Galois splitting field, and A=ad⁰(ρ)⊗E/O. The finite-condition Selmer group Sel_f(F,A) is finite. Restriction maps it into the everywhere-unramified Hom of the finite p-class group of L with A; the restriction kernel is a subgroup of H¹(Gal(L/F),A), which is finite. This proves finiteness even when p divides [L:F]. A canonical quotient of the class group is not asserted: the actual target is a Galois-equivariant Hom group with finite group-cohomology errors. Under prime-to-p degree and compatible unramified propagated conditions, restriction/invariants give the sharper class-group-Hom identification.

**Hypotheses and conventions.** Finite-image ρ; finite-dimensional ad⁰ and propagated rational finite conditions. Odd irreducible rank-two Artin over ℚ is the source’s worked case; modularity is not needed for the finiteness argument.

**Prerequisites.** `L4/bloch-kato-condition`, `L2/restriction-injective-descent`, `ArithmeticGaloisDuality:R02.2/finite-index-descent`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`.

**Proof plan.**

1. Over L the representation is trivial and its rational finite condition is unramified at every finite place, including p; restriction of propagated finite classes therefore lands in unramified discrete classes.
2. Use global class field theory to factor those classes through Cl_L[p∞], giving a finite Hom group.
3. Inflation–restriction gives the finite kernel: finite group cohomology of a finite-corank E/O module is finite and killed by |Gal(L/F)|. Include these errors when the degree has a p-part.

**Sources.** [CG-APPENDIX-20], §2, preprint p. 4 (published Appendix A §A.2, pp. 883–884).

### Ordinary modular Selmer parity over ℚ and quadratic fields

Target `SelmerIwasawaCohomology:L4/ordinary-selmer-parity` · theorem.

Let f be a cuspidal newform over ℚ of even weight k with trivial nebentypus, λ|p and p odd, ordinary at λ. Put V=V_λ(f)(k/2) in Nekovář’s self-dual convention. For F=ℚ or any quadratic extension of ℚ, dim_(E_λ) H¹_f(F,V) is congruent modulo two to the central analytic order of the base-change L-function. Equivalently its root number is (−1)^(dim H¹_f). In particular one-dimensional finite Selmer over ℚ forces sign −1; odd dimension over an imaginary quadratic field gives the analogous sign required by Skinner. This uses Nekovář Theorem 12.2.3 with base F₀=ℚ, trivial character χ and alternative (1), since [ℚ:ℚ] is odd; the quadratic extension is the permitted 2-abelian extension. No parity theorem for every ordinary representation is asserted.

**Hypotheses and conventions.** An actual modular Galois representation with its self-dual twist and functional equation; p odd and λ-ordinary. The analytic order is finite.

**Prerequisites.** `L4/bloch-kato-condition`, `L1/derived-selmer-duality`, `L2/restriction-injective-descent`.

**Proof plan.**

1. Apply the rational finite Selmer and duality conventions and check the twist normalization against the central L-function.
2. Use the quadratic character decomposition of both cohomology and L-functions; the parity defect is additive (Nekovář §§12.10.1–12.10.2).
3. For ℚ the odd-degree alternative applies. The source’s proof then uses parity in ordinary families and the rank-one Heegner/nonvanishing input in §§12.7–12.10; these proof-level interfaces are recorded as a gap rather than imported from higher-tier families or BSD roadmaps.
4. Translate analytic parity into the root number using the self-dual functional equation.

**Sources.** [NEKOVAR-SC], Theorem 12.2.3 and Remark 12.2.4, pp. 421–422; §§12.10.1–12.10.2, pp. 521–522; §§12.10.8–12.10.9, pp. 526–528.

**Discriminating tests.**

- `TauCeti.Selmer.Tests.parity_one` (computation): A one-dimensional ordinary modular finite Selmer group forces root number −1.
- `TauCeti.Selmer.Tests.parity_two` (computation): Even finite Selmer dimension gives root number +1, without implying rank zero.
- `TauCeti.Selmer.Tests.parity_nonordinary` (non-example): A nonordinary λ is outside this theorem, even when the representation is self-dual.

### Crystalline extensions and the integral finite preimage

Target `SelmerIwasawaCohomology:L4/integral-finite-comparison` · theorem.

Let R be a finite free O-lattice over unramified K/ℚ_p, R[1/p] crystalline with weights [a,b], a≤0≤b and b−a≤p−2. Then H¹_ns(K,R) is exactly the preimage of H¹_f(K,R[1/p]) under H¹(K,R)→H¹(K,R[1/p]). The key lifting criterion is Breuil Proposition 6: a stable free lattice is rationally crystalline in the permitted interval when all its finite p-power reductions are torsion crystalline in that interval. Apply it to the middle term of the extension; width bounds and unramifiedness remain hypotheses.

**Hypotheses and conventions.** The extension has a free middle term; all finite reductions must be tested. No such equivalence is asserted for arbitrary weights or ramified K.

**Prerequisites.** `L4/torsion-crystalline-condition`, `L4/bloch-kato-condition`, `L4/fontaine-laffaille-comparison`.

**Proof plan.**

1. A crystalline integral extension gives a rational crystalline extension, hence a finite rational class by the period exact sequence.
2. For the converse represent a rational finite class by its crystalline rational extension and apply the finite-reduction lattice criterion to the integral middle term.
3. Use the small-weight fully faithful exact realization to identify the reductions; Breuil’s limit argument gives crystalline rational middle term and the prescribed bounded weights.

**Sources.** [BREUIL-99], §2.3, Proposition 6 and Remark 8, p. 465. [LIU-ETAL-22], Lemma 2.2.6, p. 125.

### Finite crystalline annihilators and the inverse different

Target `SelmerIwasawaCohomology:L4/torsion-crystalline-duality` · theorem.

For unramified K/ℚ_p and finite crystalline R with weights a<0≤b and b−a≤(p−2)/2, the nonsingular groups for underlying ℤ_p coefficients are exact annihilators under the finite local Tate pairing. For O-coefficients and the O-linear dual R*=Hom_O(R,E/O), the pairing of H¹_ns(K,R) with H¹_ns(K,R*(1)) takes values in d_(E/ℚp)^−1/O. Thus it vanishes when the different is the unit ideal; it need not vanish in E/O for ramified E. Do not replace this statement with exact O-linear annihilators without a separate hypothesis.

**Hypotheses and conventions.** Finite R; the half-width bound allows the tensor-product crystalline calculation; dual interval is [−b−1,−a−1].

**Prerequisites.** `L4/fontaine-laffaille-comparison`, `L4/torsion-crystalline-condition`, `L1/lattice-pairing-compatibility`, `ArithmeticGaloisDuality:R02.4/global-euler-characteristic`.

**Proof plan.**

1. Use the crystalline extension product to factor the nonsingular cup through crystalline H², which vanishes in this range.
2. Compare lengths of the two filtered modules and their Fil⁰ pieces, then use local Euler characteristic and Tate duality to get exact annihilators over ℤ_p (Nizioł 6.2).
3. Apply coefficient trace. Vanishing of Tr(a·pairing) for every a∈O is precisely membership in the inverse different quotient, yielding Liu 2.2.7.

**Sources.** [NIZIOL-93], Proposition 6.2 and proof, pp. 764–765. [LIU-ETAL-22], Lemma 2.2.7, p. 125.

**Discriminating tests.**

- `TauCeti.Selmer.Tests.different_unramified` (compatibility): For unramified E/ℚ_p the inverse different is O and the value is zero.
- `TauCeti.Selmer.Tests.different_ramified` (non-example): For E=ℚ_p(√p), p odd, d is nonunit and d^−1/O is nonzero; trace-zero values need not be zero.
- `TauCeti.Selmer.Tests.different_width` (non-example): Width p−2 is insufficient for the product proof; the half-width bound is essential.

### Two-primary Selmer parity for congruent-number twists

Target `SelmerIwasawaCohomology:L4/congruent-two-parity` · theorem.

For positive squarefree n let E_n be the smooth elliptic curve n y²=x³−x, equivalently y²=x³−n²x. Then corank_(ℤ₂) Sel_(2∞)(E_n/ℚ) is even for n≡1,2,3 (mod 8) and odd for n≡5,6,7 (mod 8). The other residues are excluded by squarefreeness. This is corank of the infinite Selmer group, not dim_F₂ Sel₂, nor the Mordell–Weil rank without controlling divisible Sha. Match the two models by (X,Y)=(nx,n²y) and identify their Kummer maps. Source route: the p=2 case of Dokchitser–Dokchitser Theorem 4.19 is explicitly attributed there to Monsky; its full proof is a recorded source/refinement gap. The elementary local root-number calculation supplies the congruent-number residue table.

**Hypotheses and conventions.** n>0 squarefree; characteristic zero; the infinite 2-primary Selmer group and corank use the upstream elliptic carrier. No density assertion or Smith distribution theorem is part of this node.

**Prerequisites.** `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`, `L4/elliptic-finite-kummer`.

**Proof plan.**

1. Identify the two curve models and import their finite Selmer/Sha and Kummer systems from EllipticCurves Layer 7.
2. Compute the local root numbers for the full rational two-torsion model, including the real and 2-adic factors; their product is +1 in residues 1,2,3 and −1 in residues 5,6,7.
3. Apply the two-primary parity proof, keeping its divisible-Sha corank term; the cited source supplies the exact conclusion but its Monsky input needs decomposition. Record that missing proof rather than substitute the dimension of Sel₂.
4. Use the elliptic functional equation to identify analytic-order parity with the root sign.

**Sources.** [DOKCHITSER-10], Theorem 4.19 (= Theorem 1.4), pp. 593–594, p=2 attribution to reference [26]. [BURUNGALE-TIAN-26], §3, preprint pp. 6–7.

**Discriminating tests.**

- `TauCeti.Selmer.Tests.congruent_parity_one` (computation): n=1 has even 2∞-Selmer corank, while its two-torsion contributes to the finite Sel₂ dimension.
- `TauCeti.Selmer.Tests.congruent_parity_five` (computation): n=5 has odd 2∞-Selmer corank.
- `TauCeti.Selmer.Tests.congruent_parity_squarefree` (non-example): n≡0,4 mod 8 is not a positive squarefree input.

### Global finite Selmer reductions and conjugation

Target `SelmerIwasawaCohomology:L4/global-finite-reduction` · theorem.

Define Sel_f(F,T) as the preimage of the rational finite Selmer group and Sel_(f,T)(F,T/λ^m) as the image of Sel_f(F,T) in finite coefficient cohomology; distinguish this global image from the Selmer kernel formed from independently propagated local conditions. For a free O-submodule S of Sel_f(F,T) whose image modulo torsion is saturated, its image S(m) is free over O/λ^m of the same rank. Its localizations lie in the nonsingular condition at unramified non-p places and at unramified p places in the small crystalline range. If c restricts to an automorphism of F, conjugation gives Sel_f(F,V)≃Sel_f(F,V^c), carrying each place to its conjugate.

**Hypotheses and conventions.** Stable free lattice T; m≥1; the saturation condition is on the image in Sel_f/torsion, not merely a submodule of the torsion group. The local crystalline hypothesis is the one in integral-finite-comparison.

**Prerequisites.** `L4/bloch-kato-condition`, `L4/integral-finite-comparison`, `L2/lattice-passage`, `L2/finite-unramified-comparison`.

**Proof plan.**

1. Apply the coefficient LES and the global kernel definition to form the preimage and finite image.
2. The map (Sel_f/torsion)/λ^m→Sel_(f,T)(T/λ^m)/image(torsion) is injective; saturation gives the stated free reduction and rank.
3. Use integral-finite-comparison and unramified propagation for the local containment. Conjugate extension classes and localization maps to get inverse Selmer maps.

**Sources.** [LIU-ETAL-22], Definitions 2.4.1–2.4.2 and Lemma 2.4.3, p. 129; Lemma 2.4.5 and Proposition 2.4.6(1), p. 130.

### Uniform local annihilation for pure weight minus one

Target `SelmerIwasawaCohomology:L4/uniform-away-p-bound` · theorem.

Let T be free over O with V=T[1/p], V^c≃V*(1) and V pure of weight −1 at every non-p finite place, in the ArithmeticGaloisRepresentations Weil–Deligne convention. For each finite set Σ there is an m_Σ depending only on T,Σ such that for every saturated S of global-finite-reduction and every m>m_Σ, all non-p finite localizations of λ^(m_Σ)S(m) at w∈Σ are zero. At such w, purity for V and its Tate dual gives H⁰=H²=0 and the away-p Euler characteristic gives H¹(K_w,V)=0. Thus integral H¹ and torsion H² are killed by λ^m_w; the coefficient LES kills finite H¹ by λ^(2m_w). Set m_Σ=max_(w∈Σ,w∤p∞)2m_w.

**Hypotheses and conventions.** Conjugate Tate self-duality and local purity are both required. No assertion at p or archimedean places.

**Prerequisites.** `L4/global-finite-reduction`, `ArithmeticGaloisRepresentations:R01.2/purity-of-weil-deligne-representations`, `ArithmeticGaloisDuality:R02.4`, `L1/lattice-pairing-compatibility`.

**Proof plan.**

1. Import the precise monodromy purity convention and prove absence of invariant eigenvalue one in the relevant monodromy-kernel pieces.
2. Apply local Tate duality and Euler characteristic to get rational H¹ zero; use integral finiteness to bound H¹ and H² torsion.
3. Use the coefficient LES for T→T→T/λ^m and take the stated finite maximum.

**Sources.** [LIU-ETAL-22], Proposition 2.4.6(2) and proof, pp. 130–131.

## Proof inputs and supplier interfaces

All five layers have their target-level plans. Closure additionally requires the following mathematical inputs and requested interfaces. They are part of the prerequisite graph, not assumptions that the target theorems have already been proved.

### Ordinary parity proof interfaces

The exact specialized statement and hypotheses are read in Nekovář 12.2.3. Its proof uses variation of Selmer parity in ordinary families (§§12.7–12.8), auxiliary quadratic-twist nonvanishing and the rank-one Heegner argument (§12.10.9). These specialized proof inputs need target-level decomposition here; they cannot be cited from higher-tier PadicFamilies, Heegner or RankZeroOneBSD. The source is accessible but this pass does not claim those inputs have closed prerequisite chains.

Targets: `SelmerIwasawaCohomology:L4/ordinary-selmer-parity`.

### Two-primary congruent-number parity proof

Dokchitser–Dokchitser 4.19 explicitly imports its p=2 case from Monsky, Generalizing the Birch–Stephens theorem. I. Modular curves, Math. Z. 221(3) (1996), pp. 415–420, reference [26]. That primary Monsky text and the proof-level 2-adic local-root-number/descent comparison were not read in this pass. Refine the minimal congruent-number proof here, retaining divisible Sha corank; do not substitute Sel₂ dimension or assume Sha finite.

Targets: `SelmerIwasawaCohomology:L4/congruent-two-parity`.

### ArithmeticGaloisDuality:R02.1

Continuous cohomology with compact coefficients T = lim T_n (ℤ_p(1) = lim μ_{p^m}; lattices T, V = T[1/p], W = V/T) on the canonical carrier, with the Milnor sequence 0 → lim^1 H^{i−1}(G, T_n) → H^i(G, T) → lim H^i(G, T_n) → 0 and its consequence H^i(G, T) = lim H^i(G, T_n) when every H^{i−1}(G, T_n) is finite (Rubin Proposition B.2.3); vanishing of lim^1 for Mittag-Leffler systems; and the maps H^1(T) → H^1(V) → H^1(W) with H^1(T) ⊗ ℚ_p ≅ H^1(V) (Rubin Proposition B.2.4). Also: the long exact sequences for 0 → T → V → W → 0 and Tate's inverse-limit theorem for H¹(K, T) = lim H¹(K, W_M), cited as R02.1's nodes. The general continuous-section LES must apply to the canonical topological period coefficients V⊗B_cris and V⊗B_dR, beyond compact or finite-dimensional coefficient modules. For Iwasawa cohomology: derived-limit acyclicity/exactness for compatible towers of compact finite-type R-modules via their finite coefficient quotients, with the topology and continuous maps retained. Condition (F) makes finite coefficient cohomology finite, not all lattice cohomology finite-length.

### ArithmeticGaloisDuality:R02.3

G_{F,S} for a number field F and finite S ⊇ {v | p∞}, decomposition-group localisation maps H^i(G_{F,S}, M) → H^i(F_v, M), finiteness of H^i(G_{F,S}, M) for finite M, and the Kummer sequence 0 → 𝓞_{F,S}^×/p^m → H^1(G_{F,S}, μ_{p^m}) → Pic(𝓞_{F,S})[p^m] → 0. Also: finiteness of H¹(K_Σ/K, W_M), cited as R02.3/h1-finite.

### tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-9-the-galois-interface-hilbert-90-and-kummer-theory

Import the current library’s Hilbert-90/Kummer isomorphism and its restriction/norm squares (kummerMap_surjective, kummerIso, kummerIso_res, kummerIso_norm). The remaining interface is their compatibility with the μ_(p^m) coefficient tower and canonical compact-cochain comparison, together with H⁰(G_K,μ_n)=μ_n(K); do not reimplement the existing finite-level arithmetic.

### tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-5-exact-sequences

Inflation–restriction for discrete continuous cohomology, 0 → H^1(G/H, M^H) → H^1(G, M) → H^1(H, M), and the H^1 of a procyclic group, H^1(Ẑ, C) ≅ C/(σ − 1)C by evaluation at a generator.

### tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-1-units-the-filtration-and-the-multiplicative-group

For K/ℚ_ℓ finite: K^× = π^ℤ × 𝓞_K^×, 𝓞_K^× = μ_{q−1} × U^1_K, U^1_K a finitely generated ℤ_p-module when ℓ = p and pro-ℓ when ℓ ≠ p, and finiteness of K^×/(K^×)^n (Hensel). Import A(K), the multiplicative p-completion and its module from current LocalGaloisGroups Layer 7. Extend the local-field interface to the completed algebraic closure C_p with unique valuation extension, continuous G_K action and the Tate–Sen cohomology calculation for C_p(i), in the exact normalization needed for period-fixed-fields. This latter Part II result is not a consequence of the finite power-class theorem.

### tauceti:TauCetiRoadmap/GlobalNumberFields#layer-6-additive-strong-approximation-and-ideles

Dirichlet's S-unit theorem: 𝓞_{F,S}^× is finitely generated, of rank #S − 1.

### tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4

Import the general discrete-module local-condition structure, its Selmer kernel and locally constant cohomology constructor, as well as the elliptic finite-level Selmer/Kummer/Sha exact sequences and transitions. Supply the comparison to the canonical continuous carrier on A=V/T.

### ArithmeticGaloisDuality:R02.4

Local Tate duality for V, W_M and T × W^* over finite extensions of ℚ_ℓ, ℝ and ℂ (Rubin, Theorem 4.1): perfect cup-product pairings into Φ, O/MO and D. The finite case is ClassFieldTheory's; the rational and lattice cases come through R02.1's limits. R02.4's poitou-tate and restricted-product-cohomology are cited as nodes.

### ArithmeticGaloisDuality:R02.2

The Hochschild–Serre spectral sequence for I ⊆ G_K and Gal(K^ur/K) with ℚ_p-vector-space coefficients, in the degrees used to identify H¹(K^ur/K, H¹(I, V)) with H²(K, V) (Rubin, Corollary 3.3).

### tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-11-cohomological-dimension

cd_p of Gal(K^ur/K) ≅ Ẑ and of the inertia group at ℓ ≠ p is 1.

### tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-12-the-graded-cup-product-in-all-degrees

Naturality of the cup product in the coefficients, for the compatibility of the local pairings along T → V, V^* → W^*, T ↠ W_M and W^*_M ↪ W^*. The projection formula cor(x ∪ res y) = cor(x) ∪ y, for the twisting isomorphism.

### tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-4-the-tame-quotient-of-the-absolute-galois-group

For ℓ ≠ p, the inertia group has a unique maximal subgroup of pro-order prime to p, with quotient ℤ_p (the tame quotient). Also: H¹(I, T) is finitely generated over ℤ_p for ℓ ≠ p (Rubin Proposition B.2.7(iii)).

### PadicMeasuresIwasawaAlgebras:L1

Iwasawa algebras R⟦Γ⟧ for Γ ≅ ℤ_p^r × Δ: the isomorphism with R⟦X₁, …, X_r⟧[Δ], the involution ι and the twists Tw_k, and the regular sequence γ_i − 1 (Nekovář 8.4.1, 8.4.8.1).

### tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-6-change-of-groups

Double-coset (Mackey) form of restriction and corestriction, for the semilocal decomposition.

### tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-7-coinduced-modules-and-shapiros-lemma

Shapiro's lemma at finite level with corestriction transitions (Nekovář Lemma 8.1.5), and its double-coset form (Rubin Proposition B.4.2).

### PadicMeasuresIwasawaAlgebras:L5

Supply the perfect-complex/determinant functor, triangle multiplicativity, derived specialization and dualizing-complex conventions. Prove the signed height-one length formula under generic acyclicity. L5 currently has no planned nodes; this is a precise lower-tier foundation request, not an implementation claim.

### PadicMeasuresIwasawaAlgebras:L4

Supply reflexivity/pseudo-null and almost-divisible dual criteria, and the dimension-two depth/Auslander–Buchsbaum implication: finitely generated torsion over O[[T]] with no finite submodule has projective dimension at most one. Use the existing L6 quadratic-presentation and fitting-quadratic nodes to identify Fitting with characteristic.

### SchemeAndStackFoundations:SF.6

Arithmetic K(π,1) comparison for p-primary lisse coefficients on Spec O_F[1/S], p inverted, with derived lattice coefficients and real-place convention; stalk computation R^q j_*T=H^q(I_v,T) and its localization triangle. An equivalence of finite étale covers alone does not imply this cohomology comparison.

### tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity

Import global reciprocity, ideal-class finiteness and the abelian pro-p idèle quotient, with finite-place unit and norm/transfer compatibility; L4 constructs only their Selmer/tower comparison.

## Existing library declarations

The table records the statements checked at the pins, including their precise scope. A declaration that supplies an underlying object need not supply its arithmetic comparison or topology. Current additions below the table are distinguished from this pinned baseline.

| Declaration | Source module | Provides |
| --- | --- | --- |
| `AdicCompletion` | [Mathlib/RingTheory/AdicCompletion/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/AdicCompletion/Basic.lean) | The I-adic completion of a module. |
| `AdicCompletion.map` | [Mathlib/RingTheory/AdicCompletion/Functoriality.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/AdicCompletion/Functoriality.lean) | Functoriality of the completion. |
| `AdicCompletion.of` | [Mathlib/RingTheory/AdicCompletion/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/AdicCompletion/Basic.lean) | The canonical map M → M̂. |
| `AdicCompletion.ofTensorProduct` | [Mathlib/RingTheory/AdicCompletion/AsTensorProduct.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/AdicCompletion/AsTensorProduct.lean) | The map R̂ ⊗ M → M̂. |
| `AdicCompletion.ofTensorProduct_bijective_of_finite_of_isNoetherian` | [Mathlib/RingTheory/AdicCompletion/AsTensorProduct.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/AdicCompletion/AsTensorProduct.lean) | R̂ ⊗ M → M̂ is bijective for finite M over Noetherian R. |
| `CategoryTheory.Functor.isMittagLeffler_of_exists_finite_range` | [Mathlib/CategoryTheory/CofilteredSystem.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/CofilteredSystem.lean) | A cofiltered system with eventually finite ranges is Mittag-Leffler. |
| `ContinuousMonoidHom.comp` | [Mathlib/Topology/Algebra/ContinuousMonoidHom.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/ContinuousMonoidHom.lean) | Composition of continuous homomorphisms. |
| `IsIntegral.of_pow` | [Mathlib/RingTheory/IntegralClosure/IsIntegral/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/IntegralClosure/IsIntegral/Basic.lean) | x is integral if some positive power is. |
| `Module.finrank` | [Mathlib/LinearAlgebra/Dimension/Finrank.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Dimension/Finrank.lean) | Cardinal.toNat of module rank; for finite free modules this is the usual rank. |
| `MulDistribMulAction.toMonoidHom` | [Mathlib/Algebra/Group/Action/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Action/Basic.lean) | The endomorphism x ↦ g • x. |
| `NumberField.RingOfIntegers` | [Mathlib/NumberTheory/NumberField/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/Basic.lean) | The ring of integers. |
| `NumberField.Units.exist_unique_eq_mul_prod` | [Mathlib/NumberTheory/NumberField/Units/DirichletTheorem.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/Units/DirichletTheorem.lean) | Every unit is uniquely a torsion unit times a product of powers of the fundamental system. |
| `PadicInt` | [Mathlib/NumberTheory/Padics/PadicIntegers.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Padics/PadicIntegers.lean) | The p-adic integers. |
| `PadicInt.toZModPow` | [Mathlib/NumberTheory/Padics/RingHoms.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Padics/RingHoms.lean) | ℤ_p → ℤ/p^n. |
| `PontryaginDual` | [Mathlib/Topology/Algebra/PontryaginDual.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/PontryaginDual.lean) | Continuous homomorphisms into the circle. |
| `Submodule.map_le_iff_le_comap` | [Mathlib/Algebra/Module/Submodule/Map.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Module/Submodule/Map.lean) | map f p ≤ q ↔ p ≤ comap f q. |
| `card_rootsOfUnity` | [Mathlib/RingTheory/RootsOfUnity/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/RootsOfUnity/Basic.lean) | The n-th roots of unity in a domain have at most n elements. |
| `rootsOfUnity` | [Mathlib/RingTheory/RootsOfUnity/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/RootsOfUnity/Basic.lean) | The subgroup of n-th roots of unity. |
| `TauCeti.ContCohomology.DiscreteShortExact.explicitDelta0_coeffMap` | [TauCeti/RepresentationTheory/Homological/ContCohomology/DeltaNaturality.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/DeltaNaturality.lean) | A morphism of short exact sequences commutes with δ⁰. |
| `TauCeti.kummerClassMap` | [TauCeti/FieldTheory/GaloisCohomology/Kummer.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/FieldTheory/GaloisCohomology/Kummer.lean) | The Kummer map on Kˣ/(Kˣ)^n. |
| `TauCeti.kummerClassMap_injective` | [TauCeti/FieldTheory/GaloisCohomology/Kummer.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/FieldTheory/GaloisCohomology/Kummer.lean) | Kˣ/(Kˣ)^n injects into H¹(G_K, μ_n). |
| `TauCeti.kummerMap` | [TauCeti/FieldTheory/GaloisCohomology/Kummer.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/FieldTheory/GaloisCohomology/Kummer.lean) | Kˣ →* H¹(G_K, μ_n), the connecting map of the Kummer sequence. |
| `TauCeti.kummerMap_apply` | [TauCeti/FieldTheory/GaloisCohomology/Kummer.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/FieldTheory/GaloisCohomology/Kummer.lean) | kummerMap is δ⁰ read through Kˣ ≃ ((Kˢ)ˣ)^{G_K}. |
| `TauCeti.kummerShortExact` | [TauCeti/FieldTheory/GaloisCohomology/Coefficients.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/FieldTheory/GaloisCohomology/Coefficients.lean) | The Kummer short exact sequence of discrete G_K-modules. |
| `TauCeti.powerClassQuotient` | [TauCeti/Algebra/Group/PowerClassGroup.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/Group/PowerClassGroup.lean) | Kˣ/(Kˣ)^n. |
| `BDeRhamPlus` | [Mathlib/RingTheory/Perfectoid/BDeRham.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Perfectoid/BDeRham.lean) | The θ-kernel completion of W(PreTilt R p)[1/p]. |
| `BDeRham` | [Mathlib/RingTheory/Perfectoid/BDeRham.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Perfectoid/BDeRham.lean) | Localization of BDeRhamPlus at images of generators of ker θ. |
| `Complex.Gammaℝ` | [Mathlib/Analysis/SpecialFunctions/Gamma/Deligne.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/SpecialFunctions/Gamma/Deligne.lean) | Deligne real Gamma factor π^(−s/2)Γ(s/2). |
| `Complex.Gammaℂ` | [Mathlib/Analysis/SpecialFunctions/Gamma/Deligne.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/SpecialFunctions/Gamma/Deligne.lean) | Deligne complex Gamma factor 2(2π)^(−s)Γ(s). |
| `Complex.Gammaℝ_eq_zero_iff` | [Mathlib/Analysis/SpecialFunctions/Gamma/Deligne.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/SpecialFunctions/Gamma/Deligne.lean) | The totalized real Gamma factor is zero precisely at nonpositive even integers. |
| `TauCeti.Hodge.HodgeStructureOn` | [TauCeti/Geometry/Hodge/Structure.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Geometry/Hodge/Structure.lean) | An opposed filtration on a complex vector space with real conjugation and fixed weight. |
| `TauCeti.Hodge.HodgeStructureOn.hodgeNumber` | [TauCeti/Geometry/Hodge/Dimension.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Geometry/Hodge/Dimension.lean) | Finite rank of the pth Hodge piece. |
| `TauCeti.Hodge.HodgeStructureOn.finite_setOf_hodgeNumber_ne_zero` | [TauCeti/Geometry/Hodge/Dimension.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Geometry/Hodge/Dimension.lean) | Finite support of Hodge numbers. |
| `TauCeti.Hodge.HodgeStructureOn.dual` | [TauCeti/Geometry/Hodge/Dual.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Geometry/Hodge/Dual.lean) | The opposed-filtration dual of weight −w, on the complex dual with dual conjugation. |
| `TauCeti.Hodge.HodgeStructureOn.finrank_dual_piece` | [TauCeti/Geometry/Hodge/Dual.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Geometry/Hodge/Dual.lean) | The dual piece at a has dimension equal to the original piece at −a. |
| `TauCeti.Hodge.HodgeStructureOn.tateTwist` | [TauCeti/Geometry/Hodge/Tate/Twist.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Geometry/Hodge/Tate/Twist.lean) | The pure Hodge twist has filtration F(a+m) and weight w−2m. |
| `TauCeti.Hodge.tate` | [TauCeti/Geometry/Hodge/Tate/Basic.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Geometry/Hodge/Tate/Basic.lean) | The rank-one integral Tate Hodge structure of type (−m,−m) and weight −2m. |
| `TauCeti.Hodge.tate_hodgeNumber` | [TauCeti/Geometry/Hodge/Tate/Basic.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Geometry/Hodge/Tate/Basic.lean) | The existing Tate Hodge numbers are one at −m and zero elsewhere. |

The current Tau Ceti Kummer module additionally supplies `kummerMap_surjective`, `kummerIso`, `kummerIso_res` and `kummerIso_norm`. Its local power-subgroup module supplies `finiteIndex_range_powMonoidHom` and `card_powerClasses`. L0 imports those arithmetic results and adds only the inverse-limit/topology comparison. TauCetiRoadmap LocalGaloisGroups Layer 7 supplies the local completion and its p-adic decomposition; EllipticCurves Layer 7 supplies the discrete Selmer carrier.

## Planets

| Layer | Mathematical landmarks |
| --- | --- |
| L0 | Multiplicative p-adic completion; p-adic Kummer isomorphism; S-unit Kummer isomorphism; Weak semisimplicity |
| L1 | Orthogonal local conditions; Selmer complex duality; Ordinary annihilators; Nonsingular annihilation |
| L2 | Compact and rational Selmer data; Greenberg local condition; Dual Selmer structure; Selmer Poitou–Tate sequence; Selmer complex; Selmer cohomology comparison |
| L3 | Iwasawa Shapiro isomorphism; Iwasawa Selmer complex; Derived Selmer control; Iwasawa duality; Arithmetic determinant line; Absence of finite Selmer submodules |
| L4 | Tate-twist class-group dictionary; Iwasawa–Greenberg conjecture; Bloch–Kato finite condition; Fontaine–Laffaille modules; Archimedean Gamma factor; Ordinary modular Selmer parity |

## References and reading conventions

Every locator above refers to the specified edition below and to printed page numbers unless explicitly marked as preprint/PDF pages. Statements and proof plans are written in our own words. A published edition not read is not treated as the source for a preprint locator.

- **RUBIN-ES**: Karl Rubin, [Euler systems](https://swc-math.github.io/notes/files/99RubinES.pdf). Author draft of Annals of Mathematics Studies 147 (2000), 1999 Arizona Winter School; printed page = PDF page − 10.
- **MAZUR-RUBIN-16**: Barry Mazur; Karl Rubin, [Controlling Selmer groups in the higher core rank case](https://arxiv.org/abs/1312.4052v1). arXiv:1312.4052v1 (14 December 2013); published in J. Théor. Nombres Bordeaux 28 (2016), not accessed.
- **RJW-PADIC-L**: Joaquín Rodrigues Jacinto; Chris Williams, [An introduction to p-adic L-functions](https://arxiv.org/abs/2309.15692v2). arXiv:2309.15692v2 (19 December 2024); the published version (Essential Number Theory 4 (2025), 101–216) was compared at the loci of E4 and E5.
- **BURUNGALE-TIAN-26**: Ashay A. Burungale; Ye Tian, [A rank zero p-converse to a theorem of Gross–Zagier, Kolyvagin and Rubin](https://arxiv.org/abs/2506.03465v2). arXiv:2506.03465v2 (11 October 2025); Annals of Mathematics 203 (2026), not accessed.
- **NEKOVAR-SC**: Jan Nekovář, [Selmer complexes](https://www.numdam.org/item/AST_2006__310__R1_0.pdf). Astérisque 310 (2006), Numdam open-access PDF (568 PDF pages; printed page = PDF page − 9).
- **LIU-ETAL-22**: Y. Liu; Y. Tian; L. Xiao; W. Zhang; X. Zhu, [On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://doi.org/10.1007/s00222-021-01088-4). Inventiones Mathematicae 228 (2022), 107–375; maintainer-cleared version of record.
- **GREENBERG-STRUCTURE**: Ralph Greenberg, [On the structure of Selmer groups](https://warwick.ac.uk/fac/sci/maths/people/staff/david_loeffler/jhc70/greenberg.pdf). Author preprint, 29 pages; use PDF pagination, publication date not authenticated.
- **CGLS-22**: F. Castella; G. Grossi; J. Lee; C. Skinner, [On the anticyclotomic Iwasawa theory of rational elliptic curves at Eisenstein primes](https://web.math.ucsb.edu/~castella/Eisenstein.pdf). Author preprint dated 10 August 2021, 34 pages; published Inventiones Mathematicae 227 (2022).
- **CG-APPENDIX-20**: F. Calegari; D. Geraghty; M. Harris, [Bloch–Kato conjectures for automorphic motives](https://arxiv.org/pdf/1907.08694v1). Companion appendix preprint, 10 pages, to Modularity lifting for non-regular symplectic representations, Duke Mathematical Journal 169 (2020), Appendix A.
- **SKINNER-20**: Christopher Skinner, [A converse to a theorem of Gross, Zagier, and Kolyvagin](https://arxiv.org/pdf/1405.7294). Author preprint; published Annals of Mathematics 191 (2020), 329–354.
- **KATO-04**: Kazuya Kato, [p-adic Hodge theory and values of zeta functions of modular forms](https://www.numdam.org/item/AST_2004__295__117_0.pdf). Astérisque 295 (2004), 117–290.
- **BLOCH-KATO-90**: Spencer Bloch; Kazuya Kato, [L-functions and Tamagawa numbers of motives](https://virtualmath1.stanford.edu/~conrad/BSDseminar/refs/BKTamagawa.pdf). The Grothendieck Festschrift I (1990), 333–400; freely available university seminar copy.
- **DELIGNE-79**: Pierre Deligne, [Valeurs de fonctions L et périodes d’intégrales](https://publications.ias.edu/sites/default/files/33_Valeursde.pdf). Proc. Sympos. Pure Math. 33, Part 2 (1979), 313–346; author-hosted scan.
- **DOKCHITSER-10**: Tim Dokchitser; Vladimir Dokchitser, [On the Birch–Swinnerton-Dyer quotients modulo squares](https://annals.math.princeton.edu/wp-content/uploads/annals-v172-n1-p11-p.pdf). Annals of Mathematics 172 (2010), 567–596.
- **BREUIL-99**: Christophe Breuil, [Une remarque sur les représentations locales p-adiques et les congruences entre formes modulaires de Hilbert](https://www.numdam.org/article/BSMF_1999__127_3_459_0.pdf). Bull. Soc. Math. France 127 (1999), 459–472.
- **NIZIOL-93**: Wiesława Nizioł, [Cohomology of crystalline representations](https://webusers.imj-prg.fr/~wieslawa.niziol/duke1993.pdf). Duke Mathematical Journal 71 (1993), 747–791.
- **FONTAINE-94**: Jean-Marc Fontaine, [Le corps des périodes p-adiques](https://www.numdam.org/item/AST_1994__223__59_0.pdf). Astérisque 223 (1994), 59–111.
- **FONTAINE-LAFFAILLE-82**: Jean-Marc Fontaine; Guy Laffaille, [Construction de représentations p-adiques](https://www.numdam.org/item/ASENS_1982_4_15_4_547_0.pdf). Annales scientifiques de l’École normale supérieure 15 (1982), 547–608.
- **FONTAINE-REP-94**: Jean-Marc Fontaine, [Représentations p-adiques semi-stables](https://www.numdam.org/item/AST_1994__223__113_0.pdf). Astérisque 223 (1994), 113–184.

## Corrections affecting the mathematical statements

The completion comparison does not replace a full multiplicative completion by an algebraic tensor product. The localization-pairing proof uses the same ordered pair of relaxed sets on its dual map. Cyclotomic norm relations use a Frobenius operator, not a scalar in place of it. Tate criticality uses the negative odd twists as well as the positive even twists. The unit/class sequence uses U/E in its kernel. Restriction descent retains the finite-group cohomology kernel, and the finite-image adjoint argument maps into a class-group **Hom**, with that kernel, rather than a purported canonical quotient. The exact source findings and their locators are recorded in the packet.

[RUBIN-ES]: https://swc-math.github.io/notes/files/99RubinES.pdf
[MAZUR-RUBIN-16]: https://arxiv.org/abs/1312.4052v1
[RJW-PADIC-L]: https://arxiv.org/abs/2309.15692v2
[BURUNGALE-TIAN-26]: https://arxiv.org/abs/2506.03465v2
[NEKOVAR-SC]: https://www.numdam.org/item/AST_2006__310__R1_0.pdf
[LIU-ETAL-22]: https://doi.org/10.1007/s00222-021-01088-4
[GREENBERG-STRUCTURE]: https://warwick.ac.uk/fac/sci/maths/people/staff/david_loeffler/jhc70/greenberg.pdf
[CGLS-22]: https://web.math.ucsb.edu/~castella/Eisenstein.pdf
[CG-APPENDIX-20]: https://arxiv.org/pdf/1907.08694v1
[SKINNER-20]: https://arxiv.org/pdf/1405.7294
[KATO-04]: https://www.numdam.org/item/AST_2004__295__117_0.pdf
[BLOCH-KATO-90]: https://virtualmath1.stanford.edu/~conrad/BSDseminar/refs/BKTamagawa.pdf
[DELIGNE-79]: https://publications.ias.edu/sites/default/files/33_Valeursde.pdf
[DOKCHITSER-10]: https://annals.math.princeton.edu/wp-content/uploads/annals-v172-n1-p11-p.pdf
[BREUIL-99]: https://www.numdam.org/article/BSMF_1999__127_3_459_0.pdf
[NIZIOL-93]: https://webusers.imj-prg.fr/~wieslawa.niziol/duke1993.pdf
[FONTAINE-94]: https://www.numdam.org/item/AST_1994__223__59_0.pdf
[FONTAINE-LAFFAILLE-82]: https://www.numdam.org/item/ASENS_1982_4_15_4_547_0.pdf
[FONTAINE-REP-94]: https://www.numdam.org/item/AST_1994__223__113_0.pdf
