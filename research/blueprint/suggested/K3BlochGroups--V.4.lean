import Mathlib.RepresentationTheory.Homological.GroupHomology.Functoriality
import Mathlib.RepresentationTheory.Homological.GroupHomology.Shapiro
import Mathlib.RepresentationTheory.Homological.FiniteCyclic
import Mathlib.GroupTheory.FreeAbelianGroup
import Mathlib.GroupTheory.Torsion
import Mathlib.LinearAlgebra.LinearIndependent.Basic
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.LinearAlgebra.TensorProduct.Basic
import Mathlib.Algebra.Homology.SpectralSequence.Basic
import Mathlib.Algebra.Category.Grp.Injective
import Mathlib.Topology.Compactification.OnePoint.ProjectiveLine
import Mathlib.FieldTheory.IsAlgClosed.Basic
import Mathlib.Data.ZMod.Basic
import Mathlib.Basic.Real.Basic
import Mathlib.Algebra.Field.Subfield.Basic

/-!
This file is not the roadmap and is not exhaustive. The roadmap document is definitive.
These statements suggest Lean forms so contributors and reviewers converge on names and
signatures. Every proof and new construction is a placeholder, not an implementation.

The imported parent packet owns projective configurations, cross-ratio, ψ₂, ψ₃, monomial
homotopy, enhanced Tor and the Suslin sequence. No private replacement is introduced here.
Supplier objects without a baseline definition are section parameters: MK is the T.2
Milnor family, stabilization is the parent block inclusion on homology, orderedProduct
is the H.1/upstream ordered cross product, and κ/e/Twist are the parent/early-Chern maps.
Conditions whose supplier syntax is unavailable are identified in comments and omitted,
as prescribed by the blueprint protocol. These are signature prototypes, not assertions
that arbitrary supplied maps satisfy the source theorems.
-/

noncomputable section
open CategoryTheory CategoryTheory.Limits
open scoped TensorProduct
set_option linter.unusedVariables false
namespace TauCeti.SuslinV4

variable (F : Type) [Field F]

/-- Routine index abbreviation: q ordered vectors, independently projected to Fⁿ. -/
abbrev Frame (n m q : ℕ) :=
  {t : Fin q → ((Fin n → F) × (Fin m → F)) //
    LinearIndependent F (fun i => (t i).1)}

def Frame.delete {n m q : ℕ} (t : Frame F n m (q + 1)) (i : Fin (q + 1)) :
    Frame F n m q := ⟨fun j => t.val (i.succAbove j), by sorry⟩

def Frame.mapField {E : Type} [Field E] (f : F →+* E) {n m q : ℕ}
    (t : Frame F n m q) : Frame E n m q :=
  ⟨fun i => (fun j => f ((t.val i).1 j), fun j => f ((t.val i).2 j)), by sorry⟩

/-- The lower-block action (g 0; u 1), including the affine shear when m > 0. -/
def Frame.affine {n m q : ℕ} (g : Matrix.GeneralLinearGroup (Fin n) F)
    (u : (Fin n → F) →ₗ[F] (Fin m → F)) (t : Frame F n m q) : Frame F n m q :=
  ⟨fun i => ((Matrix.GeneralLinearGroup.toLin g).val ((t.val i).1),
    u ((t.val i).1) + (t.val i).2), by sorry⟩

-- K3BlochGroups:V.4/unimodular-vector-chains
-- The empty frame has degree 0; ordinary simplex dimension is q-1.
def unimodularChains (F : Type) [Field F] (n m : ℕ) : ChainComplex (ModuleCat ℤ) ℕ := by sorry

namespace unimodularChains

def frame {n m q : ℕ} (t : Frame F n m q) : (unimodularChains F n m).X q := by sorry

lemma frame_d {n m q : ℕ} (t : Frame F n m (q + 1)) :
    (unimodularChains F n m).d (q + 1) q (frame F t) =
      ∑ i : Fin (q + 1), (-1 : ℤ) ^ (i : ℕ) • frame F (t.delete F i) := by sorry

def basisEquiv (n m q : ℕ) :
    FreeAbelianGroup (Frame F n m q) ≃ₗ[ℤ] (unimodularChains F n m).X q := by sorry

lemma basisEquiv_of (n m q : ℕ) (t : Frame F n m q) :
    basisEquiv F n m q (FreeAbelianGroup.of t) = frame F t := by sorry

