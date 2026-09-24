/-
This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/VectorBundlesAndIsocrystals--VB0.md` is definitive.
These statements suggest Lean forms so that contributors and reviewers can
converge on names and signatures. They claim no implementation.

BP-VectorBundlesAndIsocrystals--VB0: partial prototype, implementationStatus =
unchecked. Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

NOT COMPILED. No Lean was run for this job and the Mathlib build on this machine
is a shared cache that must not be rebuilt, so elaboration has not been
established. Every proof below is `sorry`.

SCOPE. First part of the roadmap: VB0, VB1 and VB2 with its two substages. VB3
and VB4 belong to the other part (issue #1003).

REUSED from the pinned libraries rather than restated. This is the roadmap where
Mathlib reaches furthest in: `Mathlib/RingTheory/WittVector/Isocrystal.lean` has
`WittVector.Isocrystal` (a vector space over `K(p,k) = W(k)[1/p]` with a bijective
Frobenius-semilinear map — exactly `φ-Mod_L` for `E = Q_p`), `IsocrystalHom`,
`IsocrystalEquiv`, `StandardOneDimIsocrystal m` and, crucially,
`isocrystal_classification`: over an algebraically closed field of characteristic
`p` a ONE-DIMENSIONAL isocrystal is isomorphic to a standard one. That is the
rank-one case of Dieudonné–Manin, proved in Lean at the pin. Also reused:
`IsPrincipalIdealRing`, `IsDedekindDomain`, `ValuationRing`,
`AlgebraicGeometry.Scheme`, `AlgebraicGeometry.IsProper`, `IsAlgClosed`,
`PerfectRing`, and Tau Ceti's `AlgebraicGeometry.InvertibleSheaf`, `Huber.Pair`
and `ValuationSpectrum.spa`.

ABSENT at both pins, and so genuinely new: Harder–Narasimhan filtrations,
semistability, slopes in this sense, the Picard group, and ampleness. An index
search found no declaration whose name contains `HarderNarasimhan`, `Semistable`,
`SemiStable` or `PicardGroup`.

The curve itself, its twists and the Banach–Colmez spaces are owned by
`RelativeFarguesFontaine` and the diamond roadmaps and appear as `variable`s.
-/
import Mathlib.RingTheory.WittVector.Isocrystal
import Mathlib.RingTheory.WittVector.Frobenius
import Mathlib.FieldTheory.Perfect
import Mathlib.FieldTheory.IsAlgClosed.Basic
import Mathlib.RingTheory.Localization.FractionRing
import Mathlib.RingTheory.Ideal.Span
import Mathlib.RingTheory.DedekindDomain.Basic
import Mathlib.RingTheory.Valuation.ValuationRing
import Mathlib.AlgebraicGeometry.Scheme
import Mathlib.AlgebraicGeometry.Morphisms.Proper
import Mathlib.CategoryTheory.Sites.Sheaf
import Mathlib.CategoryTheory.Monoidal.Category
import Mathlib.CategoryTheory.Adjunction.Basic
import Mathlib.CategoryTheory.Equivalence
import Mathlib.CategoryTheory.Abelian.Basic
import Mathlib.Algebra.Homology.DerivedCategory.Basic
import Mathlib.LinearAlgebra.Dimension.Finrank

noncomputable section

open CategoryTheory

namespace TauCeti.FFBundles

/-! ## VB0. Isocrystals and slope conventions -/

/-- The local field `E` with uniformizer `π` and residue cardinality `q`, and
`L_E = W_{O_E}(F̄_q)[1/π]` with its Frobenius `σ_E`. For `E = Q_p` this is
Mathlib's `K(p,k)` with `WittVector.FractionRing.frobenius`; the ramified and
unramified general-`E` version is what VB0 adds. -/
variable (E : Type) [Field E] (π : E) (LE : Type) [Field LE] (σE : LE ≃+* LE)

/-- VB0/isocrystal-category-and-standard-block. An isocrystal over `L_E`: a
finite-dimensional `L_E`-vector space with a `σ_E`-semilinear ISOMORPHISM.

The category depends on `E` and NOT only on `L`: if `E'|E` is unramified then
`L_E = L_{E'}` but the two categories differ. Fargues–Fontaine flag the abuse of
notation themselves, and a signature carrying only the Witt ring cannot express
the standard block's `π^{-d}`. -/
structure IsocrystalE (V : Type) [AddCommGroup V] [Module LE V] where
  /-- The semilinear Frobenius, required to be bijective. -/
  frobenius : V ≃ₗ[LE] V
  /-- Finite dimensionality over `L_E`. -/
  finiteDimensional : Module.Finite LE V

