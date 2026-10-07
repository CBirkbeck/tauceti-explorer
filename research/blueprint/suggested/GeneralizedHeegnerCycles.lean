import Mathlib.Algebra.BigOperators.Group.Finset.Defs
import Mathlib.Algebra.Module.LinearMap.Defs
import Mathlib.Algebra.Module.Submodule.Range
import Mathlib.Algebra.Polynomial.Basic
import Mathlib.AlgebraicGeometry.Morphisms.Proper
import Mathlib.AlgebraicGeometry.Morphisms.Smooth
import Mathlib.Data.Int.Basic
import Mathlib.Data.Matrix.Basic
import Mathlib.Data.Nat.Factorial.Basic
import Mathlib.Data.ZMod.Basic
import Mathlib.LinearAlgebra.Dual.Defs
import Mathlib.LinearAlgebra.FiniteDimensional.Basic
import Mathlib.LinearAlgebra.Quotient.Basic
import Mathlib.LinearAlgebra.Quotient.Defs
import Mathlib.LinearAlgebra.Span.Defs
import Mathlib.NumberTheory.MulChar.Basic
import TauCeti.AlgebraicGeometry.AbelianVariety.Isogeny

/-!
# Suggested Lean forms: Generalized Heegner cycles and their Iwasawa variation

