/-
This file is not the roadmap and is not exhaustive. The roadmap document
research/blueprint/readmes/HodgeTateAndCanonicalSubgroups--T6.md is definitive.
The statements suggest Lean forms so contributors and reviewers converge on
names and signatures. Every proposed proof is unproved. No implementation is
claimed; implementationStatus remains unchecked.

Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

The pinned libraries have affine Huber pairs, generic sites, derivations,
module quotients and adic completion, but not the geometric suppliers of T6.
The elaborated declarations below are affine/stalk or linear-algebra parts of
the intended signatures. They do not define an adic space by a ring, prove
sheaf descent from a stalk calculation, or assert a period comparison from an
arbitrary pair of modules. In particular, IntegralChart below states the
integral factorization part: logification being an isomorphism is not encoded.
TwoDeRhamLattices below states the submodule/filtration part: invert-t lattice
and horizontal-section conditions need the geometric suppliers.

The final contract catalogue includes EVERY packet declaration, API item and
test under its proposed name. An item marked "not stated" is an explicit
signature omission, not an elaborated theorem. Conditions that cannot be
stated are left out, not replaced by uninterpreted Prop fields or assumed
comparison conclusions. This is the packet's geometric-signature gap.
-/

import TauCeti.RingTheory.Huber.Pair
import Mathlib.CategoryTheory.Sites.Canonical
import Mathlib.CategoryTheory.Sites.Sheaf
import Mathlib.RingTheory.Derivation.Basic
import Mathlib.RingTheory.AdicCompletion.Basic
import Mathlib.RingTheory.Perfectoid.BDeRham
import Mathlib.RingTheory.Polynomial.Basic
import Mathlib.GroupTheory.Exponent
import Mathlib.Data.ZMod.Basic
import Mathlib.LinearAlgebra.Quotient.Basic
import Mathlib.LinearAlgebra.TensorProduct.Basic
import Mathlib.RepresentationTheory.Basic
import Mathlib.Topology.Algebra.Module.ContinuousLinearMap.Basic
import Mathlib.Data.NNRat.Defs
import Mathlib.LinearAlgebra.Matrix.Notation
import Mathlib.LinearAlgebra.Matrix.Defs
import Mathlib.RingTheory.Nilpotent.Defs

set_option linter.unusedSectionVars false
set_option linter.unusedVariables false

noncomputable section
open CategoryTheory
open scoped TensorProduct
universe u v w

namespace TauCeti.LogAdic

section StalkLog
variable (A M : Type*) [CommRing A] [CommMonoid M]

