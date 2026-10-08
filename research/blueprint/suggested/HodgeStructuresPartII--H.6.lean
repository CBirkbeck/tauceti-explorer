import Mathlib.Analysis.Normed.Algebra.MatrixExponential
import Mathlib.Analysis.Complex.Trigonometric
import Mathlib.Analysis.Analytic.Basic
import Mathlib.Analysis.Calculus.Deriv.Basic
import Mathlib.LinearAlgebra.Matrix.ToLin
import Mathlib.LinearAlgebra.Dimension.Finrank
import Mathlib.LinearAlgebra.Quotient.Basic
import Mathlib.Algebra.DirectSum.Basic
import Mathlib.RingTheory.Nilpotent.Exp
import Mathlib.Analysis.SpecialFunctions.Pow.Real

/-!
This file is not the roadmap and is not exhaustive. The roadmap document
research/blueprint/readmes/HodgeStructuresPartII--H.6.md is definitive. These
statements suggest Lean forms so contributors and reviewers converge on names
and signatures. They are prototypes, not implementations; proofs use `sorry`.

The file imports Mathlib only: the shared build has no compiled
`TauCeti.Geometry.Hodge` modules, so the pinned Tau Ceti declarations the
packet cites (`TauCeti.Hodge.MixedHodgeStructure`, `PeriodDomain.Point`,
`Polarization.hodgeForm`, …) are named in docstrings and not imported.

Every statement below is meant to be true as written. There are three kinds.

* Statements of linear algebra and of calculus in a frame, about matrices,
  flags of subspaces and analytic functions, with all their hypotheses.
* The packet's own definitions (`SemistableLogModel`, `logGaussManin`,
  `NilpotentOrbit`, `untwistedPeriodMap`, `negativeLieCorrection`) in local
  coordinates, with every API item and unit test of the packet.
* Statements about objects that other layers own. Those objects are the
  stand-ins of the section "Imported interfaces": a type or a function whose
  body is `sorry`, with a docstring naming the owner. A theorem about a
  stand-in asserts a relation between such functions; it is typed and not
  refutable, and it claims nothing until the owner's definition replaces the
  stand-in. No condition is a `Prop`-valued placeholder.

What a statement leaves out is said in its docstring. Elaboration of this
file discharges no gap of the packet.
-/

noncomputable section
open scoped BigOperators Matrix Matrix.Norms.Operator
open Set Filter Topology
namespace TauCeti.Hodge.Degeneration

abbrev Vec (d : ℕ) := Fin d → ℂ
abbrev Mat (d : ℕ) := Matrix (Fin d) (Fin d) ℂ
/-- A decreasing filtration of `ℂ^d` in coordinates, indexed by all integers. -/
abbrev Flag (d : ℕ) := ℤ → Submodule ℂ (Vec d)

