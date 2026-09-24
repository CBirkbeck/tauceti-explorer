/-
This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/CohomologyComparisons.md` is definitive. These
statements suggest Lean forms so that contributors and reviewers can converge on
names and signatures. They claim no implementation.

BP-CohomologyComparisons: partial prototype, implementationStatus = unchecked.
Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.
No Lean toolchain at those commits was available in this session, so elaboration
has not been established.

Imported and never invented here: the A_inf-cohomology theory itself and its
period comparison (AInfCohomology AI.0 and AI.0:period-comparison), the input
package of Theorems 14.1 and 14.3 (AI.2, AI.5), crystalline base change and the
Frobenius isogeny for smooth qcqs schemes over a perfect field
(CrystallineCohomology CR.3), and Kisin's functor with Breuil-Kisin module theory
and Scholze's de Rham comparison (PadicHodgeTheory R06.2).

Already pinned and cited rather than rebuilt: `WittVector`, `TruncatedWittVector`,
`PreTilt`, `WittVector.fontaineTheta`, `BDeRhamPlus`, `BDeRham`, `Module.length`,
`Module.rank`. A_inf is NOT noetherian, which is why every hypothesis below is
finite PRESENTATION and why the coherence lemma has to be proved.

CP.1, CP.4 and CP.6 have no decomposed source and nothing is prototyped for them.
-/
import Mathlib.Algebra.Homology.DerivedCategory.Basic
import Mathlib.Algebra.Homology.HomologicalComplex
import Mathlib.AlgebraicGeometry.Scheme
import Mathlib.LinearAlgebra.Dimension.Finrank
import Mathlib.RingTheory.AdicCompletion.Basic
import Mathlib.RingTheory.Artinian.Defs
import Mathlib.RingTheory.Flat.Basic
import Mathlib.RingTheory.Length
import Mathlib.RingTheory.LocalRing.Defs
import Mathlib.RingTheory.Perfectoid.BDeRham
import Mathlib.RingTheory.Perfectoid.FontaineTheta
import Mathlib.RingTheory.Perfection
import Mathlib.RingTheory.Valuation.Basic
import Mathlib.RingTheory.WittVector.Truncated

noncomputable section

namespace TauCeti.CohomologyComparisons

/-! ## CP.0 Common objects, coefficient maps and normalization -/

/-- CP.0/ainf-specialization-dictionary. Four specializations, named, with the
convention that the residue one sends the chosen element to zero and is Frobenius on
`W(k)`. `θ` is Mathlib's `WittVector.fontaineTheta` and is not rebuilt. -/
structure AinfSpecialization where
  theta : True
  residue : True
  tilt : True
  crystalline : True
  mu_unit : True

example : True := by sorry -- unit test: θ agrees with the pinned fontaineTheta on
                           -- Teichmüller lifts

example : True := by sorry -- unit test: the residue convention; the opposite one
                           -- changes every Frobenius-equivariance statement below

example : True := by sorry -- unit test: μ is a unit in W(C♭)

example : True := by sorry -- unit test: all four entries are named, because the later
                           -- statements say which one they use

/-- CP.0/coherence-of-witt-vectors-of-perfectoid-integers. A_inf is not noetherian;
this is what makes finite presentation the right hypothesis. -/
theorem coherence_truncatedWitt : True := by sorry

/-! ## CP.2 Rational crystalline comparison and descent -/

/-- CP.2/rational-crystalline-comparison-over-C (BMS1 Theorem 14.5(i)). -/
theorem rational_crystalline_over_C : True := by sorry

/-- CP.2/rational-crystalline-base-change-along-residue-section. -/
theorem rational_crystalline_base_change : True := by sorry

/-- CP.2/crystalline-comparison-over-discretely-valued-base. -/
theorem crystalline_comparison_dvr : True := by sorry

/-! ## CP.3 Canonical B_dR^+ deformation and de Rham comparison -/

/-- CP.3/good-reduction-bdr-lattice-identification. The construction of the
B_dR^+-cohomology and its compatibility with the explicit complex were only partly
read; that is a gap. -/
theorem good_reduction_bdr_lattice : True := by sorry

/-! ## CP.5 Integral torsion inequalities and lattice recovery

Fourteen nodes, in two halves: linear algebra over A_inf, then the arithmetic
conclusions it buys. The packet's structural proposal is about that split. -/

/-- CP.5/perfectness-and-tor-bounds-for-ainf-modules. -/
theorem ainf_perfectness_tor_bounds : True := by sorry

/-- CP.5/ainf-module-structure-theorem. -/
theorem ainf_module_structure : True := by sorry

/-- CP.5/specialization-length-inequality: length goes UP under specialization. -/
theorem specialization_length_le : True := by sorry

/-- CP.5/witt-versus-tilt-specialization-inequality: rank equal, length only
inequal. -/
theorem witt_versus_tilt : True := by sorry

/-- CP.5/derived-to-degreewise-witt-specialization: the two specializations differ,
and the comparison is an injectivity statement plus an adjustment. -/
theorem derived_vs_degreewise : True := by sorry

/-- CP.5/finite-presentation-and-freeness-criterion. -/
theorem finite_presentation_freeness : True := by sorry

/-- CP.5/mu-inverted-freeness-criterion. -/
theorem mu_inverted_freeness : True := by sorry

/-- CP.5/crystalline-de-rham-torsionfreeness-equivalence. -/
theorem crystalline_deRham_torsionfree_iff : True := by sorry

/-- CP.5/length-monotonicity-under-torsion-cokernel. -/
theorem length_monotone_torsion_cokernel : True := by sorry

/-- CP.5/integral-torsion-length-inequality-over-C (BMS1 Theorem 14.5(ii)):
crystalline torsion dominates étale torsion. -/
theorem crystalline_torsion_dominates : True := by sorry

/-- CP.5/lattice-recovery-over-C. -/
theorem lattice_recovery_over_C : True := by sorry

/-- CP.5/dvr-lattice-recovery-via-breuil-kisin. -/
theorem lattice_recovery_dvr : True := by sorry

/-- CP.5/dvr-torsion-length-inequality (BMS1 Theorem 14.6(ii)). The G_K- and
Frobenius-compatibility of 14.6(i) is not displayed in the source and is a gap. -/
theorem dvr_torsion_inequality : True := by sorry

/-- CP.5/mod-p-de-rham-dimension-bound (BMS1 inequality (1)). -/
theorem mod_p_deRham_bounds_etale : True := by sorry

example : True := by sorry -- unit test: the inequality is one-directional; equality
                           -- is false in general, which §2's counterexamples show

end TauCeti.CohomologyComparisons
