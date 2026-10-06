/-
This file is not the roadmap and is not exhaustive. The roadmap document
research/blueprint/readmes/HabiroNumberFields--HB.7.md is definitive.
These statements suggest Lean forms so that contributors and reviewers
converge on names and signatures. They claim no implementation.

BP-HabiroNumberFields--HB.7, Codex — codex-f2eyXf.
Independent review REV-HabiroNumberFields--HB.7, Codex — codex-7ZyIf0.
Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

The true rational coefficient and conditional Picard-character signatures
below use the existing Mathlib objects. The module family and its unit/tensor
equivalences in the Picard section are explicit parameters for conclusions
of the global-descent/tensor targets, not presumed proofs of those targets.

Actual indexed Habiro modules, Coleman functions, and K3 transfer torsors
are not available at the pins. Their names/signatures/API/tests are recorded
as expressly omitted declarations below, with the missing objects named.
No arbitrary set, uninterpreted Prop, or theorem-valued structure field
replaces a missing condition. The parent suggested file is not imported:
it is a prototype, not a built library supplying those objects.
-/
import Mathlib.RingTheory.PowerSeries.Log
import Mathlib.RingTheory.PowerSeries.Exp
import Mathlib.RingTheory.PowerSeries.Substitution
import Mathlib.RingTheory.PicardGroup
import Mathlib.RingTheory.Norm.Basic
import Mathlib.RingTheory.Norm.Transitivity

noncomputable section

open scoped TensorProduct

namespace TauCeti.HabiroNF.HB7Followup

section Coefficient

