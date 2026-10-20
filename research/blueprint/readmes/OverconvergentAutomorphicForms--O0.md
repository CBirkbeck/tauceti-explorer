# Overconvergent Hilbert modular forms and analytic coefficients

This specification covers layers O0–O7 of the roadmap at target level. It builds Hilbert weights and analytic coefficient representations, equivariant coefficient sheaves from cocycles, the perfectoid overconvergent Hilbert sheaves of Birkbeck–Heuer–Williams with their integral lattices and arithmetic descent, the independent Andreatta–Iovita–Pilloni (AIP) sheaves and their comparison, cusp forms and Hecke operators with the compact controlling operator, and ordinary Igusa forms. Every target is a declaration below whose direct inputs end in the pinned libraries, in exact nodes of other roadmaps, in two supplier requests or in one of three recorded gaps. O1, O2, O4 and O6 are closed; O0, O3, O5 and O7 are planned, each with its precise remaining input. All implementation statuses are unchecked.

The [packet](../packets/OverconvergentAutomorphicForms--O0.json) and the [suggested Lean file](../suggested/OverconvergentAutomorphicForms--O0.lean) describe the same declarations. The Lean file states what is statable on carriers that exist at the pins (the algebra 𝒪_p, its norm and principal units, point characters, the weight map, right cocycles, congruence-unit cancellation and the valuation step of the integral comparison); every other target here is stated in this document with its intended signature, because its carriers (rigid weight spaces, analytic induction, coefficient sheaves, Hilbert towers, AIP torsors, compactifications) belong to the supplying roadmaps.

## Conventions and ownership

Let F be totally real, g=[F:Q], and p any rational prime, including primes ramified in F. Set 𝒪_p=ℤ_p⊗_ℤ𝒪_F, with scalars on the left and the ℤ_p-module topology. Real and p-adic embeddings have different indexing types; algebraic comparisons use a specified splitting coefficient field. Work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity, with tame level prime to p and sufficiently small. Products with smooth rigid weight bases are the sousperfectoid products of AdicSpacesPartIV R5; a smooth weight product need not itself be perfectoid.

A geometric weight is κ:𝒪_p^×→A^×; an arithmetic weight is (w,t) on 𝒪_p^××ℤ_p^×. Their relation is κ(x)=w(x)²t(N(x))⁻¹, and the dual group map is x↦(x²,N(x)⁻¹) (Birkbeck–Heuer–Williams print the positive exponent; source issue E1). For a totally positive global unit η, N(η)=1 and κ(η)⁻¹w(η²)=1; for a unit η≡1 modulo N≥3 the same holds without positivity, which is what the central kernel of arithmetic descent needs (E7). AIP's plus-norm arithmetic convention is converted by ν=w and w_AIP=t⁻¹.

The reusable vector convention is a right action xγ, with J(γδ,x)=J(γ,x)J(δ,xγ), and f(xγ)=ρ(J(γ,x)⁻¹)f(x). Matrix factors keep their order. Gauge transport is J′(γ,x)=b(x)⁻¹J(γ,x)b(xγ), f′(x)=ρ(b(x)⁻¹)f(x). The Hilbert source uses a left action: j(γδ,x)=j(γ,δx)j(δ,x) and f(γx)=κ(j(γ,x))⁻¹f(x). For a left coefficient cocycle K the right adapter is xγ=γ⁻¹x, J(γ,x)=K(γ⁻¹,x)⁻¹, inverting both group and coefficient.

Finite projective analytic coefficients use the algebraic representation together with analytic orbit maps on Lie charts and a canonical Banach topology; a stable integral lattice is extra data. Analytic induction is usually infinite-dimensional: its functions live on the adic Iwahori thickening of the closed subgroup M_1 of Boxer–Pilloni, and its ordinary strong Banach dual differs from their projective distribution module. The algebraic representation embeds properly in analytic induction.

### Exact supplier contracts

| Supplier (TauCetiRoadmap status) | What is consumed, by upstream section |
| --- | --- |
| LocallyAnalyticRepresentationsOfLocalGroups (atlas) | LR.6 character variety of a topologically finitely generated abelian locally analytic group (it represents the weight functors of 𝒪_p^× and of T(K)); LR.2 analytic vectors; LR.6 Jacquet–Emerton functor and its properties. The Hecke eigenvariety geometry in Ding's setting is the substantive open request. |
| LocallyAnalyticDistributions (PR) | §0.3: analytic functions on finite polydisc charts, chart pullback, compact restriction to smaller radius, compact-type duality; §4.1: complete continuity and property (Pr); §4.15: affinoid-valued analytic stages, their completed scalar tensors, and analyticity of the universal character at a common radius on each affinoid chart. |
| CompletedCohomologyPartII (PR) | §§1.1–1.3 fixed-exponent colimits, local-group action and tame Hecke; §2.1 completed cohomology; §2.6 adic topology; §2.10 unitary Banach completion. Its definite-unitary adapter §8.5 is for GL_3 with all p-places varying, so Ding's general-n single-place model is built in O0. |
| AdicSpacesPartII, Part III, Part IV (main) | Part II R0: completed tensor products of Banach modules and the reduced-reduction criterion A₀=A°; Part III R3: traces of finite locally free maps, pull–identify–trace operators, strictly completely continuous restriction, Tate acyclicity, spectral norms; Part IV R5: completed coefficient sheaves, local equalizers and perfectoid-times-smooth products. (Atlas node ids keep the stage names AdicSpacesPartII R3/R5.) |
| AdicEtaleGeometry (main) | A1: the étale site, the étale structure sheaves O and O⁺, geometric points. |
| PerfectoidTowers (PR) | P9.6–P9.13: descent of O and O⁺ along pro-étale towers, after product with a smooth weight space, of finite locally free modules, twisted character sheaves, finite-level comparison, the all-open sheaf equalizer after coefficient base change (§P9.11) and integral effectivity in finite rank (§P9.13). (Atlas node ids keep the stage name PerfectoidSpaces P9.) |
| HilbertModularVarietiesAndShimuraCurves (PR) | §H1.4 Hilbert PEL instance, §H1.7 representability; §H3.1 congruence units, §H3.6 arithmetic quotient, §H3.7 ideal-class comparisons, §H3.8 Hecke isogenies; §H4.8 integral Γ₀ levels, §H4.13 effective finite level groups, §H4.15 scalar kernel, §H4.16 projective level group, §H4.17 finite-level torsors. Torsor statements are on quotient stacks, and on coarse spaces only over free loci. |
| HodgeTateAndCanonicalSubgroups (PR) | §3.8 quotients and the Hasse radius; §3.10 Hilbert canonical subgroups; §3.12 the 𝒪_F/p^n-linear canonical generator (n≥2, p unramified, or H=H′[p^n]); §4.1, §4.3, §4.4, §4.6, §4.7 canonical/anticanonical loci, Atkin–Lehner, the Hodge–Tate coordinate and cz+d, period-map inclusions (strict endpoint for p≥3, inclusive for p=2), ramified period comparison; §5.1 Igusa torsors and the ordinary tower, §5.3–5.4 the modified lattice ω^int, §5.8 the AIP torsor, §5.10 the Hodge–Tate lift, §5.11 the AIP factor, §5.12 the tower–torsor comparison. That roadmap leaves to this one the coefficient sheaves, the finite-character integral generator with unit pullback, the structure-sheaf invariants of the torsor, the Frobenius restriction comparison of AIP Theorem 6.7(3) (all O5) and p-Hecke operators (O6). |
| PerfectoidShimuraVarieties (PR) | §5.4 the three Hilbert towers, §5.5 the ℤ_p^× span, §5.5a and §5.6 E(p^n) and the 𝒪_p^×-valued Weil pairing, §5.7 polarization torsors, §5.8 level torsors and Z_∞, §5.10 period maps and domains. |
| AutomorphicBundles (PR) | B0.2 ineffective-fibre descent, B0.8 sections as equivariant functions, B2.3 highest-weight conventions, B4.12 the split Hilbert coefficient, B5.10 geometric Hecke operators, B5.16–B5.19 Hilbert q-expansions, expansion principle, cusp constants and Hecke action on coefficients. It leaves q-expansions of p-adic analytic families to consumers; they are O6 here. |
| ShimuraCompactifications (PR) | C3.5 toric acyclicity, C3.6a formal functions for proper algebraic spaces (the explicit stage interface below), C3.8 boundary ideals along refinements; C5.22 Koecher on normalized models (every open, every coefficient ring), C5.24 its ordinary-locus form, C5.26 the formal Koecher principle; C6.11 arithmetic Koecher, C6.12 cusp forms and the boundary ideal, C6.21 fine Hilbert toroidal compactification, C6.38 geometric q-expansion, C6.42 cusp ideals on minimal and toroidal models, C6.43 models at all primes, C6.46 Hasse neighbourhoods, C6.48 finite-level boundary maps. It states no higher direct images to the minimal compactification; that theorem is O6 here. |
| PadicFamilies, L2a (atlas) | The compact-operator eigenvariety engine consumes O6's controlling operator; it is separate from the Jacquet eigenvariety of Ding. |

## Domains and integral comparison contracts

Boundedness means that the family maps into one affinoid of weight space; smoothness concerns its rigid base. The pro-p diagnostic T_pro(κ)=sup_{x∈1+p^{r₀}𝒪_p}‖κ(x)−1‖, r₀=1 for odd p and 3 for p=2, is distinct from an analytic extension radius and from AIP's universal-coordinate parameter. A common analytic neighbourhood comes from the universal character on an affinoid chart; no numerical radius is deduced from the printed formula of Birkbeck–Heuer–Williams Proposition 6.3 (E3).

For an admitted B_r(𝒪_p^×:1), choose m≥1 with p^(−m)≤r<1. The anticanonical domain has 0≤ε<1/(c_p p^m) with c_p=2 for p≥5 and 3 for p=3, and 0≤ε≤1/(4·2^m) for p=2; at a prime ramified in F with m=1 also ε≤p^(−3). For the Hodge–Tate lift to the AIP torsor also require ε≤p^(−(m+1)), and at finite level n also p^nε<1/2 and the canonical range at each intermediate quotient. Atkin–Lehner transport is AL_n:X_{Γ₀*(p^n)}(p^nε)_a≅X(ε); n=0 uses AL_1. At a ramified prime the canonical generator is the unsplit 𝒪_F/p^n-linear one; 𝒪_p⊗O_C is never identified integrally with a product of copies of O_C (E8).

O3 defines the integral eigenfunction equalizer before discussing local freeness. At ramified non-Rapoport points the modified differential lattice on the Igusa cover is needed. Integral base change retains its flat and chart assumptions.

O5 keeps four statements distinct. AIP Propositions 4.3 and 4.7 give a universal-character formal line. The finite-character factor w_χ is coherent, invertible rationally and on the ordinary locus, and on the split cover over the tower has the unit generator e_{χ,σ}. The invariants of the AIP frame torsor are base functions, integrally and rationally. Integral local freeness of the full-character sheaf at positive radius is open, and a model shows that a unit eigenfunction upstairs does not give it.

The rational AIP/perfectoid comparison is evaluation at the Hodge–Tate frame. Its integral refinement compares two integral equalizers without presupposing their freeness: every valued AIP frame is, after a valued extension, a B_m-translate of a lifted Hodge–Tate frame, and κ(b), κ(b)⁻¹ are integral units on the admitted torsor, so translation preserves pointwise integrality.

O7 forms lim_m colim_i O(𝔐_i)/p^m on formal affine patches and sheafifies, in this order. Heuer Proposition 3.8 gives a natural map to analytic O⁺; it is an isomorphism under the good-reduction contracts of O7/igusa-completion-comparison, whose base change to the nondiscrete field L is a recorded gap. The tower is not assumed perfectoid.

## Layer targets and acceptance

O0 specialises compact-torus weights and analytic coefficient representations and includes Ding's definite-unitary completed coefficients: lim_k colim_{U_℘} of finite automorphic function spaces with the inverse algebraic action, an admissible unitary Banach representation whose restriction to a compact open H is C(H,E)^s with s≥1. Its Jacquet–Emerton eigenvariety geometry is the substantive open request.

O1 constructs right vector cocycles, equalizer sheaves, gauge changes and coefficient operations, and line effectivity by Heuer's dense-open criterion. O2 pins the Hilbert factor cz+d, the left cocycle law, the admitted domains, levels and algebraic specialisations. O3 supplies integral equalizers, fixed-radius sections and the radius colimit with conditional integral pullbacks.

O4 defines the geometric small and full and the arithmetic intermediate and full presentations independently before comparing them. The completed effective deck group of the arithmetic presentations is the target O4/effective-arithmetic-descent of the assembled roadmap packet (`OverconvergentAutomorphicForms.json`), cited from there. Finite Δ(N) and profinite Δ(p^∞N) are different quotients. The arithmetic intermediate action is ε·_w f=w(ε)(ε⁻¹)*f; the full comparison uses f↦w(e_β)⁻¹π_∞*f.

O5 constructs the AIP sheaf independently, proves its torsor invariants, finite-character factor and Frobenius restriction comparison, and compares it with the perfectoid sheaf geometrically and arithmetically, naturally in weight, level and radius.

O6 distinguishes boundary extension from cusp vanishing. Koecher needs g>1 and is proved through the ordinary locus; g=1 uses the cusp calculation. Cusp forms use the boundary ideal; the higher direct images of torsion line bundles twisted by −D to the minimal compactification vanish. Family q-expansions at p-level cusps take values in the weight coefficient line with its cusp-unit action. Their expansion principle requires the chosen cusp lifts to meet every relevant finite-level ordinary Igusa component on each weight chart. Tame T_a has normalizer 1/q_a and degree q_a+1; wild U_𝔭 has degree q_𝔭 and normalizer 1/q_𝔭; the controlling product ∏U_𝔭^{e_𝔭} improves all directions and is completely continuous, while a single partial operator need not be.

O7 identifies ordinary coefficient models and their restriction, Hecke and expansion diagrams. Weighted functions satisfy f(tu)=κ(u)⁻¹f(t). No Hida control theorem is inferred.

## Declaration plan

Each declaration below gives its exact contract, direct inputs, proof steps and source matches. Definitions and constructions give their API and discriminating unit tests. These statements, names and tests agree with the packet.


### OverconvergentAutomorphicForms:O0

Weight spaces and locally analytic representations. Hilbert torus weights, bounded extension, finite/vector coefficients, analytic induction and Ding’s independent unitary consumer.

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

**Statement.** Define N_alg : 𝒪_p → ℤ_p as the determinant norm Algebra.norm ℤ_p on the finite free ℤ_p-algebra 𝒪_p, and N : 𝒪_p^× → ℤ_p^× as its restriction to units. N_alg is a continuous multiplicative map and N is a continuous homomorphism. For every a ∈ 𝒪_F, N_alg(1 ⊗ a) is the image of N_{F/ℚ}(a) in ℤ_p. For a global unit η this specializes to N(1 ⊗ η) = N_{F/ℚ}(η) in ℤ_p^×.

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

1. Construct N_alg with Algebra.norm ℤ_[p] : 𝒪_p →* ℤ_p, then define N as Units.map N_alg. An arbitrary a ∈ 𝒪_F belongs in the first formula; only a unit belongs in the second.
2. Continuity: in a ℤ_p-basis the norm is a polynomial in the coordinates (Algebra.norm_apply, LinearMap.det), and coordinates are continuous for the module topology.
3. Compatibility: multiplication by 1 ⊗ a is the base change of multiplication by a on 𝒪_F, so its determinant is N_{F/ℚ}(a) (LinearMap.det_baseChange).

**Source matches.**

- [BHW-2023](https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf), §6.1, Definition 6.1, printed p. 1756: N_{F/ℚ} on T(ℤ_p), used in the weight map; here constructed as the norm of 𝒪_p over ℤ_p.

**Uses.**

- OverconvergentAutomorphicForms:O0/weight-dual-group-map: the second coordinate x ↦ N(x)^{-1}.

**API.**

- `TauCeti.HilbertWeight.continuous_normUnits` (other): N is continuous.
- `TauCeti.HilbertWeight.norm_tmul_one` (compatibility): For every a ∈ 𝒪_F, N_alg(1 ⊗ a) = N_{F/ℚ}(a) in ℤ_p.
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

**ID:** `OverconvergentAutomorphicForms:O0/geometric-weight-characters`. **Kind:** definition. **Planet:** Hilbert weight space for G*.

**Statement.** For a topological commutative ring R, the R-points of the weight space 𝒲* for G* are the continuous characters T(ℤ_p) = 𝒪_p^× → R^×: GeomWeight F p R := ContinuousMonoidHom 𝒪_p^× R^×. BHW's 𝒲* = Spf(ℤ_p⟦T(ℤ_p)⟧)^an_η × L is the rigid space representing this functor on affinoid L-algebras; that rigid space is the character variety of the compact abelian ℚ_p-analytic group 𝒪_p^× (LocallyAnalyticRepresentationsOfLocalGroups LR.6), on which continuous and locally analytic characters agree.

**Proposed declaration:** `TauCeti.HilbertWeight.GeomWeight`.

**Hypotheses.**

- R a topological commutative ring, R^× with the units topology.
- No analyticity or algebraicity is assumed: an arbitrary continuous character is a weight, not an algebraic weight.
- All representation-by-rigid-space assertions use the imported universal character functor; the Lean abbreviation itself gives points only.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O0/units-at-p`
- `mathlib:ContinuousMonoidHom`
- `mathlib:IsTopologicalRing`
- `LocallyAnalyticRepresentationsOfLocalGroups:LR.6/character-variety`

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

**ID:** `OverconvergentAutomorphicForms:O0/arithmetic-weight-characters`. **Kind:** definition. **Planet:** Hilbert weight space for G.

**Statement.** For a topological commutative ring R, the R-points of the weight space 𝒲 for G are the continuous characters of T(ℤ_p) × ℤ_p^×: ArithWeight F p R := ContinuousMonoidHom (𝒪_p^× × ℤ_p^×) R^×. Every such character is uniquely a pair (w, t) with w ∈ GeomWeight and t : ℤ_p^× → R^× continuous, via κ(x, y) = w(x)t(y).

**Proposed declaration:** `TauCeti.HilbertWeight.ArithWeight`.

**Hypotheses.**

- R a topological commutative ring.
- All representation-by-rigid-space assertions use the imported universal character functor; the Lean abbreviation itself gives points only.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O0/units-at-p`
- `OverconvergentAutomorphicForms:O0/geometric-weight-characters`
- `mathlib:ContinuousMonoidHom`
- `mathlib:ContinuousMonoidHom.fst`
- `mathlib:ContinuousMonoidHom.snd`
- `LocallyAnalyticRepresentationsOfLocalGroups:LR.6/character-variety`

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

**ID:** `OverconvergentAutomorphicForms:O0/weight-comparison`. **Kind:** construction. **Planet:** Weight map ρ.

**Statement.** ρ_R : ArithWeight F p R → GeomWeight F p R, κ ↦ κ ∘ ι, natural in the coefficient ring R. It is the map on points of BHW's morphism ρ : 𝒲 → 𝒲*, through which every weight for G is regarded as a weight for G*.

**Proposed declaration:** `TauCeti.HilbertWeight.weightMap`.

**Hypotheses.**

- R a topological commutative ring; naturality is for continuous ring maps R → R'.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O0/arithmetic-weight-characters`
- `OverconvergentAutomorphicForms:O0/geometric-weight-characters`
- `OverconvergentAutomorphicForms:O0/weight-dual-group-map`
- `mathlib:ContinuousMonoidHom.comp`
- `LocallyAnalyticRepresentationsOfLocalGroups:LR.6/character-variety`

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
- The morphism of rigid spaces 𝒲 → 𝒲* is the pullback of LR.6 character varieties along ι, which exists by representability; its points are ρ_R.

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

- This is the coefficient-level form of 'an affinoid image is bounded'; unboundedness only occurs for non-affinoid families U, which need the rigid character variety of LR.6.
- Power-multiplicativity is needed: for a non-uniform norm the binomial estimate fails.
- The ultrametric hypothesis is needed for the domination step; archimedean normed algebras are excluded.

#### Analytic continuation of bounded weights

**ID:** `OverconvergentAutomorphicForms:O0/analytic-continuation-of-bounded-weights`. **Kind:** theorem. **Planet:** Analytic continuation of weights.

**Statement.** For a bounded smooth family κ:U→W*, there exists a common positive radius r<1 and a unique analytic multiplicative extension of its character to B_r(O_p^×:1)×U, agreeing with κ on O_p^××U. The extension respects multiplication wherever defined. This is an existence theorem; r=|p|^r0 |Tκ| is not asserted (E3).

**Proposed declaration:** `TauCeti.Overconvergent.analytic_continuation_of_bounded_weights`.

**Hypotheses.**

- Tame level N is prime to p and sufficiently small for the geometric Hilbert moduli schemes; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. Arithmetic finite-level torsors are taken over the quotient stacks, or on coarse spaces over the respective action-free loci supplied by H3.6, H4.17 and S5.8; N≥4 alone does not assert freeness of a polarization or diagonal action.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Boundedness is affinoid-image boundedness. The corrected pro-p supremum is a useful diagnostic, not the universal-coordinate annulus of AIP Proposition 2.8.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O0/geometric-weight-characters`
- `OverconvergentAutomorphicForms:O0/weight-radius-parameter`
- `OverconvergentAutomorphicForms:O0/continuous-character-bounded`
- `LocallyAnalyticDistributions:L0/multivariable-fixed-radius`
- `LocallyAnalyticDistributions:L0/analytic-chart-pullback`
- `LocallyAnalyticDistributions:L4/affinoid-analytic-stage`
- `LocallyAnalyticDistributions:L4/analytic-completed-tensor`
- `LocallyAnalyticDistributions:L4/uniform-family-radius`
- `LocallyAnalyticRepresentationsOfLocalGroups:LR.6/character-variety`

**Proof outline.**

1. Pull the family back from one affinoid of the universal compact-torus character space (the LR.6 character variety of 𝒪_p^×, with its universal character made analytic on each affinoid chart by LocallyAnalyticDistributions §4.15).
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

- Tame level N is prime to p and sufficiently small for the geometric Hilbert moduli schemes; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. Arithmetic finite-level torsors are taken over the quotient stacks, or on coarse spaces over the respective action-free loci supplied by H3.6, H4.17 and S5.8; N≥4 alone does not assert freeness of a polarization or diagonal action.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O0/geometric-weight-characters`
- `OverconvergentAutomorphicForms:O0/arithmetic-weight-characters`
- `LocallyAnalyticRepresentationsOfLocalGroups:LR.6/character-variety`
- `LocallyAnalyticDistributions:L4/uniform-family-radius`

**Proof outline.**

1. Use the universal character of the LR.6 character variety and pull it back; retain the chosen affinoid chart to select a common analytic neighbourhood.
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

**ID:** `OverconvergentAutomorphicForms:O0/finite-analytic-coefficients`. **Kind:** definition. **Planet:** Analytic coefficient representations.

**Statement.** For a compact open H of a p-adic Levi M and affinoid A, a finite analytic coefficient representation is a finite projective A-module V with its canonical Banach topology and continuous A-linear H-action whose orbit maps are analytic on specified Lie charts H_n. A stable A+-lattice V+ is additional data. The representation includes scalar characters but is not required to have rank one.

**Proposed declaration:** `TauCeti.Overconvergent.finite_analytic_coefficients`.

**Hypotheses.**

- M is a reductive p-adic group with the analytic charts supplied by LocallyAnalyticDistributions:L0.
- A is a complete uniform affinoid Q_p-algebra; analytic extension to H_n is specified, not inferred from continuity.

**Direct inputs.**

- `mathlib:Representation`
- `LocallyAnalyticDistributions:L0/multivariable-fixed-radius`
- `LocallyAnalyticDistributions:L0/analytic-chart-pullback`
- `LocallyAnalyticDistributions:L4/affinoid-analytic-stage`
- `LocallyAnalyticDistributions:L4/analytic-completed-tensor`
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

**ID:** `OverconvergentAutomorphicForms:O0/analytic-induced-coefficients`. **Kind:** construction. **Planet:** Locally analytic induction.

**Statement.** For an n-analytic torus character κ_A and a chosen closed subgroup M_1 with Iwahori decomposition, define Vκ^{n-an} as analytic functions f on the actual adic neighbourhood M_1 M_n with f(mb)=(w0,M κ_A)(b⁻¹)f(m), for b in the upper Borel neighbourhood. Left action is (h·f)(m)=f(h⁻¹m). The locally analytic induction is colim_n Vκ^{n-an} with its LB topology; the continuous strong dual is the distribution coefficient module. At fixed n the strong dual (Vκ^{n-an})∨ need not be projective over A: BP instead defines projective Dκ^{n-an} as the compact-open continuous dual of bounded analytic functions on the open polydisc M_1 M_n°; Dκ^{lan}=lim_n Dκ^{n-an} is the dual of the locally analytic induction.

