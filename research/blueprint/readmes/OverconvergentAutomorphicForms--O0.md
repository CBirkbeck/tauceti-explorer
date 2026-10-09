# Overconvergent Hilbert modular forms and analytic coefficients

This target-level specification covers O0–O7. It builds Hilbert weight and coefficient interfaces, independent geometric and AIP sheaves, arithmetic descent, cuspidal Hecke operators and ordinary Igusa comparisons. Every stage target has a declaration whose direct inputs lead to pinned library declarations, named supplier nodes, precise supplier requests or explicit gaps. The mathematical planning pass covers all eight stages; this revision is a partial checkpoint because supplier-dependent signatures remain missing. All eight stages are planned and none is closed. All implementation statuses remain unchecked.

The [packet](../packets/OverconvergentAutomorphicForms--O0.json), [suggested Lean file](../suggested/OverconvergentAutomorphicForms--O0.lean) and [handoff](../handoff/BP-OverconvergentAutomorphicForms--O0~3.md) describe the same declarations. The prototype types the weight and algebraic cocycle cores, arbitrary-rank pointwise valuation translation, finite coefficient algebraic prerequisites and the ordered affine ring completion. The latter two use auxiliary namespaces and do not substitute for the analytic coefficient or completed ordinary sheaf definitions. Genuine geometric and analytic signatures whose supplier carriers are absent are explicitly listed as omissions; their commented mathematical contracts are not elaborated examples.

Independent review [REV-OverconvergentAutomorphicForms--O0~2](../reviews/REV-OverconvergentAutomorphicForms--O0~2.md) records `needs_changes`. The remaining acceptance failure is missing typed geometric/analytic declarations, API lemmas and examples required by PROTOCOL §13. The mathematical assessments and conditional supplier contracts are recorded node by node; the successful Lean run checks the typed cores and scalar fixtures only.

The new valuation signature assumes that the admitted character value and its inverse have valuation at most one; the analytic admission proof remains required. It uses Mathlib’s valuation and integer-subring carriers and quantifies over dependent families of ordered valuation groups. Its finite-order argument has no prime-to-p restriction. Six examples include the lexicographically ordered rank-two value group, sign, prime-power torsion and a multiplier whose inverse is nonintegral. The affine completion forms actual finite-level quotient rings, their direct limits and then compatible precision families; its constant-tower comparison uses Mathlib’s adic completion. These signatures establish the algebraic interfaces, with proof bodies still unchecked.

## Conventions and ownership

Let F be totally real, g=[F:Q], and p any rational prime, including ramified primes. Set O_p=Z_p⊗_Z O_F, with scalars on the left and the Z_p-module topology. Real and p-adic embeddings have different indexing types; algebraic comparisons use a specified splitting coefficient field. Work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity, with sufficiently small tame level prime to p. Products with smooth rigid weight bases are the supplied sousperfectoid products; a smooth weight product need not itself be perfectoid.

Universal compact-torus character spaces belong to PadicMeasuresIwasawaAlgebras L0a. Analytic functions, Lie charts, induction norms, LB colimits and strong duals come from LocallyAnalyticDistributions and AdicSpacesPartII. Classical associated bundles and expansions belong to AutomorphicBundles. Hilbert moduli, quotient groups and polarisation transports belong to HilbertModularVarietiesAndShimuraCurves; canonical domains, modified differential lattices and frame maps to HodgeTateAndCanonicalSubgroups; towers and pairings to PerfectoidShimuraVarieties. PerfectoidSpaces P9 owns generic coefficient/function descent and the completion comparisons. This part specialises their exact interfaces, without rebuilding their objects.

A geometric weight is κ:O_p×→A×; an arithmetic weight is (w,t) on O_p××Z_p×. Their relation is κ(x)=w(x)²t(N(x))⁻¹. The dual group map is x↦(x²,N(x)⁻¹). For a totally positive global unit η, N(η)=1 and κ(η)⁻¹w(η²)=1. AIP's plus-norm arithmetic convention is converted by ν=w and w_AIP=t⁻¹.

The reusable vector convention is a right action xγ, with J(γδ,x)=J(γ,x)J(δ,xγ), and f(xγ)=ρ(J(γ,x)⁻¹)f(x). Matrix factors retain their order. Gauge transport is J′(γ,x)=b(x)⁻¹J(γ,x)b(xγ), f′(x)=ρ(b(x)⁻¹)f(x). The Hilbert source instead uses a left action: j(γδ,x)=j(γ,δx)j(δ,x) and f(γx)=κ(j(γ,x))⁻¹f(x). For a left coefficient cocycle K the right adapter is xγ=γ⁻¹x, J(γ,x)=K(γ⁻¹,x)⁻¹, inverting both group and coefficient. The p=3 lower-unipotent/diagonal fixture gives 7 for the left formula and 4 for the unconverted right formula.

Finite projective analytic coefficients use the baseline Representation for their algebraic action, plus specified analytic orbit maps on Lie charts and a canonical Banach topology. A stable integral lattice is extra data. Their algebraic duals are contragredient. Analytic induction is usually infinite-dimensional: functions live on the actual adic Iwahori thickening of BP's closed subgroup M_1, which need not be open or Zariski dense. The ordinary strong Banach dual differs from BP's projective distribution module, obtained from the compact-open dual of bounded analytic functions on an open polydisc. The algebraic representation embeds properly in analytic induction; its finite twist is the source's inverse Weyl-conjugated character, with the kernel and monoid hypotheses retained.

## Domains and integral comparison contracts

Boundedness means that the family maps into one affinoid of weight space. Smoothness concerns its rigid base, not its weight map. The pro-p diagnostic T_pro(κ)=sup_{x∈1+p^{r₀}O_p}‖κ(x)−1‖, r₀=1 for odd p and 3 for p=2, is distinct from both an analytic extension radius and AIP's universal-coordinate parameter. AIP Proposition2.8 supplies an admitted common analytic neighbourhood; no numerical radius is deduced from BHW's disproved formula. Uniqueness uses analytic identity on small lattice products.

For an admitted B_r(O_p×:1), choose m≥1 with p^(−m)≤r<1. The Hodge–Tate domain has ε≤1/(c_p p^m), with c_p=2 for p≥5, 3 for p=3 and 4 for p=2. For the T5 frame lift also require ε_base≤p^(−(m+1)), with its scaled source separately admitted. Intersect these bounds with the actual AIP chart inequalities. Atkin–Lehner transport is AL_n:X_{Γ0*(p^n)}(p^nε)_a≅X(ε); n=0 uses AL_1, including its radius scaling. The trivial weight gives O, while the norm weight gives the determinant differential line.

O3 defines the integral eigenfunction equalizer before proving local freeness. At ramified non-Rapoport points, the modified differential lattice on the Igusa cover is needed; a rank-one O_F⊗O+ lattice on that cover does not by itself descend to a base line. Integral base change retains its flat/formal-chart assumptions. AIP CUSP Remark3.15 distinguishes rational weight base change from unrestricted integral finite-character invariants.

O5 keeps three statements distinct. First, AIP Propositions4.3/4.7 give a universal-character formal line on W_F^0 and its chart transports. Second, §6.4 retains the finite-character factor wχ on the normalized Igusa cover: it is coherent integrally and invertible rationally and on the ordinary locus. Third, positive-radius analytic O+ freeness for a full character requires an additional integral trivialization criterion; it is not a consequence of those rational statements.

The rational AIP/perfectoid comparison comes from evaluation at the actual Hodge–Tate frame. Its integral refinement compares two equalizers without presupposing their freeness. Every valued AIP frame, after a valued extension, is a B_m-translate of a lifted Hodge–Tate frame. Both κ(b) and κ(b)⁻¹ are integral units on the admitted torsor: the small analytic factor is congruent to one, and the finite factor has finite order. Thus h(b·s(x))=κ(b)⁻¹h(s(x)) preserves pointwise integrality. The pointwise definition of O+ shows that the rational comparison and its inverse restrict to the integral equalizers. This uses the actual torsor and sheafwise descent on every open of the weight product, not merely a set-function model or product-affinoid equality.

To prove full-character integral freeness, supply a base-local eigenfunction e with e and e⁻¹ in the cover O+, and unit chart ratios. Then g/e is integral and invariant; The requested geometric O+ invariant-functions criterion for the analytic B_n frame torsor identifies the eigenmodule with eO+ of the base. P9’s existing named criterion is for a completed lattice tensor; it is an algebraic model for this argument and does not identify that tensor with product O+. Existence of those positive-radius trivializations for arbitrary χ remains a precise supplier input. Unit-valued translation multipliers alone do not supply a unit-valued eigenfunction.

O7 constructs lim_m colim_i O(𝔐_i)/p^m on formal affine patches and sheafifies, keeping this order. Heuer Proposition3.8 gives a natural map to analytic O+ and formal-unit cocycle effectivity. An isomorphism needs more. For the actual ordinary tower request flat formally smooth charts, finite étale surjective Igusa covers, R_i=A_i° after coefficient extension, isometric spectral-norm pullbacks, and an analytic affine tower with A∞ the separated norm completion of colim_i A_i. Under these contracts, a finite-level approximation within error <1 of a bounded element is itself bounded, hence integral; the unit ball is the p-adic completion of the integral union. Power-multiplicativity identifies it with A∞°. Reduced special fibres prove the finite-level norm criterion at a discretely valued model; arbitrary normal models do not suffice. The tower is not assumed perfectoid simply because L is perfectoid. Weight-lattice tensors retain a separate comparison with geometric product O+.

## Layer targets and acceptance

O0 specialises Hilbert weights and analytic coefficient representations and includes Ding's definite-unitary consumer. Ding §4.2.2 uses lim_k colim_{U_p} coefficients with the inverse algebraic action and an admissible Banach representation whose restriction to H is C(H,E)^s with s≥1. Its Jacquet–Emerton eigenvariety geometry belongs to the requested PadicFamilies Part II, rather than the compact-operator eigenvariety engine.

O1 constructs right vector cocycles, equalizer sheaves, gauge changes and coefficient operations. Analytic line effectivity uses Heuer's line-specific dense-open criterion over a perfectoid extension of Q_p and a cocycle in completed formal structural units. General analytic O+ units are not substituted for formal units. O2 pins the Hilbert factor cz+d, left cocycle law, actual domains, levels and algebraic specialisations. O3 supplies integral equalizers, fixed-radius sections and the radius colimit with conditional integral pullbacks.

O4 defines the geometric small/full and arithmetic intermediate/full presentations independently before comparing them. Finite Δ(N) and profinite Δ(p∞N) are different quotients. The arithmetic intermediate action is ε·_w f=w(ε)(ε⁻¹)*f; the full comparison uses f↦w(eβ)⁻¹π∞*f. Positive-unit relations and explicit polarisation transports produce the polarisation-class forms. Arithmetic Hecke operators are independent of class representatives; geometric operators retain their specified conjugations.

O6 distinguishes boundary extension from cusp vanishing. Koecher requires g>1, with a separate g=1 cusp calculation. Cusp forms use the boundary ideal. The Banach (Pr) property means a continuous summand of an orthonormalisable module, rather than finite projectivity. Use an admissible open arithmetic weight affinoid and the actual cofinal global-Hasse minimal affinoids; finite wild level is transported with its scaled Atkin–Lehner map and boundary ideal. An arbitrary bounded weight pullback requires a further completed scalar-extension result. Formal cusp cohomology remains a compactification Part II input. Tame T_a has normalizer 1/q_a but correspondence degree q_a+1, while wild U_𝔭 has degree q_𝔭 and normalizer 1/q_𝔭. The controlling product ∏U_𝔭^{e_𝔭} improves all p-directions and factors through completely continuous restriction, with total normalizer p^(−g). An individual partial operator need not be controlling. Multiplication by q_𝔭, or p^g for the product, gives the stated sufficient integral renormalization, with no optimality claim.

O7 identifies ordinary coefficient models and their compatible restriction, Hecke and expansion diagrams. Weighted functions satisfy f(tu)=κ(u)⁻¹f(t). Neither the entire ordinary Hida space nor a Hida control theorem is inferred from this coefficient comparison. A non-quasicompact ordinary base keeps patchwise completion and sheafification; its sections need not share one global finite Igusa level.

## Declaration plan

Each declaration below includes its exact contract, direct inputs, proof steps and source matches. Definitions and constructions include the complete API and discriminating test contracts. These statements, names and tests agree with the packet.


### OverconvergentAutomorphicForms:O0

Hilbert torus weights, bounded extension, finite/vector coefficients, analytic induction and Ding’s independent unitary consumer.

#### Units at p of a number field

**ID:** `OverconvergentAutomorphicForms:O0/units-at-p`. **Kind:** definition.

**Statement.** For a number field F and a prime p, 𝒪_p := ℤ_p ⊗_ℤ 𝒪_F with its ℤ_p-algebra structure from the left factor and the ℤ_p-module topology. It is a finite free ℤ_p-module of rank [F : ℚ], a compact topological ring, and T(ℤ_p) := 𝒪_p^× (with the units topology) is BHW's T(ℤ_p) for T = Res_{𝒪_F|ℤ} G_m.

**Proposed declaration:** `TauCeti.HilbertWeight.Op`.

**Hypotheses.**

- No hypothesis on how p decomposes in F: 𝒪_p is the product of the completed local rings at the primes above p, not assumed unramified or split.
- Scalars on the left, so that the pinned base-change instances apply.

**Direct inputs.**

- `mathlib:TensorProduct`
- `mathlib:NumberField.RingOfIntegers`
- `mathlib:PadicInt`
- `mathlib:Algebra.TensorProduct.leftAlgebra`
- `mathlib:Module.Finite.base_change`
- `mathlib:Module.Free.tensor`
- `mathlib:moduleTopology`
- `mathlib:IsModuleTopology`
- `mathlib:IsModuleTopology.isTopologicalRing`
- `mathlib:IsModuleTopology.continuous_of_linearMap`
- `mathlib:Module.finrank_baseChange`
- `mathlib:NumberField.RingOfIntegers.rank`
- `mathlib:PadicInt.compactSpace`
- `mathlib:Rat.ringOfIntegersEquiv`

**Proof outline.**

1. Define Op F p := ℤ_[p] ⊗[ℤ] 𝓞 F; its ℤ_p-algebra structure is Algebra.TensorProduct.leftAlgebra.
2. Module.Finite from Module.Finite.base_change and Module.Free from Module.Free.tensor, since 𝓞 F is finite free over ℤ.
3. Give it moduleTopology ℤ_[p] (an IsModuleTopology instance); it is a topological ring by IsModuleTopology.isTopologicalRing.
4. Rank: Module.finrank_baseChange with NumberField.RingOfIntegers.rank. Compactness: a ℤ_p-basis identifies 𝒪_p with ℤ_p^n by a linear equivalence, which is a homeomorphism for module topologies (IsModuleTopology.continuous_of_linearMap), and ℤ_p is compact (PadicInt.compactSpace).
5. The unit locus is clopen and compact: a finite-free multiplication determinant is a unit in Z_p exactly when the element is invertible (adjugate/Cayley–Hamilton). Its continuous inverse image of Z_p^× identifies with O_p^×, including the units topology and continuous inverse.

**Source matches.**

- [BHW-2023](https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf), §6.1, Definition 6.1, printed p. 1756: T(ℤ_p) = (𝒪_F ⊗ ℤ_p)^× is the group whose characters form the weight spaces.

**Uses.**

- BHW §6.1 and §5 (𝒪_p = 𝒪_F ⊗ ℤ_p throughout): the torus T(ℤ_p) = 𝒪_p^× whose characters are the geometric weights, and 𝒪_p ⊂ Res_{𝒪_F|ℤ} P^1 on which the Hodge–Tate period map lands.
- OverconvergentAutomorphicForms:O0/geometric-weight-characters: the source group of weights.

**API.**

- `TauCeti.HilbertWeight.compactSpace_Op` (other): 𝒪_p is compact.
- `TauCeti.HilbertWeight.finrank_Op` (characterisation): finrank_{ℤ_p} 𝒪_p = [F : ℚ].
- `TauCeti.HilbertWeight.unitsToOp` (coercion): The map 𝒪_F^× → 𝒪_p^×, η ↦ 1 ⊗ η.

**Unit tests.**

- `op_rat` (compatibility): 𝒪_p ≅ ℤ_p for F = ℚ.
- `op_not_discrete` (non-example): 𝒪_p is not discrete.
- `op_split` (compatibility): For F = ℚ(i) and p = 5, 𝒪_p ≅ ℤ_5 × ℤ_5.

**Acceptance.**

- F = ℚ: 𝒪_p ≅ ℤ_p as ℤ_p-algebras, via Rat.ringOfIntegersEquiv.
- The topology is not discrete; a definition by the discrete topology would make every character continuous and the weight space far too large.
- F = ℚ(i), p = 5: 𝒪_p ≅ ℤ_5 × ℤ_5, and T(ℤ_5) = (ℤ_5^×)², matching Res_{𝒪_F|ℤ} G_m at a split prime.

#### The norm on units at p

**ID:** `OverconvergentAutomorphicForms:O0/norm-at-p`. **Kind:** construction.

**Statement.** N : 𝒪_p^× → ℤ_p^× is the norm Algebra.norm ℤ_p (the determinant of multiplication on the free ℤ_p-module 𝒪_p), restricted to units. It is a continuous homomorphism, and N(1 ⊗ a) = N_{F/ℚ}(a) for a ∈ 𝒪_F.

**Proposed declaration:** `TauCeti.HilbertWeight.normUnits`.

**Hypotheses.**

- 𝒪_p finite free over ℤ_p (units-at-p).

**Direct inputs.**

- `OverconvergentAutomorphicForms:O0/units-at-p`
- `mathlib:Algebra.norm`
- `mathlib:Units.map`
- `mathlib:Algebra.norm_apply`
- `mathlib:LinearMap.det`
- `mathlib:LinearMap.det_baseChange`
- `mathlib:IsModuleTopology.continuous_of_linearMap`

**Proof outline.**

1. Units.map of the monoid hom Algebra.norm ℤ_[p] : 𝒪_p →* ℤ_p.
2. Continuity: in a ℤ_p-basis the norm is a polynomial in the coordinates (Algebra.norm_apply, LinearMap.det), and coordinates are continuous for the module topology.
3. Compatibility: multiplication by 1 ⊗ a is the base change of multiplication by a on 𝒪_F, so its determinant is N_{F/ℚ}(a) (LinearMap.det_baseChange).

**Source matches.**

- [BHW-2023](https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf), §6.1, Definition 6.1, printed p. 1756: N_{F/ℚ} on T(ℤ_p), used in the weight map; here constructed as the norm of 𝒪_p over ℤ_p.

**Uses.**

- OverconvergentAutomorphicForms:O0/weight-dual-group-map: the second coordinate x ↦ N(x)^{-1}.

**API.**

- `TauCeti.HilbertWeight.continuous_normUnits` (other): N is continuous.
- `TauCeti.HilbertWeight.norm_tmul_one` (compatibility): N(1 ⊗ a) = N_{F/ℚ}(a).
- `TauCeti.HilbertWeight.normUnits_unitsToOp` (compatibility): N(1 ⊗ η) = N_{F/ℚ}(η) in ℤ_p for a global unit η.

**Unit tests.**

- `norm_rat` (compatibility): For F = ℚ, N is the identity.
- `norm_neg_one` (compatibility): N(−1) = (−1)^{[F:ℚ]}.
- `norm_not_trivial` (non-example): For [F:ℚ] odd, N is not the trivial character (N(−1) = −1).

**Acceptance.**

- F = ℚ: N is the identity of ℤ_p^×.
- N(−1) = (−1)^{[F:ℚ]}.
- N(1 ⊗ η) = 1 for a totally positive unit η of a totally real F (used by weight-comparison-totally-positive-units).

#### Principal units 1 + p^r 𝒪_p

**ID:** `OverconvergentAutomorphicForms:O0/principal-units`. **Kind:** construction.

**Statement.** For r ≥ 0, H_r := {x ∈ 𝒪_p^× : x − 1 ∈ p^r 𝒪_p} is an open subgroup of finite index of 𝒪_p^×; for r ≥ 1 it is a pro-p group, so it meets the prime-to-p torsion of 𝒪_p^× trivially.

**Proposed declaration:** `TauCeti.HilbertWeight.principalUnits`.

**Hypotheses.**

- r ∈ ℕ; H_0 = 𝒪_p^×.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O0/units-at-p`
- `mathlib:Subgroup`
- `mathlib:Ideal.span`
- `mathlib:Subgroup.FiniteIndex`
- `mathlib:IsModuleTopology`

**Proof outline.**

1. Closure under products and inverses: (1 + p^r a)(1 + p^r b) = 1 + p^r(a + b + p^r ab), and the inverse of a unit ≡ 1 mod p^r is ≡ 1 mod p^r.
2. Openness: p^r 𝒪_p is open in the module topology (a finite-index ℤ_p-submodule), and H_r is its translate intersected with the open units.
3. Finite index: 𝒪_p^×/H_r injects into (𝒪_p/p^r)^×, a finite group.
4. Pro-p for r ≥ 1: H_r/H_s is a p-group for s ≥ r, being filtered by the additive groups p^i 𝒪_p/p^{i+1} 𝒪_p.

**Source matches.**

- [BHW-2023](https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf), Definition 4.5(1), printed p. 1736: AIP's coordinate T lives on the pro-p part; the principal units are its Hilbert analogue.

**Uses.**

- OverconvergentAutomorphicForms:O0/weight-radius-parameter: the pro-p subgroup over which |T_κ| is taken.

**API.**

- `TauCeti.HilbertWeight.isOpen_principalUnits` (other): H_r is open.
- `TauCeti.HilbertWeight.finiteIndex_principalUnits` (other): H_r has finite index.
- `TauCeti.HilbertWeight.principalUnits_antitone` (relation): r ≤ s implies H_s ≤ H_r.

**Unit tests.**

- `principalUnits_zero` (compatibility): H_0 = 𝒪_p^×.
- `principalUnits_rat` (compatibility): F = ℚ, p odd: H_1 = 1 + pℤ_p has index p − 1.
- `principalUnits_root_of_unity` (non-example): A nontrivial (p−1)-st root of unity in ℤ_p^× is not in H_1.

**Acceptance.**

- r = 0 gives all of 𝒪_p^×.
- F = ℚ, p odd, r = 1: H_1 = 1 + pℤ_p, of index p − 1; a nontrivial (p−1)-st root of unity is not in H_1.
- This is the subgroup over which the corrected |T_κ| is taken (source issue E2).

#### Geometric Hilbert weights

**ID:** `OverconvergentAutomorphicForms:O0/geometric-weight-characters`. **Kind:** definition.

**Statement.** For a topological commutative ring R, the R-points of the weight space 𝒲* for G* are the continuous characters T(ℤ_p) = 𝒪_p^× → R^×: GeomWeight F p R := ContinuousMonoidHom 𝒪_p^× R^×. BHW's 𝒲* = Spf(ℤ_p⟦T(ℤ_p)⟧)^an_η × L is the rigid space representing this functor on affinoid L-algebras; its construction and representability are requested from PadicMeasuresIwasawaAlgebras L0a.

**Proposed declaration:** `TauCeti.HilbertWeight.GeomWeight`.

**Planet:** Hilbert weight space for G*.

**Hypotheses.**

- R a topological commutative ring, R^× with the units topology.
- No analyticity or algebraicity is assumed: an arbitrary continuous character is a weight, not an algebraic weight.
- All representation-by-rigid-space assertions use the imported universal character functor; the Lean abbreviation itself gives points only.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O0/units-at-p`
- `mathlib:ContinuousMonoidHom`
- `mathlib:IsTopologicalRing`
- `PadicMeasuresIwasawaAlgebras:L0a`

**Proof outline.**

1. Definition: ContinuousMonoidHom (Op F p)ˣ Rˣ. It is a commutative group under pointwise multiplication, and post-composition with continuous ring maps R → R' makes it a functor.

**Source matches.**

- [BHW-2023](https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf), §6.1, Definition 6.1(ii), printed p. 1756: The weight space for G*; its L-points are characters T(ℤ_p) → L^×.
- [BHW-2023](https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf), §6.1, Definition 6.1, printed p. 1756: Points of 𝒲* are characters.

**Uses.**

- BHW §6.2, Definition 6.5 and after: sheaves ω^κ of overconvergent Hilbert modular forms for G* of weight κ.
- OverconvergentAutomorphicForms:O1: the coefficient character of the equivariant sheaf.

**API.**

- `TauCeti.HilbertWeight.GeomWeight.ext` (extensionality): Two geometric weights are equal iff their values on all units agree.
- `TauCeti.HilbertWeight.GeomWeight.pullback` (functoriality): Precomposition by a continuous monoid endomorphism of O_p^×.
- `TauCeti.HilbertWeight.GeomWeight.one_apply` (simp): The trivial weight evaluates to 1 on every unit.

**Unit tests.**

- `geomWeight_trivial` (compatibility): The trivial character is a weight.
- `geomWeight_norm` (compatibility): x ↦ N(x) is a ℚ_p-valued weight.
- `geomWeight_rat` (compatibility): For F = ℚ these are the continuous characters of ℤ_p^×.

**Acceptance.**

- F = ℚ: GeomWeight ℚ p R is the set of continuous characters ℤ_p^× → R^×, BHW's weight space for GL_2/ℚ (Definition 3.1).
- Algebraic weights x ↦ N(x)^k (k ∈ ℤ) and x ↦ ∏_σ σ(x)^{k_σ} (after extending scalars to split F) are weights; a finite-order character of 𝒪_p^× is a weight that is not algebraic.
- Let R be the same abstract p-adic integer algebra with discrete topology. The identity homomorphism on its unit group from the usual p-adic topology is not continuous (the inverse image of {1} is not open), hence is not an R-valued weight.

#### Arithmetic Hilbert weights

**ID:** `OverconvergentAutomorphicForms:O0/arithmetic-weight-characters`. **Kind:** definition.

**Statement.** For a topological commutative ring R, the R-points of the weight space 𝒲 for G are the continuous characters of T(ℤ_p) × ℤ_p^×: ArithWeight F p R := ContinuousMonoidHom (𝒪_p^× × ℤ_p^×) R^×. Every such character is uniquely a pair (w, t) with w ∈ GeomWeight and t : ℤ_p^× → R^× continuous, via κ(x, y) = w(x)t(y).

**Proposed declaration:** `TauCeti.HilbertWeight.ArithWeight`.

**Planet:** Hilbert weight space for G.

**Hypotheses.**

- R a topological commutative ring.
- All representation-by-rigid-space assertions use the imported universal character functor; the Lean abbreviation itself gives points only.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O0/units-at-p`
- `OverconvergentAutomorphicForms:O0/geometric-weight-characters`
- `mathlib:ContinuousMonoidHom`
- `mathlib:ContinuousMonoidHom.fst`
- `mathlib:ContinuousMonoidHom.snd`
- `PadicMeasuresIwasawaAlgebras:L0a`

**Proof outline.**

1. Definition: ContinuousMonoidHom ((Op F p)ˣ × ℤ_[p]ˣ) Rˣ. ArithWeight.mk w t := (w ∘ fst)·(t ∘ snd) (ContinuousMonoidHom.fst, ContinuousMonoidHom.snd, pointwise product).
2. Bijectivity of (w, t) ↦ ArithWeight.mk w t: restrict κ to 𝒪_p^× × 1 and 1 × ℤ_p^×; a character of a product of groups is the product of its restrictions.

**Source matches.**

- [BHW-2023](https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf), §6.1, Definition 6.1(i), printed p. 1756: The weight space for G.
- [BHW-2023](https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf), §6.1, Definition 6.1, printed p. 1756: Points are pairs (w, t).

**Uses.**

- BHW §9, Definition 9.1 and Lemma 9.2: arithmetic Hilbert modular forms of weight (w, t) for G.

**API.**

- `TauCeti.HilbertWeight.ArithWeight.mk` (constructor): (w, t) ↦ the character (x, y) ↦ w(x)t(y).
- `TauCeti.HilbertWeight.ArithWeight.bijective_mk` (equivalence): Every arithmetic weight is uniquely of the form mk w t.
- `TauCeti.HilbertWeight.ArithWeight.mk_apply` (simp): (mk w t)(x, y) = w(x)·t(y).

**Unit tests.**

- `arithWeight_trivial` (compatibility): mk 1 1 = 1.
- `arithWeight_rat` (compatibility): For F = ℚ these are pairs of characters of ℤ_p^×.
- `arithWeight_mk_injective` (characterisation): mk w t = mk w' t' implies w = w' and t = t'.

**Acceptance.**

- F = ℚ: pairs of characters of ℤ_p^×.
- (w, t) = (1, 1) gives the trivial weight.
- The decomposition is unique: ArithWeight.mk is injective.

#### The group map dual to the weight map

**ID:** `OverconvergentAutomorphicForms:O0/weight-dual-group-map`. **Kind:** construction.

**Statement.** ι : 𝒪_p^× → 𝒪_p^× × ℤ_p^×, x ↦ (x², N(x)^{-1}), a continuous group homomorphism. It is the map for which pulling back characters gives BHW's displayed formula κ = w²·(t^{-1} ∘ N); BHW print x ↦ (x², N(x)) (source issue E1).

**Proposed declaration:** `TauCeti.HilbertWeight.weightDualMap`.

**Hypotheses.**

- The inversion on the second coordinate is deliberate: it is what the displayed formula and BHW (9.1) require.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O0/units-at-p`
- `OverconvergentAutomorphicForms:O0/norm-at-p`
- `mathlib:ContinuousMonoidHom`

**Proof outline.**

1. ι is a homomorphism because 𝒪_p^× and ℤ_p^× are commutative: (xy)² = x²y² and N(xy)^{-1} = N(x)^{-1}N(y)^{-1}.
2. Continuity: squaring and inversion are continuous on the topological groups of units, and N is continuous (norm-at-p).

**Source matches.**

- [BHW-2023](https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf), §6.1, Definition 6.1, printed p. 1756: BHW define ρ through a group map T(ℤ_p) → T(ℤ_p) × ℤ_p^×; the printed map x ↦ (x², N(x)) is corrected to x ↦ (x², N(x)^{-1}) (E1).
- [BHW-2023](https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf), §9, proof of Lemma 9.2, (9.1), printed p. 1781: (9.1) κ^{-1}(η)w(η²) = t∘N(η) holds for the inverted map.

**Uses.**

- OverconvergentAutomorphicForms:O0/weight-comparison: ρ is pullback along ι.

**API.**

- `TauCeti.HilbertWeight.weightDualMap` (constructor): x ↦ (x², N(x)^{-1}) as a continuous monoid hom.
- `TauCeti.HilbertWeight.weightDualMap_apply` (simp): ι(x) = (x², N(x)^{-1}).
- `TauCeti.HilbertWeight.weightDualMap_unitsToOp` (compatibility): For a totally positive global unit η of a totally real F, ι(η) = (η², 1).

**Unit tests.**

- `weightDualMap_rat` (compatibility): For F = ℚ, ι(x) = (x², x^{-1}).
- `weightDualMap_one` (compatibility): ι(1) = (1, 1).
- `weightDualMap_not_printed` (non-example): ι ≠ (x ↦ (x², N(x))) whenever N is not 2-torsion on 𝒪_p^×, e.g. F = ℚ, p = 5.

**Acceptance.**

- Pulling back (w, t) along ι gives w²·(t^{-1} ∘ N), not w²·(t ∘ N): with t trivial both agree, with w trivial they are inverse to each other.
- F = ℚ: ι(x) = (x², x^{-1}).

#### The weight map ρ : 𝒲 → 𝒲*

**ID:** `OverconvergentAutomorphicForms:O0/weight-comparison`. **Kind:** construction.

**Statement.** ρ_R : ArithWeight F p R → GeomWeight F p R, κ ↦ κ ∘ ι, natural in the coefficient ring R. It is the map on points of BHW's morphism ρ : 𝒲 → 𝒲*, through which every weight for G is regarded as a weight for G*.

**Proposed declaration:** `TauCeti.HilbertWeight.weightMap`.

**Planet:** Weight map ρ.

**Hypotheses.**

- R a topological commutative ring; naturality is for continuous ring maps R → R'.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O0/arithmetic-weight-characters`
- `OverconvergentAutomorphicForms:O0/geometric-weight-characters`
- `OverconvergentAutomorphicForms:O0/weight-dual-group-map`
- `mathlib:ContinuousMonoidHom.comp`
- `PadicMeasuresIwasawaAlgebras:L0a`

**Proof outline.**

1. Definition by composition with weight-dual-group-map (ContinuousMonoidHom.comp).
2. Naturality: composition on the left and on the right commute.

**Source matches.**

- [BHW-2023](https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf), §6.1, Definition 6.1, printed p. 1756: The morphism ρ, defined through a group map.
- [BHW-2023](https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf), §6.1, after Definition 6.2, printed p. 1757: Weights for G are regarded as weights for G* through ρ.

**Uses.**

- BHW §9 (p. 1780): the sheaf of arithmetic forms of weight κ uses κ = ρ(w_κ, t_κ) on the G*-side.

**API.**

- `TauCeti.HilbertWeight.weightMap` (constructor): κ ↦ κ ∘ ι.
- `TauCeti.HilbertWeight.weightMap_mk_apply` (characterisation): ρ(w, t) = w²·(t^{-1} ∘ N) (weight-comparison-formula).
- `TauCeti.HilbertWeight.weightMap_mul` (compatibility): ρ(κκ') = ρ(κ)ρ(κ'): ρ is a group homomorphism.

**Unit tests.**

- `weightMap_t_one` (compatibility): ρ(w, 1) = w².
- `weightMap_w_one` (compatibility): ρ(1, t) = t^{-1} ∘ N.
- `weightMap_rat` (compatibility): For F = ℚ, ρ(w, t)(x) = w(x)²t(x)^{-1}.

**Acceptance.**

- F = ℚ: ρ(w, t)(x) = w(x)²t(x)^{-1}.
- ρ is a group homomorphism for the pointwise group structures.
- The morphism of rigid spaces 𝒲 → 𝒲* is L0a's pullback in G applied to ι; its points are ρ_R.

#### The formula for ρ

**ID:** `OverconvergentAutomorphicForms:O0/weight-comparison-formula`. **Kind:** lemma.

**Statement.** For w ∈ GeomWeight F p R, t : ℤ_p^× → R^× continuous and x ∈ 𝒪_p^×: ρ(ArithWeight.mk w t)(x) = w(x)²·t(N(x))^{-1}.

**Proposed declaration:** `TauCeti.HilbertWeight.weightMap_mk_apply`.

