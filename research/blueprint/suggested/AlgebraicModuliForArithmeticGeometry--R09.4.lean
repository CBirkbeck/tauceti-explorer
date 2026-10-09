/-
This file is not the roadmap and is not exhaustive. The corresponding R09.4 reader is
definitive. These statements suggest Lean forms so that contributors and reviewers
converge on names and signatures; they make no implementation claim.

The pinned baseline has schemes, group objects and abelian varieties over fields, but
no native carrier for algebraic stacks, generalized elliptic curves or relative dual
abelian schemes. Missing conditions and statements are omitted explicitly below,
never represented by arbitrary Prop fields. Elaboration verifies only the signatures
that are present. The packet's G-native gap covers every omitted signature.
-/
import Mathlib.AlgebraicGeometry.Morphisms.Smooth
import Mathlib.AlgebraicGeometry.Morphisms.Proper
import Mathlib.AlgebraicGeometry.Geometrically.Connected
import Mathlib.CategoryTheory.Monoidal.Cartesian.Over
import Mathlib.RingTheory.RootsOfUnity.Basic
import Mathlib.Algebra.TrivSqZeroExt.Basic
import Mathlib.Data.ZMod.Basic
import TauCeti.AlgebraicGeometry.AbelianVariety.Basic

universe u
open CategoryTheory CategoryTheory.Limits CategoryTheory.MonoidalCategory
  CategoryTheory.CartesianMonoidalCategory AlgebraicGeometry MonObj

noncomputable section
namespace TauCeti.ArithmeticModuli

/-- The relative object; no polarization or fixed dimension is part of this carrier. -/
structure AbelianScheme (S : Scheme.{u}) where
  toOver : Over S
  grpObj : GrpObj toOver
  smooth : Smooth toOver.hom
  isProper : IsProper toOver.hom
  geometricallyConnected : GeometricallyConnected toOver.hom

attribute [instance] AbelianScheme.grpObj AbelianScheme.smooth
  AbelianScheme.isProper AbelianScheme.geometricallyConnected

namespace AbelianScheme
variable {S T : Scheme.{u}}

abbrev toScheme (A : AbelianScheme S) : Scheme.{u} := A.toOver.left
abbrev zeroSection (A : AbelianScheme S) : S ⟶ A.toScheme := η[A.toOver].left

lemma zeroSection_comp (A : AbelianScheme S) :
    A.zeroSection ≫ A.toOver.hom = 𝟙 S := by sorry

def baseChange (A : AbelianScheme S) (f : T ⟶ S) : AbelianScheme T where
  toOver := (Over.pullback f).obj A.toOver
  grpObj := Functor.grpObjObj
  smooth := inferInstanceAs (Smooth (pullback.snd A.toOver.hom f))
  isProper := inferInstanceAs (IsProper (pullback.snd A.toOver.hom f))
  geometricallyConnected := inferInstanceAs
    (GeometricallyConnected (pullback.snd A.toOver.hom f))

lemma baseChange_toOver (A : AbelianScheme S) (f : T ⟶ S) :
    (A.baseChange f).toOver = (Over.pullback f).obj A.toOver := by sorry

lemma commutative (A : AbelianScheme S) : IsCommMonObj A.toOver := by sorry

def ofAbelianVariety {K : Type u} [Field K]
    (A : TauCeti.AlgebraicGeometry.AbelianVariety K) : AbelianScheme (Spec (.of K)) where
  toOver := A.toOver
  grpObj := inferInstance
  smooth := inferInstance
  isProper := inferInstance
  geometricallyConnected := inferInstance

def toAbelianVariety {K : Type u} [Field K]
    (A : AbelianScheme (Spec (.of K))) : TauCeti.AlgebraicGeometry.AbelianVariety K where
  toOver := A.toOver
  grpObj := inferInstance
  isProper := inferInstance
  geometricallyIntegral := by sorry

lemma field_roundtrip {K : Type u} [Field K]
    (A : TauCeti.AlgebraicGeometry.AbelianVariety K) :
    (ofAbelianVariety A).toAbelianVariety = A := by sorry

def zeroDimensional (S : Scheme.{u}) : AbelianScheme S where
  toOver := 𝟙_ (Over S)
  grpObj := by infer_instance
  smooth := inferInstanceAs (Smooth (𝟙 S))
  isProper := inferInstanceAs (IsProper (𝟙 S))
  geometricallyConnected := by sorry

-- AbelianScheme.zero_dimension: Spec K with the trivial law is allowed.
example (K : Type u) [Field K] :
    (zeroDimensional (Spec (.of K))).toOver.hom = 𝟙 (Spec (.of K)) := by sorry

-- AbelianScheme.field_agreement: the native field object is recovered, including its law.
example (K : Type u) [Field K] (A : TauCeti.AlgebraicGeometry.AbelianVariety K) :
    (ofAbelianVariety A).toAbelianVariety = A := by sorry

-- AbelianScheme.nonproper_excluded: applies in particular to G_m; no properness is dropped.
example (G : Over S) (hG : ¬ IsProper G.hom) (A : AbelianScheme S) :
    A.toOver ≠ G := by sorry

lemma zeroPreserving_isMonHom (A B : AbelianScheme S)
    (f : A.toOver ⟶ B.toOver)
    (hf : η[A.toOver] ≫ f = η[B.toOver]) : IsMonHom f := by sorry

end AbelianScheme

namespace StandardNgon

/-- Only the smooth-locus point group, not a replacement for the glued proper scheme. -/
abbrev smoothPoints (R : Type u) [CommRing R] (n : ℕ) :=
  Rˣ × Multiplicative (ZMod n)

def smoothScale {R : Type u} [CommRing R] {n : ℕ} [NeZero n]
    (ζ : rootsOfUnity n R) : smoothPoints R n ≃* smoothPoints R n := by sorry