**Proposed declaration:** `TauCeti.Overconvergent.analytic_induced_coefficients`.

**Hypotheses.**

- Use BP §6.2’s Levi, Borel, longest Weyl element and actual analytic subgroup conventions. M_1 is closed with M_1=N̄_1 T_1 N_1, T_1=T(Z_p), and T^{M,−} normalizes N̄_1. M_1 is not required open or Zariski dense. κ_A is a character of w0,M⁻¹T(Z_p)w0,M, n-analytic after the Weyl conjugation.
- Functions are analytic on the adic thickening M_1 M_n, not merely set functions on M_1. A is uniform finite-type Tate over the coefficient field.

**Direct inputs.**

- `LocallyAnalyticDistributions:L0/multivariable-fixed-radius`
- `LocallyAnalyticDistributions:L0/analytic-chart-pullback`
- `LocallyAnalyticDistributions:L4/affinoid-analytic-stage`
- `LocallyAnalyticDistributions:L4/analytic-completed-tensor`
- `OverconvergentAutomorphicForms:O0/bounded-weight-families`
- `AdicSpacesPartII:R0/completed-tensor-banach-module`
- `LocallyAnalyticDistributions:L0/radius-restriction-compact`
- `LocallyAnalyticDistributions:L0/compact-type-dual-reflexivity`

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
- `AutomorphicBundles:B0/sections-equivariant`
- `AutomorphicBundles:B2/levi-highest-weight-convention`

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

- `CompletedCohomologyPartII:CC.1/fixed-exponent-smooth-colimit`
- `CompletedCohomologyPartII:CC.1/full-local-group-smooth-action`
- `CompletedCohomologyPartII:CC.1/tame-hecke-on-colimits`
- `CompletedCohomologyPartII:CC.2/coefficient-limit-completion`
- `OverconvergentAutomorphicForms:O0/finite-analytic-coefficients`
- `CompletedCohomologyPartII:CC.2/adic-topology-and-continuous-actions`
- `CompletedCohomologyPartII:CC.2/rational-unitary-banach-tower`

**Proof outline.**

1. Build the tower from the generic machinery of CompletedCohomologyPartII Layers 1–2 (fixed-exponent colimits §1.1, the local-group action §1.2, tame Hecke §1.3, the coefficient limit §2.1, adic topology §2.6, unitary Banach completion §2.10). Its definite-unitary adapter §8.5 treats only the definite outer form of GL_3 with all p-places varying, so the general-n, single varying place ℘ version with fixed lattices W_{ξ,τ} at the other p-places is constructed here.
2. For U^℘ sufficiently small, G(F⁺)\G(A_f)/U^℘H is finite and G(F⁺) acts with trivial stabilizers on G(A_f)/U^℘ (the arithmetic groups of a definite unitary group are finite and are killed by small level). Hence, as an H-representation, the colimit over U_℘⊂H is a finite direct sum of smooth functions H→W_{ξ,τ}/ϖ^k, one for each double coset, and the completed limit is ⊕C(H,W_{ξ,τ}); after ⊗E, Π|H≅C(H,E)^s with s=(number of double cosets)·rank W_{ξ,τ}≥1. Admissibility follows, and the tame Hecke action commutes with GL_n(K) by §1.3.

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
- `LocallyAnalyticRepresentationsOfLocalGroups:LR.2/admissible-banach-analytic-vectors`
- `LocallyAnalyticRepresentationsOfLocalGroups:LR.6/character-variety`
- `LocallyAnalyticRepresentationsOfLocalGroups:LR.6/jacquet-emerton-functor`
- `LocallyAnalyticRepresentationsOfLocalGroups:LR.6/jacquet-emerton-properties`
- `LocallyAnalyticRepresentationsOfLocalGroups:LR.6`

**Proof outline.**

1. Use LR.2/LR.6 for analytic vectors, the full character variety and coherent Jacquet dual. The additional Hecke spectral construction is the explicit LR.6 extension request, separate from the compact Up engine of PadicFamilies L2a.
2. Split T(K)=T(O_K)×Z^n after choosing uniformizers; compact character coordinates come from the LR.6 character variety of T(O_K), while unramified coordinates are G_m^n. Choice changes coordinates, not the character functor.
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
- `LocallyAnalyticRepresentationsOfLocalGroups:LR.2/admissible-banach-analytic-vectors`
- `LocallyAnalyticRepresentationsOfLocalGroups:LR.6/character-variety`
- `LocallyAnalyticRepresentationsOfLocalGroups:LR.6/jacquet-emerton-functor`
- `LocallyAnalyticRepresentationsOfLocalGroups:LR.6/jacquet-emerton-properties`
- `LocallyAnalyticRepresentationsOfLocalGroups:LR.6`

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
- `LocallyAnalyticRepresentationsOfLocalGroups:LR.2/admissible-banach-analytic-vectors`
- `LocallyAnalyticRepresentationsOfLocalGroups:LR.6/character-variety`
- `LocallyAnalyticRepresentationsOfLocalGroups:LR.6/jacquet-emerton-functor`
- `LocallyAnalyticRepresentationsOfLocalGroups:LR.6/jacquet-emerton-properties`
- `LocallyAnalyticRepresentationsOfLocalGroups:LR.6`

**Proof outline.**

1. Use the Jacquet formalism’s density of suitable classical points and the generic regularity argument cited by Ding Proposition 4.14(3).
2. Request this source-proof leaf from LocallyAnalyticRepresentationsOfLocalGroups LR.6, in its proposed coherent Jacquet eigenvariety extension. Reducedness does not follow just from equidimensionality or a Cohen–Macaulay sheaf.

**Source matches.**

