# Automorphic spectral theory and trace distributions, Part II

Plan the Schwartz multiplier method for isolating automorphic cuspidal components, together with the weighted quotient spaces and Schwartz spectral-kernel interfaces on which it acts. Entire interpolation controls growth on real-form spectral lattices; local multipliers, polynomial cuspidal counting and finite-place Hecke separation produce global normalized annihilators. The plan imports existing functional analysis, automorphic representations, reduction theory and compact spectral decomposition, records exact missing supplier contracts, and routes the already planned congruence spectral gap to its existing owner.

## Scope and conventions

Let F be a number field and G a connected reductive F-group. For global isolation let Z be its maximal F-split central torus and ω a unitary automorphic character of Z(𝔸). Fix a minimal parabolic, standard Levis, an admissible maximal compact K₀ and compatible Haar/quotient measures from AA. At each unramified finite place vol(K₀,v)=1. Finite S contains the bad group/level places, T is any set of finite places with S⊂T, and K=K_S×∏_{v∉S}K₀,v. T can be infinite, but each Hecke tensor uses finitely many places. Induction is normalized; infinitesimal characters are W-orbits in the complexified abstract Cartan dual. Cuspidal data and orthogonal components are those of AS.1/AS.4, compared through R6 and R9.

Write [G]_P=M_P(F)N_P(𝔸)\G(𝔸), [G]=[G]_G, and use the proper height n_P≥1. Derivatives R(X) are from the right regular action. On real groups L(X)f(g)=(d/dt)₀ f(exp(−tX)g). In the paper’s linear-first pairing write ⟨φ,ψ⟩=∫φ·conj(ψ); when translating to Mathlib’s conjugate-first inner product interchange the slots. Adjoints use f*(g)=conj(f(g⁻¹)) with the unimodular Haar normalization. A quotient by A_P∞ and the normalized δ_P^{1/2} action are used only where explicitly stated. The split centre is not silently discarded.

All smooth adelic spaces have a locally constant finite-place action. Test Schwartz functions at finite places are compactly supported, while real test functions have Nash (algebraic differential operator) decay. S(G(𝔸)) is the existing AF.0 convolution algebra. S([G]_P) and C([G]_P) are quotient function spaces. Neither is identified with local Harish-Chandra Schwartz functions by notation alone. All topological sums and completed tensor products keep their indicated topology. The roadmap gives mathematical targets; every implementation status is unchecked.

The two Schwartz source routes are coalesced here under the issue’s canonical id. Their 98 routed items are accounted for in the packet. The remaining Bakker–Tsimerman item is already the target of CongruenceSpectralGap:CSG.5, whose plan includes the continuous threshold and the curvature −1 normalization. It creates no dependency or new target in this Schwartz roadmap.

## Ownership and baseline

The baseline is Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. The seven baseline declarations below were read in their source files at those pins. The current library and current upstream roadmaps were also inspected to prevent repeating post-snapshot work. No declaration is claimed implemented by this plan.

| Input | Existing owner and precise use |

| --- | --- |

| Euclidean Schwartz maps, holomorphy, exponential, polynomial evaluation, unconditional sums, Lp and centroids | Mathlib SchwartzMap, Differentiable, Complex.exp, Polynomial.eval, Summable, MeasureTheory.Lp and CentroidHom; each is used only at its actual generality. |

| Adelic test Schwartz carrier; uniform moderate growth | AF.0/adelic-schwartz-space and AF.0/uniform-moderate-growth-space. SM.1 compares stages; SM.2 adds quotient weighted refinements. |

| SF representations, normalized induction, infinitesimal character and globalization | AF.1; exact additional Plancherel, Kostant and minimal-type contracts are R2/R4. |

| Quotient measures, group heights, Iwasawa coordinates, Siegel reduction and central-character Hilbert spaces | AA.2–AA.3, with exact quotient/fiber and central-lattice contracts R5/R9. |

| Generic nuclear LF, projective tensor, integration, cuspidal data and compact spectral decomposition | AS.0–AS.4; SM.2–SM.3 prove their Schwartz and weighted extensions rather than reconstructing the generic carriers. |

| Local spherical Hecke and normalized Satake | SR.4, with finite-support/exponential-family contract R10. |

| Isobaric strong multiplicity one | AL.3/isobaric-strong-multiplicity-one; determines GL_n inducing cuspidal support. |

| Generic spectral calculus and operator ideals | Current TauCetiRoadmap OperatorTheory and OperatorIdeals, especially OI-B32–41 and OI-B84; existing owners, even though absent from the atlas snapshot. |

| Congruence gap 21/100 | CongruenceSpectralGap:CSG.0–CSG.5; no duplicate LRS or Laplacian development. |

The current roadmap tree was read at 0d144d044dacebca17b654695b6f1ad58f159b27 and the current Tau Ceti source at a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. OperatorTheory and ReductiveGroups supplied the two complete upstream style/ownership documents. OperatorIdeals, LieGroups, PDE and RealAlgebraicGeometry were checked at the relevant interfaces. A Euclidean Schwartz map is not a Schwartz function on a reductive group; an algebraic centroid is not automatically continuous or complex-linear.

## Layer targets

## SM.0. Entire interpolation and real-form symbol algebras

Construct finite-order zero sets and vertical interpolation, fix the finite real-form involution set, and build the moderate, rapid and sharp symbol algebras. Polynomial-preserving rational difference operators and their division estimates supply the derivative control used by the multiplier proof.

### SM.0/finite-rank — Finite-rank subsets of the complex line

For Λ⊂ℂ and p∈ℕ, hasRankBound(Λ,p) means Λ is countable and Σ_{λ∈Λ,λ≠0} ‖λ‖^{−(p+1)} converges. HasFiniteRank means some such p exists; rank is the least such p. The possible zero of Λ is omitted from the sum and is recorded separately in the canonical product.

**Dependencies.** mathlib:Multipliable.

**Source.** bplzz: §2.1, Definition 2.1 and Lemma 2.2, p.9.

**Construction or proof.** 1. Use an unordered sum over the nonzero-point subtype, so enumerating a set does not introduce multiplicities. 2. Summability implies only finitely many nonzero points in each bounded disk; isolate the possible point 0.

**API.**

- **hasRankBound_mono** (functoriality): Λ′⊂Λ and a rank bound for Λ imply the same rank bound for Λ′.

- **hasRankBound_of_le** (relation): If p≤q and Λ has a rank bound p, then it has a rank bound q; treat the finitely many points of norm below 1 separately.

- **hasFiniteRank_iff_counting** (characterisation): For locally finite Λ, finite rank is equivalent to a polynomial upper bound on the number of points in disks; the exponents need not agree at the endpoint.

**Uses.** SM.0 canonical product: Controls normal convergence and finite order. SM.4 cuspidal Casimir values: Converts a counting estimate into an interpolation zero set.

**Unit tests.**

- **finiteRank_empty** (degenerate): The empty set has least rank 0.

- **finiteRank_integers** (computation): The image of ℤ in ℂ has least rank 1, since the harmonic sum diverges and the inverse-square sum converges.

- **finiteRank_accumulation** (non-example): The set {1/(n+1):n∈ℕ} has no finite rank.

**Check.** No sequence converging to 0 through nonzero points has finite rank.

**Planet.** Finite-rank sets.

### SM.0/canonical-product — Finite-order Weierstrass products

If Λ has finite rank p, let E_p(w)=(1−w)exp(Σ_{j=1}^p w^j/j) and δ=1 if 0∈Λ, otherwise 0. The products z^δ∏_{λ∈Λ\{0}}E_p(z/λ) converge normally on compact sets to an entire function ΨΛ, with zero set exactly Λ and simple zeros there; its order is at most p+1. Finite order here means a global bound exp(C(1+‖z‖)^d) for some positive C and integer d, which is equivalent to the usual finiteness of entire order.

**Dependencies.** AutomorphicSpectralTheoryPartII:SM.0/finite-rank; mathlib:Differentiable; mathlib:Complex.exp.

**Source.** bplzz: §2.1, Lemma 2.2, p.9.

**Construction or proof.** 1. Bound log E_p(w) by a constant times |w|^{p+1} near zero and use summability for compact normal convergence. 2. Separate the finitely many small λ from the tail, apply the standard canonical-product growth estimate, and prove a nonzero product away from Λ.

**Check.** For Λ={0,a}, a≠0, the product is z E_p(z/a); multiplicities are one, not enumeration dependent.

### SM.0/vertical-interpolation — Interpolation with vertical strip decay

Let U be a finite-dimensional real vector space, Ψ an entire function on ℂ of finite order, and q:Uℂ→ℂ polynomial. There is an entire ν with exactly the zero set q^{-1}(Ψ^{-1}(0)) and with rapid decay on every vertical strip: for every M>0 and r∈ℕ, sup_{‖Re z‖≤M}(1+‖z‖)^r|ν(z)|<∞. Consequently this holds for q^{-1}(Λ) when Λ has finite rank. If L⊂Uℂ is generated by complex-linearly independent vectors and A⊂Uℂ is finite, there is such a vertically moderate ν vanishing on L\A and nonzero at every point of A; no vanishing requirement is imposed off L. The same conclusion holds for an affine translate of L, by translating the variable and the finite exceptional set. This is not asserted for an arbitrary lattice of the underlying real space of Uℂ.

**Dependencies.** AutomorphicSpectralTheoryPartII:SM.0/canonical-product; mathlib:Polynomial.eval.

**Source.** bplzz: §2.1, Proposition 2.4, Corollaries 2.5–2.6 and Remark 2.7, pp.9–10.

**Construction or proof.** 1. In coordinates choose an odd q₀ sufficiently large and multiply Ψ(q(z)) by exp(Σ z_j^{2q₀}); its real part is negative in every imaginary direction outside a bounded set in a fixed strip. 2. For the lattice statement use complex coordinate functionals integral on its complex-linearly independent generators, remove finitely many exceptional zeros, and multiply the resulting factors; a finite polynomial handles points of A outside the lattice. For an affine lattice first translate its base point to zero; translation preserves the strip-growth conditions.

**Check.** The imaginary-axis Gaussian exp(z²) decays rapidly; exp(−z²) does not. For L=ℤ and A={0}, the factor sin(πz)/(πz) has the desired zeros; damping supplies the required strip decay.

**Planet.** Vertical interpolation.

### SM.0/root-strip-data — Real-form involutions and shifted lattices

Import a based root datum (X*,Φ,X_*,Φ∨), its finite Weyl group W and real Cartan dual h*=X*⊗ℝ. For a real form choose its action ϑ₀ on the datum and put θ={wϑ₀:w∈W,(wϑ₀)²=1}; this finite W-conjugation-stable set is the real-form set. For ϑ∈θ let h*ϑ and h*−ϑ be its ±1 eigenspaces and Yϑ=pr_{−ϑ}(ρ+X*), a discrete affine lattice in h*−ϑ. For each maximal real torus the split/compact decomposition gives an involution in θ; θG is the subset realized by such tori. Abstract Cartan identifications are taken modulo W.

**Dependencies.** tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory; tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-7-complexification-and-real-forms; AutomorphicFormsOnReductiveGroups:AF.1/infinitesimal-character.

**Source.** bplzz: §2.2, notation before Definition 2.8, p.10; §2.3, pp.11–12; Lemma 2.19, p.13.

**Construction or proof.** 1. Use root-datum real descent and the torus split/compact decomposition; different Cartan identifications are Weyl conjugate. 2. Since changing positive roots changes ρ by a root-lattice element, Yϑ is independent of that choice. Distinguish the finite coset θ from the possibly infinite set of all root-datum involutions.

**API.**

- **realFormInvolutions_finite** (structure): θ is finite because it lies in the single finite coset Wϑ₀.

- **shiftedLattice_change_positive** (compatibility): Changing a simple-root basis does not change Yϑ.

- **realTorus_involution_mem** (data): The split and compact parts of a maximal real torus identify with the ± eigenspaces of an element of θG⊂θ.

**Uses.** SM.0 symbol spaces: Determines the strips and their discrete translates. SM.1 finite K-type detection: Uses actual torus and discrete-series character geometry.

**Unit tests.**

- **involutions_split_torus** (computation): For split G_m, W is trivial, θ={1}, and Y₁={0}.

- **involutions_compact_torus** (computation): For the anisotropic real torus U(1), θ={−1}, the plus eigenspace is zero and Y_{−1}=X*.

- **involutions_rank_two_centre** (non-example): The rootless rank-two lattice has infinitely many involutions in GL₂(ℤ); taking all of them is not an allowed finite θ.

**Check.** No equality between θG and θ is required.

**Planet.** Real-form spectral lattices.

### SM.0/moderate-symbols — Moderate spectral symbols

For a finite W-stable involution set Θ, define p_{ϑ,M,r}(μ)=sup_{α∈h*ϑ,ℂ,‖Re α‖≤M; ϖ∈Yϑ}|μ(α+ϖ)|(1+‖α+ϖ‖)^r, allowing value ∞. MΘ consists of entire μ for which every ϑ∈Θ and M>0 admit some real r with p finite. Equivalently use a polynomial upper bound of some nonnegative integral degree on each strip. M denotes M_{ {1} }. The invariant subalgebra is MΘ^W. Exponents may depend on ϑ and M; the bound is uniform over all lattice translates.

**Dependencies.** AutomorphicSpectralTheoryPartII:SM.0/root-strip-data; mathlib:Differentiable.

**Source.** bplzz: §2.1, Definition 2.3, p.9; §2.2, Definition 2.8(1), p.10; §2.4, seminorms, p.13.

**Construction or proof.** 1. Define the extended seminorm family before restricting to its finite domains. 2. Use polynomial absorption to compare real and integral exponents and prove algebra closure.

**API.**

- **moderateSymbol_mul** (structure): MΘ is an algebra with unit, and p_{M,r+s}(μν)≤p_{M,r}(μ)p_{M,s}(ν).

- **moderateSymbol_restrict** (functoriality): If Θ′⊂Θ, restriction of conditions gives MΘ⊂MΘ′.

- **moderateSymbol_poly** (constructor): Every polynomial belongs to MΘ; its growth degree supplies one exponent uniformly in lattice translates.

**Uses.** SM.1 real multiplier theorem: The input symbol class is M_{θ∪{1}}^W. SM.5 mixed separation: Polynomial and finite-place exponential coefficients must remain in this class.

**Unit tests.**

- **moderate_exp** (example): On ℂ, exp(z) is moderate on vertical strips although it has exponential growth on the real axis.

- **moderate_bad_gaussian** (non-example): On ℂ, exp(−z²) is not moderate on vertical strips.

- **moderate_uniform_lattice** (characterisation): For Θ={−1} with Y=ℤ, restriction to Y has a single polynomial upper bound; separate unrelated bounds at each integer do not suffice.

**Check.** For Θ={1} on a line this is the moderate vertical growth of Definition 2.3.

**Planet.** Moderate spectral symbols.

### SM.0/rapid-symbols — Rapid spectral symbols

NΘ consists of entire μ such that p_{ϑ,M,r}(μ)<∞ for every ϑ∈Θ, M>0 and real r; integral r≥0 suffice. When 1∈Θ the topology uses the countable family M,r∈ℕ with M≥1 and is Fréchet, and NΘ is an ideal in MΘ in the sense that multiplying a rapid symbol by a moderate symbol remains rapid. N denotes N_{ {1} }. Invariant symbols form the closed W-fixed subspace.

**Dependencies.** AutomorphicSpectralTheoryPartII:SM.0/moderate-symbols; AutomorphicSpectralTheory:AS.0/nuclear-lf-space.

**Source.** bplzz: §2.2, Definition 2.8(2) and Remark 2.9, pp.10–11; §2.4, pp.13,17–21.

**Construction or proof.** 1. Uniform convergence on bounded strips gives entire limits; polynomially weighted bounds pass to the limit. 2. Use the moderate exponent at each strip to absorb it into the universally quantified rapid exponent.

**API.**

- **rapidSymbol_to_moderate** (coercion): NΘ⊂MΘ by choosing exponent 0.

- **rapidSymbol_moderate_mul** (structure): For μ∈NΘ and ν∈MΘ, μν∈NΘ with the corresponding shifted-exponent estimate.

- **rapidSymbol_complete** (instance): When 1∈Θ the countable strip-seminorm topology is Hausdorff and complete, and W acts continuously; no such claim is made for arbitrary Θ without a holomorphic compact-open control.

**Uses.** SM.1 rapid multiplier estimate: Provides all polynomially weighted spectral suprema. SM.1 general multiplier theorem: Approximates a moderate symbol by rapid dampings.

**Unit tests.**

- **rapid_gaussian** (computation): For Θ={1} on a line, exp(z²) lies in NΘ.

- **rapid_constant** (non-example): The constant 1 is moderate but is not rapid on a positive-dimensional vertical strip.

- **rapid_zero_dimension** (degenerate): In dimension zero, NΘ=MΘ=ℂ; all seminorms reduce to the absolute value at the single point.

**Check.** The quantifier over all exponents cannot be interchanged with existence of one exponent.

### SM.0/sharp-symbols — Sharp spectral symbols

M♯θ is the subalgebra of M_{θ∪{1}} consisting of μ such that, for each ϑ∈θ, the function α↦μ(α+ϖ) is identically zero on h*ϑ,ℂ for all but finitely many ϖ∈Yϑ. This is support of restrictions, not support of the entire function as a function on h*ℂ. M♯θ is an M-module. Its W-fixed algebra can be nonunital; 1 fails the condition whenever an infinite Yϑ occurs.

**Dependencies.** AutomorphicSpectralTheoryPartII:SM.0/moderate-symbols.

**Source.** bplzz: §2.2, Definition 2.8(3), Remark 2.9(2)–(3), pp.10–11; Remark 2.17, p.13.

**Construction or proof.** 1. Finite supports are preserved by sums, products and Weyl action. 2. For multiplication by M, only finitely many shifted subspaces survive, so bounded real shifts reduce the estimate to a strip for the factor in M.

**API.**

- **sharpSymbol_support_finite** (projection): For each ϑ, the set of ϖ for which the restricted entire function is nonzero is finite.

- **sharpSymbol_moderate_mul** (structure): M·M♯θ⊂M♯θ; this is the module property used after mixed separation.

- **sharpSymbol_weyl** (functoriality): W transports supports and preserves M♯θ, so finite Weyl products stay sharp.

**Uses.** SM.1 finite K-types: Converts lattice support to finitely many minimal K-types. SM.4 archimedean truncation: Ensures that the multiplier leaves only finitely many components.

**Unit tests.**

- **sharp_split_line** (compatibility): For a split torus with θ={1}, Y₁={0}, so sharpness imposes no additional support condition on M.

- **sharp_compact_line** (non-example): For U(1), the constant 1 is not sharp because Y_{−1}=ℤ is infinite.

- **sharp_integer_delta** (computation): After vertical damping, sin(πz)/(πz) is sharp for θ={−1} and is nonzero at 0 while vanishing at every other integer.

**Check.** Do not introduce a unit or silently coerce a Hecke element to a sharp multiplier.

**Planet.** Sharp spectral symbols.

### SM.0/sharp-nonvanishing — Sharp symbols nonzero on prescribed orbits

