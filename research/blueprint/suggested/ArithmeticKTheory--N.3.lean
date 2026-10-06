/-
This file is not the roadmap and is not exhaustive. The definitive document is
research/blueprint/readmes/ArithmeticKTheory--N.3.md. These statements suggest Lean
forms so contributors and reviewers can converge on names and signatures.
Every new arithmetic declaration, API item and test is registered below.
This is an incomplete §13 prototype: the arithmetic register is comment-only,
so the required typed declarations, API signatures and examples are missing.
The independent review returns needs_changes for that defect.
Implementation status is unchecked throughout.

Pins: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

The executable examples use only the pinned Mathlib API. HigherK.KGroup, QCat,
the rank-filtration homology maps, and genuine higher-K localization/transfer
are supplier interfaces, absent at these pins. Their signatures are comments,
following the parent and supplier signature registers. No arbitrary K types,
opaque spaces, proposition-valued carriers or assumed arithmetic answer are
introduced to make those signatures elaborate. Compiling this file checks the
native algebra and classical arithmetic examples; it does not check the
commented higher-K signatures. Tau Ceti pin statements were inspected as source;
they are not imported against a different Tau Ceti revision in the shared build.
-/
import Mathlib.Algebra.Module.Submodule.Equiv
import Mathlib.LinearAlgebra.TensorProduct.Tower
import Mathlib.NumberTheory.NumberField.ClassNumber
import Mathlib.NumberTheory.NumberField.Units.DirichletTheorem
import Mathlib.RingTheory.DedekindDomain.SInteger
import Mathlib.RingTheory.Finiteness.Finsupp
import Mathlib.RingTheory.Flat.Basic
import Mathlib.RingTheory.Flat.Localization
import Mathlib.RingTheory.PicardGroup

noncomputable section
open scoped TensorProduct

namespace ArithmeticKTheory.NativeChecks

-- Existing carriers and actual Dirichlet/class-number theorems, not new nodes.
example (F : Type*) [Field F] [NumberField F] :
    Finite (ClassGroup (NumberField.RingOfIntegers F)) := by
  infer_instance

example (F : Type*) [Field F] [NumberField F] :
    Module.finrank ℤ (Additive (NumberField.RingOfIntegers F)ˣ) =
      NumberField.Units.rank F := by
  sorry

example (F : Type*) [Field F] [NumberField F] :
    Monoid.FG (NumberField.RingOfIntegers F)ˣ := by
  infer_instance

-- These algebra examples do not substitute their arbitrary modules for K-groups.
section Algebra
variable {A B C : Type*} [AddCommGroup A] [Module ℤ A]
  [AddCommGroup B] [Module ℤ B] [AddCommGroup C] [Module ℤ C]

example (f : A →ₗ[ℤ] B) (g : B →ₗ[ℤ] C) (hex : Function.Exact f g) :
    Function.Exact (f.lTensor ℚ) (g.lTensor ℚ) := by
  sorry

-- The ℚ-linear upgrade exists in Mathlib; no bespoke rationalized-map structure.
example (f : A →ₗ[ℤ] B) (q : ℚ) (x : A) :
    TensorProduct.AlgebraTensorModule.lTensor ℚ ℚ f (q ⊗ₜ[ℤ] x) =
      q ⊗ₜ[ℤ] f x := by
  sorry

example (f : A →ₗ[ℤ] B) (g : B →ₗ[ℤ] C)
    [Module.Finite ℤ A] [Module.Finite ℤ C]
    (hex : Function.Exact f g) (hsurj : Function.Surjective g) :
    Module.Finite ℤ B := by
  sorry

end Algebra

section LinearEquivalences
variable {V W : Type*} [AddCommGroup V] [Module ℚ V]
  [AddCommGroup W] [Module ℚ W]

-- Apply these existing rules to the genuine rationalized inclusion once available.
example (f : V →ₗ[ℚ] W) (hf : Function.Bijective f) (x : V) :
    LinearEquiv.ofBijective f hf x = f x := by
  sorry

example (f : V →ₗ[ℚ] W) (hf : Function.Bijective f) (x : V) :
    (LinearEquiv.ofBijective f hf).symm (f x) = x := by
  sorry

example (f : V →ₗ[ℚ] W) (hf : Function.Bijective f) (y : W) :
    f ((LinearEquiv.ofBijective f hf).symm y) = y := by
  sorry

example (f : V →ₗ[ℚ] W) (hf : Function.Bijective f)
    (e : V ≃ₗ[ℚ] W) (he : e.toLinearMap = f) :
    e = LinearEquiv.ofBijective f hf := by
  sorry

example : (2 : ℚ) • (LinearMap.id : ℚ →ₗ[ℚ] ℚ) ≠ LinearMap.id := by
  sorry
end LinearEquivalences
end ArithmeticKTheory.NativeChecks