lemma smoothScale_apply {R : Type u} [CommRing R] {n : ℕ} [NeZero n]
    (ζ : rootsOfUnity n R) (x : Rˣ) (i : ZMod n) :
    smoothScale ζ (x, Multiplicative.ofAdd i) =
      ((ζ : Rˣ) ^ i.val * x, Multiplicative.ofAdd i) := by sorry

def smoothInversion (R : Type u) [CommRing R] (n : ℕ) :
    smoothPoints R n ≃* smoothPoints R n := by sorry

lemma smoothInversion_apply {R : Type u} [CommRing R] {n : ℕ}
    (x : Rˣ) (i : ZMod n) :
    smoothInversion R n (x, Multiplicative.ofAdd i) =
      (x⁻¹, Multiplicative.ofAdd (-i)) := by sorry

lemma smoothScale_commutes_inversion {R : Type u} [CommRing R]
    {n : ℕ} [NeZero n] (ζ : rootsOfUnity n R) :
    (smoothScale ζ).trans (smoothInversion R n) =
      (smoothInversion R n).trans (smoothScale ζ) := by sorry

-- StandardNgon.one_component: the smooth locus of the nodal one-gon is G_m.
example (R : Type u) [CommRing R] :
    Subsingleton (Multiplicative (ZMod 1)) := by sorry

-- PolygonAutomorphisms.one_component: the scaling factor is trivial for n = 1.
example (R : Type u) [CommRing R] : Subsingleton (rootsOfUnity 1 R) := by sorry

-- PolygonAutomorphisms.infinitesimal: geometric points alone miss mu_3 in characteristic 3.
example : ∃ ζ : rootsOfUnity 3 (TrivSqZeroExt (ZMod 3) (ZMod 3)),
    ζ ≠ 1 ∧ TrivSqZeroExt.fst ((ζ : (TrivSqZeroExt (ZMod 3) (ZMod 3))ˣ) :
      TrivSqZeroExt (ZMod 3) (ZMod 3)) = 1 := by sorry

-- Native algebraic fragments of the corrected split one-gon model (source issue E2).
lemma splitOnegon_parametrization {R : Type u} [CommRing R] (u : R) :
    (u ^ 2 * (u + 1)) ^ 2 +
      (u * (u + 1)) * (u ^ 2 * (u + 1)) = (u * (u + 1)) ^ 3 := by sorry

example : (-1 : ZMod 2) ≠ 0 := by sorry

end StandardNgon
end TauCeti.ArithmeticModuli

/- BEGIN NAMED OMISSIONS — G-native

These are exact mathematical contracts, not Lean declarations. The carrier/condition
named in each entry must exist before its signature is introduced. No Prop stand-in
or private substitute is used. A typed fragment is expressly narrower than the full
geometric contract. The definitive reader contains hypotheses, proofs and sources.

OMITTED construction R094.standard_ngon
  Contract: For every scheme S and integer n≥1 construct the proper flat finitely presented nodal genus-one S-curve C_n by cyclically identifying ∞ on component i of n copies of P¹_S with 0 on component i+1. For n=1 identify the two sections of one P¹. Its smooth locus is the S-group G_m×(Z/nZ)_S with identity (1,0), and its translation action extends to C_n. All constructions commute with arbitrary base change.
  Hypotheses: S arbitrary; n is positive.
  Required carrier/input: mathlib:AlgebraicGeometry.Scheme, ModularCurves#0c-finite-quotients-and-torsors, ModularCurves#0a-relative-effective-cartier-divisors; see G-native and the node-specific gap in the packet.
OMITTED API StandardNgon.baseChange (functoriality): C_n×_S T is canonically C_n over T, respecting zero and translation.
PARTIAL API StandardNgon.smoothPoints: the ring-valued smooth group is typed above; its identification with the proper curve smooth-locus functor and its naturality are omitted.
OMITTED API StandardNgon.normalization (projection): The canonical relative normalization is the disjoint union of n projective lines with the specified two branches at each node; this is not a claim about absolute normalization over a nonnormal base.
OMITTED API StandardNgon.nodeCharts (characterisation): Every node has the standard xy=0 chart; n=1 still has two normalization flags.
OMITTED example StandardNgon.one_component (degenerate): C_1 is the rational nodal genus-one curve; its smooth locus is G_m, not a smooth elliptic curve. A split cubic model over every base is y²z+xyz=x³, with normalization x=u(u+1), y=u²(u+1); the two branches u=0,−1 are distinct even in characteristic two.
  Typed fragments above only test ZMod 1 and the split-cubic parametrization; proper curve/node statements require the missing carrier.
OMITTED example StandardNgon.two_components (computation): C_2 has two components meeting at two distinct nodes and smooth component group Z/2Z.
OMITTED example StandardNgon.base_change_nonreduced (compatibility): The same normalization and xy=0 node charts persist over k[ε]/ε²; the construction does not discard nilpotents.

OMITTED definition R094.generalized_elliptic
  Contract: A generalized elliptic curve over S is a proper flat finitely presented curve E→S whose geometric fibres are smooth connected genus-one curves or Néron polygons, a commutative group law with zero on E^sm, and an action E^sm×_S E→E extending that law. On polygon fibres translations act by rotations on the cyclic component graph, equivalently trivially on Pic⁰. Isomorphisms are S-isomorphisms respecting zero, law and action. Pullback uses the native scheme fibre product.
  Hypotheses: S arbitrary. The action condition is part of the definition, beyond fibrewise shape.
  Required carrier/input: arith-standard-ngon, ModularCurves#1d-the-scheme-theoretic-group-law, ModularCurves#1e-the-cubic-polarisation-and-elliptic-descent; see G-native and the node-specific gap in the packet.
