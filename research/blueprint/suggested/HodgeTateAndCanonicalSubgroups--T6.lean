/-
This file is not the roadmap and is not exhaustive. The roadmap document
research/blueprint/readmes/HodgeTateAndCanonicalSubgroups--T6.md is definitive.
The statements suggest Lean forms so contributors and reviewers converge on
names and signatures. Every proposed proof is unproved. No implementation is
claimed; implementationStatus remains unchecked.

Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

The pinned libraries have affine Huber pairs, generic sites, derivations, module
quotients, adic completion, the tilt and the B_dR⁺ carrier, but not the geometric
suppliers of T6 (log adic spaces, Kummer étale and pro-Kummer sites, structural
period sheaves). The elaborated declarations below are stalk/affine, chart-level
(monoid), algebra-model or linear-algebra components of the intended signatures;
each docstring says which part it renders. They do not define an adic space by a
ring, prove sheaf descent from a stalk calculation, or assert a period comparison
from an arbitrary pair of modules. In particular, IntegralChart states the integral
factorization part: logification being an isomorphism is not encoded.
TwoDeRhamLattices states the submodule/filtration part: invert-t lattice and
horizontal-section conditions need the geometric suppliers. Unit tests of a packet
item appear as `example`s whose docstring begins `Test <name>`; API items realised by
a declaration with a different name are marked `API <name>`.

The final contract catalogue, generated from the packet, includes EVERY packet
declaration, API item and test under its proposed name; 117 of the 406 names have
a typed component above. An item marked "not stated" is an explicit signature
omission, not an elaborated theorem. Conditions that cannot be stated are left out,
not replaced by uninterpreted Prop fields or assumed comparison conclusions. Stating
the remaining signatures needs the geometric carriers the packet cites from its
suppliers (AdicEtaleGeometry A1, CrystallineCohomology CR.5, AdicSpacesPartII R0/R3,
PerfectoidSpaces P1/P3); the plan, not this file, is definitive for them.
-/

import TauCeti.RingTheory.Huber.Pair
import Mathlib.CategoryTheory.Sites.Canonical
import Mathlib.CategoryTheory.Sites.Sheaf
import Mathlib.RingTheory.Derivation.Basic
import Mathlib.RingTheory.AdicCompletion.Basic
import Mathlib.RingTheory.Perfectoid.BDeRham
import Mathlib.RingTheory.Perfection
import Mathlib.RingTheory.Polynomial.Basic
import Mathlib.RingTheory.LaurentSeries
import Mathlib.RingTheory.RootsOfUnity.Basic
import Mathlib.RingTheory.Nilpotent.Defs
import Mathlib.Algebra.Polynomial.Derivative
import Mathlib.Algebra.MonoidAlgebra.Defs
import Mathlib.GroupTheory.Exponent
import Mathlib.GroupTheory.Torsion
import Mathlib.GroupTheory.MonoidLocalization.GrothendieckGroup
import Mathlib.Data.ZMod.Basic
import Mathlib.Data.NNRat.Defs
import Mathlib.NumberTheory.Padics.PadicNumbers
import Mathlib.FieldTheory.IsAlgClosed.Basic
import Mathlib.LinearAlgebra.ExteriorPower.Basic
import Mathlib.Algebra.MvPolynomial.Basic
import Mathlib.RingTheory.Localization.Away.Basic
import Mathlib.LinearAlgebra.FreeModule.Basic
import Mathlib.LinearAlgebra.Dimension.Finrank
import Mathlib.Algebra.Module.Projective
import Mathlib.LinearAlgebra.Quotient.Basic
import Mathlib.LinearAlgebra.TensorProduct.Basic
import Mathlib.LinearAlgebra.Eigenspace.Basic
import Mathlib.LinearAlgebra.Matrix.Notation
import Mathlib.LinearAlgebra.Matrix.ToLin
import Mathlib.RepresentationTheory.Basic
import Mathlib.Topology.Algebra.IsUniformGroup.Defs
import Mathlib.Topology.Algebra.OpenSubgroup

set_option linter.unusedSectionVars false
set_option linter.unusedVariables false

noncomputable section
open CategoryTheory
open scoped TensorProduct
universe u v w

namespace TauCeti.LogAdic

/-! ### Log adic spaces and charts (stalk/affine components) -/

section StalkLog
variable (A M : Type*) [CommRing A] [CommMonoid M]

/-- Stalk/affine component of `LogAdicData`: a prelog structure `α : M → (A, ×)` on a ring
(a stalk, or sections over an affinoid) whose restriction `α⁻¹(A×) → A×` is bijective.
The étale-sheaf carrier, inverse images and strictness need the A1/CR.5 suppliers and
are not encoded. -/
structure LogAdicData where
  alpha : M →* A
  unitEquiv : {m : M // IsUnit (alpha m)} ≃ Aˣ
  unitEquiv_val : ∀ m, (unitEquiv m : A) = alpha m.val

namespace LogAdicData
variable {A M}

/-- API TauCeti.LogAdic.LogAdicData.trivial (affine component): the trivial log structure
`A× → A` uses units, not the terminal monoid. -/
def trivial : LogAdicData A Aˣ where
  alpha := Units.coeHom A
  unitEquiv := by sorry
  unitEquiv_val := by sorry

/-- Stalk component of a log morphism `(A, M, α) → (B, N, β)`: a ring map and a compatible
monoid map `β ∘ f♯ = f ∘ α`. Inverse images of étale monoid sheaves are not encoded. -/
structure Hom {B N : Type*} [CommRing B] [CommMonoid N]
    (L : LogAdicData A M) (L' : LogAdicData B N) where
  ring : A →+* B
  monoid : M →* N
  comm : ∀ m, L'.alpha (monoid m) = ring (L.alpha m)

/-- The identity stalk log morphism. -/
def Hom.id (L : LogAdicData A M) : Hom L L where
  ring := RingHom.id A
  monoid := MonoidHom.id M
  comm := by sorry

/-- Composition of stalk log morphisms. -/
def Hom.comp {B N C P : Type*} [CommRing B] [CommMonoid N] [CommRing C] [CommMonoid P]
    {L : LogAdicData A M} {L' : LogAdicData B N} {L'' : LogAdicData C P}
    (g : Hom L' L'') (f : Hom L L') : Hom L L'' where
  ring := g.ring.comp f.ring
  monoid := g.monoid.comp f.monoid
  comm := by sorry

/-- API TauCeti.LogAdic.LogAdicData.map_id (stalk component): the identity morphism has
identity structural monoid map. -/
theorem map_id (L : LogAdicData A M) : (Hom.id L).monoid = MonoidHom.id M := by sorry

/-- API TauCeti.LogAdic.LogAdicData.map_comp (stalk component): the composite morphism has the
composite structural monoid map. -/
theorem map_comp {B N C P : Type*} [CommRing B] [CommMonoid N] [CommRing C] [CommMonoid P]
    {L : LogAdicData A M} {L' : LogAdicData B N} {L'' : LogAdicData C P}
    (g : Hom L' L'') (f : Hom L L') :
    (g.comp f).monoid = g.monoid.comp f.monoid := by sorry

/-- API TauCeti.LogAdic.LogAdicData.characteristic (stalk component): `M̄ = M/α⁻¹(A×)`. For a
log structure `α⁻¹(A×) = Mˣ` (`isUnit_alpha_iff`), so `M̄` is `Associates M = M/Mˣ`, a sharp
monoid. The sheaf-level quotient and the `M^gp` comparison are not encoded. -/
abbrev characteristic (L : LogAdicData A M) := Associates M

/-- The face `α⁻¹(A×)` of a log structure is the unit group of `M`. -/
theorem isUnit_alpha_iff (L : LogAdicData A M) (m : M) : IsUnit (L.alpha m) ↔ IsUnit m := by
  sorry

/-- Test TauCeti.LogAdic.LogAdicData.trivial_units (affine component):
for `M = A×` the unit comparison is the identity. -/
example (a : Aˣ) : (trivial (A := A)).unitEquiv ⟨a, a.isUnit⟩ = a := by sorry

/-- Test TauCeti.LogAdic.LogAdicData.unit_fiber (stalk component):
every unit has a unique lift to `M`. -/
example (L : LogAdicData A M) (a : Aˣ) :
    ∃! m : M, L.alpha m = (a : A) := by sorry

/-- Test TauCeti.LogAdic.LogAdicData.not_terminal_monoid (stalk component at `ℚ_p`):
the one-element monoid mapping to `1` is not a log structure on `ℚ_p`. -/
example (p : ℕ) [Fact p.Prime] :
    ¬ ∃ L : LogAdicData ℚ_[p] PUnit, ∀ m, L.alpha m = 1 := by sorry
end LogAdicData

variable (P : Type*) [CommMonoid P]
  [TopologicalSpace A] [IsTopologicalRing A] [Huber.IsHuberRing A]

/-- Integral factorization part of an affine chart `P → M` over a Huber pair. The
associated-log isomorphism `P^a ≃ M` is a missing CR.5/sheaf interface and is not encoded. -/
structure IntegralChart (S : Huber.Pair A) (L : LogAdicData A M) where
  chart : P →* M
  integral : P →* S.plus
  structural : ∀ p, (integral p : A) = L.alpha (chart p)

namespace IntegralChart
variable {A M P} {S : Huber.Pair A} {L : LogAdicData A M}

/-- Every structural image of a chart element lies in the plus ring. -/
theorem mem_plus (c : IntegralChart A M P S L) (p : P) :
    L.alpha (c.chart p) ∈ S.plus := by sorry

/-- Test TauCeti.LogAdic.IntegralChart.reject_inverse_p (affine component): for the trivial log
structure `A×` and the prelog map `ℕ → A`, `1 ↦ u`, with `u` a unit outside `A⁺` (for
`Spa(ℚ_p, ℤ_p)`, `u = p⁻¹`), no integral chart has this chart map, although the associated
log structure of `u` is trivial. -/
example (u : Aˣ) (hu : (u : A) ∉ S.plus) :
    ¬ ∃ c : IntegralChart A Aˣ (Multiplicative ℕ) S LogAdicData.trivial,
      c.chart (Multiplicative.ofAdd 1) = u := by sorry
/-- API TauCeti.LogAdic.IntegralChart.Hom (affine component of Definition 2.3.19): a chart of a
morphism, i.e. charts `P → M` and `Q → N` with `u : P → Q` such that `f♯ ∘ θ_P = θ_Q ∘ u`. The
étale-local existence of fine/fs charts is not encoded. -/
structure Hom {B N Q : Type*} [CommRing B] [CommMonoid N] [CommMonoid Q]
    [TopologicalSpace B] [IsTopologicalRing B] [Huber.IsHuberRing B]
    {S' : Huber.Pair B} {L' : LogAdicData B N} (f : LogAdicData.Hom L L')
    (c : IntegralChart A M P S L) (c' : IntegralChart B N Q S' L') where
  u : P →* Q
  comm : ∀ p, f.monoid (c.chart p) = c'.chart (u p)
end IntegralChart
end StalkLog

/-! ### Continuous log derivations (affine component) -/

section ContinuousDerivations
variable {A B M N E : Type*}
  [CommRing A] [CommRing B] [Algebra A B]
  [CommMonoid M] [CommMonoid N]
  [AddCommGroup E] [Module B E] [Module A E] [IsScalarTower A B E]
  [TopologicalSpace B] [UniformSpace E] [IsUniformAddGroup E] [ContinuousSMul B E]
  [CompleteSpace E] [T2Space E]

/-- Continuous affine log derivation into a complete Hausdorff topological `B`-module `E`, for
the monoid part `f♯ : M → N` and structural map `β : N → B` of a prelog map. The prelog square
`β ∘ f♯ = f ∘ α` is not needed for the defining equations and is not carried. -/
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

/-- API TauCeti.LogAdic.ContinuousLogDerivation.toDerivation (projection): `(d, δ) ↦ d`. -/
def toDerivation (D : ContinuousLogDerivation (A := A) (E := E) fsharp beta) :
    Derivation A B E := D.d

/-- API TauCeti.LogAdic.ContinuousLogDerivation.deltaGp (group component): the group map
`N^gp → E` extending `δ` (here on `N^gp`; the logification `ᵃN` is not encoded). -/
def deltaGp (D : ContinuousLogDerivation (A := A) (E := E) fsharp beta) :
    Algebra.GrothendieckGroup N →* Multiplicative E :=
  Algebra.GrothendieckGroup.lift D.delta

/-- `δ^gp` vanishes on the image of `M`. -/
theorem deltaGp_relative_zero (D : ContinuousLogDerivation (A := A) (E := E) fsharp beta)
    (m : M) : D.deltaGp (Algebra.GrothendieckGroup.of (fsharp m)) = 1 := by sorry

theorem map_structural (D : ContinuousLogDerivation (A := A) (E := E) fsharp beta)
    (n : N) : D.d (beta n) = beta n • (D.delta n).toAdd := by sorry

/-- The pair of zero maps. -/
def zeroDerivation : ContinuousLogDerivation (A := A) (E := E) fsharp beta := by sorry

/-- Test TauCeti.LogAdic.ContinuousLogDerivation.zero: the zero pair is a log derivation. -/
example : (zeroDerivation (A := A) (E := E) (fsharp := fsharp) (beta := beta)).d = 0 ∧
    ∀ n, ((zeroDerivation (A := A) (E := E) (fsharp := fsharp) (beta := beta)).delta n).toAdd
      = 0 := by sorry

/-- Test TauCeti.LogAdic.ContinuousLogDerivation.unit_formula. -/
example (D : ContinuousLogDerivation (A := A) (E := E) fsharp beta)
    (n : N) (b : Bˣ) (hb : beta n = (b : B)) :
    (D.delta n).toAdd = (b⁻¹ : Bˣ) • D.d (beta n) := by sorry

/-- Test TauCeti.LogAdic.ContinuousLogDerivation.trivial_log (affine component): if every
`β(n)` is a unit and the prelog square `β ∘ f♯ = f ∘ α` holds, every continuous derivation
extends to a unique log derivation (with `δ(n) = β(n)⁻¹ d β(n)`, cf. `unit_formula`). -/
example (alpha : M →* A) (hsq : ∀ m, beta (fsharp m) = algebraMap A B (alpha m))
    (hβ : ∀ n, IsUnit (beta n)) (d : Derivation A B E) (hd : Continuous d) :
    ∃! D : ContinuousLogDerivation (A := A) (E := E) fsharp beta, D.d = d := by sorry

/-- Test TauCeti.LogAdic.ContinuousLogDerivation.boundary_value (boundary clause): on the
log point `ℕ → ℝ`, `1 ↦ 0` (the boundary value `T = 0`), the zero derivation `d` admits
`δ(1) = 1`; `d(T) = 0` does not force `δ(1) = 0`. -/
example : ∃ D : ContinuousLogDerivation (A := ℝ) (B := ℝ) (E := ℝ)
    (1 : PUnit →* Multiplicative ℕ) (powersHom ℝ 0),
    D.d = 0 ∧ (D.delta (Multiplicative.ofAdd 1)).toAdd = 1 := by sorry

variable {E' : Type*} [AddCommGroup E'] [Module B E'] [Module A E']
  [IsScalarTower A B E'] [UniformSpace E'] [IsUniformAddGroup E'] [ContinuousSMul B E']
  [CompleteSpace E'] [T2Space E']

def postcompose (D : ContinuousLogDerivation (A := A) (E := E) fsharp beta)
    (g : E →ₗ[B] E') (hg : Continuous g) :
    ContinuousLogDerivation (A := A) (E := E') fsharp beta := by sorry

theorem postcompose_d (D : ContinuousLogDerivation (A := A) (E := E) fsharp beta)
    (g : E →ₗ[B] E') (hg : Continuous g) (b : B) :
    (postcompose D g hg).d b = g (D.d b) := by sorry

theorem postcompose_id (D : ContinuousLogDerivation (A := A) (E := E) fsharp beta) :
    postcompose D LinearMap.id continuous_id = D := by sorry
end ContinuousLogDerivation
end ContinuousDerivations

/-! ### Log de Rham complexes and residues -/

section LogComplex
variable (K : Type*) [CommRing K] (E : ℕ → Type*)
  [∀ q, AddCommGroup (E q)] [∀ q, Module K (E q)]

/-- Underlying coefficient-linear complex after the geometric differential forms and
connection are supplied. It does not construct analytic forms. -/
structure AnalyticLogDR where
  d : ∀ q, E q →ₗ[K] E (q+1)
  d_sq : ∀ q e, d (q+1) (d q e) = 0

end LogComplex

section CoordinateLogDisc
open Polynomial
variable {K : Type*} [CommRing K]

namespace AnalyticLogDR

/-- API TauCeti.LogAdic.AnalyticLogDR.residue (chart component on the algebraic coordinate log
disc `ℕ → K[T]`, `1 ↦ T`): there `Ω¹_log` is free on `dlog T`; a log 1-form `f · dlog T` is
recorded by its coefficient `f`, and its residue along `T = 0` is `f(0)`. -/
def residue (f : K[X]) : K := f.eval 0

/-- The log differential `d f = T f'(T) dlog T` on the coordinate disc, in the same coefficients. -/
def logD (f : K[X]) : K[X] := X * derivative f

/-- Pullback of a log 1-form along the root map `T ↦ S^n`: `f(T) dlog T ↦ n f(S^n) dlog S`. -/
def rootPullback (n : ℕ) (f : K[X]) : K[X] := (n : K[X]) * f.comp (X ^ n)

/-- API TauCeti.LogAdic.AnalyticLogDR.pullback_residue (rank-one chart component): residues are
multiplied by the boundary multiplicity `n`. -/
theorem pullback_residue (n : ℕ) (f : K[X]) :
    residue (rootPullback n f) = n * residue f := by sorry

/-- Test TauCeti.LogAdic.AnalyticLogDR.residue_coordinate (chart component):
`res(dlog T) = 1` and `res(dT) = res(T dlog T) = 0`. -/
example : residue (1 : K[X]) = 1 ∧ residue (logD (X : K[X])) = 0 := by sorry

/-- Test TauCeti.LogAdic.AnalyticLogDR.root_pullback (chart component): under `T = S^n`,
`dlog T ↦ n dlog S`, with residue `n`. -/
example (n : ℕ) : rootPullback n (1 : K[X]) = (n : K[X]) ∧
    residue (rootPullback n (1 : K[X])) = n := by sorry
end AnalyticLogDR
end CoordinateLogDisc

/-! ### Filtered log connections (linear components) -/

section FilteredConnection
variable {K R E D : Type*} [CommRing K] [CommRing R] [Algebra K R]
  [AddCommGroup E] [AddCommGroup D] [Module R E] [Module R D]
  [Module K E] [Module K D] [IsScalarTower K R E] [IsScalarTower K R D]

/-- Lattice tensor filtration `Fil ⊗ Ω⁺`: the `R⁺`-span of the tensors `e ⊗ w` with `e ∈ F`
and `w ∈ Ω⁺`, i.e. the image of `F ⊗_{R⁺} Ω⁺ → E ⊗_R D`. -/
def latticeTensor (Rp : Subring R) (Dp : Submodule Rp D) (F : Submodule Rp E) :
    Submodule Rp (E ⊗[R] D) :=
  Submodule.span Rp {x | ∃ e ∈ F, ∃ w ∈ Dp, x = e ⊗ₜ[R] w}

/-- Affine/module component of a filtered log connection (DLLZ-RH Definition 3.1.7). `R` stands
for the sections of `O_X ⊗̂_k B_dR`, the subring `Rp` for those of `O_X ⊗̂_k B_dR⁺`, `K` for
the constants `B_dR`, `D` for `Ω^log_{X/B_dR}` with lattice `Dp = Ω^log_{X⁺/B_dR⁺}`, and
`d : R → D` for the log differential. The connection is `K`-linear with the Leibniz rule; the
filtration is by finite projective `Rp`-submodules spanning `E` over `R` (lattices); Griffiths
transversality is `∇ Fil^r ⊆ Fil^{r-1} ⊗ Ω⁺`. Integrability `∇² = 0` needs the exterior
algebra of `Ω^log` and is not encoded; nor are sheaf conditions or completed tensor products. -/
structure FilteredLogConnection (Rp : Subring R) (Dp : Submodule Rp D)
    (d : Derivation K R D) where
  nabla : E →ₗ[K] E ⊗[R] D
  leibniz : ∀ (f : R) (e : E), nabla (f • e) = f • nabla e + e ⊗ₜ[R] d f
  fil : ℤ → Submodule Rp E
  antitone_fil : Antitone fil
  fil_lattice : ∀ r, Submodule.span R (fil r : Set E) = ⊤
  fil_projective : ∀ r, Module.Finite Rp (fil r) ∧ Module.Projective Rp (fil r)
  transversality : ∀ r, ∀ e ∈ fil r, nabla e ∈ latticeTensor Rp Dp (fil (r - 1))

/-- The modified Leibniz rule `∇⁺(f e) = f ∇⁺e + t e ⊗ df` of a log t-connection, over the
positive coefficient ring (here `R` is the ring over which the t-connection is defined). -/
structure LogTConnection (d : Derivation K R D) (t : R) where
  nabla : E →ₗ[K] E ⊗[R] D
  leibniz : ∀ f e, nabla (f • e) = f • nabla e + (t • e) ⊗ₜ[R] d f

/-- Tensor-image filtration over a single ring: the span of `e ⊗ w` with `e ∈ F`. -/
def tensorFiltration (F : Submodule R E) : Submodule R (E ⊗[R] D) :=
  Submodule.span R {x | ∃ e ∈ F, ∃ w : D, x = e ⊗ₜ[R] w}

namespace FilteredLogConnection

/-- API TauCeti.LogAdic.FilteredLogConnection.coherent_filtered (module component of
Definition 3.1.7(4)): a `k`-linear log connection with a decreasing filtration by
`O_X`-submodules satisfying Griffiths transversality. Coherence and the filtered de Rham
complex are not encoded. -/
structure coherent_filtered (d : Derivation K R D) where
  nabla : E →ₗ[K] E ⊗[R] D
  leibniz : ∀ f e, nabla (f • e) = f • nabla e + e ⊗ₜ[R] d f
  fil : ℤ → Submodule R E
  antitone_fil : Antitone fil
  transversality : ∀ r e, e ∈ fil r → nabla e ∈ tensorFiltration (fil (r-1))

/-- API TauCeti.LogAdic.FilteredLogConnection.t_connection (Leibniz component of Lemma 3.1.8):
after base change to a ring in which `t` is a unit, `t⁻¹ ∇⁺` satisfies the ordinary log
Leibniz rule. The lattice filtration `{t^r E⁺}` is the one of the `trivial` test below; the
equivalence of categories and integrability are not encoded. -/
theorem t_connection (d : Derivation K R D) (t : R) (N : LogTConnection (E := E) d t)
    (ht : IsUnit t) (f : R) (e : E) :
    ht.unit⁻¹ • N.nabla (f • e) = f • (ht.unit⁻¹ • N.nabla e) + e ⊗ₜ[R] d f := by sorry

/-- API TauCeti.LogAdic.FilteredLogConnection.higgs (linear component of Lemma 3.1.9): when
`d t = 0`, a log t-connection induces an `R`-linear map `E/tE → (E ⊗ D)/t(E ⊗ D)`. The Tate
twist `(-1)` and `θ ∧ θ = 0` are not encoded. -/
def higgs (d : Derivation K R D) (t : R) (N : LogTConnection (E := E) d t) (hdt : d t = 0) :
    (E ⧸ (Ideal.span {t} • ⊤ : Submodule R E)) →ₗ[R]
      ((E ⊗[R] D) ⧸ (Ideal.span {t} • ⊤ : Submodule R (E ⊗[R] D))) := by sorry

theorem higgs_mk (d : Derivation K R D) (t : R) (N : LogTConnection (E := E) d t)
    (hdt : d t = 0) (e : E) :
    higgs d t N hdt (Submodule.Quotient.mk e) = Submodule.Quotient.mk (N.nabla e) := by sorry

/-- Test TauCeti.LogAdic.FilteredLogConnection.trivial (first clause): `E = R` with `∇ = 1 ⊗ d`
and `Fil^r = t^r R⁺` (all `r ∈ ℤ`) is a filtered log connection, for `t ∈ R⁺` a unit of `R`
killed by `d` and `d(R⁺) ⊆ Ω⁺`. The Lemma 3.1.8 and mod-`t` clauses are not encoded. -/
example (Rp : Subring R) (Dp : Submodule Rp D) (d : Derivation K R D) (t : Rp)
    (ht : IsUnit (t : R)) (hdt : d (t : R) = 0) (hd : ∀ a ∈ Rp, d a ∈ Dp) :
    ∃ N : FilteredLogConnection (E := R) Rp Dp d,
      (∀ f : R, N.nabla f = (1 : R) ⊗ₜ[R] d f) ∧
      ∀ r : ℤ, N.fil r = Submodule.span Rp {((ht.unit ^ r : Rˣ) : R)} := by sorry

/-- Test TauCeti.LogAdic.FilteredLogConnection.mod_t_linear:
the Leibniz defect `(t e) ⊗ df` disappears in a quotient annihilating `t`. -/
example (d : Derivation K R D) (t : R) (N : LogTConnection (E := E) d t)
    (Q : Submodule R (E ⊗[R] D))
    (ht : ∀ x : E ⊗[R] D, t • x ∈ Q) (f : R) (e : E) :
    Q.mkQ (N.nabla (f • e)) = f • Q.mkQ (N.nabla e) := by sorry
end FilteredLogConnection
end FilteredConnection

section BdRModel
open scoped LaurentSeries PowerSeries
variable (K : Type*) [Field K]

/-- `K⟦t⟧ ⊂ K⸨t⸩`, the one-variable model of `B_dR⁺ ⊂ B_dR` (`B_dR⁺ ≅ ℂ_p⟦t⟧`
non-canonically). -/
def powerSeriesSubring : Subring K⸨X⸩ := (HahnSeries.ofPowerSeries ℤ K).range

/-- Test TauCeti.LogAdic.FilteredLogConnection.not_unshifted (rank-one model): on `E = K⸨t⸩`
with `Fil^r = t^r K⟦t⟧`, constants `K⸨t⸩`, zero `d` and `∇ e = t⁻¹ e ⊗ 1`, Griffiths transversality holds but
`∇ Fil^r ⊄ Fil^r ⊗ Ω⁺`; an unshifted filtration condition would reject this object. -/
example : ∃ N : FilteredLogConnection (K := K⸨X⸩) (R := K⸨X⸩) (E := K⸨X⸩) (D := K⸨X⸩)
    (powerSeriesSubring K) (Submodule.span (powerSeriesSubring K) {1}) 0,
    ∃ r : ℤ, ∃ e ∈ N.fil r, N.nabla e ∉
      latticeTensor (powerSeriesSubring K) (Submodule.span (powerSeriesSubring K) {1})
        (N.fil r) := by sorry
end BdRModel

/-! ### Boundary monodromy (linear components) -/

section BoundaryAction
variable (K G V : Type*) [Field K] [Group G] [AddCommGroup V] [Module K V]

/-- Representation component on a supplied geometric inertia group and stalk.
The construction of the actual log geometric point is omitted. -/
abbrev BoundaryMonodromy := Representation K G V

namespace BoundaryMonodromy
variable {K G V}

/-- Unipotent inertia: every element acts by a unipotent operator. -/
def IsUnipotent (ρ : BoundaryMonodromy K G V) : Prop :=
  ∀ g, IsNilpotent (ρ g - 1)

/-- Quasi-unipotent inertia: an open subgroup acts unipotently. -/
def IsQuasiUnipotent [TopologicalSpace G] (ρ : BoundaryMonodromy K G V) : Prop :=
  ∃ H : OpenSubgroup G, ∀ h ∈ H, IsNilpotent (ρ h - 1)

/-- Truncated logarithm `log(1 + N) = ∑_{i < bound} (-1)^i N^(i+1) / (i+1)`; for nilpotent `N`
with `N^(bound+1) = 0` this is the finite logarithm (characteristic zero intended). -/
def logarithm (N : Module.End K V) (bound : ℕ) : Module.End K V :=
  ∑ i ∈ Finset.range bound, ((-1 : K)^i / (i+1 : K)) • N^(i+1)

/-- API TauCeti.LogAdic.BoundaryMonodromy.logarithm (nilpotence clause). -/
theorem logarithm_isNilpotent (N : Module.End K V) (hN : IsNilpotent N) (bound : ℕ) :
    IsNilpotent (logarithm N bound) := by sorry

/-- API TauCeti.LogAdic.BoundaryMonodromy.logarithm (commuting clause). -/
theorem logarithm_commute (N N' : Module.End K V) (h : Commute N N') (b b' : ℕ) :
    Commute (logarithm N b) (logarithm N' b') := by sorry

/-- API TauCeti.LogAdic.BoundaryMonodromy.tensor (representation component): tensor products
and duals of unipotent representations are unipotent. -/
theorem tensor {W : Type*} [AddCommGroup W] [Module K W]
    (ρ : BoundaryMonodromy K G V) (σ : BoundaryMonodromy K G W)
    (hρ : IsUnipotent ρ) (hσ : IsUnipotent σ) :
    IsUnipotent (ρ.tprod σ) ∧ IsUnipotent ρ.dual := by sorry

/-- The rank-one representation of a character. -/
def charRep (χ : G →* Kˣ) : BoundaryMonodromy K G K where
  toFun g := ((χ g : Kˣ) : K) • LinearMap.id
  map_one' := by sorry
  map_mul' := by sorry

/-- API TauCeti.LogAdic.BoundaryMonodromy.unipotent_along (chart component): at a crossing of
two boundary components the inertia is a product `G₁ × G₂`, and inertia is unipotent iff it is
unipotent along each component. -/
theorem unipotent_along {G₁ G₂ : Type*} [Group G₁] [Group G₂]
    (ρ : BoundaryMonodromy K (G₁ × G₂) V) :
    IsUnipotent ρ ↔ IsUnipotent (ρ.comp (MonoidHom.inl G₁ G₂)) ∧
      IsUnipotent (ρ.comp (MonoidHom.inr G₁ G₂)) := by sorry

/-- Test TauCeti.LogAdic.BoundaryMonodromy.componentwise (chart component): the rank-one system
on which `γ₁` acts trivially and `γ₂` by `-1` is unipotent along `Z₁` but not along `Z₂`. -/
example : let χ : Multiplicative ℤ × Multiplicative ℤ →* ℚˣ :=
      (zpowersHom ℚˣ (-1)).comp (MonoidHom.snd _ _)
    IsUnipotent ((charRep χ).comp (MonoidHom.inl _ _)) ∧
      ¬ IsUnipotent ((charRep χ).comp (MonoidHom.inr _ _)) := by sorry

/-- Test TauCeti.LogAdic.BoundaryMonodromy.trivial: the constant system has unipotent inertia
and zero logarithm. -/
example (bound : ℕ) : IsUnipotent (Representation.trivial K G V) ∧
    ∀ g, logarithm (Representation.trivial K G V g - 1) bound = 0 := by sorry

/-- Test TauCeti.LogAdic.BoundaryMonodromy.jordan: for `U = [[1,1],[0,1]]` the logarithm of
`U` is `[[0,1],[0,0]]` and its square is zero. -/
example : logarithm (Matrix.toLin' !![(1 : ℚ), 1; 0, 1] - 1) 2 = Matrix.toLin' !![(0 : ℚ), 1; 0, 0]
    ∧ (Matrix.toLin' !![(0 : ℚ), 1; 0, 0]) ^ 2 = 0 := by sorry

/-- Test TauCeti.LogAdic.BoundaryMonodromy.finite_character: a nontrivial character trivial on
an open subgroup is quasi-unipotent and not unipotent. -/
example [TopologicalSpace G] (χ : G →* Kˣ) (hχ : χ ≠ 1) (H : OpenSubgroup G)
    (hH : ∀ h ∈ H, χ h = 1) :
    IsQuasiUnipotent (charRep χ) ∧ ¬ IsUnipotent (charRep χ) := by sorry
end BoundaryMonodromy
end BoundaryAction

/-! ### Normalised residues (linear component) -/

section Residues
variable {K V : Type*} [Field K] [CharZero K] [AddCommGroup V] [Module K V]

/-- Normalised residues: every eigenvalue of the residue endomorphism is a rational number in
`[0, 1)`. Used by `log_regularity_and_extension`, `normalized_log_residues` and
`ArithmeticLogDR`; the residue map itself is geometric. -/
def HasNormalizedResidues (N : Module.End K V) : Prop :=
  ∀ μ : K, N.HasEigenvalue μ → ∃ q : ℚ, 0 ≤ q ∧ q < 1 ∧ μ = q

/-- Test TauCeti.LogAdic.LogRH.fractional_residue (residue component): a rank-one residue `2/3`
is normalised; the naive tensor-square residue `2/3 + 2/3 = 4/3` is not, while `1/3` is. -/
example : HasNormalizedResidues ((2/3 : ℚ) • (LinearMap.id : Module.End ℚ ℚ)) ∧
    ¬ HasNormalizedResidues ((2/3 + 2/3 : ℚ) • (LinearMap.id : Module.End ℚ ℚ)) ∧
    HasNormalizedResidues ((1/3 : ℚ) • (LinearMap.id : Module.End ℚ ℚ)) := by sorry
end Residues

/-! ### Kummer and log-smooth chart conditions (monoid components) -/

section KummerCharts
variable {P Q : Type*} [AddCommMonoid P] [AddCommMonoid Q]

/-- Kummer condition on a map of (characteristic, integral) monoids: injective, and every
element has a positive multiple in the image. Not the geometric `KummerEtale`. -/
def IsKummerChart (f : P →+ Q) : Prop :=
  Function.Injective f ∧ ∀ q, ∃ n : ℕ, 0 < n ∧ ∃ p, n • q = f p

/-- Chart part of the Kummer étale condition for a saturated source: a Kummer chart whose
index (a positive `n` with `n • Q ⊆ f(P)`) is invertible in `R`. The strict étaleness of
`Y → X ×_{X⟨P⟩} X⟨Q⟩` is geometric and not encoded. -/
def IsKummerEtaleChart (R : Type*) [CommRing R] (f : P →+ Q) : Prop :=
  IsKummerChart f ∧ ∃ n : ℕ, 0 < n ∧ IsUnit (n : R) ∧ ∀ q, ∃ p, n • q = f p

/-- Test TauCeti.LogAdic.KummerEtale.p_root_char_zero (chart component): `T = S^p` on the
coordinate chart is a Kummer étale chart over `ℚ_p`. -/
example (p : ℕ) [Fact p.Prime] : IsKummerEtaleChart ℚ_[p] (p • AddMonoidHom.id ℕ) := by sorry

/-- Test TauCeti.LogAdic.KummerEtale.reject_p_root_char_p (chart component): in characteristic
`p` the same root chart is not Kummer étale, as its index `p` is not invertible. -/
example (p : ℕ) [Fact p.Prime] (R : Type*) [CommRing R] [Nontrivial R] [CharP R p] :
    ¬ IsKummerEtaleChart R (p • AddMonoidHom.id ℕ) := by sorry

namespace KummerEtale
/-- API TauCeti.LogAdic.KummerEtale.of_strictEtale (chart component): a strict chart (an
isomorphism of characteristic monoids) satisfies the Kummer étale chart condition, with index
one. The étaleness of the underlying map is not encoded. -/
theorem of_strictEtale (R : Type*) [CommRing R] (e : P ≃+ Q) :
    IsKummerEtaleChart R e.toAddMonoidHom := by sorry
end KummerEtale

/-- Group completion `f^gp : P^gp → Q^gp` of a chart map. -/
def gpMap (f : P →+ Q) :
    Algebra.GrothendieckAddGroup P →+ Algebra.GrothendieckAddGroup Q :=
  Algebra.GrothendieckAddGroup.lift ((Algebra.GrothendieckAddGroup.of (M := Q)).comp f)

/-- Chart condition of `log_smooth_chart_criterion` (log smooth case): `ker f^gp` and the
torsion part of `coker f^gp` are finite of orders invertible in `R`. -/
def IsLogSmoothChart (R : Type*) [CommRing R] (f : P →+ Q) : Prop :=
  Finite (gpMap f).ker ∧ IsUnit ((Nat.card (gpMap f).ker : ℕ) : R) ∧
    Finite (AddCommGroup.torsion (Algebra.GrothendieckAddGroup Q ⧸ (gpMap f).range)) ∧
    IsUnit ((Nat.card (AddCommGroup.torsion
      (Algebra.GrothendieckAddGroup Q ⧸ (gpMap f).range)) : ℕ) : R)

/-- Chart condition of `log_smooth_chart_criterion` (log étale case): `ker f^gp` and
`coker f^gp` are finite of orders invertible in `R`. -/
def IsLogEtaleChart (R : Type*) [CommRing R] (f : P →+ Q) : Prop :=
  Finite (gpMap f).ker ∧ IsUnit ((Nat.card (gpMap f).ker : ℕ) : R) ∧
    Finite (Algebra.GrothendieckAddGroup Q ⧸ (gpMap f).range) ∧
    IsUnit ((Nat.card (Algebra.GrothendieckAddGroup Q ⧸ (gpMap f).range) : ℕ) : R)

/-- The semistable chart `ℕ → ℕ²`, `1 ↦ (1, 1)`, satisfies the log smooth chart condition over
every ring (trivial kernel, torsion-free cokernel `ℤ`), though it is not log étale. -/
example (R : Type*) [CommRing R] [Nontrivial R] :
    IsLogSmoothChart R (AddMonoidHom.prod (AddMonoidHom.id ℕ) (AddMonoidHom.id ℕ)) ∧
      ¬ IsLogEtaleChart R (AddMonoidHom.prod (AddMonoidHom.id ℕ) (AddMonoidHom.id ℕ)) := by
  sorry

/-- Ramification index at a point of a Kummer map, computed from the map `φ` of
characteristic groups: the exponent (not the cardinality) of `coker φ`. -/
def RamificationIndex {G H : Type*} [AddCommGroup G] [AddCommGroup H] (φ : G →+ H) : ℕ :=
  AddMonoid.exponent (H ⧸ φ.range)

namespace RamificationIndex
/-- Characteristic-group part of the strictness criterion: index one exactly when the
characteristic map is surjective (an isomorphism, for a Kummer map). -/
theorem index_one {G H : Type*} [AddCommGroup G] [AddCommGroup H] (φ : G →+ H) :
    RamificationIndex φ = 1 ↔ Function.Surjective φ := by sorry

/-- API TauCeti.LogAdic.RamificationIndex.isUnit (chart component): for a Kummer étale chart
the index (exponent of `coker f^gp`) is invertible in `R`. -/
theorem isUnit {R : Type*} [CommRing R] (f : P →+ Q) (hf : IsKummerEtaleChart R f) :
    IsUnit ((RamificationIndex (gpMap f) : ℕ) : R) := by sorry

/-- Test TauCeti.LogAdic.RamificationIndex.identity. -/
example : RamificationIndex (AddMonoidHom.id ℤ) = 1 := by sorry

/-- Test TauCeti.LogAdic.RamificationIndex.two_coordinates: multiplication by `n` on `ℤ²`
has cokernel `(ℤ/n)²` and index `n`, not `n²`. -/
example (n : ℕ) (hn : 0 < n) : RamificationIndex (n • AddMonoidHom.id (ℤ × ℤ)) = n := by sorry

/-- Test TauCeti.LogAdic.RamificationIndex.off_boundary: off the boundary the characteristic
group is zero, so the coordinate root map has index one even for `n > 1`. -/
example (n : ℕ) : RamificationIndex (n • AddMonoidHom.id (Fin 0 → ℤ)) = 1 := by sorry
/-- Test TauCeti.LogAdic.RamificationIndex.root_cover_strata (characteristic component): where
exactly `s ≥ 1` coordinates vanish, the `n`-th root cover has characteristic map `n` on `ℤ^s`,
cokernel `(ℤ/n)^s` and index `n`. -/
example (n s : ℕ) (hn : 0 < n) (hs : 1 ≤ s) :
    RamificationIndex (n • AddMonoidHom.id (Fin s → ℤ)) = n := by sorry
end RamificationIndex
end KummerCharts

/-! ### Root covers (affine algebra model) -/

section RootDisc
open Polynomial
variable (A : Type*) [CommRing A]

/-- Affine algebraic coordinate model `A[S]/(S^n - T)` of the rank-one root cover. The completed
toric algebra, integral logification and fs analytic base change need R0/CR.5. -/
abbrev RootCover (T : A) (n : ℕ) :=
  A[X] ⧸ Ideal.span {X ^ n - C T}

namespace RootCover
/-- The root `S`. -/
def root (T : A) (n : ℕ) : RootCover A T n :=
  Ideal.Quotient.mk _ X

/-- API TauCeti.LogAdic.RootCover.action (rank-one chart component, `P = ℕ`, where
`Hom((1/n)ℤ/ℤ, μ_n) = μ_n`): `ζ` acts by `S ↦ ζ S`. -/
def action (T : A) (n : ℕ) :
    rootsOfUnity n A →* (RootCover A T n ≃ₐ[A] RootCover A T n) := by sorry

/-- API TauCeti.LogAdic.RootCover.refine (algebra component): for `m = n k`, the map from the
`n`-th to the `m`-th root algebra, `S_n ↦ S_m^k`. -/
def refine (T : A) (n k : ℕ) : RootCover A T n →ₐ[A] RootCover A T (n * k) := by sorry

theorem refine_root (T : A) (n k : ℕ) :
    refine A T n k (root A T n) = root A T (n * k) ^ k := by sorry

/-- API TauCeti.LogAdic.RootCover.finite_surjective (algebra component): for `n > 0` the map
`A → A[S]/(S^n - T)` is finite and injective (hence surjective on spectra). The Kummer étale
clause is the chart condition `IsKummerEtaleChart`. -/
theorem finite_surjective (T : A) (n : ℕ) (hn : 0 < n) :
    Module.Finite A (RootCover A T n) ∧ Function.Injective (algebraMap A (RootCover A T n)) := by
  sorry

/-- Test TauCeti.LogAdic.RootCover.polydisc_degree (rank-one algebra component): `A[S]/(S^n - T)`
is free of rank `n` over `A`; the `μ_n`-action is `action`. -/
example [Nontrivial A] (T : A) (n : ℕ) (hn : 0 < n) :
    Module.Free A (RootCover A T n) ∧ Module.finrank A (RootCover A T n) = n := by sorry

/-- Test TauCeti.LogAdic.RootCover.one (affine algebra model). -/
example (T : A) : Nonempty (RootCover A T 1 ≃ₐ[A] A) := by sorry

/-- Test TauCeti.LogAdic.RootCover.disc_action: `ζ` sends `S` to `ζ S`. -/
example (T : A) (n : ℕ) (ζ : rootsOfUnity n A) :
    action A T n ζ (root A T n) = algebraMap A _ ((ζ : Aˣ) : A) * root A T n := by sorry

/-- Test TauCeti.LogAdic.RootCover.ramified_boundary (chart and fibre component): for `n > 1`
the characteristic map `ℤ → ℤ`, `1 ↦ n` has ramification index `n`, and the fibre
`K[S]/(S^n)` over `T = 0` is not reduced, so the cover is not étale there. -/
example (K : Type*) [Field K] (n : ℕ) (hn : 1 < n) :
    RamificationIndex (n • AddMonoidHom.id ℤ) = n ∧ ¬ IsReduced (RootCover K 0 n) := by sorry
end RootCover
end RootDisc

/-! ### All-root chart limit and its character group -/

section DivisibleChartLimit
/-- Chart-limit component of `AllRootTower` for the free chart `P = ℕ^r`: the all-root monoid
`P_{ℚ≥0}`. The pro-adic carrier and the completed perfectoid algebra are not encoded. -/
abbrev AllRootTower (r : ℕ) := Fin r → ℚ≥0

/-- Unique `n`-divisibility for every `n ≥ 1`: the chart-limit condition of
`LogAffinoidPerfectoid`. -/
def IsUniquelyDivisible (Γ : Type*) [AddCommMonoid Γ] : Prop :=
  ∀ n : ℕ, 0 < n → ∀ a : Γ, ∃! b : Γ, n • b = a

/-- The `p`-only root monoid `ℕ[1/p] = {m / p^k}` inside `ℚ≥0`. -/
def pOnlyRootMonoid (p : ℕ) : AddSubmonoid ℚ≥0 :=
  AddSubmonoid.closure (Set.range fun k : ℕ => (1 : ℚ≥0) / (p : ℚ≥0) ^ k)

/-- Root exponents modulo the lattice: `P_ℚ^gp / P^gp = (ℚ/ℤ)^r` for `P = ℕ^r`. -/
abbrev RootExponents (r : ℕ) :=
  (Fin r → ℚ) ⧸ AddSubgroup.pi Set.univ (fun _ : Fin r => (Int.castAddHom ℚ).range)

namespace AllRootTower

/-- API TauCeti.LogAdic.AllRootTower.geometric_group (chart component): the geometric group of
the rank-`r` all-root tower over `K`, as `Hom(P_ℚ^gp / P^gp, μ_∞(K))` (the intended `K` contains
all roots of unity). -/
abbrev geometricGroup (r : ℕ) (K : Type*) [Field K] :=
  RootExponents r →+ Additive (CommGroup.torsion Kˣ)

/-- `Hom(ℚ/ℤ, μ_∞(K))`, the rank-one geometric group; it is `Ẑ(1)` when `K` contains all roots
of unity (as in the packet's toric tower), and trivial for e.g. `K = ℚ`. -/
abbrev Zhat1 (K : Type*) [Field K] := geometricGroup 1 K

/-- API TauCeti.LogAdic.AllRootTower.geometric_group (characterisation): the geometric group is
`Hom(P^gp, Ẑ(1))` for `P^gp = ℤ^r`. -/
theorem geometric_group (r : ℕ) (K : Type*) [Field K] :
    Nonempty (geometricGroup r K ≃+ ((Fin r → ℤ) →+ Zhat1 K)) := by sorry

/-- The character `χ_a(γ) ∈ μ_∞(K)` of a root exponent `a`. -/
def character {r : ℕ} {K : Type*} [Field K] (γ : geometricGroup r K) (a : AllRootTower r) :
    Kˣ :=
  ((Additive.toMul (γ (QuotientAddGroup.mk fun i => ((a i : ℚ≥0) : ℚ))) :
    CommGroup.torsion Kˣ) : Kˣ)

/-- The action of the geometric group on the (uncompleted) root monomial algebra `K[P_{ℚ≥0}]`. -/
def action {r : ℕ} {K : Type*} [Field K] (γ : geometricGroup r K) :
    AddMonoidAlgebra K (AllRootTower r) ≃ₐ[K] AddMonoidAlgebra K (AllRootTower r) := by sorry

/-- API TauCeti.LogAdic.AllRootTower.character_action: `γ(e^a) = χ_a(γ) e^a`. -/
theorem character_action {r : ℕ} {K : Type*} [Field K] (γ : geometricGroup r K)
    (a : AllRootTower r) :
    action γ (AddMonoidAlgebra.single a 1) =
      AddMonoidAlgebra.single a ((character γ a : Kˣ) : K) := by sorry

/-- API TauCeti.LogAdic.AllRootTower.chart_limit_divisible (monoid component): the chart limit
`P_{ℚ≥0}` is uniquely `n`-divisible for every `n ≥ 1`. -/
theorem chart_limit_divisible (r : ℕ) : IsUniquelyDivisible (AllRootTower r) := by sorry

/-- Test TauCeti.LogAdic.AllRootTower.trivial_character_summand (chart component, `P = ℕ`): the
integral monomial `e^1` is invariant, while `e^{1/2}` is moved by some `γ` (it lies in the
order-two character summand). -/
example (K : Type*) [Field K] [IsAlgClosed K] [CharZero K] :
    (∀ γ : geometricGroup 1 K, action γ (AddMonoidAlgebra.single (fun _ => 1) 1) =
      AddMonoidAlgebra.single (fun _ => 1) 1) ∧
    ∃ γ : geometricGroup 1 K, action γ (AddMonoidAlgebra.single (fun _ => 1/2) 1) ≠
      AddMonoidAlgebra.single (fun _ => 1/2) 1 := by sorry

/-- Test TauCeti.LogAdic.AllRootTower.rank_zero: for `P = 0` the geometric group is trivial. -/
example (K : Type*) [Field K] : Subsingleton (geometricGroup 0 K) := by sorry

/-- Test TauCeti.LogAdic.AllRootTower.two_coordinates: for `P = ℕ²` the geometric group is
`Ẑ(1)²`. -/
example (K : Type*) [Field K] : Nonempty (geometricGroup 2 K ≃+ (Zhat1 K × Zhat1 K)) := by
  sorry

/-- Test TauCeti.LogAdic.AllRootTower.p_only_insufficient: for primes `q ≠ p`, `1` has no
`q`-th part in `ℕ[1/p]`. -/
example (p q : ℕ) [Fact p.Prime] [Fact q.Prime] (hqp : q ≠ p) :
    ¬ ∃ b ∈ pOnlyRootMonoid p, q • b = 1 := by sorry
end AllRootTower

/-- Test TauCeti.LogAdic.LogAffinoidPerfectoid.all_divisibility (chart component): the chart
limit is uniquely `n`-divisible for every `n ≥ 1`, not only for `p`-powers. -/
example (r : ℕ) : IsUniquelyDivisible (AllRootTower r) := by sorry

/-- Test TauCeti.LogAdic.LogAffinoidPerfectoid.no_p_only (chart component): for the chart
limit `ℕ[1/p]` unique `n`-divisibility fails for every `n > 1` prime to `p`. -/
example (p n : ℕ) [Fact p.Prime] (hn : 1 < n) (hnp : n.Coprime p) :
    ¬ ∀ a : pOnlyRootMonoid p, ∃! b : pOnlyRootMonoid p, n • b = a := by sorry
end DivisibleChartLimit

/-! ### Generic site carriers -/

section GenericSites
variable (C : Type u) [Category.{v} C] (J : GrothendieckTopology C)

/-- Once the Kummer object category and joint-surjectivity topology are supplied, use the
existing sheaf carrier. Construction of those inputs is omitted. -/
abbrev KummerEtaleSite := Sheaf J (Type v)

namespace KummerEtaleSite
/-- Yoneda API on a supplied subcanonical topology. Subcanonicity of the Kummer topology is
the geometric content of the API item and is taken here as a hypothesis. -/
def representable [J.Subcanonical] (U : C) : KummerEtaleSite C J := J.yoneda.obj U
end KummerEtaleSite

variable (I : Type w) [Category I]
/-- Diagram part only; cofilteredness, eventual finite Kummer transitions and the finite
initial stage are not typed through a geometric supplier. -/
abbrev ProKummerPresentation := Iᵒᵖ ⥤ C

/-- Sheaf carrier on a supplied pro-Kummer site; the corrected covers are not encoded. -/
abbrev ProKummerEtaleSite (D : Type u) [Category.{v} D]
    (K : GrothendieckTopology D) := Sheaf K (Type v)
end GenericSites

/-! ### Completed structural rings (affine components) -/

section Completions
variable (R : Type*) [CommRing R] (p : ℕ)

/-- Affine completed plus-ring component `Ô⁺ = lim O⁺/p^n`. This is not sheafification. -/
abbrev CompletedLogStructure := AdicCompletion (Ideal.span {(p : R)}) R

namespace CompletedLogStructure

/-- API TauCeti.LogAdic.CompletedLogStructure.mod_p (affine component): completion does not
change the reduction modulo `p`. -/
theorem mod_p : Nonempty ((CompletedLogStructure R p ⧸
    (Ideal.span {(p : R)} • ⊤ : Submodule R (CompletedLogStructure R p))) ≃ₗ[R]
      (R ⧸ Ideal.span {(p : R)})) := by sorry

/-- Test TauCeti.LogAdic.CompletedLogStructure.constant_point (affine component): for a
`p`-adically complete plus ring the completion map is bijective. -/
example [IsAdicComplete (Ideal.span {(p : R)}) R] :
    Function.Bijective
      (AdicCompletion.of (Ideal.span {(p : R)}) R : R → CompletedLogStructure R p) := by sorry

/-- Test TauCeti.LogAdic.CompletedLogStructure.not_localize_first: once `p` is a unit the
`p`-adic completion is zero. -/
example (hp : IsUnit (p : R)) : Subsingleton (CompletedLogStructure R p) := by sorry

variable [Fact p.Prime] [Fact ¬IsUnit (p : R)]

/-- API TauCeti.LogAdic.CompletedLogStructure.tilt_projection (affine component): the `n`-th
Frobenius-limit projection `R^♭ → R/p` of the imported tilt; the sharp map is
`PreTilt.untilt` for `p`-adically complete `R`. -/
abbrev tilt_projection (n : ℕ) : PreTilt R p →+* ModP R p := PreTilt.coeff n

/-- Test TauCeti.LogAdic.CompletedLogStructure.frobenius_relation: a tilt sequence satisfies
`x_{n+1}^p = x_n` modulo `p`. -/
example (x : PreTilt R p) (n : ℕ) :
    tilt_projection R p (n + 1) x ^ p = tilt_projection R p n x := by sorry
end CompletedLogStructure

variable [Fact p.Prime] [Fact ¬IsUnit (p : R)]
  [IsAdicComplete (Ideal.span {(p : R)}) R]

/-- Existing period carrier, with precisely its existing hypotheses.
The log-site instantiation and all period-sheaf claims are omitted. -/
abbrev LogConstantPeriods := BDeRhamPlus R p

namespace LogConstantPeriods
abbrev theta := fontaineThetaInvertP R p
end LogConstantPeriods
end Completions

/-! ### Structural relations (affine component) -/

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

/-- Test TauCeti.LogAdic.StructuralLogPeriodPlus.boundary_relation (relation component):
where the Teichmüller lift vanishes the relation still holds, `T = [T♭] e_T = 0`, with no
division by `T`. -/
example (a b e : P →* A) (m : P) (hb : b m = 0) :
    Ideal.Quotient.mk (structuralRelations a b e) (a m) = 0 := by sorry
end StructuralLogPeriodPlus
end StructuralRelations

/-! ### Two lattices and the lattice Hodge–Tate filtration (module components) -/

section LatticeFiltration
variable (R V : Type*) [CommRing R] [AddCommGroup V] [Module R V]

/-- Submodule and filtration data in a common ambient module: `M`, `Fil¹M` and `Fil^j M⁰`.
This omits horizontal-section, lattice/localisation and local-freeness conditions. -/
structure TwoDeRhamLattices where
  first : Submodule R V
  firstFilOne : Submodule R first
  secondFil : ℤ → Submodule R V
  antitone_second : Antitone secondFil

/-- Ascending image filtration `F_i = image(M ∩ Fil^{-i} M⁰ → M / Fil¹M)`. -/
def LatticeHTFiltration (L : TwoDeRhamLattices R V) (i : ℤ) :
    Submodule R (L.first ⧸ L.firstFilOne) :=
  (L.secondFil (-i)).comap L.first.subtype |>.map L.firstFilOne.mkQ

namespace LatticeHTFiltration
variable {R V} (L : TwoDeRhamLattices R V)

theorem mem (i : ℤ) (x : L.first ⧸ L.firstFilOne) :
    x ∈ LatticeHTFiltration R V L i ↔
      ∃ m : L.first, (m : V) ∈ L.secondFil (-i) ∧ L.firstFilOne.mkQ m = x := by sorry

theorem mono : Monotone (LatticeHTFiltration R V L) := by sorry

/-- Test TauCeti.LogAdic.LatticeHTFiltration.correct_denominator: `F_{-j}` is
`(M ∩ Fil^j M⁰) / (Fil¹M ∩ Fil^j M⁰)`, the denominator being the intersection. -/
example (j : ℤ) :
    Nonempty ((((L.secondFil j).comap L.first.subtype) ⧸
      (L.firstFilOne.comap ((L.secondFil j).comap L.first.subtype).subtype)) ≃ₗ[R]
        LatticeHTFiltration R V L (-j)) := by sorry

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

section RankOneLattices
open scoped LaurentSeries PowerSeries
variable (K : Type*) [Field K]

/-- Scalar rank-one model inside `K⸨t⸩` over `K⟦t⟧`: `M = K⟦t⟧`, `Fil¹M = t M` and
`Fil^j M⁰ = t^(j+a) K⟦t⟧`, i.e. `M⁰ = t^a M` with its `t`-adic filtration. -/
def rankOneLattices (a : ℤ) : TwoDeRhamLattices K⟦X⟧ K⸨X⸩ where
  first := Submodule.span K⟦X⟧ {HahnSeries.single 0 1}
  firstFilOne :=
    (Submodule.span K⟦X⟧ {HahnSeries.single 1 1}).comap (Submodule.subtype _)
  secondFil j := Submodule.span K⟦X⟧ {HahnSeries.single (j + a) 1}
  antitone_second := by sorry

/-- Test TauCeti.LogAdic.TwoDeRhamLattices.relative_position (rank-one model): both lattices
span the same `K⸨t⸩`-line, and `M / Fil¹M ≃ K⟦t⟧ / (t)`; the shift `a` is kept in `M⁰`. -/
example (a : ℤ) :
    Submodule.span K⸨X⸩ ((rankOneLattices K a).first : Set K⸨X⸩) =
      Submodule.span K⸨X⸩ ((rankOneLattices K a).secondFil 0 : Set K⸨X⸩) ∧
    Nonempty (((rankOneLattices K a).first ⧸ (rankOneLattices K a).firstFilOne) ≃ₗ[K⟦X⟧]
      (K⟦X⟧ ⧸ Ideal.span {(PowerSeries.X : K⟦X⟧)})) := by sorry

/-- Test TauCeti.LogAdic.LatticeHTFiltration.weight_zero (rank-one model, `a = 0`):
`F_i = 0` for `i < 0` and `F_i` is the full line for `i ≥ 0`. -/
example : (∀ i < 0, LatticeHTFiltration _ _ (rankOneLattices K 0) i = ⊥) ∧
    ∀ i, 0 ≤ i → LatticeHTFiltration _ _ (rankOneLattices K 0) i = ⊤ := by sorry

/-- Test TauCeti.LogAdic.LatticeHTFiltration.lattice_shift (rank-one model): for
`M⁰ = t^a M`, `F_i = 0` for `i < a` and `F_i` is the full quotient for `i ≥ a`. -/
example (a : ℤ) : (∀ i < a, LatticeHTFiltration _ _ (rankOneLattices K a) i = ⊥) ∧
    ∀ i, a ≤ i → LatticeHTFiltration _ _ (rankOneLattices K a) i = ⊤ := by sorry
/-- Test TauCeti.LogAdic.LatticeHTFiltration.tate_line (rank-one model, `M⁰ = t⁻¹M`):
`F_{-2} = 0` and `F_{-1}` is the full line, so the jump is at `-1`, not `+1`. -/
example : LatticeHTFiltration _ _ (rankOneLattices K (-1)) (-2) = ⊥ ∧
    LatticeHTFiltration _ _ (rankOneLattices K (-1)) (-1) = ⊤ := by sorry
end RankOneLattices

/-! ### Central cyclotomic twist (representation component) -/

section CentralTwist
variable {G K V : Type*} [Group G] [Field K] [AddCommGroup V] [Module K V]

/-- Associated representation component of the central cyclotomic twist: `chi` stands for the
composite of the cyclotomic character with the central cocharacter `µ`, acting on the
representation through weight `w`. The torsor contracted product and geometric comparison
are unstated. -/
def FiniteLeviComparison (chi : G →* Kˣ) (w : ℤ)
    (rho : Representation K G V) : Representation K G V where
  toFun g := (((chi g) ^ w : Kˣ) : K) • rho g
  map_one' := by sorry
  map_mul' := by sorry

namespace FiniteLeviComparison

/-- API TauCeti.LogAdic.FiniteLeviComparison.central_twist (representation component): the
twist acts through the central scalar `chi(g)^w`. -/
theorem central_twist (chi : G →* Kˣ) (w : ℤ) (rho : Representation K G V) (g : G) :
    FiniteLeviComparison chi w rho g = (((chi g) ^ w : Kˣ) : K) • rho g := by sorry

/-- Test TauCeti.LogAdic.FiniteLeviComparison.weight_zero. -/
example (chi : G →* Kˣ) (rho : Representation K G V) :
    FiniteLeviComparison chi 0 rho = rho := by sorry

/-- Test TauCeti.LogAdic.FiniteLeviComparison.weight_one (associated action): weight one acts
by `chi`, and on the trivial line this differs from the untwisted action wherever
`chi(g) ≠ 1`. -/
example (chi : G →* Kˣ) (rho : Representation K G V) (g : G) (v : V) (g' : G)
    (hg' : (chi g' : K) ≠ 1) :
    FiniteLeviComparison chi 1 rho g v = (chi g : K) • rho g v ∧
      FiniteLeviComparison chi 1 (Representation.trivial K G K) g' 1 ≠ 1 := by sorry
end FiniteLeviComparison
end CentralTwist

/-! ### Toric log algebras (algebra components) -/

section ToricLog
variable (R : Type*) [CommRing R] (P : Type*) [AddCommMonoid P]

/-- Algebra component of `MonoidAlgebraLog`: the uncompleted monoid algebra `R[P]`, with `e^a`
for `a ∈ P`. The Huber-pair topology (ring of definition `R₀[P]`, ideal `I R₀[P]`), the
completion `R⟨P⟩`, its adic spectrum and the associated log structure are not encoded. -/
abbrev MonoidAlgebraLog := AddMonoidAlgebra R P

namespace MonoidAlgebraLog

/-- API TauCeti.LogAdic.MonoidAlgebraLog.tautologicalChart (algebra component): `a ↦ e^a`. -/
def tautologicalChart : Multiplicative P →* MonoidAlgebraLog R P := AddMonoidAlgebra.of R P

/-- The plus subring `R⁺[P] ⊆ R[P]` of a subring `R⁺ ⊆ R`. -/
def plus (S : Subring R) : Subring (MonoidAlgebraLog R P) :=
  (AddMonoidAlgebra.mapRingHom P S.subtype).range

/-- API TauCeti.LogAdic.MonoidAlgebraLog.tautologicalChart (integral-image clause): the chart
takes values in `R⁺[P]`. -/
theorem tautologicalChart_mem_plus (S : Subring R) (a : Multiplicative P) :
    tautologicalChart R P a ∈ plus R P S := by sorry

/-- API TauCeti.LogAdic.MonoidAlgebraLog.map (algebra component): `u : P → Q` induces
`R[P] → R[Q]` (the map `Y⟨Q⟩ → Y⟨P⟩` on spaces), compatible with the charts. -/
def map {Q : Type*} [AddCommMonoid Q] (u : P →+ Q) :
    MonoidAlgebraLog R P →ₐ[R] MonoidAlgebraLog R Q :=
  AddMonoidAlgebra.mapDomainAlgHom R R u

theorem map_chart {Q : Type*} [AddCommMonoid Q] (u : P →+ Q) (a : Multiplicative P) :
    map R P u (tautologicalChart R P a) =
      tautologicalChart R Q (Multiplicative.ofAdd (u a.toAdd)) := by sorry

theorem map_id : map R P (AddMonoidHom.id P) = AlgHom.id R (MonoidAlgebraLog R P) := by sorry

theorem map_comp {Q S : Type*} [AddCommMonoid Q] [AddCommMonoid S] (u : P →+ Q) (v : Q →+ S) :
    map R P (v.comp u) = (map R Q v).comp (map R P u) := by sorry

/-- API TauCeti.LogAdic.MonoidAlgebraLog.lift (algebra component of Remarks 2.3.2–2.3.3):
`R`-algebra maps `R[P] → A` correspond to monoid maps `P → (A, ×)`. The log-structure and
plus-ring conditions of the geometric statement are not encoded. -/
def lift (A : Type*) [CommRing A] [Algebra R A] :
    (Multiplicative P →* A) ≃ (MonoidAlgebraLog R P →ₐ[R] A) :=
  AddMonoidAlgebra.lift R A P

/-- Test TauCeti.LogAdic.MonoidAlgebraLog.nat_polydisc (algebra component): for `P = ℕⁿ`,
`R[P]` is the polynomial ring and the chart is `a ↦ T₁^{a₁} ⋯ Tₙ^{aₙ}`. -/
example (k : Type*) [Field k] (n : ℕ) (a : Fin n →₀ ℕ) :
    (tautologicalChart k (Fin n →₀ ℕ) (Multiplicative.ofAdd a) : MvPolynomial (Fin n) k) =
      a.prod fun i e => MvPolynomial.X i ^ e := by sorry

/-- Test TauCeti.LogAdic.MonoidAlgebraLog.int_circle (algebra component): for `P = ℤ` every chart
value is a unit, so the associated log structure is trivial. -/
example : ∀ a : Multiplicative ℤ, IsUnit (tautologicalChart R ℤ a) := by sorry

/-- Test TauCeti.LogAdic.MonoidAlgebraLog.zero_monoid (algebra component): for `P = 0`,
`R[P] = R`. -/
example : Nonempty (MonoidAlgebraLog R (Fin 0 → ℕ) ≃ₐ[R] R) := by sorry

/-- Test TauCeti.LogAdic.MonoidAlgebraLog.origin_nontrivial (algebra component): at the point
`T = 0` of `k[ℕ]` a chart value `e^a` is a unit only for `a = 0`, so the characteristic there
is `ℕ`, not `0`. -/
example (k : Type*) [Field k] (a : ℕ) :
    IsUnit (lift k ℕ k (powersHom k 0) (tautologicalChart k ℕ (Multiplicative.ofAdd a))) ↔
      a = 0 := by sorry
end MonoidAlgebraLog
end ToricLog

/-! ### Stalk model for Kummer higher direct images -/

/-- Stalk-side module of `kummer_etale_higher_direct_images` (not the theorem):
`∧^i_{ℤ/n}(G / nG)` for the characteristic group `G = M̄^gp`, as `⋀[ZMod n]^i (ZMod n ⊗[ℤ] G)`.
The twist by `μ_n^{⊗(-i)}` and the comparison with `R^iε_*` are not encoded. -/
abbrev kummerStalkModel (n i : ℕ) (G : Type*) [AddCommGroup G] :=
  ⋀[ZMod n]^i (ZMod n ⊗[ℤ] G)

/-- At a point with characteristic `ℕ^r` and `n = p` prime, the stalk model has dimension
`(r choose i)`. -/
example (p r i : ℕ) [Fact p.Prime] :
    Module.finrank (ZMod p) (kummerStalkModel p i (Fin r → ℤ)) = r.choose i := by sorry

/-! ### B_dR coefficient rings (affine component) -/

section BdRCoefficients
variable (Bp : Type*) [CommRing Bp] (t : Bp)

/-- Affine component of `BdRCoefficientSheaf`: from the ring `Bp` of sections of
`O_X ⊗̂_k B_dR⁺` and `t`, the sections `Bp[1/t]` of `O_X ⊗̂_k B_dR`. The truncations, completed
tensor products, sheaf conditions and the Galois action are not encoded. -/
abbrev BdRCoefficientSheaf := Localization.Away t

namespace BdRCoefficientSheaf

/-- API TauCeti.LogAdic.BdRCoefficientSheaf.fil (module component): `Fil^r = t^r · Bp` inside
`Bp[1/t]` for every `r ∈ ℤ`. -/
def fil (r : ℤ) : Submodule Bp (BdRCoefficientSheaf Bp t) :=
  Submodule.span Bp
    {(((IsLocalization.Away.algebraMap_isUnit (S := Localization.Away t) t).unit ^ r :
      (Localization.Away t)ˣ) : Localization.Away t)}

theorem fil_antitone : Antitone (fil Bp t) := by sorry

/-- `Fil^{r+s} = t^s Fil^r` for `s ≥ 0`. -/
theorem fil_shift (r : ℤ) (s : ℕ) :
    fil Bp t (r + s) = (Ideal.span {t ^ s} : Ideal Bp) • fil Bp t r := by sorry

/-- The graded piece `gr^r = Fil^r / Fil^{r+1}`. -/
abbrev gr (r : ℤ) := fil Bp t r ⧸ (fil Bp t (r + 1)).comap (fil Bp t r).subtype

/-- API TauCeti.LogAdic.BdRCoefficientSheaf.grade (module component of Lemma 3.1.4(2)): for `t`
a nonzerodivisor, `gr^r ≅ Bp/t` for every `r`; the Galois twist `(r)` is not encoded. -/
theorem grade (ht : t ∈ nonZeroDivisors Bp) (r : ℤ) :
    Nonempty (gr Bp t r ≃ₗ[Bp] (Bp ⧸ Ideal.span {t})) := by sorry
end BdRCoefficientSheaf

open scoped PowerSeries in
/-- Test TauCeti.LogAdic.BdRCoefficientSheaf.point (model `B_dR⁺ ≅ K⟦t⟧`): `gr⁰ ≅ K`. -/
example (K : Type*) [Field K] :
    Nonempty (BdRCoefficientSheaf.gr K⟦X⟧ PowerSeries.X 0 ≃+ K) := by sorry
end BdRCoefficients

/-! ### Hodge–Tate flags (linear component) -/

section HodgeTateFlag
variable {K W V : Type*} [Field K] [AddCommGroup W] [Module K W] [AddCommGroup V] [Module K V]

namespace HodgeTateReduction

/-- API TauCeti.LogAdic.HodgeTateReduction.mem (pointwise component): a trivialization
`φ : W → V` carries the ascending filtration `Fil_•W` to `F_•`. `P_HT` is the sheaf of tensor
trivializations with this property for all `W`; torsor and sheaf structure are not encoded. -/
def mem (Fil : ℤ → Submodule K W) (F : ℤ → Submodule K V) (φ : W →ₗ[K] V) : Prop :=
  ∀ i, (Fil i).map φ = F i

/-- The standard ascending filtration `Fil_i = ⊕_{w ≥ -i} W[µ-weight w]` on `K^n` for the
weights `wt`. -/
def weightFil {n : ℕ} (wt : Fin n → ℤ) (i : ℤ) : Submodule K (Fin n → K) :=
  Submodule.span K (Set.range fun j : {j : Fin n // -i ≤ wt j} => Pi.single (j : Fin n) (1 : K))

/-- Test TauCeti.LogAdic.HodgeTateReduction.torus (linear component): for central `µ` (a single
weight) every automorphism preserves `Fil_•`, so `P_µ` is the whole group. -/
example (n : ℕ) (w : ℤ) (g : (Fin n → K) ≃ₗ[K] (Fin n → K)) :
    mem (weightFil (fun _ : Fin n => w)) (weightFil (fun _ : Fin n => w))
      (g : (Fin n → K) →ₗ[K] (Fin n → K)) := by sorry

/-- Test TauCeti.LogAdic.HodgeTateReduction.stabilizer_faithful (GL₂ component): for
`µ(t) = diag(t, 1)` (weights `1, 0`) the upper unipotent, in `P_µ = {g | lim_{t→0} Ad µ(t) g
exists}`, preserves `Fil_•`; the lower unipotent, in `P^std_µ`, does not. -/
example : mem (weightFil (K := ℚ) ![1, 0]) (weightFil ![1, 0])
      (Matrix.toLin' !![(1 : ℚ), 1; 0, 1]) ∧
    ¬ mem (weightFil (K := ℚ) ![1, 0]) (weightFil ![1, 0])
      (Matrix.toLin' !![(1 : ℚ), 0; 1, 1]) := by sorry
end HodgeTateReduction
end HodgeTateFlag

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

Let X be an étale sheafy adic space. A pre-log structure on X is a sheaf M_X of commutative monoids on X_ét with a monoid map α:M_X→(O_{X_ét},·); morphisms of pre-log structures commute with the structure maps. It is a log structure, and (X,M_X,α) a log adic space, if α restricts to an isomorphism α⁻¹(O×_{X_ét})≃O×_{X_ét}. The log structure ᵃM associated with a pre-log structure is the pushout O×_{X_ét}←α⁻¹(O×_{X_ét})→M_X in sheaves of monoids, and logification is left adjoint to the inclusion of log structures into pre-log structures. The characteristic is M̄_X=M_X/α⁻¹(O×_{X_ét}); its geometric stalks are sharp. M_X is integral (resp. saturated) if it is a sheaf of integral (resp. saturated) monoids, equivalently if every geometric stalk is. A morphism (Y,M_Y,α_Y)→(X,M_X,α_X) is a morphism f:Y→X of adic spaces with a monoid-sheaf map f♯:f⁻¹M_X→M_Y compatible with f♯:f⁻¹O_{X_ét}→O_{Y_ét} and the structure maps. The pullback f*M_X is the log structure associated with f⁻¹M_X→f⁻¹O_{X_ét}→O_{Y_ét}; f is strict if f*M_X→M_Y is an isomorphism, equivalently if M̄_{X,f(ȳ)}→M̄_{Y,ȳ} is an isomorphism at every geometric point ȳ, and exact if, at every geometric point ȳ, the induced homomorphism (f*M_X)_ȳ→M_{Y,ȳ} is exact (for integral log structures, equivalently the induced map of characteristic stalks is exact). Properties of the underlying adic space or morphism (locally noetherian, affinoid, lft, proper, finite, …) are attributed to the log adic space or log morphism.

Hypotheses: X is étale sheafy (DLLZ Convention 2.2.1). The packet instantiates the étale site and structure sheaves of AdicEtaleGeometry A1, which are built for locally strongly sheafy analytic adic spaces (including locally noetherian analytic adic spaces and perfectoid spaces). DLLZ's non-analytic locally noetherian spaces, such as Spa(A,A) for a formal scheme in Proposition 2.2.22, are outside this specialisation. Coherent, fine and fs log adic spaces are defined through integral charts (integral-adic-chart, DLLZ Definition 2.3.5), not through finite generation of section monoids.

Suppliers and local inputs: AdicEtaleGeometry:A1/etale-site, AdicEtaleGeometry:A1/etale-structure-sheaf, CrystallineCohomology:CR.5:log-algebra/log-structure, CrystallineCohomology:CR.5:log-algebra/associated-log, CrystallineCohomology:CR.5:log-algebra/log-pullback, CrystallineCohomology:CR.5:log-algebra.

TauCeti.LogAdic.LogAdicData [constructor]: component above; full contract follows.
Bundle the monoid sheaf, structural map and unit isomorphism over the imported étale ringed adic carrier.

TauCeti.LogAdic.LogAdicData.strict [characterisation]: not stated; depends on the full geometric constructor.
f is strict exactly when the logified pullback map is an isomorphism.

TauCeti.LogAdic.LogAdicData.map_id [functoriality]: component above; full contract follows.
Identity inverse image induces the identity log morphism.

TauCeti.LogAdic.LogAdicData.map_comp [functoriality]: component above; full contract follows.
The composite log map is the composite of the inverse-image structural maps.

TauCeti.LogAdic.LogAdicData.associated [universal-property]: not stated; depends on the full geometric constructor.
The log structure associated with a pre-log structure, with its canonical map from the pre-log structure; it is initial among maps to log structures over O_{X_ét} (Remark 2.2.3).

TauCeti.LogAdic.LogAdicData.pullback [functoriality]: not stated; depends on the full geometric constructor.
f*M_X, the logification of f⁻¹M_X→f⁻¹O_{X_ét}→O_{Y_ét}, with canonical isomorphisms id*≅id and (g∘f)*≅f*∘g*.

TauCeti.LogAdic.LogAdicData.characteristic [projection]: component above; full contract follows.
The characteristic M̄_X=M_X/α⁻¹(O×_{X_ét}); its geometric stalks are sharp, and when M_X is integral M_{X,x̄}^gp/O×_{X_ét,x̄}≃M̄_{X,x̄}^gp (Remark 2.2.5).

TauCeti.LogAdic.LogAdicData.trivial [example]: component above; full contract follows.
The trivial log structure O×_{X_ét}→O_{X_ét} (Example 2.2.7); it is the pullback of the trivial log structure along any morphism.

TauCeti.LogAdic.LogAdicData.strict_iff_stalk [characterisation]: not stated; depends on the full geometric constructor.
f is strict if and only if M̄_{X,f(ȳ)}→M̄_{Y,ȳ} is an isomorphism at every geometric point ȳ of Y (Remark 2.2.6).

TauCeti.LogAdic.LogAdicData.trivial_units [degenerate]: component example above; full test follows.
For M=O_X× the unit comparison is the identity.

TauCeti.LogAdic.LogAdicData.unit_fiber [characterisation]: component example above; full test follows.
At every geometric stalk, each unit of O_X has a unique lift in α⁻¹(O_X×).

TauCeti.LogAdic.LogAdicData.not_terminal_monoid [non-example]: component example above; full test follows.
For Spa(Q_p,Z_p), the one-element monoid mapping to 1 is not a log structure because Q_p× has more than one element.

Sources: DLLZ-adic Convention 2.2.1, p. 7; DLLZ-adic Definition 2.2.2(3), p. 8; DLLZ-adic Definition 2.2.2(7)-(8), p. 8; DLLZ-adic Example 2.2.7 and Remark 2.2.6, p. 9.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:log-sites/toric-log-adic-space
TauCeti.LogAdic.MonoidAlgebraLog: component above; full geometric signature not stated.

For a Huber pair (R,R⁺) with ring of definition R₀ adic for a finitely generated ideal I and a monoid P, (R[P],R⁺[P]) with ring of definition R₀[P] and ideal of definition IR₀[P] is a Huber pair (Lemma 2.2.11); (R⟨P⟩,R⁺⟨P⟩) is its completion and Spa(R[P],R⁺[P])=Spa(R⟨P⟩,R⁺⟨P⟩) (Remark 2.2.12). If P is finitely generated and R is analytic and strongly noetherian, or finitely generated over a noetherian ring of definition, then so is R⟨P⟩, Spa(R⟨P⟩,R⁺⟨P⟩) is étale sheafy, and the formation of Spa(R⟨P⟩,R⁺⟨P⟩)→Spa(R,R⁺) is compatible with rational localisation (Lemma 2.2.13). When it is étale sheafy, Spa(R⟨P⟩,R⁺⟨P⟩) carries the log structure P^log associated with the constant pre-log structure P_X→O_{X_ét}, a↦e^a (Definition 2.2.17, Convention 2.2.18). For a locally noetherian adic space Y with trivial log structure and P finitely generated, gluing over noetherian affinoid opens gives a morphism of log adic spaces Y⟨P⟩→Y (Example 2.2.19); for P toric and Y=Spa(k,k⁺) this is an affinoid toric log adic space, and for P=ℕⁿ it is the unit polydisc Dⁿ with the log structure associated with (a₁,…,aₙ)↦T₁^{a₁}⋯Tₙ^{aₙ} (Examples 2.2.20-2.2.21).

Hypotheses: Lemma 2.2.13 needs P finitely generated and R analytic strongly noetherian or finitely generated over a noetherian ring of definition; the packet's carriers are the analytic case. The tautological map P→R⟨P⟩, a↦e^a, takes values in R⁺⟨P⟩, so it satisfies the integral-image condition of DLLZ charts.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:log-sites/log-adic-space, CrystallineCohomology:CR.5:log-algebra/associated-log, tauceti:TauCeti.Huber.Pair, AdicSpacesPartII:R0/noetherian-type-huber-ring, AdicSpacesPartII:R0/topologically-finite-type-noetherian-type, AdicSpacesPartII:R0/locally-noetherian-adic-space, AdicEtaleGeometry:A1/etale-structure-sheaf.

TauCeti.LogAdic.MonoidAlgebraLog.huberPair [constructor]: not stated; depends on the full geometric constructor.
(R[P],R⁺[P]) with ring of definition R₀[P] and ideal of definition IR₀[P] is a Huber pair, with completion (R⟨P⟩,R⁺⟨P⟩) (Lemma 2.2.11, Remark 2.2.12).

TauCeti.LogAdic.MonoidAlgebraLog.noetherian [compatibility]: not stated; depends on the full geometric constructor.
For finitely generated P, R⟨P⟩ is analytic and strongly noetherian (resp. finitely generated over a noetherian ring of definition) when R is, and Spa(R⟨P⟩,R⁺⟨P⟩) is étale sheafy (Lemma 2.2.13).

TauCeti.LogAdic.MonoidAlgebraLog.logStructure [constructor]: not stated; depends on the full geometric constructor.
The log structure P^log associated with P_X→O_{X_ét}, a↦e^a (Definition 2.2.17).

TauCeti.LogAdic.MonoidAlgebraLog.tautologicalChart [projection]: component above; full contract follows.
P→P^log(X), a↦e^a, with values in R⁺⟨P⟩; it is a chart of P^log.

TauCeti.LogAdic.MonoidAlgebraLog.relative [constructor]: not stated; depends on the full geometric constructor.
Y⟨P⟩→Y for a locally noetherian Y with trivial log structure and finitely generated P, glued over noetherian affinoid opens (Example 2.2.19).

TauCeti.LogAdic.MonoidAlgebraLog.map [functoriality]: component above; full contract follows.
A monoid map u:P→Q induces Y⟨Q⟩→Y⟨P⟩ over Y, compatible with the tautological charts, with identity and composition laws.

TauCeti.LogAdic.MonoidAlgebraLog.rational_localization [compatibility]: not stated; depends on the full geometric constructor.
The formation of Spa(R⟨P⟩,R⁺⟨P⟩)→Spa(R,R⁺) commutes with rational localisation of Spa(R,R⁺) (Lemma 2.2.13).

TauCeti.LogAdic.MonoidAlgebraLog.lift [universal-property]: component above; full contract follows.
For a log adic space X over Y, morphisms X→Y⟨P⟩ of log adic spaces over Y correspond to monoid maps P→M_X(X) whose composite with α lands in O⁺_{X_ét}(X) (Remarks 2.3.2-2.3.3).

TauCeti.LogAdic.MonoidAlgebraLog.nat_polydisc [computation]: component example above; full test follows.
For P=ℕⁿ and (R,R⁺)=(k,k°), Spa(k⟨P⟩,k°⟨P⟩) is the unit polydisc Dⁿ and P^log is the log structure associated with (a₁,…,aₙ)↦T₁^{a₁}⋯Tₙ^{aₙ}.

TauCeti.LogAdic.MonoidAlgebraLog.int_circle [degenerate]: component example above; full test follows.
For P=ℤ, Spa(k⟨P⟩,k°⟨P⟩) is the circle |T|=1 and P^log is the trivial log structure, because the image of P consists of units.

TauCeti.LogAdic.MonoidAlgebraLog.zero_monoid [degenerate]: component example above; full test follows.
For P=0, Y⟨P⟩→Y is the identity of Y with the trivial log structure.

TauCeti.LogAdic.MonoidAlgebraLog.origin_nontrivial [non-example]: component example above; full test follows.
For P=ℕ, the point T=0 lies in Spa(k⟨ℕ⟩,k°⟨ℕ⟩) and has characteristic ℕ, so P^log is not trivial and Spa(k⟨ℕ⟩,k°⟨ℕ⟩) is not the punctured disc.

Sources: DLLZ-adic Lemma 2.2.11 and Remark 2.2.12, pp. 9-10; DLLZ-adic Lemma 2.2.13, p. 10; DLLZ-adic Definition 2.2.17 and Convention 2.2.18, p. 11; DLLZ-adic Examples 2.2.19-2.2.21, pp. 11-12.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:log-sites/integral-adic-chart
TauCeti.LogAdic.IntegralChart: component above; full geometric signature not stated.

Let (X,M_X,α) be a log adic space and P a monoid with constant sheaf P_X on X_ét. A (global) chart of X modeled on P is a monoid-sheaf map θ:P_X→M_X such that α(θ(P_X))⊂O⁺_{X_ét} and the induced map ᵃP_X→M_X from the log structure associated with α∘θ is an isomorphism; it is finitely generated (fine, fs) when P is. Equivalently θ is a monoid map P→M_X(X) whose composite with α lands in O⁺_{X_ét}(X); when X lies over Spa(R,R⁺), P is finitely generated and Spa(R⟨P⟩,R⁺⟨P⟩) is étale sheafy (e.g. R strongly noetherian, toric-log-adic-space), this is a morphism X→Spa(R⟨P⟩,R⁺⟨P⟩) of log adic spaces, and θ is a chart exactly when that morphism is strict (Remarks 2.3.2-2.3.3). At each geometric point x̄, θ induces P/(α∘θ)⁻¹(O×_{X_ét,x̄})≃M̄_{X,x̄} (Remark 2.3.4), so P_X→M̄_X is surjective; a chart need not be sharp or equal to the characteristic monoid. X is coherent (fine, fs) if it étale locally admits charts modeled on finitely generated (fine, fs) monoids (Definition 2.3.5); a locally noetherian coherent X is fine (fs) exactly when it is integral (saturated) (Proposition 2.3.11). A chart of a morphism f:Y→X consists of charts θ_X:P_X→M_X, θ_Y:Q_Y→M_Y and u:P→Q with f♯∘f⁻¹(θ_X)=θ_Y∘u_Y (Definition 2.3.19); a fine (fs) log adic space admits, étale locally at x̄, a chart modeled on M̄_{X,x̄} (Proposition 2.3.13), and morphisms of fine (fs) log adic spaces étale locally admit fine (fs) charts (Proposition 2.3.22).

Hypotheses: The integral-image condition α(θ(P_X))⊂O⁺_{X_ét} is part of DLLZ's definition and has no counterpart for log schemes (CR.5 log-chart); it is stated against the plus sheaf of X. Proposition 2.3.11 needs X locally noetherian and coherent; Proposition 2.3.13 needs X fine; Propositions 2.3.21-2.3.22 need coherent, resp. fine or fs, source and target.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:log-sites/log-adic-space, HodgeTateAndCanonicalSubgroups:T6:log-sites/toric-log-adic-space, CrystallineCohomology:CR.5:log-algebra/log-chart, tauceti:TauCeti.Huber.Pair, AdicSpacesPartII:R0/locally-noetherian-adic-space, AdicSpacesPartII:R0/topologically-finite-type-noetherian-type, AdicSpacesPartII:R0/noetherian-type-stably-sheafy, CrystallineCohomology:CR.5:log-algebra.

TauCeti.LogAdic.IntegralChart [constructor]: component above; full contract follows.
A monoid map P→M(U), its factorization through O⁺(U), and the associated-log isomorphism.

TauCeti.LogAdic.IntegralChart.mem_plus [projection]: component above; full contract follows.
Every structural image of a chart element belongs to the designated plus ring.

TauCeti.LogAdic.IntegralChart.characteristic [compatibility]: not stated; depends on the full geometric constructor.
Its stalk characteristic is the quotient by the face of elements with unit structural image.

TauCeti.LogAdic.IntegralChart.pullback [functoriality]: not stated; depends on the full geometric constructor.
Adic pullback gives the compatible integral chart on the pullback log structure.

TauCeti.LogAdic.IntegralChart.equivStrictToric [characterisation]: not stated; depends on the full geometric constructor.
For finitely generated P and X over Spa(R,R⁺) with Spa(R⟨P⟩,R⁺⟨P⟩) étale sheafy, charts of X modeled on P correspond to strict morphisms X→Spa(R⟨P⟩,R⁺⟨P⟩) of log adic spaces (Remark 2.3.2); over a locally noetherian Y, to strict morphisms X→Y⟨P⟩ (Remark 2.3.3).

TauCeti.LogAdic.IsFsLogAdic [characterisation]: not stated; depends on the full geometric constructor.
X is coherent, fine or fs when it étale locally admits charts modeled on finitely generated, fine or fs monoids (Definition 2.3.5); for locally noetherian coherent X, fine iff integral and fs iff saturated (Proposition 2.3.11).

TauCeti.LogAdic.IntegralChart.exists_characteristic [other]: not stated; depends on the full geometric constructor.
A fine (fs) log adic space admits, étale locally at each geometric point x̄, a chart modeled on M̄_{X,x̄} (Proposition 2.3.13).

TauCeti.LogAdic.IntegralChart.Hom [constructor]: component above; full contract follows.
A chart of a morphism f: charts P_X→M_X and Q_Y→M_Y with u:P→Q making the square with f♯ commute (Definition 2.3.19); morphisms of fine (fs) log adic spaces admit such fine (fs) charts étale locally (Proposition 2.3.22).

TauCeti.LogAdic.IntegralChart.unit_chart [degenerate]: not stated as an example; needs the full geometric constructor.
A chart with all images units has zero characteristic.

TauCeti.LogAdic.IntegralChart.coordinate_axis [computation]: not stated as an example; needs the full geometric constructor.
For the chart N→k⟨T⟩, 1↦T, the characteristic at T=0 is N and off T=0 is zero.

TauCeti.LogAdic.IntegralChart.reject_inverse_p [non-example]: component example above; full test follows.
For Spa(Q_p,Z_p), the prelog map N→Q_p, 1↦p⁻¹, fails the chart integral-image condition even though logification is trivial.

Sources: DLLZ-adic Definition 2.3.1, p. 13; DLLZ-adic §2.3 introduction, p. 12; Remarks 2.3.2-2.3.4, p. 13; DLLZ-adic Definition 2.3.5, p. 13; DLLZ-adic Proposition 2.3.11, p. 15; DLLZ-adic Definition 2.3.19, p. 17; Propositions 2.3.13 and 2.3.22, pp. 16-18.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:log-sites/divisorial-analytic-log
TauCeti.LogAdic.DivisorialLog: not stated; needs the geometric carriers listed below.

Let X be a normal rigid analytic variety over a nonarchimedean field k, viewed as a locally noetherian adic space, D⊂X an effective Cartier divisor and j:U=X−D→X. Setting M_X(V)={f∈O_{X_ét}(V): f is invertible on the preimage of U}, that is M_X=O_{X_ét}∩j_*O×_{U_ét}, with α the inclusion, makes X a locally noetherian fs log adic space (normality is used for saturation), and U is the maximal open subspace on which M_X is trivial (Example 2.3.16). If X is smooth and D is a (reduced) normal crossings divisor, i.e. étale locally, equivalently analytic locally after a finite separable extension of k, (X,D)≅(S×D^m,S×{T₁⋯T_m=0}) with S smooth, then M_X is the pullback of the log structure of D^m (toric-log-adic-space), so étale locally ℕ^m→M_X, e_i↦T_i, is an fs chart whose images lie in O⁺, and at a geometric point lying on exactly s local branches M̄_{X,x̄}≅ℕ^s (Example 2.3.17). Étale locally X then admits a smooth toric chart X→Dⁿ, n=dim X, pulling {T₁⋯T_m=0} back to D, so X is log smooth over k (Example 3.1.13). For a smooth scheme with a strict normal crossings divisor, the same construction on the analytification (a smooth pair of AdicSpacesPartII R4) agrees with the logified pullback of the algebraic divisorial log structure, local algebraic equations being rescaled by constants of small absolute value where they are not power-bounded.

Hypotheses: X normal over any nonarchimedean field k for Example 2.3.16 (no characteristic assumption); X smooth and D a normal crossings divisor in DLLZ's étale-local sense for the chart statements (Example 2.3.17). A smooth pair of AdicSpacesPartII:R4/smooth-pair is the strict special case in which the charts exist analytic-locally over k itself. Chart functions must lie in O⁺ (integral-adic-chart): on S×D^m the coordinates T_i do; pulled-back algebraic equations may need rescaling by a constant, which changes neither M_X nor its characteristic.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:log-sites/integral-adic-chart, HodgeTateAndCanonicalSubgroups:T6:log-sites/toric-log-adic-space, HodgeTateAndCanonicalSubgroups:T6:log-sites/log-smooth-chart-criterion, CrystallineCohomology:CR.5:log-algebra/divisorial-log, AdicSpacesPartII:R4/smooth-pair, AdicSpacesPartII:R4/analytification-of-smooth-pair, AdicSpacesPartII:R1/analytification-functor, AdicSpacesPartII:R0/smooth-morphism.

TauCeti.LogAdic.DivisorialLog [constructor]: not stated; depends on the full geometric constructor.
The log structure O_X∩j_*O_U× associated to the specified boundary complement.

TauCeti.LogAdic.DivisorialLog.restrict_open [compatibility]: not stated; depends on the full geometric constructor.
Restriction to U is the trivial log structure.

TauCeti.LogAdic.DivisorialLog.chart [characterisation]: not stated; depends on the full geometric constructor.
Étale locally on a normal crossings chart S×D^m, ℕ^m→M_X, e_i↦T_i, is an fs chart with images in O⁺; the characteristic at a point on exactly s branches is ℕ^s.

TauCeti.LogAdic.DivisorialLog.analytification [compatibility]: not stated; depends on the full geometric constructor.
For an algebraic smooth pair with strict normal crossings boundary, the logified pullback of the algebraic divisorial log structure to the analytification agrees with the analytic divisorial log structure; charts use local equations rescaled into O⁺.

TauCeti.LogAdic.DivisorialLog.trivial_locus [characterisation]: not stated; depends on the full geometric constructor.
U=X−D is the maximal open subspace on which M_X is the trivial log structure (Example 2.3.16).

TauCeti.LogAdic.DivisorialLog.smoothToricChart [compatibility]: not stated; depends on the full geometric constructor.
Étale locally X has a strictly étale X→Dⁿ, n=dim X, composed of rational localisations and finite étale maps, pulling {T₁⋯T_m=0} back to D (Example 3.1.13); hence X is log smooth over k.

TauCeti.LogAdic.DivisorialLog.empty_boundary [degenerate]: not stated as an example; needs the full geometric constructor.
If D is empty, M=O_X×.

TauCeti.LogAdic.DivisorialLog.double_intersection [computation]: not stated as an example; needs the full geometric constructor.
At the crossing T₁=T₂=0, characteristic monoid is N², while at its generic branches it is N.

TauCeti.LogAdic.DivisorialLog.not_all_functions [non-example]: not stated as an example; needs the full geometric constructor.
At a point of U, a function vanishing at that point is not a section of M; M is not all of O_X.

TauCeti.LogAdic.DivisorialLog.unscaled_equation [non-example]: not stated as an example; needs the full geometric constructor.
On the closed unit disc over k with D={T=0} and c∈k with |c|>1, the map ℕ→M_X, 1↦cT, logifies to M_X but is not a chart because cT∉O⁺; the map 1↦T is a chart.

Sources: DLLZ-adic Example 2.3.16, p. 16; DLLZ-adic Example 2.3.17, pp. 16-17; DLLZ-adic Example 2.3.17, p. 17; DLLZ-adic Example 3.1.13, p. 25.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:log-sites/saturated-adic-products
TauCeti.LogAdic.FsAdicPullback: not stated; needs the geometric carriers listed below.

(1) The inclusion of locally noetherian (resp. noetherian) fine log adic spaces into coherent ones has a right adjoint X↦X^int whose underlying map X^int→X is a closed immersion, and the inclusion of fs into fine ones has a right adjoint X↦X^sat whose underlying map is finite and surjective; X^sat:=(X^int)^sat is right adjoint to the inclusion of fs into coherent log adic spaces (Proposition 2.3.23, Remark 2.3.24). Both functors preserve strict finite and strict étale morphisms, and for X over a locally noetherian fs Y with a global chart modeled on a finitely generated (fine) P, X^int≅X×_{Y⟨P⟩}Y⟨P^int⟩ (X^sat≅X×_{Y⟨P⟩}Y⟨P^sat⟩) (Remarks 2.3.25-2.3.26). (2) If the fibre product W=Y×_X Z of the underlying locally noetherian adic spaces exists (for instance when Y→X is lft), W with the log structure associated with pr_Y⁻¹M_Y⊕_{pr_X⁻¹M_X}pr_Z⁻¹M_Z is the fibre product of log adic spaces, coherent when X, Y, Z are; the fine and fs fibre products are W^int and W^sat, modeled on (Q⊕_P R)^int and (Q⊕_P R)^sat for charts P→Q, P→R (Proposition 2.3.27, Remark 2.3.29). Their underlying adic spaces can differ from W (Remark 2.3.30); fibre products of fs log adic spaces are taken in the fs category (Convention 2.3.31). (3) Four-point lemma: if f:Y→X and g:Z→X are lft morphisms of locally noetherian fs log adic spaces and f is exact, then for y∈Y and z∈Z over the same x∈X some w∈Y×_X Z maps to y and to z (Proposition 2.3.32, via Lemma 2.3.33).

Hypotheses: Locally noetherian carriers throughout; integralisation is defined on coherent, saturation on fine log adic spaces. Fibre products exist only when the underlying adic fibre product exists (e.g. one map lft); the four-point lemma needs both maps lft and f exact.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:log-sites/integral-adic-chart, HodgeTateAndCanonicalSubgroups:T6:log-sites/toric-log-adic-space, CrystallineCohomology:CR.5:log-algebra/integral-log-fiber-product, CrystallineCohomology:CR.5:log-algebra/saturated-monoid, AdicSpacesPartII:R0/fibre-products-existence, AdicSpacesPartII:R0/fibre-product-points, AdicSpacesPartII:R0/finite-morphism, AdicSpacesPartII:R3, AdicSpacesPartII:R0/closed-adic-subspaces-and-embeddings.

TauCeti.LogAdic.FsAdicPullback [constructor]: not stated; depends on the full geometric constructor.
The analytic fs fibre product, with projections and compatibility over the base.

TauCeti.LogAdic.FsAdicPullback.lift [universal-property]: not stated; depends on the full geometric constructor.
Compatible fs log maps have a unique map to the fs pullback.

TauCeti.LogAdic.FsAdicPullback.strict_base_change [compatibility]: not stated; depends on the full geometric constructor.
Under strict base change the induced log structure is the ordinary pullback structure.

TauCeti.LogAdic.FsAdicPullback.symmetry [equivalence]: not stated; depends on the full geometric constructor.
Interchanging factors gives the canonical involutive isomorphism.

TauCeti.LogAdic.FsAdicPullback.integralization [universal-property]: not stated; depends on the full geometric constructor.
X↦X^int is right adjoint to the inclusion of locally noetherian fine into coherent log adic spaces, with X^int→X a closed immersion (Proposition 2.3.23(1)).

TauCeti.LogAdic.FsAdicPullback.saturation [universal-property]: not stated; depends on the full geometric constructor.
X↦X^sat is right adjoint to the inclusion of locally noetherian fs into fine (and, via (X^int)^sat, coherent) log adic spaces, with X^sat→X finite and surjective (Proposition 2.3.23(2), Remark 2.3.24).

TauCeti.LogAdic.FsAdicPullback.chart [compatibility]: not stated; depends on the full geometric constructor.
For fs charts P→Q, P→R of Y→X, Z→X, the fs product is modeled on (Q⊕_P R)^sat (Remark 2.3.29); separately, for a locally noetherian W over a locally noetherian fs T with a global chart modeled on a fine P, W^sat≅W×_{T⟨P⟩}T⟨P^sat⟩ as adic spaces (Remark 2.3.26).

TauCeti.LogAdic.FsAdicPullback.exists_point_of_exact [relation]: not stated; depends on the full geometric constructor.
For lft f, g with f exact, points y, z over a common x lift to a point of the fs product (Proposition 2.3.32).

TauCeti.LogAdic.FsAdicPullback.identity [degenerate]: not stated as an example; needs the full geometric constructor.
Y×_X X≃Y as fs log adic spaces.

TauCeti.LogAdic.FsAdicPullback.root_double [computation]: not stated as an example; needs the full geometric constructor.
For X the closed unit disc over k with chart ℕ (1↦T), Y=Spa(k⟨U⟩) with Uⁿ=T and chart ℕ→ℕ multiplication by n, where n is invertible in k and μ_n⊂k: (ℕ⊕_ℕℕ)^sat≅ℕ⊕ℤ/n, so the fs product Y×_X Y is the disjoint union over ζ∈μ_n of copies of Y (V=ζU), whereas the ordinary product Spa(k⟨U,V⟩/(Uⁿ−Vⁿ)) is connected.

TauCeti.LogAdic.FsAdicPullback.mapping_property [characterisation]: not stated as an example; needs the full geometric constructor.
Two morphisms from an fs test space coincide if their two projection maps coincide.

Sources: DLLZ-adic Proposition 2.3.23(1)-(2), p. 18; DLLZ-adic Proposition 2.3.27(2), p. 19; DLLZ-adic Remark 2.3.30, p. 20; DLLZ-adic Proposition 2.3.32 and Lemma 2.3.33, p. 20.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:log-sites/log-smooth-chart-criterion
TauCeti.LogAdic.log_smooth_chart_criterion: not stated; needs the geometric carriers listed below.

Let f:Y→X be a morphism of locally noetherian fs log adic spaces. f is log smooth (resp. log étale) if étale locally on Y and X it has an fs chart u:P→Q such that ker(u^gp) and the torsion part of coker(u^gp) (resp. ker(u^gp) and coker(u^gp)) are finite of order invertible in O_X, and the induced morphism Y→X×_{X⟨P⟩}X⟨Q⟩ is étale on underlying adic spaces (Definition 3.1.1); such f is lft, so fs fibre products along it exist (Remark 3.1.2). If X has a global fs chart P, then étale locally on Y and X, f has an injective fs chart P→Q satisfying these conditions, with Q torsion-free when P is (Proposition 3.1.4). Log smooth (log étale) morphisms are stable under fs base change by arbitrary morphisms of locally noetherian fs log adic spaces and under composition (Propositions 3.1.3, 3.1.6), and a strict log smooth (log étale) morphism is smooth (étale) on underlying adic spaces (Proposition 3.1.7). If X is log smooth over an affinoid field Spa(k,k⁺) with trivial log structure, then étale locally X has a toric chart, a strictly étale X→Spa(k⟨P⟩,k⁺⟨P⟩) with P a sharp fs monoid that is a composition of rational localisations and finite étale maps; if moreover X is smooth one may take P=ℕⁿ, a smooth toric chart X→Dⁿ (Proposition 3.1.10, Corollary 3.1.11, Definition 3.1.12).

Hypotheses: The index is invertible in O_X, not necessarily O_X⁺. Log smoothness does not imply ordinary smoothness without strictness. Toric charts need X log smooth over an affinoid field with the trivial log structure on the base.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:log-sites/saturated-adic-products, HodgeTateAndCanonicalSubgroups:T6:log-sites/integral-adic-chart, HodgeTateAndCanonicalSubgroups:T6:log-sites/toric-log-adic-space, CrystallineCohomology:CR.5:log-algebra/log-smooth-chart-criterion, AdicEtaleGeometry:A1/etale-site, AdicSpacesPartII:R0/smooth-morphism, AdicSpacesPartII:R0/differentials-unramified-smooth-etale, AdicSpacesPartII:R0/restricted-power-series-smooth, AdicSpacesPartII:R0/smooth-etale-base-change, AdicSpacesPartII:R0/etale-smooth-composition.

Sources: DLLZ-adic Definition 3.1.1 and Remark 3.1.2, p. 21; DLLZ-adic Propositions 3.1.3 and 3.1.6, pp. 21-23; DLLZ-adic Proposition 3.1.4, pp. 21-23; DLLZ-adic Proposition 3.1.7, p. 24; DLLZ-adic Proposition 3.1.10, Corollary 3.1.11 and Definition 3.1.12, pp. 24-25.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:log-sites/continuous-log-derivation
TauCeti.LogAdic.ContinuousLogDerivation: component above; full geometric signature not stated.

A pre-log Huber ring (A,M,α) is a Huber ring A (not necessarily complete), a monoid M and a monoid map α:M→(A,·); it is a log Huber ring if A is complete and α⁻¹(A×)→A× is an isomorphism; a homomorphism (A,M,α)→(B,N,β) is a continuous ring map f with a monoid map f♯:M→N such that β∘f♯=f∘α (Definition 3.2.1). For such a homomorphism and a complete topological B-module L, an (A,M,α)-derivation of (B,N,β) into L is a pair (d,δ): d:B→L is a continuous A-linear derivation and δ:N→(L,+) is a monoid map with δ(f♯(m))=0 and d(β(n))=β(n)·δ(n) for all m∈M, n∈N (Definition 3.2.2). These form a B-module Der^log_A(B,L); for trivial log structures M=α⁻¹(A×), N=β⁻¹(B×) it is the module Der_A(B,L) of continuous A-derivations. Each pair extends to (B,ᵃN,β) without changing Der^log_A(B,L), and δ extends uniquely to a group map (ᵃN)^gp→L (Remark 3.2.3).

Hypotheses: L is complete. The packet's carriers take L complete and Hausdorff, which loses nothing because the representing module of continuous-log-differentials is Hausdorff; continuous derivations are not replaced by algebraic derivations.

Suppliers and local inputs: CrystallineCohomology:CR.5:log-algebra/prelog-ring, CrystallineCohomology:CR.5:log-algebra/associated-log, mathlib:Derivation, tauceti:TauCeti.Huber.Pair, AdicSpacesPartII:R0/continuous-differentials.

TauCeti.LogAdic.ContinuousLogDerivation [constructor]: component above; full contract follows.
Bundle a continuous derivation and monoid-to-additive map satisfying the relative-zero and compatibility equations.

TauCeti.LogAdic.ContinuousLogDerivation.ext [extensionality]: component above; full contract follows.
Equality of d and δ gives equality of the log derivation.

TauCeti.LogAdic.ContinuousLogDerivation.map_structural [relation]: component above; full contract follows.
d(βn)=βn·δ(n).

TauCeti.LogAdic.ContinuousLogDerivation.postcompose [functoriality]: component above; full contract follows.
A continuous B-linear map L→L′ induces a log derivation to L′; identity and composite maps agree.

TauCeti.LogAdic.ContinuousLogDerivation.instModule [instance]: not stated; depends on the full geometric constructor.
Der^log_A(B,L) is a B-module, with operations computed componentwise on d and δ (Definition 3.2.2).

TauCeti.LogAdic.ContinuousLogDerivation.toDerivation [projection]: component above; full contract follows.
(d,δ)↦d, the forgetful B-linear map to continuous A-derivations; it is bijective when M=α⁻¹(A×) and N=β⁻¹(B×).

TauCeti.LogAdic.ContinuousLogDerivation.deltaGp [projection]: component above; full contract follows.
The unique group map (ᵃN)^gp→L extending δ, which vanishes on the image of M^gp (Remark 3.2.3).

TauCeti.LogAdic.ContinuousLogDerivation.logificationEquiv [equivalence]: not stated; depends on the full geometric constructor.
Der^log_A(B,L) is unchanged when (B,N,β) is replaced by its logification (B,ᵃN,β) (Remark 3.2.3).

TauCeti.LogAdic.ContinuousLogDerivation.zero [degenerate]: component example above; full test follows.
The pair of zero maps is a continuous log derivation.

TauCeti.LogAdic.ContinuousLogDerivation.unit_formula [computation]: component example above; full test follows.
For a unit β(n), δ(n)=β(n)⁻¹d(β(n)).

TauCeti.LogAdic.ContinuousLogDerivation.boundary_value [non-example]: component example above; full test follows.
For B=k⟨T⟩ with N=ℕ, β(1)=T, over k with the pre-log structure given by the zero monoid M=0 (whose logification is the trivial log structure; with M=k× no compatible f♯:k×→ℕ exists): into L=B, d=T·d/dT gives d(T)=T and forces δ(1)=1; into L=B/(T)=k, the pair d=0, δ(1)=1 is a log derivation, so d(T)=0 at T=0 does not force δ(1)=0 and δ is not determined by d.

TauCeti.LogAdic.ContinuousLogDerivation.trivial_log [characterisation]: component example above; full test follows.
If M=α⁻¹(A×) and N=β⁻¹(B×), every continuous A-derivation d:B→L extends uniquely to a log derivation, by δ(n)=β(n)⁻¹d(β(n)).

Sources: DLLZ-adic Definition 3.2.1, p. 26; DLLZ-adic Definition 3.2.2, p. 26; DLLZ-adic Remark 3.2.3, p. 26.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:log-sites/continuous-log-differentials
TauCeti.LogAdic.ContinuousLogDifferentials: not stated; needs the geometric carriers listed below.

Let f:(A,M,α)→(B,N,β) be a tft homomorphism of pre-log Huber rings: A and B complete, A→B topologically of finite type, and N^gp/((f♯M)^gp·β⁻¹(B×)) finitely generated (Definition 3.2.4). Let I⊂(B⊗̂_A B)[N] be the ideal generated by e^{f♯(m)}−1 and (β(n)⊗1)−(1⊗β(n))e^n, J the kernel of ((B⊗̂_A B)[N])/I→B (b₁⊗b₂↦b₁b₂, e^n↦1), and Ω^log_{B/A}:=J/J² with d(b)=class of b⊗1−1⊗b and δ(n)=class of e^n−1. Then Ω^log_{B/A}≅(Ω_{B/A}⊕(B⊗_ℤN^gp))/R, where Ω_{B/A} is the module of continuous differentials and R is generated by (dβ(n),−β(n)⊗n) and (0,1⊗f♯(m)) ((3.2.7)-(3.2.8)); it is a finite B-module, complete for its natural topology, d is continuous, and (Ω^log_{B/A},d,δ) is universal among (A,M,α)-derivations of (B,N,β) into complete topological B-modules (Proposition 3.2.9). For a strict homomorphism of log Huber rings, Der^log_A(B,L)→Der_A(B,L) is bijective and Ω_{B/A}≅Ω^log_{B/A} (Lemma 3.2.10).

Hypotheses: f is tft, including the finite generation of N^gp/((f♯M)^gp·β⁻¹(B×)); the unrestricted algebraic Kähler module is not the analytic carrier. A is of noetherian type (Huber's standing assumption (1.1.1)), as presupposed by DLLZ's use of Huber's continuous differentials (1.6.2) and needed for finite B-modules to be complete; all DLLZ applications are locally noetherian.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:log-sites/continuous-log-derivation, CrystallineCohomology:CR.5/log-differentials, AdicSpacesPartII:R0/continuous-differentials, AdicSpacesPartII:R0/completed-tensor-product, AdicSpacesPartII:R0/first-fundamental-sequence.

TauCeti.LogAdic.ContinuousLogDifferentials [constructor]: not stated; depends on the full geometric constructor.
The complete representing module with d and dlog.

TauCeti.LogAdic.ContinuousLogDifferentials.lift [universal-property]: not stated; depends on the full geometric constructor.
Continuous B-linear maps out correspond bijectively to continuous log derivations.

TauCeti.LogAdic.ContinuousLogDifferentials.lift_unique [extensionality]: not stated; depends on the full geometric constructor.
A map is determined by values on d(b) and dlog(n).

TauCeti.LogAdic.ContinuousLogDifferentials.strict [compatibility]: not stated; depends on the full geometric constructor.
For a strict map the module identifies with the imported continuous Ω¹_{B/A}.

TauCeti.LogAdic.ContinuousLogDifferentials.presentation [characterisation]: not stated; depends on the full geometric constructor.
Ω^log_{B/A}≅(Ω_{B/A}⊕(B⊗_ℤN^gp))/R with R generated by (dβ(n),−β(n)⊗n) and (0,1⊗f♯(m)) ((3.2.7)-(3.2.8)).

TauCeti.LogAdic.ContinuousLogDifferentials.finite [instance]: not stated; depends on the full geometric constructor.
Ω^log_{B/A} is a finite B-module, complete and Hausdorff for its natural topology, and d is continuous.

TauCeti.LogAdic.ContinuousLogDifferentials.dlog_unit [simp]: not stated; depends on the full geometric constructor.
If β(n) is a unit then δ(n)=β(n)⁻¹·d(β(n)); δ(f♯(m))=0.

TauCeti.LogAdic.ContinuousLogDifferentials.exact_sequence [relation]: not stated; depends on the full geometric constructor.
For tft (A,M)→(B,N)→(C,O), C⊗_BΩ^log_{B/A}→Ω^log_{C/A}→Ω^log_{C/B}→0 is exact; it is split exact on the left when B→C is formally log smooth for first-order log thickenings, Ω^log_{C/B}=0 when B→C is formally log unramified, and the converses hold when C is formally log smooth over A (Theorem 3.2.18, Definitions 3.2.11 and 3.2.14).

TauCeti.LogAdic.ContinuousLogDifferentials.monoidAlgebra [example]: not stated; depends on the full geometric constructor.
For fine monoids u:P→Q with ker(u^gp) and the torsion of coker(u^gp) (resp. coker(u^gp)) finite of order invertible in R, R⟨Q⟩ is formally log smooth (resp. log étale) over R⟨P⟩ and δ induces Ω^log_{R⟨Q⟩/R⟨P⟩}≅R⟨Q⟩⊗_ℤ(Q^gp/u^gp(P^gp)), a finite free R⟨Q⟩-module because the torsion of the cokernel has order invertible in R (Proposition 3.2.25).

TauCeti.LogAdic.ContinuousLogDifferentials.identity [degenerate]: not stated as an example; needs the full geometric constructor.
For the identity log Huber map the module is zero.

TauCeti.LogAdic.ContinuousLogDifferentials.toric_rank [computation]: not stated as an example; needs the full geometric constructor.
Over k, Ω¹_log of k⟨T₁,…,T_r⟩ with coordinate log structure is free on dlog T_i.

TauCeti.LogAdic.ContinuousLogDifferentials.coordinate_relation [characterisation]: not stated as an example; needs the full geometric constructor.
In that module dT_i=T_i dlog T_i; imposing dlog T_i=0 at T_i=0 is incorrect.

Sources: DLLZ-adic Definition 3.2.4, p. 26; DLLZ-adic (3.2.7)-(3.2.8), p. 27; DLLZ-adic Proposition 3.2.9, p. 27; DLLZ-adic Lemma 3.2.10, p. 28.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:log-sites/log-differential-descent
TauCeti.LogAdic.log_differential_descent: not stated; needs the geometric carriers listed below.

For an lft morphism f:Y→X of locally noetherian coherent log adic spaces, the modules Ω^log_{B/A} of étale affinoid charts of f by noetherian affinoids inducing tft maps of log Huber rings glue, by étale descent of coherent sheaves, to a coherent O_{Y_ét}-module Ω^log_{Y/X} with a derivation (d_{Y/X},δ_{Y/X}), δ_{Y/X}:M_Y→Ω^log_{Y/X}, that is universal among derivations of Y over X into sheaves of complete topological O_{Y_ét}-modules and restricts to Ω^log_{V/U} on affinoid V→U in Y_ét, X_ét (Constructions 3.3.2-3.3.4, Lemmas 3.3.3 and 3.3.5). (1) For a cartesian square in the category of locally noetherian coherent (resp. fine, resp. fs) log adic spaces with Y→X lft and base change Y′→X′, the pullback of Ω^log_{Y/X} to Y′ is Ω^log_{Y′/X′} (Proposition 3.3.7). (2) For lft Y→X→S of locally noetherian coherent log adic spaces, f*Ω^log_{X/S}→Ω^log_{Y/S}→Ω^log_{Y/X}→0 is exact (Theorem 3.3.17(1)). (3) For f log smooth between locally noetherian fs log adic spaces, f*Ω^log_{X/S}→Ω^log_{Y/S} is injective and Ω^log_{Y/X} is locally free of rank equal to the rank of Q^gp/u^gp(P^gp) for a chart u as in Definition 3.1.1; for f log étale, f*Ω^log_{X/S}≅Ω^log_{Y/S} and Ω^log_{Y/X}=0; if X, Y, S are fs and g∘f is log smooth, the converses hold; if g is log étale, Ω^log_{Y/S}≅Ω^log_{Y/X} and f is log smooth (log étale) iff g∘f is (Theorem 3.3.17(2)-(5)). (4) An lft morphism of locally noetherian fs log adic spaces is formally log smooth (formally log étale), i.e. has étale-locally at least one (exactly one) lift along strict first-order log thickenings (Definitions 3.3.8, 3.3.10), exactly when it is log smooth (log étale) in the chart sense (Proposition 3.3.16).

Hypotheses: Ω^log_{Y/X} is defined for lft morphisms of locally noetherian coherent log adic spaces; parts (3)-(4) need fs log adic spaces, and fs products and pullbacks are the fs fibre products of saturated-adic-products. The injection in (3) is not asserted split as a map of sheaves; DLLZ prove splitting at the ring level (Theorem 3.2.18(2)), and local splitting follows from local freeness of Ω^log_{Y/X}.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:log-sites/continuous-log-differentials, HodgeTateAndCanonicalSubgroups:T6:log-sites/log-smooth-chart-criterion, HodgeTateAndCanonicalSubgroups:T6:log-sites/saturated-adic-products, AdicSpacesPartII:R3/coherent-sheaf, AdicSpacesPartII:R3/coherent-sheaf-operations, AdicSpacesPartII:R3/sheaf-of-continuous-differentials, AdicSpacesPartII:R3, AdicSpacesPartII:R3/tate-kiehl-affinoid, AdicSpacesPartII:R3/locally-free-sheaf.

Sources: DLLZ-adic Constructions 3.3.2-3.3.4 and Lemma 3.3.5, pp. 34-35; DLLZ-adic Proposition 3.3.7, pp. 35-36; DLLZ-adic Proposition 3.3.16, p. 38; DLLZ-adic Theorem 3.3.17, pp. 39-40.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:log-sites/analytic-log-de-rham
TauCeti.LogAdic.AnalyticLogDR: component above; full geometric signature not stated.

Let X→S be a log smooth morphism of locally noetherian fs log adic spaces. Then Ω^log_{X/S} is locally free of finite rank and Ω^{log,a}_{X/S}:=∧^aΩ^log_{X/S} (DLLZ-adic Definition 3.3.19); d extends to a graded differential on Ω^{log,•}_{X/S} with d(δ(m))=0, which is the ordinary continuous de Rham complex for trivial log structures. For X log smooth over k, a log connection on a coherent O_X-module E is a k-linear map ∇:E→E⊗_{O_X}Ω^log_X satisfying the Leibniz rule; it is integrable if ∇²=0, and then DR_log(E)=(E⊗_{O_X}Ω^{log,•}_X,∇) is the log de Rham complex, with log de Rham cohomology H^i(X,DR_log(E)) (DLLZ-RH Definition 3.1.7(4)); the S-linear relative version is defined in the same way. If X is a smooth rigid analytic variety over k with a normal crossings divisor D (DLLZ-RH Example 2.1.2), F a vector bundle with an integrable log connection ∇ and Z an irreducible component of D, then after shrinking X so that Z is smooth and connected, and enlarging k so that a smooth toric chart has Z={T₁=0}, Res_Z(∇)=∇(T₁∂/∂T₁) mod T₁ is an O_Z-linear endomorphism of F|_Z, independent of the coordinate and compatible with rational localisation (DLLZ-RH (3.4.1)); on forms, contraction with T₁∂/∂T₁ followed by restriction to Z sends dlog T₁ to 1 and dlog T_j (j≠1) and all dT_j to 0. For a morphism h:Y→X of such log adic spaces, E the boundary of Y and m_{WZ} the multiplicity of a component W of E in h⁻¹(Z), Res_W(h*∇)=Σ_{h(W)⊂Z}m_{WZ}·h_{WZ}*Res_Z(∇) (DLLZ-RH Theorem 3.2.3(4) and proof of Corollary 3.5.7).

Hypotheses: DLLZ-RH Definition 3.1.7(4) imposes only k-linearity and the Leibniz rule; continuity of ∇ for coherent E on affinoids follows from the Leibniz rule, the continuity of d and the open mapping property of finite modules, so it is not an extra condition. Unrestricted algebraic modules are not the carrier. Residues are taken along irreducible components of a normal crossings divisor (components via the normalisation of D); for a smooth pair of AdicSpacesPartII:R4 the charts exist over k itself, so k need not be enlarged; R4 imposes no condition on irreducible components (a component may be singular, e.g. an analytically split node), so X is still shrunk to make Z smooth. DLLZ-RH work over p-adic fields in §3, but the residue construction uses only smooth toric charts.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:log-sites/log-differential-descent, HodgeTateAndCanonicalSubgroups:T6:log-sites/divisorial-analytic-log, HodgeTateAndCanonicalSubgroups:T6:log-sites/log-smooth-chart-criterion, CrystallineCohomology:CR.5/log-de-rham, AdicSpacesPartII:R3/sheaf-of-continuous-differentials, AdicSpacesPartII:R3/coherent-sheaf-operations.

TauCeti.LogAdic.AnalyticLogDR [constructor]: component above; full contract follows.
The cohomological continuous coefficient log de Rham complex.

TauCeti.LogAdic.AnalyticLogDR.d_sq [relation]: component above; full contract follows.
Successive differentials compose to zero by integrability.

TauCeti.LogAdic.AnalyticLogDR.residue [projection]: component above; full contract follows.
The residue along an irreducible boundary component Z: Res_Z(∇)=∇(T₁∂/∂T₁) mod T₁ on F|_Z, and on forms the map Ω^log_X|_Z→O_Z, dlog T₁↦1.

TauCeti.LogAdic.AnalyticLogDR.pullback_residue [functoriality]: component above; full contract follows.
Residues transform by the integer boundary-multiplicity matrix: Res_W(h*∇)=Σ_{h(W)⊂Z}m_{WZ}h_{WZ}*Res_Z(∇).

TauCeti.LogAdic.AnalyticLogDR.forms [constructor]: not stated; depends on the full geometric constructor.
Ω^{log,a}_{X/S}=∧^aΩ^log_{X/S} for log smooth X→S, with the graded differential extending d and d(δ(m))=0 (DLLZ-adic Definition 3.3.19).

TauCeti.LogAdic.AnalyticLogDR.leibniz [relation]: not stated; depends on the full geometric constructor.
∇(fe)=f∇(e)+e⊗df for sections f of O_X and e of E, extended to E⊗Ω^{log,•} by the graded Leibniz rule.

TauCeti.LogAdic.AnalyticLogDR.residue_independent [characterisation]: not stated; depends on the full geometric constructor.
Res_Z(∇) does not depend on the local equation T₁ of Z and is compatible with rational localisation (DLLZ-RH §3.4).

TauCeti.LogAdic.AnalyticLogDR.empty_boundary [compatibility]: not stated as an example; needs the full geometric constructor.
With trivial log structure this is the ordinary continuous de Rham complex.

TauCeti.LogAdic.AnalyticLogDR.residue_coordinate [computation]: component example above; full test follows.
res_{T=0}(dlog T)=1, while res(dT)=0.

TauCeti.LogAdic.AnalyticLogDR.root_pullback [computation]: component example above; full test follows.
Under T=S^n, pullback dlog T=n dlog S and its residue is n.

Sources: DLLZ-adic Definition 3.3.19, p. 40; DLLZ-RH Definition 3.1.7(4), p. 24; DLLZ-RH §3.4, (3.4.1), p. 33; DLLZ-RH Theorem 3.2.3(4), p. 25, and proof of Corollary 3.5.7, p. 40.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-etale-morphism
TauCeti.LogAdic.KummerEtale: not stated; needs the geometric carriers listed below.

A morphism f:Y→X of locally noetherian fs log adic spaces is Kummer (resp. finite Kummer) if, étale locally on X and Y (resp. étale locally on X), it admits an fs chart u:P→Q that is a Kummer homomorphism of saturated monoids: u is injective, every element of Q has a positive multiple in u(P), and Q^gp/u^gp(P^gp) is finite. It is Kummer étale (resp. finite Kummer étale) if u can be chosen with |Q^gp/u^gp(P^gp)| invertible in O_Y and with Y→X×_{X⟨P⟩}X⟨Q⟩ étale (resp. finite étale) on underlying adic spaces. Equivalently, f is Kummer étale iff it is log étale and Kummer, iff it is log étale and exact; it is finite Kummer étale iff it is log étale and finite Kummer. For Kummer f every characteristic stalk map M̄_{X,f(y)}→M̄_{Y,y} is a Kummer homomorphism, with group cokernel of order invertible in O_{Y,y} when f is Kummer étale. Kummer étale and finite Kummer étale maps are stable under composition and under fs base change along arbitrary morphisms of locally noetherian fs log adic spaces; if f=g∘h with f and g Kummer étale then h is Kummer étale; Kummer étale maps are open.

Hypotheses: X and Y are locally noetherian fs log adic spaces; base change is the fs fibre product of Proposition 3.1.3 and Remark 3.1.2. The index condition is invertibility of the cokernel order in O_Y (not in O_Y⁺); since O_{X,f(y)}→O_{Y,y} is local this is the same as invertibility in O_X near f(y). The order and the exponent of the cokernel have the same prime divisors.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:log-sites/log-smooth-chart-criterion, CrystallineCohomology:CR.5:log-algebra/kummer-morphism, HodgeTateAndCanonicalSubgroups:T6:log-sites/saturated-adic-products, HodgeTateAndCanonicalSubgroups:T6:log-sites/log-differential-descent.

TauCeti.LogAdic.KummerEtale [constructor]: not stated; depends on the full geometric constructor.
A morphism with étale-local Kummer charts whose cokernel order is invertible in O_Y and whose induced map to X×_{X⟨P⟩}X⟨Q⟩ is étale.

TauCeti.LogAdic.KummerEtale.root_chart [characterisation]: not stated; depends on the full geometric constructor.
Étale locally a Kummer étale map is an étale map to X×_{X⟨P⟩}X⟨Q⟩ for a Kummer chart P→Q, which may be chosen with the prescribed chart P of X and Q sharp when P is (Lemma 4.1.10).

TauCeti.LogAdic.KummerEtale.comp [functoriality]: not stated; depends on the full geometric constructor.
Composition preserves Kummer étaleness and finite Kummer étaleness.

TauCeti.LogAdic.KummerEtale.base_change [functoriality]: not stated; depends on the full geometric constructor.
Fs base change along any morphism of locally noetherian fs log adic spaces preserves Kummer étaleness and finite Kummer étaleness.

TauCeti.LogAdic.KummerEtale.iff_logEtale_exact [characterisation]: not stated; depends on the full geometric constructor.
f is Kummer étale iff log étale and Kummer iff log étale and exact; finite Kummer étale iff log étale and finite Kummer (Lemma 4.1.13).

TauCeti.LogAdic.KummerEtale.stalk_kummer [characterisation]: not stated; depends on the full geometric constructor.
For Kummer f each characteristic stalk map is a Kummer homomorphism of sharp fs monoids, with group cokernel of order invertible in O_{Y,y} when f is Kummer étale (Lemma 4.1.11(2)).

TauCeti.LogAdic.KummerEtale.of_comp [functoriality]: not stated; depends on the full geometric constructor.
If f=g∘h with f and g Kummer étale, then h is Kummer étale (Proposition 4.1.15).

TauCeti.LogAdic.KummerEtale.isOpenMap [compatibility]: not stated; depends on the full geometric constructor.
Kummer étale morphisms are open (Corollary 4.1.9).

TauCeti.LogAdic.KummerEtale.of_strictEtale [constructor]: component above; full contract follows.
A strictly étale morphism is Kummer étale (Remark 4.1.17(1)).

TauCeti.LogAdic.KummerEtale.strict [compatibility]: not stated as an example; needs the full geometric constructor.
A strict Kummer étale map is ordinarily étale.

TauCeti.LogAdic.KummerEtale.p_root_char_zero [computation]: component example above; full test follows.
T=S^p with coordinate logs is Kummer étale over a characteristic-zero p-adic field.

TauCeti.LogAdic.KummerEtale.reject_p_root_char_p [non-example]: component example above; full test follows.
Over characteristic p, the same nontrivial coordinate root map is not log étale because the index p is not invertible in O_X.

Sources: DLLZ-adic Definition 4.1.2(1)–(2), p. 41; DLLZ-adic Lemma 4.1.13, p. 45; DLLZ-adic Proposition 4.1.14, p. 46; DLLZ-adic Proposition 4.1.15, p. 46; Corollary 4.1.9, p. 43.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-root-covers
TauCeti.LogAdic.RootCover: component above; full geometric signature not stated.

Let X be a locally noetherian log adic space with a chart modeled on a torsion-free fs monoid P and n≥1. Put X^{1/n}:=X×_{X⟨P⟩}X⟨(1/n)P⟩ with its chart (1/n)P, where P↪(1/n)P is isomorphic to [n]:P→P. More generally, for a Kummer homomorphism u:P→Q of fs monoids with G:=Q^gp/u^gp(P^gp) finite, Y:=X×_{X⟨P⟩}X⟨Q⟩→X is a finite surjective Kummer cover with an action of G^D_X:=X⟨G⟩ such that G^D_X×_X Y≃Y×_X Y, and for affinoid X the sequence 0→O(X)→O(Y)→O(Y×_X Y) is exact. When G is annihilated by an integer invertible in O_X, Y→X is an open Galois finite Kummer étale cover with group G^D_X, which is the constant group Hom(G,O_X(X)^×) when O_X(X) contains the relevant roots of unity; for X^{1/n} with μ_n⊂O_X(X) this is Hom(((1/n)P)^gp/P^gp,μ_n) acting on root monomials by characters. These Y→X are the standard Kummer (étale) covers. If X is noetherian with a sharp fs chart P, every Kummer étale (resp. finite Kummer étale) Y→X becomes étale (resp. finite étale) after base change to some X^{1/n}, and every Kummer étale covering indexed by a finite set is refined by one whose members V_j are étale over root covers X^{1/n_j}; n may be taken invertible on X when X has at most one positive residue characteristic.

Hypotheses: X locally noetherian with a chart modeled on a torsion-free fs monoid P (Definition 4.1.5); the refinement statements (Lemmas 4.2.5–4.2.6) assume X noetherian with a sharp fs chart. The Galois description needs the order of G invertible in O_X; the constant-group form needs the corresponding roots of unity in O_X(X), otherwise G^D_X is only an étale group object.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-etale-morphism, HodgeTateAndCanonicalSubgroups:T6:log-sites/integral-adic-chart, HodgeTateAndCanonicalSubgroups:T6:log-sites/saturated-adic-products, AdicSpacesPartII:R0/fibre-products-existence, AdicSpacesPartII:R0/finite-algebra-over-affinoid, AdicSpacesPartII:R0/finite-morphism, HodgeTateAndCanonicalSubgroups:T6:log-sites/toric-log-adic-space.

TauCeti.LogAdic.RootCover [constructor]: component above; full contract follows.
The n-th root cover X×_{X⟨P⟩}X⟨(1/n)P⟩ of a torsion-free fs chart, and more generally the standard cover X×_{X⟨P⟩}X⟨Q⟩ of a Kummer chart P→Q.

TauCeti.LogAdic.RootCover.action [structure]: component above; full contract follows.
Hom((1/n)P^gp/P^gp,μ_n) acts by multiplying the root monomial of a by its character.

TauCeti.LogAdic.RootCover.refine [functoriality]: component above; full contract follows.
For n dividing m the m-th root cover maps to the n-th root cover, compatibly under divisibility composition.

TauCeti.LogAdic.RootCover.strictify [compatibility]: not stated; depends on the full geometric constructor.
For X noetherian with a sharp fs chart, every Kummer étale (resp. finite Kummer étale) Y→X becomes étale (resp. finite étale) after base change to some X^{1/n} (Lemma 4.2.5).

TauCeti.LogAdic.RootCover.finite_surjective [compatibility]: component above; full contract follows.
The standard cover is finite and surjective, and finite Kummer étale when the order of G is invertible in O_X (Definition 4.1.5, Proposition 4.1.6(1)).

TauCeti.LogAdic.RootCover.galois [structure]: not stated; depends on the full geometric constructor.
G^D_X×_X Y≃Y×_X Y, and for |G| invertible Y→X is an open Galois finite Kummer étale cover with group G^D_X (Proposition 4.1.6(3)–(4)).

TauCeti.LogAdic.RootCover.cech_exact [characterisation]: not stated; depends on the full geometric constructor.
For affinoid X with a sharp chart the Čech complex O(X)→O(Y)→O(Y×_X Y)→⋯ of a standard Kummer cover is exact, with an O(X)-linear contracting homotopy (Lemma 4.3.2).

TauCeti.LogAdic.RootCover.refine_covering [characterisation]: not stated; depends on the full geometric constructor.
A finitely indexed Kummer étale covering of a noetherian X with a sharp chart is refined by one whose members are étale over root covers X^{1/n_j} and become a strict étale covering over X^{1/n} (Lemma 4.2.6).

TauCeti.LogAdic.RootCover.one [degenerate]: component example above; full test follows.
The first root cover is X.

TauCeti.LogAdic.RootCover.disc_action [computation]: component example above; full test follows.
For P=N and μ_n present, ζ sends S to ζS on T=S^n.

TauCeti.LogAdic.RootCover.ramified_boundary [non-example]: component example above; full test follows.
For n>1 the root map on the log disc has ramification index n at T=0 and is not strict étale there.

TauCeti.LogAdic.RootCover.polydisc_degree [computation]: component example above; full test follows.
For P=N^r over an affinoid field k with n invertible in k and μ_n⊂k, X^{1/n}→X is finite of degree n^r with Galois group μ_n^r acting coordinatewise on S_i, S_i^n=T_i.

Sources: DLLZ-adic Definition 4.1.5, p. 41; DLLZ-adic Proposition 4.1.6, pp. 41–42; Definition 4.1.8, p. 43; DLLZ-adic Lemma 4.3.2, p. 52; DLLZ-adic Lemmas 4.2.5–4.2.6, pp. 49–50.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-ramification-index
TauCeti.LogAdic.RamificationIndex: component above; full geometric signature not stated.

For a Kummer morphism f:Y→X of locally noetherian fs log adic spaces and a geometric point y of Y, the ramification index of f at y is the smallest positive integer n annihilating the finite group coker(M̄^gp_{X,f(y)}→M̄^gp_{Y,y}), i.e. its exponent, not its order. The ramification index of a Kummer étale f is the least common multiple of the indices at the geometric points of Y, when this exists (it is not always defined). For Kummer étale f the index at y is invertible in O_{Y,y}, and the ramification index of a Kummer étale f is 1 if and only if f is strictly étale.

Hypotheses: f is Kummer; the cokernel is finite because the characteristic stalk map is a Kummer homomorphism of sharp fs monoids (Lemma 4.1.11(2)). The index is an exponent: for N^r→N^r, a↦na, it is n although the cokernel has order n^r.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-etale-morphism, CrystallineCohomology:CR.5:log-algebra/characteristic-monoid.

TauCeti.LogAdic.RamificationIndex [constructor]: component above; full contract follows.
The exponent of the characteristic group cokernel at the specified geometric point of a Kummer map.

TauCeti.LogAdic.RamificationIndex.index_one [characterisation]: component above; full contract follows.
A Kummer étale map has index one at every geometric point iff it is strictly étale.

TauCeti.LogAdic.RamificationIndex.base_change [compatibility]: not stated; depends on the full geometric constructor.
Compute the index from the saturated base-changed characteristic map; it can decrease after root base change.

TauCeti.LogAdic.RamificationIndex.global [constructor]: not stated; depends on the full geometric constructor.
The least common multiple of the local indices of a Kummer étale map, when it exists.

TauCeti.LogAdic.RamificationIndex.isUnit [compatibility]: component above; full contract follows.
For Kummer étale f the local index at y is invertible in O_{Y,y} (Lemma 4.1.11(2)).

TauCeti.LogAdic.RamificationIndex.identity [degenerate]: component example above; full test follows.
The identity has index one.

TauCeti.LogAdic.RamificationIndex.two_coordinates [computation]: component example above; full test follows.
Multiplication by n on N² has index n, since the cokernel is (Z/n)².

TauCeti.LogAdic.RamificationIndex.off_boundary [computation]: component example above; full test follows.
On the boundary complement the coordinate-root characteristic cokernel is zero and the index is one.

TauCeti.LogAdic.RamificationIndex.root_cover_strata [computation]: component example above; full test follows.
For the n-th root cover of a chart modeled on N^r, the index at a point where exactly s≥1 coordinates vanish is n (cokernel (Z/n)^s), and 1 where none vanish.

Sources: DLLZ-adic Definition 4.1.12, p. 44; DLLZ-adic Definition 4.1.12, p. 44; DLLZ-adic Definition 4.1.12, p. 44; DLLZ-adic Lemma 4.1.11(2) proof, p. 44.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-etale-site
TauCeti.LogAdic.KummerEtaleSite: component above; full geometric signature not stated.

For a locally noetherian fs log adic space X, X_két is the full subcategory of locally noetherian fs log adic spaces over X consisting of the Kummer étale Y→X (morphisms over X between them are automatically Kummer étale, Proposition 4.1.15), with coverings the families {U_i→U} that are jointly surjective on underlying topological spaces; fs fibre products and composition (Proposition 4.1.14) make this a site, and its topology is generated by surjective strictly étale maps and standard Kummer étale covers. The presheaves U↦O_U(U), U↦O_U⁺(U) and U↦M_U(U) are sheaves, and for every morphism Y→X of locally noetherian fs log adic spaces Mor_X(−,Y) is a sheaf on X_két. If X is affinoid then H^i(X_két,O)=0 for i>0. Viewing objects of X_ét with the restricted log structure gives ε_ét:X_két→X_ét (and ε_an:X_két→X_an), an isomorphism of sites for trivial log structure, with O_{X_ét}≃Rε_ét,*O_{X_két}, O_{X_an}≃Rε_an,*O_{X_két} and ε_ét,*M_{X_két}≃M_X. A morphism f:Y→X induces f_két:Y_két→X_két with f_két,*F(U)=F(U×_X Y) and exact left adjoint f_két⁻¹.

Hypotheses: All topological points, including higher-rank points, count in joint surjectivity. Affinoid acyclicity of O is for affinoid (hence noetherian) X; it is the case F=O of the coherent acyclicity theorem.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-etale-morphism, HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-root-covers, AdicEtaleGeometry:A1/etale-site, mathlib:CategoryTheory.GrothendieckTopology, mathlib:CategoryTheory.Sheaf, AdicEtaleGeometry:A1/etale-structure-sheaf, ClassicalAdicEtaleCohomology:H0/etale-acyclicity-of-vector-bundles, DiamondsAndVStacks:D0/cech-to-derived-comparison.

TauCeti.LogAdic.KummerEtaleSite [constructor]: component above; full contract follows.
The category of Kummer étale objects over X, the joint-surjectivity topology, and the sheaves O, O⁺ and M.

TauCeti.LogAdic.KummerEtaleSite.epsilon [projection]: not stated; depends on the full geometric constructor.
The morphism of sites ε_ét:X_két→X_ét induced by strict étale objects, an isomorphism for trivial log structure.

TauCeti.LogAdic.KummerEtaleSite.pullback [functoriality]: not stated; depends on the full geometric constructor.
A morphism f:Y→X induces f_két with f_két,*F(U)=F(U×_X Y) and exact left adjoint f_két⁻¹, with identity and composition coherence.

TauCeti.LogAdic.KummerEtaleSite.representable [structure]: component above; full contract follows.
For every morphism Y→X of locally noetherian fs log adic spaces, Mor_X(−,Y) is a sheaf on X_két (Proposition 4.3.5).

TauCeti.LogAdic.KummerEtaleSite.generated [characterisation]: not stated; depends on the full geometric constructor.
The topology is generated by surjective strictly étale maps and standard Kummer étale covers (Remark 4.1.18).

TauCeti.LogAdic.KummerEtaleSite.epsilon_structureSheaf [compatibility]: not stated; depends on the full geometric constructor.
O_{X_ét}≃Rε_ét,*O_{X_két}, O_{X_an}≃Rε_an,*O_{X_két} and ε_ét,*M_{X_két}≃M_X (Corollary 4.3.3, Proposition 4.3.4).

TauCeti.LogAdic.KummerEtaleSite.affinoid_chart_basis [structure]: not stated; depends on the full geometric constructor.
Affinoids with global fs charts form a basis of X_két inducing an equivalence of topoi (Lemma 4.3.10).

TauCeti.LogAdic.KummerEtaleSite.trivial_log [compatibility]: not stated as an example; needs the full geometric constructor.
For the trivial log structure, X_két≃X_ét as ringed sites.

TauCeti.LogAdic.KummerEtaleSite.root_is_cover [computation]: not stated as an example; needs the full geometric constructor.
For n invertible on the log disc D, the n-th root cover D→D, T=S^n, is a single-member covering, surjective also over T=0.

TauCeti.LogAdic.KummerEtaleSite.no_closed_point_shortcut [non-example]: not stated as an example; needs the full geometric constructor.
On the closed unit disc with trivial log structure, the open disc ⋃_{m≥1}{|T|^m≤|ϖ|} (ϖ a pseudo-uniformiser) and the circle {|T|=1} cover every rank-one point but miss the rank-two point with |T| infinitesimally below 1, so this family is not a covering of X_két.

TauCeti.LogAdic.KummerEtaleSite.root_invariants [computation]: not stated as an example; needs the full geometric constructor.
For the n-th root cover of the log disc over k with n invertible in k and μ_n⊂k, the equaliser of O(D)⇉O(D×_D D) is k⟨S⟩^{μ_n}=k⟨S^n⟩=k⟨T⟩, as sheafiness of O requires.

Sources: DLLZ-adic Definition 4.1.16, pp. 46–47; DLLZ-adic Remark 4.1.17(1), p. 47; DLLZ-adic Theorem 4.3.1(2), p. 52; DLLZ-adic Proposition 4.3.4, p. 53; DLLZ-adic Proposition 4.3.5, p. 54.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-coherent-acyclicity
TauCeti.LogAdic.kummer_coherent_acyclicity: not stated; needs the geometric carriers listed below.

Let X be an affinoid noetherian fs log adic space. An O_{X_két}-module is analytic coherent if it is isomorphic to the inverse image of a coherent sheaf on X_an, and coherent if its restrictions to the members of some Kummer étale covering are analytic coherent. Then H^i(X_két,F)=0 for all i>0 if (1) F is analytic coherent, or (2) F is coherent and X is over an affinoid field (k,k⁺). The analytic qualification and the field alternative are retained: no claim is made for every coherent module over an arbitrary affinoid base, and Kummer étale descent of coherent sheaves is not effective in general.

Hypotheses: Use the two alternatives of DLLZ Theorem 4.3.7 and the definitions of Definition 4.3.6.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-etale-site, HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-root-covers, ClassicalAdicEtaleCohomology:H0, AdicSpacesPartII:R3/coherent-sheaf, AdicSpacesPartII:R3/tate-kiehl-affinoid, ClassicalAdicEtaleCohomology:H0/etale-acyclicity-of-vector-bundles, DiamondsAndVStacks:D0/cech-to-derived-comparison.

Sources: DLLZ-adic Definition 4.3.6(1), p. 55; DLLZ-adic Theorem 4.3.7(2), p. 55; DLLZ-adic Theorem 4.3.7, proof of (2), p. 56.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:log-sites/finite-kummer-descent
TauCeti.LogAdic.finite_kummer_descent: not stated; needs the geometric carriers listed below.

Let X be a locally noetherian fs log adic space. (i) For lft morphisms, being log smooth, log étale or Kummer étale can be checked after a surjective Kummer étale base change, and descends along a surjective Kummer étale source map: for surjective Kummer étale f:Y→X and lft g:X→S, g has the property iff g∘f has. (ii) Kummer étale covers are effective descent morphisms for finite Kummer étale objects: for surjective Kummer étale f:Y→X and Y̆∈Y_fkét with an isomorphism pr₁⁻¹Y̆≃pr₂⁻¹Y̆ satisfying the cocycle condition, there is a unique X̆∈X_fkét with Y̆≃X̆×_X Y. (iii) Y↦Mor_X(−,Y) is an equivalence X_fkét≃Loc(X_két) onto locally constant sheaves of finite sets, preserving fibre products and quotients by finite groups. (iv) Every geometric point has a log geometric point above it (complete separably closed l, characteristic monoid uniquely n-divisible for n invertible in l), and these give a conservative family of fibre functors; for connected X and a log geometric point ζ, X_fkét with Y↦Mor_X(ζ,Y) is a Galois category, and X_fkét≃Loc(X_két)≃π₁^két(X,ζ)-FSets. (v) For the strict localisation X(ξ) at a geometric point ξ=Spa(l,l⁺), π₁^két(X(ξ))≃π₁^két(ξ)≃Hom(M̄^gp_{X,ξ},Ẑ′(1)(l)), where Ẑ′(1)(l)=lim μ_m(l) over m invertible in l. Consequently locally constant sheaves of finite Λ-modules (Λ a finite ring) correspond to finite Λ-modules with continuous π₁^két(X,ζ)-action.

Hypotheses: X locally noetherian fs; the fundamental-group statements need X connected and a log geometric point (not an unlogged geometric point) as base point. The Λ-module form is a formal consequence of (4.4.20) applied to module objects; DLLZ state only the finite-set form.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-etale-site, HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-root-covers, HodgeTateAndCanonicalSubgroups:T6:log-sites/log-smooth-chart-criterion, HodgeTateAndCanonicalSubgroups:T6:log-sites/log-differential-descent, ClassicalAdicEtaleCohomology:H0.

Sources: DLLZ-adic Propositions 4.2.7–4.2.8, pp. 50–52; DLLZ-adic Theorem 4.4.12, p. 60; DLLZ-adic Theorem 4.4.15(2), p. 62; DLLZ-adic Corollary 4.4.18, p. 63; DLLZ-adic Corollary 4.4.22, p. 63.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-etale-higher-direct-images
TauCeti.LogAdic.kummer_etale_higher_direct_images: not stated; needs the geometric carriers listed below.

Let X be a locally noetherian fs log adic space, ε=ε_ét:X_két→X_ét, and ξ=Spa(l,l⁺) a geometric point of X with a log geometric point ξ̃ above it and M̄=M̄_{X,ξ}. (1) For every sheaf F of finite abelian groups on X_két, (R^iε_*F)_ξ≅H^i(π₁^két(ξ,ξ̃),F_ξ̃) (continuous cohomology), where π₁^két(ξ)≅Hom(M̄^gp,Ẑ′(1)(l)). (2) For n invertible in O_X, the sequence 1→μ_n→M^gp_{X_két}→M^gp_{X_két}→1 (the middle map multiplication by n) is exact on X_két; with ε_*μ_n=μ_n its pushforward, compared with the Kummer sequence of O^×_{X_ét}, gives a canonical map M̄^gp_X/nM̄^gp_X→R^1ε_*(μ_n), which is an isomorphism. (3) Cup product gives isomorphisms ∧^iR^1ε_*(μ_n)≅R^iε_*(μ_n^{⊗i}) for all i≥0; equivalently R^iε_*(Z/n)≅∧^i(M̄^gp_X/nM̄^gp_X)(−i), where (−i) means ⊗μ_n^{⊗(−i)}. Since O^×_{X_ét} is n-divisible étale locally, M^gp_X/nM^gp_X=M̄^gp_X/nM̄^gp_X, so this is the form ∧^i(M^gp/nM^gp)(−i) used by PR.8. DLLZ print the target of Lemma 4.4.29 as R^iε_*(μ_n); the twist μ_n^{⊗i} is needed for i≠1, and is the form DLLZ use in Lemma 4.6.2. For trivial log structure R^iε_*F=0 for i>0.

Hypotheses: X locally noetherian fs. (1) holds for every sheaf of finite abelian groups; (2)–(3) need n invertible in O_X. Over Spa(Q_p,Z_p), the case requested by PR.8, every n is invertible in O_X. Ẑ′(1)(l)=lim μ_m(l) over m invertible in l; it is Ẑ(1)(l) in characteristic zero. The log geometric point is that of Construction 4.4.3.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-etale-site, HodgeTateAndCanonicalSubgroups:T6:log-sites/finite-kummer-descent, HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-root-covers, ClassicalAdicEtaleCohomology:H0.

Sources: DLLZ-adic Lemma 4.4.27, p. 64; DLLZ-adic Discussion before Lemma 4.4.29, p. 64; DLLZ-adic (4.4.28), p. 65; DLLZ-adic Lemma 4.4.29, p. 65.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:log-sites/rigid-abhyankar
TauCeti.LogAdic.rigid_abhyankar: not stated; needs the geometric carriers listed below.

Let X be a smooth rigid analytic variety over a nonarchimedean field k of characteristic zero, D⊂X a normal crossings divisor (étale locally, equivalently analytic locally after a finite separable extension of k, of the form S×{T₁⋯T_m=0}⊂S×D^m; strict normal crossings is a special case) with the fs log structure of Example 2.3.17, and U=X−D. Every finite étale surjective h:V→U extends to a finite surjective Kummer étale f:Y→X, where Y is a normal rigid analytic variety with the log structure defined by f⁻¹(D); Y_an has a basis of affinoids W with π₀(W∩f⁻¹(U))=π₀(W). Locally, on X_ρ=S×D^r_ρ with ρ=p^{−b(d,p)} and after a finite extension of k and a strictly finite étale cover of S, each component of Y_ρ is S⟨Q⟩_ρ for a toric Q with N^r⊂Q⊂⊕_i(1/d_i)N, d_i≤d=deg f, and the pullback of Y to X_ρ^{1/m}, m=d!, splits completely and so is strictly finite étale.

Hypotheses: char k=0, X smooth, D normal crossings in the sense of Example 2.3.17; h finite étale surjective; nothing is assumed about h over D. The splitting statement is local on X and holds after finite extension of k; the radius ρ depends only on d and p.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:log-sites/divisorial-analytic-log, HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-root-covers, AdicSpacesPartII:R0, AdicSpacesPartII:R3/finite-morphism-coherent-algebra-equivalence.

Sources: DLLZ-adic Proposition 4.2.1, p. 47; DLLZ-adic Proposition 4.2.1, proof, p. 47; DLLZ-adic Lemma 4.2.3, p. 48; DLLZ-adic Lemma 4.2.2, p. 48.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:log-sites/boundary-local-system-extension
TauCeti.LogAdic.boundary_local_system_extension: not stated; needs the geometric carriers listed below.

Let X be a smooth rigid analytic variety over a nonarchimedean field k with char(k)=0 and k⁺=O_k, D⊂X a normal crossings divisor with the log structure of Example 2.3.17, U=X−D and j:U↪X (so U_két=U_ét). For every torsion local system L on U_ét, j_két,*L is a torsion local system on X_két and R^ij_két,*L=0 for i>0; hence H^i(U_ét,L)≅H^i(X_két,j_két,*L) for all i≥0. Conversely every torsion local system L̄ on X_két satisfies L̄≅j_két,*j⁻¹L̄, so restriction and j_két,* are inverse equivalences between torsion local systems on X_két and on U_ét. In particular Z/n≅Rj_két,*(Z/n), Rε_ét,*(Z/n)≅Rj_ét,*(Z/n) and R^ij_ét,*(Z/n)≅∧^i(M̄^gp_X/nM̄^gp_X)(−i). No properness is assumed; finiteness of cohomology is a separate statement for proper X.

Hypotheses: char k=0 and k⁺=O_k, as in Theorem 4.6.1; D normal crossings (strict normal crossings is a special case). Corollary 4.6.7 is stated for F_p-local systems; its proof (L̄→Rj_két,*j⁻¹L̄ is a map of local systems that is the identity on the dense open U) applies verbatim to torsion local systems, which is the form recorded here.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:log-sites/rigid-abhyankar, HodgeTateAndCanonicalSubgroups:T6:log-sites/finite-kummer-descent, HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-root-covers, HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-etale-site, HodgeTateAndCanonicalSubgroups:T6:log-sites/divisorial-analytic-log, HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-etale-higher-direct-images, ClassicalAdicEtaleCohomology:H0/torsion-local-systems, ClassicalAdicEtaleCohomology:H0/local-systems-and-finite-etale-covers, DiamondsAndVStacks:D0/cech-to-derived-comparison.

Sources: DLLZ-adic Theorem 4.6.1, p. 68; DLLZ-adic Theorem 4.6.1, proof, p. 69; DLLZ-adic Lemma 4.6.2, proof, p. 69; DLLZ-adic Corollary 4.6.7, p. 69.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:log-sites/pro-kummer-presentations
TauCeti.LogAdic.ProKummerPresentation: component above; full geometric signature not stated.

Let X be a locally noetherian fs log adic space; objects of pro-X_két are cofiltered limits U=lim_{i∈I}U_i of objects of X_két, with |U|:=lim|U_i|. A morphism U→V of pro-X_két is Kummer étale (resp. finite Kummer étale, étale, finite étale) if it is the pullback along some V→V₀ of a Kummer étale (resp. finite Kummer étale, strictly étale, strictly finite étale) morphism U₀→V₀ of X_két; this is a condition on the pro-morphism, stronger than a property of |U|→|V|. U→V is pro-Kummer étale if U=lim_i U_i with each U_i→V Kummer étale and U_j→U_i finite Kummer étale and surjective for all sufficiently large i (a pro-Kummer étale presentation), and pro-finite Kummer étale if moreover all U_i→V are finite Kummer étale. All these classes are stable under base change (the fibre products exist and |U×_V W|→|U|×_{|V|}|W| is surjective); the finite-stage classes are stable under composition; pro-Kummer étale morphisms are open; over W∈X_prokét, composites of pro-Kummer étale morphisms are pro-Kummer étale with source in X_prokét; and finite limits exist in X_prokét.

Hypotheses: Cofiltered small presentations as in [Sch13a, Prop. 3.2]; the eventual clause of Definition 5.1.1(2) ('for all i≥i₀') is part of the definition, not a consequence of surjectivity of |U|→|V|.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-etale-site, HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-etale-morphism, AdicEtaleGeometry:A1/pro-etale-morphism.

TauCeti.LogAdic.ProKummerPresentation [constructor]: component above; full contract follows.
A cofiltered finite-level Kummer presentation with eventually finite surjective transitions.

TauCeti.LogAdic.ProKummerPresentation.reindex [equivalence]: not stated; depends on the full geometric constructor.
Cofinal reindexing represents the same pro-object.

TauCeti.LogAdic.ProKummerPresentation.base_change [functoriality]: not stated; depends on the full geometric constructor.
Base change of the finite-level presentation represents the fs pullback pro-object, and |U×_V W|→|U|×_{|V|}|W| is surjective (Lemma 5.1.4(1)).

TauCeti.LogAdic.ProKummerPresentation.comp [functoriality]: not stated; depends on the full geometric constructor.
Over W∈X_prokét, a composite U→V→W of pro-Kummer étale (resp. pro-finite Kummer étale) morphisms is pro-Kummer étale (resp. pro-finite Kummer étale) and U, V lie in X_prokét (Lemma 5.1.4(6)).

TauCeti.LogAdic.ProKummerPresentation.isOpenMap [compatibility]: not stated; depends on the full geometric constructor.
Pro-Kummer étale morphisms induce open maps of underlying spaces (Lemma 5.1.4(4)).

TauCeti.LogAdic.ProKummerPresentation.IsProFinite [structure]: not stated; depends on the full geometric constructor.
The presentation is pro-finite Kummer étale when every U_i→V is finite Kummer étale (Definition 5.1.1(3)).

TauCeti.LogAdic.ProKummerPresentation.constant [degenerate]: not stated as an example; needs the full geometric constructor.
Every Kummer étale U→X in X_két is pro-Kummer étale via the one-term presentation.

TauCeti.LogAdic.ProKummerPresentation.root_tower [computation]: not stated as an example; needs the full geometric constructor.
For X with a global sharp fs chart P over a characteristic-zero field, the divisibility-indexed system of root covers X^{1/m} is a pro-finite Kummer étale presentation over X.

TauCeti.LogAdic.ProKummerPresentation.eventual_surjectivity [non-example]: not stated as an example; needs the full geometric constructor.
On the closed unit disc X with trivial log structure, the system of rational discs {|T|≤|ϖ|^n} has no eventually surjective transitions, and its limit is not pro-Kummer étale over X under any presentation: its image {T=0} in |X| is not open, while pro-Kummer étale maps are open.

Sources: DLLZ-adic Definition 5.1.1(1), p. 70; DLLZ-adic Definition 5.1.1(2), p. 70; DLLZ-adic Lemma 5.1.4(4), p. 71; DLLZ-adic Lemma 5.1.4(7), p. 71.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:log-sites/corrected-pro-kummer-covers
TauCeti.LogAdic.CorrectedProKummerCover: not stated; needs the geometric carriers listed below.

Let U∈X_prokét. A covering of U is a family of pro-Kummer étale morphisms {f_a:U_a→U} with |U|=∪f_a(|U_a|) such that each f_a is an inverse limit U_a=lim_{μ<λ}U_μ→U over the ordinals less than some ordinal λ, with every U_μ∈X_prokét, U₀=U the initial term, and, for each μ<λ, U_μ→U_{<μ}:=lim_{μ′<μ}U_{μ′} (limits over U, the empty one being U) the pullback of a Kummer étale morphism of X_két, and the pullback of a surjective finite Kummer étale morphism of X_két for all sufficiently large μ. This is DLLZ Definition 5.1.2, the log analogue of the transfinite covering condition of Scholze's corrigendum [Sch16] to the pro-étale site of [Sch13a]; 'corrected' refers to that corrigendum. These tower conditions, not arbitrary jointly surjective families of pro-Kummer étale morphisms, define the coverings; they are stable under base change and composition.

Hypotheses: Use Definition 5.1.2(1)–(3) exactly, including the eventual surjective finite clause; joint surjectivity is on |U|=lim|U_i|, all points included.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:log-sites/pro-kummer-presentations, AdicEtaleGeometry:A1/corrected-covers-pretopology, mathlib:CategoryTheory.GrothendieckTopology.

TauCeti.LogAdic.CorrectedProKummerCover [constructor]: not stated; depends on the full geometric constructor.
A joint-surjectivity proof plus the ordinal tower certificates with eventual finite-surjective steps.

TauCeti.LogAdic.CorrectedProKummerCover.pullback [functoriality]: not stated; depends on the full geometric constructor.
Pullback of a certified cover is a certified cover (Lemma 5.1.4(8)).

TauCeti.LogAdic.CorrectedProKummerCover.refinement [structure]: not stated; depends on the full geometric constructor.
Composite coverings are coverings, certified by the ordinal-sum concatenation of towers with the same step conditions.

TauCeti.LogAdic.CorrectedProKummerCover.ofCountablePresentation [constructor]: not stated; depends on the full geometric constructor.
A surjective pro-Kummer étale U→V with an ℕ-indexed presentation is a one-member covering, certified by a tower of type ω.

TauCeti.LogAdic.CorrectedProKummerCover.identity [degenerate]: not stated as an example; needs the full geometric constructor.
The identity family is a cover.

TauCeti.LogAdic.CorrectedProKummerCover.finite_stage [compatibility]: not stated as an example; needs the full geometric constructor.
Every finite-stage jointly surjective Kummer étale family gives a cover of constant pro-objects.

TauCeti.LogAdic.CorrectedProKummerCover.need_tower [non-example]: not stated as an example; needs the full geometric constructor.
On the closed unit disc X with trivial log structure, {X−{0}→X, lim_n{|T|≤|ϖ|^n}→X} is jointly surjective and each member is a transfinite limit of pullbacks of étale maps, but it is not a covering: the second tower never has surjective finite steps (and its limit is not pro-Kummer étale, its image not being open).

TauCeti.LogAdic.CorrectedProKummerCover.root_tower [computation]: not stated as an example; needs the full geometric constructor.
For X with a global sharp fs chart over a characteristic-zero field, {lim_m X^{1/m}→X} is a covering, certified by the ω-tower of the root covers X^{1/n!}.

Sources: DLLZ-adic Definition 5.1.2, p. 70; DLLZ-adic Definition 5.1.2(3), p. 70; DLLZ-adic Lemma 5.1.4(8), p. 71; DLLZ-adic Bibliography, [Sch16], p. 99.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:log-sites/pro-kummer-etale-site
TauCeti.LogAdic.ProKummerEtaleSite: component above; full geometric signature not stated.

For a locally noetherian fs log adic space X, X_prokét is the full subcategory of pro-X_két of objects pro-Kummer étale over X, with the coverings of Definition 5.1.2 (a pretopology: Lemma 5.1.4(8) and tower concatenation); finite limits exist. Objects with a pro-Kummer étale presentation by affinoids are quasi-compact and quasi-separated, generate X_prokét and are stable under fibre products; the topos is algebraic; U is quasi-compact (resp. quasi-separated) iff |U| is, likewise for morphisms; X_prokét is quasi-separated (resp. coherent) iff |X| is. Constant objects give the projection ν:X_prokét→X_két, and f:Y→X induces f_prokét. For trivial log structure X_két=X_ét (Remark 4.1.17) and X_prokét is the pro-étale site of [Sch13a] with the covering condition of [Sch16], not the naive covering definition; this comparison follows from the definitions and is not separately stated in DLLZ. The pro-finite Kummer étale site X_profkét has underlying category pro-X_fkét and transfinite-tower coverings by pro-finite Kummer étale maps (Definition 5.1.9); for a profinite group G, G-PFSets is the category of profinite sets with continuous G-action with the analogous coverings (Definition 5.1.10). If X is connected and ζ is a log geometric point, U=lim_i U_i↦S(U)=lim_i Mor_X(ζ,U_i) is an equivalence of sites X_profkét≃π_1^két(X,ζ)-PFSets, matching coverings (Proposition 5.1.12).

Hypotheses: X locally noetherian fs, pro-objects and covers as the preceding definitions.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:log-sites/corrected-pro-kummer-covers, HodgeTateAndCanonicalSubgroups:T6:log-sites/pro-kummer-presentations, HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-etale-site, AdicEtaleGeometry:A1/pro-etale-site-corrected, mathlib:CategoryTheory.Sheaf, HodgeTateAndCanonicalSubgroups:T6:log-sites/finite-kummer-descent, AdicEtaleGeometry:A1/profinite-g-sets-site.

TauCeti.LogAdic.ProKummerEtaleSite [constructor]: component above; full contract follows.
The category, the Definition 5.1.2 coverings and the qcqs basis.

TauCeti.LogAdic.ProKummerEtaleSite.nu [projection]: not stated; depends on the full geometric constructor.
The site morphism ν induced by constant Kummer objects.

TauCeti.LogAdic.ProKummerEtaleSite.pullback [functoriality]: not stated; depends on the full geometric constructor.
Fs log maps induce pullback functors on the pro-Kummer topoi.

TauCeti.LogAdic.ProKummerEtaleSite.trivial_log [equivalence]: not stated; depends on the full geometric constructor.
Trivial logs recover the corrected ordinary pro-étale site.

TauCeti.LogAdic.ProKummerEtaleSite.qcqs_basis [structure]: not stated; depends on the full geometric constructor.
Objects with affinoid pro-Kummer étale presentations are qcqs, generate the site and are stable under fibre products (Proposition 5.1.5(1)–(2)).

TauCeti.LogAdic.ProKummerEtaleSite.hasFiniteLimits [structure]: not stated; depends on the full geometric constructor.
X_prokét has all finite limits (Lemma 5.1.4(7)).

TauCeti.LogAdic.ProKummerEtaleSite.isQuasiCompact_iff [characterisation]: not stated; depends on the full geometric constructor.
An object (resp. morphism) is quasi-compact or quasi-separated iff its underlying space (resp. map) is (Proposition 5.1.5(4), (6)).

TauCeti.LogAdic.ProKummerEtaleSite.profinite_galois_equivalence [equivalence]: not stated; depends on the full geometric constructor.
For connected X with log geometric point ζ, U=lim U_i↦lim_i Mor_X(ζ,U_i) is an equivalence of sites X_profkét≃π_1^két(X,ζ)-PFSets compatible with coverings (Proposition 5.1.12).

TauCeti.LogAdic.ProKummerEtaleSite.final_object [degenerate]: not stated as an example; needs the full geometric constructor.
Constant X is final in the site category.

TauCeti.LogAdic.ProKummerEtaleSite.constant_root [computation]: not stated as an example; needs the full geometric constructor.
A finite root cover of X gives a constant covering object of X_prokét.

TauCeti.LogAdic.ProKummerEtaleSite.ordinary_compatibility [compatibility]: not stated as an example; needs the full geometric constructor.
On a trivially logged X, the ν projection matches the ordinary corrected ν under the site equivalence.

TauCeti.LogAdic.ProKummerEtaleSite.log_point_root_tower [computation]: not stated as an example; needs the full geometric constructor.
For the split fs log point s=(Spa(l,l⁺),N) with l algebraically closed of characteristic zero, π_1^két(s)≅Ẑ(1) (Corollary 4.4.22), and the root tower lim_m s^{1/m} corresponds under Proposition 5.1.12 to Ẑ(1) with its translation action.

Sources: DLLZ-adic Definition 5.1.2, p. 70; DLLZ-adic Proposition 5.1.5(1), p. 71; DLLZ-adic Proposition 5.1.5(7), p. 72; DLLZ-adic §5.1, p. 72; DLLZ-adic Definition 5.1.9, p. 72; DLLZ-adic Proposition 5.1.12, p. 73.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:log-sites/log-site-projections
TauCeti.LogAdic.log_site_projections: not stated; needs the geometric carriers listed below.

Let X be a locally noetherian fs log adic space and ν:X_prokét→X_két the projection. For every abelian sheaf F on X_két and every qcqs U=lim_i U_i in X_prokét (presented as in Proposition 5.1.5(1)), H^j(U_prokét,ν⁻¹F)=colim_i H^j(U_{i,két},F) for all j≥0. The unit F→Rν_*ν⁻¹F is an isomorphism; hence ν⁻¹:Sh_Ab(X_két)→Sh_Ab(X_prokét) is fully faithful and RΓ(X_két,F)≅RΓ(X_prokét,ν⁻¹F). The composites with ε_ét:X_két→X_ét and X_ét→X_an are the projections from X_prokét used later. In the setting of Theorem 4.6.1, for a torsion local system L on U_ét, H^i(U_ét,L)≅H^i(X_két,j_két,*L)≅H^i(X_prokét,ν⁻¹j_két,*L). For a quasi-compact quasi-separated morphism f:Y→X of locally noetherian fs log adic spaces and every abelian sheaf F on Y_két, the adjunction morphism ν_X⁻¹Rf_két,*(F)→Rf_prokét,*ν_Y⁻¹(F) is an isomorphism (Proposition 5.2.1).

Hypotheses: Use qcqs U and finite-level basis as in Proposition 5.1.6, not an unrestricted sections formula on arbitrary objects.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:log-sites/pro-kummer-etale-site, HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-etale-site, HodgeTateAndCanonicalSubgroups:T6:log-sites/boundary-local-system-extension, AdicEtaleGeometry:A1/proetale-projection-nu, DiamondsAndVStacks:D0/quasicompact-objects-in-a-topos, DiamondsAndVStacks:D0/filtered-colimits-and-cohomology-on-coherent-sites, DiamondsAndVStacks:D0/cech-to-derived-comparison.

Sources: DLLZ-adic Proposition 5.1.6, proof, p. 72; DLLZ-adic Proposition 5.1.7, p. 72; DLLZ-adic Corollary 5.1.8, p. 72; DLLZ-adic Proposition 5.2.1, p. 73; DLLZ-adic Proof of Proposition 5.2.1, p. 73.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:log-sites/all-root-toric-tower
TauCeti.LogAdic.AllRootTower: component above; full geometric signature not stated.

Let P be a sharp fs monoid, (1/m)P its m-th root monoid and P_{Q≥0}=colim_m (1/m)P along the divisibility order (m|m′); P_{Q≥0} is uniquely n-divisible for every integer n≥1. (0) Toric charts (Proposition 3.1.10, Definition 3.1.12): a log smooth fs X over an affinoid field (k,k⁺) étale locally admits a toric chart, a strictly étale map X→Spa(k⟨P⟩,k⁺⟨P⟩) with P sharp fs that is a composition of rational localizations and finite étale maps. (a) Geometric tower (Lemma 5.3.4): if X is an analytic locally noetherian adic space over Spa(Z_p,Z_p) with trivial log structure, Y=X⟨P⟩ and lim_{i∈I} U_i is an affinoid perfectoid object of X_proét, then, with I×Z_{≥1} ordered by (i,m)≥(j,n) iff i≥j and n|m, the system U_i⟨(1/n)P⟩ is a pro-Kummer étale presentation over Y with an initial object, sharp fs charts (1/n)P, Kummer transition charts, perfectoid completed colimit and chart colimit P_{Q≥0}; it is a pro-Kummer étale (resp. pro-finite Kummer étale) cover of Y when lim U_i is a pro-étale (resp. pro-finite étale) cover of X. (b) Toric tower over a field (§6.1): for k a perfectoid field of characteristic zero containing all roots of unity, k⁺=O_k and E=Spa(k⟨P⟩,k⁺⟨P⟩), the tower Ẽ=lim_m E_m with E_m=Spa(k⟨(1/m)P⟩,k⁺⟨(1/m)P⟩) has associated perfectoid space Spa(k⟨P_{Q≥0}⟩,k⁺⟨P_{Q≥0}⟩); E_m→E is a Galois finite Kummer étale cover with group Γ/m=Hom(P^gp,μ_m), and Ẽ→E is a Galois pro-finite Kummer étale cover with group Γ=lim_m Γ/m=Hom(P^gp,Ẑ(1)). The finite-order characters of Γ are identified with P_Q^gp/P^gp, and k⁺[P_{Q≥0}]=⊕_χ k⁺[P_{Q≥0}]_χ, where the χ-summand is spanned by the e^a with a∈P_{Q≥0} of class χ; the trivial-character summand is k⁺[P] and every summand is a finite k⁺[P]-module (Lemma 6.1.6). Pullback along a toric chart V→E gives Ṽ=V×_E Ẽ=lim_m V_m. (c) Arithmetic tower (DLLZ-RH §2.3 and (3.3.4)): over a p-adic field k with k_m=k(μ_m) and k_∞=∪_m k_m, the tower of Spa(k_m⟨(1/m)P⟩,k_m⁺⟨(1/m)P⟩) has associated perfectoid space Spa(k̂_∞⟨P_{Q≥0}⟩,k̂_∞⁺⟨P_{Q≥0}⟩), and its Galois group Γ is an extension 1→Γ_geom→Γ→Gal(k_∞/k)→1 with Γ_geom=Hom(P^gp,Ẑ(1)) (≅Ẑ(1)^n for P=Z^n_{≥0}) on which Gal(k_∞/k) acts through the cyclotomic character.

Hypotheses: Characteristic zero; residue characteristic p wherever the tower is required to be perfectoid. In (b) k is perfectoid: DLLZ-adic §6.1 assumes only that k has characteristic zero and contains all roots of unity, but k⟨P_{Q≥0}⟩ is perfectoid only when k is (already for P=0); every application (Theorem 6.2.1) has k algebraically closed. In (c) k is a p-adic field in DLLZ-RH's sense (complete discretely valued, perfect residue field) and roots of unity are adjoined level by level. The index set is ordered by divisibility over all integers m≥1, not only powers of p.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-root-covers, HodgeTateAndCanonicalSubgroups:T6:log-sites/log-smooth-chart-criterion, HodgeTateAndCanonicalSubgroups:T6:log-sites/pro-kummer-presentations, PerfectoidSpaces:P1/perfectoid-tate-rings-and-algebras, AdicEtaleGeometry:A4/perfectoid-uniform-completion.

TauCeti.LogAdic.AllRootTower [constructor]: component above; full contract follows.
The divisibility-indexed root presentation together with its field/root-of-unity data.

TauCeti.LogAdic.AllRootTower.character_action [simp]: component above; full contract follows.
γ(e^a)=χ_a(γ)e^a on a root monomial.

TauCeti.LogAdic.AllRootTower.geometric_group [characterisation]: component above; full contract follows.
The geometric group is Hom(P^gp,Ẑ(1)).

TauCeti.LogAdic.AllRootTower.cyclotomic_conjugation [relation]: not stated; depends on the full geometric constructor.
Arithmetic conjugation acts on the geometric Ẑ(1)-directions through the cyclotomic character.

TauCeti.LogAdic.AllRootTower.chart_limit_divisible [characterisation]: component above; full contract follows.
The chart colimit is P_{Q≥0}=colim_m (1/m)P, sharp, saturated and uniquely n-divisible for every n≥1.

TauCeti.LogAdic.AllRootTower.character_decomposition [relation]: not stated; depends on the full geometric constructor.
k⁺[P_{Q≥0}]=⊕_χ k⁺[P_{Q≥0}]_χ over the finite-order characters χ∈P_Q^gp/P^gp of Γ; the trivial summand is k⁺[P] and each summand is a finite k⁺[P]-module (Lemma 6.1.6).

TauCeti.LogAdic.AllRootTower.exists_toric_chart [other]: not stated; depends on the full geometric constructor.
A log smooth fs X over (k,k⁺) étale locally admits a toric chart X→Spa(k⟨P⟩,k⁺⟨P⟩), P sharp fs, that is a composition of rational localizations and finite étale maps (Proposition 3.1.10).

TauCeti.LogAdic.AllRootTower.rank_zero [degenerate]: component example above; full test follows.
For P=0, the geometric root group is trivial.

TauCeti.LogAdic.AllRootTower.two_coordinates [computation]: component example above; full test follows.
For P=N² the geometric group is Ẑ(1)².

TauCeti.LogAdic.AllRootTower.p_only_insufficient [non-example]: component example above; full test follows.
The monoid N[1/p] is not q-divisible for a prime q≠p; its p-only tower does not satisfy the all-root chart-limit condition.

TauCeti.LogAdic.AllRootTower.trivial_character_summand [characterisation]: component example above; full test follows.
For P=N, the Γ-invariant summand of k⁺[N_{Q≥0}] is k⁺[N]: e^{1/2} lies in the summand of the character of order 2, not in the invariants.

Sources: DLLZ-adic Proposition 3.1.10 and Definition 3.1.12, pp. 24–25; DLLZ-adic Lemma 5.3.4, p. 75; DLLZ-adic §6.1, (6.1.3)–(6.1.5) and Lemma 6.1.6, pp. 81–82; DLLZ-RH §2.3, p. 15, and (3.3.4), p. 29.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:log-sites/log-affinoid-perfectoid
TauCeti.LogAdic.LogAffinoidPerfectoid: not stated; needs the geometric carriers listed below.

Let X be an analytic locally noetherian fs log adic space over Spa(Z_p,Z_p). An object U of X_prokét is log affinoid perfectoid if it has a pro-Kummer étale presentation U=lim_{i∈I} U_i, U_i=Spa(R_i,R_i⁺) with log structures, such that (1) I has an initial object 0; (2) each U_i has a global sharp fs chart P_i and each transition U_j→U_i is modeled on a Kummer chart P_i→P_j; (3) the completion (R,R⁺) of colim_i (R_i^u,R_i^{u+}), where (R_i^u,R_i^{u+}) is the uniformization of (R_i,R_i⁺), is a perfectoid affinoid algebra; (4) P=colim_i P_i is n-divisible for every n≥1, equivalently (P being sharp and saturated) uniquely n-divisible. Over Spa(Q_p,Z_p), (R,R⁺) is simply the p-adic completion of colim_i (R_i,R_i⁺). The associated Û=Spa(R,R⁺) is an affinoid perfectoid space and |Û|≃lim|U_i|; Û itself is not asserted to be an object of X_prokét.

Hypotheses: Analytic locally noetherian fs X over Spa(Z_p,Z_p); the structural-sheaf conclusions below use X over Q_p.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:log-sites/all-root-toric-tower, HodgeTateAndCanonicalSubgroups:T6:log-sites/pro-kummer-etale-site, HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-root-covers, AdicSpacesPartII:R0/uniformization, PerfectoidSpaces:P1/perfectoid-tate-rings-and-algebras, PerfectoidSpaces:P3/almost-purity-theorem.

TauCeti.LogAdic.LogAffinoidPerfectoid [constructor]: not stated; depends on the full geometric constructor.
The finite-stage sharp-chart presentation, all-integer divisibility and perfectoid completed-pair data.

TauCeti.LogAdic.LogAffinoidPerfectoid.realization [projection]: not stated; depends on the full geometric constructor.
The associated completed perfectoid Huber pair and its Spa.

TauCeti.LogAdic.LogAffinoidPerfectoid.topology [compatibility]: not stated; depends on the full geometric constructor.
The realization topology is canonically the inverse-limit topology of the presentation.

TauCeti.LogAdic.LogAffinoidPerfectoid.strict_pullback [functoriality]: not stated; depends on the full geometric constructor.
Strict closed pullback and Kummer étale localization preserve these objects with the source completion convention.

TauCeti.LogAdic.LogAffinoidPerfectoid.isQcqs [other]: not stated; depends on the full geometric constructor.
A log affinoid perfectoid object is quasi-compact and quasi-separated in X_prokét (Remark 5.3.3, from Proposition 5.1.5).

TauCeti.LogAdic.LogAffinoidPerfectoid.realization_map [functoriality]: not stated; depends on the full geometric constructor.
U↦Û is a functor from log affinoid perfectoid objects to affinoid perfectoid spaces (Remark 5.3.5), compatible with the homeomorphism |Û|≅lim|U_i| of Lemma 5.3.6.

TauCeti.LogAdic.LogAffinoidPerfectoid.trivial_chart [compatibility]: not stated as an example; needs the full geometric constructor.
With zero characteristic chart the definition agrees with ordinary affinoid perfectoid pro-objects.

TauCeti.LogAdic.LogAffinoidPerfectoid.all_divisibility [characterisation]: component example above; full test follows.
For each n>0 and a in colim P_i there is a unique b with nb=a.

TauCeti.LogAdic.LogAffinoidPerfectoid.no_p_only [non-example]: component example above; full test follows.
A presentation over a perfectoid base whose chart colimit is N[1/p] (the p-power root tower of a coordinate) is not a perfectoid presentation: condition (4) fails for every n>1 prime to p.

Sources: DLLZ-adic Definition 5.3.1, pp. 74–75; DLLZ-adic Definition 5.3.1(3), p. 75; DLLZ-adic Remark 5.3.3, p. 75; DLLZ-adic Lemma 5.3.8, p. 76.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:log-sites/log-perfectoid-basis
TauCeti.LogAdic.log_perfectoid_basis: not stated; needs the geometric carriers listed below.

Let X be an analytic locally noetherian fs log adic space over Spa(Z_p,Z_p). (1) The log affinoid perfectoid objects form a basis of X_prokét (Proposition 5.3.12) and are stable under fibre products, with (V×_U W)^≅V̂×_Û Ŵ (Proposition 5.3.11). (2) For a strict closed immersion Z→X and log affinoid perfectoid U, U×_X Z is log affinoid perfectoid in Z_prokét and (U×_X Z)^→Û is a closed immersion (Lemma 5.3.7). (3) If V→U is the pullback of a Kummer étale (resp. finite Kummer étale) map V₀→U₀ of affinoids in X_két, then V→U is étale (resp. finite étale), V is log affinoid perfectoid and V̂→Û is étale (resp. finite étale); V↦V̂ induces an equivalence of topoi Û_proét^∼≃(X_prokét/U)^∼ (Lemma 5.3.8). (4) X_prokét has a basis B of log affinoid perfectoid objects with H^i(X_prokét/V,ν⁻¹L)=0 for all V∈B, all p-torsion locally constant sheaves L on X_két and all i>0 (Proposition 5.3.13).

Hypotheses: Analytic locally noetherian fs X over Spa(Z_p,Z_p); neither log smoothness nor a perfectoid base field is required for Propositions 5.3.12–5.3.13.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:log-sites/log-affinoid-perfectoid, HodgeTateAndCanonicalSubgroups:T6:log-sites/all-root-toric-tower, HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-root-covers, HodgeTateAndCanonicalSubgroups:T6:log-sites/pro-kummer-presentations, PerfectoidSpaces:P3/almost-purity-theorem, AdicEtaleGeometry:A1/pro-etale-site-corrected, AdicEtaleGeometry:A4/perfectoid-uniform-completion, ClassicalAdicEtaleCohomology:H0, PerfectoidSpaces:P3/etale-almost-acyclicity, PerfectoidSpaces:P3/etale-site-tilting-equivalence.

Sources: DLLZ-adic Proposition 5.3.12, p. 77; DLLZ-adic Proposition 5.3.11, p. 77; DLLZ-adic Lemma 5.3.8, p. 76; DLLZ-adic Proposition 5.3.13, p. 78.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:log-sites/completed-structural-log-sheaves
TauCeti.LogAdic.CompletedLogStructure: component above; full geometric signature not stated.

For X a locally noetherian fs log adic space over Spa(Q_p,Z_p), define on X_prokét: O⁺=ν⁻¹O⁺_két and O=ν⁻¹O_két; Ô⁺=lim_n O⁺/p^n and Ô=Ô⁺[1/p]; Ô^{♭+}=lim_Φ Ô⁺≅lim_Φ O⁺/p and Ô^♭=lim_Φ Ô, with transition maps Φ: x↦x^p; M=ν⁻¹M_két with α: M→O, and M♭=lim_{a↦a^p} M with the induced α♭: M♭→Ô♭. For every pro-Kummer étale presentation U=lim U_i, M(U)=colim_i M_{U_i}(U_i) (Proposition 5.4.2). Limits and localizations are formed in sheaves; ring sections alone do not define the topology.

Hypotheses: X locally noetherian fs over Spa(Q_p,Z_p); Frobenius is applied in characteristic p for the tilt.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:log-sites/log-site-projections, HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-etale-site, HodgeTateAndCanonicalSubgroups:T6:log-sites/log-affinoid-perfectoid, AdicEtaleGeometry:A1/etale-structure-sheaf, mathlib:AdicCompletion.

TauCeti.LogAdic.CompletedLogStructure [constructor]: component above; full contract follows.
The inverse-image, completed and tilted ring/monoid sheaves with their maps.

TauCeti.LogAdic.CompletedLogStructure.mod_p [compatibility]: component above; full contract follows.
On the perfectoid basis Ô⁺/p identifies with O⁺/p.

TauCeti.LogAdic.CompletedLogStructure.tilt_projection [projection]: component above; full contract follows.
The nth Frobenius-limit projection and the multiplicative sharp map.

TauCeti.LogAdic.CompletedLogStructure.functorial [functoriality]: not stated; depends on the full geometric constructor.
Log pullback gives compatible maps of all structural sheaves and their completions.

TauCeti.LogAdic.CompletedLogStructure.monoid_sections [characterisation]: not stated; depends on the full geometric constructor.
For every pro-Kummer étale presentation U=lim U_i, M(U)=colim_i M_{U_i}(U_i) (Proposition 5.4.2).

TauCeti.LogAdic.CompletedLogStructure.constant_point [computation]: component example above; full test follows.
For a log affinoid perfectoid U whose associated perfectoid space is Spa(K,K⁺) with K a perfectoid field, Ô⁺(U)=K⁺ and Ô(U)=K.

TauCeti.LogAdic.CompletedLogStructure.frobenius_relation [characterisation]: component example above; full test follows.
A tilt sequence satisfies x_{n+1}^p=x_n modulo p.

TauCeti.LogAdic.CompletedLogStructure.not_localize_first [non-example]: component example above; full test follows.
Taking p-adic completion after inverting p yields zero quotients, so it cannot replace Ô⁺ followed by inversion.

TauCeti.LogAdic.CompletedLogStructure.trivial_log [compatibility]: not stated as an example; needs the full geometric constructor.
If X has trivial log structure, X_prokét=X_proét and O⁺, Ô⁺, Ô, Ô^{♭+} are Scholze's sheaves of the same names, with M=O^× and α the inclusion.

Sources: DLLZ-adic Definition 5.4.1, p. 78; DLLZ-adic Definition 5.4.1(4), p. 78; DLLZ-adic Proposition 5.4.2, p. 78.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:log-sites/log-perfectoid-almost-acyclicity
TauCeti.LogAdic.log_perfectoid_almost_acyclicity: not stated; needs the geometric carriers listed below.

Let X be a locally noetherian fs log adic space over Spa(Q_p,Z_p) and U a log affinoid perfectoid object of X_prokét with Û=Spa(R,R⁺) and tilt (R♭,R^{♭+}). (1) O⁺(U)/p^n≅R⁺/p^n, canonically almost isomorphic to (O⁺/p^n)(U), for each n>0. (2) H^i(U,O⁺/p^n) and H^i(U,Ô⁺) are almost zero for all i>0. (3) Ô⁺(U)≅R⁺, Ô(U)≅R, and Ô⁺(U) is the p-adic completion of O⁺(U). (4) Ô^{♭+}(U)≅R^{♭+} and Ô^♭(U)≅R♭. (5) H^i(U,Ô^{♭+}) is almost zero for all i>0. (6) (Theorem 5.4.4) H↦H(U) is an equivalence from finite locally free Ô|_U-modules on X_prokét/U to finite projective Ô(U)-modules, with quasi-inverse H↦(V↦H⊗_{Ô(U)}Ô(V)) on log affinoid perfectoid V over U, and H^i(X_prokét/U,H)=0 for all i>0; in particular H^i(U,Ô)=0 for i>0.

Hypotheses: Use Theorems 5.4.3–5.4.4 with their locally noetherian fs/Q_p and basis hypotheses; retain the valuation ideal defining almost mathematics. Integral statements are almost; exact statements are (3), (4), (6) and the rational vanishing.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:log-sites/log-perfectoid-basis, HodgeTateAndCanonicalSubgroups:T6:log-sites/completed-structural-log-sheaves, HodgeTateAndCanonicalSubgroups:T6:log-sites/pro-kummer-etale-site, PerfectoidSpaces:P3/almost-purity-theorem, PerfectoidSpaces:P0/almost-cech-acyclicity-criterion, EnhancedDerivedSheaves:E2, PerfectoidSpaces:P3/etale-almost-acyclicity, PerfectoidSpaces:P3/etale-site-tilting-equivalence.

Sources: DLLZ-adic Theorem 5.4.3, p. 79; DLLZ-adic Theorem 5.4.3(3), p. 79; DLLZ-adic Theorem 5.4.4, p. 80.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-padic-local-systems
TauCeti.LogAdic.KummerLisse: not stated; needs the geometric carriers listed below.

A lisse Z_p-sheaf on X_két is an inverse system L_n of locally constant finite-generated Z/p^n-module sheaves, isomorphic in the pro-category to one satisfying L_{n+1}/p^n≃L_n. Torsion is allowed. A Q_p-local system is an object of the stackification of the isogeny category, so a global Z_p lattice is not part of its definition.

Hypotheses: X a locally noetherian fs log adic space; no base field is needed for the definition. Use the finite-generated, not necessarily finite-free, convention of DLLZ Definition 6.3.1.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:log-sites/finite-kummer-descent, HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-etale-site, DiamondsAndVStacks:D0/stackification.

TauCeti.LogAdic.KummerLisse [constructor]: not stated; depends on the full geometric constructor.
The compatible locally constant torsion system, with pro-isomorphism to a strict system.

TauCeti.LogAdic.KummerLisse.reduction [projection]: not stated; depends on the full geometric constructor.
Evaluation at level n and the reduction isomorphism for a strict representative.

TauCeti.LogAdic.KummerLisse.rationalization [functoriality]: not stated; depends on the full geometric constructor.
Pass to the isogeny stack to obtain the associated Q_p-local system.

TauCeti.LogAdic.KummerLisse.morphism [characterisation]: not stated; depends on the full geometric constructor.
Morphisms are compatible pro-morphisms of torsion systems; rational morphisms are local isogeny morphisms glued in the stack.

TauCeti.LogAdic.KummerLisse.stalk [projection]: not stated; depends on the full geometric constructor.
At a log geometric point ξ̃ the stalk L_ξ̃=lim_n (L_n)_ξ̃ of a strict representative is a finitely generated Z_p-module with a continuous action of π_1^két(X,ξ̃); for a Q_p-local system, Definition 6.3.7 tests monodromy on the Q_p-stalk (L_ξ̃ of a local Z_p-representative, ⊗Q_p) under the restricted action of π_1^két(X(ξ),ξ̃), X(ξ) the strict localization with pulled-back log structure.

TauCeti.LogAdic.KummerLisse.constant_free [computation]: not stated as an example; needs the full geometric constructor.
The constant system (Z/p^n)^r realizes a free rank-r Z_p-local system.

TauCeti.LogAdic.KummerLisse.constant_torsion [non-example]: not stated as an example; needs the full geometric constructor.
The compatible constant Fp-system is permitted and is not free over Z_p.

TauCeti.LogAdic.KummerLisse.zero [degenerate]: not stated as an example; needs the full geometric constructor.
The zero system has rank zero and rationalizes to zero.

TauCeti.LogAdic.KummerLisse.torsion_rationalizes_zero [characterisation]: not stated as an example; needs the full geometric constructor.
The constant F_p-system (L_n=F_p with identity transitions) becomes zero in the isogeny category, so its associated Q_p-local system is 0, while Z_p itself rationalizes to the constant rank-one Q_p-local system.

Sources: DLLZ-adic Definition 6.3.1(1), p. 88; DLLZ-adic Definition 6.3.1(2), p. 88.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:log-sites/completed-kummer-local-systems
TauCeti.LogAdic.CompletedKummerLisse: not stated; needs the geometric carriers listed below.

Let X be a locally noetherian fs log adic space over Spa(Q_p,Z_p). On X_prokét let Ẑ_p=lim_n Z/p^n and Q̂_p=Ẑ_p[1/p]; a Ẑ_p-local system is a sheaf of Ẑ_p-modules locally isomorphic to L⊗_{Z_p}Ẑ_p for a finitely generated Z_p-module L, and Q̂_p-local systems are defined similarly. (1) L=(L_n)↦L̂=lim_n ν⁻¹(L_n) is an equivalence from Z_p-local systems on X_két to Ẑ_p-local systems on X_prokét, independent of the strict representative up to canonical isomorphism, and L̂⊗_{Ẑ_p}Q̂_p is a Q̂_p-local system. (2) R^i lim_n ν⁻¹(L_n)=0 for all i>0. (3) (Lemma 6.3.6) If ı:Z→X is a strict closed immersion of locally noetherian fs log adic spaces over Spa(Q_p,Z_p) and L̂ is a Q̂_p-local system on X_prokét, then for every log affinoid perfectoid U of X_prokét there is a canonical isomorphism (L̂⊗_{Q̂_p}Ô_X)(U)⊗_{Ô_X(U)}Ô_Z(U×_X Z)≅(ı_prokét⁻¹(L̂)⊗_{Q̂_p}Ô_Z)(U×_X Z).

Hypotheses: X locally noetherian fs over Spa(Q_p,Z_p); do not take an unrestricted inverse limit of arbitrary sheaves without acyclicity. The source asserts no equivalence for Q_p-local systems; only that L̂⊗Q̂_p is a Q̂_p-local system.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-padic-local-systems, HodgeTateAndCanonicalSubgroups:T6:log-sites/log-perfectoid-basis, HodgeTateAndCanonicalSubgroups:T6:log-sites/log-site-projections, EnhancedDerivedSheaves:E2, HodgeTateAndCanonicalSubgroups:T6:log-sites/log-perfectoid-almost-acyclicity, HodgeTateAndCanonicalSubgroups:T6:log-sites/completed-structural-log-sheaves.

TauCeti.LogAdic.CompletedKummerLisse [constructor]: not stated; depends on the full geometric constructor.
The inverse limit of ν⁻¹L_n over the completed coefficient ring.

TauCeti.LogAdic.CompletedKummerLisse.mod_pn [compatibility]: not stated; depends on the full geometric constructor.
For a strict system the nth reduction agrees with ν⁻¹L_n.

TauCeti.LogAdic.CompletedKummerLisse.equivalence [equivalence]: not stated; depends on the full geometric constructor.
Completion and reduction are quasi-inverse on the specified lisse categories.

TauCeti.LogAdic.CompletedKummerLisse.map_comp [functoriality]: not stated; depends on the full geometric constructor.
Completion preserves identity and composition of local-system morphisms.

TauCeti.LogAdic.CompletedKummerLisse.rlim_vanishing [relation]: not stated; depends on the full geometric constructor.
R^i lim_n ν⁻¹(L_n)=0 for all i>0, so L̂=R lim_n ν⁻¹(L_n) and RΓ(X_prokét,L̂)=R lim_n RΓ(X_két,L_n) (Lemma 6.3.3(2) with Proposition 5.1.7).

TauCeti.LogAdic.CompletedKummerLisse.rationalization [functoriality]: not stated; depends on the full geometric constructor.
L̂⊗_{Ẑ_p}Q̂_p is a Q̂_p-local system on X_prokét, where Q̂_p=Ẑ_p[1/p] (Lemma 6.3.3(1)).

TauCeti.LogAdic.CompletedKummerLisse.closed_pullback_completed [compatibility]: not stated; depends on the full geometric constructor.
For a strict closed immersion ı:Z→X over Spa(Q_p,Z_p), a Q̂_p-local system L̂ on X_prokét and log affinoid perfectoid U, (L̂⊗Ô_X)(U)⊗_{Ô_X(U)}Ô_Z(U×_X Z)≅(ı⁻¹L̂⊗Ô_Z)(U×_X Z) canonically (Lemma 6.3.6).

TauCeti.LogAdic.CompletedKummerLisse.constant [computation]: not stated as an example; needs the full geometric constructor.
A constant finite-generated Z_p module L completes to L⊗Z_p Ẑ_p.

TauCeti.LogAdic.CompletedKummerLisse.torsion [compatibility]: not stated as an example; needs the full geometric constructor.
The constant Fp-system completes to the constant Fp-sheaf.

TauCeti.LogAdic.CompletedKummerLisse.representative [characterisation]: not stated as an example; needs the full geometric constructor.
Pro-isomorphic strict representatives give canonically isomorphic completed local systems.

Sources: DLLZ-adic Definition 6.3.2, p. 88; DLLZ-adic Lemma 6.3.3(1), p. 88; DLLZ-adic Lemma 6.3.3, proof, p. 88; DLLZ-adic Lemma 6.3.6, p. 89; DLLZ-adic Proof of Lemma 6.3.6, p. 89.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:log-sites/geometric-boundary-monodromy
TauCeti.LogAdic.BoundaryMonodromy: component above; full geometric signature not stated.

Let k, X, D be as in Example 2.3.17 (X smooth rigid analytic over k, D a normal crossings divisor), U=X−D, and L a Q_p-local system on X_két. L|U_ét has unipotent (respectively quasi-unipotent) geometric monodromy along D if, for each geometric point ξ of D and each log geometric point ξ̃ above ξ, π_1^két(X(ξ),ξ̃) acts unipotently (respectively quasi-unipotently: an open subgroup acts unipotently) on the stalk L_ξ̃, where the strict localization X(ξ) carries the log structure pulled back from X. At a geometric point ξ where exactly r local branches of D meet, π_1^két(X(ξ))≅Hom(M̄^gp_ξ,Ẑ′(1))≅Ẑ′(1)^r (Corollary 4.4.22; Ẑ′(1)=Ẑ(1) when char k=0), a commuting product of one inertia factor per local branch; in the setting of Example 6.3.8 (each X_J smooth and geometrically connected), the branches at a point of the stratum U_J are the components D_j, j∈J, and this is Ẑ′(1)^J≅Γ^J. It suffices to test geometric points over the smooth locus of D (Lemma 6.3.11). For an irreducible component Z of D, L|U_ét has unipotent (respectively quasi-unipotent) geometric monodromy along Z if, at every geometric point ξ of Z lying over the smooth locus of D (so J={Z} and π_1^két(X(ξ))≅Ẑ′(1)), this inertia acts unipotently (respectively quasi-unipotently) on L_ξ̃; equivalently, by the specialization argument of Lemma 6.3.11, at every geometric point ξ of Z the factors of π_1^két(X(ξ)) indexed by the local branches of Z at ξ do. L|U_ét has unipotent (respectively quasi-unipotent) geometric monodromy along D if and only if it does along every irreducible component of D (Lemma 6.3.11, Remark 6.3.13).

Hypotheses: This is geometric inertia, not the whole arithmetic Galois group. X, D, k as in Example 2.3.17 (normal crossings, not necessarily strict); L a Q_p-local system on X_két; when char k=0 and k⁺=O_k (the setting of Theorem 4.6.1, assumed by Corollary 6.3.4), equivalently, by Corollary 6.3.4's extension statement, a Q_p-local system on U_ét.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-padic-local-systems, HodgeTateAndCanonicalSubgroups:T6:log-sites/finite-kummer-descent, HodgeTateAndCanonicalSubgroups:T6:log-sites/all-root-toric-tower, HodgeTateAndCanonicalSubgroups:T6:log-sites/divisorial-analytic-log, ClassicalAdicEtaleCohomology:H0.

TauCeti.LogAdic.BoundaryMonodromy [constructor]: component above; full contract follows.
The geometric inertia action with its specified log geometric stalk.

TauCeti.LogAdic.BoundaryMonodromy.logarithm [data]: component above; full contract follows.
For a unipotent generator, its finite logarithm is nilpotent; commuting generators give commuting logarithms.

TauCeti.LogAdic.BoundaryMonodromy.smooth_locus [characterisation]: not stated; depends on the full geometric constructor.
Unipotence/quasi-unipotence can be checked on the smooth part of each boundary component.

TauCeti.LogAdic.BoundaryMonodromy.tensor [compatibility]: component above; full contract follows.
Tensor and dual of unipotent boundary local systems remain unipotent.

TauCeti.LogAdic.BoundaryMonodromy.unipotent_along [characterisation]: component above; full contract follows.
For an irreducible component Z of D: unipotence (quasi-unipotence) of the inertia Ẑ′(1) at geometric points of Z over the smooth locus of D; L|U has unipotent geometric monodromy along D iff it has along every component. This defines n_Z in DLLZ-RH Theorem 3.2.3(4).

TauCeti.LogAdic.BoundaryMonodromy.trivial [degenerate]: component example above; full test follows.
The constant local system has zero logarithm and unipotent inertia.

TauCeti.LogAdic.BoundaryMonodromy.jordan [computation]: component example above; full test follows.
For U=[[1,1],[0,1]], log U=[[0,1],[0,0]] and its square is zero.

TauCeti.LogAdic.BoundaryMonodromy.finite_character [non-example]: component example above; full test follows.
A rank-one local system given by a finite-order character whose restriction to π_1^két(X(ξ)) is nontrivial for some geometric point ξ of D (e.g. the quadratic character of adjoining √T on the closed unit disc with D={T=0}, char k≠2) has quasi-unipotent but not unipotent geometric monodromy along D; a nontrivial finite-order character that is trivial on all these inertia groups has unipotent monodromy.

TauCeti.LogAdic.BoundaryMonodromy.componentwise [characterisation]: component example above; full test follows.
On X=D² over k with char k≠2 and D=Z₁∪Z₂, Z_i={T_i=0}, the rank-one Kummer local system on which γ₁ acts trivially and γ₂ by −1 (from adjoining √T₂) has unipotent geometric monodromy along Z₁ but not along Z₂, hence not along D.

Sources: DLLZ-adic Definition 6.3.7, p. 89; DLLZ-adic §6.3, before Definition 6.3.7, p. 89; DLLZ-adic Example 6.3.8, p. 90; DLLZ-adic Lemma 6.3.11, p. 90; DLLZ-adic Remark 6.3.13, p. 91; DLLZ-RH Theorem 3.2.3(4), p. 25.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:comparison/toric-kummer-cohomology
TauCeti.LogAdic.toric_kummer_cohomology: not stated; needs the geometric carriers listed below.

Let k be a perfectoid field of characteristic zero and residue characteristic p containing all roots of unity, k⁺=O_k, P a sharp fs monoid, V=Spa(S₁,S₁⁺) a log smooth affinoid fs log adic space over Spa(k,k⁺) with a toric chart V→E=Spa(k⟨P⟩,k⁺⟨P⟩), n=dim V, and L an F_p-local system on V_két. (1) H^i(V_két,L⊗_{F_p}O⁺_V/p) is almost zero for all i>n. (2) If V′⊂V is a rational subset strictly contained in V (the closure of V′ lies in V), the image of H^i(V_két,L⊗O⁺_V/p)→H^i(V′_két,L⊗O⁺_V/p) is an almost finitely generated k⁺-module for each i≥0. (3) (Lemma 6.1.7) Fix any r≥0 (independent of n=dim V). For Γ=Hom(P^gp,Ẑ(1)) and a k⁺/p^r-module M on which Γ acts through a primitive character χ:Γ→μ_m, every H^i(Γ,M) is killed by ζ_m−1 for any primitive m-th root of unity ζ_m; if moreover M≅M₀⊗_{k₀⁺/p^r}k⁺/p^r as Γ-modules for a finite extension k₀ of Q_p(μ_m) in k, a finitely generated k₀⁺/p^r-algebra T₀ and a finite T₀-module M₀, then H^i(Γ,M) is a finitely presented T₀⊗_{k₀⁺/p^r}k⁺/p^r-module.

Hypotheses: Strict containment means closure(V′)⊂V. For Lemma 6.1.7 the finite-presentation assertion requires its finite coefficient model. k perfectoid over Q_p: DLLZ-adic Proposition 6.1.1 assumes only that k has characteristic zero and contains all roots of unity, but its proof uses that Ẽ is log affinoid perfectoid, which needs k perfectoid (see sourceIssues); Theorem 6.2.1 applies it with k algebraically closed. Almost mathematics is with respect to the maximal ideal of O_k.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:log-sites/all-root-toric-tower, HodgeTateAndCanonicalSubgroups:T6:log-sites/log-perfectoid-almost-acyclicity, HodgeTateAndCanonicalSubgroups:T6:log-sites/finite-kummer-descent, HodgeTateAndCanonicalSubgroups:T6:log-sites/log-site-projections, PerfectoidSpaces:P0/almost-faithfully-flat-descent, PadicHodgeTheory:P8, ClassicalAdicEtaleCohomology:H0, PerfectoidSpaces:P0/almost-finitely-generated-and-presented.

Sources: DLLZ-adic Proposition 6.1.1, p. 81; DLLZ-adic Proposition 6.1.1(1), p. 81; DLLZ-adic Proposition 6.1.1(2), p. 81; DLLZ-adic Lemma 6.1.7, p. 83.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:comparison/proper-log-almost-finiteness
TauCeti.LogAdic.proper_log_almost_finiteness: not stated; needs the geometric carriers listed below.

Let (k,k⁺) be an affinoid field with k algebraically closed of characteristic zero and residue characteristic p, X a proper log smooth fs log adic space over Spa(k,k⁺) and L an F_p-local system on X_két. Then H^i(X_két,L⊗_{F_p}O⁺_X/p) is an almost finitely generated k⁺-module for each i≥0 and is almost zero for i sufficiently large. Almost mathematics is with respect to the maximal ideal m_k of O_k (contained in k⁺). This is an integral almost statement, not finite generation or vanishing before almost localization.

Hypotheses: Properness and log smoothness are both required; arbitrary open affinoids are excluded. k is over Q_p: the source states only 'characteristic zero', but the proof uses log affinoid perfectoid objects, which live over Spa(Z_p,Z_p) (see sourceIssues).

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:comparison/toric-kummer-cohomology, HodgeTateAndCanonicalSubgroups:T6:log-sites/all-root-toric-tower, HodgeTateAndCanonicalSubgroups:T6:log-sites/log-perfectoid-basis, HodgeTateAndCanonicalSubgroups:T6:log-sites/log-site-projections, PadicHodgeTheory:P8, DiamondsAndVStacks:D0/cech-to-derived-comparison, PerfectoidSpaces:P0/almost-finitely-generated-and-presented.

Sources: DLLZ-adic Theorem 6.2.1, p. 85; DLLZ-adic Theorem 6.2.1(1), p. 85; DLLZ-adic Lemma 6.2.4, p. 86; DLLZ-adic Proof of Theorem 6.2.1(1), p. 86.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:comparison/log-primitive-comparison
TauCeti.LogAdic.log_primitive_comparison: not stated; needs the geometric carriers listed below.

For proper log smooth fs X over Spa(k,k⁺), k algebraically closed of characteristic zero and residue characteristic p, and an F_p-local system L on X_két, the canonical map H^i(X_két,L)⊗_{F_p}(k⁺/p)→H^i(X_két,L⊗_{F_p}O⁺_X/p) is an almost isomorphism of k⁺-modules for every i≥0. Transport along ν gives the matching pro-Kummer formulation. Its properness hypothesis is retained by every finite-level application.

Hypotheses: DLLZ Theorem 6.2.1; no SNC assumption is needed for the comparison itself.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:comparison/proper-log-almost-finiteness, HodgeTateAndCanonicalSubgroups:T6:log-sites/log-perfectoid-almost-acyclicity, HodgeTateAndCanonicalSubgroups:T6:log-sites/completed-structural-log-sheaves, HodgeTateAndCanonicalSubgroups:T6:log-sites/log-perfectoid-basis, HodgeTateAndCanonicalSubgroups:T6:log-sites/log-site-projections, PadicHodgeTheory:P8.

Sources: DLLZ-adic §6.2 and Theorem 6.2.1(2), p. 85; DLLZ-adic Proof of Theorem 6.2.1(2), p. 87; DLLZ-adic Proof of Theorem 6.2.1(2), p. 87.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:comparison/log-cohomology-finite-vanishing
TauCeti.LogAdic.log_cohomology_finite_vanishing: not stated; needs the geometric carriers listed below.

Let k be algebraically closed of characteristic zero and residue characteristic p. (1) Under the hypotheses of Theorem 6.2.1 (X proper log smooth fs over Spa(k,k⁺), L an F_p-local system on X_két), H^i(X_két,L) is a finite-dimensional F_p-vector space for each i≥0 and vanishes for i sufficiently large. (2) If moreover X is a smooth rigid analytic variety with the log structure of a normal crossings divisor (Example 2.3.17), H^i(X_két,L)=0 for i>2 dim X. (3) (Corollary 6.2.3) If U is a smooth rigid analytic variety over k that is Zariski open in a proper rigid analytic variety, then H^i(U_ét,L) is finite-dimensional for each F_p-local system L on U_ét and each i≥0, and H^i(U_ét,L)=0 for i>2 dim U.

Hypotheses: The 2 dim bound is the normal crossings case; neither it nor finiteness is asserted for arbitrary nonproper rigid spaces. In (3) the compactification is a hypothesis on U (Zariski open in a proper rigid space); resolution of singularities then supplies a smooth compactification with normal crossings boundary.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:comparison/log-primitive-comparison, HodgeTateAndCanonicalSubgroups:T6:comparison/proper-log-almost-finiteness, HodgeTateAndCanonicalSubgroups:T6:comparison/toric-kummer-cohomology, HodgeTateAndCanonicalSubgroups:T6:log-sites/boundary-local-system-extension, HodgeTateAndCanonicalSubgroups:T6:log-sites/divisorial-analytic-log, ClassicalAdicEtaleCohomology:H0, AdicSpacesPartII:R4/smooth-pair.

Sources: DLLZ-adic Theorem 6.2.1, consequences, p. 85; DLLZ-adic Theorem 6.2.1, last sentence, p. 85; DLLZ-adic Remark 6.2.2, p. 85; DLLZ-adic Corollary 6.2.3, p. 85.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:comparison/proper-padic-boundary-cohomology
TauCeti.LogAdic.proper_padic_boundary_cohomology: not stated; needs the geometric carriers listed below.

Let k be a complete nonarchimedean extension of Q_p with k⁺=O_k, X a smooth rigid analytic variety over k with a normal crossings divisor D and its log structure (Example 2.3.17), U=X−D and j:U→X; k̄ denotes a completed algebraic closure of k. (1) For an étale Z_p-local system L on U_ét (torsion allowed), L̄=j_két,*(L) is a Kummer étale Z_p-local system on X_két extending L, and every Kummer étale Z_p-local system on X_két is of this form; the first comparison H^i(U_{k̄,ét},L)≅H^i(X_{k̄,két},L̄) holds levelwise by Theorem 4.6.1. Neither statement needs properness. (2) If X is proper, there are canonical isomorphisms H^i(U_{k̄,ét},L)≅H^i(X_{k̄,két},L̄)≅H^i(X_{k̄,prokét},L̄^) of finite Z_p-modules for each i≥0. This is the corrected form of DLLZ-adic Corollary 6.3.4 recorded in source issue E1: the printed corollary has no properness hypothesis.

Hypotheses: Properness of X is added (source issue E1) for the finiteness and for the second isomorphism read with H^i(X_két,L̄)=lim_n H^i(X_két,L̄_n), whose proof needs lim^1_n H^{i−1}(X_két,L̄_n)=0; torsion Z_p-local systems are permitted. Over k̄ the hypotheses of Theorem 6.2.1 hold for X_{k̄} (proper log smooth over an algebraically closed field over Q_p).

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:comparison/log-cohomology-finite-vanishing, HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-padic-local-systems, HodgeTateAndCanonicalSubgroups:T6:log-sites/completed-kummer-local-systems, HodgeTateAndCanonicalSubgroups:T6:log-sites/boundary-local-system-extension, HodgeTateAndCanonicalSubgroups:T6:log-sites/log-site-projections, EnhancedDerivedSheaves:E2.

Sources: DLLZ-adic Corollary 6.3.4, p. 88; DLLZ-adic Corollary 6.3.4, p. 88; DLLZ-adic Corollary 6.3.4, p. 88; DLLZ-adic Proof of Corollary 6.3.4, p. 88.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:comparison/kummer-proper-pushforward-local-systems
TauCeti.LogAdic.kummer_proper_pushforward_local_systems: not stated; needs the geometric carriers listed below.

Let k be a nonarchimedean field of characteristic zero with k⁺=O_k, and let f:X→Y be a log smooth morphism of log adic spaces, where X and Y are smooth rigid analytic varieties over k whose log structures are defined by normal crossings divisors D⊂X and E⊂Y as in Example 2.3.17. Assume that the underlying morphisms of adic spaces of f and of f|_{X−D}:X−D→Y−E are both proper. Then, for every Z_p-local system L on X_két and every i≥0, R^if_két,*(L) is a Z_p-local system on Y_két.

Hypotheses: Both properness hypotheses are those of DLLZ-adic Corollary 6.3.5 and are kept; the proof uses properness of f|_{X−D} (to get X−D=f⁻¹(Y−E) and to apply SW Theorem 10.5.1) and separatedness of f. No claim is made that either hypothesis is necessary. The characteristic-zero, k⁺=O_k setting is that of Theorem 4.6.1 and Corollary 6.3.4, which the proof uses; the source states only the setting of Example 2.3.17. Only the extension statements of Corollary 6.3.4 are used, which hold without properness (source issue E1), so the corollary is unaffected by E1.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:comparison/proper-padic-boundary-cohomology, HodgeTateAndCanonicalSubgroups:T6:log-sites/boundary-local-system-extension, HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-padic-local-systems, HodgeTateAndCanonicalSubgroups:T6:log-sites/log-smooth-chart-criterion, HodgeTateAndCanonicalSubgroups:T6:log-sites/divisorial-analytic-log, ClassicalAdicEtaleCohomology:H0.

Sources: DLLZ-adic Corollary 6.3.5, p. 89; DLLZ-adic Corollary 6.3.5, p. 89; DLLZ-adic Corollary 6.3.5, p. 89; DLLZ-adic Proof of Corollary 6.3.5, p. 89.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:comparison/constant-log-periods
TauCeti.LogAdic.LogConstantPeriods: component above; full geometric signature not stated.

Let X be a locally noetherian fs log adic space over Spa(Q_p,Z_p), with Ô⁺, Ô and Ô^{♭+}=lim_Φ Ô⁺ on X_prokét. Set A_inf=W(Ô^{♭+}), B_inf=A_inf[1/p] with θ:B_inf→Ô, B_dR⁺=lim_r B_inf/(ker θ)^r with Fil^r B_dR⁺=(ker θ)^r B_dR⁺, and B_dR=B_dR⁺[t⁻¹] for any local generator t of (ker θ)B_dR⁺, with Fil^r B_dR=∑_{s≥−r} t^{−s}Fil^{r+s}B_dR⁺ (Definition 2.2.3). For every log affinoid perfectoid U∈X_prokét with associated perfectoid space Û=Spa(R,R⁺) the canonical maps are isomorphisms A_inf(U)≅A_inf(R,R⁺)=W(R^{♭+}), B_inf(U)≅B_inf(R,R⁺), B_dR⁺(U)≅B_dR⁺(R,R⁺), B_dR(U)≅B_dR(R,R⁺), and H^j(U,B_dR⁺)=H^j(U,B_dR)=0 for all j>0 (Proposition 2.2.4). Hence t exists locally and is a nonzerodivisor, so B_dR and its filtration are well defined and independent of t (Remark 2.2.5). If X lies over a perfectoid field containing all roots of unity, gr^•B_dR≅⊕_{r∈Z}Ô(r) (Corollary 2.2.6). These are the ordinary period functors applied on X_prokét; no new local period ring is defined.

Hypotheses: X is a locally noetherian fs log adic space over Spa(Q_p,Z_p) (Definition 2.2.3); no log smoothness and no p-adic base field is needed for the definitions or for Proposition 2.2.4. The evaluation and acyclicity are asserted only on log affinoid perfectoid objects U of X_prokét (DLLZ-adic Definition 5.3.1), via the associated perfectoid pair (R,R⁺). The Tate-twisted identification gr^r B_dR≅Ô(r) keeps the hypothesis of Corollary 2.2.6 (X over a perfectoid field containing all roots of unity); without it only gr^r B_dR(R,R⁺)≅ξ^rR ((2.2.2)) is asserted sectionwise. Sectionwise the pinned Mathlib carrier BDeRhamPlus is used with its own hypotheses (p prime, p not a unit, p-adically complete ring), applied to R⁺.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:log-sites/completed-structural-log-sheaves, HodgeTateAndCanonicalSubgroups:T6:log-sites/log-perfectoid-almost-acyclicity, HodgeTateAndCanonicalSubgroups:T6:log-sites/log-affinoid-perfectoid, HodgeTateAndCanonicalSubgroups:T6:log-sites/log-perfectoid-basis, PadicHodgeTheory:P8:local-rational/period-sheaves-definitions, PadicHodgeTheory:P8:local-rational/period-sheaves-on-affinoid-perfectoids, PadicHodgeTheory:P8:local-rational/rational-acyclicity-of-de-rham-period-sheaves, PadicHodgeTheory:P8:local-rational/de-rham-period-sheaf, PadicHodgeTheory:P8:local-rational/graded-de-rham-period-sheaf-tate-twist, mathlib:BDeRhamPlus, mathlib:fontaineThetaInvertP.

TauCeti.LogAdic.LogConstantPeriods [constructor]: component above; full contract follows.
The sheaves A_inf, B_inf, B_dR⁺, B_dR on X_prokét obtained from Ô^{♭+} by the ordinary period functors, with θ and the filtrations of Definition 2.2.3.

TauCeti.LogAdic.LogConstantPeriods.theta [projection]: component above; full contract follows.
θ:A_inf→Ô⁺, and its p-inverted and completed versions θ:B_inf→Ô, θ:B_dR⁺→Ô, surjective with kernel Fil¹.

TauCeti.LogAdic.LogConstantPeriods.fil [structure]: not stated; depends on the full geometric constructor.
Fil^r B_dR⁺=(ker θ)^r B_dR⁺ and Fil^r B_dR=∑_{s≥−r}t^{−s}Fil^{r+s}B_dR⁺; decreasing, separated and complete, independent of the local generator t.

TauCeti.LogAdic.LogConstantPeriods.grade [compatibility]: not stated; depends on the full geometric constructor.
If X lies over a perfectoid field containing all roots of unity, gr^r B_dR≅Ô(r) canonically for all r∈Z (Corollary 2.2.6); sectionwise gr^r B_dR(R,R⁺)≅ξ^rR in general.

TauCeti.LogAdic.LogConstantPeriods.sections [compatibility]: not stated; depends on the full geometric constructor.
For a log affinoid perfectoid U with associated perfectoid Û=Spa(R,R⁺): A_inf(U)≅W(R^{♭+}), B_inf(U)≅W(R^{♭+})[1/p], B_dR⁺(U)≅B_dR⁺(R,R⁺) and B_dR(U)≅B_dR(R,R⁺), compatibly with θ and filtrations (Proposition 2.2.4(1)).

TauCeti.LogAdic.LogConstantPeriods.acyclic_log_affinoid_perfectoid [other]: not stated; depends on the full geometric constructor.
For a log affinoid perfectoid U, H^j(U,B_dR⁺)=H^j(U,B_dR)=0 for all j>0 (Proposition 2.2.4(2)).

TauCeti.LogAdic.LogConstantPeriods.closed_restriction_surjective [compatibility]: not stated; depends on the full geometric constructor.
For a strict closed immersion ı:Z→X, B_dR,X⁺→ı_{prokét,*}B_dR,Z⁺ is surjective, already on sections over every log affinoid perfectoid U (Corollary 2.2.7).

TauCeti.LogAdic.LogConstantPeriods.trivial_log [compatibility]: not stated as an example; needs the full geometric constructor.
For the trivial log structure, under X_prokét≃X_proét these sheaves, θ and filtrations are P8's A_inf, B_inf, B_dR⁺, B_dR.

TauCeti.LogAdic.LogConstantPeriods.grade_zero [computation]: not stated as an example; needs the full geometric constructor.
θ induces B_dR⁺/Fil¹B_dR⁺≅Ô; on a log affinoid perfectoid U this is B_dR⁺(R,R⁺)/ξ≅R.

TauCeti.LogAdic.LogConstantPeriods.not_integral_completion [non-example]: not stated as an example; needs the full geometric constructor.
(lim_r A_inf(R,R⁺)/ξ^r)[1/p]=A_inf(R,R⁺)[1/p] is not B_dR⁺(R,R⁺): the convergent series ∑_{n≥0}p^{−n}ξ^n lies in B_dR⁺(R,R⁺) but not in A_inf(R,R⁺)[1/p].

TauCeti.LogAdic.LogConstantPeriods.point_values [degenerate]: not stated as an example; needs the full geometric constructor.
For X=Spa(K,O_K) with K a perfectoid field and trivial log structure, U=X is log affinoid perfectoid and B_dR⁺(U)=B_dR⁺(K,O_K), Fontaine's ring, with Fil^r=ξ^rB_dR⁺(K,O_K).

Sources: DLLZ-RH Definition 2.2.3(2), p. 12; DLLZ-RH Proposition 2.2.4(1)–(2), p. 12; DLLZ-RH Remark 2.2.5, p. 12; DLLZ-RH Corollary 2.2.6, p. 12.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:comparison/structural-log-period-plus
TauCeti.LogAdic.StructuralLogPeriodPlus: component above; full geometric signature not stated.

Let X be a locally noetherian fs log adic space over Spa(k,k⁺) (k of characteristic 0, residue field κ of characteristic p). For a log affinoid perfectoid U=lim_{i∈I}U_i∈X_prokét with U_i=(Spa(R_i,R_i⁺),M_i,α_i) and associated perfectoid pair (R,R⁺), put M_i=M_i(U_i), M=colim_iM_i=M(U) and M♭=lim_{a↦pa}M=M♭(U), with α♭:M♭→R♭. For r≥1, S_{i,r} is the quotient of the monoid algebra (R_i⊗̂_{W(κ)}(W(R^{♭+})/ξ^r))[M_i×_M M♭] by the elements α_i(a′)⊗1−(1⊗[α♭(a″)])e_a for a=(a′,a″) (equation (2.2.8)); [α♭(a″)]∈W(R^{♭+})[1/p]/ξ^r acts because p is invertible in R_i. The map θ_log:S_{i,r}→R induced by R_i→R and θ with θ_log(e_a)=1 is well defined since θ([α♭(a″)])=α_i(a′) ((2.2.9)). Put Ŝ_i=lim_{r,s}S_{i,r}/(ker θ_log)^s; colim_iŜ_i depends only on U. OB⁺_dR,log is the sheaf on X_prokét associated with U↦colim_iŜ_i on the log affinoid perfectoid basis, with θ_log:OB⁺_dR,log→Ô and Fil^rOB⁺_dR,log=(ker θ_log)^rOB⁺_dR,log (Definition 2.2.10(1)). It is an O_{X_prokét}-algebra and a filtered B_dR⁺-algebra.

Hypotheses: X is a locally noetherian fs log adic space over Spa(k,k⁺), k nonarchimedean of characteristic 0 with residue characteristic p (DLLZ-RH §2); the source applies the sheaf only to X log smooth over a p-adic field or to strata with induced log structure (Remark 2.2.12). The completed tensor product is over W(κ), which uses W(κ)-algebra structures on R_i and W(R^{♭+}); these exist when κ is perfect, in particular over p-adic fields. The relation is α_i(a′)=[α♭(a″)]e_a, imposed without inverting α_i(a′) or [α♭(a″)]; where α♭(a″)=0 it reduces to α_i(a′)=0 and leaves e_a free (DLLZ-RH p. 18).

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:log-sites/integral-adic-chart, HodgeTateAndCanonicalSubgroups:T6:log-sites/completed-structural-log-sheaves, HodgeTateAndCanonicalSubgroups:T6:comparison/constant-log-periods, HodgeTateAndCanonicalSubgroups:T6:log-sites/log-affinoid-perfectoid, HodgeTateAndCanonicalSubgroups:T6:log-sites/log-perfectoid-basis, mathlib:AdicCompletion, AdicSpacesPartII:R0/completed-tensor-product.

TauCeti.LogAdic.StructuralLogPeriodPlus [constructor]: component above; full contract follows.
The sheafification of U↦colim_iŜ_i on log affinoid perfectoid objects, with θ_log and the filtration Fil^r=(ker θ_log)^r.

TauCeti.LogAdic.StructuralLogPeriodPlus.theta_generator [simp]: not stated; depends on the full geometric constructor.
θ_log(e_a)=1 for every a∈M_i×_M M♭.

TauCeti.LogAdic.StructuralLogPeriodPlus.structural_relation [relation]: component above; full contract follows.
α_i(a′)=[α♭(a″)]e_a in S_{i,r}, hence in OB⁺_dR,log, for a=(a′,a″).

TauCeti.LogAdic.StructuralLogPeriodPlus.presentation_invariance [equivalence]: not stated; depends on the full geometric constructor.
Cofinal changes of the pro-presentation of U induce canonical filtered isomorphisms of colim_iŜ_i.

TauCeti.LogAdic.StructuralLogPeriodPlus.theta_surjective [projection]: not stated; depends on the full geometric constructor.
θ_log:OB⁺_dR,log→Ô is surjective with kernel Fil¹OB⁺_dR,log.

TauCeti.LogAdic.StructuralLogPeriodPlus.bdr_algebra [structure]: not stated; depends on the full geometric constructor.
The filtered B_dR⁺-algebra structure induced by W(R^{♭+})/ξ^r→S_{i,r}; θ_log restricts to θ on B_dR⁺.

TauCeti.LogAdic.StructuralLogPeriodPlus.structure_algebra [structure]: not stated; depends on the full geometric constructor.
The O_{X_prokét}-algebra structure induced by R_i→S_{i,r}; θ_log restricts to O_{X_prokét}→Ô.

TauCeti.LogAdic.StructuralLogPeriodPlus.pullback [functoriality]: not stated; depends on the full geometric constructor.
A morphism f:X→Y of locally noetherian fs log adic spaces over Spa(k,k⁺) induces a filtered map f_prokét⁻¹OB⁺_dR,log,Y→OB⁺_dR,log,X compatible with θ_log, the e_a and the B_dR⁺-structures, with map_id and map_comp.

TauCeti.LogAdic.StructuralLogPeriodPlus.rank_zero [compatibility]: not stated as an example; needs the full geometric constructor.
For the trivial log structure, under X_prokét≃X_proét, OB⁺_dR,log is filtered isomorphic to P8's corrected OB_dR⁺, each e_a being α_i(a′)[α♭(a″)]⁻¹.

TauCeti.LogAdic.StructuralLogPeriodPlus.theta [computation]: not stated as an example; needs the full geometric constructor.
θ_log induces OB⁺_dR,log/Fil¹≅Ô.

TauCeti.LogAdic.StructuralLogPeriodPlus.boundary_relation [non-example]: component example above; full test follows.
If α♭(a″)=0 (a boundary coordinate vanishing on the stratum), the relation gives α_i(a′)=0 and imposes no constraint on e_a; the relation is not rewritten as e_a=α_i(a′)/[α♭(a″)].

Sources: DLLZ-RH Equation (2.2.8) and following, p. 13; DLLZ-RH Equation (2.2.9), p. 13; DLLZ-RH Definition 2.2.10(1), p. 13; DLLZ-RH Remark 2.2.12, p. 14.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:comparison/structural-log-period-complete
TauCeti.LogAdic.StructuralLogPeriod: not stated; needs the geometric carriers listed below.

Let t be a local generator of Fil¹B_dR⁺ as in Definition 2.2.3(2). On OB⁺_dR,log[t⁻¹] put Fil^r=∑_{s≥−r}t^{−s}Fil^{r+s}OB⁺_dR,log (Definition 2.2.10(2)). OB_dR,log is the completion of OB⁺_dR,log[t⁻¹] for this filtration: Fil^rOB_dR,log=lim_{s≥0}Fil^r(OB⁺_dR,log[t⁻¹])/Fil^{r+s}(OB⁺_dR,log[t⁻¹]) and OB_dR,log=∪_{r∈Z}Fil^rOB_dR,log (Definition 2.2.10(3)); OC_log=gr⁰OB_dR,log. Fil⁰OB_dR,log is a sheaf of rings and OB_dR,log=(Fil⁰OB_dR,log)[t⁻¹]. In general OB_dR,log≠OB⁺_dR,log[t⁻¹], already for the trivial log structure, where OB_dR,log differs from the uncompleted OB_dR of Brinon and Scholze (Remark 2.2.11).

Hypotheses: X is as for OB⁺_dR,log (locally noetherian fs over Spa(k,k⁺)). The additional completion of Definition 2.2.10(3) is part of the definition; the filtration is the convolution filtration, not the t-adic filtration alone, and it does not depend on the choice of local generator t.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:comparison/structural-log-period-plus, HodgeTateAndCanonicalSubgroups:T6:comparison/constant-log-periods.

TauCeti.LogAdic.StructuralLogPeriod [constructor]: not stated; depends on the full geometric constructor.
The filtration completion of OB⁺_dR,log[t⁻¹], with its filtration pieces and OC_log=gr⁰.

TauCeti.LogAdic.StructuralLogPeriod.completion_map [projection]: not stated; depends on the full geometric constructor.
The filtered map from OB⁺_dR,log[t⁻¹] into its filtration completion.

TauCeti.LogAdic.StructuralLogPeriod.grade [compatibility]: not stated; depends on the full geometric constructor.
The completion map induces isomorphisms on all gr^r.

TauCeti.LogAdic.StructuralLogPeriod.complete_piece [characterisation]: not stated; depends on the full geometric constructor.
Each Fil^r is the inverse limit of its Fil^r/Fil^{r+s} quotients, s≥0.

TauCeti.LogAdic.StructuralLogPeriod.fil_zero_ring [structure]: not stated; depends on the full geometric constructor.
Fil⁰OB_dR,log is a sheaf of rings, Fil^r·Fil^s⊂Fil^{r+s}, and OB_dR,log=(Fil⁰OB_dR,log)[t⁻¹].

TauCeti.LogAdic.StructuralLogPeriod.oc_log [projection]: not stated; depends on the full geometric constructor.
OC_log=gr⁰OB_dR,log, an Ô-algebra receiving Fil⁰OB_dR,log.

TauCeti.LogAdic.StructuralLogPeriod.bdr_algebra [structure]: not stated; depends on the full geometric constructor.
The filtered B_dR-algebra map B_dR→OB_dR,log extending B_dR⁺→OB⁺_dR,log.

TauCeti.LogAdic.StructuralLogPeriod.t_independent [characterisation]: not stated; depends on the full geometric constructor.
The filtration and the completion do not depend on the local generator t of Fil¹B_dR⁺.

TauCeti.LogAdic.StructuralLogPeriod.zero_log [compatibility]: not stated as an example; needs the full geometric constructor.
For the trivial log structure OB_dR,log is the filtration completion of P8's OB_dR⁺[t⁻¹] and contains the series of cauchy_sum, which is not in OB_dR⁺[t⁻¹]; it is not the uncompleted OB_dR.

TauCeti.LogAdic.StructuralLogPeriod.cauchy_sum [computation]: not stated as an example; needs the full geometric constructor.
In the local one-variable model with W=y/t, ∑_{n≥0}t^nW^{n²} converges in Fil⁰=B_dR⁺{W} for the coefficientwise t-adic completion.

TauCeti.LogAdic.StructuralLogPeriod.localization_insufficient [non-example]: not stated as an example; needs the full geometric constructor.
The same series has y^{n²}-coefficient t^{n−n²}, with unbounded negative t-valuations, and hence is not in B_dR⁺[[y]][1/t]; its inclusion requires the additional filtration completion.

Sources: DLLZ-RH Definition 2.2.10(3) and the note after it, p. 13; DLLZ-RH Remark 2.2.11, p. 13.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:comparison/structural-period-connection
TauCeti.LogAdic.StructuralLogConnection: not stated; needs the geometric carriers listed below.

For a log affinoid perfectoid U=lim U_i and r≥1 there is a unique B_dR⁺(U)/ξ^r-linear log connection ∇:S_{i,r}→S_{i,r}⊗_{R_i}Ω^log_X(U_i) extending d:R_i→Ω^log_X(U_i) and δ:M_i→Ω^log_X(U_i) with ∇(e_a)=e_aδ(a′) for a=(a′,a″)∈M_i×_M M♭ ((2.2.13)–(2.2.14)); it satisfies ∇((ker θ_log)^s)⊂(ker θ_log)^{s−1}⊗_{R_i}Ω^log_X(U_i) for s≥1. Completing, taking the limit over r and the colimit over i gives a B_dR⁺-linear log connection ∇:OB⁺_dR,log→OB⁺_dR,log⊗_{O_{X_prokét}}Ω^log_X ((2.2.15)); it extends B_dR-linearly to OB⁺_dR,log[t⁻¹] with ∇(Fil^r)⊂Fil^{r−1}⊗Ω^log_X ((2.2.16)), and to OB_dR,log with ∇(Fil^rOB_dR,log)⊂Fil^{r−1}OB_dR,log⊗_{O_{X_prokét}}Ω^log_X for all r∈Z ((2.2.17)). The connection is integrable. In the toric coordinates of §2.3, ∇y_j=δ(a_j) and ∇W_j=t⁻¹δ(a_j) ((2.4.3)–(2.4.4)).

Hypotheses: X is as for OB⁺_dR,log (locally noetherian fs over Spa(k,k⁺)); Ω^log_X is the sheaf of log differentials of DLLZ-adic Definition 3.3.6, pulled back to X_prokét; it is a vector bundle when X is as in Remark 2.4.1. The connection is B_dR⁺-linear (B_dR-linear after inverting t), not O_{X_prokét}-linear; it satisfies the log Leibniz rule for (d,δ).

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:comparison/structural-log-period-complete, HodgeTateAndCanonicalSubgroups:T6:comparison/structural-log-period-plus, HodgeTateAndCanonicalSubgroups:T6:log-sites/continuous-log-derivation, HodgeTateAndCanonicalSubgroups:T6:log-sites/log-differential-descent, HodgeTateAndCanonicalSubgroups:T6:log-sites/analytic-log-de-rham.

TauCeti.LogAdic.StructuralLogConnection [constructor]: not stated; depends on the full geometric constructor.
The continuous B_dR-linear log connection on OB_dR,log restricting to the B_dR⁺-linear one on OB⁺_dR,log.

TauCeti.LogAdic.StructuralLogConnection.generator [simp]: not stated; depends on the full geometric constructor.
∇e_a=e_aδ(a′) for a=(a′,a″)∈M_i×_M M♭.

TauCeti.LogAdic.StructuralLogConnection.transverse [compatibility]: not stated; depends on the full geometric constructor.
∇(Fil^r)⊂Fil^{r−1}⊗Ω^log_X on OB⁺_dR,log, OB⁺_dR,log[t⁻¹] and OB_dR,log.

TauCeti.LogAdic.StructuralLogConnection.integrable [relation]: not stated; depends on the full geometric constructor.
∇∘∇=0 on the associated log de Rham complex OB_dR,log⊗Ω^{log,•}_X.

TauCeti.LogAdic.StructuralLogConnection.leibniz [relation]: not stated; depends on the full geometric constructor.
∇(fx)=f∇x+x⊗df for f∈O_{X_prokét}, and ∇ restricted to O_{X_prokét} is d.

TauCeti.LogAdic.StructuralLogConnection.bdr_linear [compatibility]: not stated; depends on the full geometric constructor.
∇ is B_dR-linear; the image of B_dR in OB_dR,log is horizontal.

TauCeti.LogAdic.StructuralLogConnection.relative [other]: not stated; depends on the full geometric constructor.
For a log smooth f:X→X′, composing with Ω^log_X→Ω^log_{X/X′} gives the relative connection ∇_{X/X′}, linear over the image of f_prokét⁻¹OB_dR,log,X′ (used in Corollary 2.4.6).

TauCeti.LogAdic.StructuralLogConnection.constants [degenerate]: not stated as an example; needs the full geometric constructor.
∇ vanishes on the image of B_dR→OB_dR,log.

TauCeti.LogAdic.StructuralLogConnection.log_coordinate [computation]: not stated as an example; needs the full geometric constructor.
For X=D¹ with log structure at 0 and y=log(e^{(a,a)}) over its all-root cover, ∇y=δ(a)=dlog T; the same holds on the stratum {T=0} with the induced log structure, where dlog T is still a nonzero section of Ω^log.

TauCeti.LogAdic.StructuralLogConnection.normalized_coordinate [computation]: not stated as an example; needs the full geometric constructor.
∇W_T=t⁻¹dlog T for W_T=y/t, so omitting the t⁻¹ would give the wrong filtered connection.

Sources: DLLZ-RH Equations (2.2.13)–(2.2.14), p. 14; DLLZ-RH Equation (2.2.15), p. 14; DLLZ-RH Equations (2.2.16)–(2.2.17), p. 14.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:comparison/toric-structural-period-model
TauCeti.LogAdic.toric_structural_period_model: not stated; needs the geometric carriers listed below.

Let k be a p-adic field, P=P̄⊕Q toric monoids, E=Spa(k⟨P̄⟩,k⁺⟨P̄⟩)↪Spa(k⟨P⟩,k⁺⟨P⟩) the stratum with pulled-back log structure, X=Spa(A,A⁺) an affinoid fs log adic space with a strictly étale map X→E, and X̃→X the pullback of the all-root tower Ẽ=lim E_m, log affinoid perfectoid with Galois group Γ. Let M⊂B_dR⁺|_X̃[P] be the ideal generated by {e_a−1}_{a∈P}, B_dR⁺|_X̃[[P−1]]=lim_r B_dR⁺|_X̃[P]/M^r with Fil^r=(ξ,M)^r. (1) There is a unique v:O_{X_prokét}|_X̃→B_dR⁺|_X̃[[P−1]] lifting O→Ô and sending a∈P_{Q≥0} to [T^{ā♭}]e_a (Lemma 2.3.7), and β:M♭|_X̃→(B_dR⁺|_X̃[[P−1]])^× with v(α(a♯))=[α♭(a)]β(a) (Lemma 2.3.12). (2) The map B_dR⁺|_X̃[[P−1]]→OB⁺_dR,log|_X̃ of (2.3.14), e_a↦e_{(a,a)}, is an isomorphism of filtered sheaves (Proposition 2.3.15); for every log affinoid perfectoid U=lim U_i in X_prokét/X̃, OB⁺_dR,log(U)≅B_dR⁺(U)[[P−1]] and each Ŝ_i→OB⁺_dR,log(U) is an isomorphism. (3) For a Z-basis a_1,…,a_n of P^gp and y_j=y_{a_j} (y_a=log(e^{a⁺})−log(e^{a⁻}) for a=a⁺−a⁻), B_dR⁺|_X̃[[P−1]]≅B_dR⁺|_X̃[[y_1,…,y_n]], matching M^r with (y_1,…,y_n)^r and (ξ,M)^r with (ξ,y_1,…,y_n)^r ((2.3.6)). (4) With W_j=t⁻¹y_j, Fil^rOB_dR,log≅t^rB_dR⁺{W_1,…,W_n} (t-adically convergent series) for all r∈Z, gr^rOB_dR,log≅t^rÔ[W_1,…,W_n] and gr^•OB_dR,log≅Ô[t^{±1},W_1,…,W_n] (Corollary 2.3.17). (5) For a strict closed immersion Z→X pulled back from the closed stratum of a direct summand Q′ of P̄, these isomorphisms for X and Z are compatible with pullback and pushforward, and B_dR,X⁺(U)/ξ^r modulo the completed ideal generated by the [T^{sa♭}] (s∈Q_{>0}, a∈Q′−{0}) is B_dR,Z⁺(V)/ξ^r ((2.3.21), Corollary 2.3.20).

Hypotheses: k is a p-adic field (§2.3), with k_∞=k(µ_∞), t=log[ε] ((2.3.2)) and k→B_dR⁺ the unique lift of k→k̂_∞. P is a toric (fs, sharp) monoid, not necessarily free; n is the rank of P^gp; Q≠0 covers strata with the pulled-back log structure (Remark 2.4.1(2)). The isomorphisms hold on the localized site X_prokét/X̃ (equivalently on log affinoid perfectoid objects over X̃); the formal power series B_dR⁺[[y]] of the positive case and the t-adically convergent series B_dR⁺{W} of the completed case are not identified.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:comparison/structural-log-period-plus, HodgeTateAndCanonicalSubgroups:T6:comparison/structural-log-period-complete, HodgeTateAndCanonicalSubgroups:T6:comparison/constant-log-periods, HodgeTateAndCanonicalSubgroups:T6:log-sites/all-root-toric-tower, HodgeTateAndCanonicalSubgroups:T6:log-sites/log-affinoid-perfectoid, PadicHodgeTheory:P8:local-rational/bdr-plus-power-series-extension-lemma, PadicHodgeTheory:P8:local-rational/etale-algebras-over-torus-models, AdicSpacesPartII:R0/etale-algebraic-model.

Sources: DLLZ-RH Proposition 2.3.15, p. 18; DLLZ-RH Remark after the proof of Proposition 2.3.15, p. 19; DLLZ-RH Corollary 2.3.17, p. 19; DLLZ-RH Corollary 2.3.20, pp. 19–20.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:comparison/log-poincare
TauCeti.LogAdic.log_poincare: not stated; needs the geometric carriers listed below.

Let X be as in Remark 2.4.1 over a p-adic field k. On X_prokét, with tensor products over O_{X_prokét}: (1) 0→B_dR⁺→OB⁺_dR,log→OB⁺_dR,log⊗Ω^{log,1}_X→OB⁺_dR,log⊗Ω^{log,2}_X→⋯ (differentials ∇) is exact; (2) the same holds with B_dR and OB_dR,log; (3) for each r∈Z the subcomplex 0→Fil^rB_dR→Fil^rOB_dR,log→Fil^{r−1}OB_dR,log⊗Ω^{log,1}_X→Fil^{r−2}OB_dR,log⊗Ω^{log,2}_X→⋯ is exact; (4) for each r∈Z the quotient complex 0→gr^rB_dR→gr^rOB_dR,log→gr^{r−1}OB_dR,log⊗Ω^{log,1}_X→⋯ is exact and identifies with 0→Ô(r)→OC_log(r)→OC_log(r)⊗Ω^{log,1}_X(−1)→OC_log(r)⊗Ω^{log,2}_X(−2)→⋯ (Corollary 2.4.2). If f:X→X′ is log smooth with X and X′ both as in Remark 2.4.1, then 0→B⁺_dR,X⊗̂_{f⁻¹B⁺_dR,X′}f⁻¹OB⁺_dR,log,X′→OB⁺_dR,log,X→OB⁺_dR,log,X⊗Ω^{log,1}_{X/X′}→OB⁺_dR,log,X⊗Ω^{log,2}_{X/X′}→⋯ is exact, where ⊗̂ is the tensor product completed for the filtration (locally B⁺_dR,X[[y′_1,…,y′_{n′}]] in the base coordinates); the analogous complex with B_dR,X, B_dR,X′, OB_dR,log,X, OB_dR,log,X′ (first term locally B_dR,X{W′_1,…,W′_{n′}}) is exact and strictly compatible with the filtrations (Corollary 2.4.6, with the completed tensor product).

Hypotheses: k is a p-adic field and X is as in Remark 2.4.1: either (1) X is log smooth over k, or (2) X is a smooth intersection of irreducible components of a normal crossings divisor of a smooth Y over k, with the log structure pulled back from Y. In the relative statement f:X→X′ is log smooth and X′ is also as in Remark 2.4.1; Ω^log_{X/X′} is a vector bundle and 0→f*Ω^log_{X′}→Ω^log_X→Ω^log_{X/X′}→0 is exact. The first term of the relative complex is the filtration-completed tensor product; with the uncompleted tensor product printed in Corollary 2.4.6 exactness at OB⁺_dR,log,X fails. Exactness is a statement about sheaves on X_prokét, not about global sections.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:comparison/toric-structural-period-model, HodgeTateAndCanonicalSubgroups:T6:comparison/structural-period-connection, HodgeTateAndCanonicalSubgroups:T6:comparison/constant-log-periods, HodgeTateAndCanonicalSubgroups:T6:log-sites/analytic-log-de-rham, HodgeTateAndCanonicalSubgroups:T6:log-sites/log-differential-descent, HodgeTateAndCanonicalSubgroups:T6:log-sites/log-smooth-chart-criterion, HodgeTateAndCanonicalSubgroups:T6:log-sites/log-perfectoid-basis, PadicHodgeTheory:P8:local-rational/formal-poincare-lemma.

Sources: DLLZ-RH Remark 2.4.1, p. 20; DLLZ-RH Corollary 2.4.2 and its proof, pp. 20–21; DLLZ-RH Corollary 2.4.6, p. 21.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:comparison/log-faltings-extension
TauCeti.LogAdic.log_faltings_extension: not stated; needs the geometric carriers listed below.

Let X be as in Remark 2.4.1 over a p-adic field k. There is a short exact sequence of Ô-modules on X_prokét 0→Ô(1)→gr¹OB⁺_dR,log→Ô⊗_{O_{X_prokét}}Ω^log_X→0 (Corollary 2.4.5). The first map is gr¹B_dR⁺≅Ô(1) followed by gr¹ of B_dR⁺→OB⁺_dR,log; the second is the graded piece of ∇, gr¹OB⁺_dR,log→gr⁰OB⁺_dR,log⊗Ω^log_X=Ô⊗Ω^log_X. Over a toric chart, on X̃ one has gr¹OB⁺_dR,log=Ô·ξ⊕⊕_jÔ·y_j with y_j↦δ(a_j), so the sequence is locally split.

Hypotheses: k is a p-adic field and X is as in Remark 2.4.1: either (1) X is log smooth over k, or (2) X is a smooth intersection of irreducible components of a normal crossings divisor of a smooth Y over k, with the log structure pulled back from Y. gr¹B_dR⁺≅Ô(1) is the canonical Galois-equivariant identification; Corollary 2.2.6 states it over a perfectoid base containing all roots of unity, and over k it is obtained on X_prokét/X_{k̂_∞} and descended.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:comparison/toric-structural-period-model, HodgeTateAndCanonicalSubgroups:T6:comparison/constant-log-periods, HodgeTateAndCanonicalSubgroups:T6:comparison/structural-period-connection, HodgeTateAndCanonicalSubgroups:T6:comparison/log-poincare, HodgeTateAndCanonicalSubgroups:T6:log-sites/log-differential-descent, PadicHodgeTheory:P8:local-rational/faltings-extension.

Sources: DLLZ-RH Corollary 2.4.5, p. 21; DLLZ-RH Remark 2.4.1, p. 20.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:comparison/bdr-coefficient-sheaves
TauCeti.LogAdic.BdRCoefficientSheaf: component above; full geometric signature not stated.

Let k be a p-adic field, K a perfectoid field containing k_∞, B_dR⁺=B_dR⁺(K,O_K), B_dR=B_dR(K,O_K), t=log[ε]∈B_dR⁺, and k→B_dR⁺ the unique lift of k→K (Definition 3.1.1(1)). For a locally noetherian adic space X over k, O_X⊗̂_k(B_dR⁺/t^r) is the sheaf on X_an associated with Spa(A,A⁺)↦A⊗̂_k(B_dR⁺/t^r); O_X⊗̂_kB_dR⁺=lim_rO_X⊗̂_k(B_dR⁺/t^r) and O_X⊗̂_kB_dR=(O_X⊗̂_kB_dR⁺)[t⁻¹], with Fil^r(O_X⊗̂_kB_dR⁺)=t^r(O_X⊗̂_kB_dR⁺) and Fil^r(O_X⊗̂_kB_dR)=t^{−s}Fil^{r+s}(O_X⊗̂_kB_dR⁺) for any s≥−r; the same on X_ét using étale maps from affinoids (Definition 3.1.1(2)–(4)). Lemma 3.1.4: (1) for affinoid X=Spa(A,A⁺), H^i(X_ét,O_{X_ét}⊗̂_k(B_dR⁺/t^r)) is A⊗̂_k(B_dR⁺/t^r) for i=0 and 0 for i>0; (2) gr^r(O_{X_ét}⊗̂_kB_dR)≅O_{X_ét}⊗̂_kK(r); (3) O_X⊗̂_k(B_dR⁺/t^r)≅λ_*(O_{X_ét}⊗̂_k(B_dR⁺/t^r))≅Rλ_*(O_{X_ét}⊗̂_k(B_dR⁺/t^r)), and likewise for B_dR⁺ and B_dR; (4) for affinoid X, finite projective A⊗̂_kB_dR⁺-modules, finite locally free O_X⊗̂_kB_dR⁺-modules and finite locally free O_{X_ét}⊗̂_kB_dR⁺-modules are equivalent; (5) λ_* is an equivalence from finite locally free O_{X_ét}⊗̂_k(B_dR⁺/t^r)-modules (resp. O_{X_ét}⊗̂_kB_dR⁺-modules) to the corresponding modules on X_an. The ringed spaces are X⁺=(X_an,O_X⊗̂_kB_dR⁺) and X=(X_an,O_X⊗̂_kB_dR) (3.1.5); a vector bundle on X⁺ is a finite locally free O_X⊗̂_kB_dR⁺-module, and vector bundles on X are the global sections of the stack obtained from vector bundles on X⁺ over open subspaces by passing to the t-isogeny category.

Hypotheses: k is a p-adic field and K a perfectoid field containing k_∞=k(µ_∞) (§3); X is any locally noetherian adic space over k. The tensor products are completed tensor products of Banach k-algebras (A⊗̂_k(B_dR⁺/t^r) with B_dR⁺/t^r a Banach k-algebra); the uncompleted O_X⊗_kB_dR⁺ is not used. A vector bundle on X is not required to come from a vector bundle on X⁺ by a global extension of scalars (unlike Liu–Zhu Definition 3.5).

Suppliers and local inputs: PadicHodgeTheory:R06.1/de-rham-period-ring, PadicHodgeTheory:R06.1/fontaine-element-t, AdicSpacesPartII:R0/completed-tensor-product, AdicSpacesPartII:R3, ClassicalAdicEtaleCohomology:H0, EnhancedDerivedSheaves:E1.

TauCeti.LogAdic.BdRCoefficientSheaf [constructor]: component above; full contract follows.
The sheaves O_X⊗̂_k(B_dR⁺/t^r), O_X⊗̂_kB_dR⁺=lim_r and O_X⊗̂_kB_dR=(⋯)[t⁻¹] on X_an and on X_ét.

TauCeti.LogAdic.BdRCoefficientSheaf.fil [structure]: component above; full contract follows.
Fil^r=t^r(O_X⊗̂_kB_dR⁺) and Fil^r(O_X⊗̂_kB_dR)=t^{−s}Fil^{r+s}(O_X⊗̂_kB_dR⁺) for any s≥−r; [a,b]-truncations (O_X⊗̂_kB_dR)^{[a,b]}=Fil^a/Fil^{b+1}.

TauCeti.LogAdic.BdRCoefficientSheaf.affinoid_sections [characterisation]: not stated; depends on the full geometric constructor.
Lemma 3.1.4(1): on affinoid X=Spa(A,A⁺), sections are A⊗̂_k(B_dR⁺/t^r) and higher étale cohomology vanishes.

TauCeti.LogAdic.BdRCoefficientSheaf.grade [compatibility]: component above; full contract follows.
Lemma 3.1.4(2): gr^r(O_{X_ét}⊗̂_kB_dR)≅O_{X_ét}⊗̂_kK(r), Gal(K/k)-equivariantly.

TauCeti.LogAdic.BdRCoefficientSheaf.analytic_etale [equivalence]: not stated; depends on the full geometric constructor.
Lemma 3.1.4(3),(5): the analytic sheaves are λ_* and Rλ_* of the étale ones, and λ_* is an equivalence on finite locally free modules.

TauCeti.LogAdic.BdRCoefficientSheaf.affinoid_modules [equivalence]: not stated; depends on the full geometric constructor.
Lemma 3.1.4(4): on affinoid X, finite projective A⊗̂_kB_dR⁺-modules are equivalent to finite locally free modules on X_an and on X_ét.

TauCeti.LogAdic.BdRCoefficientSheaf.VectorBundle [other]: not stated; depends on the full geometric constructor.
Vector bundles on X⁺ (finite locally free O_X⊗̂_kB_dR⁺-modules) and on X (t-isogeny stack); E⊗_{O_X}M for a vector bundle E on X_an.

TauCeti.LogAdic.BdRCoefficientSheaf.pullback [functoriality]: not stated; depends on the full geometric constructor.
A morphism f:Y→X of locally noetherian adic spaces over k induces f⁻¹(O_X⊗̂_kB_dR⁺)→O_Y⊗̂_kB_dR⁺ compatibly with filtrations, with map_id and map_comp; Gal(K/k) acts through the coefficients.

TauCeti.LogAdic.BdRCoefficientSheaf.point [degenerate]: component example above; full test follows.
For X=Spa(k,O_k), O_X⊗̂_kB_dR⁺=B_dR⁺(K,O_K) with Fil^r=t^rB_dR⁺ and gr⁰=K.

TauCeti.LogAdic.BdRCoefficientSheaf.gr_zero [computation]: not stated as an example; needs the full geometric constructor.
gr⁰(O_X⊗̂_kB_dR)=O_X⊗̂_kK; for X=Spa(k⟨T⟩) its sections are K⟨T⟩.

TauCeti.LogAdic.BdRCoefficientSheaf.not_algebraic_tensor [non-example]: not stated as an example; needs the full geometric constructor.
For X=Spa(k⟨T⟩), the section ∑_np^nx_nT^n of O_X⊗̂_kK, with x_n∈O_K linearly independent over k, is not in k⟨T⟩⊗_kK, whose elements have coefficients in a finite-dimensional k-subspace of K.

TauCeti.LogAdic.BdRCoefficientSheaf.twist [characterisation]: not stated as an example; needs the full geometric constructor.
Gal(K/k) acts on gr¹(O_X⊗̂_kB_dR⁺)=t·(O_X⊗̂_kK) through σ(tf)=χ(σ)t·σ(f), so gr¹≅O_X⊗̂_kK(1) and not O_X⊗̂_kK as Galois-equivariant sheaves.

Sources: DLLZ-RH Definition 3.1.1(1), p. 22; DLLZ-RH Lemma 3.1.4, p. 22; DLLZ-RH Lemma 3.1.4(5), p. 23; DLLZ-RH Equation (3.1.5) and following, p. 23.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:comparison/filtered-log-connection
TauCeti.LogAdic.FilteredLogConnection: component above; full geometric signature not stated.

Let k be a p-adic field, K a perfectoid field containing k_∞, X a log smooth fs log adic space over k, and X⁺=(X_an,O_X⊗̂_kB_dR⁺), X=(X_an,O_X⊗̂_kB_dR) as in bdr-coefficient-sheaves, with Ω^log_{X/B_dR}=Ω^log_X⊗̂_kB_dR and Ω^log_{X⁺/B_dR⁺}=Ω^log_X⊗̂_kB_dR⁺ (Definition 3.1.6). (1) A log connection on a vector bundle E on X is a B_dR-linear ∇:E→E⊗_{O_X}Ω^log_{X/B_dR} with the usual Leibniz rule; it is integrable if ∇²=0, with log de Rham complex DR_log(E)=(E⊗Ω^{log,•}_{X/B_dR},∇). (2) A log t-connection on a vector bundle E⁺ on X⁺ is a B_dR⁺-linear ∇⁺:E⁺→E⁺⊗_{O_{X⁺}}Ω^log_{X⁺/B_dR⁺} with ∇⁺(fe)=(te)⊗df+f∇⁺(e); it is integrable if (∇⁺)²=0. (3) A log Higgs bundle on X_K is a vector bundle E on X_{K,an} with an O_{X_K}-linear θ:E→E⊗Ω^log_{X_K}(−1) such that θ∧θ=0, with Higgs complex (E⊗Ω^{log,•}_{X_K}(−•),θ). (4) A log connection on a coherent sheaf E on X is a k-linear ∇:E→E⊗Ω^log_X with the Leibniz rule; a decreasing filtration by coherent subsheaves with ∇(Fil^rE)⊂Fil^{r−1}E⊗Ω^log_X gives Fil^rDR_log(E)=(Fil^{r−•}E⊗Ω^{log,•}_X,∇) with O_X-linear graded differentials (Definition 3.1.7). A filtered log connection on X is an integrable log connection (E,∇) on X with a decreasing filtration (Fil^r)_{r∈Z} by locally free O_X⊗̂_kB_dR⁺-submodules satisfying Griffiths transversality ∇(Fil^r)⊂Fil^{r−1}⊗Ω^log_{X⁺/B_dR⁺} (the target of Theorem 3.2.3(1)). Lemma 3.1.8: (E⁺,∇⁺)↦(E⁺⊗_{B_dR⁺}B_dR,t⁻¹∇⁺,{t^rE⁺}_{r≥0}) is an equivalence from integrable log t-connections on X⁺ to integrable log connections on X with filtrations {Fil^r}_{r≥0} by locally free O_X⊗̂_kB_dR⁺-submodules satisfying Fil^r=t·Fil^{r−1} (r≥1) and Griffiths transversality. Lemma 3.1.9: (E⁺,∇⁺)↦(E⁺/t,∇⁺ mod t) is a functor to log Higgs bundles on X_K.

Hypotheses: k is a p-adic field, K a perfectoid field containing k_∞=k(µ_∞), B_dR⁺=B_dR⁺(K,O_K) and t=log[ε] (Definition 3.1.1(1)); X is log smooth fs over k (for (4), X as in Definition 3.1.7(4)). Connections on X are B_dR-linear, t-connections B_dR⁺-linear, Higgs fields O_{X_K}-linear and valued in Ω^log_{X_K}(−1), coherent connections k-linear; a t-connection is not an ordinary connection modulo t. Filtrations of filtered log connections are by locally free O_X⊗̂_kB_dR⁺-submodules indexed by r∈Z; Lemma 3.1.8 concerns only filtrations {Fil^r}_{r≥0} with Fil^r=t·Fil^{r−1}.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:comparison/bdr-coefficient-sheaves, HodgeTateAndCanonicalSubgroups:T6:log-sites/analytic-log-de-rham, HodgeTateAndCanonicalSubgroups:T6:log-sites/log-differential-descent.

TauCeti.LogAdic.FilteredLogConnection [constructor]: component above; full contract follows.
An integrable B_dR-linear log connection on a vector bundle on X with a decreasing filtration by locally free O_X⊗̂_kB_dR⁺-submodules satisfying Griffiths transversality.

TauCeti.LogAdic.FilteredLogConnection.transversality [relation]: component above; full contract follows.
∇(Fil^r)⊂Fil^{r−1}⊗Ω^log; on the de Rham complex the qth term carries Fil^{r−q} and the differential maps Fil^{r−q} into Fil^{r−q−1}.

TauCeti.LogAdic.FilteredLogConnection.t_connection [equivalence]: component above; full contract follows.
Lemma 3.1.8: (E⁺,∇⁺)↦(E⁺⊗B_dR,t⁻¹∇⁺,{t^rE⁺}_{r≥0}) is an equivalence onto filtered log connections with Fil^r=t·Fil^{r−1} for r≥1.

TauCeti.LogAdic.FilteredLogConnection.higgs [functoriality]: component above; full contract follows.
Lemma 3.1.9: reduction of an integrable log t-connection modulo t is a log Higgs bundle E⁺/t→E⁺/t⊗Ω^log_{X_K}(−1), functorial in (E⁺,∇⁺).

TauCeti.LogAdic.FilteredLogConnection.de_rham_complex [other]: not stated; depends on the full geometric constructor.
The log de Rham complex DR_log(E)=(E⊗Ω^{log,•}_{X/B_dR},∇) and log de Rham cohomology H^i_{log dR}(X,E)=H^i(X,DR_log(E)) (Definition 3.1.7(1)).

TauCeti.LogAdic.FilteredLogConnection.higgs_complex [other]: not stated; depends on the full geometric constructor.
For a log Higgs bundle, the complex (E⊗Ω^{log,•}_{X_K}(−•),θ) and H^i_{log Higgs}(X_K,E) (Definition 3.1.7(3)).

TauCeti.LogAdic.FilteredLogConnection.coherent_filtered [other]: component above; full contract follows.
Definition 3.1.7(4): a k-linear log connection on a coherent sheaf with a Griffiths-transversal coherent filtration, Fil^rDR_log(E)=(Fil^{r−•}E⊗Ω^{log,•}_X,∇), log Hodge cohomology H^{a,b}_{log Hodge}=H^{a+b}(X,gr^aDR_log(E)) and the Hodge–de Rham spectral sequence.

TauCeti.LogAdic.FilteredLogConnection.trivial [degenerate]: component example above; full test follows.
E=O_X⊗̂_kB_dR with ∇=d⊗1 and Fil^r=t^r(O_X⊗̂_kB_dR⁺) is a filtered log connection; under Lemma 3.1.8 it corresponds to (O_X⊗̂_kB_dR⁺,t·d), whose reduction modulo t is (O_{X_K},θ=0).

TauCeti.LogAdic.FilteredLogConnection.mod_t_linear [computation]: component example above; full test follows.
The term (te)⊗df vanishes modulo t, so the reduced map is O-linear.

TauCeti.LogAdic.FilteredLogConnection.not_unshifted [non-example]: component example above; full test follows.
The filtered de Rham qth term has Fil^{r−q}; an unshifted Fil^r in every degree does not encode transversality.

TauCeti.LogAdic.FilteredLogConnection.higgs_twist [characterisation]: not stated as an example; needs the full geometric constructor.
If ∇ is Gal(K/k)-equivariant then ∇⁺=t∇ satisfies ∇⁺(σe)=χ(σ)⁻¹σ(∇⁺e), so θ=∇⁺ mod t is equivariant as a map to E⊗Ω^log_{X_K}(−1) and not to E⊗Ω^log_{X_K}(1).

Sources: DLLZ-RH Definition 3.1.7(2), p. 24; DLLZ-RH Definition 3.1.7(3), p. 24; DLLZ-RH Lemma 3.1.8, p. 24; DLLZ-RH Lemma 3.1.9, p. 24.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:comparison/log-tower-decompletion
TauCeti.LogAdic.log_tower_decompletion: not stated; needs the geometric carriers listed below.

A triple ({A_i}_{i∈I},Â_∞,Γ) (filtered system of topological rings, a complete ring Â_∞ with lim A_i→Â_∞ of dense image, a topological group Γ acting compatibly) is a decompletion system if (1) every finite projective Γ-module L_∞ over Â_∞ has a model, a finite projective Γ-module L_i over some A_i with L_i⊗_{A_i}Â_∞≅L_∞, and (2) for every model there is i_0≥i such that L_i⊗_{A_i}A_{i′} is good, H^•(Γ,L_{i′})≅H^•(Γ,L_∞), for all i′≥i_0 (Definition A.1.2); then lim_iProj_{A_i}(Γ)→Proj_{Â_∞}(Γ) is an equivalence and two models agree after base change (Remark A.1.3). Twisted models (Corollary A.1.21): if the triple is weakly (resp. stably) decompleting with initial index 0 and {ψ_s:Γ→A_0^×}_{s∈S} is a family of continuous characters such that for every open neighbourhood U of 1 in A_0 some open neighbourhood V of 1 in Γ has ψ_s(V)⊂U for all s, then for a model L_i of a finite free (resp. finite projective) L_∞ each L_i(ψ_s)=L_i⊗_{A_0}A_0(ψ_s) is a model of L_∞(ψ_s), and there is i_0≥i such that L_{i′}(ψ_s) is good for all i′≥i_0 and all s∈S simultaneously. The following are decompletion systems. (A.2.1.2) Arithmetic towers: for a Huber pair (A,A⁺) over (Q_p,Z_p), A_{p^l}=A⊗_{Q_p}Q_p(µ_{p^l}) and Â_{p^∞} the p-adic completion of ∪_lA_{p^l}, all stably uniform, ({A_{p^l}}_{l≥0},Â_{p^∞},Γ_1) with Γ_1=Gal(Q_p(µ_{p^∞})/Q_p); also with A_{p^l}=A⊗_kk(µ_{p^l}) for a Banach algebra A over a p-adic field k (Remark A.2.1.3). (A.2.2.3) Geometric towers: in the setup of §2.3 (X=Spa(A,A⁺) strictly étale over E, X̃ with ring Â_∞), ({A_{m,k̂_∞}}_{m≥1},Â_∞,Γ̃) with Γ_1=Hom(P^gp_Q/P^gp,µ_∞)≅Hom(P^gp,Ẑ(1)) acting by γT^a=γ(a)T^a and Γ̃=Γ_1⋊Gal(k_∞/k), and also for every closed subgroup of Γ̃ containing Γ_1 (Remark A.2.2.4). (A.2.3.4) Deformations: for every r≥1, ({B_{r,m}}_{m≥1},B̂_{r,∞},Γ_1) with B_{r,m}=A⊗̂_k(B_dR⁺/ξ^r)⊗_{(B_dR⁺/ξ^r)⟨P⟩}(B_dR⁺/ξ^r)⟨(1/m)P⟩ and B̂_{r,∞}≅B_dR⁺(X̃)/ξ^r (Lemma 2.3.11). The first two triples are stably decompleting (Propositions A.2.1.1, A.2.2.1); the third is only shown to be weakly decompleting (Proposition A.2.3.3), and A.2.3.4 is not asserted to be stably decompleting.

Hypotheses: Arithmetic towers: (A_{p^l},A_{p^l}⁺) and (Â_{p^∞},Â_{p^∞}⁺) stably uniform; Remark A.2.1.3 for Banach algebras over a p-adic field. Geometric and deformation towers: k a p-adic field and the setup of §2.3 (toric chart X=Spa(A,A⁺)→E strictly étale, all-root tower, norms as in Appendix A.2.2–A.2.3). Decompletion is asserted only for these towers and their pullbacks used in §3.3 (R_{K,m}, the boundary quotients R̄_{K,m}, and {R′_{p^l}}); no arbitrary tower is asserted to decomplete.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:log-sites/all-root-toric-tower, HodgeTateAndCanonicalSubgroups:T6:comparison/toric-structural-period-model, HodgeTateAndCanonicalSubgroups:T6:comparison/toric-kummer-cohomology, ClassicalAdicEtaleCohomology:H0.

Sources: DLLZ-RH Definition A.1.2(2), p. 67; DLLZ-RH Theorem A.2.1.2 and its proof, p. 73; DLLZ-RH Theorem A.2.2.3 and its proof, p. 74; DLLZ-RH Theorem A.2.3.4, pp. 75–76.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:comparison/log-oc-pushforward
TauCeti.LogAdic.log_oc_pushforward: not stated; needs the geometric carriers listed below.

Let k be a p-adic field, K a perfectoid field containing k_∞, X a smooth rigid analytic variety over k with the log structure of a normal crossings divisor D (Example 2.1.2), and Z either X or an open subspace of a smooth intersection of irreducible components of D with the log structure pulled back from X; µ′_Z:Z_prokét/Z_K→Z_an. For a Q_p-local system L on X_két with pullback L̂_Z: (1) R^iµ′_{Z,*}(L̂_Z⊗_{Q̂_p}OC_log,Z)=0 for all i>0; (2) µ′_{Z,*}(L̂_Z⊗_{Q̂_p}OC_log,Z) is a finite locally free O_Z⊗̂_kK-module (=gr⁰(O_Z⊗̂_kB_dR)), of rank rk_{Q_p}L if Z=X (Proposition 3.3.3). Locally, for a smooth toric chart X→Dⁿ with Z={T_1=⋯=T_l=0} and K=k̂_∞, H⁰(Z_prokét/Z_K,L̂_Z⊗OC_log,Z)≅L(Z_K), the unipotent part of a good decompleted model, and the higher cohomology vanishes (Lemma 3.3.15); L(Z_K) is finite projective over R̄_K, of rank rk L if Z=X, and its formation commutes with compositions of rational embeddings and finite étale maps Y→Z (Lemma 3.3.16). The natural map L(X_K)⊗_{R_K}R_{K,m_0}→L_{m_0}(X_K) need not be an isomorphism (Remark 3.3.12), and L(X_K)/(T_1,…,T_l)→L(Z_K) is in general only surjective (Remark 3.3.14).

Hypotheses: k is a p-adic field and K a perfectoid field containing k_∞=k(µ_∞) (§3); the proof reduces to K=k̂_∞ and obtains larger K by base change. X is smooth over k with the log structure of a normal crossings divisor D (Example 2.1.2), not necessarily strict normal crossings; Z is X or an open subspace of a smooth intersection of irreducible components of D (second case of Remark 2.4.1). L is any Q_p-local system on X_két (no unipotence or de Rham hypothesis); the rank statement is only for Z=X.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:comparison/log-tower-decompletion, HodgeTateAndCanonicalSubgroups:T6:comparison/toric-structural-period-model, HodgeTateAndCanonicalSubgroups:T6:comparison/structural-log-period-complete, HodgeTateAndCanonicalSubgroups:T6:comparison/bdr-coefficient-sheaves, HodgeTateAndCanonicalSubgroups:T6:log-sites/completed-kummer-local-systems, HodgeTateAndCanonicalSubgroups:T6:log-sites/log-perfectoid-almost-acyclicity, HodgeTateAndCanonicalSubgroups:T6:log-sites/geometric-boundary-monodromy, ClassicalAdicEtaleCohomology:H0, ClassicalAdicEtaleCohomology:H0/profinite-g-set-cohomology.

Sources: DLLZ-RH Proposition 3.3.3 and the definition of Z before Lemma 3.3.2, p. 28; DLLZ-RH Lemma 3.3.15, p. 31; DLLZ-RH Lemma 3.3.16, p. 31; DLLZ-RH Remark 3.3.12, p. 31.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:comparison/log-riemann-hilbert
TauCeti.LogAdic.LogRH: not stated; needs the geometric carriers listed below.

Let k be a p-adic field (complete, discretely valued, characteristic 0, perfect residue field of characteristic p), K a perfectoid field containing k_∞=k(µ_∞), X a smooth rigid analytic variety over k with the log structure of a normal crossings divisor D, 𝒳=(X_an,O_X⊗̂_k B_dR) and µ′:X_prokét/X_K→X_an. For a Q_p-local system L on X_két, RH_log(L)=Rµ′_*(L̂⊗_{Q̂_p}OB_dR,log) is concentrated in degree zero, and L↦RH_log(L) is an exact functor to Gal(K/k)-equivariant vector bundles on 𝒳 of rank rk_{Q_p}L, with integrable log connection ∇_L:RH_log(L)→RH_log(L)⊗Ω^log_{𝒳/B_dR} and decreasing filtration Fil^r RH_log(L)=µ′_*(L̂⊗Fil^r OB_dR,log), r∈Z, by locally free O_X⊗̂_k B_dR⁺-submodules satisfying Griffiths transversality. It is not asserted to be a tensor functor on all Q_p-local systems.

Hypotheses: k is a p-adic field in the DLLZ-RH sense and K is any perfectoid field containing k_∞ (DLLZ-RH §3 opening); Gal(K/k) is the group of continuous automorphisms of K over k. The proofs may first take K=k̂_∞ and then base change. D is a reduced normal crossings divisor as in DLLZ-RH Example 2.1.2 (étale locally SNC with smooth toric charts). L is a Q_p-local system on X_két; tensor compatibility is the separate unipotent theorem.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:comparison/log-oc-pushforward, HodgeTateAndCanonicalSubgroups:T6:comparison/structural-period-connection, HodgeTateAndCanonicalSubgroups:T6:comparison/filtered-log-connection, HodgeTateAndCanonicalSubgroups:T6:log-sites/completed-kummer-local-systems, EnhancedDerivedSheaves:E1, EnhancedDerivedSheaves:E2, HodgeTateAndCanonicalSubgroups:T6:comparison/bdr-coefficient-sheaves.

TauCeti.LogAdic.LogRH [constructor]: not stated; depends on the full geometric constructor.
The geometric derived pushforward Rµ′_*(L̂⊗OB_dR,log), identified with a degree-zero Gal(K/k)-equivariant filtered vector bundle on 𝒳 with integrable log connection.

TauCeti.LogAdic.LogRH.rank [structure]: not stated; depends on the full geometric constructor.
The bundle has rank rk_{Q_p}L.

TauCeti.LogAdic.LogRH.grade [compatibility]: not stated; depends on the full geometric constructor.
gr^r RH_log(L)≅µ′_*(L̂⊗OC_log)(r) for every r∈Z; this is H_log(L)(r) once the log Higgs functor is defined.

TauCeti.LogAdic.LogRH.plus [characterisation]: not stated; depends on the full geometric constructor.
RH⁺_log(L)=Fil⁰RH_log(L) is a vector bundle on 𝒳⁺ with integrable log t-connection t∇_L, and Fil^r RH_log(L)=t^r RH⁺_log(L) for all r (Lemma 3.1.8).

TauCeti.LogAdic.LogRH.exact [functoriality]: not stated; depends on the full geometric constructor.
L↦RH_log(L) is exact, and R^iµ′_*(L̂⊗Fil^r OB_dR,log)=0 for i>0 and all r.

TauCeti.LogAdic.LogRH.map_comp [functoriality]: not stated; depends on the full geometric constructor.
Pushforward of coefficient maps preserves identities and composition.

TauCeti.LogAdic.LogRH.restrict_open [compatibility]: not stated; depends on the full geometric constructor.
For an open immersion j:X′→X with the restricted divisor, j*RH_log(L)≅RH_log(j⁻¹L) compatibly with connections and filtrations (Remark 3.5.1).

TauCeti.LogAdic.LogRH.trivial_log [compatibility]: not stated; depends on the full geometric constructor.
Trivial-log specialization is the ordinary RH functor with the corrected filtration-completed structural periods.

TauCeti.LogAdic.LogRH.constant [computation]: not stated as an example; needs the full geometric constructor.
RH_log(Q_p)≅O_X⊗̂_k B_dR with connection d⊗1 (all residues zero) and Fil^r=t^r(O_X⊗̂_k B_dR⁺) (Lemma 3.3.2 with the whole interval).

TauCeti.LogAdic.LogRH.zero [degenerate]: not stated as an example; needs the full geometric constructor.
The zero local system gives the zero bundle.

TauCeti.LogAdic.LogRH.fractional_residue [non-example]: component example above; full test follows.
A finite boundary character with normalized residue 2/3 has a tensor square with normalized residue 1/3; it cannot be modeled by an unrestricted tensor functor adding residues to 4/3.

Sources: DLLZ-RH §3 opening, p. 22; DLLZ-RH Equation (3.2.2) and Theorem 3.2.3(1), p. 25; DLLZ-RH §3.3, proof of Theorem 3.2.3(1), pp. 27–28; DLLZ-RH §3.3, (3.3.1) and following, p. 28.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:comparison/log-higgs-functor
TauCeti.LogAdic.LogHiggs: not stated; needs the geometric carriers listed below.

In the setting of the geometric log Riemann–Hilbert functor, H_log(L):=gr⁰RH_log(L)=RH⁺_log(L)/t≅µ′_*(L̂⊗OC_log) defines a natural functor from Q_p-local systems on X_két to Gal(K/k)-equivariant log Higgs bundles θ_L:H_log(L)→H_log(L)⊗Ω^log_{X_K}(−1) on X_K,an, of rank rk_{Q_p}L, where θ_L is the reduction modulo t of the log t-connection t∇_L on RH⁺_log(L)=Fil⁰RH_log(L) (Lemmas 3.1.8–3.1.9), so θ_L∧θ_L=0. Its log Higgs complex has degree q term H_log(L)⊗Ω^{log,q}_{X_K}(−q).

Hypotheses: Same p-adic field k, perfectoid K⊇k_∞ and normal crossings pair (X,D) as RH_log; use the −q twists in the complex (Definition 3.1.7(3)).

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:comparison/log-riemann-hilbert, HodgeTateAndCanonicalSubgroups:T6:comparison/filtered-log-connection, HodgeTateAndCanonicalSubgroups:T6:comparison/log-oc-pushforward.

TauCeti.LogAdic.LogHiggs [constructor]: not stated; depends on the full geometric constructor.
Degree-zero reduction with its O-linear integrable log Higgs field.

TauCeti.LogAdic.LogHiggs.underlying [compatibility]: not stated; depends on the full geometric constructor.
Its underlying module is gr⁰ RH_log(L).

TauCeti.LogAdic.LogHiggs.pushforward_OC [characterisation]: not stated; depends on the full geometric constructor.
H_log(L)≅µ′_*(L̂⊗OC_log), and R^iµ′_*(L̂⊗OC_log)=0 for i>0.

TauCeti.LogAdic.LogHiggs.rank [structure]: not stated; depends on the full geometric constructor.
H_log(L) is a vector bundle on X_K,an of rank rk_{Q_p}L.

TauCeti.LogAdic.LogHiggs.field [projection]: not stated; depends on the full geometric constructor.
The field takes values in Ω¹_log(−1).

TauCeti.LogAdic.LogHiggs.complex [structure]: not stated; depends on the full geometric constructor.
The log Higgs complex (H_log(L)⊗Ω^{log,•}_{X_K}(−•),θ_L) and its hypercohomology H^i_logHiggs(X_K,an,H_log(L)) (Definition 3.1.7(3)).

TauCeti.LogAdic.LogHiggs.map_comp [functoriality]: not stated; depends on the full geometric constructor.
The assignment preserves identity and composition of coefficient morphisms.

TauCeti.LogAdic.LogHiggs.constant [degenerate]: not stated as an example; needs the full geometric constructor.
The constant local system has H_log(Q_p)=O_{X_K} with zero log Higgs field.

TauCeti.LogAdic.LogHiggs.twist [compatibility]: not stated as an example; needs the full geometric constructor.
The qth Higgs-complex term carries Tate twist −q.

TauCeti.LogAdic.LogHiggs.residue [computation]: not stated as an example; needs the full geometric constructor.
For X the closed unit disc over k with D={T=0} and a rank-two Q_p-local system on X_két whose boundary inertia acts unipotently but nontrivially, θ_L is nonzero, θ_L∧θ_L=0, and its residue along D is a nonzero nilpotent endomorphism of H_log(L)|_D (valued in the (−1) twist); for the constant system the residue is zero.

Sources: DLLZ-RH Theorem 3.2.4(1), p. 25; DLLZ-RH Theorem 3.2.4(1), p. 26; DLLZ-RH Lemma 3.1.9, p. 24; DLLZ-RH Definition 3.1.7(3), p. 24.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:comparison/log-regularity-and-extension
TauCeti.LogAdic.log_regularity_and_extension: not stated; needs the geometric carriers listed below.

Let X be a smooth rigid analytic variety over k with normal crossings divisor D and U=X−D. (1) A torsion-free coherent O_X-module F with integrable log connection ∇:F→F⊗Ω^log_X is locally free if F is reflexive and, along every irreducible component of D, all eigenvalues of the residue of ∇ lie in Q∩[0,1). (2) If F is locally free and F′ is torsion-free coherent, both with integrable log connections whose residues along all irreducible components of D have eigenvalues in Q∩[0,1), then every horizontal morphism F→F′ whose restriction to U is an isomorphism is an isomorphism on X. Statement (2) also holds for O_X⊗̂_k B_dR-modules with integrable log connections on 𝒳.

Hypotheses: Retain reflexivity for the local-freeness result, the normalized residue interval for both sheaves, and the horizontal morphism. For a torsion-free coherent sheaf the residue along a component Z is taken on the locally free locus, whose complement has codimension at least two and contains no component of D (DLLZ-RH §3.4, p. 33).

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:log-sites/analytic-log-de-rham, HodgeTateAndCanonicalSubgroups:T6:log-sites/divisorial-analytic-log, HodgeTateAndCanonicalSubgroups:T6:comparison/filtered-log-connection, AdicSpacesPartII:R3/coherent-sheaf, AdicSpacesPartII:R3/coherent-sheaf-operations, AdicSpacesPartII:R3/locally-free-sheaf.

Sources: DLLZ-RH Proposition 3.4.16, p. 37; DLLZ-RH Proposition 3.4.17, p. 37; DLLZ-RH Proof of Proposition 3.4.17, p. 37.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:comparison/normalized-log-residues
TauCeti.LogAdic.normalized_log_residues: not stated; needs the geometric carriers listed below.

Let k, K, (X,D) be as for the geometric log Riemann–Hilbert functor and L a Q_p-local system on X_két. For an irreducible component Z of D with Z_k̄ irreducible (always achievable after a finite extension of k), all eigenvalues of Res_Z(∇_L) on RH_log(L) lie in Q∩[0,1). Locally, on an affinoid X with a smooth toric chart and Z_i={T_i=0}, Lemma 3.4.3 identifies RH⁺_log(L)(X) with N⁺, the elements c of N_∞=(L̂⊗B_dR⁺)(X̃) with (γ−1)^Λc→0 t-adically, and RH_log(L)(X) with N=N⁺[t⁻¹]; under this identification Res_{Z_i}(∇_L) is the endomorphism t⁻¹log(γ_i) of N/T_iN, independent of the choice of roots of unity. If the boundary inertia along Z_i acts unipotently, in particular if L|U has unipotent geometric monodromy along D, Res_{Z_i}(∇_L) is nilpotent.

Hypotheses: Z_k̄ irreducible for the RH_log statement, so that the characteristic polynomial of Res_Z has coefficients in B_dR; otherwise replace k by a finite extension. Z is an irreducible component in the sense of Conrad and the residue is defined by (3.4.1). Nilpotence needs unipotent geometric (not arithmetic) boundary monodromy (DLLZ-adic Definition 6.3.7). The arithmetic analogue for D_dR,log(L) is part of arithmetic-log-de-rham, which consumes this node.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:comparison/log-riemann-hilbert, HodgeTateAndCanonicalSubgroups:T6:log-sites/geometric-boundary-monodromy, HodgeTateAndCanonicalSubgroups:T6:comparison/log-tower-decompletion, HodgeTateAndCanonicalSubgroups:T6:comparison/toric-structural-period-model, HodgeTateAndCanonicalSubgroups:T6:log-sites/analytic-log-de-rham, HodgeTateAndCanonicalSubgroups:T6:log-sites/completed-kummer-local-systems.

Sources: DLLZ-RH Theorem 3.2.3(2), p. 25; DLLZ-RH Lemma 3.4.7, p. 35; DLLZ-RH Proof of Theorem 3.2.12, p. 38.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:comparison/arithmetic-log-de-rham
TauCeti.LogAdic.ArithmeticLogDR: not stated; needs the geometric carriers listed below.

For µ:X_prokét→X_an (k, (X,D) as in the geometric functor, K any perfectoid field containing k_∞) set D_dR,log(L)=µ_*(L̂⊗_{Q̂_p}OB_dR,log)≅RH_log(L)^{Gal(K/k)} with Fil^•D_dR,log(L)=(Fil^•RH_log(L))^{Gal(K/k)}. Then L↦D_dR,log(L) is a functor to vector bundles on X_an with integrable log connection ∇_L and decreasing filtration by coherent subsheaves satisfying Griffiths transversality; for every irreducible component Z of D all eigenvalues of Res_Z(∇_L) lie in Q∩[0,1), and they are 0 if L|U has unipotent geometric monodromy along D. The adjunction map D_dR,log(L)⊗̂_k B_dR→RH_log(L) is injective and strictly compatible with filtrations. If L|U is de Rham it is an isomorphism compatible with connections and filtrations, and gr D_dR,log(L) is a vector bundle of rank rk_{Q_p}L. Without that hypothesis the rank of D_dR,log(L) need not equal rk L.

Hypotheses: The same p-adic field and normal crossings pair as the geometric RH construction; no geometric-irreducibility hypothesis is needed for the arithmetic residues (Theorem 3.2.7(2)). De Rham means L|U de Rham in Scholze's sense (as reviewed in the DLLZ-RH introduction); it is needed only for the adjunction isomorphism and the graded rank.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:comparison/log-riemann-hilbert, HodgeTateAndCanonicalSubgroups:T6:comparison/log-higgs-functor, HodgeTateAndCanonicalSubgroups:T6:comparison/log-oc-pushforward, HodgeTateAndCanonicalSubgroups:T6:comparison/log-tower-decompletion, HodgeTateAndCanonicalSubgroups:T6:comparison/normalized-log-residues, HodgeTateAndCanonicalSubgroups:T6:comparison/log-regularity-and-extension, PadicHodgeTheory:P8:local-rational/de-rham-period-sheaf, PadicHodgeTheory:P8/de-rham-lisse-sheaf, ClassicalAdicEtaleCohomology:H0, AdicSpacesPartII:R3/coherent-sheaf, AdicSpacesPartII:R3/coherent-sheaf-operations, AdicSpacesPartII:R3/locally-free-sheaf.

TauCeti.LogAdic.ArithmeticLogDR [constructor]: not stated; depends on the full geometric constructor.
The arithmetic degree-zero pushforward with its induced connection and coherent filtration.

TauCeti.LogAdic.ArithmeticLogDR.geometric_invariants [characterisation]: not stated; depends on the full geometric constructor.
It is the arithmetic Galois-invariant sheaf of the geometric RH object, with Fil^r D_dR,log(L)=(Fil^r RH_log(L))^{Gal(K/k)}.

TauCeti.LogAdic.ArithmeticLogDR.residue_eigenvalues [relation]: not stated; depends on the full geometric constructor.
For every irreducible component Z of D the eigenvalues of Res_Z(∇_L) lie in Q∩[0,1); they are all 0 when L|U has unipotent geometric monodromy along D.

TauCeti.LogAdic.ArithmeticLogDR.toRH [projection]: not stated; depends on the full geometric constructor.
The adjunction map D_dR,log(L)⊗̂_k B_dR→RH_log(L) is horizontal, injective and strictly compatible with filtrations (Lemma 3.4.18).

TauCeti.LogAdic.ArithmeticLogDR.toRH_iso_of_isDeRham [compatibility]: not stated; depends on the full geometric constructor.
If L|U is de Rham, the adjunction map is an isomorphism of filtered vector bundles with log connection (Corollary 3.4.21).

TauCeti.LogAdic.ArithmeticLogDR.de_rham_grade_rank [compatibility]: not stated; depends on the full geometric constructor.
For de Rham interior input its total graded rank equals rk L.

TauCeti.LogAdic.ArithmeticLogDR.restrict_interior [compatibility]: not stated; depends on the full geometric constructor.
On U with trivial log structure, D_dR,log(L)|U is the ordinary arithmetic de Rham functor of L|U (Remark 3.5.1).

TauCeti.LogAdic.ArithmeticLogDR.map_comp [functoriality]: not stated; depends on the full geometric constructor.
Coefficient maps induce horizontal filtered maps, preserving composition.

TauCeti.LogAdic.ArithmeticLogDR.constant [computation]: not stated as an example; needs the full geometric constructor.
For the trivial Q_p coefficient system, D_dR,log=O_X with d and its weight-zero filtration.

TauCeti.LogAdic.ArithmeticLogDR.tate [computation]: not stated as an example; needs the full geometric constructor.
For L=Q_p(m), D_dR,log(L)=O_X·(e_m⊗t^{−m}) with ∇=d, and gr^{−m} is its only nonzero graded piece.

TauCeti.LogAdic.ArithmeticLogDR.zero [degenerate]: not stated as an example; needs the full geometric constructor.
The zero local system maps to the zero filtered bundle.

TauCeti.LogAdic.ArithmeticLogDR.non_de_rham [non-example]: not stated as an example; needs the full geometric constructor.
For X=Spa(k,O_k) with empty boundary and a Q_p-character of Gal(k̄/k) whose Sen weight is not an integer, D_dR,log(L)=0 although rk L=1, so the rank equality needs the de Rham hypothesis.

Sources: DLLZ-RH Equation (3.2.6) and Theorem 3.2.7(1), p. 26; DLLZ-RH Theorem 3.2.7(2), p. 26; DLLZ-RH Lemma 3.4.18, p. 38; DLLZ-RH Corollary 3.4.21, p. 38.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:comparison/log-rh-pullback
TauCeti.LogAdic.log_rh_pullback: not stated; needs the geometric carriers listed below.

Let h:Y→X be a morphism of log adic spaces, where X and Y are smooth rigid analytic varieties over k with log structures given by normal crossings divisors D and E (so h⁻¹(D)⊂E set-theoretically), and let L be a Q_p-local system on X_két. The adjunction maps h*H_log(L)→H_log(h⁻¹L), h*RH_log(L)→RH_log(h⁻¹L) and h*D_dR,log(L)→D_dR,log(h⁻¹L) are injective, the last two strictly compatible with filtrations. For components Z of D and W of E let m_WZ≥0 be the multiplicity of W in h⁻¹(Z), and n_Z=0 (resp. 1) if L|U has (resp. does not have) unipotent geometric monodromy along Z. If ∑_Z m_WZ n_Z≤1 for every W, the three maps are Gal(K/k)-equivariant (for the geometric ones) isomorphisms compatible with log connections, Higgs fields and filtrations. In local coordinates Res_W(h*∇_L)=∑_{h(W)⊂Z} m_WZ h*_{WZ}Res_Z(∇_L), with commuting summands.

Hypotheses: Boundary multiplicities are those of the divisors h⁻¹(Z); n_Z refers to geometric boundary monodromy; no isomorphism is claimed when ∑_Z m_WZ n_Z≥2 for some W.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:comparison/log-riemann-hilbert, HodgeTateAndCanonicalSubgroups:T6:comparison/log-higgs-functor, HodgeTateAndCanonicalSubgroups:T6:comparison/arithmetic-log-de-rham, HodgeTateAndCanonicalSubgroups:T6:comparison/normalized-log-residues, HodgeTateAndCanonicalSubgroups:T6:comparison/log-regularity-and-extension, HodgeTateAndCanonicalSubgroups:T6:log-sites/geometric-boundary-monodromy, HodgeTateAndCanonicalSubgroups:T6:log-sites/analytic-log-de-rham.

Sources: DLLZ-RH Theorem 3.2.3(4), p. 25; DLLZ-RH Lemma 3.5.3, p. 39; DLLZ-RH Corollary 3.5.7, p. 39; DLLZ-RH Proof of Corollary 3.5.7, p. 40.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:comparison/unipotent-log-tensor
TauCeti.LogAdic.unipotent_log_tensor: not stated; needs the geometric carriers listed below.

(1) RH_log (resp. H_log) restricts to a tensor functor from the category of Q_p-local systems L on X_két such that L|U has unipotent geometric monodromy along D to the category of filtered Gal(K/k)-equivariant vector bundles on 𝒳 with integrable log connection with nilpotent residues along D (resp. Gal(K/k)-equivariant log Higgs bundles on X_K,an). (2) D_dR,log restricts to a tensor functor from the category of Q_p-local systems L on X_két such that L|U is de Rham and has unipotent geometric monodromy along D to filtered vector bundles on X_an with integrable log connection with nilpotent residues along D. For such L the period maps µ′⁻¹H_log(L)⊗OC_log→L̂⊗OC_log and µ′⁻¹RH_log(L)⊗OB_dR,log→L̂⊗OB_dR,log, and in case (2) µ⁻¹D_dR,log(L)⊗OB_dR,log→L̂⊗OB_dR,log, are isomorphisms. No tensor compatibility is asserted for arbitrary Q_p-local systems.

Hypotheses: Unipotence is geometric boundary unipotence as in DLLZ-adic Definition 6.3.7; D_dR,log also requires L|U de Rham.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:comparison/log-riemann-hilbert, HodgeTateAndCanonicalSubgroups:T6:comparison/log-higgs-functor, HodgeTateAndCanonicalSubgroups:T6:comparison/arithmetic-log-de-rham, HodgeTateAndCanonicalSubgroups:T6:comparison/log-oc-pushforward, HodgeTateAndCanonicalSubgroups:T6:comparison/normalized-log-residues, HodgeTateAndCanonicalSubgroups:T6:log-sites/geometric-boundary-monodromy, PadicHodgeTheory:P8/de-rham-lisse-sheaf.

Sources: DLLZ-RH Theorem 3.2.12(1), p. 27; DLLZ-RH Theorem 3.2.12(2), p. 27; DLLZ-RH Paragraph before Theorem 3.2.12, p. 27; DLLZ-RH Proof of Theorem 3.2.12, p. 39.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:comparison/proper-log-period-cohomology
TauCeti.LogAdic.proper_log_period_cohomology: not stated; needs the geometric carriers listed below.

Let X be proper over k (smooth, with normal crossings divisor D), K the completion of an algebraic closure k̄ of k, and L a Z_p-local system on X_két. For each i≥0 there are canonical Gal(K/k)-equivariant isomorphisms H^i(X_K,két,L)⊗_{Z_p}B_dR≅H^i_logdR(𝒳,RH_log(L)), compatible with filtrations, and H^i(X_K,két,L)⊗_{Z_p}K≅H^i_logHiggs(X_K,an,H_log(L)); they factor through H^i(X_K,prokét,L̂⊗B_dR) and H^i(X_K,prokét,L̂⊗Ô) (Lemmas 3.6.1–3.6.2). If moreover L|U is de Rham, H^i(X_K,két,L)⊗_{Z_p}B_dR≅H^i_logdR(X_an,D_dR,log(L))⊗_k B_dR compatibly with filtrations, the log Hodge–de Rham spectral sequence of D_dR,log(L) degenerates at E₁, and H^i(X_K,két,L)⊗_{Z_p}K≅⊕_{a+b=i}H^{a,b}_logHodge(X_an,D_dR,log(L))⊗_k K(−a), the 0-th graded piece of the previous isomorphism. No compactly supported or subcanonical version is asserted.

Hypotheses: X proper over k and K the completion of k̄ for every conclusion; L|U de Rham only for the D_dR,log comparison, the E₁-degeneration and the Hodge–Tate decomposition; the RH_log/H_log comparisons hold for every Z_p-local system (torsion allowed, DLLZ-adic Definition 6.3.1).

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:comparison/proper-padic-boundary-cohomology, HodgeTateAndCanonicalSubgroups:T6:comparison/log-primitive-comparison, HodgeTateAndCanonicalSubgroups:T6:comparison/constant-log-periods, HodgeTateAndCanonicalSubgroups:T6:comparison/log-poincare, HodgeTateAndCanonicalSubgroups:T6:comparison/log-riemann-hilbert, HodgeTateAndCanonicalSubgroups:T6:comparison/log-oc-pushforward, HodgeTateAndCanonicalSubgroups:T6:comparison/log-higgs-functor, HodgeTateAndCanonicalSubgroups:T6:comparison/arithmetic-log-de-rham, PadicHodgeTheory:P8/de-rham-lisse-sheaf, EnhancedDerivedSheaves:E1, EnhancedDerivedSheaves:E2, AdicSpacesPartII:R3/kiehl-proper-mapping-theorem, AdicSpacesPartII:R3/proper-coherent-cohomology-field-extension.

Sources: DLLZ-RH Theorem 3.2.3(3), p. 25; DLLZ-RH Lemma 3.6.1, p. 42; DLLZ-RH §3.6, after Lemma 3.6.2, p. 42; DLLZ-RH Theorem 3.2.7(3), p. 26.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:comparison/relative-log-comparison
TauCeti.LogAdic.relative_log_comparison: not stated; needs the geometric carriers listed below.

Let f:X→Y be a proper log smooth morphism, where X and Y are smooth rigid analytic varieties over k with log structures given by normal crossings divisors D and E, such that f|_U:U→V (U=X−D, V=Y−E) is proper smooth; then D=f⁻¹(E). For a Z_p-local system L on X_két with L|U de Rham, each R^if_két,*(L) is a Z_p-local system on Y_két whose restriction to V is de Rham, and there is a canonical isomorphism D_dR,log(R^if_két,*L)≅(R^if_logdR,*(D_dR,log(L),∇_L))_free compatible with log connections (Gauss–Manin) and filtrations, where the subscript free denotes the O_Y-torsion-free quotient.

Hypotheses: Both proper log smooth f and proper smooth interior restriction are required; L|U de Rham; retain the torsion-free quotient.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:comparison/log-poincare, HodgeTateAndCanonicalSubgroups:T6:comparison/log-riemann-hilbert, HodgeTateAndCanonicalSubgroups:T6:comparison/arithmetic-log-de-rham, HodgeTateAndCanonicalSubgroups:T6:comparison/log-regularity-and-extension, HodgeTateAndCanonicalSubgroups:T6:log-sites/completed-kummer-local-systems, HodgeTateAndCanonicalSubgroups:T6:log-sites/boundary-local-system-extension, PadicHodgeTheory:P8/relative-de-rham-comparison, ClassicalAdicEtaleCohomology:H0, HodgeTateAndCanonicalSubgroups:T6:comparison/kummer-proper-pushforward-local-systems, HodgeTateAndCanonicalSubgroups:T6:log-sites/log-site-projections, AdicSpacesPartII:R3/kiehl-proper-mapping-theorem.

Sources: DLLZ-RH Theorem 3.2.7(5), p. 26; DLLZ-RH Theorem 3.2.7(5), p. 27; DLLZ-RH Proof of Corollary 3.5.14, p. 41; DLLZ-adic Corollary 6.3.5, p. 89.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:comparison/canonical-pro-kummer-realizations
TauCeti.LogAdic.CanonicalLogRealizations: not stated; needs the geometric carriers listed below.

Let (G,X) be a Shimura datum, Gᶜ its central split quotient, K a neat level and S^tor_{K,Σ} a smooth projective toroidal compactification whose boundary D is a normal-crossings divisor. For an algebraic representation W of Gᶜ, import the canonical automorphic étale Q_p-local system W_p on S_K and the automorphic filtered connection W_dR with its canonical extension (nilpotent residues along D, filtration by subbundles). W_p extends uniquely to a Kummer-étale Q_p-local system on S^tor_{K,Σ} (boundary local-system equivalence, characteristic 0), completed to Ŵ_p on the pro-Kummer-étale site, and this extension has unipotent geometric monodromy along D (DLLZ-RH p. 55, from (5.2.13)). Over a finite extension k of Q_p containing the p-adic completion of the reflex field (and the coefficient field), W_p|S_K is de Rham, and p-W_dR:=D_dR,log(W_p) is a filtered log connection on S^tor_{K,Σ,k} with nilpotent residues along D; after ι:Q̄_p≅C, the horizontal sections of the analytified base change of p-W_dR|S_K form the C-local system p-W_B. Each of W↦W_p, W_dR, p-W_dR, p-W_B is a G(A_f)-equivariant tensor functor on Rep(Gᶜ), functorial for morphisms of Shimura data. Full-group coefficients, not arbitrary Levi representations, carry these flat connections.

Hypotheses: Smooth projective toroidal compactification with normal-crossings boundary (strict normal crossings after étale localization); canonical full-group coefficients and their tensor/Hecke functoriality come from AutomorphicBundles. De Rham-ness of W_p on the open Shimura variety is an imported input (Liu–Zhu, Theorem 1.2, as cited in DLLZ-RH §5.2); it is not deduced from the comparison planned later in this stage.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:log-sites/boundary-local-system-extension, HodgeTateAndCanonicalSubgroups:T6:log-sites/completed-kummer-local-systems, HodgeTateAndCanonicalSubgroups:T6:log-sites/geometric-boundary-monodromy, HodgeTateAndCanonicalSubgroups:T6:comparison/arithmetic-log-de-rham, HodgeTateAndCanonicalSubgroups:T6:comparison/unipotent-log-tensor, AutomorphicBundles:B2/etale-coefficient-local-system, AutomorphicBundles:B2.general/general-flat-realizations, AutomorphicBundles:B3.general/general-logarithmic-comparison, ShimuraCompactifications:C2/smooth-normal-crossings.

TauCeti.LogAdic.CanonicalLogRealizations [constructor]: not stated; depends on the full geometric constructor.
The imported coefficient functors instantiated on the toroidal Kummer/pro-Kummer ringed sites, together with the p-adic realizations p-W_dR and p-W_B.

TauCeti.LogAdic.CanonicalLogRealizations.etale_restriction [compatibility]: not stated; depends on the full geometric constructor.
Restriction to the interior recovers the canonical p-adic local system.

TauCeti.LogAdic.CanonicalLogRealizations.de_rham_extension [compatibility]: not stated; depends on the full geometric constructor.
Its filtered log bundle is B3.general’s nilpotent-residue canonical extension.

TauCeti.LogAdic.CanonicalLogRealizations.hecke [functoriality]: not stated; depends on the full geometric constructor.
Pullbacks under finite-level Hecke maps agree with the coefficient representation action.

TauCeti.LogAdic.CanonicalLogRealizations.unipotent_monodromy [structure]: not stated; depends on the full geometric constructor.
W_p|S_K has unipotent geometric monodromy along every boundary component, which makes the residues of p-W_dR nilpotent (DLLZ-RH Theorem 3.2.12(2)); the Kummer-étale extension itself is unique by the boundary local-system equivalence, independently of unipotence.

TauCeti.LogAdic.CanonicalLogRealizations.p_de_rham [data]: not stated; depends on the full geometric constructor.
p-W_dR=D_dR,log(W_p) is a filtered log connection with nilpotent residues on S^tor_{K,Σ,k}; W↦p-W_dR is a tensor functor (DLLZ-RH Theorem 3.2.12(2)).

TauCeti.LogAdic.CanonicalLogRealizations.p_betti [data]: not stated; depends on the full geometric constructor.
After ι:Q̄_p≅C, the horizontal sections of the analytified p-W_dR|S_K form a C-local system p-W_B; W↦p-W_B is a G(A_f)-equivariant tensor functor.

TauCeti.LogAdic.CanonicalLogRealizations.tensor [compatibility]: not stated; depends on the full geometric constructor.
Tensor, dual and unit isomorphisms for W_p, W_dR, p-W_dR and p-W_B are canonical and coherent.

TauCeti.LogAdic.CanonicalLogRealizations.unit [degenerate]: not stated as an example; needs the full geometric constructor.
The trivial representation gives the constant Q_p sheaf and trivial filtered O bundle.

TauCeti.LogAdic.CanonicalLogRealizations.siegel [compatibility]: not stated as an example; needs the full geometric constructor.
In the Siegel case the standard representation is the semiabelian Tate/de Rham coefficient with its boundary extension.

TauCeti.LogAdic.CanonicalLogRealizations.no_levi_connection [non-example]: not stated as an example; needs the full geometric constructor.
An arbitrary Levi coefficient has an automorphic bundle but is not thereby assigned a full-group flat local system.

TauCeti.LogAdic.CanonicalLogRealizations.p_de_rham_unit [degenerate]: not stated as an example; needs the full geometric constructor.
For the trivial representation p-W_dR is O with d and the filtration Fil⁰=O, Fil¹=0, and p-W_B is the constant sheaf C; a nontrivial filtration jump or residue would fail this.

Sources: DLLZ-RH Proposition 5.2.10, p. 54; DLLZ-RH §5.2, (5.2.12)–(5.2.16), p. 55; DLLZ-RH Proposition 5.2.17, p. 56; BP §4.4.38, p. 79.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:comparison/special-point-comparison
TauCeti.LogAdic.special_point_comparison: not stated; needs the geometric carriers listed below.

Let h∈X be a special point, so h factors through T_R for a maximal Q-torus T⊆G, and K neat. For every W∈Rep(Gᶜ), the pullbacks of the Betti system W_B,C and of the p-adically reconstructed Betti system p-W_B to (G(Q)h)×G(A_f) are canonically and G(Q)×G(A_f)-equivariantly isomorphic to the trivial local system (G(Q)h)×W_C×G(A_f), on which G(Q) acts by diagonal left multiplication on all three factors and G(A_f) by right multiplication on the last. For p-W_B the identification passes through a CM motive M (Artin motives and abelian varieties potentially of CM type, absolute Hodge cycles) whose p-adic realization is the special-point Galois representation r(µ,W)⁺_{K,g,p}, and it does not depend on the choice of M. At h the Hodge filtrations of the pullbacks of p-W_dR and W_dR are both the one defined by the Hodge cocharacter µ_h. These identifications normalize the general coefficient comparison and its reflex-field descent.

Hypotheses: Use the proven CM/abelian-motive realizations and absolute Hodge-tensor compatibility (Blasius); this does not assert existence of motives for every general Shimura coefficient. h is a special point: h:S→G_R factors through T_R for a maximal torus T of G over Q; the level K is neat.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:comparison/canonical-pro-kummer-realizations, HodgeTateAndCanonicalSubgroups:T6:comparison/log-rh-pullback, ShimuraVarieties:V8.general, PadicHodgeTheory:P8/relative-de-rham-comparison.

Sources: DLLZ-RH Proposition 5.4.1, p. 58; DLLZ-RH proof of Proposition 5.4.1, p. 59; DLLZ-RH proof of Proposition 5.4.4, p. 60.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:comparison/canonical-arithmetic-monodromy
TauCeti.LogAdic.canonical_arithmetic_monodromy: not stated; needs the geometric carriers listed below.

Fix a connected component Γ⁺_{K,g₀}\X⁺ of S^an_{K,C} and identify the fibres of W_B,C and p-W_B at the image of the special point h with W_C by special-point-comparison. Then the monodromy representation ρ^{+,(p)}_{K,g₀}(W):Γ^{+,c}_{K,g₀}→GL(W_C) of p-W_B extends to an algebraic representation of G^{der,c} equal to W_C|G^{der,c}; the extension is unique by Borel density. The proof reduces to G^{der,c} Q-simple and simply connected. If G^der_R is of type A or has real rank ≤1, the datum is of abelian type and may be replaced by a Hodge-type datum, where the comparison is induced by the universal abelian scheme and Hodge tensors. Otherwise (real rank ≥2, not of type A) it uses Margulis superrigidity, the congruence subgroup property, Hecke compatibility and Borel density, and the Piatetski-Shapiro pair of embeddings, to identify every simple factor.

Hypotheses: Only the arithmetic-group instances permitted by DLLZ-RH §§5.4–5.6 are requested; generic superrigidity and congruence results are imported from an arithmetic roadmap addition. K neat; W∈Rep(Gᶜ); the comparison is made on one connected component at a time through the special-point identification of Proposition 5.4.1.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:comparison/special-point-comparison, HodgeTateAndCanonicalSubgroups:T6:comparison/canonical-pro-kummer-realizations, ArithmeticLocallySymmetricSpaces:ALS.1, ShimuraVarieties:V8.general, PadicHodgeTheory:P8/relative-de-rham-comparison, AutomorphicBundles:B1/hodge-tensor-realizations, AutomorphicBundles:B1/absolute-hodge-propagation.

Sources: DLLZ-RH Proposition 5.4.5, p. 61; DLLZ-RH Proposition 5.5.9, pp. 63–64; DLLZ-RH Lemma 5.6.7 and its proof, pp. 65–66; DLLZ-RH end of §5.6, p. 66.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:comparison/canonical-log-period-comparison
TauCeti.LogAdic.canonical_log_period_comparison: not stated; needs the geometric carriers listed below.

For every algebraic representation W of Gᶜ, on the pro-Kummer-étale site of S^tor_{K,Σ} over a finite extension k of Q_p containing the p-adic completion of the reflex field, there is a canonical isomorphism Ŵ_p⊗_{Q_p}OB_dR,log≃W_dR⊗_{O}OB_dR,log compatible with filtrations, connections and the Hecke action. It is the composite of the log Riemann–Hilbert isomorphism µ⁻¹D_dR,log(W_p)⊗OB_dR,log≃Ŵ_p⊗OB_dR,log (µ:S^tor_{K,Σ,prokét}→S^tor_{K,Σ,an} the projection of sites of arithmetic-log-de-rham, not the Hodge cocharacter µ; W_p is de Rham on S_K with unipotent boundary monodromy) with the isomorphism of filtered log connections p-W_dR≃W_dR⊗_E k of DLLZ-RH Theorem 5.3.1. It is an isomorphism of tensor functors, compatible with duals, change of level and maps of Shimura data, and descends compatibly with reflex-field canonical models. It identifies the nilpotent-residue boundary extensions, not just their interior restrictions.

Hypotheses: Use full-group canonical coefficients, their unipotent geometric boundary monodromy and the source canonical models. S^tor_{K,Σ} smooth projective with normal-crossings boundary and K neat, as in DLLZ-RH §5.2.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:comparison/canonical-arithmetic-monodromy, HodgeTateAndCanonicalSubgroups:T6:comparison/special-point-comparison, HodgeTateAndCanonicalSubgroups:T6:comparison/canonical-pro-kummer-realizations, HodgeTateAndCanonicalSubgroups:T6:comparison/arithmetic-log-de-rham, HodgeTateAndCanonicalSubgroups:T6:comparison/log-regularity-and-extension, HodgeTateAndCanonicalSubgroups:T6:comparison/unipotent-log-tensor, AutomorphicBundles:B3.general/general-canonical-extension, AutomorphicBundles:B3.general/general-boundary-functoriality, HodgeTateAndCanonicalSubgroups:T6:comparison/log-rh-pullback.

Sources: BP §4.4.38, p. 79; DLLZ-RH Theorem 5.3.1, p. 56; DLLZ-RH Proposition 5.4.4, p. 60; DLLZ-RH proof of Theorem 3.2.12(2), pp. 38–39.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:comparison/two-de-rham-lattices
TauCeti.LogAdic.TwoDeRhamLattices: component above; full geometric signature not stated.

On the pro-Kummer-étale site of S^tor_{K,Σ}, for W∈Rep(Gᶜ) put M:=Ŵ_p⊗_{Q_p}B_dR⁺ and M⁰:=(W_dR⊗_{O}OB⁺_dR,log)^{∇=0}. Both are B_dR⁺-local systems of rank dim W, and they are lattices in one B_dR-local system: M⊗_{B_dR⁺}B_dR=Ŵ_p⊗B_dR and M⁰⊗_{B_dR⁺}B_dR=(W_dR⊗OB_dR,log)^{∇=0}, identified by the horizontal sections of the canonical comparison isomorphism. Each lattice L∈{M,M⁰} defines the decreasing filtration Fil^iL:=Fil^iB_dR·L (=t^iL wherever t is defined), i∈Z, of this B_dR-local system; Fil⁰M=M, Fil⁰M⁰=M⁰ and M/Fil¹M=Ŵ_p⊗Ô. Horizontal sections are taken before extracting the lattice filtration; the filtration of M⁰ is its own t-adic one, not the Hodge filtration of W_dR (whose horizontal part is Fil^jM).

Hypotheses: Canonical associated unipotent/de Rham full-group coefficient; sheafwise lattices in the same localized module. S^tor_{K,Σ} log smooth with normal-crossings boundary, so the toric description of OB⁺_dR,log and the log Poincaré lemma apply.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:comparison/canonical-log-period-comparison, HodgeTateAndCanonicalSubgroups:T6:comparison/log-poincare, HodgeTateAndCanonicalSubgroups:T6:comparison/constant-log-periods, HodgeTateAndCanonicalSubgroups:T6:comparison/toric-structural-period-model.

TauCeti.LogAdic.TwoDeRhamLattices [constructor]: component above; full contract follows.
The common localized module with M, M⁰ and their specified filtrations.

TauCeti.LogAdic.TwoDeRhamLattices.common_localization [compatibility]: not stated; depends on the full geometric constructor.
Inverting t identifies both lattice localizations with the association’s period local system.

TauCeti.LogAdic.TwoDeRhamLattices.first_quotient [projection]: not stated; depends on the full geometric constructor.
M/Fil¹M identifies with W_p⊗Ô.

TauCeti.LogAdic.TwoDeRhamLattices.map [functoriality]: not stated; depends on the full geometric constructor.
A morphism of canonical coefficient representations carries both lattices and filtrations compatibly.

TauCeti.LogAdic.TwoDeRhamLattices.fil_eq [characterisation]: not stated; depends on the full geometric constructor.
Fil^iM=Fil^iB_dR·M and Fil^iM⁰=Fil^iB_dR·M⁰ for all i∈Z; in particular Fil^{i+1}L=t·Fil^iL where t is defined.

TauCeti.LogAdic.TwoDeRhamLattices.horizontal_frame [compatibility]: not stated; depends on the full geometric constructor.
M⁰⊗_{B_dR⁺}OB⁺_dR,log≅W_dR⊗_{O}OB⁺_dR,log compatibly with connections.

TauCeti.LogAdic.TwoDeRhamLattices.tensor [compatibility]: not stated; depends on the full geometric constructor.
M and M⁰ of W⊗W′ and of W^∨ are the tensor products and duals of those of W and W′, compatibly with their filtrations.

TauCeti.LogAdic.TwoDeRhamLattices.unit [degenerate]: not stated as an example; needs the full geometric constructor.
For the trivial representation the two lattices agree with B_dR⁺.

TauCeti.LogAdic.TwoDeRhamLattices.relative_position [computation]: component example above; full test follows.
For scalar rank-one lattices M=Ae and M⁰=tᵃAe in A[1/t]e, both localize to A[1/t]e, Fil^iM⁰=t^{a+i}Ae=Fil^{a+i}M for all i∈Z, and M∩Fil^jM⁰=t^{max(0,a+j)}Ae; for a≠0 the lattices differ although their localizations agree.

TauCeti.LogAdic.TwoDeRhamLattices.horizontal_requirement [non-example]: not stated as an example; needs the full geometric constructor.
The unrestricted module W_dR⊗OB_dR,log⁺ is not itself M⁰; its horizontal kernel is required.

TauCeti.LogAdic.TwoDeRhamLattices.tate_line [computation]: not stated as an example; needs the full geometric constructor.
For a rank-one associated pair with Ŵ_p≅Q_p(1) and W_dR=(O,d) with Gr^{−1}W_dR=W_dR, one has M⁰=Fil^{−1}B_dR·M=t⁻¹M, whereas Fil⁰ of the Hodge-induced filtration on (W_dR⊗OB_dR,log)^{∇=0} is M itself.

Sources: BP Remark 4.4.39 and following text, p. 79; BP Remark 4.4.39 and following text, p. 79.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:comparison/lattice-hodge-tate-filtration
TauCeti.LogAdic.LatticeHTFiltration: component above; full geometric signature not stated.

With M, M⁰ and their lattice filtrations from two-de-rham-lattices, define the ascending filtration F_{−j}(Ŵ_p⊗Ô):=(M∩Fil^jM⁰)/(Fil¹M∩Fil^jM⁰), equivalently the image of M∩Fil^jM⁰ in M/Fil¹M=Ŵ_p⊗Ô. Each F_i is a locally direct-summand Ô-submodule, the filtration is of the type of the Hodge cocharacter, and with BP’s negative filtration indexing its graded pieces satisfy Gr_j(Ŵ_p⊗Ô)(j)≃Gr^jW_dR⊗_{O}Ô. Record the convention by the displayed F_{−j} formula, rather than silently replacing the ascending filtration by the de Rham one.

Hypotheses: Two associated B_dR⁺ lattices from the canonical coefficient comparison; intersections and quotients are sheafwise.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:comparison/two-de-rham-lattices, HodgeTateAndCanonicalSubgroups:T6:comparison/canonical-log-period-comparison, HodgeTateAndCanonicalSubgroups:T6:comparison/log-poincare, HodgeTateAndCanonicalSubgroups:T1, HodgeTateAndCanonicalSubgroups:T2.

TauCeti.LogAdic.LatticeHTFiltration [constructor]: component above; full contract follows.
The image filtration with F_{−j}=image(M∩Fil^jM⁰→M/Fil¹M).

TauCeti.LogAdic.LatticeHTFiltration.mem [characterisation]: component above; full contract follows.
A quotient class lies in F_{−j} iff it has a lift belonging to M∩Fil^jM⁰.

TauCeti.LogAdic.LatticeHTFiltration.mono [structure]: component above; full contract follows.
The image filtration is increasing in the HT index because Fil^jM⁰ is decreasing.

TauCeti.LogAdic.LatticeHTFiltration.grade [compatibility]: not stated; depends on the full geometric constructor.
With the displayed BP indexing, its graded identification has the Tate twist (j): Gr_j(Ŵ_p⊗Ô)(j)≃Gr^jW_dR⊗Ô.

TauCeti.LogAdic.LatticeHTFiltration.map [functoriality]: component above; full contract follows.
Compatible maps of the two filtered lattices induce filtered quotient maps.

TauCeti.LogAdic.LatticeHTFiltration.locally_split [structure]: not stated; depends on the full geometric constructor.
Each F_i is a locally direct-summand Ô-submodule, F_i=0 for i below the lowest Hodge jump and F_i=Ŵ_p⊗Ô from the highest jump on.

TauCeti.LogAdic.LatticeHTFiltration.weight_zero [degenerate]: component example above; full test follows.
For a weight-zero line, F_i=0 for i<0 and F_i is the full line for i≥0.

TauCeti.LogAdic.LatticeHTFiltration.lattice_shift [computation]: component example above; full test follows.
For scalar t-adic filtration and M⁰=t^aM in rank one, F_i is zero for i<a and the full quotient for i≥a.

TauCeti.LogAdic.LatticeHTFiltration.correct_denominator [characterisation]: component example above; full test follows.
The quotient kernel at −j is Fil¹M∩Fil^jM⁰, not all of Fil¹M when that is not contained in Fil^jM⁰.

TauCeti.LogAdic.LatticeHTFiltration.tate_line [computation]: component example above; full test follows.
For the associated pair Ŵ_p≅Q_p(1), W_dR=(O,d) with Gr^{−1}W_dR=W_dR, F_{−2}=0 and F_{−1}=Ô(1), so Gr_{−1}(−1)≅Ô≅Gr^{−1}W_dR⊗Ô; a convention with F_j in place of F_{−j} would put the jump at +1.

TauCeti.LogAdic.LatticeHTFiltration.siegel_h1 [compatibility]: not stated as an example; needs the full geometric constructor.
On the open Siegel variety, for the pair (H₁(A,Q_p),H_{1,dR}(A)) of the universal abelian scheme, F_{−2}=0, F_{−1}=Lie(A)⊗Ô(1) and F₀=H₁(A,Q_p)⊗Ô, recovering 0→Lie(A)⊗Ô(1)→H₁(A,Q_p)⊗Ô→ω_{A^t}⊗Ô→0 (BP §4.4.8, p. 67).

Sources: BP text after Remark 4.4.39, p. 79; BP text after Remark 4.4.39, p. 79.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:comparison/canonical-ht-tensor
TauCeti.LogAdic.canonical_ht_tensor: not stated; needs the geometric carriers listed below.

For canonical full-group Gᶜ coefficients the lattice HT filtration is compatible with tensor products, duals, the unit representation and finite-level Hecke pullbacks: F_i(W⊗W′)=∑_{a+b=i}F_a(W)⊗F_b(W′), F_i(W^∨)=(F_{−i−1}(W))^⊥, and for the unit F_{−1}=0, F₀=Ô. The functor W↦(Ŵ_p⊗Ô,F_•) is exact, its graded pieces are exact in W, and it is of type µ. This is the filtered fibre functor from which hodge-tate-parabolic-reduction extracts the prescribed P^c_µ-reduction of the completed p-adic coefficient torsor.

Hypotheses: Use canonical unipotent tensor association; this is not a tensor theorem for arbitrary log local systems.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:comparison/lattice-hodge-tate-filtration, HodgeTateAndCanonicalSubgroups:T6:comparison/two-de-rham-lattices, HodgeTateAndCanonicalSubgroups:T6:comparison/canonical-log-period-comparison, HodgeTateAndCanonicalSubgroups:T6:comparison/unipotent-log-tensor, HodgeTateAndCanonicalSubgroups:T2, AutomorphicBundles:B2/coefficient-tensor-hecke, HodgeTateAndCanonicalSubgroups:T6:comparison/log-rh-pullback.

Source: BP text after Remark 4.4.39, p. 80.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:comparison/hodge-tate-parabolic-reduction
TauCeti.LogAdic.HodgeTateReduction: not stated; needs the geometric carriers listed below.

Over S^tor_{K,Σ} (K neat, smooth projective toroidal compactification with normal-crossings boundary, over a finite extension F of Q_p containing the reflex field and splitting G, with a cocharacter µ in the Hodge class defined over F), let G_pet,p be the pro-Kummer-étale Gᶜ(Q_p)-torsor of tensor isomorphisms W⊗_{Q_p}Q̂_p≅Ŵ_p, W∈Rep_{Q_p}(Gᶜ), so that G_pet,p×^{Gᶜ(Q_p)}W=Ŵ_p. Extend G^{c,an} to the pro-Kummer-étale site by U↦Gᶜ(Ô(U)) as in BP §4.4.8. The subsheaf P_HT⊆G_pet,p×^{Gᶜ(Q_p)}G^{c,an} of tensor trivializations W⊗Ô≅Ŵ_p⊗Ô carrying the standard ascending filtration Fil_iW:=⊕_{w≥−i}W[µ-weight w] to the lattice HT filtration F_i(Ŵ_p⊗Ô) for all W is a P^{c,an}_µ-torsor, P^c_µ={g: lim_{t→0}Ad µ(t)g exists}. On the de Rham side the canonical-extension torsor G^an_dR (étale site) has the P^{std,c,an}_µ-reduction P_dR given by the Hodge filtration, P^{std,c}_µ={g: lim_{t→∞}Ad µ(t)g exists}. Both reductions are Hecke-equivariant and compatible with change of level.

Hypotheses: The HT filtration is the tensor-compatible, exact, locally split filtration of type µ of canonical-ht-tensor; arbitrary filtered local systems are not claimed to give parabolic reductions. G_pet,p is defined from the coefficient functor W↦Ŵ_p, not from the toroidal level tower; its comparison with the tower’s deck group and its triviality over the tower diamond belong to PerfectoidShimuraVarieties:S6 (BP Theorem 4.4.40, §4.6.1).

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:comparison/canonical-ht-tensor, HodgeTateAndCanonicalSubgroups:T6:comparison/lattice-hodge-tate-filtration, HodgeTateAndCanonicalSubgroups:T6:comparison/canonical-pro-kummer-realizations, HodgeTateAndCanonicalSubgroups:T2, AutomorphicBundles:B0/central-split-quotient, AutomorphicBundles:B0/hodge-parabolic-convention, AutomorphicBundles:B1/filtration-reduction, AutomorphicBundles:B3.general/general-canonical-extension.

TauCeti.LogAdic.HodgeTateReduction [constructor]: not stated; depends on the full geometric constructor.
The pair (G_pet,p, P_HT) on the pro-Kummer-étale site of S^tor_{K,Σ}, with the imported de Rham reduction P_dR.

TauCeti.LogAdic.HodgeTateReduction.torsor_assoc [characterisation]: not stated; depends on the full geometric constructor.
G_pet,p×^{Gᶜ(Q_p)}W≅Ŵ_p naturally and tensor-compatibly in W.

TauCeti.LogAdic.HodgeTateReduction.mem [characterisation]: component above; full contract follows.
A local trivialization lies in P_HT iff it carries Fil_•W⊗Ô to F_•(Ŵ_p⊗Ô) for one (equivalently every) faithful W.

TauCeti.LogAdic.HodgeTateReduction.isTorsor [structure]: not stated; depends on the full geometric constructor.
P_HT is locally nonempty and simply transitive under P^{c,an}_µ.

TauCeti.LogAdic.HodgeTateReduction.levi [projection]: not stated; depends on the full geometric constructor.
P_HT×^{P^{c,an}_µ}M^{c,an}_µ is M_HT^an, the Levi torsor of finite-levi-torsor; similarly P_dR gives M_dR^an.

TauCeti.LogAdic.HodgeTateReduction.hecke [functoriality]: not stated; depends on the full geometric constructor.
Hecke pullbacks and change of level carry (G_pet,p,P_HT) and P_dR to the corresponding objects.

TauCeti.LogAdic.HodgeTateReduction.open_restriction [compatibility]: not stated; depends on the full geometric constructor.
Restricted to the pro-étale site of S_K, P_HT is the reduction defined by the same filtration of the interior local systems.

TauCeti.LogAdic.HodgeTateReduction.torus [degenerate]: component example above; full test follows.
If Gᶜ is a torus (µ central), P^c_µ=Gᶜ and P_HT is the whole pushed-out torsor.

TauCeti.LogAdic.HodgeTateReduction.siegel [compatibility]: not stated as an example; needs the full geometric constructor.
On the open Siegel variety P_HT is the torsor of similitude trivializations of H₁(A,Q_p)⊗Ô carrying the µ-weight-one Lagrangian of Q_p^{2g} (which is Fil_{−1}) to Lie(A)⊗Ô(1) (BP §4.4.8, with W the standard representation realized as H₁(A,Q_p)).

TauCeti.LogAdic.HodgeTateReduction.stabilizer_faithful [characterisation]: component example above; full test follows.
For a faithful W the stabilizer in Gᶜ of the ascending filtration Fil_•W is P^c_µ, not P^{std,c}_µ; the latter stabilizes the Hodge filtration of W_dR.

Sources: BP text after Remark 4.4.39, p. 80; BP text after Remark 4.4.39, p. 80; BP §4.4.8, p. 68; BP §4.0, p. 49.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:comparison/finite-levi-torsor
TauCeti.LogAdic.FiniteLeviComparison: component above; full geometric signature not stated.

Let P_dR⊆G_dR^an be the P^{std,c,an}_µ-reduction of the canonical-extension de Rham torsor given by the Hodge filtration (étale site of S^tor_{K,Σ}) and P_HT the P^{c,an}_µ-reduction of G_pet,p×^{Gᶜ(Q_p)}G^{c,an} given by the lattice HT filtration (pro-Kummer-étale site), where P^{std}_µ={g: lim_{t→∞}Ad µ(t)g exists} and P_µ={g: lim_{t→0}Ad µ(t)g exists} have common Levi M_µ. Put M_dR^an:=P_dR×^{P^{std,c,an}_µ}M^{c,an}_µ and M_HT^an:=P_HT×^{P^{c,an}_µ}M^{c,an}_µ. There is a canonical isomorphism of M^{c,an}_µ-torsors M_HT^an≃M_dR^an×^{µ,Z_p^×}Z_p(1) on the pro-Kummer-étale site of S^tor_{K,Σ}, compatible with the Hecke action, where Z_p(1) is the pro-étale Z_p^×-torsor of generators and µ:Z_p^×→M^{c,an}_µ is central. Hence a cyclotomic twist of M_HT^an is defined on the étale site. An untwisted equality requires an explicit cyclotomic trivialization.

Hypotheses: The central cocharacter µ acts on the common Levi; the de Rham and HT parabolic conventions are distinguished (P^{std,c}_µ stabilizes the Hodge filtration, P^c_µ the ascending HT filtration). BP states the identification “on the pro-étale site”; the node states it on the pro-Kummer-étale site of S^tor_{K,Σ}, where P_HT and the graded relation live.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:comparison/hodge-tate-parabolic-reduction, HodgeTateAndCanonicalSubgroups:T6:comparison/canonical-ht-tensor, HodgeTateAndCanonicalSubgroups:T6:comparison/canonical-log-period-comparison, HodgeTateAndCanonicalSubgroups:T2, AutomorphicBundles:B0/hodge-parabolic-convention, AutomorphicBundles:B3.general/general-canonical-extension.

TauCeti.LogAdic.FiniteLeviComparison [constructor]: component above; full contract follows.
The finite-level comparison of Levi torsors with the µ-contracted cyclotomic torsor.

TauCeti.LogAdic.FiniteLeviComparison.central_twist [characterisation]: component above; full contract follows.
The twisting action is through the central cocharacter µ:Z_p×→M_µᶜ.

TauCeti.LogAdic.FiniteLeviComparison.hecke [functoriality]: not stated; depends on the full geometric constructor.
The comparison commutes with finite-level Hecke pullbacks.

TauCeti.LogAdic.FiniteLeviComparison.trivialization [compatibility]: not stated; depends on the full geometric constructor.
Choosing a compatible generator of Z_p(1) identifies the contracted product with M_dR; changing that generator acts through µ.

TauCeti.LogAdic.FiniteLeviComparison.assoc_bundle [compatibility]: not stated; depends on the full geometric constructor.
For an M^c_µ-representation V on which µ(z) acts by z^w, M_HT^an×^{M^c_µ}V≅(M_dR^an×^{M^c_µ}V)⊗Ô(w), compatibly with tensor products and duals.

TauCeti.LogAdic.FiniteLeviComparison.weight_zero [degenerate]: component example above; full test follows.
For central weight zero the cyclotomic twist is trivial.

TauCeti.LogAdic.FiniteLeviComparison.weight_one [computation]: component example above; full test follows.
On a central weight-one character the contracted product is the associated Tate line, not an untwisted line with the same Galois action.

TauCeti.LogAdic.FiniteLeviComparison.change_generator [characterisation]: not stated as an example; needs the full geometric constructor.
Replacing a cyclotomic generator by u times it changes the trivialized comparison by µ(u); there is no generator-independent untwisted equality.

TauCeti.LogAdic.FiniteLeviComparison.graded_compatibility [compatibility]: not stated as an example; needs the full geometric constructor.
For W∈Rep(Gᶜ), the isomorphism induced on associated graded bundles is Gr_j(Ŵ_p⊗Ô)≅Gr^jW_dR⊗Ô(−j), the graded relation of lattice-hodge-tate-filtration; the twist by µ⁻¹ instead of µ would give Ô(j).

Sources: BP text after Remark 4.4.39, p. 80; BP text after Remark 4.4.39, p. 80; BP §4.4.8, p. 68; BP §4.0, p. 49.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6:comparison/hodge-type-comparison-agreement
TauCeti.LogAdic.hodge_type_comparison_agreement: not stated; needs the geometric carriers listed below.

Let (G,X) be of Hodge type (Gᶜ=G) with a Siegel embedding, faithful symplectic representation V₀ and universal abelian scheme f:A→S_K, with V₀ realized by H₁(A)=(R¹f_*)^∨ as in BP §4.4.8 and AutomorphicBundles:B1/hodge-tensor-realizations (DLLZ-RH (5.5.2) use the contragredient normalization V₀↦R¹f_*; the argument of their Lemma 5.5.3 applies verbatim to the dual realizations), so that the realizations of V₀^{⊗m}(−t) are the duals of the cohomology of A^m, up to Tate twist. On the open Shimura variety: (i) for W=V₀^{⊗m}(−t) the canonical isomorphism p-W_dR≃W_dR of canonical-log-period-comparison is the one induced by Scholze’s relative de Rham comparison for A^m, and for every irreducible W∈Rep(G) it is induced from these by the Hodge tensor s_W cutting W out of some V₀^{⊗m_W}(−t_W) (Lemma 5.5.6, Corollary 5.5.7), hence for every W∈Rep(G) by additivity; (ii) hence on S_K the period isomorphism Ŵ_p⊗OB_dR≃W_dR⊗OB_dR is the abelian-scheme comparison with Hodge tensors (Caraiani–Scholze §§2.2–2.3), and the lattice HT filtration, P_HT and the Levi comparison restrict to those built from A and its tensors.

Hypotheses: Hodge type with a fixed Siegel embedding and neat K; the statement is on the open Shimura variety S_K only (BP Remark 4.4.39: “outside of the boundary”). The identification of the lattice HT filtration of (H₁(A,Q_p),H_{1,dR}(A)) with the relative Hodge–Tate filtration of A is T2’s (Caraiani–Scholze §2.2), imported, not re-proved.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:comparison/canonical-log-period-comparison, HodgeTateAndCanonicalSubgroups:T6:comparison/canonical-arithmetic-monodromy, HodgeTateAndCanonicalSubgroups:T6:comparison/special-point-comparison, HodgeTateAndCanonicalSubgroups:T6:comparison/lattice-hodge-tate-filtration, HodgeTateAndCanonicalSubgroups:T6:comparison/hodge-tate-parabolic-reduction, HodgeTateAndCanonicalSubgroups:T6:comparison/finite-levi-torsor, PadicHodgeTheory:P8/relative-de-rham-comparison, AutomorphicBundles:B1/hodge-tensor-realizations, AutomorphicBundles:B1/absolute-hodge-propagation, HodgeTateAndCanonicalSubgroups:T2.

Sources: BP Remark 4.4.39, p. 79; DLLZ-RH Lemma 5.5.3, p. 62; DLLZ-RH Proposition 5.5.9 and its proof, pp. 63–64; DLLZ-RH Remark 5.5.10, p. 64.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T6/finite-level-canonical-package
TauCeti.LogAdic.finite_level_canonical_package: not stated; needs the geometric carriers listed below.

For every neat pure Shimura datum and smooth projective toroidal model S^tor_{K,Σ}, the canonical Gᶜ coefficient tensor functors are associated through completed logarithmic periods on the pro-Kummer-étale site. They yield the ascending Hodge–Tate flag, its P^c_µ-reduction P_HT and the cyclotomic Levi comparison M_HT≅M_dR×^{µ,Z_p^×}Z_p(1) at finite level, Hecke-compatibly, and for Hodge-type data they agree on the open Shimura variety with the constructions from the universal abelian scheme and its Hodge tensors. Export the full package to PerfectoidShimuraVarieties:S6, which owns the general toroidal-tower diamond Hodge–Tate map and coefficient pullback (BP Theorem 4.4.40). Export only early log-site geometry to PrismaticCohomology:PR.8 and log primitive comparison separately to completed/coherent cohomology consumers.

Hypotheses: This application is the narrowed T6 aggregate; it assumes no general-datum toroidal diamond is a perfectoid space.

Suppliers and local inputs: HodgeTateAndCanonicalSubgroups:T6:comparison/canonical-log-period-comparison, HodgeTateAndCanonicalSubgroups:T6:comparison/finite-levi-torsor, HodgeTateAndCanonicalSubgroups:T6:comparison/canonical-ht-tensor, HodgeTateAndCanonicalSubgroups:T6:comparison/hodge-tate-parabolic-reduction, HodgeTateAndCanonicalSubgroups:T6:comparison/hodge-type-comparison-agreement, HodgeTateAndCanonicalSubgroups:T6:comparison/log-primitive-comparison.

Sources: BP §4.4.38, p. 79; BP text before Theorem 4.4.40, p. 80.
-/