/-- Unit test. For `E = Q_p` this must agree with the pinned
`WittVector.Isocrystal`. A definition that does not is a replacement of the
library, not an extension of it. -/
example (p : ℕ) [Fact p.Prime] (k : Type) [Field k] [CharP k p] [PerfectRing k p]
    (V : Type) [AddCommGroup V] [Module (WittVector.FractionRing p k) V]
    [WittVector.Isocrystal p k V] (agrees : Prop) :
    agrees := by
  sorry

/-- The standard block of slope `d/h`: basis `e_1,…,e_h` with `φ(e_i) = e_{i+1}`
for `i < h` and `φ(e_h) = π^{-d} e_1`, so `φ^h = π^{-d} σ^h`, for coprime `d` and
`h > 0`.

Mathlib has the rank-one case as `WittVector.StandardOneDimIsocrystal m`; the
higher-rank blocks are what this node adds. -/
def standardBlock (d : ℤ) (h : ℕ) (_hcop : Nat.gcd d.natAbs h = 1) (_hpos : 0 < h) :
    Type := by
  sorry

/-- Unit test. In rank one the block must be the pinned
`WittVector.StandardOneDimIsocrystal`. -/
example (p : ℕ) [Fact p.Prime] (k : Type) [Field k] [CharP k p] (m : ℤ)
    (restrictsToPinned : Prop) :
    restrictsToPinned := by
  sorry

/-- The functor to bundles. Fargues–Scholze's normalisation is
`O_{X_S}(n) = E(Ĕ, π^{-n}σ)`, with their own parenthesis: "note the change of
sign — the functor `E` reverses slopes". The block of slope `d/h` gives
`O_X(d/h)`, of rank `h` and degree `d`. -/
variable (Curve : Type) (Bundle : Curve → Type)
def bundleOfIsocrystal (X : Curve) (V : Type) [AddCommGroup V] [Module LE V]
    (_D : IsocrystalE LE V) : Bundle X := by
  sorry

/-- Proposition 8.2.6. The associated object is a vector bundle isomorphic to
`⊕_λ O_X(-λ)^{m_λ}` with `m_λ` the multiplicity of `λ` in the Dieudonné–Manin
decomposition, and the functor is compatible with tensor products and duals. -/
theorem bundleOfIsocrystal_decomposition (X : Curve) (decomposesAsSumOfTwists : Prop) :
    decomposesAsSumOfTwists := by
  sorry

/-- Unit test. The standard block of slope `d/h` gives a bundle of RANK `h` and
DEGREE `d`; a sign error here inverts every slope statement downstream. -/
example (d : ℤ) (h : ℕ) (rankOf degreeOf : Curve → ℤ) (X : Curve) :
    rankOf X = (h : ℤ) ∧ degreeOf X = d := by
  sorry

/-- Unit test. Slopes add under tensor and negate under dual. -/
example (λ₁ λ₂ : ℚ) (slopeOfTensor slopeOfDual : ℚ) :
    slopeOfTensor = λ₁ + λ₂ ∧ slopeOfDual = -λ₁ := by
  sorry

/-- Unit test. The category depends on `E`, not only on `L`: for `E'|E`
unramified of degree 2 the two categories differ although `L_E = L_{E'}`. -/
example (E' : Type) [Field E'] (sameL differentCategory : Prop) :
    sameL ∧ differentCategory := by
  sorry

/-- VB0/endomorphism-division-algebra. For `λ = d/h` in lowest terms,
`D_λ = E_h[Π]` with `Π^h = π^d` and `Πx = σ_E(x)Π`, where `E_h` is the unramified
extension of degree `h`. There is an isomorphism `D_λ ≅ End(O_{X_E}(λ))`.

The proof is a DIMENSION COUNT: `O_X(λ) ⊗ O_X(-λ) ≅ O_X^{h²}`, so both sides have
`E`-dimension `h²`. The BRAUER INVARIANT is not computed in anything read, and the
stage text makes it an obligation; it is carried as a gap. -/
def divisionAlgebra (d : ℤ) (h : ℕ) : Type := by sorry

