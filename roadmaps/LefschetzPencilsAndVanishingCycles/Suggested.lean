import Mathlib
import TauCeti.AlgebraicGeometry.Fibers
import TauCeti.LinearAlgebra.GeneralLinearGroup.Unipotent

/-!
# LefschetzPencilsAndVanishingCycles: representative target signatures

This file is not the roadmap: `README.md` is definitive, and the declarations below are not
exhaustive. They suggest Lean forms for the definitions and theorems of the roadmap that can be
stated with what the pinned Mathlib and Tau Ceti provide, so that contributors and reviewers
converge on names and signatures. Nearby and vanishing cycles, Lefschetz pencils, perverse sheaves,
semistable models and the other geometric objects of the roadmap have no carriers at the pins:
they are targets of the README and do not appear here. What remains is the linear algebra and
commutative algebra that the geometric theorems reduce to, placed in the layer of the README to
which it belongs.

Design choices made explicit here:
* over a field, an ordinary quadratic form is Mathlib's `QuadraticMap.Nondegenerate` on a nonzero
  space; this is the characteristic-free notion, and no invertibility of two is assumed;
* the coordinate expansion of a quadratic form uses `Q (e i)` on the diagonal and the polar form
  off the diagonal, with no division by two;
* local monodromy operators are Mathlib's `LinearMap.transvection` of the functional `c • B.flip δ`,
  covering transvections and reflections at once;
* Frobenius spectra are compared through `Module.End.HasEigenvalue` over an algebraically closed
  field, which is the form in which the invariant-cycle theorems are stated.

Names are relative to the namespace `TauCetiRoadmap.LefschetzPencilsAndVanishingCycles`; the README
writes them relative to the suggested home `TauCeti.AlgebraicGeometry`.
-/

namespace TauCetiRoadmap.LefschetzPencilsAndVanishingCycles

/-! ## Layer LPV.0: Nearby and vanishing cycles over a henselian trait

The trait diagram of the README is built on Tau Ceti's generic and special fibres. -/

#check TauCeti.genericFiber
#check TauCeti.specialFiber

/-! ## Layer LPV.1: Inertia, variation and the monodromy operator -/

namespace VanishingCycles

variable {K V : Type*} [Field K] [AddCommGroup V] [Module K V]

/-- A nilpotent endomorphism of a nonzero space of dimension `n` is maximally nilpotent when
`N ^ n = 0` and `N ^ (n - 1) ≠ 0`, that is, when it is a single Jordan block (Qian 2023,
Definition 3.6). The zero space is excluded. Belongs to README 1.6. -/
def IsMaximallyNilpotent (N : Module.End K V) : Prop :=
  0 < Module.finrank K V ∧ N ^ Module.finrank K V = 0 ∧ N ^ (Module.finrank K V - 1) ≠ 0

/-- A linear automorphism is maximally unipotent when `T - 1` is maximally nilpotent, that is,
when its minimal polynomial is `(X - 1) ^ n`. README 1.6. -/
def IsMaximallyUnipotent (T : LinearMap.GeneralLinearGroup K V) : Prop :=
  IsMaximallyNilpotent ((T : Module.End K V) - 1)

/-- A maximally unipotent automorphism is unipotent in the sense of Tau Ceti. -/
theorem IsMaximallyUnipotent.isUnipotent {T : LinearMap.GeneralLinearGroup K V}
    (hT : IsMaximallyUnipotent T) : LinearMap.GeneralLinearGroup.IsUnipotent T := by
  sorry

/-- The kernels of the powers of a maximally nilpotent endomorphism have the dimensions of a
single Jordan block. README 1.6, `maximalNilpotent_kernel_rank`. -/
theorem maximalNilpotent_kernel_rank [FiniteDimensional K V] {N : Module.End K V}
    (hN : IsMaximallyNilpotent N) (j : ℕ) :
    Module.finrank K (LinearMap.ker (N ^ j)) = min j (Module.finrank K V) := by
  sorry

/-- Maximal nilpotence is invariant under conjugation. -/
theorem maximalNilpotent_conj {W : Type*} [AddCommGroup W] [Module K W] (e : V ≃ₗ[K] W)
    {N : Module.End K V} (hN : IsMaximallyNilpotent N) :
    IsMaximallyNilpotent ((e : V →ₗ[K] W) ∘ₗ N ∘ₗ (e.symm : W →ₗ[K] V)) := by
  sorry

