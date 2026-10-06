import Mathlib.Analysis.Distribution.Distribution
import Mathlib.Analysis.Normed.Module.Alternating.Basic
import Mathlib.LinearAlgebra.ExteriorAlgebra.Basic
import Mathlib.GroupTheory.Perm.Sign
import Mathlib.Data.Fin.Tuple.Basic
import Mathlib.Analysis.Complex.Exponential
import Mathlib.Analysis.Normed.Group.InfiniteSum
import Mathlib.Data.Finsupp.BigOperators
import Mathlib.Algebra.Homology.HomotopyCategory.MappingCone

/-!
This file is not the roadmap and is not exhaustive. The roadmap document
Polylogarithms--P.5.md is definitive. These statements suggest Lean forms so
contributors and reviewers converge on names and signatures. All proof holes
are intentional; no implementation or analytic comparison is claimed.

The pinned Mathlib supplies chart test functions/distributions, exterior algebra
and infinite sums. It has no global LF test forms, manifold currents, Chow
incidence, higher cycle complexes or real Deligne hypercohomology. The omission
manifest below names every unavailable packet signature and its precise carrier.
No arbitrary proposition or assumed comparison field replaces those carriers.

The concrete sections prototype chart signs, the full finite Wang polynomial,
the three-coordinate auxiliary differential, the comparison's minus sign and
the explicit two-index elliptic series. The global statements remain mathematical
targets with the supplier and proof gaps recorded in the packet.
-/

noncomputable section
set_option autoImplicit false
open scoped BigOperators Distributions
open MeasureTheory

namespace TauCeti.CurveRegulator

section Chart
variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]

/-- The existing LF chart model, with alternating-form coefficients. -/
abbrev ChartTestForms (Ω : TopologicalSpace.Opens E) (k : ℕ) :=
  TestFunction Ω (ContinuousAlternatingMap ℝ E ℂ (Fin k)) ⊤

/-- The top-current chart is the existing real-test-function dual. -/
abbrev ChartTopCurrent (Ω : TopologicalSpace.Opens E) := Distribution Ω ℂ ⊤

-- ManifoldCurrent.dirac: chart specialization of the packet's test.
example (Ω : TopologicalSpace.Opens E) (x : E) (φ : TestFunction Ω ℝ ⊤) :
    (Distribution.delta x : Distribution Ω ℝ ⊤) φ = φ x := by
  sorry

-- ManifoldCurrent.derivative_sign: the actual existing chart derivative.
example (Ω : TopologicalSpace.Opens E) (v : E)
    (T : Distribution Ω ℂ ⊤) (φ : TestFunction Ω ℝ ⊤) :
    Distribution.lineDerivCLM v T φ = -T (TestFunction.lineDerivCLM ℝ v φ) := by
  sorry

-- Locally integrable representatives do not bypass Mathlib's integrability condition.
example (Ω : TopologicalSpace.Opens ℂ) (f : ℂ → ℝ)
    (hf : LocallyIntegrableOn f Ω volume) (φ : TestFunction Ω ℝ ⊤) :
    Distribution.ofFun Ω f volume ⊤ φ = ∫ z, φ z * f z := by
  sorry

def chartDerivative (Ω : TopologicalSpace.Opens ℂ) (v : ℂ) :
    Distribution Ω ℝ ⊤ →L[ℝ] Distribution Ω ℝ ⊤ := Distribution.lineDerivCLM v

/-- Δ log|z|=2πδ₀: the positively oriented scalar chart of Poincaré–Lelong. -/
theorem poincareLelong_chart (Ω : TopologicalSpace.Opens ℂ) :
    let T : Distribution Ω ℝ ⊤ := Distribution.ofFun Ω (fun z : ℂ => Real.log ‖z‖) volume ⊤
    chartDerivative Ω 1 (chartDerivative Ω 1 T) +
      chartDerivative Ω Complex.I (chartDerivative Ω Complex.I T) =
        (2 * Real.pi) • (Distribution.delta (0 : ℂ) : Distribution Ω ℝ ⊤) := by
  sorry
end Chart

namespace WangForm
variable {V : Type*} [AddCommGroup V] [Module ℂ V]
variable {m : ℕ}

/-- Pointwise logarithmic data: value, ∂ component and bar∂ component. -/
structure Jet (V : Type*) where
  value : ℝ
  hol : V
  anti : V

def zeroJet : Jet V := ⟨0, 0, 0⟩

/-- An ordered product; exterior-algebra multiplication retains wedge order. -/
def orderedProduct (jets : Fin m → Jet V) (σ : Equiv.Perm (Fin m)) (i : ℕ) :
    ExteriorAlgebra ℂ V :=
  ((List.finRange m).drop 1).foldl
    (fun acc j => acc * ExteriorAlgebra.ι ℂ
      (if j.val < i then (jets (σ j)).hol else (jets (σ j)).anti)) 1

/-- Full unaveraged alternating polynomial, with only one factorial division. -/
def coefficients (jets : Fin m → Jet V) : ExteriorAlgebra ℂ V :=
  if hm : m = 0 then 1 else
    (((-2 : ℂ) ^ m) / (2 * (Nat.factorial m : ℂ))) •
      ∑ i ∈ Finset.range m, (-1 : ℂ) ^ (i + 1) •
        ∑ σ : Equiv.Perm (Fin m),
          (((Equiv.Perm.sign σ : ℤ) : ℂ) * (jets (σ ⟨0, Nat.pos_of_ne_zero hm⟩)).value) •
            orderedProduct jets σ (i + 1)

theorem one (jets : Fin 1 → Jet V) :
    coefficients jets = (jets 0).value • (1 : ExteriorAlgebra ℂ V) := by
  sorry

theorem two (jets : Fin 2 → Jet V) :
    coefficients jets =
      (jets 0).value • ExteriorAlgebra.ι ℂ ((jets 1).hol - (jets 1).anti) -
      (jets 1).value • ExteriorAlgebra.ι ℂ ((jets 0).hol - (jets 0).anti) := by
  sorry

theorem alternating (jets : Fin m → Jet V) (σ : Equiv.Perm (Fin m)) :
    coefficients (jets ∘ σ) = (((Equiv.Perm.sign σ : ℤ) : ℂ)) • coefficients jets := by
  sorry

/-- The coefficient-level part of pullback; global Dolbeault morphisms are omitted. -/
theorem pullback {W : Type*} [AddCommGroup W] [Module ℂ W]
    (f : V →ₗ[ℂ] W) (jets : Fin m → Jet V) :
    ExteriorAlgebra.map f (coefficients jets) =
      coefficients (fun j => ⟨(jets j).value, f (jets j).hol, f (jets j).anti⟩) := by
  sorry

/-- The function 1 has its entire logarithmic jet zero. -/
theorem unit_function (jets : Fin m → Jet V) (j : Fin m) (hj : jets j = zeroJet) :
    coefficients jets = 0 := by
  sorry

-- WangForm.test_one
example : coefficients (V := V) (fun _ : Fin 1 => ⟨3, 0, 0⟩) =
    (3 : ℂ) • (1 : ExteriorAlgebra ℂ V) := by
  sorry

-- WangForm.test_two
example (a : V) : coefficients (fun j : Fin 2 =>
      if j = 0 then (⟨1, 0, 0⟩ : Jet V) else ⟨0, a, 0⟩) = ExteriorAlgebra.ι ℂ a := by
  sorry

-- WangForm.test_zero, including the empty tuple.
example : coefficients (V := V) (fun j : Fin 0 => Fin.elim0 j) = 1 := by
  sorry

example : coefficients (V := V) (fun _ : Fin 1 => zeroJet) = 0 := by
  sorry
end WangForm

namespace MixedWangForm
variable {V : Type*} [AddCommGroup V] [Module ℂ V] {n m : ℕ}

/-- The pointwise concatenated polynomial, before taking current extensions. -/
def apply (c : Fin n → WangForm.Jet V) (s : Fin m → WangForm.Jet V) :=
  WangForm.coefficients (Fin.append c s)

