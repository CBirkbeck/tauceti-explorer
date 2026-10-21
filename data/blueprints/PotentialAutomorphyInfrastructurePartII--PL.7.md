# Residually reducible automorphy lifting — PL.7

This layer supplies the component-propagation argument behind ordinary residually reducible automorphy lifting and finiteness of ordinary deformation rings over CM fields. Its reusable objects are good CM extensions and potentially pro-automorphic primes. The main path chooses a good extension at a generic prime, propagates its Hecke-kernel containment down to minimal primes, and uses connectedness to reach every component. Ordinary classicality and soluble descent produce automorphy of algebraic points; a separate component argument produces module finiteness of the entire ring.

This is a continuation of [the parent roadmap](PotentialAutomorphyInfrastructurePartII.md), confined to **PotentialAutomorphyInfrastructurePartII:PL.7**. The ten parent targets below retain their existing node identifiers and declarations. This document specifies the additional definitions and key theorems needed by those targets; it does not reconstruct their general deformation, representation or automorphic foundations.

## Conventions and imported objects

All rings are commutative. “Finite over Λ” means finitely generated as a Λ-module. Prime ideals are ordered by inclusion. A prime of dimension one means that its quotient ring has Krull dimension one, rather than that its height is one. Characteristic l at a prime is expressed by containment of the coefficient uniformizer ϖ. In Lean the dimension codomain is the native extended natural numbers with a bottom element.

A CM field is a number field with the native Mathlib CM structure. “Soluble extension” means a finite extension whose normal closure has soluble Galois group; an automorphism group of a nonnormal extension does not determine this condition. Fix an algebraic closure for extensions and normal closures, and integral models for the residual representations. The source primitivity condition excludes an actual induction from any proper open subgroup. The stronger parent condition requires semisimplicity and excludes the semisimplification of any such induction. These conditions agree in the semisimple positive-rank range n<l by the parent PL.6/small-rank-primitivity target; the source assumes only l∤n in general.

Arithmetic Frobenius has cyclotomic value q_w. Thus the invariant condition on ad ρ̄(1) retains q_w multiplying conjugation. Regular algebraic weights are decreasing tuples as in ANT20 §1.1, p. 3; ordinary Galois weights and their signs are the parent PL.0/ordinary-of-weight convention. RACSDC means regular algebraic, conjugate self-dual and cuspidal. The chosen isomorphism ι identifies the algebraic l-adic coefficient closure with ℂ.

### Unitary convention U

The ANT unitary setup is as follows. L is a CM number field, L/L⁺ is unramified at finite places, l is odd, n≥2, and K/ℚ_l contains all images of embeddings of L, with integers O, residue field k and uniformizer ϖ. Enlarge K so every component of R¹_v and its special fibre at v∈R, and every component of the Steinberg special fibre at v∈B, is geometrically irreducible (Tho15 Propositions 3.15 and 3.17). T=S_l ⊔ B ⊔ R ⊔ A is a finite set of places of L⁺ split in L, with one lift ṽ for each v. B and R are prime to l and q_v≡1 mod l; B has even cardinality if n is even. The central simple L-algebra of degree n with second-kind involution is division at B and split elsewhere; its unitary group is definite at infinity and quasi-split away from B. A is nonempty, of odd residue characteristic, absolutely unramified and nonsplit in L(ζ_l). The level is hyperspecial away from T and at S_l, maximal compact at B, Iwahori at R and principal congruence at A, and is sufficiently small. A maximal ordinary Hecke ideal m with residue k has residual representation ρ̄=⊕_iρ̄_i, with distinct absolutely irreducible constituents, each ρ̄_i^c≅ρ̄_i^∨ε̄^{1−n}; ρ̄ is trivial at S_l∪B∪R, and is unramified with scalar Frobenius at A. Its Schur extension r̄ to 𝒢_n has multiplier ε̄^{1−n}δ_{L/L⁺}^n. The ordinary coefficient ring is Λ=⊗̂_{v∈S_l,O}O⟦I_{L_ṽ}^{ab}(l)^n⟧. The problem 𝒮₁ has fixed multiplier ε^{1−n}δ^n, ordinary local conditions at S_l, unipotent R¹_v at R, Steinberg conditions at B and unrestricted conditions at A. Write R₁=R^univ_{𝒮₁}, P₁ for its characteristic-polynomial subring, θ:P₁→R₁ and η:P₁→T₁ for the ordinary Hecke map, and J₁=ker η. All local degrees at l exceed n(n−1)/2+1.

Here B denotes the **set of Steinberg places**, not the central simple algebra itself; R denotes the unipotent-place set, and R₁ the deformation ring. This convention fixes the distinction throughout the layer. The coefficient enlargement is the geometric-component condition in Tho15 Propositions 3.15 and 3.17, pp. 18–20. Λ_M acts on R₁ through its natural norm-induced homomorphism to Λ, as in Tho15 Lemma 4.16 and Proposition 4.17, pp. 43–45. A good extension is completely split at l, A and R, while its places above B can change.

The maps used are θ:P₁→R₁ and η:P₁→T₁. The Hecke kernel is in P₁. Each occurrence of that kernel in an ideal of R₁ means its ideal extension along θ. Construction of P₁, the Hecke rings, their maps, and the deformation ring belongs to the parent PL.2 and PL.6 targets.

### Strong route S

For the established route assume l>3, l∤n, ζ_l∉L, r̄ restricted to G_{L⁺(ζ_l)} is Schur, ρ̄(G_L) has no quotient of order l, and ρ̄ is strongly primitive. Cyclotomic Schur includes that the polarized image meets both components of 𝒢_n; thus L⊄L⁺(ζ_l). Strong primitivity means semisimplicity and exclusion of the semisimplification of every induction from a proper open subgroup. Source primitivity instead excludes an actual induction; these conditions agree for semisimple positive rank n<l, but the general comparison is a recorded gap.

The strong route removes the residual-induction difficulty. For more than two constituents it still consumes the explicit arbitrary-constituent patching comparison from PL.6. The weak-source targets retain the full mathematical content of the source hypotheses, stated here in our own words; their additional proof inputs are stated below.

### Existing PL.7 targets

Every row is imported from the [parent packet](../packets/PotentialAutomorphyInfrastructurePartII.json) and [parent reader](PotentialAutomorphyInfrastructurePartII.md). The source labels refer to the public versions listed at the end of this document.

| Parent node suffix (after PotentialAutomorphyInfrastructurePartII:PL.7/) | Target and source | Role in this continuation |
| --- | --- | --- |
| ordinary-steinberg-finiteness | Ordinary ring finiteness, ANT20 Theorem 6.2, pp. 19–20 | Strong theorem imported; weak-source and auxiliary-place formulations are specified here. |
| residually-reducible-automorphy-lifting | General residually reducible lifting, ANT20 Theorem 6.1, pp. 17–19 | Strong theorem imported; connectedness proof and the weak-source statement are specified here. |
| two-constituent-automorphy-lifting | Two-constituent lifting, Tho15 Theorem 7.1, pp. 66–70 | Strong theorem imported; the exact weak-source statement is specified here. |
| sum-of-characters-finiteness | Character-sum finiteness, NT21 Theorem 5.2, pp. 67–69 | Consumes the small-rank lifting route and the PL.5 Dwork-family input. |
| ordinary-lifts-every-weight | Ordinary lifts at every compatible weight, NT21 Corollary 5.4, p. 70 | Imported; uses character-sum finiteness, local ordinary geometry and the global presentation. |
| unrestricted-ring-dimension-bound | Unrestricted ordinary ring dimension, NT21 Corollary 5.5, p. 70 | Imported; uses character-sum finiteness at one added Steinberg place. |
| reducible-locus-small | Reducible-locus bound, NT21 Proposition 5.6, pp. 71–72 | Imported; rank-one constituent finiteness is a precise G7 contract below. |
| generic-primes-large-quotients | Generic primes in large quotients, NT21 Theorem 5.7, pp. 72–73 | Imported; consumes the preceding reducible-locus bound. |
| global-lifts-schur | Schur global lifts, Bellovin–Gee Corollary 5.1.1, parent corrected formulation | Imported; does not become a new PL.7 definition or theorem here. |
| prescribed-type-lifts | Global lifts with prescribed types, NT21 Proposition 5.8, pp. 73–75 | Imported; uses local nonemptiness and character-sum/global finiteness. |

Import PL.0/auxiliary-cm-extensions and soluble-descent for the field choices and final descent; PL.2/big-ordinary-hecke-algebra and unitary-base-change-and-descent for Hecke finiteness, ordinary classicality and transfer; PL.3/ordinary-r-equals-t (its Corollary 8.7 finiteness clause) for variable-weight block finiteness in the two-constituent argument; PL.5/dwork-potential-ordinary-automorphy for character sums; and the PL.6 objects and theorems named in each target below. The absolute Galois groups, matrix representations, induction, prime ideals and dimension are existing library objects or parent definitions.

