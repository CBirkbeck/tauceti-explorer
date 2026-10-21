# Modular symbols and analytic p-adic L-functions of modular forms

This Part II develops cohomological modular symbols, signed period coordinates, and the single-form analytic p-adic L-functions built from them. It covers L0–L4 under RS-08. The target-level planning pass is complete: all five layers are **planned**. The two explicit gaps and supplier contracts below keep the layers from being declared closed. These are specifications for future formalization; the suggested signatures do not prove the targets.

The output of L0 is an arbitrary-coefficient Hom-side symbol API, with cohomology and rational Hecke splitting. L1 supplies the signed algebraic and saturated integral lines on which period choices live. L2 constructs distributions for refinements of slope strictly below the classical bound. L3 specifies critical-slope normalization through actual eigenlifts and families. L4 compares coefficient embeddings and depleted forms, constructs half-logarithms and Pollack's signed functions, and gives numerical examples exact certification targets.

The [packet](../packets/ModularSymbolsPadicLFunctions.json) records the prerequisite graph, source versions, API and tests. The [suggested Lean file](../suggested/ModularSymbolsPadicLFunctions.lean) contains typed interfaces and examples at the pinned libraries. Every definition and construction below has at least three discriminating tests. The [handoff](../handoff/BP-ModularSymbolsPadicLFunctions.md) records verification and the unresolved boundaries.

## Standing conventions and dictionaries

| Notion | Convention and consequence |
| --- | --- |
| Weight | The coefficient degree is k≥0; the modular-form weight is k+2. |
| Cusps and divisors | P¹(Q)=OnePoint Q; Δ₀ is the kernel of the sum of coefficients in Z[P¹(Q)]. The divisor notation D(a,b) means {b}−{a}. |
| Coefficient action | A right Γ-action becomes a left representation by ρ(γ)v=v\|γ⁻¹. Equivariance of a symbol is φ(γD)=ρ(γ)φ(D). |
| Polynomial convention | V_k consists of homogeneous degree-k polynomials. For γ=(a b;c d), P\|γ=P(dX−cY,−bX+aY). This is the row-adjugate right convention. |
| Current library convention | Current Tau Ceti's column-adjugate polynomial action gives this action after transposition. Reuse its carrier and actions; prove the convention dictionary. |
| Duality | The determinant pairing with the ordinary symmetric-power module is perfect when k! is invertible. Over Z use the divided-power lattice; the XY pairing at k=2 is −1/2. |
| Hecke at Γ₁ level | The good-prime diagonal term includes σ_ℓ diag(ℓ,1), where the lower-right entry of σ_ℓ is ℓ modulo N. The character multiplier is ε(ℓ). |
| Diamonds | Identify Γ₀(N)/Γ₁(N) by the lower-right entry modulo N. Upper-left identification inverts the character. |
| Period symbol | ψ_f({s}−{r})=2πi ∫ᵣˢ f(z)(zX+Y)^k dz. The current homological periodMap has no 2πi; transport through the swapped-polynomial pairing. |
| Signed symbol | ψ_f^s=(1+sι)ψ_f, without a factor 1/2. A signed line is one-dimensional; the unsplit f-isotypic space is two-dimensional. The span of ψ_f itself is still one-dimensional. |
| Period coordinates | A nonzero algebraic basis φ determines Ω_symbol by ψ_f^s=Ω_symbol φ. Scaling φ by λ scales Ω_symbol by λ⁻¹. No canonical coefficient-field basis is chosen. |
| Pollack–Stevens periods | Their label is the ι-sign times (−1)^k. With their path convention, Ω_PS=−Ω_symbol/2. This distinction is required when using their interpolation expression. |
| Twisting | Gauss sums use τ(χ)=Σ χ(a)exp(2πia/m). The resulting complex L-value is L(f,χ⁻¹,j+1). This inverse matters for non-real characters. |
| Refinement group | Use Γ₁(N)∩Γ₀(p). If p divides N this is Γ₁(N); there is no unnecessary level replacement. At a bad prime α is the actual nonzero a_p, rather than a root manufactured from the good-prime polynomial. |
| p-adic divisor | L_p is Φ({∞}−{0}) restricted to Z_p^×. Reversing this divisor negates the distribution. |
| Eigenline | Require the complete good-Hecke, bad-prime U, diamond and sign eigensystem. U_p alone does not specify the critical eigenline. |
| Local topology | Locally analytic test functions have the LF topology from analytic Banach stages. Their continuous dual is not assigned a single fictitious Banach norm. Bounded and dagger moments are separate models. |
| Radius | The weight action and contraction on A[r] require r<p. The fractional transformation can have a pole for larger r. |
| Critical slope | Small-slope uniqueness uses h<k+1. At equality, classical interpolation values do not determine a distribution. Use a specified eigenlift or a reduced-family comparison. |
| Coefficient embeddings | Transport algebraic normalized coordinates and a specified p-adic place. An isometric completion map preserves slopes. No action of an algebraic embedding on transcendental complex periods is asserted. |

## Existing material and ownership

The reproducible baseline is Mathlib **082e2d37e8b0463410cdb532e111cd43d5a66174** and Tau Ceti **f790474821cf4256814db967cb154e7af3d0c369**. Its declaration statements, including their hypotheses, are recorded in the packet. Native representations, cohomology, coinvariants, homogeneous polynomial modules, flatness, finite presentation, polynomial functional calculus and projections are reused.

The public pinned Γ₀ Hecke interface is `HeckeRing.GL2.commSemiringHeckeRingGamma0`, for nonzero N and commutative-semiring coefficients. The private commutative-ring spelling is not a reuse API. Native newforms are normalized new eigenforms away from the level; bad-prime eigenvalues and cross-level oldspace identification use ModularForms Layers 4–5. Native V_d has f(dz) with no extra determinant factor. Its q-expansion theorem requires the stated period and target-subgroup hypotheses.

Current TauCetiRoadmap main **070dc2becd74419e76303ede84b465ed4a69461f** and current Tau Ceti main **a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039** supply more than the pinned snapshot. In particular, `degreeZero`, `degreeZeroGLRep`, `degreeZeroRep`, the Manin development, the homological `ModularSymbols` module, `binaryFormRep`, `binaryFormAdjugateRep` and `periodMap` are existing ModularForms Layer-8 material. They are imports. This Part II specifies the Hom-side interfaces and the row/column, duality and normalization bridges. The pinned suggested file labels its supplier stand-ins explicitly; packaging against current main replaces them by imports.

ModularCurves supplies the genuine curve/local-system carrier; its Part II R14.3 supplies the full-level arithmetic comparisons. IntegralLattices already owns its quadratic-lattice development; it does not provide a canonical complex period basis. OperatorTheory's real/complex Hilbert-space roadmaps do not supply p-adic Banach Riesz theory. The requested p-adic functional analysis stays with LocallyAnalyticDistributions. PadicMeasuresIwasawaAlgebras owns bounded measures, Iwasawa transforms and their invariants. PadicFamilies L3 owns the general eigencurve, critical, secondary and two-variable theory. This roadmap consumes its single-form specializations.

## Construction order

L0 first turns the existing divisor presentation into equivariant Hom spaces. Restriction of a boundary symbol defines the Eisenstein subspace; the connecting cocycle gives the parabolic quotient. Hecke and diamond compatibility must be proved with the same coefficient convention before using Eichler–Shimura. Newform multiplicity one then gives signed eigenspaces. The rational full-level splitting uses spectral separation, rather than an arbitrary linear complement.

For that separation choose a sufficiently large prime ℓ≡1 mod N. In degree k the boundary eigenvalue is 1+ℓ^(k+1). Shokurov's Theorem 4.3 and Corollary 4.4 (§4, pp.638–641) give the higher-weight rational Hecke-stable separation in his polynomial/homological conventions. Take A=T_ℓ, G=X−(1+ℓ^(k+1)), and F the characteristic polynomial of A on the parabolic subspace. Cayley–Hamilton and exclusion of the boundary eigenvalue give coprime annihilators. If aF+bG=1, the projector is b(A)G(A); it fixes the parabolic space and has image in it. Commutation gives Hecke equivariance and uniqueness. The remaining transport to the cohomological local system and all arithmetic components is explicitly recorded below. The splitting is rational; the integral test shows why integral coprimality cannot be inferred.

L1 chooses bases of signed eigenspaces and then intersects them with integral symbols. A saturated rank-one lattice over a PID has a generator only up to a unit. A local coefficient field does not come with a complex embedding: scalar complex periods require a specified field embedding, while the abstract integral line always makes sense. Twisted Mellin evaluation and its parity character give algebraic normalized values. The trivial-conductor comparison has a second Euler factor when the U_p eigenform was obtained by stabilizing a primitive form.

L2 builds the weight action on the existing analytic distribution spaces. Bounded moments identify the dual of A[1]; dagger moments have subexponential growth. Specialization takes the first k+1 moments with coefficients (−1)^j binom(k,j), so its kernel is substantial. Generator lifts and the difference equation construct dagger lifts; U_p improves the radius to the bounded space on nonzero eigenspaces. Compactness, the fibre's invariant lattice and the imported Riesz theory yield control below k+1. Evaluation at {∞}−{0} gives the locally analytic unit distribution. Local moment identities precede character interpolation. To pass from all character values to local moments, extend coefficients to the splitting field of each finite quotient and use finite Fourier inversion; characters valued in a single finite extension need not be enough.

L3 uses a unique full-eigenlift certificate at a non-θ-critical point. A θ-critical primary vector specializes to zero; the top generalized vector supplies the classical data through the imported secondary theory. On a reduced affinoid, equality on a Zariski-dense set is encoded by zero intersection of evaluation kernels. This is the valid continuation input for critical arithmetic comparisons. The numerical level-11 observations are certificate targets, with their remaining verification named below.

L4 deletes an Euler factor at ℓ≠p using native degeneracy operators and compatible symbol bases. At a good prime the distribution operator is 1−a_ℓ/ℓ[ℓ⁻¹]+ε(ℓ)ℓ^(k−1)[ℓ⁻²]; at a bad prime omit the quadratic term. Here [u]μ(g)=μ(g(u·)). Its value on χ(z)z^j is 1−a_ℓχ(ℓ)⁻¹ℓ^(−j−1)+ε(ℓ)χ(ℓ)⁻²ℓ^(k−2j−1), with the final term only in the good case. Small-slope uniqueness turns the normalized classical comparison into distribution equality. At critical slope use the family/eigenlift comparison.

At a_p=0 the even and odd cyclotomic products divide the corresponding refined combinations. Divisibility must hold in the algebra of functions analytic on the open disc: divisibility in the formal power-series ring alone says nothing, because the half-logarithms have nonzero constant term. Two-sided radial growth then makes the quotients bounded. Every nonzero bounded branch has finitely many zeros; a zero branch has infinitely many and is permitted. At p=2 the half-logarithms exchange roles, and the elliptic integral-period convention needs the factor 1/2. Supersingular a_p≠0 at p=2 or 3 is covered by the two refined functions and their zero statements, without adding a general sharp/flat decomposition to this roadmap.

## Layer targets, API and discriminating tests

The catalogue is organized by mathematical targets rather than by source sections. Each item specifies its inputs, construction or proof route, API where it introduces an object, acceptance properties, and exact source locators. An existing-object interface is a convention bridge, not a request to rebuild its carrier.

### L0: Modular symbols and Hecke actions

<a id="L0-modular-symbols"></a>

#### Modular symbols

**Target `L0/modular-symbols` (definition).** For Γ ≤ SL₂(ℤ) of finite index and a right ℤ[Γ]-module V, Symb_Γ(V) is the group of additive maps φ : Δ₀ → V with φ(γD) = φ(D)|γ^{-1} for all γ ∈ Γ, D ∈ Δ₀, where Δ₀ = Div⁰(P¹(ℚ)) is the degree-zero divisor module with its action of GL₂⁺(ℚ) by linear fractional transformations (imported from ModularForms Layer 8, see requests). In the formal version V carries the left representation ρ(γ)v = v|γ^{-1}, and the condition reads φ(γD) = ρ(γ)φ(D); equivalently Symb_Γ(V) = Hom_{ℤ[Γ]}(Δ₀, V).

**Hypotheses and boundaries.**

- Γ acts on Δ₀ through SL₂(ℤ) → GL₂(ℚ).
- Left/right conventions: Pollack–Stevens' right action v|γ is recorded as the left representation v ↦ v|γ^{-1}.

**Inputs.** `mathlib:Representation`, `mathlib:AddSubgroup`, `mathlib:Matrix.SpecialLinearGroup.map`, `mathlib:Matrix.SpecialLinearGroup.toGL`, `mathlib:CongruenceSubgroup.Gamma0`.

**Build plan.**