OMITTED API GeneralizedEllipticCurve.smoothLocus (projection): Expose the native smooth open and its commutative group object.
OMITTED API GeneralizedEllipticCurve.pullback (functoriality): Arbitrary scheme base change preserves all data, with identity/composition coherence.
OMITTED API GeneralizedEllipticCurve.smoothEquivalence (equivalence): The full smooth subcategory is equivalent to ModularCurves Layer 1 elliptic families and their zero-preserving isomorphisms.
OMITTED API GeneralizedEllipticCurve.iso_ext (extensionality): Isomorphisms equal on the universally schematically dense smooth locus are equal on E.
OMITTED API GeneralizedEllipticCurve.ofStandardNgon (constructor): The standard polygon carries the law and action above.
OMITTED example GeneralizedEllipticCurve.smooth_agreement (compatibility): A smooth elliptic family with its existing law gives exactly the same generalized object.
OMITTED example GeneralizedEllipticCurve.nodal_onegon (degenerate): The standard one-gon is admitted, including its inversion.
OMITTED example GeneralizedEllipticCurve.twisted_two_gon_excluded (non-example): Over A=k[ε,ε′]/(ε,ε′)², the two-gon with node parameters ε and ε′ has no such group/action structure, even fpqc locally (Conrad Example 2.1.11 and Remark 2.1.13).

OMITTED construction R094.degeneracy
  Contract: For a generalized elliptic curve f:E→S, let E^sing be cut out by Fitt_1(Ω¹_{E/S}), and S^∞ its schematic image in S. This closed subscheme decomposes locally finitely into open-and-closed pieces S^∞_n with n-gon fibres; E is fppf locally the standard n-gon over each piece. E^sing and S^∞, including the component-count pieces, commute with arbitrary base change.
  Hypotheses: f is generalized elliptic, not just a DR semistable genus-one curve.
  Required carrier/input: arith-generalized-elliptic, ModularCurves#0a-relative-effective-cartier-divisors; see G-native and the node-specific gap in the packet.
OMITTED API GeneralizedEllipticCurve.singularSubscheme (projection): The relative Fitting ideal cuts out the nonsmooth locus.
OMITTED API GeneralizedEllipticCurve.degeneracyBaseChange (functoriality): S^∞(E_T)=S^∞(E)×_S T as closed subschemes.
OMITTED API GeneralizedEllipticCurve.polygonTrivialization (characterisation): Over S^∞_n the generalized curve is fppf locally C_n.
OMITTED example GeneralizedEllipticCurve.polygon_degeneracy (computation): For C_n/S the degeneracy subscheme is all of S.
OMITTED example GeneralizedEllipticCurve.smooth_degeneracy (degenerate): For a smooth elliptic family the degeneracy subscheme is empty.
OMITTED example GeneralizedEllipticCurve.bare_curve_image_failure (non-example): The twisted two-gon over A above has S^∞=Spec A, but pullback along ε=ε′ has degeneracy Spec k inside Spec(k[ε]/ε²); hence the base-change theorem cannot be generalized to bare curves.

OMITTED theorem R094.polygon_automorphisms
  Contract: Aut_S(C_n) as a generalized elliptic curve is the group scheme µ_n×(Z/2Z)_S. A root ζ scales the coordinate on component i by ζ^i; the second factor acts by (t,i)↦(t⁻¹,−i). These actions commute. The formula is natural on all test schemes, including nonreduced ones; it is not merely a formula for algebraically closed points.
  Hypotheses: n≥1; automorphisms preserve the identity and generalized group/action structure.
  Required carrier/input: arith-standard-ngon, arith-generalized-elliptic, mathlib:rootsOfUnity; see G-native and the node-specific gap in the packet.

OMITTED construction R094.contraction
  Contract: For a proper flat finitely presented semistable genus-one curve E/S and a relative effective Cartier divisor D⊂E^sm finite locally free of positive rank, construct c_D(E) by contracting precisely fibre components disjoint from D, uniquely as the relative projective contraction and compatibly with arbitrary base change. Its smooth locus is the image of the open subgroup of E^sm consisting of retained components when E is generalized elliptic and D=G is a finite locally free subgroup. In that subgroup case the contraction inherits a unique generalized law and action, G becomes ample, and the map restricts to an isomorphism from the retained-component open in E^sm onto c_G(E)^sm.
  Hypotheses: The general divisor construction yields a curve, not an asserted group object. The subgroup case uses a generalized elliptic input and a finite locally free subgroup. The contraction is not the scheme quotient E/G.
  Required carrier/input: arith-generalized-elliptic, arith-degeneracy, ModularCurves#0a-relative-effective-cartier-divisors, StableReduction#layer-2-coherent-curve-theory-duality-and-positivity, StableReduction#layer-3-prestable-semistable-stable-and-pointed-curves; see G-native and the node-specific gap in the packet.
OMITTED API GenusOneCurve.contractDivisor (constructor): Construct the relative projective contraction for a positive finite locally free smooth Cartier divisor; with a subgroup divisor it agrees with GeneralizedEllipticCurve.contract.
OMITTED API GeneralizedEllipticCurve.contract (constructor): Construct c_G(E) with its map and smooth law.
OMITTED API GeneralizedEllipticCurve.contract_baseChange (functoriality): Pullback identifies the contracted curves and maps.
OMITTED API GeneralizedEllipticCurve.contract_componentCriterion (characterisation): Exactly the components missing G are contracted.
OMITTED API GeneralizedEllipticCurve.contract_unique (universal-property): The target and map are unique up to the specified commuting isomorphism.
OMITTED example GeneralizedEllipticCurve.contract_smooth (compatibility): On a smooth elliptic curve contraction is the identity.
OMITTED example GeneralizedEllipticCurve.contract_to_one (degenerate): On C_n the zero subgroup meets only the identity component and contracts to C_1.
OMITTED example GeneralizedEllipticCurve.contract_all_components (computation): The subgroup {1}×Z/nZ meets every component and the contraction of C_n is the identity.
OMITTED example GenusOneCurve.divisor_without_law (non-example): A divisor meeting selected components of a bare semistable genus-one curve produces its curve contraction, but supplies neither a zero nor a group action; the output is not automatically generalized elliptic.