theorem cube (c : Fin n → WangForm.Jet V) :
    apply c (fun j : Fin 0 => Fin.elim0 j) = WangForm.coefficients c := by
  sorry

theorem simplex (s : Fin m → WangForm.Jet V) :
    apply (fun j : Fin 0 => Fin.elim0 j) s = WangForm.coefficients s := by
  sorry

-- MixedWangForm.origin
example : apply (V := V) (fun j : Fin 0 => Fin.elim0 j)
    (fun j : Fin 0 => Fin.elim0 j) = 1 := by
  sorry

-- MixedWangForm.one_each
example (c s : Fin 1 → WangForm.Jet V) :
    apply c s = (c 0).value • ExteriorAlgebra.ι ℂ ((s 0).hol - (s 0).anti) -
      (s 0).value • ExteriorAlgebra.ι ℂ ((c 0).hol - (c 0).anti) := by
  sorry

-- MixedWangForm.ratio_one, at the coefficient level.
example (s : Fin m → WangForm.Jet V) :
    apply (fun _ : Fin 1 => WangForm.zeroJet) s = 0 := by
  sorry
end MixedWangForm

namespace BFTAuxiliary
variable {A B C : ℤ → Type*}
variable [∀ k, AddCommGroup (A k)] [∀ k, AddCommGroup (B k)] [∀ k, AddCommGroup (C k)]

/-- The shifted simple in degree k is A(k+1) ⊕ B(k) ⊕ C(k). -/
abbrev Degree (k : ℤ) := A (k + 1) × B k × C k

def differential
    (dA : ∀ k, A k →+ A (k + 1))
    (dB : ∀ k, B k →+ B (k + 1))
    (dC : ∀ k, C k →+ C (k + 1))
    (g : ∀ k, A k →+ B k) (ρ : ∀ k, A k →+ C k)
    (k : ℤ) (x : Degree (A := A) (B := B) (C := C) k) :
    Degree (A := A) (B := B) (C := C) (k + 1) :=
  (-dA (k + 1) x.1, dB k x.2.1 + g (k + 1) x.1,
    dC k x.2.2 - ρ (k + 1) x.1)

/-- Pointwise β. Its global quasi-isomorphism requires the support/purity carrier. -/
def beta (k : ℤ) (z : C k) : Degree (A := A) (B := B) (C := C) k := (0, 0, z)

-- BFTAuxiliary.beta_sign
example (dA : ∀ k, A k →+ A (k + 1)) (dB : ∀ k, B k →+ B (k + 1))
    (dC : ∀ k, C k →+ C (k + 1)) (g : ∀ k, A k →+ B k) (ρ : ∀ k, A k →+ C k)
    (k : ℤ) (z : C k) :
    differential dA dB dC g ρ k (beta k z) = beta (k + 1) (dC k z) := by
  sorry

-- BFTAuxiliary.square: actual graded maps and their actual chain identities.
example (dA : ∀ k, A k →+ A (k + 1)) (dB : ∀ k, B k →+ B (k + 1))
    (dC : ∀ k, C k →+ C (k + 1)) (g : ∀ k, A k →+ B k) (ρ : ∀ k, A k →+ C k)
    (hA : ∀ k a, dA (k + 1) (dA k a) = 0)
    (hB : ∀ k b, dB (k + 1) (dB k b) = 0)
    (hC : ∀ k c, dC (k + 1) (dC k c) = 0)
    (hg : ∀ k a, dB k (g k a) = g (k + 1) (dA k a))
    (hρ : ∀ k a, dC k (ρ k a) = ρ (k + 1) (dA k a))
    (k : ℤ) (x : Degree (A := A) (B := B) (C := C) k) :
    differential dA dB dC g ρ (k + 1) (differential dA dB dC g ρ k x) = 0 := by
  sorry
end BFTAuxiliary

namespace RegulatorComparison
variable {Z G F T : Type*} [AddCommGroup T]

/-- The pointwise three summands; the global chain maps are not assumed. -/
def apply (pc : Z → T) (green : G → T) (φ : F → T) (z : Z) (g : G) (a : F) : T :=
  pc z - green g + φ a

-- RegulatorComparison.first
example (pc : Z → T) (green : G → T) (φ : F → T) (z : Z) (g0 : G) (a0 : F)
    (hg : green g0 = 0) (hφ : φ a0 = 0) : apply pc green φ z g0 a0 = pc z := by
  sorry

-- RegulatorComparison.third
example (pc : Z → T) (green : G → T) (φ : F → T) (z0 : Z) (g0 : G) (a : F)
    (hp : pc z0 = 0) (hg : green g0 = 0) : apply pc green φ z0 g0 a = φ a := by
  sorry

-- RegulatorComparison.middle_sign
example (pc : Z → T) (green : G → T) (φ : F → T) (z0 : Z) (g : G) (a0 : F)
    (hp : pc z0 = 0) (hφ : φ a0 = 0) : apply pc green φ z0 g a0 = -green g := by
  sorry
end RegulatorComparison

namespace EllipticTrilog
/-- A full oriented real lattice; positivity is the actual nondegeneracy condition. -/
structure OrientedLattice where
  u : ℂ
  v : ℂ
  positiveArea : 0 < (star u * v).im

def area (L : OrientedLattice) : ℝ := (star L.u * L.v).im
def latticePoint (L : OrientedLattice) (k : ℤ × ℤ) : ℂ :=
  (k.1 : ℂ) * L.u + (k.2 : ℂ) * L.v
def character (L : OrientedLattice) (γ z : ℂ) : ℂ :=
  Complex.exp ((2 * Real.pi * (z * star γ).im / area L : ℝ) * Complex.I)

def summand (L : OrientedLattice) (x y z : ℂ) (k : (ℤ × ℤ) × (ℤ × ℤ)) : ℂ :=
  let γ₁ := latticePoint L k.1
  let γ₂ := latticePoint L k.2
  let γ₃ := -γ₁ - γ₂
  if γ₁ = 0 ∨ γ₂ = 0 ∨ γ₃ = 0 then 0 else
    character L γ₁ x * character L γ₂ y * character L γ₃ z *
      (star γ₃ - star γ₂) / ((‖γ₁‖ ^ 2 * ‖γ₂‖ ^ 2 * ‖γ₃‖ ^ 2 : ℝ) : ℂ)

def kernel (L : OrientedLattice) (x y z : ℂ) : ℂ := ∑' k, summand L x y z k

theorem absoluteSummability (L : OrientedLattice) (x y z : ℂ) :
    Summable (fun k => ‖summand L x y z k‖) := by
  sorry

theorem periodic (L : OrientedLattice) (x y z : ℂ) (k : ℤ × ℤ) :
    kernel L (x + latticePoint L k) y z = kernel L x y z ∧
    kernel L x (y + latticePoint L k) z = kernel L x y z ∧
    kernel L x y (z + latticePoint L k) = kernel L x y z := by
  sorry

theorem translation (L : OrientedLattice) (x y z a : ℂ) :
    kernel L (x + a) (y + a) (z + a) = kernel L x y z := by
  sorry

theorem antisymmetric (L : OrientedLattice) (x y z : ℂ) :
    kernel L x z y = -kernel L x y z := by
  sorry

def divisors (L : OrientedLattice) (D F H : ℂ →₀ ℤ) : ℂ :=
  D.sum fun x nx => F.sum fun y ny => H.sum fun z nz =>
    (nx : ℂ) * (ny : ℂ) * (nz : ℂ) * kernel L x y z

def scaleLattice (L : OrientedLattice) (c : ℂ) (hc : c ≠ 0) : OrientedLattice where
  u := c * L.u
  v := c * L.v
  positiveArea := by sorry

theorem scale (L : OrientedLattice) (c : ℂ) (hc : c ≠ 0) (x y z : ℂ) :
    kernel (scaleLattice L c hc) (c * x) (c * y) (c * z) =
      (star c / ((‖c‖ ^ 6 : ℝ) : ℂ)) * kernel L x y z := by
  sorry

