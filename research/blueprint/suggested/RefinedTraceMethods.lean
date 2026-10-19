import Mathlib

/-!
# RefinedTraceMethods: representative target signatures

The roadmap is RefinedTraceMethods.md. This file records light definitions and
representative end theorem signatures statable against the pinned Mathlib APIs;
it is not exhaustive. In particular it distinguishes FV = p from VF = p, keeps
positivity in the high-powered indexing condition, and records only the ordinary
underlying coefficient quotient of the graded spectral presentation. The reader
specifies the coherent categories, spectral realizations, filtrations and traces.
-/

noncomputable section

namespace TauCetiRoadmap.RefinedTraceMethods

universe u v

/-! ## Layer RT.2: Cartier operators -/

/-- A classical p-typical Cartier structure. Only FV = p is imposed;
Antieau–Nikolaus, section 3.1, p. 15. -/
structure CartierStructure (p : ℕ) (M : Type u) [AddCommGroup M] where
  frobenius : M →+ M
  verschiebung : M →+ M
  frobenius_verschiebung : frobenius.comp verschiebung = p • AddMonoidHom.id M

/-- On the integers, F = p and V = 1 satisfy the Cartier relation. -/
example (p : ℕ) : ∃ c : CartierStructure p ℤ,
    c.frobenius = p • AddMonoidHom.id ℤ ∧ c.verschiebung = AddMonoidHom.id ℤ := by
  refine ⟨⟨p • AddMonoidHom.id ℤ, AddMonoidHom.id ℤ, ?_⟩, rfl, rfl⟩
  simp

/-- For p > 1, taking both operators to be the identity on ℤ is excluded. -/
example (p : ℕ) (hp : 1 < p) (c : CartierStructure p ℤ)
    (hf : c.frobenius = AddMonoidHom.id ℤ)
    (hv : c.verschiebung = AddMonoidHom.id ℤ) : False := by
  have h := DFunLike.congr_fun c.frobenius_verschiebung (1 : ℤ)
  simp [hf, hv] at h
  omega

/-- A Cartier map commutes with each operator, not merely their composite. -/
def IsCartierMorphism {p : ℕ} {M : Type u} {N : Type v}
    [AddCommGroup M] [AddCommGroup N]
    (c : CartierStructure p M) (d : CartierStructure p N) (f : M →+ N) : Prop :=
  f.comp c.frobenius = d.frobenius.comp f ∧
    f.comp c.verschiebung = d.verschiebung.comp f

example {p : ℕ} {M : Type u} [AddCommGroup M] (c : CartierStructure p M) :
    IsCartierMorphism c c (AddMonoidHom.id M) := by
  constructor <;> ext x <;> rfl

example {p : ℕ} {M : Type u} {N : Type v} [AddCommGroup M] [AddCommGroup N]
    (c : CartierStructure p M) (d : CartierStructure p N) :
    IsCartierMorphism c d 0 := by
  constructor <;> ext x <;> simp

/-- Clearing the two operator defects lifts an additive isogeny inverse.
This is the corrected V-operator argument in AMMN, Proposition 3.1, p. 15. -/
theorem cartier_isogeny_inverse {p : ℕ} {M : Type u} {N : Type v}
    [AddCommGroup M] [AddCommGroup N]
    (c : CartierStructure p M) (d : CartierStructure p N)
    (f : M →+ N) (hf : IsCartierMorphism c d f)
    (g : N →+ M) (n : ℕ) (hn : 0 < n)
    (hgf : g.comp f = n • AddMonoidHom.id M)
    (hfg : f.comp g = n • AddMonoidHom.id N) :
    IsCartierMorphism d c (n • g) ∧
      (n • g).comp f = n ^ 2 • AddMonoidHom.id M ∧
      f.comp (n • g) = n ^ 2 • AddMonoidHom.id N := by
  sorry

/-! ## Layer RT.5: the arithmetic indexing condition -/

/-- High-powered integers in Meyer–Wagner, section 3.1, p. 30.
A present 2-adic exponent must be even and at least four. -/
def HighPowered (m : ℕ) : Prop :=
  0 < m ∧
    (m.factorization 2 = 0 ∨ (4 ≤ m.factorization 2 ∧ Even (m.factorization 2))) ∧
    ∀ p : ℕ, p.Prime → p ≠ 2 → m.factorization p = 0 ∨ 2 ≤ m.factorization p

/-- Fourth powers give a divisibility-cofinal supply of admissible indices. -/
theorem highPowered_fourth_power {d : ℕ} (hd : 0 < d) :
    HighPowered (d ^ 4) ∧ d ∣ d ^ 4 := by
  sorry

