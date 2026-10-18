import Mathlib.Algebra.Lie.Classical
import Mathlib.Algebra.Lie.UniversalEnveloping
import Mathlib.LinearAlgebra.Matrix.SpecialLinearGroup
import Mathlib.NumberTheory.Padics.RingHoms
import Mathlib.Algebra.MvPolynomial.Basic
import Mathlib.RingTheory.Ideal.Quotient.Defs
import Mathlib.Basic.Real.Basic
import Mathlib.Order.WithBot
import Mathlib.Analysis.Normed.Ring.Units
import Mathlib.Topology.Algebra.Group.Basic
import Mathlib.NumberTheory.Padics.PadicNumbers

/-!
# Locally analytic distributions, Part II: noncommutative distribution algebras — suggested Lean

This file is not the roadmap and is not exhaustive. The roadmap document is definitive; the
statements below suggest Lean forms so that contributors and reviewers converge on names and
signatures. Everything is stated against Mathlib `082e2d3` and Tau Ceti `f790474`. Only
targets whose carriers exist at those commits appear here: light definitions with real bodies,
theorems proved by `sorry`, and `example`s. The distribution algebra `D(G, K)`, its Banach steps,
Fréchet–Stein algebras, completed enveloping algebras, microlocalisation and the duality theorems
are targets of the roadmap document; their names are listed in the closing comment.
-/

open scoped Matrix

noncomputable section

namespace TauCeti

/-! ## ND.0: p-valuations and first congruence subgroups -/

/-- A `p`-valuation on a group (Lazard; Schneider, *p-Adic Lie Groups*, §23): values in
`(1/(p-1), ∞]`, `∞` exactly at `1`, and the three axioms. -/
structure PValuation (p : ℕ) (G : Type*) [Group G] where
  /-- The valuation, with `ω 1 = ⊤`. -/
  ω : G → WithTop ℝ
  map_one : ω 1 = ⊤
  ne_top : ∀ g, g ≠ 1 → ω g ≠ ⊤
  gt : ∀ g, g ≠ 1 → (((1 : ℝ) / ((p : ℝ) - 1) : ℝ) : WithTop ℝ) < ω g
  min_le_mul_inv : ∀ g h, min (ω g) (ω h) ≤ ω (g * h⁻¹)
  add_le_commutator : ∀ g h, ω g + ω h ≤ ω (g⁻¹ * h⁻¹ * g * h)
  map_pow : ∀ g, ω (g ^ p) = ω g + 1

namespace PValuation

variable {p : ℕ} {G : Type*} [Group G]

/-- Saturation: every element of valuation `> p/(p-1)` is a `p`-th power. -/
def IsSaturated (v : TauCeti.PValuation p G) : Prop :=
  ∀ g : G, (((p : ℝ) / ((p : ℝ) - 1) : ℝ) : WithTop ℝ) < v.ω g → ∃ h : G, h ^ p = g

/-- `ω(ghg⁻¹) = ω(h)`. -/
theorem map_conj (v : TauCeti.PValuation p G) (g h : G) : v.ω (g * h * g⁻¹) = v.ω h := by
  sorry

/-- The trivial group carries the `p`-valuation that is `⊤` everywhere. -/
def trivial (p : ℕ) : TauCeti.PValuation p Unit where
  ω _ := ⊤
  map_one := rfl
  ne_top g hg := (hg (Subsingleton.elim g 1)).elim
  gt g hg := (hg (Subsingleton.elim g 1)).elim
  min_le_mul_inv _ _ := le_top
  add_le_commutator _ _ := le_top
  map_pow _ := by simp

/-- `pValuation_trivial`: the trivial group is `p`-valued. -/
example (p : ℕ) : (trivial p).ω () = ⊤ := rfl

/-- `not_pValuation_torsion`: a group with an element of order `p` carries no `p`-valuation. -/
example (p : ℕ) [Fact p.Prime] (v : TauCeti.PValuation p (Multiplicative (ZMod p))) : False := by
  sorry

end PValuation

variable (p : ℕ) [Fact p.Prime]