theorem divisionAlgebra_isEnd (d : ℤ) (h : ℕ) (X : Curve)
    (End : Curve → Type) (iso : Prop) :
    iso := by
  sorry

theorem divisionAlgebra_finrank (d : ℤ) (h : ℕ) :
    Module.finrank E (divisionAlgebra E Curve d h) = h * h := by
  sorry

/-- Unit test. `D_0 = E`, and `D_{1/h}` is the division algebra of invariant
`1/h`. The second half is the Brauer statement that was NOT verified. -/
example (h : ℕ) (invariantIsOneOverH : Prop) : invariantIsOneOverH := by
  sorry

/-- Unit test. The `E`-ALGEBRA structure must match, not only the `E`-dimension:
the dimension count alone does not distinguish `D_λ` from `M_h(E)`. -/
example (d : ℤ) (h : ℕ) (matrixAlgebra : Type) (sameDimension differentAlgebra : Prop) :
    sameDimension ∧ differentAlgebra := by
  sorry

/-- VB0/scalar-extension-adjunction. For `E'|E` finite with maximal unramified
subextension of degree `f`, two adjoint functors between the isocrystal
categories, matching `π^*` and `π_*` along `X_{E'} → X_E` under `E(-)`.

Slopes are NOT preserved: the pullback of `O_{X_{C,E}}(1)` is `O_{X_{C,E'}}(r)`
for `E'|E` of degree `r`, so HN slopes scale by `r`. -/
def scalarExtensionUp (E' : Type) [Field E'] : Type := by sorry
def scalarExtensionDown (E' : Type) [Field E'] : Type := by sorry

theorem scalarExtension_adjunction (E' : Type) [Field E'] (adjoint : Prop) :
    adjoint := by
  sorry

/-- Unit test. `f_* O_{X_{C,E'}}(s) = O_{X_C}(s/r)` for the unramified extension
of degree `r`. This is what reduces a fractional slope to an integral one in the
proof of the classification. -/
example (r s : ℤ) (pushforwardOfTwist : ℚ) : pushforwardOfTwist = (s : ℚ) / r := by
  sorry

/-- Unit test. Slopes SCALE by `r`; a construction that preserves them is wrong. -/
example (r : ℤ) (λ : ℚ) (pullbackSlope : ℚ) : pullbackSlope = r * λ := by
  sorry

/-! ## VB1. Vector bundles, descent and cohomology -/

/-- FS II.2.1. `T ↦ RΓ(X_T, ℰ|_{X_T})` is a v-sheaf of COMPLEXES, `T ↦ H⁰(Y_T,ℰ)`
is a v-sheaf with vanishing higher cohomology on affinoids, and
`S ↦ {bundles on X_S}` is a v-stack. The mechanism is the two-term Frobenius
description `RΓ(X_S,ℰ) = [H⁰(Y_S,ℰ) →^{φ-1} H⁰(Y_S,ℰ)]`. -/
theorem cohomology_is_a_vSheaf (isVSheafOfComplexes isVStack : Prop) :
    isVSheafOfComplexes ∧ isVStack := by
  sorry

/-- Unit test. The reduction to the structure sheaf works because `ℰ` restricted
to a compact rational interval is a RETRACT of `O^n`; without that the argument
does not start. -/
example (isRetract : Prop) : isRetract := by
  sorry

/-- VB1/degree-rank-slope-and-HN-formalism. `Pic(X_C) = ℤ` via `n ↦ O_{X_C}(n)`,
so `deg(ℰ) := deg(det ℰ)` is well defined and `μ(ℰ) = deg/rk`.

NOTHING here exists at either pin: no `HarderNarasimhan`, no `Semistable`, no
`PicardGroup`. -/
variable (X : Curve)
def degree (_E : Bundle X) : ℤ := by sorry
def rank (_E : Bundle X) : ℕ := by sorry
def slope (E : Bundle X) : ℚ := (degree Curve Bundle X E : ℚ) / rank Curve Bundle X E

/-- Semistability: `μ(F) ≤ μ(ℰ)` for every proper nonzero subbundle. Stable means
strict inequality. -/
def IsSemistable (_E : Bundle X) : Prop := by sorry
def IsStable (_E : Bundle X) : Prop := by sorry

/-- Rank and degree are ADDITIVE in short exact sequences. This is the hypothesis
the Fargues–Fontaine axiomatics need; without it the filtration need not exist. -/
theorem degree_additive (A B C : Bundle X) (shortExact : Prop) :
    shortExact → degree Curve Bundle X B =
      degree Curve Bundle X A + degree Curve Bundle X C := by
  sorry