/-
The following is the arithmetic signature register, not executable Lean.
All expressions refer to genuine supplier constructions, not variables with
arbitrary interpretations. Shorthand, fixed only when suppliers are defined:

  K(n,R) = TauCeti.HigherK.KGroup (finiteProjectiveModulesExactStructure R) n
  V(n,R) = ℚ ⊗[ℤ] K(n,R), with its native ℚ action on the first factor
  QH(A,m,i) = integral singular homology of B(QCat.rankFiltration A m)
  QH∞(A,i) = integral singular homology of BQ(P(A))
  hIncl(A,m,i) : QH(A,m,i) →ₗ[ℤ] QH∞(A,i)
  hStep(A,m,i) : QH(A,m,i) →ₗ[ℤ] QH(A,m+1,i)
  jInt(F,S,T,n) : K(n,S.integer F) →ₗ[ℤ] K(n,T.integer F)
    = the genuine higher-K map induced by S ⊆ T
  loc(F,S,n) : V(n,𝓞 F) →ₗ[ℚ] V(n,S.integer F)
  locST(F,S,T,n) = rationalized higher-K map of S.integer F → T.integer F
  fieldMap(F,S,n) = rationalized higher-K map of S.integer F → F

Rationalized maps use TensorProduct.AlgebraTensorModule.lTensor ℚ ℚ applied
to the integer-linear form of the actual K-group map. Empty-S transport uses
the ring comparison from ArithmeticKTheory:N.1/S-integers-as-a-localisation.
No declaration is added for these shorthands.

namespace ArithmeticKTheory
variable (F : Type*) [Field F] [NumberField F]
variable (S T : Set (IsDedekindDomain.HeightOneSpectrum (𝓞 F)))

-- ArithmeticKTheory:N.3/finite-rank-Q-homology
 theorem finite_rankQHomology (m i : ℕ) : Module.Finite ℤ (QH(𝓞 F,m,i)) := by sorry

-- ArithmeticKTheory:N.3/rank-filtration-homology-stability
-- A is an arbitrary Dedekind domain, not necessarily arithmetic.
 theorem rankQHomology_stable (A : Type*) [CommRing A] [IsDedekindDomain A]
     (m i : ℕ) :
     (i ≤ m → Function.Surjective (hIncl(A,m,i))) ∧
     (i + 1 ≤ m → Function.Bijective (hIncl(A,m,i))) ∧
     (i ≤ m → Function.Surjective (hStep(A,m,i))) ∧
     (i + 1 ≤ m → Function.Bijective (hStep(A,m,i))) := by sorry

-- ArithmeticKTheory:N.3/stable-Q-homology-finite-type
 theorem finite_QHomology (i : ℕ) :
     Module.Finite ℤ (QH∞(𝓞 F,i)) ∧
     Function.Bijective (hIncl(𝓞 F,i+1,i)) := by sorry

-- ArithmeticKTheory:N.3/finite-S-localisation-defect
-- jInt is the genuine higher-K integer-linear map induced by S ⊆ T.
 theorem finite_localisation_defect [Finite S] [Finite T] (hST : S ⊆ T)
     (n : ℕ) (hn : 2 ≤ n) :
     Finite (LinearMap.ker (jInt(F,S,T,n))) ∧
     Finite (K(n,T.integer F) ⧸ LinearMap.range (jInt(F,S,T,n))) ∧
     (Even n → Function.Injective (jInt(F,S,T,n))) := by sorry

-- ArithmeticKTheory:N.3/canonical-rational-S-integer-equivalence
 noncomputable def rationalSIntegerEquiv [Finite S] (n : ℕ) (hn : 2 ≤ n) :
     V(n,𝓞 F) ≃ₗ[ℚ] V(n,S.integer F) :=
   LinearEquiv.ofBijective (loc(F,S,n)) (by sorry)