-- Private notation adapters, not proposed roadmap-owned definitions.
private def act {d : ℕ} (A : Mat d) (F : Flag d) : Flag d :=
  fun p => (F p).map (Matrix.toLin' A)
private def twist {n d : ℕ} (L : Fin n → Mat d) (z : Fin n → ℂ) : Mat d :=
  NormedSpace.exp (∑ i, z i • L i)
private def upper {n : ℕ} (Y : ℝ) : Set (Fin n → ℂ) :=
  {z | ∀ i, Y < (z i).im}
/-- The complex conjugate of a subspace of `ℂ^d` for the standard real structure. -/
private def conjSub {d : ℕ} (S : Submodule ℂ (Vec d)) : Submodule ℂ (Vec d) where
  carrier := {v | star v ∈ S}
  add_mem' := by
    intro a b ha hb
    simpa using S.add_mem ha hb
  zero_mem' := by simp
  smul_mem' := by
    intro c v hv
    simpa using S.smul_mem (star c) hv
private def jordan : Mat 2 := !![0,1;0,0]

/-! ## Imported interfaces

Nothing in this section is planned by H.6. Each declaration stands in for an
object another layer or library owns; the owner's definition governs. -/

/-- Stand-in for the fixed data `(V, Q, h)` of `TauCeti.Hodge.PeriodDomain.Point`
in coordinates: a lattice of rank `d`, a weight, a polarization form and Hodge
numbers. -/
def PolarizedDatum (d : ℕ) : Type := sorry
/-- The weight `k`. -/
def PolarizedDatum.weight {d : ℕ} (P : PolarizedDatum d) : ℤ := sorry
/-- The period domain `D` as a set of flags: the image of the native period
points in the compact dual (HodgeStructuresPartII H.3, point-compact-dual-map
and ambient-domain-open). -/
def PolarizedDatum.domain {d : ℕ} (P : PolarizedDatum d) : Set (Flag d) := sorry
/-- The Siegel sets of the period domain for the canonical maximal compact
subgroup (AdelicAlgebraicGroups AA.3, real-siegel-set), as sets of flags. -/
def PolarizedDatum.siegelSets {d : ℕ} (P : PolarizedDatum d) : Set (Set (Flag d)) := sorry

/-- Stand-in for LefschetzPencilsAndVanishingCycles LPV.1, monodromy-filtration:
the monodromy filtration of a nilpotent matrix, centered at zero. Its value on
a matrix that is not nilpotent is not used. -/
def monodromyFiltration {d : ℕ} (N : Mat d) : ℤ → Submodule ℂ (Vec d) := sorry

/-- Stand-in (ShimuraData D3, polarized-integral-variation; H.3,
marked-period-map): an integral polarized variation of rank `d` on
`(Δ*)^n × Δ^m` with a flat marking of its lattice. -/
def IntegralVariation (n m d : ℕ) : Type := sorry
/-- The monodromy of the positive loop around the `i`-th coordinate, in the marking. -/
def IntegralVariation.monodromy {n m d : ℕ} (V : IntegralVariation n m d) :
    Fin n → Mat d := sorry

/-- Stand-in: an integral polarized variation on `(Δ*)^n × Δ^m` whose local
monodromies are unipotent, with a flat marking (the output of
`unipotentNormalization`). -/
def UnipotentVariation (n m d : ℕ) : Type := sorry
namespace UnipotentVariation
variable {n m d : ℕ}
/-- The lattice, weight, polarization and Hodge numbers of the variation. -/
def datum (V : UnipotentVariation n m d) : PolarizedDatum d := sorry
/-- The commuting nilpotent monodromy logarithms `L_i = log T_i`. -/
def log (V : UnipotentVariation n m d) : Fin n → Mat d := sorry
/-- The lifted period map `Φ(z, w)` on `ℍ^n × Δ^m` (H.3, period-map-holomorphic). -/
def periodLift (V : UnipotentVariation n m d) : (Fin n → ℂ) → (Fin m → ℂ) → Flag d := sorry
/-- The limiting flag `F∞(w)`, the value at `q = 0` of the extended untwisted map. -/
def limitFlag (V : UnipotentVariation n m d) : (Fin m → ℂ) → Flag d := sorry
/-- The centered negative-Lie coefficient `v(q, w)` of `negativeLieCorrection`,
for the chart based at `F∞(w)`. -/
def correctionLog (V : UnipotentVariation n m d) : (Fin n → ℂ) → (Fin m → ℂ) → Mat d := sorry
/-- The Hodge form at `Φ(z, w)`: the native `Polarization.hodgeForm` in the marking,
conjugate-linear in the first variable. -/
def hodgeInner (V : UnipotentVariation n m d) :
    (Fin n → ℂ) → (Fin m → ℂ) → Vec d → Vec d → ℂ := sorry
/-- The squared Hodge norm, the real diagonal of `hodgeInner`. -/
def hodgeNormSq (V : UnipotentVariation n m d) (z : Fin n → ℂ) (w : Fin m → ℂ)
    (u : Vec d) : ℝ := (V.hodgeInner z w u u).re
/-- The induced variation on the `r`-th exterior power, in the basis of
`r`-element subsets (requested from HodgeStructuresPartII H.2). -/
def exteriorPower (V : UnipotentVariation n m d) (r : ℕ) :
    UnipotentVariation n m (d.choose r) := sorry
end UnipotentVariation
/-- The coordinates of `u_1 ∧ ⋯ ∧ u_r` in the basis of `r`-element subsets. -/
def exteriorCoordinates (d r : ℕ) : (Fin r → Vec d) → Vec (d.choose r) := sorry

/-- Stand-in (ComplexComparisonPartII C0, C3, C5; CrystallineCohomology CR.5): a
proper reduced semistable analytic family of relative dimension `d` over a disc
containing no other singular fibre, with its log structures. -/
def SemistableFamily (d : ℕ) : Type := sorry
namespace SemistableFamily
variable {d : ℕ}
/-- The radius of the disc. -/
def radius (X : SemistableFamily d) : ℝ := sorry
/-- The dimension of the degree-`m` log de Rham hypercohomology of the log fibre
at `s`: ordinary de Rham cohomology for `s ≠ 0`, the special log-point
cohomology at `0`. -/
def fibreRank (X : SemistableFamily d) (m : ℕ) (s : ℂ) : ℕ := sorry
/-- The rank of `E^m = R^m f_* DR_rel`. -/
def rank (X : SemistableFamily d) (m : ℕ) : ℕ := X.fibreRank m 0
/-- The residue at `0` of the logarithmic Gauss–Manin connection on `E^m`, in a
logarithmic frame. -/
def residue (X : SemistableFamily d) (m : ℕ) : Mat (X.rank m) := sorry
/-- The connecting endomorphism `A_0` of the special wedge triangle on the
special log-point cohomology, in a basis. -/
def specialBoundary (X : SemistableFamily d) (m : ℕ) : Mat (X.rank m) := sorry
/-- The fibre identification `E^m|_0 ≃ H^m(DR_log(X_0 / log point))` in the two bases. -/
def fibreComparison (X : SemistableFamily d) (m : ℕ) : (Mat (X.rank m))ˣ := sorry
/-- The monodromy of the positive loop on the degree-`m` cohomology of a marked
nearby fibre. -/
def monodromy (X : SemistableFamily d) (m : ℕ) : Mat (X.rank m) := sorry
/-- The action on the special log-point cohomology of a finite group acting on
the family over the log disc. -/
def specialAction (X : SemistableFamily d) (m : ℕ) (H : Type) [Group H] :
    H →* (Mat (X.rank m))ˣ := sorry
end SemistableFamily

/-! ## Geometric logarithmic specialization -/

/-- The local normal form of a `SemistableLogModel`: the number `r ≥ 1` of
divisor coordinates among `d` coordinates and the radius of the base disc.
Left out: the global smooth total space, properness, the atlas and the log
structures (gap G1); `SemistableFamily` stands in for them. -/
structure SemistableLogModel (d : ℕ) where
  divisorCoordinates : Fin (d + 1)
  nonempty : 0 < divisorCoordinates.val
  radius : ℝ
  radius_pos : 0 < radius

def SemistableLogModel.localMap {d : ℕ} (M : SemistableLogModel d)
    (x : Vec d) : ℂ :=
  ∏ i : Fin d with i.val < M.divisorCoordinates.val, x i

lemma SemistableLogModel.localMap_equation {d : ℕ} (M : SemistableLogModel d)
    (x : Vec d) : M.localMap x =
      ∏ i : Fin d with i.val < M.divisorCoordinates.val, x i := by
  sorry

lemma SemistableLogModel.ext {d : ℕ} (M M' : SemistableLogModel d)
    (hr : M.divisorCoordinates = M'.divisorCoordinates)
    (hρ : M.radius = M'.radius) : M = M' := by
  sorry

def SemistableLogModel.restrict {d : ℕ} (M : SemistableLogModel d)
    (ρ : ℝ) (hρ : 0 < ρ) (_hle : ρ ≤ M.radius) : SemistableLogModel d :=
  { M with radius := ρ, radius_pos := hρ }

lemma SemistableLogModel.restrict_comp {d : ℕ} (M : SemistableLogModel d)
    (ρ₁ ρ₂ : ℝ) (h₁ : 0 < ρ₁) (h₂ : 0 < ρ₂)
    (h₁M : ρ₁ ≤ M.radius) (h₂₁ : ρ₂ ≤ ρ₁) :
    (M.restrict ρ₁ h₁ h₁M).restrict ρ₂ h₂ h₂₁ =
      M.restrict ρ₂ h₂ (h₂₁.trans h₁M) := by
  sorry

/-- The class of `dlog T = Σ_{i ≤ r} dlog x_i` in the frame `dlog x_i (i ≤ r)`,
`dx_j (j > r)` of absolute log one-forms. -/
private def SemistableLogModel.dlogBase {d : ℕ} (M : SemistableLogModel d) : Vec d :=
  fun i => if i.val < M.divisorCoordinates.val then 1 else 0

private def smoothChart : SemistableLogModel 2 :=
  ⟨1, by decide, 1, by norm_num⟩
private def nodalChart : SemistableLogModel 2 :=
  ⟨2, by decide, 1, by norm_num⟩

-- SemistableLogModel_test_smooth
example (a b : ℂ) : smoothChart.localMap ![a,b] = a := by
  sorry
-- SemistableLogModel_test_node
example (a b : ℂ) : nodalChart.localMap ![a,b] = a * b := by
  sorry
-- SemistableLogModel_test_not_sum
example : nodalChart.localMap ![1,1] ≠ (2 : ℂ) := by
  sorry

/-- Chart form in degree one, at a point: relative log one-forms are the
quotient of the absolute ones by `dlog T`, of dimension `d − 1`. Left out:
analytic sheafification, exterior powers and the differential. -/
theorem relativeLogForms {d : ℕ} (M : SemistableLogModel d) :
    Module.finrank ℂ ((Vec d) ⧸ Submodule.span ℂ {M.dlogBase}) = d - 1 := by
  sorry

/-- Chart form in degree one, at a point, of the exact sequence
`0 → DR_rel[−1] → DR_abs → DR_rel → 0`: the kernel of the quotient map is the
image of the wedge with `dlog T`. Left out: the sequence of complexes, its
signs and the derived pushforward. -/
theorem wedgeDlogTriangle {d : ℕ} (M : SemistableLogModel d) :
    LinearMap.ker (Submodule.span ℂ {M.dlogBase}).mkQ =
      LinearMap.range (LinearMap.toSpanSingleton ℂ (Vec d) M.dlogBase) := by
  sorry

/-- The fibre dimension of log de Rham hypercohomology is constant on the
disc, which is the numerical content of local freeness with base change.
Left out: the sheaves `E^m` themselves and the comparison maps. -/
theorem logCohomologyBaseChange {d : ℕ} (X : SemistableFamily d) (m : ℕ)
    (s : ℂ) (hs : ‖s‖ < X.radius) : X.fibreRank m s = X.fibreRank m 0 := by
  sorry

/-- The logarithmic Gauss–Manin connection in a logarithmic frame:
`∇v = dv + A(q) v dq/q`, evaluated on the vector field `d/dq`. -/
def logGaussManin {d : ℕ} (A : ℂ → Mat d) (q : ℂ) (v dv : Vec d) : Vec d :=
  dv + q⁻¹ • (A q).mulVec v

lemma logGaussManin.apply {d : ℕ} (A : ℂ → Mat d) (q : ℂ) (v dv : Vec d) :
    logGaussManin A q v dv = dv + q⁻¹ • (A q).mulVec v := by
  sorry
lemma logGaussManin.add {d : ℕ} (A : ℂ → Mat d) (q : ℂ)
    (u v du dv : Vec d) :
    logGaussManin A q (u + v) (du + dv) =
      logGaussManin A q u du + logGaussManin A q v dv := by
  sorry
lemma logGaussManin.leibniz {d : ℕ} (A : ℂ → Mat d) (q f df : ℂ)
    (v dv : Vec d) :
    logGaussManin A q (f • v) (df • v + f • dv) =
      df • v + f • logGaussManin A q v dv := by
  sorry
lemma logGaussManin.residue {d : ℕ} (A : ℂ → Mat d)
    (hA : ContinuousAt A 0) (v : Vec d) :
    Tendsto (fun q => q • logGaussManin A q v 0) (𝓝[≠] 0)
      (𝓝 ((A 0).mulVec v)) := by
  sorry
lemma logGaussManin.horizontalMap {d e : ℕ} (A : ℂ → Mat d) (B : ℂ → Mat e)
    (P : Matrix (Fin e) (Fin d) ℂ) (hP : ∀ q, P * A q = B q * P)
    (q : ℂ) (v dv : Vec d) :
    P.mulVec (logGaussManin A q v dv) =
      logGaussManin B q (P.mulVec v) (P.mulVec dv) := by
  sorry
lemma logGaussManin.ramified {d : ℕ} (A : ℂ → Mat d) (e : ℕ) (he : 0 < e)
    (t : ℂ) (ht : t ≠ 0) (v dv : Vec d) :
    logGaussManin (fun s => (e : ℂ) • A (s ^ e)) t v
      (((e : ℂ) * t ^ (e - 1)) • dv) =
      ((e : ℂ) * t ^ (e - 1)) • logGaussManin A (t ^ e) v dv := by
  sorry

-- logGaussManin_test_zero
example {d : ℕ} (q : ℂ) (v dv : Vec d) :
    logGaussManin (fun _ => 0) q v dv = dv := by
  sorry
-- logGaussManin_test_jordan
example : logGaussManin (fun _ => jordan) 2 ![0,1] 0 = ![1/2,0] := by
  sorry
-- logGaussManin_test_leibniz
example (q : ℂ) : logGaussManin (fun _ => (0 : Mat 1)) q ![q] ![1] = ![1] := by
  sorry

/-- The fibre identification carries the residue to the special boundary
operator, and the latter is nilpotent. -/
theorem specialResidue {d : ℕ} (X : SemistableFamily d) (m : ℕ) :
    (X.fibreComparison m : Mat (X.rank m)) * X.residue m =
        X.specialBoundary m * (X.fibreComparison m : Mat (X.rank m)) ∧
      IsNilpotent (X.specialBoundary m) := by
  sorry

/-- The monodromy of the positive loop is conjugate to `exp(−2πi A_0)`. Left
out: that the conjugating matrix is the nearby-cycle comparison. -/
theorem semistableBetti {d : ℕ} (X : SemistableFamily d) (m : ℕ) :
    ∃ P : (Mat (X.rank m))ˣ, X.monodromy m =
      (P : Mat (X.rank m)) *
        NormedSpace.exp ((-(2 * Real.pi : ℂ) * Complex.I) • X.specialBoundary m) *
        (↑P⁻¹ : Mat (X.rank m)) := by
  sorry

/-- The idempotent `e_χ = |H|⁻¹ Σ_h χ(h)⁻¹ ρ(h)` of a character of a finite group. -/
private def characterIdempotent {d : ℕ} {H : Type} [Group H] [Fintype H]
    (ρ : H →* (Mat d)ˣ) (χ : H →* ℂˣ) : Mat d :=
  ((Fintype.card H : ℂ)⁻¹) • ∑ h, ((χ h : ℂ)⁻¹) • (ρ h : Mat d)

/-- A finite group acting on the family commutes with the special boundary
operator, and so does each character idempotent, which is idempotent. Left
out: the same for the connection, the triangle and the Betti comparison. -/
theorem equivariantLogComparison {d : ℕ} (X : SemistableFamily d) (m : ℕ)
    (H : Type) [Group H] [Fintype H] (χ : H →* ℂˣ) :
    (∀ h, Commute ((X.specialAction m H h : (Mat (X.rank m))ˣ) : Mat (X.rank m))
        (X.specialBoundary m)) ∧
      IsIdempotentElem (characterIdempotent (X.specialAction m H) χ) ∧
      Commute (characterIdempotent (X.specialAction m H) χ) (X.specialBoundary m) := by
  sorry

/-- The linear algebra of a ramified pullback `T = t^e`: the logarithm is
multiplied by `e`, and the nilpotency index does not change. Left out: the
semistable modification and its comparison. -/
theorem ramifiedResidue {d : ℕ} (L : Mat d) (hL : IsNilpotent L)
    (e : ℕ) (he : 0 < e) :
    NormedSpace.exp ((e : ℂ) • L) = NormedSpace.exp L ^ e ∧
      (∀ r : ℕ, ((e : ℂ) • L) ^ r = 0 ↔ L ^ r = 0) := by
  sorry

/-! ## Normalized period degeneration -/

/-- Borel's lemma: every local monodromy of an integral polarized variation
is quasi-unipotent. -/
theorem quasiUnipotentMonodromy {n m d : ℕ} (V : IntegralVariation n m d) (i : Fin n) :
    ∃ e : ℕ, 0 < e ∧ IsNilpotent (V.monodromy i ^ e - 1) := by
  sorry

/-- The linear algebra of the coordinate power cover: commuting
quasi-unipotent matrices have powers with commuting nilpotent logarithms, and
if the matrices preserve a bilinear form `B` the logarithms are infinitesimal
isometries of it. Left out: rationality of the logarithms and the cover. -/
theorem unipotentNormalization {n d : ℕ} (T : Fin n → Mat d) (B : Mat d)
    (hT : ∀ i j, Commute (T i) (T j))
    (hB : ∀ i, (T i)ᵀ * B * T i = B)
    (hqu : ∀ i, ∃ e : ℕ, 0 < e ∧ IsNilpotent (T i ^ e - 1)) :
    ∃ (e : Fin n → ℕ) (L : Fin n → Mat d),
      (∀ i, 0 < e i ∧ IsNilpotent (L i) ∧ NormedSpace.exp (L i) = T i ^ e i ∧
        (L i)ᵀ * B + B * L i = 0) ∧
      ∀ i j, Commute (L i) (L j) := by
  sorry

/-- A nilpotent orbit in coordinates, entering a given set `D` of flags.
Left out: that the generators are real (or rational) infinitesimal isometries
of the polarization and that `D` is a period domain; statements that need
this take `D = P.domain` for a `PolarizedDatum`. -/
structure NilpotentOrbit (n d : ℕ) (D : Set (Flag d)) where
  L : Fin n → Mat d
  F : Flag d
  antitone : Antitone F
  exhaustive : ∃ p, F p = ⊤
  separated : ∃ p, F p = ⊥
  nilpotent : ∀ i, IsNilpotent (L i)
  commute : ∀ i j, Commute (L i) (L j)
  lowering : ∀ i p, (F p).map (Matrix.toLin' (L i)) ≤ F (p - 1)
  eventual : ∃ Y : ℝ, 0 < Y ∧ ∀ z ∈ upper Y, act (twist L z) F ∈ D

def NilpotentOrbit.orbit {n d : ℕ} {D : Set (Flag d)}
    (O : NilpotentOrbit n d D) (z : Fin n → ℂ) : Flag d :=
  act (twist O.L z) O.F
lemma NilpotentOrbit.orbit_zero {n d : ℕ} {D : Set (Flag d)}
    (O : NilpotentOrbit n d D) : O.orbit 0 = O.F := by
  sorry
lemma NilpotentOrbit.orbit_shift {n d : ℕ} {D : Set (Flag d)}
    (O : NilpotentOrbit n d D) (z : Fin n → ℂ) (a : Fin n → ℤ) :
    O.orbit (fun i => z i + a i) = act (twist O.L (fun i => (a i : ℂ))) (O.orbit z) := by
  sorry
lemma NilpotentOrbit.horizontal {n d : ℕ} {D : Set (Flag d)}
    (O : NilpotentOrbit n d D) (i : Fin n) (p : ℤ) :
    (O.F p).map (Matrix.toLin' (O.L i)) ≤ O.F (p - 1) := by
  sorry
lemma NilpotentOrbit.eventual_mem {n d : ℕ} {D : Set (Flag d)}
    (O : NilpotentOrbit n d D) :
    ∃ Y : ℝ, 0 < Y ∧ ∀ z, (∀ i, Y < (z i).im) → O.orbit z ∈ D := by
  sorry

def NilpotentOrbit.reindex {n d : ℕ} {D : Set (Flag d)}
    (O : NilpotentOrbit n d D) (σ : Equiv.Perm (Fin n)) : NilpotentOrbit n d D where
  L := O.L ∘ σ
  F := O.F
  antitone := by sorry
  exhaustive := by sorry
  separated := by sorry
  nilpotent := by sorry
  commute := by sorry
  lowering := by sorry
  eventual := by sorry
lemma NilpotentOrbit.ext {n d : ℕ} {D : Set (Flag d)} (O O' : NilpotentOrbit n d D)
    (hL : O.L = O'.L) (hF : O.F = O'.F) : O = O' := by
  sorry

/-- The one-variable orbit along the ray of a positive combination. -/
def NilpotentOrbit.ray {n d : ℕ} {D : Set (Flag d)} (O : NilpotentOrbit n d D)
    (a : Fin n → ℝ) (_ha : ∀ i, 0 < a i) : NilpotentOrbit 1 d D where
  L := fun _ => ∑ i, (a i : ℂ) • O.L i
  F := O.F
  antitone := by sorry
  exhaustive := by sorry
  separated := by sorry
  nilpotent := by sorry
  commute := by sorry
  lowering := by sorry
  eventual := by sorry

/-- The orbit of a face: the generators indexed by `ι`, with the other
variables frozen at values `c` deep enough for the given depth `Y`. -/
def NilpotentOrbit.face {n k d : ℕ} {D : Set (Flag d)} (O : NilpotentOrbit n d D)
    (ι : Fin k ↪ Fin n) (Y : ℝ) (_hY : 0 < Y)
    (_hO : ∀ z ∈ upper Y, act (twist O.L z) O.F ∈ D)
    (c : Fin n → ℂ) (_hc : c ∈ upper Y) : NilpotentOrbit k d D where
  L := O.L ∘ ι
  F := act (twist O.L (fun i => if i ∈ Set.range ι then 0 else c i)) O.F
  antitone := by sorry
  exhaustive := by sorry
  separated := by sorry
  nilpotent := by sorry
  commute := by sorry
  lowering := by sorry
  eventual := by sorry

-- NilpotentOrbit_test_zero
example {n d : ℕ} {D : Set (Flag d)} (O : NilpotentOrbit n d D)
    (hL : ∀ i, O.L i = 0) (z : Fin n → ℂ) : O.orbit z = O.F := by
  sorry
-- NilpotentOrbit_test_elliptic
example (z : ℂ) :
    (Submodule.span ℂ {(![0,1] : Vec 2)}).map
      (Matrix.toLin' (NormedSpace.exp (z • jordan))) =
      Submodule.span ℂ {(![z,1] : Vec 2)} := by
  sorry
-- NilpotentOrbit_test_no_positivity
example {n d : ℕ} {D : Set (Flag d)} (O : NilpotentOrbit n d D)
    (hL : ∀ i, O.L i = 0) : O.F ∈ D := by
  sorry

/-- The untwisted period map on the universal cover. -/
def untwistedPeriodMap {n d : ℕ} (L : Fin n → Mat d)
    (Φ : (Fin n → ℂ) → Flag d) (z : Fin n → ℂ) : Flag d :=
  act (twist L (fun i => -z i)) (Φ z)
lemma untwistedPeriodMap.apply {n d : ℕ} (L : Fin n → Mat d)
    (Φ : (Fin n → ℂ) → Flag d) (z : Fin n → ℂ) :
    untwistedPeriodMap L Φ z = act (twist L (fun i => -z i)) (Φ z) := by
  sorry
lemma untwistedPeriodMap.undo {n d : ℕ} (L : Fin n → Mat d)
    (Φ : (Fin n → ℂ) → Flag d) (z : Fin n → ℂ) :
    act (twist L z) (untwistedPeriodMap L Φ z) = Φ z := by
  sorry
lemma untwistedPeriodMap.integer_shift {n d : ℕ} (L : Fin n → Mat d)
    (hL : ∀ i j, Commute (L i) (L j)) (Φ : (Fin n → ℂ) → Flag d)
    (hΦ : ∀ (z : Fin n → ℂ) (a : Fin n → ℤ),
      Φ (fun i => z i + a i) = act (twist L (fun i => (a i : ℂ))) (Φ z))
    (z : Fin n → ℂ) (a : Fin n → ℤ) :
    untwistedPeriodMap L Φ (fun i => z i + a i) = untwistedPeriodMap L Φ z := by
  sorry
lemma untwistedPeriodMap.zero {n d : ℕ} (Φ : (Fin n → ℂ) → Flag d) :
    untwistedPeriodMap (fun _ => (0 : Mat d)) Φ = Φ := by
  sorry
lemma untwistedPeriodMap.gauge {n d : ℕ} (P : (Mat d)ˣ) (L : Fin n → Mat d)
    (Φ : (Fin n → ℂ) → Flag d) (z : Fin n → ℂ) :
    untwistedPeriodMap (fun i => (↑P : Mat d) * L i * (↑P⁻¹ : Mat d))
      (fun z => act (↑P : Mat d) (Φ z)) z = act (↑P : Mat d) (untwistedPeriodMap L Φ z) := by
  sorry
/-- The residue convention `A_i = −L_i/(2πi)` of the canonical extension: its
monodromy `exp(−2πi A_i)` is `exp L_i`. Left out: the identification of the
frame with the canonical extension of H.2. -/
lemma untwistedPeriodMap.canonicalExtension {n d : ℕ} (L : Fin n → Mat d) (i : Fin n) :
    NormedSpace.exp ((-(2 * Real.pi : ℂ) * Complex.I) •
      ((-(2 * Real.pi : ℂ) * Complex.I)⁻¹ • L i)) = NormedSpace.exp (L i) := by
  sorry

-- untwistedPeriodMap_test_orbit
example {n d : ℕ} (L : Fin n → Mat d) (F : Flag d) (z : Fin n → ℂ) :
    untwistedPeriodMap L (fun z => act (twist L z) F) z = F := by
  sorry
-- untwistedPeriodMap_test_zero
example {d : ℕ} (Φ : (Fin 0 → ℂ) → Flag d) (z : Fin 0 → ℂ) :
    untwistedPeriodMap (fun i => Fin.elim0 i) Φ z = Φ z := by
  sorry
-- untwistedPeriodMap_test_sign
example : (Submodule.span ℂ {(![Complex.I,1] : Vec 2)}).map
    (Matrix.toLin' (NormedSpace.exp ((-Complex.I) • jordan))) =
      Submodule.span ℂ {(![0,1] : Vec 2)} := by
  sorry

/-- The untwisted map descends to a map of `q = exp(2πi z)` on the whole
polydisc whose value at `q = 0` is the limiting flag. Left out: holomorphy of
the extension, for which the compact dual needs its manifold structure, and
the identification with the Hodge subbundles of the canonical extension. -/
theorem untwistedExtension {n m d : ℕ} (V : UnipotentVariation n m d) :
    ∃ Ψ : (Fin n → ℂ) → (Fin m → ℂ) → Flag d,
      (∀ w, Ψ 0 w = V.limitFlag w) ∧
      ∀ z w, (∀ i, 0 < (z i).im) → (∀ j, ‖w j‖ < 1) →
        untwistedPeriodMap V.log (fun z => V.periodLift z w) z =
          Ψ (fun i => Complex.exp ((2 * Real.pi : ℂ) * Complex.I * z i)) w := by
  sorry

/-- The limiting flags and the monodromy logarithms form nilpotent orbits in
the period domain. Left out: the distance estimate between the orbit and the
period lift, which needs the invariant distance requested from H.3, and the
common depth on compact parameter sets. -/
theorem nilpotentOrbitTheorem {n m d : ℕ} (V : UnipotentVariation n m d)
    (w : Fin m → ℂ) (hw : ∀ j, ‖w j‖ < 1) :
    ∃ O : NilpotentOrbit n d V.datum.domain, O.L = V.log ∧ O.F = V.limitFlag w := by
  sorry

/-- With trivial monodromy the limiting flag lies in the period domain. Left
out: holomorphy and the descent through the finite quotient. -/
theorem finiteMonodromyExtension {n m d : ℕ} (V : UnipotentVariation n m d)
    (hL : ∀ i, V.log i = 0) (w : Fin m → ℂ) (hw : ∀ j, ‖w j‖ < 1) :
    V.limitFlag w ∈ V.datum.domain := by
  sorry

/-! ## Weights, limits and simultaneous decompositions -/

/-- The SL₂-orbit theorem with the base point normalized so that `g(∞) = 1`:
an `sl₂`-triple `(H, L, N⁺)`, a flag `F'` fixed by `H` whose orbit under
`exp(zL)` lies in the period domain on the whole upper half-plane, and a
correction `g` tending to `1` at infinity. Left out: that the triple comes
from a homomorphism of type `(0,0)`, reality of `g` on the imaginary axis, the
eigenvalue bounds on the coefficients of `g`, and the rational form. -/
theorem sl2OrbitTheorem {d : ℕ} (P : PolarizedDatum d) (O : NilpotentOrbit 1 d P.domain)
    (hL : O.L 0 ≠ 0) :
    ∃ (F' : Flag d) (H Nplus : Mat d) (g : ℂ → Mat d),
      H * O.L 0 - O.L 0 * H = (2 : ℂ) • O.L 0 ∧
      H * Nplus - Nplus * H = -((2 : ℂ) • Nplus) ∧
      O.L 0 * Nplus - Nplus * O.L 0 = H ∧
      (∀ p, (F' p).map (Matrix.toLin' H) ≤ F' p) ∧
      (∀ p, (F' p).map (Matrix.toLin' (O.L 0)) ≤ F' (p - 1)) ∧
      (∀ z : ℂ, 0 < z.im → act (NormedSpace.exp (z • O.L 0)) F' ∈ P.domain) ∧
      Tendsto g (Filter.cocompact ℂ) (𝓝 1) ∧
      ∃ R : ℝ, ∀ z : ℂ, R < ‖z‖ →
        act (NormedSpace.exp (z • O.L 0)) O.F =
          act (g z) (act (NormedSpace.exp (z • O.L 0)) F') := by
  sorry

/-- Opposedness in weight `k + r` of the filtrations induced on `gr^W_r` by a
flag and its conjugate, written without quotients. -/
private def GradedOpposed {d : ℕ} (k : ℤ) (F : Flag d) (W : ℤ → Submodule ℂ (Vec d)) : Prop :=
  ∀ r p : ℤ,
    (F p ⊓ W r) ⊔ (conjSub (F (k + r + 1 - p)) ⊓ W r) ⊔ W (r - 1) = W r ∧
    (F p ⊓ W r) ⊓ ((conjSub (F (k + r + 1 - p)) ⊓ W r) ⊔ W (r - 1)) ≤ W (r - 1)

/-- The limiting mixed Hodge structure of a one-variable orbit: the graded
piece of centered index `r` is pure of weight `k + r`, and the logarithm
lowers the weight filtration by two. Left out: the primitive polarization and
the packaging as a native `MixedHodgeStructure`. -/
theorem limitingMixedHodgeOneVariable {d : ℕ} (P : PolarizedDatum d)
    (O : NilpotentOrbit 1 d P.domain) :
    GradedOpposed P.weight O.F (monodromyFiltration (O.L 0)) ∧
      ∀ ℓ, (monodromyFiltration (O.L 0) ℓ).map (Matrix.toLin' (O.L 0)) ≤
        monodromyFiltration (O.L 0) (ℓ - 2) := by
  sorry

/-- The weight filtration of a positive combination of a set `J` of generators. -/
private def faceFiltration {n d : ℕ} (L : Fin n → Mat d) (J : Finset (Fin n)) :
    ℤ → Submodule ℂ (Vec d) :=
  monodromyFiltration (∑ i ∈ J, L i)

/-- Constancy of the weight filtration on each open face of the cone; every
generator of the face lowers its filtration by two. Left out: the relative
statement for `J ⊆ J'` (lowering by generators of `J'` and the graded
isomorphisms on `gr^{W(J)}`), which needs the bigraded quotients. -/
theorem nilpotentConeWeights {n d : ℕ} (P : PolarizedDatum d)
    (O : NilpotentOrbit n d P.domain) (J : Finset (Fin n))
    (a : Fin n → ℝ) (ha : ∀ i ∈ J, 0 < a i) :
    monodromyFiltration (∑ i ∈ J, (a i : ℂ) • O.L i) = faceFiltration O.L J ∧
      ∀ i ∈ J, ∀ ℓ, (faceFiltration O.L J ℓ).map (Matrix.toLin' (O.L i)) ≤
        faceFiltration O.L J (ℓ - 2) := by
  sorry

/-- The limiting mixed Hodge structure for the full cone, with every generator
of type `(−1,−1)` on the weight filtration. Left out as in the one-variable
statement. -/
theorem limitingMixedHodge {n d : ℕ} (P : PolarizedDatum d)
    (O : NilpotentOrbit n d P.domain) :
    GradedOpposed P.weight O.F (faceFiltration O.L Finset.univ) ∧
      ∀ i ℓ, (faceFiltration O.L Finset.univ ℓ).map (Matrix.toLin' (O.L i)) ≤
        faceFiltration O.L Finset.univ (ℓ - 2) := by
  sorry

/-- Stand-in: the Deligne bigrading `I^{p,q}` of the full-cone limiting mixed
Hodge structure (the native `MixedHodgeStructure.deligneSplitting`, indexed by
actual weights), in coordinates. -/
def limitingBigrading {n d : ℕ} (P : PolarizedDatum d) (O : NilpotentOrbit n d P.domain) :
    ℤ → ℤ → Submodule ℂ (Vec d) := sorry

/-- Every generator lowers the Deligne bigrading by `(1,1)`. -/
theorem logarithmsTypeMinusOne {n d : ℕ} (P : PolarizedDatum d)
    (O : NilpotentOrbit n d P.domain) (i : Fin n) (p q : ℤ) :
    (limitingBigrading P O p q).map (Matrix.toLin' (O.L i)) ≤
      limitingBigrading P O (p - 1) (q - 1) := by
  sorry

/-- The initial faces `{1, …, j}` in the given order of the generators. -/
private def initialFace {n : ℕ} (j : Fin n) : Finset (Fin n) := Finset.Iic j

/-- The steps of the limiting flag and of the weight filtrations of the
initial faces lie in a family of subspaces closed under sum and intersection
on which intersection distributes over sum. -/
theorem hodgeWeightDistributive {n d : ℕ} (P : PolarizedDatum d)
    (O : NilpotentOrbit n d P.domain) :
    ∃ T : Set (Submodule ℂ (Vec d)),
      (∀ p, O.F p ∈ T) ∧ (∀ j ℓ, faceFiltration O.L (initialFace j) ℓ ∈ T) ∧
      (∀ A ∈ T, ∀ B ∈ T, A ⊓ B ∈ T ∧ A ⊔ B ∈ T) ∧
      ∀ A ∈ T, ∀ B ∈ T, ∀ C ∈ T, A ⊓ (B ⊔ C) = (A ⊓ B) ⊔ (A ⊓ C) := by
  sorry

/-- A complex splitting adapted to the limiting flag and to the weight
filtrations of all initial faces, indexed by `(p, σ)` with centered `σ`. Left
out: the separate rational splitting of the weight filtrations and the
transport along parameters. -/
theorem simultaneousSplittings {n d : ℕ} (P : PolarizedDatum d)
    (O : NilpotentOrbit n d P.domain) :
    ∃ I : (ℤ × (Fin n → ℤ)) → Submodule ℂ (Vec d),
      DirectSum.IsInternal I ∧
      (∀ r, O.F r = ⨆ a, ⨆ (_ : r ≤ a.1), I a) ∧
      ∀ j r, faceFiltration O.L (initialFace j) r = ⨆ a, ⨆ (_ : a.2 j ≤ r), I a := by
  sorry

/-! ## Horizontal correction and Hodge norm estimates -/

/-- The correction `exp(v(q))` of a coefficient `v` in the negative-Lie chart. -/
def negativeLieCorrection {n d : ℕ} (v : (Fin n → ℂ) → Mat d)
    (q : Fin n → ℂ) : Mat d := NormedSpace.exp (v q)
lemma negativeLieCorrection.exp_zero {n d : ℕ} (q : Fin n → ℂ) :
    negativeLieCorrection (fun _ => (0 : Mat d)) q = 1 := by
  sorry
/-- A coefficient that lifts `Ψ` through the exponential chart at `F` lifts it
through `negativeLieCorrection`. -/
lemma negativeLieCorrection.lift {n d : ℕ} (v : (Fin n → ℂ) → Mat d)
    (Ψ : (Fin n → ℂ) → Flag d) (F : Flag d)
    (hv : ∀ q, Ψ q = act (NormedSpace.exp (v q)) F) (q : Fin n → ℂ) :
    Ψ q = act (negativeLieCorrection v q) F := by
  sorry
lemma negativeLieCorrection.unique {d : ℕ} (F : Flag d) (B : Set (Mat d))
    (hchart : Set.InjOn (fun A => act (NormedSpace.exp A) F) B)
    (A A' : Mat d) (hA : A ∈ B) (hA' : A' ∈ B)
    (h : act (NormedSpace.exp A) F = act (NormedSpace.exp A') F) : A = A' := by
  sorry
lemma negativeLieCorrection.boundary {n d : ℕ} (v : (Fin n → ℂ) → Mat d)
    (hv : v 0 = 0) : negativeLieCorrection v 0 = 1 := by
  sorry

def negativeLieCorrection.gamma {n d : ℕ} (L : Fin n → Mat d)
    (v : (Fin n → ℂ) → Mat d) (z : Fin n → ℂ) : Mat d :=
  twist L z * negativeLieCorrection v
    (fun i => Complex.exp ((2 * Real.pi : ℂ) * Complex.I * z i))
lemma negativeLieCorrection.buffer {n d : ℕ} (v : (Fin n → ℂ) → Mat d)
    (U K : Set (Fin n → ℂ)) (hv : AnalyticOnNhd ℂ v U)
    (hK : K ⊆ U) : AnalyticOnNhd ℂ v K := by
  sorry

-- negativeLieCorrection_test_zero
example {n d : ℕ} (q : Fin n → ℂ) :
    negativeLieCorrection (fun _ => (0 : Mat d)) q = 1 := by
  sorry
-- negativeLieCorrection_test_square_zero
example {d : ℕ} (A : Mat d) (hA : A ^ 2 = 0) :
    negativeLieCorrection (fun _ : Fin 1 → ℂ => A) 0 = 1 + A := by
  sorry
-- negativeLieCorrection_test_nonidentity
example : negativeLieCorrection (fun _ : Fin 1 → ℂ => jordan) 0 ≠ 1 := by
  sorry
-- negativeLieCorrection_test_elliptic_chart
example (a : ℂ) :
    (Submodule.span ℂ {(![0,1] : Vec 2)}).map
      (Matrix.toLin' (negativeLieCorrection (fun _ : Fin 1 → ℂ => a • jordan) 0)) =
      Submodule.span ℂ {(![a,1] : Vec 2)} := by
  sorry
-- negativeLieCorrection_test_stabilizer
example (t : ℂ) :
    (Submodule.span ℂ {(![0,1] : Vec 2)}).map
      (Matrix.toLin' (NormedSpace.exp (t • (!![1,0;0,-1] : Mat 2)))) =
      Submodule.span ℂ {(![0,1] : Vec 2)} := by
  sorry

/-- Horizontality of the corrected frame `exp(Σ z_i L_i) g(q)`, with the factor
`2πi`, on a small polydisc, and the triangular expansion of the coefficient:
`v = Σ q_i c_i` with `c_i` commuting with `L_j` for `j < i`. Left out: that
`c_i` depends only on `q_i, …, q_n`, and holomorphy in the parameter. -/
theorem horizontalCorrection {n m d : ℕ} (V : UnipotentVariation n m d)
    (w : Fin m → ℂ) (hw : ∀ j, ‖w j‖ < 1) :
    ∃ ρ : ℝ, 0 < ρ ∧
      (∀ q : Fin n → ℂ, (∀ i, ‖q i‖ < ρ) → ∀ i p,
        (V.limitFlag w p).map (Matrix.toLin'
          ((negativeLieCorrection (fun q => V.correctionLog q w) q)⁻¹ * V.log i *
              negativeLieCorrection (fun q => V.correctionLog q w) q +
            ((2 * Real.pi : ℂ) * Complex.I * q i) •
              ((negativeLieCorrection (fun q => V.correctionLog q w) q)⁻¹ *
                deriv (fun t => negativeLieCorrection (fun q => V.correctionLog q w)
                  (Function.update q i t)) (q i)))) ≤
          V.limitFlag w (p - 1)) ∧
      ∃ c : Fin n → (Fin n → ℂ) → Mat d,
        (∀ q : Fin n → ℂ, (∀ i, ‖q i‖ < ρ) → V.correctionLog q w = ∑ i, q i • c i q) ∧
        ∀ i j, j < i → ∀ q, Commute (V.log j) (c i q) := by
  sorry

-- Private inline numerical comparison, not H.7 sector or rough-monomial objects.
private def ordered {n : ℕ} (R Y : ℝ) (z : Fin n → ℂ) : Prop :=
  (∀ i, |(z i).re| ≤ R ∧ Y ≤ (z i).im) ∧
  ∀ i j, i ≤ j → (z j).im ≤ (z i).im
private def weightMonomial {n : ℕ} (σ : Fin n → ℤ) (y : Fin n → ℝ) : ℝ :=
  ∏ i : Fin n, (if h : i.val + 1 < n then y i / y ⟨i.val + 1, h⟩ else y i) ^ (σ i)
private def weightedSum {n d k : ℕ} (σ : Fin k → Fin n → ℤ)
    (pr : Fin k → (Vec d →ₗ[ℂ] Vec d)) (z : Fin n → ℂ) (u : Vec d) : ℝ :=
  ∑ a, weightMonomial (σ a) (fun i => (z i).im) * ‖pr a u‖ ^ 2
/-- A finite family of projections with centered multiweights `σ` splitting
the weight filtrations of all initial faces. -/
private def WeightSplitting {n d k : ℕ} (L : Fin n → Mat d) (σ : Fin k → Fin n → ℤ)
    (pr : Fin k → (Vec d →ₗ[ℂ] Vec d)) : Prop :=
  (∀ u, ∑ a, pr a u = u) ∧ (∀ a b u, pr a (pr b u) = if a = b then pr a u else 0) ∧
  ∀ j ℓ, faceFiltration L (initialFace j) ℓ =
    ⨆ a, ⨆ (_ : σ a j ≤ ℓ), LinearMap.range (pr a)

/-- The flat squared-norm estimate for every splitting of the weight
filtrations, at a fixed parameter. Left out: uniformity on compact parameter
sets under Kashiwara's rank condition. -/
theorem flatNormEstimate {n m d k : ℕ} (V : UnipotentVariation n m d)
    (w : Fin m → ℂ) (hw : ∀ j, ‖w j‖ < 1)
    (σ : Fin k → Fin n → ℤ) (pr : Fin k → (Vec d →ₗ[ℂ] Vec d))
    (hpr : WeightSplitting V.log σ pr) (R : ℝ) (hR : 0 ≤ R) :
    ∃ c C Y : ℝ, 0 < c ∧ 0 < C ∧ 0 < Y ∧
      ∀ z, ordered R Y z → ∀ u,
        c * weightedSum σ pr z u ≤ V.hodgeNormSq z w u ∧
          V.hodgeNormSq z w u ≤ C * weightedSum σ pr z u := by
  sorry

/-- The same estimate for the transported vector `exp(Σ z_i L_i) u`. -/
theorem movingNormEstimate {n m d k : ℕ} (V : UnipotentVariation n m d)
    (w : Fin m → ℂ) (hw : ∀ j, ‖w j‖ < 1)
    (σ : Fin k → Fin n → ℤ) (pr : Fin k → (Vec d →ₗ[ℂ] Vec d))
    (hpr : WeightSplitting V.log σ pr) (R : ℝ) (hR : 0 ≤ R) :
    ∃ c C Y : ℝ, 0 < c ∧ 0 < C ∧ 0 < Y ∧
      ∀ z, ordered R Y z → ∀ u,
        c * weightedSum σ pr z u ≤ V.hodgeNormSq z w ((twist V.log z).mulVec u) ∧
          V.hodgeNormSq z w ((twist V.log z).mulVec u) ≤ C * weightedSum σ pr z u := by
  sorry

/-- The squared Hodge norm of a wedge in the exterior-power variation is the
Gram determinant. `flatNormEstimate` and `movingNormEstimate` apply to
`V.exteriorPower r`. Left out: that the multiweight of a wedge of split vectors
is the sum of their multiweights. -/
theorem exteriorPowerEstimates {n m d : ℕ} (V : UnipotentVariation n m d) (r : ℕ)
    (z : Fin n → ℂ) (w : Fin m → ℂ) (u : Fin r → Vec d) :
    (V.exteriorPower r).hodgeNormSq z w (exteriorCoordinates d r u) =
      (Matrix.det (Matrix.of fun i j => V.hodgeInner z w (u i) (u j))).re := by
  sorry

/-- After a depth threshold the corrected frame and the orbit frame give
comparable squared norms. -/
theorem perturbedNormComparison {n m d : ℕ} (V : UnipotentVariation n m d)
    (w : Fin m → ℂ) (hw : ∀ j, ‖w j‖ < 1) (R : ℝ) (hR : 0 ≤ R) :
    ∃ c C Y : ℝ, 0 < c ∧ 0 < C ∧ 0 < Y ∧
      ∀ z, ordered R Y z → ∀ u,
        c * V.hodgeNormSq z w ((twist V.log z).mulVec u) ≤
          V.hodgeNormSq z w
            ((negativeLieCorrection.gamma V.log (fun q => V.correctionLog q w) z).mulVec u) ∧
        V.hodgeNormSq z w
            ((negativeLieCorrection.gamma V.log (fun q => V.correctionLog q w) z).mulVec u) ≤
          C * V.hodgeNormSq z w ((twist V.log z).mulVec u) := by
  sorry

/-! ## One-variable arithmetic containment -/

/-- The factors of a one-variable period lift and their limits: `t` is
asymptotic to `exp(−½ log y · H)` and the other factors converge. Left out:
that the factors lie in the unipotent radical, the split torus and the
anisotropic part of a rational parabolic and in the maximal compact, and
uniformity in `x`. -/
theorem oneVariableSL2 {d : ℕ} (V : UnipotentVariation 1 0 d) (hL : V.log 0 ≠ 0) :
    ∃ (o : Flag d) (H : Mat d) (Y₀ : ℝ) (r t mm k : ℝ → ℝ → Mat d),
      o ∈ V.datum.domain ∧ 0 < Y₀ ∧
      (∀ x y : ℝ, Y₀ < y →
        V.periodLift (fun _ => (x : ℂ) + (y : ℂ) * Complex.I) (fun j => Fin.elim0 j) =
          act (r x y * t x y * mm x y * k x y) o) ∧
      ∀ x : ℝ,
        Tendsto (fun y => NormedSpace.exp (((Real.log y / 2 : ℝ) : ℂ) • H) * t x y)
          atTop (𝓝 1) ∧
        Tendsto (fun y => mm x y) atTop (𝓝 1) ∧ Tendsto (fun y => k x y) atTop (𝓝 1) ∧
        ∃ r₀ : Mat d, Tendsto (fun y => r x y) atTop (𝓝 r₀) := by
  sorry

/-- The consumer form: a strip of bounded width and height bounded below maps
into finitely many Siegel sets for the canonical maximal compact. This is the
statement whose proof is gap G5 of the packet. -/
theorem oneVariableSiegel {d : ℕ} (V : UnipotentVariation 1 0 d)
    (C η : ℝ) (hC : 0 < C) (hη : 0 < η) :
    ∃ S : Set (Set (Flag d)), S ⊆ V.datum.siegelSets ∧ S.Finite ∧
      ∀ z : ℂ, |z.re| ≤ C → η ≤ z.im →
        V.periodLift (fun _ => z) (fun j => Fin.elim0 j) ∈ ⋃₀ S := by
  sorry

/-- Clearing the denominators of rational slopes: the combined logarithm of
the curve is a positive integer multiple of the combination with the slopes.
Left out: the pulled-back variation and its Siegel containment. -/
theorem powerCurveNormalization {n d : ℕ} (a : Fin n → ℚ)
    (ha : ∀ i, 0 ≤ a i) (L : Fin n → Mat d) :
    ∃ (e : ℕ) (b : Fin n → ℕ), 0 < e ∧
      (∀ i, (e : ℚ) * a i = b i) ∧
      (∑ i, ((b i : ℕ) : ℂ) • L i) =
        (e : ℂ) • (∑ i, (a i : ℂ) • L i) := by
  sorry

end TauCeti.Hodge.Degeneration
