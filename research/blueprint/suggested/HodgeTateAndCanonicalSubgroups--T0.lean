/-
This suggested file is not the roadmap and is not exhaustive. The reader document
is definitive. These statements suggest Lean forms so that contributors and
reviewers converge on names and signatures; every proof and new construction is
provisional. No declaration here is claimed to be implemented.

Baseline: Mathlib 082e2d3; Tau Ceti f790474. The unavailable supplier conditions
are omitted and identified beside each signature, rather than represented by
unspecified Prop fields. Consequently the signatures with omitted conditions
are schematic and are not unconditional mathematical assertions. In particular
supplier geometry is passed as actual schemes, module sheaves, functors, maps,
and subobjects. The reader gives the full conditions and source locators.

R07.1 owns p-divisible groups, Tate modules and their finite realizations; C4 owns
semi-abelian groups; R11.3 owns Raynaud charts; P8/P9 own period sheaves and
comparison; R09.1/B0 own reductive flag geometry; O5 owns weight sheaves.
The carriers below are applications of those outputs, not new definitions of
those theories. Only the algebraic character formula reuses affine Hopf data.
-/
import TauCeti.Algebra.AlgebraicGroup.Tangent.Cotangent
import TauCeti.AlgebraicGeometry.AffineGroupScheme.CartierDuality.FiniteLocallyFree
import TauCeti.AlgebraicGeometry.AffineGroupScheme.CartierDuality.BaseChange
import Mathlib.AlgebraicGeometry.Group.Affine
import Mathlib.AlgebraicGeometry.Modules.Sheaf
import Mathlib.AlgebraicGeometry.Morphisms.Etale
import Mathlib.Algebra.Category.ModuleCat.Sheaf.Submodule
import Mathlib.Algebra.Category.ModuleCat.Sheaf.LocallyFree
import Mathlib.Algebra.Category.ModuleCat.Sheaf.Free
import Mathlib.Algebra.Module.Torsion.Basic
import Mathlib.Algebra.Exact.Basic
import Mathlib.RingTheory.HopfAlgebra.GroupLike
import Mathlib.RingTheory.HopfAlgebra.MonoidAlgebra
import Mathlib.RingTheory.Grassmannian
import Mathlib.RingTheory.Valuation.Basic
import Mathlib.RingTheory.Ideal.Quotient.Operations
import Mathlib.RingTheory.Kaehler.Basic
import Mathlib.RingTheory.Length
import Mathlib.RingTheory.PicardGroup
import Mathlib.LinearAlgebra.Matrix.Notation
import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
import Mathlib.LinearAlgebra.Dimension.Finrank
import Mathlib.LinearAlgebra.FreeModule.Basic
import Mathlib.Algebra.DirectSum.Module
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.NumberTheory.Padics.PadicNumbers
import Mathlib.Data.ZMod.Basic
import Mathlib.Basic.Real.Basic
import Mathlib.RingTheory.HopfAlgebra.TensorProduct
import Mathlib.RingTheory.FractionalIdeal.Operations
import Mathlib.CategoryTheory.Subobject.Basic
import Mathlib.Topology.Maps.Basic

noncomputable section
set_option linter.unusedVariables false
open CategoryTheory AlgebraicGeometry
open scoped TensorProduct BigOperators
universe u v w
namespace TauCeti.HodgeTate

/-! T0: invariant differentials on schemes, then the affine character formula. -/

/-- R07.1 supplies Ω and the unit section of the finite locally free group G. -/
def conormal (S : Scheme) (G : Grp (Over S))
    (Ω : G.X.left.Modules) (e : S ⟶ G.X.left) : S.Modules :=
  (Scheme.Modules.pullback e).obj Ω

/-- The affine carrier is the existing Tau Ceti augmentation cotangent space. -/
abbrev affineConormal (R : Type u) (A : Type v) [CommRing R] [CommRing A] [Bialgebra R A] :=
  TauCeti.Bialgebra.CotangentSpace R A

abbrev FiniteGroup (R : Type u) [CommRing R] :=
  TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat (CommRingCat.of R)

-- Omitted: Ω = Ω¹_{G/S}, e the group unit, and f the group homomorphism.
def conormal_map {S : Scheme} {G H : Grp (Over S)} (f : G ⟶ H)
    (ΩG : G.X.left.Modules) (eG : S ⟶ G.X.left)
    (ΩH : H.X.left.Modules) (eH : S ⟶ H.X.left) :
    conormal S H ΩH eH ⟶ conormal S G ΩG eG := sorry

-- Omitted: H is the cartesian base change of G, with the associated Ω and units.
def conormal_baseChange {S S' : Scheme} (f : S' ⟶ S)
    (G : Grp (Over S)) (H : Grp (Over S'))
    (ΩG : G.X.left.Modules) (eG : S ⟶ G.X.left)
    (ΩH : H.X.left.Modules) (eH : S' ⟶ H.X.left) :
    (Scheme.Modules.pullback f).obj (conormal S G ΩG eG) ≅
      conormal S' H ΩH eH := sorry

-- R07.1 supplies the fppf-exact group sequence and its conormal maps.
-- Exactness is expressed on every affine patch as an actual module sequence.
theorem conormal_rightExact {R : Type u} [CommRing R]
    (M N P : ModuleCat R) (i : M ⟶ N) (q : N ⟶ P) :
    Function.Exact i q ∧ Function.Surjective q := sorry

section Affine
variable (R A : Type u) [CommRing R] [CommRing A] [HopfAlgebra R A]

theorem conormal_eq_cotangentSpace :
    affineConormal R A = TauCeti.Bialgebra.CotangentSpace R A := sorry

-- Omitted: A represents a finite locally free group, not an arbitrary Hopf algebra.
theorem conormal_finitePresentation :
    Module.FinitePresentation R (affineConormal R A) := sorry

-- Omitted: f is the structure map of Spec A over Spec R.
theorem conormal_eq_zero_iff_etale (f : Scheme.Spec.obj (Opposite.op (CommRingCat.of A)) ⟶
    Scheme.Spec.obj (Opposite.op (CommRingCat.of R))) :
    Subsingleton (affineConormal R A) ↔ Etale f := sorry

/-- A is the coordinate Hopf algebra of the Cartier dual. -/
def hodgeTateMap : Additive (GroupLike R A) →+ affineConormal R A := sorry

theorem hodgeTateMap_add (x y : Additive (GroupLike R A)) :
    hodgeTateMap R A (x + y) = hodgeTateMap R A x + hodgeTateMap R A y ∧
      hodgeTateMap R A 0 = 0 := sorry

theorem hodgeTateMap_apply_groupLike (x : Additive (GroupLike R A)) :
    hodgeTateMap R A x = TauCeti.Bialgebra.cotangentMap R A x.toMul.val := sorry

def characterMap {B : Type u} [CommRing B] [HopfAlgebra R B] (f : A →ₐc[R] B) :
    Additive (GroupLike R A) →+ Additive (GroupLike R B) := sorry

def affineConormalMap {B : Type u} [CommRing B] [HopfAlgebra R B] (f : A →ₐc[R] B) :
    affineConormal R A →ₗ[R] affineConormal R B := sorry

theorem hodgeTateMap_natural {B : Type u} [CommRing B] [HopfAlgebra R B]
    (f : A →ₐc[R] B) (x : Additive (GroupLike R A)) :
    hodgeTateMap R B (characterMap R A f x) =
      affineConormalMap R A f (hodgeTateMap R A x) := sorry

variable {R' : Type u} [CommRing R'] [Algebra R R']

-- Omitted: the tensor-product Hopf structure is the canonical scalar extension.
def baseChangedCharacter (x : Additive (GroupLike R A)) :
    Additive (GroupLike R' (R' ⊗[R] A)) := sorry

def affineConormal_baseChanged :
    R' ⊗[R] affineConormal R A ≃ₗ[R'] affineConormal R' (R' ⊗[R] A) := sorry

theorem hodgeTateMap_baseChange (x : Additive (GroupLike R A)) :
    hodgeTateMap R' (R' ⊗[R] A) (baseChangedCharacter R A (R' := R') x) =
      affineConormal_baseChanged R A (R' := R') (1 ⊗ₜ[R] hodgeTateMap R A x) := sorry

def hodgeTateLinear : R ⊗[ℤ] Additive (GroupLike R A) →ₗ[R] affineConormal R A := sorry

theorem hodgeTateMap_compatibilities {B : Type u} [CommRing B] [HopfAlgebra R B]
    (f : A →ₐc[R] B) (x : Additive (GroupLike R A)) :
    hodgeTateMap R B (characterMap R A f x) =
      affineConormalMap R A f (hodgeTateMap R A x) := sorry
end Affine

abbrev MuAlgebra (R : Type u) [CommRing R] (q : ℕ) :=
  MonoidAlgebra R (Multiplicative (ZMod q))

def muCharacter (R : Type u) [CommRing R] (q : ℕ) :
    Additive (GroupLike R (MuAlgebra R q)) := sorry

section FiniteTests
variable (R : Type u) [CommRing R] (q : ℕ) [NeZero q]
-- Omitted: the Hopf structure on the function ring is the constant cyclic group.
variable [HopfAlgebra R (ZMod q → R)]
variable (hε : ∀ a : ZMod q → R, Bialgebra.counitAlgHom R (ZMod q → R) a = a 0)

include hε

theorem conormal_constant_eq_zero : Subsingleton (affineConormal R (ZMod q → R)) := sorry
example : Subsingleton (affineConormal R (ZMod q → R)) := sorry

theorem conormal_mu : Nonempty (affineConormal R (MuAlgebra R q) ≃ₗ[R]
    R ⧸ Ideal.span ({(q : R)} : Set R)) := sorry
example : Nonempty (affineConormal R (MuAlgebra R q) ≃ₗ[R]
    R ⧸ Ideal.span ({(q : R)} : Set R)) := sorry

theorem hodgeTateMap_constant :
    Submodule.span R {hodgeTateMap R (MuAlgebra R q) (muCharacter R q)} = ⊤ := sorry
example : Submodule.span R {hodgeTateMap R (MuAlgebra R q) (muCharacter R q)} = ⊤ := sorry

theorem hodgeTateMap_mu_eq_zero : hodgeTateMap R (ZMod q → R) = 0 := sorry
example : hodgeTateMap R (ZMod q → R) = 0 := sorry

-- Omitted: R is the cyclotomic valuation ring in the reader's test (q=p).
theorem hodgeTateMap_depends_on_model (hq : ¬ IsUnit (q : R)) :
    hodgeTateMap R (MuAlgebra R q) (muCharacter R q) ≠ 0 ∧
      hodgeTateMap R (ZMod q → R) = 0 := sorry
example (hq : ¬ IsUnit (q : R)) :
    hodgeTateMap R (MuAlgebra R q) (muCharacter R q) ≠ 0 ∧
      hodgeTateMap R (ZMod q → R) = 0 := sorry
end FiniteTests

-- Omitted: A is the additive α_p Hopf algebra with presentation F_p[X]/(X^p).
theorem conormal_alphaP (p : ℕ) [Fact p.Prime] (A : Type u)
    [CommRing A] [HopfAlgebra (ZMod p) A] :
    Module.finrank (ZMod p) (affineConormal (ZMod p) A) = 1 := sorry
example (p : ℕ) [Fact p.Prime] (A : Type u) [CommRing A] [HopfAlgebra (ZMod p) A] :
    Module.finrank (ZMod p) (affineConormal (ZMod p) A) = 1 := sorry

section AffineCompatibilityTests
variable (R A : Type u) [CommRing R] [CommRing A] [HopfAlgebra R A]
theorem conormal_eq_cotangentSpace_test :
    affineConormal R A = TauCeti.Bialgebra.CotangentSpace R A := sorry
example : affineConormal R A = TauCeti.Bialgebra.CotangentSpace R A := sorry

theorem hodgeTateMap_cotangentMap (x : Additive (GroupLike R A)) :
    hodgeTateMap R A x = TauCeti.Bialgebra.cotangentMap R A x.toMul.val := sorry
example (x : Additive (GroupLike R A)) :
    hodgeTateMap R A x = TauCeti.Bialgebra.cotangentMap R A x.toMul.val := sorry
end AffineCompatibilityTests

/-! The p-divisible group and its compatible finite realizations are supplied by R07.1.
The inputs below are the actual modules and transition maps, not an ersatz group. -/
def pDivisibleConormal (O : Type u) [CommRing O] (W : ℕ → ModuleCat O)
    (transition : ∀ n, W (n+1) ⟶ W n) : ModuleCat O := sorry

section PDivisible
variable (p : ℕ) [Fact p.Prime] (O : Type u) [CommRing O] [Algebra (PadicInt p) O]
variable (T W : Type u) [AddCommGroup T] [Module (PadicInt p) T]
variable [AddCommGroup W] [Module O W] [Module (PadicInt p) W]
variable [IsScalarTower (PadicInt p) O W]

def levelIdeal (n : ℕ) : Submodule O W := Ideal.span ({(p : O)^n} : Set O) • ⊤
-- Omitted: finite is the compatible finite character system and W is p-complete.
def pDivisibleHodgeTateMap (finite : ∀ n, T →+ W ⧸ levelIdeal p O W n) :
    T →ₗ[PadicInt p] W := sorry

theorem pDivisibleHodgeTateMap_mod (finite : ∀ n, T →+ W ⧸ levelIdeal p O W n)
    (n : ℕ) (t : T) :
    Submodule.Quotient.mk (pDivisibleHodgeTateMap p O T W finite t) = finite n t := sorry

def pDivisibleHodgeTateLinear (α : T →ₗ[PadicInt p] W) :
    O ⊗[PadicInt p] T →ₗ[O] W := sorry