/-- The size-three Jordan block is maximally nilpotent. -/
example : IsMaximallyNilpotent
    (Matrix.toLin' !![(0 : ℚ), 1, 0; 0, 0, 1; 0, 0, 0] : Module.End ℚ (Fin 3 → ℚ)) := by
  sorry

/-- A size-two Jordan block plus a trivial line is not maximally nilpotent. -/
example : ¬ IsMaximallyNilpotent
    (Matrix.toLin' !![(0 : ℚ), 1, 0; 0, 0, 0; 0, 0, 0] : Module.End ℚ (Fin 3 → ℚ)) := by
  sorry

/-- The zero space is excluded from the definition. -/
example : ¬ IsMaximallyNilpotent (0 : Module.End ℚ (Fin 0 → ℚ)) := by
  sorry

end VanishingCycles

/-! ## Layer LPV.2: Ordinary quadratic singularities and the Picard–Lefschetz formula -/

namespace Quadric

variable {K V : Type*} [Field K] [AddCommGroup V] [Module K V]

/-- Over a field, a quadratic form is ordinary when the space is nonzero and the form is
nondegenerate in Mathlib's characteristic-free sense (radical zero, polar kernel of rank at most
one). This is the field case of the README's `Quadric.IsOrdinary` (README 2.1,
`isOrdinary_iff_nondegenerate`). -/
def IsOrdinaryOverField (Q : QuadraticForm K V) : Prop :=
  Nontrivial V ∧ Q.Nondegenerate

/-- Over a field in which two is invertible, ordinarity is nondegeneracy of the polar form. -/
theorem isOrdinaryOverField_iff_polar_nondegenerate [Invertible (2 : K)] [Nontrivial V]
    [FiniteDimensional K V] (Q : QuadraticForm K V) :
    IsOrdinaryOverField Q ↔ (QuadraticMap.polarBilin Q).Nondegenerate := by
  sorry

/-- `xy + z²` in characteristic two is ordinary: the conic `xy = z²` is smooth. -/
example : IsOrdinaryOverField
    (QuadraticMap.proj 0 1 + QuadraticMap.proj 2 2 : QuadraticForm (ZMod 2) (Fin 3 → ZMod 2)) := by
  sorry

/-- `x² + y² = (x + y)²` in characteristic two is not ordinary. -/
example : ¬ IsOrdinaryOverField
    (QuadraticMap.proj 0 0 + QuadraticMap.proj 1 1 : QuadraticForm (ZMod 2) (Fin 2 → ZMod 2)) := by
  sorry

/-- The coordinate expansion of a quadratic form on `Fin r → K` as a power series: the diagonal
coefficients are `Q (e i)` and the coefficient of `X i * X j`, `i < j`, is `polar Q (e i) (e j)`,
with no division by two. README 2.4. -/
noncomputable def quadraticSeries {r : ℕ} (Q : QuadraticForm K (Fin r → K)) :
    MvPowerSeries (Fin r) K :=
  (∑ i : Fin r, algebraMap K (MvPowerSeries (Fin r) K) (Q (Pi.single i 1)) *
      (MvPowerSeries.X i) ^ 2) +
    ∑ i : Fin r, ∑ j ∈ Finset.univ.filter (fun j => i < j),
      algebraMap K (MvPowerSeries (Fin r) K)
          (QuadraticMap.polar Q (Pi.single i 1) (Pi.single j 1)) *
        MvPowerSeries.X i * MvPowerSeries.X j

/-- A power series has order at least three when all its coefficients of total degree at most two
vanish. README 2.4. -/
def OrderAtLeastThree {σ : Type*} (f : MvPowerSeries σ K) : Prop :=
  ∀ m : σ →₀ ℕ, (m.sum fun _ e => e) < 3 → MvPowerSeries.coeff (R := K) m f = 0

/-- The formal germ of an ordinary quadratic point in `r = n + 1` variables: a `K`-algebra
isomorphic to `K⟦x₁, …, x_r⟧ / (Q + R)` with `Q` ordinary and `R` of order at least three. This is
the field specialization of the README's `Quadric.IsOrdinaryQuadraticPoint` (README 2.4). -/
def IsOrdinaryQuadraticGerm (A : Type*) [CommRing A] [Algebra K A] (r : ℕ) : Prop :=
  0 < r ∧ ∃ (Q : QuadraticForm K (Fin r → K)) (R : MvPowerSeries (Fin r) K),
    IsOrdinaryOverField Q ∧ OrderAtLeastThree R ∧
      Nonempty (A ≃ₐ[K] (MvPowerSeries (Fin r) K ⧸ Ideal.span {quadraticSeries Q + R}))