For every a∈h*ℂ there exists μ∈(M♯θ)^W with μ(a)≠0, provided θ is finite and W-stable. One can normalize μ(a)=1. More generally a finite set of points can be kept nonzero. No assertion is made for an infinite involution set.

**Dependencies.** AutomorphicSpectralTheoryPartII:SM.0/vertical-interpolation; AutomorphicSpectralTheoryPartII:SM.0/sharp-symbols.

**Source.** bplzz: §2.2, Lemma 2.10, p.11.

**Construction or proof.** 1. For each ϑ interpolate on its shifted lattice while avoiding the projections of the finite W-orbits of the specified points. 2. Take the product over the finite sets θ and W, then normalize; nonvanishing is required at every Weyl translate before taking the product.

**Check.** The resulting symbol is in the nonunital sharp algebra even in the compact-torus case.

**Planet.** Sharp interpolation.

### SM.0/difference-operators — Polynomial and rational difference operators

Let R=ℂ[h*ℂ]⋊(X*⋊W) act by finite sums of polynomial coefficients times affine pullbacks; fix t_λ f(α)=f(α−λ). Let T be its localization to rational coefficients and S the subalgebra obtained by inverting affine reflection linear equations ℓ_s. Write S_pol for those elements preserving all polynomials. Evaluation and composition retain the pullback order. Only finite sums occur.

**Dependencies.** AutomorphicSpectralTheoryPartII:SM.0/root-strip-data.

**Source.** bplzz: §2.4, notation before Lemma 2.20, p.14; Lemma 2.23, p.17.

**Construction or proof.** 1. Construct the crossed-product action with the chosen inverse-action convention. 2. Keep localization identities separate from the action on entire functions; apparent poles are removed only for polynomial-preserving operators.

**API.**

- **differenceOperator_translate_eval** (simp): (t_λf)(α)=f(α−λ).

- **differenceOperator_mul_eval** (relation): For polynomial q, t_λ(qf)=(t_λq)(t_λf).

- **differenceOperator_dividedDifference** (constructor): For an affine reflection s with equation ℓ_s, (1−s)/ℓ_s preserves polynomials and lies in S_pol.

**Uses.** SM.0 polynomial-preserving estimates: Removes reflection poles with controlled strip loss. SM.1 tensor centralizer: Encodes the translated central characters after tensoring.

**Unit tests.**

- **difference_translate_coordinate** (computation): For f(z)=z, t₁f=z−1.

- **difference_reflection_rank_one** (computation): For s(z)=−z and ℓ_s=z, (f(z)−f(−z))/z sends z to 2 and 1 to 0.

- **difference_pole_nonexample** (non-example): The operator f↦f/z does not preserve polynomials, since it sends 1 to 1/z.

**Check.** For translations, t_λt_η=t_{λ+η}; multiplication by a polynomial does not commute with a translation.

### SM.0/difference-estimates — Holomorphic extension and strip estimates

Every S∈S_pol extends uniquely to a continuous operator on entire functions with their compact-open topology. There are M_S>0 and a real exponent shift r_S≥0 such that, for all M>0,r∈ℝ, p_{1,M,r}(Sμ)≤C p_{1,M+M_S,r+r_S}(μ); the analogous maximum over θ holds for a real-form coset θ. A rational-coefficient difference operator preserving polynomials has poles only along affine reflection hyperplanes and belongs to S. If μ vanishes on H_s, μ/ℓ_s is entire and satisfies the corresponding widened-strip estimate without an extra polynomial exponent.

**Dependencies.** AutomorphicSpectralTheoryPartII:SM.0/difference-operators; AutomorphicSpectralTheoryPartII:SM.0/moderate-symbols.

**Source.** bplzz: §2.4, Lemmas 2.20–2.21, pp.14–16; Lemma 2.23, p.17.

**Construction or proof.** 1. Use Taylor polynomials for compact-open density and integral division in a transverse direction for a vanishing numerator. Bound the whole unit disk in that direction, not only a fixed endpoint. 2. When a reflection commutes with ϑ use the companion involution sϑ in the same real-form coset; the general finite W-stable set alone does not justify this step. 3. For the localization criterion compare values of polynomials at affine translates at a generic pole and use interpolation to exclude a nonreflection pole.

**Check.** The rank-one divided difference is entire at 0 and its value there is 2f′(0). The estimates use extended seminorms; an arbitrary entire function need not have a finite right-hand side.

## SM.1. Multipliers of the real and adelic Schwartz algebras

Import the AF.0 test-function carrier, compare its real stages to Nash Schwartz functions, extend Delorme’s rapid-symbol action across the connected centre, and use Kostant difference operators and Plancherel estimates to obtain all moderate-symbol multipliers. Sharp symbols detect finitely many K-types. Compare finite-place support/level stages without redefining the adelic algebra.

### SM.1/real-schwartz-comparison — Real Schwartz and Sobolev descriptions

Take the real-group factor of AF.0/adelic-schwartz-space. Its elements are smooth functions for which Df is bounded for every algebraic differential operator D on G(ℝ). The seminorm topology is nuclear Fréchet and equals the topology defined by ‖Df‖₂ for all algebraic D, using distributional derivatives for the converse. The comparison is with Nash Schwartz functions, not merely Harish-Chandra C²(G). There is a continuous inclusion S(G)⊂⋂_{p>0}C^p(G), with equality precisely when the algebraic centre of G is compact at the real points. For an additive real vector group the resulting polynomial derivative conditions agree with Mathlib SchwartzMap.

**Dependencies.** AutomorphicFormsOnReductiveGroups:AF.0/adelic-schwartz-space; mathlib:SchwartzMap; AutomorphicSpectralTheory:AS.0/nuclear-lf-space.

**Source.** bplzz: §2.3, definition and Remarks 2.11–2.12, pp.11–12.

**Construction or proof.** 1. Compare algebraic differential operators to polynomially weighted invariant derivatives in finitely many algebraic charts. 2. Use local Sobolev estimates and polynomial volume growth in algebraic height for the L²/bounded comparison; identify the required Nash chart and partition input in G1. 3. Use the standard comparison with Harish-Chandra seminorms, keeping the noncompact central directions.

**Check.** On a split real torus, decay in the logarithm of the torus coordinate alone does not give Nash Schwartz decay. For a compact real reductive group this space is C∞ with its usual topology.

### SM.1/schwartz-integrated-action — Schwartz integration on moderate representations

For a smooth moderate-growth Fréchet representation V of G(ℝ), the integral π(f)v=∫_G f(g)π(g)v dg converges in V for f∈S(G) and defines a continuous bilinear action S(G)×V→V. It satisfies π(f₁*f₂)=π(f₁)π(f₂), left/right differentiation identities with L(X)f(g)=d/dt f(exp(−tX)g), and agreement with the compactly supported integrated action. For irreducible admissible π use its Casselman–Wallach globalization. Equality of the transforms on all such π detects an element of S(G).

**Dependencies.** AutomorphicSpectralTheoryPartII:SM.1/real-schwartz-comparison; AutomorphicFormsOnReductiveGroups:AF.1; AutomorphicFormsOnReductiveGroups:AF.1/sf-representation; AutomorphicFormsOnReductiveGroups:AF.1/casselman-wallach-globalization; AutomorphicSpectralTheory:AS.0/locally-convex-integration.

**Source.** bplzz: §2.3, before Theorem 2.13, p.12; §2.4, proof of Proposition 2.24, pp.17–19.

**Construction or proof.** 1. Bound each representation seminorm of π(g)v by an algebraic height power times a stronger seminorm of v, then use Schwartz integrability. 2. Apply vector-valued Fubini and integration by parts with the specified left regular sign. 3. For detection use the faithful regular representation and the real Plancherel import requested in R2.

**Check.** π(L(u)f)=dπ(u)π(f), with this sign convention.

### SM.1/delorme-reductive — Delorme multipliers for reductive real groups

For μ∈N(h*ℂ)^W and compactly supported smooth bi-K-finite f on a real reductive algebraic group, there is a unique bi-K-finite Schwartz function μ⋆f with π(μ⋆f)=μ(χπ)π(f) for every irreducible admissible π. For every fixed finite left/right K-type set and compact-support stage, the map is continuous to the corresponding finite-K-type Schwartz space. The output need not be compactly supported. The W-invariance hypothesis is mandatory.

**Dependencies.** AutomorphicSpectralTheoryPartII:SM.0/rapid-symbols; AutomorphicSpectralTheoryPartII:SM.1/schwartz-integrated-action; AutomorphicSpectralTheory:AS.6/real-operator-paley-wiener; AutomorphicSpectralTheory:AS.6; AutomorphicSpectralTheory:AS.0/projective-tensor; AutomorphicSpectralTheory:AS.0.

**Source.** bplzz: Appendix A, Proposition A.1 and Lemma A.2, pp.43–45; §2.4, p.17.

**Construction or proof.** 1. Use Delorme’s semisimple rapid-symbol theorem as the exact requested AS.6 strengthening R3; compact Paley–Wiener alone is not declared to supply it. 2. Write the identity component as (Z⁰×G_der⁰)/(Z⁰∩G_der⁰), use fixed K-type/support completed tensor products, and descend finite-kernel invariants. 3. Split-centre Fourier–Laplace theory and the Schwartz tensor theorem identify the rapid-symbol tensor factors (Lemma A.2); extend separately continuous bilinear maps between the fixed Fréchet stages jointly, then use AS.0 tensor universality. Extend to finitely many components by K/K⁰.

**Check.** For a split torus this reduces to the Fourier–Laplace multiplier theorem, including real central directions. The finite kernel uses G_der⁰; replacing it by all of G_der can enlarge it incorrectly.

**Planet.** Delorme multiplier theorem.

### SM.1/tensor-centralizer — Kostant centralizers and translated characters

For a finite-dimensional algebraic representation τ of G, Rτ=(U(g)⊗End τ)^{δg} is finite free over Z(g), and after a basis is chosen δ(z)=Σ_i S_i(z)v_i with S_i∈S_pol. If Λ(τ) is the finite weight set and t_λf(α)=f(α−λ), then ∏_{λ∈Λ(τ)}(δ(z)−t_{−λ}z)=0: its roots are α↦z(α+λ). The resulting difference operators have the strip estimates of SM.0. Freeness and this annihilator are Kostant inputs, requested from AF.1 rather than redeveloping enveloping-algebra representation theory here.

**Dependencies.** AutomorphicSpectralTheoryPartII:SM.0/difference-estimates; AutomorphicFormsOnReductiveGroups:AF.1/infinitesimal-character; AutomorphicFormsOnReductiveGroups:AF.1.

**Source.** bplzz: §2.4, Lemma 2.22 and its proof, p.16; Kostant 1975, Theorems 4.8–4.9, as cited there.

**Construction or proof.** 1. Apply the exact finite-free centralizer and tensor-character annihilator contract R4. 2. Over the rational function field, separate the finitely many distinct translated characters and simultaneously diagonalize; polynomial preservation and Lemma 2.23 remove forbidden poles.

**Check.** For τ of weight λ on a torus, the central character shifts by +λ; this checks the translation sign.

### SM.1/generic-principal-tensor — Generic semisimplicity after tensoring

For a minimal parabolic P=MAN, finite-dimensional algebraic τ, and an irreducible representation ξ of the compact-mod-centre M, the principal-series family I_P(ξ,λ)⊗τ is semisimple for λ outside a locally finite exceptional union of affine analytic hyperplanes. Its constituents have the translated infinitesimal characters prescribed by the weights of τ. The assertion is generic, not at every singular inducing parameter.

**Dependencies.** AutomorphicSpectralTheoryPartII:SM.1/tensor-centralizer; AutomorphicFormsOnReductiveGroups:AF.1/normalized-real-parabolic-induction; AutomorphicFormsOnReductiveGroups:AF.1.

**Source.** bplzz: §2.4, Lemma 2.25 and proof, p.20.

**Construction or proof.** 1. Use the finite-dimensional τ-weight filtration of the induced tensor product and generic irreducibility of its induced factors, requested in R4. 2. Generic separation of central characters splits the filtration; extend identities in λ by holomorphy, not semisimplicity at exceptional λ.

**Check.** At a reducibility point only the holomorphic identity continues; the semisimplicity conclusion does not.

### SM.1/rapid-multiplier — L² estimates for rapid-symbol multipliers

For μ∈N_{θ∪{1}}^W the compact-support multiplier extends uniquely to a continuous multiplier on S(G). For each algebraic differential operator D there is M_D>0 such that for every r∈ℝ a continuous seminorm ν_{D,r} on S(G) satisfies ‖D(μ⋆f)‖₂≤ν_{D,r}(f) max_{ϑ∈θ∪{1}}p_{ϑ,M_D,r}(μ). The transform identity holds on every irreducible admissible representation, not only the tempered dual.

**Dependencies.** AutomorphicSpectralTheoryPartII:SM.1/delorme-reductive; AutomorphicSpectralTheoryPartII:SM.1/tensor-centralizer; AutomorphicSpectralTheoryPartII:SM.1/generic-principal-tensor; AutomorphicSpectralTheoryPartII:SM.1/real-schwartz-comparison; AutomorphicFormsOnReductiveGroups:AF.1.

**Source.** bplzz: §2.4, Proposition 2.24, pp.17–19.

**Construction or proof.** 1. On compact bi-K-finite functions use Plancherel, the inclusion of tempered characters in the shifted imaginary strips (R2), and centralizer difference-operator bounds to estimate multiplication by algebraic coefficients. 2. Generic principal-series identities and the subquotient theorem transfer the transform formula to all admissible representations. 3. Density in the L² derivative topology extends the action, and the convolution and continuity identities pass to the limit.

**Check.** Use only containment of the tempered character set in the lattice union; equality is false for compact groups.

**Planet.** Rapid multiplier estimate.

### SM.1/real-multiplier — Schwartz multipliers of moderate symbols

For every μ∈M_{θ∪{1}}(h*ℂ)^W there is a unique continuous complex-linear Tμ:S(G)→S(G) such that π(Tμf)=μ(χπ)π(f) for all irreducible admissible π. It is a centroid multiplier: Tμ(f₁*f₂)=Tμ(f₁)*f₂=f₁*Tμ(f₂). The map μ↦Tμ is multiplicative and linear, preserves every finite left/right K-type subspace, and agrees with the AS.6 compact multiplier on the common domain. Its kernel consists of symbols vanishing at actual infinitesimal characters of irreducible admissible representations; no classification of all continuous multipliers is asserted.

**Dependencies.** AutomorphicSpectralTheoryPartII:SM.1/rapid-multiplier; AutomorphicSpectralTheoryPartII:SM.0/moderate-symbols; mathlib:CentroidHom.

**Source.** bplzz: §2.3, Theorem 2.13, p.12; §2.4, completion of proof and Remark 2.26, pp.20–21; Remark 2.16, pp.12–13.

**Construction or proof.** 1. Choose a W/θ-invariant homogeneous polynomial positive on every limiting imaginary-real subspace; damp by exp(−P(z/n)) to get rapid symbols. 2. Prove convergence in weaker weighted strip seminorms, then use the rapid L² estimates for every D to obtain a Cauchy sequence in S(G). 3. Pass the representation identities to the limit; faithfulness gives uniqueness and both centroid identities. Record the continuous complex-linear refinement of the existing CentroidHom rather than a replacement multiplier carrier.

**Check.** The multiplier of μ=1 is the identity, even when 1 is not sharp. For compact SU(2), 0 is in the lattice union but is not an actual admissible infinitesimal character.

**Planet.** Schwartz multiplier theorem.

### SM.1/finite-k-types — Finite K-type detection for sharp symbols

For μ∈(M♯θ)^W there is a finite set 𝔗 of irreducible K-types such that every irreducible admissible π with μ(χπ)≠0 contains a type in 𝔗. Moreover μ⋆ preserves bi-K-finiteness and defines the corresponding multiplier on the algebraic K-finite Schwartz algebra. This does not say μ selects finitely many irreducible representations or finitely many split inducing parameters.

**Dependencies.** AutomorphicSpectralTheoryPartII:SM.0/sharp-nonvanishing; AutomorphicSpectralTheoryPartII:SM.1/real-multiplier; AutomorphicFormsOnReductiveGroups:AF.1; AutomorphicFormsOnReductiveGroups:AF.1/langlands-classification; AutomorphicFormsOnReductiveGroups:AF.1/discrete-series; AutomorphicFormsOnReductiveGroups:AF.1/k-finite-vectors.

**Source.** bplzz: §2.3, Lemma 2.18, p.13; Remarks 2.17 and 2.26, pp.13,21.

**Construction or proof.** 1. Use sharp support to bound the discrete parameters of the inducing Levi; keep unrestricted split twists. 2. Include nondegenerate limits of discrete series and the minimal-K-type preservation statement R4, then take the union over finitely many Levi/tori and remaining parameters.

**Check.** The limits of discrete series for SL₂(ℝ) must be detected; an argument using only regular discrete series is insufficient.

**Planet.** Finite K-type detection.

### SM.1/adelic-schwartz-adapter — Adelic LF and finite-place compatibility

Import S(G(𝔸_F)) from AF.0: at fixed compact finite support C and compact open J it is the Fréchet space of smooth bi-J-invariant functions with every seminorm sup_g ‖g‖^r|R(X)L(Y)f(g)| finite. Identify that stage with a finite direct sum of S(G∞), one copy per finite J-double coset in C. The countable support/level exhaustion is strict LF, convolution is continuous on the appropriate pairs of stages, and C_c∞ is dense. For a finite place set S, S(G(F_S)) is the completed product over real places tensored with locally constant compactly supported finite-place functions; it embeds by hyperspecial units away from S. Different embeddings obey the Hecke normalization vol(K_v)=1.

**Dependencies.** AutomorphicFormsOnReductiveGroups:AF.0/adelic-schwartz-space; AutomorphicSpectralTheoryPartII:SM.1/real-schwartz-comparison; AutomorphicSpectralTheory:AS.0/nuclear-lf-space; AutomorphicSpectralTheory:AS.0/projective-tensor; SmoothRepresentationsOfLocalGroups:SR.4.

**Source.** bplzz: §3.1, Definition 3.1, pp.21–22; §4.2, pp.33–35; BPCZ §2.5.2, p.209.

**Construction or proof.** 1. Reduce each finite-support finite-level stage to finitely many real Schwartz copies; import generic strict-LF and nuclear-space arguments from AS.0. 2. Check convolution by a finite-place spherical operator stays in a controlled finite-support stage and commutes with the real multiplier.

**Check.** At a finite place this space is C_c∞, not the larger Harish-Chandra Schwartz algebra planned in SR.3. A completed archimedean tensor product cannot be silently replaced by finite sums of pure tensors.

## SM.2. Weighted automorphic function spaces and constant terms

Build quotient weights, parabolic depths and the quotient-volume function. Define weighted smooth L², rapid, Harish-Chandra, tempered-measure and partially rapid spaces, retaining AF.0 ownership of uniform moderate growth. Establish Sobolev evaluation, nuclear inclusions, product tensors, weighted constant terms, pseudo-Eisenstein extensions and cusp approximation, including graph and open-surjection statements.

### SM.2/weights — Weights on automorphic quotients

