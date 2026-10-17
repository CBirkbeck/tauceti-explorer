import Mathlib.Algebra.Algebra.Equiv
import Mathlib.Algebra.Ring.NonZeroDivisors
import Mathlib.RingTheory.Ideal.Span
import Mathlib.RingTheory.Jacobson.Ideal
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.Data.Nat.Choose.Basic
import Mathlib.Algebra.BigOperators.Group.Finset.Basic

/-!
# PrismaticCohomology: representative target signatures

The roadmap is the document `PrismaticCohomology.md`; this file is not the roadmap and is not
exhaustive. It records, against the pinned Mathlib, the definitions that are light enough to be
given real bodies and the milestone statements whose carriers exist at the pins, so that
contributors and reviewers converge on names and signatures. Every theorem is proved by `sorry`.

Design choices made explicit here:

* A δ-structure is the operation `δ` with Joyal's four identities, the additivity identity written
  with the integers `choose p i / p` so that no division in the ring is needed. Its Frobenius is
  `x ↦ x ^ p + p * δ x`.
* Prisms, derived completeness, the prismatic site, the Cartier–Witt stack, quasi-coherent
  complexes on prestacks (∞-categorical), syntomic complexes and the Fargues–Fontaine bundles have
  no carriers at the pins; they are targets of the document and are absent here.
* The q-derivative is stated for a `QFraming`: a D-algebra with an element `q` of D, coordinates `X s` and D-algebra
  commuting automorphisms `γ s` scaling the `s`-th coordinate by `q`, with `γ s f - f` divisible by
  the regular element `(q - 1) * X s`. The completeness and étaleness of the framing, which produce
  the `γ s`, cannot be stated at the pins (derived completeness is missing) and are not fields.
-/

namespace TauCetiRoadmap.PrismaticCohomology

open Finset

/-! ## Layer PR.0: δ-rings, prisms and envelopes -/

section Delta

variable (p : ℕ) [hp : Fact p.Prime]

/-- A δ-structure on a commutative ring (Bhatt–Scholze, Definition 2.1): a map `δ` with
`δ 0 = δ 1 = 0`, the product rule `δ(xy) = x^p δ(y) + y^p δ(x) + p δ(x) δ(y)` and the sum rule
`δ(x + y) = δ(x) + δ(y) - ∑_{0<i<p} (C(p,i)/p) x^i y^(p-i)`. -/
structure DeltaStructure (A : Type*) [CommRing A] where
  /-- The operation δ. -/
  δ : A → A
  map_zero : δ 0 = 0
  map_one : δ 1 = 0
  map_mul : ∀ x y, δ (x * y) = x ^ p * δ y + y ^ p * δ x + (p : A) * δ x * δ y
  map_add : ∀ x y, δ (x + y) =
    δ x + δ y - ∑ i ∈ Ioo 0 p, ((p.choose i / p : ℕ) : A) * x ^ i * y ^ (p - i)

namespace DeltaStructure

variable {p} {A : Type*} [CommRing A] (D : DeltaStructure p A)

/-- The Frobenius lift `φ(x) = x ^ p + p δ(x)` of a δ-structure (Bhatt–Scholze, Remark 2.2). -/
def frob (x : A) : A := x ^ p + (p : A) * D.δ x

omit hp in
theorem frob_one : D.frob 1 = 1 := by
  simp [frob, D.map_one]

theorem frob_add (x y : A) : D.frob (x + y) = D.frob x + D.frob y := by
  sorry

theorem frob_mul (x y : A) : D.frob (x * y) = D.frob x * D.frob y := by
  sorry

/-- The Frobenius lift lifts the Frobenius modulo `p`. -/
theorem frob_sub_pow_mem (x : A) : D.frob x - x ^ p ∈ Ideal.span {(p : A)} := by
  sorry

/-- An element `d` is distinguished when `δ d` is a unit (Bhatt–Scholze, Definition 2.19). -/
def IsDistinguished (d : A) : Prop := IsUnit (D.δ d)

