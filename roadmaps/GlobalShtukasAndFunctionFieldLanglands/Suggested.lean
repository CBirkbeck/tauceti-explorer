import Mathlib

/-!
# GlobalShtukasAndFunctionFieldLanglands: representative target signatures

This file is not the roadmap and is not exhaustive: `README.md` is the definitive specification.
It records the definitions and theorem signatures of the roadmap that can be stated against the
pinned Mathlib, so that contributors and reviewers converge on names and signatures. Every
theorem is proved by `sorry`; nothing here claims an implementation.

Neither library has algebraic stacks, ℓ-adic sheaves on them, Beilinson–Drinfeld Grassmannians,
shtukas or their cohomology, so the moduli stacks, the Satake equivalence, the cohomology of
shtukas, Drinfeld's lemma, the excursion operators themselves and the local parameterization are
README targets only. What is stated here are the parts of those targets that live on existing
carriers:

* numerical Harder–Narasimhan data on classes (rank, degree) of coherent sheaves on a curve
  (Layer GS.0): the Euler form, the slope with value `⊤` on torsion classes, and the shifted
  slope of a block of a filtration;
* integral Hecke finiteness (Layer GS.3): membership in a finitely generated submodule over the
  integral coefficient ring that is stable under every operator of a family, its closure
  properties, and the monic-recurrence bound behind the finite Frobenius box;
* excursion data (Layer GS.5): the matrix coefficient of a representation of a product group,
  and the excursion algebra of a family of endomorphisms with its decomposition into generalized
  character spaces.

Design choices made explicit here: Hecke finiteness is stated over the integral ring `R`
(`O_E` in the roadmap), never over its fraction field; the excursion decomposition is by
generalized eigenspaces of characters of the algebra, not by eigenspaces; and the slope of a
torsion class is `⊤` in `WithTop ℚ` rather than a junk value.
-/

namespace TauCetiRoadmap.GlobalShtukasAndFunctionFieldLanglands

/-! ## Layer GS.0: bundles, levels and adelic geometry -/

section NumericalClasses