/-- The unique exhaustive separating `Q`-indexed Harder–Narasimhan filtration by
saturated subbundles, functorial in `ℰ`. -/
def hnFiltration (_E : Bundle X) : ℚ → Bundle X := by sorry

theorem hnFiltration_unique (E : Bundle X) (uniqueWithSemistableGradeds : Prop) :
    uniqueWithSemistableGradeds := by
  sorry

/-- `Hom(C_{≥λ}, C^{≤μ}) = 0` for `λ > μ`, the orthogonality that makes the
filtration unique. -/
theorem hom_vanishing (lam mu : ℚ) (h : mu < lam) (vanishes : Prop) : vanishes := by
  sorry

/-- Unit test. `deg` is well defined BECAUSE `Pic(X_C) = ℤ`; on a curve with a
larger Picard group the same formula does not define a degree. -/
example (picIsZ : Prop) (degreeWellDefined : Prop) :
    picIsZ → degreeWellDefined := by
  sorry

/-- Unit test. The dominance convention must be pinned once: a filtration indexed
by increasing rather than decreasing slopes reverses every later statement, and
the decomposition records that the convention is not consistent across sources. -/
example (decreasingSlopes increasingSlopes : Prop) :
    decreasingSlopes ∧ ¬ (decreasingSlopes ↔ increasingSlopes) := by
  sorry

/-- FS II.2.5. Cohomology of the twists and representability of the associated
Banach–Colmez spaces. For `λ < 0`, `H⁰ = 0` and `BC(O(λ)[1])` is relatively
representable in LOCALLY SPATIAL DIAMONDS, partially proper and COHOMOLOGICALLY
SMOOTH; for `λ = 0` the Banach–Colmez space is the constant sheaf `E`; for
`λ > 0`, `H¹` vanishes on AFFINOID `S`; and for `0 < λ = r/s ≤ [E:Q_p]` the space
is `Spd k[[x_1^{1/p^∞},…,x_r^{1/p^∞}]]`.

The two hypotheses in capitals are supplied by `DiamondsAndVStacks:D5` and
`DiamondSixOperations:S4`, neither of which the atlas links into VB1. -/
theorem cohomology_of_twists (lam : ℚ) (H0vanishes cohSmooth : Prop) :
    lam < 0 → H0vanishes ∧ cohSmooth := by
  sorry

/-- Unit test. `H¹(X_S, O(λ)) = 0` for `λ > 0` is asserted for AFFINOID `S` only;
dropping the affinoid hypothesis overstates the theorem. -/
example (lam : ℚ) (affinoid H1vanishes : Prop) :
    0 < lam → affinoid → H1vanishes := by
  sorry

/-! ## VB2:ampleness. Positive twists and algebraization -/

/-- FS II.2.6, after Kedlaya–Liu 6.2.4. For `S` affinoid perfectoid and any `ℰ`
there is `n₀` such that for `n ≥ n₀` the twist `ℰ(n)` is globally generated —
admits a surjection `O^m ↠ ℰ(n)` — and `H¹(X_S, ℰ(n)) = 0`. -/
theorem quantitative_global_generation (E : Bundle X) :
    ∃ n₀ : ℤ, ∀ n : ℤ, n₀ ≤ n → True := by
  sorry

/-- FS II.2.7, the axiomatic GAGA theorem. For a locally ringed spectral space
with a line bundle whose twists are eventually globally generated and eventually
have vanishing higher cohomology, pullback along `(X,O_X) → Proj P` is an
EQUIVALENCE on vector bundles and an isomorphism on all cohomology. -/
theorem gaga_equivalence (Xalg : AlgebraicGeometry.Scheme)
    (BundleAlg : AlgebraicGeometry.Scheme → Type) [∀ Y, Category (BundleAlg Y)]
    (BundleAn : Type) [Category BundleAn] :
    Nonempty (BundleAlg Xalg ≌ BundleAn) := by
  sorry

/-- Remark II.2.8: `X^alg` is independent of the chosen `O_X(1)` up to canonical
isomorphism. The source states this WITHOUT proof ("One can check that …"). -/
theorem xalg_independent_of_twist (statedWithoutProof : Prop) : statedWithoutProof := by
  sorry