-- Omitted: f, fD and α' are the maps of the supplied homomorphism of groups.
theorem pDivisibleHodgeTateMap_natural (T' W' : Type u)
    [AddCommGroup T'] [Module (PadicInt p) T'] [AddCommGroup W'] [Module (PadicInt p) W']
    (α : T →ₗ[PadicInt p] W) (α' : T' →ₗ[PadicInt p] W')
    (f : T →ₗ[PadicInt p] T') (fD : W →ₗ[PadicInt p] W') :
    α'.comp f = fD.comp α := sorry

-- Omitted: τT and τW are the compatible Galois actions of the K-model.
theorem pDivisibleHodgeTateMap_galois (Γ : Type u) [Group Γ]
    (α : T →ₗ[PadicInt p] W) (τT : Γ →* (T ≃ₗ[PadicInt p] T))
    (τW : Γ →* (W ≃ₗ[PadicInt p] W)) (γ : Γ) (t : T) :
    α (τT γ t) = τW γ (α t) := sorry
end PDivisible

-- Omitted: O is O_C and these identifications use dt/t and the constant Tate basis.
theorem pDivisibleHodgeTateMap_QpZp (O : Type u) [CommRing O] (α : O →ₗ[O] O) :
    α = LinearMap.id ∧ Function.Bijective α := sorry
example (O : Type u) [CommRing O] (α : O →ₗ[O] O) :
    α = LinearMap.id ∧ Function.Bijective α := sorry

theorem pDivisibleHodgeTateMap_mu (R T W : Type u) [CommRing R]
    [AddCommGroup T] [Module R T] [AddCommGroup W] [Module R W] [Subsingleton W]
    (α : T →ₗ[R] W) : α = 0 := sorry
example (R T W : Type u) [CommRing R] [AddCommGroup T] [Module R T]
    [AddCommGroup W] [Module R W] [Subsingleton W] (α : T →ₗ[R] W) : α = 0 := sorry

-- Omitted: α is the supersingular integral character map and its computed cokernel is nonzero.
theorem pDivisibleHodgeTateMap_not_surjective_integrally (O T W : Type u) [CommRing O]
    [AddCommGroup T] [Module O T] [AddCommGroup W] [Module O W]
    (α : T →ₗ[O] W) : ¬ Function.Surjective α := sorry
example (O T W : Type u) [CommRing O] [AddCommGroup T] [Module O T]
    [AddCommGroup W] [Module O W] (α : T →ₗ[O] W) : ¬ Function.Surjective α := sorry

-- Omitted: d is Tate's decomposition and α the rational character map under it.
theorem pDivisibleHodgeTateMap_tate (C V W U : Type u) [Field C]
    [AddCommGroup V] [Module C V] [AddCommGroup W] [Module C W]
    [AddCommGroup U] [Module C U] (d : V ≃ₗ[C] W × U) (α : V →ₗ[C] W) :
    α = (LinearMap.fst C W U).comp d.toLinearMap := sorry
example (C V W U : Type u) [Field C] [AddCommGroup V] [Module C V]
    [AddCommGroup W] [Module C W] [AddCommGroup U] [Module C U]
    (d : V ≃ₗ[C] W × U) (α : V →ₗ[C] W) :
    α = (LinearMap.fst C W U).comp d.toLinearMap := sorry

/-! T0: Fargues degree. The Fitting ideal API belongs to StableReduction/R07.1.
The scalar-valued degree is applied to their finitely presented torsion conormal
module over a normalized rank-one valuation ring. Those conditions, and the
normalization v(p)=1, are omitted from the schematic module-only signatures. -/
section Degree
variable (O : Type u) [CommRing O] (v : AddValuation O (WithTop ℝ))

def discriminantDivisor (G : FiniteGroup O) (ω : ModuleCat O) : Ideal O := sorry

def farguesDegree (v : AddValuation O (WithTop ℝ)) (ω : ModuleCat O) : ℝ := sorry

theorem farguesDegree_eq_sum (ω : ModuleCat O) (r : ℕ) (a : Fin r → O)
    (presentation : ω ≃ₗ[O] (DirectSum (Fin r) (fun i => O ⧸ Ideal.span {a i})))
    (ha : ∀ i, a i ≠ 0) :
    farguesDegree O v ω = ∑ i, (v (a i)).untopD 0 := sorry

def fargueSlope (ω : ModuleCat O) (h : ℕ) (hh : 0 < h) : ℝ :=
  farguesDegree O v ω / h

-- Omitted: fω is the conormal map of an isogeny with finite flat kernel K.
theorem farguesDegree_isogeny (K : FiniteGroup O) (ωK : ModuleCat O)
    (d : ℕ) (fω : (Fin d → O) →ₗ[O] (Fin d → O)) :
    farguesDegree O v ωK = (v (LinearMap.det fω)).untopD 0 := sorry

-- Omitted: the finite group is monogenic with unit T=0, separable generic fibre.
theorem farguesDegree_monogenic (ω : ModuleCat O) (f : Polynomial O) :
    farguesDegree O v ω = (v (f.derivative.eval 0)).untopD 0 := sorry

-- Omitted: ω is the conormal module of the indicated constant/multiplicative/BT group.
theorem farguesDegree_constant (ω : ModuleCat O) [Subsingleton ω] :
    farguesDegree O v ω = 0 := sorry
example (ω : ModuleCat O) [Subsingleton ω] : farguesDegree O v ω = 0 := sorry

theorem farguesDegree_mu (p n : ℕ) [Fact p.Prime] (hp : v (p : O) = 1) :
    farguesDegree O v (ModuleCat.of O (O ⧸ Ideal.span {(p : O)^n})) = n := sorry
example (p n : ℕ) [Fact p.Prime] (hp : v (p : O) = 1) :
    farguesDegree O v (ModuleCat.of O (O ⧸ Ideal.span {(p : O)^n})) = n := sorry

-- Omitted: O has value group Q and a has value 1/2; no Noetherian assumption.
theorem farguesDegree_not_length (a : O) (ha : v a = (1/2 : ℝ)) :
    farguesDegree O v (ModuleCat.of O (O ⧸ Ideal.span {a})) = 1/2 ∧
      Module.length O (O ⧸ Ideal.span {a}) = ⊤ := sorry
example (a : O) (ha : v a = (1/2 : ℝ)) :
    farguesDegree O v (ModuleCat.of O (O ⧸ Ideal.span {a})) = 1/2 ∧
      Module.length O (O ⧸ Ideal.span {a}) = ⊤ := sorry

theorem farguesDegree_ellipticTorsion (ω : ModuleCat O) : farguesDegree O v ω = 1 := sorry
example (ω : ModuleCat O) : farguesDegree O v ω = 1 := sorry

-- Omitted: i,q arise from a finite flat exact group sequence, not arbitrary conormal maps.
theorem farguesDegree_properties (ω₁ ω₂ ω₃ ωD : ModuleCat O) (h : ℕ)
    (i : ω₃ ⟶ ω₂) (q : ω₂ ⟶ ω₁) :
    farguesDegree O v ω₂ = farguesDegree O v ω₁ + farguesDegree O v ω₃ ∧
      farguesDegree O v ω₂ + farguesDegree O v ωD = h ∧
      0 ≤ farguesDegree O v ω₂ ∧ farguesDegree O v ω₂ ≤ h := sorry

-- Omitted: f is a finite flat group homomorphism, an isomorphism generically;
-- ω and ω' are its two conormal modules. IsIso concerns the actual group map.
theorem farguesDegree_genericIsomorphism (G H : FiniteGroup O) (f : G ⟶ H)
    (ω ω' : ModuleCat O) :
    farguesDegree O v ω ≤ farguesDegree O v ω' ∧
      (farguesDegree O v ω = farguesDegree O v ω' ↔ IsIso f) := sorry
end Degree

/-! Global determinant ideals are actual subsheaves of O_S. Their invertibility
and regularity are the supplier's effective-Cartier-divisor structure. -/
def farguesDivisor (S : Scheme) (G : Grp (Over S)) (ω : S.Modules) :
    SheafOfModules.Submodule (SheafOfModules.unit S.ringCatSheaf) := sorry

-- Omitted: associated finite flat geometry; η is the inclusion of the open étale locus.
def farguesDivisor_support (S U : Scheme) (η : U ⟶ S) (G : Grp (Over S))
    (ω : S.Modules) :
    (Scheme.Modules.pullback η).obj (farguesDivisor S G ω).toSheafOfModules ≅
      SheafOfModules.unit U.ringCatSheaf := sorry

-- On affine patches addition of effective Cartier divisors is multiplication of ideals.
theorem farguesDivisor_add_dual (O : Type u) [CommRing O] (G GD : FiniteGroup O)
    (ω ωD : ModuleCat O) (p h : ℕ) :
    discriminantDivisor O G ω * discriminantDivisor O GD ωD = Ideal.span {(p : O)^h} := sorry

-- Omitted: the canonical base change, with regular determinant; flatness suffices.
theorem farguesDivisor_pullback (O O' : Type u) [CommRing O] [CommRing O']
    (f : O →+* O') (G : FiniteGroup O) (G' : FiniteGroup O') (ω : ModuleCat O)
    (ω' : ModuleCat O') :
    Ideal.map f (discriminantDivisor O G ω) = discriminantDivisor O' G' ω' := sorry

theorem farguesDivisor_rankOne (O : Type u) [CommRing O]
    (v : AddValuation O (WithTop ℝ)) (G : FiniteGroup O) (ω : ModuleCat O)
    (a : O) (ha : discriminantDivisor O G ω = Ideal.span {a}) :
    (v a).untopD 0 = farguesDegree O v ω := sorry

-- Omitted: these are the indicated group models and their conormal modules.
theorem farguesDivisor_mu (O : Type u) [CommRing O] (p n : ℕ)
    (G : FiniteGroup O) (ω : ModuleCat O) :
    discriminantDivisor O G ω = Ideal.span {(p : O)^n} := sorry
example (O : Type u) [CommRing O] (p n : ℕ) (G : FiniteGroup O) (ω : ModuleCat O) :
    discriminantDivisor O G ω = Ideal.span {(p : O)^n} := sorry

theorem farguesDivisor_etale (O : Type u) [CommRing O] (G : FiniteGroup O)
    (ω : ModuleCat O) [Subsingleton ω] : discriminantDivisor O G ω = ⊤ := sorry
example (O : Type u) [CommRing O] (G : FiniteGroup O) (ω : ModuleCat O)
    [Subsingleton ω] : discriminantDivisor O G ω = ⊤ := sorry

theorem farguesDivisor_not_reduced (O : Type u) [CommRing O] (p : ℕ)
    (a : O) (ha : a^2 = (p : O)) (hstrict : Ideal.span {a^2} ≠ Ideal.span {a}) :
    Ideal.span {(p : O)} = Ideal.span {a}^2 ∧
      Ideal.span {(p : O)} ≠ Ideal.span {a} := sorry
example (O : Type u) [CommRing O] (p : ℕ) (a : O) (ha : a^2 = (p : O))
    (hstrict : Ideal.span {a^2} ≠ Ideal.span {a}) :
    Ideal.span {(p : O)} = Ideal.span {a}^2 ∧ Ideal.span {(p : O)} ≠ Ideal.span {a} := sorry

-- Semi-abelian schemes A,B and their Lie determinant lines come from C4/C5.
def isogenyDivisor {S : Scheme} (A B : Grp (Over S)) (f : A ⟶ B)
    (detLieA detLieB : S.Modules) :
    SheafOfModules.Submodule (SheafOfModules.unit S.ringCatSheaf) := sorry

-- The conormal determinant map on an affine trivialization; regular generically.
def deltaSection (O : Type u) [CommRing O] (g : ℕ)
    (LieMap : (Fin g → O) →ₗ[O] (Fin g → O)) : O := LinearMap.det LieMap

theorem isogenyDivisor_comp (O : Type u) [CommRing O] (g : ℕ)
    (f h : (Fin g → O) →ₗ[O] (Fin g → O)) :
    Ideal.span {deltaSection O g (h.comp f)} =
      Ideal.span {deltaSection O g h} * Ideal.span {deltaSection O g f} := sorry

-- Omitted: K is finite flat and is the kernel of the isogeny with Lie map f.
theorem isogenyDivisor_eq_farguesDivisor (O : Type u) [CommRing O] (g : ℕ)
    (f : (Fin g → O) →ₗ[O] (Fin g → O)) (K : FiniteGroup O) (ωK : ModuleCat O) :
    Ideal.span {deltaSection O g f} = discriminantDivisor O K ωK := sorry

theorem isogenyDivisor_mulP (O : Type u) [CommRing O] (p g : ℕ) :
    Ideal.span {deltaSection O g ((p : O) • LinearMap.id)} = Ideal.span {(p : O)^g} := sorry

theorem isogenyDivisor_id (O : Type u) [CommRing O] (g : ℕ) :
    Ideal.span {deltaSection O g LinearMap.id} = ⊤ := sorry
example (O : Type u) [CommRing O] (g : ℕ) :
    Ideal.span {deltaSection O g LinearMap.id} = ⊤ := sorry

theorem isogenyDivisor_mulP_test (O : Type u) [CommRing O] (p g : ℕ) :
    Ideal.span {deltaSection O g ((p : O) • LinearMap.id)} = Ideal.span {(p : O)^g} := sorry
example (O : Type u) [CommRing O] (p g : ℕ) :
    Ideal.span {deltaSection O g ((p : O) • LinearMap.id)} = Ideal.span {(p : O)^g} := sorry

-- The Tate-curve toric quotient has finite flat μ_p kernel; it is not a counterexample.
theorem isogenyDivisor_kernel_not_finite (O : Type u) [CommRing O] (p : ℕ) :
    Ideal.span {deltaSection O 1 ((p : O) • LinearMap.id)} = Ideal.span {(p : O)} := sorry
example (O : Type u) [CommRing O] (p : ℕ) :
    Ideal.span {deltaSection O 1 ((p : O) • LinearMap.id)} = Ideal.span {(p : O)} := sorry

-- On a split chart the source is the constant character lattice tensor the base.
-- Global points of the constant sheaf on a disconnected ring are a different module.
-- Omitted: W is ω of μ_(p^n)^r, and α is its actual character map.
def multiplicativeHodgeTateIso (R : Type u) [CommRing R] (p n r : ℕ)
    (W : Type u) [AddCommGroup W] [Module R W]
    (α : (R ⊗[ℤ] (Fin r → ZMod (p^n))) →ₗ[R] W) :
    (R ⊗[ℤ] (Fin r → ZMod (p^n))) ≃ₗ[R] W := sorry

/-! T0: semi-abelian boundary. There is no dual of an arbitrary semi-abelian
scheme here: finite Cartier duals and the separate full one-motive are used. -/
def semiAbelianTorsion {S : Scheme} (G : Grp (Over S)) (p n : ℕ) : Grp (Over S) := sorry

-- C4/R11.3 supply the finite part H, the torus T and abelian quotient B.
theorem semiAbelianTorsion_finitePart_exact (T H B : Type u) [AddCommGroup T]
    [AddCommGroup H] [AddCommGroup B] (i : T →+ H) (q : H →+ B) :
    Function.Injective i ∧ Function.Exact i q ∧ Function.Surjective q := sorry

theorem semiAbelianTorsion_card (H : Type u) [Fintype H] (p n g r : ℕ) (hr : r ≤ g) :
    Fintype.card H = p^(n*(2*g-r)) := sorry

-- R11.3 supplies T=T_pG̃, V=T_pA, Y=Y_lattice⊗Z_p and the maps.
theorem semiAbelianTateModule_extension (p : ℕ) [Fact p.Prime]
    (T V Y : ModuleCat (PadicInt p)) (i : T ⟶ V) (q : V ⟶ Y) :
    Function.Injective i ∧ Function.Exact i q ∧ Function.Surjective q := sorry

theorem semiAbelianHodgeTate_toric (R : Type u) [CommRing R]
    (T W TD WT : ModuleCat R) (α : T ⟶ W) (αD : TD ⟶ WT) :
    α = 0 ∧ Function.Bijective αD := sorry

-- Omitted: H is the finite torsion in the abelian/split-torus/torus-rank-one chart.
theorem semiAbelianTorsion_abelian (H : Type u) [Fintype H] (p n g : ℕ) :
    Fintype.card H = p^(2*n*g) := sorry
example (H : Type u) [Fintype H] (p n g : ℕ) : Fintype.card H = p^(2*n*g) := sorry

theorem semiAbelianTorsion_torus (O : Type u) [CommRing O]
    (v : AddValuation O (WithTop ℝ)) (ω : ModuleCat O) (n g : ℕ) :
    farguesDegree O v ω = n*g := sorry
example (O : Type u) [CommRing O] (v : AddValuation O (WithTop ℝ))
    (ω : ModuleCat O) (n g : ℕ) : farguesDegree O v ω = n*g := sorry

theorem semiAbelianTorsion_not_constant_height (H : Type u) [Fintype H]
    (p : ℕ) [Fact p.Prime] : Fintype.card H = p ∧ Fintype.card H ≠ p^2 := sorry
example (H : Type u) [Fintype H] (p : ℕ) [Fact p.Prime] :
    Fintype.card H = p ∧ Fintype.card H ≠ p^2 := sorry

-- On the special-fibre scheme S/F_p, C4 provides V* and the determinant line L.
def semiAbelianHasse (S : Scheme) (G : Grp (Over S)) (L : S.Modules) :
    SheafOfModules.unit S.ringCatSheaf ⟶ L := sorry

-- Omitted: H is the associated R07.2 BT1 section, with its determinant-line identification.
theorem semiAbelianHasse_eq_bt1Hasse (S : Scheme) (G : Grp (Over S)) (L : S.Modules)
    (H : SheafOfModules.unit S.ringCatSheaf ⟶ L) : semiAbelianHasse S G L = H := sorry

-- Omitted: G' and L' are the base changes, with associated pullback map H'.
theorem semiAbelianHasse_baseChange {S S' : Scheme} (f : S' ⟶ S)
    (G : Grp (Over S)) (L : S.Modules)
    (H' : (Scheme.Modules.pullback f).obj (SheafOfModules.unit S.ringCatSheaf) ⟶
      (Scheme.Modules.pullback f).obj L) :
    (Scheme.Modules.pullback f).map (semiAbelianHasse S G L) = H' := sorry

-- These next statements use affine trivializations of the determinant lines.
theorem semiAbelianHasse_torus (R : Type u) [CommRing R] (HaT : R) : IsUnit HaT := sorry

theorem semiAbelianHasse_raynaud (R : Type u) [CommRing R] (HaG HaB : R) :
    ∃ u : Rˣ, HaG = (u : R)*HaB := sorry

-- The ordinary locus is the supplied open subscheme; η is its actual inclusion.
def semiAbelianHasse_isUnit_iff (S U : Scheme) (η : U ⟶ S) (G : Grp (Over S))
    (L : S.Modules) :
    (Scheme.Modules.pullback η).obj (SheafOfModules.unit S.ringCatSheaf) ≅
      (Scheme.Modules.pullback η).obj L := sorry

theorem semiAbelianHasse_tateCurve (R : Type u) [CommRing R] (Ha : R) : Ha = 1 := sorry
example (R : Type u) [CommRing R] (Ha : R) : Ha = 1 := sorry

theorem semiAbelianHasse_torus_test (R : Type u) [CommRing R] (HaT : R) : IsUnit HaT := sorry
example (R : Type u) [CommRing R] (HaT : R) : IsUnit HaT := sorry

theorem semiAbelianHasse_supersingular (k : Type u) [Field k] (Ha : k) : Ha = 0 := sorry
example (k : Type u) [Field k] (Ha : k) : Ha = 0 := sorry

theorem semiAbelianHasse_bt1 (S : Scheme) (G : Grp (Over S)) (L : S.Modules)
    (H : SheafOfModules.unit S.ringCatSheaf ⟶ L) : semiAbelianHasse S G L = H := sorry
example (S : Scheme) (G : Grp (Over S)) (L : S.Modules)
    (H : SheafOfModules.unit S.ringCatSheaf ⟶ L) : semiAbelianHasse S G L = H := sorry

-- C5 supplies the minimal normal scheme, the descended line and the toroidal comparison.
def hasseInvariant_minimalCompactification (Smin : Scheme) (Lmin : Smin.Modules) :
    SheafOfModules.unit Smin.ringCatSheaf ⟶ Lmin := sorry

def hasseInvariant_ordinaryLocus (S U : Scheme) (η : U ⟶ S) (G : Grp (Over S))
    (L : S.Modules) :
    (Scheme.Modules.pullback η).obj (SheafOfModules.unit S.ringCatSheaf) ≅
      (Scheme.Modules.pullback η).obj L := sorry

-- P9/C4 supply the ringed pro-etale site and full dual one-motive modules/maps.
-- The character map on the open abelian part extends to this actual sheaf morphism.
def hodgeTate_boundaryExtension {C : Type u} [Category C] (J : GrothendieckTopology C)
    (O : Sheaf J RingCat) (T ω : SheafOfModules O) : T ⟶ ω := sorry

-- The Raynaud filtration has its toric and abelian steps on the full Tate module;
-- its associated graded character maps are αB and the multiplicative dual map.
theorem raynaudHodgeTate_filtration (R : Type u) [CommRing R]
    (T V Y ωB ωT : ModuleCat R) (i : T ⟶ V) (q : V ⟶ Y)
    (αB : Y ⟶ ωB) (αT : T ⟶ ωT) : Function.Exact i q ∧ Function.Bijective αT := sorry

/-! HN geometry uses the actual lattice of subgroups of the finite group, supplied
by R07.1. D, h are its degree and height functions; no replacement finite group
is defined. The semistability and concavity conditions are concrete inequalities. -/
section HN
variable {O : Type u} [CommRing O] (G : FiniteGroup O)
variable [OrderBot (Subobject G)] [OrderTop (Subobject G)]
variable (D : Subobject G → ℝ) (h : Subobject G → ℕ)

def harderNarasimhanFiltration (D : Subobject G → ℝ) (h : Subobject G → ℕ) :
    List (Subobject G) := sorry

def harderNarasimhanPolygon (D : Subobject G → ℝ) (h : Subobject G → ℕ) : ℝ → ℝ := sorry

theorem farguesSlope_le_of_semistable :
    (∀ K : Subobject G, 0 < h K → D K / h K ≤ D ⊤ / h ⊤) ↔
    (∀ K : Subobject G, h K < h ⊤ → D ⊤ / h ⊤ ≤ (D ⊤ - D K)/(h ⊤-h K)) := sorry

theorem degree_le_harderNarasimhanPolygon (K : Subobject G) :
    D K ≤ harderNarasimhanPolygon G D h (h K) := sorry

-- GD is the actual Cartier dual; dualStep sends quotients to their annihilators.
theorem harderNarasimhanFiltration_dual (GD : FiniteGroup O)
    (DD : Subobject GD → ℝ) (hD : Subobject GD → ℕ)
    (dualStep : Subobject G → Subobject GD) :
    harderNarasimhanFiltration GD DD hD =
      (harderNarasimhanFiltration G D h).reverse.map dualStep := sorry

-- transport is the subobject order isomorphism of the actual group-scheme automorphism.
theorem harderNarasimhanFiltration_aut (transport : Subobject G ≃o Subobject G) :
    (harderNarasimhanFiltration G D h).map transport = harderNarasimhanFiltration G D h := sorry

-- These are subobjects of finite group schemes, not subgroups of their geometric points.
-- Omitted: the specified ordinary, semistable and nonordinary elliptic realizations.
theorem harderNarasimhanFiltration_ordinary (M : Subobject G) :
    harderNarasimhanFiltration G D h = [⊥, M, ⊤] ∧ D M / h M = 1 := sorry
example (M : Subobject G) :
    harderNarasimhanFiltration G D h = [⊥, M, ⊤] ∧ D M / h M = 1 := sorry

theorem harderNarasimhanFiltration_semistable
    (hss : ∀ K : Subobject G, 0 < h K → D K/h K ≤ D ⊤/h ⊤) :
    harderNarasimhanFiltration G D h = [⊥, ⊤] := sorry
example (hss : ∀ K : Subobject G, 0 < h K → D K/h K ≤ D ⊤/h ⊤) :
    harderNarasimhanFiltration G D h = [⊥, ⊤] := sorry

theorem harderNarasimhanFiltration_not_connectedEtale (M : Subobject G) :
    M ∈ harderNarasimhanFiltration G D h ∧ 0 < D M ∧ D M < 1 := sorry
example (M : Subobject G) :
    M ∈ harderNarasimhanFiltration G D h ∧ 0 < D M ∧ D M < 1 := sorry
end HN

-- R07.6 supplies the syntomic determinant/trace identification; δ is Fitt ω.
-- This is the codifferent fractional ideal, not ω itself or δ's inverse generator as a module.
theorem degree_different (O K : Type u) [CommRing O] [IsDomain O] [Field K]
    [Algebra O K] [IsFractionRing O K] (δ codiff : FractionalIdeal (nonZeroDivisors O) K) :
    δ * codiff = 1 := sorry

/-! T1/T2: period objects are module sheaves on the actual ringed site supplied
by P8/P9. BdR+, OBdR+, and Ô are three different coefficient sheaves. The
horizontal lattice and the étale lattice are separately supplied by comparison.
-/
section Comparison
variable {C : Type u} [Category C] (J : GrothendieckTopology C)
variable (BdR OBdR Ocomplete : Sheaf J RingCat)
variable (M MdR : SheafOfModules OBdR)
-- Omitted: M=V_p(A)^∨⊗OBdR, MdR=H¹_dR(A)⊗OBdR, with connection and filtration.
def abelianRelativeComparison : M ≅ MdR := sorry

-- The grade-zero BdR lattice and Hodge grade are actual Ô-module sheaves.
def hodgeTateGradedComparison (etaleGraded hodgeGraded : SheafOfModules Ocomplete) :
    etaleGraded ≅ hodgeGraded := sorry

-- Omitted: tEt,tDR are corresponding rational absolute Hodge tensors in the tensor sheaves.
theorem hodgeTensorComparison (tensorEt tensorDR : SheafOfModules OBdR)
    (c : tensorEt ≅ tensorDR) (source : SheafOfModules OBdR)
    (tEt : source ⟶ tensorEt) (tDR : source ⟶ tensorDR) : tEt ≫ c.hom = tDR := sorry

-- The omitted comparison hypotheses are precisely the K/algebraizability/P8 conditions.
-- Sheaf exactness is specified by the canonical isomorphism onto the kernel;
-- no unknown predicate is used for a putative Hodge--Tate sequence.
def relativeHodgeTateSequence (LieTw Tate ω : SheafOfModules Ocomplete)
    (α : Tate ⟶ ω) (kernelSheaf : SheafOfModules Ocomplete) : LieTw ≅ kernelSheaf := sorry
end Comparison

section RationalSequence
variable (C L T W : Type u) [Field C] [AddCommGroup L] [Module C L]
variable [AddCommGroup T] [Module C T] [AddCommGroup W] [Module C W]
-- Omitted: these are the supplied Lie(1), rational Tate, conormal modules and canonical maps.
theorem pDivisibleHodgeTateSequence (i : L →ₗ[C] T) (α : T →ₗ[C] W) :
    Function.Injective i ∧ Function.Exact i α ∧ Function.Surjective α := sorry

theorem abelianHodgeTateSequence (i : L →ₗ[C] T) (α : T →ₗ[C] W) :
    Function.Injective i ∧ Function.Exact i α ∧ Function.Surjective α := sorry
end RationalSequence

-- Integral Faltings complex and the normalized scalar-annihilator estimate.
-- Omitted: O=O_C, v(p)=1, and i,α are the two supplied character-complex maps.
theorem farguesHodgeTateCokernel (O L T W : Type u) [CommRing O]
    [AddCommGroup L] [Module O L] [AddCommGroup T] [Module O T]
    [AddCommGroup W] [Module O W] (p : ℕ) [Fact p.Prime]
    (v : AddValuation O (WithTop ℝ)) (i : L →ₗ[O] T) (α : T →ₗ[O] W)
    (a : O) (ha : (1/(p-1) : ℝ) ≤ (v a).untopD 0) :
    α.comp i = 0 ∧ Ideal.span {a} • (⊤ : Submodule O W) ≤ LinearMap.range α := sorry

/-! T2: rank-g quotient flags. The quotient and kernel bundles keep distinct names. -/
section Flags
variable (C : Type u) [Field C] (g : ℕ)

def hodgeTateFlagPoint (W : Type u) [AddCommGroup W] [Module C W]
    [FiniteDimensional C W] (q : (Fin (2*g) → C) →ₗ[C] W)
    (hq : Function.Surjective q) (hrank : Module.finrank C W = g) :
    Module.Grassmannian C (Fin (2*g) → C) g := sorry

theorem hodgeTateFlagPoint_isLagrangian (W : Type u) [AddCommGroup W] [Module C W]
    [FiniteDimensional C W] (q : (Fin (2*g) → C) →ₗ[C] W)
    (ψ : (Fin (2*g) → C) →ₗ[C] (Fin (2*g) → C) →ₗ[C] C) :
    ∀ x ∈ LinearMap.ker q, ∀ y ∈ LinearMap.ker q, ψ x y = 0 := sorry

def plucker (Q : Module.Grassmannian C (Fin (2*g) → C) g)
    (J : Finset (Fin (2*g))) (hJ : J.card = g) : C := sorry

-- Omitted: score is the absolute value of the Plücker coordinate in a common trivialization.
def lagrangianChart (score : Module.Grassmannian C (Fin (2*g) → C) g →
    Finset (Fin (2*g)) → ℝ) (J : Finset (Fin (2*g))) :
    Set (Module.Grassmannian C (Fin (2*g) → C) g) :=
  {Q | ∀ J', J'.card = g → score Q J' ≤ score Q J}

theorem lagrangianChart_cover (score : Module.Grassmannian C (Fin (2*g) → C) g →
    Finset (Fin (2*g)) → ℝ) (Q : Module.Grassmannian C (Fin (2*g) → C) g) :
    ∃ J, J.card = g ∧ Q ∈ lagrangianChart C g score J := sorry

-- Omitted: act is the specified symplectic action and Q' is the transported HT quotient.
theorem hodgeTateFlagPoint_equivariant (Γ : Type u) [Group Γ]
    (act : Γ → Module.Grassmannian C (Fin (2*g) → C) g →
      Module.Grassmannian C (Fin (2*g) → C) g)
    (γ : Γ) (Q Q' : Module.Grassmannian C (Fin (2*g) → C) g) : Q' = act γ Q := sorry

-- Omitted: the ordinary elliptic HT kernel is given in the adapted Tate frame.
theorem hodgeTateFlagPoint_ordinaryElliptic (p : ℕ) [Fact p.Prime]
    [Algebra (Padic p) C] (z : C) : ∃ a : Padic p, z = algebraMap (Padic p) C a := sorry
example (p : ℕ) [Fact p.Prime] [Algebra (Padic p) C] (z : C) :
    ∃ a : Padic p, z = algebraMap (Padic p) C a := sorry

theorem hodgeTateFlagPoint_grassmannian (W : Type u) [AddCommGroup W] [Module C W]
    [FiniteDimensional C W] (q : (Fin (2*g) → C) →ₗ[C] W)
    (hq : Function.Surjective q) (hrank : Module.finrank C W = g) :
    (hodgeTateFlagPoint C g W q hq hrank).toSubmodule = LinearMap.ker q := sorry
example (W : Type u) [AddCommGroup W] [Module C W] [FiniteDimensional C W]
    (q : (Fin (2*g) → C) →ₗ[C] W) (hq : Function.Surjective q)
    (hrank : Module.finrank C W = g) :
    (hodgeTateFlagPoint C g W q hq hrank).toSubmodule = LinearMap.ker q := sorry

theorem lagrangianChart_count :
    Fintype.card {J : Finset (Fin (2*g)) // J.card = g} = Nat.choose (2*g) g := sorry
example : Fintype.card {J : Finset (Fin 4) // J.card = 2} = 6 := sorry

-- Omitted: LieTw is Lie(A^∨)(1), W is ω_A, q is the HT quotient,
-- and ψ is the perfect alternating pairing from the polarization.
theorem hodgeTateFlagPoint_not_line (LieTw : Submodule C (Fin 2 → C))
    (W : Type u) [AddCommGroup W] [Module C W]
    (q : (Fin 2 → C) →ₗ[C] W)
    (ψ : (Fin 2 → C) →ₗ[C] (Fin 2 → C) →ₗ[C] C) :
    LieTw = LinearMap.ker q ∧
      (∀ x, (∀ y ∈ LieTw, ψ x y = 0) ↔ x ∈ LieTw) ∧
      Nonempty (((Fin 2 → C) ⧸ LieTw) ≃ₗ[C] W) := sorry
example (LieTw : Submodule C (Fin 2 → C))
    (W : Type u) [AddCommGroup W] [Module C W]
    (q : (Fin 2 → C) →ₗ[C] W)
    (ψ : (Fin 2 → C) →ₗ[C] (Fin 2 → C) →ₗ[C] C) :
    LieTw = LinearMap.ker q ∧
      (∀ x, (∀ y ∈ LieTw, ψ x y = 0) ↔ x ∈ LieTw) ∧
      Nonempty (((Fin 2 → C) ⧸ LieTw) ≃ₗ[C] W) := sorry

-- The unit-disc image under z/(z+1) contains both 0 and ∞; homogeneous coordinates avoid division.
theorem lagrangianChart_not_permuted (v : AddValuation C (WithTop ℝ)) :
    (fun u : Fin 2 → C => (!![1,0;1,1] : Matrix (Fin 2) (Fin 2) C).mulVec u) ''
      {u | u ≠ 0 ∧ v (u 1) ≤ v (u 0)} ≠ {u | u ≠ 0 ∧ v (u 1) ≤ v (u 0)} ∧
    (fun u : Fin 2 → C => (!![1,0;1,1] : Matrix (Fin 2) (Fin 2) C).mulVec u) ''
      {u | u ≠ 0 ∧ v (u 1) ≤ v (u 0)} ≠ {u | u ≠ 0 ∧ v (u 0) ≤ v (u 1)} := sorry
example (v : AddValuation C (WithTop ℝ)) :
    (fun u : Fin 2 → C => (!![1,0;1,1] : Matrix (Fin 2) (Fin 2) C).mulVec u) ''
      {u | u ≠ 0 ∧ v (u 1) ≤ v (u 0)} ≠ {u | u ≠ 0 ∧ v (u 0) ≤ v (u 1)} := sorry
end Flags

/-! Rational PEL/Hodge tensors. The source algebra acts on the real HT module.
Integral group schemes/tensor frames are not inferred from these rational data. -/
theorem pelHodgeType_filtration (C T : Type u) [Field C] [AddCommGroup T] [Module C T]
    (K : Submodule C T) (a : T →ₗ[C] T) : Submodule.map a K ≤ K := sorry

section Torsors
variable {C : Type u} [Category C] (J : GrothendieckTopology C)
-- The supplier also provides the group actions and local torsor trivializations.
def etaleFrameTorsor (V : Sheaf J (Type u)) : Sheaf J (Type u) := sorry

def hodgeTateParabolicReduction (etaleFrames flags : Sheaf J (Type u)) :
    Sheaf J (Type u) := sorry

def hodgeTateLeviTorsor (parabolicFrames : Sheaf J (Type u)) : Sheaf J (Type u) := sorry

-- Omitted: etaleFrames' is Hecke/base-change pullback, not an unrelated sheaf.
def hodgeTateParabolicReduction_hecke (P P' : Sheaf J (Type u)) : P ≅ P' := sorry

def hodgeTateParabolicReduction_baseChange (P P' : Sheaf J (Type u)) : P ≅ P' := sorry

-- The two quotient-bundle modules are ω^{-1}(1) and ω, supplied with their tensor interpretation.
def hodgeTateLeviTorsor_modularCurve (O : Sheaf J RingCat) (Lminus Lplus : SheafOfModules O)
    (Levi pairedLineFrames : Sheaf J (Type u)) : Levi ≅ pairedLineFrames := sorry
example (Levi pairedLineFrames : Sheaf J (Type u)) : Levi ≅ pairedLineFrames := sorry

-- Omitted: central μ, for which P=M=G.
def hodgeTateParabolicReduction_torus (P : Sheaf J (Type u)) :
    hodgeTateParabolicReduction J P P ≅ P := sorry
example (P : Sheaf J (Type u)) : hodgeTateParabolicReduction J P P ≅ P := sorry

-- Noncentral GL₂ cocharacters distinguish the Hodge and HT parabolics by their invariant lines.
theorem hodgeTateParabolicReduction_not_hodge (R : Type u) [Field R] :
    Submodule.span R {![(1 : R),0]} ≠
      Submodule.span R {![(0 : R),1]} := sorry
example (R : Type u) [Field R] :
    Submodule.span R {![(1 : R),0]} ≠
      Submodule.span R {![(0 : R),1]} := sorry

-- B1 supplies the central-μ contracted product and the tensor-compatible comparison.
-- Omitted: PdRTate is the central-μ contracted product of PdR with the
-- Tate-basis torsor. The comparison is not an untwisted isomorphism PdR ≅ PHT.
def deRhamHodgeTateLeviComparison (PdR PdRTate PHT : Sheaf J (Type u)) :
    PdRTate ≅ PHT := sorry
end Torsors

/-! T2 owns the open-tower map before perfectoid representability. S0 supplies
Tower, D6 supplies Flag as v-sheaves on the marked-untilt perfectoid site.
P9 supplies relative tensor-filtration pullback and descent on all test objects;
R09.1/B0 supply the universal flag and homogeneous Levi torsor. These
conditions are omitted from the schematic declarations, not assumed proved.
S3 imports this map for its perfectoid incarnation and compactified extension.
-/
section OpenTower
variable {Site : Type u} [Category Site] (J : GrothendieckTopology Site)

def openTowerHodgeTateMap (Tower Flag : Sheaf J (Type u)) : Tower ⟶ Flag := sorry

theorem openTowerHodgeTateMap_ext {Tower Flag : Sheaf J (Type u)}
    (f g : Tower ⟶ Flag) (h : ∀ U : Siteᵒᵖ, f.hom.app U = g.hom.app U) :
    f = g := sorry

-- Omitted: q is the relative type-μ filtration quotient on the test untilt U.
theorem openTowerHodgeTateMap_eval {Tower Flag : Sheaf J (Type u)}
    (π : Tower ⟶ Flag) (U : Siteᵒᵖ)
    (q : Tower.obj.obj U ⟶ Flag.obj.obj U) : π.hom.app U = q := sorry

-- U is a marked geometric untilt; flagPoint is the pointwise quotient construction.
theorem openTowerHodgeTateMap_point {Tower Flag : Sheaf J (Type u)}
    (π : Tower ⟶ Flag) (U : Siteᵒᵖ)
    (flagPoint : Tower.obj.obj U ⟶ Flag.obj.obj U) :
    π.hom.app U = flagPoint := sorry

-- aTower and aFlag are the matching G(Q_p) actions with the fixed right/left dictionary.
theorem openTowerHodgeTateMap_equivariant {Tower Flag : Sheaf J (Type u)}
    (π : Tower ⟶ Flag) (aTower : Tower ⟶ Tower) (aFlag : Flag ⟶ Flag) :
    aTower ≫ π = π ≫ aFlag := sorry

-- t is a prime-to-p Hecke translation between tame levels, not an arbitrary map.
theorem openTowerHodgeTateMap_hecke {Tower Tower' Flag : Sheaf J (Type u)}
    (π : Tower ⟶ Flag) (π' : Tower' ⟶ Flag) (t : Tower ⟶ Tower') : t ≫ π' = π := sorry

-- b is the supplier's common-base transfer, and π' the map for the base-extended family.
theorem openTowerHodgeTateMap_baseChange {Tower Flag : Sheaf J (Type u)}
    (π : Tower ⟶ Flag) (b : Sheaf J (Type u) ⥤ Sheaf J (Type u))
    (π' : b.obj Tower ⟶ b.obj Flag) : b.map π = π' := sorry

-- The two embeddings come from one Hodge-type embedding; embedding independence is a
-- tensor-idempotent argument, not a claim that every two flag maps agree.
theorem openTowerHodgeTateMap_embedding {Tower Tower' Flag Flag' : Sheaf J (Type u)}
    (π : Tower ⟶ Flag) (π' : Tower' ⟶ Flag')
    (iTower : Tower ⟶ Tower') (iFlag : Flag ⟶ Flag') :
    iTower ≫ π' = π ≫ iFlag := sorry

-- PullbackLevi is the actual pullback of the homogeneous Levi torsor along π.
-- Its associated bundles retain the μ-weight Tate twists of PdRTate.
def openTowerLeviPullback (PullbackLevi PHT : Sheaf J (Type u)) :
    PullbackLevi ≅ PHT := sorry

-- Modular test: the quotient O(1) module, not the tautological subline, is ω_E.
def openTowerHodgeTateMap_modular (O : Sheaf J RingCat)
    (quotientO1 omega : SheafOfModules O) : quotientO1 ≅ omega := sorry
example (O : Sheaf J RingCat) (quotientO1 omega : SheafOfModules O) :
    quotientO1 ≅ omega := sorry

-- Central μ gives a terminal flag; no perfectoid representative of Tower is required.
theorem openTowerHodgeTateMap_torus {Tower Flag : Sheaf J (Type u)}
    (π : Tower ⟶ Flag) (hFlag : Limits.IsTerminal Flag) : π = hFlag.from Tower := sorry
example {Tower Flag : Sheaf J (Type u)} (π : Tower ⟶ Flag)
    (hFlag : Limits.IsTerminal Flag) : π = hFlag.from Tower := sorry

-- Omitted: G* is the Hodge-type Hilbert datum and ResFlag the unsplit generic Res P¹.
def openTowerHodgeTateMap_hilbertUnsplit (Flag ResFlag : Sheaf J (Type u)) :
    Flag ≅ ResFlag := sorry
example (Flag ResFlag : Sheaf J (Type u)) : Flag ≅ ResFlag := sorry

-- The algebraic chart check fixes which object is the kernel; the quotient line
-- carries the complementary object and the reader specifies its bundle/twist.
theorem openTowerHodgeTateMap_kernelQuotient (R : Type u) [Field R] :
    LinearMap.ker (LinearMap.proj 0 : (Fin 2 → R) →ₗ[R] R) =
      Submodule.span R {![(0 : R), 1]} := sorry
example (R : Type u) [Field R] :
    LinearMap.ker (LinearMap.proj 0 : (Fin 2 → R) →ₗ[R] R) =
      Submodule.span R {![(0 : R), 1]} := sorry
end OpenTower

/-! The generic strict filtered category is imported conceptually from the proposed
ReductiveGroups Part II extension. This is its HT application on an actual
representation category Rep and coefficient ring R. Missing tensor coherence,
strict exactness and finite projective graded quotients are explicitly omitted;
no Prop field standing for those conditions is introduced. -/
structure ExactTensorFiltration (Rep : Type u) [Category Rep] (R : Type u) [CommRing R] where
  fiber : Rep ⥤ ModuleCat.{u} R
  filtration : ∀ V, ℤ → Submodule R (fiber.obj V)
  monotone : ∀ V, Monotone (filtration V)
  natural : ∀ {V W}, (f : V ⟶ W) → ∀ i,
    Submodule.map (fiber.map f).hom (filtration V i) ≤ filtration W i

namespace ExactTensorFiltration
variable {Rep : Type u} [Category Rep] {R : Type u} [CommRing R]
-- A cocharacter of the reductive group is supplied by B0/R09.1; its conjugacy orbit is a set.
def «type» (F : ExactTensorFiltration Rep R) (Cocharacters : Type u) : Set Cocharacters := sorry

-- Ziegler's theorem gives an actual faithfully flat algebra S and its splitting maps;
-- the fpqc covering/faithful-flatness certificate belongs to the shared supplier.
def splitLocally (F : ExactTensorFiltration Rep R) (S : Type u) [CommRing S] [Algebra R S]
    (graded : Rep ⥤ ModuleCat S) (extendedFiber : Rep ⥤ ModuleCat S) :
    extendedFiber ≅ graded := sorry

def frameTorsor {C : Type u} [Category C] (J : GrothendieckTopology C)
    (F : ExactTensorFiltration Rep R) : Sheaf J (Type u) := sorry

def equivFlag (F : ExactTensorFiltration Rep R) (FlagPoints : Type u)
    (FiltrationsOfType : Type u) : FiltrationsOfType ≃ FlagPoints := sorry

-- The GL_n two-step strict filtration is its rank-(n-r) quotient, not a flag of arbitrary ideals.
def gl_grassmannian (n r : ℕ) (hr : r ≤ n) (FiltrationsOfType : Type u) :
    FiltrationsOfType ≃ Module.Grassmannian R (Fin n → R) (n-r) := sorry
example (n r : ℕ) (hr : r ≤ n) (FiltrationsOfType : Type u) :
    FiltrationsOfType ≃ Module.Grassmannian R (Fin n → R) (n-r) := sorry

-- Omitted: μ is central; FiltrationsOfType is the actual set for its fixed fiber functor.
-- This does not assert that the underlying unframed G-torsor is trivial.
theorem trivial (FiltrationsOfType : Type u) : Subsingleton FiltrationsOfType := sorry
example (FiltrationsOfType : Type u) : Subsingleton FiltrationsOfType := sorry

-- The explicit nonflat quotient Z/2 prevents strict locally split rank-one filtration.
theorem not_arbitrary_filtration : ¬ Module.Flat ℤ (ZMod 2) := sorry
example : ¬ Module.Flat ℤ (ZMod 2) := sorry
end ExactTensorFiltration

/-! T3: Hasse radii and the weak/strong distinction. The point signatures use
normalized valuations; formal-family signatures use actual schemes and subgroup
objects. R07.1/R07.6 supply co-Lie complexes, annihilating homotopies and finite
flat subgroup descent; DD0 owns the general square-zero deformation theorem. -/
-- The formal pair construction has an actual scheme carrier; R2 supplies its
-- completion/admissible generic fiber and the relation on choices of the inverse section.
def hasseNeighbourhood (X : Scheme) (L : X.Modules)
    (Ha : SheafOfModules.unit X.ringCatSheaf ⟶ L)
    (scalar : SheafOfModules.unit X.ringCatSheaf ⟶ SheafOfModules.unit X.ringCatSheaf) :
    Scheme := sorry

section HasseRadius
variable (O : Type u) [CommRing O] (v : AddValuation O (WithTop ℝ))

def hasseValuation (Ha : O) : ℝ := min ((v Ha).untopD 1) 1

-- Omitted: HaD is the Hasse determinant of the Cartier-dual BT1.
theorem hasseValuation_dual (Ha HaD : O) :
    hasseValuation O v HaD = hasseValuation O v Ha := sorry

-- The actual ordinary-point set is supplied by invertibility of the special-fibre determinant.
theorem hasseValuation_eq_zero_iff (Ha : O) :
    hasseValuation O v Ha = 0 ↔ v Ha = 0 := sorry

-- X is the supplied formal model's generic-fibre point type, and Ha its pointwise height.
-- The actual formal scheme of pairs (f,u), its equivalence relation and adic generic
-- fibre come from R2; this set signature records the required rational-domain carrier.
def hasseGenericLocus (X : Type u) (Ha : X → ℝ) (ε : ℝ) : Set X := {x | Ha x ≤ ε}

theorem hasseNeighbourhood_generic (X : Type u) (Ha : X → ℝ) (ε : ℝ) :
    hasseGenericLocus X Ha ε = {x | Ha x ≤ ε} := sorry

theorem hasseNeighbourhood_mono (X : Type u) (Ha : X → ℝ) (ε ε' : ℝ)
    (h : ε ≤ ε') : hasseGenericLocus X Ha ε ⊆ hasseGenericLocus X Ha ε' := sorry

theorem hasseValuation_ordinary (Ha : O) (hHa : v Ha = 0) :
    hasseValuation O v Ha = 0 := sorry
example (Ha : O) (hHa : v Ha = 0) : hasseValuation O v Ha = 0 := sorry

-- O is a valuation ring, so every nonzero integral scalar has nonnegative value.
theorem hasseValuation_le_one (Ha : O) (hpos : 0 ≤ (v Ha).untopD 1) :
    0 ≤ hasseValuation O v Ha ∧ hasseValuation O v Ha ≤ 1 := sorry
example (Ha : O) (hpos : 0 ≤ (v Ha).untopD 1) :
    0 ≤ hasseValuation O v Ha ∧ hasseValuation O v Ha ≤ 1 := sorry

theorem hasseNeighbourhood_zero (X : Type u) (Ha : X → ℝ) (hHa : ∀ x, 0 ≤ Ha x) :
    hasseGenericLocus X Ha 0 = {x | Ha x = 0} := sorry
example (X : Type u) (Ha : X → ℝ) (hHa : ∀ x, 0 ≤ Ha x) :
    hasseGenericLocus X Ha 0 = {x | Ha x = 0} := sorry

-- In the two-chart admissible blowup, an integral point with Ha=0 lies only in the omitted chart.
-- ε is below 1 and the chosen scalar p^ε is nonzero; the generic-point test suffices to
-- distinguish the rational Hasse neighborhood from the full generic-fibre blowup.
theorem hasseNeighbourhood_not_blowup (X : Type u) (Ha : X → ℝ) (ε : ℝ)
    (x : X) (hx : ε < Ha x) : hasseGenericLocus X Ha ε ≠ Set.univ := sorry
example (X : Type u) (Ha : X → ℝ) (ε : ℝ) (x : X) (hx : ε < Ha x) :
    hasseGenericLocus X Ha ε ≠ Set.univ := sorry
end HasseRadius

-- The lifting output is a subgroup of the actual finite group scheme over S.
-- Omitted: the mod-p subgroup, the co-Lie null homotopy, ε<1/2 and base completeness.
def subgroupLifting (S : Scheme) (G : Grp (Over S)) : Subobject G := sorry

-- This affine sections theorem uses Kähler differentials, not smoothness.
-- Omitted: R is O-flat and p-adically complete; ε,δ are scalars with v(δ)>v(ε).
theorem sectionRigidity (R A : Type u) [CommRing R] [CommRing A] [Algebra R A]
    (ε δ : R) (hΩ : ∀ x : KaehlerDifferential R A, ε • x = 0)
    (s t : A →ₐ[R] R)
    (hcongr : ∀ a, s a - t a ∈ Ideal.span {δ}) : s = t := sorry

def weakExponent (p n : ℕ) : ℕ := ∑ i ∈ Finset.range n, p^i

-- The base S is the supplied formal family's underlying scheme; torsion=A[p^n].
-- Omitted: Ha^(weakExponent p n)|p^η with η<1/2; strong uses Ha^(p^n)|p^η.
def canonicalSubgroup (S : Scheme) (torsion : Grp (Over S)) (p n : ℕ) :
    Subobject torsion := sorry

-- red is the actual subgroup base-change operation modulo p^(1-η), and F the Frobenius kernel.
-- The uniqueness quantifier is restricted to finite locally free subgroups by the supplier.
theorem canonicalSubgroup_modFrobenius (S Sbar : Scheme) (G : Grp (Over S))
    (Gbar : Grp (Over Sbar)) (p n : ℕ)
    (red : Subobject G → Subobject Gbar) (F : Subobject Gbar) :
    red (canonicalSubgroup S G p n) = F ∧
      ∀ K : Subobject G, red K = F → K = canonicalSubgroup S G p n := sorry

-- The point set Cpoints is the canonical subgroup's R'-points; nearZero records congruence.
theorem canonicalSubgroup_points (P : Type u) (Cpoints nearZero : Set P) :
    nearZero ⊆ Cpoints := sorry

-- Omitted: R' is integrally closed in R'[1/p], giving equality in the preceding test.
theorem canonicalSubgroup_points_normal (P : Type u) (Cpoints nearZero : Set P) :
    Cpoints = nearZero := sorry

theorem canonicalSubgroup_degree (O : Type u) [CommRing O]
    (v : AddValuation O (WithTop ℝ)) (ωC : ModuleCat O) (p n g : ℕ)
    (w : ℝ) (hw : w < 1/(2*(p : ℝ)^(n-1))) :
    farguesDegree O v ωC = n*g - ((p^n : ℝ)-1)/(p-1)*w := sorry

-- The Weil pairing is evaluated on actual geometric torsion points; C is the supplied subgroup.
theorem canonicalSubgroup_isotropic (P μ : Type u) [AddCommGroup P] [CommGroup μ]
    (C : AddSubgroup P) (e : P → P → μ) : ∀ x ∈ C, ∀ y ∈ C, e x y = 1 := sorry

-- Omitted: bc is the finite-flat subgroup base change; the flat complete base satisfies the radius.
theorem canonicalSubgroup_baseChange (S S' : Scheme) (G : Grp (Over S))
    (G' : Grp (Over S')) (p n : ℕ) (bc : Subobject G → Subobject G') :
    bc (canonicalSubgroup S G p n) = canonicalSubgroup S' G' p n := sorry

-- strong subgroups are used; torsionRestriction is the genuine p^k-kernel operation.
theorem canonicalSubgroup_level (S : Scheme) (G : Grp (Over S)) (p n k : ℕ)
    (hk : k ≤ n) (torsionRestriction : Subobject G → Subobject G) :
    canonicalSubgroup S G p k = torsionRestriction (canonicalSubgroup S G p n) := sorry

-- Omitted: Ha is a unit and M is the multiplicative connected subgroup.
theorem canonicalSubgroup_ordinary (S : Scheme) (G : Grp (Over S)) (p n : ℕ)
    (M : Subobject G) : canonicalSubgroup S G p n = M := sorry
example (S : Scheme) (G : Grp (Over S)) (p n : ℕ) (M : Subobject G) :
    canonicalSubgroup S G p n = M := sorry

theorem canonicalSubgroup_ellipticDegree (w : ℝ) (hw : 0 ≤ w ∧ w < 1/2)
    (degreeC degreeQuotient : ℝ) : degreeC = 1-w ∧ degreeQuotient = w := sorry
example (w : ℝ) (hw : 0 ≤ w ∧ w < 1/2) (degreeC degreeQuotient : ℝ) :
    degreeC = 1-w ∧ degreeQuotient = w := sorry

-- Over F_p, μ_p has one geometric point whereas the constant group has p.
theorem canonicalSubgroup_not_constant (p : ℕ) [Fact p.Prime] :
    Fintype.card (ZMod p) ≠ Fintype.card (Fin 1) := sorry
example (p : ℕ) [Fact p.Prime] : Fintype.card (ZMod p) ≠ Fintype.card (Fin 1) := sorry

-- Omitted: P consists of points over the nonnormal fiber-product ring in the reader.
-- s=(ζ_p,1); Cpoints and nearZero are the actual μ_p and congruence sets.
theorem canonicalSubgroup_points_strict (P : Type u) (Cpoints nearZero : Set P) (s : P) :
    s ∈ Cpoints ∧ s ∉ nearZero := sorry
example (P : Type u) (Cpoints nearZero : Set P) (s : P) : s ∈ Cpoints ∧ s ∉ nearZero := sorry

-- Added review lemma: G is the supplied BT2, C is a supplied Frobenius-congruent
-- finite flat subgroup, E is the supplied BT1 quotient p^(-1)C/C. No existence theorem
-- is used here. Omitted: the quotient/conormal reduction identification modulo p^(1-w),
-- w=Ha(G), wE=Ha(E), and the R07.2 Hasse/Frobenius tensor-power compatibility.
theorem pointwiseQuotientHasse (S : Scheme) (G E : Grp (Over S)) (C : Subobject G)
    (p : ℕ) [Fact p.Prime] (hp : p ≠ 2) (w wE : ℝ) (hw : 0 ≤ w ∧ w < 1) :
    min wE (1-w) = min ((p : ℝ)*w) (1-w) := sorry

-- Existence/uniqueness is the preceding finite-flat lifting theorem, in the weak range.
theorem canonicalSubgroup_theorem (S Sbar : Scheme) (G : Grp (Over S))
    (Gbar : Grp (Over Sbar)) (p n : ℕ) (red : Subobject G → Subobject Gbar)
    (F : Subobject Gbar) : ∃! C : Subobject G, red C = F := sorry

-- The level restriction, functoriality and polarization are packaged as concrete equalities above.
theorem canonicalSubgroup_properties (P μ : Type u) [AddCommGroup P] [CommGroup μ]
    (C : AddSubgroup P) (e : P → P → μ) (a : P →+ P) :
    C.map a ≤ C ∧ ∀ x ∈ C, ∀ y ∈ C, e x y = 1 := sorry

-- These are the pointwise heights of the canonical/anticanonical quotient; formal congruence
-- modulo p^(1-η) is a separate supplied equality on the special-fibre determinant section.
theorem quotientHasseRadius (p n : ℕ) [Fact p.Prime] (w wC wA : ℝ)
    (hw : 0 ≤ w ∧ (p^n : ℝ)*w < 1/2) :
    wC = (p^n : ℝ)*w ∧ wA = w/(p^n : ℝ) := sorry

-- Omitted: canonical at w in the strict FAR or all-prime HALO range; O=O_C, v(p)=1.
-- α is the raw finite character map into ω_H, not the modified-lattice isomorphism.
theorem canonicalSubgroup_hodgeTate (O : Type u) [CommRing O]
    (v : AddValuation O (WithTop ℝ)) (p n : ℕ) [Fact p.Prime]
    (w : ℝ) (H ω : ModuleCat O) (α : H ⟶ ω) (HdgT : O) :
    farguesDegree O v (ModuleCat.of O (ω ⧸ LinearMap.range α.hom)) = w/(p-1) ∧
      Ideal.span {HdgT} • (⊤ : Submodule O ω) ≤ LinearMap.range α.hom := sorry

-- H2/H4 provide this unsplit O_F/p^n generator theorem on the exact Hilbert model.
-- Endomorphism stability and a Z/p^n rank count alone do not prove this equivalence.
def hilbertCanonicalSubgroup (B : Type u) [CommRing B] (H : Type u)
    [AddCommGroup H] [Module B H] : B ≃ₗ[B] H := sorry

/-! T4: loci, coordinates and balls. The actual adic spaces and their locally
ringed-site structures are supplied by H4/R2. The sets below are their pointwise
subspaces; isomorphisms of adic spaces are stronger supplier-backed versions. -/
section Loci
variable (X : Type u) (P : Type u) [AddCommGroup P]

def canonicalLocus (C D : X → AddSubgroup P) : Set X := {x | D x = C x}

def anticanonicalLocus (C Dp : X → AddSubgroup P) : Set X := {x | Dp x ⊓ C x = ⊥}

-- Omitted: X is the small-radius Γ₀(p^n) moduli space with its genuine topology.
theorem anticanonicalLocus_isClopen [TopologicalSpace X]
    (C D : X → AddSubgroup P) : IsClopen (anticanonicalLocus X P C D) := sorry

-- D' is the level n+1 subgroup; D is its p^n torsion after the forgetful map.
theorem anticanonicalLocus_forget (X' : Type u) (q : X' → X)
    (C D : X → AddSubgroup P) (C' D' : X' → AddSubgroup P) :
    Set.MapsTo q (anticanonicalLocus X' P C' D') (anticanonicalLocus X P C D) := sorry

def canonicalLocus_section (Base : Type u) (C D : X → AddSubgroup P) :
    Base ≃ ↥(canonicalLocus X P C D) := sorry

-- Omitted: C is A[p^n]^0 on the ordinary locus, D has the full level-n rank,
-- Dp is D[p]. The p-torsion disjointness and rank imply a complement, with no chosen E.
theorem anticanonicalLocus_ordinary (C D Dp : X → AddSubgroup P) (x : X)
    (hx : x ∈ anticanonicalLocus X P C Dp) : IsCompl (C x) (D x) := sorry
example (C D Dp : X → AddSubgroup P) (x : X)
    (hx : x ∈ anticanonicalLocus X P C Dp) : IsCompl (C x) (D x) := sorry

-- Omitted: Cfiber/Afiber are the fibers over an ordinary elliptic point at level one.
theorem canonicalLocus_modularCurve (Cfiber Afiber : Type u) [Fintype Cfiber]
    [Fintype Afiber] (p : ℕ) [Fact p.Prime] :
    Fintype.card Cfiber = 1 ∧ Fintype.card Afiber = p := sorry
example (Cfiber Afiber : Type u) [Fintype Cfiber] [Fintype Afiber]
    (p : ℕ) [Fact p.Prime] : Fintype.card Cfiber = 1 ∧ Fintype.card Afiber = p := sorry

-- Product of two local factors: one canonical and one anticanonical is different but not disjoint.
theorem anticanonicalLocus_not_complement (k : Type u) [Field k]
    (C D : Submodule k (Fin 4 → k)) (hCD : C ≠ D) (hinter : C ⊓ D ≠ ⊥) :
    C ≠ D ∧ ¬ (C ⊓ D = ⊥) := sorry
example (k : Type u) [Field k] (C D : Submodule k (Fin 4 → k))
    (hCD : C ≠ D) (hinter : C ⊓ D ≠ ⊥) : C ≠ D ∧ ¬ (C ⊓ D = ⊥) := sorry
end Loci

-- Stronger geometric versions: canonical section and finite Atkin--Lehner isomorphism.
-- Omitted: spaces are the genuine moduli loci with the induced topology and ringed structure.
def canonicalLocus_isomorphism (Base Canonical : Type u) [TopologicalSpace Base]
    [TopologicalSpace Canonical] : Base ≃ₜ Canonical := sorry

-- n≥1, source ambient height p^n ε <1/2; target height ε. No infinite-level AL is defined.
def atkinLehner_anticanonical (Base Anti : Type u) [TopologicalSpace Base]
    [TopologicalSpace Anti] (p n : ℕ) [Fact p.Prime] (hn : 1 ≤ n)
    (ε : ℝ) (hε : 0 ≤ ε ∧ (p^n : ℝ)*ε < 1/2) : Anti ≃ₜ Base := sorry

section Coordinate
variable (C : Type u) [Field C]

def hodgeTateCoordinate (HTe₁ HTe₂ : C) : C := -HTe₂ / HTe₁

def automorphyFactor (γ : Matrix (Fin 2) (Fin 2) C) (z : C) : C := γ 1 0*z + γ 1 1

def fractionalNumerator (γ : Matrix (Fin 2) (Fin 2) C) (z : C) : C := γ 0 0*z + γ 0 1

def fractionalLinear (γ : Matrix (Fin 2) (Fin 2) C) (z : C) : C :=
  fractionalNumerator C γ z / automorphyFactor C γ z

-- Omitted: z' is the coordinate of the left-transformed kernel line.
theorem fractionalLinear_action (γ : Matrix (Fin 2) (Fin 2) C) (z z' : C)
    (hj : automorphyFactor C γ z ≠ 0) : z' = fractionalLinear C γ z := sorry

theorem automorphyFactor_cocycle (γ δ : Matrix (Fin 2) (Fin 2) C) (z : C)
    (hδ : automorphyFactor C δ z ≠ 0) :
    automorphyFactor C (γ*δ) z =
      automorphyFactor C γ (fractionalLinear C δ z)*automorphyFactor C δ z := sorry

-- L is the actual integral-closure lattice; γ∈Γ₀(p), z in the strict-radius anticanonical ball.
theorem automorphyFactor_unit (L : Subring C) (γ : Matrix (Fin 2) (Fin 2) C)
    (z : C) (hj : automorphyFactor C γ z ∈ L) :
    IsUnit (⟨automorphyFactor C γ z, hj⟩ : L) := sorry

-- Only generic splitting into embeddings is asserted; no integral product identification.
theorem hodgeTateCoordinate_descent (D : Type u) [Field D] (σ : C →+* D)
    (a b : C) : σ (hodgeTateCoordinate C a b) = hodgeTateCoordinate D (σ a) (σ b) := sorry

theorem automorphyFactor_identity (z : C) : automorphyFactor C 1 z = 1 := sorry
example (z : C) : automorphyFactor C 1 z = 1 := sorry

theorem fractionalLinear_upperTriangular (a b d z : C) (hd : d ≠ 0) :
    fractionalLinear C !![a,b;0,d] z = (a*z+b)/d := sorry
example (a b d z : C) (hd : d ≠ 0) : fractionalLinear C !![a,b;0,d] z = (a*z+b)/d := sorry

theorem automorphyFactor_cocycle_test (c c' z : C) (hj : c'*z+1 ≠ 0) :
    automorphyFactor C (!![1,0;c,1]*!![1,0;c',1]) z = (c+c')*z+1 ∧
      (c+c')*z+1 = automorphyFactor C !![1,0;c,1]
        (fractionalLinear C !![1,0;c',1] z)*automorphyFactor C !![1,0;c',1] z := sorry
example (c c' z : C) (hj : c'*z+1 ≠ 0) :
    (c+c')*z+1 = automorphyFactor C !![1,0;c,1]
      (fractionalLinear C !![1,0;c',1] z)*automorphyFactor C !![1,0;c',1] z := sorry

-- The reversed cocycle already fails at z=0 for upper/lower unipotents over Q_p.
theorem automorphyFactor_not_rightAction [CharZero C] :
    automorphyFactor C (!![1,1;0,1]*!![1,0;1,1]) 0 ≠
      automorphyFactor C !![1,0;1,1] (fractionalLinear C !![1,1;0,1] 0)*
        automorphyFactor C !![1,1;0,1] 0 := sorry
example [CharZero C] : automorphyFactor C (!![1,1;0,1]*!![1,0;1,1]) 0 ≠
    automorphyFactor C !![1,0;1,1] (fractionalLinear C !![1,1;0,1] 0)*
      automorphyFactor C !![1,1;0,1] 0 := sorry
end Coordinate

/-! The error lattice is the integral closure in the generic algebra, supplied
as a concrete subring L. In ramified Hilbert data L is the integral closure of
O_p⊗O_C in O_p⊗C, not the order itself. -/
section Balls
variable (K : Type u) [CommRing K] (L : Subring K)

def flagBall (t x : K) : Set K := {z | ∃ e : L, z = x + t*(e : K)}

def integralBall (centers : Set K) (t : K) : Set K :=
  {z | ∃ c ∈ centers, z ∈ flagBall K L t c}

theorem integralBall_points (centers : Set K) (t : K) :
    integralBall K L centers t = {z | ∃ c ∈ centers, ∃ e : L, z = c+t*(e : K)} := sorry

theorem integralBall_mono (centers : Set K) (t t' : K) (a : L)
    (ht : t = t'*(a : K)) : integralBall K L centers t ⊆ integralBall K L centers t' := sorry

-- Γ₀(p) action on the first chart; the second chart is expressed homogeneously.
-- Omitted: r<1, Γ₀ coefficients, centers=O_p, L the specified integral closure.
theorem integralBall_gamma0 (C : Type u) [Field C] (L : Subring C)
    (centers : Set C) (t : C) (γ : Matrix (Fin 2) (Fin 2) C) :
    ∀ z ∈ integralBall C L centers t,
      fractionalLinear C γ z ∈ integralBall C L centers t := sorry

-- Q_p case: integral centers are in L, and the radius-one error lattice is all of L.
theorem integralBall_one (centers : Set K) (hc : centers ⊆ L) (h0 : 0 ∈ centers) :
    integralBall K L centers 1 = L := sorry
example (centers : Set K) (hc : centers ⊆ L) (h0 : 0 ∈ centers) :
    integralBall K L centers 1 = L := sorry

-- The two disjoint homogeneous neighborhoods: |x/y|≤1 versus |y/x|<1.
-- The scalar t has positive valuation, expressing the strict radius r<1.
theorem integralBall_disjoint (C : Type u) [Field C] (v : AddValuation C (WithTop ℝ))
    (r : ℝ) (hr : 0 < r) :
    Disjoint {u : Fin 2 → C | u ≠ 0 ∧ v (u 1) ≤ v (u 0)}
      {u : Fin 2 → C | u ≠ 0 ∧ v (u 0) + r ≤ v (u 1)} := sorry
example (C : Type u) [Field C] (v : AddValuation C (WithTop ℝ))
    (r : ℝ) (hr : 0 < r) :
    Disjoint {u : Fin 2 → C | u ≠ 0 ∧ v (u 1) ≤ v (u 0)}
      {u : Fin 2 → C | u ≠ 0 ∧ v (u 0) + r ≤ v (u 1)} := sorry

-- Omitted: order<L is the ramified order inside its normalization and e is a separating element.
theorem integralBall_ramified (order : Subring K) (hproper : order < L) :
    ∃ e : L, (e : K) ∉ order := sorry
example (order : Subring K) (hproper : order < L) : ∃ e : L, (e : K) ∉ order := sorry
end Balls

-- O_C-module congruence, never local freeness over O_p⊗O_C.
-- Omitted: α is the integral HT map, N is the O_C-span of canonical points,
-- scalar t has v(t)=n-p^n*w/(p-1)>0 and the source character estimates hold.
theorem canonicalKernel_congruence (O T W : Type u) [CommRing O]
    [AddCommGroup T] [Module O T] [AddCommGroup W] [Module O W]
    (α : T →ₗ[O] W) (N : Submodule O T) (t : O) :
    Submodule.map (Ideal.span {t} • (⊤ : Submodule O T)).mkQ (LinearMap.ker α) =
      Submodule.map (Ideal.span {t} • (⊤ : Submodule O T)).mkQ N := sorry

-- Projection along embeddings uses the unsplit canonical generator (c,1).
-- Omitted: z-c belongs to the scalar-congruence error lattice and σ is one of the actual embeddings.
theorem ramifiedPeriod_comparison (B O : Type u) [CommRing B] [CommRing O]
    (σ : B →+* O) (z c t : B) : σ z - σ c ∈ Ideal.span {σ t} := sorry

-- BHW's inclusive point bound; its endpoint proof is still the recorded supplier gap.
-- ε≤1/(c_p*p^m), p^{-m}≤r<1, n=m+1. pi is the supplied geometric period map.
theorem periodMap_inclusions (X K : Type u) [CommRing K] (L : Subring K)
    (pi : X → K) (Anti : Set X) (centers : Set K) (t : K) :
    Set.MapsTo pi Anti (integralBall K L centers t) := sorry

/-! T5: Igusa fibers are partial finite-module frames, not full Tate frames.
The global finite étale sheaf/torsor is supplied by H4 from these fibers. -/
abbrev igusaTorsor (B H : Type u) [CommRing B] [AddCommGroup H] [Module B H] := B ≃ₗ[B] H

-- Reduction of the actual O_F/p^(m+1) generator to O_F/p^m.
def igusaTorsor_transition (B H B' H' : Type u) [CommRing B] [CommRing B']
    [AddCommGroup H] [Module B H] [AddCommGroup H'] [Module B' H']
    (reduceB : B →+* B') (reduceH : H →+ H') : igusaTorsor B H → igusaTorsor B' H' := sorry

-- The inverse limit and its pro-etale O_p^× action belong to P9/H4.
def ordinaryIgusaTower {C : Type u} [Category C] (J : GrothendieckTopology C)
    (levels : ℕ → Sheaf J (Type u)) (transition : ∀ m, levels (m+1) ⟶ levels m) :
    Sheaf J (Type u) := sorry

def igusaTorsor_universalTrivialisation (B H : Type u) [CommRing B]
    [AddCommGroup H] [Module B H] (ψ : igusaTorsor B H) : B ≃ₗ[B] H := ψ

-- Omitted: H' is the base-changed dual canonical module, with its canonical generator comparison.
def igusaTorsor_baseChange (B H B' H' : Type u) [CommRing B] [CommRing B']
    [AddCommGroup H] [Module B H] [AddCommGroup H'] [Module B' H']
    (f : B →+* B') : igusaTorsor B H → igusaTorsor B' H' := sorry

theorem igusaTorsor_degree (p m : ℕ) [Fact p.Prime] (hm : 1 ≤ m) :
    Nat.card ((ZMod (p^m))ˣ) = p^(m-1)*(p-1) := sorry
example (p m : ℕ) [Fact p.Prime] (hm : 1 ≤ m) :
    Nat.card ((ZMod (p^m))ˣ) = p^(m-1)*(p-1) := sorry

-- A tautological identity generator gives the Tate-cusp section of the finite torsor.
theorem igusaTorsor_cusp (B : Type u) [CommRing B] : Nonempty (igusaTorsor B B) := sorry
example (B : Type u) [CommRing B] : Nonempty (igusaTorsor B B) := sorry

theorem igusaTorsor_not_fullLevel :
    Nat.card ((ZMod 2)ˣ) = 1 ∧
      Nat.card ((Fin 2 → ZMod 2) ≃ₗ[ZMod 2] (Fin 2 → ZMod 2)) = 6 := sorry
example : Nat.card ((ZMod 2)ˣ) ≠
    Nat.card ((Fin 2 → ZMod 2) ≃ₗ[ZMod 2] (Fin 2 → ZMod 2)) := sorry

-- The mod-p^m dual-canonical quotient makes α(e₁) an actual finite module frame.
-- φ is a morphism of spaces to Igusa; it neither is an isomorphism nor factors through Γ₀.
def igusaFullLevel_comparison (B H : Type u) [CommRing B] [AddCommGroup H] [Module B H]
    (αe₁ : H) : igusaTorsor B H := sorry

/-! Integral lattices on a common normal formal Hilbert chart. B=O_F⊗R, W=ω,
I_m=p^m Hdg_T^{-(p^m-1)}, I'_m=p^m Hdg_T^{-p^m}; these are integral ideals
on this chart. R2's O⁺ transfer must preserve both generator matrices and their
inverses. Their numerical valuation bounds are not a replacement for that input. -/
section IntegralLattice
variable (B W : Type u) [CommRing B] [AddCommGroup W] [Module B W]

def igusaHodgeTateClass (I : Ideal B) (H : ModuleCat B) (HT : H ⟶ ModuleCat.of B W)
    (ψ : igusaTorsor B H) : W ⧸ (I • (⊤ : Submodule B W)) :=
  Submodule.Quotient.mk (HT.hom (ψ 1))

def integralDifferentialLattice (I : Ideal B) (ψ₁ : W ⧸ (I • (⊤ : Submodule B W))) :
    Submodule B W :=
  Submodule.comap (I • (⊤ : Submodule B W)).mkQ (Submodule.span B {ψ₁})

-- Omitted: the normal formal chart has the AIPH generator matrix with regular det Hdg_T.
theorem integralDifferentialLattice_locallyFree (I : Ideal B)
    (ψ₁ : W ⧸ (I • (⊤ : Submodule B W))) :
    Module.Free B (integralDifferentialLattice B W I ψ₁) ∧
      Module.finrank B (integralDifferentialLattice B W I ψ₁) = 1 := sorry

theorem integralDifferentialLattice_bounds (I : Ideal B)
    (ψ₁ : W ⧸ (I • (⊤ : Submodule B W))) (HdgT : B) :
    Ideal.span {HdgT} • (⊤ : Submodule B W) ≤ integralDifferentialLattice B W I ψ₁ ∧
      integralDifferentialLattice B W I ψ₁ ≤ ⊤ := sorry

-- I' is the stronger congruence ideal, and e is the canonical lifted generator in F.
def integralDifferentialLattice_hodgeTate (F : Submodule B W) (I' : Ideal B) (e : F) :
    (B ⧸ I') ≃ₗ[B] (F ⧸ (I' • (⊤ : Submodule B F))) := sorry

-- Omitted: two levels on a common model/radius, with compatible dual generators.
theorem integralDifferentialLattice_indep (I J : Ideal B)
    (ψ : W ⧸ (I • (⊤ : Submodule B W))) (ψ' : W ⧸ (J • (⊤ : Submodule B W))) :
    integralDifferentialLattice B W I ψ = integralDifferentialLattice B W J ψ' := sorry

-- Exact determinant-cancellation step used by the level-independence proof.
-- Here hunit is proved from equal regular determinant ideals on the common formal model.
theorem integralDifferentialLattice_level_eq (F F' : Submodule B W) (g : ℕ)
    (b : Module.Basis (Fin g) B F) (b' : Module.Basis (Fin g) B F') (hinc : F' ≤ F)
    (hunit : IsUnit (Matrix.det (fun i j => b.repr ⟨(b' j : W), hinc (b' j).property⟩ i))) :
    F' = F := sorry

theorem integralDifferentialLattice_ordinary (I : Ideal B)
    (ψ₁ : W ⧸ (I • (⊤ : Submodule B W)))
    (hgen : Submodule.span B {ψ₁} = ⊤) : integralDifferentialLattice B W I ψ₁ = ⊤ := sorry
example (I : Ideal B) (ψ₁ : W ⧸ (I • (⊤ : Submodule B W)))
    (hgen : Submodule.span B {ψ₁} = ⊤) : integralDifferentialLattice B W I ψ₁ = ⊤ := sorry

-- Omitted: B=O_C and F is the elliptic rank-one lattice at height w, v(a)=w/(p-1).
def integralDifferentialLattice_colength (F : Submodule B W) (a : B) :
    (W ⧸ F) ≃ₗ[B] (B ⧸ Ideal.span {a}) := sorry
example (F : Submodule B W) (a : B) : (W ⧸ F) ≃ₗ[B] (B ⧸ Ideal.span {a}) := sorry

theorem integralDifferentialLattice_ne_plus (F : Submodule B W) (a : B)
    (hq : Nonempty ((W ⧸ F) ≃ₗ[B] (B ⧸ Ideal.span {a}))) (ha : ¬ IsUnit a) : F ≠ ⊤ := sorry
example (F : Submodule B W) (a : B)
    (hq : Nonempty ((W ⧸ F) ≃ₗ[B] (B ⧸ Ideal.span {a}))) (ha : ¬ IsUnit a) : F ≠ ⊤ := sorry
end IntegralLattice

/-! Modified Hodge sheaves use a specified minor modification and the image's
strict transform. They are not defined by pulling back the unmodified image. -/
def modifiedModel (X : Scheme)
    (minorIdeal : SheafOfModules.Submodule (SheafOfModules.unit X.ringCatSheaf)) : Over X := sorry

def modifiedHodgeBundle (X : Scheme.{u}) (ω source : SheafOfModules.{u} X.ringCatSheaf) (HT : source ⟶ ω) :
    SheafOfModules.Submodule ω := sorry

theorem modifiedHodgeBundle_locallyFree (X : Scheme.{u}) (ω source : SheafOfModules.{u} X.ringCatSheaf)
    (HT : source ⟶ ω) :
    SheafOfModules.IsLocallyFree.{u} (modifiedHodgeBundle X ω source HT).toSheafOfModules := sorry

-- p≥3: b=1/(p-1), level n>b. The p=2 exponent b=2 requires its separate supplier estimate.
-- powerLattice is the supplied p^b ω subsheaf on this actual model.
theorem modifiedHodgeBundle_bounds (X : Scheme.{u}) (ω source : SheafOfModules.{u} X.ringCatSheaf)
    (HT : source ⟶ ω) (powerLattice : SheafOfModules.Submodule ω) :
    powerLattice ≤ modifiedHodgeBundle X ω source HT ∧
      modifiedHodgeBundle X ω source HT ≤ ⊤ := sorry

-- On affine presentations of the modified model, reduced HT has the following target.
theorem modifiedHodgeBundle_hodgeTate_surjective (B T W : Type u) [CommRing B]
    [AddCommGroup T] [Module B T] [AddCommGroup W] [Module B W]
    (F : Submodule B W) (I : Ideal B) (HT : T →ₗ[B] F ⧸ (I • (⊤ : Submodule B F))) :
    Function.Surjective HT := sorry

-- The generic-fibre arrow is supplied by R2; the modification is admissible and normal.
theorem modifiedModel_generic {X X' : Scheme} (genericArrow : X' ⟶ X) :
    IsIso genericArrow := sorry

theorem modifiedHodgeBundle_ordinary (X : Scheme.{u}) (ω source : SheafOfModules.{u} X.ringCatSheaf) (HT : source ⟶ ω)
    (hordinary : IsIso HT) : modifiedHodgeBundle X ω source HT = ⊤ := sorry
example (X : Scheme.{u}) (ω source : SheafOfModules.{u} X.ringCatSheaf) (HT : source ⟶ ω) (hordinary : IsIso HT) :
    modifiedHodgeBundle X ω source HT = ⊤ := sorry

-- Omitted: F is the rank-one image lattice on the modified elliptic chart.
def modifiedHodgeBundle_colength (B W : Type u) [CommRing B] [AddCommGroup W] [Module B W]
    (F : Submodule B W) (a : B) : (W ⧸ F) ≃ₗ[B] (B ⧸ Ideal.span {a}) := sorry
example (B W : Type u) [CommRing B] [AddCommGroup W] [Module B W]
    (F : Submodule B W) (a : B) : (W ⧸ F) ≃ₗ[B] (B ⧸ Ideal.span {a}) := sorry

-- A concrete non-principal image ideal on a 2-dimensional regular chart provides the test.
-- Omitted: F is that image over B=k[x,y] localized at (x,y), with noninvertible minor ideal.
theorem modifiedHodgeBundle_not_locallyFree_before_blowup (B W : Type u) [CommRing B]
    [AddCommGroup W] [Module B W] (F : Submodule B W) : ¬ Module.Free B F := sorry
example (B W : Type u) [CommRing B] [AddCommGroup W] [Module B W]
    (F : Submodule B W) : ¬ Module.Free B F := sorry

-- C5 supplies Stein factorization of the normalized finite-level toroidal→minimal map.
def minimalLevelModel (Xmin Xtor : Scheme) (f : Xtor ⟶ Xmin) : Over Xmin := sorry

-- Omitted: sourceMin/detMin descend the exterior-power source and determinant line;
-- αtor is the given HT exterior-power map, and its mod-p^k Koecher descent is supplied by C5.
def hodgeTateDeterminant_descends (Xmin Xtor : Scheme) (f : Xtor ⟶ Xmin)
    (sourceTor detTor : Xtor.Modules) (αtor : sourceTor ⟶ detTor)
    (sourceMin detMin : Xmin.Modules) : sourceMin ⟶ detMin := sorry

def modifiedMinimalModel (Xmin : Scheme)
    (coefficientIdeal : SheafOfModules.Submodule (SheafOfModules.unit Xmin.ringCatSheaf)) :
    Over Xmin := sorry

-- D=g*b and n>D: b=1/(p-1) at odd p, b=2 conditionally at p=2.
-- GSp4/F has g=2[F:Q], hence D=4[F:Q] for the conditional p=2 variant.
-- powerLattice is p^D times detω; I below is the reduction ideal p^(n-D).
theorem modifiedDetHodge_bounds (X : Scheme.{u}) (detω : SheafOfModules.{u} X.ringCatSheaf)
    (F powerLattice : SheafOfModules.Submodule detω) : powerLattice ≤ F ∧ F ≤ ⊤ := sorry

theorem modifiedDetHodge_surjective (B S W : Type u) [CommRing B]
    [AddCommGroup S] [Module B S] [AddCommGroup W] [Module B W]
    (F : Submodule B W) (I : Ideal B) (HTdet : S →ₗ[B] F ⧸ (I • (⊤ : Submodule B F))) :
    Function.Surjective HTdet := sorry

-- Omitted: the ordinary open, the determinant image and the unit coefficient ideal.
theorem modifiedMinimalModel_ordinary (X : Scheme.{u}) (detω : SheafOfModules.{u} X.ringCatSheaf)
    (F : SheafOfModules.Submodule detω) : F = ⊤ := sorry
example (X : Scheme.{u}) (detω : SheafOfModules.{u} X.ringCatSheaf) (F : SheafOfModules.Submodule detω) : F = ⊤ := sorry

-- Exterior square of rank four has six basis elements; it is not an underlying determinant line.
theorem modifiedDetHodge_factor : Nat.choose 4 2 = 6 ∧ Nat.choose 4 2 ≠ 1 := sorry
example : Nat.choose 4 2 = 6 ∧ Nat.choose 4 2 ≠ 1 := sorry

-- The modified determinant line pulls back from the minimal modification;
-- this does not imply descent of the full Hodge bundle at finite level.
-- Omitted: f and the sheaves are the compatible GSp4/F models of the reader's example.
theorem modifiedMinimalModel_not_toroidal (Xmin Xtor : Scheme) (f : Xtor ⟶ Xmin)
    (Lmin : Xmin.Modules) (Ltor ωtor : Xtor.Modules) :
    Nonempty ((Scheme.Modules.pullback f).obj Lmin ≅ Ltor) ∧
      ¬ ∃ ωmin : Xmin.Modules, Nonempty ((Scheme.Modules.pullback f).obj ωmin ≅ ωtor) := sorry
example (Xmin Xtor : Scheme) (f : Xtor ⟶ Xmin)
    (Lmin : Xmin.Modules) (Ltor ωtor : Xtor.Modules) :
    Nonempty ((Scheme.Modules.pullback f).obj Lmin ≅ Ltor) ∧
      ¬ ∃ ωmin : Xmin.Modules, Nonempty ((Scheme.Modules.pullback f).obj ωmin ≅ ωtor) := sorry

/-! The étale plus sheaf is an actual O⁺-submodule sheaf, with effective descent
supplied by P9. Etale and analytic sites are different categories. -/
section PlusSheaf
variable {C : Type u} [Category C] (J : GrothendieckTopology C)
variable (Oplus : Sheaf J RingCat) (ω source : SheafOfModules Oplus)

def modifiedPlusSheaf (HT : source ⟶ ω) : SheafOfModules.Submodule ω := sorry

-- Omitted: finiteModel is the generic-fibre image sheaf pulled to finite full level (n≥1; p=2 n≥2).
def modifiedPlusSheaf_pullback (HT : source ⟶ ω) (finiteModel : SheafOfModules Oplus) :
    (modifiedPlusSheaf J Oplus ω source HT).toSheafOfModules ≅ finiteModel := sorry

theorem modifiedPlusSheaf_bounds (HT : source ⟶ ω) (powerLattice : SheafOfModules.Submodule ω) :
    powerLattice ≤ modifiedPlusSheaf J Oplus ω source HT ∧
      modifiedPlusSheaf J Oplus ω source HT ≤ ⊤ := sorry

-- HT and HT' are the same image generators obtained from two permitted levels.
theorem modifiedPlusSheaf_indep (HT HT' : source ⟶ ω) :
    modifiedPlusSheaf J Oplus ω source HT = modifiedPlusSheaf J Oplus ω source HT' := sorry

theorem modifiedPlusSheaf_ordinary (HT : source ⟶ ω) (hordinary : IsIso HT) :
    modifiedPlusSheaf J Oplus ω source HT = ⊤ := sorry
example (HT : source ⟶ ω) (hordinary : IsIso HT) : modifiedPlusSheaf J Oplus ω source HT = ⊤ := sorry

-- Pointwise specialization is the scalar elliptic lattice at v(a)=w/(p-1).
def modifiedPlusSheaf_rankOne (B W : Type u) [CommRing B] [AddCommGroup W] [Module B W]
    (F : Submodule B W) (a : B) : (W ⧸ F) ≃ₗ[B] (B ⧸ Ideal.span {a}) := sorry
example (B W : Type u) [CommRing B] [AddCommGroup W] [Module B W]
    (F : Submodule B W) (a : B) : (W ⧸ F) ≃ₗ[B] (B ⧸ Ideal.span {a}) := sorry

-- pull is the actual site pullback from the analytic site to the etale site.
-- Omitted: the fixed nonordinary model where the etale image does not analytically descend.
theorem modifiedPlusSheaf_not_analytic (AnalyticModules : Type u) [Category AnalyticModules]
    (pull : AnalyticModules ⥤ SheafOfModules Oplus) (HT : source ⟶ ω) :
    ¬ ∃ F : AnalyticModules,
      Nonempty (pull.obj F ≅ (modifiedPlusSheaf J Oplus ω source HT).toSheafOfModules) := sorry
example (AnalyticModules : Type u) [Category AnalyticModules]
    (pull : AnalyticModules ⥤ SheafOfModules Oplus) (HT : source ⟶ ω) :
    ¬ ∃ F : AnalyticModules,
      Nonempty (pull.obj F ≅ (modifiedPlusSheaf J Oplus ω source HT).toSheafOfModules) := sorry
end PlusSheaf

/-! T5: the actual AIP congruence torsor and its structure subgroup. -/
section AIP
variable (B W : Type u) [CommRing B] [AddCommGroup W] [Module B W]

def aipTorsor (F : Submodule B W) (I' : Ideal B) (e : F) : Set F :=
  {w | w-e ∈ I' • (⊤ : Submodule B F)}

-- OpUnits is the embedded arithmetic unit subgroup, and I' is topologically nilpotent.
-- The supplier's analytic group has the indicated unit-valued points.
def aipTorsor_structureGroup (I' : Ideal B) (OpUnits : Subgroup Bˣ) : Subgroup Bˣ := sorry

-- The genuine total spaces carry their analytic topologies; embedding is the inclusion in T(ω).
theorem aipTorsor_openImmersion (TotalF Totalω : Type u) [TopologicalSpace TotalF]
    [TopologicalSpace Totalω] (embedding : TotalF → Totalω) : Topology.IsOpenEmbedding embedding := sorry

-- The one valid direction: I'≤(p^x) gives B_m≤O_p^×(1+p^x L).
theorem aipTorsor_bound (I' J : Ideal B) (OpUnits : Subgroup Bˣ) (hIJ : I' ≤ J) :
    aipTorsor_structureGroup B I' OpUnits ≤ aipTorsor_structureGroup B J OpUnits := sorry

-- The formal generator matrix proves that every lift lies in F and agrees modulo I'F.
-- Omitted: I ω ≤ I' F and e is HT'(1); the reduction of s equals the Igusa class.
theorem aipTorsor_lift (F : Submodule B W) (I I' : Ideal B) (e : F) (s : W)
    (hred : s-(e : W) ∈ I • (⊤ : Submodule B W)) :
    ∃ hs : s ∈ F, (⟨s, hs⟩ : F) ∈ aipTorsor B W F I' e := sorry

-- At height zero Hdg_T=1 and I'=p^m; the following is the exact congruence fiber.
theorem aipTorsor_ordinary (F : Submodule B W) (p m : ℕ) (e : F) :
    aipTorsor B W F (Ideal.span {(p : B)^m}) e =
      {w | w-e ∈ Ideal.span {(p : B)^m} • (⊤ : Submodule B F)} := sorry
example (F : Submodule B W) (p m : ℕ) (e : F) :
    aipTorsor B W F (Ideal.span {(p : B)^m}) e =
      {w | w-e ∈ Ideal.span {(p : B)^m} • (⊤ : Submodule B F)} := sorry

-- The O5 associated sheaf for algebraic κ=x^k is identified with the actual tensor-power sheaf.
def aipSheaf_classical {C : Type u} [Category C] (J : GrothendieckTopology C)
    (O : Sheaf J RingCat) (associatedWeight tensorPower : SheafOfModules O) :
    associatedWeight ≅ tensorPower := sorry
example {C : Type u} [Category C] (J : GrothendieckTopology C) (O : Sheaf J RingCat)
    (associatedWeight tensorPower : SheafOfModules O) : associatedWeight ≅ tensorPower := sorry

-- A unit 1+a with a∈J\I' separates the ambient bound from the actual structure group.
-- Omitted: local coefficient ring, topologically nilpotent ideals, and trivial arithmetic unit class.
theorem aipTorsor_bound_direction (I' J : Ideal B) (hIJ : I' < J) (OpUnits : Subgroup Bˣ) :
    ¬ aipTorsor_structureGroup B J OpUnits ≤ aipTorsor_structureGroup B I' OpUnits := sorry
example (I' J : Ideal B) (hIJ : I' < J) (OpUnits : Subgroup Bˣ) :
    ¬ aipTorsor_structureGroup B J OpUnits ≤ aipTorsor_structureGroup B I' OpUnits := sorry
end AIP

-- The lift is an actual factorization of the HT section through the AIP open subspace.
-- Omitted: source is the anticanonical full-level tower, F its AIP space over φ to Igusa.
def hodgeTate_aipLift (Tower F Totalω : Type u) (s : Tower → Totalω)
    (ι : F → Totalω) : Tower → F := sorry

-- The torsor-ratio proof places j in the actual B_m, even at ramified primes.
-- Omitted: s and γ*s are the two AIP sections over the same abelian base point.
theorem aip_automorphyFactor (B : Type u) [CommRing B] (C : Type u) [Field C]
    [Algebra B C] (I' : Ideal B) (OpUnits : Subgroup Bˣ)
    (γ : Matrix (Fin 2) (Fin 2) C) (z : C) :
    ∃ u : aipTorsor_structureGroup B I' OpUnits,
      algebraMap B C (u.val : B) = automorphyFactor C γ z := sorry

-- O5 independently constructs the two coefficient sheaves; P9 supplies effective integral
-- base-change/pro-etale descent and a local generator with unit HT pullback.
-- Omitted: a common actual AIP coordinate/level/radius and analytic-character domain.
-- The printed supremum and analytic-radius formulas, or an index repair alone, do not supply it.
-- Finite n uses the correctly scaled AL_n and AIPH 6.7(3); infinity uses structural pullback.
def aipHodgeTate_comparison {C : Type u} [Category C] (J : GrothendieckTopology C)
    (Oplus : Sheaf J RingCat) (aipWeight perfectoidWeight : SheafOfModules Oplus) :
    aipWeight ≅ perfectoidWeight := sorry

-- Boundary application of R07.2 normalization, with division first on the character
-- determinant Z_p line; det fT=p^r*u does not mean fT=p*u. C4 supplies the charts.
-- Omitted: L',L are the two conormal determinant lines and fω is det of λ*.
theorem normalizedMultiplicativePullback_det (p : ℕ) [Fact p.Prime]
    (O : Type u) [CommRing O] [Algebra (PadicInt p) O] (g r : ℕ)
    (fT : (Fin g → PadicInt p) →ₗ[PadicInt p] (Fin g → PadicInt p))
    (hdet : ∃ u : (PadicInt p)ˣ, LinearMap.det fT = (p : PadicInt p)^r * (u : PadicInt p))
    (L L' : Type u) [AddCommGroup L] [Module O L] [AddCommGroup L'] [Module O L']
    (fω : L' →ₗ[O] L) : ∃ normalized : L' ≃ₗ[O] L,
      fω = (p : O)^r • normalized.toLinearMap := sorry

-- The integral lattice theorem on an affine normal formal chart; I,I' and HdgT
-- are the actual ideals/section, with compatible generator and R2 O⁺ transfer.
theorem integralLattice_properties (B W : Type u) [CommRing B]
    [AddCommGroup W] [Module B W] (F : Submodule B W) (I' : Ideal B) (HdgT : B) :
    Module.Free B F ∧ Module.finrank B F = 1 ∧
      Ideal.span {HdgT} • (⊤ : Submodule B W) ≤ F ∧
      Nonempty ((B ⧸ I') ≃ₗ[B] (F ⧸ (I' • (⊤ : Submodule B F)))) := sorry

end TauCeti.HodgeTate