For a standard parabolic P put [G]_P=M_P(F)N_P(𝔸)\G(𝔸), with the AA quotient measure. A weight is a positive measurable w:[G]_P→ℝ_{>0} such that for every compact U⊂G(𝔸) there is C_U≥1 with C_U^{-1}w(x)≤w(xu)≤C_Uw(x) for all x and u∈U. Write w≍w′ for two-sided global constant comparison. Every weight satisfies w(xg)≤Cw(x)‖g‖^N for some C,N and all x,g. Import the proper quotient height n_P(x)=inf_{p∈M_P(F)N_P(𝔸)}‖px‖≥1 and put σ_P=1+log n_P.

**Dependencies.** AdelicAlgebraicGroups:AA.3/adelic-height; AdelicAlgebraicGroups:AA.3/height-representation-comparison; AdelicAlgebraicGroups:AA.3.

**Source.** bpcz: §2.4.2–2.4.3, Lemma 2.4.3.1, pp.203–205.

**Construction or proof.** 1. Follow Lemma 2.4.3.1: apply compact generation only to the connected positive real split torus A₀∞, obtaining exponential control in its logarithmic coordinates. Reduce general translations by Iwasawa decomposition, compact representatives for the unipotent quotient and the Siegel covering, then compare these coordinates with the adelic height. No compact generation of G(𝔸) is assumed. 2. Use the quotient-height comparison requested from AA.3 in R5; no new group-height carrier is defined here.

**API.**

- **weight_compact_translate** (projection): For every compact U the comparison constant is uniform in both x and u∈U.

- **weight_mul_rpow** (structure): Products, inverses and real powers of weights are weights; equivalence is preserved.

- **weight_equiv_lp** (compatibility): Equivalent weights give the same L² carrier with equivalent Hilbert norms and the same smooth-vector topology.

**Uses.** SM.2 weighted L²: Controls translation of weighted Hilbert norms. SM.3 kernel bounds: Permits the ratio w(x)/w(y) in the universal bounds.

**Unit tests.**

- **weight_one** (degenerate): The constant 1 is a weight, with C_U=1.

- **weight_height_powers** (example): n_P^a and σ_P^b are weights for every real a,b.

- **weight_supergrowth** (non-example): On ℝ_{>0} under multiplication, w(t)=exp(t) fails compact-translate comparability already at the translation t↦2t.

**Check.** Measurability is required; differentiability of the weight is not.

**Planet.** Weights on automorphic quotients.

### SM.2/franke-weights — Franke weights and chamber order

For each λ∈a*₀ construct a weight d_{P,λ} on [G]_P, determined up to ≍, that is comparable with exp⟨λ,H₀(x)⟩ on every standard P-Siegel domain. It obeys d_{P,tλ}≍d_{P,λ}^t, d_{P,λ+η}≍d_{P,λ}d_{P,η}, and d_{P,λ}≪d_{P,η} if λ≺_Pη in the chamber order. For a proper embedding height, n_P≍max_{λ∈Λ^P_ι}d_{P,λ}. If λ is P-dominant, d_{P,λ}(x)≍sup_{γ∈P(F)}exp⟨λ,H₀(γx)⟩. For Q⊂P and P-dominant λ one has d_{Q,λ}≪d_{P,λ} on their common intermediate quotient.

**Dependencies.** AutomorphicSpectralTheoryPartII:SM.2/weights; AdelicAlgebraicGroups:AA.3/siegel-covering-adelic; AdelicAlgebraicGroups:AA.3.

**Source.** bpcz: §2.4.3, (2.4.3.13), Lemma 2.4.3.2 and Corollary 2.4.3.3, pp.204–206.

**Construction or proof.** 1. Glue the exponential weights across finitely overlapping Siegel charts using the exact reduction-theory comparison R5; take positive comparison-class representatives. 2. The dominance inequalities follow on each chamber and hence globally; derive the supremum formula and the nested-parabolic comparison from the same cover.

**API.**

- **frankeWeight_add** (relation): The class of d_{P,λ+η} is the product of the two classes.

- **frankeWeight_dominant_sup** (characterisation): For P-dominant λ the supremum over P(F) gives an equivalent weight.

- **frankeWeight_nested** (functoriality): For Q⊂P and P-dominant λ the pullbacks obey d_{Q,λ}≪d_{P,λ}.

**Uses.** SM.2 cusp neighborhoods: Root weights measure depth in a specified parabolic direction. SM.2 quotient Ξ: ρ₀ gives the volume weight.

**Unit tests.**

- **frankeWeight_zero** (degenerate): d_{P,0}≍1.

- **frankeWeight_negative** (computation): d_{P,−λ}≍d_{P,λ}^{−1}.

- **frankeWeight_gm** (compatibility): For G=G_m and P=G, a rational character λ gives the corresponding power of the idele norm, with no root-cone correction.

**Check.** Statements are invariant under changing representatives within ≍; equality of chosen functions is not promised.

### SM.2/cusp-neighborhoods — Parabolic depth functions

For proper standard P⊊Q define d_P^Q=min_{α∈Σ_P^Q}d_{P,α} and d_Q^P=min_{α∈Σ_P^Q}d_{Q,α}, where Σ_P^Q is the finite nonempty root set in n_P/n_Q. On P(F)N_Q(𝔸)\G(𝔸), d_P^Q≪d_Q^P. Write ω_P^Q(C)={d_P^Q>C}. These are neighborhoods of infinity in the relevant parabolic directions. Their finite-fiber and deep-cusp comparison properties are imported from AA.3. If H⊂G is reductive and P∩H⊊Q∩H are parabolics with the intersected unipotent radicals, restriction satisfies d_P^Q(h)≪d_{P∩H}^{Q∩H}(h); for restriction of scalars along a finite field extension with diagonal H this is an equivalence. Treat P=Q by the identity case of subsequent theorems, not by an empty minimum.

**Dependencies.** AutomorphicSpectralTheoryPartII:SM.2/franke-weights; AdelicAlgebraicGroups:AA.3.

**Source.** bpcz: §2.4.4, (2.4.4.19), Lemmas 2.4.4.1–2.4.4.2, pp.206–208.

**Construction or proof.** 1. Compare the finite root minima with the simple-root minimum on Siegel charts. 2. Use the AA.3 finite-fiber and cusp uniqueness contract R5 for intermediate quotient maps. Restrict root characters under H to prove the subgroup inequality.

**API.**

- **parabolicDepth_positive** (projection): For P⊊Q, the finite minimum is positive and is a weight.

- **parabolicDepth_companion** (relation): The pullback of d_P^Q is bounded by a constant times the pullback of d_Q^P.

- **parabolicDepth_subgroup** (functoriality): For P∩H⊊Q∩H the specified compatible reductive subgroup map satisfies the depth inequality, with equivalence in the diagonal restriction-of-scalars case. When the intersections coincide, no finite root minimum is defined.

**Uses.** SM.2 constant-term approximation: Provides arbitrary decay in the selected cusp direction. Trace-formula consumers: Exports restriction-compatible weights without planning the trace formula.

**Unit tests.**

- **parabolicDepth_gl2** (computation): For the upper Borel B⊂GL₂, the minimum has one root: on diag(a,1) in the positive chamber it is comparable to |a|.

- **parabolicDepth_equal** (degenerate): There is no d_P^P from the finite-minimum construction; CT_P^P and the approximation theorem use their identity case.

- **parabolicDepth_res** (compatibility): For Res_{K/F}GL₂ and diagonal GL₂, the root depth agrees up to constants using normalized adelic absolute values.

**Check.** No universal arbitrary-subgroup inequality is asserted without compatibility of the parabolics and radicals.

**Planet.** Parabolic depth.

### SM.2/quotient-xi — The quotient Harish-Chandra volume function

Choose a compact identity neighborhood U⊂G(𝔸) and define Ξ_P(x)=vol_{[G]_P}(xU)^{−1/2}. Different U give equivalent positive weights. One has Ξ_P≍d_{P,ρ₀}, Ξ_P≪n_P^N for some N, and ∫_[G]_P Ξ_P(x)²σ_P(x)^{−d₀}dx<∞ for some d₀≥0. This is the quotient volume function; it is different from the local spherical Harish-Chandra Ξ of a real or p-adic group.

**Dependencies.** AutomorphicSpectralTheoryPartII:SM.2/franke-weights; AdelicAlgebraicGroups:AA.3/siegel-set-finite-measure; AdelicAlgebraicGroups:AA.3.

**Source.** bpcz: §2.4.5, (2.4.5.23)–(2.4.5.25), p.208; Lapid §2, (9).

**Construction or proof.** 1. Compare orbit-neighborhood volumes on Siegel charts and use finite multiplicity of the cover. 2. Integrate the remaining chamber polynomial against a sufficiently negative power of 1+log n_P.

**API.**

- **quotientXi_change_neighborhood** (equivalence): Changing U changes Ξ_P by uniform positive factors.

- **quotientXi_franke** (compatibility): Ξ_P≍d_{P,ρ₀} with the chosen quotient measure.

- **quotientXi_integrable** (data): A sufficiently negative logarithmic power makes Ξ_P² integrable.

**Uses.** SM.2 weighted Sobolev: Gives the point-evaluation norm. SM.2 C-space: Fixes the Harish-Chandra decay scale.

**Unit tests.**

- **quotientXi_compact** (example): On a compact quotient, Ξ_P is bounded above and below by positive constants.

- **quotientXi_measure_scale** (computation): Scaling the quotient measure by c>0 scales Ξ_P by c^{−1/2}.

- **quotientXi_cusp** (non-example): On the modular cusp, Ξ_G grows like y^{1/2}; replacing it by the constant 1 loses the cusp volume factor.

**Check.** The exponent d₀ is existential and need not be sharp.

**Planet.** Quotient Harish-Chandra function.

### SM.2/slf-representations — Smooth LF representations

An adelic SLF representation V is a smooth G(𝔸_f)-representation with V=⋃_J V^J; each V^J has an SF Fréchet representation structure for G∞, the inclusions for J′⊂J are closed topological embeddings, and V has their locally convex inductive-limit topology. The group action and stage transitions must be compatible. Use AF.1 for SF representations. A closed invariant subspace with its induced topology is SLF; continuous equivariant maps with closed image induce topological isomorphisms from the quotient by their kernels onto the image. A map need not be injective merely because its image is closed. The Schwartz action extends the compactly supported action and V∞=S(G(𝔸))·V for an F-representation before taking smooth vectors.

**Dependencies.** AutomorphicSpectralTheoryPartII:SM.1/adelic-schwartz-adapter; AutomorphicFormsOnReductiveGroups:AF.1/sf-representation; AutomorphicFormsOnReductiveGroups:AF.1/dixmier-malliavin; AutomorphicSpectralTheory:AS.0/nuclear-lf-space; AutomorphicSpectralTheory:AS.0.

**Source.** bpcz: §§2.5.3–2.5.4, (2.5.3.2), Lemma 2.5.4.1, pp.209–211.

**Construction or proof.** 1. Fix a compact open K_f and decompose the smooth finite-place action into its countably many K_f-isotypical summands. Each summand is a closed complemented Fréchet subspace of some V^J, and a fixed J admits only finitely many of these types. 2. Compact averaging projections preserve a closed invariant subspace, so its induced topology agrees with the locally convex direct sum of its closed isotypical Fréchet pieces, as in Lemma 2.5.4.1. Apply Fréchet open mapping to the quotient-to-image map on these pieces and reassemble the direct sum. Extend the integrated action and use AF.1 factorization; no closed-subspace theorem for arbitrary strict LF spaces is invoked.

**API.**

- **slf_fixedLevel** (projection): The inclusion of V^J is a closed topological embedding with its specified SF topology.

- **slf_closedSubspace** (constructor): A closed invariant subspace inherits the SLF structure and its induced topology.

- **slf_schwartz_action** (compatibility): Schwartz integration agrees with the compact action and respects all level transitions.

**Uses.** SM.2 quotient spaces: Packages the level-indexed smooth representations. SM.3 support projections: Promotes fixed-level closed images to LF subspaces.

**Unit tests.**

- **slf_real_only** (compatibility): With trivial finite-adelic factor, SLF reduces to the given SF Fréchet representation.

- **slf_compact_level** (example): For the trivial one-dimensional representation, every fixed-level space is ℂ and every transition is the identity; the SLF conditions hold.

- **slf_zero_map** (non-example): The zero map from a nonzero SLF representation has closed image but is not an embedding; the quotient-to-image statement handles it correctly.

**Check.** Closed image implies an embedding only after adding injectivity, or after quotienting the kernel.

### SM.2/weighted-l2 — Smooth vectors in weighted L²

For a weight w let L²_w([G]_P)=Lp(ℂ,2,w,dx), using the almost-everywhere quotient. Right translation is a continuous moderate representation; its smooth vectors at level J consist exactly of the smooth right-J-invariant functions with R(X)φ∈L²_w for every X∈U(g∞), topologized by those derivative norms. Put L²_{N,w}=L²_{n_P^Nw} and L²_{σ,d,w}=L²_{σ_P^dw}. Pointwise representatives are the unique smooth representatives, not arbitrary representatives of Lp classes. Integration pairs L²_w with L²_{w^{-1}} sesquilinearly.

**Dependencies.** AutomorphicSpectralTheoryPartII:SM.2/weights; AutomorphicSpectralTheoryPartII:SM.2/slf-representations; mathlib:MeasureTheory.Lp.

**Source.** bpcz: §2.5.5, pp.211–212.

**Construction or proof.** 1. Use the polynomial translation estimate for w to bound the translation operators and differentiate the orbit map distributionally. 2. Apply local elliptic/Sobolev regularity to recover a smooth representative from all weighted derivative norms.

**API.**

- **weightedL2_smooth_iff** (characterisation): Smooth vectors at J are exactly the right-J smooth functions with all derivative norms finite.

- **weightedL2_weight_mono** (functoriality): w≤Cw′ gives continuous inclusion L²_{w′}→L²_w and its smooth-vector version.

- **weightedL2_pairing** (compatibility): The integral pairing extends continuously between the reciprocal-weight Hilbert spaces.

**Uses.** SM.2 S and C descriptions: Defines the projective systems of weighted smooth Hilbert spaces. SM.3 kernel regularization: Pairs smoothed distributions with reciprocal weights.

**Unit tests.**

- **weightedL2_one** (compatibility): w=1 gives the AA quotient L² and its usual smooth vectors.

- **weightedL2_direction** (non-example): On ℝ with n(x)=1+|x|, (1+|x|)^{−1} belongs to unweighted L² but not L²_{n²}; the inclusion direction cannot be reversed.

- **weightedL2_ae** (characterisation): Changing a measurable representative on a null set does not change its Hilbert vector; point evaluation uses the smooth representative only.

**Check.** Increasing N strengthens integrability because n_P≥1.

**Planet.** Smooth weighted L² spaces.

### SM.2/sobolev-evaluation — Weighted Sobolev evaluation and smoothing

At each finite level J and for every weight w there is a continuous seminorm q on L²_w([G]_P)^{∞,J} such that |φ(x)|≤q(φ)Ξ_P(x)w(x)^{−1/2} for all x. Every continuous functional T on smooth L²_w and every f∈S(G(𝔸)) is regularized to a smooth vector in L²_{w^{-1}}, characterized by T(R(f)ψ)=⟨ψ,φ⟩_P with the adjoint/inversion convention fixed by this equality. The map is continuous on fixed Schwartz stages.

**Dependencies.** AutomorphicSpectralTheoryPartII:SM.2/weighted-l2; AutomorphicSpectralTheoryPartII:SM.2/quotient-xi; AutomorphicSpectralTheoryPartII:SM.1/adelic-schwartz-adapter; AdelicAlgebraicGroups:AA.3.

**Source.** bpcz: §2.5.5, (2.5.5.4)–(2.5.5.5), p.211; Bernstein §3.4, key lemma, pp.686–688.

**Construction or proof.** 1. Apply the local Sobolev inequality to xU and use compact-translate comparability of w; the inverse square-root volume is exactly Ξ_P. 2. Bound T by finitely many weighted derivative norms, move derivatives onto f and use Riesz duality and Schwartz decay.

**Check.** The level and weight may change q; no uniform q over all weights is asserted.

### SM.2/nuclear-inclusion — Nuclear weighted inclusions

There exists d₀≥0 depending only on the quotient geometry such that for every compact open J and every weight w the inclusion L²_{σ,d₀,w}([G]_P)^{∞,J}→L²_w([G]_P)^{∞,J} is nuclear. Hence an unconditionally summable family in the source becomes absolutely summable in every continuous target seminorm. Nuclearity concerns the smooth Fréchet spaces; it does not assert that the zeroth-order weighted Hilbert inclusion alone is nuclear.

**Dependencies.** AutomorphicSpectralTheoryPartII:SM.2/sobolev-evaluation; AutomorphicSpectralTheoryPartII:SM.2/quotient-xi; AutomorphicSpectralTheory:AS.0/nuclear-lf-space.

**Source.** bpcz: §2.5.5, Proposition 2.5.5.1, pp.211–212; Bernstein §3.4–3.5, pp.688–689.

**Construction or proof.** 1. Use the Ξ²σ^{-d} integrability and sufficiently many extra derivatives to obtain a Hilbert–Schmidt inclusion between suitable Hilbert completions. 2. Factor a stronger smooth seminorm inclusion through two Hilbert–Schmidt inclusions, using current OperatorIdeals for their composition; import AS.0 nuclear-map and summable-family consequences.

**Check.** The existence of d₀ is uniform in w and J, while the particular seminorm factorizations may depend on them.

**Planet.** Nuclear weighted inclusions.

### SM.2/rapid-continuous — Zeroth-order rapid spaces

S₀([G]_P) consists of measurable functions with sup_x n_P(x)^N|φ(x)|<∞ for every N≥0; use actual functions for these suprema. S₀⁰ is its subspace of continuous functions with the same Fréchet seminorms. The continuous subspace is an F-representation. The full measurable S₀ is an auxiliary locally convex space; its translation action is not asserted strongly continuous. Compact smooth functions embed into both.

**Dependencies.** AutomorphicSpectralTheoryPartII:SM.2/weights.

**Source.** bpcz: §2.5.6, p.212.

**Construction or proof.** 1. Construct the weighted uniform seminorm topology and show completeness; use uniform continuity on compact sets and tail decay for continuity of translation on S₀⁰.

**API.**

- **rapidZero_mem_iff** (characterisation): Membership is boundedness in every zeroth-order height seminorm.

- **rapidContinuous_closed** (structure): S₀⁰ is the closed continuous-function subspace with the induced Fréchet topology.

- **rapidContinuous_smooth** (compatibility): Smooth vectors with derivative seminorms agree with the quotient Schwartz space of the next target.

**Uses.** SM.2 constant-term estimate: The majorizing seminorm is allowed to depend only on S₀ norms. SM.2 Schwartz space: Provides the F-representation whose smooth vectors define S.

**Unit tests.**

- **rapidZero_compact_indicator** (example): The indicator of a compact measurable set belongs to S₀, even if it is discontinuous and hence not in S₀⁰.

- **rapidZero_compact_quotient** (degenerate): On a compact quotient these are bounded measurable and continuous functions respectively; the derivative requirements have not yet been imposed.

