import Mathlib.Algebra.Group.End
import Mathlib.Algebra.Ring.Hom.Defs
import Mathlib.RepresentationTheory.Basic
import Mathlib.LinearAlgebra.Trace
import Mathlib.LinearAlgebra.Matrix.Trace
import Mathlib.Tactic.NormNum

/-!
This file is not the roadmap and is not exhaustive. The roadmap document is
 definitive. These signatures suggest Lean forms so contributors and reviewers
 converge on names and interfaces. Every geometric implementation remains unchecked.

The pinned library has no native smooth derived Bernstein centre, Bun_G stratum,
D-elliptic chain, special formal O_D-module, building EP function or analytic
compact-support cohomology carrier. Their conditions are omitted honestly: see
ES7/gap/prototypes and the named omission ledger below. No desired theorem is
encoded as a Prop field, a True statement or an assumption equal to its conclusion.

The first section is the algebraic part of the stratum map after ES1/VS4/SR.1
supply the actual rings and restriction maps. The second section is the pointwise
algebraic part of the twisted inclusion, with actions, equivariance and invariance
explicit. Continuity, scheme structure and the geometric identification of t remain
in the roadmap. The final section checks the finite-dimensional trace and signs.
-/

set_option linter.unusedVariables false

namespace TauCeti.ES7

section Centres
variable {S Zgeom Zclass : Type*}
variable [CommRing S] [CommRing Zgeom] [CommRing Zclass]

/-- Algebraic signature of the composite defining Ψ_G. -/
def PsiG (spectral : S →+* Zgeom) (restrictCentre : Zgeom →+* Zclass) :
    S →+* Zclass :=
  restrictCentre.comp spectral

/-- Algebraic signature of the composite for a specified b-stratum. -/
def PsiGb (spectral : S →+* Zgeom) (restrictCentreB : Zgeom →+* Zclass) :
    S →+* Zclass :=
  restrictCentreB.comp spectral

namespace PsiGb
/-- After VS4 identifies the b=1 restriction with the trivial-stratum restriction. -/
lemma basepoint (spectral : S →+* Zgeom) (restrictCentre : Zgeom →+* Zclass) :
    PsiGb spectral restrictCentre = PsiG spectral restrictCentre := by
  sorry
end PsiGb

-- PsiGb.basepoint_test: the algebraic part of the b=1 compatibility test.
example (spectral : S →+* Zgeom) (restrictCentre : Zgeom →+* Zclass) (a : S) :
    PsiGb spectral restrictCentre a = PsiG spectral restrictCentre a := by
  sorry

-- PsiG.one_test: a wrong nonunital map would fail this test.
example (spectral : S →+* Zgeom) (restrictCentre : Zgeom →+* Zclass) :
    PsiG spectral restrictCentre 1 = 1 := by
  sorry

end Centres

section TwistedCocycles
variable {W M H : Type*} [Group W] [Group M] [Group H]

/-- Pointwise cocycle inclusion; Multiplicative ℤ bundles the additive degree map. -/
def cocycleMap (degree : W →* Multiplicative ℤ) (j : M →* H)
    (t : H) (φ : W → M) : W → H :=
  fun w => t ^ (Multiplicative.toAdd (degree w)) * j (φ w)

namespace cocycleMap

/-- Invariance and centrality are both required; centrality alone is insufficient. -/
lemma isCocycle (degree : W →* Multiplicative ℤ) (j : M →* H)
    (α : W →* MulAut H) (β : W →* MulAut M) (t : H) (φ : W → M)
    (equivariant : ∀ w m, j (β w m) = α w (j m))
    (invariant : ∀ w, α w t = t)
    (centralizes : ∀ m, t * j m = j m * t)
    (cocycle : ∀ w v, φ (w * v) = φ w * β w (φ v))
    (at_one : φ 1 = 1) :
    (∀ w v, cocycleMap degree j t φ (w * v) =
      cocycleMap degree j t φ w * α w (cocycleMap degree j t φ v)) ∧
    cocycleMap degree j t φ 1 = 1 := by
  sorry

lemma degree_zero (degree : W →* Multiplicative ℤ) (j : M →* H)
    (t : H) (φ : W → M) (w : W) (h : degree w = 1) :
    cocycleMap degree j t φ w = j (φ w) := by
  sorry