-- EllipticTrilog.diagonal
example (L : OrientedLattice) (x y : ℂ) : kernel L x y y = 0 := by
  sorry

-- EllipticTrilog.zero_divisor
example (L : OrientedLattice) (D F H : ℂ →₀ ℤ) :
    divisors L 0 F H = 0 ∧ divisors L D 0 H = 0 ∧ divisors L D F 0 = 0 := by
  sorry

-- EllipticTrilog.scaling_test
example (L : OrientedLattice) (x y z : ℂ) :
    kernel (scaleLattice L 2 (by norm_num)) (2*x) (2*y) (2*z) = kernel L x y z / 32 := by
  sorry
end EllipticTrilog

end TauCeti.CurveRegulator

/-! Omission manifest — exact packet names and carrier boundaries.

Polylogarithms:P.5/compact-test-forms
Declaration TestForms: For a second countable smooth oriented real m-manifold M, TestForms^k(M) consists of smooth sections of Λ^k T* M with compact support. Its topology is the locally convex inductive limit over compact K of the Fréchet spaces of sections supported in K, with all coordinate derivative seminorms. Complexification gives complex test forms; complex manifolds have their canonical orientation. Extension by zero is defined for an open embedding only for support compactly contained in that open.
Signature omitted; precise absent carrier: global smooth differential-form bundle, compact-support LF topology and manifold chart gluing (early C5).
Signature omitted — TestForms.ext: Equality of sections at every point implies equality.
Absent carrier: global smooth differential-form bundle, compact-support LF topology and manifold chart gluing (early C5).
Signature omitted — TestForms.chart: On an open finite-dimensional normed-space chart, k-forms identify with TestFunction with continuous alternating-map coefficients, with the same LF topology.
Absent carrier: global smooth differential-form bundle, compact-support LF topology and manifold chart gluing (early C5).
Signature omitted — TestForms.extendZero: Open embeddings give continuous extension by zero; identity and composition hold when the support is compactly contained.
Absent carrier: global smooth differential-form bundle, compact-support LF topology and manifold chart gluing (early C5).
Signature omitted — TestForms.d: Exterior derivative is a continuous map TestForms^k→TestForms^(k+1), with square zero.
Absent carrier: global smooth differential-form bundle, compact-support LF topology and manifold chart gluing (early C5).
Signature omitted — TestForms.empty: TestForms^k of the empty manifold is zero.
Absent carrier: global smooth differential-form bundle, compact-support LF topology and manifold chart gluing (early C5).
Signature omitted — TestForms.chart_scalar: Degree-zero real test forms on Ω are Mathlib TestFunction Ω R ∞, including its topology.
Absent carrier: global smooth differential-form bundle, compact-support LF topology and manifold chart gluing (early C5).
Signature omitted — TestForms.support_escape: Bump functions translated to disjoint balls escaping every compact subset of R do not converge to zero in the test LF topology, although they converge to zero in the compact-open smooth topology.
Absent carrier: global smooth differential-form bundle, compact-support LF topology and manifold chart gluing (early C5).

Polylogarithms:P.5/manifold-currents
Declaration ManifoldCurrent: On an oriented m-manifold M define a degree-q current as a continuous linear functional on TestForms^(m-q)(M), with real or complex coefficients as specified. Set dT(φ)=(-1)^(q+1)T(dφ). On a complex d-manifold this decomposes as ∂+bar∂ and has bidegrees (p,q). Locally L1 forms α define [α](φ)=∫ α∧φ. Pushforward exists for smooth maps proper on the support, with degree changed by the dimension difference; use holomorphic maps, whose real dimension difference is even, so d commutes. Pullback of arbitrary currents is restricted to submersions (and open embeddings); multiplication is by smooth forms, not by arbitrary currents.
Signature omitted; precise absent carrier: global TestForms continuous dual, differential/type grading, proper-support pushforward and submersion pullback.
Signature omitted — ManifoldCurrent.ext: Agreement on all test forms implies equality.
Absent carrier: global TestForms continuous dual, differential/type grading, proper-support pushforward and submersion pullback.
Signature omitted — ManifoldCurrent.ofForm: Locally L1 coefficients yield the integral current, additive and invariant under almost-everywhere equality.
Absent carrier: global TestForms continuous dual, differential/type grading, proper-support pushforward and submersion pullback.
Signature omitted — ManifoldCurrent.d_apply: dT(φ)=(-1)^(degree T+1)T(dφ); d²=0.
Absent carrier: global TestForms continuous dual, differential/type grading, proper-support pushforward and submersion pullback.
Signature omitted — ManifoldCurrent.pushforward: For holomorphic maps proper on support, pushforward is functorial and commutes with d, ∂ and bar∂.
Absent carrier: global TestForms continuous dual, differential/type grading, proper-support pushforward and submersion pullback.
Signature omitted — ManifoldCurrent.pullback: Submersions admit pullback, with identity/composition and compatibility with smooth forms.
Absent carrier: global TestForms continuous dual, differential/type grading, proper-support pushforward and submersion pullback.
Signature omitted — ManifoldCurrent.chart_top: A top-degree current in an oriented real chart is a scalar Mathlib Distribution under the complementary-degree-zero test-form identification.
Absent carrier: global TestForms continuous dual, differential/type grading, proper-support pushforward and submersion pullback.
Prototyped chart/coefficient/graded statement — ManifoldCurrent.dirac: The top-degree Dirac current δx evaluates a scalar test function at x, agreeing with Distribution.delta.
Prototyped chart/coefficient/graded statement — ManifoldCurrent.derivative_sign: The derivative of a scalar chart distribution evaluates φ as -T(∂vφ), agreeing with Distribution.lineDerivCLM.
Signature omitted — ManifoldCurrent.no_arbitrary_product: The product δ0·δ0 has no canonical product in this API; smoothing δ0 by scale ε gives squares whose mass grows like ε^(-m).
Absent carrier: global TestForms continuous dual, differential/type grading, proper-support pushforward and submersion pullback.

Polylogarithms:P.5/analytic-cycle-current
Declaration CycleCurrent: For a pure-dimensional closed complex analytic subset Y of a complex d-manifold X, integrate complementary test forms over Yreg with its complex orientation. This is locally finite and defines the closed current [Y]raw of bidegree (c,c), c=codim Y. Extend additively to integral cycles. Whenever a proper resolution of Y is supplied, it equals pushforward of its integration current; for algebraic cycles such resolutions are constructed by R09.7, and the normalised BFT current is δY=(2πi)^(-(d-c))[Y]raw.
Signature omitted; precise absent carrier: analytic cycle carrier with dimensions/multiplicities and global current integration; C0 analytic-space and R09.7 algebraic resolution interfaces.
Signature omitted — CycleCurrent.add: The current of Z+W is the sum of currents.
Absent carrier: analytic cycle carrier with dimensions/multiplicities and global current integration; C0 analytic-space and R09.7 algebraic resolution interfaces.
Signature omitted — CycleCurrent.resolution: A proper resolution computes the same raw integration current.
Absent carrier: analytic cycle carrier with dimensions/multiplicities and global current integration; C0 analytic-space and R09.7 algebraic resolution interfaces.
Signature omitted — CycleCurrent.closed: The integration current of a closed analytic cycle is d-closed.
Absent carrier: analytic cycle carrier with dimensions/multiplicities and global current integration; C0 analytic-space and R09.7 algebraic resolution interfaces.
Signature omitted — CycleCurrent.bft: In complex dimension d and codimension c the normalised current is (2πi)^(-(d-c)) times the raw current.
Absent carrier: analytic cycle carrier with dimensions/multiplicities and global current integration; C0 analytic-space and R09.7 algebraic resolution interfaces.
Signature omitted — CycleCurrent.point: In a complex curve the BFT current of a point is the ordinary Dirac current.
Absent carrier: analytic cycle carrier with dimensions/multiplicities and global current integration; C0 analytic-space and R09.7 algebraic resolution interfaces.
Signature omitted — CycleCurrent.multiplicity: The current of div(z^r) on C is rδ0 for r a positive integer.
Absent carrier: analytic cycle carrier with dimensions/multiplicities and global current integration; C0 analytic-space and R09.7 algebraic resolution interfaces.
Signature omitted — CycleCurrent.whole_space: For c=0, δX=(2πi)^(-d)[X]raw=[1] in BFT conventions.
Absent carrier: analytic cycle carrier with dimensions/multiplicities and global current integration; C0 analytic-space and R09.7 algebraic resolution interfaces.