/-- The cone of an ordinary form is an ordinary germ. README 2.4, `isOrdinaryQuadraticPoint_cone`. -/
theorem isOrdinaryQuadraticGerm_cone {r : ℕ} (hr : 0 < r) (Q : QuadraticForm K (Fin r → K))
    (hQ : IsOrdinaryOverField Q) :
    IsOrdinaryQuadraticGerm (K := K)
      (MvPowerSeries (Fin r) K ⧸ Ideal.span {quadraticSeries Q}) r := by
  sorry

/-- For the product of two coordinates the expansion is the monomial `X i * X j`, including the
case `i = j`. README 2.4, `quadraticSeries_proj`. -/
example : quadraticSeries (QuadraticMap.proj 0 1 : QuadraticForm ℚ (Fin 2 → ℚ)) =
    MvPowerSeries.X 0 * MvPowerSeries.X 1 := by
  sorry

/-- The diagonal case: `x₀²` expands to `X 0 ^ 2`, with no factor of two. -/
example : quadraticSeries (QuadraticMap.proj 0 0 : QuadraticForm ℚ (Fin 2 → ℚ)) =
    MvPowerSeries.X 0 ^ 2 := by
  sorry

/-- The centre `Z(Q)` of the even Clifford algebra. README 2.2, `evenCliffordCentre`. -/
abbrev evenCliffordCentre (Q : QuadraticForm K V) : Subalgebra K (CliffordAlgebra.even Q) :=
  Subalgebra.center K (CliffordAlgebra.even Q)

/-- For an ordinary form of even rank the even Clifford centre has dimension two, in every
characteristic. README 2.2, `evenCliffordCentre_isEtale`. -/
theorem finrank_evenCliffordCentre [FiniteDimensional K V] (Q : QuadraticForm K V)
    (hQ : IsOrdinaryOverField Q) (heven : Even (Module.finrank K V)) :
    Module.finrank K (evenCliffordCentre Q) = 2 := by
  sorry

end Quadric

/-! ## Layer LPV.4: Global vanishing cycles -/

namespace LefschetzPencil

variable {K V : Type*} [Field K] [AddCommGroup V] [Module K V]

/-- The local monodromy operator `x ↦ x + c (x, δ) δ`: a transvection when `(δ, δ) = 0` and a
reflection when `c (δ, δ) = -2`. README 4.3. -/
def localTransvection (B : LinearMap.BilinForm K V) (c : K) (δ : V) : Module.End K V :=
  LinearMap.transvection (c • B.flip δ) δ

/-- The common fixed space of the local operators is the orthogonal of the span of the vanishing
cycles. README 4.3 (Weil I, Proposition 5.3). -/
theorem fixedSpace_localTransvections {ι : Type*} [Finite ι] (B : LinearMap.BilinForm K V)
    (hB : B.IsRefl) (c : ι → K) (hc : ∀ i, c i ≠ 0) (δ : ι → V) :
    (⨅ i, LinearMap.ker (localTransvection B (c i) (δ i) - 1)) =
      B.orthogonal (Submodule.span K (Set.range δ)) := by
  sorry