- **rapidZero_tail** (non-example): On a noncompact cusp, a function comparable to n_P^{−2} along an unbounded sequence is not in S₀.

**Check.** The smooth vectors of S₀⁰ supply the next node, while measurable S₀ supplies the constant-term majorant.

### SM.2/quotient-schwartz — Schwartz functions on automorphic quotients

S([G]_P) is the smooth adelic space of functions with q_{N,X}(φ)=sup_x n_P(x)^N|R(X)φ(x)|<∞ for every N≥0 and X∈U(g∞). At fixed J it is nuclear Fréchet; over J it is strict LF. It identifies topologically with (S₀⁰)^∞ and with ⋂_{N>0}L²_{n_P^N}^{∞}, using the projective smooth topology. It is dense in every smooth L²_w space. This quotient space is distinct from the test-function convolution algebra S(G(𝔸)); the latter acts on it by right convolution.

**Dependencies.** AutomorphicSpectralTheoryPartII:SM.2/rapid-continuous; AutomorphicSpectralTheoryPartII:SM.2/sobolev-evaluation; AutomorphicSpectralTheoryPartII:SM.2/nuclear-inclusion.

**Source.** bpcz: §2.5.7, pp.212–213; §2.5.12, p.215.

**Construction or proof.** 1. Use the quotient Ξ polynomial bound and integrability to compare supremum and all weighted L² derivative seminorms. 2. Use smooth cutoffs and regularization for density; import strict-LF smooth-vector results from AS.0.

**API.**

- **quotientSchwartz_l2** (equivalence): The topological intersection of smooth weighted L² spaces is S([G]_P).

- **quotientSchwartz_convolution** (structure): The test-function algebra acts continuously and preserves S at controlled levels.

- **quotientSchwartz_dense** (relation): S is dense in every smooth weighted L² space and in C([G]_P).

**Uses.** SM.3 support projections: Absolute summability is strongest on S. SM.3 kernel bounds: Smoothed Dirac distributions yield kernels controlled by S seminorms.

**Unit tests.**

- **quotientSchwartz_compact** (compatibility): On a compact quotient S is the usual smooth adelic space, with its level LF topology.

- **quotientSchwartz_compact_support** (example): Every compactly supported smooth function belongs to S.

- **quotientSchwartz_cusp_tail** (non-example): On the modular cusp a nonzero function with polynomial tail y^{−a} fails S, even if a is large enough for L².

**Check.** The quantifiers are all derivatives and all decay exponents, rather than one exponent chosen after each derivative.

**Planet.** Quotient Schwartz space.

### SM.2/harish-chandra-schwartz — Harish-Chandra Schwartz functions on quotients

C([G]_P) consists of smooth functions with sup_x Ξ_P(x)^{-1}σ_P(x)^d|R(X)φ(x)|<∞ for every d≥0 and X. At each J it is nuclear Fréchet and equals ⋂_{d>0}L²_{σ_P^d}^{∞,J} topologically; its level union is strict LF. The inclusion S([G]_P)→C([G]_P) is continuous with dense image. This is the global quotient Harish-Chandra space, with logarithmic decay relative to Ξ_P.

**Dependencies.** AutomorphicSpectralTheoryPartII:SM.2/quotient-xi; AutomorphicSpectralTheoryPartII:SM.2/nuclear-inclusion; AutomorphicSpectralTheoryPartII:SM.2/quotient-schwartz.

**Source.** bpcz: §2.5.8, p.213; §2.5.12, p.215; Lapid §2.

**Construction or proof.** 1. Apply the Sobolev inequality and Ξ²σ^{-d₀} integrability in both directions to compare the weighted derivative topologies. 2. Use cutoffs with derivatives controlled in logarithmic radial coordinates for density and completeness.

**API.**

- **harishChandraSchwartz_l2** (equivalence): C is the projective intersection of smooth logarithmically weighted L² spaces.

- **harishChandraSchwartz_level** (structure): Each fixed-level space is nuclear Fréchet and the inclusions are closed.

- **harishChandraSchwartz_height** (compatibility): The S→C map is continuous and dense, with the precise height-to-logarithm loss.

**Uses.** SM.3 Lapid expansion: The spectral wave-packet theorem takes φ in C. SM.3 regular constant term: The target of the damped Levi constant term is C.

**Unit tests.**

- **harishChandraSchwartz_compact** (compatibility): On a compact quotient C=S=C∞ at each level.

- **harishChandraSchwartz_log_tail** (non-example): A tail Ξ_Pσ_P^{−a} for a fixed a fails C whenever σ_P is unbounded.

- **harishChandraSchwartz_gaussian_log** (example): A smooth cutoff times Ξ_P exp(−σ_P^{1/2}) in a modular cusp lies in C but has no arbitrary algebraic-height decay; use a smooth equivalent Ξ representative for this test.

**Check.** The Ξ factor is in the denominator of the defining seminorm.

### SM.2/tempered-measures — Polynomially weighted measures

T₀,w([G]_P) is the Banach space of complex Radon measures μ with ∫w^{-1}d|μ|<∞. T₀=⋃_{N≥0}T₀,n_P^N has its locally convex inductive-limit topology, which need not be strict; it identifies with the continuous sesquilinear dual of S₀⁰ using the conjugation convention of the integral pairing. Measures are not assumed absolutely continuous. Translation is bounded locally uniformly in the group variable, but is not in general strongly continuous in weighted total variation. Define convolution on measures by integration against test functions, and take norm-smooth orbit vectors only where that regularity holds. If w is bounded on supp μ then R(f)μ belongs to S_w for every Schwartz f, with the compatible continuous smoothing estimates.

**Dependencies.** AutomorphicSpectralTheoryPartII:SM.2/rapid-continuous; AutomorphicSpectralTheoryPartII:SM.2/weights; AutomorphicSpectralTheoryPartII:SM.1/adelic-schwartz-adapter.

**Source.** bpcz: §2.5.9, pp.213–214; Lemma 2.5.11.1, p.215.

**Construction or proof.** 1. Use weighted total variation for the Banach stages and the Riesz representation theorem on the weighted continuous rapid space. 2. Move the Schwartz kernel against the measure, compare translation of weights, and choose one polynomial height loss controlling all w-decay exponents.

**API.**

- **temperedMeasure_dirac** (constructor): δ_y lies in every T₀,w and has norm w(y)^{-1}.

- **temperedMeasure_pairing** (equivalence): The continuous dual of S₀⁰ is T₀ with the indicated pairing and nonstrict inductive-limit structure.

- **temperedMeasure_smoothing** (compatibility): If w is bounded on the support, R(f)μ is in S_w; compact support is a sufficient special case.

**Uses.** SM.3 kernel construction: The vector δ_y regularizes to the kernel column. SM.2 partial Schwartz: Smoothing distributions supported where w is bounded supplies S_w vectors.

**Unit tests.**

- **temperedMeasure_dirac_norm** (computation): For μ=cδ_y the weighted total-variation norm equals |c|/w(y).

- **temperedMeasure_not_density** (non-example): A Dirac measure on a positive-dimensional quotient is allowed, despite having no L² density. At weight 1 distinct point masses have total-variation distance 2, so a moving Dirac orbit is not norm-continuous.

- **temperedMeasure_compact** (compatibility): On a compact quotient T₀ is precisely the finite complex Radon measures, not all distributions of positive order.

**Check.** The reciprocal weight in the norm is essential for duality.

### SM.2/weighted-growth — Weighted uniform derivative growth

For a weight w, T_w([G]_P) consists of smooth functions with sup_x w(x)^{-1}|R(X)φ(x)|<∞ for every X, at fixed J with its Fréchet topology and then its strict level LF topology. Import T([G]_P)=⋃_N T_{n_P^N} from AF.0/uniform-moderate-growth-space: a single exponent N controls all derivatives, with constants depending on X. Give the comparison T=⋃_N(L²_{n_P^{-N}})^∞=⋃_N(T₀,n_P^N)^∞ with its specified nonstrict union topology. These unions do not assert equality at the same N in every comparison.

**Dependencies.** AutomorphicFormsOnReductiveGroups:AF.0/uniform-moderate-growth-space; AutomorphicSpectralTheoryPartII:SM.2/tempered-measures; AutomorphicSpectralTheoryPartII:SM.2/weighted-l2; AutomorphicSpectralTheoryPartII:SM.2/sobolev-evaluation.

**Source.** bpcz: §2.5.10, p.214; §2.5.11, p.215.

**Construction or proof.** 1. Compare weighted suprema and weighted derivative L² norms, allowing the fixed polynomial loss from Ξ and volume. 2. For the measure comparison differentiate the weakly regularized kernels and identify norm-smooth vectors with smooth densities having the required weighted L¹ derivatives, with one common height loss. Do not apply an F-representation theorem to the full total-variation measure space. Apply Dixmier–Malliavin on the genuine smooth function stages; retain the AF carrier and topology instead of constructing T again.

**API.**

- **weightedGrowth_deriv** (structure): R(X) acts continuously on T_w with the derivative seminorms.

- **weightedGrowth_mono** (functoriality): w≪w′ gives continuous inclusion T_w→T_w′.

- **uniformGrowth_l2_union** (compatibility): The AF uniform-growth space has the stated weighted smooth-L² and smoothed-measure descriptions, with an allowed common height loss.

**Uses.** SM.3 spectral components: Absolute convergence may require a single extra exponent N₀. SM.2 approximation theorem: The original function lies in a fixed T_N stage.

**Unit tests.**

- **weightedGrowth_one** (computation): T₁ consists of smooth functions with every derivative bounded; constants belong to it.

- **uniformGrowth_quantifier** (non-example): On the modular cusp y→∞, with height comparable to y, exp(i y²) has derivatives of degree 2k under the invariant derivative (y d/dy)^k and fails T; choosing a new exponent for every derivative would wrongly admit it.

- **weightedGrowth_density** (non-example): On a noncompact quotient the constant 1 cannot be approximated in the T₁ supremum seminorm by compactly supported smooth functions.

**Check.** S is dense in T as a union; it need not be dense in a fixed T_w. The measure-side smooth-vector comparison must survive the failure of strong continuity on all Radon measures.

### SM.2/partial-schwartz — Schwartz decay relative to a weight

For a weight w and N≥0 let S_{w,N} be the smooth functions satisfying sup_x n_P(x)^{−N}w(x)^r|R(X)φ(x)|<∞ for every r≥0 and X. Define S_w=⋃_N S_{w,N} with its nonstrict locally convex union topology. The order of quantifiers is ∃N∀r∀X. Equivalently S_w=⋃_N⋂_{r≥0}(L²_{n_P^{-N}w^r})^∞, allowing an adjustment of N between the two descriptions. At each fixed N,J the displayed seminorms give the Fréchet topology.

**Dependencies.** AutomorphicSpectralTheoryPartII:SM.2/weighted-growth; AutomorphicSpectralTheoryPartII:SM.2/weighted-l2.

**Source.** bpcz: §2.5.11 and Lemma 2.5.11.1, pp.214–215.

**Construction or proof.** 1. Compare suprema and L² norms using Ξ and its polynomial-height bound; the shift in N is independent of r. 2. Check directed level/height inclusions and apply the tempered-measure smoothing estimate.

**API.**

- **partialSchwartz_l2** (equivalence): The weighted smooth-L² description holds with one height loss independent of r.

- **partialSchwartz_mono** (functoriality): A bounded comparison w≪w′ gives S_w′⊂S_w with the corresponding seminorm estimates.

- **partialSchwartz_smooth_measure** (constructor): For μ∈T₀ and w bounded on supp μ, right convolution by any test Schwartz f gives an element of S_w.

**Uses.** SM.3 support projections: The convergence theorem permits an extra common polynomial loss. SM.2 smoothing: Weights bounded on distribution support generate these spaces.

**Unit tests.**

- **partialSchwartz_one** (compatibility): For w=1, S_w is the AF uniform moderate-growth space T.

- **partialSchwartz_height** (compatibility): For w=n_P, the underlying function space S_w is S([G]_P), since all positive height powers must decay.

- **partialSchwartz_constant** (non-example): If w=n_P and n_P is unbounded, 1 is not in S_w, although it is in T₁.

**Check.** A family needing N to grow with r is not in S_w.

### SM.2/nuclear-tensor-products — Nuclearity and product decompositions

For each finite level J the spaces S([G]_P)^J and C([G]_P)^J are nuclear Fréchet. For two quotient data and product finite level J₁×J₂, multiplication of pure tensors induces topological isomorphisms S(X₁)^J₁⊗̂πS(X₂)^J₂≅S(X₁×X₂)^{J₁×J₂}, and the analogous C isomorphism. Use compatible product heights and product quotient-volume functions. Continuous sesquilinear or bilinear forms extend by the corresponding completed projective universal property. Passing to all levels must be checked through the strict stage system.

**Dependencies.** AutomorphicSpectralTheoryPartII:SM.2/quotient-schwartz; AutomorphicSpectralTheoryPartII:SM.2/harish-chandra-schwartz; AutomorphicSpectralTheoryPartII:SM.2/nuclear-inclusion; AutomorphicSpectralTheory:AS.0/projective-tensor.

**Source.** bpcz: §2.5.12, (2.5.12.10)–(2.5.12.11), p.215.

**Construction or proof.** 1. Apply the nuclear smooth inclusions to the projective-limit seminorm systems. 2. Prove density of product smooth functions and identify all product derivative seminorms; use the existing AS.0 completed tensor theory.

**Check.** The result is a completed topological tensor product, including for more than one real place.

### SM.2/constant-term-extensions — Constant terms and pseudo-Eisenstein extensions

For P⊂Q extend the existing AF.3 constant term CT_P^Q and AS.1 pseudo-Eisenstein EP_P^Q to the following spaces, with their established normalized measures: EP:S₀([G]_P)→S₀([G]_Q), CT:T₀([G]_Q)→T₀([G]_P), EP:S([G]_P)→S([G]_Q), and CT:T_N([G]_Q)→T_N([G]_P). They are adjoint under the integral pairing. There is c>0 such that for every N≥0, φ↦sup_x δ_P^Q(x)^{cN}n_P(x)^N|CT_P^Qφ(x)| is a continuous seminorm on S₀([G]_Q). This weighted estimate does not assert unweighted rapid decay of CTφ along all split-central directions.

**Dependencies.** AutomorphicSpectralTheoryPartII:SM.2/quotient-schwartz; AutomorphicSpectralTheoryPartII:SM.2/tempered-measures; AutomorphicSpectralTheoryPartII:SM.2/weighted-growth; AutomorphicFormsOnReductiveGroups:AF.3/constant-term; AutomorphicSpectralTheory:AS.1.

**Source.** bpcz: §2.5.13 and Lemma 2.5.13.1, pp.215–216.

**Construction or proof.** 1. Use compactness of the adelic unipotent quotient for CT and finite-overlap estimates for EP; derive the weighted estimate on Siegel domains. 2. Extend by the measure pairing and integrate by parts for derivatives, agreeing with the already owned operators on compact vectors.

**Check.** For P=Q both operators are the identity; δ_P^P=1.

### SM.2/constant-term-approximation — Approximation by constant terms

For proper P⊊Q, every N>0,r≥0 and X∈U(g∞), there is a continuous seminorm q on T_N([G]_Q) at each fixed level such that |R(X)(φ−CT_P^Qφ)(x)|≤n_P(x)^N d_P^Q(x)^{−r}q(φ) for all x in the common intermediate quotient. If φ∈L²_w([G]_Q)^∞, there is N>0 such that for every r≥0 the integral over A_Q∞ of |φ(ax)−CT_P^Qφ(ax)|² w(a)δ_Q(a)^{−1}da is ≪_r n_P(x)^N d_P^Q(x)^{−r}. In the integral bound the single N is chosen before all r; the notation w(a) uses the restricted A_Q weight in this assertion.

**Dependencies.** AutomorphicSpectralTheoryPartII:SM.2/constant-term-extensions; AutomorphicSpectralTheoryPartII:SM.2/cusp-neighborhoods; AutomorphicSpectralTheoryPartII:SM.2/weighted-l2.

**Source.** bpcz: §2.5.14, Proposition 2.5.14.1, pp.216–218.

**Construction or proof.** 1. Expand a zero-constant-term function on the compact adelic unipotent quotient and integrate by parts repeatedly to gain arbitrary parabolic depth decay. 2. Use weighted Sobolev control and reduction-theory fiber bounds, choosing the height exponent once before the repeated depth estimates.

**Check.** At a cusp with zero constant term, arbitrary depth decay follows; the theorem does not compare unrelated parabolics.

### SM.2/weighted-constant-term — Weighted constant-term decomposition

For P⊂Q and a weight w on [G]_Q there are weights w_P^−,w_P^+ on [G]_P, comparable with w in the deep P-cusp, for which CT_P^Q:L²_w→L²_{w_P^−} and EP_P^Q:L²_{w_P^+}→L²_w are continuous, including their smooth-vector maps. For weights w,w′ with comparable restrictions w|A_Q∞≍w′|A_Q∞, if w′≪w the map φ↦((CT_P^Qφ)_{P⊊Q},φ) is a closed embedding of smooth L²_w into the product of the proper-parabolic weighted smooth spaces and smooth L²_w′. Under the dual comparison w≪w′, the corresponding sum of EP maps and the identity inclusion is an open surjection onto smooth L²_w. State the choices of weights and comparison constants explicitly at each finite level.

**Dependencies.** AutomorphicSpectralTheoryPartII:SM.2/constant-term-approximation; AutomorphicSpectralTheoryPartII:SM.2/weights; AutomorphicSpectralTheoryPartII:SM.2/slf-representations; AutomorphicSpectralTheory:AS.0/nuclear-lf-space; AutomorphicSpectralTheory:AS.0.

**Source.** bpcz: §2.5.15, Proposition 2.5.15.1 and Corollary 2.5.15.2, pp.218–221.

**Construction or proof.** 1. Construct upper and lower weights by separating the deep-cusp and complementary regions using the approximation estimate. 2. Use a partition across parabolic cusp regions to control the graph norm, then apply Fréchet duality/open mapping to the adjoint sum.

**Check.** Include the identity component; the collection of constant terms alone loses cusp forms.

## SM.3. Schwartz spectral decompositions and automorphic kernels

Extend the existing cuspidal-data decomposition to the weighted function spaces, with exact summability and common-height-loss quantifiers. Prove Schwartz relative-character convergence, Arthur factorization, regular constant-term bounds and the GL_n regular-data Lapid expansion. Extend automorphic kernels and their grouped Eisenstein spectral expansions to Schwartz tests with uniform weight bounds.

### SM.3/relative-characters — Relative characters of Schwartz functions

Let π be a discrete automorphic representation of a Levi, A_{P,π}(G) its smooth induced space, B a continuous sesquilinear form on that space, and Ω a compact subset of a_P^{G,*}. For f∈S(G(𝔸)) and a K-orthonormal basis 𝔅, Σ_{v∈𝔅}I_P(λ,f)v⊗overline(v) converges absolutely in A_{P,π}⊗̂π overline(A_{P,π}), uniformly on Re λ∈Ω. The resulting tensor and J_B(λ,f)=Σ_v B(I_P(λ,f)v,v) are basis independent. For each fixed finite support/level stage there is a continuous seminorm p with |J_B(λ,f)|≤p(f) throughout that strip. The functional also extends to C_c^r at sufficiently large r, with derivative degree bounded by r. The basis is a union of finite-dimensional K-type orthonormal bases.

