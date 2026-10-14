# Modular forms — Hecke theory, newforms, and L-functions, Part II: GL₂ automorphic representations and transfer

Part R17.4: layer R17.4, cyclic, solvable and cubic base change (a follow-up of the R17.3 packet). Agent: Claude (claude-aUA4oH). Issue: [#9413](https://github.com/CBirkbeck/tauceti-explorer/issues/9413).

This is a complete target-level planning pass for R17.4, which is **planned** and not closed. The packet adds 12 declarations (3 definitions, 9 theorems), 26 API items and 15 unit tests, and no planets: R17.4 already shows six planets from the R17.3 packet. One gap and 10 supplier requests remain. Every proposed implementation is unchecked.

The machine-readable plan is the [packet](../packets/GL2AutomorphicRepresentationsAndTransfer--R17.4.json). The [suggested Lean file](../suggested/GL2AutomorphicRepresentationsAndTransfer--R17.4.lean) types the Frobenius splitting rule on Tau Ceti's cycle-type API and lists every statement that cannot be typed at the pins. This document gives the definitive mathematical statements.

## What this part adds

The R17.3 packet planned R17.4 at target level with fifteen declarations, which are cited here and not repeated:

- `R17.4/unramified-base-change`: Unramified base-change Satake rule.
- `R17.4/cyclic-base-change`: Prime-cyclic base change for GL₂.
- `R17.4/local-compatibility`: All-place compatibility of cyclic base change.
- `R17.4/cyclic-descent`: Prime-cyclic automorphic descent.
- `R17.4/cuspidality`: The exact prime-cyclic cuspidality criterion.
- `R17.4/cyclic-descent-fibers`: Cuspidal fibers and quadratic self-twists.
- `R17.4/isobaric-fibers`: Isobaric character fibers.
- `R17.4/solvable-base-change`: Base change along a solvable normal tower.
- `R17.4/tower-independence`: Independence of the solvable tower.
- `R17.4/solvable-descent`: Descent along a solvable tower with character choices.
- `R17.4/prescribed-local-base-change`: Base change with prescribed local splitting.
- `R17.4/adjoint-lift`: The Gelbart–Jacquet adjoint lift.
- `R17.4/cubic-character-induction`: Cyclic cubic induction of a character.
- `R17.4/gl3-recognition`: GL₃ analytic recognition for the Artin bridge.
- `R17.4/nonnormal-cubic-base-change`: Non-normal cubic base change.

Its coverage record left open the non-Galois cubic local compatibility that AutomorphicGaloisRepresentations requests for Carayol's Theorem (A), the all-place form of non-normal cubic base change, and the proof of that transfer, whose source (Jacquet–Piatetski-Shapiro–Shalika's 1981 note) was not available. Two confirmed red-team findings were handed to this job: RT-AREA-automorphic-1/1 (GL(3) inputs of non-normal cubic base change and of the Langlands–Tunnell theorem) and RT-AREA-langlands-2/4 (R17.4 must plan the non-Galois cubic lift with its local compatibility for R19.2). This part supplies:

1. **Local base change for every finite extension**, defined by restricting the rank-two Langlands parameter, with its API ([`R17.4/local-base-change`](#n-local-base-change)), the GL₂ local converse theorem and Langlands' λ-constants.
2. **The cubic local lift.** For a cubic étale algebra, the twisted factors of the local lift are the GL₂ × GL₃ Rankin–Selberg factors of π against the local GL₃ induction, up to the square of Langlands' λ-constant. This is the factor description of the Jacquet–Piatetski-Shapiro–Shalika lift, so that lift corresponds to restriction of the Weil–Deligne parameter for every π: principal series, special, ordinary and extraordinary cuspidal ([`R17.4/local-cubic-factor-identity`](#n-local-cubic-factor-identity), [`R17.4/local-cubic-explicit-lifts`](#n-local-cubic-explicit-lifts)).
3. **Non-normal cubic base change at every place.** The restricted tensor product of the local lifts is cuspidal automorphic unless π is a twist of the S₃ dihedral representation of the Galois closure. This follows from GL₃ induction from the cubic field, the GL₂ × GL₃ twisted L-functions, the product formula for λ² and the GL₂ converse theorem over K; the exceptional case is computed through the quadratic resolvent ([`R17.4/nonnormal-cubic-strong-base-change`](#n-nonnormal-cubic-strong-base-change), [`R17.4/nonnormal-cubic-cuspidality`](#n-nonnormal-cubic-cuspidality)).
4. **Local invariants for the modularity consumers**: conductors along unramified extensions, tame principal series, Steinberg root numbers and archimedean weights ([`R17.4/local-base-change-invariants`](#n-local-base-change-invariants)), and the typed Frobenius splitting rule for Satake powers ([`R17.4/cubic-splitting-satake`](#n-cubic-splitting-satake)).

## Conventions and ownership

F is a number field or a local field of characteristic zero, A_F its adele ring, W_F its Weil group. Local reciprocity sends a uniformiser to the Frobenius of the R16.3 normalisation; the rank-two local Langlands correspondence rec_F is that of R16.3 (imported from ET.6) at finite places and that of AF.1 at archimedean places, with Frobenius-semisimple Weil–Deligne parameters and the monodromy operator retained. Restriction to W_E of a parameter of W_F means restriction of (r, N). For a separable cubic K/F that is not Galois, L denotes the Galois closure (Gal(L/F) ≅ S₃), M ⊂ L the quadratic resolvent, σ the nontrivial automorphism of M/F, ξ a Hecke (or local) character of M of order three cutting out L/M, so that ξ^σ = ξ^{−1}, and τ_K = Ind_{W_M}^{W_F} ξ the two-dimensional irreducible representation of S₃. Then Ind_{W_K}^{W_F} 1 = 1 ⊕ τ_K, det Ind 1 = η_{M/F}, and τ_K|_{W_K} = 1 ⊕ η_{L/K}.

A cuspidal π of GL₂(A_F) is **K-exceptional** if BC_{M/F}(π) ≅ (ν∘N_{M/F})ξ ⊞ (ν∘N_{M/F})ξ^{−1} for a Hecke character ν of F; on the Galois side these are the twists of τ_K. Langlands' constant is λ(E/F, ψ) = ε(Ind 1_E, ψ)/ε(1_E, ψ∘Tr), and κ_{E/F} = det Ind 1_E.

Ownership. Prime-cyclic and solvable base change, descent, the adjoint lift, cyclic cubic induction and GL₃ recognition are the R17.3 packet's R17.4 nodes. GL_n Rankin–Selberg theory, both converse theorems and isobaric strong multiplicity one belong to AutomorphicLFunctionsAndLocalFactors AL.3. The GL₃ local correspondence and pair compatibility belong to EndoscopicTransferAndUnitaryTraceComparison ET.6. Weil–Deligne representations, their L-factors and Deligne's ε-factors belong to ArithmeticGaloisRepresentations R01.2. Local and global reciprocity, the Weil group, norm limitation and Hecke characters are Tau Ceti's ClassFieldTheory and GlobalNumberFields; the Mackey formula is RepresentationTheory/InductionRestriction. Galois representations attached to automorphic representations, and the Galois-side descent of automorphy along solvable extensions, are downstream (AutomorphicGaloisRepresentations R19, PotentialAutomorphyInfrastructurePartII PL.0) and are not R17.4 targets.

## Pinned-library boundary

The reviewed AUDIT14 entries classify cyclic, solvable and cubic base change as not built. The following declarations were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`; they are reused, never replanned.

- `tauceti:Equiv.Perm.fullCycleType` (def): The multiset of cycle lengths of a permutation of a finite type with one part 1 for each fixed point, σ.cycleType + replicate (card α − #support) 1: the orbit lengths of ⟨σ⟩. Module: `TauCeti/GroupTheory/Perm/Partition.lean`.
- `tauceti:Equiv.Perm.fullCycleType_def` (theorem): fullCycleType σ equals the parts of Mathlib's Equiv.Perm.partition σ. Module: `TauCeti/GroupTheory/Perm/Partition.lean`.
- `tauceti:Equiv.Perm.sum_fullCycleType` (theorem): The parts of fullCycleType σ sum to the cardinality of the carrier. Module: `TauCeti/GroupTheory/Perm/Partition.lean`.
- `tauceti:Equiv.Perm.fullCycleType_conj` (theorem): fullCycleType (g * σ * g⁻¹) = fullCycleType σ. Module: `TauCeti/GroupTheory/Perm/Partition.lean`.
- `tauceti:Equiv.Perm.fullCycleType_one` (theorem): fullCycleType 1 = replicate (card α) 1. Module: `TauCeti/GroupTheory/Perm/Partition.lean`.
- `tauceti:Equiv.Perm.parts_partition_swap` (theorem): For x ≠ y the parts of the partition of swap x y are 2 together with card α − 2 parts equal to 1. Module: `TauCeti/GroupTheory/Perm/Partition.lean`.
- `tauceti:Equiv.Perm.parts_partition_of_isCycle` (theorem): For a cycle σ the parts of its partition are #support together with card α − #support parts equal to 1. Module: `TauCeti/GroupTheory/Perm/Partition.lean`.
- `tauceti:Equiv.Perm.sign_of_parts_partition` (theorem): sign σ = (−1)^(card α + number of parts of the partition of σ). Module: `TauCeti/GroupTheory/Perm/Partition.lean`.
- `mathlib:cycleType_finRotate` (theorem): The cycle type of finRotate (n + 2) is {n + 2}. Module: `Mathlib/GroupTheory/Perm/Fin.lean`.
- `mathlib:Matrix.GeneralLinearGroup` (abbrev): GL(n, R) is the unit group of n × n matrices over R; the Satake classes live in GL(Fin 2, R). Module: `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean`.
- `mathlib:Matrix.GeneralLinearGroup.det` (def): The determinant GL(n, R) →* Rˣ for a commutative ring R. Module: `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean`.

Tau Ceti's `Equiv.Perm.fullCycleType` is the orbit-length multiset of a permutation with fixed points counted, so the splitting type of a place in a cubic field is not redefined here. Everything else this part plans needs carriers absent at the pins: Weil groups of local and global fields with reciprocity, Weil–Deligne parameters, the local Langlands correspondences, automorphic representations of GL₂ and GL₃, their Rankin–Selberg factors and Hecke characters. Those statements are listed in the suggested file and are README targets.

## R17.4 — Local base change and non-normal cubic base change at every place

The route is local first. Restriction of parameters defines base change along any finite extension; for a cubic étale algebra the inductivity of L- and ε-factors, with Langlands' λ-constant, turns the twisted factors of the cubic lift into GL₂ × GL₃ pair factors, and the GL₂ local converse theorem shows that these characterise the lift. Globally the twisted L-functions of the restricted tensor product Π of the local lifts are, for χ not a norm, GL₂ × GL₃ Rankin–Selberg L-functions of π against the GL₃ induction of χ, and for χ = μ∘N products of a standard L-function over F and a twisted quadratic base change over M. Since the λ² have global product one, these satisfy the exact functional equations, and they are entire and bounded in vertical strips unless π is K-exceptional. The GL₂ converse theorem over K then makes Π cuspidal automorphic. Every place is treated, dyadic extraordinary ones included, and neither Artin automorphy (R17.5) nor Carayol's globalisation enters.

Planets: none added (the layer's planets are those of the R17.3 packet; the restructuring proposal below moves 'Non-normal cubic base change' onto the all-place theorem).

<a id="n-local-base-change"></a>

### Local base change by restriction of the Langlands parameter

**Declaration:** `TauCeti.GL2Transfer.localBaseChange`; definition; node `GL2AutomorphicRepresentationsAndTransfer:R17.4/local-base-change`.

Let F be a local field of characteristic zero (a finite extension of Q_p, or R, or C) and E a finite separable extension of F inside a fixed algebraic closure, so that W_E is an open subgroup of finite index of the Weil group W_F. For an irreducible admissible representation π of GL₂(F), let rec_F(π) = (r, N) be its Frobenius-semisimple Weil–Deligne parameter in the R16.3 arithmetic normalisation (at an archimedean F, the AF.1 Langlands parameter, with N = 0). The local base change of π to E is the irreducible admissible representation of GL₂(E) whose parameter is the restriction of (r, N) to W_E: BC_{E/F}(π) := rec_E^{-1}((r|_{W_E}, N)). For an étale F-algebra E = ∏_w E_w (the completion at v of a global extension), BC_{E/F}(π) is the family (BC_{E_w/F}(π))_w. The monodromy operator is restricted, not discarded, so twists of Steinberg go to twists of Steinberg. The definition applies to every finite separable E/F, Galois or not; for a cyclic extension of prime degree it is the Langlands–Shintani local lift of R17.4/local-compatibility, and for a non-Galois cubic extension it is the lift that the non-normal cubic transfer has at every place.

**Hypotheses.**

- F is a local field of characteristic zero and E/F a finite separable extension inside a fixed algebraic closure; W_E ⊂ W_F is open of finite index (Tau Ceti ClassFieldTheory Layer 9, the Weil-group transfer for finite extensions).
- rec_F and rec_E are the rank-two local Langlands correspondences of R16.3 (nonarchimedean, imported from ET.6, a bijection between irreducible admissible representations and Frobenius-semisimple two-dimensional Weil–Deligne representations) and of AF.1 (archimedean).
- Arithmetic normalisation of R16.3; the unitary/Tate half-twist commutes with restriction because |·|_F∘N_{E/F} = |·|_E.
- For a non-trivial étale algebra the output is a family indexed by the factors E_w; nothing is asserted about representations of GL₂ of a non-field algebra beyond this product.
- For GL_n, Boxer–Calegari–Gee–Pilloni §2.3 use the same definition from rec_K; the atlas routes that use to ET.6, which constructs rec but plans no base-change node. This node is the rank-two definition with the API that base change needs.

**Construction or proof.**

1. Restriction preserves the Weil–Deligne conditions: r|_{W_E} has open kernel on I_E = I_F ∩ W_E; on W_E one has deg_F = f·deg_E and q_E = q_F^f, so r(w)Nr(w)^{-1} = q_E^{deg_E(w)}N; restriction of a Frobenius-semisimple representation to a finite-index subgroup is Frobenius-semisimple (a power of a semisimple element is semisimple). Use the restriction operation of the R01.2 Weil–Deligne carrier.
2. Apply the bijection rec_E^{-1}. Isomorphic π give isomorphic outputs, so BC_{E/F} is defined on isomorphism classes.
3. Unramified case: on the unramified quotient Frob_E = Frob_F^f, so an unramified π with Satake class A goes to the unramified representation with Satake class A^f (R17.4/unramified-base-change).
4. Cyclic prime degree: R17.4/local-compatibility identifies the Langlands–Shintani lift (character identities, Langlands §2) with this restriction at every place, so the two definitions agree there.
5. Principal series, Steinberg twists and dihedral parameters: restrict the explicit R16.3 parameters (principal-series-parameter, steinberg-monodromy, supercuspidal-parameter); for an induced parameter use the Mackey formula (Tau Ceti InductionRestriction Layer 3, for a finite-index subgroup).

**Consumers determining the API.**

- AutomorphicGaloisRepresentations R19.2 (Carayol §12.3.1): At the single place 𝔭′ of the cubic field above 𝔭, the parameter of the base change must be the restriction of the parameter of π_𝔭; this is the definition here.
- GL2ModularityLifting R22.1 (Khare–Wintenberger II §7.6.2, §8): Allowable base change preserves weights at infinity, unramifiedness and conductor exponents along unramified local extensions, and kills tame ramification of principal series.
- Skinner, Ann. of Math. 191 (2020), §2.1 (PAPER-SKINNER-20/14): Root numbers ε(BC_{K_𝔩}(π_ℓ), 1/2) of the quadratic base change of special representations.
- Boxer–Calegari–Gee–Pilloni 2021 §2.3 (PAPER-BOXER-CALEGARI-GEE-PILLONI-21/155): BC_{L/K}(π) is characterised by rec_L(BC_{L/K}(π)) = rec_K(π)|_{W_L}; its rank-two case is this node.
- R17.4/nonnormal-cubic-strong-base-change (this packet): Prescribes the local component of the non-normal cubic transfer at every place.

**API.**

- `TauCeti.GL2Transfer.localBaseChange_self` (simp): BC_{F/F}(π) = π.
- `TauCeti.GL2Transfer.localBaseChange_tower` (functoriality): For F ⊂ E ⊂ E′ finite separable, BC_{E′/E}(BC_{E/F}(π)) = BC_{E′/F}(π), because restriction is transitive along W_{E′} ⊂ W_E ⊂ W_F.
- `TauCeti.GL2Transfer.localBaseChange_galois` (compatibility): For E/F Galois and σ ∈ Gal(E/F), BC_{E/F}(π)^σ ≅ BC_{E/F}(π): the restricted parameter is invariant under conjugation by a lift of σ in W_F.
- `TauCeti.GL2Transfer.localBaseChange_twist` (functoriality): BC_{E/F}(π ⊗ (χ∘det)) = BC_{E/F}(π) ⊗ ((χ∘N_{E/F})∘det) for every character χ of F^×, by local reciprocity's compatibility of restriction with the norm.
- `TauCeti.GL2Transfer.localBaseChange_central` (projection): The central character of BC_{E/F}(π) is ω_π∘N_{E/F}.
- `TauCeti.GL2Transfer.localBaseChange_contragredient` (compatibility): BC_{E/F}(π^∨) = BC_{E/F}(π)^∨.
- `TauCeti.GL2Transfer.localBaseChange_unramified` (simp): If E/F is unramified of degree f and π is unramified with Satake class A, then BC_{E/F}(π) is unramified with Satake class A^f (R17.4/unramified-base-change).
- `TauCeti.GL2Transfer.localBaseChange_principalSeries` (simp): BC_{E/F} of the irreducible constituent with parameter μ ⊕ ν (N = 0) has parameter (μ∘N_{E/F}) ⊕ (ν∘N_{E/F}); for an irreducible principal series π(μ,ν) this is π(μ∘N, ν∘N) whenever the latter is irreducible.
- `TauCeti.GL2Transfer.localBaseChange_steinberg` (simp): BC_{E/F}(St_F ⊗ (χ∘det)) = St_E ⊗ ((χ∘N_{E/F})∘det).
- `TauCeti.GL2Transfer.localBaseChange_dihedral` (characterisation): For a quadratic extension M/F, a character θ of M^× with θ ≠ θ^σ and π = π(Ind_{W_M}^{W_F} θ): if M embeds in E, BC_{E/F}(π) has parameter (θ∘N_{E/M}) ⊕ (θ^σ∘N_{E/M}); if E ⊗_F M is a field EM, BC_{E/F}(π) = π(Ind_{W_{EM}}^{W_E}(θ∘N_{EM/M})).
- `TauCeti.GL2Transfer.localBaseChange_cyclic` (compatibility): For E/F cyclic of prime degree, BC_{E/F}(π) is the Langlands–Shintani local lift of π (R17.4/local-compatibility).
- `TauCeti.GL2Transfer.localBaseChange_generic` (other): If π is unitary and infinite-dimensional, BC_{E/F}(π) is infinite-dimensional (generic): unitary principal series have unitary exponents, complementary series have exponent of absolute value below 1/2, which restriction preserves since |·|_F∘N = |·|_E, and Steinberg twists stay Steinberg twists.

**Unit tests.**

- `TauCeti.GL2Transfer.localBaseChange_self_test` (degenerate): For E = F and π = St_F, BC_{E/F}(π) = St_F.
- `TauCeti.GL2Transfer.localBaseChange_steinberg_inert_test` (computation): Let F be p-adic, E/F unramified quadratic and ξ the unramified quadratic character of F^×. Then ξ∘N_{E/F} = 1, so BC_{E/F}(St_F ⊗ ξ) = St_E.
- `TauCeti.GL2Transfer.localBaseChange_steinberg_ramified_test` (computation): Let E/F be ramified quadratic and ξ as above. Then ξ∘N_{E/F} is the unramified quadratic character ξ_E of E^× (a uniformiser of E has norm a uniformiser of F times a unit), so BC_{E/F}(St_F ⊗ ξ) = St_E ⊗ ξ_E.
- `TauCeti.GL2Transfer.localBaseChange_monodromy_test` (non-example): BC_{E/F}(St_F) is St_E, not the one-dimensional representation with parameter |·|_E^{1/2} ⊕ |·|_E^{-1/2} and N = 0: a rule that restricts r and forgets N fails here.
- `TauCeti.GL2Transfer.localBaseChange_dihedral_split_test` (characterisation): For M/F quadratic, θ ≠ θ^σ and π = π(Ind_{W_M}^{W_F} θ) supercuspidal, BC_{M/F}(π) is the irreducible principal series π(θ, θ^σ), not a supercuspidal representation.
- `TauCeti.GL2Transfer.localBaseChange_s3_test` (computation): Let K/F be a non-Galois cubic extension of p-adic fields with Galois closure L (Gal(L/F) ≅ S₃) and quadratic subfield M ⊂ L, and let τ = Ind_{W_M}^{W_F} ξ for a character ξ of M^× of order three trivial on N_{L/M}L^× (the two-dimensional irreducible representation of S₃). Then BC_{K/F}(π(τ)) = π(1, η_{L/K}), with η_{L/K} the quadratic character of K^× attached to L/K.

**Direct prerequisites.** `R16.3/principal-series-parameter`, `R16.3/steinberg-monodromy`, `R16.3/supercuspidal-parameter`, `R16.3/archimedean-factor-comparison`, `AutomorphicFormsOnReductiveGroups:AF.1/archimedean-llc-gln`, `ArithmeticGaloisRepresentations:R01.2/weil-deligne-representation`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group`, `R17.4/unramified-base-change`, `R17.4/local-compatibility`, `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-3-the-mackey-decomposition-formula`.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

**Acceptance checks.**

- For E = F the map is the identity.
- For E/F cyclic of prime degree it agrees with the Langlands–Shintani lift of R17.4/local-compatibility.
- It is defined for non-Galois extensions, for which no character-identity definition of the lift exists.

**Sources.**

- [Henri Carayol, Sur les représentations l-adiques associées aux formes modulaires de Hilbert](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf), §12.2.2, first paragraph, printed p. 457. Carayol states the general principle of base change for extensions of degree at most three: the parameter of the lifted representation should be the restriction to W_L of the parameter of π. He gives no reference, says it follows from the definitions for principal series and is easily checked for special and ordinary cuspidal π. The node takes the principle as the definition and proves the comparison with the character and factor definitions separately (local-compatibility, local-cubic-factor-identity).
- [Henri Carayol, Sur les représentations l-adiques associées aux formes modulaires de Hilbert](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf), §12.2.1(a), printed p. 457. For L/F of degree one, two or three, the local lift is defined in terms of characters (Langlands) or of L- and ε-factors (Jacquet–Piatetski-Shapiro–Shalika). These are the two older definitions this node is compared with.
- [Colin J. Bushnell and Guy Henniart, The Local Langlands Conjecture for GL(2)](https://link.springer.com/book/10.1007/3-540-31511-X), §33.4, Theorem and Exercise (a), book p. 214. The rank-two correspondence is characterised by the ε-factors of all character twists and commutes with twisting by characters; the node restricts the parameter that this correspondence attaches to π.

**Implementation status:** `unchecked`.

<a id="n-gl2-local-converse"></a>

### The GL₂ local converse theorem

**Declaration:** `TauCeti.GL2Transfer.gl2_local_converse`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.4/gl2-local-converse`.

Let F be a nonarchimedean local field and ψ a nontrivial additive character of F. If π₁, π₂ are irreducible smooth representations of GL₂(F) with L(s, χπ₁) = L(s, χπ₂) and ε(s, χπ₁, ψ) = ε(s, χπ₂, ψ) for every character χ of F^×, then π₁ ≅ π₂. Moreover π is cuspidal if and only if L(s, χπ) = 1 for every χ, and two cuspidal representations whose twisted ε-factors agree for one ψ have the same central character and agree for every ψ. Here χπ = π ⊗ (χ∘det), and L, ε are the Godement–Jacquet factors of AL.2.

**Hypotheses.**

- F nonarchimedean (all residue characteristics, p = 2 included); ψ ≠ 1.
- π₁, π₂ irreducible smooth; one-dimensional representations are included in the statement.
- The identities are required for every character χ of F^×, ramified ones included; finitely many twists do not suffice.

**Construction or proof.**

1. Non-cuspidal case: by BH 27.2 both are cuspidal or neither. A non-cuspidal π is determined by the function χ ↦ L(s, χπ), using the list of L-functions of BH 26.1: the unramified character set {χ₁, χ₂} is read off from a degree-two L-function, and a degree-one L-function distinguishes a ramified principal series from a twist of Steinberg by testing ramified twists (BH 27.3).
2. Cuspidal case: BH 27.4 reduces to ψ of level one and equal central characters; the Gauss-sum expression of cuspidal ε-factors (BH 27.7) recovers the trace of the cuspidal inducing datum on minimal elements, and BH 27.8 (Proposition) shows that this determines the inducing datum, hence π.

**Direct prerequisites.** `R16.2/local-classification`, `AutomorphicLFunctionsAndLocalFactors:AL.2/standard-local-l-factor`, `AutomorphicLFunctionsAndLocalFactors:AL.2/godement-jacquet-functional-equation`, `R16.3/conductor-epsilon-comparison`.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

**Acceptance checks.**

- A ramified quadratic twist π ⊗ η of a supercuspidal π with π ≇ π ⊗ η is separated from π by the ε-factor of some twist.
- The GL₃ analogue with GL₁ twists is the uniqueness clause of Jacquet–Piatetski-Shapiro–Shalika's Theorem 14.2(1), used through R17.4/nonnormal-cubic-gl3-induction, and is not restated here.

**Sources.**

- [Colin J. Bushnell and Guy Henniart, The Local Langlands Conjecture for GL(2)](https://link.springer.com/book/10.1007/3-540-31511-X), §27.1, Converse Theorem, book p. 170. Exact statement used: irreducible smooth π₁, π₂ of GL₂(F) whose L- and ε-factors agree after twisting by every character are isomorphic.
- [Colin J. Bushnell and Guy Henniart, The Local Langlands Conjecture for GL(2)](https://link.springer.com/book/10.1007/3-540-31511-X), §27.2 Proposition, book p. 170; §27.3, book p. 171. Cuspidality is detected by L(χπ) = 1 for all χ; the non-cuspidal case is settled by the list of L-functions of 26.1.
- [Colin J. Bushnell and Guy Henniart, The Local Langlands Conjecture for GL(2)](https://link.springer.com/book/10.1007/3-540-31511-X), §27.4 Lemma, book p. 171; §27.7 Theorem and §27.8 Proposition, book pp. 174–176. Equal twisted ε-factors force equal central characters and agreement for every ψ; the cuspidal case is proved through the Gauss-sum formula for ε and cuspidal inducing data.

**Implementation status:** `unchecked`.

<a id="n-lambda-square-product"></a>

### Langlands λ-constants: inductivity, square and global product

**Declaration:** `TauCeti.GL2Transfer.lambda_square_product`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.4/lambda-square-product`.

(a) Local. Let E/F be a finite separable extension of local fields of characteristic zero, ψ ≠ 1 an additive character of F and ψ_E = ψ∘Tr_{E/F}. Put λ(E/F, ψ) := ε(s, Ind_{E/F} 1_E, ψ)/ε(s, 1_E, ψ_E), with Deligne–Langlands ε-factors of the Weil group; it is independent of s. For every semisimple representation V of W_E of dimension n, ε(s, Ind_{E/F} V, ψ) = λ(E/F, ψ)^n ε(s, V, ψ_E), and the same holds for Weil–Deligne representations (V, N). Moreover λ(E/F, ψ)² = κ_{E/F}(−1), where κ_{E/F} := det Ind_{E/F} 1_E, viewed as a character of F^× by local reciprocity. For an étale algebra E = ∏_w E_w put λ(E/F, ψ) := ∏_w λ(E_w/F, ψ) and κ_{E/F} := ∏_w κ_{E_w/F}. At the archimedean place, with ψ_ℝ(x) = e^{2πix}, λ(ℂ/ℝ, ψ_ℝ) = i and κ_{ℂ/ℝ} = sgn, so again λ² = κ(−1) = −1. (b) Global. For a finite separable extension K/F of number fields and a nontrivial character ψ of A_F/F, ∏_v λ(K_v/F_v, ψ_v)² = 1, the product over all places with K_v = K ⊗_F F_v. In particular the ε-factors of a two-dimensional induction carry no global sign: ∏_v ε(s, Ind V_v, ψ_v) = ∏_v ∏_{w|v} ε(s, V_w, ψ_{K_w}) for every two-dimensional family (V_w) of local Weil–Deligne representations that is unramified almost everywhere.

**Hypotheses.**

- (a): local fields of characteristic zero; ε-factors of Weil and Weil–Deligne representations as in ArithmeticGaloisRepresentations R01.2/local-epsilon-factor (Deligne's normalisation, with compatible Haar measures); at archimedean places the explicit factors of R16.3/archimedean-factor-comparison.
- (b): K/F finite separable of number fields; κ_{K/F} = det Ind_{W_K}^{W_F} 1 is a quadratic or trivial Hecke character of F through global reciprocity. For K/F a non-Galois cubic field, κ_{K/F} = η_{M/F} with M the quadratic resolvent (the sign character of S₃); for a cyclic cubic field κ_{K/F} = 1.
- Only the square of λ has a global product formula here; ∏_v λ_v itself is not used.

**Construction or proof.**

1. Independence of s and the inductivity formula in dimension n are BH (30.4.1), 30.4 Corollary and (30.4.2): induction is inductive in degree zero (R01.2/local-epsilon-factor, API epsilonWeil_induced) applied to V − n·1_E.
2. Weil–Deligne case: by Deligne's formula ε(V, N) = ε(V)·det(−F | V^I/(ker N)^I), and the correction term is inductive, by the inertia invariants of an induced representation (R01.2/inertia-invariants-of-an-induced-representation) and the determinant of a cyclic block endomorphism (R01.2/determinant-of-a-cyclic-block-endomorphism).
3. λ² = κ(−1) is BH (30.4.3), from the functional equation ε(V, s, ψ)ε(V^∨, 1−s, ψ) = det V(−1) applied to V = Ind 1_E and V = 1_E. Archimedean: ε(1_ℝ, ψ_ℝ) = 1, ε(sgn, ψ_ℝ) = i and ε(1_ℂ, ψ_ℂ) = 1 in R16.3/archimedean-factor-comparison, and Ind_{ℂ/ℝ} 1 = 1 ⊕ sgn, so λ = i.
4. Global: Ind_{W_K}^{W_F} 1 restricted to W_{F_v} is ⊕_{w|v} Ind_{W_{K_w}}^{W_{F_v}} 1 (Mackey), so κ_{K/F} has local components κ_{K_v/F_v}, and ∏_v κ_{K_v/F_v}(−1) = κ_{K/F}(−1) = 1 because a Hecke character is trivial on F^× ∋ −1.
5. For a two-dimensional family, (a) gives ε(Ind V_v) = λ(K_v/F_v)² ∏_{w|v} ε(V_w) at every place, with λ = 1 almost everywhere (unramified K_v/F_v and ψ_v of conductor O_v), and the product of the λ² is 1.

**Direct prerequisites.** `ArithmeticGaloisRepresentations:R01.2/local-epsilon-factor`, `ArithmeticGaloisRepresentations:R01.2/local-factor-of-induced-representation`, `ArithmeticGaloisRepresentations:R01.2/inertia-invariants-of-an-induced-representation`, `ArithmeticGaloisRepresentations:R01.2/determinant-of-a-cyclic-block-endomorphism`, `R16.3/archimedean-factor-comparison`, `AutomorphicLFunctionsAndLocalFactors:AL.1/local-epsilon-gamma-factors`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`, `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-3-the-mackey-decomposition-formula`.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

**Acceptance checks.**

- For E = ℚ₃(√3)/ℚ₃, −1 is not a norm (x² − 3y² ≡ −1 mod 3 has no solution), so κ_{E/F}(−1) = −1 and λ(E/F, ψ) = ±i.
- For a non-Galois cubic K/F the global identity uses κ_{K/F} = η_{M/F}; a sign mistake here would change every global functional equation of R17.4/nonnormal-cubic-twisted-l-functions by −1 at an odd number of places.

**Sources.**

- [Colin J. Bushnell and Guy Henniart, The Local Langlands Conjecture for GL(2)](https://link.springer.com/book/10.1007/3-540-31511-X), §30.4, definition (30.4.1), Corollary, Remark (30.4.2) and (30.4.3), book pp. 194–195. Defines the Langlands constant λ_{E/F}(ψ) as the ratio of the ε-factors of Ind 1_E and 1_E, proves it is constant in s, records that ε(Ind ρ)/ε(ρ) = λ^n for ρ of dimension n, and that λ² = κ_{E/F}(−1), so λ is a fourth root of unity. Nonarchimedean only; the archimedean value and the global product are the node's own short computations.

**Implementation status:** `unchecked`.

<a id="n-local-cubic-induction"></a>

### Local automorphic induction to GL₃ from a cubic étale algebra

**Declaration:** `TauCeti.GL2Transfer.localCubicInduction`; definition; node `GL2AutomorphicRepresentationsAndTransfer:R17.4/local-cubic-induction`.

Let F be a local field of characteristic zero, K an étale F-algebra of degree three (a product of fields K_w) and χ = (χ_w) a family of characters of the K_w^×, viewed as characters of W_{K_w} by local reciprocity. Define I_{K/F}(χ) := rec_{F,3}^{-1}(⊕_w Ind_{W_{K_w}}^{W_F} χ_w), the irreducible admissible representation of GL₃(F) whose Frobenius-semisimple parameter (with N = 0) is the induced three-dimensional representation. If χ is unitary, I_{K/F}(χ) is tempered and generic, its central character is (χ restricted to F^×)·κ_{K/F}, and for every character η of F^× its twisted factors are L(s, I_{K/F}(χ) ⊗ η) = ∏_w L(s, χ_w·(η∘N_{K_w/F})) and ε(s, I_{K/F}(χ) ⊗ η, ψ) = λ(K/F, ψ)·∏_w ε(s, χ_w·(η∘N_{K_w/F}), ψ∘Tr). By splitting type: for K = F³ it is the principal series χ₁ ⊞ χ₂ ⊞ χ₃; for K = F × E with E a quadratic field it is χ₁ ⊞ π(Ind_{W_E}^{W_F} χ₂); for K a field it is supercuspidal exactly when Ind χ is irreducible, that is, when χ ≠ χ^σ (K/F cyclic) or when χ is not of the form μ∘N_{K/F} (K/F non-Galois).

**Hypotheses.**

- F a local field of characteristic zero; K an étale cubic F-algebra; χ a family of characters of the factors.
- rec_{F,3}: the local Langlands correspondence for GL₃ (ET.6 at finite places, AF.1 at archimedean places), compatible with twists, central characters and the L- and ε-factors of pairs.
- λ(K/F, ψ) and κ_{K/F} are those of R17.4/lambda-square-product.
- Unitary χ for the temperedness and genericity clauses; a quasi-character is reduced to this by a twist by |·|^t.

**Construction or proof.**

1. Define the parameter as the direct sum of inductions and apply rec_{F,3}^{-1} (ET.6/AF.1).
2. Factors: L is inductive (R01.2/local-factor-of-induced-representation), and ε of a one-dimensional induction is λ times ε of the character (R17.4/lambda-square-product with n = 1); the LLC for GL₃ preserves twisted L- and ε-factors (ET.6).
3. Central character: det Ind_{W_K}^{W_F} χ = (χ∘transfer)·det Ind 1 = χ|_{F^×}·κ_{K/F} (transfer corresponds to restriction to F^× under reciprocity).
4. Shape: the split and (1,2) cases are direct sums of inductions; for K a field, Ind χ is irreducible if and only if it has no one-dimensional constituent μ (a three-dimensional representation that splits has a one-dimensional summand), and by Frobenius reciprocity μ ⊂ Ind χ if and only if χ = μ|_{W_K} = μ∘N_{K/F}; for cyclic K this is χ = χ^σ by Hilbert 90 (Tau Ceti ClassFieldTheory Layer 8 for the norm description).

**Consumers determining the API.**

- R17.4/nonnormal-cubic-gl3-induction (this packet): Prescribes the local components of the global GL₃ induction from a non-normal cubic field at every place.
- R17.4/local-cubic-factor-identity (this packet): Its GL₂ × GL₃ Rankin–Selberg factors with π are the twisted factors of the cubic base change of π.
- Jacquet–Piatetski-Shapiro–Shalika, Automorphic forms on GL(3) II, (14.2) and the monomial remark: The local representation π(σ) attached to σ = Ind_K^F χ.
- R17.4/cubic-character-induction (R17.3 packet): Its local components at a cyclic cubic field are the cyclic case of this definition.

**API.**

- `TauCeti.GL2Transfer.localCubicInduction_split` (simp): For K = F × F × F and χ = (χ₁, χ₂, χ₃), I_{K/F}(χ) = χ₁ ⊞ χ₂ ⊞ χ₃.
- `TauCeti.GL2Transfer.localCubicInduction_oneTwo` (simp): For K = F × E with E/F a quadratic field and χ = (χ₁, χ₂), I_{K/F}(χ) = χ₁ ⊞ π(Ind_{W_E}^{W_F} χ₂).
- `TauCeti.GL2Transfer.localCubicInduction_factors` (characterisation): For unitary χ, I_{K/F}(χ) is the unique irreducible unitary representation of GL₃(F) with central character χ|_{F^×}·κ_{K/F} whose twisted L- and ε-factors are ∏_w L(s, χ_w(η∘N)) and λ(K/F, ψ)∏_w ε(s, χ_w(η∘N), ψ∘Tr) for all η (uniqueness: Jacquet–Piatetski-Shapiro–Shalika (14.2)(1)).
- `TauCeti.GL2Transfer.localCubicInduction_central` (projection): The central character of I_{K/F}(χ) is χ|_{F^×}·κ_{K/F}.
- `TauCeti.GL2Transfer.localCubicInduction_twist` (functoriality): I_{K/F}(χ·(μ∘N_{K/F})) = I_{K/F}(χ) ⊗ (μ∘det) for every character μ of F^×.
- `TauCeti.GL2Transfer.localCubicInduction_supercuspidal_iff` (characterisation): For K/F a non-Galois cubic field, I_{K/F}(χ) is supercuspidal if and only if χ is not of the form μ∘N_{K/F}; in that case I_{K/F}(μ∘N) = μ ⊞ (μ ⊗ π(τ_K)), with τ_K the two-dimensional irreducible representation of Gal(L/F) ≅ S₃ for the Galois closure L.
- `TauCeti.GL2Transfer.localCubicInduction_unramified` (simp): For K/F an unramified cubic field and χ unramified with χ(ϖ_K) = c, I_{K/F}(χ) is unramified and its Satake parameters are the three cube roots of c (the Frobenius matrix of Ind χ is the companion matrix of X³ − c).

**Unit tests.**

- `TauCeti.GL2Transfer.localCubicInduction_split_test` (degenerate): For K = F³ and χ = (1, 1, 1), I_{K/F}(χ) is the unramified principal series with Satake parameters (1, 1, 1).
- `TauCeti.GL2Transfer.localCubicInduction_unramified_test` (computation): For K/F unramified cubic and χ unramified with χ(ϖ_K) = 8, the Satake parameters are 2, 2ζ, 2ζ² for a primitive cube root of unity ζ: their product is 8, their sum is 0, and the cube of the Frobenius matrix is 8 times the identity.
- `TauCeti.GL2Transfer.localCubicInduction_central_test` (non-example): For K/F a non-Galois cubic field and χ = 1, the central character of I_{K/F}(1) is κ_{K/F} = η_{M/F}, which is nontrivial; a definition that forgets det Ind 1 and takes χ|_{F^×} = 1 fails.
- `TauCeti.GL2Transfer.localCubicInduction_reducible_test` (characterisation): For K/F a non-Galois cubic field and χ = μ∘N_{K/F}, I_{K/F}(χ) = μ ⊞ (μ ⊗ π(τ_K)) is not supercuspidal.

**Direct prerequisites.** `EndoscopicTransferAndUnitaryTraceComparison:ET.6`, `AutomorphicFormsOnReductiveGroups:AF.1/archimedean-llc-gln`, `ArithmeticGaloisRepresentations:R01.2/local-factor-of-induced-representation`, `ArithmeticGaloisRepresentations:R01.2/local-epsilon-factor`, [`R17.4/lambda-square-product`](#n-lambda-square-product), `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-8-separate-arithmetic-local-existence-and-the-local-class-field-correspondence`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group`, `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-3-the-mackey-decomposition-formula`.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

**Acceptance checks.**

- The pair identity L(s, π × I_{K/F}(χ)) = ∏_w L(s, BC_{K_w/F}(π) ⊗ χ_w) for π on GL₂(F) is the theorem R17.4/local-cubic-factor-identity.

**Sources.**

- [Hervé Jacquet, Ilja I. Piatetski-Shapiro and Joseph Shalika, Automorphic forms on GL(3). II](https://www.math.columbia.edu/~hj/Automorphic%20forms%20on%20GL(3)%20II.pdf), Theorem (14.2)(1) and the cases (14.2.4)–(14.2.5), printed pp. 253–254. For a unitary three-dimensional σ of the Weil group of a local field, the representation π(σ) of GL₃ is the unique irreducible unitary representation with central character det σ whose GL₁-twisted L- and ε-factors are those of σ; when σ is a sum of characters, or a character plus an irreducible two-dimensional τ, π(σ) is the corresponding induced representation. The node takes σ = Ind χ and obtains π(σ) from the modern correspondence.
- [Hervé Jacquet, Ilja I. Piatetski-Shapiro and Joseph Shalika, Automorphic forms on GL(3). II](https://www.math.columbia.edu/~hj/Automorphic%20forms%20on%20GL(3)%20II.pdf), remark after the proof of (14.2.2), printed p. 255. For a separable cubic K/F and a character of K^×, the induced three-dimensional representation; when K/F is not normal it is irreducible or the sum of a character and a two-dimensional monomial representation.

**Implementation status:** `unchecked`.

<a id="n-local-cubic-factor-identity"></a>

### Twisted factors of the cubic local lift

**Declaration:** `TauCeti.GL2Transfer.local_cubic_factor_identity`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.4/local-cubic-factor-identity`.

Let F be a local field of characteristic zero, K an étale cubic F-algebra with factors K_w, ψ ≠ 1 an additive character of F, π an irreducible generic representation of GL₂(F), and χ = (χ_w) characters of the K_w^×. Then ∏_w L(s, BC_{K_w/F}(π) ⊗ χ_w) = L(s, π × I_{K/F}(χ)) and ∏_w ε(s, BC_{K_w/F}(π) ⊗ χ_w, ψ∘Tr_{K_w/F}) = λ(K/F, ψ)^{−2}·ε(s, π × I_{K/F}(χ), ψ), with the GL₂ × GL₃ Rankin–Selberg factors of AL.3, and likewise for the contragredients. Consequently, when K = K_w is a cubic field (Galois or not) and F is nonarchimedean, BC_{K/F}(π) is the unique irreducible representation Π of GL₂(K) with central character ω_π∘N_{K/F} and L(s, Π ⊗ χ) = L(s, π × I_{K/F}(χ)), ε(s, Π ⊗ χ, ψ∘Tr) = λ(K/F, ψ)^{−2} ε(s, π × I_{K/F}(χ), ψ) for every character χ of K^×. This is the description of the local lift through L- and ε-factors that Jacquet–Piatetski-Shapiro–Shalika use (Carayol §12.2.1(a)); hence their lift corresponds to restriction of the Weil–Deligne parameter for every generic π: principal series, special, ordinary cuspidal and extraordinary cuspidal. The extraordinary case is the content of Carayol's Proposition 12.2.2.

**Hypotheses.**

- F of characteristic zero; π irreducible generic (infinite-dimensional); K étale cubic; χ arbitrary characters (not necessarily unitary).
- The GL₂ × GL₃ factors are those of AL.3 (Jacquet–Piatetski-Shapiro–Shalika); the local correspondences for GL₂ (R16.3, AF.1) and GL₃ (ET.6, AF.1) preserve the L- and ε-factors of pairs.
- λ(K/F, ψ) is the λ-constant of the étale algebra (R17.4/lambda-square-product); the exponent −2 is the dimension of the parameter of π.
- The uniqueness clause uses the GL₂ local converse theorem over K and is stated only at nonarchimedean F; at archimedean F every factor K_w is ℝ or ℂ and K_w/F is cyclic.

**Construction or proof.**

1. Pair compatibility: L(s, π × I_{K/F}(χ)) = L(s, rec(π) ⊗ ⊕_w Ind χ_w) and the same for ε (ET.6 for GL₂ × GL₃; AL.4/local-parameter-comparison).
2. Projection formula: rec(π) ⊗ Ind_{W_{K_w}}^{W_F} χ_w ≅ Ind_{W_{K_w}}^{W_F}(rec(π)|_{W_{K_w}} ⊗ χ_w), monodromy included.
3. Inductivity: L via R01.2/local-factor-of-induced-representation; ε via R17.4/lambda-square-product in dimension two, giving the factor λ(K_w/F, ψ)² for each w.
4. Rank-two correspondence over K_w: rec(BC_{K_w/F}(π)) ⊗ χ_w = rec(π)|_{W_{K_w}} ⊗ χ_w by definition (R17.4/local-base-change), and R16.3 matches the twisted factors of BC(π) ⊗ χ_w with those of this Weil–Deligne representation.
5. Uniqueness: a second Π with the same twisted factors for all χ is isomorphic to BC_{K/F}(π) by R17.4/gl2-local-converse over K.
6. Consequence for the JPSS lift: the factor description characterises BC_{K/F}(π); since BC is restriction by definition, the factor-defined lift corresponds to restriction for every type of π. No globalisation (Carayol §12.2.3) and no Artin automorphy (R17.5) are used.

**Direct prerequisites.** [`R17.4/local-base-change`](#n-local-base-change), [`R17.4/local-cubic-induction`](#n-local-cubic-induction), [`R17.4/lambda-square-product`](#n-lambda-square-product), [`R17.4/gl2-local-converse`](#n-gl2-local-converse), `EndoscopicTransferAndUnitaryTraceComparison:ET.6`, `R16.3/principal-series-parameter`, `R16.3/steinberg-monodromy`, `R16.3/supercuspidal-parameter`, `R16.3/archimedean-factor-comparison`, `AutomorphicFormsOnReductiveGroups:AF.1/archimedean-llc-gln`, `AutomorphicLFunctionsAndLocalFactors:AL.3/rs-local-factor`, `AutomorphicLFunctionsAndLocalFactors:AL.3/rs-local-functional-equation`, `AutomorphicLFunctionsAndLocalFactors:AL.4/local-parameter-comparison`, `ArithmeticGaloisRepresentations:R01.2/local-factor-of-induced-representation`, `ArithmeticGaloisRepresentations:R01.2/local-epsilon-factor`.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

**Acceptance checks.**

- Unramified check: F p-adic, K/F the unramified cubic field, π = St_F, χ = 1. Left side: BC(St_F) = St_K and L(s, St_K) = (1 − q^{−3(s+1/2)})^{−1}. Right side: I_{K/F}(1) is unramified with Satake parameters 1, ζ, ζ², and L(s, St_F × I(1)) = ∏_{a ∈ {1,ζ,ζ²}} (1 − a q^{−(s+1/2)})^{−1} = (1 − q^{−3(s+1/2)})^{−1}.
- Extraordinary check: for p = 2 and π extraordinary, with K the non-Galois cubic field cut out by a Sylow 2-subgroup of the S₄ projective image, BC_{K/F}(π) is supercuspidal with an imprimitive (dihedral) parameter.

**Sources.**

- [Henri Carayol, Sur les représentations l-adiques associées aux formes modulaires de Hilbert](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf), §12.2.1(a), printed p. 457. For extensions of degree at most three the local lift is described either through characters (Langlands) or through L- and ε-factors (Jacquet–Piatetski-Shapiro–Shalika). The node proves that the restriction lift satisfies the factor description and is characterised by it.
- [Henri Carayol, Sur les représentations l-adiques associées aux formes modulaires de Hilbert](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf), §12.2.2, Proposition and the preceding paragraph, printed p. 457. Carayol knows no reference for the compatibility of the lift with restriction, asserts it for principal series, special and ordinary cuspidal π, and proves the extraordinary case for p-adic L/F of degree at most three by a global argument. The node gives a uniform local proof from the pair-compatible correspondences.
- [Colin J. Bushnell and Guy Henniart, The Local Langlands Conjecture for GL(2)](https://link.springer.com/book/10.1007/3-540-31511-X), §30.4, (30.4.2), book p. 195. ε of an induced representation of dimension n is λ^n times ε of the representation: the source of the factor λ^{−2}.
- [Colin J. Bushnell and Guy Henniart, The Local Langlands Conjecture for GL(2)](https://link.springer.com/book/10.1007/3-540-31511-X), §27.1, Converse Theorem, book p. 170. Uniqueness of a GL₂ representation with given twisted L- and ε-factors.

**Implementation status:** `unchecked`.

<a id="n-local-cubic-explicit-lifts"></a>

### Explicit non-Galois cubic local lifts by type

**Declaration:** `TauCeti.GL2Transfer.local_cubic_explicit_lifts`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.4/local-cubic-explicit-lifts`.

Let K/F be a non-Galois cubic extension of p-adic fields of characteristic zero, L its Galois closure (Gal(L/F) ≅ S₃), M ⊂ L the quadratic subfield, σ the nontrivial automorphism of M/F and ξ a character of M^× of order three that is trivial on N_{L/M}L^× (so ξ^σ = ξ^{−1}). (0) Norm limitation: N_{K/F}(K^×) = F^×, so μ ↦ μ∘N_{K/F} is injective on characters of F^×. (i) BC_{K/F}(π(μ,ν)) = π(μ∘N, ν∘N) for every irreducible principal series π(μ,ν), and the output is irreducible. (ii) BC_{K/F}(St_F ⊗ μ) = St_K ⊗ (μ∘N). (iii) BC_{K/F}(μ∘det) = (μ∘N)∘det. (iv) Let π = π(Ind_{W_E}^{W_F} θ) be dihedral, with E/F quadratic and θ ≠ θ^{σ_E}. If E ≠ M, then KE/E is a non-Galois cubic extension and BC_{K/F}(π) = π(Ind_{W_{KE}}^{W_K}(θ∘N_{KE/E})), which is supercuspidal. If E = M, then KE = L and BC_{K/F}(π) = π(Ind_{W_L}^{W_K}(θ∘N_{L/M})); it is supercuspidal unless θ/θ^σ ∈ {ξ, ξ^{−1}}, in which case π ≅ μ ⊗ π(τ_K) for a character μ of F^×, with τ_K = Ind_{W_M}^{W_F} ξ, and BC_{K/F}(π) = π(μ∘N, (μ∘N)·η_{L/K}). These are the cases Carayol asserts without reference (principal series, special, ordinary cuspidal).

**Hypotheses.**

- K/F non-Galois cubic, F a finite extension of Q_p; characters through local reciprocity in the arithmetic normalisation.
- θ ≠ θ^{σ_E}, so π(Ind θ) is supercuspidal; extraordinary (primitive) π, which occur only for p = 2, are covered by R17.4/local-cubic-factor-identity and are not listed here.
- Cyclic cubic K/F is the Langlands case of R17.4/local-compatibility and is excluded.

**Construction or proof.**

1. (0) Norm limitation (Tau Ceti ClassFieldTheory Layer 8): N_{K/F}K^× = N_{K^{ab}/F}(K^{ab})^× for the maximal abelian subextension K^{ab}, which is F because K/F is non-Galois of prime degree.
2. (i)–(iii) Restrict the R16.3 parameters μ ⊕ ν, the Steinberg parameter and a character to W_K (R17.4/local-base-change API). Irreducibility of the output: (μ/ν)∘N = |·|_K^{±1} = (|·|_F^{±1})∘N forces μ/ν = |·|_F^{±1} by (0).
3. (iv) Since [W_F : W_E] = 2 and [W_F : W_K] = 3 are coprime, W_E W_K = W_F and Mackey gives Res_{W_K} Ind_{W_E}^{W_F} θ = Ind_{W_{KE}}^{W_K}(θ|_{W_{KE}}), and θ|_{W_{KE}} corresponds to θ∘N_{KE/E}. The Galois closure of KE/E is LE, with group Gal(L/L ∩ E): S₃ if E ≠ M, and C₃ if E = M.
4. If E ≠ M, (0) for KE/E shows that θ∘N_{KE/E} determines θ, so θ ≠ θ^σ gives an irreducible induction. If E = M, the characters of M^× trivial on N_{L/M}L^× are 1, ξ, ξ² (local reciprocity for the cyclic cubic L/M), so θ∘N = (θ∘N)^σ exactly when θ/θ^σ ∈ {1, ξ, ξ²}; the case θ/θ^σ = ξ^{∓1} gives θ = ξ^{±1}·(μ∘N_{M/F}) by Hilbert 90, hence π ≅ μ ⊗ π(τ_K).
5. For τ_K: W_K maps onto a subgroup of order two of S₃, on which τ_K has eigenvalues 1 and −1, the latter giving the character of W_K/W_L, that is η_{L/K}.

**Direct prerequisites.** [`R17.4/local-base-change`](#n-local-base-change), `R16.3/principal-series-parameter`, `R16.3/steinberg-monodromy`, `R16.3/supercuspidal-parameter`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-8-separate-arithmetic-local-existence-and-the-local-class-field-correspondence`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group`, `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-3-the-mackey-decomposition-formula`.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

**Acceptance checks.**

- A dihedral π with E ≠ M never loses supercuspidality under non-Galois cubic base change.
- For π(τ_K) itself the lift is the principal series π(1, η_{L/K}) (R17.4/local-base-change test localBaseChange_s3_test).

**Sources.**

- [Henri Carayol, Sur les représentations l-adiques associées aux formes modulaires de Hilbert](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf), §12.2.2, first paragraph, printed p. 457. The compatibility of the lift with restriction follows from the definitions for principal series and is checked without much difficulty for special and ordinary cuspidal representations; Carayol gives no details. The node writes these cases out explicitly.
- [Colin J. Bushnell and Guy Henniart, The Local Langlands Conjecture for GL(2)](https://link.springer.com/book/10.1007/3-540-31511-X), §34.1 Lemma, book p. 215. For a quadratic E/F and an admissible pair, the twist of the induced representation by the character κ_{E/F} attached to E is isomorphic to it, and the restriction of Ind θ to W_E is θ ⊕ θ^σ: the quadratic Mackey computation used in (iv).

**Implementation status:** `unchecked`.

<a id="n-local-base-change-invariants"></a>

### Local invariants under base change

**Declaration:** `TauCeti.GL2Transfer.local_base_change_invariants`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.4/local-base-change-invariants`.

Let E/F be a finite extension of local fields of characteristic zero and π an irreducible generic representation of GL₂(F); BC = BC_{E/F} as in R17.4/local-base-change. (a) Unramified extensions: if F is p-adic and E/F is unramified, the conductor exponent is unchanged, c(BC(π)) = c(π); if moreover π is unramified with Satake class A, BC(π) is unramified with Satake class A^f, f = [E:F]. (b) Tame principal series: if E/F is totally ramified of degree e and π = π(μ,ν) with μ and ν trivial on 1 + p_F and of order dividing e on O_F^×, then BC(π) is an unramified principal series. (c) Steinberg twists: BC(St ⊗ μ) = St_E ⊗ (μ∘N); for E/F quadratic and μ ∈ {1, ξ}, ξ the unramified quadratic character, the root number ε(1/2, BC(St ⊗ μ)) is −1 if E/F is unramified, and −μ(ϖ_F) if E/F is ramified: −1 for St, +1 for St ⊗ ξ. (d) Archimedean places: if E = F the component is unchanged; if F = ℝ and E = ℂ, the discrete series D_k (parameter Ind_{W_ℂ}^{W_ℝ}(z/|z|)^{k−1}, central character fixed) goes to the principal series of GL₂(ℂ) with parameter (z/|z|)^{k−1} ⊕ (z/|z|)^{1−k}. Hence for E/F a totally real extension of number fields the archimedean components (weights) of a global base change are those of π at the places below.

**Hypotheses.**

- (a): F p-adic, E/F unramified; c(·) the conductor exponent of R16.3/conductor-epsilon-comparison (c(π) = a(rec π)).
- (b): E/F totally ramified of degree e; μ and ν trivial on 1 + p_F (tamely ramified), with μ|_{O_F^×} and ν|_{O_F^×} of order dividing e.
- (c): ψ with central character factor trivial: the root number of St ⊗ μ with μ quadratic or trivial does not depend on ψ since the central character μ² is trivial.
- (d): normalisations of R16.3/archimedean-factor-comparison and AF.1.

**Construction or proof.**

1. (a) The Artin conductor of a Weil–Deligne representation depends only on its restriction to inertia (with N) and the upper-numbering filtration (R01.3/conductor-of-a-weil-deligne-representation); for unramified E/F, I_E = I_F with the same filtration (the Herbrand function is the identity; Tau Ceti LocalFieldsRamification Layers 2–3). The Satake part is R17.4/unramified-base-change.
2. (b) For E/F totally ramified the residue fields agree and N_{E/F}(u) ≡ ū^e for units, while N(1 + p_E) ⊂ 1 + p_F; so μ∘N is trivial on O_E^× when the order of μ|_{O_F^×} divides e, and likewise for ν (Tau Ceti LocalFieldsRamification Layers 2–3: residue fields and the unit filtration under norms).
3. (c) Restriction of the Steinberg parameter keeps N. BH 26.1 gives ε(s, φ St, ψ) = −ε(s, φ, ψ) for φ unramified; for φ ∈ {1, ξ_E} and ψ of conductor O the value at 1/2 is −φ(ϖ). Now ξ∘N_{E/F} is trivial for E/F unramified (N ϖ = ϖ²) and equals ξ_E for E/F ramified (N ϖ_E = ϖ_F·unit).
4. (d) Restrict the archimedean Weil parameters (R16.3/archimedean-factor-comparison): (z/|z|)^m induced from W_ℂ restricts to W_ℂ as (z/|z|)^m ⊕ (z̄/|z|)^m.

**Direct prerequisites.** [`R17.4/local-base-change`](#n-local-base-change), `R17.4/unramified-base-change`, `R16.3/steinberg-monodromy`, `R16.3/conductor-epsilon-comparison`, `R16.3/archimedean-factor-comparison`, `AutomorphicFormsOnReductiveGroups:AF.1/archimedean-llc-gln`, `ArithmeticGaloisRepresentations:R01.3/conductor-of-a-weil-deligne-representation`, `AutomorphicLFunctionsAndLocalFactors:AL.1/explicit-epsilon-factors`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-3-ramification-the-tame-and-wild-cases-and-the-filtration`.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

**Acceptance checks.**

- Skinner's table (Ann. of Math. 191 (2020) §2.1): St at an inert or ramified ℓ gives −1; St ⊗ ξ gives −1 at inert and +1 at ramified ℓ.
- For F = ℚ_p and E/F totally ramified of degree e = p − 1, a principal series with tame characters of order dividing p − 1 becomes unramified (Khare–Wintenberger II §7.6.2 use).

**Sources.**

- [Colin J. Bushnell and Guy Henniart, The Local Langlands Conjecture for GL(2)](https://link.springer.com/book/10.1007/3-540-31511-X), §26.1 Theorem, (26.1.2), book p. 162. For a twist φ·St of the Steinberg representation by an unramified character, L(π, s) = L(φ, s + 1/2) and ε(π, s, ψ) = −ε(φ, s, ψ): the source of the sign in (c).
- [Henri Carayol, Sur les représentations l-adiques associées aux formes modulaires de Hilbert](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf), §12.3.2, printed p. 459. Carayol uses a totally real quadratic extension split at the special place so that the base change acquires a second special place: the split and Steinberg clauses of this node.

**Implementation status:** `unchecked`.

<a id="n-cubic-splitting-satake"></a>

### Satake powers of cubic base change from a Frobenius permutation

**Declaration:** `TauCeti.GL2Transfer.cubicBaseChangeSatake`; definition; node `GL2AutomorphicRepresentationsAndTransfer:R17.4/cubic-splitting-satake`.

For a permutation g of Fin 3 = {0, 1, 2}, Tau Ceti's Equiv.Perm.fullCycleType g is the multiset of lengths of the orbits of ⟨g⟩, fixed points included. For A ∈ GL₂(R), R a commutative ring, define cubicBaseChangeSatake(A, g) := {A^f : f ∈ fullCycleType g}, a multiset of elements of GL₂(R). Arithmetic meaning: let K/F be a separable cubic extension of number fields with Galois closure L, identify the three F-embeddings of K into L with {0, 1, 2}, and let v be a finite place of F unramified in L with Frobenius class g_v. The places w | v of K correspond to the ⟨g_v⟩-orbits, with residue degrees f(w/v) the orbit lengths; if π_v is unramified with Satake class A, the Satake classes of the base change at the places above v form cubicBaseChangeSatake(A, g_v). The three types are (1,1,1) for g_v = 1, (2,1) for a transposition and (3) for a 3-cycle, and g_v is even exactly when the number of places of K above v is odd, that is when v splits in the quadratic resolvent M = F(√disc K).

**Hypotheses.**

- g a permutation of a three-element set; fullCycleType is invariant under conjugation, so the multiset depends only on the Frobenius class.
- A ∈ GL₂(R) for a commutative ring R (ℂ in the application); A^0 does not occur because every orbit length is at least one.
- Arithmetic reading: v unramified in L, Frobenius acting on the three embeddings; R16.3 arithmetic Satake normalisation.

**Construction or proof.**

1. Map f ↦ A^f over Tau Ceti's fullCycleType g; the splitting-type facts are Tau Ceti lemmas (sum, conjugation, identity, transposition, cycle, sign).
2. Dedekind–Frobenius: for v unramified in L, the degrees of the factors of the minimal polynomial of a primitive element of K over F_v (equivalently the residue degrees of the places w | v, Tau Ceti NumberFieldArithmetic Layer 5) are the cycle lengths of Frobenius (Milne, Theorem 8.23 with Corollary 8.22 and Theorem 3.41).
3. Satake powers: R17.4/local-base-change API localBaseChange_unramified at each w, with f = f(w/v).
4. Resolvent: Tau Ceti's sign_of_parts_partition gives sign(g) = (−1)^(3 + number of parts), so g is even exactly when the number of places is odd; the sign is the action of Frobenius on √disc, so v splits in M exactly then.

**Consumers determining the API.**

- R17.4/nonnormal-cubic-strong-base-change (this packet): Satake classes of the base change at unramified places, used for the almost-everywhere comparison with the weak transfer.
- R17.4/nonnormal-cubic-cuspidality (this packet): Frobenius types identify the K-exceptional representations through the eigenvalues of τ_K: {1,1}, {1,−1}, {ζ, ζ²}.
- R17.4/nonnormal-cubic-base-change (R17.3 packet), tests cubic_split_test, cubic_one_two_test, cubic_inert_test: These unramified Satake checks become instances of this typed definition.

**API.**

- `TauCeti.GL2Transfer.cubicBaseChangeSatake_conj` (compatibility): cubicBaseChangeSatake(A, h g h⁻¹) = cubicBaseChangeSatake(A, g) for every permutation h (fullCycleType_conj).
- `TauCeti.GL2Transfer.cubicBaseChangeSatake_one` (simp): cubicBaseChangeSatake(A, 1) = {A, A, A}.
- `TauCeti.GL2Transfer.cubicBaseChangeSatake_swap` (simp): cubicBaseChangeSatake(A, swap 0 1) = {A², A}.
- `TauCeti.GL2Transfer.cubicBaseChangeSatake_finRotate` (simp): cubicBaseChangeSatake(A, finRotate 3) = {A³}.
- `TauCeti.GL2Transfer.cubicBaseChangeSatake_card_le` (projection): The multiset has at most three elements (one per place of K above v).
- `TauCeti.GL2Transfer.cubicBaseChangeSatake_sign` (characterisation): sign(g) = 1 if and only if the multiset has an odd number of elements.
- `TauCeti.GL2Transfer.cubicBaseChangeSatake_det` (projection): The product of the determinants of the elements of cubicBaseChangeSatake(A, g) is det(A)³.

**Unit tests.**

- `TauCeti.GL2Transfer.cubic_satake_identity_test` (degenerate): cubicBaseChangeSatake(A, 1) = {A, A, A}.
- `TauCeti.GL2Transfer.cubic_satake_transposition_test` (computation): cubicBaseChangeSatake(A, swap 0 1) = {A², A}.
- `TauCeti.GL2Transfer.cubic_satake_cycle_test` (computation): cubicBaseChangeSatake(A, finRotate 3) = {A³}.
- `TauCeti.GL2Transfer.cubic_satake_cycleType_test` (non-example): Mapping f ↦ A^f over Equiv.Perm.cycleType instead of fullCycleType gives the empty multiset at g = 1, which loses the three split places; cubicBaseChangeSatake(A, 1) is not empty.
- `TauCeti.GL2Transfer.cubic_satake_det_test` (compatibility): For A = diag(2, 3) over ℚ and g = swap 0 1, the determinants of the outputs are 36 and 6, with product 216 = 6³.

**Direct prerequisites.** `tauceti:Equiv.Perm.fullCycleType`, `tauceti:Equiv.Perm.fullCycleType_def`, `tauceti:Equiv.Perm.sum_fullCycleType`, `tauceti:Equiv.Perm.fullCycleType_conj`, `tauceti:Equiv.Perm.fullCycleType_one`, `tauceti:Equiv.Perm.parts_partition_swap`, `tauceti:Equiv.Perm.parts_partition_of_isCycle`, `tauceti:Equiv.Perm.sign_of_parts_partition`, `mathlib:cycleType_finRotate`, `mathlib:Matrix.GeneralLinearGroup`, `mathlib:Matrix.GeneralLinearGroup.det`, `R17.4/unramified-base-change`, [`R17.4/local-base-change`](#n-local-base-change), `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-5-the-global-local-dictionary-at-finite-places`.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

**Acceptance checks.**

- For any g the product of the determinants of the multiset is det(A)³, matching the central character ω∘N_{K/F} at v.

**Sources.**

- [James S. Milne, Algebraic Number Theory](https://www.jmilne.org/math/CourseNotes/ANT.pdf), Theorem 8.23 (Dedekind) and Corollary 8.22, printed p. 145; Theorem 3.41, printed p. 62. For a place not dividing the discriminant, the degrees of the irreducible factors of the polynomial modulo the prime are the cycle lengths of Frobenius acting on its roots, and the factorisation of the polynomial gives the factorisation of the prime with these residue degrees.
- [Henri Carayol, Sur les représentations l-adiques associées aux formes modulaires de Hilbert](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf), §12.3.1, conditions (a)–(b), printed p. 458. Carayol chooses a global cubic L/F with a single place above 𝔭 and split above v₀: splitting types (3) and (1,1,1) in the notation here.

**Implementation status:** `unchecked`.

<a id="n-nonnormal-cubic-gl3-induction"></a>

### GL₃ automorphic induction from a non-normal cubic field

**Declaration:** `TauCeti.GL2Transfer.nonnormal_cubic_gl3_induction`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.4/nonnormal-cubic-gl3-induction`.

Let K/F be a non-Galois cubic extension of number fields, L its Galois closure and M ⊂ L the quadratic resolvent. Let χ be a unitary Hecke character of K. If χ is not of the form μ∘N_{K/F} for a Hecke character μ of F, then σ = Ind_{W_K}^{W_F} χ is irreducible and there is a cuspidal automorphic representation I_{K/F}(χ) of GL₃(A_F) with I_{K/F}(χ)_v = I_{K_v/F_v}(χ_v) (R17.4/local-cubic-induction) at every place v; its completed standard L-function is Λ_K(s, χ), and its central character is χ|_{A_F^×}·η_{M/F}. If χ = μ∘N_{K/F}, then σ = μ ⊕ (μ ⊗ τ_K) is reducible, with τ_K = Ind_{W_M}^{W_F} ξ the two-dimensional representation of Gal(L/F) ≅ S₃. The cyclic cubic case is R17.4/cubic-character-induction.

**Hypotheses.**

- K/F non-Galois cubic (Galois closure with group S₃); χ unitary; a quasi-character reduces to this by a twist by |·|^t.
- Global reciprocity identifies characters of W_K with Hecke characters of K, restriction from W_F with composition with N_{K/F}, and the transfer W_F^{ab} → W_K^{ab} with the inclusion A_F^× ⊂ A_K^×.
- The input is Jacquet–Piatetski-Shapiro–Shalika's Theorem (14.2), whose proof is the GL₃ converse theorem with GL₁ twists (AL.3/gln-converse-reduced-rank at n = 3).

**Construction or proof.**

1. Irreducibility: a reducible three-dimensional σ has a one-dimensional constituent μ; by Frobenius reciprocity χ = μ|_{W_K}, which is μ∘N_{K/F} under reciprocity. Conversely Ind(μ∘N) = μ ⊗ Ind 1 = μ ⊕ μ ⊗ τ_K (the permutation representation of S₃ on three points is the trivial plus the two-dimensional representation).
2. Analytic hypotheses of (14.2): for every unitary Hecke character η of F, L(s, σ ⊗ η) = L_K(s, χ·(η∘N_{K/F})) by inductivity of Artin factors at every place (R01.2/local-factor-of-induced-representation; archimedean factors by AF.1). This Hecke L-function is entire, because χ(η∘N) = |·|_K^{iu} = (|·|_F^{iu})∘N would put χ in norm form (AL.1/hecke-l-functional-equation), and bounded in vertical strips by Tate's integral representation (AL.1/tate-global-functional-equation).
3. Apply Theorem (14.2) with the remark on monomial representations: ⊗_v π_v is automorphic cuspidal, with π_v at finite v the unique irreducible unitary representation with central character det σ_v and the GL₁-twisted factors of σ_v (and generic), and π_v = π(σ_v) at infinite v.
4. Identify π_v with I_{K_v/F_v}(χ_v): the latter has the same central character and twisted factors (R17.4/local-cubic-induction API localCubicInduction_factors), so the uniqueness in (14.2)(1) gives equality; at infinite places use AF.1.
5. Central character: det σ = χ|_{A_F^×}·det Ind 1 = χ|_{A_F^×}·η_{M/F}.

**Direct prerequisites.** [`R17.4/local-cubic-induction`](#n-local-cubic-induction), `AutomorphicLFunctionsAndLocalFactors:AL.3/gln-converse-reduced-rank`, `AutomorphicLFunctionsAndLocalFactors:AL.1/hecke-l-functional-equation`, `AutomorphicLFunctionsAndLocalFactors:AL.1/tate-global-functional-equation`, `ArithmeticGaloisRepresentations:R01.2/local-factor-of-induced-representation`, `AutomorphicFormsOnReductiveGroups:AF.1/archimedean-llc-gln`, `AutomorphicFormsOnReductiveGroups:AF.3/cuspidal-automorphic-representation`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-8-finite-extensions-of-adeles-and-ideles`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters`, `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-3-the-mackey-decomposition-formula`.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

**Acceptance checks.**

- χ = 1_K: σ = 1 ⊕ τ_K is reducible and Λ_K(s) = Λ_F(s)·Λ(s, τ_K); no cuspidal GL₃ induction is asserted.
- The standard L-function of I_{K/F}(χ) is Λ_K(s, χ); twisting by η∘det gives Λ_K(s, χ(η∘N)).

**Sources.**

- [Hervé Jacquet, Ilja I. Piatetski-Shapiro and Joseph Shalika, Automorphic forms on GL(3). II](https://www.math.columbia.edu/~hj/Automorphic%20forms%20on%20GL(3)%20II.pdf), Theorem (14.2), printed pp. 253–254. For an irreducible unitary three-dimensional representation σ of the Weil group of F with every L(s, σ ⊗ χ) entire and bounded in vertical strips, the tensor product of the local π_v (uniquely characterised by GL₁-twisted factors at finite v, and π(σ_v) at infinite v) is automorphic cuspidal.
- [Hervé Jacquet, Ilja I. Piatetski-Shapiro and Joseph Shalika, Automorphic forms on GL(3). II](https://www.math.columbia.edu/~hj/Automorphic%20forms%20on%20GL(3)%20II.pdf), remark after the proof, printed p. 255. The theorem applies to σ induced from a character of a separable cubic extension K/F, provided σ is irreducible; for K/F not normal, σ is irreducible or the sum of a character and a degree-two monomial representation.
- [James W. Cogdell, Piatetski-Shapiro's work on converse theorems](https://people.math.osu.edu/cogdell.1/PSCT-www.pdf), §3, list of applications (iv), p. 10. The automorphy of monomial representations of GL₃ is an application of the converse theorem with twists of rank n − 2 = 1.

**Implementation status:** `unchecked`.

<a id="n-nonnormal-cubic-twisted-l-functions"></a>

### Twisted L-functions of the non-normal cubic lift

**Declaration:** `TauCeti.GL2Transfer.nonnormal_cubic_twisted_l_functions`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.4/nonnormal-cubic-twisted-l-functions`.

Let K/F be a non-Galois cubic extension of number fields, L its Galois closure, M the quadratic resolvent and ξ a Hecke character of M of order three cutting out L/M (so ξ^σ = ξ^{−1}). Let π be a unitary cuspidal automorphic representation of GL₂(A_F) and Π := ⊗′_w BC_{K_w/F_v}(π_v), the restricted tensor product of the local lifts of R17.4/local-base-change; it is irreducible admissible, generic, unramified almost everywhere, with central character ω_π∘N_{K/F}. For every unitary Hecke character χ of K: (a) if χ is not of the form μ∘N_{K/F}, then Λ(s, Π ⊗ χ) = Λ(s, π × I_{K/F}(χ)), the completed GL₂ × GL₃ Rankin–Selberg L-function; (b) if χ = μ∘N_{K/F}, then Λ(s, Π ⊗ χ) = Λ(s, π ⊗ μ)·Λ(s, BC_{M/F}(π ⊗ μ) ⊗ ξ), with BC_{M/F} the quadratic base change of R17.4/cyclic-base-change. In both cases, with ε(s, Π ⊗ χ) := ∏_w ε(s, Π_w ⊗ χ_w, ψ_{K,w}) for ψ_K = ψ∘Tr_{K/F}, the functional equation Λ(s, Π ⊗ χ) = ε(s, Π ⊗ χ)·Λ(1 − s, Π^∨ ⊗ χ^{−1}) holds. Λ(s, Π ⊗ χ) is entire and bounded in vertical strips for every χ unless π is K-exceptional, that is, BC_{M/F}(π) ≅ (ν∘N_{M/F})ξ ⊞ (ν∘N_{M/F})ξ^{−1} for a Hecke character ν of F.

**Hypotheses.**

- K/F non-Galois cubic of number fields; π unitary cuspidal on GL₂(A_F); χ unitary (a quasi-character χ|·|^t shifts s by t).
- Local components of Π are the restriction lifts at every place, archimedean ones included; they are generic by the API localBaseChange_generic.
- Global reciprocity for K, M and L/M; ξ is one of the two characters of A_M^×/M^×N_{L/M}A_L^× of order three.

**Construction or proof.**

1. Local identities. (a) At every place v: R17.4/local-cubic-factor-identity gives ∏_{w|v} L(s, Π_w ⊗ χ_w) = L(s, π_v × I(χ)_v) and the ε-identity with λ(K_v/F_v)^{−2}; I(χ)_v is the local component of the cuspidal I_{K/F}(χ) of R17.4/nonnormal-cubic-gl3-induction. (b) Ind_{K_v/F_v} 1 = 1 ⊕ τ_{K,v} with τ_{K,v} = ⊕_{u|v} Ind_{M_u/F_v} ξ_u, so the factors of Π_w ⊗ (μ∘N) multiply to those of π_v ⊗ μ times those of Res_{W_{M_u}}(rec π_v ⊗ μ) ⊗ ξ_u, which are the factors of BC_{M/F}(π ⊗ μ)_u ⊗ ξ_u by R17.4/local-compatibility; the ε-factors acquire λ(K_v/F_v)^{−2}λ(M_v/F_v)^{2}.
2. Global signs: ∏_v λ(K_v/F_v)² = ∏_v λ(M_v/F_v)² = 1 (R17.4/lambda-square-product), so the global ε-factors match.
3. Functional equations: (a) AL.3/rs-global-functional-equation for GL₂ × GL₃; (b) AL.2/global-godement-jacquet over F and, for BC_{M/F}(π ⊗ μ) ⊗ ξ, over M when it is cuspidal, or AL.1/hecke-l-functional-equation for its two Hecke characters when π ≅ π ⊗ η_{M/F}.
4. Entireness and bounds: (a) AL.3/rs-global-poles (Λ(s, π_n × π_m) is entire for n ≠ m) and AL.3/rs-vertical-strip-bounds (rank gap one). (b) Λ(s, π ⊗ μ) is entire (AL.2/global-godement-jacquet). If π ≇ π ⊗ η_{M/F}, BC_{M/F}(π) is cuspidal (R17.4/cuspidality) and the second factor is entire. If π ≅ π ⊗ η_{M/F}, BC_{M/F}(π) = θ ⊞ θ^σ with θ ≠ θ^σ (R17.4/cyclic-descent-fibers), and the second factor is Λ_M(s, θ(μ∘N)ξ)Λ_M(s, θ^σ(μ∘N)ξ), entire unless one of these characters is |·|_M^{iu} = (|·|_F^{iu})∘N; that happens for some μ exactly when θ ∈ {(ν∘N)ξ, (ν∘N)ξ^{−1}}, the K-exceptional case.
5. Boundedness in vertical strips of the GL₂ and Hecke factors: AL.3/rs-vertical-strip-bounds with m = 1 and Tate's integral representation.

**Direct prerequisites.** [`R17.4/local-base-change`](#n-local-base-change), [`R17.4/local-cubic-factor-identity`](#n-local-cubic-factor-identity), [`R17.4/lambda-square-product`](#n-lambda-square-product), [`R17.4/nonnormal-cubic-gl3-induction`](#n-nonnormal-cubic-gl3-induction), `R17.4/cyclic-base-change`, `R17.4/local-compatibility`, `R17.4/cuspidality`, `R17.4/cyclic-descent-fibers`, `AutomorphicLFunctionsAndLocalFactors:AL.3/rs-global-functional-equation`, `AutomorphicLFunctionsAndLocalFactors:AL.3/rs-global-poles`, `AutomorphicLFunctionsAndLocalFactors:AL.3/rs-vertical-strip-bounds`, `AutomorphicLFunctionsAndLocalFactors:AL.2/global-godement-jacquet`, `AutomorphicLFunctionsAndLocalFactors:AL.1/hecke-l-functional-equation`, `AutomorphicLFunctionsAndLocalFactors:AL.1/tate-global-functional-equation`, `ArithmeticGaloisRepresentations:R01.2/local-factor-of-induced-representation`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

**Acceptance checks.**

- At χ = 1_K the identity reads Λ(s, Π) = Λ(s, π)·Λ(s, BC_{M/F}(π) ⊗ ξ), the automorphic form of Ind_K^F 1 = 1 ⊕ Ind_M^F ξ.
- No λ-sign survives in the global functional equation; with the opposite sign convention the converse theorem could not be applied.

**Sources.**

- [James W. Cogdell, Piatetski-Shapiro's work on converse theorems](https://people.math.osu.edu/cogdell.1/PSCT-www.pdf), §3, list of applications (iv), p. 10. Non-normal cubic base change for GL₂ (Jacquet–Piatetski-Shapiro–Shalika) is listed among the applications of the converse theorem together with the automorphy of monomial GL₃ representations; the original proof is not reproduced there.
- [Henri Carayol, Sur les représentations l-adiques associées aux formes modulaires de Hilbert](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf), §12.2.1, printed p. 457. Base change for non-Galois cubic extensions was defined by Jacquet–Piatetski-Shapiro–Shalika by arguments from the theory of L-functions. No read source writes out the identities of this node; they are the packet's assembly of the factor identity, GL₃ induction and the Rankin–Selberg theory.
- [Hervé Jacquet, Ilja I. Piatetski-Shapiro and Joseph Shalika, Automorphic forms on GL(3). II](https://www.math.columbia.edu/~hj/Automorphic%20forms%20on%20GL(3)%20II.pdf), remark after the proof of (14.2.2), printed p. 255. The decomposition of the induced representation from a non-normal cubic field as a character plus a two-dimensional monomial representation, which is case (b).

**Implementation status:** `unchecked`.

<a id="n-nonnormal-cubic-strong-base-change"></a>

### Non-normal cubic base change at every place

**Declaration:** `TauCeti.GL2Transfer.nonnormal_cubic_strong_base_change`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.4/nonnormal-cubic-strong-base-change`.

Let K/F be a non-Galois cubic extension of number fields, with L, M, ξ as in R17.4/nonnormal-cubic-twisted-l-functions. For every isobaric automorphic representation π of GL₂(A_F) there is a unique isobaric automorphic representation BC_{K/F}(π) of GL₂(A_K) with BC_{K/F}(π)_w ≅ BC_{K_w/F_v}(π_v) at every place w | v, archimedean or not. Explicitly: (i) if π is cuspidal and not K-exceptional, BC_{K/F}(π) = ⊗′_w BC_{K_w/F_v}(π_v) and it is cuspidal; (ii) if π is cuspidal and K-exceptional, BC_{M/F}(π) ≅ (ν∘N_{M/F})ξ ⊞ (ν∘N_{M/F})ξ^{−1}, then ω_π = ν²η_{M/F} and BC_{K/F}(π) = (ν∘N_{K/F}) ⊞ (ν∘N_{K/F})η_{L/K}; (iii) if π = χ₁ ⊞ χ₂, BC_{K/F}(π) = (χ₁∘N_{K/F}) ⊞ (χ₂∘N_{K/F}). In all cases the central character is ω_π∘N_{K/F}, BC_{K/F}(π ⊗ χ) = BC_{K/F}(π) ⊗ (χ∘N_{K/F}), BC_{K/F}(π^∨) = BC_{K/F}(π)^∨, the Satake classes above an unramified v form cubicBaseChangeSatake(A_v, Frob_v), and BC_{K/F}(π) is the weak transfer of R17.4/nonnormal-cubic-base-change. Finally BC_{L/K}(BC_{K/F}(π)) = BC_{L/M}(BC_{M/F}(π)), both being the restriction of parameters to W_L at every place.

**Hypotheses.**

- K/F non-Galois cubic of number fields; π isobaric (cuspidal, or a sum of two Hecke characters); unitary normalisation, a general π being a twist by |det|^t of a unitary one.
- K-exceptional: π cuspidal with BC_{M/F}(π) ≅ (ν∘N)ξ ⊞ (ν∘N)ξ^{−1} for a Hecke character ν of F; on the Galois side these are the twists of the S₃ representation τ_K.
- The local lifts are the restriction lifts of R17.4/local-base-change; their identification with the factor-defined lift of Jacquet–Piatetski-Shapiro–Shalika is R17.4/local-cubic-factor-identity.
- No input from Artin automorphy (R17.5), from Carayol's globalisation, or from the trace formula is used.

**Construction or proof.**

1. (i) By R17.4/nonnormal-cubic-twisted-l-functions every Λ(s, Π ⊗ χ) is entire, bounded in vertical strips and satisfies the functional equation with the product of local ε-factors. Π is generic with central character ω_π∘N trivial on K^×, and the uniform exponent bound at unramified places passes to powers. The GL₂ converse theorem over K (R16.5/full-gl2-converse, the n = 2 case of AL.3/gln-converse-full-rank) makes Π cuspidal automorphic.
2. (ii) Central character: π ≅ π ⊗ η_{M/F} (R17.4/cyclic-descent-fibers). At an unramified v inert in M, π_v ≅ π_v ⊗ η_v forces Satake parameters {α, −α}, and BC_{M/F} gives α² = ν(ϖ_v)², so det = −ν(ϖ_v)² = (ν²η_M)(ϖ_v); at an unramified v split in M, the components of θ ⊞ θ^σ give det = ν(ϖ_v)²ξ|_{F_v^×}(ϖ_v) = ν(ϖ_v)², since ξ is trivial on A_F^× (ξ^σ = ξ^{−1} and ξ³ = 1). So ω_π = ν²η_M almost everywhere, hence everywhere (strong multiplicity one for GL₁, AL.3/strong-multiplicity-one).
3. (ii) Local components: for w | v and a place x of L above w, rec(π_v)|_{W_{M_u}} = θ_u ⊕ θ_u^σ (R17.4/local-compatibility), so rec(π_v)|_{W_{L_x}} = ν′ ⊕ ν′ with ν′ = ν∘N_{L_x/F_v} (ξ is trivial on norms from L) and N = 0. Hence R := rec(π_v)|_{W_{K_w}} ⊗ (ν∘N_{K_w/F_v})^{−1} factors through W_{K_w}/W_{L_x}, of order at most two, and is a sum of two characters from {1, η_{L_x/K_w}}. Its determinant is η_{M_v}∘N_{K_w/F_v} = η_{L_x/K_w} (local reciprocity is compatible with norms), so R = 1 ⊕ η_{L_x/K_w}, the component of (ν∘N) ⊞ (ν∘N)η_{L/K} at w.
4. (iii) Restrict characters at every place (R17.4/local-base-change API localBaseChange_principalSeries).
5. Uniqueness and the weak transfer: two isobaric representations with the same components almost everywhere are isomorphic (AL.3/isobaric-strong-multiplicity-one); the weak transfer has the Satake powers cubicBaseChangeSatake(A_v, Frob_v) almost everywhere (R17.4/cubic-splitting-satake), as does BC_{K/F}(π). Twists, contragredients, central characters and the composite with BC_{L/K} follow from the local API and uniqueness.

**Direct prerequisites.** [`R17.4/nonnormal-cubic-twisted-l-functions`](#n-nonnormal-cubic-twisted-l-functions), [`R17.4/local-base-change`](#n-local-base-change), [`R17.4/cubic-splitting-satake`](#n-cubic-splitting-satake), [`R17.4/local-cubic-factor-identity`](#n-local-cubic-factor-identity), `R16.5/full-gl2-converse`, `AutomorphicLFunctionsAndLocalFactors:AL.3/isobaric-strong-multiplicity-one`, `AutomorphicLFunctionsAndLocalFactors:AL.3/strong-multiplicity-one`, `R17.4/cyclic-base-change`, `R17.4/local-compatibility`, `R17.4/cyclic-descent-fibers`, `R17.4/nonnormal-cubic-base-change`, `AutomorphicFormsOnReductiveGroups:AF.2/automorphic-representation`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-8-separate-arithmetic-local-existence-and-the-local-class-field-correspondence`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-8-finite-extensions-of-adeles-and-ideles`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters`.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

**Acceptance checks.**

- At a place v whose Frobenius is a transposition and π_v unramified with Satake class A, the two components above v have Satake classes A and A².
- For π a twist of the dihedral representation attached to τ_K, the output is not cuspidal although π is.
- At a dyadic place where π_v is extraordinary and K_w/F_v is the non-Galois cubic extension cut out by a Sylow 2-subgroup, the component is the supercuspidal representation with the restricted (imprimitive) parameter; this is what Carayol §12.3.1 needs.

**Sources.**

- [Henri Carayol, Sur les représentations l-adiques associées aux formes modulaires de Hilbert](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf), §12.2.1(b), printed p. 457. For an extension of number fields of degree at most three and a cuspidal π, there is an automorphic Π whose component at every place w | v is the local lift of π_v, and simple criteria decide whether Π is cuspidal. Carayol gives no proof; the node proves this statement for the non-Galois cubic case with the local lift realised by restriction.
- [Henri Carayol, Sur les représentations l-adiques associées aux formes modulaires de Hilbert](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf), §12.2.3, printed p. 458. Carayol's proof of the extraordinary case passes from almost all places to all places by the uniqueness of the global lift; here the all-place statement is proved directly, so the extraordinary places need no separate argument.
- [James W. Cogdell, Piatetski-Shapiro's work on converse theorems](https://people.math.osu.edu/cogdell.1/PSCT-www.pdf), §3, list of applications (iv), p. 10. Non-normal cubic base change for GL₂ is obtained through the converse theorem; the route here uses the GL₂ converse theorem over K fed by GL₂ × GL₃ Rankin–Selberg theory.

**Implementation status:** `unchecked`.

<a id="n-nonnormal-cubic-cuspidality"></a>

### Non-normal cubic cuspidality criterion

**Declaration:** `TauCeti.GL2Transfer.nonnormal_cubic_cuspidality`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.4/nonnormal-cubic-cuspidality`.

Let K/F be a non-Galois cubic extension of number fields, with L, M, ξ and τ_K as above, and π an isobaric automorphic representation of GL₂(A_F). Then BC_{K/F}(π) is cuspidal if and only if π is cuspidal and not K-exceptional. For cuspidal π the following are equivalent: (1) π is K-exceptional, BC_{M/F}(π) ≅ (ν∘N_{M/F})ξ ⊞ (ν∘N_{M/F})ξ^{−1} for a Hecke character ν of F; (2) for almost all v, π_v has the Satake parameters of ν_v ⊗ τ_{K,v}, namely ν(ϖ_v)·{1, 1}, ν(ϖ_v)·{1, −1} or ν(ϖ_v)·{ζ, ζ²} when Frob_v is the identity, a transposition or a 3-cycle in S₃. In the exceptional case BC_{K/F}(π) = (ν∘N_{K/F}) ⊞ (ν∘N_{K/F})η_{L/K}. Unlike prime-cyclic base change of odd degree, which keeps every cuspidal representation cuspidal (R17.4/cuspidality), non-normal cubic base change can lose cuspidality, but only on the twists of the single S₃ dihedral representation attached to the Galois closure.

**Hypotheses.**

- K/F non-Galois cubic; π isobaric; ν a Hecke character of F.
- (2) uses the unramified places of L and π; the Satake parameters are in the unitary normalisation and ζ is a primitive cube root of unity.

**Construction or proof.**

1. Cuspidal non-exceptional π: R17.4/nonnormal-cubic-strong-base-change (i). Exceptional π and isobaric π: the outputs (ii), (iii) are isobaric sums of two characters, hence not cuspidal, and the isobaric output is unique.
2. (1) ⇒ (2): BC_{M/F}(π) and ω_π = ν²η_M determine the Satake parameters at unramified places: at v split in M they are (ν∘N)ξ and (ν∘N)ξ^{−1} at the two places above v, at v inert they are ±ν(ϖ_v); the Frobenius class of v in Gal(L/F) is read from the splitting of v in M and L (R17.4/cubic-splitting-satake).
3. (2) ⇒ (1): the Satake parameters of BC_{M/F}(π) at almost all places are then those of (ν∘N)ξ ⊞ (ν∘N)ξ^{−1}, and isobaric strong multiplicity one over M (AL.3/isobaric-strong-multiplicity-one) gives (1).

**Direct prerequisites.** [`R17.4/nonnormal-cubic-strong-base-change`](#n-nonnormal-cubic-strong-base-change), [`R17.4/cubic-splitting-satake`](#n-cubic-splitting-satake), `R17.4/cuspidality`, `R17.4/cyclic-base-change`, `AutomorphicLFunctionsAndLocalFactors:AL.3/isobaric-strong-multiplicity-one`.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

**Acceptance checks.**

- For cyclic cubic E/F every cuspidal π stays cuspidal; for non-normal K exactly the twists of π_{τ_K} lose cuspidality.
- For K = ℚ(∛2), M = ℚ(√−3), and π cuspidal with BC_{M/ℚ}(π) = ξ ⊞ ξ^{−1} for the cubic character ξ of ℚ(√−3) cutting out ℚ(∛2, √−3), the base change to K is 1 ⊞ η_{L/K}.

**Sources.**

- [Henri Carayol, Sur les représentations l-adiques associées aux formes modulaires de Hilbert](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf), §12.2.1(b), last sentence, printed p. 457. Simple criteria decide whether the global lift is cuspidal; the node states the criterion for non-Galois cubic extensions.
- [Hervé Jacquet, Ilja I. Piatetski-Shapiro and Joseph Shalika, Automorphic forms on GL(3). II](https://www.math.columbia.edu/~hj/Automorphic%20forms%20on%20GL(3)%20II.pdf), remark after the proof of (14.2.2), printed p. 255. Galois-side analogue: an induced representation from a non-normal cubic field is irreducible or a character plus a two-dimensional monomial representation; restriction to W_K of an irreducible two-dimensional ρ is reducible exactly when ρ is a twist of that two-dimensional summand.

**Implementation status:** `unchecked`.

## Dependencies on other roadmaps

Nodes of accepted packets are cited by id in the prerequisites above: R16.2–R16.5 and R17.2 of this roadmap, AutomorphicLFunctionsAndLocalFactors AL.1–AL.4, AutomorphicFormsOnReductiveGroups AF.1–AF.3 and ArithmeticGaloisRepresentations R01.2–R01.3. Every one of these roadmaps is in a lower upstream tier than this one. Stages without a finer node are requested:

- **EndoscopicTransferAndUnitaryTraceComparison:ET.6.** The characteristic-zero local Langlands correspondence for GL₃ over finite extensions of Q_p (and its GL₁ and GL₂ cases, which R16.3 specialises), as a bijection onto Frobenius-semisimple Weil–Deligne representations that (1) preserves the L- and ε-factors of twists by characters, (2) sends bounded (unitary) parameters to tempered, hence generic, representations, and (3) preserves the Rankin–Selberg factors of pairs: L(s, π × π′) = L(s, rec π ⊗ rec π′) and ε(s, π × π′, ψ) = ε(s, rec π ⊗ rec π′, ψ) for π on GL₂ and π′ on GL₃, with the AL.3 factors on the left (Harris–Taylor, Henniart). Only the GL₂ × GL₃ case and GL₁ twists are needed here. Needed by: [`R17.4/local-base-change`](#n-local-base-change), [`R17.4/local-cubic-induction`](#n-local-cubic-induction), [`R17.4/local-cubic-factor-identity`](#n-local-cubic-factor-identity), [`R17.4/nonnormal-cubic-gl3-induction`](#n-nonnormal-cubic-gl3-induction).
- **tauceti:TauCetiRoadmap/ClassFieldTheory#layer-8-separate-arithmetic-local-existence-and-the-local-class-field-correspondence.** Local norm limitation: for a finite extension K/F of p-adic fields, N_{K/F}(K^×) = N_{K′/F}(K′^×) for the maximal abelian subextension K′; in particular N_{K/F}(K^×) = F^× when K/F is a non-Galois cubic extension. Also the description of the characters of F^× trivial on norms from a cyclic extension (the order-three characters cutting out L/M). Needed by: [`R17.4/local-cubic-induction`](#n-local-cubic-induction), [`R17.4/local-cubic-explicit-lifts`](#n-local-cubic-explicit-lifts), [`R17.4/nonnormal-cubic-strong-base-change`](#n-nonnormal-cubic-strong-base-change).
- **tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group.** The local Weil group of a finite extension as an open finite-index subgroup of W_F (weilTransfer), compatibility of local reciprocity with restriction (norm) and with transfer (inclusion of F^×), used to restrict Weil–Deligne parameters and to identify Res_{W_K}(μ) with μ∘N_{K/F}. Needed by: [`R17.4/local-base-change`](#n-local-base-change), [`R17.4/lambda-square-product`](#n-lambda-square-product), [`R17.4/local-cubic-induction`](#n-local-cubic-induction), [`R17.4/local-cubic-explicit-lifts`](#n-local-cubic-explicit-lifts).
- **tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity.** Global Artin reciprocity for the Weil group of a number field: Hecke characters of K are characters of W_K, restriction from W_F corresponds to composition with N_{K/F}, transfer to the inclusion A_F^× ⊂ A_K^×, and η_{M/F}∘N_{K/F} = η_{KM/K}; local-global compatibility of these identifications at every place. Needed by: [`R17.4/lambda-square-product`](#n-lambda-square-product), [`R17.4/nonnormal-cubic-gl3-induction`](#n-nonnormal-cubic-gl3-induction), [`R17.4/nonnormal-cubic-twisted-l-functions`](#n-nonnormal-cubic-twisted-l-functions), [`R17.4/nonnormal-cubic-strong-base-change`](#n-nonnormal-cubic-strong-base-change).
- **tauceti:TauCetiRoadmap/GlobalNumberFields#layer-8-finite-extensions-of-adeles-and-ideles.** Norm pullback of Hecke characters along a finite extension of number fields, placewise given by the local norms, and its compatibility with towers K ⊂ L. Needed by: [`R17.4/nonnormal-cubic-gl3-induction`](#n-nonnormal-cubic-gl3-induction), [`R17.4/nonnormal-cubic-strong-base-change`](#n-nonnormal-cubic-strong-base-change).
- **tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters.** The continuous Hecke-character carrier, unitary characters and the |·|^{s} twists, and the fact that a Hecke character is trivial on F^× (used at −1 for the λ-product formula). Needed by: [`R17.4/nonnormal-cubic-gl3-induction`](#n-nonnormal-cubic-gl3-induction), [`R17.4/nonnormal-cubic-strong-base-change`](#n-nonnormal-cubic-strong-base-change).
- **tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-3-the-mackey-decomposition-formula.** The Mackey decomposition for the restriction of an induced representation along a subgroup of finite index (here open subgroups of finite index of Weil groups), and Frobenius reciprocity, used for Res_{W_K} Ind_{W_E}^{W_F}, for Ind_K^F 1 = 1 ⊕ τ_K and for the irreducibility criterion of Ind χ. Needed by: [`R17.4/local-base-change`](#n-local-base-change), [`R17.4/lambda-square-product`](#n-lambda-square-product), [`R17.4/local-cubic-induction`](#n-local-cubic-induction), [`R17.4/local-cubic-explicit-lifts`](#n-local-cubic-explicit-lifts), [`R17.4/nonnormal-cubic-gl3-induction`](#n-nonnormal-cubic-gl3-induction).
- **tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-5-the-global-local-dictionary-at-finite-places.** The dictionary between the places of a finite extension K = F[x]/(f) above a finite place v and the irreducible factors of f over F_v, with residue degrees, used to read splitting types from Frobenius. Needed by: [`R17.4/cubic-splitting-satake`](#n-cubic-splitting-satake).
- **tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius.** Unramified extensions of local fields: equality of inertia groups and of the ramification filtrations after an unramified extension, and Frobenius of E as the f-th power of Frobenius of F. Needed by: [`R17.4/local-base-change-invariants`](#n-local-base-change-invariants).
- **tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-3-ramification-the-tame-and-wild-cases-and-the-filtration.** Ramification filtrations and the Herbrand transition (identity for unramified extensions), and the behaviour of the unit filtration under the norm of a totally ramified extension (N_{E/F}(u) ≡ ū^e, N(1 + p_E) ⊂ 1 + p_F). Needed by: [`R17.4/local-base-change-invariants`](#n-local-base-change-invariants).

## Consumers and their requests

Requests to R17.4 found in other packets, and where they are answered:

- **AutomorphicGaloisRepresentations:R19.2, R19.4–R19.5 (Carayol §12.2–12.3).** Nodes: [`R17.4/local-base-change`](#n-local-base-change), [`R17.4/local-cubic-factor-identity`](#n-local-cubic-factor-identity), [`R17.4/local-cubic-explicit-lifts`](#n-local-cubic-explicit-lifts), [`R17.4/nonnormal-cubic-strong-base-change`](#n-nonnormal-cubic-strong-base-change), [`R17.4/nonnormal-cubic-cuspidality`](#n-nonnormal-cubic-cuspidality). Local and all-place non-Galois cubic base change and its identification with restriction of parameters for every type here; attached Galois representations, Carayol's Theorems (A)–(B) and the extraordinary place argument of §12.3.1 there.
- **GL2ModularityLifting:R22.1, R22.5–R22.6; PotentialModularityAndCompatibleSystems:R23.3, R23.5, R24.4–R24.5; OrdinaryAutomorphicFormsAndModularityLifting:R21.4–R21.5; SmallRamificationAndAbelianVarietyBaseCases:R25.5; EllipticCurveModularityImaginaryQuadratic:IQ.1; EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.6.** Nodes: [`R17.4/local-base-change-invariants`](#n-local-base-change-invariants), [`R17.4/local-base-change`](#n-local-base-change), `R17.4/cyclic-base-change`, `R17.4/local-compatibility`, `R17.4/cyclic-descent`, `R17.4/cyclic-descent-fibers`, `R17.4/solvable-base-change`, `R17.4/solvable-descent`, `R17.4/prescribed-local-base-change`. The automorphic half of solvable base change and descent (existence, all-place local components, weights, conductors, tame ramification, character fibres) is here. The Galois-side statement 'ρ is automorphic if and only if ρ|G_E is' (Gee Prop. 4.25; Barnet-Lamb–Geraghty–Harris–Taylor Lemma 1.3; BLGGT Lemma 2.2.2) needs the Galois representations attached to automorphic representations (AutomorphicGaloisRepresentations R19, downstream of R17.4) and is planned at PotentialAutomorphyInfrastructurePartII:PL.0/soluble-descent; it is not an R17.4 target.
- **Skinner 2020 §2.1 (PAPER-SKINNER-20/14); AutomorphicLFunctionsAndLocalFactors AL.2.** Nodes: [`R17.4/local-base-change-invariants`](#n-local-base-change-invariants). Root numbers of the quadratic base change of St and St ⊗ ξ here; the global sign ε(f, K) there.

## Red-team findings handed to this job

- **RT-AREA-automorphic-1/1** (high, missing): the GL(3) inputs of non-normal cubic base change and of the Langlands–Tunnell theorem. The R17.3 packet planned the adjoint lift, cyclic cubic induction and GL₃ recognition, with a weak non-normal cubic transfer, and proposed the sub-layer R17.4a. This part plans the non-normal cubic transfer completely: its GL₃ input is GL₃ induction from the non-normal cubic field, R17.4/nonnormal-cubic-gl3-induction, through Jacquet–Piatetski-Shapiro–Shalika's Theorem 14.2 and AL.3's reduced-rank converse theorem. Its GL₂ × GL₃ input is AL.3's Rankin–Selberg theory, and the GL₂ converse theorem is R16.5. The new nodes join the proposed R17.4a (restructuring below). The GL_n converse theorem stays planned once, in AL.3.
- **RT-AREA-langlands-2/4** (medium, error): R17.4 must plan the non-Galois cubic lifting and its local compatibility for R19.2. Done by R17.4/local-base-change, R17.4/local-cubic-factor-identity, R17.4/local-cubic-explicit-lifts and R17.4/nonnormal-cubic-strong-base-change. The extraordinary dyadic case, which the accepted fix leaves with R19.2 because Carayol proves it with Artin automorphy, follows here locally; the restructuring below makes R17.4 its owner and R19.2's node a citation. The edge R17.4 → R19.2 is supplied by the request of the AutomorphicGaloisRepresentations packet and by the interface above.

## Restructuring proposals

- **split** (GL2AutomorphicRepresentationsAndTransfer). The R17.3 packet proposes a layer R17.4a 'Non-normal cubic base change and the Gelbart–Jacquet lift' between R17.4 and R17.5 (adjoint-lift, cubic-character-induction, gl3-recognition, nonnormal-cubic-base-change). The non-normal cubic nodes of this packet belong to the same sub-layer. *Proposal:* If R17.4a is installed, it also holds R17.4/local-cubic-induction, R17.4/local-cubic-factor-identity, R17.4/local-cubic-explicit-lifts, R17.4/cubic-splitting-satake, R17.4/nonnormal-cubic-gl3-induction, R17.4/nonnormal-cubic-twisted-l-functions, R17.4/nonnormal-cubic-strong-base-change and R17.4/nonnormal-cubic-cuspidality; R17.4/local-base-change, R17.4/gl2-local-converse, R17.4/lambda-square-product and R17.4/local-base-change-invariants stay in R17.4, which R17.4a requires. The planet 'Non-normal cubic base change' of the R17.3 packet should then sit on R17.4/nonnormal-cubic-strong-base-change, which subsumes the weak node. Until the stage exists all these nodes realise R17.4.
- **rescope** (GL2AutomorphicRepresentationsAndTransfer, AutomorphicGaloisRepresentations). Carayol's Proposition 12.2.2 (the local lift along an extension of degree at most three corresponds to restriction of the parameter, for extraordinary cuspidal representations) is planned at AutomorphicGaloisRepresentations:R19.2/carayol-cubic-base-change-of-extraordinary with Carayol's global proof, which needs Artin automorphy (R17.5). This packet proves the same identification for every generic representation, the extraordinary ones included, locally from the pair-compatible correspondences (R17.4/local-cubic-factor-identity), and the all-place global statement Carayol §12.3.1 uses (R17.4/nonnormal-cubic-strong-base-change). *Proposal:* Owner of 'the cubic local lift corresponds to restriction of the Weil–Deligne parameter, all types': R17.4/local-cubic-factor-identity, with R17.4/local-base-change. AutomorphicGaloisRepresentations:R19.2/carayol-cubic-base-change-of-extraordinary becomes a citation of these nodes (Carayol's globalisation can be kept as a remark), and the proof step 12.3.1 of R19.2/hilbert-modular-compatible-system-carayol-theorem-A cites R17.4/nonnormal-cubic-strong-base-change for the all-place lift. The request of that packet to R17.4 (degree ≤ 3 base change with compatibility for principal series, special and ordinary cuspidal π) is answered by R17.4/local-cubic-explicit-lifts, R17.4/local-cubic-factor-identity and R17.4/nonnormal-cubic-strong-base-change for the non-Galois cubic case and by the R17.3 packet's R17.4/local-compatibility for the cyclic case.
- **rescope** (GL2AutomorphicRepresentationsAndTransfer). Several R17.4 nodes of the R17.3 packet cite whole stages of this roadmap where finer accepted nodes exist in the R16.1 packet, and the GL₂ local converse theorem planned here is rank-two local theory. *Proposal:* When the R17.3 packet is next revised: in R17.4/cyclic-base-change and R17.4/cyclic-descent replace the stage R17.2 by R17.2/specialized-trace-comparison, whose equality of distributions is the prerequisite that the R16.1 packet exports to R17.3 and R17.4, and R17.2/cyclic-local-matching; replace R16.3 by R16.3/principal-series-parameter, R16.3/steinberg-monodromy and R16.3/supercuspidal-parameter; replace R16.4 by R16.4/strong-multiplicity-one for cuspidal and by AutomorphicLFunctionsAndLocalFactors:AL.3/isobaric-strong-multiplicity-one for isobaric uniqueness; replace R16.5 in R17.4/nonnormal-cubic-base-change by R16.5/full-gl2-converse. When R16.3 is revised, R17.4/gl2-local-converse may move there, with R17.4 citing it.

## Gaps

- **Non-normal cubic transfer: published proof not read.** Needed by [`R17.4/nonnormal-cubic-twisted-l-functions`](#n-nonnormal-cubic-twisted-l-functions), [`R17.4/nonnormal-cubic-strong-base-change`](#n-nonnormal-cubic-strong-base-change), [`R17.4/nonnormal-cubic-cuspidality`](#n-nonnormal-cubic-cuspidality). The plan proves non-normal cubic base change at every place from supplier contracts: restriction lifts at every place, their factor identity with GL₂ × GL₃ Rankin–Selberg factors (pair-compatible LLC from ET.6), GL₃ induction from the cubic field (Jacquet–Piatetski-Shapiro–Shalika 1979, Theorem 14.2 and its monomial remark), the λ-square product formula and the GL₂ converse theorem over K (R16.5); the K-exceptional case is computed through the quadratic resolvent. Carayol §12.2.1 and Cogdell's survey (application (iv)) confirm the statement and that the original proof goes through the converse theorem and GL(3) theory, but no read source writes this route out. The original note, Jacquet–Piatetski-Shapiro–Shalika, Relèvement cubique non normal, C. R. Acad. Sci. Paris Sér. I 292 (1981), 567–571, is not freely available, and Mao–Rallis, Cubic base change for GL(2), Canad. J. Math. 52 (2000), 172–196 (a relative trace formula proof), is behind a paywall. A reviewer should check the route; obtaining either source would confirm it. This gap replaces, for the R17.4 nodes, the R17.3 packet's gap 'Original JPSS nonnormal cubic transfer proof': the all-place statement and the local correspondence for principal series, special and ordinary cuspidal representations are now planned (local-cubic-explicit-lifts, local-cubic-factor-identity, nonnormal-cubic-strong-base-change).

## Coverage

`GL2AutomorphicRepresentationsAndTransfer:R17.4`: **planned**. What remains:

- EndoscopicTransferAndUnitaryTraceComparison ET.6 has no packet: the GL₃ local Langlands correspondence with GL₁-twist and GL₂ × GL₃ pair compatibility is the requested external contract of the non-normal cubic route (request to ET.6). Until it is planned, local-cubic-induction and local-cubic-factor-identity rest on that stage.
- The proof route of nonnormal-cubic-twisted-l-functions and nonnormal-cubic-strong-base-change is this packet's assembly; the original Jacquet–Piatetski-Shapiro–Shalika note (C. R. Acad. Sci. Paris 292 (1981), 567–571) and Mao–Rallis (Canad. J. Math. 52 (2000), 172–196) were not available. Reading either would confirm the route or supply an alternative (gap 'Non-normal cubic transfer: published proof not read').
- Inherited from the R17.3 packet's R17.4 nodes and not changed here: the highly ramified T-twist GL₃ converse variant for adjoint-lift, the MetaplecticAutomorphicForms MP.5 input of adjoint-lift (a roadmap outside the Caraiani–Newton order, to be moved down or stated as a named input at package time), and the omitted suggested signature of gl3-recognition.
- Below target level, not required for this pass: the decomposition of prime-cyclic transfer, descent and tower independence, which waits for R17.2 and ET.4 to be decomposed (R17.3 packet coverage).

## Acceptance tests for the layer

- For a cubic field K/F with Frobenius a transposition at an unramified v, the two components above v have Satake classes A and A², and both are the restricted parameters.
- For the unramified cubic extension and π = St, the L-identity of the factor theorem reads (1 − q^{−3(s+1/2)})^{−1} on both sides.
- For K = ℚ(∛2) and the weight-one S₃ form attached to its Galois closure, non-normal cubic base change gives the non-cuspidal 1 ⊞ η_{L/K}; every non-exceptional cuspidal π stays cuspidal.
- Steinberg root numbers under quadratic base change: −1 for St at inert and ramified places; for St ⊗ ξ, −1 at inert and +1 at ramified places.
- Global functional equations of the twisted L-functions carry no sign from the λ-constants: ∏_v λ(K_v/F_v)² = κ_{K/F}(−1) = 1.

## Sources

- [Colin J. Bushnell and Guy Henniart, *The Local Langlands Conjecture for GL(2)*](https://link.springer.com/book/10.1007/3-540-31511-X), Grundlehren der mathematischen Wissenschaften 335, Springer, 2006; read in the copy the maintainer cleared for the atlas workers (book page = PDF page − 6). Read 2026-10-14: §26.1 Theorem, book p. 162; §27.1–27.4 and §27.7–27.8, book pp. 170–176 (Converse Theorem and its proof); §30.4, (30.4.1)–(30.4.3), book pp. 194–195 (Langlands constant); §33.4 Theorem and Exercise, book p. 214; §34.1 Theorem and Lemma, book pp. 214–215.
- [Hervé Jacquet, Ilja I. Piatetski-Shapiro and Joseph Shalika, *Automorphic forms on GL(3). II*](https://www.math.columbia.edu/~hj/Automorphic%20forms%20on%20GL(3)%20II.pdf), Annals of Mathematics (2) 109 (1979), 213–258; scan on H. Jacquet's Columbia page, without a text layer (read from the page images). Read 2026-10-14: end of §14.1, Theorem (14.2) with (14.2.3)–(14.2.5) and its proof, and the remark on monomial representations, printed pp. 253–255.
- [Henri Carayol, *Sur les représentations l-adiques associées aux formes modulaires de Hilbert*](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf), Annales scientifiques de l'École normale supérieure (4) 19 (1986), 409–468, published Numdam scan. Read 2026-10-14: §12.2.1–12.2.3, printed pp. 457–458 (cubic base change recollections (a)–(b), Proposition 12.2.2, Remark, proof); §12.3.1–12.3.2, printed pp. 458–459.
- [James W. Cogdell, *Piatetski-Shapiro's work on converse theorems*](https://people.math.osu.edu/cogdell.1/PSCT-www.pdf), Author survey (2013), author's web copy. Read 2026-10-14: §3, the list of applications (i)–(vi), p. 10.
- [James S. Milne, *Algebraic Number Theory*](https://www.jmilne.org/math/CourseNotes/ANT.pdf), Course notes, version 3.08 (19 July 2020), author's web copy (printed page = PDF page − 2). Read 2026-10-14: Theorem 3.41, printed p. 62; Proposition 8.21, Corollary 8.22 and Theorem 8.23, printed pp. 144–145.

The original note of Jacquet, Piatetski-Shapiro and Shalika, *Relèvement cubique non normal*, C. R. Acad. Sci. Paris Sér. I 292 (1981), 567–571, is not freely available; Mao and Rallis, *Cubic base change for GL(2)*, Canad. J. Math. 52 (2000), 172–196, is behind a paywall. Neither was read (see the gap). Tunnell's announcement (Bull. AMS 5 (1981)) refused automated download in this session and is cited only through the R17.3 packet's weak-transfer node.