def affineMap {n m : ℕ} (g : Matrix.GeneralLinearGroup (Fin n) F)
    (u : (Fin n → F) →ₗ[F] (Fin m → F)) :
    unimodularChains F n m ⟶ unimodularChains F n m := by sorry

lemma affineMap_frame {n m q : ℕ} (g : Matrix.GeneralLinearGroup (Fin n) F)
    (u : (Fin n → F) →ₗ[F] (Fin m → F)) (t : Frame F n m q) :
    (affineMap F g u).f q (frame F t) = frame F (t.affine F g u) := by sorry

lemma affineMap_id (n m : ℕ) :
    affineMap F (1 : Matrix.GeneralLinearGroup (Fin n) F)
      (0 : (Fin n → F) →ₗ[F] (Fin m → F)) = 𝟙 _ := by sorry

lemma affineMap_comp {n m : ℕ} (g h : Matrix.GeneralLinearGroup (Fin n) F)
    (u v : (Fin n → F) →ₗ[F] (Fin m → F)) :
    affineMap F (h * g) (v.comp (Matrix.GeneralLinearGroup.toLin g).val + u) =
      affineMap F g u ≫ affineMap F h v := by sorry

def glRepresentation (n : ℕ) :
    ChainComplex (Rep ℤ (Matrix.GeneralLinearGroup (Fin n) F)) ℕ := by sorry

lemma glRepresentation_forget (n : ℕ) :
    ∃ e : ∀ q, ((glRepresentation F n).X q) ≃ₗ[ℤ] (unimodularChains F n 0).X q,
      ∀ p q x, e q (((glRepresentation F n).d p q).hom x) =
        (unimodularChains F n 0).d p q (e p x) := by sorry

-- The same equivalence identifies the action, so a trivial GL action cannot qualify.
lemma glRepresentation_frame (n : ℕ) :
    ∃ e : ∀ q, ((glRepresentation F n).X q) ≃ₗ[ℤ] (unimodularChains F n 0).X q,
      (∀ p q x, e q (((glRepresentation F n).d p q).hom x) =
        (unimodularChains F n 0).d p q (e p x)) ∧
      ∀ q (g : Matrix.GeneralLinearGroup (Fin n) F) (t : Frame F n 0 q),
        e q (((glRepresentation F n).X q).ρ g ((e q).symm (frame F t))) =
          frame F (t.affine F g 0) := by sorry

def mapField {E : Type} [Field E] (f : F →+* E) (n m : ℕ) :
    unimodularChains F n m ⟶ unimodularChains E n m := by sorry

lemma mapField_frame {E : Type} [Field E] (f : F →+* E) {n m q : ℕ}
    (t : Frame F n m q) :
    (mapField F f n m).f q (frame F t) = frame E (t.mapField F f) := by sorry

lemma mapField_id (n m : ℕ) : mapField F (RingHom.id F) n m = 𝟙 _ := by sorry
lemma mapField_comp {E L : Type} [Field E] [Field L] (f : F →+* E) (g : E →+* L)
    (n m : ℕ) : mapField F (g.comp f) n m = mapField F f n m ≫ mapField E g n m := by sorry

end unimodularChains

-- unimodularChains_rank_zero: the augmentation survives in rank 0.
example (m : ℕ) : Nonempty ((unimodularChains F 0 m).X 0 ≅ ModuleCat.of ℤ ℤ) ∧
    ∀ q, IsZero ((unimodularChains F 0 m).X (q + 1)) := by sorry

-- Routine test frames. Their subtype proofs encode linear independence, not distinctness.
def rationalPoint (a : ℚˣ) : Frame ℚ 1 0 1 :=
  ⟨fun _ => (fun _ => (a : ℚ), Fin.elim0), by sorry⟩
def emptyFrame (n m : ℕ) : Frame F n m 0 := ⟨Fin.elim0, by sorry⟩
def standardTwoFrame : Frame F 2 0 2 :=
  ⟨fun i => (Pi.single i 1, Fin.elim0), by sorry⟩