Polylogarithms:P.5/current-resolution
Declaration currentResolution: On a second countable smooth oriented manifold the inclusion of smooth forms into currents is a quasi-isomorphism of de Rham sheaf complexes. On a complex manifold the same inclusion is a quasi-isomorphism for each Dolbeault complex, compatibly with type and conjugation. Consequently the smooth and current Dolbeault models of real Deligne theory agree after the M.8 comparison is supplied.
Signature omitted; precise absent carrier: global de Rham/Dolbeault sheaf complexes of forms and currents, their cohomology and inclusion.

Polylogarithms:P.5/poincare-lelong
Declaration poincareLelong: For a meromorphic function f on a complex manifold which does not vanish identically on any connected component, log|f| is locally L1 and (i/π)∂bar∂[log|f|]=[div f]raw. Define dd^c=(i/π)∂bar∂; this is equivalently bar∂∂[log|f|]=πi[div f]raw. On a complex curve d[darg f]=2π[div f]raw. The BFT degree-one Deligne differential is -2∂bar∂, hence d_D[-log|f|]=-δdiv f with its dimension/twist normalisation.
Signature omitted; precise absent carrier: meromorphic functions/divisors on a complex manifold and typed global ∂,bar∂ current operators; only the scalar chart Laplacian is prototyped.

Polylogarithms:P.5/admissible-chow-locus
Declaration AdmissibleChowLocus: Given P^N over C, finitely many specified simplex faces L_I and a general-position hyperplane H, let U_(c,e) be the open locus in the requested degree-e, codimension-c Chow parameter space whose cycles meet every L_I properly and have no irreducible component contained in H where the coordinate-ratio construction requires this (the zero cycle satisfies this condition vacuously). The analytic parameter space Z^c is the disjoint union over e≥0 of these finite-dimensional loci. Its incidence cycle has a proper projection to the parameter space. Face intersection maps and vertex projection maps exist only on the loci where they preserve the prescribed dimensions; their target degree is recorded.
Signature omitted; precise absent carrier: R09.2 Part II Chow parameter/incidence cycle carrier, admissible face loci and their cycle maps.
Signature omitted — AdmissibleChowLocus.points: Complex points represent effective cycles of the fixed degree with all required proper face intersections.
Absent carrier: R09.2 Part II Chow parameter/incidence cycle carrier, admissible face loci and their cycle maps.
Signature omitted — AdmissibleChowLocus.incidence: The incidence cycle projects properly to each finite-degree locus.
Absent carrier: R09.2 Part II Chow parameter/incidence cycle carrier, admissible face loci and their cycle maps.
Signature omitted — AdmissibleChowLocus.face: Proper intersection with a specified face induces its cycle map and respects iterated faces on the common domain.
Absent carrier: R09.2 Part II Chow parameter/incidence cycle carrier, admissible face loci and their cycle maps.
Signature omitted — AdmissibleChowLocus.vertex: Projection from a vertex is defined only when dimension and codimension are preserved; no unrestricted map is exported.
Absent carrier: R09.2 Part II Chow parameter/incidence cycle carrier, admissible face loci and their cycle maps.
Signature omitted — AdmissibleChowLocus.zero: The degree-zero component consists of the zero cycle and has empty incidence cycle.
Absent carrier: R09.2 Part II Chow parameter/incidence cycle carrier, admissible face loci and their cycle maps.
Signature omitted — AdmissibleChowLocus.line: For lines in P², each line distinct from every fixed one-dimensional face and avoiding every vertex meets all faces properly.
Absent carrier: R09.2 Part II Chow parameter/incidence cycle carrier, admissible face loci and their cycle maps.
Signature omitted — AdmissibleChowLocus.face_line: A line equal to a one-dimensional face fails proper intersection with that face and is excluded.
Absent carrier: R09.2 Part II Chow parameter/incidence cycle carrier, admissible face loci and their cycle maps.

Polylogarithms:P.5/logarithmic-green-forms
Declaration LogGreenForm: For smooth projective complex X, a codimension-p cycle z and Y=supp z, a logarithmic Green form is a real Deligne support representative (ω,g) of cl(z) in degree 2p: ω is smooth on X, g is smooth on X\Y, and g pulls back on an embedded resolution of (X,Y) to a logarithmic form along a normal-crossings divisor. Representatives are taken modulo the support-complex boundaries, retaining the support class, not merely the off-support equation d_Dg=ω. A basic representative has g=Σλj αj+β on a resolution, with λj divisor Green functions, αj smooth of type (p-1,p-1), restrictions ∂ and bar∂ closed, and β smooth.
Signature omitted; precise absent carrier: early M.8 support Deligne classes and logarithmic representatives on embedded resolutions.
Signature omitted — LogGreenForm.class: The support Deligne class is cl(z), with the specified Tate twist.
Absent carrier: early M.8 support Deligne classes and logarithmic representatives on embedded resolutions.
Signature omitted — LogGreenForm.basic: Every Green-form class has a basic logarithmic representative as stated.
Absent carrier: early M.8 support Deligne classes and logarithmic representatives on embedded resolutions.
Signature omitted — LogGreenForm.refine: Passing to a common resolution does not change its class.
Absent carrier: early M.8 support Deligne classes and logarithmic representatives on embedded resolutions.
Signature omitted — LogGreenForm.change: Adding a support-complex boundary changes the representative but not its Green-form class.
Absent carrier: early M.8 support Deligne classes and logarithmic representatives on embedded resolutions.
Signature omitted — LogGreenForm.principal: For a rational function f, (0,-log|f|) is the Green representative for div f in BFT conventions.
Absent carrier: early M.8 support Deligne classes and logarithmic representatives on embedded resolutions.
Signature omitted — LogGreenForm.zero: The zero cycle admits the zero pair.
Absent carrier: early M.8 support Deligne classes and logarithmic representatives on embedded resolutions.
Signature omitted — LogGreenForm.residue_required: On P¹ the zero form on the complement of a nonzero point satisfies d_Dg=0 there but is not a Green representative for that point: its support class is zero.
Absent carrier: early M.8 support Deligne classes and logarithmic representatives on embedded resolutions.

Polylogarithms:P.5/logarithmic-current-estimate
Declaration logarithmicCurrentEstimate: Let Y have codimension p in a complex manifold X, and let α be a degree-r logarithmic form along Y, defined through a resolution of (X,Y). If r<2p, α is locally L1. If r<2p-1, d[α]=[dα]. In the borderline Green degree, a basic Green representative (ω,g) of cl(z) satisfies d_D[g]+δz=[ω]. These conclusions apply to currents modulo those annihilating test forms vanishing along the boundary used by the normalised cubical model.
Signature omitted; precise absent carrier: logarithmic form weight filtration, resolution pullback, local integrability and current residue on a global manifold.

Polylogarithms:P.5/green-current-comparison
Declaration greenCurrentComparison: For smooth projective complex X and a codimension-p cycle z, the map from logarithmic Green-form classes for z to Green current classes for z is an isomorphism. In BFT conventions its image satisfies d_D[g]+δz=[ω]; in unscaled conventions dd^c[g]+[z]raw is smooth. The map respects addition and pullback along morphisms for which the cycle pullback is defined and codimension p is preserved. No pullback of an arbitrary current is asserted.
Signature omitted; precise absent carrier: logarithmic Green-form quotient, current ∂/bar∂ quotient and their translation spaces.

