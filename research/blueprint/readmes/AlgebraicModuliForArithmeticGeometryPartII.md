# Roadmap: Algebraic moduli and representability for arithmetic geometry, Part II: numerical Picard groups and contraction descent

This Part II of AlgebraicModuliForArithmeticGeometry builds the numerical theory of invertible sheaves on proper schemes and the descent of contractions it controls. NP.0–NP.1 import curve degree and define its relative numerical pairing, relative numerical triviality Pic^τ(X/S), the groups Num(X/S), N¹(X/S), N₁(X/S), the cone NE‾(X/S), relative nefness and bigness, and prove the numerical Néron–Severi theorem. NP.2 extends the Picard theory of the parent and of JacobianChallenge Layer D to arbitrary proper schemes over a field: Murre–Oort representability, the Brauer obstruction over the affinization, Pic^τ\_{X/k} of finite type, the étale local system Num\_{X/k} and Schröer's positive-power criterion. NP.3–NP.4 prove Schröer's descent theorems: with constant Num, geometric contractions with projective target descend (Theorem 1.3), and for contractions of smooth proper surfaces fibre dual graphs, residue fields and edge labels descend (Theorem 2.1, corrected). NP.5 supplies the general numerical statements the mixed-characteristic MMP papers of Hacon–Witaszek and Bhatt et al. use: restriction to the special fibre over a DVR, numerical versus actual lifts, lifting with H²(O) = 0, cone identification, nef-and-big transfer, descent of semiample numerically trivial sheaves, Cascini–Tanaka vertical descent, extremal curves and the complex projective Alexeev–Hacon–Kawamata rank (its relative positive-characteristic extension remains open). The stable-surface moduli direction routed to the same parent is proposed as a separate roadmap, and the MMP-internal steps are assigned to the birational-geometry continuation of SchemeAndStackFoundations. The review records explicit proof/supplier gaps G1–G7; a complete planning pass does not certify closure of the later layers.

This is the independently reviewed target-level plan: 51 nodes, 103 API items, 71 named tests and 28 planets. Every layer is **planned** in the sense of Protocol section 0: a prerequisite chain can end in a recorded gap. No layer is closed. G1–G7 below identify the work required before the corresponding proof chains close. The suggested Lean file only elaborates the statements whose carriers exist at the pinned baseline.

## Scope, conventions and ownership

The new objects are the relative numerical pairing and quotient, numerical Picard local system, and contraction and graph descent interfaces. Degrees on proper curves are imported from StableReduction J-A2/JacobianChallenge A and SchemeAndStackFoundations SF.3. General relative Spec and the affine universal property are imported from current AlgebraicVectorBundles L1A–L1B; this roadmap applies the existing Stein factorization to identify the finite constants algebra and its units sheaf. Existing Tau Ceti matrix inequalities are imported for the geometric Zariski-lemma application.

A curve over a Noetherian base S lies in a fibre over a closed point s, with degree measured over κ(s), including its residue-field weights. The closed-point theorem compares this convention with testing every fibre. Pic^τ(X/S) is the subgroup of Pic(X) consisting of relatively numerically trivial classes; Pic^τ\_{X/k} is the group scheme. A positive tensor power always has exponent at least one. A contraction is proper and identifies the target structure sheaf with the direct image from its source.

The parent and ComplexComparisonPartII own the relative Picard sheaf, its stack and the existing representability contracts. JacobianChallenge owns invertible sheaves, curve degree, coherent cohomology and the projective geometrically integral Picard scheme. SchemeAndStackFoundations owns descent, étale/fppf cohomology, norms, intersection theory, Stein factorization and Grothendieck existence. The characteristic-zero projective numerical theory is compared with the upstream AbundanceStatement roadmap. The arbitrary proper Picard theorem here needs the genuinely broader nonflat-descent input G4.

Stable-surface moduli and MMP-specific theorems are routed to the proposed continuations below. EWM maps, Keel gluing and the positivity programme are not constructed here. Enriques-specific applications remain with EnriquesSurfacesAndIntegralNonexistence.

The current upstream roadmap checkout and Tau Ceti main were inspected separately from the pinned baseline. Later Euler-degree and matrix declarations are imports from their owners, not claims about the old pins. Current AlgebraicVectorBundles is missing from the atlas stage registry; its contract is linked at 2.2 and needs registration during an atlas refresh.