-- unimodularChains_rank_one: d([2]-[1])=0, but both basis vectors augment to 1.
example :
    (unimodularChains ℚ 1 0).d 1 0
      (unimodularChains.frame ℚ (rationalPoint (Units.mk0 2 (by norm_num)))) =
      unimodularChains.frame ℚ (emptyFrame ℚ 1 0) ∧
    (unimodularChains ℚ 1 0).d 1 0
      (unimodularChains.frame ℚ (rationalPoint 1)) =
      unimodularChains.frame ℚ (emptyFrame ℚ 1 0) ∧
    (unimodularChains ℚ 1 0).d 1 0
      (unimodularChains.frame ℚ (rationalPoint (Units.mk0 2 (by norm_num))) -
        unimodularChains.frame ℚ (rationalPoint 1)) = 0 ∧
    IsZero ((unimodularChains ℚ 1 0).X 2) := by sorry

-- unimodularChains_ordered_boundary: d(e₁,e₂)=[e₂]-[e₁].
example : (unimodularChains F 2 0).d 2 1
    (unimodularChains.frame F (standardTwoFrame F)) =
      unimodularChains.frame F ((standardTwoFrame F).delete F 0) -
        unimodularChains.frame F ((standardTwoFrame F).delete F 1) := by sorry

-- unimodularChains_linear_independence: e₁ and 2e₁ are distinct but dependent.
example : ¬ LinearIndependent ℚ
    (![Pi.single (0 : Fin 2) (1 : ℚ), Pi.single (0 : Fin 2) (2 : ℚ)] :
      Fin 2 → Fin 2 → ℚ) := by sorry

-- unimodularChains_affine_shear: (1 0; 1 1) sends the frame (1,0) to (1,1).
example (t : Frame ℚ 1 1 1) (ht : t.val 0 = (fun _ => 1, fun _ => 0)) :
    (t.affine ℚ 1 (LinearMap.id)).val 0 = (fun _ => 1, fun _ => 1) := by sorry

-- K3BlochGroups:V.4/unimodular-acyclic-range
lemma unimodular_acyclic_range [Infinite F] (n m q : ℕ) (hq : q ≠ n) :
    IsZero ((unimodularChains F n m).homology q) := by sorry

-- K3BlochGroups:V.4/stability-coinvariants
-- The definition is the baseline H₀ of the baseline homology representation.
def stabilityCoinvariants (n : ℕ) : ModuleCat ℤ :=
  groupHomology ((unimodularChains.glRepresentation F n).homology n) 0

namespace stabilityCoinvariants

def gen {n : ℕ} [NeZero n] (a : Fin n → Fˣ) : stabilityCoinvariants F n := by sorry

lemma ext [Infinite F] {n : ℕ} [NeZero n] {A : Type} [AddCommGroup A]
    (f g : stabilityCoinvariants F n →+ A)
    (h : ∀ a, f (gen F a) = g (gen F a)) : f = g := by sorry

/-- Routine formula for the i-th term: delete i, multiply by lamⱼ-lamᵢ, append lamᵢ. -/
def relationEntry {n : ℕ} (a lam : Fin (n + 1) → Fˣ)
    (hlam : Function.Injective lam) (i : Fin (n + 1)) : Fin (n + 1) → Fˣ :=
  Fin.snoc (fun j => Units.mk0
    ((a (i.succAbove j) : F) * ((lam (i.succAbove j) : F) - (lam i : F)))
    (by sorry)) (lam i)

lemma relation [Infinite F] (n : ℕ) (a lam : Fin (n + 1) → Fˣ)
    (hlam : Function.Injective lam) :
    gen F (fun i => lam i * a i) - gen F a =
      ∑ i : Fin (n + 1), (-1 : ℤ) ^ ((i : ℕ) + (n + 1) + 1) •
        gen F (relationEntry F a lam hlam i) := by sorry

def mul (n m : ℕ) :
    (stabilityCoinvariants F n ⊗[ℤ] stabilityCoinvariants F m) →ₗ[ℤ]
      stabilityCoinvariants F (n + m) := by sorry

def unit : stabilityCoinvariants F 0 := by sorry

lemma mul_unit (n : ℕ) (x : stabilityCoinvariants F n) :
    (by simpa using mul F 0 n (TensorProduct.tmul ℤ (unit F) x)) = x ∧
    (by simpa using mul F n 0 (TensorProduct.tmul ℤ x (unit F))) = x := by sorry

/-- Multiplication by e=⟨1,1⟩, with the codomain index transported to n+2. -/
def eMul (n : ℕ) : stabilityCoinvariants F n →+ stabilityCoinvariants F (n + 2) := by sorry

lemma eMul_apply (n : ℕ) (x : stabilityCoinvariants F n) :
    eMul F n x = (by simpa only [Nat.add_comm] using
      (mul F 2 n (TensorProduct.tmul ℤ (gen F (fun _ => 1)) x))) := by sorry