/-- The first congruence subgroup `G₁ = ker(SL₂(ℤ_p) → SL₂(𝔽_p))`. -/
def firstCongruenceSL2 : Subgroup (Matrix.SpecialLinearGroup (Fin 2) ℤ_[p]) :=
  (Matrix.SpecialLinearGroup.map (PadicInt.toZMod (p := p))).ker

/-- `G = G₁^m`, a subgroup of `Fin m → SL₂(ℤ_p)`. -/
def firstCongruenceProduct (m : ℕ) : Subgroup (Fin m → Matrix.SpecialLinearGroup (Fin 2) ℤ_[p]) :=
  Subgroup.pi Set.univ fun _ => firstCongruenceSL2 p

instance firstCongruenceSL2_normal : (firstCongruenceSL2 p).Normal :=
  MonoidHom.normal_ker _

/-- `g ∈ G₁` iff every entry of `g - 1` lies in `pℤ_p`. -/
theorem mem_firstCongruenceSL2_iff (g : Matrix.SpecialLinearGroup (Fin 2) ℤ_[p]) :
    g ∈ firstCongruenceSL2 p ↔
      ∀ i j, PadicInt.toZMod ((g : Matrix (Fin 2) (Fin 2) ℤ_[p]) i j - (1 : Matrix (Fin 2) (Fin 2) ℤ_[p]) i j) = 0 := by
  sorry

/-- `one_mem_firstCongruenceSL2`. -/
example : (1 : Matrix.SpecialLinearGroup (Fin 2) ℤ_[p]) ∈ firstCongruenceSL2 p :=
  one_mem _

/-- The upper unipotent matrix with off-diagonal entry `a`. -/
def upperUnipotent (a : ℤ_[p]) : Matrix.SpecialLinearGroup (Fin 2) ℤ_[p] :=
  ⟨!![1, a; 0, 1], by simp [Matrix.det_fin_two]⟩

/-- `upperUnipotent_p_mem`. -/
example : upperUnipotent p (p : ℤ_[p]) ∈ firstCongruenceSL2 p := by
  sorry

/-- `upperUnipotent_one_not_mem`. -/
example : upperUnipotent p 1 ∉ firstCongruenceSL2 p := by
  sorry

/-- `neg_one_not_mem`, for `p` odd. -/
example (hp : p ≠ 2) : (-1 : Matrix.SpecialLinearGroup (Fin 2) ℤ_[p]) ∉ firstCongruenceSL2 p := by
  sorry


/-! ## ND.5: the Casimir element of sl₂ and induced parameters -/

section Casimir

variable (K : Type*) [Field K] [CharZero K]

open LieAlgebra.SpecialLinear

attribute [local instance] LieRing.ofAssociativeRing LieAlgebra.ofAssociativeAlgebra

/-- `h = diag(1, -1)` in `sl₂(K)`. -/
def sl2H : sl (Fin 2) K := singleSubSingle 0 1 1
/-- `e = E₁₂` in `sl₂(K)`. -/
def sl2E : sl (Fin 2) K := single 0 1 (by decide) 1
/-- `f = E₂₁` in `sl₂(K)`. -/
def sl2F : sl (Fin 2) K := single 1 0 (by decide) 1

/-- The Casimir element `Δ = ½h² − h + 2ef` of `U(sl₂(K))` (Fu's normalisation; four times the
Killing-form Casimir). -/
def sl2Casimir : UniversalEnvelopingAlgebra K (sl (Fin 2) K) :=
  let ι := UniversalEnvelopingAlgebra.ι K (L := sl (Fin 2) K)
  (1 / 2 : K) • (ι (sl2H K) * ι (sl2H K)) - ι (sl2H K) + (2 : K) • (ι (sl2E K) * ι (sl2F K))

/-- `Δ` is central in `U(sl₂(K))`. -/
theorem sl2Casimir_mem_center (u : UniversalEnvelopingAlgebra K (sl (Fin 2) K)) :
    sl2Casimir K * u = u * sl2Casimir K := by
  sorry

/-- `[e, f] = h` in `sl₂(K)`, the bracket used to rewrite `Δ = ½h² + ef + fe`. -/
example : ⁅sl2E K, sl2F K⁆ = sl2H K := by
  sorry