## Objects and key theorems

Each identifier below has prefix **PotentialAutomorphyInfrastructurePartII:PL.7/**. The proposed declarations have namespace **TauCeti.Automorphy.PL7**. Definition APIs have six items each; the first definition has five tests and the second has four. Tests state properties that an incorrect definition would fail, rather than an assertion that a proof has been implemented.

### Good CM extensions

**Identifier:** good-cm-extension. **Kind:** definition. **Suggested declaration:** TauCeti.Automorphy.PL7.IsGoodExtension.

Fix a CM field L, a finite Galois extension E/L containing L(ζ_l), and a finite set X of finite places of L. A finite extension M/L in an algebraic closure is good relative to (E,X) when M is CM, the Galois group of its normal closure over L is soluble, M and E are linearly disjoint over L, and every place of X splits completely in M. For ANT take E to be the extension of L(ζ_l) cut out by ρ̄|G_{L(ζ_l)}, and X the places above S_l∪A∪R. There is no splitting condition at B. Complete splitting means that for a nonzero prime P of O_L the number of primes of O_M above P is [M:L]; the number-field fundamental identity makes this equivalent to every corresponding completion being L_P.

**Hypotheses.**

- L CM; E/L finite Galois in a common algebraic closure
- M/L finite; X consists of nonzero finite primes of L

**Construction or proof.**

1. Use NumberField.IsCMField, IntermediateField.normalClosure, Group.IsSolvable and native linear disjointness.
2. Use the cardinality of Ideal.primesOver to express complete splitting; the finite-prime hypothesis excludes the zero ideal.
3. Instantiate E and X from the residual representation and unitary setup; constructing extensions is imported from PL.0/auxiliary-cm-extensions.

**Prerequisites.** mathlib:NumberField.IsCMField; mathlib:IntermediateField.normalClosure; mathlib:IntermediateField.LinearDisjoint; mathlib:Group.IsSolvable; mathlib:Ideal.primesOver; tauceti:NumberField.ncard_primesOver_eq_finrank_iff_of_isGalois; PotentialAutomorphyInfrastructurePartII:PL.0/auxiliary-cm-extensions.

**Source.**

- ANT20, §5, definition before Lemma 5.2, p. 16 (arXiv v2): Defines the extensions used to preserve residual data while allowing changes at the Steinberg places.
- Tho15, §6, definition before Proposition 6.2, p. 64 (accepted manuscript): Uses the same avoidance and splitting conditions for propagation.

**Uses that determine the API.**

- ANT20 Lemma 5.2: Preserves the residual image and cyclotomic Schur hypotheses.
- ANT20 Proposition 5.3 / Tho15 Proposition 6.2: Allows local extensions at B that kill unipotent inertia and make Frobenius scalar.
- ANT20 §5, tower diagram: Indexes the ideals J_M and their decreasing behaviour under extension.

**API.**

- **TauCeti.Automorphy.PL7.IsGoodExtension.iff_conditions** (characterisation): Goodness is equivalent to CM, soluble normal closure, linear disjointness from E, and the complete-splitting count at every P∈X.
- **TauCeti.Automorphy.PL7.IsGoodExtension.self** (example): The base field L, represented by the bottom intermediate field, is good relative to any E and X.
- **TauCeti.Automorphy.PL7.IsGoodExtension.linearDisjoint** (projection): A good M is linearly disjoint from E over L.
- **TauCeti.Automorphy.PL7.IsGoodExtension.splits** (projection): For P∈X, the number of primes of O_M above P equals [M:L].
- **TauCeti.Automorphy.PL7.IsGoodExtension.mono_split_set** (functoriality): If X′⊆X and M is good for (E,X), then M is good for (E,X′).
- **TauCeti.Automorphy.PL7.IsGoodExtension.tower** (functoriality): If M/L is good for (E,X) and N/M is good for (EM,X_M), then N/L is good for (E,X), where X_M comprises all primes over X.

**Unit tests.**

- **good_self** (degenerate): For L CM, the bottom intermediate field is good for any avoidance field E and any set X of nonzero finite primes.
- **not_good_meets_avoid** (non-example): If [M:L]>1, taking E=M prevents goodness, irrespective of the splitting set.
- **not_good_bad_split** (non-example): If P∈X and the number of primes of O_M above P differs from [M:L], then M is not good.
- **good_empty_split_set** (compatibility): For X empty, goodness is exactly the conjunction of the native CM, soluble-normal-closure and linear-disjointness conditions.
- **good_galois_splitting** (compatibility): When M/L is Galois, goodness at a nonzero finite prime P∈X implies that both the native ramification index and inertia degree above P are one, using the pinned Tau Ceti complete-splitting criterion.

**Acceptance.**

- L/L is good for every E and X.
- A nontrivial extension cannot be good relative to itself as avoidance field.
- Splitting at B is not required, enabling scalarisation of Steinberg restrictions.

### Potentially pro-automorphic primes

**Identifier:** potentially-pro-automorphic-prime. **Kind:** definition. **Suggested declaration:** TauCeti.Automorphy.PL7.IsPotentiallyProAutomorphic.

In the ANT unitary setup, for each good M/L form P_M, its Hecke homomorphism η_M:P_M→T_M and restriction α_M:P_M→P₁. Put J_M=(ker η_M)P₁=Ideal.map α_M(ker η_M). A prime 𝔭 of R₁ is potentially pro-automorphic when some good M satisfies Ideal.map θ(J_M)⊆𝔭. Equivalently, ker η_M maps into 𝔭 along θ∘α_M. The definition makes no map R₁→T₁ and does not identify potential pro-automorphy of a prime with automorphy of every point of its quotient. Its algebraic API applies to an arbitrary index set of permitted extensions and family of ideals of P₁.

**Hypotheses.**

- Unitary convention U.
- The index set consists exactly of good extensions; each restriction/Hecke diagram is supplied by PL.6/reducible-twisting-and-base-change.

**Construction or proof.**

1. Take the kernel in P_M, extend first to P₁ and then to R₁.
2. Use existential quantification over permitted extensions, not a universal condition over all extensions.
3. The equivalence with contraction follows from Ideal.map_le_iff_le_comap; tower inclusions of the J_M come from the imported base-change diagram.

**Prerequisites.** PotentialAutomorphyInfrastructurePartII:PL.7/good-cm-extension; PotentialAutomorphyInfrastructurePartII:PL.6/reducible-twisting-and-base-change; PotentialAutomorphyInfrastructurePartII:PL.6/polarized-pseudodeformation-subring; mathlib:PrimeSpectrum; mathlib:Ideal.map; mathlib:Ideal.comap; mathlib:RingHom.ker.

**Source.**

- ANT20, §5, diagram and definition before Proposition 5.3, p. 16 (arXiv v2): The kernel ideals descend along good extensions and define the existential prime condition.
- Tho15, §6, definition before Proposition 6.2, p. 64 (accepted manuscript): Introduces the prime condition via the Hecke kernel after restriction.

**Uses that determine the API.**

- ANT20 Proposition 5.3: Carries pro-automorphy from a generic prime to each minimal prime below it.
- ANT20 proof of Theorem 5.1: Partitions minimal primes and permits a separate extension witness on each component.
- ANT20 Corollary 5.4: Finite quotients by witness ideals lead to finiteness of the whole ring.

**API.**

- **TauCeti.Automorphy.PL7.IsPotentiallyProAutomorphic.iff_comap** (characterisation): For θ:P→R, family J indexed by permitted extensions and 𝔭∈Spec R, the condition is equivalent to ∃M, J_M⊆Ideal.comap θ 𝔭.
- **TauCeti.Automorphy.PL7.IsPotentiallyProAutomorphic.of_witness** (constructor): If Ideal.map θ(J_M)⊆𝔭 for a permitted M, then 𝔭 is potentially pro-automorphic.
- **TauCeti.Automorphy.PL7.IsPotentiallyProAutomorphic.mono_prime** (functoriality): If 𝔭⊆𝔮 and 𝔭 is potentially pro-automorphic, then 𝔮 is potentially pro-automorphic.
- **TauCeti.Automorphy.PL7.IsPotentiallyProAutomorphic.mono_ideals** (functoriality): For families J′_M⊆J_M, a witness for J also witnesses J′.
- **TauCeti.Automorphy.PL7.IsPotentiallyProAutomorphic.of_tower** (compatibility): If N extends a witness M and J_N⊆J_M, then N also witnesses the same prime.
- **TauCeti.Automorphy.PL7.IsPotentiallyProAutomorphic.ext** (extensionality): Families with identical extended ideals in R define identical prime predicates.

**Unit tests.**

- **potential_empty_index** (degenerate): An empty extension index set gives no potentially pro-automorphic prime.
- **potential_zero_ideal** (computation): With one permitted index and J=0, every prime is potentially pro-automorphic.
- **potential_unit_ideal** (non-example): With every J equal to the unit ideal, no prime is potentially pro-automorphic.
- **potential_quotient_kernel** (compatibility): For P=ℤ, R=ℤ/2ℤ, θ the quotient and a single J=(2), the zero prime of R is potentially pro-automorphic even though J is nonzero in P.

**Acceptance.**

- The base-extension witness recovers primes containing J₁R₁.
- A witness remains a witness at a larger prime.
- A larger good extension has a smaller ideal, so it also witnesses the same prime.

### Residual invariants under good extensions

**Identifier:** good-extension-residual-invariants. **Kind:** theorem. **Suggested declaration:** TauCeti.Automorphy.PL7.good_extension_residual_invariants.

In the ANT unitary setup assume ζ_l∉L, r̄|G_{L⁺(ζ_l)} Schur and ρ̄(G_L) without a quotient of order l. For good M/L the residual image over M equals the image over L, ζ_l∉M, M⊄M⁺(ζ_l), and r̄|G_{M⁺(ζ_l)} remains Schur. Weak primitivity is preserved. If l∤n and ρ̄ is strongly primitive, the restriction is strongly primitive as well. These are separate assertions; preserving weak primitivity does not establish the missing weak-to-strong comparison.

**Hypotheses.**

- Unitary convention U.
- M/L good for the specified residual avoidance field
- ζ_l∉L; cyclotomic Schur; no order-l quotient
- For the strong assertion, l∤n and strong primitivity

**Construction or proof.**

1. Linear disjointness from the residual-cyclotomic field gives equality of residual images, preserves distinct absolute constituents on the cyclotomic subgroup, and excludes ζ_l from M.
2. Intersect M with L(ζ_l) to retain independence of the CM quadratic extension and the cyclotomic extension; thus the restricted polarized representation still meets both components of 𝒢_n.
3. Actual induction of a representation factoring through its finite residual image also factors through that image: the kernel fixes every induced coset block. Hence weak primitivity is image-invariant.
4. Import PL.6/strong-primitivity-image-invariance for the stronger assertion, with l∤n explicit.

**Prerequisites.** PotentialAutomorphyInfrastructurePartII:PL.7/good-cm-extension; PotentialAutomorphyInfrastructurePartII:PL.6/schur-residual-representation; PotentialAutomorphyInfrastructurePartII:PL.6/primitive-representation; PotentialAutomorphyInfrastructurePartII:PL.6/strong-primitivity-image-invariance.

**Source.**

- ANT20, §5, Lemma 5.2 and proof, p. 16 (arXiv v2): Proves the residual-image and cyclotomic invariants for the extensions needed by propagation.

**Acceptance.**

- No new order-l quotient appears on restriction.
- The CM quadratic character is still nontrivial on the cyclotomic subgroup.
- Strong primitivity is inherited without an unproved identification of the two predicates.

### Propagation below a generic prime

**Identifier:** generic-potential-propagation. **Kind:** theorem. **Suggested declaration:** TauCeti.Automorphy.PL7.generic_potential_propagation.

In the ANT unitary setup and established strong route, assume [L⁺:ℚ]>|R| and let 𝔭⊂R₁ have dim(R₁/𝔭)=1, contain ϖ, be generic, and be potentially pro-automorphic. Generic means absolutely irreducible fraction-field representation, distinct ordinary inertial characters at every l-adic place, and at one place an inertia element whose n character values satisfy no nontrivial multiplicative ℤ-relation. Suppose r_𝔭 is trivial on G_{L_ṽ} for every v∈R and l^{v_l(q_v−1)}>n there. Then every minimal prime Q of R₁ contained in 𝔭 is potentially pro-automorphic. The weak-source version uses the weak restriction and weak generic R=T targets below and inherits their recorded proof boundary.

**Hypotheses.**

- Unitary convention U.
- Strong route S, including its explicit strong primitivity assumption.
- 𝔭 has dimension one and characteristic l, is generic and potentially pro-automorphic
- Trivial r_𝔭 at R and l^{v_l(q_v−1)}>n at R
- [L⁺:ℚ]>|R|, so the fraction-field-equalising twist can be chosen trivial at R

**Construction or proof.**

1. Choose a witness M₀. By PL.0/auxiliary-cm-extensions find a further good M₁/M₀ making r_𝔭 unramified with scalar Frobenius at every place over B: unipotent inertia and the remaining unipotent Frobenius part have finite l-power order in characteristic l.
2. Contract 𝔭 and Q to the ring over M₁. PL.6/genericity-under-restriction, with strong primitivity, preserves absolute irreducibility; splitting at l preserves the inertial character conditions.
3. Use the imported twisting/base-change theorem to equalise the fraction fields of P and R without changing which minimal primes lie below the point or losing the Hecke-kernel containment; choose the twist trivial at R. The complete splitting of R and the CM extension degree give [M₁⁺:ℚ]=[M₁⁺:L⁺][L⁺:ℚ]>[M₁⁺:L⁺]|R|=|R_{M₁}|, the inequality used in Tho15 Proposition 6.2, p. 65.
4. Apply PL.6/generic-prime-r-equals-t over M₁ to a minimal prime below the contracted Q and extend its kernel containment back to R₁. The ideal J_{M₁} is the required witness.

**Prerequisites.** PotentialAutomorphyInfrastructurePartII:PL.7/good-extension-residual-invariants; PotentialAutomorphyInfrastructurePartII:PL.7/potentially-pro-automorphic-prime; PotentialAutomorphyInfrastructurePartII:PL.0/auxiliary-cm-extensions; PotentialAutomorphyInfrastructurePartII:PL.6/generic-prime; PotentialAutomorphyInfrastructurePartII:PL.6/genericity-under-restriction; PotentialAutomorphyInfrastructurePartII:PL.6/reducible-twisting-and-base-change; PotentialAutomorphyInfrastructurePartII:PL.6/generic-prime-r-equals-t.

**Source.**

- ANT20, §5, Proposition 5.3 and proof, pp. 16–17 (arXiv v2): Reduces propagation to the earlier argument with its generic-prime theorem.
- Tho15, §6, Proposition 6.2 and proof, pp. 64–65 (accepted manuscript): Writes the scalarisation, contraction, twisting and minimal-prime steps.

**Acceptance.**

- The conclusion concerns all minimal primes below 𝔭, not all primes above it.
- The witness extension may depend on Q.
- The argument allows the places in B to fail to split.

### Connectedness and ordinary lifting

**Identifier:** connectedness-ordinary-lifting. **Kind:** theorem. **Suggested declaration:** TauCeti.Automorphy.PL7.connectedness_ordinary_lifting.

In the ANT unitary setup and established strong route, let D=[L⁺:ℚ], d₀ be the ℤ_l-rank lost in the anti-invariant abelian pro-l quotient when all places above B are required to split, and d_l=min_{v|l}[L⁺_v:ℚ_l]. Assume l^{v_l(q_v−1)}>n for every v∈R, d₀>|R|n(n+1)+3 and d_l>max(|R|n(n+1)+3,n(n−1)/2+1). Then every minimal prime of R₁ is potentially pro-automorphic. Consequently every O-valued type-𝒮₁ lift ordinary of weight λ is associated to an ordinary RACSDC representation of GL_n(𝔸_L) of weight λ. These are sufficient bounds for the characteristic-l dimension argument; the smaller printed bounds of ANT Theorem 5.1 are retained as a precisely delimited source boundary.

**Hypotheses.**

- Unitary convention U.
- Strong route S, including its explicit strong primitivity assumption.
- d₀ and d_l as defined in ANT §3.3
- The displayed sufficient strict inequalities
- l^{v_l(q_v−1)}>n at every v∈R, as required by generic propagation and the local component comparison
- For the automorphy conclusion, an O-valued type-𝒮₁ lift of weight λ

**Construction or proof.**

1. The witness quotient R₁/(ϖ,J_MR₁) is finite over Λ/(ϖ), by the Hecke finiteness and finite restriction maps. The imported large-quotient theorem supplies a generic prime whenever its dimension exceeds max(nD−d₀,nD−d_l).
2. Let J_R be the ideal forcing triviality of the local lifts at R. In characteristic l imposing it costs at most |R|n² dimensions. The base witness J_L gives one generic potentially pro-automorphic prime, and propagation gives at least one potentially pro-automorphic minimal prime.
3. Partition the minimal primes into witnessed and unwitnessed classes. The connectedness estimate c(R₁)≥nD−|R|n−2 supplies Q₁,Q₂ in the two classes with dim R₁/(Q₁+Q₂) at least that bound. This is the arithmetic bound in the acceptance contract of PL.6/connectedness-dimension (Tho15 Lemma 3.21, p. 22), obtained from the local and global presentations, rather than a consequence of the definition of c alone. Also D≥d_l>|R|, so propagation’s twist hypothesis holds.
4. Pass explicitly to the special fibre before imposing J_R. The resulting bound is nD−|R|n(n+1)−3. The displayed strict inequalities make this greater than both bad-locus bounds. Since the quotient is over a witnessed component it is finite over Λ/(ϖ), so it contains a generic prime witnessing both Q₁ and Q₂. Propagation contradicts the partition.
5. For an O-point choose a minimal prime in its kernel and a witness extension. The characteristic-polynomial map factors through the ordinary Hecke algebra there. Ordinary classicality, transfer from the definite unitary group, and soluble GL_n descent give automorphy. A place in B gives absolute irreducibility.

**Prerequisites.** PotentialAutomorphyInfrastructurePartII:PL.7/generic-potential-propagation; PotentialAutomorphyInfrastructurePartII:PL.6/connectedness-dimension; PotentialAutomorphyInfrastructurePartII:PL.6/large-quotients-contain-generic-primes; PotentialAutomorphyInfrastructurePartII:PL.6/reducible-locus-dimension; PotentialAutomorphyInfrastructurePartII:PL.6/reducible-twisting-and-base-change; PotentialAutomorphyInfrastructurePartII:PL.2/big-ordinary-hecke-algebra; PotentialAutomorphyInfrastructurePartII:PL.2/unitary-base-change-and-descent; PotentialAutomorphyInfrastructurePartII:PL.0/soluble-descent; mathlib:Ideal.minimalPrimes; mathlib:ringKrullDim; PotentialAutomorphyInfrastructurePartII:PL.6/polarized-pseudodeformation-subring.

**Source.**

- ANT20, §5, Theorem 5.1 and proof, pp. 15–17 (arXiv v2): Uses connectedness to spread potential pro-automorphy between components and then applies classicality and descent.
- Tho15, §6, proof of Theorem 6.1, pp. 65–66 (accepted manuscript): Explicitly includes the extra special-fibre dimension cost in the component-intersection estimate.
- Tho15, §3.3.6, Lemma 3.21, p. 22; §6, Theorem 6.1(2), p. 64 (accepted manuscript): Supplies the arithmetic connectedness bound and states the residue-cardinality condition used in propagation.

**Acceptance.**

- The special-fibre step is charged one dimension before the characteristic-l estimate is used.
- For n=2 and |R|=1 the sufficient bound is d₀,d_l>9; no extra factor 1/2 enters.
- Ordinary classicality applies at the prescribed algebraic weight; a Hecke-kernel containment alone is not called automorphy.

### Finiteness after component propagation

**Identifier:** connectedness-ring-finiteness. **Kind:** theorem. **Suggested declaration:** TauCeti.Automorphy.PL7.connectedness_ring_finiteness.

With the residual and numerical hypotheses of connectedness-ordinary-lifting, R₁ is a finite Λ-algebra. No O-valued lift and no choice of an algebraic weight is required for this ring statement. More generally, for a Noetherian Λ-algebra over a Noetherian coefficient ring Λ, if each minimal-prime quotient is finite over Λ, the whole ring is finite over Λ.

**Hypotheses.**

- Unitary convention U.
- Strong route S, including its explicit strong primitivity assumption.
- The sufficient d₀,d_l bounds and the l^{v_l(q_v−1)}>n condition at R of connectedness-ordinary-lifting
- Noetherian complete local coefficient rings, as in the imported deformation-ring problem

**Construction or proof.**

1. Component propagation supplies, for each minimal Q, a good M with J_MR₁⊆Q.
2. The restriction map R_M→R₁ and the map P_M→R_M are finite (PL.6/reducible-twisting-and-base-change and polarized-pseudodeformation-subring). After quotienting by J_M, R₁/J_MR₁ is finite over P_M/J_M, the ordinary Hecke algebra finite over Λ_M. Hence R₁/Q is finite over Λ_M and therefore over Λ, whose action is the norm-induced Λ_M→Λ action.
3. There are finitely many minimal primes. Embed the reduced quotient into their product. The nilradical in a Noetherian ring is nilpotent; its successive quotients are finitely generated over the reduced quotient. This gives finiteness of R₁, rather than only of its reduced quotient.

**Prerequisites.** PotentialAutomorphyInfrastructurePartII:PL.7/connectedness-ordinary-lifting; PotentialAutomorphyInfrastructurePartII:PL.6/reducible-twisting-and-base-change; PotentialAutomorphyInfrastructurePartII:PL.2/big-ordinary-hecke-algebra; mathlib:RingHom.Finite; mathlib:Ideal.minimalPrimes; mathlib:Ideal.finite_minimalPrimes_of_isNoetherianRing; mathlib:Module.finite_of_surjective_of_ker_le_nilradical; PotentialAutomorphyInfrastructurePartII:PL.6/polarized-pseudodeformation-subring.

**Source.**

- ANT20, §5, Corollary 5.4, p. 17 (arXiv v2): Extracts the ring-finiteness consequence of the component argument.
- Tho15, §6, proof of Theorem 6.1, p. 65 (accepted manuscript): Explains the finite maps from the restricted deformation and Hecke rings to witness quotients.

**Acceptance.**

- The result includes nilpotents.
- It is module finiteness over Λ, not merely finite type.
- It can be used in ANT Theorem 6.2 without first producing a specified ordinary lift.

### Generic restriction with source primitivity

**Identifier:** weak-primitive-generic-restriction. **Kind:** theorem. **Suggested declaration:** TauCeti.Automorphy.PL7.weak_primitive_generic_restriction.

Let l>3, k be finite of characteristic l, A=k⟦T⟧ and K=Frac(A). For a CM field F and ramification set S containing the l-adic places, all split over F⁺, let r:G_{F⁺,S}→𝒢_n(A) satisfy: r|G_F⊗K absolutely irreducible; ζ_l∉F; r̄|G_{F⁺(ζ_l)} Schur; r̄|G_F weakly primitive; the residual image over F(ζ_l) has no nontrivial l-power quotient; some σ₀∈G_F acts with distinct eigenvalues in A× having no nontrivial multiplicative ℤ-relation; l∤n; and νr(c)=−1. The source target is absolute irreducibility of r|N⊗K for every open N⊂G_F. Under n<l the parent proves this from weak primitivity. For arbitrary n prime to l, the target carries the residual-induction gap below; this node does not assert that the parent strong theorem proves it.

**Hypotheses.**

- All hypotheses in the statement; in particular only weak primitivity is assumed
- N is any open subgroup of G_F, not necessarily normal

**Construction or proof.**

1. Replace N by its normal core. Irreducibility over K gives semisimplicity on that normal subgroup; a power of σ₀ keeps distinct eigenvalues, giving multiplicity-free restriction.
2. Clifford theory expresses a reducible restriction as induction from a proper inertia subgroup, with an extension of one constituent because its multiplicity is one.
3. Reduce an invariant lattice. Brauer–Nesbitt identifies the semisimple residual representation with the semisimplification of that induction. To contradict weak primitivity requires a further semisimplicity or arithmetic exclusion argument; this is the exact recorded gap.
4. The parent small-rank comparison supplies this step when n<l; enlarging k then gives absolute irreducibility. The general-rank assertion remains a source target with the same boundary.

**Prerequisites.** PotentialAutomorphyInfrastructurePartII:PL.6/genericity-under-restriction; PotentialAutomorphyInfrastructurePartII:PL.6/primitive-representation; PotentialAutomorphyInfrastructurePartII:PL.6/small-rank-primitivity; PotentialAutomorphyInfrastructurePartII:PL.6/generic-prime.

**Source.**

- Tho15, §5.2, assumptions and Proposition 5.3 with proof, pp. 57–58 (accepted manuscript): States restriction irreducibility under weak primitivity and uses reduction of an induced representation in its proof.

**Acceptance.**

- No Maschke hypothesis on the entire residual image is silently added.
- A semisimplified induction is not renamed an actual induction.
- The parent n<l route applies to NT21 rank 2n<p and rank n<p applications.

### Generic R=T with source primitivity

**Identifier:** weak-primitive-generic-r-equals-t. **Kind:** theorem. **Suggested declaration:** TauCeti.Automorphy.PL7.weak_primitive_generic_r_equals_t.

In the ANT unitary setup, assume [L⁺:ℚ]>|R| and let 𝔭⊂R₁ have dim(R₁/𝔭)=1 and contain ϖ. Assume J₁R₁⊆𝔭, genericity, triviality of r_𝔭 at R, unramified scalar Frobenius at B, l^{v_l(q_v−1)}>n for v∈R, ζ_l∉L, cyclotomic Schur, no residual order-l quotient, l>3, l∤n, and weak primitivity of ρ̄. The source target is J₁R₁⊆Q for every prime Q⊆𝔭. It is a kernel-containment theorem for R←P→T. It does not provide a global map R→T or an isomorphism of the global rings. For d constituents its proof must use the μ₂^d-action modulo diagonal μ₂; the d>2 comparison and the weak restriction argument are explicit proof-completion inputs.

**Hypotheses.**

- Unitary convention U.
- The point and residual hypotheses in the statement, with weak primitivity

**Construction or proof.**

1. Twist the normalized prime to match the fraction fields of P/𝔮 and R/𝔭, while preserving the same minimal primes and the Hecke ideal.
2. Use weak-primitive-generic-restriction for the generic Taylor–Wiles data, then the two-constituent patching comparison of the parent.
3. For d>2 replace the two-block sign group by μ₂^d/μ₂ and use ANT Proposition 3.2 for the finite P⊂R fibres. A complete relative tangent/completion/patching comparison in this generality is recorded as a gap, not deduced solely from the sign-group substitution.
4. The nilpotent kernel after localization and completion forces J₁R₁ into every prime below 𝔭.

**Prerequisites.** PotentialAutomorphyInfrastructurePartII:PL.7/weak-primitive-generic-restriction; PotentialAutomorphyInfrastructurePartII:PL.6/generic-prime-r-equals-t; PotentialAutomorphyInfrastructurePartII:PL.6/polarized-pseudodeformation-subring; PotentialAutomorphyInfrastructurePartII:PL.6/reducible-twisting-and-base-change.

**Source.**

- ANT20, §4.2, Theorem 4.1 and proof, pp. 14–15 (arXiv v2): The printed hypothesis is weak primitivity; the arbitrary-constituent comparison is indicated but its details are not written.
- Tho15, §4.6, Theorem 4.19 and Corollary 4.20, pp. 47–48; §5.2, Corollary 5.7 and proof, pp. 62–63 (accepted manuscript): Supplies the two-constituent patching result used by ANT.

**Acceptance.**

- The direction is Q⊆𝔭.
- For d=2 and n<l, the weak restriction bridge is supplied by the parent.
- The kernel is taken in P and extended to R; no nonexistent map from R is used.

### The ANT lifting theorem with source primitivity

**Identifier:** source-primitive-ant-lifting. **Kind:** theorem. **Suggested declaration:** TauCeti.Automorphy.PL7.source_primitive_ant_lifting.

Let F be CM, n≥2, l>3 prime with l∤n, and ρ:G_F→GL_n(ℚ̄_l) continuous and semisimple. Require ρ^c≅ρ^∨ε^{1−n}, finitely many ramified places, and ordinarity of weight λ. Write ρ̄^{ss}=⊕_{i=1}^dρ̄_i with distinct absolutely irreducible constituents, each ρ̄_i^c≅ρ̄_i^∨ε̄^{1−n}. At a place w₀∤l require ρ|G_{F_w₀}^{ss}≅⊕_{i=1}^nψε^{n−i} with ψ unramified. Require an ι-ordinary RACSDC seed π with r̄_ι(π)^{ss}≅ρ̄^{ss} and π_w₀ an unramified twist of Steinberg. Require F(ζ_l)⊄F̄^{ker ad(ρ̄^{ss})}, F⊄F⁺(ζ_l), absolute irreducibility and pairwise nonisomorphism of all ρ̄_i on G_{F(ζ_l)}, weak primitivity of ρ̄^{ss}, and no quotient of order l of ρ̄^{ss}(G_F). The full source target is an ι-ordinary RACSDC Π with r_ι(Π)≅ρ. This extends the parent strong-primitive target; its arbitrary-rank proof still needs the weak generic restriction/R=T inputs.

**Hypotheses.**

- Every hypothesis listed in the statement, with weak rather than strong primitivity

**Construction or proof.**

1. Choose polarized integral models with the same Schur residual representation and standard odd multiplier. Use soluble base change to trivialise the relevant residual local representations and arrange the unipotent local conditions.
2. Force disjointness by extra split places. Choose a cyclic totally real extension of odd degree δ, inert at the l-adic and other ramified places, and a quadratic totally real extension split at those places. Then |R|≤2|Y₀|, d₀=2δ and d_l≥δ.
3. Choose δ prime to the finitely many absolute residue degrees and larger than max(2|Y₀|n(n+1)+3,n(n−1)/2+1). This satisfies the sufficient connectedness bounds without the printed half factor.
4. Repeat generic propagation with the weak-source generic R=T theorem. The residual-induction and d>2 comparison gaps are the exact unavailable inputs. Apply ordinary classicality and soluble descent once those inputs hold.

**Prerequisites.** PotentialAutomorphyInfrastructurePartII:PL.7/weak-primitive-generic-r-equals-t; PotentialAutomorphyInfrastructurePartII:PL.7/connectedness-ordinary-lifting; PotentialAutomorphyInfrastructurePartII:PL.7/residually-reducible-automorphy-lifting; PotentialAutomorphyInfrastructurePartII:PL.6/small-rank-primitivity; PotentialAutomorphyInfrastructurePartII:PL.0/auxiliary-cm-extensions; PotentialAutomorphyInfrastructurePartII:PL.2/unitary-base-change-and-descent.

**Source.**

- ANT20, §1, Theorem 1.1, pp. 1–2; §6, Theorem 6.1 and proof, pp. 17–19 (arXiv v2): States the general lifting theorem with weak primitivity and constructs extensions of arbitrarily large local degree.

**Acceptance.**

- For n<l the weak restriction obstruction is removed by the parent comparison.
- The extension degree can absorb the additional dimension cost.
- For a one-character residual block use the rank-one supplier, not an n≥2 lifting theorem.

### The ANT finiteness theorem with source primitivity

**Identifier:** source-primitive-ant-finiteness. **Kind:** theorem. **Suggested declaration:** TauCeti.Automorphy.PL7.source_primitive_ant_finiteness.

Let F be CM, n≥2, l>3 prime with l∤n, and S a finite set of finite places of F⁺ containing all l-adic places and split in F, with chosen lifts ṽ. Fix ι and an ι-ordinary RACSDC seed π unramified outside S. Choose its integral polarized model r with multiplier ε^{1−n}δ^n. Require r̄ trivial at l and at v₀∈S prime to l, q_v₀≡1 mod l, and π_ṽ₀ an unramified twist of Steinberg. Its residual restriction is the sum of distinct absolutely irreducible individually conjugate-self-dual constituents with multiplier ε̄^{1−n}; they remain absolutely irreducible and pairwise different over F(ζ_l). Require F(ζ_l)⊄F̄^{ker ad ρ̄}, F⊄F⁺(ζ_l), weak primitivity and no residual order-l quotient. For the ordinary variable-weight problem with unrestricted conditions at S−(S_l∪{v₀}), Steinberg at v₀ and fixed standard multiplier, the full source target is R^univ_𝒮 finite over Λ. Strong primitivity is not substituted for the source hypothesis.

**Hypotheses.**

- Every hypothesis in the statement; n≥2 is explicit for this general-rank route

**Construction or proof.**

1. Use the extension construction of the lifting theorem, with δ satisfying the larger sufficient inequalities. Arrange that local unrestricted rings restrict through the unipotent quotients used over the extension.
2. Apply the component-finiteness argument over the extension, using the weak generic restriction/R=T inputs. This is where the recorded weak-primitivity boundary enters.
3. Restriction on universal rings is finite; the coefficient map Λ_L→Λ identifies the relevant ordinary character action. Transitivity of finite ring maps descends finiteness to the original ring.

**Prerequisites.** PotentialAutomorphyInfrastructurePartII:PL.7/source-primitive-ant-lifting; PotentialAutomorphyInfrastructurePartII:PL.7/connectedness-ring-finiteness; PotentialAutomorphyInfrastructurePartII:PL.7/weak-primitive-generic-r-equals-t; PotentialAutomorphyInfrastructurePartII:PL.7/ordinary-steinberg-finiteness; PotentialAutomorphyInfrastructurePartII:PL.6/pseudodeformation-restriction-finite; mathlib:RingHom.Finite.

**Source.**

- ANT20, §6, Theorem 6.2 and proof, pp. 19–20 (arXiv v2): Uses the same extension construction and Corollary 5.4 to prove finiteness of the original ordinary ring.

**Acceptance.**

- This is ring finiteness, not an assertion that all nonalgebraic points are classical.
- The n≥2 source target is distinct from the rank-one contract needed by NT21 Proposition 5.6.
- No small-rank hypothesis is added to the source statement; the resulting proof boundary is explicit.

### Two adequate constituents with source primitivity

**Identifier:** source-primitive-two-constituent-lifting. **Kind:** theorem. **Suggested declaration:** TauCeti.Automorphy.PL7.source_primitive_two_constituent_lifting.

Let F be CM, l>3, K/ℚ_l finite, n=n₁+n₂≥2 with l∤n, and ρ:G_F→GL_n(K) continuous semisimple, conjugate-self-dual with multiplier ε^{1−n}, finitely ramified and ordinary of weight λ. Require F(ζ_l)⊄F̄^{ker ad ρ̄^{ss}}. Write ρ̄^{ss}=ρ̄₁⊕ρ̄₂, with both cyclotomic restrictions adequate, ρ̄₁≇ρ̄₂ and ε̄^{1−n}ρ̄₁^∨≇ρ̄₂^c. Require weak primitivity. At w₀∤l impose the unramified Steinberg semisimplification ⊕_{i=1}^nψε^{n−i}. Require an ι-ordinary RACSDC seed π with the same semisimple residual representation and Steinberg at w₀. Finally require a CM extension F₀/F, disjoint from the residual-cyclotomic avoidance field, and ι-ordinary RAECSDC representations in ranks n₁,n₂ whose residual representations are the restricted constituents. The source target is automorphy of ρ. No additional F⊄F⁺(ζ_l) hypothesis is inserted into Thorne’s printed theorem. Its weak restriction input is the same recorded boundary; the two-constituent patching comparison is already supplied.

**Hypotheses.**

- All hypotheses in the statement; adequacy is the named property owned by ArithmeticGaloisRepresentations:G7/adequate-subgroup

**Construction or proof.**

1. Choose a self-dual lattice and compatible seed lattice. Make a soluble base change with trivial residual local representations, suitable congruences q_v≡1 mod l, and a sufficiently small auxiliary level.
2. Use the ordinary residual automorphy of the two adequate blocks to obtain finite block deformation rings. Decompose the variable-weight coefficients by the two induced ordinary filtrations. In the fixed-determinant twist factor retain that all determinants are unramified outside l (parent E29). The finiteness input is the Λ-adic clause of PL.3/ordinary-r-equals-t (Tho12 Corollary 8.7), followed by finite restriction, as cited in Tho15 p. 69; existence of a characteristic-zero lift alone would not supply it.
3. The Steinberg places impose relations on the determinant-twist characters. Choose the extension degree so their anti-invariant Frobenius rank exceeds 6+|R|n(n+1), giving the reducible-locus bound required by Thorne §6. The bound is n[L⁺:ℚ]−|R|n(n+1)−5, without the half factor in the final printed display (parent E30).
4. Apply Thorne’s connectedness/propagation proof with the weak restriction bridge; its absent arbitrary-rank reduction argument is the recorded gap. Descend the resulting automorphy.

**Prerequisites.** PotentialAutomorphyInfrastructurePartII:PL.7/weak-primitive-generic-restriction; PotentialAutomorphyInfrastructurePartII:PL.7/two-constituent-automorphy-lifting; PotentialAutomorphyInfrastructurePartII:PL.6/reducible-twisting-and-base-change; PotentialAutomorphyInfrastructurePartII:PL.3/ordinary-r-equals-t; PotentialAutomorphyInfrastructurePartII:PL.0/soluble-descent; ArithmeticGaloisRepresentations:G7/adequate-subgroup.

**Source.**

- Tho15, §7, Theorem 7.1 and proof, pp. 66–70 (accepted manuscript): States the two-adequate-constituent theorem with weak primitivity and uses individual potential automorphy to bound the reducible locus.

**Acceptance.**

- Adequacy of each constituent is not replaced by adequacy of the reducible sum.
- The potential automorphy of the individual blocks is an explicit hypothesis.
- The local degree and Frobenius-rank bounds can be enlarged independently of the missing weak restriction argument.

### Finiteness with an unobstructed auxiliary place

**Identifier:** auxiliary-place-ant-finiteness. **Kind:** theorem. **Suggested declaration:** TauCeti.Automorphy.PL7.auxiliary_place_ant_finiteness.

Take the ordinary deformation problem and seed hypotheses of the parent PL.7/ordinary-steinberg-finiteness strong-primitive target. Replace only F(ζ_l)⊄F̄^{ker ad ρ̄} by the existence of w∤l where ρ̄ is unramified and H⁰(G_{F_w},ad ρ̄(1))=0. The target is the same module finiteness over Λ. For an unramified residual local representation with Frobenius matrix A, the vanishing condition means that X↦q_w A X A^{-1}−X on M_n(k) is invertible, in the arithmetic-Frobenius convention. The variant requires an auxiliary-level comparison allowing nonscalar A; the scalar-Frobenius parent R=T theorem cannot be applied to that place unchanged.

**Hypotheses.**

- All hypotheses of the parent strong finiteness theorem except its cyclotomic-adjoint noncontainment clause
- An unramified auxiliary place w prime to l with the stated invariant vanishing
- Strong primitivity; replacing it by weak primitivity additionally needs the weak-source bridge

**Construction or proof.**

1. Thorne Theorem 7.5 uses the old clause solely to choose an auxiliary scalar-Frobenius place with q_w≠1 mod l; its H⁰ vanishing makes every lift unramified.
2. Use local duality and the prime-to-l local deformation presentation to identify the full local lifting ring with its formally smooth unramified quotient under H⁰(ad ρ̄(1))=0. This general local statement is requested from its owner, rather than asserted from the scalar case.
3. Choose a sufficiently small auxiliary automorphic level at w and prove that its Hecke/deformation comparison retains the finiteness and generic propagation needed by Corollary 5.4. This is an explicit requested PL.2/PL.6 extension of the scalar setup.
4. Then repeat the extension construction and ring-finiteness descent of ANT Theorem 6.2. NT26 Proposition 3.9 records this use, but does not supply the missing ring/level comparison proof.

**Prerequisites.** PotentialAutomorphyInfrastructurePartII:PL.7/connectedness-ring-finiteness; PotentialAutomorphyInfrastructurePartII:PL.7/ordinary-steinberg-finiteness; PotentialAutomorphyInfrastructurePartII:PL.6/generic-prime-r-equals-t; LocalGaloisDeformationRings:R08.2; PotentialAutomorphyInfrastructurePartII:PL.2; PotentialAutomorphyInfrastructurePartII:PL.6; mathlib:RingHom.Finite.

**Source.**

- Tho24, §7, Theorem 7.5 and proof, pp. 44–45 (arXiv v2): Explains the weaker auxiliary-place hypothesis for lifting by removing the scalar-Frobenius requirement at the small-level place.
- NT26, §3, proof of Proposition 3.9, pp. 20–21 (arXiv v2): Applies ANT ring finiteness with precisely this modification, without stating a separate general finiteness theorem.

**Acceptance.**

- Invertibility is q_w times conjugation minus identity, with the Tate twist retained.
- The auxiliary place need not have scalar residual Frobenius.
- The stronger primitivity route and the auxiliary-level boundary are independent.

The standalone propagation target retains [L⁺:ℚ]>|R|. The connectedness and ring-finiteness route also retains l^{v_l(q_v−1)}>n at R, the local comparison hypothesis of ANT20 Theorem 4.1(3), p. 15, and Tho15 Theorem 6.1(2), p. 64. ANT20 Theorem 5.1 does not repeat this condition in its displayed assumptions (source issue E74, a gap in the cited proof). Here it is an explicit sufficient hypothesis for the stated proof route; the preliminary extension in ANT20 §6, p. 18, arranges it before the global applications.

## Inputs required for closure

The layer is planned at target level. Its chains end in named library declarations, imported parent or supplier nodes, the following requested supplier stages, or the following explicit gaps. This is not a claim that the source-proof boundaries have been resolved. Every listed input is part of the scope needed for the corresponding target.

### Supplier contracts

**GlobalGaloisDeformations:G7.** For p odd and a CM field F, S finite containing all p-adic places and split over F⁺, fix a residual character χ̄ with χ̄χ̄^c=μ̄|G_F and an odd continuous multiplier μ unramified outside S. Prove that the rank-one polarized ordinary ring, with extra rank-one Steinberg places interpreted as unramified, is finite over Λ₁=O⟦∏_{v|p}I_{F_ṽ}^{ab}(p)⟧ and dim R/(ϖ)≤[F⁺:ℚ]. Construct a base lift using Teichmüller χ̄ and the unique square root of μ/Teichmüller μ̄; identify variations with the anti-invariant abelian pro-p quotient. Global class field theory gives finite index of chosen p-adic inertia: the unramified class-group quotient is finite and the tame pro-p inertia at other finite S-places is finite. Use the existing completed-group-algebra construction, not a new construction in PL.7. Do not assume Leopoldt. This is the missing n_i=1 input of NT21 Proposition 5.6, whose reference to Theorem 5.2 covers only n_i≥2.

**Consumers:** PotentialAutomorphyInfrastructurePartII:PL.7/reducible-locus-small; PotentialAutomorphyInfrastructurePartII:PL.7/generic-primes-large-quotients.

**LocalGaloisDeformationRings:R08.2.** At a place w∤p with unramified residual ρ̄ and H⁰(G_{F_w},ad ρ̄(1))=0, identify the full framed fixed-multiplier lifting ring with its unramified quotient and prove formal smoothness of relative dimension n². Retain the Tate twist and do not assume scalar Frobenius. At a split place of the polarized problem the fixed multiplier leaves the GL_n local lift unrestricted; no fixed-determinant constraint is imposed. Give coefficient base change compatibility. For field restriction require that the auxiliary place splits completely, or prove anew that H⁰(ad ρ̄(1))=0 over the extension; vanishing need not survive an arbitrary finite extension.

**Consumers:** PotentialAutomorphyInfrastructurePartII:PL.7/auxiliary-place-ant-finiteness.

**PotentialAutomorphyInfrastructurePartII:PL.2.** For the unobstructed unramified auxiliary place in auxiliary-place-ant-finiteness, construct a sufficiently small level, its ordinary Hecke algebra and the comparison compatible with the unchanged deformation problem. Prove the finite-over-Λ property and classicality with nonscalar residual Frobenius. The existing scalar auxiliary-place theorem does not cover this requested generality.

**Consumers:** PotentialAutomorphyInfrastructurePartII:PL.7/auxiliary-place-ant-finiteness.

**PotentialAutomorphyInfrastructurePartII:PL.6.** Extend the generic-prime kernel-containment/patching argument to the nonscalar unramified auxiliary place with H⁰(ad ρ̄(1))=0, using the LocalGaloisDeformationRings:R08.2 unramified comparison and PL.2 level construction. Explain which local patched factor and smallness arguments change; retain the fixed multiplier and the μ₂^d/μ₂ action.

**Consumers:** PotentialAutomorphyInfrastructurePartII:PL.7/auxiliary-place-ant-finiteness.

### Proof and source boundaries

**Weak primitivity after reducing an induced generic representation.** The parent source issue E27 and PL.6/genericity-under-restriction identify the exact missing argument in Tho15 Proposition 5.3, p. 58: residual reduction gives only a semisimplified induction. Supply a semisimplicity or arithmetic exclusion argument under the full weak-primitive hypotheses for n≥l with l∤n. The n<l parent comparison and the strong-image-invariance result are imported and are not reproved here. No counterexample to the arithmetic proposition is asserted.

**Consumers:** PotentialAutomorphyInfrastructurePartII:PL.7/weak-primitive-generic-restriction; PotentialAutomorphyInfrastructurePartII:PL.7/weak-primitive-generic-r-equals-t; PotentialAutomorphyInfrastructurePartII:PL.7/source-primitive-ant-lifting; PotentialAutomorphyInfrastructurePartII:PL.7/source-primitive-ant-finiteness; PotentialAutomorphyInfrastructurePartII:PL.7/source-primitive-two-constituent-lifting.

**Arbitrary-constituent localized patching comparison.** Inherit the parent E31 boundary on ANT20 Theorem 4.1, p. 15. The d>2 argument must provide the relative tangent/completion comparison and the equivariant patching/prime-orbit argument with μ₂^d/μ₂. The finite invariant-subring result and sign-group substitution alone do not constitute that proof. This is a proof-completion input owned by PL.6, not a new general patching construction in PL.7.

**Consumers:** PotentialAutomorphyInfrastructurePartII:PL.7/generic-potential-propagation; PotentialAutomorphyInfrastructurePartII:PL.7/connectedness-ordinary-lifting; PotentialAutomorphyInfrastructurePartII:PL.7/connectedness-ring-finiteness; PotentialAutomorphyInfrastructurePartII:PL.7/weak-primitive-generic-r-equals-t; PotentialAutomorphyInfrastructurePartII:PL.7/source-primitive-ant-lifting; PotentialAutomorphyInfrastructurePartII:PL.7/source-primitive-ant-finiteness; PotentialAutomorphyInfrastructurePartII:PL.7/auxiliary-place-ant-finiteness.

**Printed borderline bound of ANT Theorem 5.1.** The continuation proves the route with d₀,d_l>|R|n(n+1)+3. Recovering the printed +2 condition would require the sharper mixed-characteristic component-intersection estimate absent from the available characteristic-l argument. This is the parent E32 finding, scoped to arXiv v2 pp. 16–17; the global lifting/finiteness routes are unaffected because their extension degree is arbitrarily large. The half factors in the extension-choice display on p. 19 (parent E33) are not used.

**Consumers:** PotentialAutomorphyInfrastructurePartII:PL.7/connectedness-ordinary-lifting.

**Dwork-family supplier for character-sum finiteness.** The imported PL.5/dwork-potential-ordinary-automorphy target still needs the BLGHT11 family, paired trivialization cover, geometric irreducibility, coefficient choices and local Hodge–Tate/ordinary/Steinberg properties specified in the parent gap. NT21 Theorem 5.2 pp. 67–69 adds the prescribed negative valuation at places over Σ. The proposed owner PotentialAutomorphyDworkMotivesPartII has no stage identifiers; therefore this remains a gap rather than a fabricated stage request. Its source was not read in this pass.

**Consumers:** PotentialAutomorphyInfrastructurePartII:PL.7/sum-of-characters-finiteness.

**Auxiliary-place ring and level comparison.** Tho24 Theorem 7.5 pp. 44–45 justifies a lifting variant; NT26 Proposition 3.9 pp. 20–21 uses the finiteness variant. Neither read passage writes the full nonscalar local-ring, ordinary-Hecke and generic-patching comparison needed to rerun ANT Corollary 5.4. The three precise owner requests list this work. The target is planned, with this boundary exposed; it is not inferred merely by replacing a clause in the existing scalar setup.

**Consumers:** PotentialAutomorphyInfrastructurePartII:PL.7/auxiliary-place-ant-finiteness.

The inherited source findings have identifiers PotentialAutomorphyInfrastructurePartII/E27, PotentialAutomorphyInfrastructurePartII/E29, PotentialAutomorphyInfrastructurePartII/E30, PotentialAutomorphyInfrastructurePartII/E31, PotentialAutomorphyInfrastructurePartII/E32, PotentialAutomorphyInfrastructurePartII/E33, PotentialAutomorphyInfrastructurePartII/E37. They remain in the parent packet, with their independent checks. E27 is the weak-primitivity boundary; E29 concerns the determinant-twist factor; E30 concerns the final two-constituent dimension bound; E31 is the arbitrary-constituent patching input; E32–E33 concern the connectedness and extension-degree bounds; E37 identifies the rank-one block input. No new source-issue record is asserted by this continuation.

The imported Dwork result remains an input of character-sum finiteness. Its geometry is not owned by this layer. Once PotentialAutomorphyDworkMotivesPartII has stage identifiers, the family, paired cover, monodromy and local-property contracts must point at that owner. The present document does not replace that family with a formal name or infer its local properties from the existence of an automorphic lift.

## Baseline and ownership

The pinned baseline is Mathlib **082e2d37e8b0463410cdb532e111cd43d5a66174** and Tau Ceti **f790474821cf4256814db967cb154e7af3d0c369**. Each declaration below was checked in its source file. None supplies residually reducible automorphy lifting or the arithmetic finiteness targets. The complete-splitting theorem is used only in its Galois scope; goodness in a non-Galois CM extension still uses the prime-count definition.

| Existing declaration | What is imported |
| --- | --- |
| mathlib:NumberField.IsCMField | The native CM-field predicate: totally complex and quadratic over the maximal real subfield. |
| mathlib:IntermediateField.normalClosure | Normal closure inside a specified ambient field, generated by the images of base-field algebra homomorphisms. |
| mathlib:IntermediateField.LinearDisjoint | Linear disjointness of an intermediate field and an abstract intermediate extension; the underlying condition is Subalgebra.LinearDisjoint. |
| mathlib:Group.IsSolvable | Solvability via termination of the derived series, applied to the Galois group of a normal closure. |
| mathlib:Ideal.primesOver | The set of prime ideals above a given ideal, used for the complete-splitting count. |
| mathlib:PrimeSpectrum | A prime ideal together with its primality proof. |
| mathlib:Ideal.map | Extension of an ideal along a ring homomorphism. |
| mathlib:Ideal.comap | Contraction of an ideal along a ring homomorphism. |
| mathlib:RingHom.ker | The kernel ideal of a ring homomorphism. |
| mathlib:RingHom.Finite | Module finiteness for the algebra structure induced by a ring homomorphism, not merely finite type. |
| mathlib:Ideal.minimalPrimes | Prime ideals minimal over a specified ideal. |
| mathlib:Module.finite_of_surjective_of_ker_le_nilradical | A finite quotient with finitely generated kernel contained in the nilradical makes the original algebra finite. |
| mathlib:Ideal.finite_minimalPrimes_of_isNoetherianRing | A Noetherian ring has finitely many primes minimal above an ideal. |
| tauceti:NumberField.ncard_primesOver_eq_finrank_iff_of_isGalois | For a Galois number-field extension over a Dedekind base, the complete-splitting count at a maximal ideal is equivalent to ramification and inertia degrees both one. The general non-Galois definition still uses the count. |
| mathlib:ringKrullDim | Krull dimension valued in extended natural numbers with a bottom element; quotient dimensions use this native codomain. |

The reviewed coverage audit has no entry for this Part II or its original potential-automorphy roadmap. The newer Tau Ceti roadmaps were checked separately from the atlas snapshot: AlgebraicVectorBundles, DifferentialGeometry, IntegralLattices, LocalGaloisGroups, OperatorTheory, OrthogonalSpinGroups, PeripheralActions, ProfiniteArithmetic and RealAlgebraicGeometry. Their targets do not supply these automorphy, good-extension or polarized-ring finiteness results. The current library’s completed-group-algebra module files already supply their carriers and module action; the G7 contract concerns the arithmetic finite-index argument, not reconstruction of that algebra. General Galois groups and local group theory remain owned by the existing roadmaps. No new roadmap or split is proposed here.

## Suggested signatures and their limits

The [suggested file](../suggested/PotentialAutomorphyInfrastructurePartII--PL.7.lean) gives both native definitions, all twelve API lemmas, all nine tests as examples, and all ten theorem signatures. The reader is definitive. The two predicates are fully stated; finite-degree and ambient-field data are explicit typeclass context, while the particular residual avoidance field and the restriction/Hecke family are supplied at arithmetic instantiation. Tests use nonzero finite primes, and the Galois compatibility test uses maximality. The generic restriction signature uses an arbitrary native field of fractions of k⟦T⟧, equivalent to the canonical fraction field.

The standalone file repeats the parent’s representation-to-module, absolute irreducibility and weak-primitivity predicates as real definitions, without claiming them as new PL.7 targets. Its imported RACSDC-model carrier and associated representation are type/data interfaces owned by parent PL.0 and PL.2. The model represents a finite coefficient realization, whose existence and enlargement are parent supplier obligations. Ordinary weight is not encoded by an unspecified property field.

| Theorem suffix | Native portion retained | Conditions or conclusions omitted from the signature |
| --- | --- | --- |
| good_extension_residual_invariants | Equality of residual images implies preservation of actual-induction primitivity | The good-extension implication giving image equality, cyclotomic enlargement, CM quadratic independence, Schur and strong-primitivity clauses |
| weak_primitive_generic_restriction | k⟦T⟧, its fraction field, weak primitivity, absolute irreducibility, independent unit eigenvalues, prime/rank conditions and open subgroup | Continuity, the polarized G_{F⁺,S} extension, cyclotomic Schur, residual no-l-power quotient and ramification |
| generic_potential_propagation | Dimension-one prime, special-fibre condition, witness, minimal-prime containment and D>|R| | Unitary convention U, genericity, residual hypotheses, triviality at R and residue-cardinality bounds |
| connectedness_ordinary_lifting | The sufficient numerical bounds and potential pro-automorphy of minimal primes | Unitary convention U, the residue-cardinality bound at R, connectedness and generic-prime hypotheses, the O-point and classicality conclusion |
| connectedness_ring_finiteness | Noetherian Λ and R, finite minimal-prime quotients and module finiteness of R | Arithmetic construction of those finite quotients from propagation and restriction |
| weak_primitive_generic_r_equals_t | The actual diagram, prime dimensions and Hecke-kernel containment at primes below the point | Unitary, genericity, weak primitivity, residual and local hypotheses |
| source_primitive_ant_finiteness | Prime/rank hypotheses and module-finiteness conclusion | Identity of R as the specified deformation ring, polarized ordinary seed, weak primitivity, coefficient, residual, local and global conditions |
| auxiliary_place_ant_finiteness | Prime/rank hypotheses and invertibility of q times conjugation by A minus identity | Ordinary problem/seed, residual strong primitivity, unramifiedness, interpretation of A as local Frobenius, and owner comparisons |
| source_primitive_ant_lifting | Integral model, actual reduction, weak primitivity, prime/rank hypotheses and association with an imported RACSDC model | Existence of a polarized lattice with semisimple reduction, polarization, semisimplicity, ordinary weight, ramification, Steinberg seed and residual constituent conditions |
| source_primitive_two_constituent_lifting | Positive block ranks, prime/rank hypotheses, integral reduction, weak primitivity and association with an imported RACSDC model | Semisimple polarized lattice, both adequate cyclotomic constituents and their separate potential automorphy, ordinary/Steinberg seed and polarization |

Elaboration checks these signatures and their native compatibility. It does not prove any theorem, check the omitted conditions or settle a source gap. Every packet node retains implementation status **unchecked**.

## Atlas landmarks and acceptance

The parent’s three PL.7 planets are Finiteness of locally Steinberg rings, Residually reducible automorphy lifting and Automorphic lifts of prescribed type. This continuation adds **Good extensions**, **Potential pro-automorphy** and **Propagation of potential pro-automorphy**, giving six planets in the assembled layer. Numerical repairs, signatures and proof-boundary bookkeeping are not additional landmarks.

An accepted implementation must use the actual restriction diagram, preserve the difference between weak and strong primitivity, prove the generic propagation and component argument with explicit coefficient actions, include nilpotents in the ring-finiteness conclusion, and satisfy all nine definition tests. The arbitrary-rank weak-source targets must discharge their residual-induction bridge rather than silently add strong primitivity. The auxiliary-place theorem must discharge all three nonscalar comparison contracts. Character-sum and prescribed-type applications retain the parent’s p>2n or p>n bounds, nonempty Steinberg set and compatible multiplier-weight assumptions.

## Public sources

Locators above use PDF/manuscript page numbers in these exact public versions. Each source was read directly for the indicated statements and proof steps. The packet records access date **2026-10-10** and SHA-256 digests of the downloaded PDFs. The review also read the [ANT20 version of record](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/91B814A109E34CC8DA2A5689BFA5CFA4/S0010437X20007484a.pdf), pp. 2415–2419, for E74; its separate digest and published pagination are recorded. Mathematical claims and proof sketches here are stated in our own words.

- **ANT20** — Patrick B. Allen, James Newton and Jack A. Thorne, [Automorphy lifting for residually reducible l-adic Galois representations, II](https://arxiv.org/abs/1912.11269v2). Compositio Mathematica 156 (2020), 2399–2422; read in arXiv:1912.11269v2 (13 August 2020).
- **Tho15** — Jack A. Thorne, [Automorphy lifting for residually reducible l-adic Galois representations](https://www.repository.cam.ac.uk/bitstreams/5b8962a1-6a0e-4d17-b5ae-b478575e1a0c/download). Journal of the American Mathematical Society 28 (2015), 785–870; read in the author's accepted manuscript dated 16 April 2014 (Apollo, University of Cambridge repository).
- **NT21** — James Newton and Jack A. Thorne, [Symmetric power functoriality for holomorphic modular forms](https://arxiv.org/abs/1912.11261v3). Publications mathématiques de l'IHÉS 134 (2021), 1–116; read in arXiv:1912.11261v3 (27 September 2021).
- **Tho24** — Jack A. Thorne, [A p-adic approach to the existence of level-raising congruences](https://arxiv.org/abs/2212.03591v2). Proceedings of the London Mathematical Society (3) 128 (2024), e12584; read in arXiv:2212.03591v2.
- **NT26** — James Newton and Jack A. Thorne, [Symmetric power functoriality for Hilbert modular forms](https://arxiv.org/abs/2212.03595v2). Annals of Mathematics 203 (2026); read in arXiv:2212.03595v2.

For the imported targets, full foundational proofs such as the Dwork family, classicality, unitary transfer and general completed-group-algebra construction are supplied by their named owners. They were not reread as new construction targets here. The source claims used for the nonscalar finiteness variant are exactly Tho24 Theorem 7.5, pp. 44–45, and NT26 Proposition 3.9, pp. 20–21; the latter uses, rather than separately proves, that variant.
