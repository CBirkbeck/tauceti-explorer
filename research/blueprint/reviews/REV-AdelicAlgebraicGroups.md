# REV-AdelicAlgebraicGroups — independent review

**Verdict: needs_changes.** This is the completed review of issue [#341](https://github.com/CBirkbeck/tauceti-explorer/issues/341), by Codex, session `codex-vV40Ys`, dated 2026-10-06. The input was another worker's BP-AdelicAlgebraicGroups packet and suggested file. This submission is **not a checkpoint**. The blueprint needs revision because some proofs have circular or missing nonroutine inputs and several suggested declarations do not express their packet statements. Clear repairs are applied in place. No mathematics is claimed formalized.

The complete per-node record is the packet's `review.checked`: every original node and every added node has a verdict and evidence. `unverifiable` distinguishes an unresolved argument or prototype contract from a verified source quotation. A verified mathematical lemma remains conditional on its explicit prerequisites; it does not certify an unresolved prerequisite or the entire suggested file.

## Scope and counts

Read all 201 original nodes, including their statements, hypotheses, proofs, direct dependencies, uses, acceptance checks and source citations; all 88 original baseline declarations at the pins; all 216 original API entries, 144 tests and 25 planets; the entire suggested file; every supplier request; the reviewed library audit for all six stages; the three assigned red-team findings; and all eight original source issues. The source audit checked 238 original node citations, comprising 220 distinct locator/excerpt pairs in 13 public source PDFs. Original source PDF hashes match the packet. The two published BKT/Khayutin copies were additionally collated, and both the BKT erratum and the Calegari–Geraghty Correction were read in full.

Final counts: **204 nodes, 93 baseline declarations, 220 API entries, 144 packet tests, 25 planets, 21 requests, 20 gaps, 10 source issues**. There are 48 definitions/constructions, each retaining at least three packet tests. The review has **65 verified, 10 corrected, 3 added and 126 unverifiable** node verdicts. A node with both a clear repair and an unresolved problem is counted as unverifiable, with the repair recorded in its note.

| Stage | Nodes | Planets | Coverage after review |
| --- | ---: | ---: | --- |
| AA.0 | 22 | 1 | partial; precise remaining list in packet |
| AA.1 | 29 | 3 | partial; precise remaining list in packet |
| AA.2 | 36 | 6 | partial; precise remaining list in packet |
| AA.3 | 55 | 6 | partial; precise remaining list in packet |
| AA.4 | 49 | 5 | partial; precise remaining list in packet |
| AA.5 | 13 | 4 | partial; precise remaining list in packet |

All six `planned` claims have been changed to `partial`. The packet is also `partial`: with fewer than 300 nodes it no longer qualifies as a complete planning pass once those stage claims are withdrawn. This change concerns the reviewed plan's coverage, not completion of this independent review. The rejection is for unresolved mathematical/prototype contradictions, **not merely for having openly recorded gaps or stages left partial**.

## Mathematical repairs and unresolved proof inputs

### Haar measures and quotient conventions

The restricted-product construction may have noncompact restricting subgroups at finitely many exceptional indices. Its finite-on-compacts proof now chooses genuine compact neighbourhoods there; it does not assert finite mass of those entire subgroups. The modular-character product likewise uses compactness only at almost every index.

For the right G-action on H\G and fibre integral ∫_H f(hg), use **right Haar measures** on G and H. Left Haar on H makes the displayed fibre integral depend on the representative when H is nonunimodular. The case H=1 already distinguishes the desired right invariant quotient measure from an arbitrary left Haar measure on G. The suggested file now expresses right invariance, finite mass on compact sets and positivity on open sets directly; Mathlib's `IsHaarMeasure` itself includes left invariance. The nonnormal Bruhat-cutoff/Riesz/disintegration proof is still an explicit gap. `IsSES.inducedMeasure` constructs a middle-group measure from an already supplied subgroup and quotient, and does not prove this general quotient-existence theorem.

For a left-invariant gauge form, pullback by R_g scales by det(Ad g)⁻¹, while **pushforward of its measure** scales by |det(Ad g)|. The packet API and Lean signature now agree with the pinned Mathlib modular-character convention. The Borel subgroup detects the inverse error.

The left-orbit fundamental-domain construction now uses Vg_n with VV⁻¹∩Γ={1}. In the nonabelian case γv₁g=v₂g cancels g; arbitrary gV does not provide that argument. The mass-only baseline lemma has been replaced with `IsFundamentalDomain.quotientMeasure_eq`. A new inversion bridge handles Mathlib's right Γ.op-orbit unfolding convention and retains both integrability and AEStronglyMeasurable assumptions.

### Tamagawa normalization and central characters

Vanishing of rational characters does not permit omitting all Artin convergence factors: an anisotropic norm-one torus has no rational characters and a nonzero geometric character lattice. The repaired omission condition is zero **geometric** character lattice.

Corrected good-place volumes need not eventually equal 1. Already for SL_n, n≥2, they are ∏_{i=2}^n(1−q_v⁻ⁱ). A finite rescaling of AA.0 therefore cannot construct the Tamagawa measure. Normalize each good local factor to integral volume 1, prove a nonzero absolutely convergent product of the original volumes, and then rescale the whole restricted-product measure. This infinite-rescaling construction, its independence, and the precise number-field normalization are now explicit gaps. The Lean product has been changed from `finprod` to `tprod`, but its arbitrary ρ, λ_v and μ∞ parameters still lack the canonical-factor and convergence hypotheses.

Rosengarten §3 is a **function-field** normalization, including logarithmic/cokernel factors. It cannot prove the number-field statement simply by replacing the q/genus factor with a discriminant. Its bibliographic record has been corrected to the v3 preprint and Algebra & Number Theory 15 (2021), 1865–1920.

The gauge-form restriction/discriminant node remains unverifiable: “induced gauge form” does not specify its determinant-line/basis convention. For Res of G_a along ℚ(√5)/ℚ, an integral basis at 5 gives a coordinate Haar measure of integral-lattice volume 1; a discriminant factor by itself describes a different normalization. A faithful comparison must specify the form, basis changes, real/complex base measures and absolute-value conventions before its exponent or restriction-of-scalars theorem can be verified. Artin induction/leading-coefficient compatibility also needs its own precise prerequisites.

Central-character L² uses a **continuous** character, with the inner product conjugate-linear in the first variable. A nondiscrete central subgroup times G(F) does not fall under the discrete fundamental-domain lemma. An associated measurable line bundle or cross-section/cocycle, closedness, completeness and continuity are required. For a nontrivial ω′, the compact quotient cannot act by untwisted translation: first extend ω′ compatibly and twist, then apply compact abelian Fourier/Peter–Weyl. These nonroutine inputs are recorded rather than assumed.

### Reduction theory, heights and proof cycles

A faithful point-group homomorphism alone does not make a proper height. For G_m/ℚ, the scalar representation has height tending to 0 on x∞→0, x_f=1, whereas the scalar plus dual representation has height tending to infinity. The revised packet chooses proper **algebraic** representations containing their duals and requires the needed norm estimates. With Hilbert–Schmidt archimedean norms and complex multiplicities, height(1)=m^[F:ℚ]/2, not 1; the GL₁ formula has a square-root sum of squares at infinity. Discreteness plus compactness proves finite rational-point sets, not a polynomial counting bound. A quantitative geometry-of-numbers/denominator argument is required. The relative chamber is the kernel of the canonical projection a_{P₁}→a_{P₂}; it is not the full dual of a_{P₁}. At P₁=P₂ that kernel is zero. Strictly positive corner coordinates exclude zero.

The reduction proof has mathematical cycles even though the machine dependency graph is syntactically acyclic:

- Class-number finiteness invokes Siegel covering, whose stated reduction invokes class-number finiteness.
- The closed-orbit-finiteness argument invokes fundamental sets whose self-adjoint reduction already uses closed-orbit finiteness.
- Real finite overlap is routed through adelic finite overlap, while the latter invokes real finite overlap.

Borel §§3–4 provide the route to independent lattice/primitive reduction inputs: the lattice-intersection finiteness in §4.3 precedes self-adjoint reduction in §4.5 and the class-number theorem in §5.1. The later §5.4 consequence cannot substitute for the earlier independent input. Those declarations must be decomposed and cited directly to break the cycles. Hermite/Minkowski reduction, closed-orbit realization/finiteness, Orr/Schnell containment and the reduced-form/Siegel dictionary are nonroutine and must have explicit inputs.

A proper parabolic is nonunimodular inside reductive G. Thus P\G cannot be integrated using the invariant quotient-measure theorem with its modular-character equality hypothesis. Adelic Iwasawa needs its parabolic Jacobian/quasi-invariant integration lemma. The fixed-K restriction in the BKT erratum must also accompany each relevant real Siegel construction and containment theorem. P=G is an improper parabolic regardless of whether G is anisotropic.

### Approximation, neatness, covers and residual quotients

Rapinchuk Lemma 2.7 is over **ℚ_p**, not an arbitrary finite extension. For E/ℚ_p proper, SL₂(ℚ_p) is closed, nondiscrete and E-Zariski dense in SL₂(E), but is not open. The node is restricted to the cited field, and the arithmetic native-field and several-place strong-approximation argument is a gap. The source's sufficiency discussion explicitly treats ℚ and one isotropic place and routes the other cases elsewhere. Those cases cannot be supplied by a literal relabelling. Nonempty S₁ is required for the S-arithmetic nondiscreteness statement. Finite-covolume implies finite-index only for a **nonzero** invariant Radon measure. Borel density does not require every noncompact projection to be nondiscrete: SL₂(ℤ)⊂SL₂(ℝ) disproves that extra assertion.

The neat normal subgroup proof first needs a U_p-stable lattice (or a conjugate), then a congruence intersection and normal core. An arbitrary congruence intersection need not be normal in U. Algebraic representation independence and the p-adic root-of-unity valuation argument are nonroutine inputs, now explicit gaps.

Finiteness of rational stabilizers is stated under the **compact-modulo-A_G** hypothesis on K∞. Compact finite level forces H_G(γ)=0; intersecting K∞ with that kernel is compact, so rational discreteness gives finiteness. At neat level a finite torsion-free stabilizer is actually trivial. This proves degree [U:U′] and a canonical principal U/U′ action for normal U′. It does not give an unconditional identification with the full deck group of a disconnected cover: for G_m/ℚ, K∞=ℝ^× and principal levels 3 and 15, the base is one point and the fibre has four points. Its full deck group is S₄; the canonical level group is C₄. General Shimura centres can have infinite unit stabilizers and need their own scope/hypotheses. Full groupoid automorphisms also differ from effective stabilizers modulo the rational centre; the SL₂ elliptic example has full order 4 and effective order 2.

The Hecke translation must be supported at finite places (or normalize the archimedean level). Its prototype now requires infinite projection 1. The Cartesian statement requires U′L=U; normality of U′ alone does not imply that condition for L=U∩gUg⁻¹, nor identify the resulting pullback with the ordinary Hecke correspondence at U′. That false consequence was removed.

Local H¹ vanishing gives pointwise lifts, not automatically restricted-product lifts. Abelianization needs integral lifts at almost all good places, using the actual derived simply connected cover, connected integral fibres, Lang and Hensel lifting. The suggested arbitrary `cover` has none of those properties. Its PGL₂ residual test now uses a square-class-valued determinant, retaining surjectivity and principal-diagonal compatibility as well as the kernel condition. An arbitrary determinant lift to the full idele group is not available for PGL₂. Residual compactness needs an independent proof; the unreduced local quotient G(𝔸)/G(𝔸)^+ is not compact. Character-kernel/Chabauty or Fourier limits and homogeneous-measure pushforwards also require their own harmonic-analysis inputs.

For a quaternion division algebra at p, the unramified quadratic subfield supplies norms of all units but only even valuations. A division-algebra uniformizer supplies odd valuation. This repairs the reduced-norm proof.

### Validation examples

The finite-only level in component decomposition is `U.map finiteEmbed`, whose infinite projection is 1. A comap under the finite projection contains the **entire** archimedean group and erases the factor the displayed decomposition tries to retain.

For GL₂, use the raw action on ℍ± for GL₂(ℝ)/ℝ^×SO(2); Mathlib `glAction` folds by conjugation and always stays in ℍ. The new bridge imports the existing imaginary-part, denominator and action formulas rather than re-planning them. Full rational finite components at principal level are indexed by (ℤ/N)^×/{±1}; the positive-rational/ℍ convention has φ(N) components. O(2) versus SO(2) changes which convention is being used and must be retained in the actual level specification.

For GL₁/Q-level quotients, the complex circles have already been divided out by K∞, leaving dimension r₁+r₂−1, not additional S¹ factors. The component group retains the narrow class group and is not in general its maximal p-power exponent quotient. For definite quaternions the arithmetic subgroup has reduced norm a positive rational unit at every finite place, hence 1; it lies in the compact real norm-one group and is finite. The real mass quotient is G(ℝ)/ℝ_{>0}; ℝ_{>0} is not a subgroup of G(ℝ)^1. The Eichler level-3 local index is #ℙ¹(𝔽₃)=4, not 2.

## Baseline audit and added comparison nodes

The pins are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Every original name was found, but existence did not imply adequacy of every citation. Full surrounding statements and hypotheses were read, including the irreducible `Measure.pi`/`Measure.prod` definitions rather than similarly named outer-measure definitions. The only removed reference is the **mass-only** `mathlib:MeasureTheory.IsFundamentalDomain.measure_eq`, replaced by `quotientMeasure_eq` in the same module.

Substantive citation corrections:

- `IsFundamentalDomain.quotientMeasure_eq` compares quotient pushforwards and requires Countable, SMulInvariantMeasure and MeasurableConstSMul.
- `QuotientGroup.integral_eq_integral_automorphize` uses right Γ.op-orbits, right invariant measure, Integrable and AEStronglyMeasurable; the new inversion bridge handles left orbits in the unimodular case.
- `InfiniteAdeleRing.ringEquiv_mixedSpace` is only a ring equivalence. Two added pinned local isometry equivalences justify the new continuity bridge.
- `UpperHalfPlane.glAction` includes conjugation for negative determinant. Three added pinned formulas support the raw/folded bridge; their scalar identities are not new nodes.
- `simplyConnectedSemisimpleCommHopfAlgProperty` quantifies central isogenies **onto** G from semisimple groups; its Hopf arrow runs H→K.
- `isMulTorsionFree_geometricCharacterGroup` needs both geometricallyReduced and geometricallyConnected. A characteristic-zero finite-type group still needs the appropriate smoothness/reduced bridge in the prototype.
- `IsSES.inducedMeasure` is a normal extension theorem with an already supplied quotient measure; the nonnormal quotient construction remains a gap.
- `RestrictedProduct.unitsEquiv` is a multiplicative equivalence; the number-field supplier is asked for the topology upgrade.
- The quotient-covering theorem requires a properly discontinuous, free/canceling action and the actual quotient topology. Arbitrary topology instances are insufficient.

Added nodes, each with `addedBy: REV-AdelicAlgebraicGroups`:

1. `AA.0/mixed-space-topology`: assemble the finite-product homeomorphism from the two pinned local isometry equivalences.
2. `AA.2/left-right-quotient-inversion`: Γg↦g⁻¹Γ and transport of normalized fundamental-domain quotient measures for bi-invariant Haar measure.
3. `AA.5/upper-half-plane-action-conventions`: raw action on ℍ± and equivariant folding to the pinned action on ℍ.

The following ledger records every retained or added declaration's module and what its statement actually supplies. “Imported” means a mathematical baseline dependency; it does **not** mean the Mathlib-only suggested file imported the Tau Ceti module or that the citing consumer is otherwise accepted.

| Declaration | Pinned module | Audit conclusion |
| --- | --- | --- |
| `mathlib:AlgHom.prod` | `Mathlib/Algebra/Algebra/Prod.lean` | The algebra map into a product built from two algebra maps. |
| `mathlib:CategoryTheory.ActionCategory` | `Mathlib/CategoryTheory/Action.lean` | The action groupoid of a group acting on a type. |
| `mathlib:CongruenceSubgroup.Gamma` | `Mathlib/NumberTheory/ModularForms/CongruenceSubgroups.lean` | The principal congruence subgroup Γ(N) of SL(2, ℤ). |
| `mathlib:DoubleCoset.Quotient` | `Mathlib/GroupTheory/DoubleCoset.lean` | The double coset space H \ G / K as a quotient type. |
| `mathlib:DoubleCoset.eq` | `Mathlib/GroupTheory/DoubleCoset.lean` | Two elements define the same double coset iff b = h a k for some h ∈ H, k ∈ K. |
| `mathlib:GroupLike` | `Mathlib/RingTheory/Coalgebra/GroupLike.lean` | Group-like elements a of a bialgebra: Δ a = a ⊗ a and ε a = 1. |
| `mathlib:GroupLike.instCommGroup` | `Mathlib/RingTheory/HopfAlgebra/GroupLike.lean` | The group-like elements of a commutative Hopf algebra form a commutative group (inverse given by the antipode). |
| `mathlib:IsDedekindDomain.FiniteAdeleRing` | `Mathlib/RingTheory/DedekindDomain/FiniteAdeleRing.lean` | The finite adele ring Πʳ v, [v.adicCompletion K, v.adicCompletionIntegers K]. |
| `mathlib:Matrix.GeneralLinearGroup.det` | `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean` | The determinant GL(n, R) →* Rˣ. |
| `mathlib:MeasureTheory.IsFundamentalDomain` | `Mathlib/MeasureTheory/Group/FundamentalDomain.lean` | A measurable set meeting almost every orbit of a group action, with almost disjoint translates. |
| `mathlib:MeasureTheory.IsFundamentalDomain.quotientMeasure_eq` | `Mathlib/MeasureTheory/Group/FundamentalDomain.lean` | Replacement; quotient measures, not merely mass. Countable/invariant/measurable action hypotheses retained. |
| `mathlib:MeasureTheory.Lp` | `Mathlib/MeasureTheory/Function/LpSpace/Basic.lean` | The Lp space of a measure as a subgroup of a.e.-classes. |
| `mathlib:MeasureTheory.Measure.IsHaarMeasure` | `Mathlib/MeasureTheory/Group/Measure.lean` | A left-invariant measure, finite on compacts and positive on nonempty opens. |
| `mathlib:MeasureTheory.Measure.haarMeasure` | `Mathlib/MeasureTheory/Measure/Haar/Basic.lean` | The Haar measure normalized on a positive compact set. |
| `mathlib:MeasureTheory.Measure.infinitePi` | `Mathlib/Probability/ProductMeasure.lean` | The product measure on Π i, X i of an arbitrary family of probability measures. |
| `mathlib:MeasureTheory.Measure.infinitePi_map_restrict` | `Mathlib/Probability/ProductMeasure.lean` | The image of infinitePi μ under restriction to a finset I is Measure.pi over I. |
| `mathlib:MeasureTheory.Measure.isMulLeftInvariant_eq_smul` | `Mathlib/MeasureTheory/Measure/Haar/Unique.lean` | On a second countable locally compact group, a left-invariant measure finite on compacts is haarScalarFactor μ' μ • μ for any Haar μ. |
| `mathlib:MeasureTheory.Measure.modularCharacter` | `Mathlib/MeasureTheory/Group/ModularCharacter.lean` | The modular character G →* ℝ≥0 of a locally compact group, defined by map (· * g) haar = Δ(g) • haar. |
| `mathlib:MeasureTheory.Measure.pi` | `Mathlib/MeasureTheory/Constructions/Pi.lean` | The product measure on a finite product ∀ i, α i of sigma-finite measures. |
| `mathlib:MeasureTheory.Measure.pi_pi` | `Mathlib/MeasureTheory/Constructions/Pi.lean` | Measure.pi μ (Set.pi univ s) = ∏ i, μ i (s i) for a finite index type. |
| `mathlib:MeasureTheory.Measure.prod` | `Mathlib/MeasureTheory/Measure/Prod.lean` | The product measure μ.prod ν on α × β. |
| `mathlib:MeasureTheory.QuotientMeasureEqMeasurePreimage` | `Mathlib/MeasureTheory/Group/FundamentalDomain.lean` | A measure on the quotient by a countable group equals the pushforward of the restriction to any fundamental domain. |
| `mathlib:MeasureTheory.Subgroup.index_mul_measure` | `Mathlib/MeasureTheory/Group/Measure.lean` | For a measurable subgroup H of finite index and a left-invariant μ, H.index * μ H = μ univ. |
| `mathlib:MeasureTheory.integral_prod` | `Mathlib/MeasureTheory/Integral/Prod.lean` | Fubini: for f integrable for μ.prod ν, ∫ z, f z ∂(μ.prod ν) = ∫ x, ∫ y, f (x, y) ∂ν ∂μ. |
| `mathlib:ModularGroup.exists_smul_mem_fd` | `Mathlib/NumberTheory/Modular.lean` | Every z in the upper half-plane has an SL(2,ℤ)-translate in the standard fundamental domain 𝒟. |
| `mathlib:Nat.Primes.not_summable_one_div` | `Mathlib/NumberTheory/SumPrimeReciprocals.lean` | The sum of 1/p over primes p diverges. |
| `mathlib:NumberField.AdeleRing` | `Mathlib/NumberTheory/NumberField/AdeleRing.lean` | The adele ring InfiniteAdeleRing K × FiniteAdeleRing (𝓞 K) K. |
| `mathlib:NumberField.IdeleClassGroup` | `Mathlib/NumberTheory/NumberField/AdeleRing.lean` | The idele class group 𝔸_K^× ⧸ K^×. |
| `mathlib:NumberField.IdeleGroup` | `Mathlib/NumberTheory/NumberField/AdeleRing.lean` | The idele group, the units of the adele ring with the units topology. |
| `mathlib:NumberField.InfiniteAdeleRing.ringEquiv_mixedSpace` | `Mathlib/NumberTheory/NumberField/InfiniteAdeleRing.lean` | Exists; algebraic ring equivalence only. Added topology bridge supplies continuity. |
| `mathlib:NumberField.Units.rank` | `Mathlib/NumberTheory/NumberField/Units/DirichletTheorem.lean` | The unit rank r₁ + r₂ − 1 = #InfinitePlace K − 1. |
| `mathlib:NumberField.Units.unitLattice_rank` | `Mathlib/NumberTheory/NumberField/Units/DirichletTheorem.lean` | The unit lattice has rank equal to Units.rank (Dirichlet's unit theorem). |
| `mathlib:NumberField.classNumber` | `Mathlib/NumberTheory/NumberField/ClassNumber.lean` | The class number of a number field, the cardinality of its finite class group. |
| `mathlib:NumberField.dedekindZeta_residue` | `Mathlib/NumberTheory/NumberField/DedekindZeta.lean` | The class-number-formula constant 2^{r₁}(2π)^{r₂} R h / (w √∣d∣), shown to be the residue of ζ_K at s = 1 by tendsto_sub_one_mul_dedekindZeta_nhdsGT. |
| `mathlib:NumberField.dedekindZeta_residue_pos` | `Mathlib/NumberTheory/NumberField/DedekindZeta.lean` | The residue of the Dedekind zeta function at s = 1 is positive. |
| `mathlib:NumberField.mixedEmbedding.volume_fundamentalDomain_stdBasis` | `Mathlib/NumberTheory/NumberField/CanonicalEmbedding/Basic.lean` | The standard fundamental domain of the mixed space ℝ^{r₁} × ℂ^{r₂} has volume 1 for its product Lebesgue measure. |
| `mathlib:NumberField.prod_abs_eq_one` | `Mathlib/NumberTheory/NumberField/ProductFormula.lean` | The product formula over infinite places with multiplicities and finite places. |
| `mathlib:NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT` | `Mathlib/NumberTheory/NumberField/DedekindZeta.lean` | Class number formula: (s - 1) ζ_K(s) → dedekindZeta_residue K as s → 1⁺. |
| `mathlib:ProperlyDiscontinuousSMul` | `Mathlib/Topology/Algebra/ConstMulAction.lean` | Properly discontinuous actions: finitely many group elements move a compact set to meet another. |
| `mathlib:QuaternionAlgebra` | `Mathlib/Algebra/Quaternion.lean` | The quaternion algebra ℍ[R, c₁, c₂, c₃] over a commutative ring. |
| `mathlib:QuotientGroup.integral_eq_integral_automorphize` | `Mathlib/MeasureTheory/Measure/Haar/Quotient.lean` | Exists; right Γ.op action and integrability/AEStronglyMeasurable. Use the added inversion bridge. |
| `mathlib:RestrictedProduct.continuous_dom` | `Mathlib/Topology/Algebra/RestrictedProduct/TopologicalSpace.lean` | A map out of Πʳ i, [R i, A i]_[𝓕] is continuous iff its restriction to every Πʳ i, [R i, A i]_[𝓟 S] with 𝓕 ≤ 𝓟 S is continuous. |
| `mathlib:RestrictedProduct.evalRingHom` | `Mathlib/Topology/Algebra/RestrictedProduct/Basic.lean` | The ring homomorphism Πʳ i, [R i, B i]_[𝓕] →+* R j evaluating at j. |
| `mathlib:RestrictedProduct.isOpenEmbedding_inclusion_principal` | `Mathlib/Topology/Algebra/RestrictedProduct/TopologicalSpace.lean` | For open B i and cofinite ≤ 𝓟 S, the inclusion of Πʳ i, [R i, B i]_[𝓟 S] into Πʳ i, [R i, B i] is an open embedding. |
| `mathlib:RestrictedProduct.isOpenEmbedding_structureMap` | `Mathlib/Topology/Algebra/RestrictedProduct/TopologicalSpace.lean` | For open B i, the structure map Π i, B i → Πʳ i, [R i, B i] is an open embedding. |
| `mathlib:RestrictedProduct.isTopologicalGroup` | `Mathlib/Topology/Algebra/RestrictedProduct/TopologicalSpace.lean` | Πʳ i, [R i, B i] is a topological group when every R i is a topological group and every B i an open subgroup (Fact (∀ i, IsOpen (B i))). |
| `mathlib:RestrictedProduct.locallyCompactSpace_of_group` | `Mathlib/Topology/Algebra/RestrictedProduct/TopologicalSpace.lean` | Πʳ i, [R i, B i] is locally compact when every R i is a locally compact topological group, every B i an open subgroup and B i is compact for all but finitely many i. |
| `mathlib:RestrictedProduct.mapAlong_continuous` | `Mathlib/Topology/Algebra/RestrictedProduct/TopologicalSpace.lean` | mapAlong of a family of continuous maps sending A₁ into A₂ cofinitely is continuous. |
| `mathlib:RestrictedProduct.topologicalSpace_eq_iSup` | `Mathlib/Topology/Algebra/RestrictedProduct/TopologicalSpace.lean` | The restricted-product topology is the supremum over cofinite principal filters 𝓟 S of the topologies coinduced from the products with respect to S. |
| `mathlib:RestrictedProduct.unitsEquiv` | `Mathlib/Topology/Algebra/RestrictedProduct/Units.lean` | Exists; multiplicative equivalence. Topology is an explicit supplier request. |
| `mathlib:Subgroup.isClosed_of_discrete` | `Mathlib/Topology/Algebra/IsUniformGroup/Basic.lean` | A discrete subgroup of a Hausdorff topological group is closed. |
| `mathlib:TopologicalGroup.IsSES.inducedMeasure` | `Mathlib/MeasureTheory/Measure/Haar/Extension.lean` | Exists; NORMAL extension with supplied subgroup/quotient measures. General nonnormal quotient consumers remain unverifiable. |
| `mathlib:TopologicalGroup.IsSES.integral_inducedMeasure` | `Mathlib/MeasureTheory/Measure/Haar/Extension.lean` | Exists; compactly supported continuous integral for that NORMAL extension, not general quotient existence. |
| `mathlib:UpperHalfPlane.glAction` | `Mathlib/Analysis/Complex/UpperHalfPlane/MoebiusAction.lean` | Exists; negative determinant folds by conjugation. Added raw/folded bridge. |
| `mathlib:isQuotientCoveringMap_quotientMk_of_properlyDiscontinuousSMul` | `Mathlib/Topology/Covering/Quotient.lean` | Exists; requires free/canceling properly discontinuous action and quotient topology, still missing at the consumer. |
| `tauceti:Derivation.adjointPointRepresentation` | `TauCeti/Algebra/AlgebraicGroup/Tangent/Representation.lean` | The adjoint representation of an affine group on the dual of its cotangent space. |
| `tauceti:HeckeCoset.degree_eq_relIndex` | `TauCeti/NumberTheory/HeckeRing/Basic.lean` | The degree of a Hecke double coset H₁ g H₂ is the relative index of g H₂ g⁻¹ ∩ H₁ in H₁. |
| `tauceti:IsDedekindDomain.HeightOneSpectrum.isNonarchimedeanLocalField_adicCompletion` | `TauCeti/RingTheory/DedekindDomain/AdicValuation/ValuativeRel.lean` | For a height-one prime with finite residue ring, v.adicCompletion K is a nonarchimedean local field. |
| `tauceti:IsQuotientCoveringMap.isCoveringMap_of_comp` | `TauCeti/Topology/Covering/Quotient.lean` | If E → E/G and E → E/H are quotient covering maps for H ≤ G, the induced E/H → E/G is a covering map. |
| `tauceti:Matrix.SpecialLinearGroup.map_intCast_zmod_surjective` | `TauCeti/LinearAlgebra/Matrix/SpecialLinearGroup/Basic.lean` | SL_2(ℤ) → SL_2(ℤ/d) is surjective for every d. |
| `tauceti:NumberField.AdeleRing.instT2Space` | `TauCeti/NumberTheory/NumberField/Global/Adeles/Basic.lean` | The adele ring of a number field is Hausdorff. |
| `tauceti:QuaternionAlgebra.normForm` | `TauCeti/Algebra/Quaternion/NormForm.lean` | The norm form x ↦ (x · star x).re of a quaternion algebra, its reduced norm. |
| `tauceti:TauCeti.AffineGroup.Product.pointsMulEquiv` | `TauCeti/Algebra/AlgebraicGroup/Product.lean` | Points of a product of affine groups are the product of the points. |
| `tauceti:TauCeti.Bialgebra.CotangentSpace` | `TauCeti/Algebra/AlgebraicGroup/Tangent/Cotangent.lean` | The cotangent space (augmentation ideal)/(augmentation ideal)² of a bialgebra. |
| `tauceti:TauCeti.Cocharacter.leviDecompositionMulEquiv` | `TauCeti/Algebra/AlgebraicGroup/Dynamic/LeviDecomposition/Basic.lean` | The Levi decomposition U(λ) ⋊ L(λ) ≃* P(λ) on points. |
| `tauceti:TauCeti.Cocharacter.parabolic` | `TauCeti/Algebra/AlgebraicGroup/Dynamic/Parabolic.lean` | The dynamic parabolic subgroup P(λ) of a cocharacter λ, as a subgroup of points. |
| `tauceti:TauCeti.Cocharacter.unipotent` | `TauCeti/Algebra/AlgebraicGroup/Dynamic/Parabolic.lean` | The unipotent radical U(λ) of the dynamic parabolic P(λ). |
| `tauceti:TauCeti.CommHopfAlgCat.baseChangePointsMulEquiv` | `TauCeti/Algebra/AlgebraicGroup/CommHopfAlgCat/BaseChange.lean` | points of the base change of H to K, evaluated on a K-algebra A, are the points of H on A viewed as a k-algebra. |
| `tauceti:TauCeti.CommHopfAlgCat.centerDefiningIdeal` | `TauCeti/Algebra/AlgebraicGroup/Center/Basic.lean` | The Hopf ideal defining the centre of an affine group over a field. |
| `tauceti:TauCeti.CommHopfAlgCat.centerPointsSubgroup_eq_center` | `TauCeti/Algebra/AlgebraicGroup/Center/Basic.lean` | Over a field k, the points of the centre group scheme are exactly the universally central points HopfAlgebra.center k H A. |
| `tauceti:TauCeti.CommHopfAlgCat.geometricCharacterGroup` | `TauCeti/Algebra/AlgebraicGroup/CommHopfAlgCat/CharacterLattice/Basic.lean` | The geometric character group GroupLike k̄ (k̄ ⊗[k] H) of an affine group over k. |
| `tauceti:TauCeti.CommHopfAlgCat.instGeometricCharacterGroupGaloisAction` | `TauCeti/Algebra/AlgebraicGroup/CommHopfAlgCat/CharacterLattice/Basic.lean` | The action of the absolute Galois group of k on the geometric character group. |
| `tauceti:TauCeti.CommHopfAlgCat.isMulTorsionFree_geometricCharacterGroup` | `TauCeti/Algebra/AlgebraicGroup/CommHopfAlgCat/CharacterLattice/Torsion.lean` | The geometric character group is torsion free under both geometricallyReduced and geometricallyConnected object-property hypotheses. Number-field finite-type algebraic groups satisfy the reduced/smooth condition in characteristic 0; it must be imported or proved. |
| `tauceti:TauCeti.CommHopfAlgCat.pointsFunctor` | `TauCeti/Algebra/AlgebraicGroup/CommHopfAlgCat/Basic.lean` | The bifunctor (CommHopfAlgCat R)ᵒᵖ ⥤ CommAlgCat R ⥤ GrpCat; functoriality of points in the group. |
| `tauceti:TauCeti.CommHopfAlgCat.quotientPointsSubgroup` | `TauCeti/Algebra/AlgebraicGroup/HopfIdeal/Points/Basic.lean` | The subgroup of A-points of H cut out by a Hopf ideal I: the range of the points of H ⧸ I. |
| `tauceti:TauCeti.GeneralLinear.pointsMulEquiv` | `TauCeti/Algebra/AlgebraicGroup/GeneralLinear/FunctorOfPoints.lean` | The points of the GL_n coordinate Hopf algebra in A are Matrix.GeneralLinearGroup (Fin n) A. |
| `tauceti:TauCeti.GlobalNumberFields.discreteTopology_principalSubgroup` | `TauCeti/NumberTheory/NumberField/Global/Adeles/Discrete.lean` | K is discrete in the adele ring: DiscreteTopology (AdeleRing.principalSubgroup (𝓞 K) K). |
| `tauceti:TauCeti.GlobalNumberFields.finprod_normalizedAbsValue_eq_one` | `TauCeti/NumberTheory/NumberField/Global/Places/Basic.lean` | Product formula: for x ≠ 0 in a number field, ∏ᶠ v, normalizedAbsValue v x = 1. |
| `tauceti:TauCeti.GlobalNumberFields.isClosed_principalSubgroup` | `TauCeti/NumberTheory/NumberField/Global/Adeles/Discrete.lean` | K is closed in the adele ring. |
| `tauceti:TauCeti.GlobalNumberFields.normalizedAbsValue` | `TauCeti/NumberTheory/NumberField/Global/Places/Basic.lean` | The normalized absolute value ∣·∣_v at a place v of a number field. |
| `tauceti:TauCeti.GlobalNumberFields.weakApproximation_denseRange` | `TauCeti/NumberTheory/NumberField/Global/Approximation/Weak.lean` | K is dense in the product of its completions at any finite sets of finite and infinite places. |
| `tauceti:TauCeti.HopfAlgebra.mapPoints` | `TauCeti/Algebra/AlgebraicGroup/PointsFunctor.lean` | The group homomorphism of points induced by a map of commutative R-algebras A ⟶ B. |
| `tauceti:TauCeti.HopfAlgebra.points` | `TauCeti/Algebra/AlgebraicGroup/PointsFunctor.lean` | The group of A-points WithConv (H →ₐ[R] A) of a Hopf algebra H, as an object of GrpCat, for A a commutative R-algebra. |
| `tauceti:TauCeti.HopfAlgebra.pointsFunctor` | `TauCeti/Algebra/AlgebraicGroup/PointsFunctor.lean` | The points functor CommAlgCat R ⥤ GrpCat of a Hopf algebra. |
| `tauceti:TauCeti.MultiplicativeGroup.pointsMulEquiv` | `TauCeti/Algebra/AlgebraicGroup/MultiplicativeGroup/Basic.lean` | The points of R[T;T⁻¹] in A are Aˣ. |
| `tauceti:TauCeti.cholesky` | `TauCeti/LinearAlgebra/Matrix/Cholesky/Basic.lean` | The Cholesky factor of a positive definite real matrix, a lower triangular matrix with positive diagonal. |
| `tauceti:TauCeti.cholesky_mul_transpose` | `TauCeti/LinearAlgebra/Matrix/Cholesky/Basic.lean` | (cholesky A) * (cholesky A)ᵀ = A. |
| `tauceti:TauCeti.simplyConnectedSemisimpleCommHopfAlgProperty` | `TauCeti/Algebra/AlgebraicGroup/SimplyConnected/Basic.lean` | For semisimple group G represented by H, every central isogeny K→G from a semisimple group is an isomorphism. In Hopf coordinates the arrow reverses: H→K. |
| `mathlib:NumberField.InfinitePlace.Completion.isometryEquivRealOfIsReal` | `Mathlib/NumberTheory/NumberField/Completion/InfinitePlace.lean` | A real infinite-place completion is isometrically equivalent to ℝ; the underlying equivalence is ringEquivRealOfIsReal. |
| `mathlib:NumberField.InfinitePlace.Completion.isometryEquivComplexOfIsComplex` | `Mathlib/NumberTheory/NumberField/Completion/InfinitePlace.lean` | A complex infinite-place completion is isometrically equivalent to ℂ; the underlying equivalence is ringEquivComplexOfIsComplex. |
| `mathlib:UpperHalfPlane.moebius_im` | `Mathlib/Analysis/Complex/UpperHalfPlane/MoebiusAction.lean` | For every real invertible 2×2 matrix and z∈ℂ, the imaginary part of num/denom is det(g) Im(z)/normSq(denom). |
| `mathlib:UpperHalfPlane.denom_ne_zero_of_im` | `Mathlib/Analysis/Complex/UpperHalfPlane/MoebiusAction.lean` | For g∈GL₂(ℝ) and Im(z)≠0 the raw Möbius denominator is nonzero. |
| `mathlib:UpperHalfPlane.coe_smul` | `Mathlib/Analysis/Complex/UpperHalfPlane/MoebiusAction.lean` | The coerced glAction value is σ(g)(num(g,z)/denom(g,z)); σ is identity for positive determinant and conjugation otherwise. |

## Source audit and mistakes in the sources

Source locators were checked against the **hashed version**, not a different publication's numbering. In particular:

- Sutherland's Haar passage is §23.3, p. 6 of the 2016 notes, not §23.2, p. 5. Those passages motivate the additive construction; generic nonabelian restricted products need the stated adaptation.
- Arthur's rational log-height passage is §3, p. 17. Its height discussion is written over ℚ; complex-place multiplicities require the number-field extension recorded above.
- Borel's fundamental-set passage attributed to §8, p. 23 is in the introduction, p. 6; the relevant later §8 is pp. 26–30. The independent proof order in §§3–5 matters.
- BKT's basis-change claim is arXiv v2 p. 18 and published p. 933, while Definition 4.11 is arXiv p. 17/published p. 932. The erratum's fixed-K and rational-orbit-preimage corrections are retained.
- Khayutin v3 uses Definition **3.1**, Proposition **3.6** and Remark **3.7**, not Definition 13/Proposition 18/Remark 19. The published locations were collated at pp. 162, 169 and 172–173.
- Calegari–Geraghty's ℓ₀ calculation is arXiv v2 p. 77; its component claim is p. 79. Lipnowski–Tsimerman's equation and section page locators were supplied explicitly.

All eight original source issues have independent `confirmed` verdicts, with reasons and `by: REV-AdelicAlgebraicGroups`. Their corrections are **not** claims that every surrounding theorem or formalization is accepted. E5 and E8 affect a stated result, rather than “nothing.”

| Issue | Independent finding |
| --- | --- |
| E1 | BKT's unsorted basis-change claim fails for diag(1,t) in the reversed basis. Permit reordering; confirmed in both copies. |
| E2 | BKT's official erratum requires one fixed maximal compact in the Siegel-set comparison. |
| E3 | The horospherical formula describes left multiplication; “right” is a misprint. |
| E4 | The displayed γ is unbound; supply the uniform ∀γ∈Γ quantifier. |
| E5 | In the definite quaternion case rational −1 removes the real sign, so the positive residual image has index 1, not 2. |
| E6 | Valuations modulo squares give an infinite discrete direct sum; the local square-class quotient is not compact. |
| E7 | The quadratic-field torus is anisotropic; “isotropic” in the compactness argument is a misprint. |
| E8 | F=ℚ(√−5), Q=∅, p=3 retains Cl(F)=ℤ/2, contradicting the claimed maximal 3-power exponent quotient. The two-page 2022 Correction concerns completed-ring typesetting and does not address this claim. No claim about a subsequent localization is made. |
| E9 (added) | The official BKT erratum §1.5 replaces Borel–Harish-Chandra 7.5, which gives real translates, with the rational preimage result. This known correction was missing from the packet. |
| E10 (added) | Rosengarten arXiv v3 p. 25 omits the inverse in the displayed local Artin factor. The page image confirms this is not OCR loss. GL₁ contradicts the subsequent pole/convergence claim without the inverse. The packet already used the corrected inverse. |

The E10 check concerns the specified arXiv version; the publisher landing page was accessible but its PDF endpoint returned HTML. No claim about the printed journal formula or novelty is made. The published original Calegari–Geraghty text was not separately collated; E8 is verified in the specified public arXiv copy and the separate Correction. The manuscript retains prior erratum searches without treating their absence as proof that no correction exists.

Public source versions read, with hashes in the packet for reproducibility:

| Source | Public URL | Read scope |
| --- | --- | --- |
| An introduction to the trace formula | [public copy](https://www.claymath.org/library/cw/arthur/pdf/62.pdf) | §2 Algebraic groups and adeles (pp. 11–15); §4 Noncompact quotient and parabolic subgroups (pp. 20–24); §5 Roots and weights (pp. 24–29); §8 On the proof of the theorem, Siegel sets and Theorem 8.1 (pp. 37–39); §1, pp. 7–9; §3, pp. 15–17; §6, p. 30; §13, p. 70 |
| Some finiteness properties of adele groups over number fields | [public copy](http://www.numdam.org/item/PMIHES_1963__16__5_0.pdf) | Introduction; §1 Preliminaries (1.1–1.11); §2 The double cosets modulo G_A^∞ (2.1–2.7); §4 Fundamental sets for G_k in G_A (4.1–4.6); §5 Finiteness theorems (5.1–5.10); §7 Application to parabolic subgroups (7.1–7.5); §3, pp. 14–16; §8, pp. 26–30 |
| Weil and Grothendieck approaches to adelic points | [public copy](https://math.stanford.edu/~conrad/papers/adelictop.pdf) | §1 Introduction; §2 Affine case (Proposition 2.1, Examples 2.2–2.4); §3 Weil's method (Theorem 3.4, Remark 3.5, Theorem 3.6, Corollary 3.7); §4 Topological properties (Examples 4.1–4.2) |
| On strong approximation for algebraic groups | [public copy](https://arxiv.org/abs/1207.4425) | §1 Strong approximation for SL2 (Lemmas 1.1–1.2); §2.2 Absence of strong approximation in tori (Proposition 2.1); §2.3 Simple connectedness as a necessary condition (Proposition 2.2); §2.4 Theorem 2.3 and Remarks 1–3; §2.6 On the proof of sufficiency (Lemma 2.7 and Platonov's argument) |
| Introduction to Shimura varieties | [public copy](https://www.jmilne.org/math/xnotes/svi.pdf) | §3 Locally symmetric varieties: arithmetic subgroups, neat subgroups, Proposition 3.5 (pp. 32–35); §5 Shimura varieties: Lemmas 5.11–5.13 and footnote 40 (pp. 55–58) |
| Tamagawa numbers and other invariants of pseudo-reductive groups over global function fields | [public copy](https://arxiv.org/abs/1806.10723v3) | §1, pp. 1–3; §3, pp. 24–27, especially equation (3.4) and Lemma 3.5; function fields only |
| 18.785 Number theory I, Lecture #23: The ring of adeles, strong approximation | [public copy](https://math.mit.edu/classes/18.785/2016fa/LectureNotes23.pdf) | §23.1 Restricted products; §23.2 Adele ring; §23.3 Haar measures, p. 6; Proposition 23.10, Theorems 23.12 and 23.14 |
| Tame topology of arithmetic quotients and algebraicity of Hodge loci | [public copy](https://arxiv.org/abs/1810.04801v2) | §2 Siegel sets and the definable structure on arithmetic quotients (2.1–2.7); §4.5 Reduction theory and positive forms (Definition 4.11 and the Claim) |
| Joint equidistribution of CM points | [public copy](https://arxiv.org/abs/1710.04557v3) | §2.3, arXiv v3 pp. 15–16; published p. 162; Definition 3.1 (arXiv v3 p. 22), Proposition 3.6 (p. 24), Remark 3.7 and proof (p. 25); published pp. 169, 172–173 |
| Modularity lifting beyond the Taylor–Wiles method | [public copy](https://arxiv.org/abs/1207.4224v2) | §8.2 The case G = GL(1) |
| How large is A_g(F_q)? | [public copy](https://arxiv.org/abs/1511.02212v1) | §3.2 Counting isogeny classes adelically, equations (15)–(21) |
| Zéro-cycles sur les espaces homogènes et problème de Galois inverse | [public copy](https://arxiv.org/abs/1802.09605v2) | §6.1 Théorème 6.1 and its proof; §6.2 Théorème 6.2 and Lemme 6.3 (the property (⋆) for torsors under simply connected semisimple groups) |
| Erratum: Tame topology of arithmetic quotients and algebraicity of Hodge loci | [public copy](https://benjamin-bakker.github.io/DefArithErr.pdf) | §1.1 Summary of errors; §1.2 Definable structures and Remark 1.1; §1.3 Functoriality and Theorem 1.2; §1.5 Period maps; §1.6 Examples |

Additional public copies:

- [Published BKT copy](https://par.nsf.gov/servlets/purl/10200187), SHA-256 `b7cf457907c30c9dc1c349637e74027ce4ef038a2e0f646b7685f571d367e058`.
- [Published Khayutin copy](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n1-p04-s.pdf), SHA-256 `f22691429c27058fabd47fe12c6a901e7feffffad7a0c52e1a936da645166d6f`.
- [Calegari–Geraghty Correction](https://link.springer.com/content/pdf/10.1007/s00222-021-01095-5.pdf), SHA-256 `c60cfe362940e641ee2cd60c61c1429961f18d3d16b4a6857df4ea7993111ee7`.

Access/read date for this review is 2026-10-06. Restricted books were not obtained; nonroutine claims that still rely on their unstated results remain gaps.

## Suppliers, ownership and red-team findings

Read the nearby upstream ReductiveGroups and GlobalNumberFields documents and the other relevant supplier statements: ReductiveGroupsPartII RG2.0/0a/1/3/4, LieGroups layer 9, ClassFieldTheory layer 12, NumberFieldArithmetic relative-discriminant layer 4, GlobalQuadraticForms layer 5, Chebotarev layer 10, ModularCurvesPartII R12.2, and AF.0/AF.1. The accepted RS-04 restructuring explicitly assigns generic adelic reduction/heights to AA.3 and narrows AF.0. **No duplicate-ownership finding is made against AA.3 on that basis.** Existing algebraic points, character lattices, local topology, additive approximation and Cholesky declarations are imported rather than re-planned. The reviewed library audit's partial/missing stage classification is consistent with these imports.

Request corrections:

- RG2.0 now lists its direct local-form and analytic consumers, not just the adelic-points carrier. Its affine-points topology is for arbitrary Hausdorff topological rings and finite-type schemes, not only local fields.
- RG2.3 must extend the global maximal split torus **inside a local maximal split torus**: global and local split ranks can differ.
- AF.1's norm comparison requires proper algebraic scale functions/dual representations; AA.3 owns the generic adelic height package under RS-04.
- Chebotarev's request and direct dependencies move from layer 11 (a summatory/Frobenius coefficient layer) to the actual layer-10 Dirichlet-density stage that supplies infinitude of specified Frobenius classes.
- The quaternion norm argument also needs the nonarchimedean five-variable isotropy input u(ℚ_p)=4. Real indefiniteness plus a Hasse–Minkowski slogan is insufficient.

Assigned confirmed red-team findings:

| Finding | Review outcome |
| --- | --- |
| RT-AREA-automorphic-1/7 | The packet retains the exact **isotropic**, simply connected, absolutely almost simple local Kneser–Tits request. It does not silently extend equality G(E)^+=G(E) to anisotropic local factors. The arithmetic native-field/several-place completion of strong approximation is an explicit gap. |
| RT-AREA-automorphic-1/28 | Generic neat level is owned at AA.4, with downstream uses and API. Stable-lattice/root-of-unity input and prototype algebraicity still need revision; the statement “a neat level exists” alone is not proof closure. |
| RT-AREA-geomlanglands/12 | AA.0 remains field-generic restricted-product Haar theory, usable for number or function fields. Its exceptional noncompact factors are handled correctly. Number-field specializations are separate consumers. The reader already places generic theory here, but its detailed claims now need the same convention corrections. |

The reader document was read in full, including its discussion of these findings. It still contains the old detailed convention/height/closure assertions. This review issue authorizes the packet, suggested file and review report, not `readmes/AdelicAlgebraicGroups.md`; therefore it is left for the revision and explicitly listed below. No edits were made to upstream roadmaps, atlas data, campaign documents or supplier packets.

## API, tests, planets and suggested file

All 48 definition/construction APIs and their 144 packet tests were inspected, not merely counted. The APIs generally cover the intended carrier, evaluation, structure, functoriality and examples. Four entries were added: the finite-supported point embedding with its two projection rules, and the canonical relative-chamber projection. Every original API name has a corresponding suggested declaration or structure field. Nevertheless, a name and an elaborating `sorry` do not show the same mathematical signature.

Material prototype mismatches still requiring revision include:

- Finite type, smoothness, geometric connectedness and reductivity are absent from many statements. `IsDomain H` cannot uniformly replace geometric connectedness or connected reductivity.
- Integral models now require finite presentation, but their generic-fibre identification remains only an algebra equivalence, with no Hopf compatibility.
- Weil-restriction comparisons and GL₁/GL₂ validation identifications are arbitrary families of point-group equivalences, without naturality/diagonal/base-change compatibility.
- `Parabolic`, `MinimalParabolic`, `AdmissibleCompact` and `HoroData` omit essential parabolic, root, split-torus, special-position and compact data. Their existence/universal theorems cannot follow from those arbitrary records.
- `realSiegel_finite_cover` uses an arbitrary supplied finite family, including the empty one, instead of an existential admissible covering family and an arithmetic group hypothesis. Horospherical left multiplication uses an unconstrained m₀, rather than a Levi factor with the normalization/commutation hypotheses.
- `StrongApproximation` represents only finite adeles, and its monotonicity signature ignores S. Weak approximation omits infinite places. The suggested simply-connected condition has the wrong Hopf-map direction and quantifies maps that are not central isogenies.
- Central-character topology, continuity, quotient normalizations and compact Fourier hypotheses are absent. Tamagawa's product signature permits arbitrary parameters. Height comparisons use arbitrary point-group homomorphisms rather than algebraic proper height representations.
- The covering theorem accepts arbitrary topology instances and lacks compact-open level and faithful/algebraic representation data. A Γ₀(p) index calculation alone does not test the declared Hecke correspondence. The SL₂ groupoid examples compute an unrelated cyclic subgroup unless the level/stabilizer identification is supplied.
- Generic Q-level/GL₂ examples leave U and K∞ arbitrary and do not impose the actual canonical level. The p-adic/neat/root test family must detect the same definition rather than carry the desired comparison as a hypothesis.

Direct Lean repairs in this review: an honest review-status header; finite presentation of models; closed/non-open square-image tests; positive Haar hypotheses on the restricted-product non-probability test; right-Haar quotient hypotheses; the inversion comparison; correct right-translation pushforward factor; `tprod`; the canonical relative projection kernel; identity-height normalization; strictly positive corner coordinates; finite-supported embedding and component quotient; archimedean identity for Hecke translations; compact finite level and trivial stabilizer conclusion in the neat groupoid test; whole-Borel image in the gauge test; and the square-class determinant with surjectivity/principal-diagonal hypotheses in the residual PGL₂ test. Raw/folded and mixed-space comparison forms were added. These repairs eliminate the identified elementary errors without claiming the unresolved structures were imported or implemented.

The 25 planets are key definitions/constructions/theorems, with at most six on each stage. Their names meet the naming rule; no planet edits were needed. Their existence as landmarks does not override the stage's partial coverage.

Validation:

- `python3 scripts/check_blueprint.py research/blueprint/packets/AdelicAlgebraicGroups.json`: **0 errors, 0 warnings**.
- `lean-check research/blueprint/suggested/AdelicAlgebraicGroups.lean`: **exit 0, only “declaration uses sorry” warnings**, after the final signature repairs.
- The available shared build has the exact pinned Mathlib but does **not** contain the pinned Tau Ceti algebraic-group modules. The original file restated their point-group stand-ins. Consequently the successful check is a Mathlib type check, not a compilation against both pinned libraries or a semantic check of the Tau Ceti comparisons. No new Lake project, library build/cache download, or Lean language server was started.
- JSON validation, unique/complete per-node review coverage, source-issue verdict coverage, definition test minimums, planet bounds, and changed-file scope were checked.

## Questions and revision instructions for the orchestrator

1. Open a revision for the **mathematical/prototype defects** recorded here, preserving corrected conventions and source issues. The 126 unverifiable entries and 20 gap consumer lists are the worklist; partial coverage alone is not the reason for rejection.
2. Include `research/blueprint/readmes/AdelicAlgebraicGroups.md` among that revision's deliverables, so the reader can be synchronized with the packet and honest coverage claims. It must no longer state the old left/right Haar, Hilbert–Schmidt identity, full-deck or unjustified closure claims.
3. Resolve ownership of the new primitive **inputs**, especially general quotient integration, number-field Tamagawa normalization, integral lifting and compact harmonic analysis, through precise supplier requests or local lemma nodes. Do not duplicate the accepted RS-04 allocation of adelic heights/reduction.
4. Require a faithful suggested file using the actual pinned Tau Ceti points, algebraic-group predicates and natural maps when an existing build contains them; retain a stated compile limitation until then. Do not treat the current sorry-only Mathlib elaboration as that check.
5. Route confirmed source issues E9/E10 into the appropriate source-issue record if the programme wants a separate errata job; this review records the evidence and claims neither novelty nor correction of the unpublished/published version that was not inspected.

## Complete change ledger

In addition to the mathematical explanations above, this ledger identifies **every changed original node** and all changed fields. Source-only changes fix the locators/version or describe the quoted passage's precise scope. New nodes and baseline/request/source/status changes are listed in their own sections above. All nodes retain `implementationStatus: unchecked`.

| Original node (roadmap prefix omitted) | Fields changed | Change |
| --- | --- | --- |
| `AA.0/second-countable` | sources | Source version, locator and/or quoted-passage scope corrected as described in the source audit. |
| `AA.0/borel-structure` | sources | Source version, locator and/or quoted-passage scope corrected as described in the source audit. |
| `AA.0/level-measure` | sources | Source version, locator and/or quoted-passage scope corrected as described in the source audit. |
| `AA.0/restricted-haar-product` | sources | Source version, locator and/or quoted-passage scope corrected as described in the source audit. |
| `AA.0/restricted-haar-restrict-level` | sources | Source version, locator and/or quoted-passage scope corrected as described in the source audit. |
| `AA.0/restricted-haar-box` | sources | Source version, locator and/or quoted-passage scope corrected as described in the source audit. |
| `AA.0/restricted-haar-is-haar` | proofSteps, sources | The exceptional restricting subgroups can have infinite mass. Finite-on-compacts must use compact neighbourhoods at the exceptional indices. |
| `AA.0/restricted-haar-factorizable-integral` | sources | Source version, locator and/or quoted-passage scope corrected as described in the source audit. |
| `AA.0/restricted-unimodular` | proofSteps, statement | Only cofinitely many B_i are compact; the modular product also includes the finitely many exceptional indices. |
| `AA.0/finite-adele-haar` | sources | Source version, locator and/or quoted-passage scope corrected as described in the source audit. |
| `AA.0/adele-haar` | prerequisites, sources | Use the corrected pinned reference or the explicit comparison bridge instead of the former near miss. |
| `AA.0/idele-haar` | sources | Source version, locator and/or quoted-passage scope corrected as described in the source audit. |
| `AA.1/adelic-points` | api, uses | Add the finite-supported point embedding and both projection simp lemmas to the API. The suggested finite-type/naturality supplier mismatch remains unresolved. |
| `AA.1/adelic-map` | tests | The idele-square subgroup is closed, of infinite index, and not open. Infinite index alone does not imply non-openness. |
| `AA.2/log-height-rational` | sources | Source version, locator and/or quoted-passage scope corrected as described in the source audit. |
| `AA.2/quotient-norm-one-comparison` | proofSteps | The larger archimedean-central quotient is not a finite narrow class group until a finite integral level is also imposed. |
| `AA.2/quotient-measure` | acceptance, hypotheses, statement, uses | Use right Haar measures for fibre averaging on H\G and the right G-action; left Haar measures do not have this convention for nonunimodular groups. |
| `AA.2/discrete-quotient-fundamental-domain` | prerequisites | Use the corrected pinned reference or the explicit comparison bridge instead of the former near miss. |
| `AA.2/central-character-l2` | api, prerequisites, proofSteps, statement | Use a continuous unitary character, conjugate the first argument in the Lean inner-product convention, and replace the invalid discrete fundamental-domain step for a nondiscrete central subgroup by a recorded measurable-section/bundle gap. |
| `AA.2/central-quotient-change` | hypotheses, proofSteps | A nontrivial ω′ requires an extension and twist before the compact quotient acts. |
| `AA.2/local-form-measure` | api | Correct the right-translation pushforward factor to ∣det Ad(g)∣. Pullback of the invariant form has the inverse factor. |
| `AA.2/convergence-factors` | prerequisites, sources | Keep the inverse Artin factor, record the source misprint, and stop describing the function-field formula as an exact number-field proof. |
| `AA.2/tamagawa-measure` | hypotheses, prerequisites, proofSteps, sources, statement | Omitting Artin factors requires zero geometric character lattice. Normalize every good local factor, then use a genuinely convergent infinite product; finitely many rescalings are insufficient. |
| `AA.3/relative-chamber` | acceptance, api | The relative summand is the kernel of the canonical character-restriction projection, not the full dual of a_{P₁}; distinguish the relative cone from the unquotiented chamber. |
| `AA.3/component-decomposition` | acceptance | For the full GL₂ rational group the finite class set identifies determinant units modulo ±1; φ(N) belongs to the positive-rational/upper-half-plane convention. The suggested finite-projection comap incorrectly removes the entire archimedean factor. |
| `AA.3/s-arithmetic-lattice` | sources | Source version, locator and/or quoted-passage scope corrected as described in the source audit. |
| `AA.3/adelic-height` | acceptance, hypotheses, proofSteps, statement, tests | Require a proper algebraic height representation; use normalized archimedean exponents, correct the identity and GL₁ tests, and record the quantitative counting gap. |
| `AA.3/height-representation-comparison` | acceptance, hypotheses, statement | Faithfulness alone is insufficient; compare proper algebraic height representations with duals. G_m, r=id and r′=id⊕dual is a counterexample to the original scope. |
| `AA.3/real-siegel-set` | tests | G itself is always an improper parabolic; it is the only rational parabolic precisely in the anisotropic case. |
| `AA.3/rational-siegel-pullback` | sources | Source version, locator and/or quoted-passage scope corrected as described in the source audit. |
| `AA.3/orbit-map-siegel-preimage` | sources | Source version, locator and/or quoted-passage scope corrected as described in the source audit. |
| `AA.3/orbit-map-siegel-image` | sources | Source version, locator and/or quoted-passage scope corrected as described in the source audit. |
| `AA.3/reduced-form-set` | sources | Source version, locator and/or quoted-passage scope corrected as described in the source audit. |
| `AA.3/reduction-siegel-dictionary` | sources | Source version, locator and/or quoted-passage scope corrected as described in the source audit. |
| `AA.3/gram-diagonal-lower-bound` | sources | Source version, locator and/or quoted-passage scope corrected as described in the source audit. |
| `AA.3/gram-offdiagonal-transfer` | proofSteps, sources | Use the asymmetric bound ∣B_ab∣≤C′d_a; a≤k_i, so the claimed k_i bound does not require controlling the j-index. |
| `AA.3/basis-change-reducedness` | sources | Source version, locator and/or quoted-passage scope corrected as described in the source audit. |
| `AA.4/group-torsor` | statement | A geometric principal-homogeneous point set does not characterize a scheme torsor in characteristic p; use the comodule-algebra isomorphism. |
| `AA.4/kneser-local-torsor` | sources | Source version, locator and/or quoted-passage scope corrected as described in the source audit. |
| `AA.4/hasse-principle-simply-connected` | sources | Source version, locator and/or quoted-passage scope corrected as described in the source audit. |
| `AA.4/zariski-dense-closure-open` | acceptance, hypotheses, statement | Restrict the Lie-algebra argument to ℚ_p. SL₂(ℚ_p) in SL₂(E), for a proper finite extension E/ℚ_p, disproves the asserted native-field generalization. |
| `AA.4/borel-density` | proofSteps | Delete the false nondiscreteness assertion for lattice projections; SL₂(ℤ)⊂SL₂(ℝ) is discrete. |
| `AA.4/open-finite-covolume-finite-index` | hypotheses, statement | Exclude the zero measure and require a nonzero finite invariant Radon measure. |
| `AA.4/strong-approximation-necessity` | prerequisites | Use the corrected pinned reference or the explicit comparison bridge instead of the former near miss. |
| `AA.4/class-set-abelianization` | sources | Source version, locator and/or quoted-passage scope corrected as described in the source audit. |
| `AA.4/neat-level-exists` | proofSteps | Conjugate to a U_p-stable lattice before reduction modulo p, or take the finite normal core; an arbitrary U_p need not normalize the standard principal congruence subgroup. |
| `AA.4/double-coset-level-map` | sources | Source version, locator and/or quoted-passage scope corrected as described in the source audit. |
| `AA.4/double-coset-level-cardinality` | sources | Source version, locator and/or quoted-passage scope corrected as described in the source audit. |
| `AA.4/finite-support-product-index` | sources | Source version, locator and/or quoted-passage scope corrected as described in the source audit. |
| `AA.4/level-quotient` | acceptance | Correct the O(2) component convention: it identifies the two half-planes and determinant classes modulo ±1; SO(2) gives the φ(N) upper-half-plane components. |
| `AA.4/level-covering-map` | hypotheses, proofSteps, statement | Under compact-modulo-A_G hypotheses, finite neat rational stabilizers are trivial and the degree is [U:U′]. Normal U′ gives a canonical principal U/U′ action. The full deck group may be larger for disconnected covers, so no unconditional full-deck equality is asserted. |
| `AA.4/level-quotient-groupoid` | api, proofSteps, statement, tests | Separate the groupoid for any closed K∞ from its finite-stabilizer theorem, which requires compactness modulo A_G. Neatness then makes the actual finite stabilizer trivial. |
| `AA.4/hecke-cartesian` | hypotheses, statement | Normality of U′ does not imply U′U_g=U, and the one-leg base change is not the ordinary Hecke correspondence at U′. |
| `AA.4/level-volume-index` | sources | Source version, locator and/or quoted-passage scope corrected as described in the source audit. |
| `AA.4/plus-subgroup` | sources | Source version, locator and/or quoted-passage scope corrected as described in the source audit. |
| `AA.4/residual-quotient` | sources | Source version, locator and/or quoted-passage scope corrected as described in the source audit. |
| `AA.4/quaternion-reduced-norm-image` | proofSteps, sources | An unramified quadratic subfield supplies all unit norms but only even norm valuations; use a division-algebra uniformizer for odd valuation. |
| `AA.4/reduced-norm-components` | sources | Source version, locator and/or quoted-passage scope corrected as described in the source audit. |
| `AA.4/torus-image-residual` | sources | Source version, locator and/or quoted-passage scope corrected as described in the source audit. |
| `AA.4/residual-joint-limit` | sources | Source version, locator and/or quoted-passage scope corrected as described in the source audit. |
| `AA.5/gl1-XQ-components` | proofSteps | Divide by K∞ before computing the torus dimension: no extra complex S¹ factors survive. |
| `AA.5/gl1-component-dimension` | sources | Source version, locator and/or quoted-passage scope corrected as described in the source audit. |
| `AA.5/gl2-upper-half-plane-component` | prerequisites, proofSteps | Replace the erroneous glAction-to-ℍ± step by the explicit raw-action bridge. |
| `AA.5/definite-quaternion-compact` | proofSteps | Prove the full arithmetic subgroup finite using its norm-one condition, rather than only finiteness modulo the centre. |
| `AA.5/definite-quaternion-mass` | acceptance, proofSteps | Use G(ℝ)/ℝ_{>0}, not the undefined quotient G(ℝ)^1/ℝ_{>0}; correct the Eichler level-3 index to 4. |
| `AA.0/local-normalized-haar` | sources | Source version, locator and/or quoted-passage scope corrected as described in the source audit. |
| `AA.2/bruhat-section` | hypotheses, statement | Use right Haar measures for fibre averaging on H\G and the right G-action; left Haar measures do not have this convention for nonunimodular groups. |
| `AA.2/quotient-functional-well-defined` | hypotheses, proofSteps | State the right-Haar conventions explicitly; the required nonnormal cutoff/disintegration argument is recorded as a gap, not supplied by the normal IsSES construction. |
| `AA.4/s-arithmetic-nondiscrete` | hypotheses, statement | Require a nonempty finite extra-place set; the empty product is the discrete singleton. |
| `AA.4/level-action-free-at-neat` | hypotheses, proofSteps, statement | In the compact-modulo-A_G scope rational stabilizers are finite and torsion free, hence trivial; the entire U/U′ deck action is free. |
| `AA.5/gl2-real-quotient` | prerequisites, proofSteps | Use the raw Möbius ℍ± action and the new folding bridge; Mathlib glAction itself never leaves ℍ. |
| `AA.4/homogeneous-measure-pushforward` | sources | Source version, locator and/or quoted-passage scope corrected as described in the source audit. |
| `AA.4/chabauty-limit-kernels` | sources | Source version, locator and/or quoted-passage scope corrected as described in the source audit. |
| `AA.2/fundamental-domain-exists` | proofSteps | Use right translates Vg_n and VV⁻¹∩Γ={1} for left Γ-orbits; arbitrary left translates gV need not inject into Γ\G. |

Other top-level changes: the review object (all 204 nodes); summary and packet status; all six coverage objects with concrete remaining lists; 14 additional gaps, retaining the original six; corrected baseline metadata/replacement and five added declarations; five request records; source metadata/read-sections, review read dates and three additional source versions; independent verdicts on E1–E8 and added E9/E10. No original node or unit test was dropped.