lemma mul_assoc (n m l : ℕ) (x : stabilityCoinvariants F n)
    (y : stabilityCoinvariants F m) (z : stabilityCoinvariants F l) :
    (by simpa only [Nat.add_assoc] using
      mul F (n + m) l (TensorProduct.tmul ℤ (mul F n m (TensorProduct.tmul ℤ x y)) z)) =
      mul F n (m + l) (TensorProduct.tmul ℤ x (mul F m l (TensorProduct.tmul ℤ y z))) := by sorry

-- MK and symbol are imported from K2SymbolsBrauer:T.2/milnor-k-theory.
def milnorRetraction (MK : ℕ → Type) [∀ n, AddCommGroup (MK n)] (n : ℕ) :
    stabilityCoinvariants F n →+ MK n := by sorry

lemma milnorRetraction_gen (MK : ℕ → Type) [∀ n, AddCommGroup (MK n)]
    (symbol : ∀ n, (Fin n → Fˣ) → MK n) [Infinite F] {n : ℕ} [NeZero n]
    (a : Fin n → Fˣ) : milnorRetraction F MK n (gen F a) = symbol n a := by sorry

end stabilityCoinvariants

-- stabilityCoinvariants_zero
example : Nonempty (stabilityCoinvariants F 0 ≃+ ℤ) := by sorry
-- stabilityCoinvariants_one
example [Infinite F] : ∃ e : stabilityCoinvariants F 1 ≃+ Additive Fˣ,
    ∀ a : Fˣ, e (stabilityCoinvariants.gen F (fun _ => a)) = Additive.ofMul a := by sorry
-- stabilityCoinvariants_two_unit
example [Infinite F] (MK : ℕ → Type) [∀ n, AddCommGroup (MK n)] :
    ∃ e : stabilityCoinvariants F 2 ≃+ (MK 2 × ℤ),
      e (stabilityCoinvariants.gen F (fun _ => 1)) = (0, 1) := by sorry
-- stabilityCoinvariants_product_two
example [Infinite F] (a b : Fˣ) :
    stabilityCoinvariants.mul F 1 1 (TensorProduct.tmul ℤ
      (stabilityCoinvariants.gen F (fun _ => a)) (stabilityCoinvariants.gen F (fun _ => b))) =
    stabilityCoinvariants.gen F ![a,b] - stabilityCoinvariants.gen F ![1,b] -
      stabilityCoinvariants.gen F ![a,1] + stabilityCoinvariants.gen F ![1,1] := by sorry

/-- Abbreviation for baseline integral GL homology, not a new homology theory. -/
abbrev GLH (n i : ℕ) :=
  groupHomology (Rep.trivial ℤ (Matrix.GeneralLinearGroup (Fin n) F) ℤ) i

-- These maps are the specified block inclusions and ordered homology products supplied
-- by the parent/H.1; they are parameters until their supplier modules exist.
variable (stabilization : ∀ n i, GLH F n i →+ GLH F (n + 1) i)

-- K3BlochGroups:V.4/frame-connecting-map
-- Index n+1 guarantees the positive degree required by the source.
def frameConnecting [Infinite F] (n : ℕ) :
    GLH F (n + 1) (n + 1) →+ stabilityCoinvariants F (n + 1) := by sorry

lemma frameConnecting_stabilization [Infinite F] (n : ℕ) :
    (frameConnecting F n).comp (stabilization n (n + 1)) = 0 := by sorry

lemma frameConnecting_product [Infinite F] (n m : ℕ)
    (orderedProduct : (GLH F (n + 1) (n + 1) ⊗[ℤ] GLH F (m + 1) (m + 1)) →ₗ[ℤ]
      GLH F ((n + 1) + (m + 1)) ((n + 1) + (m + 1)))
    (x : GLH F (n + 1) (n + 1)) (y : GLH F (m + 1) (m + 1)) :
    frameConnecting F (n + m + 1) (by simpa only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
      using (orderedProduct (TensorProduct.tmul ℤ x y))) =
    (by simpa only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using
      (stabilityCoinvariants.mul F (n + 1) (m + 1)
        (TensorProduct.tmul ℤ (frameConnecting F n x) (frameConnecting F m y)))) := by sorry

lemma frameConnecting_one [Infinite F] (h1 : Additive Fˣ ≃+ GLH F 1 1) (a : Fˣ) :
    frameConnecting F 0 (h1 (Additive.ofMul a)) =
      stabilityCoinvariants.gen F (fun _ => a) := by sorry