/-- Condition (b) of a prism for an ideal `I`: `p ∈ I + φ(I) A` (Bhatt–Scholze, Definition 3.2). -/
def IsPrismIdeal (I : Ideal A) : Prop :=
  (p : A) ∈ I ⊔ Ideal.span (D.frob '' (I : Set A))

/-- Bhatt–Scholze, Lemma 2.25 (and Lemma 3.1 for locally principal ideals): for a principal ideal `(d)` with `p` and `d` in the Jacobson
radical, condition (b) of a prism holds exactly when `d` is distinguished. -/
theorem isPrismIdeal_span_singleton_iff (d : A)
    (hp' : (p : A) ∈ (⊥ : Ideal A).jacobson) (hd : d ∈ (⊥ : Ideal A).jacobson) :
    D.IsPrismIdeal (Ideal.span {d}) ↔ D.IsDistinguished d := by
  sorry

end DeltaStructure

/-- The integers carry exactly one δ-structure: `p δ(n) = n - n ^ p`, since the identity is the only
ring endomorphism (the argument of Bhatt–Scholze, Example 2.6, for `ℤ_(p)`). -/
theorem int_delta_spec (D : DeltaStructure p ℤ) (n : ℤ) : (p : ℤ) * D.δ n = n - n ^ p := by
  sorry

/-- In `ℤ_[p]`, `p` is distinguished for every δ-structure (`δ(p) = 1 - p^(p-1)`). -/
theorem padic_p_isDistinguished (D : DeltaStructure p ℤ_[p]) : D.IsDistinguished (p : ℤ_[p]) := by
  sorry

/-- Non-example: `p ^ 2` is not distinguished in `ℤ_[p]`, since `δ(p²)` is divisible by `p`. -/
theorem padic_p_sq_not_isDistinguished (D : DeltaStructure p ℤ_[p]) :
    ¬ D.IsDistinguished ((p : ℤ_[p]) ^ 2) := by
  sorry

/-- The crystalline prism `(ℤ_p, (p))` satisfies condition (b). -/
theorem padic_isPrismIdeal (D : DeltaStructure p ℤ_[p]) :
    D.IsPrismIdeal (Ideal.span {(p : ℤ_[p])}) := by
  sorry

example (D : DeltaStructure p ℤ) : D.δ (p : ℤ) * p = p - p ^ p := by
  rw [mul_comm]; exact int_delta_spec p D p

end Delta

/-! ## Layer PR.6: q-crystalline charts and the AΩ comparison

The finite and sufficiently complete framed q-automorphisms and q-derivatives are planned here.
The general-base and infinite-coordinate extensions are open interfaces in the reviewed document. A `QFraming` records the data the
q-derivative uses; the framed algebra `FramedAlgebra` of the document, whose completely étale framing
produces the automorphisms, is a target without carrier at the pins. -/

section QFraming

/-- A q-derivation datum (document, node `q-derivations-and-their-koszul-complex`): an element `q`
of the base, coordinates `X s`, pairwise commuting automorphisms `γ s` with
`γ s (X t) = q^(δ_st) X t`, `γ s f - f` divisible by `(q - 1) X s`, and `(q - 1) X s` a
nonzerodivisor. -/
structure QFraming (D E : Type*) [CommRing D] [CommRing E] [Algebra D E] (S : Type*)
    [DecidableEq S] where
  /-- The parameter `q`. -/
  q : D
  /-- The coordinates. -/
  X : S → E
  /-- The automorphism scaling the `s`-th coordinate by `q`. -/
  γ : S → (E ≃ₐ[D] E)
  γ_X : ∀ s t, γ s (X t) = (if s = t then algebraMap D E q else 1) * X t
  γ_comm : ∀ s t f, γ s (γ t f) = γ t (γ s f)
  γ_sub_mem : ∀ s f, γ s f - f ∈ Ideal.span {algebraMap D E (q - 1) * X s}
  regular : ∀ s, algebraMap D E (q - 1) * X s ∈ nonZeroDivisors E

namespace QFraming

variable {D E S : Type*} [CommRing D] [CommRing E] [Algebra D E] [DecidableEq S]
variable (F : QFraming D E S)

/-- The q-derivative `∇_{q,s} f = (γ_s f - f) / ((q - 1) X_s)`, the quotient being exact by
`γ_sub_mem` (Scholze, Canonical q-deformations, §3). -/
noncomputable def qDeriv (s : S) (f : E) : E :=
  Classical.choose (Ideal.mem_span_singleton'.mp (F.γ_sub_mem s f))

theorem qDeriv_spec (s : S) (f : E) :
    algebraMap D E (F.q - 1) * F.X s * F.qDeriv s f = F.γ s f - f := by
  sorry

/-- The defining identity, and uniqueness of the quotient. -/
theorem qDeriv_eq_iff (s : S) (f g : E) :
    F.qDeriv s f = g ↔ algebraMap D E (F.q - 1) * F.X s * g = F.γ s f - f := by
  sorry

theorem qDeriv_add (s : S) (f g : E) : F.qDeriv s (f + g) = F.qDeriv s f + F.qDeriv s g := by
  sorry

theorem qDeriv_one (s : S) : F.qDeriv s 1 = 0 := by
  sorry

theorem qDeriv_algebraMap (s : S) (a : D) : F.qDeriv s (algebraMap D E a) = 0 := by
  sorry

theorem qDeriv_smul (s : S) (a : D) (f : E) :
    F.qDeriv s (algebraMap D E a * f) = algebraMap D E a * F.qDeriv s f := by
  sorry

/-- The twisted Leibniz rule. -/
theorem qDeriv_mul (s : S) (f g : E) :
    F.qDeriv s (f * g) = F.qDeriv s f * g + F.γ s f * F.qDeriv s g := by
  sorry

/-- `∇_{q,s}(X_s^(n+1)) = [n+1]_q X_s^n`. -/
theorem qDeriv_X_pow (s : S) (n : ℕ) :
    F.qDeriv s (F.X s ^ (n + 1)) =
      (∑ i ∈ range (n + 1), algebraMap D E F.q ^ i) * F.X s ^ n := by
  sorry

theorem qDeriv_X_of_ne {s t : S} (h : s ≠ t) : F.qDeriv s (F.X t) = 0 := by
  sorry

/-- The q-derivatives in different directions commute. -/
theorem qDeriv_comm (s t : S) (f : E) :
    F.qDeriv s (F.qDeriv t f) = F.qDeriv t (F.qDeriv s f) := by
  sorry

/-- Frobenius compatibility: `∇_{q,s} ∘ φ = [p]_q X_s^(p-1) φ ∘ ∇_{q,s}`. -/
theorem qDeriv_frobenius (p : ℕ) (φ : E →+* E) (hγ : ∀ s f, φ (F.γ s f) = F.γ s (φ f))
    (hX : ∀ s, φ (F.X s) = F.X s ^ p) (hq : φ (algebraMap D E F.q) = algebraMap D E F.q ^ p)
    (s : S) (f : E) :
    F.qDeriv s (φ f) =
      (∑ i ∈ range p, algebraMap D E F.q ^ i) * F.X s ^ (p - 1) * φ (F.qDeriv s f) := by
  sorry

/-- Test `QFraming.qDeriv_X_cube`. -/
example (s : S) :
    F.qDeriv s (F.X s ^ 3) =
      (1 + algebraMap D E F.q + algebraMap D E F.q ^ 2) * F.X s ^ 2 := by
  sorry

/-- Test `QFraming.qDeriv_leibniz_check`: `∇_q(X · X) = (1 + q) X`. -/
example (s : S) :
    F.qDeriv s (F.X s * F.X s) = (1 + algebraMap D E F.q) * F.X s := by
  sorry

/-- Test `QFraming.qDeriv_not_untwisted`: the untwisted Leibniz value `2 X` is wrong. -/
example [Nontrivial E] (s : S) : F.qDeriv s (F.X s ^ 2) ≠ 2 * F.X s := by
  sorry

end QFraming

end QFraming

/-!
## Statements not typed at the pins

The following targets of the document have no carrier at the pinned Mathlib and Tau Ceti, and are
stated there only.

* Needing derived completeness and the prismatic site: prisms and their maps, the relative and
  absolute prismatic sites, derived prismatic cohomology, perfectoidization, the conjugate and
  Nygaard filtrations, Breuil–Kisin twists, syntomic complexes and the étale comparison (PR.0–PR.4),
  prismatic crystals and F-crystals (PR.7), and the logarithmic theory (PR.8).
  The general-envelope target in PR.0 is over bounded orientable bases and has no regular-kernel
  assumption. Its transfinite torsion-removal/completion construction, universal property and
  identity/unit-ideal/regular-comparison/nonregular-input tests are README targets. The required
  delta-ring category and derived completion carriers are missing at the pins; no placeholder
  definition or envelope existence axiom is introduced here. General existence supplies neither
  bounded output nor flatness, and the unbounded-base extension remains a separate reader gap.
* Needing ∞-categories of quasi-coherent complexes (PR.5): `QCohPrestack`, `QCohPrestack.eval`,
  `QCohPrestack.ofPoints`, `QCohPrestack.pullback`, `QCohPrestack.specEquiv`,
  `QCohPrestack.limitOfColimit`, `QCohPrestack.isEquiv_iff_eval`, `QCohPrestack.unit_eval`,
  `QCohPrestack.isDualizable_iff_perfect`, `QCohPrestack.isInvertible_iff`,
  `QCohPrestack.homotopyCategory_spec`; tests `QCohPrestack.empty`, `QCohPrestack.terminal`,
  `QCohPrestack.spec_homotopy`, `QCohPrestack.classifying_Z2`, `QCohPrestack.dualizable_spec`;
  faithfully flat descent for quasi-coherent complexes and the affine direct image with base
  change; the Cartier–Witt stack.
  The bounded-prism formal-affine comparison also stays in the README: `FormalAffineQCoh.completeEquiv`,
  `eval`, `unit`, `tensor`, `colimit`, `pullback`, `reductions`; tests `crystalline`,
  `completedCoproduct`, `derivedReduction`, `identityAndShift`. It requires unbounded enhanced
  complete-module categories and geometric effectivity, absent at the pins. SAG
  Theorem 8.3.4.4 has a connectivity restriction; no unrestricted comparison is assumed here.
* Needing completely étale framings of derived complete algebras (PR.6): `FramedAlgebra`,
  `FramedAlgebra.gamma`, `FramedAlgebra.gamma_X`, `FramedAlgebra.gamma_comm`,
  `FramedAlgebra.gamma_sub_mem`, `FramedAlgebra.gamma_unique`, `FramedAlgebra.gamma_map`,
  `FramedAlgebra.frobenius`, `FramedAlgebra.gamma_mod`, `FramedAlgebra.toQFraming`; tests
  `FramedAlgebra.gamma_pow`, `FramedAlgebra.gamma_reduction`, `FramedAlgebra.gamma_toric_inv`,
  `FramedAlgebra.not_p_complete_only`, `FramedAlgebra.frobenius_gamma`.
* Needing finite Koszul complexes of commuting operators (PR.6), with a separate convergence
  interface for infinite completed coordinate families: `QFraming.qDeRhamComplex`,
  `QFraming.qDeRhamComplex_map`, `QFraming.qDeRhamComplex_mod`, `QFraming.qDeRhamComplex_toric`;
  tests `QFraming.qDeRham_empty`, `QFraming.qDeRham_not_functorial_diagonal`.
* Needing syntomic complexes, period rings and the Fargues–Fontaine curve's bundles (PR.7): the named
  inputs on the Beilinson fibre square and on slope-zero bundles.
-/

end TauCetiRoadmap.PrismaticCohomology
