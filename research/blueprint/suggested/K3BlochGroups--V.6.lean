import Mathlib.Algebra.Group.Subgroup.Ker
import Mathlib.Algebra.Module.LinearMap.Defs
import Mathlib.LinearAlgebra.TensorProduct.Map
import Mathlib.Data.ZMod.Basic
import Mathlib.RingTheory.RootsOfUnity.PrimitiveRoots
import Mathlib.RepresentationTheory.Homological.GroupHomology.Basic

/-!
This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/K3BlochGroups--V.6.md` is definitive. These statements
suggest Lean forms so that contributors and reviewers converge on names and
signatures. Proof placeholders make no implementation claim.

The parent packet owns P(F), its antisymmetric boundary, B(F), the stable
Steinberg group and the Suslin map. They are not redeclared here. The root
interfaces are prototyped for an actual Mathlib kernel; substitute P(F), its
boundary and x=[ζ] to obtain the field interfaces. The witness interfaces use
actual subtypes and actual Mathlib group homology. Small models test the
integral and nonflat phenomena without inventing the unavailable field types.
-/

noncomputable section
open scoped TensorProduct

namespace TauCeti.Blueprint.K3BlochV6

section Roots
variable {P W P' W' : Type*}
variable [AddCommGroup P] [AddCommGroup W] [AddCommGroup P'] [AddCommGroup W']

/-- V.6/integral-root-multiple. For fields h is supplied by
V.6/root-of-unity-symbol, using IsPrimitiveRoot ζ m, m≥2 and x=[ζ]. -/
def rootMultiple (δ : P →+ W) (x : P) (m : ℕ) (h : δ (m • x) = 0) : δ.ker :=
  ⟨m • x, h⟩

lemma rootMultiple_coe (δ : P →+ W) (x : P) (m : ℕ) (h : δ (m • x) = 0) :
    (rootMultiple δ x m h : P) = m • x := by
  sorry

lemma rootMultiple_proof_irrel (δ : P →+ W) (x : P) (m : ℕ)
    (h h' : δ (m • x) = 0) : rootMultiple δ x m h = rootMultiple δ x m h' := by
  sorry

lemma rootMultiple_zero (δ : P →+ W) (x : P) (m : ℕ)
    (h : δ (m • (0 : P)) = 0) (h' : δ (0 • x) = 0) :
    rootMultiple δ 0 m h = 0 ∧ rootMultiple δ x 0 h' = 0 := by
  sorry

lemma rootMultiple_of_mem (δ : P →+ W) (b : δ.ker) (m : ℕ)
    (h : δ (m • (b : P)) = 0) : rootMultiple δ b m h = m • b := by
  sorry

lemma rootMultiple_mul (δ : P →+ W) (x : P) (m k : ℕ)
    (h : δ (m • x) = 0) (h' : δ ((m * k) • x) = 0) :
    rootMultiple δ x (m * k) h' = k • rootMultiple δ x m h := by
  sorry

lemma rootMultiple_map (δ : P →+ W) (δ' : P' →+ W') (f : P →+ P')
    (fB : δ.ker →+ δ'.ker) (hfB : ∀ b, (fB b : P') = f (b : P))
    (x : P) (m : ℕ) (h : δ (m • x) = 0) (h' : δ' (m • f x) = 0) :
    fB (rootMultiple δ x m h) = rootMultiple δ' (f x) m h' := by
  sorry

-- rootMultiple_mod_two
example (h : (Int.castAddHom (ZMod 2)) (2 • (1 : ℤ)) = 0) :
    (rootMultiple (Int.castAddHom (ZMod 2)) 1 2 h : ℤ) = 2 := by
  sorry

-- rootMultiple_zero_multiplier
example (δ : P →+ W) (x : P) (h : δ (0 • x) = 0) :
    rootMultiple δ x 0 h = 0 := by
  sorry

-- rootMultiple_kernel_compat
example (δ : P →+ W) (b : δ.ker) (h : δ (3 • (b : P)) = 0) :
    rootMultiple δ b 3 h = 3 • b := by
  sorry

-- rootMultiple_raw_rejected
example : (1 : ℤ) ∉ (Int.castAddHom (ZMod 2)).ker ∧
    (2 : ℤ) ∈ (Int.castAddHom (ZMod 2)).ker := by
  sorry

variable {R S : Type*} [CommRing R] [CommRing S]

/-- V.6/root-coefficient-class. hu is retained to forbid division by a
noninvertible root order. No flatness is assumed. -/
def rootCoefficient (δ : P →+ W) (x : P) (m : ℕ) (h : δ (m • x) = 0)
    (u : Rˣ) (_hu : (u : R) = (m : R)) : δ.ker ⊗[ℤ] R :=
  rootMultiple δ x m h ⊗ₜ[ℤ] ((u⁻¹ : Rˣ) : R)

lemma rootCoefficient_toPre (δ : P →+ W) (x : P) (m : ℕ) (h : δ (m • x) = 0)
    (u : Rˣ) (hu : (u : R) = (m : R)) :
    TensorProduct.map δ.ker.subtype.toIntLinearMap (LinearMap.id : R →ₗ[ℤ] R)
      (rootCoefficient δ x m h u hu) = x ⊗ₜ[ℤ] (1 : R) := by
  sorry

lemma rootCoefficient_zero (δ : P →+ W) (m : ℕ) (h : δ (m • (0 : P)) = 0)
    (u : Rˣ) (hu : (u : R) = (m : R)) : rootCoefficient δ 0 m h u hu = 0 := by
  sorry

lemma rootCoefficient_of_mem (δ : P →+ W) (b : δ.ker) (m : ℕ)
    (h : δ (m • (b : P)) = 0) (u : Rˣ) (hu : (u : R) = (m : R)) :
    rootCoefficient δ b m h u hu = b ⊗ₜ[ℤ] (1 : R) := by
  sorry

lemma rootCoefficient_denominator_independent (δ : P →+ W) (x : P) (m l : ℕ)
    (h : δ (m • x) = 0) (h' : δ (l • x) = 0)
    (u v : Rˣ) (hu : (u : R) = (m : R)) (hv : (v : R) = (l : R)) :
    rootCoefficient δ x m h u hu = rootCoefficient δ x l h' v hv := by
  sorry

lemma rootCoefficient_changeRing (δ : P →+ W) (x : P) (m : ℕ)
    (h : δ (m • x) = 0) (u : Rˣ) (hu : (u : R) = (m : R)) (ρ : R →+* S)
    (hρ : ((Units.map ρ.toMonoidHom u : Sˣ) : S) = (m : S)) :
    TensorProduct.map (LinearMap.id : δ.ker →ₗ[ℤ] δ.ker)
      ρ.toAddMonoidHom.toIntLinearMap (rootCoefficient δ x m h u hu) =
        rootCoefficient δ x m h (Units.map ρ.toMonoidHom u) hρ := by
  sorry

lemma rootCoefficient_map (δ : P →+ W) (δ' : P' →+ W') (f : P →+ P')
    (fB : δ.ker →+ δ'.ker) (hfB : ∀ b, (fB b : P') = f (b : P))
    (x : P) (m : ℕ) (h : δ (m • x) = 0) (h' : δ' (m • f x) = 0)
    (u : Rˣ) (hu : (u : R) = (m : R)) :
    TensorProduct.map fB.toIntLinearMap (LinearMap.id : R →ₗ[ℤ] R)
      (rootCoefficient δ x m h u hu) = rootCoefficient δ' (f x) m h' u hu := by
  sorry

/- rootCoefficient_specializations
The unavailable P(F)/B(F) types and the parent-owned constructors prevent a
literal statement here. Substitute x=[ζ] and the actual boundary δ, and compare:
  • R=ZMod n and the unit m from gcd(m,n)=1, through B⊗ZMod n≃B/n:
    rootCoefficient = the parent's rootClassMod;
  • R=ℤ[1/m] and its unit m: rootCoefficient = rootClassLoc;
  • R=ℤ_p with p∤m: rootCoefficient = rootClassPadic.
These are equalities of the actual supplier objects, not new definitions or
Prop-valued placeholders. The common tensor expression is tested below.
-/

-- rootCoefficient_mod_five
example (h : (Int.castAddHom (ZMod 2)) (2 • (1 : ℤ)) = 0)
    (u : (ZMod 5)ˣ) (hu : (u : ZMod 5) = 2) :
    rootCoefficient (Int.castAddHom (ZMod 2)) 1 2 h u hu =
      rootMultiple (Int.castAddHom (ZMod 2)) 1 2 h ⊗ₜ[ℤ] (3 : ZMod 5) ∧
    TensorProduct.map (Int.castAddHom (ZMod 2)).ker.subtype.toIntLinearMap
      (LinearMap.id : ZMod 5 →ₗ[ℤ] ZMod 5)
      (rootCoefficient (Int.castAddHom (ZMod 2)) 1 2 h u hu) =
        (1 : ℤ) ⊗ₜ[ℤ] (1 : ZMod 5) := by
  sorry

-- rootCoefficient_zero_test
example (δ : P →+ W) (m : ℕ) (h : δ (m • (0 : P)) = 0)
    (u : Rˣ) (hu : (u : R) = (m : R)) : rootCoefficient δ 0 m h u hu = 0 := by
  sorry

-- rootCoefficient_two_denominators
example (h : (Int.castAddHom (ZMod 2)) (2 • (1 : ℤ)) = 0)
    (h' : (Int.castAddHom (ZMod 2)) (4 • (1 : ℤ)) = 0)
    (u v : (ZMod 5)ˣ) (hu : (u : ZMod 5) = 2) (hv : (v : ZMod 5) = 4) :
    rootCoefficient (Int.castAddHom (ZMod 2)) 1 2 h u hu =
      rootCoefficient (Int.castAddHom (ZMod 2)) 1 4 h' v hv := by
  sorry

-- rootCoefficient_nonflat
example : (∃ t : (Int.castAddHom (ZMod 2)).ker ⊗[ℤ] ZMod 2,
    t ≠ 0 ∧ TensorProduct.map (Int.castAddHom (ZMod 2)).ker.subtype.toIntLinearMap
      (LinearMap.id : ZMod 2 →ₗ[ℤ] ZMod 2) t = 0) ∧
    ¬ IsUnit (2 : ZMod 2) := by
  sorry
end Roots

section Lifts
variable {K B T K' B' K'' B'' : Type*}
variable [AddCommGroup K] [AddCommGroup B] [AddCommGroup T]
variable [AddCommGroup K'] [AddCommGroup B'] [AddCommGroup K''] [AddCommGroup B'']

/-- V.6/suslin-lift-fibre. Substitute the supplier's actual K₃^ind and q.
This is an actual fibre subtype, without a chosen group structure or origin. -/
abbrev SuslinLift (q : K →+ B) (β : B) := {k : K // q k = β}

namespace SuslinLift
def ofRep (q : K →+ B) (β : B) (k : K) (h : q k = β) : SuslinLift q β := ⟨k, h⟩

lemma over (q : K →+ B) (β : B) (a : SuslinLift q β) : q a.val = β := by
  sorry

lemma ext (q : K →+ B) (β : B) (a b : SuslinLift q β) :
    a = b ↔ a.val = b.val := by
  sorry

def choose (q : K →+ B) (hq : Function.Surjective q) (β : B) : SuslinLift q β := by
  sorry

def translate (q : K →+ B) (i : T →+ K) (hi : ∀ t, q (i t) = 0)
    (β : B) (a : SuslinLift q β) (t : T) : SuslinLift q β :=
  ⟨a.val + i t, by sorry⟩

lemma translate_zero_add (q : K →+ B) (i : T →+ K) (hi : ∀ t, q (i t) = 0)
    (β : B) (a : SuslinLift q β) (s t : T) :
    translate q i hi β a 0 = a ∧
    translate q i hi β (translate q i hi β a t) s = translate q i hi β a (s + t) := by
  sorry

lemma unique_difference (q : K →+ B) (i : T →+ K) (hi : Function.Injective i)
    (he : ∀ k, q k = 0 ↔ ∃ t, i t = k) (β : B) (a b : SuslinLift q β) :
    ∃! t : T, b.val = a.val + i t := by
  sorry

def map (q : K →+ B) (q' : K' →+ B') (f : K →+ K') (g : B →+ B')
    (h : ∀ k, q' (f k) = g (q k)) (β : B) (a : SuslinLift q β) :
    SuslinLift q' (g β) := ⟨f a.val, by sorry⟩

lemma map_id_comp (q : K →+ B) (q' : K' →+ B') (q'' : K'' →+ B'')
    (f : K →+ K') (g : B →+ B') (f' : K' →+ K'') (g' : B' →+ B'')
    (h : ∀ k, q' (f k) = g (q k)) (h' : ∀ k, q'' (f' k) = g' (q' k))
    (hc : ∀ k, q'' ((f'.comp f) k) = (g'.comp g) (q k))
    (β : B) (a : SuslinLift q β) :
    map q q (AddMonoidHom.id K) (AddMonoidHom.id B) (fun _ => rfl) β a = a ∧
    map q' q'' f' g' h' (g β) (map q q' f g h β a) =
      map q q'' (f'.comp f) (g'.comp g) hc β a := by
  sorry
end SuslinLift

-- SuslinLift_zero_test
example (q : K →+ B) : (SuslinLift.ofRep q 0 0 (by sorry)).val = 0 := by
  sorry

-- SuslinLift_Q_fibre
example : Fintype.card
    (SuslinLift (ZMod.castHom (show 6 ∣ 24 by decide) (ZMod 6)).toAddMonoidHom 1) = 4 ∧
    (∀ k : ZMod 24,
      (ZMod.castHom (show 6 ∣ 24 by decide) (ZMod 6)) k = 1 ↔
        k = 1 ∨ k = 7 ∨ k = 13 ∨ k = 19) := by
  sorry

-- SuslinLift_kernel_compat
example (q : K →+ B) (k : K) :
    q k = 0 ↔ k ∈ q.ker := by
  sorry

-- SuslinLift_Q_nonsplit
example : ¬ ∃ s : ZMod 6 →+ ZMod 24,
    (ZMod.castHom (show 6 ∣ 24 by decide) (ZMod 6)).toAddMonoidHom.comp s =
      AddMonoidHom.id (ZMod 6) := by
  sorry
end Lifts

section BarLifts
variable {G G' G'' : Type} [Group G] [Group G'] [Group G'']
variable {B B' B'' : Type} [AddCommGroup B] [AddCommGroup B'] [AddCommGroup B'']

-- Abbreviations for baseline objects; these introduce no replacement homology theory.
private abbrev barRep (G : Type) [Group G] := Rep.trivial ℤ G ℤ

/-- V.6/bar-lift-witness. For the field interface G is the supplier's St(F)
and ψ is H₃(St(F))≃K₃(F)→K₃^ind(F)→B(F). -/
abbrev BarLiftCertificate (ψ : groupHomology (barRep G) 3 →ₗ[ℤ] B) (β : B) :=
  {z : groupHomology.cycles (barRep G) 3 // ψ (groupHomology.π (barRep G) 3 z) = β}

namespace BarLiftCertificate
def chain (ψ : groupHomology (barRep G) 3 →ₗ[ℤ] B) (β : B)
    (c : BarLiftCertificate ψ β) : (Fin 3 → G) →₀ ℤ :=
  groupHomology.iCycles (barRep G) 3 c.val

lemma cycle_eq (ψ : groupHomology (barRep G) 3 →ₗ[ℤ] B) (β : B)
    (c : BarLiftCertificate ψ β) :
    groupHomology.inhomogeneousChains.d (barRep G) 2 (chain ψ β c) = 0 := by
  sorry

def homology (ψ : groupHomology (barRep G) 3 →ₗ[ℤ] B) (β : B)
    (c : BarLiftCertificate ψ β) : groupHomology (barRep G) 3 :=
  groupHomology.π (barRep G) 3 c.val

lemma over (ψ : groupHomology (barRep G) 3 →ₗ[ℤ] B) (β : B)
    (c : BarLiftCertificate ψ β) : ψ (homology ψ β c) = β := by
  sorry

def ofCycle (ψ : groupHomology (barRep G) 3 →ₗ[ℤ] B) (β : B)
    (z : groupHomology.cycles (barRep G) 3)
    (h : ψ (groupHomology.π (barRep G) 3 z) = β) : BarLiftCertificate ψ β := ⟨z, h⟩

lemma ext (ψ : groupHomology (barRep G) 3 →ₗ[ℤ] B) (β : B)
    (c d : BarLiftCertificate ψ β) :
    (c = d ↔ c.val = d.val) ∧ (c = d ↔ chain ψ β c = chain ψ β d) := by
  sorry

def addBoundary (ψ : groupHomology (barRep G) 3 →ₗ[ℤ] B) (β : B)
    (c : BarLiftCertificate ψ β) (w : (Fin 4 → G) →₀ ℤ) : BarLiftCertificate ψ β :=
  ⟨c.val + groupHomology.toCycles (barRep G) 4 3 w, by sorry⟩

lemma addBoundary_spec (ψ : groupHomology (barRep G) 3 →ₗ[ℤ] B) (β : B)
    (c : BarLiftCertificate ψ β) (w : (Fin 4 → G) →₀ ℤ) :
    (addBoundary ψ β c w).val = c.val + groupHomology.toCycles (barRep G) 4 3 w ∧
    homology ψ β (addBoundary ψ β c w) = homology ψ β c := by
  sorry

def choose (ψ : groupHomology (barRep G) 3 →ₗ[ℤ] B)
    (hψ : Function.Surjective ψ) (β : B) : BarLiftCertificate ψ β := by
  sorry

def map (ψ : groupHomology (barRep G) 3 →ₗ[ℤ] B)
    (ψ' : groupHomology (barRep G') 3 →ₗ[ℤ] B')
    (f : groupHomology.cycles (barRep G) 3 →ₗ[ℤ] groupHomology.cycles (barRep G') 3)
    (g : B →+ B')
    (h : ∀ z, ψ' (groupHomology.π (barRep G') 3 (f z)) =
      g (ψ (groupHomology.π (barRep G) 3 z))) (β : B) (c : BarLiftCertificate ψ β) :
    BarLiftCertificate ψ' (g β) := ⟨f c.val, by sorry⟩

lemma map_id_comp (ψ : groupHomology (barRep G) 3 →ₗ[ℤ] B)
    (ψ' : groupHomology (barRep G') 3 →ₗ[ℤ] B')
    (ψ'' : groupHomology (barRep G'') 3 →ₗ[ℤ] B'')
    (f : groupHomology.cycles (barRep G) 3 →ₗ[ℤ] groupHomology.cycles (barRep G') 3)
    (f' : groupHomology.cycles (barRep G') 3 →ₗ[ℤ] groupHomology.cycles (barRep G'') 3)
    (g : B →+ B') (g' : B' →+ B'')
    (h : ∀ z, ψ' (groupHomology.π (barRep G') 3 (f z)) =
      g (ψ (groupHomology.π (barRep G) 3 z)))
    (h' : ∀ z, ψ'' (groupHomology.π (barRep G'') 3 (f' z)) =
      g' (ψ' (groupHomology.π (barRep G') 3 z)))
    (hc : ∀ z, ψ'' (groupHomology.π (barRep G'') 3 ((f'.comp f) z)) =
      (g'.comp g) (ψ (groupHomology.π (barRep G) 3 z)))
    (β : B) (c : BarLiftCertificate ψ β) :
    map ψ ψ LinearMap.id (AddMonoidHom.id B) (fun _ => rfl) β c = c ∧
    map ψ' ψ'' f' g' h' (g β) (map ψ ψ' f g h β c) =
      map ψ ψ'' (f'.comp f) (g'.comp g) hc β c := by
  sorry
end BarLiftCertificate

-- BarLiftCertificate_zero_test
example (ψ : groupHomology (barRep G) 3 →ₗ[ℤ] B)
    (h : ψ (groupHomology.π (barRep G) 3 0) = 0) :
    BarLiftCertificate.chain ψ 0 (BarLiftCertificate.ofCycle ψ 0 0 h) = 0 ∧
    BarLiftCertificate.homology ψ 0 (BarLiftCertificate.ofCycle ψ 0 0 h) = 0 := by
  sorry

-- BarLiftCertificate_boundary_test
example (ψ : groupHomology (barRep G) 3 →ₗ[ℤ] B) (β : B)
    (c : BarLiftCertificate ψ β) (w : (Fin 4 → G) →₀ ℤ) :
    BarLiftCertificate.homology ψ β (BarLiftCertificate.addBoundary ψ β c w) =
      BarLiftCertificate.homology ψ β c := by
  sorry

-- BarLiftCertificate_trivial_group
example [Subsingleton G] (ψ : groupHomology (barRep G) 3 →ₗ[ℤ] B)
    (β : B) (hβ : β ≠ 0) : IsEmpty (BarLiftCertificate ψ β) := by
  sorry

-- BarLiftCertificate_one_cube
example [Subsingleton G] (ψ : groupHomology (barRep G) 3 →ₗ[ℤ] B) :
    ∃ c : BarLiftCertificate ψ 0,
      BarLiftCertificate.chain ψ 0 c = Finsupp.single (fun _ : Fin 3 => (1 : G)) 1 ∧
      BarLiftCertificate.chain ψ 0 c ≠ 0 ∧ BarLiftCertificate.homology ψ 0 c = 0 := by
  sorry
end BarLifts

section FiniteCoefficients
variable {K E H : Type*} [AddCommGroup K] [AddCommGroup E] [AddCommGroup H]

/- V.6/finite-coefficient-identification
K=K₃(F;ℤ/n), E=B_CGZ(F;ℤ/n), H=H¹(F,ℤ/n(2)) are unavailable supplier
types. For F a number field, n=p^a with p odd, a≥1 and p∤w₂(F), M.7/M.8
provide the finite Chern equivalence c and HB.2 provides R_ζ=r. This generic
composition is the exact proposed Φ=r⁻¹c; none of those objects is defined as
a bare Type or a Prop here. The original modulo comparison remains separate.
-/
def finiteCoefficientBlochEquiv (c : K ≃+ H) (r : E ≃+ H) : K ≃+ E := c.trans r.symm

lemma finiteCoefficientBlochEquiv_spec (c : K ≃+ H) (r : E ≃+ H) (x : K) (y : E) :
    r (finiteCoefficientBlochEquiv c r x) = c x ∧
    (finiteCoefficientBlochEquiv c r).symm y = c.symm (r y) ∧
    (∀ e : K ≃+ E, (∀ z, r (e z) = c z) → e = finiteCoefficientBlochEquiv c r) := by
  sorry

lemma finiteCoefficientBlochEquiv_def (c : K ≃+ H) (r : E ≃+ H) :
    finiteCoefficientBlochEquiv c r = c.trans r.symm := by
  sorry

lemma finiteCoefficientBlochEquiv_natural
    {K' E' H' : Type*} [AddCommGroup K'] [AddCommGroup E'] [AddCommGroup H']
    (c : K ≃+ H) (r : E ≃+ H) (c' : K' ≃+ H') (r' : E' ≃+ H')
    (f : K →+ K') (g : E →+ E') (h : H →+ H')
    (hc : ∀ x, c' (f x) = h (c x)) (hr : ∀ y, r' (g y) = h (r y)) (x : K) :
    finiteCoefficientBlochEquiv c' r' (f x) = g (finiteCoefficientBlochEquiv c r x) := by
  sorry

-- finiteCoefficientBlochEquiv_mod_five
example (c r : ZMod 5 ≃+ ZMod 5) (hc : ∀ x, c x = (2 : ZMod 5) * x)
    (hr : ∀ x, r x = (3 : ZMod 5) * x) : finiteCoefficientBlochEquiv c r 1 = 4 := by
  sorry

-- finiteCoefficientBlochEquiv_zero
example (c r : ZMod 1 ≃+ ZMod 1) : finiteCoefficientBlochEquiv c r 0 = 0 := by
  sorry

-- finiteCoefficientBlochEquiv_composition
example (c : K ≃+ H) (r : E ≃+ H) :
    finiteCoefficientBlochEquiv c r = c.trans r.symm ∧
    (finiteCoefficientBlochEquiv c r).symm = r.trans c.symm := by
  sorry

-- finiteCoefficientBlochEquiv_middle_not_left
example : ¬ Nonempty (ZMod 1 ≃+ ZMod 5) := by
  sorry

variable {n : ℕ} {L : Type*} [AddCommGroup L] [Module (ZMod n) L]
variable [Module (ZMod n) H]

/-- The modulo restriction in the additional M_F range uses the actual unit
γ from HB.2's comparison and retains its inverse factor. No claim about the
right-hand K₂[n] map is hidden in these hypotheses. -/
lemma finiteCoefficientBlochEquiv_on_quotient
    (c : K ≃+ H) (r : E ≃+ H) (jK : L →+ K) (jB : L →+ E)
    (h₀ : L →ₗ[ZMod n] H) (γ : (ZMod n)ˣ)
    (hc : ∀ x, c (jK x) = h₀ x)
    (hr : ∀ x, r (jB x) = (γ : ZMod n) • h₀ x) (x : L) :
    finiteCoefficientBlochEquiv c r (jK x) = jB (((γ⁻¹ : (ZMod n)ˣ) : ZMod n) • x) := by
  sorry

/- Exact omitted field acceptance statement:
For F=ℚ,n=5, K₃(ℚ)/5=0, but the HB.2 coefficient Bloch class [32] has
δ_B([32])={2,−31} with tame symbol 2 of order 5 at 31. Thus E and K cannot
be substituted by the corresponding ordinary modulo groups. The missing K₂,
symbols and étale Bloch types belong to their supplier nodes.

Open normalization input: identify δ_B ∘ finiteCoefficientBlochEquiv with
the precise scalar multiple of the finite K-theory Bockstein ∂_K using the
M.8/Tate convention. Equality with scalar 1 is not a signature in this file.
-/
end FiniteCoefficients

end TauCeti.Blueprint.K3BlochV6