OMITTED construction R094.fixed_elliptic_moduli
  Contract: For n≥1, form the groupoid-valued contravariant moduli pseudofunctor E_n on schemes over Z: objects are generalized elliptic curves whose singular geometric fibres are n-gons; arrows are the isomorphisms above. Keep all smooth elliptic fibres, including supersingular ones. The closed cusp E_n^∞ is defined by the schematic degeneracy locus. The open E_n^{n-ord} removes only smooth supersingular points in characteristics dividing n.
  Hypotheses: n≥1 is fixed, not allowed to jump among different polygon sizes.
  Required carrier/input: arith-generalized-elliptic, arith-degeneracy, stack-in-groupoids; see G-native and the node-specific gap in the packet.
OMITTED API FixedEllipticModuli.fibre (data): Objects and zero-preserving isomorphisms over S form the specified groupoid.
OMITTED API FixedEllipticModuli.pullback (functoriality): Pullback gives coherent contravariant transition functors.
OMITTED API FixedEllipticModuli.smoothOpen (compatibility): Its smooth open is the existing elliptic moduli groupoid.
OMITTED API FixedEllipticModuli.boundary (projection): The cusp is the closed subfunctor whose pulled-back degeneracy closed subscheme is all of S.
OMITTED API FixedEllipticModuli.ordinaryOpen (projection): Only the indicated supersingular smooth geometric points are removed.
OMITTED example FixedEllipticModuli.smooth_inertia (non-example): Inversion of a smooth elliptic curve is a nonidentity arrow, including characteristic two; its fibre is not a discrete set.
OMITTED example FixedEllipticModuli.standard_polygon (computation): C_n lies in E_n^∞ with automorphism group scheme µ_n×C₂.
OMITTED example FixedEllipticModuli.wrong_polygon (non-example): For m≠n, C_m is excluded although every smooth elliptic curve is included.

OMITTED theorem R094.elliptic_descent
  Contract: E_n is an fpqc stack in groupoids. Effective descent includes the proper curve, the smooth group law, its extension action and the fixed component-count condition, not only descent of an underlying sheaf of isomorphism classes.
  Hypotheses: n≥1; arbitrary scheme bases and fpqc covers.
  Required carrier/input: arith-fixed-elliptic-moduli, qcoh-fpqc-descent, stack-in-groupoids, ModularCurves#1e-the-cubic-polarisation-and-elliptic-descent; see G-native and the node-specific gap in the packet.

OMITTED theorem R094.onegon_weierstrass
  Contract: Let U⊂Spec Z[a₁,a₂,a₃,a₄,a₆] be the open where the ideal (Δ,c₄) is the unit ideal, so every geometric cubic fibre is smooth or nodal. Let G be the smooth integral Weierstrass coordinate-change group with parameters u∈G_m and r,s,t∈G_a. Its universal noncuspidal cubic, with zero at infinity and the generalized action, identifies E_1≃[U/G]. The presentation U→E_1 is smooth and surjective; E_1 is algebraic, DM and smooth over Z of relative dimension one.
  Hypotheses: Only the irreducible smooth-or-one-gon fibres occur. The characteristic-two nodal model uses y²z+xyz=x³, not the erroneous printed cubic of E2.
  Required carrier/input: arith-elliptic-descent, arith-polygon-automorphisms, ModularCurves#1c-pole-sheaves-weierstrass-coordinates-and-variable-changes, ModularCurves#1e-the-cubic-polarisation-and-elliptic-descent, ModularCurves#4b-the-weierstrass-presentation, StableReduction#layer-2-coherent-curve-theory-duality-and-positivity, quotient-stack-algebraic, deligne-mumford-stack; see G-native and the node-specific gap in the packet.

OMITTED construction R094.cyclic_atlas_moduli
  Contract: For n≥1 let B_n(S) classify E∈E_n(S) and an ample finite étale subgroup G⊂E^sm that is étale locally isomorphic to (Z/nZ)_S. Ampleness means that every geometric fibre component meets G. Isomorphisms preserve G without choosing a generator.
  Hypotheses: No invertibility assumption on n. Subgroup étaleness is required even in residue characteristic dividing n.
  Required carrier/input: arith-fixed-elliptic-moduli, ModularCurves#0c-finite-quotients-and-torsors; see G-native and the node-specific gap in the packet.
OMITTED API CyclicAtlasModuli.forget (projection): Forget G to obtain E_n.
OMITTED API CyclicAtlasModuli.pullback (functoriality): Pullback preserves the subgroup and ampleness.
OMITTED API CyclicAtlasModuli.generatorQuotient (characterisation): The subgroup space is the free (Z/nZ)ˣ quotient of its generator space.
OMITTED API CyclicAtlasModuli.oneEquivalence (equivalence): B_1≃E_1, since the unique subgroup is the zero section and every allowed singular fibre is a one-gon.
OMITTED example CyclicAtlasModuli.one (degenerate): B_1≃E_1 with the same automorphisms.
OMITTED example CyclicAtlasModuli.polygon (computation): On C_n, G={1}×Z/nZ is an ample finite étale cyclic subgroup over every base.
OMITTED example CyclicAtlasModuli.supersingular_missing (non-example): A supersingular elliptic curve over an algebraically closed field of characteristic p|n has no such subgroup of order n.

OMITTED theorem R094.cyclic_atlas_dm
  Contract: B_n is a Deligne–Mumford stack smooth over Z of relative dimension one.
  Hypotheses: n≥1; the subgroup has exactly the properties in the preceding definition.
  Required carrier/input: arith-cyclic-atlas-moduli, arith-elliptic-descent, arith-contraction, deligne-mumford-stack, ModularCurves#4b-the-weierstrass-presentation, ModularCurves#0b-finite-locally-free-group-schemes-and-cartier-duality, arith-onegon-weierstrass; see G-native and the node-specific gap in the packet.