-- API: projection identification is separately promoted for use in transfer.
-- ArithmeticKTheory:N.3/canonical-rational-equivalence-map
 theorem rationalSIntegerEquiv_toLinearMap [Finite S] (n : ℕ) (hn : 2 ≤ n) :
     (rationalSIntegerEquiv F S n hn).toLinearMap = loc(F,S,n) := by sorry

 theorem rationalSIntegerEquiv_apply [Finite S] (n : ℕ) (hn : 2 ≤ n)
     (x : V(n,𝓞 F)) : rationalSIntegerEquiv F S n hn x = loc(F,S,n) x := by sorry
 theorem rationalSIntegerEquiv_symm_apply_apply [Finite S] (n : ℕ) (hn : 2 ≤ n)
     (x : V(n,𝓞 F)) :
     (rationalSIntegerEquiv F S n hn).symm (rationalSIntegerEquiv F S n hn x) = x := by sorry
 theorem rationalSIntegerEquiv_apply_symm_apply [Finite S] (n : ℕ) (hn : 2 ≤ n)
     (y : V(n,S.integer F)) :
     rationalSIntegerEquiv F S n hn ((rationalSIntegerEquiv F S n hn).symm y) = y := by sorry
 theorem rationalSIntegerEquiv_unique [Finite S] (n : ℕ) (hn : 2 ≤ n)
     (e : V(n,𝓞 F) ≃ₗ[ℚ] V(n,S.integer F)) (he : e.toLinearMap = loc(F,S,n)) :
     e = rationalSIntegerEquiv F S n hn := by sorry
 theorem rationalSIntegerEquiv_empty (n : ℕ) (hn : 2 ≤ n) :
     (rationalSIntegerEquiv F ∅ n hn).trans emptySComparison = LinearEquiv.refl ℚ _ := by sorry
 theorem rationalSIntegerEquiv_enlarge [Finite S] [Finite T] (hST : S ⊆ T)
     (n : ℕ) (hn : 2 ≤ n) :
     locST(F,S,T,n).comp (rationalSIntegerEquiv F S n hn).toLinearMap =
       (rationalSIntegerEquiv F T n hn).toLinearMap := by sorry
 theorem rationalSIntegerEquiv_toField [Finite S] (n : ℕ) (hn : 2 ≤ n) :
     fieldMap(F,S,n).comp (rationalSIntegerEquiv F S n hn).toLinearMap =
       fieldMapFromIntegers(F,n) := by sorry

-- Tests: all names below correspond exactly to the packet tests. The arithmetic
-- examples await K carriers; the native examples above check only underlying algebra.
-- ArithmeticKTheory.test_rationalSIntegerEquiv_empty
 example (n : ℕ) (hn : 2 ≤ n) :
     (rationalSIntegerEquiv F ∅ n hn).trans emptySComparison = LinearEquiv.refl ℚ _ := by sorry
-- ArithmeticKTheory.test_rationalSIntegerEquiv_enlarge
 example (p q : ℕ) (hp : p.Prime) (hq : q.Prime) (hpq : p ≠ q) :
     locST(ℚ,{(p)},{(p),(q)},5).comp
       (rationalSIntegerEquiv ℚ {(p)} 5 (by decide)).toLinearMap =
       (rationalSIntegerEquiv ℚ {(p),(q)} 5 (by decide)).toLinearMap := by sorry
-- ArithmeticKTheory.test_rationalSIntegerEquiv_degree_one
 example (p : ℕ) (hp : p.Prime) : ¬ Function.Bijective (loc(ℚ,{(p)},1)) := by sorry
-- ArithmeticKTheory.test_rationalSIntegerEquiv_prescribed_map
 example : (2 : ℚ) • (rationalSIntegerEquiv ℚ ∅ 5 (by decide)).toLinearMap ≠
     (rationalSIntegerEquiv ℚ ∅ 5 (by decide)).toLinearMap := by sorry
-- ArithmeticKTheory.test_rationalSIntegerEquiv_even
 example (Sℚ : Set (IsDedekindDomain.HeightOneSpectrum (𝓞 ℚ))) [Finite Sℚ] :
     Subsingleton (V(2,𝓞 ℚ)) ∧ Subsingleton (V(2,Sℚ.integer ℚ)) := by sorry
-- In the preceding test S is a finite set of primes of ℤ, and integral
-- K₂(ℤ) ≃ ℤ/2 is imported from K2SymbolsBrauer:T.5/k2-of-the-integers.

-- ArithmeticKTheory:N.3/rational-localisation-extension-transfer
-- E/F finite, T exactly the primes above S. Actual res/tr from exact functors;
-- finite projectivity, not étaleness, is the hypothesis for the ring transfer.
 theorem rationalSIntegerEquiv_extension_transfer (E : Type*) [Field E]
     [NumberField E] [Algebra F E] [FiniteDimensional F E]
     [Finite S] (T := primesAbove E S) (n : ℕ) (hn : 2 ≤ n) :
     (rationalSIntegerEquiv E T n hn).toLinearMap.comp res₀ =
       resS.comp (rationalSIntegerEquiv F S n hn).toLinearMap ∧
     (rationalSIntegerEquiv F S n hn).toLinearMap.comp tr₀ =
       trS.comp (rationalSIntegerEquiv E T n hn).toLinearMap := by sorry
end ArithmeticKTheory

Imported parent endpoints (same IDs; no new declarations for their statements):
N.3:finite-generation/quillen-finite-generation-theorem, n ≥ 0;
N.3:finite-generation/finite-generation-of-K-of-S-integers, n ≥ 0 and S finite;
N.3:ranks/borel-rank-theorem, n ≥ 2, with degree one treated separately;
N.3:ranks/even-K-groups-of-S-integers-are-finite, n = 2i, i ≥ 1;
N.3:ranks/even-K-groups-of-the-field-are-infinite-torsion, n = 2i, i ≥ 1;
N.3/finiteness-and-ranks-combined, n ≥ 2, noncanonical integral splitting.
-/
