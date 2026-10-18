/-
This file is not the roadmap and is not exhaustive. The companion roadmap document
research/blueprint/readmes/FunctionFieldArithmeticPartII.md is definitive: it states
all targets, hypotheses, prerequisites, APIs, checks, worked examples and sources.
These suggested forms coordinate names and signatures; no implementation is claimed.

Atlas pins: Tau Ceti f790474821cf4256814db967cb154e7af3d0c369;
Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174.

The ten reviewed fragments are joined in layer order. Only light definitions over
existing native carriers, milestone signatures and representative examples remain.
In particular, the former large parent prototype, GC.2's diagonal/action/functor
construction and GC.3's private reconstructions of existing exterior maps are README
specifications/imports. Their removal from suggested forms changes no target or test.

Omission ledger (every named target/API/test remains in the reader's layer catalogue):
RS.0: native root pullback, frame/chart equivalences, stackification and universe maps.
RS.1: native comparison with upstream finite roots, universal root, stack base change,
quotient/algebraicity/coarse, regularity and the exact DM locus. Coordinate rings below
are genuine rings, not geometric stack carriers.
RS.2: native root pseudodiagram and two-limit, finite-flat-torsor tower theorem,
coframes, fpqc quotient, DVR gerbe, Kummer H1 and non-fppf torsor comparisons.
GC.0: root Picard pseudofunctor, tensor/dual/degree coherence, frame quotient and gerbe.
The light fibre data below do not construct a groupoid or stack instance.
GC.1: relative evaluation and effective opens, incidence/smooth/coarse/fibre charts,
root addition, ordered map and Abel–Jacobi. The product below only uses native μ₂.
GC.2: generic/local frames, gluing and both signed right/double action groupoids,
Abel–Jacobi and stabilizer comparisons. Only native local-unit coordinates occur here.
GC.3: the current-library exterior comparison, monodromy lisse line, coarse model,
rational coarse comparison, twisted curve and symmetric cohomology, and pushforward
comparison. The Koszul action below is a sign twist of the existing tensor action.
GC.4: family fibre, proper scalar quotient, chart descent line and effective gluing.
GC.5: signed divisor lines, normalized all-degree character, translation and hat pullback.
GC.6: geometric root-unit sheaf/torsors, norms, based fibres and obstruction maps,
root-framed support moving, reciprocity and all-degree Frobenius character comparison.

The actual stack/Picard/torsor/lisse carriers and their native adapters are absent at
the pins. The reader and handoff retain their precise supplier frontiers, including
ASM-STACK-LISSE. No arbitrary carrier, placeholder predicate or admitted data replaces
them. Elaborating admitted proof statements certifies types, not the mathematics.
-/

import TauCeti.AlgebraicGeometry.LineBundle.Basic
import TauCeti.Algebra.Category.ModuleCat.Sheaf.Free
import TauCeti.Algebra.Category.ModuleCat.Sheaf.Invertible.LocalTriviality
import Mathlib.AlgebraicGeometry.Modules.Sheaf
import Mathlib.AlgebraicGeometry.Scheme
import Mathlib.Data.ZMod.Basic
import Mathlib.Tactic.NormNum
import Mathlib.Algebra.MvPolynomial.Basic
import Mathlib.RingTheory.AdjoinRoot
import Mathlib.RingTheory.Localization.Away.Basic
import Mathlib.RingTheory.RegularLocalRing.Defs
import Mathlib.GroupTheory.QuotientGroup.Basic
import Mathlib.RingTheory.RootsOfUnity.Basic
import Mathlib.CategoryTheory.CofilteredSystem
import Mathlib.Data.PNat.Basic
import Mathlib.Basic.Real.Basic
import Mathlib.Algebra.Field.ZMod
import Mathlib.FieldTheory.IsAlgClosed.Basic
import Mathlib.FieldTheory.RatFunc.AsPolynomial
import TauCeti.AlgebraicGeometry.LineBundle.TensorProduct
import Mathlib.Algebra.DualNumber
import Mathlib.Algebra.BigOperators.Group.Finset.Lemmas
import Mathlib.Algebra.BigOperators.Fin
import Mathlib.Data.Fin.VecNotation
import TauCeti.Algebra.AlgebraicGroup.RootsOfUnity.Scheme
import Mathlib.CategoryTheory.Action
import Mathlib.Algebra.Group.Hom.Instances
import Mathlib.Topology.Algebra.RestrictedProduct.Units
import Mathlib.Topology.Algebra.Valued.WithVal
import Mathlib.RingTheory.Valuation.ValuationSubring
import Mathlib.FieldTheory.Finite.Basic
import TauCeti.FieldTheory.FunctionField.Place.Zeros
import TauCeti.FieldTheory.FunctionField.Divisor.ProductFormula
import Mathlib.LinearAlgebra.ExteriorPower.Basic
import Mathlib.LinearAlgebra.ExteriorPower.Basis
import Mathlib.LinearAlgebra.TensorPower.Basic
import Mathlib.LinearAlgebra.Alternating.Basic
import Mathlib.RepresentationTheory.Invariants
import Mathlib.RepresentationTheory.Homological.GroupCohomology.Basic
import TauCeti.RepresentationTheory.Symmetric.TensorAction.Invariants
import Mathlib.Algebra.Ring.Pi
import TauCeti.FieldTheory.FunctionField.Divisor.Basic
import Mathlib.Algebra.Group.Subgroup.Ker
import Mathlib.Algebra.Ring.PUnit
import Mathlib.LinearAlgebra.PiTensorProduct.Finite
import Mathlib.LinearAlgebra.Trace
import Mathlib.Logic.Equiv.Fin.Rotate
import TauCeti.FieldTheory.FunctionField.Place.Approximation

noncomputable section

/-! ## RS.0 -/

open CategoryTheory AlgebraicGeometry

namespace TauCeti.RootStack.RS0NativeSuggested

universe u v

section CoordinateEndConditions

variable {B : Type u} {C : Type v} [CommRing B] [CommRing C]

/-- Native-frame-change, with the source and target frames changed by actual units. -/
theorem frameChange_equation (n : ℕ) (u a b : Bˣ) (y f : B)
    (h : (u : B) * y ^ n = f) :
    ((b * u * (a ^ n)⁻¹ : Bˣ) : B) * ((a : B) * y) ^ n = (b : B) * f := by
  sorry

/-- Native-frame-change on arrows: retain the section and the power-identification square. -/
theorem frameChange_arrow (n : ℕ) (u q w a c b : Bˣ) (y z : B)
    (hs : z = (w : B) * y) (hp : q * w ^ n = u) :
    (c : B) * z = ((c * w * a⁻¹ : Bˣ) : B) * ((a : B) * y) ∧
      (b * q * (c ^ n)⁻¹) * (c * w * a⁻¹) ^ n = b * u * (a ^ n)⁻¹ := by
  sorry

/-- Native-coefficient-naturality: an arbitrary ring map transports the root equation. -/
theorem coefficientChange_equation (ψ : B →+* C) (n : ℕ) (u : Bˣ) (y f : B)
    (h : (u : B) * y ^ n = f) :
    ((Units.map ψ.toMonoidHom u : Cˣ) : C) * (ψ y) ^ n = ψ f := by
  sorry

/-- Native-coefficient-naturality on every labelled arrow, including zero sections. -/
theorem coefficientChange_arrow (ψ : B →+* C) (n : ℕ) (u q w : Bˣ) (y z : B)
    (hs : z = (w : B) * y) (hp : q * w ^ n = u) :
    ψ z = ((Units.map ψ.toMonoidHom w : Cˣ) : C) * ψ y ∧
      Units.map ψ.toMonoidHom q * (Units.map ψ.toMonoidHom w) ^ n =
        Units.map ψ.toMonoidHom u := by
  sorry

/-- Native-local-normalization's section equation, conditional on the actual unit root.
The existence and fppf cover are the accepted parent targets, not assumptions hidden in data. -/
theorem localNormalization_equation (n : ℕ) (u r : Bˣ) (y f : B)
    (hr : r ^ n = u) (hy : (u : B) * y ^ n = f) :
    ((r : B) * y) ^ n = f := by
  sorry

/-- Native-chart-frame-independence: the ratio of two unit roots is a μ_n label. -/
theorem transitionRoot_ratio (n : ℕ) (b r₁ r₂ : Bˣ)
    (h₁ : r₁ ^ n = b) (h₂ : r₂ ^ n = b) :
    (r₂ * r₁⁻¹) ^ n = 1 := by
  sorry

end CoordinateEndConditions

section NativeCarrierChecks

/-- The native coordinate bridge is an actual ring isomorphism, not definitional equality. -/
example (B : CommRingCat.{u}) (b : B) :
    (Scheme.ΓSpecIso B).hom ((Scheme.ΓSpecIso B).inv b) = b := by
  sorry

/-- Native line frames exist locally by an already implemented baseline declaration. -/
example {X : Scheme.{u}} (M : TauCeti.AlgebraicGeometry.InvertibleSheaf X) :
    Nonempty (TauCeti.SheafOfModules.LocalTrivializations.{u, u, u} (R := X.ringCatSheaf) M.obj) := by
  exact ⟨TauCeti.SheafOfModules.LocalTrivializations.ofIsInvertible.{u, u, u} (R := X.ringCatSheaf) M.obj⟩

/-- Native section transport along an actual module isomorphism has the required roundtrip. -/
example {X : Scheme.{u}} {M N : X.Modules} (e : M ≅ N) (t : Γ(M, ⊤)) :
    e.inv.app ⊤ (e.hom.app ⊤ t) = t := by
  sorry

end NativeCarrierChecks

section WorkedCoordinateChecks

-- FramedNativeRoot.test_zero / framedNativeEquiv.test_zero_arrows / chart-realization:
-- the two distinct scalar labels preserve a zero section and its power identification.
example : (1 : (ZMod 4)ˣ) ≠ -1 := by
  decide

example : ((-1 : (ZMod 4)ˣ) : ZMod 4) * 0 = 0 ∧
    (-1 : (ZMod 4)ˣ) ^ 2 = 1 := by
  norm_num

-- FramedNativeEquiv.test_nonnormalized / chart-realization.test_not_surjective.
example : (3 : ZMod 4) * (1 : ZMod 4) ^ 2 = 3 := by
  norm_num

example : ¬ ∃ z : ZMod 4, z ^ 2 = 3 := by
  sorry

-- The nonzero nilpotent example tests roots with section against the reduced gerbe shortcut.
example : (3 : ZMod 9) ≠ 0 ∧ (3 : ZMod 9) ^ 2 = 0 := by
  decide

example : ¬ ∃ w : (ZMod 9)ˣ, (w : ZMod 9) * 3 = 0 := by
  sorry

-- An arbitrary test change may kill both a section and a nonidentity stabilizer.
example (ψ : ZMod 4 →+* ZMod 2) : ψ 2 = 0 ∧ ψ (-1) = 1 := by
  constructor
  · simpa only [map_ofNat] using (show (2 : ZMod 2) = 0 from by decide)
  · simpa only [map_neg, map_one] using (show (-1 : ZMod 2) = 1 from by decide)

-- The exponent-zero tensor-power check must read one, even for a zero section.
example {B : Type u} [CommRing B] : (0 : B) ^ 0 = 1 := by
  norm_num

-- Source-frame direction check: y'=2y requires u'=u/4 for n=2.
example : (1 / 4 : ℚ) * (2 : ℚ) ^ 2 = 1 := by
  norm_num

end WorkedCoordinateChecks



end TauCeti.RootStack.RS0NativeSuggested

/-! ## RS.1 -/

namespace TauCeti.FiniteRoot.RS1Suggested

universe u

/-- The equation of the smooth frame presentation, with z = X 0 and q = X 1. -/
noncomputable abbrev presentationRelation (A : Type u) [CommRing A] (f : A) (n : ℕ) :
    MvPolynomial (Fin 2) A :=
  MvPolynomial.X 0 ^ n - MvPolynomial.X 1 * MvPolynomial.C f

/-- A[z,q,q⁻¹]/(zⁿ-qf), as the actual localization of a polynomial quotient. -/
abbrev smoothPresentationRing (A : Type u) [CommRing A] (f : A) (n : ℕ) :=
  Localization.Away
    (Ideal.Quotient.mk (Ideal.span ({presentationRelation A f n} : Set (MvPolynomial (Fin 2) A)))
      (MvPolynomial.X 1))

/-- Native-regularity: the ring of the actual smooth G_m frame atlas is regular.
The hypotheses mean that f cuts out a regular effective Cartier divisor. -/
theorem smoothPresentationRing_regular (A : Type u) [CommRing A] [IsRegularRing A]
    (f : A) (hf : f ∈ nonZeroDivisors A)
    [IsRegularRing (A ⧸ Ideal.span ({f} : Set A))] (n : ℕ) (hn : 0 < n) :
    IsRegularRing (smoothPresentationRing A f n) := by
  sorry

/-- Native-geometric-fibres: the ramified chart retains a nonzero nilpotent.
The full stack fibre is obtained by a torsor quotient, not by deleting this element. -/
theorem zeroFibre_nonreduced (K : Type u) [Field K] (n : ℕ) (hn : 1 < n) :
    (AdjoinRoot.root (Polynomial.X ^ n : Polynomial K)) ^ n = 0 ∧
      AdjoinRoot.root (Polynomial.X ^ n : Polynomial K) ≠ 0 := by
  sorry

/-- Native-dm-locus: the tangent μ_p point is invisible on geometric field points.
Its actual carrier is the native dual-number polynomial quotient. -/
theorem wildInertia_tangent (K : Type u) [Field K] (p : ℕ) (hp : p.Prime) [CharP K p] :
    (1 + AdjoinRoot.root (Polynomial.X ^ 2 : Polynomial K)) ^ p = 1 ∧
      (1 + AdjoinRoot.root (Polynomial.X ^ 2 : Polynomial K)) ≠ 1 := by
  sorry

/-- The n=1 presentation eliminates z by z=qf, rather than requiring f to be a unit. -/
example {A : Type u} [CommRing A] (f q : A) :
    MvPolynomial.eval ![q * f, q] (presentationRelation A f 1) = 0 := by
  sorry

/-- Unit sections have no relative automorphisms; no invertibility of n is needed. -/
example {A : Type u} [CommRing A] (w : Aˣ) (y : A)
    (hy : IsUnit y) (h : (w : A) * y = y) : w = 1 := by
  sorry

/-- A zero square-root section over a nonreduced ring need not itself be zero. -/
example : (3 : ZMod 9) ^ 2 = 0 ∧ (3 : ZMod 9) ≠ 0 := by
  decide

/-- A native power-identification coefficient need not have a global normalizing root. -/
example : ¬ ∃ r : ZMod 4, r ^ 2 = 3 := by
  decide

/-- The base Z example has exponent 3 invertible on its branch divisor V(2). -/
example : IsUnit (3 : ZMod 2) := by
  simpa only [show (3 : ZMod 2) = 1 from by decide] using
    (isUnit_one : IsUnit (1 : ZMod 2))



end TauCeti.FiniteRoot.RS1Suggested

/-! ## RS.2 -/

namespace TauCeti.AlgebraicGeometry.RootStack

universe u v w

namespace RootKummer

/-- `K_n(k) = kˣ/(kˣ)^n`: Mathlib's quotient group at a positive Kummer degree. -/
abbrev coordinate (k : Type u) [Field k] (n : ℕ+) :=
  kˣ ⧸ (powMonoidHom (n : ℕ) : kˣ →* kˣ).range

/-- The class `[a]_n` of a unit. -/
abbrev ofUnit (k : Type u) [Field k] (n : ℕ+) : kˣ →* coordinate k n :=
  QuotientGroup.mk' _

theorem ofUnit_eq_one (k : Type u) [Field k] (n : ℕ+) (a : kˣ) :
    ofUnit k n a = 1 ↔ ∃ b : kˣ, b ^ (n : ℕ) = a := by
  sorry

/-- The coordinate transition `K_m(k) → K_n(k)` for `n ∣ m`, induced by the identity of `kˣ`,
so `[a]_m ↦ [a]_n`. It is not induced by raising to the power `m / n`. -/
def transition (k : Type u) [Field k] {n m : ℕ+} (h : (n : ℕ) ∣ (m : ℕ)) :
    coordinate k m →* coordinate k n :=
  QuotientGroup.map _ _ (MonoidHom.id kˣ) (by
    rintro _ ⟨b, rfl⟩
    obtain ⟨q, hq⟩ := h
    exact ⟨b ^ q, by simp [← pow_mul, hq, mul_comm]⟩)

@[simp]
theorem transition_ofUnit (k : Type u) [Field k] {n m : ℕ+} (h : (n : ℕ) ∣ (m : ℕ))
    (a : kˣ) : transition k h (ofUnit k m a) = ofUnit k n a :=
  rfl

@[simp]
theorem transition_id (k : Type u) [Field k] (n : ℕ+) :
    transition k (dvd_refl (n : ℕ)) = MonoidHom.id (coordinate k n) := by
  sorry

theorem transition_comp (k : Type u) [Field k] {n m l : ℕ+}
    (hnm : (n : ℕ) ∣ (m : ℕ)) (hml : (m : ℕ) ∣ (l : ℕ)) :
    (transition k hnm).comp (transition k hml) = transition k (hnm.trans hml) := by
  sorry

/-- `lim_n K_n(k)`: the families of Kummer coordinates compatible with every transition. -/
def compatibleFamilies (k : Type u) [Field k] : Subgroup ((n : ℕ+) → coordinate k n) where
  carrier := {c | ∀ (n m : ℕ+) (h : (n : ℕ) ∣ (m : ℕ)), transition k h (c m) = c n}
  one_mem' := fun n m h => by simp
  mul_mem' := fun {a b} ha hb n m h => by
    simp only [Pi.mul_apply, map_mul, ha n m h, hb n m h]
  inv_mem' := fun {a} ha n m h => by
    simp only [Pi.inv_apply, map_inv, ha n m h]

end RootKummer

open RootKummer

-- RootKummerTests.one: `K_1(k)` is trivial for every field.
example (k : Type u) [Field k] (x : coordinate k 1) : x = 1 := by
  sorry

-- RootKummerTests.two: the class of 2 in `K_2(ℚ)` is nontrivial; the class of 4 is trivial.
example (a : ℚˣ) (ha : (a : ℚ) = 2) : ofUnit ℚ 2 a ≠ 1 := by
  sorry

example (a : ℚˣ) (ha : (a : ℚ) = 4) : ofUnit ℚ 2 a = 1 := by
  sorry

-- RootKummerTests.transition: `K_4(ℚ) → K_2(ℚ)` keeps the representative 2;
-- squaring the representative would kill the class.
example (a : ℚˣ) (ha : (a : ℚ) = 2) :
    transition ℚ (show ((2 : ℕ+) : ℕ) ∣ ((4 : ℕ+) : ℕ) by decide) (ofUnit ℚ 4 a) ≠ 1 := by
  sorry

-- RootKummerTests.wild: over `𝔽_p(t)` the class of `t` in `K_p` is nontrivial,
-- although the only `p`-th root of unity in the field is 1.
example (p : ℕ) [hp : Fact p.Prime] :
    ofUnit (RatFunc (ZMod p)) ⟨p, hp.out.pos⟩
      (Units.mk0 RatFunc.X RatFunc.X_ne_zero) ≠ 1 := by
  sorry

-- RootKummerTests.realFamilies: over `ℝ` the compatible families are the trivial family and
-- `([-1]_n)_n`; over an algebraically closed field there is only the trivial family.
example : Nat.card (compatibleFamilies ℝ) = 2 := by
  sorry

example (k : Type u) [Field k] [IsAlgClosed k] (c : compatibleFamilies k) : c = 1 := by
  sorry

-- Finite chart checks: a nilpotent root is not forced to be zero.
example (k : Type u) [Field k] (n : ℕ+) :
    AdjoinRoot.root ((Polynomial.X : Polynomial k) ^ (n : ℕ)) ^ (n : ℕ) = 0 := by
  sorry

example (k : Type u) [Field k] (r : ℕ) :
    AdjoinRoot.root ((Polynomial.X : Polynomial k) ^ (r + 1)) ^ r ≠ 0 := by
  sorry

-- Field-valued roots do not detect wild group-scheme inertia.
example (p : ℕ) [Fact p.Prime] (k : Type u) [Field k] [CharP k p]
    (ζ : rootsOfUnity p k) : (ζ : kˣ) = 1 := by
  sorry

-- A finite extension cannot contain roots of 2 of unbounded degree.
-- This is an imported parent milestone, recorded as a separating check.
example (K : Type u) [Field K] [Algebra ℚ K] [FiniteDimensional ℚ K]
    (n : ℕ+) (x : K) (hx : x ^ (n : ℕ) = 2) :
    (n : ℕ) ≤ Module.finrank ℚ K := by
  sorry

-- The pinned compactness ingredient requires no surjective transition maps.
example {J : Type u} [CategoryTheory.Category.{w} J]
    [CategoryTheory.IsCofilteredOrEmpty J]
    (F : CategoryTheory.Functor J (Type v))
    [∀ j, Finite (F.obj j)] [∀ j, Nonempty (F.obj j)] :
    F.sections.Nonempty := by
  sorry

end TauCeti.AlgebraicGeometry.RootStack

/-! ## GC.0 -/

open CategoryTheory AlgebraicGeometry

namespace TauCeti.RamifiedClassField.GC0

universe u

variable {Y Z : Scheme.{u}} (i : Z ⟶ Y)

/-- Native data over a scheme arrow; use `R × S ⟶ X × S` in the roadmap. -/
structure RootPicardData where
  line : TauCeti.AlgebraicGeometry.InvertibleSheaf Y
  rootLine : TauCeti.AlgebraicGeometry.InvertibleSheaf Z
  squareIso :
    (TauCeti.AlgebraicGeometry.InvertibleSheaf.tensorProduct rootLine rootLine).obj ≅
      (Scheme.Modules.pullback i).obj line.obj

namespace RootPicardData

variable {i}

/-- Isomorphisms preserve the square identification; arbitrary module maps are excluded. -/
structure Iso (a b : RootPicardData i) where
  lineIso : a.line ≅ b.line
  rootIso : a.rootLine ≅ b.rootLine
  compatibility :
    ((TauCeti.AlgebraicGeometry.InvertibleSheaf.tensorProductCongrLeft
        (K := a.rootLine) rootIso).hom.hom ≫
      (TauCeti.AlgebraicGeometry.InvertibleSheaf.tensorProductCongrRight
        (L := b.rootLine) rootIso).hom.hom) ≫ b.squareIso.hom =
    a.squareIso.hom ≫ (Scheme.Modules.pullback i).map lineIso.hom.hom

end RootPicardData

/-- A section along the root locus, with no global section on `Y`. -/
structure RootPicardSectionData where
  root : RootPicardData i
  sectionOnRoot : Γ(root.rootLine.obj, (⊤ : Z.Opens))

namespace RootPicardSectionData

variable {i}

/-- In addition to the square, an arrow preserves the root section. -/
structure Iso (a b : RootPicardSectionData i) where
  rootIso : RootPicardData.Iso a.root b.root
  section_eq :
    rootIso.rootIso.hom.hom.app (⊤ : Z.Opens) a.sectionOnRoot = b.sectionOnRoot

def zero (a : RootPicardData i) : RootPicardSectionData i := ⟨a, 0⟩

theorem zero_forget (a : RootPicardData i) : (zero a).root = a := by
  sorry

theorem zero_section (a : RootPicardData i) : (zero a).sectionOnRoot = 0 := by
  sorry

end RootPicardSectionData

/-- The square action gives an arrow of root data with the underlying line fixed. -/
theorem square_frame_compatibility (A : Type*) [CommRing A] (u gamma : Aˣ) :
    (u ^ 2 * gamma)⁻¹ * u ^ 2 = gamma⁻¹ := by
  sorry

/-- The root-section coordinate has weight one and its square has weight two. -/
theorem section_square_covariance (A : Type*) [CommRing A] (u : Aˣ) (a : A) :
    ((u : A) * a) ^ 2 = (u : A) ^ 2 * a ^ 2 := by
  sorry

/-- A frame section kills the relative stabilizer over any commutative ring. -/
theorem frame_relative_stabilizer_iff (A : Type*) [CommRing A] (v a : Aˣ) :
    (v ^ 2 = 1 ∧ v * a = a) ↔ v = 1 := by
  sorry

/-- Nonempty split root loci with frame sections also kill the ordinary scalar. -/
theorem frame_full_stabilizer_iff (A : Type*) [CommRing A]
    (r : ℕ) (hr : 0 < r) (c : Aˣ) (v a : Fin r → Aˣ) :
    (∀ j, v j ^ 2 = c ∧ v j * a j = a j) ↔
      c = 1 ∧ v = fun _ => 1 := by
  sorry

example (a : RootPicardData i) : (RootPicardSectionData.zero a).root = a := by
  sorry

example : (-1 : ZMod 5) ^ 2 = 1 ∧ (-1 : ZMod 5) * 0 = 0 := by
  sorry

example : (-1 : ZMod 5) * 1 ≠ 1 := by
  sorry

example : (DualNumber.eps : DualNumber (ZMod 5)) ≠ 0 ∧
    (DualNumber.eps : DualNumber (ZMod 5)) ^ 2 = 0 := by
  sorry

example : (2 : ZMod 5) ^ 2 = 4 ∧ (2 : ZMod 5) * 1 = 2 := by
  sorry

/-- With no root coordinates, the stabilizer equations leave a nontrivial scalar. -/
example : ∃ c : (ZMod 5)ˣ, c ≠ 1 ∧
    ∀ j : Fin 0, (1 : (ZMod 5)ˣ) ^ 2 = c ∧
      (1 : (ZMod 5)ˣ) * 1 = 1 := by
  sorry



end TauCeti.RamifiedClassField.GC0

/-! ## GC.1 -/

namespace TauCeti.RamifiedClassField

open CategoryTheory
open scoped BigOperators CategoryTheory.MonObj

universe u

variable (B : Type u) [CommRing B]

/-- Coordinate notation for multiplication in the native μ₂-points. -/
noncomputable abbrev orderedInertiaProduct (m : ℕ) :
    (Fin m → rootsOfUnity 2 B) →* rootsOfUnity 2 B :=
  ∏ i : Fin m, Pi.evalMonoidHom (fun _ : Fin m => rootsOfUnity 2 B) i

/-- The coordinate part of `orderedInertia`: discard coordinate zero in the kernel.
The inverse inserts the inverse product in coordinate zero. A permutation transports this
distinguished index; keeping it fixed requires the conjugated action on the other coordinates. -/
theorem orderedInertia_kernel (n : ℕ) :
    ∃ e : (orderedInertiaProduct B (n + 1)).ker ≃* (Fin n → rootsOfUnity 2 B),
      ∀ ζ i, e ζ i = ζ.val i.succ := by
  sorry

/-- Algebra change acts on every coordinate, including nonreduced value algebras. -/
theorem orderedInertia_naturality {C : Type u} [CommRing C]
    (φ : B →+* C) (m : ℕ) (ζ : Fin m → rootsOfUnity 2 B) :
    restrictRootsOfUnity φ 2 (orderedInertiaProduct B m ζ) =
      orderedInertiaProduct C m (fun i => restrictRootsOfUnity φ 2 (ζ i)) := by
  sorry

/-- Multiplication and its kernel are canonical under reindexing all factors. -/
theorem orderedInertia_reindex (m : ℕ) (σ : Fin m ≃ Fin m)
    (ζ : Fin m → rootsOfUnity 2 B) :
    orderedInertiaProduct B m (fun i => ζ (σ i)) = orderedInertiaProduct B m ζ := by
  sorry

-- No branch factor is present at multiplicity zero.
example (ζ : Fin 0 → rootsOfUnity 2 B) : orderedInertiaProduct B 0 ζ = 1 := by
  sorry

-- A single branch preimage has no relative inertia kernel.
example (ζ : Fin 1 → rootsOfUnity 2 B) : orderedInertiaProduct B 1 ζ = ζ 0 := by
  sorry

-- A double collision has a diagonal kernel, even though each factor is tame.
example (ζ : rootsOfUnity 2 B) :
    orderedInertiaProduct B 2 ![ζ, ζ⁻¹] = 1 := by
  sorry

example (ζ : rootsOfUnity 2 B) (hζ : ζ ≠ 1) :
    ¬Function.Injective (orderedInertiaProduct B 2) := by
  sorry

-- Agreement with the existing group-scheme point comparison, not a new μ₂ model.
example (R : Type u) [CommRing R] [Algebra R B] (m : ℕ)
    (p : Fin m →
      ((AlgebraicGeometry.Spec (CommRingCat.of B)).asOver
        (AlgebraicGeometry.Spec (CommRingCat.of R)) ⟶
        (TauCeti.RootsOfUnityGroup.groupScheme R 2).X)) :
    TauCeti.RootsOfUnityGroup.schemePointsMulEquiv (R := R) (A := B) 2
        (List.ofFn p).prod =
      orderedInertiaProduct B m (fun i =>
        TauCeti.RootsOfUnityGroup.schemePointsMulEquiv (R := R) (A := B) 2 (p i)) := by
  sorry

-- The coordinate equation in rootAdditionChart; the geometric quotient map is a README target.
example (f g s t : B) (hs : s ^ 2 = f) (ht : t ^ 2 = g) :
    (s * t) ^ 2 = f * g := by
  sorry



end TauCeti.RamifiedClassField

/-! ## GC.2 -/

open CategoryTheory
open scoped RestrictedProduct WithZero

namespace TauCeti.RamifiedClassField.GC2

variable {k F : Type*} [Field k] [Field F] [Algebra k F]

/-- The existing completion at a native normalized place. -/
abbrev LocalField (P : Place k F) := Valuation.Completion P.valuation

/-- The completed valuation ring, as a native valuation subring. -/
abbrev LocalIntegers (P : Place k F) : ValuationSubring (LocalField P) :=
  (Valued.v : Valuation (LocalField P) ℤᵐ⁰).valuationSubring

/-- Carrier spelling for the imported FA.2 projective ideles, including infinity. -/
abbrev Ideles (k F : Type*) [Field k] [Field F] [Algebra k F] :=
  Πʳ P : Place k F, [(LocalField P)ˣ, (LocalIntegers P).unitGroup]

abbrev IntegralUnits (k F : Type*) [Field k] [Field F] [Algebra k F] :=
  (P : Place k F) → (LocalIntegers P).unitGroup

abbrev BranchUnits (R : Finset (Place k F)) :=
  (x : R) → (IsLocalRing.ResidueField (LocalIntegers x.val))ˣ

def residueProduct (R : Finset (Place k F)) : IntegralUnits k F →* BranchUnits R where
  toFun u x := (LocalIntegers x.val).unitGroupToResidueFieldUnits (u x.val)
  map_one' := by
    funext x
    exact map_one (LocalIntegers x.val).unitGroupToResidueFieldUnits
  map_mul' u v := by
    funext x
    exact map_mul (LocalIntegers x.val).unitGroupToResidueFieldUnits _ _

/-- A light equalizer spelling of the inherited modified-unit group; labels survive. -/
def rootUnitSubgroup (R : Finset (Place k F)) :
    Subgroup (IntegralUnits k F × BranchUnits R) :=
  ((residueProduct R).comp (MonoidHom.fst _ _)).eqLocus
    ((powMonoidHom 2).comp (MonoidHom.snd _ _))

abbrev RootUnits (R : Finset (Place k F)) := rootUnitSubgroup R

/-- The actual residue-square relation retains every root label. -/
theorem rootUnit_relation (R : Finset (Place k F)) (h : RootUnits R) (x : R) :
    (LocalIntegers x.val).unitGroupToResidueFieldUnits (h.val.1 x.val) = h.val.2 x ^ 2 := by
  sorry

/-- Lifting units requires square residues, rather than an injective modification map. -/
theorem rootUnits_lift_iff (R : Finset (Place k F)) (u : IntegralUnits k F) :
    (∃ h : RootUnits R, h.val.1 = u) ↔ ∀ x : R, IsSquare (residueProduct R u x) := by
  sorry

-- The signed, residue-degree-weighted divisor convention.
example (P : Place k F) :
    Divisor.degree (-Finsupp.single P (1 : ℤ)) = -(P.degree : ℤ) := by
  sorry

-- Empty ramification removes the residue constraint.
example (u : IntegralUnits k F) (v : BranchUnits (∅ : Finset (Place k F))) :
    (u, v) ∈ rootUnitSubgroup (∅ : Finset (Place k F)) := by
  sorry

-- The root label can be nontrivial although its square is the fixed residue.
example : ((1 : ℤˣ) ^ 2 = 1) ∧ ((-1 : ℤˣ) ^ 2 = 1) ∧ (1 : ℤˣ) ≠ -1 := by
  sorry

end TauCeti.RamifiedClassField.GC2

/-! ## GC.3 -/

open scoped TensorProduct

namespace TauCeti.RamifiedClassField

open Equiv

section Koszul

variable (K : Type*) [CommRing K] (V : Type*) [AddCommGroup V] [Module K V]

/-- The Koszul-signed permutation action on `⨂[K]^d V`: `σ` permutes the tensor
factors and multiplies by `sign σ`. It is the action of `S_d` on the degree-`d`
part of the graded tensor power of a graded module concentrated in degree one. -/
def koszulPermAction (d : ℕ) (σ : Perm (Fin d)) : (⨂[K]^d V) →ₗ[K] (⨂[K]^d V) :=
  ((Perm.sign σ : ℤ)) • PiTensorProduct.reindexRepresentation K V (Fin d) σ

namespace koszulPermAction

variable {K V}

theorem apply_tprod (d : ℕ) (σ : Perm (Fin d)) (v : Fin d → V) :
    koszulPermAction K V d σ (PiTensorProduct.tprod K v) =
      ((Perm.sign σ : ℤ)) • PiTensorProduct.tprod K (fun i => v (σ.symm i)) := by
  sorry

variable (K V)

theorem one (d : ℕ) : koszulPermAction K V d 1 = LinearMap.id := by
  sorry

theorem mul (d : ℕ) (σ τ : Perm (Fin d)) :
    koszulPermAction K V d (σ * τ) = koszulPermAction K V d σ ∘ₗ koszulPermAction K V d τ := by
  sorry

/-- The sign twist of Tau Ceti's unsigned permutation representation. -/
theorem eq_sign_smul_reindexRepresentation (d : ℕ) (σ : Perm (Fin d)) :
    koszulPermAction K V d σ =
      ((Perm.sign σ : ℤ)) • PiTensorProduct.reindexRepresentation K V (Fin d) σ := by
  sorry

variable {K V}

/-- A transposition acts by minus the ordinary flip: the Koszul sign. -/
theorem swap_tprod (v w : V) :
    koszulPermAction K V 2 (swap 0 1) (PiTensorProduct.tprod K ![v, w]) =
      -PiTensorProduct.tprod K ![w, v] := by
  sorry

/-- Naturality in linear maps; a Frobenius acting linearly is a special case. -/
theorem naturality {W : Type*} [AddCommGroup W] [Module K W] (f : V →ₗ[K] W) (d : ℕ)
    (σ : Perm (Fin d)) :
    PiTensorProduct.map (fun _ : Fin d => f) ∘ₗ koszulPermAction K V d σ =
      koszulPermAction K W d σ ∘ₗ PiTensorProduct.map (fun _ : Fin d => f) := by
  sorry

end koszulPermAction

-- The exterior comparison uses current-library antisymmetrization and projection.
-- Their maps are README imports; pin-only private reconstructions are omitted here.
example (L : Type*) [Field L] [CharZero L] (n d : ℕ) :
    Module.finrank L (⋀[L]^d (Fin n → L)) = n.choose d := by
  sorry

end Koszul

section Averaging

variable {K G V W : Type*} [CommRing K] [Group G] [Fintype G]
  [AddCommGroup V] [Module K V] [AddCommGroup W] [Module K W]

/-- Invariants are exact when `|G|` is invertible: an equivariant surjection is
surjective on invariants, by averaging a preimage. -/
theorem invariants_map_surjective [Invertible (Fintype.card G : K)]
    {ρ : Representation K G V} {τ : Representation K G W} (f : V →ₗ[K] W)
    (hf : ∀ g, f ∘ₗ ρ g = τ g ∘ₗ f) (hs : Function.Surjective f) :
    ∀ w ∈ τ.invariants, ∃ v ∈ ρ.invariants, f v = w := by
  sorry

end Averaging

/-- Rational acyclicity: a finite group whose order is invertible in the
coefficients has no cohomology in positive degree. -/
theorem groupCohomology_isZero_of_invertible {k G : Type} [CommRing k] [Group G] [Fintype G]
    [Invertible (Fintype.card G : k)] (A : Rep k G) (n : ℕ) :
    CategoryTheory.Limits.IsZero (groupCohomology A (n + 1)) := by
  sorry

section TensorCharacter

variable {A M : Type*} [CommGroup A] [CommMonoid M]

/-- The tensor character `(a_i) ↦ ∏ χ(a_i)` on `A^m` is `χ` of the product. -/
theorem prod_character_eq_comp_prod (χ : A →* M) {m : ℕ} (a : Fin m → A) :
    ∏ i, χ (a i) = χ (∏ i, a i) := by
  sorry

/-- Hence it is trivial on the kernel of multiplication `A^m → A`. -/
theorem prod_character_eq_one_of_prod_eq_one (χ : A →* M) {m : ℕ} (a : Fin m → A)
    (h : ∏ i, a i = 1) : ∏ i, χ (a i) = 1 := by
  sorry

/-- Permuting the factors does not change the tensor character: there is no sign
on a tensor power of a degree-zero line. -/
theorem prod_character_perm (χ : A →* M) {m : ℕ} (a : Fin m → A) (σ : Perm (Fin m)) :
    ∏ i, χ (a (σ i)) = ∏ i, χ (a i) := by
  sorry

-- tensor-character-kernel: for `A = ℤˣ ≃ μ₂` and the sign character, `(−1, −1)` lies in
-- the kernel of multiplication and the tensor character is trivial on it.
example : ∏ i : Fin 2, (MonoidHom.id ℤˣ) (![-1, -1] i) = 1 := by
  sorry

end TensorCharacter

end TauCeti.RamifiedClassField

/-! ## GC.4 -/

namespace TauCeti.RamifiedClassField

universe u v w

variable {A : Type u} {I : Type v} {J : Type w}

/-- Section coordinates after splitting evaluation: `(u, α) ↦ (u, α²)`. -/
def quadraticSection [CommRing A] (v : (I → A) × (J → A)) :
    (I → A) × (J → A) :=
  (v.1, fun j => v.2 j ^ 2)

namespace quadraticSection

variable [CommRing A]

theorem kernelCoordinates (v : (I → A) × (J → A)) :
    (quadraticSection v).1 = v.1 := by
  sorry

theorem rootCoordinates (v : (I → A) × (J → A)) (j : J) :
    (quadraticSection v).2 j = v.2 j ^ 2 := by
  sorry

theorem baseChange {B : Type*} [CommRing B] (f : A →+* B)
    (v : (I → A) × (J → A)) :
    quadraticSection (f ∘ v.1, f ∘ v.2) =
      (f ∘ (quadraticSection v).1, f ∘ (quadraticSection v).2) := by
  sorry

/-- Weight two on the kernel block, weight one on the root block. -/
theorem weighted (c : A) (v : (I → A) × (J → A)) :
    quadraticSection (fun i => c ^ 2 * v.1 i, fun j => c * v.2 j) =
      (fun i => c ^ 2 * (quadraticSection v).1 i,
        fun j => c ^ 2 * (quadraticSection v).2 j) := by
  sorry

/-- Only a reduced coefficient ring allows this test on raw ring-valued points. -/
theorem zero_iff [IsReduced A] (v : (I → A) × (J → A)) :
    quadraticSection v = 0 ↔ v = 0 := by
  sorry

-- test_small: a linear or all-squared coordinate map fails this.
example : quadraticSection ((fun _ : Fin 1 => (2 : ℤ)), fun _ : Fin 1 => (3 : ℤ)) =
    ((fun _ : Fin 1 => (2 : ℤ)), fun _ : Fin 1 => (9 : ℤ)) := by
  sorry

-- test_empty_root: agreement with the identity section coordinate for R empty.
example (u : I → A) (a : Fin 0 → A) : quadraticSection (u, a) = (u, a) := by
  sorry

-- test_not_injective: the full chart must retain α as well as this section.
example : quadraticSection ((fun _ : Fin 1 => (0 : ℤ)), fun _ : Fin 1 => (1 : ℤ)) =
      quadraticSection ((fun _ : Fin 1 => (0 : ℤ)), fun _ : Fin 1 => (-1 : ℤ)) ∧
    ((fun _ : Fin 1 => (0 : ℤ)), fun _ : Fin 1 => (1 : ℤ)) ≠
      ((fun _ : Fin 1 => (0 : ℤ)), fun _ : Fin 1 => (-1 : ℤ)) := by
  sorry

-- test_nilpotent: a nonzero ring-valued tuple can have zero section coordinate.
example :
    quadraticSection
        ((fun _ : Fin 1 => (0 : DualNumber (ZMod 3))),
          fun _ : Fin 1 => (DualNumber.eps : DualNumber (ZMod 3))) = 0 ∧
      ((fun _ : Fin 1 => (0 : DualNumber (ZMod 3))),
        fun _ : Fin 1 => (DualNumber.eps : DualNumber (ZMod 3))) ≠ 0 := by
  sorry

-- test_effective_nilpotent: a unit kernel coordinate retains nilpotent α.
example :
    quadraticSection
        ((fun _ : Fin 1 => (1 : DualNumber (ZMod 3))),
          fun _ : Fin 1 => (DualNumber.eps : DualNumber (ZMod 3))) =
      ((fun _ : Fin 1 => (1 : DualNumber (ZMod 3))),
        fun _ : Fin 1 => (0 : DualNumber (ZMod 3))) := by
  sorry

end quadraticSection

end TauCeti.RamifiedClassField

/-! ## GC.5 -/

namespace TauCeti.RamifiedClassField

open TauCeti
open TauCeti.AlgebraicGeometry

variable {k F : Type*} [Field k] [Field F] [Algebra k F]

/-- Effective away-place divisors carrying degree d above the bound B. -/
def auxiliaryDivisors (S : Set (Place k F)) (d B : ℤ) : Set (Divisor k F) :=
  {D | 0 ≤ D ∧ (∀ P ∈ S, D P = 0) ∧ B ≤ d + Divisor.degree D}

namespace auxiliaryDivisors

variable {S : Set (Place k F)} {d B B' : ℤ} {D E : Divisor k F}

theorem mem_iff : D ∈ auxiliaryDivisors S d B ↔
    0 ≤ D ∧ (∀ P ∈ S, D P = 0) ∧ B ≤ d + Divisor.degree D := by
  sorry

theorem effective (hD : D ∈ auxiliaryDivisors S d B) : 0 ≤ D := by
  sorry

theorem away (hD : D ∈ auxiliaryDivisors S d B) (P : Place k F)
    (hP : P ∈ S) : D P = 0 := by
  sorry

theorem degree_bound (hD : D ∈ auxiliaryDivisors S d B) :
    B ≤ d + Divisor.degree D := by
  sorry

theorem mono_bound (hBB' : B' ≤ B) (hD : D ∈ auxiliaryDivisors S d B) :
    D ∈ auxiliaryDivisors S d B' := by
  sorry

/-- A common effective enlargement; both inputs have nonnegative degree. -/
theorem add_mem (hD : D ∈ auxiliaryDivisors S d B)
    (hE : E ∈ auxiliaryDivisors S d B) :
    D + E ∈ auxiliaryDivisors S d B ∧ D ≤ D + E ∧ E ≤ D + E := by
  sorry

/-- The witness is an away place of any positive residue degree. -/
theorem nonempty_of_away_place (hF : IsFunctionField k F) (P : Place k F)
    (hP : P ∉ S) : (auxiliaryDivisors S d B).Nonempty := by
  sorry

theorem zero_mem_iff : (0 : Divisor k F) ∈ auxiliaryDivisors S d B ↔ B ≤ d := by
  sorry

-- test_zero: catches an incorrect strict bound or a nonempty-support condition.
example : (0 : Divisor k F) ∈ auxiliaryDivisors S d B ↔ B ≤ d := by
  sorry

-- test_degree_two: detects use of unweighted divisor degree.
example (P : Place k F) (hP : P ∉ S) (hdeg : P.degree = 2) :
    WeilDivisor.ofPoint P ∈ auxiliaryDivisors S d B ↔ B ≤ d + 2 := by
  sorry

-- test_negative: a signed divisor is not an effective auxiliary choice.
example (P : Place k F) :
    -WeilDivisor.ofPoint P ∉ auxiliaryDivisors S d B := by
  sorry

-- test_ramified: meeting the degree bound does not permit ramified support.
example (P : Place k F) (hP : P ∈ S) :
    WeilDivisor.ofPoint P ∉ auxiliaryDivisors S d B := by
  sorry

-- test_negative_degree: no degree-one point is needed to cross the bound.
example (P : Place k F) (hP : P ∉ S) (hdeg : P.degree = 2) :
    4 • WeilDivisor.ofPoint P ∈ auxiliaryDivisors S (-5) 3 ∧
      3 • WeilDivisor.ofPoint P ∉ auxiliaryDivisors S (-5) 3 := by
  sorry

end auxiliaryDivisors
end TauCeti.RamifiedClassField

/-! ## GC.6 -/

namespace TauCeti.RamifiedClassField.GC6

open scoped TensorProduct

universe u v

section RootUnits

variable {A : Type u} {B : Type v} [CommRing A] [CommRing B]

/-- Coordinates for sections of the root multiplicative sheaf on a framed chart. -/
def rootUnitCoordinates (r : A →+* B) : Subgroup (Aˣ × Bˣ) :=
  ((Units.map r.toMonoidHom).comp (MonoidHom.fst Aˣ Bˣ)).eqLocus
    ((powMonoidHom 2).comp (MonoidHom.snd Aˣ Bˣ))

theorem mem_rootUnitCoordinates (r : A →+* B) (u : Aˣ) (v : Bˣ) :
    (u, v) ∈ rootUnitCoordinates r ↔ Units.map r.toMonoidHom u = v ^ 2 :=
  sorry

theorem rootUnitCoordinates_ext (r : A →+* B)
    (x y : rootUnitCoordinates r) (h₁ : x.1.1 = y.1.1) (h₂ : x.1.2 = y.1.2) :
    x = y :=
  sorry

theorem rootUnitCoordinates_fst_kernel (r : A →+* B) (v : Bˣ) :
    (1, v) ∈ rootUnitCoordinates r ↔ v ^ 2 = 1 :=
  sorry

/-- Compatibility with ordinary units when the residue ring has one element. -/
theorem rootUnitCoordinates_empty_residue (r : A →+* B) [Subsingleton B] :
    rootUnitCoordinates r = ⊤ :=
  sorry

/-- The zero residue ring imposes no constraint on the ordinary units. -/
example : rootUnitCoordinates (Int.castRingHom PUnit) = ⊤ :=
  sorry

/-- Both residue roots are retained, even when the ordinary unit is fixed. -/
example : ((1 : ℤˣ), (1 : ℤˣ)) ∈ rootUnitCoordinates (RingHom.id ℤ) :=
  sorry

example : ((1 : ℤˣ), (-1 : ℤˣ)) ∈ rootUnitCoordinates (RingHom.id ℤ) :=
  sorry

example : ((1 : ℤˣ), (1 : ℤˣ)) ≠ ((1 : ℤˣ), (-1 : ℤˣ)) :=
  sorry

/-- Root compatibility is stronger than being an arbitrary pair of units. -/
example : ((-1 : ℤˣ), (1 : ℤˣ)) ∉ rootUnitCoordinates (RingHom.id ℤ) :=
  sorry

end RootUnits

section Approximation

variable {k : Type u} {F : Type v} [Field k] [Field F] [Algebra k F]

/-- Nonzero simultaneous residue prescriptions, including an empty index set.
The weak approximation theorem itself is already in Tau Ceti. -/
theorem exists_unit_with_residues {ι : Type*} [Finite ι]
    (P : ι → TauCeti.Place k F) (hP : Function.Injective P)
    (y : ∀ i, (P i).ResidueFieldˣ) :
    ∃ g : Fˣ, ∃ hg : ∀ i, (g : F) ∈ (P i).integers,
      ∀ i, IsLocalRing.residue (P i).integers ⟨(g : F), hg i⟩ = (y i : (P i).ResidueField) :=
  sorry

example (P : Empty → TauCeti.Place k F) (y : ∀ i, (P i).ResidueFieldˣ) :
    ∃ g : Fˣ, ∃ hg : ∀ i, (g : F) ∈ (P i).integers,
      ∀ i, IsLocalRing.residue (P i).integers ⟨(g : F), hg i⟩ = (y i : (P i).ResidueField) :=
  sorry

end Approximation

section CyclicTrace

variable {E : Type*} [Field E]
variable {V : Type*} [AddCommGroup V] [Module E V] [FiniteDimensional E V]

/-- One Frobenius is applied during the whole cycle. In dimension one, the
trace is the local scalar, independently of the closed-point degree. -/
theorem rankOne_cyclicTensor_trace (n : ℕ) (hV : Module.finrank E V = 1)
    (a : E) :
    LinearMap.trace E (⨂[E] _ : Fin (n + 1), V)
      ((PiTensorProduct.map (fun i : Fin (n + 1) =>
          if i = Fin.last n then a • (LinearMap.id : V →ₗ[E] V) else LinearMap.id)).comp
        (PiTensorProduct.reindex E (fun _ : Fin (n + 1) => V)
          (finRotate (n + 1)).symm).toLinearMap) = a :=
  sorry

/-- Degree two and inert scalar: raising the scalar to the degree would fail. -/
example :
    LinearMap.trace ℚ (⨂[ℚ] _ : Fin 2, ℚ)
      ((PiTensorProduct.map (fun i : Fin 2 =>
          if i = Fin.last 1 then (-1 : ℚ) • (LinearMap.id : ℚ →ₗ[ℚ] ℚ) else LinearMap.id)).comp
        (PiTensorProduct.reindex ℚ (fun _ : Fin 2 => ℚ)
          (finRotate 2).symm).toLinearMap) = -1 :=
  sorry

/-- A nonquadratic scalar checks that the cyclic identity is linear algebra. -/
example :
    LinearMap.trace ℚ (⨂[ℚ] _ : Fin 3, ℚ)
      ((PiTensorProduct.map (fun i : Fin 3 =>
          if i = Fin.last 2 then (2 : ℚ) • (LinearMap.id : ℚ →ₗ[ℚ] ℚ) else LinearMap.id)).comp
        (PiTensorProduct.reindex ℚ (fun _ : Fin 3 => ℚ)
          (finRotate 3).symm).toLinearMap) = 2 :=
  sorry

end CyclicTrace

end TauCeti.RamifiedClassField.GC6

end