OMITTED theorem R094.cyclic_atlas_cover
  Contract: B_n→E_n factors through E_n^{n-ord} and there is representable, separated, quasi-finite, faithfully flat and locally finitely presented. Together with the smooth open M_ell⊂E_n these maps cover E_n. The B_n map is not asserted étale, and for p|n is not surjective onto supersingular smooth elliptic curves.
  Hypotheses: n≥1.
  Required carrier/input: arith-cyclic-atlas-moduli, arith-cyclic-atlas-dm, arith-fixed-elliptic-moduli; see G-native and the node-specific gap in the packet.

OMITTED theorem R094.fixed_elliptic_algebraic
  Contract: For each n≥1, E_n is an algebraic stack smooth over Spec Z of relative dimension one.
  Hypotheses: Use the fpqc groupoid carrier above; no assumption n is invertible.
  Required carrier/input: arith-elliptic-descent, arith-cyclic-atlas-cover, arith-cyclic-atlas-dm, algebraic-stack, stack-presentation, ModularCurves#4b-the-weierstrass-presentation, arith-onegon-weierstrass; see G-native and the node-specific gap in the packet.

OMITTED theorem R094.elliptic_finite_diagonal
  Contract: For E,E′∈E_n(S), the scheme Isom_S(E,E′) of generalized-elliptic isomorphisms is finite over S, compatibly with arbitrary base change. Thus E_n has finite diagonal and is separated over Z.
  Hypotheses: The two curves have the same geometric polygon count at common singular points.
  Required carrier/input: arith-fixed-elliptic-moduli, arith-polygon-automorphisms, arith-fixed-elliptic-algebraic, AlgebraicModuliForArithmeticGeometry:R09.2, stack-morphism-properties, StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces, StableReduction#layer-5-regular-and-minimal-models; see G-native and the node-specific gap in the packet.

OMITTED theorem R094.elliptic_proper
  Contract: E_n→Spec Z is proper for every n≥1, in addition to its finite diagonal and relative smoothness.
  Hypotheses: Properness is a stack property, not properness of every presenting scheme.
  Required carrier/input: arith-elliptic-finite-diagonal, arith-fixed-elliptic-algebraic, arith-contraction, StableReduction#layer-7-semistable-reduction, stack-morphism-properties; see G-native and the node-specific gap in the packet.

OMITTED theorem R094.elliptic_dm_locus
  Contract: The maximal Deligne–Mumford open of E_n is the complement of the cusp fibres over Spec(Z/nZ). In particular E_1 is DM over Z, and E_n is DM over Z[1/n]. Smooth supersingular fibres remain DM, even when p|n.
  Hypotheses: n≥1.
  Required carrier/input: arith-elliptic-finite-diagonal, arith-polygon-automorphisms, deligne-mumford-stack, inertia; see G-native and the node-specific gap in the packet.

OMITTED theorem R094.elliptic_cusp
  Contract: E_n^∞ is canonically equivalent to B(µ_n×C₂), is reduced and smooth over Z of relative dimension zero, and is a relative effective Cartier divisor in E_n. Spec Z→E_n^∞ supplied by C_n is finite locally free of rank 2n.
  Hypotheses: n≥1; reduced means the stack is reduced, not that every stabilizer group scheme is reduced.
  Required carrier/input: arith-degeneracy, arith-polygon-automorphisms, arith-fixed-elliptic-algebraic, quotient-stack, quotient-stack-algebraic, ModularCurves#0a-relative-effective-cartier-divisors; see G-native and the node-specific gap in the packet.

OMITTED theorem R094.elliptic_tame
  Contract: The cusp E_n^∞ is tame exactly over Z[1/2], with no need to invert n. E_n over Z[1/6] is tame. In characteristic two its generic smooth stabilizer contains constant C₂ and is not linearly reductive, although the smooth moduli remains DM. Thus tameness, DM and properness are separate properties.
  Hypotheses: Tameness means exact invariants for finite geometric stabilizers, using the finite-inertia criterion.
  Required carrier/input: arith-elliptic-cusp, arith-elliptic-finite-diagonal, arith-elliptic-dm-locus, tame-stack, tame-local-structure, ModularCurves#4b-the-weierstrass-presentation; see G-native and the node-specific gap in the packet.

NATIVE API AbelianScheme.toScheme (projection): Expose the underlying native scheme from the Over carrier. The signature is typed above within its namespace.
NATIVE API AbelianScheme.zeroSection (projection): Expose its group-object unit S→A. The signature is typed above within its namespace.
NATIVE API AbelianScheme.zeroSection_comp (simp): The zero section composed with the structure map is the identity on S. The signature is typed above within its namespace.
NATIVE API AbelianScheme.baseChange (functoriality): Pullback gives an abelian scheme, with its native group object. The signature is typed above within its namespace.
NATIVE API AbelianScheme.baseChange_toOver (compatibility): Its Over object is exactly the native Over.pullback object. The signature is typed above within its namespace.
NATIVE API AbelianScheme.commutative (instance): Every such group object is commutative. The signature is typed above within its namespace.
NATIVE API AbelianScheme.ofAbelianVariety (coercion): The existing field abelian variety gives a relative object over Spec K. The signature is typed above within its namespace.
NATIVE API AbelianScheme.toAbelianVariety (coercion): The field restriction gives the existing geometrically integral abelian variety. The signature is typed above within its namespace.
NATIVE API AbelianScheme.field_roundtrip (compatibility): The field adapter followed by its inverse recovers the original native abelian variety. The signature is typed above within its namespace.
NATIVE API AbelianScheme.zeroDimensional (constructor): The identity S→S with its trivial group law is an abelian scheme. The signature is typed above within its namespace.
NATIVE API AbelianScheme.zeroPreserving_isMonHom (characterisation): An Over morphism between abelian schemes preserving their zero sections is a native IsMonHom morphism; no second bundled homomorphism carrier is required. The signature is typed above within its namespace.
NATIVE API AbelianScheme.relativeDimension (data): The dimension of the geometric fibre defines a locally constant function on S; fixing g means this function is everywhere g. Pullback composes this function with the map on base points. The signature is typed above within its namespace.
NATIVE API AbelianScheme.fieldEquivalence (equivalence): Over Spec K, the two native object adapters extend to an equivalence of zero-preserving isomorphism groupoids with Tau Ceti abelian varieties, compatible with extension of fields and the native underlying Over objects. The signature is typed above within its namespace.