Standard note: this file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/GeneralizedHeegnerCycles.md` is definitive. The forms below suggest
names and signatures, so that contributors and reviewers converge on an interface; every proof
is `sorry`, and nothing here is implemented. Pins: Mathlib
082e2d37e8b0463410cdb532e111cd43d5a66174, Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

The file joins the suggested files of the roadmap's two parts, keeping every name the packets
give, so that every definition, API item and unit test of a packet resolves here.

* Part GH.0 (layers GH.0–GH.7), namespace `TauCeti.GeneralizedHeegner`. For each node, a comment
  block gives the packet statement, then the declaration, its API items as lemmas and its unit
  tests, each test both as a named theorem (the packet's name) and as an `example`.
* Part GH.8 (layer GH.8), namespace `TauCeti.GeneralizedHeegnerCycles.WeightTwoChecks`. Only the
  algebraic components of the weight-two comparisons are stated, with regression examples;
  the arithmetic signatures are omitted, as listed below. The two parts use different root
  namespaces because their packets do; the roadmap document's handoff note proposes one.

Carrier convention of part GH.0. `D`, `DQ`, `Chow`, `Coh` and `DualQ` are parameters supplied by
other owners, with their genuine Mathlib module structures. They do not define cohomology or
Chow groups. Only the linear realization of a geometric construction is expressed when its
geometric carrier is absent. Ring-class actions, residual-image hypotheses, crystalline and
ordinary hypotheses, nonexceptional specializations and admissible Coleman primitives are
omitted where the owner's type is unavailable; the omissions are recorded beside the
signatures, and the full hypotheses remain in the packet and the document. A displayed theorem
with these hypotheses omitted is a prototype, not a theorem about arbitrary maps or classes.
The CM curve and marked isogenies use the pinned Tau Ceti abelian varieties, their endomorphism
ring and isogeny predicate.

Omitted signatures of part GH.8. The arithmetic targets are specified in the packet and the
document; their signatures are omitted where the suppliers do not yet provide the types or maps:
* `weight-zero-cycle` and `modular-quotient-kummer` need the actual Chow group, curve, Jacobian,
  Picard/Gysin comparison and continuous Tate-module Kummer map;
* `character-sum-comparison`, `positive-conductor-stabilization` and
  `positive-tail-corestriction` need the actual coefficient cohomology maps, restriction and
  corestriction;
* `differential-evaluation` needs crystalline/de Rham realization and elliptic logarithms,
  including the ramified-conductor base-change comparisons;
* `ordinary-p-old-family` needs Hida moments, local regulator descent and global control;
* `weight-two-reciprocity`, `automorphic-reciprocity-export` and `corrected-bsd-input-export`
  need the source-qualified regulators, completed unramified rings and period/twist maps.
No opaque arithmetic types or conclusion-bearing fields replace these missing interfaces.

Unresolved test contracts. The independent review of part GH.0 found five interfaces whose
examples do not yet discriminate a wrong definition: `CMCurve` (the CM action and normalized
eigenvector), `epsA` (the signed permutation projector), `IsogPair` (conductor and degree),
`colemanPrimitive` (a nonzero primitive) and `universalNormClass` (the norm tower). They are kept
as the part left them; the document's gap "Suggested interfaces and discriminating geometric
tests" records the required fixtures.

Elaboration. `lean-check` on this file, in the shared build at Mathlib 082e2d3, stops at its
Tau Ceti import: that build has no object file for `TauCeti.AlgebraicGeometry.AbelianVariety.Isogeny`.
A scratch copy in which the import is replaced by the eight Tau Ceti modules it needs, read at
f790474 and inlined in dependency order, elaborates with exit code 0: no errors, and the only
warnings are 266 `declaration uses 'sorry'` (221 from part GH.0, 45 from part GH.8). The scratch
copy is not part of the repository; this is a harness check, not a compilation of this file.
-/

section GeneralizedHeegnerPartGH0

open CategoryTheory AlgebraicGeometry

namespace TauCeti.GeneralizedHeegner

set_option linter.unusedVariables false

variable {F O O' : Type*} [Field F] [CommRing O] [CommRing O']
variable {D D' : Type*} [AddCommGroup D] [Module F D]
  [Module ℚ D] [AddCommGroup D'] [Module F D']
variable {DQ Chow Chow' Coh Coh' DualQ : Type*}
  [AddCommGroup DQ] [Module ℚ DQ]
  [AddCommGroup Chow] [Module ℚ Chow]
  [AddCommGroup Chow'] [Module ℚ Chow']
  [AddCommGroup Coh] [Module ℚ Coh]
  [AddCommGroup Coh'] [Module ℚ Coh']
  [AddCommGroup DualQ] [Module ℚ DualQ]

/-! GeneralizedHeegnerCycles:GH.0 — The CM elliptic curve A and the algebraic splitting of H¹_dR(A)
Node: GeneralizedHeegnerCycles:GH.0/cm-elliptic-curve-and-its-hodge-splitting
A CM elliptic curve is an elliptic abelian variety A/H, with H containing the Hilbert class field of the imaginary quadratic K, and a specified isomorphism O_K ≅ End_H(A), normalized so [α]*ω=αω. For F⊇H, H¹_dR(A/F)=Fω⊕Fη, where η lies on the conjugate CM eigenline and ⟨ω,η⟩=1. At an ordinary good split prime this conjugate eigenline is the unit-root line. No good model is inferred from the level N.

The exact arithmetic/geometric conditions and coefficient identifications are
those of the document; absent owner types are omitted in this prototype. -/

structure CMCurve (H O : Type*) [Field H] [CommRing O] where
  curve : TauCeti.AlgebraicGeometry.AbelianVariety H
  dimension_one : curve.dim = 1
  cm : O ≃+* TauCeti.AlgebraicGeometry.AbelianVariety.End curve

/-- The identity-character eigenvector ω lies in ker([α]*−α). -/
theorem CMCurve.h10 (u : Module.End F D) (α : F) (ω : D) (h : u ω = α • ω) : ω ∈ LinearMap.ker (u-α • LinearMap.id) := by
  sorry

/-- The conjugate-character eigenvector η lies in ker([α]*−ᾱ). -/
theorem CMCurve.h01 (u : Module.End F D) (αbar : F) (η : D) (h : u η = αbar • η) : η ∈ LinearMap.ker (u-αbar • LinearMap.id) := by
  sorry

/-- The two distinct CM eigenlines span the cohomology space and have zero intersection. -/
theorem CMCurve.hodgeSplitting (u : Module.End F D) (α αbar : F) (h : α ≠ αbar) (hu : (u-α • LinearMap.id).comp (u-αbar • LinearMap.id) = 0) : LinearMap.ker (u-α • LinearMap.id) ⊔ LinearMap.ker (u-αbar • LinearMap.id) = ⊤ ∧ Disjoint (LinearMap.ker (u-α • LinearMap.id)) (LinearMap.ker (u-αbar • LinearMap.id)) := by
  sorry

/-- Dividing η by ⟨ω,η⟩ gives cup product 1. It is the unique scalar multiple aη with cup product 1; on the one-dimensional conjugate eigenline this gives the unique normalized vector. -/
theorem CMCurve.etaOfOmega (b : D →ₗ[F] D →ₗ[F] F) (ω η : D) (h : b ω η ≠ 0) : b ω ((b ω η)⁻¹ • η) = 1 ∧ ∀ a : F, b ω (a • η) = 1 → a = (b ω η)⁻¹ := by
  sorry

/-- A linear realization map commuting with the CM action transports a character eigenvector to an eigenvector with the same character value. -/
theorem CMCurve.map_eigenvector (f : D →ₗ[F] D') (u : Module.End F D) (u' : Module.End F D') (hc : f.comp u = u'.comp f) (α : F) (ω : D) (hω : u ω = α • ω) : u' (f ω) = α • f ω := by
  sorry

/-- Planned test `TauCeti.GeneralizedHeegner.cmCurve_i_action` (computation): For the ordered CM eigenbasis at K=Q(i), [i]* acts diagonally by i and −i. -/
theorem cmCurve_i_action (i : F) (hi : i^2 = -1) : (i*(1 : F), -i*(0 : F)) = (i,0) ∧ (i*(0 : F),-i*(1 : F)) = (0,-i) := by
  sorry

example (i : F) (hi : i^2 = -1) : (i*(1 : F), -i*(0 : F)) = (i,0) ∧ (i*(0 : F),-i*(1 : F)) = (0,-i) := by
  sorry

/-- Planned test `TauCeti.GeneralizedHeegner.cmCurve_normalization` (characterisation): Scaling ω by a≠0 scales its normalized η by a⁻¹, preserving the cup product 1. -/
theorem cmCurve_normalization (a : F) (ha : a ≠ 0) (b : D →ₗ[F] D →ₗ[F] F) (ω η : D) : b (a • ω) (a⁻¹ • η) = b ω η := by
  sorry

example (a : F) (ha : a ≠ 0) (b : D →ₗ[F] D →ₗ[F] F) (ω η : D) : b (a • ω) (a⁻¹ • η) = b ω η := by
  sorry

/-- Planned test `TauCeti.GeneralizedHeegner.cmCurve_scalar_endomorphism` (compatibility): Integer multiplication on the CM curve agrees with the existing abelian variety mulBy map. -/
theorem cmCurve_scalar_endomorphism (H O : Type*) [Field H] [CommRing O] (A : CMCurve H O) (n : ℤ) : TauCeti.AlgebraicGeometry.AbelianVariety.mulBy A.curve n = TauCeti.AlgebraicGeometry.AbelianVariety.End.toHom (n : TauCeti.AlgebraicGeometry.AbelianVariety.End A.curve) := by
  sorry

example (H O : Type*) [Field H] [CommRing O] (A : CMCurve H O) (n : ℤ) : TauCeti.AlgebraicGeometry.AbelianVariety.mulBy A.curve n = TauCeti.AlgebraicGeometry.AbelianVariety.End.toHom (n : TauCeti.AlgebraicGeometry.AbelianVariety.End A.curve) := by
  sorry

/-! GeneralizedHeegnerCycles:GH.0 — The projector ε_A on A^m and Lemma 1.8
Node: GeneralizedHeegnerCycles:GH.0/cm-projector-and-symmetric-power
For m≥0 let Ξ_m=μ₂^m⋊S_m act on A^m by inversion and permutation, and χ_m be the product of the inversion signs and the permutation sign. Define ε_A=(2^m m!)⁻¹Σ_g χ_m(g)Γ_g as a rational correspondence. Its realization is idempotent and projects H^j(A^m) to Sym^m H¹(A) in degree m and to zero otherwise. The permutation sign cancels the graded Künneth sign; it must not be replaced by unsigned geometric symmetrization.

The exact arithmetic/geometric conditions and coefficient identifications are
those of the document; absent owner types are omitted in this prototype. -/

noncomputable def epsA {G : Type*} [Group G] [Fintype G] (χ : G →* ℚˣ) (ρ : G →* Module.End ℚ DQ) : Module.End ℚ DQ := (Fintype.card G : ℚ)⁻¹ • ∑ g, (χ g : ℚ) • ρ g

/-- ε_A²=ε_A for the graph action of Ξ_m. -/
theorem epsA_idem {G : Type*} [Group G] [Fintype G] (χ : G →* ℚˣ) (ρ : G →* Module.End ℚ DQ) : (epsA χ ρ).comp (epsA χ ρ) = epsA χ ρ := by
  sorry

/-- Its range is the χ_m-isotypic subspace of the tensor realization. -/
theorem epsA_image {G : Type*} [Group G] [Fintype G] (χ : G →* ℚˣ) (ρ : G →* Module.End ℚ DQ) (v : DQ) : v ∈ LinearMap.range (epsA χ ρ) ↔ ∀ g, ρ g v = (χ g : ℚ) • v := by
  sorry

/-- The inverse-graph involution fixes ε_A. -/
theorem epsA_transpose {G : Type*} [Group G] [Fintype G] (χ : G →* ℚˣ) (ρ : G →* Module.End ℚ DQ) : (Fintype.card G : ℚ)⁻¹ • ∑ g, (χ g : ℚ) • ρ (g⁻¹) = epsA χ ρ := by
  sorry

/-- An equivariant linear map intertwines the signed character average with the same average on the target realization. -/
theorem epsA_natural {G : Type*} [Group G] [Fintype G] (χ : G →* ℚˣ) (ρ : G →* Module.End ℚ DQ) (ρ' : G →* Module.End ℚ Coh) (f : DQ →ₗ[ℚ] Coh) (hf : ∀ g, f.comp (ρ g) = (ρ' g).comp f) : f.comp (epsA χ ρ) = (epsA χ ρ').comp f := by
  sorry

/-- Planned test `TauCeti.GeneralizedHeegner.epsA_order` (computation): For m=2 the character average has denominator 8. -/
theorem epsA_order : 2^2 * Nat.factorial 2 = 8 := by
  sorry

example : 2^2 * Nat.factorial 2 = 8 := by
  sorry

/-- Planned test `TauCeti.GeneralizedHeegner.epsA_weight_zero` (degenerate): At m=0 the projector acts as the identity on H⁰(A⁰)=F. -/
theorem epsA_weight_zero {G : Type*} [Group G] [Fintype G] [Unique G] (χ : G →* ℚˣ) (ρ : G →* Module.End ℚ DQ) : epsA χ ρ = LinearMap.id := by
  sorry

example {G : Type*} [Group G] [Fintype G] [Unique G] (χ : G →* ℚˣ) (ρ : G →* Module.End ℚ DQ) : epsA χ ρ = LinearMap.id := by
  sorry

/-- Planned test `TauCeti.GeneralizedHeegner.epsA_koszul` (non-example): A transposition acts with −1 on H¹⊗H¹; multiplying by its character sign therefore selects symmetric tensors. -/
theorem epsA_koszul (x : ℚ) : (-1 : ℚ) * (-x) = x := by
  sorry

example (x : ℚ) : (-1 : ℚ) * (-x) = x := by
  sorry

/-! GeneralizedHeegnerCycles:GH.0 — The eigenbasis ω_A^jη_A^{m−j} of Sym^m H¹_dR(A) and its O_K-characters
Node: GeneralizedHeegnerCycles:GH.0/cm-character-decomposition
For 0 ≤ j ≤ m, the classes ω_A^jη_A^{m−j} := ε_A(p_1^*ω_A ∧ … ∧ p_j^*ω_A ∧ p_{j+1}^*η_A ∧ … ∧ p_m^*η_A) form a basis of ε_A H^m_dR(A^m/F) = Sym^m H¹_dR(A/F). The diagonal action of α ∈ O_K on A^m acts on ω_A^jη_A^{m−j} by α^jᾱ^{m−j}. Moreover ω_A^jη_A^{m−j} = (j!(m − j)!/m!) Σ_{|I| = j} p_1^*ϖ_{1,I} ∧ … ∧ p_m^*ϖ_{m,I}, where ϖ_{i,I} = ω_A for i ∈ I and η_A otherwise.

The exact arithmetic/geometric conditions and coefficient identifications are
those of the document; absent owner types are omitted in this prototype. -/

theorem cmCharacterDecomposition (u : Module.End F D) (basisVector : ℕ → D) (α αbar : F) (m j : ℕ) (hj : j ≤ m) : u (basisVector j) = (α^j*αbar^(m-j)) • basisVector j := by
  sorry

/-! GeneralizedHeegnerCycles:GH.0 — The variety X_m = W_m × A^m and the projector ε_X = ε_W ε_A
Node: GeneralizedHeegnerCycles:GH.0/generalized-kuga-sato-variety-and-its-projector
Over F⊇H form X_m=W_m×_F A^m, dim X_m=2m+1, and ε_X=ε_W ε_A using commuting factor correspondences. ε_W is the imported universal-family projector, including the N-torsion averaging and sign projector. ε_X is self-transpose and is defined over Z[1/(2N m!)] at the level of denominators; this does not assert that X_m itself has a model over Z[1/N].

The exact arithmetic/geometric conditions and coefficient identifications are
those of the document; absent owner types are omitted in this prototype. -/

noncomputable def epsX (eW eA : Module.End F D) : Module.End F D := eW.comp eA

/-- For commuting factor realizations, interchanging ε_W and ε_A leaves ε_X unchanged. The geometric factor-commutation input comes from their separate factor actions. -/
theorem epsX_commute (eW eA : Module.End F D) (h : eW.comp eA = eA.comp eW) : epsX eW eA = epsX eA eW := by
  sorry

/-- The commuting product of the two idempotents is idempotent. -/
theorem epsX_idem (eW eA : Module.End F D) (hW : eW.comp eW = eW) (hA : eA.comp eA = eA) (hc : eW.comp eA = eA.comp eW) : (epsX eW eA).comp (epsX eW eA) = epsX eW eA := by
  sorry

/-- ε_X acts by applying ε_A and then ε_W. -/
theorem epsX_factor (eW eA : Module.End F D) (v : D) : epsX eW eA v = eW (eA v) := by
  sorry

/-- The product-projector denominator is N^m2^{2m}(m!)²; inverting 2N m! clears it. -/
theorem epsX_denominator (N m : ℕ) (hN : N ≠ 0) : (N^m * 2^(2*m) * (Nat.factorial m)^2 : ℚ) * (N^m * 2^(2*m) * (Nat.factorial m)^2 : ℚ)⁻¹ = 1 := by
  sorry

/-- Planned test `TauCeti.GeneralizedHeegner.X_dim` (computation): At m=2, X has dimension 5 and the graph cycle has codimension 3. -/
theorem X_dim : (2+1)+2 = 5 ∧ 5-2 = 3 := by
  sorry

example : (2+1)+2 = 5 ∧ 5-2 = 3 := by
  sorry

/-- Planned test `TauCeti.GeneralizedHeegner.epsX_weight_zero` (degenerate): With the CM factor trivial, ε_X=ε_W. -/
theorem epsX_weight_zero (eW : Module.End F D) : epsX eW LinearMap.id = eW := by
  sorry

example (eW : Module.End F D) : epsX eW LinearMap.id = eW := by
  sorry

/-- Planned test `TauCeti.GeneralizedHeegner.epsX_factor_test` (compatibility): On a supplied tensor-factor realization the action is the composite, in the displayed order. -/
theorem epsX_factor_test (eW eA : Module.End F D) (v : D) : epsX eW eA v = eW (eA v) := by
  sorry

example (eW eA : Module.End F D) (v : D) : epsX eW eA v = eW (eA v) := by
  sorry

/-! GeneralizedHeegnerCycles:GH.0 — Projected middle cohomology
Node: GeneralizedHeegnerCycles:GH.0/cohomology-of-the-generalized-kuga-sato-variety
For m≥1, ε_X H*_dR(X_m)=ε_X H^{2m+1}_dR(X_m)=H¹_par(C,L_m,∇)⊗Sym^m H¹_dR(A). In the p-adic étale realization, ε_X H^{2m+1}_et(X_m,Fbar,Q_p)≅H¹_par(C_Fbar,𝕃_m)⊗Sym^m H¹_et(A_Fbar,Q_p), Galois-equivariantly. The projector kills every other cohomological degree. In particular ε_X H^{2m+2}(X_m)=0. The Hodge-filtration identification is the separate projected-hodge-filtration theorem.

The exact arithmetic/geometric conditions and coefficient identifications are
those of the document; absent owner types are omitted in this prototype. -/

theorem epsX_middle (m j : ℕ) (hj : j ≠ 2*m+1) (projected : ℕ → Submodule F D) : projected j = ⊥ := by
  sorry

/-! GeneralizedHeegnerCycles:GH.0 — Projected Hodge filtration
Node: GeneralizedHeegnerCycles:GH.0/projected-hodge-filtration
For m≥1 and X_m/F with its supplied de Rham realization, f⊗α↦ω_f∧α identifies S_{m+2}(Γ₁(N),F)⊗Sym^m H¹_dR(A/F) with Fil^{m+1}(ε_X H^{2m+1}_dR(X_m/F)). The entire symmetric CM factor occurs, not only its holomorphic line. This is the filtration piece used as the domain of the p-adic Abel–Jacobi dual functional.

The exact arithmetic/geometric conditions and coefficient identifications are
those of the document; absent owner types are omitted in this prototype. -/

theorem projectedHodgeFiltration (holomorphic : Submodule F D) (Fil : ℕ → Submodule F D) (m : ℕ) (hm : 1 ≤ m) : Fil (m+1) = holomorphic := by
  sorry

/-! GeneralizedHeegnerCycles:GH.0 — Self-duality of ε_X H^{2m+1}(X_m)(m + 1)
Node: GeneralizedHeegnerCycles:GH.0/self-duality-of-the-projected-cohomology
Poincaré duality on the smooth proper (2m + 1)-dimensional X_m restricts to a perfect pairing ε_X H^{2m+1}(X_m) × ε_X H^{2m+1}(X_m) → H^{4m+2}(X_m) ≅ ℚ_p(−2m − 1) in étale cohomology (and into F in de Rham). So V := ε_X H^{2m+1}_et(X_{m,F̄}, ℚ_p)(m + 1) is self-dual up to ℚ_p(1): V ≅ V^∨(1). The pairing is the one induced by (2.2.3) on L_{m,m} = L_m ⊗ Sym^m H¹(A). V is the coefficient representation of the generalized Heegner classes, and its f-isotypic part is V_f ⊗ Sym^m H¹(A)(m + 1).

The exact arithmetic/geometric conditions and coefficient identifications are
those of the document; absent owner types are omitted in this prototype. -/

theorem projectedSelfDuality (pairing : D →ₗ[F] D →ₗ[F] F) : Nonempty (D ≃ₗ[F] Module.Dual F D) := by
  sorry

/-! GeneralizedHeegnerCycles:GH.0 — Newform and CM coefficient projector
Node: GeneralizedHeegnerCycles:GH.0/newform-cm-projector
For a normalized eigenform f of weight k=m+2, take the imported f-isotypic Hecke summand of ε_W cohomology and tensor the specified CM character line in Sym^m H¹(A). Extend the coefficient field enough to split both actions. Choose an integral stable lattice only after accounting for the denominators of ε_W, ε_A and the Hecke idempotent; p∤2N m! alone does not make the Hecke idempotent integral. The Tate twist is the cohomological self-dual one, V_f(r) when k=2r.

The exact arithmetic/geometric conditions and coefficient identifications are
those of the document; absent owner types are omitted in this prototype. -/

noncomputable def coefficientProjector (ef eχ : Module.End F D) := ef.comp eχ

/-- The modular and CM projections compose. -/
theorem coefficientProjector_factor (ef eχ : Module.End F D) (z : D) : coefficientProjector ef eχ z = ef (eχ z) := by
  sorry

/-- For r≥1, the fiber-power index 2r−2 gives weight 2r and the self-dual modular twist V_f(r). -/
theorem coefficientProjector_twist (r : ℕ) (hr : 1 ≤ r) : (2*r-2)+2 = 2*r := by
  sorry

/-- A recorded integral lattice is preserved by the composite only after both factor projectors preserve that lattice. -/
theorem coefficientProjector_lattice [Module O D] (L : Submodule O D) (ef eχ : Module.End F D) (hf : ∀ z ∈ L, ef z ∈ L) (hχ : ∀ z ∈ L, eχ z ∈ L) (z : D) (hz : z ∈ L) : coefficientProjector ef eχ z ∈ L := by
  sorry

/-- Planned test `TauCeti.GeneralizedHeegner.coefficientProjector_identity` (degenerate): After restricting the coefficient space to the trivial CM character summand, its identity projector leaves the f summand. The trivial-character projector on the whole symmetric power need not be the identity. -/
theorem coefficientProjector_identity (ef : Module.End F D) : coefficientProjector ef LinearMap.id = ef := by
  sorry

example (ef : Module.End F D) : coefficientProjector ef LinearMap.id = ef := by
  sorry

/-- Planned test `TauCeti.GeneralizedHeegner.coefficientProjector_order` (compatibility): On commuting projectors the order of projection does not matter. -/
theorem coefficientProjector_order (ef eχ : Module.End F D) (h : ef.comp eχ = eχ.comp ef) : coefficientProjector ef eχ = coefficientProjector eχ ef := by
  sorry

example (ef eχ : Module.End F D) (h : ef.comp eχ = eχ.comp ef) : coefficientProjector ef eχ = coefficientProjector eχ ef := by
  sorry

/-- Planned test `TauCeti.GeneralizedHeegner.coefficientProjector_denominator` (non-example): A rational idempotent with 1/2 entries need not preserve an integral lattice: the average of (1,0) and (0,1) is (1/2,1/2). -/
theorem coefficientProjector_denominator : ((1/2,1/2) : ℚ × ℚ) ∉ Set.range (fun z : ℤ × ℤ => ((z.1 : ℚ),(z.2 : ℚ))) := by
  sorry

example : ((1/2,1/2) : ℚ × ℚ) ∉ Set.range (fun z : ℤ × ℤ => ((z.1 : ℚ),(z.2 : ℚ))) := by
  sorry

/-! GeneralizedHeegnerCycles:GH.0 — Good model comparison for the CM product
Node: GeneralizedHeegnerCycles:GH.0/cm-product-good-model
If W_m and A have smooth proper models over O_F, their product has a smooth proper model over O_F. For BDP §3 take F/Q_p finite unramified, p∤N, and a chosen good CM model; in their canonical conductor-c application also p∤c d_K. An arbitrary CM twist is not made good by p∤N. The model of W_m over Z[1/N] supplied by Conrad belongs to R14.3; it is not a global model of X_m.

The exact arithmetic/geometric conditions and coefficient identifications are
those of the document; absent owner types are omitted in this prototype. -/

theorem cmProductGoodModel {X Y S : Scheme} (f : X ⟶ S) (g : Y ⟶ S) [Smooth f] [Smooth g] [IsProper f] [IsProper g] : Smooth (CategoryTheory.Limits.pullback.fst f g ≫ f) ∧ IsProper (CategoryTheory.Limits.pullback.fst f g ≫ f) := by
  sorry

/-! GeneralizedHeegnerCycles:GH.1 — The sets Isog_c^𝔑(A) of CM isogenies of conductor c with kernel prime to A[𝔑]
Node: GeneralizedHeegnerCycles:GH.1/isogenies-of-conductor-c-prime-to-n
Assume the Heegner hypothesis: there is an ideal 𝔑 ⊂ O_K with O_K/𝔑 ≅ ℤ/Nℤ. Fix A with End(A) = O_K and a Γ₁(N)-level structure t_A ∈ A[𝔑] over the field H̃ ⊇ H over which A[𝔑] becomes constant. Isog(A) is the set of isomorphism classes of pairs (φ, A′) with φ : A → A′ an isogeny over K̄. (φ, A′) has conductor c if End(A′) = O_c = ℤ + cO_K. Isog^𝔑(A) consists of the pairs with ker φ ∩ A[𝔑] = 0, and Isog_c^𝔑(A) = Isog_c(A) ∩ Isog^𝔑(A). For (φ, A′) ∈ Isog^𝔑(A), (A′, φ(t_A)) is a Γ₁(N)-structure and determines a point P_{A′} of C = X₁(N). The semigroup P(O_c) of invertible integral O_c-ideals relatively prime to 𝔑_c=𝔑∩O_c acts on Isog_c^𝔑(A) by 𝔞 ⋆ (φ, A′) = (φ_𝔞φ, A′/A′[𝔞]).

The exact arithmetic/geometric conditions and coefficient identifications are
those of the document; absent owner types are omitted in this prototype. -/

structure IsogPair (H O : Type*) [Field H] [CommRing O] (A : CMCurve H O) where
  target : TauCeti.AlgebraicGeometry.AbelianVariety H
  dimension_one : target.dim = 1
  morphism : A.curve ⟶ target
  isogeny : TauCeti.AlgebraicGeometry.AbelianVariety.IsIsogeny morphism

/-- The target endomorphism order is O_c; the conductor is preserved under isomorphism of marked targets. -/
theorem IsogPair.conductor (H O : Type*) [Field H] [CommRing O] (A : CMCurve H O) (P Q : IsogPair H O A) (e : P.target ≅ Q.target) (c : {B : TauCeti.AlgebraicGeometry.AbelianVariety H // B.dim = 1} → ℕ) : c ⟨P.target,P.dimension_one⟩ = c ⟨Q.target,Q.dimension_one⟩ := by
  sorry

/-- The kernel condition ker φ∩A[𝔑]=0 transports the marked point of exact order N to a point of exact order N. -/
theorem IsogPair.level {G G' : Type*} [AddGroup G] [AddGroup G'] (φ : G →+ G') (t : G) (N : ℕ) (h : ∀ n : ℕ, n • φ t = 0 ↔ n • t = 0) : N • φ t = 0 ↔ N • t = 0 := by
  sorry

/-- The ideal-action transports the isogeny pair through the commutative CM reciprocity square. -/
theorem IsogPair.idealAction (H : Type*) [Field H] (A A' B B' : TauCeti.AlgebraicGeometry.AbelianVariety H) (φ : A ⟶ B) (φ' : A' ⟶ B') (a : A ⟶ A') (b : B ⟶ B') : a ≫ φ' = φ ≫ b := by
  sorry

/-- Planned test `TauCeti.GeneralizedHeegner.isog_identity_conductor` (degenerate): The identity isogeny of A has target order O_K, conductor 1. -/
theorem isog_identity_conductor (H O : Type*) [Field H] [CommRing O] (A : CMCurve H O) : ({target := A.curve, dimension_one := A.dimension_one, morphism := 𝟙 A.curve, isogeny := TauCeti.AlgebraicGeometry.AbelianVariety.isIsogeny_id A.curve} : IsogPair H O A).morphism = 𝟙 A.curve := by
  sorry

example (H O : Type*) [Field H] [CommRing O] (A : CMCurve H O) : ({target := A.curve, dimension_one := A.dimension_one, morphism := 𝟙 A.curve, isogeny := TauCeti.AlgebraicGeometry.AbelianVariety.isIsogeny_id A.curve} : IsogPair H O A).morphism = 𝟙 A.curve := by
  sorry

/-- Planned test `TauCeti.GeneralizedHeegner.isog_level_failure` (non-example): Multiplication by N kills an N-torsion level point and cannot satisfy the prime-to-N condition. -/
theorem isog_level_failure {G : Type*} [AddGroup G] (t : G) (N : ℕ) (ht : N • t = 0) (hne : t ≠ 0) : N • t ≠ t := by
  sorry

example {G : Type*} [AddGroup G] (t : G) (N : ℕ) (ht : N • t = 0) (hne : t ≠ 0) : N • t ≠ t := by
  sorry

/-- Planned test `TauCeti.GeneralizedHeegner.isog_degree_multiplicativity` (compatibility): Composing finite isogenies multiplies their degree, in agreement with the elliptic-curve isogeny degree API supplied upstream. -/
theorem isog_degree_multiplicativity (H : Type*) [Field H] (A B C : TauCeti.AlgebraicGeometry.AbelianVariety H) (f : A ⟶ B) (g : B ⟶ C) (hf : TauCeti.AlgebraicGeometry.AbelianVariety.IsIsogeny f) (hg : TauCeti.AlgebraicGeometry.AbelianVariety.IsIsogeny g) (dAB : (A ⟶ B) → ℕ) (dBC : (B ⟶ C) → ℕ) (dAC : (A ⟶ C) → ℕ) : dAC (f ≫ g) = dAB f * dBC g := by
  sorry

example (H : Type*) [Field H] (A B C : TauCeti.AlgebraicGeometry.AbelianVariety H) (f : A ⟶ B) (g : B ⟶ C) (hf : TauCeti.AlgebraicGeometry.AbelianVariety.IsIsogeny f) (hg : TauCeti.AlgebraicGeometry.AbelianVariety.IsIsogeny g) (dAB : (A ⟶ B) → ℕ) (dBC : (B ⟶ C) → ℕ) (dAC : (A ⟶ C) → ℕ) : dAC (f ≫ g) = dAB f * dBC g := by
  sorry

/-! GeneralizedHeegnerCycles:GH.1 — The generalized Heegner cycle Δ_φ = ε_X Υ_φ
Node: GeneralizedHeegnerCycles:GH.1/generalized-heegner-cycle
For (φ, A′) ∈ Isog^𝔑(A), the pair (A′, φ(t_A)) gives an embedding ι_{A′} : (A′)^m → W_m onto the fibre of W_m over P_{A′}. Let Υ_φ be the image of Graph(φ)^m ⊂ (A × A′)^m ≅ (A′)^m × A^m in X_m = W_m × A^m under ι_{A′} × id. It is a codimension-(m + 1) cycle. The generalized Heegner cycle is Δ_φ := ε_X Υ_φ ∈ CH^{m+1}(X_m)_ℚ, supported on the fibre π_m^{−1}(P_{A′}) ≅ (A′)^m × A^m. For m = 0, Δ_φ is the CM point P_{A′} of C, and it is replaced by P_{A′} − ∞ for a cusp ∞.

The exact arithmetic/geometric conditions and coefficient identifications are
those of the document; absent owner types are omitted in this prototype. -/

noncomputable def gHC (ε : Module.End ℚ Chow) (graph : Chow) : Chow := ε graph

/-- The m-dimensional graph product in X_m of dimension 2m+1 has codimension m+1. -/
theorem gHC_codim (m : ℕ) : (2*m+1)-m = m+1 := by
  sorry

/-- ε_X fixes Δ_φ. -/
theorem gHC_projector (ε : Module.End ℚ Chow) (hε : ε.comp ε = ε) (graph : Chow) : ε (gHC ε graph) = gHC ε graph := by
  sorry

/-- Rationally equivalent graph representatives give the same cycle class. -/
theorem gHC_rational_equivalence (ε : Module.End ℚ Chow) (g h : Chow) (heq : g = h) : gHC ε g = gHC ε h := by
  sorry

/-- Base change commutes with projection when graph correspondences and the projector are transported. -/
theorem gHC_baseChange (ε : Module.End ℚ Chow) (ε' : Module.End ℚ Chow') (bc : Chow →ₗ[ℚ] Chow') (h : bc.comp ε = ε'.comp bc) (g : Chow) : bc (gHC ε g) = gHC ε' (bc g) := by
  sorry

/-- Planned test `TauCeti.GeneralizedHeegner.upsilon_codim` (computation): At m=2 the graph has dimension 2 and codimension 3 in X₂. -/
theorem upsilon_codim : (2*2+1)-2 = 3 := by
  sorry

example : (2*2+1)-2 = 3 := by
  sorry

/-- Planned test `TauCeti.GeneralizedHeegner.gHC_weight_zero` (degenerate): At m=0 replace the point by point minus a chosen cusp; its degree is zero. -/
theorem gHC_weight_zero (degree : Chow →ₗ[ℚ] ℚ) (point cusp : Chow) (hp : degree point = 1) (hc : degree cusp = 1) : degree (point-cusp) = 0 := by
  sorry

example (degree : Chow →ₗ[ℚ] ℚ) (point cusp : Chow) (hp : degree point = 1) (hc : degree cusp = 1) : degree (point-cusp) = 0 := by
  sorry

/-- Planned test `TauCeti.GeneralizedHeegner.gHC_projected_test` (characterisation): An idempotent ε fixes gHC(ε,graph), and gHC(id,graph)=graph. Together these exclude both an unprojected graph and the identically zero construction (take a nonzero graph for the identity fixture). -/
theorem gHC_projected_test (ε : Module.End ℚ Chow) (hε : ε.comp ε = ε) (g : Chow) : ε (gHC ε g) = gHC ε g ∧ gHC (LinearMap.id : Module.End ℚ Chow) g = g := by
  sorry

example (ε : Module.End ℚ Chow) (hε : ε.comp ε = ε) (g : Chow) : ε (gHC ε g) = gHC ε g ∧ gHC (LinearMap.id : Module.End ℚ Chow) g = g := by
  sorry

/-! GeneralizedHeegnerCycles:GH.1 — BDP Remark 2.6: the field of definition of Δ_φ
Node: GeneralizedHeegnerCycles:GH.1/field-of-definition-of-generalized-heegner-cycles
If (φ, A′) ∈ Isog_c^𝔑(A), then Δ_φ is defined over the compositum H̃·H_c of the abelian extension H̃/K over which (A, t_A) is defined with the ring class field H_c of conductor c. So the Δ_φ are defined over abelian extensions of K.

The exact arithmetic/geometric conditions and coefficient identifications are
those of the document; absent owner types are omitted in this prototype. -/

theorem gHC_descent (descent : Chow →ₗ[ℚ] Chow') (σ : Module.End ℚ Chow') (g : Chow) : σ (descent g) = descent g := by
  sorry

/-! GeneralizedHeegnerCycles:GH.1 — BDP Proposition 2.7: Δ_φ is homologically trivial
Node: GeneralizedHeegnerCycles:GH.1/homological-triviality-of-generalized-heegner-cycles
For m ≥ 1, the cycle class of Δ_φ in ε_X H^{2m+2}(X_m) vanishes in every cohomology theory (de Rham, étale, Betti), so Δ_φ ∈ CH^{m+1}(X_m)_{0,ℚ}. For m = 0, P_{A′} − ∞ is homologically trivial.

The exact arithmetic/geometric conditions and coefficient identifications are
those of the document; absent owner types are omitted in this prototype. -/

theorem gHC_homologically_trivial (cl : Chow →ₗ[ℚ] DQ) (ε : Module.End ℚ Chow) (h : cl.comp ε = 0) (g : Chow) : cl (gHC ε g) = 0 := by
  sorry

/-! GeneralizedHeegnerCycles:GH.1 — BDP Definition 3.1: the étale Abel–Jacobi map on ε_X-cycles supported on a fibre
Node: GeneralizedHeegnerCycles:GH.1/etale-abel-jacobi-map
For X_m/F and V=ε_XH_et^{2m+1}(X̄_m,Q_p)(m+1), the étale Abel–Jacobi map sends a projected null-homologous codimension m+1 cycle to H¹(F,V). Use the Gysin exact sequence for U=X minus its support, pull back along its cycle class in the residue term, then identify Ext¹_G(Q_p,V) with H¹(F,V). It is independent of support and representative, with restriction, proper pushforward and correspondence equivariance. For m=0 the degree-zero cusp correction is required.

The exact arithmetic/geometric conditions and coefficient identifications are
those of the document; absent owner types are omitted in this prototype. -/

noncomputable def ajEt (gysinExtension : Chow →ₗ[ℚ] Coh) : Chow →ₗ[ℚ] Coh := gysinExtension

/-- The map is additive on projected null-homologous cycles. -/
theorem ajEt_add (a : Chow →ₗ[ℚ] Coh) (x y : Chow) : ajEt a (x+y) = ajEt a x + ajEt a y := by
  sorry

/-- A correspondence acts compatibly on cycles and the coefficient representation. -/
theorem ajEt_correspondence (a : Chow →ₗ[ℚ] Coh) (c : Module.End ℚ Chow) (v : Module.End ℚ Coh) (h : a.comp c = v.comp a) (z : Chow) : ajEt a (c z) = v (ajEt a z) := by
  sorry

/-- Restriction to F′ carries AJ_F(Δ) to AJ_F′(Δ_F′). -/
theorem ajEt_restriction (a : Chow →ₗ[ℚ] Coh) (a' : Chow' →ₗ[ℚ] Coh') (bc : Chow →ₗ[ℚ] Chow') (res : Coh →ₗ[ℚ] Coh') (h : res.comp a = a'.comp bc) (z : Chow) : res (ajEt a z) = ajEt a' (bc z) := by
  sorry

/-- The cocycle is g↦g·lift(1)−lift(1), and changing the lift adds a coboundary. -/
theorem ajEt_extension {G : Type*} (act : G → Module.End ℚ Coh) (v b : Coh) (g : G) : (act g (v+b)-(v+b))-(act g v-v) = act g b-b := by
  sorry

/-- Planned test `TauCeti.GeneralizedHeegner.ajEt_zero` (degenerate): The zero cycle gives the split extension and the zero cohomology class. -/
theorem ajEt_zero (a : Chow →ₗ[ℚ] Coh) : ajEt a 0 = 0 := by
  sorry

example (a : Chow →ₗ[ℚ] Coh) : ajEt a 0 = 0 := by
  sorry

/-- Planned test `TauCeti.GeneralizedHeegner.ajEt_lift_change` (characterisation): Changing the lift by b adds precisely the coboundary g·b−b, with this sign. -/
theorem ajEt_lift_change {G : Type*} (act : G → Module.End ℚ Coh) (v b : Coh) (g : G) : (act g (v+b)-(v+b))-(act g v-v) = act g b-b := by
  sorry

example {G : Type*} (act : G → Module.End ℚ Coh) (v b : Coh) (g : G) : (act g (v+b)-(v+b))-(act g v-v) = act g b-b := by
  sorry

/-- Planned test `TauCeti.GeneralizedHeegner.ajEt_weight_zero` (compatibility): On X₀ the degree-zero divisor map agrees with Jacobian Kummer under the imported Abel–Jacobi comparison. -/
theorem ajEt_weight_zero (a kummer : Chow →ₗ[ℚ] Coh) (h : a = kummer) (z : Chow) : ajEt a z = kummer z := by
  sorry

example (a kummer : Chow →ₗ[ℚ] Coh) (h : a = kummer) (z : Chow) : ajEt a z = kummer z := by
  sorry

/-! GeneralizedHeegnerCycles:GH.1 — BDP Proposition 3.5: Ext of the unit by a filtered Frobenius module of negative weight
Node: GeneralizedHeegnerCycles:GH.1/extensions-of-filtered-frobenius-modules
For a negative-weight admissible filtered Frobenius module H over finite unramified F/Q_p, write Φ=Φ₀^[F:Q_p], the F-linear iterate of semilinear crystalline Frobenius. Weight separation gives 1−Φ invertible. Every extension 0→H→D→F→0 has a unique Φ-fixed lift of 1 and a lift in Fil⁰D; their difference, in the order holomorphic minus Frobenius, defines a class in H/Fil⁰H and induces Ext_ffm¹(F,H)≅H/Fil⁰H. Semilinear Φ₀-fixed elements alone do not form the required F-linear splitting.

The exact arithmetic/geometric conditions and coefficient identifications are
those of the document; absent owner types are omitted in this prototype. -/

theorem filteredFrobeniusExtension (fil : Submodule F D) (hol frob : D) (b : D) (hb : b ∈ fil) : Submodule.Quotient.mk (hol+b-frob) = (Submodule.Quotient.mk (hol-frob) : D ⧸ fil) := by
  sorry

/-! GeneralizedHeegnerCycles:GH.1 — The p-adic Abel–Jacobi map AJ_F on projected cycles in X_m
Node: GeneralizedHeegnerCycles:GH.1/p-adic-abel-jacobi-map
Under BDP §3’s finite unramified F/Q_p and supplied smooth proper models, AJ_et(Δ) lies in H¹_f(F,V). The crystalline extension gives the filtered Frobenius extension of the preceding node; its holomorphic-minus-Frobenius class lies in D_dR(V)/Fil⁰. Poincaré duality identifies this quotient with (S_{m+2}⊗Sym^mH¹_dR(A/F))∨, yielding AJ_F. This use of an unramified F records the selected presentation, not a claim that Bloch–Kato theory requires unramified F in general.

The exact arithmetic/geometric conditions and coefficient identifications are
those of the document; absent owner types are omitted in this prototype. -/

noncomputable def ajP (a : Chow →ₗ[ℚ] Coh) (log : Coh →ₗ[ℚ] DualQ) : Chow →ₗ[ℚ] DualQ := log.comp a

/-- AJ_p is the crystalline/Bloch–Kato logarithm of AJ_et under the stated quotient and duality identification. -/
theorem ajP_etale (a : Chow →ₗ[ℚ] Coh) (log : Coh →ₗ[ℚ] DualQ) (z : Chow) : ajP a log z = log (ajEt a z) := by
  sorry

/-- AJ_p is additive in Δ. -/
theorem ajP_add (a : Chow →ₗ[ℚ] Coh) (log : Coh →ₗ[ℚ] DualQ) (x y : Chow) : ajP a log (x+y) = ajP a log x + ajP a log y := by
  sorry

/-- Evaluation on ω_f⊗ω_A^jη_A^(m−j) uses the Poincaré dual functional and the fixed Tate twist. -/
theorem ajP_pairing (a : Chow →ₗ[ℚ] Coh) (log : Coh →ₗ[ℚ] (D →ₗ[ℚ] ℚ)) (z : Chow) (ω : D) : ajP a log z ω = log (a z) ω := by
  sorry

/-- Planned test `TauCeti.GeneralizedHeegner.ajP_zero` (degenerate): A split étale extension has zero p-adic Abel–Jacobi functional. -/
theorem ajP_zero (a : Chow →ₗ[ℚ] Coh) (log : Coh →ₗ[ℚ] DualQ) : ajP a log 0 = 0 := by
  sorry

example (a : Chow →ₗ[ℚ] Coh) (log : Coh →ₗ[ℚ] DualQ) : ajP a log 0 = 0 := by
  sorry

/-- Planned test `TauCeti.GeneralizedHeegner.ajP_filtration_independence` (characterisation): Changing the Hodge lift by Fil⁰ does not change its quotient class. -/
theorem ajP_filtration_independence (fil : Submodule F D) (x b : D) (hb : b ∈ fil) : (Submodule.Quotient.mk (x+b) : D ⧸ fil) = Submodule.Quotient.mk x := by
  sorry

example (fil : Submodule F D) (x b : D) (hb : b ∈ fil) : (Submodule.Quotient.mk (x+b) : D ⧸ fil) = Submodule.Quotient.mk x := by
  sorry

/-- Planned test `TauCeti.GeneralizedHeegner.ajP_sign` (non-example): The recipe is holomorphic lift minus Frobenius lift: swapping the order negates the quotient class. -/
theorem ajP_sign (fil : Submodule F D) (x y : D) : (Submodule.Quotient.mk (y-x) : D ⧸ fil) = -Submodule.Quotient.mk (x-y) := by
  sorry

example (fil : Submodule F D) (x y : D) : (Submodule.Quotient.mk (y-x) : D ⧸ fil) = -Submodule.Quotient.mk (x-y) := by
  sorry

/-! GeneralizedHeegnerCycles:GH.1 — Integral Abel–Jacobi comparison
Node: GeneralizedHeegnerCycles:GH.1/integral-abel-jacobi-comparison
For p∤2N m!, invert the remaining f-projector denominator and choose the specified stable lattice T in V_f(r), m=2r−2. The cycle extension gives an integral class in H¹(K̃_c,T⊗Sym^{2r−2}T_p(A)(1−r)); its rationalization is AJ_et in the displayed self-dual twist. Descent from the ray field K̃_c to K_c uses invariance together with the compact inflation–restriction sequence and vanishing of coefficient invariants, rather than invariance alone.

The exact arithmetic/geometric conditions and coefficient identifications are
those of the document; absent owner types are omitted in this prototype. -/

theorem integralAJComparison (integral : Chow →ₗ[ℚ] Coh) (rat : Coh →ₗ[ℚ] Coh') (a : Chow →ₗ[ℚ] Coh') (z : Chow) : rat (integral z) = a z := by
  sorry

/-! GeneralizedHeegnerCycles:GH.1 — Character-projected Heegner class
Node: GeneralizedHeegnerCycles:GH.1/character-projected-heegner-class
For CH’s canonical CM A/H_K and B=Res_{H_K/K}A, use the literal full symmetric-power module S=Sym^{2r−2}T_p(B)(1−r)⊗O_F, after the required coefficient extension. For an anticyclotomic χ of type (j,−j), −r<j<r, conductor c₀p^s with (c₀,Np)=1, choose the finite-order anticyclotomic χ_t of the same conductor, unique up to a Hilbert class character, so χ is a coefficient summand of S⊗χ_t. Apply its G_K-equivariant projector to the twisted finite-level class to define z_{f,χ,c}∈H¹(K_c,T⊗χ), as in (4.6), for c divisible by the conductor. The separately weighted corestriction (4.7) defines z_{f,χ}∈H¹(K,T⊗χ). Do not identify S with Ind_{G_H_K}^{G_K}Sym^{2r−2}T_p(A)(1−r): the printed isomorphism has unequal ranks (source issue E7). Integral projectors and the inclusion of the original A-coefficient class require the recorded CM.1 adapter.

The exact arithmetic/geometric conditions and coefficient identifications are
those of the document; absent owner types are omitted in this prototype. -/

noncomputable def characterHeegnerClass (eχ : Module.End F D) (z : D) : D := eχ z

/-- With the character-projector law ρ(g)e_χ=χ(g)e_χ, the projected class satisfies ρ(g)z_χ=χ(g)z_χ. Idempotence alone asserts membership in the projector image and does not specify χ. -/
theorem characterHeegnerClass_eigen {G : Type*} [Group G] (ρ : G →* Module.End F D) (χ : G →* Fˣ) (eχ : Module.End F D) (h : ∀ g, (ρ g).comp eχ = (χ g : F) • eχ) (z : D) (g : G) : ρ g (characterHeegnerClass eχ z) = (χ g : F) • characterHeegnerClass eχ z := by
  sorry

/-- Corestriction commutes with the character projector after coefficient descent. -/
theorem characterHeegnerClass_cores (eχ : Module.End F D) (cor : Module.End F D) (h : cor.comp eχ = eχ.comp cor) (z : D) : cor (characterHeegnerClass eχ z) = characterHeegnerClass eχ (cor z) := by
  sorry

/-- Weighted corestriction is additive in the conductor-indexed cycle classes. -/
theorem characterHeegnerClass_sum (eχ : Module.End F D) (z w : D) : characterHeegnerClass eχ (z+w) = characterHeegnerClass eχ z + characterHeegnerClass eχ w := by
  sorry

/-- Planned test `TauCeti.GeneralizedHeegner.characterHeegnerClass_trivial` (degenerate): On the already selected trivial CM character component its projector is the identity. This does not assert identity on the entire symmetric-power coefficient module. -/
theorem characterHeegnerClass_trivial (z : D) : characterHeegnerClass (LinearMap.id : Module.End F D) z = z := by
  sorry

example (z : D) : characterHeegnerClass (LinearMap.id : Module.End F D) z = z := by
  sorry

/-- Planned test `TauCeti.GeneralizedHeegner.characterHeegnerClass_orthogonal` (non-example): Orthogonal idempotents kill the class projected to the other character. -/
theorem characterHeegnerClass_orthogonal (eχ eχ' : Module.End F D) (h : eχ'.comp eχ = 0) (z : D) : eχ' (characterHeegnerClass eχ z) = 0 := by
  sorry

example (eχ eχ' : Module.End F D) (h : eχ'.comp eχ = 0) (z : D) : eχ' (characterHeegnerClass eχ z) = 0 := by
  sorry

/-- Planned test `TauCeti.GeneralizedHeegner.characterHeegnerClass_add_test` (compatibility): The construction agrees with the linear coefficient projection on a sum of two classes. -/
theorem characterHeegnerClass_add_test (eχ : Module.End F D) (z w : D) : characterHeegnerClass eχ (z+w) = eχ z + eχ w := by
  sorry

example (eχ : Module.End F D) (z w : D) : characterHeegnerClass eχ (z+w) = eχ z + eχ w := by
  sorry

/-! GeneralizedHeegnerCycles:GH.1 — Parabolic residue pairing
Node: GeneralizedHeegnerCycles:GH.1/parabolic-residue-pairing
For BDP’s punctured good-reduction curve with coefficient isocrystal L_{m,m}, a de Rham class is parabolic exactly when its annular residues vanish, including the horizontal cusp residue. For parabolic representatives ω₁,ω₂, the Poincaré pairing is Σ_j res_{V_j}⟨F_{1,j},ω₂⟩, where ∇F_{1,j}=ω₁. Changing a local primitive by a horizontal section does not change the pairing.

The exact arithmetic/geometric conditions and coefficient identifications are
those of the document; absent owner types are omitted in this prototype. -/

theorem parabolicResiduePairing {I : Type*} [Fintype I] (cup : F) (residue : I → F) : cup = ∑ i, residue i := by
  sorry

/-! GeneralizedHeegnerCycles:GH.1 — Coleman primitive for the modular differential
Node: GeneralizedHeegnerCycles:GH.1/coleman-primitive
For ω_f valued in L_m choose a Frobenius annihilator P killing its parabolic cohomology class, invertible on horizontal sections, with P(1)≠0. The Coleman primitive F_f is the locally analytic section with ∇F_f=ω_f and P(Φ)F_f rigid analytic on a Frobenius neighborhood. Weight separation and gluing make it choice independent; for m>0 it is unique and for m=0 unique modulo constants. Evaluation uses the specified ordinary CM residue disk and normalized basis.

The exact arithmetic/geometric conditions and coefficient identifications are
those of the document; absent owner types are omitted in this prototype. -/

noncomputable def colemanPrimitive (differential : D) : D := by
  sorry

/-- The Gauss–Manin connection of F_f is ω_f. -/
theorem colemanPrimitive_differential (connection : Module.End F D) (ω : D) : connection (colemanPrimitive ω) = ω := by
  sorry

/-- P(Φ)F_f is a rigid section on a Frobenius neighborhood. -/
theorem colemanPrimitive_frobenius (PΦ : Module.End F D) (rigid : Submodule F D) (ω : D) : PΦ (colemanPrimitive ω) ∈ rigid := by
  sorry

/-- Any two admissible primitives differ by a global horizontal section. -/
theorem colemanPrimitive_choice (connection : Module.End F D) (x y : D) (h : connection x = connection y) : connection (x-y) = 0 := by
  sorry

/-- Planned test `TauCeti.GeneralizedHeegner.colemanPrimitive_zero` (degenerate): With the zero normalization the zero differential has zero Coleman primitive. -/
theorem colemanPrimitive_zero : colemanPrimitive (0 : D) = 0 := by
  sorry

example : colemanPrimitive (0 : D) = 0 := by
  sorry

/-- Planned test `TauCeti.GeneralizedHeegner.colemanPrimitive_constants` (non-example): In weight zero adding a horizontal constant preserves the differential, so uniqueness without normalization is false. -/
theorem colemanPrimitive_constants (connection : Module.End F D) (x c : D) (hc : connection c = 0) : connection (x+c) = connection x := by
  sorry

example (connection : Module.End F D) (x c : D) (hc : connection c = 0) : connection (x+c) = connection x := by
  sorry

/-- Planned test `TauCeti.GeneralizedHeegner.colemanPrimitive_residue_test` (compatibility): Changing a primitive by a horizontal constant does not change its pairing with a zero-residue differential. -/
theorem colemanPrimitive_residue_test (pair : D →ₗ[F] D →ₗ[F] F) (x c ω : D) (hc : pair c ω = 0) : pair (x+c) ω = pair x ω := by
  sorry

example (pair : D →ₗ[F] D →ₗ[F] F) (x c ω : D) (hc : pair c ω = 0) : pair (x+c) ω = pair x ω := by
  sorry

/-! GeneralizedHeegnerCycles:GH.1 — Coleman Abel–Jacobi formula
Node: GeneralizedHeegnerCycles:GH.1/coleman-abel-jacobi-formula
For an ordinary marked isogeny φ:A→A′ and α∈Sym^mH¹_dR(A), AJ_F(Δ_φ)(ω_f⊗α)=⟨F_f(P_{A′})⊗α,cl_{P_{A′}}Δ_φ⟩=⟨φ*F_f(P_{A′}),α⟩_A. If φ*ω′=ω and d=deg φ, then evaluation on ω_A^jη_A^{m−j} is d^jG_j(A′,t′,ω′).

The exact arithmetic/geometric conditions and coefficient identifications are
those of the document; absent owner types are omitted in this prototype. -/

theorem colemanAJ (AJ : Chow →ₗ[ℚ] (DQ →ₗ[ℚ] ℚ)) (Δ : Chow) (ω : DQ) (value : ℚ) : AJ Δ ω = value := by
  sorry

/-! GeneralizedHeegnerCycles:GH.1 — Depleted Coleman component calculation
Node: GeneralizedHeegnerCycles:GH.1/coleman-depletion-calculation
For the normalized components G_j=⟨F_f,ω^jη^{m−j}⟩ and f♭ the p-depletion, G_j♭=j! θ^{−1−j}f♭ on the ordinary locus. The negative power is the continuous p-adic extension of θ on p-depleted q-series. The proof uses the connection in the Tate-curve basis, the recurrence G_0♭=θ⁻¹f♭ and G_j♭=jθ⁻¹G_{j−1}♭, plus the q-expansion principle. θ, U, V, depletion and q-expansion principle belong to the modular-forms suppliers.

The exact arithmetic/geometric conditions and coefficient identifications are
those of the document; absent owner types are omitted in this prototype. -/

theorem colemanDepletion (a : ℕ → F) (j n : ℕ) (hn : (n : F) ≠ 0) (component : ℕ → F) : component n = (Nat.factorial j : F) * a n / (n : F)^(j+1) := by
  sorry

/-! GeneralizedHeegnerCycles:GH.1 — Syntomic Abel–Jacobi comparison
Node: GeneralizedHeegnerCycles:GH.1/syntomic-abel-jacobi-comparison
For the supplied smooth proper model of X_m and projected homologically trivial cycles, a geometric syntomic regulator and its étale comparison must identify the syntomic Abel–Jacobi image with AJ_p after Bloch–Kato logarithm and the exact Frobenius normalization. Besser’s regulator on Spec O_F, or its K₂ curve specialization, does not supply this higher-dimensional correspondence-compatible statement. This is a requested extension of D.2, with the precise comparison a gap until supplied.

The exact arithmetic/geometric conditions and coefficient identifications are
those of the document; absent owner types are omitted in this prototype. -/

theorem syntomicAJComparison (syn : Chow →ₗ[ℚ] DualQ) (a : Chow →ₗ[ℚ] Coh) (log : Coh →ₗ[ℚ] DualQ) : syn = ajP a log := by
  sorry

/-! GeneralizedHeegnerCycles:GH.1 — Classical and generalized cycle comparison
Node: GeneralizedHeegnerCycles:GH.1/classical-generalized-cycle-comparison
For m=2r−2, the trivial CM-character projection of the generalized cycle class agrees with the classical Heegner cycle on W_m with the normalization u_{c₀}(2√−D_K)^{r−1} appearing in Castella Theorem 6.5; Castella uses u_{c₀}=|O_{c₀}×|/2. The comparison is cited there from BDP (2017), Proposition 4.1.2 with r₁=2r−2,r₂=0,u=r−1. It is not established by the 2013 homological-triviality calculation. Its proof and precise cycle adapter are recorded as an outstanding source input.

The exact arithmetic/geometric conditions and coefficient identifications are
those of the document; absent owner types are omitted in this prototype. -/

theorem classicalGeneralizedComparison (classical generalized : D) (unit scale : F) : generalized = (unit*scale)⁻¹ • classical := by
  sorry

/-! GeneralizedHeegnerCycles:GH.2 — Heegner cycle norm relations
Node: GeneralizedHeegnerCycles:GH.2/cycle-norm-relations
For CH’s classes with p∤c and split p, n>1, cor_{K_{cp^n}/K_{cp^{n−1}}}(z_{f,cp^n})=a_p z_{f,cp^{n−1}}−p^{2r−2}res(z_{f,cp^{n−2}}). For an inert ℓ∤cND_Kp, cor_{K_{cℓ}/K_c}(z_{f,cℓ})=a_ℓ z_{f,c}. These equations are transported through the character projection with the prescribed χ weights. The n=1 split relation includes units and both Artin operators and requires an additional normalization check; it is not asserted by Proposition 4.4 in the 2022 copy.

The exact arithmetic/geometric conditions and coefficient identifications are
those of the document; absent owner types are omitted in this prototype. -/

theorem cycleNormRelations (ap p : F) (r : ℕ) (zprev z zn : D) (cor : Module.End F D) : cor zn = ap • z - p^(2*r-2) • zprev := by
  sorry

/-! GeneralizedHeegnerCycles:GH.2 — Complex conjugation of Heegner classes
Node: GeneralizedHeegnerCycles:GH.2/cycle-conjugation
With τ complex conjugation, w_f the Atkin–Lehner eigenvalue and σ_N the fixed Artin class, (z_{f,χ,c})^τ=w_f χ(σ_N)(z_{f,χ^{-1},c})^{σ_N}. The CM curve is defined over H_K^+ so τ acts on the chosen geometric cycle. Conjugation changes the coefficient character to χ^{-1}; it is not a same-character identity unless χ²=1.

The exact arithmetic/geometric conditions and coefficient identifications are
those of the document; absent owner types are omitted in this prototype. -/

theorem cycleConjugation (τ σN : Module.End F D) (zχ zχinv : D) (wf χN : F) : τ zχ = (wf*χN) • σN zχinv := by
  sorry

/-! GeneralizedHeegnerCycles:GH.2 — Frobenius congruence for cycle classes
Node: GeneralizedHeegnerCycles:GH.2/cycle-frobenius-congruence
For ℓ∤cND_K inert, let λ_c and λ_{cℓ} be the chosen compatible local primes. Then res_{K_{λ_{cℓ}}/K_{λ_c}}(loc_{λ_c}(z_{f,χ,c})^{Frob_ℓ})=loc_{λ_{cℓ}}(z_{f,χ,cℓ}). The anticyclotomic χ is trivial on the relevant local decomposition group. This is an equality after restriction of local classes, deduced from reduction of the conductor-changing isogeny to Frobenius; it is not equality of global classes modulo ℓ.

The exact arithmetic/geometric conditions and coefficient identifications are
those of the document; absent owner types are omitted in this prototype. -/

theorem cycleFrobeniusCongruence (res loc : Module.End F D) (fr : Module.End F D) (z znew : D) : res (fr (loc z)) = loc znew := by
  sorry

/-! GeneralizedHeegnerCycles:GH.2 — Finite local Abel–Jacobi class
Node: GeneralizedHeegnerCycles:GH.2/finite-local-abel-jacobi-class
At a good unramified local model AJ_et(Δ) is crystalline and hence lies in H¹_f; outside p its unramified local class follows from the good integral support and specialization. CH Proposition 7.6’s propagation through coefficient quotients uses the corrected Fontaine–Laffaille hypothesis: the local field L must be absolutely unramified over Q_p, not just relatively unramified over K_{c,w}. A ramified conductor field requires a different argument. Bloch–Kato, Greenberg and a chosen regulator-image condition are identified only after the stated comparison is proved.

The exact arithmetic/geometric conditions and coefficient identifications are
those of the document; absent owner types are omitted in this prototype. -/

theorem finiteLocalAJ (finite : Submodule F D) (z : D) : z ∈ finite := by
  sorry

/-! GeneralizedHeegnerCycles:GH.2 — Corrected derivative local condition
Node: GeneralizedHeegnerCycles:GH.2/local-condition-at-p-and-the-castella-hsieh-corrections
For the specialized anticyclotomic Heegner Euler system in CH Proposition 7.8, the derivative classes satisfy axiom (E5) at p by the integral Perrin–Riou lifting and orthogonality argument of KO Lemma 4.10. At a height-one P≠pΛ, use the integral regulator image defining F_P, lift the period vector through the unramified trace, apply Ω, specialize and use the local Tate pairing; use conjugation for p̄. The proof cannot use CH Lemma 7.5 over arbitrary ramified conductor fields. The identification of F_P with the CH local condition and its integral lattice must be checked explicitly.

The exact arithmetic/geometric conditions and coefficient identifications are
those of the document; absent owner types are omitted in this prototype. -/

theorem correctedDerivativeLocalCondition (localCondition derivative : Submodule F D) (pair : D →ₗ[F] D →ₗ[F] F) (x : derivative) (y : localCondition) : pair x y = 0 := by
  sorry

/-! GeneralizedHeegnerCycles:GH.3 — Ordinary stabilized Heegner class
Node: GeneralizedHeegnerCycles:GH.3/ordinary-stabilized-class
For CH k=2r, ap a p-adic unit and α the unit root of X²−apX+p^{2r−1}, set z_{c,α}=z_c−(p^{2r−2}/α)res(z_{c/p}) when p|c. When p∤c set z_{c,α}=u_c^{-1}(1−p^{r−1}σ_p/α)(1−p^{r−1}σ_p̄/α)z_c, with CH’s u_c=|O_c×|. The factor at p∤c is a pair of Euler operators, not the same formula as at positive p-conductor.

The exact arithmetic/geometric conditions and coefficient identifications are
those of the document; absent owner types are omitted in this prototype. -/

noncomputable def stabilizedClass (p α : F) (r : ℕ) (z predecessor : D) : D := z - (p^(2*r-2)/α) • predecessor

/-- At positive p-conductor the subtraction coefficient is p^{2r−2}/α. -/
theorem stabilizedClass_upper (p α : F) (r : ℕ) (z w : D) : stabilizedClass p α r z w = z - (p^(2*r-2)/α) • w := by
  sorry

/-- The bottom class is u_c⁻¹ times the product of the p and p̄ Euler operators. -/
theorem stabilizedClass_bottom (u q : F) (σ σbar : Module.End F D) (z bottom : D) : bottom = u⁻¹ • ((LinearMap.id-q • σ).comp (LinearMap.id-q • σbar)) z := by
  sorry

/-- With the matched first-step normalization, cor(z_{cp,α})=α z_{c,α}. -/
theorem stabilizedClass_trace (cor : Module.End F D) (α : F) (upper lower : D) : cor upper = α • lower := by
  sorry

/-- The normalized subtraction preserves the integral lattice when both classes and its explicitly recorded scalar action preserve that lattice. -/
theorem stabilizedClass_integral [Module O D] (L : Submodule O D) (p α : F) (r : ℕ) (z w : D) (hz : z ∈ L) (hw : w ∈ L) (hcoeff : ∀ x ∈ L, (p^(2*r-2)/α) • x ∈ L) : stabilizedClass p α r z w ∈ L := by
  sorry

/-- Planned test `TauCeti.GeneralizedHeegner.stabilizedClass_weight_two` (computation): For r=1 the predecessor coefficient is α⁻¹. -/
theorem stabilizedClass_weight_two (p α : F) (z w : D) : stabilizedClass p α 1 z w = z - α⁻¹ • w := by
  sorry

example (p α : F) (z w : D) : stabilizedClass p α 1 z w = z - α⁻¹ • w := by
  sorry

/-- Planned test `TauCeti.GeneralizedHeegner.stabilizedClass_zero_predecessor` (degenerate): A zero predecessor leaves the current class unchanged. -/
theorem stabilizedClass_zero_predecessor (p α : F) (r : ℕ) (z : D) : stabilizedClass p α r z 0 = z := by
  sorry

example (p α : F) (r : ℕ) (z : D) : stabilizedClass p α r z 0 = z := by
  sorry

/-- Planned test `TauCeti.GeneralizedHeegner.stabilizedClass_root_relation` (characterisation): The unit-root equation gives α+p^{2r−1}/α=ap, which is the coefficient identity used in the trace computation. -/
theorem stabilizedClass_root_relation (p α ap : F) (r : ℕ) (hα : α ≠ 0) (h : α^2-ap*α+p^(2*r-1)=0) : α+p^(2*r-1)/α = ap := by
  sorry

example (p α ap : F) (r : ℕ) (hα : α ≠ 0) (h : α^2-ap*α+p^(2*r-1)=0) : α+p^(2*r-1)/α = ap := by
  sorry

/-! GeneralizedHeegnerCycles:GH.3 — First-step stabilization adapter
Node: GeneralizedHeegnerCycles:GH.3/stabilized-first-step-adapter
The upper and lower formulas of CH Definition 5.2 must satisfy cor_{K_{cp}/K_c}(z_{cp,α})=α z_{c,α}. Prove the conductor-one trace from the Hecke neighbor classification with both Frobenius classes and the exact unit index. The July 2022 Proposition 4.4 states only n>1; its proof does not, by itself, discharge the n=1 assertion in Lemma 5.3. Compare CH’s full-unit and Castella’s half-unit conventions by an explicit scaling of the cycle classes.

The exact arithmetic/geometric conditions and coefficient identifications are
those of the document; absent owner types are omitted in this prototype. -/

theorem stabilizedFirstStep (cor : Module.End F D) (α : F) (upper lower : D) : cor upper = α • lower := by
  sorry

/-! GeneralizedHeegnerCycles:GH.3 — Iwasawa Heegner class
Node: GeneralizedHeegnerCycles:GH.3/iwasawa-heegner-class
After the first-step adapter, the sequence (α^{-n}z_{c₀p^n,α})_n, with its compatible coefficient projections, defines z_f in H¹_Iw(K_{c₀p∞},T). Keep the finite ring-class quotient Δ distinct from the anticyclotomic Γ≅Z_p and from a possible Δ-character projection. A finite-order nontrivial character of exact p-conductor n specializes to α^{-n}z_{f,χ}; Shapiro identifies the inverse limit with cohomology of the completed coefficient representation, with the inversion convention explicit.

The exact arithmetic/geometric conditions and coefficient identifications are
those of the document; absent owner types are omitted in this prototype. -/

noncomputable def iwasawaClass (α : F) (z : ℕ → D) : ℕ → D := fun n => (α⁻¹)^n • z n

/-- The conductor-n projection is α^{-n}z_n. -/
theorem iwasawaClass_level (α : F) (z : ℕ → D) (n : ℕ) : iwasawaClass α z n = (α⁻¹)^n • z n := by
  sorry

/-- The normalized sequence is corestriction compatible. -/
theorem iwasawaClass_norm (α : F) (hα : α ≠ 0) (cor : ℕ → Module.End F D) (z : ℕ → D) (h : ∀ n, cor n (z (n+1)) = α • z n) (n : ℕ) : cor n (iwasawaClass α z (n+1)) = iwasawaClass α z n := by
  sorry

/-- A nontrivial exact conductor-n character specialization gives α^{-n} times the weighted finite-level class. -/
theorem iwasawaClass_character (α : F) (z : ℕ → D) (sp : Module.End F D) (n : ℕ) : sp (iwasawaClass α z n) = (α⁻¹)^n • sp (z n) := by
  sorry

/-- Planned test `TauCeti.GeneralizedHeegner.iwasawaClass_bottom` (degenerate): The bottom projection has normalization α⁰=1. -/
theorem iwasawaClass_bottom (α : F) (z : ℕ → D) : iwasawaClass α z 0 = z 0 := by
  sorry

example (α : F) (z : ℕ → D) : iwasawaClass α z 0 = z 0 := by
  sorry

/-- Planned test `TauCeti.GeneralizedHeegner.iwasawaClass_unit_one` (computation): If α=1 the sequence is unchanged. -/
theorem iwasawaClass_unit_one (z : ℕ → D) : iwasawaClass (1 : F) z = z := by
  sorry

example (z : ℕ → D) : iwasawaClass (1 : F) z = z := by
  sorry

/-- Planned test `TauCeti.GeneralizedHeegner.iwasawaClass_sign` (non-example): At α=−1 level 1 changes sign; at α=2 and a nonzero class over Q it is one half of the class, not twice the class. The latter distinguishes α^{-n} from α^n. -/
theorem iwasawaClass_sign (z : ℕ → DQ) (hz : z 1 ≠ 0) : iwasawaClass (-1 : ℚ) z 1 = -z 1 ∧ iwasawaClass (2 : ℚ) z 1 = (1/2 : ℚ) • z 1 ∧ iwasawaClass (2 : ℚ) z 1 ≠ (2 : ℚ) • z 1 := by
  sorry

example (z : ℕ → DQ) (hz : z 1 ≠ 0) : iwasawaClass (-1 : ℚ) z 1 = -z 1 ∧ iwasawaClass (2 : ℚ) z 1 = (1/2 : ℚ) • z 1 ∧ iwasawaClass (2 : ℚ) z 1 ≠ (2 : ℚ) • z 1 := by
  sorry

/-! GeneralizedHeegnerCycles:GH.3 — Longo–Vigni trace polynomials
Node: GeneralizedHeegnerCycles:GH.3/longo-vigni-trace-polynomials
In O_p[G(n)] define ρ=p^{k/2}−a_pσ_p+p^{(k−2)/2}σ_p², its conjugate ρ̄, and Φ=ρρ̄. Let γ₀=a_p−p^{(k−2)/2}(σ_p+σ_p̄), γ₁=a_pγ₀−p^{k−2}δ and γ_m=a_pγ_{m−1}−p^{k−1}γ_{m−2} for m≥2. Here δ is the fixed ring-class-to-Γ degree in LV §4.1, not a freely chosen constant. LV Lemma 4.2 gives q_m with γ_m=q_mΦ+p^{(m−1)k/2}r_m for m≥2 and q_{m+1}≡a_pq_m mod p, q₂=1.

The exact arithmetic/geometric conditions and coefficient identifications are
those of the document; absent owner types are omitted in this prototype. -/

noncomputable def tracePolynomial (ap q : F) (g0 g1 : F) : ℕ → F
  | 0 => g0
  | 1 => g1
  | n+2 => ap * tracePolynomial ap q g0 g1 (n+1) - q * tracePolynomial ap q g0 g1 n

/-- The first two values are γ₀ and γ₁. -/
theorem tracePolynomial_initial (ap q g0 g1 : F) : tracePolynomial ap q g0 g1 0 = g0 ∧ tracePolynomial ap q g0 g1 1 = g1 := by
  sorry

/-- γ_{m+2}=a_pγ_{m+1}−p^{k−1}γ_m. -/
theorem tracePolynomial_recurrence (ap q g0 g1 : F) (m : ℕ) : tracePolynomial ap q g0 g1 (m+2) = ap*tracePolynomial ap q g0 g1 (m+1)-q*tracePolynomial ap q g0 g1 m := by
  sorry

/-- The higher terms equal q_mΦ plus the explicitly p-divisible remainder. -/
theorem tracePolynomial_remainder (γ qm Φ p rm : F) (m k : ℕ) : γ = qm*Φ+p^((m-1)*k/2)*rm := by
  sorry

/-- Planned test `TauCeti.GeneralizedHeegner.tracePolynomial_two` (computation): The second recurrence value is apγ₁−qγ₀. -/
theorem tracePolynomial_two (ap q g0 g1 : F) : tracePolynomial ap q g0 g1 2 = ap*g1-q*g0 := by
  sorry

example (ap q g0 g1 : F) : tracePolynomial ap q g0 g1 2 = ap*g1-q*g0 := by
  sorry

/-- Planned test `TauCeti.GeneralizedHeegner.tracePolynomial_zero` (degenerate): Zero initial values give the zero sequence. -/
theorem tracePolynomial_zero (ap q : F) (n : ℕ) : tracePolynomial ap q 0 0 n = 0 := by
  sorry

example (ap q : F) (n : ℕ) : tracePolynomial ap q 0 0 n = 0 := by
  sorry

/-- Planned test `TauCeti.GeneralizedHeegner.tracePolynomial_error_power` (non-example): At k=4,m=2 the displayed LV remainder exponent is 2. No p⁴ divisibility follows from that displayed exponent alone; a particular remainder may have additional divisibility. -/
theorem tracePolynomial_error_power : ((2-1)*4/2 : ℕ) = 2 := by
  sorry

example : ((2-1)*4/2 : ℕ) = 2 := by
  sorry

/-! GeneralizedHeegnerCycles:GH.3 — Trace polynomial intersection theorem
Node: GeneralizedHeegnerCycles:GH.3/trace-polynomial-intersection
For a finitely generated O_p[G(n)]-module M in LV’s setting, ordinarity and the q_m estimates imply ΦM=⋂_m γ_mM. This is equality of images/submodules. After augmentation, eventual equality of the corresponding ideals is what is used, not literal equality γ_m=Φ.

The exact arithmetic/geometric conditions and coefficient identifications are
those of the document; absent owner types are omitted in this prototype. -/

theorem tracePolynomialIntersection (Φ : Module.End F D) (γ : ℕ → Module.End F D) : LinearMap.range Φ = ⨅ m, LinearMap.range (γ m) := by
  sorry

/-! GeneralizedHeegnerCycles:GH.3 — Universal norm Heegner class
Node: GeneralizedHeegnerCycles:GH.3/universal-norm-heegner-class
Let H_m[n] be the O_p[Gal(K_m[n]/K)] submodule generated by the restrictions of z_n and by the trace classes α_j[n], j≤m, and H_∞[n]=lim_cor H_m[n]. LV Proposition 4.5 constructs β[n]∈H_∞[n] with β₀[n]=Φz_n and cor_{K_∞[nℓ]/K_∞[n]}β[nℓ]=a_ℓβ[n] for the permitted inert ℓ. The finite Δ corestriction and p∤h_K are retained; this construction is not identified with the CH α-stabilized sequence without the normalization comparison.

The exact arithmetic/geometric conditions and coefficient identifications are
those of the document; absent owner types are omitted in this prototype. -/

noncomputable def universalNormClass (z : D) : ℕ → D := by
  sorry

/-- β₀[n]=Φz_n. -/
theorem universalNormClass_bottom (Φ : Module.End F D) (z : D) : universalNormClass (Φ z) 0 = Φ z := by
  sorry

/-- Each upper component corestricts to the preceding component. -/
theorem universalNormClass_norm (cor : ℕ → Module.End F D) (z : D) (m : ℕ) : cor m (universalNormClass z (m+1)) = universalNormClass z m := by
  sorry

/-- Corestriction along an inert auxiliary prime is multiplication by a_ℓ. -/
theorem universalNormClass_tame (cor : Module.End F D) (aℓ : F) (z zn : D) (m : ℕ) : cor (universalNormClass zn m) = aℓ • universalNormClass z m := by
  sorry

/-- Planned test `TauCeti.GeneralizedHeegner.universalNormClass_bottom_test` (characterisation): The zero-level projection keeps Φ rather than dropping it. -/
theorem universalNormClass_bottom_test (Φ : Module.End F D) (z : D) : universalNormClass (Φ z) 0 = Φ z := by
  sorry

example (Φ : Module.End F D) (z : D) : universalNormClass (Φ z) 0 = Φ z := by
  sorry

/-- Planned test `TauCeti.GeneralizedHeegner.universalNormClass_zero` (degenerate): Choosing the zero lift for zero geometric input gives the zero sequence. -/
theorem universalNormClass_zero : universalNormClass (0 : D) = fun _ => 0 := by
  sorry

example : universalNormClass (0 : D) = fun _ => 0 := by
  sorry

/-- Planned test `TauCeti.GeneralizedHeegner.universalNormClass_two_steps` (compatibility): Two successive corestrictions equal the corestriction across two levels. -/
theorem universalNormClass_two_steps (cor : ℕ → Module.End F D) (z : D) : cor 0 (cor 1 (universalNormClass z 2)) = universalNormClass z 0 := by
  sorry

example (cor : ℕ → Module.End F D) (z : D) : cor 0 (cor 1 (universalNormClass z 2)) = universalNormClass z 0 := by
  sorry

/-! GeneralizedHeegnerCycles:GH.4 — BDP special value formula
Node: GeneralizedHeegnerCycles:GH.4/bdp-special-value-formula
Under BDP Assumption 5.12 (normalized f∈S_k(Γ₀(N),ε_f), odd c prime to Nd_K, odd discriminant K with the stated Heegner ideal, split p prime to Nc, and the finite-local-sign conditions on Σ_cc), let m=k−2 and χ∈Σ_cc^(1) have infinity type (k−1−j,1+j), 0≤j≤m. Then L_p(f,χ)/Ω_p^{2(m−2j)}=(1−χ^{-1}(p̄)a_p+χ^{-2}(p̄)ε_f(p)p^{k−1})² · (c^{−j}/j! · Σ_[a]∈Pic(O_c) χ^{-1}(a)N(a) AJ_F(Δ_{φ_aφ₀})(ω_f⊗ω_A^jη_A^{m−j}))². This is a special value of the squared BDP function, not a complex derivative. The underlying GL₂ square-root distribution and its interpolation are imported from L3h. GZ.9 consumes the m=0 specialization of this one owner; quaternionic formulas and exceptional branches remain in GZ.9.

The exact arithmetic/geometric conditions and coefficient identifications are
those of the document; absent owner types are omitted in this prototype. -/

theorem bdpSpecialValue (Lp Ω ap χbar εp p c sumAJ : F) (m j k : ℕ) : Lp / Ω^(2*((m : ℤ)-2*(j : ℤ))) = (1-χbar⁻¹*ap+χbar⁻¹^2*εp*p^(k-1))^2 * (c⁻¹^j / (Nat.factorial j : F) * sumAJ)^2 := by
  sorry

/-! GeneralizedHeegnerCycles:GH.4 — CM differential scaling
Node: GeneralizedHeegnerCycles:GH.4/cm-differential-scaling
Under ω_A↦aω_A and η_A↦a^{-1}η_A with a≠0, the AJ evaluation on ω_A^jη_A^{m−j} scales by a^{2j−m}, and its square scales by a^{2(2j−m)}. The period Ω_p scales by a in the matching convention, so BDP’s normalized equation transforms consistently. These are signed integer exponents, not truncated natural subtraction.

The exact arithmetic/geometric conditions and coefficient identifications are
those of the document; absent owner types are omitted in this prototype. -/

theorem cmDifferentialScaling (a value : F) (ha : a ≠ 0) (m j : ℤ) : (a^(2*j-m)*value)^2 = a^(2*(2*j-m))*value^2 := by
  sorry

/-! GeneralizedHeegnerCycles:GH.4 — Ramified character Abel–Jacobi formula
Node: GeneralizedHeegnerCycles:GH.4/ramified-character-abel-jacobi-formula
In CH Theorem 4.9 let ψ have type (r,−r), conductor c₀ prime to Np, and φ type (r+j,−j−r), −r<j<r, with exact conductor p^n, n≥1; put χ=ψ̂^{-1}φ̂. Then L_{p,ψ}(f)(φ̂^{-1})/Ω_p^{−2j}=[g(φ_p^{-1})φ_p(p^n)c₀^{1−r}ψ̂_p^{-1}(p^n)/(r−1+j)!] · ⟨log_p z_{f,χ},ω_f⊗ω_A^{r−1+j}η_A^{r−1−j}t^{1−2r}⟩. This evaluates the linear square-root distribution, and the proof’s exact conductor cancellations cannot substitute for BDP’s unramified Euler polynomial.

The exact arithmetic/geometric conditions and coefficient identifications are
those of the document; absent owner types are omitted in this prototype. -/

theorem ramifiedCharacterAJ (Lp Ω gauss φpn c ψpn logValue : F) (r : ℕ) (j : ℤ) : Lp / Ω^(-2*j) = gauss*φpn*c^(1-(r : ℤ))*ψpn / (Nat.factorial ((r : ℤ)-1+j).toNat : F) * logValue := by
  sorry

/-! GeneralizedHeegnerCycles:GH.4 — Fixed-weight regulator specialization
Node: GeneralizedHeegnerCycles:GH.4/fixed-weight-regulator-adapter
Apply the supplier’s relative Lubin–Tate Perrin–Riou map to V=V_f(r)⊗ψ̂^{-1}, whose F⁺ line is unramified after this twist. Pair with ω_f⊗t^{−2r} and the CM period identifications η_A=t_A^{-1}t, ω_A=t_A=Ω_pt. CH Theorem 5.1’s specialization in the positive logarithmic range and the dual exponential range supplies the epsilon, Euler and factorial factors; the density argument in Theorem 5.7 uses ramified n>1 characters and the epsilon identity ε(φ̂)=g(φ_p^{-1})φ_p(−p^n). The finite unramified base change and Γ̃ finite quotient are part of the map.

The exact arithmetic/geometric conditions and coefficient identifications are
those of the document; absent owner types are omitted in this prototype. -/

theorem fixedWeightRegulator (reg : D →ₗ[F] F) (z : D) (epsilon factorial euler logValue : F) : reg z = epsilon*factorial*euler*logValue := by
  sorry

/-! GeneralizedHeegnerCycles:GH.4 — Castella–Hsieh explicit reciprocity law
Node: GeneralizedHeegnerCycles:GH.4/castella-hsieh-abel-jacobi-formula-and-big-logarithm-reciprocity
Under CH §5, in Λ_{F̂^ur}(Γ̃), ⟨L_{p,ψ}(z_f),ω_f⊗t^{−2r}⟩=−c₀^{r−1} L_{p,ψ}(f)·σ_{−1,p}, where σ_{−1,p}=rec_p(−1)|_{K_{c₀p∞}} has order dividing 2. The analytic side is the linear square-root distribution. The sign, c₀ power and group-algebra translation remain in the identity; equality after squaring loses this normalization.

The exact arithmetic/geometric conditions and coefficient identifications are
those of the document; absent owner types are omitted in this prototype. -/

theorem castellaHsiehReciprocity (LΛ : Type*) [CommRing LΛ] [Algebra F LΛ] (c : F) (r : ℕ) (reg measure σminus : LΛ) : reg = -(algebraMap F LΛ (c^(r-1))) * measure * σminus := by
  sorry

/-! GeneralizedHeegnerCycles:GH.4 — Dual exponential special value
Node: GeneralizedHeegnerCycles:GH.4/dual-exponential-special-value
CH Corollary 5.8 gives, in the j≥r range, ⟨exp*loc(z_{f}^{χ^{-1}}),ω_f⊗ω_A^{−j−r}η_A^{j−r}⟩² = c_{f,K}(e′_p(f,χ))²(p^{2r−1}/α²)^n χ^{-1}ψ(𝔑)L_alg(f,χ,r)/Γ(j−r+1)², with c_{f,K}=8u_K²√D_K c₀^{2r−1}ε(f). For n>0 e′_p=1; for n=0 it is (1−α^{-1}χ(σ_p)p^{r−j−1})(1−α^{-1}χ(σ_p̄)p^{r−j−1}). This is the local nonvanishing input to rank zero, distinct from the logarithmic critical range.

The exact arithmetic/geometric conditions and coefficient identifications are
those of the document; absent owner types are omitted in this prototype. -/

theorem dualExponentialValue (expValue constant euler α p χN Lalg : F) (r n j : ℕ) : expValue^2 = constant*euler^2*(p^(2*r-1)/α^2)^n*χN*Lalg/(Nat.factorial (j-r) : F)^2 := by
  sorry

/-! GeneralizedHeegnerCycles:GH.5 — Longo–Vigni admissible triple
Node: GeneralizedHeegnerCycles:GH.5/longo-vigni-admissible-triple
LV Definition 2.1 excludes primes in Ξ: those dividing 6N(k−2)!φ(N)c_f, or for which im ρ_{f,p} does not contain {g∈GL₂(O_F⊗Z_p):det g∈(Z_p×)^{k−1}}. Require also p∤h_K, p unramified in F, p split in K, and a_p∈O_p×. Fix k≥4 even, (D_K,N)=1 with all primes of N split in K and O_K×={±1}; thus K=Q(i),Q(√−3) are excluded in this application. c_f is the integral index specified by the newform lattice, not an arbitrary normalizing scalar.

The exact arithmetic/geometric conditions and coefficient identifications are
those of the document; absent owner types are omitted in this prototype. -/

def admissibleTriple (p N k phiN cf hK : ℕ) (ap : O) (image required : Set (Matrix (Fin 2) (Fin 2) O)) : Prop := 4 ≤ k ∧ Even k ∧ Nat.Prime p ∧ ¬p ∣ 6*N*Nat.factorial (k-2)*phiN*cf ∧ ¬p ∣ hK ∧ IsUnit ap ∧ required ⊆ image

/-- Admissibility implies p∤6N(k−2)!φ(N)c_f. -/
theorem admissibleTriple_exceptional (p N k phiN cf hK : ℕ) (ap : O) (image required : Set (Matrix (Fin 2) (Fin 2) O)) (h : admissibleTriple p N k phiN cf hK ap image required) : ¬p ∣ 6*N*Nat.factorial (k-2)*phiN*cf := by
  sorry

/-- Admissibility implies p∤h_K, so the bottom Hilbert class quotient has prime-to-p order; it does not assert that every auxiliary-conductor ring class quotient does. -/
theorem admissibleTriple_classNumber (p N k phiN cf hK : ℕ) (ap : O) (image required : Set (Matrix (Fin 2) (Fin 2) O)) (h : admissibleTriple p N k phiN cf hK ap image required) : ¬p ∣ hK := by
  sorry

/-- The ordinary Fourier coefficient is a unit, not merely nonzero in F. -/
theorem admissibleTriple_ordinary (p N k phiN cf hK : ℕ) (ap : O) (image required : Set (Matrix (Fin 2) (Fin 2) O)) (h : admissibleTriple p N k phiN cf hK ap image required) : IsUnit ap := by
  sorry

/-- The source p-adic image must contain the determinant-restricted subgroup, not merely be irreducible. -/
theorem admissibleTriple_bigImage (p N k phiN cf hK : ℕ) (ap : O) (image required : Set (Matrix (Fin 2) (Fin 2) O)) (h : admissibleTriple p N k phiN cf hK ap image required) : required ⊆ image := by
  sorry

/-- Planned test `TauCeti.GeneralizedHeegner.admissibleTriple_two` (non-example): p=2 always belongs to the excluded set. -/
theorem admissibleTriple_two (N k phiN cf hK : ℕ) (ap : O) (image required : Set (Matrix (Fin 2) (Fin 2) O)) : ¬admissibleTriple 2 N k phiN cf hK ap image required := by
  sorry

example (N k phiN cf hK : ℕ) (ap : O) (image required : Set (Matrix (Fin 2) (Fin 2) O)) : ¬admissibleTriple 2 N k phiN cf hK ap image required := by
  sorry

/-- Planned test `TauCeti.GeneralizedHeegner.admissibleTriple_class_number` (non-example): If p divides h_K the triple is excluded even when its Fourier coefficient is a unit. -/
theorem admissibleTriple_class_number (p N k phiN cf hK : ℕ) (ap : O) (image required : Set (Matrix (Fin 2) (Fin 2) O)) (h : p ∣ hK) : ¬admissibleTriple p N k phiN cf hK ap image required := by
  sorry

example (p N k phiN cf hK : ℕ) (ap : O) (image required : Set (Matrix (Fin 2) (Fin 2) O)) (h : p ∣ hK) : ¬admissibleTriple p N k phiN cf hK ap image required := by
  sorry

/-- Planned test `TauCeti.GeneralizedHeegner.admissibleTriple_unit` (compatibility): The ordinarity projection is Mathlib’s unit predicate in O_p. -/
theorem admissibleTriple_unit (p N k phiN cf hK : ℕ) (ap : O) (image required : Set (Matrix (Fin 2) (Fin 2) O)) (h : admissibleTriple p N k phiN cf hK ap image required) : ∃ u : Oˣ, (u : O) = ap := by
  sorry

example (p N k phiN cf hK : ℕ) (ap : O) (image required : Set (Matrix (Fin 2) (Fin 2) O)) (h : admissibleTriple p N k phiN cf hK ap image required) : ∃ u : Oˣ, (u : O) = ap := by
  sorry

/-! GeneralizedHeegnerCycles:GH.5 — Higher-weight Howard hypotheses
Node: GeneralizedHeegnerCycles:GH.5/higher-weight-howard-hypotheses
For LV’s T⊗Λ and each permitted height-one specialization S_P, verify the imported Howard H0–H5: rank two freeness; absolute residual irreducibility; the auxiliary extension and residual cohomology vanishing; Cartesian propagation of every local condition; a perfect self-dual pairing; and the τ-decomposition with its compatible sign. LV Lemma 2.4 gives A[p](K_∞)=0 from its determinant-restricted big image and solvable ring-class tower. Proposition 3.3 then verifies the specialization hypotheses. The pairing, local Cartier property and admissible auxiliary primes are actual verification obligations, not definitions of the source’s classes.

The exact arithmetic/geometric conditions and coefficient identifications are
those of the document; absent owner types are omitted in this prototype. -/

theorem higherWeightHowardHypotheses (residualInvariants : Submodule F D) : residualInvariants = ⊥ := by
  sorry

/-! GeneralizedHeegnerCycles:GH.5 — Longo–Vigni local assumptions
Node: GeneralizedHeegnerCycles:GH.5/longo-vigni-local-assumptions
LV Assumption 3.2 requires V crystalline at p; a rank-one ordinary filtration of T whose F⁻T has trivial inertia; F⁺T and F⁺A exact annihilators under local duality; and finiteness of H⁰(K_{∞,v},F⁻A) and H⁰(K_v,F⁻A). These clauses are kept as application hypotheses. For the self-dual higher-weight twist, the untwisted ordinary quotient’s unramifiedness is not itself proof of trivial inertia on F⁻T: its Tate character must be tracked. Resolve this with the edition’s representation convention or a stronger applicable control theorem before claiming the unconditional application.

The exact arithmetic/geometric conditions and coefficient identifications are
those of the document; absent owner types are omitted in this prototype. -/

theorem longoVigniLocalAssumptions (localCondition plus : Submodule F D) (pair : D →ₗ[F] D →ₗ[F] F) (x : D) : x ∈ plus ↔ ∀ y ∈ localCondition, pair x y = 0 := by
  sorry

/-! GeneralizedHeegnerCycles:GH.5 — Specialization and exceptional-prime control
Node: GeneralizedHeegnerCycles:GH.5/specialization-control
LV Proposition 3.4 compares the specialized Selmer module with the S_P Selmer group, with kernel and cokernel finite and bounded in terms of [S_P:Λ/P], away from a finite exceptional set. Use the actual H⁰ and local annihilator hypotheses of Assumption 3.2. This is the application’s control input for the ES.8 height-one patching theorem, including perturbed primes (g+p^m), rather than a blanket isomorphism at every prime.

The exact arithmetic/geometric conditions and coefficient identifications are
those of the document; absent owner types are omitted in this prototype. -/

theorem specializationControl (sp : D →ₗ[F] D') (exceptional : Set ℕ) (n : ℕ) (hn : n ∉ exceptional) : Module.Finite F (LinearMap.ker sp) := by
  sorry

/-! GeneralizedHeegnerCycles:GH.5 — Higher-weight Kolyvagin system
Node: GeneralizedHeegnerCycles:GH.5/higher-weight-kolyvagin-class
Starting from LV β[n], apply D_n=∏_{ℓ|n}Σ_{i=1}^{|G_ℓ|−1}iσ_ℓ^i, sum over the specified coset representatives, reduce modulo I_n and descend uniquely using residual invariant vanishing. The raw κ_n satisfy the finite–singular relation up to units u_ℓ determined by Nekovář/CH’s local calculation. Set κ′_n=(∏_{ℓ|n}u_ℓ)^{-1}κ_n⊗⊗_{ℓ|n}σ_ℓ. This lies in the imported ES.3 Kolyvagin-system module and has κ′₁=κ₁. Transverse local membership and the p-condition are separate checks; κ₁≠0 is supplied by GH.6, not by the definition.

The exact arithmetic/geometric conditions and coefficient identifications are
those of the document; absent owner types are omitted in this prototype. -/

noncomputable def correctedKolyvaginClass (u : F) (raw : D) : D := u⁻¹ • raw

/-- The local correction is the inverse product of u_ℓ, with each u_ℓ a unit. -/
theorem correctedKolyvaginClass_unit (u : F) (hu : u ≠ 0) (raw : D) : u • correctedKolyvaginClass u raw = raw := by
  sorry

/-- At n=1 the correction leaves κ₁ unchanged. -/
theorem correctedKolyvaginClass_bottom (raw : D) : correctedKolyvaginClass (1 : F) raw = raw := by
  sorry

/-- The corrected localization satisfies the exact generic finite–singular square. -/
theorem correctedKolyvaginClass_fs (fs loc : Module.End F D) (lower upper : D) (u v : F) : loc (correctedKolyvaginClass v upper) = fs (correctedKolyvaginClass u lower) := by
  sorry

/-- Changing σ_ℓ rescales the derivative coefficient and the G_ℓ tensor by reciprocal factors, preserving the intrinsic class. -/
theorem correctedKolyvaginClass_generator (a u : F) (ha : a ≠ 0) (hu : u ≠ 0) (raw : D) : correctedKolyvaginClass (a*u) (a • raw) = correctedKolyvaginClass u raw := by
  sorry

/-- Planned test `TauCeti.GeneralizedHeegner.correctedKolyvaginClass_empty` (degenerate): The empty correction product is 1 and κ′₁=κ₁. -/
theorem correctedKolyvaginClass_empty (raw : D) : correctedKolyvaginClass (1 : F) raw = raw := by
  sorry

example (raw : D) : correctedKolyvaginClass (1 : F) raw = raw := by
  sorry

/-- Planned test `TauCeti.GeneralizedHeegner.correctedKolyvaginClass_minus` (computation): A correction u=−1 negates the raw class. -/
theorem correctedKolyvaginClass_minus (raw : D) : correctedKolyvaginClass (-1 : F) raw = -raw := by
  sorry

example (raw : D) : correctedKolyvaginClass (-1 : F) raw = -raw := by
  sorry

/-- Planned test `TauCeti.GeneralizedHeegner.correctedKolyvaginClass_wrong_unit` (non-example): Replacing a correction unit by 0 kills the class and cannot give an equivalent system. -/
theorem correctedKolyvaginClass_wrong_unit (raw : D) (h : raw ≠ 0) : correctedKolyvaginClass (0 : F) raw ≠ raw := by
  sorry

example (raw : D) (h : raw ≠ 0) : correctedKolyvaginClass (0 : F) raw ≠ raw := by
  sorry

/-! GeneralizedHeegnerCycles:GH.5 — Conditional Longo–Vigni bound
Node: GeneralizedHeegnerCycles:GH.5/longo-vigni-admissibility-and-the-lambda-adic-bound
Given the verified higher-weight H0–H5, local Assumption 3.2, bounded specialization control and κ′₁≠0, import ES.5’s DVR theorem and ES.8’s Λ theorem. The pro-Selmer module is torsion free of Λ-rank one and X is pseudo-isomorphic to Λ⊕M⊕M with M torsion, char(M)=char(M)^ι and char(M) dividing char(Selhat/Λκ′₁). In ideal-containment language char(Selhat/Λκ′₁)⊆char(M). This is a conditional application of generic descent; it does not re-plan Howard’s theory or reverse the divisibility. GH.6 supplies κ′₁≠0 and identifies Λκ′₁ with H∞.

The exact arithmetic/geometric conditions and coefficient identifications are
those of the document; absent owner types are omitted in this prototype. -/

theorem longoVigniBound (torsionIndex selmerIndex : ℕ) : torsionIndex ≤ selmerIndex := by
  sorry

/-! GeneralizedHeegnerCycles:GH.6 — Anticyclotomic nonvanishing
Node: GeneralizedHeegnerCycles:GH.6/anticyclotomic-nonvanishing
Under CH Theorem 3.9’s extra (N_f,D_K)=1, the square-root measure L_{p,ψ}(f) has nonzero value at all but finitely many finite-order anticyclotomic p-power characters. Its proof chooses an auxiliary coefficient prime ℓ with absolutely irreducible residual restriction to G_K and invokes Hsieh’s Theorem C after switching the analytic tower and auxiliary prime roles; this analytic theorem is requested from L3h. Combining nonzero values with the ramified logarithm formula gives nonzero z_{f,χφ} for all but finitely many finite-order φ in the critical interval. The analytic and algebraic conclusions retain their own hypotheses.

The exact arithmetic/geometric conditions and coefficient identifications are
those of the document; absent owner types are omitted in this prototype. -/

theorem anticyclotomicNonvanishing (value : ℕ → F) : Set.Finite {n | value n = 0} := by
  sorry

/-! GeneralizedHeegnerCycles:GH.6 — Rank-one Selmer consequence
Node: GeneralizedHeegnerCycles:GH.6/selmer-rank-one
For CH Hypothesis (H), canonical CM data and an anticyclotomic χ of type (j,−j) with −r<j<r, if z_{f,χ}≠0 then Sel(K,V_f(r)⊗χ)=F·z_{f,χ}. Ordinarity is not required for this fixed-weight implication. CH Theorem 7.7 identifies the source local conditions with Bloch–Kato and supplies Euler-system descent; its higher-weight verification uses the actual local p-condition. The eventual nonvanishing assertion is supplied separately by the preceding node.

The exact arithmetic/geometric conditions and coefficient identifications are
those of the document; absent owner types are omitted in this prototype. -/

theorem selmerRankOne (sel : Submodule F D) (z : D) (hz : z ≠ 0) : sel = Submodule.span F {z} := by
  sorry

/-! GeneralizedHeegnerCycles:GH.6 — Rank-zero Selmer consequence
Node: GeneralizedHeegnerCycles:GH.6/selmer-rank-zero
Under CH (H), for ordinary f and χ of type (j,−j) with j≥r or j≤−r, L(f,χ,r)≠0 implies Sel(K,V_f(r)⊗χ)=0. The dual-exponential special value supplies a nonzero local class in the complementary Euler-system condition; CH Theorem 7.9 and the corrected Proposition 7.8 local proof then force vanishing of the Bloch–Kato Selmer group. Use χ^{-1} and conjugation for the opposite range.

The exact arithmetic/geometric conditions and coefficient identifications are
those of the document; absent owner types are omitted in this prototype. -/

theorem selmerRankZero (sel : Submodule F D) (central : F) (h : central ≠ 0) : sel = ⊥ := by
  sorry

/-! GeneralizedHeegnerCycles:GH.6 — Corrected Selmer growth formula
Node: GeneralizedHeegnerCycles:GH.6/selmer-consequences-with-the-corrected-dimension-formula
For the CH anticyclotomic ring-class p-tower, the eventual dimension is dim_F Sel(K_{p^n},V_{f,χ})=((1−ε(V_{f,χ}))/2)[K_{p^n}:K]+e with e≥0 independent of n. The root sign is −1 exactly for −r<j<r and +1 outside; thus the slope is 1 or 0. This is CH Theorem 6.3 in its corrected form, with the finite quotient and coefficient extensions in the character decomposition tracked.

The exact arithmetic/geometric conditions and coefficient identifications are
those of the document; absent owner types are omitted in this prototype. -/

theorem selmerGrowth (dimension degree : ℕ → ℕ) (ε : ℤ) (hε : ε = 1 ∨ ε = -1) : ∃ e n0 : ℕ, ∀ n ≥ n0, (dimension n : ℤ) = ((1-ε)/2)*(degree n : ℤ)+e := by
  sorry

/-! GeneralizedHeegnerCycles:GH.6 — Selmer parity
Node: GeneralizedHeegnerCycles:GH.6/selmer-parity
For ordinary f under CH (H), ord_{s=r}L(f,χ,s)≡dim_F Sel(K,V_f(r)⊗χ) mod 2. The proof uses Nekovář’s self-dual family parity theorem and its 2009 correction, plus one sufficiently ramified specialization whose Selmer dimension is 0 or 1 according to the root sign. The residue is (1−ε)/2 mod 2; ±1 itself cannot represent the two different residues modulo 2.

The exact arithmetic/geometric conditions and coefficient identifications are
those of the document; absent owner types are omitted in this prototype. -/

theorem selmerParity (analyticOrder selmerDimension : ℕ) : analyticOrder % 2 = selmerDimension % 2 := by
  sorry

/-! GeneralizedHeegnerCycles:GH.6 — Universal norm module of rank one
Node: GeneralizedHeegnerCycles:GH.6/universal-norm-module-rank-one
For LV’s admissible triple and its verified control and local assumptions, H∞, the Λ-submodule of the pro-Selmer module generated by the norm classes, is free of rank one and is generated by κ̃₁. Theorem 4.12 uses eventual nonzero generalized cycles from CH, the Φ image/intersection calculation and a universal-norm/Nakayama argument. Merely knowing κ̃₁≠0 does not prove that it generates all of H∞ or that H∞ is saturated.

The exact arithmetic/geometric conditions and coefficient identifications are
those of the document; absent owner types are omitted in this prototype. -/

theorem universalNormModuleRankOne (Hinf : Submodule F D) (κ : D) : Hinf = Submodule.span F {κ} := by
  sorry

/-! GeneralizedHeegnerCycles:GH.6 — Higher-weight Iwasawa structure
Node: GeneralizedHeegnerCycles:GH.6/lambda-structure-consequence
With the GH.5 application hypotheses verified and GH.6’s H∞=Λκ̃₁ free of rank one, LV Theorem 1.1 follows by importing the generic Λ bound: X∞∼Λ⊕M⊕M, char(M)=char(M)^ι, char(M) divides char(Selhat/H∞). Equality of characteristic ideals is LV’s main conjecture and is not asserted here. This conditional structure consequence retains the local-filtration and normalization gaps until the supplier and source comparison obligations are discharged.

The exact arithmetic/geometric conditions and coefficient identifications are
those of the document; absent owner types are omitted in this prototype. -/

theorem lambdaStructureConsequence (torsionIndex heegnerIndex : ℕ) : torsionIndex ≤ heegnerIndex := by
  sorry

/-! GeneralizedHeegnerCycles:GH.7 — Critical character and CM family twist
Node: GeneralizedHeegnerCycles:GH.7/critical-character-twist
Fix the Hida component and a lift i modulo 2(p−1). Castella’s critical character is Θ=ω^{i/2}[⟨ε_cyc⟩^{1/2}]. Extend the branch to include the CM character λ, and construct Ξ and ξ=Ξ/Ξ̄ as in §2.6. The self-dual family is T†=T⊗Θ^{-1}; the regulator line is in T†|_{G_K}⊗ξ^{-1}. The induced unramified rank-one character Ψ at p, its Frobenius value and λ_reg=Ψ(Fr_p)−1 must be tracked through this precise twist. ξ is not substituted for an arbitrary anticyclotomic character.

The exact arithmetic/geometric conditions and coefficient identifications are
those of the document; absent owner types are omitted in this prototype. -/

def criticalTwist {G : Type*} [Group G] (Θ ξ : G →* Oˣ) : G →* Oˣ := Θ⁻¹ * ξ⁻¹

/-- The twisting character is Θ(g)^{-1}ξ(g)^{-1}. -/
theorem criticalTwist_apply {G : Type*} [Group G] (Θ ξ : G →* Oˣ) (g : G) : criticalTwist Θ ξ g = (Θ g)⁻¹*(ξ g)⁻¹ := by
  sorry

/-- If the untwisted determinant character δ=Θ²ε_cyc, twisting by Θ⁻¹ξ⁻¹ gives determinant ε_cyc ξ⁻². This records the actual determinant relation, not just the square of an arbitrary inverse character. -/
theorem criticalTwist_selfDual {G : Type*} [Group G] (δ εcyc Θ ξ : G →* Oˣ) (hdet : δ = Θ^2 * εcyc) : δ * (criticalTwist Θ ξ)^2 = εcyc * ξ^(-2 : ℤ) := by
  sorry

/-- Specialization of the coefficient ring commutes with both inverse character factors. -/
theorem criticalTwist_specialize (φ : O →+* O') (x y : Oˣ) : φ ((x⁻¹*y⁻¹ : Oˣ) : O) = φ ((x⁻¹ : Oˣ) : O)*φ ((y⁻¹ : Oˣ) : O) := by
  sorry

/-- Planned test `TauCeti.GeneralizedHeegner.criticalTwist_trivial` (degenerate): With both characters trivial the twist is trivial. -/
theorem criticalTwist_trivial {G : Type*} [Group G] : criticalTwist (1 : G →* Oˣ) 1 = 1 := by
  sorry

example {G : Type*} [Group G] : criticalTwist (1 : G →* Oˣ) 1 = 1 := by
  sorry

/-- Planned test `TauCeti.GeneralizedHeegner.criticalTwist_inverse` (characterisation): Multiplying the twist by Θξ gives the trivial character. -/
theorem criticalTwist_inverse {G : Type*} [Group G] (Θ ξ : G →* Oˣ) : criticalTwist Θ ξ * (Θ*ξ) = 1 := by
  sorry

example {G : Type*} [Group G] (Θ ξ : G →* Oˣ) : criticalTwist Θ ξ * (Θ*ξ) = 1 := by
  sorry

/-- Planned test `TauCeti.GeneralizedHeegner.criticalTwist_order` (compatibility): The CM and critical inverse factors commute in the coefficient unit group. -/
theorem criticalTwist_order {G : Type*} [Group G] (Θ ξ : G →* Oˣ) : criticalTwist Θ ξ = criticalTwist ξ Θ := by
  sorry

example {G : Type*} [Group G] (Θ ξ : G →* Oˣ) : criticalTwist Θ ξ = criticalTwist ξ Θ := by
  sorry

/-! GeneralizedHeegnerCycles:GH.7 — Howard family class tower
Node: GeneralizedHeegnerCycles:GH.7/howard-family-tower
On X₁(Np^s), form the ordinary divisor/Kummer classes from Howard’s CM points P_{c₀p^n,s} defined over K̃_{c₀p^n}(μ_{p^s}), with the diamond character ϑ²=ε_cyc and critical twist Θ^{-1}. The horizontal degeneracy trace is U_p; after U_p^{-s} normalization take the s-inverse limit to X_c. Then Z_{c₀,t}=U_p^{1−t}X_{c₀p^t} is corestriction compatible in t and defines Z_{c₀,∞}∈H¹_Iw(K̃_{c₀p∞},T†). It lies in the strict Greenberg condition when the required bad-prime residual ramification holds.

The exact arithmetic/geometric conditions and coefficient identifications are
those of the document; absent owner types are omitted in this prototype. -/

noncomputable def howardTowerClass (Up : F) (X : ℕ → D) : ℕ → D := fun t => Up^(1-(t : ℤ)) • X t

/-- The conductor-t class is U_p^{1−t}X_{c₀p^t}. -/
theorem howardTowerClass_level (Up : F) (X : ℕ → D) (t : ℕ) : howardTowerClass Up X t = Up^(1-(t : ℤ)) • X t := by
  sorry

/-- The normalized family classes are corestriction compatible. -/
theorem howardTowerClass_trace (Up : F) (X : ℕ → D) (cor : ℕ → Module.End F D) (t : ℕ) : cor t (howardTowerClass Up X (t+1)) = howardTowerClass Up X t := by
  sorry

/-- The local family class lies in the strict Greenberg submodule under the source bad-prime hypotheses. -/
theorem howardTowerClass_greenberg (Up : F) (X : ℕ → D) (Gr : Submodule F D) (t : ℕ) : howardTowerClass Up X t ∈ Gr := by
  sorry

/-- Planned test `TauCeti.GeneralizedHeegner.howardTowerClass_one` (computation): At t=1 the class is X₁. -/
theorem howardTowerClass_one (Up : F) (X : ℕ → D) : howardTowerClass Up X 1 = X 1 := by
  sorry

example (Up : F) (X : ℕ → D) : howardTowerClass Up X 1 = X 1 := by
  sorry

/-- Planned test `TauCeti.GeneralizedHeegner.howardTowerClass_two` (computation): At t=2 the class is U_p^{-1}X₂. -/
theorem howardTowerClass_two (Up : F) (X : ℕ → D) : howardTowerClass Up X 2 = Up⁻¹ • X 2 := by
  sorry

example (Up : F) (X : ℕ → D) : howardTowerClass Up X 2 = Up⁻¹ • X 2 := by
  sorry

/-- Planned test `TauCeti.GeneralizedHeegner.howardTowerClass_unit` (degenerate): With U_p=1 there is no renormalization. -/
theorem howardTowerClass_unit (X : ℕ → D) : howardTowerClass (1 : F) X = X := by
  sorry

example (X : ℕ → D) : howardTowerClass (1 : F) X = X := by
  sorry

/-! GeneralizedHeegnerCycles:GH.7 — Family representation specialization
Node: GeneralizedHeegnerCycles:GH.7/family-representation-specialization
Castella’s T=lim_s e^ord T_p(J_s)⊗_h I is free of rank two under residual irreducibility and p-distinguishedness. It has trace ρ(Fr_ℓ^{-1})=a_ℓ and determinant ε_f(ℓ)[ℓ]ℓ, and its ordinary quotient is unramified with geometric Frobenius inverse eigenvalue a_p. At an arithmetic ν the critically twisted specialization identifies with T_{fν}(rν) after the specified coefficient extension and residual assumptions. This family representation and control belong to R19.6/PadicFamilies; this node checks their convention against the GH class.

The exact arithmetic/geometric conditions and coefficient identifications are
those of the document; absent owner types are omitted in this prototype. -/

theorem familyRepresentationSpecialization (specialized fixedWeight : D) : specialized = fixedWeight := by
  sorry

/-! GeneralizedHeegnerCycles:GH.7 — Family square-root measure specialization checkpoint
Node: GeneralizedHeegnerCycles:GH.7/family-measure-specialization
Import L_{p,ξ}(f)∈I_W[[Γ̃]] from L3h. Castella Theorem 2.11 gives for ν of weight (kν,1), kν≥1, and φ type (ℓ,−ℓ), ℓ≥0, conductor c₀p^n: ν(L_{p,ξ}(f))(φ̂)²/Ω_p^{2kν+4ℓ}=L_alg(fν/K,χνξνφ,kν−1)E_p²φ(𝔑^{-1})8c₀ε(fν)w_K²√D_K. Here ψ=ξνφ. For n=0 E_p=(1−ν(a_p)(χνψ)_p(p)p^{-kν/2})(1−(χνψ)_p(p)p^{kν/2−1}ν(a_p)^{-1}); for n≥1 E_p=ε((χνψ)_p^{-1})p^{-n}. The χν norm factor converts kν−1 to the central kν/2 convention (Remark 2.12). The measure is square-root normalized; the displayed interpolation squares it.

The exact arithmetic/geometric conditions and coefficient identifications are
those of the document; absent owner types are omitted in this prototype. -/

theorem familyMeasureSpecialization (value Ω Lalg Ep φN c ε wK sqrtDK : F) (k ℓ : ℕ) : value^2 / Ω^(2*k+4*ℓ) = Lalg*Ep^2*φN*8*c*ε*wK^2*sqrtDK := by
  sorry

/-! GeneralizedHeegnerCycles:GH.7 — Ochiai exponential checkpoint
Node: GeneralizedHeegnerCycles:GH.7/ochiai-exponential-checkpoint
The local supplier must provide Castella Theorem 3.4: with Ical=I⊗̂Z_p[[Γ_cyc]], D=(F⁺T⊗Ẑ_p^ur)^{G_Qp} and J=(Ψ(Fr_p)−1,γ₀−1), an injective E_F^cyc:J(D⊗O_F)→H¹(F,F⁺Tcal) with pseudo-null cokernel for finite unramified F/Q_p. Its arithmetic specialization, including the weight-positive exponential interpolation, differs at conductor 0 and positive conductor. This ideal-restricted domain and pseudo-null error must survive every regulator adapter.

The exact arithmetic/geometric conditions and coefficient identifications are
those of the document; absent owner types are omitted in this prototype. -/

theorem ochiaiExponentialCheckpoint (E : D →ₗ[F] D') : Function.Injective E := by
  sorry

/-! GeneralizedHeegnerCycles:GH.7 — Yager unramified descent checkpoint
Node: GeneralizedHeegnerCycles:GH.7/yager-unramified-checkpoint
The supplier’s Yager module S∞ is the inverse limit under trace of the finite unramified coefficient modules S_m generated by y_m(x)=Σ_σ x^σ[σ^{-1}]. It is free of rank one over Z_p[[U]], satisfies y^u=[u]y, and identifies with lim_trace O_{F_m}. Use this equivariance to descend the tensor of the cyclotomic local maps to the unramified×cyclotomic tower. Finite unramified base change of a cyclotomic regulator alone is not this construction.

The exact arithmetic/geometric conditions and coefficient identifications are
those of the document; absent owner types are omitted in this prototype. -/

theorem yagerUnramifiedCheckpoint (trace : Module.End F D) (upper lower : D) : trace upper = lower := by
  sorry

/-! GeneralizedHeegnerCycles:GH.7 — Two-variable regulator checkpoint
Node: GeneralizedHeegnerCycles:GH.7/two-variable-regulator-checkpoint
With G=U×Γ_cyc and λ_reg=Ψ(Fr_p)−1, the supplier map of Castella Theorem 3.7 has target λ_reg^{-1}J(D⊗Ô_{F∞}[[G]]), is injective, and interpolates the logarithm for w>0 at nonexceptional characters. Corollary 3.9 gives the dual exponential range w≤0 with its factorial and Euler factors. Keep the conductor-zero exceptional denominator and the integral ideal J; the target is not an unlocalized unrestricted coefficient algebra.

The exact arithmetic/geometric conditions and coefficient identifications are
those of the document; absent owner types are omitted in this prototype. -/

theorem twoVariableRegulatorCheckpoint (L : D →ₗ[F] D') : Function.Injective L := by
  sorry

/-! GeneralizedHeegnerCycles:GH.7 — Anticyclotomic family regulator
Node: GeneralizedHeegnerCycles:GH.7/family-regulator-localization
Castella Proposition 5.2 supplies L_ωf^Γ:H¹_Iw(K∞/F,F⁺T†⊗ξ^{-1})→I[λ_reg^{-1}]⊗W[[Γ]], injective with pseudo-null cokernel. It pairs the local map with the canonical family differential functional of Lemma 5.1. Passing from the two-variable tower to Γ uses the H² correction; the needed vanishing is checked through H⁰(K∞,F⁺T)=0. A quotient of the local regulator cannot be declared injective solely by tensoring its source and target.

The exact arithmetic/geometric conditions and coefficient identifications are
those of the document; absent owner types are omitted in this prototype. -/

theorem familyRegulatorLocalization (L : D →ₗ[F] F) : Function.Injective L := by
  sorry

/-! GeneralizedHeegnerCycles:GH.7 — Two-variable explicit reciprocity
Node: GeneralizedHeegnerCycles:GH.7/two-variable-explicit-reciprocity
In I[λ_reg^{-1}]⊗W[[Γ̃]], L_ωf^Γ(res_p Z_{c₀,∞}^{ξ^{-1}})=L_{p,ξ}(f)·σ_{−1,p}. This is Castella Theorem 5.3 with its own class/measure normalization; it has no additional −c₀^{r−1} prefactor. Its specialization must be compared with CH 5.7 through the named normalization adapter, not by identifying the two unnormalized class towers.

The exact arithmetic/geometric conditions and coefficient identifications are
those of the document; absent owner types are omitted in this prototype. -/

theorem twoVariableReciprocity (RΛ : Type*) [CommRing RΛ] (reg measure σminus : RΛ) : reg = measure*σminus := by
  sorry

/-! GeneralizedHeegnerCycles:GH.7 — Ordinary localization injectivity
Node: GeneralizedHeegnerCycles:GH.7/ordinary-localization-injective
For the ordinary fixed-weight specialization with residual restriction to G_K irreducible, Castella Lemma 6.4 makes the localization Sel_Gr(K_{c₀p∞}/K_{c₀},T_f(r))→H¹_Iw(local,F⁺T_f(r)) injective. The proof uses Λ-torsion freeness and infinitely many arithmetic specializations where the global rank-one class and its local logarithm are nonzero. This additional result is what turns equality of local regulator images into equality of global classes.

The exact arithmetic/geometric conditions and coefficient identifications are
those of the document; absent owner types are omitted in this prototype. -/

theorem ordinaryLocalizationInjective (loc : D →ₗ[F] D') : Function.Injective loc := by
  sorry

/-! GeneralizedHeegnerCycles:GH.7 — Initial family specialization
Node: GeneralizedHeegnerCycles:GH.7/initial-family-specialization
Under Castella Theorem 6.5, at an arithmetic ν of trivial character and weight 2rν>2 with 2rν≡k mod 2(p−1), ν(Z_{c₀,0})=(1−p^{rν−1}/ν(a_p))² AJ_et(Δ_heeg_{rν})/[u_{c₀}(2√−D_K)^{rν−1}], u_{c₀}=|O_{c₀}×|/2. Require k≡2 mod p−1, residual |G_K irreducibility, p-distinguishedness and ramification at every q|(D_K,N), with Castella’s odd-discriminant Heegner and split-p setup. The weight-two p-new exceptional prime is outside this theorem.

The exact arithmetic/geometric conditions and coefficient identifications are
those of the document; absent owner types are omitted in this prototype. -/

theorem initialFamilySpecialization (specialized classical p α u sqrtDK : F) (r : ℕ) : specialized = (1-p^(r-1)/α)^2*classical/(u*(2*sqrtDK)^(r-1)) := by
  sorry

/-! GeneralizedHeegnerCycles:GH.7 — Higher-weight family specialization
Node: GeneralizedHeegnerCycles:GH.7/higher-weight-family-specialization
Under the same source-qualified hypotheses as the initial formula, c₀^{rν−1}ν(Z_{c₀,∞})=z_{fν,c₀,α} in the strict Greenberg Iwasawa Selmer module, α=ν(a_p). The system comparison is global: it uses the family local reciprocity, CH’s fixed-weight reciprocity, exact differential and c₀ normalization, plus localization injectivity. It includes finite conductor moments through Shapiro and the specified character twists, while keeping λ_reg exceptional primes outside the localized comparison.

The exact arithmetic/geometric conditions and coefficient identifications are
those of the document; absent owner types are omitted in this prototype. -/

theorem higherWeightFamilySpecialization (c : F) (r : ℕ) (specialized fixedWeight : D) : c^(r-1) • specialized = fixedWeight := by
  sorry

end TauCeti.GeneralizedHeegner

end GeneralizedHeegnerPartGH0

noncomputable section GeneralizedHeegnerPartGH8

open scoped BigOperators
namespace TauCeti.GeneralizedHeegnerCycles.WeightTwoChecks

section ExistingChecks
variable {R M N P : Type*} [CommRing R]
variable [AddCommGroup M] [AddCommGroup N] [AddCommGroup P]
variable [Module R M] [Module R N] [Module R P]

example (q : M →ₗ[R] N) (ell : Module.Dual R N) (x : M) :
    q.dualMap ell x = ell (q x) := by
  sorry

example (q : M →ₗ[R] N) (r : N →ₗ[R] P) :
    q.dualMap.comp r.dualMap = (r.comp q).dualMap := by
  sorry

example (q : M →ₗ[R] N) (a : R) (x y : M) :
    q (x - a • y) = q x - a • q y := by
  sorry

example (q : M →ₗ[R] N) (a b : R) (x y : M) :
    q (a • x + b • y) = a • q x + b • q y := by
  sorry

example (q : M →ₗ[R] N) (ell : Module.Dual R N)
    (eta : Module.Dual R M) (c : R) (h : q.dualMap ell = c • eta) (x : M) :
    ell (q x) = c * eta x := by
  sorry
end ExistingChecks

section InitialConductor
variable {F M₀ M₁ : Type*} [Field F]
  [AddCommGroup M₀] [Module F M₀] [AddCommGroup M₁] [Module F M₁]

/-- The normalized initial Euler factor forced by the raw trace and degree.
The letters p, u and d here are scalars. The arithmetic application must separately
identify u with its geometric multiplicity, and d with the actual first degree. -/
lemma initial_corestriction_comparison
    (res : M₀ →ₗ[F] M₁) (cor : M₁ →ₗ[F] M₀)
    (σ τ : Module.End F M₀) (x₀ : M₀) (x₁ : M₁)
    (α a p u d : F) (hα : α ≠ 0) (hu : u ≠ 0)
    (hroot : α ^ 2 - a * α + p = 0) (hdegree : u * d = p - 1)
    (htrace : u • cor x₁ = a • x₀ - σ x₀ - τ x₀)
    (hcorres : cor (res x₀) = d • x₀) (hinv : σ (τ x₀) = x₀) :
    cor (α⁻¹ • (x₁ - α⁻¹ • res x₀)) =
      u⁻¹ • ((x₀ - α⁻¹ • τ x₀) - α⁻¹ • σ (x₀ - α⁻¹ • τ x₀)) := by
  sorry

/-- Changing the bottom alone is not a global renormalization of a nonzero tower. -/
lemma initial_only_rescaling_obstruction
    (cor : M₁ →ₗ[F] M₀) (y₁ : M₁) (y₀ : M₀) (h : cor y₁ = y₀)
    (hy : y₀ ≠ 0) (t : F) (ht : t ≠ 1) : cor y₁ ≠ t • y₀ := by
  sorry

-- Exact scalar model, not an asserted elliptic-curve Fourier coefficient:
-- p=5, alpha=2, a=9/2, u=1, d=4, sigma=tau=id, x0=1, cor=id.
example : (2 : ℚ)⁻¹ * ((5 / 2 : ℚ) - (2 : ℚ)⁻¹ * 4) =
    (1 - (2 : ℚ)⁻¹) ^ 2 := by
  sorry

-- Replacing u=1 by the full unit count 2 changes only the predicted bottom.
example : (2 : ℚ)⁻¹ * ((5 / 2 : ℚ) - (2 : ℚ)⁻¹ * 4) ≠
    (2 : ℚ)⁻¹ * (1 - (2 : ℚ)⁻¹) ^ 2 := by
  sorry

-- In contrast, a uniform rescaling of the entire system is compatible.
example (cor : M₁ →ₗ[F] M₀) (y₁ : M₁) (y₀ : M₀) (h : cor y₁ = y₀) (t : F) :
    cor (t • y₁) = t • y₀ := by
  sorry
end InitialConductor

section UniformComparison
variable {R : Type*} [CommRing R]
variable {M N : ℕ → Type*}
  [∀ n, AddCommGroup (M n)] [∀ n, Module R (M n)]
  [∀ n, AddCommGroup (N n)] [∀ n, Module R (N n)]

/-- The kernel bound holds for every sequence, hence for compatible sequences.
There is one common scalar d. No inverse-limit exactness is used. -/
lemma uniform_coherent_kernel_bound
    (f : ∀ n, M n →ₗ[R] N n) (g : ∀ n, N n →ₗ[R] M n) (d : R)
    (hgf : ∀ n x, g n (f n x) = d • x)
    (x : ∀ n, M n) (hx : ∀ n, f n (x n) = 0) :
    ∀ n, d • x n = 0 := by
  sorry

/-- A compatible backward comparison lifts d times every compatible sequence.
The explicit witness is g_n(y_n); no new Iwasawa carrier is introduced. -/
lemma uniform_coherent_lift
    (μ : ∀ n, M (n + 1) →ₗ[R] M n)
    (ν : ∀ n, N (n + 1) →ₗ[R] N n)
    (f : ∀ n, M n →ₗ[R] N n) (g : ∀ n, N n →ₗ[R] M n) (d : R)
    (hfg : ∀ n y, f n (g n y) = d • y)
    (hg : ∀ n y, μ n (g (n + 1) y) = g n (ν n y))
    (y : ∀ n, N n) (hy : ∀ n, ν n (y (n + 1)) = y n) :
    ∃ x : ∀ n, M n,
      (∀ n, μ n (x (n + 1)) = x n) ∧ (∀ n, f n (x n) = d • y n) := by
  sorry

-- A nonunit uniform denominator need not give an integral isomorphism.
example : ¬ ∃ x : ℤ, 2 * x = 1 := by
  sorry

-- The multiple, rather than every element itself, is lifted integrally.
example (y : ℤ) : ∃ x : ℤ, 2 * x = 2 * y := by
  sorry
end UniformComparison

section UnboundedDenominators
/-- The integral inverse system Z <-[2]- Z <-[2]- ... has only the zero section. -/
lemma doubling_tower_zero (x : ℕ → ℤ) (h : ∀ n, x n = 2 * x (n + 1)) :
    ∀ n, x n = 0 := by
  sorry

-- The level maps f_n=2^n are natural from that tower to the constant tower.
example (n : ℕ) (x : ℤ) : (2 : ℤ) ^ n * (2 * x) = 2 ^ (n + 1) * x := by
  sorry

-- Every level map is surjective over Q (and is also injective).
example (n : ℕ) (y : ℚ) : ∃ x : ℚ, (2 : ℚ) ^ n * x = y := by
  sorry

-- Nevertheless the constant integral section 1 has no coherent preimage.
example : ¬ ∃ x : ℕ → ℤ,
    (∀ n, x n = 2 * x (n + 1)) ∧ (∀ n, (2 : ℤ) ^ n * x n = 1) := by
  sorry
end UnboundedDenominators


section RegulatorDescentChecks
variable {R M N : Type*} [CommRing R]
  [AddCommGroup M] [Module R M] [AddCommGroup N] [Module R N]

-- Existing quotient algebra: an exact preimage identity is sufficient.
-- In the arithmetic application, the source/target coefficient submodules
-- and this identity must be supplied by the actual regulator construction.
example (P : Submodule R M) (Q : Submodule R N) (f : M →ₗ[R] N)
    (h : P ≤ Q.comap f) (hpreimage : Q.comap f = P) :
    Function.Injective (P.mapQ Q f h) := by
  sorry

-- Multiplication by X is injective over Q[X], but its reduction at X=0
-- is zero on the nonzero quotient Q[X]/(X), identified by constant coefficient.
example : Function.Injective (fun f : Polynomial ℚ => Polynomial.X * f) ∧
    (∀ f : Polynomial ℚ, (Polynomial.X * f).coeff 0 = 0) ∧
    (1 : Polynomial ℚ).coeff 0 ≠ 0 := by
  sorry

-- A scalar projection can lose information on a two-dimensional space.
example : ¬ Function.Injective (LinearMap.fst ℚ ℚ ℚ) := by
  sorry

-- A specified identification with a line and a nonzero functional do suffice.
example {F V : Type*} [Field F] [AddCommGroup V] [Module F V]
    (e : V ≃ₗ[F] F) (ell : Module.Dual F V) (hell : ell ≠ 0) :
    Function.Injective ell := by
  sorry
end RegulatorDescentChecks

#check Submodule.mapQ
#check Submodule.ker_mapQ
#check Submodule.mkQ_map_self
#check LinearMap.ker_eq_bot


section PrimitiveCharacters
variable {G R M N : Type*} [CommGroup G] [Fintype G]
  [CommRing R] [IsDomain R]
  [AddCommGroup M] [Module R M] [AddCommGroup N] [Module R N]

/-- The source-specific stabilization comparison is integral and requires
nontriviality on the last conductor kernel. The proof first uses the existing
scalar character-sum theorem on H, then sums over cosets. It never cancels a
nonzero scalar in M; M is allowed to have torsion.

For the arithmetic application c=alpha^(-n), beta=alpha^(-1), n>=1.
The actual cohomological specialization and conductor-kernel map are separate
GH.3 obligations using the finer HE.0 plans, not fields assumed to satisfy this conclusion. -/
lemma primitive_character_stabilization
    (H : Subgroup G) (chi : G →* R)
    (hchi : ∃ h : H, chi (h : G) ≠ 1)
    (q : M →ₗ[R] N) (a b : G → M) (beta c : R)
    (hb : ∀ (g : G) (h : H), b (g * (h : G)) = b g) :
    q (c • ∑ g : G, chi g • (a g - beta • b g)) =
      c • ∑ g : G, chi g • q (a g) := by
  sorry
end PrimitiveCharacters

section PrimitiveCharacterTests
-- C2, the sign character, and a constant lower-conductor value.
example (x : ℤ) : (∑ g : Fin 2, (-1 : ℤ) ^ g.val * x) = 0 := by
  sorry

-- Cancellation is already coefficientwise over Z; a torsion module is allowed.
example (x : ZMod 8) : (1 : ℤ) • x + (-1 : ℤ) • x = 0 := by
  sorry

-- C4, H={0,2}: chi(g)=(-1)^g is nontrivial on G, but trivial on H.
-- The H-invariant lower function b(g)=(-1)^g does not cancel.
example : (∑ g : Fin 4, (-1 : ℤ) ^ g.val * (-1 : ℤ) ^ g.val) = 4 := by
  sorry

-- The domain condition is not dispensable: 3 is a nontrivial order-2 unit
-- modulo 8, but its scalar character sum is 1+3=4, not zero.
example : (3 : ZMod 8) ^ 2 = 1 ∧ (3 : ZMod 8) ≠ 1 ∧
    (1 : ZMod 8) + 3 ≠ 0 := by
  sorry

-- An exact-conductor last-kernel model: C9, H={0,3,6}, coefficients F19.
example : (4 : ZMod 19) ^ 9 = 1 ∧ (4 : ZMod 19) ^ 3 ≠ 1 ∧
    (∑ h : Fin 3, (4 : ZMod 19) ^ (3 * h.val)) = 0 := by
  sorry

-- The alpha^(-n) normalization survives cancellation.
example (n : ℕ) :
    (2 : ℚ)⁻¹ ^ n * ((5 - (2 : ℚ)⁻¹ * 3) - (1 - (2 : ℚ)⁻¹ * 3)) =
      (2 : ℚ)⁻¹ ^ n * 4 := by
  sorry
end PrimitiveCharacterTests

section BottomFromTail
variable {R M₀ M₁ N₀ N₁ : Type*} [CommRing R]
  [AddCommGroup M₀] [Module R M₀] [AddCommGroup M₁] [Module R M₁]
  [AddCommGroup N₀] [Module R N₀] [AddCommGroup N₁] [Module R N₁]

-- Supporting check for positive-tail-corestriction, not a second new node.
-- Once the actual first-transition square exists, equality of positive tails
-- forces equality of their compatible bottoms, irrespective of injectivity.
example (mu : M₁ →ₗ[R] M₀) (nu : N₁ →ₗ[R] N₀)
    (q₀ : M₀ →ₗ[R] N₀) (q₁ : M₁ →ₗ[R] N₁)
    (hsquare : q₀.comp mu = nu.comp q₁)
    (x₀ : M₀) (x₁ : M₁) (y₀ : N₀) (y₁ : N₁)
    (hx : mu x₁ = x₀) (hy : nu y₁ = y₀) (hcomp : q₁ x₁ = y₁) :
    q₀ x₀ = y₀ := by
  sorry
end BottomFromTail

#check Equiv.sum_comp
#check MulChar.sum_eq_zero_of_ne_one

/-! Algebraic components of the retained arithmetic targets. -/
section FiniteTransport
variable {G R M N : Type*} [Fintype G] [CommRing R]
  [AddCommGroup M] [Module R M] [AddCommGroup N] [Module R N]

/-- Component of character-sum-comparison: existing linear-map and finite-sum API.
The arithmetic quotient action and the chi-inverse descent are not represented here. -/
lemma finite_weighted_sum_map (q : M →ₗ[R] N) (chi : G → R) (z : G → M) :
    q (∑ g : G, chi g • z g) = ∑ g : G, chi g • q (z g) := by
  sorry

/-- Component of positive-conductor-stabilization; no conductor-zero normalization. -/
lemma positive_stabilization_map (q : M →ₗ[R] N) (z lower : M) (beta c : R) :
    q (c • (z - beta • lower)) = c • (q z - beta • q lower) := by
  sorry
end FiniteTransport

section PositiveTrace
variable {F M₀ M₁ M₂ : Type*} [Field F]
  [AddCommGroup M₀] [Module F M₀] [AddCommGroup M₁] [Module F M₁]
  [AddCommGroup M₂] [Module F M₂]

/-- Component of positive-tail-corestriction. The actual arithmetic application
must prove both trace inputs at repeated positive conductor, of degree p.
The exponent here represents the transition from levels n+2 to n+1. -/
lemma positive_trace_normalization
    (cor : M₂ →ₗ[F] M₁) (res₁ : M₀ →ₗ[F] M₁) (res₂ : M₁ →ₗ[F] M₂)
    (x₀ : M₀) (x₁ : M₁) (x₂ : M₂) (alpha a p : F) (n : ℕ)
    (halpha : alpha ≠ 0) (hroot : alpha ^ 2 - a * alpha + p = 0)
    (htrace : cor x₂ = a • x₁ - res₁ x₀)
    (hdegree : cor (res₂ x₁) = p • x₁) :
    cor ((alpha ^ (n + 2))⁻¹ • (x₂ - alpha⁻¹ • res₂ x₁)) =
      (alpha ^ (n + 1))⁻¹ • (x₁ - alpha⁻¹ • res₁ x₀) := by
  sorry
end PositiveTrace

section SquaredDifferential
variable {F : Type*} [Field F]

/-- Component of differential-evaluation: solving log = c * AJ before squaring
uses two inverse powers of c. This algebra does not prove local realization or
base change of the arithmetic logarithm at a ramified conductor field. -/
lemma differential_squared_transport (AJ log c : F) (hc : c ≠ 0)
    (h : log = c * AJ) : AJ ^ 2 = c⁻¹ ^ 2 * log ^ 2 := by
  sorry

-- The comparison scalar 3 contributes 1/9 to a squared logarithm formula.
example : (3 : ℚ)⁻¹ ^ 2 * 6 ^ 2 = 2 ^ 2 := by
  sorry

-- A single inverse power gives the wrong value.
example : (3 : ℚ)⁻¹ * 6 ^ 2 ≠ 2 ^ 2 := by
  sorry

-- Nonzero c is required: a zero logarithm loses the Abel--Jacobi value.
example : (1 : ℚ) ^ 2 ≠ (0 : ℚ)⁻¹ ^ 2 * 0 ^ 2 := by
  sorry
end SquaredDifferential

section ReciprocityTransport
variable {R S M N : Type*} [CommRing R] [CommRing S]
  [AddCommGroup M] [Module R M] [AddCommGroup N] [Module R N]

/-- Algebraic component of weight-two-reciprocity. The arithmetic target must
construct q and the functional relation from the modular quotient, crystalline
duality and the CM/Tate-period maps; this component does not construct them. -/
lemma differential_reciprocity_transport
    (q : M →ₗ[R] N) (ellE : Module.Dual R N) (ellf : Module.Dual R M)
    (c L sigma : R) (x : M) (hdiff : q.dualMap ellE = c • ellf)
    (hrec : ellf x = -L * sigma) : ellE (q x) = -c * L * sigma := by
  sorry

/-- Component of both consumer exports: exact scalar identities transfer along
an existing coefficient homomorphism. No characteristic-ideal base change follows. -/
lemma coefficient_reciprocity_transport (rho : R →+* S)
    (A c L sigma : R) (hrec : A = -c * L * sigma) :
    rho A = -rho c * rho L * rho sigma := by
  sorry

/-- Diagnostic for automorphic-reciprocity-export: a homomorphism from a ring
where lambda has a specified inverse cannot send lambda to zero. -/
lemma specialization_of_inverse_ne_zero [Nontrivial S] (rho : R →+* S)
    (lambda invlambda : R) (hinv : lambda * invlambda = 1) : rho lambda ≠ 0 := by
  sorry

-- Dropping the group-like factor changes a character evaluation.
example (L : ℚ) (hL : L ≠ 0) : -L * (-1) ≠ -L * 1 := by
  sorry

-- Elliptic differential scaling must multiply the scalar reciprocity value.
example : -(3 : ℚ) * 5 * (-1) = 15 := by
  sorry

-- c0^{r-1} is one at weight two; the explicit minus sign remains.
example (c₀ : ℚ) : -(c₀ ^ (1 - 1 : ℕ)) = -1 := by
  sorry

-- A zero image of a nonunit coefficient loses all nonvanishing information.
example : ((-(2 : ℤ) * 3 * 1 : ℤ) : ZMod 2) = 0 := by
  sorry

-- A nonzero multiplier is insufficient for the integral leading-class comparison.
example : ¬ IsUnit (5 : ℤ) := by
  sorry
end ReciprocityTransport

end TauCeti.GeneralizedHeegnerCycles.WeightTwoChecks

end GeneralizedHeegnerPartGH8