**Dependencies.** AutomorphicSpectralTheoryPartII:SM.1/adelic-schwartz-adapter; AutomorphicSpectralTheory:AS.0/projective-tensor; AutomorphicFormsOnReductiveGroups:AF.1; AutomorphicSpectralTheory:AS.4/residual-spectrum.

**Source.** bpcz: §2.8.4, Proposition 2.8.4.1 and Remark 2.8.4.2, pp.227–229.

**Construction or proof.** 1. Use compact-picture induction and polynomial bounds for K-type dimensions and seminorms in terms of the compact Casimir, as requested in R4; use AS.4 for the discrete inducing representation. 2. Move arbitrarily high powers of the compact Casimir to f and sum their inverse powers over K-types; all seminorm estimates are uniform in the imaginary parameter on the indicated real strip. 3. Apply the completed tensor universal property to B; finite-dimensional invariance on each type proves basis independence.

**Check.** The second tensor factor is the conjugate space, as required for a sesquilinear B. A compact real-part range still allows an unbounded imaginary parameter.

**Planet.** Schwartz relative characters.

### SM.3/arthur-factorization — Arthur’s finite differentiability factorization

Fix a normal compact open K₀⊂K_f and m≥1. There exist Z∈U(g∞), g₁∈C_c∞(G(𝔸)) and g₂∈C_c^m(G(𝔸)), all invariant under K∞-conjugation and g_i bi-K₀-invariant, such that every bi-K₀ Schwartz f satisfies f=f*g₁+(f*Z)*g₂. For m sufficiently large, J_B(λ,f) equals the sum of the two absolutely convergent basis sums B(I_P(λ,f)v,I_P(overline λ,g₁^∨)v) and B(I_P(λ,f*Z)v,I_P(overline λ,g₂^∨)v), where g^∨(x)=overline(g(x^{-1})). The choice of Z,g_i depends on K₀,m and not on f; K∞-invariance of Z does not assert that Z is central in U(g∞).

**Dependencies.** AutomorphicSpectralTheoryPartII:SM.3/relative-characters; AutomorphicFormsOnReductiveGroups:AF.1/dixmier-malliavin; AutomorphicSpectralTheory:AS.6.

**Source.** bpcz: §2.8.4, Proposition 2.8.4.3, p.229; Arthur 1978, Lemma 4.1 and Corollary 4.2 as cited in its proof.

**Construction or proof.** 1. Use the exact finite differentiability factorization requested in R12, a strengthening of generic Dixmier–Malliavin with the required K-conjugation invariance. 2. Apply the factorization to induced operators, move g_i to the second slot, and use finite-dimensional K-type traces before taking the absolutely convergent total sum.

**Check.** The second slot uses overline λ and conjugate inversion of the function, matching the linear-first Hermitian pairing.

**Planet.** Arthur factorization.

### SM.3/cuspidal-support — Cuspidal support in weighted function spaces

Import X(G), the Weyl-associate normalized cuspidal data, from AS.1/cuspidal-datum-space, and its orthogonal decomposition from AS.4. If a weight factors through A_P∞, define L²_{w,X} as the orthogonal sum of the blocks indexed by X⊂X(G); these projections agree for different such weights on intersections. Define S_X=S∩L²_X. For an arbitrary quotient weight and F∈{L²_w,C,T_N,T,S_{w,N},S_w}, define F_X as the annihilator of S_{Xᶜ} under the integral pairing. The notation therefore records cuspidal support, not necessarily Hilbert orthogonality for that weight. CT and EP preserve this support with the finite-to-one map X(M_P)→X(G).

**Dependencies.** AutomorphicSpectralTheory:AS.1/cuspidal-datum-space; AutomorphicSpectralTheory:AS.1; AutomorphicSpectralTheory:AS.4/spectral-orthosum; AutomorphicSpectralTheoryPartII:SM.2/constant-term-extensions; AutomorphicSpectralTheoryPartII:SM.2/partial-schwartz.

**Source.** bpcz: §§2.9.1–2.9.3, (2.9.2.1)–(2.9.2.2), Lemma 2.9.3.1, pp.229–232.

**Construction or proof.** 1. Compare the normalized cuspidal-datum convention to AS.1 rather than introducing another quotient of pairs. 2. Use the dense pseudo-Eisenstein span to compare A_P-weight projections; define arbitrary-weight support by annihilation. 3. Use CT/EP adjunction and compact A_P cutoffs to prove support compatibility.

**API.**

- **cuspidalSupport_complement** (characterisation): F_X is precisely the annihilator of S_{Xᶜ} in the indicated integral pairing.

- **cuspidalSupport_weight_independent** (compatibility): On intersections of A_P-weighted L² spaces, the original projections agree.

- **cuspidalSupport_ct_ep** (functoriality): CT and EP respect the inverse image or image of a support subset under the normalized datum map.

**Uses.** SM.3 projection theorem: Provides the target subspaces at arbitrary weights. SM.5 component isolation: Gives the interpretation of the finite surviving cuspidal blocks.

**Unit tests.**

- **cuspidalSupport_empty** (degenerate): F_∅={0}; in particular the annihilator of all S is zero.

- **cuspidalSupport_all** (degenerate): F_{X(G)}=F.

- **cuspidalSupport_two_blocks** (characterisation): For nonzero orthogonal Hilbert blocks χ₁≠χ₂ and weight 1, a vector in χ₁+χ₂ has nonzero projection onto {χ₁} unless its χ₁ component vanishes; the rule is not a zero or identity projection.

**Check.** A general weight need not make distinct support subspaces orthogonal.

### SM.3/support-projections — Continuous cuspidal-support projections

For every weight w and support subset X, the projection on S extends continuously to (L²_w)^∞→(L²_{w,X})^∞; the family of singleton components is unconditionally summable to φ in that smooth space. On S the sum is absolutely summable. The maps also extend continuously to C,T,S_w and obey ⟨φ_X,ψ⟩=⟨φ,ψ_X⟩ for T×S. There is a common height loss N₀>0 such that singleton components of φ∈T_w are absolutely summable in T_{w n_P^{N₀}}, and those of φ∈S_{w,N} in S_{w,N+N₀}; on C absolute summability holds in C. S_X is dense in C_X and smooth L²_{−N,X}. Under product quotient tensor identifications the X₁×X₂ projection is the completed tensor product of the two projections, giving S_X and C_X product isomorphisms.

**Dependencies.** AutomorphicSpectralTheoryPartII:SM.3/cuspidal-support; AutomorphicSpectralTheoryPartII:SM.2/weighted-constant-term; AutomorphicSpectralTheoryPartII:SM.2/nuclear-inclusion; AutomorphicSpectralTheoryPartII:SM.2/nuclear-tensor-products; AutomorphicSpectralTheory:AS.4/spectral-orthosum.

**Source.** bpcz: §2.9.4, Theorem 2.9.4.1, pp.232–235; (2.9.5.9)–(2.9.6.10), p.235.

**Construction or proof.** 1. Induct on parabolic semisimple rank, starting with A_P-factor weights where the Hilbert decomposition applies. 2. Use the weighted graph embedding for lower/upper comparable weights, then the EP open surjection to descend the compatible projections for general weights. 3. Use nuclear inclusions to convert unconditional sums to absolute sums and track the one common height loss. Density and product compatibility follow by applying the continuous projections to dense Schwartz vectors and pure tensors.

**Check.** Projection laws P_XP_Y=P_{X∩Y} and P_all=id hold on every common domain. Do not strengthen unconditional convergence in an arbitrary weighted L² stage to absolute convergence there without a stronger weight.

**Planet.** Cuspidal-support decomposition.

### SM.3/regular-data — Regular cuspidal data

A normalized cuspidal datum represented by (M_P,π) is regular if its stabilizer in W(P)=Norm_G(M_P)/M_P is trivial: wπ≅π implies w=1. This is independent of the chosen Weyl-associate representative. For GL_n and π=⊠_iπ_i on ∏_iGL_{n_i}, regularity means the factors of the same rank are pairwise nonisomorphic; different ranks cannot be permuted. This is not the distinct-parameter condition on a single infinitesimal character and is different from the GGP-specific starred regularity condition.

**Dependencies.** AutomorphicSpectralTheory:AS.1/cuspidal-datum-space.

**Source.** bpcz: §2.9.7, pp.235,237–238.

**Construction or proof.** 1. Transport the stabilizer by Weyl conjugation. 2. For GL_n the relative Weyl group permutes equal-size blocks, giving the explicit criterion.

**API.**

- **regularCuspidalData_iff_stabilizer** (characterisation): Regularity is triviality of the Weyl stabilizer of the normalized datum.

- **regularCuspidalData_weyl** (compatibility): Weyl-associate representatives give the same predicate.

- **regularCuspidalData_gln** (characterisation): For GL_n the condition is pairwise nonisomorphism of the equal-size cuspidal factors.

**Uses.** SM.3 regular constant term: Eliminates the nonidentity Weyl cross terms. SM.3 Lapid expansion: Ensures this support is induced from the cuspidal spectrum.

**Unit tests.**

- **regularCuspidalData_full_levi** (degenerate): Every cuspidal datum with M=G is regular.

- **regularCuspidalData_repeated** (non-example): On GL₂, a Borel datum χ⊠χ is not regular, since the transposition fixes it.

- **regularCuspidalData_distinct** (computation): On GL₂, χ₁⊠χ₂ with χ₁≄χ₂ is regular, even when their infinitesimal characters agree.

**Check.** A Levi equal to G has trivial relative Weyl group and is regular.

**Planet.** Regular cuspidal data.

### SM.3/regular-constant-term — Regular-support constant terms and holomorphy

If χ is regular, the constant term extends boundedly from L²_χ([G]) to L²_χ([G]_P), and the adjoint pseudo-Eisenstein map is bounded in the reverse direction. For φ∈S_χ([G]) and Re s>0, the Levi function m↦δ_P(m)^{s−1/2}φ_P(m) belongs to C_{χ_M}([M_P]), where χ_M is the finite inverse image support in X(M_P). The family S_χ→C_{χ_M} is holomorphic in s on Re s>0 in the locally convex sense. At the boundary Re s=0 no such C-valued assertion is made.

**Dependencies.** AutomorphicSpectralTheoryPartII:SM.3/regular-data; AutomorphicSpectralTheoryPartII:SM.3/support-projections; AutomorphicSpectralTheoryPartII:SM.2/constant-term-extensions; AutomorphicSpectralTheory:AS.0; AutomorphicSpectralTheory:AS.3.

**Source.** bpcz: §2.9.7, Proposition 2.9.7.1 and Corollary 2.9.7.2, pp.235–238.

**Construction or proof.** 1. Use the compact-data pseudo-Eisenstein inner-product formula, with the normalization comparison requested in R11, and regularity to cancel all nonidentity stabilizer terms. Compare the two Hilbert norms, extend by density, and take adjoints to obtain the L² constant-term bound within this node. 2. Combine the large-positive-s constant-term estimate with weighted Hölder interpolation to reach Re s>0; derivatives and weak holomorphy plus boundedness give locally convex holomorphy.

**Check.** The normalization exponent is s−1/2, not s or s+1/2.

### SM.3/lapid-expansion — Lapid expansion of Harish-Chandra Schwartz functions

Let G be a finite product of Res_{K_i/F}GL_{n_i} and χ a regular datum represented by (M_P,π). Write Π=I_P^Gπ. There is N>0 such that for every φ∈C([G]) and λ∈ia_P*, the series φ_{Πλ}=Σ_{v∈𝔅}⟨φ,E(v,λ)⟩ E(v,λ) is defined, basis independent, and converges absolutely in T_N([G]). The map λ↦φ_{Πλ} is Schwartz with values in T_N, using all parameter derivatives, and if φ∈C_χ then φ=∫_{ia_P*}φ_{Πλ}dλ. The exponent N is uniform in λ and φ. The statement for arbitrary reductive groups requires Lapid’s hereditary property (HP); it is not asserted unconditionally here.

**Dependencies.** AutomorphicSpectralTheoryPartII:SM.3/relative-characters; AutomorphicSpectralTheoryPartII:SM.3/regular-data; AutomorphicSpectralTheoryPartII:SM.3/support-projections; AutomorphicSpectralTheoryPartII:SM.2/harish-chandra-schwartz; AutomorphicSpectralTheory:AS.2; AutomorphicSpectralTheory:AS.3; AutomorphicSpectralTheory:AS.0/vector-schwartz.

**Source.** bpcz: §2.9.8, Theorem 2.9.8.1, pp.238–239; Lapid Theorem 4.5, p.22, Proposition 5.1, pp.22–24, Corollary 5.7, pp.25–26.

**Construction or proof.** 1. Import the exact polynomial derivative bounds for normalized intertwiners and Eisenstein series under (HP) in R8L; finite products and restriction of scalars preserve the needed GL_n contracts. 2. Factor φ by a compact smooth convolution and use the relative-character basis estimates with Lapid’s Eisenstein majorization for uniform convergence and parameter derivatives. 3. Apply the cuspidal wave-packet inversion of Lapid Theorem 4.5; regularity places the whole χ-block in its induced-from-cuspidal image.

**Check.** The theorem concerns regular cuspidal support and the displayed GL_n products; it does not assert the noncuspidal Schwartz Paley–Wiener conjecture.

**Planet.** Lapid Schwartz expansion.

### SM.3/schwartz-kernels — Schwartz convolution kernels and cuspidal parts

For f∈S(G(𝔸)) define K_{f,P}, K_{f,P,χ} as the smooth integral kernels of R_P(f) and its χ support component on the AA quotient L² spaces. Define K⁰ on the A_P∞-quotient using its δ_P^{1/2} normalization. They satisfy K⁰_{f,P,χ}(x,y)=∫_{A_P∞}K_{f,P,χ}(x,ay)δ_P(a)^{−1/2}da. This construction extends the compactly supported kernels of AS.6 and fixes its pairing convention by (R_P(f)φ)(x)=∫K_{f,P}(x,y)φ(y)dy. Smooth representatives are used; kernel columns come from regularizing δ_y with the appropriate adjoint. Derivatives in either variable agree with the corresponding left/right derivatives of f.

**Dependencies.** AutomorphicSpectralTheoryPartII:SM.3/support-projections; AutomorphicSpectralTheoryPartII:SM.2/tempered-measures; AutomorphicSpectralTheoryPartII:SM.2/sobolev-evaluation; AutomorphicSpectralTheory:AS.6.

**Source.** bpcz: §2.10.1, pp.239–240.

**Construction or proof.** 1. Use smooth regularization of point distributions, then apply the continuous support projection. 2. Apply the quotient disintegration measure to descend along A_P∞; use the weighted estimates for absolute convergence.

**API.**

- **schwartzKernel_integral** (characterisation): Integrating the kernel against a compact smooth vector recovers R_P(f) exactly.

- **schwartzKernel_support** (compatibility): Applying the χ projection to the first variable gives K_{f,P,χ} and agrees with the original compact kernel when f is compact.

- **schwartzKernel_central_quotient** (relation): The normalized A_P∞ integral gives K⁰ with factor δ_P^{−1/2}.

**Uses.** SM.3 universal bounds: Provides kernels as regularized point distributions. SM.3 spectral expansion: The same kernel is identified with the Eisenstein expansion.

**Unit tests.**

- **schwartzKernel_zero** (degenerate): For f=0 every kernel and every support component is zero.

- **schwartzKernel_trivial_group** (computation): For the group with one element and mass-one measure, the kernel is f(1) and convolution is scalar multiplication.

- **schwartzKernel_circle** (compatibility): On ℝ/ℤ with mass-one Haar measure set e_n(x)=exp(2πinx). For R(f)φ(x)=∫f(g)φ(x+g)dg and f=e_{−n}, the kernel is e_n(x)overline(e_n(y)), the orthogonal rank-one projector onto e_n. Taking f=e_n instead projects onto e_{−n}; this detects the convolution sign and normalization.

**Check.** The A_P factor is δ_P^{−1/2}; kernel and measure normalizations must be tested together.

### SM.3/kernel-bounds — Uniform bounds for cuspidal kernel parts

There exists N₀>0 such that for every weight w on [G]_P and continuous seminorm q on T_{w n_P^{N₀}} there is a continuous Schwartz seminorm p satisfying Σ_χq(K_{f,P,χ}(·,y))≤p(f)w(y)^{−1}. In particular Σ_χ|K_{f,P,χ}(x,y)|≤p(f)n_P(x)^{N₀}w(x)/w(y). The same pointwise bound holds for Σ_χ|K⁰_{f,P,χ}(x,y)| when x,y∈[G]_P¹=H_P^{-1}(0). The exponent N₀ is chosen before the weight and seminorm.

**Dependencies.** AutomorphicSpectralTheoryPartII:SM.3/schwartz-kernels; AutomorphicSpectralTheoryPartII:SM.3/support-projections; AutomorphicSpectralTheoryPartII:SM.2/sobolev-evaluation.

**Source.** bpcz: §2.10.1, Lemma 2.10.1.1, pp.239–240.

**Construction or proof.** 1. First bound R(f):T₀,w→T_{w n^{N′₀}} uniformly in w at the level of the height loss. 2. Use absolute support summability after a second fixed loss and apply the uniform boundedness principle to the family of support components. 3. Apply the resulting bound to δ_y, whose weighted variation norm is w(y)^{-1}; integrate the normalized central direction for K⁰.

**Check.** The K⁰ estimate is stated on H_P=0; simply using the same inequality for arbitrary central translates would alter the weight factors.

### SM.3/kernel-spectral-expansion — Spectral expansion of Schwartz kernels

There exist a continuous seminorm p on S(G(𝔸)) and N≥0 such that for every X,Y∈U(g∞), f∈S and x,y∈G(𝔸)¹, the sum over χ and standard P, with coefficient |𝒫(M_P)|^{−1}, of ∫_{ia_P^{G,*}}Σ_τ |Σ_{v∈𝔅_{P,χ,τ}} R_x(X)E(x,I_P(λ,f)v,λ) overline(R_y(Y)E(y,v,λ))|dλ is at most p(L(X)R(Y)f)n_G(x)^Nn_G(y)^N. Here 𝒫(M_P) is the finite set of parabolics with Levi M_P and 𝔅 is a K-basis in the discrete inducing space with support χ. For arbitrary x,y∈G(𝔸), K⁰_{f,χ}(x,y) is the sum of the same undifferentiated Eisenstein terms with those coefficients and spectral measures. The absolute value is outside the finite sum within each K-type, before summing types and integrating.

**Dependencies.** AutomorphicSpectralTheoryPartII:SM.3/kernel-bounds; AutomorphicSpectralTheoryPartII:SM.3/arthur-factorization; AutomorphicSpectralTheory:AS.4/spectral-map; AutomorphicSpectralTheory:AS.4/residual-spectrum; AutomorphicSpectralTheory:AS.6.