OMITTED theorem R094.relative_abelian_rigidity
  Contract: A zero-preserving S-morphism from an abelian scheme to a separated S-group scheme is a group homomorphism. A homomorphism with zero geometric fibres is zero. For A/S of dimension g, [N]:A→A is finite locally free of rank N^(2g) for N≥1 and finite étale when N is invertible on S; kernel A[N] and these assertions commute with arbitrary base change.
  Hypotheses: For rigidity A is proper smooth with geometrically connected fibres; for multiplication g is constant.
  Required carrier/input: arith-abelian-scheme, JacobianChallenge#layer-e-abelian-varieties, JacobianChallenge#layer-c-relative-coherent-cohomology-and-base-change, mathlib:CategoryTheory.IsMonHom; see G-native and the node-specific gap in the packet.

OMITTED construction R094.relative_dual
  Contract: For A/S an abelian scheme, represent its fppf sheaf of rigidified fibrewise algebraically trivial line bundles by an abelian scheme A∨/S, with normalized Poincaré line bundle on A×_S A∨. Duals commute with arbitrary base change; evaluation gives A≃A∨∨ and morphisms dualize contravariantly. The field restriction agrees with the dual in JacobianChallenge Layer E.
  Hypotheses: Rigidification along zero and fibrewise algebraic triviality are part of the functor. No higher-tier dual construction is a prerequisite.
  Required carrier/input: arith-abelian-scheme, arith-relative-abelian-rigidity, JacobianChallenge#layer-e-abelian-varieties, JacobianChallenge#layer-c-relative-coherent-cohomology-and-base-change, AlgebraicModuliForArithmeticGeometry:R09.1; see G-native and the node-specific gap in the packet.
OMITTED API AbelianScheme.dual (constructor): Construct the abelian scheme representing the rigidified Pic⁰ sheaf.
OMITTED API AbelianScheme.poincare (data): Give its line bundle normalized on both zero sections.
OMITTED API AbelianScheme.dual_baseChange (functoriality): (A_T)∨≃(A∨)_T with the Poincaré data.
OMITTED API AbelianScheme.bidual (equivalence): Evaluation gives the canonical group isomorphism A≃A∨∨.
OMITTED API AbelianScheme.dualMap (functoriality): A homomorphism A→B induces B∨→A∨ contravariantly.
OMITTED example AbelianScheme.dual_zero (degenerate): The dual of the dimension-zero identity scheme is itself.
OMITTED example AbelianScheme.dual_field (compatibility): Over Spec K the relative dual is the existing Layer E dual with the same normalized pairing.
OMITTED example AbelianScheme.dual_product (computation): (A×_S B)∨≃A∨×_S B∨, with Poincaré line bundle the tensor product of the two pullbacks.

OMITTED definition R094.polarization
  Contract: A polarization is a homomorphism λ:A→A∨ whose every geometric fibre equals φ_L:x↦t_x*L⊗L⁻¹ for an ample line bundle L. A degree parameter d≥1 means λ is finite locally free of rank d²; on a g-dimensional fibre h⁰(L)=d. Principal means d=1. The moduli object is λ, not a global choice of L. An isomorphism f:(A,λ)→(B,µ) obeys f∨∘µ∘f=λ.
  Hypotheses: A/S an abelian scheme of constant dimension g≥0. For g=0 only d=1 occurs.
  Required carrier/input: arith-relative-dual, arith-relative-abelian-rigidity, JacobianChallenge#layer-e-abelian-varieties; see G-native and the node-specific gap in the packet.
OMITTED API Polarization.toHom (projection): Expose the group homomorphism A→A∨.
OMITTED API Polarization.degree (characterisation): The kernel is finite locally free of rank d².
OMITTED API Polarization.ofAmple (constructor): A fibrewise ample line bundle induces λ with the stated degree.
OMITTED API Polarization.pullback (functoriality): Base change preserves the polarization and its degree.
OMITTED API Polarization.isoCriterion (characterisation): Isomorphisms satisfy the dual-conjugation equation.
OMITTED API Polarization.principal (characterisation): Principal is equivalent to λ being an isomorphism.
OMITTED example Polarization.dimension_zero (degenerate): On the identity abelian scheme the unique polarization has d=1; d>1 is impossible.
OMITTED example Polarization.elliptic_degree (computation): On an elliptic curve O(m·0), m≥1, induces [m] under the principal dual identification and has kernel rank m² and d=m.
OMITTED example Polarization.negative_excluded (non-example): On an elliptic curve the map induced by O(−0) is not a polarization; symmetry alone is insufficient.

OMITTED theorem R094.local_ample_representatives
  Contract: Every polarization admits a representing ample line bundle fppf locally on S; if 2 is invertible it does so étale locally. Over an Artin local base, a chosen representing line bundle on the residue fibre lifts with a lifting polarization. For two representing bundles, their difference is an A∨-section; it is a translate globally only when that section is in λ(A(S)), but it is a translate fppf locally.
  Hypotheses: Line bundles are understood up to pullback from S, or rigidified at zero.
  Required carrier/input: arith-polarization, arith-relative-dual, JacobianChallenge#layer-c-relative-coherent-cohomology-and-base-change; see G-native and the node-specific gap in the packet.