example : HighPowered 1 ∧ ¬ HighPowered 32 := by
  constructor
  · simp [HighPowered]
  · rintro ⟨_, h, _⟩
    have hfac : (32 : ℕ).factorization 2 = 5 := by
      change ((2 : ℕ) ^ 5).factorization 2 = 5
      rw [Nat.factorization_pow]
      simp [Nat.prime_two.factorization]
    rw [hfac] at h
    norm_num at h

/-- Factorization alone would incorrectly admit zero. -/
example : ¬ HighPowered 0 := by
  simp [HighPowered]

/-! ## Layer RT.6: the ordinary coefficient presentation -/

/-- The underlying quotient A[u,v]/(uv−ξ). Its homotopical grading and
spectral realization are specified in the reader; BMS2, Proposition 6.2. -/
abbrev TracePresentation (A : Type u) [CommRing A] (ξ : A) :=
  MvPolynomial (Fin 2) A ⧸
    Ideal.span {MvPolynomial.X (0 : Fin 2) * MvPolynomial.X (1 : Fin 2) - MvPolynomial.C ξ}

/-- The quotient map kills the defining relation. -/
example {A : Type u} [CommRing A] (ξ : A) :
    Ideal.Quotient.mk
      (Ideal.span {MvPolynomial.X (0 : Fin 2) * MvPolynomial.X (1 : Fin 2) -
        MvPolynomial.C ξ})
      (MvPolynomial.X (0 : Fin 2) * MvPolynomial.X (1 : Fin 2) -
        MvPolynomial.C ξ) = 0 := by
  apply Ideal.Quotient.eq_zero_iff_mem.mpr
  exact Ideal.subset_span (Set.mem_singleton _)

namespace TracePresentation

variable {A : Type u} [CommRing A]

/-- The canonical coefficient homomorphism. -/
def coeff (ξ : A) : A →+* TracePresentation A ξ :=
  (Ideal.Quotient.mk _).comp MvPolynomial.C

example (ξ : A) : coeff ξ (1 : A) = 1 := by
  exact map_one _

/-- The degree-two generator in the graded presentation. -/
def u (ξ : A) : TracePresentation A ξ :=
  Ideal.Quotient.mk _ (MvPolynomial.X (0 : Fin 2))

/-- The degree-minus-two generator; it is a second variable before quotienting. -/
def v (ξ : A) : TracePresentation A ξ :=
  Ideal.Quotient.mk _ (MvPolynomial.X (1 : Fin 2))

/-- The two generators satisfy the relation in the actual quotient. -/
example (ξ : A) : u ξ * v ξ = coeff ξ ξ := by
  apply sub_eq_zero.mp
  change Ideal.Quotient.mk _
    (MvPolynomial.X (0 : Fin 2) * MvPolynomial.X (1 : Fin 2)) -
    Ideal.Quotient.mk _ (MvPolynomial.C ξ) = 0
  rw [← map_sub]
  apply Ideal.Quotient.eq_zero_iff_mem.mpr
  exact Ideal.subset_span (Set.mem_singleton _)

/-- The universal coefficient presentation, including uniqueness. -/
theorem universal_property {B : Type v} [CommRing B] (ξ : A)
    (f : A →+* B) (a b : B) (h : a * b = f ξ) :
    ∃! g : TracePresentation A ξ →+* B,
      (∀ x, g (coeff ξ x) = f x) ∧ g (u ξ) = a ∧ g (v ξ) = b := by
  sorry

/-- The two maps have distinct generator images and semilinear coefficients.
BMS2, Propositions 6.2–6.3, pp. 245–247 in the published version. -/
theorem can_and_frobenius (ξ : A) (φ : A →+* A) :
    (∃ can : TracePresentation A ξ →+* LaurentPolynomial A,
      (∀ x, can (coeff ξ x) = LaurentPolynomial.C x) ∧
      can (u ξ) = LaurentPolynomial.C ξ * LaurentPolynomial.T 1 ∧
      can (v ξ) = LaurentPolynomial.T (-1)) ∧
    (∃ frobenius : TracePresentation A ξ →+* LaurentPolynomial A,
      (∀ x, frobenius (coeff ξ x) = LaurentPolynomial.C (φ x)) ∧
      frobenius (u ξ) = LaurentPolynomial.T 1 ∧
      frobenius (v ξ) = LaurentPolynomial.C (φ ξ) * LaurentPolynomial.T (-1)) := by
  sorry

end TracePresentation

/- The reader also specifies the mixed/cyclic enhancements of imported ordinary
Hochschild theory; coherent THH, cyclotomic spectra, TR and TC; the DGM and
Beilinson comparisons; complex KU and its cyclonic q-Hodge comparison; continuous
localizing invariants and rigidification; motivic, Nygaard and syntomic trace
filtrations, AΩ comparisons and the Habiro interfaces. Their carriers require the
named spectral and coherent infinity-categorical supplier contracts. -/

end TauCetiRoadmap.RefinedTraceMethods
