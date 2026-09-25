/-
This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/EllipticKTheory.md` is definitive. These statements
suggest Lean forms so that contributors and reviewers can converge on names and
signatures. They claim no implementation.

BP-EllipticKTheory, revised by the independent review REV-EllipticKTheory:
partial prototype, implementationStatus = unchecked.
Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.
Synced with the reviewed packet (52 nodes) and elaborated with the Lean toolchain
of Mathlib 082e2d3 against its prebuilt library: `sorry` is the only warning. The
file imports only Mathlib; the Tau Ceti declarations the packet cites (places of a
function field with their orders and residues, the degree-zero divisor classes of a
Weierstrass function field, the function-field isogenies, the Euler characteristic)
are named in comments and, where a statement needs them, stood in for by variables.

Objects that another roadmap owns appear as `variable`s, never as invented
definitions: the Weierstrass scheme with its charts and zero section (Tau Ceti
ModularCurves layer 1A, imported by request); K-theory of schemes as one contravariant
functor per degree (GeneralAlgebraicKTheory K.1 through SchemeKTheoryOperations S.2)
with proper pushforward (S.2), the localisation boundary (S.3) and Adams operations
(S.6); the Picard group of a scheme (JacobianChallenge layer A); the tame symbol and
K_2 of a field (K2SymbolsBrauer T.2, T.3). Statements about them are forms, true only
once the variables are instantiated by the suppliers. Nothing below encodes a missing
theorem as an assumed structure field or as a placeholder `Prop`, and no statement is
`True`: the structure fields of `RegularProperModel`, `SymbolCertificate` and
`IntegralCertificate` are their actual conditions. `sorry` occurs only as the body of a
declaration or as a proof obligation inside one, never in a statement.

Unit tests are `example`s whose docstring begins "Test `<name>`" with the name the
packet gives. An API item, test or node that cannot be stated honestly yet is a
comment `-- <name>: not stated; needs <missing object>`. The main missing objects are
the projective line and the isogeny [m] as schemes, K-theory with finite coefficients,
motivic cohomology, K_2 of a function field with its tame symbols (K2SymbolsBrauer),
and Tau Ceti's places and divisors of a Weierstrass function field (not imported).
-/
import Mathlib.AlgebraicGeometry.ProjectiveSpectrum.Proper
import Mathlib.AlgebraicGeometry.Morphisms.Smooth
import Mathlib.AlgebraicGeometry.Morphisms.Flat
import Mathlib.AlgebraicGeometry.Geometrically.Integral
import Mathlib.AlgebraicGeometry.FunctionField
import Mathlib.AlgebraicGeometry.ResidueField
import Mathlib.AlgebraicGeometry.Noetherian
import Mathlib.AlgebraicGeometry.EllipticCurve.Projective.Point
import Mathlib.Algebra.Category.Grp.Basic
import Mathlib.Algebra.DirectSum.Basic
import Mathlib.Algebra.Field.ZMod
import Mathlib.CategoryTheory.Limits.Shapes.Pullback.IsPullback.Basic
import Mathlib.LinearAlgebra.TensorProduct.Basic
import Mathlib.NumberTheory.NumberField.Basic
import Mathlib.RingTheory.DedekindDomain.AdicValuation
import Mathlib.RingTheory.RegularLocalRing.Defs

noncomputable section

namespace TauCeti.EllipticK

open AlgebraicGeometry CategoryTheory Opposite

universe u

/-! ## Inputs owned elsewhere

K-theory of schemes is GeneralAlgebraicKTheory K.1 applied through
SchemeKTheoryOperations S.2: one contravariant functor per degree. Proper
pushforward is S.2's, and the boundary of the localisation sequence of a curve is
S.3's; both are variables. -/

section KTheory

variable (K : ℕ → Scheme.{u}ᵒᵖ ⥤ AddCommGrpCat.{u})

/-- `K_n(X)` as an abelian group. -/
abbrev KG (n : ℕ) (X : Scheme.{u}) : Type u := (K n).obj (op X)

/-- `K_n(X) ⊗ ℚ`, the rational K-group. -/
abbrev KQ (n : ℕ) (X : Scheme.{u}) : Type u := TensorProduct ℤ ℚ (KG K n X)

/-- The closed points of a scheme. -/
def ClosedPoint (X : Scheme.{u}) : Type u := {x : X // IsClosed ({x} : Set X)}

/-- Closed points are compared by classical logic. -/
instance (X : Scheme.{u}) : DecidableEq (ClosedPoint X) := Classical.decEq _

/-- The generic stalk, whose spectrum is the generic point of an integral scheme. -/
abbrev genericStalk (X : Scheme.{u}) [IsIntegral X] : CommRingCat.{u} :=
  X.presheaf.stalk (genericPoint X)

/-! ### E.5/pullback-and-pushforward

Pullback along every morphism is the functor itself; pushforward along a proper
morphism of finite Tor-dimension is SchemeKTheoryOperations S.2's, a variable. -/

/-- API `KPullback`: pullback along an arbitrary morphism. -/
def KPullback (n : ℕ) {X Y : Scheme.{u}} (f : X ⟶ Y) : KG K n Y →+ KG K n X :=
  ((K n).map f.op).hom

/-- API `KPullback_comp`: functoriality of pullback. -/
theorem KPullback_comp (n : ℕ) {X Y Z : Scheme.{u}} (f : X ⟶ Y) (g : Y ⟶ Z) :
    KPullback K n (f ≫ g) = (KPullback K n f).comp (KPullback K n g) := by
  simp [KPullback]

variable (push : ∀ (n : ℕ) {X Y : Scheme.{u}} (_f : X ⟶ Y), KG K n X →+ KG K n Y)

/-- API `KPushforward`: pushforward along a proper morphism (of finite Tor-dimension,
which S.2's variable `push` presupposes; its value off proper maps is not used). -/
def KPushforward (n : ℕ) {X Y : Scheme.{u}} (f : X ⟶ Y) [IsProper f] : KG K n X →+ KG K n Y :=
  push n f

/-- API `KPushforward_comp`: functoriality of pushforward. -/
theorem KPushforward_comp (n : ℕ) {X Y Z : Scheme.{u}} (f : X ⟶ Y) (g : Y ⟶ Z) [IsProper f]
    [IsProper g] [IsProper (f ≫ g)] :
    KPushforward K push n (f ≫ g) = (KPushforward K push n g).comp (KPushforward K push n f) := by
  sorry

/-- API `KPushforward_baseChange`: flat base change `g^* f_* = f'_* g'^*`. -/
theorem KPushforward_baseChange (n : ℕ) {P X Y Z : Scheme.{u}} {f' : P ⟶ Y} {g' : P ⟶ X}
    {f : X ⟶ Z} {g : Y ⟶ Z} (h : IsPullback g' f' f g) [IsProper f] [IsProper f'] [Flat g] :
    (KPullback K n g).comp (KPushforward K push n f) =
      (KPushforward K push n f').comp (KPullback K n g') := by
  sorry

-- KPushforward_eq_transfer: not stated; needs the ring-level transfer of a finite flat
-- algebra (SchemeKTheoryOperations S.2), which is not a variable here.

/-- The transfers out of the closed points, `⊕_x K_n(k(x)) → K_n(X)`. -/
def fromClosedPoints (n : ℕ) (X : Scheme.{u}) :
    (DirectSum (ClosedPoint X) fun x => KG K n (Spec (X.residueField x.1))) →+ KG K n X :=
  DirectSum.toAddMonoid fun x => push n (X.fromSpecResidueField x.1)

/-- Restriction to the generic point, `K_n(X) → K_n(F(X))`. -/
def toGeneric (n : ℕ) (X : Scheme.{u}) [IsIntegral X] : KG K n X →+ KG K n (Spec (genericStalk X)) :=
  KPullback K n (X.fromSpecStalk (genericPoint X))

/-! ## E.3 Localisation in degrees zero through three -/

/- The boundary of the localisation sequence of an integral curve,
`K_{n+1}(F(X)) → ⊕_x K_n(k(x))` (SchemeKTheoryOperations S.3). -/
variable (bdry : ∀ (n : ℕ) (X : Scheme.{u}) [IsIntegral X],
  KG K (n + 1) (Spec (genericStalk X)) →+ DirectSum (ClosedPoint X) fun x => KG K n (Spec (X.residueField x.1)))

/-- The hypotheses on a curve used throughout: integral, noetherian, regular, of
dimension at most one. -/
structure IsRegularCurve (X : Scheme.{u}) : Prop where
  isIntegral : IsIntegral X
  isNoetherian : IsNoetherian X
  regular : ∀ x : X, IsRegularLocalRing (X.presheaf.stalk x)
  coheight_le_one : ∀ x : X, Order.coheight x ≤ 1

/-- E.3/localisation-sequence-for-a-curve: exactness of the sequence over ALL closed
points, `⋯ → K_{n+1}(F(X)) → ⊕_x K_n(k(x)) → K_n(X) → K_n(F(X)) → ⋯`. -/
theorem localisation_exact (X : Scheme.{u}) [IsIntegral X] (hX : IsRegularCurve X) (n : ℕ) :
    Function.Exact (bdry n X) (fromClosedPoints K push n X) ∧
      Function.Exact (fromClosedPoints K push n X) (toGeneric K n X) ∧
      Function.Exact (toGeneric K (n + 1) X) (bdry n X) := by
  sorry

/-- E.3/boundaries-in-degrees-one-and-zero: the last map, restriction to the generic
point in degree zero, is the generic rank and is surjective. -/
theorem toGeneric_zero_surjective (X : Scheme.{u}) [IsIntegral X] (hX : IsRegularCurve X) :
    Function.Surjective (toGeneric K 0 X) := by
  sorry

/-- E.3/the-tame-symbol-boundary. `detField` is `K_1(L) ≃ L^×` for a field (KTheoryLowDegrees
U.3) and `tameSym X x` is K2SymbolsBrauer's tame symbol at the closed point `x` on
`K_2(F(X))` (T.3/tame-symbol, T.3/localization-boundary). With the left-linear
normalisation the degree-two boundary is the tame symbol, in K2SymbolsBrauer's order and
sign. -/
theorem boundary_eq_tameSymbol
    (detField : ∀ (L : CommRingCat.{u}) [Field L], KG K 1 (Spec L) ≃+ Additive Lˣ)
    (tameSym : ∀ (X : Scheme.{u}) [IsIntegral X] (x : ClosedPoint X),
      KG K 2 (Spec (genericStalk X)) →+ Additive (X.residueField x.1)ˣ)
    (X : Scheme.{u}) [IsIntegral X] (hX : IsRegularCurve X) (x : ClosedPoint X)
    (a : KG K 2 (Spec (genericStalk X))) :
    detField (X.residueField x.1) (bdry 1 X a x) = tameSym X x a := by
  sorry

-- E.3/naturality-of-the-sequence, E.3/naturality-for-finite-pullback and
-- E.3/naturality-for-finite-transfer: not stated; the morphisms of sequences need the
-- identification of the generic stalks of X, of an open U ⊆ X and of a finite cover,
-- and the residue-field norms and extensions of scalars (S.2, K2SymbolsBrauer T.3).

/-- E.3/what-the-sequence-does-not-identify: over a number field, `K_2(X) → K_2(F(X))`
is injective after tensoring with `ℚ`. -/
theorem K2_toGeneric_injective_rat {F : Type u} [Field F] [NumberField F] (X : Scheme.{u})
    [IsIntegral X] (hX : IsRegularCurve X) (p : X ⟶ Spec (.of F)) :
    Function.Injective (((toGeneric K 2 X).toIntLinearMap).baseChange ℚ) := by
  sorry

/-- E.3/integral-injectivity-over-a-finite-field: over a finite field,
`K_2(X) → K_2(F(X))` is injective. -/
theorem K2_toGeneric_injective_finite {F : Type u} [Field F] [Finite F] (X : Scheme.{u})
    [IsIntegral X] (hX : IsRegularCurve X) (p : X ⟶ Spec (.of F)) :
    Function.Injective (toGeneric K 2 X) := by
  sorry

/-! ## E.4 K_1, SK_1, coniveau and weights -/

section E4

variable {F : Type u} [Field F] (X : Scheme.{u}) [IsIntegral X] (p : X ⟶ Spec (.of F))

/-- E.4/K1-and-SK1-of-a-curve, API `curveSK1`: `SK_1(X) := ker(K_1(X) → K_1(F(X)))`. -/
def curveSK1 : AddSubgroup (KG K 1 X) := (toGeneric K 1 X).ker

/-- API `curveK1Image`: the image of `K_1(X)` in `K_1(F(X))` is the image of the
constants. -/
theorem curveK1Image (hX : IsRegularCurve X) [IsProper p] :
    (toGeneric K 1 X).range = ((toGeneric K 1 X).comp (KPullback K 1 p)).range := by
  sorry

/-- API `curveSK1_eq_range_pushforward`: `SK_1(X)` is the image of the transfers from the
closed points. -/
theorem curveSK1_eq_range_pushforward (hX : IsRegularCurve X) :
    curveSK1 K X = (fromClosedPoints K push 1 X).range := by
  sorry

/-- API `curveSK1_eq_coker`: `SK_1(X) ≅ coker(∂ : K_2(F(X)) → ⊕_x k(x)^×)`. -/
def curveSK1_eq_coker (hX : IsRegularCurve X) :
    curveSK1 K X ≃+ (DirectSum (ClosedPoint X) fun x => KG K 1 (Spec (X.residueField x.1))) ⧸
      (bdry 1 X).range :=
  sorry

/-- API `curveSK1_split`: `K_1(X) = π^* K_1(F) ⊕ SK_1(X)`. -/
theorem curveSK1_split (hX : IsRegularCurve X) [IsProper p] :
    IsCompl (curveSK1 K X) (KPullback K 1 p).range := by
  sorry

-- curveSK1_norm: not stated; needs the norm K_1(k(x)) → K_1(F) of a finite field
-- extension (KTheoryLowDegrees U.3) as a map of the variables here.
-- curveSK1_affine_eq_stableSK1: not stated; needs the stable SK_1 of a ring
-- (KTheoryLowDegrees U.3).
-- Test curveSK1_projectiveLine: not stated; needs the projective line as a scheme (S.5).
-- Test curveSK1_affine_line: not stated; needs the affine line and homotopy invariance (S.5).
-- Test curveSK1_not_local: not stated; needs the projective line with its two charts (S.5).
-- Test curveSK1_eq_coker_test: not stated; needs the projective line (S.5).

/-- E.4/rational-base-point-splitting: a rational point `P` kills `SK_1` under pullback,
and `π_* ∘ P_* = id`. -/
theorem basePoint_splitting (hX : IsRegularCurve X) (P : Spec (.of F) ⟶ X) (hP : P ≫ p = 𝟙 _) :
    (∀ a ∈ curveSK1 K X, KPullback K 1 P a = 0) ∧
      (push 1 p).comp (push 1 P) = AddMonoidHom.id _ := by
  sorry

/-- E.4/the-coniveau-spectral-sequence-of-a-curve, API `coniveauPage`: the two nonzero
columns of `E_1` in total degrees `n + 1` and `n`, with `d_1 = ∂`. -/
def coniveauPage (n : ℕ) : AddCommGrpCat.{u} × AddCommGrpCat.{u} :=
  ((K (n + 1)).obj (op (Spec (genericStalk X))),
    AddCommGrpCat.of (DirectSum (ClosedPoint X) fun x => KG K n (Spec (X.residueField x.1))))

/-- API `coniveauFiltration`: `F^1 K_n(X)`, the image of the transfers from the closed
points; `F^0 = K_n(X)` and `F^2 = 0`. -/
def coniveauFiltration (n : ℕ) : AddSubgroup (KG K n X) := (fromClosedPoints K push n X).range

omit [IsIntegral X] in
/-- API `coniveau_eq_localisation`: the filtration is made of E.3's maps. -/
theorem coniveau_eq_localisation (n : ℕ) :
    coniveauFiltration K push X n = (fromClosedPoints K push n X).range :=
  rfl

/-- API `coniveauFiltration_left_eq_coker`: `F^1 K_n(X) ≅ coker(∂_{n+1})`. -/
def coniveauFiltration_left_eq_coker (hX : IsRegularCurve X) (n : ℕ) :
    coniveauFiltration K push X n ≃+
      (DirectSum (ClosedPoint X) fun x => KG K n (Spec (X.residueField x.1))) ⧸ (bdry n X).range :=
  sorry

/-- API `coniveau_gr0_eq_ker`: `K_{n+1}(X) / F^1 ≅ ker(∂_{n+1})`. -/
def coniveau_gr0_eq_ker (hX : IsRegularCurve X) (n : ℕ) :
    (KG K (n + 1) X ⧸ coniveauFiltration K push X (n + 1)) ≃+ (bdry n X).ker :=
  sorry

/-- API `coniveau_degenerate`: `E_2 = E_∞` in every degree, i.e. `F^1` is exactly the
kernel of restriction to the generic point. -/
theorem coniveau_degenerate (hX : IsRegularCurve X) (n : ℕ) :
    coniveauFiltration K push X n = (toGeneric K n X).ker := by
  sorry

-- Test two_columns: not stated; needs the coniveau spectral sequence of S.4 itself,
-- of which this file keeps only the two columns of a curve.
-- Test left_term_projectiveLine: not stated; needs the projective line (S.5) and
-- K_3(ℚ) ≅ ℤ/48 (K3BlochGroups V.5/k3-Z-and-Q).
-- Test left_term_affine_line: not stated; needs the affine line (S.5).

/-- Test `agrees_with_localisation`: the filtration inclusion composed with the transfers
is E.3's map `⊕_x (i_x)_*`. -/
example (n : ℕ) (a : DirectSum (ClosedPoint X) fun x => KG K n (Spec (X.residueField x.1))) :
    fromClosedPoints K push n X a ∈ coniveauFiltration K push X n :=
  ⟨a, rfl⟩

/-- E.4/the-third-K-group-of-a-curve: `0 → coker ∂_4 → K_3(X) → ker ∂_3 → 0`. -/
theorem third_K_group_extension (hX : IsRegularCurve X) :
    Function.Exact (fromClosedPoints K push 3 X) (toGeneric K 3 X) ∧
      (toGeneric K 3 X).range = (bdry 2 X).ker := by
  sorry

end E4

/-! ### E.4/adams-operations-and-the-weight-decomposition -/

section Weights

/- Adams operations `ψ^k` on `K_n(X)` (SchemeKTheoryOperations S.6). -/
variable (adams : ∀ (_k n : ℕ) (X : Scheme.{u}), KG K n X →+ KG K n X)

/-- `ψ^k ⊗ ℚ`. -/
def adamsQ (k n : ℕ) (X : Scheme.{u}) : KQ K n X →ₗ[ℚ] KQ K n X :=
  ((adams k n X).toIntLinearMap).baseChange ℚ

/-- API `weightComponent`: `K_n(X)_ℚ^{(j)} = {a | ψ^k a = k^j a for all k ≥ 1}`. -/
def weightComponent (n j : ℕ) (X : Scheme.{u}) : Submodule ℚ (KQ K n X) :=
  ⨅ (k : ℕ) (_ : 1 ≤ k), LinearMap.ker (adamsQ K adams k n X - ((k : ℚ) ^ j) • LinearMap.id)

/-- API `weightProjector`: the rational idempotent onto `K_n(X)_ℚ^{(j)}`, a polynomial in
finitely many `ψ^k`. -/
def weightProjector (n j : ℕ) (X : Scheme.{u}) : KQ K n X →ₗ[ℚ] KQ K n X :=
  sorry

/-- API `weightComponent_iSup_eq_top`: for a regular curve only the weights
`0 ≤ j ≤ n + 1` occur. -/
theorem weightComponent_iSup_eq_top (X : Scheme.{u}) (hX : IsRegularCurve X) (n : ℕ) :
    ⨆ j ∈ Finset.range (n + 2), weightComponent K adams n j X = ⊤ := by
  sorry

/-- API `weightComponent_pullback`: pullback preserves weights. -/
theorem weightComponent_pullback (n j : ℕ) {X Y : Scheme.{u}} (f : X ⟶ Y) :
    (weightComponent K adams n j Y).map (((KPullback K n f).toIntLinearMap).baseChange ℚ) ≤
      weightComponent K adams n j X := by
  sorry

-- weightComponent_finiteCoeff: not stated; needs K-theory with ℤ/ℓ^ν coefficients and
-- S.6's condition on ℓ.
-- weightComponent_motivic: not stated; needs motivic cohomology H^{2j-n}(X, ℚ(j))
-- (MotivicEtaleKTheory M.6).
-- Test K0_curve_weights: not stated; needs the projective line (S.5).
-- Test K0_P2_not_integral: not stated; needs the projective plane (S.5); the algebra is
-- K_0(P^2) = ℤ[z]/(z^3) with ψ^k z = k z - (k choose 2) z^2.
-- Test K1_curve_weights: not stated; needs the projective line (S.5).

/-- Test `weight_zero_field`: for a field and `n ≥ 1` the weight-zero part vanishes. -/
example (L : CommRingCat.{u}) [Field L] (n : ℕ) (hn : 1 ≤ n) :
    weightComponent K adams n 0 (Spec L) = ⊥ := by
  sorry

-- E.4/indecomposable-K3-sits-in-weight-two: not stated; needs Milnor K_3 and K_3^ind of a
-- field (K3BlochGroups V.2) and motivic cohomology (MotivicEtaleKTheory M.4, M.6).

end Weights

/-! ## E.5 Functoriality and the finite-field computation -/

section E5

/- The unit `[O_X]` of `K_0(X)`, and the `K_0`-module structure on `K_n` (S.2). -/
variable (one : ∀ X : Scheme.{u}, KG K 0 X) (mul : ∀ (n : ℕ) (X : Scheme.{u}), KG K 0 X →+ KG K n X →+ KG K n X)

/-- E.5/projection-formula-and-isogenies: `f_*(f^* y) = [f_* O_X] · y` for a proper map. -/
theorem push_pull_eq_mul (n : ℕ) {X Y : Scheme.{u}} (f : X ⟶ Y) [IsProper f] (y : KG K n Y) :
    KPushforward K push n f (KPullback K n f y) = mul n Y (KPushforward K push 0 f (one X)) y := by
  sorry

-- E.5/class-of-the-pushed-forward-structure-sheaf: not stated; needs an isogeny and [m] as
-- morphisms of schemes (ModularCurves layers 2A and 2B) and the rank and determinant of
-- E.2 on the target.
-- E.5/the-projective-line-and-the-projective-bundle-theorem: not stated; needs the
-- projective line as a scheme (SchemeKTheoryOperations S.5, KTheoryLowDegrees Z.6).
-- Test pushforward_structure_morphism_P1: not stated; needs the projective line (S.5).

/-- Test `pushforward_structure_morphism_elliptic`: for an elliptic curve the Euler
characteristic of the structure sheaf is zero. `rankF` is `K_0(F) ≅ ℤ`. -/
example {F : Type u} [Field F] (E : Scheme.{u}) (p : E ⟶ Spec (.of F)) [IsProper p]
    (rankF : KG K 0 (Spec (.of F)) ≃+ ℤ) (hE : IsRegularCurve E) :
    rankF (KPushforward K push 0 p (one E)) = 0 := by
  sorry

-- Test finite_field_extension_transfer: not stated; needs K_1(L) ≅ L^× and the norm
-- (KTheoryLowDegrees U.3) for a finite extension L/F.

/-- Test `pullback_generic_point`: restriction to the generic point is the pullback along
`Spec F(X) → X`, a morphism that is neither proper nor of finite type. -/
example (X : Scheme.{u}) [IsIntegral X] (n : ℕ) :
    toGeneric K n X = KPullback K n (X.fromSpecStalk (genericPoint X)) :=
  rfl

-- Test open_immersion_not_proper: not stated; needs the affine line in the projective
-- line and quasi-coherent direct images (S.2).

/-- E.5/an-elliptic-curve-over-a-finite-field: the positive K-groups of a regular proper
curve over a finite field are finite, and `K_1 ≅ F^× ⊕ F^×` when the curve is
geometrically integral. -/
theorem K_finite_of_finite_field {F : Type u} [Field F] [Finite F] (X : Scheme.{u})
    (hX : IsRegularCurve X) (p : X ⟶ Spec (.of F)) [IsProper p] [GeometricallyIntegral p]
    (n : ℕ) (hn : 1 ≤ n) :
    Finite (KG K n X) ∧ (n = 1 → Nonempty (KG K 1 X ≃+ Additive Fˣ × Additive Fˣ)) := by
  sorry

end E5

/-! ## E.6 Regular proper models and the integral part -/

section E6

variable (R : Type u) [CommRing R] [IsDedekindDomain R]

/-- E.6/the-regular-proper-model, API `RegularProperModel`: a proper flat scheme over
`Spec R` with regular local rings and generic fibre `E`. -/
structure RegularProperModel (E : Scheme.{u}) (toGen : E ⟶ Spec (.of (FractionRing R))) where
  /-- The model. -/
  X : Scheme.{u}
  /-- Its structure morphism. -/
  toBase : X ⟶ Spec (.of R)
  isProper : IsProper toBase
  flat : Flat toBase
  /-- API `RegularProperModel.isRegular`: every local ring is regular. -/
  isRegular : ∀ x : X, IsRegularLocalRing (X.presheaf.stalk x)
  /-- The identification of the generic fibre with `E`. -/
  genericFibre : Limits.pullback toBase (Spec.map (CommRingCat.ofHom (algebraMap R (FractionRing R)))) ≅ E
  genericFibre_toGen : genericFibre.hom ≫ toGen = Limits.pullback.snd _ _

variable {R} {E : Scheme.{u}} {toGen : E ⟶ Spec (.of (FractionRing R))}

/-- API `RegularProperModel.fibre`: the fibre `𝓔_v` at a closed point `v` of the base. -/
def RegularProperModel.fibre (M : RegularProperModel R E toGen) (v : IsDedekindDomain.HeightOneSpectrum R) :
    Scheme.{u} :=
  Limits.pullback M.toBase (Spec.map (CommRingCat.ofHom (algebraMap R v.asIdeal.ResidueField)))

/-- API `RegularProperModel.components`: the irreducible components of the fibre. -/
def RegularProperModel.components (M : RegularProperModel R E toGen) (v : IsDedekindDomain.HeightOneSpectrum R) :
    Set (Set (M.fibre v)) :=
  irreducibleComponents (M.fibre v)

/-- API `RegularProperModel.multiplicity`: the multiplicity `m_C` of a component, the
length of the local ring of the fibre at its generic point. -/
def RegularProperModel.multiplicity (M : RegularProperModel R E toGen) (v : IsDedekindDomain.HeightOneSpectrum R)
    (C : Set (M.fibre v)) (hC : C ∈ M.components v) : ℕ :=
  sorry

-- RegularProperModel.div_uniformiser: not stated; needs Weil divisors on a scheme
-- (Tau Ceti SchemeWeilDivisor, not imported) and StableReduction layer 5.
-- weierstrassModel_regular_iff: not stated; needs the Weierstrass model over R
-- (ModularCurves layer 1A over a base) and the minimal regular model (StableReduction 5).
-- neronModel_isProper_iff: not stated; needs Néron models, which no library has.

/-- Test `weierstrass_37a1_regular` (the computation behind it): for `y^2 + y = x^3 - x`
the fibre at 37 is singular at `(5, 18)`, where the equation takes the value 222, which is
not divisible by `37^2`; so the equation is not in the square of the maximal ideal. -/
example : (18 : ℤ) ^ 2 + 18 - (5 ^ 3 - 5) = 222 ∧ ¬ (37 ^ 2 : ℤ) ∣ 222 := by decide

/-- Test `weierstrass_11a1_not_regular` (the computation behind it): for
`y^2 + y = x^3 - x^2 - 10x - 20` the equation vanishes at the singular point `(5, 5)` of
the fibre at 11, so it lies in the square of `(11, x - 5, y - 5)`. -/
example : (5 : ℤ) ^ 2 + 5 - (5 ^ 3 - 5 ^ 2 - 10 * 5 - 20) = 0 := by decide

/-- Test `nonminimal_not_regular` (the computation behind it): `y^2 = x^3 - 81x` is the
`u = 3` rescaling of `y^2 = x^3 - x`, and its equation lies in `(3, x, y)^2` because
`81 = 3^4`. -/
example : (⟨0, 0, 0, -81, 0⟩ : WeierstrassCurve ℚ).Δ = 3 ^ 12 * (⟨0, 0, 0, -1, 0⟩ : WeierstrassCurve ℚ).Δ := by
  simp [WeierstrassCurve.Δ, WeierstrassCurve.b₂, WeierstrassCurve.b₄, WeierstrassCurve.b₆,
    WeierstrassCurve.b₈]
  norm_num

-- Test neron_good_reduction_proper: not stated; needs Néron models.
-- Test neron_bad_reduction_not_proper: not stated; needs Néron models.

/-- E.6/existence-of-a-regular-proper-model: a regular proper model exists over a
Dedekind base whose fraction field has characteristic zero, for a smooth proper
geometrically integral curve. -/
theorem existsRegularProperModel [CharZero (FractionRing R)] (hE : IsRegularCurve E) [IsProper toGen]
    [GeometricallyIntegral toGen] : Nonempty (RegularProperModel R E toGen) := by
  sorry

/-- The inclusion of the generic fibre. -/
def RegularProperModel.genericInclusion (M : RegularProperModel R E toGen) : E ⟶ M.X :=
  M.genericFibre.inv ≫ Limits.pullback.fst _ _

/-- E.6/the-integral-part, API `integralPart`: the rational integral part
`im(K_2(𝓔) ⊗ ℚ → K_2(E) ⊗ ℚ)`. -/
def integralPart (M : RegularProperModel R E toGen) : Submodule ℚ (KQ K 2 E) :=
  LinearMap.range (((KPullback K 2 M.genericInclusion).toIntLinearMap).baseChange ℚ)

variable (RS : Type u) [CommRing RS] [Algebra R RS] [Algebra RS (FractionRing R)]
  [IsScalarTower R RS (FractionRing R)]

/-- The model over `O_{F,S}` = `RS`, `𝓔_S = 𝓔 ×_R RS`, and the inclusion of the generic
fibre into it. -/
def RegularProperModel.genericInclusionS (M : RegularProperModel R E toGen) :
    E ⟶ Limits.pullback M.toBase (Spec.map (CommRingCat.ofHom (algebraMap R RS))) :=
  Limits.pullback.lift M.genericInclusion
    (toGen ≫ Spec.map (CommRingCat.ofHom (algebraMap RS (FractionRing R)))) (by sorry)

/-- API `integralPartS`: the S-integral variant `im(K_2(𝓔_S) ⊗ ℚ → K_2(E) ⊗ ℚ)`. -/
def integralPartS (M : RegularProperModel R E toGen) : Submodule ℚ (KQ K 2 E) :=
  LinearMap.range (((KPullback K 2 (M.genericInclusionS RS)).toIntLinearMap).baseChange ℚ)

/-- API `integralPart_le_integralPartS`. -/
theorem integralPart_le_integralPartS (M : RegularProperModel R E toGen) :
    integralPart K M ≤ integralPartS K RS M := by
  sorry

/-- API `integralPartS_mono`: inverting more primes gives a subspace at least as large
(the inclusion can be an equality: E.6/good-reduction-primes-impose-no-condition). -/
theorem integralPartS_mono (RS' : Type u) [CommRing RS'] [Algebra R RS'] [Algebra RS' (FractionRing R)]
    [IsScalarTower R RS' (FractionRing R)] [Algebra RS RS'] [IsScalarTower R RS RS']
    [IsScalarTower RS RS' (FractionRing R)] (M : RegularProperModel R E toGen) :
    integralPartS K RS M ≤ integralPartS K RS' M := by
  sorry

-- integralPart_le_unramified: not stated; needs the tame symbols on K_2(F(E)) at the
-- closed points of E (K2SymbolsBrauer T.3, T.5/unramified-subgroup).

/-- Test `contained_in_S_variant`. -/
example (M : RegularProperModel R E toGen) : integralPart K M ≤ integralPartS K RS M :=
  integralPart_le_integralPartS K RS M

-- Test good_prime_changes_nothing: not stated; needs the regular model of 37a1 over ℤ and
-- E.6/good-reduction-primes-impose-no-condition.
-- Test unramified_not_integral: not stated; needs the curve y^2 + (x + 12)y + x^3 = 0 over ℚ
-- with its regular model and K_2 of its function field (DJZ Theorem 8.3(2)).

/-- Test `all_primes_inverted`: when every prime is inverted (`RS` is the fraction field),
the S-integral variant is everything. -/
example [IsScalarTower R (FractionRing R) (FractionRing R)] (M : RegularProperModel R E toGen) :
    integralPartS K (FractionRing R) M = ⊤ := by
  sorry

/-- E.6/model-independence: two regular proper models give the same integral part. -/
theorem integralPart_independent (M M' : RegularProperModel R E toGen) :
    integralPart K M = integralPart K M' := by
  sorry

-- E.6/regular-models-linked-by-blowups: not stated; needs blow-ups of schemes in closed
-- points (Tau Ceti StableReduction layer 4).
-- E.6/good-reduction-primes-impose-no-condition: not stated; needs the localisation
-- sequence of the model (S.3) and the finite-field computation of E.5 for its fibres.
-- E.6/vertical-residues: not stated; needs the tame symbols at the generic points of the
-- vertical components (S.3, K2SymbolsBrauer T.3).

end E6

end KTheory

/-! ## E.1 The Weierstrass scheme over a field

ModularCurves layer 1A's projective model of `W`, base-changed to `Spec F`, is imported
by request: the scheme `EW`, its structure map `p`, the two standard charts and the zero
section are variables. -/

section E1

variable {F : Type u} [Field F] (W : WeierstrassCurve F)
  (EW : Scheme.{u}) (p : EW ⟶ Spec (.of F))
  (chartZ : Spec (.of W.toAffine.CoordinateRing) ⟶ EW) [IsOpenImmersion chartZ]
  (UY : Scheme.{u}) (chartY : UY ⟶ EW) [IsOpenImmersion chartY]
  (zeroSection : Spec (.of F) ⟶ EW)

-- E.1/the-elliptic-curve-as-a-scheme. EllipticScheme: not stated as a definition; it is
-- ModularCurves layer 1A's model (the variable `EW`), an abbreviation of the upstream object.
-- EllipticScheme.zeroSection: the variable `zeroSection`, imported with the model.
-- EllipticScheme.ofBase: not stated; needs ModularCurves layer 1A's model over a base ring.

/-- API `EllipticScheme.charts`: the charts `D₊(Z) ≅ Spec W.CoordinateRing` and `D₊(Y)`. -/
def EllipticScheme.charts : Fin 2 → EW.Opens :=
  ![chartZ.opensRange, chartY.opensRange]

/-- API `EllipticScheme.cover`: the two charts cover `E_W`. -/
theorem EllipticScheme.cover : chartZ.opensRange ⊔ chartY.opensRange = ⊤ := by
  sorry

/-- Test `charts_cover`. -/
example : chartZ.opensRange ⊔ chartY.opensRange = ⊤ :=
  EllipticScheme.cover W EW chartZ UY chartY

/-- Test `affine_chart_equation`: the chart `D₊(Z)` is `Spec W.CoordinateRing` over `F`. -/
example : chartZ ≫ p = Spec.map (CommRingCat.ofHom (algebraMap F W.toAffine.CoordinateRing)) := by
  sorry

/-- Test `section_disjoint`: the zero section lies in `D₊(Y)` and misses `D₊(Z)`. -/
example : Set.range zeroSection.base ⊆ (chartY.opensRange : Set EW) ∧
    Disjoint (Set.range zeroSection.base) (chartZ.opensRange : Set EW) := by
  sorry

/-- `𝔽_5` is a field. -/
local instance fact_prime_five : Fact (Nat.Prime 5) := ⟨Nat.prime_five⟩

/-- Test `singular_cubic`: `y^2 = x^3` over `𝔽_5` has discriminant zero, and Mathlib's
point type (nonsingular points and zero) has 5 elements, while the projective cubic has 6
rational points. -/
example : (⟨0, 0, 0, 0, 0⟩ : WeierstrassCurve (ZMod 5)).Δ = 0 ∧
    Nat.card (⟨0, 0, 0, 0, 0⟩ : WeierstrassCurve (ZMod 5)).toAffine.Point = 5 := by
  sorry

/-- Test `rational_points_count`: `y^2 = x^3 - x` over `𝔽_5` has 8 points, and the group
is `ℤ/4 × ℤ/2`. -/
example : Nat.card (⟨0, 0, 0, -1, 0⟩ : WeierstrassCurve (ZMod 5)).toAffine.Point = 8 ∧
    Nonempty ((⟨0, 0, 0, -1, 0⟩ : WeierstrassCurve (ZMod 5)).toAffine.Point ≃+ ZMod 4 × ZMod 2) := by
  sorry

/-- E.1/geometric-properties-of-the-curve: smooth of relative dimension one and proper
(imported from ModularCurves layer 1A). -/
theorem smooth_proper [W.IsElliptic] : SmoothOfRelativeDimension 1 p ∧ IsProper p := by
  sorry

/-- E.1/geometrically-integral-curve: the homogeneous Weierstrass cubic is irreducible
over every field, so `E_W` is a geometrically integral curve. -/
theorem irreducible_projective_polynomial (W' : WeierstrassCurve.Projective F) :
    Irreducible W'.polynomial := by
  sorry

/-- E.1/geometrically-integral-curve: `E_W` is geometrically integral over `F`. -/
theorem geometricallyIntegral : GeometricallyIntegral p := by
  sorry

/-- E.1/regular-in-the-divisor-api-form: `E_W` is a regular curve in the form Tau Ceti's
divisor API consumes (integral, noetherian, regular stalks, coheight at most one). -/
theorem isRegularCurve [W.IsElliptic] : IsRegularCurve EW := by
  sorry

/-- E.1/the-function-field-of-the-curve: the function field of `E_W` is the fraction field
of the affine coordinate ring, `W.toAffine.FunctionField`. -/
def functionFieldEquiv [IsIntegral EW] : EW.functionField ≃+* W.toAffine.FunctionField :=
  sorry

/-- E.1/points-and-group-law-comparison: the `F`-sections of `E_W` are Mathlib's points
of `W` (ModularCurves layers 1B and 1D). -/
def sectionsEquivPoint [W.IsElliptic] : {s : Spec (.of F) ⟶ EW // s ≫ p = 𝟙 _} ≃ W.toAffine.Point :=
  sorry

-- E.1/isogenies-as-scheme-morphisms: not stated; needs Tau Ceti's TauCeti.Isogeny (not
-- imported) and the anti-equivalence of AlgebraicCurves layer 12.

end E1

/-! ## E.2 The zeroth K-group -/

section E2

variable (K : ℕ → Scheme.{u}ᵒᵖ ⥤ AddCommGrpCat.{u})
  (Pic : Scheme.{u} → Type u) [∀ X, AddCommGroup (Pic X)]
  (rank : ∀ X : Scheme.{u}, KG K 0 X →+ ℤ) (det : ∀ X : Scheme.{u}, KG K 0 X →+ Pic X)

/-- E.2/K0-of-a-curve: rank and determinant give `K_0(X) ≅ ℤ ⊕ Pic(X)` for a regular
separated connected noetherian curve (the owner is KTheoryLowDegrees Z.5). -/
theorem K0_curve_rank_det (X : Scheme.{u}) (hX : IsRegularCurve X) [IsSeparated (Limits.terminal.from X)] :
    Function.Bijective ((rank X).prod (det X)) := by
  sorry

-- E.2/degree-euler-characteristic-and-pushforward.
-- eulerChar: not stated; needs Tau Ceti's eulerCharBelow and AbelianK0.lift (not
-- imported) with JacobianChallenge layer B's finiteness.
-- eulerChar_additive: not stated; as for eulerChar.
-- pushforwardToBase: the map `KPushforward K push 0 p` of E.5 for the structure map `p`.
-- pushforwardToBase_eq_eulerChar: not stated; needs eulerChar.
-- riemannRoch: not stated; needs the degree and the genus (JacobianChallenge layers A, B).
-- Test point_degree_one: not stated; needs eulerChar and the degree.
-- Test structure_sheaf_elliptic: not stated; needs eulerChar (the K_0 form is the E.5
-- example `pushforward_structure_morphism_elliptic`).
-- Test additive: not stated; needs eulerChar.
-- Test factors_through_K0: not stated; needs eulerChar.
-- Test degree_ne_eulerChar_P1: not stated; needs the projective line.
-- Test nonrational_point_degree: not stated; needs the projective line over ℚ.

-- E.2/picard-group-is-the-divisor-class-group: not stated; needs Tau Ceti's
-- SchemeWeilDivisor class group and classGroupToLineBundleClassHom (not imported).

/-- E.2/picard-decomposition-and-the-point-group: with the rational origin, the Picard
group of `E_W` is `E(F) × ℤ` (Tau Ceti's function-field theorems transported through
E.2/picard-group-is-the-divisor-class-group). -/
theorem picard_decomposition {F : Type u} [Field F] [DecidableEq F] (W : WeierstrassCurve F) [W.IsElliptic]
    (EW : Scheme.{u}) (hEW : IsRegularCurve EW) :
    Nonempty (Pic EW ≃+ W.toAffine.Point × ℤ) := by
  sorry

-- E.2/line-bundle-descent: not stated; needs the Galois action on the Picard group of
-- the base change to a separable closure (EllipticCurves layer 0.5, ModularCurves 2D).

/-- E.2/ring-structure-of-K0-of-a-curve: the multiplication on `ℤ ⊕ ℤ ⊕ E(F)` (rank,
degree, point) induced by the tensor product; it is not the product ring. -/
def rdpMul {F : Type u} [Field F] [DecidableEq F] {W : WeierstrassCurve F}
    (a b : ℤ × ℤ × W.toAffine.Point) : ℤ × ℤ × W.toAffine.Point :=
  (a.1 * b.1, a.1 * b.2.1 + b.1 * a.2.1, a.1 • b.2.2 + b.1 • a.2.2)

/-- E.2/ring-structure-of-K0-of-a-curve: the rank-zero part squares to zero. -/
example {F : Type u} [Field F] [DecidableEq F] {W : WeierstrassCurve F} (d : ℤ) (P : W.toAffine.Point) :
    rdpMul (0, d, P) (0, d, P) = (0, 0, 0) := by
  simp [rdpMul]

/-- E.2/K0-of-an-elliptic-curve: `K_0(E) ≅ ℤ ⊕ ℤ ⊕ E(F)` as groups, with the chosen
origin. -/
theorem K0_elliptic {F : Type u} [Field F] [DecidableEq F] (W : WeierstrassCurve F) [W.IsElliptic]
    (EW : Scheme.{u}) (hEW : IsRegularCurve EW) :
    Nonempty (KG K 0 EW ≃+ ℤ × ℤ × W.toAffine.Point) := by
  sorry

end E2

/-! ## E.7 Certified symbols

Places of a function field `L` with their orders and residue maps are Tau Ceti's
`TauCeti.Place`, `Place.ord`, `Place.ResidueField` and `Place.residueUnit` (not imported);
here they are variables. The tame value is K2SymbolsBrauer's convention. -/

section Certificates

variable {L : Type u} [Field L] {Pl : Type u} (ord : Pl → Lˣ →* Multiplicative ℤ)
  (Res : Pl → Type u) [∀ P, Field (Res P)] (residueUnit : ∀ P, (ord P).ker →* (Res P)ˣ)

/-- E.7/symbol-certificates, API `tameValue`: `(-1)^(ord f · ord g)` times the residue of
`f^(ord g) / g^(ord f)`, which has order zero. -/
def tameValue (P : Pl) (f g : Lˣ) : (Res P)ˣ :=
  (-1) ^ (Multiplicative.toAdd (ord P f) * Multiplicative.toAdd (ord P g)) *
    residueUnit P ⟨f ^ Multiplicative.toAdd (ord P g) / g ^ Multiplicative.toAdd (ord P f), by sorry⟩

/-- API `tameValue_of_ord_eq_zero`. -/
theorem tameValue_of_ord_eq_zero (P : Pl) (f g : Lˣ) (hf : ord P f = 1) (hg : ord P g = 1) :
    tameValue ord Res residueUnit P f g = 1 := by
  sorry

/-- API `tameValue_eq_leading`: the leading-unit formula, for a uniformiser `t`; it does
not depend on `t`. -/
theorem tameValue_eq_leading (P : Pl) (t : Lˣ) (ht : ord P t = Multiplicative.ofAdd 1) (f g : Lˣ)
    (u w : (ord P).ker) (a b : ℤ) (hf : f = t ^ a * u) (hg : g = t ^ b * w) :
    tameValue ord Res residueUnit P f g = (-1) ^ (a * b) * residueUnit P u ^ b * (residueUnit P w) ^ (-a) := by
  sorry

/-- API `SymbolCandidate`: a finite formal sum `∑ n_(f,g) {f, g}`. -/
abbrev SymbolCandidate (L : Type u) [Field L] : Type u := (Lˣ × Lˣ) →₀ ℤ

/-- The tame value of a candidate at a place, multiplicative in the candidate. -/
def SymbolCandidate.tame (α : SymbolCandidate L) (P : Pl) : (Res P)ˣ :=
  α.prod fun fg n => tameValue ord Res residueUnit P fg.1 fg.2 ^ n

/-- API `SymbolCandidate.toK2`: the class of a candidate in `K_2(L)`, given the Steinberg
symbol of K2SymbolsBrauer T.2. -/
def SymbolCandidate.toK2 {K2 : Type u} [AddCommGroup K2] (steinberg : Lˣ → Lˣ → K2) (α : SymbolCandidate L) :
    K2 :=
  α.sum fun fg n => n • steinberg fg.1 fg.2

/-- API `SymbolCertificate`: a named finite set of places, the proof that every function
involved is a unit off it, and the triviality of the tame value IN the residue field at
each of its places. -/
structure SymbolCertificate (α : SymbolCandidate L) where
  /-- API `SymbolCertificate.support`: the named finite set of places. -/
  support : Finset Pl
  unit_outside : ∀ P ∉ support, ∀ fg ∈ α.support, ord P fg.1 = 1 ∧ ord P fg.2 = 1
  tame_eq_one : ∀ P ∈ support, α.tame ord Res residueUnit P = 1

/-- API `SymbolCertificate.tame_eq_one_everywhere`. -/
theorem SymbolCertificate.tame_eq_one_everywhere {α : SymbolCandidate L}
    (c : SymbolCertificate ord Res residueUnit α) (P : Pl) : α.tame ord Res residueUnit P = 1 := by
  sorry

/-- API `SymbolCertificate.nonempty_iff`: a candidate has a certificate iff its tame value
is one at every place (finiteness of the places where a function has nonzero order is
Tau Ceti's `Place.finite_setOf_ord_ne_zero`). -/
theorem SymbolCertificate.nonempty_iff (hfin : ∀ f : Lˣ, Set.Finite {P | ord P f ≠ 1})
    (α : SymbolCandidate L) :
    Nonempty (SymbolCertificate ord Res residueUnit α) ↔ ∀ P, α.tame ord Res residueUnit P = 1 := by
  sorry

/-- API `SymbolCertificate.sound`: a certified candidate is in the kernel of every tame
symbol on `K_2(L)` (`tameK2`, K2SymbolsBrauer T.3/tame-symbol-hom, agreeing with
`tameValue` on Steinberg symbols). -/
theorem SymbolCertificate.sound {K2 : Type u} [AddCommGroup K2] (steinberg : Lˣ → Lˣ → K2)
    (tameK2 : ∀ P, K2 →+ Additive (Res P)ˣ)
    (htame : ∀ P f g, tameK2 P (steinberg f g) = Additive.ofMul (tameValue ord Res residueUnit P f g))
    {α : SymbolCandidate L} (c : SymbolCertificate ord Res residueUnit α) (P : Pl) :
    tameK2 P (α.toK2 steinberg) = 0 := by
  sorry

/-- Test `SymbolCertificate.empty`: the zero candidate has a certificate with empty
support. -/
example : Nonempty (SymbolCertificate ord Res residueUnit (0 : SymbolCandidate L)) :=
  ⟨⟨∅, by simp, by simp⟩⟩

-- Test certificate_11a3: not stated; needs the places of the function field of 11a3
-- (Tau Ceti, not imported).
-- Test norm_only_not_certificate: not stated; needs the places of the function field of
-- 36a1 and the residue field ℚ(√2) at x = 1.

/-- Test `certificate_convention_invariant`: triviality of the tame value is the same
condition in K2SymbolsBrauer's convention and in the K-book's (the value with the
arguments swapped, its inverse). -/
example (α : SymbolCandidate L) (P : Pl) :
    α.tame ord Res residueUnit P = 1 ↔ SymbolCandidate.tame ord Res residueUnit (α.mapDomain Prod.swap) P = 1 := by
  sorry

-- Test SymbolCertificate.nonempty_iff_test: not stated; needs the rational torsion of
-- 11a3 and the functions with divisor 5(P) - 5(O).

variable {Pv : Type u} (vord : Pv → Lˣ →* Multiplicative ℤ) (VRes : Pv → Type u) [∀ Q, Field (VRes Q)]
  (vresidueUnit : ∀ Q, (vord Q).ker →* (VRes Q)ˣ)

/-- E.7/integral-certificates, API `IntegralCertificate`: a certificate together with the
vertical data. `Pv` are the vertical prime divisors of a regular proper model (the
components of the fibres); `primes` names the finitely many at which data are given. -/
structure IntegralCertificate (α : SymbolCandidate L) extends SymbolCertificate ord Res residueUnit α where
  /-- API `IntegralCertificate.primes`: the named finite set of vertical components. -/
  primes : Finset Pv
  vertical_outside : ∀ Q ∉ primes, ∀ fg ∈ α.support, vord Q fg.1 = 1 ∧ vord Q fg.2 = 1
  vertical_tame_eq_one : ∀ Q ∈ primes, α.tame vord VRes vresidueUnit Q = 1

/-- API `IntegralCertificate.sound`: an integrally certified candidate has vertical tame
value one along every component, hence (E.6/vertical-residues) lies in the integral part
after tensoring with `ℚ`. -/
theorem IntegralCertificate.sound {α : SymbolCandidate L}
    (c : IntegralCertificate ord Res residueUnit vord VRes vresidueUnit α) (Q : Pv) :
    α.tame vord VRes vresidueUnit Q = 1 := by
  sorry

-- Test integral_certificate_11a3: not stated; needs the regular model of 11a3 over ℤ.
-- Test unramified_not_integral_DGJK: not stated; needs the curve y^2 = x(x+1)(x+1/9) with
-- its model at 3 (DGJK Proposition 10.2).
-- Test integral_of_constant: not stated; needs the units of the ring of integers as
-- functions on the model.

/-- E.7/reciprocity-determines-the-last-rational-point: given Weil reciprocity with the
residue-field norms (`hrec`, K2SymbolsBrauer T.4/weil-reciprocity), the tame value at the
last place of degree one is forced. -/
theorem tame_eq_one_of_forall_ne {k : Type u} [Field k] (normRes : ∀ P, (Res P)ˣ →* kˣ)
    (hrec : ∀ α : SymbolCandidate L, ∏ᶠ P, normRes P (α.tame ord Res residueUnit P) = 1)
    (α : SymbolCandidate L) (P₀ : Pl) (hdeg : Function.Injective (normRes P₀))
    (h : ∀ P ≠ P₀, α.tame ord Res residueUnit P = 1) : α.tame ord Res residueUnit P₀ = 1 := by
  sorry

-- E.7/principal-divisors-on-rational-torsion: not stated; needs Tau Ceti's
-- pointEquivDegreeZeroDivisorClass and Divisor.principal (not imported).

/-- E.7/bloch-correction: let `T` be a finite set of places of degree one containing the
origin `O`, carrying the divisors of `f` and `g`, and suppose that for each `P ∈ T` other
than `O` a function `fT P` with divisor `C(P) - C(O)` exists (so `C` kills the points of
`T`). Given Weil reciprocity (`hrec`) and constants whose residues at the places of `T`
are all the residues, `C{f, g}` plus symbols with a constant second entry has tame value
one at every place. -/
theorem bloch_correction [DecidableEq Pl] {k : Type u} [Field k] (normRes : ∀ P, (Res P)ˣ →* kˣ)
    (hrec : ∀ α : SymbolCandidate L, ∏ᶠ P, normRes P (α.tame ord Res residueUnit P) = 1)
    (C : ℕ) (T : Finset Pl) (O : Pl) (hO : O ∈ T) (hdeg : ∀ P ∈ T, Function.Injective (normRes P))
    (f g : Lˣ) (hf : ∀ P ∉ T, ord P f = 1) (hg : ∀ P ∉ T, ord P g = 1)
    (fT : Pl → Lˣ) (hfT : ∀ P ∈ T, P ≠ O → ∀ Q, ord Q (fT P) =
      if Q = P then Multiplicative.ofAdd (C : ℤ) else if Q = O then Multiplicative.ofAdd (-(C : ℤ)) else 1)
    (constants : Subgroup Lˣ) (hconst : ∀ c ∈ constants, ∀ Q, ord Q c = 1)
    (hres : ∀ P ∈ T, Function.Surjective fun c : constants =>
      residueUnit P ⟨c.1, (MonoidHom.mem_ker).2 (hconst c.1 c.2 P)⟩) :
    ∃ corr : SymbolCandidate L, (∀ fg ∈ corr.support, fg.2 ∈ constants) ∧
      ∀ P, (C • Finsupp.single (f, g) 1 + corr).tame ord Res residueUnit P = 1 := by
  sorry

-- E.7/bloch-classes.
-- blochRho: not stated; needs Tau Ceti's principal divisors on W.FunctionField (the
-- function with divisor (C^2 - 1)(O) - Σ_{a ≠ 0} (a)).
-- torsionFunction: not stated; needs Tau Ceti's exists_principal_zsmul_pointPlace_sub_infinity.
-- blochClass: not stated; needs K2SymbolsBrauer's K_2 of W.FunctionField and its kernel of
-- the tame symbol, tensored with ℤ[1/C].
-- blochClass_wellDefined: not stated; needs blochClass.
-- divisor_blochRho: not stated; needs blochRho.
-- divisor_torsionFunction: not stated; needs torsionFunction.
-- Test blochClass_C2_needs_factor: not stated; needs the places of y^2 = x^3 - x over ℚ.
-- Test blochClass_not_independent: not stated; needs blochClass (DJZ Proposition 4.3).
-- Test divisor_blochRho_C2: not stated; needs blochRho.
-- Test blochClass_wellDefined_test: not stated; needs blochClass.

-- E.7/transfer-of-certified-classes and E.7/rational-galois-descent: not stated; need the
-- transfer on K_2 of a finite extension of function fields with the norm-residue formula
-- (K2SymbolsBrauer T.3/transfer-and-norm-residue) and the Galois action.

end Certificates

/-! ## E.8 The completion criterion and the worked examples

E.8/the-completion-criterion is a checklist of the nodes above and is not a Lean
statement. The worked examples need the function fields of explicit curves with their
places (Tau Ceti, not imported); what can be checked here are the numbers they rest on. -/

/-- E.8/worked-example-certificate: DGJK's curve `y^2 = x(x+1)(x+u^2)` has discriminant
`16 u^4 (u^2 - 1)^2` (source issue EllipticKTheory/E16 corrects the printed exponent). -/
example (u : ℚ) : (⟨0, 1 + u ^ 2, 0, u ^ 2, 0⟩ : WeierstrassCurve ℚ).Δ = 16 * u ^ 4 * (u ^ 2 - 1) ^ 2 := by
  simp [WeierstrassCurve.Δ, WeierstrassCurve.b₂, WeierstrassCurve.b₄, WeierstrassCurve.b₆,
    WeierstrassCurve.b₈]
  ring

/-- E.8/worked-example-nonrational-residue: on 36a1 the normed tame values of
`{y - 3, x}` multiply to one. -/
example : (1 / 2 : ℚ) * (1 / 4) * (-2) * (-4) * 1 = 1 := by norm_num

/-- E.8/worked-example-bad-fibre: `y^2 + y = x^3 - x^2` (11a3) has discriminant `-11`, so
its Weierstrass model is regular with an irreducible fibre at 11. -/
example : (⟨0, -1, 1, 0, 0⟩ : WeierstrassCurve ℚ).Δ = -11 := by
  simp [WeierstrassCurve.Δ, WeierstrassCurve.b₂, WeierstrassCurve.b₄, WeierstrassCurve.b₆,
    WeierstrassCurve.b₈]
  norm_num

end TauCeti.EllipticK