lemma frameConnecting_field {E : Type} [Field E] [Infinite F] [Infinite E]
    (f : F →+* E) (n : ℕ)
    (homologyField : GLH F (n + 1) (n + 1) →+ GLH E (n + 1) (n + 1))
    (sField : stabilityCoinvariants F (n + 1) →+ stabilityCoinvariants E (n + 1)) :
    (frameConnecting E n).comp homologyField = sField.comp (frameConnecting F n) := by sorry

-- frameConnecting_one_test
example (h1 : Additive ℚˣ ≃+ GLH ℚ 1 1) :
    frameConnecting ℚ 0 (h1 (Additive.ofMul (Units.mk0 2 (by norm_num)))) =
      stabilityCoinvariants.gen ℚ (fun _ => Units.mk0 2 (by norm_num)) := by sorry
-- frameConnecting_old_rank
example [Infinite F] (x : GLH F 2 3) :
    frameConnecting F 2 (stabilization 2 3 x) = 0 := by sorry

section MilnorComparison
variable (MK : ℕ → Type) [∀ n, AddCommGroup (MK n)]
variable (symbol : ∀ n, (Fin n → Fˣ) → MK n)
variable (torusWord : ∀ n, (Fin n → Fˣ) → GLH F n n)

-- frameConnecting_torus_three
example [Infinite F] (a : Fin 3 → Fˣ) :
    stabilityCoinvariants.milnorRetraction F MK 3 (frameConnecting F 2 (torusWord 3 a)) =
      symbol 3 a := by sorry

-- Routine abbreviation of the baseline additive quotient; θ has positive index n+1.
abbrev StabilityQuotient (n : ℕ) :=
  GLH F (n + 1) (n + 1) ⧸ (stabilization n (n + 1)).range

-- K3BlochGroups:V.4/normalized-milnor-homology-map
-- The source symbol universal property and unstable Steinberg input are supplier gaps.
def milnorHomologyTheta [Infinite F] (n : ℕ) :
    MK (n + 1) →+ StabilityQuotient F stabilization n := by sorry

lemma milnorHomologyTheta_symbol [Infinite F] (n : ℕ) (a : Fin (n + 1) → Fˣ) :
    milnorHomologyTheta F stabilization MK n (symbol (n + 1) a) =
      QuotientAddGroup.mk (torusWord (n + 1) a) := by sorry

lemma milnorHomologyTheta_field {E : Type} [Field E] [Infinite F] [Infinite E]
    (f : F →+* E) (n : ℕ) (MKE : ℕ → Type) [∀ n, AddCommGroup (MKE n)]
    (stabE : ∀ n i, GLH E n i →+ GLH E (n + 1) i)
    (mkField : MK (n + 1) →+ MKE (n + 1))
    (quotientField : StabilityQuotient F stabilization n →+ StabilityQuotient E stabE n) :
    (milnorHomologyTheta E stabE MKE n).comp mkField =
      quotientField.comp (milnorHomologyTheta F stabilization MK n) := by sorry

lemma milnorHomologyTheta_unique [Infinite F] (n : ℕ)
    (φ : MK (n + 1) →+ StabilityQuotient F stabilization n)
    (hφ : ∀ a, φ (symbol (n + 1) a) = QuotientAddGroup.mk (torusWord (n + 1) a)) :
    φ = milnorHomologyTheta F stabilization MK n := by sorry

-- milnorHomologyTheta_one
example [Infinite F] : Function.Bijective (milnorHomologyTheta F stabilization MK 0) := by sorry
-- milnorHomologyTheta_steinberg
example [Infinite F] (a b : F) (ha : a ≠ 0) (ha1 : a ≠ 1) (hb : b ≠ 0) :
    (QuotientAddGroup.mk (torusWord 3
      ![Units.mk0 a ha, Units.mk0 (1-a) (by sorry), Units.mk0 b hb]) :
        StabilityQuotient F stabilization 2) = 0 := by sorry
-- milnorHomologyTheta_real_sign: T.2's real Milnor symbol has order 2 and survives θ.
example (stabR : ∀ n i, GLH ℝ n i →+ GLH ℝ (n + 1) i)
    (MKR : ℕ → Type) [∀ n, AddCommGroup (MKR n)]
    (symbolR : ∀ n, (Fin n → ℝˣ) → MKR n) :
    let x := milnorHomologyTheta ℝ stabR MKR 2 (symbolR 3 (fun _ => -1))
    x ≠ 0 ∧ (2 : ℤ) • x = 0 := by sorry