**Hypotheses.**

- As in weight-comparison.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O0/weight-comparison`
- `OverconvergentAutomorphicForms:O0/arithmetic-weight-characters`
- `OverconvergentAutomorphicForms:O0/weight-dual-group-map`

**Proof outline.**

1. Unfold: ρ(mk w t)(x) = (mk w t)(ι x) = w(x²)·t(N(x)^{-1}) = w(x)²·t(N(x))^{-1}, using that w and t are homomorphisms.

**Source matches.**

- [BHW-2023](https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf), §6.1, Definition 6.1, printed p. 1756: The displayed formula; exponents checked on the page image.

**Uses.**

- OverconvergentAutomorphicForms:O0/weight-comparison-norm-factor: the norm factor is read off from the formula.

**Acceptance.**

- This is BHW's displayed κ = w²·(t^{-1} ∘ N_{F/ℚ}).
- With the printed map x ↦ (x², N(x)) one would get w(x)²·t(N(x)) instead (E1).

#### ρ(w, t)·w^{-2} factors through the norm

**ID:** `OverconvergentAutomorphicForms:O0/weight-comparison-norm-factor`. **Kind:** lemma.

**Statement.** For κ = ρ(mk w t) and x ∈ 𝒪_p^×: κ(x)·w(x)^{-2} = t(N(x))^{-1}. In particular κ·w^{-2} factors through N : 𝒪_p^× → ℤ_p^×.

**Proposed declaration:** `TauCeti.HilbertWeight.weightMap_mk_mul_inv_sq`.

**Hypotheses.**

- As in weight-comparison.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O0/weight-comparison-formula`

**Proof outline.**

1. Rearrange weight-comparison-formula.

**Source matches.**

- [BHW-2023](https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf), §6.1, Definition 6.1, printed p. 1756: The factorisation through the norm.

**Acceptance.**

- The factor left after removing w² is precisely t⁻¹∘N, with t a character of Z_p×.
- For w=N^a and t(y)=y^b, the geometric character is κ=N^(2a−b).

#### ρ on totally positive global units

**ID:** `OverconvergentAutomorphicForms:O0/weight-comparison-totally-positive-units`. **Kind:** lemma.

**Statement.** Let F be totally real and η ∈ 𝒪_F^× totally positive (σ(η) > 0 for every real embedding σ). For κ = ρ(mk w t): κ(η)^{-1}·w(η)² = t(N(η)) = 1, where η is viewed in 𝒪_p^× by η ↦ 1 ⊗ η.

**Proposed declaration:** `TauCeti.HilbertWeight.weightMap_mk_totallyPositive`.

**Hypotheses.**

- F totally real; η totally positive; R any topological commutative ring.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O0/weight-comparison-norm-factor`
- `OverconvergentAutomorphicForms:O0/norm-at-p`
- `mathlib:NumberField.IsTotallyReal`
- `mathlib:NumberField.isUnit_iff_norm`
- `mathlib:Algebra.norm_eq_prod_embeddings`

**Proof outline.**

1. By weight-comparison-norm-factor, κ(η)^{-1}w(η)² = t(N(1 ⊗ η)).
2. N(1 ⊗ η) = N_{F/ℚ}(η) (norm-at-p) = ±1 since η is a unit (NumberField.isUnit_iff_norm), and N_{F/ℚ}(η) = ∏_σ σ(η) > 0 (Algebra.norm_eq_prod_embeddings, all embeddings real), so N_{F/ℚ}(η) = 1 and t(1) = 1.

**Source matches.**

- [BHW-2023](https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf), §9, proof of Lemma 9.2, (9.1), printed p. 1781: (9.1): κ^{-1}(η)w(η²) = t∘N_{F/ℚ}(η) = 1 for η ∈ 𝒪_F^{×,+}.

**Uses.**

- BHW §9, Lemma 9.2: well-definedness of the arithmetic sheaves (3) and (4).

**Acceptance.**

- This is BHW (9.1), which makes the conditions (3) and (4) of §9 independent of representatives.
- Total positivity is needed: for η = −1 and [F:ℚ] odd, t(N(η)) = t(−1), which can be −1.

#### The radius parameter |T_κ|

**ID:** `OverconvergentAutomorphicForms:O0/weight-radius-parameter`. **Kind:** construction.

**Statement.** For a normed commutative ring A and κ∈GeomWeight F p A, set T_pro(κ)=sup_{x∈H_r0}‖κ(x)−1‖, r0=1 for odd p and 3 for p=2. This replaces BHW’s all-unit supremum for the boundedness diagnostic (E2). It is not asserted to equal every universal coordinate used in the AIP annuli, and does not validate the printed analytic-radius formula (E3).

**Proposed declaration:** `TauCeti.HilbertWeight.radiusParameter`.

**Hypotheses.**

- A a normed commutative ring; κ continuous.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O0/principal-units`
- `OverconvergentAutomorphicForms:O0/geometric-weight-characters`

**Proof outline.**

1. Definition as an indexed supremum (iSup) over the subgroup principal-units H_{r₀}.

**Source matches.**

- [BHW-2023](https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf), §6.1, after Definition 6.2, printed p. 1757: BHW's |T_κ| (supremum over 𝒪_p^× × U), corrected to the pro-p subgroup (E2).
- [BHW-2023](https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf), Definition 4.5(1), printed p. 1736: AIP's coordinate is on the pro-p part.

**Uses.**

- OverconvergentAutomorphicForms:O0/analytic-continuation-of-bounded-weights: the radius of analytic continuation depends on |T_κ|.
- BHW Definitions 4.5(3) and 7.7: |δ_κ| = max(|p|, |T_κ|) and ε_κ for the AIP comparison.

**API.**

- `TauCeti.HilbertWeight.radiusParameter_one` (simp): |T_1| = 0.
- `TauCeti.HilbertWeight.radiusParameter_lt_one` (relation): Continuous characters into uniform Banach ℚ_p-algebras have |T_κ| < 1 (continuous-character-bounded).
- `TauCeti.HilbertWeight.radiusParameter_nonneg` (relation): 0 ≤ |T_κ|.

**Unit tests.**

- `radius_trivial` (compatibility): |T_1| = 0.
- `radius_teichmuller` (compatibility): F = ℚ, p odd: |T_ω| = 0 for the Teichmüller character.
- `radius_power` (compatibility): For F=Q, p odd and k∈N, T_pro(x↦x^k)=|pk|_p, including k=0.

**Acceptance.**

- The trivial character has |T_κ| = 0.
- F = ℚ, p odd, κ = the Teichmüller character ω: |T_ω| = 0 (ω is trivial on 1 + pℤ_p), whereas BHW's printed supremum over ℤ_p^× gives 1.
- F = ℚ, p odd, κ(x) = x^k: |T_κ| = |pk|_p.

#### Continuous characters into uniform Banach algebras are bounded

**ID:** `OverconvergentAutomorphicForms:O0/continuous-character-bounded`. **Kind:** lemma.

**Statement.** Let A be a complete normed ℚ_p-algebra whose norm is ultrametric and power-multiplicative (a uniform Banach algebra, such as an affinoid algebra with its spectral norm). Then every κ ∈ GeomWeight F p A has |T_κ| < 1.

**Proposed declaration:** `TauCeti.HilbertWeight.radiusParameter_lt_one`.

**Hypotheses.**

- A complete, ultrametric, ‖1‖ = 1, ‖·‖ power-multiplicative; κ continuous.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O0/weight-radius-parameter`
- `OverconvergentAutomorphicForms:O0/principal-units`
- `OverconvergentAutomorphicForms:O0/units-at-p`
- `mathlib:IsModuleTopology`

**Proof outline.**

1. For x ∈ H_{r₀}, x^{p^n} → 1, so κ(x)^{p^n} → 1 by continuity.
2. If y = κ(x) − 1 had ‖y‖ ≥ 1, expand (1 + y)^{p^n} − 1 = y^{p^n} + Σ_{0<j<p^n} C(p^n, j) y^j. The first term has norm ‖y‖^{p^n} (power-multiplicativity), and each other term has norm ≤ |p|·‖y‖^j ≤ |p|·‖y‖^{p^n} < ‖y‖^{p^n}, since p divides C(p^n, j) and ‖y‖ ≥ 1. The norm is ultrametric, so ‖(1 + y)^{p^n} − 1‖ = ‖y‖^{p^n} ≥ 1 for all n, contradicting κ(x)^{p^n} → 1. Hence ‖κ(x) − 1‖ < 1.
3. x ↦ ‖κ(x) − 1‖ is continuous on the compact group H_{r₀} (open in the compact 𝒪_p^×), so its supremum is attained and is < 1.

**Source matches.**

- [BHW-2023](https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf), §6.1, Definition 6.2, printed p. 1756: Bounded means image in an affinoid; at the coefficient level this is the uniform Banach algebra case.

**Uses.**

- OverconvergentAutomorphicForms:O0/analytic-continuation-of-bounded-weights: supplies |T_κ| < 1 for affinoid coefficients.

**Acceptance.**

- This is the coefficient-level form of 'an affinoid image is bounded'; unboundedness only occurs for non-affinoid families U, which need L0a's rigid spaces.
- Power-multiplicativity is needed: for a non-uniform norm the binomial estimate fails.
- The ultrametric hypothesis is needed for the domination step; archimedean normed algebras are excluded.

#### Analytic continuation of bounded weights

**ID:** `OverconvergentAutomorphicForms:O0/analytic-continuation-of-bounded-weights`. **Kind:** theorem.

**Statement.** For a bounded smooth family κ:U→W*, there exists a common positive radius r<1 and a unique analytic multiplicative extension of its character to B_r(O_p^×:1)×U, agreeing with κ on O_p^××U. The extension respects multiplication wherever defined. This is an existence theorem; r=|p|^r0 |Tκ| is not asserted (E3).

**Proposed declaration:** `TauCeti.Overconvergent.analytic_continuation_of_bounded_weights`.

**Planet:** Analytic continuation of weights.

**Hypotheses.**

- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Boundedness is affinoid-image boundedness. The corrected pro-p supremum is a useful diagnostic, not the universal-coordinate annulus of AIP Proposition 2.8.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O0/geometric-weight-characters`
- `OverconvergentAutomorphicForms:O0/weight-radius-parameter`
- `OverconvergentAutomorphicForms:O0/continuous-character-bounded`
- `PadicMeasuresIwasawaAlgebras:L0a`
- `LocallyAnalyticDistributions:L0`

**Proof outline.**

1. Pull the family back from one affinoid of the universal compact-torus character space (PadicMeasuresIwasawaAlgebras:L0a).
2. Apply AIP ADIC Proposition 2.8 on finitely many universal-coordinate annuli/charts; use their smallest positive analytic neighbourhood. LocallyAnalyticDistributions:L0 supplies the multivariable analytic-character theorem and its normed function spaces.
3. Glue by uniqueness: a convergent analytic function vanishing on a product of small Z_p lattices is zero, by the one-variable identity theorem successively in the coordinates. Agreement at a single point of each ball would not suffice.
4. Multiplicativity follows by the same identity argument on the product neighbourhood, then descends over U by pulling back the universal construction.

**Source matches.**

- [BHW-2023](https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf), §6.1, Proposition 6.3, p.1757: The existential extension is retained; the printed numerical formula is excluded by E3.
- [AIP-ADIC-2016](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/Hilbert_adicfinal.pdf), §2.4.3, Proposition 2.8, p.9: The universal character extends on coordinate-dependent principal-unit neighbourhoods, uniformly on the given interval.

**Uses.**

- BHW Definition 6.4: κ(cz + d) on the anticanonical neighbourhood, via κ^an.
- OverconvergentAutomorphicForms:O1: the analytic automorphy cocycle.

**Acceptance.**

- A finite conductor character extends on sufficiently small residue balls.
- For p=3, κ(4)=ζ_9 cannot extend to the printed ball of radius 3^(−7/6), by E3.
- The trivial character extends to every admitted neighbourhood; no formula forcing r=0 is imposed.

#### Bounded weight families

**ID:** `OverconvergentAutomorphicForms:O0/bounded-weight-families`. **Kind:** construction.

**Statement.** A bounded geometric (respectively arithmetic) family on U is a morphism to the imported W* (respectively W) factoring through an affinoid subspace, with the pulled-back universal character on O_p^××U (respectively (O_p^××Z_p^×)×U). Smoothness of the family means smoothness of U; it does not mean the weight morphism is smooth.

**Proposed declaration:** `TauCeti.Overconvergent.bounded_weight_families`.

**Hypotheses.**

- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.

**Direct inputs.**

- `PadicMeasuresIwasawaAlgebras:L0a`
- `OverconvergentAutomorphicForms:O0/geometric-weight-characters`
- `OverconvergentAutomorphicForms:O0/arithmetic-weight-characters`

**Proof outline.**

1. Use the universal character of L0a and pull it back; retain the chosen affinoid chart to select a common analytic neighbourhood.
2. Restriction to opens and morphisms of bases is functorial. On overlaps the same universal character gives the canonical identification.

**Source matches.**

- [BHW-2023](https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf), Definition 6.2, p.1756: Bounded smooth families are the coefficient parameters used throughout §§6–10.

**Uses.**

- O2, O3, O5 and O6: A common analytic radius and compatible integral coefficient lattice are chosen for a whole bounded family.

**API.**

- `TauCeti.Overconvergent.bounded_weight_families.character` (projection): Evaluate the pulled-back universal character.
- `TauCeti.Overconvergent.bounded_weight_families.pullback` (functoriality): Pull back along U′→U, preserving boundedness and the character.
- `TauCeti.Overconvergent.bounded_weight_families.ext` (extensionality): A family is determined by its weight morphism; choices of affinoid factorisation give the same character.

**Unit tests.**

- `TauCeti.Overconvergent.Test.O0_bounded_weight_families_point` (degenerate): U=Spa(L) gives the specified single continuous character.
- `TauCeti.Overconvergent.Test.O0_bounded_weight_families_constant` (computation): A constant family has κ(x,u)=κ(x) on every fibre.
- `TauCeti.Overconvergent.Test.O0_bounded_weight_families_image` (non-example): An unbounded identity map on the entire nonquasicompact weight space has no single affinoid factorisation.

**Acceptance.**

- A bounded geometric (respectively arithmetic) family on U is a morphism to the imported W* (respectively W) factoring through an affinoid subspace, with the pulled-back universal character on O_p^××U (respectively (O_p^××Z_p^×)×U). Smoothness of the family means smoothness of U; it does not mean the weight morphism is smooth.

#### Finite analytic coefficient representations

**ID:** `OverconvergentAutomorphicForms:O0/finite-analytic-coefficients`. **Kind:** definition.

**Statement.** For a compact open H of a p-adic Levi M and affinoid A, a finite analytic coefficient representation is a finite projective A-module V with its canonical Banach topology and continuous A-linear H-action whose orbit maps are analytic on specified Lie charts H_n. A stable A+-lattice V+ is additional data. The representation includes scalar characters but is not required to have rank one.

**Proposed declaration:** `TauCeti.Overconvergent.finite_analytic_coefficients`.

**Planet:** Analytic coefficient representations.

**Hypotheses.**

- M is a reductive p-adic group with the analytic charts supplied by LocallyAnalyticDistributions:L0.
- A is a complete uniform affinoid Q_p-algebra; analytic extension to H_n is specified, not inferred from continuity.

**Direct inputs.**

- `mathlib:Representation`
- `LocallyAnalyticDistributions:L0`
- `AdicSpacesPartII:R0/completed-tensor-banach-module`

**Proof outline.**

1. Use baseline Representation for the algebraic action and imported analytic orbit maps for the chart condition.
2. Use finite-projective Banach topology from AdicSpacesPartII:R0/completed-tensor-banach-module; record rather than manufacture a stable lattice.

**Source matches.**

