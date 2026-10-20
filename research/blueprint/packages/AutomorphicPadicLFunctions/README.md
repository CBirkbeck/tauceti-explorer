# Roadmap: ray-class distributions and automorphic p-adic L-functions

**Summary.** Construct p-adic L-functions by evaluating arithmetic classes, Eisenstein measures and toric forms on ray-class groups. The common language is a locally analytic distribution on a specified ray-class quotient, with a proved norm relation, an interpolation formula and an independently justified growth bound. The main constructions are the finite-slope GL₂ construction over a number field, anticyclotomic Rankin–Selberg measures, ordinary unitary doubling measures and vector-valued Klingen families. Comparisons keep the periods, reciprocity convention, refinements and omitted Euler factors visible. A finite-slope distribution is not silently promoted to a bounded measure, and interpolation on a small collection of characters is not silently promoted to uniqueness.

## Scope and ownership

This roadmap owns the passage from the supplied arithmetic and analytic objects to ray-class evaluation, including its local charts and norm compatibility. It owns the GL₂ evaluation construction in all cohomological degrees needed for control, the source-specific toric and unitary test vectors, the corresponding interpolation theorems, and the comparisons between these constructions. It does not construct a general theory of automorphic representations, Shimura varieties, analytic distributions or Iwasawa algebras.

Finite ray-class groups are already in Tau Ceti. In `NumberTheory/NumberField/Global/RayClass`, `Modulus` records a nonzero finite ideal and a set of real places; `classMap` goes from the larger modulus to the smaller one, and `classMap_surjective` proves surjectivity. `finite_rayClassGroup` supplies finiteness. The current library's `Global/HeckeCharacter` modules supply continuous complex Hecke characters, characters induced from ray groups, their finite-order criterion, infinity types, conductors and algebraicity. In particular `ofRayClassCharacter` is injective, and `HeckeCharacter.IsAlgebraic` permits the finite-order real sign factor. These are suppliers, not new targets. Mathlib already defines the finite-ring `gaussSum` as the sum of a multiplicative character times an additive character, with `gaussSum_mulShift_eq` fixing its inverse-character scaling. Its `NumberTheory/LSeries/RiemannZeta` theorem `riemannZeta_zero` supplies ζ(0)=−1/2 for the trivial-character negative control below. The global ray Gauss sum below adds the conductor adele and different correction to that supplied finite sum. The pinned library has the finite ray-class interface; the more recent Hecke-character interface must be available before its analytic comparison is implemented.

The current GlobalNumberFields roadmap owns the remaining general Hecke-character and ray-class API. ClassFieldTheory owns finite Artin reciprocity. ProfiniteArithmetic and Mathlib's profinite limits supply inverse-limit topology. ArithmeticGaloisRepresentations §2.7, LFunctions and AutomorphicLFunctionsAndLocalFactors supply the relevant complex functional equations and local constants. No theorem of Tate's thesis is a target here. Standard additive characters, Fourier transforms and self-dual measures are conventions consumed at the interface.

PadicMeasuresIwasawaAlgebras owns measures, convolution, completed group rings, their base change and Mellin transforms. LocallyAnalyticDistributions owns locally analytic function spaces, strong duals, compact operators, slope decompositions and the admissibility uniqueness theorem. ArithmeticLocallySymmetricSpaces owns the adelic quotient, local systems, compactly supported cohomology, Borel–Serre machinery, Hecke correspondences and the general Eichler–Shimura–Harder comparison. AutomorphicFormsOnReductiveGroups and AutomorphicLFunctionsAndLocalFactors own cuspidal representations, Whittaker models, twisted L-functions and local zeta integrals. The uses below are the weight conventions, cycles and evaluations specific to these p-adic L-functions.

AbelianSchemesAndArithmeticModuli, HilbertModularVarietiesAndShimuraCurves, PELModuli, AutomorphicBundles and ShimuraCompactifications supply their general moduli, ordinary loci, bundles and compactifications. PadicFamilies supplies ordinary families and their control. The Deligne–Ribet and Katz construction layer belongs to PadicFamilies, Layer 5: its precise additional contracts are stated below. Its existing Hilbert Eisenstein constant-term family is only part of that contract. This roadmap uses the resulting measures and retains their normalization comparisons; it does not redevelop that layer here.

SelmerIwasawaCohomology, Layer 4, supplies explicit realization data, criticality and the Coates–Perrin-Riou/Panchishkin existence proposition. A conjectural existence proposition is a proposition about specified data, never a constructor for a measure. General CM theory, integral main conjectures, height pairings, Heegner points and modularity lifting are outside the scope. The small CM and toric interfaces required here are stated explicitly, without depending on those later roadmaps. The separate Kings–Sprang construction is a downstream extension, not an extra layer of this roadmap.

## Conventions

Let F be a number field, of signature (r₁,r₂), degree d=r₁+2r₂, and let p be a rational prime. Put q=r₁+r₂. Fix embeddings of the algebraic numbers in C and C_p and a finite coefficient extension L/Q_p whenever finitely many algebraic coefficients are involved. For integral assertions O is the ring of integers of such an L, with uniformizer ϖ and normalized v_ϖ(ϖ)=1. When v_p is used instead, v_p(p)=1; the two valuations differ by the ramification index. General coefficient rings are allowed only in assertions explicitly stated for them. No characteristic-zero interpolation theorem is asserted over a field of characteristic p or over an equal-characteristic DVR.

The ray modulus n is a fixed integral ideal prime to p. The ray tower allows conductor dividing n p^∞, with every real place in the positive modulus. Distinguish it from the automorphic level 𝔫 of Y₁(𝔫): classical Layer 1 permits any nonzero integral 𝔫, whereas Layer 2 assumes (p)|𝔫, as in BSW §6.1, p. 21. Its reciprocity is arithmetic: a uniformizer away from the ray modulus gives arithmetic Frobenius. The idelic inclusion of a local unit into the positive ray ideal description has an inverse. Thus over Q the avatar of |·|⁻¹ sends the ideal (ℓ) to ℓ, while the ray coordinate of a p-adic unit u is evaluated as u⁻¹. The two values u=2,3 distinguish inversion from the forward coordinate. The weighted-inversion examples in `Suggested.lean` compute both coordinates.

The standard global additive character has infinite component exp(2πi Tr(x)) and finite components with the opposite sign. Haar measures and epsilon factors use the corresponding self-dual convention. For a conductor f write ϖ_f for the multiplicative idele with **positive** local uniformizer exponents. The additive conductor representative b_f has the corresponding components of ϖ_f⁻¹ and is zero elsewhere. These are different objects. At conductor exponents 1 and 2 their multiplicative components are ϖ and ϖ², while the additive components are ϖ⁻¹ and ϖ⁻².

For GL₂ an admissible weight λ=(k,v) has k_σ≥0, k_{̅σ}=k_σ and k+2v parallel. A critical index j satisfies 0≤j_σ≤k_σ and the global algebraic-character compatibility. An infinity type r is translated to its p-adic algebraic monomial by the fixed embeddings, not by identifying C with C_p. The cohomological degree q is the bottom cuspidal degree. The real dimension of the locally symmetric space is 2r₁+3r₂; q need not be half that dimension.

Choose one embedding in each complex pair and orient the cycles in that order, followed by the real factors. The evaluation sign is (−1)^R, where R=Σ_complex k_σ+Σ_real(k_σ+j_σ). The real two-term check k=2, j=0 and j=1 gives +1 and −1. Adding one complex degree changes these to −1 and +1. `orientationSign` and its two proved examples fix these choices. Polynomial matrices act by γ·P(X,Y)=det(γ)^v P(bY+dX,aY+cX); distributions have the dual right action. For diag(a,d), X has eigenvalue d and Y has eigenvalue a, which fixes the order of the two diagonal entries.

A period is nonzero data. Changing a chosen period Ω to aΩ changes a linearly normalized symbol and its distribution by a⁻¹. A square-root toric measure scales before its square is taken. A complex CM period and a p-adic CM period are compared through a common algebraic differential; they do not have a canonical quotient in a common field.

## Exact supplier contracts

The following contracts say what must exist before a layer can be implemented. They distinguish an existing general API from the extra source-specific conclusions needed here. Every coefficient extension preserves the chosen integral lattice when an integral claim is made.

### Finite ray classes, analytic duality and cohomology

GlobalNumberFields supplies the ray exact sequence, ideal and idelic descriptions, local norm, algebraic infinity types, conductor and finite-order avatars. ClassFieldTheory supplies compatible arithmetic Artin maps at all finite moduli. The ray exact sequence uses the closure of the **positive** units congruent to 1 modulo n. NumberField's unit rank is used after the finite sign and tame-index changes; it is not an assumption of Leopoldt's conjecture.

The CM unit index used in 3h.8b consumes Mathlib's `NumberField.IsCMField.unitsMulComplexConjInv`, the homomorphism u↦u/c(u) into `NumberField.Units.torsion M`, and `NumberField.IsCMField.unitsMulComplexConjInv_ker`, whose kernel is `realUnits M`. Together with `Subgroup.index_ker` and `Subgroup.card_subgroup_dvd_card`, these identify [OM×:OF×] with the cardinality of a subgroup of the roots of unity. For a prime P of OM unramified over Z and of odd residue characteristic, `NumberField.torsionOrder_dvd_absNorm_sub_one'` gives that the torsion order divides N(P)−1. These declarations already exist at the pins. The distinct `NumberField.IsCMField.indexRealUnits` divides out both real units and roots of unity; it is not the index in the special-value formula. No new CM-unit or reduction theory is planned here.

LocallyAnalyticDistributions supplies C^la(G,L), its strong dual D(G,L), finite clopen decompositions, pullback of tests, pushforward of distributions, locally algebraic characters, order bounds and uniqueness from locally polynomial tests under the stated strict growth condition. For a compact analytic group modulo a closed unit subgroup, analytic functions on the quotient are invariant tests upstairs. Its dual is the dual of that invariant subspace. It is not identified with invariant distributions on the full group, and no unique lifting of a quotient distribution is promised. PadicMeasuresIwasawaAlgebras supplies the injection of bounded measures into this dual and the identification with O[[G]] when coefficients and topology satisfy its hypotheses.

ArithmeticLocallySymmetricSpaces ALS.1.4 supplies the sheaf/singular comparison, including compact supports, for neat level and finite projective coefficients; ALS.3.5 supplies the Hecke correspondences. ALS.5b.1–ALS.5b.2 supply the characteristic-zero de Rham/relative-Lie comparison and its pairing compatibility in every degree. ALS.5b.5 supplies the cuspidal realization under its stated inputs. These general constructions are imported, rather than requested again.

The additional lower-owner target `bswESHComparison` must specialize these constructions to the GL₂ quotient Y₁(𝔫) and the coefficient dual L₁(V_λ(C)*) of BSW Theorem 3.4, p. 13. It sends a cuspidal eigenform to its bottom-degree compactly supported class, intertwines the finite Hecke operators, identifies the real Weyl sign projections on the resulting class with §3.2.2, p. 12, and transports the class through the coefficient intertwiner α to L₂(V_λ(C)*). Its rational-period clause is BSW Proposition 3.7, pp. 13–14, with K_Φ containing the normal closure of F and the Hecke eigenvalues, and the nonzero sign periods of Theorem 2.3, p. 10. Supply `bswESHComparison_hecke`, `bswESHComparison_weyl`, `bswESHComparison_coefficients`, `bswESHComparison_period` and compatibility with the singular-cochain model and level maps. This is a required extension of the lower owner; the general complex comparison alone does not identify the specified rational eigenclass. No integral period comparison is inferred. The analytic supplier's slope theorem must apply to the actual compact-support cochain model, not merely to the coefficient Banach module. The GL₂ compactness argument in Layer 2 verifies that hypothesis.

For a non-neat Ω₁(𝔫), use a neat normal refinement and the equivariant descent model of ALS.1.2–ALS.1.3. Characteristic-zero finite-group invariants are exact, so this passage does not restrict the classical level. The same argument does not assert exact integral invariants when p divides the refinement index.

**Checks.**
- For F=Q and k=0, the map lands in degree 1 with constant polynomial coefficients and retains the two real Weyl signs. For imaginary quadratic F it also lands in degree 1 but has no real Weyl factor.
- On a noncompact modular component the cuspidal class has a compact-support realization; the forget-supports map does not give a section on all ordinary cohomology. An Eisenstein class is not substituted for a cuspidal eigenclass.
- Rescaling one chosen sign period by a∈K_Φ× divides that sign's rational class by a. Rationality over K_Φ gives no assertion that a is integral or a p-unit, including at p=2.

### PadicFamilies Layer 5: the totally real construction

For totally real F of degree d, define `partialZetaDistribution k` on locally constant rational-valued functions ε on the fixed-tame ray limit by linear extension of L(1−k,ε), k≥1. Rationality and independence of the finite level are part of the contract. Set Δ_c(1−k,ε)=L(1−k,ε)−N(c)^k L(1−k,ε_c), with ε_c(g)=ε(cg). Supply `lValue_level`, `lValue_linear`, `lValue_rat` and `delta_translate`; complex continuation and the relevant algebraicity are consumed from the L-function supplier. Deligne–Ribet, introduction (0.4)–(0.5), pp. 231–232, and §8, pp. 278–283, identify the required normalization.

**Checks.**
- Over Q, ε=1 and k=2 give ζ(−1)=−1/12, before smoothing. At c of norm 2 the smoothed value is (1−4)(−1/12)=1/4 when that c is permitted by the tame and p conditions.
- For c=1, Δ_c is zero at every ε and k; smoothing is not division by 1−N(c)^k.
- Passing to a finer modulus with exactly the same allowed prime divisors leaves the imprimitive value unchanged; adjoining a new prime multiplies by its Euler factor. Confusing these changes fails this test.

Define `hilbertCuspData` using a narrow-class representative t_λ and a GL₂⁺(F) representative A with first column (a,c), with b_A=aOF+c(t_λ𝔡)⁻¹, c_A=(c)(t_λ𝔡b_A)⁻¹ and the associated infinity/zero-cusp conditions. Define normalized Fourier coefficients by c_A(β,f)=a_A(β)(Nt_λ)^{−k/2}(Nb_A)^{−k}N(det A)^{k/2}, and the nebentypus decomposition. Supply `bIdeal_changeRep`, `cIdeal_changeRep`, `normalisedCoeff_changeRep`, `nebentypus_project` and the source's cusp classification. Constant coefficients are invariant under the left level group; under right multiplication by an upper triangular B with first diagonal entry u, they acquire sgn(N(u))^k. Thus they descend to scalar functions of the unoriented cusp at even k, and at odd k require this sign transport. Nonconstant coefficients additionally require the corresponding Fourier-index transport. This is the cusp API needed for Eisenstein **constant terms**, beyond the generic cusp space. Dasgupta–Kakde, §§7.2.3–7.2.6, pp. 44–46, is the convention source.

**Checks.**
- The identity matrix gives the infinity cusp with c=0; the Weyl representative exchanges the infinity and zero conditions.
- Multiplying the first column by a unit preserves the cusp and its associated ideals; it preserves the normalized constant when the unit has positive norm or k is even. At odd k a norm-negative unit changes its sign.
- Over Q, A and −A represent the same cusp, but at k=1 their normalized nonzero constants are c_A(0,f) and −c_A(0,f); at k=2 they agree. This distinguishes the sign transport from unconditional representative invariance.
- A nonprincipal narrow ideal class remains a separate component; a definition with only the standard cusp over Q does not pass.

Construct `hilbertEisensteinSeries G(k,ε)` and `E(k,ψ,1)` with their entire Fourier expansions, not just the constant coefficient. For G the standard constant is 2⁻ᵈL(1−k,ε), with the source's imprimitive convention; nonconstant coefficients are the corresponding divisor sums. Supply `G_linear`, `G_qExpansion`, `E_hecke` and the full `E_constantTerm_at_cusp`. At each cusp the latter has the vanishing conditions, conductor factors, Gauss-sum quotient, character values and L(ψ⁻¹,1−k) term of Dasgupta–Kakde Proposition 8.4, pp. 51–52. The input characters have the parity of k, the primitive/imprimitive conductor conventions are recorded, and the weight-one boundary terms are retained. Deligne–Ribet §6, pp. 267–271, gives G and its rationality. No constant-term formula is extrapolated from the standard cusp to another component.

More explicitly, in Dasgupta–Kakde's totally odd ψ setting, let 𝔠₀ be its primitive conductor, P prime to the smoothing product 𝔱, 𝔠=lcm(𝔠₀,P), and 𝔫=𝔠𝔱. For 𝔪|𝔱 and a cusp A=(a b;c d;λ), set J_𝔪={𝔩|𝔪:A∈C₀(𝔩,𝔫)} and J_𝔪^c={𝔩|𝔪:A∈C∞(𝔩,𝔫)}. For odd k>1, define the zero-cusp contribution by

```text
A_k(A)=τ(ψ) N(𝔠₀)^(-k) sgn(N(−c)) ψ(c_A)
       ×2^(-d) L(ψ⁻¹,1−k)
       ×∏_{𝔭|P}(1−ψ(𝔭)N(𝔭)^k)
       ×∏_{𝔩∈J_𝔪}N(𝔩)^(-k) ∏_{𝔩∈J_𝔪^c}ψ⁻¹(𝔩).
```

The constant term is A_k(A) on C₀(𝔠,𝔫) and zero off it. At k=1 add, on C∞(𝔠₀,𝔫), the infinity contribution

```text
B_1(A)=ψ(b_A)2^(-d)L(ψ,0)
       ×∏_{𝔭|P}(1−N(𝔭)^(-1))
       ×∏_{𝔩∈J_𝔪}(ψ(𝔩)N(𝔩))⁻¹.