/-- The Euler form on numerical classes `(rank, degree)` of coherent sheaves on a smooth
projective curve of genus `g`: `χ((r, d), (r', d')) = (1 - g) r r' + r d' - r' d`. It is
`dim Hom - dim Ext¹`, since coherent sheaves on a curve form a hereditary category
(README §GS.0.5). -/
def eulerForm (g : ℤ) (c c' : ℕ × ℤ) : ℤ :=
  (1 - g) * c.1 * c'.1 + c.1 * c'.2 - c'.1 * c.2

/-- On `P¹`, `χ(O, O(1)) = 2 = h⁰(O(1))`. -/
example : eulerForm 0 (1, 0) (1, 1) = 2 := by
  decide

/-- On `P¹`, `χ(O(1), O) = 0`: the antisymmetric term has the sign `r d' - r' d`. -/
example : eulerForm 0 (1, 1) (1, 0) = 0 := by
  decide

/-- The slope `deg / rank` of a numerical class, with value `⊤` on rank-zero pairs.
The value at `(0, 0)` only totalizes this numerical function; the zero sheaf has no slope. -/
def slope (c : ℕ × ℤ) : WithTop ℚ :=
  if c.1 = 0 then ⊤ else (((c.2 : ℚ) / (c.1 : ℚ) : ℚ) : WithTop ℚ)

/-- A skyscraper of length one at a point of degree `3` has slope `⊤`. -/
example : slope (0, 3) = ⊤ := by
  simp [slope]

/-- The class `(2, 1)` has slope `1/2`. -/
example : slope (2, 1) = (((1 : ℚ) / 2 : ℚ) : WithTop ℚ) := by
  norm_num [slope]

/-- The shifted slope of the block of ranks `(a, b]` of a filtration, for a dominant shift
`T = (T₁ ≥ T₂ ≥ ⋯)`: `(deg - (T_{a+1} + ⋯ + T_b)) / (b - a)` (README §GS.0.8).
For the geometric interpretation `a < b`; values at empty blocks only totalize the formula.
The shift is real, as in Arthur truncation, and need not be rational. -/
noncomputable def shiftedSlope (T : ℕ → ℝ) (a b : ℕ) (deg : ℤ) : ℝ :=
  ((deg : ℝ) - ∑ i ∈ Finset.Ioc a b, T i) / ((b : ℝ) - a)

/-- `O(1) ⊕ O(−1)` on `P¹` is semistable for the shift `T = (1, −1)`: the shifted slope of the
destabilizing line `O(1)` does not exceed that of the whole bundle. -/
example :
    shiftedSlope (fun i => if i = 1 then 1 else if i = 2 then -1 else 0) 0 1 1 ≤
      shiftedSlope (fun i => if i = 1 then 1 else if i = 2 then -1 else 0) 0 2 0 := by
  norm_num [shiftedSlope, Finset.sum_Ioc_succ_top]

/-- With the zero shift the same line destabilizes: ordinary semistability fails. -/
example : ¬ (shiftedSlope (fun _ => 0) 0 1 1 ≤ shiftedSlope (fun _ => 0) 0 2 0) := by
  norm_num [shiftedSlope]

end NumericalClasses

/-! ## Layer GS.3: Hecke finiteness and cohomological control -/

section IntegralFiniteness

variable {R : Type*} [CommRing R]
variable {M : Type*} [AddCommGroup M] [Module R M]
variable {ι : Type*}

/-- A vector `m` is Hecke-finite for a family `T` of `R`-linear operators when it lies in a
finitely generated `R`-submodule stable under every operator of the family. In the roadmap `R`
is the integral coefficient ring `O_E`; a finite-dimensional stable span over the fraction field
is a different, weaker condition (README §GS.3.2). -/
def HeckeFinite (T : ι → Module.End R M) (m : M) : Prop :=
  ∃ L : Submodule R M, L.FG ∧ m ∈ L ∧ ∀ i, ∀ x ∈ L, T i x ∈ L

/-- The zero vector is Hecke-finite, with the zero submodule as witness. -/
example (T : ι → Module.End R M) : HeckeFinite T 0 :=
  ⟨⊥, Submodule.fg_bot, Submodule.zero_mem _, fun i x hx => by
    rw [Submodule.mem_bot] at hx
    simp [hx]⟩

/-- For operators that are integral scalars, the cyclic submodule `R ∙ m` is a witness. -/
example (a : ι → R) (m : M) :
    HeckeFinite (fun i => a i • (LinearMap.id : Module.End R M)) m :=
  ⟨R ∙ m, Submodule.fg_span_singleton m, Submodule.mem_span_singleton_self m,
    fun i x hx => by simpa using Submodule.smul_mem _ (a i) hx⟩

/-- A finite family of Hecke-finite vectors has one common finitely generated stable witness. -/
theorem HeckeFinite.finiteLattice (T : ι → Module.End R M)
    (s : Finset M) (hs : ∀ m ∈ s, HeckeFinite T m) :
    ∃ L : Submodule R M, L.FG ∧ (∀ m ∈ s, m ∈ L) ∧ ∀ i, ∀ x ∈ L, T i x ∈ L := by
  sorry

/-- An equivariant linear map carries Hecke-finite vectors to Hecke-finite vectors. -/
theorem HeckeFinite.map {M' : Type*} [AddCommGroup M'] [Module R M']
    (T : ι → Module.End R M) (T' : ι → Module.End R M')
    (f : M →ₗ[R] M') (hf : ∀ i, f.comp (T i) = (T' i).comp f)
    {m : M} (hm : HeckeFinite T m) : HeckeFinite T' (f m) := by
  sorry

/-- An operator annihilated by a monic polynomial with integral coefficients has every vector
in a finitely generated stable submodule. Applied coordinatewise to the Eichler–Shimura
relation, this gives the finite Frobenius box of README §GS.4.5. -/
theorem finiteLattice_of_monic_recurrence (T : Module.End R M)
    (P : Polynomial R) (hP : P.Monic) (hPT : Polynomial.aeval T P = 0)
    (m : M) : HeckeFinite (fun _ : Unit => T) m := by
  sorry

/-- On `ℚ_ℓ` over `ℤ_ℓ`, the operator `ℓ⁻¹` keeps the line through `1` but no finitely
generated `ℤ_ℓ`-submodule containing `1`: the vector `1` is not Hecke-finite. -/
theorem not_heckeFinite_inv_ell (ℓ : ℕ) [Fact ℓ.Prime] :
    ¬ HeckeFinite (R := ℤ_[ℓ])
      (fun _ : Unit => (ℓ : ℚ_[ℓ])⁻¹ • (LinearMap.id : Module.End ℤ_[ℓ] ℚ_[ℓ]))
      (1 : ℚ_[ℓ]) := by
  sorry

end IntegralFiniteness

section FractionField

variable {R E M : Type*} [CommRing R] [Field E] [Algebra R E]
variable [AddCommGroup M] [Module E M] [Module R M] [IsScalarTower R E M]
variable {ι : Type*}

/-- The Hecke-finite vectors form an `E`-subspace when the operators are `E`-linear: an `E`-scalar
multiple of a Hecke-finite vector is Hecke-finite (with the common-witness theorem, sums are
Hecke-finite too). -/
theorem HeckeFinite.smul (T : ι → Module.End E M) (a : E) {m : M}
    (hm : HeckeFinite (R := R) (fun i => (T i).restrictScalars R) m) :
    HeckeFinite (R := R) (fun i => (T i).restrictScalars R) (a • m) := by
  sorry

end FractionField

/-! ## Layer GS.5: global excursions and the parameterization -/

section Excursions

/-- The matrix coefficient `g ↦ ξ (ρ g x)` of a representation of a group `G`. For `G = Ĝ^I`
and `x`, `ξ` invariant under the diagonal, it is the invariant function `f` that indexes an
excursion operator (README §GS.5.2). -/
def excursionFunction {k G W : Type*} [CommRing k] [Group G] [AddCommGroup W] [Module k W]
    (ρ : Representation k G W) (x : W) (ξ : Module.Dual k W) : G → k :=
  fun g => ξ (ρ g x)

/-- At the identity the matrix coefficient is the pairing `ξ x`. -/
example {k G W : Type*} [CommRing k] [Group G] [AddCommGroup W] [Module k W]
    (ρ : Representation k G W) (x : W) (ξ : Module.Dual k W) :
    excursionFunction ρ x ξ 1 = ξ x := by
  simp [excursionFunction]

/-- For `x` and `ξ` invariant under the diagonal copy of `H` in `H^I`, the matrix coefficient is
invariant under left and right translation by the diagonal: it is a function on
`H \ H^I / H`. -/
theorem excursionFunction_diagonal_invariant {k H W I : Type*} [CommRing k] [Group H]
    [AddCommGroup W] [Module k W] (ρ : Representation k (I → H) W) (x : W)
    (ξ : Module.Dual k W) (hx : ∀ h : H, ρ (fun _ => h) x = x)
    (hξ : ∀ h : H, ξ ∘ₗ ρ (fun _ => h) = ξ) (h h' : H) (g : I → H) :
    excursionFunction ρ x ξ ((fun _ => h) * g * (fun _ => h')) = excursionFunction ρ x ξ g := by
  sorry

variable {K V ι : Type*} [Field K] [AddCommGroup V] [Module K V]

/-- The excursion algebra of a family of endomorphisms: the subalgebra of `End V` that the
family generates (README §GS.5.7, where the family is all global excursion operators on the
cusp space). -/
def excursionAlgebra (S : ι → Module.End K V) : Subalgebra K (Module.End K V) :=
  Algebra.adjoin K (Set.range S)

/-- The empty family generates only the scalars. -/
example (S : Empty → Module.End K V) : excursionAlgebra S = ⊥ := by
  rw [excursionAlgebra, Set.range_eq_empty, Algebra.adjoin_empty]

/-- A pairwise commuting family generates a commutative algebra. -/
theorem excursionAlgebra_commute (S : ι → Module.End K V)
    (hS : ∀ i j, Commute (S i) (S j)) :
    ∀ a ∈ excursionAlgebra S, ∀ b ∈ excursionAlgebra S, Commute a b := by
  sorry

/-- On a finite-dimensional space the excursion algebra is finite-dimensional. -/
theorem excursionAlgebra_finiteDimensional [FiniteDimensional K V]
    (S : ι → Module.End K V) : FiniteDimensional K (excursionAlgebra S) := by
  sorry

/-- The decomposition milestone: over an algebraically closed field, for a commuting family on a
finite-dimensional space, the generalized character spaces of the excursion algebra span the
whole space. The blocks are generalized eigenspaces of characters `χ`; reducedness of the algebra
is not assumed. -/
theorem iSup_generalizedCharacterSpace_eq_top [IsAlgClosed K] [FiniteDimensional K V]
    (S : ι → Module.End K V) (hS : ∀ i j, Commute (S i) (S j)) :
    ⨆ χ : excursionAlgebra S →ₐ[K] K,
      ⨅ a : excursionAlgebra S, (a : Module.End K V).maxGenEigenspace (χ a) = ⊤ := by
  sorry

/-- A Jordan block: the excursion algebra of the single operator `J (x, y) = (x + y, y)` on `ℚ²`
contains `J`, and `(0, 1)` is a generalized eigenvector of `J` for the eigenvalue `1` that is not
an eigenvector. A decomposition by eigenspaces would miss it. -/
example :
    let J : Module.End ℚ (ℚ × ℚ) :=
      LinearMap.id + (LinearMap.inl ℚ ℚ ℚ).comp (LinearMap.snd ℚ ℚ ℚ)
    J ∈ excursionAlgebra (fun _ : Unit => J) ∧
      ((J - 1) ^ 2 : Module.End ℚ (ℚ × ℚ)) (0, 1) = 0 ∧
      ((J - 1 : Module.End ℚ (ℚ × ℚ)) (0, 1)) ≠ 0 := by
  intro J
  refine ⟨Algebra.subset_adjoin ⟨(), rfl⟩, ?_, ?_⟩
  · simp [J, pow_two, Module.End.mul_apply]
  · simp [J]

end Excursions

/-
README targets that are not stated here, because their carriers are not in Mathlib or Tau Ceti
at the pins: the stacks `BunG`, `BunG.level`, `IwahoriBundle`, `HNType`/`HNFiltration` for
sheaves, `ShiftedHN`, `ParabolicInstability`, `CentralLattice`, `BunG.automorphicFunctions` (Layer GS.0);
`BDGrassmannian`, `SchubertBound`, `GlobalHecke`, `StackSheaf`, `IwahoriHecke`,
`satakeDeterminantLine`, `ClassicalSatake`, `IntegralSatake` and the geometric Satake equivalence (Layer GS.1); `GlobalShtuka`,
`TwistedShtuka`, `ShtukaIC`, `ShtukaCohomology`, `HorocycleIndex`, `Shtuka.partialFrobenius`,
`ShtukaHecke` (Layer GS.2); `CreateLegs`, `AnnihilateLegs`, `PGL2Shtuka`, `ShtukaCohom`
(Layer GS.3); `FrobeniusWeil`, `ShtukaH` (Layer GS.4); `GlobalExcursion`,
`CompactShtukaCohom` (Layer GS.5); `RestrictedShtuka`, `LocalExcursion`, `LocalGamma` (Layer GS.7).
-/

end TauCetiRoadmap.GlobalShtukasAndFunctionFieldLanglands