- [DING-2025](https://pmihes.centre-mersenne.org/item/10.1007/s10240-025-00156-2.pdf), Proposition 4.14(3) and proof, p.67: Reducedness has a separate density argument and therefore a separate node.

**Acceptance.**

- The ring E[ε]/(ε²) is Cohen–Macaulay and equidimensional but not reduced; this rules out deriving (3) from (1)–(2) alone.

### OverconvergentAutomorphicForms:O1

Equivariant sheaves from cocycles. Right cocycle, vector equalizer sheaf, operations and analytic line effectivity.

#### Right automorphy cocycles

**ID:** `OverconvergentAutomorphicForms:O1/right-automorphy-cocycle`. **Kind:** definition. **Planet:** Automorphy cocycles.

**Statement.** Let X have a right Γ-action and C be a coefficient group. A right automorphy cocycle is J:Γ×X→C with J(1,x)=1 and J(γδ,x)=J(γ,x)J(δ,xγ). For a left representation ρ:C→Aut_A(V), equivariant functions satisfy f(xγ)=ρ(J(γ,x)⁻¹)f(x). In analytic geometry J is an analytic map on the actual cover and coefficient neighbourhood.

**Proposed declaration:** `TauCeti.Overconvergent.RightCocycle`.

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

- `TauCeti.Overconvergent.RightCocycle.apply_one` (simp): J(1,x)=1.
- `TauCeti.Overconvergent.RightCocycle.apply_mul` (relation): J(γδ,x)=J(γ,x)J(δ,xγ).
- `TauCeti.Overconvergent.RightCocycle.equivariant` (constructor): The algebraic equivariant functions form an A-submodule of X→V; analytic functions are used only with the supplied analytic carrier.
- `TauCeti.Overconvergent.RightCocycle.gauge` (constructor): For b:X→C construct J′γ(x)=b(x)⁻¹Jγ(x)b(xγ).
- `TauCeti.Overconvergent.RightCocycle.ext` (extensionality): Two right cocycles agree if their values agree for every γ and x.
- `TauCeti.Overconvergent.RightCocycle.trivial` (constructor): The constant unit map is the trivial right cocycle.
- `TauCeti.Overconvergent.RightCocycle.mem_equivariant` (characterisation): f belongs to the equivariant submodule iff ∀γ,x, f(xγ)=ρ(Jγ(x)⁻¹)f(x).
- `TauCeti.Overconvergent.RightCocycle.gauge_equivariant` (compatibility): The map f′(x)=ρ(b(x)⁻¹)f(x) sends J-equivariant functions to gauge(J,b)-equivariant functions.
- `TauCeti.Overconvergent.RightCocycle.gaugeEquiv` (equivalence): Pointwise ρ(b(x)⁻¹) defines an A-linear equivalence between the J and gauge(J,b) equivariant submodules, with inverse pointwise ρ(b(x)).
- `TauCeti.Overconvergent.RightCocycle.ofLeft` (constructor): Given compatible left/right actions x·γ=γ⁻¹x and a left cocycle K, construct the right cocycle Jγ(x)=Kγ⁻¹(x)⁻¹.
- `TauCeti.Overconvergent.RightCocycle.gaugeEquiv_apply` (simp): The forward gauge equivalence evaluates at x as ρ(b(x)⁻¹)f(x).
- `TauCeti.Overconvergent.RightCocycle.gaugeEquiv_symm_apply` (simp): The inverse gauge equivalence evaluates at x as ρ(b(x))f(x).

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

**ID:** `OverconvergentAutomorphicForms:O1/equivariant-coefficient-sheaf`. **Kind:** construction. **Planet:** Equivariant coefficient sheaves.

**Statement.** For an actual right Γ-torsor q:Y→X on the supplied analytic/v-site, an analytic cocycle J and coefficient module V on U, define E_J as the sheaf whose sections over W→X are analytic V-valued functions on Y_W×U satisfying f(yγ)=ρ(Jγ(y)⁻¹)f(y). Rational and integral versions use O and O+ respectively, with a specified stable lattice in the latter.

**Proposed declaration:** `TauCeti.Overconvergent.equivariant_coefficient_sheaf`.

**Hypotheses.**

- The cover is the supplied torsor and its descent datum, not an unspecified map.
- V is finite analytic or the supplied Banach induced coefficient module; exactness or local freeness is not assumed for arbitrary infinite-rank coefficients.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O1/right-automorphy-cocycle`
- `OverconvergentAutomorphicForms:O0/finite-analytic-coefficients`
- `OverconvergentAutomorphicForms:O0/analytic-induced-coefficients`
- `mathlib:SheafOfModules`
- `AutomorphicBundles:B0/sections-equivariant`
- `PerfectoidSpaces:P9/weight-extension-sheaf-equalizer`
- `PerfectoidSpaces:P9/function-descent-along-tower`
- `AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product`
- `AdicSpacesPartII:R5/completed-coefficient-sheaf`
- `AdicSpacesPartII:R5/coefficient-sheaf-local-equalizer`
- `PerfectoidSpaces:P9/integral-matrix-coboundary-effectivity`

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
- `PerfectoidSpaces:P9/weight-extension-sheaf-equalizer`
- `PerfectoidSpaces:P9/function-descent-along-tower`
- `PerfectoidSpaces:P9/descent-of-finite-locally-free-modules`
- `PerfectoidSpaces:P9/integral-matrix-coboundary-effectivity`

**Proof outline.**

1. Check each map on the torsor by the cocycle identity and the representation tensor/dual laws.
2. Use uniqueness of effective descent to compare the resulting maps and prove identities/composition.
3. Use AutomorphicBundles B0 ineffective-fibre criterion only for the finite tame quotient to which its hypotheses apply.

**Source matches.**

- [BHW-2023](https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf), §9, Lemmas 9.3–9.7, pp.1782–1786: Comparison of the presentations retains coefficient actions and their descent data.

**Acceptance.**

- Finite-character averaging over a p-divisible group order is valid over L but need not preserve an O+ lattice.

#### Analytic effectivity of line descent

**ID:** `OverconvergentAutomorphicForms:O1/analytic-line-effectivity`. **Kind:** theorem. **Planet:** Analytic line descent.

**Statement.** For smooth rigid X over a perfectoid field extension of Q_p and a v-line L obtained by cocycle descent, analyticity on a Zariski-dense analytic open implies analyticity on X. For a topologically finite-type formal O_K-scheme 𝔛 and a pro-etale profinite formal torsor 𝔛∞→𝔛, a continuous multiplicative cocycle c:G→O(𝔛∞)× gives a v-line on the generic fibre that is the analytification of a Zariski line on 𝔛. An arbitrary analytic O+-unit cocycle is not substituted for this formal cocycle.

**Proposed declaration:** `TauCeti.Overconvergent.analytic_line_effectivity`.

**Hypotheses.**

- The first assertion is for line bundles, not arbitrary Banach or rank-r v-bundles.
- For the formal assertion the cocycle lies in units of the completed formal structural ring O(𝔛∞), reduces modulo p^m through a finite quotient, and the finite-level descended lines form a compatible effective system. The map O(𝔛∞)→O+(X∞) used by Heuer is a natural map, not an asserted general isomorphism.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O1/equivariant-coefficient-sheaf`
- `PerfectoidSpaces:P9/weight-extension-sheaf-equalizer`
- `PerfectoidSpaces:P9/function-descent-along-tower`
- `PerfectoidSpaces:P9/finite-level-character-sheaf-comparison`

**Proof outline.**

1. Import Heuer Corollary 1.4 and Proposition 3.8 through the tower-descent layer P9 of PerfectoidTowers (§§P9.6–P9.10), which states them with these hypotheses.
2. Apply the first to extend ordinary analytic trivializations of the line. For the formal assertion descend at each finite quotient modulo p^m and use formal p-adic effectivity; do not swap global sections with limits on arbitrary nonaffine bases.

**Source matches.**

- [HEUER-2022](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/E9F0B6B21BA1F345142C7301C2EDDA28/S205050942200072Xa.pdf/line-bundles-on-rigid-spaces-in-the-v-topology.pdf), Corollary 1.4, p.3; Proposition 3.8, p.16: Heuer’s formal cocycle lies in O(𝔛∞)× and its proof uses a natural map to analytic O+. The dense-open criterion is for v-lines on a smooth rigid space over a perfectoid extension of Q_p.

**Acceptance.**

- An arbitrary v-vector bundle is not declared analytic by this line-bundle criterion.

### OverconvergentAutomorphicForms:O2

Hilbert automorphy factors and domains. Admitted domain, cz+d factor/law, geometric line, level/radius maps and algebraic specialisation.

#### Admitted Hilbert coefficient domains

**ID:** `OverconvergentAutomorphicForms:O2/admitted-hilbert-domain`. **Kind:** construction. **Planet:** Hilbert coefficient domains.

**Statement.** Choose the anticanonical Hilbert domain X_{Γ0*(p^n)}(ε)_a, n≥1 or ∞, and its infinite-level cover with T4’s Hodge–Tate coordinate z. The chosen bounded analytic weight extension and m,ε satisfy DOM; at finite level AL_n maps the level-domain of radius p^n ε to X(ε). At n=0 define on X(ε) by AL_1 from X_{Γ0*(p)}(pε)_a. This domain is the input for coefficients, rather than a definition of the Hilbert tower itself.

**Proposed declaration:** `TauCeti.Overconvergent.admitted_hilbert_domain`.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the geometric Hilbert moduli schemes; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. Arithmetic finite-level torsors are taken over the quotient stacks, or on coarse spaces over the respective action-free loci supplied by H3.6, H4.17 and S5.8; N≥4 alone does not assert freeness of a polarization or diagonal action.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε<1/(c_p p^m) for p≥3 and 0≤ε≤1/(4·2^m) for p=2 (HodgeTateAndCanonicalSubgroups §4.6; the endpoint is excluded for p≥3); when m=1 at a prime ramified in F also ε≤p^(−3) (§§3.10, 5.1). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- At a prime ramified in F use the unsplit 𝒪_F/p^n-linear canonical generator of HodgeTateAndCanonicalSubgroups §3.12, available for n≥2, for p unramified, or for H=H′[p^n] (at level one this uses the level-two subgroup and ε≤p^(−3), §3.10), and its comparison with the saturated Hodge–Tate kernel in §4.7, with scalar conormal-degree estimates before passage to a splitting field. The period-map inclusions of §4.6 are strict at the endpoint for p≥3 and inclusive for p=2; no integral embedding-wise product decomposition of 𝒪_p⊗O_C is used.

**Direct inputs.**

- `HodgeTateAndCanonicalSubgroups:T4/canonical-anticanonical-loci`
- `HodgeTateAndCanonicalSubgroups:T4/atkin-lehner-anticanonical`
- `HodgeTateAndCanonicalSubgroups:T4/hodge-tate-coordinate`
- `HodgeTateAndCanonicalSubgroups:T4/period-map-inclusions`
- `OverconvergentAutomorphicForms:O0/analytic-continuation-of-bounded-weights`
- `OverconvergentAutomorphicForms:O0/bounded-weight-families`
- `AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product`
- `HodgeTateAndCanonicalSubgroups:T3/hilbert-canonical-subgroup`

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
- `TauCeti.Overconvergent.Test.O2_admitted_hilbert_domain_radius` (non-example): For p=3 and m=1 the sufficient bound is ε<1/9; both ε=1/9 and ε=1/3 fail the selected admission inequality even for the trivial continuous character.

**Acceptance.**

- AL_n:X_{Γ0*(p^n)}(p^nε)_a≅X(ε) scales the source radius; at level zero AL_1 uses source pε and target ε.
- At p=3,m=1 the sufficient bound is ε<1/9; both ε=1/9 and ε=1/3 are outside this admitted range.
- ε=0 is the ordinary domain, whereas overconvergent forms use the positive admitted radii.

#### Hilbert automorphy factors

**ID:** `OverconvergentAutomorphicForms:O2/hilbert-automorphy-factor`. **Kind:** construction. **Planet:** Hilbert automorphy factor.

**Statement.** For γ=(a b;c d)∈Γ0(p), set jγ(z)=cz+d in O_p⊗O(X∞×U); T4’s coordinate transformation makes jγ a unit in the chosen analytic neighbourhood. The scalar coefficient factor is κ(jγ(z))⁻¹. For finite/vector analytic Levi coefficients use the supplied Levi-valued torsor cocycle, not a determinant character in place of the representation. The source level action is left; write f(γx)=κ(jγ(x))⁻¹f(x). For a right-action interface use x·γ=γ⁻¹x and the factor jγ⁻¹(x) as in hilbert-cocycle-law.

**Proposed declaration:** `TauCeti.Overconvergent.hilbert_automorphy_factor`.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the geometric Hilbert moduli schemes; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. Arithmetic finite-level torsors are taken over the quotient stacks, or on coarse spaces over the respective action-free loci supplied by H3.6, H4.17 and S5.8; N≥4 alone does not assert freeness of a polarization or diagonal action.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε<1/(c_p p^m) for p≥3 and 0≤ε≤1/(4·2^m) for p=2 (HodgeTateAndCanonicalSubgroups §4.6; the endpoint is excluded for p≥3); when m=1 at a prime ramified in F also ε≤p^(−3) (§§3.10, 5.1). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- Use T4’s left fractional-linear coordinate convention. For a right action explicitly convert x·γ=γ⁻¹x and invert the coefficient cocycle as in O1.
- At a prime ramified in F use the unsplit 𝒪_F/p^n-linear canonical generator of HodgeTateAndCanonicalSubgroups §3.12, available for n≥2, for p unramified, or for H=H′[p^n] (at level one this uses the level-two subgroup and ε≤p^(−3), §3.10), and its comparison with the saturated Hodge–Tate kernel in §4.7, with scalar conormal-degree estimates before passage to a splitting field. The period-map inclusions of §4.6 are strict at the endpoint for p≥3 and inclusive for p=2; no integral embedding-wise product decomposition of 𝒪_p⊗O_C is used.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O2/admitted-hilbert-domain`
- `OverconvergentAutomorphicForms:O0/analytic-continuation-of-bounded-weights`
- `HodgeTateAndCanonicalSubgroups:T4/canonical-anticanonical-loci`
- `HodgeTateAndCanonicalSubgroups:T4/atkin-lehner-anticanonical`
- `HodgeTateAndCanonicalSubgroups:T4/hodge-tate-coordinate`
- `HodgeTateAndCanonicalSubgroups:T4/period-map-inclusions`
- `HodgeTateAndCanonicalSubgroups:T5/igusa-torsor`
- `HodgeTateAndCanonicalSubgroups:T5/integral-differential-lattice`
- `HodgeTateAndCanonicalSubgroups:T5/integral-lattice-properties`
- `HodgeTateAndCanonicalSubgroups:T5/aip-torsor`
- `HodgeTateAndCanonicalSubgroups:T5/hodge-tate-aip-lift`
- `OverconvergentAutomorphicForms:O0/finite-analytic-coefficients`
- `AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product`
- `HodgeTateAndCanonicalSubgroups:T3/hilbert-canonical-subgroup`

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
- Tame level N is prime to p and sufficiently small for the geometric Hilbert moduli schemes; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. Arithmetic finite-level torsors are taken over the quotient stacks, or on coarse spaces over the respective action-free loci supplied by H3.6, H4.17 and S5.8; N≥4 alone does not assert freeness of a polarization or diagonal action.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε<1/(c_p p^m) for p≥3 and 0≤ε≤1/(4·2^m) for p=2 (HodgeTateAndCanonicalSubgroups §4.6; the endpoint is excluded for p≥3); when m=1 at a prime ramified in F also ε≤p^(−3) (§§3.10, 5.1). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O2/hilbert-automorphy-factor`
- `OverconvergentAutomorphicForms:O1/right-automorphy-cocycle`
- `HodgeTateAndCanonicalSubgroups:T4/canonical-anticanonical-loci`
- `HodgeTateAndCanonicalSubgroups:T4/atkin-lehner-anticanonical`
- `HodgeTateAndCanonicalSubgroups:T4/hodge-tate-coordinate`
- `HodgeTateAndCanonicalSubgroups:T4/period-map-inclusions`

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

**ID:** `OverconvergentAutomorphicForms:O2/geometric-hilbert-sheaf`. **Kind:** construction. **Planet:** Geometric Hilbert coefficient sheaf.

**Statement.** Define ω_n^κ on X_{Γ0*(p^n)}(ε)_a×U as the actual Γ0*(p^n)-equivariant coefficient functions on X_{Γ*(p∞)}(ε)_a×U with scalar factor κ(cz+d)⁻¹. For n=∞ use the corresponding kernel subgroup of the projection. For n=0 transport through AL_1. This is an analytic invertible sheaf, not an alias for AIP’s independent sheaf.

**Proposed declaration:** `TauCeti.Overconvergent.geometric_hilbert_sheaf`.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the geometric Hilbert moduli schemes; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. Arithmetic finite-level torsors are taken over the quotient stacks, or on coarse spaces over the respective action-free loci supplied by H3.6, H4.17 and S5.8; N≥4 alone does not assert freeness of a polarization or diagonal action.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε<1/(c_p p^m) for p≥3 and 0≤ε≤1/(4·2^m) for p=2 (HodgeTateAndCanonicalSubgroups §4.6; the endpoint is excluded for p≥3); when m=1 at a prime ramified in F also ε≤p^(−3) (§§3.10, 5.1). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O1/equivariant-coefficient-sheaf`
- `OverconvergentAutomorphicForms:O1/analytic-line-effectivity`
- `OverconvergentAutomorphicForms:O2/hilbert-cocycle-law`
- `OverconvergentAutomorphicForms:O2/admitted-hilbert-domain`
- `PerfectoidSpaces:P9/weight-extension-sheaf-equalizer`
- `PerfectoidSpaces:P9/function-descent-along-tower`
- `AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product`

**Proof outline.**

1. Use the actual left tower action and multiplier f(γx)=κ(jγ(x))⁻¹f(x); convert to O1’s right equalizer with x·γ=γ⁻¹x and Jγ=jγ⁻¹. No unconverted right cz+d identity is used.
2. On the ordinary locus use the supplied Igusa formal trivialization and analytic-line-effectivity.
3. At finite n, use O1's dense-open analytic-line criterion on the smooth rigid domain, with the actual P9 descent hypotheses. For n=∞, pull back a finite-level rational coefficient line along the level projection and use the sheafwise tower equalizer to identify that pullback with the kernel-equivariant functions. Do not apply a theorem for smooth rigid bases directly to the infinite perfectoid base. Transport n=0 through AL_1.

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
- Tame level N is prime to p and sufficiently small for the geometric Hilbert moduli schemes; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. Arithmetic finite-level torsors are taken over the quotient stacks, or on coarse spaces over the respective action-free loci supplied by H3.6, H4.17 and S5.8; N≥4 alone does not assert freeness of a polarization or diagonal action.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε<1/(c_p p^m) for p≥3 and 0≤ε≤1/(4·2^m) for p=2 (HodgeTateAndCanonicalSubgroups §4.6; the endpoint is excluded for p≥3); when m=1 at a prime ramified in F also ε≤p^(−3) (§§3.10, 5.1). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- Maps of weight families pull back the specified character and its analytic extension. Claims about sheaves do not assert arbitrary nonflat base change of global sections.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O2/geometric-hilbert-sheaf`
- `OverconvergentAutomorphicForms:O1/coefficient-descent-functoriality`
- `HodgeTateAndCanonicalSubgroups:T4/canonical-anticanonical-loci`
- `HodgeTateAndCanonicalSubgroups:T4/atkin-lehner-anticanonical`
- `HodgeTateAndCanonicalSubgroups:T4/hodge-tate-coordinate`
- `HodgeTateAndCanonicalSubgroups:T4/period-map-inclusions`

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
- Tame level N is prime to p and sufficiently small for the geometric Hilbert moduli schemes; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. Arithmetic finite-level torsors are taken over the quotient stacks, or on coarse spaces over the respective action-free loci supplied by H3.6, H4.17 and S5.8; N≥4 alone does not assert freeness of a polarization or diagonal action.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε<1/(c_p p^m) for p≥3 and 0≤ε≤1/(4·2^m) for p=2 (HodgeTateAndCanonicalSubgroups §4.6; the endpoint is excluded for p≥3); when m=1 at a prime ramified in F also ε≤p^(−3) (§§3.10, 5.1). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- The embeddings and classical differential eigenlines are defined over L; integer exponents may be negative since the factors are lines.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O2/geometric-hilbert-sheaf`
- `AutomorphicBundles:B0/sections-equivariant`
- `AutomorphicBundles:B2/levi-highest-weight-convention`
- `HodgeTateAndCanonicalSubgroups:T5/igusa-torsor`
- `HodgeTateAndCanonicalSubgroups:T5/integral-differential-lattice`
- `HodgeTateAndCanonicalSubgroups:T5/integral-lattice-properties`
- `HodgeTateAndCanonicalSubgroups:T5/aip-torsor`
- `HodgeTateAndCanonicalSubgroups:T5/hodge-tate-aip-lift`
- `AutomorphicBundles:B4/hilbert-coefficient`

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

Integral coefficients and variation in weight. Integral lattice, conditional integral base change, rationalisation, fixed/colimit forms and ramified modification.

#### Integral Hilbert coefficient lattices

**ID:** `OverconvergentAutomorphicForms:O3/integral-hilbert-sheaf`. **Kind:** construction. **Planet:** Integral Hilbert coefficients.

**Statement.** Define ω_n^{κ,+} as the O+ equivariance equalizer on the actual infinite-level cover, for the same left level action and multiplier κ(jγ(x))⁻¹ as ω_n^κ. The admitted factors have integral unit values. This specifies a subsheaf of rational coefficients. O5/geometric-aip-comparison identifies the two independently defined integral equalizers; positive-radius full-character local freeness additionally requires the separate O5/aip-line-and-gluing unit-trivialization input.

**Proposed declaration:** `TauCeti.Overconvergent.integral_hilbert_sheaf`.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the geometric Hilbert moduli schemes; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. Arithmetic finite-level torsors are taken over the quotient stacks, or on coarse spaces over the respective action-free loci supplied by H3.6, H4.17 and S5.8; N≥4 alone does not assert freeness of a polarization or diagonal action.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε<1/(c_p p^m) for p≥3 and 0≤ε≤1/(4·2^m) for p=2 (HodgeTateAndCanonicalSubgroups §4.6; the endpoint is excluded for p≥3); when m=1 at a prime ramified in F also ε≤p^(−3) (§§3.10, 5.1). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- The coefficient chart is equipped with A+ and the character extension has integral unit values. Integral local invertibility requires the independent AIP unit-trivialization input and the comparison; characteristic-zero averaging does not supply it.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O2/geometric-hilbert-sheaf`
- `PerfectoidSpaces:P9/weight-extension-sheaf-equalizer`
- `PerfectoidSpaces:P9/function-descent-along-tower`
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
- Tame level N is prime to p and sufficiently small for the geometric Hilbert moduli schemes; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. Arithmetic finite-level torsors are taken over the quotient stacks, or on coarse spaces over the respective action-free loci supplied by H3.6, H4.17 and S5.8; N≥4 alone does not assert freeness of a polarization or diagonal action.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε<1/(c_p p^m) for p≥3 and 0≤ε≤1/(4·2^m) for p=2 (HodgeTateAndCanonicalSubgroups §4.6; the endpoint is excluded for p≥3); when m=1 at a prime ramified in F also ε≤p^(−3) (§§3.10, 5.1). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- Work locally on quasicompact base and weight patches whose inverse images in the profinite level torsor are quasicompact. P9 supplies O+[1/p]=O on these inverse images, and the equivariance multipliers and their inverses are integral units. A global sections statement additionally requires a finite such cover with bounded denominators.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O3/integral-hilbert-sheaf`
- `PerfectoidSpaces:P9/weight-extension-sheaf-equalizer`
- `PerfectoidSpaces:P9/function-descent-along-tower`

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
- Tame level N is prime to p and sufficiently small for the geometric Hilbert moduli schemes; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. Arithmetic finite-level torsors are taken over the quotient stacks, or on coarse spaces over the respective action-free loci supplied by H3.6, H4.17 and S5.8; N≥4 alone does not assert freeness of a polarization or diagonal action.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε<1/(c_p p^m) for p≥3 and 0≤ε≤1/(4·2^m) for p=2 (HodgeTateAndCanonicalSubgroups §4.6; the endpoint is excluded for p≥3); when m=1 at a prime ramified in F also ε≤p^(−3) (§§3.10, 5.1). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- Maps of weight families pull back the specified character and its analytic extension. Claims about sheaves do not assert arbitrary nonflat base change of global sections.
- Integral pullback is claimed only for flat formal coefficient changes satisfying P9’s completed-descent hypotheses, or for the explicitly proved AIP chart refinement maps. Arbitrary integral weight specialisation is excluded (AIP CUSP Remark 3.15).

**Direct inputs.**

- `OverconvergentAutomorphicForms:O3/integral-hilbert-sheaf`
- `OverconvergentAutomorphicForms:O1/coefficient-descent-functoriality`
- `OverconvergentAutomorphicForms:O2/hilbert-level-radius-maps`
- `PerfectoidSpaces:P9/weight-extension-sheaf-equalizer`
- `PerfectoidSpaces:P9/function-descent-along-tower`

**Proof outline.**

1. On the tower, pullback of the character is exactly the new automorphy factor.
2. Use finite locally free coefficient descent and its base-change law rather than commuting arbitrary invariants with a nonflat tensor product.
3. For O+ use the all-open integral sheaf equalizer after coefficient base change (PerfectoidTowers §P9.11) on compatible integral charts, with the flat/chart conditions retained.

**Source matches.**

- [BHW-2023](https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf), §6.1–6.2, Definitions 6.2 and 6.5, pp.1756–1758: The sheaves are defined on X×U with a universal family factor; pullback is coefficient-compatible.
- [AIP-CUSP-2016](https://www.imo.universite-paris-saclay.fr/~pilloni/AIP2.pdf), Remark 3.15, p.17: Integral base change can fail because finite group cohomology obstructs invariants.

**Acceptance.**

- Specialising a family to a point recovers its character sheaf.
- This theorem does not imply arbitrary base change for all fixed-radius global sections.

#### Fixed-radius Hilbert forms

**ID:** `OverconvergentAutomorphicForms:O3/fixed-radius-hilbert-forms`. **Kind:** construction. **Planet:** Fixed-radius Hilbert forms.

**Statement.** Mκ^{G*,c}(n,N,ε;U)=H^0(X_{c,U,Γ0*(p^n),μN}(ε)_a,ω_n^κ); define Mκ^{G*,c,+} using ω_n^{κ,+}. Restriction maps go from a larger admitted neighbourhood to a smaller one. Banach and projectivity claims require the finite-level affinoid weight and cusp hypotheses in O6.

**Proposed declaration:** `TauCeti.Overconvergent.fixed_radius_hilbert_forms`.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the geometric Hilbert moduli schemes; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. Arithmetic finite-level torsors are taken over the quotient stacks, or on coarse spaces over the respective action-free loci supplied by H3.6, H4.17 and S5.8; N≥4 alone does not assert freeness of a polarization or diagonal action.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε<1/(c_p p^m) for p≥3 and 0≤ε≤1/(4·2^m) for p=2 (HodgeTateAndCanonicalSubgroups §4.6; the endpoint is excluded for p≥3); when m=1 at a prime ramified in F also ε≤p^(−3) (§§3.10, 5.1). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- Fix a positive prime-to-p polarisation ideal c. Both ε=0 and ε>0 have meanings, but they are different domains.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O2/geometric-hilbert-sheaf`
- `OverconvergentAutomorphicForms:O3/integral-hilbert-sheaf`
- `OverconvergentAutomorphicForms:O2/hilbert-level-radius-maps`
- `HilbertModularVarietiesAndShimuraCurves:H3/arithmetic-quotient`
- `HilbertModularVarietiesAndShimuraCurves:H3/ideal-class-comparisons`
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

**ID:** `OverconvergentAutomorphicForms:O3/overconvergent-hilbert-forms`. **Kind:** construction. **Planet:** Overconvergent Hilbert forms.

**Statement.** Mκ^{G*,c,†}=colim_{ε>0 admitted}Mκ^{G*,c}(n,N,ε;U) along restrictions toward the ordinary locus. Its integral counterpart is the same filtered colimit of the specified lattices. The locally convex direct-limit topology is used when asserting continuity; no equality with all ordinary-locus sections is built into the definition.

**Proposed declaration:** `TauCeti.Overconvergent.overconvergent_hilbert_forms`.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the geometric Hilbert moduli schemes; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. Arithmetic finite-level torsors are taken over the quotient stacks, or on coarse spaces over the respective action-free loci supplied by H3.6, H4.17 and S5.8; N≥4 alone does not assert freeness of a polarization or diagonal action.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε<1/(c_p p^m) for p≥3 and 0≤ε≤1/(4·2^m) for p=2 (HodgeTateAndCanonicalSubgroups §4.6; the endpoint is excluded for p≥3); when m=1 at a prime ramified in F also ε≤p^(−3) (§§3.10, 5.1). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- At a bounded family choose the positive cofinal system admitted for that family; compare choices via a common cofinal subsystem.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O3/fixed-radius-hilbert-forms`
- `LocallyAnalyticDistributions:L4/projective-banach-modules`
- `LocallyAnalyticDistributions:L0/multivariable-fixed-radius`
- `LocallyAnalyticDistributions:L0/analytic-chart-pullback`
- `LocallyAnalyticDistributions:L4/affinoid-analytic-stage`
- `LocallyAnalyticDistributions:L4/analytic-completed-tensor`
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
- Tame level N is prime to p and sufficiently small for the geometric Hilbert moduli schemes; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. Arithmetic finite-level torsors are taken over the quotient stacks, or on coarse spaces over the respective action-free loci supplied by H3.6, H4.17 and S5.8; N≥4 alone does not assert freeness of a polarization or diagonal action.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε<1/(c_p p^m) for p≥3 and 0≤ε≤1/(4·2^m) for p=2 (HodgeTateAndCanonicalSubgroups §4.6; the endpoint is excluded for p≥3); when m=1 at a prime ramified in F also ε≤p^(−3) (§§3.10, 5.1). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- Use T5’s exact canonical-subgroup range and modified differential theorem; the Rapoport condition is not imposed globally.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O3/integral-hilbert-sheaf`
- `HodgeTateAndCanonicalSubgroups:T5/igusa-torsor`
- `HodgeTateAndCanonicalSubgroups:T5/integral-differential-lattice`
- `HodgeTateAndCanonicalSubgroups:T5/integral-lattice-properties`
- `HodgeTateAndCanonicalSubgroups:T5/aip-torsor`
- `HodgeTateAndCanonicalSubgroups:T5/hodge-tate-aip-lift`

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

Arithmetic descent and polarization classes. Four independent presentations, quotient relations, finite twisted descent, pairing comparison and polarisation-class independence.

#### Geometric small-cover coefficients

**ID:** `OverconvergentAutomorphicForms:O4/presentation-geometric-small`. **Kind:** construction. **Planet:** Geometric small-cover coefficients.

**Statement.** Define presentation (1) independently as the O+ equivariance equalizer on the actual cover X_{U,Γ*(p∞)}(ε)_a×U, with acting group Γ0*(p^n) and section transformation multiplier κ(cz+d)⁻¹; rational coefficients replace O+ by O. Push forward to the finite-level base. None of the four definitions is an abbreviation for another.

**Proposed declaration:** `TauCeti.Overconvergent.presentation_geometric_small`.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the geometric Hilbert moduli schemes; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. Arithmetic finite-level torsors are taken over the quotient stacks, or on coarse spaces over the respective action-free loci supplied by H3.6, H4.17 and S5.8; N≥4 alone does not assert freeness of a polarization or diagonal action.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε<1/(c_p p^m) for p≥3 and 0≤ε≤1/(4·2^m) for p=2 (HodgeTateAndCanonicalSubgroups §4.6; the endpoint is excluded for p≥3); when m=1 at a prime ramified in F also ε≤p^(−3) (§§3.10, 5.1). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- An arithmetic family is κ_ar=(w,t), with geometric κ=ρ(w,t). n≥1 or ∞; level zero is transported separately by AL_1.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O1/equivariant-coefficient-sheaf`
- `OverconvergentAutomorphicForms:O2/hilbert-automorphy-factor`
- `HilbertModularVarietiesAndShimuraCurves:H4/effective-level-groups`
- `HilbertModularVarietiesAndShimuraCurves:H4/finite-level-torsors`
- `PerfectoidShimuraVarieties:S5/hilbert-three-towers`
- `PerfectoidShimuraVarieties:S5/hilbert-level-torsors`
- `PerfectoidShimuraVarieties:S5/hilbert-period-and-domain-compatibility`
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
- Tame level N is prime to p and sufficiently small for the geometric Hilbert moduli schemes; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. Arithmetic finite-level torsors are taken over the quotient stacks, or on coarse spaces over the respective action-free loci supplied by H3.6, H4.17 and S5.8; N≥4 alone does not assert freeness of a polarization or diagonal action.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε<1/(c_p p^m) for p≥3 and 0≤ε≤1/(4·2^m) for p=2 (HodgeTateAndCanonicalSubgroups §4.6; the endpoint is excluded for p≥3); when m=1 at a prime ramified in F also ε≤p^(−3) (§§3.10, 5.1). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- An arithmetic family is κ_ar=(w,t), with geometric κ=ρ(w,t). n≥1 or ∞; level zero is transported separately by AL_1.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O1/equivariant-coefficient-sheaf`
- `OverconvergentAutomorphicForms:O2/hilbert-automorphy-factor`
- `HilbertModularVarietiesAndShimuraCurves:H4/effective-level-groups`
- `HilbertModularVarietiesAndShimuraCurves:H4/finite-level-torsors`
- `PerfectoidShimuraVarieties:S5/hilbert-three-towers`
- `PerfectoidShimuraVarieties:S5/hilbert-level-torsors`
- `PerfectoidShimuraVarieties:S5/hilbert-period-and-domain-compatibility`
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

**ID:** `OverconvergentAutomorphicForms:O4/presentation-arithmetic-intermediate`. **Kind:** construction. **Planet:** Arithmetic intermediate-cover coefficients.

**Statement.** Define presentation (3) independently as the O+ equivariance equalizer on the actual cover X_{U,Γ(p∞)}(ε)_a×U, with acting group E(p^n) and section transformation multiplier κ(cz+d)⁻¹w(x̄) for a representative (γ,x); rational coefficients replace O+ by O. Push forward to the finite-level base. None of the four definitions is an abbreviation for another. The effective deck group and its continuous action are those of O4/effective-arithmetic-descent, with the closure of all units congruent to 1 modulo N.

**Proposed declaration:** `TauCeti.Overconvergent.presentation_arithmetic_intermediate`.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the geometric Hilbert moduli schemes; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. Arithmetic finite-level torsors are taken over the quotient stacks, or on coarse spaces over the respective action-free loci supplied by H3.6, H4.17 and S5.8; N≥4 alone does not assert freeness of a polarization or diagonal action.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε<1/(c_p p^m) for p≥3 and 0≤ε≤1/(4·2^m) for p=2 (HodgeTateAndCanonicalSubgroups §4.6; the endpoint is excluded for p≥3); when m=1 at a prime ramified in F also ε≤p^(−3) (§§3.10, 5.1). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- An arithmetic family is κ_ar=(w,t), with geometric κ=ρ(w,t). n≥1 or ∞; level zero is transported separately by AL_1.
- N≥4 and p∤N; x is in Δ(p∞N) and x̄ denotes its supplied image in O_p×.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O1/equivariant-coefficient-sheaf`
- `OverconvergentAutomorphicForms:O2/hilbert-automorphy-factor`
- `HilbertModularVarietiesAndShimuraCurves:H4/effective-level-groups`
- `HilbertModularVarietiesAndShimuraCurves:H4/finite-level-torsors`
- `PerfectoidShimuraVarieties:S5/hilbert-three-towers`
- `PerfectoidShimuraVarieties:S5/hilbert-level-torsors`
- `PerfectoidShimuraVarieties:S5/hilbert-period-and-domain-compatibility`
- `OverconvergentAutomorphicForms:O0/weight-comparison-totally-positive-units`
- `OverconvergentAutomorphicForms:O4/arithmetic-representatives`
- `AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product`
- `OverconvergentAutomorphicForms:O4/effective-arithmetic-descent`

**Proof outline.**

1. Import the stated cover, group action and quotient from H4/S5. Use the same pulled-back Hodge–Tate coordinate on that cover.
2. Form O1’s equivariant-function equalizer. For quotient groups the next representative-independence theorem is needed before the action is well-defined.
3. Retain the separate cover and action as construction data; comparisons are subsequent maps, not definitional equalities.

**Source matches.**

- [BHW-2023](https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf), Definition 9.1(3), pp.1780–1781: The E(p^n)-action on X_{U,Γ(p∞)} gives this distinct presentation and its precise coefficient multiplier.

**Uses.**

- Lemmas 9.2–9.7 and Theorem 9.12: Presentation (3) participates in explicit integral and rational comparison maps.

**API.**

- `TauCeti.Overconvergent.presentation_arithmetic_intermediate.sections` (characterisation): Sections satisfy exactly the E(p^n)-equivariance condition with multiplier κ(cz+d)⁻¹w(x̄) for a representative (γ,x).
- `TauCeti.Overconvergent.presentation_arithmetic_intermediate.integralInclusion` (coercion): The O+ equalizer embeds in its O version.
- `TauCeti.Overconvergent.presentation_arithmetic_intermediate.pullback` (functoriality): Compatible level, radius and weight pullback retains this cover and coefficient action.

**Unit tests.**

- `TauCeti.Overconvergent.Test.O4_presentation_arithmetic_intermediate_trivial` (degenerate): When w=t=1, the presentation is the structural sheaf on its own quotient base.
- `TauCeti.Overconvergent.Test.O4_presentation_arithmetic_intermediate_factor` (computation): The section multiplier on a group element is κ(cz+d)⁻¹w(x̄) for a representative (γ,x), including its sign and determinant/polarisation component.
- `TauCeti.Overconvergent.Test.O4_presentation_arithmetic_intermediate_cover` (compatibility): For every η∈U_N, and then every z∈Z∞ by continuity, the central representative change leaves the section multiplier unchanged.

**Acceptance.**

- Define presentation (3) independently as the O+ equivariance equalizer on the actual cover X_{U,Γ(p∞)}(ε)_a×U, with acting group E(p^n) and section transformation multiplier κ(cz+d)⁻¹w(x) for a representative (γ,x); rational coefficients replace O+ by O. Push forward to the finite-level base. None of the four definitions is an abbreviation for another.

#### Arithmetic full-cover coefficients

**ID:** `OverconvergentAutomorphicForms:O4/presentation-arithmetic-full`. **Kind:** construction. **Planet:** Arithmetic full-cover coefficients.

**Statement.** Define presentation (4) independently as the O+ equivariance equalizer on the actual cover X_{G,U,Γ(p∞)}(ε)_a×U, with acting group PΓ0(p^n) and section transformation multiplier κ(cz+d)⁻¹w(det γ); rational coefficients replace O+ by O. Push forward to the finite-level base. None of the four definitions is an abbreviation for another. The effective deck group and its continuous action are those of O4/effective-arithmetic-descent, with the closure of all units congruent to 1 modulo N.

**Proposed declaration:** `TauCeti.Overconvergent.presentation_arithmetic_full`.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the geometric Hilbert moduli schemes; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. Arithmetic finite-level torsors are taken over the quotient stacks, or on coarse spaces over the respective action-free loci supplied by H3.6, H4.17 and S5.8; N≥4 alone does not assert freeness of a polarization or diagonal action.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε<1/(c_p p^m) for p≥3 and 0≤ε≤1/(4·2^m) for p=2 (HodgeTateAndCanonicalSubgroups §4.6; the endpoint is excluded for p≥3); when m=1 at a prime ramified in F also ε≤p^(−3) (§§3.10, 5.1). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- An arithmetic family is κ_ar=(w,t), with geometric κ=ρ(w,t). n≥1 or ∞; level zero is transported separately by AL_1.
- N≥4 and p∤N; x is in Δ(p∞N) and x̄ denotes its supplied image in O_p×.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O1/equivariant-coefficient-sheaf`
- `OverconvergentAutomorphicForms:O2/hilbert-automorphy-factor`
- `HilbertModularVarietiesAndShimuraCurves:H4/effective-level-groups`
- `HilbertModularVarietiesAndShimuraCurves:H4/finite-level-torsors`
- `PerfectoidShimuraVarieties:S5/hilbert-three-towers`
- `PerfectoidShimuraVarieties:S5/hilbert-level-torsors`
- `PerfectoidShimuraVarieties:S5/hilbert-period-and-domain-compatibility`
- `OverconvergentAutomorphicForms:O0/weight-comparison-totally-positive-units`
- `OverconvergentAutomorphicForms:O4/arithmetic-representatives`
- `AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product`
- `OverconvergentAutomorphicForms:O4/effective-arithmetic-descent`

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
- `TauCeti.Overconvergent.Test.O4_presentation_arithmetic_full_cover` (compatibility): For every η∈U_N, and then every z∈Z∞ by continuity, the central representative change leaves the section multiplier unchanged.

**Acceptance.**

- Define presentation (4) independently as the O+ equivariance equalizer on the actual cover X_{G,U,Γ(p∞)}(ε)_a×U, with acting group PΓ0(p^n) and section transformation multiplier κ(cz+d)⁻¹w(det γ); rational coefficients replace O+ by O. Push forward to the finite-level base. None of the four definitions is an abbreviation for another.

#### Well-defined arithmetic coefficient actions

**ID:** `OverconvergentAutomorphicForms:O4/arithmetic-representatives`. **Kind:** theorem.

**Statement.** For N≥4 prime to p put U_N={η∈O_F×:η≡1 mod N} and Z∞=closure(U_N) in O_p×. Every η∈U_N has N_F/Q(η)=1, even without total positivity, so N(z)=1 for z∈Z∞. For κ=w²(t∘N)⁻¹ the multipliers κ(cz+d)⁻¹w(x̄) and κ(cz+d)⁻¹w(det γ) kill respectively (zI,z²) and zI. They therefore descend continuously to E(p^n)=(Γ0(p^n)×Δ(p∞N))/Z∞ and PΓ0(p^n)=Γ0(p^n)/Z∞. The positive-unit quotient in BHW is used as a dense subgroup of E(p^n).

**Proposed declaration:** `TauCeti.Overconvergent.arithmetic_representatives`.

**Hypotheses.**

- Use H4/S5 effective quotients and all congruence units U_N. Positive global units still act by polarization, but they do not replace U_N in the central kernel.
- N≥4, p∤N; arithmetic family (w,t) as in O0, with continuous character values and continuous tower actions.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O0/weight-comparison-totally-positive-units`
- `OverconvergentAutomorphicForms:O2/hilbert-cocycle-law`
- `HilbertModularVarietiesAndShimuraCurves:H4/effective-level-groups`
- `HilbertModularVarietiesAndShimuraCurves:H4/finite-level-torsors`

**Proof outline.**

1. For a global unit its norm is ±1. Reduction of the determinant defining the norm gives N_F/Q(η)≡1 mod N for η∈U_N. Since N≥4, the norm is +1.
2. Use O0 to compute κ(η)⁻¹w(η²)=t(Nη)=1. Extend to Z∞ by continuity of the norm and the characters.
3. Apply the explicit kernel embeddings of S5/hilbert-level-torsors. Equality on the dense subgroup extends to the completed profinite deck group.

**Source matches.**

- [BHW-2023](https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf), Lemma 9.2 and equation (9.1), pp.1781–1782: The norm-one identity is exactly what makes both quotient actions well-defined.

**Acceptance.**

- Test the entire congruence-unit kernel, not only its totally positive subgroup.
- At N=2, F=Q and η=−1 show why the congruence argument cannot omit the fine-level bound.
- The pairing eβ is a function on the hybrid tower; the arithmetic tower has only its class modulo the positive-unit closure.

#### Comparison of geometric covers

**ID:** `OverconvergentAutomorphicForms:O4/geometric-full-cover-comparison`. **Kind:** comparison.

**Statement.** Pullback from the full Γ tower to the Γ* tower identifies presentations (2) and (1), integrally and rationally. The inverse is constructed through X_{Γ*(p∞)}←X_{Γ*(p∞)}×O_p^×→X_{Γ(p∞)}, whose right map is a Z_p^×-torsor. It is a genuine isomorphism independent of the choice of full geometric cover.

**Proposed declaration:** `TauCeti.Overconvergent.geometric_full_cover_comparison`.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the geometric Hilbert moduli schemes; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. Arithmetic finite-level torsors are taken over the quotient stacks, or on coarse spaces over the respective action-free loci supplied by H3.6, H4.17 and S5.8; N≥4 alone does not assert freeness of a polarization or diagonal action.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε<1/(c_p p^m) for p≥3 and 0≤ε≤1/(4·2^m) for p=2 (HodgeTateAndCanonicalSubgroups §4.6; the endpoint is excluded for p≥3); when m=1 at a prime ramified in F also ε≤p^(−3) (§§3.10, 5.1). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- An arithmetic family is κ_ar=(w,t), with geometric κ=ρ(w,t). n≥1 or ∞; level zero is transported separately by AL_1.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O4/presentation-geometric-small`
- `OverconvergentAutomorphicForms:O4/presentation-geometric-full`
- `PerfectoidShimuraVarieties:S5/hilbert-three-towers`
- `PerfectoidShimuraVarieties:S5/hilbert-level-torsors`
- `PerfectoidShimuraVarieties:S5/hilbert-period-and-domain-compatibility`
- `PerfectoidSpaces:P9/weight-extension-sheaf-equalizer`
- `PerfectoidSpaces:P9/function-descent-along-tower`
- `HodgeTateAndCanonicalSubgroups:T4/canonical-anticanonical-loci`
- `HodgeTateAndCanonicalSubgroups:T4/atkin-lehner-anticanonical`
- `HodgeTateAndCanonicalSubgroups:T4/hodge-tate-coordinate`
- `HodgeTateAndCanonicalSubgroups:T4/period-map-inclusions`
- `AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product`
- `PerfectoidShimuraVarieties:S5/hilbert-mixed-span`

**Proof outline.**

1. Pull back a section along the tower morphism; the coordinate/cocycle agree by S5/T4.
2. For the inverse, pull the Γ* section to the product. The action diag(ε,1), ε∈Z_p^×, has j=1, giving invariance under the antidiagonal torsor action.
3. Use P9’s O/O+ profinite torsor descent. Verify diag(u,1) invariance for all u∈O_p^× and Γ0* equivariance; these generate the full Γ0 action. The composites are the identity by faithful pullback.

**Source matches.**

- [BHW-2023](https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf), Lemma 9.3, pp.1782–1783: The source supplies the explicit torsor span and inverse map, not just equality of dimensions.

**Acceptance.**

- For diag(u,1), the coefficient factor is κ(1)⁻¹=1.

#### Twisted polarisation action

**ID:** `OverconvergentAutomorphicForms:O4/twisted-polarisation-action`. **Kind:** construction. **Planet:** Twisted polarisation action.

**Statement.** On π_* of presentation (2), define the left action of positive global units by ε·_w f=w(ε)(ε⁻¹)^*f. This preserves the geometric coefficient sheaf and factors through the finite group Δ(N) supplied by H4. This finite group differs from the profinite Δ(p∞N) acting on full towers.

**Proposed declaration:** `TauCeti.Overconvergent.twisted_polarisation_action`.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the geometric Hilbert moduli schemes; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. Arithmetic finite-level torsors are taken over the quotient stacks, or on coarse spaces over the respective action-free loci supplied by H3.6, H4.17 and S5.8; N≥4 alone does not assert freeness of a polarization or diagonal action.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε<1/(c_p p^m) for p≥3 and 0≤ε≤1/(4·2^m) for p=2 (HodgeTateAndCanonicalSubgroups §4.6; the endpoint is excluded for p≥3); when m=1 at a prime ramified in F also ε≤p^(−3) (§§3.10, 5.1). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- An arithmetic family is κ_ar=(w,t), with geometric κ=ρ(w,t). n≥1 or ∞; level zero is transported separately by AL_1.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O4/presentation-geometric-full`
- `OverconvergentAutomorphicForms:O4/arithmetic-representatives`
- `HilbertModularVarietiesAndShimuraCurves:H4/effective-level-groups`
- `HilbertModularVarietiesAndShimuraCurves:H4/finite-level-torsors`
- `HodgeTateAndCanonicalSubgroups:T4/canonical-anticanonical-loci`
- `HodgeTateAndCanonicalSubgroups:T4/atkin-lehner-anticanonical`
- `HodgeTateAndCanonicalSubgroups:T4/hodge-tate-coordinate`
- `HodgeTateAndCanonicalSubgroups:T4/period-map-inclusions`
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
- Tame level N is prime to p and sufficiently small for the geometric Hilbert moduli schemes; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. Arithmetic finite-level torsors are taken over the quotient stacks, or on coarse spaces over the respective action-free loci supplied by H3.6, H4.17 and S5.8; N≥4 alone does not assert freeness of a polarization or diagonal action.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε<1/(c_p p^m) for p≥3 and 0≤ε≤1/(4·2^m) for p=2 (HodgeTateAndCanonicalSubgroups §4.6; the endpoint is excluded for p≥3); when m=1 at a prime ramified in F also ε≤p^(−3) (§§3.10, 5.1). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- An arithmetic family is κ_ar=(w,t), with geometric κ=ρ(w,t). n≥1 or ∞; level zero is transported separately by AL_1.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O4/presentation-arithmetic-intermediate`
- `OverconvergentAutomorphicForms:O4/presentation-geometric-full`
- `OverconvergentAutomorphicForms:O4/twisted-polarisation-action`
- `HilbertModularVarietiesAndShimuraCurves:H4/effective-level-groups`
- `HilbertModularVarietiesAndShimuraCurves:H4/finite-level-torsors`

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
- Tame level N is prime to p and sufficiently small for the geometric Hilbert moduli schemes; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. Arithmetic finite-level torsors are taken over the quotient stacks, or on coarse spaces over the respective action-free loci supplied by H3.6, H4.17 and S5.8; N≥4 alone does not assert freeness of a polarization or diagonal action.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε<1/(c_p p^m) for p≥3 and 0≤ε≤1/(4·2^m) for p=2 (HodgeTateAndCanonicalSubgroups §4.6; the endpoint is excluded for p≥3); when m=1 at a prime ramified in F also ε≤p^(−3) (§§3.10, 5.1). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- An arithmetic family is κ_ar=(w,t), with geometric κ=ρ(w,t). n≥1 or ∞; level zero is transported separately by AL_1.
- The full-level pairing eβ is an O_p^×-valued map supplied by S5, with the stated transformation law.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O4/presentation-arithmetic-full`
- `OverconvergentAutomorphicForms:O4/presentation-arithmetic-intermediate`
- `OverconvergentAutomorphicForms:O4/arithmetic-representatives`
- `PerfectoidShimuraVarieties:S5/hilbert-three-towers`
- `PerfectoidShimuraVarieties:S5/hilbert-level-torsors`
- `PerfectoidShimuraVarieties:S5/hilbert-period-and-domain-compatibility`
- `PerfectoidSpaces:P9/weight-extension-sheaf-equalizer`
- `PerfectoidSpaces:P9/function-descent-along-tower`
- `AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product`
- `PerfectoidShimuraVarieties:S5/hilbert-weil-pairing`
- `PerfectoidShimuraVarieties:S5/hilbert-polarization-torsors`

**Proof outline.**

1. Multiply the pullback by the inverse pairing character; its transformation changes w(det γ) into w(x) by cancellation.
2. For the inverse, w(eβ)f is invariant under positive global units. Their density in the profinite quotient and continuity extend invariance to Δ(p∞N).
3. Apply P9 profinite descent and faithful pullback to prove the inverse and its PΓ0 equivariance. Pairing values are integral units, so preserve O+.

**Source matches.**

- [BHW-2023](https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf), Equation (9.5) and Lemma 9.7, pp.1784–1786: The pairing transformation is the nontrivial coefficient twist in the comparison.

**Acceptance.**

- The plain pullback π∞^* does not convert the determinant multiplier to the polarisation multiplier when w is nontrivial.

#### Forms across polarisation classes

**ID:** `OverconvergentAutomorphicForms:O4/polarisation-class-forms`. **Kind:** construction. **Planet:** Polarisation-class Hilbert forms.

**Statement.** For arithmetic forms take the direct sum of fixed-c spaces over prime-to-p fractional ideals and quotient by P_x(f)−f for x∈F×,+∩O_p× (global totally positive elements that are p-adic units), where P_x transports c to xc. The indexing quotient is the finite narrow class group. Integral forms use the corresponding integral lattices. For G* retain a chosen set of class representatives and the specified comparison maps.

**Proposed declaration:** `TauCeti.Overconvergent.polarisation_class_forms`.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the geometric Hilbert moduli schemes; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. Arithmetic finite-level torsors are taken over the quotient stacks, or on coarse spaces over the respective action-free loci supplied by H3.6, H4.17 and S5.8; N≥4 alone does not assert freeness of a polarization or diagonal action.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε<1/(c_p p^m) for p≥3 and 0≤ε≤1/(4·2^m) for p=2 (HodgeTateAndCanonicalSubgroups §4.6; the endpoint is excluded for p≥3); when m=1 at a prime ramified in F also ε≤p^(−3) (§§3.10, 5.1). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- An arithmetic family is κ_ar=(w,t), with geometric κ=ρ(w,t). n≥1 or ∞; level zero is transported separately by AL_1.
- Use H3/H4’s transport maps and their composition law; for arithmetic forms a transport by a positive unit stabilizing an ideal is already the identity after descent.
- The transport parameter is a global element x∈F×,+∩O_p×; an arbitrary local p-adic unit does not multiply a fractional ideal of F.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O3/fixed-radius-hilbert-forms`
- `OverconvergentAutomorphicForms:O4/weil-pairing-comparison`
- `OverconvergentAutomorphicForms:O4/finite-polarisation-descent`
- `HilbertModularVarietiesAndShimuraCurves:H3/arithmetic-quotient`
- `HilbertModularVarietiesAndShimuraCurves:H3/ideal-class-comparisons`
- `HilbertModularVarietiesAndShimuraCurves:H4/effective-level-groups`
- `HilbertModularVarietiesAndShimuraCurves:H4/finite-level-torsors`
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
- Tame level N is prime to p and sufficiently small for the geometric Hilbert moduli schemes; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. Arithmetic finite-level torsors are taken over the quotient stacks, or on coarse spaces over the respective action-free loci supplied by H3.6, H4.17 and S5.8; N≥4 alone does not assert freeness of a polarization or diagonal action.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε<1/(c_p p^m) for p≥3 and 0≤ε≤1/(4·2^m) for p=2 (HodgeTateAndCanonicalSubgroups §4.6; the endpoint is excluded for p≥3); when m=1 at a prime ramified in F also ε≤p^(−3) (§§3.10, 5.1). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- An arithmetic family is κ_ar=(w,t), with geometric κ=ρ(w,t). n≥1 or ∞; level zero is transported separately by AL_1.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O4/polarisation-class-forms`
- `OverconvergentAutomorphicForms:O4/finite-polarisation-descent`
- `HilbertModularVarietiesAndShimuraCurves:H4/effective-level-groups`
- `HilbertModularVarietiesAndShimuraCurves:H4/finite-level-torsors`

**Proof outline.**

1. Use H4’s transport composition and O4 twisted/finite descent to kill the stabilizer ambiguity.
2. Build the representative-change map componentwise with P_x; its inverse uses P_{x⁻¹}.
3. The quotient relation makes both composites and all correspondence diagrams independent of x in the arithmetic case. Retain the chosen conjugation in the geometric case.

**Source matches.**

- [BHW-2023](https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf), Remark 10.6, p.1791; Definition 9.10, pp.1786–1787: The arithmetic normalisation removes polarisation choices; G* retains a comparison choice.

**Acceptance.**

- Changing a polarisation representative twice agrees with changing it by the product transport.

### OverconvergentAutomorphicForms:O5

Independent AIP construction and comparison. Independent AIP coefficients, universal formal and full-character rational lines; noncircular integral comparison via unit multipliers and valuations; distinct conditional full-character integral freeness; arithmetic and naturality maps.

#### Independent AIP coefficient sheaves

**ID:** `OverconvergentAutomorphicForms:O5/aip-independent-coefficients`. **Kind:** construction. **Planet:** AIP coefficient sheaf.

**Statement.** On each AIP chart construct the modified differential frame torsor F_{n,r,I} and its B_n=O_p×·(1+p^n Hdg^(−p^n/(p−1))Res_{O_F/Z}G_a) action independently of the perfectoid tower. Define the analytic rational and integral coefficient sheaves as the κ⁻¹-eigenfunctions in (g_n f_n)_*O and (g_n f_n)_*O+ on this actual analytic torsor. In the formal AIP construction, first construct w_{n,r,I} for the universal character on W_F^0, then retain §6.4’s finite-character factor wχ for a full weight. The full formal sheaf is coherent; Prop.4.3 is not cited to assert its integral formal invertibility for every χ.

**Proposed declaration:** `TauCeti.Overconvergent.aip_independent_coefficients`.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the geometric Hilbert moduli schemes; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. Arithmetic finite-level torsors are taken over the quotient stacks, or on coarse spaces over the respective action-free loci supplied by H3.6, H4.17 and S5.8; N≥4 alone does not assert freeness of a polarization or diagonal action.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Use the independent AIP formal weight chart indexed by I=[p^k,p^k′], 0≤k≤k′, with r_AIP≥3 and r_AIP+k≥n_AIP≥k′+2 for odd p (≥k′+4 for p=2). Set n′=n_AIP−k′−2 (or −4). These are universal-coordinate conditions; δ is not silently identified with the corrected pro-p supremum.
- Choose a positive or ordinary radius in the intersection of the canonical-subgroup, analytic-character and AIP torsor admissibility ranges.

**Direct inputs.**

- `HodgeTateAndCanonicalSubgroups:T5/igusa-torsor`
- `HodgeTateAndCanonicalSubgroups:T5/integral-differential-lattice`
- `HodgeTateAndCanonicalSubgroups:T5/integral-lattice-properties`
- `HodgeTateAndCanonicalSubgroups:T5/aip-torsor`
- `HodgeTateAndCanonicalSubgroups:T5/hodge-tate-aip-lift`
- `OverconvergentAutomorphicForms:O3/ramified-modified-lattice`
- `OverconvergentAutomorphicForms:O0/bounded-weight-families`
- `LocallyAnalyticDistributions:L0/multivariable-fixed-radius`
- `LocallyAnalyticDistributions:L0/analytic-chart-pullback`
- `LocallyAnalyticDistributions:L4/affinoid-analytic-stage`
- `LocallyAnalyticDistributions:L4/analytic-completed-tensor`
- `AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product`
- `OverconvergentAutomorphicForms:O5/finite-character-integral-generator`

**Proof outline.**

1. Import T5’s canonical subgroup, modified lattice, Hodge–Tate congruence and the frame torsor; retain its B_n-action.
2. Extend the universal-coordinate character via AIP Proposition 2.8 on W_F^0. For a full weight retain the finite torsion character χ and its independent eigencomponent on the normalized finite Igusa cover (§6.4, p.29).
3. Take actual κ⁻¹ analytic O and O⁺ eigenfunctions. Keep the universal formal line and the full finite-character coherent factor separate. O5/finite-character-integral-generator describes the actual analytic finite-character equalizer and the unit on its split tower product; comparison with a completed tensor of formal integral lattices remains an additional input. Positive-radius integral local freeness is the recorded gap.
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

**Unit tests.**

- `TauCeti.Overconvergent.Test.O5_aip_translation_valuation_units_higherRank` (compatibility): The valuation-unit implication holds with value group WithZero of the multiplicative lexicographically ordered Z by Z group, without a real-valued norm.
- `TauCeti.Overconvergent.Test.O5_aip_translation_valuation_units_primePower` (compatibility): A unit of positive prime-power order has valuation one at every valuation, without a prime-to-p order condition.
- `TauCeti.Overconvergent.Test.O5_aip_translation_valuation_units_finiteOrder` (compatibility): A unit of any positive finite order and its inverse preserve the integral bound on every translated scalar.
- `TauCeti.Overconvergent.Test.O5_aip_translation_valuation_units_sign` (computation): The sign character value at p=2 preserves integrality: a and its negative have the same bound at every valuation.
- `TauCeti.Overconvergent.Test.O5_aip_translation_valuation_units_nonunit` (non-example): For a multiplier with valuation strictly below one, its inverse fails the bound at a=1; value-integrality alone is insufficient.
- `TauCeti.Overconvergent.Test.O5_aip_translation_valuation_units_eigencondition` (compatibility): For an actual supplied eigencondition relating two point values by the inverse multiplier, membership in the valuation ring agrees when both multiplier bounds hold.

**Acceptance.**

- A multiplier p has integral value but nonintegral inverse and does not satisfy the conclusion.
- The finite character sending −1 to −1 at p=2 preserves both bounds despite being outside W_F^0.

#### AIP integral line and gluing

**ID:** `OverconvergentAutomorphicForms:O5/aip-line-and-gluing`. **Kind:** theorem. **Planet:** AIP integral coefficient line.

**Statement.** For the universal formal character on W_F^0, the AIP eigenmodule is a formal line and its admissible chart transports satisfy the cocycle identity (AIP Propositions4.3/4.7). For a full character, §6.4 gives a coherent formal sheaf and a rational analytic line, with chart transport obtained from the actual eigenfunctions. An analytic O+ line for the full character follows if, locally on the analytic base, a torsor eigenfunction e and its inverse are both in O+ and their transports differ by base O+ units. Existence of such integral trivializations at positive radius for arbitrary χ is the precise remaining freeness target; rational line gluing does not assert it.

**Proposed declaration:** `TauCeti.Overconvergent.aip_line_and_gluing`.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the geometric Hilbert moduli schemes; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. Arithmetic finite-level torsors are taken over the quotient stacks, or on coarse spaces over the respective action-free loci supplied by H3.6, H4.17 and S5.8; N≥4 alone does not assert freeness of a polarization or diagonal action.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Use the independent AIP formal weight chart indexed by I=[p^k,p^k′], 0≤k≤k′, with r_AIP≥3 and r_AIP+k≥n_AIP≥k′+2 for odd p (≥k′+4 for p=2). Set n′=n_AIP−k′−2 (or −4). These are universal-coordinate conditions; δ is not silently identified with the corrected pro-p supremum.
- Choose a positive or ordinary radius in the intersection of the canonical-subgroup, analytic-character and AIP torsor admissibility ranges.
- For the analytic full-character unit criterion require actual geometric O+ invariant-function descent on the entire weight-product sheaf. The completed lattice tensor used by the named P9 theorem is a distinct coefficient object.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O5/aip-independent-coefficients`
- `HodgeTateAndCanonicalSubgroups:T5/igusa-torsor`
- `HodgeTateAndCanonicalSubgroups:T5/integral-differential-lattice`
- `HodgeTateAndCanonicalSubgroups:T5/integral-lattice-properties`
- `HodgeTateAndCanonicalSubgroups:T5/aip-torsor`
- `HodgeTateAndCanonicalSubgroups:T5/hodge-tate-aip-lift`
- `PerfectoidSpaces:P9/weight-extension-sheaf-equalizer`
- `PerfectoidSpaces:P9/function-descent-along-tower`
- `PerfectoidSpaces:P9/integral-coboundary-trivialises-integral-sheaf`
- `OverconvergentAutomorphicForms:O5/aip-torsor-structure-invariants`
- `OverconvergentAutomorphicForms:O5/finite-character-integral-generator`

**Proof outline.**

1. For the W_F^0 universal formal line, AIP Proposition4.3 and Lemmas4.4–4.6 construct the trace-compatible eigenfunction congruent to one modulo topologically nilpotent elements on the actual formal torsor. Its value and inverse are integral; normality proves formal rank one. Pullback of this formal line to its specified analytic O+ ringed chart is a line.
2. AIP Proposition4.7 compares the universal-character formal lines on a common refinement. The ratio of their unit-valued generators is invariant; the exact P9 invariant-functions contract identifies it with a base O+ unit. Ratios multiply on triple overlaps.
3. For full weights retain §6.4’s normalized finite-Igusa factor. The paper proves coherence and rational/ordinary invertibility, which supplies the rational analytic line. No denominator 1/|H| is used to claim integral freeness, especially when H has p-torsion.
4. For a full-character integral trivialization e, use the sheafwise identity ((g_n f_n)_*O+)^{B_n}=O+ on all base opens of O5/aip-torsor-structure-invariants. Then every integral eigenfunction g has invariant integral ratio g/e; conversely multiplication by e sends each base integral function to an eigenfunction. Require base O+ unit transition ratios. P9’s named integral-coboundary theorem proves this algebraic criterion for its chosen completed lattice tensor; applying it to geometric O+ on a smooth weight product uses the all-open integral equalizer of PerfectoidTowers §P9.11 together with O5/aip-torsor-structure-invariants, and does not identify the two lattices silently.
5. Existence of a base-local positive-radius unit eigenfunction e for a full character is not known in general: O5/finite-character-integral-generator gives a unit generator only on the split cover over the tower, and its model non-example shows this does not force integral freeness downstairs. It is recorded as an open gap owned here. The O5 comparison of two integral equalizers below does not use it.

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
- Tame level N is prime to p and sufficiently small for the geometric Hilbert moduli schemes; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. Arithmetic finite-level torsors are taken over the quotient stacks, or on coarse spaces over the respective action-free loci supplied by H3.6, H4.17 and S5.8; N≥4 alone does not assert freeness of a polarization or diagonal action.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Use the independent AIP formal weight chart indexed by I=[p^k,p^k′], 0≤k≤k′, with r_AIP≥3 and r_AIP+k≥n_AIP≥k′+2 for odd p (≥k′+4 for p=2). Set n′=n_AIP−k′−2 (or −4). These are universal-coordinate conditions; δ is not silently identified with the corrected pro-p supremum.
- Choose a positive or ordinary radius in the intersection of the canonical-subgroup, analytic-character and AIP torsor admissibility ranges.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε<1/(c_p p^m) for p≥3 and 0≤ε≤1/(4·2^m) for p=2 (HodgeTateAndCanonicalSubgroups §4.6; the endpoint is excluded for p≥3); when m=1 at a prime ramified in F also ε≤p^(−3) (§§3.10, 5.1). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- The actual frame torsor F_m→X is a B_m-torsor on the stated site; after a complete algebraically closed valued extension every frame over a point is a B_m-translate of the Hodge–Tate frame of a lifted infinite-level point. The tower projection is valuatively surjective. These are the concrete T5/S5 torsor maps, not arbitrary maps of sets.
- On this admitted torsor the character multiplier and its inverse are O+ units at every valued test point. Use the AIP small-character congruences and the full finite-order factor. O+ is the subsheaf defined by all pointwise valuation bounds, with pullback reflecting bounds along the valuatively surjective tower.
- Apply T5/hodge-tate-aip-lift only with its actual bound ε_base≤p^(−(m+1)). In the scaled map s∘u_n, ε_base is the radius after u_n, while the anticanonical source radius is p^n ε_base. Require every source domain to satisfy its own O2 admissibility bounds as well; the bound 1/(c_p p^m) alone does not imply the T5 bound for p≥5.
- At a prime ramified in F use the unsplit 𝒪_F/p^n-linear canonical generator of HodgeTateAndCanonicalSubgroups §3.12, available for n≥2, for p unramified, or for H=H′[p^n] (at level one this uses the level-two subgroup and ε≤p^(−3), §3.10), and its comparison with the saturated Hodge–Tate kernel in §4.7, with scalar conormal-degree estimates before passage to a splitting field. The period-map inclusions of §4.6 are strict at the endpoint for p≥3 and inclusive for p=2; no integral embedding-wise product decomposition of 𝒪_p⊗O_C is used.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O5/aip-line-and-gluing`
- `OverconvergentAutomorphicForms:O3/integral-hilbert-sheaf`
- `HodgeTateAndCanonicalSubgroups:T5/igusa-torsor`
- `HodgeTateAndCanonicalSubgroups:T5/integral-differential-lattice`
- `HodgeTateAndCanonicalSubgroups:T5/integral-lattice-properties`
- `HodgeTateAndCanonicalSubgroups:T5/aip-torsor`
- `HodgeTateAndCanonicalSubgroups:T5/hodge-tate-aip-lift`
- `PerfectoidSpaces:P9/weight-extension-sheaf-equalizer`
- `PerfectoidSpaces:P9/function-descent-along-tower`
- `OverconvergentAutomorphicForms:O2/hilbert-level-radius-maps`
- `AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product`
- `OverconvergentAutomorphicForms:O1/analytic-line-effectivity`
- `HodgeTateAndCanonicalSubgroups:T5/aip-automorphy-factor`
- `OverconvergentAutomorphicForms:O5/aip-translation-valuation-units`
- `HodgeTateAndCanonicalSubgroups:T5/aip-torsor-hodge-tate-comparison`
- `HodgeTateAndCanonicalSubgroups:T3/hilbert-canonical-subgroup`
- `HodgeTateAndCanonicalSubgroups:T4/period-map-inclusions`
- `HodgeTateAndCanonicalSubgroups:T4/hodge-tate-coordinate`
- `OverconvergentAutomorphicForms:O5/aip-torsor-structure-invariants`

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
- Tame level N is prime to p and sufficiently small for the geometric Hilbert moduli schemes; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. Arithmetic finite-level torsors are taken over the quotient stacks, or on coarse spaces over the respective action-free loci supplied by H3.6, H4.17 and S5.8; N≥4 alone does not assert freeness of a polarization or diagonal action.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Use the independent AIP formal weight chart indexed by I=[p^k,p^k′], 0≤k≤k′, with r_AIP≥3 and r_AIP+k≥n_AIP≥k′+2 for odd p (≥k′+4 for p=2). Set n′=n_AIP−k′−2 (or −4). These are universal-coordinate conditions; δ is not silently identified with the corrected pro-p supremum.
- Choose a positive or ordinary radius in the intersection of the canonical-subgroup, analytic-character and AIP torsor admissibility ranges.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε<1/(c_p p^m) for p≥3 and 0≤ε≤1/(4·2^m) for p=2 (HodgeTateAndCanonicalSubgroups §4.6; the endpoint is excluded for p≥3); when m=1 at a prime ramified in F also ε≤p^(−3) (§§3.10, 5.1). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
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
- Tame level N is prime to p and sufficiently small for the geometric Hilbert moduli schemes; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. Arithmetic finite-level torsors are taken over the quotient stacks, or on coarse spaces over the respective action-free loci supplied by H3.6, H4.17 and S5.8; N≥4 alone does not assert freeness of a polarization or diagonal action.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Use the independent AIP formal weight chart indexed by I=[p^k,p^k′], 0≤k≤k′, with r_AIP≥3 and r_AIP+k≥n_AIP≥k′+2 for odd p (≥k′+4 for p=2). Set n′=n_AIP−k′−2 (or −4). These are universal-coordinate conditions; δ is not silently identified with the corrected pro-p supremum.
- Choose a positive or ordinary radius in the intersection of the canonical-subgroup, analytic-character and AIP torsor admissibility ranges.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε<1/(c_p p^m) for p≥3 and 0≤ε≤1/(4·2^m) for p=2 (HodgeTateAndCanonicalSubgroups §4.6; the endpoint is excluded for p≥3); when m=1 at a prime ramified in F also ε≤p^(−3) (§§3.10, 5.1). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- Maps of weight families pull back the specified character and its analytic extension. Claims about sheaves do not assert arbitrary nonflat base change of global sections.
- Inherit geometric-aip-comparison’s explicit T5 radius bound and scaled source-domain admission wherever the Hodge–Tate frame comparison is used, on both source and target of each comparison diagram.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O5/geometric-aip-comparison`
- `OverconvergentAutomorphicForms:O5/arithmetic-aip-comparison`
- `OverconvergentAutomorphicForms:O3/hilbert-weight-pullback`
- `HodgeTateAndCanonicalSubgroups:T5/igusa-torsor`
- `HodgeTateAndCanonicalSubgroups:T5/integral-differential-lattice`
- `HodgeTateAndCanonicalSubgroups:T5/integral-lattice-properties`
- `HodgeTateAndCanonicalSubgroups:T5/aip-torsor`
- `HodgeTateAndCanonicalSubgroups:T5/hodge-tate-aip-lift`
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

#### Structure-sheaf invariants of the AIP frame torsor

**ID:** `OverconvergentAutomorphicForms:O5/aip-torsor-structure-invariants`. **Kind:** theorem.

**Statement.** Let f: 𝔉_m(ε)→X(ε) be the analytic AIP frame torsor, a torsor locally trivial for the étale topology under the analytic group B_m=𝒪_p^×(1+I′_m Res𝔾̂_a) over the Hasse neighbourhood X(ε), and let U be a reduced affinoid weight base over L, with f_U=f×id_U. (1) For every open V⊆X(ε)×U, a function on f_U⁻¹(V) that is invariant under the B_m-action (its two pullbacks to B_m×_{X(ε)}𝔉_m(ε)×U agree) is the pullback of a unique function on V, and it is power-bounded exactly when that function is: (f_U*O)^{B_m}=O and (f_U*O⁺)^{B_m}=O⁺ as sheaves on X(ε)×U. (2) Every point x of X(ε)×U has a preimage y after a finite separable extension of its completed residue field, and |g(x)|=|(f_U*g)(y)| for every g∈O(V); in particular a section is power-bounded if and only if its pullback is.

**Proposed declaration:** `TauCeti.Overconvergent.aip_torsor_structure_invariants`.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the geometric Hilbert moduli schemes; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. Arithmetic finite-level torsors are taken over the quotient stacks, or on coarse spaces over the respective action-free loci supplied by H3.6, H4.17 and S5.8; N≥4 alone does not assert freeness of a polarization or diagonal action.
- Use the torsor of HodgeTateAndCanonicalSubgroups §5.8 in the range m≥1, ε≤p^(−(m+1)) of §5.10; its structure group B_m is an analytic group space over X(ε), not a profinite deck group.
- Invariance means invariance under the action morphism of the group space B_m, not only under its L-points.
- The weight base enters only as a parameter: B_m acts on the first factor of 𝔉_m(ε)×U.

**Direct inputs.**

- `HodgeTateAndCanonicalSubgroups:T5/aip-torsor`
- `HodgeTateAndCanonicalSubgroups:T5/hodge-tate-aip-lift`
- `AdicEtaleGeometry:A1/etale-structure-sheaf`
- `AdicEtaleGeometry:A1/etale-site-and-geometric-points`
- `AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product`

**Proof outline.**

1. Étale locally on X(ε) the torsor is trivial: choose an étale cover V_i→X(ε) with 𝔉_m×_X V_i≅B_m×_X V_i (aipTorsor_structureGroup of HodgeTateAndCanonicalSubgroups §5.8).
2. On the trivial torsor B_m×V_i×U an invariant function satisfies g(b,v,u)=g(1,v,u): restrict the invariance identity along the unit section of B_m. So g is the pullback of its restriction along the unit section, and that restriction is power-bounded when g is; pullback preserves power-boundedness.
3. O and O⁺ are sheaves on the étale site of an analytic adic space (AdicEtaleGeometry A1, the étale structure sheaves), so the local descriptions on the V_i×U glue to every open V, and uniqueness follows from surjectivity of the étale cover.
4. For (2), first lift x through one of the étale splitting covers V_i×U→X(ε)×U, using a finite separable extension of its completed residue field. The unit section of the trivialized B_m-torsor then gives a point y of 𝔉_m(ε)×U. Its valuation restricts to that at x, giving |g(x)|=|(f_U*g)(y)|. This uses the étale cover, not an assertion that f_U itself is étale: its fibres have positive dimension. Testing O⁺ at all valued points gives the criterion.

**Source matches.**

- [AIP-ADIC-2016](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/Hilbert_adicfinal.pdf), §4.2, the torsor of modified frames before Proposition 4.3, p.16: The overconvergent sheaves are defined as eigenfunctions on a torsor of modified differential frames under an analytic group, which is why invariants under that group are the base functions.
- [BHW-2023](https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf), Definition 7.5 and Definition 7.9, pp.1760–1761; first step of the proof of Theorem 7.14, p.1764: The AIP sheaf is recalled as functions on the frame torsor with a prescribed transformation law, and the comparison evaluates such functions along the Hodge–Tate frame.

**Acceptance.**

- For the trivial character this identifies invariant integral functions on the torsor with integral functions on the base, the step used to make κ⁻¹-eigenfunctions with an integral unit generator into a base line.
- A non-invariant eigenfunction, such as a frame coordinate on which B_m acts by a nontrivial character, does not descend; the statement is about invariants only.
- The statement is not the profinite pro-étale descent of PerfectoidTowers §P9.6: B_m is a positive-dimensional analytic group, and the proof uses étale local triviality rather than continuous group cohomology.

#### The finite-character Igusa factor and its unit generator on the tower

**ID:** `OverconvergentAutomorphicForms:O5/finite-character-integral-generator`. **Kind:** theorem.

**Statement.** Let H be the torsion subgroup of 𝒪_p^×, choose the retraction G=(𝒪_F/p²)^×→H of AIP Lemma 2.4, and write χ:G→A^× for the finite part of a bounded weight family over U=Spa(A,A⁺). For the level-two Igusa torsor h:IG₂→X(ε), form the actual analytic product h_U:IG₂×U→X(ε)×U. Define w_χ=(h_U*O)^{χ⁻¹} and w_χ⁺=(h_U*O⁺)^{χ⁻¹}=w_χ∩h_U*O⁺. (1) w_χ is an analytic line and w_χ⁺ is its pointwise integral eigenfunction subsheaf. (2) The admitted full anticanonical cover π:X_∞→X(ε), with the appropriate scaled Atkin–Lehner map, supplies a section σ of the pulled-back Igusa torsor. On IG₂×_X X_∞×U, e_{χ,σ}(σ·a,u)=χ(a,u)⁻¹ is an O⁺-unit; e_{χ,σ·a}=χ(a)e_{χ,σ} and σ*e_{χ,σ}=1. The eigenfunction sheaves formed on this split product are freely generated by e_{χ,σ}, over O and O⁺ respectively. Rational finite étale base change identifies the former with π_U*w_χ; no identification of the integral eigenfunction sheaf with the ordinary O⁺-module pullback π_U*w_χ⁺ is asserted. (3) On the Čech overlap of π, define a(y₁,y₂)∈G by σ(y₂)=σ(y₁)·a(y₁,y₂). Evaluation along σ identifies w_χ⁺ with integral functions g on X_∞×U satisfying g(y₂)=χ(a(y₁,y₂))⁻¹g(y₁). On the subgroup Γ₀*(p^∞) the BHW action gives a=d_γ mod p²; invariance under this subgroup alone descends only to its own intermediate quotient, not to X(ε). Integral local freeness on X(ε)×U and identification with a completed tensor of formal integral lattices require additional input.

**Proposed declaration:** `TauCeti.Overconvergent.finite_character_integral_generator`.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the geometric Hilbert moduli schemes; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. Arithmetic finite-level torsors are taken over the quotient stacks, or on coarse spaces over the respective action-free loci supplied by H3.6, H4.17 and S5.8; N≥4 alone does not assert freeness of a polarization or diagonal action.
- Choose the finite-character projection of AIP ADIC Lemma 2.4; χ may have p-power order when a completion F_𝔭 contains p-power roots of unity. Every value of χ and its inverse is a valuation unit, regardless of its order.
- Use the actual level-two Igusa torsor of HodgeTateAndCanonicalSubgroups §5.1, with ε≤p^(−3) and the other admission conditions of §§5.10–5.12. The tower carries its universal dual-canonical-subgroup trivialization. The corresponding normalized formal cover need not be an étale torsor integrally.
- Use the smooth weight product and its O⁺ sheaf supplied by AdicSpacesPartIV R5. Neither (h*O⁺)⊗̂A⁺=h_U*O⁺ nor integral eigenspace base change is presumed; an integral averaging projector requires the order of the group being averaged to be invertible.

**Direct inputs.**

- `HodgeTateAndCanonicalSubgroups:T5/igusa-torsor`
- `HodgeTateAndCanonicalSubgroups:T5/aip-torsor-hodge-tate-comparison`
- `PerfectoidShimuraVarieties:S5/hilbert-three-towers`
- `PerfectoidShimuraVarieties:S5/hilbert-period-and-domain-compatibility`
- `PerfectoidSpaces:P9/function-descent-along-tower`
- `PerfectoidSpaces:P9/weight-extension-sheaf-equalizer`
- `PerfectoidSpaces:P9/integral-matrix-coboundary-effectivity`
- `AdicEtaleGeometry:A1/etale-structure-sheaf`
- `OverconvergentAutomorphicForms:O0/principal-units`
- `AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product`

**Proof outline.**

1. Finite étale descent on the actual analytic product makes w_χ a line. Since p is inverted, the χ-isotypic projection commutes with rational scalar extension. AIP ADIC §6.4, p.29, supplies coherence of the formal factor and invertibility on its analytic fibre and ordinary locus; its positive-radius formal integral freeness is not a consequence.
2. The universal Igusa section σ splits the pulled-back finite torsor. On this split product a χ⁻¹-eigenfunction is determined by its value on σ, and is integral exactly when that value is integral, because χ(a) and χ(a)⁻¹ have valuation one. This proves freeness of the eigenfunctions newly formed upstairs, without interchanging an integral equalizer and tensor pullback.
3. Use the full Čech relation of π, whose transition a(y₁,y₂) is defined by comparing the two Igusa sections. Evaluate eigenfunctions on σ to get g(y₂)=χ(a)⁻¹g(y₁). Conversely this relation makes g·e_{χ,σ} invariant on the pulled-back Igusa torsor, so all-open function descent (PerfectoidTowers §§P9.6,P9.11) gives its unique integral eigenfunction downstairs. For the restricted BHW action of Γ₀*(p^∞), a=d_γ mod p² by HodgeTateAndCanonicalSubgroups §§5.2,5.12; that restricted formula does not replace the full relation over X(ε).
4. An O⁺-unit on IG₂×_X X_∞ does not give a base-local unit eigenfunction on X_∞ itself. The integral-coboundary criterion applies to that latter requirement and its specified lattice. Keep both positive-radius integral freeness and comparison with completed formal lattices conditional; a nonflat integral pullback cannot discharge them.

**Source matches.**

- [AIP-ADIC-2016](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/Hilbert_adicfinal.pdf), §6.4, the sheaf w_χ before Theorem 6.7, p.29; Lemma 2.4, pp.7–8: The finite part of the universal character factors through (𝒪_F/p²)^×, and its eigensheaf in the normalized Igusa cover is stated to be coherent and invertible on the ordinary locus and on the analytic fibre only.
- [BHW-2023](https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf), §7.2, Proposition 7.11 and Lemma 7.12, pp.1762–1763: On the anticanonical tower the level structure gives the Igusa generator and its transformation by the diagonal entry.

- [AIP-CUSP-2016](https://www.imo.universite-paris-saclay.fr/~pilloni/AIP2.pdf), Proposition 3.14 and Remark 3.15, p.17: Rational base change of coefficient lines is established after passage to the analytic fibre; the following remark explicitly leaves an integral finite-group-cohomology obstruction.

**Acceptance.**

- For χ trivial, w_χ⁺=O⁺ and e_{χ,σ}=1.
- If the order of the entire group being averaged is invertible in the integral coefficient ring, its character projector is integral. Without that hypothesis, in particular for a p-primary finite character, define w_χ⁺ by intersection with actual integral functions, not by a projector with denominators. Finite-order character values remain units in either case.
- Model non-example: over C_p let T be the coordinate of the annulus |p|≤|T|≤1, y²=T the double cover and χ the sign character. After base change to the cover itself, which splits it, the eigensheaf has the unit generator equal to ±1 on the two sheets; on the annulus the integral sign-eigensheaf {a·y : |a(x)|·|T(x)|^{1/2}≤1 at every point} has no O⁺-generator near a point of irrational radius, since an invertible function there has |a|=|c|·|T|^k with k an integer. A unit eigenfunction on a split cover therefore does not give integral freeness downstairs.

#### Frobenius and inclusion pullbacks of the AIP sheaf

**ID:** `OverconvergentAutomorphicForms:O5/aip-frobenius-restriction`. **Kind:** comparison.

**Statement.** For r≥0 let i:M_{r+1}→M_r be the inclusion of AIP Hasse neighbourhoods and φ:M_{r+1}→M_r the Frobenius A↦A/C₁ (quotient by the level-one canonical subgroup). For the full-character AIP sheaf ω^{κ^un}=s*ω^κ⊗w_χ of AIP ADIC §6.4 there is a canonical isomorphism i*ω^{κ^un}≅φ*ω^{κ^un}, compatible with the integral subsheaves of the modified lattice, with change of weight in U, and with the comparison maps of O5/geometric-aip-comparison at the corresponding radii.

**Proposed declaration:** `TauCeti.Overconvergent.aip_frobenius_restriction`.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the geometric Hilbert moduli schemes; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. Arithmetic finite-level torsors are taken over the quotient stacks, or on coarse spaces over the respective action-free loci supplied by H3.6, H4.17 and S5.8; N≥4 alone does not assert freeness of a polarization or diagonal action.
- M_r is the analytic adic space of AIP ADIC §6.4 over the weight space, with |H̃a^{p^{r+1}}|≥sup_{α∈m}|α|; φ is defined on M_{r+1} because a level-one canonical subgroup exists there and the quotient lands in M_r (HodgeTateAndCanonicalSubgroups §3.8).
- The isomorphism is built from the Frobenius morphism of the modified frame torsors (AIP ADIC §4.3.2 and Proposition 6.5); it is not a numerical identification of radii.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O5/aip-independent-coefficients`
- `OverconvergentAutomorphicForms:O5/finite-character-integral-generator`
- `OverconvergentAutomorphicForms:O5/geometric-aip-comparison`
- `HodgeTateAndCanonicalSubgroups:T3/quotient-hasse-radius`
- `HodgeTateAndCanonicalSubgroups:T5/aip-torsor`
- `HodgeTateAndCanonicalSubgroups:T5/integral-differential-lattice`

**Proof outline.**

1. The quotient isogeny A→A/C₁ maps the modified lattice ω^int of A/C₁ to that of A and carries the AIP frame torsor at radius r+1 to the one at radius r (HodgeTateAndCanonicalSubgroups §3.8 for the Hasse radius; AIP ADIC §4.3.2 for the frame map).
2. Frobenius commutes with the B_m-action up to the isogeny on frames, so eigenfunctions of weight κ pull back to eigenfunctions of weight κ; this gives w_I≅φ*w_I (AIP ADIC Proposition 6.5) and, after descent to the Iwasawa algebra, the same for s*ω^κ.
3. The finite-character factor w_χ is compatible because the dual canonical subgroup of A/C₁ is identified with that of A at the Igusa level used, so the Igusa covers correspond; tensor the two isomorphisms.
4. Compatibility with O5/geometric-aip-comparison: the Hodge–Tate frame of the anticanonical tower is carried by the same isogeny, so evaluation along frames commutes with i* and φ*.

**Source matches.**

- [AIP-ADIC-2016](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/Hilbert_adicfinal.pdf), Theorem 6.7(3), p.29; Proposition 6.5, p.27; §4.3.2, p.19: The sheaf on the radius r+1 neighbourhood pulled back by inclusion and by Frobenius are canonically isomorphic, from the Frobenius on the frame sheaves.

**Acceptance.**

- At an algebraic weight k it is the identification of the classical weight-k sheaves of A and A/C₁ induced on modified lattices by the canonical isogeny (AIP ADIC §4.3.2).
- The map is not the identity of underlying sheaves: i and φ are different morphisms, and for nonconstant weight the isomorphism depends on the isogeny.
- Cocycle check: the isomorphisms for M_{r+2}→M_{r+1} and M_{r+1}→M_r compose to the one for the iterated Frobenius; the comparison gives no compactness, which is O6/controlling-complete-continuity.

### OverconvergentAutomorphicForms:O6

Boundary, cusp forms, and Hecke operators. Boundary/cusp distinction, tame/diamond/wild operators, expansions, cusp vanishing/(Pr), compact restriction, controlling product and sufficient integral renormalization.

#### Hilbert cusp forms

**ID:** `OverconvergentAutomorphicForms:O6/hilbert-cusp-forms`. **Kind:** construction. **Planet:** Overconvergent Hilbert cusp forms.

**Statement.** On the supplied smooth toroidal compactification with boundary divisor D, define the subcanonical coefficient line ω^κ(−D)=ω^κ⊗I_D and cusp forms Sκ(n,N,ε;U)=H^0(ω^κ(−D)) on the admitted toroidal neighbourhood, with the corresponding integral lattice and positive-radius colimit. Arithmetic forms descend with the same boundary ideal.

**Proposed declaration:** `TauCeti.Overconvergent.hilbert_cusp_forms`.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the geometric Hilbert moduli schemes; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. Arithmetic finite-level torsors are taken over the quotient stacks, or on coarse spaces over the respective action-free loci supplied by H3.6, H4.17 and S5.8; N≥4 alone does not assert freeness of a polarization or diagonal action.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε<1/(c_p p^m) for p≥3 and 0≤ε≤1/(4·2^m) for p=2 (HodgeTateAndCanonicalSubgroups §4.6; the endpoint is excluded for p≥3); when m=1 at a prime ramified in F also ε≤p^(−3) (§§3.10, 5.1). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- C6 supplies the toroidal/minimal neighbourhoods, boundary Cartier ideal, extensions of the coefficient line and boundary-compatible maps.
- Inherit geometric-aip-comparison’s explicit T5 radius bound and scaled source-domain admission wherever the Hodge–Tate frame comparison is used, on both source and target of each comparison diagram.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O5/geometric-aip-comparison`
- `OverconvergentAutomorphicForms:O5/arithmetic-aip-comparison`
- `ShimuraCompactifications:C6/roadmap/hilbert-toroidal-model`
- `ShimuraCompactifications:C6/roadmap/hilbert-near-ordinary-model`
- `ShimuraCompactifications:C6/roadmap/hilbert-boundary-ideal-pushforward`
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
- Tame level N is prime to p and sufficiently small for the geometric Hilbert moduli schemes; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. Arithmetic finite-level torsors are taken over the quotient stacks, or on coarse spaces over the respective action-free loci supplied by H3.6, H4.17 and S5.8; N≥4 alone does not assert freeness of a polarization or diagonal action.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε<1/(c_p p^m) for p≥3 and 0≤ε≤1/(4·2^m) for p=2 (HodgeTateAndCanonicalSubgroups §4.6; the endpoint is excluded for p≥3); when m=1 at a prime ramified in F also ε≤p^(−3) (§§3.10, 5.1). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- Use C6’s normality, compactification maps and minimal-boundary codimension hypotheses; at g=1 the minimal boundary has codimension one.
- For bounded analytic weight families use AIP ADIC Proposition 8.4: the boundary lies in the ordinary locus, so the statement reduces to the structure sheaves of the ordinary formal Igusa tower modulo p^n, where the Koecher principle on normalized models (ShimuraCompactifications C5.22, every open and every coefficient ring including ℤ/p^n), its ordinary-locus form (C5.24) and the formal codimension-two extension (C5.26) apply for g>1. C6.11 is the arithmetic substrate for integral algebraic weights only.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O6/hilbert-cusp-forms`
- `ShimuraCompactifications:C6/roadmap/hilbert-toroidal-model`
- `ShimuraCompactifications:C6/roadmap/hilbert-near-ordinary-model`
- `ShimuraCompactifications:C6/roadmap/hilbert-boundary-ideal-pushforward`
- `AutomorphicBundles:B5/hilbert-cuspidal-boundary`
- `OverconvergentAutomorphicForms:O5/aip-comparison-naturality`
- `ShimuraCompactifications:C6/roadmap/arithmetic-koecher`
- `ShimuraCompactifications:C6/roadmap/hilbert-boundary-constant`
- `ShimuraCompactifications:C5/roadmap/normalized-koecher`
- `ShimuraCompactifications:C5/roadmap/ordinary-koecher`
- `ShimuraCompactifications:C5/roadmap/formal-hilbert-siegel-koecher`
- `HodgeTateAndCanonicalSubgroups:T5/igusa-torsor`

**Proof outline.**

1. Reduce to the ordinary locus, which contains the toroidal boundary (AIP ADIC Proposition 8.4 proof). Unravel the AIP sheaf there as the κ⁻¹-isotypic part of the structure sheaf of the ordinary Igusa tower (HodgeTateAndCanonicalSubgroups §5.1, ordinaryIgusaTower), work on formal models and dévisse modulo p^n. The ordinary open of the minimal compactification is normal and its complement in the open moduli has codimension at least two for g>1, so sections extend (ShimuraCompactifications C5.22 on that open, C5.26 on the formal model); pass to completions and invert p.
2. Compare the subcanonical sheaf by the ideal D, not by the extension theorem.
3. For degree one use B5’s compactified cusp expansion and its boundary constant term. O5 compares the coefficient lines on the compactified torsor.

**Source matches.**

- [AIP-ADIC-2016](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/Hilbert_adicfinal.pdf), §8.4, Proposition 8.4, pp.36–37 (statement p.37): The pushforward comparison is Koecher extension, not cuspidality.
- [BHW-2023](https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf), Remark 6.9, p.1759: The source introduces the boundary ideal separately from extension.

**Acceptance.**

- A section with nonzero q-constant term can extend by Koecher and still fail to be a cusp form.

#### Tame Hilbert Hecke operators

**ID:** `OverconvergentAutomorphicForms:O6/tame-hilbert-hecke`. **Kind:** construction. **Planet:** Hilbert Hecke operators.

**Statement.** For a prime ideal a∤pN and its moduli correspondence X_c←^{π1}C_a→^{π2}X_{ca}, use the canonical coefficient identification θ:π2*ω→π1*ω from the prime-to-p Hodge–Tate isogeny. Set T_a=q_a⁻¹Tr_{π1} θ π2*, q_a=|O_F/a|. It maps the ca component to c, preserves radii, extends to the boundary, and descends to arithmetic polarisation classes.

**Proposed declaration:** `TauCeti.Overconvergent.tame_hilbert_hecke`.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the geometric Hilbert moduli schemes; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. Arithmetic finite-level torsors are taken over the quotient stacks, or on coarse spaces over the respective action-free loci supplied by H3.6, H4.17 and S5.8; N≥4 alone does not assert freeness of a polarization or diagonal action.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε<1/(c_p p^m) for p≥3 and 0≤ε≤1/(4·2^m) for p=2 (HodgeTateAndCanonicalSubgroups §4.6; the endpoint is excluded for p≥3); when m=1 at a prime ramified in F also ε≤p^(−3) (§§3.10, 5.1). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- π1 is finite locally free of degree q_a+1 for the prime cyclic-subgroup correspondence. The normalization is 1/q_a, not reciprocal degree.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O4/polarisation-class-forms`
- `OverconvergentAutomorphicForms:O2/hilbert-cocycle-law`
- `HilbertModularVarietiesAndShimuraCurves:H3/arithmetic-quotient`
- `HilbertModularVarietiesAndShimuraCurves:H3/ideal-class-comparisons`
- `ShimuraCompactifications:C6/roadmap/hilbert-toroidal-model`
- `ShimuraCompactifications:C6/roadmap/hilbert-near-ordinary-model`
- `ShimuraCompactifications:C6/roadmap/hilbert-boundary-ideal-pushforward`
- `AdicSpacesPartII:R3/pull-identify-trace`
- `AdicSpacesPartII:R3/analytic-trace-finite-locally-free`
- `AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product`
- `HilbertModularVarietiesAndShimuraCurves:H1/hilbert-pel-instance`
- `HilbertModularVarietiesAndShimuraCurves:H1/good-representability`
- `HilbertModularVarietiesAndShimuraCurves:H4/effective-level-groups`
- `HilbertModularVarietiesAndShimuraCurves:H4/finite-level-torsors`
- `HilbertModularVarietiesAndShimuraCurves:H3/hilbert-hecke-isogenies`
- `HilbertModularVarietiesAndShimuraCurves:H4/integral-gamma0`

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

**ID:** `OverconvergentAutomorphicForms:O6/wild-hilbert-hecke`. **Kind:** construction. **Planet:** Wild Hilbert Hecke operators.

**Statement.** For 𝔭|p, q_𝔭=|O_F/𝔭|, e=v_𝔭(p), finite n≥1 and l=ne+1, use the anticanonical extension correspondence with π1 degree q_𝔭 and π2 quotient by D[𝔭]. Let u_𝔭=diag(ϖ_𝔭,1); its geometric action, transported through the O4 arithmetic comparisons when needed, gives an integral coefficient map π2*ω+→π1*ω+ independently of the chosen generator of 𝔭O_p. Define U_𝔭=q_𝔭⁻¹Trπ1 θ_𝔭 π2*. It improves the 𝔭-partial Hasse bound, not all partial bounds in general.

**Proposed declaration:** `TauCeti.Overconvergent.wild_hilbert_hecke`.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the geometric Hilbert moduli schemes; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. Arithmetic finite-level torsors are taken over the quotient stacks, or on coarse spaces over the respective action-free loci supplied by H3.6, H4.17 and S5.8; N≥4 alone does not assert freeness of a polarization or diagonal action.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε<1/(c_p p^m) for p≥3 and 0≤ε≤1/(4·2^m) for p=2 (HodgeTateAndCanonicalSubgroups §4.6; the endpoint is excluded for p≥3); when m=1 at a prime ramified in F also ε≤p^(−3) (§§3.10, 5.1). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- The actual extra level and anticanonical subgroup condition are C[𝔭^{en}]=D[𝔭^{en}]. The chosen domains must support this correspondence.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O4/polarisation-class-forms`
- `OverconvergentAutomorphicForms:O2/hilbert-automorphy-factor`
- `HilbertModularVarietiesAndShimuraCurves:H3/arithmetic-quotient`
- `HilbertModularVarietiesAndShimuraCurves:H3/ideal-class-comparisons`
- `HodgeTateAndCanonicalSubgroups:T4/canonical-anticanonical-loci`
- `HodgeTateAndCanonicalSubgroups:T4/atkin-lehner-anticanonical`
- `HodgeTateAndCanonicalSubgroups:T4/hodge-tate-coordinate`
- `HodgeTateAndCanonicalSubgroups:T4/period-map-inclusions`
- `ShimuraCompactifications:C6/roadmap/hilbert-toroidal-model`
- `ShimuraCompactifications:C6/roadmap/hilbert-near-ordinary-model`
- `ShimuraCompactifications:C6/roadmap/hilbert-boundary-ideal-pushforward`
- `AdicSpacesPartII:R3/pull-identify-trace`
- `AdicSpacesPartII:R3/analytic-trace-finite-locally-free`
- `AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product`
- `HilbertModularVarietiesAndShimuraCurves:H1/hilbert-pel-instance`
- `HilbertModularVarietiesAndShimuraCurves:H1/good-representability`
- `HilbertModularVarietiesAndShimuraCurves:H4/effective-level-groups`
- `HilbertModularVarietiesAndShimuraCurves:H4/finite-level-torsors`
- `HilbertModularVarietiesAndShimuraCurves:H3/hilbert-hecke-isogenies`
- `HilbertModularVarietiesAndShimuraCurves:H4/integral-gamma0`
- `HodgeTateAndCanonicalSubgroups:T3/hilbert-canonical-subgroup`
- `HodgeTateAndCanonicalSubgroups:T3/quotient-hasse-radius`
- `OverconvergentAutomorphicForms:O4/weil-pairing-comparison`
- `OverconvergentAutomorphicForms:O4/finite-polarisation-descent`

**Proof outline.**

1. Import the p-level moduli correspondence, its degree and partial-radius image from H3/T4/C6.
2. Compute u_𝔭* z=ϖ_𝔭 z and conjugation γ↦(a,ϖb;ϖ⁻¹c,d); the cz+d factor is unchanged.
3. For the geometric G* coefficient, changing ϖ by a unit changes the level action by a diagonal element with j=1, proving generator independence. Define the arithmetic coefficient map by transporting this map through O4's Weil-pairing and finite-polarisation comparisons. A raw arithmetic pullback also sees w(det); j=1 alone does not cancel it. The transported map uses only weights evaluated on units, never w(ϖ) for a nonunit.
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

- For 𝔭|p, q_𝔭=|O_F/𝔭|, e=v_𝔭(p), finite n≥1 and l=ne+1, use the anticanonical extension correspondence with π1 degree q_𝔭 and π2 quotient by D[𝔭]. Let u_𝔭=diag(ϖ_𝔭,1); its geometric action, transported through the O4 arithmetic comparisons when needed, gives an integral coefficient map π2*ω+→π1*ω+ independently of the chosen generator of 𝔭O_p. Define U_𝔭=q_𝔭⁻¹Trπ1 θ_𝔭 π2*. It improves the 𝔭-partial Hasse bound, not all partial bounds in general.

#### Hilbert diamond operators

**ID:** `OverconvergentAutomorphicForms:O6/hilbert-diamond-operators`. **Kind:** construction.

**Statement.** For a finite tame-level normalizer element d inducing a level automorphism on the actual Hilbert moduli scheme, define ⟨d⟩ by pullback of sections with the induced coefficient identification. The multiplication law is the one of that level action, with inverse-base-action convention fixed as in B5; boundary ideals and arithmetic polarisation descent are retained.

**Proposed declaration:** `TauCeti.Overconvergent.hilbert_diamond_operators`.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the geometric Hilbert moduli schemes; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. Arithmetic finite-level torsors are taken over the quotient stacks, or on coarse spaces over the respective action-free loci supplied by H3.6, H4.17 and S5.8; N≥4 alone does not assert freeness of a polarization or diagonal action.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε<1/(c_p p^m) for p≥3 and 0≤ε≤1/(4·2^m) for p=2 (HodgeTateAndCanonicalSubgroups §4.6; the endpoint is excluded for p≥3); when m=1 at a prime ramified in F also ε≤p^(−3) (§§3.10, 5.1). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- Use a finite tame level automorphism, with its actual action on the coefficient torsor. This is separate from the central projective quotient and positive-unit polarisation action.

**Direct inputs.**

- `HilbertModularVarietiesAndShimuraCurves:H3/arithmetic-quotient`
- `HilbertModularVarietiesAndShimuraCurves:H3/ideal-class-comparisons`
- `AutomorphicBundles:B5/hecke-section-operator`
- `OverconvergentAutomorphicForms:O1/coefficient-descent-functoriality`
- `OverconvergentAutomorphicForms:O4/polarisation-choice-independence`
- `ShimuraCompactifications:C6/roadmap/hilbert-toroidal-model`
- `ShimuraCompactifications:C6/roadmap/hilbert-near-ordinary-model`
- `ShimuraCompactifications:C6/roadmap/hilbert-boundary-ideal-pushforward`
- `AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product`
- `HilbertModularVarietiesAndShimuraCurves:H1/hilbert-pel-instance`
- `HilbertModularVarietiesAndShimuraCurves:H1/good-representability`
- `HilbertModularVarietiesAndShimuraCurves:H4/effective-level-groups`
- `HilbertModularVarietiesAndShimuraCurves:H4/finite-level-torsors`

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

**ID:** `OverconvergentAutomorphicForms:O6/aip-hecke-equivariance`. **Kind:** theorem. **Planet:** Hecke-equivariant AIP comparison.

**Statement.** The geometric and arithmetic O5 integral/rational comparison maps intertwine tame T_a, finite tame diamond actions and wild U_𝔭 on their actual section modules, with the same q_a⁻¹ and q_𝔭⁻¹ factors. For wild operators the rational normalized action and integral renormalized action are distinguished.

**Proposed declaration:** `TauCeti.Overconvergent.aip_hecke_equivariance`.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the geometric Hilbert moduli schemes; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. Arithmetic finite-level torsors are taken over the quotient stacks, or on coarse spaces over the respective action-free loci supplied by H3.6, H4.17 and S5.8; N≥4 alone does not assert freeness of a polarization or diagonal action.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε<1/(c_p p^m) for p≥3 and 0≤ε≤1/(4·2^m) for p=2 (HodgeTateAndCanonicalSubgroups §4.6; the endpoint is excluded for p≥3); when m=1 at a prime ramified in F also ε≤p^(−3) (§§3.10, 5.1). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- All correspondence and AIP chart hypotheses used above hold on the common source and target domains.
- Inherit geometric-aip-comparison’s explicit T5 radius bound and scaled source-domain admission wherever the Hodge–Tate frame comparison is used, on both source and target of each comparison diagram.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O5/geometric-aip-comparison`
- `OverconvergentAutomorphicForms:O5/arithmetic-aip-comparison`
- `OverconvergentAutomorphicForms:O6/tame-hilbert-hecke`
- `OverconvergentAutomorphicForms:O6/wild-hilbert-hecke`
- `OverconvergentAutomorphicForms:O6/hilbert-diamond-operators`
- `HodgeTateAndCanonicalSubgroups:T5/igusa-torsor`
- `HodgeTateAndCanonicalSubgroups:T5/integral-differential-lattice`
- `HodgeTateAndCanonicalSubgroups:T5/integral-lattice-properties`
- `HodgeTateAndCanonicalSubgroups:T5/aip-torsor`
- `HodgeTateAndCanonicalSubgroups:T5/hodge-tate-aip-lift`
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
- Tame level N is prime to p and sufficiently small for the geometric Hilbert moduli schemes; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. Arithmetic finite-level torsors are taken over the quotient stacks, or on coarse spaces over the respective action-free loci supplied by H3.6, H4.17 and S5.8; N≥4 alone does not assert freeness of a polarization or diagonal action.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε<1/(c_p p^m) for p≥3 and 0≤ε≤1/(4·2^m) for p=2 (HodgeTateAndCanonicalSubgroups §4.6; the endpoint is excluded for p≥3); when m=1 at a prime ramified in F also ε≤p^(−3) (§§3.10, 5.1). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- Use AutomorphicBundles B5.16–B5.18 with their exact algebraic-weight, prime-to-p level and coefficient-ring hypotheses for classical expansions; p-level and family expansions are O6/padic-hilbert-q-expansion.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O5/aip-comparison-naturality`
- `OverconvergentAutomorphicForms:O6/aip-hecke-equivariance`
- `AutomorphicBundles:B5/hilbert-cusp-expansion`
- `AutomorphicBundles:B5/hilbert-expansion-principle`
- `AutomorphicBundles:B5/hilbert-cuspidal-boundary`
- `AutomorphicBundles:B5/hecke-expansion-compatibility`
- `ShimuraCompactifications:C6/roadmap/hilbert-toroidal-model`
- `ShimuraCompactifications:C6/roadmap/hilbert-near-ordinary-model`
- `ShimuraCompactifications:C6/roadmap/hilbert-boundary-ideal-pushforward`
- `AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product`
- `ShimuraCompactifications:C6/roadmap/hilbert-q-expansion-comparison`
- `ShimuraCompactifications:C6/roadmap/hilbert-p-level-boundary-comparison`
- `OverconvergentAutomorphicForms:O6/padic-hilbert-q-expansion`

**Proof outline.**

1. Pull both coefficient sections to the same Tate semi-abelian cusp chart. T5’s chosen differential/HT frame evaluates to the same formal trivialization.
2. Use B5’s cusp-expansion and boundary criteria for classical specialisations; retain the coefficient line rather than pretending expansions are scalar at every cusp.
3. For the full coefficient sheaf use the family expansion O6/padic-hilbert-q-expansion. Compare correspondence expansions by the pull-identify-trace formula and the declared normalizers.

**Source matches.**

- [BHW-2023](https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf), Remark 6.9; Proposition 10.8, pp.1759,1791–1792: The torsor comparison and boundary-compatible correspondence yield the expansion diagrams.

**Acceptance.**

- For F=Q the cusp constant coefficient is zero precisely for cusp sections.
- A classical expansion principle at prime-to-p full level is not applied directly to an Iwahori family; the injectivity used needs cusps meeting every component of the ordinary Igusa tower.

#### Fixed-radius cusp Banach modules

**ID:** `OverconvergentAutomorphicForms:O6/fixed-cusp-banach-modules`. **Kind:** theorem. **Planet:** Cusp Banach modules.

**Statement.** At finite wild level and an admissible open affinoid U=Spa(A,A+) of the arithmetic weight space, with κ locally n_an-analytic and partial Hasse bounds 0<v_i<1/p^{n_an}, on a selected cofinal global-Hasse minimal affinoid neighbourhood inside the partial-radius region, the fixed-radius cusp module is a projective Banach A-module in the (Pr) sense: a continuous direct summand of an orthonormalisable Banach module. Weight specialisation to the source’s coefficient-field points is surjective. This is not finite projectivity, and no such claim is made for every noncuspidal or infinite-level section module.

**Proposed declaration:** `TauCeti.Overconvergent.fixed_cusp_banach_modules`.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the geometric Hilbert moduli schemes; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. Arithmetic finite-level torsors are taken over the quotient stacks, or on coarse spaces over the respective action-free loci supplied by H3.6, H4.17 and S5.8; N≥4 alone does not assert freeness of a polarization or diagonal action.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε<1/(c_p p^m) for p≥3 and 0≤ε≤1/(4·2^m) for p=2 (HodgeTateAndCanonicalSubgroups §4.6; the endpoint is excluded for p≥3); when m=1 at a prime ramified in F also ε≤p^(−3) (§§3.10, 5.1). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- Use the sufficiently small tame level, compactified coefficient model, positive cofinal partial-radius range and finite-level cusp vanishing hypotheses of AIP CUSP Theorems 3.16 and 4.4. For arithmetic descent work in characteristic zero, where the finite Δ projector is defined.
- Choose the refined global-Hasse strict affinoid neighbourhood of AIP CUSP Proposition 3.22’s Hattori footnote. Arbitrary simultaneous partial-radius opens are not assumed affinoid.
- For direct use of AIP CUSP Theorem4.4, U is an admissible open affinoid of the arithmetic weight space, not an arbitrary bounded affinoid mapping to it. At finite wild level use the O2 Atkin–Lehner transport to tame level, with the scaled radius and boundary-compatible coefficient transport supplied by C6; arbitrary weight base change requires a separate completed scalar-extension theorem.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O6/hilbert-cusp-forms`
- `OverconvergentAutomorphicForms:O5/arithmetic-aip-comparison`
- `ShimuraCompactifications:C6/roadmap/hilbert-toroidal-model`
- `ShimuraCompactifications:C6/roadmap/hilbert-near-ordinary-model`
- `ShimuraCompactifications:C6/roadmap/hilbert-boundary-ideal-pushforward`
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
- Tame level N is prime to p and sufficiently small for the geometric Hilbert moduli schemes; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. Arithmetic finite-level torsors are taken over the quotient stacks, or on coarse spaces over the respective action-free loci supplied by H3.6, H4.17 and S5.8; N≥4 alone does not assert freeness of a polarization or diagonal action.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε<1/(c_p p^m) for p≥3 and 0≤ε≤1/(4·2^m) for p=2 (HodgeTateAndCanonicalSubgroups §4.6; the endpoint is excluded for p≥3); when m=1 at a prime ramified in F also ε≤p^(−3) (§§3.10, 5.1). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- Use C6’s coherent cusp pushforward and the relative compactness W,V required by AdicSpacesPartII:R3. Source S(W) satisfies (Pr).
- Choose the same cofinal global-Hasse affinoid models as fixed-cusp-banach-modules, with the required relative compact containment after the controlling radius improvement.
- Use the admissible open arithmetic weight affinoid of fixed-cusp-banach-modules. An arbitrary bounded affinoid weight pullback needs a separate completed scalar-extension result preserving (Pr).

**Direct inputs.**

- `OverconvergentAutomorphicForms:O6/fixed-cusp-banach-modules`
- `AdicSpacesPartII:R3/restriction-strictly-completely-continuous`
- `LocallyAnalyticDistributions:L4/completely-continuous`
- `ShimuraCompactifications:C6/roadmap/hilbert-toroidal-model`
- `ShimuraCompactifications:C6/roadmap/hilbert-near-ordinary-model`
- `ShimuraCompactifications:C6/roadmap/hilbert-boundary-ideal-pushforward`

**Proof outline.**

1. Apply AdicSpacesPartII:R3/restriction-strictly-completely-continuous to the coherent sections: after a continuous surjection from a topologically free Banach module, the restriction is strictly completely continuous.
2. Use the (Pr) splitting of fixed-cusp-banach-modules to remove that presentation; finite-rank approximation is preserved under bounded pre/post composition.
3. Use LAD L4/completely-continuous for the exact operator notion. For the controlling product choose V at improved partial radius v/p.

**Source matches.**

- [AIP-CUSP-2016](https://www.imo.universite-paris-saclay.fr/~pilloni/AIP2.pdf), Lemma 3.27 and proof, p.24: The compactness proof factors through restriction between the nested Hasse neighbourhoods.

**Acceptance.**

- Restriction along an equality of domains is the identity and is not completely continuous on an infinite orthonormalisable module.

#### Controlling Hilbert U operator

**ID:** `OverconvergentAutomorphicForms:O6/controlling-hilbert-operator`. **Kind:** construction. **Planet:** Controlling Hilbert U operator.

**Statement.** On finite-level arithmetic cusp forms over a bounded affinoid family define U_p=∏_{𝔭|p}U_𝔭^{e_𝔭}, e_𝔭=v_𝔭(p), using the commuting arithmetic operators and polarisation transports. The product maps through the neighbourhood with every partial Hasse bound v_i/p; its total normalizer is (∏q_𝔭^{e_𝔭})⁻¹=p^(−g).

**Proposed declaration:** `TauCeti.Overconvergent.controlling_hilbert_operator`.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the geometric Hilbert moduli schemes; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. Arithmetic finite-level torsors are taken over the quotient stacks, or on coarse spaces over the respective action-free loci supplied by H3.6, H4.17 and S5.8; N≥4 alone does not assert freeness of a polarization or diagonal action.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε<1/(c_p p^m) for p≥3 and 0≤ε≤1/(4·2^m) for p=2 (HodgeTateAndCanonicalSubgroups §4.6; the endpoint is excluded for p≥3); when m=1 at a prime ramified in F also ε≤p^(−3) (§§3.10, 5.1). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- Use compatible finite-level partial-radius correspondences and a fixed positive radius vector v. The arithmetic class quotient gives a canonical endomorphism; G* requires the stated polarisation representative maps.
- Choose the same cofinal global-Hasse affinoid models as fixed-cusp-banach-modules, with the required relative compact containment after the controlling radius improvement.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O6/wild-hilbert-hecke`
- `OverconvergentAutomorphicForms:O4/polarisation-choice-independence`
- `HilbertModularVarietiesAndShimuraCurves:H3/arithmetic-quotient`
- `HilbertModularVarietiesAndShimuraCurves:H3/ideal-class-comparisons`
- `HodgeTateAndCanonicalSubgroups:T4/canonical-anticanonical-loci`
- `HodgeTateAndCanonicalSubgroups:T4/atkin-lehner-anticanonical`
- `HodgeTateAndCanonicalSubgroups:T4/hodge-tate-coordinate`
- `HodgeTateAndCanonicalSubgroups:T4/period-map-inclusions`
- `AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product`
- `HilbertModularVarietiesAndShimuraCurves:H3/hilbert-hecke-isogenies`
- `HodgeTateAndCanonicalSubgroups:T3/hilbert-canonical-subgroup`
- `HodgeTateAndCanonicalSubgroups:T3/quotient-hasse-radius`

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
- Tame level N is prime to p and sufficiently small for the geometric Hilbert moduli schemes; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. Arithmetic finite-level torsors are taken over the quotient stacks, or on coarse spaces over the respective action-free loci supplied by H3.6, H4.17 and S5.8; N≥4 alone does not assert freeness of a polarization or diagonal action.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε<1/(c_p p^m) for p≥3 and 0≤ε≤1/(4·2^m) for p=2 (HodgeTateAndCanonicalSubgroups §4.6; the endpoint is excluded for p≥3); when m=1 at a prime ramified in F also ε≤p^(−3) (§§3.10, 5.1). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
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
- Tame level N is prime to p and sufficiently small for the geometric Hilbert moduli schemes; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. Arithmetic finite-level torsors are taken over the quotient stacks, or on coarse spaces over the respective action-free loci supplied by H3.6, H4.17 and S5.8; N≥4 alone does not assert freeness of a polarization or diagonal action.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε<1/(c_p p^m) for p≥3 and 0≤ε≤1/(4·2^m) for p=2 (HodgeTateAndCanonicalSubgroups §4.6; the endpoint is excluded for p≥3); when m=1 at a prime ramified in F also ε≤p^(−3) (§§3.10, 5.1). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- Use integral coefficient maps, trace preserving O+ on the supplied finite locally free integral correspondence models, and integral polarisation transport.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O6/tame-hilbert-hecke`
- `OverconvergentAutomorphicForms:O6/wild-hilbert-hecke`
- `OverconvergentAutomorphicForms:O6/controlling-hilbert-operator`
- `AdicSpacesPartII:R3/analytic-trace-finite-locally-free`
- `PerfectoidSpaces:P9/weight-extension-sheaf-equalizer`
- `PerfectoidSpaces:P9/function-descent-along-tower`
- `HilbertModularVarietiesAndShimuraCurves:H4/effective-level-groups`
- `HilbertModularVarietiesAndShimuraCurves:H4/finite-level-torsors`

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
- Tame level N is prime to p and sufficiently small for the geometric Hilbert moduli schemes; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. Arithmetic finite-level torsors are taken over the quotient stacks, or on coarse spaces over the respective action-free loci supplied by H3.6, H4.17 and S5.8; N≥4 alone does not assert freeness of a polarization or diagonal action.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Use the precise formal Igusa normalization, boundary divisor and sufficiently small analytic character χ of AIP CUSP §3.6. The structural vanishing for torsion invertible sheaves twisted by −D is O6/hilbert-cusp-higher-vanishing.
- The chosen minimal neighbourhood is an actual global-Hasse affinoid strict neighbourhood inside the partial-radius region; AIP CUSP Proposition 3.22’s Hattori footnote explicitly requires this refinement.

**Direct inputs.**

- `ShimuraCompactifications:C6/roadmap/hilbert-toroidal-model`
- `ShimuraCompactifications:C6/roadmap/hilbert-near-ordinary-model`
- `ShimuraCompactifications:C6/roadmap/hilbert-boundary-ideal-pushforward`
- `AdicSpacesPartII:R3/tate-acyclicity-finite-modules`
- `OverconvergentAutomorphicForms:O5/aip-line-and-gluing`
- `OverconvergentAutomorphicForms:O6/hilbert-cusp-higher-vanishing`

**Proof outline.**

1. Use the formal cusp description supplied by C6: the completed torus embedding fan modulo its unit group, with positive support for O(−D).
2. The formal-functions theorem reduces higher direct-image vanishing to the formal cusp neighbourhoods, where O6/hilbert-cusp-higher-vanishing gives R^i h′*L(−D)=0, i>0, for torsion invertible L (AIP CUSP Appendix Proposition 6.4; AIP ADIC Theorem 8.2).
3. AIP Lemma 3.19 identifies the small analytic character line modulo p with O. Lift the structural vanishing by p-adic completeness/Nakayama as in Corollary 3.20.
4. On the refined minimal affinoid use AdicSpacesPartII R3 finite-module Tate acyclicity; apply finite characteristic-zero projectors only after rationalisation.

**Source matches.**

- [AIP-CUSP-2016](https://www.imo.universite-paris-saclay.fr/~pilloni/AIP2.pdf), Theorem 3.17, Corollary 3.20 and Proposition 3.22 with footnote, pp.18–21: Cuspidal vanishing and the explicitly refined affinoid neighbourhood supply the Banach argument.

**Acceptance.**

- The argument uses −D and is not asserted for every noncuspidal coefficient sheaf.

#### Higher direct images of cusp ideals to the minimal compactification

**ID:** `OverconvergentAutomorphicForms:O6/hilbert-cusp-higher-vanishing`. **Kind:** theorem.

**Statement.** Let h′:M̄_G→M*_G be the map from a toroidal to the minimal compactification of the arithmetic Hilbert modular variety at tame level N (over the integral base of the models, including torsion coefficients), D the toroidal boundary and L a torsion invertible sheaf on M̄_G (some power L^{⊗e} is trivial, e prime to p or not). Then R^i h′*(L(−D))=0 for every i>0. The same holds on the formal completions along the special fibre and after normalized admissible blow-up along the Hasse ideal.

**Proposed declaration:** `TauCeti.Overconvergent.hilbert_cusp_higher_vanishing`.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the geometric Hilbert moduli schemes; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. Arithmetic finite-level torsors are taken over the quotient stacks, or on coarse spaces over the respective action-free loci supplied by H3.6, H4.17 and S5.8; N≥4 alone does not assert freeness of a polarization or diagonal action.
- Use the fine Hilbert toroidal compactification of ShimuraCompactifications C6.21 for an admissible fan system with the unit-group action, its minimal compactification and the cusp ideal comparison of C6.42.
- L(−D) means L⊗I_D with I_D the ideal of the reduced boundary divisor; the statement is false for L itself (without −D) in general, where R¹ can be nonzero at the cusps.
- For g=1 the minimal compactification is the toroidal one and the statement is trivial.

**Direct inputs.**

- `ShimuraCompactifications:C6/roadmap/hilbert-toroidal-model`
- `ShimuraCompactifications:C6/roadmap/hilbert-boundary-ideal-pushforward`
- `ShimuraCompactifications:C6/roadmap/hilbert-near-ordinary-model`
- `ShimuraCompactifications:C3/roadmap/toric-structure-sheaf-vanishing`
- `ShimuraCompactifications:C3/roadmap/refinement-boundary-ideal`
- `HilbertModularVarietiesAndShimuraCurves:H3/arithmetic-quotient`
- `ShimuraCompactifications:C3`

**Proof outline.**

1. Compute the higher direct images on completed cusp neighbourhoods using proper formal functions for algebraic spaces (ShimuraCompactifications C3.6a). The toroidal completion is the quotient of the formal torus embedding attached to Σ_c by the cusp unit group U. This contraction to the minimal model is different from a refinement of fans.
2. For the trivial line, choose a U-invariant polarization function h and its ample divisor D_h=−∑_ρ a_ρD_ρ (AIP CUSP Definition 6.1 and Proposition 6.2). Take ℓ>max a_ρ. The toric power map Φ_ℓ is finite flat and U-equivariant, and Lemma 6.3 gives a U-equivariant split injection O(⌊D_h/ℓ⌋)=O(−D)→Φ_ℓ*O(D_h). Its monomial splitting uses no division by ℓ and remains available in residue characteristic dividing ℓ.
3. Complete along the boundary and descend this split map to the formal quotient by U. The cohomology of O(−D) is a direct summand of that of O(D_h), since Φ_ℓ is finite. After replacing h by a sufficiently large positive multiple, formal ample vanishing kills the latter in positive degree (AIP CUSP Proposition 6.4, pp.32–33). This is not vanishing of unrestricted group cohomology of U.
4. For a torsion line L use the torsion-twisted extension of this split-power-map argument explicitly stated in the proof of AIP ADIC Theorem 8.2, p.35; retain L throughout the equivariant splitting and ample-vanishing step. Its order is not assumed prime to p, and no degree-e finite étale trivialization or averaging by 1/e is used. Formal functions gives the integral and completed statements. The normalized Hasse modification is an isomorphism near the ordinary cusps, so the same local calculation proves the modified-model assertion.

**Source matches.**

- [AIP-CUSP-2016](https://www.imo.universite-paris-saclay.fr/~pilloni/AIP2.pdf), Appendix, Definition 6.1, Proposition 6.2, Lemma 6.3 and Proposition 6.4, pp.31–33; Theorem 3.17, p.18: A U-equivariant split toric power map makes the cohomology of the cusp ideal a direct summand of ample-twist cohomology on the formal quotient; this proves the contraction vanishing.
- [AIP-ADIC-2016](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/Hilbert_adicfinal.pdf), Theorem 8.2 and its proof, p.35: The same vanishing holds for torsion invertible sheaves twisted by −D, by the proof of the appendix proposition without change.

**Acceptance.**

- For L=O this is the structural vanishing R^i h′*O(−D)=0, i>0.
- The boundary twist is essential: the theorem makes no vanishing assertion for R^i h′*L without −D. In particular, toric acyclicity along a refinement alone does not establish vanishing for the contraction to a minimal cusp.
- Consequence used in O6: the pushforward of a cusp coefficient sheaf to the minimal model computes its cohomology, so sections over an affinoid of the minimal model are acyclic.

#### q-expansions of overconvergent Hilbert families

**ID:** `OverconvergentAutomorphicForms:O6/padic-hilbert-q-expansion`. **Kind:** construction.

**Statement.** For a bounded smooth weight family over U=Spa(A,A⁺), a finite p-level n≥0, and an unramified cusp label c together with a Tate uniformization, a splitting and a compatible Igusa generator, construct the A-linear expansion q_c:H⁰(X(ε)×U,ω^κ)→D_{c,κ}⟦q^ξ:ξ∈M_c^+∪{0}⟧^{U_c}. Here D_{c,κ} is the analytic coefficient line obtained by evaluating the κ⁻¹-eigenfunction on the chosen Tate frame, with its κ-dependent cusp-unit action; the series are completed along the toroidal boundary with the support condition of the cusp chart. These choices trivialize the coefficient line locally, and changing them transports both coefficients and exponents. At an algebraic weight D_{c,κ} specializes to the classical coefficient line of AutomorphicBundles B5.16, after the conversion (w,t)↦(ν=w,w_AIP=t⁻¹). Expansions commute with radius, weight and finite-level boundary maps. If the chosen cusp lifts meet every connected component of the ordinary Igusa cover at the finite level used to trivialize the weight on each analytic chart, their simultaneous expansion is injective; an infinite tower statement is understood through these finite-level charts.

**Proposed declaration:** `TauCeti.Overconvergent.padicHilbertQExpansion`.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the geometric Hilbert moduli schemes; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. Arithmetic finite-level torsors are taken over the quotient stacks, or on coarse spaces over the respective action-free loci supplied by H3.6, H4.17 and S5.8; N≥4 alone does not assert freeness of a polarization or diagonal action.
- Use the cusp charts of ShimuraCompactifications C6.21,C6.38 and the finite-p-level boundary maps C6.48. Retain the cusp fractional exponent lattice, chosen Tate splitting and Igusa generator. B5.16 supplies only algebraic coefficient lines; D_{c,κ} for an analytic weight is constructed here by the actual AIP frame and its transformation law.
- The weight family has image in an affinoid of weight space and a common radius, as in O0/bounded-weight-families; ε is in the range of O2/admitted-hilbert-domain.
- The sufficient injectivity condition concerns the cusp lifts on every relevant ordinary Igusa component, with ordinary density in each anticanonical component. A component condition on the Hilbert base alone does not automatically verify this condition. The smooth weight base ensures that the normality/identity-principle argument is applicable.

**Direct inputs.**

- `ShimuraCompactifications:C6/roadmap/hilbert-toroidal-model`
- `ShimuraCompactifications:C6/roadmap/hilbert-q-expansion-comparison`
- `ShimuraCompactifications:C6/roadmap/hilbert-p-level-boundary-comparison`
- `ShimuraCompactifications:C6/roadmap/hilbert-near-ordinary-model`
- `AutomorphicBundles:B5/hilbert-cusp-expansion`
- `AutomorphicBundles:B5/hilbert-expansion-principle`
- `HodgeTateAndCanonicalSubgroups:T5/igusa-torsor`
- `OverconvergentAutomorphicForms:O5/aip-independent-coefficients`
- `OverconvergentAutomorphicForms:O0/weight-comparison`
- `OverconvergentAutomorphicForms:O0/bounded-weight-families`

**Proof outline.**

1. Restrict to the completed toroidal chart: cusps are ordinary, so this chart lies in each admitted Hasse neighbourhood (C6.46). Its topology and positive-exponent support condition are part of the expansion target.
2. The Tate object and chosen Igusa generator give the modified differential frame. Evaluation of an actual κ⁻¹-eigenfunction defines the coefficient-line-valued series. Under a cusp unit the generator, differential and exponents transform together; use this transformation to define the U_c-action on D_{c,κ} and prove the required invariant relation. No weight-independent scalar target or choice-free Igusa generator is assumed.
3. Functoriality of the Tate object, the frames and C6.48 gives the radius and level diagrams; weight pullback commutes with evaluation. At algebraic weights, identify the frame line with B5.16 after O0/weight-comparison. Vanishing of all cusp constants agrees with the boundary ideal.
4. For injectivity work on each finite ordinary Igusa chart trivializing the coefficient action. Zero expansions give zero germs on the chosen completed cusp neighbourhoods; use the normal componentwise q-expansion/identity argument and the stipulated component coverage there. Restricting from a smooth anticanonical component to its dense ordinary open is injective, so the original section vanishes. Do not extend the algebraic arbitrary-coefficient Iwahori assertion of B5.17 beyond its prime-to-p hypotheses.

**Source matches.**

- [AIP-ADIC-2016](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/Hilbert_adicfinal.pdf), §8.4, end of the proof of Proposition 8.4 and following paragraph, p.37: The restriction to the ordinary locus gives the Katz–Hida families, and with them q-expansions at the cusps.
- [BHW-2023](https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf), Remark 6.9 and Proposition 10.8, pp.1759, 1791–1792: Expansions at the cusps are compared through the torsor comparison and the boundary-compatible correspondences.

**Uses.**

- OverconvergentAutomorphicForms:O6/hilbert-q-expansion-comparison: compares the perfectoid and AIP expansions and the Hecke action on expansions.
- OverconvergentAutomorphicForms:O7/ordinary-hecke-expansions: restricts the expansion to ordinary Igusa forms.
- AIP ADIC §8.4, p.37: the restriction to the ordinary locus recovers the Katz–Hida families and their q-expansions.

**API.**

- `TauCeti.Overconvergent.padicHilbertQExpansion` (data): The A-linear map q_c into completed D_{c,κ}-valued series with the specified support condition and κ-dependent cusp-unit action.
- `TauCeti.Overconvergent.padicHilbertQExpansion_restrict` (functoriality): q_c commutes with restriction to a smaller radius and with change of p-level along the boundary maps.
- `TauCeti.Overconvergent.padicHilbertQExpansion_specialize` (compatibility): Specialization at an algebraic weight gives AutomorphicBundles' classical Hilbert q-expansion after the weight conversion.
- `TauCeti.Overconvergent.padicHilbertQExpansion_injective` (characterisation): If the chosen cusp lifts meet every relevant finite-level ordinary Igusa component, their simultaneous expansion is injective.
- `TauCeti.Overconvergent.padicHilbertQExpansion_constantTerm` (relation): The constant term at c vanishes for every cusp exactly on cusp sections.

**Unit tests.**

- `TauCeti.Overconvergent.Test.padicHilbertQExpansion_trivial_weight` (degenerate): For κ trivial, q_c(1)=1.
- `TauCeti.Overconvergent.Test.padicHilbertQExpansion_classical` (compatibility): For F=Q, n=0 and κ(x)=x^k, q_∞ agrees with the q-expansion of the corresponding classical form of weight k.
- `TauCeti.Overconvergent.Test.padicHilbertQExpansion_unit_invariance` (characterisation): Coefficients satisfy a(εξ)=a(ξ) twisted by the coefficient-line action for ε in the units of the cusp; an expansion that is not unit-invariant is not in the image.
- `TauCeti.Overconvergent.Test.padicHilbertQExpansion_iwahori_nonexample` (non-example): On an unrestricted disconnected Igusa chart, a nonzero function supported on a component omitted by the cusp lifts has zero selected expansions. A Hilbert-base component count alone does not verify the sufficient injectivity hypothesis for weighted forms.

**Acceptance.**

- For F=Q, n=0 and κ(x)=x^k this is the q-expansion of an overconvergent modular form of weight k at ∞.
- Component test: for unrestricted functions on a disconnected ordinary Igusa cover, a function supported on an omitted component has zero expansions at all chosen cusp lifts. For a descended weight-eigenspace, failure of the stated sufficient component condition calls for an additional descent argument; it does not by itself prove noninjectivity.
- Constant terms: a section is cuspidal (O6/hilbert-cusp-forms) exactly when q_c has vanishing constant term at every cusp of the level.

### OverconvergentAutomorphicForms:O7

Ordinary Igusa forms and the Hida comparison. Ordered Igusa completion, weighted ordinary functions, structural/line comparisons and compatible restriction, expansions and operators.

#### Completed ordinary Igusa functions

**ID:** `OverconvergentAutomorphicForms:O7/ordinary-completed-functions`. **Kind:** construction. **Planet:** Completed Igusa functions.

**Statement.** On each ordinary formal affinoid patch define V+ = lim_m colim_i H^0(Ig_i,O/p^m), with i the finite Igusa level. Sheafify the compatible patchwise construction to obtain the completed Igusa structural sheaf; V=V+[1/p]. Global ordinary p-adic forms are its sheaf sections. Do not exchange the two limits or replace sheafwise completion by an unconditional global-section formula.

**Proposed declaration:** `TauCeti.Overconvergent.ordinary_completed_functions`.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the geometric Hilbert moduli schemes; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. Arithmetic finite-level torsors are taken over the quotient stacks, or on coarse spaces over the respective action-free loci supplied by H3.6, H4.17 and S5.8; N≥4 alone does not assert freeness of a polarization or diagonal action.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Use T5’s actual ordinary formal Igusa tower with finite-etale transition maps. The inverse limit defines the formal completed structural ring; an identification with the actual analytic tower O+ is the separate O7 comparison target, with the exact hypotheses still recorded as a gap.

**Direct inputs.**

- `HodgeTateAndCanonicalSubgroups:T5/igusa-torsor`
- `HodgeTateAndCanonicalSubgroups:T5/integral-differential-lattice`
- `HodgeTateAndCanonicalSubgroups:T5/integral-lattice-properties`
- `HodgeTateAndCanonicalSubgroups:T5/aip-torsor`
- `HodgeTateAndCanonicalSubgroups:T5/hodge-tate-aip-lift`
- `PerfectoidSpaces:P9/weight-extension-sheaf-equalizer`
- `PerfectoidSpaces:P9/function-descent-along-tower`
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

**ID:** `OverconvergentAutomorphicForms:O7/ordinary-weighted-forms`. **Kind:** construction. **Planet:** Ordinary Igusa forms.

**Statement.** For the continuous bounded integral weight κ, define ordinary geometric forms as the completed Igusa functions satisfying f(tu)=κ(u)⁻¹f(t), for the actual O_p^× deck action. Arithmetic ordinary forms retain the w-polarisation/determinant action and its descent exactly as O4. Coefficients and topology are completed before taking this weight equalizer.

**Proposed declaration:** `TauCeti.Overconvergent.ordinary_weighted_forms`.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the geometric Hilbert moduli schemes; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. Arithmetic finite-level torsors are taken over the quotient stacks, or on coarse spaces over the respective action-free loci supplied by H3.6, H4.17 and S5.8; N≥4 alone does not assert freeness of a polarization or diagonal action.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Use compatible integral weight coefficients: modulo p^m the character is locally constant and factors through a finite quotient on each fixed affinoid formal patch.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O7/ordinary-completed-functions`
- `OverconvergentAutomorphicForms:O0/bounded-weight-families`
- `OverconvergentAutomorphicForms:O4/twisted-polarisation-action`
- `OverconvergentAutomorphicForms:O4/weil-pairing-comparison`
- `HodgeTateAndCanonicalSubgroups:T5/igusa-torsor`
- `HodgeTateAndCanonicalSubgroups:T5/integral-differential-lattice`
- `HodgeTateAndCanonicalSubgroups:T5/integral-lattice-properties`
- `HodgeTateAndCanonicalSubgroups:T5/aip-torsor`
- `HodgeTateAndCanonicalSubgroups:T5/hodge-tate-aip-lift`
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
- Tame level N is prime to p and sufficiently small for the geometric Hilbert moduli schemes; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. Arithmetic finite-level torsors are taken over the quotient stacks, or on coarse spaces over the respective action-free loci supplied by H3.6, H4.17 and S5.8; N≥4 alone does not assert freeness of a polarization or diagonal action.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- The ordinary base formal patch is flat, topologically of finite presentation, and formally smooth over the integral coefficient ring. Its finite Igusa covers are finite étale and surjective, so the ordinary finite-level special fibres are geometrically reduced. Use the open ordinary Rapoport moduli locus: arbitrary normalized positive-radius models are not included.
- For each finite level put A_i=O(Ig_i,an) with its uniform spectral norm and R_i=O(𝔐_i). At a discretely valued level R_i={a:‖a‖≤1} by the reduced-reduction criterion (AdicSpacesPartII R0), the ordinary charts being formally smooth (HodgeTateAndCanonicalSubgroups §5.1); after the coefficient-field extension this identity is the recorded open input. Pullback A_i→A_j is isometric, as its analytic map is surjective.
- The analytic affine tower has function ring A∞ equal to the separated spectral-norm completion of colim_i A_i and structural O+ equal to its power-bounded subring. Restrict on a compatible formal-affine basis. An infinite Igusa tower is not assumed perfectoid merely because its base field is perfectoid.
- For coefficient/weight completion retain the prescribed bounded lattice and the reduction and restriction contracts above. Arbitrary weights need not have a good-reduction integral model, and geometric O+ is not identified with a lattice tensor without a separate comparison.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O7/ordinary-completed-functions`
- `PerfectoidSpaces:P9/weight-extension-sheaf-equalizer`
- `PerfectoidSpaces:P9/function-descent-along-tower`
- `HodgeTateAndCanonicalSubgroups:T5/igusa-torsor`
- `HodgeTateAndCanonicalSubgroups:T5/integral-differential-lattice`
- `HodgeTateAndCanonicalSubgroups:T5/integral-lattice-properties`
- `HodgeTateAndCanonicalSubgroups:T5/aip-torsor`
- `HodgeTateAndCanonicalSubgroups:T5/hodge-tate-aip-lift`
- `AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product`
- `AdicSpacesPartII:R0/reduced-reduction-ring-of-definition`
- `AdicSpacesPartII:R3/uniform-spectral-seminorm`
- `ShimuraCompactifications:C6/roadmap/hilbert-ordinary-model-comparison`

**Proof outline.**

1. AIP §7.1 p30 makes the ordinary finite-level Igusa covers finite étale over the smooth ordinary special fibre. The ordinary discussion in §8.4 p37 places them in the Rapoport locus. T5 must lift these facts to the actual flat formally smooth ordinary charts and finite étale integral covers used by O7, including the coefficient-field base extension.
2. At a discretely valued model with uniformizer π, reduced special fibre gives the elementary norm argument: if a∉πR_i, its nonzero reduction has no nilpotent power, hence ‖a^k‖=1 for all k. After π-scaling this proves the π-adic norm is power-multiplicative and R_i is exactly the unit ball of A_i. The extension to the nondiscrete perfectoid coefficient field L is the finite-level unit-ball input owned by O7 and recorded in the gaps. P9 supplies tower descent, not this norm comparison; normality alone does not establish it.
3. Take the isometric union of the A_i. Its norm is power-multiplicative, hence so is the norm on its separated completion A∞. Consequently its power-bounded subring equals its unit ball.
4. Every element of the unit ball of A∞ can be approximated with error <1 by a finite-level element b. The ultrametric inequality makes ‖b‖≤1, so b∈R_i by the finite-level identity. Repeating to errors |p|^m shows that the unit ball is the p-adic completion of colim_i R_i. The p-adic and norm topologies agree on these integral rings, since p^m times the unit ball is the ball of radius |p|^m. Thus that completion is lim_m colim_i R_i/p^m, in exactly this order.
5. This proves the natural map is an isomorphism under the stated good-reduction and tower contracts: the ordinary formal Igusa charts are formally smooth with finite étale Igusa covers (HodgeTateAndCanonicalSubgroups §5.1; AIP ADIC §7.1), so their special fibres are reduced and R_i=A_i° at a discretely valued level (AdicSpacesPartII R0, reduced reduction); transition maps are isometric for the spectral norms (AdicSpacesPartIII R3); the ordered limit lim_m colim_i R_i/p^m is the p-adic completion of colim_i R_i, an identity of direct limits modulo p^m that needs no perfectoid hypothesis. The unit-ball identification after base change to a nondiscrete perfectoid L is recorded as an open input owned here. Heuer Proposition 3.8 alone gives only the map and formal-cocycle effectivity.
6. Check actions and restrictions at finite level; their continuous extensions give equivariance and glue the comparison. For weighted reductions use the compatible coefficient-lattice contract separately. No nonaffine global-section or limit interchange is invoked.

**Source matches.**

- [HEUER-2022](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/E9F0B6B21BA1F345142C7301C2EDDA28/S205050942200072Xa.pdf/line-bundles-on-rigid-spaces-in-the-v-topology.pdf), Proof of Proposition 3.8, p.16: Heuer constructs a natural map, not a general identification with O+. For the actual ordinary Igusa models the isomorphism is conditional on O7’s recorded unit-ball input after nondiscrete base change; it is not an additional P9 descent theorem.
- [AIP-ADIC-2016](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/Hilbert_adicfinal.pdf), §7.1 p30; Proposition8.4 and ordinary discussion p37: The ordinary special fibre is smooth and its Igusa trivialization covers are finite étale; ordinary points lie in the Rapoport locus. These give the good-reduction hypotheses of the completion argument.

**Acceptance.**

- The finite-level unit-ball identity and isometric transitions are checked before completion.
- The completed norm remains power-multiplicative; a unit-ball approximant has integral finite-level coefficients.
- The constant model O_K⟨pT,T²,T³⟩ fails the reduced-fibre/unit-ball hypothesis: T² is bounded, but T is power-bounded and not a structural formal function.
- A non-quasicompact ordinary base retains patchwise sheafification; no uniform global finite level is inferred.

#### Restriction to ordinary Igusa forms

**ID:** `OverconvergentAutomorphicForms:O7/ordinary-restriction`. **Kind:** construction. **Planet:** Ordinary restriction.

**Statement.** Restrict a fixed positive-radius geometric/arithmetic form to the ordinary locus and pull back to its Igusa frame, producing its weighted completed Igusa function. The maps are compatible with positive-radius restrictions and therefore give Mκ†→ordinary Igusa forms, with integral and cusp versions. No surjectivity onto all ordinary forms is part of this map.

**Proposed declaration:** `TauCeti.Overconvergent.ordinary_restriction`.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the geometric Hilbert moduli schemes; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. Arithmetic finite-level torsors are taken over the quotient stacks, or on coarse spaces over the respective action-free loci supplied by H3.6, H4.17 and S5.8; N≥4 alone does not assert freeness of a polarization or diagonal action.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε<1/(c_p p^m) for p≥3 and 0≤ε≤1/(4·2^m) for p=2 (HodgeTateAndCanonicalSubgroups §4.6; the endpoint is excluded for p≥3); when m=1 at a prime ramified in F also ε≤p^(−3) (§§3.10, 5.1). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- Use the ordinary torsor frame comparison of T5 and O5. The map on integral sections uses the actual completed structural sheaf comparison.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O3/overconvergent-hilbert-forms`
- `OverconvergentAutomorphicForms:O7/ordinary-weighted-forms`
- `OverconvergentAutomorphicForms:O7/igusa-completion-comparison`
- `OverconvergentAutomorphicForms:O5/aip-comparison-naturality`
- `HodgeTateAndCanonicalSubgroups:T5/igusa-torsor`
- `HodgeTateAndCanonicalSubgroups:T5/integral-differential-lattice`
- `HodgeTateAndCanonicalSubgroups:T5/integral-lattice-properties`
- `HodgeTateAndCanonicalSubgroups:T5/aip-torsor`
- `HodgeTateAndCanonicalSubgroups:T5/hodge-tate-aip-lift`
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
- Tame level N is prime to p and sufficiently small for the geometric Hilbert moduli schemes; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. Arithmetic finite-level torsors are taken over the quotient stacks, or on coarse spaces over the respective action-free loci supplied by H3.6, H4.17 and S5.8; N≥4 alone does not assert freeness of a polarization or diagonal action.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Use actual ordinary formal torsor and the completion comparison on patches; κ is bounded with integral unit values.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O7/ordinary-weighted-forms`
- `OverconvergentAutomorphicForms:O7/igusa-completion-comparison`
- `OverconvergentAutomorphicForms:O5/geometric-aip-comparison`
- `OverconvergentAutomorphicForms:O5/arithmetic-aip-comparison`
- `OverconvergentAutomorphicForms:O1/analytic-line-effectivity`
- `HodgeTateAndCanonicalSubgroups:T5/igusa-torsor`
- `HodgeTateAndCanonicalSubgroups:T5/integral-differential-lattice`
- `HodgeTateAndCanonicalSubgroups:T5/integral-lattice-properties`
- `HodgeTateAndCanonicalSubgroups:T5/aip-torsor`
- `HodgeTateAndCanonicalSubgroups:T5/hodge-tate-aip-lift`
- `AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product`
- `PerfectoidShimuraVarieties:S5/hilbert-weil-pairing`
- `PerfectoidShimuraVarieties:S5/hilbert-polarization-torsors`

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

**ID:** `OverconvergentAutomorphicForms:O7/ordinary-hecke-expansions`. **Kind:** theorem. **Planet:** Ordinary coefficient comparison.

**Statement.** Ordinary restriction and the ordinary coefficient comparison commute with compatible weight/level/radius maps, normalized tame T_a, diamonds and wild U_𝔭 on the supplied ordinary correspondences, and with all supplied cusp q-expansions. Cusp forms remain cusp forms and integral renormalized operators obey the same comparison.

**Proposed declaration:** `TauCeti.Overconvergent.ordinary_hecke_expansions`.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the geometric Hilbert moduli schemes; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. Arithmetic finite-level torsors are taken over the quotient stacks, or on coarse spaces over the respective action-free loci supplied by H3.6, H4.17 and S5.8; N≥4 alone does not assert freeness of a polarization or diagonal action.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Use the compactified ordinary correspondences, the family q-expansion O6/padic-hilbert-q-expansion and the integral traces of O6; retain the same normalizers and arithmetic transport.

**Direct inputs.**

- `OverconvergentAutomorphicForms:O7/ordinary-restriction`
- `OverconvergentAutomorphicForms:O7/ordinary-coefficient-comparison`
- `OverconvergentAutomorphicForms:O6/aip-hecke-equivariance`
- `OverconvergentAutomorphicForms:O6/hilbert-q-expansion-comparison`
- `OverconvergentAutomorphicForms:O6/hecke-lattice-renormalisation`
- `PerfectoidSpaces:P9/weight-extension-sheaf-equalizer`
- `PerfectoidSpaces:P9/function-descent-along-tower`
- `OverconvergentAutomorphicForms:O6/padic-hilbert-q-expansion`

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

The inventory is 79 declarations (5 definitions, 31 constructions, 5 lemmas, 23 theorems, 13 comparisons, 2 applications), 133 API items, 113 unit tests, 32 planets, 38 pinned baseline citations, 2 supplier requests and 3 recorded gaps.

| Stage | Status | Remaining |
| --- | --- | --- |
| OverconvergentAutomorphicForms:O0 | planned | The Jacquet–Emerton eigenvariety geometry of Ding §4.2.2 (dimension, Cohen–Macaulayness, reducedness) rests on the LR.6 request and its recorded gap. |
| OverconvergentAutomorphicForms:O1 | closed | None. |
| OverconvergentAutomorphicForms:O2 | closed | None. |
| OverconvergentAutomorphicForms:O3 | planned | Integral local freeness of the full-character sheaf at positive radius is the recorded O5-owned gap; the integral equalizer and its rationalization are planned without it. |
| OverconvergentAutomorphicForms:O4 | closed | None. |
| OverconvergentAutomorphicForms:O5 | planned | Integral local freeness of full-character AIP sheaves at positive radius is an open gap owned here; the comparison isomorphisms do not use it. |
| OverconvergentAutomorphicForms:O6 | closed | None. |
| OverconvergentAutomorphicForms:O7 | planned | The unit-ball identification of ordinary Igusa charts after base change to the nondiscrete perfectoid field is a recorded gap; the completion argument is planned under it. |

### Supplier requests

**`LocallyAnalyticRepresentationsOfLocalGroups:LR.6`.** Build the Hecke eigenvariety from the coherent Jacquet dual of LR.6/jacquet-emerton-properties and the full torus character variety LR.6/character-variety, and supply the definite-unitary dimension/depth theorem and the classical-density/reducedness argument of Ding Proposition 4.14 (n≥2, equidimension n·d_K, Cohen–Macaulayness of the coherent sheaf, reducedness), with the actual Hecke spectral algebra and s≥1. The cited Breuil–Hellmann–Schraen inputs (their Lemma 3.10, Proposition 3.11, Corollary 3.12 and §5.2, Corollary 3.20, and the two companion results Ding cites) must be audited, not assumed. Generic Jacquet modules and character spaces are already LR.6 nodes and are not requested again; the completed coefficients and the local model Π|H≅C(H,E)^s are planned here in O0/unitary-completed-coefficients.

Consumers: `OverconvergentAutomorphicForms:O0/unitary-jacquet-eigenvariety`, `OverconvergentAutomorphicForms:O0/unitary-eigenvariety-geometry`, `OverconvergentAutomorphicForms:O0/unitary-eigenvariety-reduced`.

**`ShimuraCompactifications:C3`.** Use the already specified C3.6a ToroidalRefinement.algebraicSpace_formalFunctions contract: proper locally Noetherian algebraic-space coherent higher direct images, their completion along a coherent ideal and the inverse limit of thickenings, with étale localization. The current supplier README states this target; its atlas packet has no finer node id. This request records the interface, not a new construction here.

Consumer: `OverconvergentAutomorphicForms:O6/hilbert-cusp-higher-vanishing`.

### Recorded gaps

**Jacquet–Emerton eigenvariety geometry in Ding’s definite-unitary setting.** The eigenvariety of Ding §4.2.2 is built from the Jacquet module of the completed coefficients planned in O0/unitary-completed-coefficients, over the character variety of T(K). Its dimension n·d_K, the Cohen–Macaulay property of the coherent sheaf and reducedness rest on Breuil–Hellmann–Schraen inputs that no accepted node states: the Hecke-eigenvariety construction from the coherent Jacquet dual, the local regularity/dimension theorem and the classical-density argument. These belong to the LocallyAnalyticRepresentationsOfLocalGroups direction (request above); until supplied, the three O0 eigenvariety targets rest on them.

Consumers: `OverconvergentAutomorphicForms:O0/unitary-jacquet-eigenvariety`, `OverconvergentAutomorphicForms:O0/unitary-eigenvariety-geometry`, `OverconvergentAutomorphicForms:O0/unitary-eigenvariety-reduced`.

**Integral local freeness of full-character AIP sheaves at positive radius.** Owned by O5 (HodgeTateAndCanonicalSubgroups leaves the finite-character integral generator to this roadmap). Known: the universal-character part is integrally free (AIP ADIC Propositions 4.3 and 4.7); the finite-character factor w_χ is coherent and invertible on the ordinary locus and on the analytic fibre (AIP ADIC §6.4); on the split cover over the anticanonical tower it has the unit generator e_{χ,σ} (O5/finite-character-integral-generator); invariants of the AIP torsor are base functions (O5/aip-torsor-structure-invariants). Open: whether the integral eigensheaf on the base is locally free over O⁺ at positive radius for a nontrivial finite character, in particular of p-power order. The annulus model in O5/finite-character-integral-generator shows that a unit eigenfunction on a split cover does not imply this. The integral comparison O5/geometric-aip-comparison does not use it; only statements of integral freeness for full characters do.

Consumers: `OverconvergentAutomorphicForms:O3/integral-hilbert-sheaf`, `OverconvergentAutomorphicForms:O5/aip-line-and-gluing`, `OverconvergentAutomorphicForms:O5/finite-character-integral-generator`.

**Unit balls of ordinary Igusa charts after nondiscrete base change.** At a discretely valued level the ordinary formal Igusa charts are formally smooth with reduced special fibre, so R_i=A_i° (AdicSpacesPartII R0) and the completion argument of O7/igusa-completion-comparison applies. After base change to the nondiscrete perfectoid field L, the reduced-reduction criterion at a pseudo-uniformizer does not apply because O_L/ϖ is not reduced. A proof must show that the spectral norm of A_i⊗̂L is the tensor norm with unit ball R_i⊗̂O_L, or carry out the comparison over a discretely valued field and complete afterwards. Neither is stated by an accepted node.

Consumers: `OverconvergentAutomorphicForms:O7/igusa-completion-comparison`, `OverconvergentAutomorphicForms:O7/ordinary-coefficient-comparison`.

### Ownership notes

- Rigid weight spaces of compact abelian p-adic groups such as 𝒪_p^× are represented by the character variety of LR.6; PadicMeasuresIwasawaAlgebras (TauCetiRoadmap main) builds no rigid structure on its character spaces, and LocallyAnalyticDistributions §4.15 makes the universal character analytic on affinoid charts. O0 imports LR.6/character-variety and LocallyAnalyticDistributions §4.15 and adds no weight-space theory.
- LR.2/LR.6 supply analytic vectors, noncompact character varieties and coherent Jacquet modules, but not the Hecke eigenvariety geometry Ding Proposition 4.14 uses. LocallyAnalyticRepresentationsOfLocalGroups, Part II: coherent Jacquet eigenvarieties, with the Hecke spectral algebra, dimension/depth and classical-density reducedness. Ding's completed coefficients stay in O0.
- ShimuraCompactifications (TauCetiRoadmap PR) stops at the pushforward of the cusp ideal (its C6.42) and states no higher direct images to the minimal compactification; AIP's appendix theorem is planned here as O6/hilbert-cusp-higher-vanishing. Keep O6/hilbert-cusp-higher-vanishing here; a later ShimuraCompactifications Part II on cusp cohomology imports it rather than restating it.

## Independent review of revision 4

Accepted by Codex — codex-bnuA6h on 20 October 2026, [review report](../reviews/REV-OverconvergentAutomorphicForms--O0~4.md), issue #11303. This is a complete target-level plan under PROTOCOL §§0 and 3, with the three explicit gaps above; it is not a closed roadmap or an implementation. All 79 contracts, all 38 baseline statements at the pins, the seven source versions, named supplier interfaces, APIs/tests and 32 planets were checked. The register records 67 verified, six corrected and six conditional/unverifiable targets. The corrections concern strict p=3 admission, torsor topology and point lifting, finite-character integral pullback and full Čech descent, cusp vanishing and line-valued family expansions; arithmetic coarse torsors explicitly retain their free-locus hypotheses.

The suggested Lean file follows the current WORKERS shape: light real-bodied definitions over pinned carriers, statable milestones, and two meaningful proved examples per kept weight-map/cocycle definition. Geometric carriers remain reader targets. It elaborated with 15 `sorry` warnings and no other diagnostics; the packet validator reported zero errors and warnings. Earlier exhaustive-prototype requirements in the historical review do not apply to this shape. All implementation statuses remain unchecked. Source-issue verdicts and earlier reviews remain in packet history.

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
| `mathlib:SheafOfModules` | [Mathlib/Algebra/Category/ModuleCat/Sheaf.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Category/ModuleCat/Sheaf.lean) | A presheaf of modules on a site whose underlying additive presheaf is a sheaf; no adic ringed site is supplied. |
| `tauceti:NumberField.NarrowClassGroup` | [TauCeti/NumberTheory/NumberField/NarrowClassGroup/Basic.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/NumberField/NarrowClassGroup/Basic.lean) | Invertible fractional ideals modulo principal ideals generated by totally positive elements. |
| `tauceti:NumberField.NarrowClassGroup.instFinite` | [TauCeti/NumberTheory/NumberField/NarrowClassGroup/Finite.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/NumberField/NarrowClassGroup/Finite.lean) | For a number field, its narrow ideal class group is finite. |
| `mathlib:Valuation` | [Mathlib/RingTheory/Valuation/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Valuation/Basic.lean) | A multiplicative zero-preserving map satisfying the ultrametric inequality with values in a linearly ordered commutative monoid with zero. No real-valued restriction. |
| `mathlib:Valuation.integer` | [Mathlib/RingTheory/Valuation/Integers.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Valuation/Integers.lean) | For a ring and a linearly ordered commutative group with zero, the subring of elements whose valuation is at most one. |

## Sources and source issues

All source matches above are own-word statements with section, theorem and page locators. Public source versions are pinned by the packet fingerprints; source passages are not reproduced.

- [Overconvergent Hilbert modular forms via perfectoid modular varieties](https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf), Christopher Birkbeck, Ben Heuer and Chris Williams. Annales de l'Institut Fourier 73 (2023), no. 4, 1709–1794, DOI 10.5802/aif.3560; open-access journal PDF from Centre Mersenne (87 pages; printed page = PDF page + 1707)
- [Overconvergent Hilbert modular forms via perfectoid modular varieties (arXiv version)](https://arxiv.org/pdf/1902.03985v4), Christopher Birkbeck, Ben Heuer and Chris Williams. arXiv:1902.03985v4, 10 May 2021, PDF
- [The adic, cuspidal, Hilbert eigenvarieties](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/Hilbert_adicfinal.pdf), Fabrizio Andreatta, Adrian Iovita, Vincent Pilloni. Research in the Mathematical Sciences 3 (2016), 34; author PDF, 40 pages (author pagination used)
- [On overconvergent Hilbert Modular cusp forms](https://www.imo.universite-paris-saclay.fr/~pilloni/AIP2.pdf), Fabrizio Andreatta, Adrian Iovita, Vincent Pilloni. Astérisque 382 (2016), 163–192; author PDF, 35 pages (author pagination used)
- [Higher Coleman theory](https://www.imo.universite-paris-saclay.fr/~pilloni/HigherColeman.pdf), George Boxer, Vincent Pilloni. Author version, 180 pages; §6.2–6.3 pagination
- [p-adic Hodge parameters in the crystabelline representations of GL_n](https://pmihes.centre-mersenne.org/item/10.1007/s10240-025-00156-2.pdf), Yiwen Ding. Publications Mathématiques de l’IHÉS 142 (2025), 1–74; version of record
- [Line bundles on rigid spaces in the v-topology](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/E9F0B6B21BA1F345142C7301C2EDDA28/S205050942200072Xa.pdf/line-bundles-on-rigid-spaces-in-the-v-topology.pdf), Ben Heuer. Forum of Mathematics, Sigma 10 (2022), e82; DOI10.1017/fms.2022.72, 36 pages

**OverconvergentAutomorphicForms/E1 — misprint.** §6.1, Definition 6.1, printed p. 1756 (PDF p. 49); same in arXiv v4. The printed dual group map uses a positive norm exponent, whereas the accompanying character formula uses the inverse norm character. Use x↦(x²,N(x)⁻¹); pullback of (w,t) is w²·(t⁻¹∘N). Pulling a character (w, t) back along x ↦ (x², N(x)) gives x ↦ w(x)²·t(N(x)), not w(x)²·t(N(x))⁻¹; the two differ unless t∘N is 2-torsion. The displayed formula is the one used later: after Definition 6.2 (p. 1757, ρ(w_κ, t_κ) = w_κ²·(t_κ⁻¹∘N)) and in (9.1) (p. 1781, κ⁻¹(η)w_κ(η²) = t_κ∘N(η)), which holds for the inverted map. Checked on the page images.

**OverconvergentAutomorphicForms/E2 — error.** §6.1 after Definition 6.2, printed p. 1757 (PDF p. 50); also Definition 4.5(3), printed p. 1737, and Definition 7.7, printed p. 1761; same in arXiv v4. The definition takes a supremum of character deviations over the entire unit group and associates bounded weights with a strict bound below one. For boundedness diagnostics take the supremum over a fixed sufficiently small pro-p principal-unit subgroup; keep boundedness itself as affinoid-image boundedness. For quantitative AIP domains use the universal-coordinate annuli of AIP ADIC §2.4.3; do not identify their coordinate δ with this corrected supremum without proof. For p odd and F = ℚ, the Teichmüller character ω : ℤ_p^× → ℤ_p^× is an L-point of 𝒲, hence a bounded weight, but for a primitive (p−1)-st root of unity ζ, |ω(ζ) − 1| = |ζ − 1| = 1. So the printed |T_ω| = 1, contradicting 'bounded iff |T_κ| < 1'; likewise for any weight nontrivial on the prime-to-p torsion of 𝒪_p^×. Then |δ_κ| = 1 and |p|^{ε_κ} = 1 give ε_κ = 0, contradicting '0 < ε_κ' in Definitions 4.5(3) and 7.7, so the AIP comparison (Theorems 4.8 and 7.14) is stated only over the ordinary locus for such weights. Checked on the page images. This correction alone does not validate the printed analytic radius (E3), nor identify the scalar pro-p norm with all AIP coordinates.

**OverconvergentAutomorphicForms/E3 — error.** Proposition6.3, p1757; arXiv v4 Proposition6.3. The proposed radius multiplies the principal-unit scale by the character-deviation parameter. Assert an existential common analytic radius, supplied by AIP Proposition2.8 on genuine universal-coordinate charts; omit this numerical formula. Even replacing the supremum by a pro-p supremum does not fix the formula. Take F=Q,p=3, κ trivial on μ2 and κ(4)=ζ9 primitive. On H1, |Tκ|=3^(−1/6), so the printed r is 3^(−7/6). The analytic ball about1 contains64=4³ since |64−1|3=3^(−2)<r, and κ(64)=ζ3≠1. But κ=1 on4^(9·3^j), a sequence converging to1 inside the ball. The analytic identity theorem forces an extension to equal1 on this ball, contradicting its value at64. Thus the formula fails for a genuine bounded finite-character weight with the corrected pro-p supremum.

**OverconvergentAutomorphicForms/E4 — misprint.** Definition7.1(1), p1759; arXiv v4 §7.1. The printed canonical-subgroup order has exponent m without the number-field degree. The O_F-linear canonical subgroup is of order p^(mg), g=[F:Q], while it is locally O_F/p^mO_F as an O_F-module. An O_F/p^mO_F module has p^(m[F:Q]) elements. The same definition gives this local module model; order p^m agrees only in degree1.

**OverconvergentAutomorphicForms/E5 — misprint.** Remark6.9, p1759. The projective Banach cusp result is attributed to reference [2] rather than the cusp-form paper [3]. The projective Banach cusp citation belongs to [3] (AIP CUSP), Theorem3.16; the fixed-radius arithmetic assertion is Theorem4.4, with the cofinal affinoid refinement in its proof. Reference [2], AIP ADIC, has no Theorem3.16. Reference [3], AIP CUSP, has the stated projective-Banach/specialisation theorem; its Prop3.22 proof includes the global-Hasse affinoid refinement noted by Hattori.

**OverconvergentAutomorphicForms/E6 — misprint.** Theorem7.14, printed p1764 (PDF p57); arXiv v4 PDF p31. The displayed isomorphism labelled by the frame pullback has the perfectoid coefficient sheaf as source and the AIP coefficient sheaf as target. The pullback along the scaled Hodge–Tate frame has source ω_AIP,n^{κ,+} and target ω_n^{κ,+}. The opposite arrow is its inverse, rather than that pullback. The scaled frame maps the perfectoid cover to the AIP frame torsor, so pullback of eigenfunctions is contravariant from the AIP sheaf to the perfectoid sheaf. The first paragraph of the theorem’s proof constructs exactly that direction. Since the map is an isomorphism, the theorem’s isomorphism assertion is unaffected.

**OverconvergentAutomorphicForms/E7 — gap.** Definition8.17(2), p1773, compared with Lemma9.2 and its proof, pp1781–1782 (published version). The finite effective level quotient kills all units congruent to one modulo N. The representative-independence proof later checks only totally positive units and their closure. Use U_N={η∈O_F^×:η≡1 mod N} and its full p-adic closure in every central kernel. For N≥4, N_{F/Q}(η) is ±1 and is 1 modulo N, hence equals 1. The arithmetic multiplier therefore cancels for all U_N, and by continuity for its closure, without requiring total positivity. Definition8.17 explicitly uses the all-unit congruence quotient. Positivity cannot replace it: in Q(√3), −7−4√3 is a unit congruent to 1 modulo 4 with both real embeddings negative. A proof restricted to positive units omits this representative change. The norm-congruence argument repairs the proof; it does not contradict the well-definedness conclusion.

**OverconvergentAutomorphicForms/E8 — gap.** Proof of Proposition5.18, pp1752–1753, the integral embedding-product identification (published version). The proof treats O_p⊗O_C as the product of its embedding factors and uses that integral description to compare the Hodge–Tate kernel with the canonical subgroup at ramified p. Split only after passing to the generic field. Before splitting, keep the saturated kernel and the O_F/p^n-linear canonical generator unsplit and use scalar O_C conormal-degree estimates. The unsplit generator is HodgeTateAndCanonicalSubgroups §3.12 (n≥2, p unramified or H=H′[p^n]) with its Hodge–Tate comparison in §4.7; no ramified integral product is assumed. For O_L=Z_p[π] with π²=p at odd p, evaluation O_C[X]/(X²−p)→O_C×O_C has image pairs whose difference is divisible by 2π. The pair (1,0) is absent. Thus the natural embedding map is not an integral product isomorphism, although it becomes one over C. This invalidates that proof step in ramified cases without giving a counterexample to the inclusion theorem.

**OverconvergentAutomorphicForms/E9 — error.** Proof of Lemma8.28, p1779, contracted-product descent of the period map (published version). Projection to the first factor of X_{Γ*(p∞)}×O_p^× is asserted to give a period map invariant under the antidiagonal Z_p^× action, because that action is treated as simultaneous scalar rescaling. Use the equivariant span map (x,u)↦diag(u,1)π_HT(x), which is invariant under (x,u)↦(diag(t,1)x,t⁻¹u), rather than π_HT(x) alone. This is the corrected S5 period map already used by O4. The first-factor action in Lemma8.25 is diag(t,1). On the Hilbert affine period coordinate it sends z to tz; it is not the central scalar tI and does not fix a general period point. Multiplying by diag(u,1) cancels the antidiagonal change. The displayed projection argument therefore fails, while the corrected equivariant period map remains available.