1. Define symbols Γ ρ as the additive subgroup of maps Δ₀ → V satisfying the equivariance; closure under sums and negatives is immediate.
2. A modular symbol is determined by its values on the unimodular divisors {γ0} − {γ∞}, because these generate Δ₀ (Manin's theorem, imported from ModularForms Layer 8).

**API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `TauCeti.ModularSymbol.symbols` | constructor | Symb_Γ(V) as an additive subgroup of Hom(Δ₀, V). |
| `TauCeti.ModularSymbol.symbols_ext` | extensionality | Determined by the values on unimodular divisors. |
| `TauCeti.ModularSymbol.heckeT_mem_symbols` | compatibility | Hecke operators preserve Γ₀(N)-symbols. |

**Unit tests.**

- `symbols_SL2Z_trivial` (example): Symb_{SL₂(ℤ)}(ℤ) = 0.
- `symbols_Gamma0_11_rank` (example): Symb_{Γ₀(11)}(ℤ) has rank 3.
- `symbols_zero` (example): The zero map is a modular symbol for every Γ and V.

**Acceptance.**

- Symb_{SL₂(ℤ)}(ℤ) = 0: by the Manin relations φ({0} − {∞}) = v satisfies 2v = 0 and 3v = 0.
- Symb_{Γ₀(11)}(ℤ) has rank 3 = 2g + (c − 1), with genus g = 1 and c = 2 cusps.
- When the orders of torsion elements act invertibly on V, Symb_Γ(V) ≅ H¹_c(H/Γ, Ṽ) (Pollack–Stevens, citing Ash–Stevens [2, Prop. 4.2]); planned as remaining work.

**Sources.** [Robert Pollack and Glenn Stevens, Overconvergent modular symbols and p-adic L-functions](https://www.numdam.org/item/10.24033/asens.2139.pdf), §2.1, pp. 6–7. The definition, with ϕ ∈ SymbΓ(V) ⟺ ϕ(γD) = ϕ(D)|γ⁻¹.

<a id="L0-coset-basis"></a>

#### ℤ[SL₂(ℤ)] is free over ℤ[Γ]

**Target `L0/coset-basis` (lemma).** For Γ ≤ G of finite index in a group G (here G = SL₂(ℤ) or PSL₂(ℤ)), ℤ[G] is a free left ℤ[Γ]-module with basis any set of right coset representatives {g_j} of Γ\G; consequently Hom_{ℤ[Γ]}(ℤ[G], V) ≅ ∏_j V by F ↦ (F(g_j))_j.

**Hypotheses and boundaries.**

- Γ acts by left multiplication through the inclusion.

**Inputs.** `mathlib:Module.Free`, `mathlib:MonoidAlgebra.mapDomainRingHom`.

**Build plan.**

1. SL₂(ℤ) = ⊔_i Γ g_i gives ℤ[SL₂(ℤ)] = ⊕_i ℤ[Γ]g_i, and γ g_i ↦ (γ, i) is a bijection Γ × (Γ\SL₂(ℤ)) → SL₂(ℤ).

**Acceptance.**

- For finite index the basis is finite, of size [SL₂(ℤ) : Γ].
- Combined with the Manin relations this gives the ℤ[Γ]-presentation of Δ₀ by coset generators.

**Sources.** [Robert Pollack and Glenn Stevens, Overconvergent modular symbols and p-adic L-functions](https://www.numdam.org/item/10.24033/asens.2139.pdf), §2.2, p. 8. The statement.

<a id="L0-polynomial-coefficients"></a>

#### The coefficient modules V_k = Sym^k

**Target `L0/polynomial-coefficients` (definition).** For a commutative ring R and k ≥ 0, V_k(R) is the R-module of homogeneous polynomials of degree k in X, Y, with the right action of integral matrices of nonzero determinant (P|γ)(X, Y) = P((X, Y)·γ*) = P(dX − cY, −bX + aY) for γ = (a b; c d), γ* its adjugate; restricted to Γ it gives the left representation γ ↦ (P ↦ P|γ^{-1}).

Reuse the current ModularForms Layer-8 library carriers and actions; this target specifies only the Hom-side interface and convention transport. See upstreamNotes for commits and the transposition/period dictionary.

**Hypotheses and boundaries.**

- The adjugate keeps the action integral, so it is defined for the monoid of integral matrices, not only GL₂(ℚ).
- The row-adjugate right action differs from current Tau Ceti’s column-adjugate left action: slashVk(γ)=binaryFormAdjugateRep(γ.transpose) on the same homogeneous polynomial module. Current BinaryForms is a reuse boundary; this transposition dictionary, not a duplicate polynomial carrier, is the new task.

**Inputs.** `mathlib:MvPolynomial.homogeneousSubmodule`, `mathlib:MvPolynomial.aeval`, `mathlib:Matrix.adjugate`, `mathlib:Representation`.

**Build plan.**

1. V_k(R) := MvPolynomial.homogeneousSubmodule (Fin 2) R k; P|γ := aeval of the substitution X ↦ dX − cY, Y ↦ −bX + aY, which preserves degree k.
2. Right action: (γδ)* = δ*γ* gives P|(γδ) = (P|γ)|δ.

**API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `TauCeti.ModularSymbol.Vk` | constructor | V_k(R). |
| `TauCeti.ModularSymbol.slashVk` | structure | The right action P\|γ. |
| `TauCeti.ModularSymbol.slashVk_mul` | functoriality | P\|(γδ) = (P\|γ)\|δ. |
| `TauCeti.ModularSymbol.vkRep` | other | The left representation of Γ. |

**Unit tests.**

- `vk_rank` (example): rank V_k(R) = k + 1.
- `vk_scalar` (example): c·1 acts by c^k.
- `vk_zero` (example): V_0 has the trivial action.

**Acceptance.**

- rank V_k(R) = k + 1.
- A scalar matrix c·1 acts by c^k.
- V_0 is the trivial representation; Pollack–Stevens use V_k = Sym^k(ℚ_p²) with the same formula.

**Sources.** [Robert Pollack and Glenn Stevens, Overconvergent modular symbols and p-adic L-functions](https://www.numdam.org/item/10.24033/asens.2139.pdf), §3.4, p. 17. The action.

<a id="L0-hecke-monoid"></a>

#### The monoid Σ₀(N)

**Target `L0/hecke-monoid` (construction).** Σ₀(N) is the monoid of integral matrices (a b; c d) with nonzero determinant, N | c and (a, N) = 1; it contains Γ₀(N) and the matrices (ℓ 0; 0 1) for (ℓ, N) = 1 and (1 a; 0 ℓ) for all a, ℓ ≥ 1.

**Hypotheses and boundaries.**

- N ≥ 1.

**Inputs.** `mathlib:Submonoid`, `mathlib:CongruenceSubgroup.Gamma0`.

**Build plan.**

1. Closure: the lower-left entry of a product is c a′ + d c′ ≡ 0 mod N, and the upper-left entry a a′ + b c′ ≡ a a′ mod N is prime to N; determinants multiply.

**API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `TauCeti.ModularSymbol.Sigma0` | constructor | Σ₀(N) as a submonoid. |
| `TauCeti.ModularSymbol.Gamma0_le_Sigma0` | relation | Γ₀(N) ⊆ Σ₀(N). |
| `TauCeti.ModularSymbol.toGLQ'` | coercion | Σ₀(N) → GL₂(ℚ). |

**Unit tests.**

- `sigma0_upper` (example): For ℓ≠0, (1 a;0 ℓ) belongs to Σ₀(N).
- `sigma0_diag` (example): For ℓ≠0, (ℓ 0;0 1) belongs to Σ₀(N) iff gcd(ℓ,N)=1.
- `sigma0_gamma0` (example): Γ₀(N) ⊆ Σ₀(N).

**Acceptance.**

- Γ₀(N) ⊆ Σ₀(N) (Gamma0_le_Sigma0).
- (1 a; 0 ℓ) ∈ Σ₀(N) for every a and ℓ ≥ 1; (ℓ 0; 0 1) ∈ Σ₀(N) iff (ℓ, N) = 1.
- This is Pollack–Stevens' S₀(p) with p replaced by N.

**Sources.** [Robert Pollack and Glenn Stevens, Overconvergent modular symbols and p-adic L-functions](https://www.numdam.org/item/10.24033/asens.2139.pdf), §2.1, p. 7. The monoid (for N = p).

<a id="L0-hecke-operators"></a>

#### Hecke operators on modular symbols

**Target `L0/hecke-operators` (construction).** For V with a right Σ₀(N)-action extending its Γ₀(N)-action, and φ ∈ Symb_{Γ₀(N)}(V): (φ|δ)(D) := φ(δD)|δ; for a prime ℓ ∤ N, φ|T_ℓ := φ|(ℓ 0; 0 1) + Σ_{a=0}^{ℓ−1} φ|(1 a; 0 ℓ); for q | N, φ|U_q := Σ_{a=0}^{q−1} φ|(1 a; 0 q). These preserve Symb_{Γ₀(N)}(V) and commute.

**Hypotheses and boundaries.**

- V's Γ₀(N)-action is the restriction of the Σ₀(N)-action.
- The suggested coefficient action is a monoid homomorphism from the opposite matrix semigroup to module endomorphisms, and its restriction is ρ(γ⁻¹). Preservation and commutativity apply to equivariant symbols, not arbitrary divisor maps.

**Inputs.** [L0/hecke-monoid](#L0-hecke-monoid), [L0/modular-symbols](#L0-modular-symbols), `tauceti:HeckeRing.GL2.commSemiringHeckeRingGamma0`.

**Build plan.**

1. The listed matrices are representatives of Γ₀(N)\Γ₀(N)(ℓ 0; 0 1)Γ₀(N) (resp. for U_q); right multiplication by γ ∈ Γ₀(N) permutes the cosets, so Σ φ|α_i is again Γ₀(N)-invariant.
2. The operators come from an action of the Γ₀(N) Hecke ring of double cosets on Symb_{Γ₀(N)}(V), with T_ℓ the class of Γ₀(N)(ℓ 0; 0 1)Γ₀(N); commutativity follows from commutativity of that ring (Tau Ceti HeckeRing.GL2.commRingHeckeRingGamma0).

**API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `TauCeti.ModularSymbol.slash` | structure | (φ\|δ)(D) = φ(δD)\|δ. |
| `TauCeti.ModularSymbol.heckeT` | constructor | T_ℓ. |
| `TauCeti.ModularSymbol.heckeU` | constructor | U_q. |
| `TauCeti.ModularSymbol.heckeT_comm` | relation | T_ℓ T_m = T_m T_ℓ. |

**Unit tests.**

- `hecke_T2_Gamma0_11` (example): charpoly T_2 on Symb_{Γ₀(11)}(ℤ) is (x − 3)(x + 2)².
- `hecke_T3_Gamma0_11` (example): charpoly T_3 on Symb_{Γ₀(11)}(ℤ) is (x − 4)(x + 1)².
- `hecke_preserves` (characterisation): T_ℓ maps Γ₀(N)-symbols to Γ₀(N)-symbols.

**Acceptance.**

- On Symb_{Γ₀(11)}(ℤ), T_2 has characteristic polynomial (x − 3)(x + 2)²: eigenvalue 3 on the boundary (Eisenstein) part and a₂(11a) = −2 on the plus and minus parts.
- On the same space T_3 has characteristic polynomial (x − 4)(x + 1)².
- U_q is defined without the (q 0; 0 1) term.

**Sources.** [Robert Pollack and Glenn Stevens, Overconvergent modular symbols and p-adic L-functions](https://www.numdam.org/item/10.24033/asens.2139.pdf), §2.1, p. 7. The formulas.

<a id="L0-involution-at-infinity"></a>

#### The involution at infinity

**Target `L0/involution-at-infinity` (construction).** ι = (−1 0; 0 1) acts on P¹(ℚ) by x ↦ −x; when ι normalises Γ (for instance Γ = Γ₀(N)) and V carries a compatible action of ι, φ ↦ φ|ι is an involution of Symb_Γ(V).

**Hypotheses and boundaries.**

- ι normalises Γ; V has an action of the monoid generated by Γ and ι.

**Inputs.** [L0/modular-symbols](#L0-modular-symbols), `mathlib:Matrix.GeneralLinearGroup`, `mathlib:CongruenceSubgroup.Gamma0`.

**Build plan.**

1. ι² = 1; ι Γ₀(N) ι^{-1} = Γ₀(N) since conjugation changes the signs of b and c; (φ|ι)|ι = φ.

**API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `TauCeti.ModularSymbol.iota` | constructor | ι ∈ GL₂(ℚ). |
| `TauCeti.ModularSymbol.iota_mul_self` | simp | ι² = 1. |
| `TauCeti.ModularSymbol.iota_normalizes_Gamma0` | relation | ι normalises Γ₀(N). |
| `TauCeti.ModularSymbol.iota_smul` | simp | ι · x = −x. |

**Unit tests.**

- `iota_zero` (example): ι fixes 0 and ∞.
- `iota_sq` (example): ι² = 1.
- `iota_not_SL2` (non-example): ι ∉ SL₂(ℤ) (determinant −1).

**Acceptance.**

- ι · x = −x on P¹(ℚ) and fixes 0 and ∞.
- It is not in SL₂(ℤ) (det ι = −1).

**Sources.** [Robert Pollack and Glenn Stevens, Overconvergent modular symbols and p-adic L-functions](https://www.numdam.org/item/10.24033/asens.2139.pdf), §2.1, p. 7. The statement.

<a id="L0-plus-minus-decomposition"></a>

#### The plus/minus decomposition

**Target `L0/plus-minus-decomposition` (lemma).** If ι normalises Γ and 2 acts invertibly on V, then Symb_Γ(V) = Symb_Γ(V)^+ ⊕ Symb_Γ(V)^− into ±1-eigenspaces of ι, via φ = (φ + φ|ι)/2 + (φ − φ|ι)/2; the decomposition is preserved by the Hecke operators when ι commutes with them.

**Hypotheses and boundaries.**

- 2 invertible on V.

**Inputs.** [L0/involution-at-infinity](#L0-involution-at-infinity), [L0/modular-symbols](#L0-modular-symbols), [L0/hecke-operators](#L0-hecke-operators).

**Build plan.**

1. The idempotents (1 ± ι)/2 are defined since 2 is invertible and ι² = 1.

**Acceptance.**

- Over ℤ the decomposition fails in general: Symb^+ ⊕ Symb^− has index a power of 2.
- Hecke operators T_ℓ commute with ι (ι normalises the double cosets).

**Sources.** [Robert Pollack and Glenn Stevens, Overconvergent modular symbols and p-adic L-functions](https://www.numdam.org/item/10.24033/asens.2139.pdf), §2.1, p. 7. The statement.

<a id="L0-symbols-coset-description"></a>

#### Modular symbols as functions on cosets (Manin symbols, cohomological side)

**Target `L0/symbols-coset-description` (lemma).** Let Γ ≤ SL₂(ℤ) have finite index, let {g_j} be right coset representatives of Γ\SL₂(ℤ), and let V be a right ℤ[Γ]-module. For g ∈ SL₂(ℤ) write g = γ_g g_{j(g)} with γ_g ∈ Γ. The map φ ↦ (v_j)_j, v_j := φ({g_j 0} − {g_j ∞}), is an isomorphism from Symb_Γ(V) onto the families (v_j) ∈ ∏_j V such that, for every j, with x(g) := v_{j(g)}|γ_g^{-1}: x(g_j) + x(g_j σ) = 0, x(g_j) + x(g_j τ) + x(g_j τ²) = 0, and x(g_j) = x(−g_j), where σ = (0 −1; 1 0) and τ = (0 −1; 1 −1).

**Hypotheses and boundaries.**

- Γ has finite index in SL₂(ℤ).
- The relation list is the image of Manin's kernel ℤ[G](1 + σ) + ℤ[G](1 + τ + τ²) + ℤ[G](1 − (−1)) under the coset basis.

**Inputs.** [L0/modular-symbols](#L0-modular-symbols), [L0/coset-basis](#L0-coset-basis), `mathlib:Matrix.SpecialLinearGroup`, `mathlib:MonoidAlgebra`.

**Build plan.**

1. By Manin's theorem (requested from ModularForms Layer 8) d : ℤ[SL₂(ℤ)] → Δ₀, g ↦ {g0} − {g∞}, is surjective with kernel the left ideal I generated by 1 + σ, 1 + τ + τ² and 1 − (−1); so Symb_Γ(V) = Hom_{ℤ[Γ]}(ℤ[SL₂(ℤ)]/I, V).
2. A ℤ[Γ]-linear map F : ℤ[SL₂(ℤ)] → V is determined by the values F(g_j) on the coset basis (coset-basis), with F(γ g_j) = F(g_j)|γ^{-1}.
3. F kills I iff F(g(1 + σ)) = F(g(1 + τ + τ²)) = F(g(1 − (−1))) = 0 for every g; by Γ-equivariance it suffices to take g = g_j, and F(g) = x(g) by the first step.
4. Hence evaluation at the unimodular divisors d(g_j) identifies Symb_Γ(V) with the stated set of families.

**Acceptance.**

- For Γ = SL₂(ℤ) (one coset, g₁ = 1) and V = ℤ with trivial action the conditions read 2v = 0 and 3v = 0, so Symb_{SL₂(ℤ)}(ℤ) = 0.
- For Γ = Γ₀(11) (12 cosets) and V = ℤ the solution module has rank 3, matching Pollack's worked Γ₀(11) example.
- Changing the coset representatives changes the isomorphism by the corresponding γ-twists and not its image.

**Sources.** [Robert Pollack and Glenn Stevens, Overconvergent modular symbols and p-adic L-functions](https://www.numdam.org/item/10.24033/asens.2139.pdf), §2.2, p. 8. The Hom-side description by coset values and the two-term and three-term relations. [Gabor Wiese, Computational Arithmetic of Modular Forms (course notes)](https://arxiv.org/pdf/1809.04645v1), §5.1, Definition 5.6 and Theorem 5.7, p. 56. The homological Manin-symbol presentation, of which this lemma is the Hom-side dual.

<a id="L0-symbols-generator-values"></a>

#### A modular symbol is determined by its values on the fundamental-domain generators

**Target `L0/symbols-generator-values` (theorem).** Let Γ ⊊ PSL₂(ℤ) have finite index and contain T = (1 1; 0 1), and let D₁, …, D_t, D_∞, D′₁, …, D′_s, D″₁, …, D″_r be the generators of Δ₀ read off a Farey fundamental domain, with the matrices γ_i, γ′_i (order 2) and γ″_i (order 3) in Γ (Pollack–Stevens §§2.4–2.5; the presentation is imported from ModularForms Layer 8). For a right Γ-module V and v₁, …, v_t, v_∞, v′₁, …, v′_s, v″₁, …, v″_r ∈ V with v_∞|Δ = Σ_i v_i|(1 − γ_i) − Σ_i v′_i − Σ_i v″_i (Δ := T − 1), v′_i|(1 + γ′_i) = 0 and v″_i|(1 + γ″_i + γ″_i²) = 0, there is a unique φ ∈ Symb_Γ(V) with φ(D_i) = v_i, φ(D_∞) = v_∞, φ(D′_i) = v′_i and φ(D″_i) = v″_i; every φ arises so. This is Pollack–Stevens' Corollaries 2.7 and 2.10 with the sign of the D_∞ relation corrected (sourceIssues E1).

**Hypotheses and boundaries.**

- Γ has finite index in PSL₂(ℤ), contains T and is proper (for the three-torsion version); for Γ ≤ SL₂(ℤ) apply it to the image Γ̄ and to V^{⟨−1⟩∩Γ}, since −1 acts trivially on Δ₀.
- The relations among the generators are Σ_i (γ_i^{-1} − 1)D_i + Σ_i D′_i + Σ_i D″_i = (1 − T^{-1})D_∞, (1 + γ′_i)D′_i = 0 and (1 + γ″_i + γ″_i²)D″_i = 0.

**Inputs.** [L0/modular-symbols](#L0-modular-symbols), [L0/symbols-coset-description](#L0-symbols-coset-description), `mathlib:Matrix.SpecialLinearGroup`, `mathlib:CongruenceSubgroup.Gamma0`.

**Build plan.**

1. Theorem 2.6/2.9 of Pollack–Stevens, as corrected (request to ModularForms Layer 8): Δ₀ is generated over ℤ[Γ] by the D's with the displayed relations. The relation is derived from the printed boundary relation (1 − T^{-1})e_∞ + Σ(1 − γ_i^{-1})e_i + Σ e′_i ∈ J on p. 11 by applying ∂, with D′_i = −∂(e′_i).
2. A ℤ[Γ]-linear map out of a presented module is the same as values on the generators satisfying the relations.
3. Apply φ(γD) = φ(D)|γ^{-1} to the first relation: Σ v_i|(γ_i − 1) + Σ v′_i + Σ v″_i = v_∞ − v_∞|T = −v_∞|Δ; the torsion relations give v′_i|(1 + γ′_i) = 0 and v″_i|(1 + γ″_i + γ″_i²) = 0 because γ′_i, γ″_i have order 2, 3 in PSL₂(ℤ).

**Acceptance.**

- Γ₀(2) (t = 0, s = 1, F the ideal triangle with vertices −1, 0, ∞, γ′₁ = (1 1; −2 −1)): D′₁ = (1 − T^{-1})D_∞ = {0} − {−1}; with the printed sign the relation would force 2D′₁ = 0 in the torsion-free Δ₀.
- Γ₀(11) with V = V_k: the relation matches Pollack's worked example (1 − (1 −1; 0 1))({0} − {∞}) + Σ(1 − γ)D = 0 (AWS notes, footnote 10), whose γ is Pollack–Stevens' γ_i^{-1}.
- For V = ℚ with trivial action the conditions reduce to Σ_i v′_i + Σ_i v″_i = 0 and v′_i = v″_i = 0 (2, 3 invertible), so dim Symb_Γ(ℚ) = t + 1.

**Sources.** [Robert Pollack and Glenn Stevens, Overconvergent modular symbols and p-adic L-functions](https://www.numdam.org/item/10.24033/asens.2139.pdf), Theorem 2.6 and Corollary 2.7, p. 12; Theorem 2.9 and Corollary 2.10, pp. 13–14. The statement, with the D_∞ condition corrected from the printed v_∞|Δ = Σ v_i|(γ_i − 1) + Σ v′_i (sourceIssues E1). [Robert Pollack and Glenn Stevens, Overconvergent modular symbols and p-adic L-functions](https://www.numdam.org/item/10.24033/asens.2139.pdf), §2.4, p. 11. The boundary relation from which the corrected sign follows. [Robert Pollack, Overconvergent modular symbols (Arizona Winter School 2011 lecture notes)](https://swc-math.github.io/aws/2011/2011PollackNotes.pdf), §2.6, footnote 10, p. 8. An independent worked relation with the corrected sign.

<a id="L0-boundary-symbols"></a>

#### Boundary symbols

**Target `L0/boundary-symbols` (definition).** For Γ ≤ SL₂(ℤ) of finite index and a right ℤ[Γ]-module V, BSymb_Γ(V) := Hom_{ℤ[Γ]}(ℤ[P¹(ℚ)], V), the maps ψ : P¹(ℚ) → V with ψ(γc) = ψ(c)|γ^{-1}. Restriction along Δ₀ ⊆ ℤ[P¹(ℚ)] gives res : BSymb_Γ(V) → Symb_Γ(V), whose image Eis_Γ(V) is the module of Eisenstein (boundary) symbols. Choosing representatives c₁, …, c_ν of the finitely many cusps Γ\P¹(ℚ) gives BSymb_Γ(V) ≅ ⊕_j V^{Γ_{c_j}}, ψ ↦ (ψ(c_j))_j, where Γ_c is the stabiliser of c.

**Hypotheses and boundaries.**

- Γ has finite index, so Γ\P¹(ℚ) is finite (P¹(ℚ) = SL₂(ℤ)/⟨±T⟩ as an SL₂(ℤ)-set).
- V^{Γ_c} is the invariants for the right action, v|γ = v for γ ∈ Γ_c.

**Inputs.** [L0/modular-symbols](#L0-modular-symbols), `mathlib:Representation.ofMulAction`, `mathlib:Rep.ofMulAction`, `mathlib:OnePoint`.

**Build plan.**

1. ℤ[P¹(ℚ)] = ⊕_j ℤ[Γ/Γ_{c_j}] as a left ℤ[Γ]-module, since P¹(ℚ) is the disjoint union of the orbits Γc_j ≅ Γ/Γ_{c_j}.
2. Hom_{ℤ[Γ]}(ℤ[Γ/H], V) ≅ V^H for H ≤ Γ (Frobenius reciprocity for permutation modules), giving the cusp description.
3. res is ℤ-linear and Γ-compatible because Δ₀ is a ℤ[Γ]-submodule of ℤ[P¹(ℚ)].

**API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `TauCeti.ModularSymbol.bsymbols` | constructor | BSymb_Γ(V) = Hom_{ℤ[Γ]}(ℤ[P¹(ℚ)], V). |
| `TauCeti.ModularSymbol.bsymbols.res` | projection | res : BSymb_Γ(V) → Symb_Γ(V), restriction along Δ₀ ⊆ ℤ[P¹(ℚ)]. |
| `TauCeti.ModularSymbol.bsymbolsEquivCusps` | equivalence | BSymb_Γ(V) ≃ ⊕_{c ∈ Γ\P¹(ℚ)} V^{Γ_c} after choosing cusp representatives. |
| `TauCeti.ModularSymbol.eisSymbols` | constructor | Eis_Γ(V) := range res. |
| `TauCeti.ModularSymbol.eisSymbols_hecke` | compatibility | Eis_Γ(V) is stable under T_ℓ, U_q, ⟨d⟩ and ι. |

**Unit tests.**

- `bsymbols_SL2Z` (example): BSymb_{SL₂(ℤ)}(ℤ) ≅ ℤ (one cusp).
- `bsymbols_Gamma0_p` (example): BSymb_{Γ₀(p)}(ℤ) ≅ ℤ² for p prime (cusps ∞, 0).
- `eis_eq_bot_of_V_trivial_level_one` (example): Eis_{SL₂(ℤ)}(ℤ) = 0.
- `bsymbols_res_ne_injective` (non-example): res is not injective: the constant map c ↦ v with v ∈ V^Γ restricts to 0 on Δ₀.

**Acceptance.**

- For Γ = SL₂(ℤ) and V = ℤ (one cusp, stabiliser ⟨±T⟩), BSymb ≅ ℤ consists of the constant functions and res = 0.
- For Γ₀(p), p prime, there are two cusps ∞ and 0 and BSymb_{Γ₀(p)}(ℤ) ≅ ℤ².
- Eis_Γ(V) is stable under the Hecke operators of hecke-operators.

**Sources.** [Gabor Wiese, Computational Arithmetic of Modular Forms (course notes)](https://arxiv.org/pdf/1809.04645v1), §1.2, Definition 1.5(b)–(e), pp. 7–8. The homological boundary and Eisenstein symbols; this node is their Hom-side dual. [Gabor Wiese, Computational Arithmetic of Modular Forms (course notes)](https://arxiv.org/pdf/1809.04645v1), §4.3, Lemma 4.13, p. 49. The orbit and stabiliser description behind the cusp decomposition.

<a id="L0-symbols-to-cohomology"></a>

#### The map from modular symbols to group cohomology

**Target `L0/symbols-to-cohomology` (construction).** For φ ∈ Symb_Γ(V) (V with the left representation ρ(γ)v = v|γ^{-1}) and a base cusp x ∈ P¹(ℚ), c_φ(γ) := φ({γx} − {x}) is a 1-cocycle of Γ with values in (V, ρ); its class δ(φ) ∈ H¹(Γ, V) does not depend on x, and δ : Symb_Γ(V) → H¹(Γ, V) is ℤ-linear. Up to sign δ is the connecting homomorphism of Hom_Γ(−, V) applied to 0 → Δ₀ → ℤ[P¹(ℚ)] → ℤ → 0.

**Hypotheses and boundaries.**

- Γ ≤ SL₂(ℤ) of finite index; V a right ℤ[Γ]-module, equivalently the left representation ρ.
- H¹(Γ, V) is Mathlib's groupCohomology of the representation (V, ρ) in degree 1.

**Inputs.** [L0/modular-symbols](#L0-modular-symbols), `mathlib:groupCohomology`, `mathlib:groupCohomology.δ`.

**Build plan.**

1. Cocycle identity: c_φ(γη) = φ({γηx} − {γx}) + φ({γx} − {x}) = ρ(γ)c_φ(η) + c_φ(γ).
2. Base change x ↦ y changes c_φ by the coboundary γ ↦ (ρ(γ) − 1)φ({y} − {x}).
3. Comparison with the connecting map: extend φ to ψ : ℤ[P¹(ℚ)] → V by ψ({c}) := φ({c} − {x}); then ψ∘ρ-twisting minus ψ factors through the degree and equals −c_φ.

**API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `TauCeti.ModularSymbol.toH1` | constructor | δ : Symb_Γ(V) →ₗ H¹(Γ, V). |
| `TauCeti.ModularSymbol.toH1_cocycle` | characterisation | δ(φ) is represented by γ ↦ φ({γx} − {x}) for any base cusp x. |
| `TauCeti.ModularSymbol.toH1_eis` | simp | δ ∘ res = 0. |
| `TauCeti.ModularSymbol.toH1_hecke` | compatibility | δ(φ\|T) = δ(φ)\|T for the double-coset Hecke operators on H¹. |

**Unit tests.**

- `toH1_base_point` (characterisation): the classes for base cusps ∞ and 0 agree.
- `toH1_res_eq_zero` (example): δ(res ψ) = 0 for every boundary symbol ψ.
- `toH1_level_one_trivial` (example): δ = 0 for Γ = SL₂(ℤ) and V = ℤ, since both sides vanish.

**Acceptance.**

- For V = ℂ trivial, Γ = Γ₀(N) and φ = ψ_f of a weight-two cusp form, δ(φ) is the homomorphism γ ↦ 2πi ∫_x^{γx} f(z) dz.
- δ kills Eis_Γ(V): for φ = res(ψ), c_φ(γ) = ψ(γx) − ψ(x) = (ρ(γ) − 1)ψ(x) is a coboundary.
- δ is compatible with the Hecke operators defined on H¹ by double cosets (Wiese Definition 7.21).

**Sources.** [Gabor Wiese, Computational Arithmetic of Modular Forms (course notes)](https://arxiv.org/pdf/1809.04645v1), §6.2, proof of Proposition 6.7(a), p. 63. The same base-point cocycle and base-point independence, for period integrals. [Gabor Wiese, Computational Arithmetic of Modular Forms (course notes)](https://arxiv.org/pdf/1809.04645v1), §5.1, Lemma 5.2, p. 55. The short exact sequence whose connecting map δ is.

<a id="L0-symbols-cohomology-sequence"></a>

#### The boundary exact sequence for modular symbols

**Target `L0/symbols-cohomology-sequence` (theorem).** For Γ ≤ SL₂(ℤ) of finite index and any right ℤ[Γ]-module V the sequence 0 → V^Γ → BSymb_Γ(V) → Symb_Γ(V) → H¹(Γ, V) → ⊕_{c ∈ Γ\P¹(ℚ)} H¹(Γ_c, V) is exact, where the first map sends v to the constant function, the second is res, the third is δ (symbols-to-cohomology) and the last is the product of the restrictions to the cusp stabilisers (choosing representatives).

**Hypotheses and boundaries.**

- No invertibility hypothesis: the sequence is exact integrally.
- The cusp stabilisers Γ_c are the conjugates of Γ ∩ ⟨±T⟩, cyclic modulo ±1.

**Inputs.** [L0/boundary-symbols](#L0-boundary-symbols), [L0/symbols-to-cohomology](#L0-symbols-to-cohomology), `mathlib:groupCohomologyIsoExt`, `mathlib:groupCohomology.coindIso`, `mathlib:groupCohomology.mapShortComplex₂_exact`, `mathlib:groupCohomology.mapShortComplex₃_exact`, `mathlib:groupCohomology.resNatTrans`.

**Build plan.**

1. Apply Hom_{ℤ[Γ]}(−, V) to 0 → Δ₀ → ℤ[P¹(ℚ)] → ℤ → 0 (degree sequence, imported with Δ₀) and take the long exact Ext sequence.
2. Ext⁰ = Hom_Γ gives V^Γ, BSymb_Γ(V) and Symb_Γ(V); Ext¹_{ℤ[Γ]}(ℤ, V) = H¹(Γ, V) (groupCohomologyIsoExt).
3. ℤ[P¹(ℚ)] = ⊕_c ℤ[Γ/Γ_c] = ⊕_c Ind_{Γ_c}^Γ ℤ, so Ext¹_{ℤ[Γ]}(ℤ[P¹(ℚ)], V) = ⊕_c Ext¹_{ℤ[Γ_c]}(ℤ, V) = ⊕_c H¹(Γ_c, V) (Shapiro/Eckmann), and the map from H¹(Γ, V) is restriction.
4. Identify the connecting homomorphism with δ up to sign (symbols-to-cohomology, last step).

**Acceptance.**

- Γ = Γ₀(11), V = ℚ: 0 → ℚ → ℚ² → ℚ³ → ℚ³ → ℚ², with H¹(Γ₀(11), ℚ) = Hom(Γ₀(11), ℚ) of dimension 3 = 2g + (c − 1) (the image of Γ₀(11) in PSL₂(ℤ) is free of rank 3), Eis of dimension 1 and image of δ the 2-dimensional parabolic part.
- For V with V^{Γ_c} = 0 at every cusp the boundary terms vanish and Symb_Γ(V) ↪ H¹(Γ, V).
- Exactness at Symb_Γ(V): ker δ = Eis_Γ(V).

**Sources.** [Gabor Wiese, Computational Arithmetic of Modular Forms (course notes)](https://arxiv.org/pdf/1809.04645v1), §4.4, Proposition 4.14, p. 50. The cusp-restriction sequence and its identification of the cusp terms, used for the last map. [Robert Pollack and Glenn Stevens, Overconvergent modular symbols and p-adic L-functions](https://www.numdam.org/item/10.24033/asens.2139.pdf), §2.1, p. 7. The topological form of the comparison, requested from ModularCurvesPartII R14.3; the algebraic sequence here needs no hypothesis.

<a id="L0-parabolic-cohomology"></a>

#### Parabolic cohomology

**Target `L0/parabolic-cohomology` (definition).** H¹_par(Γ, V) := ker(H¹(Γ, V) → ⊕_{c ∈ Γ\P¹(ℚ)} H¹(Γ_c, V)), the classes whose restriction to every cusp stabiliser vanishes; for the PSL₂(ℤ) formulation the index set is Γ\PSL₂(ℤ)/⟨T⟩ with groups Γ ∩ ⟨gTg^{-1}⟩.

**Hypotheses and boundaries.**

- Γ of finite index in SL₂(ℤ) or PSL₂(ℤ); V a left representation.
- The kernel is independent of the choice of cusp representatives (conjugate restrictions have the same kernel).

**Inputs.** `mathlib:groupCohomology`, `mathlib:groupCohomology.resNatTrans`, `mathlib:CongruenceSubgroup.Gamma0`.

**Build plan.**

1. Define it as the kernel of the product of restriction maps (Mathlib's resNatTrans) over chosen representatives.
2. Independence of representatives: restriction to Γ_{γc} = γΓ_cγ^{-1} is restriction to Γ_c composed with conjugation by γ, an isomorphism.

**API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `TauCeti.ModularSymbol.H1par` | constructor | H¹_par(Γ, V) as a submodule of H¹(Γ, V). |
| `TauCeti.ModularSymbol.mem_H1par_iff` | characterisation | c ∈ H¹_par ↔ ∀ cusps c₀, res_{Γ_{c₀}} c = 0. |
| `TauCeti.ModularSymbol.H1par_hecke` | compatibility | H¹_par is stable under T_n and ⟨d⟩. |
| `TauCeti.ModularSymbol.H1par_baseChange` | functoriality | For finite-index Γ with finitely presented coefficient module V, flat extension R→S identifies S⊗_R H¹_par(Γ,V) with H¹_par(Γ,S⊗_R V). The finite presentation of Γ and its cusp stabilizers, supplied by the congruence-subgroup presentation, is part of the proof. |

**Unit tests.**

- `H1par_Gamma0_11` (example): dim_ℚ H¹_par(Γ₀(11), ℚ) = 2.
- `H1par_level_one` (example): H¹_par(SL₂(ℤ), ℚ) = 0.
- `H1par_ne_H1` (non-example): H¹_par(Γ₀(11), ℚ) ≠ H¹(Γ₀(11), ℚ) (dimension 2 against 3).

**Acceptance.**

- For V = ℚ and Γ = Γ₀(11), dim H¹_par = 2 = 2g.
- H¹_par(SL₂(ℤ), V_k(ℚ)) = 0 for k = 0.
- H¹_par is stable under Hecke operators on H¹ (Wiese Proposition 7.22).

**Sources.** [Gabor Wiese, Computational Arithmetic of Modular Forms (course notes)](https://arxiv.org/pdf/1809.04645v1), §6.3, Definition 6.12, p. 66. The definition, at the level of cocycles; the cohomology version is the kernel in Proposition 4.14.

<a id="L0-symbols-mod-eisenstein"></a>

#### Modular symbols modulo Eisenstein symbols are parabolic cohomology

**Target `L0/symbols-mod-eisenstein` (theorem).** δ induces an isomorphism Symb_Γ(V)/Eis_Γ(V) ≅ H¹_par(Γ, V), compatible with the Hecke operators, the diamond operators and ι.

**Hypotheses and boundaries.**

- Γ ≤ SL₂(ℤ) of finite index; any right ℤ[Γ]-module V; no invertibility hypothesis.

**Inputs.** [L0/symbols-cohomology-sequence](#L0-symbols-cohomology-sequence), [L0/parabolic-cohomology](#L0-parabolic-cohomology), [L0/boundary-symbols](#L0-boundary-symbols).

**Build plan.**

1. By symbols-cohomology-sequence, ker δ = Eis_Γ(V) and the image of δ is the kernel of the restriction to the cusp stabilisers, which is H¹_par(Γ, V).
2. Hecke compatibility: δ commutes with T (symbols-to-cohomology API), and Eis_Γ(V) is Hecke-stable (boundary-symbols API).

**Acceptance.**

- For V = ℚ, Γ = Γ₀(11): Symb (dimension 3) modulo Eis (dimension 1) ≅ H¹_par (dimension 2).
- For V_k(ℂ) with k ≥ 1 and Γ torsion-free the Eisenstein part has dimension ν∞ (one per cusp).
- The isomorphism commutes with ι, so it induces Symb^± / Eis^± ≅ H¹_par^± when 2 is invertible.

**Sources.** [Gabor Wiese, Computational Arithmetic of Modular Forms (course notes)](https://arxiv.org/pdf/1809.04645v1), §5.2, Theorem 5.9, p. 57. The homological counterpart (cuspidal symbols = parabolic cohomology); the Hom-side statement here follows from the exact sequence without the invertibility hypothesis.

<a id="L0-symbols-level-descent"></a>

#### Descent of modular symbols from a normal subgroup

**Target `L0/symbols-level-descent` (lemma).** Let Γ′ ⊴ Γ be finite-index subgroups of SL₂(ℤ) and V a right ℤ[Γ]-module. Then Γ/Γ′ acts on Symb_{Γ′}(V) by φ ↦ φ|γ, and Symb_Γ(V) = Symb_{Γ′}(V)^{Γ/Γ′}, integrally and with no division. If [Γ : Γ′] is invertible on V, then restriction gives H¹(Γ, V) ≅ H¹(Γ′, V)^{Γ/Γ′} and H¹_par(Γ, V) ≅ H¹_par(Γ′, V)^{Γ/Γ′}, and Symb_Γ(V) is a direct summand of Symb_{Γ′}(V) via the averaging idempotent e = [Γ:Γ′]^{-1} Σ_{γ ∈ Γ/Γ′} (·)|γ.

**Hypotheses and boundaries.**

- Γ′ normal in Γ of finite index. In applications Γ′ = Γ ∩ Γ₁(M) with M ≥ 4 is torsion-free, so all stabilisers in H are trivial.
- Only the second and third statements use that [Γ : Γ′] is invertible; the first holds over ℤ. Dividing by the order of an elliptic stabiliser is never used.

**Inputs.** [L0/modular-symbols](#L0-modular-symbols), [L0/parabolic-cohomology](#L0-parabolic-cohomology), `mathlib:groupCohomology.H1InfRes_exact`, `mathlib:groupCohomology.resNatTrans`, `mathlib:CongruenceSubgroup.Gamma1`.

**Build plan.**

1. (φ|γ)(D) = φ(γD)|γ is well defined on Symb_{Γ′}(V) because Γ′ is normal, and Γ′ acts trivially; a Γ′-symbol fixed by all of Γ is a Γ-symbol, and conversely.
2. Inflation–restriction: 0 → H¹(Γ/Γ′, V^{Γ′}) → H¹(Γ, V) → H¹(Γ′, V)^{Γ/Γ′} → H²(Γ/Γ′, V^{Γ′}); the outer groups are killed by [Γ : Γ′], hence vanish when it is invertible (H1InfRes_exact and the corestriction–restriction identity).
3. The same argument at every cusp stabiliser shows that the restriction isomorphism preserves the parabolic subspaces.
4. e is an idempotent onto the invariants when [Γ : Γ′] is invertible.

**Acceptance.**

- Γ = Γ₀(N), Γ′ = Γ₁(N): Symb_{Γ₀(N)}(V) = Symb_{Γ₁(N)}(V)^{(ℤ/N)^×} for the diamond action.
- Γ = SL₂(ℤ), Γ′ = Γ(4) (normal and torsion-free): Symb_{SL₂(ℤ)}(V_k(ℤ)) = Symb_{Γ(4)}(V_k(ℤ))^{SL₂(ℤ)/Γ(4)} over ℤ, with no division by 2 or 3.
- The cohomological statements need the index inverted: for V = 𝔽₂ trivial, Γ = SL₂(ℤ) and Γ′ = ker χ, χ : SL₂(ℤ) → SL₂(ℤ)^{ab} ≅ ℤ/12 → 𝔽₂, the nonzero class χ ∈ H¹(Γ, 𝔽₂) restricts to zero on Γ′.

**Sources.** [Gabor Wiese, Computational Arithmetic of Modular Forms (course notes)](https://arxiv.org/pdf/1809.04645v1), §6.2, Proposition 6.8, p. 64. The same inflation–restriction mechanism, with the invertibility it needs made explicit. [Gabor Wiese, Computational Arithmetic of Modular Forms (course notes)](https://arxiv.org/pdf/1809.04645v1), §4.5, Proposition 4.16, p. 51. The torsion-free auxiliary levels used for descent.

<a id="L0-diamond-operators"></a>

#### Diamond operators on modular symbols

**Target `L0/diamond-operators` (construction).** Let V be a right ℤ[Γ₀(N)]-module (for instance the restriction of a right Σ₀(N)-module). For d ∈ (ℤ/N)^× choose σ_d ∈ Γ₀(N) whose lower-right entry is ≡ d mod N, and put ⟨d⟩φ := φ|σ_d, i.e. (⟨d⟩φ)(D) = φ(σ_d D)|σ_d, for φ ∈ Symb_{Γ₁(N)}(V). This is independent of the choice of σ_d, defines a homomorphism (ℤ/N)^× → Aut(Symb_{Γ₁(N)}(V)), and commutes with T_ℓ (ℓ ∤ N), U_q (q | N) and ι.

**Hypotheses and boundaries.**

- Γ₁(N) ⊴ Γ₀(N) with Γ₀(N)/Γ₁(N) ≅ (ℤ/N)^× via the lower-right entry (Mathlib's Gamma0Map).
- Convention: the lower-right entry d, as in Tau Ceti's diamondOp on forms; with the upper-left entry one gets ⟨d^{-1}⟩.

**Inputs.** [L0/modular-symbols](#L0-modular-symbols), [L0/hecke-operators](#L0-hecke-operators), [L0/involution-at-infinity](#L0-involution-at-infinity), `mathlib:CongruenceSubgroup.Gamma1`, `mathlib:CongruenceSubgroup.Gamma0Map`, `tauceti:HeckeRing.GL2.diamondCosetGamma1`, `tauceti:diamondOp`.

**Build plan.**

1. Well defined: two choices differ by an element of Γ₁(N), which fixes every Γ₁(N)-symbol.
2. Multiplicativity: σ_d σ_e has lower-right entry ≡ de, and φ|(σ_dσ_e) = (φ|σ_d)|σ_e; the group is abelian, so the order does not matter.
3. Commutation with T_ℓ and U_q: the double cosets Γ₁(N)(1 0; 0 ℓ)Γ₁(N) are normalised by Γ₀(N); commutation with ι: ι σ_d ι has the same lower-right entry.

**API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `TauCeti.ModularSymbol.diamond` | constructor | ⟨d⟩ : Symb_{Γ₁(N)}(V) →ₗ Symb_{Γ₁(N)}(V). |
| `TauCeti.ModularSymbol.diamondHom` | structure | (ℤ/N)^× →* Module.End ℤ (Symb_{Γ₁(N)}(V)). |
| `TauCeti.ModularSymbol.diamond_eq_of_Gamma0Map_eq` | relation | ⟨d⟩ depends only on the lower-right entry mod N. |
| `TauCeti.ModularSymbol.diamond_comm_hecke` | relation | ⟨d⟩T_ℓ = T_ℓ⟨d⟩, ⟨d⟩U_q = U_q⟨d⟩, ⟨d⟩ι = ι⟨d⟩. |
| `TauCeti.ModularSymbol.fixed_diamond_eq` | characterisation | The ⟨·⟩-fixed symbols are the Γ₀(N)-symbols. |

**Unit tests.**

- `diamond_one` (simp): ⟨1⟩ = id.
- `diamond_neg_one_Vk` (example): ⟨−1⟩ acts on Symb_{Γ₁(N)}(V_k(ℤ)) by (−1)^k.
- `diamond_trivial_Gamma0` (example): On Symb_{Γ₀(N)}(V) (viewed inside Symb_{Γ₁(N)}(V)) every ⟨d⟩ is the identity.
- `diamond_upper_left_wrong` (non-example): For a nonzero symbol of a character ε modulo 5 with ε(2)≠ε(2)⁻¹, upper-left rather than lower-right identification gives the inverse diamond eigenvalue and a different symbol.

**Acceptance.**

- ⟨1⟩ = id and ⟨−1⟩ = (·)|(−1), which is the identity on Symb_{Γ₁(N)}(V_k) iff k is even.
- Symb_{Γ₁(N)}(V)^{⟨·⟩} = Symb_{Γ₀(N)}(V) (symbols-level-descent).
- Under the period-symbol map, ⟨d⟩ψ_f = ψ_{⟨d⟩f} with Tau Ceti's diamondOp on S_{k+2}(Γ₁(N)).

**Sources.** [Gabor Wiese, Computational Arithmetic of Modular Forms (course notes)](https://arxiv.org/pdf/1809.04645v1), §1.2, Hecke operators, p. 10. The definition on (homological) modular symbols; here transported to Hom-side symbols. [Gabor Wiese, Computational Arithmetic of Modular Forms (course notes)](https://arxiv.org/pdf/1809.04645v1), §7.3, Definition 7.23, p. 76. The same operator on group cohomology.

<a id="L0-hecke-operators-gamma1"></a>

#### Hecke operators on Γ₁(N)-symbols

**Target `L0/hecke-operators-gamma1` (construction).** For V a right module over the monoid Σ₁(N) generated by Γ₁(N), Γ₀(N) and the matrices (1 a; 0 ℓ), (ℓ 0; 0 1) with (ℓ, N) = 1 (inside Σ₀(N)), and φ ∈ Symb_{Γ₁(N)}(V): for a prime ℓ ∤ N, φ|T_ℓ := Σ_{a=0}^{ℓ−1} φ|(1 a; 0 ℓ) + φ|σ_ℓ(ℓ 0; 0 1), and for q | N, φ|U_q := Σ_{a=0}^{q−1} φ|(1 a; 0 q). These preserve Symb_{Γ₁(N)}(V), commute with each other and with the diamond operators, and restrict to the Γ₀(N) operators of hecke-operators on Symb_{Γ₀(N)}(V).

**Hypotheses and boundaries.**

- σ_ℓ ∈ Γ₀(N) has lower-right entry ≡ ℓ mod N (so σ_ℓ(ℓ 0; 0 1) ∈ Δ¹ₗ(N)), as in the double-coset decomposition Δ^ℓ_1(N) = ⊔ Γ₁(N)σ_a(a b; 0 d).
- On Symb_{Γ₀(N)}(V), σ_ℓ acts trivially and T_ℓ reduces to the Γ₀(N) formula.

**Inputs.** [L0/hecke-operators](#L0-hecke-operators), [L0/diamond-operators](#L0-diamond-operators), [L0/hecke-monoid](#L0-hecke-monoid), `mathlib:CongruenceSubgroup.Gamma1`, `tauceti:HeckeRing.GL2.diamondCosetGamma1`.

**Build plan.**

1. The matrices listed are right coset representatives of Γ₁(N)(1 0; 0 ℓ)Γ₁(N) (Wiese Proposition 7.9(b)); φ|T := Σ φ|δ_i is then Γ₁(N)-invariant because right multiplication by γ ∈ Γ₁(N) permutes the cosets.
2. Commutativity: the Hecke ring R(Δ₁(N), Γ₁(N)) is commutative (Wiese Corollary 7.14; Tau Ceti's Γ₀(N) Hecke ring for the Γ₀ case), and φ ↦ φ|T is a ring antihomomorphism from it, hence a homomorphism on a commutative ring.
3. Diamond commutation as in diamond-operators.

**API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `TauCeti.ModularSymbol.heckeTGamma1` | constructor | T_ℓ on Symb_{Γ₁(N)}(V), ℓ ∤ N. |
| `TauCeti.ModularSymbol.heckeUGamma1` | constructor | U_q on Symb_{Γ₁(N)}(V), q \| N. |
| `TauCeti.ModularSymbol.heckeTGamma1_comm` | relation | Good-prime T_ℓ and T_m commute on equivariant Γ₁(N)-symbols. The U_q and diamond commutations use the same double-coset argument and its coefficient-action compatibility. |
| `TauCeti.ModularSymbol.heckeTGamma1_restrict` | compatibility | On Symb_{Γ₀(N)}(V) these are the operators of hecke-operators. |
| `TauCeti.ModularSymbol.heckeTGamma1_formula` | characterisation | The upper triangular sum plus σ_ℓ diag(ℓ,1), with lower-right entry of σ_ℓ congruent to ℓ modulo N. |

**Unit tests.**

- `heckeT_Gamma1_restrict` (characterisation): T_ℓ restricted to Γ₀(N)-symbols is Σ φ|(1 a; 0 ℓ) + φ|(ℓ 0; 0 1).
- `heckeT_Gamma1_Gamma0_part` (example): On the Γ₀(11)-part Symb_{Γ₁(11)}(ℚ)[1] = Symb_{Γ₀(11)}(ℚ), T₂ has characteristic polynomial (x − 3)(x + 2)², as in hecke-operators.
- `heckeT_Gamma1_missing_sigma` (non-example): At N=5, ℓ=2, weight coefficient degree 1, assume the diagonal contribution is nonzero and its diamond eigenvalue c is not 1. Omitting σ_ℓ removes its c multiplier and gives a different contribution. The test does not claim nonexistence of accidental equality on the trivial-character subspace.

**Acceptance.**

- On Symb_{Γ₁(N)}(V)[ε] (nebentypus-symbols), T_ℓ reads Σ_a φ|(1 a; 0 ℓ) + ε(ℓ)φ|(ℓ 0; 0 1).
- T_ℓ T_m = T_m T_ℓ for primes ℓ, m ∤ N.
- Under the period-symbol map, ψ_{T_ℓ f} = ψ_f|T_ℓ with the Hecke operators on S_{k+2}(Γ₁(N)).

**Sources.** [Gabor Wiese, Computational Arithmetic of Modular Forms (course notes)](https://arxiv.org/pdf/1809.04645v1), §7.1, Proposition 7.9(b), p. 72. The coset representatives for Γ₁(N). [Robert Pollack, Overconvergent modular symbols (Arizona Winter School 2011 lecture notes)](https://swc-math.github.io/aws/2011/2011PollackNotes.pdf), §2.9, p. 10. The double-coset definition on Hom-side symbols.

<a id="L0-nebentypus-symbols"></a>

#### Modular symbols with character

**Target `L0/nebentypus-symbols` (definition).** For a ring R, a right R[Γ₀(N)]-module V and a character ε : (ℤ/N)^× → R^×, Symb_{Γ₁(N)}(V)[ε] := {φ : ⟨d⟩φ = ε(d)φ for all d}. Equivalently it is Symb_{Γ₀(N)}(V ⊗ R_{ε}), where R_{ε} is R with the right Γ₀(N)-action r·γ = ε(d_γ)^{-1}r (d_γ the lower-right entry).

**Hypotheses and boundaries.**

- ε(−1) acts compatibly: if ε(−1) ≠ (−1)^k then Symb_{Γ₁(N)}(V_k(R))[ε] = 0 when 2 is invertible.
- The twist uses the lower-right entry and ε^{-1}, matching the diamond convention of diamond-operators.

**Inputs.** [L0/diamond-operators](#L0-diamond-operators), [L0/modular-symbols](#L0-modular-symbols), `tauceti:cuspFormCharSpace`.

**Build plan.**

1. Unwind ⟨d_γ⟩φ = ε(d_γ)φ for γ ∈ Γ₀(N): φ(γD)|γ = ε(d_γ)φ(D), i.e. φ(γD) = ε(d_γ)·φ(D)|γ^{-1}, which is Γ₀(N)-invariance for V ⊗ R_{ε}.
2. The eigenspace is a Hecke-stable submodule because the diamond operators commute with T_ℓ and U_q.

**API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `TauCeti.ModularSymbol.symbolsChar` | constructor | Symb_{Γ₁(N)}(V)[ε] as a submodule. |
| `TauCeti.ModularSymbol.symbolsChar_equiv` | equivalence | Symb_{Γ₁(N)}(V)[ε] ≃ Symb_{Γ₀(N)}(V ⊗ R_ε). |
| `TauCeti.ModularSymbol.symbolsChar_hecke` | compatibility | Stable under T_ℓ, U_q and ι. |
| `TauCeti.ModularSymbol.symbolsChar_one` | simp | Symb_{Γ₁(N)}(V)[1] = Symb_{Γ₀(N)}(V). |

**Unit tests.**

- `symbolsChar_trivial` (example): ε = 1 recovers Symb_{Γ₀(N)}(V).
- `symbolsChar_parity` (example): Symb_{Γ₁(N)}(V_k(ℂ))[ε] = 0 when ε(−1) ≠ (−1)^k.
- `symbolsChar_wrong_twist` (non-example): With r·γ = ε(d_γ)r (no inverse) one gets the ε^{-1}-eigenspace instead, which differs for a non-real ε mod 5.

**Acceptance.**

- ε = 1 gives Symb_{Γ₀(N)}(V).
- For V = V_k(ℂ) and ε(−1) ≠ (−1)^k the space is zero.
- Under the period-symbol map, S_{k+2}(N, ε) (Tau Ceti's cuspFormCharSpace) lands in Symb_{Γ₁(N)}(V_k(ℂ))[ε].

**Sources.** [Gabor Wiese, Computational Arithmetic of Modular Forms (course notes)](https://arxiv.org/pdf/1809.04645v1), §1.2, The modules Vn(R) and Vχn(R), pp. 8–9. Symbols with character as symbols for Γ₀(N) with twisted coefficients (homological version).

<a id="L0-nebentypus-decomposition"></a>

#### The character decomposition of Γ₁(N)-symbols

**Target `L0/nebentypus-decomposition` (theorem).** If |(ℤ/N)^×| is invertible in R and R contains the values of all characters of (ℤ/N)^× (for instance R = ℤ[1/φ(N), μ_{φ(N)}] or a field of characteristic 0 containing them), then Symb_{Γ₁(N)}(V) = ⊕_ε Symb_{Γ₁(N)}(V)[ε] as an internal direct sum over the characters ε, compatibly with T_ℓ, U_q and ι.

**Hypotheses and boundaries.**

- The idempotents e_ε = |G|^{-1} Σ_d ε(d)^{-1}⟨d⟩, G = (ℤ/N)^×, need |G| invertible and the values of ε in R.

**Inputs.** [L0/nebentypus-symbols](#L0-nebentypus-symbols), [L0/diamond-operators](#L0-diamond-operators), `tauceti:isInternal_cuspFormCharSpace`.

**Build plan.**

1. The e_ε are orthogonal idempotents summing to 1 in R[G] (character orthogonality).
2. e_ε projects onto the ε-eigenspace of the diamond action; they commute with Hecke operators and ι.

**Acceptance.**

- Over ℂ this mirrors Tau Ceti's isInternal_cuspFormCharSpace on the forms side.
- Over ℤ the decomposition fails in general (the idempotents are not integral).
- The ε = 1 summand is Symb_{Γ₀(N)}(V).

**Sources.** [Gabor Wiese, Computational Arithmetic of Modular Forms (course notes)](https://arxiv.org/pdf/1809.04645v1), §1.2, equation (1.8), p. 8. The corresponding decomposition for forms; the symbol version is the same idempotent argument.

<a id="L0-symbols-coinvariants-duality"></a>

#### Hom-side symbols are the dual of homological symbols

**Target `L0/symbols-coinvariants-duality` (comparison).** For finite-index Γ, a left ℤ[Γ]-module W, and an abelian group M with trivial action, give Hom_ℤ(W, M) the right action (f|γ)(w) = f(γw). Then Symb_Γ(Hom_ℤ(W, M)) ≅ Hom_ℤ((Δ₀ ⊗ W)_Γ, M), φ ↦ ([D ⊗ w] ↦ φ(D)(w)), naturally in W and M. If W is a left module over a monoid Σ ⊇ Γ (Σ₀(N), Σ₁(N) or GL₂⁺(ℚ) ∩ M₂(ℤ)), the Hecke operator Σ_i φ|δ_i corresponds to precomposition with the operator [D ⊗ w] ↦ Σ_i [δ_i D ⊗ δ_i w] on the coinvariants, and likewise for ⟨d⟩ and ι. With W = Sym^{k}(ℤ²) this identifies Symb_Γ(Hom(Sym^k ℤ², M)) with the ℤ-dual (with values in M) of ModularForms Layer 8's module 𝕄, transposing its Hecke operators.

Reuse the current ModularForms Layer-8 library carriers and actions; this target specifies only the Hom-side interface and convention transport. See upstreamNotes for commits and the transposition/period dictionary.

**Hypotheses and boundaries.**

- (Δ₀ ⊗ W)_Γ is the Γ-coinvariants of the diagonal action; Layer 8 uses Γ = Γ₁(N) and W = Sym^{k−2}(ℤ²).
- The Hecke identification needs the same coset representatives δ_i on both sides; the transpose reverses composition, and commutativity of the Hecke algebra makes this harmless.

**Inputs.** [L0/modular-symbols](#L0-modular-symbols), [L0/hecke-operators](#L0-hecke-operators), [L0/hecke-operators-gamma1](#L0-hecke-operators-gamma1), `mathlib:Rep.coinvariantsTensor`, `mathlib:Rep.coinvariantsAdjunction`, `mathlib:Representation.linHom`, `mathlib:Representation.Coinvariants`.

**Build plan.**

1. Tensor–hom adjunction: Hom_ℤ(Δ₀ ⊗ W, M) ≅ Hom_ℤ(Δ₀, Hom_ℤ(W, M)).
2. Γ-invariant maps on the left correspond to Γ-equivariant maps on the right (coinvariants are left adjoint to the trivial-module functor, Rep.coinvariantsAdjunction; Rep.coinvariantsTensor).
3. For the Hecke operators, (φ|δ)(D)(w) = (φ(δD)|δ)(w) = φ(δD)(δw), so φ|T evaluated on [D ⊗ w] is φ evaluated on Σ_i [δ_iD ⊗ δ_iw].

**Acceptance.**

- For W = ℤ trivial and M = ℤ: Symb_Γ(ℤ) = Hom((Δ₀)_Γ, ℤ).
- For Γ₀(11), W = ℤ: rank (Δ₀)_Γ = 3 = rank Symb_{Γ₀(11)}(ℤ).
- Torsion in 𝕄 is invisible after Hom(−, ℤ) but visible for M = ℚ/ℤ.

**Sources.** [Gabor Wiese, Computational Arithmetic of Modular Forms (course notes)](https://arxiv.org/pdf/1809.04645v1), §1.2, Definition 1.5(a), p. 7. The homological symbol module, the other side of the duality. [Robert Pollack, Overconvergent modular symbols (Arizona Winter School 2011 lecture notes)](https://swc-math.github.io/aws/2011/2011PollackNotes.pdf), §2.9, p. 10. The Hom-side symbols.

<a id="L0-polynomial-duality"></a>

#### The invariant pairing between V_k and Sym^k

**Target `L0/polynomial-duality` (lemma).** Let W_k(R) = R[X, Y]_k with the left action (γ·Q)(X, Y) = Q((X, Y)γ) and V_k(R) the same module with the right action (P|γ)(X, Y) = P((X, Y)γ*), γ* = adj γ (polynomial-coefficients). If k! is invertible in R there is a unique R-bilinear pairing ⟨ , ⟩ : V_k(R) × W_k(R) → R with ⟨(uX + vY)^k, (sX + tY)^k⟩ = (ut − vs)^k for all u, v, s, t ∈ R; on monomials ⟨X^iY^{k−i}, X^jY^{k−j}⟩ = (−1)^{k−i}/C(k, i) if i + j = k and 0 otherwise. It is perfect and satisfies ⟨P|γ, Q⟩ = ⟨P, γ·Q⟩ for every integral γ with det γ ≠ 0; so P ↦ ⟨P, ·⟩ is an isomorphism of right modules V_k(R) ≅ Hom_R(W_k(R), R). Over ℤ the pairing takes values in ℤ[1/k!] and is not integral for k ≥ 2.

**Hypotheses and boundaries.**

- k! ∈ R^× for the pairing to exist on all of V_k(R) × W_k(R); no determinant twist appears.
- The integral comparison of Symb_Γ(V_k(ℤ)) with Hom(𝕄, ℤ) goes through the divided-power lattice and belongs to L1's integral-lattice work.

**Inputs.** [L0/polynomial-coefficients](#L0-polynomial-coefficients), `mathlib:Matrix.adjugate`, `mathlib:Matrix.adjugate_mul`, `mathlib:MvPolynomial.homogeneousSubmodule`.

**Build plan.**

1. Write ℓ_a(X, Y) = a₁X + a₂Y; then P|γ turns ℓ_a^k into ℓ_{γ*a}^k and γ·Q turns ℓ_b^k into ℓ_{γb}^k.
2. det(γ*a | b) = det(γ*)·det(a | γ*^{-1}b) = det γ · det(a | γb)/det γ = det(a | γb), so the formula is invariant.
3. Expanding both sides in monomials forces ⟨X^iY^{k−i}, X^{k−i}Y^{i}⟩·C(k, i)² = C(k, i)(−1)^{k−i}, giving the stated values; they span when k! is invertible, and the matrix is anti-diagonal with unit entries, so the pairing is perfect.

**Acceptance.**

- k = 1: ⟨uX + vY, sX + tY⟩ = ut − vs, the determinant pairing.
- k = 2: ⟨XY, XY⟩ = −1/2, so the pairing is not integral.
- Invariance check with γ = (1 1; 0 1), k = 2, P = X², Q = Y².

**Sources.** [Gabor Wiese, Computational Arithmetic of Modular Forms (course notes)](https://arxiv.org/pdf/1809.04645v1), §1.2, The modules Vn(R) and Vχn(R), p. 8. The relation between the adjugate and the plain matrix actions on binary forms. [Robert Pollack, Overconvergent modular symbols (Arizona Winter School 2011 lecture notes)](https://swc-math.github.io/aws/2011/2011PollackNotes.pdf), §2.7, p. 9. The right action on V_k.

<a id="L0-period-symbol"></a>

#### The period symbol of a cusp form

**Target `L0/period-symbol` (construction).** For k ≥ 0, Γ ≤ SL₂(ℤ) of finite index and f ∈ S_{k+2}(Γ), ψ_f : Δ₀ → V_k(ℂ) is the additive map with ψ_f({s} − {r}) = 2πi ∫_r^s f(z)(zX + Y)^k dz (geodesic path in H, improper at cusps). Then ψ_f ∈ Symb_Γ(V_k(ℂ)), f ↦ ψ_f is ℂ-linear, ψ_{f|δ} relates to ψ_f|δ for the weight-(k+2) slash action f|δ = det(δ)^{k+1}(cz + d)^{−k−2}f(δz), so ψ_{T f} = ψ_f|T for T_ℓ, U_q and ⟨d⟩. Under polynomial-duality and symbols-coinvariants-duality, ⟨ψ_f(D), Q⟩ = 2πi · periodMap′(f)(D ⊗ w·Q) with w = (0 1; −1 0), i.e. ψ_f is Layer 8's period map transported to the Hom side.

Reuse the current ModularForms Layer-8 library carriers and actions; this target specifies only the Hom-side interface and convention transport. See upstreamNotes for commits and the transposition/period dictionary.

**Hypotheses and boundaries.**

- Convergence at cusps: f is a cusp form (exponential decay at every cusp); this analytic input is Layer 8's convergence milestone.
- Orientation: {s} − {r} is the path from r to s; Layer 8's rawPairing integrates {α, β} from β to α.

**Inputs.** [L0/modular-symbols](#L0-modular-symbols), [L0/polynomial-coefficients](#L0-polynomial-coefficients), [L0/polynomial-duality](#L0-polynomial-duality), [L0/symbols-coinvariants-duality](#L0-symbols-coinvariants-duality), [L0/hecke-operators-gamma1](#L0-hecke-operators-gamma1), [L0/diamond-operators](#L0-diamond-operators), `mathlib:CuspForm`, `mathlib:UpperHalfPlane`, `tauceti:diamondOp`.

**Build plan.**

1. Well defined on Δ₀: additivity over paths (path independence of holomorphic integrals in H) makes the value on {s} − {r} consistent with the relations of Δ₀.
2. Γ-invariance: substituting z = γu gives ∫_{γr}^{γs} f(z)(zX + Y)^k dz = ∫_r^s f(u)(u X + Y)^k|γ^{-1} du, i.e. ψ_f(γD) = ψ_f(D)|γ^{-1}.
3. Hecke equivariance: the same substitution for δ ∈ Σ₀(N) gives ψ_{f|δ}(D) = ψ_f(δD)|δ; summing over coset representatives.
4. Comparison with Layer 8: ⟨(zX + Y)^k, Q⟩ = (w·Q)(z, 1) with w = (0 1; −1 0), as one checks on Q = (sX + tY)^k where both sides equal (tz − s)^k; so pairing ψ_f with Q is 2πi times Layer 8's rawPairing on D ⊗ w·Q.

**API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `TauCeti.ModularSymbol.periodSymbol` | constructor | ψ : S_{k+2}(Γ) →ₗ[ℂ] Symb_Γ(V_k(ℂ)). |
| `TauCeti.ModularSymbol.periodSymbol_apply` | characterisation | ψ_f({s} − {r}) = 2πi ∫_r^s f(z)(zX + Y)^k dz. |
| `TauCeti.ModularSymbol.periodSymbol_hecke` | compatibility | ψ_{T f} = ψ_f\|T for T_ℓ, U_q, ⟨d⟩. |
| `TauCeti.ModularSymbol.periodSymbol_eq_periodMap` | compatibility | ⟨ψ_f(D), Q⟩ = 2πi · periodMap′(f)(D ⊗ w·Q) (Layer 8). |
| `TauCeti.ModularSymbol.periodSymbol_injective` | characterisation | f ↦ ψ_f is injective (Layer 8's injectivity, transported). |

**Unit tests.**

- `periodSymbol_Gamma0_11_real` (example): For a level-11 weight-two cusp form with real q-coefficients, the imaginary part of ψ_f({0}−{∞}) is zero.
- `periodSymbol_Lvalue` (example): The Y^k coefficient of ψ_f({0}−{∞}) equals the analytically continued L(f,1), with the L0 factor 2πi and upward/reversed path conventions fixed.
- `periodSymbol_zero` (example): ψ_0 = 0.
- `periodSymbol_wrong_action` (non-example): With the unadjugated action P((X, Y)γ) the map f ↦ ψ_f is not Γ₀(11)-invariant for k = 2.

**Acceptance.**

- For Γ₀(11), k = 0 and f = q∏(1 − q^n)²(1 − q^{11n})², ψ_f({0} − {∞}) = 2πi ∫_{i∞}^0 f(z) dz = L(f, 1) > 0 (AWS §§2.1–2.2).
- ψ_f({0} − {∞}) = Σ_{j=0}^{k} C(k, j) j!(−2πi)^{−j} L(f, j + 1) X^jY^{k−j} (AWS §2.8), the bridge to L1.
- ψ_f is cuspidal: δ(ψ_f) ∈ H¹_par(Γ, V_k(ℂ)) (Wiese Proposition 6.9).

**Sources.** [Robert Pollack, Overconvergent modular symbols (Arizona Winter School 2011 lecture notes)](https://swc-math.github.io/aws/2011/2011PollackNotes.pdf), §2.7, p. 9. The definition (weight k there is weight k + 2 here). [Robert Pollack, Overconvergent modular symbols (Arizona Winter School 2011 lecture notes)](https://swc-math.github.io/aws/2011/2011PollackNotes.pdf), §2.7, p. 9. Γ-invariance; the computation is written out in the proof steps. [Gabor Wiese, Computational Arithmetic of Modular Forms (course notes)](https://arxiv.org/pdf/1809.04645v1), §6.2, Proposition 6.9, p. 65. Cuspidality of the cohomology class.

<a id="L0-parabolic-cohomology-dimension"></a>

#### Dimension of parabolic cohomology

**Target `L0/parabolic-cohomology-dimension` (theorem).** Let K be a field of characteristic 0 and Γ ≤ SL₂(ℤ) of finite index μ in PSL₂(ℤ) (index of the image) with trivial stabilisers in H (e.g. Γ₁(N), N ≥ 4), with ν∞ cusps. Then dim_K H¹(Γ, V_k(K)) = (k + 1)μ/6 + δ_{k,0} and dim_K H¹_par(Γ, V_k(K)) = (k + 1)μ/6 − ν∞ + 2δ_{k,0}.

**Hypotheses and boundaries.**

- Characteristic 0 (the computation of T-invariants and coinvariants of V_k needs k!N to be invertible).
- Trivial stabilisers, so Coind(V_k) has no invariants for the finite subgroups ⟨σ⟩, ⟨τ⟩ beyond those computed by Mayer–Vietoris.

**Inputs.** [L0/parabolic-cohomology](#L0-parabolic-cohomology), [L0/polynomial-coefficients](#L0-polynomial-coefficients), `mathlib:groupCohomology`, `mathlib:groupCohomology.coindIso`, `mathlib:Rep.coind`, `mathlib:CongruenceSubgroup.Gamma1`.

**Build plan.**

1. M = Coind_Γ^{PSL₂(ℤ)} V_k(K) has dimension (k + 1)μ; H¹(Γ, V_k) = H¹(PSL₂(ℤ), M) (Shapiro).
2. Mayer–Vietoris for PSL₂(ℤ) = ⟨σ⟩ ∗ ⟨τ⟩: 0 → M^G → M^{⟨σ⟩} ⊕ M^{⟨τ⟩} → M → H¹(G, M) → 0, with M^{⟨σ⟩} and M^{⟨τ⟩} of dimensions μ(k+1)/2 and μ(k+1)/3 when the stabilisers are trivial.
3. dim V_k(K)^Γ = δ_{k,0} and, at each cusp, dim H¹(⟨T^n⟩, V_k(K)) = dim V_k(K)^{⟨T^n⟩} = 1 (Wiese Lemma 4.15).
4. Combine with the exact row 0 → H¹_par → H¹ → ⊕_cusps H¹(Γ_c, V) → V_Γ → 0 of Wiese Proposition 4.14.

**Acceptance.**

- Γ₁(11) (μ = 60, ν∞ = 10), k = 0: dim H¹_par = 10 − 10 + 2 = 2 = 2·genus(X₁(11)) = 2·dim S₂(Γ₁(11)).
- Γ₁(5) (μ = 12, ν∞ = 4): k = 0 gives dim H¹_par = 0 (X₁(5) has genus 0); k = 2 gives dim H¹_par = 2 = 2·dim S₄(Γ₁(5)).
- The formula equals 2 dim S_{k+2}(Γ) by the dimension formula (request to ModularForms 10C), the input for Eichler–Shimura.

**Sources.** [Gabor Wiese, Computational Arithmetic of Modular Forms (course notes)](https://arxiv.org/pdf/1809.04645v1), §4.5, Proposition 4.16, pp. 51–52. The statement, with Wiese's weight k equal to our k + 2.

<a id="L0-eichler-shimura-isomorphism"></a>

#### The Eichler–Shimura isomorphism

**Target `L0/eichler-shimura-isomorphism` (theorem).** Let Γ ≤ SL₂(ℤ) be of finite index and k ≥ 0. The map S_{k+2}(Γ) ⊕ \overline{S_{k+2}(Γ)} → H¹_par(Γ, V_k(ℂ)), (f, \bar g) ↦ δ(ψ_f) + \overline{δ(ψ_g)}, is an isomorphism compatible with the Hecke and diamond operators; for each sign ±, f ↦ δ((1 ± ι)ψ_f) is an isomorphism S_{k+2}(Γ) ≅ H¹_par(Γ, V_k(ℂ))^± when ι normalises Γ. Via symbols-mod-eisenstein the same holds for Symb_Γ(V_k(ℂ))/Eis_Γ(V_k(ℂ)).

**Hypotheses and boundaries.**

- For Γ = Γ₁(N), N ≥ 4 (trivial stabilisers) this is Wiese Theorem 6.15; general Γ follows by symbols-level-descent from Γ ∩ Γ₁(M), M ≥ 4, over ℂ.
- Uses the positive definite Petersson product on cusp forms (Tau Ceti CuspForm.peterssonInnerCosets_definite) and the dimension formula for S_{k+2}(Γ₁(N)) (request to ModularForms 10C).

**Inputs.** [L0/period-symbol](#L0-period-symbol), [L0/symbols-to-cohomology](#L0-symbols-to-cohomology), [L0/parabolic-cohomology](#L0-parabolic-cohomology), [L0/parabolic-cohomology-dimension](#L0-parabolic-cohomology-dimension), [L0/symbols-mod-eisenstein](#L0-symbols-mod-eisenstein), [L0/symbols-level-descent](#L0-symbols-level-descent), [L0/polynomial-duality](#L0-polynomial-duality), [L0/hecke-operators-gamma1](#L0-hecke-operators-gamma1), [L0/plus-minus-decomposition](#L0-plus-minus-decomposition), `tauceti:CuspForm.peterssonInnerCosets_definite`, `mathlib:CuspForm`.

**Build plan.**

1. Well defined and parabolic: δ(ψ_f) is a cocycle whose restriction to every cusp stabiliser is a coboundary (Wiese Propositions 6.7, 6.9).
2. Injective: the cup product and the invariant pairing on V_k give a pairing on H¹_par (Wiese Proposition 6.13, 6 invertible) which evaluates on (δψ_f, \overline{δψ_f}) to a nonzero multiple of the Petersson norm of f (Proposition 6.14); positivity of the Petersson norm forces f = 0; likewise for \bar g.
3. Dimensions: dim H¹_par(Γ₁(N), V_k(ℂ)) = (k + 1)μ/6 − ν∞ + 2δ_{k,0} (parabolic-cohomology-dimension) equals 2 dim S_{k+2}(Γ₁(N)) by the dimension formula; so the injective map is bijective.
4. Hecke compatibility: Wiese Proposition 7.24 (the Hecke operators on H¹ match slash operators through the period integrals), and ⟨d⟩ likewise; the ± statements follow as in Wiese Corollary 7.33 by dimension.
5. Descent to general Γ: apply symbols-level-descent with the Γ/Γ′-action, over ℂ.

**Acceptance.**

- Γ₀(11), k = 0: H¹_par(Γ₀(11), ℂ) is two-dimensional and S₂(Γ₀(11)) one-dimensional.
- Level one, weight 12 (k = 10): H¹_par(SL₂(ℤ), V₁₀(ℂ))^± are one-dimensional, spanned by the images of Δ.
- The map on the Eisenstein part: Eis_Γ(V_k(ℂ)) corresponds to Eisenstein series (Wiese Theorem 1.9(a)), not used here.

**Sources.** [Gabor Wiese, Computational Arithmetic of Modular Forms (course notes)](https://arxiv.org/pdf/1809.04645v1), §6.4, Theorem 6.15, p. 70. The theorem for Γ₁(N), N ≥ 4. [Gabor Wiese, Computational Arithmetic of Modular Forms (course notes)](https://arxiv.org/pdf/1809.04645v1), §7.5, Corollary 7.33, pp. 79–80. The plus/minus versions.

<a id="L0-symbols-base-change"></a>

#### Modular symbols commute with flat base change

**Target `L0/symbols-base-change` (lemma).** For Γ ≤ SL₂(ℤ) of finite index, a ring R, a right R[Γ]-module V and a flat R-algebra S, the natural map Symb_Γ(V) ⊗_R S → Symb_Γ(V ⊗_R S) is an isomorphism, compatible with Hecke, diamond and ι actions. In particular Symb_Γ(V_k(K)) ⊗_K ℂ = Symb_Γ(V_k(ℂ)) for a number field K ⊆ ℂ.

**Hypotheses and boundaries.**

- Δ₀ is finitely presented as a ℤ[Γ]-module (fundamental-domain presentation, imported from Layer 8), so Symb_Γ(V) is the kernel of a map V^a → V^b given by a matrix over ℤ[Γ].

**Inputs.** [L0/symbols-generator-values](#L0-symbols-generator-values), [L0/modular-symbols](#L0-modular-symbols), `mathlib:Module.Free`, `mathlib:Module.Flat`, `mathlib:Module.FinitePresentation`.

**Build plan.**

1. By symbols-generator-values, Symb_Γ(V) = ker(V^{a} → V^{b}) for a fixed matrix over ℤ[Γ] independent of V.
2. Kernels commute with flat base change.

**Acceptance.**

- Symb_{Γ₀(11)}(ℚ) ⊗ ℂ = Symb_{Γ₀(11)}(ℂ), both of dimension 3.
- Flatness is needed: for p-torsion-free V, Symb_Γ(V) ⊗ 𝔽_p → Symb_Γ(V/p) is injective with cokernel Ext¹_{ℤ[Γ]}(Δ₀, V)[p], which need not vanish (Wiese's faithfulness warning after Proposition 1.8).
- Hecke compatibility: T ⊗ 1 corresponds to T.

**Sources.** [Gabor Wiese, Computational Arithmetic of Modular Forms (course notes)](https://arxiv.org/pdf/1809.04645v1), §1.2, Proposition 1.8, p. 10. The homological analogue; the finite-presentation argument is the same.

<a id="L0-eigenspace-dimension"></a>

#### Newform eigenspaces of modular symbols are one-dimensional

**Target `L0/eigenspace-dimension` (theorem).** Let f ∈ S_{k+2}(Γ₁(N)) be a newform of level N with character ε and coefficient field K_f = ℚ(a_n(f), ε). For each sign ±, the subspace Symb_{Γ₁(N)}(V_k(K_f))^±[ε][λ_f] on which T_ℓ acts by a_ℓ(f) for every prime ℓ ∤ N is one-dimensional over K_f, it meets Eis_{Γ₁(N)} trivially, and after ⊗ℂ it is spanned by (1 ± ι)ψ_f.

**Hypotheses and boundaries.**

- f a newform (Tau Ceti HeckeRing.GL2.Newform); multiplicity one: the λ_f-eigenspace of S_{k+2}(Γ₁(N)) away from N is ℂf (Tau Ceti finrank_cuspFormsNewEigenspace_eq_one).
- No Eisenstein eigenform of weight k + 2 and level dividing N has T_ℓ-eigenvalues a_ℓ(f) for all ℓ ∤ N (requested from ModularForms Layer 5).
- 2 invertible (for ±); K_f contains the values of ε.

**Inputs.** [L0/eichler-shimura-isomorphism](#L0-eichler-shimura-isomorphism), [L0/symbols-mod-eisenstein](#L0-symbols-mod-eisenstein), [L0/symbols-base-change](#L0-symbols-base-change), [L0/nebentypus-symbols](#L0-nebentypus-symbols), [L0/hecke-operators-gamma1](#L0-hecke-operators-gamma1), [L0/plus-minus-decomposition](#L0-plus-minus-decomposition), [L0/boundary-symbols](#L0-boundary-symbols), `tauceti:HeckeRing.GL2.finrank_cuspFormsNewEigenspace_eq_one`, `tauceti:HeckeRing.GL2.Newform`.

**Build plan.**

1. Over ℂ: by eichler-shimura-isomorphism and symbols-mod-eisenstein, (Symb/Eis)^±[λ_f] ≅ S_{k+2}(Γ₁(N))[λ_f] = ℂf, one-dimensional.
2. Eis_{Γ₁(N)}(V_k(ℂ)) carries the Hecke eigenvalues of Eisenstein series of weight k + 2 (Wiese Theorem 1.9(a), proved there in Corollary 7.30); by the Layer 5 input none of them is λ_f, so Symb^±[λ_f] ∩ Eis = 0 and Symb^±[λ_f] ≅ (Symb/Eis)^±[λ_f].
3. Rational structure: Symb(V_k(K_f)) ⊗_{K_f} ℂ = Symb(V_k(ℂ)) (symbols-base-change), and taking λ_f-eigenspaces commutes with this flat base change because λ_f is K_f-valued; so dim_{K_f} = dim_ℂ = 1.

**Acceptance.**

- For the weight-two newform of level 11, Symb_{Γ₀(11)}(ℚ)^+[λ_f] is spanned by the plus symbol of E = X₀(11).
- Level one, Δ: Symb_{SL₂(ℤ)}(V₁₀(ℚ))^±[λ_Δ] is one-dimensional over ℚ.
- For an oldform eigensystem the eigenspace is at least two-dimensional; the newform hypothesis is necessary.

**Sources.** [Gabor Wiese, Computational Arithmetic of Modular Forms (course notes)](https://arxiv.org/pdf/1809.04645v1), §1.3, Theorem 1.9, p. 12. Eichler–Shimura with character: (a) places the Eisenstein eigenvalues on the boundary part and (c) gives the one-dimensionality of the plus eigenspace over ℂ. [Robert Pollack, Overconvergent modular symbols (Arizona Winter School 2011 lecture notes)](https://swc-math.github.io/aws/2011/2011PollackNotes.pdf), §2.3, p. 4. The worked level-11 example of the plus eigensymbol.

<a id="L0-rational-hecke-separation"></a>

#### Rational separation of parabolic and boundary Hecke supports

**Target `L0/rational-hecke-separation` (theorem).** Let N ≥ 3 and k ≥ 0, H = H¹(Γ(N), V_k(ℚ)) and P = H¹_par(Γ(N), V_k(ℚ)). Let T be the ℚ-subalgebra of End_ℚ(H) generated by the usual good-prime T_ℓ and scalar S_ℓ, for primes ℓ not dividing N, transported through the polynomial-coefficient dictionary. There exist A ∈ T and coprime polynomials F,G ∈ ℚ[X] such that F(A) vanishes on P and the image of G(A) lies in P, equivalently G(A) vanishes on H/P. These are annihilators, not just a statement about individual eigenvectors.

**Hypotheses and boundaries.**

- The finite-dimensional rational cohomology and parabolic subspace are those of the existing L0 nodes, with the connected full-level carrier Γ(N).
- The usual cohomological Hecke normalization and its transport to the adjugate polynomial action must be proved; the full-level comparison is recorded as an open request.

**Inputs.** [L0/parabolic-cohomology](#L0-parabolic-cohomology), [L0/symbols-cohomology-sequence](#L0-symbols-cohomology-sequence), [L0/eichler-shimura-isomorphism](#L0-eichler-shimura-isomorphism), [L0/hecke-operators-gamma1](#L0-hecke-operators-gamma1), `mathlib:CongruenceSubgroup.Gamma`, `mathlib:Algebra.adjoin`, `mathlib:IsCoprime`, `mathlib:LinearMap.aeval_self_charpoly`, `ModularCurvesPartII:R14.3`, `mathlib:Nat.exists_prime_gt_modEq_one`.

**Build plan.**

1. In weight two use Elkik §III: choose a prime ℓ congruent to 1 modulo N; T_ℓ acts on the boundary quotient by ℓ+1, while every cusp-form eigenvalue has absolute value strictly smaller than ℓ+1. Elkik proves the strict bound by the Petersson norm triangle inequality and the Fourier-expansion obstruction to equality, without Deligne’s theorem.
2. Transport the cusp-form bound to parabolic cohomology through Eichler–Shimura. Cayley–Hamilton gives rational annihilators and the absence of a shared root gives their coprimality. The native Nat.exists_prime_gt_modEq_one supplies the congruence prime by its cyclotomic argument; it is not a statement about every good prime.
3. For k>0 use Shokurov Theorem 4.3 and Corollary 4.4, pp.638–641: at full level, T_ℓ acts on the boundary by 1+ℓ^{k+1} for primes ℓ≡1 mod N. His Fourier-coefficient bound excludes this eigenvalue on cusp forms for sufficiently large such ℓ. Transport to the dual cohomological coefficient model via the requested full-level dictionary. Set A=T_ℓ, G=X−(1+ℓ^{k+1}), and F equal to the characteristic polynomial on P. Cayley–Hamilton and spectral exclusion give exactly the two annihilator conditions and coprimality, with no assumption that H is semisimple.

**Acceptance.**

- The conditions on F and G control generalized eigenspaces, so a nonsemisimple boundary extension is included.
- In weight two the boundary scalar ℓ+1 and Elkik’s strict cusp bound imply that X−(ℓ+1) is coprime to the parabolic characteristic polynomial.
- Annihilator separation is over ℚ. It gives no coprimality over ℤ at a congruence prime.

**Sources.** [Renée Elkik, Le théorème de Manin-Drinfeld](https://www.numdam.org/item/AST_1990__183__59_0.pdf), §III, pp. 64–66, especially (3), (6) and the final characteristic-polynomial argument. The weight-two disjoint-spectrum argument, and only that coefficient case. [Romyar Sharifi, Modular curves and cyclotomic fields](https://swc-math.github.io/aws/2018/2018SharifiNotes.pdf), §3.4, Theorem 3.4.16 and its proof paragraph, Remark 3.4.17, p. 38. The general-weight rational conclusion and the explicit Shokurov proof input; the source proof boundary is retained. [V. V. Shokurov, Shimura integrals of cusp forms](https://www.maths.ed.ac.uk/~icheltso/shokurov/pdf/cusp.pdf), §4, Theorem 4.3, Corollaries 4.4–4.5 and proofs, pp.638–641; §3.3–3.4, pp.634–635. Positive-weight boundary scalar and rational complement. Its homological coefficient/action conventions must be transported through the recorded R14.3 request; this source does not supply a Lean arithmetic realization.

<a id="L0-drinfeld-manin-splitting"></a>

#### The rational Drinfeld–Manin splitting

**Target `L0/drinfeld-manin-splitting` (construction).** For N ≥ 3 and k ≥ 0 there is a unique ℚ-linear retraction s_N : H¹(Γ(N),V_k(ℚ)) → H¹_par(Γ(N),V_k(ℚ)) equivariant for the rational good Hecke algebra (usual T_ℓ and scalar S_ℓ, ℓ not dividing N). Its inclusion-composite is the rational parabolic projector. Under the requested coefficient/local-system comparison, take the direct sum over geometric components to obtain Nakamura’s s_N : H¹(Y(N)(ℂ),𝒱_{k+2/ℚ}) → H¹(X(N)(ℂ),j_*𝒱_{k+2/ℚ}). Rationalization precedes this construction; no integral splitting is asserted.

**Hypotheses and boundaries.**

- Nakamura’s weight is k+2 and his curve Y(N) has all geometric components, whereas the connected Betti prototype uses Γ(N).
- The comparison between Nakamura’s dual symmetric-power local system and the packet’s adjugate action, including determinant twists and usual versus adjoint Hecke operators, is requested from the geometric supplier.
- Higher-weight rational spectral separation has the source gap recorded at rational-hecke-separation.

**Inputs.** [L0/rational-hecke-separation](#L0-rational-hecke-separation), [L0/parabolic-cohomology](#L0-parabolic-cohomology), `mathlib:Submodule.projectionOnto`, `mathlib:LinearMap.isCompl_of_proj`, `ModularCurvesPartII:R14.3`, `tauceti:TauCetiRoadmap/ModularForms#10c--modular-forms-as-section-spaces-and-the-dimension-formulas`.

**Build plan.**

1. Take A,F,G from rational-hecke-separation and Bézout polynomials a,b with aF+bG=1. Set e=b(A)G(A). Its image lies in P and it restricts to the identity on P, since F(A) kills P. Native projection theory identifies ker(e) as a complement.
2. Every good Hecke generator commutes with A, hence with e. Restrict the codomain of e to P to define s_N. This supplies existence, retraction, equivariance and idempotence.
3. If t is another Hecke-equivariant retraction, it commutes with A and all its polynomials. Since F(A) kills P, t(1−e)=a(A)|_P F(A)|_P t=0, while t e=s_N. Therefore t=s_N.
4. For an endomorphism preserving P and commuting with the good Hecke algebra, its commutation with the same polynomial projector proves naturality.
5. After the requested geometric dictionary, the usual and adjoint Hecke actions are related by Nakamura Lemma 3.1, with T′_ℓ=ℓ^k T_ℓ S_ℓ⁻¹ and S′_ℓ=ℓ^(2k) S_ℓ⁻¹. Thus the projector commutes with both. The full-curve action of complex conjugation, and the Galois action after rational p-adic coefficient extension and Betti–étale comparison, must be transported through that dictionary; the suggested file does not claim to have these geometric carriers.

**API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `drinfeldManin` | constructor | For N ≥ 3, the rational retraction H¹(Γ(N),V_k(ℚ)) → H¹_par(Γ(N),V_k(ℚ)) with the usual good Hecke action. |
| `drinfeldManin_subtype` | simp | For x in the parabolic subspace, s_N(x) = x. |
| `drinfeldManin_hecke` | compatibility | For every prime ℓ not dividing N, inclusion(s_N(T_ℓ x)) = T_ℓ inclusion(s_N(x)). |
| `drinfeldManin_scalarHecke` | compatibility | For every prime ℓ not dividing N, inclusion(s_N(S_ℓ x)) = S_ℓ inclusion(s_N(x)). |
| `drinfeldManin_unique` | characterisation | Any ℚ-linear retraction to the parabolic subspace which intertwines all good T_ℓ and S_ℓ equals s_N. |
| `drinfeldManin_idempotent` | relation | s_N(inclusion(s_N(x))) = s_N(x), so inclusion composed with s_N is an idempotent endomorphism with image the parabolic subspace. |
| `drinfeldManin_natural` | functoriality | An endomorphism F of rational cohomology that preserves the parabolic subspace and commutes with every good T_ℓ and S_ℓ also commutes with inclusion composed with s_N. Preservation and commutation are hypotheses to verify for the geometric involution and arithmetic realization actions. |

**Unit tests.**

- `DrinfeldManinTest.genus_zero` (degenerate): At full level N=3 and weight two (k=0), X(3) has genus zero, the parabolic subspace is zero and drinfeldManin 3 0 is the zero linear map. Ordinary H¹ has dimension three, so the ordinary and parabolic spaces are not identified.
- `DrinfeldManinTest.identity_parabolic` (compatibility): At full level N=6 and weight two, dim_ℚ H¹_par=2 and s_6 restricts to the identity on that subspace. This excludes the zero retraction.
- `DrinfeldManinTest.rational_model` (computation): For H=ℚ², P=ℚ×{0} and T(x,y)=(y,2y), the Bézout projector e=1−T/2 sends (0,1) to (−1/2,0), fixes (1,0), kills T(H), commutes with T and satisfies e²=e. Projection onto the first coordinate alone fails to commute with T.
- `DrinfeldManinTest.integral_obstruction` (non-example): For the same model over ℤ there is no ℤ-linear retraction s:ℤ²→ℤ with s(1,0)=1 and s(Tv)=0 for all v: substituting v=(0,1) forces 1+2s(0,1)=0.

**Acceptance.**

- At full level N=3 and weight two (k=0), X(3) has genus zero, the parabolic subspace is zero and drinfeldManin 3 0 is the zero linear map. Ordinary H¹ has dimension three, so the ordinary and parabolic spaces are not identified.
- At full level N=6 and weight two, dim_ℚ H¹_par=2 and s_6 restricts to the identity on that subspace. This excludes the zero retraction.
- For H=ℚ², P=ℚ×{0} and T(x,y)=(y,2y), the Bézout projector e=1−T/2 sends (0,1) to (−1/2,0), fixes (1,0), kills T(H), commutes with T and satisfies e²=e. Projection onto the first coordinate alone fails to commute with T.
- For the same model over ℤ there is no ℤ-linear retraction s:ℤ²→ℤ with s(1,0)=1 and s(Tv)=0 for all v: substituting v=(0,1) forces 1+2s(0,1)=0.

**Sources.** [Kentaro Nakamura, Zeta morphisms for rank two universal deformations](https://link.springer.com/content/pdf/10.1007/s00222-023-01203-7.pdf), §3.2, p. 220, opening paragraph and (20)–(21); §3.1.2, Lemma 3.1, p. 206. The unique rational Hecke-equivariant retraction and its usual/adjoint, real and p-adic arithmetic compatibilities. The mathematical formulas were checked on the published PDF.

**Planets:** Modular symbols, Hecke operators on modular symbols, Boundary exact sequence, Parabolic cohomology, Eichler–Shimura isomorphism, Drinfeld–Manin splitting.

### L1: Periods and critical values

<a id="L1-period-lines"></a>

#### Period lines and periods

**Target `L1/period-lines` (definition).** Let f ∈ S_{k+2}(Γ₁(N)) be a normalized newform with character ε_N and coefficient field K_f = ℚ(a_n(f), ε_N), with a fixed embedding K_f ↪ ℂ. For each sign ± the period line is L_f^± := Symb_{Γ₁(N)}(V_k(K_f))^±[λ_f], a one-dimensional K_f-space (L0/eigenspace-dimension), and ψ_f^± := (1 ± ι)ψ_f lies in L_f^± ⊗_{K_f} ℂ. A period exists only after a basis is chosen: for φ^± ∈ L_f^± ∖ {0}, Ω_f^±(φ^±) ∈ ℂ^× is the scalar with ψ_f^± = Ω_f^±(φ^±)·φ^±. Replacing φ^± by λφ^± (λ ∈ K_f^×) replaces Ω_f^± by λ^{−1}Ω_f^± and every period-normalized value by λ times itself.

**Hypotheses and boundaries.**

- ψ_f, ι and the ± decomposition are L0's (period-symbol, involution-at-infinity, plus-minus-decomposition); ι = (−1 0; 0 1) normalizes Γ₁(N).
- The line is the object; a scalar period is a coordinate on it. No canonical K_f-basis is assumed (RS-08: 'not a nonexistent canonical integral period basis').

**Inputs.** [L0/eigenspace-dimension](#L0-eigenspace-dimension), [L0/period-symbol](#L0-period-symbol), [L0/plus-minus-decomposition](#L0-plus-minus-decomposition), [L0/symbols-base-change](#L0-symbols-base-change).

**Build plan.**

1. L_f^± ⊗_{K_f} ℂ is the f-isotypic ±-part of Symb_{Γ₁(N)}(V_k(ℂ)) by symbols-base-change, and it contains ψ_f^± by the Hecke equivariance of f ↦ ψ_f.
2. Since the space is one-dimensional and ψ_f^± ≠ 0 (Eichler–Shimura), Ω_f^±(φ^±) exists and is nonzero; Ω(λφ) = λ^{−1}Ω(φ) is immediate.

**API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `TauCeti.ModularSymbol.periodLine` | constructor | L_f^± = Symb_{Γ₁(N)}(V_k(K_f))^±[λ_f]. |
| `TauCeti.ModularSymbol.periodLine_finrank` | characterisation | finrank_{K_f} L_f^± = 1. |
| `TauCeti.ModularSymbol.period` | constructor | Ω_f^±(φ) for a nonzero φ ∈ L_f^±. |
| `TauCeti.ModularSymbol.period_smul` | compatibility | Ω_f^±(λ • φ) = λ⁻¹ • Ω_f^±(φ). |
| `TauCeti.ModularSymbol.psi_eq_period_smul` | characterisation | ψ_f^± = Ω_f^±(φ) • φ in L_f^± ⊗ ℂ. |

**Unit tests.**

- `psiPlus_eleven_a` (example): 11a1: ψ_f^+({0} − {∞}) = 2L(f, 1).
- `period_smul` (characterisation): Ω(λφ) = λ⁻¹Ω(φ) (a proved field identity in the suggested file).
- `psi_no_line` (non-example): The unsplit f-isotypic eigenspace has dimension two; span(ψ_f) has dimension one. Thus ψ_f alone does not give a basis of the unsplit eigenspace.

**Acceptance.**

- 11a1 (k = 0): ι fixes 0 and ∞, so ψ_f^+({0} − {∞}) = 2ψ_f({0} − {∞}) = 2L(f, 1) ≈ 0.50768.
- Rescaling a basis by λ multiplies Ω by λ^{−1}: only statements invariant under this are basis-free.
- The unsplit f-isotypic eigenspace has dimension two, whereas the span of the single vector ψ_f has dimension one. A scalar period for the whole eigenspace requires two signed coordinates.

**Sources.** [Robert Pollack, Overconvergent modular symbols (Arizona Winter School 2011 lecture notes)](https://swc-math.github.io/aws/2011/2011PollackNotes.pdf), §2 (after 2.10), p. 13. Periods as scalars relating ψ_f^± to rational symbols.

<a id="L1-integral-period-lattices"></a>

#### Saturated integral lattices and integral periods

**Target `L1/integral-period-lattices` (construction).** Let 𝒪 be a discrete valuation ring (or a PID) whose fraction field K contains K_f, for example the completion of 𝒪_{K_f} at a prime. Let V_k(𝒪) = 𝒪[X, Y]_k with L0's right action. The saturated lattice L_f^±(𝒪) := (L_f^± ⊗_{K_f} K) ∩ Symb_{Γ₁(N)}(V_k(𝒪)) is free of rank one over 𝒪. A generator φ_𝒪^± is unique up to 𝒪^×, so the integral period Ω_{f,𝒪}^± := Ω_f^±(φ_𝒪^±) is canonical up to 𝒪^×. It depends on the lattice V_k(𝒪) (L0/polynomial-duality: V_k(𝒪) and Hom(Sym^k 𝒪², 𝒪) agree only after inverting k!). Comparisons with integral Hecke modules (freeness of the f-part over 𝕋_𝔪, congruence modules) need multiplicity-one hypotheses, which are not assumed here.

**Hypotheses and boundaries.**

- Finite generation of Symb_Γ(V_k(𝒪)) comes from Manin's theorem (Div⁰ is finitely generated over ℤ[Γ]; requested from Tau Ceti ModularForms Layer 8 by L0).
- Multiplicity one enters only when φ_𝒪^± is compared with a generator of a Hecke-module structure; the saturation itself exists for any line.
- A local coefficient field has no distinguished complex embedding. Complex scalar periods require an explicitly chosen field embedding into ℂ extending the chosen embedding of K_f; without it, integral periods mean coordinates in the abstract signed line. No continuous ℂ_p-to-ℂ comparison is asserted.

**Inputs.** [L1/period-lines](#L1-period-lines), [L0/symbols-base-change](#L0-symbols-base-change), [L0/polynomial-duality](#L0-polynomial-duality), [L0/modular-symbols](#L0-modular-symbols).

**Build plan.**

1. Symb_Γ(V_k(𝒪)) is finitely generated and torsion-free, and embeds in Symb_Γ(V_k(K)) (symbols-base-change, 𝒪 → K flat).
2. The intersection of a K-line with it is nonzero (clear denominators of a K_f-basis) and finitely generated torsion-free of rank one, hence free over the PID 𝒪.
3. Saturation: the quotient of Symb_Γ(V_k(𝒪)) by L_f^±(𝒪) is torsion-free by construction, and generators differ by 𝒪^×.

**API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `TauCeti.ModularSymbol.integralPeriodLattice` | constructor | L_f^±(𝒪) as an 𝒪-submodule of Symb(V_k(𝒪)). |
| `TauCeti.ModularSymbol.integralPeriodLattice_free` | characterisation | Free of rank one over 𝒪. |
| `TauCeti.ModularSymbol.integralPeriod` | constructor | Ω_{f,𝒪}^± from a generator. |
| `TauCeti.ModularSymbol.integralPeriod_unit` | compatibility | Two generators give periods differing by a unit of 𝒪. |

**Unit tests.**

- `integralPeriod_k0` (example): Over Z_p in weight two, a saturated rank-one integral eigenline generator has at least one unit value. This is stronger than merely choosing a nonzero bounded symbol.
- `integralPeriod_unit` (characterisation): Generators differ by 𝒪^×.
- `integralPeriod_not_saturated` (non-example): p·L_f^±(𝒪) is a lattice in the line but not saturated, and its generator's period is off by p.

**Acceptance.**

- k = 0, 𝒪 = ℤ_(p): φ_𝒪^± is the ℤ_(p)-valued symbol in the line whose values are not all divisible by p.
- The non-saturated sublattice p·L_f^±(𝒪) gives a period off by p, not by a unit.
- For p ≤ k, V_k(𝒪) and Hom(Sym^k 𝒪², 𝒪) can give different saturations: the pairing of L0/polynomial-duality has denominators C(k, i).

**Sources.** [Robert Pollack, Overconvergent modular symbols (Arizona Winter School 2011 lecture notes)](https://swc-math.github.io/aws/2011/2011PollackNotes.pdf), §2 (after 2.10), p. 13. Pollack normalizes by a period so that the values are rational; the saturated integral choice refines this up to 𝒪^×.

<a id="L1-twisted-mellin-formula"></a>

#### The twisted Mellin formula for modular symbols

**Target `L1/twisted-mellin-formula` (theorem).** Let f = Σ a_n q^n ∈ S_{k+2}(Γ₁(N)), χ a primitive Dirichlet character of conductor m ≥ 1, τ(χ) = Σ_{a mod m} χ(a)e^{2πia/m}, L(f, χ, s) = Σ χ(n)a_n n^{−s} (entire, in the convention of Tau Ceti ModularForms Layer 7), and 0 ≤ j ≤ k. Then, along vertical paths, Σ_{a mod m} χ(a)·2πi∫_{i∞}^{a/m} f(z)(z − a/m)^j dz = τ(χ)·j!/(−2πi)^j·L(f, χ̄, j+1). Equivalently, with χ̄ for χ, Σ_a χ̄(a)·2πi∫_{i∞}^{a/m} f(z)(z − a/m)^j dz = τ(χ̄)·j!/(−2πi)^j·L(f, χ, j+1). In symbol form, Σ_a χ(a)·λ_{j,a/m}(ψ_f({a/m} − {∞})) = τ(χ)·j!/(−2πi)^j·L(f, χ̄, j+1) with λ_{j,x}(P) = (j!/k!)(∂_Y^{k−j}P)(1, −x). For m = 1: 2πi∫_{i∞}^0 f(z)z^j dz = j!/(−2πi)^j·L(f, j+1).

**Hypotheses and boundaries.**

- The Mellin transform, entire continuation of L(g, s) for cusp forms g, and twisted L-functions are imported from Tau Ceti ModularForms Layer 7 (RS-08).
- Every convention that changes the formula is explicit. The sum against χ(a) produces L(f, χ̄), not L(f, χ). The Gauss sum is τ(χ) = Σχ(a)e^{2πia/m}. The path runs from i∞ to a/m; reversing it changes the sign. Using −a/m multiplies by χ(−1). The factor 2πi sits in ψ_f, with j!/(−2πi)^j on the right, and not (2πi)^{j+1}.

**Inputs.** [L0/period-symbol](#L0-period-symbol).

**Build plan.**

1. Birch's lemma: Σ_{a mod m} χ̄(a)e^{2πina/m} = χ(n)τ(χ̄) for primitive χ and every n, so f_χ := Σχ(n)a_n q^n = τ(χ̄)^{−1}Σ_a χ̄(a) f(z + a/m).
2. Mellin: for a cusp form g, 2πi∫_{i∞}^{0} g(z)z^j dz = −2πi·i^{j+1}∫_0^∞ g(iy)y^j dy = −2πi·i^{j+1}·j!(2π)^{−j−1}L(g, j+1) = j!/(−2πi)^j·L(g, j+1). The integral converges at both ends because g vanishes at every cusp.
3. Apply this to g = f_χ and substitute w = z + a/m: Σ_a χ̄(a)·2πi∫_{i∞}^{a/m} f(w)(w − a/m)^j dw = τ(χ̄)·j!/(−2πi)^j·L(f, χ, j+1). Then exchange χ and χ̄.
4. Symbol form: λ_{j,x}((zX + Y)^k) = (j!/k!)·(k!/j!)(z − x)^j = (z − x)^j.

**Acceptance.**

- m = 1, k = 0: 2πi∫_{i∞}^0 f(z)dz = L(f, 1). For 11a1, L(f, 1) = 0.2538418608… (PARI/GP 2.17.2).
- Numerical check with PARI/GP 2.17.2 via cypari2, 2026-09-28, for the characters of order 3 and 6 modulo 7. For 11a1 (k = 0), with the integrals computed through Γ₀(11)-periods, both sides agree to 10^{−14}. For the level-5 weight-4 newform (k = 2) and j = 0, 1, 2, they agree to 10^{−11}. The reading with L(f, χ, j+1) fails by O(1).
- For real χ the distinction between χ and χ̄ disappears, so quadratic-twist checks cannot detect a misplaced bar.

**Sources.** [Robert Pollack, Overconvergent modular symbols (Arizona Winter School 2011 lecture notes)](https://swc-math.github.io/aws/2011/2011PollackNotes.pdf), §2.8, p. 9. The untwisted case 2πi∫_{i∞}^0 f(z)z^j dz = j!/(−2πi)^j·L(f, j+1), 0 ≤ j ≤ k. [Robert Pollack, Overconvergent modular symbols (Arizona Winter School 2011 lecture notes)](https://swc-math.github.io/aws/2011/2011PollackNotes.pdf), §2.1, formula (2), p. 3. (2): L(f, χ, 1) = τ(χ)/N·Σ_{a mod N} χ̄(a)·2πi∫_{i∞}^{−a/N} f(z)dz, the case k = j = 0 in the −a/N form. The bar is printed but lost in text extraction; read on the page image.

<a id="L1-critical-value-algebraicity"></a>

#### Algebraicity of critical values with the parity sign

**Target `L1/critical-value-algebraicity` (theorem).** Let T_{j,χ}(ψ) := Σ_{a mod m} χ(a)·λ_{j,a/m}(ψ({a/m} − {∞})) and ε := (−1)^{k−j}χ(−1). Then T_{j,χ}(ψ|ι) = εT_{j,χ}(ψ), so T_{j,χ} vanishes on the −ε eigenspace and T_{j,χ}(ψ_f) = ½T_{j,χ}(ψ_f^ε). For any basis φ^ε of L_f^ε, τ(χ)·j!/(−2πi)^j·L(f, χ̄, j+1)/Ω_f^ε(φ^ε) = ½T_{j,χ}(φ^ε) ∈ K_f(χ), for 0 ≤ j ≤ k and χ primitive. The sign is selected by parity: when k is even (for instance trivial character), ε = (−1)^jχ(−1).

**Hypotheses and boundaries.**

- The action (P|γ)(X, Y) = P((X, Y)γ*) with γ* = adj γ, and (φ|ι)(D) = φ(ιD)|ι, are L0's; other conventions change ε by a sign that must be tracked.

**Inputs.** [L1/twisted-mellin-formula](#L1-twisted-mellin-formula), [L1/period-lines](#L1-period-lines), [L0/involution-at-infinity](#L0-involution-at-infinity), [L0/eigenspace-dimension](#L0-eigenspace-dimension).

**Build plan.**

1. For ι = (−1 0; 0 1), ι* = (1 0; 0 −1) and (P|ι)(X, Y) = P(X, −Y), so λ_{j,x}(P|ι) = (−1)^{k−j}λ_{j,−x}(P).
2. ι({a/m} − {∞}) = {−a/m} − {∞}; substituting a ↦ −a gives T_{j,χ}(ψ|ι) = (−1)^{k−j}χ(−1)T_{j,χ}(ψ).
3. T_{j,χ}((1 ± ι)ψ) = (1 ± ε)T_{j,χ}(ψ), which is 2T(ψ) for the sign ε and 0 for the other.
4. ψ_f^ε = Ω^εφ^ε with φ^ε K_f-rational, and λ_{j,a/m} has rational coefficients, so T_{j,χ}(φ^ε) ∈ K_f(χ). Conclude with twisted-mellin-formula.

**Acceptance.**

- 11a1, χ = 1, j = 0 (ε = +): 2πi∫_{i∞}^0 f(z)dz = L(f, 1) = Ω_E^+/5, with Ω_E^+ the real Néron period of X₀(11) (AWS (1), p. 2). So L(f, 1)/Ω_E^+ ∈ ℚ.
- Changing φ^ε by λ ∈ K_f^× multiplies the normalized value by λ (period-lines).
- Dividing by the period of the other sign gives nothing: T_{j,χ} vanishes identically on L_f^{−ε}.

**Sources.** [Robert Pollack, Overconvergent modular symbols (Arizona Winter School 2011 lecture notes)](https://swc-math.github.io/aws/2011/2011PollackNotes.pdf), §2 (after 2.10), p. 13. The case k = j = 0. [Joaquín Rodrigues Jacinto and Chris Williams, An introduction to p-adic L-functions](https://arxiv.org/pdf/2309.15692v2), Appendix B.2.1, p. 79. The range 0 ≤ j ≤ k of critical values.

<a id="L1-p-stabilised-euler-factors"></a>

#### L-functions of p-stabilized forms

**Target `L1/p-stabilised-euler-factors` (lemma).** Let f° be a newform of level N prime to p with character ε_N, α and β the roots of X² − a_pX + ε_N(p)p^{k+1}, and f_α(z) = f°(z) − βf°(pz), so that U_p f_α = αf_α. Then L(f_α, s) = (1 − βp^{−s})L(f°, s), and L(f_α, χ, s) = L(f°, χ, s) for every χ of conductor p^n with n ≥ 1. At s = j+1, βp^{−j−1} = ε_N(p)p^{k−j}/α.

**Hypotheses and boundaries.**

- This separates the L-function of the p-stabilized form, which RJW's f (level Γ₀(N) with p | N) is, from that of the newform of level prime to p.

**Inputs.** [L1/twisted-mellin-formula](#L1-twisted-mellin-formula).

**Build plan.**

1. a_n(f_α) = a_n(f°) − βa_{n/p}(f°), with a_{n/p} = 0 when p ∤ n, so L(f_α, s) = L(f°, s) − βp^{−s}L(f°, s).
2. For χ of conductor p^n with n ≥ 1, χ(n) = 0 whenever p | n, so the twisted series agree.
3. αβ = ε_N(p)p^{k+1} gives βp^{−j−1} = ε_N(p)p^{k−j}/α.

**Acceptance.**

- k = 0, trivial character, j = 0: 1 − βp^{−1} = 1 − 1/α.
- Stabilizing at β instead of α exchanges the roles: L(f_β, s) = (1 − αp^{−s})L(f°, s).
- This lemma supplies the second Euler factor of the n = 0 interpolation formula (rjw-b1-comparison).

**Sources.** [Joaquín Rodrigues Jacinto and Chris Williams, An introduction to p-adic L-functions](https://arxiv.org/pdf/2309.15692v2), Appendix B.2, p. 79. RJW's f is already p-stabilized.

<a id="L1-rjw-b1-comparison"></a>

#### The RJW B.1 interpolation formula in the period dictionary

**Target `L1/rjw-b1-comparison` (theorem).** RJW Theorem B.1 prints, for f of weight k+2 and level Γ₀(N) with p | N, U_p-eigenvalue α_p with v_p(α_p) < k+1, χ of conductor p^n and 0 ≤ j ≤ k: L_p^an(f, χ̄, j+1) = ∫_{ℤ_p^×}χ(x)x^j·L_p^an(f) = −α_p^{−n}(1 − χ(p)p^j/α_p)·G(χ)·j!·p^{nj}/(2πi)^{j+1}·L(f, χ̄, j+1)/Ω_f^±, with G(χ) = τ(χ). In the dictionary of twisted-mellin-formula, put I_j(x) := 2πi∫_{i∞}^{x} f(z)(z − x)^j dz. For n ≥ 1 the right side equals exactly (−1)^{j+1}/(2πi·Ω_f^±)·α_p^{−n}p^{nj}Σ_{a mod p^n}χ(a)I_j(a/p^n), and equally −ε(−1)^k/(2πi·Ω_f^±)·α_p^{−n}p^{nj}Σ_aχ(a)I_j(−a/p^n), where ε = (−1)^{k−j}χ(−1). Only the second prefactor depends on the sign ε alone. So B.1 holds with a j-independent period Ω_f^± exactly when the distribution is normalized through the cusps −a/p^n, or equivalently through x ↦ −x: this is the normalization L2 must fix. For n = 0 and f = f_α the p-stabilization of f°, B.1 reads −(1 − p^j/α)(1 − ε_N(p)p^{k−j}/α)·j!/(2πi)^{j+1}·L(f°, j+1)/Ω^±.

**Hypotheses and boundaries.**

- This node proves the classical side of the comparison. The existence and uniqueness of L_p^an(f) as a locally analytic distribution of growth v_p(α_p) (Manin, Amice–Vélu, Višik; Pollack–Stevens) is stage L2.
- The stage text quotes B.1 with 'L(f,chi,j+1)'. RJW's printed B.1 has χ̄ both in L_p^an(f, χ̄, j+1) and in L(f, χ̄, j+1); this was read on the page image, because text extraction drops the bar. B.1 as printed therefore agrees with the dictionary and needs no source correction; the stage's transcription drops the bar.

**Inputs.** [L1/twisted-mellin-formula](#L1-twisted-mellin-formula), [L1/p-stabilised-euler-factors](#L1-p-stabilised-euler-factors), [L1/critical-value-algebraicity](#L1-critical-value-algebraicity), [L1/period-lines](#L1-period-lines).

**Build plan.**

1. Substitute twisted-mellin-formula (m = p^n): L(f, χ̄, j+1) = (−2πi)^j/(τ(χ)j!)·Σ_aχ(a)I_j(a/p^n). Then G(χ) = τ(χ) cancels and leaves −(−2πi)^j/(2πi)^{j+1} = (−1)^{j+1}/(2πi).
2. Σ_aχ(a)I_j(−a/p^n) = χ(−1)Σ_aχ(a)I_j(a/p^n), and (−1)^{j+1}χ(−1) = −ε(−1)^k.
3. For n ≥ 1, χ(p) = 0 and L(f_α, χ̄, s) = L(f°, χ̄, s) (p-stabilised-euler-factors), so the formula does not see the stabilization.
4. For n = 0, G(1) = 1, χ(p) = 1 and L(f_α, j+1) = (1 − ε_N(p)p^{k−j}/α)L(f°, j+1).

**Acceptance.**

- Pollack–Stevens (1) (§6, p. 27) is the same statement in another normalization: μ_f(z^j·χ) = α^{−n}·p^{n(j+1)}/(−2πi)^j·j!/τ(χ^{−1})·L(f, χ^{−1}, j+1)/Ω_f^±. Since τ(χ)τ(χ^{−1}) = χ(−1)p^n, this is χ(−1)·α^{−n}p^{nj}Σ_aχ(a)I_j(a/p^n)/Ω_f^± = α^{−n}p^{nj}Σ_aχ(a)I_j(−a/p^n)/Ω_f^±. It is the normalization through −a/p^n, and so consistent with B.1 with Ω_{B.1}^ε = −ε(−1)^kΩ_{PS}^ε/(2πi).
- Pollack's AWS notes (p. 13): ∫χ dμ_f = α^{−n}τ(χ)L(f, χ̄, 1)/Ω_f^± for k = 0, n ≥ 1, from μ_f(a + p^nℤ_p) built on {a/p^n} − {∞}. This is the normalization through +a/p^n, which for k = j = 0 differs from B.1 by −1/(2πi) and the sign χ(−1) = ε.
- Reading B.1 with L(f, χ, j+1), as the stage text transcribes it, would contradict the numerical check of twisted-mellin-formula for non-real χ; for quadratic χ both readings agree.

**Sources.** [Joaquín Rodrigues Jacinto and Chris Williams, An introduction to p-adic L-functions](https://arxiv.org/pdf/2309.15692v2), Theorem B.1, pp. 79–80. The statement compared (formula read on the page image). [Robert Pollack and Glenn Stevens, Overconvergent modular symbols and p-adic L-functions](https://www.numdam.org/item/10.24033/asens.2139.pdf), §6, interpolation property (1), p. 27. The −a/p^n-normalized form. [Robert Pollack, Overconvergent modular symbols (Arizona Winter School 2011 lecture notes)](https://swc-math.github.io/aws/2011/2011PollackNotes.pdf), §2 (after 2.10), p. 13; §5.1 formula (7), p. 24. The +a/p^n-normalized form.

**Planets:** Period lines, Twisted Mellin formula, Algebraicity of critical values, Interpolation dictionary.

### L2: Refinements and small slope

<a id="L2-p-stabilisation"></a>

#### p-stabilisations of a newform

**Target `L2/p-stabilisation` (construction).** Let f° = Σ a_n q^n ∈ S_{k+2}(Γ₁(N), ε) be a newform, p ∤ N a prime, and α a root of X² − a_pX + ε(p)p^{k+1}, with β := a_p − α the other root; α ≠ 0 since αβ = ε(p)p^{k+1}. Then f_α(z) := f°(z) − βf°(pz) lies in S_{k+2}(Γ₁(N) ∩ Γ₀(p), ε) ⊆ S_{k+2}(Γ₁(Np)), has coefficients a_n(f_α) = a_n − βa_{n/p} (with a_{n/p} := 0 for p ∤ n), satisfies U_p f_α = αf_α, and T_ℓ f_α = a_ℓ f_α for primes ℓ ∤ Np. On the span of f°(z) and f°(pz), U_p acts by U_p(f°(pz)) = f° and U_p f° = a_p f° − ε(p)p^{k+1}f°(pz), a companion matrix of X² − a_pX + ε(p)p^{k+1}. So each root has a one-dimensional eigenspace in this span, and U_p is semisimple on it if and only if α ≠ β.

**Hypotheses and boundaries.**

- The weight is w = k + 2, so the stage's X² − a_pX + ε(p)p^{w−1} is the polynomial here.
- The change of Euler factor, L(f_α, s) = (1 − βp^{−s})L(f°, s), is L1/p-stabilised-euler-factors, which takes f_α as defined here.
- At p | N there is no stabilisation: the refinement uses the U_p-eigenvalue a_p of the newform itself (refinement).

**Inputs.** [L0/hecke-operators-gamma1](#L0-hecke-operators-gamma1), `tauceti:TauCeti.CuspForm.levelRaise`, `tauceti:TauCeti.CuspForm.qExpansion_levelRaise`, `tauceti:HeckeRing.GL2.heckeUCuspNat_eq_smul_iff_forall_qExpansion_coeff_prime_mul`, `tauceti:HeckeRing.GL2.heckeTCuspNat_eq_smul_iff_forall_qExpansion_coeff_prime_mul`.

**Build plan.**

1. q-expansion: f°(pz) = V_p f° has coefficients a_{n/p} (Tau Ceti CuspForm.qExpansion_levelRaise), so a_n(f_α) = a_n − βa_{n/p}.
2. U_p-eigenvalue by coefficients (Tau Ceti heckeUCuspNat_eq_smul_iff_forall_qExpansion_coeff_prime_mul at level Np): a_{pm}(f_α) = a_{pm} − βa_m, while α·a_m(f_α) = αa_m − αβa_{m/p}. These agree because a_{pm} = a_pa_m − ε(p)p^{k+1}a_{m/p} (the good-prime recurrence, heckeTCuspNat_eq_smul_iff_forall_qExpansion_coeff_prime_mul, whose weight k is k + 2 here) and α + β = a_p, αβ = ε(p)p^{k+1}.
3. The two displayed U_p-relations are the coefficient identities a_{pm}(V_pf°) = a_m(f°) and the same recurrence. A companion matrix is cyclic, so every eigenvalue has geometric multiplicity one, and it is diagonalizable exactly when its two roots differ.
4. T_ℓ for ℓ ∤ Np commutes with V_p, so f_α has the same good eigenvalues as f°.

**API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `TauCeti.ModularSymbol.pStabilisation` | constructor | f_α = f° − β·V_p f° in S_{k+2}(Γ₁(Np)). |
| `TauCeti.ModularSymbol.pStabilisation_coeff` | characterisation | a_n(f_α) = a_n − β·a_{n/p}. |
| `TauCeti.ModularSymbol.pStabilisation_Up` | characterisation | U_p f_α = α f_α. |
| `TauCeti.ModularSymbol.pStabilisation_heckeT` | compatibility | T_ℓ f_α = a_ℓ f_α for ℓ ∤ Np. |

**Unit tests.**

- `pStabilisation_coeff_coprime` (example): a_n(f_α) = a_n(f°) for p ∤ n.
- `pStabilisation_Up` (characterisation): U_p f_α = α f_α, from the coefficient recurrence.
- `pStabilisation_ne` (non-example): α ≠ β implies f_α ≠ f_β: the stabilisation depends on the root.

**Acceptance.**

- 11a1 (k = 0) at p = 3: a_3 = −1 and X² + X + 3 has roots of 3-adic valuations 0 and 1; Pollack–Stevens §8 use f_α, f_β of level 33 with f_α|U_3 = αf_α and f_β|U_3 = βf_β.
- a_n(f_α) = a_n(f°) for p ∤ n.
- f_α ≠ f_β when α ≠ β (their difference is (α − β)f°(pz) ≠ 0), so f° alone does not determine the stabilised form.

**Sources.** [Robert Pollack and Glenn Stevens, Overconvergent modular symbols and p-adic L-functions](https://www.numdam.org/item/10.24033/asens.2139.pdf), §8, the example of X₀(11) at p = 3, p. 35. The two p-stabilizations and their U_p-eigenvalues.

<a id="L2-refinement"></a>

#### Refinements and their slopes

**Target `L2/refinement` (definition).** A refinement at p of a newform f of weight k + 2, level N and character ε is a pair (f, α) with: if p ∤ N, α a root of X² − a_pX + ε(p)p^{k+1}, with refined form f_α (p-stabilisation); if p | N, α = a_p(f) ≠ 0 and refined form f itself. Its slope is h := v_p(α) for a fixed embedding ℚ̄ ↪ ℚ̄_p. The refinement has small slope if h < k + 1 = w − 1, and critical slope if h = k + 1. A refinement is the chosen root together with its eigenline (refined-eigenline); it is not determined by f alone.

**Hypotheses and boundaries.**

- Throughout, Γ₀ := Γ₁(N) ∩ Γ₀(p) when p ∤ N and Γ₀ := Γ₁(N) when p | N. Pollack–Stevens work with Γ₀ = Γ ∩ Γ₀(p) for Γ of level prime to p. Their proofs use only that Γ₀ ⊆ Σ₀(p) has finite index (for Corollary 2.10, here L0/symbols-generator-values) and that U_p = Σ_{a=0}^{p−1}|β(a, p) with β(a, p) = (1 a; 0 p). Both hold for Γ₁(N) with p | N (L0/hecke-operators-gamma1), which is the stage's case of p dividing the level.
- α is an algebraic integer, so h ≥ 0. When p ∤ N, αβ = ε(p)p^{k+1} with β integral gives v_p(α) + v_p(β) = k + 1, so 0 ≤ h ≤ k + 1.
- When p | N and a_p ≠ 0, the slope is k/2 in the case p ‖ N with ε of conductor prime to p (a_p² = ε(p)p^k, the bad-prime eigenvalue milestone of Tau Ceti ModularForms Layer 4). This is used only in examples.

**Inputs.** [L2/p-stabilisation](#L2-p-stabilisation), [L0/hecke-operators-gamma1](#L0-hecke-operators-gamma1).

**Build plan.**

1. Well-definedness is immediate; the slope bound is the valuation identity above.

**API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `TauCeti.ModularSymbol.Refinement` | structure | A newform with a chosen U_p-eigenvalue α at p (a root of the Hecke polynomial, or a_p ≠ 0 at p \| N). |
| `TauCeti.ModularSymbol.Refinement.slope` | constructor | h = v_p(α). |
| `TauCeti.ModularSymbol.Refinement.slope_le` | characterisation | 0 ≤ h ≤ k + 1 when p ∤ N. |

**Unit tests.**

- `refinement_ordinary_slopes` (example): For ordinary f the two slopes are 0 and k + 1.
- `refinement_slope_add` (characterisation): v_p(α) + v_p(β) = k + 1 for p ∤ N.
- `refinement_ap_zero` (non-example): At p | N with a_p = 0 there is no refinement.

**Acceptance.**

- p-ordinary f (a_p a p-adic unit, p ∤ N): one refinement of slope 0 and one of slope k + 1, which is critical.
- 11a1 at p = 3: slopes 0 and 1 (Pollack–Stevens §8).
- p | N with a_p = 0 (for example p² | N with ε of conductor prime to p): no refinement.

**Sources.** [Robert Pollack and Glenn Stevens, Overconvergent modular symbols and p-adic L-functions](https://www.numdam.org/item/10.24033/asens.2139.pdf), §5.3, p. 24. Slopes of U_p-eigensymbols lie in [0, k + 1]. [Robert Pollack and Glenn Stevens, Overconvergent modular symbols and p-adic L-functions](https://www.numdam.org/item/10.24033/asens.2139.pdf), §8, the example of X₀(11) at p = 3, p. 35. The two p-stabilizations and their U_p-eigenvalues.

<a id="L2-refined-eigenline"></a>

#### The refined eigenline

**Target `L2/refined-eigenline` (lemma).** Let (f, α) be a refinement, K ⊇ K_f(α) a field, and λ the system of eigenvalues a_ℓ (ℓ ∤ Np) and α (for U_p). For each sign ±, L_{f,α}^± := Symb_{Γ₀}(V_k(K))^±[ε][λ] is one-dimensional over K; after ⊗ℂ it is spanned by (1 ± ι)ψ_{f_α} (with f_α := f when p | N). For p ∤ N it lies in the two-dimensional subspace where only the T_ℓ (ℓ ∤ Np) act by a_ℓ, on which U_p acts by the companion matrix of X² − a_pX + ε(p)p^{k+1}. For p | N, L_{f,α}^± is L1's line L_f^±, on which U_p acts by a_p.

**Hypotheses and boundaries.**

- Throughout, Γ₀ := Γ₁(N) ∩ Γ₀(p) when p ∤ N and Γ₀ := Γ₁(N) when p | N. Pollack–Stevens work with Γ₀ = Γ ∩ Γ₀(p) for Γ of level prime to p. Their proofs use only that Γ₀ ⊆ Σ₀(p) has finite index (for Corollary 2.10, here L0/symbols-generator-values) and that U_p = Σ_{a=0}^{p−1}|β(a, p) with β(a, p) = (1 a; 0 p). Both hold for Γ₁(N) with p | N (L0/hecke-operators-gamma1), which is the stage's case of p dividing the level.
- Forms-level input, requested from Tau Ceti ModularForms Layer 4: for p ∤ N, the subspace of S_{k+2}(Γ₁(N) ∩ Γ₀(p), ε) on which T_ℓ acts by a_ℓ(f) for all ℓ ∤ Np is spanned by f(z) and f(pz); for p | N, U_p f = a_p f.
- Eisenstein separation at level Np: no Eisenstein eigensystem of weight k + 2 and level dividing Np equals (a_ℓ(f))_{ℓ ∤ Np} (requested from Layer 5; L0/eigenspace-dimension requests the level-N form).

**Inputs.** [L2/refinement](#L2-refinement), [L2/p-stabilisation](#L2-p-stabilisation), [L1/period-lines](#L1-period-lines), [L0/eichler-shimura-isomorphism](#L0-eichler-shimura-isomorphism), [L0/symbols-mod-eisenstein](#L0-symbols-mod-eisenstein), [L0/symbols-base-change](#L0-symbols-base-change), [L0/period-symbol](#L0-period-symbol), [L0/plus-minus-decomposition](#L0-plus-minus-decomposition), [L0/nebentypus-symbols](#L0-nebentypus-symbols).

**Build plan.**

1. Over ℂ: by L0/eichler-shimura-isomorphism for Γ₀, L0/symbols-mod-eisenstein and the Eisenstein separation, the subspace of Symb_{Γ₀}(V_k(ℂ))^±[ε] where T_ℓ acts by a_ℓ (ℓ ∤ Np) is isomorphic, Hecke-equivariantly including U_p (L0/period-symbol: ψ_{U_p g} = ψ_g|U_p), to the corresponding subspace span(f(z), f(pz)) of S_{k+2}(Γ₀, ε).
2. By p-stabilisation, U_p acts on span(f(z), f(pz)) by a cyclic companion matrix, so the α-eigenspace is ℂf_α, and its image under the ±-part of Eichler–Shimura is ℂ(1 ± ι)ψ_{f_α}.
3. Rationality: λ is K-valued and Symb_{Γ₀}(V_k(K)) ⊗_K ℂ = Symb_{Γ₀}(V_k(ℂ)) (L0/symbols-base-change), so dim_K = dim_ℂ = 1.
4. p | N: L1/period-lines gives the line; U_p commutes with the T_ℓ, so it preserves the line, and it acts there by a_p because U_p f = a_p f and ψ is U_p-equivariant.

**Acceptance.**

- 11a1 at p = 3: Pollack–Stevens use the symbols φ^±_β at level 33 attached to f_β (§8).
- For p ∤ N the subspace cut out by the T_ℓ (ℓ ∤ Np) alone is two-dimensional: dropping U_p loses the line.
- If α = β the U_p-eigenspace is still a line, but the generalized eigenspace is two-dimensional, and slope decompositions see the generalized eigenspace.

**Sources.** [Robert Pollack and Glenn Stevens, Overconvergent modular symbols and p-adic L-functions](https://www.numdam.org/item/10.24033/asens.2139.pdf), §6.3, p. 28. The refined eigenline, for the U_p-eigenform f of level Γ₀.

<a id="L2-weight-k-distributions"></a>

#### Distribution modules with the weight-k action

**Target `L2/weight-k-distributions` (definition).** For r ∈ |ℂ_p^×|, let A[r] be the ℚ_p-Banach algebra of affinoid functions on B[ℤ_p, r] (the points within r of ℤ_p), A(ℤ_p) = lim_{s>0} A[s] and A†(ℤ_p, r) = lim_{s>r} A[s], with continuous duals D(ℤ_p), D[r] and D†(ℤ_p, r); write D = D[1] and D† = D†(ℤ_p, 1). For r < p, Σ₀(p) := {(a b; c d) ∈ M₂(ℤ_p) : p ∤ a, p | c, ad − bc ≠ 0} acts on A[r] by (γ ·_k f)(z) = (a + cz)^k f((b + dz)/(a + cz)), and on distributions on the right by (μ|_kγ)(f) = μ(γ ·_k f). The resulting modules are D_k(ℤ_p), D_k and D†_k. Moments: μ ↦ (μ(z^j))_j identifies D† with the sequences that are O(r^j) for every r > 1, and D, as a Banach space, with the bounded sequences. For r < p, γ ∈ Σ₀(p) with det γ = p^n and μ ∈ D[r], ‖μ|γ‖_{r/p^n} ≤ ‖μ‖_r.

**Hypotheses and boundaries.**

- The spaces A[r], D[r], D(ℤ_p) and their topologies are requested from LocallyAnalyticDistributions L0; the weight-k action and the moment description are built here.
- The restriction r < p is needed: for r ≥ p the formula does not preserve A[r] (sourceIssues E8). Every space the stage uses has r ≤ 1 or r slightly above 1.

**Inputs.** `LocallyAnalyticDistributions:L0`, [L0/hecke-monoid](#L0-hecke-monoid).

**Build plan.**

1. Proposition 3.1: |μ(z^j)| ≤ ‖z^j‖_r‖μ‖_r = r^j‖μ‖_r gives the growth; conversely, a sequence of that growth defines μ(Σ a_jz^j) := Σ a_jc_j on A†(ℤ_p, 1), since f ∈ A[r] for some r > 1. On D, ‖μ‖_1 = sup_j |μ(z^j)|.
2. Action and contraction: for r < p and z ∈ B[ℤ_p, r], |cz| < 1 when |z| ≤ max(1, r), so a + cz is a unit and (a + cz)^k has absolute value 1. For z₀ ∈ ℤ_p and |w| ≤ r, |γ(z₀ + w) − γz₀| = |det γ|·|w|/|(a + cz₀)(a + c(z₀ + w))| = p^{−n}|w|, and γz₀ ∈ ℤ_p. So γ maps B[ℤ_p, r] into B[ℤ_p, r/p^n], f ↦ γ ·_k f maps A[r/p^n] into A[r] with norm at most 1, and dualising gives the bound used in the proof of Lemma 6.2.

**API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `TauCeti.ModularSymbol.distWeight` | constructor | D_k(ℤ_p), D_k and D†_k with the right weight-k action of Σ₀(p). |
| `TauCeti.ModularSymbol.distMoments` | equivalence | D ≃ bounded sequences via μ ↦ (μ(z^j))_j, isometrically. |
| `TauCeti.ModularSymbol.distWeight_norm_le` | characterisation | ‖μ\|γ‖_{r/p^n} ≤ ‖μ‖_r for r < p and det γ = p^n. |

**Unit tests.**

- `dist_dirac_moments` (example): δ₀ has moments (1, 0, 0, …).
- `dist_mem_iff_bounded` (characterisation): An element of D† lies in D iff its moments are bounded.
- `dist_inv_succ_not_bounded` (non-example): c_j = 1/(j + 1) gives an element of D† that is not in D.

**Acceptance.**

- The Dirac distribution δ₀ has moments (1, 0, 0, …) and lies in D.
- c_j = 1/(j + 1) is O(r^j) for every r > 1 but unbounded (|1/p^m|_p = p^m), so it defines an element of D† not in D; such denominators are why Theorem 4.5 needs D† (Remark 4.6).
- c_j = p^{−j} is not O(r^j) for 1 < r < p, so it is the moment sequence of no element of D†.

**Sources.** [Robert Pollack and Glenn Stevens, Overconvergent modular symbols and p-adic L-functions](https://www.numdam.org/item/10.24033/asens.2139.pdf), §3.1–3.3 and Proposition 3.1, pp. 15–17. The weight-k action; the spaces and Proposition 3.1 precede it. [Robert Pollack and Glenn Stevens, Overconvergent modular symbols and p-adic L-functions](https://www.numdam.org/item/10.24033/asens.2139.pdf), §6.1, proof of Lemma 6.2, p. 27. The contraction ‖μ|γ‖_{r/p^n} ≤ ‖μ‖_r for det γ = p^n.

<a id="L2-specialisation-map"></a>

#### Specialisation to polynomial coefficients

**Target `L2/specialisation-map` (construction).** For D_k one of D_k(ℤ_p), D_k, D†_k, the map ρ_k : D_k → V_k(ℚ_p), μ ↦ ∫(Y − zX)^k dμ(z) (coefficientwise), is Σ₀(p)-equivariant for the weight-k action and L0's right action (P|γ)(X, Y) = P(dX − cY, −bX + aY). It induces the specialisation ρ*_k : Symb_{Γ₀}(D_k) → Symb_{Γ₀}(V_k), which commutes with the Hecke operators, including U_p, and with ι. Explicitly ρ_k(μ) = Σ_{j=0}^k C(k, j)(−1)^jμ(z^j)X^jY^{k−j}, so ker ρ_k = {μ : μ(z^j) = 0 for 0 ≤ j ≤ k} and the Y^k-coefficient of ρ_k(μ) is the total mass μ(1).

**Hypotheses and boundaries.**

- V_k and its action are L0/polynomial-coefficients; the Hecke operators on Symb_{Γ₀}(V) for a Σ₀(p)-module V are L0/hecke-operators-gamma1.

**Inputs.** [L2/weight-k-distributions](#L2-weight-k-distributions), [L0/polynomial-coefficients](#L0-polynomial-coefficients), [L0/modular-symbols](#L0-modular-symbols), [L0/hecke-operators-gamma1](#L0-hecke-operators-gamma1), [L0/involution-at-infinity](#L0-involution-at-infinity).

**Build plan.**

1. Equivariance: ρ_k(μ|γ) = μ((a + cz)^k(Y − ((b + dz)/(a + cz))X)^k) = μ(((aY − bX) − z(dX − cY))^k), which is ρ_k(μ) evaluated at (X, Y) ↦ (dX − cY, −bX + aY), that is ρ_k(μ)|γ.
2. Expanding (Y − zX)^k binomially gives the coefficient formula, hence the kernel and the total-mass coefficient.
3. Hecke equivariance of ρ*_k follows from Σ₀(p)-equivariance of ρ_k, since the Hecke operators are sums of |δ with δ ∈ Σ₀(p).

**API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `TauCeti.ModularSymbol.specialise` | constructor | ρ_k : D_k → V_k, μ ↦ ∫(Y − zX)^k dμ. |
| `TauCeti.ModularSymbol.specialise_smul` | compatibility | ρ_k(μ\|γ) = ρ_k(μ)\|γ for γ ∈ Σ₀(p). |
| `TauCeti.ModularSymbol.specialiseSymb` | constructor | ρ*_k : Symb_{Γ₀}(D_k) → Symb_{Γ₀}(V_k), Hecke-equivariant. |
| `TauCeti.ModularSymbol.specialise_eq_zero_iff` | characterisation | ρ_k(μ) = 0 iff μ(z^j) = 0 for all j ≤ k. |

**Unit tests.**

- `specialise_zero_weight` (example): k = 0: ρ_0(μ) = μ(1).
- `specialise_dirac` (characterisation): ρ_k(δ₀) = Y^k.
- `specialise_not_injective` (non-example): A nonzero distribution supported in degree k + 1 specialises to 0.

**Acceptance.**

- k = 0: ρ_0(μ) = μ(1), the total mass.
- ρ_k(δ₀) = Y^k.
- The distribution with moments ν_{k+1} (1 at z^{k+1}, 0 elsewhere) is nonzero and lies in ker ρ_k: specialisation forgets the moments above k.

**Sources.** [Robert Pollack and Glenn Stevens, Overconvergent modular symbols and p-adic L-functions](https://www.numdam.org/item/10.24033/asens.2139.pdf), §3.4, p. 17. The map ρ_k. [Robert Pollack and Glenn Stevens, Overconvergent modular symbols and p-adic L-functions](https://www.numdam.org/item/10.24033/asens.2139.pdf), §5, opening, p. 20. Hecke equivariance of ρ*_k.

<a id="L2-overconvergent-lift"></a>

#### Lifting classical symbols to overconvergent ones

**Target `L2/overconvergent-lift` (theorem).** ρ*_k : Symb_{Γ₀}(D†_k) → Symb_{Γ₀}(V_k) is surjective, by an explicit lift of the values on the generators. For μ ∈ D†_k, μ|β(a, p) ∈ D_k, so U_p maps Symb_{Γ₀}(D†_k) into Symb_{Γ₀}(D_k). Hence ρ*_k : Symb_{Γ₀}(D_k) → Symb_{Γ₀}(V_k) is surjective.

**Hypotheses and boundaries.**

- Throughout, Γ₀ := Γ₁(N) ∩ Γ₀(p) when p ∤ N and Γ₀ := Γ₁(N) when p | N. Pollack–Stevens work with Γ₀ = Γ ∩ Γ₀(p) for Γ of level prime to p. Their proofs use only that Γ₀ ⊆ Σ₀(p) has finite index (for Corollary 2.10, here L0/symbols-generator-values) and that U_p = Σ_{a=0}^{p−1}|β(a, p) with β(a, p) = (1 a; 0 p). Both hold for Γ₁(N) with p | N (L0/hecke-operators-gamma1), which is the stage's case of p dividing the level.
- The generator-and-relation description is L0/symbols-generator-values, with the D_∞ relation of sourceIssues E1. Pollack–Stevens' proof of Theorem 5.1 uses the printed relation (µ∞|Δ = ν∞); it works verbatim with ν∞ replaced by −ν∞.

**Inputs.** [L2/specialisation-map](#L2-specialisation-map), [L0/symbols-generator-values](#L0-symbols-generator-values).

**Build plan.**

1. Difference equation (Theorem 4.5): for ν ∈ D†_k of total measure zero, μ := Σ_{j≥1} ν(z^j)/j · η_{j−1}, with η_j(z^r) = C(r, j)b_{r−j} (Bernoulli numbers, Lemma 4.4), is the unique solution of μ|Δ = ν, Δ = (1 1; 0 1) − 1. By von Staudt–Clausen and Proposition 3.1 it lies in D†_k. Uniqueness is Lemma 4.3.
2. Theorem 5.1: lift φ(D_i) arbitrarily, lift φ(D′_i) and φ(D″_i) through the idempotents of Proposition 4.1 (2 and 3 are invertible on the ℚ_p-space D†_k), and solve for the value at D_∞ with the difference equation. Its right side has total measure zero because the Y^k-coefficient of every element of Δ(V_k) vanishes (Proposition 4.2). The resulting value can miss φ(D_∞) by cX^k (ker Δ on V_k is ℚ_pX^k); adjusting the lifts of the φ(D_i) corrects the k-th moment.
3. Lemma 5.3: (μ|β(a, p))(z^j) = Σ_r C(j, r)a^{j−r}p^rμ(z^r), and (p^rμ(z^r))_r is bounded by Proposition 3.1.
4. Corollary 5.4: it suffices to lift φ in a generalized U_p-eigenspace with eigenvalue λ ≠ 0. Write φ = φ′|U_p, lift φ′ to Ψ′ over D†_k, and take Ψ′|U_p.

**Acceptance.**

- k = 0, Γ₀(11) (Pollack's §2.6 generators): the lift is explicit on three divisors.
- Without the correction step the D_∞-value can be off by cX^k; Remark 5.2 notes that for a non-Eisenstein eigensymbol, applying T_ℓ − (ℓ^{k+1} + 1) removes the error instead.
- Theorem 4.5 fails in D_k: the solution can have unbounded moments (Remark 4.6).

**Sources.** [Robert Pollack and Glenn Stevens, Overconvergent modular symbols and p-adic L-functions](https://www.numdam.org/item/10.24033/asens.2139.pdf), §4.2 Theorem 4.5, p. 20; §5.1 Theorem 5.1, Lemma 5.3 and Corollary 5.4, pp. 21–22. Theorem 5.1 (printed label T5.1 in the text layer).

<a id="L2-slope-decomposition-fibre"></a>

#### Slope decomposition of the fibre of specialisation

**Target `L2/slope-decomposition-fibre` (lemma).** Let ϕ ∈ Symb_{Γ₀}(V_k) ⊗ K be a Hecke eigensymbol, K/ℚ_p finite, with U_p-eigenvalue λ of slope h, and X_ϕ := (ρ*_k)^{−1}(K·ϕ) ⊆ Symb_{Γ₀}(D_k) ⊗ K. Then X_ϕ = X_ϕ^{(=h)} ⊕ X_ϕ^{(>h)} uniquely, with u := λ^{−1}U_p topologically nilpotent on X_ϕ^{(>h)}, invertible on X_ϕ^{(=h)} with (u^{−n}) bounded, X_ϕ^{(=h)} finite-dimensional over K, and projection x ↦ lim_n u^{n!}x.

**Hypotheses and boundaries.**

- The general statement (Pollack–Stevens Lemma 5.5 and Proposition 5.6: a completely continuous operator preserving a bounded lattice splits the space into a finite-dimensional part where it is invertible and a topologically nilpotent part) is a special case of the Riesz theory of LocallyAnalyticDistributions L4 (finite-slope-summands, riesz-root-projectors); either route may be formalised.
- Complete continuity of U_p on Symb_{Γ₀}(D_k): each |β(a, p) maps D[1] into D[1/p] (weight-k-distributions), and the natural map D[1/p] → D[1] is dual to the completely continuous restriction A[1] → A[1/p] (Pollack–Stevens §3.1).

**Inputs.** [L2/overconvergent-lift](#L2-overconvergent-lift), [L2/specialisation-map](#L2-specialisation-map), `LocallyAnalyticDistributions:L4/finite-slope-summands`, `LocallyAnalyticDistributions:L4/completely-continuous`.

**Build plan.**

1. Lattice: Y_ϕ := {Φ in the unit ball of X_ϕ : |Φ(D)(z^j)| ≤ p^{−(h−j)} for 0 ≤ j ≤ ⌊h⌋ and all D ∈ Δ₀}.
2. u preserves Y_ϕ: (Φ|u)(D)(z^r) = λ^{−1}Σ_a Σ_j C(r, j)a^{r−j}p^jΦ(D_a)(z^j) with D_a = β(a, p)D, and each |p^jΦ(D_a)(z^j)| ≤ p^{−h} (by the defining bound for j ≤ ⌊h⌋ and because j > h otherwise), so |(Φ|u)(D)(z^r)| ≤ 1. Membership in Y_ϕ depends only on ρ*_k(Φ), and ρ*_k(Φ|u) = ρ*_k(Φ).
3. The unit ball itself need not be u-stable (Pollack–Stevens' footnote (3)), which is why Y_ϕ is used.
4. Apply the lattice decomposition (Proposition 5.6) to u on X_ϕ.

**Acceptance.**

- h = 0: Y_ϕ is the whole unit ball, and the projector is Hida's ordinary projector lim U_p^{n!} up to the unit λ.
- X_ϕ is infinite-dimensional (it contains ker ρ*_k), while X_ϕ^{(=h)} is finite-dimensional.
- For h > 0 the unit ball of X_ϕ need not be preserved by u.

**Sources.** [Robert Pollack and Glenn Stevens, Overconvergent modular symbols and p-adic L-functions](https://www.numdam.org/item/10.24033/asens.2139.pdf), §5.2–5.3, Lemma 5.5 and Propositions 5.6–5.7, pp. 23–25. Proposition 5.7.

<a id="L2-control-theorem"></a>

#### Stevens' control theorem in small slope

**Target `L2/control-theorem` (theorem).** Specialisation induces isomorphisms Symb_{Γ₀}(D_k(ℤ_p))^{(<k+1)} ≅ Symb_{Γ₀}(D_k)^{(<k+1)} ≅ Symb_{Γ₀}(V_k)^{(<k+1)} of the subspaces on which U_p acts with slope < k + 1, compatible with the Hecke operators and ι. In particular, for a refinement (f, α) of slope h < k + 1 and each basis φ^± of the refined eigenline, there is a unique Φ^± ∈ Symb_{Γ₀}(D_k(ℤ_p))^± with ρ*_k(Φ^±) = φ^±, and Φ^± is a Hecke eigensymbol with the eigenvalues of f_α.

**Hypotheses and boundaries.**

- Throughout, Γ₀ := Γ₁(N) ∩ Γ₀(p) when p ∤ N and Γ₀ := Γ₁(N) when p | N. Pollack–Stevens work with Γ₀ = Γ ∩ Γ₀(p) for Γ of level prime to p. Their proofs use only that Γ₀ ⊆ Σ₀(p) has finite index (for Corollary 2.10, here L0/symbols-generator-values) and that U_p = Σ_{a=0}^{p−1}|β(a, p) with β(a, p) = (1 a; 0 p). Both hold for Γ₁(N) with p | N (L0/hecke-operators-gamma1), which is the stage's case of p dividing the level.
- Pollack–Stevens cite the first isomorphism (independence of the radius on the finite-slope part) to their critical-slope preprint [16, Lemma 5.2], which was not read. Here it is derived from the contraction of weight-k-distributions. For Φ in the finite-slope part of Symb_{Γ₀}(D_k) (finite-dimensional by the Riesz theory), Φ = (Φ|U_p^{−n})|U_p^n with Φ|U_p^{−n} in the same space, and |U_p^n = Σ_{a mod p^n}|β(a, p^n) maps D[1]-valued symbols to D[1/p^n]-valued ones. So Φ takes values in every D[1/p^n], hence in D(ℤ_p) = lim_s D[s] (the maps D[s] → D[1] are injective).

**Inputs.** [L2/overconvergent-lift](#L2-overconvergent-lift), [L2/slope-decomposition-fibre](#L2-slope-decomposition-fibre), [L2/weight-k-distributions](#L2-weight-k-distributions), [L2/refinement](#L2-refinement), [L2/refined-eigenline](#L2-refined-eigenline).

**Build plan.**

1. Injectivity on slope < k + 1: for Φ ∈ ker ρ*_k, (Φ|U_p)(D)(z^r) = Σ_a Σ_j C(r, j)a^{r−j}p^jΦ(D_a)(z^j), and the terms with j ≤ k vanish, so U_p is divisible by p^{k+1} on ker ρ*_k: its slopes there are ≥ k + 1.
2. Surjectivity (Theorem 5.9 with Lemma 5.10): for an eigensymbol ϕ of slope h, ρ*_k maps X_ϕ^{(=h)} onto K·ϕ (overconvergent-lift, slope-decomposition-fibre; ρ*_k kills X_ϕ^{(>h)}). When h < k + 1 this map is also injective, so the eigensymbol it produces lifts a nonzero multiple of ϕ.
3. An isomorphism after extending scalars to ℚ̄_p is one before.
4. Uniqueness of Φ^± and its eigen-property follow from the Hecke-equivariant isomorphism and the one-dimensionality of the refined eigenline.

**Acceptance.**

- h = 0: Hida's ordinary control theorem for Γ₀.
- At h = k + 1 specialisation can fail to be an isomorphism on the f-part: by Theorem 5.14 it fails exactly for f in the image of θ_k, which includes the critical-slope stabilisation of a p-ordinary CM form (Remark 5.15). That is stage L3.
- The threshold is strict: slope k + 1 = w − 1 is excluded.

**Sources.** [Robert Pollack and Glenn Stevens, Overconvergent modular symbols and p-adic L-functions](https://www.numdam.org/item/10.24033/asens.2139.pdf), §5.3–5.4, Theorem 5.9, Lemma 5.10, Theorem 5.12 and its proof, pp. 25–26. Theorem 5.12.

<a id="L2-eigensymbol-admissibility"></a>

#### Values of slope-h eigensymbols are h-admissible

**Target `L2/eigensymbol-admissibility` (lemma).** If Φ ∈ Symb_{Γ₀}(D(ℤ_p)) is a U_p-eigensymbol whose eigenvalue λ has slope h, then every value Φ(D) is h-admissible: ‖Φ(D)‖_r = O(r^{−h}) as r → 0⁺.

**Hypotheses and boundaries.**

- h-admissibility (Pollack–Stevens Definition 6.1) and its theory are requested from LocallyAnalyticDistributions L2.

**Inputs.** [L2/weight-k-distributions](#L2-weight-k-distributions), `LocallyAnalyticDistributions:L2`.

**Build plan.**

1. For 0 < r ≤ 1, n ≥ 1 and D ∈ Δ₀: ‖Φ(D)‖_{r/p^n} = |λ|^{−n}‖(Φ|U_p^n)(D)‖_{r/p^n} ≤ |λ|^{−n} max_a ‖Φ(β(a, p^n)D)|β(a, p^n)‖_{r/p^n} ≤ |λ|^{−n} max_a ‖Φ(β(a, p^n)D)‖_r ≤ |λ|^{−n}‖Φ‖_r, by the contraction of weight-k-distributions.
2. |λ|^{−n} = p^{nh} = (r/(r/p^n))^h, so ‖Φ(D)‖_s ≤ (r^h‖Φ‖_r)·s^{−h} for s = r/p^n, which is O(s^{−h}).

**Acceptance.**

- h = 0: the values are bounded, that is, measures.
- λ = 0 is not covered (infinite slope).
- At h = k + 1, h-admissibility no longer determines a distribution from its values on locally polynomial functions of degree ≤ k (Pollack–Stevens §6.4; stage L3).

**Sources.** [Robert Pollack and Glenn Stevens, Overconvergent modular symbols and p-adic L-functions](https://www.numdam.org/item/10.24033/asens.2139.pdf), §6.1, Definition 6.1 and Lemma 6.2, p. 27. Lemma 6.2.

<a id="L2-p-adic-l-function"></a>

#### The p-adic L-function of a small-slope refinement

**Target `L2/p-adic-l-function` (construction).** Let (f, α) be a refinement of slope h < k + 1, φ^± bases of the refined eigenlines, Φ^± their eigenlifts (control-theorem) and Φ := Φ⁺ + Φ⁻. Define L_p(f, α; φ^±) := Φ({∞} − {0})|_{ℤ_p^×} ∈ D(ℤ_p^×). It is h-admissible, and for every locally analytic g, Φ({∞} − {0})(g·1_{a+p^nℤ_p}) = α^{−n}Φ({∞} − {a/p^n})(g(a + p^nz)) (the distribution relation). Write the bases as Pollack–Stevens do, φ^±({r} − {s}) = (∫_r^s f_α(z)(zX + Y)^k dz ± (−1)^k∫_{−r}^{−s} f_α(z)(zX − Y)^k dz)·πi/Ω^±, which defines Ω^± ∈ ℂ^× from φ^±. Then for p ∤ a and 0 ≤ j ≤ k the ±-part of L_p(z^j·1_{a+p^nℤ_p}) is α^{−n}(∫_∞^{a/p^n}(−p^nz + a)^j f_α(z)dz ± ∫_∞^{−a/p^n}(p^nz + a)^j f_α(z)dz)·πi/Ω^±, which is Pollack–Stevens (2).

**Hypotheses and boundaries.**

- The construction depends on the refinement α and on the bases φ^±; rescaling φ^± by c^± ∈ K^× rescales the ±-parts of L_p by c^±.
- In L0's normalization ψ_f({s} − {r}) = 2πi∫_r^s f(z)(zX + Y)^k dz, with ι acting on V_k by P(X, Y) ↦ P(X, −Y), the displayed φ^± is −(1 ± (−1)^kι)ψ_{f_α}/(2Ω^±). So Pollack–Stevens' label ± is the ι-sign times (−1)^k, and Ω^± = −½Ω_{f_α}^{±(−1)^k}(φ^±) in the notation of L1/period-lines.
- Orientation: the divisor is {∞} − {0}; the choice {0} − {∞} changes L_p by −1.

**Inputs.** [L2/control-theorem](#L2-control-theorem), [L2/eigensymbol-admissibility](#L2-eigensymbol-admissibility), [L2/refined-eigenline](#L2-refined-eigenline), [L2/specialisation-map](#L2-specialisation-map), [L0/period-symbol](#L0-period-symbol), [L0/involution-at-infinity](#L0-involution-at-infinity).

**Build plan.**

1. Distribution relation (proof of Proposition 6.3): Φ({∞} − {0}) = α^{−n}(Φ|U_p^n)({∞} − {0}) = α^{−n}Σ_{a mod p^n}Φ({∞} − {a/p^n})|β(a, p^n), and μ|β(a, p^n) is supported on a + p^nℤ_p, where (μ|β(a, p^n))(g) = μ(g(a + p^nz)).
2. For deg Q ≤ k, Φ^±({∞} − {a/p^n})(Q) is read off from ρ*_k(Φ^±) = φ^± through ρ_k; with Q(z) = (p^nz + a)^j this gives (2).
3. h-admissibility is eigensymbol-admissibility applied to D = {∞} − {0}.
4. The relation with ψ: the first integral is ψ_{f_α}({s} − {r})/(2Ω^±) = −ψ_{f_α}({r} − {s})/(2Ω^±), and (ψ|ι)({r} − {s}) = ψ({−r} − {−s})|ι = −2πi∫_{−r}^{−s} f_α(z)(zX − Y)^k dz.

**API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `TauCeti.ModularSymbol.padicLFunction` | constructor | L_p(f, α; φ^±) = Φ({∞} − {0})\|_{ℤ_p^×} ∈ D(ℤ_p^×). |
| `TauCeti.ModularSymbol.padicLFunction_admissible` | characterisation | L_p(f, α; φ^±) is h-admissible. |
| `TauCeti.ModularSymbol.padicLFunction_distrib` | characterisation | The distribution relation on a + p^nℤ_p. |
| `TauCeti.ModularSymbol.padicLFunction_smul` | compatibility | Rescaling φ^± rescales the ±-parts. |

**Unit tests.**

- `padicLFunction_weight_two` (example): k = 0: the value on a + p^nℤ_p is α^{−n}φ({∞} − {a/p^n}).
- `padicLFunction_smul_plus` (characterisation): φ^+ ↦ cφ^+ multiplies the +-part by c.
- `padicLFunction_orientation` (non-example): Using {0} − {∞} gives −L_p.

**Acceptance.**

- k = 0: L_p(1_{a+p^nℤ_p}) = α^{−n}φ({∞} − {a/p^n}) for p ∤ a, the Riemann sums of the modular symbol of f_α.
- Replacing φ^+ by 2φ^+ doubles the +-part only.
- The divisor {0} − {∞} gives −L_p: the orientation is part of the definition.

**Sources.** [Robert Pollack and Glenn Stevens, Overconvergent modular symbols and p-adic L-functions](https://www.numdam.org/item/10.24033/asens.2139.pdf), §6.3, Proposition 6.3 and its proof, pp. 28–29. Proposition 6.3: Φ_f({∞} − {0})|_{ℤ_p^×} = μ_f (the restriction bar is lost in the text layer). [Robert Pollack and Glenn Stevens, Overconvergent modular symbols and p-adic L-functions](https://www.numdam.org/item/10.24033/asens.2139.pdf), §6.2, (2), p. 27. Formula (2), read on the page image.

<a id="L2-interpolation-and-uniqueness"></a>

#### Interpolation and uniqueness of the p-adic L-function

**Target `L2/interpolation-and-uniqueness` (theorem).** Let (f, α) have slope h < k + 1, with φ^± and Ω^± as in p-adic-l-function, 0 ≤ j ≤ k, and χ a character of ℤ_p^× of conductor p^n. With ± := (−1)^jχ(−1), L_p(f, α; φ^±)(z^j·χ) = e·α^{−n}p^{nj}·τ(χ)·j!/(2πi)^j·L(f_α, χ^{−1}, j + 1)/Ω^±, where e = 1 if n ≥ 1 and e = 1 − p^j/α if n = 0 (χ trivial). For p ∤ N and n = 0, L(f_α, j + 1) = (1 − ε(p)p^{k−j}/α)L(f, j + 1) supplies the second Euler factor. In L1's notation I_j(x) = 2πi∫_{i∞}^x f_α(z)(z − x)^j dz, the right side for n ≥ 1 is ±α^{−n}p^{nj}Σ_{a mod p^n}χ(a)I_j(−a/p^n)/Ω^±. This is RJW Theorem B.1 with Ω_{B.1}^± = −Ω^±/(2πi), a j-independent conversion. Moreover, L_p(f, α; φ^±) is the unique h-admissible distribution on ℤ_p^× with these values, because h < k + 1.

**Hypotheses and boundaries.**

- Pollack–Stevens (1) prints the formula as α^{−n}p^{n(j+1)}/(−2πi)^j·j!/τ(χ^{−1})·L(f, χ^{−1}, j+1)/Ω^±. It agrees with (2), and hence with Proposition 6.3, only up to the sign ± (sourceIssues E4), and it omits e at n = 0 (sourceIssues E5). The statement here is the one (2) implies.
- Uniqueness of an h-admissible distribution from its values on locally polynomial functions of degree ≤ k when h < k + 1 (Amice–Vélu, Višik) is requested from LocallyAnalyticDistributions L2. At h = k + 1 it fails (stage L3).

**Inputs.** [L2/p-adic-l-function](#L2-p-adic-l-function), [L1/twisted-mellin-formula](#L1-twisted-mellin-formula), [L1/rjw-b1-comparison](#L1-rjw-b1-comparison), [L1/p-stabilised-euler-factors](#L1-p-stabilised-euler-factors), `LocallyAnalyticDistributions:L2`, `mathlib:PadicInt.toZModPow`.

**Build plan.**

1. Case n ≥ 1: sum (2) against χ(a) over a mod p^n with p ∤ a. With (−p^nz + a)^j = (−p^n)^j(z − a/p^n)^j and (p^nz + a)^j = p^{nj}(z + a/p^n)^j, the ±-part is α^{−n}p^{nj}[(−1)^jS ± Σ_aχ(a)I_j(−a/p^n)]/(2Ω^±), where S := Σ_aχ(a)I_j(a/p^n). Substituting a ↦ −a gives Σ_aχ(a)I_j(−a/p^n) = χ(−1)S, so the ±-part vanishes unless ± = (−1)^jχ(−1), and then equals α^{−n}p^{nj}(−1)^jS/Ω^±.
2. L1/twisted-mellin-formula: S = τ(χ)·j!/(−2πi)^j·L(f_α, χ̄, j + 1), which gives the formula with e = 1.
3. Case n = 0: L_p(z^j) = Φ({∞} − {0})(z^j) − Φ({∞} − {0})(z^j·1_{pℤ_p}), and by the distribution relation with a = 0, n = 1 the second term is α^{−1}p^jΦ({∞} − {0})(z^j). So L_p(z^j) = (1 − p^j/α)·Φ({∞} − {0})(z^j), and the case a = 0, n = 0 of the computation above evaluates Φ({∞} − {0})(z^j). L1/p-stabilised-euler-factors converts L(f_α, j + 1).
4. RJW comparison: L1/rjw-b1-comparison writes B.1's right side as −ε(−1)^k/(2πi·Ω_{B.1})·α^{−n}p^{nj}Σ_aχ(a)I_j(−a/p^n) with ε = (−1)^{k−j}χ(−1), so ε(−1)^k = (−1)^jχ(−1) = ±. Comparing with the formula above gives Ω_{B.1}^± = −Ω^±/(2πi).
5. Uniqueness: two h-admissible distributions with h < k + 1 that agree on locally polynomial functions of degree ≤ k are equal (LAD L2). The values on z^j·1_{a+p^nℤ_p}, given by (2), determine L_p on such functions.

**Acceptance.**

- k = 0, n = 0, p ∤ N, trivial ε: L_p(1) = (1 − 1/α)²·L(f, 1)/Ω^+, the Mazur–Tate–Teitelbaum shape.
- For quadratic χ, and on the +-part, (1) as printed and (2) agree; only the −-part carries the sign of E4.
- Replacing L(f_α, χ^{−1}, j + 1) by L(f_α, χ, j + 1) is wrong for non-real χ (L1's numerical check of the twisted Mellin formula).

**Sources.** [Robert Pollack and Glenn Stevens, Overconvergent modular symbols and p-adic L-functions](https://www.numdam.org/item/10.24033/asens.2139.pdf), §6.2, (1) and (2), p. 27. Interpolation and uniqueness; (1) and (2) read on the page image.

<a id="L2-ordinary-integral-measure"></a>

#### Ordinary p-adic L-functions as integral measures

**Target `L2/ordinary-integral-measure` (theorem).** Let (f, α) have slope 0, 𝒪 the integers of a finite extension K of ℚ_p containing K_f(α), and φ^± generators of the saturated lattices L_{f,α}^±(𝒪) := L_{f,α}^± ∩ Symb_{Γ₀}(V_k(𝒪)). Then L_p(f, α; φ^±) is a measure with values in 𝒪: for p ∤ a, L_p(1_{a+p^nℤ_p}) = α^{−n}·[Y^k](φ({∞} − {a/p^n})) ∈ 𝒪, where φ := φ⁺ + φ⁻ and [Y^k] is the Y^k-coefficient. So L_p ∈ 𝒪⟦ℤ_p^×⟧. Boundedness alone, that is h = 0 with arbitrary bases φ^±, gives only an element of 𝒪⟦ℤ_p^×⟧[1/p].

**Hypotheses and boundaries.**

- The saturated lattice of a line and its generator, unique up to 𝒪^×, are L1/integral-period-lattices. Its proof uses only that the line lies in Symb_{Γ₀}(V_k(K)) for a finite-index Γ₀, so it applies to the refined eigenline.
- The identification of 0-admissible distributions with bounded measures, K ⊗ 𝒪⟦ℤ_p^×⟧, is requested from LocallyAnalyticDistributions L2 (order zero).

**Inputs.** [L2/p-adic-l-function](#L2-p-adic-l-function), [L2/specialisation-map](#L2-specialisation-map), [L2/eigensymbol-admissibility](#L2-eigensymbol-admissibility), [L1/integral-period-lattices](#L1-integral-period-lattices), `LocallyAnalyticDistributions:L2`.

**Build plan.**

1. Distribution relation with g = 1: L_p(1_{a+p^nℤ_p}) = α^{−n}Φ({∞} − {a/p^n})(1), and Φ(D)(1) is the Y^k-coefficient of ρ_k(Φ(D)) = φ(D) (specialisation-map), with no binomial denominator.
2. α ∈ 𝒪^× and φ(D) ∈ V_k(𝒪), so every value on a compact open is in 𝒪. By eigensymbol-admissibility L_p is 0-admissible, hence a bounded measure, and it is determined by its values on compact opens, so it lies in 𝒪⟦ℤ_p^×⟧.
3. For bases p^{−m}·(integral generator) the values lie in p^{−m}𝒪.

**Acceptance.**

- 11a1 at p = 3 with the unit root α ∈ ℤ_3^× of X² + X + 3 (≡ −1 mod 3 by Hensel): L_p ∈ ℤ_3⟦ℤ_3^×⟧ for the integral generators φ^±.
- p^{−1}φ^± in place of φ^± gives a bounded measure in p^{−1}𝒪⟦ℤ_p^×⟧, in general not in 𝒪⟦ℤ_p^×⟧.
- For the moments μ(z^j) with 1 ≤ j ≤ k no integrality follows from φ ∈ V_k(𝒪) alone: ρ_k involves the binomials C(k, j), which can be divisible by p when p ≤ k.

**Sources.** [Robert Pollack and Glenn Stevens, Overconvergent modular symbols and p-adic L-functions](https://www.numdam.org/item/10.24033/asens.2139.pdf), §6.3, p. 28. The integral normalisation of φ^±.

**Planets:** p-stabilisation, Stevens' control theorem, p-adic L-function of a refinement, Interpolation and uniqueness, Integral ordinary p-adic L-function.

### L3: Critical slope

<a id="L3-non-theta-critical-lift"></a>

#### The critical-slope p-adic L-function of a non-θ-critical refinement

**Target `L3/non-theta-critical-lift` (construction).** Let (f, α) be a refinement of critical slope h = k + 1 (ModularSymbolsPadicLFunctions L2 refinement) that is not θ-critical (equivalently non-critical, by PadicFamilies L3). Then each refined eigenline φ^± has a unique overconvergent eigen-lift Φ^± ∈ Symb_Γ(D_k)^± with ρ*_k(Φ^±) = φ^±, and L_p(f, α; φ^±) := Φ({∞} − {0})|_{ℤ_p^×} with Φ = Φ⁺ + Φ⁻. It is (k + 1)-admissible, satisfies the distribution relation of L2, and its ±-parts are Bellaïche's L±(f_α, ·) with the scalars fixed by ρ*_k(Φ^±) = φ^± (so the periods Ω^± are those of L2).

**Hypotheses and boundaries.**

- Critical slope and not θ-critical; the uniqueness of the lift is Pollack–Stevens' Theorem 5.14 / Bellaïche's Theorem 1 with e = 1 (PadicFamilies L3).

**Inputs.** [L2/refinement](#L2-refinement), [L2/p-adic-l-function](#L2-p-adic-l-function), `PadicFamilies:L3/critical-eigenspace-dimension`, `PadicFamilies:L3/critical-p-adic-l-function`, `PadicFamilies:L3/refinement-criticality`.

**Build plan.**

1. By PadicFamilies L3 (e = 1), ρ*_k restricts to an isomorphism of the f_α-eigenspaces, so the lifts exist and are unique; evaluate at {∞} − {0} as in L2.
2. Admissibility of order k + 1: the U_p-eigenvalue has valuation k + 1 (Višik's criterion).

**API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `TauCeti.ModularSymbol.criticalSlopePadicL` | constructor | L_p(f, α; φ^±) for critical-slope non-θ-critical (f, α). |
| `TauCeti.ModularSymbol.criticalSlopePadicL_lift_unique` | characterisation | Φ^± is the unique eigen-lift of φ^±. |
| `TauCeti.ModularSymbol.criticalSlopePadicL_admissible` | characterisation | (k + 1)-admissible. |
| `TauCeti.ModularSymbol.criticalSlopePadicL_eq_bellaiche` | compatibility | For each fixed sign, the Bellaïche eigenvector with the same full Hecke eigensystem and the same nonzero specialization yields the same normalized distribution. Summing the two signs gives the combined L-function. |

**Unit tests.**

- `criticalSlopePadicL_11_3` (example): For the level-11 slope-one refinement at p=3 and an explicit unique full-eigenlift certificate, criticalLift specializes to the chosen nonzero signed classical basis. Pollack–Stevens Example 8.6 supplies a computational target; the signature assumes the certificate.
- `criticalSlopePadicL_11_5` (example): For the level-11 slope-one refinement at p=5 and an explicit unique full-eigenlift certificate, criticalLift specializes to the chosen signed basis. This checks normalization without turning the numerical observation of Example 8.7 into a proved certificate.
- `criticalSlopePadicL_CM_excluded` (example): For a nonzero signed classical basis of the level-32 CM form at p=5, the supplier theorem that every full eigenvector specializes to zero excludes an eigenlift. The suggested test has the explicit kernel condition as input.

**Acceptance.**

- The normalisation is by specialisation, not by values: at critical slope values do not determine the distribution.

**Sources.** [Robert Pollack and Glenn Stevens, Overconvergent modular symbols and p-adic L-functions](https://www.numdam.org/item/10.24033/asens.2139.pdf), §6.4, Definition 6.4, p. 29 (Numdam PDF page 30; printed page = PDF page − 1). Pollack–Stevens' definition (with the weight misprint recorded as E7). [Joël Bellaïche, Critical p-adic L-functions](https://arxiv.org/pdf/0912.2925v1), §1.4.2, p. 7 (arXiv v1; printed page = PDF page). The agreement with Bellaïche's L±.

<a id="L3-critical-slope-interpolation"></a>

#### Interpolation at critical slope

**Target `L3/critical-slope-interpolation` (theorem).** For (f, α) as in non-theta-critical-lift, 0 ≤ j ≤ k and χ of conductor p^n, L_p(f, α; φ^±)(z^j·χ) is given by the formula of L2's interpolation-and-uniqueness (with ± = (−1)^jχ(−1), the factor α^{−n}p^{nj}τ(χ)j!/(2πi)^j, the Euler factor 1 − p^j/α when n = 0, and L(f_α, χ^{−1}, j + 1)/Ω^±).

**Hypotheses and boundaries.**

- The formula is a formal consequence of Φ being a U_p-eigensymbol lifting φ⁺ + φ⁻; Pollack–Stevens (3) prints the L-value at 1 (recorded as E6).

**Inputs.** [L3/non-theta-critical-lift](#L3-non-theta-critical-lift), [L2/interpolation-and-uniqueness](#L2-interpolation-and-uniqueness).

**Build plan.**

1. Evaluate Φ({∞} − {0}) on z^j·1_{a+p^nℤ_p} with the distribution relation and ρ*_k(Φ) = φ⁺ + φ⁻, then use the twisted Mellin formula of L1, exactly as in L2.

**Acceptance.**

- Only the values are proved here; uniqueness fails (critical-slope-non-uniqueness).

**Sources.** [Robert Pollack and Glenn Stevens, Overconvergent modular symbols and p-adic L-functions](https://www.numdam.org/item/10.24033/asens.2139.pdf), §6.4, Proposition 6.5, p. 29 (Numdam PDF page 30; printed page = PDF page − 1). Proposition 6.5.

<a id="L3-critical-slope-non-uniqueness"></a>

#### Interpolation does not determine critical-slope L-functions

**Target `L3/critical-slope-non-uniqueness` (lemma).** At h = k + 1 there are nonzero (k + 1)-admissible distributions on ℤ_p^× vanishing at every z^j·χ (0 ≤ j ≤ k, χ of finite order): for each tame character ψ, the distribution whose Mellin transform in the variable s is log^{[k]}(s) = ∏_{i=0}^{k} log_p(γ^{−i}s). Hence the interpolation values do not determine L_p(f, α; φ^±); its uniqueness is the uniqueness of the eigen-lift, not of an admissible distribution.

**Hypotheses and boundaries.**

- Amice–Vélu–Višik uniqueness holds only for h < k + 1 (LocallyAnalyticDistributions L2).

**Inputs.** [L2/interpolation-and-uniqueness](#L2-interpolation-and-uniqueness), `LocallyAnalyticDistributions:L2/amice-velu-vishik`, `PadicFamilies:L3/theta-critical-vanishing`.

**Build plan.**

1. log^{[k]} has order exactly k + 1 and vanishes at s = γ^jζ for all p-power roots of unity ζ and 0 ≤ j ≤ k, which are exactly the images of the characters z^jχ.
2. Adding a multiple of it to L_p preserves all interpolation values and (k + 1)-admissibility.

**Acceptance.**

- Do not extend the strict inequality h < k + 1 of the uniqueness theorem by continuity.

**Sources.** [Robert Pollack and Glenn Stevens, Overconvergent modular symbols and p-adic L-functions](https://www.numdam.org/item/10.24033/asens.2139.pdf), §6.4, p. 29 (Numdam PDF page 30; printed page = PDF page − 1). The failure of uniqueness. [Joël Bellaïche, Critical p-adic L-functions](https://arxiv.org/pdf/0912.2925v1), §1.4.3, p. 7 (arXiv v1; printed page = PDF page). Bellaïche's remark.

<a id="L3-theta-critical-comparison"></a>

#### θ-critical single forms

**Target `L3/theta-critical-comparison` (comparison).** For a θ-critical refinement (for example the critical-slope refinement of a CM form with p split, such as X₀(32) at p = 5), L2's construction does not apply: the eigenline of Symb_Γ(D_k)^± lies in ker ρ*_k (PadicFamilies L3, Bellaïche's theorem), Bellaïche's L± vanishes at all classical characters, and the classical interpolation is carried by the top secondary L-function L±_{e−1}, normalised by ρ*_k of the top generalised eigenvector = φ^±.

**Hypotheses and boundaries.**

- e = dim Symb^±_Γ(D_k)(f_β) ≥ 2 at a θ-critical cuspidal point.

**Inputs.** `PadicFamilies:L3/critical-eigenspace-dimension`, `PadicFamilies:L3/theta-critical-vanishing`, `PadicFamilies:L3/secondary-l-functions`, [L2/specialisation-map](#L2-specialisation-map).

**Build plan.**

1. Theorem 1 of Bellaïche gives the eigenline in ker ρ*_k; Theorem 2 the vanishing; §1.4.5 the interpolation of L_{e−1}.

**Acceptance.**

- Interpolation values alone are not a uniqueness theorem here: they vanish for the primary L-function.

**Sources.** [Robert Pollack and Glenn Stevens, Overconvergent modular symbols and p-adic L-functions](https://www.numdam.org/item/10.24033/asens.2139.pdf), §5.4, Remark 5.15, p. 26 (Numdam PDF page 27; printed page = PDF page − 1). The CM case. [Joël Bellaïche, Critical p-adic L-functions](https://arxiv.org/pdf/0912.2925v1), §1.4.5, p. 11 (arXiv v1; printed page = PDF page). The top secondary L-function interpolates.

<a id="L3-family-comparison-principle"></a>

#### Comparing critical and arithmetic L-functions through families

**Target `L3/family-comparison-principle` (theorem).** Let V ∋ x be the affinoid neighbourhood of a decent critical-slope point in the eigencurve with two-variable L±(y, σ) (PadicFamilies L3). If an identity between L±(y, ·) and an arithmetic construction (e.g. Kato's) holds, up to the normalising function of y, at a Zariski-dense set of non-critical classical points y ∈ V, it holds at x; comparisons at x by interpolation values alone are not valid.

**Hypotheses and boundaries.**

- Both sides analytic in y on V; the normalising function of y is nonvanishing.

**Inputs.** `PadicFamilies:L3/two-variable-l-function`, [L3/critical-slope-non-uniqueness](#L3-critical-slope-non-uniqueness).

**Build plan.**

1. Two analytic functions on the reduced curve V agreeing on a Zariski-dense set agree; classical non-critical points accumulate at x (classical weights k′ ≫ 0 near k have v_p(β′) = v_p(β) < k′ + 1 on V).

**Acceptance.**

- This is how the critical-slope functions are compared with Kato's (KatoEulerSystems L3), not by values at x.

**Sources.** [Joël Bellaïche, Critical p-adic L-functions](https://arxiv.org/pdf/0912.2925v1), §1.4.4, Theorem 3, p. 10 (arXiv v1; printed page = PDF page). The two-variable function used for the comparison.

<a id="L3-critical-slope-examples"></a>

#### Critical-slope examples of Pollack–Stevens

**Target `L3/critical-slope-examples` (application).** Weight 2 (k = 0), Γ₀ = Γ₀(Np), slope one. (8.6) N = 11, p = 3: the slope-one subspace of Symb_{Γ₀(33)}(ℚ₃) is three-dimensional, spanned by φ^±_β of the critical-slope refinement f_β of X₀(11) (a₃ = −1, v₃(β) = 1) and an Eisenstein symbol φ_eis ∈ Symb⁺ with T_ℓ = ℓ + 1, U₁₁ = 1, U₃ = 3; all three lift to eigensymbols Φ^±_β, Φ⁺_eis, and the kernel of ρ*_k on the slope-one part contains a three-dimensional space of eigensymbols: Φ⁻_eis and two slope-one symbols with U₃-eigenvalues in ℚ₃(√−3), the θ-image of the weight-0 specialisation of the rank-two Hida family of tame level 11. (8.7) N = 11, p = 5: again three-dimensional (Eisenstein plus the slope-one 5-stabilisation of X₀(11), whose residual representation is reducible since X₀(11) has a rational 5-torsion point), and all three symbols lift; the ordinary 5-adic L-function of X₀(11) has positive μ-invariant. (8.8) N = 32, p = 5: three-dimensional again, but the critical-slope refinement of the CM form X₀(32) has no eigen-lift; the eigensymbol with its eigenvalues is unique up to scalar for each sign and specialises to 0.

**Hypotheses and boundaries.**

- Numerical observations in 8.6 and 8.7 are recorded as tests, not as theorems. The 8.8 observations are theorems: CM forms are decent (Bellaïche Proposition 2.15(iv)) and critical-slope CM refinements are critical (his Remark 1), so Theorem 1 gives a one-dimensional eigenspace contained in ker ρ*_k.

**Inputs.** [L3/non-theta-critical-lift](#L3-non-theta-critical-lift), [L3/theta-critical-comparison](#L3-theta-critical-comparison), `PadicFamilies:L3/critical-eigenspace-dimension`.

**Build plan.**

1. Reproduce the dimension counts from the Hecke decomposition of Symb_{Γ₀(Np)}(ℚ_p) at slope 1.

**Acceptance.**

- The 8.6 kernel symbols show the Hida algebra of tame level 11 at p = 3 is not free over Λ (Pollack–Stevens footnote).

**Sources.** [Robert Pollack and Glenn Stevens, Overconvergent modular symbols and p-adic L-functions](https://www.numdam.org/item/10.24033/asens.2139.pdf), §8.4, Example 8.6, p. 35 (Numdam PDF page 36; printed page = PDF page − 1). Example 8.6. [Robert Pollack and Glenn Stevens, Overconvergent modular symbols and p-adic L-functions](https://www.numdam.org/item/10.24033/asens.2139.pdf), §8.4, Example 8.8, p. 36 (Numdam PDF page 37; printed page = PDF page − 1). Example 8.8. [Joël Bellaïche, Critical p-adic L-functions](https://arxiv.org/pdf/0912.2925v1), §1.4.1, Remark 1, p. 6 (arXiv v1; printed page = PDF page). Bellaïche's explanation of Example 8.8. [Joël Bellaïche, Critical p-adic L-functions](https://arxiv.org/pdf/0912.2925v1), §1.4.1, Remark 1, p. 6 (arXiv v1; printed page = PDF page). Critical-slope CM refinements are critical.

**Planets:** Critical-slope p-adic L-function.

### L4: Examples and coefficient changes

<a id="L4-level-eleven-examples"></a>

#### Weight-two examples at level 11

**Target `L4/level-eleven-examples` (application).** For f the newform of X₀(11): the normalised symbol φ_f = ψ⁺_f/Ω⁺ + ψ⁻_f/Ω⁻ takes the values (1/5, −3/2, 1/2) on the Manin generators D₁, D₂, D₃ of level 11. At p = 11 (no p-stabilisation is needed, as 11 | N and U₁₁φ_f = φ_f) the 11-adic L-function L₁₁(f, T) ≈ 1490719231T + 433614230T² + … vanishes at T = 0 (a trivial zero, from the split multiplicative reduction of X₀(11) at 11) and its linear coefficient is an 11-adic unit, so μ = 0 and λ = 1. The Eisenstein eigensymbol φ₁ with values (1, 0, 0) lifts to a symbol whose value at {0} − {∞} is the Dirac distribution at 0, so its 11-adic L-function on ℤ₁₁^× vanishes. At p = 3 and p = 5 see critical-slope-examples.

**Hypotheses and boundaries.**

- The lifts are computed by Greenberg's lifting algorithm (lift randomly, then apply U₁₁ repeatedly; Pollack's notes §6).

**Inputs.** [L2/p-adic-l-function](#L2-p-adic-l-function), [L0/symbols-generator-values](#L0-symbols-generator-values).

**Build plan.**

1. Compute φ_f from the Manin presentation of level 11 (L0) and lift with U₁₁ (L2).

**Acceptance.**

- The trivial zero comes from split multiplicative reduction (a₁₁ = 1).

**Sources.** [Robert Pollack, Overconvergent modular symbols (Arizona Winter School 2011 lecture notes)](https://swc-math.github.io/aws/2011/2011PollackNotes.pdf), §6, p. 27. The level-11 example. [Robert Pollack, Overconvergent modular symbols (Arizona Winter School 2011 lecture notes)](https://swc-math.github.io/aws/2011/2011PollackNotes.pdf), §6, p. 28. μ and λ at p = 11.

<a id="L4-euler-factor-comparison"></a>

#### The two Euler factors at p

**Target `L4/euler-factor-comparison` (theorem).** For a refinement (f, α) of a newform of level prime to p and a character ϕ of conductor prime to p (n = 0), the interpolation factor is e_p(α, ϕt^j) = (1 − ϕ(p)p^j/α)(1 − ϕ̄(p)ε(p)p^{k−j}/α): the first factor comes from the distribution (L2), the second from the p-stabilisation L(f_α, s) = (1 − βp^{−s})L(f, s) (L1). For conductor p^ν (ν ≥ 1) both factors are 1 and the prefactor is α^{−ν}.

**Hypotheses and boundaries.**

- Bellaïche's (5) prints the factors of the refinement f_β with α in place of β (source issue E9).

**Inputs.** [L2/interpolation-and-uniqueness](#L2-interpolation-and-uniqueness), [L1/p-stabilised-euler-factors](#L1-p-stabilised-euler-factors).

**Build plan.**

1. Combine L2's e = 1 − p^j/α at n = 0 with L1's (1 − βp^{−j−1}) = (1 − ε(p)p^{k−j}/α) (αβ = ε(p)p^{k+1}).

**Acceptance.**

- Test at X₀(11), p = 3, j = 0: e_p = (1 − 1/α)², α the unit root of X² + X + 3.

**Sources.** [Joël Bellaïche, Critical p-adic L-functions](https://arxiv.org/pdf/0912.2925v1), §1.4.3, (5), p. 8 (arXiv v1; printed page = PDF page). The Euler factor (5) as printed (with the misprint E9).

<a id="L4-tame-twist-p-adic-l-function"></a>

#### p-adic L-functions with a tame twist (Pollack §2.2–2.3)

**Target `L4/tame-twist-p-adic-l-function` (theorem).** Let f be a newform of weight k + 2, level N and character ε, p ∤ N, and (f, α) a refinement of slope h < k + 1. Let M ≥ 1 be prime to p and Z_{p,M}^× = lim_n (Z/p^nM)^×. For (a, Mp) = 1, the formula μ^±_{f,α}(P, a + p^nMZ_{p,M}) = α^{−n}λ^±(f, P; a, p^nM) − ε(p)p^kα^{−n−1}λ^±(f, P; a, p^{n−1}M) defines an h-admissible measure on Z_{p,M}^× (Proposition 2.8). Here λ^± are the modular symbols of f divided by periods Ω^±_f, and P runs over integral polynomials of degree ≤ k. For a tame character ψ, the power series L_p(f, α, ψ, T) = ∫ ψχ_u dμ^{sgn ψ}_{f,α} (u = 1 + T, χ_u the wild character with γ ↦ u) lies in K(α, ψ)[[T]] and is O(log_p(1 + T)^h). Take χ = x_p^jϕ with 0 ≤ j ≤ k and ϕ of finite order and conductor m = p^νM. Then L_p(f, α, χ) = e_p(α, χ)·m^{j+1}/(−2πi)^j·j!/τ(ϕ^{−1})·L(fϕ^{−1}, j + 1)/Ω^±_f, with e_p(α, χ) = α^{−ν}(1 − ϕ^{−1}(p)ε(p)p^{k−j}/α)(1 − ϕ(p)p^j/α). It is the unique O(log_p(1 + T)^h) function with these values (Proposition 2.11). With M = 1 it is the L_p(f, α) of L2/p-adic-l-function, up to the normalisation of periods.

**Hypotheses and boundaries.**

- Weights follow this roadmap: f has weight k + 2 (Pollack's k is our k + 2).
- Analyticity and the growth O(log_p(1 + T)^h) are Višik's and Amice–Vélu's theorem (Pollack Theorem 2.6), as in L2/eigensymbol-admissibility.
- The proof of the interpolation formula is Mazur–Tate–Teitelbaum §14, which is not read; the formula agrees with L2/interpolation-and-uniqueness for M = 1 and with L4/euler-factor-comparison.

**Inputs.** [L2/p-adic-l-function](#L2-p-adic-l-function), [L2/interpolation-and-uniqueness](#L2-interpolation-and-uniqueness), [L2/eigensymbol-admissibility](#L2-eigensymbol-admissibility), [L1/twisted-mellin-formula](#L1-twisted-mellin-formula).

**Build plan.**

1. Additivity of μ^±_{f,α} is the T_p-eigenform relation; its growth is Višik's Lemma 3.8 (Proposition 2.8).
2. Integrate ψχ_u against μ^{sgn ψ} to get an analytic function of u in the open unit disc, O(log^h) by Theorem 2.6.
3. Evaluate at χ = x_p^jϕ with the twisted Mellin formula (L1/twisted-mellin-formula) to get Proposition 2.11. Uniqueness holds because a difference vanishes at all γ^jζ − 1 (0 ≤ j ≤ k) and is O(log^h) with h < k + 1.

**Acceptance.**

- M = 1, ψ trivial: L2/p-adic-l-function.
- ν = 0: both Euler factors appear; ν ≥ 1: only the prefactor α^{−ν}.

**Sources.** [Robert Pollack, On the p-adic L-function of a modular form at a supersingular prime](https://math.bu.edu/people/rpollack/Papers/On_the_padic_Lfunction_of_a_modular_form_at_a_ss_prime.pdf), §2.2, the measures and Proposition 2.8, p. 530. Admissibility for either allowable root. [Robert Pollack, On the p-adic L-function of a modular form at a supersingular prime](https://math.bu.edu/people/rpollack/Papers/On_the_padic_Lfunction_of_a_modular_form_at_a_ss_prime.pdf), §2.3, Proposition 2.11, p. 532. Interpolation and uniqueness with a tame twist.

<a id="L4-supersingular-refinements"></a>

#### Both refinements at a good supersingular prime, and their zeros (Pollack §3)

**Target `L4/supersingular-refinements` (theorem).** Let p ∤ NM be supersingular for f, so v_p(a_p) > 0. Then both roots α₁, α₂ of X² − a_pX + ε(p)p^{k+1} have slope h_i ∈ (0, k + 1), since h₁ + h₂ = k + 1. So both refinements are small slope, and both L_p(f, α_i, ψ, T) exist. (Mazur, Theorem 3.3) If h₁ ≠ h₂, at least one of them has infinitely many zeros in the open unit disc. (Perrin-Riou, Theorem 3.5) If a_p = 0, then h₁ = h₂ = (k + 1)/2 and α₂ = −α₁. Write L_p(f, α₁, ψ, T) = G⁺_ψ(T) + G⁻_ψ(T)·α₁ with G^± ∈ K(ψ)[[T]]. For odd p, G⁺_ψ vanishes at ζ_{p^{2n}} − 1 and G⁻_ψ at ζ_{p^{2n−1}} − 1 for n ≥ 1; for p = 2 the parities are reversed. One of the two L-functions has infinitely many zeros, and both do if α₁ ∉ K(ψ). (Corollary 3.6) For an elliptic curve E/Q with good supersingular reduction at p, one of the two has infinitely many zeros. For p ≥ 5, a_p = 0, because p | a_p and a_p² < 4p. For p = 2 or 3 with a_p ≠ 0, α₁/α₂ is a primitive fourth or sixth root of unity, which still forces G^± to have infinitely many zeros.

**Hypotheses and boundaries.**

- Weights follow this roadmap: f has weight k + 2 (Pollack's k is our k + 2).
- A nonzero power series convergent on the open unit disc has finitely many zeros exactly when its coefficients are bounded (Lemma 3.2, Lazard).

**Inputs.** [L4/tame-twist-p-adic-l-function](#L4-tame-twist-p-adic-l-function), [L2/refinement](#L2-refinement).

**Build plan.**

1. Remark 2.12: L_p(f, α_i, ψ, ζ_{p^n} − 1) = c_n/α_i^{n+1} with c_n independent of α_i (exponent n + 2 for p = 2).
2. h₁ ≠ h₂: if both had finitely many zeros they would have bounded coefficients, and comparing valuations of α₁^{n+1}L(α₁) = α₂^{n+1}L(α₂) as n → ∞ contradicts h₁ ≠ h₂.
3. a_p = 0: α₁ = −α₂ makes the two values agree for odd n and differ by a sign for even n, which forces the zeros of G^±. Bounded G^± cannot have infinitely many zeros, so one L-function is unbounded, hence has infinitely many zeros.

**Acceptance.**

- Ordinary p is excluded: then only one root has slope < k + 1.
- Weight 2 (k = 0) with a_p = 0: both slopes are 1/2.

**Sources.** [Robert Pollack, On the p-adic L-function of a modular form at a supersingular prime](https://math.bu.edu/people/rpollack/Papers/On_the_padic_Lfunction_of_a_modular_form_at_a_ss_prime.pdf), §3, Theorem 3.3, p. 533. Different slopes. [Robert Pollack, On the p-adic L-function of a modular form at a supersingular prime](https://math.bu.edu/people/rpollack/Papers/On_the_padic_Lfunction_of_a_modular_form_at_a_ss_prime.pdf), §3, Theorem 3.5, p. 534. a_p = 0. [Robert Pollack, On the p-adic L-function of a modular form at a supersingular prime](https://math.bu.edu/people/rpollack/Papers/On_the_padic_Lfunction_of_a_modular_form_at_a_ss_prime.pdf), §3, Corollary 3.6 and its proof, p. 535. Elliptic curves at p = 2 and 3.

<a id="L4-half-logarithms"></a>

#### Pollack's half-logarithms log^±_p (§4)

**Target `L4/half-logarithms` (construction).** Let γ generate 1 + qZ_p (q = p, or 4 if p = 2) and Φ_n(T) = Σ_{t=0}^{p−1} T^{p^{n−1}t}, the p^n-th cyclotomic polynomial. For an integer j put log⁺_{p,j}(T) = (1/p)·∏_{n≥1} Φ_{2n}(γ^{−j}(1 + T))/p and log⁻_{p,j}(T) = (1/p)·∏_{n≥1} Φ_{2n−1}(γ^{−j}(1 + T))/p. They converge on the open unit disc, and their zeros are exactly γ^jζ_{p^{2n}} − 1 (resp. γ^jζ_{p^{2n−1}} − 1), n ≥ 1, all simple (Lemma 4.1). Put log^±_p = ∏_{j=0}^{k} log^±_{p,j} (Corollary 4.2). Then, with u = γ^{−j}(1+T), p²(u−1)log⁺_{p,j}(T)log⁻_{p,j}(T) = log_p(u). At u=1 the analytic quotient log_p(u)/(u−1) has value 1, and both individual half-logarithms have value 1/p. The total weight-k products have logarithmic growth (k+1)/2 (Lemma 4.5). For k=0 inversion has the unit factors log⁺_p((1+T)⁻¹−1)=(1+T)^{p/(p+1)}log⁺_p(T) and log⁻_p((1+T)⁻¹−1)=(1+T)^{1/(p+1)}log⁻_p(T), interpreted by their convergent p-adic binomial series. This corrects Pollack Lemma 4.6, as in Sprung Lemma 4.26. For a primitive p^n-th root ζ, log⁺_p(ζ−1) vanishes for even n and equals p^{−(n+1)/2}∏_{j=1}^{(n−1)/2}Φ_{2j}(ζ) for odd n; log⁻_p(ζ−1) vanishes for odd n and equals p^{−n/2−1}∏_{j=1}^{n/2}Φ_{2j−1}(ζ) for even n (Lemma 4.7).

**Hypotheses and boundaries.**

- Weights follow this roadmap: f has weight k + 2 (Pollack's k is our k + 2). Pollack's product runs over 0 ≤ j ≤ k − 2 in his weight k.
- For p = 2 the roles of log⁺ and log⁻ are exchanged in the decomposition (L4/plus-minus-decomposition).

**Inputs.** [L2/p-adic-l-function](#L2-p-adic-l-function), `mathlib:PowerSeries.binomialSeries`.

**Build plan.**

1. Convergence: (1/p)Φ_{2n}(γ^{−j}(1 + T)) − 1 is divisible by (γ^{−j}(1 + T))^{p^{2n−1}} − 1, which tends to 0 (Lemma 4.1).
2. Zeros: log_p(γ^{−j}(1 + T)) = (γ^{−j}(1 + T) − 1)·lim_n ∏_{m≤n}Φ_m(γ^{−j}(1 + T))/p has simple zeros exactly at γ^jζ_{p^n} − 1, which gives Corollary 4.3 and the zero sets.
3. Growth is obtained from cyclotomic Gauss norms near radius one, with degree p^{n−1}(p−1) in the exponent, then multiplying the k+1 translated factors. No formula linear in the radius divided by that degree is used.
4. Values: Φ_m(ζ_{p^n}) = p for m > n, so only the head of each product survives (Lemma 4.7).
5. For inversion use Φ_m(u⁻¹)=u^{−p^{m−1}(p−1)}Φ_m(u). The sums of even and odd cyclotomic degrees converge p-adically to −p/(p+1) and −1/(p+1); their negatives give the two unit exponents. For p=2 the exponent 1/3 is still integral in ℤ₂; Sprung records the extra first factor in his convention.

**API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `halfLogPlus` | constructor | log⁺_{p,j}(T) = (1/p)∏_{n≥1}Φ_{2n}(γ^{−j}(1 + T))/p, and log⁺_p = ∏_{j=0}^{k} log⁺_{p,j}. |
| `halfLogMinus` | constructor | log⁻_{p,j}(T) = (1/p)∏_{n≥1}Φ_{2n−1}(γ^{−j}(1 + T))/p, and log⁻_p = ∏_{j=0}^{k} log⁻_{p,j}. |
| `halfLogPlus_zeros` | characterisation | Zeros of log⁺_{p,j} are exactly γ^jζ of primitive even p-power order; halfLogMinus_zeros gives odd order, and halfLog_zeros_simple supplies nonzero derivatives. |
| `halfLog_mul` | characterisation | For u=γ^{−j}(1+T), p²(u−1)log⁺_{p,j}(T)log⁻_{p,j}(T)=log_p(u); at u=1 both factors equal 1/p. The removable quotient has value 1. |
| `halfLog_growth` | characterisation | The coefficients of each weight-k half-logarithm have order at most (k+1)/2. The exact radial comparison, including the lower bound used for division, is halfLog_growth_exact. |
| `halfLog_growth_exact` | characterisation | For r sufficiently close to one, both radial Gauss norms are bounded above and below by positive constants times the radial norm of log(1+T) to power (k+1)/2. |
| `halfLog_zeros_simple` | characterisation | At any zero in the open unit disc over a complete p-adic extension, the derivative series evaluates to a nonzero value. |

**Unit tests.**

- `halfLog.test_weight_two_product` (value): k = 0: p²·T·log⁺_p·log⁻_p = log_p(1 + T).
- `halfLog.test_value_first_level` (value): k = 0: log⁻_p(ζ_p − 1) = 0 and log⁺_p(ζ_p − 1) = p^{−1} (n = 1).
- `halfLog.test_functional_equation` (characterisation): k=0: inversion multiplies log⁺ by (1+T)^{p/(p+1)} and log⁻ by (1+T)^{1/(p+1)}, including p=2.
- `halfLog.test_not_bounded` (non-example): log^±_p has infinitely many zeros, so it is not in Z_p[[T]] ⊗ Q_p (Lemma 3.2).
- `halfLog.test_linear_coefficients` (value): k=0: both constant coefficients are 1/p; the linear coefficients are −1/(2(p+1)) for log⁺ and −1/(2p(p+1)) for log⁻. Invariance under inversion would force these nonzero coefficients to vanish.

**Acceptance.**

- k = 0: p²·T·log⁺_p·log⁻_p = log_p(1 + T).
- The leading 1/p is needed for the value p^{−(n+1)/2} of Lemma 4.7.

**Sources.** [Robert Pollack, On the p-adic L-function of a modular form at a supersingular prime](https://math.bu.edu/people/rpollack/Papers/On_the_padic_Lfunction_of_a_modular_form_at_a_ss_prime.pdf), §4.1, Lemma 4.1, p. 536. The definition and the zeros. [Robert Pollack, On the p-adic L-function of a modular form at a supersingular prime](https://math.bu.edu/people/rpollack/Papers/On_the_padic_Lfunction_of_a_modular_form_at_a_ss_prime.pdf), §4.1, proof of Lemma 4.1, p. 537. The product formula behind Corollary 4.3. [Robert Pollack, On the p-adic L-function of a modular form at a supersingular prime](https://math.bu.edu/people/rpollack/Papers/On_the_padic_Lfunction_of_a_modular_form_at_a_ss_prime.pdf), §4.2, Lemma 4.5, p. 538. The growth. [Robert Pollack, On the p-adic L-function of a modular form at a supersingular prime](https://math.bu.edu/people/rpollack/Papers/On_the_padic_Lfunction_of_a_modular_form_at_a_ss_prime.pdf), §4.4, Lemma 4.7, p. 539. The values at ζ − 1. [Florian Sprung, On pairs of p-adic L-functions for weight-two modular forms](https://msp.org/ant/2017/11-4/ant-v11-n4-p04-s.pdf), §4, Proposition 4.25 and Lemma 4.26, pp.907–908 (PDF pp.24–25). Published correction of the inversion formula, with the p=2 first-factor convention. The displayed exponents here are derived for Pollack’s original products.

<a id="L4-plus-minus-decomposition"></a>

#### Pollack's ± decomposition of the supersingular p-adic L-function (Theorems 5.1 and 5.6)

**Target `L4/plus-minus-decomposition` (theorem).** Let p ∤ NM with a_p = 0, and α a root of X² + ε(p)p^{k+1}. If p is odd, L_p(f, α, ψ, T) = L⁺_p(f, ψ, T)·log⁺_p(T) + L⁻_p(f, ψ, T)·log⁻_p(T)·α, with L^±_p(f, ψ, T) ∈ Λ_ψ ⊗ K_ψ (Λ_ψ = O_ψ[[T]]). They have bounded coefficients; every nonzero component has finitely many zeros. If p = 2, L₂(f, α, ψ, T) = L⁺₂·log⁻₂ + L⁻₂·log⁺₂·α with L^±₂ ∈ Λ_ψ ⊗ K_ψ (Theorem 5.1). For an elliptic curve E/Q with a_p = 0 and the periods Ω^±_E of §5.2.1, L^±_p(E, T) ∈ Z_p[[T]] for odd p. For p = 2, L₂(E, α, T) = L⁺₂(E, T)·log⁻₂(T) + L⁻₂(E, T)·(1/2)log⁺₂(T)·α with L^±₂(E, T) ∈ Z₂[[T]]; the factor 1/2 is needed for integrality (Theorem 5.6, Remark 5.7).

**Hypotheses and boundaries.**

- Weights follow this roadmap: f has weight k + 2 (Pollack's k is our k + 2).
- The integrality in Theorem 5.6 uses that the Manin constant of E is prime to a good supersingular p (Remark 5.5), so 2[a/p^n]^± ∈ Z_p.
- The finite-zero conclusion applies only to a nonzero bounded power series, on each fixed tame branch. A zero component is permitted and has no finite-zero conclusion.

**Inputs.** [L4/half-logarithms](#L4-half-logarithms), [L4/supersingular-refinements](#L4-supersingular-refinements), [L4/tame-twist-p-adic-l-function](#L4-tame-twist-p-adic-l-function).

**Build plan.**

1. G^±_ψ vanish at every zero of log^±_p: at γ^jζ − 1 for 0 ≤ j ≤ k, by the interpolation property (L4/tame-twist-p-adic-l-function). So log^±_p divides G^±_ψ in A(K_ψ) (Lazard).
2. G^±_ψ is O(log_p(1 + T)^{(k+1)/2}) (Theorem 2.6), and log^±_p ∼ log_p(1 + T)^{(k+1)/2} (Lemma 4.5), so L^±_p = G^±/log^± is O(1).
3. A bounded analytic function on the open unit disc has bounded coefficients (Lemma 5.2).
4. For E: approximate by the Riemann sums (2), and count the powers of p in the denominators (Lemma 5.9).

**Acceptance.**

- a_p ≠ 0 at a supersingular p (p = 2, 3) is not covered.
- L^±_p are Iwasawa functions: finitely many zeros on a nonzero branch, and the λ^±, μ^± invariants of Pollack's Table 1 are defined.

**Sources.** [Robert Pollack, On the p-adic L-function of a modular form at a supersingular prime](https://math.bu.edu/people/rpollack/Papers/On_the_padic_Lfunction_of_a_modular_form_at_a_ss_prime.pdf), §5.1, Theorem 5.1, p. 540. The decomposition. [Robert Pollack, On the p-adic L-function of a modular form at a supersingular prime](https://math.bu.edu/people/rpollack/Papers/On_the_padic_Lfunction_of_a_modular_form_at_a_ss_prime.pdf), §5.2.2, Theorem 5.6, p. 542. Integrality for elliptic curves. [Robert Pollack, On the p-adic L-function of a modular form at a supersingular prime](https://math.bu.edu/people/rpollack/Papers/On_the_padic_Lfunction_of_a_modular_form_at_a_ss_prime.pdf), §5.2.2, Remark 5.7, p. 543. The factor 1/2 at p = 2.

<a id="L4-supersingular-examples"></a>

#### Supersingular examples at level 11

**Target `L4/supersingular-examples` (application).** Let f = f_{11} be the newform of X₀(11) (k = 0), with q-expansion q∏_{n≥1}(1 − qⁿ)²(1 − q^{11n})². (i) At p = 2: a₂ = −2, so p = 2 is supersingular. The roots of X² + 2X + 2 are −1 ± i, of 2-adic valuation 1/2 < 1, so both refinements are small slope. α₁/α₂ = −i is a primitive fourth root of unity, so by Corollary 3.6 at least one of L₂(f, α_i, T) has infinitely many zeros. Theorem 5.1 does not apply, since a₂ ≠ 0. (ii) At p = 19 (and p = 29): a₁₉ = a₂₉ = 0. The roots ±√−19 of X² + 19 have slope 1/2 and do not lie in Q₁₉, so both L₁₉(f, α_i, T) have infinitely many zeros (Theorem 3.5). Theorem 5.6 gives L₁₉(E, α, T) = L⁺₁₉·log⁺₁₉ + L⁻₁₉·log⁻₁₉·α with L^±₁₉ ∈ Z₁₉[[T]]. (iii) Pollack's Table 1 lists λ^± and μ^± for quadratic twists of 32A at p = 3, where a₃ = 0.

**Hypotheses and boundaries.**

- Weights follow this roadmap: f has weight k + 2 (Pollack's k is our k + 2).
- The coefficients a₂ = −2, a₁₉ = a₂₉ = 0 come from the eta-product; they were computed from the product formula to q⁶⁰.

**Inputs.** [L4/supersingular-refinements](#L4-supersingular-refinements), [L4/plus-minus-decomposition](#L4-plus-minus-decomposition), [L4/level-eleven-examples](#L4-level-eleven-examples).

**Build plan.**

1. (i): X² − a₂X + 2 = X² + 2X + 2, whose roots −1 ± i have norm 2; (−1 + i)·i = −1 − i.
2. (ii): X² + 19; v₁₉(−19) = 1 is odd, so √−19 ∉ Q₁₉.

**Acceptance.**

- The level-11 symbols of L4/level-eleven-examples give L₁₉ and L^±₁₉ by the Riemann sums (2).
- At p=2 the two refined L-functions and their infinite-zero statement are targets here. A general sharp/flat decomposition at a_p≠0 is outside the RS-08 scope; Sprung is cited here only for the half-logarithm correction.

**Sources.** [Robert Pollack, On the p-adic L-function of a modular form at a supersingular prime](https://math.bu.edu/people/rpollack/Papers/On_the_padic_Lfunction_of_a_modular_form_at_a_ss_prime.pdf), §3, Corollary 3.6 and its proof, p. 535. Why supersingular means a_p = 0 for p ≥ 5; p = 2 is the exception here. [Robert Pollack, On the p-adic L-function of a modular form at a supersingular prime](https://math.bu.edu/people/rpollack/Papers/On_the_padic_Lfunction_of_a_modular_form_at_a_ss_prime.pdf), §5.2.1, Remark 5.4, p. 542. Pollack's own use of X₀(11), for the periods.

<a id="L4-coefficient-embedding-comparison"></a>

#### Coefficient embeddings and conjugate period coordinates

**Target `L4/coefficient-embedding-comparison` (theorem).** For a normalized newform f of weight k+2, let E contain its coefficients and character values and let σ:E→E′ be a field embedding. The coefficient transport map on polynomial-valued symbols carries each signed f-eigenline to the signed f^σ-eigenline. With the transported basis φ^σ, period-normalized critical values transport by σ, including Gauss sums and the inverse twisting character. For p-adic constructions choose a p-adic place of E and the transported place of E′. An isometric extension σ_p of σ carries a refinement α to σ_p(α), preserves its slope, transports its normalized eigenlift and its p-adic L-function by coefficientwise transport. For small slope the equality follows from the control theorem or interpolation uniqueness; for critical slope it follows from the chosen family/eigenlift comparison, not interpolation alone. No transport of transcendental complex periods by σ is asserted.

**Hypotheses and boundaries.**

- The modular-form rational structure supplying f^σ and the coefficient field is imported from ModularForms Layer 8.
- The transport includes character values and the chosen signed basis. Unrelated choices of complex periods change the result by a coefficient-field unit.
- Slope preservation requires an isometric map of the specified p-adic completions. Conjugating to a different place can change ordinarity.

**Inputs.** [L0/symbols-base-change](#L0-symbols-base-change), [L1/period-lines](#L1-period-lines), [L1/critical-value-algebraicity](#L1-critical-value-algebraicity), [L2/control-theorem](#L2-control-theorem), [L3/family-comparison-principle](#L3-family-comparison-principle).

**Build plan.**

1. Use symbols-base-change and the coefficient transport of the Hecke and diamond operators to identify the eigenspaces.
2. Apply the twisted Mellin formula to the transported symbol coordinates; the normalized values are algebraic.
3. Transport specialisation and U_p; small-slope lift uniqueness gives equality of distributions. The critical case imports the family comparison principle.

**Acceptance.**

- The identity coefficient-field isomorphism acts trivially on each signed algebraic eigenline.
- An isometric isomorphism of the chosen completions preserves the slope of every nonzero refinement eigenvalue; no such assertion is made for unrelated p-adic places.
- Changing a complex period basis by λ rescales the normalized value by λ; σ acts on these algebraic coordinates, not on the transcendental period.

**Sources.** [Jennifer S. Balakrishnan, J. Steffen Müller and William A. Stein, A p-adic analogue of the conjecture of Birch and Swinnerton-Dyer for modular abelian varieties](https://arxiv.org/pdf/1210.2739), §2.1, Theorem 2.2(iii) and following period-ambiguity discussion, pp.5–7. Weight-two, totally real example of coordinated periods and conjugation of normalized values. The general-weight symbol transport is the deduction above, not a claim about the scope of this theorem. [Robert Pollack and Glenn Stevens, Overconvergent modular symbols and p-adic L-functions](https://www.numdam.org/item/10.24033/asens.2139.pdf), §5.4, Theorem 5.12, pp.25–26; §6.3, Proposition 6.3, pp.28–29. Uniqueness of the small-slope eigenlift and its evaluation into a distribution.

<a id="L4-primitive-imprimitive-level-change"></a>

#### Euler depletion and primitive/imprimitive comparison

**Target `L4/primitive-imprimitive-level-change` (construction).** Let f be a normalized newform of weight k+2 and level N, fix a nonzero refinement at p, and let ℓ≠p be prime. Put V_ℓf(z)=f(ℓz). If ℓ∤N define f^[ℓ]=f−a_ℓV_ℓf+ε(ℓ)ℓ^{k+1}V_{ℓ²}f, after raising every term to level Nℓ²; if ℓ|N define f^[ℓ]=f−a_ℓV_ℓf at level Nℓ. Its coefficients are a_n(f) for ℓ∤n and zero for ℓ|n. On distributions define [u]μ(g)=μ(z↦g(uz)). The good-prime deletion operator is E_ℓμ=μ−(a_ℓ/ℓ)[ℓ⁻¹]μ+ε(ℓ)ℓ^{k−1}[ℓ⁻²]μ; at a bad prime omit the quadratic term. Evaluated at χ(z)z^j it multiplies by 1−a_ℓχ(ℓ)⁻¹ℓ^{−j−1}+ε(ℓ)χ(ℓ)⁻²ℓ^{k−2j−1}, respectively 1−a_ℓχ(ℓ)⁻¹ℓ^{−j−1}. These are exactly the factors deleting the ℓ-Euler factor of L(fχ⁻¹,j+1). Compatible signed symbol bases give L_p(f^[ℓ],α)=E_ℓL_p(f,α) for slope<k+1. Depletion at several primes is the product of commuting E_ℓ.

**Hypotheses and boundaries.**

- χ(ℓ) is evaluated on a p-adic unit; ℓ=p is excluded.
- ε(ℓ)=0 at a ramified prime and the newform relation at ℓ|N is a_{ℓn}=a_ℓa_n.
- The depleted form is an eigenform for U_p and primes away from Npℓ; it need not be a newform. Its period coordinate is transported from f, not independently normalized.
- Critical-slope equality requires compatible chosen eigenlifts or the family comparison; interpolation uniqueness is not used there.

**Inputs.** [L1/twisted-mellin-formula](#L1-twisted-mellin-formula), [L2/interpolation-and-uniqueness](#L2-interpolation-and-uniqueness), [L3/family-comparison-principle](#L3-family-comparison-principle), `tauceti:TauCeti.CuspForm.levelRaise`, `tauceti:TauCeti.CuspForm.qExpansion_levelRaise`.

**Build plan.**

1. Use Tau Ceti’s levelRaise coefficient formula and good/bad coefficient recurrences to prove the exact depletion formula.
2. Evaluate scaling on χ(z)z^j: [u] acts by χ(u)u^j. This gives the Euler polynomial, including both powers of ℓ.
3. U_p commutes with V_ℓ for ℓ≠p. Match the normalized interpolation values and invoke small-slope uniqueness.

**API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `TauCeti.ModularSymbol.eulerDepletion` | constructor | The depleted cusp form, with its raised level and the exact two- or three-term V_ℓ formula. |
| `TauCeti.ModularSymbol.eulerDepletion_coeff` | simp | Coefficient n equals a_n if ℓ∤n and zero otherwise. |
| `TauCeti.ModularSymbol.scaleDistribution` | constructor | [u]μ(g)=μ(g(u·)) for u∈ℤ_p^×. |
| `TauCeti.ModularSymbol.eulerDeletion` | constructor | The linear distribution operator with the good or bad ℓ-Euler polynomial. |
| `TauCeti.ModularSymbol.eulerDeletion_eval` | characterisation | Evaluation at χ(z)z^j is multiplication by the stated Euler factor. |
| `TauCeti.ModularSymbol.eulerDeletion_comm` | compatibility | Operators for distinct primes away from p commute. |
| `TauCeti.ModularSymbol.padicLFunction_depletion` | compatibility | Compatible normalized small-slope eigenlifts give L_p(f^[ℓ],α)=E_ℓL_p(f,α). |

**Unit tests.**

- `depletion_good_weight_two` (characterisation): k=0 and χ=1: E_ℓ evaluates as 1−a_ℓ/ℓ+ε(ℓ)/ℓ.
- `depletion_bad_weight_two` (characterisation): k=0 at ℓ|N: the factor is 1−a_ℓ/ℓ, with no quadratic term.
- `depletion_coeff_divisible` (characterisation): The coefficient at ℓ and at ℓ² is zero, whereas the coefficient at 1 remains 1.
- `depletion_excludes_p` (characterisation): The scaling construction requires ℓ to be a p-adic unit. Taking ℓ=p fails this requirement.

**Acceptance.**

- k=0 and χ=1: E_ℓ evaluates as 1−a_ℓ/ℓ+ε(ℓ)/ℓ.
- k=0 at ℓ|N: the factor is 1−a_ℓ/ℓ, with no quadratic term.
- The coefficient at ℓ and at ℓ² is zero, whereas the coefficient at 1 remains 1.
- The scaling construction requires ℓ to be a p-adic unit. Taking ℓ=p fails this requirement.

**Sources.** [Robert Pollack and Glenn Stevens, Overconvergent modular symbols and p-adic L-functions](https://www.numdam.org/item/10.24033/asens.2139.pdf), §6.2–6.3, formula (2) and Proposition 6.3, pp.27–29. Normalized distribution construction and interpolation; the Euler-depletion comparison is derived from the existing q-expansion recurrence, not attributed as a quoted theorem.

<a id="L4-bad-prime-zero-boundary"></a>

#### Zero U_p eigenvalue is outside finite-slope interpolation

**Target `L4/bad-prime-zero-boundary` (theorem).** If p|N and a_p(f)=0, no nonzero finite-slope refinement of f exists at p. The definitions involving α^{−n} therefore do not produce a p-adic L-function by this roadmap’s method. In particular p²|N does not justify selecting a root of the good-prime Hecke polynomial. If a_p≠0 the unique bad-prime refinement has α=a_p and uses the bad-prime interpolation normalization.

**Hypotheses and boundaries.**

- Use the actual bad-prime U_p eigenform relation, not the good-prime T_p relation.

**Inputs.** [L2/refinement](#L2-refinement), [L2/p-adic-l-function](#L2-p-adic-l-function).

**Build plan.**

1. Unfold Refinement at p|N: α=a_p and α≠0 contradict a_p=0.

**Acceptance.**

- At p dividing N with a_p=0, Refinement has no element with that underlying newform. The good-prime quadratic-root construction must not be used to manufacture a ramified refinement.

**Sources.** [Robert Pollack and Glenn Stevens, Overconvergent modular symbols and p-adic L-functions](https://www.numdam.org/item/10.24033/asens.2139.pdf), §6 opening, pp.26–27. The nonzero U_p eigenvalue and finite-slope hypothesis underlying the interpolation construction.

**Planets:** Half-logarithms, Pollack's ± p-adic L-functions.

## Supplier contracts

The graph ends in the pinned declarations, this roadmap’s earlier targets, exact supplier nodes, or the following owner contracts. Reuse a current supplier implementation wherever it satisfies the contract.

### Contract 1: `tauceti:TauCetiRoadmap/ModularForms#layer-8-modular-symbols-the-integral-hecke-algebra-and-coefficient-fields`

Div⁰(P¹(ℚ)) as a left ℤ[GL₂⁺(ℚ)]-module (in particular for SL₂(ℤ), Σ₀(N) and Σ₁(N)), generated by the divisors {b} − {a}, with the degree sequence 0 → Div⁰ → ℤ[P¹(ℚ)] → ℤ → 0; Layer 8 builds its module 𝕄 from this object.

Consumers: [L0/modular-symbols](#L0-modular-symbols), [L0/hecke-operators](#L0-hecke-operators), [L0/involution-at-infinity](#L0-involution-at-infinity), [L0/boundary-symbols](#L0-boundary-symbols), [L0/symbols-cohomology-sequence](#L0-symbols-cohomology-sequence).

Current post-pin degreeZero, Manin and period-map modules are already available where they meet this contract; reuse them. Any remaining Div0/general-coefficient boundary interface stays in the owner’s roadmap, not in this packet.

### Contract 2: `tauceti:TauCetiRoadmap/ModularForms#layer-8-modular-symbols-the-integral-hecke-algebra-and-coefficient-fields`

Manin's theorem for Div⁰ itself: d : ℤ[SL₂(ℤ)] → Div⁰, g ↦ {g0} − {g∞}, is surjective (continued fractions) with kernel the left ideal generated by 1 + σ, 1 + τ + τ² and 1 − (−1), σ = (0 −1; 1 0), τ = (0 −1; 1 −1) — Layer 8's SL₂(ℤ)-generation and Manin fundamental-domain milestone, stated for Div⁰ (not only for the coinvariants 𝕄) so that it applies to Hom_Γ(Div⁰, V) for arbitrary V.

Consumers: [L0/modular-symbols](#L0-modular-symbols), [L0/symbols-coset-description](#L0-symbols-coset-description).

Current post-pin degreeZero, Manin and period-map modules are already available where they meet this contract; reuse them. Any remaining Div0/general-coefficient boundary interface stays in the owner’s roadmap, not in this packet.

### Contract 3: `tauceti:TauCetiRoadmap/ModularForms#layer-8-modular-symbols-the-integral-hecke-algebra-and-coefficient-fields`

The fundamental-domain boundary presentation of Div⁰ over ℤ[Γ] for every finite-index Γ ≤ PSL₂(ℤ) containing T (Pollack–Stevens Theorems 2.6 and 2.9), with the D∞ relation Σ(γ_i^{-1} − 1)D_i + ΣD′_i + ΣD″_i = (1 − T^{-1})D∞ as corrected in this packet's sourceIssues E1; Layer 8's FundamentalDomainBoundary milestone, stated for Div⁰ itself.

Consumers: [L0/symbols-generator-values](#L0-symbols-generator-values), [L0/symbols-base-change](#L0-symbols-base-change).

Current post-pin degreeZero, Manin and period-map modules are already available where they meet this contract; reuse them. Any remaining Div0/general-coefficient boundary interface stays in the owner’s roadmap, not in this packet.

### Contract 4: `tauceti:TauCetiRoadmap/ModularForms#layer-8-modular-symbols-the-integral-hecke-algebra-and-coefficient-fields`

The homological module 𝕄 N k = (Div⁰ ⊗ Sym^{k−2}ℤ²)_{Γ₁(N)} with its Hecke and diamond operators, and the period map periodMap′ : S_k(Γ₁(N)) → Hom_ℤ(𝕄 N k, ℂ) with its convergence, Γ₁(N)-invariance, Hecke/diamond equivariance and injectivity milestones.

Consumers: [L0/symbols-coinvariants-duality](#L0-symbols-coinvariants-duality), [L0/period-symbol](#L0-period-symbol), [L0/eichler-shimura-isomorphism](#L0-eichler-shimura-isomorphism).

Current post-pin degreeZero, Manin and period-map modules are already available where they meet this contract; reuse them. Any remaining Div0/general-coefficient boundary interface stays in the owner’s roadmap, not in this packet.

### Contract 5: `tauceti:TauCetiRoadmap/ModularForms#10c--modular-forms-as-section-spaces-and-the-dimension-formulas`

The dimension formula for S_k(Γ₁(N)) (N ≥ 4, k ≥ 2) in the form dim S_k(Γ₁(N)) = (k − 1)μ/12 − ν∞/2 + δ_{k,2}, μ the index of the image of Γ₁(N) in PSL₂(ℤ) and ν∞ the number of cusps.

Consumers: [L0/eichler-shimura-isomorphism](#L0-eichler-shimura-isomorphism).

Wiese Theorem 6.15 cites Stein §6.2 for it; the Tau Ceti pin has finite-dimensionality but not the formula.

### Contract 6: `tauceti:TauCetiRoadmap/ModularForms#layer-5-strong-multiplicity-one-and-the-eigenform-characterization`

Separation of cuspidal and Eisenstein eigensystems: for a newform f of weight k ≥ 2, level N and character ε, no Eisenstein eigenform of weight k and level dividing N has T_ℓ-eigenvalue a_ℓ(f) for every prime ℓ ∤ N.

Consumers: [L0/eigenspace-dimension](#L0-eigenspace-dimension).

Used to show that newform eigenspaces of modular symbols meet the Eisenstein (boundary) symbols trivially; Hecke's bound gives it only in weight > 2.

### Contract 7: `ModularCurvesPartII:R14.3`

The comparison Symb_Γ(V) ≅ H¹_c(Y_Γ, Ṽ) of Hom-side modular symbols with compactly supported cohomology of the modular curve with the local system Ṽ, and of H¹_par(Γ, V) with the image of H¹_c → H¹, when the orders of torsion elements of Γ act invertibly on V (Ash–Stevens Proposition 4.2), functorial in Γ and Hecke-compatible.

Consumers: `ModularSymbolsPadicLFunctions:L0`.

The functorial comparison with the analytic modular-curve carrier that stage L0 asks for; this packet's algebraic sequence (symbols-cohomology-sequence) needs no hypothesis.

### Contract 8: `tauceti:TauCetiRoadmap/ModularForms#layer-7-l-functions`

L(f, s) and the twisted L(f, χ, s) = Σ χ(n)a_n n^{−s} of cusp forms f ∈ S_{k+2}(Γ₁(N)), with the Mellin transform ∫_0^∞ g(iy)y^{s−1}dy = Γ(s)(2π)^{−s}L(g, s) and the entire continuation for cusp forms g.

Consumers: [L1/twisted-mellin-formula](#L1-twisted-mellin-formula).

RS-08: L1 imports the classical Mellin/L-function theory of ModularForms 7.

### Contract 9: `LocallyAnalyticDistributions:L0`

The ℚ_p-Banach algebras A[r] of affinoid functions on B[ℤ_p, r] with their sup norms, the completely continuous dense restrictions A[r₁] → A[r₂] (r₁ > r₂), A(ℤ_p) = lim_{s>0} A[s] and A†(ℤ_p, r) = lim_{s>r} A[s], and their continuous duals D(ℤ_p), D[r], D†(ℤ_p, r) with the dual norms and projective-limit topologies (Pollack–Stevens §3.1).

Consumers: [L2/weight-k-distributions](#L2-weight-k-distributions).

The weight-k action of Σ₀(p) and the moment description are planned here.

### Contract 10: `LocallyAnalyticDistributions:L2`

h-admissible distributions (‖μ‖_r = O(r^{−h}) as r → 0⁺) on ℤ_p and ℤ_p^×; uniqueness of an h-admissible distribution from its values on locally polynomial functions of degree ≤ k when h < k + 1 (Amice–Vélu, Višik); and order 0 = bounded measures, K ⊗ 𝒪⟦ℤ_p^×⟧.

Consumers: [L2/eigensymbol-admissibility](#L2-eigensymbol-admissibility), [L2/interpolation-and-uniqueness](#L2-interpolation-and-uniqueness), [L2/ordinary-integral-measure](#L2-ordinary-integral-measure).

Pollack–Stevens Definition 6.1 and the uniqueness quoted after (1).

### Contract 11: `tauceti:TauCetiRoadmap/ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor`

For a newform f of weight k + 2, level N and character ε, and a prime p: (i) if p ∤ N, the subspace of S_{k+2}(Γ₁(N) ∩ Γ₀(p), ε) on which T_ℓ acts by a_ℓ(f) for every prime ℓ ∤ Np is spanned by f(z) and f(pz) (the oldspace statement, with the uniqueness part 4B); (ii) if p | N, U_p f = a_p(f)f (the bad-prime eigenvalue milestone).

Consumers: [L2/refined-eigenline](#L2-refined-eigenline).

Needed for the one-dimensionality of the refined eigenline at level Γ₁(N) ∩ Γ₀(p).

### Contract 12: `tauceti:TauCetiRoadmap/ModularForms#layer-5-strong-multiplicity-one-and-the-eigenform-characterization`

The level-Np form of the Eisenstein separation: for a newform f of weight k + 2 and level N and a prime p ∤ N, no Eisenstein eigenform of weight k + 2 and level dividing Np has T_ℓ-eigenvalue a_ℓ(f) for every prime ℓ ∤ Np.

Consumers: [L2/refined-eigenline](#L2-refined-eigenline).

L0/eigenspace-dimension requests the level-N case; the refined eigenline lives at level Np.

### Contract 13: `PadicFamilies:L3`

The general critical-slope, θ-critical and secondary theory (Bellaïche's theorem, critical and secondary p-adic L-functions, the two-variable function), imported per RS-08; its nodes are cited directly.

Consumers: [L3/non-theta-critical-lift](#L3-non-theta-critical-lift), [L3/theta-critical-comparison](#L3-theta-critical-comparison), [L3/family-comparison-principle](#L3-family-comparison-principle), [L3/critical-slope-examples](#L3-critical-slope-examples).

PadicFamilies owns the general critical and secondary theory; this packet specializes it to a single form.

### Contract 14: `ModularCurvesPartII:R14.3`

Full-level Betti/group and Betti–étale comparisons for the rational symmetric-power local systems on all geometric components of Y(N), N≥3: identify H¹(X(N),j_*𝒱) with the parabolic subspace, transport the packet’s adjugate polynomial action to Nakamura’s dual local system, and prove compatibility with usual T_ℓ,S_ℓ, adjoint T′_ℓ,S′_ℓ, complex conjugation and the Galois action after extension to ℚ_p. In the packet weight k+2, verify Nakamura Lemma 3.1 as T′_ℓ=ℓ^k T_ℓ S_ℓ⁻¹ and S′_ℓ=ℓ^(2k) S_ℓ⁻¹. The good scalar S_ℓ is invertible. The splitting itself is owned by this L0 packet.

Consumers: [L0/rational-hecke-separation](#L0-rational-hecke-separation), [L0/drinfeld-manin-splitting](#L0-drinfeld-manin-splitting).

No existing R14.3 node supplies the higher-weight/full-level dictionary: its current packet plans weight-two Γ₁(N) Betti inputs.

### Contract 15: `tauceti:TauCetiRoadmap/ModularForms#10c--modular-forms-as-section-spaces-and-the-dimension-formulas`

The full-level weight-two dimension computations dim S₂(Γ(3))=0 and dim S₂(Γ(6))=1, equivalently g(X(3))=0 and g(X(6))=1, for the Drinfeld–Manin tests. Use the existing analytic congruence-curve carrier and cusp/index/genus formula.

Consumers: [L0/drinfeld-manin-splitting](#L0-drinfeld-manin-splitting).

## Coverage and exact gaps

**L0: planned.** Every stage target is represented at target level. Definitions, API items and discriminating tests have typed suggested interfaces. Supplier contracts and the recorded gaps remain; elaboration is not proof or source closure.

- Transport the rational higher-weight separation across the row/column and homological/cohomological dictionaries, through the explicit R14.3 request; its all-component Betti–étale and Galois compatibility remains a recorded gap.
- Replace Layer-8 stand-ins by the current native degreeZero, Manin, polynomial-representation and periodMap imports when packaging against that newer library.

**L1: planned.** Every stage target is represented at target level. Definitions, API items and discriminating tests have typed suggested interfaces. Supplier contracts and the recorded gaps remain; elaboration is not proof or source closure.

- Discharge the ModularForms Layer-7 analytic-continuation and Layer-8 coefficient-field contracts, and the finitely generated saturated rank-one lattice contract over the specified coefficient ring.

**L2: planned.** Every stage target is represented at target level. Definitions, API items and discriminating tests have typed suggested interfaces. Supplier contracts and the recorded gaps remain; elaboration is not proof or source closure.

- Replace the LF/Banach topology and bounded/dagger-action supplier stand-ins by the requested LocallyAnalyticDistributions declarations; retain their stated radii and finite-extension hypotheses.
- The suggested file types the concrete fibre splitting and moment interpolation interfaces. The complete Riesz-projector bounds and coefficient-extension/Fourier step for all finite characters are supplied by the cited functional-analysis and admissibility nodes.

**L3: planned.** Every stage target is represented at target level. Definitions, API items and discriminating tests have typed suggested interfaces. Supplier contracts and the recorded gaps remain; elaboration is not proof or source closure.

- Obtain the exact computational certificates for the level-11 p=3 and p=5 examples.
- Use the actual PadicFamilies reduced-affinoid, full generalized eigenspace and two-variable distribution carriers when exporting the family and top-secondary comparison. The suggested identity principle uses the intersection of evaluation kernels and does not invent an eigencurve carrier.

**L4: planned.** Every stage target is represented at target level. Definitions, API items and discriminating tests have typed suggested interfaces. Supplier contracts and the recorded gaps remain; elaboration is not proof or source closure.

- Obtain the exact p=11 coefficient/unit certificate for the reported μ=0, λ=1 example.
- Specialize the typed analytic-division interface to the actual Mellin transforms and their forced zero sets; retain analytic quotient convergence, not mere formal divisibility. Export tame inverse-limit measure and integral elliptic-period statements through PadicMeasuresIwasawaAlgebras and the stated source period dictionary.

### Full-level coefficient and arithmetic realization dictionary

The open R14.3 request specifies the missing local-system and Hecke normalizations and the all-component Betti–étale comparison. The source states the real and Galois equivariance of the rational splitting, but the suggested file currently represents only the connected Betti/group-cohomology model and generic naturality. Do not read its successful elaboration as a signature for Galois equivariance or for integral cohomology. The primary higher-weight separation source is now read (Shokurov Theorem 4.3 and Corollary 4.4); the remaining mathematical obligation is its exact transport from his homological polynomial representation to this packet’s cohomological row-adjugate action, including all components for Galois equivariance.

Needed by [L0/rational-hecke-separation](#L0-rational-hecke-separation), [L0/drinfeld-manin-splitting](#L0-drinfeld-manin-splitting).

### Exact certificates for the numerical critical-slope and level-11 examples

Pollack–Stevens Examples 8.6–8.7 and Pollack AWS §6 report computations. Reproduce the signed full-eigensystem lift certificates at p=3 and p=5, the slope-one kernel/dimension counts, and the level-11 p=11 coefficient precision certificate proving a zero constant and a unit linear term. Numerical observations alone do not prove the p=5 non-theta-critical hypothesis or an exact power-series identity. The suggested lift tests carry the actual unique-lift certificate as input; the trivial-zero test carries exact coefficient/unit hypotheses. The eta-product coefficient tests are finite algebraic computations.

Needed by [L3/critical-slope-examples](#L3-critical-slope-examples), [L4/level-eleven-examples](#L4-level-eleven-examples).

## Corrections required by the source conventions

The following assertions are described in our own words. No source passage is reproduced. E1–E8 refer to the published Pollack–Stevens article; E9 refers only to Bellaïche’s arXiv-v1 text; E10 is corrected in Sprung’s published paper.

### E1

Theorem 2.6 and Corollary 2.7, p. 12; Theorem 2.9 and Corollary 2.10, pp. 13–14 (Numdam PDF of the published article; printed page = PDF page − 1). The boundary relation has the opposite translation sign, and that sign propagates into the generator-value criterion.

**Correction:** The relation is Σ_i (γ_i^{-1} − 1)D_i + Σ_i D′_i (+ Σ_i D″_i) = (1 − (1 −1; 0 1))D∞, and the criterion of Corollaries 2.7/2.10 is v∞|Δ = Σ_i v_i|(1 − γ_i) − Σ_i v′_i (− Σ_i v″_i), with Δ = (1 1; 0 1) − 1.

**Check:** Apply ∂ to the boundary relation printed on p. 11, (1 − (1 −1; 0 1))e∞ + Σ(1 − γ_i^{-1})e_i + Σe′_i ∈ J, with D∞ = ∂e∞, D_i = ∂e_i, D′_i = −∂e′_i: this gives (1 − T^{-1})D∞ + Σ(1 − γ_i^{-1})D_i − ΣD′_i = 0, the corrected relation. Smallest check: Γ = Γ₀(2), F the ideal triangle with vertices −1, 0, ∞, t = 0, s = 1, γ′₁ = (1 1; −2 −1), e′₁ the path from 0 to −1; then D′₁ = {0} − {−1} = (1 − T^{-1})({0} − {∞}), whereas the printed relation gives D′₁ = −(1 − T^{-1})({0} − {∞}) = −D′₁, i.e. 2D′₁ = 0 in the torsion-free group Δ₀. Pollack's own Arizona Winter School notes (2011, §2.6, footnote 10) write the Γ₀(11) relation with the corrected sign, (1 − (1 −1; 0 1))({0} − {∞}) + Σ(1 − γ)D = 0 (their γ is γ_i^{-1}), and the Sage implementation (sage.modular.pollack_stevens, by Pollack and Hanke) solves μ|Δ = t with t = Σ v_i|(γ_i − 1) minus the torsion values and sets v∞ = −μ.

### E2

§2.4, p. 11 (the relations for one-element orbits). The two-term edge relation uses the edge of a paired orbit instead of the edge fixed by the order-two stabilizer.

**Correction:** (γ′_i + 1)e′_i ∈ J (the relation is on the one-element-orbit edge e′_i, whose reverse is γ′_i e′_i).

**Check:** The sentence concerns the edges e′_i fixed (up to reversal) by γ′_i; e_i denotes the two-element-orbit edges, for which no such relation holds. Theorem 2.6 states the intended (1 + γ′_i)D′_i = 0.

### E3

Corollary 2.10, p. 14. The order-three condition drops its identity term, and the specified values of the two exceptional orbit types are interchanged.

**Correction:** v″_i|(1 + γ″_i + (γ″_i)²) = 0, and φ(D′_i) = v′_i, φ(D″_i) = v″_i.

**Check:** Theorem 2.9 has the three-term relation (1 + γ″_i + (γ″_i)²)D″_i = 0 with γ″_i throughout, and the symbols m′_i, m″_i are not defined anywhere; the data are the v′_i, v″_i of the corollary's hypothesis.

### E4

§6.2, (1) and (2), p. 27 (Numdam PDF of the published article; printed page = PDF page − 1). The displayed interpolation expression and the subsequent local-distribution definition disagree on the minus component with the same period choices.

**Correction:** With the same periods Ω^±, the distribution (2), which Proposition 6.3 identifies with Φ_f({∞} − {0})|_{ℤ_p^×}, satisfies μ_f(z^j·χ) = α^{−n}p^{nj}·τ(χ)·j!/(2πi)^j·L(f, χ^{−1}, j + 1)/Ω^±_f with ± = (−1)^jχ(−1) (n ≥ 1). This is (1) multiplied by ±, so (1) holds for (2) after replacing Ω^−_f by −Ω^−_f.

**Check:** Sum (2) against χ(a): with I_j(x) = 2πi∫_{i∞}^x f(z)(z − x)^j dz and S = Σ_aχ(a)I_j(a/p^n), (2) gives α^{−n}p^{nj}(−1)^jS/Ω^± on the active sign, since Σ_aχ(a)I_j(−a/p^n) = χ(−1)S. The twisted Mellin formula S = τ(χ)j!/(−2πi)^jL(f, χ^{−1}, j+1) (this packet's L1/twisted-mellin-formula, checked numerically with non-real characters) and τ(χ)τ(χ^{−1}) = χ(−1)p^n show that (1) equals χ(−1)α^{−n}p^{nj}S/Ω^±. The ratio (1)/(2) is χ(−1)(−1)^j = ±, which is −1 on the −-part.

### E5

§6.2, (1), p. 27 (Numdam PDF of the published article; printed page = PDF page − 1). The unramified interpolation case omits the factor produced by restricting a distribution from Z_p to its units.

**Correction:** For n = 0 (χ trivial, conductor 1) the right side needs the factor (1 − p^j/α): μ_f(z^j) = (1 − p^j/α)·j!/(2πi)^j·L(f, j + 1)/Ω^± (with E4's sign), where f is the U_p-eigenform of level Γ₀. For f the p-stabilisation of a newform f° of level prime to p, L(f, j + 1) = (1 − ε(p)p^{k−j}/α)L(f°, j + 1) gives the second Euler factor.

**Check:** By the distribution relation in the proof of Proposition 6.3 (with a = 0, n = 1), Φ_f({∞} − {0})(z^j·1_{pℤ_p}) = α^{−1}p^jΦ_f({∞} − {0})(z^j), so restricting to ℤ_p^× multiplies the value on ℤ_p by 1 − p^j/α, and the value on ℤ_p is (2) with n = 0. Since p^j/α ≠ 0, the factor is never 1; for 11a1 at p = 3 with k = j = 0, (1) and the restriction differ by 1 − 1/α while L(f, 1) ≠ 0. RJW Theorem B.1 (this packet's L1/rjw-b1-comparison) carries the factor (1 − χ(p)p^j/α_p), which is 1 − p^j/α_p exactly for n = 0.

### E6

§6.4, Proposition 6.5, (3), p. 29 (Numdam PDF of the published article; printed page = PDF page − 1). The L-value argument in the j-th-moment formula is fixed at one instead of varying with j.

**Correction:** L(f, χ^{−1}, j + 1) in place of L(f, χ^{−1}, 1); as for (1), the sign of E4 and the n = 0 factor of E5 also apply.

**Check:** The proposition is said to be 'a formal consequence ... as in Proposition 6.3', whose computation produces the value at s = j + 1, as in (1); the left side varies with j while L(f, χ^{−1}, 1) does not.

### E7

§6.4, Definition 6.4, p. 29 (Numdam PDF of the published article; printed page = PDF page − 1). The coefficient weight of the cusp form is stated using the polynomial degree instead of degree plus two.

**Correction:** f ∈ S_{k+2}(Γ₀, ℚ̄_p).

**Check:** Slope k + 1 is the critical slope for weight k + 2; θ_k takes weight −k to weight k + 2 (the paragraph before Theorem 5.14), and Theorem 5.14 states the hypothesis for 'an eigenform of S_{k+2}(Γ₀, ℚ̄_p) with slope k + 1'.

### E8

§3.3, pp. 16–17, and the proof of Lemma 6.2, p. 27 (Numdam PDF of the published article; printed page = PDF page − 1). The action and contraction claims are extended to radii where the fractional transformation has a pole.

**Correction:** Both hold for r < p (every r ∈ |ℂ_p^×| is allowed in §3.1); for r ≥ p the formula does not preserve A[r].

**Check:** For r ≥ 1, B[ℤ_p, r] is the closed disc of radius r about 0. Take γ = (1 0; p 1) ∈ Σ₀(p), k = 0 and f(z) = z: γ ·₀ f = z/(1 + pz) has a pole at −1/p, of absolute value p, which lies in B[ℤ_p, r] when r ≥ p. For r < p, a + cz is a unit on B[ℤ_p, r] and the action and the contraction hold.

### E9

§1.4.3, (5), p. 8 (arXiv v1). The arXiv-v1 formula labels the beta refinement but uses the other root in its Euler denominators. The published journal version has not been compared.

**Correction:** e_p(β, ϕt^j) = β^{−ν}(1 − ϕ̄(p)ε(p)p^{k−j}/β)(1 − ϕ(p)p^j/β): the factors of the refinement f_β have β, its U_p-eigenvalue, in the denominators.

**Check:** For the refinement f_β (U_p f_β = βf_β, v_p(β) = k + 1 at critical slope), the distribution contributes 1 − ϕ(p)p^j/β and the p-stabilisation L(f_β, s) = (1 − αp^{−s})L(f, s) contributes 1 − ϕ̄(p)ε(p)p^{k−j}/β at s = j + 1 (using αβ = ε(p)p^{k+1}); the prefactor β^{−ν} already has β. With α the formula would be that of the other refinement f_α (Mazur–Tate–Teitelbaum).

Correction provenance: new: arXiv v1 is the only arXiv version; the Inventiones text was not obtained

### E10

§4.3, Lemma 4.6, p.539. The weight-two half-logarithms are asserted to be invariant when the multiplicative variable is inverted.

**Correction:** Inversion has the nonconstant binomial unit factors (1+T)^{p/(p+1)} and (1+T)^{1/(p+1)} for the original even and odd products.

**Check:** The cyclotomic reciprocal identity accumulates the degrees p^{m−1}(p−1). Their p-adic sums give nonzero exponents. The nonzero linear coefficients also rule out invariance.

Correction provenance: published correction

## Source editions and reading map

Locators above belong to the editions below. Byte-level hashes and reading provenance are retained in the packet for reproducibility. A theorem attributed to an expository source is not presented as originally proved by that source.

### [Overconvergent modular symbols and p-adic L-functions](https://www.numdam.org/item/10.24033/asens.2139.pdf)

Robert Pollack and Glenn Stevens. Annales scientifiques de l'École normale supérieure (4) 44 (2011), no. 1, 1–42, DOI 10.24033/asens.2139; Numdam open-access PDF (43 pages; printed page = PDF page − 1)

Read locators: §1.1–1.8 (introduction and outline); §2.1 Basic definitions and §2.2 The Manin relations, pp. 6–8; §2.3 Fundamental domains, §2.4 Solving the Manin relations, §2.5 The case of three-torsion and §2.6 Computing with modular symbols in practice, pp. 9–14 (read on the page images at the displayed relations); §3.4 Finite-dimensional quotients, p. 17; §5.1 Explicit lifts of classical symbols (Theorem 5.1 and its proof), pp. 21–22; §6 opening: the interpolation property (1), p. 27 (read on the page image); §3.1–3.3 (the spaces A[r], D[r], D(ℤ_p), D†, Proposition 3.1, the weight-k action of Σ₀(p)), pp. 15–17; §4 (Proposition 4.2, Lemmas 4.3–4.4, Theorem 4.5, Remark 4.6), pp. 17–20; §5 opening and §5.1 after Theorem 5.1 (Remark 5.2, Lemma 5.3, Corollary 5.4), pp. 20–22; §5.2–5.4 (Lemma 5.5, Propositions 5.6–5.7, Theorem 5.9, Lemma 5.10, Theorem 5.12 and its proof, Remark 5.13, Theorem 5.14, Remark 5.15), pp. 23–26; §6.1–6.4 (Definition 6.1, Lemma 6.2, (1), (2), Proposition 6.3 and its proof, Definition 6.4, Proposition 6.5), pp. 27–29; the displayed formulas were read on the page images; §8, the examples for X₀(11) at p = 3 and p = 5 (Example 8.7), pp. 35–36, and the closing remark on μ-invariants, p. 41; References, p. 42; §5.4 Theorem 5.14 and Remark 5.15, pp. 25–26; §6.4 Definition 6.4, Proposition 6.5, p. 29; §8.4 Examples 8.6–8.8, pp. 35–36..

### [Computational Arithmetic of Modular Forms (course notes)](https://arxiv.org/pdf/1809.04645v1)

Gabor Wiese. arXiv:1809.04645v1 (12 September 2018), 81 pages; printed page = PDF page. Also published in Modular Forms and Related Topics in Number Theory (Springer, 2019); the arXiv version was read.

Read locators: §1.2 The modular symbols formalism, pp. 6–12 (Definition 1.5, the modules V_n and V_n^χ, Hecke and diamond operators, Propositions 1.6 and 1.8, Theorem 1.9); §4.3–4.5 Mayer–Vietoris for PSL₂(ℤ), parabolic group cohomology and dimension computations, pp. 47–52 (Corollary 4.12, Lemma 4.13, Proposition 4.14, Lemma 4.15, Proposition 4.16); §5 Modular symbols and Manin symbols, pp. 54–58 (Proposition 5.1, Lemma 5.2, Proposition 5.3, Theorem 5.7, Theorem 5.9); §6 Eichler–Shimura, pp. 59–71 (Definition 6.2, Propositions 6.3–6.9, 6.13, 6.14, Theorem 6.15); §7.3–7.5 Hecke operators on group cohomology and compatibility, pp. 75–80 (Definition 7.21, Proposition 7.22, Definition 7.23, Proposition 7.24, Corollaries 7.31 and 7.33).

### [Overconvergent modular symbols (Arizona Winter School 2011 lecture notes)](https://swc-math.github.io/aws/2011/2011PollackNotes.pdf)

Robert Pollack. Lecture notes, Arizona Winter School 2011, 29 pages, hosted by the Southwest Center for Arithmetic Geometry; printed page = PDF page.

Read locators: §2.2–2.9 Modular symbols and L-values, pp. 3–11 (the Γ₀(11) fundamental-domain relation in footnote 10, the weight-k symbol ψ_f in §2.7, the L-value formula in §2.8, the general definitions in §2.9); §2.1 formula (2), p. 3; §2 (after 2.10) the measure μ_f and its interpolation, p. 13; §5.1 formula (7), p. 24 (formulas read on the page images, since text extraction drops the bars); §6 Some examples (level 11, p = 11), pp. 27–28..

### [An introduction to p-adic L-functions](https://arxiv.org/pdf/2309.15692v2)

Joaquín Rodrigues Jacinto and Chris Williams. arXiv:2309.15692v2 (19 December 2024), 85 pages; expository notes. Printed page = PDF page. The roadmap cites its Theorem B.1 as 'RJW B.1'.

Read locators: Definition 5.2 and Remark 5.3 (Gauss sums), pp. 29–30; Appendix B.1–B.2 (Theorem B.1 read on the page image, since text extraction drops the bars), pp. 79–80.

### [Critical p-adic L-functions](https://arxiv.org/pdf/0912.2925v1)

Joël Bellaïche. arXiv:0912.2925v1 (15 December 2009), 44 pages; published in Invent. Math. 189 (2012), 1–60.

Read locators: §1.4 (Theorems 1–3, (4)–(5), Corollary 1, §1.4.5), pp. 5–11..

### [On the p-adic L-function of a modular form at a supersingular prime](https://math.bu.edu/people/rpollack/Papers/On_the_padic_Lfunction_of_a_modular_form_at_a_ss_prime.pdf)

Robert Pollack. Duke Math. J. 118 (2003), no. 3, 523–558; the published article as posted on the author's Boston University page (36 pages; printed page = PDF page + 522). The server's TLS chain did not verify, so the file was fetched without certificate verification; its hash is recorded.

Read locators: §1 Introduction (pp. 524–526); §2.2–2.3: the measures, Theorem 2.7, Proposition 2.8, Definition 2.9, Proposition 2.11 (pp. 529–532); §3: Lemma 3.2, Theorems 3.3 and 3.5, Corollary 3.6 (pp. 532–535); §4: Lemma 4.1, Corollaries 4.2–4.3, Lemmas 4.5–4.8 (pp. 535–540); §5.1–5.2.2: Theorem 5.1, Lemma 5.2, Remarks 5.3–5.5, Theorem 5.6, Remark 5.7 (pp. 540–543); §7 Table 1 (pp. 555–556).

### [Zeta morphisms for rank two universal deformations](https://link.springer.com/content/pdf/10.1007/s00222-023-01203-7.pdf)

Kentaro Nakamura. Inventiones mathematicae 234 (2023), 171–290, DOI 10.1007/s00222-023-01203-7; published open-access PDF, printed page = PDF page + 170

Read locators: §3.1.1–3.1.2, pp. 202–207: the full-level curve, coefficient systems, usual and adjoint Hecke conventions, (5)–(8) and Lemma 3.1; §3.2 opening, p. 220: rational Drinfeld–Manin splitting, (20)–(21), real and Galois equivariance; references [12], [20] and [28].

### [Le théorème de Manin-Drinfeld](https://www.numdam.org/item/AST_1990__183__59_0.pdf)

Renée Elkik. Astérisque 183 (1990), 59–67; Numdam published scan, printed page = PDF page + 57

Read locators: Introduction, pp. 59–60; §I, pp. 60–62; §II, pp. 62–64; §III, pp. 64–66; bibliography, p. 67. This is the weight-two, trivial-local-system proof..

### [Modular curves and cyclotomic fields](https://swc-math.github.io/aws/2018/2018SharifiNotes.pdf)

Romyar Sharifi. Arizona Winter School 2018 lecture notes, publicly posted PDF; printed page = PDF page

Read locators: §3.4, pp. 34–38: boundary sequence, Betti/group comparisons, Poincaré duality and the adjoint Hecke action, higher-weight modular symbols, Theorem 3.4.10, Theorem 3.4.16 and Remark 3.4.17; bibliography entries [Sho1] and [Sho2]. The cited Shokurov source was subsequently read on 2026-10-11; its coefficient transport remains the explicit dictionary gap..

### [Shimura integrals of cusp forms](https://www.maths.ed.ac.uk/~icheltso/shokurov/pdf/cusp.pdf)

V. V. Shokurov. Math. USSR Izvestija 16 (1981), 603–646, English translation of Izv. Akad. Nauk SSSR Ser. Mat.44 (1980). Author-hosted published scan; PDF page 2 is printed p.603.

Read locators: §0, pp.603–607: polynomial coefficients and scope; §3.3–3.4, pp.634–635: duality; §4.2–4.5, pp.636–641: Theorem 4.3 and Corollaries 4.4–4.5 with their proofs.

### [On pairs of p-adic L-functions for weight-two modular forms](https://msp.org/ant/2017/11-4/ant-v11-n4-p04-s.pdf)

Florian Sprung. Algebra & Number Theory 11 (2017), no.4, 885–928; published open-access PDF; PDF page 2 is printed p.885.

Read locators: §4, Proposition 4.25 and Lemma 4.26, pp.907–908.

### [A p-adic analogue of the conjecture of Birch and Swinnerton-Dyer for modular abelian varieties](https://arxiv.org/pdf/1210.2739)

Jennifer S. Balakrishnan, J. Steffen Müller and William A. Stein. Author preprint arXiv:1210.2739, §2.1, pp.5–7. Its Shimura-period theorem is weight two and totally real; no higher-weight or CM claim is attributed to it.

Read locators: §2.1, Theorem 2.2 and period ambiguity, pp.5–7.

## Suggested-file boundary

The file gives every packet definition/construction API and every named test as a typed declaration, with anonymous test examples. It imports individual pinned Mathlib and Tau Ceti modules. The native cusp-form, newform, q-expansion and degeneracy carriers are used directly. Imported Div⁰/Manin/period and locally analytic topology stand-ins are labeled by their owner. Their types specify actual kernels, representations, integrals, analytic tests, continuous duals, finite-presentation conditions or moment spaces. No object is replaced by an opaque proposition.

The named control, small-slope lift, local interpolation, critical non-uniqueness, rational separation, family identity, Euler comparison, half-logarithm and analytic-division signatures exercise the central interfaces. Where the supplier carrier is richer, the document remains definitive: the top-secondary and full two-variable distributions, tame inverse-limit distribution and elliptic-period integral theorem are exported through the supplier contracts, rather than asserted using substitute flags. Exact numerical examples need the certificates specified above. Successful elaboration checks types and names; it does not discharge the mathematical statements.