**Source.** bpcz: §2.10.2, Lemma 2.10.2.1, pp.240–243.

**Construction or proof.** 1. Start with the parent compact-kernel spectral identity, retaining its discrete inducing representation space and parabolic multiplicity factors. 2. Use Arthur factorization at fixed normal finite level, then positivity on the diagonal and Cauchy–Schwarz to bound the grouped K-type terms by the kernel majorant. 3. Use the uniform boundedness principle and density to pass to Schwartz f and commute group derivatives with the uniformly controlled expansion.

**Check.** Absolute convergence of the ungrouped individual basis terms is not claimed by this estimate. The derivative estimate uses x,y∈G(𝔸)¹, whereas the displayed kernel identity holds after central disintegration for general x,y.

**Planet.** Schwartz kernel spectral expansion.

## SM.4. Typical cuspidal data and finite archimedean selection

Define T-characters, CAP characters, T-multipliers and quasi-cuspidality. Use both the compact-central condition and derived Casimir condition for typical data. Obtain finite-rank Casimir values, finite typical data and sharp archimedean annihilators of all but finitely many coarse cuspidal components.

### SM.4/spectral-characters — Level and T-characters

Fix a number field F, connected reductive G/F, its maximal F-split central torus Z and unitary automorphic central character ω. Fix a finite set S of finite primes containing all ramified group and level places, K=K_S×∏_{v∉S}K_v, and a set T⊃S that may be infinite. H_G^T is the restricted tensor product of the spherical algebras at v∉T, with unit 1_{K_v} and vol(K_v)=1. A T-character χ is a character of Z(g∞)⊗H_G^T, equivalently an infinitesimal-character W-orbit χ∞ and a family of unramified characters away from T. L²_ω[χ] denotes the closed χ-eigenpart in the fixed-level Hilbert space; its cuspidal subspace is intersected with L²_cusp. The normalizations of Z, A_M∞ and unitary unramified twists are compared with AS.1–AS.4.

**Dependencies.** AdelicAlgebraicGroups:AA.2/central-character-l2; AutomorphicSpectralTheory:AS.4/hecke-central-compatibility; AutomorphicFormsOnReductiveGroups:AF.1/infinitesimal-character; SmoothRepresentationsOfLocalGroups:SR.4.

**Source.** bplzz: §3.1, Definitions 3.1–3.3, pp.21–22; §3.2, pp.23–24.

**Construction or proof.** 1. Use the existing central-character quotient and spherical Hecke algebras; form the algebraic restricted tensor with finite-support Hecke operators. 2. Use the simultaneous central/Hecke eigencondition and compare the normalized cuspidal-datum quotient through R9.

**API.**

- **tCharacter_eval_tensor** (simp): Evaluation on z⊗h is χ∞(z)χ^T(h).

- **tCharacter_restrict_places** (functoriality): For T⊂T′ restriction forgets characters at T′\T and agrees with the inclusion H_G^{T′}⊂H_G^T.

- **tCharacter_part_closed** (structure): The fixed-level χ-part is a closed invariant subspace; convolution by a Schwartz test function acts on it.

**Uses.** SM.5 mixed separation: Specifies which local data are to be preserved. SM.5 non-CAP isolation: Defines the surviving simultaneous spectral part.

**Unit tests.**

- **tCharacter_no_places** (degenerate): If T contains all finite places, H_G^T=ℂ and the character records only χ∞.

- **tCharacter_gl1** (compatibility): For GL₁, the v-character is evaluation of a Laurent polynomial at the unramified Hecke parameter.

- **tCharacter_unit** (computation): Every spherical unit evaluates to 1; multiplying finitely many such units does not change χ.

**Check.** T itself may be infinite; each Hecke operator has finite support.

**Planet.** T-characters.

### SM.4/cap-characters — CAP characters relative to T

For a fixed inner form G′ of G, a T-character χ is (G′,T)-CAP if there is a proper parabolic P′⊊G′ with Levi M′, and a cuspidal automorphic representation σ of M′(𝔸) such that at almost all v∉T the unramified representation determined by χ_v is a constituent of the normalized induction of σ_v, under the unramified inner-form identification. This is an almost-everywhere finite-place condition, independent of χ∞. Non-CAP is its negation. The inner form is a parameter, not an additional existential quantifier. For the non-CAP isolation theorem specialize G′=G and rule out proper cuspidal data of G itself.

**Dependencies.** AutomorphicSpectralTheoryPartII:SM.4/spectral-characters; AutomorphicSpectralTheory:AS.1/cuspidal-datum-space; AutomorphicFormsOnReductiveGroups:AF.2/automorphic-representation.

**Source.** bplzz: §3.1, Definition 3.4, p.22.

**Construction or proof.** 1. Fix the inner form parameter, then form the existential predicate over its parabolics and cuspidal representations. 2. Show independence of changing finitely many local identifications or ramified places; do not add an archimedean matching hypothesis.

**API.**

- **capCharacter_congr_ae** (compatibility): Changing finitely many finite-place characters does not change CAP.

- **capCharacter_proper_occurrence** (relation): If χ occurs in a proper cuspidal datum of G, it is (G,T)-CAP.

- **capCharacter_arch_independent** (characterisation): Characters with the same away-T almost-everywhere data have the same CAP status regardless of χ∞.

**Uses.** SM.5 non-CAP theorem: Rules out all proper surviving cuspidal components.

**Unit tests.**

- **capCharacter_torus** (degenerate): For a torus, fix its inner form (which is itself); there is no proper parabolic, so no character is CAP.

- **capCharacter_induced** (example): For GL₂, a character coming from induction of two Hecke characters is CAP via the Borel.

- **capCharacter_infinite_T** (non-example): When T contains every finite place and G has a proper parabolic supporting a cuspidal datum, the almost-everywhere condition is vacuous; non-CAP cannot be assumed automatically.

**Check.** Exact occurrence in a proper datum implies CAP, but CAP need not imply exact occurrence at every retained place.

**Planet.** CAP characters.

### SM.4/t-multipliers — Mixed archimedean and spherical multipliers

A T-multiplier is an element of (M♯θ)^W⊗_ℂH_G^T, acting on fixed-K test functions by the real multiplier in the archimedean factor and spherical convolution in the retained finite factors. Its action is continuous stagewise, remains bi-K-invariant, and obeys R(μ⋆f)=μ(χ)R(f) on an irreducible χ-isotypic representation. Evaluation μ(χ) is well defined on the tensor product. This algebra need not have a unit because the sharp factor may not have one; the Hecke unit alone is not an allowed T-multiplier.

**Dependencies.** AutomorphicSpectralTheoryPartII:SM.4/spectral-characters; AutomorphicSpectralTheoryPartII:SM.1/real-multiplier; AutomorphicSpectralTheoryPartII:SM.1/adelic-schwartz-adapter; AutomorphicSpectralTheoryPartII:SM.0/sharp-symbols; SmoothRepresentationsOfLocalGroups:SR.4.

**Source.** bplzz: §3.1, Definition 3.5 and discussion, pp.22–23.

**Construction or proof.** 1. Use commutation of real multipliers and finite spherical convolution to descend the action from pure tensors. 2. Use each local spectral identity and finite sums to prove the scalar action and evaluation rule.

**API.**

- **tMultiplier_eval** (simp): For a pure tensor μ∞⊗h, μ(χ)=μ∞(χ∞)h(χ^T).

- **tMultiplier_comp** (structure): (μν)⋆f=μ⋆(ν⋆f), with associativity and bilinearity; no unit axiom is added.

- **tMultiplier_representation** (compatibility): For any irreducible admissible adelic representation with the indicated characters and fixed vectors, its operator on μ⋆f is μ(χ) times its operator on f.

**Uses.** SM.5 mixed separation: Multiplies the archimedean truncation by finitely many unwanted-block annihilators. GGP trace-formula consumers: Exports spectral-preserving test functions without developing transfer or period identities.

**Unit tests.**

- **tMultiplier_zero** (degenerate): The zero multiplier kills every test function.

- **tMultiplier_sharp_seed** (non-example): For a compact real torus, 1⊗h does not generally define a T-multiplier, whereas μ∞⁰⊗h with a sharp μ∞⁰ does.

- **tMultiplier_tensor_value** (computation): If μ∞(χ∞)=2 and h(χ^T)=3, then (μ∞⊗h)(χ)=6.

**Check.** All finite-place support changes remain finite, even for infinite T.

**Planet.** T-multipliers.

### SM.4/quasi-cuspidal — Quasi-cuspidal Schwartz test functions

For the fixed (G,Z,ω,K), a bi-K Schwartz test function f is quasi-cuspidal if R(f) maps the entire Hilbert space L²_ω([G]/K) into its closed cuspidal subspace. This is a property of the integrated operator on that quotient and central character. It does not require every local constant term of f to vanish, nor does it quantify over all central characters.

**Dependencies.** AutomorphicSpectralTheoryPartII:SM.4/spectral-characters; AutomorphicFormsOnReductiveGroups:AF.3/cuspidal-spectrum-discrete.

**Source.** bplzz: §3.1, Definition 3.2, p.22.

**Construction or proof.** 1. Use the range inclusion in the existing closed cuspidal Hilbert subspace. 2. Express equivalently that the orthogonal projection onto the cuspidal complement composed with R(f) is zero.

**API.**

- **quasiCuspidal_iff_projection** (characterisation): f is quasi-cuspidal iff (1−P_cusp)R(f)=0.

- **quasiCuspidal_add** (structure): The quasi-cuspidal functions form a complex vector subspace of the fixed-level Schwartz algebra.

- **quasiCuspidal_convolution** (relation): If f is quasi-cuspidal then f*g is quasi-cuspidal for a compatible test function g; for g*f use invariance of the cuspidal subspace.

**Uses.** SM.5 non-CAP theorem: The resulting convolution functions are quasi-cuspidal. Relative trace-formula consumers: Supplies the precise operator hypothesis used by the comparison theorem.

**Unit tests.**

- **quasiCuspidal_zero** (degenerate): The zero test function is quasi-cuspidal.

- **quasiCuspidal_anisotropic** (example): If G/Z is anisotropic over F, all the automorphic L² spectrum is cuspidal, so every fixed-level Schwartz function is quasi-cuspidal.

- **quasiCuspidal_gl2** (non-example): For GL₂ at trivial central character, a compact positive function with nonzero integral acts nontrivially on the constant residual vector and is not quasi-cuspidal.

**Check.** The zero operator is quasi-cuspidal even when it is produced by a test function with nonzero local constant terms.

### SM.4/typical-data — Typical cuspidal data at an infinitesimal character

For each standard Levi M import the splitting of its Cartan dual into a central quotient c_M*/a_M* and the derived Cartan quotient b_M*. Let γ_M^+,γ_M^− be the corresponding quotient maps, and let λ_M be the derived Casimir polynomial. A normalized cusp representation σ of M is χ∞-typical if γ_M^+(χσ∞) belongs to the finite image γ_M^+(χ∞) and λ_M(γ_M^−(χσ∞)) belongs to the finite set λ_M(γ_M^−(χ∞)). Images of W-orbits are finite sets; choices of representatives do not change membership. Work modulo unitary unramified twists on a_M. Fix a finite set of archimedean K_M-types and a compact open finite level when asserting finiteness.

**Dependencies.** AutomorphicSpectralTheoryPartII:SM.4/spectral-characters; AutomorphicFormsOnReductiveGroups:AF.1/infinitesimal-character; AutomorphicSpectralTheory:AS.1/cuspidal-datum-space; AdelicAlgebraicGroups:AA.2.

**Source.** bplzz: §3.3, Remark 3.10 and Definition 3.11, p.25.

**Construction or proof.** 1. Compare the central cotangent quotient to AA norm-one central ideles and AS normalized twists, retaining the c_M/a_M directions over a general number field. 2. Apply the central and derived polynomials to every representative in the finite W-orbit.

**API.**

- **typicalData_twist** (compatibility): Unitary twists in a_M* leave the two projected conditions unchanged.

- **typicalData_finite_orbit** (characterisation): The target central and Casimir conditions are finite-set membership conditions on the whole W-orbit.

- **typicalData_full_match** (relation): If the induced infinitesimal character of σ_s equals χ∞ for some s, then σ is χ∞-typical.

**Uses.** SM.4 finite typicality: Combines central lattice finiteness with Casimir counting. SM.4 archimedean annihilator: Separates all non-typical inducing families.

**Unit tests.**

- **typicalData_torus** (non-example): For a compact central torus the derived Casimir is always 0, but different character differentials still fail the central typicality condition.

- **typicalData_target** (example): A datum inducing exactly χ∞ is typical.

- **typicalData_split_case** (compatibility): When c_M=a_M, the central quotient is zero and the central condition becomes automatic; the derived condition remains.

**Check.** Both conditions are necessary; the derived Casimir alone cannot control a torus.

**Planet.** Typical cuspidal data.

### SM.4/casimir-counting — Finite-rank cuspidal Casimir values

At fixed finite level and a finite set of archimedean K_M-types, the set Λ_M of derived Casimir values of cuspidal representations of M modulo a_M twists is countable and has finite rank as a subset of ℂ. More precisely the needed derived semisimple cuspidal counting function, counted with multiplicity below positive elliptic spectral parameter R, is bounded by C(1+R)^d. To pass from M to M_der, one must use a finite union of conjugate finite levels; the original level intersection alone is not sufficient. Normalize the Casimir sign so that its K-type-adjusted elliptic eigenvalue is nonnegative.

**Dependencies.** AutomorphicSpectralTheoryPartII:SM.0/finite-rank; AutomorphicSpectralTheoryPartII:SM.4/typical-data; AutomorphicFormsOnReductiveGroups:AF.3/cuspidal-spectrum-discrete; AdelicAlgebraicGroups:AA.3/component-decomposition; AutomorphicFormsOnReductiveGroups:AF.3.

**Source.** bplzz: §3.3, Lemma 3.12 and proof, p.26; Donnelly 1982, Theorem 9.1 as invoked there.

**Construction or proof.** 1. Request the exact Donnelly polynomial upper bound R7 from AF.3; finite multiplicity alone is not a counting theorem. 2. Choose finite representatives of M(𝔸)/(M(F)Z_M(𝔸)M_der(𝔸)K_MM∞). Translate a nonzero fixed-level cusp vector by a suitable representative before restricting to M_der. 3. Intersect the finitely many conjugate derived levels, apply the counting theorem at that common smaller level, and deduce convergence of a sufficiently high reciprocal power sum.

**Check.** A repeated eigenvalue contributes multiplicity to the counting estimate, but only once to the interpolation zero set.

**Planet.** Cuspidal Casimir counting.

### SM.4/finite-typical-data — Finiteness of typical cuspidal data

For each Levi M, fixed ω, fixed finite level and finite K_M-type set, only finitely many χ∞-typical cuspidal representations occur modulo the normalized a_M twists. After fixing ω and normalizing the a_M twists, the allowed central differentials lie in a discrete affine lattice coset in the remaining central directions of c_M,ℂ*/a_M,ℂ*, possibly of rank zero; the first typicality condition restricts them to finitely many values; the remaining finite-component central characters are finite at the fixed level. Donnelly’s bound restricts derived parameters, and fixed infinitesimal/central-character admissibility gives the final finite representation set.

**Dependencies.** AutomorphicSpectralTheoryPartII:SM.4/casimir-counting; AutomorphicSpectralTheoryPartII:SM.4/typical-data; AdelicAlgebraicGroups:AA.2; AutomorphicFormsOnReductiveGroups:AF.3/cuspidal-spectrum-discrete.

**Source.** bplzz: §3.3, Lemma 3.13, p.26, with the central-character step in the proof of Lemma 3.14, pp.26–27.

**Construction or proof.** 1. Use the character lattice of the fixed-level compact norm-one central quotient. Compare extension of the fixed ω and normalization of twists as requested in R9: the resulting allowed differentials form an affine coset with complex-linearly independent lattice generators, rather than a full-rank lattice in all of c_M*/a_M*. 2. Apply both typicality conditions, then derived counting at the conjugate levels and Harish-Chandra fixed-character finiteness.

**Check.** For a torus with trivial derived group the proof must still use the central condition.

### SM.4/archimedean-annihilator — Archimedean annihilators of unwanted families

For each standard Levi M there is μ∞^M∈(M♯θ)^W with μ∞^M(χ∞)≠0 that vanishes on every induced character χ^G_{σ_s∞} for every complex s∈a_M,ℂ* whenever σ has the fixed permitted types and level and is not χ∞-typical. Construct it using finite-rank interpolation in the derived Casimir and interpolation on the allowed affine central lattice coset in c_M,ℂ*/a_M,ℂ*. Multiply by a sharp symbol μ∞⁰ nonzero at every target Weyl translate; the additional moderate factors alone need not be sharp.

**Dependencies.** AutomorphicSpectralTheoryPartII:SM.4/casimir-counting; AutomorphicSpectralTheoryPartII:SM.4/finite-typical-data; AutomorphicSpectralTheoryPartII:SM.0/vertical-interpolation; AutomorphicSpectralTheoryPartII:SM.0/sharp-nonvanishing.

**Source.** bplzz: §3.3, Lemma 3.14, pp.26–27.

**Construction or proof.** 1. Remove from Λ_M the finite target Casimir set, interpolate a function with exactly those unwanted zeros, and pull back along λ_Mγ_M^−. 2. For the central quotient translate the allowed affine lattice coset to a lattice with complex-linearly independent generators and apply SM.0/vertical-interpolation, killing its points outside the finite target image. Take their product over W and multiply μ∞⁰; the quotient maps kill the full complex a_M inducing direction.

**API.**

- **archAnnihilator_target** (projection): The constructed μ∞^M evaluates nontrivially at χ∞.

- **archAnnihilator_family_zero** (relation): For each non-typical σ, μ∞^M(χ^G_{σ_s∞})=0 for all complex inducing parameters s.

- **archAnnihilator_sharp** (compatibility): The result lies in the sharp W-invariant algebra, using the M-module law and its sharp seed.

**Uses.** SM.4 finite archimedean selection: Multiply over the finitely many standard Levis. SM.5 mixed isolation: First reduces the unwanted cuspidal data to a finite list.

**Unit tests.**

- **archAnnihilator_no_unwanted** (degenerate): When the unwanted set is empty the interpolation factors can be 1, but the construction retains the sharp seed.

- **archAnnihilator_one_bad_value** (computation): For a single bad Casimir c distinct from all target values, a damped factor q(z)−c kills exactly the required Casimir fiber before Weyl symmetrization.

- **archAnnihilator_central_only** (non-example): For a Levi with trivial derived group but nontrivial compact central character lattice, the central factor still kills an incorrect character; a Casimir-only construction would fail.

**Check.** The value at χ∞ stays nonzero; every complex twist of a non-typical datum is killed.

**Planet.** Archimedean annihilators.

### SM.4/finite-archimedean-selection — Finite surviving cuspidal components

For the fixed (G,Z,ω,K,χ∞) there exists μ∞∈(M♯θ)^W with μ∞(χ∞)≠0 such that, for every fixed-K Schwartz f, R(μ∞⋆f) has image in a finite orthogonal sum of AS.1 cuspidal-data components. The list is independent of f. Choose the finite detecting K∞-types supplied by μ∞⁰, propagate them to the finitely many Levi K_M-types and finite levels, retain only typical data, and annihilate all remaining data by the product of μ∞^M.

