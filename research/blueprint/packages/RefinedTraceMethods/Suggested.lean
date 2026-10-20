import Mathlib

/-!
# RefinedTraceMethods: representative target signatures

This file is not the roadmap and is not exhaustive: the README
`README.md` is definitive. The statements below suggest Lean forms, so that
contributors and reviewers converge on names and signatures. They are limited to light
definitions and representative end statements over carriers the pinned Mathlib already has.
In particular the file distinguishes FV = p from VF = p, keeps positivity in the high-powered
indexing condition, and records only the ordinary underlying coefficient quotient of the graded
spectral presentation. The README specifies the coherent categories, spectral
realizations, filtrations and traces, which have no carrier at the pins.
-/

noncomputable section

namespace TauCetiRoadmap.RefinedTraceMethods

universe u v

/-! ## Layer 3: Cartier modules and cyclotomic quasi-isogenies -/

/-- `CartierStructure`: a classical p-typical Cartier structure on an abelian group. Only
FV = p is imposed, not VF = p (Antieau–Nikolaus, §3.1, p. 15, and footnote 5). -/
structure CartierStructure (p : ℕ) (M : Type u) [AddCommGroup M] where
  frobenius : M →+ M
  verschiebung : M →+ M
  frobenius_verschiebung : frobenius.comp verschiebung = p • AddMonoidHom.id M

namespace CartierStructure

/-- `CartierStructure.IsMorphism`: an additive map is a Cartier map when it commutes with
each operator, not merely with their composite. -/
def IsMorphism {p : ℕ} {M : Type u} {N : Type v} [AddCommGroup M] [AddCommGroup N]
    (c : CartierStructure p M) (d : CartierStructure p N) (f : M →+ N) : Prop :=
  f.comp c.frobenius = d.frobenius.comp f ∧ f.comp c.verschiebung = d.verschiebung.comp f

example {p : ℕ} {M : Type u} [AddCommGroup M] (c : CartierStructure p M) :
    c.IsMorphism c (AddMonoidHom.id M) := by
  constructor <;> ext x <;> rfl

example {p : ℕ} {M : Type u} {N : Type v} [AddCommGroup M] [AddCommGroup N]
    (c : CartierStructure p M) (d : CartierStructure p N) :
    c.IsMorphism d 0 := by
  constructor <;> ext x <;> simp

end CartierStructure

/-- `CartierModule.isogeny_iff_underlying`: a Cartier map is an isogeny of Cartier modules
exactly when its underlying additive map is an isogeny. For the nontrivial direction replace
an additive inverse g with denominator n by n • g, whose composites are n² • id: both operator
defects of g land in ker f, which n annihilates. This is the corrected V-operator argument in
the proof of AMMN, Proposition 3.1, p. 15. -/
theorem CartierModule.isogeny_iff_underlying {p : ℕ} {M : Type u} {N : Type v}
    [AddCommGroup M] [AddCommGroup N]
    (c : CartierStructure p M) (d : CartierStructure p N)
    (f : M →+ N) (hf : c.IsMorphism d f) :
    (∃ (g : N →+ M) (n : ℕ), 0 < n ∧ d.IsMorphism c g ∧
        g.comp f = n • AddMonoidHom.id M ∧ f.comp g = n • AddMonoidHom.id N) ↔
      ∃ (g : N →+ M) (n : ℕ), 0 < n ∧
        g.comp f = n • AddMonoidHom.id M ∧ f.comp g = n • AddMonoidHom.id N := by
  sorry

/-- Test `CartierModule.integer`: on ℤ, F = p and V = 1 satisfy the Cartier relation. -/
example (p : ℕ) : ∃ c : CartierStructure p ℤ,
    c.frobenius = p • AddMonoidHom.id ℤ ∧ c.verschiebung = AddMonoidHom.id ℤ := by
  refine ⟨⟨p • AddMonoidHom.id ℤ, AddMonoidHom.id ℤ, ?_⟩, rfl, rfl⟩
  simp