Polylogarithms:P.5/green-presentation
Declaration GreenCH: For a smooth projective complex X and p≥1, define GreenCH^p(X) as the abelian group of pairs (z,g), z an integral codimension-p cycle and g a real (p-1,p-1) raw current, with dd^c g+[z]raw smooth, modulo (0,∂u+bar∂v) with the required real condition and principal pairs (div_Y f,-ιY*log|f|), where Y has codimension p-1 and the pushforward uses a resolution if Y is singular. Here dd^c=(i/π)∂bar∂=bar∂∂/(πi). This is the degree-zero complex-variety presentation of G05 equation (38), which was equation (36) in the preprint; it does not define arithmetic Chow groups of an arbitrary arithmetic ring.
Signature omitted; precise absent carrier: integral cycle group, real (p-1,p-1) global currents, smooth curvature and principal-cycle relation subgroup.
Signature omitted — GreenCH.mk: A pair satisfying the Green condition determines a class.
Absent carrier: integral cycle group, real (p-1,p-1) global currents, smooth curvature and principal-cycle relation subgroup.
Signature omitted — GreenCH.forget: Forget the Green current to obtain CH^p(X), respecting principal relations.
Absent carrier: integral cycle group, real (p-1,p-1) global currents, smooth curvature and principal-cycle relation subgroup.
Signature omitted — GreenCH.curvature: Curvature dd^c g+[z]raw is a well-defined smooth closed (p,p) form on the quotient.
Absent carrier: integral cycle group, real (p-1,p-1) global currents, smooth curvature and principal-cycle relation subgroup.
Signature omitted — GreenCH.principal: The principal pair on every codimension-(p-1) Y has zero class.
Absent carrier: integral cycle group, real (p-1,p-1) global currents, smooth curvature and principal-cycle relation subgroup.
Signature omitted — GreenCH.current_boundary: Adding ∂u+bar∂v does not change the class.
Absent carrier: integral cycle group, real (p-1,p-1) global currents, smooth curvature and principal-cycle relation subgroup.
Signature omitted — GreenCH.P1_principal: On P¹, ([0]-[∞],-log|z|) represents zero.
Absent carrier: integral cycle group, real (p-1,p-1) global currents, smooth curvature and principal-cycle relation subgroup.
Signature omitted — GreenCH.point: GreenCH^1(Spec C)=0: cycles vanish and principal pairs for constant f kill every real constant Green function.
Absent carrier: integral cycle group, real (p-1,p-1) global currents, smooth curvature and principal-cycle relation subgroup.
Signature omitted — GreenCH.positive_curvature: A pair on P¹ with z=[0] and curvature integral one cannot be zero, whereas a principal pair has zero curvature.
Absent carrier: integral cycle group, real (p-1,p-1) global currents, smooth curvature and principal-cycle relation subgroup.

Polylogarithms:P.5/gersten-green-assembly
Declaration gerstenGreenAssembly: For smooth projective complex X, identify the parent degree-zero higher Arakelov group with GreenCH^p(X), using the graph morphism from the final Gersten terms ⊕_(codim p-2) Λ² C(Y)*→⊕_(codim p-1) C(Y)*→Z^p(X) into the Bloch cycle complex. The requested input is an isomorphism on the last two cohomology groups, together with its compatible tame-symbol/divisor differential; no quasi-isomorphism of the entire complexes is asserted.
Signature omitted; precise absent carrier: M.4 final Gersten graph comparison in two cohomology degrees and the parent Arakelov cone cohomology.

Polylogarithms:P.5/mixed-wang-forms
Declaration MixedWangForm.apply: On (P¹)^n×P^m define M_(n,m)=T_(n+m)(y1/x1,…,yn/xn,z1/z0,…,zm/z0), with M_(0,0)=1. Its current differential is the sum of cubical face currents with signs (-1)^(i+j) and simplicial face currents with signs (-1)^(n+i). It restricts to Wn when m=0 and to Gm when n=0. It vanishes on every ratio-one cubical boundary.
Concrete restricted model above; global specialization still needs: global current extension and its face differential; only ordered concatenation of logarithmic jets is prototyped.
Prototyped chart/coefficient/graded statement — MixedWangForm.apply: The form is T on the ordered concatenation of cube and simplex ratios.
Prototyped chart/coefficient/graded statement — MixedWangForm.cube: M_(n,0)=Wn.
Prototyped chart/coefficient/graded statement — MixedWangForm.simplex: M_(0,m)=Gm.
Signature omitted — MixedWangForm.boundary: d_D[M_(n,m)] has the cube signs (-1)^(i+j) and simplex signs (-1)^(n+i).
Absent carrier: global current extension and its face differential; only ordered concatenation of logarithmic jets is prototyped.
Prototyped chart/coefficient/graded statement — MixedWangForm.origin: M_(0,0)=1.
Prototyped chart/coefficient/graded statement — MixedWangForm.one_each: M_(1,1) equals T2 of the two coordinate logarithmic jets, with coefficient one in the explicit T2 formula.
Prototyped chart/coefficient/graded statement — MixedWangForm.ratio_one: The restriction to y1/x1=1 is zero, whereas evaluation at a nonconstant ratio need not vanish.

Polylogarithms:P.5/mixed-regulator
Declaration MixedRegulator: For the M.4 admissible mixed codimension-p cycle complex on X×□^n×Δ^m, use Δ^m=P^m minus {Σ_(i=0)^m zi=0}. Define Pcs(Z)=πX*(δZ∧M_(n,m)) through projective closure and resolution, in Deligne degree 2p-n-m. The mixed total boundary is δ+(-1)^n∂. The map is a chain map and restricts along the M.4 cubical and simplicial inclusions ic,is to Pc and Ps. To identify the parent simplex convention Σ_(i=1)^m zi=z0 use z0↦-z0; constant factors -1 do not change logarithmic jets.
Signature omitted; precise absent carrier: M.4 mixed admissible cycle complex and global current target, with both face directions.
Signature omitted — MixedRegulator.cycle: An admissible mixed generator maps to its resolved M current pushed to X.
Absent carrier: M.4 mixed admissible cycle complex and global current target, with both face directions.
Signature omitted — MixedRegulator.degree: Bidegree (n,m) maps to Deligne degree 2p-n-m.
Absent carrier: M.4 mixed admissible cycle complex and global current target, with both face directions.
Signature omitted — MixedRegulator.chain: d_D Pcs=Pcs(δ+(-1)^n∂).
Absent carrier: M.4 mixed admissible cycle complex and global current target, with both face directions.
Signature omitted — MixedRegulator.restrict: Pcs∘ic=Pc and Pcs∘is=Ps in the same BFT model.
Absent carrier: M.4 mixed admissible cycle complex and global current target, with both face directions.
Signature omitted — MixedRegulator.axes: At (n,0) the map equals Pc, and at (0,m) it equals Ps.
Absent carrier: M.4 mixed admissible cycle complex and global current target, with both face directions.
Signature omitted — MixedRegulator.degree_test: For p=2,n=1,m=1 the target degree is 2, rather than 3.
Absent carrier: M.4 mixed admissible cycle complex and global current target, with both face directions.
Signature omitted — MixedRegulator.origin: At (0,0) an admissible cycle maps to δZ.
Absent carrier: M.4 mixed admissible cycle complex and global current target, with both face directions.

Polylogarithms:P.5/simplicial-cubical-comparison
Declaration simplicialCubicalComparison: For smooth projective complex X, the M.4 mixed-cycle inclusions is and ic are quasi-isomorphisms and identify the homology maps of Ps and Pc through Pcs. The simplicial regulator is the parent Goncharov cycle formula evaluated in the BFT normalised current model. The additional degreewise conversion from the parent raw G05 model is a separate recorded gap.
Signature omitted; precise absent carrier: M.4 mixed-inclusion quasi-isomorphisms and induced higher Chow regulator maps.

Polylogarithms:P.5/beilinson-comparison-assembly
Declaration beilinsonComparisonAssembly: For every smooth projective complex variety X and n≥0, the direct sum of the BFT-normalised simplicial regulators CH_s^p(X,n)_Q→H_D^(2p-n)(X,R(p)), composed with the M.6 rational higher Chern character K_n(X)_Q→⊕pCH_s^p(X,n)_Q, equals the M.8 universal Beilinson regulator. This is the precise content and hypothesis range of BFT Theorem 6.18. Identification with every raw parent convention is conditional on the recorded model-conversion gap.
Signature omitted; precise absent carrier: M.6 rational higher Chern character and early M.8 Beilinson regulator in the same normalization.