-- The descended δ and the finite degree-n edge are actual supplier maps, not dummy predicates.
variable (descendedDelta : ∀ n, StabilityQuotient F stabilization n →+ stabilityCoinvariants F (n + 1))

-- K3BlochGroups:V.4/milnor-frame-retraction
lemma milnor_frame_retraction [Infinite F] (n : ℕ) :
    (stabilityCoinvariants.milnorRetraction F MK (n + 1)).comp
      ((descendedDelta n).comp (milnorHomologyTheta F stabilization MK n)) =
      AddMonoidHom.id (MK (n + 1)) := by sorry

-- K3BlochGroups:V.4/frame-algebra-splitting
-- The embedded Milnor summand is δ ∘ θ, already present in this file.
lemma frame_algebra_splitting [Infinite F] :
    (∃ e : stabilityCoinvariants F 2 ≃+ (MK 2 × ℤ),
      ∀ a : Fin 2 → Fˣ, e (stabilityCoinvariants.gen F a) = (symbol 2 a, 1)) ∧
    (∀ n, ∀ x : stabilityCoinvariants F (n + 2),
      ∃ a : MK (n + 2), ∃ y : stabilityCoinvariants F n,
        x = descendedDelta (n + 1) (milnorHomologyTheta F stabilization MK (n + 1) a) +
          stabilityCoinvariants.eMul F n y) ∧
    (∀ n (a : MK (n + 2)) (y : stabilityCoinvariants F n),
      descendedDelta (n + 1) (milnorHomologyTheta F stabilization MK (n + 1) a) =
        stabilityCoinvariants.eMul F n y →
      a = 0) := by sorry

-- The positive-degree products generate in every degree at least three.
lemma frame_decomposable [Infinite F] (n : ℕ) (x : stabilityCoinvariants F (n + 3)) :
    ∃ (k : ℕ) (i : Fin k → Fin (n + 2))
      (a : ∀ j, stabilityCoinvariants F ((i j).val + 1))
      (b : ∀ j, stabilityCoinvariants F (n + 2 - (i j).val)),
      x = ∑ j : Fin k, (by
        have hdeg : (i j).val + 1 + (n + 2 - (i j).val) = n + 3 := by omega
        exact hdeg ▸ (stabilityCoinvariants.mul F ((i j).val + 1)
          (n + 2 - (i j).val) (TensorProduct.tmul ℤ (a j) (b j)))) := by sorry

-- This clause is proved by the simultaneous spectral-sequence induction, not by splitting.
lemma frame_e_injective [Infinite F] (n : ℕ) :
    Function.Injective (stabilityCoinvariants.eMul F n) := by sorry

-- K3BlochGroups:V.4/degree-three-torus-quotient
lemma degree_three_torus_quotient [Infinite F] :
    Function.Bijective (milnorHomologyTheta F stabilization MK 2) ∧
      ∀ x : GLH F 3 3, ∃ y : GLH F 2 3, ∃ z : FreeAbelianGroup (Fin 3 → Fˣ),
        x = stabilization 2 3 y + FreeAbelianGroup.lift (torusWord 3) z := by sorry

end MilnorComparison