OMITTED construction R094.canonical_bounded_bundle
  Contract: For (A/S,λ) of dimension g and degree d², M=(id,λ)*Poincaré, normalized along zero, is relatively ample and represents 2λ. M³ is relatively very ample, and for r≥1 the pushforward f_*(M^(3r)) is locally free of rank d(6r)^g with arbitrary base-change compatibility. The corresponding Hilbert polynomial is P(t)=d(6t)^g.
  Hypotheses: A has constant dimension g; the Poincaré bundle is normalized; g=0,d=1 gives the constant polynomial one.
  Required carrier/input: arith-polarization, arith-relative-dual, JacobianChallenge#layer-c-relative-coherent-cohomology-and-base-change, JacobianChallenge#layer-e-abelian-varieties; see G-native and the node-specific gap in the packet.
OMITTED API Polarization.canonicalBundle (constructor): Construct the rigidified bundle M with φ_M=2λ.
OMITTED API Polarization.canonicalBundle_baseChange (functoriality): M formation commutes with arbitrary pullback.
OMITTED API Polarization.cubicVeryAmple (characterisation): M³ gives a relative closed immersion after locally choosing a frame of its pushforward.
OMITTED API Polarization.sectionRank (characterisation): For r≥1 the section rank is d(6r)^g.
OMITTED API Polarization.hilbertPolynomial (data): Expose P(t)=d(6t)^g for the Hilbert owner.
OMITTED example Polarization.canonical_elliptic (computation): For an elliptic principal polarization M has degree two, M³ degree six and h⁰=6.
OMITTED example Polarization.canonical_zero (degenerate): For g=0,d=1, M³ is the trivial bundle and its pushforward has rank one.
OMITTED example Polarization.canonical_degree_distinction (non-example): For g=1,d=2 the rank is 12, not 6 and not 24; rank ker λ is 4.

OMITTED construction R094.polarized_abelian_moduli
  Contract: For g≥0,d≥1 form A_{g,d}(S), the groupoid of dimension-g abelian schemes with a polarization of degree d² and dual-compatible isomorphisms. It is an fppf stack. Neither a global representing line bundle nor a level structure is part of its objects.
  Hypotheses: Base schemes are over Z; the g=0,d>1 stack is empty.
  Required carrier/input: arith-abelian-scheme, arith-polarization, arith-local-ample-representatives, stack-in-groupoids, qcoh-fpqc-descent; see G-native and the node-specific gap in the packet.
OMITTED API PolarizedAbelianModuli.fibre (data): Its fibre is the stated groupoid of (A,λ) and isomorphisms.
OMITTED API PolarizedAbelianModuli.pullback (functoriality): Its transition functors use the native pullback and commute coherently.
OMITTED API PolarizedAbelianModuli.forget (projection): Forget λ to the relative abelian-scheme groupoid.
OMITTED API PolarizedAbelianModuli.fppfDescent (characterisation): The actual groupoid satisfies effective fppf descent.
OMITTED API PolarizedAbelianModuli.ellipticEquivalence (equivalence): A_{1,1} is equivalent to smooth elliptic moduli via its canonical principal polarization.
OMITTED example PolarizedAbelianModuli.elliptic (compatibility): A_{1,1} is smooth elliptic moduli with its automorphisms, not its j-line coarse space.
OMITTED example PolarizedAbelianModuli.minus_one (non-example): [−1] on a positive-dimensional polarized abelian variety is an automorphism; the unlevelled fibre is not a discrete set.
OMITTED example PolarizedAbelianModuli.zero (degenerate): A_{0,1} is the terminal stack and A_{0,d} is empty for d>1.

OMITTED construction R094.full_level
  Contract: For N≥1 invertible on S, a full level-N structure on A/S of dimension g is an isomorphism of finite étale group schemes α:(Z/NZ)_S^(2g)≃A[N]. It is an ordered basis with no symplectic pairing imposed. Define A_{g,d}[N] by these structures and polarization-compatible isomorphisms preserving α.
  Hypotheses: N is invertible on S. Scheme rigidity requires N≥3; the definition allows N=1,2.
  Required carrier/input: arith-relative-abelian-rigidity, arith-polarized-abelian-moduli, torsor; see G-native and the node-specific gap in the packet.
OMITTED API FullLevel.torsionBasis (data): Expose α as an isomorphism of the two finite étale group schemes.
OMITTED API FullLevel.baseChange (functoriality): The basis pulls back with the kernel and constant group.
OMITTED API FullLevel.changeBasis (structure): Precomposition gives the free transitive basis action of GL_{2g}(Z/NZ).
OMITTED API FullLevel.forget (projection): The forgetful map is a finite étale GL torsor over the unlevelled stack on Z[1/N].
OMITTED example FullLevel.two_inversion (non-example): On a positive-dimensional abelian variety in characteristic≠2, [−1] is nontrivial and fixes every full level-two structure.
OMITTED example FullLevel.three_rigid (characterisation): For N=3 invertible, a polarized automorphism fixing a full basis is the identity.
OMITTED example FullLevel.bad_characteristic (non-example): For an elliptic curve in characteristic p, E[p] has rank p² but is not an étale constant rank-two p-basis group; the definition cannot extend unchanged.

OMITTED theorem R094.polarized_automorphism_rigidity
  Contract: For a polarized abelian variety over an algebraically closed field, the polarization-preserving automorphism group scheme is finite étale. If N≥3 is invertible and an automorphism is the identity on A[N], it is the identity on A. The relative polarized Isom functor is unramified; infinitesimal homomorphisms fixing the special fibre vanish by relative rigidity.
  Hypotheses: The field finite-group statement needs positivity of λ, not only symmetry.
  Required carrier/input: arith-full-level, arith-relative-abelian-rigidity, arith-canonical-bounded-bundle, JacobianChallenge#layer-e-abelian-varieties; see G-native and the node-specific gap in the packet.