end Casimir

namespace DistributionAlgebra

variable {p}

/-- The parameter `λ = λ(Δ) ∈ ℤ_p` is induced from an analytic character of the torus of the first
congruence subgroup of `SL₂(ℤ_p)` iff `2λ + 1` is a square in `ℤ_p`. -/
def IsSl2InducedParameter (c : ℤ_[p]) : Prop :=
  ∃ s : ℤ_[p], 2 * c + 1 = s ^ 2

/-- `isInduced_symk`: `λ_k = ½k(k + 2)` is induced (`2λ_k + 1 = (k + 1)²`). -/
example (k : ℕ) (c : ℤ_[p]) (h : 2 * c = (k : ℤ_[p]) * ((k : ℤ_[p]) + 2)) :
    IsSl2InducedParameter c :=
  ⟨(k : ℤ_[p]) + 1, by rw [h]; ring⟩

/-- `isInduced_zero`. -/
example : IsSl2InducedParameter (0 : ℤ_[p]) := ⟨1, by ring⟩

/-- `not_isInduced_three`: at `p = 3`, `λ = 1` is integral but not induced. -/
example [Fact (Nat.Prime 3)] : ¬ IsSl2InducedParameter (1 : ℤ_[3]) := by
  sorry

/-- `centralQuotient_large_zero`: in a complete normed algebra, `Δ − λ` is a unit when
`‖Δ‖ < |λ|`, so the central quotient at such a `λ` is zero. -/
example {K B : Type*} [NontriviallyNormedField K] [NormedRing B] [NormedAlgebra K B]
    [NormOneClass B] [CompleteSpace B] (Δ : B) (c : K) (h : ‖Δ‖ < ‖c‖) :
    IsUnit (Δ - algebraMap K B c) := by
  sorry

end DistributionAlgebra

/-! ## ND.6: algebraic functions on compact open subgroups of SL₂(ℤ_p) -/

namespace BanachIwasawa

variable (K : Type*) [Field K]

/-- The coordinate ring `K[x, y, z, w]/(xw − yz − 1)` of `SL₂` over `K`. -/
abbrev sl2CoordinateRing : Type _ :=
  MvPolynomial (Fin 4) K ⧸ Ideal.span {(MvPolynomial.X 0 * MvPolynomial.X 3 -
    MvPolynomial.X 1 * MvPolynomial.X 2 - 1 : MvPolynomial (Fin 4) K)}

/-- Restriction of polynomials in the matrix entries to a subgroup `G ≤ SL₂(ℤ_p)`, as functions
`G → ℚ_p`. -/
def restrictToSubgroup (G : Subgroup (Matrix.SpecialLinearGroup (Fin 2) ℤ_[p])) :
    MvPolynomial (Fin 4) ℚ_[p] →ₐ[ℚ_[p]] (G → ℚ_[p]) :=
  MvPolynomial.aeval fun i g =>
    let m := ((g : Matrix.SpecialLinearGroup (Fin 2) ℤ_[p]) : Matrix (Fin 2) (Fin 2) ℤ_[p])
    ((![m 0 0, m 0 1, m 1 0, m 1 1] i : ℤ_[p]) : ℚ_[p])

/-- `restrict_injective`: for an open subgroup `G` of `SL₂(ℤ_p)` (one containing a principal
congruence subgroup), the kernel of restriction is
generated by `xw − yz − 1`. -/
theorem ker_restrictToSubgroup (G : Subgroup (Matrix.SpecialLinearGroup (Fin 2) ℤ_[p]))
    (hG : ∃ n : ℕ, (Matrix.SpecialLinearGroup.map (PadicInt.toZModPow (p := p) n)).ker ≤ G) :
    RingHom.ker (restrictToSubgroup p G) = Ideal.span {(MvPolynomial.X 0 * MvPolynomial.X 3 -
      MvPolynomial.X 1 * MvPolynomial.X 2 - 1 : MvPolynomial (Fin 4) ℚ_[p])} := by
  sorry