Polylogarithms:P.5/curve-symbol-chern-comparison
Declaration curveSymbolChernComparison: For a smooth projective geometrically integral curve X over C and a rational K2 class represented by Σj{fj,gj} with vanishing tame symbols in κ(x)*⊗Q, its weight-two real Deligne regulator is represented by iΣjη(fj,gj), η(f,g)=log|f|darg g-log|g|darg f, in the M.8 differential-form model. With ch_(i,j)=(-1)^(j-1)c_(i,j)/(j-1)!, ch_(2,2)=-c_(2,2); multiplicativity and the Chern product coefficient -1 give the positive unit cup product. This fixes the general curve formula once, without adding the elliptic embedding, period or rational-orientation choices owned by ER.2.
Signature omitted; precise absent carrier: rational Quillen K2 and its tame kernel, M.8 Deligne hypercohomology/cup product/Chern character, parent global η current.

Polylogarithms:P.5/weight-three-relation-descent
Declaration weightThreeRelationDescent: On a smooth complex curve, the parent formula ρ2({f}2⊗g)=D(f)darg g-(1/3)α(1-f,f)log|g|, α(a,b)=log|a|dlog|b|-log|b|dlog|a|, is compatible with the B2 functional relations and is additive in g. Thus it defines the middle map of the imported weight-three curve polylogarithmic complex. Under the G00 convention Lhat2=iD and α_G00=-α, r3(2)=-ρ2. The neighbouring map is r3(1)=L3, whereas the parent diagonal relation is ρ2({f}2⊗f)=-dL3(f).
Signature omitted; precise absent carrier: imported B2 relation quotient, function-field tensor complex, single-valued D/L3 and global logarithmic current form.

Polylogarithms:P.5/weight-three-motivic-comparison
Declaration weightThreeMotivicComparison: Let X be a smooth projective geometrically integral curve over a number field F. The imported rational map c_(2,3):K4(F(X))_Q→H²Γ(F(X),3)_Q is compatible with Quillen residues K3(κ(x))_Q→H¹Γ(κ(x),2)_Q and with the real Deligne regulator. The resulting unramified class from K4(X)_Q has the curve regulator represented by r3(2)=-ρ2 in the D96 convention. The diagram is a compatibility statement, not an isomorphism on K4. The generic-field construction remains subject to the imported P.3 proof gap.
Signature omitted; precise absent carrier: P.3 K4 comparison, rational polylogarithmic cohomology, Quillen residues and M.8 Deligne regulator.

Polylogarithms:P.5/generalized-elliptic-trilogarithm
Declaration EllipticTrilog.kernel: Let Λ=Zu+Zv⊂C with A=Im(conj(u)v)>0 and E(C)=C/Λ. For γ∈Λ set χγ(z)=exp(2πi Im(z conjγ)/A). Define K3(x,y,z)=Σ′_(γ1+γ2+γ3=0) χγ1(x)χγ2(y)χγ3(z)(conjγ3-conjγ2)/(|γ1|²|γ2|²|γ3|²), excluding each zero γ. Equivalently sum over two independent Z² indices with γ3=-γ1-γ2. The sum is absolutely convergent and descends to E³. Extend separately linearly to finite integral divisors in each argument. This three-point weight-three kernel is the generalized elliptic trilogarithmic series in D96, not a one-variable weight-two series.
Concrete restricted model above; global specialization still needs: quotient elliptic-curve uniformization and divisor lifts; the lifted explicit lattice kernel, divisor sums and invariance signatures are prototyped.
Prototyped chart/coefficient/graded statement — EllipticTrilog.kernel: The explicit absolutely convergent two-index sum defines K3.
Prototyped chart/coefficient/graded statement — EllipticTrilog.periodic: Adding a lattice element to any argument leaves K3 unchanged.
Prototyped chart/coefficient/graded statement — EllipticTrilog.translation: K3(x+a,y+a,z+a)=K3(x,y,z).
Prototyped chart/coefficient/graded statement — EllipticTrilog.antisymmetric: K3(x,z,y)=-K3(x,y,z), hence K3(x,y,y)=0.
Prototyped chart/coefficient/graded statement — EllipticTrilog.divisors: Finite integral divisors are evaluated by the trilinear finite sum.
Prototyped chart/coefficient/graded statement — EllipticTrilog.scale: Scaling Λ,x,y,z by λ≠0 multiplies K3 by conjλ/|λ|⁶.
Prototyped chart/coefficient/graded statement — EllipticTrilog.diagonal: K3(x,y,y)=0, by exchanging the second and third summation variables.
Prototyped chart/coefficient/graded statement — EllipticTrilog.zero_divisor: Evaluation on a zero divisor is zero in every slot.
Prototyped chart/coefficient/graded statement — EllipticTrilog.scaling_test: For a positive real scale 2, K3_(2Λ)(2x,2y,2z)=K3_Λ(x,y,z)/32; a weight-two single-index kernel has the wrong exponent.

Polylogarithms:P.5/elliptic-trilogarithm-summability
Declaration EllipticTrilog.absoluteSummability: For every oriented full lattice Λ in C, the absolute values of the K3 summands over (γ1,γ2)∈Λ² with γ1γ2(γ1+γ2)≠0 are summable, uniformly in x,y,z because all characters have modulus one. Consequently the divisor sum, index permutations, lattice-lift invariance and the scaling identity may be evaluated by absolutely convergent rearrangement.
Concrete restricted model above; global specialization still needs: no absent carrier for the explicit lifted-lattice summability signature; the analytic proof is unproved.

Polylogarithms:P.5/weight-three-pairing
Declaration weightThreePairing: For a smooth projective complex curve X, nonzero meromorphic f,1-f,g and a holomorphic or antiholomorphic one-form ω, the locally integrable parent regulator satisfies ∫X ρ2({f}2⊗g)∧ω=-(4/3)∫X log|g|α(1-f,f)∧ω. For r3(2)=-ρ2 the scalar is +4/3. The identities hold termwise, without requiring Σ(1-f)∧f∧g=0; that condition enters the subsequent divisor-only Fourier formula.
Signature omitted; precise absent carrier: global meromorphic functions, Bloch–Wigner form, locally integrable current pairing and holomorphic/antiholomorphic global one-forms.

Polylogarithms:P.5/elliptic-fourier-comparison
Declaration ellipticFourierComparison: Let E=C/(Zu+Zv), A=Im(conj(u)v)>0, with positive complex orientation and dz the lifted holomorphic form. For a finite rational symbol cycle Σj{fj}2⊗gj with Σj(1-fj)∧fj∧gj=0 in Λ³(C(E)*⊗Q), put Dj=div gj, Fj=div fj, Hj=div(1-fj). In the explicit character and area convention of K3, the target comparison is Σj∫E log|gj|α(1-fj,fj)∧dbarz = iA³/(4π²) ΣjK3(Dj,Fj,Hj), and hence Σj∫Eρ2({fj}2⊗gj)∧dbarz = -iA³/(3π²)ΣjK3(Dj,Fj,Hj). The constants are derived using ordinary area, not copied from D96’s implicit normalization; rigorous Fourier regularisation and source collation are recorded proof gaps.
Signature omitted; precise absent carrier: elliptic uniformization, meromorphic divisor/symbol complex and current integral; Fourier regularization and normalization collation remain proof gaps.

