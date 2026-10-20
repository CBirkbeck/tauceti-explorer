# Overconvergent Hilbert modular forms and p-adic automorphic coefficients

This roadmap constructs analytic coefficient representations and their equivariant sheaves, then applies them to Hilbert modular forms, integral lattices, Hecke operators and ordinary Igusa forms. Its higher rank branch treats Siegel coefficients and coefficient families on supplied toroidal and Bruhat period domains. The Hilbert endpoint compares two independently defined coefficient constructions: functions on the perfectoid tower and Andreatta–Iovita–Pilloni (AIP) frame-torsor eigenfunctions. The comparison retains weights, lattices, polarizations, Hecke actions and expansions.

The companion [packet](../packets/OverconvergentAutomorphicForms.json) assembles 92 existing targets from the retained O0 and O8 part packets and adds four targets: normalized Siegel analytic coefficients, the BP/Siegel induction convention adapter, the stronger Siegel factor bound, and effective arithmetic descent. Every stable target ID is retained. The packet's `importedTargets` is the full effective contract catalogue for the imported IDs; `assemblyRefinement` identifies corrections to those contracts. The source packets remain the owners of their IDs. The independent assembly review accepts this complete planning pass after the corrections recorded in the packet. All remaining supplier obligations are explicit; prior part verdicts remain provenance.

Every target, hypothesis, API, test and Check is stated here. The [suggested Lean file](../suggested/OverconvergentAutomorphicForms.lean) gives light definitions over pinned library types, end statements and a few proved examples. Geometric types absent from the pins remain mathematical targets here. Every implementation status is unchecked. All nine layers are planned; none is declared closed.

## Ownership and foundations

| Owner | Interface used here |
|---|---|
| PadicMeasuresIwasawaAlgebras, L0a | Representing spaces and universal characters for compact tori. The point-character formulas here are their Hilbert application. |
| LocallyAnalyticDistributions, L0 and L4 | Fixed-radius multivariable analytic functions, chart pullback, compact radius restriction, completed tensor products and uniform family radii. |
| LocallyAnalyticRepresentationsOfLocalGroups, LR.2 and LR.6 | Analytic vectors, the full character space of a noncompact torus, Emerton Jacquet modules and coherent strong duals. Only the remaining Hecke eigenvariety geometry is requested. |
| CompletedCohomologyPartII, CC.1, CC.2 and CC.8 | Ordered coefficient limits and actions; extend the existing GL3 application to Ding's general-n, single varying p-place setting. |
| AdicSpacesPartII, R0, R3 and R5 | Completed coefficients, spectral norms, good-reduction criteria and products with smooth weight bases. |
| PerfectoidSpaces, P9 | Profinite torsor descent, completed coefficient equalizers and effectivity under the precise stated hypotheses. Geometric O+ and a completed lattice tensor are distinct objects. |
| HilbertModularVarietiesAndShimuraCurves, H1, H3 and H4 | Actual moduli spaces, ideal-class transport, Hecke isogenies and effective finite/projective level groups. |
| HodgeTateAndCanonicalSubgroups, T3–T6 | Canonical-domain bounds, Hilbert coordinates and modified lattices, AIP torsors and the logarithmic Hodge–Tate/de Rham comparison. |
| PerfectoidShimuraVarieties, S1, S3, S5 and S6 | Infinite level towers, row-graph charts, completed arithmetic deck groups, Weil pairings, toroidal period maps and Bruhat reductions. |
| AutomorphicBundles, B0, B2, B4 and B5 | Associated-bundle conventions, highest weights, Hilbert/Siegel algebraic coefficients and classical expansions. |
| ShimuraCompactifications, C6 | Ordinary and near-ordinary models, cusp geometry, boundary ideal pushforward, Koecher and p-level comparisons. Higher cusp formal cohomology and bounded analytic-family Koecher at p-level remain precise extension requests. |
| PadicFamilies, L2a | The compact-operator eigenvariety engine consumes O6's compactness result. It is separate from the Jacquet eigenvariety in Ding. |

The pinned baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The [reviewed library audit](../../../data/library-coverage.json), AUDIT-15 for O0–O8, leaves these analytic/geometric targets unimplemented. The 65 declarations listed below supply existing substrates, not adic or analytic enhancements inferred from their names.

The current read-only TauCetiRoadmap main was checked at `0d144d044dacebca17b654695b6f1ad58f159b27`, and the current Tau Ceti library at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The original planning pass read nearby AdicSpaces and ModularForms material. This independent review read the complete AdicSpaces and AlgebraicVectorBundles readers and the relevant bundle interfaces, and screened declarations in all nine post-snapshot roadmap families. The four Completed roadmap directories are absent from this current tree; their implemented library areas were screened instead. Existing locally free bundles, classical operators, restricted products and arithmetic foundations remain with their owners. None supplies the missing p-adic analytic induction or geometric coefficient equalizers planned here. O6's nonarchimedean compactness over affinoids is distinct from real/complex Hilbert-space compact-operator theory.

## Notation and conventions

Write F for the totally real Hilbert field, d=[F:Q], and 𝒪_p=ℤ_p⊗_ℤ𝒪_F with scalars on the left and the module topology. The algebraic O0 definitions allow any number field. Ramification at p is allowed; the modified differential lattice is retained when it is required. In O8, g≥1 is the Siegel genus. An empty matrix index set is an algebraic test only. Real embeddings, p-adic embeddings into a splitting field and the higher Coleman coefficient field are separate data.

For a bounded smooth weight family, the image lies in an affinoid weight chart and has a common admitted radius. Perfectoid towers times smooth rigid weight bases use the supplied sousperfectoid product and its actual coefficient sheaf. A continuous point-character is not a representing rigid weight space.

Geometric Hilbert weights are characters κ:𝒪_p×→A×. Arithmetic weights are pairs (w,t) with

κ(x)=w(x)²·t(N(x))⁻¹, ι(x)=(x²,N(x)⁻¹).

For AIP's norm-positive notation take ν=w and its norm character t⁻¹. Algebraic exponents w=∏τ xτ^aτ and t(z)=z^v give κ=∏τ xτ^(2aτ−v). The diagnostic |Tκ| is the supremum of ‖κ(x)−1‖ over 1+p^r₀𝒪_p, with r₀=1 for odd p and 3 for p=2. It is distinct from AIP's universal weight coordinate and from a Siegel period radius.

The common coefficient convention is a right action x↦xγ with

Jγδ(x)=Jγ(x)Jδ(xγ), f(xγ)=ρ(Jγ(x)⁻¹)f(x).

A frame change b gives J′γ(x)=b(x)⁻¹Jγ(x)b(xγ) and f′(x)=ρ(b(x)⁻¹)f(x). For a left cocycle K, set xγ=γ⁻¹x and Jγ(x)=Kγ⁻¹(x)⁻¹. Invert both the group element and the coefficient for noncommuting factors. BHW's scalar Hilbert law is left: jγ(z)=cz+d and jγδ(z)=jγ(δz)jδ(z). Its section multiplier Kγ=κ(jγ)⁻¹ converts to Jγ=κ(jγ⁻¹). The scalar commutation argument cannot replace the vector-valued conversion.

For Hilbert admission choose an actual analytic character extension on B_r(𝒪_p×:1), m≥1 with p⁻ᵐ≤r<1, and 0≤ε≤1/(c_p pᵐ), where c_p=2 for p≥5, 3 for p=3 and 4 for p=2. Retain AL_n:X(pⁿε)_a→X(ε). The equality endpoint and the unsplit ramified canonical-generator input retain the inherited T4 obligations. Ordinary ε=0 and the positive-radius colimit remain distinct. A rational line comparison does not determine its integral lattice.

Arithmetic descent uses U_N={η∈𝒪_F×:η≡1 mod N}, N≥4, p∤N, and Z∞=closure(U_N)⊂𝒪_p×. The closure includes all congruence units, not only positive units. Their norm is +1 by reduction modulo N, and this extends to Z∞. The completed hybrid deck group is E(pⁿ)=(Γ₀(pⁿ)×Δ(p∞N))/Z∞ with z↦(zI,z²); the arithmetic group is PΓ₀(pⁿ)=Γ₀(pⁿ)/Z∞. The abstract positive-unit quotient in BHW is a dense subgroup of the first group. The raw O_p×-valued Weil pairing lives on the hybrid tower; on the arithmetic tower only its class modulo the positive-unit closure exists. Polarization-class transport uses global x∈F×,+∩𝒪_p×.

S3 uses the annihilator graph [I,Z_std] with Z_stdᵀ=Z_std and W_std=col(−Z_std,I). The quotient Hodge frame consists of the classes of e₁,…,e_g in O^{2g}/W_std≅ω_{A∨}≅ω_A. For the reversal matrix W set P=diag(I,W), Z=Z_std W and γ_DRW=P⁻¹γ_stdP. This gives the antidiagonal convention WZᵀW=Z and preserves A+ZC exactly. The naturally linearized W_std∨ is ω_A(−1); its frame carries c(γ)⁻¹ until tensoring with the variable Weil-pairing generator. A fixed choice of roots does not cancel that character.

The Siegel row graph in this antidiagonal basis is [I,Z]. For γ=[A,B;C,D],

Jγ(Z)=A+ZC, Zγ=Jγ(Z)⁻¹(B+ZD).

The denominator has unit determinant. This is a right action. Its antidiagonal dual is WJᵀW=A‡+C‡Z in this order. A determinant character χ gives multiplier χ(det J)⁻¹; χ(a)=a^m recovers (det ω)^m, using duals for m<0. This finite line is a subobject of the full analytic induction. Products of analytic functions have product weight; a fixed nontrivial weight is not an algebra under pointwise multiplication on the full Iwahori. Restriction to the opposite unipotent nevertheless transports a Banach algebra product onto that coefficient space (DRW Remark3.1.11, p23); E-O8-16 is rejected. The representation-valued automorphic equalizers are used as modules, with no claim that all translating maps preserve that transported multiplication.

K is the full inverse image of the diagonal torus of GSp(2g,F_p). Apply S1's general full-tower quotient with c(K)=Z_p^× (m=0), base changed from Q_p to C_p, retaining all Weil-pairing components. S1's named strict subgroup additionally has c≡1 mod p; a fixed pairing fibre has only K∩ker(c) as deck group. The present quotient uses the full K, not that fibre or the inadequate moduli data in E-O8-1. Its Levi is I+=Iw_GLg+. In DRW the lower-unipotent analytic variable is u_ij/p. Thus normalized r-analytic functions extend to Iw_GLg M_(r+1), where M_s={1+E:‖E‖≤p⁻ˢ}, and the transpose action uses I+ M_(r+1). The geometric factor satisfies exactly this stronger bound: if Z=Z₀+E with ‖E‖≤p⁻ʷ, then J₀=A+Z₀C∈I+ and ‖J−J₀‖≤p^−(w+1), since C∈p Mat_g(ℤ_p). The full intended w-analytic coefficient module is therefore retained. Its integral lattice is the finite-chart Gauss unit ball; integrality only on Z_p-valued arguments is insufficient.

The BP/Siegel adapter uses λ_BP=w₀,M(κ_D⁻¹), the same entrywise thickening G_n and r=n−1 in normalized coordinates. The identity on functions identifies their Borel rules and Gauss norms. For τ(h)=h^−T, ρ_D(h)=ρ_BP(τ(h)). Algebraic weights also pass through B2's highest-weight convention. The adapter concerns open Iwahori M₁; it does not change BP's general closed M₁ or its positive-torus and distribution-dual conventions. At fixed radius the strong Banach dual differs from BP's projective compact-open dual of bounded functions on the open polydisc.

Siegel geometric targets assume odd p, fine tame N≥3 prime to p and the supplied roots of unity/Tate trivialization. Canonical-domain comparisons retain p>2g and their explicit Hasse bounds. Analytic coefficients retain w>1+r_U. Toroidal comparisons retain the central quotient G^c, κ=−w₀,M wν−(w₀,M wρ+ρ), and the cyclotomic twist Q_p(j). S6 supplies a de Rham Bruhat reduction; converting it to the Hodge–Tate torsor uses the T6 comparison and its Tate twist.

For Hilbert cusp modules, (Pr) means a continuous direct summand of an orthonormalizable Banach module. Complete continuity means approximation by finite-range operators over the affinoid coefficient algebra. The controlling operator is U=∏𝔭|p U𝔭^e𝔭. Wild trace normalizations have total factor p⁻ᵈ; integral renormalization must exhibit sufficient factors. Boundary-ideal vanishing and Koecher extension are separate statements.

Ordinary functions are constructed patchwise as lim_m colim_i O(𝔛_i)/p^m, followed by the weight equalizer. The comparison with analytic O+ requires actual finite-level good reduction, isometric maps and the specified spectral completion. Reduced special fibres are used over a discretely valued model before the separate coefficient extension; O_Cp/p is not reduced. No interchange with nonaffine global sections or reversal of the ordered limits is implicit.

## Layer overview

The dependency graph, rather than layer numbering, determines the build order. O0/O1 feed both branches. O2–O4 construct the Hilbert equalizers and their presentations. O5 constructs AIP coefficients independently and compares the integral equalizers without assuming integral local freeness. O6 uses structural cusp cohomology before its Banach and compactness conclusions. O7 supplies an ordinary restriction comparison, without a control or surjectivity theorem. O8 imports geometric period maps and reductions rather than constructing them again.

| Layer | Endpoint | Targets | Coverage |
|---|---|---:|---|
| [O0 — Weight spaces and locally analytic representations](#layer-o0) | Compact torus weights and the arithmetic-to-geometric norm sign; genuine analytic induction; the Ding completed-cohomology consumer. | 24 | planned |
| [O1 — Equivariant sheaves from cocycles](#layer-o1) | Right/inverse cocycle convention, finite coefficients and sheafwise equalizers; analytic line effectivity. | 4 | planned |
| [O2 — Hilbert automorphy factors and domains](#layer-o2) | Actual admitted Hilbert domains, the cz+d law, frame descent and algebraic weights. | 6 | planned |
| [O3 — Integral coefficients and variation in weight](#layer-o3) | Integral equalizers, local rationalisation, conditional integral weight change and ramified modified lattices. | 6 | planned |
| [O4 — Arithmetic descent and polarization classes](#layer-o4) | Four independent presentations, effective completed deck groups, pairing and finite polarization descent. | 12 | planned |
| [O5 — Independent AIP construction and comparison](#layer-o5) | Independent frame-torsor eigenfunctions, rational lines, integral equalizer comparison and its arithmetic naturality. | 6 | planned |
| [O6 — Boundary, cusp forms, and Hecke operators](#layer-o6) | Cusp ideals, normalized moduli Hecke maps, (Pr), compact restriction and the controlling product. | 13 | planned |
| [O7 — Ordinary Igusa forms and the Hida comparison](#layer-o7) | Ordered patchwise completion, compatible weighted ordinary functions and restriction from positive radius. | 6 | planned |
| [O8 — Examples beyond Hilbert](#layer-o8) | Siegel matrix factors, normalized analytic coefficients and finite algebraic subobjects; toroidal and Bruhat-reduced instances. | 19 | planned |

<a id="layer-o0"></a>

## O0. Weight spaces and locally analytic representations

Compact torus weights and the arithmetic-to-geometric norm sign; genuine analytic induction; the Ding completed-cohomology consumer.

<a id="o0-units-at-p"></a>

### Units at p of a number field

**Definition** · `OverconvergentAutomorphicForms:O0/units-at-p`

Imported stable target from [OverconvergentAutomorphicForms--O0.json](../packets/OverconvergentAutomorphicForms--O0.json); the following is its effective assembly contract.

For a number field F and a prime p, 𝒪_p := ℤ_p ⊗_ℤ 𝒪_F with its ℤ_p-algebra structure from the left factor and the ℤ_p-module topology. It is a finite free ℤ_p-module of rank [F : ℚ], a compact topological ring, and T(ℤ_p) := 𝒪_p^× (with the units topology) is BHW's T(ℤ_p) for T = Res_{𝒪_F|ℤ} G_m.

**Hypotheses.**

- No hypothesis on how p decomposes in F: 𝒪_p is the product of the completed local rings at the primes above p, not assumed unramified or split.
- Scalars on the left, so that the pinned base-change instances apply.

**Construction or proof.**

1. Define Op F p := ℤ_[p] ⊗[ℤ] 𝓞 F; its ℤ_p-algebra structure is Algebra.TensorProduct.leftAlgebra.
2. Module.Finite from Module.Finite.base_change and Module.Free from Module.Free.tensor, since 𝓞 F is finite free over ℤ.
3. Give it moduleTopology ℤ_[p] (an IsModuleTopology instance); it is a topological ring by IsModuleTopology.isTopologicalRing.
4. Rank: Module.finrank_baseChange with NumberField.RingOfIntegers.rank. Compactness: a ℤ_p-basis identifies 𝒪_p with ℤ_p^n by a linear equivalence, which is a homeomorphism for module topologies (IsModuleTopology.continuous_of_linearMap), and ℤ_p is compact (PadicInt.compactSpace).
5. The unit locus is clopen and compact: a finite-free multiplication determinant is a unit in Z_p exactly when the element is invertible (adjugate/Cayley–Hamilton). Its continuous inverse image of Z_p^× identifies with O_p^×, including the units topology and continuous inverse.

**Prerequisites.** [mathlib:TensorProduct](#baseline-interfaces), [mathlib:NumberField.RingOfIntegers](#baseline-interfaces), [mathlib:PadicInt](#baseline-interfaces), [mathlib:Algebra.TensorProduct.leftAlgebra](#baseline-interfaces), [mathlib:Module.Finite.base_change](#baseline-interfaces), [mathlib:Module.Free.tensor](#baseline-interfaces), [mathlib:moduleTopology](#baseline-interfaces), [mathlib:IsModuleTopology](#baseline-interfaces), [mathlib:IsModuleTopology.isTopologicalRing](#baseline-interfaces), [mathlib:IsModuleTopology.continuous_of_linearMap](#baseline-interfaces), [mathlib:Module.finrank_baseChange](#baseline-interfaces), [mathlib:NumberField.RingOfIntegers.rank](#baseline-interfaces), [mathlib:PadicInt.compactSpace](#baseline-interfaces), [mathlib:Rat.ringOfIntegersEquiv](#baseline-interfaces).

**Planned interface.** `TauCeti.HilbertWeight.Op`; module `TauCeti/NumberTheory/HilbertModularForms/Weights`, namespace `TauCeti.HilbertWeight`.

**Uses.**

- BHW §6.1 and §5 (𝒪_p = 𝒪_F ⊗ ℤ_p throughout): the torus T(ℤ_p) = 𝒪_p^× whose characters are the geometric weights, and 𝒪_p ⊂ Res_{𝒪_F|ℤ} P^1 on which the Hodge–Tate period map lands.
- OverconvergentAutomorphicForms:O0/geometric-weight-characters: the source group of weights.

**API.**

- `TauCeti.HilbertWeight.compactSpace_Op` (other): 𝒪_p is compact.
- `TauCeti.HilbertWeight.finrank_Op` (characterisation): finrank_{ℤ_p} 𝒪_p = [F : ℚ].
- `TauCeti.HilbertWeight.unitsToOp` (coercion): The map 𝒪_F^× → 𝒪_p^×, η ↦ 1 ⊗ η.

**Definition tests.**

- `op_rat` (compatibility): 𝒪_p ≅ ℤ_p for F = ℚ.
- `op_not_discrete` (non-example): 𝒪_p is not discrete.
- `op_split` (compatibility): For F = ℚ(i) and p = 5, 𝒪_p ≅ ℤ_5 × ℤ_5.

**Check.**

- F = ℚ: 𝒪_p ≅ ℤ_p as ℤ_p-algebras, via Rat.ringOfIntegersEquiv.
- The topology is not discrete; a definition by the discrete topology would make every character continuous and the weight space far too large.
- F = ℚ(i), p = 5: 𝒪_p ≅ ℤ_5 × ℤ_5, and T(ℤ_5) = (ℤ_5^×)², matching Res_{𝒪_F|ℤ} G_m at a split prime.

**Sources.**

- [BHW-2023](#source-bhw-2023), §6.1, Definition 6.1, printed p. 1756. T(ℤ_p) = (𝒪_F ⊗ ℤ_p)^× is the group whose characters form the weight spaces.

<a id="o0-norm-at-p"></a>

### The norm on units at p

**Construction** · `OverconvergentAutomorphicForms:O0/norm-at-p`

Imported stable target from [OverconvergentAutomorphicForms--O0.json](../packets/OverconvergentAutomorphicForms--O0.json); the following is its effective assembly contract.

Define N_alg : 𝒪_p → ℤ_p as the determinant norm Algebra.norm ℤ_p on the finite free ℤ_p-algebra 𝒪_p, and N : 𝒪_p^× → ℤ_p^× as its restriction to units. N_alg is a continuous multiplicative map and N is a continuous homomorphism. For every a ∈ 𝒪_F, N_alg(1 ⊗ a) is the image of N_{F/ℚ}(a) in ℤ_p. For a global unit η this specializes to N(1 ⊗ η) = N_{F/ℚ}(η) in ℤ_p^×.

**Hypotheses.**

- 𝒪_p finite free over ℤ_p (units-at-p).

**Construction or proof.**

1. Construct N_alg with Algebra.norm ℤ_[p] : 𝒪_p →* ℤ_p, then define N as Units.map N_alg. An arbitrary a ∈ 𝒪_F belongs in the first formula; only a unit belongs in the second.
2. Continuity: in a ℤ_p-basis the norm is a polynomial in the coordinates (Algebra.norm_apply, LinearMap.det), and coordinates are continuous for the module topology.
3. Compatibility: multiplication by 1 ⊗ a is the base change of multiplication by a on 𝒪_F, so its determinant is N_{F/ℚ}(a) (LinearMap.det_baseChange).

**Prerequisites.** [OverconvergentAutomorphicForms:O0/units-at-p](#o0-units-at-p), [mathlib:Algebra.norm](#baseline-interfaces), [mathlib:Units.map](#baseline-interfaces), [mathlib:Algebra.norm_apply](#baseline-interfaces), [mathlib:LinearMap.det](#baseline-interfaces), [mathlib:LinearMap.det_baseChange](#baseline-interfaces), [mathlib:IsModuleTopology.continuous_of_linearMap](#baseline-interfaces).

**Planned interface.** `TauCeti.HilbertWeight.normUnits`; module `TauCeti/NumberTheory/HilbertModularForms/Weights`, namespace `TauCeti.HilbertWeight`.

**Uses.**

- OverconvergentAutomorphicForms:O0/weight-dual-group-map: the second coordinate x ↦ N(x)^{-1}.

**API.**

- `TauCeti.HilbertWeight.continuous_normUnits` (other): N is continuous.
- `TauCeti.HilbertWeight.norm_tmul_one` (compatibility): For every a ∈ 𝒪_F, N_alg(1 ⊗ a) = N_{F/ℚ}(a) in ℤ_p.
- `TauCeti.HilbertWeight.normUnits_unitsToOp` (compatibility): N(1 ⊗ η) = N_{F/ℚ}(η) in ℤ_p for a global unit η.

**Definition tests.**

- `norm_rat` (compatibility): For F = ℚ, N is the identity.
- `norm_neg_one` (compatibility): N(−1) = (−1)^{[F:ℚ]}.
- `norm_not_trivial` (non-example): For [F:ℚ] odd, N is not the trivial character (N(−1) = −1).

**Check.**

- F = ℚ: N is the identity of ℤ_p^×.
- N(−1) = (−1)^{[F:ℚ]}.
- N(1 ⊗ η) = 1 for a totally positive unit η of a totally real F (used by weight-comparison-totally-positive-units).

**Sources.**

- [BHW-2023](#source-bhw-2023), §6.1, Definition 6.1, printed p. 1756. N_{F/ℚ} on T(ℤ_p), used in the weight map; here constructed as the norm of 𝒪_p over ℤ_p.

<a id="o0-principal-units"></a>

### Principal units 1 + p^r 𝒪_p

**Construction** · `OverconvergentAutomorphicForms:O0/principal-units`

Imported stable target from [OverconvergentAutomorphicForms--O0.json](../packets/OverconvergentAutomorphicForms--O0.json); the following is its effective assembly contract.

For r ≥ 0, H_r := {x ∈ 𝒪_p^× : x − 1 ∈ p^r 𝒪_p} is an open subgroup of finite index of 𝒪_p^×; for r ≥ 1 it is a pro-p group, so it meets the prime-to-p torsion of 𝒪_p^× trivially.

**Hypotheses.**

- r ∈ ℕ; H_0 = 𝒪_p^×.

**Construction or proof.**

1. Closure under products and inverses: (1 + p^r a)(1 + p^r b) = 1 + p^r(a + b + p^r ab), and the inverse of a unit ≡ 1 mod p^r is ≡ 1 mod p^r.
2. Openness: p^r 𝒪_p is open in the module topology (a finite-index ℤ_p-submodule), and H_r is its translate intersected with the open units.
3. Finite index: 𝒪_p^×/H_r injects into (𝒪_p/p^r)^×, a finite group.
4. Pro-p for r ≥ 1: H_r/H_s is a p-group for s ≥ r, being filtered by the additive groups p^i 𝒪_p/p^{i+1} 𝒪_p.

**Prerequisites.** [OverconvergentAutomorphicForms:O0/units-at-p](#o0-units-at-p), [mathlib:Subgroup](#baseline-interfaces), [mathlib:Ideal.span](#baseline-interfaces), [mathlib:Subgroup.FiniteIndex](#baseline-interfaces), [mathlib:IsModuleTopology](#baseline-interfaces).

**Planned interface.** `TauCeti.HilbertWeight.principalUnits`; module `TauCeti/NumberTheory/HilbertModularForms/Weights`, namespace `TauCeti.HilbertWeight`.

**Uses.**

- OverconvergentAutomorphicForms:O0/weight-radius-parameter: the pro-p subgroup over which |T_κ| is taken.

**API.**

- `TauCeti.HilbertWeight.isOpen_principalUnits` (other): H_r is open.
- `TauCeti.HilbertWeight.finiteIndex_principalUnits` (other): H_r has finite index.
- `TauCeti.HilbertWeight.principalUnits_antitone` (relation): r ≤ s implies H_s ≤ H_r.

**Definition tests.**

- `principalUnits_zero` (compatibility): H_0 = 𝒪_p^×.
- `principalUnits_rat` (compatibility): F = ℚ, p odd: H_1 = 1 + pℤ_p has index p − 1.
- `principalUnits_root_of_unity` (non-example): A nontrivial (p−1)-st root of unity in ℤ_p^× is not in H_1.

**Check.**

- r = 0 gives all of 𝒪_p^×.
- F = ℚ, p odd, r = 1: H_1 = 1 + pℤ_p, of index p − 1; a nontrivial (p−1)-st root of unity is not in H_1.
- This is the subgroup over which the corrected |T_κ| is taken (source issue E2).

**Sources.**

- [BHW-2023](#source-bhw-2023), Definition 4.5(1), printed p. 1736. AIP's coordinate T lives on the pro-p part; the principal units are its Hilbert analogue.

<a id="o0-geometric-weight-characters"></a>

### Geometric Hilbert weights

**Definition** · `OverconvergentAutomorphicForms:O0/geometric-weight-characters`

**Planet:** Hilbert weight space for G*.

Imported stable target from [OverconvergentAutomorphicForms--O0.json](../packets/OverconvergentAutomorphicForms--O0.json); the following is its effective assembly contract.

For a topological commutative ring R, the R-points of the weight space 𝒲* for G* are the continuous characters T(ℤ_p) = 𝒪_p^× → R^×: GeomWeight F p R := ContinuousMonoidHom 𝒪_p^× R^×. BHW's 𝒲* = Spf(ℤ_p⟦T(ℤ_p)⟧)^an_η × L is the rigid space representing this functor on affinoid L-algebras; its construction and representability are requested from PadicMeasuresIwasawaAlgebras L0a.

**Hypotheses.**

- R a topological commutative ring, R^× with the units topology.
- No analyticity or algebraicity is assumed: an arbitrary continuous character is a weight, not an algebraic weight.
- All representation-by-rigid-space assertions use the imported universal character functor; the Lean abbreviation itself gives points only.

**Construction or proof.**

1. Definition: ContinuousMonoidHom (Op F p)ˣ Rˣ. It is a commutative group under pointwise multiplication, and post-composition with continuous ring maps R → R' makes it a functor.

**Prerequisites.** [OverconvergentAutomorphicForms:O0/units-at-p](#o0-units-at-p), [mathlib:ContinuousMonoidHom](#baseline-interfaces), [mathlib:IsTopologicalRing](#baseline-interfaces), [PadicMeasuresIwasawaAlgebras:L0a](../packets/PadicMeasuresIwasawaAlgebras.json).

**Planned interface.** `TauCeti.HilbertWeight.GeomWeight`; module `TauCeti/NumberTheory/HilbertModularForms/Weights`, namespace `TauCeti.HilbertWeight`.

**Uses.**

- BHW §6.2, Definition 6.5 and after: sheaves ω^κ of overconvergent Hilbert modular forms for G* of weight κ.
- OverconvergentAutomorphicForms:O1: the coefficient character of the equivariant sheaf.

**API.**

- `TauCeti.HilbertWeight.GeomWeight.ext` (extensionality): Two geometric weights are equal iff their values on all units agree.
- `TauCeti.HilbertWeight.GeomWeight.pullback` (functoriality): Precomposition by a continuous monoid endomorphism of O_p^×.
- `TauCeti.HilbertWeight.GeomWeight.one_apply` (simp): The trivial weight evaluates to 1 on every unit.

**Definition tests.**

- `geomWeight_trivial` (compatibility): The trivial character is a weight.
- `geomWeight_norm` (compatibility): x ↦ N(x) is a ℚ_p-valued weight.
- `geomWeight_rat` (compatibility): For F = ℚ these are the continuous characters of ℤ_p^×.

**Check.**

- F = ℚ: GeomWeight ℚ p R is the set of continuous characters ℤ_p^× → R^×, BHW's weight space for GL_2/ℚ (Definition 3.1).
- Algebraic weights x ↦ N(x)^k (k ∈ ℤ) and x ↦ ∏_σ σ(x)^{k_σ} (after extending scalars to split F) are weights; a finite-order character of 𝒪_p^× is a weight that is not algebraic.
- Let R be the same abstract p-adic integer algebra with discrete topology. The identity homomorphism on its unit group from the usual p-adic topology is not continuous (the inverse image of {1} is not open), hence is not an R-valued weight.

**Sources.**

- [BHW-2023](#source-bhw-2023), §6.1, Definition 6.1(ii), printed p. 1756. The weight space for G*; its L-points are characters T(ℤ_p) → L^×.
- [BHW-2023](#source-bhw-2023), §6.1, Definition 6.1, printed p. 1756. Points of 𝒲* are characters.

<a id="o0-arithmetic-weight-characters"></a>

### Arithmetic Hilbert weights

**Definition** · `OverconvergentAutomorphicForms:O0/arithmetic-weight-characters`

**Planet:** Hilbert weight space for G.

Imported stable target from [OverconvergentAutomorphicForms--O0.json](../packets/OverconvergentAutomorphicForms--O0.json); the following is its effective assembly contract.

For a topological commutative ring R, the R-points of the weight space 𝒲 for G are the continuous characters of T(ℤ_p) × ℤ_p^×: ArithWeight F p R := ContinuousMonoidHom (𝒪_p^× × ℤ_p^×) R^×. Every such character is uniquely a pair (w, t) with w ∈ GeomWeight and t : ℤ_p^× → R^× continuous, via κ(x, y) = w(x)t(y).

**Hypotheses.**

- R a topological commutative ring.
- All representation-by-rigid-space assertions use the imported universal character functor; the Lean abbreviation itself gives points only.

**Construction or proof.**

1. Definition: ContinuousMonoidHom ((Op F p)ˣ × ℤ_[p]ˣ) Rˣ. ArithWeight.mk w t := (w ∘ fst)·(t ∘ snd) (ContinuousMonoidHom.fst, ContinuousMonoidHom.snd, pointwise product).
2. Bijectivity of (w, t) ↦ ArithWeight.mk w t: restrict κ to 𝒪_p^× × 1 and 1 × ℤ_p^×; a character of a product of groups is the product of its restrictions.

**Prerequisites.** [OverconvergentAutomorphicForms:O0/units-at-p](#o0-units-at-p), [OverconvergentAutomorphicForms:O0/geometric-weight-characters](#o0-geometric-weight-characters), [mathlib:ContinuousMonoidHom](#baseline-interfaces), [mathlib:ContinuousMonoidHom.fst](#baseline-interfaces), [mathlib:ContinuousMonoidHom.snd](#baseline-interfaces), [PadicMeasuresIwasawaAlgebras:L0a](../packets/PadicMeasuresIwasawaAlgebras.json).

**Planned interface.** `TauCeti.HilbertWeight.ArithWeight`; module `TauCeti/NumberTheory/HilbertModularForms/Weights`, namespace `TauCeti.HilbertWeight`.

**Uses.**

- BHW §9, Definition 9.1 and Lemma 9.2: arithmetic Hilbert modular forms of weight (w, t) for G.

**API.**

- `TauCeti.HilbertWeight.ArithWeight.mk` (constructor): (w, t) ↦ the character (x, y) ↦ w(x)t(y).
- `TauCeti.HilbertWeight.ArithWeight.bijective_mk` (equivalence): Every arithmetic weight is uniquely of the form mk w t.
- `TauCeti.HilbertWeight.ArithWeight.mk_apply` (simp): (mk w t)(x, y) = w(x)·t(y).

**Definition tests.**

- `arithWeight_trivial` (compatibility): mk 1 1 = 1.
- `arithWeight_rat` (compatibility): For F = ℚ these are pairs of characters of ℤ_p^×.
- `arithWeight_mk_injective` (characterisation): mk w t = mk w' t' implies w = w' and t = t'.

**Check.**

- F = ℚ: pairs of characters of ℤ_p^×.
- (w, t) = (1, 1) gives the trivial weight.
- The decomposition is unique: ArithWeight.mk is injective.

**Sources.**

- [BHW-2023](#source-bhw-2023), §6.1, Definition 6.1(i), printed p. 1756. The weight space for G.
- [BHW-2023](#source-bhw-2023), §6.1, Definition 6.1, printed p. 1756. Points are pairs (w, t).

<a id="o0-weight-dual-group-map"></a>

### The group map dual to the weight map

**Construction** · `OverconvergentAutomorphicForms:O0/weight-dual-group-map`

Imported stable target from [OverconvergentAutomorphicForms--O0.json](../packets/OverconvergentAutomorphicForms--O0.json); the following is its effective assembly contract.

ι : 𝒪_p^× → 𝒪_p^× × ℤ_p^×, x ↦ (x², N(x)^{-1}), a continuous group homomorphism. It is the map for which pulling back characters gives BHW's displayed formula κ = w²·(t^{-1} ∘ N); BHW print x ↦ (x², N(x)) (source issue E1).

**Hypotheses.**

- The inversion on the second coordinate is deliberate: it is what the displayed formula and BHW (9.1) require.

**Construction or proof.**

1. ι is a homomorphism because 𝒪_p^× and ℤ_p^× are commutative: (xy)² = x²y² and N(xy)^{-1} = N(x)^{-1}N(y)^{-1}.
2. Continuity: squaring and inversion are continuous on the topological groups of units, and N is continuous (norm-at-p).

**Prerequisites.** [OverconvergentAutomorphicForms:O0/units-at-p](#o0-units-at-p), [OverconvergentAutomorphicForms:O0/norm-at-p](#o0-norm-at-p), [mathlib:ContinuousMonoidHom](#baseline-interfaces).

**Planned interface.** `TauCeti.HilbertWeight.weightDualMap`; module `TauCeti/NumberTheory/HilbertModularForms/Weights`, namespace `TauCeti.HilbertWeight`.

**Uses.**

- OverconvergentAutomorphicForms:O0/weight-comparison: ρ is pullback along ι.

**API.**

- `TauCeti.HilbertWeight.weightDualMap` (constructor): x ↦ (x², N(x)^{-1}) as a continuous monoid hom.
- `TauCeti.HilbertWeight.weightDualMap_apply` (simp): ι(x) = (x², N(x)^{-1}).
- `TauCeti.HilbertWeight.weightDualMap_unitsToOp` (compatibility): For a totally positive global unit η of a totally real F, ι(η) = (η², 1).

**Definition tests.**

- `weightDualMap_rat` (compatibility): For F = ℚ, ι(x) = (x², x^{-1}).
- `weightDualMap_one` (compatibility): ι(1) = (1, 1).
- `weightDualMap_not_printed` (non-example): ι ≠ (x ↦ (x², N(x))) whenever N is not 2-torsion on 𝒪_p^×, e.g. F = ℚ, p = 5.

**Check.**

- Pulling back (w, t) along ι gives w²·(t^{-1} ∘ N), not w²·(t ∘ N): with t trivial both agree, with w trivial they are inverse to each other.
- F = ℚ: ι(x) = (x², x^{-1}).

**Sources.**

- [BHW-2023](#source-bhw-2023), §6.1, Definition 6.1, printed p. 1756. BHW define ρ through a group map T(ℤ_p) → T(ℤ_p) × ℤ_p^×; the printed map x ↦ (x², N(x)) is corrected to x ↦ (x², N(x)^{-1}) (E1).
- [BHW-2023](#source-bhw-2023), §9, proof of Lemma 9.2, (9.1), printed p. 1781. (9.1) κ^{-1}(η)w(η²) = t∘N(η) holds for the inverted map.

<a id="o0-weight-comparison"></a>

### The weight map ρ : 𝒲 → 𝒲*

**Construction** · `OverconvergentAutomorphicForms:O0/weight-comparison`

**Planet:** Weight map ρ.

Imported stable target from [OverconvergentAutomorphicForms--O0.json](../packets/OverconvergentAutomorphicForms--O0.json); the following is its effective assembly contract.

ρ_R : ArithWeight F p R → GeomWeight F p R, κ ↦ κ ∘ ι, natural in the coefficient ring R. It is the map on points of BHW's morphism ρ : 𝒲 → 𝒲*, through which every weight for G is regarded as a weight for G*.

**Hypotheses.**

- R a topological commutative ring; naturality is for continuous ring maps R → R'.

**Construction or proof.**

1. Definition by composition with weight-dual-group-map (ContinuousMonoidHom.comp).
2. Naturality: composition on the left and on the right commute.

**Prerequisites.** [OverconvergentAutomorphicForms:O0/arithmetic-weight-characters](#o0-arithmetic-weight-characters), [OverconvergentAutomorphicForms:O0/geometric-weight-characters](#o0-geometric-weight-characters), [OverconvergentAutomorphicForms:O0/weight-dual-group-map](#o0-weight-dual-group-map), [mathlib:ContinuousMonoidHom.comp](#baseline-interfaces), [PadicMeasuresIwasawaAlgebras:L0a](../packets/PadicMeasuresIwasawaAlgebras.json).

**Planned interface.** `TauCeti.HilbertWeight.weightMap`; module `TauCeti/NumberTheory/HilbertModularForms/Weights`, namespace `TauCeti.HilbertWeight`.

**Uses.**

- BHW §9 (p. 1780): the sheaf of arithmetic forms of weight κ uses κ = ρ(w_κ, t_κ) on the G*-side.

**API.**

- `TauCeti.HilbertWeight.weightMap` (constructor): κ ↦ κ ∘ ι.
- `TauCeti.HilbertWeight.weightMap_mk_apply` (characterisation): ρ(w, t) = w²·(t^{-1} ∘ N) (weight-comparison-formula).
- `TauCeti.HilbertWeight.weightMap_mul` (compatibility): ρ(κκ') = ρ(κ)ρ(κ'): ρ is a group homomorphism.

**Definition tests.**

- `weightMap_t_one` (compatibility): ρ(w, 1) = w².
- `weightMap_w_one` (compatibility): ρ(1, t) = t^{-1} ∘ N.
- `weightMap_rat` (compatibility): For F = ℚ, ρ(w, t)(x) = w(x)²t(x)^{-1}.

**Check.**

- F = ℚ: ρ(w, t)(x) = w(x)²t(x)^{-1}.
- ρ is a group homomorphism for the pointwise group structures.
- The morphism of rigid spaces 𝒲 → 𝒲* is L0a's pullback in G applied to ι; its points are ρ_R.

**Sources.**

- [BHW-2023](#source-bhw-2023), §6.1, Definition 6.1, printed p. 1756. The morphism ρ, defined through a group map.
- [BHW-2023](#source-bhw-2023), §6.1, after Definition 6.2, printed p. 1757. Weights for G are regarded as weights for G* through ρ.

<a id="o0-weight-comparison-formula"></a>

### The formula for ρ

**Lemma** · `OverconvergentAutomorphicForms:O0/weight-comparison-formula`

Imported stable target from [OverconvergentAutomorphicForms--O0.json](../packets/OverconvergentAutomorphicForms--O0.json); the following is its effective assembly contract.

For w ∈ GeomWeight F p R, t : ℤ_p^× → R^× continuous and x ∈ 𝒪_p^×: ρ(ArithWeight.mk w t)(x) = w(x)²·t(N(x))^{-1}.

**Hypotheses.**

- As in weight-comparison.

**Construction or proof.**

1. Unfold: ρ(mk w t)(x) = (mk w t)(ι x) = w(x²)·t(N(x)^{-1}) = w(x)²·t(N(x))^{-1}, using that w and t are homomorphisms.

**Prerequisites.** [OverconvergentAutomorphicForms:O0/weight-comparison](#o0-weight-comparison), [OverconvergentAutomorphicForms:O0/arithmetic-weight-characters](#o0-arithmetic-weight-characters), [OverconvergentAutomorphicForms:O0/weight-dual-group-map](#o0-weight-dual-group-map).

**Planned interface.** `TauCeti.HilbertWeight.weightMap_mk_apply`; module `TauCeti/NumberTheory/HilbertModularForms/Weights`, namespace `TauCeti.HilbertWeight`.

**Uses.**

- OverconvergentAutomorphicForms:O0/weight-comparison-norm-factor: the norm factor is read off from the formula.

**Check.**

- This is BHW's displayed κ = w²·(t^{-1} ∘ N_{F/ℚ}).
- With the printed map x ↦ (x², N(x)) one would get w(x)²·t(N(x)) instead (E1).

**Sources.**

- [BHW-2023](#source-bhw-2023), §6.1, Definition 6.1, printed p. 1756. The displayed formula; exponents checked on the page image.

<a id="o0-weight-comparison-norm-factor"></a>

### ρ(w, t)·w^{-2} factors through the norm

**Lemma** · `OverconvergentAutomorphicForms:O0/weight-comparison-norm-factor`

Imported stable target from [OverconvergentAutomorphicForms--O0.json](../packets/OverconvergentAutomorphicForms--O0.json); the following is its effective assembly contract.

For κ = ρ(mk w t) and x ∈ 𝒪_p^×: κ(x)·w(x)^{-2} = t(N(x))^{-1}. In particular κ·w^{-2} factors through N : 𝒪_p^× → ℤ_p^×.

**Hypotheses.**

- As in weight-comparison.

**Construction or proof.**

1. Rearrange weight-comparison-formula.

**Prerequisites.** [OverconvergentAutomorphicForms:O0/weight-comparison-formula](#o0-weight-comparison-formula).

**Planned interface.** `TauCeti.HilbertWeight.weightMap_mk_mul_inv_sq`; module `TauCeti/NumberTheory/HilbertModularForms/Weights`, namespace `TauCeti.HilbertWeight`.

**Check.**

- The factor left after removing w² is precisely t⁻¹∘N, with t a character of Z_p×.
- For w=N^a and t(y)=y^b, the geometric character is κ=N^(2a−b).

**Sources.**

- [BHW-2023](#source-bhw-2023), §6.1, Definition 6.1, printed p. 1756. The factorisation through the norm.

<a id="o0-weight-comparison-totally-positive-units"></a>

### ρ on totally positive global units

**Lemma** · `OverconvergentAutomorphicForms:O0/weight-comparison-totally-positive-units`

Imported stable target from [OverconvergentAutomorphicForms--O0.json](../packets/OverconvergentAutomorphicForms--O0.json); the following is its effective assembly contract.

Let F be totally real and η ∈ 𝒪_F^× totally positive (σ(η) > 0 for every real embedding σ). For κ = ρ(mk w t): κ(η)^{-1}·w(η)² = t(N(η)) = 1, where η is viewed in 𝒪_p^× by η ↦ 1 ⊗ η.

**Hypotheses.**

- F totally real; η totally positive; R any topological commutative ring.

**Construction or proof.**

1. By weight-comparison-norm-factor, κ(η)^{-1}w(η)² = t(N(1 ⊗ η)).
2. N(1 ⊗ η) = N_{F/ℚ}(η) (norm-at-p) = ±1 since η is a unit (NumberField.isUnit_iff_norm), and N_{F/ℚ}(η) = ∏_σ σ(η) > 0 (Algebra.norm_eq_prod_embeddings, all embeddings real), so N_{F/ℚ}(η) = 1 and t(1) = 1.

**Prerequisites.** [OverconvergentAutomorphicForms:O0/weight-comparison-norm-factor](#o0-weight-comparison-norm-factor), [OverconvergentAutomorphicForms:O0/norm-at-p](#o0-norm-at-p), [mathlib:NumberField.IsTotallyReal](#baseline-interfaces), [mathlib:NumberField.isUnit_iff_norm](#baseline-interfaces), [mathlib:Algebra.norm_eq_prod_embeddings](#baseline-interfaces).

**Planned interface.** `TauCeti.HilbertWeight.weightMap_mk_totallyPositive`; module `TauCeti/NumberTheory/HilbertModularForms/Weights`, namespace `TauCeti.HilbertWeight`.

**Uses.**

- BHW §9, Lemma 9.2: well-definedness of the arithmetic sheaves (3) and (4).

**Check.**

- This is BHW (9.1), which makes the conditions (3) and (4) of §9 independent of representatives.
- Total positivity is needed: for η = −1 and [F:ℚ] odd, t(N(η)) = t(−1), which can be −1.

**Sources.**

- [BHW-2023](#source-bhw-2023), §9, proof of Lemma 9.2, (9.1), printed p. 1781. (9.1): κ^{-1}(η)w(η²) = t∘N_{F/ℚ}(η) = 1 for η ∈ 𝒪_F^{×,+}.

<a id="o0-weight-radius-parameter"></a>

### The radius parameter |T_κ|

**Construction** · `OverconvergentAutomorphicForms:O0/weight-radius-parameter`

Imported stable target from [OverconvergentAutomorphicForms--O0.json](../packets/OverconvergentAutomorphicForms--O0.json); the following is its effective assembly contract.

For a normed commutative ring A and κ∈GeomWeight F p A, set T_pro(κ)=sup_{x∈H_r0}‖κ(x)−1‖, r0=1 for odd p and 3 for p=2. This replaces BHW’s all-unit supremum for the boundedness diagnostic (E2). It is not asserted to equal every universal coordinate used in the AIP annuli, and does not validate the printed analytic-radius formula (E3).

**Hypotheses.**

- A a normed commutative ring; κ continuous.

**Construction or proof.**

1. Definition as an indexed supremum (iSup) over the subgroup principal-units H_{r₀}.

**Prerequisites.** [OverconvergentAutomorphicForms:O0/principal-units](#o0-principal-units), [OverconvergentAutomorphicForms:O0/geometric-weight-characters](#o0-geometric-weight-characters).

**Planned interface.** `TauCeti.HilbertWeight.radiusParameter`; module `TauCeti/NumberTheory/HilbertModularForms/Weights`, namespace `TauCeti.HilbertWeight`.

**Uses.**

- OverconvergentAutomorphicForms:O0/analytic-continuation-of-bounded-weights: the radius of analytic continuation depends on |T_κ|.
- BHW Definitions 4.5(3) and 7.7: |δ_κ| = max(|p|, |T_κ|) and ε_κ for the AIP comparison.

**API.**

- `TauCeti.HilbertWeight.radiusParameter_one` (simp): |T_1| = 0.
- `TauCeti.HilbertWeight.radiusParameter_lt_one` (relation): Continuous characters into uniform Banach ℚ_p-algebras have |T_κ| < 1 (continuous-character-bounded).
- `TauCeti.HilbertWeight.radiusParameter_nonneg` (relation): 0 ≤ |T_κ|.

**Definition tests.**

- `radius_trivial` (compatibility): |T_1| = 0.
- `radius_teichmuller` (compatibility): F = ℚ, p odd: |T_ω| = 0 for the Teichmüller character.
- `radius_power` (compatibility): For F=Q, p odd and k∈N, T_pro(x↦x^k)=|pk|_p, including k=0.

**Check.**

- The trivial character has |T_κ| = 0.
- F = ℚ, p odd, κ = the Teichmüller character ω: |T_ω| = 0 (ω is trivial on 1 + pℤ_p), whereas BHW's printed supremum over ℤ_p^× gives 1.
- F = ℚ, p odd, κ(x) = x^k: |T_κ| = |pk|_p.

**Sources.**

- [BHW-2023](#source-bhw-2023), §6.1, after Definition 6.2, printed p. 1757. BHW's |T_κ| (supremum over 𝒪_p^× × U), corrected to the pro-p subgroup (E2).
- [BHW-2023](#source-bhw-2023), Definition 4.5(1), printed p. 1736. AIP's coordinate is on the pro-p part.

<a id="o0-continuous-character-bounded"></a>

### Continuous characters into uniform Banach algebras are bounded

**Lemma** · `OverconvergentAutomorphicForms:O0/continuous-character-bounded`

Imported stable target from [OverconvergentAutomorphicForms--O0.json](../packets/OverconvergentAutomorphicForms--O0.json); the following is its effective assembly contract.

Let A be a complete normed ℚ_p-algebra whose norm is ultrametric and power-multiplicative (a uniform Banach algebra, such as an affinoid algebra with its spectral norm). Then every κ ∈ GeomWeight F p A has |T_κ| < 1.

**Hypotheses.**

- A complete, ultrametric, ‖1‖ = 1, ‖·‖ power-multiplicative; κ continuous.

**Construction or proof.**

1. For x ∈ H_{r₀}, x^{p^n} → 1, so κ(x)^{p^n} → 1 by continuity.
2. If y = κ(x) − 1 had ‖y‖ ≥ 1, expand (1 + y)^{p^n} − 1 = y^{p^n} + Σ_{0<j<p^n} C(p^n, j) y^j. The first term has norm ‖y‖^{p^n} (power-multiplicativity), and each other term has norm ≤ |p|·‖y‖^j ≤ |p|·‖y‖^{p^n} < ‖y‖^{p^n}, since p divides C(p^n, j) and ‖y‖ ≥ 1. The norm is ultrametric, so ‖(1 + y)^{p^n} − 1‖ = ‖y‖^{p^n} ≥ 1 for all n, contradicting κ(x)^{p^n} → 1. Hence ‖κ(x) − 1‖ < 1.
3. x ↦ ‖κ(x) − 1‖ is continuous on the compact group H_{r₀} (open in the compact 𝒪_p^×), so its supremum is attained and is < 1.

**Prerequisites.** [OverconvergentAutomorphicForms:O0/weight-radius-parameter](#o0-weight-radius-parameter), [OverconvergentAutomorphicForms:O0/principal-units](#o0-principal-units), [OverconvergentAutomorphicForms:O0/units-at-p](#o0-units-at-p), [mathlib:IsModuleTopology](#baseline-interfaces).

**Planned interface.** `TauCeti.HilbertWeight.radiusParameter_lt_one`; module `TauCeti/NumberTheory/HilbertModularForms/Weights`, namespace `TauCeti.HilbertWeight`.

**Uses.**

- OverconvergentAutomorphicForms:O0/analytic-continuation-of-bounded-weights: supplies |T_κ| < 1 for affinoid coefficients.

**Check.**

- This is the coefficient-level form of 'an affinoid image is bounded'; unboundedness only occurs for non-affinoid families U, which need L0a's rigid spaces.
- Power-multiplicativity is needed: for a non-uniform norm the binomial estimate fails.
- The ultrametric hypothesis is needed for the domination step; archimedean normed algebras are excluded.

**Sources.**

- [BHW-2023](#source-bhw-2023), §6.1, Definition 6.2, printed p. 1756. Bounded means image in an affinoid; at the coefficient level this is the uniform Banach algebra case.

<a id="o0-analytic-continuation-of-bounded-weights"></a>

### Analytic continuation of bounded weights

**Theorem** · `OverconvergentAutomorphicForms:O0/analytic-continuation-of-bounded-weights`

**Planet:** Analytic continuation of weights.

Imported stable target from [OverconvergentAutomorphicForms--O0.json](../packets/OverconvergentAutomorphicForms--O0.json); the following is its effective assembly contract.

For a bounded smooth family κ:U→W*, there exists a common positive radius r<1 and a unique analytic multiplicative extension of its character to B_r(O_p^×:1)×U, agreeing with κ on O_p^××U. The extension respects multiplication wherever defined. This is an existence theorem; r=|p|^r0 |Tκ| is not asserted (E3).

**Hypotheses.**

- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Boundedness is affinoid-image boundedness. The corrected pro-p supremum is a useful diagnostic, not the universal-coordinate annulus of AIP Proposition 2.8.

**Construction or proof.**

1. Pull the family back from one affinoid of the universal compact-torus character space (PadicMeasuresIwasawaAlgebras:L0a).
2. Apply AIP ADIC Proposition 2.8 on finitely many universal-coordinate annuli/charts; use their smallest positive analytic neighbourhood. LocallyAnalyticDistributions:L0 supplies the multivariable analytic-character theorem and its normed function spaces.
3. Glue by uniqueness: a convergent analytic function vanishing on a product of small Z_p lattices is zero, by the one-variable identity theorem successively in the coordinates. Agreement at a single point of each ball would not suffice.
4. Multiplicativity follows by the same identity argument on the product neighbourhood, then descends over U by pulling back the universal construction.

**Prerequisites.** [OverconvergentAutomorphicForms:O0/geometric-weight-characters](#o0-geometric-weight-characters), [OverconvergentAutomorphicForms:O0/weight-radius-parameter](#o0-weight-radius-parameter), [OverconvergentAutomorphicForms:O0/continuous-character-bounded](#o0-continuous-character-bounded), [PadicMeasuresIwasawaAlgebras:L0a](../packets/PadicMeasuresIwasawaAlgebras.json), [LocallyAnalyticDistributions:L0/multivariable-fixed-radius](../packets/LocallyAnalyticDistributions.json), [LocallyAnalyticDistributions:L0/analytic-chart-pullback](../packets/LocallyAnalyticDistributions.json), [LocallyAnalyticDistributions:L4/affinoid-analytic-stage](../packets/LocallyAnalyticDistributions.json), [LocallyAnalyticDistributions:L4/analytic-completed-tensor](../packets/LocallyAnalyticDistributions.json), [LocallyAnalyticDistributions:L4/uniform-family-radius](../packets/LocallyAnalyticDistributions.json).

**Planned interface.** `TauCeti.Overconvergent.analytic_continuation_of_bounded_weights`; module `TauCeti/NumberTheory/HilbertModularForms/Weights`, namespace `TauCeti.HilbertWeight`.

**Uses.**

- BHW Definition 6.4: κ(cz + d) on the anticanonical neighbourhood, via κ^an.
- OverconvergentAutomorphicForms:O1: the analytic automorphy cocycle.

**Check.**

- A finite conductor character extends on sufficiently small residue balls.
- For p=3, κ(4)=ζ_9 cannot extend to the printed ball of radius 3^(−7/6), by E3.
- The trivial character extends to every admitted neighbourhood; no formula forcing r=0 is imposed.

**Sources.**

- [BHW-2023](#source-bhw-2023), §6.1, Proposition 6.3, p.1757. The existential extension is retained; the printed numerical formula is excluded by E3.
- [AIP-ADIC-2016](#source-aip-adic-2016), §2.4.3, Proposition 2.8, p.9. The universal character extends on coordinate-dependent principal-unit neighbourhoods, uniformly on the given interval.

<a id="o0-bounded-weight-families"></a>

### Bounded weight families

**Construction** · `OverconvergentAutomorphicForms:O0/bounded-weight-families`

Imported stable target from [OverconvergentAutomorphicForms--O0.json](../packets/OverconvergentAutomorphicForms--O0.json); the following is its effective assembly contract.

A bounded geometric (respectively arithmetic) family on U is a morphism to the imported W* (respectively W) factoring through an affinoid subspace, with the pulled-back universal character on O_p^××U (respectively (O_p^××Z_p^×)×U). Smoothness of the family means smoothness of U; it does not mean the weight morphism is smooth.

**Hypotheses.**

- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.

**Construction or proof.**

1. Use the universal character of L0a and pull it back; retain the chosen affinoid chart to select a common analytic neighbourhood.
2. Restriction to opens and morphisms of bases is functorial. On overlaps the same universal character gives the canonical identification.

**Prerequisites.** [PadicMeasuresIwasawaAlgebras:L0a](../packets/PadicMeasuresIwasawaAlgebras.json), [OverconvergentAutomorphicForms:O0/geometric-weight-characters](#o0-geometric-weight-characters), [OverconvergentAutomorphicForms:O0/arithmetic-weight-characters](#o0-arithmetic-weight-characters).

**Planned interface.** `TauCeti.Overconvergent.bounded_weight_families`; module `TauCeti/NumberTheory/Overconvergent/Coefficients`, namespace `TauCeti.Overconvergent`.

**Uses.**

- O2, O3, O5 and O6: A common analytic radius and compatible integral coefficient lattice are chosen for a whole bounded family.

**API.**

- `TauCeti.Overconvergent.bounded_weight_families.character` (projection): Evaluate the pulled-back universal character.
- `TauCeti.Overconvergent.bounded_weight_families.pullback` (functoriality): Pull back along U′→U, preserving boundedness and the character.
- `TauCeti.Overconvergent.bounded_weight_families.ext` (extensionality): A family is determined by its weight morphism; choices of affinoid factorisation give the same character.

**Definition tests.**

- `TauCeti.Overconvergent.Test.O0_bounded_weight_families_point` (degenerate): U=Spa(L) gives the specified single continuous character.
- `TauCeti.Overconvergent.Test.O0_bounded_weight_families_constant` (computation): A constant family has κ(x,u)=κ(x) on every fibre.
- `TauCeti.Overconvergent.Test.O0_bounded_weight_families_image` (non-example): An unbounded identity map on the entire nonquasicompact weight space has no single affinoid factorisation.

**Check.**

- A bounded geometric (respectively arithmetic) family on U is a morphism to the imported W* (respectively W) factoring through an affinoid subspace, with the pulled-back universal character on O_p^××U (respectively (O_p^××Z_p^×)×U). Smoothness of the family means smoothness of U; it does not mean the weight morphism is smooth.

**Sources.**

- [BHW-2023](#source-bhw-2023), Definition 6.2, p.1756. Bounded smooth families are the coefficient parameters used throughout §§6–10.

<a id="o0-finite-analytic-coefficients"></a>

### Finite analytic coefficient representations

**Definition** · `OverconvergentAutomorphicForms:O0/finite-analytic-coefficients`

**Planet:** Analytic coefficient representations.

Imported stable target from [OverconvergentAutomorphicForms--O0.json](../packets/OverconvergentAutomorphicForms--O0.json); the following is its effective assembly contract.

For a compact open H of a p-adic Levi M and affinoid A, a finite analytic coefficient representation is a finite projective A-module V with its canonical Banach topology and continuous A-linear H-action whose orbit maps are analytic on specified Lie charts H_n. A stable A+-lattice V+ is additional data. The representation includes scalar characters but is not required to have rank one.

**Hypotheses.**

- M is a reductive p-adic group with the analytic charts supplied by LocallyAnalyticDistributions:L0.
- A is a complete uniform affinoid Q_p-algebra; analytic extension to H_n is specified, not inferred from continuity.

**Construction or proof.**

1. Use baseline Representation for the algebraic action and imported analytic orbit maps for the chart condition.
2. Use finite-projective Banach topology from AdicSpacesPartII:R0/completed-tensor-banach-module; record rather than manufacture a stable lattice.

**Prerequisites.** [mathlib:Representation](#baseline-interfaces), [LocallyAnalyticDistributions:L0/multivariable-fixed-radius](../packets/LocallyAnalyticDistributions.json), [LocallyAnalyticDistributions:L0/analytic-chart-pullback](../packets/LocallyAnalyticDistributions.json), [LocallyAnalyticDistributions:L4/affinoid-analytic-stage](../packets/LocallyAnalyticDistributions.json), [LocallyAnalyticDistributions:L4/analytic-completed-tensor](../packets/LocallyAnalyticDistributions.json), [AdicSpacesPartII:R0/completed-tensor-banach-module](../packets/AdicSpacesPartII.json).

**Planned interface.** `TauCeti.Overconvergent.finite_analytic_coefficients`; module `TauCeti/NumberTheory/Overconvergent/Coefficients`, namespace `TauCeti.Overconvergent`.

**Uses.**

- O1 and OverconvergentAutomorphicForms:O8: Noncommutative vector coefficients use the same cocycle and descend to the algebraic vector bundles of B4.

**API.**

- `TauCeti.Overconvergent.finite_analytic_coefficients.action` (projection): ρ(h):V≃ₗ[A]V, with analytic orbit maps on H_n.
- `TauCeti.Overconvergent.finite_analytic_coefficients.changeScalars` (functoriality): Finite projective completed base change to an affinoid B, preserving the pulled-back analytic action.
- `TauCeti.Overconvergent.finite_analytic_coefficients.tensor` (structure): Tensor coefficients on V⊗_A W with diagonal action.
- `TauCeti.Overconvergent.finite_analytic_coefficients.dual` (structure): Contragredient on Hom_A(V,A), action f↦f∘ρ(h⁻¹).
- `TauCeti.Overconvergent.finite_analytic_coefficients.algebraic` (constructor): Restrict an algebraic Levi representation to H_n and extend scalars to A.

**Definition tests.**

- `TauCeti.Overconvergent.Test.O0_finite_analytic_coefficients_scalar` (compatibility): A rank-one character acts by multiplication by κ(h).
- `TauCeti.Overconvergent.Test.O0_finite_analytic_coefficients_rankTwo` (computation): On A² a diagonal torus acts by diag(χ1(h),χ2(h)), retaining both distinct characters.
- `TauCeti.Overconvergent.Test.O0_finite_analytic_coefficients_dualSign` (computation): The dual of a scalar character κ is κ⁻¹, not κ.
- `TauCeti.Overconvergent.Test.O0_finite_analytic_coefficients_continuous` (non-example): A continuous character with conductor greater than the chosen chart level is not analytic on that chart.

**Check.**

- For a compact open H of a p-adic Levi M and affinoid A, a finite analytic coefficient representation is a finite projective A-module V with its canonical Banach topology and continuous A-linear H-action whose orbit maps are analytic on specified Lie charts H_n. A stable A+-lattice V+ is additional data. The representation includes scalar characters but is not required to have rank one.

**Sources.**

- [BP-HIGHER](#source-bp-higher), §6.2, pp.147–152. Algebraic representations and analytic coefficient induction distinguish finite projective coefficients from infinite induced modules.

<a id="o0-coefficient-tensor-dual"></a>

### Tensor and dual coefficient laws

**Theorem** · `OverconvergentAutomorphicForms:O0/coefficient-tensor-dual`

Imported stable target from [OverconvergentAutomorphicForms--O0.json](../packets/OverconvergentAutomorphicForms--O0.json); the following is its effective assembly contract.

Finite analytic coefficients are closed under tensor products and contragredient duals on a common analytic chart; (V⊗W)∨≅V∨⊗W∨ for finite projective coefficients, and these identifications commute with affinoid base change. The dual of a general induced Banach module is its continuous dual; no finite-projective claim is made for it.

**Hypotheses.**

- Use finite projective modules for the algebraic dual/tensor isomorphism.
- For induced coefficients use the normed continuous dual, and retain its strong topology; general affinoid coefficients need not give orthonormalisable duals.

**Construction or proof.**

1. Apply baseline Representation.tprod and Representation.dual. In a finite projective local splitting the analytic orbit maps are matrix products and inverse-transposes.
2. Descend the dual/tensor identification from finite free modules through idempotents; finite-projective completed tensor agrees with ordinary tensor by the imported R0 theorem.

**Prerequisites.** [OverconvergentAutomorphicForms:O0/finite-analytic-coefficients](#o0-finite-analytic-coefficients), [mathlib:Representation.tprod](#baseline-interfaces), [mathlib:Representation.dual](#baseline-interfaces), [AdicSpacesPartII:R0/completed-tensor-banach-module](../packets/AdicSpacesPartII.json).

**Planned interface.** `TauCeti.Overconvergent.coefficient_tensor_dual`; module `TauCeti/NumberTheory/Overconvergent/Coefficients`, namespace `TauCeti.Overconvergent`.

**Check.**

- For two scalar coefficients the tensor weight is κλ and the dual weight κ⁻¹.
- The multiplication map on induced functions is not declared an isomorphism Ind(κ)⊗Ind(λ)≅Ind(κλ).

**Sources.**

- [BP-HIGHER](#source-bp-higher), §6.2.2–6.2.4, p.148; §6.2.20, pp.152–153. The source distinguishes finite algebraic coefficients from induced Banach coefficients and their topological duals; the finite-projective tensor/dual law is the routine idempotent argument from the listed baseline representations and R0.

<a id="o0-analytic-induced-coefficients"></a>

### Analytic induced coefficients

**Construction** · `OverconvergentAutomorphicForms:O0/analytic-induced-coefficients`

**Planet:** Locally analytic induction.

Imported stable target from [OverconvergentAutomorphicForms--O0.json](../packets/OverconvergentAutomorphicForms--O0.json); the following is its effective assembly contract.

For an n-analytic torus character κ_A and a chosen closed subgroup M_1 with Iwahori decomposition, define Vκ^{n-an} as analytic functions f on the actual adic neighbourhood M_1 M_n with f(mb)=(w0,M κ_A)(b⁻¹)f(m), for b in the upper Borel neighbourhood. Left action is (h·f)(m)=f(h⁻¹m). The locally analytic induction is colim_n Vκ^{n-an} with its LB topology; the continuous strong dual is the distribution coefficient module. At fixed n the strong dual (Vκ^{n-an})∨ need not be projective over A: BP instead defines projective Dκ^{n-an} as the compact-open continuous dual of bounded analytic functions on the open polydisc M_1 M_n°; Dκ^{lan}=lim_n Dκ^{n-an} is the dual of the locally analytic induction.

**Hypotheses.**

- Use BP §6.2’s Levi, Borel, longest Weyl element and actual analytic subgroup conventions. M_1 is closed with M_1=N̄_1 T_1 N_1, T_1=T(Z_p), and T^{M,−} normalizes N̄_1. M_1 is not required open or Zariski dense. κ_A is a character of w0,M⁻¹T(Z_p)w0,M, n-analytic after the Weyl conjugation.
- Functions are analytic on the adic thickening M_1 M_n, not merely set functions on M_1. A is uniform finite-type Tate over the coefficient field.

**Construction or proof.**

1. Import multivariable analytic function Banach modules from LAD L0; cut out right Borel equivariance as a closed submodule.
2. Iwahori factorisation identifies it with analytic functions on the opposite-unipotent neighbourhood, producing its Banach norm.
3. Left inverse translation preserves the relation. The transition maps are restriction to smaller neighbourhoods; use their specified colimit and strong-dual topologies.
4. For distributions retain §6.2.20’s bounded open-polydisc function space and compact-open dual topology. Do not identify its projective Dκ^{n-an} with the ordinary strong Banach dual over a general affinoid A.

**Prerequisites.** [LocallyAnalyticDistributions:L0/multivariable-fixed-radius](../packets/LocallyAnalyticDistributions.json), [LocallyAnalyticDistributions:L0/analytic-chart-pullback](../packets/LocallyAnalyticDistributions.json), [LocallyAnalyticDistributions:L4/affinoid-analytic-stage](../packets/LocallyAnalyticDistributions.json), [LocallyAnalyticDistributions:L4/analytic-completed-tensor](../packets/LocallyAnalyticDistributions.json), [OverconvergentAutomorphicForms:O0/bounded-weight-families](#o0-bounded-weight-families), [AdicSpacesPartII:R0/completed-tensor-banach-module](../packets/AdicSpacesPartII.json), [LocallyAnalyticDistributions:L0/radius-restriction-compact](../packets/LocallyAnalyticDistributions.json), [LocallyAnalyticDistributions:L0/compact-type-dual-reflexivity](../packets/LocallyAnalyticDistributions.json).

**Planned interface.** `TauCeti.Overconvergent.analytic_induced_coefficients`; module `TauCeti/NumberTheory/Overconvergent/Coefficients`, namespace `TauCeti.Overconvergent`.

**Uses.**

- BP §6.3; O8: Analytic inductions produce Banach sheaves and algebraic specialisation maps for higher-rank coefficients.

**API.**

- `TauCeti.Overconvergent.analytic_induced_coefficients.equivariance` (characterisation): f(mb)=(w0,M κ_A)(b⁻¹)f(m).
- `TauCeti.Overconvergent.analytic_induced_coefficients.leftAction` (structure): h·f is f(h⁻¹m), with (h1h2)·f=h1·(h2·f).
- `TauCeti.Overconvergent.analytic_induced_coefficients.unipotentChart` (equivalence): Restriction to the opposite-unipotent chart gives the analytic Banach function module.
- `TauCeti.Overconvergent.analytic_induced_coefficients.restrictRadius` (functoriality): Restriction Vκ^{n-an}→Vκ^{(n+1)-an} and its composition law.
- `TauCeti.Overconvergent.analytic_induced_coefficients.continuousDual` (constructor): Continuous A-linear dual with the strong topology; the induced action is contragredient.
- `TauCeti.Overconvergent.analytic_induced_coefficients.distributions` (constructor): Dκ^{n-an} is the compact-open continuous A-dual of bounded analytic functions on M_1 M_n°; Dκ^{lan}=lim_n Dκ^{n-an}, with the specified right (M_1,T^{M,+}) action and contragredient left (M_1,T^{M,−}) action.

**Definition tests.**

- `TauCeti.Overconvergent.Test.O0_analytic_induced_coefficients_torus` (degenerate): For M=T there is no unipotent coordinate and induction is the rank-one coefficient character with the prescribed Weyl/inverse convention.
- `TauCeti.Overconvergent.Test.O0_analytic_induced_coefficients_sl2` (non-example): For SL2 and dominant k≥0, z^(k+1) is an analytic function on the opposite-unipotent ball and is not in the embedded algebraic polynomial subspace of degree≤k.
- `TauCeti.Overconvergent.Test.O0_analytic_induced_coefficients_actionOrder` (computation): ((h1h2)·f)(m)=f(h2⁻¹h1⁻¹m).
- `TauCeti.Overconvergent.Test.O0_analytic_induced_coefficients_tensor` (non-example): For SL2 and κ=λ=1, multiplication of induced functions kills 1⊗z−z⊗1, a nonzero tensor detected by evaluation at two distinct points of the unipotent ball; it is not a tensor-product isomorphism.

**Check.**

- For a torus M=T there is no unipotent variable and induction is the rank-one coefficient with the Weyl/inverse convention.
- For SL2 and k≥0 the polynomial subspace of degree≤k is proper: z^(k+1) is analytic but outside it.
- If M_1 is not Zariski dense, functions on its adic neighbourhood cannot be replaced by functions on its rational points.
- Fixed-radius projective distributions use the bounded open-polydisc dual, not an unsupported projectivity assertion for the ordinary Banach dual.

**Sources.**

- [BP-HIGHER](#source-bp-higher), §6.2.4, pp.148–149; Remark 6.2.8, pp.149–150; §6.2.20, pp.152–153. The defining space is the genuine adic neighbourhood of a closed subgroup with Iwahori decomposition. Ordinary Banach duals and the projective bounded-open-polydisc distribution modules are distinguished.

<a id="o0-algebraic-induced-comparison"></a>

### Algebraic specialisation of analytic induction

**Comparison** · `OverconvergentAutomorphicForms:O0/algebraic-induced-comparison`

Imported stable target from [OverconvergentAutomorphicForms--O0.json](../packets/OverconvergentAutomorphicForms--O0.json); the following is its effective assembly contract.

For dominant algebraic κ, restriction of regular induced functions embeds Vκ into Vκ^{n-an} and is M_1-equivariant. For t∈T^{M,+}, ι(tv)=(w0,M κ)(t)·tι(v). A finite-order character w0,M χ:M_1→F× trivial on M_1∩M_n extends trivially across M_n and restricts to the Weyl-conjugate torus character χ. Multiplication by (w0,M χ)⁻¹ gives Vκ_A^{n-an}⊗_F F(w0,M χ)≅Vκ_Aχ^{n-an} as (M_1,T^{M,+}) modules, where the finite-character factor has trivial positive-monoid action. Algebraic restriction induces a map on continuous duals; no blanket surjectivity over A is asserted.

**Hypotheses.**

- BP algebraic induced model uses f(mb)=(w0,M κ)(b⁻¹)f(m).
- Do not remove the positive-monoid scalar, or conclude that an algebraic weight makes analytic induction finite rank.
- The finite-order character is defined on M_1, not only its torus, is trivial on M_1∩M_n, and has the explicitly trivial T^{M,+} action from BP §6.2.9.

**Construction or proof.**

1. Restrict regular functions to the analytic chart. Density of the unipotent chart and algebraic coordinates gives injectivity.
2. Compute the actions as in BP §6.2.11 (a subsection, not a lemma); positive-monoid normalization gives ι(tv)=(w0,M κ)(t)tι(v).
3. Apply Lemma 6.2.10 with its M_1-character and conductor hypotheses, multiplying by (w0,M χ)⁻¹. Proposition 6.3.6 provides the sheaf maps with its 2ρ_nc dual twist; it does not supply a general Hahn–Banach or surjectivity theorem over A.

**Prerequisites.** [OverconvergentAutomorphicForms:O0/analytic-induced-coefficients](#o0-analytic-induced-coefficients), [OverconvergentAutomorphicForms:O0/finite-analytic-coefficients](#o0-finite-analytic-coefficients), `AutomorphicBundles:B0/sections-equivariant`, `AutomorphicBundles:B2/levi-highest-weight-convention`.

**Planned interface.** `TauCeti.Overconvergent.algebraic_induced_comparison`; module `TauCeti/NumberTheory/Overconvergent/Coefficients`, namespace `TauCeti.Overconvergent`.

**Check.**

- In SL2 the finite-dimensional polynomial subspace is proper in the analytic functions.
- Scalar inverse/positive conventions must be converted explicitly before applying this to O8’s transpose convention.

**Sources.**

- [BP-HIGHER](#source-bp-higher), §6.2.9, Lemma 6.2.10 and §6.2.11, p.150; Proposition 6.3.6, p.154. The finite twist extends to M1 and is trivial on M1∩Mn. Algebraic restriction carries the positive-monoid scalar; the sheaf comparison supplies maps, with no blanket dual surjectivity.

<a id="o0-unitary-completed-coefficients"></a>

### Definite unitary completed coefficients

**Construction** · `OverconvergentAutomorphicForms:O0/unitary-completed-coefficients`

Imported stable target from [OverconvergentAutomorphicForms--O0.json](../packets/OverconvergentAutomorphicForms--O0.json); the following is its effective assembly contract.

Ŝξ,τ(U^℘,O_E)=lim_k colim_{U℘} Sξ,τ(U℘U^℘,O_E/ϖ_E^k), where f(gu)=u⁻¹f(g) in the finite automorphic function spaces. After tensoring E, Π is an admissible unitary Banach GL_n(K)-representation commuting with the tame Hecke algebra. On some compact open H its restriction is C(H,E)^s, s≥1.

**Hypotheses.**

- F/F+ is CM, G/F+ is a definite unitary group with G×F+F≅GL_n, n≥2, and every p-adic place of F+ splits in F.
- Fix ℘|p, K=F+_℘=F_℘̃, E large enough, dominant ξ_v and inertial τ_v at every other v|p with stable O_E-lattices Wξ,τ.
- U^℘ is sufficiently small; its other p-components are GL_n(O_{F+_v}); levels at inert finite places are hyperspecial. The nonzero local regular representation hypothesis Π|H≅C(H,E)^s has s≥1.

**Assembly refinement.**

- CC.8/definite-unitary-degree-zero is a GL3/all-p-variable model. The request retains general n and a single varying p-place with the other p-place coefficient lattice; its local-regularity proof is not inferred from the generic limit formula.

**Construction or proof.**

1. Import the completed topological coefficient tower and its actions from CompletedCohomologyPartII:CC.8. Admissibility and the local regular model require the separate Jacquet–Emerton/definite-unitary input recorded in the owner gap.
2. The finite double-coset description at sufficiently small level gives locally regular translation actions. The local regular model with positive multiplicity is a separate requested theorem; do not infer it from arbitrary admissibility.

**Prerequisites.** [CompletedCohomologyPartII:CC.1/fixed-exponent-smooth-colimit](../packets/CompletedCohomologyPartII.json), [CompletedCohomologyPartII:CC.1/full-local-group-smooth-action](../packets/CompletedCohomologyPartII.json), [CompletedCohomologyPartII:CC.1/tame-hecke-on-colimits](../packets/CompletedCohomologyPartII.json), [CompletedCohomologyPartII:CC.2/coefficient-limit-completion](../packets/CompletedCohomologyPartII.json), [CompletedCohomologyPartII:CC.8](../packets/CompletedCohomologyPartII.json), [OverconvergentAutomorphicForms:O0/finite-analytic-coefficients](#o0-finite-analytic-coefficients), [CompletedCohomologyPartII:CC.2/adic-topology-and-continuous-actions](../packets/CompletedCohomologyPartII.json), [CompletedCohomologyPartII:CC.2/rational-unitary-banach-tower](../packets/CompletedCohomologyPartII.json).

**Planned interface.** `TauCeti.Overconvergent.unitary_completed_coefficients`; module `TauCeti/NumberTheory/Overconvergent/Coefficients`, namespace `TauCeti.Overconvergent`.

**Uses.**

- Ding Proposition 4.14: The local regular model proves dimension and Cohen–Macaulayness via Jacquet formalism.

**API.**

- `TauCeti.Overconvergent.unitary_completed_coefficients.modPower` (projection): Projection to the k-th p-adic quotient, retaining the colimit over level.
- `TauCeti.Overconvergent.unitary_completed_coefficients.groupAction` (structure): Continuous GL_n(K)-action by translations, commuting with tame Hecke.
- `TauCeti.Overconvergent.unitary_completed_coefficients.localRegular` (equivalence): For the supplied H, Π|H≅C(H,E)^s with s≥1.

**Definition tests.**

- `TauCeti.Overconvergent.Test.O0_unitary_completed_coefficients_order` (non-example): For the local translation model H=Z_p, lim_m colim_i Map(Z/p^i,Z/p^m)=C(Z_p,Z_p). The function x↦x belongs to this completion but is not in colim_i Map(Z/p^i,Z_p), since it is not locally constant; interchanging the limits loses it.
- `TauCeti.Overconvergent.Test.O0_unitary_completed_coefficients_coefficients` (compatibility): At a finite level with coefficient W=E² and u acting by diag(a,b), the two coordinates obey f(gu)=(a⁻¹ f1(g),b⁻¹ f2(g)); replacing u⁻¹ by u gives a different coefficient condition when a² or b² is not 1.
- `TauCeti.Overconvergent.Test.O0_unitary_completed_coefficients_multiplicity` (non-example): For Π=0 the Jacquet module is zero and its coherent support/eigenvariety is empty, so the nd_K-dimensional nonzero eigenvariety conclusion requires the local regular multiplicity s≥1.

**Check.**

- Ŝξ,τ(U^℘,O_E)=lim_k colim_{U℘} Sξ,τ(U℘U^℘,O_E/ϖ_E^k), where f(gu)=u⁻¹f(g) in the finite automorphic function spaces. After tensoring E, Π is an admissible unitary Banach GL_n(K)-representation commuting with the tame Hecke algebra. On some compact open H its restriction is C(H,E)^s, s≥1.

**Sources.**

- [DING-2025](#source-ding-2025), §4.2.2, pp.66–67, definitions before Proposition 4.14. The completed automorphic coefficient representation is the input for Jacquet–Emerton eigenvarieties.

<a id="o0-unitary-jacquet-eigenvariety"></a>

### Unitary Jacquet eigenvariety coefficients

**Application** · `OverconvergentAutomorphicForms:O0/unitary-jacquet-eigenvariety`

Imported stable target from [OverconvergentAutomorphicForms--O0.json](../packets/OverconvergentAutomorphicForms--O0.json); the following is its effective assembly contract.

For the supplied Π, import Emerton’s locally Q_p-analytic vectors and J_B. Its strong dual defines the coherent eigenvariety sheaf M(U^℘) on E(U^℘)→T̂, where T̂ parametrizes continuous characters of T(K), including its n unramified coordinates. (δ,ω) is an E-point iff Hom_{T(K)}(δ,J_B(Π_Qp-an[mω]))≠0. Classical points use Π_lalg in this criterion.

**Hypotheses.**

- F/F+ is CM, G/F+ is a definite unitary group with G×F+F≅GL_n, n≥2, and every p-adic place of F+ splits in F.
- Fix ℘|p, K=F+_℘=F_℘̃, E large enough, dominant ξ_v and inertial τ_v at every other v|p with stable O_E-lattices Wξ,τ.
- U^℘ is sufficiently small; its other p-components are GL_n(O_{F+_v}); levels at inert finite places are hyperspecial. The nonzero local regular representation hypothesis Π|H≅C(H,E)^s has s≥1.

**Assembly refinement.**

- The LR.2/LR.6 nodes already supply analytic vectors, all T(K)-character coordinates and coherent Jacquet duals. The residual request is the Hecke-eigenvariety construction, dimension/depth and classical-density argument, not those generic definitions.

**Construction or proof.**

1. Use LR.2/LR.6 for analytic vectors, the full character variety and coherent Jacquet dual. The additional Hecke spectral construction is the explicit LR.6 extension request, separate from the compact Up engine of PadicFamilies L2a.
2. Split T(K)=T(O_K)×Z^n after choosing uniformizers; compact character coordinates come from PMIA L0a, while unramified coordinates are G_m^n. Choice changes coordinates, not the character functor.
3. The eigenvariety sheaf is the sheaf attached to the Jacquet strong dual, not an arbitrary coherent sheaf declared equal to it.

**Prerequisites.** [OverconvergentAutomorphicForms:O0/unitary-completed-coefficients](#o0-unitary-completed-coefficients), [PadicMeasuresIwasawaAlgebras:L0a](../packets/PadicMeasuresIwasawaAlgebras.json), [LocallyAnalyticRepresentationsOfLocalGroups:LR.2/admissible-banach-analytic-vectors](../packets/LocallyAnalyticRepresentationsOfLocalGroups.json), [LocallyAnalyticRepresentationsOfLocalGroups:LR.6/character-variety](../packets/LocallyAnalyticRepresentationsOfLocalGroups.json), [LocallyAnalyticRepresentationsOfLocalGroups:LR.6/jacquet-emerton-functor](../packets/LocallyAnalyticRepresentationsOfLocalGroups.json), [LocallyAnalyticRepresentationsOfLocalGroups:LR.6/jacquet-emerton-properties](../packets/LocallyAnalyticRepresentationsOfLocalGroups.json), [LocallyAnalyticRepresentationsOfLocalGroups:LR.6](../packets/LocallyAnalyticRepresentationsOfLocalGroups.json).

**Planned interface.** `TauCeti.Overconvergent.unitary_jacquet_eigenvariety`; module `TauCeti/NumberTheory/Overconvergent/Coefficients`, namespace `TauCeti.Overconvergent`.

**Check.**

- dim T̂=n([K:Q_p]+1), whereas the eigenvariety dimension below is n[K:Q_p].
- For n=2,K=Q_p the two dimensions are 4 and 2; do not count unramified coordinates as weight dimensions.

**Sources.**

- [DING-2025](#source-ding-2025), §4.2.2, p.67, immediately before Proposition 4.14. The support construction and its point criterion require the full T(K)-character space.

<a id="o0-unitary-eigenvariety-geometry"></a>

### Unitary eigenvariety dimension and depth

**Theorem** · `OverconvergentAutomorphicForms:O0/unitary-eigenvariety-geometry`

Imported stable target from [OverconvergentAutomorphicForms--O0.json](../packets/OverconvergentAutomorphicForms--O0.json); the following is its effective assembly contract.

Under DH and the imported Jacquet–Emerton construction, E(U^℘) is equidimensional of dimension n d_K, d_K=[K:Q_p], and its specified coherent sheaf M(U^℘) is Cohen–Macaulay over E(U^℘).

**Hypotheses.**

- All three DH hypotheses apply; the local model has s≥1.
- These are the jointly proved parts (1)–(2) of Ding Proposition 4.14, not a generic property of supports of admissible representations.

**Assembly refinement.**

- The LR.2/LR.6 nodes already supply analytic vectors, all T(K)-character coordinates and coherent Jacquet duals. The residual request is the Hecke-eigenvariety construction, dimension/depth and classical-density argument, not those generic definitions.

**Construction or proof.**

1. Apply the local regular model from unitary-completed-coefficients.
2. Invoke the precise dimension/depth theorem of the Jacquet–Emerton package (Ding proof references BHS Lemma 3.10, Proposition 3.11, Corollary 3.12 and its §5.2). This is recorded as an owner gap, not silently re-proved here.

**Prerequisites.** [OverconvergentAutomorphicForms:O0/unitary-jacquet-eigenvariety](#o0-unitary-jacquet-eigenvariety), [OverconvergentAutomorphicForms:O0/unitary-completed-coefficients](#o0-unitary-completed-coefficients), [LocallyAnalyticRepresentationsOfLocalGroups:LR.2/admissible-banach-analytic-vectors](../packets/LocallyAnalyticRepresentationsOfLocalGroups.json), [LocallyAnalyticRepresentationsOfLocalGroups:LR.6/character-variety](../packets/LocallyAnalyticRepresentationsOfLocalGroups.json), [LocallyAnalyticRepresentationsOfLocalGroups:LR.6/jacquet-emerton-functor](../packets/LocallyAnalyticRepresentationsOfLocalGroups.json), [LocallyAnalyticRepresentationsOfLocalGroups:LR.6/jacquet-emerton-properties](../packets/LocallyAnalyticRepresentationsOfLocalGroups.json), [LocallyAnalyticRepresentationsOfLocalGroups:LR.6](../packets/LocallyAnalyticRepresentationsOfLocalGroups.json).

**Planned interface.** `TauCeti.Overconvergent.unitary_eigenvariety_geometry`; module `TauCeti/NumberTheory/Overconvergent/Coefficients`, namespace `TauCeti.Overconvergent`.

**Check.**

- For n=2,K=Q_p the dimension is 2, not 4.
- Cohen–Macaulayness concerns the actual Jacquet coefficient sheaf, not every coherent sheaf.

**Sources.**

- [DING-2025](#source-ding-2025), Proposition 4.14(1)–(2), p.67. Dimension and Cohen–Macaulayness are proved together using local regularity.

<a id="o0-unitary-eigenvariety-reduced"></a>

### Reducedness of the unitary eigenvariety

**Theorem** · `OverconvergentAutomorphicForms:O0/unitary-eigenvariety-reduced`

Imported stable target from [OverconvergentAutomorphicForms--O0.json](../packets/OverconvergentAutomorphicForms--O0.json); the following is its effective assembly contract.

The same E(U^℘) is reduced, under the definite-unitary hypotheses and the classical-density theorem in the supplied Jacquet–Emerton package.

**Hypotheses.**

- F/F+ is CM, G/F+ is a definite unitary group with G×F+F≅GL_n, n≥2, and every p-adic place of F+ splits in F.
- Fix ℘|p, K=F+_℘=F_℘̃, E large enough, dominant ξ_v and inertial τ_v at every other v|p with stable O_E-lattices Wξ,τ.
- U^℘ is sufficiently small; its other p-components are GL_n(O_{F+_v}); levels at inert finite places are hyperspecial. The nonzero local regular representation hypothesis Π|H≅C(H,E)^s has s≥1.

**Assembly refinement.**

- The LR.2/LR.6 nodes already supply analytic vectors, all T(K)-character coordinates and coherent Jacquet duals. The residual request is the Hecke-eigenvariety construction, dimension/depth and classical-density argument, not those generic definitions.

**Construction or proof.**

1. Use the Jacquet formalism’s density of suitable classical points and the generic regularity argument cited by Ding Proposition 4.14(3).
2. Request this source-proof leaf from LocallyAnalyticRepresentationsOfLocalGroups LR.6, in its proposed coherent Jacquet eigenvariety extension. Reducedness does not follow just from equidimensionality or a Cohen–Macaulay sheaf.

**Prerequisites.** [OverconvergentAutomorphicForms:O0/unitary-jacquet-eigenvariety](#o0-unitary-jacquet-eigenvariety), [OverconvergentAutomorphicForms:O0/unitary-eigenvariety-geometry](#o0-unitary-eigenvariety-geometry), [LocallyAnalyticRepresentationsOfLocalGroups:LR.2/admissible-banach-analytic-vectors](../packets/LocallyAnalyticRepresentationsOfLocalGroups.json), [LocallyAnalyticRepresentationsOfLocalGroups:LR.6/character-variety](../packets/LocallyAnalyticRepresentationsOfLocalGroups.json), [LocallyAnalyticRepresentationsOfLocalGroups:LR.6/jacquet-emerton-functor](../packets/LocallyAnalyticRepresentationsOfLocalGroups.json), [LocallyAnalyticRepresentationsOfLocalGroups:LR.6/jacquet-emerton-properties](../packets/LocallyAnalyticRepresentationsOfLocalGroups.json), [LocallyAnalyticRepresentationsOfLocalGroups:LR.6](../packets/LocallyAnalyticRepresentationsOfLocalGroups.json).

**Planned interface.** `TauCeti.Overconvergent.unitary_eigenvariety_reduced`; module `TauCeti/NumberTheory/Overconvergent/Coefficients`, namespace `TauCeti.Overconvergent`.

**Check.**

- The ring E[ε]/(ε²) is Cohen–Macaulay and equidimensional but not reduced; this rules out deriving (3) from (1)–(2) alone.

**Sources.**

- [DING-2025](#source-ding-2025), Proposition 4.14(3) and proof, p.67. Reducedness has a separate density argument and therefore a separate node.

<a id="o0-siegel-analytic-coefficients"></a>

### Normalized Siegel analytic coefficients

**Construction** · `OverconvergentAutomorphicForms:O0/siegel-analytic-coefficients`

Assembly target checked by the independent review.

Fix g≥1 and rational r>0. Write I=Iw_GLg for the upper Iwahori over Z_p, I+=its diagonal-mod-p subgroup, M_s={1+E:‖E‖≤p^(−s)} over C_p, s=r+1, and G_s=I M_s. For a diagonal character κ with a unit-valued analytic extension to T^(s), define Cκ,r as the A-Banach module of analytic functions on G_s satisfying f(ℓb)=κ(b)f(ℓ) for b∈B∩G_s, κ trivial on the upper unipotent. Its norm is the finite-chart Gauss norm on the opposite-unipotent variables u_ij/p, with chart radius p^(−r); Cκ,r+ is that norm unit ball. For h∈H_s=I+ M_s define ρ_D(h)f(ℓ)=f(hᵀℓ). This is an isometric left action preserving the Gauss lattice. Products map Cκ,r×Cλ,r→Cκλ,r; affinoid scalar change and radius restriction use the analytic function modules on these same normalized charts.

**Hypotheses.**

- A is a reduced uniform affinoid over C_p, A+ is its power-bounded unit ball; use the supplied completed coefficient sheaf on a geometric base.
- The character and its inverse are power-bounded on the chosen torus extension. For the O8 family retain w>1+r_U and put r=w; this suffices for the required character extension.
- The group neighbourhood is entrywise p^(−(r+1)); the normalized lower coordinates are r-analytic. No action of I+ M_r on the whole module is asserted.

**Construction or proof.**

1. Use Iwahori factorization on I M_(r+1); after division of each lower entry by p its opposite cell is the p^(−r)-thickening of Z_p^d. Apply LAD fixed-radius multivariable analytic functions with the affinoid Gauss lattice.
2. Cut out right Borel equivariance. Left translation by hᵀ preserves the domain, since transpose preserves H_(r+1) and this group lies in G_(r+1). Its chart maps and inverse have integral analytic coefficients, as does the unit-valued character multiplier; hence translation preserves the Gauss unit ball in both directions.
3. Transpose reverses products, giving ρ_D(h1h2)=ρ_D(h1)ρ_D(h2). Multiply equivariant functions to obtain the product-weight pairing. Use LAD completed tensor and chart restriction for coefficient and radius maps.

**Prerequisites.** [OverconvergentAutomorphicForms:O0/analytic-induced-coefficients](#o0-analytic-induced-coefficients), [LocallyAnalyticDistributions:L0/multivariable-fixed-radius](../packets/LocallyAnalyticDistributions.json), [LocallyAnalyticDistributions:L0/analytic-chart-pullback](../packets/LocallyAnalyticDistributions.json), [LocallyAnalyticDistributions:L4/affinoid-analytic-stage](../packets/LocallyAnalyticDistributions.json), [LocallyAnalyticDistributions:L4/analytic-completed-tensor](../packets/LocallyAnalyticDistributions.json), [OverconvergentAutomorphicForms:O0/bounded-weight-families](#o0-bounded-weight-families).

**Planned interface.** `TauCeti.Overconvergent.siegelCoefficient`; module `TauCeti/NumberTheory/Overconvergent/Coefficients`, namespace `TauCeti.Overconvergent`.

**Uses.**

- OverconvergentAutomorphicForms:O8/siegel-analytic-instance: Provides the full normalized analytic coefficient module and its Gauss lattice for the geometric J action.
- OverconvergentAutomorphicForms:O0/analytic-induction-conventions: Identifies its domain, norm and character convention with analytic induction.

**API.**

- `TauCeti.Overconvergent.siegelCoefficient.chart` (equivalence): Restriction to the opposite cell identifies Cκ,r with the normalized finite-chart analytic function module.
- `TauCeti.Overconvergent.siegelCoefficient.action` (structure): ρ_D(h)f(ℓ)=f(hᵀℓ) for h∈H_(r+1), preserving the Gauss unit ball.
- `TauCeti.Overconvergent.siegelCoefficient.product` (functoriality): Pointwise multiplication is Cκ,r⊗̂_A Cλ,r→Cκλ,r. The transported opposite-unipotent algebra product is a separate operation.
- `TauCeti.Overconvergent.siegelCoefficient.restrict` (functoriality): For r′≥r, restrict G_(r+1) to G_(r′+1); coefficient change uses the same charts and their completed tensor modules.

**Definition tests.**

- `siegelCoefficient_genusOne` (computation): For g=1 an equivariant function is f(ℓ)=aκ(ℓ), so evaluation at 1 identifies the module and its Gauss lattice with A and A+.
- `siegelCoefficient_shift` (non-example): For g=2, trivial weight, integer r≥3 and a∈C_p with v_p(a)=r−1/2, f(t)=1/(t−a) is r-analytic on Z_p but cannot extend to the ball of radius p^(1−r) at zero. Thus I+ M_r cannot act on every such function.
- `siegelCoefficient_integral` (non-example): On any chart rescaled to a unit-disc coordinate T, (T^p−T)/p has integral values for T∈Z_p but Gauss norm p. Pointwise integrality does not define Cκ,r+.
- `siegelCoefficient_weightProduct` (characterisation): For two nontrivial diagonal characters the Borel multiplier of f g is κ(b)λ(b); it is κ(b)² for λ=κ.

**Check.**

- In genus 1 the space is the rank-one κ-character module, with its actual Gauss lattice.
- In genus 2, lower coordinate t=u21/p has analytic radius p^(−r), so the unnormalized entry radius is p^(−(r+1)).
- Pointwise multiplication on the full Iwahori sends weight κ to weight κ² and does not close a nontrivial fixed weight. Restriction to the opposite unipotent separately transports a Banach algebra structure to that space.

**Sources.**

- [drw-v3](#source-drw-v3), §2.1 p9; Definitions 3.1.10–3.1.11 and Remark 3.1.12 pp23–24. The source normalizes each lower coordinate by p. The entry radius and action group here include the resulting shift; finding E-O8-17 records the stronger printed action that fails.
- [BP-HIGHER](#source-bp-higher), §6.2.3–6.2.4 pp148–149. Analytic induction lives on a genuine group thickening and is modeled by its opposite-cell analytic functions.

<a id="o0-analytic-induction-conventions"></a>

### BP and Siegel induction conventions

**Comparison** · `OverconvergentAutomorphicForms:O0/analytic-induction-conventions`

Assembly target checked by the independent review.

For M=GL_g and M1=Iw_GLg, let BP use the character λ_BP=w0,M(κ_D⁻¹). On the same domain G_n=M1 M_n, its right-Borel rule (w0,M λ_BP)(b⁻¹) equals κ_D(b). The identity on functions is an isometry between BP V_(λ_BP)^(n-an) and C_(κ_D),r for r=n−1>0. With τ(h)=h^(−T), the actions satisfy ρ_D(h)=ρ_BP(τ(h)), h∈I+ M_n. Algebraic restriction transports through this identity and τ, after the B2 highest-weight conversion; the central character is retained. Integer n is cofinal in the rational radius system.

**Hypotheses.**

- Use one split GL_g, the same upper Borel, Weyl element and unnormalized matrix-entry domain in both models.
- The BP module uses inverse left translation; the Siegel model uses transpose left translation. Restrict to the strict subgroup, which is stable under transpose inverse.
- This adapter concerns M1 open Iwahori. The general closed, possibly non-open M1 in O0/analytic-induced-coefficients is unchanged. Positive-torus normalizations and distribution duals retain their original BP conventions.

**Construction or proof.**

1. Compute w0,M²=1 on torus characters and evaluate at b⁻¹, giving the identical Borel equivariance relation.
2. Identify BP’s lower entry variable with p times the Siegel normalized variable. The two affinoid domains and Gauss norms then agree for r=n−1.
3. Since τ is a group automorphism of the strict subgroup and τ(h)⁻¹=hᵀ, inverse left translation becomes the desired transpose action. Restriction of regular algebraic functions is equivariant under this conversion and injective because an open p-adic cell is Zariski dense.

**Prerequisites.** [OverconvergentAutomorphicForms:O0/siegel-analytic-coefficients](#o0-siegel-analytic-coefficients), [OverconvergentAutomorphicForms:O0/algebraic-induced-comparison](#o0-algebraic-induced-comparison), `AutomorphicBundles:B2/levi-highest-weight-convention`.

**Planned interface.** `TauCeti.Overconvergent.analyticInductionConventions`; module `TauCeti/NumberTheory/Overconvergent/Coefficients`, namespace `TauCeti.Overconvergent`.

**Check.**

- For g=1 λ_BP=κ_D⁻¹; the character action on each side is κ_D(h).
- For g=2 and κ_D=diag-character (k1,k2), λ_BP has exponents (−k2,−k1), not (k1,k2).
- Under a scalar h=aI the transported algebraic action keeps its central exponent; it is not silently dualized.

**Sources.**

- [BP-HIGHER](#source-bp-higher), §6.2.3–6.2.11 pp148–150. Right Borel equivariance, inverse left translation, finite twists and the algebraic restriction map.
- [drw-v3](#source-drw-v3), Definitions 3.1.10–3.1.13 pp23–24; Definition 3.4.2 p37. The normalized analytic chart and transpose action are converted explicitly into the BP convention.

### Worked check

For F=Q and p=5, take w(x)=x² and t(x)=x³. Then κ(x)=x, and at x=2 the correct value is 2; the non-inverted norm formula gives 128. This tests the sign with a nontrivial norm character. A nontrivial Teichmüller character is trivial on 1+pZ_p, so its diagnostic |Tκ| is zero although the supremum over all units is one.

For the separate unitary consumer, K=Q_p and n=2 give eigenvariety dimension 2, whereas the full torus character space has dimension 4. Removing its unramified coordinates changes the ambient space and does not prove the dimension theorem.

### Remaining mathematical inputs

- Universal compact character representability and the general-n unitary/Jacquet geometry owner requests.

- **General-n relative-place unitary completion and Jacquet eigenvariety geometry:** Extend CC.8/definite-unitary-degree-zero from its GL3/all-p-variable model to Ding §4.2.2: general n≥2, one varying place ℘, coefficients Wξ,τ at all other p-places, the stated tame/hyperspecial hypotheses, commuting tame Hecke action, admissible unitary Banach completion and the nonzero local model Π|H≅C(H,E)^s with s≥1. Reuse CC.1/CC.2 ordered-limit and action nodes; prove their finite-cell/admissibility inputs for this exact tower. Build the Hecke-eigenvariety from the coherent Jacquet dual already supplied by LR.6/jacquet-emerton-properties and the full torus character space LR.6/character-variety. Supply the definite-unitary dimension/depth theorem and classical-density/reducedness argument in Ding Proposition 4.14, with n≥2, d_K, the actual Hecke spectral algebra and s≥1. Audit the cited Breuil–Hellmann–Schraen [21] Lemma3.10, Proposition3.11, Corollary3.12/§5.2 and Corollary3.20, [20] Lemma3.8 and [25] Proposition3.9. Generic Jacquet modules and character spaces are already owned here and are not requested again.
- **Universal compact-torus character representability:** The point-character definitions and weight pullback are planned here. The root PMIA packet has no exact L0a node proving the representability functor used by these families; the precise owner request remains. LAD analytic extension does not replace that universal property.


<a id="layer-o1"></a>

## O1. Equivariant sheaves from cocycles

Right/inverse cocycle convention, finite coefficients and sheafwise equalizers; analytic line effectivity.

<a id="o1-right-automorphy-cocycle"></a>

### Right automorphy cocycles

**Definition** · `OverconvergentAutomorphicForms:O1/right-automorphy-cocycle`

**Planet:** Automorphy cocycles.

Imported stable target from [OverconvergentAutomorphicForms--O0.json](../packets/OverconvergentAutomorphicForms--O0.json); the following is its effective assembly contract.

Let X have a right Γ-action and C be a coefficient group. A right automorphy cocycle is J:Γ×X→C with J(1,x)=1 and J(γδ,x)=J(γ,x)J(δ,xγ). For a left representation ρ:C→Aut_A(V), equivariant functions satisfy f(xγ)=ρ(J(γ,x)⁻¹)f(x). In analytic geometry J is an analytic map on the actual cover and coefficient neighbourhood.

**Hypotheses.**

- Γ acts on the right. For a left action and left cocycle K with K(γδ,x)=K(γ,δx)K(δ,x), use x·γ=γ⁻¹x and J(γ,x)=K(γ⁻¹,x)⁻¹. Then left equivariance f(γx)=ρ(K(γ,x))f(x) becomes the stated right inverse-equivariance. Both the inverse group element and inverse coefficient are required in the noncommutative conversion.
- C and ρ need not commute. Analyticity and stable-lattice preservation are genuine imported conditions, not implicit in a set-theoretic cocycle.

**Construction or proof.**

1. Bundle the algebraic cocycle laws; use Representation for ρ.
2. Check consistency: successive inverse coefficient actions are ρ(Jδ(xγ)⁻¹)ρ(Jγ(x)⁻¹)=ρ((Jγ(x)Jδ(xγ))⁻¹).
3. Analytic versions import the site and coefficient neighbourhood, using AutomorphicBundles B0’s associated-bundle conventions after converting left/right actions.
4. Convert the BHW left action explicitly: its scalar coefficient multiplier is Kγ(x)=κ(jγ(x))⁻¹, so the corresponding right scalar cocycle is Jγ(x)=κ(jγ⁻¹(x)). The cz+d function itself has the left cocycle law of O2.

**Prerequisites.** [mathlib:Representation](#baseline-interfaces), `AutomorphicBundles:B0/sections-equivariant`, [AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product](../packets/AdicSpacesPartII.json).

**Planned interface.** `TauCeti.Overconvergent.RightCocycle`; module `TauCeti/NumberTheory/Overconvergent/Descent`, namespace `TauCeti.Overconvergent`.

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

**Definition tests.**

- `TauCeti.Overconvergent.Test.O1_right_automorphy_cocycle_trivial` (degenerate): J=1 gives invariant functions.
- `TauCeti.Overconvergent.Test.O1_right_automorphy_cocycle_scalarSign` (computation): For X=Γ=Z with translation, constant J(n,x)=u^n gives f(x+n)=u^(−n)f(x).
- `TauCeti.Overconvergent.Test.O1_right_automorphy_cocycle_matrixOrder` (non-example): For A⁻¹=[[1,−1],[0,1]] and B⁻¹=[[1,0],[−1,1]] over Q, B⁻¹A⁻¹=[[1,−1],[−1,2]] differs from A⁻¹B⁻¹=[[2,−1],[−1,1]].
- `TauCeti.Overconvergent.Test.O1_right_automorphy_cocycle_gaugeIdentity` (compatibility): Gauge by b(x)=1 gives the original right cocycle and the identity equivalence on equivariant functions.

**Check.**

- Trivial J gives invariant functions.
- For left K the conversion Jγ(x)=Kγ⁻¹(x)⁻¹ obeys the right law in the given order even when C is noncommutative.
- For inverse unipotent matrices A⁻¹=[[1,−1],[0,1]], B⁻¹=[[1,0],[−1,1]], the successive coefficient action is B⁻¹A⁻¹≠A⁻¹B⁻¹.

**Sources.**

- [BHW-2023](#source-bhw-2023), Definitions 6.4–6.5, pp.1757–1758. BHW uses a left level action and inverse scalar coefficient equivariance. The right noncommutative abstraction requires the explicit inversion conversion; the paper is not cited for a right cz+d law.

<a id="o1-equivariant-coefficient-sheaf"></a>

### Equivariant coefficient sheaves

**Construction** · `OverconvergentAutomorphicForms:O1/equivariant-coefficient-sheaf`

**Planet:** Equivariant coefficient sheaves.

Imported stable target from [OverconvergentAutomorphicForms--O0.json](../packets/OverconvergentAutomorphicForms--O0.json); the following is its effective assembly contract.

For an actual right Γ-torsor q:Y→X on the supplied analytic/v-site, an analytic cocycle J and coefficient module V on U, define E_J as the sheaf whose sections over W→X are analytic V-valued functions on Y_W×U satisfying f(yγ)=ρ(Jγ(y)⁻¹)f(y). Rational and integral versions use O and O+ respectively, with a specified stable lattice in the latter.

**Hypotheses.**

- The cover is the supplied torsor and its descent datum, not an unspecified map.
- V is finite analytic or the supplied Banach induced coefficient module; exactness or local freeness is not assumed for arbitrary infinite-rank coefficients.

**Construction or proof.**

1. Use the equalizer of the two action maps on q_* of analytic coefficient functions; equalizers preserve the sheaf condition.
2. The right cocycle gives a descent datum on Y×_X Y and its triple-overlap identity.
3. For finite coefficients invoke the imported associated-bundle framework; effectivity on v/profinite covers is the separate theorem below.

**Prerequisites.** [OverconvergentAutomorphicForms:O1/right-automorphy-cocycle](#o1-right-automorphy-cocycle), [OverconvergentAutomorphicForms:O0/finite-analytic-coefficients](#o0-finite-analytic-coefficients), [OverconvergentAutomorphicForms:O0/analytic-induced-coefficients](#o0-analytic-induced-coefficients), [mathlib:SheafOfModules](#baseline-interfaces), `AutomorphicBundles:B0/sections-equivariant`, `PerfectoidSpaces:P9/weight-extension-sheaf-equalizer`, `PerfectoidSpaces:P9/function-descent-along-tower`, [AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product](../packets/AdicSpacesPartII.json), [AdicSpacesPartII:R5/completed-coefficient-sheaf](../packets/AdicSpacesPartII.json), [AdicSpacesPartII:R5/coefficient-sheaf-local-equalizer](../packets/AdicSpacesPartII.json), `PerfectoidSpaces:P9/integral-matrix-coboundary-effectivity`.

**Planned interface.** `TauCeti.Overconvergent.equivariant_coefficient_sheaf`; module `TauCeti/NumberTheory/Overconvergent/Descent`, namespace `TauCeti.Overconvergent`.

**Uses.**

- O2–O5 and O8: All four Hilbert presentations and higher-rank examples are built as actual equalizers on supplied covers.

**API.**

- `TauCeti.Overconvergent.equivariant_coefficient_sheaf.sections` (characterisation): Sections are exactly the displayed equivariant analytic functions.
- `TauCeti.Overconvergent.equivariant_coefficient_sheaf.pullback` (functoriality): Base change of torsor, cocycle and coefficients induces sheaf pullback.
- `TauCeti.Overconvergent.equivariant_coefficient_sheaf.coefficientMap` (functoriality): An intertwiner of representations induces a sheaf map.
- `TauCeti.Overconvergent.equivariant_coefficient_sheaf.tensorMap` (compatibility): Pointwise tensor gives E_J(V)⊗E_J(W)→E_J(V⊗W); it is an isomorphism for effective finite locally free descent.
- `TauCeti.Overconvergent.equivariant_coefficient_sheaf.integralInclusion` (coercion): A stable V+ gives E_J+→E_J, not automatically equality after inverting p.

**Definition tests.**

- `TauCeti.Overconvergent.Test.O1_equivariant_coefficient_sheaf_identityCover` (compatibility): For the identity torsor and trivial group, E_J is the original analytic coefficient sheaf.
- `TauCeti.Overconvergent.Test.O1_equivariant_coefficient_sheaf_line` (computation): For a scalar character, equivariance is multiplication by κ(Jγ)⁻¹.
- `TauCeti.Overconvergent.Test.O1_equivariant_coefficient_sheaf_vector` (non-example): A rank-two diagonal coefficient representation produces a rank-two descended bundle when effective, not a line bundle.

**Check.**

- For an actual right Γ-torsor q:Y→X on the supplied analytic/v-site, an analytic cocycle J and coefficient module V on U, define E_J as the sheaf whose sections over W→X are analytic V-valued functions on Y_W×U satisfying f(yγ)=ρ(Jγ(y)⁻¹)f(y). Rational and integral versions use O and O+ respectively, with a specified stable lattice in the latter.

**Sources.**

- [BHW-2023](#source-bhw-2023), Definition 6.5 and Proposition 6.6, p.1758. Invariant coefficient functions give the actual sheaf, with analytic local freeness proved separately.

<a id="o1-coefficient-descent-functoriality"></a>

### Functorial coefficient descent

**Theorem** · `OverconvergentAutomorphicForms:O1/coefficient-descent-functoriality`

Imported stable target from [OverconvergentAutomorphicForms--O0.json](../packets/OverconvergentAutomorphicForms--O0.json); the following is its effective assembly contract.

Effective finite locally free cocycle descent commutes with coefficient intertwiners, tensor, contragredient dual and base pullback; iterated descent agrees with descent through an exact effective group extension. For Banach coefficients assert only the maps and exactness supplied by the relevant Banach descent theorem.

**Hypotheses.**

- Use effective descent on the indicated site. Finite quotient invariants in characteristic zero use an invertible group order; integral invariants do not inherit this automatically.
- A quotient stabilizer must act trivially on a descended coarse fibre; otherwise retain the equivariant/stack object.

**Construction or proof.**

1. Check each map on the torsor by the cocycle identity and the representation tensor/dual laws.
2. Use uniqueness of effective descent to compare the resulting maps and prove identities/composition.
3. Use AutomorphicBundles B0 ineffective-fibre criterion only for the finite tame quotient to which its hypotheses apply.

**Prerequisites.** [OverconvergentAutomorphicForms:O1/equivariant-coefficient-sheaf](#o1-equivariant-coefficient-sheaf), [OverconvergentAutomorphicForms:O0/coefficient-tensor-dual](#o0-coefficient-tensor-dual), `AutomorphicBundles:B0/ineffective-fibre-descent`, `PerfectoidSpaces:P9/weight-extension-sheaf-equalizer`, `PerfectoidSpaces:P9/function-descent-along-tower`, `PerfectoidSpaces:P9/descent-of-finite-locally-free-modules`, `PerfectoidSpaces:P9/integral-matrix-coboundary-effectivity`.

**Planned interface.** `TauCeti.Overconvergent.coefficient_descent_functoriality`; module `TauCeti/NumberTheory/Overconvergent/Descent`, namespace `TauCeti.Overconvergent`.

**Check.**

- Finite-character averaging over a p-divisible group order is valid over L but need not preserve an O+ lattice.

**Sources.**

- [BHW-2023](#source-bhw-2023), §9, Lemmas 9.3–9.7, pp.1782–1786. Comparison of the presentations retains coefficient actions and their descent data.

<a id="o1-analytic-line-effectivity"></a>

### Analytic effectivity of line descent

**Theorem** · `OverconvergentAutomorphicForms:O1/analytic-line-effectivity`

**Planet:** Analytic line descent.

Imported stable target from [OverconvergentAutomorphicForms--O0.json](../packets/OverconvergentAutomorphicForms--O0.json); the following is its effective assembly contract.

For smooth rigid X over a perfectoid field extension of Q_p and a v-line L obtained by cocycle descent, analyticity on a Zariski-dense analytic open implies analyticity on X. For a topologically finite-type formal O_K-scheme 𝔛 and a pro-etale profinite formal torsor 𝔛∞→𝔛, a continuous multiplicative cocycle c:G→O(𝔛∞)× gives a v-line on the generic fibre that is the analytification of a Zariski line on 𝔛. An arbitrary analytic O+-unit cocycle is not substituted for this formal cocycle.

**Hypotheses.**

- The first assertion is for line bundles, not arbitrary Banach or rank-r v-bundles.
- For the formal assertion the cocycle lies in units of the completed formal structural ring O(𝔛∞), reduces modulo p^m through a finite quotient, and the finite-level descended lines form a compatible effective system. The map O(𝔛∞)→O+(X∞) used by Heuer is a natural map, not an asserted general isomorphism.

**Construction or proof.**

1. Import Heuer Corollary 1.4 and Proposition 3.8 from PerfectoidSpaces:P9, as requested below.
2. Apply the first to extend ordinary analytic trivializations of the line. For the formal assertion descend at each finite quotient modulo p^m and use formal p-adic effectivity; do not swap global sections with limits on arbitrary nonaffine bases.

**Prerequisites.** [OverconvergentAutomorphicForms:O1/equivariant-coefficient-sheaf](#o1-equivariant-coefficient-sheaf), `PerfectoidSpaces:P9/weight-extension-sheaf-equalizer`, `PerfectoidSpaces:P9/function-descent-along-tower`, `PerfectoidSpaces:P9/finite-level-character-sheaf-comparison`.

**Planned interface.** `TauCeti.Overconvergent.analytic_line_effectivity`; module `TauCeti/NumberTheory/Overconvergent/Descent`, namespace `TauCeti.Overconvergent`.

**Check.**

- An arbitrary v-vector bundle is not declared analytic by this line-bundle criterion.

**Sources.**

- [HEUER-2022](#source-heuer-2022), Corollary 1.4, p.3; Proposition 3.8, p.16. Heuer’s formal cocycle lies in O(𝔛∞)× and its proof uses a natural map to analytic O+. The dense-open criterion is for v-lines on a smooth rigid space over a perfectoid extension of Q_p.

### Worked check

Let P=[[1,1],[0,1]] and Q=[[1,0],[1,1]]. If consecutive factors are P and Q, consecutive inverse actions multiply as Q⁻¹P⁻¹=[[1,−1],[−1,2]]. The reversed order gives [[2,−1],[−1,1]]. Hence the inverse-equivariance condition tests coefficient order even when a rank-one example cannot. Under a frame change, substituting f′=b⁻¹f gives exactly b(x)⁻¹Jγ(x)b(xγ).

### Remaining mathematical inputs

- The all-open/site-specific completed coefficient descent request, with genuine Gauss lattices.

- **All-open coefficient descent and the analytic AIP invariant-function theorem:** Finish the all-open/general-base geometric O/O+ descent extension identified by P9/weight-extension-sheaf-equalizer; product-affinoid descent alone does not imply rational-localization compatibility on the full weight product. Supply site-specific completed coefficient functions on the Siegel analytic, pro-Kummer-étale and toroidal diamond/v-sites, retaining the actual Gauss lattice. Apply finite/matrix-coboundary effectivity only with its hypotheses. For the analytic AIP B_m frame torsor, prove invariant geometric O+ functions are base O+ and prove valued-point lifting/reflection of bounds. This is distinct from the completed-lattice-tensor theorems and is not arbitrary Banach torsor descent.


<a id="layer-o2"></a>

## O2. Hilbert automorphy factors and domains

Actual admitted Hilbert domains, the cz+d law, frame descent and algebraic weights.

<a id="o2-admitted-hilbert-domain"></a>

### Admitted Hilbert coefficient domains

**Construction** · `OverconvergentAutomorphicForms:O2/admitted-hilbert-domain`

**Planet:** Hilbert coefficient domains.

Imported stable target from [OverconvergentAutomorphicForms--O0.json](../packets/OverconvergentAutomorphicForms--O0.json); the following is its effective assembly contract.

Choose the anticanonical Hilbert domain X_{Γ0*(p^n)}(ε)_a, n≥1 or ∞, and its infinite-level cover with T4’s Hodge–Tate coordinate z. The chosen bounded analytic weight extension and m,ε satisfy DOM; at finite level AL_n maps the level-domain of radius p^n ε to X(ε). At n=0 define on X(ε) by AL_1 from X_{Γ0*(p)}(pε)_a. This domain is the input for coefficients, rather than a definition of the Hilbert tower itself.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- At a ramified prime, retain the unsplit canonical-generator and scalar conormal-degree input requested from T4/ramified-period-comparison. The displayed inclusive radius also retains T4's equality-endpoint obligation; neither is discharged by an integral embedding-wise product decomposition.

**Construction or proof.**

1. Import canonical subgroup, anticanonical domain and z-bounds from HodgeTateAndCanonicalSubgroups:T4.
2. Intersect the geometric admissibility range with the weight-extension range. Restrictions and AL_n retain the scaled Hasse radius.
3. The corrected radius exists by O0; no ε is computed from the false printed |T| formula.

**Prerequisites.** [HodgeTateAndCanonicalSubgroups:T4/canonical-anticanonical-loci](../packets/HodgeTateAndCanonicalSubgroups.json), [HodgeTateAndCanonicalSubgroups:T4/atkin-lehner-anticanonical](../packets/HodgeTateAndCanonicalSubgroups.json), [HodgeTateAndCanonicalSubgroups:T4/hodge-tate-coordinate](../packets/HodgeTateAndCanonicalSubgroups.json), [HodgeTateAndCanonicalSubgroups:T4/period-map-inclusions](../packets/HodgeTateAndCanonicalSubgroups.json), [OverconvergentAutomorphicForms:O0/analytic-continuation-of-bounded-weights](#o0-analytic-continuation-of-bounded-weights), [OverconvergentAutomorphicForms:O0/bounded-weight-families](#o0-bounded-weight-families), [AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product](../packets/AdicSpacesPartII.json), [HodgeTateAndCanonicalSubgroups:T4](../packets/HodgeTateAndCanonicalSubgroups.json).

**Planned interface.** `TauCeti.Overconvergent.admitted_hilbert_domain`; module `TauCeti/NumberTheory/HilbertModularForms/O2`, namespace `TauCeti.Overconvergent`.

**Uses.**

- O2–O7: All analytic coefficient and Hecke maps require these explicit level/radius domains.

**API.**

- `TauCeti.Overconvergent.admitted_hilbert_domain.periodCoordinate` (projection): The supplied z lies in the indicated radius neighbourhood of O_p.
- `TauCeti.Overconvergent.admitted_hilbert_domain.restrict` (functoriality): For ε′≤ε, inclusion of the smaller anticanonical domain.
- `TauCeti.Overconvergent.admitted_hilbert_domain.atkinLehner` (equivalence): AL_n maps the level-domain of radius p^n ε to the base-domain of radius ε on the corresponding canonical domain.

**Definition tests.**

- `TauCeti.Overconvergent.Test.O2_admitted_hilbert_domain_ordinary` (degenerate): ε=0 gives the ordinary anticanonical domain.
- `TauCeti.Overconvergent.Test.O2_admitted_hilbert_domain_levelZero` (compatibility): At n=0 the definition is transported by AL_1, with pε on its level-domain and ε on its tame target.
- `TauCeti.Overconvergent.Test.O2_admitted_hilbert_domain_radius` (non-example): For p=3 and m=1 the sufficient bound is ε≤1/9; ε=1/3 fails the selected admission inequality even for the trivial continuous character.

**Check.**

- AL_n:X_{Γ0*(p^n)}(p^nε)_a≅X(ε) scales the source radius; at level zero AL_1 uses source pε and target ε.
- At p=3,m=1 the sufficient bound is ε≤1/9; ε=1/3 is outside this admitted range.
- ε=0 is the ordinary domain, whereas overconvergent forms use the positive admitted radii.

**Sources.**

- [BHW-2023](#source-bhw-2023), §5.3 and §6.2, Definitions 5.17 and 6.4–6.5, pp.1751,1757–1758. The cocycle is used only on weight-dependent anticanonical domains.

<a id="o2-hilbert-automorphy-factor"></a>

### Hilbert automorphy factors

**Construction** · `OverconvergentAutomorphicForms:O2/hilbert-automorphy-factor`

**Planet:** Hilbert automorphy factor.

Imported stable target from [OverconvergentAutomorphicForms--O0.json](../packets/OverconvergentAutomorphicForms--O0.json); the following is its effective assembly contract.

For γ=(a b;c d)∈Γ0(p), set jγ(z)=cz+d in O_p⊗O(X∞×U); T4’s coordinate transformation makes jγ a unit in the chosen analytic neighbourhood. The scalar coefficient factor is κ(jγ(z))⁻¹. For finite/vector analytic Levi coefficients use the supplied Levi-valued torsor cocycle, not a determinant character in place of the representation. The source level action is left; write f(γx)=κ(jγ(x))⁻¹f(x). For a right-action interface use x·γ=γ⁻¹x and the factor jγ⁻¹(x) as in hilbert-cocycle-law.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- Use T4’s left fractional-linear coordinate convention. For a right action explicitly convert x·γ=γ⁻¹x and invert the coefficient cocycle as in O1.
- At a ramified prime, retain the unsplit canonical-generator and scalar conormal-degree input requested from T4/ramified-period-comparison. The displayed inclusive radius also retains T4's equality-endpoint obligation; neither is discharged by an integral embedding-wise product decomposition.

**Construction or proof.**

1. Use c∈pO_p and the anticanonical z-bound to place cz+d in B_r(O_p^×:1).
2. Evaluate the selected analytic κ-extension; its inverse is defined since the extension is multiplicative into units.
3. For vectors retain the actual Levi-valued left frame cocycle and its coefficient representation. Convert to O1 with Kγ⁻¹(x)⁻¹; do not reuse the scalar commutation argument for noncommuting coefficients.

**Prerequisites.** [OverconvergentAutomorphicForms:O2/admitted-hilbert-domain](#o2-admitted-hilbert-domain), [OverconvergentAutomorphicForms:O0/analytic-continuation-of-bounded-weights](#o0-analytic-continuation-of-bounded-weights), [HodgeTateAndCanonicalSubgroups:T4/canonical-anticanonical-loci](../packets/HodgeTateAndCanonicalSubgroups.json), [HodgeTateAndCanonicalSubgroups:T4/atkin-lehner-anticanonical](../packets/HodgeTateAndCanonicalSubgroups.json), [HodgeTateAndCanonicalSubgroups:T4/hodge-tate-coordinate](../packets/HodgeTateAndCanonicalSubgroups.json), [HodgeTateAndCanonicalSubgroups:T4/period-map-inclusions](../packets/HodgeTateAndCanonicalSubgroups.json), [HodgeTateAndCanonicalSubgroups:T5/igusa-torsor](../packets/HodgeTateAndCanonicalSubgroups.json), [HodgeTateAndCanonicalSubgroups:T5/integral-differential-lattice](../packets/HodgeTateAndCanonicalSubgroups.json), [HodgeTateAndCanonicalSubgroups:T5/integral-lattice-properties](../packets/HodgeTateAndCanonicalSubgroups.json), [HodgeTateAndCanonicalSubgroups:T5/aip-torsor](../packets/HodgeTateAndCanonicalSubgroups.json), [HodgeTateAndCanonicalSubgroups:T5/hodge-tate-aip-lift](../packets/HodgeTateAndCanonicalSubgroups.json), [OverconvergentAutomorphicForms:O0/finite-analytic-coefficients](#o0-finite-analytic-coefficients), [AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product](../packets/AdicSpacesPartII.json), [HodgeTateAndCanonicalSubgroups:T4](../packets/HodgeTateAndCanonicalSubgroups.json).

**Planned interface.** `TauCeti.Overconvergent.hilbert_automorphy_factor`; module `TauCeti/NumberTheory/HilbertModularForms/O2`, namespace `TauCeti.Overconvergent`.

**Uses.**

- Definitions 6.4–6.5 and §10: The factor defines weight equivariance and coefficient identifications on correspondences.

**API.**

- `TauCeti.Overconvergent.hilbert_automorphy_factor.apply` (simp): jγ=cz+d and the section multiplier is κ(cz+d)⁻¹.
- `TauCeti.Overconvergent.hilbert_automorphy_factor.unit` (characterisation): jγ takes values in the admitted unit neighbourhood.
- `TauCeti.Overconvergent.hilbert_automorphy_factor.weightPullback` (functoriality): Pulling back κ pulls back its automorphy factor.

**Definition tests.**

- `TauCeti.Overconvergent.Test.O2_hilbert_automorphy_factor_upperUnipotent` (computation): For γ=(1 b;0 1), jγ=1.
- `TauCeti.Overconvergent.Test.O2_hilbert_automorphy_factor_diagonal` (computation): For γ=diag(a,d), the scalar section multiplier is κ(d)⁻¹.
- `TauCeti.Overconvergent.Test.O2_hilbert_automorphy_factor_determinant` (non-example): jγ is not det γ: diag(a,1) has jγ=1 even when det γ=a≠1.

**Check.**

- For γ=(a b;c d)∈Γ0(p), set jγ(z)=cz+d in O_p⊗O(X∞×U); T4’s coordinate transformation makes jγ a unit in the chosen analytic neighbourhood. The scalar coefficient factor is κ(jγ(z))⁻¹. For finite/vector analytic Levi coefficients use the supplied Levi-valued torsor cocycle, not a determinant character in place of the representation.

**Sources.**

- [BHW-2023](#source-bhw-2023), Definition 6.4, p.1757. The extension is evaluated at the actual Hodge–Tate factor, not at its reduction.

<a id="o2-hilbert-cocycle-law"></a>

### Hilbert cocycle identity

**Theorem** · `OverconvergentAutomorphicForms:O2/hilbert-cocycle-law`

Imported stable target from [OverconvergentAutomorphicForms--O0.json](../packets/OverconvergentAutomorphicForms--O0.json); the following is its effective assembly contract.

For BHW’s left level action γx, the Hilbert factor jγ(x)=cγ z(x)+dγ satisfies j_{γδ}(x)=jγ(δx)jδ(x). Its analytic character extension is multiplicative on these admitted factors, so f(γx)=κ(jγ(x))⁻¹f(x) is consistent. For x·γ=γ⁻¹x, the scalar cocycle Jγ(x)=jγ⁻¹(x) obeys O1’s right law (the scalar group is commutative). For noncommuting left frame factors K use Jγ(x)=Kγ⁻¹(x)⁻¹ and retain the representation convention of O1.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.

**Construction or proof.**

1. Use the source left fractional-linear transformation z(δx)=(aδ z(x)+bδ)/(cδ z(x)+dδ).
2. Matrix multiplication gives cγδ z+dγδ=(cγ z(δx)+dγ)(cδ z+dδ), establishing the left law.
3. Evaluate the multiplicative analytic scalar character and use inverse coefficient equivariance. For general vector factors apply the noncommutative ofLeft conversion in O1, with reversed inverse order.

**Prerequisites.** [OverconvergentAutomorphicForms:O2/hilbert-automorphy-factor](#o2-hilbert-automorphy-factor), [OverconvergentAutomorphicForms:O1/right-automorphy-cocycle](#o1-right-automorphy-cocycle), [HodgeTateAndCanonicalSubgroups:T4/canonical-anticanonical-loci](../packets/HodgeTateAndCanonicalSubgroups.json), [HodgeTateAndCanonicalSubgroups:T4/atkin-lehner-anticanonical](../packets/HodgeTateAndCanonicalSubgroups.json), [HodgeTateAndCanonicalSubgroups:T4/hodge-tate-coordinate](../packets/HodgeTateAndCanonicalSubgroups.json), [HodgeTateAndCanonicalSubgroups:T4/period-map-inclusions](../packets/HodgeTateAndCanonicalSubgroups.json).

**Planned interface.** `TauCeti.Overconvergent.hilbert_cocycle_law`; module `TauCeti/NumberTheory/HilbertModularForms/O2`, namespace `TauCeti.Overconvergent`.

**Check.**

- At p=3, γ=[[1,0],[3,1]], δ=diag(2,1), z=1, jγδ=7 and jγ(δz)jδ(z)=7; the erroneous right-action expression jγ(z)jδ(γz) is 4.
- An upper unipotent has trivial scalar factor.
- General noncommutative factors use Kγ⁻¹(x)⁻¹; coefficient factors cannot be reordered.

**Sources.**

- [BHW-2023](#source-bhw-2023), Definition 6.4 and the construction following it, pp.1757–1758. The matrix automorphy identity makes the displayed Γ-action a group action.
- [BHW-2023](#source-bhw-2023), §5.2.1, Definition 5.14, pp.1749–1750; §5.5, Lemma 5.31, p.1755; §8.2, Definition 8.8, p.1768. The level action is left and the tautological frame transforms by cz+d. The displayed left cocycle law follows by matrix multiplication.

<a id="o2-geometric-hilbert-sheaf"></a>

### Geometric overconvergent Hilbert sheaves

**Construction** · `OverconvergentAutomorphicForms:O2/geometric-hilbert-sheaf`

**Planet:** Geometric Hilbert coefficient sheaf.

Imported stable target from [OverconvergentAutomorphicForms--O0.json](../packets/OverconvergentAutomorphicForms--O0.json); the following is its effective assembly contract.

Define ω_n^κ on X_{Γ0*(p^n)}(ε)_a×U as the actual Γ0*(p^n)-equivariant coefficient functions on X_{Γ*(p∞)}(ε)_a×U with scalar factor κ(cz+d)⁻¹. For n=∞ use the corresponding kernel subgroup of the projection. For n=0 transport through AL_1. This is an analytic invertible sheaf, not an alias for AIP’s independent sheaf.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.

**Construction or proof.**

1. Use the actual left tower action and multiplier f(γx)=κ(jγ(x))⁻¹f(x); convert to O1’s right equalizer with x·γ=γ⁻¹x and Jγ=jγ⁻¹. No unconverted right cz+d identity is used.
2. On the ordinary locus use the supplied Igusa formal trivialization and analytic-line-effectivity.
3. At finite n, use O1's dense-open analytic-line criterion on the smooth rigid domain, with the actual P9 descent hypotheses. For n=∞, pull back a finite-level rational coefficient line along the level projection and use the sheafwise tower equalizer to identify that pullback with the kernel-equivariant functions. Do not apply a theorem for smooth rigid bases directly to the infinite perfectoid base. Transport n=0 through AL_1.

**Prerequisites.** [OverconvergentAutomorphicForms:O1/equivariant-coefficient-sheaf](#o1-equivariant-coefficient-sheaf), [OverconvergentAutomorphicForms:O1/analytic-line-effectivity](#o1-analytic-line-effectivity), [OverconvergentAutomorphicForms:O2/hilbert-cocycle-law](#o2-hilbert-cocycle-law), [OverconvergentAutomorphicForms:O2/admitted-hilbert-domain](#o2-admitted-hilbert-domain), `PerfectoidSpaces:P9/weight-extension-sheaf-equalizer`, `PerfectoidSpaces:P9/function-descent-along-tower`, [AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product](../packets/AdicSpacesPartII.json).

**Planned interface.** `TauCeti.Overconvergent.geometric_hilbert_sheaf`; module `TauCeti/NumberTheory/HilbertModularForms/O2`, namespace `TauCeti.Overconvergent`.

**Uses.**

- O3, O4 and O5: Integral forms, arithmetic descent and comparison all start with this independent perfectoid sheaf.

**API.**

- `TauCeti.Overconvergent.geometric_hilbert_sheaf.sections` (characterisation): Sections are the displayed κ⁻¹-equivariant analytic functions.
- `TauCeti.Overconvergent.geometric_hilbert_sheaf.localRank` (structure): Locally free rank one over O_{X×U}.
- `TauCeti.Overconvergent.geometric_hilbert_sheaf.restriction` (functoriality): The canonical map along ε′≤ε and along the specified level maps.

**Definition tests.**

- `TauCeti.Overconvergent.Test.O2_geometric_hilbert_sheaf_trivialWeight` (degenerate): κ=1 gives O_{X×U}.
- `TauCeti.Overconvergent.Test.O2_geometric_hilbert_sheaf_parallelOne` (non-example): The parallel algebraic weight x↦N(x) gives det ω; it is not the trivial character 1.
- `TauCeti.Overconvergent.Test.O2_geometric_hilbert_sheaf_finiteLevel` (compatibility): Finite-level sections pull back to the stated equivariant functions on the infinite cover.

**Check.**

- Define ω_n^κ on X_{Γ0*(p^n)}(ε)_a×U as the actual Γ0*(p^n)-equivariant coefficient functions on X_{Γ*(p∞)}(ε)_a×U with scalar factor κ(cz+d)⁻¹. For n=∞ use the corresponding kernel subgroup of the projection. For n=0 transport through AL_1. This is an analytic invertible sheaf, not an alias for AIP’s independent sheaf.

**Sources.**

- [BHW-2023](#source-bhw-2023), Definition 6.5 and Proposition 6.6, p.1758. The perfectoid definition and analytic-line theorem are independent of the later AIP construction.

<a id="o2-hilbert-level-radius-maps"></a>

### Hilbert level and radius compatibility

**Theorem** · `OverconvergentAutomorphicForms:O2/hilbert-level-radius-maps`

Imported stable target from [OverconvergentAutomorphicForms--O0.json](../packets/OverconvergentAutomorphicForms--O0.json); the following is its effective assembly contract.

The ω_n^κ pull back canonically under compatible finite/infinite level maps, rational weight pullbacks and restrictions ε′≤ε. Identifications obey identity/composition. AL_n:X_{Γ0*(p^n)}(p^nε)_a≅X(ε) transports the coefficient line on the p^nε level-domain to the ε tame-domain; in particular n=0 is defined using AL_1 from level-radius pε. Integral weight pullbacks satisfy the additional conditions of O3/hilbert-weight-pullback.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- Maps of weight families pull back the specified character and its analytic extension. Claims about sheaves do not assert arbitrary nonflat base change of global sections.

**Construction or proof.**

1. Compare both sides on the common infinite cover: the coordinate, cocycle and weight coincide.
2. O1 descent-functoriality gives unique identifications. For level zero transport the definition through AL_1 rather than asserting an unrelated tower quotient.

**Prerequisites.** [OverconvergentAutomorphicForms:O2/geometric-hilbert-sheaf](#o2-geometric-hilbert-sheaf), [OverconvergentAutomorphicForms:O1/coefficient-descent-functoriality](#o1-coefficient-descent-functoriality), [HodgeTateAndCanonicalSubgroups:T4/canonical-anticanonical-loci](../packets/HodgeTateAndCanonicalSubgroups.json), [HodgeTateAndCanonicalSubgroups:T4/atkin-lehner-anticanonical](../packets/HodgeTateAndCanonicalSubgroups.json), [HodgeTateAndCanonicalSubgroups:T4/hodge-tate-coordinate](../packets/HodgeTateAndCanonicalSubgroups.json), [HodgeTateAndCanonicalSubgroups:T4/period-map-inclusions](../packets/HodgeTateAndCanonicalSubgroups.json).

**Planned interface.** `TauCeti.Overconvergent.hilbert_level_radius_maps`; module `TauCeti/NumberTheory/HilbertModularForms/O2`, namespace `TauCeti.Overconvergent`.

**Check.**

- A composition of level/radius maps gives the same identification as the composite map.

**Sources.**

- [BHW-2023](#source-bhw-2023), Definition 6.5 and Remark 6.7, p.1758; Definition 7.13, p.1764. The definitions at level zero are transported by Atkin–Lehner and the classical specialisations retain this transport.

<a id="o2-hilbert-algebraic-specialisation"></a>

### Classical Hilbert coefficient specialisation

**Comparison** · `OverconvergentAutomorphicForms:O2/hilbert-algebraic-specialisation`

Imported stable target from [OverconvergentAutomorphicForms--O0.json](../packets/OverconvergentAutomorphicForms--O0.json); the following is its effective assembly contract.

For κ(x)=∏_{σ:F→L}σ(x)^{kσ}, the geometric ω_n^κ identifies with ⊗_σ ω_σ^{kσ} on the anticanonical domain, pulled back via the specified AL_n convention. For κ=N^k this is (det ω)^k. Locally algebraic finite characters retain their finite-level character twist.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- The embeddings and classical differential eigenlines are defined over L; integer exponents may be negative since the factors are lines.

**Construction or proof.**

1. Import the algebraic Hodge bundle and representation correspondence from AutomorphicBundles:B4.
2. T5 identifies the tautological Hodge–Tate trivialization with the differential frame; its transformation is cz+d.
3. Evaluate the algebraic character on this frame and descend. Finite-character twists are retained on their level cover.

**Prerequisites.** [OverconvergentAutomorphicForms:O2/geometric-hilbert-sheaf](#o2-geometric-hilbert-sheaf), `AutomorphicBundles:B0/sections-equivariant`, `AutomorphicBundles:B2/levi-highest-weight-convention`, [HodgeTateAndCanonicalSubgroups:T5/igusa-torsor](../packets/HodgeTateAndCanonicalSubgroups.json), [HodgeTateAndCanonicalSubgroups:T5/integral-differential-lattice](../packets/HodgeTateAndCanonicalSubgroups.json), [HodgeTateAndCanonicalSubgroups:T5/integral-lattice-properties](../packets/HodgeTateAndCanonicalSubgroups.json), [HodgeTateAndCanonicalSubgroups:T5/aip-torsor](../packets/HodgeTateAndCanonicalSubgroups.json), [HodgeTateAndCanonicalSubgroups:T5/hodge-tate-aip-lift](../packets/HodgeTateAndCanonicalSubgroups.json), `AutomorphicBundles:B4/hilbert-coefficient`.

**Planned interface.** `TauCeti.Overconvergent.hilbert_algebraic_specialisation`; module `TauCeti/NumberTheory/HilbertModularForms/O2`, namespace `TauCeti.Overconvergent`.

**Check.**

- F=Q, κ(x)=x^k recovers ω^k with the stated AL convention.
- κ=1 recovers O, whereas κ=N recovers det ω.

**Sources.**

- [BHW-2023](#source-bhw-2023), Remark 6.7, p.1758. Classical algebraic weights recover the corresponding Hodge powers, with determinant weight separated from the trivial character.

### Worked check

For F=Q, p=3, γ=[[1,0],[3,1]], δ=[[2,0],[0,1]] and z=1, the left law gives jγδ(1)=7=jγ(δ·1)jδ(1). The unconverted right formula gives jγ(1)jδ(γ·1)=4. This is an algebraic convention test; it does not assert that an arbitrary scalar coordinate specifies a geometric point of a period domain.

### Remaining mathematical inputs

- The inherited equality endpoint of T4/period-map-inclusions and the unsplit ramified canonical-generator refinement of T4/ramified-period-comparison.

- **Hilbert equality endpoints and ramified canonical generators:** Resolve the inherited equality-endpoint gap of T4/period-map-inclusions at the Hilbert bound ε≤1/(c_p p^m), c_p=2 for p≥5,3 for p=3,4 for p=2. Strict endpoint proofs alone do not cover equality. The actual coordinate, canonical/anticanonical domains and scaled AL maps already have exact T4 nodes. Also discharge T4/ramified-period-comparison's unsplit canonical-generator refinement: an O_F/p^nO_F-linear canonical subgroup generator and its congruence with the saturated Hodge–Tate kernel, using scalar conormal-degree estimates before passage to the generic splitting field. Do not identify O_p⊗O_C integrally with a product of O_C at ramified primes (BHW Proposition5.18 proof, pp1752–1753; E8). Both this refinement and the equality endpoint remain explicit hypotheses of their consumers.


<a id="layer-o3"></a>

## O3. Integral coefficients and variation in weight

Integral equalizers, local rationalisation, conditional integral weight change and ramified modified lattices.

<a id="o3-integral-hilbert-sheaf"></a>

### Integral Hilbert coefficient lattices

**Construction** · `OverconvergentAutomorphicForms:O3/integral-hilbert-sheaf`

**Planet:** Integral Hilbert coefficients.

Imported stable target from [OverconvergentAutomorphicForms--O0.json](../packets/OverconvergentAutomorphicForms--O0.json); the following is its effective assembly contract.

Define ω_n^{κ,+} as the O+ equivariance equalizer on the actual infinite-level cover, for the same left level action and multiplier κ(jγ(x))⁻¹ as ω_n^κ. The admitted factors have integral unit values. This specifies a subsheaf of rational coefficients. O5/geometric-aip-comparison identifies the two independently defined integral equalizers; positive-radius full-character local freeness additionally requires the separate O5/aip-line-and-gluing unit-trivialization input.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- The coefficient chart is equipped with A+ and the character extension has integral unit values. Integral local invertibility requires the independent AIP unit-trivialization input and the comparison; characteristic-zero averaging does not supply it.

**Construction or proof.**

1. Form the O+ equalizer using the same cocycle; inverse factors preserve O+.
2. The inclusion into rational functions is tautological. At finite level transport along the same tower and AL maps.
3. Do not assume integral local freeness here. After O5 identifies the equalizers, freeness follows only when its separate full-character integral unit-trivialization criterion is established.
4. Use O5’s integral comparison as an isomorphism of the specified O+ equalizers. Any claim of full-character positive-radius local freeness additionally requires the separate unit-trivialization input of O5/aip-line-and-gluing.

**Prerequisites.** [OverconvergentAutomorphicForms:O2/geometric-hilbert-sheaf](#o2-geometric-hilbert-sheaf), `PerfectoidSpaces:P9/weight-extension-sheaf-equalizer`, `PerfectoidSpaces:P9/function-descent-along-tower`, [AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product](../packets/AdicSpacesPartII.json).

**Planned interface.** `TauCeti.Overconvergent.integral_hilbert_sheaf`; module `TauCeti/NumberTheory/HilbertModularForms/O3`, namespace `TauCeti.Overconvergent`.

**Uses.**

- O5 and O6: The AIP comparison identifies the modified lattice; renormalized wild Hecke operators must preserve it.

**API.**

- `TauCeti.Overconvergent.integral_hilbert_sheaf.sections` (characterisation): Integral sections are the equivariant functions in q_*O+.
- `TauCeti.Overconvergent.integral_hilbert_sheaf.inclusion` (coercion): ω_n^{κ,+} embeds into ω_n^κ.
- `TauCeti.Overconvergent.integral_hilbert_sheaf.restrict` (functoriality): Compatible restriction and level maps preserve the lattice.

**Definition tests.**

- `TauCeti.Overconvergent.Test.O3_integral_hilbert_sheaf_trivial` (degenerate): At trivial weight the lattice is O+.
- `TauCeti.Overconvergent.Test.O3_integral_hilbert_sheaf_inverse` (computation): The inverse of an O+ unit factor preserves O+.
- `TauCeti.Overconvergent.Test.O3_integral_hilbert_sheaf_rationalLine` (non-example): On Spa(Q_p), Z_p and pZ_p are distinct integral submodules of Q_p but both rationalize to Q_p; rational invertibility therefore does not identify the chosen lattice.

**Check.**

- The trivial coefficient character gives O+ by the actual invariant-function descent.
- Inverting an O+ unit preserves integral functions.
- The rational line does not determine the integral equalizer: on Spa(Q_p), Z_p and pZ_p are distinct integral lattices in Q_p with identical rationalisation.

**Sources.**

- [BHW-2023](#source-bhw-2023), Definition 6.5, p.1758. The integral sheaf is defined using O+, with freeness supplied by Theorem 7.14.

<a id="o3-integral-rationalisation"></a>

### Rationalisation of integral coefficients

**Comparison** · `OverconvergentAutomorphicForms:O3/integral-rationalisation`

Imported stable target from [OverconvergentAutomorphicForms--O0.json](../packets/OverconvergentAutomorphicForms--O0.json); the following is its effective assembly contract.

On the admitted bounded-weight domains, ω_n^{κ,+}[1/p]≅ω_n^κ, and the analogous arithmetic statement holds after its descent is constructed. This is a sheaf identity; it does not assert H^0(ω+)[1/p]≅H^0(ω) on every nonquasicompact base.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- Work locally on quasicompact base and weight patches whose inverse images in the profinite level torsor are quasicompact. P9 supplies O+[1/p]=O on these inverse images, and the equivariance multipliers and their inverses are integral units. A global sections statement additionally requires a finite such cover with bounded denominators.

**Construction or proof.**

1. On a quasicompact inverse-image patch, a rational equivariant function has a finite open cover on which it is p^−N times an O+ function. Take the maximum of these finitely many denominators, using P9’s local O+[1/p]=O contract.
2. Multiplication by this single p^N preserves the same eigencondition, so the resulting section lies in the integral equalizer. The inclusion gives the reverse direction. This is a local argument on actual torsor functions, without an integral AIP generator or an interchange of arbitrary infinite invariants with localization.
3. Glue these local equalizer identifications to obtain the sheaf identity. After O4 arithmetic descent is constructed, use the same bounded-denominator argument on its quasicompact covers and its integral-unit transport maps; no division by a group order is needed.

**Prerequisites.** [OverconvergentAutomorphicForms:O3/integral-hilbert-sheaf](#o3-integral-hilbert-sheaf), `PerfectoidSpaces:P9/weight-extension-sheaf-equalizer`, `PerfectoidSpaces:P9/function-descent-along-tower`.

**Planned interface.** `TauCeti.Overconvergent.integral_rationalisation`; module `TauCeti/NumberTheory/HilbertModularForms/O3`, namespace `TauCeti.Overconvergent`.

**Check.**

- On an affinoid trivializing patch rational sections are precisely integral sections with a bounded p-denominator.

**Sources.**

- [BHW-2023](#source-bhw-2023), Definition 9.8, p.1786. The source rationalization is a sheaf statement and requires integral descent rather than arbitrary invariants/localization interchange.

<a id="o3-hilbert-weight-pullback"></a>

### Variation of Hilbert coefficients in weight

**Theorem** · `OverconvergentAutomorphicForms:O3/hilbert-weight-pullback`

Imported stable target from [OverconvergentAutomorphicForms--O0.json](../packets/OverconvergentAutomorphicForms--O0.json); the following is its effective assembly contract.

For a morphism of bounded smooth weight families U′→U pulling back κ and the chosen common analytic extension, the pulled-back geometric coefficient line is ω_n^{κ′}; with compatible integral structures the same holds integrally. These identifications commute with level and radius maps.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- Maps of weight families pull back the specified character and its analytic extension. Claims about sheaves do not assert arbitrary nonflat base change of global sections.
- Integral pullback is claimed only for flat formal coefficient changes satisfying P9’s completed-descent hypotheses, or for the explicitly proved AIP chart refinement maps. Arbitrary integral weight specialisation is excluded (AIP CUSP Remark 3.15).

**Construction or proof.**

1. On the tower, pullback of the character is exactly the new automorphy factor.
2. Use finite locally free coefficient descent and its base-change law rather than commuting arbitrary invariants with a nonflat tensor product.
3. For O+ use the requested bounded integral descent/base-change theorem on compatible integral charts.

**Prerequisites.** [OverconvergentAutomorphicForms:O3/integral-hilbert-sheaf](#o3-integral-hilbert-sheaf), [OverconvergentAutomorphicForms:O1/coefficient-descent-functoriality](#o1-coefficient-descent-functoriality), [OverconvergentAutomorphicForms:O2/hilbert-level-radius-maps](#o2-hilbert-level-radius-maps), `PerfectoidSpaces:P9/weight-extension-sheaf-equalizer`, `PerfectoidSpaces:P9/function-descent-along-tower`.

**Planned interface.** `TauCeti.Overconvergent.hilbert_weight_pullback`; module `TauCeti/NumberTheory/HilbertModularForms/O3`, namespace `TauCeti.Overconvergent`.

**Check.**

- Specialising a family to a point recovers its character sheaf.
- This theorem does not imply arbitrary base change for all fixed-radius global sections.

**Sources.**

- [BHW-2023](#source-bhw-2023), §6.1–6.2, Definitions 6.2 and 6.5, pp.1756–1758. The sheaves are defined on X×U with a universal family factor; pullback is coefficient-compatible.
- [AIP-CUSP-2016](#source-aip-cusp-2016), Remark 3.15, p.17. Integral base change can fail because finite group cohomology obstructs invariants.

<a id="o3-fixed-radius-hilbert-forms"></a>

### Fixed-radius Hilbert forms

**Construction** · `OverconvergentAutomorphicForms:O3/fixed-radius-hilbert-forms`

**Planet:** Fixed-radius Hilbert forms.

Imported stable target from [OverconvergentAutomorphicForms--O0.json](../packets/OverconvergentAutomorphicForms--O0.json); the following is its effective assembly contract.

Mκ^{G*,c}(n,N,ε;U)=H^0(X_{c,U,Γ0*(p^n),μN}(ε)_a,ω_n^κ); define Mκ^{G*,c,+} using ω_n^{κ,+}. Restriction maps go from a larger admitted neighbourhood to a smaller one. Banach and projectivity claims require the finite-level affinoid weight and cusp hypotheses in O6.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- Fix a positive prime-to-p polarisation ideal c. Both ε=0 and ε>0 have meanings, but they are different domains.

**Construction or proof.**

1. Take sections of the already constructed sheaves. The integral inclusion follows from O3 integral-hilbert-sheaf.
2. Use sheaf restriction for maps; define the fixed-radius topology from the actual affinoid/coherent or Banach coefficient model, not the discrete topology.

**Prerequisites.** [OverconvergentAutomorphicForms:O2/geometric-hilbert-sheaf](#o2-geometric-hilbert-sheaf), [OverconvergentAutomorphicForms:O3/integral-hilbert-sheaf](#o3-integral-hilbert-sheaf), [OverconvergentAutomorphicForms:O2/hilbert-level-radius-maps](#o2-hilbert-level-radius-maps), `HilbertModularVarietiesAndShimuraCurves:H3/arithmetic-quotient`, `HilbertModularVarietiesAndShimuraCurves:H3/ideal-class-comparisons`, [AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product](../packets/AdicSpacesPartII.json).

**Planned interface.** `TauCeti.Overconvergent.fixed_radius_hilbert_forms`; module `TauCeti/NumberTheory/HilbertModularForms/O3`, namespace `TauCeti.Overconvergent`.

**Uses.**

- O4, O6 and O7: Polarisation sums, Hecke operators and ordinary restriction act on these exact spaces.

**API.**

- `TauCeti.Overconvergent.fixed_radius_hilbert_forms.restrict` (functoriality): Restriction along ε′≤ε, with identity and composition.
- `TauCeti.Overconvergent.fixed_radius_hilbert_forms.integralInclusion` (coercion): Integral sections map to rational sections.
- `TauCeti.Overconvergent.fixed_radius_hilbert_forms.evaluateWeight` (functoriality): Pullback of a section to a weight fibre; no surjectivity without O6 hypotheses.

**Definition tests.**

- `TauCeti.Overconvergent.Test.O3_fixed_radius_hilbert_forms_zero` (degenerate): The zero section belongs to every fixed-radius module.
- `TauCeti.Overconvergent.Test.O3_fixed_radius_hilbert_forms_trivial` (compatibility): For κ=1 the space is H^0 of O on the actual domain.
- `TauCeti.Overconvergent.Test.O3_fixed_radius_hilbert_forms_ordinary` (non-example): ε=0 defines ordinary-locus sections and is not a synonym for positive-radius overconvergence.

**Check.**

- Mκ^{G*,c}(n,N,ε;U)=H^0(X_{c,U,Γ0*(p^n),μN}(ε)_a,ω_n^κ); define Mκ^{G*,c,+} using ω_n^{κ,+}. Restriction maps go from a larger admitted neighbourhood to a smaller one. Banach and projectivity claims require the finite-level affinoid weight and cusp hypotheses in O6.

**Sources.**

- [BHW-2023](#source-bhw-2023), Definition 6.8, p.1758. Fixed-radius spaces are global sections with the polarisation ideal, level and weight base retained.

<a id="o3-overconvergent-hilbert-forms"></a>

### Overconvergent Hilbert forms

**Construction** · `OverconvergentAutomorphicForms:O3/overconvergent-hilbert-forms`

**Planet:** Overconvergent Hilbert forms.

Imported stable target from [OverconvergentAutomorphicForms--O0.json](../packets/OverconvergentAutomorphicForms--O0.json); the following is its effective assembly contract.

Mκ^{G*,c,†}=colim_{ε>0 admitted}Mκ^{G*,c}(n,N,ε;U) along restrictions toward the ordinary locus. Its integral counterpart is the same filtered colimit of the specified lattices. The locally convex direct-limit topology is used when asserting continuity; no equality with all ordinary-locus sections is built into the definition.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- At a bounded family choose the positive cofinal system admitted for that family; compare choices via a common cofinal subsystem.

**Construction or proof.**

1. Construct the filtered colimit of actual section modules and restriction maps.
2. Equip it with the direct-limit locally convex topology supplied by LAD, using the Banach models at finite affinoid weight and finite level where available.
3. Functoriality follows from commuting restriction diagrams; cofinal changes do not change the module.

**Prerequisites.** [OverconvergentAutomorphicForms:O3/fixed-radius-hilbert-forms](#o3-fixed-radius-hilbert-forms), [LocallyAnalyticDistributions:L4/projective-banach-modules](../packets/LocallyAnalyticDistributions.json), [LocallyAnalyticDistributions:L0/multivariable-fixed-radius](../packets/LocallyAnalyticDistributions.json), [LocallyAnalyticDistributions:L0/analytic-chart-pullback](../packets/LocallyAnalyticDistributions.json), [LocallyAnalyticDistributions:L4/affinoid-analytic-stage](../packets/LocallyAnalyticDistributions.json), [LocallyAnalyticDistributions:L4/analytic-completed-tensor](../packets/LocallyAnalyticDistributions.json), [AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product](../packets/AdicSpacesPartII.json).

**Planned interface.** `TauCeti.Overconvergent.overconvergent_hilbert_forms`; module `TauCeti/NumberTheory/HilbertModularForms/O3`, namespace `TauCeti.Overconvergent`.

**Uses.**

- O6 and O7: Hecke maps pass to the colimit and ordinary restriction evaluates every positive-radius representative.

**API.**

- `TauCeti.Overconvergent.overconvergent_hilbert_forms.ofRadius` (constructor): Canonical map from any positive admitted radius.
- `TauCeti.Overconvergent.overconvergent_hilbert_forms.lift` (universal-property): Compatible linear maps from every radius induce a unique map from the colimit.
- `TauCeti.Overconvergent.overconvergent_hilbert_forms.cofinal` (equivalence): A cofinal family of positive admitted radii gives the same overconvergent module.

**Definition tests.**

- `TauCeti.Overconvergent.Test.O3_overconvergent_hilbert_forms_representative` (characterisation): Every element has a representative at some positive admitted radius.
- `TauCeti.Overconvergent.Test.O3_overconvergent_hilbert_forms_equality` (characterisation): Two representatives agree iff their restrictions agree at some smaller positive admitted radius.
- `TauCeti.Overconvergent.Test.O3_overconvergent_hilbert_forms_ordinary` (non-example): A section defined only at ε=0 has no tautological representative in this colimit.

**Check.**

- Mκ^{G*,c,†}=colim_{ε>0 admitted}Mκ^{G*,c}(n,N,ε;U) along restrictions toward the ordinary locus. Its integral counterpart is the same filtered colimit of the specified lattices. The locally convex direct-limit topology is used when asserting continuity; no equality with all ordinary-locus sections is built into the definition.

**Sources.**

- [BHW-2023](#source-bhw-2023), Definitions 6.5–6.8 and Remark 6.9, pp.1758–1759. The roadmap separates fixed positive radii, their colimit and the ordinary endpoint; AIP supplies their Banach models.

<a id="o3-ramified-modified-lattice"></a>

### Modified lattices at ramified primes

**Application** · `OverconvergentAutomorphicForms:O3/ramified-modified-lattice`

Imported stable target from [OverconvergentAutomorphicForms--O0.json](../packets/OverconvergentAutomorphicForms--O0.json); the following is its effective assembly contract.

At ramified p, the integral differential module used for AIP coefficients is ω^int, the O_F⊗O+-span of the appropriate Hodge–Tate/canonical-subgroup image. It is locally free of rank one over O_F⊗O+ in the admitted range, although the naive ω+ need not be so away from the Rapoport locus. The perfectoid integral line is compared to coefficients of ω^int, not to a nonexistent splitting of naive ω+.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- Use T5’s exact canonical-subgroup range and modified differential theorem; the Rapoport condition is not imposed globally.

**Construction or proof.**

1. Import the modified differential lattice and Hodge–Tate image from T5.
2. Use its rank-one theorem to define the differential frame torsor used by O5.
3. Retain both lattices and the map between them; only on the locus where the supplied theorem identifies them can the modification be omitted.

**Prerequisites.** [OverconvergentAutomorphicForms:O3/integral-hilbert-sheaf](#o3-integral-hilbert-sheaf), [HodgeTateAndCanonicalSubgroups:T5/igusa-torsor](../packets/HodgeTateAndCanonicalSubgroups.json), [HodgeTateAndCanonicalSubgroups:T5/integral-differential-lattice](../packets/HodgeTateAndCanonicalSubgroups.json), [HodgeTateAndCanonicalSubgroups:T5/integral-lattice-properties](../packets/HodgeTateAndCanonicalSubgroups.json), [HodgeTateAndCanonicalSubgroups:T5/aip-torsor](../packets/HodgeTateAndCanonicalSubgroups.json), [HodgeTateAndCanonicalSubgroups:T5/hodge-tate-aip-lift](../packets/HodgeTateAndCanonicalSubgroups.json).

**Planned interface.** `TauCeti.Overconvergent.ramified_modified_lattice`; module `TauCeti/NumberTheory/HilbertModularForms/O3`, namespace `TauCeti.Overconvergent`.

**Check.**

- For a split/unramified Rapoport point the expected differential eigenline model agrees with the modification.
- As a local algebra test, over k[e]/e² the regular module has e acting as a nonzero Jordan block, whereas k² with e acting by zero is not free of rank one; equal k-dimensions do not establish O_F-line freeness.

**Sources.**

- [BHW-2023](#source-bhw-2023), §7.1, pp.1759–1761. The ramified integral construction modifies the differential lattice before forming the torsor.

### Worked check

On Spa(Q_p), both Z_p and pZ_p rationalize to Q_p, but their integral sections differ. Therefore an isomorphism of rational lines cannot identify the integral equalizers. On a quasicompact torsor patch, a rational equivariant function has a bounded p-denominator; multiplying by one p^m then puts it in the integral equalizer because the multipliers are integral units. This proves local rationalization without any averaging or assertion that an arbitrary full-character integral line is free.

### Remaining mathematical inputs

- All-open geometric O+ descent and full-character positive-radius freeness. Integral base change requires flat formal maps or actual unit chart comparisons.

- **All-open coefficient descent and the analytic AIP invariant-function theorem:** Finish the all-open/general-base geometric O/O+ descent extension identified by P9/weight-extension-sheaf-equalizer; product-affinoid descent alone does not imply rational-localization compatibility on the full weight product. Supply site-specific completed coefficient functions on the Siegel analytic, pro-Kummer-étale and toroidal diamond/v-sites, retaining the actual Gauss lattice. Apply finite/matrix-coboundary effectivity only with its hypotheses. For the analytic AIP B_m frame torsor, prove invariant geometric O+ functions are base O+ and prove valued-point lifting/reflection of bounds. This is distinct from the completed-lattice-tensor theorems and is not arbitrary Banach torsor descent.
- **Full finite-character positive-radius integral freeness:** For the normalized finite-Igusa factor of a full character, including p-primary χ, prove positive-radius base-local O+ unit eigenfunctions and O+ unit transition ratios on the actual modified-lattice torsor. Universal-character formal freeness (AIP4.3/4.7) and full-character rational/ordinary invertibility (§6.4) are existing inputs, but do not by themselves supply this assertion. Integral comparison of equalizers uses boundedness on valued points and is a separate target; it does not require the unproved freeness conclusion.


<a id="layer-o4"></a>

## O4. Arithmetic descent and polarization classes

Four independent presentations, effective completed deck groups, pairing and finite polarization descent.

<a id="o4-arithmetic-representatives"></a>

### Well-defined arithmetic coefficient actions

**Theorem** · `OverconvergentAutomorphicForms:O4/arithmetic-representatives`

Imported stable target from [OverconvergentAutomorphicForms--O0.json](../packets/OverconvergentAutomorphicForms--O0.json); the following is its effective assembly contract.

For N≥4 prime to p put U_N={η∈O_F×:η≡1 mod N} and Z∞=closure(U_N) in O_p×. Every η∈U_N has N_F/Q(η)=1, even without total positivity, so N(z)=1 for z∈Z∞. For κ=w²(t∘N)⁻¹ the multipliers κ(cz+d)⁻¹w(x̄) and κ(cz+d)⁻¹w(det γ) kill respectively (zI,z²) and zI. They therefore descend continuously to E(p^n)=(Γ0(p^n)×Δ(p∞N))/Z∞ and PΓ0(p^n)=Γ0(p^n)/Z∞. The positive-unit quotient in BHW is used as a dense subgroup of E(p^n).

**Hypotheses.**

- Use H4/S5 effective quotients and all congruence units U_N. Positive global units still act by polarization, but they do not replace U_N in the central kernel.
- N≥4, p∤N; arithmetic family (w,t) as in O0, with continuous character values and continuous tower actions.

**Assembly refinement.**

- Repairs the central closure and completed deck group using the independently corrected H4/S5 interfaces; the argument also covers congruence units with mixed real signs.

**Construction or proof.**

1. For a global unit its norm is ±1. Reduction of the determinant defining the norm gives N_F/Q(η)≡1 mod N for η∈U_N. Since N≥4, the norm is +1.
2. Use O0 to compute κ(η)⁻¹w(η²)=t(Nη)=1. Extend to Z∞ by continuity of the norm and the characters.
3. Apply the explicit kernel embeddings of S5/hilbert-level-torsors. Equality on the dense subgroup extends to the completed profinite deck group.

**Prerequisites.** [OverconvergentAutomorphicForms:O0/weight-comparison-totally-positive-units](#o0-weight-comparison-totally-positive-units), [OverconvergentAutomorphicForms:O2/hilbert-cocycle-law](#o2-hilbert-cocycle-law), `HilbertModularVarietiesAndShimuraCurves:H4/effective-level-groups`, `HilbertModularVarietiesAndShimuraCurves:H4/finite-level-torsors`.

**Planned interface.** `TauCeti.Overconvergent.arithmetic_representatives`; module `TauCeti/NumberTheory/HilbertModularForms/O4`, namespace `TauCeti.Overconvergent`.

**Check.**

- Test the entire congruence-unit kernel, not only its totally positive subgroup.
- At N=2, F=Q and η=−1 show why the congruence argument cannot omit the fine-level bound.
- The pairing eβ is a function on the hybrid tower; the arithmetic tower has only its class modulo the positive-unit closure.

**Sources.**

- [BHW-2023](#source-bhw-2023), Lemma 9.2 and equation (9.1), pp.1781–1782. The norm-one identity is exactly what makes both quotient actions well-defined.

<a id="o4-effective-arithmetic-descent"></a>

### Effective arithmetic coefficient descent

**Theorem** · `OverconvergentAutomorphicForms:O4/effective-arithmetic-descent`

Assembly target checked by the independent review.

On the hybrid Hilbert tower, use the completed group E(p^n)=(Γ0(p^n)×Δ(p∞N))/Z∞, with Z∞ the closure of U_N and z↦(zI,z²). On the arithmetic tower use PΓ0(p^n)=Γ0(p^n)/Z∞. For κ=w²(t∘N)⁻¹, the continuous multipliers κ(cz+d)⁻¹w(x̄) and κ(cz+d)⁻¹w(det γ) descend to these groups and agree with the independently defined O4 presentation equalizers. Requiring equivariance on the dense positive-unit subgroup of E(p^n) is equivalent to requiring it on the entire completed deck group.

**Hypotheses.**

- F totally real, N≥4 prime to p, and the actual finite-level quotients/tower actions supplied by H4/S5.
- The character family and automorphy factor are admitted as in O2; the coefficient topology is separated and the action continuous.
- Only the hybrid tower has an O_p×-valued eβ. On the arithmetic tower the pairing is defined modulo the positive-unit closure.

**Construction or proof.**

1. Apply O4/arithmetic-representatives to all U_N, then pass to its closure. The central multiplier is t(Nz)=1.
2. Use S5’s inverse limit of finite effective deck groups, rather than replacing it by its dense abstract subgroup.
3. For each section, the equality of its two continuous translates is closed in the deck group, since the section module is Hausdorff. Equality on a dense subgroup is equivalent to equality everywhere, locally and compatibly with restriction.

**Prerequisites.** [OverconvergentAutomorphicForms:O4/arithmetic-representatives](#o4-arithmetic-representatives), [OverconvergentAutomorphicForms:O2/hilbert-cocycle-law](#o2-hilbert-cocycle-law), `HilbertModularVarietiesAndShimuraCurves:H3/congruence-units`, `HilbertModularVarietiesAndShimuraCurves:H4/level-scalar-kernel`, `HilbertModularVarietiesAndShimuraCurves:H4/projective-level-group`, [PerfectoidShimuraVarieties:S5/hilbert-level-torsors](../packets/PerfectoidShimuraVarieties.json), [PerfectoidShimuraVarieties:S5/hilbert-weil-pairing](../packets/PerfectoidShimuraVarieties.json).

**Planned interface.** `TauCeti.Overconvergent.effective_arithmetic_descent`; module `TauCeti/NumberTheory/HilbertModularForms/O4`, namespace `TauCeti.Overconvergent`.

**Check.**

- For F=Q the fine-level congruence-unit group is trivial and the arithmetic kernel has no extra spurious p-adic units.
- Check both positive and mixed-sign norm-one congruence units; total positivity is not part of the kernel definition.
- At N=2 the norm-one proof fails for −1∈Z×, showing the explicit fine-level condition is necessary for this argument.

**Sources.**

- [BHW-2023](#source-bhw-2023), Definition 9.1 and Lemma 9.2 pp1780–1782; §8.2–8.4 pp1768–1779. Use the section multipliers with the corrected effective quotient supplied by H4/S5. Norm congruence extends the positive-unit cancellation to all congruence units.

<a id="o4-presentation-geometric-small"></a>

### Geometric small-cover coefficients

**Construction** · `OverconvergentAutomorphicForms:O4/presentation-geometric-small`

**Planet:** Geometric small-cover coefficients.

Imported stable target from [OverconvergentAutomorphicForms--O0.json](../packets/OverconvergentAutomorphicForms--O0.json); the following is its effective assembly contract.

Define presentation (1) independently as the O+ equivariance equalizer on the actual cover X_{U,Γ*(p∞)}(ε)_a×U, with acting group Γ0*(p^n) and section transformation multiplier κ(cz+d)⁻¹; rational coefficients replace O+ by O. Push forward to the finite-level base. None of the four definitions is an abbreviation for another.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- An arithmetic family is κ_ar=(w,t), with geometric κ=ρ(w,t). n≥1 or ∞; level zero is transported separately by AL_1.

**Construction or proof.**

1. Import the stated cover, group action and quotient from H4/S5. Use the same pulled-back Hodge–Tate coordinate on that cover.
2. Form O1’s equivariant-function equalizer. For quotient groups the next representative-independence theorem is needed before the action is well-defined.
3. Retain the separate cover and action as construction data; comparisons are subsequent maps, not definitional equalities.

**Prerequisites.** [OverconvergentAutomorphicForms:O1/equivariant-coefficient-sheaf](#o1-equivariant-coefficient-sheaf), [OverconvergentAutomorphicForms:O2/hilbert-automorphy-factor](#o2-hilbert-automorphy-factor), `HilbertModularVarietiesAndShimuraCurves:H4/effective-level-groups`, `HilbertModularVarietiesAndShimuraCurves:H4/finite-level-torsors`, [PerfectoidShimuraVarieties:S5/hilbert-three-towers](../packets/PerfectoidShimuraVarieties.json), [PerfectoidShimuraVarieties:S5/hilbert-level-torsors](../packets/PerfectoidShimuraVarieties.json), [PerfectoidShimuraVarieties:S5/hilbert-period-and-domain-compatibility](../packets/PerfectoidShimuraVarieties.json), [AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product](../packets/AdicSpacesPartII.json).

**Planned interface.** `TauCeti.Overconvergent.presentation_geometric_small`; module `TauCeti/NumberTheory/HilbertModularForms/O4`, namespace `TauCeti.Overconvergent`.

**Uses.**

- Lemmas 9.2–9.7 and Theorem 9.12: Presentation (1) participates in explicit integral and rational comparison maps.

**API.**

- `TauCeti.Overconvergent.presentation_geometric_small.sections` (characterisation): Sections satisfy exactly the Γ0*(p^n)-equivariance condition with multiplier κ(cz+d)⁻¹.
- `TauCeti.Overconvergent.presentation_geometric_small.integralInclusion` (coercion): The O+ equalizer embeds in its O version.
- `TauCeti.Overconvergent.presentation_geometric_small.pullback` (functoriality): Compatible level, radius and weight pullback retains this cover and coefficient action.

**Definition tests.**

- `TauCeti.Overconvergent.Test.O4_presentation_geometric_small_trivial` (degenerate): When w=t=1, the presentation is the structural sheaf on its own quotient base.
- `TauCeti.Overconvergent.Test.O4_presentation_geometric_small_factor` (computation): The section multiplier on a group element is κ(cz+d)⁻¹, including its sign and determinant/polarisation component.
- `TauCeti.Overconvergent.Test.O4_presentation_geometric_small_cover` (computation): For ε∈Z_p^×, diag(ε,1) has j=1 and fixes every weight-equivariant coefficient function on the small cover; this is the invariance used in the full-cover comparison.

**Check.**

- Define presentation (1) independently as the O+ equivariance equalizer on the actual cover X_{U,Γ*(p∞)}(ε)_a×U, with acting group Γ0*(p^n) and section transformation multiplier κ(cz+d)⁻¹; rational coefficients replace O+ by O. Push forward to the finite-level base. None of the four definitions is an abbreviation for another.

**Sources.**

- [BHW-2023](#source-bhw-2023), Definition 9.1(1), pp.1780–1781. The Γ0*(p^n)-action on X_{U,Γ*(p∞)} gives this distinct presentation and its precise coefficient multiplier.

<a id="o4-presentation-geometric-full"></a>

### Geometric full-cover coefficients

**Construction** · `OverconvergentAutomorphicForms:O4/presentation-geometric-full`

Imported stable target from [OverconvergentAutomorphicForms--O0.json](../packets/OverconvergentAutomorphicForms--O0.json); the following is its effective assembly contract.

Define presentation (2) independently as the O+ equivariance equalizer on the actual cover X_{U,Γ(p∞)}(ε)_a×U, with acting group Γ0(p^n) and section transformation multiplier κ(cz+d)⁻¹; rational coefficients replace O+ by O. Push forward to the finite-level base. None of the four definitions is an abbreviation for another.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- An arithmetic family is κ_ar=(w,t), with geometric κ=ρ(w,t). n≥1 or ∞; level zero is transported separately by AL_1.

**Construction or proof.**

1. Import the stated cover, group action and quotient from H4/S5. Use the same pulled-back Hodge–Tate coordinate on that cover.
2. Form O1’s equivariant-function equalizer. For quotient groups the next representative-independence theorem is needed before the action is well-defined.
3. Retain the separate cover and action as construction data; comparisons are subsequent maps, not definitional equalities.

**Prerequisites.** [OverconvergentAutomorphicForms:O1/equivariant-coefficient-sheaf](#o1-equivariant-coefficient-sheaf), [OverconvergentAutomorphicForms:O2/hilbert-automorphy-factor](#o2-hilbert-automorphy-factor), `HilbertModularVarietiesAndShimuraCurves:H4/effective-level-groups`, `HilbertModularVarietiesAndShimuraCurves:H4/finite-level-torsors`, [PerfectoidShimuraVarieties:S5/hilbert-three-towers](../packets/PerfectoidShimuraVarieties.json), [PerfectoidShimuraVarieties:S5/hilbert-level-torsors](../packets/PerfectoidShimuraVarieties.json), [PerfectoidShimuraVarieties:S5/hilbert-period-and-domain-compatibility](../packets/PerfectoidShimuraVarieties.json), [AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product](../packets/AdicSpacesPartII.json).

**Planned interface.** `TauCeti.Overconvergent.presentation_geometric_full`; module `TauCeti/NumberTheory/HilbertModularForms/O4`, namespace `TauCeti.Overconvergent`.

**Uses.**

- Lemmas 9.2–9.7 and Theorem 9.12: Presentation (2) participates in explicit integral and rational comparison maps.

**API.**

- `TauCeti.Overconvergent.presentation_geometric_full.sections` (characterisation): Sections satisfy exactly the Γ0(p^n)-equivariance condition with multiplier κ(cz+d)⁻¹.
- `TauCeti.Overconvergent.presentation_geometric_full.integralInclusion` (coercion): The O+ equalizer embeds in its O version.
- `TauCeti.Overconvergent.presentation_geometric_full.pullback` (functoriality): Compatible level, radius and weight pullback retains this cover and coefficient action.

**Definition tests.**

- `TauCeti.Overconvergent.Test.O4_presentation_geometric_full_trivial` (degenerate): When w=t=1, the presentation is the structural sheaf on its own quotient base.
- `TauCeti.Overconvergent.Test.O4_presentation_geometric_full_factor` (computation): The section multiplier on a group element is κ(cz+d)⁻¹, including its sign and determinant/polarisation component.
- `TauCeti.Overconvergent.Test.O4_presentation_geometric_full_cover` (computation): For u∈O_p^×, diag(u,1) has j=1 and fixes a section of presentation (2), while its determinant may be nontrivial.

**Check.**

- Define presentation (2) independently as the O+ equivariance equalizer on the actual cover X_{U,Γ(p∞)}(ε)_a×U, with acting group Γ0(p^n) and section transformation multiplier κ(cz+d)⁻¹; rational coefficients replace O+ by O. Push forward to the finite-level base. None of the four definitions is an abbreviation for another.

**Sources.**

- [BHW-2023](#source-bhw-2023), Definition 9.1(2), pp.1780–1781. The Γ0(p^n)-action on X_{U,Γ(p∞)} gives this distinct presentation and its precise coefficient multiplier.

<a id="o4-presentation-arithmetic-intermediate"></a>

### Arithmetic intermediate-cover coefficients

**Construction** · `OverconvergentAutomorphicForms:O4/presentation-arithmetic-intermediate`

**Planet:** Arithmetic intermediate-cover coefficients.

Imported stable target from [OverconvergentAutomorphicForms--O0.json](../packets/OverconvergentAutomorphicForms--O0.json); the following is its effective assembly contract.

Define presentation (3) independently as the O+ equivariance equalizer on the actual cover X_{U,Γ(p∞)}(ε)_a×U, with acting group E(p^n) and section transformation multiplier κ(cz+d)⁻¹w(x̄) for a representative (γ,x); rational coefficients replace O+ by O. Push forward to the finite-level base. None of the four definitions is an abbreviation for another. The effective deck group and its continuous action are those of O4/effective-arithmetic-descent, with the closure of all units congruent to 1 modulo N.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- An arithmetic family is κ_ar=(w,t), with geometric κ=ρ(w,t). n≥1 or ∞; level zero is transported separately by AL_1.
- N≥4 and p∤N; x is in Δ(p∞N) and x̄ denotes its supplied image in O_p×.

**Assembly refinement.**

- Use the completed effective deck group, with x̄ in the intermediate multiplier. The abstract positive-unit quotient is a dense subgroup, not the whole group.

**Construction or proof.**

1. Import the stated cover, group action and quotient from H4/S5. Use the same pulled-back Hodge–Tate coordinate on that cover.
2. Form O1’s equivariant-function equalizer. For quotient groups the next representative-independence theorem is needed before the action is well-defined.
3. Retain the separate cover and action as construction data; comparisons are subsequent maps, not definitional equalities.

**Prerequisites.** [OverconvergentAutomorphicForms:O1/equivariant-coefficient-sheaf](#o1-equivariant-coefficient-sheaf), [OverconvergentAutomorphicForms:O2/hilbert-automorphy-factor](#o2-hilbert-automorphy-factor), `HilbertModularVarietiesAndShimuraCurves:H4/effective-level-groups`, `HilbertModularVarietiesAndShimuraCurves:H4/finite-level-torsors`, [PerfectoidShimuraVarieties:S5/hilbert-three-towers](../packets/PerfectoidShimuraVarieties.json), [PerfectoidShimuraVarieties:S5/hilbert-level-torsors](../packets/PerfectoidShimuraVarieties.json), [PerfectoidShimuraVarieties:S5/hilbert-period-and-domain-compatibility](../packets/PerfectoidShimuraVarieties.json), [OverconvergentAutomorphicForms:O0/weight-comparison-totally-positive-units](#o0-weight-comparison-totally-positive-units), [OverconvergentAutomorphicForms:O4/arithmetic-representatives](#o4-arithmetic-representatives), [AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product](../packets/AdicSpacesPartII.json), [OverconvergentAutomorphicForms:O4/effective-arithmetic-descent](#o4-effective-arithmetic-descent).

**Planned interface.** `TauCeti.Overconvergent.presentation_arithmetic_intermediate`; module `TauCeti/NumberTheory/HilbertModularForms/O4`, namespace `TauCeti.Overconvergent`.

**Uses.**

- Lemmas 9.2–9.7 and Theorem 9.12: Presentation (3) participates in explicit integral and rational comparison maps.

**API.**

- `TauCeti.Overconvergent.presentation_arithmetic_intermediate.sections` (characterisation): Sections satisfy exactly the E(p^n)-equivariance condition with multiplier κ(cz+d)⁻¹w(x̄) for a representative (γ,x).
- `TauCeti.Overconvergent.presentation_arithmetic_intermediate.integralInclusion` (coercion): The O+ equalizer embeds in its O version.
- `TauCeti.Overconvergent.presentation_arithmetic_intermediate.pullback` (functoriality): Compatible level, radius and weight pullback retains this cover and coefficient action.

**Definition tests.**

- `TauCeti.Overconvergent.Test.O4_presentation_arithmetic_intermediate_trivial` (degenerate): When w=t=1, the presentation is the structural sheaf on its own quotient base.
- `TauCeti.Overconvergent.Test.O4_presentation_arithmetic_intermediate_factor` (computation): The section multiplier on a group element is κ(cz+d)⁻¹w(x̄) for a representative (γ,x), including its sign and determinant/polarisation component.
- `TauCeti.Overconvergent.Test.O4_presentation_arithmetic_intermediate_cover` (compatibility): For every η∈U_N, and then every z∈Z∞ by continuity, the central representative change leaves the section multiplier unchanged.

**Check.**

- Define presentation (3) independently as the O+ equivariance equalizer on the actual cover X_{U,Γ(p∞)}(ε)_a×U, with acting group E(p^n) and section transformation multiplier κ(cz+d)⁻¹w(x) for a representative (γ,x); rational coefficients replace O+ by O. Push forward to the finite-level base. None of the four definitions is an abbreviation for another.

**Sources.**

- [BHW-2023](#source-bhw-2023), Definition 9.1(3), pp.1780–1781. The E(p^n)-action on X_{U,Γ(p∞)} gives this distinct presentation and its precise coefficient multiplier.

<a id="o4-presentation-arithmetic-full"></a>

### Arithmetic full-cover coefficients

**Construction** · `OverconvergentAutomorphicForms:O4/presentation-arithmetic-full`

**Planet:** Arithmetic full-cover coefficients.

Imported stable target from [OverconvergentAutomorphicForms--O0.json](../packets/OverconvergentAutomorphicForms--O0.json); the following is its effective assembly contract.

Define presentation (4) independently as the O+ equivariance equalizer on the actual cover X_{G,U,Γ(p∞)}(ε)_a×U, with acting group PΓ0(p^n) and section transformation multiplier κ(cz+d)⁻¹w(det γ); rational coefficients replace O+ by O. Push forward to the finite-level base. None of the four definitions is an abbreviation for another. The effective deck group and its continuous action are those of O4/effective-arithmetic-descent, with the closure of all units congruent to 1 modulo N.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- An arithmetic family is κ_ar=(w,t), with geometric κ=ρ(w,t). n≥1 or ∞; level zero is transported separately by AL_1.
- N≥4 and p∤N; x is in Δ(p∞N) and x̄ denotes its supplied image in O_p×.

**Assembly refinement.**

- Use the completed effective deck group, with x̄ in the intermediate multiplier. The abstract positive-unit quotient is a dense subgroup, not the whole group.

**Construction or proof.**

1. Import the stated cover, group action and quotient from H4/S5. Use the same pulled-back Hodge–Tate coordinate on that cover.
2. Form O1’s equivariant-function equalizer. For quotient groups the next representative-independence theorem is needed before the action is well-defined.
3. Retain the separate cover and action as construction data; comparisons are subsequent maps, not definitional equalities.

**Prerequisites.** [OverconvergentAutomorphicForms:O1/equivariant-coefficient-sheaf](#o1-equivariant-coefficient-sheaf), [OverconvergentAutomorphicForms:O2/hilbert-automorphy-factor](#o2-hilbert-automorphy-factor), `HilbertModularVarietiesAndShimuraCurves:H4/effective-level-groups`, `HilbertModularVarietiesAndShimuraCurves:H4/finite-level-torsors`, [PerfectoidShimuraVarieties:S5/hilbert-three-towers](../packets/PerfectoidShimuraVarieties.json), [PerfectoidShimuraVarieties:S5/hilbert-level-torsors](../packets/PerfectoidShimuraVarieties.json), [PerfectoidShimuraVarieties:S5/hilbert-period-and-domain-compatibility](../packets/PerfectoidShimuraVarieties.json), [OverconvergentAutomorphicForms:O0/weight-comparison-totally-positive-units](#o0-weight-comparison-totally-positive-units), [OverconvergentAutomorphicForms:O4/arithmetic-representatives](#o4-arithmetic-representatives), [AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product](../packets/AdicSpacesPartII.json), [OverconvergentAutomorphicForms:O4/effective-arithmetic-descent](#o4-effective-arithmetic-descent).

**Planned interface.** `TauCeti.Overconvergent.presentation_arithmetic_full`; module `TauCeti/NumberTheory/HilbertModularForms/O4`, namespace `TauCeti.Overconvergent`.

**Uses.**

- Lemmas 9.2–9.7 and Theorem 9.12: Presentation (4) participates in explicit integral and rational comparison maps.

**API.**

- `TauCeti.Overconvergent.presentation_arithmetic_full.sections` (characterisation): Sections satisfy exactly the PΓ0(p^n)-equivariance condition with multiplier κ(cz+d)⁻¹w(det γ).
- `TauCeti.Overconvergent.presentation_arithmetic_full.integralInclusion` (coercion): The O+ equalizer embeds in its O version.
- `TauCeti.Overconvergent.presentation_arithmetic_full.pullback` (functoriality): Compatible level, radius and weight pullback retains this cover and coefficient action.

**Definition tests.**

- `TauCeti.Overconvergent.Test.O4_presentation_arithmetic_full_trivial` (degenerate): When w=t=1, the presentation is the structural sheaf on its own quotient base.
- `TauCeti.Overconvergent.Test.O4_presentation_arithmetic_full_factor` (computation): The section multiplier on a group element is κ(cz+d)⁻¹w(det γ), including its sign and determinant/polarisation component.
- `TauCeti.Overconvergent.Test.O4_presentation_arithmetic_full_cover` (compatibility): For every η∈U_N, and then every z∈Z∞ by continuity, the central representative change leaves the section multiplier unchanged.

**Check.**

- Define presentation (4) independently as the O+ equivariance equalizer on the actual cover X_{G,U,Γ(p∞)}(ε)_a×U, with acting group PΓ0(p^n) and section transformation multiplier κ(cz+d)⁻¹w(det γ); rational coefficients replace O+ by O. Push forward to the finite-level base. None of the four definitions is an abbreviation for another.

**Sources.**

- [BHW-2023](#source-bhw-2023), Definition 9.1(4), pp.1780–1781. The PΓ0(p^n)-action on X_{G,U,Γ(p∞)} gives this distinct presentation and its precise coefficient multiplier.

<a id="o4-geometric-full-cover-comparison"></a>

### Comparison of geometric covers

**Comparison** · `OverconvergentAutomorphicForms:O4/geometric-full-cover-comparison`

Imported stable target from [OverconvergentAutomorphicForms--O0.json](../packets/OverconvergentAutomorphicForms--O0.json); the following is its effective assembly contract.

Pullback from the full Γ tower to the Γ* tower identifies presentations (2) and (1), integrally and rationally. The inverse is constructed through X_{Γ*(p∞)}←X_{Γ*(p∞)}×O_p^×→X_{Γ(p∞)}, whose right map is a Z_p^×-torsor. It is a genuine isomorphism independent of the choice of full geometric cover.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- An arithmetic family is κ_ar=(w,t), with geometric κ=ρ(w,t). n≥1 or ∞; level zero is transported separately by AL_1.

**Construction or proof.**

1. Pull back a section along the tower morphism; the coordinate/cocycle agree by S5/T4.
2. For the inverse, pull the Γ* section to the product. The action diag(ε,1), ε∈Z_p^×, has j=1, giving invariance under the antidiagonal torsor action.
3. Use P9’s O/O+ profinite torsor descent. Verify diag(u,1) invariance for all u∈O_p^× and Γ0* equivariance; these generate the full Γ0 action. The composites are the identity by faithful pullback.

**Prerequisites.** [OverconvergentAutomorphicForms:O4/presentation-geometric-small](#o4-presentation-geometric-small), [OverconvergentAutomorphicForms:O4/presentation-geometric-full](#o4-presentation-geometric-full), [PerfectoidShimuraVarieties:S5/hilbert-three-towers](../packets/PerfectoidShimuraVarieties.json), [PerfectoidShimuraVarieties:S5/hilbert-level-torsors](../packets/PerfectoidShimuraVarieties.json), [PerfectoidShimuraVarieties:S5/hilbert-period-and-domain-compatibility](../packets/PerfectoidShimuraVarieties.json), `PerfectoidSpaces:P9/weight-extension-sheaf-equalizer`, `PerfectoidSpaces:P9/function-descent-along-tower`, [HodgeTateAndCanonicalSubgroups:T4/canonical-anticanonical-loci](../packets/HodgeTateAndCanonicalSubgroups.json), [HodgeTateAndCanonicalSubgroups:T4/atkin-lehner-anticanonical](../packets/HodgeTateAndCanonicalSubgroups.json), [HodgeTateAndCanonicalSubgroups:T4/hodge-tate-coordinate](../packets/HodgeTateAndCanonicalSubgroups.json), [HodgeTateAndCanonicalSubgroups:T4/period-map-inclusions](../packets/HodgeTateAndCanonicalSubgroups.json), [AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product](../packets/AdicSpacesPartII.json), [PerfectoidShimuraVarieties:S5/hilbert-mixed-span](../packets/PerfectoidShimuraVarieties.json).

**Planned interface.** `TauCeti.Overconvergent.geometric_full_cover_comparison`; module `TauCeti/NumberTheory/HilbertModularForms/O4`, namespace `TauCeti.Overconvergent`.

**Check.**

- For diag(u,1), the coefficient factor is κ(1)⁻¹=1.

**Sources.**

- [BHW-2023](#source-bhw-2023), Lemma 9.3, pp.1782–1783. The source supplies the explicit torsor span and inverse map, not just equality of dimensions.

<a id="o4-twisted-polarisation-action"></a>

### Twisted polarisation action

**Construction** · `OverconvergentAutomorphicForms:O4/twisted-polarisation-action`

**Planet:** Twisted polarisation action.

Imported stable target from [OverconvergentAutomorphicForms--O0.json](../packets/OverconvergentAutomorphicForms--O0.json); the following is its effective assembly contract.

On π_* of presentation (2), define the left action of positive global units by ε·_w f=w(ε)(ε⁻¹)^*f. This preserves the geometric coefficient sheaf and factors through the finite group Δ(N) supplied by H4. This finite group differs from the profinite Δ(p∞N) acting on full towers.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- An arithmetic family is κ_ar=(w,t), with geometric κ=ρ(w,t). n≥1 or ∞; level zero is transported separately by AL_1.

**Construction or proof.**

1. Compute the left action law using the commutative character w and inverse base pullback.
2. Polarisation preserves the Hodge–Tate coordinate and commutes with the Γ action, so preserves geometric equivariance.
3. Use H4’s congruence/square relations and κ(η)⁻¹w(η²)=1 to kill the specified kernel; do not assert that all totally positive units are squares.

**Prerequisites.** [OverconvergentAutomorphicForms:O4/presentation-geometric-full](#o4-presentation-geometric-full), [OverconvergentAutomorphicForms:O4/arithmetic-representatives](#o4-arithmetic-representatives), `HilbertModularVarietiesAndShimuraCurves:H4/effective-level-groups`, `HilbertModularVarietiesAndShimuraCurves:H4/finite-level-torsors`, [HodgeTateAndCanonicalSubgroups:T4/canonical-anticanonical-loci](../packets/HodgeTateAndCanonicalSubgroups.json), [HodgeTateAndCanonicalSubgroups:T4/atkin-lehner-anticanonical](../packets/HodgeTateAndCanonicalSubgroups.json), [HodgeTateAndCanonicalSubgroups:T4/hodge-tate-coordinate](../packets/HodgeTateAndCanonicalSubgroups.json), [HodgeTateAndCanonicalSubgroups:T4/period-map-inclusions](../packets/HodgeTateAndCanonicalSubgroups.json), [AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product](../packets/AdicSpacesPartII.json).

**Planned interface.** `TauCeti.Overconvergent.twisted_polarisation_action`; module `TauCeti/NumberTheory/HilbertModularForms/O4`, namespace `TauCeti.Overconvergent`.

**Uses.**

- Lemma 9.6 and AIP arithmetic coefficients: Arithmetic descent takes invariants under this finite twisted action.

**API.**

- `TauCeti.Overconvergent.twisted_polarisation_action.apply` (simp): ε·_w f=w(ε)(ε⁻¹)^*f.
- `TauCeti.Overconvergent.twisted_polarisation_action.mul` (relation): (εδ)·_w f=ε·_w(δ·_w f).
- `TauCeti.Overconvergent.twisted_polarisation_action.finiteAction` (structure): The action factors through the specified finite Δ(N).

**Definition tests.**

- `TauCeti.Overconvergent.Test.O4_twisted_polarisation_action_trivialW` (degenerate): w=1 gives inverse polarisation pullback.
- `TauCeti.Overconvergent.Test.O4_twisted_polarisation_action_constant` (computation): On a scalar constant section the action is multiplication by w(ε).
- `TauCeti.Overconvergent.Test.O4_twisted_polarisation_action_inverse` (non-example): Using ε^* instead of (ε⁻¹)^* gives the opposite base action and generally changes the descent.

**Check.**

- On π_* of presentation (2), define the left action of positive global units by ε·_w f=w(ε)(ε⁻¹)^*f. This preserves the geometric coefficient sheaf and factors through the finite group Δ(N) supplied by H4. This finite group differs from the profinite Δ(p∞N) acting on full towers.

**Sources.**

- [BHW-2023](#source-bhw-2023), Definition 9.4 and Lemma 9.5, p.1783. The inverse pullback and weight twist define the correct finite polarisation action.

<a id="o4-finite-polarisation-descent"></a>

### Finite polarisation descent

**Comparison** · `OverconvergentAutomorphicForms:O4/finite-polarisation-descent`

Imported stable target from [OverconvergentAutomorphicForms--O0.json](../packets/OverconvergentAutomorphicForms--O0.json); the following is its effective assembly contract.

Presentation (3) is canonically (π_* presentation (2))^{Δ(N)}, with the O4 twisted polarisation action, for both integral and rational coefficients. The quotient is the finite effective geometric-to-arithmetic polarisation quotient; it is not the full profinite tower quotient.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- An arithmetic family is κ_ar=(w,t), with geometric κ=ρ(w,t). n≥1 or ∞; level zero is transported separately by AL_1.

**Construction or proof.**

1. Use H4’s finite quotient and the description of E(p^n) as the extension carrying both Γ and positive-unit actions.
2. A section invariant under the twisted action satisfies exactly the E multiplier of presentation (3), and conversely.
3. Sheaf equalizers therefore identify the two constructions even integrally; no averaging by 1/|Δ(N)| is used to define integral invariants.

**Prerequisites.** [OverconvergentAutomorphicForms:O4/presentation-arithmetic-intermediate](#o4-presentation-arithmetic-intermediate), [OverconvergentAutomorphicForms:O4/presentation-geometric-full](#o4-presentation-geometric-full), [OverconvergentAutomorphicForms:O4/twisted-polarisation-action](#o4-twisted-polarisation-action), `HilbertModularVarietiesAndShimuraCurves:H4/effective-level-groups`, `HilbertModularVarietiesAndShimuraCurves:H4/finite-level-torsors`.

**Planned interface.** `TauCeti.Overconvergent.finite_polarisation_descent`; module `TauCeti/NumberTheory/HilbertModularForms/O4`, namespace `TauCeti.Overconvergent`.

**Check.**

- Integral descent is not justified by dividing by a potentially p-divisible |Δ(N)|.

**Sources.**

- [BHW-2023](#source-bhw-2023), Lemma 9.6, p.1784. Finite twisted Δ(N)-invariants give the intermediate arithmetic presentation.

<a id="o4-weil-pairing-comparison"></a>

### Weil-pairing arithmetic comparison

**Comparison** · `OverconvergentAutomorphicForms:O4/weil-pairing-comparison`

Imported stable target from [OverconvergentAutomorphicForms--O0.json](../packets/OverconvergentAutomorphicForms--O0.json); the following is its effective assembly contract.

The map from presentation (4) to presentation (3) is f↦w(eβ)⁻¹π∞^*f. Its inverse multiplies by w(eβ) and descends through the actual profinite Δ(p∞N)-torsor. Both maps preserve O+ and are inverse. The transformation is (γ,x)^*w(eβ)=w(x⁻¹)w(det γ)w(eβ).

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- An arithmetic family is κ_ar=(w,t), with geometric κ=ρ(w,t). n≥1 or ∞; level zero is transported separately by AL_1.
- The full-level pairing eβ is an O_p^×-valued map supplied by S5, with the stated transformation law.

**Construction or proof.**

1. Multiply the pullback by the inverse pairing character; its transformation changes w(det γ) into w(x) by cancellation.
2. For the inverse, w(eβ)f is invariant under positive global units. Their density in the profinite quotient and continuity extend invariance to Δ(p∞N).
3. Apply P9 profinite descent and faithful pullback to prove the inverse and its PΓ0 equivariance. Pairing values are integral units, so preserve O+.

**Prerequisites.** [OverconvergentAutomorphicForms:O4/presentation-arithmetic-full](#o4-presentation-arithmetic-full), [OverconvergentAutomorphicForms:O4/presentation-arithmetic-intermediate](#o4-presentation-arithmetic-intermediate), [OverconvergentAutomorphicForms:O4/arithmetic-representatives](#o4-arithmetic-representatives), [PerfectoidShimuraVarieties:S5/hilbert-three-towers](../packets/PerfectoidShimuraVarieties.json), [PerfectoidShimuraVarieties:S5/hilbert-level-torsors](../packets/PerfectoidShimuraVarieties.json), [PerfectoidShimuraVarieties:S5/hilbert-period-and-domain-compatibility](../packets/PerfectoidShimuraVarieties.json), `PerfectoidSpaces:P9/weight-extension-sheaf-equalizer`, `PerfectoidSpaces:P9/function-descent-along-tower`, [AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product](../packets/AdicSpacesPartII.json), [PerfectoidShimuraVarieties:S5/hilbert-weil-pairing](../packets/PerfectoidShimuraVarieties.json), [PerfectoidShimuraVarieties:S5/hilbert-polarization-torsors](../packets/PerfectoidShimuraVarieties.json).

**Planned interface.** `TauCeti.Overconvergent.weil_pairing_comparison`; module `TauCeti/NumberTheory/HilbertModularForms/O4`, namespace `TauCeti.Overconvergent`.

**Check.**

- The plain pullback π∞^* does not convert the determinant multiplier to the polarisation multiplier when w is nontrivial.

**Sources.**

- [BHW-2023](#source-bhw-2023), Equation (9.5) and Lemma 9.7, pp.1784–1786. The pairing transformation is the nontrivial coefficient twist in the comparison.

<a id="o4-polarisation-class-forms"></a>

### Forms across polarisation classes

**Construction** · `OverconvergentAutomorphicForms:O4/polarisation-class-forms`

**Planet:** Polarisation-class Hilbert forms.

Imported stable target from [OverconvergentAutomorphicForms--O0.json](../packets/OverconvergentAutomorphicForms--O0.json); the following is its effective assembly contract.

For arithmetic forms take the direct sum of fixed-c spaces over prime-to-p fractional ideals and quotient by P_x(f)−f for x∈F×,+∩O_p× (global totally positive elements that are p-adic units), where P_x transports c to xc. The indexing quotient is the finite narrow class group. Integral forms use the corresponding integral lattices. For G* retain a chosen set of class representatives and the specified comparison maps.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- An arithmetic family is κ_ar=(w,t), with geometric κ=ρ(w,t). n≥1 or ∞; level zero is transported separately by AL_1.
- Use H3/H4’s transport maps and their composition law; for arithmetic forms a transport by a positive unit stabilizing an ideal is already the identity after descent.
- The transport parameter is a global element x∈F×,+∩O_p×; an arbitrary local p-adic unit does not multiply a fractional ideal of F.

**Assembly refinement.**

- Clarifies the global p-unit transport parameter; it is not an arbitrary element of O_p×.

**Construction or proof.**

1. Construct arithmetic fixed-c sections from presentation (4) and its level-zero transport.
2. Use H4’s positive-p-unit transport and its composition law to form the stated quotient module.
3. Use baseline NarrowClassGroup and its finiteness instead of rebuilding ideal class theory; H3 supplies identification of the prime-to-p ideal indexing quotient.

**Prerequisites.** [OverconvergentAutomorphicForms:O3/fixed-radius-hilbert-forms](#o3-fixed-radius-hilbert-forms), [OverconvergentAutomorphicForms:O4/weil-pairing-comparison](#o4-weil-pairing-comparison), [OverconvergentAutomorphicForms:O4/finite-polarisation-descent](#o4-finite-polarisation-descent), `HilbertModularVarietiesAndShimuraCurves:H3/arithmetic-quotient`, `HilbertModularVarietiesAndShimuraCurves:H3/ideal-class-comparisons`, `HilbertModularVarietiesAndShimuraCurves:H4/effective-level-groups`, `HilbertModularVarietiesAndShimuraCurves:H4/finite-level-torsors`, [tauceti:NumberField.NarrowClassGroup](#baseline-interfaces), [tauceti:NumberField.NarrowClassGroup.instFinite](#baseline-interfaces), [AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product](../packets/AdicSpacesPartII.json).

**Planned interface.** `TauCeti.Overconvergent.polarisation_class_forms`; module `TauCeti/NumberTheory/HilbertModularForms/O4`, namespace `TauCeti.Overconvergent`.

**Uses.**

- BHW §10 and AIP §4: Tame and wild operators permute polarisation components; the quotient makes the arithmetic action canonical.

**API.**

- `TauCeti.Overconvergent.polarisation_class_forms.ofIdeal` (constructor): Map each fixed-c arithmetic form into the class-independent quotient.
- `TauCeti.Overconvergent.polarisation_class_forms.transportRelation` (relation): ofIdeal(P_x f)=ofIdeal(f).
- `TauCeti.Overconvergent.polarisation_class_forms.representatives` (equivalence): A finite set of narrow-class representatives yields the direct-sum presentation, using the arithmetic stabilizer identity.

**Definition tests.**

- `TauCeti.Overconvergent.Test.O4_polarisation_class_forms_rational` (computation): For F=Q there is one narrow ideal class and arithmetic forms reduce to the single class component.
- `TauCeti.Overconvergent.Test.O4_polarisation_class_forms_transport` (characterisation): The class of f at c equals the class of P_x f at xc.
- `TauCeti.Overconvergent.Test.O4_polarisation_class_forms_geometricChoices` (non-example): For G* a change of representatives retains noncanonical polarisation maps; arithmetic independence is not silently asserted before descent.

**Check.**

- For arithmetic forms take the direct sum of fixed-c spaces over prime-to-p fractional ideals and quotient by P_x(f)−f for totally positive p-adic units x, where P_x transports c to xc. The indexing quotient is the finite narrow class group. Integral forms use the corresponding integral lattices. For G* retain a chosen set of class representatives and the specified comparison maps.

**Sources.**

- [BHW-2023](#source-bhw-2023), Definition 9.10, pp.1786–1787. The quotient over polarisation ideals is essential because Hecke maps change c.

<a id="o4-polarisation-choice-independence"></a>

### Independence of arithmetic polarisation choices

**Theorem** · `OverconvergentAutomorphicForms:O4/polarisation-choice-independence`

Imported stable target from [OverconvergentAutomorphicForms--O0.json](../packets/OverconvergentAutomorphicForms--O0.json); the following is its effective assembly contract.

Arithmetic polarisation-class forms and their transported correspondences are canonically independent of narrow-class representative choices: P_x compose multiplicatively and any two transports with the same target differ by a positive-unit stabilizer acting trivially after arithmetic descent. For G* changes of representatives conjugate operators by the chosen polarisation comparisons; no canonical equality before these choices is claimed.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- An arithmetic family is κ_ar=(w,t), with geometric κ=ρ(w,t). n≥1 or ∞; level zero is transported separately by AL_1.

**Construction or proof.**

1. Use H4’s transport composition and O4 twisted/finite descent to kill the stabilizer ambiguity.
2. Build the representative-change map componentwise with P_x; its inverse uses P_{x⁻¹}.
3. The quotient relation makes both composites and all correspondence diagrams independent of x in the arithmetic case. Retain the chosen conjugation in the geometric case.

**Prerequisites.** [OverconvergentAutomorphicForms:O4/polarisation-class-forms](#o4-polarisation-class-forms), [OverconvergentAutomorphicForms:O4/finite-polarisation-descent](#o4-finite-polarisation-descent), `HilbertModularVarietiesAndShimuraCurves:H4/effective-level-groups`, `HilbertModularVarietiesAndShimuraCurves:H4/finite-level-torsors`.

**Planned interface.** `TauCeti.Overconvergent.polarisation_choice_independence`; module `TauCeti/NumberTheory/HilbertModularForms/O4`, namespace `TauCeti.Overconvergent`.

**Check.**

- Changing a polarisation representative twice agrees with changing it by the product transport.

**Sources.**

- [BHW-2023](#source-bhw-2023), Remark 10.6, p.1791; Definition 9.10, pp.1786–1787. The arithmetic normalisation removes polarisation choices; G* retains a comparison choice.

### Worked check

Take F=Q(√3), N=4, and η=−7−4√3. Its norm is 49−48=1 and η−1=−4(2+√3), so η∈U_4. Both real embeddings are negative; η is not totally positive. Nevertheless κ(η)⁻¹w(η²)=t(Nη)=1, as required by the actual central kernel. Restricting this test to positive units would omit a legitimate representative change. For F=Q at fine level, U_N is trivial; it is not replaced by all p-adic units.

### Remaining mathematical inputs

- Coefficient effectivity is inherited from O1/P9; the actual central quotient and global p-unit transport are fixed in this assembly.



<a id="layer-o5"></a>

## O5. Independent AIP construction and comparison

Independent frame-torsor eigenfunctions, rational lines, integral equalizer comparison and its arithmetic naturality.

<a id="o5-aip-independent-coefficients"></a>

### Independent AIP coefficient sheaves

**Construction** · `OverconvergentAutomorphicForms:O5/aip-independent-coefficients`

**Planet:** AIP coefficient sheaf.

Imported stable target from [OverconvergentAutomorphicForms--O0.json](../packets/OverconvergentAutomorphicForms--O0.json); the following is its effective assembly contract.

On each AIP chart construct the modified differential frame torsor F_{n,r,I} and its B_n=O_p×·(1+p^n Hdg^(−p^n/(p−1))Res_{O_F/Z}G_a) action independently of the perfectoid tower. Define the analytic rational and integral coefficient sheaves as the κ⁻¹-eigenfunctions in (g_n f_n)_*O and (g_n f_n)_*O+ on this actual analytic torsor. In the formal AIP construction, first construct w_{n,r,I} for the universal character on W_F^0, then retain §6.4’s finite-character factor wχ for a full weight. The full formal sheaf is coherent; Prop.4.3 is not cited to assert its integral formal invertibility for every χ.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Use the independent AIP formal weight chart indexed by I=[p^k,p^k′], 0≤k≤k′, with r_AIP≥3 and r_AIP+k≥n_AIP≥k′+2 for odd p (≥k′+4 for p=2). Set n′=n_AIP−k′−2 (or −4). These are universal-coordinate conditions; δ is not silently identified with the corrected pro-p supremum.
- Choose a positive or ordinary radius in the intersection of the canonical-subgroup, analytic-character and AIP torsor admissibility ranges.

**Construction or proof.**

1. Import T5’s canonical subgroup, modified lattice, Hodge–Tate congruence and the frame torsor; retain its B_n-action.
2. Extend the universal-coordinate character via AIP Proposition 2.8 on W_F^0. For a full weight retain the finite torsion character χ and its independent eigencomponent on the normalized finite Igusa cover (§6.4, p.29).
3. Take actual κ⁻¹ analytic O and O+ eigenfunctions. Keep the universal formal line and the full finite-character coherent factor separate. Identification of that formal factor with the analytic integral lattice belongs to the full-character integral-trivialization request; the analytic integral equalizer is already defined independently.
4. On every complete algebraically closed valued test point of the admitted B_n-torsor, both κ(b) and κ(b)⁻¹ belong to the valuation ring. For the small analytic factor this is AIP Lemma4.4’s topologically nilpotent congruence; for the finite factor it follows from finite order. This is a unit-valued multiplier condition, not the existence of a unit-valued eigenfunction.

**Prerequisites.** [HodgeTateAndCanonicalSubgroups:T5/igusa-torsor](../packets/HodgeTateAndCanonicalSubgroups.json), [HodgeTateAndCanonicalSubgroups:T5/integral-differential-lattice](../packets/HodgeTateAndCanonicalSubgroups.json), [HodgeTateAndCanonicalSubgroups:T5/integral-lattice-properties](../packets/HodgeTateAndCanonicalSubgroups.json), [HodgeTateAndCanonicalSubgroups:T5/aip-torsor](../packets/HodgeTateAndCanonicalSubgroups.json), [HodgeTateAndCanonicalSubgroups:T5/hodge-tate-aip-lift](../packets/HodgeTateAndCanonicalSubgroups.json), [OverconvergentAutomorphicForms:O3/ramified-modified-lattice](#o3-ramified-modified-lattice), [OverconvergentAutomorphicForms:O0/bounded-weight-families](#o0-bounded-weight-families), [LocallyAnalyticDistributions:L0/multivariable-fixed-radius](../packets/LocallyAnalyticDistributions.json), [LocallyAnalyticDistributions:L0/analytic-chart-pullback](../packets/LocallyAnalyticDistributions.json), [LocallyAnalyticDistributions:L4/affinoid-analytic-stage](../packets/LocallyAnalyticDistributions.json), [LocallyAnalyticDistributions:L4/analytic-completed-tensor](../packets/LocallyAnalyticDistributions.json), [AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product](../packets/AdicSpacesPartII.json).

**Planned interface.** `TauCeti.Overconvergent.aip_independent_coefficients`; module `TauCeti/NumberTheory/HilbertModularForms/O5`, namespace `TauCeti.Overconvergent`.

**Uses.**

- Theorems 7.14 and 9.12: The torsor comparison identifies two independently defined coefficient sheaves.

**API.**

- `TauCeti.Overconvergent.aip_independent_coefficients.eigencondition` (characterisation): f(b·s)=κ(b)⁻¹f(s) on the specified B_n-torsor.
- `TauCeti.Overconvergent.aip_independent_coefficients.integralInclusion` (coercion): Integral eigenfunctions embed in the rational coefficient sheaf.
- `TauCeti.Overconvergent.aip_independent_coefficients.restrictChart` (functoriality): Change of admissible interval, canonical level and radius gives the AIP transition maps.
- `TauCeti.Overconvergent.aip_independent_coefficients.finiteFactor` (projection): Record χ on H, its extension through (O_F/p²O_F)×, and the coherent normalized-Igusa eigencomponent wχ independently of the W_F^0 universal formal line.
- `TauCeti.Overconvergent.aip_independent_coefficients.translationUnits` (relation): On the admitted torsor, κ(b) and κ(b)⁻¹ are integral at every valued test point. Translating an eigenfunction by b therefore preserves its pointwise integral bound.

**Definition tests.**

- `TauCeti.Overconvergent.Test.O5_aip_independent_coefficients_trivial` (degenerate): The trivial character gives the structural sheaf after descent.
- `TauCeti.Overconvergent.Test.O5_aip_independent_coefficients_algebraic` (compatibility): An algebraic κ gives the corresponding modified differential coefficient on the admitted chart.
- `TauCeti.Overconvergent.Test.O5_aip_independent_coefficients_independent` (computation): For F=Q and κ(x)=x, scaling a differential frame s by λ∈Z_p^× gives f(λs)=λ⁻¹f(s); these eigenfunctions are not invariant functions for nontrivial λ.
- `TauCeti.Overconvergent.Test.O5_aip_independent_coefficients_finiteFactor` (non-example): At p=2, the character of the torsion subgroup of Z_2× sending −1 to −1 is not a W_F^0 character. Its normalized finite-Igusa factor must be retained, even though every finite-character value and its inverse are integral units.

**Check.**

- Construct the analytic O and O+ eigenfunction sheaves independently on the actual modified differential frame torsor, retaining the full finite torsion character. Construct the W_F^0 formal line and the full-character coherent formal factor separately. Identification of the latter’s integral generic fibre with the analytic O+ equalizer is an explicit remaining input, not part of the definition.

**Sources.**

- [AIP-ADIC-2016](#source-aip-adic-2016), §4.1–4.2, Definition before Proposition 4.3, pp.15–16. AIP eigenfunctions are constructed on the modified differential frame torsor.
- [BHW-2023](#source-bhw-2023), Definition 7.9, p.1761. The generic-fibre AIP construction is recalled independently of the perfectoid one.
- [AIP-ADIC-2016](#source-aip-adic-2016), §6.4, finite-character construction before Theorem 6.7, p.29. The full finite-character factor is stated coherent and invertible over the ordinary locus and analytic fibre; this does not assert invertibility over the entire formal model.
- [AIP-ADIC-2016](#source-aip-adic-2016), Lemma2.4 pp7–8; Lemma4.4 p16; §6.4 p29. The finite torsion character is distinct from the universal character trivial on H. The small analytic character is congruent to one on its admitted frame neighbourhood; finite-character values are valuation units.

<a id="o5-aip-translation-valuation-units"></a>

### AIP translations preserve integral bounds

**Lemma** · `OverconvergentAutomorphicForms:O5/aip-translation-valuation-units`

Imported stable target from [OverconvergentAutomorphicForms--O0.json](../packets/OverconvergentAutomorphicForms--O0.json); the following is its effective assembly contract.

On an admitted AIP frame torsor, at every valued test point both κ(b) and κ(b)⁻¹ lie in the valuation ring. Consequently h(b·y)=κ(b)⁻¹h(y) is integral if and only if h(y) is integral. This includes the full finite torsion character, including p-primary values, and does not assert existence of an integral unit eigenfunction.

**Hypotheses.**

- Use the actual frame torsor and universal-coordinate admission hypotheses of aip-independent-coefficients. Check all continuous valuations used to define geometric O+, with complete valued extensions as required.

**Construction or proof.**

1. Factor the character into the universal analytic character and the finite torsion character. The compact-unit values of the former are pullbacks of units of the integral formal weight character. On the extended frame neighbourhood AIP Lemma4.4 gives a congruence to one by a topologically nilpotent element, so these values and their inverses are also integral.
2. For a finite-character value u with u^d=1, the ordered valuation group is torsion-free, hence v(u)^d=1 implies v(u)=1, even if p divides d. Multiply the two unit values.
3. Apply the eigencondition in both directions. No rank-one norm test replaces the quantification over all valuations.

**Prerequisites.** [OverconvergentAutomorphicForms:O5/aip-independent-coefficients](#o5-aip-independent-coefficients), [mathlib:Valuation](#baseline-interfaces), [mathlib:Valuation.integer](#baseline-interfaces).

**Planned interface.** `TauCeti.Overconvergent.aip_translation_valuation_units`; module `TauCeti/NumberTheory/HilbertModularForms/O5`, namespace `TauCeti.Overconvergent`.

**Definition tests.**

- `TauCeti.Overconvergent.Test.O5_aip_translation_valuation_units_higherRank` (compatibility): The valuation-unit implication holds with value group WithZero of the multiplicative lexicographically ordered Z by Z group, without a real-valued norm.
- `TauCeti.Overconvergent.Test.O5_aip_translation_valuation_units_primePower` (compatibility): A unit of positive prime-power order has valuation one at every valuation, without a prime-to-p order condition.
- `TauCeti.Overconvergent.Test.O5_aip_translation_valuation_units_finiteOrder` (compatibility): A unit of any positive finite order and its inverse preserve the integral bound on every translated scalar.
- `TauCeti.Overconvergent.Test.O5_aip_translation_valuation_units_sign` (computation): The sign character value at p=2 preserves integrality: a and its negative have the same bound at every valuation.
- `TauCeti.Overconvergent.Test.O5_aip_translation_valuation_units_nonunit` (non-example): For a multiplier with valuation strictly below one, its inverse fails the bound at a=1; value-integrality alone is insufficient.
- `TauCeti.Overconvergent.Test.O5_aip_translation_valuation_units_eigencondition` (compatibility): For an actual supplied eigencondition relating two point values by the inverse multiplier, membership in the valuation ring agrees when both multiplier bounds hold.

**Check.**

- A multiplier p has integral value but nonintegral inverse and does not satisfy the conclusion.
- The finite character sending −1 to −1 at p=2 preserves both bounds despite being outside W_F^0.

**Sources.**

- [AIP-ADIC-2016](#source-aip-adic-2016), Lemma4.4, p16; §6.4, p29. The admitted analytic congruence and the separate finite-character factor give valuation-unit multipliers.

<a id="o5-aip-line-and-gluing"></a>

### AIP integral line and gluing

**Theorem** · `OverconvergentAutomorphicForms:O5/aip-line-and-gluing`

**Planet:** AIP integral coefficient line.

Imported stable target from [OverconvergentAutomorphicForms--O0.json](../packets/OverconvergentAutomorphicForms--O0.json); the following is its effective assembly contract.

For the universal formal character on W_F^0, the AIP eigenmodule is a formal line and its admissible chart transports satisfy the cocycle identity (AIP Propositions4.3/4.7). For a full character, §6.4 gives a coherent formal sheaf and a rational analytic line, with chart transport obtained from the actual eigenfunctions. An analytic O+ line for the full character follows if, locally on the analytic base, a torsor eigenfunction e and its inverse are both in O+ and their transports differ by base O+ units. Existence of such integral trivializations at positive radius for arbitrary χ is the precise remaining freeness target; rational line gluing does not assert it.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Use the independent AIP formal weight chart indexed by I=[p^k,p^k′], 0≤k≤k′, with r_AIP≥3 and r_AIP+k≥n_AIP≥k′+2 for odd p (≥k′+4 for p=2). Set n′=n_AIP−k′−2 (or −4). These are universal-coordinate conditions; δ is not silently identified with the corrected pro-p supremum.
- Choose a positive or ordinary radius in the intersection of the canonical-subgroup, analytic-character and AIP torsor admissibility ranges.
- For the analytic full-character unit criterion require actual geometric O+ invariant-function descent on the entire weight-product sheaf. The completed lattice tensor used by the named P9 theorem is a distinct coefficient object.

**Construction or proof.**

1. For the W_F^0 universal formal line, AIP Proposition4.3 and Lemmas4.4–4.6 construct the trace-compatible eigenfunction congruent to one modulo topologically nilpotent elements on the actual formal torsor. Its value and inverse are integral; normality proves formal rank one. Pullback of this formal line to its specified analytic O+ ringed chart is a line.
2. AIP Proposition4.7 compares the universal-character formal lines on a common refinement. The ratio of their unit-valued generators is invariant; the exact P9 invariant-functions contract identifies it with a base O+ unit. Ratios multiply on triple overlaps.
3. For full weights retain §6.4’s normalized finite-Igusa factor. The paper proves coherence and rational/ordinary invertibility, which supplies the rational analytic line. No denominator 1/|H| is used to claim integral freeness, especially when H has p-torsion.
4. For a full-character integral trivialization e, require the sheafwise geometric identity ((g_n f_n)_*O+)^{B_n}=O+ on all base opens. Then every integral eigenfunction g has invariant integral ratio g/e; conversely multiplication by e sends each base integral function to an eigenfunction. Require base O+ unit transition ratios. P9’s named integral-coboundary theorem proves this algebraic criterion for its chosen completed lattice tensor; applying it to geometric O+ on a smooth weight product needs the separate P9 request and cannot identify these two lattices silently.
5. The positive-radius full-character existence/transport of e is requested at T5/P9 and recorded as a gap. The O5 comparison of two integral equalizers below does not use this existence statement.

**Prerequisites.** [OverconvergentAutomorphicForms:O5/aip-independent-coefficients](#o5-aip-independent-coefficients), [HodgeTateAndCanonicalSubgroups:T5/igusa-torsor](../packets/HodgeTateAndCanonicalSubgroups.json), [HodgeTateAndCanonicalSubgroups:T5/integral-differential-lattice](../packets/HodgeTateAndCanonicalSubgroups.json), [HodgeTateAndCanonicalSubgroups:T5/integral-lattice-properties](../packets/HodgeTateAndCanonicalSubgroups.json), [HodgeTateAndCanonicalSubgroups:T5/aip-torsor](../packets/HodgeTateAndCanonicalSubgroups.json), [HodgeTateAndCanonicalSubgroups:T5/hodge-tate-aip-lift](../packets/HodgeTateAndCanonicalSubgroups.json), `PerfectoidSpaces:P9/weight-extension-sheaf-equalizer`, `PerfectoidSpaces:P9/function-descent-along-tower`, `PerfectoidSpaces:P9/integral-coboundary-trivialises-integral-sheaf`, [HodgeTateAndCanonicalSubgroups:T5](../packets/HodgeTateAndCanonicalSubgroups.json), `PerfectoidSpaces:P9`.

**Planned interface.** `TauCeti.Overconvergent.aip_line_and_gluing`; module `TauCeti/NumberTheory/HilbertModularForms/O5`, namespace `TauCeti.Overconvergent`.

**Check.**

- Universal-character generators are units after the specified pullback, with inverse integral as well as value integral.
- Full finite-character rational freeness and ordinary freeness do not discharge positive-radius integral freeness.
- A candidate generator with inverse only in O, such as p on a constant integral chart, fails the unit criterion.
- The explicit finite-character factor is retained on every chart refinement.

**Sources.**

- [AIP-ADIC-2016](#source-aip-adic-2016), Propositions 4.3 and 4.7, pp.16–18. Integral local freeness and the canonical changes of interval/radius/Igusa level are distinct ingredients.
- [BHW-2023](#source-bhw-2023), Proposition 7.10, p.1762. The local coefficient sheaves glue on overlaps.

<a id="o5-geometric-aip-comparison"></a>

### Geometric perfectoid–AIP comparison

**Comparison** · `OverconvergentAutomorphicForms:O5/geometric-aip-comparison`

Imported stable target from [OverconvergentAutomorphicForms--O0.json](../packets/OverconvergentAutomorphicForms--O0.json); the following is its effective assembly contract.

On the common admitted domains, for every n≥0 and n=∞, pullback along the actual scaled Hodge–Tate frame gives an isomorphism from the independent AIP rational coefficient line to the perfectoid rational coefficient line and identifies their O+ eigenfunction submodules. At n=0 use AL_1 on both sides. The integral assertion is an isomorphism of lattices, without assuming either lattice already locally free. Full-character integral local freeness is the separate O5/aip-line-and-gluing target. Positive radii lie in the verified intersection; no radius formula derived from the false printed supremum is used.

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
- At a ramified prime, retain the unsplit canonical-generator and scalar conormal-degree input requested from T4/ramified-period-comparison. The displayed inclusive radius also retains T4's equality-endpoint obligation; neither is discharged by an integral embedding-wise product decomposition.

**Construction or proof.**

1. T5 supplies the actual left-equivariant map s(γx)=jγ(x)s(x) and its scaled s∘u_n Atkin–Lehner diagram. Pullback of AIP eigenfunctions therefore has the perfectoid inverse-character relation.
2. Establish the rational isomorphism first: the full-character AIP rational line comes from §6.4/Thm6.7. O1 analytic effectivity supplies the perfectoid rational line (ordinary formal descent followed by the dense-open criterion). In a local rational AIP generator, its evaluation at a frame is nonzero: after a valued extension trivializing the torsor, the associated rational line is the one-dimensional character fibre. Thus the map between rational lines is fibrewise nonzero, hence an isomorphism. No integral generator is invoked.
3. For integrality, let a rational AIP eigenfunction h pull back to an integral perfectoid section. For an arbitrary valued point y of F_m, lift its base point to x in the actual tower, extending the complete algebraically closed valued field if necessary. Torsor transitivity gives y=b·s(x). Then h(y)=κ(b)⁻¹h(s(x)); both multipliers are valuation units, so h(y) is integral exactly when h(s(x)) is. The pointwise definition of O+ proves h lies in the AIP integral equalizer. The forward direction is preservation of O+ by pullback.
4. Apply the argument on every base open and its weight product using P9’s actual sheafwise function/descent contract. Checking only product affinoids would not prove the entire product-sheaf assertion. This makes the integral map and its rational inverse inverse sheaf maps.
5. The maps glue because they are actual pullbacks, independently of integral local freeness. Handle ∞ with its limit torsor and 0 with AL_1. Once the separate full-character unit-trivialization input is supplied, the isomorphism transports integral local freeness; it does not prove that input by itself.

**Prerequisites.** [OverconvergentAutomorphicForms:O5/aip-line-and-gluing](#o5-aip-line-and-gluing), [OverconvergentAutomorphicForms:O3/integral-hilbert-sheaf](#o3-integral-hilbert-sheaf), [HodgeTateAndCanonicalSubgroups:T5/igusa-torsor](../packets/HodgeTateAndCanonicalSubgroups.json), [HodgeTateAndCanonicalSubgroups:T5/integral-differential-lattice](../packets/HodgeTateAndCanonicalSubgroups.json), [HodgeTateAndCanonicalSubgroups:T5/integral-lattice-properties](../packets/HodgeTateAndCanonicalSubgroups.json), [HodgeTateAndCanonicalSubgroups:T5/aip-torsor](../packets/HodgeTateAndCanonicalSubgroups.json), [HodgeTateAndCanonicalSubgroups:T5/hodge-tate-aip-lift](../packets/HodgeTateAndCanonicalSubgroups.json), `PerfectoidSpaces:P9/weight-extension-sheaf-equalizer`, `PerfectoidSpaces:P9/function-descent-along-tower`, [OverconvergentAutomorphicForms:O2/hilbert-level-radius-maps](#o2-hilbert-level-radius-maps), [AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product](../packets/AdicSpacesPartII.json), [OverconvergentAutomorphicForms:O1/analytic-line-effectivity](#o1-analytic-line-effectivity), [HodgeTateAndCanonicalSubgroups:T5/aip-automorphy-factor](../packets/HodgeTateAndCanonicalSubgroups.json), [OverconvergentAutomorphicForms:O5/aip-translation-valuation-units](#o5-aip-translation-valuation-units), [HodgeTateAndCanonicalSubgroups:T5/aip-torsor-hodge-tate-comparison](../packets/HodgeTateAndCanonicalSubgroups.json), `PerfectoidSpaces:P9`, [HodgeTateAndCanonicalSubgroups:T4](../packets/HodgeTateAndCanonicalSubgroups.json).

**Planned interface.** `TauCeti.Overconvergent.geometric_aip_comparison`; module `TauCeti/NumberTheory/HilbertModularForms/O5`, namespace `TauCeti.Overconvergent`.

**API.**

- `TauCeti.Overconvergent.geometric_aip_comparison.bounded_iff` (characterisation): For scalar eigenfunctions with unit-valued multipliers, if every valued torsor frame is a translate of a lifted Hodge–Tate frame, the bound on all torsor frames is equivalent to the bound on all lifted Hodge–Tate frames. The typed normed-field version is an algebraic test of this proof step; the adic application checks all valuations.

**Check.**

- Full torsion characters are included in the norm argument: finite-order values have valuation one, including p-primary roots of unity.
- An inverse character is necessary, but its integrality uses both the character and its inverse, not mere nonvanishing.
- The rational pullback being an isomorphism, its integral inverse is checked by every torsor frame valuation; equality of dimensions or a single fibre alone is insufficient.
- A scalar multiplier p would not preserve integral bounds under translation and fails the hypothesis.
- Integral equalizers can be compared before their local freeness is known. No inference from rational freeness to O+ freeness occurs.

**Sources.**

- [BHW-2023](#source-bhw-2023), Theorem 7.14 and proof, pp.1764–1765. The comparison is an integral sheaf isomorphism built from the tautological torsor map, not a dimension comparison.
- [AIP-ADIC-2016](#source-aip-adic-2016), Lemma4.4 p16; §6.4 and Theorem6.7 p29. Universal small-character congruences provide unit-valued multipliers, while the full finite-character construction supplies rational invertibility. They do not supply full positive-radius integral freeness.
- [BHW-2023](#source-bhw-2023), Definitions7.5/7.9 and Propositions7.11–7.12, pp1760–1763; Theorem7.14, pp1764–1765. The actual torsor, scaled tautological frame and equivariant diagram are the geometric inputs. The integral lattice comparison is proved here by pointwise boundedness after rational comparison, rather than by the source’s integral-freeness shortcut.

<a id="o5-arithmetic-aip-comparison"></a>

### Arithmetic perfectoid–AIP comparison

**Comparison** · `OverconvergentAutomorphicForms:O5/arithmetic-aip-comparison`

Imported stable target from [OverconvergentAutomorphicForms--O0.json](../packets/OverconvergentAutomorphicForms--O0.json); the following is its effective assembly contract.

Define arithmetic AIP coefficients independently as the twisted finite Δ(N)-invariants of π_* of geometric AIP coefficients. Then ω_{G,c,n}^{κ,+}≅ω_{G,c,AIP,n}^{κ,+} for n≥0 or ∞ and the common admitted radii. The isomorphism includes the Weil-pairing character and finite polarisation action; rationalisation gives the arithmetic analytic line.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Use the independent AIP formal weight chart indexed by I=[p^k,p^k′], 0≤k≤k′, with r_AIP≥3 and r_AIP+k≥n_AIP≥k′+2 for odd p (≥k′+4 for p=2). Set n′=n_AIP−k′−2 (or −4). These are universal-coordinate conditions; δ is not silently identified with the corrected pro-p supremum.
- Choose a positive or ordinary radius in the intersection of the canonical-subgroup, analytic-character and AIP torsor admissibility ranges.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- Arithmetic family κ_ar=(w,t) with geometric κ=ρ(w,t); translate AIP CUSP’s (ν,w_AIP) as ν=w and w_AIP=t⁻¹.
- Inherit geometric-aip-comparison’s explicit T5 radius bound and scaled source-domain admission wherever the Hodge–Tate frame comparison is used, on both source and target of each comparison diagram.

**Construction or proof.**

1. Follow the explicit chain: presentation (4)→(3) via w(eβ)⁻¹; (3)→finite Δ-invariants of (2); (2)→(1); (1)→geometric AIP by the torsor comparison.
2. The twisted polarisation action on geometric AIP agrees with O4’s action by its frame calculation. Thus the last map descends integrally.
3. Transport level zero by AL_1 and rationalise locally. Hecke equivariance is the later O6 theorem, not presumed here.
4. Use O5’s integral comparison as an isomorphism of the specified O+ equalizers. Any claim of full-character positive-radius local freeness additionally requires the separate unit-trivialization input of O5/aip-line-and-gluing.

**Prerequisites.** [OverconvergentAutomorphicForms:O5/geometric-aip-comparison](#o5-geometric-aip-comparison), [OverconvergentAutomorphicForms:O4/weil-pairing-comparison](#o4-weil-pairing-comparison), [OverconvergentAutomorphicForms:O4/finite-polarisation-descent](#o4-finite-polarisation-descent), [OverconvergentAutomorphicForms:O4/geometric-full-cover-comparison](#o4-geometric-full-cover-comparison), [OverconvergentAutomorphicForms:O4/twisted-polarisation-action](#o4-twisted-polarisation-action), [AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product](../packets/AdicSpacesPartII.json).

**Planned interface.** `TauCeti.Overconvergent.arithmetic_aip_comparison`; module `TauCeti/NumberTheory/HilbertModularForms/O5`, namespace `TauCeti.Overconvergent`.

**Check.**

- Removing w(eβ)⁻¹ breaks the determinant/polarisation equivariance for nontrivial w.

**Sources.**

- [BHW-2023](#source-bhw-2023), Definition 9.11 and Theorem 9.12, p.1787. The arithmetic comparison is the explicit descent chain, retaining its pairing and unit-action twists.
- [AIP-CUSP-2016](#source-aip-cusp-2016), §4, weight convention before Theorem 4.4, pp.26–28. AIP’s plus-norm convention is converted by inverting the second arithmetic character.

<a id="o5-aip-comparison-naturality"></a>

### Naturality and uniqueness of torsor comparisons

**Theorem** · `OverconvergentAutomorphicForms:O5/aip-comparison-naturality`

Imported stable target from [OverconvergentAutomorphicForms--O0.json](../packets/OverconvergentAutomorphicForms--O0.json); the following is its effective assembly contract.

The geometric and arithmetic comparisons are uniquely determined by their maps on the chosen tautological frame torsors. They commute with weight pullback, admitted chart/radius refinement and compatible level maps; equality of dimensions or a scalar normalisation at one classical weight does not determine this comparison.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Use the independent AIP formal weight chart indexed by I=[p^k,p^k′], 0≤k≤k′, with r_AIP≥3 and r_AIP+k≥n_AIP≥k′+2 for odd p (≥k′+4 for p=2). Set n′=n_AIP−k′−2 (or −4). These are universal-coordinate conditions; δ is not silently identified with the corrected pro-p supremum.
- Choose a positive or ordinary radius in the intersection of the canonical-subgroup, analytic-character and AIP torsor admissibility ranges.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- Maps of weight families pull back the specified character and its analytic extension. Claims about sheaves do not assert arbitrary nonflat base change of global sections.
- Inherit geometric-aip-comparison’s explicit T5 radius bound and scaled source-domain admission wherever the Hodge–Tate frame comparison is used, on both source and target of each comparison diagram.

**Construction or proof.**

1. On a common trivializing cover, both maps evaluate the same eigenfunction at the same selected frame. This proves uniqueness after faithful pullback.
2. Use T5’s compatibility of the tautological frame with each change of base, level and radius and AIP Proposition 4.7 for chart changes.
3. For arithmetic coefficients the Weil pairing and twisted polarisation action also pull back compatibly, so descent preserves each commuting diagram.
4. Use O5’s integral comparison as an isomorphism of the specified O+ equalizers. Any claim of full-character positive-radius local freeness additionally requires the separate unit-trivialization input of O5/aip-line-and-gluing.

**Prerequisites.** [OverconvergentAutomorphicForms:O5/geometric-aip-comparison](#o5-geometric-aip-comparison), [OverconvergentAutomorphicForms:O5/arithmetic-aip-comparison](#o5-arithmetic-aip-comparison), [OverconvergentAutomorphicForms:O3/hilbert-weight-pullback](#o3-hilbert-weight-pullback), [HodgeTateAndCanonicalSubgroups:T5/igusa-torsor](../packets/HodgeTateAndCanonicalSubgroups.json), [HodgeTateAndCanonicalSubgroups:T5/integral-differential-lattice](../packets/HodgeTateAndCanonicalSubgroups.json), [HodgeTateAndCanonicalSubgroups:T5/integral-lattice-properties](../packets/HodgeTateAndCanonicalSubgroups.json), [HodgeTateAndCanonicalSubgroups:T5/aip-torsor](../packets/HodgeTateAndCanonicalSubgroups.json), [HodgeTateAndCanonicalSubgroups:T5/hodge-tate-aip-lift](../packets/HodgeTateAndCanonicalSubgroups.json), [AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product](../packets/AdicSpacesPartII.json).

**Planned interface.** `TauCeti.Overconvergent.aip_comparison_naturality`; module `TauCeti/NumberTheory/HilbertModularForms/O5`, namespace `TauCeti.Overconvergent`.

**Check.**

- Rescaling a chosen frame rescales both eigenfunction descriptions in the same way.

**Sources.**

- [BHW-2023](#source-bhw-2023), Proofs of Theorems 7.14 and 9.12, pp.1764–1765,1787. The maps arise from the same tautological sections and hence are natural with respect to their compatible pullbacks.
- [AIP-ADIC-2016](#source-aip-adic-2016), Proposition 4.7, pp.17–18. AIP change-of-chart identifications supply the other side of the diagram.

### Worked check

On a base patch, suppose e and e⁻¹ are integral torsor functions with the required character. For any other integral eigenfunction f, f/e is invariant and integral. The geometric invariant-function theorem puts f/e in base O+, giving the integral generator. If e′=u e with u∈O+×, the change of generator is integral and triple-overlap ratios multiply correctly. Taking e=p fails the inverse-unit test. This criterion does not prove the positive-radius existence of e for every finite character, including p-primary characters.

### Remaining mathematical inputs

- Full-character positive-radius integral unit generators and geometric AIP invariant-function/valued-lifting inputs. The scaled HT lift requires ε_base≤p^(−(m+1)). The ramified HT lift also retains T4's unsplit canonical-generator obligation.

- **All-open coefficient descent and the analytic AIP invariant-function theorem:** Finish the all-open/general-base geometric O/O+ descent extension identified by P9/weight-extension-sheaf-equalizer; product-affinoid descent alone does not imply rational-localization compatibility on the full weight product. Supply site-specific completed coefficient functions on the Siegel analytic, pro-Kummer-étale and toroidal diamond/v-sites, retaining the actual Gauss lattice. Apply finite/matrix-coboundary effectivity only with its hypotheses. For the analytic AIP B_m frame torsor, prove invariant geometric O+ functions are base O+ and prove valued-point lifting/reflection of bounds. This is distinct from the completed-lattice-tensor theorems and is not arbitrary Banach torsor descent.
- **Hilbert equality endpoints and ramified canonical generators:** Resolve the inherited equality-endpoint gap of T4/period-map-inclusions at the Hilbert bound ε≤1/(c_p p^m), c_p=2 for p≥5,3 for p=3,4 for p=2. Strict endpoint proofs alone do not cover equality. The actual coordinate, canonical/anticanonical domains and scaled AL maps already have exact T4 nodes. Also discharge T4/ramified-period-comparison's unsplit canonical-generator refinement: an O_F/p^nO_F-linear canonical subgroup generator and its congruence with the saturated Hodge–Tate kernel, using scalar conormal-degree estimates before passage to the generic splitting field. Do not identify O_p⊗O_C integrally with a product of O_C at ramified primes (BHW Proposition5.18 proof, pp1752–1753; E8). Both this refinement and the equality endpoint remain explicit hypotheses of their consumers.
- **Full finite-character positive-radius integral freeness:** For the normalized finite-Igusa factor of a full character, including p-primary χ, prove positive-radius base-local O+ unit eigenfunctions and O+ unit transition ratios on the actual modified-lattice torsor. Universal-character formal freeness (AIP4.3/4.7) and full-character rational/ordinary invertibility (§6.4) are existing inputs, but do not by themselves supply this assertion. Integral comparison of equalizers uses boundedness on valued points and is a separate target; it does not require the unproved freeness conclusion.


<a id="layer-o6"></a>

## O6. Boundary, cusp forms, and Hecke operators

Cusp ideals, normalized moduli Hecke maps, (Pr), compact restriction and the controlling product.

<a id="o6-hilbert-cusp-forms"></a>

### Hilbert cusp forms

**Construction** · `OverconvergentAutomorphicForms:O6/hilbert-cusp-forms`

**Planet:** Overconvergent Hilbert cusp forms.

Imported stable target from [OverconvergentAutomorphicForms--O0.json](../packets/OverconvergentAutomorphicForms--O0.json); the following is its effective assembly contract.

On the supplied smooth toroidal compactification with boundary divisor D, define the subcanonical coefficient line ω^κ(−D)=ω^κ⊗I_D and cusp forms Sκ(n,N,ε;U)=H^0(ω^κ(−D)) on the admitted toroidal neighbourhood, with the corresponding integral lattice and positive-radius colimit. Arithmetic forms descend with the same boundary ideal.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- C6 supplies the toroidal/minimal neighbourhoods, boundary Cartier ideal, extensions of the coefficient line and boundary-compatible maps.
- Inherit geometric-aip-comparison’s explicit T5 radius bound and scaled source-domain admission wherever the Hodge–Tate frame comparison is used, on both source and target of each comparison diagram.

**Construction or proof.**

1. Import the compactification and boundary geometry from ShimuraCompactifications:C6.
2. Extend the coefficient line via O5 and the AIP compactified torsor, then tensor with the actual ideal I_D.
3. Define sections and restriction maps. The boundary ideal is retained through finite arithmetic polarisation descent.

**Prerequisites.** [OverconvergentAutomorphicForms:O5/geometric-aip-comparison](#o5-geometric-aip-comparison), [OverconvergentAutomorphicForms:O5/arithmetic-aip-comparison](#o5-arithmetic-aip-comparison), [ShimuraCompactifications:C6/roadmap/hilbert-toroidal-model](../packets/ShimuraCompactifications.json), [ShimuraCompactifications:C6/roadmap/hilbert-near-ordinary-model](../packets/ShimuraCompactifications.json), [ShimuraCompactifications:C6/roadmap/hilbert-boundary-ideal-pushforward](../packets/ShimuraCompactifications.json), [OverconvergentAutomorphicForms:O3/overconvergent-hilbert-forms](#o3-overconvergent-hilbert-forms), [AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product](../packets/AdicSpacesPartII.json).

**Planned interface.** `TauCeti.Overconvergent.hilbert_cusp_forms`; module `TauCeti/NumberTheory/HilbertModularForms/O6`, namespace `TauCeti.Overconvergent`.

**Uses.**

- O6 complete continuity and O7: Projective Banach/control hypotheses and ordinary restrictions refer to these cusp spaces.

**API.**

- `TauCeti.Overconvergent.hilbert_cusp_forms.inclusion` (coercion): Sκ injects into the corresponding modular forms via I_D→O.
- `TauCeti.Overconvergent.hilbert_cusp_forms.boundaryKernel` (characterisation): Cusp sections are the kernel of restriction to the boundary coefficient sheaf.
- `TauCeti.Overconvergent.hilbert_cusp_forms.restrict` (functoriality): Radius, level and weight maps retaining the boundary ideal induce maps on cusp forms.

**Definition tests.**

- `TauCeti.Overconvergent.Test.O6_hilbert_cusp_forms_constant` (non-example): At weight zero on a connected compactified component with nonempty boundary, the constant section 1 is not cuspidal.
- `TauCeti.Overconvergent.Test.O6_hilbert_cusp_forms_elliptic` (computation): For F=Q the q-expansion of a cusp section has constant coefficient 0 at every cusp.
- `TauCeti.Overconvergent.Test.O6_hilbert_cusp_forms_higherDegree` (non-example): Koecher extension in g>1 does not make a nonzero boundary constant term vanish.

**Check.**

- On the supplied smooth toroidal compactification with boundary divisor D, define the subcanonical coefficient line ω^κ(−D)=ω^κ⊗I_D and cusp forms Sκ(n,N,ε;U)=H^0(ω^κ(−D)) on the admitted toroidal neighbourhood, with the corresponding integral lattice and positive-radius colimit. Arithmetic forms descend with the same boundary ideal.

**Sources.**

- [BHW-2023](#source-bhw-2023), Remark 6.9 and Remark 9.9, pp.1759,1786. Cusp forms are sections vanishing at the toroidal boundary, rather than all sections extending there.

<a id="o6-hilbert-koecher"></a>

### Koecher extension and cuspidality

**Comparison** · `OverconvergentAutomorphicForms:O6/hilbert-koecher`

Imported stable target from [OverconvergentAutomorphicForms--O0.json](../packets/OverconvergentAutomorphicForms--O0.json); the following is its effective assembly contract.

For g>1, the supplied Hilbert Koecher theorem identifies interior coefficient sections with their extension to the minimal/toroidal compactified neighbourhood. Cusp sections are separately those vanishing along D. For g=1 use the compactified cusp/q-expansion calculation instead of a codimension≥2 Koecher claim. These identifications commute with the O5 comparison.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- Use C6’s normality, compactification maps and minimal-boundary codimension hypotheses; at g=1 the minimal boundary has codimension one.
- The bounded analytic-family Koecher and finite p-level boundary-transport extension requested from C6 is an explicit input. C6/arithmetic-koecher alone covers integral algebraic weights on its stated arithmetic model. Retain the actual C6 tame/model hypotheses until extended.

**Construction or proof.**

1. Use the requested analytic-family version of AIP ADIC Proposition8.4, pp36–37, together with its finite p-level boundary transport. Extend across the minimal boundary of codimension at least two under those hypotheses. C6/arithmetic-koecher is the classical substrate, not a proof for arbitrary analytic weights.
2. Compare the subcanonical sheaf by the ideal D, not by the extension theorem.
3. For degree one use B5’s compactified cusp expansion and its boundary constant term. O5 compares the coefficient lines on the compactified torsor.

**Prerequisites.** [OverconvergentAutomorphicForms:O6/hilbert-cusp-forms](#o6-hilbert-cusp-forms), [ShimuraCompactifications:C6/roadmap/hilbert-toroidal-model](../packets/ShimuraCompactifications.json), [ShimuraCompactifications:C6/roadmap/hilbert-near-ordinary-model](../packets/ShimuraCompactifications.json), [ShimuraCompactifications:C6/roadmap/hilbert-boundary-ideal-pushforward](../packets/ShimuraCompactifications.json), `AutomorphicBundles:B5/hilbert-cuspidal-boundary`, [OverconvergentAutomorphicForms:O5/aip-comparison-naturality](#o5-aip-comparison-naturality), [ShimuraCompactifications:C6/roadmap/arithmetic-koecher](../packets/ShimuraCompactifications.json), [ShimuraCompactifications:C6/roadmap/hilbert-boundary-constant](../packets/ShimuraCompactifications.json), [ShimuraCompactifications:C6](../packets/ShimuraCompactifications.json).

**Planned interface.** `TauCeti.Overconvergent.hilbert_koecher`; module `TauCeti/NumberTheory/HilbertModularForms/O6`, namespace `TauCeti.Overconvergent`.

**Check.**

- A section with nonzero q-constant term can extend by Koecher and still fail to be a cusp form.

**Sources.**

- [AIP-ADIC-2016](#source-aip-adic-2016), §8.4, Proposition 8.4, pp.36–37 (statement p.37). The pushforward comparison is Koecher extension, not cuspidality.
- [BHW-2023](#source-bhw-2023), Remark 6.9, p.1759. The source introduces the boundary ideal separately from extension.

<a id="o6-tame-hilbert-hecke"></a>

### Tame Hilbert Hecke operators

**Construction** · `OverconvergentAutomorphicForms:O6/tame-hilbert-hecke`

**Planet:** Hilbert Hecke operators.

Imported stable target from [OverconvergentAutomorphicForms--O0.json](../packets/OverconvergentAutomorphicForms--O0.json); the following is its effective assembly contract.

For a prime ideal a∤pN and its moduli correspondence X_c←^{π1}C_a→^{π2}X_{ca}, use the canonical coefficient identification θ:π2*ω→π1*ω from the prime-to-p Hodge–Tate isogeny. Set T_a=q_a⁻¹Tr_{π1} θ π2*, q_a=|O_F/a|. It maps the ca component to c, preserves radii, extends to the boundary, and descends to arithmetic polarisation classes.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- π1 is finite locally free of degree q_a+1 for the prime cyclic-subgroup correspondence. The normalization is 1/q_a, not reciprocal degree.

**Construction or proof.**

1. Import the moduli correspondence and its compactified extension from H3/C6.
2. Use the prime-to-p isogeny to identify Hodge–Tate frames and their cocycles (BHW Lemma 10.1).
3. Apply AdicSpacesPartII R3 pull-identify-trace and finite locally free trace; multiply by q_a⁻¹. Since a∤p this normalization is an integral unit.
4. Use arithmetic descent and polarisation transport to define the same operator on the class-independent module.

**Prerequisites.** [OverconvergentAutomorphicForms:O4/polarisation-class-forms](#o4-polarisation-class-forms), [OverconvergentAutomorphicForms:O2/hilbert-cocycle-law](#o2-hilbert-cocycle-law), `HilbertModularVarietiesAndShimuraCurves:H3/arithmetic-quotient`, `HilbertModularVarietiesAndShimuraCurves:H3/ideal-class-comparisons`, [ShimuraCompactifications:C6/roadmap/hilbert-toroidal-model](../packets/ShimuraCompactifications.json), [ShimuraCompactifications:C6/roadmap/hilbert-near-ordinary-model](../packets/ShimuraCompactifications.json), [ShimuraCompactifications:C6/roadmap/hilbert-boundary-ideal-pushforward](../packets/ShimuraCompactifications.json), [AdicSpacesPartII:R3/pull-identify-trace](../packets/AdicSpacesPartII.json), [AdicSpacesPartII:R3/analytic-trace-finite-locally-free](../packets/AdicSpacesPartII.json), [AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product](../packets/AdicSpacesPartII.json), `HilbertModularVarietiesAndShimuraCurves:H1/hilbert-pel-instance`, `HilbertModularVarietiesAndShimuraCurves:H1/good-representability`, `HilbertModularVarietiesAndShimuraCurves:H4/effective-level-groups`, `HilbertModularVarietiesAndShimuraCurves:H4/finite-level-torsors`, `HilbertModularVarietiesAndShimuraCurves:H3/hilbert-hecke-isogenies`, `HilbertModularVarietiesAndShimuraCurves:H4/integral-gamma0`.

**Planned interface.** `TauCeti.Overconvergent.tame_hilbert_hecke`; module `TauCeti/NumberTheory/HilbertModularForms/O6`, namespace `TauCeti.Overconvergent`.

**Uses.**

- BHW §10.3–10.4 and O7: Hecke-compatible AIP and Igusa comparisons retain these factors.

**API.**

- `TauCeti.Overconvergent.tame_hilbert_hecke.formula` (characterisation): T_a=q_a⁻¹Trπ1 θ π2*.
- `TauCeti.Overconvergent.tame_hilbert_hecke.component` (projection): The source polarisation ideal is ca and the target is c.
- `TauCeti.Overconvergent.tame_hilbert_hecke.integral` (compatibility): T_a preserves the specified integral lattice.
- `TauCeti.Overconvergent.tame_hilbert_hecke.cusp` (compatibility): The boundary-compatible correspondence preserves cusp forms.

**Definition tests.**

- `TauCeti.Overconvergent.Test.O6_tame_hilbert_hecke_weightZero` (computation): On the constant weight-zero section 1, T_a(1)=(q_a+1)/q_a.
- `TauCeti.Overconvergent.Test.O6_tame_hilbert_hecke_normalisation` (non-example): Averaging by 1/(q_a+1) would send 1 to 1 and is not BHW’s operator.
- `TauCeti.Overconvergent.Test.O6_tame_hilbert_hecke_component` (compatibility): Changing a representative ca by a positive p-unit conjugates by P_x and leaves the arithmetic class operator unchanged.

**Check.**

- For a prime ideal a∤pN and its moduli correspondence X_c←^{π1}C_a→^{π2}X_{ca}, use the canonical coefficient identification θ:π2*ω→π1*ω from the prime-to-p Hodge–Tate isogeny. Set T_a=q_a⁻¹Tr_{π1} θ π2*, q_a=|O_F/a|. It maps the ca component to c, preserves radii, extends to the boundary, and descends to arithmetic polarisation classes.

**Sources.**

- [BHW-2023](#source-bhw-2023), Lemma 10.1 and Definition 10.2, pp.1788–1789. The tame operator is explicitly normalized pullback–identify–trace between polarisation components.

<a id="o6-wild-hilbert-hecke"></a>

### Wild Hilbert Hecke operators

**Construction** · `OverconvergentAutomorphicForms:O6/wild-hilbert-hecke`

**Planet:** Wild Hilbert Hecke operators.

Imported stable target from [OverconvergentAutomorphicForms--O0.json](../packets/OverconvergentAutomorphicForms--O0.json); the following is its effective assembly contract.

For 𝔭|p, q_𝔭=|O_F/𝔭|, e=v_𝔭(p), finite n≥1 and l=ne+1, use the anticanonical extension correspondence with π1 degree q_𝔭 and π2 quotient by D[𝔭]. Let u_𝔭=diag(ϖ_𝔭,1); its geometric action, transported through the O4 arithmetic comparisons when needed, gives an integral coefficient map π2*ω+→π1*ω+ independently of the chosen generator of 𝔭O_p. Define U_𝔭=q_𝔭⁻¹Trπ1 θ_𝔭 π2*. It improves the 𝔭-partial Hasse bound, not all partial bounds in general.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- The actual extra level and anticanonical subgroup condition are C[𝔭^{en}]=D[𝔭^{en}]. The chosen domains must support this correspondence.

**Construction or proof.**

1. Import the p-level moduli correspondence, its degree and partial-radius image from H3/T4/C6.
2. Compute u_𝔭* z=ϖ_𝔭 z and conjugation γ↦(a,ϖb;ϖ⁻¹c,d); the cz+d factor is unchanged.
3. For the geometric G* coefficient, changing ϖ by a unit changes the level action by a diagonal element with j=1, proving generator independence. Define the arithmetic coefficient map by transporting this map through O4's Weil-pairing and finite-polarisation comparisons. A raw arithmetic pullback also sees w(det); j=1 alone does not cancel it. The transported map uses only weights evaluated on units, never w(ϖ) for a nonunit.
4. Apply finite locally free trace and the 1/q_𝔭 factor. This may require renormalization to preserve an integral lattice.

**Prerequisites.** [OverconvergentAutomorphicForms:O4/polarisation-class-forms](#o4-polarisation-class-forms), [OverconvergentAutomorphicForms:O2/hilbert-automorphy-factor](#o2-hilbert-automorphy-factor), `HilbertModularVarietiesAndShimuraCurves:H3/arithmetic-quotient`, `HilbertModularVarietiesAndShimuraCurves:H3/ideal-class-comparisons`, [HodgeTateAndCanonicalSubgroups:T4/canonical-anticanonical-loci](../packets/HodgeTateAndCanonicalSubgroups.json), [HodgeTateAndCanonicalSubgroups:T4/atkin-lehner-anticanonical](../packets/HodgeTateAndCanonicalSubgroups.json), [HodgeTateAndCanonicalSubgroups:T4/hodge-tate-coordinate](../packets/HodgeTateAndCanonicalSubgroups.json), [HodgeTateAndCanonicalSubgroups:T4/period-map-inclusions](../packets/HodgeTateAndCanonicalSubgroups.json), [ShimuraCompactifications:C6/roadmap/hilbert-toroidal-model](../packets/ShimuraCompactifications.json), [ShimuraCompactifications:C6/roadmap/hilbert-near-ordinary-model](../packets/ShimuraCompactifications.json), [ShimuraCompactifications:C6/roadmap/hilbert-boundary-ideal-pushforward](../packets/ShimuraCompactifications.json), [AdicSpacesPartII:R3/pull-identify-trace](../packets/AdicSpacesPartII.json), [AdicSpacesPartII:R3/analytic-trace-finite-locally-free](../packets/AdicSpacesPartII.json), [AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product](../packets/AdicSpacesPartII.json), `HilbertModularVarietiesAndShimuraCurves:H1/hilbert-pel-instance`, `HilbertModularVarietiesAndShimuraCurves:H1/good-representability`, `HilbertModularVarietiesAndShimuraCurves:H4/effective-level-groups`, `HilbertModularVarietiesAndShimuraCurves:H4/finite-level-torsors`, `HilbertModularVarietiesAndShimuraCurves:H3/hilbert-hecke-isogenies`, `HilbertModularVarietiesAndShimuraCurves:H4/integral-gamma0`, [HodgeTateAndCanonicalSubgroups:T3/hilbert-canonical-subgroup](../packets/HodgeTateAndCanonicalSubgroups.json), [HodgeTateAndCanonicalSubgroups:T3/quotient-hasse-radius](../packets/HodgeTateAndCanonicalSubgroups.json), [OverconvergentAutomorphicForms:O4/weil-pairing-comparison](#o4-weil-pairing-comparison), [OverconvergentAutomorphicForms:O4/finite-polarisation-descent](#o4-finite-polarisation-descent).

**Planned interface.** `TauCeti.Overconvergent.wild_hilbert_hecke`; module `TauCeti/NumberTheory/HilbertModularForms/O6`, namespace `TauCeti.Overconvergent`.

**Uses.**

- BHW §10.3 and AIP Lemma 3.27: The controlling product improves every p-adic direction; integral preservation requires its own renormalization.

**API.**

- `TauCeti.Overconvergent.wild_hilbert_hecke.formula` (characterisation): U_𝔭=q_𝔭⁻¹Trπ1 θ_𝔭 π2*.
- `TauCeti.Overconvergent.wild_hilbert_hecke.uniformiserIndependent` (compatibility): The coefficient map and resulting operator do not depend on ϖ_𝔭.
- `TauCeti.Overconvergent.wild_hilbert_hecke.partialRadius` (functoriality): The second projection lands in the supplied improved 𝔭-Hasse neighbourhood.
- `TauCeti.Overconvergent.wild_hilbert_hecke.cusp` (compatibility): Boundary-compatible quotient isogenies preserve the cusp submodule.

**Definition tests.**

- `TauCeti.Overconvergent.Test.O6_wild_hilbert_hecke_ellipticRadius` (computation): For F=Q the second projection lands in radius ε/p.
- `TauCeti.Overconvergent.Test.O6_wild_hilbert_hecke_constant` (computation): At weight zero, U_p(1)=1 because π1 has degree p and the factor is 1/p.
- `TauCeti.Overconvergent.Test.O6_wild_hilbert_hecke_individualCompactness` (non-example): For a split p in degree>1, improvement in only one partial Hasse coordinate does not prove compactness on the simultaneous-radius Banach module.

**Check.**

- For 𝔭|p, q_𝔭=|O_F/𝔭|, e=v_𝔭(p), finite n≥1 and l=ne+1, use the anticanonical extension correspondence with π1 degree q_𝔭 and π2 quotient by D[𝔭]. Let u_𝔭=diag(ϖ_𝔭,1); its geometric action, transported through the O4 arithmetic comparisons when needed, gives an integral coefficient map π2*ω+→π1*ω+ independently of the chosen generator of 𝔭O_p. Define U_𝔭=q_𝔭⁻¹Trπ1 θ_𝔭 π2*. It improves the 𝔭-partial Hasse bound, not all partial bounds in general.

**Sources.**

- [BHW-2023](#source-bhw-2023), §10.2, Lemma 10.3 and Definition 10.4, pp.1789–1790. The operator uses degree q_𝔭 trace and an integral coefficient map, with the extra level l=ne+1.

<a id="o6-hilbert-diamond-operators"></a>

### Hilbert diamond operators

**Construction** · `OverconvergentAutomorphicForms:O6/hilbert-diamond-operators`

Imported stable target from [OverconvergentAutomorphicForms--O0.json](../packets/OverconvergentAutomorphicForms--O0.json); the following is its effective assembly contract.

For a finite tame-level normalizer element d inducing a level automorphism on the actual Hilbert moduli scheme, define ⟨d⟩ by pullback of sections with the induced coefficient identification. The multiplication law is the one of that level action, with inverse-base-action convention fixed as in B5; boundary ideals and arithmetic polarisation descent are retained.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- Use a finite tame level automorphism, with its actual action on the coefficient torsor. This is separate from the central projective quotient and positive-unit polarisation action.

**Construction or proof.**

1. Import the level automorphism and associated coefficient identification from H3 and B5.
2. Use O1 functoriality to obtain the section map. Compute identity/composition on the actual cover.
3. Boundary and polarisation compatibility allow restriction to cusp forms and descent to arithmetic classes.

**Prerequisites.** `HilbertModularVarietiesAndShimuraCurves:H3/arithmetic-quotient`, `HilbertModularVarietiesAndShimuraCurves:H3/ideal-class-comparisons`, `AutomorphicBundles:B5/hecke-section-operator`, [OverconvergentAutomorphicForms:O1/coefficient-descent-functoriality](#o1-coefficient-descent-functoriality), [OverconvergentAutomorphicForms:O4/polarisation-choice-independence](#o4-polarisation-choice-independence), [ShimuraCompactifications:C6/roadmap/hilbert-toroidal-model](../packets/ShimuraCompactifications.json), [ShimuraCompactifications:C6/roadmap/hilbert-near-ordinary-model](../packets/ShimuraCompactifications.json), [ShimuraCompactifications:C6/roadmap/hilbert-boundary-ideal-pushforward](../packets/ShimuraCompactifications.json), [AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product](../packets/AdicSpacesPartII.json), `HilbertModularVarietiesAndShimuraCurves:H1/hilbert-pel-instance`, `HilbertModularVarietiesAndShimuraCurves:H1/good-representability`, `HilbertModularVarietiesAndShimuraCurves:H4/effective-level-groups`, `HilbertModularVarietiesAndShimuraCurves:H4/finite-level-torsors`.

**Planned interface.** `TauCeti.Overconvergent.hilbert_diamond_operators`; module `TauCeti/NumberTheory/HilbertModularForms/O6`, namespace `TauCeti.Overconvergent`.

**Uses.**

- O6–O7 and B5: The comparison diagrams include the finite tame level actions as well as cyclic isogeny correspondences.

**API.**

- `TauCeti.Overconvergent.hilbert_diamond_operators.apply` (characterisation): Pullback through the level automorphism with its coefficient map.
- `TauCeti.Overconvergent.hilbert_diamond_operators.mul` (relation): Composition follows the fixed level-action convention.
- `TauCeti.Overconvergent.hilbert_diamond_operators.cusp` (compatibility): The induced map preserves vanishing on the boundary.

**Definition tests.**

- `TauCeti.Overconvergent.Test.O6_hilbert_diamond_operators_identity` (degenerate): ⟨1⟩ is the identity operator.
- `TauCeti.Overconvergent.Test.O6_hilbert_diamond_operators_inverse` (computation): ⟨d⁻¹⟩ is inverse to ⟨d⟩.
- `TauCeti.Overconvergent.Test.O6_hilbert_diamond_operators_polarisation` (non-example): A positive-unit polarisation action is not renamed a tame diamond operator without matching the level moduli action.

**Check.**

- For a finite tame-level normalizer element d inducing a level automorphism on the actual Hilbert moduli scheme, define ⟨d⟩ by pullback of sections with the induced coefficient identification. The multiplication law is the one of that level action, with inverse-base-action convention fixed as in B5; boundary ideals and arithmetic polarisation descent are retained.

**Sources.**

- [AIP-CUSP-2016](#source-aip-cusp-2016), §3.7, Remark 3.28, p.24. The Hecke action respects weight families and cuspidality; finite level automorphisms are the degree-one correspondences.

<a id="o6-aip-hecke-equivariance"></a>

### Hecke equivariance of the AIP comparison

**Theorem** · `OverconvergentAutomorphicForms:O6/aip-hecke-equivariance`

**Planet:** Hecke-equivariant AIP comparison.

Imported stable target from [OverconvergentAutomorphicForms--O0.json](../packets/OverconvergentAutomorphicForms--O0.json); the following is its effective assembly contract.

The geometric and arithmetic O5 integral/rational comparison maps intertwine tame T_a, finite tame diamond actions and wild U_𝔭 on their actual section modules, with the same q_a⁻¹ and q_𝔭⁻¹ factors. For wild operators the rational normalized action and integral renormalized action are distinguished.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- All correspondence and AIP chart hypotheses used above hold on the common source and target domains.
- Inherit geometric-aip-comparison’s explicit T5 radius bound and scaled source-domain admission wherever the Hodge–Tate frame comparison is used, on both source and target of each comparison diagram.

**Construction or proof.**

1. For tame isogenies, naturality of the Hodge–Tate sequence makes the torsor frame diagram commute.
2. For wild isogenies, use the adjugate u_𝔭^∨ and u_𝔭^∨e1=e1 in the frame comparison; this identifies the perfectoid coefficient map with the AIP differential pullback.
3. Trace projection/base-change compatibility gives equality after the identical normalization. Arithmetic descent retains the pairing twist and polarisation action.
4. Degree-one finite level correspondences give the diamond compatibility.

**Prerequisites.** [OverconvergentAutomorphicForms:O5/geometric-aip-comparison](#o5-geometric-aip-comparison), [OverconvergentAutomorphicForms:O5/arithmetic-aip-comparison](#o5-arithmetic-aip-comparison), [OverconvergentAutomorphicForms:O6/tame-hilbert-hecke](#o6-tame-hilbert-hecke), [OverconvergentAutomorphicForms:O6/wild-hilbert-hecke](#o6-wild-hilbert-hecke), [OverconvergentAutomorphicForms:O6/hilbert-diamond-operators](#o6-hilbert-diamond-operators), [HodgeTateAndCanonicalSubgroups:T5/igusa-torsor](../packets/HodgeTateAndCanonicalSubgroups.json), [HodgeTateAndCanonicalSubgroups:T5/integral-differential-lattice](../packets/HodgeTateAndCanonicalSubgroups.json), [HodgeTateAndCanonicalSubgroups:T5/integral-lattice-properties](../packets/HodgeTateAndCanonicalSubgroups.json), [HodgeTateAndCanonicalSubgroups:T5/aip-torsor](../packets/HodgeTateAndCanonicalSubgroups.json), [HodgeTateAndCanonicalSubgroups:T5/hodge-tate-aip-lift](../packets/HodgeTateAndCanonicalSubgroups.json), [AdicSpacesPartII:R3/pull-identify-trace](../packets/AdicSpacesPartII.json).

**Planned interface.** `TauCeti.Overconvergent.aip_hecke_equivariance`; module `TauCeti/NumberTheory/HilbertModularForms/O6`, namespace `TauCeti.Overconvergent`.

**Check.**

- The comparison diagram uses exactly the same scalar normalizer on its two sides.

**Sources.**

- [BHW-2023](#source-bhw-2023), Proposition 10.8 and proof, pp.1791–1792. The coefficient maps are compared on isogeny torsors before trace is taken.

<a id="o6-hilbert-q-expansion-comparison"></a>

### Hilbert q-expansion compatibility

**Comparison** · `OverconvergentAutomorphicForms:O6/hilbert-q-expansion-comparison`

Imported stable target from [OverconvergentAutomorphicForms--O0.json](../packets/OverconvergentAutomorphicForms--O0.json); the following is its effective assembly contract.

At each supplied compactified cusp, the O5 frame comparison identifies the perfectoid coefficient q-expansion with the AIP expansion. At algebraic weights it agrees with B5’s classical Hilbert expansion after converting κ_ar=(w,t) to (ν=w,w_AIP=t⁻¹) and matching B5’s coefficient line, cusp labels and Hecke normalization. Vanishing of every cusp constant term characterizes cuspidality in the supplied range.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- Use B5’s exact algebraic-weight, tame level and coefficient-ring hypotheses for its classical expansion principle; p-level/family expansions require the requested extension below.

**Construction or proof.**

1. Pull both coefficient sections to the same Tate semi-abelian cusp chart. T5’s chosen differential/HT frame evaluates to the same formal trivialization.
2. Use B5’s cusp-expansion and boundary criteria for classical specialisations; retain the coefficient line rather than pretending expansions are scalar at every cusp.
3. Use the separately requested bounded-family, p-level extension for the full coefficient sheaf. Compare correspondence expansions by the pull-identify-trace formula and the declared normalizers.

**Prerequisites.** [OverconvergentAutomorphicForms:O5/aip-comparison-naturality](#o5-aip-comparison-naturality), [OverconvergentAutomorphicForms:O6/aip-hecke-equivariance](#o6-aip-hecke-equivariance), `AutomorphicBundles:B5/hilbert-cusp-expansion`, `AutomorphicBundles:B5/hilbert-expansion-principle`, `AutomorphicBundles:B5/hilbert-cuspidal-boundary`, `AutomorphicBundles:B5/hecke-expansion-compatibility`, `AutomorphicBundles:B5`, [ShimuraCompactifications:C6/roadmap/hilbert-toroidal-model](../packets/ShimuraCompactifications.json), [ShimuraCompactifications:C6/roadmap/hilbert-near-ordinary-model](../packets/ShimuraCompactifications.json), [ShimuraCompactifications:C6/roadmap/hilbert-boundary-ideal-pushforward](../packets/ShimuraCompactifications.json), [AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product](../packets/AdicSpacesPartII.json), [ShimuraCompactifications:C6/roadmap/hilbert-q-expansion-comparison](../packets/ShimuraCompactifications.json), [ShimuraCompactifications:C6/roadmap/hilbert-p-level-boundary-comparison](../packets/ShimuraCompactifications.json).

**Planned interface.** `TauCeti.Overconvergent.hilbert_q_expansion_comparison`; module `TauCeti/NumberTheory/HilbertModularForms/O6`, namespace `TauCeti.Overconvergent`.

**Check.**

- For F=Q the cusp constant coefficient is zero precisely for cusp sections.
- A classical B5 theorem at prime-to-p full level is not applied directly to an arbitrary Iwahori family without the requested extension.

**Sources.**

- [BHW-2023](#source-bhw-2023), Remark 6.9; Proposition 10.8, pp.1759,1791–1792. The torsor comparison and boundary-compatible correspondence yield the expansion diagrams; the full family expansion input is explicitly requested.

<a id="o6-fixed-cusp-banach-modules"></a>

### Fixed-radius cusp Banach modules

**Theorem** · `OverconvergentAutomorphicForms:O6/fixed-cusp-banach-modules`

**Planet:** Cusp Banach modules.

Imported stable target from [OverconvergentAutomorphicForms--O0.json](../packets/OverconvergentAutomorphicForms--O0.json); the following is its effective assembly contract.

At finite wild level and an admissible open affinoid U=Spa(A,A+) of the arithmetic weight space, with κ locally n_an-analytic and partial Hasse bounds 0<v_i<1/p^{n_an}, on a selected cofinal global-Hasse minimal affinoid neighbourhood inside the partial-radius region, the fixed-radius cusp module is a projective Banach A-module in the (Pr) sense: a continuous direct summand of an orthonormalisable Banach module. Weight specialisation to the source’s coefficient-field points is surjective. This is not finite projectivity, and no such claim is made for every noncuspidal or infinite-level section module.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- Use the sufficiently small tame level, compactified coefficient model, positive cofinal partial-radius range and finite-level cusp vanishing hypotheses of AIP CUSP Theorems 3.16 and 4.4. For arithmetic descent work in characteristic zero, where the finite Δ projector is defined.
- Choose the refined global-Hasse strict affinoid neighbourhood of AIP CUSP Proposition 3.22’s Hattori footnote. Arbitrary simultaneous partial-radius opens are not assumed affinoid.
- For direct use of AIP CUSP Theorem4.4, U is an admissible open affinoid of the arithmetic weight space, not an arbitrary bounded affinoid mapping to it. At finite wild level use the O2 Atkin–Lehner transport to tame level, with the scaled radius and boundary-compatible coefficient transport supplied by C6; arbitrary weight base change requires a separate completed scalar-extension theorem.

**Construction or proof.**

1. Use O5/O6 cusp comparisons to identify the fixed-radius cusp module with AIP’s compactified coefficient module.
2. Apply AIP CUSP Theorem4.4 on its admissible open arithmetic weight affinoid, retaining its finite characteristic-zero Δ projector and proof via Theorem3.16. For finite wild level first transport to the corresponding tame-level module by O2’s Atkin–Lehner isomorphism, with scaled radius and C6’s boundary transport. The theorem is not cited for an arbitrary affinoid weight pullback.
3. Use cuspidal-coefficient-vanishing on the actual finite-level formal cusp model. The cofinal global-Hasse refinement supplies affinoid acyclicity; the p-complete free local coefficient modules and split exact Cech resolution give (Pr).
4. Use LAD L4’s projective Banach terminology and scalar-extension results only within their exact hypotheses.

**Prerequisites.** [OverconvergentAutomorphicForms:O6/hilbert-cusp-forms](#o6-hilbert-cusp-forms), [OverconvergentAutomorphicForms:O5/arithmetic-aip-comparison](#o5-arithmetic-aip-comparison), [ShimuraCompactifications:C6/roadmap/hilbert-toroidal-model](../packets/ShimuraCompactifications.json), [ShimuraCompactifications:C6/roadmap/hilbert-near-ordinary-model](../packets/ShimuraCompactifications.json), [ShimuraCompactifications:C6/roadmap/hilbert-boundary-ideal-pushforward](../packets/ShimuraCompactifications.json), [LocallyAnalyticDistributions:L4/projective-banach-modules](../packets/LocallyAnalyticDistributions.json), [OverconvergentAutomorphicForms:O6/cuspidal-coefficient-vanishing](#o6-cuspidal-coefficient-vanishing), [OverconvergentAutomorphicForms:O2/hilbert-level-radius-maps](#o2-hilbert-level-radius-maps).

**Planned interface.** `TauCeti.Overconvergent.fixed_cusp_banach_modules`; module `TauCeti/NumberTheory/HilbertModularForms/O6`, namespace `TauCeti.Overconvergent`.

**Check.**

- For F=Q an infinite-dimensional fixed-radius cusp module may satisfy (Pr) without being finite projective over A.
- The statement excludes ε=0 and infinite wild level.

**Sources.**

- [AIP-CUSP-2016](#source-aip-cusp-2016), Theorem 4.4 and proof, p.28; Theorem 3.16, p.18. The fixed-radius cusp module is projective Banach and has surjective specialisation; projective does not mean finite rank.

<a id="o6-compact-radius-restriction"></a>

### Compact restriction of cusp forms

**Theorem** · `OverconvergentAutomorphicForms:O6/compact-radius-restriction`

Imported stable target from [OverconvergentAutomorphicForms--O0.json](../packets/OverconvergentAutomorphicForms--O0.json); the following is its effective assembly contract.

For finite-level fixed cusp Banach modules on nested admissible minimal affinoid neighbourhoods V⋐_U W with coherent pushed-forward cusp coefficient, restriction S(W)→S(V) is completely continuous in the nonarchimedean finite-rank-approximation sense used by LAD L4. It is not justified merely by continuity or by compactness of a topological image over a general affinoid algebra.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- Use C6’s coherent cusp pushforward and the relative compactness W,V required by AdicSpacesPartII:R3. Source S(W) satisfies (Pr).
- Choose the same cofinal global-Hasse affinoid models as fixed-cusp-banach-modules, with the required relative compact containment after the controlling radius improvement.
- Use the admissible open arithmetic weight affinoid of fixed-cusp-banach-modules. An arbitrary bounded affinoid weight pullback needs a separate completed scalar-extension result preserving (Pr).

**Construction or proof.**

1. Apply AdicSpacesPartII:R3/restriction-strictly-completely-continuous to the coherent sections: after a continuous surjection from a topologically free Banach module, the restriction is strictly completely continuous.
2. Use the (Pr) splitting of fixed-cusp-banach-modules to remove that presentation; finite-rank approximation is preserved under bounded pre/post composition.
3. Use LAD L4/completely-continuous for the exact operator notion. For the controlling product choose V at improved partial radius v/p.

**Prerequisites.** [OverconvergentAutomorphicForms:O6/fixed-cusp-banach-modules](#o6-fixed-cusp-banach-modules), [AdicSpacesPartII:R3/restriction-strictly-completely-continuous](../packets/AdicSpacesPartII.json), [LocallyAnalyticDistributions:L4/completely-continuous](../packets/LocallyAnalyticDistributions.json), [ShimuraCompactifications:C6/roadmap/hilbert-toroidal-model](../packets/ShimuraCompactifications.json), [ShimuraCompactifications:C6/roadmap/hilbert-near-ordinary-model](../packets/ShimuraCompactifications.json), [ShimuraCompactifications:C6/roadmap/hilbert-boundary-ideal-pushforward](../packets/ShimuraCompactifications.json).

**Planned interface.** `TauCeti.Overconvergent.compact_radius_restriction`; module `TauCeti/NumberTheory/HilbertModularForms/O6`, namespace `TauCeti.Overconvergent`.

**Check.**

- Restriction along an equality of domains is the identity and is not completely continuous on an infinite orthonormalisable module.

**Sources.**

- [AIP-CUSP-2016](#source-aip-cusp-2016), Lemma 3.27 and proof, p.24. The compactness proof factors through restriction between the nested Hasse neighbourhoods.

<a id="o6-controlling-hilbert-operator"></a>

### Controlling Hilbert U operator

**Construction** · `OverconvergentAutomorphicForms:O6/controlling-hilbert-operator`

**Planet:** Controlling Hilbert U operator.

Imported stable target from [OverconvergentAutomorphicForms--O0.json](../packets/OverconvergentAutomorphicForms--O0.json); the following is its effective assembly contract.

On finite-level arithmetic cusp forms over a bounded affinoid family define U_p=∏_{𝔭|p}U_𝔭^{e_𝔭}, e_𝔭=v_𝔭(p), using the commuting arithmetic operators and polarisation transports. The product maps through the neighbourhood with every partial Hasse bound v_i/p; its total normalizer is (∏q_𝔭^{e_𝔭})⁻¹=p^(−g).

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- Use compatible finite-level partial-radius correspondences and a fixed positive radius vector v. The arithmetic class quotient gives a canonical endomorphism; G* requires the stated polarisation representative maps.
- Choose the same cofinal global-Hasse affinoid models as fixed-cusp-banach-modules, with the required relative compact containment after the controlling radius improvement.

**Construction or proof.**

1. Compose wild operators with multiplicities e_𝔭. Their quotient isogenies cover all primes above p and their combined radius gain is division by p in each coordinate (AIP Lemma 3.25(4)).
2. Use arithmetic polarisation-choice-independence to identify the final pc component with c.
3. Compute ∏q_𝔭^{e_𝔭}=p^{∑e_𝔭f_𝔭}=p^g; retain that normalizer.

**Prerequisites.** [OverconvergentAutomorphicForms:O6/wild-hilbert-hecke](#o6-wild-hilbert-hecke), [OverconvergentAutomorphicForms:O4/polarisation-choice-independence](#o4-polarisation-choice-independence), `HilbertModularVarietiesAndShimuraCurves:H3/arithmetic-quotient`, `HilbertModularVarietiesAndShimuraCurves:H3/ideal-class-comparisons`, [HodgeTateAndCanonicalSubgroups:T4/canonical-anticanonical-loci](../packets/HodgeTateAndCanonicalSubgroups.json), [HodgeTateAndCanonicalSubgroups:T4/atkin-lehner-anticanonical](../packets/HodgeTateAndCanonicalSubgroups.json), [HodgeTateAndCanonicalSubgroups:T4/hodge-tate-coordinate](../packets/HodgeTateAndCanonicalSubgroups.json), [HodgeTateAndCanonicalSubgroups:T4/period-map-inclusions](../packets/HodgeTateAndCanonicalSubgroups.json), [AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product](../packets/AdicSpacesPartII.json), `HilbertModularVarietiesAndShimuraCurves:H3/hilbert-hecke-isogenies`, [HodgeTateAndCanonicalSubgroups:T3/hilbert-canonical-subgroup](../packets/HodgeTateAndCanonicalSubgroups.json), [HodgeTateAndCanonicalSubgroups:T3/quotient-hasse-radius](../packets/HodgeTateAndCanonicalSubgroups.json).

**Planned interface.** `TauCeti.Overconvergent.controlling_hilbert_operator`; module `TauCeti/NumberTheory/HilbertModularForms/O6`, namespace `TauCeti.Overconvergent`.

**Uses.**

- O6 complete continuity; PadicFamilies:L2a: This operator and its (Pr) cusp Banach module provide the compact-operator input for a separately owned eigenvariety construction.

**API.**

- `TauCeti.Overconvergent.controlling_hilbert_operator.product` (characterisation): U_p=∏U_𝔭^{e_𝔭}, with compatible arithmetic polarisation identifications.
- `TauCeti.Overconvergent.controlling_hilbert_operator.radiusFactorisation` (functoriality): Factor S(v)→S(v/p)→S(v), where the first map is restriction and the second the bounded correspondence action.
- `TauCeti.Overconvergent.controlling_hilbert_operator.normalizer` (simp): The product scalar factor is p^(−g).

**Definition tests.**

- `TauCeti.Overconvergent.Test.O6_controlling_hilbert_operator_rational` (compatibility): For F=Q this is the usual single U_p with normalizer 1/p.
- `TauCeti.Overconvergent.Test.O6_controlling_hilbert_operator_ramification` (computation): If p is totally ramified of degree g, the controlling operator is U_𝔭^g, not just U_𝔭.
- `TauCeti.Overconvergent.Test.O6_controlling_hilbert_operator_split` (computation): For a split prime in a quadratic field it is U_𝔭1 U_𝔭2 with normalizer p⁻².

**Check.**

- On finite-level arithmetic cusp forms over a bounded affinoid family define U_p=∏_{𝔭|p}U_𝔭^{e_𝔭}, e_𝔭=v_𝔭(p), using the commuting arithmetic operators and polarisation transports. The product maps through the neighbourhood with every partial Hasse bound v_i/p; its total normalizer is (∏q_𝔭^{e_𝔭})⁻¹=p^(−g).

**Sources.**

- [BHW-2023](#source-bhw-2023), Remark 10.6, p.1791. The controlling operator is the product with ramification multiplicities.
- [AIP-CUSP-2016](#source-aip-cusp-2016), Lemma 3.25(4) and Lemma 3.27, pp.22–24. The product improves all partial radii before the compact restriction factor.

<a id="o6-controlling-complete-continuity"></a>

### Complete continuity of the controlling operator

**Theorem** · `OverconvergentAutomorphicForms:O6/controlling-complete-continuity`

Imported stable target from [OverconvergentAutomorphicForms--O0.json](../packets/OverconvergentAutomorphicForms--O0.json); the following is its effective assembly contract.

The controlling U_p on the specified finite-level, fixed positive-radius cusp Banach A-module is completely continuous. For G* include its fixed representative comparisons. The proof is the actual radius factorisation through the compact restriction of O6; no compactness claim for every individual U_𝔭 or for the ε=0/infinite-level space is included.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- Use all hypotheses of fixed-cusp-banach-modules, compact-radius-restriction and controlling-hilbert-operator.
- Choose the same cofinal global-Hasse affinoid models as fixed-cusp-banach-modules, with the required relative compact containment after the controlling radius improvement.

**Construction or proof.**

1. Use U_p=bounded correspondence map ∘ restriction S(v)→S(v/p).
2. Apply compact-radius-restriction and stability of complete continuity under bounded composition from LAD L4.
3. O6 AIP Hecke equivariance gives the same factorisation as AIP CUSP Lemma 3.27, including normalization and polarisation choices.

**Prerequisites.** [OverconvergentAutomorphicForms:O6/controlling-hilbert-operator](#o6-controlling-hilbert-operator), [OverconvergentAutomorphicForms:O6/compact-radius-restriction](#o6-compact-radius-restriction), [OverconvergentAutomorphicForms:O6/aip-hecke-equivariance](#o6-aip-hecke-equivariance), [LocallyAnalyticDistributions:L4/completely-continuous](../packets/LocallyAnalyticDistributions.json).

**Planned interface.** `TauCeti.Overconvergent.controlling_complete_continuity`; module `TauCeti/NumberTheory/HilbertModularForms/O6`, namespace `TauCeti.Overconvergent`.

**Check.**

- At F=Q the factorisation passes through radius v/p.
- An individual split-prime operator improves only one direction, so this proof does not apply to it.

**Sources.**

- [AIP-CUSP-2016](#source-aip-cusp-2016), Lemma 3.27, p.24. The concrete compact restriction factor proves complete continuity.
- [BHW-2023](#source-bhw-2023), Remark 10.6, p.1791. BHW identifies this controlling product with the AIP compact operator.

<a id="o6-hecke-lattice-renormalisation"></a>

### Integral renormalisation of wild Hecke operators

**Theorem** · `OverconvergentAutomorphicForms:O6/hecke-lattice-renormalisation`

Imported stable target from [OverconvergentAutomorphicForms--O0.json](../packets/OverconvergentAutomorphicForms--O0.json); the following is its effective assembly contract.

T_a preserves the specified integral lattice. Each q_𝔭 U_𝔭 preserves it, and p^g U_p preserves it because ∏q_𝔭^{e_𝔭}=p^g. These are sufficient uniform renormalizations on the stated domains, not assertions of optimality or integrality of the rational normalized U_𝔭 for every weight.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- Use integral coefficient maps, trace preserving O+ on the supplied finite locally free integral correspondence models, and integral polarisation transport.

**Construction or proof.**

1. Tame normalizers q_a are p-adic units, so the integral pull-identify-trace map remains integral.
2. For a wild factor remove 1/q_𝔭; its coefficient map and integral trace preserve the lattice.
3. Compose the renormalized factors and use the degree/norm identity of controlling-hilbert-operator; arithmetic integral transport preserves the lattice.

**Prerequisites.** [OverconvergentAutomorphicForms:O6/tame-hilbert-hecke](#o6-tame-hilbert-hecke), [OverconvergentAutomorphicForms:O6/wild-hilbert-hecke](#o6-wild-hilbert-hecke), [OverconvergentAutomorphicForms:O6/controlling-hilbert-operator](#o6-controlling-hilbert-operator), [AdicSpacesPartII:R3/analytic-trace-finite-locally-free](../packets/AdicSpacesPartII.json), `PerfectoidSpaces:P9/weight-extension-sheaf-equalizer`, `PerfectoidSpaces:P9/function-descent-along-tower`, `HilbertModularVarietiesAndShimuraCurves:H4/effective-level-groups`, `HilbertModularVarietiesAndShimuraCurves:H4/finite-level-torsors`.

**Planned interface.** `TauCeti.Overconvergent.hecke_lattice_renormalisation`; module `TauCeti/NumberTheory/HilbertModularForms/O6`, namespace `TauCeti.Overconvergent`.

**Check.**

- For F=Q the sufficient renormalization is pU_p.
- Tame integral preservation alone cannot prove normalized wild integral preservation.

**Sources.**

- [BHW-2023](#source-bhw-2023), Lemma 10.3 and Remark 10.7, pp.1789–1791. The wild coefficient map is integral, but its rational trace normalizer need not preserve the lattice.

<a id="o6-cuspidal-coefficient-vanishing"></a>

### Cuspidal coefficient pushforward vanishing

**Theorem** · `OverconvergentAutomorphicForms:O6/cuspidal-coefficient-vanishing`

Imported stable target from [OverconvergentAutomorphicForms--O0.json](../packets/OverconvergentAutomorphicForms--O0.json); the following is its effective assembly contract.

For the supplied toroidal-to-minimal map ρ at the finite Igusa/p-level formal model and the small analytic coefficient Ωχ, R^qρ_*Ωχ(−D)=0 for q>0; the untwisted structural assertion is R^qρ_*O(−D)=0. After the permitted base changes, the pushed-forward cusp coefficient is coherent and gives the acyclic affinoid section model used for (Pr) and specialisation.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Use the precise formal Igusa normalization, boundary divisor and sufficiently small analytic character χ of AIP CUSP §3.6. The formal cusp vanishing input from the fan/unit quotient is the recorded missing compactification theorem.
- The chosen minimal neighbourhood is an actual global-Hasse affinoid strict neighbourhood inside the partial-radius region; AIP CUSP Proposition 3.22’s Hattori footnote explicitly requires this refinement.

**Construction or proof.**

1. Use the formal cusp description supplied by C6: the completed torus embedding fan modulo its unit group, with positive support for O(−D).
2. The formal-functions theorem reduces higher direct-image vanishing to cohomology of those cusp fibres; AIP CUSP Appendix Proposition 6.4 gives the required fan/unit-quotient vanishing. This auxiliary theorem is recorded as a Part II owner gap, not presumed from a compactification alone.
3. AIP Lemma 3.19 identifies the small analytic character line modulo p with O. Lift the structural vanishing by p-adic completeness/Nakayama as in Corollary 3.20.
4. On the refined minimal affinoid use AdicSpacesPartII R3 finite-module Tate acyclicity; apply finite characteristic-zero projectors only after rationalisation.

**Prerequisites.** [ShimuraCompactifications:C6/roadmap/hilbert-toroidal-model](../packets/ShimuraCompactifications.json), [ShimuraCompactifications:C6/roadmap/hilbert-near-ordinary-model](../packets/ShimuraCompactifications.json), [ShimuraCompactifications:C6/roadmap/hilbert-boundary-ideal-pushforward](../packets/ShimuraCompactifications.json), [AdicSpacesPartII:R3/tate-acyclicity-finite-modules](../packets/AdicSpacesPartII.json), [OverconvergentAutomorphicForms:O5/aip-line-and-gluing](#o5-aip-line-and-gluing), [ShimuraCompactifications:C6](../packets/ShimuraCompactifications.json).

**Planned interface.** `TauCeti.Overconvergent.cuspidal_coefficient_vanishing`; module `TauCeti/NumberTheory/HilbertModularForms/O6`, namespace `TauCeti.Overconvergent`.

**Check.**

- The argument uses −D and is not asserted for every noncuspidal coefficient sheaf.

**Sources.**

- [AIP-CUSP-2016](#source-aip-cusp-2016), Theorem 3.17, Corollary 3.20 and Proposition 3.22 with footnote, pp.18–21. Cuspidal vanishing and the explicitly refined affinoid neighbourhood supply the Banach argument.

### Worked check

For a quadratic F with p split, q𝔭=q𝔮=p and the product U𝔭U𝔮 has trace normalization p⁻². If p is totally ramified, e𝔭=2 and the controlling product U𝔭² again has total normalization p⁻². Generally ∏q𝔭^e𝔭=p^d. This separates the rational operator from an integral renormalization. Compactness is obtained by factoring the controlling map through strict radius restriction between the actual (Pr) cusp Banach modules; (Pr) does not mean finite projectivity.

### Remaining mathematical inputs

- Structural cusp formal cohomology, bounded analytic-family Koecher with finite p-level boundary transport, analytic-family p-level expansions, and the exact C6 model hypotheses.

- **Cuspidal formal cohomology and analytic-family boundary extension:** Add the Hilbert structural cusp formal-cohomology theorem R^qρ_*O(−D)=0, q>0, on the actual finite-Igusa formal cusp fan/unit quotients, with the formal-functions/base-change adapter: AIP CUSP Theorem3.17 and Appendix Lemma6.3/Proposition6.4 pp32–33. C6 boundary ideal pushforward and R^0 global-functions comparison do not give this vanishing. Also extend the reviewed ordinary formal-model interface beyond its extra tame-level conditions when those are needed; otherwise retain them explicitly. O6 applies the structural vanishing to its small analytic coefficient, respecting admissible arithmetic weight opens and cofinal global-Hasse minimal affinoids. (Pr) is not finite projectivity. Separately, extend C6's integral-weight arithmetic Koecher node to the bounded analytic families and finite p-level boundary transport of AIP ADIC Proposition8.4, pp36–37. Classical arithmetic Koecher does not supply this extension.
- **P-level and analytic-family cusp expansions:** Extend the exact classical Hilbert cusp-expansion/principle/boundary nodes to the compactified p-level bounded analytic families used here, retaining the cusp coefficient line, connectedness/base hypotheses, finite-level character twist and the 1/q isogeny trace normalization. Classical prime-to-p expansion nodes alone do not supply this extension.


<a id="layer-o7"></a>

## O7. Ordinary Igusa forms and the Hida comparison

Ordered patchwise completion, compatible weighted ordinary functions and restriction from positive radius.

<a id="o7-ordinary-completed-functions"></a>

### Completed ordinary Igusa functions

**Construction** · `OverconvergentAutomorphicForms:O7/ordinary-completed-functions`

**Planet:** Completed Igusa functions.

Imported stable target from [OverconvergentAutomorphicForms--O0.json](../packets/OverconvergentAutomorphicForms--O0.json); the following is its effective assembly contract.

On each ordinary formal affinoid patch define V+ = lim_m colim_i H^0(Ig_i,O/p^m), with i the finite Igusa level. Sheafify the compatible patchwise construction to obtain the completed Igusa structural sheaf; V=V+[1/p]. Global ordinary p-adic forms are its sheaf sections. Do not exchange the two limits or replace sheafwise completion by an unconditional global-section formula.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Use T5’s actual ordinary formal Igusa tower with finite-etale transition maps. The inverse limit defines the formal completed structural ring; an identification with the actual analytic tower O+ is the separate O7 comparison target, with the exact hypotheses still recorded as a gap.

**Construction or proof.**

1. Reduce the finite Igusa tower modulo p^m and form its direct limit in level first.
2. Take the p-adic inverse limit with its inverse-limit topology; this constructs formal completed tower functions. Do not identify it with analytic O+ merely from Heuer Proposition 3.8’s natural map.
3. Glue and sheafify over the ordinary formal base. Any global-limit interchange on a nonaffine space requires separate acyclicity/Mittag–Leffler hypotheses.

**Prerequisites.** [HodgeTateAndCanonicalSubgroups:T5/igusa-torsor](../packets/HodgeTateAndCanonicalSubgroups.json), [HodgeTateAndCanonicalSubgroups:T5/integral-differential-lattice](../packets/HodgeTateAndCanonicalSubgroups.json), [HodgeTateAndCanonicalSubgroups:T5/integral-lattice-properties](../packets/HodgeTateAndCanonicalSubgroups.json), [HodgeTateAndCanonicalSubgroups:T5/aip-torsor](../packets/HodgeTateAndCanonicalSubgroups.json), [HodgeTateAndCanonicalSubgroups:T5/hodge-tate-aip-lift](../packets/HodgeTateAndCanonicalSubgroups.json), `PerfectoidSpaces:P9/weight-extension-sheaf-equalizer`, `PerfectoidSpaces:P9/function-descent-along-tower`, [AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product](../packets/AdicSpacesPartII.json).

**Planned interface.** `TauCeti.Overconvergent.ordinary_completed_functions`; module `TauCeti/NumberTheory/HilbertModularForms/O7`, namespace `TauCeti.Overconvergent`.

**Uses.**

- O7 weighted ordinary forms and Hida input: These completed functions, with their actual deck action, define ordinary p-adic coefficients.

**API.**

- `TauCeti.Overconvergent.ordinary_completed_functions.modPower` (projection): Projection to colim_i O(Ig_i)/p^m.
- `TauCeti.Overconvergent.ordinary_completed_functions.levelAction` (structure): The compatible finite-level deck actions give a continuous completed tower action.
- `TauCeti.Overconvergent.ordinary_completed_functions.restriction` (functoriality): Restriction between formal patches commutes with both stated limit maps.
- `TauCeti.Overconvergent.ordinary_completed_functions.rationalise` (coercion): V+→V+[1/p].

**Definition tests.**

- `TauCeti.Overconvergent.Test.O7_ordinary_completed_functions_order` (characterisation): For the constant profinite translation tower with deck group Z_p, the m-th quotient is Map_lc(Z_p,Z/p^m); the compatible functions x↦x mod p^m define the completed continuous function x↦x, which factors through no single finite level over Z_p.
- `TauCeti.Overconvergent.Test.O7_ordinary_completed_functions_trivialTower` (compatibility): For a constant affine tower Spf R, the construction is the p-adic completion lim_m R/p^m.
- `TauCeti.Overconvergent.Test.O7_ordinary_completed_functions_nonaffine` (non-example): On a disjoint union of points indexed by n≥1 with a Z_p-torsor on each, the section whose nth component is the nth p-adic digit is locally in the finite-level mod-p structural colimit but has no uniform finite level globally. Thus sheafifying the level colimit before global sections cannot be replaced by a single global level colimit on this non-quasicompact base.

**Check.**

- On each ordinary formal affinoid patch define V+ = lim_m colim_i H^0(Ig_i,O/p^m), with i the finite Igusa level. Sheafify the compatible patchwise construction to obtain the completed Igusa structural sheaf; V=V+[1/p]. Global ordinary p-adic forms are its sheaf sections. Do not exchange the two limits or replace sheafwise completion by an unconditional global-section formula.

**Sources.**

- [HEUER-2022](#source-heuer-2022), Proposition 3.8 and proof, p.16. The proof supplies the ordered formal completion and a natural equivariant map to analytic O+(X∞). It does not prove that this map is generally an isomorphism.
- [BHW-2023](#source-bhw-2023), Proof of Proposition 6.6, p.1758. The ordinary formal tower provides the actual integral coefficient trivializations.

<a id="o7-ordinary-weighted-forms"></a>

### Weighted ordinary Igusa forms

**Construction** · `OverconvergentAutomorphicForms:O7/ordinary-weighted-forms`

**Planet:** Ordinary Igusa forms.

Imported stable target from [OverconvergentAutomorphicForms--O0.json](../packets/OverconvergentAutomorphicForms--O0.json); the following is its effective assembly contract.

For the continuous bounded integral weight κ, define ordinary geometric forms as the completed Igusa functions satisfying f(tu)=κ(u)⁻¹f(t), for the actual O_p^× deck action. Arithmetic ordinary forms retain the w-polarisation/determinant action and its descent exactly as O4. Coefficients and topology are completed before taking this weight equalizer.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Use compatible integral weight coefficients: modulo p^m the character is locally constant and factors through a finite quotient on each fixed affinoid formal patch.

**Construction or proof.**

1. Construct the weight equalizer in the already completed Igusa structural sheaf.
2. Continuity of κ makes the finite reductions compatible; no single Igusa level is claimed to support every continuous character.
3. Use the same twisted finite polarisation descent and Weil-pairing transformation for the arithmetic forms.

**Prerequisites.** [OverconvergentAutomorphicForms:O7/ordinary-completed-functions](#o7-ordinary-completed-functions), [OverconvergentAutomorphicForms:O0/bounded-weight-families](#o0-bounded-weight-families), [OverconvergentAutomorphicForms:O4/twisted-polarisation-action](#o4-twisted-polarisation-action), [OverconvergentAutomorphicForms:O4/weil-pairing-comparison](#o4-weil-pairing-comparison), [HodgeTateAndCanonicalSubgroups:T5/igusa-torsor](../packets/HodgeTateAndCanonicalSubgroups.json), [HodgeTateAndCanonicalSubgroups:T5/integral-differential-lattice](../packets/HodgeTateAndCanonicalSubgroups.json), [HodgeTateAndCanonicalSubgroups:T5/integral-lattice-properties](../packets/HodgeTateAndCanonicalSubgroups.json), [HodgeTateAndCanonicalSubgroups:T5/aip-torsor](../packets/HodgeTateAndCanonicalSubgroups.json), [HodgeTateAndCanonicalSubgroups:T5/hodge-tate-aip-lift](../packets/HodgeTateAndCanonicalSubgroups.json), [AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product](../packets/AdicSpacesPartII.json).

**Planned interface.** `TauCeti.Overconvergent.ordinary_weighted_forms`; module `TauCeti/NumberTheory/HilbertModularForms/O7`, namespace `TauCeti.Overconvergent`.

**Uses.**

- Ordinary restriction and the Hida comparison boundary: The ordinary coefficient model is compared with ε=0 sheaves; no ordinary projector is assumed in the definition.

**API.**

- `TauCeti.Overconvergent.ordinary_weighted_forms.weightRelation` (characterisation): f(tu)=κ(u)⁻¹f(t).
- `TauCeti.Overconvergent.ordinary_weighted_forms.integralInclusion` (coercion): The integral weighted equalizer maps to its rationalized sheaf.
- `TauCeti.Overconvergent.ordinary_weighted_forms.weightPullback` (functoriality): Compatible base/weight pullback induces the weighted ordinary coefficient map.
- `TauCeti.Overconvergent.ordinary_weighted_forms.arithmeticDescent` (compatibility): Retain the finite twisted Δ action and the full pairing character when passing to arithmetic forms.

**Definition tests.**

- `TauCeti.Overconvergent.Test.O7_ordinary_weighted_forms_trivial` (degenerate): κ=1 gives deck-invariant completed functions.
- `TauCeti.Overconvergent.Test.O7_ordinary_weighted_forms_sign` (computation): For κ(u)=u^k in the elliptic case, the relation is f(tu)=u^(−k)f(t).
- `TauCeti.Overconvergent.Test.O7_ordinary_weighted_forms_conductor` (non-example): A character of arbitrarily large conductor cannot be imposed as equivariance on one fixed small finite Igusa level.

**Check.**

- For the continuous bounded integral weight κ, define ordinary geometric forms as the completed Igusa functions satisfying f(tu)=κ(u)⁻¹f(t), for the actual O_p^× deck action. Arithmetic ordinary forms retain the w-polarisation/determinant action and its descent exactly as O4. Coefficients and topology are completed before taking this weight equalizer.

**Sources.**

- [BHW-2023](#source-bhw-2023), Proposition 6.6 and §9, pp.1758,1781–1787. Ordinary Igusa functions carry the same inverse-weight relation and arithmetic twists as the coefficient sheaves.
- [HEUER-2022](#source-heuer-2022), Proposition 3.8, p.16. Integral weight actions on the formal tower descend through compatible finite reductions.

<a id="o7-igusa-completion-comparison"></a>

### Igusa completion comparison

**Comparison** · `OverconvergentAutomorphicForms:O7/igusa-completion-comparison`

Imported stable target from [OverconvergentAutomorphicForms--O0.json](../packets/OverconvergentAutomorphicForms--O0.json); the following is its effective assembly contract.

For the actual ordinary formal affine Igusa tower, take the direct limit in finite level modulo p^m and then the inverse limit in m. Under the finite-level good-reduction and analytic completion contracts below, the natural map identifies this ordered completion with analytic tower O+, equivariantly and compatibly with formal-patch restriction. Compatible weight lattices may be completed by the specified coefficient construction; this does not identify every completed lattice tensor with geometric O+ of a weight product.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- The ordinary base formal patch is flat, topologically of finite presentation, and formally smooth over the integral coefficient ring. Its finite Igusa covers are finite étale and surjective, so the ordinary finite-level special fibres are geometrically reduced. Use the open ordinary Rapoport moduli locus: arbitrary normalized positive-radius models are not included.
- For each finite level put A_i=O(Ig_i,an) with its uniform spectral norm and R_i=O(𝔐_i). T5/P9 supplies the finite-level good-reduction identity R_i={a:‖a‖≤1}, also after the coefficient-field extension. Pullback A_i→A_j is isometric, as its analytic map is surjective.
- P9 supplies the analytic affine tower with function ring A∞ equal to the separated spectral-norm completion of colim_i A_i and structural O+ equal to its power-bounded subring. Restrict on a compatible formal-affine basis. An infinite Igusa tower is not assumed perfectoid merely because its base field is perfectoid.
- For coefficient/weight completion retain the prescribed bounded lattice and P9’s reduction/restriction contract. Arbitrary weights need not have a good-reduction integral model, and geometric O+ is not identified with a lattice tensor without a separate comparison.

**Construction or proof.**

1. AIP §7.1 p30 makes the ordinary finite-level Igusa covers finite étale over the smooth ordinary special fibre. The ordinary discussion in §8.4 p37 places them in the Rapoport locus. T5 must lift these facts to the actual flat formally smooth ordinary charts and finite étale integral covers used by O7, including the coefficient-field base extension.
2. At a discretely valued model with uniformizer π, reduced special fibre gives the elementary norm argument: if a∉πR_i, its nonzero reduction has no nilpotent power, hence ‖a^k‖=1 for all k. After π-scaling this proves the π-adic norm is power-multiplicative and R_i is exactly the unit ball of A_i. The extension to the specified coefficient field is a finite-level good-reduction base-change contract at P9; normality alone is not substituted for this contract.
3. Take the isometric union of the A_i. Its norm is power-multiplicative, hence so is the norm on its separated completion A∞. Consequently its power-bounded subring equals its unit ball.
4. Every element of the unit ball of A∞ can be approximated with error <1 by a finite-level element b. The ultrametric inequality makes ‖b‖≤1, so b∈R_i by the finite-level identity. Repeating to errors |p|^m shows that the unit ball is the p-adic completion of colim_i R_i. The p-adic and norm topologies agree on these integral rings, since p^m times the unit ball is the ball of radius |p|^m. Thus that completion is lim_m colim_i R_i/p^m, in exactly this order.
5. This proves the natural map is an isomorphism once the explicitly requested finite-level good-reduction/base-change and analytic tower contracts are supplied. Heuer Proposition3.8 alone gives only the map and formal-cocycle effectivity, not these contracts.
6. Check actions and restrictions at finite level; their continuous extensions give equivariance and glue the comparison. For weighted reductions use the compatible coefficient-lattice contract separately. No nonaffine global-section or limit interchange is invoked.

**Prerequisites.** [OverconvergentAutomorphicForms:O7/ordinary-completed-functions](#o7-ordinary-completed-functions), `PerfectoidSpaces:P9/weight-extension-sheaf-equalizer`, `PerfectoidSpaces:P9/function-descent-along-tower`, [HodgeTateAndCanonicalSubgroups:T5/igusa-torsor](../packets/HodgeTateAndCanonicalSubgroups.json), [HodgeTateAndCanonicalSubgroups:T5/integral-differential-lattice](../packets/HodgeTateAndCanonicalSubgroups.json), [HodgeTateAndCanonicalSubgroups:T5/integral-lattice-properties](../packets/HodgeTateAndCanonicalSubgroups.json), [HodgeTateAndCanonicalSubgroups:T5/aip-torsor](../packets/HodgeTateAndCanonicalSubgroups.json), [HodgeTateAndCanonicalSubgroups:T5/hodge-tate-aip-lift](../packets/HodgeTateAndCanonicalSubgroups.json), [AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product](../packets/AdicSpacesPartII.json), [AdicSpacesPartII:R0/reduced-reduction-ring-of-definition](../packets/AdicSpacesPartII.json), [AdicSpacesPartII:R3/uniform-spectral-seminorm](../packets/AdicSpacesPartII.json), [ShimuraCompactifications:C6/roadmap/hilbert-ordinary-model-comparison](../packets/ShimuraCompactifications.json), [HodgeTateAndCanonicalSubgroups:T5](../packets/HodgeTateAndCanonicalSubgroups.json), `PerfectoidSpaces:P9`.

**Planned interface.** `TauCeti.Overconvergent.igusa_completion_comparison`; module `TauCeti/NumberTheory/HilbertModularForms/O7`, namespace `TauCeti.Overconvergent`.

**Check.**

- The finite-level unit-ball identity and isometric transitions are checked before completion.
- The completed norm remains power-multiplicative; a unit-ball approximant has integral finite-level coefficients.
- The constant model O_K⟨pT,T²,T³⟩ fails the reduced-fibre/unit-ball hypothesis: T² is bounded, but T is power-bounded and not a structural formal function.
- A non-quasicompact ordinary base retains patchwise sheafification; no uniform global finite level is inferred.

**Sources.**

- [HEUER-2022](#source-heuer-2022), Proof of Proposition 3.8, p.16. Heuer constructs a natural map, not a general identification with O+. The exact isomorphism for the actual ordinary Igusa models is an additional unverified P9 target.
- [AIP-ADIC-2016](#source-aip-adic-2016), §7.1 p30; Proposition8.4 and ordinary discussion p37. The ordinary special fibre is smooth and its Igusa trivialization covers are finite étale; ordinary points lie in the Rapoport locus. These provide good-reduction leads for the explicit integral-model request, not a general completion theorem.

<a id="o7-ordinary-restriction"></a>

### Restriction to ordinary Igusa forms

**Construction** · `OverconvergentAutomorphicForms:O7/ordinary-restriction`

**Planet:** Ordinary restriction.

Imported stable target from [OverconvergentAutomorphicForms--O0.json](../packets/OverconvergentAutomorphicForms--O0.json); the following is its effective assembly contract.

Restrict a fixed positive-radius geometric/arithmetic form to the ordinary locus and pull back to its Igusa frame, producing its weighted completed Igusa function. The maps are compatible with positive-radius restrictions and therefore give Mκ†→ordinary Igusa forms, with integral and cusp versions. No surjectivity onto all ordinary forms is part of this map.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
- Use the ordinary torsor frame comparison of T5 and O5. The map on integral sections uses the actual completed structural sheaf comparison.

**Construction or proof.**

1. Restrict the coefficient section to ε=0.
2. Pull to the ordinary Igusa torsor and evaluate using the selected differential/HT frame; its transformation is precisely the inverse weight relation.
3. Apply igusa-completion-comparison to identify the integral function, retain arithmetic twists, and use the positive-radius colimit universal property.

**Prerequisites.** [OverconvergentAutomorphicForms:O3/overconvergent-hilbert-forms](#o3-overconvergent-hilbert-forms), [OverconvergentAutomorphicForms:O7/ordinary-weighted-forms](#o7-ordinary-weighted-forms), [OverconvergentAutomorphicForms:O7/igusa-completion-comparison](#o7-igusa-completion-comparison), [OverconvergentAutomorphicForms:O5/aip-comparison-naturality](#o5-aip-comparison-naturality), [HodgeTateAndCanonicalSubgroups:T5/igusa-torsor](../packets/HodgeTateAndCanonicalSubgroups.json), [HodgeTateAndCanonicalSubgroups:T5/integral-differential-lattice](../packets/HodgeTateAndCanonicalSubgroups.json), [HodgeTateAndCanonicalSubgroups:T5/integral-lattice-properties](../packets/HodgeTateAndCanonicalSubgroups.json), [HodgeTateAndCanonicalSubgroups:T5/aip-torsor](../packets/HodgeTateAndCanonicalSubgroups.json), [HodgeTateAndCanonicalSubgroups:T5/hodge-tate-aip-lift](../packets/HodgeTateAndCanonicalSubgroups.json), [AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product](../packets/AdicSpacesPartII.json).

**Planned interface.** `TauCeti.Overconvergent.ordinary_restriction`; module `TauCeti/NumberTheory/HilbertModularForms/O7`, namespace `TauCeti.Overconvergent`.

**Uses.**

- O7 coefficient comparison; Hida-theoretic consumers: This supplies the actual bridge from positive-radius coefficients to completed ordinary coefficients.

**API.**

- `TauCeti.Overconvergent.ordinary_restriction.ofRadius` (compatibility): The colimit map on a positive-radius representative is restriction to the ordinary locus.
- `TauCeti.Overconvergent.ordinary_restriction.integral` (compatibility): The map preserves the integral weighted sheaf.
- `TauCeti.Overconvergent.ordinary_restriction.cusp` (compatibility): Boundary vanishing is retained on ordinary cusp charts.
- `TauCeti.Overconvergent.ordinary_restriction.levelWeight` (functoriality): The map commutes with compatible level and weight changes.

**Definition tests.**

- `TauCeti.Overconvergent.Test.O7_ordinary_restriction_representatives` (characterisation): Two colimit representatives agreeing on a smaller positive radius have the same ordinary image.
- `TauCeti.Overconvergent.Test.O7_ordinary_restriction_trivial` (computation): A weight-zero constant section restricts to the same constant Igusa function.
- `TauCeti.Overconvergent.Test.O7_ordinary_restriction_wholeSpace` (non-example): An ordinary function without any positive-radius extension is not declared an overconvergent form.

**Check.**

- Restrict a fixed positive-radius geometric/arithmetic form to the ordinary locus and pull back to its Igusa frame, producing its weighted completed Igusa function. The maps are compatible with positive-radius restrictions and therefore give Mκ†→ordinary Igusa forms, with integral and cusp versions. No surjectivity onto all ordinary forms is part of this map.

**Sources.**

- [BHW-2023](#source-bhw-2023), Proof of Proposition 6.6 and Theorem 7.14, pp.1758,1764–1765. The ordinary coefficient frame is the restriction of the same independent torsor comparison.

<a id="o7-ordinary-coefficient-comparison"></a>

### Ordinary coefficient comparison

**Comparison** · `OverconvergentAutomorphicForms:O7/ordinary-coefficient-comparison`

Imported stable target from [OverconvergentAutomorphicForms--O0.json](../packets/OverconvergentAutomorphicForms--O0.json); the following is its effective assembly contract.

The ε=0 perfectoid/AIP integral coefficient sheaf identifies with the weighted completed Igusa sheaf through the ordinary differential frame and its formal cocycle descent. Arithmetic comparison retains w(eβ)⁻¹ and twisted finite Δ(N)-descent. This identifies ordinary coefficient models, not the entire positive-radius overconvergent space with ordinary Hida forms.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Use actual ordinary formal torsor and the completion comparison on patches; κ is bounded with integral unit values.

**Construction or proof.**

1. On each ordinary formal patch the HT frame and modified differential frame coincide through T5.
2. Use O1 analytic-line-effectivity’s formal Igusa descent theorem to identify the weighted completed functions with the coefficient line.
3. Apply the O4 pairing and finite twisted descent to the arithmetic model; glue by the selected frame’s uniqueness.
4. Use O5’s integral comparison as an isomorphism of the specified O+ equalizers. Any claim of full-character positive-radius local freeness additionally requires the separate unit-trivialization input of O5/aip-line-and-gluing.

**Prerequisites.** [OverconvergentAutomorphicForms:O7/ordinary-weighted-forms](#o7-ordinary-weighted-forms), [OverconvergentAutomorphicForms:O7/igusa-completion-comparison](#o7-igusa-completion-comparison), [OverconvergentAutomorphicForms:O5/geometric-aip-comparison](#o5-geometric-aip-comparison), [OverconvergentAutomorphicForms:O5/arithmetic-aip-comparison](#o5-arithmetic-aip-comparison), [OverconvergentAutomorphicForms:O1/analytic-line-effectivity](#o1-analytic-line-effectivity), [HodgeTateAndCanonicalSubgroups:T5/igusa-torsor](../packets/HodgeTateAndCanonicalSubgroups.json), [HodgeTateAndCanonicalSubgroups:T5/integral-differential-lattice](../packets/HodgeTateAndCanonicalSubgroups.json), [HodgeTateAndCanonicalSubgroups:T5/integral-lattice-properties](../packets/HodgeTateAndCanonicalSubgroups.json), [HodgeTateAndCanonicalSubgroups:T5/aip-torsor](../packets/HodgeTateAndCanonicalSubgroups.json), [HodgeTateAndCanonicalSubgroups:T5/hodge-tate-aip-lift](../packets/HodgeTateAndCanonicalSubgroups.json), [AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product](../packets/AdicSpacesPartII.json), [PerfectoidShimuraVarieties:S5/hilbert-weil-pairing](../packets/PerfectoidShimuraVarieties.json), [PerfectoidShimuraVarieties:S5/hilbert-polarization-torsors](../packets/PerfectoidShimuraVarieties.json).

**Planned interface.** `TauCeti.Overconvergent.ordinary_coefficient_comparison`; module `TauCeti/NumberTheory/HilbertModularForms/O7`, namespace `TauCeti.Overconvergent`.

**Check.**

- For an algebraic elliptic weight this is the usual ordinary differential trivialization of ω^k.

**Sources.**

- [HEUER-2022](#source-heuer-2022), Proposition 3.8, p.16. Integral formal Igusa cocycles define the descended analytic line.
- [AIP-ADIC-2016](#source-aip-adic-2016), §8.4, discussion after Proposition 8.4, p.37. The ordinary restriction recovers the Katz/Hida coefficient model, with further Hida theorems separate.

<a id="o7-ordinary-hecke-expansions"></a>

### Ordinary Hecke and expansion compatibility

**Theorem** · `OverconvergentAutomorphicForms:O7/ordinary-hecke-expansions`

**Planet:** Ordinary coefficient comparison.

Imported stable target from [OverconvergentAutomorphicForms--O0.json](../packets/OverconvergentAutomorphicForms--O0.json); the following is its effective assembly contract.

Ordinary restriction and the ordinary coefficient comparison commute with compatible weight/level/radius maps, normalized tame T_a, diamonds and wild U_𝔭 on the supplied ordinary correspondences, and with all supplied cusp q-expansions. Cusp forms remain cusp forms and integral renormalized operators obey the same comparison.

**Hypotheses.**

- F is a totally real number field of degree g; p is any rational prime, including ramified primes.
- Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
- A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
- Use the compactified ordinary correspondence, expansion and integral-trace inputs requested for O6; retain the same normalizers and arithmetic transport.

**Construction or proof.**

1. Restrict the O6 isogeny/torsor diagrams to the ordinary locus; the Igusa frame is the restriction of their tautological frame.
2. Finite-level reductions commute with the supplied correspondence maps and trace. Take completion in the established order to obtain the ordinary diagrams.
3. On Tate cusp charts the same coefficient trivialization gives the same q-series; arithmetic twists and the boundary ideal persist under descent.

**Prerequisites.** [OverconvergentAutomorphicForms:O7/ordinary-restriction](#o7-ordinary-restriction), [OverconvergentAutomorphicForms:O7/ordinary-coefficient-comparison](#o7-ordinary-coefficient-comparison), [OverconvergentAutomorphicForms:O6/aip-hecke-equivariance](#o6-aip-hecke-equivariance), [OverconvergentAutomorphicForms:O6/hilbert-q-expansion-comparison](#o6-hilbert-q-expansion-comparison), [OverconvergentAutomorphicForms:O6/hecke-lattice-renormalisation](#o6-hecke-lattice-renormalisation), `PerfectoidSpaces:P9/weight-extension-sheaf-equalizer`, `PerfectoidSpaces:P9/function-descent-along-tower`.

**Planned interface.** `TauCeti.Overconvergent.ordinary_hecke_expansions`; module `TauCeti/NumberTheory/HilbertModularForms/O7`, namespace `TauCeti.Overconvergent`.

**Check.**

- In the elliptic case ordinary and overconvergent restriction have the same q-expansion at each ordinary cusp.
- No assertion of equality of all ordinary and finite-slope overconvergent spaces follows.

**Sources.**

- [BHW-2023](#source-bhw-2023), Proposition 10.8, pp.1791–1792. The torsor/isogeny comparison restricts to the ordinary coefficient model.
- [HEUER-2022](#source-heuer-2022), Proposition 3.8, p.16. Compatible finite-level integral reductions supply the completed version of the same diagrams.

### Worked check

For the constant finite towers Z/p^iZ, let R_i be all Z_p-valued functions on Z/p^iZ with pullback transition maps. Then lim_m colim_i R_i/p^m is C(Z_p,Z_p): a continuous function is locally constant modulo p^m. In contrast, colim_i lim_m R_i/p^m consists of locally constant Z_p-valued functions; x↦x is missing. This demonstrates why the specified order and completion matter before any geometric comparison is attempted.

### Remaining mathematical inputs

- Actual ordinary good-reduction/base-extension and analytic completion contracts. No control theorem or surjectivity onto all ordinary forms is asserted.

- **Ordinary integral models and analytic tower completion:** For the actual ordinary formal-affine Igusa tower provide R_i=A_i° after the specified coefficient extension, isometric transition maps, and an analytic affine tower with A∞ the separated spectral-norm completion of colim A_i and compatible formal-affine restrictions. O7 then proves (lim_m colim_i R_i/p^m)≅A∞°. Keep any weight lattice comparison separate; do not assert reduced R_i/p after nondiscrete C_p base change, and do not assume the tower is perfectoid. Actual ordinary formal models/finite étale covers are the separate T5 request; C6/roadmap/hilbert-ordinary-model-comparison retains its stated tame-level restrictions.
- **Cuspidal formal cohomology and analytic-family boundary extension:** Add the Hilbert structural cusp formal-cohomology theorem R^qρ_*O(−D)=0, q>0, on the actual finite-Igusa formal cusp fan/unit quotients, with the formal-functions/base-change adapter: AIP CUSP Theorem3.17 and Appendix Lemma6.3/Proposition6.4 pp32–33. C6 boundary ideal pushforward and R^0 global-functions comparison do not give this vanishing. Also extend the reviewed ordinary formal-model interface beyond its extra tame-level conditions when those are needed; otherwise retain them explicitly. O6 applies the structural vanishing to its small analytic coefficient, respecting admissible arithmetic weight opens and cofinal global-Hasse minimal affinoids. (Pr) is not finite projectivity. Separately, extend C6's integral-weight arithmetic Koecher node to the bounded analytic families and finite p-level boundary transport of AIP ADIC Proposition8.4, pp36–37. Classical arithmetic Koecher does not supply this extension.
- **P-level and analytic-family cusp expansions:** Extend the exact classical Hilbert cusp-expansion/principle/boundary nodes to the compactified p-level bounded analytic families used here, retaining the cusp coefficient line, connectedness/base hypotheses, finite-level character twist and the 1/q isogeny trace normalization. Classical prime-to-p expansion nodes alone do not supply this extension.


<a id="layer-o8"></a>

## O8. Examples beyond Hilbert

Siegel matrix factors, normalized analytic coefficients and finite algebraic subobjects; toroidal and Bruhat-reduced instances.

<a id="o8-graph-normalisation"></a>

### Normalisation of a Siegel row graph

**Lemma** · `OverconvergentAutomorphicForms:O8/graph-normalisation`

Imported stable target from [OverconvergentAutomorphicForms--O8.json](../packets/OverconvergentAutomorphicForms--O8.json); the following is its effective assembly contract.

Put J=A+ZC and Zγ=J⁻¹(B+ZD). If det J is a unit, then [I,Z][A,B;C,D]=J[I,Zγ]. Here [I,Z] is Matrix.fromCols I Z and J⁻¹ is the nonsingular matrix inverse.

**Hypotheses.**

- R is a commutative ring; the matrix index set n is finite with decidable equality.
- All displayed blocks and Z are square n by n matrices. These algebraic statements include the empty index set; the geometric application has g≥1.
- det(A+ZC) is a unit.

**Construction or proof.**

1. Expand the left-hand side by Matrix.fromCols_mul_fromBlocks.
2. Expand the right-hand side by Matrix.mul_fromCols and cancel JJ⁻¹ using Matrix.mul_nonsing_inv. No symplectic hypothesis is needed for this finite algebra identity.

**Prerequisites.** [mathlib:Matrix.fromCols](#baseline-interfaces), [mathlib:Matrix.fromCols_mul_fromBlocks](#baseline-interfaces), [mathlib:Matrix.mul_fromCols](#baseline-interfaces), [mathlib:Matrix.mul_nonsing_inv](#baseline-interfaces).

**Planned interface.** `TauCeti.Overconvergent.Siegel.graph_normalisation`; module `TauCeti/NumberTheory/Overconvergent/Siegel/Coefficients`, namespace `TauCeti.Overconvergent.Siegel`.

**Check.**

- For γ=I the coordinate is Z and the factor is I.
- For g=1 the coordinate is (a+zc)⁻¹(b+zd).
- For g=1, Z=0 and γ=[0,1;1,0], the factor is zero and the normalisation equation fails; the unit hypothesis is essential.

**Sources.**

- [drw-v3](#source-drw-v3), Lemma 2.3.1 and its displayed proof, p. 15. The chart calculation is restated over an arbitrary commutative ring with its exact unit hypothesis.

<a id="o8-factor-composition"></a>

### Siegel matrix automorphy factor

**Lemma** · `OverconvergentAutomorphicForms:O8/factor-composition`

Imported stable target from [OverconvergentAutomorphicForms--O8.json](../packets/OverconvergentAutomorphicForms--O8.json); the following is its effective assembly contract.

For γ=[A,B;C,D], δ=[E,F;G,H], put Jγ(Z)=A+ZC and Zγ=Jγ(Z)⁻¹(B+ZD). If det Jγ(Z) is a unit, then Jγδ(Z)=Jγ(Z)(E+ZγG), where Jγδ(Z)=(AE+BG)+Z(CE+DG). Thus Jγδ(Z)=Jγ(Z)Jδ(Zγ), in this order.

**Hypotheses.**

- R is a commutative ring; the matrix index set n is finite with decidable equality.
- All displayed blocks and Z are square n by n matrices. These algebraic statements include the empty index set; the geometric application has g≥1.
- det Jγ(Z) is a unit.

**Construction or proof.**

1. Use Matrix.fromBlocks_multiply for the top-left and bottom-left entries of γδ.
2. Distribute (A+ZC)(E+Jγ(Z)⁻¹(B+ZD)G). Cancel JJ⁻¹ using graph-normalisation and compare the four summands.

**Prerequisites.** [OverconvergentAutomorphicForms:O8/graph-normalisation](#o8-graph-normalisation), [mathlib:Matrix.fromBlocks_multiply](#baseline-interfaces), [mathlib:Matrix.mul_nonsing_inv](#baseline-interfaces).

**Planned interface.** `TauCeti.Overconvergent.Siegel.factor_composition`; module `TauCeti/NumberTheory/Overconvergent/Siegel/Coefficients`, namespace `TauCeti.Overconvergent.Siegel`.

**Check.**

- Verify Jγδ(Z)=Jγ(Z)Jδ(Zγ), not the reversed product.
- Genus-two upper and lower elementary unipotent matrices do not commute, so a scalar-only test cannot establish the matrix order.
- With either block matrix the identity, the factor law reduces to the identity law.

**Sources.**

- [drw-v3](#source-drw-v3), Lemma 2.3.1, p. 15; equation (5), p. 20; Remark 3.1.15, p. 25. Derived by composing the source row-graph calculation. This supplies the specific Siegel factor to O1; it does not redefine general cocycles.

<a id="o8-coordinate-composition"></a>

### Composition on the Siegel graph chart

**Lemma** · `OverconvergentAutomorphicForms:O8/coordinate-composition`

Imported stable target from [OverconvergentAutomorphicForms--O8.json](../packets/OverconvergentAutomorphicForms--O8.json); the following is its effective assembly contract.

With γ,δ,Jγ and Zγ as above, assume det Jγ(Z) and det(E+ZγG) are units. Then Z(γδ)=(Zγ)δ: explicitly [(AE+BG)+Z(CE+DG)]⁻¹[(AF+BH)+Z(CF+DH)]=(E+ZγG)⁻¹(F+ZγH).

**Hypotheses.**

- R is a commutative ring; the matrix index set n is finite with decidable equality.
- All displayed blocks and Z are square n by n matrices. These algebraic statements include the empty index set; the geometric application has g≥1.
- Both consecutive denominator determinants are units.

**Construction or proof.**

1. factor-composition expresses the denominator of γδ as a product of units; Matrix.isUnit_iff_isUnit_det supplies its invertibility.
2. Apply graph-normalisation twice and associate [I,Z]γδ. The two resulting graph matrices have the same unit leading factor.
3. Cancel that factor by Matrix.nonsing_inv_mul and read the right block, giving the displayed identity.

**Prerequisites.** [OverconvergentAutomorphicForms:O8/graph-normalisation](#o8-graph-normalisation), [OverconvergentAutomorphicForms:O8/factor-composition](#o8-factor-composition), [mathlib:Matrix.isUnit_iff_isUnit_det](#baseline-interfaces), [mathlib:Matrix.nonsing_inv_mul](#baseline-interfaces), [mathlib:Matrix.fromBlocks_multiply](#baseline-interfaces).

**Planned interface.** `TauCeti.Overconvergent.Siegel.coordinate_composition`; module `TauCeti/NumberTheory/Overconvergent/Siegel/Coefficients`, namespace `TauCeti.Overconvergent.Siegel`.

**Check.**

- Three chart coordinates compose in the same right-action order as their block matrices.
- If a consecutive denominator is not a unit, no assertion of chart preservation is made.

**Sources.**

- [drw-v3](#source-drw-v3), Lemma 2.3.1, p. 15. The right-action law follows from the source graph normalisation and ordinary matrix associativity.

<a id="o8-antidiagonal-dual-factor"></a>

### Antidiagonal dual of the Siegel factor

**Lemma** · `OverconvergentAutomorphicForms:O8/antidiagonal-dual-factor`

Imported stable target from [OverconvergentAutomorphicForms--O8.json](../packets/OverconvergentAutomorphicForms--O8.json); the following is its effective assembly contract.

Let W be an involutive square matrix, W²=I, with W Zᵀ W=Z. Then W(A+ZC)ᵀW=W AᵀW+(W CᵀW)Z. For the reversal matrix W=breve I, this is Jγ(Z)‡=A‡+C‡Z, where M‡=W Mᵀ W.

**Hypotheses.**

- R is a commutative ring; the matrix index set n is finite with decidable equality.
- All displayed blocks and Z are square n by n matrices. These algebraic statements include the empty index set; the geometric application has g≥1.
- W²=I and W Zᵀ W=Z.

**Construction or proof.**

1. Apply Matrix.transpose_mul to ZC; it gives CᵀZᵀ.
2. Insert W² between Cᵀ and Zᵀ and use the antidiagonal symmetry of Z.
3. The resulting C‡Z order corrects the expressions used in the two intertwining computations of Proposition 3.3.10; source issue E-O8-10 records the counterexample.

**Prerequisites.** [mathlib:Matrix.transpose_mul](#baseline-interfaces).

**Planned interface.** `TauCeti.Overconvergent.Siegel.antidiagonal_dual_factor`; module `TauCeti/NumberTheory/Overconvergent/Siegel/Coefficients`, namespace `TauCeti.Overconvergent.Siegel`.

**Check.**

- For W=[0,1;1,0], Z=[0,1;0,0], C=[0,0;3,0], A=I, the left side is diag(1,4), while A‡+ZC‡=diag(4,1).
- For general q=pⁿ≠0 the same example is a strict-Iwahori, indeed principal-level, lower unipotent symplectic element.
- For g=1 the two orders coincide, so this test must use g≥2.

**Sources.**

- [drw-v3](#source-drw-v3), Proof of Proposition 3.3.10, constructions Ψ1 and Ψ2, pp. 35–36. Corrected finite identity underlying the displayed proof; the printed product order fails for noncommuting genus-two matrices.

<a id="o8-determinant-character-cocycle"></a>

### Determinant character of the Siegel factor

**Lemma** · `OverconvergentAutomorphicForms:O8/determinant-character-cocycle`

Imported stable target from [OverconvergentAutomorphicForms--O8.json](../packets/OverconvergentAutomorphicForms--O8.json); the following is its effective assembly contract.

Let R,S be commutative rings and χ:R×→S× a group homomorphism. For consecutive invertible denominator matrices j=Jγ(Z), k=Jδ(Zγ), and l=Jγδ(Z), let d=det:GL(n,R)→R× be the baseline determinant homomorphism. Then χ(d(l))⁻¹=χ(d(j))⁻¹χ(d(k))⁻¹. In particular, χ(u)=uᵐ gives d(l)^(−m)=d(j)^(−m)d(k)^(−m) for every integer m.

**Hypotheses.**

- R is a commutative ring; the matrix index set n is finite with decidable equality.
- All displayed blocks and Z are square n by n matrices. These algebraic statements include the empty index set; the geometric application has g≥1.
- S is commutative; j,k,l are matrix units with the three displayed underlying matrices.
- χ is a homomorphism, not an arbitrary function on units.

**Construction or proof.**

1. factor-composition identifies l=jk; equality of matrix units is detected by their underlying matrices.
2. Apply Matrix.GeneralLinearGroup.det and χ, then inversion in the commutative group S×.
3. Use mul_zpow for the integer-weight consequence. This establishes the scalar inverse factor used for coefficient functions, not a reversed matrix cocycle.

**Prerequisites.** [OverconvergentAutomorphicForms:O8/factor-composition](#o8-factor-composition), [mathlib:Matrix.GeneralLinearGroup.det](#baseline-interfaces), [mathlib:Matrix.det_mul](#baseline-interfaces), [mathlib:map_inv](#baseline-interfaces), [mathlib:mul_zpow](#baseline-interfaces).

**Planned interface.** `TauCeti.Overconvergent.Siegel.determinant_character_cocycle`; module `TauCeti/NumberTheory/Overconvergent/Siegel/Coefficients`, namespace `TauCeti.Overconvergent.Siegel`.

**Check.**

- Weight zero gives factor one.
- Weight one gives det(J)⁻¹ on coefficients; weight minus one gives det(J).
- On the empty matrix index set det=1.
- For g=1 this recovers (a+zc)^(−m).

**Sources.**

- [drw-v3](#source-drw-v3), Equation (5), p. 20; Definition 3.1.14(iii), p. 24. Specialization of the displayed representation factor to the one-dimensional determinant representation, derived algebraically.

<a id="o8-hodge-frame-transformation"></a>

### Transformation of the Hodge–Tate frame

**Lemma** · `OverconvergentAutomorphicForms:O8/hodge-frame-transformation`

Imported stable target from [OverconvergentAutomorphicForms--O8.json](../packets/OverconvergentAutomorphicForms--O8.json); the following is its effective assembly contract.

Use the S3 annihilator row-graph convention: W_std=col(−Z_std,I), Z_stdᵀ=Z_std, and π_HT*(O^{2g}/W_std)≅ω_{A∨}. Let s=(s₁,…,s_g) be the classes of e₁,…,e_g in this quotient, transported through the principal polarization to h*ω_A. Then γ*s=s(A+Z_std C) for every γ in the full K. In the DRW antidiagonal symplectic basis set P=diag(I,W), Z=Z_std W and γ_DRW=P⁻¹γ_stdP. The same quotient frame has Jγ(Z)=A_DRW+ZC_DRW=A_std+Z_std C_std. It trivializes the right Hodge-frame torsor. This is the twist-free quotient frame; the naturally linearized π_HT*W_std∨ is instead ω_A(−1).

**Hypotheses.**

- g≥1, p odd, N≥3 prime to p; work over C_p with a fixed compatible system of p-power roots of unity when identifying Hodge–Tate twists.
- K is the full inverse image of the diagonal torus of GSp(2g,F_p). Apply S1's general full-tower quotient with c(K)=Z_p^× (m=0), base changed from Q_p to C_p, retaining all Weil-pairing components. S1's named strict subgroup additionally has c≡1 mod p; a fixed pairing fibre has only K∩ker(c) as deck group. The present quotient uses the full K, not that fibre or the inadequate moduli data in E-O8-1.
- Y_w is the open Siegel infinite-level domain π_HT⁻¹(Fl×_w), X_w=Y_w/K, w>0 rational; S1/S3 supply the actual spaces, action, quotient torsor and period-map equivariance. Fl×_w consists of graph coordinates whose entries are within p^(−w) of Z_p.
- The open period domain is defined by the supplied S3 map. When calling it a proven canonical/anticanonical neighbourhood, use the T3 comparison with p>2g and its stated radii; the mere period-domain definition requires no canonical-subgroup theorem.
- W is the g×g reversal matrix, W²=I, and P=diag(I,W) converts S3's standard symplectic form to DRW's antidiagonal form. Thus (A,B,C,D)_DRW=(A,BW,WC,WDW)_std and Z=Z_std W. Use the quotient/annihilator period chart throughout; an identification with a Lie-subspace chart requires the stated duality, not just relabelling coordinates.

**Construction or proof.**

1. Import the Hodge–Tate quotient O^{2g}/W_std≅ω_{A∨} and the principal-polarization isomorphism ω_{A∨}≅ω_A from S3. Neither uses a fixed trivialization to erase a Tate twist.
2. Modulo col(−Z_std,I), a vector (u,v) has class (u+Z_std v,0). Therefore HT_A(Ψγe_j)=Σ_i s_i(A+Z_std C)_{ij}. This directly proves the frame law for the full diagonal-reduction K, since A and the principal polarization are unchanged by its level action.
3. Conjugate by P=diag(I,W). The first g quotient basis vectors are unchanged, while Z becomes Z_std W and C becomes WC; hence ZC=Z_std C_std. This gives the DRW-shaped factor without changing its order.
4. If one instead uses W_std∨ with its natural linearization, its frame transforms by c(γ)⁻¹Jγ. The variable Weil-pairing generator ζ_Ψ transforms by c(γ); tensoring with ζ_Ψ restores Jγ. A fixed choice of roots of unity does not perform that equivariant cancellation.

**Prerequisites.** [OverconvergentAutomorphicForms:O8/graph-normalisation](#o8-graph-normalisation), [OverconvergentAutomorphicForms:O8/coordinate-composition](#o8-coordinate-composition), [PerfectoidShimuraVarieties:S1/siegel-open-tower-and-level-quotients](../packets/PerfectoidShimuraVarieties.json), [PerfectoidShimuraVarieties:S3/siegel-graph-chart-and-frame](../packets/PerfectoidShimuraVarieties.json), [PerfectoidShimuraVarieties:S3/siegel-tautological-pullback](../packets/PerfectoidShimuraVarieties.json), [HodgeTateAndCanonicalSubgroups:T3](../packets/HodgeTateAndCanonicalSubgroups.json).

**Planned interface.** `TauCeti.Overconvergent.Siegel.hodge_frame_transformation`; module `TauCeti/NumberTheory/Overconvergent/Siegel/Coefficients`, namespace `TauCeti.Overconvergent.Siegel`.

**Check.**

- For γ=1 the frame is fixed.
- The coefficient transformation is inverse to the frame transformation.
- No GSp(Q_p) action at fixed toroidal cone decomposition or Galois-equivariance after suppressing Tate twists is inferred.
- At Z_std=0 the classes of e₁,…,e_g form a quotient basis; their restrictions to W_std itself vanish. This detects the discarded first-coordinate dual-Lagrangian construction.
- For nontrivial c(γ), the natural dual-Lagrangian frame has the extra c(γ)⁻¹, whereas the quotient Hodge frame has Jγ. The constant reversal-basis change preserves Jγ exactly.

**Sources.**

- [drw-v3](#source-drw-v3), Corollary 2.4.2, p. 17; Proposition 2.5.2, pp. 18–19; equation (5), p. 20. The source motivates the graph and frame factors. The effective statement uses the corrected quotient Hodge frame of S3/siegel-graph-chart-and-frame with the explicit standard-to-antidiagonal basis conversion; it does not import an untwisted dual-Lagrangian linearization.

<a id="o8-determinant-frame-transformation"></a>

### Transformation of the determinant Hodge frame

**Lemma** · `OverconvergentAutomorphicForms:O8/determinant-frame-transformation`

Imported stable target from [OverconvergentAutomorphicForms--O8.json](../packets/OverconvergentAutomorphicForms--O8.json); the following is its effective assembly contract.

In the preceding setting put η=s₁∧…∧s_g, a nowhere-vanishing section of h*det(ω) on Y_w. For γ∈K, γ*η=det(Jγ(Z))η.

**Hypotheses.**

- g≥1, p odd, N≥3 prime to p; work over C_p with a fixed compatible system of p-power roots of unity when identifying Hodge–Tate twists.
- K is the full inverse image of the diagonal torus of GSp(2g,F_p). Apply S1's general full-tower quotient with c(K)=Z_p^× (m=0), base changed from Q_p to C_p, retaining all Weil-pairing components. S1's named strict subgroup additionally has c≡1 mod p; a fixed pairing fibre has only K∩ker(c) as deck group. The present quotient uses the full K, not that fibre or the inadequate moduli data in E-O8-1.
- Y_w is the open Siegel infinite-level domain π_HT⁻¹(Fl×_w), X_w=Y_w/K, w>0 rational; S1/S3 supply the actual spaces, action, quotient torsor and period-map equivariance. Fl×_w consists of graph coordinates whose entries are within p^(−w) of Z_p.
- Use the genuine open period domain from S3; an identification with canonical/anticanonical Hasse domains additionally requires the quantitative T3 comparison, including p>2g where DRW §3.6 uses it. Boundary statements use the separate toroidal nodes below.

**Construction or proof.**

1. Apply the top exterior power to hodge-frame-transformation.
2. In a local determinant-line trivialization, Module.Basis.det_apply identifies the coefficient with det J; AlternatingMap.eq_smul_basis_det identifies every alternating coordinate evaluation with that determinant.
3. The determinant-line constructions and gluing are imported from B4; invertibility of J shows η remains a frame.

**Prerequisites.** [OverconvergentAutomorphicForms:O8/hodge-frame-transformation](#o8-hodge-frame-transformation), [mathlib:Module.Basis.det_apply](#baseline-interfaces), [mathlib:AlternatingMap.eq_smul_basis_det](#baseline-interfaces), [mathlib:Matrix.GeneralLinearGroup.det](#baseline-interfaces), `AutomorphicBundles:B4/siegel-coefficient`, `AutomorphicBundles:B0/sections-equivariant`.

**Planned interface.** `TauCeti.Overconvergent.Siegel.determinant_frame_transformation`; module `TauCeti/NumberTheory/Overconvergent/Siegel/Coefficients`, namespace `TauCeti.Overconvergent.Siegel`.

**Check.**

- For diagonal J with entries u₁,…,u_g, the factor is the product of the u_i.
- For g=1, η=s₁.
- The frame transforms by det J, while invariant coefficient functions transform by its inverse.

**Sources.**

- [drw-v3](#source-drw-v3), Corollary 2.4.2, p. 17; equation (5), p. 20. Taking determinant is a stated consequence here, not a separately numbered source theorem.

<a id="o8-scalar-coefficient-identification"></a>

### Scalar Siegel coefficients on the anticanonical domain

**Theorem** · `OverconvergentAutomorphicForms:O8/scalar-coefficient-identification`

**Planet:** Siegel automorphy factor.

Imported stable target from [OverconvergentAutomorphicForms--O8.json](../packets/OverconvergentAutomorphicForms--O8.json); the following is its effective assembly contract.

Let E be a complete coefficient field containing C_p, or a reduced affinoid coefficient algebra over C_p, and let χ be an analytic character of the unit neighbourhood containing det Jγ(Z). Suppose O0 supplies its extension and analytic scalar action on that neighbourhood, uniformly at the chosen radius. The O1 coefficient sheaf attached to this character and the Siegel Hodge-frame reduction has, on every open V⊂X_w, sections exactly the analytic coefficient functions f on h⁻¹(V) satisfying γ*f=χ(det Jγ(Z))⁻¹f for every γ∈K. The equality is compatible with restrictions in V.

**Hypotheses.**

- g≥1, p odd, N≥3 prime to p; work over C_p with a fixed compatible system of p-power roots of unity when identifying Hodge–Tate twists.
- K is the full inverse image of the diagonal torus of GSp(2g,F_p). Apply S1's general full-tower quotient with c(K)=Z_p^× (m=0), base changed from Q_p to C_p, retaining all Weil-pairing components. S1's named strict subgroup additionally has c≡1 mod p; a fixed pairing fibre has only K∩ker(c) as deck group. The present quotient uses the full K, not that fibre or the inadequate moduli data in E-O8-1.
- Y_w is the open Siegel infinite-level domain π_HT⁻¹(Fl×_w), X_w=Y_w/K, w>0 rational; S1/S3 supply the actual spaces, action, quotient torsor and period-map equivariance. Fl×_w consists of graph coordinates whose entries are within p^(−w) of Z_p.
- Use the genuine open period domain from S3; an identification with canonical/anticanonical Hasse domains additionally requires the quantitative T3 comparison, including p>2g where DRW §3.6 uses it. Boundary statements use the separate toroidal nodes below.
- An actual O0 analytic character and its extension to the determinant neighbourhood are supplied.
- For a character initially on Z_p× use an O0 r-analytic extension and w>r+1; no assertion for a merely continuous character without that extension.
- O1 supplies the sheaf-category equalizer on this quotient and the relevant completed coefficient functions.

**Construction or proof.**

1. hodge-frame-transformation identifies the actual transition matrix. Apply determinant-character-cocycle to obtain the scalar descent law.
2. Invoke the O1 equalizer construction for that law. Its equalizer condition, under the actual frame trivialization, is exactly the displayed equation.
3. O1 sheaf and pullback laws identify restrictions; do not replace the analytic section space by all set-theoretic functions.

**Prerequisites.** [OverconvergentAutomorphicForms:O8/hodge-frame-transformation](#o8-hodge-frame-transformation), [OverconvergentAutomorphicForms:O8/determinant-character-cocycle](#o8-determinant-character-cocycle), [OverconvergentAutomorphicForms:O0/finite-analytic-coefficients](#o0-finite-analytic-coefficients), [OverconvergentAutomorphicForms:O1/equivariant-coefficient-sheaf](#o1-equivariant-coefficient-sheaf), [OverconvergentAutomorphicForms:O0/siegel-analytic-coefficients](#o0-siegel-analytic-coefficients), [OverconvergentAutomorphicForms:O0/analytic-induction-conventions](#o0-analytic-induction-conventions), [OverconvergentAutomorphicForms:O8/siegel-factor-neighbourhood](#o8-siegel-factor-neighbourhood).

**Planned interface.** `TauCeti.Overconvergent.Siegel.scalar_coefficient_identification`; module `TauCeti/NumberTheory/Overconvergent/Siegel/Coefficients`, namespace `TauCeti.Overconvergent.Siegel`.

**Check.**

- χ=1 gives the structure sheaf after applying the supplied quotient descent theorem.
- The defining relation contains the inverse scalar factor.
- A radius outside the supplied extension domain is rejected.
- This statement does not assert coherence of an infinite-dimensional analytic induced module.

**Sources.**

- [drw-v3](#source-drw-v3), Definition 3.1.14(iii), p. 24; Remark 3.1.15, p. 25. The source equivariance condition is specialized to the finite-rank determinant representation supplied by O0. It is not an identification with the full analytic induced coefficient module.

<a id="o8-determinant-hodge-specialisation"></a>

### Determinant Hodge bundle at integral weights

**Theorem** · `OverconvergentAutomorphicForms:O8/determinant-hodge-specialisation`

**Planet:** Determinant Hodge bundle.

Imported stable target from [OverconvergentAutomorphicForms--O8.json](../packets/OverconvergentAutomorphicForms--O8.json); the following is its effective assembly contract.

Under the same actual torsor and descent hypotheses, take the algebraic character χ_m(u)=uᵐ, m∈Z, using its O0 specialization. Then the O1 scalar coefficient sheaf in scalar-coefficient-identification is canonically isomorphic to (det ω)^⊗m restricted to X_w. For negative m this denotes the corresponding tensor power of the dual line. On Y_w the map is f↦fη^⊗m; for m<0 use the dual frame. It is an isomorphism of sheaves, not a classicality theorem for global forms.

**Hypotheses.**

- g≥1, p odd, N≥3 prime to p; work over C_p with a fixed compatible system of p-power roots of unity when identifying Hodge–Tate twists.
- K is the full inverse image of the diagonal torus of GSp(2g,F_p). Apply S1's general full-tower quotient with c(K)=Z_p^× (m=0), base changed from Q_p to C_p, retaining all Weil-pairing components. S1's named strict subgroup additionally has c≡1 mod p; a fixed pairing fibre has only K∩ker(c) as deck group. The present quotient uses the full K, not that fibre or the inadequate moduli data in E-O8-1.
- Y_w is the open Siegel infinite-level domain π_HT⁻¹(Fl×_w), X_w=Y_w/K, w>0 rational; S1/S3 supply the actual spaces, action, quotient torsor and period-map equivariance. Fl×_w consists of graph coordinates whose entries are within p^(−w) of Z_p.
- Use the genuine open period domain from S3; an identification with canonical/anticanonical Hasse domains additionally requires the quantitative T3 comparison, including p>2g where DRW §3.6 uses it. Boundary statements use the separate toroidal nodes below.
- The B4 determinant line, its duals and tensor powers, and O1 effective descent for this finite-rank coefficient object are supplied.

**Construction or proof.**

1. determinant-frame-transformation gives γ*(η^⊗m)=det(Jγ)^mη^⊗m, using duals for negative weights.
2. Multiply by the coefficient law det(Jγ)^(−m); the product is invariant and descends through O1.
3. Conversely pull back a determinant-line section and express it uniquely in the frame η^⊗m. Invariance gives exactly the scalar coefficient law.
4. The two maps are inverse on the torsor. Faithfulness in the imported descent equivalence gives the isomorphism downstairs.

**Prerequisites.** [OverconvergentAutomorphicForms:O8/scalar-coefficient-identification](#o8-scalar-coefficient-identification), [OverconvergentAutomorphicForms:O8/determinant-frame-transformation](#o8-determinant-frame-transformation), [OverconvergentAutomorphicForms:O0/finite-analytic-coefficients](#o0-finite-analytic-coefficients), [OverconvergentAutomorphicForms:O0/coefficient-tensor-dual](#o0-coefficient-tensor-dual), [OverconvergentAutomorphicForms:O1/equivariant-coefficient-sheaf](#o1-equivariant-coefficient-sheaf), [OverconvergentAutomorphicForms:O1/coefficient-descent-functoriality](#o1-coefficient-descent-functoriality), [mathlib:mul_zpow](#baseline-interfaces), `AutomorphicBundles:B4/siegel-coefficient`, `AutomorphicBundles:B0/sections-equivariant`.

**Planned interface.** `TauCeti.Overconvergent.Siegel.determinant_hodge_specialisation`; module `TauCeti/NumberTheory/Overconvergent/Siegel/Coefficients`, namespace `TauCeti.Overconvergent.Siegel`.

**Check.**

- m=0 gives O_Xw.
- m=1 gives det ω, not its dual.
- m=−1 gives (det ω)∨.
- In genus one this gives powers of the Hodge line.
- In genus two m=1 has local factor det(A+ZC), not one chosen matrix entry.

**Sources.**

- [drw-v3](#source-drw-v3), Equation (5), p. 20; §3.4, pp. 37–38. Independent determinant-line descent consequence of the verified frame formula. The integer extension uses the imported dual-line functor; no reliance on the flawed induced-module comparison in Proposition 3.3.10.

<a id="o8-algebraic-levi-specialisation"></a>

### Algebraic Levi coefficients recover the automorphic bundle

**Theorem** · `OverconvergentAutomorphicForms:O8/algebraic-levi-specialisation`

**Planet:** Algebraic automorphic bundles.

Imported stable target from [OverconvergentAutomorphicForms--O8.json](../packets/OverconvergentAutomorphicForms--O8.json); the following is its effective assembly contract.

Let ρ:GL_g→GL(V) be a finite-dimensional algebraic representation over the coefficient field, restricted analytically to the actual O0 frame reduction. Let Q=Isom(O^g,ω) be the B4 right Hodge-frame torsor and Eρ=Q×^{GL_g}V with relation (qg,v)~(q,ρ(g)v). Then the O1 coefficient sheaf for this finite-rank representation and the Siegel factor Jγ(Z) is canonically isomorphic to Eρ|X_w. Its pulled-back coefficients satisfy γ*f=ρ(Jγ(Z))⁻¹f. For a Levi with a separate similitude character this statement uses the trivial character on that extra factor; extra twists must be included explicitly.

**Hypotheses.**

- g≥1, p odd, N≥3 prime to p; work over C_p with a fixed compatible system of p-power roots of unity when identifying Hodge–Tate twists.
- K is the full inverse image of the diagonal torus of GSp(2g,F_p). Apply S1's general full-tower quotient with c(K)=Z_p^× (m=0), base changed from Q_p to C_p, retaining all Weil-pairing components. S1's named strict subgroup additionally has c≡1 mod p; a fixed pairing fibre has only K∩ker(c) as deck group. The present quotient uses the full K, not that fibre or the inadequate moduli data in E-O8-1.
- Y_w is the open Siegel infinite-level domain π_HT⁻¹(Fl×_w), X_w=Y_w/K, w>0 rational; S1/S3 supply the actual spaces, action, quotient torsor and period-map equivariance. Fl×_w consists of graph coordinates whose entries are within p^(−w) of Z_p.
- Use the genuine open period domain from S3; an identification with canonical/anticanonical Hasse domains additionally requires the quantitative T3 comparison, including p>2g where DRW §3.6 uses it. Boundary statements use the separate toroidal nodes below.
- V is finite-dimensional and ρ algebraic; O0 supplies its analytic restriction.
- B4 supplies Q and its associated bundle with the stated right-torsor convention, and O1 supplies effective descent.

**Construction or proof.**

1. Pull back Q and trivialize it by the actual frame s from hodge-frame-transformation.
2. The associated-bundle relation converts sγ=sJγ into the coefficient change ρ(Jγ)⁻¹. factor-composition proves that these changes compose correctly; O1 supplies the generic representation-valued descent theorem.
3. Apply the O1 equivalence to the equivariant trivial bundle and the pullback of Eρ, whose transition maps agree. This proves the isomorphism.
4. For comparison with the induced highest-weight model, keep the corrected antidiagonal_dual_factor available, but do not infer equality with its infinite-dimensional analytic enlargement.

**Prerequisites.** [OverconvergentAutomorphicForms:O8/hodge-frame-transformation](#o8-hodge-frame-transformation), [OverconvergentAutomorphicForms:O8/factor-composition](#o8-factor-composition), [OverconvergentAutomorphicForms:O8/antidiagonal-dual-factor](#o8-antidiagonal-dual-factor), [OverconvergentAutomorphicForms:O0/finite-analytic-coefficients](#o0-finite-analytic-coefficients), [OverconvergentAutomorphicForms:O1/equivariant-coefficient-sheaf](#o1-equivariant-coefficient-sheaf), [OverconvergentAutomorphicForms:O1/coefficient-descent-functoriality](#o1-coefficient-descent-functoriality), `AutomorphicBundles:B4/siegel-coefficient`, `AutomorphicBundles:B0/sections-equivariant`, `AutomorphicBundles:B2/levi-highest-weight-convention`.

**Planned interface.** `TauCeti.Overconvergent.Siegel.algebraic_levi_specialisation`; module `TauCeti/NumberTheory/Overconvergent/Siegel/Coefficients`, namespace `TauCeti.Overconvergent.Siegel`.

**Check.**

- The standard representation recovers ω with its rank g.
- The determinant representation agrees with determinant-hodge-specialisation at m=1.
- The dual standard representation recovers ω∨.
- A Schur representation recovers the corresponding B4 Schur-functor bundle.
- For g≥2, specializing an analytic induced module at an algebraic weight is not asserted to collapse to this finite-rank representation.

**Sources.**

- [drw-v3](#source-drw-v3), Corollary 2.4.2, p. 17; §3.4 and Proposition 3.4.3, pp. 37–38. The finite-representation recovery is proved through the frame torsor with an explicit associated-bundle convention. The source motivates the comparison; its printed highest-weight torsor description and intertwiner require the recorded corrections.

<a id="o8-determinant-line-map"></a>

### Determinant eigenline in Siegel coefficients

**Construction** · `OverconvergentAutomorphicForms:O8/determinant-line-map`

Imported stable target from [OverconvergentAutomorphicForms--O8.json](../packets/OverconvergentAutomorphicForms--O8.json); the following is its effective assembly contract.

For a finite index set n, commutative rings R,S and a homomorphism χ:R×→S×, construct the S-linear map Lχ:S→(GL(n,R)→S), Lχ(a)(g)=a·χ(det g). Its image is the rank-one free determinant-character line, canonically isomorphic to S. This is the specific Siegel scalar eigenline embedding, not a new definition of induction or analytic functions. For an O0 character defined only on the determinant neighbourhood of an analytic Iwahori, the same formula is constructed directly on that group. Its multiplicativity and analyticity use the local O0 extension; no extension to every unit of C_p is asserted.

**Hypotheses.**

- n is finite with decidable equality; R,S are commutative rings; χ is a homomorphism into units.
- No analyticity or geometric assertion is made about the unrestricted function module.

**Construction or proof.**

1. Use the pointwise S-module on functions and the existing determinant homomorphism to construct the bundled LinearMap.
2. Evaluate at the identity to obtain a left inverse, hence injectivity; use multiplicativity of determinant for both translation laws.
3. For analytic coefficients, repeat this formula on the actual Iwahori group using the O0 local character extension on its determinant image; use determinant multiplicativity and evaluation at the identity there. A globally defined χ is required only for the unrestricted finite prototype. No identification with the whole induced module follows.

**Prerequisites.** [mathlib:LinearMap](#baseline-interfaces), [mathlib:Matrix.GeneralLinearGroup.det](#baseline-interfaces), [mathlib:Matrix.GeneralLinearGroup.mkOfDetNeZero](#baseline-interfaces), [mathlib:Matrix.det_mul](#baseline-interfaces), [mathlib:Matrix.det_transpose](#baseline-interfaces).

**Planned interface.** `TauCeti.Overconvergent.Siegel.determinantLineMap`; module `TauCeti/NumberTheory/Overconvergent/Siegel/Coefficients`, namespace `TauCeti.Overconvergent.Siegel`.

**Uses.**

- O8 scalar determinant weights and DRW Definition 3.1.14: Identifies the finite determinant line inside the induced coefficient space and derives its inverse descent factor.
- O8 determinant Hodge specialization and DRW Proposition 3.4.3: Tests the distinction between the rank-one classical subobject and the full analytic sheaf.

**API.**

- `TauCeti.Overconvergent.Siegel.determinantLineMap_apply` (simp): Lχ(a)(g)=a·χ(det g).
- `TauCeti.Overconvergent.Siegel.determinantLineMap_at_one` (projection): Lχ(a)(1)=a.
- `TauCeti.Overconvergent.Siegel.determinantLineMap_injective` (characterisation): Lχ is injective; its image is canonically a copy of S.
- `TauCeti.Overconvergent.Siegel.determinantLineMap_left_translate` (relation): Lχ(a)(hg)=χ(det h)·Lχ(a)(g).
- `TauCeti.Overconvergent.Siegel.determinantLineMap_right_translate` (relation): Lχ(a)(gb)=χ(det b)·Lχ(a)(g); this includes the full upper-unipotent invariance used in Borel induction.
- `TauCeti.Overconvergent.Siegel.determinantLineMap_trivial` (compatibility): For the trivial character, Lχ(a) is the constant function with value a.

**Definition tests.**

- `TauCeti.Overconvergent.Siegel.determinantLineMap_test_trivial` (degenerate): For χ=1, every a and g satisfy Lχ(a)(g)=a.
- `TauCeti.Overconvergent.Siegel.determinantLineMap_test_diagonal` (computation): For R=S=Q, χ=id, a=1 and the genuine GL₂ element diag(2,3), Lχ(1)(g)=6.
- `TauCeti.Overconvergent.Siegel.determinantLineMap_test_unipotent` (computation): For R=S=Q, χ=id and g=[1,7;0,1], Lχ(1)(g)=1.
- `TauCeti.Overconvergent.Siegel.determinantLineMap_test_evaluation` (characterisation): For any χ and a,b, equality Lχ(a)=Lχ(b) implies a=b, by evaluation at 1.

**Check.**

- Evaluation at the identity recovers a, including over a ring with zero divisors.
- For χ=id over Q and g=diag(2,3), Lχ(1)(g)=6; a constant-function embedding gives the wrong answer.
- Every upper-unipotent genus-two g has value 1 for L_id(1).

**Sources.**

- [drw-v3](#source-drw-v3), Definitions 3.1.10 and 3.1.14, pp.23–24; Proposition 3.4.3, p.38. The determinant function gives a concrete finite-character submodule of the displayed induced coefficient module. The unrestricted algebraic map is its directly derived reusable interface.

<a id="o8-siegel-analytic-instance"></a>

### Analytic Siegel coefficient sheaves

**Theorem** · `OverconvergentAutomorphicForms:O8/siegel-analytic-instance`

**Planet:** Analytic Siegel coefficient sheaves.

Imported stable target from [OverconvergentAutomorphicForms--O8.json](../packets/OverconvergentAutomorphicForms--O8.json); the following is its effective assembly contract.

Let U=Spa(A,A+) be a bounded smooth weight family on the diagonal torus of GL_g with an O0 uniform r-analytic character κ, trivial on the upper-unipotent subgroup. For rational w>1+r, use the O0 coefficient module Cκ^(w-an)(Iw_GLg,B) of analytic functions satisfying f(ℓb)=κ(b)f(ℓ), with representation ρκ(h)f(ℓ)=f(hᵀℓ). On the supplied Siegel domain X_w, O1 applied to Jγ=Aγ+ZCγ yields the sheaf whose sections on V are analytic coefficients F on Y_w×_Xw V satisfying γ*F=ρκ(Jγ)⁻¹F. Its restriction and bounded family maps are the O1 maps. For κ=χ∘det the determinantLineMap formula, evaluated directly on the actual Iwahori with the O0 local extension of χ, identifies a rank-one subobject with scalar-coefficient-identification, not the entire induced sheaf. Here Cκ^(w-an) is precisely O0/siegel-analytic-coefficients on G_(w+1); J lies in H_(w+1) by O8/siegel-factor-neighbourhood. The integral module is its Gauss unit ball.

**Hypotheses.**

- g≥1, p odd, N≥3 prime to p; work over C_p with a fixed compatible system of p-power roots of unity when identifying Hodge–Tate twists.
- K is the full inverse image of the diagonal torus of GSp(2g,F_p). Apply S1's general full-tower quotient with c(K)=Z_p^× (m=0), base changed from Q_p to C_p, retaining all Weil-pairing components. S1's named strict subgroup additionally has c≡1 mod p; a fixed pairing fibre has only K∩ker(c) as deck group. The present quotient uses the full K, not that fibre or the inadequate moduli data in E-O8-1.
- Y_w is the open Siegel infinite-level domain π_HT⁻¹(Fl×_w), X_w=Y_w/K, w>0 rational; S1/S3 supply the actual spaces, action, quotient torsor and period-map equivariance. Fl×_w consists of graph coordinates whose entries are within p^(−w) of Z_p.
- w>1+r; the family has a uniform character extension, analytic action of all occurring Jγ, and completed coefficients supplied by O0.
- The period-domain application uses p odd. A canonical-domain assertion uses the T3 quantitative comparison with p>2g. Integral assertions require the analytic Gauss lattice, not pointwise integral values.

**Construction or proof.**

1. Import the analytic Iwahori module, transpose-left representation and bounded base-change interface from O0.
2. Use hodge-frame-transformation and factor-composition to supply the actual right-action factor to O1; the inverse representation order is ρ(Jδ(Zγ))⁻¹ρ(Jγ(Z))⁻¹.
3. Apply the O1 sheaf/restriction/family construction; evaluate the determinantLineMap formula on the actual analytic group using the local O0 character to obtain the scalar subobject. A character initially on Z_p× is not assumed to extend to all C_p×.

**Prerequisites.** [OverconvergentAutomorphicForms:O8/hodge-frame-transformation](#o8-hodge-frame-transformation), [OverconvergentAutomorphicForms:O8/factor-composition](#o8-factor-composition), [OverconvergentAutomorphicForms:O8/determinant-line-map](#o8-determinant-line-map), [OverconvergentAutomorphicForms:O8/scalar-coefficient-identification](#o8-scalar-coefficient-identification), [OverconvergentAutomorphicForms:O0/analytic-induced-coefficients](#o0-analytic-induced-coefficients), [OverconvergentAutomorphicForms:O1/equivariant-coefficient-sheaf](#o1-equivariant-coefficient-sheaf), [OverconvergentAutomorphicForms:O0/siegel-analytic-coefficients](#o0-siegel-analytic-coefficients), [OverconvergentAutomorphicForms:O0/analytic-induction-conventions](#o0-analytic-induction-conventions), [OverconvergentAutomorphicForms:O8/siegel-factor-neighbourhood](#o8-siegel-factor-neighbourhood).

**Planned interface.** `TauCeti.Overconvergent.Siegel.siegel_analytic_instance`; module `TauCeti/NumberTheory/Overconvergent/Siegel/Coefficients`, namespace `TauCeti.Overconvergent.Siegel`.

**Check.**

- The identity group element acts identically and two noncommuting genus-two elements satisfy the correct shifted cocycle.
- At κ=1 and g≥2, analytic functions in the lower-unipotent coordinate survive; the entire fibre is not the one-dimensional constant line.
- At g=1 the unipotent coordinate set is empty and the determinant induced module is a character line.
- Restriction to a smaller supplied radius domain and bounded weight specialization agree with O1, under its analytic hypotheses.

**Sources.**

- [drw-v3](#source-drw-v3), Definition 3.1.10, Remark 3.1.13 and Definition 3.1.14, pp.23–25. The displayed induced-module sheaf is instantiated through O0/O1; the inverse factor and genus are retained.

<a id="o8-algebraic-induced-injection"></a>

### Algebraic coefficients inside analytic Siegel coefficients

**Theorem** · `OverconvergentAutomorphicForms:O8/algebraic-induced-injection`

Imported stable target from [OverconvergentAutomorphicForms--O8.json](../packets/OverconvergentAutomorphicForms--O8.json); the following is its effective assembly contract.

For a dominant polynomial weight k=(k₁≥⋯≥k_g≥0), take the algebraic Borel-equivariant realization P_k of regular functions GL_g→A¹ with f(ℓb)=k(b)f(ℓ), using the transpose-left representation ρ_k of DRW Definition 3.4.2. On the same X_w with w>1+r_k, restriction of regular functions to the analytic Iwahori group induces a monomorphism E_{ρ_k}|X_w→ω_k,w, functorial in open restriction. E_{ρ_k} is the B4 bundle after the B2 highest-weight/dual conversion has identified this specific realization. This is an injection; no equality with the entire analytic induced module is asserted for g≥2. The scalar polynomial weight k=(m,…,m), m≥0, gives the determinant Hodge line subobject. Negative determinant weights are handled by finite-line dual descent, independently of this polynomial-weight source theorem.

**Hypotheses.**

- g≥1, p odd, N≥3 prime to p; work over C_p with a fixed compatible system of p-power roots of unity when identifying Hodge–Tate twists.
- K is the full inverse image of the diagonal torus of GSp(2g,F_p). Apply S1's general full-tower quotient with c(K)=Z_p^× (m=0), base changed from Q_p to C_p, retaining all Weil-pairing components. S1's named strict subgroup additionally has c≡1 mod p; a fixed pairing fibre has only K∩ker(c) as deck group. The present quotient uses the full K, not that fibre or the inadequate moduli data in E-O8-1.
- Y_w is the open Siegel infinite-level domain π_HT⁻¹(Fl×_w), X_w=Y_w/K, w>0 rational; S1/S3 supply the actual spaces, action, quotient torsor and period-map equivariance. Fl×_w consists of graph coordinates whose entries are within p^(−w) of Z_p.
- The O0 restriction map from the algebraic induced realization to analytic induction is an equivariant injection; it includes full right-Borel equivariance, not merely torus eigenvectors.
- The B2 weight convention identifies ρ_k with the required B4 coefficient; no unproved equality of a representation and its dual is assumed.
- Use O0/analytic-induction-conventions with λ_BP=w0,M(k⁻¹), and the transpose-inverse automorphism, on exactly the same matrix-entry domain.

**Construction or proof.**

1. Use the genuine regular-function/Borel-equivariant algebraic realization from O0 and B4/B2, together with its analytic restriction monomorphism.
2. Apply algebraic-levi-specialisation to its finite fibre representation; compare with siegel-analytic-instance under the same Jγ.
3. Descend the equivariant injection by O1. The finite associated-bundle route bypasses the incorrect frame-factor order in the printed Proposition 3.3.10.

**Prerequisites.** [OverconvergentAutomorphicForms:O8/algebraic-levi-specialisation](#o8-algebraic-levi-specialisation), [OverconvergentAutomorphicForms:O8/siegel-analytic-instance](#o8-siegel-analytic-instance), `AutomorphicBundles:B2/levi-highest-weight-convention`, `AutomorphicBundles:B4/siegel-coefficient`, [OverconvergentAutomorphicForms:O0/algebraic-induced-comparison](#o0-algebraic-induced-comparison), [OverconvergentAutomorphicForms:O1/equivariant-coefficient-sheaf](#o1-equivariant-coefficient-sheaf), [OverconvergentAutomorphicForms:O1/coefficient-descent-functoriality](#o1-coefficient-descent-functoriality), [OverconvergentAutomorphicForms:O0/siegel-analytic-coefficients](#o0-siegel-analytic-coefficients), [OverconvergentAutomorphicForms:O0/analytic-induction-conventions](#o0-analytic-induction-conventions), [OverconvergentAutomorphicForms:O8/siegel-factor-neighbourhood](#o8-siegel-factor-neighbourhood).

**Planned interface.** `TauCeti.Overconvergent.Siegel.algebraic_induced_injection`; module `TauCeti/NumberTheory/Overconvergent/Siegel/Coefficients`, namespace `TauCeti.Overconvergent.Siegel`.

**Check.**

- For g=1 the map identifies the character fibre, and for constant dominant weights its finite source is det(ω)^m.
- For g=2, k=0, nonconstant analytic functions of the lower-unipotent coordinate show why surjectivity must not be claimed.
- The regular function x11*x22/det(x) is torus invariant but not right-upper-unipotent invariant; it is excluded from P_0.

**Sources.**

- [drw-v3](#source-drw-v3), Definition 3.4.2 and Proposition 3.4.3, p.38. The finite realization and its analytic inclusion are retained; the classical frame sheaf is corrected to full Borel equivariance.

<a id="o8-atkin-lehner-chart"></a>

### Atkin–Lehner change of Siegel graph chart

**Lemma** · `OverconvergentAutomorphicForms:O8/atkin-lehner-chart`

Imported stable target from [OverconvergentAutomorphicForms--O8.json](../packets/OverconvergentAutomorphicForms--O8.json); the following is its effective assembly contract.

For a finite index set n and commutative ring R, let q∈R. Then [I,Z][0,I;−qI,0]=[−qZ,I]. Thus over a p-adic coefficient field the Atkin–Lehner matrix with q=p changes the anticanonical graph coordinate Z to the canonical-chart coordinate Z′=−pZ. The graph identity alone says nothing about canonical subgroups or domain quotients.

**Hypotheses.**

- n finite with decidable equality; R commutative; q any element for the first identity and q a unit for the inverse formula.

**Construction or proof.**

1. Apply Matrix.fromCols_mul_fromBlocks and simplify the scalar block products.
2. Verify both block inverse products with Matrix.fromBlocks_multiply; specialize q to p in the coefficient field.
3. Import the actual quotient/domain map from T3/S3 when using this identity to transport sheaves.

**Prerequisites.** [mathlib:Matrix.fromCols_mul_fromBlocks](#baseline-interfaces), [mathlib:Matrix.fromBlocks_multiply](#baseline-interfaces).

**Planned interface.** `TauCeti.Overconvergent.Siegel.atkin_lehner_chart`; module `TauCeti/NumberTheory/Overconvergent/Siegel/Coefficients`, namespace `TauCeti.Overconvergent.Siegel`.

**Check.**

- At genus one [1,z] maps to [−qz,1]; the sign and factor q are both visible.
- The formula holds at Z=0, including q=0; invertibility is asserted only for units q.

**Sources.**

- [drw-v3](#source-drw-v3), Remark 3.6.2, Atkin–Lehner display, p.43; canonical-chart coordinates in §3.6, p.42. The displayed row-graph identity gives Z′=−pZ in the canonical chart. The finite identity is separate from canonical-subgroup geometry; the missing prime in the p.42 domain formula is recorded as E-O8-15.

<a id="o8-toroidal-coefficient-instance"></a>

### Coefficients on the toroidal tower diamond

**Theorem** · `OverconvergentAutomorphicForms:O8/toroidal-coefficient-instance`

**Planet:** Toroidal diamond coefficients.

Imported stable target from [OverconvergentAutomorphicForms--O8.json](../packets/OverconvergentAutomorphicForms--O8.json); the following is its effective assembly contract.

For the genuine toroidal tower diamond D and period map π_HT^tor:D→FL supplied by S6, pull back the canonical M^c_μ-torsor on FL. Given a representation V in the O0/O1 coefficient category with an actual analytic action of M^c_μ (or a supplied reduction), form its associated coefficient object on D using O1. It is functorial in equivariant representation maps and agrees with the open-domain construction on the open Shimura subdiamond. Finite-level descent is asserted only for the effective descent data exported by O1; infinite Banach descent is not deduced from a pro-étale torsor alone. The construction uses diamonds and does not assert representability of D by a perfectoid space.

**Hypotheses.**

- A Shimura datum (G,X), neat finite level K=K^pKp and a smooth admissible toroidal cone system Σ in characteristic zero; F/Qp finite contains the reflex field and splits G and μ as in BP §4.4.
- Use G^c and M^c_μ, the central quotient and Levi of the imported canonical coefficient construction; the Hodge and Hodge–Tate parabolics are opposite.
- S6 supplies the inverse-limit toroidal diamond D and period map, with the compatible deck actions preserving the chosen cone system. General G(Qp) Hecke maps are correspondences between compatible levels and cone decompositions, using common refinements; a G(Qp) action on D at a fixed Σ is not assumed. T6:comparison supplies the canonical torsor comparison including the μ-cyclotomic twist. The relevant completed structure sheaf and descent category are supplied by O1.
- The chosen fibre object belongs to the supplied descent category; a torus character alone is not an action of the full Levi.

**Construction or proof.**

1. Import S6 and T6:comparison, specifically BP Theorem 4.4.40, rather than reconstructing logarithmic period sheaves or the period map.
2. Apply the existing O1 associated coefficient functor to the actual pullback torsor and the specified full group action/reduction.
3. Use functoriality and restriction in O1 for representation morphisms and the open embedding; retain the boundary site.

**Prerequisites.** [PerfectoidShimuraVarieties:S6/general-toroidal-period-map](../packets/PerfectoidShimuraVarieties.json), [PerfectoidShimuraVarieties:S6/toroidal-hecke-correspondences](../packets/PerfectoidShimuraVarieties.json), [HodgeTateAndCanonicalSubgroups:T6:comparison/canonical-log-period-comparison](../packets/HodgeTateAndCanonicalSubgroups.json), [HodgeTateAndCanonicalSubgroups:T6:comparison/finite-levi-torsor](../packets/HodgeTateAndCanonicalSubgroups.json), [OverconvergentAutomorphicForms:O0/finite-analytic-coefficients](#o0-finite-analytic-coefficients), [OverconvergentAutomorphicForms:O0/analytic-induced-coefficients](#o0-analytic-induced-coefficients), [OverconvergentAutomorphicForms:O1/equivariant-coefficient-sheaf](#o1-equivariant-coefficient-sheaf), [OverconvergentAutomorphicForms:O1/coefficient-descent-functoriality](#o1-coefficient-descent-functoriality), `AutomorphicBundles:B0/hodge-parabolic-convention`, `AutomorphicBundles:B0/sections-equivariant`.

**Planned interface.** `TauCeti.Overconvergent.Siegel.toroidal_coefficient_instance`; module `TauCeti/NumberTheory/Overconvergent/Siegel/Coefficients`, namespace `TauCeti.Overconvergent.Siegel`.

**Check.**

- The trivial finite fibre gives the completed structure sheaf on D.
- The Siegel open restriction, with the quotient Hodge frame and the μ-cyclotomic twist transported as in hodge-frame-transformation, gives the same Jγ. Suppressing that twist with a fixed basis is not an equivariant comparison.
- A character given only on a compact torus cannot be used on the full Levi without an analytic extension or an actual reduced torsor.
- At fixed Σ only the supplied cone-compatible deck actions are used; a general Hecke element requires compatible cone changes and a common refinement.

**Sources.**

- [BP-HIGHER](#source-bp-higher), §4.4.38–4.4.40, pp.79–80; Hecke compatibility: Remark 4.4.28, p.76 and §4.6.18, pp.96–97. The geometry/torsor identification is imported from S6/T6; O8 applies the generic coefficient functor.

<a id="o8-toroidal-algebraic-comparison"></a>

### Toroidal algebraic coefficients and the cyclotomic twist

**Theorem** · `OverconvergentAutomorphicForms:O8/toroidal-algebraic-comparison`

Imported stable target from [OverconvergentAutomorphicForms--O8.json](../packets/OverconvergentAutomorphicForms--O8.json); the following is its effective assembly contract.

For a finite-dimensional algebraic representation ρ of M^c_μ, the finite coefficient object associated to π_HT^tor* (G^c,an/U_P) on D is isomorphic to the pullback of the canonical toroidal automorphic bundle Eρ^can associated to M_dR, twisted by the μ-action on Zp(1). On a μ-central summand where ρ∘μ has character t↦t^j, this is h*Eρ^can⊗Qp(j) after completed scalar extension. Without a chosen compatible root system the Tate line must remain in the statement. The comparison is compatible with tensor products, duals, representation morphisms and restriction to the open subdiamond.

**Hypotheses.**

- A Shimura datum (G,X), neat finite level K=K^pKp and a smooth admissible toroidal cone system Σ in characteristic zero; F/Qp finite contains the reflex field and splits G and μ as in BP §4.4.
- Use G^c and M^c_μ, the central quotient and Levi of the imported canonical coefficient construction; the Hodge and Hodge–Tate parabolics are opposite.
- S6 supplies the inverse-limit toroidal diamond D and period map, with the compatible deck actions preserving the chosen cone system. General G(Qp) Hecke maps are correspondences between compatible levels and cone decompositions, using common refinements; a G(Qp) action on D at a fixed Σ is not assumed. T6:comparison supplies the canonical torsor comparison including the μ-cyclotomic twist. The relevant completed structure sheaf and descent category are supplied by O1.
- ρ is algebraic and finite-dimensional; canonical toroidal extension is the normalized one supplied by B3.general. On an arithmetic base retain the Tate line; on C_p an untwisted formula requires a fixed trivialization.

**Construction or proof.**

1. Use the S6/T6 identification M_HT=M_dR×^{μ,Zp×}Zp(1) from BP Theorem 4.4.40.
2. Apply the associated finite coefficient functor and B0 sections-equivariant, and use the B3.general canonical extension rather than an arbitrary boundary extension.
3. Decompose according to the central μ-weights when giving the explicit Tate-summand formula; use tensor/dual compatibility of the imported torsor equivalence.

**Prerequisites.** [OverconvergentAutomorphicForms:O8/toroidal-coefficient-instance](#o8-toroidal-coefficient-instance), [PerfectoidShimuraVarieties:S6/general-toroidal-period-map](../packets/PerfectoidShimuraVarieties.json), [PerfectoidShimuraVarieties:S6/toroidal-hecke-correspondences](../packets/PerfectoidShimuraVarieties.json), [HodgeTateAndCanonicalSubgroups:T6:comparison/canonical-log-period-comparison](../packets/HodgeTateAndCanonicalSubgroups.json), [HodgeTateAndCanonicalSubgroups:T6:comparison/finite-levi-torsor](../packets/HodgeTateAndCanonicalSubgroups.json), `AutomorphicBundles:B3.general/general-canonical-extension`, `AutomorphicBundles:B0/sections-equivariant`.

**Planned interface.** `TauCeti.Overconvergent.Siegel.toroidal_algebraic_comparison`; module `TauCeti/NumberTheory/Overconvergent/Siegel/Coefficients`, namespace `TauCeti.Overconvergent.Siegel`.

**Check.**

- The trivial representation has j=0 and gives the structure sheaf comparison.
- For a μ-weight-one line the comparison retains Qp(1); dropping it changes arithmetic Galois descent.
- After the specified Siegel twist trivialization, restriction to the graph domain agrees with determinant-hodge-specialisation and algebraic-levi-specialisation.
- At fixed Σ only the supplied cone-compatible deck actions are used; a general Hecke element requires compatible cone changes and a common refinement.

**Sources.**

- [BP-HIGHER](#source-bp-higher), §4.4.38–4.4.40, pp.79–80; Hecke compatibility: Remark 4.4.28, p.76 and §4.6.18, pp.96–97. The torsor identity is transported through the finite associated-bundle functor; Tate weights are retained.

<a id="o8-supplied-domain-instance"></a>

### Coefficients on a supplied datum-specific reduction

**Application** · `OverconvergentAutomorphicForms:O8/supplied-domain-instance`

Imported stable target from [OverconvergentAutomorphicForms--O8.json](../packets/OverconvergentAutomorphicForms--O8.json); the following is its effective assembly contract.

For a unitary or other Shimura datum, let U be an actual analytic domain in its finite-level variety or toroidal diamond, Q_H→U an actual analytic H-torsor reduction of the canonical Levi torsor supplied by its geometry owner, and V an O0 analytic coefficient with an action of H. The O1 coefficient sheaf associated to (Q_H,V) is the datum-specific instance on U. For finite algebraic V extending to the Levi, extension of structure group identifies this sheaf with the canonical B4 datum-specific bundle restricted to U, with any T6 cyclotomic twist retained. A morphism of supplied domains/reductions induces the O1 coefficient pullback map. This statement constructs no ordinary locus and assumes no canonical subgroup for arbitrary data.

**Hypotheses.**

- The datum, characteristic-zero coefficient base, level, actual domain and topology are supplied, not encoded by an unspecified proposition.
- Q_H is a genuine reduction and V has an analytic H-action at its proven radius; O1 supplies effective descent in this category.
- For the finite comparison, V extends algebraically to the full Levi and B4 supplies that datum-specific associated bundle.

**Construction or proof.**

1. Import the supplied analytic reduction and its map to the canonical Levi torsor.
2. Instantiate O1 on this reduction with the supplied O0 fibre action; use associated-torsor extension of structure group for finite algebraic V.
3. Transport the B4 bundle through that equivalence and the T6 twist; obtain pullback naturality directly from O1.

**Prerequisites.** [OverconvergentAutomorphicForms:O0/finite-analytic-coefficients](#o0-finite-analytic-coefficients), [OverconvergentAutomorphicForms:O0/analytic-induced-coefficients](#o0-analytic-induced-coefficients), [OverconvergentAutomorphicForms:O1/equivariant-coefficient-sheaf](#o1-equivariant-coefficient-sheaf), [OverconvergentAutomorphicForms:O1/coefficient-descent-functoriality](#o1-coefficient-descent-functoriality), `AutomorphicBundles:B0/sections-equivariant`, `AutomorphicBundles:B2/levi-highest-weight-convention`, [PerfectoidShimuraVarieties:S6/general-toroidal-period-map](../packets/PerfectoidShimuraVarieties.json), [PerfectoidShimuraVarieties:S6/toroidal-hecke-correspondences](../packets/PerfectoidShimuraVarieties.json), [HodgeTateAndCanonicalSubgroups:T6:comparison/canonical-log-period-comparison](../packets/HodgeTateAndCanonicalSubgroups.json), [HodgeTateAndCanonicalSubgroups:T6:comparison/finite-levi-torsor](../packets/HodgeTateAndCanonicalSubgroups.json).

**Planned interface.** `TauCeti.Overconvergent.Siegel.supplied_domain_instance`; module `TauCeti/NumberTheory/Overconvergent/Siegel/Coefficients`, namespace `TauCeti.Overconvergent.Siegel`.

**Check.**

- With a trivial reduction the coefficient sheaf is the corresponding function sheaf tensored with V.
- With the Siegel Hodge-frame reduction the result recovers the Siegel nodes in this packet.
- Changing a frame by h changes coefficient coordinates by ρ(h)⁻¹; a noncommuting pair tests the order.
- An arbitrary unitary datum without a supplied analytic reduction is outside the hypotheses.

**Sources.**

- [BP-HIGHER](#source-bp-higher), §4.6.12, pp.94–95 and §6.3.1, p.153. The analytic reduction is imported as data; its associated coefficient formalism supplies the instance. BP proves a specific such reduction under its own hypotheses.

<a id="o8-bruhat-reduced-family"></a>

### Coefficient families on Bruhat period domains

**Theorem** · `OverconvergentAutomorphicForms:O8/bruhat-reduced-family`

**Planet:** Bruhat-domain coefficient families.

Imported stable target from [OverconvergentAutomorphicForms--O8.json](../packets/OverconvergentAutomorphicForms--O8.json); the following is its effective assembly contract.

In the BP quasi-split abelian-type setting, choose a split finite coefficient field F, compatible reductive O_F model and rational Borel/torus, neat tame level and toroidal Σ. Let Kp=Kp,m′,0 with m′>0 and w∈^M W. For n≥0 use the supplied étale reduction M_dR,n,Kp on U_w,n=(π_HT,Kp^tor)⁻¹(]C_w,k[_n,n Kp), under H=Kp,w,Mμ^c Mμ,n^c. For a complete Tate affinoid (A,A+) over (F,O_F) and n-analytic ν_A:T^c(Zp)→A×, put κ_A=−w0,M wν_A−(w0,M wρ+ρ), using BP additive weight notation and the same positive roots. The O0/O1 coefficient sheaf on U_w,n is the BP §6.3.1 sheaf of functions on M_dR,n,Kp×Spa(A,A+) satisfying f(mb)=(w0,M κ_A)(b⁻¹)f(m) for b∈B^c∩H. When ν is algebraic and κ is Mμ-dominant, it admits the finite canonical coefficient injection Vκ→Vν^(n-an) of BP Proposition 6.3.6. This supplies a proved datum-specific reduction instance beyond a universal ordinary neighbourhood claim.

**Hypotheses.**

- G_Qp is quasi-split; G splits over F; use the actual integral model and Kp,m′,0 of BP §3.5.1, not a guessed principal-congruence subgroup.
- The toroidal setup is of abelian type as in the reduction section; F is enlarged when needed so the μ-cyclotomic image lies in the reduction group.
- For the precursor reduction with m,n≥0 require 0≤m−n≤m′−1 (BP Proposition 4.6.12); the family uses m=n and the pushout on p.95.
- O0 supplies the analytic induction with precisely this character, root shift and action; O1 supplies completed analytic descent. No local projectivity claim is made without the finite-trivializing cover conditions.
- S6/bruhat-levi-reduction supplies the étale de Rham reduction and its m=n pushout; it is not an untwisted Hodge–Tate reduction.

**Construction or proof.**

1. Import the S6 reduction theorem with the BP radius/level and cyclotomic hypotheses, then push out the m=n reduction to the affinoid thickening group H.
2. Use the O0 analytic induced realization with ν→κ and the exact Borel-equivariance convention; instantiate supplied-domain-instance.
3. For algebraic κ dominant, restrict regular Borel-equivariant functions to analytic ones, then apply O1 to the finite injection; import the canonical coefficient from B4/B2.

**Prerequisites.** [OverconvergentAutomorphicForms:O8/supplied-domain-instance](#o8-supplied-domain-instance), [PerfectoidShimuraVarieties:S6/general-toroidal-period-map](../packets/PerfectoidShimuraVarieties.json), [PerfectoidShimuraVarieties:S6/toroidal-hecke-correspondences](../packets/PerfectoidShimuraVarieties.json), [OverconvergentAutomorphicForms:O0/analytic-induced-coefficients](#o0-analytic-induced-coefficients), [OverconvergentAutomorphicForms:O0/algebraic-induced-comparison](#o0-algebraic-induced-comparison), [OverconvergentAutomorphicForms:O1/equivariant-coefficient-sheaf](#o1-equivariant-coefficient-sheaf), [OverconvergentAutomorphicForms:O1/coefficient-descent-functoriality](#o1-coefficient-descent-functoriality), `AutomorphicBundles:B2/levi-highest-weight-convention`, `AutomorphicBundles:B0/sections-equivariant`, [PerfectoidShimuraVarieties:S6/bruhat-level-groups](../packets/PerfectoidShimuraVarieties.json), [PerfectoidShimuraVarieties:S6/bruhat-levi-reduction](../packets/PerfectoidShimuraVarieties.json).

**Planned interface.** `TauCeti.Overconvergent.Siegel.bruhat_reduced_family`; module `TauCeti/NumberTheory/Overconvergent/Siegel/Coefficients`, namespace `TauCeti.Overconvergent.Siegel`.

**Check.**

- The root correction w0,M wρ+ρ remains visible; replacing ν by κ without it gives the wrong finite coefficient.
- For a torus Levi there are no unipotent analytic coordinates; the fibre is the character line.
- The n=n radius choice satisfies the reduction inequality for every m′>0, whereas m−n>m′−1 is excluded.
- For G=Res_Qp²/Qp GL₂ and the mixed cocharacter of BP Example 4.6.10, Kp,w,Mμ is the actual projected subgroup, not an independently chosen full product Iwahori.

**Sources.**

- [BP-HIGHER](#source-bp-higher), §4.6.8–4.6.15, pp.92–95; §6.3.1 and Proposition 6.3.6, pp.153–154. The source proves the explicit Bruhat-domain reduction and instantiates analytic induction; only this coefficient-level application belongs to O8.

<a id="o8-siegel-factor-neighbourhood"></a>

### Siegel factor neighbourhood bound

**Theorem** · `OverconvergentAutomorphicForms:O8/siegel-factor-neighbourhood`

Assembly target checked by the independent review.

For γ=[A,B;C,D] in the group-theoretic strict GSp_2g Iwahori, and Z=Z0+E with Z0∈Mat_g(Z_p), ‖E‖≤p^(−w), w>0, put J=A+ZC and J0=A+Z0C. Then J0∈Iw_GLg+ and ‖J−J0‖≤p^(−(w+1)), because C∈p Mat_g(Z_p). Consequently J∈Iw_GLg+ M_(w+1), its determinant is a unit, and the same neighbourhood is stable under transpose inverse. Thus the occurring geometric factors act on the full normalized w-analytic coefficient module Cκ,w of O0 without enlarging its analytic radius.

**Hypotheses.**

- g≥1; use the entrywise maximum norm on C_p matrices and its scalar extension on each supplied affinoid chart.
- Strict Iwahori means diagonal reduction modulo p in the full GSp group, so A mod p is invertible diagonal and C mod p=0.
- Z0 need not be a Lagrangian matrix; its sole purpose is an integral approximation to Z. Apply the result locally on each period-chart ball.

**Construction or proof.**

1. Reduce J0 modulo p: the C term vanishes, giving the invertible diagonal reduction of A. J0 and its inverse therefore have integral entries.
2. The ultrametric product estimate gives ‖EC‖≤p^(−w)p⁻¹. Factor J=J0(1+J0⁻¹EC). This is a factorization in Iw+ M_(w+1).
3. Inversion and transpose preserve the diagonal-mod-p subgroup and the deep principal neighbourhood; the analytic coefficient action of O0/siegel-analytic-coefficients is therefore defined on all these factors.

**Prerequisites.** [OverconvergentAutomorphicForms:O0/siegel-analytic-coefficients](#o0-siegel-analytic-coefficients), [PerfectoidShimuraVarieties:S3/siegel-graph-chart-and-frame](../packets/PerfectoidShimuraVarieties.json), [PerfectoidShimuraVarieties:S1/siegel-open-tower-and-level-quotients](../packets/PerfectoidShimuraVarieties.json).

**Planned interface.** `TauCeti.Overconvergent.Siegel.factor_neighbourhood`; module `TauCeti/NumberTheory/Overconvergent/Siegel/Coefficients`, namespace `TauCeti.Overconvergent.Siegel`.

**Check.**

- In genus 1, γ=[1,0;p,1] gives J=1+pZ, exhibiting the extra factor p exactly.
- If C=0 then J=A and there is no analytic error term.
- For the full upper Iwahori A mod p can be upper triangular with a nonzero strict-upper entry; the conclusion that J0 is diagonal modulo p specifically uses strict Iwahori.

**Sources.**

- [drw-v3](#source-drw-v3), §2.1 pp7–9; §2.3 p15; Definition 2.5.3 p19; Remark 3.1.15 p25. The block congruences and period-coordinate bound give this stronger factor estimate; the final geometric coefficient action survives the correction to Remark 3.1.12.

### Worked check

With W=[[0,1],[1,0]], Z=E₁₂ and C=3E₂₁, the symplectic lower block γ=[[I,0],[C,I]] has J=diag(4,1). The correct WJᵀW is diag(1,4), whereas I+Z(WCᵀW) is diag(4,1). Thus the lower block must precede Z in the dual factor.

For the analytic-radius check take g=2, trivial weight, integer r≥3 and a∈C_p with v_p(a)=r−1/2. The function 1/(t−a) is analytic on every closed radius-p⁻ʳ disc centered in Z_p, but has a pole on the radius-p^(1−r) disc at zero. Since t=u₂₁/p, it cannot extend to the full entrywise M_r neighbourhood. The geometric J still acts: C∈p Mat gives J∈I+M_(w+1). On a rescaled chart, (T^p−T)/p is integral at every T∈Z_p but has Gauss norm p, detecting the incorrect pointwise lattice.

For the BP adapter, κ_D with exponents (4,1) corresponds to λ_BP=(−1,−4). The Weyl/inverse Borel conversion recovers (4,1), and τ transports the action without dropping the central exponent 5. For g=1 the full induced module is rank one; for g>1 its determinant line does not exhaust the analytic coefficient module.

### Remaining mathematical inputs

- Uniform quantitative Siegel canonical-domain comparison; inherited S6 log-to-v and site-specific descent gaps; DRW published-version collation.

- **All-open coefficient descent and the analytic AIP invariant-function theorem:** Finish the all-open/general-base geometric O/O+ descent extension identified by P9/weight-extension-sheaf-equalizer; product-affinoid descent alone does not imply rational-localization compatibility on the full weight product. Supply site-specific completed coefficient functions on the Siegel analytic, pro-Kummer-étale and toroidal diamond/v-sites, retaining the actual Gauss lattice. Apply finite/matrix-coboundary effectivity only with its hypotheses. For the analytic AIP B_m frame torsor, prove invariant geometric O+ functions are base O+ and prove valued-point lifting/reflection of bounds. This is distinct from the completed-lattice-tensor theorems and is not arbitrary Banach torsor descent.
- **Uniform quantitative Siegel canonical-domain comparison:** Siegel extension of the quantitative canonical-subgroup domain interface: DRW §3.6 uses p>2g, Z′=−pZ (use the primed coordinates in the canonical-domain definition; E-O8-15), and Proposition 3.6.12 requires c_g+n−1<w≤n, c_g=(2g−1)p/(2g(p−1)). Export the cofinal Hasse/period-domain comparison with actual radius bounds and a uniform affinoid argument; do not use Corollary 3.6.13 under its weaker printed inequality or infer a uniform strict bound from pointwise bounds. This is additional Siegel input in the existing T3 direction, not an O8 construction.
- **Toroidal log-to-v comparison:** Discharge the inherited log-to-v density/openness gap of S6/log-to-v-comparison used by S6/general-toroidal-period-map. Use that exact period-map node, the exact toroidal Hecke correspondence and Bruhat-reduction nodes; no second period-map or reduction construction belongs to O8.
- **Version-of-record collation of DRW findings:** All seventeen DRW findings refer to the hashed arXiv v3. The current arXiv landing page links the journal DOI but lists no later revision. Publisher PDF requests returned a challenge page. Presence or absence of each finding in the published text remains unverified. The explicit BP/Siegel chart adapter and geometric factor bound close the coefficient-action mismatch in this assembly; no AIP-intertwiner comparison or classicality theorem is claimed.

## Exact supplier requests

These requests name the residual statements. Exact existing supplier nodes in the target prerequisites already supply the rest. They do not ask for duplicate generic theory.

### R1. PadicMeasuresIwasawaAlgebras:L0a

Universal rigid character spaces and characters for O_p^× and O_p^××Z_p^×; represent the continuous-character functors on affinoid algebras, pull back along x↦(x²,N(x)⁻¹), and provide bounded affinoid-image families.

**Consumers.** [OverconvergentAutomorphicForms:O0/geometric-weight-characters](#o0-geometric-weight-characters), [OverconvergentAutomorphicForms:O0/arithmetic-weight-characters](#o0-arithmetic-weight-characters), [OverconvergentAutomorphicForms:O0/weight-comparison](#o0-weight-comparison), [OverconvergentAutomorphicForms:O0/bounded-weight-families](#o0-bounded-weight-families).

### R2. CompletedCohomologyPartII:CC.8

Extend CC.8/definite-unitary-degree-zero from its GL3/all-p-variable model to Ding §4.2.2: general n≥2, one varying place ℘, coefficients Wξ,τ at all other p-places, the stated tame/hyperspecial hypotheses, commuting tame Hecke action, admissible unitary Banach completion and the nonzero local model Π|H≅C(H,E)^s with s≥1. Reuse CC.1/CC.2 ordered-limit and action nodes; prove their finite-cell/admissibility inputs for this exact tower.

**Consumers.** [OverconvergentAutomorphicForms:O0/unitary-completed-coefficients](#o0-unitary-completed-coefficients).

### R3. LocallyAnalyticRepresentationsOfLocalGroups:LR.6

Build the Hecke-eigenvariety from the coherent Jacquet dual already supplied by LR.6/jacquet-emerton-properties and the full torus character space LR.6/character-variety. Supply the definite-unitary dimension/depth theorem and classical-density/reducedness argument in Ding Proposition 4.14, with n≥2, d_K, the actual Hecke spectral algebra and s≥1. Audit the cited Breuil–Hellmann–Schraen [21] Lemma3.10, Proposition3.11, Corollary3.12/§5.2 and Corollary3.20, [20] Lemma3.8 and [25] Proposition3.9. Generic Jacquet modules and character spaces are already owned here and are not requested again.

**Consumers.** [OverconvergentAutomorphicForms:O0/unitary-jacquet-eigenvariety](#o0-unitary-jacquet-eigenvariety), [OverconvergentAutomorphicForms:O0/unitary-eigenvariety-geometry](#o0-unitary-eigenvariety-geometry), [OverconvergentAutomorphicForms:O0/unitary-eigenvariety-reduced](#o0-unitary-eigenvariety-reduced).

### R4. PerfectoidSpaces:P9

Finish the all-open/general-base geometric O/O+ descent extension identified by P9/weight-extension-sheaf-equalizer; product-affinoid descent alone does not imply rational-localization compatibility on the full weight product. Supply site-specific completed coefficient functions on the Siegel analytic, pro-Kummer-étale and toroidal diamond/v-sites, retaining the actual Gauss lattice. Apply finite/matrix-coboundary effectivity only with its hypotheses. For the analytic AIP B_m frame torsor, prove invariant geometric O+ functions are base O+ and prove valued-point lifting/reflection of bounds. This is distinct from the completed-lattice-tensor theorems and is not arbitrary Banach torsor descent.

**Consumers.** [OverconvergentAutomorphicForms:O1/equivariant-coefficient-sheaf](#o1-equivariant-coefficient-sheaf), [OverconvergentAutomorphicForms:O1/coefficient-descent-functoriality](#o1-coefficient-descent-functoriality), [OverconvergentAutomorphicForms:O3/integral-rationalisation](#o3-integral-rationalisation), [OverconvergentAutomorphicForms:O5/aip-line-and-gluing](#o5-aip-line-and-gluing), [OverconvergentAutomorphicForms:O5/geometric-aip-comparison](#o5-geometric-aip-comparison), [OverconvergentAutomorphicForms:O8/siegel-analytic-instance](#o8-siegel-analytic-instance), [OverconvergentAutomorphicForms:O8/toroidal-coefficient-instance](#o8-toroidal-coefficient-instance).

### R5. HodgeTateAndCanonicalSubgroups:T4

Resolve the inherited equality-endpoint gap of T4/period-map-inclusions at the Hilbert bound ε≤1/(c_p p^m), c_p=2 for p≥5,3 for p=3,4 for p=2. Strict endpoint proofs alone do not cover equality. The actual coordinate, canonical/anticanonical domains and scaled AL maps already have exact T4 nodes. Also discharge T4/ramified-period-comparison's unsplit canonical-generator refinement: an O_F/p^nO_F-linear canonical subgroup generator and its congruence with the saturated Hodge–Tate kernel, using scalar conormal-degree estimates before passage to the generic splitting field. Do not identify O_p⊗O_C integrally with a product of O_C at ramified primes (BHW Proposition5.18 proof, pp1752–1753; E8). Both this refinement and the equality endpoint remain explicit hypotheses of their consumers.

**Consumers.** [OverconvergentAutomorphicForms:O2/admitted-hilbert-domain](#o2-admitted-hilbert-domain), [OverconvergentAutomorphicForms:O2/hilbert-automorphy-factor](#o2-hilbert-automorphy-factor), [OverconvergentAutomorphicForms:O5/geometric-aip-comparison](#o5-geometric-aip-comparison).

### R6. HodgeTateAndCanonicalSubgroups:T5

For the normalized finite-Igusa factor of a full character, including p-primary χ, prove positive-radius base-local O+ unit eigenfunctions and O+ unit transition ratios on the actual modified-lattice torsor. Universal-character formal freeness (AIP4.3/4.7) and full-character rational/ordinary invertibility (§6.4) are existing inputs, but do not by themselves supply this assertion. Separately identify the actual flat formally smooth ordinary integral charts and finite étale surjective formal Igusa covers needed for O7, with the permitted coefficient extension.

**Consumers.** [OverconvergentAutomorphicForms:O3/integral-hilbert-sheaf](#o3-integral-hilbert-sheaf), [OverconvergentAutomorphicForms:O5/aip-line-and-gluing](#o5-aip-line-and-gluing), [OverconvergentAutomorphicForms:O7/ordinary-completed-functions](#o7-ordinary-completed-functions), [OverconvergentAutomorphicForms:O7/igusa-completion-comparison](#o7-igusa-completion-comparison).

### R7. PerfectoidSpaces:P9

For the actual ordinary formal-affine Igusa tower provide R_i=A_i° after the specified coefficient extension, isometric transition maps, and an analytic affine tower with A∞ the separated spectral-norm completion of colim A_i and compatible formal-affine restrictions. O7 then proves (lim_m colim_i R_i/p^m)≅A∞°. Keep any weight lattice comparison separate; do not assert reduced R_i/p after nondiscrete C_p base change, and do not assume the tower is perfectoid.

**Consumers.** [OverconvergentAutomorphicForms:O7/igusa-completion-comparison](#o7-igusa-completion-comparison), [OverconvergentAutomorphicForms:O7/ordinary-coefficient-comparison](#o7-ordinary-coefficient-comparison).

### R8. ShimuraCompactifications:C6

Add the Hilbert structural cusp formal-cohomology theorem R^qρ_*O(−D)=0, q>0, on the actual finite-Igusa formal cusp fan/unit quotients, with the formal-functions/base-change adapter: AIP CUSP Theorem3.17 and Appendix Lemma6.3/Proposition6.4 pp32–33. C6 boundary ideal pushforward and R^0 global-functions comparison do not give this vanishing. Also extend the reviewed ordinary formal-model interface beyond its extra tame-level conditions when those are needed; otherwise retain them explicitly. For O6/hilbert-koecher, supply AIP ADIC Proposition8.4, pp36–37, for bounded analytic weight families and transport the boundary comparison to the admitted finite p-level neighbourhoods. The exact C6/arithmetic-koecher node concerns integral algebraic weights on its discriminant-inverted arithmetic model and is not this family theorem. Retain its tame/model restrictions until that extension is proved.

**Consumers.** [OverconvergentAutomorphicForms:O6/hilbert-koecher](#o6-hilbert-koecher), [OverconvergentAutomorphicForms:O6/cuspidal-coefficient-vanishing](#o6-cuspidal-coefficient-vanishing), [OverconvergentAutomorphicForms:O6/fixed-cusp-banach-modules](#o6-fixed-cusp-banach-modules), [OverconvergentAutomorphicForms:O7/igusa-completion-comparison](#o7-igusa-completion-comparison).

### R9. AutomorphicBundles:B5

Extend the exact classical Hilbert cusp-expansion/principle/boundary nodes to the compactified p-level bounded analytic families used here, retaining the cusp coefficient line, connectedness/base hypotheses, finite-level character twist and the 1/q isogeny trace normalization. Classical prime-to-p expansion nodes alone do not supply this extension.

**Consumers.** [OverconvergentAutomorphicForms:O6/hilbert-q-expansion-comparison](#o6-hilbert-q-expansion-comparison), [OverconvergentAutomorphicForms:O7/ordinary-hecke-expansions](#o7-ordinary-hecke-expansions).

### R10. HodgeTateAndCanonicalSubgroups:T3

Siegel extension of the quantitative canonical-subgroup domain interface: DRW §3.6 uses p>2g, Z′=−pZ (use the primed coordinates in the canonical-domain definition; E-O8-15), and Proposition 3.6.12 requires c_g+n−1<w≤n, c_g=(2g−1)p/(2g(p−1)). Export the cofinal Hasse/period-domain comparison with actual radius bounds and a uniform affinoid argument; do not use Corollary 3.6.13 under its weaker printed inequality or infer a uniform strict bound from pointwise bounds. This is additional Siegel input in the existing T3 direction, not an O8 construction.

**Consumers.** [OverconvergentAutomorphicForms:O8/hodge-frame-transformation](#o8-hodge-frame-transformation), [OverconvergentAutomorphicForms:O8/siegel-analytic-instance](#o8-siegel-analytic-instance).

### R11. PerfectoidShimuraVarieties:S6

Discharge the inherited log-to-v density/openness gap of S6/log-to-v-comparison used by S6/general-toroidal-period-map. Use that exact period-map node, the exact toroidal Hecke correspondence and Bruhat-reduction nodes; no second period-map or reduction construction belongs to O8.

**Consumers.** [OverconvergentAutomorphicForms:O8/toroidal-coefficient-instance](#o8-toroidal-coefficient-instance), [OverconvergentAutomorphicForms:O8/toroidal-algebraic-comparison](#o8-toroidal-algebraic-comparison), [OverconvergentAutomorphicForms:O8/bruhat-reduced-family](#o8-bruhat-reduced-family).

## Ownership extensions

**PadicMeasuresIwasawaAlgebras, LocallyAnalyticDistributions.** Universal compact character spaces belong to PMIA; analytic function and uniform-family radius modules belong to LAD. Retain those existing owners and exact LAD imports; add no duplicate weight-space theory to O0.

**LocallyAnalyticRepresentationsOfLocalGroups, CompletedCohomologyPartII.** LR.2/LR.6 already supply analytic vectors, noncompact character spaces and coherent Jacquet modules; CC.8 has a narrower GL3 definite-unitary application. LocallyAnalyticRepresentationsOfLocalGroups, Part II: coherent Jacquet eigenvariety geometry, extending LR.6 by the Hecke spectral algebra, dimension/depth and density/reducedness package. Extend the existing CompletedCohomologyPartII CC.8 by Ding’s general-n single-place coefficient model. Do not create another PadicFamiliesPartII or replan generic Jacquet theory.

**ShimuraCompactifications.** C6 geometry and boundary ideal pushforward do not give higher direct-image cusp vanishing. Extend the existing ShimuraCompactificationsPartII direction with Hilbert cusp formal cohomology, based on C6 formal cusp charts and AIP Appendix6.4. O6 owns only the analytic coefficient application and compact controlling operator.

## Sources and version boundaries

Every result above is stated in the roadmap’s own words. Locators use BHW’s printed journal pages and the cited author/manuscript pages for AIP, BP, Heuer, Ding and DRW. Read scopes are evidence of the target audit, not a claim to have read every cited work in full. Both inherited BP source identifiers refer to the same hashed PDF and are unified here as BP-HIGHER. All dates below are 2026-10-20.

<a id="source-bhw-2023"></a>

### BHW-2023

Christopher Birkbeck, Ben Heuer and Chris Williams, [Overconvergent Hilbert modular forms via perfectoid modular varieties](https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf). Annales de l'Institut Fourier 73 (2023), no. 4, 1709–1794, DOI 10.5802/aif.3560; open-access journal PDF from Centre Mersenne (87 pages; printed page = PDF page + 1707).

SHA-256: `d59b7f701eb5258c351d959be08d49f17946245ed1e5779317d2371981c2c5c4`.

**Read for this assembly:** Definitions 6.1–6.8, Proposition 6.3/6.6, §§7.1–7.2, printed pp1755–1765; §§8.2–8.4 and 9–10, pp1768–1792, with the central quotient and pairing checked against H4/S5.

<a id="source-bhw-arxiv-v4"></a>

### BHW-ARXIV-V4

Christopher Birkbeck, Ben Heuer and Chris Williams, [Overconvergent Hilbert modular forms via perfectoid modular varieties (arXiv version)](https://arxiv.org/pdf/1902.03985v4). arXiv:1902.03985v4, 10 May 2021, PDF.

SHA-256: `8ee48970dc500f60a6409cca0e6d9feeb693071da00a8b37174776717b708dac`.

**Read for this assembly:** The corresponding weight-map, boundedness, AIP admission and integral comparison passages in §§6–7, compared with the published formulas.

<a id="source-aip-adic-2016"></a>

### AIP-ADIC-2016

Fabrizio Andreatta, Adrian Iovita, Vincent Pilloni, [The adic, cuspidal, Hilbert eigenvarieties](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/Hilbert_adicfinal.pdf). Research in the Mathematical Sciences 3 (2016), 34; author PDF, 40 pages (author pagination used).

SHA-256: `34f517fd8d02d778f16f19745f4303b3955d48646d0ce6665b88a10f6fcdebbd`.

**Read for this assembly:** Proposition 2.8 and its character charts, pp7–10; Propositions 4.3/4.7 and Lemmas 4.4–4.6, pp16–18; §6.4 p29; §7.1 p30; §§8.3–8.5 pp36–39, including the ordinary Igusa discussion.

<a id="source-aip-cusp-2016"></a>

### AIP-CUSP-2016

Fabrizio Andreatta, Adrian Iovita, Vincent Pilloni, [On overconvergent Hilbert Modular cusp forms](https://www.imo.universite-paris-saclay.fr/~pilloni/AIP2.pdf). Astérisque 382 (2016), 163–192; author PDF, 35 pages (author pagination used).

SHA-256: `1f42b2c19b9542e937b6d02c244f71c7a1ef1d15840b8fab209950227269c406`.

**Read for this assembly:** §§3.6–3.7 pp18–24, especially Theorem 3.17, Proposition 3.22 and its cofinal-global-Hasse qualification, and Lemma 3.27; §4 pp26–28, including Theorem 4.4 and Lemma 4.5; Appendix Lemma 6.3 and Proposition 6.4 pp32–33.

<a id="source-bp-higher"></a>

### BP-HIGHER

George Boxer and Vincent Pilloni, [Higher Coleman Theory](https://www.imo.universite-paris-saclay.fr/~pilloni/HigherColeman.pdf). Public author manuscript, 180 pages; locators use this hashed file..

SHA-256: `d340c9a020cc5fdbca781a8630b6fae35e14607142bed700d6ab82334faa80ae`.

**Read for this assembly:** §4.4.38–4.4.40 pp79–80; §4.6.12 and the m=n pushout pp94–95; §§6.2.2–6.2.11 pp147–150; §6.2.20 pp152–153; §6.3 pp153–155. The same PDF supplies both inherited BP source identifiers.

**Scope boundary.** The full logarithmic Riemann–Hilbert proof is supplied by T6:comparison; local cohomology, slope/control and eigenvariety arguments are outside O8.

<a id="source-ding-2025"></a>

### DING-2025

Yiwen Ding, [p-adic Hodge parameters in the crystabelline representations of GL_n](https://pmihes.centre-mersenne.org/item/10.1007/s10240-025-00156-2.pdf). Publications Mathématiques de l’IHÉS 142 (2025), 1–74; version of record.

SHA-256: `741a49c0677a77b22c9759a016e215882b70dc760eb9e41fd2fe45cc633d05ba`.

**Read for this assembly:** §4.2.2 pp66–67, the completed coefficient setup, point criterion, Proposition 4.14 and its proof citations. These use general n≥2 and fixed coefficients at the other p-adic places.

<a id="source-heuer-2022"></a>

### HEUER-2022

Ben Heuer, [Line bundles on rigid spaces in the v-topology](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/E9F0B6B21BA1F345142C7301C2EDDA28/S205050942200072Xa.pdf/line-bundles-on-rigid-spaces-in-the-v-topology.pdf). Forum of Mathematics, Sigma 10 (2022), e82; DOI10.1017/fms.2022.72, 36 pages.

SHA-256: `1a435945b817b8081b34e490b39b43c707676d4142cb83b77493b112908cdadf`.

**Read for this assembly:** Corollary 1.4 p3 and Definition 3.7/Proposition 3.8 with proof pp16–17: analytic line effectivity, formal-unit cocycles and the natural completion map.

<a id="source-drw-v3"></a>

### drw-v3

Hansheng Diao, Giovanni Rosso, Ju-Feng Wu, [Perfectoid overconvergent Siegel modular forms and the overconvergent Eichler–Shimura morphism](https://arxiv.org/pdf/2106.00094v3). arXiv:2106.00094v3, 9 April 2026; 108-page manuscript.

SHA-256: `41ced4964ca50027e9fb93813047820a2853b9632fed221cbd5690be4d3294a8`.

**Read for this assembly:** §§2.1–2.5 pp7–19, §§3.1 and 3.3–3.4 pp20–25,31–38, §3.6 pp42–47, Appendix B pp99–106. Checked analytic coordinate normalization against the entrywise group thickenings. No claim to have compared the published full text.

arXiv landing page checked 2026-10-20: v3 (9 April 2026) remains the latest listed revision; DOI 10.1007/s40687-026-00610-5 is linked. Publisher full-text access returned a challenge page, not a PDF. Findings are restricted to the hashed v3.

**Scope boundary.** §3.2 Hecke formulas on pp.28–30, §3.5 classicality, §§4–6 Eichler–Shimura/cohomology/eigenvarieties, and Appendix A proofs: outside the O8 targets or imported from the site/descent owners. The version of record was not compared page by page; source findings are confined to the hashed arXiv v3.

## Source findings used by the targets

The 26 records comprise 25 confirmed findings and one rejected allegation. Every verdict below is from this independent assembly review; historical part reviews remain in the packet. Findings against DRW concern only the hashed arXiv v3, and no claim about their persistence in the journal text is made.

### OverconvergentAutomorphicForms/E1

**Misprint**, [BHW-2023](#source-bhw-2023), §6.1, Definition 6.1, printed p. 1756 (PDF p. 49); same in arXiv v4.

**Source claim or problem.** The printed dual group map uses a positive norm exponent, whereas the accompanying character formula uses the inverse norm character.

**Corrected use.** Use x↦(x²,N(x)⁻¹); pullback of (w,t) is w²·(t⁻¹∘N).

**Reason.** Pulling a character (w, t) back along x ↦ (x², N(x)) gives x ↦ w(x)²·t(N(x)), not w(x)²·t(N(x))⁻¹; the two differ unless t∘N is 2-torsion. The displayed formula is the one used later: after Definition 6.2 (p. 1757, ρ(w_κ, t_κ) = w_κ²·(t_κ⁻¹∘N)) and in (9.1) (p. 1781, κ⁻¹(η)w_κ(η²) = t_κ∘N(η)), which holds for the inverted map. Checked on the page images.

**Effect.** nothing

**Correction/version search.** new

**Search record.**

- Centre Mersenne DOI10.5802/aif.3560 article page and author publication pages, checked 2026-10-06: no erratum located.
- arXiv:1902.03985v4 compared with the published PDF: the relevant printed formulas agree.
- Web searches for Birkbeck–Heuer–Williams Hilbert forms erratum/correction, 2026-10-06: no correction found. No authors contacted.
- Independent web search on 2026-10-08 for the paper title and erratum/correction found no erratum in the returned results; the published PDF and arXiv v4 retain the relevant formulas. This search does not establish absence of an erratum.
- Independent review 2026-10-09: publisher article page and title searches with erratum/correction returned no erratum. This does not establish its absence; no author was contacted.
- Independent assembly review on 2026-10-20 checked the published PDF, the relevant arXiv v4 passages, the Centre Mersenne article page, arXiv history and Heuer's publication page. Title/author erratum searches returned no correction; this is not proof of its absence.

**Independent review.** confirmed — At published p1756 and arXiv v4 p27, precomposition with (x²,N(x)) yields w(x)²t(N(x)); the accompanying inverse-norm formula instead requires (x²,N(x)⁻¹). Equation(9.1) p1781 uses the latter convention.

Earlier review verdicts are retained in the packet’s `reviewHistory`; the verdict above is this assembly review.

### OverconvergentAutomorphicForms/E2

**Error**, [BHW-2023](#source-bhw-2023), §6.1 after Definition 6.2, printed p. 1757 (PDF p. 50); also Definition 4.5(3), printed p. 1737, and Definition 7.7, printed p. 1761; same in arXiv v4.

**Source claim or problem.** The definition takes a supremum of character deviations over the entire unit group and associates bounded weights with a strict bound below one.

**Corrected use.** For boundedness diagnostics take the supremum over a fixed sufficiently small pro-p principal-unit subgroup; keep boundedness itself as affinoid-image boundedness. For quantitative AIP domains use the universal-coordinate annuli of AIP ADIC §2.4.3; do not identify their coordinate δ with this corrected supremum without proof.

**Reason.** For p odd and F = ℚ, the Teichmüller character ω : ℤ_p^× → ℤ_p^× is an L-point of 𝒲, hence a bounded weight, but for a primitive (p−1)-st root of unity ζ, |ω(ζ) − 1| = |ζ − 1| = 1. So the printed |T_ω| = 1, contradicting 'bounded iff |T_κ| < 1'; likewise for any weight nontrivial on the prime-to-p torsion of 𝒪_p^×. Then |δ_κ| = 1 and |p|^{ε_κ} = 1 give ε_κ = 0, contradicting '0 < ε_κ' in Definitions 4.5(3) and 7.7, so the AIP comparison (Theorems 4.8 and 7.14) is stated only over the ordinary locus for such weights. Checked on the page images. This correction alone does not validate the printed analytic radius (E3), nor identify the scalar pro-p norm with all AIP coordinates.

**Effect.** a stated result

**Correction/version search.** new

**Search record.**

- Centre Mersenne DOI10.5802/aif.3560 article page and author publication pages, checked 2026-10-06: no erratum located.
- arXiv:1902.03985v4 compared with the published PDF: the relevant printed formulas agree.
- Web searches for Birkbeck–Heuer–Williams Hilbert forms erratum/correction, 2026-10-06: no correction found. No authors contacted.
- Independent web search on 2026-10-08 for the paper title and erratum/correction found no erratum in the returned results; the published PDF and arXiv v4 retain the relevant formulas. This search does not establish absence of an erratum.
- Independent review 2026-10-09: publisher article page and title searches with erratum/correction returned no erratum. This does not establish its absence; no author was contacted.
- Independent assembly review on 2026-10-20 checked the published PDF, the relevant arXiv v4 passages, the Centre Mersenne article page, arXiv history and Heuer's publication page. Title/author erratum searches returned no correction; this is not proof of its absence.

**Independent review.** confirmed — Published pp1737/1757/1761 and arXiv v4 pp27/29 use an all-unit supremum. A nontrivial prime-to-p finite character has supremum one but is an ordinary weight-space point. Principal-unit diagnostics avoid this counterexample and must remain separate from AIP universal coordinates.

Earlier review verdicts are retained in the packet’s `reviewHistory`; the verdict above is this assembly review.

### OverconvergentAutomorphicForms/E3

**Error**, [BHW-2023](#source-bhw-2023), Proposition6.3, p1757; arXiv v4 Proposition6.3.

**Source claim or problem.** The proposed radius multiplies the principal-unit scale by the character-deviation parameter.

**Corrected use.** Assert an existential common analytic radius, supplied by AIP Proposition2.8 on genuine universal-coordinate charts; omit this numerical formula. Even replacing the supremum by a pro-p supremum does not fix the formula.

**Reason.** Take F=Q,p=3, κ trivial on μ2 and κ(4)=ζ9 primitive. On H1, |Tκ|=3^(−1/6), so the printed r is 3^(−7/6). The analytic ball about1 contains64=4³ since |64−1|3=3^(−2)<r, and κ(64)=ζ3≠1. But κ=1 on4^(9·3^j), a sequence converging to1 inside the ball. The analytic identity theorem forces an extension to equal1 on this ball, contradicting its value at64. Thus the formula fails for a genuine bounded finite-character weight with the corrected pro-p supremum.

**Effect.** a stated result

**Correction/version search.** new

**Search record.**

- Centre Mersenne DOI10.5802/aif.3560 article page and author publication pages, checked 2026-10-06: no erratum located.
- arXiv:1902.03985v4 compared with the published PDF: the relevant printed formulas agree.
- Web searches for Birkbeck–Heuer–Williams Hilbert forms erratum/correction, 2026-10-06: no correction found. No authors contacted.
- Independent web search on 2026-10-08 for the paper title and erratum/correction found no erratum in the returned results; the published PDF and arXiv v4 retain the relevant formulas. This search does not establish absence of an erratum.
- Independent review 2026-10-09: publisher article page and title searches with erratum/correction returned no erratum. This does not establish its absence; no author was contacted.
- Independent assembly review on 2026-10-20 checked the published PDF, the relevant arXiv v4 passages, the Centre Mersenne article page, arXiv history and Heuer's publication page. Title/author erratum searches returned no correction; this is not proof of its absence.

**Independent review.** confirmed — Published Proposition6.3 p1757 and arXiv v4 p27 print the product radius. For p=3 and κ(4)=ζ_9, that radius is 3^(−7/6): its ball at one contains 4³=64 with nontrivial value and kernel points accumulating at one. An analytic extension there would be constant by the identity theorem, a contradiction. Only a sufficiently small existential radius is used.

Earlier review verdicts are retained in the packet’s `reviewHistory`; the verdict above is this assembly review.

### OverconvergentAutomorphicForms/E4

**Misprint**, [BHW-2023](#source-bhw-2023), Definition7.1(1), p1759; arXiv v4 §7.1.

**Source claim or problem.** The printed canonical-subgroup order has exponent m without the number-field degree.

**Corrected use.** The O_F-linear canonical subgroup is of order p^(mg), g=[F:Q], while it is locally O_F/p^mO_F as an O_F-module.

**Reason.** An O_F/p^mO_F module has p^(m[F:Q]) elements. The same definition gives this local module model; order p^m agrees only in degree1.

**Effect.** nothing

**Correction/version search.** new

**Search record.**

- Centre Mersenne DOI10.5802/aif.3560 article page and author publication pages, checked 2026-10-06: no erratum located.
- arXiv:1902.03985v4 compared with the published PDF: the relevant printed formulas agree.
- Web searches for Birkbeck–Heuer–Williams Hilbert forms erratum/correction, 2026-10-06: no correction found. No authors contacted.
- Independent web search on 2026-10-08 for the paper title and erratum/correction found no erratum in the returned results; the published PDF and arXiv v4 retain the relevant formulas. This search does not establish absence of an erratum.
- Independent review 2026-10-09: publisher article page and title searches with erratum/correction returned no erratum. This does not establish its absence; no author was contacted.
- Independent assembly review on 2026-10-20 checked the published PDF, the relevant arXiv v4 passages, the Centre Mersenne article page, arXiv history and Heuer's publication page. Title/author erratum searches returned no correction; this is not proof of its absence.

**Independent review.** confirmed — Published Definition7.1 p1759 and arXiv v4 p28 identify the canonical group with O_F/p^mO_F, which has p^(m[F:Q]) elements. The printed order p^m omits the degree except in degree one.

Earlier review verdicts are retained in the packet’s `reviewHistory`; the verdict above is this assembly review.

### OverconvergentAutomorphicForms/E5

**Misprint**, [BHW-2023](#source-bhw-2023), Remark6.9, p1759.

**Source claim or problem.** The projective Banach cusp result is attributed to reference [2] rather than the cusp-form paper [3].

**Corrected use.** The projective Banach cusp citation belongs to [3] (AIP CUSP), Theorem3.16; the fixed-radius arithmetic assertion is Theorem4.4, with the cofinal affinoid refinement in its proof.

**Reason.** Reference [2], AIP ADIC, has no Theorem3.16. Reference [3], AIP CUSP, has the stated projective-Banach/specialisation theorem; its Prop3.22 proof includes the global-Hasse affinoid refinement noted by Hattori.

**Effect.** nothing

**Correction/version search.** new

**Search record.**

- Centre Mersenne DOI10.5802/aif.3560 article page and author publication pages, checked 2026-10-06: no erratum located.
- arXiv:1902.03985v4 compared with the published PDF: the relevant printed formulas agree.
- Web searches for Birkbeck–Heuer–Williams Hilbert forms erratum/correction, 2026-10-06: no correction found. No authors contacted.
- Independent web search on 2026-10-08 for the paper title and erratum/correction found no erratum in the returned results; the published PDF and arXiv v4 retain the relevant formulas. This search does not establish absence of an erratum.
- Independent review 2026-10-09: publisher article page and title searches with erratum/correction returned no erratum. This does not establish its absence; no author was contacted.
- Independent assembly review on 2026-10-20 checked the published PDF, the relevant arXiv v4 passages, the Centre Mersenne article page, arXiv history and Heuer's publication page. Title/author erratum searches returned no correction; this is not proof of its absence.

**Independent review.** confirmed — BHW Remark6.9 p1759 points its Theorem3.16 citation to the ADIC reference. The theorem is in AIP CUSP p18; its fixed-radius arithmetic form is Theorem4.4 p28, with the additional weight-affinoid hypotheses. Those distinctions are retained.

Earlier review verdicts are retained in the packet’s `reviewHistory`; the verdict above is this assembly review.

### OverconvergentAutomorphicForms/E6

**Misprint**, [BHW-2023](#source-bhw-2023), Theorem7.14, printed p1764 (PDF p57); arXiv v4 PDF p31.

**Source claim or problem.** The displayed isomorphism labelled by the frame pullback has the perfectoid coefficient sheaf as source and the AIP coefficient sheaf as target.

**Corrected use.** The pullback along the scaled Hodge–Tate frame has source ω_AIP,n^{κ,+} and target ω_n^{κ,+}. The opposite arrow is its inverse, rather than that pullback.

**Reason.** The scaled frame maps the perfectoid cover to the AIP frame torsor, so pullback of eigenfunctions is contravariant from the AIP sheaf to the perfectoid sheaf. The first paragraph of the theorem’s proof constructs exactly that direction. Since the map is an isomorphism, the theorem’s isomorphism assertion is unaffected.

**Effect.** nothing

**Correction/version search.** new

**Search record.**

- The published PDF and arXiv v4 retain the same displayed direction; checked independently on 2026-10-08.
- The dated title/erratum/correction web searches on 2026-10-08 found no correction in the returned results; absence is not established and no author was contacted.
- Independent review 2026-10-09: publisher article page and title searches with erratum/correction returned no erratum. This does not establish its absence; no author was contacted.
- Independent assembly review on 2026-10-20 checked the published PDF, the relevant arXiv v4 passages, the Centre Mersenne article page, arXiv history and Heuer's publication page. Title/author erratum searches returned no correction; this is not proof of its absence.

**Independent review.** confirmed — Published Theorem7.14 p1764 and arXiv v4 p31 label the perfectoid-to-AIP arrow by the frame pullback, whereas the proof constructs AIP-to-perfectoid pullback. The inverse isomorphism exists; the issue is the labelled arrow direction.

Earlier review verdicts are retained in the packet’s `reviewHistory`; the verdict above is this assembly review.

### OverconvergentAutomorphicForms/E-O8-1

**Error**, [drw-v3](#source-drw-v3), Definition 2.2.1(iv) and Remark 2.2.2, pp. 10–11 (rendered); arXiv v3 only.

**Source claim or problem.** {Ci : i = 1, ..., g}

**Corrected use.** Define the strict-Iwahori level by the full-level tower quotient by the inverse image of the diagonal torus. A moduli description needs enough ordered symplectic line data to have that stabilizer, not only g pairwise-disjoint order-p subgroups.

**Reason.** For g=1 a single order-p subgroup is one line in F_p². Its stabilizer is a Borel, which contains nontrivial unipotents and is strictly larger than the diagonal torus. Under the source row convention the matrix [1,0;1,1] fixes the first row line and is not diagonal. The displayed block-diagonal stabilizer assertion therefore fails already in genus one. For larger g, pairwise disjointness also does not assert joint independence or isotropy.

**Effect.** a stated result

**Correction/version search.** new

**Search record.**

- arXiv version history for 2106.00094 checked 2026-10-06: v3 remains the latest listed version; earlier versions not compared.
- Author research page https://sites.google.com/view/jufengwu/research and public title/author erratum/correction searches checked 2026-10-06: no correction for this article located. The linked erratum is for another article.
- No page-by-page version-of-record comparison; findings confined to the hashed public preprint. No claim of priority or exhaustive search.
- Independent review checked the Springer version-of-record metadata and attempted its PDF on 2026-10-06; only an access preview was served. No published-text verification or claim of priority.
- Independent assembly review on 2026-10-20 checked the hashed source at this locator. Version-of-record scope is retained; the DRW journal full text remains uncollated.

**Independent review.** confirmed — DRW v3 pp10–11 specifies insufficient level data for a diagonal-reduction stabilizer. In genus one a single line has a Borel stabilizer, including a lower unipotent in the displayed convention. The corrected target uses the genuine group quotient, whose existence is a separate S1 input.

Earlier review verdicts are retained in the packet’s `reviewHistory`; the verdict above is this assembly review.

### OverconvergentAutomorphicForms/E-O8-2

**Misprint**, [drw-v3](#source-drw-v3), §2.3 normalized basis, p. 14 (rendered), against §2.1 p. 7; arXiv v3 only.

**Source claim or problem.** (⟨w□i , e2g+1−j ⟩)1≤i,j≤g = 1g

**Corrected use.** With the pairing matrix [0,−W;W,0] and graph basis e_i+Σ_j Z_ij e_{g+j}, normalize this pairing matrix to −I. Equivalently reverse the pairing arguments. Keep the [I,Z] graph convention used in the subsequent calculations.

**Reason.** At Z=0, the displayed graph basis is e_i and §2.1 gives ⟨e_i,e_{2g+1−j}⟩=−δ_ij. The equations on p. 14 cannot simultaneously have the stated +I normalization and the positive e_i leading term.

**Effect.** the proof

**Correction/version search.** new

**Search record.**

- arXiv version history for 2106.00094 checked 2026-10-06: v3 remains the latest listed version; earlier versions not compared.
- Author research page https://sites.google.com/view/jufengwu/research and public title/author erratum/correction searches checked 2026-10-06: no correction for this article located. The linked erratum is for another article.
- No page-by-page version-of-record comparison; findings confined to the hashed public preprint. No claim of priority or exhaustive search.
- Independent review checked the Springer version-of-record metadata and attempted its PDF on 2026-10-06; only an access preview was served. No published-text verification or claim of priority.
- Independent assembly review on 2026-10-20 checked the hashed source at this locator. Version-of-record scope is retained; the DRW journal full text remains uncollated.

**Independent review.** confirmed — The pairing matrix on DRW p7 and the normalized graph vectors on p14 give −δ_ij at Z=0. The sign normalization must be −I for that basis; changing it preserves the subsequent graph calculation.

Earlier review verdicts are retained in the packet’s `reviewHistory`; the verdict above is this assembly review.

### OverconvergentAutomorphicForms/E-O8-3

**Misprint**, [drw-v3](#source-drw-v3), Lemma 2.2.5, final identity, p. 13; arXiv v3 only.

**Source claim or problem.** hIw,∗

**Corrected use.** The final strict-Iwahori identity must use h_Iw+,∗.

**Reason.** The left-hand side is a sheaf on X_Iw+; h_Iw,∗ has target X_Iw. The proof describes the second pair as the same construction at strict-Iwahori level.

**Effect.** the proof

**Correction/version search.** new

**Search record.**

- arXiv version history for 2106.00094 checked 2026-10-06: v3 remains the latest listed version; earlier versions not compared.
- Author research page https://sites.google.com/view/jufengwu/research and public title/author erratum/correction searches checked 2026-10-06: no correction for this article located. The linked erratum is for another article.
- No page-by-page version-of-record comparison; findings confined to the hashed public preprint. No claim of priority or exhaustive search.
- Independent review checked the Springer version-of-record metadata and attempted its PDF on 2026-10-06; only an access preview was served. No published-text verification or claim of priority.
- Independent assembly review on 2026-10-20 checked the hashed source at this locator. Version-of-record scope is retained; the DRW journal full text remains uncollated.

**Independent review.** confirmed — In Lemma2.2.5 p13 the strict-level equality lies over X_Iw+, while the indicated pushforward lands over X_Iw. Restoring the plus corrects this codomain mismatch.

Earlier review verdicts are retained in the packet’s `reviewHistory`; the verdict above is this assembly review.

### OverconvergentAutomorphicForms/E-O8-4

**Misprint**, [drw-v3](#source-drw-v3), Remark 3.1.7, p. 22 (rendered); arXiv v3 only.

**Source claim or problem.** p⌈r⌉

**Corrected use.** The closed balls partitioning Z_p^n have radius p^(−ceil(r)) under |p|=p^(−1).

**Reason.** Their underlying cosets are a+p^ceil(r) Z_p^n. A ball of radius p^ceil(r)>1 is not such a coset; the surrounding formulas use the negative exponent.

**Effect.** the proof

**Correction/version search.** new

**Search record.**

- arXiv version history for 2106.00094 checked 2026-10-06: v3 remains the latest listed version; earlier versions not compared.
- Author research page https://sites.google.com/view/jufengwu/research and public title/author erratum/correction searches checked 2026-10-06: no correction for this article located. The linked erratum is for another article.
- No page-by-page version-of-record comparison; findings confined to the hashed public preprint. No claim of priority or exhaustive search.
- Independent review checked the Springer version-of-record metadata and attempted its PDF on 2026-10-06; only an access preview was served. No published-text verification or claim of priority.
- Independent assembly review on 2026-10-20 checked the hashed source at this locator. Version-of-record scope is retained; the DRW journal full text remains uncollated.

**Independent review.** confirmed — Remark3.1.7 p22 uses residue classes modulo p^ceil(r); under |p|=p⁻¹ their discs have radius p^(−ceil(r)). The printed positive exponent has the wrong sign.

Earlier review verdicts are retained in the packet’s `reviewHistory`; the verdict above is this assembly review.

### OverconvergentAutomorphicForms/E-O8-5

**Error**, [drw-v3](#source-drw-v3), Definition 3.1.6(iii) and Remark 3.1.7, p. 22 (rendered); arXiv v3 only.

**Source claim or problem.** The values are required to lie in B◦.

**Corrected use.** The unit ball for the displayed analytic Gauss norm requires integral bounds on the analytic extension to each C_p-disc, equivalently on all scaled coefficients. Pointwise values on Z_p^n alone do not give that lattice.

**Reason.** Take r=1,n=1,B=C_p and an odd prime p. On pZ_p set f(x)=((x/p)^p−x/p)/p and set f=0 on each other residue class. This is 1-analytic and O_Cp-valued on every Z_p point by Fermat reduction. On the 0+pZ_p chart its series in T/p has coefficients 1/p and −1/p, so its radius-p^(−1) Gauss norm is p>1. Thus the stated pointwise lattice is larger than the analytic Gauss unit ball.

**Effect.** a stated result

**Correction/version search.** new

**Search record.**

- arXiv version history for 2106.00094 checked 2026-10-06: v3 remains the latest listed version; earlier versions not compared.
- Author research page https://sites.google.com/view/jufengwu/research and public title/author erratum/correction searches checked 2026-10-06: no correction for this article located. The linked erratum is for another article.
- No page-by-page version-of-record comparison; findings confined to the hashed public preprint. No claim of priority or exhaustive search.
- Independent review checked the Springer version-of-record metadata and attempted its PDF on 2026-10-06; only an access preview was served. No published-text verification or claim of priority.
- Independent assembly review on 2026-10-20 checked the hashed source at this locator. Version-of-record scope is retained; the DRW journal full text remains uncollated.

**Independent review.** confirmed — Definition3.1.6(iii) and Remark3.1.7 p22 confuse bounded values at Z_p arguments with the Gauss unit ball on analytic discs. The recorded polynomial has integral values at those arguments but a scaled coefficient of norm p, so the lattices differ.

Earlier review verdicts are retained in the packet’s `reviewHistory`; the verdict above is this assembly review.

### OverconvergentAutomorphicForms/E-O8-6

**Misprint**, [drw-v3](#source-drw-v3), Remark 3.1.12, p. 23 (rendered); arXiv v3 only.

**Source claim or problem.** κU|U(w)GLg,0 = 0

**Corrected use.** The multiplicative character restricts to 1 on the unipotent subgroup, as in Definition 3.1.10(ii).

**Reason.** A homomorphism into units sends the identity to 1, not 0; the formula f(ντν′)=κ(τ)f(ν) on p. 24 requires the trivial multiplicative character.

**Effect.** the proof

**Correction/version search.** new

**Search record.**

- arXiv version history for 2106.00094 checked 2026-10-06: v3 remains the latest listed version; earlier versions not compared.
- Author research page https://sites.google.com/view/jufengwu/research and public title/author erratum/correction searches checked 2026-10-06: no correction for this article located. The linked erratum is for another article.
- No page-by-page version-of-record comparison; findings confined to the hashed public preprint. No claim of priority or exhaustive search.
- Independent review checked the Springer version-of-record metadata and attempted its PDF on 2026-10-06; only an access preview was served. No published-text verification or claim of priority.
- Independent assembly review on 2026-10-20 checked the hashed source at this locator. Version-of-record scope is retained; the DRW journal full text remains uncollated.

**Independent review.** confirmed — Definition3.1.10 p23 makes the unit-valued character trivial on the unipotent subgroup, so Remark3.1.12 must give the value 1 there. Value 0 is incompatible with even the identity element.

Earlier review verdicts are retained in the packet’s `reviewHistory`; the verdict above is this assembly review.

### OverconvergentAutomorphicForms/E-O8-7

**Misprint**, [drw-v3](#source-drw-v3), Definition 3.1.14(v), first colimit, p. 25 (rendered); arXiv v3 only.

**Source claim or problem.** MκU Iw,w

**Corrected use.** Use M^κU_Iw+,w on the right side when defining forms of strict-Iwahori level.

**Reason.** The preceding definition fixes strict-Iwahori level; the other adjacent colimit and cuspform formulas retain the plus. A change of level cannot be omitted from a definition.

**Effect.** the proof

**Correction/version search.** new

**Search record.**

- arXiv version history for 2106.00094 checked 2026-10-06: v3 remains the latest listed version; earlier versions not compared.
- Author research page https://sites.google.com/view/jufengwu/research and public title/author erratum/correction searches checked 2026-10-06: no correction for this article located. The linked erratum is for another article.
- No page-by-page version-of-record comparison; findings confined to the hashed public preprint. No claim of priority or exhaustive search.
- Independent review checked the Springer version-of-record metadata and attempted its PDF on 2026-10-06; only an access preview was served. No published-text verification or claim of priority.
- Independent assembly review on 2026-10-20 checked the hashed source at this locator. Version-of-record scope is retained; the DRW journal full text remains uncollated.

**Independent review.** confirmed — Definition3.1.14(v) p25 drops the strict-level plus from the first direct-limit term; the neighbouring cusp and ordinary Iwahori definitions keep the two levels distinct.

Earlier review verdicts are retained in the packet’s `reviewHistory`; the verdict above is this assembly review.

### OverconvergentAutomorphicForms/E-O8-8

**Misprint**, [drw-v3](#source-drw-v3), Remark 3.3.9, p. 34 (rendered); arXiv v3 only.

**Source claim or problem.** γ ∈ Γ(pn)

**Corrected use.** Use γ∈Iw+_GSp for representatives of the Iw+_GSp/Γ(p^n) quotient action.

**Reason.** The principal congruence subgroup already acts trivially under the twisted action on the displayed invariant sheaf. Its elements alone cannot define the remaining finite quotient action.

**Effect.** the proof

**Correction/version search.** new

**Search record.**

- arXiv version history for 2106.00094 checked 2026-10-06: v3 remains the latest listed version; earlier versions not compared.
- Author research page https://sites.google.com/view/jufengwu/research and public title/author erratum/correction searches checked 2026-10-06: no correction for this article located. The linked erratum is for another article.
- No page-by-page version-of-record comparison; findings confined to the hashed public preprint. No claim of priority or exhaustive search.
- Independent review checked the Springer version-of-record metadata and attempted its PDF on 2026-10-06; only an access preview was served. No published-text verification or claim of priority.
- Independent assembly review on 2026-10-20 checked the hashed source at this locator. Version-of-record scope is retained; the DRW journal full text remains uncollated.

**Independent review.** confirmed — The invariant sheaf in Remark3.3.9 p34 already has trivial Γ(p^n) action. The residual quotient action needs lifts in Iw+_GSp, not elements of that trivial kernel.

Earlier review verdicts are retained in the packet’s `reviewHistory`; the verdict above is this assembly review.

### OverconvergentAutomorphicForms/E-O8-9

**Error**, [drw-v3](#source-drw-v3), Proposition 3.3.10, construction Ψ2 and display defining Φ, p. 36 (rendered); arXiv v3 only.

**Source claim or problem.** g|U(w)GLg,0 = 1

**Corrected use.** Functions descending through the quotient must be invariant under right translation by U^(w), meaning g(xu)=g(x); they need not take the value 1 there.

**Reason.** The claimed map is an isomorphism of modules. The zero function on the source maps to zero on the quotient parametrization, while the printed target excludes zero. Right-unipotent invariance gives the requisite linear subspace.

**Effect.** the proof

**Correction/version search.** new

**Search record.**

- arXiv version history for 2106.00094 checked 2026-10-06: v3 remains the latest listed version; earlier versions not compared.
- Author research page https://sites.google.com/view/jufengwu/research and public title/author erratum/correction searches checked 2026-10-06: no correction for this article located. The linked erratum is for another article.
- No page-by-page version-of-record comparison; findings confined to the hashed public preprint. No claim of priority or exhaustive search.
- Independent review checked the Springer version-of-record metadata and attempted its PDF on 2026-10-06; only an access preview was served. No published-text verification or claim of priority.
- Independent assembly review on 2026-10-20 checked the hashed source at this locator. Version-of-record scope is retained; the DRW journal full text remains uncollated.

**Independent review.** confirmed — In Proposition3.3.10 p36, the normalized target condition omits zero. A claimed linear isomorphism cannot have that target. Right-unipotent invariance gives the quotient condition without fixing a nonzero value.

Earlier review verdicts are retained in the packet’s `reviewHistory`; the verdict above is this assembly review.

### OverconvergentAutomorphicForms/E-O8-10

**Error**, [drw-v3](#source-drw-v3), Proposition 3.3.10, constructions Ψ1 and Ψ2, pp. 35–36 (rendered p. 36); arXiv v3 only.

**Source claim or problem.** γ‡a + z γ‡c

**Corrected use.** Replace the antidiagonal transpose of J=a+zc by J‡=a‡+c‡z when z‡=z. Recheck both intertwiners, their representation convention and ensuing comparison rather than changing a single occurrence.

**Reason.** Transpose is an antihomomorphism. With W=[0,1;1,0], z=E12, c=qE21, a=d=I,b=0, q=p^n≠0, the symplectic principal-level element has J=diag(1+q,1). Therefore J‡=diag(1,1+q), whereas a‡+zc‡=diag(1+q,1). The printed Ψ2 equality s W W J W=s W transpose(a‡+zc‡) fails in these coordinates. The corrected finite identity is a node with two genus-two acceptance examples.

**Effect.** the proof

**Correction/version search.** new

**Search record.**

- arXiv version history for 2106.00094 checked 2026-10-06: v3 remains the latest listed version; earlier versions not compared.
- Author research page https://sites.google.com/view/jufengwu/research and public title/author erratum/correction searches checked 2026-10-06: no correction for this article located. The linked erratum is for another article.
- No page-by-page version-of-record comparison; findings confined to the hashed public preprint. No claim of priority or exhaustive search.
- Independent review checked the Springer version-of-record metadata and attempted its PDF on 2026-10-06; only an access preview was served. No published-text verification or claim of priority.
- Independent assembly review on 2026-10-20 checked the hashed source at this locator. Version-of-record scope is retained; the DRW journal full text remains uncollated.

**Independent review.** confirmed — The Ψ computations on pp35–36 use the wrong order after antidiagonal transpose. For Z=E12, C=qE21 and A=D=I, the true dual factor is diag(1,1+q); the printed order gives diag(1+q,1). This refutes that intertwining step, not the main theorem by itself.

Earlier review verdicts are retained in the packet’s `reviewHistory`; the verdict above is this assembly review.

### OverconvergentAutomorphicForms/E-O8-11

**Gap**, [drw-v3](#source-drw-v3), §3.4 definition of the classical sheaf, pp. 37–38 (rendered p. 38); arXiv v3 only.

**Source claim or problem.** ϑ∗OM[k∨]

**Corrected use.** On the full GL_g frame torsor, specify right-unipotent invariance as well as the torus character, or work on the corresponding flag quotient with its torus torsor. Use B4 associated finite-dimensional representations for the bundle comparison.

**Reason.** A torus eigenspace of regular functions on GL_g is generally larger than the finite-dimensional Borel-equivariant induced representation used in Definition 3.4.2(ii). For g=2, weight zero, the regular function x11*x22/det(x) is invariant under right diagonal multiplication but not under a general right upper-unipotent multiplication. Thus torus equivariance alone does not give the coefficient space appearing in Proposition 3.4.3.

**Effect.** a stated result

**Correction/version search.** new

**Search record.**

- arXiv version history for 2106.00094 checked 2026-10-06: v3 remains the latest listed version; earlier versions not compared.
- Author research page https://sites.google.com/view/jufengwu/research and public title/author erratum/correction searches checked 2026-10-06: no correction for this article located. The linked erratum is for another article.
- No page-by-page version-of-record comparison; findings confined to the hashed public preprint. No claim of priority or exhaustive search.
- Independent review checked the Springer version-of-record metadata and attempted its PDF on 2026-10-06; only an access preview was served. No published-text verification or claim of priority.
- Independent assembly review on 2026-10-20 checked the hashed source at this locator. Version-of-record scope is retained; the DRW journal full text remains uncollated.

**Independent review.** confirmed — The classical description on pp37–38 imposes only torus equivariance on a full GL_g frame torsor, omitting Borel-unipotent equivariance. At weight zero x11x22/det is torus invariant and nonconstant along an upper-unipotent orbit, exposing the larger space.

Earlier review verdicts are retained in the packet’s `reviewHistory`; the verdict above is this assembly review.

### OverconvergentAutomorphicForms/E-O8-12

**Misprint**, [drw-v3](#source-drw-v3), Remark 3.6.5(i), p.44 (rendered), against Definition 3.6.4(ii).

**Source claim or problem.** w′ > w

**Corrected use.** The immediate implication from the definition is w-ordinary implies w′-ordinary for 0<w′≤w.

**Reason.** The defining condition is HT(α(e_i))∈p^wω. For w′>w, p^wω contains p^w′ω, so membership in the former gives no membership in the latter. The decreasing-domain direction agrees with the period-radius definition.

**Effect.** a stated result

**Correction/version search.** new

**Search record.**

- arXiv version history for 2106.00094 checked 2026-10-06: v3 remains the latest listed version; earlier versions not compared.
- Author research page https://sites.google.com/view/jufengwu/research and public title/author erratum/correction searches checked 2026-10-06: no correction for this article located. The linked erratum is for another article.
- No page-by-page version-of-record comparison; findings confined to the hashed public preprint. No claim of priority or exhaustive search.
- Independent review checked the Springer version-of-record metadata and attempted its PDF on 2026-10-06; only an access preview was served. No published-text verification or claim of priority.
- Independent assembly review on 2026-10-20 checked the hashed source at this locator. Version-of-record scope is retained; the DRW journal full text remains uncollated.

**Independent review.** confirmed — Definition3.6.4(ii) and Remark3.6.5(i) p44 give congruences modulo p^w. Such a congruence implies the one modulo p^w′ for w′≤w; the printed increasing-w direction is reversed.

Earlier review verdicts are retained in the packet’s `reviewHistory`; the verdict above is this assembly review.

### OverconvergentAutomorphicForms/E-O8-13

**Gap**, [drw-v3](#source-drw-v3), Corollary 3.6.13 and its proof, p.47 (rendered), against Proposition 3.6.12 on the same page.

**Source claim or problem.** ((2g−1)p)/(2g(p−1)) < w ≤ n

**Corrected use.** The stated invocation of Proposition 3.6.12 requires c_g+n−1<w≤n. Use that stronger inequality for this argument. A uniform v<1/(2p^(n−1)) additionally needs a uniform-domain argument, not just a v chosen separately for each point.

**Reason.** For n>1 the printed corollary omits the n−1 term required by its cited proposition. The final sentence finds a strict Hodge bound pointwise and then uses a single v for the inclusion without supplying the uniform step. This extraction establishes a proof gap, not a counterexample to the corollary or to cofinality.

**Effect.** the proof

**Correction/version search.** new

**Search record.**

- arXiv version history for 2106.00094 checked 2026-10-06: v3 remains the latest listed version; earlier versions not compared.
- Author research page https://sites.google.com/view/jufengwu/research and public title/author erratum/correction searches checked 2026-10-06: no correction for this article located. The linked erratum is for another article.
- No page-by-page version-of-record comparison; findings confined to the hashed public preprint. No claim of priority or exhaustive search.
- Independent review checked the Springer version-of-record metadata and attempted its PDF on 2026-10-06; only an access preview was served. No published-text verification or claim of priority.
- Independent assembly review on 2026-10-20 checked the hashed source at this locator. Version-of-record scope is retained; the DRW journal full text remains uncollated.

**Independent review.** confirmed — On p47, Proposition3.6.12 requires c_g+n−1<w≤n, stronger than the following corollary assumes when n>1. Moreover point-dependent strict Hodge bounds alone do not supply a common affinoid bound. The quantitative comparison stays an explicit T3 obligation; no counterexample to cofinality is asserted.

Earlier review verdicts are retained in the packet’s `reviewHistory`; the verdict above is this assembly review.

### OverconvergentAutomorphicForms/E-O8-14

**Misprint**, [drw-v3](#source-drw-v3), Appendix B.2, p.104, universal 1-motive, compared with §B.1 p.102.

**Source claim or problem.** [V′⊥/V′ → G_V′]

**Corrected use.** Use [V/V′⊥→G_V′], as in the boundary-chart construction on p.102.

**Reason.** For V′ of rank r the lattice in the chart 1-motive has rank r, while V′⊥/V′ has rank 2g−2r. In the maximal isotropic case r=g the printed lattice is zero although the chart requires a rank-g lattice. The earlier display has the correct quotient.

**Effect.** the proof

**Correction/version search.** new

**Search record.**

- arXiv version history for 2106.00094 checked 2026-10-06: v3 remains the latest listed version; earlier versions not compared.
- Author research page https://sites.google.com/view/jufengwu/research and public title/author erratum/correction searches checked 2026-10-06: no correction for this article located. The linked erratum is for another article.
- No page-by-page version-of-record comparison; findings confined to the hashed public preprint. No claim of priority or exhaustive search.
- Independent review checked the Springer version-of-record metadata and attempted its PDF on 2026-10-06; only an access preview was served. No published-text verification or claim of priority.
- Independent assembly review on 2026-10-20 checked the hashed source at this locator. Version-of-record scope is retained; the DRW journal full text remains uncollated.

**Independent review.** confirmed — AppendixB pp102/104 distinguishes the rank-r degeneration lattice V/V′⊥ from the symplectic quotient V′⊥/V′ of rank 2g−2r. At r=g the printed latter choice is zero, so it cannot be the required rank-g lattice.

Earlier review verdicts are retained in the packet’s `reviewHistory`; the verdict above is this assembly review.

### OverconvergentAutomorphicForms/E-O8-15

**Misprint**, [drw-v3](#source-drw-v3), §3.6 definition of Fℓ×_can,w, p.42 (rendered), after the [Z′,I] coordinate display; arXiv v3 only.

**Source claim or problem.** z_i,j(x)

**Corrected use.** Use the primed canonical-chart coordinates z′_i,j(x) in the radius condition defining Fℓ×_can,w. Keep its infimum over pZ_p and radius p^(−w).

**Reason.** The preceding display defines [Z′,I] coordinates on Fℓ×_can. The unprimed Z chart of §2.3 is [I,Z] and is not defined at the canonical origin [0,I], where Z′=0 is defined. Remark 3.6.2 on p.43 gives Z′=−pZ under Atkin–Lehner, so these coordinate functions cannot be identified on the same point.

**Effect.** a stated result

**Correction/version search.** new

**Search record.**

- arXiv version history for 2106.00094 checked 2026-10-06: v3 remains the latest listed version; earlier versions not compared.
- Author research page https://sites.google.com/view/jufengwu/research and public title/author erratum/correction searches checked 2026-10-06: no correction for this article located. The linked erratum is for another article.
- No page-by-page version-of-record comparison; findings confined to the hashed public preprint. No claim of priority or exhaustive search.
- Independent review checked the Springer version-of-record metadata and attempted its PDF on 2026-10-06; only an access preview was served. No published-text verification or claim of priority.
- Independent assembly review on 2026-10-20 checked the hashed source at this locator. Version-of-record scope is retained; the DRW journal full text remains uncollated.

**Independent review.** confirmed — The canonical chart on p42 uses [Z′,I], defined at its origin, whereas the earlier [I,Z] chart is not defined there. Remark3.6.2 p43 relates their coordinates after Atkin–Lehner by Z′=−pZ. The unprimed symbol in the canonical-domain definition cannot be used literally.

Earlier review verdicts are retained in the packet’s `reviewHistory`; the verdict above is this assembly review.

### OverconvergentAutomorphicForms/E-O8-16

**Error**, [drw-v3](#source-drw-v3), Definition 3.1.14(ii), p.24, sentence after the analytic coefficient presheaf display; arXiv v3 only.

**Source claim or problem.** The source additionally describes this as a uniform Cp-Banach algebra sheaf.

**Corrected use.** The accusation is rejected. Under pointwise multiplication on the full Iwahori, weights multiply, so that operation does not preserve a nontrivial fixed weight. But Remark3.1.11 explicitly transports an algebra structure from functions on the opposite unipotent through restriction. For ℓ=ub, the transported product is (f⋆g)(ub)=κ(b)f(u)g(u), with unit eκ(ub)=κ(b). The coefficient representation and its equivariant sheaf are used as modules; an algebra structure on each coefficient space does not make every translating action an algebra automorphism.

**Reason.** Remark3.1.11 p23 supplies the missing interpretation: restriction Cκ(Iw,B)≅C(Uopp,B) is used to give the coefficient its uniform Banach algebra. Pointwise multiplication on Iw is a different product. The genus-one square computation in the earlier review only disproves closure under that different product, so it does not refute Definition3.1.14(ii). Compatibility of an algebra structure with the full automorphic equalizer is a separate question, not established by that example.

**Effect.** nothing

**Correction/version search.** Not an established source error; earlier confirmation retained in reviewHistory.

**Search record.**

- arXiv version history for 2106.00094 checked 2026-10-06: v3 remains the latest listed version; earlier versions not compared.
- Author research page https://sites.google.com/view/jufengwu/research and public title/author erratum/correction searches checked 2026-10-06: no correction for this article located. The linked erratum is for another article.
- No page-by-page version-of-record comparison; findings confined to the hashed public preprint. No claim of priority or exhaustive search.
- Independent review checked the Springer version-of-record metadata and attempted its PDF on 2026-10-06; only an access preview was served. No published-text verification or claim of priority.
- Independent assembly review on 2026-10-20 checked the hashed source at this locator. Version-of-record scope is retained; the DRW journal full text remains uncollated.

**Independent review.** rejected — Remark3.1.11 p23 supplies the missing interpretation: restriction Cκ(Iw,B)≅C(Uopp,B) is used to give the coefficient its uniform Banach algebra. Pointwise multiplication on Iw is a different product. The genus-one square computation in the earlier review only disproves closure under that different product, so it does not refute Definition3.1.14(ii). Compatibility of an algebra structure with the full automorphic equalizer is a separate question, not established by that example.

Earlier review verdicts are retained in the packet’s `reviewHistory`; the verdict above is this assembly review.

### OverconvergentAutomorphicForms/E-O8-17

**Error**, [drw-v3](#source-drw-v3), Definition 3.1.10 and Remark 3.1.12 p23; Definition 3.1.13 p24; compared with entrywise thickening in §2.1 p9 (hashed arXiv v3 only).

**Source claim or problem.** The normalized r-analytic coefficient functions are asserted to extend to Iw^(r) and carry the full Iw+,(r) transpose-translation action.

**Corrected use.** Their normalized lower coordinates are u_ij/p, so r-analytic functions extend on Iw M_(r+1). Use only the action of Iw+ M_(r+1). The actual geometric factor A+ZC lies in that smaller neighbourhood because C has entries divisible by p; thus the coefficient sheaf formula can retain Cκ^(w-an) after adding this estimate.

**Reason.** For g=2, κ=1, integer r≥3 and a∈C_p with v_p(a)=r−1/2, 1/(t−a) is analytic on every radius-p^(−r) disc centered in Z_p, but has a pole inside the radius-p^(1−r) disc at zero required by entry-thickening p^(−r). The element h=I+p a E12 lies in M_r, and hᵀ has normalized lower coordinate a, so the claimed natural translate is undefined even at the identity. Multiplying this function by a scalar puts it in a bounded Gauss ball without removing the pole. Conversely J−(A+Z0C)=(Z−Z0)C has norm at most p^(−(w+1)).

**Effect.** a stated result

**Correction/version search.** No correction found in the latest listed arXiv v3 or its landing-page history as checked 2026-10-20. The published full text could not be inspected, so no claim of novelty or of persistence there is made.

**Search record.**

- https://arxiv.org/abs/2106.00094 (v3 latest, checked 2026-10-20)
- https://arxiv.org/pdf/2106.00094v3 (Definitions 3.1.10–3.1.13 and §2.1)
- https://doi.org/10.1007/s40687-026-00610-5 (publisher full text not accessible as a PDF)
- Independent assembly review on 2026-10-20 checked the hashed source at this locator. Version-of-record scope is retained; the DRW journal full text remains uncollated.

**Independent review.** confirmed — Definition3.1.10 p23 normalizes the lower coordinate by p; §2.1 p9 thickens matrix entries. Thus normalized radius p^(−r) needs entry radius p^(−r−1). For the recorded genus-two function 1/(t−a), v_p(a)=r−1/2, translation by h=I+paE12 in M_r reaches its pole at the identity. The smaller H_(r+1) action is valid; the geometric factor has precisely that extra p.

### OverconvergentAutomorphicForms/E7

**Gap**, [BHW-2023](#source-bhw-2023), Definition8.17(2), p1773, compared with Lemma9.2 and its proof, pp1781–1782 (published version).

**Source claim or problem.** The finite effective level quotient kills all units congruent to one modulo N. The representative-independence proof later checks only totally positive units and their closure.

**Corrected use.** Use U_N={η∈O_F^×:η≡1 mod N} and its full p-adic closure in every central kernel. For N≥4, N_{F/Q}(η) is ±1 and is 1 modulo N, hence equals 1. The arithmetic multiplier therefore cancels for all U_N, and by continuity for its closure, without requiring total positivity.

**Reason.** Definition8.17 explicitly uses the all-unit congruence quotient. Positivity cannot replace it: in Q(√3), −7−4√3 is a unit congruent to 1 modulo 4 with both real embeddings negative. A proof restricted to positive units omits this representative change. The norm-congruence argument repairs the proof; it does not contradict the well-definedness conclusion.

**Effect.** the proof

**Correction/version search.** Previously recorded in the atlas supplier; no published correction located.

**Search record.**

- Centre Mersenne article page https://aif.centre-mersenne.org/articles/10.5802/aif.3560/ checked 2026-10-20: no erratum link found.
- https://arxiv.org/abs/1902.03985 checked 2026-10-20: v4 (10 May2021) is the latest listed version.
- https://bheuer.github.io/ and public title/author erratum/correction searches checked 2026-10-20: no published correction located. Existing supplier findings are cross-referenced below; no novelty claim or author contact.

**Also recorded by the supplier.** `PerfectoidShimuraVarieties/E29`

**Independent review.** confirmed — Definition8.17 explicitly uses the all-unit congruence quotient. Positivity cannot replace it: in Q(√3), −7−4√3 is a unit congruent to 1 modulo 4 with both real embeddings negative. A proof restricted to positive units omits this representative change. The norm-congruence argument repairs the proof; it does not contradict the well-definedness conclusion.

### OverconvergentAutomorphicForms/E8

**Gap**, [BHW-2023](#source-bhw-2023), Proof of Proposition5.18, pp1752–1753, the integral embedding-product identification (published version).

**Source claim or problem.** The proof treats O_p⊗O_C as the product of its embedding factors and uses that integral description to compare the Hodge–Tate kernel with the canonical subgroup at ramified p.

**Corrected use.** Split only after passing to the generic field. Before splitting, keep the saturated kernel and the O_F/p^n-linear canonical generator unsplit and use scalar O_C conormal-degree estimates. The missing generator/refinement is retained in the existing T4 request; no ramified integral product is assumed.

**Reason.** For O_L=Z_p[π] with π²=p at odd p, evaluation O_C[X]/(X²−p)→O_C×O_C has image pairs whose difference is divisible by 2π. The pair (1,0) is absent. Thus the natural embedding map is not an integral product isomorphism, although it becomes one over C. This invalidates that proof step in ramified cases without giving a counterexample to the inclusion theorem.

**Effect.** the proof

**Correction/version search.** Previously recorded in the atlas supplier; no published correction located.

**Search record.**

- Centre Mersenne article page https://aif.centre-mersenne.org/articles/10.5802/aif.3560/ checked 2026-10-20: no erratum link found.
- https://arxiv.org/abs/1902.03985 checked 2026-10-20: v4 (10 May2021) is the latest listed version.
- https://bheuer.github.io/ and public title/author erratum/correction searches checked 2026-10-20: no published correction located. Existing supplier findings are cross-referenced below; no novelty claim or author contact.

**Also recorded by the supplier.** `PerfectoidShimuraVarieties/E36`

**Independent review.** confirmed — For O_L=Z_p[π] with π²=p at odd p, evaluation O_C[X]/(X²−p)→O_C×O_C has image pairs whose difference is divisible by 2π. The pair (1,0) is absent. Thus the natural embedding map is not an integral product isomorphism, although it becomes one over C. This invalidates that proof step in ramified cases without giving a counterexample to the inclusion theorem.

### OverconvergentAutomorphicForms/E9

**Error**, [BHW-2023](#source-bhw-2023), Proof of Lemma8.28, p1779, contracted-product descent of the period map (published version).

**Source claim or problem.** Projection to the first factor of X_{Γ*(p∞)}×O_p^× is asserted to give a period map invariant under the antidiagonal Z_p^× action, because that action is treated as simultaneous scalar rescaling.

**Corrected use.** Use the equivariant span map (x,u)↦diag(u,1)π_HT(x), which is invariant under (x,u)↦(diag(t,1)x,t⁻¹u), rather than π_HT(x) alone. This is the corrected S5 period map already used by O4.

**Reason.** The first-factor action in Lemma8.25 is diag(t,1). On the Hilbert affine period coordinate it sends z to tz; it is not the central scalar tI and does not fix a general period point. Multiplying by diag(u,1) cancels the antidiagonal change. The displayed projection argument therefore fails, while the corrected equivariant period map remains available.

**Effect.** the proof

**Correction/version search.** Previously recorded in the atlas supplier; no published correction located.

**Search record.**

- Centre Mersenne article page https://aif.centre-mersenne.org/articles/10.5802/aif.3560/ checked 2026-10-20: no erratum link found.
- https://arxiv.org/abs/1902.03985 checked 2026-10-20: v4 (10 May2021) is the latest listed version.
- https://bheuer.github.io/ and public title/author erratum/correction searches checked 2026-10-20: no published correction located. Existing supplier findings are cross-referenced below; no novelty claim or author contact.

**Also recorded by the supplier.** `PerfectoidShimuraVarieties/E27`

**Independent review.** confirmed — The first-factor action in Lemma8.25 is diag(t,1). On the Hilbert affine period coordinate it sends z to tz; it is not the central scalar tI and does not fix a general period point. Multiplying by diag(u,1) cancels the antidiagonal change. The displayed projection argument therefore fails, while the corrected equivariant period map remains available.

## Baseline interfaces

Each actual declaration and its hypotheses was read at the stated pinned commit. These are existing library inputs. In particular, `LinearMap.det` is the finite-free determinant here; its fallback outside finite free modules is not used. `DirectLimit.Ring.of` and `DirectLimit.Ring.lift` refer to the ring construction. `mul_zpow` is used in a commutative group.

| Declaration | Pinned module | Scope used |
|---|---|---|
| `mathlib:Algebra.TensorProduct.leftAlgebra` | `Mathlib/RingTheory/TensorProduct/Basic.lean` | The A-algebra structure on A ⊗[R] B from the left factor. |
| `mathlib:Algebra.norm` | `Mathlib/RingTheory/Norm/Defs.lean` | The norm of a finite free algebra: determinant of left multiplication. |
| `mathlib:Algebra.norm_apply` | `Mathlib/RingTheory/Norm/Defs.lean` | Algebra.norm R x = det of multiplication by x. |
| `mathlib:Algebra.norm_eq_prod_embeddings` | `Mathlib/RingTheory/Norm/Transitivity.lean` | The norm is the product of the conjugates under all embeddings into an algebraically closed field. |
| `mathlib:ContinuousMonoidHom` | `Mathlib/Topology/Algebra/ContinuousMonoidHom.lean` | Continuous monoid homomorphisms between topological monoids. |
| `mathlib:ContinuousMonoidHom.comp` | `Mathlib/Topology/Algebra/ContinuousMonoidHom.lean` | Composition of continuous monoid homs. |
| `mathlib:ContinuousMonoidHom.fst` | `Mathlib/Topology/Algebra/ContinuousMonoidHom.lean` | The first projection as a continuous monoid hom. |
| `mathlib:ContinuousMonoidHom.snd` | `Mathlib/Topology/Algebra/ContinuousMonoidHom.lean` | The second projection as a continuous monoid hom. |
| `mathlib:Ideal.span` | `Mathlib/RingTheory/Ideal/Span.lean` | The ideal generated by a set. |
| `mathlib:IsModuleTopology` | `Mathlib/Topology/Algebra/Module/ModuleTopology.lean` | The class asserting a module carries its module topology. |
| `mathlib:IsModuleTopology.continuous_of_linearMap` | `Mathlib/Topology/Algebra/Module/ModuleTopology.lean` | Linear maps between modules with the module topology are continuous. |
| `mathlib:IsModuleTopology.isTopologicalRing` | `Mathlib/Topology/Algebra/Module/ModuleTopology.lean` | A finite algebra with the module topology over a topological ring is a topological ring. |
| `mathlib:IsTopologicalRing` | `Mathlib/Topology/Algebra/Ring/Basic.lean` | Topological rings. |
| `mathlib:LinearMap.det` | `Mathlib/LinearAlgebra/Determinant.lean` | The determinant of an endomorphism over a commutative ring; the finite-free branch is used for the local norm. Its fallback outside finite free modules is not used. |
| `mathlib:LinearMap.det_baseChange` | `Mathlib/LinearAlgebra/Charpoly/BaseChange.lean` | The determinant commutes with base change. |
| `mathlib:Module.Finite.base_change` | `Mathlib/RingTheory/TensorProduct/Finite.lean` | Base change of a finite module is finite. |
| `mathlib:Module.Free.tensor` | `Mathlib/LinearAlgebra/TensorProduct/Basis.lean` | Tensor products of free modules are free. |
| `mathlib:Module.finrank_baseChange` | `Mathlib/LinearAlgebra/Dimension/Constructions.lean` | finrank of a base change equals the finrank of the original module. |
| `mathlib:NumberField.IsTotallyReal` | `Mathlib/NumberTheory/NumberField/InfinitePlace/TotallyRealComplex.lean` | A number field all of whose complex embeddings are real. |
| `mathlib:NumberField.RingOfIntegers` | `Mathlib/NumberTheory/NumberField/Basic.lean` | The ring of integers 𝓞 K of a number field. |
| `mathlib:NumberField.RingOfIntegers.rank` | `Mathlib/NumberTheory/NumberField/Basic.lean` | The ℤ-rank of 𝓞 K is [K : ℚ]. |
| `mathlib:NumberField.isUnit_iff_norm` | `Mathlib/NumberTheory/NumberField/Units/Basic.lean` | For an algebraic integer, being a unit is equivalent to absolute value of its field norm being 1; the integer norm ±1 description follows from integrality. |
| `mathlib:PadicInt` | `Mathlib/NumberTheory/Padics/PadicIntegers.lean` | The p-adic integers ℤ_[p]. |
| `mathlib:PadicInt.compactSpace` | `Mathlib/NumberTheory/Padics/ProperSpace.lean` | ℤ_[p] is compact. |
| `mathlib:Rat.ringOfIntegersEquiv` | `Mathlib/NumberTheory/NumberField/Basic.lean` | The ring of integers of ℚ is ℤ. |
| `mathlib:Subgroup` | `Mathlib/Algebra/Group/Subgroup/Defs.lean` | Subgroups of a group. |
| `mathlib:Subgroup.FiniteIndex` | `Mathlib/GroupTheory/Index.lean` | Finite-index subgroups. |
| `mathlib:TensorProduct` | `Mathlib/LinearAlgebra/TensorProduct/Defs.lean` | The tensor product of modules over a commutative semiring. |
| `mathlib:Units.map` | `Mathlib/Algebra/Group/Units/Hom.lean` | The map on units induced by a monoid hom. |
| `mathlib:moduleTopology` | `Mathlib/Topology/Algebra/Module/ModuleTopology.lean` | The module topology: the finest topology making addition and scalar multiplication continuous. |
| `mathlib:Representation` | `Mathlib/RepresentationTheory/Basic.lean` | For a semiring k, monoid G and k-module V, a monoid hom G→*Module.End k V; continuity is extra. |
| `mathlib:Representation.tprod` | `Mathlib/RepresentationTheory/Basic.lean` | Tensor product action on V⊗[k]W over a commutative semiring, with the same monoid. |
| `mathlib:Representation.dual` | `Mathlib/RepresentationTheory/Basic.lean` | For a group G over a commutative ring, contragredient action on Module.Dual k V by precomposition with ρ(g⁻¹). |
| `mathlib:Representation.invariants` | `Mathlib/RepresentationTheory/Invariants.lean` | The submodule of vectors fixed by every group element. |
| `mathlib:ContinuousLinearMap` | `Mathlib/Topology/Algebra/Module/ContinuousLinearMap/Basic.lean` | Continuous semilinear map of topological modules; bounded Banach operators are a specialisation. |
| `mathlib:SheafOfModules` | `Mathlib/Algebra/Category/ModuleCat/Sheaf.lean` | A presheaf of modules on a site whose underlying additive presheaf is a sheaf; no adic ringed site is supplied. |
| `tauceti:NumberField.NarrowClassGroup` | `TauCeti/NumberTheory/NumberField/NarrowClassGroup/Basic.lean` | Invertible fractional ideals modulo principal ideals generated by totally positive elements. |
| `tauceti:NumberField.NarrowClassGroup.instFinite` | `TauCeti/NumberTheory/NumberField/NarrowClassGroup/Finite.lean` | For a number field, its narrow ideal class group is finite. |
| `mathlib:Module.Projective` | `Mathlib/Algebra/Module/Projective.lean` | Projective modules are split summands of free modules; finite projectivity is expressed together with Module.Finite, without a free-basis assumption. |
| `mathlib:LinearMap.baseChange` | `Mathlib/LinearAlgebra/TensorProduct/Tower.lean` | For an R-linear map and an R-algebra A, its A-linear extension on A tensor M; algebraic, not a completed Banach base change. |
| `mathlib:Valuation` | `Mathlib/RingTheory/Valuation/Basic.lean` | A multiplicative zero-preserving map satisfying the ultrametric inequality with values in a linearly ordered commutative monoid with zero. No real-valued restriction. |
| `mathlib:Valuation.integer` | `Mathlib/RingTheory/Valuation/Integers.lean` | For a ring and a linearly ordered commutative group with zero, the subring of elements whose valuation is at most one. |
| `mathlib:DirectLimit` | `Mathlib/Order/DirectedInverseSystem.lean` | The quotient of a directed disjoint union by eventual equality. Ring structure for ring-hom transition maps is provided by Mathlib/Algebra/Colimit/DirectLimit.lean. |
| `mathlib:DirectLimit.Ring.of` | `Mathlib/Algebra/Colimit/DirectLimit.lean` | The canonical ring map from a component of a directed ring system into its direct limit. |
| `mathlib:DirectLimit.Ring.lift` | `Mathlib/Algebra/Colimit/DirectLimit.lean` | Compatible component ring maps induce a ring map out of the directed limit; used for precision reduction after the level colimit. |
| `mathlib:Ideal.Quotient.lift` | `Mathlib/RingTheory/Ideal/Quotient/Defs.lean` | A ring map killing an ideal descends to its quotient; supplies finite-level reduction pullbacks. |
| `mathlib:Ideal.Quotient.factor` | `Mathlib/RingTheory/Ideal/Quotient/Defs.lean` | An inclusion of ideals induces a ring map from the smaller-ideal quotient to the larger-ideal quotient; supplies decreasing p-adic precision. |
| `mathlib:AdicCompletion` | `Mathlib/RingTheory/AdicCompletion/Basic.lean` | Compatible inverse-limit families in module quotients by ideal powers. Mathlib/RingTheory/AdicCompletion/Algebra.lean supplies the componentwise commutative ring structure for completion of the ring. |
| `mathlib:Matrix.fromCols` | `Mathlib/Data/Matrix/ColumnRowPartitioned.lean` | The row graph [I,Z] as a rectangular matrix with a sum-indexed column set. |
| `mathlib:Matrix.fromCols_mul_fromBlocks` | `Mathlib/Data/Matrix/ColumnRowPartitioned.lean` | [U,V][A,B;C,D]=[UA+VC,UB+VD] over a semiring. |
| `mathlib:Matrix.mul_fromCols` | `Mathlib/Data/Matrix/ColumnRowPartitioned.lean` | Left multiplication distributes across a column partition. |
| `mathlib:Matrix.fromBlocks_multiply` | `Mathlib/Data/Matrix/Block.lean` | The four block entries of a product, retaining multiplication order. |
| `mathlib:Matrix.isUnit_iff_isUnit_det` | `Mathlib/LinearAlgebra/Matrix/NonsingularInverse.lean` | A square matrix over a commutative ring is a unit exactly when its determinant is a unit. |
| `mathlib:Matrix.mul_nonsing_inv` | `Mathlib/LinearAlgebra/Matrix/NonsingularInverse.lean` | J J⁻¹=1 under IsUnit(det J); total matrix inversion alone gives no cancellation. |
| `mathlib:Matrix.nonsing_inv_mul` | `Mathlib/LinearAlgebra/Matrix/NonsingularInverse.lean` | J⁻¹ J=1 under IsUnit(det J). |
| `mathlib:Matrix.GeneralLinearGroup.det` | `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean` | The multiplicative map GL(n,R)→R× taking a matrix unit to its determinant unit. |
| `mathlib:Matrix.det_mul` | `Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean` | Multiplicativity of determinant over commutative rings. |
| `mathlib:Matrix.transpose_mul` | `Mathlib/Data/Matrix/Mul.lean` | Transpose reverses the order of a matrix product. |
| `mathlib:mul_zpow` | `Mathlib/Algebra/Group/Basic.lean` | Integer powers distribute across products in a commutative group, including units of a commutative ring. |
| `mathlib:map_inv` | `Mathlib/Algebra/Group/Hom/Defs.lean` | A group homomorphism preserves inversion. |
| `mathlib:Module.Basis.det_apply` | `Mathlib/LinearAlgebra/Determinant.lean` | The determinant of a vector family relative to a basis is the determinant of its coordinate matrix. |
| `mathlib:AlternatingMap.eq_smul_basis_det` | `Mathlib/LinearAlgebra/Determinant.lean` | A top-degree scalar-valued alternating map equals its value on the basis times the basis determinant. |
| `mathlib:LinearMap` | `Mathlib/Algebra/Module/LinearMap/Defs.lean` | Bundled linear maps, including S-linear maps into the pointwise function module; reused for the specific determinant eigenline embedding. |
| `mathlib:Matrix.GeneralLinearGroup.mkOfDetNeZero` | `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean` | A genuine general linear group element from a square matrix over a field with nonzero determinant; used in concrete genus-two tests. |
| `mathlib:Matrix.det_transpose` | `Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean` | Transpose preserves determinant; converts the determinant eigenline translation law to the source transpose-left action. |

## Assembly checks and implementation boundary

The stock packet checker validates the four new nodes and resolves the imported IDs in the retained part packets. A separate expanded validation uses all 96 effective contracts with the unchanged checker: full internal acyclicity, prerequisite resolution, definition API/tests, stage coverage and planet bounds. Import hashes and the complete imported ID sets were checked, so the catalogue cannot silently omit a retained target. The reader reproduces every effective statement, hypothesis, API and test; its internal anchors and file links are checked separately.

The 96 targets comprise 5 definitions, 32 constructions, 13 lemmas, 30 theorems, 13 comparisons and 3 applications. They have 139 named API items in total, of which 138 are the outlines attached to definitions/constructions, and 117 definition/construction tests. There are 38 planets, 65 baseline declarations, 26 source-finding records (25 confirmed, one rejected), 11 residual gap records and 11 supplier requests. Every implementation status is unchecked. All O0–O8 coverage records are planned, with the explicit remaining inputs above.

The suggested file elaborates at the pins with 17 admitted-theorem warnings and no other warnings or errors. Its seven proved examples check the inverse norm sign, the square weight, the determinant line, noncommuting factor order, the dual-factor order and the constant symplectic-basis conversion. Its real-bodied definitions use library types; none supplies a geometric construction or an admitted data definition. The reader is authoritative for all targets, including the integral and geometric comparisons whose carriers are supplied by other roadmaps.