**Dependencies.** AutomorphicSpectralTheoryPartII:SM.4/archimedean-annihilator; AutomorphicSpectralTheoryPartII:SM.4/finite-typical-data; AutomorphicSpectralTheoryPartII:SM.1/finite-k-types; AutomorphicSpectralTheory:AS.1/cuspidal-datum-space; AutomorphicSpectralTheory:AS.4/spectral-orthosum.

**Source.** bplzz: §3.3, (3.3) and Proposition 3.15, p.27.

**Construction or proof.** 1. Use compact-picture Frobenius reciprocity to get finite Levi type sets from the detecting G-types, and choose compatible finite levels including the unramified factors. 2. Apply the annihilator to every complex induced family and use density of pseudo-Eisenstein series in its cuspidal block. 3. Finite typicality leaves a finite block list after multiplying the finitely many standard-Levi factors.

**Check.** The surviving blocks may contain continuous spectral parameters; they are not a finite set of irreducible representations.

## SM.5. Mixed multipliers and isolation of cuspidal components

Define simultaneous occurrence at infinity and every retained finite place. Construct mixed annihilators, normalize at the target character, and isolate occurring components. Deduce non-CAP isolation, isolation within the cuspidal domain, preservation of a non-CAP admissible representation, the single GL_n cuspidal-support component, and the discrete-data refinement subject to its explicit counting contract.

### SM.5/occurrence — Occurrence in a cuspidal datum

A T-character χ occurs in a normalized cuspidal datum (M,σ) if there is one complex parameter s∈a_M,ℂ* for which the induced infinitesimal character equals χ∞ and, for every finite v outside T, the spherical constituent of the normalized induction I_P^G(σ_s,v) has character χ_v. The same parameter must work at all these places. This property descends to the AS.1 Weyl-and-twist equivalence class. Denote the resulting set by D(G,ω)_χ. Occurrence is stronger than the almost-everywhere finite-place condition in CAP.

**Dependencies.** AutomorphicSpectralTheoryPartII:SM.4/spectral-characters; AutomorphicSpectralTheory:AS.1/cuspidal-datum-space; AutomorphicFormsOnReductiveGroups:AF.1/normalized-real-parabolic-induction; SmoothRepresentationsOfLocalGroups:SR.4; AutomorphicSpectralTheory:AS.1.

**Source.** bplzz: §3.4, Definition 3.16, p.28.

**Construction or proof.** 1. Use normalized induction, its infinitesimal character and the Satake character at each unramified place. 2. A Weyl conjugacy or normalized unramified twist changes s and the representative without changing existence.

**API.**

- **occurs_twist** (compatibility): Replacing σ by a normalized unramified twist translates the existential parameter and preserves occurrence.

- **occurs_weyl** (functoriality): Associate parabolic induction transports occurrence across the AS.1 equivalence relation.

- **occurs_proper_implies_cap** (relation): Occurrence in a proper Levi datum implies that χ is (G,T)-CAP; the converse is not asserted.

**Uses.** SM.5 mixed separation: Identifies the components that can be annihilated without killing χ. SM.5 global isolation: Defines the surviving spectral sum.

**Unit tests.**

- **occurs_self** (example): For a cuspidal σ and M=G, the T-character induced by σ occurs in its own datum.

- **occurs_arch_mismatch** (non-example): When M=G and the infinitesimal characters differ, agreement at all retained finite places does not give occurrence.

- **occurs_empty_finite_set** (degenerate): If T contains every finite place, occurrence still requires the infinitesimal-character equation, whereas the finite-place CAP condition becomes vacuous whenever a proper cuspidal datum exists.

**Check.** The infinitesimal and all retained finite-place equations must hold simultaneously.

**Planet.** Occurrence of spectral characters.

### SM.5/mixed-separation — Mixed archimedean and Hecke annihilators

If χ does not occur in (M,σ), construct a T-multiplier μ_{M,σ} nonzero at χ whose operator annihilates the whole AS.1 cuspidal component L²_(M,σ). Only finitely many places outside T are used, even if T is infinite. For proper M choose representatives α_σ,α_χ and a splitting ℓ:h*→a_M*. For each w∈W the only candidate parameter compatible with α_σ+s=wα_χ is s_w=ℓ(wα_χ)−ℓ(α_σ). Nonoccurrence supplies an invariant archimedean polynomial or a spherical Hecke element at a retained finite place distinguishing the target from that candidate. Its values along the induced family are exponential polynomials in s. A finite linear combination avoiding the finitely many target-zero hyperplanes, followed by a Weyl product, vanishes on the entire family and is nonzero at χ. Multiply by a moderate damping and a sharp seed to obtain an element of (M♯θ)^W⊗H_G^T.

**Dependencies.** AutomorphicSpectralTheoryPartII:SM.5/occurrence; AutomorphicSpectralTheoryPartII:SM.4/t-multipliers; AutomorphicSpectralTheoryPartII:SM.0/sharp-nonvanishing; AutomorphicSpectralTheoryPartII:SM.0/moderate-symbols; AutomorphicSpectralTheoryPartII:SM.1/real-multiplier; SmoothRepresentationsOfLocalGroups:SR.4; AutomorphicSpectralTheory:AS.1/cuspidal-datum-space.

**Source.** bplzz: §3.4, Proposition 3.17 and (3.4), pp.28–29; Remark 2.9(3), p.11.

**Construction or proof.** 1. If the fixed-level component is zero there is nothing to annihilate; use a sharp seed nonzero at χ. 2. For M=G an archimedean invariant polynomial separates unequal infinitesimal characters; otherwise choose a Hecke element separating the finite-place characters and multiply it by a sharp seed. A bare Hecke element need not lie in the sharp tensor algebra. 3. For proper M form the finite exponential-polynomial differences by subtracting their evaluations at s=ℓ(w′α)−ℓ(α_σ). Choose one linear combination nonzero at every target Weyl translate, then multiply over w′. Along α=α_σ+s its identity factor vanishes. 4. Choose a W-invariant entire damping nonzero at χ∞ that changes the exponential coefficients to moderate strip growth, and multiply by the sharp seed. Use the scalar action on induced representations and density of pseudo-Eisenstein series to annihilate the closed component.

**API.**

- **mixedAnnihilator_target** (projection): μ_{M,σ}(χ)≠0.

- **mixedAnnihilator_family** (relation): Evaluation at every induced T-character of σ_s vanishes for all complex s.

- **mixedAnnihilator_component** (compatibility): For every fixed-K Schwartz f, R(μ_{M,σ}⋆f) is zero on L²_(M,σ).

**Uses.** SM.5 isolation theorem: Kills each unwanted component in the finite list left by SM.4. Relative trace-formula isolation: Keeps prescribed local Hecke data while eliminating other global components.

**Unit tests.**

- **mixedAnnihilator_hecke_only** (computation): For M=G and equal infinitesimal characters but different finite-place characters, use μ∞⁰⊗(h−χ_σ(h)1), choosing χ(h)≠χ_σ(h); μ∞⁰(χ∞)≠0 is essential.

- **mixedAnnihilator_arch_only** (example): For M=G with unequal infinitesimal characters, a separating invariant polynomial times μ∞⁰ works even with no retained finite places.

- **mixedAnnihilator_occurrence_obstruction** (non-example): If χ occurs in the family, an element vanishing identically on that family must evaluate to 0 at χ, so this construction cannot preserve the target.

**Check.** Annihilation holds for every complex s, not just unitary parameters. The multiplier remains in the nonunital sharp algebra.

**Planet.** Mixed spectral annihilators.

### SM.5/global-isolation — Isolation of occurring cuspidal components

For every T-character χ and the fixed (G,Z,ω,S,K), there is a T-multiplier μ with μ(χ)=1 such that for every f∈S(G(𝔸))^K the image of R(μ⋆f) on L²(G(F)\G(𝔸)/K,ω) lies in the Hilbert orthogonal sum of the AS.1 cuspidal components indexed by D(G,ω)_χ. The constructed range is already contained in a finite sum of these components. The identity μ(χ)=1 preserves the action of f on any admissible representation with this T-character, including one absent from the automorphic spectrum. This theorem asserts a range constraint and scalar normalization; it does not assert that μ acts as the identity on each entire surviving component.

**Dependencies.** AutomorphicSpectralTheoryPartII:SM.4/finite-archimedean-selection; AutomorphicSpectralTheoryPartII:SM.5/mixed-separation; AutomorphicSpectralTheoryPartII:SM.5/occurrence; AutomorphicSpectralTheoryPartII:SM.4/t-multipliers; AutomorphicSpectralTheory:AS.4/spectral-orthosum.

**Source.** bplzz: §3.4, Theorem 3.19, pp.29–30.

**Construction or proof.** 1. Start with μ∞ from SM.4 and its finite list of surviving equivalence classes. 2. Multiply by the mixed annihilator for each class where χ does not occur. All factors are nonzero at χ. 3. Divide by the resulting scalar at χ; use the AS.4 orthogonal decomposition and commuting scalar actions to prove the range inclusion.

**Check.** Check that no finite-place factor outside a finite set is introduced. No orthogonal-projection or idempotence conclusion is inferred.

**Planet.** Cuspidal component isolation.

### SM.5/non-cap-isolation — Isolation of non-CAP cuspidal spectrum

If χ is not (G,T)-CAP, choose the normalized multiplier of global isolation so that for every fixed-K Schwartz f its operator on the entire central-character L² space has image in L²_cusp[χ]. In particular μ⋆f is ω-quasi-cuspidal and μ(χ)=1. Without the non-CAP hypothesis the same normalized multiplier has this range property after restricting its domain to L²_cusp. Here L²_cusp[χ] is the maximal closed cuspidal subspace on whose smooth vectors Z(g)⊗H_G^T acts by χ; neither assertion requires χ to be automorphic.

**Dependencies.** AutomorphicSpectralTheoryPartII:SM.5/global-isolation; AutomorphicSpectralTheoryPartII:SM.4/cap-characters; AutomorphicSpectralTheoryPartII:SM.4/quasi-cuspidal; AutomorphicFormsOnReductiveGroups:AF.3/cuspidal-spectrum-discrete; AutomorphicSpectralTheory:AS.4/spectral-orthosum.

**Source.** bplzz: §3.1, Theorems 3.6–3.7, p.23; their proofs in §3.4, p.30.

**Construction or proof.** 1. A proper cuspidal datum with occurrence would imply CAP, so only M=G can survive in the non-CAP case. 2. Intersect the occurring component sum with L²_cusp. Orthogonality of the AS.1 decomposition identifies that intersection with L²_cusp[χ]. 3. For arbitrary χ restrict the operator to the invariant cuspidal subspace before taking the intersection.

**Check.** In the unrestricted-character assertion only the cuspidal domain is controlled. Quasi-cuspidality is asserted on the whole L² space only in the non-CAP case.

**Planet.** Non-CAP spectral isolation.

### SM.5/nearly-isotypic — Preservation of a non-CAP admissible representation

Let π be an irreducible admissible representation of G(𝔸) with unitary automorphic central character. Suppose π is not nearly equivalent to a constituent of induction from any proper cuspidal datum. At a finite level K choose finite S containing every ramified place of G, K and π and take T=S. The normalized isolation multiplier satisfies π(μ⋆f)=π(f) for every fixed-K Schwartz f, and its global L² operator has image in the π-nearly isotypic cuspidal subspace. The sharper χπ^T-eigenspace range may be used as an intermediate inclusion. If the nearly isotypic cuspidal subspace is zero, the global L² action is zero while the action on π is still preserved.

**Dependencies.** AutomorphicSpectralTheoryPartII:SM.5/non-cap-isolation; AutomorphicFormsOnReductiveGroups:AF.2/automorphic-representation; AutomorphicFormsOnReductiveGroups:AF.2/restricted-tensor-product; AutomorphicFormsOnReductiveGroups:AF.2/flath-factorization.

**Source.** bplzz: §1.1, Theorem 1.1 and Remark 1.2(4), p.2; §3.1, Theorem 3.6, p.23.

**Construction or proof.** 1. Associate the unramified Hecke and infinitesimal T-character to π. 2. Non-CAP for π gives the hypothesis of SM.5 non-CAP isolation. Equality of all Hecke characters outside finite S implies local isomorphism there by the spherical classification. 3. The multiplier evaluates to 1 at χπ, so the scalar action preserves π(f).

**Check.** Near equivalence does not determine the infinitesimal character for a general reductive group. No automorphic occurrence of π is assumed.

### SM.5/gln-component — Isolation of one GLₙ cuspidal-support component

For G=Res_{F′/F}GL_n and an irreducible admissible π occurring as a constituent of normalized induction of a cuspidal representation σ of a Levi M, with unitary automorphic central character, there is a normalized multiplier preserving π(f) and mapping the entire central-character L² space into the single AS.1 cuspidal-support component attached to (M,σ), for every fixed-K Schwartz f. The correct uniqueness input is the isobaric strong multiplicity-one theorem: the almost-everywhere unramified characters determine the multiset of cuspidal constituents, with their unramified norm twists. It identifies the cuspidal datum, not every irreducible constituent of its induced representation.

**Dependencies.** AutomorphicSpectralTheoryPartII:SM.5/global-isolation; AutomorphicSpectralTheory:AS.1/cuspidal-datum-space; AutomorphicLFunctionsAndLocalFactors:AL.3/isobaric-strong-multiplicity-one; AutomorphicFormsOnReductiveGroups:AF.1/normalized-real-parabolic-induction.

**Source.** bplzz: §1.1, Theorem 1.3, pp.2–3; §3.4, Theorem 3.19, pp.29–30; Jacquet–Shalika 1981, Theorem 4.4, as used in §1.1.

**Construction or proof.** 1. Use isobaric strong multiplicity one from AL.3, including normalization and twists, to show that the occurrence set contains only the inducing cuspidal-support equivalence class. 2. Apply global isolation with χ=χπ^S and normalize at π.

**Check.** Do not replace isobaric strong multiplicity one by the cuspidal-only Piatetski-Shapiro 1979 theorem. The target is a coarse cuspidal-support component and may include continuous and residual spectrum.

### SM.5/langlands-refinement — Isolation of refined discrete-data components

Replace AS.1 cuspidal data by AS.4 Langlands data (M,σ) with σ in the discrete automorphic spectrum of M, using its normalized unramified-twist and Weyl equivalence. Assuming the polynomial fixed-level, fixed-K-type discrete-spectrum Casimir counting input R8D, there is a T-multiplier with value 1 at χ whose L² range lies in the sum of the refined Langlands components where χ occurs, defined by the same simultaneous character equations. This can be strictly smaller than the coarse cuspidal-support range. The extra polynomial counting theorem is a required input, not a consequence of mere discreteness or of a general trace-class ideal theorem.

**Dependencies.** AutomorphicSpectralTheoryPartII:SM.5/global-isolation; AutomorphicSpectralTheoryPartII:SM.5/occurrence; AutomorphicSpectralTheory:AS.4/residual-spectrum; AutomorphicSpectralTheory:AS.4.

**Source.** bplzz: §3.4, Remark 3.20, pp.30–31; Müller 1989, Theorem 0.1, as invoked there.

**Construction or proof.** 1. Use the AS.4 discrete-data Langlands decomposition requested in R8D. 2. Repeat the Casimir interpolation and typical-data finiteness using the discrete-spectrum polynomial bound rather than the cuspidal bound. 3. Repeat mixed separation and scalar normalization with these refined components.

**Check.** For PGL₂ the residual constant representation can be separated from the continuous component associated with the trivial torus character; their coarse cuspidal support can coincide.

## Worked comparisons

For split SL₂(ℝ), X*=ℤ, roots are ±2 and W={±1}. The real-form θ contains both 1 and −1. The forward multiplier theorem therefore requires an even entire symbol, moderate on vertical strips and of polynomial growth on ℤ. For compact SU(2), θG={−1} is smaller than θ; the forward theorem remains valid with its stated θ∪{1} input. The actual highest-weight infinitesimal characters exclude 0, so the full shifted lattice cannot be substituted for the actual spectrum in the kernel statement. No converse classification is inferred.

For U(1), the lattice is ℤ and the sharp algebra has no unit. Interpolation at a finite subset gives a symbol with only those lattice slices nonzero. In the mixed annihilator’s M=G case, if a Hecke element h separates two retained characters but their infinitesimal characters agree, the valid element is μ∞⁰⊗(h−χσ(h)1). The scalar μ∞⁰(χ∞) is chosen nonzero. Dropping μ∞⁰ could leave the prescribed sharp tensor algebra.

On a GL₂ cusp with positive diagonal coordinate diag(a,1), the single relative root gives d_B^G comparable to |a|. A function of uniform moderate growth with zero B-constant term then gains every power d_B^G^{−r}, with one fixed ambient height exponent. A function exp(i y²) on the modular height ray has (y d/dy)^k derivatives of leading size y^{2k}; it fails uniform moderate growth. Permitting the height exponent to depend on k would define the wrong space.

For w=n_P, S_w has the same underlying functions as S([G]_P): if n_P^{−N}w^rDφ is bounded for every r, set r=N+k to get every rapid exponent k. For w=1 the same definition is the existing uniform moderate-growth space. These are useful endpoint tests of the quantifier ∃N∀r∀D. The LF topology in the growth exponent is not declared strict by analogy with the finite-level exhaustion.

## Source corrections and statement boundaries

The independent review accepts this complete planning pass after correcting nine nodes and the R1/R9/R11 contracts. All six layers remain planned, with 16 explicit gaps and 15 open supplier requests; none is closed or implemented. Of the 36 inherited source issues, 25 are confirmed and 11 rejected against the specified PDF. Seven additional notation/criterion issues are recorded separately, giving 43 adjudicated entries. In particular, the original lattice independence condition, complex Cauchy disk, corollary pair, root-lattice example and order of the symbol classes are already correct in arXiv v3. The rejected base-field and omitted-restriction allegations must not be used as errata. The actual rational-split equivalence in Remark 3.10 fails for an anisotropic semisimple ℚ-group; no target here uses it. Remark 1.2(2) is flagged only for an additional simultaneous-normalization argument, not as a disproved projection theorem. Individual reasons and exact locators are in the packet’s source-issue review objects.

The packet records version-specific source issues in our own words. BPLZZ locators throughout refer to arXiv v3, not to unread Annals page numbers. In particular the forward multiplier theorem is used, the conjectural converse is excluded, finite real-form involution sets replace an incorrect general finiteness claim, character unions are used only as upper bounds, limits of discrete series are included, and the Kostant translation sign is +λ under the fixed inverse-pullback convention. The finite-level counting argument uses conjugate derived levels and both central and derived typicality conditions. The Hecke-only annihilator retains a sharp seed. The generic closed-image sentence before BPCZ Lemma 2.5.4.1 needs an injectivity convention for its embedding wording; the reader states quotient-to-image in general. BPCZ §2.5.9 also calls the full Radon-measure space a continuous Banach representation: moving Dirac masses disprove strong continuity in total variation. SM.2 retains the measure carrier and uses weak convolution and its norm-smooth vectors. In Arthur factorization conjugate inversion is read from the published display; K∞-invariance of Z is not strengthened to centrality.