Polylogarithms:P.5/bft-current-dictionary
Declaration bftCurrentDictionary: On a smooth projective complex d-fold, the BFT form current is [α](ω)=(2πi)^(-d)∫ω∧α, and its codimension-p cycle current is δY=(2πi)^(-(d-p))∫Yω. Below Deligne degree 2p a degree-k cochain has ordinary form degree k-1 and twist p-1; the top degree uses closed (p,p) currents of twist p. The top differential is -2∂bar∂=2bar∂∂. Apply the requested M.8 Dolbeault real Deligne functor to the smooth/current quasi-isomorphism to identify cohomology with H_D. This pins the BFT model. Identification of the parent raw simplicial regulator with this normalised map still requires its separate degreewise sign/scale dictionary, recorded as a gap.
Signature omitted; precise absent carrier: early M.8 Deligne models, Tate twists, smooth/current inclusion and global current degrees.

Polylogarithms:P.5/wang-forms
Declaration WangForm.coefficients: For a Dolbeault algebra A and u1,…,um∈D¹(A,1), set S_m^i=(-2)^m Alt(u1∂u2∧…∧∂ui∧bar∂u_(i+1)∧…∧bar∂um), with Alt the unaveraged signed permutation sum. Define T0=1 and Tm=(2m!)^(-1)Σ_(i=1)^m(-1)^i S_m^i. It lies in D^m(A,m), ordinary degree m-1 for m>0. For rational functions use uj=-log|fj|, with ∂uj=-½dlog fj and bar∂uj=-½dbarlog fj. Define Wm=Tm(y1/x1,…,ym/xm) and Gm=Tm(z1/z0,…,zm/z0).
Concrete restricted model above; global specialization still needs: global Dolbeault/Deligne algebra and its rational-function jets; the entire coefficient polynomial and its algebraic naturality are prototyped.
Prototyped chart/coefficient/graded statement — WangForm.coefficients: The pointwise finite polynomial takes real u-values and holomorphic/antiholomorphic degree-one components, with exactly (-2)^m/(2m!) and signs (-1)^i.
Prototyped chart/coefficient/graded statement — WangForm.one: T1(u)=u; for f this is -log|f|.
Prototyped chart/coefficient/graded statement — WangForm.two: T2(u,v)=u(∂v-bar∂v)-v(∂u-bar∂u).
Prototyped chart/coefficient/graded statement — WangForm.alternating: Permuting inputs multiplies Tm by the permutation sign.
Prototyped chart/coefficient/graded statement — WangForm.pullback: Pullback by a Dolbeault-algebra morphism commutes with Tm, Wm and Gm.
Prototyped chart/coefficient/graded statement — WangForm.unit_function: For m>0, Tm(f1,…,1,…,fm)=0.
Prototyped chart/coefficient/graded statement — WangForm.test_one: T1 with u=3 and zero derivatives is 3, rather than -3 or 6.
Prototyped chart/coefficient/graded statement — WangForm.test_two: For u=1,v=0, ∂u=bar∂u=bar∂v=0 and ∂v=a, the pointwise T2 is the degree-one form a.
Prototyped chart/coefficient/graded statement — WangForm.test_zero: T0=1; a tuple containing the zero jet (the logarithmic jet of the constant function 1) gives zero for m>0.

Polylogarithms:P.5/wang-differential
Declaration wangDifferential: For u_j∈D¹(A,1), Tm is (1/m!) times the alternating right-nested Deligne product uσ1•(uσ2•…•uσm), and d_D Tm=Σ_(j=1)^m(-1)^(j-1)d_Duj•T_(m-1)(u1,…,omit uj,…,um). The nesting is retained: the Deligne product is associative up to homotopy rather than strictly associative.
Signature omitted; precise absent carrier: typed global ∂,bar∂ and Deligne differential/product, including its homotopy associativity.

Polylogarithms:P.5/r-wang-comparison
Declaration rWangComparison: For nonzero rational functions f1,…,fm, Tm(-log|f1|,…,-log|fm|)=(-1)^m r_(m-1)(f1,…,fm), where the parent r-form uses unaveraged Alt and coefficients 1/((2j+1)!(m-2j-1)!). Equality is of the off-divisor forms and of their locally integrable extension currents. In particular T1=-r0, T2=r1=iη, and T3=-r2.
Signature omitted; precise absent carrier: parent global logarithmic r forms and their locally integrable current extension.

Polylogarithms:P.5/wang-boundary-currents
Declaration wangBoundaryCurrents: For rational functions on a smooth projective complex variety, in the BFT normalisation d_D[Tm]=-[T_(m-1)]∘Res, with the exterior residue placing the uniformiser first and T0=1. On (P¹)^m this gives d_D[Wm]=Σ_(i=1)^mΣ_(j=0,1)(-1)^(i+j)(δ_i^j)*[W_(m-1)], with j=0 the zero face and j=1 the infinity face. For Gm on P^m, d_D[Gm]=Σ_(i=0)^m(-1)^i(∂i)*[G_(m-1)]. The restriction of Wm to a holomorphic map factoring through any ratio-one boundary is zero.
Signature omitted; precise absent carrier: global Wang currents, cubical/simplicial embeddings and exterior-residue current pushforward.

Polylogarithms:P.5/cubical-regulator
Declaration CubicalRegulator: For smooth projective complex X and an admissible integral codimension-p cycle Z in X×□^m, □=P¹\{1}, let Zbar be its projective closure and ι:Ztilde→X×(P¹)^m a resolution. Define Pc(Z)=πX*ι*[Tm of the restricted coordinate functions]=πX*(δZ∧Wm) in τ≤2p D_D^(2p-m)(X,p), with the BFT current twists. The product notation is defined through resolution and integration, not by an arbitrary current product. Extend linearly on the M.4 normalised cube complex ∩ker(infinity faces), with differential δ=Σ_i(-1)^i zero-face_i. Pc is independent of resolution and is a chain map.
Signature omitted; precise absent carrier: M.4 admissible normalized cycles, R09.7 resolution and early M.8 Deligne-current complex.
Signature omitted — CubicalRegulator.cycle: An admissible generator maps to πX* of its resolved Wang current.
Absent carrier: M.4 admissible normalized cycles, R09.7 resolution and early M.8 Deligne-current complex.
Signature omitted — CubicalRegulator.resolution: Different resolutions give the same current.
Absent carrier: M.4 admissible normalized cycles, R09.7 resolution and early M.8 Deligne-current complex.
Signature omitted — CubicalRegulator.boundary: d_D Pc(Z)=Pc(δZ) on the normalised complex.
Absent carrier: M.4 admissible normalized cycles, R09.7 resolution and early M.8 Deligne-current complex.
Signature omitted — CubicalRegulator.zero_degree: Pc at m=0 is the BFT cycle current.
Absent carrier: M.4 admissible normalized cycles, R09.7 resolution and early M.8 Deligne-current complex.
Signature omitted — CubicalRegulator.point: For a point on a complex curve in m=0 the image is its Dirac current.
Absent carrier: M.4 admissible normalized cycles, R09.7 resolution and early M.8 Deligne-current complex.
Signature omitted — CubicalRegulator.P1_unit: For the degree-one point t=a of □ with a≠0,1,∞ and X a point, Pc(a)=-log|a|.
Absent carrier: M.4 admissible normalized cycles, R09.7 resolution and early M.8 Deligne-current complex.
Signature omitted — CubicalRegulator.face_excluded: A component lying in t=0 is not an admissible input; assigning log 0 to it is not a regulator extension.
Absent carrier: M.4 admissible normalized cycles, R09.7 resolution and early M.8 Deligne-current complex.