lemma basicCase (degree : W →* Multiplicative ℤ) (j : M →* H) (φ : W → M) :
    cocycleMap degree j 1 φ = fun w => j (φ w) := by
  sorry

/-- Conjugation part only; coefficient base change needs the dual-group carrier. -/
lemma conjugation (degree : W →* Multiplicative ℤ) (j : M →* H)
    (t : H) (φ : W → M) (m : M)
    (centralizes : ∀ x, t * j x = j x * t) :
    cocycleMap degree j t (fun w => m * φ w * m⁻¹) =
      fun w => j m * cocycleMap degree j t φ w * (j m)⁻¹ := by
  sorry

end cocycleMap

-- cocycleMap.basic_test: the basic case has no twist.
example (degree : W →* Multiplicative ℤ) (j : M →* H) (φ : W → M) (w : W) :
    cocycleMap degree j 1 φ w = j (φ w) := by
  sorry

-- cocycleMap.inertia_test: degree zero removes the twist, even if t≠1.
example (degree : W →* Multiplicative ℤ) (j : M →* H)
    (t : H) (φ : W → M) (w : W) (h : degree w = 1) :
    cocycleMap degree j t φ w = j (φ w) := by
  sorry

-- cocycleMap.GL2_test: q=9, chosen sqrt(q)=3, upper-Borel dual torus.
example :
    let t : ℚˣ × ℚˣ :=
      (Units.mk0 (3 : ℚ) (by norm_num), Units.mk0 (1 / 3 : ℚ) (by norm_num))
    let out := cocycleMap (MonoidHom.id (Multiplicative ℤ))
      (MonoidHom.id (ℚˣ × ℚˣ)) t (fun _ => 1) (Multiplicative.ofAdd (1 : ℤ))
    ((out.1 : ℚ), (out.2 : ℚ)) = (3, 1 / 3) := by
  sorry

end TwistedCocycles

section NormalizationAndTrace

-- The actual root/modulus comparison is omitted (ES7/gap/normalization).
-- These numerical tests fix geometric Frobenius and square-root signs at q=9.
example : ((3 : ℚ) * (1 / 3), (1 / 3 : ℚ) * 3) = (1, 1) := by
  sorry

example : ((3 : ℚ)⁻¹, (1 / 3 : ℚ)⁻¹) = (1 / 3, 3) := by
  sorry

variable {k n : Type*} [CommRing k] [Fintype n] [DecidableEq n]

/-- Coevaluation/evaluation in a basis, with B the dual inverse action. -/
lemma two_leg_trace_algebra (A B : Matrix n n k) :
    (∑ i, ∑ j, A i j * B j i) = Matrix.trace (A * B) := by
  sorry

-- The identity tuple gives n=2; the scalar is not normalized by assuming it is 1.
example : Matrix.trace ((1 : Matrix (Fin 2) (Fin 2) ℚ) * 1) = 2 := by
  sorry

-- The one-dimensional datum computes χ(γ₁)/χ(γ₂), rather than their product.
example (a b : ℚ) (hb : b ≠ 0) :
    Matrix.trace ((fun (_ _ : Fin 1) => a) * (fun (_ _ : Fin 1) => b⁻¹)) = a / b := by
  sorry

-- Vanishing nilpotent off-diagonal entries illustrates what traces fail to detect.
example : Matrix.trace (fun i j : Fin 2 => if i = j then (1 : ℚ) else if i < j then 1 else 0) =
    Matrix.trace (1 : Matrix (Fin 2) (Fin 2) ℚ) := by
  sorry

end NormalizationAndTrace
end TauCeti.ES7

/-!
Named omission ledger — ES7/gap/prototypes

The following signatures need the native supplier carriers stated in the roadmap.
They are mathematical specifications there, not Lean declarations here. Names listed
as partial above cover only their explicitly stated algebraic components.

