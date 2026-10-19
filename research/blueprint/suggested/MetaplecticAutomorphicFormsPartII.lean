import Mathlib.NumberTheory.LegendreSymbol.AddCharacter
import Mathlib.LinearAlgebra.BilinearForm.Orthogonal
import Mathlib.LinearAlgebra.Determinant
import Mathlib.RepresentationTheory.FinGroupCharZero
import TauCeti.RepresentationTheory.LinearCharacter
import TauCeti.RepresentationTheory.ProjectiveRepresentation.Basic

/-!
# Finite Weil–Heisenberg representations: suggested statements

This is not the roadmap and is not exhaustive. The accompanying README is the
complete specification of the definitions, hypotheses, APIs, tests and sources.
The declarations here suggest names and signatures; they claim no implementation.
Only a light coordinate formula and end statements over carriers present at the
pinned libraries are included. The algebraic Heisenberg carrier supplied by the
parent roadmap, its Schrödinger FDRep, finite symplectic coordinates, mixed models,
normalized Weil representation and special-coordinate transport stay as README
targets. No data-valued definition is left unconstructed.

Conventions: B((x,y),(x',y')) = y'(x)-y(x'); the center is written first.
The half-form product is (t,v)(s,w)=(t+s+B(v,w)/2,v+w).
The matrix J in the README is [0,I;-I,0], the negative of Mathlib Matrix.J.
-/

noncomputable section

open CategoryTheory
open scoped BigOperators

namespace TauCeti.FiniteWeil

/-- A coordinate expression over an existing finite function carrier, not a
second representation carrier. README target FW.1/schrodinger supplies its FDRep. -/
def schrodingerValue {k : Type*} [Field k] {n : ℕ} (ψ : AddChar k ℂ)
    (t : k) (x y : Fin n → k) (f : (Fin n → k) → ℂ) (z : Fin n → k) : ℂ :=
  ψ (t + (∑ i, y i * z i) + (∑ i, y i * x i) / 2) * f (z + x)

/-- Identity evaluation: a spurious central sign or constant phase fails this. -/
example {k : Type*} [Field k] {n : ℕ} (ψ : AddChar k ℂ)
    (f : (Fin n → k) → ℂ) (z : Fin n → k) :
    schrodingerValue ψ 0 0 0 f z = f z := by
  sorry

/-- Zero symplectic dimension leaves the central character on a line. -/
example {k : Type*} [Field k] (ψ : AddChar k ℂ) (t : k)
    (f : (Fin 0 → k) → ℂ) (z : Fin 0 → k) :
    schrodingerValue ψ t 0 0 f z = ψ t * f z := by
  sorry

/-- In the F3 plane a positive translation sends delta at 1 to delta at 0.
This distinguishes f(z+x) from f(z-x). -/
example (ψ : AddChar (ZMod 3) ℂ) (z : Fin 1 → ZMod 3) :
    schrodingerValue ψ 0 (fun _ => 1) 0
      (fun w => if w 0 = 1 then 1 else 0) z =
      if z 0 = 0 then 1 else 0 := by
  sorry

/-- Target FW.0/adapted-polarization: its numerical endpoint is statable at the
pins without creating the witness data or a new symplectic-form structure. -/
theorem finiteSymplectic_evenDimension {k V : Type*} [Field k] [Finite k]
    [AddCommGroup V] [Module k V] [FiniteDimensional k V]
    (B : LinearMap.BilinForm k V) (hB : B.IsAlt) (hnd : B.Nondegenerate)
    (hodd : (2 : k) ≠ 0) :
    ∃ n : ℕ, Module.finrank k V = 2 * n := by
  sorry

/-- FW.1/cyclic-center. The theta-scalar condition is written over native
FDRep rather than inventing an isotypic-representation carrier. The conclusion
uses only finite-group representation infrastructure already present at the pin.
The hypotheses do not force the center to have order p or the group exponent p. -/
theorem cyclicCenter_stoneVonNeumann {G : Type} [Group G] [Fintype G]
    (H : Subgroup G) [H.Normal] (θ : H →* ℂˣ)
    (hcomm : ∀ g x : G, g * x * g⁻¹ * x⁻¹ ∈ H)
    (hinvariant : ∀ (g : G) (h h' : H),
      (h' : G) = g * (h : G) * g⁻¹ → θ h' = θ h)
    (hnondegenerate : ∀ g : G, g ∉ H →
      ∃ x : G, θ ⟨g * x * g⁻¹ * x⁻¹, hcomm g x⟩ ≠ 1) :
    ∃ A : FDRep ℂ G,
      Simple A ∧
      (∀ (h : H) (v : A), A.ρ (h : G) v = (θ h : ℂ) • v) ∧
      Module.finrank ℂ A ^ 2 = H.index ∧
      ∀ (D : FDRep ℂ G), Simple D →
        (∀ (h : H) (v : D), D.ρ (h : G) v = (θ h : ℂ) • v) →
        Nonempty (A ≅ D) := by
  sorry

/-- FW.2/parity-linearization, stated over native linear equivalences.
For a Schrödinger space take E to be the even subspace and nu to be restriction.
The dimension equation is exactly dim(V)-2 dim(E)=-1, expressed in naturals.
The theorem cancels the multiplier directly and needs no perfectness hypothesis. -/
theorem parityLinearization {G V : Type*} [Group G]
    [AddCommGroup V] [Module ℂ V] [FiniteDimensional ℂ V]
    (E : Submodule ℂ V) (μ : G → V ≃ₗ[ℂ] V)
    (ν : G → E ≃ₗ[ℂ] E) (c : G → G → ℂˣ)
    (hprojective : TauCeti.IsProjectiveRep μ c)
    (hrestrict : ∀ (g : G) (v : E), (ν g v : V) = μ g (v : V))
    (hdimension : 2 * Module.finrank ℂ E = Module.finrank ℂ V + 1) :
    ∃ ω : G →* (V ≃ₗ[ℂ] V), ∀ (g : G) (v : V),
      ω g v =
        ((LinearEquiv.det (μ g) / (LinearEquiv.det (ν g)) ^ 2 : ℂˣ) : ℂ) • μ g v := by
  sorry

/-- Endpoint check for the scalar correction on a one-dimensional even space. -/
example (a : ℂˣ) : a / a ^ 2 * a = 1 := by
  sorry

end TauCeti.FiniteWeil