| Layer | Targets | Coverage |
|---|---|---|
| [0](#layer-0) | Degrees on curves and relative numerical triviality | planned; no direct gap |
| [1](#layer-1) | Numerical groups, cones, nefness and bigness | planned; explicit gaps; see below |
| [2](#layer-2) | The Picard scheme of a proper scheme over a field and the numerical local system | planned; explicit gaps; see below |
| [3](#layer-3) | Contractions, semiample sheaves and descent of contractions | planned; explicit gaps; see below |
| [4](#layer-4) | Component graphs and contractions of smooth surfaces | planned; explicit gaps; see below |
| [5](#layer-5) | Numerical theory in families and descent along contractions | planned; explicit gaps; see below |

## Baseline and current-library audit

Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Every declaration below was read at those pins; the supplies column includes the hypotheses that matter.

| Declaration | Module | Supplies |
|---|---|---|
| `AlgebraicGeometry.IsProper` | [Mathlib/AlgebraicGeometry/Morphisms/Proper.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Morphisms/Proper.lean) | The class of proper morphisms of schemes (separated, finite type, universally closed). |
| `AlgebraicGeometry.Scheme.Hom.finrank` | [Mathlib/AlgebraicGeometry/Morphisms/FlatRank.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Morphisms/FlatRank.lean) | Pointwise rank of a scheme morphism, defined using affine-local module ranks. Its finite-flat, locally finitely presented specialisation is the locally constant rank needed for finite locally free norms. |
| `CommRing.Pic` | [Mathlib/RingTheory/PicardGroup.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/PicardGroup.lean) | The Picard group of a commutative ring; an instance makes it trivial when the ring has finitely many maximal ideals (PicardGroup.lean, instance at line 545), used for semilocal finite algebras. |
| `DistribMulAction` | [Mathlib/Algebra/GroupWithZero/Action/Defs.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/GroupWithZero/Action/Defs.lean) | Actions of a monoid by additive endomorphisms, used for the Galois action on ℤ^ρ. |
| `IsAlgClosure` | [Mathlib/FieldTheory/IsAlgClosed/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/FieldTheory/IsAlgClosed/Basic.lean) | Algebraic closures of a field. |
| `IsSepClosure` | [Mathlib/FieldTheory/IsSepClosed.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/FieldTheory/IsSepClosed.lean) | Separable closures of a field. |
| `Module.finrank` | [Mathlib/LinearAlgebra/Dimension/Finrank.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Dimension/Finrank.lean) | Cardinal.toNat of Module.rank, defined for any module, with value zero at infinite rank. It computes the dimension used here only after finite-dimensionality is proved. |
| `SimpleGraph` | [Mathlib/Combinatorics/SimpleGraph/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Combinatorics/SimpleGraph/Basic.lean) | Simple graphs on a vertex type. |
| `irreducibleComponents` | [Mathlib/Topology/Irreducible.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Irreducible.lean) | The set of irreducible components of a topological space. |
| `separableClosure.isGalois` | [Mathlib/FieldTheory/IsSepClosed.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/FieldTheory/IsSepClosed.lean) | For an extension E/F with [Normal F E], its separable closure over F is Galois over F. Normality is required; NP.3 uses a finite normal extension. |
| `separableClosure.isPurelyInseparable` | [Mathlib/FieldTheory/PurelyInseparable/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/FieldTheory/PurelyInseparable/Basic.lean) | An algebraic extension is purely inseparable over the separable closure of the base in it. |
| `TauCeti.AlgebraicGeometry.LineBundleClass` | [TauCeti/AlgebraicGeometry/LineBundle/Class.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/LineBundle/Class.lean) | Isomorphism classes of invertible sheaves on a scheme, a commutative monoid under tensor product (no inverse or pullback at the pin). |

On current Tau Ceti main `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, `InvertibleSheaf.eulerDegree` and `LineBundleClass.eulerDegree` occur in `AlgebraicGeometry/LineBundle/Degree.lean`. The comparison `InvertibleSheaf.eulerDegree_eq_relativeDegree` and additivity `LineBundleClass.eulerDegree_mul` have the proper integral curve, local DVR and finite-dimensional H¹ hypotheses in `WeilDivisor/Scheme/EulerCharacteristic.lean`. The matrix results imported at 4.6 occur in `LinearAlgebra/Matrix/NegSemidef.lean` and `Curves/StableReduction/NumericalType/IntersectionForm.lean`. These files postdate the pins.

## Explicit proof and supplier gaps

**G1: All-dimensional finite-coefficient étale finiteness needs an exact registered supplier.** The rank proof needs finite H²\_et(X,μ\_ℓ) for arbitrary proper X over an algebraically closed field and ℓ invertible, including reducible and nonreduced X. SF.2 supplies Kummer and field comparison but its audit points to the unregistered CohomologicalPointCounting family (PR #196, head 4bd72379658126cbe9be935656396f0c9dac4de0) for finite-coefficient theory. Neither a curve-only theorem nor proper base change supplies this all-dimensional finiteness statement. Read and register an exact target, or add the missing finite-coefficient finiteness target to its owner. Kleiman Remark 6.19 is a public restatement of finite generation, not a replacement proof. No unread SGA 6 proof is claimed.

Needed by [1.3](#np-1-3) (`NP.1/neron-severi-rank`), [1.4](#np-1-4) (`NP.1/finite-dimensionality`), [2.6](#np-2-6) (`NP.2/num-local-system`).

**G2: Relative numerical finite-dimensionality needs componentwise reduction.** Provide a finite projective Chow-cover/stratification reduction with geometrically integral component families after finite covers, proving that the relative numerical kernel is detected by finitely many generic fibre numerical kernels and the closed complement. Kleiman 6.3(g) assumes irreducibility and cannot detect the kernel on a reducible fibre by one Euler polynomial. This is a substantive proof gap, not a request for routine lemma splitting.

Needed by [1.4](#np-1-4) (`NP.1/finite-dimensionality`), [1.2](#np-1-2) (`NP.1/curve-space`).

**G3: Nef-and-big criterion on arbitrary proper schemes.** SF.5/nef-big-numerical and Keel Definition–Lemma 0.0 cover reduced projective schemes. The proper integral definition is retained here, but extending the criterion beyond projective schemes requires a sourced proof of birational invariance of bigness and the Chow-modification reduction. NP.5/nef-big-specialization uses only projective fibres and is unaffected.

Needed by [1.6](#np-1-6) (`NP.1/big`).

**G4: Arbitrary proper Picard representability requires nonflat descent.** Kleiman 4.18.3 and 4.18.5 state the needed theorems, but pp. 34–35 refer to Murre, Oort and Raynaud for their proofs. Read a freely available proof of arbitrary proper, possibly nonreduced Picard representability and the finite-type relative representability used for Pic^τ; add its exact target-level prerequisites or assign an extension to the parent/ComplexComparison owner. The existing projective geometrically integral and universal-functions contracts do not imply this generality.

Needed by [2.1](#np-2-1) (`NP.2/picard-scheme`), [2.5](#np-2-5) (`NP.2/tau-component`).

**G5: Proper Hilbert algebraic space and its tangent formula.** Extend the parent R09.2/projective Hilbert-scheme contract to the proper Hilbert algebraic space locally of finite presentation (Stacks 99.9.4, 0CZX) and its tangent space Hom(I\_C,O\_C) (99.7.10, 0CZV). The negative-curve repair needs this precise input for smooth proper surfaces, without assuming projectivity. The formulas and resulting descent argument have been checked, but the supplier extension is not yet planned.

Needed by [4.7](#np-4-7) (`NP.4/negative-curve-descent`), [4.8](#np-4-8) (`NP.4/fibre-graph-descent`), [4.9](#np-4-9) (`NP.4/reducible-fibre-residue`), [4.10](#np-4-10) (`NP.4/fibre-label-descent`).

**G6: High-dimensional vertical negativity input.** CT20 Lemma 2.17 proves vertical descent using a vertical negativity argument after suitable cuts; importing the surface Zariski lemma alone does not justify those cuts for arbitrary normal excellent schemes. Specify or source the relative vertical negativity statement, with the needed projectivity/local reduction, dimension and field hypotheses. The general excellent formulation remains a target, not a closed proof.

Needed by [5.7](#np-5-7) (`NP.5/vertical-descent`).

**G7: Relative positive-characteristic AHK rank.** AHK07 works with projective complex varieties. HW23 p. 12 consumes a relative positive-characteristic version. Supply the exceptional-divisor numerical independence and resolution-comparison theorem in that setting, including the projective slicing/regularity hypotheses; do not infer it merely from the existence of regular resolutions. The currently proved scope of NP.5/ahk-rank is the complex projective theorem.

Needed by [5.9](#np-5-9) (`NP.5/ahk-rank`).

<a id="layer-0"></a>

## Layer 0: Degrees on curves and relative numerical triviality

**Targets.** Compatibility and application of the imported degree deg\_κ(L) of an invertible sheaf on a proper scheme of dimension ≤ 1 over a field κ, with tensor, cycle, finite-pullback, base-field and field-extension laws; the curve index d\_C of an integral proper curve (Das–Waldron Lemma 4.1, Bhatt et al. Lemma 2.47); the predicate L ≡\_f 0 of relative numerical triviality for proper f : X → S over a Noetherian base, with the subgroup Pic^τ(X/S) ⊂ Pic(X); invariance of numerical triviality under extension of the base field; the theorem that closed points of S suffice; detection of numerical triviality by proper surjective pullback.

**Layer suppliers.** `SchemeAndStackFoundations:SF.0`; `SchemeAndStackFoundations:SF.3`; `SchemeAndStackFoundations:SF.5`; [JacobianChallenge](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/JacobianChallenge/README.md#layer-a-line-bundles-divisors-picard-group-degree) (`layer-a-line-bundles-divisors-picard-group-degree`); [JacobianChallenge](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/JacobianChallenge/README.md#layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality) (`layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality`); [JacobianChallenge](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/JacobianChallenge/README.md#layer-c-relative-coherent-cohomology-and-base-change) (`layer-c-relative-coherent-cohomology-and-base-change`); [StableReduction](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/StableReduction/README.md#layer-2-coherent-curve-theory-duality-and-positivity) (`layer-2-coherent-curve-theory-duality-and-positivity`).

<a id="np-0-1"></a>

### 0.1 Imported curve degree and its relative numerical pairing

`NP.0/curve-degree` · definition · planet: Curve degree pairing

Use the degree of invertible sheaves on proper schemes of dimension at most one owned by StableReduction J-A2 (the JacobianChallenge Layer A contract) and SchemeAndStackFoundations SF.3/vector-bundle-degree. Its convention is deg\_κ(L) = χ\_κ(C,L) − χ\_κ(C,O\_C), allowing nonreduced curves and zero-dimensional components. This node identifies that imported degree with SF.5 first-Chern-class intersections and defines only the application (L·C) := deg\_{κ(s)}(L|\_C) for an integral curve C in X\_s. The residue field κ(s) is part of the pairing, even when C has a larger field of constants.

**Hypotheses.** κ a field; C proper over κ of dimension at most one; for (L·C): C is an integral curve in a fibre X\_s, proper over κ(s).

**Ownership.** Compatibility/application node. Current Tau Ceti main a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039 already defines InvertibleSheaf.eulerDegree and LineBundleClass.eulerDegree in LineBundle/Degree.lean. WeilDivisor/Scheme/EulerCharacteristic.lean proves eulerDegree\_eq\_relativeDegree and LineBundleClass.eulerDegree\_mul for proper integral curves with DVR local rings in codimension one and finite-dimensional H¹(O). These are imports for that covered case; the general curve API remains with StableReduction J-A2 and SF.3, not this Part II. The current declarations are later than the baseline and are not claimed present at the pins.

**Sources.**

- [KLE05](https://arxiv.org/pdf/math/0504020v1), Definition 6.1, p. 52: Numerical equivalence on a complete scheme over a field is defined by equality of ∫c₁L·[Y] over complete integral curves Y, and this number equals the degree of L on Y and on its normalization.
- [BMP23](https://arxiv.org/pdf/2012.15801v3), §2.5, paragraph before Remark 2.22, p. 18: For a projective morphism to Z, a curve over Z is a one-dimensional scheme proper over a closed point of Z; intersection numbers L·\_k C are degrees over the residue field k of that closed point.
- [STACKS](https://stacks.math.columbia.edu), Section 33.45 (tag 0BEL), Numerical intersections: Intersection numbers (L₁⋯L\_d·Z) of invertible sheaves with a proper d-dimensional closed subscheme over a field are defined through Euler characteristics; d = 1 is the degree used here.

**Proof or construction.**

1. Import the Euler-characteristic degree and its tensor, cycle, finite-pullback and field-extension laws from StableReduction J-A2/JacobianChallenge Layer A and SF.3/vector-bundle-degree; coherent finiteness and base change are JacobianChallenge B–C. No second degree theory is constructed here.
2. Compare the imported degree with SF.5/c1\_degree\_curve by the degree-one Euler-characteristic intersection formula (Stacks Section 33.45). Tensor additivity and the vanishing contribution from zero-dimensional components are imported laws.
3. Cycle formula: deg\_κ(L) = Σ\_i m\_i deg\_κ(L|\_{C\_i}) over the one-dimensional irreducible components C\_i with reduced structure, m\_i = length O\_{C,η\_i}; zero-dimensional components contribute nothing. This is SchemeAndStackFoundations §5.3's c1\_degree\_curve, deg(c₁(L) ∩ [C]\_1), on the fundamental 1-cycle.
4. On an integral proper curve the degree equals the degree of the pullback to the normalization and the residue-weighted degree of the divisor of any rational section (JacobianChallenge Layer A, Kleiman 2005, Definition 6.1).

**Uses.**

- Schröer 2023, §1, p. 4: numerical triviality of an invertible sheaf on the geometric fibre is vanishing of all these degrees
- Bhatt et al. 2023, §2.5, p. 18 and Lemma 2.47: f-nefness and the intersection pairing with curves over closed points of the base
- Hacon–Witaszek 2023, §6: numerical equivalence of Q-line bundles on the special fibre of a lift over a DVR
- this roadmap NP.0/numerically-trivial, NP.1/numerical-group: the pairing whose kernel defines Pic^τ(X/S) and N¹(X/S)

**API.**

- `Numerical.curveDegree` (data): Imported degree API (local notation only; retain the supplier implementation): deg\_κ(L) ∈ ℤ for an invertible sheaf L on a proper κ-scheme C of dimension ≤ 1, depending only on the isomorphism class of L.
- `Numerical.curveDegree_tensor` (simp): Imported degree API (local notation only; retain the supplier implementation): deg\_κ(L ⊗ M) = deg\_κ(L) + deg\_κ(M); deg\_κ(O\_C) = 0.
- `Numerical.curveDegree_inv` (simp): Imported degree API (local notation only; retain the supplier implementation): deg\_κ(L^{-1}) = −deg\_κ(L) and deg\_κ(L^{⊗n}) = n·deg\_κ(L) for n ∈ ℤ.
- `Numerical.curveDegree_cycle` (characterisation): Imported degree API (local notation only; retain the supplier implementation): deg\_κ(L) = Σ\_i length(O\_{C,η\_i})·deg\_κ(L|\_{(C\_i)\_red}) over the generic points η\_i of the one-dimensional irreducible components.
- `Numerical.curveDegree_finite_pullback` (functoriality): Imported degree API (local notation only; retain the supplier implementation): For a finite surjective κ-morphism π : C′ → C of integral proper curves, deg\_κ(π*L) = [κ(C′) : κ(C)]·deg\_κ(L).
- `Numerical.curveDegree_baseField` (compatibility): Imported degree API (local notation only; retain the supplier implementation): If C is proper over a finite extension κ′ ⊃ κ, then deg\_κ(L) = [κ′ : κ]·deg\_{κ′}(L).
- `Numerical.curveDegree_fieldExtension` (compatibility): Imported degree API (local notation only; retain the supplier implementation): For any field extension K/κ, deg\_K(L\_K on C\_K) = deg\_κ(L on C) (flat base change of cohomology).
- `Numerical.curveDegree_eq_chow` (compatibility): On an integral proper curve, deg\_κ(L) = deg(c₁(L) ∩ [C]) of SchemeAndStackFoundations §5.3 and agrees with JacobianChallenge Layer A's deg for smooth projective geometrically integral curves.

**Direct prerequisites.** [JacobianChallenge](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/JacobianChallenge/README.md#layer-a-line-bundles-divisors-picard-group-degree) (`layer-a-line-bundles-divisors-picard-group-degree`); [JacobianChallenge](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/JacobianChallenge/README.md#layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality) (`layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality`); [JacobianChallenge](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/JacobianChallenge/README.md#layer-c-relative-coherent-cohomology-and-base-change) (`layer-c-relative-coherent-cohomology-and-base-change`); `SchemeAndStackFoundations:SF.3`; `SchemeAndStackFoundations:SF.5`; `tauceti:TauCeti.AlgebraicGeometry.LineBundleClass`; `mathlib:AlgebraicGeometry.IsProper`; `SchemeAndStackFoundations:SF.3/vector-bundle-degree`; [StableReduction](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/StableReduction/README.md#layer-2-coherent-curve-theory-duality-and-positivity) (`layer-2-coherent-curve-theory-duality-and-positivity`).

**Checks.**

- `Numerical.curveDegree_projectiveLine` (computation): On P¹\_κ, deg\_κ(O(m)) = m for every m ∈ ℤ.
- `Numerical.curveDegree_realForm` (computation): For C = P¹\_ℂ viewed as a proper ℝ-scheme, deg\_ℝ(O(1)) = 2 and deg\_ℂ(O(1)) = 1: the base field is part of the data.
- `Numerical.curveDegree_trivial` (degenerate): deg\_κ(O\_C) = 0, and on a zero-dimensional proper κ-scheme every invertible sheaf has degree 0.
- `Numerical.curveDegree_doubleLine` (computation): For the nonreduced conic C = V(y²) ⊂ P²\_κ, deg\_κ(O(1)|\_C) = 2 = 2·deg(O(1)|\_line): nilpotent multiplicities count.
- `Numerical.curveDegree_ne_euler` (non-example): χ(L) is not the degree: on P¹\_κ, χ(O) = 1 while deg(O) = 0.
- deg\_κ O\_{P¹\_κ}(m) = m.
- deg over κ depends on κ: P¹\_ℂ regarded as an ℝ-scheme has deg\_ℝ O(1) = 2.
- On the double line V(y²) ⊂ P²\_κ, deg O(1)|\_C = 2.

<a id="np-0-2"></a>

### 0.2 Divisibility of curve degrees by the geometric index d_C

`NP.0/curve-index` · theorem · planet: Curve index d_C

Let X be a scheme locally of finite type over a field k, C ⊂ X an integral curve proper over k, k̄ an algebraic closure and φ : X\_{k̄} → X the projection. There is an integer d\_C ≥ 1, depending only on C, such that for every invertible sheaf L on X (more generally every ℝ-Cartier divisor D) and every integral curve C′ ⊂ X\_{k̄} with φ(C′) = C one has (L·C)\_k = d\_C·(φ*L·C′)\_{k̄}. In particular d\_C divides (L·C)\_k for every invertible L. Explicitly d\_C = m·r, where (C\_{k̄})\_red has r irreducible components, all of multiplicity m in the fundamental cycle of C\_{k̄}.

**Hypotheses.** k a field, C integral and proper over k; the conclusion is for every component C′ of (C\_{k̄})\_red.

**Sources.**

- [BMP23](https://arxiv.org/pdf/2012.15801v3), Lemma 2.47 and proof, p. 25: For a proper curve over a point of a Dedekind base there is a positive integer d\_C with D·C = d\_C(φ*D·C̄) for every ℝ-Cartier D and every geometric component C̄ over C; Cartier degrees are divisible by d\_C.
- [DW22](https://arxiv.org/pdf/1911.04394v3), Lemma 3.6, p. 10, and Lemma 4.1, p. 12: Lemma 3.6 gives invariance of a curve intersection under extending the ground field; Lemma 4.1, pp. 12–13, gives d\_C = [L:k]/[K(E):K(C)] and the common factor relating an integral curve to its geometric components.

**Proof or construction.**

1. The group Aut(k̄/k) permutes the irreducible components of C\_{k̄} transitively, since C is irreducible and k̄/k is normal (purely inseparable steps are homeomorphisms).
2. Conjugate components have equal multiplicity in [C\_{k̄}] and equal φ*L-degree, because φ*L is Aut(k̄/k)-invariant up to isomorphism.
3. Field-extension invariance of degrees (curve-degree API) gives (L·C)\_k = deg\_{k̄}(φ*L|\_{C\_{k̄}}) = Σ\_i m·(φ*L·C′\_i) = m·r·(φ*L·C′).
4. Das–Waldron Lemma 4.1 expresses the same index as [L:k]/[K(E):K(C)], with their finite fields of definition and notation; it is a quotient, not a product. The cycle calculation above supplies the intrinsic integer m·r without choices of fields.

**Direct prerequisites.** [0.1](#np-0-1) (`NP.0/curve-degree`); `mathlib:IsAlgClosure`; `SchemeAndStackFoundations:SF.0`.

**Checks.**

- For C = P¹\_ℂ viewed over ℝ, d\_C = 2 and every invertible sheaf has even ℝ-degree on C.
- For k = F\_p(t), k′ = k(t^{1/p}) and C = P¹\_{k′} viewed over k, C\_{k̄} is a p-fold thickening of P¹\_{k̄}: d\_C = p.
- For geometrically integral C, d\_C = 1.

<a id="np-0-3"></a>

### 0.3 Numerical triviality is invariant under extension of the base field

`NP.0/field-extension-invariance` · theorem

Let X be proper over a field k, L ∈ Pic(X) and K/k any field extension. Then (L·C) = 0 for every integral curve C ⊂ X if and only if (L\_K·C′) = 0 for every integral curve C′ ⊂ X\_K.

**Hypotheses.** X proper over k; K/k arbitrary (not necessarily algebraic).

**Sources.**

- [KLE05](https://arxiv.org/pdf/math/0504020v1), Exercise 6.11, Proposition 6.12 and Remark 6.14, pp. 57–58: τ-equivalence to O\_X is membership in Pic^τ; forming Pic^τ commutes with extending k; for complete X numerical and τ-equivalence agree over an algebraically closed field.
- [KLE05](https://arxiv.org/pdf/math/0504020v1), Theorem 6.3, pp. 52–53: Over an algebraically closed field on a projective scheme, τ-equivalence to O\_X, numerical equivalence to O\_X and boundedness of the powers are equivalent.

**Proof or construction.**

1. (⇐) For C ⊂ X, the base change C\_K is a proper one-dimensional K-scheme and deg\_k(L|\_C) = deg\_K(L\_K|\_{C\_K}) = Σ\_i m\_i (L\_K·C\_i) = 0.
2. (⇒), K/k finite: X\_K → X is finite; a curve C′ ⊂ X\_K maps finitely onto an integral curve C ⊂ X, and the projection formula gives [K:k]·(L\_K·C′)\_K = [κ(C′):κ(C)]·(L·C)\_k = 0.
3. (⇒), general K: C′ is defined over a finitely generated k-subalgebra A ⊂ K; spread C′ to a flat proper family of curves over an open of Spec A and specialise to a closed point a, whose residue field is finite over k (Nullstellensatz). Degrees are constant in flat proper families of curves (χ(L^{⊗n}) is locally constant), so (L\_K·C′) equals a degree on X\_{κ(a)}, which vanishes by the finite case.
4. Equivalently: the τ-component of the Picard scheme commutes with extension of k and its points are the numerically trivial classes (Kleiman, Proposition 6.12 and Remark 6.14).

**Direct prerequisites.** [0.1](#np-0-1) (`NP.0/curve-degree`); `SchemeAndStackFoundations:SF.0`; [JacobianChallenge](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/JacobianChallenge/README.md#layer-c-relative-coherent-cohomology-and-base-change) (`layer-c-relative-coherent-cohomology-and-base-change`).

**Checks.**

- On P¹\_ℝ, O(m) is numerically trivial iff it is so on P¹\_ℂ, iff m = 0.
- A curve on X\_K need not map onto a curve of X (a generic line of P²\_{k(u)} dominates P²\_k); the proof specialises instead of taking images.

<a id="np-0-4"></a>

### 0.4 Relative numerical triviality and the subgroup Pic^τ(X/S)

`NP.0/numerically-trivial` · definition · planet: Relative numerical triviality

Let f : X → S be a proper morphism with S Noetherian. An invertible sheaf L on X is f-numerically trivial, written L ≡\_f 0 (or L ≡\_S 0), if (L·C) = 0 for every point s ∈ S and every integral curve C ⊂ X\_s. Two invertible sheaves are f-numerically equivalent if L ⊗ M^{-1} ≡\_f 0. The f-numerically trivial classes form a subgroup Pic^τ(X/S) ⊂ Pic(X); this subgroup of Pic(X) is distinct from the group scheme Pic^τ\_{X/k} of NP.2, whose rational points it is compared with there. For S = Spec k this is numerical equivalence on the proper k-scheme X.

**Hypotheses.** f proper, S Noetherian; curves in all fibres, degrees over residue fields of S.

**Sources.**

- [BMP23](https://arxiv.org/pdf/2012.15801v3), Remark 2.22, p. 19: Pic^τ(X/S) is the subgroup of line bundles numerically trivial on all fibres of a proper morphism of Noetherian schemes, with the parenthetical claim that closed points suffice.
- [SCH23](https://arxiv.org/pdf/2004.07025v3), §1, p. 4: Pic^τ\_{X/k} parametrises invertible sheaves numerically trivial on the geometric fibre of a proper scheme over a field.
- [WIT22](https://arxiv.org/pdf/2002.11915v2), §2, p. 7: Relative nefness over a Noetherian base tests degrees on integral proper curves in all fibres over their residue fields.

**Proof or construction.**

1. The subgroup property is the tensor and inverse API of NP.0/curve-degree.
2. By NP.0/closed-points-suffice the condition may be tested over closed points of S only (the convention of Bhatt et al.), and by NP.0/field-extension-invariance on geometric fibres (the convention of Schröer).

**Uses.**

- Schröer 2023, Lemma 1.1, Proposition 1.2, Theorem 2.1: the kernel of the numerical class map Pic → Num on a proper scheme over a field
- Bhatt et al. 2023, Remark 2.22 and Propositions 2.51, 9.16: relative numerical triviality ≡\_Z 0 over the base of a contraction
- Hacon–Witaszek 2023, Theorem 1.3(2), §6: numerical equivalence on the special fibre of a lift
- Witaszek 2022, Proposition 5.3 and Keel 1999 Lemma 2.16: numerically trivial line bundles on projective schemes over locally finite fields are torsion
- EnriquesSurfacesAndIntegralNonexistence Layers 0 and 2: Pic^τ of an Enriques surface and its relative version

**API.**

- `Numerical.NumericallyTrivial` (data): The predicate L ≡\_f 0 on Pic(X) for proper f : X → S.
- `Numerical.numericallyTrivialSubgroup` (structure): Pic^τ(X/S) is a subgroup of Pic(X): closed under ⊗, inverse, containing O\_X.
- `Numerical.numericallyTrivial_pullback_base` (simp): f*N ≡\_f 0 for N ∈ Pic(S).
- `Numerical.numericallyTrivial_iff_closedPoints` (characterisation): L ≡\_f 0 iff (L·C) = 0 for all curves C in fibres over closed points of S (NP.0/closed-points-suffice).
- `Numerical.numericallyTrivial_iff_geometric` (characterisation): L ≡\_f 0 iff L\_{s̄} is numerically trivial on X\_{s̄} for every geometric point s̄ (NP.0/field-extension-invariance).
- `Numerical.numericallyTrivial_baseChange` (functoriality): If L ≡\_f 0 then L\_T ≡\_{f\_T} 0 for every morphism T → S of Noetherian schemes.
- `Numerical.numericallyTrivial_restrict` (functoriality): If Z ⊂ X is closed then L ≡\_f 0 implies L|\_Z ≡\_{f|\_Z} 0.
- `Numerical.numericallyTrivial_iff_surface` (compatibility): For S = Spec k with k algebraically closed and X a smooth projective surface, L ≡ 0 iff L is Chow.NumericallyEquivalent to O\_X in SchemeAndStackFoundations §5.10; for projective varieties over algebraically closed fields of characteristic zero it is AbundanceStatement Layer 4B's numerical equivalence.

**Direct prerequisites.** [0.1](#np-0-1) (`NP.0/curve-degree`); `mathlib:AlgebraicGeometry.IsProper`; `mathlib:CommRing.Pic`; `tauceti:TauCeti.AlgebraicGeometry.LineBundleClass`; [0.3](#np-0-3) (`NP.0/field-extension-invariance`); [0.5](#np-0-5) (`NP.0/closed-points-suffice`).

**Checks.**

- `Numerical.numericallyTrivial_projectiveLine` (computation): On P¹\_k over S = Spec k, O(m) ≡ 0 iff m = 0.
- `Numerical.numericallyTrivial_identity` (degenerate): For f = id\_S every L ∈ Pic(S) is f-numerically trivial, so Pic^τ(S/S) = Pic(S) even when Pic(S) ≠ 0.
- `Numerical.numericallyTrivial_elliptic` (non-example): On an elliptic curve E over k̄ with distinct points p, q, O(p − q) ≡ 0 although O(p − q) ≇ O\_E: numerically trivial is weaker than trivial.
- `Numerical.numericallyTrivial_relative_ruling` (computation): For the first projection f : P¹×P¹ → P¹, O(a,b) ≡\_f 0 iff b = 0, while O(a,b) ≡ 0 over Spec k iff a = b = 0.
- f*N ≡\_f 0 for every N ∈ Pic(S).
- For the identity X = S every invertible sheaf is numerically trivial.
- On an Enriques surface over k̄ of characteristic ≠ 2, ω is numerically trivial and nontrivial.

<a id="np-0-5"></a>

### 0.5 Numerical triviality can be tested over closed points of the base

`NP.0/closed-points-suffice` · theorem

Let f : X → S be proper with S Noetherian and L ∈ Pic(X). If (L·D) = 0 for every closed point t ∈ S and every integral curve D ⊂ X\_t, then L ≡\_f 0.

**Hypotheses.** f proper, S Noetherian.

**Sources.**

- [BMP23](https://arxiv.org/pdf/2012.15801v3), Remark 2.22, p. 19: The parenthetical remark that numerical triviality on all fibres may be checked over closed points only; the proof is supplied here.
- [STACKS](https://stacks.math.columbia.edu), tag 00PH: A Noetherian local domain that is not a field is dominated by a discrete valuation ring with the same fraction field.

**Proof or construction.**

1. Suppose the conclusion fails at some point; by Noetherian induction choose a failing point s whose closure T is minimal. T ≠ {s}, since closed points satisfy the hypothesis.
2. Choose a codimension-one point t′ of T and apply Stacks Lemma 10.119.13 (00PH) to O\_{T,t′}. This gives a dominating DVR R with fraction field κ(s); its residue field extends κ(t′), and that extension need not be assumed finite.
3. For a curve C ⊂ X\_s, base change its closure to Spec R and take the flat closure Z of its generic fibre; Z is proper and flat of relative dimension one over R, and χ(L^{⊗n}) is constant on its fibres, so the degree of L on C (with generic ground field κ(s)) equals the degree on the special fibre, a one-dimensional proper scheme over κ(R).
4. The special fibre's one-dimensional components lie in X\_{t′} ⊗ κ(R); L is numerically trivial on X\_{t′} by minimality of T, hence on X\_{t′} ⊗ κ(R) (NP.0/field-extension-invariance). The cycle formula gives degree 0, a contradiction.

**Direct prerequisites.** [0.1](#np-0-1) (`NP.0/curve-degree`); [0.3](#np-0-3) (`NP.0/field-extension-invariance`); `SchemeAndStackFoundations:SF.0`; [JacobianChallenge](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/JacobianChallenge/README.md#layer-c-relative-coherent-cohomology-and-base-change) (`layer-c-relative-coherent-cohomology-and-base-change`).

**Checks.**

- Over S = Spec ℤ\_p and X = P¹\_S, testing the special fibre recovers O(m) ≡\_f 0 iff m = 0.
- Generic fibres alone do not suffice: let X = Bl\_x(P¹\_R) for a k-rational point x of the special fibre over a DVR R. The exceptional curve E is P¹\_k, O(E) has degree −1 on E, and its restriction to the generic fibre is trivial.

<a id="np-0-6"></a>

### 0.6 Proper surjective pullback detects numerical triviality

`NP.0/surjective-pullback` · theorem

Let g : X′ → X be a proper surjective morphism of schemes proper over a Noetherian S. For L ∈ Pic(X), L ≡\_S 0 if and only if g*L ≡\_S 0. Hence g* : Num(X/S) → Num(X′/S) (NP.1) is injective.

**Hypotheses.** g proper and surjective over S; X, X′ proper over S Noetherian.

**Sources.**

- [KLE05](https://arxiv.org/pdf/math/0504020v1), Remark 6.14, pp. 57–58: For a surjection from a projective variety given by Chow's lemma, numerical triviality of the pullback follows from the projection formula; the converse lifting of curves is the standard complement.
- [STACKS](https://stacks.math.columbia.edu), Lemma 33.45.7 (tag 0BET): Intersection numbers of pulled-back invertible sheaves on a closed subscheme equal the degree of the map onto its image times those on the image.

**Proof or construction.**

1. (⇒) A curve C′ in a fibre of X′ maps onto a curve D or to a point; by the projection formula (g*L·C′) = [κ(C′):κ(D)](L·D), or 0.
2. (⇐) Given a curve D ⊂ X\_s, the generic fibre of g over the generic point of D is a nonempty proper scheme; the closure of one of its closed points is an integral curve C′ ⊂ X′\_s mapping finitely onto D, and (g*L·C′) = [κ(C′):κ(D)](L·D) with a positive factor.

**Direct prerequisites.** [0.4](#np-0-4) (`NP.0/numerically-trivial`); [0.1](#np-0-1) (`NP.0/curve-degree`); `SchemeAndStackFoundations:SF.5`.

**Checks.**

- For the normalization ν : C̃ → C of a nodal cubic, ν*L ≡ 0 iff L ≡ 0.
- For the blow-up g : Bl\_p P² → P², g*O(1) is not numerically trivial; the exceptional curve meets it in degree 0 but a line's strict transform does not.

<a id="layer-1"></a>

## Layer 1: Numerical groups, cones, nefness and bigness

**Targets.** Num(X/S) = Pic(X)/Pic^τ(X/S), N¹(X/S)\_ℚ, N¹(X/S)\_ℝ and ρ(X/S); the space N₁(X/S) of 1-cycles on curves over closed points and the cone NE‾(X/S); the numerical Néron–Severi theorem for proper schemes over a field (Num free of finite rank, with the étale rank bound) and its relative version over a Noetherian base; relative nefness and the nef cone; bigness on integral proper schemes with the nef criterion. Compatibility with SchemeAndStackFoundations §5.10 (surfaces) and with the characteristic-zero numerical theory of the upstream AbundanceStatement roadmap. G1–G3 record the cohomological supplier, reducible-fibre reduction and arbitrary proper nef-and-big extension still needed.

**Layer suppliers.** `AlgebraicModuliForArithmeticGeometryPartII:NP.0`; `SchemeAndStackFoundations:SF.2`; `SchemeAndStackFoundations:SF.4`; `SchemeAndStackFoundations:SF.5`; [JacobianChallenge](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/JacobianChallenge/README.md#layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality) (`layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality`); [JacobianChallenge](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/JacobianChallenge/README.md#layer-c-relative-coherent-cohomology-and-base-change) (`layer-c-relative-coherent-cohomology-and-base-change`).

**Closure work.**

- G1: identify and register the all-dimensional finite-coefficient étale finiteness input.
- G2: prove the componentwise relative finite-dimensionality reduction.
- G3: extend the projective nef-and-big criterion to arbitrary proper integral schemes.

<a id="np-1-1"></a>

### 1.1 The relative numerical group N¹(X/S) and the relative Picard number

`NP.1/numerical-group` · definition · planet: Relative numerical group N¹(X/S)

For f : X → S proper with S Noetherian put Num(X/S) := Pic(X)/Pic^τ(X/S), N¹(X/S)\_ℚ := Num(X/S) ⊗ ℚ and N¹(X/S) := N¹(X/S)\_ℝ := Num(X/S) ⊗ ℝ, with the class map [−] : Pic(X) → Num(X/S). The relative Picard number is ρ(X/S) := dim\_ℝ N¹(X/S), finite by NP.1/finite-dimensionality. Equivalently N¹(X/S)\_ℚ is (Pic(X) ⊗ ℚ) modulo the kernel of the ℚ-linear degree pairing with curves in fibres, which is Hacon–Witaszek's N¹(X) = Pic(X) ⊗ ℚ/≡ for S = Spec k.

**Hypotheses.** f proper, S Noetherian.

**Sources.**

- [BMP23](https://arxiv.org/pdf/2012.15801v3), Remark 2.22, p. 19: N¹(X/S) is defined as (Pic(X)/Pic^τ(X/S)) ⊗ ℝ, finite-dimensional, with ρ(X/S) its dimension, the relative Picard rank.
- [HW23](https://arxiv.org/pdf/2009.02631v2), §1, after Theorem 1.3, p. 3: N¹(X) is Pic(X) ⊗ ℚ modulo numerical equivalence, the ℚ-line bundles up to numerical equivalence.

**Proof or construction.**

1. Num(X/S) is torsion-free: if L^{⊗n} ≡\_f 0 with n ≠ 0, cancel n in each integer degree.
2. Torsion-freeness makes Num → N¹\_ℚ → N¹\_ℝ injective, and tensoring the exact sequence 0 → Pic^τ(X/S) → Pic(X) → Num → 0 with ℚ identifies N¹\_ℚ with Pic ⊗ ℚ modulo ℚ-numerical equivalence.

**Uses.**

- Hacon–Witaszek 2023, Theorem 1.3(2) and Lemma 6.3: surjectivity of the restriction N¹(𝒳/R) → N¹(X) from a lift over a DVR to its special fibre
- Bhatt et al. 2023, Remark 2.22 and §9: ρ(X/Z) = 1 for extremal contractions; W ⊂ Div\_ℚ(X) as functionals on faces
- Alexeev–Hacon–Kawamata 2007, Lemma 1.6: dim N¹(X) ⊗ ℝ of a resolution enters the birational rank NP.5/ahk-rank
- Schröer 2023, §1: Num(X\_{k̄}) ≅ ℤ^ρ is the stalk of the local system Num\_{X/k}

**API.**

- `Numerical.Num` (data): Num(X/S) := Pic(X)/Pic^τ(X/S), an abelian group with class map Pic(X) → Num(X/S).
- `Numerical.Num.mk_eq_mk_iff` (extensionality): [L] = [M] in Num(X/S) iff L ⊗ M^{-1} ≡\_f 0.
- `Numerical.Num.pairing` (data): The degree pairing Num(X/S) × {curves in fibres} → ℤ descends from Pic(X).
- `Numerical.Num.torsionFree` (instance): Num(X/S) is torsion-free.
- `Numerical.N1` (data): N¹(X/S)\_ℚ := Num ⊗ ℚ and N¹(X/S) := Num ⊗ ℝ with the injective maps Num ↪ N¹\_ℚ ↪ N¹\_ℝ.
- `Numerical.relativePicardNumber` (data): ρ(X/S) := dim\_ℝ N¹(X/S) ∈ ℕ.
- `Numerical.Num.pullback` (functoriality): An S-morphism g : X′ → X of proper S-schemes induces g* : Num(X/S) → Num(X′/S), with id* = id and (g∘h)* = h*∘g*; injective when g is surjective.
- `Numerical.Num.baseChange` (functoriality): For a field extension K/k, Num(X/k) → Num(X\_K/K) is injective (NP.0/field-extension-invariance).
- `Numerical.N1.qCartierClass` (constructor): For normal X and a ℚ-Cartier Weil divisor D with rD Cartier, [D] := (1/r)[O\_X(rD)] ∈ N¹(X/S)\_ℚ, independent of r.
- `Numerical.Num.eq_surface` (compatibility): For a smooth projective surface over an algebraically closed field, Num(X/k) is SchemeAndStackFoundations §5.10's Num S; for projective varieties over algebraically closed fields of characteristic zero, N¹(X/k)\_ℝ is AbundanceStatement Layer 4B's N¹(X)\_ℝ.

**Direct prerequisites.** [0.4](#np-0-4) (`NP.0/numerically-trivial`); [0.6](#np-0-6) (`NP.0/surjective-pullback`); `mathlib:Module.finrank`.

**Checks.**

- `Numerical.Num_projectiveLine` (computation): Num(P¹\_k/k) ≅ ℤ via the degree, and ρ = 1.
- `Numerical.Num_identity` (degenerate): Num(S/S) = 0 and ρ(S/S) = 0 for the identity, whatever Pic(S) is.
- `Numerical.Num_productRelative` (computation): For the first projection P¹×P¹ → P¹, Num ≅ ℤ by the fibre degree b of O(a,b); over Spec k, Num ≅ ℤ² with intersection matrix [[0,1],[1,0]].
- `Numerical.Num_ne_Pic_elliptic` (non-example): For an elliptic curve E over k̄, Pic(E) ≅ E(k̄) × ℤ but Num(E/k̄) ≅ ℤ: the numerical group is not the Picard group.
- `Numerical.Num_torsion_killed` (non-example): For an Enriques surface Y over k̄ (characteristic ≠ 2), the class of ω has order 2 in Pic(Y) and is zero in Num(Y/k̄).
- ρ(P¹×P¹/k) = 2 and ρ(P¹×P¹/P¹) = 1 for a projection.
- ρ(S/S) = 0 for the identity.

<a id="np-1-2"></a>

### 1.2 Relative 1-cycles N₁(X/S) and the cone of curves NE(X/S)

`NP.1/curve-space` · definition · planet: Relative cone of curves

For f : X → S proper with S Noetherian, a curve over S is an integral one-dimensional closed subscheme C ⊂ X with f(C) a closed point s, proper over κ(s). Let Z₁(X/S)\_ℝ be the real vector space on curves over S, paired with Pic(X) by (L·Σa\_iC\_i) = Σ a\_i (L·C\_i)\_{κ(s\_i)}. Put N₁(X/S) := Z₁(X/S)\_ℝ modulo the cycles pairing to zero with every invertible sheaf. NE(X/S) ⊂ N₁(X/S) is the convex cone of classes Σ a\_i[C\_i] with a\_i ≥ 0, and NE‾(X/S) its closure in the Euclidean topology of the finite-dimensional space N₁(X/S).

**Hypotheses.** f proper, S Noetherian; curves lie over closed points, degrees over their residue fields.

**Sources.**

- [BMP23](https://arxiv.org/pdf/2012.15801v3), §2.5, paragraph before Remark 2.22, p. 18: Curves over Z are one-dimensional schemes proper over a closed point of Z; N₁ is spanned by integral curves over Z modulo numerical equivalence; f-nefness is nonnegativity on such curves.
- [HW23](https://arxiv.org/pdf/2009.02631v2), proof of Theorem 1.3(2a), p. 33: Only curves projective over the base, hence in the special fibre, enter the definition of NE for a scheme over a DVR.

**Proof or construction.**

1. By NP.0/closed-points-suffice, the kernel of Pic(X) → Hom(Z₁(X/S), ℤ) is Pic^τ(X/S), so the pairing N¹(X/S) × N₁(X/S) → ℝ is nondegenerate on both sides.
2. With N¹(X/S) finite-dimensional (NP.1/finite-dimensionality), nondegeneracy makes N₁(X/S) its dual; NE‾ is a closed convex cone, not assumed polyhedral.

**Uses.**

- Bhatt et al. 2023, Theorem 9.9, Proposition 9.16, Definition 9.30: extremal rays and faces V = L^⊥ ⊂ NE‾(X/T)
- Hacon–Witaszek 2023, proof of Theorem 6.1(2a): comparison of NE(𝒳/S) with NE(X) of the special fibre
- this roadmap NP.5/cone-identification and NP.5/extremal-curve: identification of relative cones and minimal normalised degree on a ray

**API.**

- `Numerical.N1curves` (data): N₁(X/S) as the quotient of real 1-cycles on curves over closed points by the numerically trivial ones.
- `Numerical.N1curves.pairing` (data): The bilinear pairing N¹(X/S) × N₁(X/S) → ℝ.
- `Numerical.N1curves.pairing_perfect` (equivalence): The pairing identifies N₁(X/S) with the ℝ-dual of N¹(X/S).
- `Numerical.coneOfCurves` (data): NE(X/S) and its closure NE‾(X/S), a closed convex cone.
- `Numerical.N1curves.pushforward` (functoriality): For an S-morphism g : X′ → X of proper S-schemes, g\_*[C] = [κ(C):κ(g(C))]·[g(C)] or 0, with (g*L·γ) = (L·g\_*γ) and g\_*(NE(X′/S)) ⊂ NE(X/S).

**Direct prerequisites.** [1.1](#np-1-1) (`NP.1/numerical-group`); [0.5](#np-0-5) (`NP.0/closed-points-suffice`).

**Checks.**

- `Numerical.coneOfCurves_productLines` (computation): For P¹×P¹ over k, N₁ ≅ ℝ² and NE‾ is the closed cone spanned by the classes of the two rulings.
- `Numerical.coneOfCurves_identity` (degenerate): For f = id\_S there are no curves over S: N₁(S/S) = 0 and NE(S/S) = {0}.
- `Numerical.coneOfCurves_relativeRuling` (computation): For the first projection P¹×P¹ → P¹, N₁(X/S) = ℝ·[fibre] and NE‾ is its nonnegative ray.
- `Numerical.coneOfCurves_not_closed` (non-example): NE(X/S) itself need not be closed (on suitable abelian or K3 surfaces it is a round cone with irrational boundary); the closure is part of the definition.
- For P¹×P¹ over k, NE‾ is spanned by the two rulings.
- For S = X, N₁ = 0.

<a id="np-1-3"></a>

### 1.3 Numerical Néron–Severi theorem for proper schemes over a field

`NP.1/neron-severi-rank` · theorem · planet: Numerical Néron–Severi theorem

Let X be proper over a field k. Then Num(X/k) is a free abelian group of finite rank, and rank Num(X/k) ≤ ρ(X\_{k̄}) := rank Num(X\_{k̄}/k̄). For k algebraically closed and ℓ a prime invertible in k, ρ(X) ≤ dim\_{𝔽\_ℓ} H²\_ét(X, μ\_ℓ).

**Hypotheses.** X proper over a field; the étale bound needs ℓ invertible in k and k algebraically closed.

**Sources.**

- [KLE05](https://arxiv.org/pdf/math/0504020v1), Remark 6.19, pp. 59–60: For proper X/S the rank of the Néron–Severi group Pic/Pic^τ of geometric fibres is finite and bounded; the proof is in SGA 6, Exposé XIII, Theorem 5.1.
- [BMP23](https://arxiv.org/pdf/2012.15801v3), Remark 2.22, p. 19: Finite-dimensionality of N¹ over a field is Kleiman 1966, §4, Proposition 2.

**Proof or construction.**

1. Num(X/k) ↪ Num(X\_{k̄}/k̄) (NP.1/numerical-group, base-change API), so assume k = k̄.
2. Rank bound: if b\_1, …, b\_r ∈ Num are ℤ-independent, choose curves C\_1, …, C\_r with det((b\_i·C\_j)) ≠ 0; the image of Num → ℤ^r, L ↦ ((L·C\_j))\_j, is a lattice of rank r, so dim\_{𝔽\_ℓ} Num/ℓNum ≥ r. Num/ℓ is a quotient of Pic(X)/ℓ, which injects into H²\_ét(X, μ\_ℓ) by the Kummer sequence; that group is finite for X proper over k = k̄. The all-dimensional étale finiteness input has not been located in a registered supplier; it remains gap G1. Kleiman Remark 6.19 records finite generation as a theorem, but does not provide this proof input.
3. Freeness: with r = rank Num, choose curves with det((b\_i·C\_j)) ≠ 0 for a ℚ-basis b\_i; L ↦ ((L·C\_j)) is injective on the torsion-free Num, so Num embeds in ℤ^r.
4. In characteristic zero this recovers AbundanceStatement Layer 4B item 2 for projective varieties; for smooth projective surfaces it recovers SchemeAndStackFoundations §5.10's Num.free\_finiteRank.

**Direct prerequisites.** [1.1](#np-1-1) (`NP.1/numerical-group`); [0.3](#np-0-3) (`NP.0/field-extension-invariance`); `SchemeAndStackFoundations:SF.2`; `SchemeAndStackFoundations:SF.5`.

**Checks.**

- ρ(P^n\_k) = 1.
- For an elliptic curve E over k̄, ρ(E × E) = 2 + rank End(E) ∈ {3, 4, 6}, the value 6 occurring only for supersingular E in positive characteristic.

<a id="np-1-4"></a>

### 1.4 Finite-dimensionality of N¹(X/S) over a Noetherian base

`NP.1/finite-dimensionality` · theorem

For f : X → S proper with S Noetherian, Num(X/S) is a free abelian group of finite rank, so N¹(X/S) is finite-dimensional and ρ(X/S) < ∞.

**Hypotheses.** f proper, S Noetherian.

**Sources.**

- [BMP23](https://arxiv.org/pdf/2012.15801v3), Remark 2.22, p. 19: N¹(X/S) is finite-dimensional for proper morphisms of Noetherian schemes by the arguments of Kleiman 1966 for varieties over a field.
- [KLE05](https://arxiv.org/pdf/math/0504020v1), Theorem 6.16 and proof, pp. 58–59: Theorem 6.16 concerns finite-type components of a projective relative Picard scheme; its use of Theorem 6.3(g) requires geometrically integral fibres. It does not prove the asserted arbitrary proper relative theorem without the additional componentwise reduction.

**Proof or construction.**

1. The absolute result over a field is NP.1/neron-severi-rank, subject to its recorded cohomological supplier gap. Relative finite-dimensionality is a target recorded in BMP23 Remark 2.22; the former generic-flatness sketch does not prove it.
2. A possible reduction is a projective Chow cover followed by a finite stratification and finite field covers on which each reduced geometric component spreads to a flat geometrically integral projective family. On each such component, Kleiman Theorem 6.3(g) detects numerical triviality by χ(L^p(n)) = χ(O(n)) for every p,n, and these Euler characteristics are constant in a connected flat proper family.
3. That componentwise reduction, including simultaneous coverage of every fibre and descent of the numerical kernel, is not supplied by generic flatness alone. It is gap G2; no closure is claimed for the general Noetherian-base theorem.
4. Once the reduction is established, inject the degree quotient into the direct sum of the generic numerical lattices and the numerical quotient on the closed complement, and use Noetherian induction. A subgroup of a finite direct sum of finite free abelian groups is finite free.

**Direct prerequisites.** [1.3](#np-1-3) (`NP.1/neron-severi-rank`); [0.5](#np-0-5) (`NP.0/closed-points-suffice`); `SchemeAndStackFoundations:SF.4`; [JacobianChallenge](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/JacobianChallenge/README.md#layer-c-relative-coherent-cohomology-and-base-change) (`layer-c-relative-coherent-cohomology-and-base-change`).

**Checks.**

- For S = Spec k this is NP.1/neron-severi-rank.
- ρ(X/S) ≤ ρ(X/k) for X proper over a field and S proper over k.
- The Euler-polynomial test cannot be used on a reducible fibre without separating its components: on P¹ ⊔ P¹ with the standard ample sheaf, L = O(1) ⊔ O(−1) satisfies χ(L^p(n)) = χ(O(n)) for all integers p,n but has nonzero component degrees.

<a id="np-1-5"></a>

### 1.5 Relatively nef invertible sheaves and ℝ-Cartier classes

`NP.1/relative-nef` · definition · planet: Relative nefness

For f : X → S proper with S Noetherian, L ∈ Pic(X) (or a class in N¹(X/S)) is f-nef if (L·C) ≥ 0 for every curve C over S, equivalently if [L] lies in the nef cone Nef(X/S) := {α ∈ N¹(X/S) : α·γ ≥ 0 for γ ∈ NE‾(X/S)}. A ℚ- or ℝ-Cartier divisor is f-nef if its class is.

**Hypotheses.** f proper, S Noetherian; testing over closed points of S.

**Sources.**

- [BMP23](https://arxiv.org/pdf/2012.15801v3), §2.5, paragraph before Remark 2.22, p. 18: An ℝ-Cartier divisor is f-nef when its degree on every integral curve over Z is nonnegative.
- [WIT22](https://arxiv.org/pdf/2002.11915v2), §2, p. 7: L is S-nef when its degree on every integral proper curve in a fibre is nonnegative, degrees over that fibre's residue field.

**Proof or construction.**

1. Nonnegativity on curves extends to NE(X/S) by linearity and to NE‾ by continuity of the pairing; so the two descriptions agree.
2. Testing over all points of S is equivalent: the specialization argument of NP.0/closed-points-suffice transports a degree on a curve over a nonclosed point to a nonnegative combination of degrees over a closed point.

**Uses.**

- Witaszek 2022, §§2, 5–6; Bhatt et al. 2023, §§2.8, 9: nef line bundles in Keel-type base point free and EWM theorems
- Hacon–Witaszek 2023, §6: nefness of a lifted class on the generic fibre (NP.5/nef-big-specialization)
- Cascini–Tanaka 2020, Lemma 2.17: hypothesis of vertical descent (NP.5/vertical-descent)
- AbundanceStatement Layer 4C: absolute nef cone in characteristic zero, which this specialises to

**API.**

- `Numerical.IsRelNef` (data): f-nefness of L ∈ Pic(X), of α ∈ N¹(X/S) and of ℚ/ℝ-Cartier divisors.
- `Numerical.nefCone` (data): Nef(X/S) ⊂ N¹(X/S), the dual of NE‾(X/S); closed and convex.
- `Numerical.IsRelNef.iff_cone` (characterisation): L is f-nef iff [L] ∈ Nef(X/S).
- `Numerical.IsRelNef.add` (relation): Nef classes are closed under addition and positive scaling; numerically trivial classes are nef.
- `Numerical.IsRelNef.pullback` (functoriality): If g : X′ → X is an S-morphism of proper S-schemes and L is f-nef then g*L is nef; the converse holds for g surjective.
- `Numerical.IsRelNef.baseChange` (functoriality): Nefness is preserved by base change T → S of Noetherian schemes and detected on geometric fibres.
- `Numerical.IsRelNef.eq_abundance` (compatibility): For S = Spec k, k algebraically closed of characteristic zero, X a projective variety, f-nefness is AbundanceStatement Layer 4C's nefness.

**Direct prerequisites.** [1.2](#np-1-2) (`NP.1/curve-space`); [0.5](#np-0-5) (`NP.0/closed-points-suffice`).

**Checks.**

- `Numerical.IsRelNef_projectiveLine` (computation): On P¹\_k, O(m) is nef iff m ≥ 0.
- `Numerical.IsRelNef_identity` (degenerate): For f = id\_S every invertible sheaf is f-nef (there are no curves over S).
- `Numerical.IsRelNef_blowup` (non-example): On Bl\_p P² the exceptional curve E has O(E)·E = −1, so O(E) is not nef although it is effective.
- `Numerical.IsRelNef_relativeRuling` (computation): For the first projection P¹×P¹ → P¹, O(a,b) is f-nef iff b ≥ 0, with a arbitrary.
- On P¹\_k, O(m) is nef iff m ≥ 0.
- Numerically trivial classes are nef.

<a id="np-1-6"></a>

### 1.6 Big invertible sheaves on integral proper schemes over a field

`NP.1/big` · definition · planet: Bigness

Let V be an integral proper scheme of dimension n over a field k. An invertible sheaf L on V is big if there is c > 0 with h⁰(V, L^{⊗m}) ≥ c·m^n for all sufficiently large and divisible m. Top intersection numbers (L^n·V) are the n-fold numerical intersections of SchemeAndStackFoundations §5.3 / Stacks §33.45. For projective V and nef L, L is big iff (L^n·V) > 0, imported from SF.5/nef-big-numerical. Extending this criterion to arbitrary integral proper V is a remaining target (G3).

**Hypotheses.** V integral and proper over a field; nefness is with respect to Spec k.

**Sources.**

- [WIT22](https://arxiv.org/pdf/2002.11915v2), §2, p. 7: Relative bigness on integral X is growth of sections of L^k on the generic fibre at rate k^{dim}, for sufficiently large divisible k.
- [KEE99](https://arxiv.org/pdf/math/9901149v1), Definition–Lemma 0.0, printed p. 254 (PDF p. 2); Lemma 1.7, printed p. 262 (PDF p. 10): For a nef line bundle on a reduced projective scheme, positivity of the top self-intersection on every irreducible component characterises bigness. The exceptional-locus consequence is Lemma 1.7.

**Proof or construction.**

1. Import the reduced projective nef-and-big criterion from SF.5/nef-big-numerical. Keel, Definition–Lemma 0.0, printed p. 254 (PDF p. 2), states this criterion; Lemma 1.7, printed p. 262, is a consequence about the exceptional locus, not its original statement.
2. Bigness is invariant under numerical equivalence on projective integral schemes, without a nefness assumption. The present proof uses only the imported nef criterion; no unsupported assertion about higher cohomology or Fujita vanishing is made.
3. The definition makes sense on arbitrary proper integral V, and field-extension invariance follows from flat base change of H⁰. A proof of the nef top-intersection criterion in that broader setting requires proper birational invariance of bigness and a projective Chow modification; this extension is recorded in G3.

**Uses.**

- Hacon–Witaszek 2023, §6 (nef and big transfer): NP.5/nef-big-specialization transfers nef and big from the special to the generic fibre
- Witaszek 2022, §2 and Bhatt et al. 2023, §2.8: the exceptional locus E(L) is the union of subvarieties on which L is not big

**API.**

- `Numerical.IsBig` (data): Bigness of an invertible sheaf on an integral proper k-scheme.
- `Numerical.IsBig.iff_topIntersection_of_nef` (characterisation): For projective integral V and nef L, L is big iff (L^n·V) > 0; import SF.5/nef-big-numerical. The arbitrary proper extension is G3.
- `Numerical.IsBig.pow` (relation): L is big iff L^{⊗m} is big for some (every) m ≥ 1.
- `Numerical.IsBig.fieldExtension` (compatibility): For K/k with V\_K integral, L is big iff L\_K is big (flat base change of H⁰).

**Direct prerequisites.** [1.5](#np-1-5) (`NP.1/relative-nef`); `SchemeAndStackFoundations:SF.5`; [JacobianChallenge](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/JacobianChallenge/README.md#layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality) (`layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality`); `SchemeAndStackFoundations:SF.5/nef-big-numerical`.

**Checks.**

- `Numerical.IsBig_projectiveSpace` (computation): O(1) on P^n\_k is big; h⁰(O(m)) = binom(m+n, n).
- `Numerical.IsBig_trivial` (degenerate): O\_V is big iff dim V = 0.
- `Numerical.IsBig_productPullback` (non-example): On P¹×P¹, the pullback O(1,0) of O(1) along a projection is nef with (O(1,0)²) = 0 and is not big.
- O(1) on P^n is big; O on a positive-dimensional V is not big.

<a id="layer-2"></a>

## Layer 2: The Picard scheme of a proper scheme over a field and the numerical local system

**Targets.** Representability of Pic\_{X/k} for an arbitrary proper k-scheme (Murre–Oort, Kleiman Corollary 4.18.3), with no condition on H⁰(X, O\_X); the affinization X^aff and h\_*G\_m; torsion of Brauer groups of finite algebras and the Leray obstruction Pic(X) → Pic\_{X/k}(k) → Br(X^aff) (Schröer Lemma 1.4); the torsion component Pic^τ\_{X/k} open, closed, of finite type, with points the numerically trivial classes; the étale local system Num\_{X/k} with stalk ℤ^ρ and constancy; norms along finite field extensions and torsion of split Pic^τ-torsors; Schröer's positive-power criterion (Lemma 1.1, with d ≥ 1); the doubling lift through a 2-torsion kernel; finiteness of rational τ-classes over finite fields and torsion of numerically trivial sheaves over algebraic extensions of finite fields. Arbitrary proper representability requires the nonflat-descent input G4; it is not deduced from the projective geometrically integral case alone.

**Layer suppliers.** `AlgebraicModuliForArithmeticGeometryPartII:NP.0`; `AlgebraicModuliForArithmeticGeometryPartII:NP.1`; [JacobianChallenge](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/JacobianChallenge/README.md#layer-d-the-relative-picard-functor-and-the-jacobian-scheme) (`layer-d-the-relative-picard-functor-and-the-jacobian-scheme`); `AlgebraicModuliForArithmeticGeometry:A0-extension`; `ComplexComparisonPartII:C3`; `SchemeAndStackFoundations:SF.1`; `SchemeAndStackFoundations:SF.2`; `SchemeAndStackFoundations:SF.3`; `SchemeAndStackFoundations:SF.4`.

**Closure work.**

- G4: supply a proof and exact prerequisites of arbitrary proper Picard representability and its relative finite-type comparison.
- Its numerical lattice also depends on NP.1/G1.

<a id="np-2-1"></a>

### 2.1 The Picard scheme of a proper scheme over a field (Murre–Oort)

`NP.2/picard-scheme` · theorem · planet: Picard scheme of a proper scheme over a field

Let X be a proper scheme over a field k, not necessarily reduced, connected or equidimensional, and without assuming H⁰(X, O\_X) = k. The fppf sheafification Pic\_{X/k} of T ↦ Pic(X\_T) on k-schemes (equivalently of T ↦ Pic(X\_T)/Pic(T)) is represented by a commutative group scheme, locally of finite type and separated over k, which is a disjoint union of open quasi-projective subschemes. Formation of Pic\_{X/k} commutes with every field extension K/k.

**Hypotheses.** X proper over a field; no condition on H⁰(X, O\_X), reducedness or connectedness.

**Sources.**

- [KLE05](https://arxiv.org/pdf/math/0504020v1), Corollary 4.18.3 and the following paragraphs, pp. 34–35; Proposition 4.17, p. 33: If X is complete over a field, Pic\_{X/k} exists, represents the fppf Picard functor and is a disjoint union of open quasi-projective subschemes (Murre, Oort, Grothendieck); if it exists it is locally of finite type.
- [SCH23](https://arxiv.org/pdf/2004.07025v3), §1, p. 4: Uses the Picard scheme of an arbitrary proper scheme over a field, allowing nonreduced, reducible or non-equidimensional X.

**Proof or construction.**

1. Kleiman Corollary 4.18.3 states the arbitrary proper-field theorem; Proposition 4.17 proves local finite type. The projective geometrically integral case is imported from JacobianChallenge D and the parent/ComplexComparison Picard contracts.
2. The extension to arbitrary proper, possibly nonreduced X requires Murre–Oort/Raynaud representability: nilpotent dévissage and nonflat descent along a projective Chow cover. Kleiman Theorem 4.18.5 states relative representability, and pp. 34–35 describe these ingredients, but do not prove them. They remain gap G4.
3. One cannot handle an arbitrary projective X merely component by component: intersections and nilpotent thickenings carry gluing data. No universal-functions hypothesis is added, and no such false reduction is used.
4. Given representability, base change follows from the relative Picard sheaf and separatedness from the closed identity of the locally finite-type group scheme over a field. The cited quasi-projective-open decomposition belongs to the representability input.

**Direct prerequisites.** [JacobianChallenge](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/JacobianChallenge/README.md#layer-d-the-relative-picard-functor-and-the-jacobian-scheme) (`layer-d-the-relative-picard-functor-and-the-jacobian-scheme`); `AlgebraicModuliForArithmeticGeometry:A0-extension/relative-picard-sheaf`; `AlgebraicModuliForArithmeticGeometry:A0-extension/picard-space-representability`; `SchemeAndStackFoundations:SF.4`; `SchemeAndStackFoundations:SF.1`; `ComplexComparisonPartII:C3`.

**Checks.**

- Pic\_{P¹\_k/k} ≅ ∐\_{d∈ℤ} Spec k.
- For X = P¹\_ℂ viewed over ℝ, Pic\_{X/ℝ} is the Weil restriction of ℤ\_ℂ: its ℝ-points are ℤ and its ℂ-points ℤ².
- For X = Spec k[ε]/(ε²), Pic(X\_T) = 0 for local T, so Pic\_{X/k} is the trivial group scheme although H⁰(X, O\_X) ≠ k.

<a id="np-2-2"></a>

### 2.2 The affinization X^aff and the sheaf h_*G_m

`NP.2/affinization` · construction

For h : X → Spec k proper, X^aff := Spec H⁰(X, O\_X), a finite k-algebra, with the canonical morphism X → X^aff (Stein factorization of h). For every k-algebra A, Γ(X\_A, O) = H⁰(X, O\_X) ⊗\_k A, so h\_*G\_{m,X} = (X^aff → Spec k)\_*G\_m as fppf sheaves on k-schemes: the Weil restriction of G\_m from the finite algebra H⁰(X, O\_X).

**Hypotheses.** X proper over a field k.

**Ownership.** The affine hull and relative Spec are imported from current AlgebraicVectorBundles L1A–L1B (and SF.4 Stein factorisation). This node applies them to a proper scheme to obtain a finite constants algebra and identify its units sheaf; it does not reconstruct relative Spec.

**Sources.**

- [SCH23](https://arxiv.org/pdf/2004.07025v3), Lemma 1.4 and proof, pp. 7–8: Introduces X^aff = Spec H⁰(X, O\_X), a finite k-algebra, and identifies the direct images of G\_a and G\_m on X and X^aff using flat base change for the quasi-compact separated X.

**Proof or construction.**

1. Finite-dimensionality of H⁰(X, O\_X) (JacobianChallenge Layer C) and flat base change of coherent cohomology (SchemeAndStackFoundations §2.6) give the formula for Γ(X\_A, O).
2. Units of H⁰(X, O\_X) ⊗ A define the fppf sheaf h\_*G\_m; the Stein factorization X → X^aff → Spec k is SchemeAndStackFoundations §4.9's stein\_factorization.

**Uses.**

- Schröer 2023, Lemma 1.4: reduces the Leray obstruction H²(k, h\_*G\_m) to the Brauer group of a finite algebra
- this roadmap NP.2/leray-obstruction and NP.2/finite-algebra-brauer: the target of the Picard obstruction
- NP.3/contraction: X → X^aff is the contraction onto the affine part of the Stein factorisation of the structure morphism

**API.**

- `Picard.affinization` (data): X^aff = Spec H⁰(X, O\_X) with the morphism X → X^aff.
- `Picard.affinization_finite` (other): H⁰(X, O\_X) is a finite k-algebra, so X^aff is finite over k (a finite product of Artin local k-algebras).
- `Picard.affinization_baseChange` (functoriality): (X\_A)^aff = (X^aff)\_A for every k-algebra A, compatibly with the canonical maps.
- `Picard.directImage_units` (equivalence): h\_*G\_{m,X} ≅ (X^aff → Spec k)\_*G\_m as fppf sheaves of groups.
- `Picard.affinization_contraction` (characterisation): X → X^aff is a contraction (O\_{X^aff} ≅ (X → X^aff)\_*O\_X) and is universal among morphisms from X to affine k-schemes.

**Direct prerequisites.** [JacobianChallenge](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/JacobianChallenge/README.md#layer-c-relative-coherent-cohomology-and-base-change) (`layer-c-relative-coherent-cohomology-and-base-change`); `SchemeAndStackFoundations:SF.2`; `SchemeAndStackFoundations:SF.4`; `SchemeAndStackFoundations:SF.4/stein-factorization`.

**Existing upstream contract.** [AlgebraicVectorBundles](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AlgebraicVectorBundles/README.md#l1a--relative-spec): L1A–L1B: relative Spec and its affine universal property, with base change. SF.4/stein-factorization supplies the specific finite affine hull used here. The upstream layer has no atlas stage ID yet.

**Checks.**

- `Picard.affinization_projectiveLine` (computation): For X = P¹\_k, X^aff = Spec k.
- `Picard.affinization_realForm` (computation): For X = P¹\_ℂ viewed over ℝ, X^aff = Spec ℂ, a field extension of degree 2.
- `Picard.affinization_affine` (degenerate): For X = Spec B with B finite over k, X^aff = X.
- `Picard.affinization_disjoint` (computation): For X = P¹\_k ⊔ P¹\_k, X^aff = Spec(k × k); h\_*G\_m ≅ G\_m × G\_m.
- `Picard.affinization_ne_reduced` (non-example): For X = P¹ × Spec k[ε]/(ε²), X^aff = Spec k[ε]/(ε²) is not reduced; replacing it by its reduction changes h\_*G\_m by the unipotent factor 1 + εA.
- X^aff = Spec k when H⁰(X, O\_X) = k (for instance X geometrically integral).

<a id="np-2-3"></a>

### 2.3 Cohomological Brauer groups of finite algebras over a field are torsion

`NP.2/finite-algebra-brauer` · theorem

Let R be a finite k-algebra and h : Spec R → Spec k. On the small étale sites, h\_* is exact and R^i h\_*G\_m = 0 for every i > 0. Thus the Leray edge H²\_et(k,h\_*G\_m) → H²\_et(R,G\_m) is an isomorphism. Comparison with fppf cohomology for the smooth units group identifies this with H²\_fppf(k,h\_*G\_m) ≅ H²\_fppf(R,G\_m). Nilpotent invariance identifies the latter with ⊕\_i Br(K\_i), where R\_red = ∏\_i K\_i; it is torsion. The corresponding degree-one comparison is zero because Pic(R) = 0.

**Hypotheses.** R finite over a field k; cohomology is étale (= fppf) cohomology with G\_m coefficients.

**Sources.**

- [SCH23](https://arxiv.org/pdf/2004.07025v3), Lemma 1.4 and proof, pp. 7–8: H²(S, h\_*G\_m) = Br(X^aff) is torsion: R¹ vanishes by semilocality of finite algebras, R² by strict henselization over a separable closure, and Br of the reduction is a sum of field Brauer groups.
- ATLAS-EXTRACTIONS, PAPER-SCHROER-23/E22: The Leray edge map runs from H²(S, h\_*G\_m) to H²(X, G\_m); the printed direction is reversed.
- [KLE05](https://arxiv.org/pdf/math/0504020v1), Remark 2.11, p. 21: For smooth commutative group schemes the étale and fppf cohomology groups agree; this applies to the units Weil restriction of a finite algebra.

**Proof or construction.**

1. Import SF.2/finite-pushforward-exact on small étale sites, for all abelian sheaves and without a torsion restriction. This yields the Leray isomorphisms in degrees one and two directly.
2. For fppf comparison, the Weil restriction h\_*G\_m is a smooth affine group scheme: it is the open units locus in the affine space of the finite-dimensional k-algebra R. Use the smooth-group étale/fppf comparison stated in Kleiman Remark 2.11, p. 21. No exactness of arbitrary finite fppf pushforward is assumed.
3. For a nilpotent ideal I, filter 1+I by the groups 1+I^j; the successive quotients are additive quasi-coherent modules and have no higher cohomology on affine Spec R. This gives nilpotent invariance of H²(G\_m).
4. A finite reduced k-algebra is a product of fields. Their Brauer groups are torsion by SF.2 field cohomology/Brauer comparison. Pic(R) = 0 is the pinned semilocal CommRing.Pic instance.

**Direct prerequisites.** [2.2](#np-2-2) (`NP.2/affinization`); `mathlib:CommRing.Pic`; `SchemeAndStackFoundations:key/scheme-brauer`; `SchemeAndStackFoundations:SF.2`; `SchemeAndStackFoundations:SF.2/finite-pushforward-exact`.

**Checks.**

- For R = ℂ over ℝ, H²(ℝ, h\_*G\_m) = Br(ℂ) = 0.
- For R = k[ε]/(ε²), H²(R, G\_m) = Br(k).

<a id="np-2-4"></a>

### 2.4 The Brauer obstruction to representing points of Pic_{X/k}

`NP.2/leray-obstruction` · theorem · planet: Brauer obstruction over the affinization

Let h : X → Spec k be proper. The fppf Leray spectral sequence for h and G\_m gives an exact sequence 0 → Pic(X) → Pic\_{X/k}(k) → H²(k, h\_*G\_m) ≅ Br(X^aff) → H²(X, G\_m), with the first map the canonical one. Since Br(X^aff) is torsion, for every λ ∈ Pic\_{X/k}(k) there is n ≥ 1 with n·λ the class of an invertible sheaf on X. For every field K ⊃ k the map Pic(X\_K) → Pic\_{X/k}(K) is injective.

**Hypotheses.** X proper over a field; H⁰(X, O\_X) arbitrary.

**Sources.**

- [SCH23](https://arxiv.org/pdf/2004.07025v3), proof of Lemma 1.1, p. 5: The Leray–Serre sequence for h and G\_m gives H¹(X, G\_m) → H⁰(S, R¹h\_*G\_m) → H²(S, h\_*G\_m) with left arrow the canonical map, and torsion of the right term makes a multiple of every rational point come from an invertible sheaf.
- [KLE05](https://arxiv.org/pdf/math/0504020v1), Theorem 2.5 and Remark 2.11, pp. 17–21: The comparison of Picard functors and the Leray description of the obstruction between Pic(X\_T)/Pic(T) and the sheafified Picard functor.

**Proof or construction.**

1. R¹h\_*G\_m is the fppf Picard sheaf Pic\_{X/k} (Hilbert 90, SchemeAndStackFoundations §2.11), and h\_*G\_m = (X^aff → Spec k)\_*G\_m (NP.2/affinization).
2. The five-term sequence 0 → H¹(k, h\_*G\_m) → H¹(X, G\_m) → H⁰(k, R¹h\_*G\_m) → H²(k, h\_*G\_m) → H²(X, G\_m) has H¹(k, h\_*G\_m) = Pic(X^aff) = 0 (NP.2/finite-algebra-brauer, i = 1).
3. H²(k, h\_*G\_m) ≅ Br(X^aff) is torsion by NP.2/finite-algebra-brauer.
4. When H⁰(X, O\_X) = k this is AlgebraicModuliForArithmeticGeometry A0-extension/picard-brauer-obstruction over T = Spec k.

**Direct prerequisites.** [2.1](#np-2-1) (`NP.2/picard-scheme`); [2.2](#np-2-2) (`NP.2/affinization`); [2.3](#np-2-3) (`NP.2/finite-algebra-brauer`); `AlgebraicModuliForArithmeticGeometry:A0-extension/picard-brauer-obstruction`; `SchemeAndStackFoundations:SF.2`.

**Checks.**

- For the pointless real conic X, Pic(X) = 2ℤ ⊂ Pic\_{X/ℝ}(ℝ) = ℤ, the cokernel ℤ/2 = Br(ℝ) and n = 2 works.
- For X = P¹\_ℂ over ℝ, X^aff = Spec ℂ, Br(ℂ) = 0 and Pic(X) = Pic\_{X/ℝ}(ℝ) = ℤ.

<a id="np-2-5"></a>

### 2.5 The torsion component Pic^τ_{X/k} is open, closed and of finite type

`NP.2/tau-component` · theorem · planet: Torsion component Pic^τ

Let X be proper over k and G = Pic\_{X/k}. Put Pic^τ\_{X/k} := ⋃\_{n≥1} [n]^{-1}(G⁰), with G⁰ the identity component. Then Pic^τ\_{X/k} is an open and closed subgroup scheme of finite type, its formation commutes with every field extension, and for every field K ⊃ k and L ∈ Pic(X\_K), the class of L lies in Pic^τ\_{X/k}(K) iff L is numerically trivial on X\_K. In particular Pic^τ\_{X/k}(k̄) = Pic^τ(X\_{k̄}/k̄) of NP.0/numerically-trivial (Pic\_{X/k}(k̄) = Pic(X\_{k̄}) over an algebraically closed field).

**Hypotheses.** X proper over a field; the τ-numerical comparison uses NP.0/field-extension-invariance.

**Sources.**

- [KLE05](https://arxiv.org/pdf/math/0504020v1), Definition 6.8, Lemma 6.9, Exercise 6.11, Proposition 6.12 and Remark 6.14, pp. 56–58: G^τ is the union of preimages of G⁰ under the power maps, an open group subscheme compatible with field extension; for the Picard scheme of a complete scheme it is closed of finite type and its points are the τ-equivalent, equivalently numerically trivial, sheaves.
- [SCH23](https://arxiv.org/pdf/2004.07025v3), §1, p. 4: Pic^τ\_{X/k} parametrises numerically trivial sheaves, is of finite type and separated, citing SGA 6 Exposé XII Corollary 1.5 and Exposé XIII Theorem 4.7.

**Proof or construction.**

1. G⁰ is an open and closed subgroup of finite type compatible with field extension (group schemes locally of finite type over a field); [n]^{-1}(G⁰) are open and closed subgroups, so G^τ is an open subgroup compatible with field extension (Kleiman, Lemma 6.9).
2. Over k̄, membership of λ in G^τ is τ-equivalence of L with O\_X, which is numerical triviality (Kleiman, Exercise 6.11, Theorem 6.3; for complete X, Remark 6.14 via Chow's lemma and the projection formula).
3. Quasi-compactness: numerically trivial invertible sheaves on a projective scheme over k̄ form a bounded family (Kleiman, Theorem 6.3 and Proposition 6.12); for proper X pull back to a Chow cover X′ → X, whose induced map on Picard schemes is of finite type (Kleiman, Theorem 4.18.5), so Pic^τ is closed and of finite type. The finite-type relative representability used here is the same deep input left in G4; the proper generality is conditional on it.
4. Over k̄, every k̄-point of Pic\_{X/k} is represented by an invertible sheaf (NP.2/leray-obstruction with Br(X^aff\_{k̄}) = 0).

**Direct prerequisites.** [2.1](#np-2-1) (`NP.2/picard-scheme`); [0.4](#np-0-4) (`NP.0/numerically-trivial`); [0.3](#np-0-3) (`NP.0/field-extension-invariance`); [2.4](#np-2-4) (`NP.2/leray-obstruction`); `AlgebraicModuliForArithmeticGeometry:A0-extension/picard-zero-criterion`; `ComplexComparisonPartII:C3`.

**Checks.**

- Pic^τ\_{P¹/k} = 0; for an elliptic curve Pic^τ = Pic⁰ ≅ E; for an Enriques surface over k̄ of characteristic ≠ 2, Pic⁰ = 0 and Pic^τ ≅ ℤ/2.
- For an ordinary Enriques surface in characteristic 2, Pic^τ = μ₂ is connected and nonreduced, so Pic^τ = Pic⁰ with its full structure.

<a id="np-2-6"></a>

### 2.6 The local system of numerical classes Num_{X/k}

`NP.2/num-local-system` · construction · planet: Local system of numerical classes

For X proper over a field k put Num\_{X/k} := Pic\_{X/k}/Pic^τ\_{X/k} (fppf quotient). It is an étale group scheme over k, determined by the Galois module Num\_{X/k}(k^sep) = Num\_{X/k}(k̄) = Num(X\_{k̄}/k̄) ≅ ℤ^{ρ} with ρ = ρ(X\_{k̄}) ≥ 0, on which Gal(k^sep/k) acts continuously through a finite quotient. The class map Pic(X) → Num(X/k) → Num\_{X/k}(k) is injective on Num(X/k).

**Hypotheses.** X proper over a field; ρ = 0 is allowed.

**Sources.**

- [SCH23](https://arxiv.org/pdf/2004.07025v3), §1, pp. 4–5: Num\_{X/k} = Pic\_{X/k}/Pic^τ\_{X/k} is an étale group scheme, the local system of numerical classes, corresponding to the Galois representation on Num\_{X/k}(k^sep) = Num\_{X/k}(k^alg) = ℤ^ρ; ρ = 0 occurs; the group schemes exist without reducedness, irreducibility or equidimensionality.

**Proof or construction.**

1. Pic^τ\_{X/k} is open, so the quotient of the locally finite type group Pic\_{X/k} by it is étale (its geometric fibre is the discrete group of components modulo those of Pic^τ).
2. Over k̄: Num\_{X/k}(k̄) = Pic(X\_{k̄})/Pic^τ(X\_{k̄}/k̄) = Num(X\_{k̄}/k̄) by NP.2/tau-component; this is free of finite rank by NP.1/neron-severi-rank. Purely inseparable extensions do not change points of an étale scheme, so the k^sep- and k̄-points agree.
3. A finitely generated free ℤ-module with continuous action of a profinite group has open stabiliser, so the action factors through a finite quotient.
4. Injectivity of Num(X/k) → Num\_{X/k}(k): if [L] ∈ Pic^τ\_{X/k}(k) then L\_{k̄} is numerically trivial, hence L is (NP.0/field-extension-invariance).

**Uses.**

- Schröer 2023, Lemma 1.1, Proposition 1.2, Theorems 1.3 and 2.1: constancy of Num\_{X/k} is the hypothesis of every descent statement
- Schröer 2023, §§5, 7: the relative Num of an Enriques family and the point count of a surface with constant Num
- EnriquesSurfacesAndIntegralNonexistence Layers 2–3: Num ≅ (ℤ¹⁰)\_S and constant numerical Picard over finite fields and ℤ
- WeilConjectures WC.7: point count #X(F\_{q^r}) = 1 + b₂q^r + q^{2r} for surfaces with constant Num

**API.**

- `Picard.NumLocalSystem` (data): Num\_{X/k} := Pic\_{X/k}/Pic^τ\_{X/k}, an étale commutative group scheme over k.
- `Picard.NumLocalSystem.galoisModule` (equivalence): Étale group schemes over k ≃ discrete Gal(k^sep/k)-modules sends Num\_{X/k} to Num(X\_{k̄}/k̄) with its Galois action.
- `Picard.NumLocalSystem.stalk_free` (other): Num\_{X/k}(k^sep) is free abelian of rank ρ(X\_{k̄}), and equals Num\_{X/k}(k̄).
- `Picard.NumLocalSystem.classMap_injective` (other): Num(X/k) → Num\_{X/k}(k) is injective.
- `Picard.NumLocalSystem.baseChange` (functoriality): Num\_{X\_K/K} = (Num\_{X/k})\_K for every field extension K/k.
- `Picard.NumLocalSystem.pullback` (functoriality): A k-morphism g : X′ → X of proper k-schemes induces g* : Num\_{X/k} → Num\_{X′/k}, functorially; injective on stalks when g is surjective.

**Direct prerequisites.** [2.5](#np-2-5) (`NP.2/tau-component`); [1.3](#np-1-3) (`NP.1/neron-severi-rank`); [1.1](#np-1-1) (`NP.1/numerical-group`); `mathlib:IsSepClosure`; `mathlib:separableClosure.isPurelyInseparable`.

**Checks.**

- `Picard.NumLocalSystem_projectiveLine` (computation): Num\_{P¹\_k/k} ≅ ℤ\_k, the constant group scheme, generated by the class of O(1).
- `Picard.NumLocalSystem_realForm` (computation): For X = P¹\_ℂ viewed over ℝ, Num(X\_ℂ) = ℤ² with complex conjugation exchanging the two factors: Num\_{X/ℝ} is not constant.
- `Picard.NumLocalSystem_point` (degenerate): For X = Spec K with K/k finite, Num\_{X/k} = 0 and ρ = 0.
- `Picard.NumLocalSystem_isolatedPoint` (computation): For X = P¹\_ℝ ⊔ Spec ℂ over ℝ, Num\_{X/ℝ} ≅ ℤ\_ℝ is constant: zero-dimensional components contribute nothing.
- `Picard.NumLocalSystem_conic` (non-example): For the pointless real conic, Num\_{X/ℝ}(ℝ) = ℤ but the image of Pic(X) is 2ℤ: rational points of Num need not come from invertible sheaves.
- For X geometrically integral with a rational point, Pic(X) → Pic\_{X/k}(k) is bijective.

<a id="np-2-7"></a>

### 2.7 Constant numerical local system

`NP.2/constant-num` · definition

Num\_{X/k} is constant if Gal(k^sep/k) acts trivially on Num\_{X/k}(k^sep); equivalently Num\_{X/k} ≅ (ℤ^{⊕ρ})\_k = ∐\_{l∈ℤ^ρ} Spec k as group schemes.

**Hypotheses.** X proper over a field.

**Sources.**

- [SCH23](https://arxiv.org/pdf/2004.07025v3), §1, p. 5: A constant local system means the Galois representation Gal(k^sep/k) → GL\_ρ(ℤ) is trivial, equivalently Num\_{X/k} is the disjoint union of copies of Spec k indexed by ℤ^ρ.

**Proof or construction.**

1. The equivalence is the étale–Galois dictionary of NP.2/num-local-system: a trivial Galois module corresponds to a constant étale group scheme.

**Uses.**

- Schröer 2023, Theorems 1.3 and 2.1: the hypothesis under which contractions and fibre graphs descend
- EnriquesSurfacesAndIntegralNonexistence Layers 2–3: constant Num of Enriques surfaces over finite fields and over ℤ

**API.**

- `Picard.IsConstantNum` (data): The predicate that Gal(k^sep/k) acts trivially on Num\_{X/k}(k^sep).
- `Picard.IsConstantNum.iff_iso_constant` (characterisation): IsConstantNum X ↔ Num\_{X/k} ≅ (ℤ^ρ)\_k.
- `Picard.IsConstantNum.iff_finiteIndex` (characterisation): IsConstantNum X ↔ the image of Num(X/k) in Num(X\_{k̄}) has finite index (NP.2/positive-power-criterion).
- `Picard.IsConstantNum.baseChange` (functoriality): Constancy is preserved by every field extension K/k.
- `Picard.IsConstantNum.of_sepClosed` (other): If k is separably closed, Num\_{X/k} is constant.

**Direct prerequisites.** [2.6](#np-2-6) (`NP.2/num-local-system`).

**Checks.**

- `Picard.IsConstantNum_projectiveLine` (computation): Num\_{P¹\_k/k} is constant with ρ = 1.
- `Picard.IsConstantNum_realForm` (non-example): Num\_{P¹\_ℂ/ℝ} (P¹\_ℂ as an ℝ-scheme) is not constant: conjugation swaps the two generators of ℤ².
- `Picard.IsConstantNum_rhoZero` (degenerate): If ρ(X\_{k̄}) = 0 (for instance X finite over k), Num\_{X/k} is constant.
- `Picard.IsConstantNum_quadricSurface` (computation): For a smooth quadric surface Q ⊂ P³\_k whose two rulings are defined over a quadratic extension and swapped by Galois, Num\_{Q/k} is not constant though ρ(Q\_{k̄}) = 2; for the split quadric P¹×P¹ it is constant.
- Over a separably closed field every Num\_{X/k} is constant.

<a id="np-2-8"></a>

### 2.8 Norms of Picard classes along a finite field extension

`NP.2/picard-norm` · construction

Let E/k be a finite field extension of degree n, X proper over k, pr : X\_E → X and q : Spec E → Spec k. For every k-algebra A, pr\_A : X\_{E⊗A} → X\_A is finite locally free of rank n, and the norm of invertible sheaves Nm\_{pr\_A} : Pic(X\_{E⊗A}) → Pic(X\_A) (SchemeAndStackFoundations §3.5) is natural in A. It induces a homomorphism of fppf sheaves Nm : q\_*Pic\_{X\_E/E} → Pic\_{X/k} with Nm ∘ pr* = [n], mapping q\_*Pic^τ\_{X\_E/E} into Pic^τ\_{X/k}.

**Hypotheses.** E/k finite of degree n; X proper over k.

**Sources.**

- [SCH23](https://arxiv.org/pdf/2004.07025v3), proof of Lemma 1.1, p. 5: Besides pullback along the rank-n projection there is a norm map in the other direction with N∘pr* multiplication by n, referring to EGA II §6.5.
- ATLAS-EXTRACTIONS, PAPER-SCHROER-23/E20: The norm used in the proof must be taken on the τ-component Pic^τ\_{X′/E} = P ⊗\_k E, not on the whole Picard scheme.

**Proof or construction.**

1. The norm along a finite locally free morphism of constant rank n is a homomorphism with Nm(pr*L) ≅ L^{⊗n} and commutes with base change (SchemeAndStackFoundations §3.5); naturality in A passes to fppf sheafifications.
2. Nm preserves numerical triviality: on a curve C ⊂ X\_{K}, deg(Nm L|\_C) is a sum of degrees of L on the curves of X\_{E⊗K} over C (projection formula), so Nm maps Pic^τ into Pic^τ.

**Uses.**

- Schröer 2023, proof of Lemma 1.1: kills Pic^τ-torsor classes split by a finite extension (NP.2/torsor-torsion)
- Schröer 2023, proof of Lemma 8.4: norms of Picard classes in the isogeny argument consumed by GenusOneFibrations

**API.**

- `Picard.picardNorm` (data): Nm : q\_*Pic\_{X\_E/E} → Pic\_{X/k}, a homomorphism of fppf sheaves of abelian groups.
- `Picard.picardNorm_comp_pullback` (relation): Nm ∘ pr* = multiplication by n = [E : k] on Pic\_{X/k}.
- `Picard.picardNorm_tau` (other): Nm maps q\_*Pic^τ\_{X\_E/E} into Pic^τ\_{X/k}.
- `Picard.picardNorm_lineBundle` (compatibility): On classes of invertible sheaves Nm is SchemeAndStackFoundations §3.5's lineBundleNorm along X\_E → X.
- `Picard.picardNorm_trans` (functoriality): For k ⊂ E ⊂ F, Nm\_{F/k} = Nm\_{E/k} ∘ q\_*Nm\_{F/E}.

**Direct prerequisites.** [2.5](#np-2-5) (`NP.2/tau-component`); `SchemeAndStackFoundations:SF.3`; `mathlib:AlgebraicGeometry.Scheme.Hom.finrank`.

**Checks.**

- `Picard.picardNorm_projectiveLine` (computation): For X = P¹\_k, Nm(O\_{P¹\_E}(d)) = O(n·d) and the induced map on Num is multiplication by n.
- `Picard.picardNorm_trivialExtension` (degenerate): For E = k, Nm is the identity.
- `Picard.picardNorm_ne_pullbackInverse` (non-example): For n ≥ 2, Nm is not inverse to pr*: Nm ∘ pr* = [n] ≠ id on Pic\_{P¹/k} ≅ ℤ.
- For X = P¹\_k and E/k of degree n, Nm(O\_{P¹\_E}(1)) ≅ O\_{P¹\_k}(n).

<a id="np-2-9"></a>

### 2.9 Pic^τ-torsors split by a field extension of degree n are killed by n

`NP.2/torsor-torsion` · theorem

Let X be proper over k, P = Pic^τ\_{X/k} and l ∈ Num\_{X/k}(k). The fibre T\_l ⊂ Pic\_{X/k} over l is a P-torsor, with class [T\_l] ∈ H¹\_fppf(k, P). If T\_l has a point over a finite extension E/k of degree n, then n·[T\_l] = 0; consequently n·l lifts to a k-point of Pic\_{X/k}.

**Hypotheses.** X proper over a field; E/k finite of degree n; fppf cohomology.

**Sources.**

- [SCH23](https://arxiv.org/pdf/2004.07025v3), proof of Lemma 1.1, p. 5: Each rational point of Num is a representable torsor for Pic^τ, trivialised over the residue field of a closed point; the norm and the Leray–Serre sequence show its class has finite order.
- ATLAS-EXTRACTIONS, PAPER-SCHROER-23/E20: The printed vanishing of R¹pr\_*P′ is false in general and not needed: injectivity of H¹(k, pr\_*P′) → H¹(E, P′) from the five-term sequence suffices.

**Proof or construction.**

1. T\_l is a P-torsor because Pic → Num is a P-torsor over each point of the étale Num; a closed point of T\_l with residue field E splits it over E.
2. With P\_E = P ⊗\_k E = Pic^τ\_{X\_E/E} and q : Spec E → Spec k, the five-term sequence for q gives an injection H¹(k, q\_*P\_E) → H¹(E, P\_E); the class pr*[T\_l] maps to the split class, hence is zero.
3. Apply Nm : q\_*P\_E → P (NP.2/picard-norm): n·[T\_l] = Nm(pr*[T\_l]) = 0. A trivial torsor has a rational point, which lifts n·l.

**Direct prerequisites.** [2.6](#np-2-6) (`NP.2/num-local-system`); [2.8](#np-2-8) (`NP.2/picard-norm`); `SchemeAndStackFoundations:SF.2`.

**Checks.**

- For the pointless real conic and l the generator, T\_l is split by ℂ and 2l lifts (indeed l itself lifts to Pic\_{X/ℝ}(ℝ)).

<a id="np-2-10"></a>

### 2.10 Positive-power descent criterion for constancy of Num

`NP.2/positive-power-criterion` · theorem · planet: Positive-power descent criterion

Let X be proper over a field k. Num\_{X/k} is constant if and only if there is an integer d ≥ 1 such that for every invertible sheaf L on X\_{k̄} there is a numerically trivial invertible sheaf N on X\_{k̄} with L^{⊗d} ⊗ N isomorphic to the pullback of an invertible sheaf on X.

**Hypotheses.** X proper over a field; d ≥ 1 (d = 0 would make the condition vacuous).

**Sources.**

- [SCH23](https://arxiv.org/pdf/2004.07025v3), Lemma 1.1 and proof, pp. 5–6: Constancy of Num\_{X/k} is characterised by the existence of a power d such that every geometric invertible sheaf becomes, up to a numerically trivial twist, a pullback from X after raising to the d-th power; sufficiency by finite index, necessity by torsors and the Leray obstruction.
- ATLAS-EXTRACTIONS, PAPER-SCHROER-23/E1: The printed lemma allows d ≥ 0; with d = 0 the property holds for every X, so d ≥ 1 is required, as the proof uses.

**Proof or construction.**

1. (⇐) The condition says the image of Num(X/k) in Num(X\_{k̄}) ≅ ℤ^ρ contains d·ℤ^ρ, which is Galois-fixed; a group acting by automorphisms of a torsion-free ℤ^ρ and fixing d·ℤ^ρ fixes ℤ^ρ.
2. (⇒) For each l in a basis of Num\_{X/k}(k) = ℤ^ρ, NP.2/torsor-torsion gives n ≥ 1 with n·l ∈ image of Pic\_{X/k}(k), and NP.2/leray-obstruction gives n′ ≥ 1 with n′n·l ∈ image of Pic(X). Take d the product over a basis; then Pic(X) → Num\_{X/k}(k̄) has image containing d·ℤ^ρ.

**Direct prerequisites.** [2.9](#np-2-9) (`NP.2/torsor-torsion`); [2.4](#np-2-4) (`NP.2/leray-obstruction`); [2.7](#np-2-7) (`NP.2/constant-num`); `mathlib:DistribMulAction`.

**Checks.**

- For X = P¹\_ℂ over ℝ no d ≥ 1 works (Num not constant), while d = 0 works trivially: this is why d ≥ 1 is required.
- For the pointless real conic, d = 2 works and d = 1 does not.

<a id="np-2-11"></a>

### 2.11 Doubling numerical classes through a 2-torsion kernel

`NP.2/double-lift` · construction

Let 0 → P → Q → N → 0 be an exact sequence of abelian fppf sheaves (in particular of abelian groups) with 2·P = 0. Multiplication by 2 on Q factors uniquely as d ∘ π for a homomorphism d : N → Q, and π ∘ d = [2]\_N. Applied to 0 → Pic^τ\_{Y/S} → Pic\_{Y/S} → Num\_{Y/S} → 0 for a family with 2·Pic^τ = 0 (Enriques families), every section of Num\_{Y/S} has a canonical doubled lift to Pic\_{Y/S}.

**Hypotheses.** 2·P = 0; exactness in the fppf topology (a sheaf quotient N = Q/P).

**Sources.**

- ATLAS-EXTRACTIONS, PAPER-SCHROER-23/183 (supplement to Proposition 5.5): For an exact sequence of fppf sheaves with 2-torsion kernel, doubling on the middle term descends to the quotient; applied to Pic^τ → Pic → Num of an Enriques family.

**Proof or construction.**

1. [2] : Q → Q kills P, so it factors uniquely through the sheaf quotient N = Q/P; π ∘ d ∘ π = π ∘ [2] = [2] ∘ π, and π is an epimorphism of sheaves.

**Uses.**

- EnriquesSurfacesAndIntegralNonexistence E3/local-projectivity: lifting a doubled ample numerical class over a Noetherian local base with a section
- Schröer 2023, Proposition 5.5 (repaired): local projectivity of Enriques families

**API.**

- `Picard.doubleLift` (data): d : N → Q with d ∘ π = [2]\_Q.
- `Picard.doubleLift_comp_proj` (relation): π ∘ d = [2]\_N.
- `Picard.doubleLift_unique` (universal-property): d is the unique homomorphism with d ∘ π = [2]\_Q.
- `Picard.doubleLift_natural` (functoriality): d commutes with maps of short exact sequences with 2-torsion kernels and with base change of sheaves.

**Direct prerequisites.** [2.6](#np-2-6) (`NP.2/num-local-system`).

**Checks.**

- `Picard.doubleLift_cyclic` (computation): For 0 → 2ℤ/4 → ℤ/4 → ℤ/2 → 0, d(1) = 2 ∈ ℤ/4.
- `Picard.doubleLift_split` (degenerate): For P = 0, d = [2]\_N.
- `Picard.doubleLift_needs_two_torsion` (non-example): For 0 → 2ℤ/8 → ℤ/8 → ℤ/2 → 0 the kernel 2ℤ/8 ≅ ℤ/4 is not killed by 2, and [2] does not factor through ℤ/2, since 2·2 = 4 ≠ 0 in ℤ/8.
- For Q = ℤ/4 ⊃ P = 2ℤ/4, N = ℤ/2 and d(1) = 2.

<a id="np-2-12"></a>

### 2.12 Finiteness of rational τ-classes over finite fields and torsion over locally finite fields

`NP.2/finite-field-finiteness` · theorem

(a) For X proper over a finite field F\_q, Pic^τ\_{X/F\_q}(F\_{q^r}) is finite for every r ≥ 1. (b) If k is an algebraic extension of a finite field and X is proper over k, every numerically trivial invertible sheaf on X has finite order in Pic(X).

**Hypotheses.** (a) X proper over F\_q; (b) k algebraic over a finite field.

**Sources.**

- [WIT22](https://arxiv.org/pdf/2002.11915v2), proof of Proposition 5.3, using Keel 1999 Lemma 2.16: A numerically trivial line bundle on a projective scheme over an algebraic extension of a finite field is torsion, by finite type of the numerically trivial Picard functor and finiteness of rational points over finite fields.
- ATLAS-EXTRACTIONS, PAPER-WITASZEK-22/picard-scheme-numerical: The finite-type assertion for numerically trivial line bundles, including the descent to a finite field, is supplied by the numerical Picard roadmap.

**Proof or construction.**

1. (a) Pic^τ is of finite type over F\_q (NP.2/tau-component), so it has finitely many points over each finite field.
2. (b) X and L are defined over a finite subfield F ⊂ k (spreading out, EGA IV 8.8.2); L₀ on X₀ is numerically trivial (NP.0/field-extension-invariance), so [L₀] ∈ Pic^τ\_{X₀/F}(F), a finite group by (a).
3. Pic(X₀) → Pic\_{X₀/F}(F) is injective (NP.2/leray-obstruction), so L₀ has finite order, hence so does L.

**Direct prerequisites.** [2.5](#np-2-5) (`NP.2/tau-component`); [2.4](#np-2-4) (`NP.2/leray-obstruction`); [0.3](#np-0-3) (`NP.0/field-extension-invariance`); `SchemeAndStackFoundations:SF.0`.

**Checks.**

- On an elliptic curve E over F̄\_p every degree-zero invertible sheaf is torsion, since E(F̄\_p) is torsion.
- Over ℚ̄ the analogue of (b) fails: E(ℚ̄) has points of infinite order.

<a id="layer-3"></a>

## Layer 3: Contractions, semiample sheaves and descent of contractions

**Targets.** Contractions (proper, O\_Y ≅ f\_*O\_X) with Zariski connectedness and Stein factorisation; the rigidity lemma; relatively semiample invertible sheaves and section rings; the dictionary between semiample sheaves and projective contractions, including numerical invariance; spreading out a geometric contraction to a finite extension (EGA IV 8.8.2); purely inseparable descent of contractions to arbitrary proper targets; Schröer's Theorem 1.3: with Num\_{X/k} constant, every geometric contraction with projective target descends; openness of ampleness for proper algebraic spaces with the scheme conclusion (Stacks 0D3A, 0D3D).

**Layer suppliers.** `AlgebraicModuliForArithmeticGeometryPartII:NP.1`; `AlgebraicModuliForArithmeticGeometryPartII:NP.2`; `SchemeAndStackFoundations:SF.0`; `SchemeAndStackFoundations:SF.1`; `SchemeAndStackFoundations:SF.2`; `SchemeAndStackFoundations:SF.4`; [StableReduction](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/StableReduction/README.md#layer-2-coherent-curve-theory-duality-and-positivity) (`layer-2-coherent-curve-theory-duality-and-positivity`); `AlgebraicModuliForArithmeticGeometry:R09.1`; `AlgebraicModuliForArithmeticGeometry:R09.3`; `SchemeAndStackFoundations:SF.3`.

**Closure work.**

- The descent proof and ampleness proof are repaired; closure still inherits NP.1/G1 and NP.2/G4 for the numerical Picard local system and Leray representability package.

<a id="np-3-1"></a>

### 3.1 Contractions

`NP.3/contraction` · definition · planet: Contraction

A contraction is a proper morphism f : X → Y of schemes for which O\_Y → f\_*O\_X is an isomorphism. In the setting of Schröer, X and Y are proper over a field k; over a Noetherian base S, X and Y are proper S-schemes and f is an S-morphism.

**Hypotheses.** f proper; O\_Y ≅ f\_*O\_X; Y locally Noetherian for the fibre statements.

**Sources.**

- [SCH23](https://arxiv.org/pdf/2004.07025v3), §1, p. 6: A contraction of X is a proper scheme Z with a morphism f : X → Z such that O\_Z = f\_*(O\_X).
- ATLAS-EXTRACTIONS, PAPER-SCHROER-23/223: Zariski connectedness: a proper morphism of locally Noetherian schemes with O\_Z = f\_*O\_X is surjective with geometrically connected fibres (EGA III 4.3.1, 4.3.4).

**Proof or construction.**

1. Surjectivity: if y ∉ f(X), then (f\_*O\_X)\_y = 0 ≠ O\_{Y,y}.
2. Geometric connectedness of the fibres is Zariski's connectedness theorem, SchemeAndStackFoundations §4.9 (stein\_factorization), for locally Noetherian Y.
3. Flat base change of f\_*O\_X (SchemeAndStackFoundations §2.6) shows that contractions are stable under flat base change, in particular under field extension.

**Uses.**

- Schröer 2023, Theorem 1.3, Theorem 2.1, §3: contractions of proper schemes and of smooth proper surfaces; connectedness of geometric fibres
- Witaszek 2022 and Bhatt et al. 2023 (semiample fibrations, EWM maps): the contraction associated with a semiample line bundle
- this roadmap NP.3/semiample-contraction, NP.4/surface-contraction-trichotomy: the objects that descend and that are classified

**API.**

- `Contraction.IsContraction` (data): IsContraction f :↔ f proper ∧ O\_Y → f\_*O\_X is an isomorphism.
- `Contraction.surjective` (other): A contraction is surjective.
- `Contraction.geometricallyConnected_fibres` (other): Every fibre of a contraction to a locally Noetherian Y is geometrically connected (SchemeAndStackFoundations §4.9).
- `Contraction.comp` (structure): Composites of contractions are contractions; isomorphisms are contractions.
- `Contraction.flatBaseChange` (functoriality): For a flat Y′ → Y, the base change of a contraction is a contraction; in particular contractions of proper k-schemes are stable under field extension.
- `Contraction.stein` (universal-property): Every proper f : X → Y with Y locally Noetherian factors uniquely as a contraction X → Spec\_Y f\_*O\_X followed by a finite morphism.
- `Contraction.structureMorphism_iff` (characterisation): For X proper over k, X → Spec k is a contraction iff H⁰(X, O\_X) = k.

**Direct prerequisites.** `mathlib:AlgebraicGeometry.IsProper`; `SchemeAndStackFoundations:SF.4`; `SchemeAndStackFoundations:SF.2`.

**Checks.**

- `Contraction.blowup` (computation): The blow-up Bl\_x S → S of a regular surface at a closed point is a contraction with fibre P¹\_{κ(x)} over x.
- `Contraction.projection` (computation): The projection P¹\_k × P¹\_k → P¹\_k is a contraction.
- `Contraction.identity` (degenerate): Every isomorphism is a contraction; Spec k → Spec k is the contraction of a point.
- `Contraction.cuspNormalization_not` (non-example): The normalization 𝔸¹ → Spec k[t², t³] is finite and birational but not a contraction: f\_*O is k[t] ≠ k[t², t³].
- `Contraction.realForm_not` (non-example): P¹\_ℂ → Spec ℝ is proper with connected fibre but not a contraction, since H⁰ = ℂ ≠ ℝ.
- The blow-up of a regular surface in a closed point is a contraction.
- The structure morphism of P¹\_ℂ regarded over ℝ is not a contraction to Spec ℝ.

<a id="np-3-2"></a>

### 3.2 Rigidity: maps contracting the curves of a contraction factor through it

`NP.3/rigidity` · theorem

Let S be a Noetherian scheme, f : X → Y a contraction of proper S-schemes and g : X → Z an S-morphism to a scheme Z proper over S. If g maps every integral curve contained in a fibre of f to a point, then there is a unique S-morphism h : Y → Z with g = h ∘ f.

**Hypotheses.** f a contraction; X, Y, Z proper over Noetherian S.

**Sources.**

- [SCH23](https://arxiv.org/pdf/2004.07025v3), proof of Theorem 1.3, pp. 6–7: Uses that the semiample sheaf defining a contraction is unique up to pullbacks of semiample sheaves from the target, and that numerically equivalent sheaves give the same contraction.

**Proof or construction.**

1. Each fibre F = f^{-1}(y) is connected (NP.3/contraction). If g(F) had positive dimension, some integral curve of F would map onto a curve (lift curves as in NP.0/surjective-pullback); so g(F) is finite and connected, a single point.
2. Let Γ ⊂ Y ×\_S Z be the scheme-theoretic image of (f, g). The projection π : Γ → Y is proper with finite fibres, hence finite, and O\_Y → π\_*O\_Γ → f\_*O\_X = O\_Y with the second map injective (Γ is a scheme-theoretic image) forces π\_*O\_Γ = O\_Y, so π is an isomorphism.
3. h is the second projection composed with π^{-1}; uniqueness holds because f is surjective and O\_Y = f\_*O\_X makes f an epimorphism of schemes.

**Direct prerequisites.** [3.1](#np-3-1) (`NP.3/contraction`); [0.6](#np-0-6) (`NP.0/surjective-pullback`); `SchemeAndStackFoundations:SF.4`.

**Checks.**

- Two contractions X → Y₁, X → Y₂ contracting exactly the same curves are isomorphic under X.
- The hypothesis cannot be weakened to a numerical one without the curves: a map contracting fewer curves need not factor.

<a id="np-3-3"></a>

### 3.3 Semiample invertible sheaves and the section ring

`NP.3/semiample` · definition · planet: Semiample invertible sheaf

Let f : X → S be proper with S Noetherian. An invertible sheaf L on X is f-semiample if some L^{⊗m}, m ≥ 1, is f-globally generated: f*f\_*L^{⊗m} → L^{⊗m} is surjective. Over S = Spec k this is semiampleness (some positive power globally generated). The section ring is R(X/S, L) := ⊕\_{t≥0} f\_*L^{⊗t}, a quasi-coherent graded O\_S-algebra; over a field R(X, L) = ⊕\_t H⁰(X, L^{⊗t}) and P(X, L) := Proj R(X, L).

**Hypotheses.** f proper, S Noetherian; m ≥ 1 is required (m = 0 would make every sheaf semiample).

**Sources.**

- [SCH23](https://arxiv.org/pdf/2004.07025v3), proof of Theorem 1.3, p. 6: The graded ring R(X, L) = ⊕\_t H⁰(X, L^{⊗t}) and P(X, L) = Proj R(X, L); for semiample L this is projective and gives a contraction.
- [WIT22](https://arxiv.org/pdf/2002.11915v2), §2, p. 7: L is relatively semiample over S if some positive tensor power is relatively base point free.

**Proof or construction.**

1. Over a field, global generation descends along every field extension by flat base change of H⁰ and faithful flatness of the evaluation map. Over a general base, fibrewise global generation alone does not imply surjectivity of f*f\_*L → L without the appropriate cohomology/base-change hypotheses; no such equivalence is claimed.
2. A globally generated invertible sheaf has nonnegative degree on every curve (restrict a nonvanishing section at a point of the curve), so semiample sheaves are nef.

**Uses.**

- Schröer 2023, Theorem 1.3: every contraction with projective target comes from a semiample sheaf; descent of the sheaf descends the contraction
- Witaszek 2022, Bhatt et al. 2023, §§2.7–2.8 and 9: semiample fibrations in base point free theorems
- this roadmap NP.5/semiample-trivial-descent: descent of relatively semiample, relatively numerically trivial line bundles
- AbundanceStatement Layer 5: absolute semiampleness in characteristic zero, which this specialises to

**API.**

- `Contraction.IsSemiample` (data): f-semiampleness: ∃ m ≥ 1 with f*f\_*L^{⊗m} → L^{⊗m} surjective.
- `Contraction.sectionRing` (data): R(X/S, L) := ⊕\_{t≥0} f\_*L^{⊗t}, a graded quasi-coherent O\_S-algebra; over a field, R(X, L) and P(X, L) = Proj R(X, L).
- `Contraction.IsSemiample.pow` (relation): L is semiample iff L^{⊗n} is semiample for some (every) n ≥ 1.
- `Contraction.IsSemiample.nef` (relation): Semiample implies nef (NP.1/relative-nef).
- `Contraction.IsSemiample.pullback` (functoriality): Pullbacks of semiample sheaves along S-morphisms of proper S-schemes are semiample.
- `Contraction.IsSemiample.fieldExtension` (compatibility): Over a field, L is semiample iff L\_K is semiample for some (every) extension K/k.
- `Contraction.IsSemiample.of_pullback_base` (other): If L^{⊗m} ≅ f*M for some m ≥ 1 and M invertible on S, then L is f-semiample.

**Direct prerequisites.** [1.5](#np-1-5) (`NP.1/relative-nef`); [JacobianChallenge](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/JacobianChallenge/README.md#layer-c-relative-coherent-cohomology-and-base-change) (`layer-c-relative-coherent-cohomology-and-base-change`); [StableReduction](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/StableReduction/README.md#layer-2-coherent-curve-theory-duality-and-positivity) (`layer-2-coherent-curve-theory-duality-and-positivity`).

**Checks.**

- `Contraction.IsSemiample_projectiveSpace` (computation): O(1) on P^n\_k is semiample, with R(P^n, O(1)) = k[x₀, …, x\_n] and P = P^n.
- `Contraction.IsSemiample_torsion` (degenerate): Every torsion invertible sheaf (in particular O\_X) is semiample, with P(X, L) = X^aff.
- `Contraction.IsSemiample_nontorsion_degreeZero` (non-example): On an elliptic curve over ℂ, O(p − q) of infinite order is nef but not semiample: no positive power has a nonzero section.
- `Contraction.IsSemiample_exceptional` (non-example): On Bl\_p P², O(E) is effective but not semiample (it is not nef).
- O(1) on P^n is semiample; a torsion invertible sheaf is semiample.

<a id="np-3-4"></a>

### 3.4 Semiample sheaves and projective contractions

`NP.3/semiample-contraction` · theorem · planet: Semiample contraction

Let X be proper over a field k and L a semiample invertible sheaf. (i) R(X, L) is a finitely generated k-algebra, P(X, L) is projective over k and the canonical morphism φ\_L : X → P(X, L) is a contraction; an integral curve C ⊂ X is contracted by φ\_L iff (L·C) = 0. (ii) Every contraction f : X → Z with Z projective over k is isomorphic under X to φ\_L for L = f*O\_Z(1). (iii) R(X, L) and P(X, L) commute with field extension. (iv) If L, L′ are semiample and numerically equivalent, φ\_L and φ\_{L′} are isomorphic under X.

**Hypotheses.** X proper over a field; L semiample.

**Sources.**

- [SCH23](https://arxiv.org/pdf/2004.07025v3), proof of Theorem 1.3, pp. 6–7: For semiample L, P(X, L) is projective and gives a contraction, each contraction with projective target is of this form, and the sheaf is unique up to pullbacks of semiample sheaves on the target.
- ATLAS-EXTRACTIONS, PAPER-SCHROER-23/216: The dictionary between semiample sheaves and projective contractions, including compatibility with field extension and the numerical invariance used for the Galois norm.

**Proof or construction.**

1. (i) Choose m with L^{⊗m} globally generated, giving ψ : X → P^N; its Stein factorisation X → Y := Spec\_{P^N}(ψ\_*O\_X) → P^N is a contraction onto a projective Y carrying an ample sheaf whose pullback is L^{⊗m}; the Veronese subring R(X, L^{⊗m}) is the section ring of that ample sheaf, hence finitely generated with Proj equal to Y, and R(X, L) is finite over it, so P(X, L) = Y. Curves with (L·C) = 0 are exactly those mapping to points.
2. (ii) H⁰(X, f*O\_Z(t)) = H⁰(Z, O\_Z(t)) by the projection formula and O\_Z = f\_*O\_X, so R(X, f*O(1)) is the section ring of an ample sheaf on Z and Proj of it is Z.
3. (iii) Flat base change of H⁰ and of Proj.
4. (iv) φ\_L and φ\_{L′} contract exactly the curves of degree zero, which are the same curves; by NP.3/rigidity each factors through the other.

**Direct prerequisites.** [3.3](#np-3-3) (`NP.3/semiample`); [3.1](#np-3-1) (`NP.3/contraction`); [3.2](#np-3-2) (`NP.3/rigidity`); `AlgebraicModuliForArithmeticGeometry:R09.1`; [StableReduction](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/StableReduction/README.md#layer-2-coherent-curve-theory-duality-and-positivity) (`layer-2-coherent-curve-theory-duality-and-positivity`).

**Checks.**

- For L = O\_{P¹×P¹}(1, 0), φ\_L is the first projection.
- For L = O\_X, φ\_L is X → X^aff.

<a id="np-3-5"></a>

### 3.5 Spreading out a geometric contraction to a finite extension

`NP.3/spreading-out` · theorem

Let X be proper over k and f̄ : X\_{k̄} → Ȳ a contraction with Ȳ projective over k̄. There are a finite subextension k ⊂ k′ ⊂ k̄ and a contraction f′ : X\_{k′} → Y′ with Y′ projective over k′, whose base change to k̄ is isomorphic under X\_{k̄} to f̄.

**Hypotheses.** X proper over k; Ȳ projective over k̄.

**Sources.**

- [EGA-IV3](https://www.numdam.org/item/PMIHES_1966__28__5_0/), Théorème (8.8.2), Numdam PDF p. 27, and (8.10.5): Schemes, morphisms and properties of finite presentation over a filtered limit of rings descend to a finite stage; properness and projectivity descend as well.
- [SCH23](https://arxiv.org/pdf/2004.07025v3), proof of Theorem 1.3, p. 7: By EGA IV 8.8.2 the given contraction over k^alg is the base change of a contraction with projective target over a finite extension k′.

**Proof or construction.**

1. k̄ is the filtered union of its finite subextensions; Ȳ, the morphism f̄ and a projective embedding descend to some k′ by EGA IV 8.8.2 (finite presentation) and 8.10.5 (properness, projectivity).
2. O\_{Y′} → f′\_*O\_{X\_{k′}} becomes an isomorphism after the faithfully flat base change to k̄ (flat base change of direct images), hence is one.

**Direct prerequisites.** [3.1](#np-3-1) (`NP.3/contraction`); `SchemeAndStackFoundations:SF.0`; `SchemeAndStackFoundations:SF.2`.

**Checks.**

- If f̄ is already defined over k, k′ = k works.

<a id="np-3-6"></a>

### 3.6 Contractions descend along purely inseparable extensions

`NP.3/inseparable-descent` · theorem

Let k ⊂ k′ be a purely inseparable field extension (possibly infinite), X proper over k and f′ : X\_{k′} → Y′ a contraction with Y′ proper over k′ (no projectivity, no condition on Num). There is a contraction f : X → Y over k, with Y proper over k, such that f′ ≅ f\_{k′} under X\_{k′}.

**Hypotheses.** k′/k purely inseparable; Y′ only proper.

**Sources.**

- [SCH23](https://arxiv.org/pdf/2004.07025v3), proof of Theorem 1.3 and the remark after it, p. 7: For a purely inseparable extension any contraction of X ⊗ k′ to a proper scheme descends, with no assumption on Num: the topological space is forced, the structure sheaf is f\_*O\_X, and properness descends.
- ATLAS-EXTRACTIONS, PAPER-SCHROER-23/E2 and /E21: In the printed proof the preimage U′ = f′^{-1}(V) should read f′^{-1}(V′), and the continuous map |X′| → |Y′| is f′, not f.

**Proof or construction.**

1. pr : X\_{k′} → X is a universal homeomorphism (SchemeAndStackFoundations §0.23); put |Y| := |Y′|, f := f′ on spaces and O\_Y := f\_*O\_X, giving a ringed space Y with a morphism X → Y.
2. Locally: for an affine open V′ ⊂ Y′ with preimage U′ = f′^{-1}(V′) and corresponding U ⊂ X, f′\_*O = O makes U′ → V′ = Spec Γ(U′, O) the affine hull; Γ(U′, O) = Γ(U, O) ⊗\_k k′ shows U′ → V′ is the base change of U → V = Spec Γ(U, O), and V′ → V is a homeomorphism, so (|V|, O\_Y|\_{|V|}) ≅ V.
3. Hence Y is a scheme, Y′ = Y\_{k′}, f′ = f\_{k′}; Y is proper by fpqc descent of properness along Spec k′ → Spec k (EGA IV 2.7.1).

**Direct prerequisites.** [3.1](#np-3-1) (`NP.3/contraction`); `SchemeAndStackFoundations:SF.0`.

**Checks.**

- For k′ = k this returns f′.
- The statement fails for separable extensions without further hypotheses: contracting one of the two components of (P¹\_ℂ)\_ℂ = P¹\_ℂ ⊔ P¹\_ℂ does not descend to ℝ.

<a id="np-3-7"></a>

### 3.7 Descent of geometric contractions under constant Num (Schröer, Theorem 1.3)

`NP.3/contraction-descent` · theorem · planet: Descent of geometric contractions

Let X be proper over a field k with Num\_{X/k} constant. Every contraction f̄ : X\_{k̄} → Ȳ with Ȳ projective over k̄ is isomorphic under X\_{k̄} to the base change of a contraction f : X → Y over k; Y is then projective over k.

**Hypotheses.** X proper over k; IsConstantNum X; Ȳ projective (the inseparable step alone needs only properness).

**Sources.**

- [SCH23](https://arxiv.org/pdf/2004.07025v3), Theorem 1.3 and proof, pp. 6–7: With constant Num every contraction of X ⊗ k^alg to a projective scheme is the base change of a contraction of X: spread out to a splitting field, average the semiample sheaf over the Galois group, lift a multiple to X, and treat the purely inseparable part separately.
- [STACKS](https://stacks.math.columbia.edu), Lemma 33.15.5 (tag 0BDG): A scheme whose base change along a field extension is projective is itself projective; the proof descends an ample line bundle after reduction to finite extensions.

**Proof or construction.**

1. Spread the contraction and a projective embedding to a finite normal extension k′/k. Let k₁ be the separable closure of k in k′. Then k₁/k is finite Galois and k′/k₁ is purely inseparable; normality is essential for the cited pinned isGalois instance.
2. First apply NP.3/inseparable-descent to f′ : X\_{k′} → Y′, obtaining f₁ : X\_{k₁} → Y₁. The target Y₁ is projective because projectivity descends under a field extension (Stacks Lemma 33.15.5, tag 0BDG). Choose a semiample L₁ defining f₁.
3. Now take the Galois step over k₁/k: M = ⊗\_{σ∈Gal(k₁/k)} σ*L₁ is semiample and numerically equivalent to L₁^{⊗[k₁:k]}; it defines the same contraction by NP.3/semiample-contraction and constancy of Num. Its Picard class is invariant, so is a k-point by Galois descent of the Picard sheaf.
4. The Leray obstruction is torsion, hence a positive power of this class is represented by an invertible sheaf L on X. Injectivity Pic(X\_{k₁}) → Pic\_{X/k}(k₁) identifies its pullback with a power of M. Field-extension descent of global generation makes L semiample.
5. The contraction φ\_L has projective target and its base change to k₁, then k′ and k̄, is the prescribed contraction. Averaging a sheaf over k′ before descending the purely inseparable step would not have produced a k₁-point and is not used.

**Direct prerequisites.** [3.5](#np-3-5) (`NP.3/spreading-out`); [3.4](#np-3-4) (`NP.3/semiample-contraction`); [3.6](#np-3-6) (`NP.3/inseparable-descent`); [2.7](#np-2-7) (`NP.2/constant-num`); [2.4](#np-2-4) (`NP.2/leray-obstruction`); `mathlib:separableClosure.isGalois`; `mathlib:separableClosure.isPurelyInseparable`; `SchemeAndStackFoundations:SF.3`.

**Checks.**

- For X = P¹\_ℂ viewed over ℝ, Num\_{X/ℝ} is not constant and the contraction of X\_ℂ = P¹\_ℂ ⊔ P¹\_ℂ collapsing only the first component does not descend.
- For X geometrically integral over a finite field with Num constant, every geometric fibration onto a projective curve descends (the Enriques application, EnriquesSurfacesAndIntegralNonexistence Layer 2).

<a id="np-3-8"></a>

### 3.8 Openness of ampleness for proper algebraic spaces

`NP.3/ampleness-openness` · theorem

Let Y be a Noetherian scheme, f : X → Y a proper morphism from an algebraic space and L an invertible O\_X-module. (i) If y ∈ Y is such that the fibre X\_y is a scheme and L\_y is ample on X\_y, there is an open neighbourhood V ∋ y such that L|\_{f^{-1}V} is ample on f^{-1}(V)/V; in particular f^{-1}(V) is a scheme, projective over V. (ii) For an arbitrary proper morphism of algebraic spaces f : X → Y there is an open V ⊂ Y such that a morphism Y′ → Y factors through V iff the pullback of L to X ×\_Y Y′ is ample over Y′.

**Hypotheses.** (i) Y Noetherian scheme, f proper, X\_y a scheme; (ii) f proper morphism of algebraic spaces.

**Sources.**

- [STACKS](https://stacks.math.columbia.edu), Lemma 71.15.3 (tag 0D3A): For a proper algebraic space over a Noetherian scheme, if the fibre over y is a scheme on which L is ample, then L is ample over a neighbourhood of y.
- [STACKS](https://stacks.math.columbia.edu), Lemma 74.13.2 (tag 0D3D): For a proper morphism of algebraic spaces there is an open subspace of the target through which a base change factors exactly when the pullback of L is ample.
- ATLAS-EXTRACTIONS, PAPER-SCHROER-23/186: This openness, with the representability conclusion, is the input of the local projectivity repair of Proposition 5.5; neither R09.1 nor R09.3 names it.

**Proof or construction.**

1. (i) Over a Noetherian complete local base the fibrewise very ample powers lift (formal functions, Grothendieck existence), giving a finite morphism to P^r over a neighbourhood after shrinking; a finite morphism to a projective scheme makes X a scheme and L ample. The scheme case of the openness is StableReduction Layer 2's 'fibrewise ample is open'.
2. (ii) Descent of the ample locus along an étale cover of Y by schemes and the fpqc-local nature of relative ampleness (Stacks 0D2P).

**Direct prerequisites.** [StableReduction](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/StableReduction/README.md#layer-2-coherent-curve-theory-duality-and-positivity) (`layer-2-coherent-curve-theory-duality-and-positivity`); `AlgebraicModuliForArithmeticGeometry:R09.3`; `SchemeAndStackFoundations:SF.1`.

**Checks.**

- For a family of smooth projective curves every fibrewise ample L is relatively ample over the whole base.
- Ampleness on one fibre is essential: for the trivial sheaf on X = P¹ × Y, no neighbourhood works.

<a id="layer-4"></a>

## Layer 4: Component graphs and contractions of smooth surfaces

**Targets.** The component dual graph of a Noetherian scheme and the induced maps (edges go to edges or vertices); the curve criterion (Schröer Proposition 1.2, for schemes with all components one-dimensional); intersection matrices and intersection-labelled graphs of curves on a smooth proper surface; the trichotomy for contractions of smooth proper surfaces (point, birational, fibre type); negative definiteness of exceptional curves (Du Val, Mumford, Lipman Lemma 14.1); Zariski's lemma for fibres; Schröer's Theorem 2.1: graph descent, purely inseparable residue fields of reducible geometric fibres, and descent of edge labels (with κ(a) = k). Add negative-curve descent via the proper Hilbert space and its tangent formula (G5). This independent repair proves κ(a)=k for reducible geometric fibres and yields label preservation by full Cartier-divisor base change.

**Layer suppliers.** `AlgebraicModuliForArithmeticGeometryPartII:NP.2`; `AlgebraicModuliForArithmeticGeometryPartII:NP.3`; `SchemeAndStackFoundations:SF.0`; `SchemeAndStackFoundations:SF.4`; `SchemeAndStackFoundations:SF.5`; [StableReduction](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/StableReduction/README.md#layer-1-nodes-normalization-and-dual-graphs) (`layer-1-nodes-normalization-and-dual-graphs`); [StableReduction](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/StableReduction/README.md#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces) (`layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`); `AlgebraicModuliForArithmeticGeometry:R09.2`.

**Closure work.**

- G5: extend R09.2 to the proper Hilbert algebraic space and tangent formula used by the new negative-curve descent proof.
- General numerical-lattice prerequisites inherit NP.1/NP.2 gaps.

<a id="np-4-1"></a>

### 4.1 The component dual graph of a Noetherian scheme

`NP.4/component-dual-graph` · definition · planet: Component dual graph

For a Noetherian scheme Z, Γ(Z) is the finite simple graph on its irreducible components; distinct components are adjacent when their intersection is nonempty. A morphism inducing a vertex map must send the closure of the image of each source component onto a target component (or be supplied with such component-dominance data). It sends an edge to an edge or a vertex. Injectivity on vertices gives edge preservation, but even vertex bijectivity does not imply reflection of adjacency for arbitrary morphisms. For field base change, a bijection on vertices does reflect adjacency and gives a graph isomorphism.

**Hypotheses.** Z Noetherian (finitely many components).

**Sources.**

- [SCH23](https://arxiv.org/pdf/2004.07025v3), §1, p. 6: The dual graph of a Noetherian scheme has the irreducible components as vertices, joined when they meet; maps sending components to components induce graph morphisms.
- ATLAS-EXTRACTIONS, PAPER-SCHROER-23/E28: The printed claim that such maps send edges to edges fails when two components with the same image meet (x² + y² = 0 over ℝ); edges go to edges or to a vertex, and to edges when the vertex map is bijective.

**Proof or construction.**

1. Adjacency is symmetric and irreflexive; finiteness of the vertex set is Noetherianity.
2. If Z′\_i ∩ Z′\_j ≠ ∅ then their images meet, so adjacent vertices go to adjacent or equal vertices; when the vertex map is injective, equal images cannot occur.
3. For a field extension K/k, every geometric component dominates a component of Z. If the vertex map is bijective, the support of the pullback of each target component is its unique source component. Faithful flatness preserves nonempty intersections, giving reflection of adjacency.

**Uses.**

- Schröer 2023, Proposition 1.2 and Theorem 2.1: constancy of Num is equivalent to, or implies, Γ(X\_{k̄}) → Γ(X) being an isomorphism
- EnriquesSurfacesAndIntegralNonexistence 2.19: descent of the dual graphs of fibres of genus-one fibrations over finite fields
- StableReduction Layer 1: the dual graph of a nodal curve, a refinement with edges for nodes, which this coarser graph forgets

**API.**

- `DualGraph.componentGraph` (data): Γ(Z) as a SimpleGraph on irreducibleComponents Z, adjacency Z\_i ≠ Z\_j ∧ (Z\_i ∩ Z\_j).Nonempty.
- `DualGraph.componentGraph_adj_iff` (simp): Adjacency unfolds to distinctness and nonempty intersection.
- `DualGraph.vertexMap` (functoriality): A morphism with closure-of-image equal to a target component for every source component induces the canonical vertex map; identities and composites are respected.
- `DualGraph.vertexMap_adj` (relation): Adjacent vertices map to adjacent or equal vertices.
- `DualGraph.IsGraphIso` (data): A bijection of vertices preserving and reflecting adjacency, equivalently a SimpleGraph isomorphism. Edge preservation alone is insufficient.
- `DualGraph.baseChange` (functoriality): For a field extension K/κ and Z of finite type over κ, the projection Z\_K → Z induces Γ(Z\_K) → Γ(Z).
- `DualGraph.baseChange_iso_of_vertex_bijective` (characterisation): For a field extension K/k, bijectivity of Γ(Z\_K) → Γ(Z) on vertices implies a graph isomorphism, by faithful flatness of intersections.

**Direct prerequisites.** `mathlib:irreducibleComponents`; `mathlib:SimpleGraph`; [StableReduction](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/StableReduction/README.md#layer-1-nodes-normalization-and-dual-graphs) (`layer-1-nodes-normalization-and-dual-graphs`).

**Checks.**

- `DualGraph.componentGraph_disjointLines` (computation): Γ(P¹ ⊔ P¹) has two vertices and no edge.
- `DualGraph.componentGraph_irreducible` (degenerate): An irreducible Z has one vertex and no edges; Γ(∅) is empty.
- `DualGraph.componentGraph_axes` (computation): For Z = V(xy) ⊂ 𝔸², Γ(Z) is a single edge.
- `DualGraph.vertexMap_contracts_edge` (non-example): For Z = V(x² + y²) ⊂ 𝔸²\_ℝ, Γ(Z\_ℂ) is an edge and Γ(Z) a single vertex: the induced map sends the edge to a vertex, not to an edge.
- `DualGraph.vertexBijection_not_iso` (non-example): The normalization P¹ ⊔ P¹ → V(xy) ⊂ P² (a pair of meeting lines) is bijective on components and sends each component onto a component, but the source graph has no edge and the target has one.
- Γ(P¹ ⊔ P¹) has two vertices and no edge; Γ of a nodal cubic is one vertex.

<a id="np-4-2"></a>

### 4.2 Constancy of Num for curves is graph descent

`NP.4/curve-criterion` · theorem

Let X be a proper scheme over k all of whose irreducible components are one-dimensional. Then Num\_{X/k} is constant iff Γ(X\_{k̄}) → Γ(X) is a graph isomorphism.

**Hypotheses.** X proper over k; every irreducible component of dimension one (zero-dimensional components excluded).

**Sources.**

- [SCH23](https://arxiv.org/pdf/2004.07025v3), Proposition 1.2 and proof, p. 6: For one-dimensional X, Num\_{X/k} is constant iff Γ(X̄) → Γ(X) is a graph isomorphism, proved with effective Cartier divisors at chosen closed points and Lemma 1.1.
- ATLAS-EXTRACTIONS, PAPER-SCHROER-23/E18 and /E19: The proposition needs every irreducible component to be one-dimensional (counterexample P¹\_ℝ ⊔ Spec ℂ); in the proof the effective Cartier divisor lives on X̄, not X.

**Proof or construction.**

1. An invertible sheaf is numerically trivial iff its degrees on the reduced components C\_1, …, C\_r vanish, so Num(X\_{k̄}) ⊗ ℚ has the components of X\_{k̄} as a dual basis.
2. (⇐) If the vertex map is bijective, choose closed points a\_i in C\_i outside the other components and outside the embedded points, and effective Cartier divisors D\_i supported at a\_i; the classes of O(D\_i) span a finite-index subgroup of Num\_{X/k}(k̄) defined over k, so Galois acts trivially (NP.2/positive-power-criterion).
3. (⇒) For a component E of X\_{k̄}, take an effective Cartier divisor on X\_{k̄} supported on E away from the others; NP.2/positive-power-criterion gives L on X with (L\_{k̄}·E′) ≥ 0, positive exactly for E′ = E, so exactly one component of X lies under E: the vertex map is bijective.

**Direct prerequisites.** [4.1](#np-4-1) (`NP.4/component-dual-graph`); [2.10](#np-2-10) (`NP.2/positive-power-criterion`); [0.4](#np-0-4) (`NP.0/numerically-trivial`).

**Checks.**

- For X = P¹\_ℂ viewed over ℝ, Γ(X\_ℂ) has two vertices over one: Num is not constant.
- For X = P¹\_ℝ ⊔ Spec ℂ the statement is outside the hypothesis: Num\_{X/ℝ} = ℤ is constant but Γ(X\_ℂ) has three vertices over two.

<a id="np-4-3"></a>

### 4.3 Intersection matrices and intersection-labelled graphs of curves on a surface

`NP.4/labelled-graph` · definition

Let S be a smooth proper surface over k with H⁰(S, O\_S) = k and C ⊂ S a curve with irreducible components C\_1, …, C\_r and multiplicities m\_i ≥ 1. Its intersection matrix is N(C) := ((C\_i·C\_j))\_{i,j} ∈ Mat\_r(ℤ), intersection numbers on S over k (SchemeAndStackFoundations §5.9). C is negative definite (resp. negative semidefinite) if N(C) is. The labelled graph of C is Γ(C) with each edge {C\_i, C\_j}, i ≠ j, labelled by (C\_i·C\_j) > 0.

**Hypotheses.** S smooth proper over k with H⁰(S, O\_S) = k; intersection numbers over k.

**Sources.**

- [SCH23](https://arxiv.org/pdf/2004.07025v3), §2, p. 8: For a curve C = Σ m\_iC\_i on a smooth proper surface with h⁰(O\_S) = 1, the intersection matrix N(C) = (C\_i·C\_j), negative (semi)definiteness, and the edge labels (C\_i·C\_j) > 0.
- ATLAS-EXTRACTIONS, PAPER-SCHROER-23/E3: In §2 the surface is S throughout; the printed X belongs to §1.

**Proof or construction.**

1. Distinct components meet iff (C\_i·C\_j) > 0 (local intersection multiplicities are positive at common points), so labels are positive exactly on edges.
2. N(C) is symmetric by symmetry of the intersection pairing.

**Uses.**

- Schröer 2023, Theorem 2.1(ii): edge labels are compared between geometric and schematic fibres
- EnriquesSurfacesAndIntegralNonexistence 2.19: intersection-labelled fibre graphs over finite fields
- this roadmap NP.4/exceptional-negativity and NP.4/zariski-lemma: definiteness of N(C) for fibres of contractions

**API.**

- `DualGraph.intersectionMatrix` (data): N(C) ∈ Mat\_r(ℤ), symmetric.
- `DualGraph.IsNegDef` (data): C is negative definite iff −N(C) is positive definite; IsNegSemidef likewise.
- `DualGraph.labelledGraph` (data): Γ(C) with edge labels (C\_i·C\_j) > 0.
- `DualGraph.label_pos_iff_adj` (characterisation): For i ≠ j, (C\_i·C\_j) > 0 iff C\_i and C\_j are adjacent in Γ(C).
- `DualGraph.labelledGraph_baseChange` (compatibility): For an extension K/k, intersection numbers of Cartier divisors on proper S are unchanged after pulling back the entire divisors to S\_K, with all multiplicities retained. Separately, for a proper surface S₀ over a finite extension κ/k viewed by restriction of scalars, its divisor intersections over k equal [κ:k] times those over κ. A fibre over a κ-point inside a k-surface is not an instance of this second statement.

**Direct prerequisites.** [4.1](#np-4-1) (`NP.4/component-dual-graph`); `SchemeAndStackFoundations:SF.5`.

**Checks.**

- `DualGraph.intersectionMatrix_twoLines` (computation): Two lines L, L′ in P²\_k: N = [[1,1],[1,1]], one edge labelled 1; positive semidefinite, not negative.
- `DualGraph.intersectionMatrix_exceptional` (computation): The exceptional curve E of a blow-up at a k-point: N = [−1], negative definite.
- `DualGraph.intersectionMatrix_single` (degenerate): A single smooth fibre F of a fibration S → P¹: N = [0], negative semidefinite and not definite.
- `DualGraph.labelledGraph_residueScaling` (non-example): For S₀ = P²\_κ viewed as a k-scheme, κ/k finite of degree 2, two κ-lines meet with k-intersection 2 and κ-intersection 1. This is a change of the ground field of the whole surface, not a rule for reduced fibre components in a k-surface.
- `DualGraph.inseparableAmbientMultiplicity` (non-example): Let k have characteristic p and a∉k^p. On the affine chart A²\_k of P²\_k take D₁ = V(x^p−a) and D₂ = V(y^p−a). Their local k-intersection is p², whereas their reduced geometric supports meet with multiplicity 1; after field extension the Cartier divisors are pC₁ and pC₂. Replacing pullbacks by reduced supports loses both factors.
- For two lines in P²\_k, N = [[1,1],[1,1]].

<a id="np-4-4"></a>

### 4.4 Contractions of smooth proper surfaces

`NP.4/surface-contraction-trichotomy` · theorem · planet: Contractions of smooth surfaces

Let S be a smooth proper surface over k with H⁰(S, O\_S) = k and f : S → Z a contraction. Exactly one of the following holds: (a) Z = Spec k and f is the structure morphism; (b) Z is a geometrically normal proper surface and f is birational; (c) Z is a smooth proper geometrically connected curve over k, and f is flat with geometrically connected fibres (f is of fibre type).

**Hypotheses.** S smooth proper surface, H⁰(S, O\_S) = k; f a contraction.

**Sources.**

- [SCH23](https://arxiv.org/pdf/2004.07025v3), §2, p. 8: A contraction of a smooth proper surface with h⁰(O\_S) = 1 is either birational onto a geometrically normal surface or of fibre type onto a smooth curve.
- ATLAS-EXTRACTIONS, PAPER-SCHROER-23/E23: The printed dichotomy omits the contraction to Spec k; Theorem 2.1 excludes it by assuming one-dimensional geometric fibres.

**Proof or construction.**

1. Z is normal and, after the flat base change to k̄, geometrically normal: O\_Z = f\_*O\_S with S normal, and contractions commute with field extension (NP.3/contraction).
2. dim Z = 0: Z = Spec H⁰(Z, O\_Z) = Spec H⁰(S, O\_S) = Spec k.
3. dim Z = 2: f is generically finite, and O\_Z = f\_*O\_S forces the generic fibre to have degree one, so f is birational.
4. dim Z = 1: a geometrically normal curve is smooth; S is integral and dominates the Dedekind scheme Z, so f is flat; H⁰(Z, O\_Z) = k with Z geometrically reduced gives geometric connectedness; fibres are geometrically connected by Zariski connectedness.

**Direct prerequisites.** [3.1](#np-3-1) (`NP.3/contraction`); `SchemeAndStackFoundations:SF.0`; `SchemeAndStackFoundations:SF.4`.

**Checks.**

- The blow-up of P²\_k at a k-point is of type (b); P¹×P¹ → P¹ is of type (c); S → Spec k is of type (a).

<a id="np-4-5"></a>

### 4.5 Negative definiteness of exceptional curves (Du Val, Mumford, Grauert)

`NP.4/exceptional-negativity` · theorem · planet: Negativity of exceptional curves

Let S be a regular two-dimensional scheme, proper over a field k, f : S → Z a proper birational morphism onto a normal surface and z ∈ Z a closed point with dim f^{-1}(z) = 1. The irreducible components E\_1, …, E\_r of f^{-1}(z) have negative definite intersection matrix ((E\_i·E\_j)). For the base-change application assume additionally that S is smooth over k and Z is geometrically normal; then after any algebraically closed extension Ω/k the theorem applies to the closed fibre points of f\_Ω. Regularity alone need not survive a field extension.

**Hypotheses.** S regular, f proper birational onto a normal surface; intersection numbers over k (any positive rescaling preserves definiteness).

**Sources.**

- [LIP69](https://www.numdam.org/item/PMIHES_1969__36__195_0.pdf), §13, p. 223, and Lemma (14.1), p. 224: For a desingularisation of a two-dimensional normal local ring, the intersection matrix of the components of the closed fibre is negative definite (a lemma of Du Val).
- [AHK07](https://arxiv.org/pdf/math/0605137v2), proof of Lemma 1.6, p. 4: Cites Mumford 1961 for negative definiteness of the intersection form on exceptional curves of a birational morphism of surfaces.
- ATLAS-EXTRACTIONS, PAPER-SCHROER-23/221: Negativity of exceptional curves is the birational case of Theorem 2.1, applied after base change to Ω.

**Proof or construction.**

1. Localise at z: X = S ×\_Z Spec O\_{Z,z} → Spec O\_{Z,z} is a desingularisation of a two-dimensional normal local ring.
2. Choose a nonunit r ∈ O\_{Z,z}; its pullback divisor C = Σ c\_iE\_i + (strict part) satisfies (C·E\_i) = 0 for all i, with c\_i > 0 by connectedness of the fibre (Zariski) and the strict part meeting some E\_i; the standard criterion then gives definiteness.
3. For the geometric application use smoothness of S and geometric normality of Z, so S\_Ω is regular and Z\_Ω is normal. Flat base change preserves the contraction, and birationality persists for these geometrically integral surfaces. Do not base change a merely regular surface without this additional hypothesis.

**Direct prerequisites.** [4.3](#np-4-3) (`NP.4/labelled-graph`); [4.4](#np-4-4) (`NP.4/surface-contraction-trichotomy`); [StableReduction](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/StableReduction/README.md#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces) (`layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`); `SchemeAndStackFoundations:SF.5`.

**Checks.**

- For the blow-up of a point, ((E·E)) = (−1).
- For the minimal resolution of an A\_n singularity, the matrix is the negative of the A\_n Cartan matrix.

<a id="np-4-6"></a>

### 4.6 Zariski's lemma for fibres of fibrations of regular surfaces

`NP.4/zariski-lemma` · theorem · planet: Zariski's lemma

Let S be a regular two-dimensional scheme, f : S → Z a proper flat morphism onto a regular one-dimensional scheme with O\_Z = f\_*O\_S, z ∈ Z a closed point and f^*(z) = Σ\_{i=1}^r m\_iC\_i its fibre. Then (C\_i·C\_j) ≥ 0 for i ≠ j, with equality iff C\_i ∩ C\_j = ∅; (f^*(z)·C\_j) = 0 for all j; the intersection form on ⊕ℚC\_i is negative semidefinite with radical ℚ·Σm\_iC\_i; every proper subset of {C\_1, …, C\_r} spans a negative definite sublattice; in particular C\_i² < 0 for every i when r ≥ 2.

**Hypotheses.** S regular of dimension two; f proper flat with connected fibres onto a regular curve; no smoothness of the generic fibre is needed.

**Ownership.** Current Tau Ceti main already proves the matrix theorem and the numerical-type consequences; this node plans their geometric input and application only. The suggested file does not restate the existing matrix theorems as new targets.

**Sources.**

- [STACKS](https://stacks.math.columbia.edu), Lemma 55.9.7 (tag 0C66), in Situation 55.9.3: For a regular proper model over a DVR, off-diagonal intersections are nonnegative, vanishing exactly for disjoint components, the fibre is orthogonal to every component, connectedness holds, and the form is negative semidefinite with radical spanned by the multiplicities.
- ATLAS-EXTRACTIONS, PAPER-SCHROER-23/222: Zariski's lemma for curves of fibre type, with every proper subset of components negative definite and C\_i² < 0 once the fibre has at least two components.

**Proof or construction.**

1. Localise at z to get a regular proper flat model over the discrete valuation ring O\_{Z,z}; the special fibre is connected because O\_Z = f\_*O\_S.
2. (C\_i·C\_j) ≥ 0 for i ≠ j from local intersection multiplicities; (f^*(z)·C\_j) = 0 because f^*(z) is the divisor of a uniformiser; no proper nonempty subset is orthogonal to its complement, by connectedness.
3. The matrix conclusion is already proved in current Tau Ceti, Matrix.dotProduct\_mulVec\_nonpos\_of\_mulVec\_eq\_zero and Matrix.dotProduct\_mulVec\_eq\_zero\_iff\_of\_mulVec\_eq\_zero (LinearAlgebra/Matrix/NegSemidef.lean), with the proper-principal-submatrix form TauCeti.NumericalType.sum\_sum\_intersection\_mul\_neg (Curves/StableReduction/NumericalType/IntersectionForm.lean). Import that linear algebra; the new step here is its geometric application to regular proper flat models without a smooth generic fibre. Inspection of Stacks Lemma 55.9.7 shows that its proof uses only positivity, the multiplicity relation and connectedness.

**Direct prerequisites.** [4.3](#np-4-3) (`NP.4/labelled-graph`); [StableReduction](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/StableReduction/README.md#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces) (`layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`); `SchemeAndStackFoundations:SF.5`.

**Checks.**

- For a fibre of type I₂ (two rational curves meeting in two points), N = [[−2, 2], [2, −2]].
- For an irreducible fibre, N = [0].

<a id="np-4-7"></a>

### 4.7 Descent of curves with negative self-intersection

`NP.4/negative-curve-descent` · theorem · planet: Descent of negative curves

Let S be a smooth proper surface over k and Ω/k an algebraically closed extension. A reduced integral curve C ⊂ S\_Ω with C² < 0 is defined over a finite separable extension of k. If Num\_{S/k} is constant, C = D\_Ω for a geometrically integral curve D ⊂ S defined over k.

**Hypotheses.** S smooth and proper over k; Ω algebraically closed over k; C a reduced integral curve on S\_Ω with negative self-intersection; constancy of Num only for the final assertion.

**Closure.** G5 requests the proper Hilbert algebraic space and its tangent formula from the parent. R09.2 currently states projective Hilbert representability only, so this node does not claim that this stronger supplier is already planned.

**Sources.**

- [STACKS](https://stacks.math.columbia.edu), Proposition 99.9.4 (tag 0CZX); Remark 99.7.10 (tag 0CZV): The separated finite-presentation Hilbert functor is an algebraic space locally of finite presentation, and first-order quotient deformations are controlled by Hom from the kernel to the quotient. The negative-curve descent argument above is an application of these results.

**Proof or construction.**

1. Use the Hilbert algebraic space of proper subschemes of S (Stacks Proposition 99.9.4). At [C] its tangent space is Hom(I\_C,O\_C) = H⁰(C,O\_C(C)), by the quotient-deformation formula of Remark 99.7.10; C is Cartier because S\_Ω is regular.
2. The normal line bundle has degree C² < 0 on an integral proper curve, hence has no nonzero global section. The Hilbert space is locally of finite presentation and has zero geometric tangent space here, so it is unramified at [C]. Over a field it is flat, hence étale there. Such a point has a finite separable field of definition, even if Ω/k is transcendental.
3. Choose a finite Galois extension defining C. Constancy of Num makes its conjugates numerically equal: after an algebraically closed extension the lattice is unchanged, and its Galois action is trivial. Two distinct effective integral curves have nonnegative mutual intersection, whereas numerical equality would make their mutual intersection equal to C² < 0. Thus every conjugate equals C.
4. Galois descent of the closed subscheme gives D over k; its base change to Ω is integral and reduced, so D is geometrically integral. This proves a stronger field-of-definition statement than the residue conclusion of SCH23; it is an independent repair, not a quotation of its proof.

**Direct prerequisites.** [4.3](#np-4-3) (`NP.4/labelled-graph`); [2.7](#np-2-7) (`NP.2/constant-num`); `AlgebraicModuliForArithmeticGeometry:R09.2`; `SchemeAndStackFoundations:SF.0`; `SchemeAndStackFoundations:SF.3`.

**Checks.**

- An exceptional (−1)-curve on a smooth surface with constant Num is defined over k.
- On a real quadric whose two rulings are conjugate, a ruling has square zero; the negative hypothesis cannot be dropped.
- On the blow-up of P²\_ℝ at a nonreal closed point, the two geometric exceptional curves are conjugate and Num is not constant.

<a id="np-4-8"></a>

### 4.8 Descent of fibre dual graphs under constant Num (Schröer, Theorem 2.1(i))

`NP.4/fibre-graph-descent` · theorem · planet: Fibre graph descent

Let S be a smooth proper surface over k with H⁰(S, O\_S) = k and Num\_{S/k} constant, f : S → Z a contraction, ā : Spec Ω → Z a geometric point with image a, S\_ā = S ×\_Z Spec Ω and S\_a = f^{-1}(a). If S\_ā is one-dimensional, then Γ(S\_ā) → Γ(S\_a) is a graph isomorphism.

**Hypotheses.** S smooth proper, H⁰(S, O\_S) = k, Num\_{S/k} constant; S\_ā one-dimensional (so f is birational or of fibre type).

**Sources.**

- [SCH23](https://arxiv.org/pdf/2004.07025v3), Theorem 2.1(i) and proof, pp. 8–9: With Num constant, the geometric-to-schematic fibre graph map is an isomorphism: negative definiteness (birational case) or semidefiniteness (fibre type) makes the components numerically independent, so Galois fixes them.
- ATLAS-EXTRACTIONS, PAPER-SCHROER-23/E25: In the fibre-type case the printed use of the two subcurves C₁+…+C\_{r−1} and C₂+…+C\_r does not exclude C₁ and C\_r being exchanged; the one-line fix (C\_i − C\_j)·C\_i < 0 separates all classes.

**Proof or construction.**

1. Work over an algebraically closed Ω containing κ(a); the geometric fibre is a closed curve on S\_Ω. Apply the surface-contraction trichotomy after this base change.
2. If the fibre has at least two components, every component has negative self-intersection, by exceptional negativity in the birational case or Zariski’s lemma in the fibre-type case. NP.4/negative-curve-descent therefore defines each component over k. If it has one component, the vertex map is automatically bijective.
3. In the reducible case the descended k-curves give distinct components over κ(a), so the vertex map is bijective. For field base change, vertex bijectivity preserves and reflects intersections (NP.4/component-dual-graph), giving the graph isomorphism. The Hilbert input used for this repair remains G5.

**Direct prerequisites.** [4.4](#np-4-4) (`NP.4/surface-contraction-trichotomy`); [4.5](#np-4-5) (`NP.4/exceptional-negativity`); [4.6](#np-4-6) (`NP.4/zariski-lemma`); [4.1](#np-4-1) (`NP.4/component-dual-graph`); [2.7](#np-2-7) (`NP.2/constant-num`); [1.1](#np-1-1) (`NP.1/numerical-group`); [4.7](#np-4-7) (`NP.4/negative-curve-descent`).

**Checks.**

- Over a finite field, every geometrically reducible fibre of a genus-one fibration of an Enriques surface with constant Num has its geometric components defined over its residue field (EnriquesSurfacesAndIntegralNonexistence 2.19).
- Without constant Num the statement fails: for a conic bundle S → P¹\_ℝ with a fibre x² + y² = 0 over a real point a, Γ(S\_ā) has two vertices (the conjugate lines) over one vertex of Γ(S\_a), and complex conjugation swaps their classes in Num(S\_ℂ).

<a id="np-4-9"></a>

### 4.9 Residue fields of reducible geometric fibres are purely inseparable (Theorem 2.1(iii))

`NP.4/reducible-fibre-residue` · theorem

In the situation of NP.4/fibre-graph-descent, if S\_ā is reducible then a is a closed k-rational point: κ(a) = k. In particular the purely inseparable conclusion of SCH23 Theorem 2.1(iii) holds. The stronger conclusion here uses NP.4/negative-curve-descent and its explicit Hilbert-space prerequisite G5.

**Hypotheses.** as in NP.4/fibre-graph-descent, with S\_ā reducible.

**Sources.**

- [SCH23](https://arxiv.org/pdf/2004.07025v3), Theorem 2.1(iii) and proof, pp. 8–9: If the geometric fibre is reducible, the residue extension k ⊂ κ(a) is purely inseparable, since otherwise Galois would permute the components of S\_a ⊗\_k Ω nontrivially.

**Proof or construction.**

1. A geometric fibre with at least two components has a component C of negative self-intersection, as in NP.4/fibre-graph-descent. Descend it to a geometrically integral proper curve D over k by NP.4/negative-curve-descent.
2. The restriction f|\_D becomes a constant morphism after the faithfully flat extension to Ω. Its scheme-theoretic image W is proper over k and has W\_Ω a single reduced Ω-point; hence W = Spec k by descent. The geometric image point lies over a, so a is closed with κ(a)=k. Equivalently, after knowing the image is a closed point, κ(a) embeds in H⁰(D,O\_D)=k.
3. This also handles geometric points lying over a nonclosed point of Z: a reducible fibre there would force that point to be closed, a contradiction. There is no assumption that κ(a)/k was finite before proving it.

**Direct prerequisites.** [4.8](#np-4-8) (`NP.4/fibre-graph-descent`); [4.6](#np-4-6) (`NP.4/zariski-lemma`); [4.5](#np-4-5) (`NP.4/exceptional-negativity`); [4.7](#np-4-7) (`NP.4/negative-curve-descent`).

**Checks.**

- Over a finite field every purely inseparable extension is trivial, so reducible geometric fibres lie over rational points.

<a id="np-4-10"></a>

### 4.10 Edge labels of fibre graphs descend (Theorem 2.1(ii), corrected)

`NP.4/fibre-label-descent` · theorem

In the situation of NP.4/fibre-graph-descent, suppose S\_ā is reducible and (S\_a)\_red is geometrically reduced over κ(a). Then κ(a) = k, and the graph isomorphism Γ(S\_ā) → Γ(S\_a) preserves edge labels: (C\_i·C\_j) on S\_Ω equals (D\_i·D\_j) on S for the components C\_i, C\_j of S\_ā over the components D\_i, D\_j of S\_a. When the geometric fibre has only one component, label preservation is vacuous; the residue-field assertion here is only for reducible fibres.

**Hypotheses.** as in NP.4/fibre-graph-descent; S\_ā reducible; (S\_a)\_red geometrically reduced over κ(a).

**Sources.**

- [SCH23](https://arxiv.org/pdf/2004.07025v3), Theorem 2.1(ii), p. 8: The graph isomorphism respects edge labels provided the reduced schematic fibre is geometrically reduced over the residue field; the proof is left to the reader.

**Proof or construction.**

1. With one component there are no edges and hence no labels to compare. Treat the reducible case for the substantive assertion below.
2. NP.4/reducible-fibre-residue now gives a closed point a with κ(a)=k, by the negative-curve Hilbert rigidity argument. This step depends on G5, and is stronger than the statement printed as Theorem 2.1(iii).
3. Each geometric component C\_i descends to a geometrically integral divisor D\_i on S by NP.4/negative-curve-descent. Thus the full Cartier pullback is D\_{i,Ω}=C\_i, without a nilpotent multiplicity. Proper intersection numbers are invariant under field extension, so (D\_i·D\_j)\_k=(C\_i·C\_j)\_Ω.
4. This proves the source’s label assertion under its stated geometric-reducedness hypothesis (in fact the repair proves geometric integrality of the components). No comparison between q and q² is used: the old q-scaling formula for a fibre inside S was unjustified.

**Direct prerequisites.** [4.8](#np-4-8) (`NP.4/fibre-graph-descent`); [4.9](#np-4-9) (`NP.4/reducible-fibre-residue`); [4.3](#np-4-3) (`NP.4/labelled-graph`); [4.7](#np-4-7) (`NP.4/negative-curve-descent`).

**Checks.**

- Over a finite field the residue extension is trivial by (iii) and the labels agree directly.

<a id="layer-5"></a>

## Layer 5: Numerical theory in families and descent along contractions

**Targets.** For a proper scheme over a DVR, the injective restriction N¹(𝒳/S) → N¹(X) to the special fibre and numerical surjectivity; numerical surjectivity gives numerical, not actual, lifts (the source already uses numerical equivalence); lifting of line bundles over a complete DVR when H²(X, O\_X) = 0 (Hacon–Witaszek Lemma 6.3); identification of relative cones under numerical surjectivity; transfer of nef and big from the special to the generic fibre; descent of relatively semiample, relatively numerically trivial sheaves along contractions (the general step behind Bhatt et al. Propositions 2.51 and 9.16 and Hacon–Witaszek Proposition 5.4); vertical numerical descent (Cascini–Tanaka Lemma 2.17); extremal curves of minimal normalised degree (Bhatt et al. Definition 9.30); the complex projective Alexeev–Hacon–Kawamata birational Picard rank; its relative positive-characteristic extension is G7. Vertical descent in the full excellent generality requires G6.

**Layer suppliers.** `AlgebraicModuliForArithmeticGeometryPartII:NP.0`; `AlgebraicModuliForArithmeticGeometryPartII:NP.1`; `AlgebraicModuliForArithmeticGeometryPartII:NP.3`; `AlgebraicModuliForArithmeticGeometryPartII:NP.4`; `AlgebraicModuliForArithmeticGeometry:A0-extension`; `SchemeAndStackFoundations:SF.0`; `SchemeAndStackFoundations:SF.4`; `SchemeAndStackFoundations:SF.5`.

**Closure work.**

- G6: provide the vertical negativity/slicing input in the stated excellent generality.
- G7: establish the relative positive-characteristic AHK-rank extension consumed by HW23.
- Relative finite-dimensional numerical spaces inherit NP.1/G1–G2; MMP-specific applications remain routed to the birational-geometry continuation.

<a id="np-5-1"></a>

### 5.1 Restriction of numerical classes to the special fibre over a DVR

`NP.5/special-fibre-restriction` · construction

Let R be a discrete valuation ring with residue field k, S = Spec R, and 𝒳 → S proper with special fibre X = 𝒳 ⊗\_R k. The curves over S are exactly the integral curves of X, so N₁(𝒳/S) is a quotient of N₁(X/k), and restriction of invertible sheaves induces res : N¹(𝒳/S) → N¹(X/k), [𝓛] ↦ [𝓛|\_X], which is injective. 𝒳/S is called numerically surjective when res is surjective (equivalently its ℚ-form is).

**Hypotheses.** R a DVR; 𝒳 → Spec R proper (projective in the sources).

**Sources.**

- [HW23](https://arxiv.org/pdf/2009.02631v2), Theorem 1.3(2), p. 2, and the remark after Theorem 1.4, p. 3: The hypothesis that N¹(𝒳/Spec R) → N¹(X) is surjective for a lift over a DVR, with N¹ = Pic ⊗ ℚ modulo numerical equivalence; completeness of R is needed for surjectivity via Lemma 6.3.
- [HW23](https://arxiv.org/pdf/2009.02631v2), proof of Theorem 1.3(2a), p. 33: Only curves projective over S, hence lying in the special fibre, enter NE(𝒳/S); numerical relations on 𝒳 and X agree when the restriction is surjective.

**Proof or construction.**

1. The only closed point of S is the closed point, so by NP.0/closed-points-suffice 𝓛 ≡\_S 0 iff 𝓛|\_X ≡ 0: res is well defined and injective.
2. A 1-cycle on X pairs with Pic(𝒳) through restriction; it is numerically trivial on 𝒳/S iff it annihilates the image of res, so N₁(𝒳/S) = N₁(X)/(image of res)^⊥.

**Uses.**

- Hacon–Witaszek 2023, Theorem 1.3(2) (published Theorem 6.1): lifting MMP steps of the special fibre over R
- this roadmap NP.5/numerical-representatives and NP.5/cone-identification: what numerical surjectivity supplies and what it does not

**API.**

- `Numerical.specialFibreRestriction` (data): res : N¹(𝒳/S) → N¹(X/k) and its ℚ-form.
- `Numerical.specialFibreRestriction_injective` (other): res is injective.
- `Numerical.IsNumericallySurjective` (data): The predicate that res is surjective.
- `Numerical.curveSpace_specialFibre` (equivalence): N₁(𝒳/S) ≅ N₁(X/k)/(im res)^⊥, compatibly with the pairings.
- `Numerical.specialFibreRestriction_baseChange` (functoriality): For an extension of DVRs R → R′ with 𝒳′ = 𝒳 ⊗ R′, res commutes with the base change maps.

**Direct prerequisites.** [1.1](#np-1-1) (`NP.1/numerical-group`); [1.2](#np-1-2) (`NP.1/curve-space`); [0.5](#np-0-5) (`NP.0/closed-points-suffice`).

**Checks.**

- `Numerical.specialFibreRestriction_projectiveSpace` (computation): For 𝒳 = P^n\_R, res is the identity of ℝ ≅ N¹ and 𝒳 is numerically surjective.
- `Numerical.specialFibreRestriction_identity` (degenerate): For 𝒳 = S, both N¹ groups are zero.
- `Numerical.specialFibreRestriction_quadricDegeneration` (non-example): For the smooth quadric 𝒳 = {x² + y² = zw} over the non-complete DVR ℤ\_(5), the rulings of the generic fibre are defined over ℚ(i) and exchanged by Galois, so Pic(𝒳) = Pic(𝒳\_ℚ) has rank 1, while the special fibre over 𝔽₅ (where −1 is a square) is split with N¹ of rank 2: res is injective and not surjective. Over a henselian DVR this cannot happen, since the ruling cover is étale.
- For 𝒳 = P^n\_R, res : ℝ → ℝ is the identity on the degree.

<a id="np-5-2"></a>

### 5.2 Numerical surjectivity gives numerical, not actual, lifts

`NP.5/numerical-representatives` · theorem

In the situation of NP.5/special-fibre-restriction, assume 𝒳/S is numerically surjective. Then for every L ∈ Pic(X) there are m ≥ 1 and 𝓛 ∈ Pic(𝒳) with 𝓛|\_X ≡ L^{⊗m} (numerical equivalence on X); equivalently every ℚ-line bundle on X is numerically the restriction of a ℚ-Cartier class on 𝒳. Numerical surjectivity does not imply that L itself, is isomorphic to the restriction of an invertible sheaf on 𝒳. This assertion does not claim that every positive power also fails to lift.

**Hypotheses.** R a DVR, 𝒳/S proper and numerically surjective.

**Sources.**

- [HW23](https://arxiv.org/pdf/2009.02631v2), proof of Theorem 1.3(2), pp. 33–34: The step where Cartier divisors 𝒜, ℋ on 𝒳 with 𝒜|\_X = A and ℋ|\_X = H are taken from surjectivity of N¹(𝒳/S) → N¹(X).
- [LMFDB11](https://www.lmfdb.org/EllipticCurve/Q/11/a/2), 11.a2 (Cremona 11a1), minimal equation, Mordell–Weil group and bad-prime data: The curve has rational group ℤ/5 and good reduction at 7. The order 10 over F₇ is checked directly from the displayed equation; it is not inferred from a source error in HW23.

**Proof or construction.**

1. Num(𝒳/S) and Num(X) are lattices of the same rank in N¹ (NP.1/finite-dimensionality), and res maps the first injectively into the second with finite index when surjective after ⊗ℚ; m can be taken to be that index.
2. For the exact-lift distinction take the smooth proper model over ℤ\_(7) of E : y²+y=x³−x²−10x−20 (Cremona 11a1, LMFDB 11.a2). Its rational group is ℤ/5 and its F₇-group has 10 points (direct enumeration gives 9 affine points and infinity). Every generic line bundle extends across this regular model, and a vertical divisor is a multiple of the principal special fibre, so Pic(𝒳)=Pic(E\_ℚ). Thus a degree-zero special class outside the image of E(ℚ) does not lift exactly, although it is numerically lifted by O. Every degree-zero special class is torsion, so a positive power is trivial and does lift; this example cannot support the old stronger claim.

**Direct prerequisites.** [5.1](#np-5-1) (`NP.5/special-fibre-restriction`); [1.4](#np-1-4) (`NP.1/finite-dimensionality`).

**Checks.**

- When H²(X, O\_X) = 0 and R is complete, actual lifts exist (NP.5/line-bundle-lifting).

<a id="np-5-3"></a>

### 5.3 Line bundles lift over a complete DVR when H²(X, O_X) = 0

`NP.5/line-bundle-lifting` · theorem · planet: Lifting line bundles over a complete DVR

Let R be a complete discrete valuation ring, 𝒳 → Spec R proper flat with special fibre X, and H²(X, O\_X) = 0. Every invertible sheaf L on X is isomorphic to 𝓛|\_X for some invertible 𝓛 on 𝒳; in particular 𝒳/R is numerically surjective. If L is ample, every such 𝓛 is ample over R.

**Hypotheses.** R complete DVR (any characteristics); 𝒳 proper flat over R; H²(X, O\_X) = 0.

**Sources.**

- [HW23](https://arxiv.org/pdf/2009.02631v2), Lemma 6.3 and proof, p. 31: For a complete mixed-characteristic DVR and a lift of X with H²(X, O\_X) = 0, every line bundle lifts (obstructions in H², Grothendieck existence), so N¹(𝒳/R) → N¹(X) is surjective, and ample lifts are ample by Stacks 0D3A; the argument does not use the characteristic.
- [KLE05](https://arxiv.org/pdf/math/0504020v1), Proposition 5.19 and proof, p. 47: Infinitesimal lifting of invertible sheaves has obstruction in H²(X, O\_X).

**Proof or construction.**

1. Lift L successively to X\_n = 𝒳 ⊗ R/m^{n+1}: the obstruction lies in H²(X, O\_X) ⊗ m^n/m^{n+1} = 0 (AlgebraicModuliForArithmeticGeometry A0-extension/picard-infinitesimal-lifting, framed lifts along the flat thickenings).
2. Grothendieck's existence theorem (SchemeAndStackFoundations §4.10) algebraises the compatible system (L\_n) to an invertible 𝓛 on 𝒳 with 𝓛|\_X ≅ L.
3. Ampleness: the closed fibre is the only fibre over a closed point, so openness of ampleness (NP.3/ampleness-openness, scheme case) makes 𝓛 ample over a neighbourhood of the closed point, which is all of Spec R.

**Direct prerequisites.** [5.1](#np-5-1) (`NP.5/special-fibre-restriction`); [3.8](#np-3-8) (`NP.3/ampleness-openness`); `AlgebraicModuliForArithmeticGeometry:A0-extension/picard-infinitesimal-lifting`; `SchemeAndStackFoundations:SF.4`.

**Checks.**

- For a lift of a curve (H² = 0 automatically), every line bundle lifts; for a lift of an abelian or K3 surface the hypothesis fails and the Picard rank can drop.

<a id="np-5-4"></a>

### 5.4 Numerical surjectivity identifies relative and special-fibre cones

`NP.5/cone-identification` · theorem · planet: Identification of relative cones

In the situation of NP.5/special-fibre-restriction, if 𝒳/S is numerically surjective then res : N¹(𝒳/S) → N¹(X) is an isomorphism, the identity on cycles induces N₁(X) ≅ N₁(𝒳/S), and under these identifications NE‾(𝒳/S) = NE‾(X), Nef(𝒳/S) = Nef(X), and extremal rays and faces of the two cones correspond. A class on 𝒳 is relatively ample over S iff its restriction to X is ample.

**Hypotheses.** R a DVR; 𝒳/S proper and numerically surjective.

**Sources.**

- [HW23](https://arxiv.org/pdf/2009.02631v2), proof of Theorem 1.3(2a), p. 33: When N¹(𝒳/S) → N¹(X) is surjective, NE(𝒳/S) = NE(X), because only curves in the special fibre enter and numerical relations agree; an extremal ray of X is cut out on 𝒳 by a lifted ample class.

**Proof or construction.**

1. res is injective (NP.5/special-fibre-restriction) and surjective by hypothesis; dualising gives N₁(X) ≅ N₁(𝒳/S) because the curves are the same and the annihilator of im res is zero.
2. Effective cycles correspond under the identity, so the cones and their closures agree; nef cones are their duals; faces correspond.
3. Ampleness over S is tested on the special fibre by openness of ampleness (NP.3/ampleness-openness).

**Direct prerequisites.** [5.1](#np-5-1) (`NP.5/special-fibre-restriction`); [1.5](#np-1-5) (`NP.1/relative-nef`); [3.8](#np-3-8) (`NP.3/ampleness-openness`).

**Checks.**

- For 𝒳 = P^n\_R both cones are the ray of a line.

<a id="np-5-5"></a>

### 5.5 Nef and big classes on the special fibre are nef and big on the generic fibre

`NP.5/nef-big-specialization` · theorem

Let R be a DVR and T → Spec R flat and projective with integral special fibre T\_s and integral generic fibre T\_η of dimension n ≥ 1, and let H be a ℚ-Cartier divisor on T. If H|\_{T\_s} is nef and big then H|\_{T\_η} is nef and big. The conclusion depends only on the numerical class of H|\_{T\_s}.

**Hypotheses.** R a DVR; T → Spec R flat projective with integral fibres of dimension n; H ℚ-Cartier on T.

**Sources.**

- ATLAS-EXTRACTIONS, PAPER-HACON-WITASZEK-23/special-nef-big-transfer: For a flat projective family over a DVR with integral three-dimensional fibres, a ℚ-Cartier H whose special restriction is nef and big has nef and big generic restriction, independently of the numerical representative; supplied in the extraction for the repaired proof of the published Theorem 6.1(2b).
- [HW23](https://arxiv.org/pdf/2009.02631v2), proof of Theorem 1.3(1), p. 32: Top self-intersections of K + tA agree on the generic and special fibres of the lift, which is used to compare bigness.

**Proof or construction.**

1. Top self-intersections are constant in flat proper families: χ(T\_t, mH|\_{T\_t}) is independent of t, and (H\_t^n) is n! times its leading coefficient in m; so (H\_η^n) = (H\_s^n) > 0.
2. Nefness: for an integral curve C\_η ⊂ T\_η, its closure 𝒞 ⊂ T is flat over R and its special fibre is an effective 1-cycle Σ a\_iC\_i on T\_s; constancy of χ on 𝒞 gives (H·C\_η) = Σ a\_i (H·C\_i) ≥ 0.
3. Apply the projective nef-and-big criterion imported by NP.1/big from SF.5/nef-big-numerical: both fibres here are projective, so G3 (the arbitrary proper extension) is not used. Nefness and the top self-intersection depend only on numerical classes.

**Direct prerequisites.** [1.5](#np-1-5) (`NP.1/relative-nef`); [1.6](#np-1-6) (`NP.1/big`); [0.5](#np-0-5) (`NP.0/closed-points-suffice`); `SchemeAndStackFoundations:SF.5`.

**Checks.**

- For T = P^n\_R and H = O(1), both restrictions are ample.
- The converse fails even with smooth integral fibres. Over k[[t]], blow up P² along the three disjoint sections [1:0:0], [0:1:0], [1:1:t]. For H=2h−e₁−e₂−e₃, the generic three points are noncollinear, so H is nef and H²=1. On the special fibre their common line has strict transform ℓ=h−e₁−e₂−e₃ and H·ℓ=−1. The family and both fibres are smooth; the counterexample is not a blow-up confined to a special point.

<a id="np-5-6"></a>

### 5.6 Relatively semiample, relatively numerically trivial sheaves descend

`NP.5/semiample-trivial-descent` · theorem · planet: Descent of numerically trivial semiample sheaves

Let f : X → Z be a contraction of schemes proper over a Noetherian scheme S, and L an invertible sheaf on X that is f-semiample and f-numerically trivial. Then there are m ≥ 1 and an invertible sheaf M on Z with L^{⊗m} ≅ f*M. For ℚ-Cartier divisors: an f-semiample, f-numerically trivial ℚ-Cartier D on X is ℚ-linearly equivalent to f* of a ℚ-Cartier divisor on Z.

**Hypotheses.** f a contraction; L f-semiample and ≡\_f 0.

**Sources.**

- [BMP23](https://arxiv.org/pdf/2012.15801v3), Proposition 2.51, second assertion and proof, pp. 26–27: For the semiample fibration of a nef L, every relatively numerically trivial ℚ-Cartier divisor descends; the proof makes L + D semiample over the base and descends it.
- [BMP23](https://arxiv.org/pdf/2012.15801v3), Proposition 9.16(a), p. 106: In the contraction of an extremal face, numerically trivial ℚ-Cartier divisors over Z descend to Z.
- ATLAS-EXTRACTIONS, PAPER-HACON-WITASZEK-23/semistable-numerical-descent: Prop 5.4's final assertion: for the base point free contraction, f-numerically trivial ℚ-Cartier divisors are ℚ-linearly pulled back.

**Proof or construction.**

1. Choose m with f*f\_*L^{⊗m} → L^{⊗m} surjective; it defines a Z-morphism φ : X → P = P\_Z(f\_*L^{⊗m}) with L^{⊗m} ≅ φ*O\_P(1).
2. Since L ≡\_f 0, φ maps every curve in a fibre of f to a point (O\_P(1) is ample on the fibres of P → Z); by NP.3/rigidity φ = h ∘ f for a unique Z-morphism h : Z → P.
3. Then L^{⊗m} ≅ f*(h*O\_P(1)); put M := h*O\_P(1).

**Direct prerequisites.** [3.2](#np-3-2) (`NP.3/rigidity`); [3.3](#np-3-3) (`NP.3/semiample`); [0.4](#np-0-4) (`NP.0/numerically-trivial`); [3.1](#np-3-1) (`NP.3/contraction`).

**Checks.**

- For f the structure map X → X^aff of a proper k-scheme and L torsion, the conclusion holds with M trivial on the finite X^aff.
- Semiampleness cannot be dropped: on an elliptic curve E → Spec k, O(p − q) of infinite order is numerically trivial and no power is pulled back from the point.

<a id="np-5-7"></a>

### 5.7 Vertical numerical descent (Cascini–Tanaka, Lemma 2.17)

`NP.5/vertical-descent` · theorem · planet: Vertical numerical descent

Let f : X → S be a proper morphism of integral normal excellent schemes with f\_*O\_X = O\_S, and L a ℚ-Cartier ℚ-divisor on X. Assume S is ℚ-factorial, L is f-nef, L restricted to the generic fibre X\_{K(S)} is ℚ-linearly trivial, and every prime divisor D of X has f(D) equal to S or to a prime divisor of S. Then L ∼\_ℚ f*M for a ℚ-Cartier ℚ-divisor M on S.

**Hypotheses.** f proper, X, S integral normal excellent, f\_*O\_X = O\_S; S ℚ-factorial; L f-nef, generically ℚ-trivial; no prime divisor of X maps to a closed subset of codimension ≥ 2.

**Closure.** G6: high-dimensional vertical negativity and its reduction to surfaces are missing prerequisites in this excellent generality. The target matches CT20, but its proof is not closed.

**Sources.**

- [CT20](https://arxiv.org/pdf/1706.04845v3), Lemma 2.17 and proof, pp. 16–17: For a proper morphism of integral normal excellent schemes with f\_*O\_X = O\_S, a ℚ-Cartier L which is f-nef, ℚ-trivial on the generic fibre, with S ℚ-factorial and every prime divisor dominating S or mapping onto a prime divisor, is ℚ-linearly a pullback.
- [BMP23](https://arxiv.org/pdf/2012.15801v3), proofs of Lemmas 2.54 and 9.25, pp. 27 and 111: Applies Cascini–Tanaka Lemma 2.17 to deduce relative torsion or pullback of a nef divisor along an equidimensional fibration over a regular base.
- [WIT22](https://arxiv.org/pdf/2002.11915v2), proof of Proposition 6.6: Applies Cascini–Tanaka Lemma 2.17 for vertical ℚ-pullback in the EWM argument.

**Proof or construction.**

1. Replace L by a Cartier multiple; generic ℚ-triviality gives mL + div(φ) = L′ with Supp L′ ⊂ f^{-1}(S₀), S₀ ⊊ S closed.
2. By hypothesis every component of L′ maps onto a prime divisor P of S; ℚ-factoriality makes f*P a ℚ-Cartier divisor, and subtracting a multiple of f*P makes L′ ≤ 0 over the generic point of P with one coefficient zero.
3. The needed local step is vertical negativity: over O\_{S,P}, an f-nef vertical divisor which is nonpositive and has a zero coefficient must vanish. CT20 invokes this via cuts to surface models. The surface matrix result alone does not supply the cuts in the excellent generality stated here; this exact input is G6, so this proof stops conditionally at that step. Once it is supplied, remove one P at a time and descend the resulting divisor from S.

**Direct prerequisites.** [1.5](#np-1-5) (`NP.1/relative-nef`); [4.6](#np-4-6) (`NP.4/zariski-lemma`); [3.1](#np-3-1) (`NP.3/contraction`); `SchemeAndStackFoundations:SF.0`.

**Checks.**

- For f a projective bundle over a regular S, every f-nef L trivial on the generic fibre is a pullback.
- The last hypothesis is needed: for the blow-up f : X = Bl\_p S → S of a closed point on a regular surface, L = O(−E) is f-nef ((−E)·E = 1), trivial on the generic fibre, and not ℚ-linearly a pullback since pullbacks have degree 0 on E; here E maps to a point.

<a id="np-5-8"></a>

### 5.8 Extremal curves of minimal normalised degree on a ray

`NP.5/extremal-curve` · theorem

Let f : X → T be projective with T Noetherian, R ⊂ NE‾(X/T) a ray containing the class of some curve over T, and H an f-ample Cartier divisor. For curves C over T with [C] ∈ R, the numbers (H·C)/d\_C are positive integers, where d\_C is the curve index of C over the residue field of its image point (NP.0/curve-index). Hence the minimum μ\_H(R) = min{(H·C)/d\_C : [C] ∈ R} is attained; a curve attaining it is called extremal. Extremality does not depend on H, and for every ℚ-Cartier D with D·R < 0, an extremal Γ maximises (D·C)/d\_C among curves in R.

**Hypotheses.** f projective, T Noetherian; R a ray spanned by a curve class.

**Sources.**

- [BMP23](https://arxiv.org/pdf/2012.15801v3), Definition 9.30 and the following paragraph, p. 116: A curve Γ in an extremal ray is extremal if it minimises H·C/d\_C; the notion is independent of the ample H, and negative divisors on the ray are maximised by it.

**Proof or construction.**

1. d\_C divides (H·C) (NP.0/curve-index), and (H·C) > 0 for f-ample H, so (H·C)/d\_C ∈ ℤ\_{>0}; a nonempty set of positive integers has a minimum.
2. All curves in R have classes λ\_C·ξ for a fixed generator ξ with λ\_C > 0; for another ample H′, (H·C)/(H′·C) = (H·ξ)/(H′·ξ) is constant on R, so the minimisers coincide.
3. For D·R < 0, (D·C)/d\_C = λ\_C(D·ξ)/d\_C with D·ξ < 0 is maximal exactly where λ\_C/d\_C, equivalently (H·C)/d\_C, is minimal.

**Direct prerequisites.** [0.2](#np-0-2) (`NP.0/curve-index`); [1.2](#np-1-2) (`NP.1/curve-space`).

**Checks.**

- On P^n\_k over k the lines are extremal, with (O(1)·line)/d = 1.
- For X = P¹\_ℂ viewed over T = Spec ℝ, d\_X = 2 and (O(1)·X)\_ℝ/d\_X = 1.

<a id="np-5-9"></a>

### 5.9 The Alexeev–Hacon–Kawamata birational Picard rank

`NP.5/ahk-rank` · construction · planet: Alexeev–Hacon–Kawamata rank

Let Y be a normal projective variety over ℂ and π : X → Y a projective resolution with X smooth. Define ρ\_AHK(Y) := ρ(X) − #{π-exceptional prime divisors}. This integer is independent of resolution, is invariant under birational maps that are isomorphisms in codimension one, and agrees with ρ(Y) when Y is ℚ-factorial. It is not in general the rank of Cartier numerical classes on a singular Y. A relative version over a Noetherian base, particularly in positive characteristic as used by HW23, is a separate remaining target G7; it is not asserted from AHK07 Lemma 1.6.

**Hypotheses.** Normal projective complex variety Y; projective smooth resolutions and common dominating resolutions (the setting of AHK07, p. 1 and Lemma 1.6)..

**Sources.**

- [AHK07](https://arxiv.org/pdf/math/0605137v2), Conventions, p. 1; Lemma 1.6 and proof, pp. 3–4: For projective complex varieties with smooth resolution, the exceptional divisor classes are independent in N¹ and their number subtracted from the resolution’s Picard number is independent of the resolution.
- [HW23](https://arxiv.org/pdf/2009.02631v2), §3, p. 12: The proof of Theorem 2.14, p. 12, uses a relative version of AHK rank for normalisations in positive characteristic, referring to AHK Lemma 1.6; it does not supply a proof of that extension.

**Proof or construction.**

1. AHK Lemma 1.6 proves independence of exceptional divisor classes by cutting to regular surfaces and using their negative intersection form. In its dimension count the number of extra hyperplanes on X must be dim X−e−2, after e cuts on Y, rather than the printed dim X−e+2.
2. For a birational morphism g : X₃ → X₁ of smooth projective varieties, pushforward and pullback of Cartier divisors split their classes modulo the independent exceptional divisors. Hence ρ(X₃)=ρ(X₁)+#Exc(g). A common smooth resolution compares any two resolutions of Y.
3. Small birational modifications have the same exceptional prime divisors on a common resolution. If Y is ℚ-factorial, every pushed-forward Weil divisor has a Cartier multiple; this identifies the quotient by exceptional classes with N¹(Y).
4. These arguments use projective complex hyperplane sections and smooth resolutions. HW23 p. 12 uses a relative positive-characteristic analogue but does not prove the extra hyperplane, regularity and numerical-independence inputs; these are requested in G7 before that application is closed.

**Uses.**

- Hacon–Witaszek 2023, termination arguments (§3): a birational invariant that decreases under divisorial contractions and is stable under flips
- Alexeev–Hacon–Kawamata 2007, Definition 2.8 (difficulty): a summand of the difficulty function in termination of flips

**API.**

- `Numerical.ahkRank` (data): For normal projective complex Y, ρ\_AHK(Y) ∈ ℤ is computed on a projective smooth resolution; independence is part of the target.
- `Numerical.ahkRank_eq_of_resolution` (characterisation): For every projective smooth resolution π : X → Y of a normal projective complex variety, ρ\_AHK(Y)=ρ(X)−#Exc(π).
- `Numerical.ahkRank_regular` (compatibility): If Y is smooth, ρ\_AHK(Y) = ρ(Y).
- `Numerical.ahkRank_small` (other): ρ\_AHK is invariant under birational maps over ℂ that are isomorphisms in codimension one.
- `Numerical.ahkRank_divisorialContraction` (relation): For a projective birational morphism Y → Y′ of normal projective complex varieties contracting exactly one prime divisor, ρ\_AHK(Y′)=ρ\_AHK(Y)−1; with r exceptional prime divisors the difference is r.

**Direct prerequisites.** [1.1](#np-1-1) (`NP.1/numerical-group`); [4.5](#np-4-5) (`NP.4/exceptional-negativity`); [1.4](#np-1-4) (`NP.1/finite-dimensionality`); `SchemeAndStackFoundations:SF.4`.

**Checks.**

- `Numerical.ahkRank_projectivePlane` (computation): ρ\_AHK(P²/ℂ) = 1, computed on P² or on any blow-up Bl\_{p}P² (2 − 1).
- `Numerical.ahkRank_regular_point` (degenerate): For Y=Spec ℂ, the identity resolution gives ρ\_AHK(Y)=0; no positivity assertion is made in dimension zero.
- `Numerical.ahkRank_quadricCone` (computation): For the projective cone Y over a smooth conic, the minimal resolution is the Hirzebruch surface F₂ with ρ = 2 and one exceptional curve, so ρ\_AHK(Y) = 1.
- `Numerical.ahkRank_ne_naive` (non-example): Take the projective quadric threefold cone Y=V(xy−zw)⊂P⁴\_ℂ. An incidence small resolution X→Y is a P²-bundle over P¹, hence projective with ρ(X)=2 and no exceptional prime divisors. Thus ρ\_AHK(Y)=2, while the Cartier Picard rank of Y is 1. An affine local ordinary double point would not test the projective theorem.
- For smooth projective Y over ℂ, ρ\_AHK(Y)=ρ(Y).
- For the projective cone over a smooth plane conic over ℂ, the resolution F₂ has Picard number 2 and one exceptional curve, so ρ\_AHK=1.

## Supplier contracts

**`SchemeAndStackFoundations:SF.0`.** SchemeAndStackFoundations §0.9 (limits, finite-presentation descent to a finite stage), §0.11 (descent along field extensions, absolute integral closure), §0.23 (universal homeomorphisms, purely inseparable base change), and domination of Noetherian local domains by discrete valuation rings with finite residue extension (Stacks 00PH, Krull–Akizuki). Import only; no new targets.

Used by [0.2](#np-0-2) (`NP.0/curve-index`), [0.5](#np-0-5) (`NP.0/closed-points-suffice`), [0.3](#np-0-3) (`NP.0/field-extension-invariance`), [2.12](#np-2-12) (`NP.2/finite-field-finiteness`), [3.5](#np-3-5) (`NP.3/spreading-out`), [3.6](#np-3-6) (`NP.3/inseparable-descent`), [4.4](#np-4-4) (`NP.4/surface-contraction-trichotomy`), [5.7](#np-5-7) (`NP.5/vertical-descent`).

**`SchemeAndStackFoundations:SF.1`.** SchemeAndStackFoundations Layer 1: algebraic spaces, their étale sites and quasi-coherent modules (§§1.2–1.11), fpqc descent of quasi-coherent modules (§1.1). Import only.

Used by [2.1](#np-2-1) (`NP.2/picard-scheme`), [3.8](#np-3-8) (`NP.3/ampleness-openness`).

**`SchemeAndStackFoundations:SF.2`.** SchemeAndStackFoundations §2.2 (Leray), §2.6 (flat base change of quasi-coherent cohomology), §2.11 (Hilbert 90 and Kummer), §2.15 (Galois cohomology of fields, torsion of H²(K, G\_m)), §2.22 (Azumaya algebras and cohomological Brauer groups). Import only. Use the exact SF.2/finite-pushforward-exact theorem on SMALL ÉTALE sites, for all abelian sheaves, in NP.2/finite-algebra-brauer. Smooth-group étale/fppf comparison is a distinct input; arbitrary finite fppf pushforward is not declared exact.

Used by [1.3](#np-1-3) (`NP.1/neron-severi-rank`), [2.2](#np-2-2) (`NP.2/affinization`), [2.3](#np-2-3) (`NP.2/finite-algebra-brauer`), [2.4](#np-2-4) (`NP.2/leray-obstruction`), [2.9](#np-2-9) (`NP.2/torsor-torsion`), [3.1](#np-3-1) (`NP.3/contraction`), [3.5](#np-3-5) (`NP.3/spreading-out`).

**`SchemeAndStackFoundations:SF.3`.** Import SF.3/vector-bundle-degree for proper schemes of dimension ≤1 (including its determinant/tensor and field-extension laws), and SF.3 lineBundleNorm for finite locally free morphisms with norm–pullback multiplication by the rank. NP.0 applies this degree; NP.2 applies this norm.

Used by [0.1](#np-0-1) (`NP.0/curve-degree`), [2.8](#np-2-8) (`NP.2/picard-norm`).

**`SchemeAndStackFoundations:SF.4`.** SchemeAndStackFoundations §4.9 (stein\_factorization and Zariski connectedness), §4.10 (Grothendieck existence for proper schemes over complete Noetherian rings), §4.12 (generic flatness, Chow's lemma), §4.11 (blow-ups, for the resolution hypotheses of NP.5/ahk-rank). Import only. The specific affinization is supplied by SF.4/stein-factorization; its general relative-Spec machinery is already owned by current upstream AlgebraicVectorBundles L1A–L1B, not reconstructed here.

Used by [1.4](#np-1-4) (`NP.1/finite-dimensionality`), [2.1](#np-2-1) (`NP.2/picard-scheme`), [2.2](#np-2-2) (`NP.2/affinization`), [3.1](#np-3-1) (`NP.3/contraction`), [3.2](#np-3-2) (`NP.3/rigidity`), [4.4](#np-4-4) (`NP.4/surface-contraction-trichotomy`), [5.3](#np-5-3) (`NP.5/line-bundle-lifting`), [5.9](#np-5-9) (`NP.5/ahk-rank`).

**`SchemeAndStackFoundations:SF.5`.** SchemeAndStackFoundations §§5.2–5.3 (proper pushforward, c₁ and c1\_degree\_curve; iterated intersection numbers on proper subschemes over a field), §5.9 (surface pairing over a field and over a Dedekind base), §5.10 (Num of smooth projective surfaces, for the compatibility statements). Import only. Import SF.5/nef-big-numerical only in its reduced projective scope. The arbitrary proper extension is G3. For proper surface pairing use the general proper first-Chern-class intersection theory, rather than treating the algebraically closed projective surface-pairing target as if it had broader hypotheses.

Used by [0.1](#np-0-1) (`NP.0/curve-degree`), [0.6](#np-0-6) (`NP.0/surjective-pullback`), [1.3](#np-1-3) (`NP.1/neron-severi-rank`), [1.6](#np-1-6) (`NP.1/big`), [4.3](#np-4-3) (`NP.4/labelled-graph`), [4.5](#np-4-5) (`NP.4/exceptional-negativity`), [4.6](#np-4-6) (`NP.4/zariski-lemma`), [5.5](#np-5-5) (`NP.5/nef-big-specialization`).

**`AlgebraicModuliForArithmeticGeometry:A0-extension`.** AlgebraicModuliForArithmeticGeometry A0-extension nodes relative-picard-sheaf, picard-space-representability, picard-brauer-obstruction, picard-infinitesimal-lifting and picard-zero-criterion (upstream TauCetiRoadmap PR #853 §§7.3, 7.6, 7.9; the representability, separation, Brauer obstruction and Pic⁰ targets now sit in ComplexComparisonPartII §§C3.2d–C3.2f, PR #848). This roadmap extends them to proper schemes over a field without universal functions; nothing is re-planned.

Used by [2.1](#np-2-1) (`NP.2/picard-scheme`), [2.4](#np-2-4) (`NP.2/leray-obstruction`), [2.5](#np-2-5) (`NP.2/tau-component`), [5.3](#np-5-3) (`NP.5/line-bundle-lifting`).

**`AlgebraicModuliForArithmeticGeometry:R09.1`.** AlgebraicModuliForArithmeticGeometry R09.1 (upstream Layer 1, §1.4 relative very ampleness, §1.5 Hilbert polynomials): projective embeddings by globally generated powers used in NP.3/semiample-contraction. Import only.

Used by [3.4](#np-3-4) (`NP.3/semiample-contraction`).

**`AlgebraicModuliForArithmeticGeometry:R09.3`.** AlgebraicModuliForArithmeticGeometry R09.3 (upstream Layer 3: descent of algebraic spaces and polarized descent): étale-local descent of the ample locus in NP.3/ampleness-openness. Import only.

Used by [3.8](#np-3-8) (`NP.3/ampleness-openness`).

**`ComplexComparisonPartII:C3`.** ComplexComparisonPartII (TauCetiRoadmap PR #848) §C3.2d.2 relative\_picard\_algebraicSpace, §C3.2d.4 picard\_brauer\_obstruction and §C3.2e picardTorsionComponent (Pic^τ over a locally Noetherian base for projective flat families with geometrically integral fibres). This roadmap's NP.2 treats arbitrary proper schemes over a field and is compatible with these relative statements; nothing is re-planned.

Used by [2.1](#np-2-1) (`NP.2/picard-scheme`), [2.5](#np-2-5) (`NP.2/tau-component`).

**[JacobianChallenge](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/JacobianChallenge/README.md#layer-a-line-bundles-divisors-picard-group-degree) (`layer-a-line-bundles-divisors-picard-group-degree`).** Import only the degree contract now stated as StableReduction J-A2/JacobianChallenge A for proper pure one-dimensional schemes: χ(L)−χ(O), tensor/field-extension/normalisation laws. Zero-dimensional components contribute zero. Current Tau Ceti already implements Euler degree and the regular integral-curve comparison; never reconstruct these here.

Used by [0.1](#np-0-1) (`NP.0/curve-degree`).

**[JacobianChallenge](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/JacobianChallenge/README.md#layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality) (`layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality`).** Import only: finite-dimensionality of coherent cohomology over a field and Euler characteristics.

Used by [0.1](#np-0-1) (`NP.0/curve-degree`), [1.6](#np-1-6) (`NP.1/big`).

**[JacobianChallenge](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/JacobianChallenge/README.md#layer-c-relative-coherent-cohomology-and-base-change) (`layer-c-relative-coherent-cohomology-and-base-change`).** Import only: coherent higher direct images, flat base change, semicontinuity and local constancy of Euler characteristics in flat proper families.

Used by [0.1](#np-0-1) (`NP.0/curve-degree`), [0.3](#np-0-3) (`NP.0/field-extension-invariance`), [0.5](#np-0-5) (`NP.0/closed-points-suffice`), [1.4](#np-1-4) (`NP.1/finite-dimensionality`), [2.2](#np-2-2) (`NP.2/affinization`), [3.3](#np-3-3) (`NP.3/semiample`).

**[JacobianChallenge](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/JacobianChallenge/README.md#layer-d-the-relative-picard-functor-and-the-jacobian-scheme) (`layer-d-the-relative-picard-functor-and-the-jacobian-scheme`).** Import only: the fppf relative Picard functor and projective Picard representability for projective geometrically integral schemes over a field (the case NP.2/picard-scheme extends).

Used by [2.1](#np-2-1) (`NP.2/picard-scheme`).

**[StableReduction](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/StableReduction/README.md#layer-1-nodes-normalization-and-dual-graphs) (`layer-1-nodes-normalization-and-dual-graphs`).** Import only: dual graphs of nodal curves, which the component graph of NP.4 coarsens.

Used by [4.1](#np-4-1) (`NP.4/component-dual-graph`).

**[StableReduction](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/StableReduction/README.md#layer-2-coherent-curve-theory-duality-and-positivity) (`layer-2-coherent-curve-theory-duality-and-positivity`).** Import only: relative Proj, projective morphisms, global generation and the openness of fibrewise ampleness for schemes.

Used by [3.3](#np-3-3) (`NP.3/semiample`), [3.4](#np-3-4) (`NP.3/semiample-contraction`), [3.8](#np-3-8) (`NP.3/ampleness-openness`).

**[StableReduction](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/StableReduction/README.md#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces) (`layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`).** Import only: intersection multiplicities of vertical divisors on regular two-dimensional proper models over a DVR and the negative-semidefinite matrix of special-fibre components.

Used by [4.5](#np-4-5) (`NP.4/exceptional-negativity`), [4.6](#np-4-6) (`NP.4/zariski-lemma`).

**`AlgebraicModuliForArithmeticGeometry:R09.2`.** Extension request G5: Hilbert algebraic space of proper subschemes of a separated finite-presentation k-scheme, locally of finite presentation, with tangent Hom(I\_C,O\_C) at a closed subscheme. Existing projective Hilbert representability is insufficient for smooth proper nonprojective surfaces. Stacks 99.9.4/99.7.10 give the exact statements.

Used by [4.7](#np-4-7) (`NP.4/negative-curve-descent`).

## Source findings and independent verdicts

The descriptions below are paraphrases. A rejected finding is retained for provenance and must not be propagated as a source error.

### E1: confirmed

**Locator.** CT20, Lemma 2.17, pp. 16–18 (arXiv v3).

**Finding reviewed.** The conclusion asks for a ℚ-Cartier ℚ-divisor M on Y with L ∼\_ℚ f*M, although the morphism of the lemma is f : X → S and no Y occurs.

**Verdict and reason.** The morphism is X→S; the printed Y in the conclusion of Lemma 2.17 is undefined. The proof continues through p. 18.

**Correction or disposition.** M is a ℚ-Cartier ℚ-divisor on S.

**Extent / prior record.** nothing; new.

### E2: confirmed

**Locator.** SCH23, Lemma 1.1, p. 5 (arXiv v3).

**Finding reviewed.** Constancy of Num\_{X/k} is characterised by the existence of an integer d ≥ 0 with the descent property for d-th powers.

**Verdict and reason.** The literal nonnegative bound permits d=0, which would make the criterion hold for every Picard lattice; the real-form curve counterexample separates it.

**Correction or disposition.** d ≥ 1; with d = 0 the property holds for every X.

**Extent / prior record.** a stated result; PAPER-SCHROER-23/E1 (atlas extraction, confirmed by REV-PAPER-SCHROER-23).

### E3: confirmed

**Locator.** SCH23, proof of Lemma 1.1, p. 5 (arXiv v3).

**Finding reviewed.** The proof takes P′ = Pic\_{X′/E} and asserts that R¹pr\_*P′ vanishes by the argument of Lemma 1.4.

**Verdict and reason.** The torsor is a Pic^τ-torsor, and restriction in H¹ is already injective in the five-term sequence. The proposed blanket higher-direct-image vanishing is unnecessary and invalid in the stated inseparable setting.

**Correction or disposition.** Take P′ = Pic^τ\_{X′/E}; the vanishing claim is not needed, since the five-term sequence already makes H¹(k, pr\_*P′) → H¹(E, P′) injective.

**Extent / prior record.** the proof; PAPER-SCHROER-23/E20 (atlas extraction, confirmed).

### E4: confirmed

**Locator.** SCH23, §1, p. 6, paragraph before Proposition 1.2 (arXiv v3).

**Finding reviewed.** Component-preserving morphisms induce maps of dual graphs sending edges to edges.

**Verdict and reason.** Two conjugate meeting components can have the same image component, so an edge can collapse to a vertex. Moreover a general vertex bijection need not reflect adjacency; the field-base-change case is proved separately.

**Correction or disposition.** Edges go to edges or to a single vertex; to edges when the vertex map is bijective.

**Extent / prior record.** nothing; PAPER-SCHROER-23/E28 (atlas extraction, confirmed).

### E5: confirmed

**Locator.** SCH23, Proposition 1.2, p. 6 (arXiv v3).

**Finding reviewed.** For one-dimensional X, Num constant iff the geometric-to-schematic graph map is an isomorphism.

**Verdict and reason.** A disjoint zero-dimensional component changes the component graph without changing Num. Pure one-dimensionality is needed for the stated equivalence.

**Correction or disposition.** Assume every irreducible component of X is one-dimensional.

**Extent / prior record.** a stated result; PAPER-SCHROER-23/E18 (atlas extraction, confirmed).

### E6: confirmed

**Locator.** SCH23, §2, p. 8 (arXiv v3).

**Finding reviewed.** A contraction of a smooth proper surface with h⁰(O) = 1 is birational onto a geometrically normal surface or of fibre type onto a smooth curve.

**Verdict and reason.** The structure morphism to Spec k satisfies the definition of contraction when H⁰(O)=k; the one-dimensional-fibre hypothesis later excludes this case.

**Correction or disposition.** Add the contraction to Spec k.

**Extent / prior record.** nothing; PAPER-SCHROER-23/E23 (atlas extraction, confirmed).

### E7: confirmed

**Locator.** SCH23, Theorem 2.1(ii), p. 8 (arXiv v3).

**Finding reviewed.** Label preservation is said to follow immediately from (i) and the definitions.

**Verdict and reason.** The printed proof leaves label preservation without its field-of-definition argument. The inherited q-versus-q² repair is also invalid for reduced fibre components inside a k-surface; the replacement uses negative-curve Hilbert rigidity and records its missing supplier G5.

**Correction or disposition.** Use the negative-curve descent theorem NP.4/negative-curve-descent to prove k-definition of the fibre components and κ(a)=k, then use ordinary ambient Cartier-divisor base change. The proper Hilbert-space input is G5.

**Extent / prior record.** the proof; PAPER-SCHROER-23/E24 (atlas extraction, confirmed).

### E8: confirmed

**Locator.** SCH23, proof of Theorem 2.1, fibre-type case, p. 9 (arXiv v3).

**Finding reviewed.** Injectivity on the two subcurves C₁+…+C\_{r−1} and C₂+…+C\_r is used to conclude that Galois fixes every component.

**Verdict and reason.** Independence on the two proper subcurves separately does not exclude swapping the omitted end components. Pairwise distinct numerical classes follow from C\_i²−C\_i·C\_j<0. The revised proof uses the stronger rigidity lemma.

**Correction or disposition.** Use (C\_i − C\_j)·C\_i = C\_i² − (C\_i·C\_j) < 0 to separate all classes.

**Extent / prior record.** the proof; PAPER-SCHROER-23/E25 (atlas extraction, confirmed).

### E9: rejected

**Locator.** HW23, proof of Theorem 1.3(2), pp. 33–34 (arXiv v2; published Theorem 6.1(2b)).

**Finding reviewed.** Surjectivity of N¹(𝒳/S) → N¹(X) is used to choose Cartier divisors on 𝒳 whose restrictions equal given divisors on X.

**Verdict and reason.** Rejected: arXiv v2 p. 33 chooses A with A|\_X ≡ A, and p. 34 explicitly asks for L^m ≡ L|\_{X₁} and continues with numerical equivalence. These are the correct numerical lifts, not asserted isomorphic restrictions. The elliptic example distinguishes notions but does not contradict these passages.

**Correction or disposition.** No correction to these cited passages of HW23 is justified: they already use numerical equivalence. Retain the numerical-versus-exact-lifting distinction as an independent clarification.

**Extent / prior record.** the proof; PAPER-HACON-WITASZEK-23/E7 (atlas extraction, confirmed).

### E10: confirmed

**Locator.** SCH23, proof of Lemma 1.4, p. 8 (arXiv v3).

**Finding reviewed.** The displayed Leray comparison is oriented from H²(X,G\_m) to H²(S,h\_*G\_m).

**Verdict and reason.** The spectral-sequence edge originates in E₂^{2,0}; the reverse arrow is its inverse only after establishing the vanishing.

**Correction or disposition.** The Leray edge is H²(S,h\_*G\_m) → H²(X,G\_m); the vanishing makes it an isomorphism.

**Extent / prior record.** the proof; new in independent review.

### E11: confirmed

**Locator.** AHK07, proof of Lemma 1.6(1), p. 4 (arXiv v2).

**Finding reviewed.** The number of additional hyperplane cuts on X is given as dim X−e+2.

**Verdict and reason.** The remaining dimension is dim X−e minus the number of additional cuts, which must equal 2.

**Correction or disposition.** After e cuts pulled back from Y, use dim X−e−2 additional general hyperplanes to leave a surface.

**Extent / prior record.** the proof; new in independent review.

## Routed items and proposed continuations

**Split.** The issue carried four continuations of AlgebraicModuliForArithmeticGeometry in two independent directions. Three (Schröer route 1, Hacon–Witaszek route 9, Bhatt et al. route 12) and the additional source Witaszek 2022 route 6 form one direction, numerical Picard groups and contraction descent, planned here. The fourth (Bhatt et al. route 15, 14 items) is the moduli of stable surfaces in mixed characteristic over ℤ[1/30] (Bhatt et al. Corollary 10.2, Theorem 10.6, Corollary 10.3). It needs the threefold MMP in mixed characteristic, inversion of adjunction, Kollár's hulls and husks and Patakfalvi's projectivity method, which are owned by the unplanned SchemeAndStackFoundationsMixedCharacteristicBirationalGeometry continuation (issue #3361), and it is not a prerequisite of anything planned here.

**Rescope.** Seven routed items (several with multiple descent clauses) state conclusions inside the proofs of mixed-characteristic MMP theorems: Hacon–Witaszek Claim 5.3 (Cartier index preservation along the threefold L-trivial MMP), Claim 5.5(3) (numerical generation in the double MMP), the persistence of N¹-surjectivity after a lifted step and the effective perturbation of the boundary step in the published Theorem 6.1(2a)–(2b), and Bhatt et al. Proposition 2.51 (second part), Theorem 9.15 and Proposition 9.16 (descent clauses). Each needs dlt/plt pairs, flips, the base point free theorem or the cone theorem for threefolds, owned by the birational-geometry continuation of SchemeAndStackFoundations (issue #3361 routes). Planning them here would put MMP theory below the numerical theory the MMP consumes.

**Rescope.** Notions that two unplanned continuations would otherwise plan again: Witaszek 2022 route 5 (SchemeAndStackFoundationsMixedCharacteristicPositivity) lists relative nef, semiample and big, the semiample contraction, the Cascini–Tanaka vertical ℚ-pullback and torsion of numerically trivial bundles over locally finite fields; Schröer route 2 (GenusOneFibrationsAndRationalEllipticSurfaces) lists Zariski's lemma (/222). This roadmap needs each of them and sits below both consumers (the positivity brief imports this roadmap for Pic^τ finiteness).

| Routed item | Disposition | Note |
|---|---|---|
| `PAPER-SCHROER-23/1` | [2.6](#np-2-6) (`NP.2/num-local-system`); [2.5](#np-2-5) (`NP.2/tau-component`); [2.7](#np-2-7) (`NP.2/constant-num`) | numerical local system, its finite-type τ-part and constancy |
| `PAPER-SCHROER-23/213` | [2.1](#np-2-1) (`NP.2/picard-scheme`); [2.5](#np-2-5) (`NP.2/tau-component`); [2.6](#np-2-6) (`NP.2/num-local-system`); [1.3](#np-1-3) (`NP.1/neron-severi-rank`) | Picard scheme, Pic^τ, Num and finite generation for arbitrary proper X over a field |
| `PAPER-SCHROER-23/2` | [2.10](#np-2-10) (`NP.2/positive-power-criterion`) | Lemma 1.1 with d ≥ 1 |
| `PAPER-SCHROER-23/214` | [2.9](#np-2-9) (`NP.2/torsor-torsion`); [2.8](#np-2-8) (`NP.2/picard-norm`) | torsor classes and the norm |
| `PAPER-SCHROER-23/215` | [2.4](#np-2-4) (`NP.2/leray-obstruction`); [2.2](#np-2-2) (`NP.2/affinization`) | Leray obstruction with h\_*G\_m and Br(X^aff) |
| `PAPER-SCHROER-23/8` | [2.4](#np-2-4) (`NP.2/leray-obstruction`); [2.2](#np-2-2) (`NP.2/affinization`) | Leray obstruction with h\_*G\_m and Br(X^aff) |
| `PAPER-SCHROER-23/219` | [2.3](#np-2-3) (`NP.2/finite-algebra-brauer`) | Brauer groups of finite algebras |
| `PAPER-SCHROER-23/183` | [2.11](#np-2-11) (`NP.2/double-lift`) | sheaf-quotient doubling lift |
| `PAPER-SCHROER-23/3` | [4.1](#np-4-1) (`NP.4/component-dual-graph`) | with the corrected edge behaviour |
| `PAPER-SCHROER-23/4` | [4.2](#np-4-2) (`NP.4/curve-criterion`) | with all components one-dimensional |
| `PAPER-SCHROER-23/5` | [3.1](#np-3-1) (`NP.3/contraction`) | contraction |
| `PAPER-SCHROER-23/223` | [3.1](#np-3-1) (`NP.3/contraction`) | Zariski connectedness is imported from SchemeAndStackFoundations §4.9 and exposed as API of NP.3/contraction |
| `PAPER-SCHROER-23/6` | [3.7](#np-3-7) (`NP.3/contraction-descent`) | Theorem 1.3 |
| `PAPER-SCHROER-23/7` | [3.6](#np-3-6) (`NP.3/inseparable-descent`) | purely inseparable descent |
| `PAPER-SCHROER-23/216` | [3.3](#np-3-3) (`NP.3/semiample`); [3.4](#np-3-4) (`NP.3/semiample-contraction`); [3.2](#np-3-2) (`NP.3/rigidity`) | semiample sheaves and projective contractions |
| `PAPER-SCHROER-23/217` | [3.5](#np-3-5) (`NP.3/spreading-out`) | EGA IV 8.8.2 spreading out |
| `PAPER-SCHROER-23/186` | [3.8](#np-3-8) (`NP.3/ampleness-openness`) | Stacks 0D3A/0D3D |
| `PAPER-SCHROER-23/9` | [4.3](#np-4-3) (`NP.4/labelled-graph`) | intersection matrices and labels |
| `PAPER-SCHROER-23/220` | [4.4](#np-4-4) (`NP.4/surface-contraction-trichotomy`) | with the contraction to a point |
| `PAPER-SCHROER-23/221` | [4.5](#np-4-5) (`NP.4/exceptional-negativity`) | Du Val, Mumford, Lipman |
| `PAPER-SCHROER-23/10` | [4.8](#np-4-8) (`NP.4/fibre-graph-descent`) | Theorem 2.1(i), with the E25 repair |
| `PAPER-SCHROER-23/11` | [4.10](#np-4-10) (`NP.4/fibre-label-descent`) | Theorem 2.1(ii), with κ(a) = k |
| `PAPER-SCHROER-23/12` | [4.9](#np-4-9) (`NP.4/reducible-fibre-residue`) | Theorem 2.1(iii) |
| `PAPER-HACON-WITASZEK-23/numerical` | [1.1](#np-1-1) (`NP.1/numerical-group`); [1.2](#np-1-2) (`NP.1/curve-space`); [5.1](#np-5-1) (`NP.5/special-fibre-restriction`) | relative N¹\_ℚ, N¹\_ℝ, N₁, NE |
| `PAPER-HACON-WITASZEK-23/modified-rho` | [5.9](#np-5-9) (`NP.5/ahk-rank`) | Complex projective AHK Lemma 1.6 is planned; the relative positive-characteristic version required by this routed item remains G7. |
| `PAPER-HACON-WITASZEK-23/cone-specialization` | [5.4](#np-5-4) (`NP.5/cone-identification`) | general form of the first step of the proof of (2a) |
| `PAPER-HACON-WITASZEK-23/special-nef-big-transfer` | [5.5](#np-5-5) (`NP.5/nef-big-specialization`) | arbitrary dimension |
| `PAPER-HACON-WITASZEK-23/numerical-lift-repair` | [5.2](#np-5-2) (`NP.5/numerical-representatives`) | Numerical representatives are retained as a clarification; the alleged HW23/E7 error is rejected because the source already uses ≡. |
| `PAPER-HACON-WITASZEK-23/semistable-numerical-descent` | [5.6](#np-5-6) (`NP.5/semiample-trivial-descent`) | general descent step; the application to the Prop 5.4 contraction moves with the MMP (restructure) |
| `PAPER-HACON-WITASZEK-23/index-preservation` | `SchemeAndStackFoundationsMixedCharacteristicBirationalGeometry (restructure proposal 2)` | MMP-internal step; imports NP.1, NP.5 nodes listed in the proposal |
| `PAPER-HACON-WITASZEK-23/n1-generation` | `SchemeAndStackFoundationsMixedCharacteristicBirationalGeometry (restructure proposal 2)` | MMP-internal step; imports NP.1, NP.5 nodes listed in the proposal |
| `PAPER-HACON-WITASZEK-23/n1-persists` | `SchemeAndStackFoundationsMixedCharacteristicBirationalGeometry (restructure proposal 2)` | MMP-internal step; imports NP.1, NP.5 nodes listed in the proposal |
| `PAPER-HACON-WITASZEK-23/numerical-flop-boundary` | `SchemeAndStackFoundationsMixedCharacteristicBirationalGeometry (restructure proposal 2)` | MMP-internal step; imports NP.1, NP.5 nodes listed in the proposal |
| `PAPER-BHATT-ETAL-23/numerical` | [1.1](#np-1-1) (`NP.1/numerical-group`); [1.2](#np-1-2) (`NP.1/curve-space`); [1.5](#np-1-5) (`NP.1/relative-nef`); [1.4](#np-1-4) (`NP.1/finite-dimensionality`) | Remark 2.22 and §2.5 conventions |
| `PAPER-BHATT-ETAL-23/curve-index` | [0.2](#np-0-2) (`NP.0/curve-index`) | Lemma 2.47 / Das–Waldron Lemma 4.1 |
| `PAPER-BHATT-ETAL-23/vertical-descent` | [5.7](#np-5-7) (`NP.5/vertical-descent`) | Cascini–Tanaka Lemma 2.17 |
| `PAPER-BHATT-ETAL-23/extremal-curve` | [5.8](#np-5-8) (`NP.5/extremal-curve`) | Definition 9.30 |
| `PAPER-BHATT-ETAL-23/plt-numerical-descent` | `SchemeAndStackFoundationsMixedCharacteristicBirationalGeometry (restructure proposal 2)` | MMP theorems whose descent clauses apply NP.5/semiample-trivial-descent after the base point free theorem |
| `PAPER-BHATT-ETAL-23/nonq-descent` | `SchemeAndStackFoundationsMixedCharacteristicBirationalGeometry (restructure proposal 2)` | MMP theorems whose descent clauses apply NP.5/semiample-trivial-descent after the base point free theorem |
| `PAPER-BHATT-ETAL-23/nonq-face-descent` | `SchemeAndStackFoundationsMixedCharacteristicBirationalGeometry (restructure proposal 2)` | MMP theorems whose descent clauses apply NP.5/semiample-trivial-descent after the base point free theorem |
| `PAPER-BHATT-ETAL-23/stable-surface` | `AlgebraicModuliForArithmeticGeometryStableSurfaces (restructure proposal 1)` | stable-surface moduli direction, split off |
| `PAPER-BHATT-ETAL-23/stable-functor` | `AlgebraicModuliForArithmeticGeometryStableSurfaces (restructure proposal 1)` | stable-surface moduli direction, split off |
| `PAPER-BHATT-ETAL-23/smooth-closure` | `AlgebraicModuliForArithmeticGeometryStableSurfaces (restructure proposal 1)` | stable-surface moduli direction, split off |
| `PAPER-BHATT-ETAL-23/moduli-algebraic` | `AlgebraicModuliForArithmeticGeometryStableSurfaces (restructure proposal 1)` | stable-surface moduli direction, split off |
| `PAPER-BHATT-ETAL-23/moduli-separated` | `AlgebraicModuliForArithmeticGeometryStableSurfaces (restructure proposal 1)` | stable-surface moduli direction, split off |
| `PAPER-BHATT-ETAL-23/moduli-coarse` | `AlgebraicModuliForArithmeticGeometryStableSurfaces (restructure proposal 1)` | stable-surface moduli direction, split off |
| `PAPER-BHATT-ETAL-23/finitefield-lifting` | `AlgebraicModuliForArithmeticGeometryStableSurfaces (restructure proposal 1)` | stable-surface moduli direction, split off |
| `PAPER-BHATT-ETAL-23/canonical-embedding` | `AlgebraicModuliForArithmeticGeometryStableSurfaces (restructure proposal 1)` | stable-surface moduli direction, split off |
| `PAPER-BHATT-ETAL-23/discriminant-bound` | `AlgebraicModuliForArithmeticGeometryStableSurfaces (restructure proposal 1)` | stable-surface moduli direction, split off |
| `PAPER-BHATT-ETAL-23/stable-limits` | `AlgebraicModuliForArithmeticGeometryStableSurfaces (restructure proposal 1)` | stable-surface moduli direction, split off |
| `PAPER-BHATT-ETAL-23/smooth-closure-proper` | `AlgebraicModuliForArithmeticGeometryStableSurfaces (restructure proposal 1)` | stable-surface moduli direction, split off |
| `PAPER-BHATT-ETAL-23/determinant-positivity` | `AlgebraicModuliForArithmeticGeometryStableSurfaces (restructure proposal 1)` | stable-surface moduli direction, split off |
| `PAPER-BHATT-ETAL-23/smooth-coarse-projective` | `AlgebraicModuliForArithmeticGeometryStableSurfaces (restructure proposal 1)` | stable-surface moduli direction, split off |
| `PAPER-BHATT-ETAL-23/hulls-boundedness` | `AlgebraicModuliForArithmeticGeometryStableSurfaces (restructure proposal 1)` | stable-surface moduli direction, split off |
| `PAPER-WITASZEK-22/picard-scheme-numerical` | [2.5](#np-2-5) (`NP.2/tau-component`); [2.12](#np-2-12) (`NP.2/finite-field-finiteness`) | finite type of the numerically trivial Picard functor, descent to finite fields, finiteness of rational points |

## Upstream coordination

- tauceti:TauCetiRoadmap/AbundanceStatement (PR #545); SchemeAndStackFoundations: SchemeAndStackFoundations (merged) cites AbundanceStatement §§4A–4D (open TauCetiRoadmap PR #545) for the characteristic-zero numerical quotient N¹(X)\_ℝ, the cone NE‾ and Kleiman's criterion on projective varieties over algebraically closed fields. The atlas does not track that roadmap as a stage; this Part II states its arbitrary-field, relative versions with compatibility targets against it rather than re-planning it.
- tauceti:TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry (PR #853); tauceti:TauCetiRoadmap/ComplexComparisonPartII (PR #848): The relative Picard algebraic space, its Brauer obstruction and Pic⁰/Pic^τ over a base (atlas nodes AlgebraicModuliForArithmeticGeometry:A0-extension/picard-*) are placed upstream in ComplexComparisonPartII §§C3.2d–C3.2f, not in the AlgebraicModuli README; atlas citations of A0-extension for them should name those sections.
- tauceti:TauCetiRoadmap/StableReduction; tauceti:TauCetiRoadmap/AlgebraicVectorBundles: Current upstream main was checked in addition to the atlas snapshot. Curve degree is StableReduction J-A2/Jacobian A (and current Tau Ceti Euler degree), tensor/dual/relative Spec belong to AlgebraicVectorBundles. Zariski matrix inequalities already exist in current Tau Ceti Matrix/NegSemidef and NumericalType/IntersectionForm; only the geometric application remains here.
- AlgebraicModuliForArithmeticGeometry:R09.2: G5 is a concrete extension request for proper Hilbert algebraic spaces and their tangent formula. It is not a claim that the current projective Hilbert contract supplies them.
- PAPER-HACON-WITASZEK-23: Independent review rejects the inherited E7 accusation for arXiv v2 pp. 33–34: those passages consistently use numerical equivalence. Correct that extraction/erratum through its owner; no edit to its files is made here.
- tauceti:TauCetiRoadmap/AlgebraicVectorBundles: This current upstream roadmap is absent from the atlas stage registry. The explicit upstreamImports contract on NP.2/affinization cites L1A–L1B; SF.4/stein-factorization is the registered direct prerequisite for its specific construction. Register the upstream layers during atlas refresh; do not invent a pinned-library declaration or plan relative Spec again.

## Source versions and locators

All statements and proof sketches above are in the roadmap’s own words. Pagination is the recorded preprint PDF pagination unless a printed-page/PDF-page distinction is given. Download hashes and access dates are retained in the packet. Restricted texts were not used as proof suppliers.

**[SCH23](https://arxiv.org/pdf/2004.07025v3).** Stefan Schröer, There is no Enriques surface over the integers; arXiv:2004.07025v3 (identical to the author version of 19 July 2022; printed page = PDF page); published Annals of Mathematics 197 (2023), 1–63.

Read locators: §1 (pp. 4–8) in full: Lemma 1.1, Proposition 1.2, Theorem 1.3, Lemma 1.4 and proofs; §2 (pp. 8–9) in full: Theorem 2.1 and proof; §5 opening (pp. 14–15) for the Enriques consumers.

**[KLE05](https://arxiv.org/pdf/math/0504020v1).** Steven L. Kleiman, The Picard scheme; arXiv:math/0504020v1 (PDF page = printed page); published in Fundamental Algebraic Geometry, Math. Surveys Monogr. 123, AMS 2005 (numbering 9.x).

Read locators: Remark 4.18, Theorems 4.18.1–4.18.5, Corollary 4.18.3 (pp. 33–35); Definitions 6.1–6.2, Theorem 6.3 (pp. 52–53); Definitions 6.1–6.2 through Remark 6.22 (pp. 52–60); Theorem 2.5 and Remark 2.11 (pp. 17–21); Proposition 5.19 and proof (p. 47).

**[BMP23](https://arxiv.org/pdf/2012.15801v3).** Bhargav Bhatt, Linquan Ma, Zsolt Patakfalvi, Karl Schwede, Kevin Tucker, Joe Waldron, Jakub Witaszek, Globally +-regular varieties and the minimal model program for threefolds in mixed characteristic; arXiv:2012.15801v3 (pages are PDF pages of v3); published Publ. Math. IHÉS 138 (2023).

Read locators: §2.5 from Lemma 2.21 to Remark 2.23 (pp. 18–19); Lemma 2.47 to Lemma 2.54 (pp. 25–28); Theorem 9.15, Proposition 9.16 and proof (pp. 103–107); Lemmas 9.24–9.26 (pp. 110–112); Definition 9.30 and the following paragraph (pp. 116–117).

**[HW23](https://arxiv.org/pdf/2009.02631v2).** Christopher Hacon, Jakub Witaszek, On the relative minimal model program for fourfolds in positive and mixed characteristic; arXiv:2009.02631v2 (PDF pages; the published Forum Math. Pi 11 (2023) renumbers Theorem 1.3 of §6 as Theorem 6.1).

Read locators: Theorems 1.3–1.4 and the remarks after them (pp. 2–3); §3 use of the AHK Picard rank (p. 12); Lemma 6.1 to Corollary 6.5 and the proof of Theorem 1.3 (pp. 29–34).

**[WIT22](https://arxiv.org/pdf/2002.11915v2).** Jakub Witaszek, Keel's base point free theorem and quotients in mixed characteristic; arXiv:2002.11915v2; published Annals of Mathematics 195 (2022), 655–705.

Read locators: §2 definitions (p. 7); Proposition 5.3 and proof (p. 34); Proposition 6.6 and proof (p. 41); Corollary 6.7 (pp. 42–43).

**[DW22](https://arxiv.org/pdf/1911.04394v3).** Omprokash Das, Joe Waldron, On the log minimal model program for threefolds over imperfect fields of characteristic p > 5; arXiv:1911.04394v3; published J. London Math. Soc. (2022).

Read locators: Lemma 3.6 (p. 10); Lemma 4.1 and proof (pp. 12–13).

**[CT20](https://arxiv.org/pdf/1706.04845v3).** Paolo Cascini, Hiromu Tanaka, Relative semi-ampleness in positive characteristic; arXiv:1706.04845v3; published Proc. London Math. Soc. 121 (2020).

Read locators: Lemma 2.17 and proof (pp. 16–18).

**[AHK07](https://arxiv.org/pdf/math/0605137v2).** Valery Alexeev, Christopher Hacon, Yujiro Kawamata, Termination of (many) 4-dimensional log flips; arXiv:math/0605137v2; published Invent. Math. 168 (2007).

Read locators: Example 1.4 and Lemma 1.6 with proof (pp. 3–4); Definition 2.8 context (p. 7).

**[LIP69](https://www.numdam.org/item/PMIHES_1969__36__195_0.pdf).** Joseph Lipman, Rational singularities, with applications to algebraic surfaces and unique factorization; Publ. Math. IHÉS 36 (1969), 195–279 (Numdam).

Read locators: §13 (pp. 222–223); §14, Lemma (14.1) and its proof (p. 224).

**[EGA-IV3](https://www.numdam.org/item/PMIHES_1966__28__5_0/).** Alexander Grothendieck (with Jean Dieudonné), Éléments de géométrie algébrique IV, troisième partie; Publ. Math. IHÉS 28 (1966), Numdam scan (copy cleared by the maintainer).

Read locators: Théorème (8.8.2) (Numdam PDF p. 27) and (8.10.5).

**[STACKS](https://stacks.math.columbia.edu).** The Stacks project authors, The Stacks project; online, tags read 19 October 2026 (stable tags are the locators).

Read locators: tag 0BEL (Section 33.45) and Lemma 33.45.7 (0BET); Lemma 71.15.3 (0D3A); Lemma 74.13.2 (0D3D); Lemma 35.25.6 (0D2P); Situation 55.9.3 (0C61) and Lemma 55.9.7 (0C66); tag 00PH; Lemma 33.15.5 (0BDG); Proposition 99.9.4 (0CZX) and Remark 99.7.10 (0CZV).

**ATLAS-EXTRACTIONS.** Tau Ceti Atlas workers (reviewed), Reviewed paper extractions of the Tau Ceti Atlas; research/blueprint/papers/PAPER-SCHROER-23, PAPER-HACON-WITASZEK-23, PAPER-BHATT-ETAL-23 and PAPER-WITASZEK-22 result files at this commit; item and source-issue ids are the locators.

Read locators: all items routed to this roadmap (route 1 of SCHROER-23, route 9 of HACON-WITASZEK-23, routes 12 and 15 of BHATT-ETAL-23, route 6 of WITASZEK-22); source issues of SCHROER-23 concerning §§1–2 and HACON-WITASZEK-23/E7.

**[KEE99](https://arxiv.org/pdf/math/9901149v1).** Seán Keel, Basepoint freeness for nef and big line bundles in positive characteristic; Annals of Mathematics 149 (1999), 253–286; arXiv:math/9901149v1; printed page = PDF page + 252.

Read locators: Definition–Lemma 0.0 (printed p. 254, PDF p. 2); Lemma 1.7 (printed p. 262, PDF p. 10); Lemma 2.16 and proof (printed p. 270, PDF p. 18).

**[LMFDB11](https://www.lmfdb.org/EllipticCurve/Q/11/a/2).** The LMFDB collaboration, Elliptic curve 11.a2 (Cremona 11a1); online, read 19 October 2026.

Read locators: Minimal equation, rational Mordell–Weil group, bad-prime data.

The suggested Lean file retains only light definitions and theorems expressible at the pins, with real data bodies. Its comments refer to the numbered targets above; the README also carries targets whose scheme-theoretic carriers are missing at that baseline. Elaboration of the scaffold is not formal verification of the roadmap.