/-- `finrank_gr_one` and `finrank_gr_two`: the graded dimensions `C(n+3,3) − C(n+1,3) = (n+1)²`. -/
example : Nat.choose 4 3 - Nat.choose 2 3 = 4 := by decide
example : Nat.choose 5 3 - Nat.choose 3 3 = 9 := by decide

/-- The graded dimension formula in general. -/
theorem choose_sub_choose_eq_sq (n : ℕ) : Nat.choose (n + 3) 3 - Nat.choose (n + 1) 3 = (n + 1) ^ 2 := by
  sorry

end BanachIwasawa

end TauCeti
/-! ## Remaining targets

The following targets of the roadmap document are not stated in Lean here, because their carriers
(`D(G, K)`, its Banach steps `D_r(G, K)`, Fréchet–Stein algebras and coadmissible modules, the
completed enveloping algebras `Û(h)_K`, `U_r(g)` and `𝒰(g)`, microlocalisation, the Lazard lattice,
central quotients and Banach representations) do not exist at the pinned commits. Each name is the
proposed declaration name of the roadmap document, where its statement, API and checks are given.

Layer ND.0:
* ND.0/p-valuation (p-valuations, ordered bases and the condition (HYP)): `TauCeti.PValuation.filtration`, `TauCeti.PValuation.IsOrderedBasis`, `TauCeti.PValuation.Hyp`, `pValuation_padicInt`, `not_isSaturated_shift`.
* ND.0/ordered-basis-chart (Ordered bases give global coordinates): `ordered-basis-chart`.
* ND.0/uniform-groups-p-valued (Uniform pro-p groups are p-valued groups satisfying (HYP)): `uniform-groups-p-valued`.
* ND.0/p-valued-analytic-structure (The analytic structure of a p-valued group): `p-valued-analytic-structure`.
* ND.0/lazard-lie-lattice (The Lazard Lie lattice and the Lie algebras g_R, g_K of a uniform group): `TauCeti.Lazard.lieLattice`, `TauCeti.Lazard.lieLattice_free`, `TauCeti.Lazard.lie_lieLattice_le`, `TauCeti.Lazard.liealgR`, `TauCeti.Lazard.lieLattice_powP`, `TauCeti.Lazard.log_lieLattice`, `lieLattice_abelian`, `lieLattice_trivial`, `lieLattice_bracket_scaled`, `lieLattice_sl2_compat`.
* ND.0/first-congruence-sl2 (The first congruence subgroup of SL₂(ℤ_p) and its Lie lattice): `first-congruence-sl2`.

Layer ND.1:
* ND.1/distribution-algebra (The distribution algebra D(G, K) under convolution): `TauCeti.DistributionAlgebra.convolution_apply`, `TauCeti.DistributionAlgebra.dirac`, `TauCeti.DistributionAlgebra.dirac_mul_dirac`, `TauCeti.DistributionAlgebra.continuous_mul`, `TauCeti.DistributionAlgebra.dense_span_dirac`, `TauCeti.DistributionAlgebra.comm_iff`, `dirac_mul_dirac_comm_iff`, `distributionAlgebra_trivial`, `distributionAlgebra_finite`, `convolution_order`.
* ND.1/lie-algebra-in-distributions (The enveloping algebra inside D(G, K)): `TauCeti.DistributionAlgebra.ofLie`, `TauCeti.DistributionAlgebra.ofLie_lie`, `TauCeti.DistributionAlgebra.envelopingHom`, `TauCeti.DistributionAlgebra.envelopingHom_injective`, `TauCeti.DistributionAlgebra.ofLie_eq_lim`, `TauCeti.DistributionAlgebra.dirac_conj_ofLie`, `TauCeti.DistributionAlgebra.map_ofLie`, `ofLie_padicInt`, `ofLie_zero`, `ofLie_sl2_commutator`, `ofLie_not_dirac`.
* ND.1/iwasawa-to-distributions (The rational Iwasawa algebra K[[G]] inside D(G, K)): `TauCeti.DistributionAlgebra.ofMeasure`, `TauCeti.DistributionAlgebra.ofMeasure_injective`, `TauCeti.DistributionAlgebra.ofMeasure_mul`, `TauCeti.DistributionAlgebra.coeff`, `TauCeti.DistributionAlgebra.hasSum_coeff`, `TauCeti.DistributionAlgebra.coeff_eq_mahler`, `TauCeti.DistributionAlgebra.mem_range_ofMeasure_iff`, `coeff_dirac_generator`, `ofMeasure_trivial_group`, `ofMeasure_padicInt_compat`, `log_not_bounded_coeff`.
* ND.1/open-subgroup-decomposition (Finite free decomposition over an open subgroup): `open-subgroup-decomposition`.
* ND.1/central-enveloping-distributions (The centre of U(g) is central in D(G, K)): `central-enveloping-distributions`.