ExcursionOperatorsAndSpectralAction:ES7:parabolic/stratum-maps
  omitted: PsiGb.embedding_independent, PsiGb.excursion, PsiGb.excursion_test

ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/maximal-orders
  omitted: DOrder.local, DOrder.split_equiv, DOrder.change_lattice, DOrder.ramification, DOrder.rank_one_test, DOrder.matrix_test, DOrder.integral_nonunit_test

ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/euler-poincare-function
  omitted: EulerPoincareFunction, EulerPoincareFunction.central, EulerPoincareFunction.haar_rescale, EulerPoincareFunction.support, EulerPoincareFunction.rank_one_test, EulerPoincareFunction.haar_test, EulerPoincareFunction.orientation_test

ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/D-elliptic-sheaf
  omitted: DEllipticSheaf, DEllipticSheaf.zero, DEllipticSheaf.period, DEllipticSheaf.ext, DEllipticSheaf.pullback, DEllipticSheaf.matrix_case, DEllipticSheaf.rank_test, DEllipticSheaf.frobenius_test, DEllipticSheaf.matrix_test

ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/level-structure
  omitted: DEllipticLevel, DEllipticLevel.restrict, DEllipticLevel.pullback, DEllipticLevel.frobenius_test, DEllipticLevel.nested_test, DEllipticLevel.zero_test

ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/moduli-and-hecke
  omitted: DEllipticModuli, DEllipticModuli.points, DEllipticModuli.level_map, DEllipticModuli.dimension, DEllipticModuli.projective, DEllipticModuli.rank_one_test, DEllipticModuli.shift_test, DEllipticModuli.level_at_o_test

ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/frobenius-hecke-correspondences
  omitted: DEllipticHecke, DEllipticHecke.mul, DEllipticHecke.frobenius, DEllipticHecke.level, DEllipticHecke.identity_test, DEllipticHecke.level_test, DEllipticHecke.right_left_test

ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/special-formal-module
  omitted: SpecialFormalODModule, SpecialFormalODModule.lie, SpecialFormalODModule.baseChange, SpecialFormalODModule.dimension, SpecialFormalODModule.rank_one_test, SpecialFormalODModule.eigenspaces_test, SpecialFormalODModule.dimension_only_test

ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/fundamental-local-representation
  omitted: U, U.threeActions, U.compactInduction, U.centralQuotient, U.level, U.degree_test, U.stabilizer_test, U.coproduct_test

ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/cuspidal-local-selector
  omitted: CuspidalSelector, CuspidalSelector.value_one, CuspidalSelector.trace, CuspidalSelector.support, CuspidalSelector.value_test, CuspidalSelector.central_test, CuspidalSelector.indicator_test

Named theorems whose native geometric statements are omitted:
  ExcursionOperatorsAndSpectralAction:ES7:parabolic/coefficient-reduction
  ExcursionOperatorsAndSpectralAction:ES7:parabolic/basic-case-and-quasisplit-reduction
  ExcursionOperatorsAndSpectralAction:ES7:parabolic/increasingly-unstable-sequence
  ExcursionOperatorsAndSpectralAction:ES7:parabolic/constant-term-computation
  ExcursionOperatorsAndSpectralAction:ES7:parabolic/parabolic-induction
  ExcursionOperatorsAndSpectralAction:ES7:parabolic/normalised-induction-dictionary
  ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison/two-tower-realisation
  ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison/two-leg-excursion-is-a-trace
  ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison/trace-determines-semisimplification
  ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison/supercuspidal-agreement
  ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison/all-irreducible-representations
  ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/division-quotient-compactness
  ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/discrete-spectrum
  ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/kernel-trace-identity
  ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/euler-poincare-orbital-integrals
  ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/euler-poincare-character-traces
  ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/simple-trace-comparison
  ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/globalisation
  ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/jacquet-langlands-transfer
  ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/special-formal-modules
  ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/uniformisation
  ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/local-cohomology-finiteness
  ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/global-cohomology
  ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/geometric-automorphic-trace
  ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/dual-isotypic-pairing
  ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/kaiser-erratum
  ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/kaiser-graded-chain-lemma
  ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/kaiser-graded-chain-proposition
  ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/selected-isotypic-cohomology
  ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/local-correspondence-independence
  ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/classical-local-correspondence
  ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/local-character-identity
  ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/geometric-hochschild-serre
  ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/hochschild-serre-and-degeneration
  ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/drinfeld-carayol
  ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/hecke-fibre-transport
  ExcursionOperatorsAndSpectralAction:ES7/agreement-for-every-local-field
  ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison/classical-centre-agreement

Each omission remains an unchecked blueprint target. No aliases to generic
propositions are introduced to simulate these declarations. In particular the
D-elliptic Frobenius map, D̄ uniformization factor, triple stabilizer, finite-order
central quotient, selected isotypic concentration, and Kaiser dual/q-exponent
correction are specified in the reader document and packet.
-/