/-- Stalk/affine unit-fibre component, not the full étale sheaf carrier. -/
structure LogAdicData where
  alpha : M →* A
  unitEquiv : {m : M // IsUnit (alpha m)} ≃ Aˣ
  unitEquiv_val : ∀ m, (unitEquiv m : A) = alpha m.val

namespace LogAdicData
variable {A M}

/-- The affine trivial log structure uses units, not the terminal monoid. -/
def ofUnits : LogAdicData A Aˣ where
  alpha := Units.coeHom A
  unitEquiv := by sorry
  unitEquiv_val := by sorry

/-- Test TauCeti.LogAdic.LogAdicData.trivial_units (affine instance). -/
example (a : Aˣ) : (ofUnits (A := A)).alpha a = (a : A) := by sorry

/-- Test TauCeti.LogAdic.LogAdicData.unit_fiber (stalk component). -/
example (L : LogAdicData A M) (a : Aˣ) :
    ∃! m : M, L.alpha m = (a : A) := by sorry

/-- Test TauCeti.LogAdic.LogAdicData.not_terminal_monoid.
Already the stalk Q has a nontrivial unit, which rejects the terminal log. -/
example : ¬ ∃ L : LogAdicData ℚ PUnit, ∀ m, L.alpha m = 1 := by sorry
end LogAdicData

variable (P : Type*) [CommMonoid P]
  [TopologicalSpace A] [IsTopologicalRing A] [Huber.IsHuberRing A]

/-- Integral factorization of a proposed affine chart. The associated-log
isomorphism is a missing CR.5/sheaf interface, explicitly not represented here. -/
structure IntegralChart (S : Huber.Pair A) (L : LogAdicData A M) where
  chart : P →* M
  integral : P →* S.plus
  structural : ∀ p, (integral p : A) = L.alpha (chart p)

namespace IntegralChart
variable {A M P} {S : Huber.Pair A} {L : LogAdicData A M}
theorem mem_plus (c : IntegralChart A M P S L) (p : P) :
    L.alpha (c.chart p) ∈ S.plus := by sorry

/-- Test TauCeti.LogAdic.IntegralChart.reject_inverse_p.
The integral-factorization obstruction, with an arbitrary explicit plus ring. -/
example (a : A) (ha : a ∉ S.plus) :
    ¬ ∃ c : IntegralChart A M P S L, ∃ p, L.alpha (c.chart p) = a := by sorry
end IntegralChart
end StalkLog

section ContinuousDerivations
variable {A B M N E : Type*}
  [CommRing A] [CommRing B] [Algebra A B]
  [CommMonoid M] [CommMonoid N]
  [AddCommGroup E] [Module B E] [Module A E] [IsScalarTower A B E]
  [TopologicalSpace B] [UniformSpace E] [CompleteSpace E] [T2Space E]

/-- Continuous affine log derivation. The prelog-ring square and completeness
of E are supplied separately; the defining relative equations are explicit. -/
structure ContinuousLogDerivation (fsharp : M →* N) (beta : N →* B) where
  d : Derivation A B E
  continuous_d : Continuous d
  delta : N →* Multiplicative E
  relative_zero : ∀ m, (delta (fsharp m)).toAdd = 0
  structural : ∀ n, d (beta n) = beta n • (delta n).toAdd

namespace ContinuousLogDerivation
variable {fsharp : M →* N} {beta : N →* B}

@[ext] theorem ext {D D' : ContinuousLogDerivation (A := A) (E := E) fsharp beta}
    (hd : D.d = D'.d) (hdelta : D.delta = D'.delta) : D = D' := by sorry

theorem map_structural (D : ContinuousLogDerivation (A := A) (E := E) fsharp beta)
    (n : N) : D.d (beta n) = beta n • (D.delta n).toAdd := by sorry

def zeroDerivation : ContinuousLogDerivation (A := A) (E := E) fsharp beta := by sorry

/-- Test TauCeti.LogAdic.ContinuousLogDerivation.zero. -/
example (n : N) : (zeroDerivation (A := A) (E := E)
    (fsharp := fsharp) (beta := beta)).d (beta n) = 0 := by sorry

/-- Test TauCeti.LogAdic.ContinuousLogDerivation.unit_formula. -/
example (D : ContinuousLogDerivation (A := A) (E := E) fsharp beta)
    (n : N) (b : Bˣ) (hb : beta n = (b : B)) :
    (D.delta n).toAdd = (b⁻¹ : Bˣ) • D.d (beta n) := by sorry

variable {E' : Type*} [AddCommGroup E'] [Module B E'] [Module A E']
  [IsScalarTower A B E'] [UniformSpace E'] [CompleteSpace E'] [T2Space E']

def postcompose (D : ContinuousLogDerivation (A := A) (E := E) fsharp beta)
    (g : E →ₗ[B] E') (hg : Continuous g) :
    ContinuousLogDerivation (A := A) (E := E') fsharp beta := by sorry

theorem postcompose_d (D : ContinuousLogDerivation (A := A) (E := E) fsharp beta)
    (g : E →ₗ[B] E') (hg : Continuous g) (b : B) :
    (postcompose D g hg).d b = g (D.d b) := by sorry
end ContinuousLogDerivation
end ContinuousDerivations

section LogComplex
variable (K : Type*) [CommRing K] (E : ℕ → Type*)
  [∀ q, AddCommGroup (E q)] [∀ q, Module K (E q)]

/-- Underlying coefficient-linear complex after the geometric differential
forms and connection are supplied. It does not construct analytic forms. -/
structure AnalyticLogDR where
  d : ∀ q, E q →ₗ[K] E (q+1)
  d_sq : ∀ q e, d (q+1) (d q e) = 0

end LogComplex

section FilteredConnection
variable {K R E D : Type*} [CommRing K] [CommRing R] [Algebra K R]
  [AddCommGroup E] [AddCommGroup D] [Module R E] [Module R D]
  [Module K E] [Module K D] [IsScalarTower K R E] [IsScalarTower K R D]

/-- Tensor-image filtration: spans precisely the tensors with their first
factor in F. This defines a concrete transversality condition. -/
def tensorFiltration (F : Submodule R E) : Submodule R (E ⊗[R] D) :=
  Submodule.span R {x | ∃ e ∈ F, ∃ w : D, x = e ⊗ₜ[R] w}

/-- Connection and Griffiths filtration component. Integrability and
analytic continuity need the supplied exterior/continuous sheaf carriers. -/
structure FilteredLogConnection (d : Derivation K R D) where
  nabla : E →ₗ[K] E ⊗[R] D
  leibniz : ∀ f e, nabla (f • e) = f • nabla e + e ⊗ₜ[R] d f
  fil : ℤ → Submodule R E
  antitone_fil : Antitone fil
  transversality : ∀ r e, e ∈ fil r → nabla e ∈ tensorFiltration (fil (r-1))

/-- The modified Leibniz rule used on a positive period lattice. -/
structure LogTConnection (d : Derivation K R D) (t : R) where
  nabla : E →ₗ[K] E ⊗[R] D
  leibniz : ∀ f e, nabla (f • e) = f • nabla e + (t • e) ⊗ₜ[R] d f

namespace FilteredLogConnection
/-- Test TauCeti.LogAdic.FilteredLogConnection.mod_t_linear:
the Leibniz defect disappears in a quotient annihilating t. -/
example (d : Derivation K R D) (t : R) (N : LogTConnection d t)
    (Q : Submodule R (E ⊗[R] D))
    (ht : ∀ x : E ⊗[R] D, t • x ∈ Q) (f : R) (e : E) :
    Q.mkQ (N.nabla (f • e)) = f • Q.mkQ (N.nabla e) := by sorry

/-- Test TauCeti.LogAdic.FilteredLogConnection.not_unshifted:
the typed transversality assertion retains the r-1 target. -/
example (d : Derivation K R D) (N : FilteredLogConnection d) (r : ℤ) (e : E)
    (he : e ∈ N.fil r) : N.nabla e ∈ tensorFiltration (N.fil (r-1)) := by sorry
end FilteredLogConnection
end FilteredConnection

section BoundaryAction
variable (K G V : Type*) [Field K] [Group G] [AddCommGroup V] [Module K V]

/-- Representation component on a supplied geometric inertia group/stalk.
The construction of the actual log-geometric point is omitted. -/
abbrev BoundaryMonodromy := Representation K G V

namespace BoundaryMonodromy
variable {K G V}

/-- Finite log of 1+N, with N nilpotent and the bound supplied in uses. -/
def logarithm (N : Module.End K V) (bound : ℕ) : Module.End K V :=
  ∑ i ∈ Finset.range bound, ((-1 : K)^i / (i+1 : K)) • N^(i+1)

/-- Test TauCeti.LogAdic.BoundaryMonodromy.trivial (log component). -/
example (bound : ℕ) : logarithm (0 : Module.End K V) bound = 0 := by sorry

/-- Test TauCeti.LogAdic.BoundaryMonodromy.jordan:
U-1 is square-zero, so the finite matrix logarithm equals U-1. -/
example : let N : Matrix (Fin 2) (Fin 2) ℚ := !![0,1;0,0]
    N^2 = 0 ∧ ∑ i ∈ Finset.range 2, ((-1 : ℚ)^i / (i+1 : ℚ)) • N^(i+1) = N := by sorry

/-- Test TauCeti.LogAdic.BoundaryMonodromy.finite_character:
a nontrivial rank-one eigenvalue has nonnilpotent U-1. -/
example (z : K) (hz : z ≠ 1) : ¬ IsNilpotent (z-1) := by sorry
end BoundaryMonodromy
end BoundaryAction

section DivisibleChartLimit
/-- The all-root limit of the coordinate monoid, not its pro-adic carrier. -/
abbrev AllRootTower (r : ℕ) := Fin r → ℚ≥0

/-- Test TauCeti.LogAdic.LogAffinoidPerfectoid.all_divisibility (chart component).
The integer is arbitrary positive, not restricted to p-powers. -/
example (r n : ℕ) (hn : 0 < n) (a : AllRootTower r) :
    ∃! b : AllRootTower r, n • b = a := by sorry

/-- Test TauCeti.LogAdic.AllRootTower.p_only_insufficient:
1/3 is absent from the 2-power-root coordinate monoid. -/
example : ¬ ∃ n m : ℕ, (1/3 : ℚ≥0) = (m : ℚ≥0) / 2^n := by sorry

/-- Test TauCeti.LogAdic.AllRootTower.rank_zero (character-group component). -/
example (H : Type*) [CommGroup H] : Subsingleton (Fin 0 → H) := by sorry

/-- Test TauCeti.LogAdic.AllRootTower.two_coordinates (character-group component).
Instantiate H with the imported roots-of-unity inverse limit. -/
example (H : Type*) [CommGroup H] : Nonempty ((Fin 2 → H) ≃* (H × H)) := by sorry
end DivisibleChartLimit

section KummerCharts
variable {P Q : Type*} [AddCommMonoid P] [AddCommMonoid Q]

/-- Generic chart condition imported from CR.5. This is not the log-étale
condition and not a replacement definition for the geometric KummerEtale. -/
def IsKummerChart (f : P →+ Q) : Prop :=
  Function.Injective f ∧ ∀ q, ∃ n : ℕ, 0 < n ∧ ∃ p, n • q = f p

/-- Test TauCeti.LogAdic.KummerEtale.identity (chart part). -/
example : IsKummerChart (AddMonoidHom.id P) := by sorry

/-- Test TauCeti.LogAdic.KummerEtale.coordinate_root (chart part). -/
example (n : ℕ) (hn : 0 < n) :
    IsKummerChart (show ℕ →+ ℕ from
      { toFun := fun a => n * a, map_zero' := by sorry, map_add' := by sorry }) := by sorry

/-- Exponent, not cardinality, of the finite characteristic cokernel. -/
def RamificationIndex (G : Type*) [AddCommGroup G] : ℕ := AddMonoid.exponent G

namespace RamificationIndex
/-- Characteristic-cokernel part of the strictness criterion. -/
theorem index_one (G : Type*) [AddCommGroup G] [Finite G] :
    RamificationIndex G = 1 ↔ ∀ g : G, g = 0 := by sorry

/-- Test TauCeti.LogAdic.RamificationIndex.identity. -/
example : RamificationIndex (ZMod 1) = 1 := by sorry

/-- Test TauCeti.LogAdic.RamificationIndex.two_coordinates. -/
example (n : ℕ) (hn : 0 < n) : RamificationIndex (ZMod n × ZMod n) = n := by sorry

/-- Test TauCeti.LogAdic.RamificationIndex.off_boundary. -/
example : RamificationIndex (Fin 0 → ℤ) = 1 := by sorry
end RamificationIndex
end KummerCharts

section RootDisc
open Polynomial
variable (A : Type*) [CommRing A]

/-- Affine algebraic coordinate model A[S]/(S^n-T). Completed toric algebra,
integral logification and fs analytic base change need R0/CR.5. -/
abbrev RootCover (T : A) (n : ℕ) :=
  A[X] ⧸ Ideal.span {X ^ n - C T}

namespace RootCover
def root (T : A) (n : ℕ) : RootCover A T n :=
  Ideal.Quotient.mk _ X

/-- Test TauCeti.LogAdic.RootCover.one (affine algebra model). -/
example (T : A) : Nonempty (RootCover A T 1 ≃+* A) := by sorry

/-- Test TauCeti.LogAdic.RootCover.disc_action (root relation). -/
example (T z : A) (n : ℕ) (hz : z ^ n = 1) :
    (C z * X) ^ n - C T ∈ Ideal.span {X ^ n - C T} := by sorry
end RootCover
end RootDisc

section GenericSites
variable (C : Type u) [Category.{v} C] (J : GrothendieckTopology C)

/-- Once the Kummer object category and joint-surjectivity topology are
supplied, use the existing sheaf carrier. Construction of those inputs is omitted. -/
abbrev KummerEtaleSite := Sheaf J (Type v)

namespace KummerEtaleSite
/-- Yoneda API on a supplied subcanonical topology. Proving subcanonicity for
Kummer covers is the geometric target, not an extra hypothesis hidden in a proof. -/
def representable [J.Subcanonical] (U : C) : KummerEtaleSite C J := J.yoneda.obj U
end KummerEtaleSite

variable (I : Type w) [Category I]
/-- Diagram part only; cofilteredness, eventual finite Kummer transitions and
the finite initial stage are not yet typed through a geometric supplier. -/
abbrev ProKummerPresentation := Iᵒᵖ ⥤ C

abbrev ProKummerEtaleSite (D : Type u) [Category.{v} D]
    (K : GrothendieckTopology D) := Sheaf K (Type v)
end GenericSites

section Completions
variable (R : Type*) [CommRing R] (p : ℕ)

/-- Affine completed plus-ring component. This is not sheafification. -/
abbrev CompletedLogStructure := AdicCompletion (Ideal.span {(p : R)}) R

/-- Frobenius-compatible sequences in a characteristic-p coefficient ring.
The ring operations and multiplicative sharp map are supplied by tilt theory. -/
def FrobeniusSequences := {x : ℕ → R // ∀ n, x (n+1) ^ p = x n}

/-- Test TauCeti.LogAdic.CompletedLogStructure.frobenius_relation. -/
example (x : FrobeniusSequences R p) (n : ℕ) : x.val (n+1) ^ p = x.val n := by sorry

/-- Test TauCeti.LogAdic.CompletedLogStructure.not_localize_first.
After p is a unit, all p-adic quotients are zero. -/
example (hp : IsUnit (p : R)) : Ideal.span {(p : R)} = ⊤ := by sorry

variable [Fact p.Prime] [Fact ¬IsUnit (p : R)]
  [IsAdicComplete (Ideal.span {(p : R)}) R]

/-- Existing period carrier, with precisely its existing hypotheses.
The log-site instantiation and all period-sheaf claims are omitted. -/
abbrev LogConstantPeriods := BDeRhamPlus R p

namespace LogConstantPeriods
abbrev theta := fontaineThetaInvertP R p
end LogConstantPeriods
end Completions

section StructuralRelations
variable {A : Type u} {R : Type v} {P : Type w}
  [CommRing A] [CommRing R] [CommMonoid P]

/-- Relation ideal for compatible monoid lifts in a supplied coefficient ring.
The coefficient ring must already be the source's completed tensor algebra. -/
def structuralRelations (a b e : P →* A) : Ideal A :=
  Ideal.span {r | ∃ m : P, r = a m - b m * e m}

/-- Quotient followed by theta-kernel completion. Presentation colimits and
sheafification of the actual StructuralLogPeriodPlus remain unstated. -/
def StructuralLogPeriodPlus (a b e : P →* A) (theta : A →+* R)
    (hrel : ∀ m, theta (a m) = theta (b m) * theta (e m)) : Type u :=
  let S := A ⧸ structuralRelations a b e
  let thetaS : S →+* R := Ideal.Quotient.lift _ theta (by sorry)
  AdicCompletion (RingHom.ker thetaS) S

namespace StructuralLogPeriodPlus
/-- The defining relation before completion, without division by a boundary
coordinate. This is the affine relation part of the API. -/
theorem structural_relation (a b e : P →* A) (m : P) :
    Ideal.Quotient.mk (structuralRelations a b e) (a m) =
      Ideal.Quotient.mk (structuralRelations a b e) (b m * e m) := by sorry

/-- Test TauCeti.LogAdic.StructuralLogPeriodPlus.boundary_relation. -/
example (a b e : P →* A) (m : P) (hb : b m = 0) :
    Ideal.Quotient.mk (structuralRelations a b e) (a m) = 0 := by sorry
end StructuralLogPeriodPlus
end StructuralRelations

section LatticeFiltration
variable (R V : Type*) [CommRing R] [AddCommGroup V] [Module R V]

/-- Submodule and filtration data in a common ambient module. This omits
horizontal-section, lattice/localization and local-freeness conditions. -/
structure TwoDeRhamLattices where
  first : Submodule R V
  firstFilOne : Submodule R first
  secondFil : ℤ → Submodule R V
  antitone_second : Antitone secondFil

/-- Intersection image in the first-lattice quotient, indexed ascendently. -/
def LatticeHTFiltration (L : TwoDeRhamLattices R V) (i : ℤ) :
    Submodule R (L.first ⧸ L.firstFilOne) :=
  (L.secondFil (-i)).comap L.first.subtype |>.map L.firstFilOne.mkQ

namespace LatticeHTFiltration
variable {R V} (L : TwoDeRhamLattices R V)

theorem mem (i : ℤ) (x : L.first ⧸ L.firstFilOne) :
    x ∈ LatticeHTFiltration R V L i ↔
      ∃ m : L.first, (m : V) ∈ L.secondFil (-i) ∧ L.firstFilOne.mkQ m = x := by sorry

theorem mono : Monotone (LatticeHTFiltration R V L) := by sorry

/-- Test TauCeti.LogAdic.LatticeHTFiltration.correct_denominator:
the projection kernel on the intersection is the intersection with Fil¹ M. -/
example (i : ℤ) (m : (L.secondFil (-i)).comap L.first.subtype) :
    L.firstFilOne.mkQ m.val = 0 ↔ m.val ∈ L.firstFilOne := by sorry

/-- Test TauCeti.LogAdic.LatticeHTFiltration.weight_zero (one filtration step). -/
example (i : ℤ) (h : L.secondFil (-i) = ⊤) :
    LatticeHTFiltration R V L i = ⊤ := by sorry

/-- The zero side of the rank-one relative-position test is purely linear. -/
example (i : ℤ) (h : L.secondFil (-i) = ⊥) :
    LatticeHTFiltration R V L i = ⊥ := by sorry

variable {V' : Type*} [AddCommGroup V'] [Module R V']

/-- A map compatible with both lattices and filtrations induces the quotient
map. This is the module component, without asserting geometric association. -/
def quotientMap (L' : TwoDeRhamLattices R V') (f : V →ₗ[R] V')
    (hfirst : ∀ m ∈ L.first, f m ∈ L'.first)
    (hone : ∀ m : L.first, m ∈ L.firstFilOne →
      (⟨f m, hfirst m m.property⟩ : L'.first) ∈ L'.firstFilOne) :
    (L.first ⧸ L.firstFilOne) →ₗ[R] (L'.first ⧸ L'.firstFilOne) := by sorry

theorem map (L' : TwoDeRhamLattices R V') (f : V →ₗ[R] V')
    (hfirst : ∀ m ∈ L.first, f m ∈ L'.first)
    (hone : ∀ m : L.first, m ∈ L.firstFilOne →
      (⟨f m, hfirst m m.property⟩ : L'.first) ∈ L'.firstFilOne)
    (hsecond : ∀ j m, m ∈ L.secondFil j → f m ∈ L'.secondFil j) (i : ℤ) :
    (LatticeHTFiltration R V L i).map (quotientMap L L' f hfirst hone) ≤
      LatticeHTFiltration R V' L' i := by sorry
end LatticeHTFiltration
end LatticeFiltration

section CentralTwist
variable {G K V : Type*} [Group G] [Field K] [AddCommGroup V] [Module K V]

/-- Associated representation component of the central cyclotomic twist.
The torsor contracted product and geometric comparison are unstated. -/
def FiniteLeviComparison (chi : G →* Kˣ) (w : ℤ)
    (rho : Representation K G V) : Representation K G V where
  toFun g := (((chi g) ^ w : Kˣ) : K) • rho g
  map_one' := by sorry
  map_mul' := by sorry

namespace FiniteLeviComparison

/-- Test TauCeti.LogAdic.FiniteLeviComparison.weight_zero. -/
example (chi : G →* Kˣ) (rho : Representation K G V) :
    FiniteLeviComparison chi 0 rho = rho := by sorry

/-- Test TauCeti.LogAdic.FiniteLeviComparison.weight_one (associated action). -/
example (chi : G →* Kˣ) (rho : Representation K G V) (g : G) (v : V) :
    FiniteLeviComparison chi 1 rho g v = (chi g : K) • rho g v := by sorry

/-- A nontrivial central character can change the associated action. -/
example (chi : G →* Kˣ) (g : G) (hg : (chi g : K) ≠ 1) :
    FiniteLeviComparison chi 1 (Representation.trivial K G K) g 1 ≠ 1 := by sorry
end FiniteLeviComparison
end CentralTwist

end TauCeti.LogAdic

/-! ## Complete packet contract catalogue

The catalogue records mathematical signatures that need imported geometry.
It is not elaborated Lean. For a name with a component above, the statement
below is the full geometric target; the component alone does not prove it.
For a name marked not stated, no declaration or `example` is claimed.
The missing interfaces are precisely the prerequisites and gaps in the packet.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:log-sites/log-adic-space
TauCeti.LogAdic.LogAdicData: component above; full geometric signature not stated.

For an étale-sheafy adic space X, a log adic space is (X,M,α), with M a sheaf of commutative monoids on X_ét and α:M→(O_X,×) inducing α⁻¹(O_X×)≃O_X×. Morphisms are an adic map with the compatible inverse-image monoid-sheaf map; strictness means f* M_X≃M_Y. Fine and fs mean étale-locally charted by fine and saturated monoids, not that every section monoid is finitely generated.

Hypotheses: X is étale sheafy; use the locally noetherian analytic category for all geometric results below.

Suppliers and local inputs: AdicEtaleGeometry:A1/etale-site, AdicEtaleGeometry:A1/etale-structure-sheaf, CrystallineCohomology:CR.5:log-algebra/log-structure, CrystallineCohomology:CR.5:log-algebra/associated-log, CrystallineCohomology:CR.5:log-algebra/log-pullback.

TauCeti.LogAdic.LogAdicData [constructor]: component above; full contract follows.
Bundle the monoid sheaf, structural map and unit isomorphism over the imported étale ringed adic carrier.

TauCeti.LogAdic.LogAdicData.strict [characterisation]: not stated; depends on the full geometric constructor.
f is strict exactly when the logified pullback map is an isomorphism.

TauCeti.LogAdic.LogAdicData.map_id [functoriality]: not stated; depends on the full geometric constructor.
Identity inverse image induces the identity log morphism.

TauCeti.LogAdic.LogAdicData.map_comp [functoriality]: not stated; depends on the full geometric constructor.
The composite log map is the composite of the inverse-image structural maps.

TauCeti.LogAdic.LogAdicData.trivial_units [degenerate]: component example above; full test follows.
For M=O_X× the unit comparison is the identity.

TauCeti.LogAdic.LogAdicData.unit_fiber [characterisation]: component example above; full test follows.
At every geometric stalk, each unit of O_X has a unique lift in α⁻¹(O_X×).

TauCeti.LogAdic.LogAdicData.not_terminal_monoid [non-example]: component example above; full test follows.
For Spa(Q_p,Z_p), the one-element monoid mapping to 1 is not a log structure because Q_p× has more than one element.

Source: DLLZ-adic Definition 2.2.2(1)–(10), pp. 8–9.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:log-sites/integral-adic-chart
TauCeti.LogAdic.IntegralChart: component above; full geometric signature not stated.

A chart θ:P_X→M_X has αθ(P_X)⊂O_X⁺ and induces P_X^a≃M_X. An fs analytic chart uses an fs monoid P. At a geometric point x the characteristic monoid is P/(αθ)⁻¹(O_X,x×); a chart need not be sharp or equal to that characteristic monoid. Morphism charts fit into P→Q and compatible structural maps.

Hypotheses: Use DLLZ charts, which have the additional integral-image condition.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:log-sites/log-adic-space, CrystallineCohomology:CR.5:log-algebra/log-chart, tauceti:TauCeti.Huber.Pair, AdicSpacesPartII:R0.

TauCeti.LogAdic.IntegralChart [constructor]: component above; full contract follows.
A monoid map P→M(U), its factorization through O⁺(U), and the associated-log isomorphism.

TauCeti.LogAdic.IntegralChart.mem_plus [projection]: component above; full contract follows.
Every structural image of a chart element belongs to the designated plus ring.

TauCeti.LogAdic.IntegralChart.characteristic [compatibility]: not stated; depends on the full geometric constructor.
Its stalk characteristic is the quotient by the face of elements with unit structural image.

TauCeti.LogAdic.IntegralChart.pullback [functoriality]: not stated; depends on the full geometric constructor.
Adic pullback gives the compatible integral chart on the pullback log structure.

TauCeti.LogAdic.IntegralChart.unit_chart [degenerate]: not stated as an example; needs the full geometric constructor.
A chart with all images units has zero characteristic.

TauCeti.LogAdic.IntegralChart.coordinate_axis [computation]: not stated as an example; needs the full geometric constructor.
For the chart N→k⟨T⟩, 1↦T, the characteristic at T=0 is N and off T=0 is zero.

TauCeti.LogAdic.IntegralChart.reject_inverse_p [non-example]: component example above; full test follows.
For Spa(Q_p,Z_p), the prelog map N→Q_p, 1↦p⁻¹, fails the chart integral-image condition even though logification is trivial.

Source: DLLZ-adic Definition 2.3.1 and Remarks 2.3.2–2.3.4, pp. 12–13.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:log-sites/divisorial-analytic-log
TauCeti.LogAdic.DivisorialLog: not stated; needs the geometric carriers listed below.

For X smooth over a characteristic-zero nonarchimedean field and D a strict normal-crossings divisor, U=X−D and M_X=O_X∩j_*O_U× on X_ét define an fs log structure. Locally with D={T₁⋯T_r=0}, its characteristic chart is N^r with e_i↦T_i, after integral rescaling. Pullback from an algebraic fs divisorial log pair is an analytification construction, not an identification of its algebraic and analytic sites.

Hypotheses: X smooth, D strict normal crossings; use an étale chart for a merely normal-crossings boundary.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:log-sites/integral-adic-chart, CrystallineCohomology:CR.5:log-algebra/divisorial-log, AdicSpacesPartII:R4, AdicSpacesPartII:R1.

TauCeti.LogAdic.DivisorialLog [constructor]: not stated; depends on the full geometric constructor.
The log structure O_X∩j_*O_U× associated to the specified boundary complement.

TauCeti.LogAdic.DivisorialLog.restrict_open [compatibility]: not stated; depends on the full geometric constructor.
Restriction to U is the trivial log structure.

TauCeti.LogAdic.DivisorialLog.chart [characterisation]: not stated; depends on the full geometric constructor.
On r boundary coordinate hyperplanes the characteristic chart is N^r.

TauCeti.LogAdic.DivisorialLog.analytification [compatibility]: not stated; depends on the full geometric constructor.
For an algebraic SNC pair its analytic pullback log structure agrees with the analytic divisorial log structure.

TauCeti.LogAdic.DivisorialLog.empty_boundary [degenerate]: not stated as an example; needs the full geometric constructor.
If D is empty, M=O_X×.

TauCeti.LogAdic.DivisorialLog.double_intersection [computation]: not stated as an example; needs the full geometric constructor.
At the crossing T₁=T₂=0, characteristic monoid is N², while at its generic branches it is N.

TauCeti.LogAdic.DivisorialLog.not_all_functions [non-example]: not stated as an example; needs the full geometric constructor.
At a point of U, a function vanishing at that point is not a section of M; M is not all of O_X.

Source: DLLZ-adic Examples 2.3.16–2.3.17, pp. 16–17.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:log-sites/saturated-adic-products
TauCeti.LogAdic.FsAdicPullback: not stated; needs the geometric carriers listed below.

In the locally noetherian coherent/fine/fs categories with the source lft hypotheses ensuring ordinary products exist, form log fibre products by ordinary adic product with monoid pushout, then integralize or saturate in the analytic category. Integralization/saturation are right adjoints to inclusion, with a closed integralization and finite surjective saturation map. The resulting underlying adic space can differ from the ordinary fibre product.

Hypotheses: Use DLLZ Proposition 2.3.27 hypotheses; saturation requires coherent charts on locally noetherian carriers.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:log-sites/integral-adic-chart, CrystallineCohomology:CR.5:log-algebra/integral-log-fiber-product, CrystallineCohomology:CR.5:log-algebra/saturated-monoid, AdicSpacesPartII:R0.

TauCeti.LogAdic.FsAdicPullback [constructor]: not stated; depends on the full geometric constructor.
The analytic fs fibre product, with projections and compatibility over the base.

TauCeti.LogAdic.FsAdicPullback.lift [universal-property]: not stated; depends on the full geometric constructor.
Compatible fs log maps have a unique map to the fs pullback.

TauCeti.LogAdic.FsAdicPullback.strict_base_change [compatibility]: not stated; depends on the full geometric constructor.
Under strict base change the induced log structure is the ordinary pullback structure.

TauCeti.LogAdic.FsAdicPullback.symmetry [equivalence]: not stated; depends on the full geometric constructor.
Interchanging factors gives the canonical involutive isomorphism.

TauCeti.LogAdic.FsAdicPullback.identity [degenerate]: not stated as an example; needs the full geometric constructor.
Y×_X X≃Y as fs log adic spaces.

TauCeti.LogAdic.FsAdicPullback.root_double [computation]: not stated as an example; needs the full geometric constructor.
For N→N multiplication by n, the saturated self-product of the n-th root cover splits into μ_n-labelled copies after adjoining μ_n; the ordinary equation uⁿ=vⁿ alone is not its fs description.

TauCeti.LogAdic.FsAdicPullback.mapping_property [characterisation]: not stated as an example; needs the full geometric constructor.
Two morphisms from an fs test space coincide if their two projection maps coincide.

Source: DLLZ-adic Propositions 2.3.23 and 2.3.27; Lemma 2.3.33, pp. 18–20.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:log-sites/log-smooth-chart-criterion
TauCeti.LogAdic.log_smooth_chart_criterion: not stated; needs the geometric carriers listed below.

For a map of locally noetherian fs log adic spaces, log smoothness (respectively log étaleness) is intrinsic and equivalent to étale-local fs charts P→Q whose group kernel and torsion cokernel (respectively entire cokernel) are finite of orders invertible in O_X, and whose induced underlying map Y→X×_{X⟨P⟩}X⟨Q⟩ is étale. These properties are stable under composition and fs base change; a strict log smooth/étale map is ordinarily smooth/étale.

Hypotheses: The index is invertible in O_X, not necessarily O_X⁺. Log smoothness does not imply ordinary smoothness without strictness.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:log-sites/saturated-adic-products, CrystallineCohomology:CR.5:log-algebra/log-smooth-chart-criterion, AdicEtaleGeometry:A1/etale-site, AdicSpacesPartII:R0.

Source: DLLZ-adic Definition 3.1.1, Propositions 3.1.3–3.1.7, pp. 21–24.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:log-sites/continuous-log-derivation
TauCeti.LogAdic.ContinuousLogDerivation: component above; full geometric signature not stated.

For a continuous prelog Huber-ring map (A,M,α)→(B,N,β) and a complete Hausdorff topological B-module L, a log derivation is a pair (d,δ): d is a continuous A-linear derivation B→L, δ:N→(L,+) is a monoid map, δ(f♯m)=0 and d(βn)=βn·δn. The pair is unchanged by logification and δ extends uniquely to N^gp.

Hypotheses: Completeness belongs to the target L; do not silently replace continuous derivations by algebraic derivations.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:log-sites/log-adic-space, CrystallineCohomology:CR.5:log-algebra/prelog-ring, mathlib:Derivation, AdicSpacesPartII:R0.

TauCeti.LogAdic.ContinuousLogDerivation [constructor]: component above; full contract follows.
Bundle a continuous derivation and monoid-to-additive map satisfying the relative-zero and compatibility equations.

TauCeti.LogAdic.ContinuousLogDerivation.ext [extensionality]: component above; full contract follows.
Equality of d and δ gives equality of the log derivation.

TauCeti.LogAdic.ContinuousLogDerivation.map_structural [relation]: component above; full contract follows.
d(βn)=βn·δ(n).

TauCeti.LogAdic.ContinuousLogDerivation.postcompose [functoriality]: component above; full contract follows.
A continuous B-linear map L→L′ induces a log derivation to L′; identity and composite maps agree.

TauCeti.LogAdic.ContinuousLogDerivation.zero [degenerate]: component example above; full test follows.
The pair of zero maps is a continuous log derivation.

TauCeti.LogAdic.ContinuousLogDerivation.unit_formula [computation]: component example above; full test follows.
For a unit β(n), δ(n)=β(n)⁻¹d(β(n)).

TauCeti.LogAdic.ContinuousLogDerivation.boundary_value [non-example]: not stated as an example; needs the full geometric constructor.
For β(1)=T and d(T)=T, δ(1)=1; at T=0, d(T)=0 does not force δ(1)=0.

Source: DLLZ-adic Definition 3.2.2 and Remark 3.2.3, p. 26.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:log-sites/continuous-log-differentials
TauCeti.LogAdic.ContinuousLogDifferentials: not stated; needs the geometric carriers listed below.

For a topologically finite-type complete log Huber-ring map, Ω¹_log is the finite B-module representing continuous log derivations. It is constructed from the continuous ordinary differential module and B⊗_Z N^gp by imposing dβ(n)=β(n)⊗n and f♯M=0. In the completed log diagonal construction it is J/J²; finiteness makes this module complete in its natural topology, without a second arbitrary completion. For strict maps it is the ordinary continuous differential module.

Hypotheses: Topologically finite-type, complete log Huber rings/pairs as in DLLZ §3.2; the unrestricted algebraic Kähler module is not the analytic carrier.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:log-sites/continuous-log-derivation, CrystallineCohomology:CR.5/log-differentials, AdicSpacesPartII:R3.

TauCeti.LogAdic.ContinuousLogDifferentials [constructor]: not stated; depends on the full geometric constructor.
The complete representing module with d and dlog.

TauCeti.LogAdic.ContinuousLogDifferentials.lift [universal-property]: not stated; depends on the full geometric constructor.
Continuous B-linear maps out correspond bijectively to continuous log derivations.

TauCeti.LogAdic.ContinuousLogDifferentials.lift_unique [extensionality]: not stated; depends on the full geometric constructor.
A map is determined by values on d(b) and dlog(n).

TauCeti.LogAdic.ContinuousLogDifferentials.strict [compatibility]: not stated; depends on the full geometric constructor.
For a strict map the module identifies with the imported continuous Ω¹_{B/A}.

TauCeti.LogAdic.ContinuousLogDifferentials.identity [degenerate]: not stated as an example; needs the full geometric constructor.
For the identity log Huber map the module is zero.

TauCeti.LogAdic.ContinuousLogDifferentials.toric_rank [computation]: not stated as an example; needs the full geometric constructor.
Over k, Ω¹_log of k⟨T₁,…,T_r⟩ with coordinate log structure is free on dlog T_i.

TauCeti.LogAdic.ContinuousLogDifferentials.coordinate_relation [characterisation]: not stated as an example; needs the full geometric constructor.
In that module dT_i=T_i dlog T_i; imposing dlog T_i=0 at T_i=0 is incorrect.

Source: DLLZ-adic Proposition 3.2.9, Lemma 3.2.10 and Definition 3.2.14, pp. 27–28.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:log-sites/log-differential-descent
TauCeti.LogAdic.log_differential_descent: not stated; needs the geometric carriers listed below.

The continuous affine modules descend to the coherent sheaf Ω¹_{Y/X,log} for lft locally noetherian log adic maps. They have log-étale base-change and the right-exact transitivity sequence f*Ω¹_{X/S,log}→Ω¹_{Y/S,log}→Ω¹_{Y/X,log}→0; for log smooth f the relative module is finite locally free and the corresponding sequence in the smooth setting is short exact. For log étale f it is zero.

Hypotheses: Use the formal log smoothness/lft equivalence of Theorem 3.3.17; all products and pullbacks are analytic fs products.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:log-sites/continuous-log-differentials, HodgeTateAndCanonicalSubgroups:T6:log-sites/log-smooth-chart-criterion, AdicSpacesPartII:R3.

Source: DLLZ-adic Constructions 3.3.2–3.3.4, Proposition 3.3.7 and Theorem 3.3.17, pp. 34–39.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:log-sites/analytic-log-de-rham
TauCeti.LogAdic.AnalyticLogDR: component above; full geometric signature not stated.

For a log smooth analytic map, Ω^q_log=∧^q Ω¹_log and the differential extends d with d(dlog m)=0. For a continuous integrable log connection E→E⊗Ω¹_log the coefficient complex is E⊗Ω^•_log. On an SNC pair, residue along D_i sends dlog T_i to 1, the other coordinate dlogs and regular differentials to 0 after restriction; pullback residues multiply by boundary multiplicities.

Hypotheses: Use continuous coherent analytic modules and an integrable coefficient connection, not unrestricted algebraic modules.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:log-sites/log-differential-descent, HodgeTateAndCanonicalSubgroups:T6:log-sites/divisorial-analytic-log, CrystallineCohomology:CR.5/log-de-rham, CrystallineCohomology:CR.5/log-connection, AdicSpacesPartII:R3.

TauCeti.LogAdic.AnalyticLogDR [constructor]: component above; full contract follows.
The cohomological continuous coefficient log de Rham complex.

TauCeti.LogAdic.AnalyticLogDR.d_sq [relation]: component above; full contract follows.
Successive differentials compose to zero by integrability.

TauCeti.LogAdic.AnalyticLogDR.residue [projection]: not stated; depends on the full geometric constructor.
The boundary residue map on differential forms and coefficient connections.

TauCeti.LogAdic.AnalyticLogDR.pullback_residue [functoriality]: not stated; depends on the full geometric constructor.
Residues transform by the integer boundary-multiplicity matrix.

TauCeti.LogAdic.AnalyticLogDR.empty_boundary [compatibility]: not stated as an example; needs the full geometric constructor.
With trivial log structure this is the ordinary continuous de Rham complex.

TauCeti.LogAdic.AnalyticLogDR.residue_coordinate [computation]: not stated as an example; needs the full geometric constructor.
res_{T=0}(dlog T)=1, while res(dT)=0.

TauCeti.LogAdic.AnalyticLogDR.root_pullback [computation]: not stated as an example; needs the full geometric constructor.
Under T=S^n, pullback dlog T=n dlog S and its residue is n.

Source: DLLZ-RH Definition 3.1.7, pp. 23–24 and Corollary 3.5.7, p. 39; continuous exterior forms in DLLZ-adic Definition 3.3.19, p. 40.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-etale-morphism
TauCeti.LogAdic.KummerEtale: not stated; needs the geometric carriers listed below.

A map of locally noetherian fs log adic spaces is Kummer if every characteristic stalk map is injective and every target element has a positive multiple in its image. It is Kummer étale when also log étale. Étale-locally it is an étale map following an fs root-chart map whose finite group index is invertible in O_X. Kummer étale and finite Kummer étale maps are stable under composition and fs base change.

Hypotheses: Use characteristic stalks, and the index in O_X rather than O_X⁺.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:log-sites/log-smooth-chart-criterion, CrystallineCohomology:CR.5:log-algebra/kummer-morphism, HodgeTateAndCanonicalSubgroups:T6:log-sites/saturated-adic-products.

TauCeti.LogAdic.KummerEtale [constructor]: not stated; depends on the full geometric constructor.
A log étale map together with the Kummer condition on characteristic stalks.

TauCeti.LogAdic.KummerEtale.root_chart [characterisation]: not stated; depends on the full geometric constructor.
Étale locally a Kummer étale map factors through an admissible finite root chart.

TauCeti.LogAdic.KummerEtale.comp [functoriality]: not stated; depends on the full geometric constructor.
Composition preserves Kummer étaleness.

TauCeti.LogAdic.KummerEtale.base_change [functoriality]: not stated; depends on the full geometric constructor.
Fs analytic base change preserves Kummer étaleness.

TauCeti.LogAdic.KummerEtale.strict [compatibility]: not stated as an example; needs the full geometric constructor.
A strict Kummer étale map is ordinarily étale.

TauCeti.LogAdic.KummerEtale.p_root_char_zero [computation]: not stated as an example; needs the full geometric constructor.
T=S^p with coordinate logs is Kummer étale over a characteristic-zero p-adic field.

TauCeti.LogAdic.KummerEtale.reject_p_root_char_p [non-example]: not stated as an example; needs the full geometric constructor.
Over characteristic p, the same nontrivial coordinate root map is not log étale because the index p is not invertible in O_X.

Source: DLLZ-adic Definitions 4.1.1–4.1.2, Proposition 4.1.6 and Propositions 4.1.14–4.1.15, pp. 41–46.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-root-covers
TauCeti.LogAdic.RootCover: component above; full geometric signature not stated.

For a sharp fs chart P and n≥1 invertible in O_X, define X^{1/n}=X×_{X⟨P⟩}X⟨(1/n)P⟩ in the fs category. It is finite surjective Kummer étale. When all n-th roots of unity are present, its chart Galois group is Hom((1/n)P^gp/P^gp,μ_n), with the action on root monomials; a finite Kummer cover is locally dominated by such a root cover followed by a strict étale map.

Hypotheses: The chart is integral; the chosen base contains μ_n for the stated Galois description.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-etale-morphism, HodgeTateAndCanonicalSubgroups:T6:log-sites/integral-adic-chart, HodgeTateAndCanonicalSubgroups:T6:log-sites/saturated-adic-products, AdicSpacesPartII:R0.

TauCeti.LogAdic.RootCover [constructor]: component above; full contract follows.
The fs n-th root cover of an integral sharp fs chart.

TauCeti.LogAdic.RootCover.action [structure]: not stated; depends on the full geometric constructor.
Hom((1/n)P^gp/P^gp,μ_n) acts by multiplying the root monomial of a by its character.

TauCeti.LogAdic.RootCover.refine [functoriality]: not stated; depends on the full geometric constructor.
For n dividing m the m-th root cover maps to the n-th root cover, compatibly under divisibility composition.

TauCeti.LogAdic.RootCover.strictify [compatibility]: not stated; depends on the full geometric constructor.
After sufficiently divisible root base change a finite Kummer cover becomes strictly finite étale.

TauCeti.LogAdic.RootCover.one [degenerate]: component example above; full test follows.
The first root cover is X.

TauCeti.LogAdic.RootCover.disc_action [computation]: component example above; full test follows.
For P=N and μ_n present, ζ sends S to ζS on T=S^n.

TauCeti.LogAdic.RootCover.ramified_boundary [non-example]: not stated as an example; needs the full geometric constructor.
For n>1 the root map on the log disc has ramification index n at T=0 and is not strict étale there.

Source: DLLZ-adic Definition 4.1.5 and Proposition 4.1.6, pp. 41–42.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-ramification-index
TauCeti.LogAdic.RamificationIndex: component above; full geometric signature not stated.

At a geometric point of a Kummer map the ramification index is the exponent of the finite abelian group coker(M̄_X^gp→M̄_Y^gp), not its cardinality. A Kummer étale map has index one everywhere exactly when it is strict étale.

Hypotheses: The cokernel is finite for the fs Kummer maps under consideration.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-etale-morphism, CrystallineCohomology:CR.5:log-algebra/characteristic-monoid.

TauCeti.LogAdic.RamificationIndex [constructor]: component above; full contract follows.
The exponent of the characteristic group cokernel at the specified point.

TauCeti.LogAdic.RamificationIndex.index_one [characterisation]: component above; full contract follows.
Index one for a Kummer étale map is equivalent to strict étaleness at that point.

TauCeti.LogAdic.RamificationIndex.base_change [compatibility]: not stated; depends on the full geometric constructor.
Compute the index from the saturated base-changed characteristic map; it can decrease after root base change.

TauCeti.LogAdic.RamificationIndex.identity [degenerate]: component example above; full test follows.
The identity has index one.

TauCeti.LogAdic.RamificationIndex.two_coordinates [computation]: component example above; full test follows.
Multiplication by n on N² has index n, since the cokernel is (Z/n)².

TauCeti.LogAdic.RamificationIndex.off_boundary [computation]: component example above; full test follows.
On the boundary complement the coordinate-root characteristic cokernel is zero and the index is one.

Source: DLLZ-adic Definition 4.1.12 and Lemma 4.1.13, pp. 44–45.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-etale-site
TauCeti.LogAdic.KummerEtaleSite: component above; full geometric signature not stated.

For a locally noetherian fs log adic X, X_két has all Kummer étale Y→X as objects, all X-log morphisms, and jointly surjective families on the underlying topological spaces as coverings. Composition, cancellation and fs products give a pretopology; representables are sheaves. O, O⁺ and M are sheaves obtained from the underlying analytic/log carriers. For affinoid X, H^i(X_két,O)=0 for i>0. The strict étale inclusion defines ε:X_két→X_ét.

Hypotheses: All topological points, including higher-rank points, count in joint surjectivity.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-etale-morphism, HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-root-covers, AdicEtaleGeometry:A1/etale-site, mathlib:CategoryTheory.GrothendieckTopology, mathlib:CategoryTheory.Sheaf, ClassicalAdicEtaleCohomology:H0.

TauCeti.LogAdic.KummerEtaleSite [constructor]: component above; full contract follows.
The category, joint-surjectivity topology, and structural sheaves.

TauCeti.LogAdic.KummerEtaleSite.epsilon [projection]: not stated; depends on the full geometric constructor.
The geometric morphism to the ordinary étale site induced by strict objects.

TauCeti.LogAdic.KummerEtaleSite.pullback [functoriality]: not stated; depends on the full geometric constructor.
Fs log base change induces the inverse-image functor, with identity and composition coherence.

TauCeti.LogAdic.KummerEtaleSite.representable [structure]: component above; full contract follows.
Representable presheaves satisfy Kummer étale descent.

TauCeti.LogAdic.KummerEtaleSite.trivial_log [compatibility]: not stated as an example; needs the full geometric constructor.
For the trivial log structure, X_két≃X_ét as ringed sites.

TauCeti.LogAdic.KummerEtaleSite.root_is_cover [computation]: not stated as an example; needs the full geometric constructor.
A finite root cover of a coordinate disc is a covering object even at T=0.

TauCeti.LogAdic.KummerEtaleSite.no_closed_point_shortcut [non-example]: not stated as an example; needs the full geometric constructor.
A family covering only rank-one classical points is not declared a cover without joint surjectivity on every adic point.

Source: DLLZ-adic Definition 4.1.16, pp. 46–47; Theorem 4.3.1 and Propositions 4.3.4–4.3.5, pp. 52–55.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-coherent-acyclicity
TauCeti.LogAdic.kummer_coherent_acyclicity: not stated; needs the geometric carriers listed below.

For an affinoid noetherian fs log adic X, H^i(X_két,F)=0 for i>0 if F is an analytic coherent O-module, or if F is coherent and X is over an affinoid field. The analytic qualification and the field alternative are retained: this is not a claim for every coherent module over an arbitrary affinoid base.

Hypotheses: Use the two alternatives of DLLZ Theorem 4.3.7.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-etale-site, HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-root-covers, AdicSpacesPartII:R3, ClassicalAdicEtaleCohomology:H0.

Source: DLLZ-adic Theorem 4.3.7, pp. 55–56.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:log-sites/finite-kummer-descent
TauCeti.LogAdic.finite_kummer_descent: not stated; needs the geometric carriers listed below.

Finite Kummer étale covers satisfy effective descent along surjective Kummer étale maps; locally constant finite sheaves are represented by finite Kummer covers, and on connected pointed X their fibres identify with continuous finite representations of π₁_két(X). Finite locally constant coefficient-module sheaves have the corresponding representation description.

Hypotheses: Locally noetherian fs X; use log geometric points rather than unlogged geometric points for the fibre functor.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-etale-site, HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-root-covers, ClassicalAdicEtaleCohomology:H0.

Source: DLLZ-adic Theorems 4.4.12, 4.4.15 and Corollary 4.4.18, pp. 60–63.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:log-sites/rigid-abhyankar
TauCeti.LogAdic.rigid_abhyankar: not stated; needs the geometric carriers listed below.

For X smooth rigid analytic over a characteristic-zero nonarchimedean field, D an SNC divisor, and U=X−D, every finite étale cover of U extends to a finite Kummer étale cover of X with its divisorial log structure. After a sufficiently divisible finite root cover of the boundary chart the extension is strict finite étale.

Hypotheses: Use the normalization/finite extension theorem on smooth analytic pairs; do not assume the original cover is étale over D.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:log-sites/divisorial-analytic-log, HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-root-covers, HodgeTateAndCanonicalSubgroups:T6:log-sites/finite-kummer-descent, AdicSpacesPartII:R0, AdicSpacesPartII:R3.

Source: DLLZ-adic Proposition 4.2.1 and Lemmas 4.2.2–4.2.3, pp. 47–49.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:log-sites/boundary-local-system-extension
TauCeti.LogAdic.boundary_local_system_extension: not stated; needs the geometric carriers listed below.

For a smooth characteristic-zero analytic SNC pair j:U→X, restriction gives an equivalence of finite locally constant torsion sheaves on X_két and U_ét, with inverse j_két,* and R^i j_két,*L=0 for i>0. Thus their torsion cohomologies agree. This extension statement does not require X proper; finiteness of cohomology is a separate proper-comparison conclusion.

Hypotheses: Use the pair of Example 2.3.17 and torsion local systems of Corollary 4.6.7.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:log-sites/rigid-abhyankar, HodgeTateAndCanonicalSubgroups:T6:log-sites/finite-kummer-descent, ClassicalAdicEtaleCohomology:H0.

Source: DLLZ-adic Theorem 4.6.1 and Corollary 4.6.7, pp. 68–69.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:log-sites/pro-kummer-presentations
TauCeti.LogAdic.ProKummerPresentation: component above; full geometric signature not stated.

In pro-X_két, a pro-Kummer étale U→V admits a cofiltered presentation by Kummer étale U_i→V with transitions eventually finite Kummer étale and surjective. A finite-stage Kummer morphism in the pro-category is a base change of a morphism in X_két; this is stronger than a statement about the limit topological map. Underlying spaces are inverse limits of the finite-stage spaces.

Hypotheses: Cofiltered small presentations and eventual transition condition, as in Definition 5.1.1.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-etale-site, AdicEtaleGeometry:A1/pro-etale-morphism, EnhancedDerivedSheaves:E1.

TauCeti.LogAdic.ProKummerPresentation [constructor]: component above; full contract follows.
A cofiltered finite-level Kummer presentation with eventually finite surjective transitions.

TauCeti.LogAdic.ProKummerPresentation.reindex [equivalence]: not stated; depends on the full geometric constructor.
Cofinal reindexing represents the same pro-object.

TauCeti.LogAdic.ProKummerPresentation.base_change [functoriality]: not stated; depends on the full geometric constructor.
Base change of the finite-level presentation represents the fs pullback pro-object.

TauCeti.LogAdic.ProKummerPresentation.constant [degenerate]: not stated as an example; needs the full geometric constructor.
A constant finite Kummer object has a valid presentation.

TauCeti.LogAdic.ProKummerPresentation.root_tower [computation]: not stated as an example; needs the full geometric constructor.
The divisibility-indexed system of all coordinate root covers is pro-Kummer étale.

TauCeti.LogAdic.ProKummerPresentation.eventual_surjectivity [non-example]: not stated as an example; needs the full geometric constructor.
A raw inverse system with no eventually finite surjective transitions does not qualify merely because its limit topological map is surjective.

Source: DLLZ-adic Definition 5.1.1 and Lemma 5.1.4, pp. 70–71.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:log-sites/corrected-pro-kummer-covers
TauCeti.LogAdic.CorrectedProKummerCover: not stated; needs the geometric carriers listed below.

A covering family {U_a→U} consists of pro-Kummer maps jointly surjective on all underlying points, each supplied with a tower indexed by ordinals μ<λ, starting at U₀=U, such that U_μ→lim_{μ′<μ}U_μ′ is pulled back from a Kummer étale map and, for all sufficiently large μ, from a finite surjective Kummer étale map. These exact tower conditions, not arbitrary surjective pro-morphisms, generate the topology.

Hypotheses: Use DLLZ Definition 5.1.2 including its eventual clause; distinguish it from an arbitrary countable inverse sequence.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:log-sites/pro-kummer-presentations, AdicEtaleGeometry:A1/corrected-covers-pretopology, mathlib:CategoryTheory.GrothendieckTopology.

TauCeti.LogAdic.CorrectedProKummerCover [constructor]: not stated; depends on the full geometric constructor.
A joint-surjectivity proof plus the ordinal tower certificates with eventual finite-surjective steps.

TauCeti.LogAdic.CorrectedProKummerCover.pullback [functoriality]: not stated; depends on the full geometric constructor.
Pullback of a certified cover is a certified cover.

TauCeti.LogAdic.CorrectedProKummerCover.refinement [structure]: not stated; depends on the full geometric constructor.
Composite coverings admit a common transfinite refinement with the same step conditions.

TauCeti.LogAdic.CorrectedProKummerCover.identity [degenerate]: not stated as an example; needs the full geometric constructor.
The identity family is a cover.

TauCeti.LogAdic.CorrectedProKummerCover.finite_stage [compatibility]: not stated as an example; needs the full geometric constructor.
Every finite-stage jointly surjective Kummer étale family gives a cover of constant pro-objects.

TauCeti.LogAdic.CorrectedProKummerCover.need_tower [non-example]: not stated as an example; needs the full geometric constructor.
Joint topological surjectivity alone is not the definition of a pro-Kummer cover; the tower certificate is required.

Source: DLLZ-adic Definition 5.1.2(1)–(3) and Lemma 5.1.4, pp. 70–71.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:log-sites/pro-kummer-etale-site
TauCeti.LogAdic.ProKummerEtaleSite: component above; full geometric signature not stated.

X_prokét is the full category of pro-Kummer objects over X, with the topology generated by the corrected transfinite covers. It has finite limits and a qcqs generating basis; its topos is algebraic. Constant objects define ν:X_prokét→X_két. Trivial log structure recovers the corrected ordinary pro-étale site, not the obsolete naive covering definition.

Hypotheses: X locally noetherian fs, pro-objects and covers as the preceding definitions.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:log-sites/corrected-pro-kummer-covers, HodgeTateAndCanonicalSubgroups:T6:log-sites/pro-kummer-presentations, AdicEtaleGeometry:A1/pro-etale-site-corrected, mathlib:CategoryTheory.Sheaf.

TauCeti.LogAdic.ProKummerEtaleSite [constructor]: component above; full contract follows.
The category, corrected topology and qcqs basis.

TauCeti.LogAdic.ProKummerEtaleSite.nu [projection]: not stated; depends on the full geometric constructor.
The site morphism ν induced by constant Kummer objects.

TauCeti.LogAdic.ProKummerEtaleSite.pullback [functoriality]: not stated; depends on the full geometric constructor.
Fs log maps induce coherent pullback functors on the pro-Kummer topoi.

TauCeti.LogAdic.ProKummerEtaleSite.trivial_log [equivalence]: not stated; depends on the full geometric constructor.
Trivial logs recover the corrected ordinary pro-étale site.

TauCeti.LogAdic.ProKummerEtaleSite.final_object [degenerate]: not stated as an example; needs the full geometric constructor.
Constant X is final in the site category.

TauCeti.LogAdic.ProKummerEtaleSite.constant_root [computation]: not stated as an example; needs the full geometric constructor.
A finite root cover of X gives a constant covering object of X_prokét.

TauCeti.LogAdic.ProKummerEtaleSite.ordinary_compatibility [compatibility]: not stated as an example; needs the full geometric constructor.
On a trivially logged X, the ν projection matches the ordinary corrected ν under the site equivalence.

Source: DLLZ-adic Definition 5.1.2 and Proposition 5.1.5, pp. 70–72.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:log-sites/log-site-projections
TauCeti.LogAdic.log_site_projections: not stated; needs the geometric carriers listed below.

For an abelian sheaf F on X_két and qcqs U=lim U_i in X_prokét, H^q(U,ν⁻¹F)=colim_i H^q(U_i,F). The unit F→Rν_*ν⁻¹F is an isomorphism, so inverse image is fully faithful and preserves the cohomology of X. Combine ν with ε and the analytic-site projection, and with restriction to the boundary complement.

Hypotheses: Use qcqs U and finite-level basis as in Proposition 5.1.6, not an unrestricted sections formula on arbitrary objects.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:log-sites/pro-kummer-etale-site, HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-etale-site, HodgeTateAndCanonicalSubgroups:T6:log-sites/boundary-local-system-extension, AdicEtaleGeometry:A1/proetale-projection-nu, ClassicalAdicEtaleCohomology:H0, EnhancedDerivedSheaves:E1.

Source: DLLZ-adic Propositions 5.1.6–5.1.7 and Corollary 5.1.8, p. 72.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:log-sites/all-root-toric-tower
TauCeti.LogAdic.AllRootTower: component above; full geometric signature not stated.

For a sharp fs monoid P and a strict smooth toric chart X→Spa(k⟨P⟩,k⁺⟨P⟩), take the divisibility-indexed system of chart covers (1/n)P and field extensions containing μ_n. Over a perfectoid algebraically closed base its completed affinoid limit is perfectoid, its chart limit is P_{Q≥0}, and geometric Galois group Γ=Hom(P^gp,Ẑ(1)). Cyclotomic arithmetic adds the corresponding semidirect Galois action.

Hypotheses: Characteristic zero analytic X; for the arithmetic tower k is p-adic and k_∞ is the cyclotomic extension.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-root-covers, HodgeTateAndCanonicalSubgroups:T6:log-sites/pro-kummer-presentations, PerfectoidSpaces:P1/perfectoid-tate-rings-and-algebras, PerfectoidSpaces:P3/almost-purity-theorem.

TauCeti.LogAdic.AllRootTower [constructor]: component above; full contract follows.
The divisibility-indexed root presentation together with its field/root-of-unity data.

TauCeti.LogAdic.AllRootTower.character_action [simp]: not stated; depends on the full geometric constructor.
γ(e^a)=χ_a(γ)e^a on a root monomial.

TauCeti.LogAdic.AllRootTower.geometric_group [characterisation]: not stated; depends on the full geometric constructor.
The geometric group is Hom(P^gp,Ẑ(1)).

TauCeti.LogAdic.AllRootTower.cyclotomic_conjugation [relation]: not stated; depends on the full geometric constructor.
Arithmetic conjugation acts on the geometric Ẑ(1)-directions through the cyclotomic character.

TauCeti.LogAdic.AllRootTower.rank_zero [degenerate]: component example above; full test follows.
For P=0, the geometric root group is trivial.

TauCeti.LogAdic.AllRootTower.two_coordinates [computation]: component example above; full test follows.
For P=N² the geometric group is Ẑ(1)².

TauCeti.LogAdic.AllRootTower.p_only_insufficient [non-example]: component example above; full test follows.
The monoid N[1/p] is not q-divisible for a prime q≠p; its p-only tower does not satisfy the all-root chart-limit condition.

Source: DLLZ-adic Lemma 5.3.4 and §6.1; DLLZ-RH §2.3 and (3.3.4).
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:log-sites/log-affinoid-perfectoid
TauCeti.LogAdic.LogAffinoidPerfectoid: not stated; needs the geometric carriers listed below.

U in X_prokét is log affinoid perfectoid if it has a presentation with an initial finite stage, sharp fs charts P_i, Kummer chart transition maps, a completed uniformized colimit Huber pair (R,R⁺) that is perfectoid, and colim P_i uniquely n-divisible for every n≥1. The associated Û=Spa(R,R⁺) is a perfectoid space and |Û|≃lim|U_i|; Û itself is not asserted to be an object of X_prokét.

Hypotheses: Analytic locally noetherian fs X over Spa(Z_p,Z_p); the structural-sheaf conclusions below use X over Q_p.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:log-sites/all-root-toric-tower, HodgeTateAndCanonicalSubgroups:T6:log-sites/pro-kummer-etale-site, PerfectoidSpaces:P1/perfectoid-tate-rings-and-algebras, PerfectoidSpaces:P3/almost-purity-theorem.

TauCeti.LogAdic.LogAffinoidPerfectoid [constructor]: not stated; depends on the full geometric constructor.
The finite-stage sharp-chart presentation, all-integer divisibility and perfectoid completed-pair data.

TauCeti.LogAdic.LogAffinoidPerfectoid.realization [projection]: not stated; depends on the full geometric constructor.
The associated completed perfectoid Huber pair and its Spa.

TauCeti.LogAdic.LogAffinoidPerfectoid.topology [compatibility]: not stated; depends on the full geometric constructor.
The realization topology is canonically the inverse-limit topology of the presentation.

TauCeti.LogAdic.LogAffinoidPerfectoid.strict_pullback [functoriality]: not stated; depends on the full geometric constructor.
Strict closed pullback and Kummer étale localization preserve these objects with the source completion convention.

TauCeti.LogAdic.LogAffinoidPerfectoid.trivial_chart [compatibility]: not stated as an example; needs the full geometric constructor.
With zero characteristic chart the definition agrees with ordinary affinoid perfectoid pro-objects.

TauCeti.LogAdic.LogAffinoidPerfectoid.all_divisibility [characterisation]: component example above; full test follows.
For each n>0 and a in colim P_i there is a unique b with nb=a.

TauCeti.LogAdic.LogAffinoidPerfectoid.no_p_only [non-example]: not stated as an example; needs the full geometric constructor.
A perfectoid ring completion with chart limit N[1/p] is not log affinoid perfectoid in DLLZ’s sense.

Source: DLLZ-adic Definition 5.3.1, Remark 5.3.3 and Lemmas 5.3.6–5.3.8, pp. 74–76.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:log-sites/log-perfectoid-basis
TauCeti.LogAdic.log_perfectoid_basis: not stated; needs the geometric carriers listed below.

For every analytic locally noetherian fs X over Spa(Z_p,Z_p), log affinoid perfectoid objects form a basis of X_prokét. They are stable under the finite products used in the source and strict closed pullbacks, and on such U every Kummer étale localization becomes strict étale with associated perfectoid realization. There is a basis refinement on which ν⁻¹L is acyclic for every p-torsion locally constant sheaf L (Proposition 5.3.13).

Hypotheses: Analytic locally noetherian fs X over Spa(Z_p,Z_p); neither log smoothness nor a perfectoid base field is required for Propositions 5.3.12–5.3.13.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:log-sites/log-affinoid-perfectoid, HodgeTateAndCanonicalSubgroups:T6:log-sites/rigid-abhyankar, PerfectoidSpaces:P3/almost-purity-theorem, AdicEtaleGeometry:A1/pro-etale-site-corrected, ClassicalAdicEtaleCohomology:H0.

Source: DLLZ-adic Lemmas 5.3.7–5.3.8, Propositions 5.3.11–5.3.13, pp. 76–78.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:log-sites/completed-structural-log-sheaves
TauCeti.LogAdic.CompletedLogStructure: component above; full geometric signature not stated.

On X_prokét over Q_p set O⁺=ν⁻¹O⁺_két, O=ν⁻¹O_két, Ô⁺=lim_n O⁺/p^n, Ô=Ô⁺[1/p], Ô^{♭+}=lim_Frob O⁺/p. Set M=ν⁻¹M_két and M♭=lim_{a↦a^p}M, with the structural map α♭ to Ô♭. On log perfectoid presentations M(U)=colim M_i(U_i). Limits and localizations are formed in sheaves; ring sections alone do not define the topology.

Hypotheses: X locally noetherian fs over Spa(Q_p,Z_p); Frobenius is applied in characteristic p for the tilt.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:log-sites/log-site-projections, HodgeTateAndCanonicalSubgroups:T6:log-sites/log-affinoid-perfectoid, AdicEtaleGeometry:A1/etale-structure-sheaf, EnhancedDerivedSheaves:E1, mathlib:AdicCompletion.

TauCeti.LogAdic.CompletedLogStructure [constructor]: component above; full contract follows.
The inverse-image, completed and tilted ring/monoid sheaves with their maps.

TauCeti.LogAdic.CompletedLogStructure.mod_p [compatibility]: not stated; depends on the full geometric constructor.
On the perfectoid basis Ô⁺/p identifies with O⁺/p.

TauCeti.LogAdic.CompletedLogStructure.tilt_projection [projection]: not stated; depends on the full geometric constructor.
The nth Frobenius-limit projection and the multiplicative sharp map.

TauCeti.LogAdic.CompletedLogStructure.functorial [functoriality]: not stated; depends on the full geometric constructor.
Log pullback gives compatible maps of all structural sheaves and their completions.

TauCeti.LogAdic.CompletedLogStructure.constant_point [computation]: not stated as an example; needs the full geometric constructor.
For a perfectoid field point the completed plus sections are its selected K⁺.

TauCeti.LogAdic.CompletedLogStructure.frobenius_relation [characterisation]: component example above; full test follows.
A tilt sequence satisfies x_{n+1}^p=x_n modulo p.

TauCeti.LogAdic.CompletedLogStructure.not_localize_first [non-example]: component example above; full test follows.
Taking p-adic completion after inverting p yields zero quotients, so it cannot replace Ô⁺ followed by inversion.

Source: DLLZ-adic Definition 5.4.1 and Proposition 5.4.2, p. 78.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:log-sites/log-perfectoid-almost-acyclicity
TauCeti.LogAdic.log_perfectoid_almost_acyclicity: not stated; needs the geometric carriers listed below.

For log affinoid perfectoid U over the given p-adic base with realization Spa(R,R⁺), Ô(U)=R, Ô⁺(U)=R⁺, Ô^{♭+}(U)=R^{♭+}; higher cohomology of Ô⁺ and its p^n quotients is almost zero relative to the perfectoid valuation ideal. Rational completed structural sheaves are acyclic. The analogous completed coefficient statements hold for finite locally constant Z_p-module sheaves after the specified log-perfectoid refinement.

Hypotheses: Use Theorems 5.4.3–5.4.4 with their locally noetherian fs/Q_p and basis hypotheses; retain the valuation ideal defining almost mathematics.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:log-sites/log-perfectoid-basis, HodgeTateAndCanonicalSubgroups:T6:log-sites/completed-structural-log-sheaves, PerfectoidSpaces:P3/almost-purity-theorem, PerfectoidSpaces:P3, EnhancedDerivedSheaves:E2.

Source: DLLZ-adic Theorems 5.4.3–5.4.4, pp. 79–81.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-padic-local-systems
TauCeti.LogAdic.KummerLisse: not stated; needs the geometric carriers listed below.

A lisse Z_p-sheaf on X_két is an inverse system L_n of locally constant finite-generated Z/p^n-module sheaves, isomorphic in the pro-category to one satisfying L_{n+1}/p^n≃L_n. Torsion is allowed. A Q_p-local system is an object of the stackification of the isogeny category, so a global Z_p lattice is not part of its definition.

Hypotheses: Use the finite-generated, not necessarily finite-free, convention of DLLZ Definition 6.3.1.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:log-sites/finite-kummer-descent, HodgeTateAndCanonicalSubgroups:T6:log-sites/pro-kummer-etale-site, ClassicalAdicEtaleCohomology:H0, EnhancedDerivedSheaves:E1.

TauCeti.LogAdic.KummerLisse [constructor]: not stated; depends on the full geometric constructor.
The compatible locally constant torsion system, with pro-isomorphism to a strict system.

TauCeti.LogAdic.KummerLisse.reduction [projection]: not stated; depends on the full geometric constructor.
Evaluation at level n and the reduction isomorphism for a strict representative.

TauCeti.LogAdic.KummerLisse.rationalization [functoriality]: not stated; depends on the full geometric constructor.
Pass to the isogeny stack to obtain the associated Q_p-local system.

TauCeti.LogAdic.KummerLisse.morphism [characterisation]: not stated; depends on the full geometric constructor.
Morphisms are compatible pro-morphisms of torsion systems; rational morphisms are local isogeny morphisms glued in the stack.

TauCeti.LogAdic.KummerLisse.constant_free [computation]: not stated as an example; needs the full geometric constructor.
The constant system (Z/p^n)^r realizes a free rank-r Z_p-local system.

TauCeti.LogAdic.KummerLisse.constant_torsion [non-example]: not stated as an example; needs the full geometric constructor.
The compatible constant Fp-system is permitted and is not free over Z_p.

TauCeti.LogAdic.KummerLisse.zero [degenerate]: not stated as an example; needs the full geometric constructor.
The zero system has rank zero and rationalizes to zero.

Source: DLLZ-adic Definition 6.3.1, p. 88.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:log-sites/completed-kummer-local-systems
TauCeti.LogAdic.CompletedKummerLisse: not stated; needs the geometric carriers listed below.

For a strict representative L=(L_n), L̂=lim_n ν⁻¹L_n is a lisse module over Ẑ_p=lim Z/p^n on X_prokét; rationalize by p. This is an equivalence with completed local systems, independent of strict representative, and R^i lim_n ν⁻¹L_n=0 for i>0 on the p-acyclic basis.

Hypotheses: X locally noetherian fs over Q_p; do not take an unrestricted inverse limit of arbitrary sheaves without acyclicity.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-padic-local-systems, HodgeTateAndCanonicalSubgroups:T6:log-sites/log-perfectoid-basis, HodgeTateAndCanonicalSubgroups:T6:log-sites/log-site-projections, EnhancedDerivedSheaves:E2.

TauCeti.LogAdic.CompletedKummerLisse [constructor]: not stated; depends on the full geometric constructor.
The inverse limit of ν⁻¹L_n over the completed coefficient ring.

TauCeti.LogAdic.CompletedKummerLisse.mod_pn [compatibility]: not stated; depends on the full geometric constructor.
For a strict system the nth reduction agrees with ν⁻¹L_n.

TauCeti.LogAdic.CompletedKummerLisse.equivalence [equivalence]: not stated; depends on the full geometric constructor.
Completion and reduction are quasi-inverse on the specified lisse categories.

TauCeti.LogAdic.CompletedKummerLisse.map_comp [functoriality]: not stated; depends on the full geometric constructor.
Completion preserves identity and composition of local-system morphisms.

TauCeti.LogAdic.CompletedKummerLisse.constant [computation]: not stated as an example; needs the full geometric constructor.
A constant finite-generated Z_p module L completes to L⊗Z_p Ẑ_p.

TauCeti.LogAdic.CompletedKummerLisse.torsion [compatibility]: not stated as an example; needs the full geometric constructor.
The constant Fp-system completes to the constant Fp-sheaf.

TauCeti.LogAdic.CompletedKummerLisse.representative [characterisation]: not stated as an example; needs the full geometric constructor.
Pro-isomorphic strict representatives give canonically isomorphic completed local systems.

Source: DLLZ-adic Definition 6.3.2 and Lemma 6.3.3, p. 88.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:log-sites/geometric-boundary-monodromy
TauCeti.LogAdic.BoundaryMonodromy: component above; full geometric signature not stated.

At a geometric boundary point ξ, use the Kummer fundamental group of the strict localization X(ξ), with its log geometric base point. A rational local system has unipotent (respectively quasi-unipotent) geometric monodromy if this inertia acts unipotently (respectively an open subgroup acts unipotently) on every stalk. On SNC charts this is the commuting Ẑ(1)^r action. It suffices to test smooth loci of boundary components.

Hypotheses: This is geometric inertia, not the whole arithmetic Galois group.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-padic-local-systems, HodgeTateAndCanonicalSubgroups:T6:log-sites/finite-kummer-descent, HodgeTateAndCanonicalSubgroups:T6:log-sites/all-root-toric-tower, ClassicalAdicEtaleCohomology:H0.

TauCeti.LogAdic.BoundaryMonodromy [constructor]: component above; full contract follows.
The geometric inertia action with its specified log geometric stalk.

TauCeti.LogAdic.BoundaryMonodromy.logarithm [data]: component above; full contract follows.
For a unipotent generator, its finite logarithm is nilpotent; commuting generators give commuting logarithms.

TauCeti.LogAdic.BoundaryMonodromy.smooth_locus [characterisation]: not stated; depends on the full geometric constructor.
Unipotence/quasi-unipotence can be checked on the smooth part of each boundary component.

TauCeti.LogAdic.BoundaryMonodromy.tensor [compatibility]: not stated; depends on the full geometric constructor.
Tensor and dual of unipotent boundary local systems remain unipotent.

TauCeti.LogAdic.BoundaryMonodromy.trivial [degenerate]: component example above; full test follows.
The constant local system has zero logarithm and unipotent inertia.

TauCeti.LogAdic.BoundaryMonodromy.jordan [computation]: component example above; full test follows.
For U=[[1,1],[0,1]], log U=[[0,1],[0,0]] and its square is zero.

TauCeti.LogAdic.BoundaryMonodromy.finite_character [non-example]: component example above; full test follows.
A rank-one nontrivial finite-order character has quasi-unipotent inertia but is not unipotent.

Source: DLLZ-adic Definition 6.3.7, Example 6.3.8 and Lemma 6.3.11, pp. 89–90.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:comparison/toric-kummer-cohomology
TauCeti.LogAdic.toric_kummer_cohomology: not stated; needs the geometric carriers listed below.

For a sharp fs toric chart V over a characteristic-zero algebraically closed perfectoid field k containing all roots of unity and an Fp-local system L, H^i(V_két,L⊗O⁺/p) is almost zero for i>dim V; on a rational V′ strictly contained in V the restriction image in every degree is almost finitely generated over k⁺. For Γ=Hom(P^gp,Ẑ(1)), a primitive μ_m-character module has continuous cohomology killed by ζ_m−1.

Hypotheses: Strict containment means closure(V′)⊂V. For Lemma 6.1.7 the finite-presentation assertion requires its finite coefficient model.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:log-sites/all-root-toric-tower, HodgeTateAndCanonicalSubgroups:T6:log-sites/log-perfectoid-almost-acyclicity, PadicHodgeTheory:P8, ClassicalAdicEtaleCohomology:H0.

Source: DLLZ-adic Proposition 6.1.1 and Lemma 6.1.7, pp. 81–84.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:comparison/proper-log-almost-finiteness
TauCeti.LogAdic.proper_log_almost_finiteness: not stated; needs the geometric carriers listed below.

For proper log smooth fs X over an algebraically closed characteristic-zero affinoid field (k,k⁺) and an Fp-local system L, H^i(X_két,L⊗O⁺/p) is almost finitely generated for all i≥0 and almost zero for i sufficiently large. The ideal of almost mathematics is the maximal ideal of k⁺. This is an integral almost statement, not finite generation or vanishing before almost localization.

Hypotheses: Properness and log smoothness are both required; arbitrary open affinoids are excluded.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:comparison/toric-kummer-cohomology, HodgeTateAndCanonicalSubgroups:T6:log-sites/log-site-projections, PadicHodgeTheory:P8, ClassicalAdicEtaleCohomology:H0.

Source: DLLZ-adic Theorem 6.2.1(1) and Lemma 6.2.4, pp. 85–86.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:comparison/log-primitive-comparison
TauCeti.LogAdic.log_primitive_comparison: not stated; needs the geometric carriers listed below.

For proper log smooth fs X over Spa(k,k⁺), k algebraically closed of characteristic zero, and an Fp-local system L on X_két, the canonical map H^i(X_két,L)⊗Fp(k⁺/p)→H^i(X_két,L⊗Fp O⁺/p) is an almost isomorphism for every i≥0. Transport along ν gives the matching pro-Kummer formulation. Its properness hypothesis is retained by every finite-level application.

Hypotheses: DLLZ Theorem 6.2.1; no SNC assumption is needed for the comparison itself.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:comparison/proper-log-almost-finiteness, HodgeTateAndCanonicalSubgroups:T6:log-sites/log-perfectoid-almost-acyclicity, HodgeTateAndCanonicalSubgroups:T6:log-sites/completed-kummer-local-systems, PadicHodgeTheory:P8.

Source: DLLZ-adic Theorem 6.2.1(2), p. 85.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:comparison/log-cohomology-finite-vanishing
TauCeti.LogAdic.log_cohomology_finite_vanishing: not stated; needs the geometric carriers listed below.

Under the proper log smooth hypotheses of the primitive theorem, H^i(X_két,L) is finite-dimensional over Fp for each i and vanishes for sufficiently large i. If X is a smooth SNC compactification, it vanishes for i>2dim X. A smooth U Zariski open in a proper rigid space has the same finite-dimensionality and bound for each Fp-local system after a smooth SNC compactification obtained by characteristic-zero resolution.

Hypotheses: The 2dim bound is the SNC compactification case; neither it nor finiteness is asserted for arbitrary nonproper rigid spaces.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:comparison/log-primitive-comparison, HodgeTateAndCanonicalSubgroups:T6:log-sites/boundary-local-system-extension, AdicSpacesPartII:R4, ClassicalAdicEtaleCohomology:H0.

Source: DLLZ-adic Consequences of Theorem 6.2.1, Corollary 6.2.3, pp. 85–86.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:comparison/proper-padic-boundary-cohomology
TauCeti.LogAdic.proper_padic_boundary_cohomology: not stated; needs the geometric carriers listed below.

For a proper smooth SNC pair U⊂X over a characteristic-zero p-adic field and a lisse Z_p-system L on U, its Kummer extension L̄ has canonically isomorphic geometric étale, Kummer and completed pro-Kummer cohomology; these groups are finite Z_p-modules. The extension equivalence itself remains valid without properness. This is the proper version of the finiteness clause in the accessible Corollary 6.3.4, recorded in source issue E1.

Hypotheses: Proper X is explicitly added for finiteness; torsion Z_p local systems are permitted.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:comparison/log-cohomology-finite-vanishing, HodgeTateAndCanonicalSubgroups:T6:log-sites/completed-kummer-local-systems, HodgeTateAndCanonicalSubgroups:T6:log-sites/boundary-local-system-extension, EnhancedDerivedSheaves:E2.

Source: DLLZ-adic Corollary 6.3.4, p. 88, corrected properness; compare Remark 6.2.2.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:comparison/constant-log-periods
TauCeti.LogAdic.LogConstantPeriods: component above; full geometric signature not stated.

Apply the ordinary period-ring functors to the completed/tilted sheaves on X_prokét: A_inf=W(Ô^{♭+}), θ:A_inf→Ô⁺, B_inf=A_inf[1/p], θ_p:B_inf→Ô, B_dR⁺=completion of B_inf at ker(θ_p), and B_dR=B_dR⁺[1/t] after adjoining the usual cyclotomic t. Filtration and Tate-twisted graded pieces are as in P8. On log perfectoid objects use their associated perfectoid realizations, not a new definition of a period ring.

Hypotheses: For the pinned BDeRhamPlus carrier retain prime p, nonunit p and p-adic completeness; all sheaf/field conclusions come from the ordinary supplier plus the log perfectoid basis.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:log-sites/completed-structural-log-sheaves, HodgeTateAndCanonicalSubgroups:T6:log-sites/log-perfectoid-almost-acyclicity, PadicHodgeTheory:P8:local-rational/period-sheaves-definitions, PadicHodgeTheory:P8:local-rational/rational-acyclicity-of-de-rham-period-sheaves, mathlib:BDeRhamPlus, mathlib:fontaineThetaInvertP.

TauCeti.LogAdic.LogConstantPeriods [constructor]: component above; full contract follows.
Instantiate the ordinary functors on the pro-Kummer completed sheaves.

TauCeti.LogAdic.LogConstantPeriods.theta [projection]: component above; full contract follows.
The structural Fontaine map to Ô⁺ or Ô after the specified inversion.

TauCeti.LogAdic.LogConstantPeriods.grade [compatibility]: not stated; depends on the full geometric constructor.
gr^r B_dR≃Ô(r), respecting Tate twists.

TauCeti.LogAdic.LogConstantPeriods.sections [compatibility]: not stated; depends on the full geometric constructor.
On a log perfectoid basis object the sections agree with the period functor on its associated perfectoid pair.

TauCeti.LogAdic.LogConstantPeriods.trivial_log [compatibility]: not stated as an example; needs the full geometric constructor.
On trivial logs these are P8’s ordinary period sheaves.

TauCeti.LogAdic.LogConstantPeriods.grade_zero [computation]: not stated as an example; needs the full geometric constructor.
B_dR⁺/Fil¹≃Ô on the log perfectoid basis.

TauCeti.LogAdic.LogConstantPeriods.not_integral_completion [non-example]: not stated as an example; needs the full geometric constructor.
Completing the p-integral Witt ring at ker θ before inverting p is not the stated B_dR⁺ construction.

Source: DLLZ-RH Definition 2.2.3 and Proposition 2.2.4, pp. 11–12.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:comparison/structural-log-period-plus
TauCeti.LogAdic.StructuralLogPeriodPlus: component above; full geometric signature not stated.

On U=lim_i Ui log affinoid perfectoid, set M_i=M(U_i), M=colim M_i and M♭=lim_p M. For r≥1 form S_{i,r} from the completed coefficient tensor Ri⊗̂_{W(κ)}(W(R^{♭+})/ξ^r), using the k-algebra Ri in which p is already invertible, adjoining the monoid M_i×_M M♭, and impose α_i(a′)=[α♭(a″)]e_a. Its θ_log maps e_a to 1. Complete at ker θ_log and take inverse limit in r, then colimit in i and sheafify; this defines OB_dR,log⁺ with Fil^j=(ker θ_log)^j.

Hypotheses: k is a p-adic field, the integral monoid lifts are compatible, and the source completed tensor topology is retained.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:log-sites/integral-adic-chart, HodgeTateAndCanonicalSubgroups:T6:comparison/constant-log-periods, HodgeTateAndCanonicalSubgroups:T6:log-sites/log-affinoid-perfectoid, AdicSpacesPartII:R0, mathlib:AdicCompletion.

TauCeti.LogAdic.StructuralLogPeriodPlus [constructor]: component above; full contract follows.
The sheafification of the completed relation-ring colimit with θ_log and filtration.

TauCeti.LogAdic.StructuralLogPeriodPlus.theta_generator [simp]: not stated; depends on the full geometric constructor.
θ_log(e_a)=1 on each compatible log generator.

TauCeti.LogAdic.StructuralLogPeriodPlus.structural_relation [relation]: component above; full contract follows.
α_i(a′)=[α♭(a″)]e_a in the completed structural ring.

TauCeti.LogAdic.StructuralLogPeriodPlus.presentation_invariance [equivalence]: not stated; depends on the full geometric constructor.
Cofinal pro-presentation changes induce canonical filtered isomorphisms.

TauCeti.LogAdic.StructuralLogPeriodPlus.rank_zero [compatibility]: not stated as an example; needs the full geometric constructor.
With no log coordinates it agrees with the positive ordinary structural period sheaf.

TauCeti.LogAdic.StructuralLogPeriodPlus.theta [computation]: not stated as an example; needs the full geometric constructor.
The quotient by Fil¹ is Ô.

TauCeti.LogAdic.StructuralLogPeriodPlus.boundary_relation [non-example]: component example above; full test follows.
For a coordinate vanishing at the boundary, the equation T=[T♭]e_T is retained without dividing by T.

Source: DLLZ-RH Equations (2.2.8)–(2.2.9) and Definition 2.2.10(1), pp. 12–13.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:comparison/structural-log-period-complete
TauCeti.LogAdic.StructuralLogPeriod: not stated; needs the geometric carriers listed below.

Localize OB_dR,log⁺ by t, with Fil^r=∑_{s≥−r}t^{-s}Fil^{r+s}OB_dR,log⁺, then complete each Fil^r against higher filtration quotients and take their union. The resulting OB_dR,log is filtration complete and OC_log=gr⁰OB_dR,log. In general it is larger than the plain localization OB_dR,log⁺[1/t], including in the trivial-log case.

Hypotheses: Use the additional completion in DLLZ-RH Definition 2.2.10(3); the filtration is not the t-adic filtration alone.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:comparison/structural-log-period-plus, EnhancedDerivedSheaves:E2.

TauCeti.LogAdic.StructuralLogPeriod [constructor]: not stated; depends on the full geometric constructor.
The filtration-completed localization, with its filtration pieces and OC_log.

TauCeti.LogAdic.StructuralLogPeriod.completion_map [projection]: not stated; depends on the full geometric constructor.
The map from the plain localization into its filtration completion.

TauCeti.LogAdic.StructuralLogPeriod.grade [compatibility]: not stated; depends on the full geometric constructor.
Its associated graded agrees with that of the precompletion filtered ring.

TauCeti.LogAdic.StructuralLogPeriod.complete_piece [characterisation]: not stated; depends on the full geometric constructor.
Each Fil^r is the inverse limit of its Fil^r/Fil^{r+s} quotients.

TauCeti.LogAdic.StructuralLogPeriod.zero_log [compatibility]: not stated as an example; needs the full geometric constructor.
For trivial logs the additional ordinary filtration completion is still present.

TauCeti.LogAdic.StructuralLogPeriod.cauchy_sum [computation]: not stated as an example; needs the full geometric constructor.
In the local one-variable model with W=y/t, ∑_{n≥0}t^nW^{n²} converges in Fil⁰ for the coefficientwise t-adic completion.

TauCeti.LogAdic.StructuralLogPeriod.localization_insufficient [non-example]: not stated as an example; needs the full geometric constructor.
The same series has y^{n²}-coefficient t^{n−n²}, with unbounded negative t-valuations, and hence is not in B_dR⁺[[y]][1/t]; its inclusion requires the additional filtration completion.

Source: DLLZ-RH Definition 2.2.10(2)–(3) and Remark 2.2.11, p. 13.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:comparison/structural-period-connection
TauCeti.LogAdic.StructuralLogConnection: not stated; needs the geometric carriers listed below.

The structural period sheaves carry the unique B_dR⁺-linear continuous log connection extending d and δ with ∇e_a=e_aδ(a′). It extends through the positive and final filtration completions, is integrable, and satisfies ∇Fil^r⊂Fil^{r−1}⊗Ω¹_log. For y_j=log e_{a_j}, ∇y_j=dlog a_j; for W_j=y_j/t, ∇W_j=t⁻¹dlog a_j.

Hypotheses: The analytic log differential module is pulled back to X_prokét and finite locally free in the source log-smooth setting.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:comparison/structural-log-period-complete, HodgeTateAndCanonicalSubgroups:T6:log-sites/continuous-log-derivation, HodgeTateAndCanonicalSubgroups:T6:log-sites/analytic-log-de-rham.

TauCeti.LogAdic.StructuralLogConnection [constructor]: not stated; depends on the full geometric constructor.
The continuous coefficient-period-linear log connection on the structural period sheaf.

TauCeti.LogAdic.StructuralLogConnection.generator [simp]: not stated; depends on the full geometric constructor.
∇e_a=e_aδ(a′).

TauCeti.LogAdic.StructuralLogConnection.transverse [compatibility]: not stated; depends on the full geometric constructor.
The connection lowers the decreasing filtration by at most one.

TauCeti.LogAdic.StructuralLogConnection.integrable [relation]: not stated; depends on the full geometric constructor.
Its coefficient log de Rham differential squares to zero.

TauCeti.LogAdic.StructuralLogConnection.constants [degenerate]: not stated as an example; needs the full geometric constructor.
The constant B_dR period subsheaf is horizontal.

TauCeti.LogAdic.StructuralLogConnection.log_coordinate [computation]: not stated as an example; needs the full geometric constructor.
∇log(e_T)=dlog T, also on a boundary stratum.

TauCeti.LogAdic.StructuralLogConnection.normalized_coordinate [computation]: not stated as an example; needs the full geometric constructor.
∇W_T=t⁻¹dlog T, so omitting the t⁻¹ would give the wrong filtered connection.

Source: DLLZ-RH Equations (2.2.13)–(2.2.17), pp. 13–14.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:comparison/toric-structural-period-model
TauCeti.LogAdic.toric_structural_period_model: not stated; needs the geometric carriers listed below.

On a smooth toric chart and its all-root log perfectoid cover, OB_dR,log⁺≃B_dR⁺[[P−1]], and for a free chart of rank n this is B_dR⁺[[y₁,…,y_n]] with y_j=log e_{a_j}. The completed Fil^r OB_dR,log=t^rB_dR⁺{W₁,…,W_n}, W_j=y_j/t, with the source t-adic coefficient convergence. Its graded ring is Ô[t,t⁻¹,W₁,…,W_n] with W_j of filtration degree zero.

Hypotheses: Use DLLZ-RH §2.3’s strict smooth toric charts, chart rank and pulled-back boundary strata; do not identify formal and restricted power series.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:comparison/structural-period-connection, HodgeTateAndCanonicalSubgroups:T6:log-sites/all-root-toric-tower, AdicSpacesPartII:R0.

Source: DLLZ-RH Proposition 2.3.15 and Corollaries 2.3.17–2.3.20, pp. 18–20.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:comparison/log-poincare
TauCeti.LogAdic.log_poincare: not stated; needs the geometric carriers listed below.

For X log smooth fs over a p-adic field, or the smooth boundary intersections with induced log structures allowed in Remark 2.4.1, the structural log de Rham complex resolves B_dR⁺ and B_dR. Fil^r B_dR→Fil^r OB_dR,log→Fil^{r−1} OB_dR,log⊗Ω¹_log→… is exact, including associated graded complexes. A log smooth relative map has the analogous relative resolution with the base structural period sheaf.

Hypotheses: Retain log smoothness or the specified induced-log stratum hypothesis; exactness is a sheaf assertion, not arbitrary global-section acyclicity.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:comparison/toric-structural-period-model, HodgeTateAndCanonicalSubgroups:T6:log-sites/analytic-log-de-rham, HodgeTateAndCanonicalSubgroups:T6:log-sites/log-perfectoid-basis, EnhancedDerivedSheaves:E1.

Source: DLLZ-RH Corollaries 2.4.2 and 2.4.6, pp. 20–21.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:comparison/log-faltings-extension
TauCeti.LogAdic.log_faltings_extension: not stated; needs the geometric carriers listed below.

For the same smooth/SNC log-smooth context, the degree-one positive graded piece sits in the canonical short exact sequence 0→Ô(1)→gr¹ OB_dR,log⁺→Ô⊗Ω¹_log→0. The quotient map comes from the log connection, and the extension retains the cyclotomic Tate twist on its left term.

Hypotheses: Use the log differential and positive filtration conventions of §2.2.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:comparison/toric-structural-period-model, HodgeTateAndCanonicalSubgroups:T6:comparison/constant-log-periods, HodgeTateAndCanonicalSubgroups:T6:comparison/structural-period-connection.

Source: DLLZ-RH Corollary 2.4.5, p. 21.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:comparison/filtered-log-connection
TauCeti.LogAdic.FilteredLogConnection: component above; full geometric signature not stated.

On X_{B_dR}, a filtered log connection is a vector bundle with a B_dR-linear integrable log connection and decreasing locally free B_dR⁺-lattice filtration satisfying Griffiths transversality. A positive log t-connection obeys ∇⁺(fe)=t e⊗df+f∇⁺e. Its reduction modulo t is an O-linear log Higgs field valued in Ω¹_log(−1), with θ∧θ=0. Arithmetic filtered bundles instead use coherent filtrations over O_X.

Hypotheses: Coefficient scalar ring, continuity, integrability and filtration category are specified; a t-connection is not an ordinary connection modulo t.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:log-sites/analytic-log-de-rham, HodgeTateAndCanonicalSubgroups:T6:comparison/structural-log-period-complete, CrystallineCohomology:CR.5/log-connection, EnhancedDerivedSheaves:E1.

TauCeti.LogAdic.FilteredLogConnection [constructor]: component above; full contract follows.
A coefficient-linear log connection with integrability and the indicated decreasing filtration.

TauCeti.LogAdic.FilteredLogConnection.transversality [relation]: component above; full contract follows.
The qth differential maps Fil^{r−q} into Fil^{r−q−1}.

TauCeti.LogAdic.FilteredLogConnection.t_connection [equivalence]: not stated; depends on the full geometric constructor.
A positive lattice with log t-connection gives a period connection by t⁻¹∇⁺.

TauCeti.LogAdic.FilteredLogConnection.higgs [functoriality]: not stated; depends on the full geometric constructor.
Reduction of the t-connection modulo t is an integrable log Higgs field with the Tate twist.

TauCeti.LogAdic.FilteredLogConnection.trivial [degenerate]: not stated as an example; needs the full geometric constructor.
The trivial coefficient bundle has d and the standard scalar filtration.

TauCeti.LogAdic.FilteredLogConnection.mod_t_linear [computation]: component example above; full test follows.
The term t e⊗df vanishes modulo t, so the reduced map is O-linear.

TauCeti.LogAdic.FilteredLogConnection.not_unshifted [non-example]: component example above; full test follows.
The filtered de Rham qth term has Fil^{r−q}; an unshifted Fil^r in every degree does not encode transversality.

Source: DLLZ-RH Definitions 3.1.1, 3.1.7 and Lemmas 3.1.8–3.1.9, pp. 22–24.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:comparison/log-tower-decompletion
TauCeti.LogAdic.log_tower_decompletion: not stated; needs the geometric carriers listed below.

The cyclotomic coefficient and geometric Kummer towers satisfy the stable-decompletion statements in DLLZ-RH A.2.1.2 and A.2.2.3. Their B_dR⁺/ξ^r variants satisfy the decompletion-system statement A.2.3.4 for every r≥1; this last statement is not strengthened to stable decompletion. Finite projective semilinear modules admit good finite-stage models with the continuous-cohomology invariance used in §3.3 and its specified localizations and boundary quotients.

Hypotheses: Use Appendix A.2.1.2, A.2.2.3, A.2.3.4 hypotheses and good-model refinement; do not assert arbitrary tower decompletion.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:log-sites/all-root-toric-tower, HodgeTateAndCanonicalSubgroups:T6:comparison/toric-structural-period-model, PerfectoidSpaces:P3, ClassicalAdicEtaleCohomology:H0.

Source: DLLZ-RH Appendix A.1.2, A.1.10; Theorems A.2.1.2, A.2.2.3, A.2.3.4; application §3.3.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:comparison/log-oc-pushforward
TauCeti.LogAdic.log_oc_pushforward: not stated; needs the geometric carriers listed below.

For X smooth with SNC boundary over a p-adic field k, K the completion of an algebraic extension containing k_∞, µ′:X_prokét/X_K→X_an, and a Q_p-local system L, R^iµ′_*(L̂⊗OC_log)=0 for i>0 and the degree-zero sheaf is finite locally free of rank rk L. The analogous finite-projective computation on the allowed smooth boundary strata is compatible with rational and finite-étale pullback, without asserting that the naive boundary specialization of the finite model is an isomorphism.

Hypotheses: SNC and coefficient-field hypotheses of §3.2 and Proposition 3.3.3.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:comparison/log-tower-decompletion, HodgeTateAndCanonicalSubgroups:T6:comparison/toric-structural-period-model, HodgeTateAndCanonicalSubgroups:T6:log-sites/geometric-boundary-monodromy, ClassicalAdicEtaleCohomology:H0.

Source: DLLZ-RH Proposition 3.3.3, Lemmas 3.3.15–3.3.16 and Remarks 3.3.12–3.3.14, pp. 28–31.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:comparison/log-riemann-hilbert
TauCeti.LogAdic.LogRH: not stated; needs the geometric carriers listed below.

For k p-adic, K complete over an algebraic extension containing k_∞, and X smooth with SNC boundary, RH_log(L)=Rµ′_*(L̂⊗OB_dR,log) is concentrated in degree zero. It is an exact functor to Gal(K/k)-equivariant vector bundles on X_{B_dR} of rank rk L, with integrable log connection and locally free B_dR⁺-lattice filtration. The construction is not asserted to be tensor on all local systems.

Hypotheses: L is a finite-rank Q_p-local system on X_két; tensor compatibility is a separate unipotent theorem.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:comparison/log-oc-pushforward, HodgeTateAndCanonicalSubgroups:T6:comparison/structural-period-connection, HodgeTateAndCanonicalSubgroups:T6:comparison/filtered-log-connection, HodgeTateAndCanonicalSubgroups:T6:log-sites/completed-kummer-local-systems, EnhancedDerivedSheaves:E1, EnhancedDerivedSheaves:E2.

TauCeti.LogAdic.LogRH [constructor]: not stated; depends on the full geometric constructor.
The geometric derived pushforward, identified with a degree-zero filtered log bundle.

TauCeti.LogAdic.LogRH.rank [structure]: not stated; depends on the full geometric constructor.
The bundle has rank rk L.

TauCeti.LogAdic.LogRH.grade [compatibility]: not stated; depends on the full geometric constructor.
gr^r RH_log(L)=H_log(L)(r).

TauCeti.LogAdic.LogRH.map_comp [functoriality]: not stated; depends on the full geometric constructor.
Pushforward of coefficient maps preserves identities and composition.

TauCeti.LogAdic.LogRH.trivial_log [compatibility]: not stated; depends on the full geometric constructor.
Trivial-log specialization is the ordinary RH functor with the corrected filtration-completed structural periods.

TauCeti.LogAdic.LogRH.constant [computation]: not stated as an example; needs the full geometric constructor.
The constant rank-one local system gives the scalar period bundle with its standard connection.

TauCeti.LogAdic.LogRH.zero [degenerate]: not stated as an example; needs the full geometric constructor.
The zero local system gives the zero bundle.

TauCeti.LogAdic.LogRH.fractional_residue [non-example]: not stated as an example; needs the full geometric constructor.
A finite boundary character with normalized residue 2/3 has a tensor square with normalized residue 1/3; it cannot be modeled by an unrestricted tensor functor adding residues to 4/3.

Source: DLLZ-RH Equation (3.2.2), Theorem 3.2.3(1), §3.3, pp. 25, 27–31.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:comparison/log-higgs-functor
TauCeti.LogAdic.LogHiggs: not stated; needs the geometric carriers listed below.

H_log(L)=gr⁰ RH_log(L)=µ′_*(L̂⊗OC_log) is a Gal(K/k)-equivariant log Higgs bundle on X_K with field θ:H_log→H_log⊗Ω¹_log(−1), obtained from t∇ on Fil⁰ modulo t. Its coefficient log Higgs complex has degree q term H_log⊗Ω^q_log(−q).

Hypotheses: Same geometric base and SNC hypotheses as RH_log; use the −q twists in the complex.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:comparison/log-riemann-hilbert, HodgeTateAndCanonicalSubgroups:T6:comparison/filtered-log-connection.

TauCeti.LogAdic.LogHiggs [constructor]: not stated; depends on the full geometric constructor.
Degree-zero reduction with its O-linear integrable log Higgs field.

TauCeti.LogAdic.LogHiggs.underlying [compatibility]: not stated; depends on the full geometric constructor.
Its underlying module is gr⁰ RH_log(L).

TauCeti.LogAdic.LogHiggs.field [projection]: not stated; depends on the full geometric constructor.
The field takes values in Ω¹_log(−1).

TauCeti.LogAdic.LogHiggs.map_comp [functoriality]: not stated; depends on the full geometric constructor.
The assignment preserves identity and composition of coefficient morphisms.

TauCeti.LogAdic.LogHiggs.constant [degenerate]: not stated as an example; needs the full geometric constructor.
The constant local system has zero log Higgs field.

TauCeti.LogAdic.LogHiggs.twist [compatibility]: not stated as an example; needs the full geometric constructor.
The qth Higgs-complex term carries Tate twist −q.

TauCeti.LogAdic.LogHiggs.residue [computation]: not stated as an example; needs the full geometric constructor.
For a unipotent rank-two boundary system its log Higgs residue is the corresponding nilpotent monodromy operator in the twisted differential direction.

Source: DLLZ-RH Theorem 3.2.4(1), pp. 25–26 and Lemma 3.1.9, p. 24.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:comparison/log-regularity-and-extension
TauCeti.LogAdic.log_regularity_and_extension: not stated; needs the geometric carriers listed below.

On a smooth SNC pair, a torsion-free coherent sheaf with integrable log connection that is reflexive and has boundary residue eigenvalues in Q∩[0,1) is locally free. A horizontal morphism from a locally free normalized-residue extension to a torsion-free coherent normalized-residue extension, an isomorphism on the boundary complement, is an isomorphism everywhere. The analogous uniqueness holds for B_dR coefficient bundles.

Hypotheses: Retain reflexivity for the local-freeness result, the normalized residue interval, and the horizontal morphism.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:log-sites/analytic-log-de-rham, HodgeTateAndCanonicalSubgroups:T6:log-sites/divisorial-analytic-log, AdicSpacesPartII:R3.

Source: DLLZ-RH Propositions 3.4.16–3.4.17, pp. 37–38.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:comparison/normalized-log-residues
TauCeti.LogAdic.normalized_log_residues: not stated; needs the geometric carriers listed below.

The residues of RH_log(L) and D_dR,log(L) along geometrically irreducible boundary components have eigenvalues in Q∩[0,1). The local period residue is t⁻¹log γ in the normalized decompleted module. Unipotent geometric boundary inertia makes these residues nilpotent; a finite character can give a nonzero rational residue.

Hypotheses: Use finite scalar extension if needed to make the specified boundary component geometrically irreducible.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:comparison/log-riemann-hilbert, HodgeTateAndCanonicalSubgroups:T6:log-sites/geometric-boundary-monodromy, HodgeTateAndCanonicalSubgroups:T6:comparison/log-tower-decompletion.

Source: DLLZ-RH Theorem 3.2.3(2), Lemma 3.4.7 and Proposition 3.4.15, pp. 25, 35–37.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:comparison/arithmetic-log-de-rham
TauCeti.LogAdic.ArithmeticLogDR: not stated; needs the geometric carriers listed below.

For µ:X_prokét→X_an set D_dR,log(L)=µ_*(L̂⊗OB_dR,log). It is an O_X-vector bundle with integrable log connection and decreasing coherent filtration, with normalized rational residues. If L|_U is de Rham then gr D_dR,log(L) is locally free of total rank rk L. Without that hypothesis the de Rham rank need not equal rk L.

Hypotheses: The same p-adic field and smooth SNC pair as the geometric RH construction.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:comparison/log-riemann-hilbert, HodgeTateAndCanonicalSubgroups:T6:comparison/normalized-log-residues, HodgeTateAndCanonicalSubgroups:T6:comparison/log-regularity-and-extension, PadicHodgeTheory:P8:local-rational/de-rham-period-sheaf, ClassicalAdicEtaleCohomology:H0, AdicSpacesPartII:R3.

TauCeti.LogAdic.ArithmeticLogDR [constructor]: not stated; depends on the full geometric constructor.
The arithmetic degree-zero pushforward with its induced connection and coherent filtration.

TauCeti.LogAdic.ArithmeticLogDR.geometric_invariants [characterisation]: not stated; depends on the full geometric constructor.
It is the arithmetic Galois-invariant sheaf of the geometric RH object.

TauCeti.LogAdic.ArithmeticLogDR.de_rham_grade_rank [compatibility]: not stated; depends on the full geometric constructor.
For de Rham interior input its total graded rank equals rk L.

TauCeti.LogAdic.ArithmeticLogDR.map_comp [functoriality]: not stated; depends on the full geometric constructor.
Coefficient maps induce horizontal filtered maps, preserving composition.

TauCeti.LogAdic.ArithmeticLogDR.constant [computation]: not stated as an example; needs the full geometric constructor.
For the trivial Q_p coefficient system, D_dR,log=O_X with d and its weight-zero filtration.

TauCeti.LogAdic.ArithmeticLogDR.tate [computation]: not stated as an example; needs the full geometric constructor.
For Q_p(m), the de Rham line has its filtration jump at −m under the fixed cyclotomic convention.

TauCeti.LogAdic.ArithmeticLogDR.zero [degenerate]: not stated as an example; needs the full geometric constructor.
The zero local system maps to the zero filtered bundle.

Source: DLLZ-RH Equation (3.2.6), Theorem 3.2.7(1)–(2), pp. 26–27.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:comparison/log-rh-pullback
TauCeti.LogAdic.log_rh_pullback: not stated; needs the geometric carriers listed below.

For h:(Y,E)→(X,D) between smooth SNC log pairs and a rational local system L, the natural maps h*RH_log(L)→RH_log(h⁻¹L), and the Higgs/arithmetic analogues, are injective and strictly filtered. They are isomorphisms if for every component W of E, ∑_Z m_WZ n_Z≤1, where n_Z=0 for unipotent boundary monodromy along Z and 1 otherwise. The pullback residue is ∑m_WZ h*Res_Z.

Hypotheses: Boundary multiplicities are those of h⁻¹D; no unrestricted ramified-pullback isomorphism is claimed.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:comparison/arithmetic-log-de-rham, HodgeTateAndCanonicalSubgroups:T6:comparison/log-higgs-functor, HodgeTateAndCanonicalSubgroups:T6:comparison/log-regularity-and-extension, HodgeTateAndCanonicalSubgroups:T6:log-sites/analytic-log-de-rham.

Source: DLLZ-RH Theorem 3.2.3(4), Lemma 3.5.3 and Corollary 3.5.7, pp. 25, 39–40.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:comparison/unipotent-log-tensor
TauCeti.LogAdic.unipotent_log_tensor: not stated; needs the geometric carriers listed below.

RH_log and H_log restrict to tensor functors on rational local systems with unipotent geometric boundary monodromy; their log residues are nilpotent. D_dR,log is a tensor functor on the additional de Rham-interior subcategory. Tensor, dual and unit comparison maps are canonical and coherent. No such assertion is made for arbitrary rational boundary characters.

Hypotheses: Unipotence is geometric boundary unipotence as in Definition 6.3.7; D_dR also requires de Rham interior.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:comparison/log-rh-pullback, HodgeTateAndCanonicalSubgroups:T6:comparison/normalized-log-residues, HodgeTateAndCanonicalSubgroups:T6:log-sites/geometric-boundary-monodromy, HodgeTateAndCanonicalSubgroups:T6:comparison/log-regularity-and-extension.

Source: DLLZ-RH Theorem 3.2.12 and its proof in §3.4, pp. 27, 38–39.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:comparison/proper-log-period-cohomology
TauCeti.LogAdic.proper_log_period_cohomology: not stated; needs the geometric carriers listed below.

For proper smooth SNC X/k, K=completed algebraic closure, and a lisse Z_p-system L, H^i(X_K,két,L)⊗Z_p B_dR canonically equals log de Rham hypercohomology of RH_log(L), equivariantly and with filtrations. The K-valued version equals log Higgs hypercohomology of H_log(L). If L|_U is de Rham, it equals H^i_log dR(X,D_dR,log(L))⊗k B_dR; its Hodge spectral sequence degenerates at E₁ and its degree-zero graded comparison is ⊕_{a+b=i}H^{a,b}_log Hodge(X,D_dR,log(L))⊗k K(−a).

Hypotheses: Proper X and de Rham interior only for the arithmetic/Hodge conclusions; general coefficients give the RH/Higgs statements.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:comparison/proper-padic-boundary-cohomology, HodgeTateAndCanonicalSubgroups:T6:comparison/log-poincare, HodgeTateAndCanonicalSubgroups:T6:comparison/arithmetic-log-de-rham, HodgeTateAndCanonicalSubgroups:T6:comparison/log-higgs-functor, HodgeTateAndCanonicalSubgroups:T6:comparison/log-primitive-comparison, AdicSpacesPartII:R3, EnhancedDerivedSheaves:E1, EnhancedDerivedSheaves:E2.

Source: DLLZ-RH Theorems 3.2.3(3), 3.2.4(2), 3.2.7(3), Lemmas 3.6.1–3.6.4, pp. 25–27, 41–42.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:comparison/relative-log-comparison
TauCeti.LogAdic.relative_log_comparison: not stated; needs the geometric carriers listed below.

For a proper log smooth f:(X,D)→(Y,E) between smooth SNC pairs over k, with interior f|_U:U→V proper smooth, and a lisse Z_p-system L de Rham on U, R^if_két,*L is a lisse Z_p-system de Rham on V. D_dR,log(R^if_*L) identifies with the O_Y-torsion-free quotient of relative log de Rham cohomology R^if_log dR,*D_dR,log(L), with Gauss–Manin connection and filtration.

Hypotheses: Both proper log smooth f and proper smooth interior restriction are required; retain the torsion-free quotient.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:comparison/proper-log-period-cohomology, HodgeTateAndCanonicalSubgroups:T6:comparison/log-poincare, HodgeTateAndCanonicalSubgroups:T6:comparison/log-rh-pullback, PadicHodgeTheory:P8/relative-de-rham-comparison, ClassicalAdicEtaleCohomology:H0, AdicSpacesPartII:R3.

Source: DLLZ-RH Theorem 3.2.7(5) and §3.5, pp. 26–27, 40–41.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:comparison/canonical-pro-kummer-realizations
TauCeti.LogAdic.CanonicalLogRealizations: not stated; needs the geometric carriers listed below.

For a pure Shimura datum (G,X), the central split quotient Gᶜ, a neat level K and smooth toroidal fan Σ, import the canonical coefficient functors W↦W_p and W↦W_dR for algebraic representations of Gᶜ. Extend W_p from the interior to the Kummer site, then complete on the pro-Kummer site; its geometric boundary monodromy is unipotent. W_dR is the canonical filtered logarithmic extension with nilpotent residues. Full-group coefficients, not arbitrary Levi representations, carry these flat connections.

Hypotheses: Smooth/SNC toroidal charts after étale localization; canonical full-group coefficients and their existing tensor/Hecke functoriality come from AutomorphicBundles.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:log-sites/boundary-local-system-extension, HodgeTateAndCanonicalSubgroups:T6:log-sites/completed-kummer-local-systems, HodgeTateAndCanonicalSubgroups:T6:comparison/unipotent-log-tensor, AutomorphicBundles:B2.general/general-flat-realizations, AutomorphicBundles:B3.general/general-logarithmic-comparison, ShimuraCompactifications:C2/smooth-normal-crossings.

TauCeti.LogAdic.CanonicalLogRealizations [constructor]: not stated; depends on the full geometric constructor.
The imported coefficient functors instantiated on the toroidal Kummer/pro-Kummer ringed sites.

TauCeti.LogAdic.CanonicalLogRealizations.etale_restriction [compatibility]: not stated; depends on the full geometric constructor.
Restriction to the interior recovers the canonical p-adic local system.

TauCeti.LogAdic.CanonicalLogRealizations.de_rham_extension [compatibility]: not stated; depends on the full geometric constructor.
Its filtered log bundle is B3.general’s nilpotent-residue canonical extension.

TauCeti.LogAdic.CanonicalLogRealizations.hecke [functoriality]: not stated; depends on the full geometric constructor.
Pullbacks under finite-level Hecke maps agree with the coefficient representation action.

TauCeti.LogAdic.CanonicalLogRealizations.unit [degenerate]: not stated as an example; needs the full geometric constructor.
The trivial representation gives the constant Q_p sheaf and trivial filtered O bundle.

TauCeti.LogAdic.CanonicalLogRealizations.siegel [compatibility]: not stated as an example; needs the full geometric constructor.
In the Siegel case the standard representation is the semiabelian Tate/de Rham coefficient with its boundary extension.

TauCeti.LogAdic.CanonicalLogRealizations.no_levi_connection [non-example]: not stated as an example; needs the full geometric constructor.
An arbitrary Levi coefficient has an automorphic bundle but is not thereby assigned a full-group flat local system.

Source: DLLZ-RH Propositions 5.2.10 and 5.2.17, pp. 54–56; BP §4.4.38–Remark 4.4.39, pp. 79–80.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:comparison/special-point-comparison
TauCeti.LogAdic.special_point_comparison: not stated; needs the geometric carriers listed below.

For a special point h of a general pure Shimura datum, the standard Betti and p-adically reconstructed Betti coefficient systems have canonical equivariant trivializations over (G(Q)h)×G(A_f), identifying both with W and preserving the CM Hodge cocharacter. These special-point identifications normalize the general coefficient comparison and its reflex-field descent.

Hypotheses: Use the proven CM/abelian-motive realizations and absolute Hodge-tensor compatibility; this does not assert existence of motives for every general Shimura coefficient.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:comparison/canonical-pro-kummer-realizations, MotivesAndAlgebraicCycles:MC.7, ShimuraVarieties:V8.general, PadicHodgeTheory:P8/relative-de-rham-comparison.

Source: DLLZ-RH Proposition 5.4.1 and its proof, pp. 57–59.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:comparison/canonical-arithmetic-monodromy
TauCeti.LogAdic.canonical_arithmetic_monodromy: not stated; needs the geometric carriers listed below.

On every connected component of a neat general Shimura variety, the monodromy of the p-adically reconstructed Betti coefficient extends to an algebraic representation of G^{der,c}_C equal to W_C restricted to that group. Reduce to Q-simple simply connected derived datum. In the real-rank≤1/type-A cases use the abelian-type reduction; in the remaining higher-rank non-type-A cases use superrigidity, congruence descent and Hecke compatibility, Borel density and the Piatetski-Shapiro embedding argument to identify every simple factor.

Hypotheses: Only the arithmetic-group instances permitted by DLLZ-RH §§5.4–5.6 are requested; generic superrigidity and congruence results are imported from an arithmetic roadmap addition.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:comparison/special-point-comparison, ArithmeticLocallySymmetricSpaces:ALS.1, ShimuraVarieties:V8.general, PadicHodgeTheory:P8/relative-de-rham-comparison.

Source: DLLZ-RH Proposition 5.4.5, Proposition 5.5.9, Theorem 5.6.1 and Lemmas 5.6.5–5.6.7, pp. 61–66.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:comparison/canonical-log-period-comparison
TauCeti.LogAdic.canonical_log_period_comparison: not stated; needs the geometric carriers listed below.

For every algebraic representation W of Gᶜ on a neat smooth toroidal compactification of a pure Shimura datum, there is a canonical filtered horizontal Hecke-equivariant isomorphism W_p⊗Q_p OB_dR,log≃W_dR⊗O_X OB_dR,log. It is an isomorphism of tensor functors, compatible with duals, change of level and maps of Shimura data, and descends compatibly with reflex-field canonical models. It identifies the nilpotent-residue boundary extensions, not just their interior restrictions.

Hypotheses: Use full-group canonical coefficients, their unipotent geometric boundary monodromy and the source canonical models.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:comparison/canonical-arithmetic-monodromy, HodgeTateAndCanonicalSubgroups:T6:comparison/special-point-comparison, HodgeTateAndCanonicalSubgroups:T6:comparison/canonical-pro-kummer-realizations, HodgeTateAndCanonicalSubgroups:T6:comparison/log-regularity-and-extension, HodgeTateAndCanonicalSubgroups:T6:comparison/unipotent-log-tensor, AutomorphicBundles:B3.general/general-boundary-functoriality.

Source: BP §4.4.38–Remark 4.4.39, p. 79; DLLZ-RH Theorem 5.3.1 and Proposition 5.4.4, pp. 56, 60.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:comparison/two-de-rham-lattices
TauCeti.LogAdic.TwoDeRhamLattices: component above; full geometric signature not stated.

Inside the common B_dR local system supplied by canonical association, take M=W_p⊗B_dR⁺ and M⁰=(W_dR⊗OB_dR,log⁺)^{∇=0}, with their scalar and de Rham-induced decreasing filtrations. Both are B_dR⁺ local systems/lattices with common localization; M/Fil¹M=W_p⊗Ô. Horizontal sections are taken before extracting the lattice filtration.

Hypotheses: Canonical associated unipotent/de Rham full-group coefficient; sheafwise lattices in the same localized module.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:comparison/canonical-log-period-comparison, HodgeTateAndCanonicalSubgroups:T6:comparison/log-poincare, HodgeTateAndCanonicalSubgroups:T6:comparison/constant-log-periods.

TauCeti.LogAdic.TwoDeRhamLattices [constructor]: component above; full contract follows.
The common localized module with M, M⁰ and their specified filtrations.

TauCeti.LogAdic.TwoDeRhamLattices.common_localization [compatibility]: not stated; depends on the full geometric constructor.
Inverting t identifies both lattice localizations with the association’s period local system.

TauCeti.LogAdic.TwoDeRhamLattices.first_quotient [projection]: not stated; depends on the full geometric constructor.
M/Fil¹M identifies with W_p⊗Ô.

TauCeti.LogAdic.TwoDeRhamLattices.map [functoriality]: not stated; depends on the full geometric constructor.
A morphism of canonical coefficient representations carries both lattices and filtrations compatibly.

TauCeti.LogAdic.TwoDeRhamLattices.unit [degenerate]: not stated as an example; needs the full geometric constructor.
For the trivial representation the two lattices agree with B_dR⁺.

TauCeti.LogAdic.TwoDeRhamLattices.relative_position [computation]: not stated as an example; needs the full geometric constructor.
For scalar rank-one lattices M=Ae and M⁰=tᵃAe in A[1/t]e, both localize to the same line and M/tM≃A/(t); the relative shift a is retained.

TauCeti.LogAdic.TwoDeRhamLattices.horizontal_requirement [non-example]: not stated as an example; needs the full geometric constructor.
The unrestricted module W_dR⊗OB_dR,log⁺ is not itself M⁰; its horizontal kernel is required.

Source: BP §4.4.38–Remark 4.4.39, pp. 79–80.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:comparison/lattice-hodge-tate-filtration
TauCeti.LogAdic.LatticeHTFiltration: component above; full geometric signature not stated.

Define the ascending filtration F_{−j}(W_p⊗Ô)=(M∩Fil^jM⁰)/(Fil¹M∩Fil^jM⁰), equivalently the image of M∩Fil^jM⁰ in M/Fil¹M. It is locally split of the Hodge-cocharacter type. With BP’s negative filtration indexing, its j-labelled graded comparison is Gr_j(W_p⊗Ô)(j)≃Gr^j W_dR⊗Ô; record the convention by the displayed F_{−j} formula, rather than silently replacing the ascending filtration by the de Rham one.

Hypotheses: Two associated B_dR⁺ lattices from the canonical coefficient comparison; intersections and quotients are sheafwise.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:comparison/two-de-rham-lattices, HodgeTateAndCanonicalSubgroups:T1, HodgeTateAndCanonicalSubgroups:T2.

TauCeti.LogAdic.LatticeHTFiltration [constructor]: component above; full contract follows.
The image filtration with F_{−j}=image(M∩Fil^jM⁰→M/Fil¹M).

TauCeti.LogAdic.LatticeHTFiltration.mem [characterisation]: component above; full contract follows.
A quotient class lies in F_{−j} iff it has a lift belonging to M∩Fil^jM⁰.

TauCeti.LogAdic.LatticeHTFiltration.mono [structure]: component above; full contract follows.
The image filtration is increasing in the HT index because Fil^jM⁰ is decreasing.

TauCeti.LogAdic.LatticeHTFiltration.grade [compatibility]: not stated; depends on the full geometric constructor.
With the displayed BP indexing, its graded identification has the Tate twist (j).

TauCeti.LogAdic.LatticeHTFiltration.map [functoriality]: component above; full contract follows.
Compatible maps of the two filtered lattices induce filtered quotient maps.

TauCeti.LogAdic.LatticeHTFiltration.weight_zero [degenerate]: component example above; full test follows.
For a weight-zero line, F_i=0 for i<0 and F_i is the full line for i≥0.

TauCeti.LogAdic.LatticeHTFiltration.lattice_shift [computation]: not stated as an example; needs the full geometric constructor.
For scalar t-adic filtration and M⁰=t^aM in rank one, F_i is zero for i<a and the full quotient for i≥a.

TauCeti.LogAdic.LatticeHTFiltration.correct_denominator [characterisation]: component example above; full test follows.
The quotient kernel at −j is Fil¹M∩Fil^jM⁰, not all of Fil¹M when that is not contained in Fil^jM⁰.

Source: BP Remark 4.4.39, pp. 79–80.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:comparison/canonical-ht-tensor
TauCeti.LogAdic.canonical_ht_tensor: not stated; needs the geometric carriers listed below.

For canonical full-group Gᶜ coefficients the lattice HT filtration is compatible with tensor products, duals, the unit representation and finite-level Hecke pullbacks. The ascending tensor filtration is the image of ∑_{a+b=i}F_a⊗F_b; dual weights have opposite sign. It defines the prescribed P_µᶜ reduction of the completed p-adic coefficient torsor.

Hypotheses: Use canonical unipotent tensor association; this is not a tensor theorem for arbitrary log local systems.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:comparison/lattice-hodge-tate-filtration, HodgeTateAndCanonicalSubgroups:T6:comparison/unipotent-log-tensor, HodgeTateAndCanonicalSubgroups:T2, AutomorphicBundles:B2/coefficient-tensor-hecke.

Source: BP Remark 4.4.39, p. 80.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:comparison/finite-levi-torsor
TauCeti.LogAdic.FiniteLeviComparison: component above; full geometric signature not stated.

From the de Rham P_µ^{std,c} and HT P_µᶜ reductions form their common Levi M_µᶜ torsors M_dR^an and M_HT^an. The canonical finite-level identification is M_HT^an≃M_dR^an×^{µ,Z_p×}Z_p(1) on the appropriate pulled-back pro-étale/pro-Kummer site, compatibly with Hecke action. A cyclotomic twist of M_HT is defined on the étale site. An untwisted equality requires an explicit cyclotomic trivialization.

Hypotheses: The central cocharacter µ acts on the common Levi; the de Rham and HT parabolic conventions are distinguished.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:comparison/canonical-ht-tensor, HodgeTateAndCanonicalSubgroups:T6:comparison/canonical-log-period-comparison, HodgeTateAndCanonicalSubgroups:T2, AutomorphicBundles:B0/hodge-parabolic-convention, AutomorphicBundles:B3.general/general-canonical-extension.

TauCeti.LogAdic.FiniteLeviComparison [constructor]: component above; full contract follows.
The finite-level comparison of Levi torsors with the µ-contracted cyclotomic torsor.

TauCeti.LogAdic.FiniteLeviComparison.central_twist [characterisation]: not stated; depends on the full geometric constructor.
The twisting action is through the central cocharacter µ:Z_p×→M_µᶜ.

TauCeti.LogAdic.FiniteLeviComparison.hecke [functoriality]: not stated; depends on the full geometric constructor.
The comparison commutes with finite-level Hecke pullbacks.

TauCeti.LogAdic.FiniteLeviComparison.trivialization [compatibility]: not stated; depends on the full geometric constructor.
Choosing a compatible generator of Z_p(1) identifies the contracted product with M_dR; changing that generator acts through µ.

TauCeti.LogAdic.FiniteLeviComparison.weight_zero [degenerate]: component example above; full test follows.
For central weight zero the cyclotomic twist is trivial.

TauCeti.LogAdic.FiniteLeviComparison.weight_one [computation]: component example above; full test follows.
On a central weight-one character the contracted product is the associated Tate line, not an untwisted line with the same Galois action.

TauCeti.LogAdic.FiniteLeviComparison.change_generator [characterisation]: not stated as an example; needs the full geometric constructor.
Replacing a cyclotomic generator by u times it changes the trivialized comparison by µ(u); there is no generator-independent untwisted equality.

Source: BP Remark 4.4.39, p. 80; cyclotomic explanation in Remark 4.4.10.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6/finite-level-canonical-package
TauCeti.LogAdic.finite_level_canonical_package: not stated; needs the geometric carriers listed below.

For every neat pure Shimura datum and smooth toroidal model, the canonical Gᶜ coefficient tensor functors are associated through completed logarithmic periods. They yield an ascending Hodge–Tate flag and the cyclotomic Levi comparison at finite level. Export the full package to PerfectoidShimuraVarieties:S6, which owns the general toroidal-tower diamond Hodge–Tate map and coefficient pullback (BP Theorem 4.4.40). Export only early log-site geometry to PrismaticCohomology:PR.8 and log primitive comparison separately to completed/coherent cohomology consumers.

Hypotheses: This application is the narrowed T6 aggregate; it assumes no general-datum toroidal diamond is a perfectoid space.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:comparison/canonical-log-period-comparison, HodgeTateAndCanonicalSubgroups:T6:comparison/finite-levi-torsor, HodgeTateAndCanonicalSubgroups:T6:comparison/canonical-ht-tensor, HodgeTateAndCanonicalSubgroups:T6:comparison/log-primitive-comparison.

Source: BP §4.4.38–Remark 4.4.39, pp. 79–80; Theorem 4.4.40 ownership boundary.
-/