Polylogarithms:P.5/bft-auxiliary-complex
Declaration BFTAuxiliary.Degree: With M.8 logarithmic Deligne complexes and M.4 admissible cube supports, form DA^(r,-m)=τ≤2p Dlog^r(X×□^m,p), take infinity-face normalisation, and totalise with d_D+(-1)^rδ. Let DA_Z be the corresponding support cone s(Dlog(X×□^m)→Dlog((X×□^m)\Z)), and Hp_m its top support cohomology H_D,Z^(2p). Use the standard maps g1:DA_Z^(2p-*)→Hp_* and ρ:DA_Z→DA. Fix cochain grading: DA_H^q=DA_Z^(q+1)⊕Hp^q⊕DA^q. Define DA_H as the shifted simple of Hp←g1 DA_Z→ρ DA: d(a1,a2,a3)=(-da1, da2+g1a1, da3-ρa1). Its maps are β(α)=(0,0,α) and the cycle map z↦(0,cl(z),0).
Concrete restricted model above; global specialization still needs: early M.8 support cones/purity, M.4 normalized cube support diagram and top cohomology classes; only the genuine graded additive-group simple and β are prototyped.
Prototyped chart/coefficient/graded statement — BFTAuxiliary.differential: The three-coordinate differential is exactly the one in the statement.
Prototyped chart/coefficient/graded statement — BFTAuxiliary.beta: β includes DA as the third coordinate and is a quasi-isomorphism.
Signature omitted — BFTAuxiliary.cycle: In the fixed (support,cycle,base) order, a cycle z maps to (0,cl(z),0).
Absent carrier: early M.8 support cones/purity, M.4 normalized cube support diagram and top cohomology classes; only the genuine graded additive-group simple and β are prototyped.
Signature omitted — BFTAuxiliary.purity: Top support Deligne cohomology is the admissible cycle group tensored with R; g1 is the induced top-class projection.
Absent carrier: early M.8 support cones/purity, M.4 normalized cube support diagram and top cohomology classes; only the genuine graded additive-group simple and β are prototyped.
Prototyped chart/coefficient/graded statement — BFTAuxiliary.beta_sign: d(0,0,α)=(0,0,dα), so β is a cochain map.
Prototyped chart/coefficient/graded statement — BFTAuxiliary.square: For chain maps g1 and ρ, the displayed differential squares to zero on each of the three summands.
Signature omitted — BFTAuxiliary.point_top: For X a point and p=m=0, the top support cycle class is R and sends the integral generator to 1.
Absent carrier: early M.8 support cones/purity, M.4 normalized cube support diagram and top cohomology classes; only the genuine graded additive-group simple and β are prototyped.

Polylogarithms:P.5/integration-comparison
Declaration WangIntegration: For DA^(r,-m), define φ(α)=πX*[α•Wm] in Deligne degree r-m. The product uses the M.8 fixed Deligne product and has ordinary degree r+m-1 before projection, except at m=0,r=2p, where the top Deligne cochain is an ordinary degree-2p form and W0=1 preserves that degree. On the infinity-face normalised DA complex this lands in smooth τ≤2p D(X,p), is a cochain map and a quasi-inverse of the base inclusion τD(X,p)→DA(X,p)_0.
Signature omitted; precise absent carrier: logarithmic Deligne forms, the fixed Deligne product, current integration and the normalized auxiliary complex.
Signature omitted — WangIntegration.apply: φ(α)=πX*[α•Wm].
Absent carrier: logarithmic Deligne forms, the fixed Deligne product, current integration and the normalized auxiliary complex.
Signature omitted — WangIntegration.chain: φ commutes with the total d_D+(-1)^rδ differential.
Absent carrier: logarithmic Deligne forms, the fixed Deligne product, current integration and the normalized auxiliary complex.
Signature omitted — WangIntegration.base: At m=0, φ is the normalised smooth-form inclusion into currents.
Absent carrier: logarithmic Deligne forms, the fixed Deligne product, current integration and the normalized auxiliary complex.
Signature omitted — WangIntegration.inverse: On cohomology φ is inverse to base inclusion.
Absent carrier: logarithmic Deligne forms, the fixed Deligne product, current integration and the normalized auxiliary complex.
Signature omitted — WangIntegration.base_test: φ at m=0 has current evaluation (2πi)^(-dim X)∫ω∧α.
Absent carrier: logarithmic Deligne forms, the fixed Deligne product, current integration and the normalized auxiliary complex.
Signature omitted — WangIntegration.zero: φ(0)=0 in every bidegree.
Absent carrier: logarithmic Deligne forms, the fixed Deligne product, current integration and the normalized auxiliary complex.
Signature omitted — WangIntegration.degree: An input of bidegree (r,-m) has output Deligne degree r-m, not r+m. At m=0,r=2p (in particular p=1,r=2), W0 preserves the ordinary top degree 2p, rather than the lower-degree formula 2p-1.
Absent carrier: logarithmic Deligne forms, the fixed Deligne product, current integration and the normalized auxiliary complex.

Polylogarithms:P.5/green-wang-product
Declaration greenWangProduct: For a normalised support representative (ω,g) of degree r over X×□^m, the form g•Wm is locally L1. At r=2p, if cl(ω,g)=cl(z), d_D[g•Wm]=[ω•Wm]-δz•Wm-[δg•W_(m-1)]. At r<2p, d_D[g•Wm]=[d_Dg•Wm]+(-1)^(r-1)[δg•W_(m-1)]. Face sums in δ use the normalised cube differential and support changes. The expression δz•Wm is the resolved cycle current of Pc.
Signature omitted; precise absent carrier: global logarithmic Green representatives, Wang-current products defined on resolutions and their face residues.

Polylogarithms:P.5/regulator-homotopy
Declaration RegulatorComparison.apply: On DA_H^(2p-*) define ψ((ω,g),z,α)=Pc(z)-πX*[g•Wm]+φ(α), in the fixed (support,cycle,base) coordinate order, with the bidegree of the support representative specifying m. This is a cochain map to τD_D^(2p-*) and satisfies ψ∘cycle=Pc and ψ∘β=φ. Thus Pc and the Burgos–Feliu support regulator agree on higher Chow homology through the common support complex.
Concrete restricted model above; global specialization still needs: the specialized auxiliary support complex and the actual Pc/Green/φ maps; only the pointwise three-term formula is prototyped.
Prototyped chart/coefficient/graded statement — RegulatorComparison.apply: ψ is Pc minus the Green integral plus φ, with the specified grading.
Signature omitted — RegulatorComparison.chain: ψ commutes with the three-coordinate differential.
Absent carrier: the specialized auxiliary support complex and the actual Pc/Green/φ maps; only the pointwise three-term formula is prototyped.
Signature omitted — RegulatorComparison.cycle: ψ(0,z,0)=Pc(z) in the fixed (support,cycle,base) order.
Absent carrier: the specialized auxiliary support complex and the actual Pc/Green/φ maps; only the pointwise three-term formula is prototyped.
Signature omitted — RegulatorComparison.beta: ψ(0,0,α)=φ(α).
Absent carrier: the specialized auxiliary support complex and the actual Pc/Green/φ maps; only the pointwise three-term formula is prototyped.
Prototyped chart/coefficient/graded statement — RegulatorComparison.first: On a pure cycle the comparison gives Pc.
Prototyped chart/coefficient/graded statement — RegulatorComparison.third: On a pure third-coordinate form the comparison gives φ.
Prototyped chart/coefficient/graded statement — RegulatorComparison.middle_sign: On ((ω,g),0,0) in the fixed coordinate order the value is -πX*[g•Wm], rather than its positive.

Polylogarithms:P.5/cubical-beilinson
Declaration cubicalBeilinson: For smooth projective complex X and p,n≥0, Pc:CH_c^p(X,n)→H_D^(2p-n)(X,R(p)) agrees with the Burgos–Feliu support regulator. After the M.6 rational Chern character K_n(X)_Q≅⊕pCH^p(X,n)_Q and the M.8 universal Chern normalisation, its direct sum is Beilinson’s regulator. This does not redefine the universal Chern classes in P.5.
Signature omitted; precise absent carrier: M.4 higher Chow homology, M.6 rational K/Chern character and early M.8 universal regulator.

Local analytic-cycle closedness still needs the recorded El Mir positive-current/
pluripolar extension interface; Poincaré–Lelong needs the normal-current support
theorem with its order-zero hypotheses. These are not supplied by the scalar chart model.

The fixed auxiliary coordinate order is (support,cycle,base); the finite
RegulatorComparison.apply helper accepts its inputs in term order (cycle,Green,base).
BFTAuxiliary.beta is only the graded inclusion here; its quasi-isomorphism API
requires the omitted purity diagram. Global Wang pullback similarly requires the
Dolbeault morphism, beyond the coefficient-level ExteriorAlgebra.map statement.
-/
