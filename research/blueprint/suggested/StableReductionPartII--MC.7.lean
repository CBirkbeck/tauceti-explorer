import Mathlib.AlgebraicGeometry.Sites.Fpqc
import Mathlib.CategoryTheory.Sites.Subcanonical
import Mathlib.CategoryTheory.Core
import TauCeti.AlgebraicGeometry.LineBundle.Class

/-!
# Level Picard parameters: native carrier checks

This file is not the roadmap and is not exhaustive. The accompanying roadmap
document is definitive. These statements suggest Lean forms so contributors
and reviewers can converge on names and signatures. No implementation is claimed.
The reader gives the full targets, hypotheses, API and tests.
Only light definitions over carriers present at the pinned libraries appear here.

`representedFppf` is the actual representable fppf sheaf of a scheme.
`parameterFiber` is its actual fibre over a prescribed base morphism.
`lineGroupoid` retains only the isomorphisms of invertible sheaves, whereas
`LineBundleClass` records their isomorphism classes.

These checks do not construct a moduli scheme or a relative Picard sheaf.
MC.7's degree condition, relative Picard comparison, lift groupoid, cohomological
obstruction, Pic(T)-torsor and dual-number deformation comparison require the
native suppliers listed in the reader. They are README targets; they are not
represented by synthetic carriers or by structures with assumed conclusions.
-/

open AlgebraicGeometry CategoryTheory Opposite
open TauCeti.AlgebraicGeometry

namespace StableReductionPartII.MC7

universe u

/-- The native fppf sheaf represented by a scheme. -/
abbrev representedFppf (P : Scheme.{u}) :=
  Scheme.fppfTopology.yoneda.obj P

/-- Points over a fixed base morphism, in the actual represented sheaf. -/
abbrev parameterFiber {P M T : Scheme.{u}} (p : P ⟶ M) (t : T ⟶ M) :=
  {x : (representedFppf P).obj.obj (op T) // x ≫ p = t}

/-- The actual fixed-curve line-bundle groupoid; noninvertible maps are removed. -/
abbrev lineGroupoid (X : Scheme.{u}) :=
  Core (InvertibleSheaf X)

/-- Forget a line-bundle object down to its native absolute isomorphism class. -/
def lineClass {X : Scheme.{u}} (L : lineGroupoid X) : LineBundleClass X :=
  LineBundleClass.mk L.of

/-- The fixed-curve part of MC.7/actual-triples-groupoid uses isomorphisms,
not arbitrary maps of the underlying modules. -/
theorem lineClass_eq_iff {X : Scheme.{u}} (L K : lineGroupoid X) :
    lineClass L = lineClass K ↔ Nonempty (L ⟶ K) := by
  sorry

/-- Tensor on the native carriers agrees with the existing class operation. -/
theorem lineClass_tensor {X : Scheme.{u}} (L K : lineGroupoid X) :
    lineClass (⟨InvertibleSheaf.tensorProduct L.of K.of⟩ : lineGroupoid X) =
      lineClass L * lineClass K := by
  sorry

/-- The sheaf's restriction acts by actual composition of scheme morphisms. -/
example {P T U : Scheme.{u}} (a : U ⟶ T)
    (x : (representedFppf P).obj.obj (op T)) :
    (representedFppf P).obj.map a.op x = a ≫ x := by
  sorry

/-- Fibre membership includes the equation over the base. -/
example {P M T : Scheme.{u}} (p : P ⟶ M) (t : T ⟶ M)
    (x : parameterFiber p t) : x.val ≫ p = t := by
  sorry

/-- Test the unit against Tau Ceti's actual trivial invertible sheaf. -/
example (X : Scheme.{u}) :
    lineClass (⟨InvertibleSheaf.trivial X⟩ : lineGroupoid X) =
      (1 : LineBundleClass X) := by
  sorry

/-- An actual line-bundle isomorphism supplies a morphism in the groupoid. -/
example {X : Scheme.{u}} (L K : lineGroupoid X) (e : L.of ≅ K.of) :
    Nonempty (L ⟶ K) := by
  sorry

end StableReductionPartII.MC7

/-!
## Reader targets requiring missing native geometric carriers

The following are names of omitted targets, not Lean declarations.
Their exact hypotheses, carriers and source locators are in the reader.

* `fineFamily_functions`: The required native smooth-projective genus-g level-family predicate and universal family are not at the pins.
* `levelPicard_representedComparison`: The relative degree-d fppf Picard sheaf and its represented scheme are owner targets, not pinned carriers.
* `actualTriples_stackAndClass`: The varying curve/level groupoid, degree predicate, actual line-bundle pullback and their stack comparison are not supplied at the pins.
* `picardLift_groupoid`: Requires the actual relative class map and its native groupoid fibre on Sch/T.
* `picardLift_obstruction`: Requires the geometric G_m sheaf and actual fppf site pushforward/class comparison; an arbitrary H²-valued function is not this boundary.
* `picardLift_classesTorsor`: Requires actual Pic(T) and relative class fibre with its pullback tensor action. The current library group exists after the pin; the pin supplies only the class monoid.
* `picardLift_neutralization`: Requires actual line-bundle pullback and its fully faithful comparison, not an assumed abstract groupoid equivalence.
* `picard_fixedCurveInfinitesimals`: Requires the actual relative Picard scheme and its dual-number reduction map, plus the coherent-cohomology comparison.
* `consumer_av_contract`: Requires the exact native moduli stacks/schemes, family equivalences and morphisms in this consumer composition; none is replaced with proposition fields.
* `consumer_clp_contract`: Requires the exact native moduli stacks/schemes, family equivalences and morphisms in this consumer composition; none is replaced with proposition fields.
* `consumer_chen_contract`: Requires the exact native moduli stacks/schemes, family equivalences and morphisms in this consumer composition; none is replaced with proposition fields.
* `consumer_dgh_contract`: Requires the exact native moduli stacks/schemes, family equivalences and morphisms in this consumer composition; none is replaced with proposition fields.
* `consumer_landesman_litt_contract`: Requires the exact native moduli stacks/schemes, family equivalences and morphisms in this consumer composition; none is replaced with proposition fields.
* `consumer_yuan_contract`: Requires the exact native moduli stacks/schemes, family equivalences and morphisms in this consumer composition; none is replaced with proposition fields.

The following APIs and tests are likewise mathematical reader specifications,
not signatures checked by this compact file:

### actual-triples-groupoid

API: `actualTriples_pullback`, `actualTriples_morphism`, `actualTriples_relativeClass`, `actualTriples_fixedCurveCore`, `actualTriples_scalarAut`, `actualTriples_tensor`.

Tests: `scalar-inertia`, `base-twist`, `noninvertible-map`, `tensor-class`.

### lift-gerbe

API: `picardLift_objects`, `picardLift_localNonempty`, `picardLift_band`, `picardLift_baseChange`.

Tests: `geometric-field`, `pointed-normalization`, `base-twist-locality`.

### lift-torsor

API: `liftClasses_action`, `liftClasses_difference`, `liftClasses_nonempty`, `liftClasses_chooseOrigin`, `liftGroupoid_neutralization`, `liftClasses_baseChange`, `liftClasses_pointedNormalization`.

Tests: `nontrivial-base-Picard`, `field-scalar`, `section-normalization`, `empty-fibre-convention`.

These omissions are required by the compact-shape rule: no invented moduli,
relative Picard, cohomology or torsor carrier substitutes for a missing native
geometric interface. See the reader and packet prototypeCoverage for the exact
boundary between elaborated fragments and full mathematical targets.
-/