/-- FS II.2.9. `X_C^alg` is a connected regular noetherian scheme of Krull
dimension 1; `|X_C|^cl` maps bijectively to its closed points; and for any
classical point `x`, `X_C^alg \ {x}` is the spectrum of a PRINCIPAL IDEAL DOMAIN.

That last is what turns the classification into commutative algebra over a PID. -/
theorem schematic_curve (Xalg : AlgebraicGeometry.Scheme)
    (Connected Regular Noetherian : AlgebraicGeometry.Scheme → Prop)
    (krullDim : AlgebraicGeometry.Scheme → ℕ) (R : Type) [CommRing R] :
    Connected Xalg ∧ Regular Xalg ∧ Noetherian Xalg ∧ krullDim Xalg = 1 := by
  sorry

theorem complement_of_classical_point_isPID (R : Type) [CommRing R] [IsDomain R] :
    IsPrincipalIdealRing R := by
  sorry

/-! ## VB2:classification. Geometric points -/

/-- FS II.1.11–II.1.12, II.1.22. For `U = Spa(B,B^+)` affinoid in `Y_C`, `B/m` is
a nonarchimedean field for every maximal `m`, `Spm(B) → |U|` is a bijection onto
the classical points, `U` has finitely many connected components, and a connected
`U` has `B` a PID. Correspondingly a connected affinoid open of `X_C` has `B`
Dedekind, in fact a PID by the Picard computation. -/
theorem classical_points_and_pid (B : Type) [CommRing B] [IsDomain B]
    (connected : Prop) :
    connected → IsPrincipalIdealRing B := by
  sorry

theorem affinoid_open_isDedekind (B : Type) [CommRing B] [IsDomain B]
    (connected : Prop) :
    connected → IsDedekindDomain B := by
  sorry

/-- FS II.2.13. The HN filtration commutes with extension of `C`, and RESCALES
under extension of `E`: for `E'|E` separable of degree `r`, `(ℰ')^{≥λ}` is the
pullback of `ℰ^{≥λ/r}`, because the pullback of `O_{X_{C,E}}(1)` is
`O_{X_{C,E'}}(r)`. -/
theorem hn_base_change (E : Bundle X) (lam : ℚ) (r : ℤ)
    (commutesWithC rescalesByR : Prop) :
    commutesWithC ∧ rescalesByR := by
  sorry

/-- Unit test. The two halves differ: extension of the FIELD `C` preserves the
index `λ`, extension of `E` divides it by `r`. Conflating them is the error. -/
example (lam : ℚ) (r : ℤ) (hr : 0 < r) : lam / r ≠ lam ∨ r = 1 := by
  sorry

/-- FS II.2.14. Every vector bundle on `X_C` is a direct sum of the `O_{X_C}(λ)`,
and a semistable bundle of slope `λ` is `O_{X_C}(λ)^m`.

The functor from isocrystals induces a BIJECTION ON ISOMORPHISM CLASSES. Full
faithfulness on morphisms is NOT asserted, and the stage text requires that
distinction to be kept. -/
theorem classification_of_bundles (E : Bundle X) (isDirectSumOfTwists : Prop) :
    isDirectSumOfTwists := by
  sorry

theorem semistable_is_isotypic (E : Bundle X) (lam : ℚ) (m : ℕ) :
    IsSemistable Curve Bundle X E → True := by
  sorry

/-- Unit test. The functor is a bijection on isomorphism classes and is NOT
asserted fully faithful; a formalisation that states an equivalence of categories
overstates the theorem. -/
example (bijectionOnIsoClasses fullyFaithful : Prop) :
    bijectionOnIsoClasses ∧ ¬ fullyFaithful := by
  sorry

/-- FS II.2.15, the key lemma. An extension `0 → O(-1) → ℰ → O(1/n) → 0` acquires
a nonzero global section after passing to an extension `C'|C` of complete
algebraically closed fields.

The enlargement of `C` is the device the whole proof turns on, and it is why the
theorem is stated at a GEOMETRIC point. -/
theorem key_extension_lemma (n : ℕ) (hn : 1 ≤ n) (E : Bundle X)
    (existsExtensionWithSection : Prop) :
    existsExtensionWithSection := by
  sorry

/-- Unit test. The section need not exist over `C` itself; a statement without the
field extension is false. -/
example (overC afterEnlarging : Prop) : afterEnlarging ∧ ¬ overC := by
  sorry

end TauCeti.FFBundles