variable {L L' : Type*} [Field L] [CharZero L] [Field L'] [CharZero L']

/-- The first jet after removing the Kummer constant. Analytic use excludes z=1. -/
def halfShiftLinearCoeff (z r : L) : L := -z / (24 * r * (1 - z))

lemma halfShiftLinearCoeff_map (ι : L →+* L') (z r : L) :
    ι (halfShiftLinearCoeff z r) = halfShiftLinearCoeff (ι z) (ι r) := by
  sorry

lemma halfShiftLinearCoeff_scale (z r a : L) (ha : a ≠ 0) :
    halfShiftLinearCoeff z (a * r) = halfShiftLinearCoeff z r / a := by
  sorry

lemma halfShiftLinearCoeff_neg_one (r : L) :
    halfShiftLinearCoeff (-1) r = 1 / (48 * r) := by
  sorry

/-- Test halfShiftLinearCoeff_minus_one: the half-shift gives a positive coefficient. -/
example : halfShiftLinearCoeff (-1 : ℚ) 1 = 1 / 48 := by
  sorry

/-- Test halfShiftLinearCoeff_two: an algebraic test of the rational function's sign. -/
example : halfShiftLinearCoeff (2 : ℚ) 1 = 1 / 12 := by
  sorry

/-- Test halfShiftLinearCoeff_level: x/r contributes the inverse root coordinate. -/
example : halfShiftLinearCoeff (-1 : ℚ) 2 = 1 / 96 := by
  sorry

/-- Test halfShiftLinearCoeff_even_root: at r=zeta_2=-1 the x/r sign reverses. -/
example : halfShiftLinearCoeff (-1 : ℚ) (-1) = -1 / 48 := by
  sorry

/-- This does not extend the analytic formula to z=1. -/
example : ¬ IsUnit (1 - (1 : ℚ)) := by
  sorry

end Coefficient

section FormalJets

variable {A : Type*} [CommRing A] [Algebra ℚ A]

/-- Algebraic step in followup-half-shift-first-jet:
exp of a zero-constant formal series has its same linear coefficient. -/
theorem coeff_one_formal_exp (g : PowerSeries A)
    (hg : PowerSeries.constantCoeff g = 0) :
    PowerSeries.coeff 1 ((PowerSeries.exp A).subst g) =
      PowerSeries.coeff 1 g := by
  sorry

/-- The constant term is one, independently of higher coefficients. -/
theorem constantCoeff_formal_exp (g : PowerSeries A)
    (hg : PowerSeries.constantCoeff g = 0) :
    PowerSeries.constantCoeff ((PowerSeries.exp A).subst g) = 1 := by
  sorry

/-- Integral-linear-jet's weighted-product step.
All exponents are scalars in the rational coefficient algebra; in the
application they are images of integral p-adic scalars. -/
theorem coeff_one_weighted_product {ι : Type*} [Fintype ι]
    (g : ι → PowerSeries A) (a : ι → A)
    (hg : ∀ i, PowerSeries.constantCoeff (g i) = 0) :
    PowerSeries.coeff 1 (∏ i, (PowerSeries.exp A).subst (a i • g i)) =
      ∑ i, a i * PowerSeries.coeff 1 (g i) := by
  sorry

-- halfShiftFirstJet: not stated as an actual analytic theorem.
-- Needs imported regularized Pochhammer logarithm from the accepted
-- HB.7/pochhammer-sections and D.1. Exact target: with
-- h=log(1+x/zeta_m), the formal sqrt(q^m) is exp(m*h/2),
-- with constant 1, zeta != 1, p>3 unramified,
-- the normalized U has constant 1 and coeff 1 = halfShiftLinearCoeff zeta zeta_m.
-- Its formal log is sum_{k>=2} B_k(1/2)/k! * m^(k-2) * Li_{2-k}(zeta)*h^(k-1).
-- The Bernoulli computation and regularization are specified in the reader.
-- At even m this half power need not be the ordinary monomial q^(m/2).
-- For m=2, zeta_m=-1, zeta=-1, the branch-one coefficient is -1/48;
-- the monomial q instead gives Pochhammer input 1 at the expansion point.

-- integralLinearJet: not stated. Needs the D.3 valid finite presentation,
-- the integer subrings of all local factors, and actual normalized U above.
-- Exact target: coefficient -sum a_zeta*zeta/(24*zeta_m*(1-zeta)) belongs
-- to O[zeta_m], p>3 unramified, m prime to p, zeta nontrivial prime-to-p.
-- No p=2/3 or zeta=1 extension; higher coefficients may be rational.

end FormalJets

section PicardCharacterForms

universe u
variable {H G : Type u} [CommRing H] [AddCommGroup G]
variable (M : G → Type u)
variable [∀ g, AddCommGroup (M g)] [∀ g, Module H (M g)]
variable [∀ g, Module.Invertible H (M g)]

/-- Picard character using the supplied zero and tensor equivalences. -/
def k3PicardMap
    (e0 : M 0 ≃ₗ[H] H)
    (eadd : ∀ g h, (M g ⊗[H] M h) ≃ₗ[H] M (g + h)) :
    G →+ Additive (CommRing.Pic H) := by
  sorry

-- CommRing.Pic.mk_eq_mk_iff transports e0 and eadd to Picard equalities;
-- mk_self and mk_tensor then supply the additive-homomorphism laws.

variable (e0 : M 0 ≃ₗ[H] H)
variable (eadd : ∀ g h, (M g ⊗[H] M h) ≃ₗ[H] M (g + h))

lemma k3PicardMap_apply (g : G) :
    k3PicardMap M e0 eadd g =
      Additive.ofMul (CommRing.Pic.mk H (M g)) := by
  sorry

lemma k3PicardMap_zero :
    k3PicardMap M e0 eadd 0 = 0 := by
  sorry

lemma k3PicardMap_add (g h : G) :
    k3PicardMap M e0 eadd (g + h) =
      k3PicardMap M e0 eadd g + k3PicardMap M e0 eadd h := by
  sorry

lemma k3PicardMap_neg (g : G) :
    k3PicardMap M e0 eadd (-g) =
      -k3PicardMap M e0 eadd g := by
  sorry

/-- Test k3PicardMap_zero_test. -/
example : k3PicardMap M e0 eadd 0 = 0 := by
  sorry

/-- Test k3PicardMap_inverse_test. -/
example (g : G) :
    k3PicardMap M e0 eadd g + k3PicardMap M e0 eadd (-g) = 0 := by
  sorry

/-- Test k3PicardMap_power_test: identify the actual class, not a constant zero map. -/
example (g : G) (h : CommRing.Pic.mk H (M g) ≠ 1) :
    k3PicardMap M e0 eadd g ≠ 0 ∧
      k3PicardMap M e0 eadd (2 • g) =
        Additive.ofMul (CommRing.Pic.mk H (M g) ^ 2) := by
  sorry

-- HabiroModule.tensorPowerEquiv: not stated; needs actual Habiro modules
-- and their multiplication, then TensorPower n H H_{R,xi} equiv H_{R,n*xi}.
-- Include n=0 and the ring-line identification.
-- HabiroModule.tensorCoherence: not stated; needs actual multiplication
-- maps and unit identification. Assert associativity, symmetry and unit
-- diagrams on pure tensors, not arbitrary eadd coherence.

end PicardCharacterForms

section NormChecks

variable {A : Type*} [CommRing A]

/-- Test norm_split_cross_term: the series norm in a split degree-two algebra
is multiplication, not coefficientwise scalar norm. -/
example (a b : A) :
    PowerSeries.coeff 1
      ((1 + PowerSeries.C a * PowerSeries.X) *
       (1 + PowerSeries.C b * PowerSeries.X)) = a + b ∧
    PowerSeries.coeff 2
      ((1 + PowerSeries.C a * PowerSeries.X) *
       (1 + PowerSeries.C b * PowerSeries.X)) = a * b := by
  sorry

/-- Algebraic norm/Frobenius square: the finite free coefficient algebras
in the application exclude the norm's no-finite-basis fallback. -/
theorem norm_frobenius
    {B : Type*} [CommRing B] [Algebra A B]
    [Module.Free A B] [Module.Finite A B]
    (φA : A ≃+* A) (φB : B ≃+* B)
    (hφ : (algebraMap A B).comp φA = φB.toRingHom.comp (algebraMap A B))
    (b : B) :
    Algebra.norm A (φB b) = φA (Algebra.norm A b) := by
  sorry

/-- The coefficient-algebra component of norm_res; rank is the extension degree,
not a K3 grade. Actual section and torsor transport are still omitted below. -/
theorem norm_scalar
    {B : Type*} [CommRing B] [Algebra A B]
    [Module.Free A B] [Module.Finite A B] (a : A) :
    Algebra.norm A (algebraMap A B a) = a ^ Module.finrank A B := by
  sorry

/-- The coefficient-algebra component of norm_tower, using Algebra.norm_norm. -/
theorem norm_tower
    {B C : Type*} [CommRing B] [CommRing C]
    [Algebra A B] [Algebra A C] [Algebra B C] [IsScalarTower A B C]
    [Module.Free A B] [Module.Finite A B]
    [Module.Free B C] [Module.Finite B C] (c : C) :
    Algebra.norm A (Algebra.norm B c) = Algebra.norm A c := by
  sorry

/-- Test norm_zero_test: finite free nontrivial algebras exclude the fallback
norm=1, including when the section's K3 grade is zero. -/
example {B : Type*} [CommRing B] [Algebra A B]
    [Module.Free A B] [Module.Finite A B] [Nontrivial B] :
    Algebra.norm A (0 : B) = 0 := by
  sorry

end NormChecks

/-
Exact omitted arithmetic declarations. These omissions follow PROTOCOL §13:
the actual imported objects are absent at the pinned libraries. They are
not represented by new arbitrary carriers with unproved predicates.

effectiveGlobalDescent: not stated; needs actual HB.6 Habiro ring and HB.7
global family set, local/rational line maps, and Kummer transition data.
Prove additive closure, finite projective rank one, actual chart base
changes, and conservative detection. G-global-descent is unresolved.

tensorMultiplication_bijective: not stated; needs the actual additive
modules and bilinear family multiplication. Prove Function.Bijective of
the tensor linear map using effective descent, then extract sum f_i*g_i=1.

HabiroModule.baseChange: not stated; needs actual rings/lines, K3 restriction,
M.8 Kummer torsor pullback and D.1/D.4 scalar/regulator naturality.
Signature: semilinear map H_{R,xi} -> H_{S,res xi}, over H_R -> H_S.
HabiroModule.baseChange_coeff: not stated; induced full cyclotomic coefficient
map on each normalized coefficient, torsor transport on the constant.
HabiroModule.baseChange_id: not stated; identity embedding with fixed Delta.
HabiroModule.baseChange_comp: not stated; tower composition with index transport.
HabiroModule.baseChange_smul: not stated; f(a*s)=fRing(a)*f(s).
HabiroModule.baseChange_zero: not stated; zero in each degree maps to zero.
HabiroModule.baseChange_add: not stated; preserves addition within each degree.
HabiroModule.baseChange_mul: not stated; preserves section multiplication,
with res(xi+eta)=res(xi)+res(eta) and the canonical torsor identifications.
HabiroModule.baseChange_ext: not stated; two semilinear comparisons with the
same ring map and torsor identifications agree if all component maps agree.
Test baseChange_identity: not stated; identity on every actual component.
Test baseChange_zero_index: not stated; agreement with the ring map and its unit.
Test baseChange_all_factors: not stated; Q -> Q(i), p=5, Delta divisible by 24,
the local map is Z_5 -> Z_5 x Z_5, a |-> (a,a), retaining both factors.

scalarExtensionEquiv: not stated; needs those maps and actual scalar tensor.
Signature: H_S tensor_{H_R} H_{R,xi} equiv H_{S,res xi} via b tensor f |-> b*f(f).
It depends on G-global-descent; a coefficient map alone is insufficient.
The Picard identity uses CommRing.Pic.mapAlgebra and mk_eq_mk_iff,
with actual Module.Invertible instances supplied by the Picard-character target.

HabiroModule.galois: not stated; needs baseChange for sigma and sigma inverse.
Signature: semilinear equivalence H_{R,xi} -> H_{R,sigma_*xi}, root coordinate fixed.
HabiroModule.galois_coeff: not stated; coefficient sigma and Kummer transport.
HabiroModule.galois_one: not stated; identity automorphism.
HabiroModule.galois_mul: not stated; sigma after tau, including degree transport.
HabiroModule.galois_smul: not stated; sigma(a*s)=sigma(a)*sigma(s).
HabiroModule.galois_section_mul: not stated; sigma(f*g)=sigma(f)*sigma(g)
with transported summed degrees. This differs from automorphism composition.
Test galois_identity: not stated; identity on all degrees.
Test galois_complex_conjugation: not stated; Q(i) conjugation squares to identity,
i goes to -i in the rational coefficient family, abstract zeta_m fixed.
Test galois_changed_index: not stated; sigma_*xi != xi has changed target degree.
No fixed-degree H_R-linear action is substituted for this semilinear action.

localNormDefect: not stated as a section theorem; needs actual local sections,
completed logarithm, D.4 trace naturality and M.8 normed Kummer torsors.
Exact target: completed defect of norm is trace of completed defect;
(p/x)*O_E[zeta_m][[x]] maps into (p/x)*O_F[zeta_m][[x]].
Check both Frobenius conventions and the corrected integral linear shape.
The algebraic norm/Frobenius square above is only one valid component.

HabiroModule.norm: not stated; needs actual global modules, K3 transfer,
full cyclotomic algebras and coherent torsor norm.
Signature: multiplicative map on the total graded sections,
H_{S,xi} -> H_{R,tr xi}; it is not an additive linear map.
HabiroModule.norm_mul: not stated; N(f*g)=N(f)*N(g), transferred summed degree.
HabiroModule.norm_one: not stated; ring unit in zero degree.
HabiroModule.norm_tower: not stated; composition along finite towers.
HabiroModule.norm_res: not stated; N(res f)=f^[E:F], tr(res xi)=[E:F]*xi.
HabiroModule.norm_eval: not stated; Kummer evaluation/norm square, (m,Delta)=1.
HabiroModule.norm_zero: not stated; N(0)=0 in every transferred grade,
since the finite coefficient extension has positive rank [E:F].
HabiroModule.norm_expandAt: not stated; expansion is the determinant norm of
the whole series over the full coefficient algebra with Kummer torsor transport.
Test norm_identity: not stated for actual modules; degree-one identity extension.
Test norm_res_degree_two: not stated; N(res f)=f^2 in degree 2*xi.
Test norm_split_cross_term: elaborated above as an actual power-series test.
Test norm_zero_test: the finite coefficient-algebra component is elaborated above;
the actual Habiro-section assertion also needs the omitted objects and transport.

All field extensions use common Delta divisible by 6 and both discriminants,
all local factors are kept, and no assertion for ramified excluded primes is made.
-/

end TauCeti.HabiroNF.HB7Followup