/-- Test `CartierModule.no_vf_axiom`: on (ℤ/p)² put F(x, y) = (x, 0) and V(x, y) = (0, x).
Then FV = 0 = p • id, but VF(1, 0) = (0, 1), so VF ≠ p • id; a definition that also imposed
VF = p would wrongly exclude this Cartier module. -/
example (p : ℕ) [Fact p.Prime] : ∃ c : CartierStructure p (ZMod p × ZMod p),
    c.verschiebung.comp c.frobenius ≠ p • AddMonoidHom.id (ZMod p × ZMod p) := by
  refine ⟨⟨(AddMonoidHom.inl (ZMod p) (ZMod p)).comp (AddMonoidHom.fst (ZMod p) (ZMod p)),
    (AddMonoidHom.inr (ZMod p) (ZMod p)).comp (AddMonoidHom.fst (ZMod p) (ZMod p)), ?_⟩, ?_⟩
  · ext x <;> simp
  · intro h
    have h1 := congrArg Prod.snd (DFunLike.congr_fun h ((1 : ZMod p), (0 : ZMod p)))
    simp at h1

/-! ## Layer 7: refined invariants and finite-coefficient calculations -/

/-- `HighPowered`: the high-powered integers of Meyer–Wagner, 3.3, p. 30. A present odd
prime exponent is at least two; a present 2-adic exponent is even and at least four. -/
def HighPowered (m : ℕ) : Prop :=
  0 < m ∧
    (m.factorization 2 = 0 ∨ (4 ≤ m.factorization 2 ∧ Even (m.factorization 2))) ∧
    ∀ p : ℕ, p.Prime → p ≠ 2 → m.factorization p = 0 ∨ 2 ≤ m.factorization p

/-- `HighPowered.fourthPower`: fourth powers give a divisibility-cofinal supply of
admissible indices. -/
theorem HighPowered.fourthPower {d : ℕ} (hd : 0 < d) :
    HighPowered (d ^ 4) ∧ d ∣ d ^ 4 := by
  sorry

/-- Tests `HighPowered.one` and `HighPowered.excludeZeroEightThirtyTwo` (the value 32). -/
example : HighPowered 1 ∧ ¬ HighPowered 32 := by
  constructor
  · simp [HighPowered]
  · rintro ⟨_, h, _⟩
    have hfac : (32 : ℕ).factorization 2 = 5 := by
      change ((2 : ℕ) ^ 5).factorization 2 = 5
      rw [Nat.factorization_pow]
      simp [Nat.prime_two.factorization]
    rw [hfac] at h
    rcases h with h | ⟨-, k, hk⟩ <;> omega

/-- Test `HighPowered.excludeZeroEightThirtyTwo` (the value 0): factorization alone would
incorrectly admit zero. -/
example : ¬ HighPowered 0 := by
  simp [HighPowered]

/-! ## Layer 8: arithmetic filtrations and prismatic comparisons -/

/-- `TracePresentation`: the underlying quotient A[u,v]/(uv−ξ). Its homotopical grading and
spectral realization are specified in the README; BMS2, Proposition 6.2. -/
abbrev TracePresentation (A : Type u) [CommRing A] (ξ : A) :=
  MvPolynomial (Fin 2) A ⧸
    Ideal.span {MvPolynomial.X (0 : Fin 2) * MvPolynomial.X (1 : Fin 2) - MvPolynomial.C ξ}

namespace TracePresentation

variable {A : Type u} [CommRing A]

/-- `TracePresentation.coeff`: the canonical coefficient homomorphism. -/
def coeff (ξ : A) : A →+* TracePresentation A ξ :=
  (Ideal.Quotient.mk _).comp MvPolynomial.C

/-- `TracePresentation.u`: the degree-two generator in the graded presentation. -/
def u (ξ : A) : TracePresentation A ξ :=
  Ideal.Quotient.mk _ (MvPolynomial.X (0 : Fin 2))

/-- `TracePresentation.v`: the degree-minus-two generator; it is a second variable before
quotienting. -/
def v (ξ : A) : TracePresentation A ξ :=
  Ideal.Quotient.mk _ (MvPolynomial.X (1 : Fin 2))