Layer ND.2:
* ND.2/frechet-stein-algebra (Fréchet–Stein algebras): `TauCeti.FrechetStein.banachCompletion`, `TauCeti.FrechetStein.IsFrechetStein`, `TauCeti.FrechetStein.limEquiv`, `TauCeti.FrechetStein.of_cofinal`, `TauCeti.FrechetStein.isNoetherian_of_banach`, `frechetStein_banach_field`, `frechetStein_entire`, `frechetStein_distributions_padicInt`, `not_frechetStein_formalPowerSeries`.
* ND.2/coadmissible-module (Coherent sheaves and coadmissible modules): `TauCeti.FrechetStein.CoherentSheaf`, `TauCeti.FrechetStein.CoherentSheaf.Γ`, `TauCeti.FrechetStein.IsCoadmissible`, `TauCeti.FrechetStein.isCoadmissible_iff_of_cofinal`, `TauCeti.FrechetStein.canonicalTopology`, `TauCeti.FrechetStein.isCoadmissible_self`, `isCoadmissible_zero`, `isCoadmissible_banach`, `isCoadmissible_entire_quotient`, `not_isCoadmissible_direct_sum`.
* ND.2/coadmissible-theorems (Theorems A and B and the abelian category of coadmissible modules): `coadmissible-theorems`.
* ND.2/banach-steps (The norms ‖·‖_r and the Banach steps D_r(G, K)): `TauCeti.DistributionAlgebra.normR`, `TauCeti.DistributionAlgebra.normR_mul_le`, `TauCeti.DistributionAlgebra.normR_dirac`, `TauCeti.DistributionAlgebra.normR_indep`, `TauCeti.DistributionAlgebra.Dr`, `TauCeti.DistributionAlgebra.mem_Dr_iff`, `TauCeti.DistributionAlgebra.DltR`, `TauCeti.DistributionAlgebra.Dr_transition`, `TauCeti.DistributionAlgebra.lim_Dr`, `normR_b_pow`, `Dr_trivial`, `Dr_ne_DltR`, `Dr_padicInt_compat`, `normR_one_not_finite`.
* ND.2/banach-step-structure (Graded rings, multiplicativity and noetherianity of D_r(G, K)): `banach-step-structure`.
* ND.2/frechet-stein-distribution (D(G, K) is a Fréchet–Stein algebra): `frechet-stein-distribution`.
* ND.2/faithful-flatness (Faithful flatness of D(G, K) over the Iwasawa algebra): `faithful-flatness`.