- [BP-HIGHER](https://www.imo.universite-paris-saclay.fr/~pilloni/HigherColeman.pdf), §6.2, pp.147–152: Algebraic representations and analytic coefficient induction distinguish finite projective coefficients from infinite induced modules.

**Uses.**

- O1 and OverconvergentAutomorphicForms:O8: Noncommutative vector coefficients use the same cocycle and descend to the algebraic vector bundles of B4.

**API.**

- `TauCeti.Overconvergent.finite_analytic_coefficients.action` (projection): ρ(h):V≃ₗ[A]V, with analytic orbit maps on H_n.
- `TauCeti.Overconvergent.finite_analytic_coefficients.changeScalars` (functoriality): Finite projective completed base change to an affinoid B, preserving the pulled-back analytic action.
- `TauCeti.Overconvergent.finite_analytic_coefficients.tensor` (structure): Tensor coefficients on V⊗_A W with diagonal action.
- `TauCeti.Overconvergent.finite_analytic_coefficients.dual` (structure): Contragredient on Hom_A(V,A), action f↦f∘ρ(h⁻¹).
- `TauCeti.Overconvergent.finite_analytic_coefficients.algebraic` (constructor): Restrict an algebraic Levi representation to H_n and extend scalars to A.

**Unit tests.**

- `TauCeti.Overconvergent.Test.O0_finite_analytic_coefficients_scalar` (compatibility): A rank-one character acts by multiplication by κ(h).
- `TauCeti.Overconvergent.Test.O0_finite_analytic_coefficients_rankTwo` (computation): On A² a diagonal torus acts by diag(χ1(h),χ2(h)), retaining both distinct characters.
- `TauCeti.Overconvergent.Test.O0_finite_analytic_coefficients_dualSign` (computation): The dual of a scalar character κ is κ⁻¹, not κ.
- `TauCeti.Overconvergent.Test.O0_finite_analytic_coefficients_continuous` (non-example): A continuous character with conductor greater than the chosen chart level is not analytic on that chart.

**Acceptance.**

- For a compact open H of a p-adic Levi M and affinoid A, a finite analytic coefficient representation is a finite projective A-module V with its canonical Banach topology and continuous A-linear H-action whose orbit maps are analytic on specified Lie charts H_n. A stable A+-lattice V+ is additional data. The representation includes scalar characters but is not required to have rank one.

#### Tensor and dual coefficient laws

**ID:** `OverconvergentAutomorphicForms:O0/coefficient-tensor-dual`. **Kind:** theorem.

**Statement.** Finite analytic coefficients are closed under tensor products and contragredient duals on a common analytic chart; (V⊗W)∨≅V∨⊗W∨ for finite projective coefficients, and these identifications commute with affinoid base change. The dual of a general induced Banach module is its continuous dual; no finite-projective claim is made for it.

**Proposed declaration:** `TauCeti.Overconvergent.coefficient_tensor_dual`.

**Hypotheses.**

- Use finite projective modules for the algebraic dual/tensor isomorphism.
- For induced coefficients use the normed continuous dual, and retain its strong topology; general affinoid coefficients need not give orthonormalisable duals.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O0/finite-analytic-coefficients`
- `mathlib:Representation.tprod`
- `mathlib:Representation.dual`
- `AdicSpacesPartII:R0/completed-tensor-banach-module`

**Proof outline.**

1. Apply baseline Representation.tprod and Representation.dual. In a finite projective local splitting the analytic orbit maps are matrix products and inverse-transposes.
2. Descend the dual/tensor identification from finite free modules through idempotents; finite-projective completed tensor agrees with ordinary tensor by the imported R0 theorem.

**Source matches.**

- [BP-HIGHER](https://www.imo.universite-paris-saclay.fr/~pilloni/HigherColeman.pdf), §6.2.2–6.2.4, p.148; §6.2.20, pp.152–153: The source distinguishes finite algebraic coefficients from induced Banach coefficients and their topological duals; the finite-projective tensor/dual law is the routine idempotent argument from the listed baseline representations and R0.

**Acceptance.**

- For two scalar coefficients the tensor weight is κλ and the dual weight κ⁻¹.
- The multiplication map on induced functions is not declared an isomorphism Ind(κ)⊗Ind(λ)≅Ind(κλ).

#### Analytic induced coefficients

**ID:** `OverconvergentAutomorphicForms:O0/analytic-induced-coefficients`. **Kind:** construction.

**Statement.** For an n-analytic torus character κ_A and a chosen closed subgroup M_1 with Iwahori decomposition, define Vκ^{n-an} as analytic functions f on the actual adic neighbourhood M_1 M_n with f(mb)=(w0,M κ_A)(b⁻¹)f(m), for b in the upper Borel neighbourhood. Left action is (h·f)(m)=f(h⁻¹m). The locally analytic induction is colim_n Vκ^{n-an} with its LB topology; the continuous strong dual is the distribution coefficient module. At fixed n the strong dual (Vκ^{n-an})∨ need not be projective over A: BP instead defines projective Dκ^{n-an} as the compact-open continuous dual of bounded analytic functions on the open polydisc M_1 M_n°; Dκ^{lan}=lim_n Dκ^{n-an} is the dual of the locally analytic induction.

**Proposed declaration:** `TauCeti.Overconvergent.analytic_induced_coefficients`.

**Planet:** Locally analytic induction.

**Hypotheses.**

- Use BP §6.2’s Levi, Borel, longest Weyl element and actual analytic subgroup conventions. M_1 is closed with M_1=N̄_1 T_1 N_1, T_1=T(Z_p), and T^{M,−} normalizes N̄_1. M_1 is not required open or Zariski dense. κ_A is a character of w0,M⁻¹T(Z_p)w0,M, n-analytic after the Weyl conjugation.
- Functions are analytic on the adic thickening M_1 M_n, not merely set functions on M_1. A is uniform finite-type Tate over the coefficient field.

**Direct inputs.**

- `LocallyAnalyticDistributions:L0`
- `OverconvergentAutomorphicForms:O0/bounded-weight-families`
- `AdicSpacesPartII:R0/completed-tensor-banach-module`

**Proof outline.**

1. Import multivariable analytic function Banach modules from LAD L0; cut out right Borel equivariance as a closed submodule.
2. Iwahori factorisation identifies it with analytic functions on the opposite-unipotent neighbourhood, producing its Banach norm.
3. Left inverse translation preserves the relation. The transition maps are restriction to smaller neighbourhoods; use their specified colimit and strong-dual topologies.
4. For distributions retain §6.2.20’s bounded open-polydisc function space and compact-open dual topology. Do not identify its projective Dκ^{n-an} with the ordinary strong Banach dual over a general affinoid A.

**Source matches.**

- [BP-HIGHER](https://www.imo.universite-paris-saclay.fr/~pilloni/HigherColeman.pdf), §6.2.4, pp.148–149; Remark 6.2.8, pp.149–150; §6.2.20, pp.152–153: The defining space is the genuine adic neighbourhood of a closed subgroup with Iwahori decomposition. Ordinary Banach duals and the projective bounded-open-polydisc distribution modules are distinguished.

**Uses.**

- BP §6.3; O8: Analytic inductions produce Banach sheaves and algebraic specialisation maps for higher-rank coefficients.

**API.**

- `TauCeti.Overconvergent.analytic_induced_coefficients.equivariance` (characterisation): f(mb)=(w0,M κ_A)(b⁻¹)f(m).
- `TauCeti.Overconvergent.analytic_induced_coefficients.leftAction` (structure): h·f is f(h⁻¹m), with (h1h2)·f=h1·(h2·f).
- `TauCeti.Overconvergent.analytic_induced_coefficients.unipotentChart` (equivalence): Restriction to the opposite-unipotent chart gives the analytic Banach function module.
- `TauCeti.Overconvergent.analytic_induced_coefficients.restrictRadius` (functoriality): Restriction Vκ^{n-an}→Vκ^{(n+1)-an} and its composition law.
- `TauCeti.Overconvergent.analytic_induced_coefficients.continuousDual` (constructor): Continuous A-linear dual with the strong topology; the induced action is contragredient.
- `TauCeti.Overconvergent.analytic_induced_coefficients.distributions` (constructor): Dκ^{n-an} is the compact-open continuous A-dual of bounded analytic functions on M_1 M_n°; Dκ^{lan}=lim_n Dκ^{n-an}, with the specified right (M_1,T^{M,+}) action and contragredient left (M_1,T^{M,−}) action.

**Unit tests.**

- `TauCeti.Overconvergent.Test.O0_analytic_induced_coefficients_torus` (degenerate): For M=T there is no unipotent coordinate and induction is the rank-one coefficient character with the prescribed Weyl/inverse convention.
- `TauCeti.Overconvergent.Test.O0_analytic_induced_coefficients_sl2` (non-example): For SL2 and dominant k≥0, z^(k+1) is an analytic function on the opposite-unipotent ball and is not in the embedded algebraic polynomial subspace of degree≤k.
- `TauCeti.Overconvergent.Test.O0_analytic_induced_coefficients_actionOrder` (computation): ((h1h2)·f)(m)=f(h2⁻¹h1⁻¹m).
- `TauCeti.Overconvergent.Test.O0_analytic_induced_coefficients_tensor` (non-example): For SL2 and κ=λ=1, multiplication of induced functions kills 1⊗z−z⊗1, a nonzero tensor detected by evaluation at two distinct points of the unipotent ball; it is not a tensor-product isomorphism.

**Acceptance.**

- For a torus M=T there is no unipotent variable and induction is the rank-one coefficient with the Weyl/inverse convention.
- For SL2 and k≥0 the polynomial subspace of degree≤k is proper: z^(k+1) is analytic but outside it.
- If M_1 is not Zariski dense, functions on its adic neighbourhood cannot be replaced by functions on its rational points.
- Fixed-radius projective distributions use the bounded open-polydisc dual, not an unsupported projectivity assertion for the ordinary Banach dual.

#### Algebraic specialisation of analytic induction

**ID:** `OverconvergentAutomorphicForms:O0/algebraic-induced-comparison`. **Kind:** comparison.

**Statement.** For dominant algebraic κ, restriction of regular induced functions embeds Vκ into Vκ^{n-an} and is M_1-equivariant. For t∈T^{M,+}, ι(tv)=(w0,M κ)(t)·tι(v). A finite-order character w0,M χ:M_1→F× trivial on M_1∩M_n extends trivially across M_n and restricts to the Weyl-conjugate torus character χ. Multiplication by (w0,M χ)⁻¹ gives Vκ_A^{n-an}⊗_F F(w0,M χ)≅Vκ_Aχ^{n-an} as (M_1,T^{M,+}) modules, where the finite-character factor has trivial positive-monoid action. Algebraic restriction induces a map on continuous duals; no blanket surjectivity over A is asserted.

**Proposed declaration:** `TauCeti.Overconvergent.algebraic_induced_comparison`.

**Hypotheses.**

- BP algebraic induced model uses f(mb)=(w0,M κ)(b⁻¹)f(m).
- Do not remove the positive-monoid scalar, or conclude that an algebraic weight makes analytic induction finite rank.
- The finite-order character is defined on M_1, not only its torus, is trivial on M_1∩M_n, and has the explicitly trivial T^{M,+} action from BP §6.2.9.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O0/analytic-induced-coefficients`
- `OverconvergentAutomorphicForms:O0/finite-analytic-coefficients`
- `AutomorphicBundles:B4`

**Proof outline.**

1. Restrict regular functions to the analytic chart. Density of the unipotent chart and algebraic coordinates gives injectivity.
2. Compute the actions as in BP §6.2.11 (a subsection, not a lemma); positive-monoid normalization gives ι(tv)=(w0,M κ)(t)tι(v).
3. Apply Lemma 6.2.10 with its M_1-character and conductor hypotheses, multiplying by (w0,M χ)⁻¹. Proposition 6.3.6 provides the sheaf maps with its 2ρ_nc dual twist; it does not supply a general Hahn–Banach or surjectivity theorem over A.

**Source matches.**

- [BP-HIGHER](https://www.imo.universite-paris-saclay.fr/~pilloni/HigherColeman.pdf), §6.2.9, Lemma 6.2.10 and §6.2.11, p.150; Proposition 6.3.6, p.154: The finite twist extends to M1 and is trivial on M1∩Mn. Algebraic restriction carries the positive-monoid scalar; the sheaf comparison supplies maps, with no blanket dual surjectivity.

**Acceptance.**

- In SL2 the finite-dimensional polynomial subspace is proper in the analytic functions.
- Scalar inverse/positive conventions must be converted explicitly before applying this to O8’s transpose convention.

#### Definite unitary completed coefficients

**ID:** `OverconvergentAutomorphicForms:O0/unitary-completed-coefficients`. **Kind:** construction.

**Statement.** Ŝξ,τ(U^℘,O_E)=lim_k colim_{U℘} Sξ,τ(U℘U^℘,O_E/ϖ_E^k), where f(gu)=u⁻¹f(g) in the finite automorphic function spaces. After tensoring E, Π is an admissible unitary Banach GL_n(K)-representation commuting with the tame Hecke algebra. On some compact open H its restriction is C(H,E)^s, s≥1.

**Proposed declaration:** `TauCeti.Overconvergent.unitary_completed_coefficients`.

**Hypotheses.**

- F/F+ is CM, G/F+ is a definite unitary group with G×F+F≅GL_n, n≥2, and every p-adic place of F+ splits in F.
- Fix ℘|p, K=F+_℘=F_℘̃, E large enough, dominant ξ_v and inertial τ_v at every other v|p with stable O_E-lattices Wξ,τ.
- U^℘ is sufficiently small; its other p-components are GL_n(O_{F+_v}); levels at inert finite places are hyperspecial. The nonzero local regular representation hypothesis Π|H≅C(H,E)^s has s≥1.

**Direct inputs.**

- `CompletedCohomologyPartII:CC.8`
- `OverconvergentAutomorphicForms:O0/finite-analytic-coefficients`

**Proof outline.**

1. Import the completed topological coefficient tower and its actions from CompletedCohomologyPartII:CC.8. Admissibility and the local regular model require the separate Jacquet–Emerton/definite-unitary input recorded in the owner gap.
2. The finite double-coset description at sufficiently small level gives locally regular translation actions. The local regular model with positive multiplicity is a separate requested theorem; do not infer it from arbitrary admissibility.

**Source matches.**

- [DING-2025](https://pmihes.centre-mersenne.org/item/10.1007/s10240-025-00156-2.pdf), §4.2.2, pp.66–67, definitions before Proposition 4.14: The completed automorphic coefficient representation is the input for Jacquet–Emerton eigenvarieties.

**Uses.**

- Ding Proposition 4.14: The local regular model proves dimension and Cohen–Macaulayness via Jacquet formalism.

**API.**

- `TauCeti.Overconvergent.unitary_completed_coefficients.modPower` (projection): Projection to the k-th p-adic quotient, retaining the colimit over level.
- `TauCeti.Overconvergent.unitary_completed_coefficients.groupAction` (structure): Continuous GL_n(K)-action by translations, commuting with tame Hecke.
- `TauCeti.Overconvergent.unitary_completed_coefficients.localRegular` (equivalence): For the supplied H, Π|H≅C(H,E)^s with s≥1.

**Unit tests.**

- `TauCeti.Overconvergent.Test.O0_unitary_completed_coefficients_order` (non-example): For the local translation model H=Z_p, lim_m colim_i Map(Z/p^i,Z/p^m)=C(Z_p,Z_p). The function x↦x belongs to this completion but is not in colim_i Map(Z/p^i,Z_p), since it is not locally constant; interchanging the limits loses it.
- `TauCeti.Overconvergent.Test.O0_unitary_completed_coefficients_coefficients` (compatibility): At a finite level with coefficient W=E² and u acting by diag(a,b), the two coordinates obey f(gu)=(a⁻¹ f1(g),b⁻¹ f2(g)); replacing u⁻¹ by u gives a different coefficient condition when a² or b² is not 1.
- `TauCeti.Overconvergent.Test.O0_unitary_completed_coefficients_multiplicity` (non-example): For Π=0 the Jacquet module is zero and its coherent support/eigenvariety is empty, so the nd_K-dimensional nonzero eigenvariety conclusion requires the local regular multiplicity s≥1.

**Acceptance.**

- Ŝξ,τ(U^℘,O_E)=lim_k colim_{U℘} Sξ,τ(U℘U^℘,O_E/ϖ_E^k), where f(gu)=u⁻¹f(g) in the finite automorphic function spaces. After tensoring E, Π is an admissible unitary Banach GL_n(K)-representation commuting with the tame Hecke algebra. On some compact open H its restriction is C(H,E)^s, s≥1.

#### Unitary Jacquet eigenvariety coefficients

**ID:** `OverconvergentAutomorphicForms:O0/unitary-jacquet-eigenvariety`. **Kind:** application.

**Statement.** For the supplied Π, import Emerton’s locally Q_p-analytic vectors and J_B. Its strong dual defines the coherent eigenvariety sheaf M(U^℘) on E(U^℘)→T̂, where T̂ parametrizes continuous characters of T(K), including its n unramified coordinates. (δ,ω) is an E-point iff Hom_{T(K)}(δ,J_B(Π_Qp-an[mω]))≠0. Classical points use Π_lalg in this criterion.

**Proposed declaration:** `TauCeti.Overconvergent.unitary_jacquet_eigenvariety`.

**Hypotheses.**

- F/F+ is CM, G/F+ is a definite unitary group with G×F+F≅GL_n, n≥2, and every p-adic place of F+ splits in F.
- Fix ℘|p, K=F+_℘=F_℘̃, E large enough, dominant ξ_v and inertial τ_v at every other v|p with stable O_E-lattices Wξ,τ.
- U^℘ is sufficiently small; its other p-components are GL_n(O_{F+_v}); levels at inert finite places are hyperspecial. The nonzero local regular representation hypothesis Π|H≅C(H,E)^s has s≥1.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O0/unitary-completed-coefficients`
- `PadicMeasuresIwasawaAlgebras:L0a`

**Proof outline.**

1. Use the Jacquet–Emerton eigenvariety package requested as a Part II of PadicFamilies, rather than the compact Up package of L2a.
2. Split T(K)=T(O_K)×Z^n after choosing uniformizers; compact character coordinates come from PMIA L0a, while unramified coordinates are G_m^n. Choice changes coordinates, not the character functor.
3. The eigenvariety sheaf is the sheaf attached to the Jacquet strong dual, not an arbitrary coherent sheaf declared equal to it.

**Source matches.**

- [DING-2025](https://pmihes.centre-mersenne.org/item/10.1007/s10240-025-00156-2.pdf), §4.2.2, p.67, immediately before Proposition 4.14: The support construction and its point criterion require the full T(K)-character space.

**Acceptance.**

- dim T̂=n([K:Q_p]+1), whereas the eigenvariety dimension below is n[K:Q_p].
- For n=2,K=Q_p the two dimensions are 4 and 2; do not count unramified coordinates as weight dimensions.

#### Unitary eigenvariety dimension and depth

**ID:** `OverconvergentAutomorphicForms:O0/unitary-eigenvariety-geometry`. **Kind:** theorem.

**Statement.** Under DH and the imported Jacquet–Emerton construction, E(U^℘) is equidimensional of dimension n d_K, d_K=[K:Q_p], and its specified coherent sheaf M(U^℘) is Cohen–Macaulay over E(U^℘).

**Proposed declaration:** `TauCeti.Overconvergent.unitary_eigenvariety_geometry`.

**Hypotheses.**

- All three DH hypotheses apply; the local model has s≥1.
- These are the jointly proved parts (1)–(2) of Ding Proposition 4.14, not a generic property of supports of admissible representations.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O0/unitary-jacquet-eigenvariety`
- `OverconvergentAutomorphicForms:O0/unitary-completed-coefficients`

**Proof outline.**

1. Apply the local regular model from unitary-completed-coefficients.
2. Invoke the precise dimension/depth theorem of the Jacquet–Emerton package (Ding proof references BHS Lemma 3.10, Proposition 3.11, Corollary 3.12 and its §5.2). This is recorded as an owner gap, not silently re-proved here.

**Source matches.**

- [DING-2025](https://pmihes.centre-mersenne.org/item/10.1007/s10240-025-00156-2.pdf), Proposition 4.14(1)–(2), p.67: Dimension and Cohen–Macaulayness are proved together using local regularity.

**Acceptance.**

- For n=2,K=Q_p the dimension is 2, not 4.
- Cohen–Macaulayness concerns the actual Jacquet coefficient sheaf, not every coherent sheaf.

#### Reducedness of the unitary eigenvariety

**ID:** `OverconvergentAutomorphicForms:O0/unitary-eigenvariety-reduced`. **Kind:** theorem.

**Statement.** The same E(U^℘) is reduced, under the definite-unitary hypotheses and the classical-density theorem in the supplied Jacquet–Emerton package.

**Proposed declaration:** `TauCeti.Overconvergent.unitary_eigenvariety_reduced`.

**Hypotheses.**

- F/F+ is CM, G/F+ is a definite unitary group with G×F+F≅GL_n, n≥2, and every p-adic place of F+ splits in F.
- Fix ℘|p, K=F+_℘=F_℘̃, E large enough, dominant ξ_v and inertial τ_v at every other v|p with stable O_E-lattices Wξ,τ.
- U^℘ is sufficiently small; its other p-components are GL_n(O_{F+_v}); levels at inert finite places are hyperspecial. The nonzero local regular representation hypothesis Π|H≅C(H,E)^s has s≥1.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O0/unitary-jacquet-eigenvariety`
- `OverconvergentAutomorphicForms:O0/unitary-eigenvariety-geometry`

**Proof outline.**

1. Use the Jacquet formalism’s density of suitable classical points and the generic regularity argument cited by Ding Proposition 4.14(3).
2. Record that this source-proof leaf is requested from the proposed PadicFamilies Part II; reducedness does not follow just from equidimensionality or a Cohen–Macaulay sheaf.

**Source matches.**

- [DING-2025](https://pmihes.centre-mersenne.org/item/10.1007/s10240-025-00156-2.pdf), Proposition 4.14(3) and proof, p.67: Reducedness has a separate density argument and therefore a separate node.

**Acceptance.**

- The ring E[ε]/(ε²) is Cohen–Macaulay and equidimensional but not reduced; this rules out deriving (3) from (1)–(2) alone.

### OverconvergentAutomorphicForms:O1

Right cocycle, vector equalizer sheaf, operations and analytic line effectivity.

#### Right automorphy cocycles

**ID:** `OverconvergentAutomorphicForms:O1/right-automorphy-cocycle`. **Kind:** definition.

**Statement.** Let X have a right Γ-action and C be a coefficient group. A right automorphy cocycle is J:Γ×X→C with J(1,x)=1 and J(γδ,x)=J(γ,x)J(δ,xγ). For a left representation ρ:C→Aut_A(V), equivariant functions satisfy f(xγ)=ρ(J(γ,x)⁻¹)f(x). In analytic geometry J is an analytic map on the actual cover and coefficient neighbourhood.

**Proposed declaration:** `TauCeti.Overconvergent.RightCocycle`.

**Planet:** Automorphy cocycles.

**Hypotheses.**

- Γ acts on the right. For a left action and left cocycle K with K(γδ,x)=K(γ,δx)K(δ,x), use x·γ=γ⁻¹x and J(γ,x)=K(γ⁻¹,x)⁻¹. Then left equivariance f(γx)=ρ(K(γ,x))f(x) becomes the stated right inverse-equivariance. Both the inverse group element and inverse coefficient are required in the noncommutative conversion.
- C and ρ need not commute. Analyticity and stable-lattice preservation are genuine imported conditions, not implicit in a set-theoretic cocycle.

**Direct inputs.**

- `mathlib:Representation`
- `AutomorphicBundles:B0/sections-equivariant`
- `AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product`

**Proof outline.**

1. Bundle the algebraic cocycle laws; use Representation for ρ.
2. Check consistency: successive inverse coefficient actions are ρ(Jδ(xγ)⁻¹)ρ(Jγ(x)⁻¹)=ρ((Jγ(x)Jδ(xγ))⁻¹).
3. Analytic versions import the site and coefficient neighbourhood, using AutomorphicBundles B0’s associated-bundle conventions after converting left/right actions.
4. Convert the BHW left action explicitly: its scalar coefficient multiplier is Kγ(x)=κ(jγ(x))⁻¹, so the corresponding right scalar cocycle is Jγ(x)=κ(jγ⁻¹(x)). The cz+d function itself has the left cocycle law of O2.

**Source matches.**

- [BHW-2023](https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf), Definitions 6.4–6.5, pp.1757–1758: BHW uses a left level action and inverse scalar coefficient equivariance. The right noncommutative abstraction requires the explicit inversion conversion; the paper is not cited for a right cz+d law.

**Uses.**

- O2 and O8: The BHW left scalar factor and the Levi left frame factor are converted explicitly before applying this right-action convention.

**API.**

- `TauCeti.Overconvergent.right_automorphy_cocycle.apply_one` (simp): J(1,x)=1.
- `TauCeti.Overconvergent.right_automorphy_cocycle.apply_mul` (relation): J(γδ,x)=J(γ,x)J(δ,xγ).
- `TauCeti.Overconvergent.right_automorphy_cocycle.equivariant` (constructor): The algebraic equivariant functions form an A-submodule of X→V; analytic functions are used only with the supplied analytic carrier.
- `TauCeti.Overconvergent.right_automorphy_cocycle.gauge` (constructor): For b:X→C construct J′γ(x)=b(x)⁻¹Jγ(x)b(xγ).
- `TauCeti.Overconvergent.right_automorphy_cocycle.ext` (extensionality): Two right cocycles agree if their values agree for every γ and x.
- `TauCeti.Overconvergent.right_automorphy_cocycle.trivial` (constructor): The constant unit map is the trivial right cocycle.
- `TauCeti.Overconvergent.right_automorphy_cocycle.mem_equivariant` (characterisation): f belongs to the equivariant submodule iff ∀γ,x, f(xγ)=ρ(Jγ(x)⁻¹)f(x).
- `TauCeti.Overconvergent.right_automorphy_cocycle.gauge_equivariant` (compatibility): The map f′(x)=ρ(b(x)⁻¹)f(x) sends J-equivariant functions to gauge(J,b)-equivariant functions.
- `TauCeti.Overconvergent.right_automorphy_cocycle.gaugeEquiv` (equivalence): Pointwise ρ(b(x)⁻¹) defines an A-linear equivalence between the J and gauge(J,b) equivariant submodules, with inverse pointwise ρ(b(x)).
- `TauCeti.Overconvergent.right_automorphy_cocycle.ofLeft` (constructor): Given compatible left/right actions x·γ=γ⁻¹x and a left cocycle K, construct the right cocycle Jγ(x)=Kγ⁻¹(x)⁻¹.
- `TauCeti.Overconvergent.right_automorphy_cocycle.gaugeEquiv_apply` (simp): The forward gauge equivalence evaluates at x as ρ(b(x)⁻¹)f(x).
- `TauCeti.Overconvergent.right_automorphy_cocycle.gaugeEquiv_symm_apply` (simp): The inverse gauge equivalence evaluates at x as ρ(b(x))f(x).

**Unit tests.**

- `TauCeti.Overconvergent.Test.O1_right_automorphy_cocycle_trivial` (degenerate): J=1 gives invariant functions.
- `TauCeti.Overconvergent.Test.O1_right_automorphy_cocycle_scalarSign` (computation): For X=Γ=Z with translation, constant J(n,x)=u^n gives f(x+n)=u^(−n)f(x).
- `TauCeti.Overconvergent.Test.O1_right_automorphy_cocycle_matrixOrder` (non-example): For A⁻¹=[[1,−1],[0,1]] and B⁻¹=[[1,0],[−1,1]] over Q, B⁻¹A⁻¹=[[1,−1],[−1,2]] differs from A⁻¹B⁻¹=[[2,−1],[−1,1]].
- `TauCeti.Overconvergent.Test.O1_right_automorphy_cocycle_gaugeIdentity` (compatibility): Gauge by b(x)=1 gives the original right cocycle and the identity equivalence on equivariant functions.

**Acceptance.**

- Trivial J gives invariant functions.
- For left K the conversion Jγ(x)=Kγ⁻¹(x)⁻¹ obeys the right law in the given order even when C is noncommutative.
- For inverse unipotent matrices A⁻¹=[[1,−1],[0,1]], B⁻¹=[[1,0],[−1,1]], the successive coefficient action is B⁻¹A⁻¹≠A⁻¹B⁻¹.

#### Equivariant coefficient sheaves

**ID:** `OverconvergentAutomorphicForms:O1/equivariant-coefficient-sheaf`. **Kind:** construction.

**Statement.** For an actual right Γ-torsor q:Y→X on the supplied analytic/v-site, an analytic cocycle J and coefficient module V on U, define E_J as the sheaf whose sections over W→X are analytic V-valued functions on Y_W×U satisfying f(yγ)=ρ(Jγ(y)⁻¹)f(y). Rational and integral versions use O and O+ respectively, with a specified stable lattice in the latter.

**Proposed declaration:** `TauCeti.Overconvergent.equivariant_coefficient_sheaf`.

**Planet:** Equivariant coefficient sheaves.

**Hypotheses.**

- The cover is the supplied torsor and its descent datum, not an unspecified map.
- V is finite analytic or the supplied Banach induced coefficient module; exactness or local freeness is not assumed for arbitrary infinite-rank coefficients.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O1/right-automorphy-cocycle`
- `OverconvergentAutomorphicForms:O0/finite-analytic-coefficients`
- `OverconvergentAutomorphicForms:O0/analytic-induced-coefficients`
- `mathlib:SheafOfModules`
- `AutomorphicBundles:B0/sections-equivariant`
- `PerfectoidSpaces:P9`
- `AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product`

**Proof outline.**

1. Use the equalizer of the two action maps on q_* of analytic coefficient functions; equalizers preserve the sheaf condition.
2. The right cocycle gives a descent datum on Y×_X Y and its triple-overlap identity.
3. For finite coefficients invoke the imported associated-bundle framework; effectivity on v/profinite covers is the separate theorem below.

**Source matches.**

- [BHW-2023](https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf), Definition 6.5 and Proposition 6.6, p.1758: Invariant coefficient functions give the actual sheaf, with analytic local freeness proved separately.

**Uses.**

- O2–O5 and O8: All four Hilbert presentations and higher-rank examples are built as actual equalizers on supplied covers.

**API.**

- `TauCeti.Overconvergent.equivariant_coefficient_sheaf.sections` (characterisation): Sections are exactly the displayed equivariant analytic functions.
- `TauCeti.Overconvergent.equivariant_coefficient_sheaf.pullback` (functoriality): Base change of torsor, cocycle and coefficients induces sheaf pullback.
- `TauCeti.Overconvergent.equivariant_coefficient_sheaf.coefficientMap` (functoriality): An intertwiner of representations induces a sheaf map.
- `TauCeti.Overconvergent.equivariant_coefficient_sheaf.tensorMap` (compatibility): Pointwise tensor gives E_J(V)⊗E_J(W)→E_J(V⊗W); it is an isomorphism for effective finite locally free descent.
- `TauCeti.Overconvergent.equivariant_coefficient_sheaf.integralInclusion` (coercion): A stable V+ gives E_J+→E_J, not automatically equality after inverting p.

**Unit tests.**

- `TauCeti.Overconvergent.Test.O1_equivariant_coefficient_sheaf_identityCover` (compatibility): For the identity torsor and trivial group, E_J is the original analytic coefficient sheaf.
- `TauCeti.Overconvergent.Test.O1_equivariant_coefficient_sheaf_line` (computation): For a scalar character, equivariance is multiplication by κ(Jγ)⁻¹.
- `TauCeti.Overconvergent.Test.O1_equivariant_coefficient_sheaf_vector` (non-example): A rank-two diagonal coefficient representation produces a rank-two descended bundle when effective, not a line bundle.

**Acceptance.**

- For an actual right Γ-torsor q:Y→X on the supplied analytic/v-site, an analytic cocycle J and coefficient module V on U, define E_J as the sheaf whose sections over W→X are analytic V-valued functions on Y_W×U satisfying f(yγ)=ρ(Jγ(y)⁻¹)f(y). Rational and integral versions use O and O+ respectively, with a specified stable lattice in the latter.

#### Functorial coefficient descent

**ID:** `OverconvergentAutomorphicForms:O1/coefficient-descent-functoriality`. **Kind:** theorem.

**Statement.** Effective finite locally free cocycle descent commutes with coefficient intertwiners, tensor, contragredient dual and base pullback; iterated descent agrees with descent through an exact effective group extension. For Banach coefficients assert only the maps and exactness supplied by the relevant Banach descent theorem.

**Proposed declaration:** `TauCeti.Overconvergent.coefficient_descent_functoriality`.

**Hypotheses.**

- Use effective descent on the indicated site. Finite quotient invariants in characteristic zero use an invertible group order; integral invariants do not inherit this automatically.
- A quotient stabilizer must act trivially on a descended coarse fibre; otherwise retain the equivariant/stack object.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O1/equivariant-coefficient-sheaf`
- `OverconvergentAutomorphicForms:O0/coefficient-tensor-dual`
- `AutomorphicBundles:B0/ineffective-fibre-descent`
- `PerfectoidSpaces:P9`

**Proof outline.**

1. Check each map on the torsor by the cocycle identity and the representation tensor/dual laws.
2. Use uniqueness of effective descent to compare the resulting maps and prove identities/composition.
3. Use AutomorphicBundles B0 ineffective-fibre criterion only for the finite tame quotient to which its hypotheses apply.

**Source matches.**

- [BHW-2023](https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf), §9, Lemmas 9.3–9.7, pp.1782–1786: Comparison of the presentations retains coefficient actions and their descent data.

**Acceptance.**

- Finite-character averaging over a p-divisible group order is valid over L but need not preserve an O+ lattice.

#### Analytic effectivity of line descent

**ID:** `OverconvergentAutomorphicForms:O1/analytic-line-effectivity`. **Kind:** theorem.

**Statement.** For smooth rigid X over a perfectoid field extension of Q_p and a v-line L obtained by cocycle descent, analyticity on a Zariski-dense analytic open implies analyticity on X. For a topologically finite-type formal O_K-scheme 𝔛 and a pro-etale profinite formal torsor 𝔛∞→𝔛, a continuous multiplicative cocycle c:G→O(𝔛∞)× gives a v-line on the generic fibre that is the analytification of a Zariski line on 𝔛. An arbitrary analytic O+-unit cocycle is not substituted for this formal cocycle.

**Proposed declaration:** `TauCeti.Overconvergent.analytic_line_effectivity`.

**Planet:** Analytic line descent.

**Hypotheses.**

- The first assertion is for line bundles, not arbitrary Banach or rank-r v-bundles.
- For the formal assertion the cocycle lies in units of the completed formal structural ring O(𝔛∞), reduces modulo p^m through a finite quotient, and the finite-level descended lines form a compatible effective system. The map O(𝔛∞)→O+(X∞) used by Heuer is a natural map, not an asserted general isomorphism.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O1/equivariant-coefficient-sheaf`
- `PerfectoidSpaces:P9`

**Proof outline.**

1. Import Heuer Corollary 1.4 and Proposition 3.8 from PerfectoidSpaces:P9, as requested below.
2. Apply the first to extend ordinary analytic trivializations of the line. For the formal assertion descend at each finite quotient modulo p^m and use formal p-adic effectivity; do not swap global sections with limits on arbitrary nonaffine bases.

**Source matches.**

- [HEUER-2022](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/E9F0B6B21BA1F345142C7301C2EDDA28/S205050942200072Xa.pdf/line-bundles-on-rigid-spaces-in-the-v-topology.pdf), Corollary 1.4, p.3; Proposition 3.8, p.16: Heuer’s formal cocycle lies in O(𝔛∞)× and its proof uses a natural map to analytic O+. The dense-open criterion is for v-lines on a smooth rigid space over a perfectoid extension of Q_p.

**Acceptance.**

- An arbitrary v-vector bundle is not declared analytic by this line-bundle criterion.

### OverconvergentAutomorphicForms:O2

Admitted domain, cz+d factor/law, geometric line, level/radius maps and algebraic specialisation.

#### Admitted Hilbert coefficient domains

**ID:** `OverconvergentAutomorphicForms:O2/admitted-hilbert-domain`. **Kind:** construction.

**Statement.** Choose the anticanonical Hilbert domain X_{Γ0*(p^n)}(ε)_a, n≥1 or ∞, and its infinite-level cover with T4’s Hodge–Tate coordinate z. The chosen bounded analytic weight extension and m,ε satisfy DOM; at finite level AL_n maps the level-domain of radius p^n ε to X(ε). At n=0 define on X(ε) by AL_1 from X_{Γ0*(p)}(pε)_a. This domain is the input for coefficients, rather than a definition of the Hilbert tower itself.

**Proposed declaration:** `TauCeti.Overconvergent.admitted_hilbert_domain`.

**Planet:** Hilbert coefficient domains.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.

**Direct inputs.**

- `HodgeTateAndCanonicalSubgroups:T4`
- `OverconvergentAutomorphicForms:O0/analytic-continuation-of-bounded-weights`
- `OverconvergentAutomorphicForms:O0/bounded-weight-families`
- `AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product`

**Proof outline.**

1. Import canonical subgroup, anticanonical domain and z-bounds from HodgeTateAndCanonicalSubgroups:T4.
2. Intersect the geometric admissibility range with the weight-extension range. Restrictions and AL_n retain the scaled Hasse radius.
3. The corrected radius exists by O0; no ε is computed from the false printed |T| formula.

**Source matches.**

- [BHW-2023](https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf), §5.3 and §6.2, Definitions 5.17 and 6.4–6.5, pp.1751,1757–1758: The cocycle is used only on weight-dependent anticanonical domains.

**Uses.**

- O2–O7: All analytic coefficient and Hecke maps require these explicit level/radius domains.

**API.**

- `TauCeti.Overconvergent.admitted_hilbert_domain.periodCoordinate` (projection): The supplied z lies in the indicated radius neighbourhood of O_p.
- `TauCeti.Overconvergent.admitted_hilbert_domain.restrict` (functoriality): For ε′≤ε, inclusion of the smaller anticanonical domain.
- `TauCeti.Overconvergent.admitted_hilbert_domain.atkinLehner` (equivalence): AL_n maps the level-domain of radius p^n ε to the base-domain of radius ε on the corresponding canonical domain.

**Unit tests.**

- `TauCeti.Overconvergent.Test.O2_admitted_hilbert_domain_ordinary` (degenerate): ε=0 gives the ordinary anticanonical domain.
- `TauCeti.Overconvergent.Test.O2_admitted_hilbert_domain_levelZero` (compatibility): At n=0 the definition is transported by AL_1, with pε on its level-domain and ε on its tame target.
- `TauCeti.Overconvergent.Test.O2_admitted_hilbert_domain_radius` (non-example): For p=3 and m=1 the sufficient bound is ε≤1/9; ε=1/3 fails the selected admission inequality even for the trivial continuous character.

**Acceptance.**

- AL_n:X_{Γ0*(p^n)}(p^nε)_a≅X(ε) scales the source radius; at level zero AL_1 uses source pε and target ε.
- At p=3,m=1 the sufficient bound is ε≤1/9; ε=1/3 is outside this admitted range.
- ε=0 is the ordinary domain, whereas overconvergent forms use the positive admitted radii.

#### Hilbert automorphy factors

**ID:** `OverconvergentAutomorphicForms:O2/hilbert-automorphy-factor`. **Kind:** construction.

**Statement.** For γ=(a b;c d)∈Γ0(p), set jγ(z)=cz+d in O_p⊗O(X∞×U); T4’s coordinate transformation makes jγ a unit in the chosen analytic neighbourhood. The scalar coefficient factor is κ(jγ(z))⁻¹. For finite/vector analytic Levi coefficients use the supplied Levi-valued torsor cocycle, not a determinant character in place of the representation. The source level action is left; write f(γx)=κ(jγ(x))⁻¹f(x). For a right-action interface use x·γ=γ⁻¹x and the factor jγ⁻¹(x) as in hilbert-cocycle-law.

**Proposed declaration:** `TauCeti.Overconvergent.hilbert_automorphy_factor`.

**Planet:** Hilbert automorphy factor.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- Use T4’s left fractional-linear coordinate convention. For a right action explicitly convert x·γ=γ⁻¹x and invert the coefficient cocycle as in O1.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O2/admitted-hilbert-domain`
- `OverconvergentAutomorphicForms:O0/analytic-continuation-of-bounded-weights`
- `HodgeTateAndCanonicalSubgroups:T4`
- `HodgeTateAndCanonicalSubgroups:T5`
- `OverconvergentAutomorphicForms:O0/finite-analytic-coefficients`
- `AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product`

**Proof outline.**

1. Use c∈pO_p and the anticanonical z-bound to place cz+d in B_r(O_p^×:1).
2. Evaluate the selected analytic κ-extension; its inverse is defined since the extension is multiplicative into units.
3. For vectors retain the actual Levi-valued left frame cocycle and its coefficient representation. Convert to O1 with Kγ⁻¹(x)⁻¹; do not reuse the scalar commutation argument for noncommuting coefficients.

**Source matches.**

- [BHW-2023](https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf), Definition 6.4, p.1757: The extension is evaluated at the actual Hodge–Tate factor, not at its reduction.

**Uses.**

- Definitions 6.4–6.5 and §10: The factor defines weight equivariance and coefficient identifications on correspondences.

**API.**

- `TauCeti.Overconvergent.hilbert_automorphy_factor.apply` (simp): jγ=cz+d and the section multiplier is κ(cz+d)⁻¹.
- `TauCeti.Overconvergent.hilbert_automorphy_factor.unit` (characterisation): jγ takes values in the admitted unit neighbourhood.
- `TauCeti.Overconvergent.hilbert_automorphy_factor.weightPullback` (functoriality): Pulling back κ pulls back its automorphy factor.

**Unit tests.**

- `TauCeti.Overconvergent.Test.O2_hilbert_automorphy_factor_upperUnipotent` (computation): For γ=(1 b;0 1), jγ=1.
- `TauCeti.Overconvergent.Test.O2_hilbert_automorphy_factor_diagonal` (computation): For γ=diag(a,d), the scalar section multiplier is κ(d)⁻¹.
- `TauCeti.Overconvergent.Test.O2_hilbert_automorphy_factor_determinant` (non-example): jγ is not det γ: diag(a,1) has jγ=1 even when det γ=a≠1.

**Acceptance.**

- For γ=(a b;c d)∈Γ0(p), set jγ(z)=cz+d in O_p⊗O(X∞×U); T4’s coordinate transformation makes jγ a unit in the chosen analytic neighbourhood. The scalar coefficient factor is κ(jγ(z))⁻¹. For finite/vector analytic Levi coefficients use the supplied Levi-valued torsor cocycle, not a determinant character in place of the representation.

#### Hilbert cocycle identity

**ID:** `OverconvergentAutomorphicForms:O2/hilbert-cocycle-law`. **Kind:** theorem.

**Statement.** For BHW’s left level action γx, the Hilbert factor jγ(x)=cγ z(x)+dγ satisfies j_{γδ}(x)=jγ(δx)jδ(x). Its analytic character extension is multiplicative on these admitted factors, so f(γx)=κ(jγ(x))⁻¹f(x) is consistent. For x·γ=γ⁻¹x, the scalar cocycle Jγ(x)=jγ⁻¹(x) obeys O1’s right law (the scalar group is commutative). For noncommuting left frame factors K use Jγ(x)=Kγ⁻¹(x)⁻¹ and retain the representation convention of O1.

**Proposed declaration:** `TauCeti.Overconvergent.hilbert_cocycle_law`.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O2/hilbert-automorphy-factor`
- `OverconvergentAutomorphicForms:O1/right-automorphy-cocycle`
- `HodgeTateAndCanonicalSubgroups:T4`

**Proof outline.**

1. Use the source left fractional-linear transformation z(δx)=(aδ z(x)+bδ)/(cδ z(x)+dδ).
2. Matrix multiplication gives cγδ z+dγδ=(cγ z(δx)+dγ)(cδ z+dδ), establishing the left law.
3. Evaluate the multiplicative analytic scalar character and use inverse coefficient equivariance. For general vector factors apply the noncommutative ofLeft conversion in O1, with reversed inverse order.

**Source matches.**

- [BHW-2023](https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf), Definition 6.4 and the construction following it, pp.1757–1758: The matrix automorphy identity makes the displayed Γ-action a group action.
- [BHW-2023](https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf), §5.2.1, Definition 5.14, pp.1749–1750; §5.5, Lemma 5.31, p.1755; §8.2, Definition 8.8, p.1768: The level action is left and the tautological frame transforms by cz+d. The displayed left cocycle law follows by matrix multiplication.

**Acceptance.**

- At p=3, γ=[[1,0],[3,1]], δ=diag(2,1), z=1, jγδ=7 and jγ(δz)jδ(z)=7; the erroneous right-action expression jγ(z)jδ(γz) is 4.
- An upper unipotent has trivial scalar factor.
- General noncommutative factors use Kγ⁻¹(x)⁻¹; coefficient factors cannot be reordered.

#### Geometric overconvergent Hilbert sheaves

**ID:** `OverconvergentAutomorphicForms:O2/geometric-hilbert-sheaf`. **Kind:** construction.

**Statement.** Define ω_n^κ on X_{Γ0*(p^n)}(ε)_a×U as the actual Γ0*(p^n)-equivariant coefficient functions on X_{Γ*(p∞)}(ε)_a×U with scalar factor κ(cz+d)⁻¹. For n=∞ use the corresponding kernel subgroup of the projection. For n=0 transport through AL_1. This is an analytic invertible sheaf, not an alias for AIP’s independent sheaf.

**Proposed declaration:** `TauCeti.Overconvergent.geometric_hilbert_sheaf`.

**Planet:** Geometric Hilbert coefficient sheaf.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O1/equivariant-coefficient-sheaf`
- `OverconvergentAutomorphicForms:O1/analytic-line-effectivity`
- `OverconvergentAutomorphicForms:O2/hilbert-cocycle-law`
- `OverconvergentAutomorphicForms:O2/admitted-hilbert-domain`
- `PerfectoidSpaces:P9`
- `AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product`

**Proof outline.**

1. Use the actual left tower action and multiplier f(γx)=κ(jγ(x))⁻¹f(x); convert to O1’s right equalizer with x·γ=γ⁻¹x and Jγ=jγ⁻¹. No unconverted right cz+d identity is used.
2. On the ordinary locus use the supplied Igusa formal trivialization and analytic-line-effectivity.
3. Use the dense-open analytic-line criterion from O1 to obtain an analytic invertible sheaf on the smooth domain; finite-level descent through the tower is supplied by P9.

**Source matches.**

- [BHW-2023](https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf), Definition 6.5 and Proposition 6.6, p.1758: The perfectoid definition and analytic-line theorem are independent of the later AIP construction.

**Uses.**

- O3, O4 and O5: Integral forms, arithmetic descent and comparison all start with this independent perfectoid sheaf.

**API.**

- `TauCeti.Overconvergent.geometric_hilbert_sheaf.sections` (characterisation): Sections are the displayed κ⁻¹-equivariant analytic functions.
- `TauCeti.Overconvergent.geometric_hilbert_sheaf.localRank` (structure): Locally free rank one over O_{X×U}.
- `TauCeti.Overconvergent.geometric_hilbert_sheaf.restriction` (functoriality): The canonical map along ε′≤ε and along the specified level maps.

**Unit tests.**

- `TauCeti.Overconvergent.Test.O2_geometric_hilbert_sheaf_trivialWeight` (degenerate): κ=1 gives O_{X×U}.
- `TauCeti.Overconvergent.Test.O2_geometric_hilbert_sheaf_parallelOne` (non-example): The parallel algebraic weight x↦N(x) gives det ω; it is not the trivial character 1.
- `TauCeti.Overconvergent.Test.O2_geometric_hilbert_sheaf_finiteLevel` (compatibility): Finite-level sections pull back to the stated equivariant functions on the infinite cover.

**Acceptance.**

- Define ω_n^κ on X_{Γ0*(p^n)}(ε)_a×U as the actual Γ0*(p^n)-equivariant coefficient functions on X_{Γ*(p∞)}(ε)_a×U with scalar factor κ(cz+d)⁻¹. For n=∞ use the corresponding kernel subgroup of the projection. For n=0 transport through AL_1. This is an analytic invertible sheaf, not an alias for AIP’s independent sheaf.

#### Hilbert level and radius compatibility

**ID:** `OverconvergentAutomorphicForms:O2/hilbert-level-radius-maps`. **Kind:** theorem.

**Statement.** The ω_n^κ pull back canonically under compatible finite/infinite level maps, rational weight pullbacks and restrictions ε′≤ε. Identifications obey identity/composition. AL_n:X_{Γ0*(p^n)}(p^nε)_a≅X(ε) transports the coefficient line on the p^nε level-domain to the ε tame-domain; in particular n=0 is defined using AL_1 from level-radius pε. Integral weight pullbacks satisfy the additional conditions of O3/hilbert-weight-pullback.

**Proposed declaration:** `TauCeti.Overconvergent.hilbert_level_radius_maps`.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- Maps of weight families pull back the specified character and its analytic extension. Claims about sheaves do not assert arbitrary nonflat base change of global sections.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O2/geometric-hilbert-sheaf`
- `OverconvergentAutomorphicForms:O1/coefficient-descent-functoriality`
- `HodgeTateAndCanonicalSubgroups:T4`

**Proof outline.**

1. Compare both sides on the common infinite cover: the coordinate, cocycle and weight coincide.
2. O1 descent-functoriality gives unique identifications. For level zero transport the definition through AL_1 rather than asserting an unrelated tower quotient.

**Source matches.**

- [BHW-2023](https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf), Definition 6.5 and Remark 6.7, p.1758; Definition 7.13, p.1764: The definitions at level zero are transported by Atkin–Lehner and the classical specialisations retain this transport.

**Acceptance.**

- A composition of level/radius maps gives the same identification as the composite map.

#### Classical Hilbert coefficient specialisation

**ID:** `OverconvergentAutomorphicForms:O2/hilbert-algebraic-specialisation`. **Kind:** comparison.

**Statement.** For κ(x)=∏_{σ:F→L}σ(x)^{kσ}, the geometric ω_n^κ identifies with ⊗_σ ω_σ^{kσ} on the anticanonical domain, pulled back via the specified AL_n convention. For κ=N^k this is (det ω)^k. Locally algebraic finite characters retain their finite-level character twist.

**Proposed declaration:** `TauCeti.Overconvergent.hilbert_algebraic_specialisation`.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- The embeddings and classical differential eigenlines are defined over L; integer exponents may be negative since the factors are lines.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O2/geometric-hilbert-sheaf`
- `AutomorphicBundles:B4`
- `HodgeTateAndCanonicalSubgroups:T5`

**Proof outline.**

1. Import the algebraic Hodge bundle and representation correspondence from AutomorphicBundles:B4.
2. T5 identifies the tautological Hodge–Tate trivialization with the differential frame; its transformation is cz+d.
3. Evaluate the algebraic character on this frame and descend. Finite-character twists are retained on their level cover.

**Source matches.**

- [BHW-2023](https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf), Remark 6.7, p.1758: Classical algebraic weights recover the corresponding Hodge powers, with determinant weight separated from the trivial character.

**Acceptance.**

- F=Q, κ(x)=x^k recovers ω^k with the stated AL convention.
- κ=1 recovers O, whereas κ=N recovers det ω.

### OverconvergentAutomorphicForms:O3

Integral lattice, conditional integral base change, rationalisation, fixed/colimit forms and ramified modification.

#### Integral Hilbert coefficient lattices

**ID:** `OverconvergentAutomorphicForms:O3/integral-hilbert-sheaf`. **Kind:** construction.

**Statement.** Define ω_n^{κ,+} as the O+ equivariance equalizer on the actual infinite-level cover, for the same left level action and multiplier κ(jγ(x))⁻¹ as ω_n^κ. The admitted factors have integral unit values. This specifies a subsheaf of rational coefficients. O5/geometric-aip-comparison identifies the two independently defined integral equalizers; positive-radius full-character local freeness additionally requires the separate O5/aip-line-and-gluing unit-trivialization input.

**Proposed declaration:** `TauCeti.Overconvergent.integral_hilbert_sheaf`.

**Planet:** Integral Hilbert coefficients.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- The coefficient chart is equipped with A+ and the character extension has integral unit values. Integral local invertibility requires the independent AIP unit-trivialization input and the comparison; characteristic-zero averaging does not supply it.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O2/geometric-hilbert-sheaf`
- `PerfectoidSpaces:P9`
- `AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product`

**Proof outline.**

1. Form the O+ equalizer using the same cocycle; inverse factors preserve O+.
2. The inclusion into rational functions is tautological. At finite level transport along the same tower and AL maps.
3. Do not assume integral local freeness here. After O5 identifies the equalizers, freeness follows only when its separate full-character integral unit-trivialization criterion is established.
4. Use O5’s integral comparison as an isomorphism of the specified O+ equalizers. Any claim of full-character positive-radius local freeness additionally requires the separate unit-trivialization input of O5/aip-line-and-gluing.

**Source matches.**

- [BHW-2023](https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf), Definition 6.5, p.1758: The integral sheaf is defined using O+, with freeness supplied by Theorem 7.14.

**Uses.**

- O5 and O6: The AIP comparison identifies the modified lattice; renormalized wild Hecke operators must preserve it.

**API.**

- `TauCeti.Overconvergent.integral_hilbert_sheaf.sections` (characterisation): Integral sections are the equivariant functions in q_*O+.
- `TauCeti.Overconvergent.integral_hilbert_sheaf.inclusion` (coercion): ω_n^{κ,+} embeds into ω_n^κ.
- `TauCeti.Overconvergent.integral_hilbert_sheaf.restrict` (functoriality): Compatible restriction and level maps preserve the lattice.

**Unit tests.**

- `TauCeti.Overconvergent.Test.O3_integral_hilbert_sheaf_trivial` (degenerate): At trivial weight the lattice is O+.
- `TauCeti.Overconvergent.Test.O3_integral_hilbert_sheaf_inverse` (computation): The inverse of an O+ unit factor preserves O+.
- `TauCeti.Overconvergent.Test.O3_integral_hilbert_sheaf_rationalLine` (non-example): On Spa(Q_p), Z_p and pZ_p are distinct integral submodules of Q_p but both rationalize to Q_p; rational invertibility therefore does not identify the chosen lattice.

**Acceptance.**

- The trivial coefficient character gives O+ by the actual invariant-function descent.
- Inverting an O+ unit preserves integral functions.
- The rational line does not determine the integral equalizer: on Spa(Q_p), Z_p and pZ_p are distinct integral lattices in Q_p with identical rationalisation.

#### Rationalisation of integral coefficients

**ID:** `OverconvergentAutomorphicForms:O3/integral-rationalisation`. **Kind:** comparison.

**Statement.** On the admitted bounded-weight domains, ω_n^{κ,+}[1/p]≅ω_n^κ, and the analogous arithmetic statement holds after its descent is constructed. This is a sheaf identity; it does not assert H^0(ω+)[1/p]≅H^0(ω) on every nonquasicompact base.

**Proposed declaration:** `TauCeti.Overconvergent.integral_rationalisation`.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- Work locally on quasicompact base and weight patches whose inverse images in the profinite level torsor are quasicompact. P9 supplies O+[1/p]=O on these inverse images, and the equivariance multipliers and their inverses are integral units. A global sections statement additionally requires a finite such cover with bounded denominators.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O3/integral-hilbert-sheaf`
- `PerfectoidSpaces:P9`

**Proof outline.**

1. On a quasicompact inverse-image patch, a rational equivariant function has a finite open cover on which it is p^−N times an O+ function. Take the maximum of these finitely many denominators, using P9’s local O+[1/p]=O contract.
2. Multiplication by this single p^N preserves the same eigencondition, so the resulting section lies in the integral equalizer. The inclusion gives the reverse direction. This is a local argument on actual torsor functions, without an integral AIP generator or an interchange of arbitrary infinite invariants with localization.
3. Glue these local equalizer identifications to obtain the sheaf identity. After O4 arithmetic descent is constructed, use the same bounded-denominator argument on its quasicompact covers and its integral-unit transport maps; no division by a group order is needed.

**Source matches.**

- [BHW-2023](https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf), Definition 9.8, p.1786: The source rationalization is a sheaf statement and requires integral descent rather than arbitrary invariants/localization interchange.

**Acceptance.**

- On an affinoid trivializing patch rational sections are precisely integral sections with a bounded p-denominator.

#### Variation of Hilbert coefficients in weight

**ID:** `OverconvergentAutomorphicForms:O3/hilbert-weight-pullback`. **Kind:** theorem.

**Statement.** For a morphism of bounded smooth weight families U′→U pulling back κ and the chosen common analytic extension, the pulled-back geometric coefficient line is ω_n^{κ′}; with compatible integral structures the same holds integrally. These identifications commute with level and radius maps.

**Proposed declaration:** `TauCeti.Overconvergent.hilbert_weight_pullback`.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- Maps of weight families pull back the specified character and its analytic extension. Claims about sheaves do not assert arbitrary nonflat base change of global sections.
- Integral pullback is claimed only for flat formal coefficient changes satisfying P9’s completed-descent hypotheses, or for the explicitly proved AIP chart refinement maps. Arbitrary integral weight specialisation is excluded (AIP CUSP Remark 3.15).

**Direct inputs.**

- `OverconvergentAutomorphicForms:O3/integral-hilbert-sheaf`
- `OverconvergentAutomorphicForms:O1/coefficient-descent-functoriality`
- `OverconvergentAutomorphicForms:O2/hilbert-level-radius-maps`
- `PerfectoidSpaces:P9`

**Proof outline.**

1. On the tower, pullback of the character is exactly the new automorphy factor.
2. Use finite locally free coefficient descent and its base-change law rather than commuting arbitrary invariants with a nonflat tensor product.
3. For O+ use the requested bounded integral descent/base-change theorem on compatible integral charts.

**Source matches.**

- [BHW-2023](https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf), §6.1–6.2, Definitions 6.2 and 6.5, pp.1756–1758: The sheaves are defined on X×U with a universal family factor; pullback is coefficient-compatible.
- [AIP-CUSP-2016](https://www.imo.universite-paris-saclay.fr/~pilloni/AIP2.pdf), Remark 3.15, p.17: Integral base change can fail because finite group cohomology obstructs invariants.

**Acceptance.**

- Specialising a family to a point recovers its character sheaf.
- This theorem does not imply arbitrary base change for all fixed-radius global sections.

#### Fixed-radius Hilbert forms

**ID:** `OverconvergentAutomorphicForms:O3/fixed-radius-hilbert-forms`. **Kind:** construction.

**Statement.** Mκ^{G*,c}(n,N,ε;U)=H^0(X_{c,U,Γ0*(p^n),μN}(ε)_a,ω_n^κ); define Mκ^{G*,c,+} using ω_n^{κ,+}. Restriction maps go from a larger admitted neighbourhood to a smaller one. Banach and projectivity claims require the finite-level affinoid weight and cusp hypotheses in O6.

**Proposed declaration:** `TauCeti.Overconvergent.fixed_radius_hilbert_forms`.

**Planet:** Fixed-radius Hilbert forms.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- Fix a positive prime-to-p polarisation ideal c. Both ε=0 and ε>0 have meanings, but they are different domains.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O2/geometric-hilbert-sheaf`
- `OverconvergentAutomorphicForms:O3/integral-hilbert-sheaf`
- `OverconvergentAutomorphicForms:O2/hilbert-level-radius-maps`
- `HilbertModularVarietiesAndShimuraCurves:H3`
- `AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product`

**Proof outline.**

1. Take sections of the already constructed sheaves. The integral inclusion follows from O3 integral-hilbert-sheaf.
2. Use sheaf restriction for maps; define the fixed-radius topology from the actual affinoid/coherent or Banach coefficient model, not the discrete topology.

**Source matches.**

- [BHW-2023](https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf), Definition 6.8, p.1758: Fixed-radius spaces are global sections with the polarisation ideal, level and weight base retained.

**Uses.**

- O4, O6 and O7: Polarisation sums, Hecke operators and ordinary restriction act on these exact spaces.

**API.**

- `TauCeti.Overconvergent.fixed_radius_hilbert_forms.restrict` (functoriality): Restriction along ε′≤ε, with identity and composition.
- `TauCeti.Overconvergent.fixed_radius_hilbert_forms.integralInclusion` (coercion): Integral sections map to rational sections.
- `TauCeti.Overconvergent.fixed_radius_hilbert_forms.evaluateWeight` (functoriality): Pullback of a section to a weight fibre; no surjectivity without O6 hypotheses.

**Unit tests.**

- `TauCeti.Overconvergent.Test.O3_fixed_radius_hilbert_forms_zero` (degenerate): The zero section belongs to every fixed-radius module.
- `TauCeti.Overconvergent.Test.O3_fixed_radius_hilbert_forms_trivial` (compatibility): For κ=1 the space is H^0 of O on the actual domain.
- `TauCeti.Overconvergent.Test.O3_fixed_radius_hilbert_forms_ordinary` (non-example): ε=0 defines ordinary-locus sections and is not a synonym for positive-radius overconvergence.

**Acceptance.**

- Mκ^{G*,c}(n,N,ε;U)=H^0(X_{c,U,Γ0*(p^n),μN}(ε)_a,ω_n^κ); define Mκ^{G*,c,+} using ω_n^{κ,+}. Restriction maps go from a larger admitted neighbourhood to a smaller one. Banach and projectivity claims require the finite-level affinoid weight and cusp hypotheses in O6.

#### Overconvergent Hilbert forms

**ID:** `OverconvergentAutomorphicForms:O3/overconvergent-hilbert-forms`. **Kind:** construction.

**Statement.** Mκ^{G*,c,†}=colim_{ε>0 admitted}Mκ^{G*,c}(n,N,ε;U) along restrictions toward the ordinary locus. Its integral counterpart is the same filtered colimit of the specified lattices. The locally convex direct-limit topology is used when asserting continuity; no equality with all ordinary-locus sections is built into the definition.

**Proposed declaration:** `TauCeti.Overconvergent.overconvergent_hilbert_forms`.

**Planet:** Overconvergent Hilbert forms.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- At a bounded family choose the positive cofinal system admitted for that family; compare choices via a common cofinal subsystem.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O3/fixed-radius-hilbert-forms`
- `LocallyAnalyticDistributions:L4/projective-banach-modules`
- `LocallyAnalyticDistributions:L0`
- `AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product`

**Proof outline.**

1. Construct the filtered colimit of actual section modules and restriction maps.
2. Equip it with the direct-limit locally convex topology supplied by LAD, using the Banach models at finite affinoid weight and finite level where available.
3. Functoriality follows from commuting restriction diagrams; cofinal changes do not change the module.

**Source matches.**

- [BHW-2023](https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf), Definitions 6.5–6.8 and Remark 6.9, pp.1758–1759: The roadmap separates fixed positive radii, their colimit and the ordinary endpoint; AIP supplies their Banach models.

**Uses.**

- O6 and O7: Hecke maps pass to the colimit and ordinary restriction evaluates every positive-radius representative.

**API.**

- `TauCeti.Overconvergent.overconvergent_hilbert_forms.ofRadius` (constructor): Canonical map from any positive admitted radius.
- `TauCeti.Overconvergent.overconvergent_hilbert_forms.lift` (universal-property): Compatible linear maps from every radius induce a unique map from the colimit.
- `TauCeti.Overconvergent.overconvergent_hilbert_forms.cofinal` (equivalence): A cofinal family of positive admitted radii gives the same overconvergent module.

**Unit tests.**

- `TauCeti.Overconvergent.Test.O3_overconvergent_hilbert_forms_representative` (characterisation): Every element has a representative at some positive admitted radius.
- `TauCeti.Overconvergent.Test.O3_overconvergent_hilbert_forms_equality` (characterisation): Two representatives agree iff their restrictions agree at some smaller positive admitted radius.
- `TauCeti.Overconvergent.Test.O3_overconvergent_hilbert_forms_ordinary` (non-example): A section defined only at ε=0 has no tautological representative in this colimit.

**Acceptance.**

- Mκ^{G*,c,†}=colim_{ε>0 admitted}Mκ^{G*,c}(n,N,ε;U) along restrictions toward the ordinary locus. Its integral counterpart is the same filtered colimit of the specified lattices. The locally convex direct-limit topology is used when asserting continuity; no equality with all ordinary-locus sections is built into the definition.

#### Modified lattices at ramified primes

**ID:** `OverconvergentAutomorphicForms:O3/ramified-modified-lattice`. **Kind:** application.

**Statement.** At ramified p, the integral differential module used for AIP coefficients is ω^int, the O_F⊗O+-span of the appropriate Hodge–Tate/canonical-subgroup image. It is locally free of rank one over O_F⊗O+ in the admitted range, although the naive ω+ need not be so away from the Rapoport locus. The perfectoid integral line is compared to coefficients of ω^int, not to a nonexistent splitting of naive ω+.

**Proposed declaration:** `TauCeti.Overconvergent.ramified_modified_lattice`.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- Use T5’s exact canonical-subgroup range and modified differential theorem; the Rapoport condition is not imposed globally.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O3/integral-hilbert-sheaf`
- `HodgeTateAndCanonicalSubgroups:T5`

**Proof outline.**

1. Import the modified differential lattice and Hodge–Tate image from T5.
2. Use its rank-one theorem to define the differential frame torsor used by O5.
3. Retain both lattices and the map between them; only on the locus where the supplied theorem identifies them can the modification be omitted.

**Source matches.**

- [BHW-2023](https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf), §7.1, pp.1759–1761: The ramified integral construction modifies the differential lattice before forming the torsor.

**Acceptance.**

- For a split/unramified Rapoport point the expected differential eigenline model agrees with the modification.
- As a local algebra test, over k[e]/e² the regular module has e acting as a nonzero Jordan block, whereas k² with e acting by zero is not free of rank one; equal k-dimensions do not establish O_F-line freeness.

### OverconvergentAutomorphicForms:O4

Four independent presentations, quotient relations, finite twisted descent, pairing comparison and polarisation-class independence.

#### Geometric small-cover coefficients

**ID:** `OverconvergentAutomorphicForms:O4/presentation-geometric-small`. **Kind:** construction.

**Statement.** Define presentation (1) independently as the O+ equivariance equalizer on the actual cover X_{U,Γ*(p∞)}(ε)_a×U, with acting group Γ0*(p^n) and section transformation multiplier κ(cz+d)⁻¹; rational coefficients replace O+ by O. Push forward to the finite-level base. None of the four definitions is an abbreviation for another.

**Proposed declaration:** `TauCeti.Overconvergent.presentation_geometric_small`.

**Planet:** Geometric small-cover coefficients.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- An arithmetic family is κ_ar=(w,t), with geometric κ=ρ(w,t). n≥1 or ∞; level zero is transported separately by AL_1.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O1/equivariant-coefficient-sheaf`
- `OverconvergentAutomorphicForms:O2/hilbert-automorphy-factor`
- `HilbertModularVarietiesAndShimuraCurves:H4`
- `PerfectoidShimuraVarieties:S5`
- `AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product`

**Proof outline.**

1. Import the stated cover, group action and quotient from H4/S5. Use the same pulled-back Hodge–Tate coordinate on that cover.
2. Form O1’s equivariant-function equalizer. For quotient groups the next representative-independence theorem is needed before the action is well-defined.
3. Retain the separate cover and action as construction data; comparisons are subsequent maps, not definitional equalities.

**Source matches.**

- [BHW-2023](https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf), Definition 9.1(1), pp.1780–1781: The Γ0*(p^n)-action on X_{U,Γ*(p∞)} gives this distinct presentation and its precise coefficient multiplier.

**Uses.**

- Lemmas 9.2–9.7 and Theorem 9.12: Presentation (1) participates in explicit integral and rational comparison maps.

**API.**

- `TauCeti.Overconvergent.presentation_geometric_small.sections` (characterisation): Sections satisfy exactly the Γ0*(p^n)-equivariance condition with multiplier κ(cz+d)⁻¹.
- `TauCeti.Overconvergent.presentation_geometric_small.integralInclusion` (coercion): The O+ equalizer embeds in its O version.
- `TauCeti.Overconvergent.presentation_geometric_small.pullback` (functoriality): Compatible level, radius and weight pullback retains this cover and coefficient action.

**Unit tests.**

- `TauCeti.Overconvergent.Test.O4_presentation_geometric_small_trivial` (degenerate): When w=t=1, the presentation is the structural sheaf on its own quotient base.
- `TauCeti.Overconvergent.Test.O4_presentation_geometric_small_factor` (computation): The section multiplier on a group element is κ(cz+d)⁻¹, including its sign and determinant/polarisation component.
- `TauCeti.Overconvergent.Test.O4_presentation_geometric_small_cover` (computation): For ε∈Z_p^×, diag(ε,1) has j=1 and fixes every weight-equivariant coefficient function on the small cover; this is the invariance used in the full-cover comparison.

**Acceptance.**

- Define presentation (1) independently as the O+ equivariance equalizer on the actual cover X_{U,Γ*(p∞)}(ε)_a×U, with acting group Γ0*(p^n) and section transformation multiplier κ(cz+d)⁻¹; rational coefficients replace O+ by O. Push forward to the finite-level base. None of the four definitions is an abbreviation for another.

#### Geometric full-cover coefficients

**ID:** `OverconvergentAutomorphicForms:O4/presentation-geometric-full`. **Kind:** construction.

**Statement.** Define presentation (2) independently as the O+ equivariance equalizer on the actual cover X_{U,Γ(p∞)}(ε)_a×U, with acting group Γ0(p^n) and section transformation multiplier κ(cz+d)⁻¹; rational coefficients replace O+ by O. Push forward to the finite-level base. None of the four definitions is an abbreviation for another.

**Proposed declaration:** `TauCeti.Overconvergent.presentation_geometric_full`.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- An arithmetic family is κ_ar=(w,t), with geometric κ=ρ(w,t). n≥1 or ∞; level zero is transported separately by AL_1.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O1/equivariant-coefficient-sheaf`
- `OverconvergentAutomorphicForms:O2/hilbert-automorphy-factor`
- `HilbertModularVarietiesAndShimuraCurves:H4`
- `PerfectoidShimuraVarieties:S5`
- `AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product`

**Proof outline.**

1. Import the stated cover, group action and quotient from H4/S5. Use the same pulled-back Hodge–Tate coordinate on that cover.
2. Form O1’s equivariant-function equalizer. For quotient groups the next representative-independence theorem is needed before the action is well-defined.
3. Retain the separate cover and action as construction data; comparisons are subsequent maps, not definitional equalities.

**Source matches.**

- [BHW-2023](https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf), Definition 9.1(2), pp.1780–1781: The Γ0(p^n)-action on X_{U,Γ(p∞)} gives this distinct presentation and its precise coefficient multiplier.

**Uses.**

- Lemmas 9.2–9.7 and Theorem 9.12: Presentation (2) participates in explicit integral and rational comparison maps.

**API.**

- `TauCeti.Overconvergent.presentation_geometric_full.sections` (characterisation): Sections satisfy exactly the Γ0(p^n)-equivariance condition with multiplier κ(cz+d)⁻¹.
- `TauCeti.Overconvergent.presentation_geometric_full.integralInclusion` (coercion): The O+ equalizer embeds in its O version.
- `TauCeti.Overconvergent.presentation_geometric_full.pullback` (functoriality): Compatible level, radius and weight pullback retains this cover and coefficient action.

**Unit tests.**

- `TauCeti.Overconvergent.Test.O4_presentation_geometric_full_trivial` (degenerate): When w=t=1, the presentation is the structural sheaf on its own quotient base.
- `TauCeti.Overconvergent.Test.O4_presentation_geometric_full_factor` (computation): The section multiplier on a group element is κ(cz+d)⁻¹, including its sign and determinant/polarisation component.
- `TauCeti.Overconvergent.Test.O4_presentation_geometric_full_cover` (computation): For u∈O_p^×, diag(u,1) has j=1 and fixes a section of presentation (2), while its determinant may be nontrivial.

**Acceptance.**

- Define presentation (2) independently as the O+ equivariance equalizer on the actual cover X_{U,Γ(p∞)}(ε)_a×U, with acting group Γ0(p^n) and section transformation multiplier κ(cz+d)⁻¹; rational coefficients replace O+ by O. Push forward to the finite-level base. None of the four definitions is an abbreviation for another.

#### Arithmetic intermediate-cover coefficients

**ID:** `OverconvergentAutomorphicForms:O4/presentation-arithmetic-intermediate`. **Kind:** construction.

**Statement.** Define presentation (3) independently as the O+ equivariance equalizer on the actual cover X_{U,Γ(p∞)}(ε)_a×U, with acting group E(p^n) and section transformation multiplier κ(cz+d)⁻¹w(x) for a representative (γ,x); rational coefficients replace O+ by O. Push forward to the finite-level base. None of the four definitions is an abbreviation for another.

**Proposed declaration:** `TauCeti.Overconvergent.presentation_arithmetic_intermediate`.

**Planet:** Arithmetic intermediate-cover coefficients.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- An arithmetic family is κ_ar=(w,t), with geometric κ=ρ(w,t). n≥1 or ∞; level zero is transported separately by AL_1.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O1/equivariant-coefficient-sheaf`
- `OverconvergentAutomorphicForms:O2/hilbert-automorphy-factor`
- `HilbertModularVarietiesAndShimuraCurves:H4`
- `PerfectoidShimuraVarieties:S5`
- `OverconvergentAutomorphicForms:O0/weight-comparison-totally-positive-units`
- `OverconvergentAutomorphicForms:O4/arithmetic-representatives`
- `AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product`

**Proof outline.**

1. Import the stated cover, group action and quotient from H4/S5. Use the same pulled-back Hodge–Tate coordinate on that cover.
2. Form O1’s equivariant-function equalizer. For quotient groups the next representative-independence theorem is needed before the action is well-defined.
3. Retain the separate cover and action as construction data; comparisons are subsequent maps, not definitional equalities.

**Source matches.**

- [BHW-2023](https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf), Definition 9.1(3), pp.1780–1781: The E(p^n)-action on X_{U,Γ(p∞)} gives this distinct presentation and its precise coefficient multiplier.

**Uses.**

- Lemmas 9.2–9.7 and Theorem 9.12: Presentation (3) participates in explicit integral and rational comparison maps.

**API.**

- `TauCeti.Overconvergent.presentation_arithmetic_intermediate.sections` (characterisation): Sections satisfy exactly the E(p^n)-equivariance condition with multiplier κ(cz+d)⁻¹w(x) for a representative (γ,x).
- `TauCeti.Overconvergent.presentation_arithmetic_intermediate.integralInclusion` (coercion): The O+ equalizer embeds in its O version.
- `TauCeti.Overconvergent.presentation_arithmetic_intermediate.pullback` (functoriality): Compatible level, radius and weight pullback retains this cover and coefficient action.

**Unit tests.**

- `TauCeti.Overconvergent.Test.O4_presentation_arithmetic_intermediate_trivial` (degenerate): When w=t=1, the presentation is the structural sheaf on its own quotient base.
- `TauCeti.Overconvergent.Test.O4_presentation_arithmetic_intermediate_factor` (computation): The section multiplier on a group element is κ(cz+d)⁻¹w(x) for a representative (γ,x), including its sign and determinant/polarisation component.
- `TauCeti.Overconvergent.Test.O4_presentation_arithmetic_intermediate_cover` (compatibility): For η∈O_F^{×,+}, the representative change (γ,x)↦(γηI,xη²) leaves κ(cz+d)⁻¹w(x) unchanged.

**Acceptance.**

- Define presentation (3) independently as the O+ equivariance equalizer on the actual cover X_{U,Γ(p∞)}(ε)_a×U, with acting group E(p^n) and section transformation multiplier κ(cz+d)⁻¹w(x) for a representative (γ,x); rational coefficients replace O+ by O. Push forward to the finite-level base. None of the four definitions is an abbreviation for another.

#### Arithmetic full-cover coefficients

**ID:** `OverconvergentAutomorphicForms:O4/presentation-arithmetic-full`. **Kind:** construction.

**Statement.** Define presentation (4) independently as the O+ equivariance equalizer on the actual cover X_{G,U,Γ(p∞)}(ε)_a×U, with acting group PΓ0(p^n) and section transformation multiplier κ(cz+d)⁻¹w(det γ); rational coefficients replace O+ by O. Push forward to the finite-level base. None of the four definitions is an abbreviation for another.

**Proposed declaration:** `TauCeti.Overconvergent.presentation_arithmetic_full`.

**Planet:** Arithmetic full-cover coefficients.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- An arithmetic family is κ_ar=(w,t), with geometric κ=ρ(w,t). n≥1 or ∞; level zero is transported separately by AL_1.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O1/equivariant-coefficient-sheaf`
- `OverconvergentAutomorphicForms:O2/hilbert-automorphy-factor`
- `HilbertModularVarietiesAndShimuraCurves:H4`
- `PerfectoidShimuraVarieties:S5`
- `OverconvergentAutomorphicForms:O0/weight-comparison-totally-positive-units`
- `OverconvergentAutomorphicForms:O4/arithmetic-representatives`
- `AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product`

**Proof outline.**

1. Import the stated cover, group action and quotient from H4/S5. Use the same pulled-back Hodge–Tate coordinate on that cover.
2. Form O1’s equivariant-function equalizer. For quotient groups the next representative-independence theorem is needed before the action is well-defined.
3. Retain the separate cover and action as construction data; comparisons are subsequent maps, not definitional equalities.

**Source matches.**

- [BHW-2023](https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf), Definition 9.1(4), pp.1780–1781: The PΓ0(p^n)-action on X_{G,U,Γ(p∞)} gives this distinct presentation and its precise coefficient multiplier.

**Uses.**

- Lemmas 9.2–9.7 and Theorem 9.12: Presentation (4) participates in explicit integral and rational comparison maps.

**API.**

- `TauCeti.Overconvergent.presentation_arithmetic_full.sections` (characterisation): Sections satisfy exactly the PΓ0(p^n)-equivariance condition with multiplier κ(cz+d)⁻¹w(det γ).
- `TauCeti.Overconvergent.presentation_arithmetic_full.integralInclusion` (coercion): The O+ equalizer embeds in its O version.
- `TauCeti.Overconvergent.presentation_arithmetic_full.pullback` (functoriality): Compatible level, radius and weight pullback retains this cover and coefficient action.

**Unit tests.**

- `TauCeti.Overconvergent.Test.O4_presentation_arithmetic_full_trivial` (degenerate): When w=t=1, the presentation is the structural sheaf on its own quotient base.
- `TauCeti.Overconvergent.Test.O4_presentation_arithmetic_full_factor` (computation): The section multiplier on a group element is κ(cz+d)⁻¹w(det γ), including its sign and determinant/polarisation component.
- `TauCeti.Overconvergent.Test.O4_presentation_arithmetic_full_cover` (compatibility): For η∈(1+NO_F)^{×,+}, the central scalar ηI has multiplier κ(η)⁻¹w(η²)=1.

**Acceptance.**

- Define presentation (4) independently as the O+ equivariance equalizer on the actual cover X_{G,U,Γ(p∞)}(ε)_a×U, with acting group PΓ0(p^n) and section transformation multiplier κ(cz+d)⁻¹w(det γ); rational coefficients replace O+ by O. Push forward to the finite-level base. None of the four definitions is an abbreviation for another.

#### Well-defined arithmetic coefficient actions

**ID:** `OverconvergentAutomorphicForms:O4/arithmetic-representatives`. **Kind:** theorem.

**Statement.** The multiplier of presentation (3) is unchanged by (γ,x)↦(γηI,xη²), η∈O_F^{×,+}. The multiplier of (4) kills the central closure Z∞ of (1+NO_F)^{×,+}, so descends to PΓ0(p^n). Both assertions use κ(η)⁻¹w(η²)=1.

**Proposed declaration:** `TauCeti.Overconvergent.arithmetic_representatives`.

**Hypotheses.**

- Use H4’s actual quotient relations and topological closure, not a quotient by all p-adic units.
- Arithmetic κ=ρ(w,t), and totally positive global units have norm 1.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O0/weight-comparison-totally-positive-units`
- `OverconvergentAutomorphicForms:O2/hilbert-cocycle-law`
- `HilbertModularVarietiesAndShimuraCurves:H4`

**Proof outline.**

1. Apply weight-comparison-totally-positive-units to η.
2. In (3), cz+d becomes η(cz+d) and the polarisation multiplier gains w(η²), so the product is unchanged.
3. In (4), the central factor is the same identity; continuity extends it to Z∞. The descent law follows from the Hilbert cocycle law.

**Source matches.**

- [BHW-2023](https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf), Lemma 9.2 and equation (9.1), pp.1781–1782: The norm-one identity is exactly what makes both quotient actions well-defined.

**Acceptance.**

- Ignoring w(η²) generally breaks presentation (3).

#### Comparison of geometric covers

**ID:** `OverconvergentAutomorphicForms:O4/geometric-full-cover-comparison`. **Kind:** comparison.

**Statement.** Pullback from the full Γ tower to the Γ* tower identifies presentations (2) and (1), integrally and rationally. The inverse is constructed through X_{Γ*(p∞)}←X_{Γ*(p∞)}×O_p^×→X_{Γ(p∞)}, whose right map is a Z_p^×-torsor. It is a genuine isomorphism independent of the choice of full geometric cover.

**Proposed declaration:** `TauCeti.Overconvergent.geometric_full_cover_comparison`.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- An arithmetic family is κ_ar=(w,t), with geometric κ=ρ(w,t). n≥1 or ∞; level zero is transported separately by AL_1.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O4/presentation-geometric-small`
- `OverconvergentAutomorphicForms:O4/presentation-geometric-full`
- `PerfectoidShimuraVarieties:S5`
- `PerfectoidSpaces:P9`
- `HodgeTateAndCanonicalSubgroups:T4`
- `AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product`

**Proof outline.**

1. Pull back a section along the tower morphism; the coordinate/cocycle agree by S5/T4.
2. For the inverse, pull the Γ* section to the product. The action diag(ε,1), ε∈Z_p^×, has j=1, giving invariance under the antidiagonal torsor action.
3. Use P9’s O/O+ profinite torsor descent. Verify diag(u,1) invariance for all u∈O_p^× and Γ0* equivariance; these generate the full Γ0 action. The composites are the identity by faithful pullback.

**Source matches.**

- [BHW-2023](https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf), Lemma 9.3, pp.1782–1783: The source supplies the explicit torsor span and inverse map, not just equality of dimensions.

**Acceptance.**

- For diag(u,1), the coefficient factor is κ(1)⁻¹=1.

#### Twisted polarisation action

**ID:** `OverconvergentAutomorphicForms:O4/twisted-polarisation-action`. **Kind:** construction.

**Statement.** On π_* of presentation (2), define the left action of positive global units by ε·_w f=w(ε)(ε⁻¹)^*f. This preserves the geometric coefficient sheaf and factors through the finite group Δ(N) supplied by H4. This finite group differs from the profinite Δ(p∞N) acting on full towers.

**Proposed declaration:** `TauCeti.Overconvergent.twisted_polarisation_action`.

**Planet:** Twisted polarisation action.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- An arithmetic family is κ_ar=(w,t), with geometric κ=ρ(w,t). n≥1 or ∞; level zero is transported separately by AL_1.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O4/presentation-geometric-full`
- `OverconvergentAutomorphicForms:O4/arithmetic-representatives`
- `HilbertModularVarietiesAndShimuraCurves:H4`
- `HodgeTateAndCanonicalSubgroups:T4`
- `AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product`

**Proof outline.**

1. Compute the left action law using the commutative character w and inverse base pullback.
2. Polarisation preserves the Hodge–Tate coordinate and commutes with the Γ action, so preserves geometric equivariance.
3. Use H4’s congruence/square relations and κ(η)⁻¹w(η²)=1 to kill the specified kernel; do not assert that all totally positive units are squares.

**Source matches.**

- [BHW-2023](https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf), Definition 9.4 and Lemma 9.5, p.1783: The inverse pullback and weight twist define the correct finite polarisation action.

**Uses.**

- Lemma 9.6 and AIP arithmetic coefficients: Arithmetic descent takes invariants under this finite twisted action.

**API.**

- `TauCeti.Overconvergent.twisted_polarisation_action.apply` (simp): ε·_w f=w(ε)(ε⁻¹)^*f.
- `TauCeti.Overconvergent.twisted_polarisation_action.mul` (relation): (εδ)·_w f=ε·_w(δ·_w f).
- `TauCeti.Overconvergent.twisted_polarisation_action.finiteAction` (structure): The action factors through the specified finite Δ(N).

**Unit tests.**

- `TauCeti.Overconvergent.Test.O4_twisted_polarisation_action_trivialW` (degenerate): w=1 gives inverse polarisation pullback.
- `TauCeti.Overconvergent.Test.O4_twisted_polarisation_action_constant` (computation): On a scalar constant section the action is multiplication by w(ε).
- `TauCeti.Overconvergent.Test.O4_twisted_polarisation_action_inverse` (non-example): Using ε^* instead of (ε⁻¹)^* gives the opposite base action and generally changes the descent.

**Acceptance.**

- On π_* of presentation (2), define the left action of positive global units by ε·_w f=w(ε)(ε⁻¹)^*f. This preserves the geometric coefficient sheaf and factors through the finite group Δ(N) supplied by H4. This finite group differs from the profinite Δ(p∞N) acting on full towers.

#### Finite polarisation descent

**ID:** `OverconvergentAutomorphicForms:O4/finite-polarisation-descent`. **Kind:** comparison.

**Statement.** Presentation (3) is canonically (π_* presentation (2))^{Δ(N)}, with the O4 twisted polarisation action, for both integral and rational coefficients. The quotient is the finite effective geometric-to-arithmetic polarisation quotient; it is not the full profinite tower quotient.

**Proposed declaration:** `TauCeti.Overconvergent.finite_polarisation_descent`.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- An arithmetic family is κ_ar=(w,t), with geometric κ=ρ(w,t). n≥1 or ∞; level zero is transported separately by AL_1.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O4/presentation-arithmetic-intermediate`
- `OverconvergentAutomorphicForms:O4/presentation-geometric-full`
- `OverconvergentAutomorphicForms:O4/twisted-polarisation-action`
- `HilbertModularVarietiesAndShimuraCurves:H4`

**Proof outline.**

1. Use H4’s finite quotient and the description of E(p^n) as the extension carrying both Γ and positive-unit actions.
2. A section invariant under the twisted action satisfies exactly the E multiplier of presentation (3), and conversely.
3. Sheaf equalizers therefore identify the two constructions even integrally; no averaging by 1/|Δ(N)| is used to define integral invariants.

**Source matches.**

- [BHW-2023](https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf), Lemma 9.6, p.1784: Finite twisted Δ(N)-invariants give the intermediate arithmetic presentation.

**Acceptance.**

- Integral descent is not justified by dividing by a potentially p-divisible |Δ(N)|.

#### Weil-pairing arithmetic comparison

**ID:** `OverconvergentAutomorphicForms:O4/weil-pairing-comparison`. **Kind:** comparison.

**Statement.** The map from presentation (4) to presentation (3) is f↦w(eβ)⁻¹π∞^*f. Its inverse multiplies by w(eβ) and descends through the actual profinite Δ(p∞N)-torsor. Both maps preserve O+ and are inverse. The transformation is (γ,x)^*w(eβ)=w(x⁻¹)w(det γ)w(eβ).

**Proposed declaration:** `TauCeti.Overconvergent.weil_pairing_comparison`.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- An arithmetic family is κ_ar=(w,t), with geometric κ=ρ(w,t). n≥1 or ∞; level zero is transported separately by AL_1.
- The full-level pairing eβ is an O_p^×-valued map supplied by S5, with the stated transformation law.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O4/presentation-arithmetic-full`
- `OverconvergentAutomorphicForms:O4/presentation-arithmetic-intermediate`
- `OverconvergentAutomorphicForms:O4/arithmetic-representatives`
- `PerfectoidShimuraVarieties:S5`
- `PerfectoidSpaces:P9`
- `AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product`

**Proof outline.**

1. Multiply the pullback by the inverse pairing character; its transformation changes w(det γ) into w(x) by cancellation.
2. For the inverse, w(eβ)f is invariant under positive global units. Their density in the profinite quotient and continuity extend invariance to Δ(p∞N).
3. Apply P9 profinite descent and faithful pullback to prove the inverse and its PΓ0 equivariance. Pairing values are integral units, so preserve O+.

**Source matches.**

- [BHW-2023](https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf), Equation (9.5) and Lemma 9.7, pp.1784–1786: The pairing transformation is the nontrivial coefficient twist in the comparison.

**Acceptance.**

- The plain pullback π∞^* does not convert the determinant multiplier to the polarisation multiplier when w is nontrivial.

#### Forms across polarisation classes

**ID:** `OverconvergentAutomorphicForms:O4/polarisation-class-forms`. **Kind:** construction.

**Statement.** For arithmetic forms take the direct sum of fixed-c spaces over prime-to-p fractional ideals and quotient by P_x(f)−f for totally positive p-adic units x, where P_x transports c to xc. The indexing quotient is the finite narrow class group. Integral forms use the corresponding integral lattices. For G* retain a chosen set of class representatives and the specified comparison maps.

**Proposed declaration:** `TauCeti.Overconvergent.polarisation_class_forms`.

**Planet:** Polarisation-class Hilbert forms.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- An arithmetic family is κ_ar=(w,t), with geometric κ=ρ(w,t). n≥1 or ∞; level zero is transported separately by AL_1.
- Use H3/H4’s transport maps and their composition law; for arithmetic forms a transport by a positive unit stabilizing an ideal is already the identity after descent.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O3/fixed-radius-hilbert-forms`
- `OverconvergentAutomorphicForms:O4/weil-pairing-comparison`
- `OverconvergentAutomorphicForms:O4/finite-polarisation-descent`
- `HilbertModularVarietiesAndShimuraCurves:H3`
- `HilbertModularVarietiesAndShimuraCurves:H4`
- `tauceti:NumberField.NarrowClassGroup`
- `tauceti:NumberField.NarrowClassGroup.instFinite`
- `AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product`

**Proof outline.**

1. Construct arithmetic fixed-c sections from presentation (4) and its level-zero transport.
2. Use H4’s positive-p-unit transport and its composition law to form the stated quotient module.
3. Use baseline NarrowClassGroup and its finiteness instead of rebuilding ideal class theory; H3 supplies identification of the prime-to-p ideal indexing quotient.

**Source matches.**

- [BHW-2023](https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf), Definition 9.10, pp.1786–1787: The quotient over polarisation ideals is essential because Hecke maps change c.

**Uses.**

- BHW §10 and AIP §4: Tame and wild operators permute polarisation components; the quotient makes the arithmetic action canonical.

**API.**

- `TauCeti.Overconvergent.polarisation_class_forms.ofIdeal` (constructor): Map each fixed-c arithmetic form into the class-independent quotient.
- `TauCeti.Overconvergent.polarisation_class_forms.transportRelation` (relation): ofIdeal(P_x f)=ofIdeal(f).
- `TauCeti.Overconvergent.polarisation_class_forms.representatives` (equivalence): A finite set of narrow-class representatives yields the direct-sum presentation, using the arithmetic stabilizer identity.

**Unit tests.**

- `TauCeti.Overconvergent.Test.O4_polarisation_class_forms_rational` (computation): For F=Q there is one narrow ideal class and arithmetic forms reduce to the single class component.
- `TauCeti.Overconvergent.Test.O4_polarisation_class_forms_transport` (characterisation): The class of f at c equals the class of P_x f at xc.
- `TauCeti.Overconvergent.Test.O4_polarisation_class_forms_geometricChoices` (non-example): For G* a change of representatives retains noncanonical polarisation maps; arithmetic independence is not silently asserted before descent.

**Acceptance.**

- For arithmetic forms take the direct sum of fixed-c spaces over prime-to-p fractional ideals and quotient by P_x(f)−f for totally positive p-adic units x, where P_x transports c to xc. The indexing quotient is the finite narrow class group. Integral forms use the corresponding integral lattices. For G* retain a chosen set of class representatives and the specified comparison maps.

#### Independence of arithmetic polarisation choices

**ID:** `OverconvergentAutomorphicForms:O4/polarisation-choice-independence`. **Kind:** theorem.

**Statement.** Arithmetic polarisation-class forms and their transported correspondences are canonically independent of narrow-class representative choices: P_x compose multiplicatively and any two transports with the same target differ by a positive-unit stabilizer acting trivially after arithmetic descent. For G* changes of representatives conjugate operators by the chosen polarisation comparisons; no canonical equality before these choices is claimed.

**Proposed declaration:** `TauCeti.Overconvergent.polarisation_choice_independence`.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- An arithmetic family is κ_ar=(w,t), with geometric κ=ρ(w,t). n≥1 or ∞; level zero is transported separately by AL_1.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O4/polarisation-class-forms`
- `OverconvergentAutomorphicForms:O4/finite-polarisation-descent`
- `HilbertModularVarietiesAndShimuraCurves:H4`

**Proof outline.**

1. Use H4’s transport composition and O4 twisted/finite descent to kill the stabilizer ambiguity.
2. Build the representative-change map componentwise with P_x; its inverse uses P_{x⁻¹}.
3. The quotient relation makes both composites and all correspondence diagrams independent of x in the arithmetic case. Retain the chosen conjugation in the geometric case.

**Source matches.**

- [BHW-2023](https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf), Remark 10.6, p.1791; Definition 9.10, pp.1786–1787: The arithmetic normalisation removes polarisation choices; G* retains a comparison choice.

**Acceptance.**

- Changing a polarisation representative twice agrees with changing it by the product transport.

### OverconvergentAutomorphicForms:O5

Independent AIP coefficients, universal formal and full-character rational lines; noncircular integral comparison via unit multipliers and valuations; distinct conditional full-character integral freeness; arithmetic and naturality maps.

#### Independent AIP coefficient sheaves

**ID:** `OverconvergentAutomorphicForms:O5/aip-independent-coefficients`. **Kind:** construction.

**Statement.** On each AIP chart construct the modified differential frame torsor F_{n,r,I} and its B_n=O_p×·(1+p^n Hdg^(−p^n/(p−1))Res_{O_F/Z}G_a) action independently of the perfectoid tower. Define the analytic rational and integral coefficient sheaves as the κ⁻¹-eigenfunctions in (g_n f_n)_*O and (g_n f_n)_*O+ on this actual analytic torsor. In the formal AIP construction, first construct w_{n,r,I} for the universal character on W_F^0, then retain §6.4’s finite-character factor wχ for a full weight. The full formal sheaf is coherent; Prop.4.3 is not cited to assert its integral formal invertibility for every χ.

**Proposed declaration:** `TauCeti.Overconvergent.aip_independent_coefficients`.

**Planet:** AIP coefficient sheaf.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Use the independent AIP formal weight chart indexed by I=[p^k,p^k′], 0≤k≤k′, with r_AIP≥3 and r_AIP+k≥n_AIP≥k′+2 for odd p (≥k′+4 for p=2). Set n′=n_AIP−k′−2 (or −4). These are universal-coordinate conditions; δ is not silently identified with the corrected pro-p supremum.
- Choose a positive or ordinary radius in the intersection of the canonical-subgroup, analytic-character and AIP torsor admissibility ranges.

**Direct inputs.**

- `HodgeTateAndCanonicalSubgroups:T5`
- `OverconvergentAutomorphicForms:O3/ramified-modified-lattice`
- `OverconvergentAutomorphicForms:O0/bounded-weight-families`
- `LocallyAnalyticDistributions:L0`
- `AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product`

**Proof outline.**

1. Import T5’s canonical subgroup, modified lattice, Hodge–Tate congruence and the frame torsor; retain its B_n-action.
2. Extend the universal-coordinate character via AIP Proposition 2.8 on W_F^0. For a full weight retain the finite torsion character χ and its independent eigencomponent on the normalized finite Igusa cover (§6.4, p.29).
3. Take actual κ⁻¹ analytic O and O+ eigenfunctions. Keep the universal formal line and the full finite-character coherent factor separate. Identification of that formal factor with the analytic integral lattice belongs to the full-character integral-trivialization request; the analytic integral equalizer is already defined independently.
4. On every complete algebraically closed valued test point of the admitted B_n-torsor, both κ(b) and κ(b)⁻¹ belong to the valuation ring. For the small analytic factor this is AIP Lemma4.4’s topologically nilpotent congruence; for the finite factor it follows from finite order. This is a unit-valued multiplier condition, not the existence of a unit-valued eigenfunction.

**Source matches.**

- [AIP-ADIC-2016](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/Hilbert_adicfinal.pdf), §4.1–4.2, Definition before Proposition 4.3, pp.15–16: AIP eigenfunctions are constructed on the modified differential frame torsor.
- [BHW-2023](https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf), Definition 7.9, p.1761: The generic-fibre AIP construction is recalled independently of the perfectoid one.
- [AIP-ADIC-2016](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/Hilbert_adicfinal.pdf), §6.4, finite-character construction before Theorem 6.7, p.29: The full finite-character factor is stated coherent and invertible over the ordinary locus and analytic fibre; this does not assert invertibility over the entire formal model.
- [AIP-ADIC-2016](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/Hilbert_adicfinal.pdf), Lemma2.4 pp7–8; Lemma4.4 p16; §6.4 p29: The finite torsion character is distinct from the universal character trivial on H. The small analytic character is congruent to one on its admitted frame neighbourhood; finite-character values are valuation units.

**Uses.**

- Theorems 7.14 and 9.12: The torsor comparison identifies two independently defined coefficient sheaves.

**API.**

- `TauCeti.Overconvergent.aip_independent_coefficients.eigencondition` (characterisation): f(b·s)=κ(b)⁻¹f(s) on the specified B_n-torsor.
- `TauCeti.Overconvergent.aip_independent_coefficients.integralInclusion` (coercion): Integral eigenfunctions embed in the rational coefficient sheaf.
- `TauCeti.Overconvergent.aip_independent_coefficients.restrictChart` (functoriality): Change of admissible interval, canonical level and radius gives the AIP transition maps.
- `TauCeti.Overconvergent.aip_independent_coefficients.finiteFactor` (projection): Record χ on H, its extension through (O_F/p²O_F)×, and the coherent normalized-Igusa eigencomponent wχ independently of the W_F^0 universal formal line.
- `TauCeti.Overconvergent.aip_independent_coefficients.translationUnits` (relation): On the admitted torsor, κ(b) and κ(b)⁻¹ are integral at every valued test point. Translating an eigenfunction by b therefore preserves its pointwise integral bound.

**Unit tests.**

- `TauCeti.Overconvergent.Test.O5_aip_independent_coefficients_trivial` (degenerate): The trivial character gives the structural sheaf after descent.
- `TauCeti.Overconvergent.Test.O5_aip_independent_coefficients_algebraic` (compatibility): An algebraic κ gives the corresponding modified differential coefficient on the admitted chart.
- `TauCeti.Overconvergent.Test.O5_aip_independent_coefficients_independent` (computation): For F=Q and κ(x)=x, scaling a differential frame s by λ∈Z_p^× gives f(λs)=λ⁻¹f(s); these eigenfunctions are not invariant functions for nontrivial λ.
- `TauCeti.Overconvergent.Test.O5_aip_independent_coefficients_finiteFactor` (non-example): At p=2, the character of the torsion subgroup of Z_2× sending −1 to −1 is not a W_F^0 character. Its normalized finite-Igusa factor must be retained, even though every finite-character value and its inverse are integral units.

**Acceptance.**

- Construct the analytic O and O+ eigenfunction sheaves independently on the actual modified differential frame torsor, retaining the full finite torsion character. Construct the W_F^0 formal line and the full-character coherent formal factor separately. Identification of the latter’s integral generic fibre with the analytic O+ equalizer is an explicit remaining input, not part of the definition.

#### AIP translations preserve integral bounds

**ID:** `OverconvergentAutomorphicForms:O5/aip-translation-valuation-units`. **Kind:** lemma.

**Statement.** On an admitted AIP frame torsor, at every valued test point both κ(b) and κ(b)⁻¹ lie in the valuation ring. Consequently h(b·y)=κ(b)⁻¹h(y) is integral if and only if h(y) is integral. This includes the full finite torsion character, including p-primary values, and does not assert existence of an integral unit eigenfunction.

**Proposed declaration:** `TauCeti.Overconvergent.aip_translation_valuation_units`.

Added by `REV-OverconvergentAutomorphicForms--O0~2` to name the valuation argument used by the comparison.

**Hypotheses.**

- Use the actual frame torsor and universal-coordinate admission hypotheses of aip-independent-coefficients. Check all continuous valuations used to define geometric O+, with complete valued extensions as required.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O5/aip-independent-coefficients`
- `mathlib:Valuation`
- `mathlib:Valuation.integer`

**Proof outline.**

1. Factor the character into the universal analytic character and the finite torsion character. The compact-unit values of the former are pullbacks of units of the integral formal weight character. On the extended frame neighbourhood AIP Lemma4.4 gives a congruence to one by a topologically nilpotent element, so these values and their inverses are also integral.
2. For a finite-character value u with u^d=1, the ordered valuation group is torsion-free, hence v(u)^d=1 implies v(u)=1, even if p divides d. Multiply the two unit values.
3. Apply the eigencondition in both directions. No rank-one norm test replaces the quantification over all valuations.

**Source matches.**

- [AIP-ADIC-2016](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/Hilbert_adicfinal.pdf), Lemma4.4, p16; §6.4, p29: The admitted analytic congruence and the separate finite-character factor give valuation-unit multipliers.

**Acceptance.**

- A multiplier p has integral value but nonintegral inverse and does not satisfy the conclusion.
- The finite character sending −1 to −1 at p=2 preserves both bounds despite being outside W_F^0.

**Pointwise unit tests.**

- `TauCeti.Overconvergent.Test.O5_aip_translation_valuation_units_higherRank` (compatibility): The valuation-unit implication holds with value group WithZero of the multiplicative lexicographically ordered Z by Z group, without a real-valued norm.
- `TauCeti.Overconvergent.Test.O5_aip_translation_valuation_units_primePower` (compatibility): A unit of positive prime-power order has valuation one at every valuation, without a prime-to-p order condition.
- `TauCeti.Overconvergent.Test.O5_aip_translation_valuation_units_finiteOrder` (compatibility): A unit of any positive finite order and its inverse preserve the integral bound on every translated scalar.
- `TauCeti.Overconvergent.Test.O5_aip_translation_valuation_units_sign` (computation): The sign character value at p=2 preserves integrality: a and its negative have the same bound at every valuation.
- `TauCeti.Overconvergent.Test.O5_aip_translation_valuation_units_nonunit` (non-example): For a multiplier with valuation strictly below one, its inverse fails the bound at a=1; value-integrality alone is insufficient.
- `TauCeti.Overconvergent.Test.O5_aip_translation_valuation_units_eigencondition` (compatibility): For an actual supplied eigencondition relating two point values by the inverse multiplier, membership in the valuation ring agrees when both multiplier bounds hold.

The typed implication assumes both valuation bounds. The admission and geometric frame-torsor conditions in this node remain supplier-dependent signature omissions.

#### AIP integral line and gluing

**ID:** `OverconvergentAutomorphicForms:O5/aip-line-and-gluing`. **Kind:** theorem.

**Statement.** For the universal formal character on W_F^0, the AIP eigenmodule is a formal line and its admissible chart transports satisfy the cocycle identity (AIP Propositions4.3/4.7). For a full character, §6.4 gives a coherent formal sheaf and a rational analytic line, with chart transport obtained from the actual eigenfunctions. An analytic O+ line for the full character follows if, locally on the analytic base, a torsor eigenfunction e and its inverse are both in O+ and their transports differ by base O+ units. Existence of such integral trivializations at positive radius for arbitrary χ is the precise remaining freeness target; rational line gluing does not assert it.

**Proposed declaration:** `TauCeti.Overconvergent.aip_line_and_gluing`.

**Planet:** AIP integral coefficient line.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Use the independent AIP formal weight chart indexed by I=[p^k,p^k′], 0≤k≤k′, with r_AIP≥3 and r_AIP+k≥n_AIP≥k′+2 for odd p (≥k′+4 for p=2). Set n′=n_AIP−k′−2 (or −4). These are universal-coordinate conditions; δ is not silently identified with the corrected pro-p supremum.
- Choose a positive or ordinary radius in the intersection of the canonical-subgroup, analytic-character and AIP torsor admissibility ranges.
- For the analytic full-character unit criterion require actual geometric O+ invariant-function descent on the entire weight-product sheaf. The completed lattice tensor used by the named P9 theorem is a distinct coefficient object.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O5/aip-independent-coefficients`
- `HodgeTateAndCanonicalSubgroups:T5`
- `PerfectoidSpaces:P9`
- `PerfectoidSpaces:P9/integral-coboundary-trivialises-integral-sheaf`

**Proof outline.**

1. For the W_F^0 universal formal line, AIP Proposition4.3 and Lemmas4.4–4.6 construct the trace-compatible eigenfunction congruent to one modulo topologically nilpotent elements on the actual formal torsor. Its value and inverse are integral; normality proves formal rank one. Pullback of this formal line to its specified analytic O+ ringed chart is a line.
2. AIP Proposition4.7 compares the universal-character formal lines on a common refinement. The ratio of their unit-valued generators is invariant; the exact P9 invariant-functions contract identifies it with a base O+ unit. Ratios multiply on triple overlaps.
3. For full weights retain §6.4’s normalized finite-Igusa factor. The paper proves coherence and rational/ordinary invertibility, which supplies the rational analytic line. No denominator 1/|H| is used to claim integral freeness, especially when H has p-torsion.
4. For a full-character integral trivialization e, require the sheafwise geometric identity ((g_n f_n)_*O+)^{B_n}=O+ on all base opens. Then every integral eigenfunction g has invariant integral ratio g/e; conversely multiplication by e sends each base integral function to an eigenfunction. Require base O+ unit transition ratios. P9’s named integral-coboundary theorem proves this algebraic criterion for its chosen completed lattice tensor; applying it to geometric O+ on a smooth weight product needs the separate P9 request and cannot identify these two lattices silently.
5. The positive-radius full-character existence/transport of e is requested at T5/P9 and recorded as a gap. The O5 comparison of two integral equalizers below does not use this existence statement.

**Source matches.**

- [AIP-ADIC-2016](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/Hilbert_adicfinal.pdf), Propositions 4.3 and 4.7, pp.16–18: Integral local freeness and the canonical changes of interval/radius/Igusa level are distinct ingredients.
- [BHW-2023](https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf), Proposition 7.10, p.1762: The local coefficient sheaves glue on overlaps.

**Acceptance.**

- Universal-character generators are units after the specified pullback, with inverse integral as well as value integral.
- Full finite-character rational freeness and ordinary freeness do not discharge positive-radius integral freeness.
- A candidate generator with inverse only in O, such as p on a constant integral chart, fails the unit criterion.
- The explicit finite-character factor is retained on every chart refinement.

#### Geometric perfectoid–AIP comparison

**ID:** `OverconvergentAutomorphicForms:O5/geometric-aip-comparison`. **Kind:** comparison.

**Statement.** On the common admitted domains, for every n≥0 and n=∞, pullback along the actual scaled Hodge–Tate frame gives an isomorphism from the independent AIP rational coefficient line to the perfectoid rational coefficient line and identifies their O+ eigenfunction submodules. At n=0 use AL_1 on both sides. The integral assertion is an isomorphism of lattices, without assuming either lattice already locally free. Full-character integral local freeness is the separate O5/aip-line-and-gluing target. Positive radii lie in the verified intersection; no radius formula derived from the false printed supremum is used.

**Proposed declaration:** `TauCeti.Overconvergent.geometric_aip_comparison`.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Use the independent AIP formal weight chart indexed by I=[p^k,p^k′], 0≤k≤k′, with r_AIP≥3 and r_AIP+k≥n_AIP≥k′+2 for odd p (≥k′+4 for p=2). Set n′=n_AIP−k′−2 (or −4). These are universal-coordinate conditions; δ is not silently identified with the corrected pro-p supremum.
- Choose a positive or ordinary radius in the intersection of the canonical-subgroup, analytic-character and AIP torsor admissibility ranges.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- The actual frame torsor F_m→X is a B_m-torsor on the stated site; after a complete algebraically closed valued extension every frame over a point is a B_m-translate of the Hodge–Tate frame of a lifted infinite-level point. The tower projection is valuatively surjective. These are the concrete T5/S5 torsor maps, not arbitrary maps of sets.
- On this admitted torsor the character multiplier and its inverse are O+ units at every valued test point. Use the AIP small-character congruences and the full finite-order factor. O+ is the subsheaf defined by all pointwise valuation bounds, with pullback reflecting bounds along the valuatively surjective tower.
- Apply T5/hodge-tate-aip-lift only with its actual bound ε_base≤p^(−(m+1)). In the scaled map s∘u_n, ε_base is the radius after u_n, while the anticanonical source radius is p^n ε_base. Require every source domain to satisfy its own O2 admissibility bounds as well; the bound 1/(c_p p^m) alone does not imply the T5 bound for p≥5.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O5/aip-line-and-gluing`
- `OverconvergentAutomorphicForms:O3/integral-hilbert-sheaf`
- `HodgeTateAndCanonicalSubgroups:T5`
- `PerfectoidSpaces:P9`
- `OverconvergentAutomorphicForms:O2/hilbert-level-radius-maps`
- `AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product`
- `OverconvergentAutomorphicForms:O1/analytic-line-effectivity`
- `HodgeTateAndCanonicalSubgroups:T5/hodge-tate-aip-lift`
- `HodgeTateAndCanonicalSubgroups:T5/aip-automorphy-factor`
- `OverconvergentAutomorphicForms:O5/aip-translation-valuation-units`

**Proof outline.**

1. T5 supplies the actual left-equivariant map s(γx)=jγ(x)s(x) and its scaled s∘u_n Atkin–Lehner diagram. Pullback of AIP eigenfunctions therefore has the perfectoid inverse-character relation.
2. Establish the rational isomorphism first: the full-character AIP rational line comes from §6.4/Thm6.7. O1 analytic effectivity supplies the perfectoid rational line (ordinary formal descent followed by the dense-open criterion). In a local rational AIP generator, its evaluation at a frame is nonzero: after a valued extension trivializing the torsor, the associated rational line is the one-dimensional character fibre. Thus the map between rational lines is fibrewise nonzero, hence an isomorphism. No integral generator is invoked.
3. For integrality, let a rational AIP eigenfunction h pull back to an integral perfectoid section. For an arbitrary valued point y of F_m, lift its base point to x in the actual tower, extending the complete algebraically closed valued field if necessary. Torsor transitivity gives y=b·s(x). Then h(y)=κ(b)⁻¹h(s(x)); both multipliers are valuation units, so h(y) is integral exactly when h(s(x)) is. The pointwise definition of O+ proves h lies in the AIP integral equalizer. The forward direction is preservation of O+ by pullback.
4. Apply the argument on every base open and its weight product using P9’s actual sheafwise function/descent contract. Checking only product affinoids would not prove the entire product-sheaf assertion. This makes the integral map and its rational inverse inverse sheaf maps.
5. The maps glue because they are actual pullbacks, independently of integral local freeness. Handle ∞ with its limit torsor and 0 with AL_1. Once the separate full-character unit-trivialization input is supplied, the isomorphism transports integral local freeness; it does not prove that input by itself.

**Source matches.**

- [BHW-2023](https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf), Theorem 7.14 and proof, pp.1764–1765: The comparison is an integral sheaf isomorphism built from the tautological torsor map, not a dimension comparison.
- [AIP-ADIC-2016](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/Hilbert_adicfinal.pdf), Lemma4.4 p16; §6.4 and Theorem6.7 p29: Universal small-character congruences provide unit-valued multipliers, while the full finite-character construction supplies rational invertibility. They do not supply full positive-radius integral freeness.
- [BHW-2023](https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf), Definitions7.5/7.9 and Propositions7.11–7.12, pp1760–1763; Theorem7.14, pp1764–1765: The actual torsor, scaled tautological frame and equivariant diagram are the geometric inputs. The integral lattice comparison is proved here by pointwise boundedness after rational comparison, rather than by the source’s integral-freeness shortcut.

**API.**

- `TauCeti.Overconvergent.geometric_aip_comparison.bounded_iff` (characterisation): For scalar eigenfunctions with unit-valued multipliers, if every valued torsor frame is a translate of a lifted Hodge–Tate frame, the bound on all torsor frames is equivalent to the bound on all lifted Hodge–Tate frames. The typed normed-field version is an algebraic test of this proof step; the adic application checks all valuations.

**Acceptance.**

- Full torsion characters are included in the norm argument: finite-order values have valuation one, including p-primary roots of unity.
- An inverse character is necessary, but its integrality uses both the character and its inverse, not mere nonvanishing.
- The rational pullback being an isomorphism, its integral inverse is checked by every torsor frame valuation; equality of dimensions or a single fibre alone is insufficient.
- A scalar multiplier p would not preserve integral bounds under translation and fails the hypothesis.
- Integral equalizers can be compared before their local freeness is known. No inference from rational freeness to O+ freeness occurs.

#### Arithmetic perfectoid–AIP comparison

**ID:** `OverconvergentAutomorphicForms:O5/arithmetic-aip-comparison`. **Kind:** comparison.

**Statement.** Define arithmetic AIP coefficients independently as the twisted finite Δ(N)-invariants of π_* of geometric AIP coefficients. Then ω_{G,c,n}^{κ,+}≅ω_{G,c,AIP,n}^{κ,+} for n≥0 or ∞ and the common admitted radii. The isomorphism includes the Weil-pairing character and finite polarisation action; rationalisation gives the arithmetic analytic line.

**Proposed declaration:** `TauCeti.Overconvergent.arithmetic_aip_comparison`.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Use the independent AIP formal weight chart indexed by I=[p^k,p^k′], 0≤k≤k′, with r_AIP≥3 and r_AIP+k≥n_AIP≥k′+2 for odd p (≥k′+4 for p=2). Set n′=n_AIP−k′−2 (or −4). These are universal-coordinate conditions; δ is not silently identified with the corrected pro-p supremum.
- Choose a positive or ordinary radius in the intersection of the canonical-subgroup, analytic-character and AIP torsor admissibility ranges.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- Arithmetic family κ_ar=(w,t) with geometric κ=ρ(w,t); translate AIP CUSP’s (ν,w_AIP) as ν=w and w_AIP=t⁻¹.
- Inherit geometric-aip-comparison’s explicit T5 radius bound and scaled source-domain admission wherever the Hodge–Tate frame comparison is used, on both source and target of each comparison diagram.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O5/geometric-aip-comparison`
- `OverconvergentAutomorphicForms:O4/weil-pairing-comparison`
- `OverconvergentAutomorphicForms:O4/finite-polarisation-descent`
- `OverconvergentAutomorphicForms:O4/geometric-full-cover-comparison`
- `OverconvergentAutomorphicForms:O4/twisted-polarisation-action`
- `AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product`

**Proof outline.**

1. Follow the explicit chain: presentation (4)→(3) via w(eβ)⁻¹; (3)→finite Δ-invariants of (2); (2)→(1); (1)→geometric AIP by the torsor comparison.
2. The twisted polarisation action on geometric AIP agrees with O4’s action by its frame calculation. Thus the last map descends integrally.
3. Transport level zero by AL_1 and rationalise locally. Hecke equivariance is the later O6 theorem, not presumed here.
4. Use O5’s integral comparison as an isomorphism of the specified O+ equalizers. Any claim of full-character positive-radius local freeness additionally requires the separate unit-trivialization input of O5/aip-line-and-gluing.

**Source matches.**

- [BHW-2023](https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf), Definition 9.11 and Theorem 9.12, p.1787: The arithmetic comparison is the explicit descent chain, retaining its pairing and unit-action twists.
- [AIP-CUSP-2016](https://www.imo.universite-paris-saclay.fr/~pilloni/AIP2.pdf), §4, weight convention before Theorem 4.4, pp.26–28: AIP’s plus-norm convention is converted by inverting the second arithmetic character.

**Acceptance.**

- Removing w(eβ)⁻¹ breaks the determinant/polarisation equivariance for nontrivial w.

#### Naturality and uniqueness of torsor comparisons

**ID:** `OverconvergentAutomorphicForms:O5/aip-comparison-naturality`. **Kind:** theorem.

**Statement.** The geometric and arithmetic comparisons are uniquely determined by their maps on the chosen tautological frame torsors. They commute with weight pullback, admitted chart/radius refinement and compatible level maps; equality of dimensions or a scalar normalisation at one classical weight does not determine this comparison.

**Proposed declaration:** `TauCeti.Overconvergent.aip_comparison_naturality`.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Use the independent AIP formal weight chart indexed by I=[p^k,p^k′], 0≤k≤k′, with r_AIP≥3 and r_AIP+k≥n_AIP≥k′+2 for odd p (≥k′+4 for p=2). Set n′=n_AIP−k′−2 (or −4). These are universal-coordinate conditions; δ is not silently identified with the corrected pro-p supremum.
- Choose a positive or ordinary radius in the intersection of the canonical-subgroup, analytic-character and AIP torsor admissibility ranges.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- Maps of weight families pull back the specified character and its analytic extension. Claims about sheaves do not assert arbitrary nonflat base change of global sections.
- Inherit geometric-aip-comparison’s explicit T5 radius bound and scaled source-domain admission wherever the Hodge–Tate frame comparison is used, on both source and target of each comparison diagram.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O5/geometric-aip-comparison`
- `OverconvergentAutomorphicForms:O5/arithmetic-aip-comparison`
- `OverconvergentAutomorphicForms:O3/hilbert-weight-pullback`
- `HodgeTateAndCanonicalSubgroups:T5`
- `AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product`

**Proof outline.**

1. On a common trivializing cover, both maps evaluate the same eigenfunction at the same selected frame. This proves uniqueness after faithful pullback.
2. Use T5’s compatibility of the tautological frame with each change of base, level and radius and AIP Proposition 4.7 for chart changes.
3. For arithmetic coefficients the Weil pairing and twisted polarisation action also pull back compatibly, so descent preserves each commuting diagram.
4. Use O5’s integral comparison as an isomorphism of the specified O+ equalizers. Any claim of full-character positive-radius local freeness additionally requires the separate unit-trivialization input of O5/aip-line-and-gluing.

**Source matches.**

- [BHW-2023](https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf), Proofs of Theorems 7.14 and 9.12, pp.1764–1765,1787: The maps arise from the same tautological sections and hence are natural with respect to their compatible pullbacks.
- [AIP-ADIC-2016](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/Hilbert_adicfinal.pdf), Proposition 4.7, pp.17–18: AIP change-of-chart identifications supply the other side of the diagram.

**Acceptance.**

- Rescaling a chosen frame rescales both eigenfunction descriptions in the same way.

### OverconvergentAutomorphicForms:O6

Boundary/cusp distinction, tame/diamond/wild operators, expansions, cusp vanishing/(Pr), compact restriction, controlling product and sufficient integral renormalization.

#### Hilbert cusp forms

**ID:** `OverconvergentAutomorphicForms:O6/hilbert-cusp-forms`. **Kind:** construction.

**Statement.** On the supplied smooth toroidal compactification with boundary divisor D, define the subcanonical coefficient line ω^κ(−D)=ω^κ⊗I_D and cusp forms Sκ(n,N,ε;U)=H^0(ω^κ(−D)) on the admitted toroidal neighbourhood, with the corresponding integral lattice and positive-radius colimit. Arithmetic forms descend with the same boundary ideal.

**Proposed declaration:** `TauCeti.Overconvergent.hilbert_cusp_forms`.

**Planet:** Overconvergent Hilbert cusp forms.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- C6 supplies the toroidal/minimal neighbourhoods, boundary Cartier ideal, extensions of the coefficient line and boundary-compatible maps.
- Inherit geometric-aip-comparison’s explicit T5 radius bound and scaled source-domain admission wherever the Hodge–Tate frame comparison is used, on both source and target of each comparison diagram.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O5/geometric-aip-comparison`
- `OverconvergentAutomorphicForms:O5/arithmetic-aip-comparison`
- `ShimuraCompactifications:C6`
- `OverconvergentAutomorphicForms:O3/overconvergent-hilbert-forms`
- `AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product`

**Proof outline.**

1. Import the compactification and boundary geometry from ShimuraCompactifications:C6.
2. Extend the coefficient line via O5 and the AIP compactified torsor, then tensor with the actual ideal I_D.
3. Define sections and restriction maps. The boundary ideal is retained through finite arithmetic polarisation descent.

**Source matches.**

- [BHW-2023](https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf), Remark 6.9 and Remark 9.9, pp.1759,1786: Cusp forms are sections vanishing at the toroidal boundary, rather than all sections extending there.

**Uses.**

- O6 complete continuity and O7: Projective Banach/control hypotheses and ordinary restrictions refer to these cusp spaces.

**API.**

- `TauCeti.Overconvergent.hilbert_cusp_forms.inclusion` (coercion): Sκ injects into the corresponding modular forms via I_D→O.
- `TauCeti.Overconvergent.hilbert_cusp_forms.boundaryKernel` (characterisation): Cusp sections are the kernel of restriction to the boundary coefficient sheaf.
- `TauCeti.Overconvergent.hilbert_cusp_forms.restrict` (functoriality): Radius, level and weight maps retaining the boundary ideal induce maps on cusp forms.

**Unit tests.**

- `TauCeti.Overconvergent.Test.O6_hilbert_cusp_forms_constant` (non-example): At weight zero on a connected compactified component with nonempty boundary, the constant section 1 is not cuspidal.
- `TauCeti.Overconvergent.Test.O6_hilbert_cusp_forms_elliptic` (computation): For F=Q the q-expansion of a cusp section has constant coefficient 0 at every cusp.
- `TauCeti.Overconvergent.Test.O6_hilbert_cusp_forms_higherDegree` (non-example): Koecher extension in g>1 does not make a nonzero boundary constant term vanish.

**Acceptance.**

- On the supplied smooth toroidal compactification with boundary divisor D, define the subcanonical coefficient line ω^κ(−D)=ω^κ⊗I_D and cusp forms Sκ(n,N,ε;U)=H^0(ω^κ(−D)) on the admitted toroidal neighbourhood, with the corresponding integral lattice and positive-radius colimit. Arithmetic forms descend with the same boundary ideal.

#### Koecher extension and cuspidality

**ID:** `OverconvergentAutomorphicForms:O6/hilbert-koecher`. **Kind:** comparison.

**Statement.** For g>1, the supplied Hilbert Koecher theorem identifies interior coefficient sections with their extension to the minimal/toroidal compactified neighbourhood. Cusp sections are separately those vanishing along D. For g=1 use the compactified cusp/q-expansion calculation instead of a codimension≥2 Koecher claim. These identifications commute with the O5 comparison.

**Proposed declaration:** `TauCeti.Overconvergent.hilbert_koecher`.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- Use C6’s normality, compactification maps and minimal-boundary codimension hypotheses; at g=1 the minimal boundary has codimension one.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O6/hilbert-cusp-forms`
- `ShimuraCompactifications:C6`
- `AutomorphicBundles:B5/hilbert-cuspidal-boundary`
- `OverconvergentAutomorphicForms:O5/aip-comparison-naturality`

**Proof outline.**

1. Apply AIP ADIC Proposition 8.4 through the exact Koecher package requested from C6: extend across minimal boundary of codimension at least two.
2. Compare the subcanonical sheaf by the ideal D, not by the extension theorem.
3. For degree one use B5’s compactified cusp expansion and its boundary constant term. O5 compares the coefficient lines on the compactified torsor.

**Source matches.**

- [AIP-ADIC-2016](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/Hilbert_adicfinal.pdf), §8.4, Proposition 8.4, pp.36–37 (statement p.37): The pushforward comparison is Koecher extension, not cuspidality.
- [BHW-2023](https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf), Remark 6.9, p.1759: The source introduces the boundary ideal separately from extension.

**Acceptance.**

- A section with nonzero q-constant term can extend by Koecher and still fail to be a cusp form.

#### Tame Hilbert Hecke operators

**ID:** `OverconvergentAutomorphicForms:O6/tame-hilbert-hecke`. **Kind:** construction.

**Statement.** For a prime ideal a∤pN and its moduli correspondence X_c←^{π1}C_a→^{π2}X_{ca}, use the canonical coefficient identification θ:π2*ω→π1*ω from the prime-to-p Hodge–Tate isogeny. Set T_a=q_a⁻¹Tr_{π1} θ π2*, q_a=|O_F/a|. It maps the ca component to c, preserves radii, extends to the boundary, and descends to arithmetic polarisation classes.

**Proposed declaration:** `TauCeti.Overconvergent.tame_hilbert_hecke`.

**Planet:** Hilbert Hecke operators.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- π1 is finite locally free of degree q_a+1 for the prime cyclic-subgroup correspondence. The normalization is 1/q_a, not reciprocal degree.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O4/polarisation-class-forms`
- `OverconvergentAutomorphicForms:O2/hilbert-cocycle-law`
- `HilbertModularVarietiesAndShimuraCurves:H3`
- `ShimuraCompactifications:C6`
- `AdicSpacesPartII:R3/pull-identify-trace`
- `AdicSpacesPartII:R3/analytic-trace-finite-locally-free`
- `AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product`
- `HilbertModularVarietiesAndShimuraCurves:H1`
- `HilbertModularVarietiesAndShimuraCurves:H4`

**Proof outline.**

1. Import the moduli correspondence and its compactified extension from H3/C6.
2. Use the prime-to-p isogeny to identify Hodge–Tate frames and their cocycles (BHW Lemma 10.1).
3. Apply AdicSpacesPartII R3 pull-identify-trace and finite locally free trace; multiply by q_a⁻¹. Since a∤p this normalization is an integral unit.
4. Use arithmetic descent and polarisation transport to define the same operator on the class-independent module.

**Source matches.**

- [BHW-2023](https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf), Lemma 10.1 and Definition 10.2, pp.1788–1789: The tame operator is explicitly normalized pullback–identify–trace between polarisation components.

**Uses.**

- BHW §10.3–10.4 and O7: Hecke-compatible AIP and Igusa comparisons retain these factors.

**API.**

- `TauCeti.Overconvergent.tame_hilbert_hecke.formula` (characterisation): T_a=q_a⁻¹Trπ1 θ π2*.
- `TauCeti.Overconvergent.tame_hilbert_hecke.component` (projection): The source polarisation ideal is ca and the target is c.
- `TauCeti.Overconvergent.tame_hilbert_hecke.integral` (compatibility): T_a preserves the specified integral lattice.
- `TauCeti.Overconvergent.tame_hilbert_hecke.cusp` (compatibility): The boundary-compatible correspondence preserves cusp forms.

**Unit tests.**

- `TauCeti.Overconvergent.Test.O6_tame_hilbert_hecke_weightZero` (computation): On the constant weight-zero section 1, T_a(1)=(q_a+1)/q_a.
- `TauCeti.Overconvergent.Test.O6_tame_hilbert_hecke_normalisation` (non-example): Averaging by 1/(q_a+1) would send 1 to 1 and is not BHW’s operator.
- `TauCeti.Overconvergent.Test.O6_tame_hilbert_hecke_component` (compatibility): Changing a representative ca by a positive p-unit conjugates by P_x and leaves the arithmetic class operator unchanged.

**Acceptance.**

- For a prime ideal a∤pN and its moduli correspondence X_c←^{π1}C_a→^{π2}X_{ca}, use the canonical coefficient identification θ:π2*ω→π1*ω from the prime-to-p Hodge–Tate isogeny. Set T_a=q_a⁻¹Tr_{π1} θ π2*, q_a=|O_F/a|. It maps the ca component to c, preserves radii, extends to the boundary, and descends to arithmetic polarisation classes.

#### Wild Hilbert Hecke operators

**ID:** `OverconvergentAutomorphicForms:O6/wild-hilbert-hecke`. **Kind:** construction.

**Statement.** For 𝔭|p, q_𝔭=|O_F/𝔭|, e=v_𝔭(p), finite n≥1 and l=ne+1, use the anticanonical extension correspondence with π1 degree q_𝔭 and π2 quotient by D[𝔭]. Let u_𝔭=diag(ϖ_𝔭,1); its action gives an integral coefficient map π2*ω+→π1*ω+ independently of the chosen generator of 𝔭O_p. Define U_𝔭=q_𝔭⁻¹Trπ1 θ_𝔭 π2*. It improves the 𝔭-partial Hasse bound, not all partial bounds in general.

**Proposed declaration:** `TauCeti.Overconvergent.wild_hilbert_hecke`.

**Planet:** Wild Hilbert Hecke operators.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- The actual extra level and anticanonical subgroup condition are C[𝔭^{en}]=D[𝔭^{en}]. The chosen domains must support this correspondence.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O4/polarisation-class-forms`
- `OverconvergentAutomorphicForms:O2/hilbert-automorphy-factor`
- `HilbertModularVarietiesAndShimuraCurves:H3`
- `HodgeTateAndCanonicalSubgroups:T4`
- `ShimuraCompactifications:C6`
- `AdicSpacesPartII:R3/pull-identify-trace`
- `AdicSpacesPartII:R3/analytic-trace-finite-locally-free`
- `AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product`
- `HilbertModularVarietiesAndShimuraCurves:H1`
- `HilbertModularVarietiesAndShimuraCurves:H4`

**Proof outline.**

1. Import the p-level moduli correspondence, its degree and partial-radius image from H3/T4/C6.
2. Compute u_𝔭* z=ϖ_𝔭 z and conjugation γ↦(a,ϖb;ϖ⁻¹c,d); the cz+d factor is unchanged.
3. Changing ϖ by a unit changes the level action by a diagonal element with j=1, so the coefficient map agrees.
4. Apply finite locally free trace and the 1/q_𝔭 factor. This may require renormalization to preserve an integral lattice.

**Source matches.**

- [BHW-2023](https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf), §10.2, Lemma 10.3 and Definition 10.4, pp.1789–1790: The operator uses degree q_𝔭 trace and an integral coefficient map, with the extra level l=ne+1.

**Uses.**

- BHW §10.3 and AIP Lemma 3.27: The controlling product improves every p-adic direction; integral preservation requires its own renormalization.

**API.**

- `TauCeti.Overconvergent.wild_hilbert_hecke.formula` (characterisation): U_𝔭=q_𝔭⁻¹Trπ1 θ_𝔭 π2*.
- `TauCeti.Overconvergent.wild_hilbert_hecke.uniformiserIndependent` (compatibility): The coefficient map and resulting operator do not depend on ϖ_𝔭.
- `TauCeti.Overconvergent.wild_hilbert_hecke.partialRadius` (functoriality): The second projection lands in the supplied improved 𝔭-Hasse neighbourhood.
- `TauCeti.Overconvergent.wild_hilbert_hecke.cusp` (compatibility): Boundary-compatible quotient isogenies preserve the cusp submodule.

**Unit tests.**

- `TauCeti.Overconvergent.Test.O6_wild_hilbert_hecke_ellipticRadius` (computation): For F=Q the second projection lands in radius ε/p.
- `TauCeti.Overconvergent.Test.O6_wild_hilbert_hecke_constant` (computation): At weight zero, U_p(1)=1 because π1 has degree p and the factor is 1/p.
- `TauCeti.Overconvergent.Test.O6_wild_hilbert_hecke_individualCompactness` (non-example): For a split p in degree>1, improvement in only one partial Hasse coordinate does not prove compactness on the simultaneous-radius Banach module.

**Acceptance.**

- For 𝔭|p, q_𝔭=|O_F/𝔭|, e=v_𝔭(p), finite n≥1 and l=ne+1, use the anticanonical extension correspondence with π1 degree q_𝔭 and π2 quotient by D[𝔭]. Let u_𝔭=diag(ϖ_𝔭,1); its action gives an integral coefficient map π2*ω+→π1*ω+ independently of the chosen generator of 𝔭O_p. Define U_𝔭=q_𝔭⁻¹Trπ1 θ_𝔭 π2*. It improves the 𝔭-partial Hasse bound, not all partial bounds in general.

#### Hilbert diamond operators

**ID:** `OverconvergentAutomorphicForms:O6/hilbert-diamond-operators`. **Kind:** construction.

**Statement.** For a finite tame-level normalizer element d inducing a level automorphism on the actual Hilbert moduli scheme, define ⟨d⟩ by pullback of sections with the induced coefficient identification. The multiplication law is the one of that level action, with inverse-base-action convention fixed as in B5; boundary ideals and arithmetic polarisation descent are retained.

**Proposed declaration:** `TauCeti.Overconvergent.hilbert_diamond_operators`.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- Use a finite tame level automorphism, with its actual action on the coefficient torsor. This is separate from the central projective quotient and positive-unit polarisation action.

**Direct inputs.**

- `HilbertModularVarietiesAndShimuraCurves:H3`
- `AutomorphicBundles:B5/hecke-section-operator`
- `OverconvergentAutomorphicForms:O1/coefficient-descent-functoriality`
- `OverconvergentAutomorphicForms:O4/polarisation-choice-independence`
- `ShimuraCompactifications:C6`
- `AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product`
- `HilbertModularVarietiesAndShimuraCurves:H1`
- `HilbertModularVarietiesAndShimuraCurves:H4`

**Proof outline.**

1. Import the level automorphism and associated coefficient identification from H3 and B5.
2. Use O1 functoriality to obtain the section map. Compute identity/composition on the actual cover.
3. Boundary and polarisation compatibility allow restriction to cusp forms and descent to arithmetic classes.

**Source matches.**

- [AIP-CUSP-2016](https://www.imo.universite-paris-saclay.fr/~pilloni/AIP2.pdf), §3.7, Remark 3.28, p.24: The Hecke action respects weight families and cuspidality; finite level automorphisms are the degree-one correspondences.

**Uses.**

- O6–O7 and B5: The comparison diagrams include the finite tame level actions as well as cyclic isogeny correspondences.

**API.**

- `TauCeti.Overconvergent.hilbert_diamond_operators.apply` (characterisation): Pullback through the level automorphism with its coefficient map.
- `TauCeti.Overconvergent.hilbert_diamond_operators.mul` (relation): Composition follows the fixed level-action convention.
- `TauCeti.Overconvergent.hilbert_diamond_operators.cusp` (compatibility): The induced map preserves vanishing on the boundary.

**Unit tests.**

- `TauCeti.Overconvergent.Test.O6_hilbert_diamond_operators_identity` (degenerate): ⟨1⟩ is the identity operator.
- `TauCeti.Overconvergent.Test.O6_hilbert_diamond_operators_inverse` (computation): ⟨d⁻¹⟩ is inverse to ⟨d⟩.
- `TauCeti.Overconvergent.Test.O6_hilbert_diamond_operators_polarisation` (non-example): A positive-unit polarisation action is not renamed a tame diamond operator without matching the level moduli action.

**Acceptance.**

- For a finite tame-level normalizer element d inducing a level automorphism on the actual Hilbert moduli scheme, define ⟨d⟩ by pullback of sections with the induced coefficient identification. The multiplication law is the one of that level action, with inverse-base-action convention fixed as in B5; boundary ideals and arithmetic polarisation descent are retained.

#### Hecke equivariance of the AIP comparison

**ID:** `OverconvergentAutomorphicForms:O6/aip-hecke-equivariance`. **Kind:** theorem.

**Statement.** The geometric and arithmetic O5 integral/rational comparison maps intertwine tame T_a, finite tame diamond actions and wild U_𝔭 on their actual section modules, with the same q_a⁻¹ and q_𝔭⁻¹ factors. For wild operators the rational normalized action and integral renormalized action are distinguished.

**Proposed declaration:** `TauCeti.Overconvergent.aip_hecke_equivariance`.

**Planet:** Hecke-equivariant AIP comparison.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- All correspondence and AIP chart hypotheses used above hold on the common source and target domains.
- Inherit geometric-aip-comparison’s explicit T5 radius bound and scaled source-domain admission wherever the Hodge–Tate frame comparison is used, on both source and target of each comparison diagram.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O5/geometric-aip-comparison`
- `OverconvergentAutomorphicForms:O5/arithmetic-aip-comparison`
- `OverconvergentAutomorphicForms:O6/tame-hilbert-hecke`
- `OverconvergentAutomorphicForms:O6/wild-hilbert-hecke`
- `OverconvergentAutomorphicForms:O6/hilbert-diamond-operators`
- `HodgeTateAndCanonicalSubgroups:T5`
- `AdicSpacesPartII:R3/pull-identify-trace`

**Proof outline.**

1. For tame isogenies, naturality of the Hodge–Tate sequence makes the torsor frame diagram commute.
2. For wild isogenies, use the adjugate u_𝔭^∨ and u_𝔭^∨e1=e1 in the frame comparison; this identifies the perfectoid coefficient map with the AIP differential pullback.
3. Trace projection/base-change compatibility gives equality after the identical normalization. Arithmetic descent retains the pairing twist and polarisation action.
4. Degree-one finite level correspondences give the diamond compatibility.

**Source matches.**

- [BHW-2023](https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf), Proposition 10.8 and proof, pp.1791–1792: The coefficient maps are compared on isogeny torsors before trace is taken.

**Acceptance.**

- The comparison diagram uses exactly the same scalar normalizer on its two sides.

#### Hilbert q-expansion compatibility

**ID:** `OverconvergentAutomorphicForms:O6/hilbert-q-expansion-comparison`. **Kind:** comparison.

**Statement.** At each supplied compactified cusp, the O5 frame comparison identifies the perfectoid coefficient q-expansion with the AIP expansion. At algebraic weights it agrees with B5’s classical Hilbert expansion after converting κ_ar=(w,t) to (ν=w,w_AIP=t⁻¹) and matching B5’s coefficient line, cusp labels and Hecke normalization. Vanishing of every cusp constant term characterizes cuspidality in the supplied range.

**Proposed declaration:** `TauCeti.Overconvergent.hilbert_q_expansion_comparison`.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- Use B5’s exact algebraic-weight, tame level and coefficient-ring hypotheses for its classical expansion principle; p-level/family expansions require the requested extension below.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O5/aip-comparison-naturality`
- `OverconvergentAutomorphicForms:O6/aip-hecke-equivariance`
- `AutomorphicBundles:B5/hilbert-cusp-expansion`
- `AutomorphicBundles:B5/hilbert-expansion-principle`
- `AutomorphicBundles:B5/hilbert-cuspidal-boundary`
- `AutomorphicBundles:B5/hecke-expansion-compatibility`
- `AutomorphicBundles:B5`
- `ShimuraCompactifications:C6`
- `AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product`

**Proof outline.**

1. Pull both coefficient sections to the same Tate semi-abelian cusp chart. T5’s chosen differential/HT frame evaluates to the same formal trivialization.
2. Use B5’s cusp-expansion and boundary criteria for classical specialisations; retain the coefficient line rather than pretending expansions are scalar at every cusp.
3. Use the separately requested bounded-family, p-level extension for the full coefficient sheaf. Compare correspondence expansions by the pull-identify-trace formula and the declared normalizers.

**Source matches.**

- [BHW-2023](https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf), Remark 6.9; Proposition 10.8, pp.1759,1791–1792: The torsor comparison and boundary-compatible correspondence yield the expansion diagrams; the full family expansion input is explicitly requested.

**Acceptance.**

- For F=Q the cusp constant coefficient is zero precisely for cusp sections.
- A classical B5 theorem at prime-to-p full level is not applied directly to an arbitrary Iwahori family without the requested extension.

#### Fixed-radius cusp Banach modules

**ID:** `OverconvergentAutomorphicForms:O6/fixed-cusp-banach-modules`. **Kind:** theorem.

**Statement.** At finite wild level and an admissible open affinoid U=Spa(A,A+) of the arithmetic weight space, with κ locally n_an-analytic and partial Hasse bounds 0<v_i<1/p^{n_an}, on a selected cofinal global-Hasse minimal affinoid neighbourhood inside the partial-radius region, the fixed-radius cusp module is a projective Banach A-module in the (Pr) sense: a continuous direct summand of an orthonormalisable Banach module. Weight specialisation to the source’s coefficient-field points is surjective. This is not finite projectivity, and no such claim is made for every noncuspidal or infinite-level section module.

**Proposed declaration:** `TauCeti.Overconvergent.fixed_cusp_banach_modules`.

**Planet:** Cusp Banach modules.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- Use the sufficiently small tame level, compactified coefficient model, positive cofinal partial-radius range and finite-level cusp vanishing hypotheses of AIP CUSP Theorems 3.16 and 4.4. For arithmetic descent work in characteristic zero, where the finite Δ projector is defined.
- Choose the refined global-Hasse strict affinoid neighbourhood of AIP CUSP Proposition 3.22’s Hattori footnote. Arbitrary simultaneous partial-radius opens are not assumed affinoid.
- For direct use of AIP CUSP Theorem4.4, U is an admissible open affinoid of the arithmetic weight space, not an arbitrary bounded affinoid mapping to it. At finite wild level use the O2 Atkin–Lehner transport to tame level, with the scaled radius and boundary-compatible coefficient transport supplied by C6; arbitrary weight base change requires a separate completed scalar-extension theorem.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O6/hilbert-cusp-forms`
- `OverconvergentAutomorphicForms:O5/arithmetic-aip-comparison`
- `ShimuraCompactifications:C6`
- `LocallyAnalyticDistributions:L4/projective-banach-modules`
- `OverconvergentAutomorphicForms:O6/cuspidal-coefficient-vanishing`
- `OverconvergentAutomorphicForms:O2/hilbert-level-radius-maps`

**Proof outline.**

1. Use O5/O6 cusp comparisons to identify the fixed-radius cusp module with AIP’s compactified coefficient module.
2. Apply AIP CUSP Theorem4.4 on its admissible open arithmetic weight affinoid, retaining its finite characteristic-zero Δ projector and proof via Theorem3.16. For finite wild level first transport to the corresponding tame-level module by O2’s Atkin–Lehner isomorphism, with scaled radius and C6’s boundary transport. The theorem is not cited for an arbitrary affinoid weight pullback.
3. Use cuspidal-coefficient-vanishing on the actual finite-level formal cusp model. The cofinal global-Hasse refinement supplies affinoid acyclicity; the p-complete free local coefficient modules and split exact Cech resolution give (Pr).
4. Use LAD L4’s projective Banach terminology and scalar-extension results only within their exact hypotheses.

**Source matches.**

- [AIP-CUSP-2016](https://www.imo.universite-paris-saclay.fr/~pilloni/AIP2.pdf), Theorem 4.4 and proof, p.28; Theorem 3.16, p.18: The fixed-radius cusp module is projective Banach and has surjective specialisation; projective does not mean finite rank.

**Acceptance.**

- For F=Q an infinite-dimensional fixed-radius cusp module may satisfy (Pr) without being finite projective over A.
- The statement excludes ε=0 and infinite wild level.

#### Compact restriction of cusp forms

**ID:** `OverconvergentAutomorphicForms:O6/compact-radius-restriction`. **Kind:** theorem.

**Statement.** For finite-level fixed cusp Banach modules on nested admissible minimal affinoid neighbourhoods V⋐_U W with coherent pushed-forward cusp coefficient, restriction S(W)→S(V) is completely continuous in the nonarchimedean finite-rank-approximation sense used by LAD L4. It is not justified merely by continuity or by compactness of a topological image over a general affinoid algebra.

**Proposed declaration:** `TauCeti.Overconvergent.compact_radius_restriction`.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- Use C6’s coherent cusp pushforward and the relative compactness W,V required by AdicSpacesPartII:R3. Source S(W) satisfies (Pr).
- Choose the same cofinal global-Hasse affinoid models as fixed-cusp-banach-modules, with the required relative compact containment after the controlling radius improvement.
- Use the admissible open arithmetic weight affinoid of fixed-cusp-banach-modules. An arbitrary bounded affinoid weight pullback needs a separate completed scalar-extension result preserving (Pr).

**Direct inputs.**

- `OverconvergentAutomorphicForms:O6/fixed-cusp-banach-modules`
- `AdicSpacesPartII:R3/restriction-strictly-completely-continuous`
- `LocallyAnalyticDistributions:L4/completely-continuous`
- `ShimuraCompactifications:C6`

**Proof outline.**

1. Apply AdicSpacesPartII:R3/restriction-strictly-completely-continuous to the coherent sections: after a continuous surjection from a topologically free Banach module, the restriction is strictly completely continuous.
2. Use the (Pr) splitting of fixed-cusp-banach-modules to remove that presentation; finite-rank approximation is preserved under bounded pre/post composition.
3. Use LAD L4/completely-continuous for the exact operator notion. For the controlling product choose V at improved partial radius v/p.

**Source matches.**

- [AIP-CUSP-2016](https://www.imo.universite-paris-saclay.fr/~pilloni/AIP2.pdf), Lemma 3.27 and proof, p.24: The compactness proof factors through restriction between the nested Hasse neighbourhoods.

**Acceptance.**

- Restriction along an equality of domains is the identity and is not completely continuous on an infinite orthonormalisable module.

#### Controlling Hilbert U operator

**ID:** `OverconvergentAutomorphicForms:O6/controlling-hilbert-operator`. **Kind:** construction.

**Statement.** On finite-level arithmetic cusp forms over a bounded affinoid family define U_p=∏_{𝔭|p}U_𝔭^{e_𝔭}, e_𝔭=v_𝔭(p), using the commuting arithmetic operators and polarisation transports. The product maps through the neighbourhood with every partial Hasse bound v_i/p; its total normalizer is (∏q_𝔭^{e_𝔭})⁻¹=p^(−g).

**Proposed declaration:** `TauCeti.Overconvergent.controlling_hilbert_operator`.

**Planet:** Controlling Hilbert U operator.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- Use compatible finite-level partial-radius correspondences and a fixed positive radius vector v. The arithmetic class quotient gives a canonical endomorphism; G* requires the stated polarisation representative maps.
- Choose the same cofinal global-Hasse affinoid models as fixed-cusp-banach-modules, with the required relative compact containment after the controlling radius improvement.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O6/wild-hilbert-hecke`
- `OverconvergentAutomorphicForms:O4/polarisation-choice-independence`
- `HilbertModularVarietiesAndShimuraCurves:H3`
- `HodgeTateAndCanonicalSubgroups:T4`
- `AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product`

**Proof outline.**

1. Compose wild operators with multiplicities e_𝔭. Their quotient isogenies cover all primes above p and their combined radius gain is division by p in each coordinate (AIP Lemma 3.25(4)).
2. Use arithmetic polarisation-choice-independence to identify the final pc component with c.
3. Compute ∏q_𝔭^{e_𝔭}=p^{∑e_𝔭f_𝔭}=p^g; retain that normalizer.

**Source matches.**

- [BHW-2023](https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf), Remark 10.6, p.1791: The controlling operator is the product with ramification multiplicities.
- [AIP-CUSP-2016](https://www.imo.universite-paris-saclay.fr/~pilloni/AIP2.pdf), Lemma 3.25(4) and Lemma 3.27, pp.22–24: The product improves all partial radii before the compact restriction factor.

**Uses.**

- O6 complete continuity; PadicFamilies:L2a: This operator and its (Pr) cusp Banach module provide the compact-operator input for a separately owned eigenvariety construction.

**API.**

- `TauCeti.Overconvergent.controlling_hilbert_operator.product` (characterisation): U_p=∏U_𝔭^{e_𝔭}, with compatible arithmetic polarisation identifications.
- `TauCeti.Overconvergent.controlling_hilbert_operator.radiusFactorisation` (functoriality): Factor S(v)→S(v/p)→S(v), where the first map is restriction and the second the bounded correspondence action.
- `TauCeti.Overconvergent.controlling_hilbert_operator.normalizer` (simp): The product scalar factor is p^(−g).

**Unit tests.**

- `TauCeti.Overconvergent.Test.O6_controlling_hilbert_operator_rational` (compatibility): For F=Q this is the usual single U_p with normalizer 1/p.
- `TauCeti.Overconvergent.Test.O6_controlling_hilbert_operator_ramification` (computation): If p is totally ramified of degree g, the controlling operator is U_𝔭^g, not just U_𝔭.
- `TauCeti.Overconvergent.Test.O6_controlling_hilbert_operator_split` (computation): For a split prime in a quadratic field it is U_𝔭1 U_𝔭2 with normalizer p⁻².

**Acceptance.**

- On finite-level arithmetic cusp forms over a bounded affinoid family define U_p=∏_{𝔭|p}U_𝔭^{e_𝔭}, e_𝔭=v_𝔭(p), using the commuting arithmetic operators and polarisation transports. The product maps through the neighbourhood with every partial Hasse bound v_i/p; its total normalizer is (∏q_𝔭^{e_𝔭})⁻¹=p^(−g).

#### Complete continuity of the controlling operator

**ID:** `OverconvergentAutomorphicForms:O6/controlling-complete-continuity`. **Kind:** theorem.

**Statement.** The controlling U_p on the specified finite-level, fixed positive-radius cusp Banach A-module is completely continuous. For G* include its fixed representative comparisons. The proof is the actual radius factorisation through the compact restriction of O6; no compactness claim for every individual U_𝔭 or for the ε=0/infinite-level space is included.

**Proposed declaration:** `TauCeti.Overconvergent.controlling_complete_continuity`.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- Use all hypotheses of fixed-cusp-banach-modules, compact-radius-restriction and controlling-hilbert-operator.
- Choose the same cofinal global-Hasse affinoid models as fixed-cusp-banach-modules, with the required relative compact containment after the controlling radius improvement.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O6/controlling-hilbert-operator`
- `OverconvergentAutomorphicForms:O6/compact-radius-restriction`
- `OverconvergentAutomorphicForms:O6/aip-hecke-equivariance`
- `LocallyAnalyticDistributions:L4/completely-continuous`

**Proof outline.**

1. Use U_p=bounded correspondence map ∘ restriction S(v)→S(v/p).
2. Apply compact-radius-restriction and stability of complete continuity under bounded composition from LAD L4.
3. O6 AIP Hecke equivariance gives the same factorisation as AIP CUSP Lemma 3.27, including normalization and polarisation choices.

**Source matches.**

- [AIP-CUSP-2016](https://www.imo.universite-paris-saclay.fr/~pilloni/AIP2.pdf), Lemma 3.27, p.24: The concrete compact restriction factor proves complete continuity.
- [BHW-2023](https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf), Remark 10.6, p.1791: BHW identifies this controlling product with the AIP compact operator.

**Acceptance.**

- At F=Q the factorisation passes through radius v/p.
- An individual split-prime operator improves only one direction, so this proof does not apply to it.

#### Integral renormalisation of wild Hecke operators

**ID:** `OverconvergentAutomorphicForms:O6/hecke-lattice-renormalisation`. **Kind:** theorem.

**Statement.** T_a preserves the specified integral lattice. Each q_𝔭 U_𝔭 preserves it, and p^g U_p preserves it because ∏q_𝔭^{e_𝔭}=p^g. These are sufficient uniform renormalizations on the stated domains, not assertions of optimality or integrality of the rational normalized U_𝔭 for every weight.

**Proposed declaration:** `TauCeti.Overconvergent.hecke_lattice_renormalisation`.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- Use integral coefficient maps, trace preserving O+ on the supplied finite locally free integral correspondence models, and integral polarisation transport.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O6/tame-hilbert-hecke`
- `OverconvergentAutomorphicForms:O6/wild-hilbert-hecke`
- `OverconvergentAutomorphicForms:O6/controlling-hilbert-operator`
- `AdicSpacesPartII:R3/analytic-trace-finite-locally-free`
- `PerfectoidSpaces:P9`
- `HilbertModularVarietiesAndShimuraCurves:H4`

**Proof outline.**

1. Tame normalizers q_a are p-adic units, so the integral pull-identify-trace map remains integral.
2. For a wild factor remove 1/q_𝔭; its coefficient map and integral trace preserve the lattice.
3. Compose the renormalized factors and use the degree/norm identity of controlling-hilbert-operator; arithmetic integral transport preserves the lattice.

**Source matches.**

- [BHW-2023](https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf), Lemma 10.3 and Remark 10.7, pp.1789–1791: The wild coefficient map is integral, but its rational trace normalizer need not preserve the lattice.

**Acceptance.**

- For F=Q the sufficient renormalization is pU_p.
- Tame integral preservation alone cannot prove normalized wild integral preservation.

#### Cuspidal coefficient pushforward vanishing

**ID:** `OverconvergentAutomorphicForms:O6/cuspidal-coefficient-vanishing`. **Kind:** theorem.

**Statement.** For the supplied toroidal-to-minimal map ρ at the finite Igusa/p-level formal model and the small analytic coefficient Ωχ, R^qρ_*Ωχ(−D)=0 for q>0; the untwisted structural assertion is R^qρ_*O(−D)=0. After the permitted base changes, the pushed-forward cusp coefficient is coherent and gives the acyclic affinoid section model used for (Pr) and specialisation.

**Proposed declaration:** `TauCeti.Overconvergent.cuspidal_coefficient_vanishing`.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Use the precise formal Igusa normalization, boundary divisor and sufficiently small analytic character χ of AIP CUSP §3.6. The formal cusp vanishing input from the fan/unit quotient is the recorded missing compactification theorem.
- The chosen minimal neighbourhood is an actual global-Hasse affinoid strict neighbourhood inside the partial-radius region; AIP CUSP Proposition 3.22’s Hattori footnote explicitly requires this refinement.

**Direct inputs.**

- `ShimuraCompactifications:C6`
- `AdicSpacesPartII:R3/tate-acyclicity-finite-modules`
- `OverconvergentAutomorphicForms:O5/aip-line-and-gluing`

**Proof outline.**

1. Use the formal cusp description supplied by C6: the completed torus embedding fan modulo its unit group, with positive support for O(−D).
2. The formal-functions theorem reduces higher direct-image vanishing to cohomology of those cusp fibres; AIP CUSP Appendix Proposition 6.4 gives the required fan/unit-quotient vanishing. This auxiliary theorem is recorded as a Part II owner gap, not presumed from a compactification alone.
3. AIP Lemma 3.19 identifies the small analytic character line modulo p with O. Lift the structural vanishing by p-adic completeness/Nakayama as in Corollary 3.20.
4. On the refined minimal affinoid use AdicSpacesPartII R3 finite-module Tate acyclicity; apply finite characteristic-zero projectors only after rationalisation.

**Source matches.**

- [AIP-CUSP-2016](https://www.imo.universite-paris-saclay.fr/~pilloni/AIP2.pdf), Theorem 3.17, Corollary 3.20 and Proposition 3.22 with footnote, pp.18–21: Cuspidal vanishing and the explicitly refined affinoid neighbourhood supply the Banach argument.

**Acceptance.**

- The argument uses −D and is not asserted for every noncuspidal coefficient sheaf.

### OverconvergentAutomorphicForms:O7

Ordered Igusa completion, weighted ordinary functions, structural/line comparisons and compatible restriction, expansions and operators.

#### Completed ordinary Igusa functions

**ID:** `OverconvergentAutomorphicForms:O7/ordinary-completed-functions`. **Kind:** construction.

**Statement.** On each ordinary formal affinoid patch define V+ = lim_m colim_i H^0(Ig_i,O/p^m), with i the finite Igusa level. Sheafify the compatible patchwise construction to obtain the completed Igusa structural sheaf; V=V+[1/p]. Global ordinary p-adic forms are its sheaf sections. Do not exchange the two limits or replace sheafwise completion by an unconditional global-section formula.

**Proposed declaration:** `TauCeti.Overconvergent.ordinary_completed_functions`.

**Planet:** Completed Igusa functions.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Use T5’s actual ordinary formal Igusa tower with finite-etale transition maps. The inverse limit defines the formal completed structural ring; an identification with the actual analytic tower O+ is the separate O7 comparison target, with the exact hypotheses still recorded as a gap.

**Direct inputs.**

- `HodgeTateAndCanonicalSubgroups:T5`
- `PerfectoidSpaces:P9`
- `AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product`

**Proof outline.**

1. Reduce the finite Igusa tower modulo p^m and form its direct limit in level first.
2. Take the p-adic inverse limit with its inverse-limit topology; this constructs formal completed tower functions. Do not identify it with analytic O+ merely from Heuer Proposition 3.8’s natural map.
3. Glue and sheafify over the ordinary formal base. Any global-limit interchange on a nonaffine space requires separate acyclicity/Mittag–Leffler hypotheses.

**Source matches.**

- [HEUER-2022](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/E9F0B6B21BA1F345142C7301C2EDDA28/S205050942200072Xa.pdf/line-bundles-on-rigid-spaces-in-the-v-topology.pdf), Proposition 3.8 and proof, p.16: The proof supplies the ordered formal completion and a natural equivariant map to analytic O+(X∞). It does not prove that this map is generally an isomorphism.
- [BHW-2023](https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf), Proof of Proposition 6.6, p.1758: The ordinary formal tower provides the actual integral coefficient trivializations.

**Uses.**

- O7 weighted ordinary forms and Hida input: These completed functions, with their actual deck action, define ordinary p-adic coefficients.

**API.**

- `TauCeti.Overconvergent.ordinary_completed_functions.modPower` (projection): Projection to colim_i O(Ig_i)/p^m.
- `TauCeti.Overconvergent.ordinary_completed_functions.levelAction` (structure): The compatible finite-level deck actions give a continuous completed tower action.
- `TauCeti.Overconvergent.ordinary_completed_functions.restriction` (functoriality): Restriction between formal patches commutes with both stated limit maps.
- `TauCeti.Overconvergent.ordinary_completed_functions.rationalise` (coercion): V+→V+[1/p].

**Unit tests.**

- `TauCeti.Overconvergent.Test.O7_ordinary_completed_functions_order` (characterisation): For the constant profinite translation tower with deck group Z_p, the m-th quotient is Map_lc(Z_p,Z/p^m); the compatible functions x↦x mod p^m define the completed continuous function x↦x, which factors through no single finite level over Z_p.
- `TauCeti.Overconvergent.Test.O7_ordinary_completed_functions_trivialTower` (compatibility): For a constant affine tower Spf R, the construction is the p-adic completion lim_m R/p^m.
- `TauCeti.Overconvergent.Test.O7_ordinary_completed_functions_nonaffine` (non-example): On a disjoint union of points indexed by n≥1 with a Z_p-torsor on each, the section whose nth component is the nth p-adic digit is locally in the finite-level mod-p structural colimit but has no uniform finite level globally. Thus sheafifying the level colimit before global sections cannot be replaced by a single global level colimit on this non-quasicompact base.

**Acceptance.**

- On each ordinary formal affinoid patch define V+ = lim_m colim_i H^0(Ig_i,O/p^m), with i the finite Igusa level. Sheafify the compatible patchwise construction to obtain the completed Igusa structural sheaf; V=V+[1/p]. Global ordinary p-adic forms are its sheaf sections. Do not exchange the two limits or replace sheafwise completion by an unconditional global-section formula.

#### Weighted ordinary Igusa forms

**ID:** `OverconvergentAutomorphicForms:O7/ordinary-weighted-forms`. **Kind:** construction.

**Statement.** For the continuous bounded integral weight κ, define ordinary geometric forms as the completed Igusa functions satisfying f(tu)=κ(u)⁻¹f(t), for the actual O_p^× deck action. Arithmetic ordinary forms retain the w-polarisation/determinant action and its descent exactly as O4. Coefficients and topology are completed before taking this weight equalizer.

**Proposed declaration:** `TauCeti.Overconvergent.ordinary_weighted_forms`.

**Planet:** Ordinary Igusa forms.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Use compatible integral weight coefficients: modulo p^m the character is locally constant and factors through a finite quotient on each fixed affinoid formal patch.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O7/ordinary-completed-functions`
- `OverconvergentAutomorphicForms:O0/bounded-weight-families`
- `OverconvergentAutomorphicForms:O4/twisted-polarisation-action`
- `OverconvergentAutomorphicForms:O4/weil-pairing-comparison`
- `HodgeTateAndCanonicalSubgroups:T5`
- `AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product`

**Proof outline.**

1. Construct the weight equalizer in the already completed Igusa structural sheaf.
2. Continuity of κ makes the finite reductions compatible; no single Igusa level is claimed to support every continuous character.
3. Use the same twisted finite polarisation descent and Weil-pairing transformation for the arithmetic forms.

**Source matches.**

- [BHW-2023](https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf), Proposition 6.6 and §9, pp.1758,1781–1787: Ordinary Igusa functions carry the same inverse-weight relation and arithmetic twists as the coefficient sheaves.
- [HEUER-2022](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/E9F0B6B21BA1F345142C7301C2EDDA28/S205050942200072Xa.pdf/line-bundles-on-rigid-spaces-in-the-v-topology.pdf), Proposition 3.8, p.16: Integral weight actions on the formal tower descend through compatible finite reductions.

**Uses.**

- Ordinary restriction and the Hida comparison boundary: The ordinary coefficient model is compared with ε=0 sheaves; no ordinary projector is assumed in the definition.

**API.**

- `TauCeti.Overconvergent.ordinary_weighted_forms.weightRelation` (characterisation): f(tu)=κ(u)⁻¹f(t).
- `TauCeti.Overconvergent.ordinary_weighted_forms.integralInclusion` (coercion): The integral weighted equalizer maps to its rationalized sheaf.
- `TauCeti.Overconvergent.ordinary_weighted_forms.weightPullback` (functoriality): Compatible base/weight pullback induces the weighted ordinary coefficient map.
- `TauCeti.Overconvergent.ordinary_weighted_forms.arithmeticDescent` (compatibility): Retain the finite twisted Δ action and the full pairing character when passing to arithmetic forms.

**Unit tests.**

- `TauCeti.Overconvergent.Test.O7_ordinary_weighted_forms_trivial` (degenerate): κ=1 gives deck-invariant completed functions.
- `TauCeti.Overconvergent.Test.O7_ordinary_weighted_forms_sign` (computation): For κ(u)=u^k in the elliptic case, the relation is f(tu)=u^(−k)f(t).
- `TauCeti.Overconvergent.Test.O7_ordinary_weighted_forms_conductor` (non-example): A character of arbitrarily large conductor cannot be imposed as equivariance on one fixed small finite Igusa level.

**Acceptance.**

- For the continuous bounded integral weight κ, define ordinary geometric forms as the completed Igusa functions satisfying f(tu)=κ(u)⁻¹f(t), for the actual O_p^× deck action. Arithmetic ordinary forms retain the w-polarisation/determinant action and its descent exactly as O4. Coefficients and topology are completed before taking this weight equalizer.

#### Igusa completion comparison

**ID:** `OverconvergentAutomorphicForms:O7/igusa-completion-comparison`. **Kind:** comparison.

**Statement.** For the actual ordinary formal affine Igusa tower, take the direct limit in finite level modulo p^m and then the inverse limit in m. Under the finite-level good-reduction and analytic completion contracts below, the natural map identifies this ordered completion with analytic tower O+, equivariantly and compatibly with formal-patch restriction. Compatible weight lattices may be completed by the specified coefficient construction; this does not identify every completed lattice tensor with geometric O+ of a weight product.

**Proposed declaration:** `TauCeti.Overconvergent.igusa_completion_comparison`.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- The ordinary base formal patch is flat, topologically of finite presentation, and formally smooth over the integral coefficient ring. Its finite Igusa covers are finite étale and surjective, so the ordinary finite-level special fibres are geometrically reduced. Use the open ordinary Rapoport moduli locus: arbitrary normalized positive-radius models are not included.
- For each finite level put A_i=O(Ig_i,an) with its uniform spectral norm and R_i=O(𝔐_i). T5/P9 supplies the finite-level good-reduction identity R_i={a:‖a‖≤1}, also after the coefficient-field extension. Pullback A_i→A_j is isometric, as its analytic map is surjective.
- P9 supplies the analytic affine tower with function ring A∞ equal to the separated spectral-norm completion of colim_i A_i and structural O+ equal to its power-bounded subring. Restrict on a compatible formal-affine basis. An infinite Igusa tower is not assumed perfectoid merely because its base field is perfectoid.
- For coefficient/weight completion retain the prescribed bounded lattice and P9’s reduction/restriction contract. Arbitrary weights need not have a good-reduction integral model, and geometric O+ is not identified with a lattice tensor without a separate comparison.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O7/ordinary-completed-functions`
- `PerfectoidSpaces:P9`
- `HodgeTateAndCanonicalSubgroups:T5`
- `AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product`

**Proof outline.**

1. AIP §7.1 p30 makes the ordinary finite-level Igusa covers finite étale over the smooth ordinary special fibre. The ordinary discussion in §8.4 p37 places them in the Rapoport locus. T5 must lift these facts to the actual flat formally smooth ordinary charts and finite étale integral covers used by O7, including the coefficient-field base extension.
2. At a discretely valued model with uniformizer π, reduced special fibre gives the elementary norm argument: if a∉πR_i, its nonzero reduction has no nilpotent power, hence ‖a^k‖=1 for all k. After π-scaling this proves the π-adic norm is power-multiplicative and R_i is exactly the unit ball of A_i. The extension to the specified coefficient field is a finite-level good-reduction base-change contract at P9; normality alone is not substituted for this contract.
3. Take the isometric union of the A_i. Its norm is power-multiplicative, hence so is the norm on its separated completion A∞. Consequently its power-bounded subring equals its unit ball.
4. Every element of the unit ball of A∞ can be approximated with error <1 by a finite-level element b. The ultrametric inequality makes ‖b‖≤1, so b∈R_i by the finite-level identity. Repeating to errors |p|^m shows that the unit ball is the p-adic completion of colim_i R_i. The p-adic and norm topologies agree on these integral rings, since p^m times the unit ball is the ball of radius |p|^m. Thus that completion is lim_m colim_i R_i/p^m, in exactly this order.
5. This proves the natural map is an isomorphism once the explicitly requested finite-level good-reduction/base-change and analytic tower contracts are supplied. Heuer Proposition3.8 alone gives only the map and formal-cocycle effectivity, not these contracts.
6. Check actions and restrictions at finite level; their continuous extensions give equivariance and glue the comparison. For weighted reductions use the compatible coefficient-lattice contract separately. No nonaffine global-section or limit interchange is invoked.

**Source matches.**

- [HEUER-2022](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/E9F0B6B21BA1F345142C7301C2EDDA28/S205050942200072Xa.pdf/line-bundles-on-rigid-spaces-in-the-v-topology.pdf), Proof of Proposition 3.8, p.16: Heuer constructs a natural map, not a general identification with O+. The exact isomorphism for the actual ordinary Igusa models is an additional unverified P9 target.
- [AIP-ADIC-2016](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/Hilbert_adicfinal.pdf), §7.1 p30; Proposition8.4 and ordinary discussion p37: The ordinary special fibre is smooth and its Igusa trivialization covers are finite étale; ordinary points lie in the Rapoport locus. These provide good-reduction leads for the explicit integral-model request, not a general completion theorem.

**Acceptance.**

- The finite-level unit-ball identity and isometric transitions are checked before completion.
- The completed norm remains power-multiplicative; a unit-ball approximant has integral finite-level coefficients.
- The constant model O_K⟨pT,T²,T³⟩ fails the reduced-fibre/unit-ball hypothesis: T² is bounded, but T is power-bounded and not a structural formal function.
- A non-quasicompact ordinary base retains patchwise sheafification; no uniform global finite level is inferred.

#### Restriction to ordinary Igusa forms

**ID:** `OverconvergentAutomorphicForms:O7/ordinary-restriction`. **Kind:** construction.

**Statement.** Restrict a fixed positive-radius geometric/arithmetic form to the ordinary locus and pull back to its Igusa frame, producing its weighted completed Igusa function. The maps are compatible with positive-radius restrictions and therefore give Mκ†→ordinary Igusa forms, with integral and cusp versions. No surjectivity onto all ordinary forms is part of this map.

**Proposed declaration:** `TauCeti.Overconvergent.ordinary_restriction`.

**Planet:** Ordinary restriction.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- Use the ordinary torsor frame comparison of T5 and O5. The map on integral sections uses the actual completed structural sheaf comparison.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O3/overconvergent-hilbert-forms`
- `OverconvergentAutomorphicForms:O7/ordinary-weighted-forms`
- `OverconvergentAutomorphicForms:O7/igusa-completion-comparison`
- `OverconvergentAutomorphicForms:O5/aip-comparison-naturality`
- `HodgeTateAndCanonicalSubgroups:T5`
- `AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product`

**Proof outline.**

1. Restrict the coefficient section to ε=0.
2. Pull to the ordinary Igusa torsor and evaluate using the selected differential/HT frame; its transformation is precisely the inverse weight relation.
3. Apply igusa-completion-comparison to identify the integral function, retain arithmetic twists, and use the positive-radius colimit universal property.

**Source matches.**

- [BHW-2023](https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf), Proof of Proposition 6.6 and Theorem 7.14, pp.1758,1764–1765: The ordinary coefficient frame is the restriction of the same independent torsor comparison.

**Uses.**

- O7 coefficient comparison; Hida-theoretic consumers: This supplies the actual bridge from positive-radius coefficients to completed ordinary coefficients.

**API.**

- `TauCeti.Overconvergent.ordinary_restriction.ofRadius` (compatibility): The colimit map on a positive-radius representative is restriction to the ordinary locus.
- `TauCeti.Overconvergent.ordinary_restriction.integral` (compatibility): The map preserves the integral weighted sheaf.
- `TauCeti.Overconvergent.ordinary_restriction.cusp` (compatibility): Boundary vanishing is retained on ordinary cusp charts.
- `TauCeti.Overconvergent.ordinary_restriction.levelWeight` (functoriality): The map commutes with compatible level and weight changes.

**Unit tests.**

- `TauCeti.Overconvergent.Test.O7_ordinary_restriction_representatives` (characterisation): Two colimit representatives agreeing on a smaller positive radius have the same ordinary image.
- `TauCeti.Overconvergent.Test.O7_ordinary_restriction_trivial` (computation): A weight-zero constant section restricts to the same constant Igusa function.
- `TauCeti.Overconvergent.Test.O7_ordinary_restriction_wholeSpace` (non-example): An ordinary function without any positive-radius extension is not declared an overconvergent form.

**Acceptance.**

- Restrict a fixed positive-radius geometric/arithmetic form to the ordinary locus and pull back to its Igusa frame, producing its weighted completed Igusa function. The maps are compatible with positive-radius restrictions and therefore give Mκ†→ordinary Igusa forms, with integral and cusp versions. No surjectivity onto all ordinary forms is part of this map.

#### Ordinary coefficient comparison

**ID:** `OverconvergentAutomorphicForms:O7/ordinary-coefficient-comparison`. **Kind:** comparison.

**Statement.** The ε=0 perfectoid/AIP integral coefficient sheaf identifies with the weighted completed Igusa sheaf through the ordinary differential frame and its formal cocycle descent. Arithmetic comparison retains w(eβ)⁻¹ and twisted finite Δ(N)-descent. This identifies ordinary coefficient models, not the entire positive-radius overconvergent space with ordinary Hida forms.

**Proposed declaration:** `TauCeti.Overconvergent.ordinary_coefficient_comparison`.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Use actual ordinary formal torsor and the completion comparison on patches; κ is bounded with integral unit values.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O7/ordinary-weighted-forms`
- `OverconvergentAutomorphicForms:O7/igusa-completion-comparison`
- `OverconvergentAutomorphicForms:O5/geometric-aip-comparison`
- `OverconvergentAutomorphicForms:O5/arithmetic-aip-comparison`
- `OverconvergentAutomorphicForms:O1/analytic-line-effectivity`
- `HodgeTateAndCanonicalSubgroups:T5`
- `AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product`

**Proof outline.**

1. On each ordinary formal patch the HT frame and modified differential frame coincide through T5.
2. Use O1 analytic-line-effectivity’s formal Igusa descent theorem to identify the weighted completed functions with the coefficient line.
3. Apply the O4 pairing and finite twisted descent to the arithmetic model; glue by the selected frame’s uniqueness.
4. Use O5’s integral comparison as an isomorphism of the specified O+ equalizers. Any claim of full-character positive-radius local freeness additionally requires the separate unit-trivialization input of O5/aip-line-and-gluing.

**Source matches.**

- [HEUER-2022](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/E9F0B6B21BA1F345142C7301C2EDDA28/S205050942200072Xa.pdf/line-bundles-on-rigid-spaces-in-the-v-topology.pdf), Proposition 3.8, p.16: Integral formal Igusa cocycles define the descended analytic line.
- [AIP-ADIC-2016](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/Hilbert_adicfinal.pdf), §8.4, discussion after Proposition 8.4, p.37: The ordinary restriction recovers the Katz/Hida coefficient model, with further Hida theorems separate.

**Acceptance.**

- For an algebraic elliptic weight this is the usual ordinary differential trivialization of ω^k.

#### Ordinary Hecke and expansion compatibility

**ID:** `OverconvergentAutomorphicForms:O7/ordinary-hecke-expansions`. **Kind:** theorem.

**Statement.** Ordinary restriction and the ordinary coefficient comparison commute with compatible weight/level/radius maps, normalized tame T_a, diamonds and wild U_𝔭 on the supplied ordinary correspondences, and with all supplied cusp q-expansions. Cusp forms remain cusp forms and integral renormalized operators obey the same comparison.

**Proposed declaration:** `TauCeti.Overconvergent.ordinary_hecke_expansions`.

**Planet:** Ordinary coefficient comparison.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Use the compactified ordinary correspondence, expansion and integral-trace inputs requested for O6; retain the same normalizers and arithmetic transport.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O7/ordinary-restriction`
- `OverconvergentAutomorphicForms:O7/ordinary-coefficient-comparison`
- `OverconvergentAutomorphicForms:O6/aip-hecke-equivariance`
- `OverconvergentAutomorphicForms:O6/hilbert-q-expansion-comparison`
- `OverconvergentAutomorphicForms:O6/hecke-lattice-renormalisation`
- `PerfectoidSpaces:P9`

**Proof outline.**

1. Restrict the O6 isogeny/torsor diagrams to the ordinary locus; the Igusa frame is the restriction of their tautological frame.
2. Finite-level reductions commute with the supplied correspondence maps and trace. Take completion in the established order to obtain the ordinary diagrams.
3. On Tate cusp charts the same coefficient trivialization gives the same q-series; arithmetic twists and the boundary ideal persist under descent.

**Source matches.**

- [BHW-2023](https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf), Proposition 10.8, pp.1791–1792: The torsor/isogeny comparison restricts to the ordinary coefficient model.
- [HEUER-2022](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/E9F0B6B21BA1F345142C7301C2EDDA28/S205050942200072Xa.pdf/line-bundles-on-rigid-spaces-in-the-v-topology.pdf), Proposition 3.8, p.16: Compatible finite-level integral reductions supply the completed version of the same diagrams.

**Acceptance.**

- In the elliptic case ordinary and overconvergent restriction have the same q-expansion at each ordinary cusp.
- No assertion of equality of all ordinary and finite-slope overconvergent spaces follows.

## Coverage and exact remaining inputs

The inventory is 74 nodes (5 definitions, 30 constructions, 5 lemmas, 20 theorems, 12 comparisons, 2 applications), 129 API items (128 for definitions/constructions and one comparison proof API), 109 test contracts, 32 planets, 38 baseline citations, 13 supplier requests and 13 explicit gaps.

| Stage | Status | Remaining work |
| --- | --- | --- |
| OverconvergentAutomorphicForms:O0 | planned | Supply the requested compact-torus character and multivariable analytic carriers; type coefficient/induction signatures. Resolve the Jacquet–Emerton/definite-unitary Part II proof inputs and type the Ding application. Use a verified chart radius, without the disproved scalar formula. |
| OverconvergentAutomorphicForms:O1 | planned | Supply P9’s actual coefficient ringed sites and effective torsor descent, including Heuer’s line-specific analytic criterion; replace the analytic sheaf signature register with typed declarations. |
| OverconvergentAutomorphicForms:O2 | planned | Supply T4/T5/S5’s actual Hilbert tower, coordinate and tautological-frame carriers; type the admitted-domain, automorphy and sheaf declarations. |
| OverconvergentAutomorphicForms:O3 | planned | Supply integral torsor effectivity and the ramified modified-lattice theorem; type section/colimit carriers and prove integral pullback only under the recorded flat/chart-change conditions. Establish positive-radius full-character O+ freeness via the separate unit-trivialization input; integral comparison alone does not establish it. |
| OverconvergentAutomorphicForms:O4 | planned | Supply H3/H4/S5’s exact effective quotient groups, pairing and transport laws; type the four separate presentations and all explicit comparison maps. Retain the full finite-character factor when comparing integral arithmetic coefficients. |
| OverconvergentAutomorphicForms:O5 | planned | Supply the actual frame/weight-product carriers and type the independent sheaves and valuative integral-equalizer comparison. Supply the full-character positive-radius O+ unit trivializations and unit chart ratios for integral freeness, separately from the comparison isomorphism. |
| OverconvergentAutomorphicForms:O6 | planned | Resolve the formal cusp-cohomology Part II input, integral trace preservation and B5 p-level/family expansion extension; type the cusp Banach, compact restriction and normalized Hecke carriers on actual cofinal global-Hasse affinoids. |
| OverconvergentAutomorphicForms:O7 | planned | Supply T5’s actual flat smooth ordinary models and finite étale formal Igusa covers, P9’s finite-level good-reduction identity after coefficient extension and analytic norm-completion tower with compatible restrictions. Then apply the specified unit-ball argument. Type the genuine completed/weighted ordinary carriers and their maps. Preserve the separate weight-lattice contract, patchwise sheafification and ordered limits. No Hida control theorem is inferred. |

### Supplier requests

**`PadicMeasuresIwasawaAlgebras:L0a`.** Universal rigid character spaces and characters for O_p^× and O_p^××Z_p^×; represent the continuous-character functors on affinoid algebras, pull back along x↦(x²,N(x)⁻¹), and provide bounded affinoid-image families. For Ding only compact T(O_K) coordinates are requested here, not a new noncompact character theory.

Consumers: `OverconvergentAutomorphicForms:O0/geometric-weight-characters`, `OverconvergentAutomorphicForms:O0/arithmetic-weight-characters`, `OverconvergentAutomorphicForms:O0/weight-comparison`, `OverconvergentAutomorphicForms:O0/analytic-continuation-of-bounded-weights`, `OverconvergentAutomorphicForms:O0/bounded-weight-families`, `OverconvergentAutomorphicForms:O0/unitary-jacquet-eigenvariety`.

**`LocallyAnalyticDistributions:L0`.** Multivariable analytic Banach functions on finite-product local-integer balls and compact Levi/Iwahori thickenings, Gauss norms, analytic orbit maps, locally uniform extension of continuous multiplicative characters on affinoid families as in AIP ADIC Proposition 2.8, uniqueness on products of Z_p lattices, LB restriction colimits and strong continuous dual topology. The printed scalar formula of BHW Prop.6.3 is excluded.

Consumers: `OverconvergentAutomorphicForms:O0/analytic-continuation-of-bounded-weights`, `OverconvergentAutomorphicForms:O0/finite-analytic-coefficients`, `OverconvergentAutomorphicForms:O0/analytic-induced-coefficients`, `OverconvergentAutomorphicForms:O3/overconvergent-hilbert-forms`, `OverconvergentAutomorphicForms:O5/aip-independent-coefficients`.

**`AutomorphicBundles:B4`.** Algebraic Hilbert differential eigensummands and determinant conventions; algebraic induced Levi representation associated bundles and their conversion to the O1 right/inverse convention. Existing B4 nodes were screened; no exact node supplies the requested p-adic-torsor comparison statement.

Consumers: `OverconvergentAutomorphicForms:O0/algebraic-induced-comparison`, `OverconvergentAutomorphicForms:O2/hilbert-algebraic-specialisation`.

**`AutomorphicBundles:B5`.** Extend the exact classical Hilbert cusp-expansion/principle/boundary nodes to the compactified p-level bounded analytic families used here, retaining the cusp coefficient line, connectedness/base hypotheses, finite-level character twist and the 1/q isogeny trace normalization. Classical prime-to-p expansion nodes alone do not supply this extension.

Consumers: `OverconvergentAutomorphicForms:O6/hilbert-q-expansion-comparison`.

**`PerfectoidSpaces:P9`.** Actual sheafwise O and O+ function descent on the indicated profinite Hilbert/Igusa torsors, also on all opens of the smooth weight product (product affinoids alone are insufficient); coefficient-sensitive functoriality, local O+[1/p]=O and integral trace preservation for the stated formal correspondences. For the actual analytic AIP B_n frame torsor additionally supply ((g_n f_n)_*O+)^{B_n}=O+ on all base opens; B_n is not merely a profinite deck group. Supply the geometric O+ sheaf version of the integral-coboundary unit criterion on all weight-product opens. The existing named theorem concerns a completed lattice tensor, which is not identified with geometric product O+. For rationalisation supply quasicompact inverse-image patches and local O+[1/p]=O there, so a finite cover gives one p-denominator for an equivariant function. For O5 check valued-point lifting/reflection of O+ bounds along the actual tower: every AIP frame after a valued extension is a B_m-translate of a lifted Hodge–Tate frame, and the multiplier and inverse are valuation units. This supplies the integral-equalizer comparison without freeness. Full-character positive-radius freeness is a distinct request for base-local unit eigenfunctions and unit transitions, including the normalized finite-Igusa factor. For O7 supply the finite-level good-reduction identity R_i=A_i° after coefficient extension, isometric transitions, and a sheafy analytic affine tower with A∞ the separated spectral-norm completion of colim_i A_i; restriction on the compatible formal-affine basis must agree. O7’s norm proof then identifies the ordered p-adic completion with A∞°. Keep weight-lattice completion separate from geometric product O+. Heuer3.8 is used for formal-unit cocycles and its natural map only.

Consumers: `OverconvergentAutomorphicForms:O1/equivariant-coefficient-sheaf`, `OverconvergentAutomorphicForms:O1/coefficient-descent-functoriality`, `OverconvergentAutomorphicForms:O1/analytic-line-effectivity`, `OverconvergentAutomorphicForms:O2/geometric-hilbert-sheaf`, `OverconvergentAutomorphicForms:O3/integral-hilbert-sheaf`, `OverconvergentAutomorphicForms:O3/integral-rationalisation`, `OverconvergentAutomorphicForms:O3/hilbert-weight-pullback`, `OverconvergentAutomorphicForms:O4/geometric-full-cover-comparison`, `OverconvergentAutomorphicForms:O4/weil-pairing-comparison`, `OverconvergentAutomorphicForms:O5/aip-line-and-gluing`, `OverconvergentAutomorphicForms:O5/geometric-aip-comparison`, `OverconvergentAutomorphicForms:O6/hecke-lattice-renormalisation`, `OverconvergentAutomorphicForms:O7/ordinary-completed-functions`, `OverconvergentAutomorphicForms:O7/igusa-completion-comparison`, `OverconvergentAutomorphicForms:O7/ordinary-hecke-expansions`.

**`HodgeTateAndCanonicalSubgroups:T4`.** Hilbert canonical/anticanonical domains at arbitrary p including ramification; actual Hodge–Tate coordinate and left fractional-linear convention z(γx)=(az(x)+b)/(cz(x)+d), with jγδ(x)=jγ(δx)jδ(x) and explicit inversion when converting to a right action; bound ε≤1/(c_p p^m), c_p=2 (p≥5),3 (p=3),4 (p=2); AL_n:X_{Γ0*(p^n)}(p^nε)_a≅X(ε); partial-Hasse improvement under u_𝔭 and the all-direction v/p improvement for ∏U_𝔭^{e_𝔭}.

Consumers: `OverconvergentAutomorphicForms:O2/admitted-hilbert-domain`, `OverconvergentAutomorphicForms:O2/hilbert-automorphy-factor`, `OverconvergentAutomorphicForms:O2/hilbert-cocycle-law`, `OverconvergentAutomorphicForms:O2/hilbert-level-radius-maps`, `OverconvergentAutomorphicForms:O4/geometric-full-cover-comparison`, `OverconvergentAutomorphicForms:O4/twisted-polarisation-action`, `OverconvergentAutomorphicForms:O6/wild-hilbert-hecke`, `OverconvergentAutomorphicForms:O6/controlling-hilbert-operator`.

**`HodgeTateAndCanonicalSubgroups:T5`.** The actual modified differential lattice on the Igusa cover (including ramified non-Rapoport points), B_m frame torsor, canonical-subgroup congruence and tautological Hodge–Tate lift; retain the left cz+d law, level/radius and isogeny diagrams. For O5 certify torsor transitivity on valued points, the common analytic-character admission and integral-unit multipliers. Positive-radius full-character integral freeness additionally needs base-local unit eigenfunctions on the normalized finite-Igusa factor and compatible O+ transitions; do not assume descent of the modified lattice just because it is a line on the cover. For O7 identify the actual ordinary flat formally smooth integral moduli charts, finite étale surjective formal Igusa covers and their coefficient extension, allowing P9’s finite-level good-reduction comparison. Smooth ordinary special fibres alone do not identify an unspecified formal model. The named hodge-tate-aip-lift is used with ε_base≤p^(−(m+1)); the s∘u_n source has radius p^n ε_base and must separately remain O2-admitted.

Consumers: `OverconvergentAutomorphicForms:O2/hilbert-automorphy-factor`, `OverconvergentAutomorphicForms:O2/hilbert-algebraic-specialisation`, `OverconvergentAutomorphicForms:O3/ramified-modified-lattice`, `OverconvergentAutomorphicForms:O5/aip-independent-coefficients`, `OverconvergentAutomorphicForms:O5/aip-line-and-gluing`, `OverconvergentAutomorphicForms:O5/geometric-aip-comparison`, `OverconvergentAutomorphicForms:O5/aip-comparison-naturality`, `OverconvergentAutomorphicForms:O6/aip-hecke-equivariance`, `OverconvergentAutomorphicForms:O7/ordinary-completed-functions`, `OverconvergentAutomorphicForms:O7/ordinary-weighted-forms`, `OverconvergentAutomorphicForms:O7/igusa-completion-comparison`, `OverconvergentAutomorphicForms:O7/ordinary-restriction`, `OverconvergentAutomorphicForms:O7/ordinary-coefficient-comparison`.

**`HilbertModularVarietiesAndShimuraCurves:H3`.** Polarisation component indexing by prime-to-p ideals and its narrow-class quotient, the effective finite Δ(N) action, and positive-unit/p-unit polarisation transports with their stabilizer and composition laws. O6 builds its isogeny correspondences from the universal moduli and level objects of H1/H4; H3 supplies their source/target component identifications.

Consumers: `OverconvergentAutomorphicForms:O3/fixed-radius-hilbert-forms`, `OverconvergentAutomorphicForms:O4/polarisation-class-forms`, `OverconvergentAutomorphicForms:O6/tame-hilbert-hecke`, `OverconvergentAutomorphicForms:O6/wild-hilbert-hecke`, `OverconvergentAutomorphicForms:O6/hilbert-diamond-operators`, `OverconvergentAutomorphicForms:O6/controlling-hilbert-operator`.

**`HilbertModularVarietiesAndShimuraCurves:H4`.** The effective Hilbert arithmetic/geometric quotients E(p^n), PΓ0(p^n), central closure Z∞, actual finite Δ(N) and profinite Δ(p∞N), positive-unit congruence/square relations, and transport P_x with its stabilizer and composition laws. Finite Δ and full tower Δ must remain distinct. Supply actual subgroup-scheme/level objects of the universal Hilbert abelian scheme and their forgetful/quotient maps for O6’s finite correspondences; the coefficient normalization and operator are owned by O6.

Consumers: `OverconvergentAutomorphicForms:O4/presentation-geometric-small`, `OverconvergentAutomorphicForms:O4/presentation-geometric-full`, `OverconvergentAutomorphicForms:O4/presentation-arithmetic-intermediate`, `OverconvergentAutomorphicForms:O4/presentation-arithmetic-full`, `OverconvergentAutomorphicForms:O4/arithmetic-representatives`, `OverconvergentAutomorphicForms:O4/twisted-polarisation-action`, `OverconvergentAutomorphicForms:O4/finite-polarisation-descent`, `OverconvergentAutomorphicForms:O4/polarisation-class-forms`, `OverconvergentAutomorphicForms:O4/polarisation-choice-independence`, `OverconvergentAutomorphicForms:O6/tame-hilbert-hecke`, `OverconvergentAutomorphicForms:O6/wild-hilbert-hecke`, `OverconvergentAutomorphicForms:O6/hilbert-diamond-operators`, `OverconvergentAutomorphicForms:O6/hecke-lattice-renormalisation`.

**`PerfectoidShimuraVarieties:S5`.** The three actual Hilbert Γ*, mixed Γ and arithmetic G infinite-level covers, their maps and right group actions; the Z_p^× torsor span and full profinite Δ(p∞N) torsor; O_p^×-valued Weil pairing eβ with (γ,x)^*w(eβ)=w(x⁻¹)w(detγ)w(eβ), and compatibility of the common HT coordinate.

Consumers: `OverconvergentAutomorphicForms:O4/presentation-geometric-small`, `OverconvergentAutomorphicForms:O4/presentation-geometric-full`, `OverconvergentAutomorphicForms:O4/presentation-arithmetic-intermediate`, `OverconvergentAutomorphicForms:O4/presentation-arithmetic-full`, `OverconvergentAutomorphicForms:O4/geometric-full-cover-comparison`, `OverconvergentAutomorphicForms:O4/weil-pairing-comparison`.

**`ShimuraCompactifications:C6`.** Toroidal/minimal/formal Hilbert models and compactified Igusa/Hecke maps including ramified p; boundary Cartier ideal and coefficient extension; ordinary cusp charts and finite polarisation compatibility; g>1 Koecher with normality/codimension hypotheses, the g=1 cusp calculation, and cofinal global-Hasse minimal affinoids with relative compact containment. The additional cuspidal formal cohomology theorem of AIP CUSP Thm3.17/Appendix6.4 is separately recorded as a scope extension gap, not assumed from this geometry alone.

Consumers: `OverconvergentAutomorphicForms:O6/hilbert-cusp-forms`, `OverconvergentAutomorphicForms:O6/hilbert-koecher`, `OverconvergentAutomorphicForms:O6/tame-hilbert-hecke`, `OverconvergentAutomorphicForms:O6/wild-hilbert-hecke`, `OverconvergentAutomorphicForms:O6/hilbert-diamond-operators`, `OverconvergentAutomorphicForms:O6/hilbert-q-expansion-comparison`, `OverconvergentAutomorphicForms:O6/fixed-cusp-banach-modules`, `OverconvergentAutomorphicForms:O6/compact-radius-restriction`, `OverconvergentAutomorphicForms:O6/cuspidal-coefficient-vanishing`.

**`CompletedCohomologyPartII:CC.8`.** Adapter of the generic completed topological object to Ding §4.2.2’s definite unitary Ŝξ,τ(U^℘,O_E)=lim_k colim_{U℘}Sξ,τ(U℘U^℘,O_E/ϖ_E^k), retaining the other-p coefficient lattices and commuting tame Hecke/GL_n(K) actions. Admissibility and Π|H≅C(H,E)^s are outside this purely topological adapter and are recorded under the new Jacquet owner gap.

Consumers: `OverconvergentAutomorphicForms:O0/unitary-completed-coefficients`.

**`HilbertModularVarietiesAndShimuraCurves:H1`.** The actual Hilbert PEL moduli scheme and universal O_F-abelian scheme with polarisation and prime-to-p level. O6 uses this carrier to construct its finite cyclic-subgroup correspondences and tame level automorphisms; no abstract arbitrary pair of maps is substituted.

Consumers: `OverconvergentAutomorphicForms:O6/tame-hilbert-hecke`, `OverconvergentAutomorphicForms:O6/wild-hilbert-hecke`, `OverconvergentAutomorphicForms:O6/hilbert-diamond-operators`.

### Recorded gaps

**Jacquet–Emerton eigenvariety and unitary regularity owner.** No existing stage/node covers Emerton analytic vectors and J_B, the full T(K)-character functor with unramified coordinates, coherent strong-dual support, definite-unitary admissibility/local regularity with s≥1, its dimension/depth theorem and classical-density reducedness. PadicFamilies L2a is the Buzzard compact-operator engine; CC.8 is only the completed topological adapter. Proposed Part II: PadicFamilies, Part II: Jacquet-module eigenvarieties, starting with these two existing packages and compact-torus characters. The Ding source proof leaves require the precise BHS/Emerton theorem statements before implementation.

Consumers: `OverconvergentAutomorphicForms:O0/unitary-completed-coefficients`, `OverconvergentAutomorphicForms:O0/unitary-jacquet-eigenvariety`, `OverconvergentAutomorphicForms:O0/unitary-eigenvariety-geometry`, `OverconvergentAutomorphicForms:O0/unitary-eigenvariety-reduced`.

**Cuspidal formal cohomology beyond compactification geometry.** C6 supplies geometry but has no exact node for the formal toric fan/unit quotient cusp vanishing of AIP CUSP Appendix Proposition6.4 and Theorem3.17, nor the theorem-on-formal-functions adapter. Proposed Part II: ShimuraCompactifications, Part II: Hilbert cusp cohomology, with the structural R^qρ_*O(−D)=0 input. O6 then proves the analytic coefficient lift and (Pr) application. The author-noted global-Hasse affinoid refinement must remain in the fixed-radius statement.

Consumers: `OverconvergentAutomorphicForms:O6/cuspidal-coefficient-vanishing`, `OverconvergentAutomorphicForms:O6/fixed-cusp-banach-modules`, `OverconvergentAutomorphicForms:O6/compact-radius-restriction`, `OverconvergentAutomorphicForms:O6/controlling-complete-continuity`.

**Numerical comparison of weight charts and radius ranges.** A common positive radius follows from the requested universal-coordinate analytic extension and canonical subgroup bounds. No valid scalar replacement for BHW rκ=|p|^r0|Tκ| was established; E3 disproves it even after the pro-p supremum correction. Implementation must use AIP coordinate charts/admitted inequalities, or prove a separate quantitative radius theorem; no guessed closed formula is a prerequisite here.

Consumers: `OverconvergentAutomorphicForms:O0/analytic-continuation-of-bounded-weights`, `OverconvergentAutomorphicForms:O2/admitted-hilbert-domain`, `OverconvergentAutomorphicForms:O5/geometric-aip-comparison`.

**O0 prototype carriers from suppliers.** The pinned libraries lack the actual rigid analytic chart/induction, Hilbert moduli tower, torsor, adic ringed coefficient site or completed ordinary carrier required by these statements. Their complete mathematical signatures, API and test contracts are recorded in the suggested-file omission register, with the named supplier prerequisites above. No Prop-valued substitute or fake geometric carrier is introduced. Replace register entries by typed signatures as the suppliers are formalised. The auxiliary FiniteCoefficientCore now types the underlying group-action linear equivalence, diagonal tensor, inverse-action dual, algebraic base change, continuous finite-projective core on moduleTopology, and a separately supplied stable lattice. Its eight examples test these prerequisites; they do not certify analytic orbit maps, finite-projective Banach completed scalar extension, or the conductor/chart non-example. The required finite_analytic_coefficients node and its API still lack the analytic supplier types.

Consumers: `OverconvergentAutomorphicForms:O0/analytic-continuation-of-bounded-weights`, `OverconvergentAutomorphicForms:O0/bounded-weight-families`, `OverconvergentAutomorphicForms:O0/finite-analytic-coefficients`, `OverconvergentAutomorphicForms:O0/coefficient-tensor-dual`, `OverconvergentAutomorphicForms:O0/analytic-induced-coefficients`, `OverconvergentAutomorphicForms:O0/algebraic-induced-comparison`, `OverconvergentAutomorphicForms:O0/unitary-completed-coefficients`, `OverconvergentAutomorphicForms:O0/unitary-jacquet-eigenvariety`, `OverconvergentAutomorphicForms:O0/unitary-eigenvariety-geometry`, `OverconvergentAutomorphicForms:O0/unitary-eigenvariety-reduced`.

**O1 prototype carriers from suppliers.** The algebraic RightCocycle core, equivariant submodule, gauge equivalence and left-to-right conversion are typed in the suggested file. The actual analytic coefficient ringed site, torsor, analytic function and stable-lattice conditions are absent from the pinned libraries and remain precise supplier-dependent signature omissions; no Prop-valued replacement is introduced.

Consumers: `OverconvergentAutomorphicForms:O1/right-automorphy-cocycle`, `OverconvergentAutomorphicForms:O1/equivariant-coefficient-sheaf`, `OverconvergentAutomorphicForms:O1/coefficient-descent-functoriality`, `OverconvergentAutomorphicForms:O1/analytic-line-effectivity`.

**O2 prototype carriers from suppliers.** The pinned libraries lack the actual rigid analytic chart/induction, Hilbert moduli tower, torsor, adic ringed coefficient site or completed ordinary carrier required by these statements. Their complete mathematical signatures, API and test contracts are recorded in the suggested-file omission register, with the named supplier prerequisites above. No Prop-valued substitute or fake geometric carrier is introduced. Replace register entries by typed signatures as the suppliers are formalised.

Consumers: `OverconvergentAutomorphicForms:O2/admitted-hilbert-domain`, `OverconvergentAutomorphicForms:O2/hilbert-automorphy-factor`, `OverconvergentAutomorphicForms:O2/hilbert-cocycle-law`, `OverconvergentAutomorphicForms:O2/geometric-hilbert-sheaf`, `OverconvergentAutomorphicForms:O2/hilbert-level-radius-maps`, `OverconvergentAutomorphicForms:O2/hilbert-algebraic-specialisation`.

**O3 prototype carriers from suppliers.** The pinned libraries lack the actual rigid analytic chart/induction, Hilbert moduli tower, torsor, adic ringed coefficient site or completed ordinary carrier required by these statements. Their complete mathematical signatures, API and test contracts are recorded in the suggested-file omission register, with the named supplier prerequisites above. No Prop-valued substitute or fake geometric carrier is introduced. Replace register entries by typed signatures as the suppliers are formalised.

Consumers: `OverconvergentAutomorphicForms:O3/integral-hilbert-sheaf`, `OverconvergentAutomorphicForms:O3/integral-rationalisation`, `OverconvergentAutomorphicForms:O3/hilbert-weight-pullback`, `OverconvergentAutomorphicForms:O3/fixed-radius-hilbert-forms`, `OverconvergentAutomorphicForms:O3/overconvergent-hilbert-forms`, `OverconvergentAutomorphicForms:O3/ramified-modified-lattice`.

**O4 prototype carriers from suppliers.** The pinned libraries lack the actual rigid analytic chart/induction, Hilbert moduli tower, torsor, adic ringed coefficient site or completed ordinary carrier required by these statements. Their complete mathematical signatures, API and test contracts are recorded in the suggested-file omission register, with the named supplier prerequisites above. No Prop-valued substitute or fake geometric carrier is introduced. Replace register entries by typed signatures as the suppliers are formalised.

Consumers: `OverconvergentAutomorphicForms:O4/presentation-geometric-small`, `OverconvergentAutomorphicForms:O4/presentation-geometric-full`, `OverconvergentAutomorphicForms:O4/presentation-arithmetic-intermediate`, `OverconvergentAutomorphicForms:O4/presentation-arithmetic-full`, `OverconvergentAutomorphicForms:O4/arithmetic-representatives`, `OverconvergentAutomorphicForms:O4/geometric-full-cover-comparison`, `OverconvergentAutomorphicForms:O4/twisted-polarisation-action`, `OverconvergentAutomorphicForms:O4/finite-polarisation-descent`, `OverconvergentAutomorphicForms:O4/weil-pairing-comparison`, `OverconvergentAutomorphicForms:O4/polarisation-class-forms`, `OverconvergentAutomorphicForms:O4/polarisation-choice-independence`.

**O5 prototype carriers from suppliers.** The pinned libraries lack the actual rigid analytic chart/induction, Hilbert moduli tower, torsor, adic ringed coefficient site or completed ordinary carrier required by these statements. Their complete mathematical signatures, API and test contracts are recorded in the suggested-file omission register, with the named supplier prerequisites above. No Prop-valued substitute or fake geometric carrier is introduced. Replace register entries by typed signatures as the suppliers are formalised. The suggested file types the normed-field translation test and the algebraic invariant-ring/unit-generator criterion; these scalar tests do not supply an analytic torsor or its local integral generators. The arbitrary-rank algebraic implication is now typed as aip_translation_valuation_units using Valuation and its actual integer subring. ValuationTranslation types finite-order valuation one and a dependent family of valuation groups, with six pointwise tests including the lexicographic two-rank group. The multiplier bounds are explicit hypotheses; proving them on the admitted actual analytic frame torsor and turning the pointwise argument into a sheaf comparison remain omitted geometric contracts.

Consumers: `OverconvergentAutomorphicForms:O5/aip-independent-coefficients`, `OverconvergentAutomorphicForms:O5/aip-line-and-gluing`, `OverconvergentAutomorphicForms:O5/geometric-aip-comparison`, `OverconvergentAutomorphicForms:O5/arithmetic-aip-comparison`, `OverconvergentAutomorphicForms:O5/aip-comparison-naturality`, `OverconvergentAutomorphicForms:O5/aip-translation-valuation-units`.

**O6 prototype carriers from suppliers.** The pinned libraries lack the actual rigid analytic chart/induction, Hilbert moduli tower, torsor, adic ringed coefficient site or completed ordinary carrier required by these statements. Their complete mathematical signatures, API and test contracts are recorded in the suggested-file omission register, with the named supplier prerequisites above. No Prop-valued substitute or fake geometric carrier is introduced. Replace register entries by typed signatures as the suppliers are formalised.

Consumers: `OverconvergentAutomorphicForms:O6/hilbert-cusp-forms`, `OverconvergentAutomorphicForms:O6/hilbert-koecher`, `OverconvergentAutomorphicForms:O6/tame-hilbert-hecke`, `OverconvergentAutomorphicForms:O6/wild-hilbert-hecke`, `OverconvergentAutomorphicForms:O6/hilbert-diamond-operators`, `OverconvergentAutomorphicForms:O6/aip-hecke-equivariance`, `OverconvergentAutomorphicForms:O6/hilbert-q-expansion-comparison`, `OverconvergentAutomorphicForms:O6/fixed-cusp-banach-modules`, `OverconvergentAutomorphicForms:O6/compact-radius-restriction`, `OverconvergentAutomorphicForms:O6/controlling-hilbert-operator`, `OverconvergentAutomorphicForms:O6/controlling-complete-continuity`, `OverconvergentAutomorphicForms:O6/hecke-lattice-renormalisation`, `OverconvergentAutomorphicForms:O6/cuspidal-coefficient-vanishing`.

**O7 prototype carriers from suppliers.** The pinned libraries lack the actual rigid analytic chart/induction, Hilbert moduli tower, torsor, adic ringed coefficient site or completed ordinary carrier required by these statements. Their complete mathematical signatures, API and test contracts are recorded in the suggested-file omission register, with the named supplier prerequisites above. No Prop-valued substitute or fake geometric carrier is introduced. Replace register entries by typed signatures as the suppliers are formalised. The suggested file types the power-multiplicative norm step and a polynomial seed of the nonnormal-model counterexample. The seed is not a Tate algebra or a formal Igusa model. OrdinaryAffineCompletion now types the real ring-level formula: quotient finite-level rings by the ideal generated by p^m, take the directed ring colimit in level, then take the subring of precision-compatible families. Precision projection, affine restriction, localization at p and comparison of a constant ring tower with Mathlib AdicCompletion have typed signatures and four examples. These auxiliary affine constructions do not supply formal Igusa patch rings, deck action, topology, gluing/sheafification or analytic O+; all required geometric O7 names remain omissions.

Consumers: `OverconvergentAutomorphicForms:O7/ordinary-completed-functions`, `OverconvergentAutomorphicForms:O7/ordinary-weighted-forms`, `OverconvergentAutomorphicForms:O7/igusa-completion-comparison`, `OverconvergentAutomorphicForms:O7/ordinary-restriction`, `OverconvergentAutomorphicForms:O7/ordinary-coefficient-comparison`, `OverconvergentAutomorphicForms:O7/ordinary-hecke-expansions`.

**Full finite-character positive-radius integral freeness.** AIP ADIC Propositions4.3/4.7 pp16–18 prove universal-character formal freeness; §6.4 p29 adds wχ, coherent and invertible on the ordinary locus and rational fibre. Positive-radius full-character analytic O+ freeness still requires base-local unit-valued torsor eigenfunctions and unit chart ratios. The T5/P9 request must identify the normalized finite-Igusa lattice, including p-primary χ, and prove this exact unit criterion or a coefficient-sensitive freeness theorem. O5 now proves the isomorphism of integral equalizers by rational comparison and valuative boundedness without this freeness premise. Thus the gap concerns freeness, not that integral isomorphism. Algebraic twisting alone is insufficient: it must compare the modified differential lattice on the actual Igusa cover and its base descent. No claim that the published theorem is false is made. The existing P9 completed-lattice-tensor unit criterion is only an algebraic model: its geometric O+ weight-product variant requires the requested invariant-function descent and must not be inferred by identifying the two coefficient objects.

Consumers: `OverconvergentAutomorphicForms:O3/integral-hilbert-sheaf`, `OverconvergentAutomorphicForms:O5/aip-independent-coefficients`, `OverconvergentAutomorphicForms:O5/aip-line-and-gluing`, `OverconvergentAutomorphicForms:O5/arithmetic-aip-comparison`, `OverconvergentAutomorphicForms:O6/hecke-lattice-renormalisation`, `OverconvergentAutomorphicForms:O7/ordinary-coefficient-comparison`.

**Ordinary good-reduction model and analytic tower contracts.** O7 supplies the completion/unit-ball argument, using reduced special fibres at a discretely valued model and isometric finite-level maps. T5 must identify the actual ordinary formal charts as flat formally smooth with finite étale surjective Igusa covers, also after the stated base extension. P9 must supply R_i=A_i° after this extension and the analytic tower completion A∞=completion(colim A_i), with compatible formal-patch restrictions. These are exact verifiable hypotheses, not a consequence of Heuer3.8’s natural map or of normality alone. Arbitrary weight tensors additionally need their separate compatible lattice comparison. The argument does not assert that the Igusa tower is perfectoid.

Consumers: `OverconvergentAutomorphicForms:O7/ordinary-completed-functions`, `OverconvergentAutomorphicForms:O7/igusa-completion-comparison`, `OverconvergentAutomorphicForms:O7/ordinary-restriction`, `OverconvergentAutomorphicForms:O7/ordinary-coefficient-comparison`, `OverconvergentAutomorphicForms:O7/ordinary-hecke-expansions`.

### Ownership extensions

- Keep universal compact-torus weight/character functors exclusively in PMIA L0a; LAD L3 owns Mellin transforms using those spaces. O0 imports both analytic extension and universal characters without rebuilding either.
- Add PadicFamilies, Part II: Jacquet-module eigenvarieties, with completed topological adapters and PMIA compact-torus characters as its first inputs; own noncompact character coordinates, analytic vectors/J_B, strong-dual coherence, definite-unitary local regularity, dimension/depth and classical-density reducedness there.
- Add ShimuraCompactifications, Part II: Hilbert cusp cohomology, starting from C6 formal cusp charts and proving AIP CUSP Appendix6.4/Thm3.17. O6 owns the analytic coefficient lift, affinoid cusp Banach application and compact controlling operator.

## Pinned baseline

Mathlib: `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti: `f790474821cf4256814db967cb154e7af3d0c369`. Citations supply only the stated algebraic or topological input, not an adic, analytic or Jacquet enhancement.

| Declaration | Module | Provides |
| --- | --- | --- |
| `mathlib:Algebra.TensorProduct.leftAlgebra` | [Mathlib/RingTheory/TensorProduct/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/TensorProduct/Basic.lean) | The A-algebra structure on A ⊗[R] B from the left factor. |
| `mathlib:Algebra.norm` | [Mathlib/RingTheory/Norm/Defs.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Norm/Defs.lean) | The norm of a finite free algebra: determinant of left multiplication. |
| `mathlib:Algebra.norm_apply` | [Mathlib/RingTheory/Norm/Defs.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Norm/Defs.lean) | Algebra.norm R x = det of multiplication by x. |
| `mathlib:Algebra.norm_eq_prod_embeddings` | [Mathlib/RingTheory/Norm/Transitivity.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Norm/Transitivity.lean) | The norm is the product of the conjugates under all embeddings into an algebraically closed field. |
| `mathlib:ContinuousMonoidHom` | [Mathlib/Topology/Algebra/ContinuousMonoidHom.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/ContinuousMonoidHom.lean) | Continuous monoid homomorphisms between topological monoids. |
| `mathlib:ContinuousMonoidHom.comp` | [Mathlib/Topology/Algebra/ContinuousMonoidHom.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/ContinuousMonoidHom.lean) | Composition of continuous monoid homs. |
| `mathlib:ContinuousMonoidHom.fst` | [Mathlib/Topology/Algebra/ContinuousMonoidHom.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/ContinuousMonoidHom.lean) | The first projection as a continuous monoid hom. |
| `mathlib:ContinuousMonoidHom.snd` | [Mathlib/Topology/Algebra/ContinuousMonoidHom.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/ContinuousMonoidHom.lean) | The second projection as a continuous monoid hom. |
| `mathlib:Ideal.span` | [Mathlib/RingTheory/Ideal/Span.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Ideal/Span.lean) | The ideal generated by a set. |
| `mathlib:IsModuleTopology` | [Mathlib/Topology/Algebra/Module/ModuleTopology.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/Module/ModuleTopology.lean) | The class asserting a module carries its module topology. |
| `mathlib:IsModuleTopology.continuous_of_linearMap` | [Mathlib/Topology/Algebra/Module/ModuleTopology.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/Module/ModuleTopology.lean) | Linear maps between modules with the module topology are continuous. |
| `mathlib:IsModuleTopology.isTopologicalRing` | [Mathlib/Topology/Algebra/Module/ModuleTopology.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/Module/ModuleTopology.lean) | A finite algebra with the module topology over a topological ring is a topological ring. |
| `mathlib:IsTopologicalRing` | [Mathlib/Topology/Algebra/Ring/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/Ring/Basic.lean) | Topological rings. |
| `mathlib:LinearMap.det` | [Mathlib/LinearAlgebra/Determinant.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Determinant.lean) | The determinant of an endomorphism of a finite free module. |
| `mathlib:LinearMap.det_baseChange` | [Mathlib/LinearAlgebra/Charpoly/BaseChange.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Charpoly/BaseChange.lean) | The determinant commutes with base change. |
| `mathlib:Module.Finite.base_change` | [Mathlib/RingTheory/TensorProduct/Finite.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/TensorProduct/Finite.lean) | Base change of a finite module is finite. |
| `mathlib:Module.Free.tensor` | [Mathlib/LinearAlgebra/TensorProduct/Basis.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/TensorProduct/Basis.lean) | Tensor products of free modules are free. |
| `mathlib:Module.finrank_baseChange` | [Mathlib/LinearAlgebra/Dimension/Constructions.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Dimension/Constructions.lean) | finrank of a base change equals the finrank of the original module. |
| `mathlib:NumberField.IsTotallyReal` | [Mathlib/NumberTheory/NumberField/InfinitePlace/TotallyRealComplex.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/InfinitePlace/TotallyRealComplex.lean) | A number field all of whose complex embeddings are real. |
| `mathlib:NumberField.RingOfIntegers` | [Mathlib/NumberTheory/NumberField/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/Basic.lean) | The ring of integers 𝓞 K of a number field. |
| `mathlib:NumberField.RingOfIntegers.rank` | [Mathlib/NumberTheory/NumberField/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/Basic.lean) | The ℤ-rank of 𝓞 K is [K : ℚ]. |
| `mathlib:NumberField.isUnit_iff_norm` | [Mathlib/NumberTheory/NumberField/Units/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/Units/Basic.lean) | For an algebraic integer, being a unit is equivalent to absolute value of its field norm being 1; the integer norm ±1 description follows from integrality. |
| `mathlib:PadicInt` | [Mathlib/NumberTheory/Padics/PadicIntegers.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Padics/PadicIntegers.lean) | The p-adic integers ℤ_[p]. |
| `mathlib:PadicInt.compactSpace` | [Mathlib/NumberTheory/Padics/ProperSpace.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Padics/ProperSpace.lean) | ℤ_[p] is compact. |
| `mathlib:Rat.ringOfIntegersEquiv` | [Mathlib/NumberTheory/NumberField/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/Basic.lean) | The ring of integers of ℚ is ℤ. |
| `mathlib:Subgroup` | [Mathlib/Algebra/Group/Subgroup/Defs.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Subgroup/Defs.lean) | Subgroups of a group. |
| `mathlib:Subgroup.FiniteIndex` | [Mathlib/GroupTheory/Index.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/Index.lean) | Finite-index subgroups. |
| `mathlib:TensorProduct` | [Mathlib/LinearAlgebra/TensorProduct/Defs.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/TensorProduct/Defs.lean) | The tensor product of modules over a commutative semiring. |
| `mathlib:Units.map` | [Mathlib/Algebra/Group/Units/Hom.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Units/Hom.lean) | The map on units induced by a monoid hom. |
| `mathlib:moduleTopology` | [Mathlib/Topology/Algebra/Module/ModuleTopology.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/Module/ModuleTopology.lean) | The module topology: the finest topology making addition and scalar multiplication continuous. |
| `mathlib:Representation` | [Mathlib/RepresentationTheory/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Basic.lean) | For a semiring k, monoid G and k-module V, a monoid hom G→*Module.End k V; continuity is extra. |
| `mathlib:Representation.tprod` | [Mathlib/RepresentationTheory/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Basic.lean) | Tensor product action on V⊗[k]W over a commutative semiring, with the same monoid. |
| `mathlib:Representation.dual` | [Mathlib/RepresentationTheory/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Basic.lean) | For a group G over a commutative ring, contragredient action on Module.Dual k V by precomposition with ρ(g⁻¹). |
| `mathlib:Representation.invariants` | [Mathlib/RepresentationTheory/Invariants.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Invariants.lean) | The submodule of vectors fixed by every group element. |
| `mathlib:ContinuousLinearMap` | [Mathlib/Topology/Algebra/Module/ContinuousLinearMap/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/Module/ContinuousLinearMap/Basic.lean) | Continuous semilinear map of topological modules; bounded Banach operators are a specialisation. |
| `mathlib:SheafOfModules` | [Mathlib/Algebra/Category/ModuleCat/Sheaf.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Category/ModuleCat/Sheaf.lean) | A presheaf of modules on a site whose underlying additive presheaf is a sheaf; no adic ringed site is supplied. |
| `tauceti:NumberField.NarrowClassGroup` | [TauCeti/NumberTheory/NumberField/NarrowClassGroup/Basic.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/NumberField/NarrowClassGroup/Basic.lean) | Invertible fractional ideals modulo principal ideals generated by totally positive elements. |
| `tauceti:NumberField.NarrowClassGroup.instFinite` | [TauCeti/NumberTheory/NumberField/NarrowClassGroup/Finite.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/NumberField/NarrowClassGroup/Finite.lean) | For a number field, its narrow ideal class group is finite. |

Additional pinned declarations used by the typed algebraic prerequisites (statements read at the exact Mathlib commit on 9 October 2026):

| Reference | Module | Scope |
| --- | --- | --- |
| `mathlib:Module.Projective` | [Mathlib/Algebra/Module/Projective.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Module/Projective.lean) | Projective modules are split summands of free modules; finite projectivity is expressed together with Module.Finite, without a free-basis assumption. |
| `mathlib:LinearMap.baseChange` | [Mathlib/LinearAlgebra/TensorProduct/Tower.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/TensorProduct/Tower.lean) | For an R-linear map and an R-algebra A, its A-linear extension on A tensor M; algebraic, not a completed Banach base change. |
| `mathlib:Valuation` | [Mathlib/RingTheory/Valuation/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Valuation/Basic.lean) | A multiplicative zero-preserving map satisfying the ultrametric inequality with values in a linearly ordered commutative monoid with zero. No real-valued restriction. |
| `mathlib:Valuation.integer` | [Mathlib/RingTheory/Valuation/Integers.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Valuation/Integers.lean) | For a ring and a linearly ordered commutative group with zero, the subring of elements whose valuation is at most one. |
| `mathlib:DirectLimit` | [Mathlib/Order/DirectedInverseSystem.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Order/DirectedInverseSystem.lean) | The quotient of a directed disjoint union by eventual equality. Ring structure for ring-hom transition maps is provided by Mathlib/Algebra/Colimit/DirectLimit.lean. |
| `mathlib:DirectLimit.Ring.of` | [Mathlib/Algebra/Colimit/DirectLimit.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Colimit/DirectLimit.lean) | The canonical ring map from a component of a directed ring system into its direct limit. |
| `mathlib:DirectLimit.Ring.lift` | [Mathlib/Algebra/Colimit/DirectLimit.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Colimit/DirectLimit.lean) | Compatible component ring maps induce a ring map out of the directed limit; used for precision reduction after the level colimit. |
| `mathlib:Ideal.Quotient.lift` | [Mathlib/RingTheory/Ideal/Quotient/Defs.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Ideal/Quotient/Defs.lean) | A ring map killing an ideal descends to its quotient; supplies finite-level reduction pullbacks. |
| `mathlib:Ideal.Quotient.factor` | [Mathlib/RingTheory/Ideal/Quotient/Defs.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Ideal/Quotient/Defs.lean) | An inclusion of ideals induces a ring map from the smaller-ideal quotient to the larger-ideal quotient; supplies decreasing p-adic precision. |
| `mathlib:AdicCompletion` | [Mathlib/RingTheory/AdicCompletion/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/AdicCompletion/Basic.lean) | Compatible inverse-limit families in module quotients by ideal powers. Mathlib/RingTheory/AdicCompletion/Algebra.lean supplies the componentwise commutative ring structure for completion of the ring. |

## Sources and source issues

All source matches above are own-word statements with section, theorem and page locators. Public source versions are pinned by the packet fingerprints; source passages are not reproduced.

- [Overconvergent Hilbert modular forms via perfectoid modular varieties](https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf), Christopher Birkbeck, Ben Heuer and Chris Williams. Annales de l'Institut Fourier 73 (2023), no. 4, 1709–1794, DOI 10.5802/aif.3560; open-access journal PDF from Centre Mersenne (87 pages; printed page = PDF page + 1707).
- [Overconvergent Hilbert modular forms via perfectoid modular varieties (arXiv version)](https://arxiv.org/pdf/1902.03985v4), Christopher Birkbeck, Ben Heuer and Chris Williams. arXiv:1902.03985v4, 10 May 2021, PDF.
- [The adic, cuspidal, Hilbert eigenvarieties](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/Hilbert_adicfinal.pdf), Fabrizio Andreatta, Adrian Iovita, Vincent Pilloni. Research in the Mathematical Sciences 3 (2016), 34; author PDF, 40 pages (author pagination used).
- [On overconvergent Hilbert Modular cusp forms](https://www.imo.universite-paris-saclay.fr/~pilloni/AIP2.pdf), Fabrizio Andreatta, Adrian Iovita, Vincent Pilloni. Astérisque 382 (2016), 163–192; author PDF, 35 pages (author pagination used).
- [Higher Coleman theory](https://www.imo.universite-paris-saclay.fr/~pilloni/HigherColeman.pdf), George Boxer, Vincent Pilloni. Author version, 180 pages; §6.2–6.3 pagination.
- [p-adic Hodge parameters in the crystabelline representations of GL_n](https://pmihes.centre-mersenne.org/item/10.1007/s10240-025-00156-2.pdf), Yiwen Ding. Publications Mathématiques de l’IHÉS 142 (2025), 1–74; version of record.
- [Line bundles on rigid spaces in the v-topology](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/E9F0B6B21BA1F345142C7301C2EDDA28/S205050942200072Xa.pdf/line-bundles-on-rigid-spaces-in-the-v-topology.pdf), Ben Heuer. Forum of Mathematics, Sigma 10 (2022), e82; DOI10.1017/fms.2022.72, 36 pages.

**OverconvergentAutomorphicForms/E1 — misprint.** §6.1, Definition 6.1, printed p. 1756 (PDF p. 49); same in arXiv v4. The printed dual group map uses a positive norm exponent, whereas the accompanying character formula uses the inverse norm character. Use x↦(x²,N(x)⁻¹); pullback of (w,t) is w²·(t⁻¹∘N). Pulling a character (w, t) back along x ↦ (x², N(x)) gives x ↦ w(x)²·t(N(x)), not w(x)²·t(N(x))⁻¹; the two differ unless t∘N is 2-torsion. The displayed formula is the one used later: after Definition 6.2 (p. 1757, ρ(w_κ, t_κ) = w_κ²·(t_κ⁻¹∘N)) and in (9.1) (p. 1781, κ⁻¹(η)w_κ(η²) = t_κ∘N(η)), which holds for the inverted map. Checked on the page images.

**OverconvergentAutomorphicForms/E2 — error.** §6.1 after Definition 6.2, printed p. 1757 (PDF p. 50); also Definition 4.5(3), printed p. 1737, and Definition 7.7, printed p. 1761; same in arXiv v4. The definition takes a supremum of character deviations over the entire unit group and associates bounded weights with a strict bound below one. For boundedness diagnostics take the supremum over a fixed sufficiently small pro-p principal-unit subgroup; keep boundedness itself as affinoid-image boundedness. For quantitative AIP domains use the universal-coordinate annuli of AIP ADIC §2.4.3; do not identify their coordinate δ with this corrected supremum without proof. For p odd and F = ℚ, the Teichmüller character ω : ℤ_p^× → ℤ_p^× is an L-point of 𝒲, hence a bounded weight, but for a primitive (p−1)-st root of unity ζ, |ω(ζ) − 1| = |ζ − 1| = 1. So the printed |T_ω| = 1, contradicting 'bounded iff |T_κ| < 1'; likewise for any weight nontrivial on the prime-to-p torsion of 𝒪_p^×. Then |δ_κ| = 1 and |p|^{ε_κ} = 1 give ε_κ = 0, contradicting '0 < ε_κ' in Definitions 4.5(3) and 7.7, so the AIP comparison (Theorems 4.8 and 7.14) is stated only over the ordinary locus for such weights. Checked on the page images. This correction alone does not validate the printed analytic radius (E3), nor identify the scalar pro-p norm with all AIP coordinates.

**OverconvergentAutomorphicForms/E3 — error.** Proposition6.3, p1757; arXiv v4 Proposition6.3. The proposed radius multiplies the principal-unit scale by the character-deviation parameter. Assert an existential common analytic radius, supplied by AIP Proposition2.8 on genuine universal-coordinate charts; omit this numerical formula. Even replacing the supremum by a pro-p supremum does not fix the formula. Take F=Q,p=3, κ trivial on μ2 and κ(4)=ζ9 primitive. On H1, |Tκ|=3^(−1/6), so the printed r is 3^(−7/6). The analytic ball about1 contains64=4³ since |64−1|3=3^(−2)<r, and κ(64)=ζ3≠1. But κ=1 on4^(9·3^j), a sequence converging to1 inside the ball. The analytic identity theorem forces an extension to equal1 on this ball, contradicting its value at64. Thus the formula fails for a genuine bounded finite-character weight with the corrected pro-p supremum.

**OverconvergentAutomorphicForms/E4 — misprint.** Definition7.1(1), p1759; arXiv v4 §7.1. The printed canonical-subgroup order has exponent m without the number-field degree. The O_F-linear canonical subgroup is of order p^(mg), g=[F:Q], while it is locally O_F/p^mO_F as an O_F-module. An O_F/p^mO_F module has p^(m[F:Q]) elements. The same definition gives this local module model; order p^m agrees only in degree1.

**OverconvergentAutomorphicForms/E5 — misprint.** Remark6.9, p1759. The projective Banach cusp result is attributed to reference [2] rather than the cusp-form paper [3]. The projective Banach cusp citation belongs to [3] (AIP CUSP), Theorem3.16; the fixed-radius arithmetic assertion is Theorem4.4, with the cofinal affinoid refinement in its proof. Reference [2], AIP ADIC, has no Theorem3.16. Reference [3], AIP CUSP, has the stated projective-Banach/specialisation theorem; its Prop3.22 proof includes the global-Hasse affinoid refinement noted by Hattori.

**OverconvergentAutomorphicForms/E6 — misprint.** Theorem7.14, printed p1764 (PDF p57), and arXiv v4 PDF p31 display the isomorphism in the direction opposite to the scaled frame pullback. Evaluation of AIP eigenfunctions along the frame gives ω_AIP,n^{κ,+}→ω_n^{κ,+}, as the first step of the proof states. The reverse direction is the inverse isomorphism. This changes the label/direction of the displayed map, not the existence of the isomorphism. Independently confirmed by REV-OverconvergentAutomorphicForms--O0~2 on 2026-10-08.