/-- `TracePresentation.uv`: the two generators satisfy the relation in the actual quotient. -/
example (ξ : A) : u ξ * v ξ = coeff ξ ξ := by
  apply sub_eq_zero.mp
  change Ideal.Quotient.mk _
    (MvPolynomial.X (0 : Fin 2) * MvPolynomial.X (1 : Fin 2)) -
    Ideal.Quotient.mk _ (MvPolynomial.C ξ) = 0
  rw [← map_sub]
  apply Ideal.Quotient.eq_zero_iff_mem.mpr
  exact Ideal.subset_span (Set.mem_singleton _)

/-- `TracePresentation.lift`: the universal coefficient presentation, including uniqueness. -/
theorem lift {B : Type v} [CommRing B] (ξ : A)
    (f : A →+* B) (a b : B) (h : a * b = f ξ) :
    ∃! g : TracePresentation A ξ →+* B,
      (∀ x, g (coeff ξ x) = f x) ∧ g (u ξ) = a ∧ g (v ξ) = b := by
  sorry

/-- `TracePresentation.can_and_frobenius`: the two maps have distinct
generator images and semilinear coefficients. BMS2, Propositions 6.2–6.3, pp. 245–247 in the
published version. -/
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

/- Definitions whose carriers require the spectral and coherent infinity-categorical
supplier contracts remain in the README, in layer order:

Layer 1: Connes' cyclic category and cyclic objects; the cyclic enhancement of supplied
derived Hochschild chains; mixed complexes and their derived category; cyclic, negative
cyclic and periodic cyclic homology.

Layer 2: spectra with group action; THH of E₁-rings, relative THH and THH of spectral and
stable infinity categories; lax equalizers; cyclotomic spectra; TC⁻, TP and TC; orthogonal
spectra; genuine G-spectra with genuine and geometric fixed points; genuine Prüfer-group
and finite-family circle spectra; genuine cyclotomic spectra; TR and genuine TC; coalgebras
and fixed points of endofunctors; the Bökstedt construction and classical THH.

Layer 3: circle-equivariant p-typical cyclotomic spectra; topological Cartier modules;
derived V-completeness; positively graded cyclotomic spectra. Classical Cartier modules
have the additive carrier used by CartierStructure above; their category is in the README.

Layer 4: relative dualizable presentable stable categories; relative trace-class morphisms,
ordered E₁ rigidity and nuclear objects; accessible localizing invariants; localizing and
truncating invariants; Goodwillie derivatives; connective bimodules and square-zero
extensions; pseudo-extensible and Postnikov-convergent algebra functors; infinitesimal
sifted-colimit preservation, together with the DGM comparison.

Layer 6: spherical lifts and the base hypotheses; light condensed and solid spectra;
trace-class maps and nuclear modules; perfect even modules and the even site; ordinary
even filtrations; the solid even filtration; even flat and solid even flat modules;
homological evenness and even homotopy sheaves; faithfully even flat ring maps; solid
duality Assumption R; compatible local and global spherical lifts; KU/p-localization,
structured Adams fixed points and the connective cover of the local sphere at each prime;
cyclonic spectra and cyclonic Adams lift coherence; TC^{−(m)}.

Layer 7: nuclear E-modules; smooth and proper E-linear categories. Layer 8 additionally
constructs the motivic, Nygaard and syntomic trace filtrations, Breuil–Kisin twists, AΩ
comparisons and Habiro interfaces. The sheaf of finite-coefficient even K-groups and its
derived syntomic-to-étale pushforward in Layer 8 also require the README's higher carriers.
Layer 9 defines Zₚ and Qₚ coefficients by p-completing
before inverting p, and constructs the Beilinson comparisons using the earlier
layers. The Snaith comparison, stable Adams lifts and relative cyclic HKR remain Layer 5
theorem targets over supplied ku and KU. -/

end TauCetiRoadmap.RefinedTraceMethods