/-- On `ℚ²` with the dot product, the reflection in `δ = (1, -1)` swaps the coordinates. -/
example : localTransvection (Matrix.toBilin' (1 : Matrix (Fin 2) (Fin 2) ℚ)) (-1) ![1, -1]
    ![1, 0] = ![0, 1] := by
  sorry

/-- Reflections in an `A₂` pair of roots of square two with pairing `-1`: the composite has trace
`-1 = dim E - 4 + (δ, δ')²`, the identity used in README 5.10 (Weil II, p. 230, prints the
constant `2` in place of `4`, which would give `1` here). -/
example : LinearMap.trace ℚ (Fin 2 → ℚ)
    (localTransvection (Matrix.toBilin' !![(2 : ℚ), -1; -1, 2]) (-1) ![1, 0] ∘ₗ
      localTransvection (Matrix.toBilin' !![(2 : ℚ), -1; -1, 2]) (-1) ![0, 1]) = -1 := by
  sorry

/-- The radical `E ∩ E^⊥` of the restriction of `B` to `E`, as a submodule of `E`. README 4.4. -/
def vanishingRadical (B : LinearMap.BilinForm K V) (E : Submodule K V) : Submodule K E :=
  (B.orthogonal E).comap E.subtype

/-- The radical quotient `E / (E ∩ E^⊥)`. README 4.4, `vanishingQuotient`. -/
abbrev vanishingQuotient (B : LinearMap.BilinForm K V) (E : Submodule K V) :=
  E ⧸ vanishingRadical B E

/-- A reflexive form induces a nondegenerate form on the radical quotient. README 4.4,
`vanishingForm`, `vanishingForm_nondegenerate`, `vanishingForm_mk`. -/
theorem exists_vanishingForm (B : LinearMap.BilinForm K V) (hB : B.IsRefl) (E : Submodule K V) :
    ∃ ψ : LinearMap.BilinForm K (vanishingQuotient B E), ψ.Nondegenerate ∧
      ∀ x y : E, ψ (Submodule.mkQ _ x) (Submodule.mkQ _ y) = B x y := by
  sorry

/-- The standard symplectic form on `ℚ⁴` with `B(e₀, e₁) = B(e₂, e₃) = 1`. -/
def stdSymplectic4 : LinearMap.BilinForm ℚ (Fin 4 → ℚ) :=
  Matrix.toBilin' !![0, 1, 0, 0; -1, 0, 0, 0; 0, 0, 0, 1; 0, 0, -1, 0]

/-- `E = span(e₀, e₁, e₂)` has radical `ℚ e₂` and a two-dimensional radical quotient. -/
example : Module.finrank ℚ (vanishingQuotient stdSymplectic4
    (Submodule.span ℚ {Pi.single 0 1, Pi.single 1 1, Pi.single 2 1})) = 2 := by
  sorry

/-- The totally isotropic `span(e₀, e₂)` has zero radical quotient. -/
example : Module.finrank ℚ (vanishingQuotient stdSymplectic4
    (Submodule.span ℚ {Pi.single 0 1, Pi.single 2 1})) = 0 := by
  sorry

/-! ## Layer LPV.5: Conjugacy, monodromy and the open image theorem -/

attribute [local instance 100] LieRing.ofAssociativeRing

/-- The rank-one nilpotent `N(δ) : x ↦ ψ(x, δ) δ`. README 5.6. -/
def symplecticTransvectionGenerator (B : LinearMap.BilinForm K V) (δ : V) : Module.End K V :=
  (B.flip δ).smulRight δ

/-- Weil I, Lemme 5.11: a Lie subalgebra of `𝔰𝔭(V, ψ)` acting irreducibly and generated by
operators `N(δ_i)` is all of `𝔰𝔭(V, ψ)`. README 5.6. -/
theorem eq_skewAdjoint_of_generated [CharZero K] [FiniteDimensional K V]
    (B : LinearMap.BilinForm K V) (hB : LinearMap.IsAlt B) (hBnd : B.Nondegenerate)
    (L : LieSubalgebra K (Module.End K V)) (hL : L ≤ skewAdjointLieSubalgebra B)
    {ι : Type*} (δ : ι → V)
    (hgen : LieSubalgebra.lieSpan K (Module.End K V)
      (Set.range fun i => symplecticTransvectionGenerator B (δ i)) = L)
    [LieModule.IsIrreducible K L V] :
    L = skewAdjointLieSubalgebra B := by
  sorry

end LefschetzPencil

/-! ## Layer LPV.7a: Semistable curves and strictly semistable degenerations -/

namespace Semistable

variable {Λ : Type*} [CommRing Λ] {Vx Ed : Type*}

/-- The normalization differential `(d a)(e) = a(tail e) - a(head e)` of an oriented dual graph,
the degree-zero map of the two-term complex computing `H⁰(Γ, Λ)` and `H¹(Γ, Λ)`. README 7a.1. -/
def normalizationDifferential (tail head : Ed → Vx) : (Vx → Λ) →ₗ[Λ] (Ed → Λ) where
  toFun a e := a (tail e) - a (head e)
  map_add' a b := by
    funext e
    simp only [Pi.add_apply]
    ring
  map_smul' c a := by
    funext e
    simp only [Pi.smul_apply, smul_eq_mul, RingHom.id_apply]
    ring

/-- `d` kills constant vertex functions. README 7a.1, `normalizationDifferential_constant`. -/
theorem normalizationDifferential_const (tail head : Ed → Vx) (c : Λ) :
    normalizationDifferential tail head (fun _ => c) = 0 := by
  sorry

/-- A loop has zero differential. -/
example : normalizationDifferential (Λ := ℚ) (fun _ : Unit => ()) (fun _ => ()) = 0 := by
  sorry

/-- Illusie's negative thickness-weighted edge form `u₋(a, b) = -Σ_e n_e a_e b_e`. README 7a.3. -/
def negEdgePairing [Fintype Ed] [DecidableEq Ed] (n : Ed → ℕ) : LinearMap.BilinForm Λ (Ed → Λ) :=
  Matrix.toBilin' (-(Matrix.diagonal fun e => (n e : Λ)))

/-- For the two-edge cycle of unit thickness the graph cycle `(1, -1)` has `u₋`-norm `-2`. -/
example : negEdgePairing (Λ := ℚ) (fun _ : Fin 2 => 1) ![1, -1] ![1, -1] = -2 := by
  sorry

end Semistable

/-! ## Layer LPV.7b: Invariant cycles -/

namespace InvariantCycles

/-- The specialization map corestricted to the inertia invariants. README 7b.1. -/
noncomputable def invariantSpecialization {G k W V : Type*} [Group G] [CommRing k] [AddCommGroup V]
    [Module k V] [AddCommGroup W] [Module k W] (ρ : Representation k G V) (sp : W →ₗ[k] V)
    (h : ∀ w, sp w ∈ ρ.invariants) : W →ₗ[k] ρ.invariants :=
  LinearMap.codRestrict ρ.invariants sp h

/-- Spectral separation (README 7b.5): in an exact cross `L → M → C`, `M ↠ B` of
finite-dimensional spaces over an algebraically closed field, equivariant for endomorphisms of
`M`, `C` and `B`, if no eigenvalue on `B` is an eigenvalue on `C` then `L → B` is surjective. This
is the step of Weil II 3.6.1 that the weight bounds feed. -/
theorem surjective_of_disjoint_spectra {K L M C B : Type*} [Field K] [IsAlgClosed K]
    [AddCommGroup L] [Module K L] [AddCommGroup M] [Module K M] [FiniteDimensional K M]
    [AddCommGroup C] [Module K C] [FiniteDimensional K C]
    [AddCommGroup B] [Module K B] [FiniteDimensional K B]
    (f : L →ₗ[K] M) (g : M →ₗ[K] C) (p : M →ₗ[K] B) (hfg : Function.Exact f g)
    (hp : Function.Surjective p) (FM : Module.End K M) (FC : Module.End K C)
    (FB : Module.End K B) (hg : g ∘ₗ FM = FC ∘ₗ g) (hpF : p ∘ₗ FM = FB ∘ₗ p)
    (hdisj : ∀ μ : K, FB.HasEigenvalue μ → ¬ FC.HasEigenvalue μ) :
    Function.Surjective (p ∘ₗ f) := by
  sorry

end InvariantCycles

/-!
The remaining targets of the README have no carriers at the pins and are stated there only:
the henselian trait diagram, the tame character of a henselian trait and absolute purity (0.1,
0.10); the topos `X_s ×_s S`, `Ψ`, `RΨ`, `RΦ`, the variation and their functoriality (0.2–0.9);
Grothendieck's monodromy theorems, the twisted operator `N`, the monodromy filtration in an
abelian category and its primitive decomposition, the relative filtration, `can` and `var`, the
two-component semistable complex and the semisimple trace (1.1–1.10); quadrics, their cohomology,
ordinary quadratic points over a base, standard degenerations and the Picard–Lefschetz theory
(2.1–2.8); Lefschetz pencils, dual varieties and their existence (3.1–3.5); the direct images of a
pencil, the vanishing subspace and the blow-up formulas (4.1–4.5); Bertini, conjugacy, generation,
irreducibility, the middle-degree reduction, compact `ℓ`-adic subgroups, the Kazhdan–Margulis
theorem, the orthogonal and characteristic-two branches and the gcd lemma (5.1–5.11); Gabber's
perversity theorems and the tower criterion (6.1–6.6); nodal curves, the Jacobian comparison and
the weight spectral sequence (7a.1–7a.9); and the invariant-cycle theorems (7b.1–7b.11).
-/

end TauCetiRoadmap.LefschetzPencilsAndVanishingCycles