-- K3BlochGroups:V.4/frame-spectral-sequence-collapse
-- E is the frame hyperhomology spectral sequence supplied by H.1 Part II, starting at1.
-- The E¹ identification, finite convergence/edge and e-injectivity await that interface.
lemma frame_spectral_sequence_collapse [Infinite F]
    (c : ℤ → ComplexShape (ℕ × ℕ))
    (E : SpectralSequence (ModuleCat ℤ) c 1) (r : ℤ) (hr : 2 ≤ r) (pq pq' : ℕ × ℕ) :
    (E.page r (by omega)).d pq pq' = 0 := by sorry

lemma homological_stability [Infinite F] (n i : ℕ) (hi : i ≤ n) :
    Function.Bijective (stabilization n i) := by sorry

-- K3BlochGroups:V.4/scalar-homology-vanishing
-- The inner additive homology with its functorially induced scalar action is a supplied Rep.
-- The prime-field condition is expressible at baseline. Identifying the induced Rep
-- with H_j(V_add,k) still awaits H.1 Part II, and only that condition is omitted.
lemma scalar_homology_vanishing [Infinite F] (k : Type) [Field k]
    (hprime : Subfield.closure (∅ : Set k) = ⊤)
    (V : Type) [AddCommGroup V] [Module F V] (j i : ℕ) (hj : 0 < j)
    (scalarCoefficientHomology : Rep k Fˣ) :
    IsZero (groupHomology scalarCoefficientHomology i) := by sorry

-- K3BlochGroups:V.4/affine-block-homology
-- Block-group and scalar-containment syntax belong to the supplier's semidirect/LHS API.
lemma affine_block_homology [Infinite F] (G P : Type) [Group G] [Group P]
    (blockInclusion : G →* P)
    (coeff : Rep.trivial ℤ G ℤ ⟶ Rep.res blockInclusion (Rep.trivial ℤ P ℤ)) (i : ℕ) :
    IsIso (groupHomology.map blockInclusion coeff i) := by sorry

-- K3BlochGroups:V.4/cross-ratio-coefficient-change
-- Parent cross-ratios are parameters, so no second definition of cross-ratio appears.
lemma cross_ratio_coefficient_change {E : Type} [Field E] (f : F →+* E)
    (crF : (Fin 4 → OnePoint F) → F) (crE : (Fin 4 → OnePoint E) → E)
    (t : Fin 4 → OnePoint F) (ht : Function.Injective t) :
    crE (fun i => OnePoint.map f (t i)) = f (crF t) := by sorry

section TorsionDetection
-- K is the closure's Quillen K₃. κ is the torsion lift of the parent δ after scalar extension.
-- Twist is the early Chern supplier's second Tate twist, with its weight-two Galois action.
-- Neither the Tate twist nor the e-invariant is redefined here.
variable {Mu K Twist Gamma : Type} [CommGroup Mu] [AddCommGroup K]
  [AddCommGroup Twist] [Group Gamma]
abbrev RootH3 := groupHomology (Rep.trivial ℤ Mu ℤ) 3
variable (κ : RootH3 (Mu := Mu) →+ AddCommGroup.torsion K)
variable (e : AddCommGroup.torsion K →+ Twist) (action : Representation ℤ Gamma Twist)

-- K3BlochGroups:V.4/closure-torsion-detector
def closureTorsionDetector (κ : RootH3 (Mu := Mu) →+ AddCommGroup.torsion K)
    (e : AddCommGroup.torsion K →+ Twist) : RootH3 (Mu := Mu) →+ Twist := by sorry

lemma closureTorsionDetector_formula (x : RootH3 (Mu := Mu)) :
    closureTorsionDetector κ e x = e (κ x) := by sorry

lemma closureTorsionDetector_fixed (hfixed : ∀ g x, action g (e (κ x)) = e (κ x))
    (g : Gamma) (x : RootH3 (Mu := Mu)) :
    action g (closureTorsionDetector κ e x) = closureTorsionDetector κ e x := by sorry

lemma closureTorsionDetector_field {Mu' K' Twist' : Type} [CommGroup Mu']
    [AddCommGroup K'] [AddCommGroup Twist']
    (κ' : RootH3 (Mu := Mu') →+ AddCommGroup.torsion K')
    (e' : AddCommGroup.torsion K' →+ Twist')
    (homologyField : RootH3 (Mu := Mu) →+ RootH3 (Mu := Mu'))
    (twistField : Twist →+ Twist')
    (hcompat : (e'.comp κ').comp homologyField = twistField.comp (e.comp κ)) :
    (closureTorsionDetector κ' e').comp homologyField =
      twistField.comp (closureTorsionDetector κ e) := by sorry

-- The Chern/Bockstein square supplies this specific isomorphism and equality over Ω.
-- This is diagram data, not an invented Prop-valued model of e or the Tate twist.
variable (cyclicDetection : RootH3 (Mu := Mu) ≃+ Twist)
variable (hSquare : e.comp κ = cyclicDetection.toAddMonoidHom)

-- closureTorsionDetector_alg_closed
include hSquare in
example : Function.Bijective (closureTorsionDetector κ e) := by sorry
-- closureTorsionDetector_two: use a nonzero H₃(C₂) class and its root-group injection.
include hSquare in
example (ι : groupHomology (Rep.trivial ℤ (Multiplicative (ZMod 2)) ℤ) 3 →+
    RootH3 (Mu := Mu)) (hι : Function.Injective ι)
    (x : groupHomology (Rep.trivial ℤ (Multiplicative (ZMod 2)) ℤ) 3) (hx : x ≠ 0) :
    closureTorsionDetector κ e (ι x) ≠ 0 := by sorry
-- Routine coefficient morphism: the underlying linear map is the identity.
def rootTrivialCoeff {G H : Type} [Group G] [Group H] (f : G →* H) :
    Rep.trivial ℤ G ℤ ⟶ Rep.res f (Rep.trivial ℤ H ℤ) :=
  Rep.ofHom { toLinearMap := LinearMap.id, isIntertwining' := by sorry }

def cyclicPowerTwo : Multiplicative (ZMod 7) →* Multiplicative (ZMod 7) where
  toFun x := x ^ 2
  map_one' := by sorry
  map_mul' := by sorry

-- closureTorsionDetector_weight_two: the actual power2 map, without assuming its answer.
example (κ7 : RootH3 (Mu := Multiplicative (ZMod 7)) →+ AddCommGroup.torsion K)
    (x : RootH3 (Mu := Multiplicative (ZMod 7))) :
    closureTorsionDetector κ7 e
      ((groupHomology.map cyclicPowerTwo (rootTrivialCoeff cyclicPowerTwo) 3).hom x) =
      (4 : ℤ) • closureTorsionDetector κ7 e x := by sorry

-- closureTorsionDetector_tensor_zero: divisibility kills the ordinary tensor target.
example [DivisibleBy (Additive Mu) ℤ]
    (hTorsion : ∀ x : Additive Mu, ∃ n : ℕ, 0 < n ∧ n • x = 0) :
    ∀ x : Additive Mu ⊗[ℤ] Additive Mu, x = 0 := by sorry

-- K3BlochGroups:V.4/closure-detector-injectivity, closure case after the supplied square.
include hSquare in
lemma closure_detector_injectivity {A B : Type} [AddCommGroup A] [AddCommGroup B]
    (detectorF : A →+ B) (toClosure : A →+ RootH3 (Mu := Mu))
    (targetInclusion : B →+ Twist) (hRoots : Function.Injective toClosure)
    (hNaturality : targetInclusion.comp detectorF = (closureTorsionDetector κ e).comp toClosure) :
    Function.Injective detectorF := by sorry

-- K3BlochGroups:V.4/cyclic-chern-evaluation
-- A is H₄(µ_m,Z/m); B is µ_m⊗_{Z/m}µ_m, supplied finite-level coefficient objects.
-- lam and ρ are the tautological character and lam⊕lam⁻¹. The supplier identifies these maps.
lemma cyclic_chern_evaluation {A B : Type} [AddCommGroup A] [AddCommGroup B]
    (c2rho : A →+ B) (cupSquare : A →+ B)
    (hWhitney : c2rho = -cupSquare) (hPeriodicity : Function.Bijective cupSquare) :
    c2rho = -cupSquare ∧ Function.Bijective c2rho := by sorry

-- K3BlochGroups:V.4/chern-bockstein-square
-- H4Roots and H4SL are finite-coefficient homology. Hurewicz goes FROM K₄coeff TO H₄SL.
-- The supplier identifies rootsToSL with the monomial/SL composite, c2K with the
-- normalized étale Chern class, and kBockstein with the K-theory Bockstein.
-- Its universal construction and Bott conditions await the early Chern/H.6 syntax.
-- KV11.3.2 supplies the product rule for odd m or 8|m; m=8 covers order-two torsion.
lemma chern_bockstein_square {H4Roots H4SL K4coeff : Type}
    [AddCommGroup H4Roots] [AddCommGroup H4SL] [AddCommGroup K4coeff]
    (rootsToSL : H4Roots →+ H4SL) (hurewicz : K4coeff →+ H4SL)
    (c2Homology : H4SL →+ Twist) (c2K : K4coeff →+ Twist)
    (kBockstein : K4coeff →+ AddCommGroup.torsion K)
    (homologyBockstein : H4Roots →+ RootH3 (Mu := Mu))
    (m : ℕ) (hm : 2 ≤ m) (hproduct : Odd m ∨ 8 ∣ m) :
    (e.comp κ).comp homologyBockstein = -(c2Homology.comp rootsToSL) ∧
      c2K = c2Homology.comp hurewicz ∧
      e.comp kBockstein = -c2K := by sorry

end TorsionDetection
end TauCeti.SuslinV4