## Required supplier contracts and closure

Every layer is planned. The packet is complete at target level and has 63 nodes; it is not proof-closed. The following contracts and comparison gap are precise remaining prerequisite work. None is disguised as a baseline declaration.

### G1 — Nash Schwartz and functional-analysis comparison

Supply the exact Nash embedding/Schwartz and local-Sobolev comparison and the split SLF direct-sum/closed-subspace comparison, Fréchet open mapping and nuclear-map consequences. Check weighted Riesz duality with its precise dual topology, weak convolution on Radon measures and the norm-smooth-vector union after the total-variation strong-continuity assertion fails (E-T0). An F-representation theorem cannot be applied to the full measure space. These are not supplied by Mathlib SchwartzMap on Euclidean spaces alone. Use current RealAlgebraicGeometry and PDE only for the portions their read targets cover, current OperatorIdeals for Hilbert–Schmidt composition, and AS.0 for functional analysis. Check the original Aizenbud–Gourevitch product theorem and avoid treating a finite-level but unbounded-support test-function space as Fréchet.

**Consumers.** AutomorphicSpectralTheoryPartII:SM.1/real-schwartz-comparison; AutomorphicSpectralTheoryPartII:SM.2/slf-representations; AutomorphicSpectralTheoryPartII:SM.2/nuclear-inclusion; AutomorphicSpectralTheoryPartII:SM.2/nuclear-tensor-products; AutomorphicSpectralTheoryPartII:SM.2/tempered-measures; AutomorphicSpectralTheoryPartII:SM.2/weighted-growth.

### G-R1 — Supplier contract R1

The supplier owns generic locally convex analysis, but has no exact vector-holomorphy node for the weighted Levi function family. Required statement: Locally convex holomorphic families on an open complex parameter domain: weak holomorphy plus local boundedness implies holomorphy in the complete nuclear Fréchet targets used here; holomorphic extension through fixed-level projective tensors. Include the locally convex direct-sum topology for countably many Fréchet isotypical pieces, closed invariant subspaces preserved by the compact averaging projections, and quotient-to-closed-image open mapping on these pieces. Include separately-to-jointly continuous bilinear facts on fixed Fréchet stages, without asserting a closed-subspace theorem for arbitrary strict LF spaces. Import generic Hilbert–Schmidt/nuclear tools from current OperatorTheory and OperatorIdeals instead of rebuilding them.

**Consumers.** AutomorphicSpectralTheoryPartII:SM.1/delorme-reductive; AutomorphicSpectralTheoryPartII:SM.2/slf-representations; AutomorphicSpectralTheoryPartII:SM.2/weighted-constant-term; AutomorphicSpectralTheoryPartII:SM.3/regular-constant-term.

### G-R13 — Supplier contract R13

Existing upstream structural targets are imported; no new reductive group structure theory is planned here. Required statement: Based root-datum/Weyl-group structures, maximal-torus character lattices and finite central/derived product coverings needed by real-form spectral lattices. Supply the identification after passing to real points, with finite components made explicit.

**Consumers.** AutomorphicSpectralTheoryPartII:SM.0/root-strip-data.

### G-R14 — Supplier contract R14

The current upstream real-form layer owns this structural input; its specialization and compatibility with AF.1 infinitesimal characters must be checked. Required statement: Complexification and real descent of a connected reductive real algebraic group on its abstract Cartan root datum, including the Weyl-conjugacy change of Cartan identification and the split/compact eigenspace decomposition of each maximal real torus.

**Consumers.** AutomorphicSpectralTheoryPartII:SM.0/root-strip-data.

### G-R2 — Supplier contract R2

The AF.1 packet owns local real harmonic analysis but does not state this full Plancherel/character contract. Required statement: Real reductive Plancherel decomposition of L²(G(ℝ)) with the chosen Haar measure, faithful Fourier transform on S(G), and containment (not equality) of tempered infinitesimal characters in ⋃ϑ∈θG(ih*ϑ+Yϑ). Read the precise original theorem and compare disconnected real points. BPLZZ Proposition 2.24 uses this input.

**Consumers.** AutomorphicSpectralTheoryPartII:SM.1/schwartz-integrated-action; AutomorphicSpectralTheoryPartII:SM.1/rapid-multiplier.

### G-R3 — Supplier contract R3

The Appendix A argument was read; these original external statements have not been checked, and compact Paley–Wiener does not imply them by definition. Required statement: Delorme 1986 Theorem 1.7 in its exact semisimple rapid-symbol form C_c∞(G)_(K)→S(G)_(K), continuous for each fixed support and finite K-type stage; W-invariant rapid symbols on the full complex Cartan. Supply the split-centre Fourier–Laplace multiplier theorem (Sakellaridis, arXiv:1804.02383, Theorem 2.1.2) and the Nash Schwartz product theorem used in Appendix A. These are stronger than the compact-distribution multiplier already planned at AS.6/spectral-multiplier.

**Consumers.** AutomorphicSpectralTheoryPartII:SM.1/delorme-reductive.

### G-R4 — Supplier contract R4

The supplier has classification, induction and discrete-series nodes, but these quantitative/tensor strengthenings are not exact existing nodes. The external compact-K-type bounds are checked at their BPCZ use, not in the original sources. Required statement: Kostant 1975 Theorems 4.8–4.9: finite freeness of (U(g)⊗End τ)^{δg} over Z(g) and its tensor-character annihilator with roots z(α+λ). Also provide generic irreducibility of minimal principal series, the subquotient theorem, and finite minimal-K-type detection for bounded discrete parameters including nondegenerate limits of discrete series. For relative-character sums include polynomial compact-K-type dimension bounds and bounds of every smooth representation seminorm by a sufficiently high compact-Casimir Sobolev norm; BPCZ invokes Wallach 1992 §10.1 and the proof of Müller 2000 Lemma 6.1. Pin all topology and finite-component hypotheses.

**Consumers.** AutomorphicSpectralTheoryPartII:SM.1/tensor-centralizer; AutomorphicSpectralTheoryPartII:SM.1/generic-principal-tensor; AutomorphicSpectralTheoryPartII:SM.1/rapid-multiplier; AutomorphicSpectralTheoryPartII:SM.1/finite-k-types; AutomorphicSpectralTheoryPartII:SM.3/relative-characters.

### G-R5 — Supplier contract R5

AA.3 supplies ordinary reduction theory, not the precise quotient/fiber contracts needed for all weights. The cited BPCZ statements were read, but their reduction-theory proof imports were not fully traced. Required statement: BPCZ Lemmas 2.4.3.1–2.4.3.2 and 2.4.4.1–2: proper quotient heights on [G]_P; Siegel-chart compatibility sufficient to glue exp⟨λ,H₀⟩; polynomial finite-fiber bounds in ε^{-1} for parabolic cusp covers and uniqueness in sufficiently deep compatible cusp regions; quotient-volume comparison and restriction-compatible depth functions. Use the already planned group heights, Iwasawa map and Siegel covering.

**Consumers.** AutomorphicSpectralTheoryPartII:SM.2/weights; AutomorphicSpectralTheoryPartII:SM.2/franke-weights; AutomorphicSpectralTheoryPartII:SM.2/cusp-neighborhoods; AutomorphicSpectralTheoryPartII:SM.2/quotient-xi; AutomorphicSpectralTheoryPartII:SM.2/sobolev-evaluation.

### G-R6 — Supplier contract R6

AS.1/pseudo-eisenstein and cuspidal-datum-space give the central convention; the two source conventions need this explicit comparison, rather than an invented second data carrier. Required statement: Compare AS normalized cuspidal data modulo A_M∞ with BPLZZ pairs whose central characters extend ω and BPCZ X(G): identify Weyl and unramified-twist equivalence, measures and the closed span of pseudo-Eisenstein packets. Extend the already owned pseudo-Eisenstein operator to the compactly supported smooth vectors on intermediate quotients used before the SM.2 topological extensions.

**Consumers.** AutomorphicSpectralTheoryPartII:SM.2/constant-term-extensions; AutomorphicSpectralTheoryPartII:SM.3/cuspidal-support; AutomorphicSpectralTheoryPartII:SM.5/occurrence.

### G-R7 — Supplier contract R7

Finite-dimensional fixed-character cusp spaces do not imply polynomial spectral counting. The original Donnelly theorem was not obtained; BPLZZ Lemma 3.12 is the checked usage. Required statement: Donnelly, On the cuspidal spectrum for finite volume symmetric spaces, JDG 17 (1982), Theorem 9.1, pp.239–253: a polynomial eigenvalue-count upper bound, with multiplicities, for each fixed finite level and finite archimedean K-type set on the derived semisimple quotient. Include finite-component and arbitrary-level reduction through finitely many conjugate levels, and relate the positive elliptic eigenvalue to the chosen Casimir sign.

**Consumers.** AutomorphicSpectralTheoryPartII:SM.4/casimir-counting.

### G-R8L — Supplier contract R8L

The Lapid (HP) definition and the cited GL_n consequence were read. A general-group unconditional claim is excluded; the AS.2 adapter and exact constants remain open. Required statement: Lapid property (HP) (ESI 2403 §3.6): polynomial parameter/derivative bounds for intertwining operators and Eisenstein series needed for Schwartz wave packets, with (UT) and (WR) for G and every Levi. Supply it unconditionally for finite products of restrictions of scalars of GL_n, and compare the chosen normalized intertwiners.

**Consumers.** AutomorphicSpectralTheoryPartII:SM.3/lapid-expansion.

### G-R8D — Supplier contract R8D

The inspected AS.4 packet has residual and L² decomposition targets but not this discrete counting bound. Müller’s original theorem was not read; the refinement remains conditional on this exact input. Required statement: For the refined target in SM.5/langlands-refinement supply the discrete-data Langlands decomposition and the fixed-level finite-K-type polynomial discrete-spectrum Casimir bound invoked by BPLZZ Remark 3.20 from Müller 1989 Theorem 0.1, Annals 130, 473–529. Keep central disintegration and residual components explicit.

**Consumers.** AutomorphicSpectralTheoryPartII:SM.5/langlands-refinement.

### G-R9 — Supplier contract R9

General number fields have compact central directions invisible to a_M; the exact central lattice and finite-component comparison are missing from the inspected nodes. Required statement: At fixed finite level, identify Z_M(F)\Z_M(𝔸)^1/(K_M∩Z_M(𝔸_f)) with a compact abelian Lie quotient and describe its character-differential lattice. Compare extension of the fixed character ω on Z(𝔸) and normalization modulo the relative a_M twists: the resulting parameters in c_M,ℂ*/a_M,ℂ* must lie in a discrete affine lattice coset with complex-linearly independent generators, possibly of rank zero. Prove finiteness at each finite set of differentials including finite component characters. Compare AA.2/central-character-l2 and central-quotient-change with BPLZZ Z(𝔸)-equivariant L²; do not identify the norm-one cotangent space with the whole relative c_M*/a_M* without this comparison.

**Consumers.** AutomorphicSpectralTheoryPartII:SM.4/typical-data; AutomorphicSpectralTheoryPartII:SM.4/finite-typical-data.

### G-R10 — Supplier contract R10

Use the existing spherical Hecke owner; its current packet has no finer SR.4 nodes furnishing this contract. Required statement: Normalized spherical Hecke/Satake parametrization for all unramified finite places, including normalized parabolic induction and restriction of its character to an unramified Levi. For a fixed Hecke element, its value on σ_s must be a finite exponential polynomial in s, compatible with the archimedean unramified norm twist; central convolution must preserve finite-level test Schwartz stages.

**Consumers.** AutomorphicSpectralTheoryPartII:SM.1/adelic-schwartz-adapter; AutomorphicSpectralTheoryPartII:SM.4/spectral-characters; AutomorphicSpectralTheoryPartII:SM.4/t-multipliers; AutomorphicSpectralTheoryPartII:SM.5/mixed-separation.

### G-R11 — Supplier contract R11

AS.3 owns the compact-data wave-packet and inner-product formulas. Their normalizations need an explicit comparison; requesting the new regular weighted conclusion from AS.3 would duplicate the target in SM.3. Required statement: Supply the pseudo-Eisenstein inner-product and constant-term formulas for compact smooth cuspidal data, including the Weyl/intertwining sum and quotient measures, and identify the existing AS.3 wave-packet parameter axes and normalizations with those of BPCZ and Lapid. SM.3/regular-constant-term itself derives the regular-support L² boundedness and weighted C-valued holomorphy from this input; those conclusions are not requested from AS.3.

**Consumers.** AutomorphicSpectralTheoryPartII:SM.3/regular-constant-term; AutomorphicSpectralTheoryPartII:SM.3/lapid-expansion.

### G-R12 — Supplier contract R12

AS.6 supplies compact kernels/trace distributions but not this quantitative Schwartz factorization. The BPCZ statement and proof were read; the generic factorization input needs the supplier contract. Required statement: Arthur factorization for fixed normal finite level K₀ and every integer m: choose Z∈U(g∞) invariant under K∞ conjugation, g₁∈C_c∞ and g₂∈C_c^m with the same conjugation invariance such that f=f*g₁+(f*Z)*g₂ for every bi-K₀ Schwartz f. Do not strengthen K∞-invariance to centrality of Z. Also identify the compact-test automorphic kernel spectral expansion and central disintegration with the normalizations extended in SM.3.

**Consumers.** AutomorphicSpectralTheoryPartII:SM.3/arthur-factorization; AutomorphicSpectralTheoryPartII:SM.3/schwartz-kernels; AutomorphicSpectralTheoryPartII:SM.3/kernel-spectral-expansion.

## Suggested statements at the pins

The companion suggested file follows WORKERS.md’s compact statement-only shape. It gives real-bodied predicates for rank bounds, finite entire order, vertical moderate/rapid growth and continuous complex-linear centroids; the entire zero-set and interpolation milestones use only existing complex-function and polynomial carriers. Its examples test growth signs, empty zero sets and the distinction between additive centroids and complex-linear continuous actions. The full root datum, real reductive Schwartz spaces, weighted adelic quotient representations and spectral components are README targets because their carriers are absent at the pins. No placeholder data construction is used to simulate them. All definitions and constructions, including these README-only targets, have their full mathematical API, recorded uses and at least three discriminating tests above. The suggested file is a set of statements, not an implementation.

## Sources read

All statements and proof plans are written in our own words. Source files and extracted text are kept outside the repository. Public PDFs were accessed on 19 October 2026; exact hashes and read ranges are in the packet.

### bplzz

Raphaël Beuzart-Plessis, Yifeng Liu, Wei Zhang and Xinwen Zhu. [Isolation of cuspidal spectrum, with application to the Gan–Gross–Prasad conjecture](https://arxiv.org/pdf/1912.07169v3). arXiv:1912.07169v3, 19 June 2021, 48 PDF pages; preprint pagination, not the Annals pagination.

Read: §§1–3, pp.1–30, including the proofs of Lemmas 2.20–2.25 and Propositions 3.15 and 3.17; Appendix A, pp.43–45; §4.2, pp.33–35, only for the finite-place Schwartz and tensor-product interfaces. The Annals article record was inspected, but its full published text was not obtained.

### bpcz

Raphaël Beuzart-Plessis, Pierre-Henri Chaudouard and Michał Zydor. [The global Gan–Gross–Prasad conjecture for unitary groups: the endoscopic case](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00129-1.pdf). Publications mathématiques de l’IHÉS 135 (2022), 183–336; open published PDF, journal pagination.

Read: §§2.4–2.5, pp.202–221; §§2.8.4–2.10.2, pp.227–243; §2.9.1–2.9.2 for the imported cuspidal-datum convention. Only the functional and spectral inputs routed to this Part II are used.

### lapid

Erez M. Lapid. [On the Harish-Chandra Schwartz space of G(F)\G(A)](https://www.esi.ac.at/preprints/esi2403.pdf). ESI preprint 2403, 7 January 2013; preprint pagination.

Read: §2 for quotient Schwartz conventions; §3.6, pp.19–20, for property (HP); Theorem 4.5, p.22; Proposition 5.1, pp.22–24; Corollaries 5.7–5.8, pp.25–26; §6, pp.26–28, for the wave-packet inversion argument. These do not prove the unrestricted noncuspidal conjecture in §4.

### bernstein

Joseph N. Bernstein. [On the support of Plancherel measure](https://www.math.tau.ac.il/~bernstei/Publication_list/publication_texts/Ber-Plancherel-JGF.pdf). Journal of Geometry and Physics 5(4) (1988), 663–710; author-hosted published scan.

Read: §3.4, pp.685–688: the local Sobolev estimate, Hilbert–Schmidt inclusion and its weighted extension; §3.5, pp.688–689: polynomial radial growth and nuclearity of the Harish-Chandra Schwartz space.

### parent

Tau Ceti Atlas contributors. [Automorphic spectral theory and trace distributions: blueprint](https://github.com/CBirkbeck/tauceti-explorer/blob/main/research/blueprint/packets/AutomorphicSpectralTheory.json). Repository packet and reader inspected 19 October 2026.

Read: AS.0 functional analysis; AS.1 cuspidal data and pseudo-Eisenstein series; AS.2 intertwining operators; AS.3 wave packets and inner-product formulas; AS.4 spectral decomposition; AS.5 Franke spaces; AS.6 real Paley–Wiener and compact multipliers.

### af

Tau Ceti Atlas contributors. [Automorphic forms on reductive groups: blueprint](https://github.com/CBirkbeck/tauceti-explorer/blob/main/research/blueprint/packets/AutomorphicFormsOnReductiveGroups.json). Repository packet and reader inspected 19 October 2026.

Read: AF.0 adelic Schwartz and growth-space carriers; AF.1 real representation theory, induction, globalization and Dixmier–Malliavin; AF.2 representations and tensor factorization; AF.3 constant terms, cusp forms and finite multiplicity.

### upstream

Tau Ceti Project contributors. [Current TauCetiRoadmap ownership contracts](https://github.com/TauCetiProject/TauCetiRoadmap/tree/0d144d044dacebca17b654695b6f1ad58f159b27). TauCetiRoadmap main at 0d144d044dacebca17b654695b6f1ad58f159b27, read only.

Read: OperatorTheory README and OperatorIdeals README/Suggested.lean, especially OI-B32–OI-B41, OI-B84 and the trace-class targets; ReductiveGroups README and suggested root/tori statements; LieGroups real-form layer; RealAlgebraicGeometry Nash boundary; PDE local Sobolev targets.

## Original inputs still to verify

Donnelly 1982 Theorem 9.1; Müller 1989 Theorem 0.1; Delorme 1986 Theorem 1.7; Kostant 1975 Theorems 4.8–4.9; Wallach 1992 §10.1 and Müller 2000 Lemma 6.1; the Aizenbud–Gourevitch Nash product theorem and Sakellaridis’s centre multiplier theorem are recorded as exact supplier/source work. Their uses were checked in the papers read, but the original statements were not all obtained. No restricted Wallach, Knapp or Trèves volume was accessed. The public Bernstein scan and Lapid preprint were read at the specified analytic inputs; their general consequences are not claimed beyond those ranges.