Layer ND.3:
* ND.3/completed-enveloping-algebra (The p-adically completed enveloping algebra Û(h)_K): `TauCeti.CompletedEnveloping.completion`, `TauCeti.CompletedEnveloping.deformation`, `TauCeti.CompletedEnveloping.hasSum_pbw`, `TauCeti.CompletedEnveloping.isNoetherianRing`, `TauCeti.CompletedEnveloping.gr_equiv`, `TauCeti.CompletedEnveloping.lift`, `TauCeti.CompletedEnveloping.baseChange`, `TauCeti.CompletedEnveloping.ofEnveloping_injective`, `completion_abelian_rank_one`, `completion_zero`, `completion_sl2_casimir`, `completion_depends_on_lattice`.
* ND.3/radius-enveloping-closure (The closure U_r(g, K) of U(g) in D_r(G, K)): `TauCeti.DistributionAlgebra.Ur`, `TauCeti.DistributionAlgebra.log_mem_Ur`, `TauCeti.DistributionAlgebra.conj_Ur`, `TauCeti.DistributionAlgebra.Ur_transition`, `TauCeti.DistributionAlgebra.Ur_isClosed`, `Ur_trivial`, `log_norm_r1`, `Ur_ne_Dr`, `Ur_compat_enveloping`.
* ND.3/frommer-theorem (Frommer's description of D_r(G, K) over U_r(g, K)): `frommer-theorem`.
* ND.3/crossed-product-radius (D_{r_n}(G, ℚ_p) as a crossed product of U_{r_n}(g) by G/G^{p^n}): `crossed-product-radius`.
* ND.3/arens-michael-envelope (The Arens–Michael envelope 𝒰(g) and its coadmissible modules): `TauCeti.CompletedEnveloping.radiusCompletion`, `TauCeti.CompletedEnveloping.arensMichael`, `TauCeti.CompletedEnveloping.arensMichael_frechetStein`, `TauCeti.CompletedEnveloping.arensMichael_dual_germs`, `TauCeti.CompletedEnveloping.arensMichael_cofinal`, `TauCeti.CompletedEnveloping.flat_arensMichael`, `TauCeti.CompletedEnveloping.completeModule`, `TauCeti.CompletedEnveloping.IsAdmissible`, `arensMichael_abelian`, `arensMichael_zero`, `arensMichael_pairing`, `completeModule_orientation`.

Layer ND.4:
* ND.4/microlocalisation (Algebraic microlocalisation of complete filtered rings): `TauCeti.Microlocalization.oreSetOfSymbols`, `TauCeti.Microlocalization.microlocalization`, `TauCeti.Microlocalization.flat`, `TauCeti.Microlocalization.tensor_equiv`, `TauCeti.Microlocalization.eq_zero_iff`, `TauCeti.Microlocalization.lift`, `microlocalization_trivial_T`, `microlocalization_commutative`, `microlocalization_powerSeries`, `microlocalization_kills_torsion`.
* ND.4/m-adic-filtration (Lazard's m-adic filtration of the Iwasawa algebra of a uniform group): `m-adic-filtration`.
* ND.4/microlocal-ore-set (The microlocal Ore set S_0 = ⋃_a (p^a + m^{a+1})): `TauCeti.IwasawaMicrolocal.oreSet`, `TauCeti.IwasawaMicrolocal.mem_oreSet_iff`, `TauCeti.IwasawaMicrolocal.zero_not_mem_oreSet`, `TauCeti.IwasawaMicrolocal.oreSet_conj`, `p_mem_oreSet`, `oreSet_trivial_group`, `b_not_mem_oreSet`, `zero_mem_ramified`.
* ND.4/lazard-microlocalisation (The microlocalisation of R[[G]] is the completed enveloping algebra): `lazard-microlocalisation`.
* ND.4/d-one-over-p (The Banach step D_{1/p}(G, K) is the completed enveloping algebra): `d-one-over-p`.
* ND.4/microlocal-coefficient-extension (Microlocalisation over a ramified coefficient field): `microlocal-coefficient-extension`.
* ND.4/microlocal-module (Microlocalisation of finitely generated Iwasawa modules): `TauCeti.IwasawaMicrolocal.microlocalModule`, `TauCeti.IwasawaMicrolocal.microlocalModule_exact`, `TauCeti.IwasawaMicrolocal.microlocalModule_eq_zero_iff`, `TauCeti.IwasawaMicrolocal.microlocalModule_self`, `microlocalModule_trivial`, `microlocalModule_zero`, `microlocalModule_kills_artin`, `microlocalModule_not_faithful_vs_distributions`.
* ND.4/lie-modules (Lie modules: semisimplicity and the equivalence with finite-dimensional g-modules): `lie-modules`.
* ND.4/lie-module-of-representation (The Lie module attached to a finite-dimensional representation): `TauCeti.IwasawaMicrolocal.lieModule`, `TauCeti.IwasawaMicrolocal.lieModule_indep_lattice`, `TauCeti.IwasawaMicrolocal.lieModule_group_apply`, `TauCeti.IwasawaMicrolocal.lieModule_irreducible`, `TauCeti.IwasawaMicrolocal.lieModule_map`, `lieModule_trivial`, `lieModule_standard_sl2`, `lieModule_compat_restriction`, `artin_not_lieModule`.
* ND.4/isotypic-comparison (Microlocalisation preserves W-isotypic quotients): `isotypic-comparison`.

Layer ND.5:
* ND.5/infinitesimal-character-quotients (Central specialisations of distribution and enveloping algebras): `TauCeti.DistributionAlgebra.centralIdeal_isClosed`, `TauCeti.DistributionAlgebra.eigenspace`, `TauCeti.DistributionAlgebra.centralQuotientR`, `casimir_acts_symk`, `centralQuotient_trivial_character`, `casimir_killing_compat`.
* ND.5/induced-infinitesimal-characters (Induced infinitesimal characters): `TauCeti.DistributionAlgebra.IsInducedCharacter`, `TauCeti.DistributionAlgebra.isInduced_sl2_iff`, `TauCeti.DistributionAlgebra.isInduced_pi`, `isInduced_valuation_only_if`.
* ND.5/central-strong-duality (Strong duality after infinitesimal specialisation): `central-strong-duality`.
* ND.5/principal-series-eigenfunction (The locally analytic principal series and a nowhere-vanishing eigenfunction): `TauCeti.DistributionAlgebra.principalSeries`, `TauCeti.DistributionAlgebra.principalSeries_eigen`, `TauCeti.DistributionAlgebra.principalSeries_equiv`, `TauCeti.DistributionAlgebra.nonvanishingEigenfunction`, `TauCeti.DistributionAlgebra.smul_locallyConstant_mem_eigenspace`, `principalSeries_trivial`, `principalSeries_sl2_value`, `principalSeries_nonvanishing`, `one_not_mem_principalSeries`.
* ND.5/eigenspace-density-injectivity (Density of eigenfunctions and injectivity into D(G, ℚ_p)_λ): `eigenspace-density-injectivity`.
* ND.5/central-projective-limit (Central specialisation commutes with the Banach steps): `central-projective-limit`.
* ND.5/radius-central-domain (Central quotients D^λ_r(G_1^m, ℚ_p) are domains for integral λ): `radius-central-domain`.
* ND.5/small-radius-central (Small radii: logarithmic coordinates and central quotients): `small-radius-central`.
* ND.5/crossed-product-ext-comparison (Ext and grade over a finite crossed product): `crossed-product-ext-comparison`.
* ND.5/central-radius-normal-form (Topological PBW normal form of U^λ_r(g) and its injection into Û(g)_λ): `central-radius-normal-form`.
* ND.5/fu-direct-injectivity (Injectivity of central specialisation for induced characters (direct route)): `fu-direct-injectivity`.
* ND.5/integral-casimir-roots (Integral Casimir parameters come from integral highest weights after a finite extension): `integral-casimir-roots`.
* ND.5/affinoid-verma-faithfulness (Affinoid Verma modules are faithful over Iwasawa algebras): `affinoid-verma-faithfulness`.
* ND.5/central-injectivity-theorem (Injectivity of central specialisation for every integral parameter): `central-injectivity-theorem`.

Layer ND.6:
* ND.6/banach-iwasawa-duality (Admissible Banach representations and finitely generated Iwasawa modules): `banach-iwasawa-duality`.
* ND.6/algebraic-matrix-coefficients (Algebraic functions on a compact open subgroup of SL₂(ℤ_p)): `TauCeti.BanachIwasawa.algebraicFunctions`, `TauCeti.BanachIwasawa.degreeFiltration`, `TauCeti.BanachIwasawa.algebraicFunctions_le_locallyAnalytic`, `finrank_gr_zero`, `restrict_not_injective_finite`.
* ND.6/algebraic-peter-weyl (The algebraic Peter–Weyl theorem on a compact open subgroup of SL₂): `algebraic-peter-weyl`.

-/