OMITTED construction R094.framed_polarized_parameter
  Contract: For fixed g,d construct the scheme H_{g,d} of triples (A,λ,β), where (A,λ) is polarized abelian and β is a frame of f_*M³ of rank r=d6^g, modulo simultaneous scalar frames. Its tautological embedding lies in P^(r−1) with polynomial d(6t)^g. The forgetful map is a PGL_r torsor over A_{g,d}, with the equivariant universal polarized family. Adding full level gives H_{g,d}[N].
  Hypotheses: For g=0,d>1 the parameter scheme is empty. Canonical M eliminates the arbitrary representing-line-bundle choice.
  Required carrier/input: arith-canonical-bounded-bundle, arith-polarized-abelian-moduli, arith-full-level, AlgebraicModuliForArithmeticGeometry:R09.2, torsor; see G-native and the node-specific gap in the packet.
OMITTED API PolarizedFrames.hilbertMap (projection): Map the tautological embedded family to the existing Hilbert scheme with polynomial d(6t)^g.
OMITTED API PolarizedFrames.universalFamily (data): Carry the universal group scheme and λ compatible with its canonical cubic embedding.
OMITTED API PolarizedFrames.frameTorsor (characterisation): Forgetting the projective frame is a PGL_r torsor over the groupoid.
OMITTED API PolarizedFrames.baseChange (functoriality): The representing scheme and universal family commute with base change.
OMITTED example PolarizedFrames.elliptic_rank (computation): For g=d=1 the canonical ambient space is P⁵, not P².
OMITTED example PolarizedFrames.scalar (characterisation): A frame and its nonzero scalar multiple give the same projective frame.
OMITTED example PolarizedFrames.missing_law (non-example): A smooth embedded genus-one curve without zero and λ is not a point of H_{1,1}; Hilbert polynomial alone is insufficient.

OMITTED theorem R094.fine_polarized_scheme
  Contract: For N≥3, A_{g,d}[N] over Z[1/N] is represented by a quasi-projective scheme carrying its universal polarized abelian scheme with full level. For d arbitrary no symplectic level pairing is imposed. The forgetful map is a finite étale GL_{2g}(Z/NZ) torsor in the stack sense.
  Hypotheses: g≥0,d≥1,N≥3. Empty components cause no exception.
  Required carrier/input: arith-framed-polarized-parameter, arith-polarized-automorphism-rigidity, arith-full-level, fine-moduli-space, finite-group-quotient; see G-native and the node-specific gap in the packet.

OMITTED theorem R094.polarized_algebraic_dm
  Contract: A_{g,d} is an algebraic Deligne–Mumford stack of finite type over Z. On Z[1/N], N≥3, it is equivalent to [A_{g,d}[N]/GL_{2g}(Z/NZ)]. The level-three and level-four schemes give a representable étale surjective atlas after taking their disjoint union over Z[1/3] and Z[1/4], which cover Spec Z.
  Hypotheses: g≥0,d≥1; the entire degree component, including primes dividing d.
  Required carrier/input: arith-framed-polarized-parameter, arith-fine-polarized-scheme, arith-full-level, quotient-stack-algebraic, deligne-mumford-stack; see G-native and the node-specific gap in the packet.

OMITTED theorem R094.polarized_finite_diagonal
  Contract: For two dimension-g degree-d² polarized abelian schemes over S, the polarization-preserving Isom functor is represented by a finite unramified S-scheme, with arbitrary base-change compatibility. Consequently A_{g,d} has finite diagonal and is separated over Z.
  Hypotheses: S arbitrary; no invertibility assumption on d.
  Required carrier/input: arith-polarized-algebraic-dm, arith-polarized-automorphism-rigidity, arith-relative-abelian-rigidity, AlgebraicModuliForArithmeticGeometry:R09.2, stack-morphism-properties, JacobianChallenge#layer-e-abelian-varieties; see G-native and the node-specific gap in the packet.

OMITTED theorem R094.polarized_small_extension_lifting
  Contract: Let R′→R be a square-zero surjection of Artin local rings with algebraically closed residue field k, and (A,λ)/R a dimension-g degree-d² polarized abelian scheme. If d is invertible in k, (A,λ) lifts to R′; the chosen ample representative on a residue fibre can be lifted compatibly. For fixed kernel I killed by the maximal ideal, the lifting obstruction is the polarization cup-product obstruction and vanishes because λ is separable.
  Hypotheses: d prime to char(k). For full level N also invertible, the existing basis lifts uniquely. No assertion for inseparable polarizations.
  Required carrier/input: arith-local-ample-representatives, arith-relative-abelian-rigidity, arith-polarization, JacobianChallenge#layer-c-relative-coherent-cohomology-and-base-change; see G-native and the node-specific gap in the packet.

OMITTED theorem R094.polarized_smooth
  Contract: A_{g,d} is smooth over Z[1/d] of relative dimension g(g+1)/2. For N≥3 its fine full-level scheme is smooth over Z[1/(Nd)] of the same relative dimension.
  Hypotheses: g≥0,d≥1. No smoothness assertion at primes dividing d.
  Required carrier/input: arith-polarized-algebraic-dm, arith-polarized-small-extension-lifting, arith-fine-polarized-scheme, stack-morphism-properties; see G-native and the node-specific gap in the packet.

OMITTED theorem R094.abelian_separation_tameness
  Contract: A_{g,d} is separated of finite type with finite inertia, is tame in characteristic zero, and in characteristic p is tame exactly when each geometric polarization-preserving automorphism group has order prime to p. The family A_{1,1} is not proper over Z: an elliptic curve with multiplicative reduction over a trait has no abelian-scheme extension, although it extends in E_1. In characteristic two its generic constant inversion inertia is wild.
  Hypotheses: The positive-characteristic test uses the finite étale automorphism theorem, not the degree d alone. No compactification is an object of A_{g,d}.
  Required carrier/input: arith-polarized-finite-diagonal, arith-polarized-automorphism-rigidity, arith-polarized-abelian-moduli, arith-elliptic-proper, tame-stack, tame-local-structure, ModularCurves#4b-the-weierstrass-presentation, StableReduction#layer-7-semistable-reduction; see G-native and the node-specific gap in the packet.

END NAMED OMISSIONS -/