```

On the intersection add both contributions; it occurs only when 𝔠₀=1, and the first character/sign factor there is equivalently ψ⁻¹(d t_λ b_A). At c=0 use this equivalent representative convention, rather than taking the sign of zero. The symbols ψ⁻¹ at ideals mean the inverse character with its own extension by zero, never reciprocal division by an extended value zero. These formulas define `E_constantTerm_at_cusp`; the general parity-compatible Deligne–Ribet family above is not restricted to totally odd characters. The smoothing family is `W_k=Σ_{𝔪|𝔱}μ(𝔪)ψ(𝔪)N(𝔪)^k(E_k|𝔪)`, so its constant terms follow by this finite sum (Dasgupta–Kakde Definition 8.2 and Proposition 8.6, pp. 51–53).


**Checks.**
- For F=Q and k≥4 even, the divisor coefficient at a prime ℓ is 1+ℓ^{k−1}, with the stated normalization of the constant term.
- The ψ=1 case includes every extra constant contribution allowed by the cusp formula; it is not obtained by dividing a vanishing Gauss expression.
- A cusp failing the proposition's conductor divisibility has zero constant term even when L(ψ⁻¹,1−k)≠0.

Construct `ordinaryHilbertIgusaTower` for prime-to-p level N≥3, a positive invertible polarization module, and Igusa pⁿ-level with pⁿ>1. Its torsor is Isom_OF(μ_{pⁿ}⊗OF,A[pⁿ]^0) on the ordinary locus, with deck group (OF/pⁿ)^×. Define `PadicHilbertForm` by the compatible functions on this tower and its weight action, with `qExpansion`, `ofClassical`, `qExpansion_ofClassical`, `baseChange` and `weightAction`. The geometric irreducibility theorem is for the covering over each geometrically connected component. It does not say the union of all determinant components is irreducible. Deligne–Ribet (4.5), pp. 255–258, proves the monodromy statement.

The irreducibility proof needs the ordinary finite-field classification of abelian varieties. The required input is Deligne's equivalence with finite free Z-modules T carrying semisimple F on T⊗Q, all complex eigenvalues of absolute value √q, an integral V with FV=q, and an ordinary p-adic decomposition of equal ranks into a unit-F part and a q-divisible-F part (Deligne 1969, Theorem 7, pp. 240–242). Define the required `ordinaryDeligneModule q` with q=p^a, a≥1: T is finite free over Z; F,V are integral commuting endomorphisms with FV=q; F is semisimple rationally with all complex eigenvalues of absolute value √q; and T⊗Z_p has equal-rank F-stable summands on which F is respectively invertible and divisible by q. Supply `F_injective`, `V_unique`, `ordinary_split`, `rank_even` and `ordinaryAbelian_equivalence`, including full faithfulness and essential surjectivity. Serre–Tate deformation alone does not supply that finite-field equivalence.

**Checks.**
- At q=2, the companion matrix of X²−X+2 has V=1−F, satisfies FV=2, and has one unit and one positive-slope root: it is a rank-two ordinary example in residue characteristic 2.
- The roots of X²+2 both have slope 1/2, so that supersingular rank-two example fails the ordinary split condition despite having the required complex absolute values.
- T=0 is the valid dimension-zero abelian object; q=1 is excluded by a≥1. A nilpotent F on nonzero T cannot satisfy FV=q.

PadicFamilies must import or establish this input before claiming the irreducibility chain is closed. General structured ordinary deformation and canonical lifts come from AbelianSchemesAndArithmeticModuli, Layer 4; the nonprincipal Hilbert moduli model comes from HilbertModularVarietiesAndShimuraCurves.

**Checks.**
- At one ordinary geometric point the Igusa fibre has the torsor cardinality |(OF/pⁿ)^×|, not one point with a chosen trivialization forgotten.
- The tower restricted to one geometric connected component is irreducible; two distinct determinant components still form a disconnected union.
- A supersingular elliptic curve has no multiplicative p-divisible summand of the required ordinary rank and is excluded, including at p=2.
- The zero `PadicHilbertForm` has every q-coefficient zero at every level.
- The image of a classical Eisenstein form keeps its full q-expansion: over Q its coefficient at a good prime ℓ is 1+ℓ^{k−1} in the normalization above.
- Functions at successive Igusa levels that disagree after pullback do not define a `PadicHilbertForm`, even if their weights agree.

Prove `padicHilbert_qExpansion_integral`: for a Z_p-flat coefficient ring R in the Deligne–Ribet setup, coefficients at one p-adic cusp lie in R exactly when the form lies in the R-lattice. Prove `padicHilbert_constantDifference_integral`: if all nonconstant coefficients are R-integral at one cusp, they are integral at every cusp and all differences of constant terms are R-integral. The same assertion for finite sums of classical forms includes the cusp norm factor N(α_p)^{-k}. These are Deligne–Ribet (5.13)–(5.15), p. 265, and (0.2)–(0.3), p. 230. They are not a generic one-cusp theorem for an arbitrary disconnected Shimura variety.

The Kummer theorem says that Σ_k ε_k(x)N(x)^{k−1} integral for every prime-to-np ideal x implies Σ_k Δ_c(1−k,ε_k) integral. Construct `deligneRibetMeasure c` with moment ∫ εN^{k−1}=Δ_c(1−k,ε), independent of the finite ray level. Prove `measure_moment`, `measure_cocycle` and `deligneRibet_2adic_refinement` of (8.11)–(8.12), pp. 283–284, with the odd/even cases separated. In its full form this concerns an odd, continuous, compactly supported integral test φ on the source's compactified ideal space I: its integral is divisible by 2^{d−1}. Define `deligneRibetParityDefect φ` as the mod-2 sum of its restriction to the norm-zero boundary group G₁, over G₁/Σ₁^±, in §8, pp. 280–281; the restriction has finite support modulo that sign group. The integral is divisible by 2^d if F is not exceptional or this parity defect is zero. Here exceptional means that every unit has norm +1 and every signature of positive total sign is attained by a unit. In the remaining case it is divisible by 2^d exactly when the smoothing class c acts trivially on F(√E_+), the quadratic extension generated by square roots of all totally positive units. Supply `parityDefect_add`, `parityDefect_zero` and `extraTwo_iff_artin_trivial`, retaining the compactified-ideal-space test domain when stating the full refinement. This does not redefine a general quotient distribution by a boundary value. No p>2 restriction is added to the base theorem.

**Checks.**
- A polynomial test identically zero gives zero integral; Kummer congruences must respect cancellation between weights.
- With c=1 every moment and the measure vanish.
- At p=2 the sign subgroup is μ₂ and the torsion-free local direction is 1+4Z₂ over Q; replacing μ₂ by a group of order p−1 loses a component and fails.
- A test whose restriction to G₁ is zero has parity defect zero, even when its integral need not vanish.
- An admissible odd test with one boundary orbit of odd value and all other boundary values even has parity defect one; two such odd-valued orbits give defect zero.
- Adding two tests with parity defect one gives defect zero in F₂. This tests the mod-2 sum, rather than the number of nonzero boundary values without reduction.

Construct `deligneRibetPseudomeasure` in the total quotient ring of the supplied completed group algebra, using λ_c=N⁻¹μ_c and λ=λ_c/(1−[c]) for a c whose denominator is a nonzero divisor. Supply `pseudoMeasure_eq_div`, `(1−[c'])λ=λ_c'`, `pseudoMeasure_moment`, tame pushforward and the meromorphic Mellin function. At a character where the denominator vanishes, use the pseudomeasure identity, not a numerical 0/0. Deligne–Ribet, p. 232, supplies this construction. Holomorphy on a component requires a proved cancellation or a nonvanishing denominator; it is not inferred merely from the character being nontrivial on some finite tame quotient.

**Checks.**
- For a character η with η(c)≠1 the specialization satisfies (1−η(c))η(λ)=η(λ_c).
- At the augmentation character the denominator is zero, so the quotient formula cannot define a scalar value by itself.
- Choosing another admissible c gives the same pseudomeasure by the cocycle identity; choosing c=1 supplies no admissible denominator.

### PadicFamilies Layer 5: CM evaluation and Katz measures

Define `ordinaryCMType` for M/F CM, F totally real, by a CM type Σ whose induced p-adic places Σ_p and their conjugates partition the places above p. This forces every F-prime above p to split in M. Include a totally imaginary polarization element δ with positive imaginary parts in Σ, the integral lattice and prime-to-p level. Supply `split_at_p`, `conjugate`, `inducedType` and `polarisationDatum`. These are Katz §2.1, pp. 229–232, and Hida–Tilouine §1, pp. 193–199.

**Checks.**
- An imaginary quadratic field with split p has the two conjugate choices of ordinary type.
- An inert p cannot satisfy this predicate; an arbitrary complex CM type is insufficient.
- The empty set is not a CM type of a nonzero CM field, and a polarization with one negative imaginary component is rejected.

Construct `ordinaryCMPoint` from a fractional ideal lattice with its OF-action, polarization and level. Provide its complex uniformization, ordinary p-adic model and canonical trivialization of the connected p-divisible group; `idele_action` and `galoisAction` must match arithmetic reciprocity. Algebraic models and existence of CM points are inputs with their general moduli source, not consequences of a formal choice of complex coordinates. Katz §2.4, pp. 237–242, and §2.6, pp. 247–250, supply the comparisons used here.

**Checks.**
- Multiplying a lattice by a∈M× gives the isomorphic CM datum with all level and differential changes included.
- An ideal prime to the conductor acts by the corresponding isogeny and arithmetic Artin symbol; reversing both is allowed only as an explicit convention conversion.
- An inert p does not give a canonical ordinary trivialization by this construction.

Define `cmPeriodData` by a common algebraic differential ω, its complex analytic basis and its ordinary canonical p-adic basis, so ω=Ω_∞ω_an=Ω_pω_can componentwise. Supply `complex`, `padic`, `scale` and `galois`; period comparison means algebraicity of normalized evaluations, not a cross-field division. Both periods are nonzero. Katz (2.4.5), pp. 241–242, and (2.6.7), pp. 249–250, give the algebraicity and comparison.

**Checks.**
- Replacing ω by aω multiplies both Ω_∞ and Ω_p by a under their respective embeddings.
- A weight w normalized value scales by a^{-w}; two weights w=1,2 give a⁻¹,a⁻², rather than a common factor.
- A zero differential is excluded: otherwise both period divisions would be undefined.

Construct `katzDifferentialOperator` by Gauss–Manin followed by the ordinary unit-root splitting; its complex partner uses the C^∞ Hodge splitting. Supply commuting θ_σ, Leibniz, `qExpansion` with θ_σ(q^β)=σ(β)q^β, iteration, and comparison at ordinary CM points after period normalization. At β=0 the derivative coefficient is zero. The comparison theorem includes the algebraic structure on the CM datum. Katz §§2.4–2.6, pp. 238–250, is the source, and the general de Rham and connection objects are suppliers.

**Checks.**
- θ_σ(a_0+a_βq^β)=σ(β)a_βq^β, with the constant term killed.
- Applying θ_σθ_τ to q^β gives σ(β)τ(β)q^β in either order.
- At a nonordinary point the chosen unit-root splitting is unavailable; the ordinary operator is not declared there by the same definition.

Construct `katzEisensteinMeasure` on (U_p×U_p)/closure(E_diagonal), with the source's tame data, valued in p-adic Hilbert forms. Convert a weight-covariant function F by H(x,y)=N(x)⁻¹F(x⁻¹,y). The condition F(e⁻¹x,ey)=N(e)F(x,y) is exactly H(ex,ey)=H(x,y). Supply `function_equiv`, `moment`, `theta`, `qExpansion` and boundedness from integral Fourier coefficients and Kummer congruences. This is Katz (4.2.0)–(4.2.6), p. 260; the diagonal unit quotient must be completed topologically.

**Checks.**
- For x=2,3 in a rational unit chart and F(x,y)=x⁻¹, the transformed H is respectively 1 and 1; omitting x⁻¹ instead produces x⁻².
- A function failing the displayed unit covariance does not descend to H on the quotient.
- The constant Fourier coefficient of θ_σ of a moment is zero; the derivative measure cannot preserve that coefficient unchanged.

Evaluate the Eisenstein measure at the ordinary CM point to obtain Katz's measure. For tame-unramified χ with infinity type −kΣ−Σ_σ d_σ(σ−̅σ), k≥1 and d_σ≥0, its period-normalized moment equals

```text
 Local(χ;Σ,δ) [OM×:OF×] ∏_{P∈Σp}(1−χ̌(P̄))(1−χ(P̄))
 × (−1)^(kg) π^(Σd) ∏σ Γ(k+dσ)
 × L(0,χ) / ( √DF ∏σ Im(σδ)^dσ ∏σ Ω∞,σ^(k+2dσ) ).
```

The left side is ∫χ_p dμ divided by ∏Ω_p,σ^{k+2d_σ}. Here g=[F:Q], χ̌ is given on unramified ideals by χ̌(A)=(χ(Ā)N(A))⁻¹, extended by zero at ramified ideals after forming its local idelic character. The local factor is the normalized partial Fourier transform of Katz (5.2.26)–(5.2.38), pp. 272–273: on the selected local coordinate it is |OF,𝔭/pⁿ|⁻¹Σ_a F_{p,1}(a)exp(−2πi Tr_p(a tδ₀)); the other coordinate is evaluated without Fourier transform. Normalize by χ(B)∏σ σ(a)^{-k}(σ(̅a)/σ(a))^{d_σ} for the ideal representative aB in §5.1. Include `localFactor_changeRep`, its Gauss-sum expression, its unramified value 1 and nonvanishing. The normalizing character and periods are nonzero; the Euler factors may vanish. Katz Theorem (5.3.0), p. 274, is the interpolation source.

Prove Katz's functional equation `katz_functionalEquation` for every continuous character ρ: with ρ̌(g)=N(g)⁻¹ρ(̅g)⁻¹ for CM conjugation g↦̅g and the p-adic norm, L_μ(ρ̌)=N_F(𝔠)ρ(𝔠)L_μ(ρ), where 𝔠 is the polarization ideal. It is an equality of Mellin transforms; it does not divide by L_μ(ρ). Katz (5.3.7), p. 275, is the source. Also prove `katz_interpolation_otherChamber` for k≤1 and k+d_σ−1≥0 at every σ: the same period-normalized interpolation identity follows by this involution from the first chamber (Katz Corollary (5.7.9), p. 285). Construct `katzHidaTilouineMeasure` for general prime-to-p tame conductor C, retaining the primitive L-value, all omitted C-Euler factors, local root factors and the selected CM type. Supply `tameSpecialisation`, `primitiveComparison`, `anticyclotomicProjection`, `periodChange` and `baseChange`. Hida–Tilouine Theorem II, p. 193, and Theorem 5.1, pp. 229–230, together with Hida 2010 (1.2)–(1.3), pp. 43–44, specify the full interpolation identity. This extension is not obtained by simply inserting χ of arbitrary conductor into Katz's tame-unramified theorem.

In the Hida–Tilouine normalization decompose C=𝔉𝔉_c𝔐, where 𝔐 is nonsplit, 𝔉 and 𝔉_c are supported on conjugate split primes, (𝔉,𝔉_c)=1 and 𝔉_c^c⊇𝔉 as ideals. For χ of their infinity type m₀Σ+d(1−c), require its conductor to contain every prime of 𝔉 and either m₀>0, d_σ≥0, or m₀≤1, d_σ≥1−m₀. Their infinity-type convention is translated explicitly when comparing with Katz. Set

```text
G(t,χ_Q)=χ_Q(ϖ_Q^(−e)) Σ_{u∈(OM/Q^e)×}χ_Q(u)e_M(ϖ_Q^(−e)t_Q⁻¹u),
Wp(χ)=∏_{P∈Σp}N(P)^(−e(P))G(2δ,χ_P),
```

with G=1 outside the primitive conductor and nonzero t_Q generating the required different. The complete primitive interpolation is

```text
∫χ̂ dμ / Ωp^(m₀Σ+2d)
 = [OM×:OF×] Wp(χ) (−1)^(m₀[F:Q]) π^(Σd) ΓΣ(m₀Σ+d)
   /[√|DF| Im(δ)^d Ω∞^(m₀Σ+2d)]
   ×∏_{Q|C}(1−χ(Q))
   ×∏_{P∈Σp}(1−χ(P^c))(1−χ*(P^c)) L(0,χ).
```

The tame functional equation also retains

```text
W′(χ)=∏_{Q|𝔉}G((2δ)^c,χ_Q⁻¹)
      ×∏_{Q|𝔉_c}G(2δ,χ_{Q^c}⁻¹)
      ×∏_{Q|𝔐}G((2δ)^c,χ_Q⁻¹),
∫χ̂ dμ_C=N_F(𝔠)⁻¹χ(𝔠⁻¹)W′(χ)∫χ̂* dμ_{C^c},
```

with conductor containing every prime of 𝔉𝔐 and 𝔠 the prime-to-p polarization ideal. The inverse characters in G are local characters, before extension to ideals. Supply `HT_primitiveInterpolation`, `HT_tameFunctionalEquation` and `HT_gaussChangeGenerator`. The two allowed infinity-type chambers make every gamma argument positive. This full tame equation is distinct from the earlier tame-unramified Katz equation, whose measure and polarization normalization differ.


**Checks.**
- For k=1 and every d_σ=0, the gamma product is 1 and the period exponent is 1 at each σ; no Γ(0) is introduced. In the second Katz chamber k=0, d_σ=1, the gamma product is again 1 and each period exponent is 2.
- At a ramified ideal the extended ideal character is zero, so the associated omitted Euler factor is 1. The notation χ̌(P) never means division by a zero ideal value.
- A vanishing Euler multiplier permits a zero moment with nonzero complex L-value. Nonvanishing of the local Gauss factor does not remove such a trivial zero.
- Specializing C to the unit ideal recovers Katz with the same polarization, periods and primitive convention; changing a differential by a multiplies a weight-w moment by a^{-w}.
- If χ is unramified at all selected Σ_p primes, Katz’s normalized local factor is 1. At a selected prime of primitive conductor norm Q, its partial-Fourier numerator instead has complex absolute value Q^{−1/2}; it is nonzero, without being asserted to be a p-adic unit.
- Changing the factorization used to choose aB multiplies the partial-Fourier numerator and its normalizing character/monomial by the same factor. The normalized local factor stays unchanged; keeping only the numerator fails this test.

Finally construct `groupRingEisensteinFamily` over a finite abelian ray Galois group, in its appropriate parity quotient, by characterwise Hilbert forms with the integral descent proved coefficientwise. Supply `glue`, `specialise`, `E`, `W`, `W_integral` and `ord_W`. The first family uses a Stickelberger constant term; the auxiliary form W includes the tame corrections and ordinary stabilization needed for congruences. Dasgupta–Kakde §§7.2.8 and 8.1–8.4, pp. 47–62, supplies these formulas. Their group-ring normalization works away from 2; it must not overwrite the p=2 Deligne–Ribet theorem.

**Checks.**
- Specializing the group ring at a character recovers its nebentypus Eisenstein series and its constant term.
- The coefficient of an ideal coprime to the modulus is the characterwise divisor sum, so agreement of constant terms alone cannot establish equality.
- At p=2 an argument using the parity idempotent (1−c)/2 is unavailable over Z₂; the away-from-2 family makes no integral claim there.

### Ordinary unitary and representation-theoretic suppliers

PELModuli supplies the unitary moduli problem, its ordinary locus and p-level tower; AutomorphicBundles supplies the algebraic automorphic bundles, duality and rational structures. PadicFamilies supplies a general ordinary projector and specialization framework. Layer 4 must still verify those hypotheses for its particular unitary lattices and Hecke algebra; it does not assume Gorensteinness from ordinarity. SmoothRepresentationsOfLocalGroups, ReductiveGroupsPartII and AutomorphicLFunctionsAndLocalFactors supply parabolic induction, local functional equations, Whittaker functions and doubling local factors. A nonzero local test vector, its rationality and the exact normalizing constant remain explicit obligations here.

## How to read the build

Layer 0 fixes the ray-class limit and its evaluation functor. Layer 1 constructs the algebraic critical evaluations; Layer 2 lifts them to finite-slope distributions and proves interpolation. Layer 3 compares the supplied totally real and CM measures. Layer 3h constructs anticyclotomic toric measures and separates Fourier-integrality theorems from geometric nonvanishing arguments. Layer 4 treats two unitary doubling constructions with different hypotheses, and Layer 4e treats Klingen pullback families. Layer 5 records only comparisons justified by a common normalization and a uniqueness theorem. The small definitions in `Suggested.lean` test the arithmetic sign, weighted inversion, Euler correction and common-level principle; objects requiring new analytic or moduli carriers remain fully specified here.

## Layer 0: ray-class limits and evaluation

### 0.1 The fixed-tame ray tower

Construct `rayClassTower F n p` as the inverse limit of the supplied positive ray groups Cl⁺_F(np^a), where the indexing ideals run cofinally through those supported above p. The transition map is `classMap` for divisibility of moduli. Supply `RayClassTower.limit`, `proj`, `proj_surjective`, `ext`, `tameChange`, `isOpen_ker_proj` and `compactSpace`. Surjectivity of each projection follows from the finite surjective system and compactness, not from arbitrary inverse limits preserving surjections. Tame change n|n' goes from the n'-tower to the n-tower. This is the inverse-limit object in BSW §9.2.1, p. 30, generalized to a fixed tame modulus using the supplied finite ray groups.

**Checks.**
- For F=Q and n=1, Cl⁺_Q(p^∞) is Z_p^×. The projection to conductor p has p−1 elements in its image, including two when p=3.
- Conductor p² to p is reduction of units; an element 1+p at level p² maps to 1 at level p. The reverse direction is not a canonical transition map.
- With n=(1), tame change is the identity. Requiring a nonzero modulus excludes the zero ideal, whose quotient is not a finite ray modulus.

Prove `rayClassTower_unitExact`: with U_p=(OF⊗Z_p)^× and E_+(n) the totally positive units congruent to 1 modulo n, the sequence

```text
1 → closure(E_+(n)) → U_p → Cl⁺_F(np^∞) → Cl⁺_F(n) → 1
```

is exact as compact topological groups. The middle map is the p-idelic unit map; its ideal-coordinate inverse follows the convention above. Prove `rayClassTower_fibreChart` for a level f supported above p and divisible by every such prime: the fibre over y∈Cl⁺_F(nf), after choosing an idele a_y above y, is the quotient of U(f)={u∈U_p:u≡1 mod f} by closure(E_+(nf)). The full tower is the finite clopen union of these fibres. Continuous invariance under the units extends to their closure by Hausdorffness; this uses the supplied closure theorem, rather than replanning it. BSW §9.2.1, equation (11), p. 30, and Katz (5.4.2)–(5.4.6), p. 275, are the sources.

Define `rayLeopoldtDefect` as the dimension of the kernel of the p-adic logarithm on OF^×⊗Q_p, with `unitClosure_rank`, `defect_nonnegative` and `dimension_eq`; do not import a later integral-Iwasawa development. Prove `rayClassTower_dimension`: the dimension is r₂+1+δ_{F,p}, because the unit closure has rank r₁+r₂−1−δ_{F,p}. A compact commutative analytic chart has a finite torsion factor and a free Z_p factor after a choice of splitting. For totally real F, dimension one is equivalent to Leopoldt. BSW §12, p. 39, and Bergdall–Hansen §1.8, pp. 11–12, explain the obstruction; the rank calculation uses the finite unit-index changes and the supplied unit theorem. The logarithmic map is taken on a sufficiently small unit subgroup, including 1+4Z₂ when p=2.

**Checks.**
- F=Q has unit rank zero and dimension one, for every p including 2.
- An imaginary quadratic field has dimension two: its global units have rank zero. A one-variable uniqueness theorem is insufficient.
- In signature (1,1), for example Q(∛2), dimension is at least two although the allowed algebraic weights have only one parallel direction.

Prove `rayClassTower_artin`: the tower is the Galois group of the union of ray fields of conductor **dividing** np^∞, with the positive infinite modulus. This is compatible with all projections and Frobenius at primes outside np. A fixed tame conductor bound cannot be replaced by “all abelian extensions unramified outside np” with arbitrarily large conductor at primes dividing n. The proof is finite ClassFieldTheory reciprocity followed by the profinite-limit universal property; Katz (5.4.2)–(5.4.6), p. 275, gives the intended limit comparison. An anticyclotomic quotient requires its own specified norm relation and, when desired, its maximal torsion-free pro-p quotient; those two operations are not interchangeable.

### 0.2 Hecke avatars and the critical character set

Using the supplied algebraic Hecke character χ of infinity type r, let w_r be its algebraic monomial and define εχ by w_{r,∞}=εχχ_∞. On archimedean sign elements ι this gives εχ(ι)=χ_∞(ι)ι^r. Define `rayClassAvatar χ` on a full idele x by εχ(x_∞)·ι_p(χ_f(x_f))·w_{r,p}(x_p), transporting algebraic finite values through the fixed embeddings. The sign factor is essential on this full domain; the expression χ_f·w_{r,p} alone is only the formula on representatives with positive infinite component. Prove triviality on F×, F_∞^+ and U(np^∞) with the specified tame conductor. Supply `pAdicAvatar_mul`, `pAdicAvatar_finiteOrder`, `pAdicAvatar_isLocallyAlgebraic`, `pAdicAvatar_frob`, `algebraicAvatar` and `signCharacter`. This adds the p-adic avatar comparison to the existing complex Hecke-character API. BSW Definition 1.3 and Proposition 1.4, p. 7, and §9.5, pp. 34–35, supply the formula and descent.

Prove `locallyAlgebraicCharacter_avatar`: a locally algebraic character of the ray tower whose algebraic weight satisfies the global unit compatibility arises from an algebraic Hecke character of the permitted tame conductor. Retain the exact global compatibility, not merely the necessary condition r+̅r parallel. In particular real places constrain the infinity weights, while a CM type admits nonparallel paired weights subject to units. The proof uses the supplied algebraic-character classification and the unit-closure sequence, with a finite-order residual character.

**Checks.**
- A finite-order character with zero algebraic weight has its usual finite-order p-adic avatar.
- For |·|⁻¹ over Q, the ideal (ℓ) has avatar value ℓ and the local-unit ray coordinate u has value u⁻¹. Evaluating at u=2,3 detects the missing inverse.
- A proposed local monomial nontrivial on a global positive unit cannot descend; it is rejected even if its individual exponents are integers.
- For the inverse norm character over Q with algebraic exponent r=1, the BSW sign correction ε(−1) is −1, although its archimedean absolute-value character is 1 at −1. At the diagonal idele −1, χ_f=1 and w_{r,p}=−1, so the three factors give (−1)·1·(−1)=1. Omitting εχ gives −1 and fails descent through Q×. At p=2 that sign is retained, not absorbed into a torsion factor of order p−1.

### 0.3 Gauss sums, depleted values and odd characters

For the finite sum, `finiteGaussCore χ e` is the light weighted Fourier kernel Σ_a χ(a)e(a) on a finite index type. It specializes the supplied finite-ring Gauss sum after its character hypotheses are supplied; it does not construct global characters. Supply `finiteGaussCore_zero` and `finiteGaussCore_reverseCharacter` for reversing the additive character by reindexing. Define `rayGaussSum χ` at the primitive finite conductor f using the standard additive character, the inverse conductor adele b_f and the different correction χ(d⁻¹). The finite sum is over (OF/f)^× and uses χ_f(b)e_F(bd⁻¹b_f). Supply `gaussSum`, `gaussSum_eq_prod_epsilon`, `gaussSum_twisted_sum`, change-of-conductor representative invariance and nonvanishing at the **primitive** conductor. Define `pDepletedLValue χ S s` by deleting the finite set S of Euler factors from the supplied L-function: `depletedLFunction_eq` and `depletedLFunction_union` use products over a set, so a prime in S∩T is not removed twice. BSW Definitions 1.5–1.6, p. 7, and Theorem 4.6, p. 17, supply the Gauss and integral normalization; DKV §1, pp. 2–3, supplies p-depletion at zero.

**Checks.**
- For the trivial character of conductor one the finite Gauss sum is 1. An imprimitive summation modulus is not substituted into the nonvanishing theorem.
- For a primitive quadratic character modulo 3 with e^{2πi/3}=ζ, the positive-sign finite sum is ζ−ζ², whose square is −3; reversing the additive sign negates it. The Lean Fourier-kernel witness uses the order-three root 2∈F₇: 2−4=5, whereas reversing the additive character gives 4−2=2=−5. A second example computes the one-point sum as 1 and the zero-weight sum as 0.
- For S=∅ depletion changes nothing; for S={w}, T={w}, union removes one Euler factor, not its square.
- A ramified local character has extended ideal value zero, so its omitted Euler factor at s=0 is 1, rather than an undefined inverse.

Prove `totallyOdd_L_zero_ne`: for F totally real and χ finite order and odd at **every** real place, L(χ,0)≠0. Consequently L^{(p)}(χ,0)=L(χ,0)∏_{𝔭|p}(1−χ(𝔭)) vanishes exactly when some χ(𝔭)=1. Consume the complex functional equation and L(1,̅χ) nonvanishing from their owners; this roadmap uses the resulting criterion. DKV §1, pp. 2–3, states this normalization. Total oddness is a sufficient hypothesis for this theorem, not a necessary condition for every character to have nonzero value. In particular the trivial character over Q is even and ζ(0)=−1/2, so a blanket claim that every even character vanishes is false. This rational value is the supplied Mathlib `riemannZeta_zero`, pinned in the Lean companion, independently of the totally odd theorem. The criterion concerns imprimitive specializations, not nonvanishing of every p-adic branch.

### 0.4 Distributions on the ray quotient

Define `rayClassDistribution F n L` by the supplied strong dual of the ray limit's locally analytic functions, using the finite clopen fibre charts above. Supply `restrictFibre`, `ofUnitInvariant`, `mellin`, `measure_coe` and `chart_independent`. Here `ofUnitInvariant` accepts a functional on the invariant **test subspace**; an arbitrary upstairs distribution also defines one by restriction. It does not impose that the upstairs functional be fixed by every unit, and it does not choose a unique extension of a quotient functional. Define the analytic structure and quotient tests using the closed unit subgroup. BSW §§9.1–9.2, pp. 28–32, gives the local analytic test construction; the duality and descent theorem are supplied by LocallyAnalyticDistributions.

**Checks.**
- Pushing a Dirac distribution at x through a quotient gives Dirac at its image, even if the original Dirac is not invariant under translations by the kernel.
- For F=Q the level-p fibre decomposition has p−1 fibres, not one. At p=2 conductor 2 has one fibre, while conductor 4 has two.
- The zero functional remains zero under every chart change. A functional not continuous for the locally analytic topology is not a distribution merely because its polynomial values exist.
- A quotient consisting of one point has distributions L; it does not retain arbitrary independent functionals on every point of its preimage.

Define `rayEvaluationMaps` with `eval μ κ=μ(κ)`, `twist μ κ` by multiplication of tests by κ, and `map μ f` by pullback along an analytic homomorphism f. Supply `eval_twist`, `eval_map`, `map_twist`, tame change, norm pushforward and coefficient extension. The order is (f_*μ)(κ)=μ(κ∘f), while (κ·μ)(ψ)=μ(κψ). For a Dirac at x and f(x)=x² the two tests ψ(x)=x and ψ(x)=x² evaluate at x² and x⁴ after pushforward. These operations are the supplied analytic-dual operations specialized to the ray chart, as used by BSW §9.2, pp. 30–32, and Katz §5.4, p. 275.

**Checks.**
- Identity pushforward leaves every character value unchanged; the trivial character gives total mass.
- Twisting a Dirac at x multiplies it by κ(x), so two characters κ and κ² give factors κ(x) and κ(x)².
- For a norm quotient, pull back the quotient character before evaluating. A character that is nontrivial on the kernel is not a character of that quotient.

Prove `conditionalEvaluationPrinciple`: given a continuous cohomological or measure-valued evaluation into D(G,L), compatible finite-level evaluations and nonzero refinement eigenvalues satisfying the norm relation, the normalized common-level evaluations give a distribution with those specializations. Interpolation requires an additional proved comparison with the classical evaluation. Boundedness requires an integral bound, and uniqueness requires either bounded-measure density of finite-order characters or the appropriate locally polynomial tests and growth bound. These are separate conclusions with separate hypotheses. This is BSW Theorem 9.10, p. 34, expressed as the functorial norm argument; its cohomological hypotheses are verified in Layers 1–2, not assumed to follow from arbitrary scalar data. The elementary norm argument appears as `normalisedLevelValue_independent` in the Lean companion, not as a replacement for the distribution theorem.

### 0.5 Euler-factor elements

Let O be a commutative coefficient ring, G the ray quotient, and w∤p an unramified prime with arithmetic Frobenius γ_w∈G. Require N(w) to be a unit in O. Given the consumer's local polynomial P_w(T)∈O[T], define `eulerFactorElement w=P_w(N(w)⁻¹[γ_w])` in O[[G]]. Supply `eval`, `imprimitive`, `imprimitive_union`, `map` and coefficient base change. The specialization is P_w(N(w)⁻¹κ(γ_w)); the polynomial must say whether its operator uses inertia invariants and arithmetic Frobenius or the converted dual convention. No generic assertion exchanges invariants and coinvariants without its comparison theorem. CGLS Theorem 2.1.2, p. 13, and the finite Euler-correction interface of AutomorphicLFunctionsAndLocalFactors give this construction.

For O a complete DVR and G a torsion-free finitely generated pro-p group, the local-ring unit criterion is: an element of O[[G]] is a unit exactly when its augmentation is a unit of O. For a finite torsion component use its componentwise criterion; over arbitrary O no DVR test is asserted. A nonunit need not have positive μ. Supply `eulerFactor_unit_criterion` with exactly these hypotheses, and `eulerFactor_mu_zero_iff_reduction_ne_zero` only in the supplied integral μ setting. The small finite group-algebra specialization `linearEulerCore a g=1−a[g]` and `linearEulerCore_eval` are in the Lean companion.

**Checks.**
- Over F₅[C₃], 1−[g], g a generator, has coefficients 1 at 1 and −1 at g. It is nonzero but its augmentation is zero. The two proved Lean examples fix both facts and the subtraction direction.
- Over O[[Z_p]], 1−[γ] is a nonunit, since its augmentation is zero, but has μ=0 because its reduction is nonzero. Thus “nonunit iff positive μ” is false even for O=Z_p.
- If G is trivial, e_w=P_w(N(w)⁻¹); if P_w=1 the correction is the identity. A coefficient field of characteristic ℓ dividing N(w) does not satisfy the required invertibility.
- In a ramified O, coefficient divisibility is measured by ϖ, not by the rational p. A coefficient ϖ has μ_ϖ=1 and v_p=1/e(O/Z_p).

### Examples

For Q at odd p, the ray tower is μ_{p−1}×(1+pZ_p), while at p=2 it is μ₂×(1+4Z₂). Finite-order characters determine a bounded measure after sufficiently large coefficient extensions and Fourier inversion on each finite quotient. They do not determine an arbitrary locally analytic distribution: a logarithmic Mellin function can vanish at all finite-order characters. This distinguishes the density input used for measures from the stronger moment and growth input used in Layer 2.

The Euler core and weighted inversion are two manifestations of the same convention: specialize an arithmetic group element before taking the prescribed inverse or subtraction. For f(x)=x+1 and χ(x)=x on Q×, χ(x)f(x⁻¹) is 3 at x=2 and 4 at x=3. The forward expression χ(x)f(x) would be 6 and 12. These proved Lean values are the coordinate witness for the ray and BSW chart normalizations; the genuine Gauss and conductor formulas remain targets on their own carriers.

### Dependencies

The layer uses the supplied finite ray-class, class field and Hecke-character API, Mathlib's compact/profinite limit and closure machinery, PadicMeasuresIwasawaAlgebras and LocallyAnalyticDistributions. LFunctions, ArithmeticGaloisRepresentations and AutomorphicLFunctionsAndLocalFactors supply the L-values and local constants. No integral main-conjecture roadmap is needed for the dimension or Euler arguments.

## Layer 1: classical GL₂ evaluations

### 1.1 Weights and the two coefficient conventions

Define `weightCoefficientSystem λ` by specializing the supplied algebraic GL₂ local system to the BSW convention. The predicate `admissibleWeight c k v` requires conjugation-invariant nonnegative k and a parallel k+2v. The index involution c is the actual conjugation of embeddings; its involutivity is part of the embedding data. The light `coefficientSubstitution a b c d (X,Y)` is (dX+bY,cX+aY), with `coefficientSubstitution_diagonal`, `coefficientSubstitution_upperUnipotent` and `coefficientSubstitution_lowerUnipotent` as its coordinate API. The polynomial representation is the tensor over embeddings of homogeneous degree-k polynomials with determinant twist v. Supply `GL2Weight.coeffModule`, `coeffModule_dual`, `coeffModule_baseChange`, `Y1.localSystemOne`, `localSystemTwo` and `localSystemOneEquivTwo`; the last is the adelic coefficient intertwiner α, not a claim that two actions coincide literally. BSW Definition 1.8 and §§2.1, 3.1, pp. 8–11, specify these choices.

Define `criticalBox k j` by 0≤j_σ≤k_σ for every embedding. A critical Hecke character additionally has infinity type j+v and satisfies global unit compatibility. Supply `IsCritical_iff`, `criticalBox_boundary`, `criticalBox_conjugation` when the character weight is conjugation compatible, and `coefficientMonomial`. `admissibleWeight` and `criticalBox` are light predicates in the Lean companion; they are not encodings of the local-system construction.

**Checks.**
- For two real embeddings k=(0,2), v=(1,0), k+2v=(2,2), so the weight is admissible. Requiring k itself to be parallel would wrongly exclude it; the Lean example proves this case.
- For a complex pair with conjugation swapping the entries, k=(2,3) fails conjugation invariance. The second weight example proves rejection.
- With conjugation fixing two embeddings, k=(−1,−1), v=(0,0) satisfies purity but fails nonnegativity; k=(0,0), v=(0,1) satisfies conjugation and nonnegativity but fails purity. These independently test the other two clauses of `admissibleWeight`.
- The critical-box boundary j=(0,3) for k=(2,3) is allowed, while j=(0,4) is not; both are proved in Lean.
- The index j=(−1,0) for k=(2,3) is rejected by the lower bound. For k=(0,0), j=(0,0) is allowed and every other index is rejected.
- At k=0 the polynomial representation is the determinant character and its only critical index is j=0. The zero coefficient module is not the weight-zero representation.
- On degree one, diag(2,3) sends (1,0) to (3,0) and (0,1) to (0,2), as proved in Lean. The upper and lower unit shears send (2,3) respectively to (5,3) and (2,5), in the second proved example. These distinguish the diagonal and off-diagonal positions.

### 1.2 Eigenform data and the period line

Define `classicalEigenformData λ 𝔫` to bundle a supplied cuspidal Hecke eigenform Φ at level Ω₁(𝔫), a coefficient number field K_Φ containing the normal closure of F and all Hecke eigenvalues, and a refinement when p divides the level. Its `twistedLFunction` is the supplied automorphic L-function in BSW's arithmetic normalization, not a new analytic continuation theorem. Put L(Φ,χ)=L(Φ,χ,1), and define `completedValue Φ χ` by multiplying over **all** embeddings σ by Γ(j_σ+1)/(−2πi)^{j_σ+1}. Supply `twistedLFunction_eulerProduct`, `completedValue`, `IsCritical` and `twistedLFunction_classical`. BSW §§1.2–1.3 and §2, pp. 5–10, is the normalization source; Theorem 2.3, p. 10, requires the stated coefficient-field enlargement.

**Checks.**
- For a rational weight-k+2 newform, the j-th critical value is the classical value at j+1 after translating the Hecke character convention.
- For an imaginary quadratic field there are two gamma factors, one for each complex embedding, even though there is one complex place.
- A nonscuspidal Eisenstein eigenvector is not an instance of `classicalEigenformData`; its periods and integral are handled by the supplier's Eisenstein construction.

Use the supplied Eichler–Shimura–Harder map in bottom degree q to obtain φ_C from Φ, with the same finite Hecke eigenvalues. The compactly supported realization must carry the specified cuspidal summand; no canonical injection from arbitrary ordinary cohomology into compactly supported cohomology is inferred from the existence of a map in the opposite direction. BSW Theorem 3.4 and §3.2, pp. 12–13, fixes the class used in the evaluation theorem. The source theorem's comparison, including its cuspidal realization and rational structures, is the contract imported from ArithmeticLocallySymmetricSpaces.

The real Weyl group {±1}^{r₁} acts commuting with finite Hecke operators. For each sign ε, choose a nonzero Hida period Ω_Φ^ε such that the ε-part φ_C^ε/Ω_Φ^ε is defined over K_Φ. Prove the critical-value algebraicity Λ(Φ,χ)/(Ω_Φ^{ε_χ}τ(χ))∈K_Φ(χ). The Gauss sum is in the denominator here. Hida's theorem as stated in BSW Theorem 2.3, p. 10, supplies the precise field and sign. The period is determined only up to a nonzero algebraic scalar; an eigenform with zero ε-component is not assigned a fictitious canonical period.

Define `periodNormalisedSymbol Φ` as θ_K=Σ_ε φ_K^ε, then transport to L and the second coefficient convention through α. Supply `weylAction`, `isotypicPart`, `normalisedSymbol`, `normalisedSymbol_padic` and `normalisedSymbol_period_change`. The idempotent is 2^{-r₁}Σ_ι ε(ι)(·|ι) over characteristic-zero coefficients, including when the rational prime is 2. It is not an integral idempotent in a Z₂-lattice. BSW §3.2.2 and Definitions 3.6–3.9, pp. 12–14, supplies this construction.

**Checks.**
- For F imaginary quadratic there is no real sign decomposition; the Weyl group is trivial, not a group of order two from complex conjugation.
- Multiplying Ω_Φ^ε by a∈K_Φ× divides the ε-component by a; changing only one sign period need not rescale all sign components by one scalar.
- The ε-character evaluation kills every different sign component. At p=2 the construction works over L but does not prove integral projectors on O-cohomology.

### 1.3 Oriented automorphic cycles

Define `automorphicCycle f=F×\A_F×/(U(f)F_∞¹)`, with F_∞¹ consisting of componentwise archimedean norm-one elements in F_∞^+. Its components X_y, indexed by Cl⁺_F(f), are E(f)F_∞¹\F_∞^+ and have real dimension q. Choose a_y with infinite component 1 and the ordered orientation fixed above. The embedding into Y₁(𝔫) is induced by the matrix with diagonal (x,1) and upper-right entry xb_f at the conductor places. Supply `cycleEmbedding`, `cycleEmbedding_component`, `cycleComponentEquiv`, `cycleTrace` and representative-change covariance. Pullback with compact support uses the source's cycle/cohomological construction, not an unproved assertion that every nonproper map pulls compactly supported forms back. BSW §§4.1–4.2, pp. 14–16, is the source.

**Checks.**
- Over Q, X_y is an oriented positive real line modulo its unit action, with q=1.
- In signature (1,1), q=2 and dim Y=5, so calling the cycle “middle dimensional” gives the wrong degree.
- Replacing a_y by a_yγu with γ∈F× and u∈U(f) changes the chart but not the embedded cycle class after the coefficient transport.
- At f=(1) the additive component b_f is zero. It is not the multiplicative identity idele inserted as an additive upper-right entry.

### 1.4 Classical evaluation and the critical integral

Define `classicalEvaluation` by pulling a degree-q compactly supported class to X_y, applying ρ_j(P)=P(X^{k−j}Y^j), and taking the oriented trace. Unit compatibility of χ of infinity type j+v trivializes the pulled-back scalar local system. Sum these component evaluations with ε_χχ_f(a_y). Supply `evalComponent`, `evalCharacter`, `evalCharacter_independent`, `evalCharacter_weyl`, `evalCharacter_isotypic`, `evalCharacterTwo`, `evalCharacterTwo_alpha` and `evalCharacter_baseChange`. For the second coefficient convention, the intertwiner contributes ϖ_f^{j+v}; the conductor idele has positive exponents. BSW Lemma 5.2, Corollaries 5.5–5.6 and Lemma 10.1, pp. 18–20 and 35–36, give these identities.

The light `orientationSign c r=(−1)^{c+r}` records the complex and real degree sums in this trace. Supply `orientationSign_zero`, `orientationSign_add` and `orientationSign_succ` in either coordinate; the last changes the sign.

**Checks.**
- In one real factor k=2, j=0 and j=1 give orientation signs +1 and −1. The two `orientationSign` examples compute these and their complex-degree shifts.
- With both degree sums zero the sign is +1; with complex degree one and real degree two it is −1, while real degree three gives +1. These cases also appear in the two proved examples.
- If a sign ε differs from ε_χ at one real place, the corresponding isotypic evaluation is zero; for r₁=0 this condition imposes no extra projection.
- Replacing a_y by a_yγu multiplies the component scalar and χ_f(a_y) by inverse factors, leaving the sum unchanged. Ignoring either factor fails this test.
- At conductor exponents 1 and 2 the second-system correction has exponents (j+v) and 2(j+v), not their negatives.

Prove `classicalIntegralFormula` for a cuspidal eigenform Φ and a primitive finite-conductor algebraic Hecke character χ with critical index j:

```text
Σ_y εχ χ_f(a_y) Ev_{f,j,1}^{a_y}(φ_C)
 = (−1)^R |DF| τ(χ) Λ(Φ,χ) / 2^r₂.
```

This is BSW Theorem 4.6, p. 17. The proof must expose the analytic integral, not call an unspecified period theorem. Insert an auxiliary complex s in the absolutely convergent half-plane, expand the cuspidal Whittaker series, interchange integral and sum there, and use finite Gauss orthogonality to remove ideals not coprime to f. The real Mellin integral is Γ(j+s+1)/(2π|ζ|)^{j+s+1}. A complex-place integral uses

```text
∫₀∞ K_{j−j̄}(4π|ζ|y)y^{j+j̄+2s+1}dy
 = Γ(j+s+1)Γ(j̄+s+1) / [4(2π|ζ|)^{j+j̄+2s+2}].
```

Combine both embeddings in each complex pair, track the orientation and discriminant Jacobian, sum the ideal classes and then specialize at s=0 after continuation. Williams' thesis §12.1.4, pp. 138–145, supplies this detailed calculation behind the theorem. The nonzero periods and primitive Gauss sum make the subsequent algebraic normalization legitimate; no nonzero L-value is assumed.

Prove `criticalValueFormula` for θ_K:

```text
Ev_{χ,1}(θ_K)
 = (−1)^R |DF| τ(χ) Λ(Φ,χ) / [2^r₂ Ω_Φ^{εχ}].
```

This is BSW Theorem 5.7, p. 20. For a prime added to a conductor, the classical evaluation relation includes χ(𝔭)λ_𝔭−1 in the source's arithmetic convention (Theorem 4.7, p. 18). The factor must not be replaced by 1−χ(𝔭)λ_𝔭 without also changing the rest of the formula. For F=Q prove `rationalSymbolComparison`: the cycle integral becomes the usual modular-symbol integral after the same polynomial, period, orientation and cusp choices. BSW §3.3 and §12, pp. 13–14 and 39–40, provide this specialization; ModularSymbolsPadicLFunctions owns the rational modular-symbol carrier.

### Examples

At k=0 over Q the sole critical index is j=0, the cycle is one dimensional, the gamma factor is Γ(1)=1 and the sign is +1. At k=2, the two endpoints and the middle index have signs +1,−1,+1. Over an imaginary quadratic field, the completed value has two gamma factors and the cycle dimension remains one; the factor 2^{-r₂}=1/2 must survive. These examples jointly test the degree, the complex-pair accounting and the orientation.

### Dependencies

Layer 0, the supplied GL₂ quotient and cohomology, algebraic representations, cuspidal Whittaker functions and complex twisted L-functions. ModularSymbolsPadicLFunctions supplies the rational comparison. Hida period algebraicity is used with its exact coefficient field and signs; it is not inferred from a numerical integral.

## Layer 2: finite-slope distributions over a number field

### 2.1 Analytic coefficients and overconvergent cohomology

Define `analyticWeightCoefficients λ L` by the supplied locally analytic functions on OF⊗Z_p with the weight-λ action. Its strong dual is the distribution coefficient module; polynomial inclusion dualizes to `specialise : D_λ→V_λ(L)*`. Supply `analyticCoeff`, `distCoeff`, `analyticCoeff_action_apply`, `distCoeff_baseChange` and `polynomial_le_analytic`. The coefficient semigroup action is

```text
(γ·f)(z)=det(γ)^v(a+cz)^k f((b+dz)/(a+cz)),
```

with the source's invertibility and analyticity conditions in every p-adic embedding. This is compatible with the polynomial convention in Layer 1. BSW Definitions 6.1–6.4, pp. 21–22, supplies it; the generic spaces and duality are imported.

**Checks.**
- Use the chart f(z)=P(z,1), so f=z corresponds to X and f=1 to Y. At k=1,v=0, diag(2,3) sends z to 3z and 1 to 2; the upper unit shear sends z to z+1 and 1 to 1, while the lower unit shear sends z to z and 1 to z+1. These are the same coordinate substitutions tested in Lean in Layer 1, and distinguish the chart from P(1,z).
- At weight zero, Dirac at z specializes to evaluation on constants, so every Dirac has mass 1; the specialization is not injective.
- A matrix for which a+cz vanishes in the chart is excluded from that action chart. It cannot act by the displayed quotient without another chart.

Define `overconvergentCohomology λ 𝔫 L` for automorphic level (p)|𝔫 using the supplied compactly supported cochain model with D_λ coefficients, with `specialisationMap`, `upOperator`, `upOperator_changeUniformiser`, simultaneous `slopeLE` and `renormalisedUp`. This level condition puts the p-component in the Iwahori coefficient semigroup; the prime-to-p ray modulus n is a separate parameter. Put v_𝔭(λ)=Σ_{σ∼𝔭}v_σ and normalize U'_𝔭 by removing the weight shift v_𝔭(λ)/e_𝔭. The operator U_f is the product of the commuting prime operators with conductor exponents. BSW §§6–8, pp. 21–27, supplies the arithmetic verification; LocallyAnalyticDistributions owns the slope carrier.

**Checks.**
- With two p-primes the two U operators act in distinct coordinates. A slope bound for one does not impose a bound for the other.
- Changing the local uniformizer gives the prescribed unit action and transported eigenvalue, rather than a new p-adic L-function without comparison.
- The zero cohomology group has zero generalized eigenspaces; a chosen refined eigenclass must be nonzero if it is to represent Φ.

### 2.2 Compactness and the small-slope control theorem

Prove `up_compact_corrected`: the chart operator is completely continuous when its lower-right entry contracts by p in **all** p-adic coordinates, with the other semigroup conditions of §6. The diagonal identity fails this condition on an infinite-dimensional analytic coefficient Banach space. A single U_𝔭 is only partially contracting when p has several prime factors; use the appropriate product or partial-classical coefficient space before invoking full compactness. This is the corrected BSW Lemma 6.7, p. 22, with the denominator and radius conditions explicit. Transfer the verified compactness to the cochain complex to obtain `overconvergent_slopeDecomposition` in every cohomological degree where the supplied finite complex applies.

Prove `renormalised_negativeSlope_vanish`: a bounded open O_L-lattice stable under O_L[U'_𝔭] has no generalized eigenvector with negative U'_𝔭 slope. An L-vector space alone is not the bounded lattice hypothesis. The coefficient quotient used in control has such a lattice, giving the lower bound of BSW Lemma 8.1(iii) and Corollary 8.4, pp. 23–24. At slope exactly zero the conclusion is not vanishing. On a one-dimensional space U'=1 gives a nonzero slope-zero vector, while U'=p⁻¹ does not preserve a bounded open O_L-lattice. These are the two scalar controls for the lattice condition.

### 2.3 Partial classicality and theta maps

Define `partialThetaMap σ` by dualizing the (k_σ+1)-st analytic derivative. Its reflected weight has k'_σ=−2−k_σ and v'_σ=v_σ+k_σ+1, with all other components fixed. Define `partiallyClassicalDist J` by imposing local polynomial degree at most k_σ in coordinates σ∈J and leaving the others analytic. Supply `thetaMap`, `thetaWeight`, `partiallyClassicalDist`, `bgg_exact`, `partialSpecialise_exact` and `thetaMap_up`. The exact sequence ends in the **dual** locally polynomial coefficient module:

```text
⊕σ D_{λσ} → D_λ → V_λ^loc(L)* → 0.
```

Use the successive partial exact sequences to avoid assuming an all-coordinate smallness bound from one prime. In the reflected coordinate the negative k'_σ does not belong to the already classical set. BSW §8.2, pp. 25–27, supplies the construction; the later explicit quotient identifies the dual even where an earlier printed expression suppresses its star.

**Checks.**
- At k_σ=0 the first derivative kills constants but not z, and reflection gives k'_σ=−2, v'_σ=v_σ+1.
- At k_σ=1 the second derivative kills 1,z and sends z² to 2; at characteristic zero this is nonzero, including over Q₂.
- With J empty the coefficient module is fully analytic; with J all embeddings it is the dual locally polynomial quotient. These are not both the full distribution module.
- In a single reflected coordinate the determinant twist increases by k_σ+1; changing only k leaves the U'_𝔭 intertwining slope wrong.

Prove `smallSlopeControl` in **every** cohomological degree r: specialization is an isomorphism on simultaneous slopes h_𝔭 satisfying

```text
h_𝔭 < [ min_{σ∼𝔭}(k_σ) + v_𝔭(λ) + 1 ] / e_𝔭
```

when h_𝔭 is measured for U_𝔭 with v_p(p)=1. Equivalently remove v_𝔭(λ)/e_𝔭 for U'_𝔭. The inequality is strict at every 𝔭|p, and e_𝔭 is the ramification index of F_𝔭/Q_p. BSW Theorem 8.7, pp. 26–27, proves this via the partial exact sequences and negative-slope vanishing. Prove `smallSlopeEigenlift`: the period-normalized classical eigenclass has a unique lift **inside the simultaneous small-slope subspace**, preserving all commuting Hecke eigenvalues. It is not asserted unique in all overconvergent cohomology. The small-slope isomorphism gives this eigensymbol consequence.

The endpoint k=0, v=0, e=1 has bound h<1; h=0 passes, h=1 does not. At a ramified prime e=2 the bound becomes h<1/2, not h<1. The theorem applies when r=0 even if that particular cuspidal group vanishes; it does not force every degree to contain the eigenform.

### 2.4 Forward fibre charts and weighted inversion

Define `overconvergentEvaluation` by pullback to the same cycles, coefficient untwisting, restriction to a_y and trace. Its value is a functional on analytic tests with the source's unit covariance. The forward chart sends a test φ to φ_a(z)=φ(az). Under a'=aγur the relation is φ_{a'}(z)=φ_a(ũz); the dual right action uses ũ⁻¹, so the two changes cancel. Supply `ocEvalComponent`, `covariantAnalytic`, `ocEvalComponent_rep_change` and `ocEvalComponent_specialise`. BSW §9.1–§9.2, pp. 28–32, supplies the charts.

Define `weightedInversion χ f(x)=χ(x)f(x⁻¹)` on the unit group. In the BSW chart χ is the weight monomial z^{k+v}; extend the result by zero off the unit chart. Supply `weightedInversion_apply`, `weightedInversion_covariant`, `weightedInversion_translate`, `weightedInversion_involutive` on its stated unit domain and `weightedInversion_character`. Unit-invariant tests become the required e^{k+v}-covariant tests under this operation. BSW Definition 9.4 and Proposition 9.3, pp. 31–32, are the source. The Lean definition is exactly the unit-group formula, with general group G and coefficient field K; the extension-by-zero needs the actual analytic unit chart and remains here.

**Checks.**
- For χ(x)=x and f(x)=x+1, the values at x=2,3 are 3 and 4, as proved in Lean; omitting inversion gives 6 and 12.
- For χ=1 the indicator of {2} becomes the indicator of {1/2}; its values at 1/2 and 2 are 1 and 0, proved in Lean.
- Applying the operation twice gives f because χ(x)χ(x⁻¹)=1. Outside the unit chart the zero extension is not an involution on all functions.
- A non-unit-invariant test is not declared to descend merely because it has an inverse argument. The covariance condition is an independent hypothesis.

### 2.5 Finite evaluations and the norm relation

For f divisible by every prime above p, define `finiteEvaluation Ψ f` by summing the chart evaluations of the lifted eigensymbol Ψ over Cl⁺_F(f), after weighted inversion and extension by zero. Supply `levelDistribution`, `levelDistribution_apply`, `levelDistribution_reindex` and `levelDistribution_avatar`. Prove `finiteEvaluation_representativeIndependent` by pairing the forward chart transformation with the inverse dual action; BSW Definition 9.5 and Proposition 9.6, pp. 31–32, supplies this construction. No special choice of all a_y is hidden in its final value.

**Checks.**
- Over Q at level p the sum has p−1 components for every p: one at p=2 and two at p=3. At p=2, passing to level 4 gives two components. Omitting all but the identity component generally changes the measure when there is more than one.
- The zero eigensymbol evaluates to zero on every test, before and after normalization.
- Replacing one a_y by a_yγur does not alter the sum, but replacing just the chart without its dual coefficient action changes it in general.

Define `refinementEigenvalue α f=∏_{𝔭|p} α_𝔭^{ord_𝔭(f)}` for the commuting U_𝔭 eigenvalues of Ψ. Supply `refinedEigenvalue_one`, `mul`, `prime` and `eq_eigenvalue`. Finite slope means α_𝔭≠0 in L; ordinarity means slope zero, which is stronger. BSW §9.2.3 and Lemma 9.8, pp. 33–34, supplies these conventions.

**Checks.**
- The unit ideal gives eigenvalue 1. For α=2, exponents 1 and 2 give 2 and 4, proved in the first `refinementEigenvalue` Lean example; they also pin the positive conductor-exponent convention.
- Distinct primes multiply their eigenvalues, independently of their order. The second Lean example computes α=(2,3), f=(1,2) as 18 and the zero multi-index as 1.
- α=0 has infinite slope and is not admitted in a construction dividing by α, even if a zero symbol happens to satisfy its eigenrelation.

Prove `finiteEvaluation_normRelation`: for a simultaneous eigensymbol, μ_Ψ^{f𝔭}=α_𝔭 μ_Ψ^f as distributions after the natural identification on the ray limit. This uses the double-coset decomposition and all conductor representatives, not just equality on critical characters. BSW Lemma 9.8 and Proposition 9.9, pp. 33–34, are the source. Iteration to a common multiple g of f and f' proves `normalisedEvaluation_commonLevel`.

Define `bswDistribution Φ=α_f⁻¹ μ_Ψ^f`. Supply `padicLFunction`, `padicLFunction_apply`, `smul`, `changeUniformiser` and `padicLFunctionOf` for explicit period/refinement data. Prove independence of every sufficiently divisible f using nonzero α_𝔭. This is BSW Theorem 9.10 and Definition 9.11, p. 34. The Lean `normalisedLevelValue` uses a multi-index measured **above a fixed initial admissible level**, so index zero is not a claim that conductor one suffices. Its theorem assumes the genuine update norm relation and concludes independence for all indices.

**Checks.**
- In a one-prime model with α=2 and raw(n)=2ⁿ·3, normalized levels n=0,2 both equal 3; the first Lean example proves these two values.
- Raw(n)=3 fails the norm relation for α=2: normalized levels 0,1 are 3 and 3/2. The second Lean example proves that failure, so the theorem cannot omit its update hypothesis.
- For the zero coefficient module every normalized value is zero; α is still required nonzero to define the chosen inverse formula uniformly.
- In two coordinates, a common upper level is obtained coordinatewise; comparison must multiply both eigenvalues with their respective exponents.

### 2.6 Interpolation and its correction factors

Prove `overconvergentEvaluation_classical` by specializing the coefficient evaluation to each monomial and comparing the two local-system conventions. BSW Proposition 10.3 and Corollary 10.4, p. 37, supplies the character identity. For χ of critical infinity type j+v and conductor f|p^∞, put B={𝔭|p:𝔭∤f}. Then prove `bsw_interpolation`:

```text
μ_Φ(χ_p)
 = (−1)^R |DF| τ(χ) ϖ_f^(j+v)
   × ∏_{𝔭∈B} [ χ_p(ϖ_𝔭)(1−α_𝔭⁻¹χ(𝔭)⁻¹) ]
   × Λ(Φ,χ) / [ 2^r₂ α_f Ω_Φ^{εχ} ].
```

For χ ramified at a p-prime that prime is not in B, so an inverse of its zero extended ideal value never occurs. All α_𝔭 and Ω are nonzero. The idele monomial is evaluated through the fixed p-adic embeddings. BSW Theorem 11.1, pp. 38–39, is the source. This equality retains the conductor factor and the unramified Euler multiplier, rather than folding them into an unnamed unit.

Prove `bsw_choiceIndependent`: once periods, refinement and uniformizer convention are fixed, the construction is independent of fibre representatives and auxiliary levels. A change of uniformizers has the explicitly transported coefficient action. Over a general number field this is a construction theorem; it does not assert that critical values alone determine the resulting distribution. BSW §12, pp. 39–40, explains why the global unit rank can make the available algebraic characters too small.

### 2.7 Growth, uniqueness and specializations

For totally real F, prove the h-admissibility of the evaluation distribution with h equal to the valuation of the correctly normalized U_p eigenvalue, with the source's radii and coefficient weight normalization. Barrera Salazar 2018, Proposition 6.10, p. 2208, supplies the estimate; it does not require Leopoldt. To obtain uniqueness, combine the **full** critical locally algebraic interpolation range with the supplied admissibility uniqueness theorem on a one-dimensional ray direction, and assume Leopoldt. In the BSW weight convention put a=max_σ(v_σ), b=min_σ(k_σ+v_σ), require a≤b, and use all finite-order twists of N^t for a≤t≤b, with their compatible sign periods. After twisting by N^{-a}, the uniqueness bound is h<b−a+1 for the actual order h on this one-dimensional quotient chart. This is an additional order hypothesis, not a consequence of individual prime slope bounds. For parallel k and v=0 it reads h<k+1. Barrera Salazar Theorem 7.2, pp. 2209–2210, states finite-order interpolation in its parallel-weight setting but explicitly does not claim uniqueness from those values alone. The theorem here is `hilbertGrowth_and_conditionalUniqueness`, with those hypotheses separated.

For imaginary quadratic F and p split, inert or ramified, prove `bianchiGrowth_and_uniqueness` with the source's coordinatewise h_𝔭-admissibility and strict inequalities h_𝔭<(k+1)/e_𝔭. In the split case the growth estimate in one coordinate is uniform in the other. The full critical range 0≤j,j̄≤k is required. Williams 2017, Proposition 6.15, p. 35, and Theorem 7.4, pp. 39–40, are the source. The proof works with arbitrary class number; the fibre decomposition is not collapsed to one component.

Prove `rationalFiniteSlopeComparison` with Pollack–Stevens by matching refinement, normalized symbol and admissible uniqueness. Prove `bianchiComparison` with Williams by comparing its Gauss sum, discriminant, inverse character and period conventions before invoking the two-variable uniqueness theorem. For Hilbert forms compare with Bergdall–Hansen only under the common noncritical hypotheses and a sufficient uniqueness range; no equality without Leopoldt is asserted. Bergdall–Hansen Theorem 1.1.2, pp. 4–5, constructs its more general decent-refinement function. Its ramified local factor is (q_v^{m+1}/α_v)^f, while at unramified θ it is (1−θ(ϖ_v)α_v⁻¹q_v^m)(1−θ(ϖ_v)β_vq_v^{−m−1}). At critical refinements the stated interpolation multiplier is zero and characterization also uses variation in families; the values alone are not a substitute for that variation theorem. Their §1.8, pp. 11–12, states the comparison limitation.

### Examples

An ordinary rational weight-two eigenform has k=v=0 and slope zero, so it meets h<1 and gives a bounded distribution with the usual ordinary Euler corrections. At a supersingular rational prime the permitted finite-slope distribution can have positive growth; replacing it by a bounded measure changes the theorem. In signature (1,1), the ray group has at least two dimensions but the permitted critical algebraic types lie in one parallel direction. No argument from interpolation alone establishes general-field uniqueness in that example.

### Dependencies

Layers 0–1, LocallyAnalyticDistributions for compact slopes, strong duals and growth uniqueness, and ArithmeticLocallySymmetricSpaces for a suitable cochain model. ModularSymbolsPadicLFunctions and PadicFamilies supply the rational and Hilbert comparison objects. The compactness, theta and normalization verifications in this layer are required before applying the supplied abstract theorems.

## Layer 3: comparison of totally real and CM measures

### 3.1 The rational Deligne–Ribet comparison

Prove `deligneRibet_rationalComparison`: under the supplier's identification of the Q ray limit with Z_p^×, the smoothed Deligne–Ribet measure has the Kubota–Leopoldt moments with exactly the same norm and smoothing factor. The comparison is first an equality of bounded smoothed measures, using density of locally constant tests. It induces equality of pseudomeasures after multiplying by a common nonzero-divisor denominator. It is not a proof by comparing a 0/0 at an exceptional character. Deligne–Ribet (0.5), pp. 231–232, and (8.4), pp. 278–279, supply the moments; DirichletPadicLFunctions supplies the Kubota–Leopoldt object and its normalization.

Over Q at k=2 the unsmoothed value is −1/12, so smoothing by an admissible norm-2 class gives 1/4. At c=1 the smoothed measure vanishes and cannot recover the pseudomeasure by division. At p=2 compare the even and odd μ₂ branches separately, retaining the 2-adic integrality refinement. These checks distinguish the measure identity from a normalization only on nonexceptional scalar values.

### 3.2 CM periods and the tame-conductor dictionary

Prove `katz_normalisationComparison`: the Hilbert-modular CM evaluation, the idelic ray-class presentation and the Katz–Hida–Tilouine tame-conductor measure agree after the explicit change of CM type, differential basis, Fourier-transform normalization and omitted Euler factors in the supplier contracts. The theorem requires the ordinary CM type and compatible polarization on both sides. It supplies a commuting diagram for base change and anticyclotomic projection, rather than an assertion that every convention gives the same scalar measure. Katz §§5.3–5.4, pp. 274–276, and Hida–Tilouine §5, pp. 227–233, are the comparison sources.

Define `normalisationComparison` for two such constructions as an identification of their ray quotient, coefficient embeddings, primitive L-function, local factors and period line, with a proved scalar/unit relation between their evaluations and a specified uniqueness theorem. Supply `compose`, `baseChange`, `periodChange`, `tameEulerChange` and `mellin_eq`. It may record equality up to a **specified** unit when integral period choices allow that ambiguity. It does not create a comparison from equality of a few special values.

**Checks.**
- Rescaling a differential by a multiplies a weight-(k+2d) normalized moment by a^{−(k+2d)} on each embedding; k=1,d=0 and k=1,d=1 give a⁻¹ and a⁻³.
- Opposite ordinary CM types exchange the selected p-primes. The local Fourier factor must move with the type, so an identity map on the group alone is insufficient.
- At tame conductor one the tame-conductor measure specializes to the original Katz measure; at larger conductor the omitted Euler factors are retained, including possible zeros.
- A comparison known only after inverting p is not automatically an O[[G]]-unit comparison. The integral lattices and unit period ratio must be supplied.

### Examples

For an imaginary quadratic field with p split, the two ordinary types lead to opposite choices of prime at p. Comparing the same character without the type conversion changes the local multiplier. Comparing after the conversion and the common algebraic differential gives the same algebraic critical value. A zero Euler multiplier remains zero on both sides; the comparison does not cancel it to deduce nonvanishing.

### Dependencies

Layer 0, DirichletPadicLFunctions, and the full PadicFamilies Layer 5 supplier extension above. The general CM-period and moduli constructions are not repeated in this layer. The comparison theorem is conditional on those supplied constructions, including their integral and tame-conductor normalization.

## Layer 3h: anticyclotomic toric measures

### 3h.1 The Rankin–Selberg datum

Define `hsiehSetting` for a totally real F, a CM extension M/F, a cuspidal GL₂ representation π with unitary central character ω, and a unitary character λ of M with λ|A_F×=ω⁻¹ and infinity type (k/2,−k/2), k_σ>0. Allow the source's discrete series and limits of discrete series. Factor the conductor n=n⁺n⁻ into its split and nonsplit parts. The hypotheses are p odd, an ordinary CM type Σ, squarefree n⁻, and ε*(π_{M,v},λ_v)=+1 at every v|n⁻, with ε*=ε(1/2,π_{M,v}⊗λ_v,ψ_v)ω_v(−1). Define the maximal anticyclotomic Z_p^d quotient Γ⁻, with the chosen reciprocity conversion from Layer 0. Supply `HypothesisA`, `SquarefreeMinus`, `criticalCharacters`, `padicMultiplier` and `HypothesisA_of_minus_one`. Ordinarity of the CM type does not impose an ordinary refinement on π. Hsieh 2014, §§1.1–1.2, pp. 709–714, is the source.

The p-multiplier for χ=λφ is

```text
eΣp(π,χ)=∏_{P∈Σp} ε(1/2,π_𝔭⊗χ_P,ψ_𝔭)
                 L(1/2,π_𝔭⊗χ_P)^(-2) χ_P(-2δ)^(-2).
```

Interpret the inverse local L-factor as its polynomial expression at the specified point. Epsilon and character values are nonzero; the inverse L-polynomial can vanish and is not silently a unit. The Γ⁻ character φ has anticyclotomic infinity weight (m,−m), m≥0, in the source's character convention. Half-integral archimedean notation is part of the unitary normalization; the algebraic avatar uses the associated algebraic twist, not a fractional power on O_p× without data.

**Checks.**
- n⁻=(1) makes the local root-number and squarefree requirements vacuous; this is the BDP-type specialization.
- An ordinary Σ with a nonordinary π is allowed. Requiring every U_p eigenvalue of π to be a unit would remove valid cases.
- One local sign −1 at a nonsplit bad prime fails Hypothesis A, even if an unrelated global sign product is +1.
- At p=2 this construction does not claim the integral theorem; no extension is obtained by dropping “odd” from the datum.

### 3h.2 Toric test vectors and Waldspurger evaluation

Define `toricTestVector` using the supplied Whittaker models and the local embeddings M_v→M₂(F_v). The local toric action is π(ι(t)ς_v)W=χ_v(t)⁻¹W with the source's translating matrix and, at p, its modified vector. Supply `IsToric`, `localVector`, `globalForm`, `normalisedCoeff`, `normalisedCoeff_one` and `mu_local_iff`. Global normalization multiplies by the conductor norm and determinant factor used in f*; it is not a choice of arbitrary integral scalar. Hsieh §3.1–§3.6, pp. 721–741, Definition 3.12 and Lemma 3.13, pp. 736–737, give the vectors and form. Proposition 3.19, p. 742, identifies local Fourier integrality with the relevant Whittaker coefficients.

**Checks.**
- At an unramified good place the chosen spherical vector has normalized first Whittaker coefficient 1.
- For two torus elements t₁,t₂, the vector acquires χ(t₁)⁻¹ and χ(t₂)⁻¹, hence χ(t₁t₂)⁻¹. A forward χ action fails this multiplicativity convention with the chosen period integral.
- A local vector multiplied by a nonunit changes the local μ defect. It is not an equivalent normalized integral test vector merely because the complex period remains nonzero.
- A place at which the toric Hom space vanishes cannot be assigned a nonzero toric vector; the root-number hypotheses are used before the global construction.

Prove `explicitWaldspurger`: for factorisable Whittaker vectors, the product of toric periods P_χ(φ₁)P_χ(φ₂), with P_χ integrating φ(ι(t))χ(t) over A_F×M×\A_M×, equals the completed central L-value times the product of normalized local toric pairings. At a finite exceptional set S the local factor is L(1/2,π_{M,v}⊗χ_v)⁻¹ times the explicit local pairing; at unramified places the normalized factor is 1. Define those pairings by their torus integrals and the bilinear Whittaker pairing, including their Haar measures. Hsieh Proposition 2.1, pp. 720–722, is the source. It is a bilinear product formula, not an absolute-square identity with unspecified conjugation.

For the vectors just constructed, prove `explicitToricSquareFormula` by evaluating every local pairing, including ramified nonsplit places, and the archimedean raising operator V^{e+m}. Its scalar expression is the gamma product Γ_Σ(k+m)Γ_Σ(m+1)/(4π)^{k+2m+1·Σ}, the Whittaker-normalized multiplier eΣp^W, L(1/2,π_M⊗χ), |D_M|^{-1/2}, and C'_π(χ)N(π,χ)² of Hsieh Theorem 3.14, pp. 738–740. Define these constants explicitly. Write n⁻=n_s⁻n_r⁻ with n_s⁻ prime to the central-character conductor and n_r⁻ supported on it; write c_χ⁻=c_{χ,1}⁻c_{χ,2}⁻ with the first factor prime to n_r⁻ and the second supported there. Let A(χ) be the nonsplit special places with c_v(χ)=0 and B(χ) the nonsplit places with c_v(χ)>0. With the auxiliary ideal 𝔯 and translating matrices ς_v fixed in §3.4, pp. 723–724, set

```text
C′_π(χ)=2^(#A(χ)+3d) N(c_χ⁻)⁻¹ ω(c_{χ,1}⁻)ω(n_s⁻)⁻¹
 ×∏_{v∤p𝔯}ω(det ς_v)
 ×∏_{w|𝔉, v=w w̄}ε(1/2,π_v⊗χ_w,ψ_v)χ_w(−d_{F,v})⁻²
 ×∏_{v|n_r⁻}χ_v(−δ_v/d_{F,v}) |δ_v|_{M_v}^{1/2}
                    ε(0,χ_v⁻¹,ψ_{M_v}),
N(π,χ)=∏_{v∈B(χ)}L(1,τ_{M_v/F_v})n_v.
```

Here δ_v=θ_v−̅θ_v for the chosen local integral basis; n_v=1 off n_r⁻, while on n_r⁻ it is μ_v(ϖ_v)|ϖ_v|^{(c_v(χ)−1)/2}|D_{F_v}|^{1/4}/ε(0,ω_v,ψ_v), with μ_v the unramified inducing character of §3.8.3. These are equations (3.21), (3.27)–(3.28), pp. 735–738. Supply `toricConstant_eq_localProduct`, `toricNormaliser_eq_localProduct` and their representative-change laws. Every product is finite after omitting the normalized identity factors. C′_π is a p-unit under the source's prime-to-p conditions; N is nonzero, with its valuation retained rather than assumed zero. Here eΣp^W uses χ_P(d_{F,v})⁻², whereas the final CM-normalized eΣp in 3h.1 uses χ_P(−2δ)⁻²; the ratio eΣp/eΣp^W is the explicit nonzero character value ∏_{P∈Σp}χ_P(−2δ/d_{F,v})⁻². The change of normalization is part of the CM evaluation, not a silent equality of those two multipliers. The character ratio is nonzero; the inverse-L Euler polynomials can still vanish. The invariant, period-normalized version is the exact formula in 3h.4 below and fixes their joint normalization.

### 3h.3 The form-valued measure and its CM sum

Construct `anticyclotomicSquareRoot` in two steps. First construct F_{λ,c} valued in the integral p-adic Hilbert forms on the relevant Γ'⊆Γ⁻, whose q^β coefficient is the measure a_β(f*_{λ,c})[rec_{Σp}(β)]. For a critical avatar φ of weight (m,−m), its moment is θ^m f*_{λφ,c}. Supply `qExpansionMeasure`, `qExpansionMeasure_moment`, `qExpansionMeasure_unique` and support on Γ'. Second sum the evaluations at the CM points x(a), with the torsion-branch weights and translating operators |[a] of Definition 5.6, to obtain the scalar measure ℒ_{Σp}(π,λ)∈O[[Γ⁻]]. Supply `squareRoot`, `pAdicL`, `twist`, `periodChange` and `baseChange`, with `pAdicL=ℒ²`. Hsieh Proposition 5.5 and Definition 5.6, pp. 752–754, are the source. The uniqueness of the form-valued **bounded** measure uses finite-character density coefficientwise and the q-expansion injection.

**Checks.**
- Evaluating at the trivial anticyclotomic character gives the undeformed toric form and the corresponding CM sum, with the torsion branch still present.
- A zero Fourier coefficient gives the zero coefficient measure at every character, while a unit coefficient is not turned into a p-multiple by the group-like basis element.
- Squaring ℒ doubles its coefficient-content μ when the Iwasawa algebra is the supplied torsion-free domain. It is ℒ², not ℒ, that interpolates the central L-values.
- Multiplication of ℒ by −1 leaves ℒ² unchanged. An interpolation formula for squares alone cannot choose the sign of the square root.

### 3h.4 Central-value interpolation

Define

```text
Lalg(1/2,π_M⊗λφ)
 = ΓΣ(k+m)ΓΣ(m+1) L(1/2,π_M⊗λφ)
   / [ (Im δ)^(k+2m) (4π)^(k+2m+1·Σ) Ω_M^(2(k+2m)) ],
Ω_M=(2πi)^(-1)Ω∞.
```

All products and powers here are componentwise over Σ. Prove `hsieh_interpolation`:

```text
( φ̂(ℒΣp(π,λ)) / Ωp^(k+2m) )²
 = [OM×:OF×]² eΣp(π,λφ)
   Lalg(1/2,π_M⊗λφ) φ(𝔉)^(-1).
```

The auxiliary prime-to-p ideal 𝔉 is the fixed splitting/conductor choice in Hsieh §1.2; a change of that choice is accompanied by its character unit and CM translation. This is Theorem A, p. 712, and Theorem 5.7, pp. 754–755. Ω_p, Ω_M, Im(σδ) and φ(𝔉) are nonzero. The central value and Euler multiplier can vanish, and the theorem does not divide by either of them. For m=0 the factors Γ(m+1) equal 1 and Γ(k) is defined because k_σ>0. A hypothetical k=0 would introduce an archimedean boundary outside this datum.

### 3h.5 Fourier coefficients and μ

Define `localMuDefect` for the specified integral local toric Whittaker function as the infimum of the coefficient valuations in Hsieh (3.30), not the valuation of a freely rescaled vector. Define the global μ of ℒ as its coefficient-content valuation in O[[Γ⁻]], with μ(0)=∞ and v_ϖ or v_p declared explicitly. Supply `localMuDefect_scale`, `localMuDefect_zero_iff_unitCoefficient`, `globalMu_fourierInf` and the conversion between the two valuation normalizations. Hsieh Theorem 6.1, pp. 756–757, identifies μ with the infimum over Fourier coefficients of the normalized toric forms at the relevant CM cusps, assuming p∤D_F. It uses the linear-independence theorem below; it does not use the withdrawn cofinite-character assertion.

**Checks.**
- The zero measure has μ=∞. A normalized form with a unit coefficient has μ=0, even if its constant coefficient vanishes.
- Multiplying every coefficient by ϖ raises μ_ϖ by 1 and μ_p by 1/e(O/Z_p).
- The Euler element 1−[γ] has μ=0 and augmentation zero, so an exceptional scalar specialization cannot by itself show positive μ.

Prove `hsieh_mu_zero`: assume the 3h.1 hypotheses, p∤D_F, an associated p-adic representation ρ_p(π) with the stated local L-factor compatibility, and absolute irreducibility of its residual restriction to G_M. Then μ(ℒ)=0 exactly when all the nonnegative local toric defects at v|c_λ⁻ vanish. This is Hsieh Theorem 6.2, pp. 757–758. The existence of ρ with the source's compatibility is explicit input for weights including limits of discrete series; this theorem does not prove a general modularity/Galois-attachment result. The sufficient condition p∤∏_{v(c_λ⁻)=1}#λ(O_{M_v}×) yields the zero local defects, giving Theorem B, p. 713, and Remark 6.4, p. 758. Do not omit residual irreducibility or replace all local defects by a statement about only one prime.

### 3h.6 Mod-p linear independence and corrected CM density

Prove `hida_CMFormalRings_linearlyDisjoint`: for an ordinary CM point x in the mod-p Hilbert Igusa tower with p unramified in F, the torus action on its Serre–Tate completion is t↦t^a. For a_i∈T_x(Z_p) with a_i/a_j∉T_x(Z_(p)) for i≠j, the translated completed local function rings are linearly disjoint over the residue field inside the Serre–Tate ring. This is Hida 2010 Theorem 3.20, pp. 98–99. Deduce `hida_CMTranslate_independent` for forms of a fixed nonzero parallel weight κ: if for each i its forms together with H_κ, whose Serre–Tate expansion is 1, are independent, then all their separated translates are independent. This is Corollary 3.21, p. 101. Since T_x(Z_(p))=T_x(Q)∩T_x(Z_p) here, the separation test is equivalently exclusion from the rational CM stabilizer, not from every abstract scalar. The theorem imports the ordinary deformation coordinates and irreducible component from the supplier. Two equal torus translates fail its separation hypothesis; a constant function is zero in the quotient by constants.

Use the **corrected** geometric density theorem: CM-torus-stable sets of conductor levels containing an infinite arithmetic progression give the componentwise density needed in the ordinary tower. An arbitrary infinite selection of points in a pro-variety need not be dense. Hida, *Non-vanishing of integrals of a mod p modular form*, revised 27 March 2025, Corollary 2.12, p. 17, replaces the use of the older density assertion.

Define `correctedDensityCondition` for f=θ^κg, with g a U_𝔩 eigenform and a fixed torsion branch ψ, by the precise coefficient condition of that revision's Theorem 5.2: after descent to a finite field F_q and with ℓ^r the order of the ℓ-Sylow subgroup of F_q[μ_ℓ]× as in (4.16), fix a unit class v modulo 𝔩^j for sufficiently large j≥r and require a representative ξ in the cusp lattice congruent to −v with a(ξ,f_ψ)≠0. For this v, nonzero character integrals with the corresponding local Fourier label v(χ)=v are already Zariski dense. Here the topology is the algebraic Zariski topology on G_m^d over an algebraic closure of Q_ℓ: choose a Z_ℓ-basis γ₁,…,γ_d of Γ and send χ to (χ(γ₁),…,χ(γ_d)). This is not a claim of density in a rigid analytic character space. A coefficient condition in every unit class is a sufficient stronger hypothesis used in the applications, not part of the minimal theorem. Supply `coefficientCondition`, `coefficientCondition_baseFieldExtension`, `nonzeroCharacters_dense` and `badLevels_noArithmeticProgression` in rank one. Theorem 5.2, pp. 28–29, gives this algebraic Zariski density of nonzero character integrals in every rank; Corollary 5.3, pp. 29–30, constrains the zero conductor levels in rank one. It does **not** prove that only finitely many characters vanish in rank one.

**Checks.**
- The zero form fails the coefficient condition, even if the CM points themselves are dense.
- A nonzero coefficient in the selected class −v satisfies the minimal condition for that v, even if all coefficients in a different unit class vanish. It does not imply the stronger all-unit-residue condition used in the applications.
- Equal translates violate the torus-separation condition. Infinitely many points chosen in isolated components of a tower are not substituted for a torus-stable geometric density set.
- In rank one, a set of bad levels containing no infinite arithmetic progression may still be infinite. This conclusion must not be rewritten as cofinite nonvanishing or density zero.

### 3h.7 Nonvanishing of central values: the supported conclusion

Prove `hsieh_centralValues_dense` under the hypotheses of Hsieh Theorem 7.1, p. 759: the 3h.1 datum, p∤D_F, a prime 𝔩|ℓ with (pℓ,nc_χD_{M/F})=1, absolute residual irreducibility over M, and the required zero local defects. Verify the stronger all-unit-residue coefficient condition in 3h.6 using the local Whittaker calculation and the test-vector separation of §7.1. Then the characters with p-unit algebraic central value form an algebraically Zariski-dense subset of G_m^d in the character coordinates specified in 3h.6. The corrected Hida Theorem 5.2 supplies the density step. Nonzero scalar local multipliers and period normalizations must be removed only after their valuations are controlled; a trivial zero cannot be divided away without that check.

The stronger target `hsieh_centralValues_cofinite_rankOne`, namely all but finitely many characters when [F_𝔩:Q_ℓ]=1, requires a replacement argument. Hsieh's proof on p. 760 explicitly invokes the older Hida 2004 Theorems 3.2–3.3; the 2025 correction withdraws that inference. The corrected density theorem alone does not support the cofinite conclusion. Keep the stronger target separate, with this source gap, until an independent cofinite theorem with matching local hypotheses is supplied. It is not used by the construction, interpolation or μ calculation.

### 3h.8 Katz μ and Hecke-value nonvanishing

Prove `hida_katzAnticyclotomic_mu`: p>2 is unramified in F and the nonsplit part of the tame conductor is trivial. On a fixed torsion branch ψ of the anticyclotomic Katz–Hida–Tilouine measure, μ=0 unless the exceptional condition (V) holds. In that case μ is finite and positive. Equivalently the three conditions are: M/F unramified at all finite places; the strict polarization class is not a norm class; and the reduction of ψN is the quadratic character of M/F. Hida 2010 Theorem I, p. 45, and Lemma 5.2, pp. 128–129, give this criterion. This is the anticyclotomic branch, not the full multivariable measure. The latter can have μ=0 even when an exceptional anticyclotomic restriction does not.

For general nonsplit tame conductor define `localCharacterMuDefect χ_v` by μ_p(χ_v)=inf_{x∈M_v×}v_p(χ_v(x)−1) in Hsieh's normalization, and supply `localCharacterMuDefect_units`, `localCharacterMuDefect_uniformizer` and `localCharacterMuDefect_zero_iff`, using the valuation of the normalized finite local character values. In the self-dual setting it agrees with the appropriate unit-group local expression. Prove `hsieh_katz_mu_formula`: for χ of the critical infinity type, χ|A_F×=τ_{M/F}|·|, p∤D_F and root number W(χ|·|^{-1/2})=+1, μ equals Σ_{v|C⁻}μ_p(χ_v). With sign −1 the self-dual measure vanishes identically and μ=∞. For a non-residually-self-dual χ with all local defects zero, prove μ=0. Hsieh, *On the μ-invariant of anticyclotomic p-adic L-functions for CM fields*, Theorems A–B, pp. 2–3, is the source. The residual condition is χ̂^+≠τ_{M/F}ω_F mod the maximal ideal, not merely χ being nontrivial.

**Checks.**
- A tame unit character with a residue value different from 1 has local defect zero.
- A character trivial on units can still differ on a uniformizer; a definition using only units without the self-dual justification gives the wrong general defect.
- A self-dual sign −1 branch is zero, hence does not satisfy a finite μ formula just because its local terms happen to be zero.
- Under the exceptional Hida condition, positivity concerns the fixed anticyclotomic branch; it makes no claim that every specialization of the full measure is p-divisible.

Prove `hsieh_HeckeValues_dense` using Hsieh, *On the non-vanishing of Hecke L-values modulo p*, Theorems A–B, pp. 2–4, with the corrected density step. The branch of Theorem B requires **non-residual self-duality**, χ̂^+≠τ_{M/F}ω_F modulo the maximal ideal, as well as p>2 unramified in F, ordinary Σ, (pℓ,D_{M/F}C)=1 and zero local defects. Failure of exact self-duality is insufficient. Here ω_F and χ̂ use the source's geometric reciprocity; convert both through inversion before using Layer 0's arithmetic convention. The self-dual branch uses root sign +1, the source's squarefree ramified-conductor part and 𝔩 split in M; any removal of squarefreeness must implement the additional argument of Remark 6.9. The all-residue coefficient condition of §6.1 supplies the revised Hida hypothesis. The conclusion supported by that revised input is dense nonvanishing. The older rank-one cofinite strengthening remains the full `HeckeValues_cofinite_rankOne` target, needing a replacement proof because the printed Theorem 3.1 uses the withdrawn input. The independent self-dual theorem below does not discharge its non-residually-self-dual branch.

**Checks.**
- A nontrivial character with p-power-order values reduces to 1 in residue characteristic p. Twisting a self-dual χ by such a character can destroy exact self-duality while preserving residual self-duality, so Theorem B's hypothesis must be checked separately. For p=5 an order-five Dirichlet character modulo 11, pulled back by the norm from Q(i), has nontrivial square on rational ideles and gives this distinction; this is a test of the residual condition, not an assertion of the theorem's other local hypotheses.
- A character whose restricted avatar has a residue value different from τ_{M/F}ω_F at one idele satisfies the non-residual-self-duality test. Mere nontriviality at some idele of M does not test that restriction.
- On a self-dual sign −1 component the central value is zero. Neither algebraic density nor an infinite collection of twists permits removing the root-sign condition.

### 3h.8a Independent self-dual cofiniteness over CM fields

Use the following independent result at its full CM-field generality. In this subsection p is the **valuation prime** and 𝔩|ℓ is the **conductor-tower prime**; Burungale–He–Tian–Ye use ℓ and 𝔭|p for these respective roles. For M/F CM and an ordinary CM type Σ at p, take an algebraic Hecke character λ with

```text
λ|A_F× · |·|_F = τ_{M/F},
λ∞(z)=∏σ∈Σ σ(z)^(−1−κσ) σ̄(z)^κσ,       κσ≥0.
```

Its central value is L(1,λ), rather than the L(0,χ) convention of 3h.8. Let Γ_𝔩 be the maximal torsion-free anticyclotomic pro-ℓ quotient unramified outside 𝔩, Ξ_𝔩 its finite-order characters, and Ξ⁺_{λ,𝔩} the characters ν with ε(λν)=+1. Choose the complex periods Ω∞ from a common CM differential integral and nonvanishing at p. Define `selfDualHeckeAlgebraicValue λ ν`, using the algebraic embedding into C_p, by

```text
[OM×:OF×] · (∏w∈Σp G((λν)_w))
 × π^(Σκσ) (∏σ∈Σ Γ(1+κσ)) L(1,λν)
 / ∏σ∈Σ Ω∞,σ^(1+2κσ).
```

For conductor exponent e>0 the local multiplier is

```text
G(η_w)=|ϖ_w|^e Σu∈ϖ_w^(−e)(OMw/ϖ_w^e)× η_w(u)ψ_w(u),
```

where ψ_w has conductor OMw; put G=1 in the unramified case. Uniformizers, additive characters and the CM differential are fixed data. Supply `selfDualHeckeAlgebraicValue_algebraic`, `selfDualHeckeAlgebraicValue_periodChange` and `selfDualHeckeAlgebraicValue_gauss`. Algebraicity permits transporting the **normalized value**, not π or a complex period separately. The normalization is Burungale–He–Tian–Ye, version 2, §1.2.1, equations (1.1)–(1.2), pp. 2–3.

**Checks.**
- κσ=0 gives Γ(1)=1 and period exponent 1 at σ; κσ=1 gives Γ(2)=1 and exponent 3. Multiplying the differential by an algebraic p-unit a changes these factors by a⁻¹ and a⁻³. A zero differential is excluded.
- A ramified local character of conductor exponent e=1 uses ϖ⁻¹ and the multiplier |ϖ|; e=2 uses ϖ⁻² and |ϖ|². The multiplicative conductor idele with positive exponents is not the argument of this Gauss sum.
- ν=1 is an allowed finite-order character but can be a root-sign −1 or exceptional specialization. The cofinite theorem does not assert a unit value there. Γ_𝔩 is torsion-free only after the stated quotient; no claim is made for every torsion branch of the full ray group.
- A nonordinary CM type or a negative κσ is outside this normalization's hypotheses. In particular p inert in an imaginary quadratic M cannot be supplied with this ordinary CM datum.

Prove `selfDualHeckeValues_cofinite_rankOne`: assume p∤2D_F, Σ is p-ordinary, and, if ε(λ)=−1, also p≠3. Let [F_𝔩:Q_ℓ]=1 and 𝔩∤p N_{M/F}(Cond λ)⁻, where the superscript minus retains the nonsplit part of the conductor norm. Then, for all but finitely many ν∈Ξ⁺_{λ,𝔩},

```text
v_p(selfDualHeckeAlgebraicValue λ ν)
 = Σv|N_{M/F}(Cond λ), v inert in M μ_p(λ_v),
μ_p(λ_v)=inf_{x∈M_v×} v_p(λ_v(x)−1),     v_p(p)=1.
```

This is Theorem 5.7, pp. 37–38, of Burungale–He–Tian–Ye, *Mod ℓ non-vanishing of self-dual Hecke L-values over CM fields and applications*, version 2 dated 13 March 2026. Use that theorem, whose p=3 range is wider than the introductory Theorem 1.4. Its proof uses the integral CM/quaternionic period valuation in Theorem 5.6, pp. 36–37, and the two-factor valuation argument of Proposition 5.5, pp. 35–36, after toric nonvanishing in Theorem 4.15, pp. 28–31, and Theorem 4.19, p. 33. Theorem 5.6 has **twice** the displayed sum for the squared period ratio; its factor 2 must survive when applying the product formula. Local defects are normalized-character defects, not valuations of an arbitrarily rescaled test vector.

The additional source-specific targets `cmShimuraSet_nonEisenstein` and `cmShimuraSet_toricCofinite` must supply the primitive integral CM test vector, its non-Eisenstein reduction on the relevant norm component, and eventual nonvanishing of its toric sums at every permitted conductor level. Proposition 4.5, pp. 22–23, is the finite-field CM-translate independence input; Theorem 4.1 and Lemma 4.2, pp. 21–22, provide its arithmetic equidistribution and separation hypotheses. A constant function on the Shimura set is Eisenstein and fails the input. The generic homogeneous-dynamics theorem behind this equidistribution is an additional supplier requirement, not supplied by ordinary-tower density in 3h.6. This proof route does not invoke the withdrawn Hida cofinite implication: the corrected infinite nonvanishing input suffices for the auxiliary period argument, while eventual nonvanishing at the specified tower prime comes from the Shimura-set argument.

**Checks.**
- With every inert local defect zero the conclusion is v_p=0; a positive sum predicts that exact positive valuation, rather than a unit. The zero value has valuation ∞ and cannot satisfy the finite equality.
- For 𝔩 split in M and ε(λ)=+1, Lemma 4.12, pp. 26–27, makes Ξ⁺ cofinite in Ξ. At an inert 𝔩 the admissible root sign can select one conductor parity, so the conclusion remains cofinite **inside Ξ⁺**, not inside all characters.
- The theorem excludes valuation prime 2. It allows valuation prime 3 on the ε(λ)=+1 branch; it excludes 3 when ε(λ)=−1. It imposes no blanket oddness condition on the tower prime ℓ. Degree-one and the stated nonsplit-conductor exclusion still apply when ℓ=2.
- A split 𝔩 dividing the split conductor part is not excluded by the minus-conductor condition. No squarefree condition on the ramified conductor is added. A prime with [F_𝔩:Q_ℓ]>1 fails the rank-one hypothesis.
- The associated theta representation is automorphically induced from M; its Galois representation restricted to G_M splits into two characters. It therefore cannot replace the theorem for π with absolutely irreducible residual restriction to G_M in 3h.7.

### 3h.8b Integral conjugation comparison with the L(0) convention

Prove `selfDualHeckeValue_conjugationComparison` for a self-dual χ in Hsieh's convention, χ|A_F×=τ_{M/F}|·|_F, with p>2 unramified in F, ordinary Σ, conductor C prime to p, and nonnegative κ. Restriction at the positive real places forces k=1 in Hsieh's infinity type kΣ+κ(1−c). Put λ=χ⁻¹. Take a finite-order anticyclotomic ν trivial on A_F×, unramified outside 𝔩 with 𝔩∤pC. Use the same CM abelian scheme, algebraic differential ω nonvanishing integrally at p, and complex uniformization C^Σ/Σ(a) for the two period tuples: Ω∞,σ=ωσ/dzσ for the coordinate differential dzσ. Hida–Tilouine (4.4a,b), p. 211, and Katz (5.1.45)–(5.1.48), p. 269, use this convention; no extra 2πi occurs in dzσ. Hsieh §5.1, equation (5.2), p. 18, identifies his tuple with these periods; Burungale–He–Tian–Ye §1.2.1, p. 3, uses the CM period of such a differential. The equality below is with that common choice, not with independently rescaled periods.

The character restriction and τ_{M/F}∘N_{M/F}=1 give the identities

```text
χχ^c=|·|_M,       (χν)^c=(χν)⁻¹|·|_M,
L(s,χ⁻¹ν⁻¹)=L(s−1,(χν)^c)=L(s−1,χν).
```

The first L-function equality is the norm-twist identity at every finite Euler factor; the second permutes conjugate primes. Meromorphic continuation preserves the equality. Thus L(1,λν⁻¹)=L(0,χν) without an epsilon or conductor multiplier. Here ν denotes the complex Hecke character: apply the same arithmetic-avatar conversion to both sides, in addition to the displayed inversion of the twist. The unitary characters λ|·|_M^(1/2) and (χ|·|_M^(−1/2))^c also coincide. Conjugation preserves their global root number for the trace additive character, so Hsieh's root-sign +1 condition gives ε(λ)=+1. Local L-factor, norm-twist and root-number functoriality are consumed from the suppliers specified above; a new global functional equation is not needed for this comparison.

Write Aχ(ν) for Hsieh's depleted algebraic value

```text
Aχ(ν)=π^(Σκσ) (∏σ∈Σ Γ(1+κσ)) L^(𝔩)(0,χν)
       / ∏σ∈Σ Ω∞,σ^(1+2κσ),
E𝔩(χν,0)=∏w|𝔩, (χν)_w unramified (1−(χν)_w(ϖ_w)),
I_M=[OM×:OF×].
```

Use the empty product 1 for ramified local factors. Both λ and ν are unramified at every w|p, so all selected p-Gauss factors in `selfDualHeckeAlgebraicValue λ (ν⁻¹)` are 1. Both gamma products and all CM-period exponents agree. Consequently the exact identity, without dividing the depletion factor, is

```text
E𝔩(χν,0) · selfDualHeckeAlgebraicValue λ (ν⁻¹) = I_M · Aχ(ν).
```

The index I_M is a p-unit. Indeed u↦u/c(u) identifies the quotient of CM units by real units with a subgroup of the roots of unity. Every prime of M over p is unramified over Z, because p is unramified in F and splits in M/F. The supplied reduction theorem makes the root-of-unity order divide p^f−1 for such a prime. Thus p divides neither that order nor I_M. In particular the Hasse unit index 1 or 2 cannot be substituted for I_M. At a nonsplit conductor prime v away from p, self-duality makes χ_v take p-unit values, including on a uniformizer: a suitable power of that uniformizer comes from F_v× and the remaining unit has finite-order character value. Hence

```text
v_p(χ_v(x)⁻¹−1)=v_p(χ_v(x)−1),
μ_p(χ_v⁻¹)=μ_p(χ_v).
```

If 𝔩 is split and ν is ramified there, both local components are ramified, E𝔩=1, and the two displayed algebraic values have equal p-adic valuation. For the cofinite consequence assume additionally W(χ|·|_M^(−1/2))=+1, that 𝔩 splits in M, and [F_𝔩:Q_ℓ]=1. On the torsion-free tower of 3h.8a, only finitely many characters are unramified at 𝔩. Apply Theorem 5.7 to λ and invert ν. Since ε(λ)=+1, Lemma 4.12, pp. 26–27, makes its root-sign set cofinite. This proves the additional target `selfDualHeckeValues_LZero_cofinite_rankOne` on that tower: if all inert local defects vanish, Aχ(ν) is a p-unit for all but finitely many ν; more generally its eventual valuation is the inert-defect sum in 3h.8a. The ramified conductor part need not be squarefree for this application of Theorem 5.7. Hsieh's depleted normalization is on p. 1 and his self-dual setting is Theorem A, p. 2; the comparison follows from these definitions and the Euler-factor identities just computed.

Keep the finite-branch requirement in `selfDualHeckeValues_finiteBranchTransfer`. Hsieh §3.5.1, p. 9, uses the ring-class limit with finite-level quotient M×A_F×\A_M×/U_n; its finite characters are trivial on the included A_F×. For its maximal pro-ℓ quotient G, retain the finite torsion subgroup Δ and choose a splitting G≃Δ×Γ before writing a character as ρν. For each finite branch ρ, apply the comparison to χρ and apply 3h.8a to (χρ)⁻¹ only after checking its self-duality, root-sign set, conductor and local defects. Prove the resulting finite union assertion when all branches meet the required unit-valuation conditions. The equality of normalizations holds branchwise; a theorem for Γ alone does not establish cofiniteness on G. In particular the quotient defined only by conjugate inversion in 5.1 must not silently replace this quotient by A_F× at ℓ=2.

**Checks.**
- At a split prime of norm 5, take λ-values α=−1+2i and ᾱ=−1−2i, as for the CM elliptic curve y²=x³−x over Q(i). For χ=λ⁻¹, the two local reciprocal factors at s=0 multiply to 8/5, while for λ at s=1 they are the same two factors in reverse order; both local L-factors are 5/8. Omitting the shift and evaluating λ at s=0 instead gives 1/8. Twisting the local pair by (−1,−1) gives 5/4 on both correctly shifted sides; this tests the local identity, not membership of that twist in a chosen global tower.
- For Q(i), the full unit index is 4/2=2 although the Hasse unit index is 1. At the ordinary prime p=5 it is a unit. For Q(ζ₃) at p=3, the full index is 6/2=3 and is not a unit; that prime is ramified and fails ordinarity. The unramified ordinary hypothesis is essential to the valuation comparison.
- For the same CM elliptic curve at the split prime 29, the trace is −10 and E₂₉(χ,0)=(29+1−(−10))/29=40/29. At the ordinary valuation prime p=5 this nonzero factor has valuation 1, so primitive and depleted values need not have equal valuation at ν=1. At sufficiently ramified specializations E𝔩=1. In this self-dual critical setting the unramified χν-values have complex absolute value N(w)^(−1/2), so an input equal to 1 would violate purity; exceptional Euler zeros in other comparisons are not asserted to occur here.
- Scaling the common differential by a∈M× changes both algebraic values by the same ∏σ σ(a)^(−1−2κσ). Scaling just one period tuple requires that explicit additional factor. A zero differential is excluded, and an algebraic nonunit scale does not preserve p-unit conclusions.
- A character of G nontrivial on Δ is absent from the torsion-free quotient. For G=Z_ℓ×Z/ℓZ there are ℓ branches, so a cofinite theorem on the trivial branch alone leaves infinitely many untested characters. A split-prime character with [F_𝔩:Q_ℓ]>1 does not satisfy the rank-one conclusion; p=2 is excluded, while p=3 is allowed when the root sign is +1.

The non-residually-self-dual branch remains separate: Wei He's Theorem 1.5, pp. 2–3, in version 2 of *Stability of p-adic valuations of Hecke L-values* gives algebraic density; Burungale–He–Tian–Ye Theorem 6.1, p. 38, uses infinite nonvanishing. Neither supplies cofinite nonvanishing in that branch. The full targets in 3h.7–3h.8 therefore still require independent general cofinite arguments; the conjugation comparison supplies the integral normalization and the self-dual torsion-free case.

### 3h.9 Finis' divisibility theorem

Keep the independent imaginary-quadratic theorem of Finis at its stated strength. Fix an imaginary quadratic K, an odd split conductor prime p, an odd valuation prime ℓ≠p, positive k,d, and a CM differential integral and nonvanishing at ℓ. Characters λ satisfy λ=λ*, λ*(x)=λ(̅x)⁻¹|x|, infinity type (−k,k−1), conductor dividing dD_Kp^∞ and root sign +1. Define the local unit defect μ_ℓ(λ_q) at an inert ramified q by min_{u∈O_{K_q}×}v_ℓ(λ_q(u)−1), with value zero when unramified. Construct `finisThetaSpace r a ν` for r>0, ν≥0, and a fractional ideal a with rN(a) integral. It consists of holomorphic V_ν-valued functions on C with the quasiperiod law of Finis §2, equation (3), p. 771: translation by l∈a multiplies by the specified semicharacter, the exponential e^{−2πirδ̅l(w+l/2)}, and e^{δ̅lN}, where N is the normalized nilpotent of order ν+1. Its dimension is rD_KN(a)(ν+1). Define the translation operators A_l, their projective composition law, the trace maps for superlattices, the primitive intersection of their kernels, the norm-class family V_{d,C;ν}, and the Shintani ideal operators. Supply `thetaSpace_quasiperiod`, `thetaSpace_dimension`, `translation_comp`, `primitive_trace_zero`, `shintani_localFactorisation` and the character-eigenspace decomposition of §2, pp. 771–781. Define `integralThetaEigenlattice` using the CM elliptic model and its ℓ-integral nonvanishing differential, for scalar ν=0 in §3, pp. 781–788; supply `arithmeticTheta`, `integralTheta`, `arithmeticPairing`, `pairing_bounded` and `shintani_integral` with the source's prime-to-ℓ hypotheses. The conjugate-ideal pairing is bilinear after the arithmetic normalization; it is not an unspecified Hermitian norm.

**Checks.**
- ν=0 kills the nilpotent correction and gives ordinary scalar theta functions of dimension rD_KN(a); ν=1 doubles that dimension.
- Translation by a lattice vector gives the prescribed scalar action. A general holomorphic function without that quasiperiod law is not an element, although the zero function is.
- The primitive subspace is killed by every proper-superlattice trace, rather than invariant under those traces. If there is no proper admissible superlattice, the intersection is the whole theta space.
- A normalized integral eigenvector can be rescaled by an ℓ-unit and remain normalized; multiplication by ℓ gives an integral vector that is no longer normalized. The period is nonzero and the eigenlattice is saturated.

Define `finisLocalCorrection ℓ λℓ w` using the **negative** minimum valuation of D_K^{1/4} times the theta pairing on the two integral λ_ℓ-eigenlattices, for a positive r representing the norm-sign class w; prove independence of the auxiliary ideal and of r modulo N(K×). Supply `localCorrection_pairing`, `localCorrection_normClass`, `localCorrection_unramified` and `localCorrection_minimalConductor`. This is Finis equation (14), §3, pp. 788–789, with the local theta spaces and Shintani operators constructed in §2, pp. 772–783. The local theta carrier is an explicit additional target here; the general Heegner or metaplectic roadmaps are not prerequisites.

**Checks.**
- At split ℓ the correction is zero. At inert unramified λ_ℓ, and at ramified ℓ with minimal conductor, the stated correction is zero.
- Multiplying the norm-sign representative r by N(α) does not change the correction; an arbitrary sign vector not in the specified global product-one class is not valid input.
- Rescaling the integral theta lattice by a nonunit changes the raw pairing valuation, so the definition must use the specified normalized eigenlattice rather than any complex eigenline.

Prove `finis_divisibility`: if ℓ splits, for all but finitely many such λ,

```text
vℓ( Ω∞^(1−2k)(k−1)!(2π/√D_K)^(k−1) Wℓ(λ)L(0,λ) )
 = Σ_{q inert} μℓ(λ_q).
```

Here W_ℓ(λ)=N(l)^{-e(l)}G(δ,λ_l) is the normalized local Gauss factor at the selected ℓ-prime. If ℓ is nonsplit, the theorem's k=1 case gives

```text
vℓ( Ω∞^(-1)D_K^(1/4)L(0,λ) )
 = Σ_{q≠ℓ inert} μℓ(λ_q)+bℓ(λℓ,w(λ))
```

for all but finitely many λ. The universal lower bound has the exception K=Q(√−3), ℓ=3 stated in Theorem 1.1; do not delete that exception. Finis Theorem 1.1, pp. 769–770, is the source. Its theta-function proof is independent of the withdrawn Hida cofinite argument. Vatsal's toric nonvanishing provides context for comparisons, not a substitute for Finis' exact correction term.

### 3h.10 The rational BDP dictionary

Prove `hsieh_BDPComparison` for F=Q and n⁻=1 with all common hypotheses. The character conversion in Hsieh's introduction, p. 712, is φ̂↦λ⁻¹φ⁻¹|·|^{−k/2}; the norm exponent is negative. Compare the **square** of Hsieh's root measure with the central-value BDP normalization, then compare square roots only after fixing their sign and integral CM sum. CGLS §2.1.1, Theorem 2.1.1, pp. 12–13, gives the weight-two convention: for a crystalline anticyclotomic ξ of type (n,−n), n>0 and n≡0 mod p−1, its interpolation includes the square of 1−a_pξ(̅v)p⁻¹+ξ(̅v)²p⁻¹, the period power Ω_p^{4n}/Ω_∞^{4n}, the gamma product Γ(n)Γ(n+1), and the ideal factor ξ(N⁻¹). Supply a `BDP_normalisationDictionary` identifying each of these with the toric formula before asserting equality. A central-value measure is not equated with a square-root measure solely because their names are similar.

### Examples

An anticyclotomic measure can have μ=0 and a zero at the trivial character, just as 1−[γ] does. A square-root sign change has no effect on the central-value square. An ordinary CM type does not imply that π is ordinary. Finally, a dense set of good characters in a one-dimensional character family need not be cofinite. These four controls separate integrality, scalar nonvanishing, ordinarity and geometric density, which require different theorems.

### Dependencies

Layers 0–3, the PadicFamilies ordinary Hilbert/CM contracts, local GL₂ representation theory and Whittaker models, supplied central L-functions and local constants. The Galois representation in the residual-irreducibility theorem is explicit compatible input. The CM density and theta-function targets in this layer have their own stated hypotheses; no general height, main-conjecture, metaplectic or modularity-lifting roadmap is imported.

## Layer 4: unitary doubling measures

### 4.1 The unitary doubling datum

Define `unitaryDoublingDatum` for a CM extension K/K⁺, a hermitian K-space V of dimension n≥1 and arbitrary signatures (a_σ,b_σ), and the doubled space W=V⊕(−V). Use the similitude group G₁=GU(V), G₂=GU(−V), the equal-multiplier fibre product G₃=G₁×_{G_m}G₂ and G₄=GU(W). Supply `doubling`, `doubling_shimura`, `IsOrdinaryOfType` and `negSpace_shimura`. The embedding G₃→G₄ respects the chosen polarizations and reflex data. Require p unramified in K and every K⁺-prime above p split in K. The PEL and automorphic-bundle structures are supplied; this datum specializes them to the doubling correspondence of EHLS §2, pp. 12–29.

**Checks.**
- For n=1 the two similitude multipliers must still agree; the domain is not the unrestricted product of two similitude groups.
- A signature (n,0) is allowed, but is not the only signature. Replacing −V by V changes the archimedean holomorphic/antiholomorphic pairing.
- A p-prime inert in K/K⁺ fails this split-local construction. Its general local representation theory remains supplied elsewhere, but this interpolation theorem does not claim that case.
- n=0 is excluded from the cuspidal doubling construction; the trivial group does not become a rank-zero standard L-function by this datum.

### 4.2 Ordinary lattices, Hecke algebras and congruence data

Construct `ordinaryUnitaryLattice` by verifying the ordinary-family supplier's control hypotheses for the EHLS p-level tower, weight κ and coefficient ring R. Retain the ordinary projector, integral cusp-form module, its completed localization at π, dual module and local test-vector lattice. Supply `ordinaryProjector`, `ordinaryHeckeAlgebra`, the finite-freeness conclusion under the source's control assumptions, `congruenceIdeal`, `testVectorLattice` and `ordinary_control`. EHLS §§6–7, pp. 90–121, supplies these specific lattices and pairings. A finite Hecke algebra over a weight algebra is not automatically free merely by being ordinary; use the actual control and finite-freeness hypotheses.

**Checks.**
- Applying the ordinary projector twice is the same projector; a positive-slope eigenspace is killed, rather than retained as an ordinary vector.
- At a classical arithmetic weight satisfying control, specialization recovers the source's ordinary cuspidal lattice with the specified tame level and type.
- Multiplication of a primitive basis vector by p does not give another basis. It changes its pairing and the integral congruence normalization.
- The zero localized cusp module does not have the rank-one primitive eigenline required by the main theorem.

Define `ehlsHypotheses` as three separate propositions with their actual modules: Gorenstein duality requires Hom_R(T,R) free of rank one over T and the paired ordinary module duals of the indicated rank; global multiplicity one says every π′ in the localized classical family occurs once in the cuspidal spectrum; minimality gives T_{r,κ,π}⊗_O Î_π ≃ Hom_O(S_κ^ord(K_r,O)_{m_π},O), compatibly with level transition and specialization at π. The same condition is imposed on the paired dual family, with Î_{π♭}=I_π. The rank of the free ordinary module dual is its finite test-vector rank; only the Hecke-algebra dual is required to have rank one. Supply `Gorenstein`, `GlobalMultiplicityOne`, `Minimality`, `Gorenstein_iff_dual_free` and the source's openness result under its finite-flat hypotheses. These are Hypotheses 7.3.2–7.3.3 and Proposition–Hypothesis 7.3.5, pp. 110–112. Do not replace any of them by a Boolean tag on π.

**Checks.**
- A rank-one dual with a chosen generator supplies the Gorenstein trivialization; changing that generator by a unit changes the final normalization by the matching unit.
- A non-Gorenstein finite-flat local algebra fails the first predicate even if it is an ordinary Hecke algebra.
- A correct generic-fibre multiplicity calculation does not imply integral minimality: a proper finite-index sublattice is a negative control.
- The hypotheses are propositions about existing lattices; defining the conjunction produces neither a cusp form nor an L-function.

### 4.3 Differential operators and the Eisenstein measure

Construct `unitaryDifferentialOperator` from the supplied Gauss–Manin connection, automorphic bundles and ordinary unit-root splitting; construct its C^∞ counterpart using the Hodge splitting. For a character χ=|·|^mχ₀ with χ₀,σ(z)=z^{-a(χσ)}̅z^{-b(χσ)}, the permitted highest weights have form

```text
κσ=(−m+b(χσ)−r_a,...,−m+b(χσ)−r_1;
       m−a(χσ)+s_1,...,m−a(χσ)+s_b),
r_1≥...≥r_a≥0,   s_1≥...≥s_b≥0.
```

Set ρ_σ=(−r_a,...,−r_1;s_1,...,s_b) and ρ_σ^υ=(r_1,...,r_a;s_1,...,s_b). The arithmetic pair lies in Y_H^class, defined by κ_σ∈C₃(μ,χ₀,σ) at every σ in (110), together with (94)–(95), as required by Remark 8.2.5. Retain the right-half-plane condition on m for the source's holomorphic module; the direct integral comparison in Proposition 9.1.7, p. 143, uses m≥n. An arbitrary integral m does not meet these conditions merely because χ is algebraic. Supply `padic`, `cInfty`, `qExpansion`, `compare` and `torus`, with the target bundle and highest-weight projection specified. EHLS §4.4, (94)–(98), pp. 69–71, §5.3.1, (110), p. 83, and §8.1, pp. 122–124, supply the operators and critical-pair definition. Comparison is after algebraic period normalization, not literal equality between complex and p-adic analytic functions.

**Checks.**
- With every r_i,s_i zero the operator has the scalar critical weight; it does not introduce a positive differential order.
- Reversing the r-block changes κ: r=(2,1) gives first block (−m+b−1,−m+b−2), fixing the order relative to the dual convention.
- A negative r_i or s_i is not an allowed highest-weight polynomial differential operator in this interpolation range.
- At a nonordinary point the unit-root version is not defined by the same splitting; only the complex/Hodge construction remains available.

Construct `ehlsEisensteinMeasure` on X_p×T_H(Z_p), where X_p is the **profinite ray Galois group**, not its character space. Its values lie in the supplied p-adic forms on the doubled unitary group. At a classical pair χ and ρ^υ its moment is the algebraically normalized differential Eisenstein series θ^{κ,a,b}G. Supply `eisensteinMeasure`, `moment`, `axiomatic` and `restrict`, with coefficientwise boundedness and descent from integral q-expansions. EHLS Theorem 8.2.2, pp. 125–126, is the source. The arithmetic weights and torus variables are retained until the ordinary cuspidal pairing is applied.

**Checks.**
- The zero differential order recovers the scalar Eisenstein moment with its specified local sections.
- The moment at a product of characters is evaluated on the product group; replacing X_p by its character set would give an ill-typed measure domain.
- A Fourier coefficient integral at all finite quotients gives the corresponding bounded coefficient measure; algebraic special values alone do not prove boundedness.
- Restricting a character from the product to one factor matches pushforward along that projection, not restriction of the measure to an arbitrary subset of the character space.

### 4.4 The global identity and p-local factors

Prove `doubling_globalIdentity` first in its convergent range and then meromorphically:

```text
D(χ) I(φ,φ♭,f,s)
 = ⟨φ,φ♭⟩ I_p I_∞ I_S L^S(s+1/2,π,χ_u).
```

The scalar D(χ), the unramified normalizing product and local sections are those fixed in EHLS §4.1 and Theorem 4.6.1, pp. 77–79. At places outside S∪{p,∞}, the normalized spherical local integral is 1; at S the local integral is retained as I_S, not assumed a p-unit without the source's choice of vectors. The equality is an identity of meromorphic functions, so division at a pole requires a separate specialization argument. No global Hecke functional equation by adelic Poisson summation is reproved.

Prove `ehls_localZeta_p` for the ordinary vectors and the split local Siegel section of §4.3. Let π_a,π_b be the GL_a and GL_b constituents from the ordinary flag and χ₁,χ₂ the two local characters. The two factors are

```text
I₁ = L(s+1/2,π_b⊗χ₂)
     /[ε(s+1/2,π_b⊗χ₂)L(−s+1/2,π̃_b⊗χ₂⁻¹)]
     ×Vol(X(4))⟨φ_b,φ̃_b⟩,
I₂ = ε(−s+1/2,π_a⊗χ₁)L(s+1/2,π̃_a⊗χ₁⁻¹)
     /L(−s+1/2,π_a⊗χ₁)
     ×Vol(X(1))⟨φ_a,φ̃_a⟩.
```

Their product is the modified ordinary Euler factor times the combined volume and pairing. EHLS Theorem 4.3.10, pp. 64–65, is the source. The proof applies the supplied Godement–Jacquet local functional equation to the explicitly supported matrix Schwartz functions; their transforms have support X(4) and X(1). The subgroups and volumes are part of the definition of the section. Rank-zero blocks are interpreted by the trivial GL₀ factor equal to 1, so definite signatures cause no artificial division by a missing local L-function. Epsilon factors are nonzero; L-factor quotients are meromorphic expressions and are specialized only in the source's critical regular range.

Prove `ehls_archimedeanZeta`: for the permitted critical pair, compatible rational highest-weight vectors and normalized holomorphic section, the archimedean integral I_∞ is nonzero and algebraic after the prescribed powers of 2πi and rational structures. EHLS Propositions 4.5.5–4.5.6, pp. 76–77, supply this result. This target does not assert a closed formula for every signature, and it does not turn an arbitrary section's archimedean integral into a nonzero value. Changing a highest-weight vector by a nonzero algebraic scalar changes that integral by the same scalar; the zero section gives zero and is not an allowed normalized section.

### 4.5 The ordinary unitary L-function

Prove `ehls_mainTheorem`: for the cuspidal antiholomorphic π ordinary of the specified type, the three hypotheses of 4.2, and primitive R-bases φ,φ♭ of the paired localized modules, there is a unique element

```text
L(Eis,φ⊗φ♭) ∈ Λ_{X_p,R} ⊗̂ T_π
```

whose specialization at a classical pair (χ=|·|^mχ_u,ψρ^υ)∈Y_H^class, with κ,ρ,ρ^υ related as in 4.3, and classical π' on that ordinary component is

```text
c(π',χ) Ω_{π',χ}(φ,φ♭) I_∞(χ,κ') I_S
 × L_p(m,ord,π',χ_u) L^S(m+1/2,π',χ_u) / P_{π',χ}.
```

Here c(π',χ) generates the specified congruence ideal, P_{π',χ}=Q_{π',χ}^{−1}, and

```text
Ω_{π',χ}(φ,φ♭)=⟨φ,φ♭_χ⟩_χ
 /[Vol(I^0_{r,V}∩I^0_{r,−V}) Q[π',χ]].
```

This factor is independent of r, p-integral and a p-unit for the appropriate primitive choices. The period Q[π',χ] and the volume are nonzero. The congruence factor can carry valuation and is not suppressed into an unspecified unit. EHLS Main Theorem 9.2.2, pp. 144–145, is the source. Its proof pairs the Eisenstein measure, uses the three integral module hypotheses, then applies 4.4. Uniqueness is in the finite ordinary Hecke family, using density and control, not uniqueness of an arbitrary unbounded function from isolated values.

Without Gorensteinness, retain the different target `ehls_meromorphicComponents` in the fraction fields of the irreducible Hecke components, with the same regular classical specializations. EHLS Remark 9.3.1, p. 145, supplies this conclusion. It does not give an integral element of the completed tensor product. At n=1 compare with Katz only after identifying all local sections and CM period normalizations; the general historical extension statement is not a proof of a canonical integral equality.

### 4.6 Hermitian Siegel data and the analytic Eisenstein family

Define `hermitianSiegelDatum m K` for m≥1 using Disegni–Liu's skew-hermitian space W_m=E^{2m}, its unitary group and the automorphic line bundle ω_m on Σ_m(K). Include the auxiliary δ, the reflex/descent data and the chosen connected components. Supply `SiegelHermitian`, `lineBundle_independent`, `toPEL` and `qExpansion`. The `toPEL` comparison is with the supplied PEL moduli space and carries the line bundle and level, rather than redefining a generic Shimura variety. Disegni–Liu §2.2, pp. 11–17, is the source.

**Checks.**
- Changing the auxiliary δ by an allowed positive norm gives the comparison of line bundles and q-expansion trivializations, rather than literal equality of models.
- At m=1 the bundle is the rank-one determinant of invariant differentials in the source convention.
- A level change pulls the line bundle back compatibly; dropping the component label can merge distinct q-expansion charts and is rejected.
- m=0 is outside the Eisenstein construction used below; no rank-zero holomorphic discrete series is inferred.

Construct `bigCellSection χ e` in the source's degenerate principal series, supported on the big cell and defined by its regularized Whittaker functional. Supply `degeneratePrincipalSeries`, `bigCellSection`, `invariant` under the stated subgroup P̃_e, and `up`:

```text
(U^{e₁}×U^{e₂}) f^[e]_χ = f^[e+e₁^c+e₂]_χ.
```

Here e ranges over the source's integral exponent lattice and e₁,e₂ over its positive cone; c interchanges the conjugate p-places. Disegni–Liu Lemmas 3.10–3.11, pp. 21–23, are the source.

**Checks.**
- e₁=e₂=0 leaves the section unchanged.
- If e₁ increases just one p-place by 1, its contribution appears at the conjugate place in the new exponent; increasing e₂ instead appears at that same place without conjugation.
- The support condition is on the big cell; a function supported on its complement is not this section even if it has the same invariance subgroup.
- A section at one level becomes invariant under the predicted smaller congruence subgroup after a positive translation, not an arbitrarily larger group.

Prove `DL_eisensteinFamily_rational`: for ||e||>0 and the source's away-from-p section, the analytic Eisenstein family and its diagonal pullback to Σ_r×Σ_r are rational over the indicated number field and equivariant under Aut(C/Q), with the prescribed automorphic line bundle and Fourier normalization. This is Disegni–Liu Proposition 3.13, pp. 24–25. The positive-depth condition is retained; the zero-depth case is not obtained by substituting e=0 into its proof. The general bundle and q-expansion principles are suppliers, while this rationality statement for the normalized family is a target here.

### 4.7 Panchishkin unramified local representations

For n=2r, r≥1, define `panchishkinUnramified π_v` for a relevant representation as follows. At each u above v the local representation is unramified and its normalized Satake polynomial is

```text
P_u(T)=T^n+Σ_{s=1}^n β_{u,s}q_v^{s(s−1)/2}T^{n−s},
```

with every β_{u,s} in O_L and β_{u,r} an O_L-unit. Relevance means that after every embedding L→C, π extends with the holomorphic discrete series whose Harish–Chandra parameter is ((n−1)/2,(n−3)/2,...,1/2;−1/2,...,−(n−1)/2), and is tempered cuspidal. Supply `satakePolynomial`, `IsUnramified`, `unitRoot`, `eigenline`, `unitFactor`, `matrixCoefficient`, `unitPrincipalSeries` and `dual`. This is the unitary source-specific local condition, rather than the generic motivic Panchishkin proposition already owned by SelmerIwasawaCohomology. Disegni–Liu Definitions 1.1–1.2, p. 3, and Definitions 3.18 and 3.21, pp. 27–28, fix the normalizations.

Prove uniqueness of the unit eigenvalue of the appropriate r-th Hecke multiset and of the one-dimensional ± eigenlines. Prove existence and uniqueness of the factor

```text
Q_u(T)=T^r+Σ_{s=1}^r γ_{u,s}q_v^{s(s−1)/2}T^{r−s},
γ_{u,r}∈O_L×,
```

dividing P_u, and construct the spherical GL_r principal series π̲_u with that polynomial. The normalized matrix coefficient ξ has ξ(w_r)=1 and the formula at m(a)w_r given by the product of the spherical π̲_u pairings. Lemmas 3.22–3.23 and Proposition 3.25, pp. 28–29, supply these conclusions. It is the normalized middle coefficient β_{u,r} that is a unit; Q_u need not have all its raw Satake roots units. Its constant term contains q_v^{r(r−1)/2}.

**Checks.**
- At r=1 the selected factor is T+γ₁ with γ₁ a unit, recovering the ordinary unit-root selection.
- At r=2 the factor constant term is γ₂q_v. Requiring that raw constant term itself be a unit would wrongly reject every such example when q_v is divisible by p.
- Conjugating u to u^c preserves the Panchishkin condition and exchanges the corresponding dual data, rather than choosing two unrelated roots.
- A ramified representation is excluded. An unramified one with β_{u,r} in the maximal ideal also fails; unramified alone does not imply the condition.

### 4.8 The local integral and bounded measure

Prove `DL_localDoubling_p` for the big-cell section and normalized Panchishkin matrix coefficient:

```text
Z_v=q_v^(d_v r²) ∏_{u|v} γ((1+r)/2,π̲_u⊗χ_v,ψ_{F,v})⁻¹.
```

Here d_v is the source's different exponent, ψ_F=ψ_Q∘Tr_{F/Q}, and the measure and section use the same different normalization. Disegni–Liu Proposition 3.32, pp. 32–33, is the source. Keep the different factor until it cancels in the global normalization. The gamma factors are the supplied local representation-theoretic factors, interpreted in their regular specialization; no separate Tate-thesis local functional-equation theorem is planned.

Let Γ_{F,p} be the p-completion of the finite-idelic quotient used in Layer 0, and let X_{F,p} be its rigid character space. It need not be one-dimensional without Leopoldt. Prove `DL_padicLFunction`: a relevant L-representation π of U(W_r), Panchishkin unramified at all v|p, and a finite set ⋄ of rational places containing ∞,p and all ramification determine a unique **bounded** measure L_p^⋄(π) such that for every finite-order χ and every embedding ι:Q_p→C,

```text
ι(L_p^⋄(π)(χ))
 = P_{ιπ}⁻¹ Z_r^[F:Q] / b_{2r}^⋄(1)
   ×∏_{v|p}∏_{u|v}γ((1+r)/2,ι(π̲_u⊗χ_v),ψ_{F,v})⁻¹
   ×L(1/2,BC(ιπ^⋄)⊗(ιχ^⋄∘N_{E/F})).
```

The period P_{ιπ} is nonzero and satisfies P_{ιπ}=P_{ιπ̂}, π̂=(π∨)^†, with simultaneous ambiguity in L×. The scalar

```text
Z_r=(−1)^r 2^(−r²−r)π^(r²) Γ(1)...Γ(r)/[Γ(r+1)...Γ(2r)],
b_{2r}^⋄(1)=∏_{i=1}^{2r}L^⋄(i,η_{E/F}^i)
```

uses the source's regular nonzero values. Disegni–Liu Theorem 3.37, pp. 35–37, and Theorem 1.4, pp. 4–5, are the source. The proof uses the translated sections' norm relation, the rational diagonal pullback, p-integrality on the ordinary eigenline and the global doubling computation. Boundedness gives uniqueness from finite-order characters even when the ray dimension exceeds one; this does not contradict the finite-slope limitation in Layer 2. This construction has no additional p>2 restriction beyond the source's stated local and moduli hypotheses; the scalar powers of 2 lie in L, not necessarily in O_L× when p=2.

### 4.9 Functional equation and finite-order parity

Restore the omitted finite Euler factors in the localized measure algebra to form `DL_completedMeasure`; each restored factor has no zero or pole at finite-order characters in the source's setting. Prove

```text
DL_completedMeasure = (−1)^(r[F:Q]) ε_π · inversion_*(DL_completedMeasure).
```

The involution in this identity is **group inversion on Γ_{F,p}**. The auxiliary π̂ comparison is used in its proof but is not the variable involution in the final formula. Disegni–Liu Proposition 3.39 and its proof, pp. 37–38, give this equation. No nonvanishing of the whole analytic function is inferred from the functional equation.

Prove `DL_finiteOrder_parity`: if its analytic germ at 1 is nonzero and has finite vanishing order m, then (−1)^m=(−1)^{r[F:Q]}ε_π. In one variable, (1+T)⁻¹−1=−T+T²−..., so the terms of degrees 1 and 2 have inversion signs −1 and +1 in their leading degree. In several variables inversion acts as −1 on the augmentation cotangent space and as (−1)^m on its m-th graded piece, giving the same statement for least total degree. The identically zero germ has no finite m and is excluded. This condition prevents a parity claim about an undefined order ∞.

### Examples

EHLS admits arbitrary signatures and carries its congruence ideal and three integral Hecke-module hypotheses. Disegni–Liu fixes even rank and a particular holomorphic weight but obtains a bounded measure without the EHLS Gorenstein hypothesis. The two theorems therefore coexist; neither is obtained by deleting hypotheses from the other. At r=1 the archimedean constant Z₁ is −π/4. At r=2 the selected local polynomial has constant term γ₂q_v, illustrating why the normalized coefficient, rather than that constant term, detects the ordinary eigenline.

### Dependencies

Layer 0 and the measure supplier; general unitary PEL moduli, compactifications, ordinary towers, automorphic bundles and cohomological duality; PadicFamilies control; local representation theory and the doubling method in AutomorphicLFunctionsAndLocalFactors. The source-specific sections, local integrals, ordinary lattices, rationality and normalization theorems in this layer are the additional verifications required for its two constructions.

## Layer 4e: finite-slope Klingen families

### 4e.1 The definite unitary datum and refinement

Define `ewSetting` with p odd, K imaginary quadratic split at p, and the definite similitude group GU(r,0), r≥1, attached to the source's diagonal skew-hermitian form prime to p. Let π be irreducible cuspidal and tempered of dominant weight (a₁≥...≥a_r≥0), with unramified π_p=π(χ₁,...,χ_r), the χ_i pairwise distinct. Choose a simultaneous U_{t_i} eigenvector φ, an auxiliary ξ₀ with ξ₀|·|^{−(r−1)/2} finite order, the coefficient representation L(k), integral local sections and a finite set Σ containing p and all ramification. Supply `RegularStabilisation`, `stabilisedEigenvalues`, `Tempered` and `slope`. Finite slope is allowed; the refinement is not required ordinary. Eischen–Wan §1.3, pp. 3–4, §2.2, pp. 5–7, and Propositions 4.7–4.8, pp. 25–26, supply this datum.

**Checks.**
- A positive-slope regular stabilization is allowed. Replacing the eigenvector hypothesis by an ordinary-projector hypothesis loses part of the theorem.
- Two equal inducing characters fail the stated regularity hypothesis; the proof does not canonically choose the same refined eigenspace there.
- r=1 remains a valid scalar-rank datum, while r=0 is excluded from the Klingen construction.
- At p=2 or an inert p the source's local setup is not this datum. No extension to those primes is inferred from the notation Λ_K.

### 4e.2 Siegel measures and the two pullbacks

Construct `ewSiegelMeasure` on Γ_K≃Z_p² with values in the vector-valued p-adic Siegel forms for U(r+1,r+1), and the companion measure for U(r,r). Supply `siegelMeasure`, `siegelMeasure_moment`, `siegelSection` and `siegelMeasure_qExpansion`. Its arithmetic moments are the source's normalized differential Eisenstein series, with κ_φ and differential order determined by the arithmetic point. Eischen–Wan Proposition 5.5, p. 33, is the source. The general distribution and bundle carriers are supplied, while the integral local sections and weight projection are verified here.

**Checks.**
- At scalar weight and zero extra differential degree the moment is the scalar Siegel series with the selected local section.
- The two measures have different unitary ranks; the companion measure is not the same object with the name changed.
- Γ_K has two directions, so specializing only its cyclotomic line does not determine this measure by a one-variable argument.
- A q-expansion coefficient zero for the original local section gives the zero coefficient measure; boundedness is proved by the integral Fourier construction, not by interpolation alone.

Prove `ew_pullbackFormula` with all local factors at p, infinity and Σ. The Klingen pullback embeds U(r+1,1)×U(0,r) into U(r+1,r+1); the L-function pullback embeds U(r,0)×U(0,r) into U(r,r). The source uses the corresponding equal-similitude version for GU. The first is not U(r,0)×U(1,1). Eischen–Wan Proposition 3.4, pp. 21–22, gives absolute convergence for Re(s)>r in the definite pullback and Re(s)>r+1/2 in the Klingen pullback, followed by continuation where required. Its §4, pp. 22–30, supplies the local sections and constants. Use the supplied local Godement–Jacquet/doubling functional equations. Retain the archimedean constants c(k,0,κ), c'(k,0,κ) of Definitions 4.16 and 4.19, p. 29, as the normalized highest-weight local integrals, with their rational structures and dependence on the chosen vectors, before the rank-two comparison in 4e.5.

### 4e.3 The vector-valued Klingen family

Construct `klingenFamily` by pulling the first Siegel measure back and pairing its definite factor against the chosen φ, then taking the source's lowest/highest-weight projection. Supply `klingenMeasure`, `klingenFamily`, `specialise`, `eigen` and `constantTerm`. The output is a formal Fourier–Jacobi expansion at each cusp of GU(r+1,1), with coefficients in Λ_{K,O_L}⊗L(k), whose arithmetic specializations are the normalized vector-valued Klingen Eisenstein series. Prove the nonzero U_{t^+} eigenvalue assertion for the chosen stabilization and the p-adic/C^∞ differential comparison. Eischen–Wan Definition 5.6, pp. 34–35, and Theorem 1.2(ii), p. 4, are the source. The comparison uses the Hodge and unit-root splittings and their restriction to the relevant highest-weight summand; it is not formal equality of two unrelated differential operators.

**Checks.**
- A permitted arithmetic specialization recovers the source's Klingen series and its specified vector, rather than just a scalar constant term.
- Nonzero finite-slope U_{t^+} eigenvalue permits normalization, but need not be a p-adic unit.
- The zero definite input gives the zero family. A nonzero input still needs the source's nonvanishing assertion before declaring a nonzero specialization.
- The Fourier–Jacobi coefficient at β=0 is the constant term studied in 4e.5; the construction retains all β, so equality of constant terms alone is not equality of families.

### 4e.4 The p-adic L-function and its local normalization

Construct the bounded measure `ew_padicLFunction` by the second pullback and the normalized pairing on the definite factor. Eischen–Wan Theorem 1.2(i), p. 4, and §5.4.3, p. 36, give its arithmetic specialization:

```text
φ(L^Σ_{φ₀,ξ₀})
 = C_{φ₀,p} L^Σ(π̃,ξ_φ,0) / Ω_K^(d_φ+rκ_φ)
   ×c'_φ p^(κ_φ r/2−r(r+1)/2) g(τ_{1,φ}⁻¹)^r
   ×∏_{i=1}^r(χ_{i,φ}τ_{1,φ})(p)
   ×∏_{i=1}^r(χ_{i,φ}⁻¹τ_{2,φ})(p)
   ×̅τ_φ^c((p^r,1)).
```

Here φ₀ denotes the fixed stabilized cusp vector to distinguish it from the arithmetic point φ; d_φ=2Σ_i a_{i,φ}. The local product C_{φ₀,p} is the explicit product of the chosen pullback integrals, and c'_φ is the normalized archimedean integral c'(k_φ,0,κ_φ). Supply `ewLocalConstant_eq_product`, `ewArchimedeanConstant_eq_integral` and `ewInterpolation`. The nonzero CM period and primitive local Gauss sum justify their inverses where present; all remaining factors and their valuations are retained. Half-integral powers in the unitary notation are interpreted with the source's fixed coefficient extension and algebraic normalization, not as arbitrary choices of a p-adic square root on the character group. A statement that absorbs the displayed powers and Gauss factors into an unspecified “period” would not specify this construction.

The theorem does not claim an ordinary π, or a unit value at every arithmetic point. Local factors and complex values may vanish. Coefficient extension and change of the primitive test vector must commute with the fixed pairing normalization.

### 4e.5 Constant terms in rank two

For r=2, prove `ew_archimedeanConstants_equal`: in the absolute-convergence arithmetic range, c(k_φ,0,κ_φ)=c'(k_φ,0,κ_φ). The proof in Eischen–Wan Theorem 5.8, pp. 36–37, uses an auxiliary split ordinary prime, its scalar-weight dense family and the comparison of the two archimedean constants. Carry the existence of the source's auxiliary ordinary prime, with its Sato–Tate input, as an explicit mathematical prerequisite; do not silently infer it from the original finite-slope p-refinement. Prove the resulting factorization of the two pullbacks with the Dirichlet factor L^Σ_{̅τ'}.

Then prove `klingen_constantTerm_divisible`: every constant Fourier–Jacobi coefficient of the r=2 family is divisible, in its stated integral Iwasawa coefficient module, by L^Σ_{φ₀,ξ₀}L^Σ_{̅τ'}. Eischen–Wan Corollary 5.9, p. 37, is the source. The Dirichlet factor is supplied by DirichletPadicLFunctions with interpolation

```text
L(̅τ'_φ,κ_φ−r) π^(r−κ_φ) τ'_φ(p⁻¹)
 ×p^(κ_φ−r) g(̅τ'_φ)⁻¹
```

and the source's removed Σ-factors. The divisibility uses the correct algebraic Fourier–Jacobi period; it is an integral factorization theorem, not numerical divisibility of a few special values.

The rank-two hypothesis is retained. For r≥3 this roadmap constructs the Klingen family and its L-function but makes no constant-term divisibility claim from this source. A zero divisor or a zero specialization of one factor does not justify cancelling it from a family identity.

### Examples

For a regular positive-slope π_p the Klingen family still exists, demonstrating the finite-slope scope of this layer. At r=2 the β=0 coefficients carry both the standard L-function factor and the Dirichlet factor; replacing the two-factor product by either factor alone loses the proven constant-term normalization. At r=3 the two pullback constructions continue to have meaning, but the cited theorem does not establish their archimedean-constant comparison.

### Dependencies

Layer 0, the unitary moduli, ordinary tower and automorphic-bundle suppliers, supplied local and global representation theory, and the explicit local computations of this layer. DirichletPadicLFunctions supplies the extra constant-term factor. The auxiliary ordinary-prime theorem is an additional prerequisite of the rank-two constant-term argument, not of the basic finite-slope construction.

## Layer 5: comparison and the analytic existence interface

### 5.1 Functorial evaluation across the constructions

Prove `evaluationPrinciple_instances` by identifying the actual domain and the norm-compatible evaluation in each construction: BSW lives on Cl⁺_F(p^∞); the smoothed Deligne–Ribet measure and its pseudomeasure live on the fixed-tame totally real ray limit; Katz and Hida–Tilouine live on the specified CM ray limit; Hsieh lives on its anticyclotomic torsion-free pro-p quotient; EHLS has the ray group X_p together with its ordinary Hecke coefficient algebra; Disegni–Liu lives on Γ_{F,p}; Eischen–Wan lives on Γ_K. A pseudomeasure is compared only after its allowed localization; it is not an element of D(G,L) on every character. The norm, projection and twist compatibility of Layer 0 gives a common evaluation language without identifying these different groups.

For a conjugation-stable abelian CM ray group G with involution c, define `anticyclotomicRayQuotient` as G divided by the closed image of N_c:g↦g·c(g). Its characters are exactly the characters κ with κ∘c=κ⁻¹; supply `anticyclotomicRayQuotient_lift`, `anticyclotomicCharacter_iff` and `anticyclotomicRayQuotient_map` for equivariant ray maps. This norm image lies in G itself. A field norm to the totally real ray group has a different codomain and must first be followed by the specified idelic inclusion before comparison. Passing from this quotient to the maximal torsion-free pro-p quotient used by Hsieh also removes torsion and fixes a branch. Comparison with the quotient by the entire included base-field ray group requires its own finite 2-primary comparison; it is not part of the character identity. Likewise the EHLS symbol X_p denotes a profinite group; its character space is a different object. The quotient universal property and arithmetic reciprocity give this interface; BSW Theorem 9.10, p. 34, Katz (5.4.2)–(5.4.6), p. 275, and the main construction theorems in Layers 3h–4e supply the construction-specific groups.

**Checks.**
- On additive G=Z_p with c=−1, N_c=0 and the anticyclotomic quotient is all of G. Its characters satisfy κ(−x)=κ(x)⁻¹.
- On additive G=Z_p with c=1, N_c is multiplication by 2. The quotient is zero for odd p, whereas at p=2 it is Z/2Z; the latter disappears only on passing to the torsion-free quotient.
- On G=Z_p×T with c acting by inversion and T finite, the anticyclotomic quotient retains T. Replacing it immediately by Z_p loses its torsion characters and cannot compare all branches.

Prove `periodAndCoefficient_functoriality`: coefficient extension commutes with each construction under its topological and integral hypotheses; changing a chosen linear normalization period by a scales the corresponding measure by a⁻¹. For multiple embedding weights use the actual weight exponent, as in the CM supplier. For a square-root measure, square the scale when comparing central-value measures. Prove `primitiveImprimitive_comparison` by the finite products of `eulerFactorElement`, retaining exceptional zeros and localization requirements.

### 5.2 The supported normalization comparisons

Prove the rational GL₂, Bianchi and conditional Hilbert comparisons of Layer 2; the rational Deligne–Ribet comparison of Layer 3; and the rational toric/BDP dictionary of Layer 3h. Each comparison carries all the hypotheses of both constructions. In the automorphic-induction case of Hsieh's introduction, p. 712, it is the **square** ℒ² that factors as the product of the two Katz–Hida–Tilouine measures up to the explicitly normalized Iwasawa unit. Retain the character twists and both CM period choices in `automorphicInduction_KatzProduct`. A factorization of ℒ itself into that same product would square the wrong interpolation formula.

The n=1 EHLS/Katz comparison is the separate target `unitaryRankOne_KatzComparison`. Retain every EHLS hypothesis from 4.1–4.5, including the three module hypotheses and compatible classical pairs, and every hypothesis of the chosen Katz critical chamber. Its integral statement needs the following dictionary before bounded-measure uniqueness applies. EHLS §1.2, pp. 9–11, describes the specialization but does not prove this integral dictionary.

Prove `unitaryRankOne_rayMap`. Write the EHLS group as the finite-idelic ray limit

```text
X_{p,C}=lim_r M×\A_M,f×/U_{r,C},
U_{r,C}=U_C^p × (1+p^r OM⊗Z_p),
```

with the specified prime-to-p ray-level subgroup U_C^p. At C=1 this is EHLS §5.2, pp. 80–81; its tame-level version uses U_C^p of that section. Use the tame-conductor constructions at a common modulus C containing the conductors of both fixed characters. Identify their ray coordinates via the same finite idele and convert source reciprocity to arithmetic reciprocity. An existing measure at a smaller modulus has no canonical lift to this larger ray group; construct it at C, or compare pushforwards to a specified common quotient with all removed Euler factors. Keep all finite torsion components until a branch is expressly fixed. The similitude torus GU(1) and the norm-one torus U(1) are distinct from this full ray group: for general F the GU(1) multiplier lies in the common Q-similitude factor, so GU(1) must not be identified with Res_{M/Q} G_m without checking that condition.

Prove `unitaryRankOne_characterShift`. For the chosen constituent of π on U(1), determine its GL₁ base-change character Ψ and the Hecke character η corresponding to the Katz moment. For every finite place, equate the Euler factor of L(m+1/2,π,χ_u), with χ=|·|^mχ_u, to the factor of L(0,η), or explicitly use the Katz functional equation if the compatible moment lies in the other chamber. This fixes Ψ, conjugation/inversion and the norm twist; also equate the archimedean gamma factors and differential weights. An equality of the symbols L(s,π,χ) and L(s,η) does not fix these shifts. The input local formulas are EHLS Theorem 4.6.1 and Remark 4.6.2, pp. 78–79, together with the two Katz chambers in Layer 3.

Prove `unitaryRankOne_localSections`. Specialize the actual sections and ordinary/anti-ordinary vectors of EHLS §§4.2–4.3, pp. 46–67, to n=1 and compute each local multiplier relative to Katz's partial Fourier transform, additive character, polarization and self-dual Haar measure. Retain the local volume factors and the factors at S and p in 4.5; record tame Euler changes in `primitiveImprimitive_comparison`. The result is an identity of local multipliers, including their integral valuations. A local Euler zero gives an identity with zero specialization; it cannot be cancelled to define a comparison unit. Nor may the global measure quotient be used as the definition of a local correction.

Prove `unitaryRankOne_periodLattice` by identifying the two rank-one **integral** period lines through the common algebraic CM differential. In EHLS §6.7, pp. 104–107, the normalized Serre-pairing images on the eigen/eigen and eigen/localized lattices generate lines L[π,χ] and L_{π,χ}, respectively. Their generators satisfy Q[π,χ]=c(π,χ)Q_{π,χ}, with c generating the congruence ideal. The twisted second lattice is the lattice for π♭⊗χ⁻¹∘det; §6.7.5, p. 106, changes its rational structure by a CM period. It cannot be replaced by a formal tensor twist of the old integral lattice. Match the pairing's Iwahori-intersection volume, both CM-period powers and the coefficient embeddings. This must explain the c, Ω and P=Q⁻¹ in Theorem 9.2.2, pp. 144–145, including its division by P in the interpolation formula of 4.5.

Prove `unitaryRankOne_comparisonIdeal`: after the character and local-section conversions, compute the fractional coefficient ideal taking the Katz period line to the EHLS pairing line. First at each compatible classical pair this is an equality of rank-one lattices in a common one-dimensional coefficient vector space, with the above congruence factor and the computed nonzero local scalars. To compare families, construct the corresponding invertible modules over the chosen coefficient branch and prove specialization compatibility; pointwise unit ratios alone do not provide a family unit. The output specifies that fractional ideal, or a generator after an explicit trivialization. Claim a unit only after proving that ideal is the coefficient ring. Vanishing Euler polynomials stay as elements acting on the measures, outside any ratio requiring them to be nonzero.

With this dictionary, `unitaryRankOne_KatzComparison` is the equality of the transported, period-line-valued bounded measures, with the local corrections acting on the stated sides. Apply uniqueness from PadicMeasuresIwasawaAlgebras only after matching a determining set of moments and proving boundedness over the common coefficient ring. The ray-group description and the two EHLS pairing lattices above are available, but the character shift, local-section computations and integral CM-lattice identification are unresolved comparison obligations here. No numerical correction unit or equality of integral ideals is asserted without them. No comparison of EHLS with Disegni–Liu is asserted from their separate existence theorems. Likewise no unconditional equality of BSW and Bergdall–Hansen without Leopoldt is asserted.

**Checks.**
- At C=1 the group is the full p-ray limit, rather than its anticyclotomic or torsion-free quotient. A character nontrivial on a finite ray component is retained. At p=2 no finite sign component is discarded by an odd-prime character decomposition.
- For a CM extension of a real quadratic F, a local tuple with norm components (2,3) cannot have a common rational similitude multiplier, whereas (2,2) can when those norms are attained. Equality of the dimension of two tori does not identify their adelic ray quotients.
- On a rank-one lattice over a DVR O, O and ϖO span the same fraction-field line but have relative ideal (ϖ), which is not a unit ideal. The examples O and O give the unit ideal. Passing to the fraction field loses this distinction; a congruence generator is not automatically a unit.
- At a character where a local factor is zero both corrected moments can vanish. Their equality gives no quotient or period ratio there. The identically zero measure is a further negative control against defining a unit from quotients of special values.
- Rescaling a CM differential has the weight-dependent powers in the supplier's `cmPeriodData.scale`; it does not give one scalar at every arithmetic weight. The exponents 1 and 3 in 3h.8a test this difference. A zero differential cannot trivialize a period line.

For the supplied CPR/Panchishkin proposition, record only the verified instances with the **actual** period, Euler and growth data: bounded ordinary cases satisfy the admissible measure clause when their realization hypotheses are met; finite-slope GL₂ cases satisfy the proved order bound. The integer h=floor(Newton−Hodge gap)+1 can equal 1 for a supersingular gap 1/2, even though the admissibility condition Newton=Hodge fails. Thus h=1 does not imply boundedness. Panchishkin §5, pp. 1002–1005, and Conjecture 6.2, pp. 1005–1006, supply that distinction; the proposition and realization data remain owned by SelmerIwasawaCohomology. A theorem giving one construction does not establish the conjectural existence proposition for every pure motive.

### Examples

For an ordinary rational weight-two form, matching the sign periods and refinement compares BSW, the supplied ordinary modular-symbol construction and the classical ordinary p-adic L-function. For a supersingular refinement, its positive growth must remain in the comparison. For a CM induction, the toric square has a product of two Katz factors; each factor's Euler zero survives the comparison. These are examples of the same evaluation formalism with different coefficient, period and growth data.

### Dependencies

All earlier layers and the exact supplier contracts. SelmerIwasawaCohomology supplies the motivic existence proposition, never an unconditional measure. Integral main-conjecture statements, arithmetic special-value formulas outside the interpolation range and height formulas are downstream consumers of these analytic objects.

## Downstream consumers

ModularIwasawaMainConjectures consumes specified primitive or imprimitive measures, their coefficient lattices and μ statements. A characteristic-ideal statement must say whether it uses a square-root toric measure or its square. SelmerIwasawaCohomology consumes analytic objects with the matched realization and Panchishkin data. Eisenstein-congruence arguments consume the exact constant-term divisibility, integral q-expansion criterion and local nonvanishing hypotheses, rather than a generic claim that Eisenstein series are nonzero modulo p. The separate Kings–Sprang roadmap consumes the ray-class, CM normalization and measure interfaces while constructing its own higher-dimensional algebraic/Eisenstein object. None of these downstream applications supplies a missing prerequisite for the constructions here.

## References

Page numbers refer to the linked version's printed numbering, except where an arXiv theorem is explicitly cited by its section and page within that version.

- D. Barrera Salazar and C. Williams, [*P-adic L-functions for GL₂*](https://arxiv.org/pdf/1602.06244v3), version 3. §§1–5 fix the classical comparison; §§6–11 give control and evaluation; §12 explains the general-field uniqueness limitation.
- D. Barrera Salazar, [*Overconvergent cohomology of Hilbert modular varieties and p-adic L-functions*](https://aif.centre-mersenne.org/item/10.5802/aif.3206.pdf), Ann. Inst. Fourier 68 (2018), 2177–2213. Proposition 6.10 and Theorem 7.2 supply the Hilbert growth estimate and its interpolation scope.
- C. Williams, [*P-adic L-functions of Bianchi modular forms*](https://arxiv.org/pdf/1404.2100v2), version 2. Proposition 6.15 and Theorem 7.4 are the growth and uniqueness inputs.
- C. Williams, [*Overconvergent modular symbols over number fields*](https://wrap.warwick.ac.uk/id/eprint/87870/1/WRAP_Theses_Williams_2016.pdf), Warwick thesis (2016), §12.1.4, pp. 138–145, for the integral calculation.
- J. Bergdall and D. Hansen, [*On p-adic L-functions for Hilbert modular forms*](https://arxiv.org/pdf/1710.05324v2), version 2, Theorem 1.1.2 and §1.8.
- P. Deligne and K. A. Ribet, [*Values of abelian L-functions at negative integers over totally real fields*](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0059/LOG_0021.pdf), Invent. Math. 59 (1980), 227–286. The ordinary and q-expansion inputs are (4.5), (5.13)–(5.15); the measure and integrality inputs are in §8.
- P. Deligne, [*Variétés abéliennes ordinaires sur un corps fini*](https://publications.ias.edu/sites/default/files/Number6.pdf), Invent. Math. 8 (1969), 238–243, Theorem 7.
- N. M. Katz, [*p-adic L-functions for CM fields*](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0049/LOG_0014.pdf), Invent. Math. 49 (1978), 199–297. The CM comparison is in §2, the measure in §4, and interpolation and functional equation in §5.3.
- H. Hida and J. Tilouine, [*Anti-cyclotomic Katz p-adic L-functions and congruence modules*](https://www.numdam.org/item/10.24033/asens.1671.pdf), Ann. Sci. ÉNS 26 (1993), 189–259, Theorem II and Theorem 5.1.
- H. Hida, [*The Iwasawa μ-invariant of p-adic Hecke L-functions*](https://annals.math.princeton.edu/wp-content/uploads/annals-v172-n1-p02-p.pdf), Ann. Math. 172 (2010), 41–137. Theorem I and Theorem 3.20/Corollary 3.21 are used with their distinct hypotheses.
- H. Hida, [*Non-vanishing modulo p of Hecke L-values*](https://www.math.ucla.edu/~hida/Ellf.pdf), in *Geometric Aspects of Dwork Theory* (2004), 735–784. Its Theorems 3.2–3.3 are read with the correction below; this is not the similarly dated book on p-adic automorphic forms.
- H. Hida, [*Non-vanishing of integrals of a mod p modular form*](https://www.math.ucla.edu/~hida/EllrevF.pdf), revision of 27 March 2025, Corollary 2.12 and Theorem 5.2/Corollary 5.3. This is the density input used here.
- M.-L. Hsieh, [*Special values of anticyclotomic Rankin–Selberg L-functions*](https://emis.muni.cz/journals/DMJDMV/vol-19/24.pdf), Documenta Math. 19 (2014), 709–767. Theorem 7.1's rank-one cofinite strengthening requires the separate replacement argument described above.
- M.-L. Hsieh, [*On the non-vanishing of Hecke L-values modulo p*](https://arxiv.org/pdf/1208.4751v1), version 1. The geometric nonvanishing step is used only in its corrected density form.
- A. Burungale, W. He, Y. Tian and X. Ye, [*Mod ℓ non-vanishing of self-dual Hecke L-values over CM fields and applications*](https://arxiv.org/pdf/2508.19706v2), version 2, 13 March 2026. Theorem 5.7, pp. 37–38, is the independent self-dual cofinite valuation theorem; Theorems 4.15, 4.19 and 5.6 supply its toric and integral-period inputs. Its CM hypothesis does not supply general residual-irreducible automorphic nonvanishing.
- W. He, [*Stability of p-adic valuations of Hecke L-values*](https://arxiv.org/pdf/2308.15051v2), version 2, 21 December 2024. Theorem 1.5, pp. 2–3, and §1.4, p. 4, distinguish density from the stronger cofinite problem.
- M.-L. Hsieh, [*On the μ-invariant of anticyclotomic p-adic L-functions for CM fields*](https://arxiv.org/pdf/1112.1574v3), version 3, Theorems A–B.
- T. Finis, [*Divisibility of anticyclotomic L-functions and theta functions with complex multiplication*](https://annals.math.princeton.edu/wp-content/uploads/annals-v163-n3-p02.pdf), Ann. Math. 163 (2006), 767–807, Theorem 1.1 and §3 equation (14).
- E. Eischen, M. Harris, J.-S. Li and C. Skinner, [*p-adic L-functions for unitary groups*](https://arxiv.org/pdf/1602.01776v5), version 5. The main theorem is 9.2.2; its three module hypotheses are in §7.3.
- D. Disegni and Y. Liu, [*A p-adic arithmetic inner product formula*](https://arxiv.org/pdf/2204.09239v3), version 3. Only its analytic construction through §3 is used here; arithmetic inner products are downstream.
- E. Eischen and X. Wan, [*p-adic Eisenstein series and L-functions of certain cusp forms on definite unitary groups*](https://arxiv.org/pdf/1404.7153v2), version 2, Theorem 1.2, Proposition 5.5, Definition 5.6 and Theorem 5.8/Corollary 5.9.
- S. Dasgupta and M. Kakde, [*On the Brumer–Stark conjecture*](https://arxiv.org/pdf/2010.00657v3), version 3, §§7.2.8 and 8.1–8.4, particularly Proposition 8.4 for all-cusp constant terms.
- S. Dasgupta, M. Kakde and K. Ventullo, [*On the Gross–Stark conjecture*](https://arxiv.org/pdf/1605.08169v1), version 1, §1 for the totally odd nonvanishing and p-depletion convention.
- F. Castella, G. Grossi, J. Lee and C. Skinner, [*On the anticyclotomic Iwasawa theory of rational elliptic curves at Eisenstein primes*](https://arxiv.org/pdf/2008.02571v2), version 2, §2.1 for the central-value normalization and imprimitive Euler factors.
- A. A. Panchishkin, [*Motives over totally real fields and p-adic L-functions*](https://www.numdam.org/item/AIF_1994__44_4_989_0.pdf), Ann. Inst. Fourier 44 (1994), 989–1023, §§4–6 for the supplied analytic-existence interface and its growth convention.
