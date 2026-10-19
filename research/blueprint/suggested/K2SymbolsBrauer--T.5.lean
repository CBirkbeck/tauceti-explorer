/-
This file is not the roadmap and is not exhaustive. The reader document
(research/blueprint/readmes/K2SymbolsBrauer--T.5.md) is definitive. These statements suggest Lean
forms so that contributors and reviewers converge on names and signatures. Unproved theorems are
roadmap targets; the examples and two adapters to existing matrix results are proved.

What can be stated here. The Steinberg group St_n(A) of K2SymbolsBrauer T.1 and the group K₂ are
not carriers at the pinned commits (Tau Ceti f790474, Mathlib 082e2d3). So the Steinberg-side
statements of this part are README targets: the monomial subgroup W_n(A) ⊆ St_n(A), the
finite-rank symbols {u, v}_n, Steinberg's generation theorem (Milnor 9.11), the cover
St_n(F) = T·W·T (Milnor 9.15) and the field kernel theorem (Milnor 9.12), and all T.5 statements
about K₂. What is stated here is their elementary-matrix side, over Mathlib's transvections and
Tau Ceti's `transvectionUnit`, `diagGL`, `permutationGL` and `upperUnitriangularGroup`: the images
φ(w_ij(u)) and φ(h_ij(u)), Lemma 9.1, the conjugation formula of Corollary 9.4, the diagonal step
of Theorem 9.11, the normal form of Lemma 9.14 in rank three, and the step of Theorem 9.12 that an
upper unitriangular monomial matrix is the identity. T.5's real sign pairing is also stated here,
together with the unit tests of the packet that can be written over these carriers. No data is
defined by `sorry`, and no condition is replaced by a placeholder.
-/
import Mathlib
import TauCeti.LinearAlgebra.Matrix.GeneralLinearGroup.Transvection
import TauCeti.LinearAlgebra.Matrix.GeneralLinearGroup.Diagonal.Normalizer
import TauCeti.LinearAlgebra.Matrix.GeneralLinearGroup.UpperUnitriangular.Basic
import TauCeti.LinearAlgebra.Matrix.SpecialLinearGroup.Diagonal

open Matrix

open scoped commutatorElement

namespace TauCeti.SteinbergMonomial

variable {A : Type*} [CommRing A] {n : ℕ}

/-! ## `T.2:symbols/monomial-kernel/monomial-subgroup`: the images of the Weyl and diagonal lifts

README targets on the Steinberg side: `Steinberg.monomialSubgroup`, `Steinberg.monomialKernel`,
`Steinberg.mem_monomialKernel_iff`, `Steinberg.monomialSubgroup_map`,
`Steinberg.monomialSubgroup_stabilise`, `Steinberg.monomialSubgroup_int`, and the unit test
`monomialSubgroup_int_compat`. -/

/-- The elementary image `φ(w_ij(u)) = e_ij(u) e_ji(-u⁻¹) e_ij(u)` of the Weyl lift word. -/
def weylGL {i j : Fin n} (hij : i ≠ j) (u : Aˣ) : GL (Fin n) A :=
  transvectionUnit hij (u : A) * transvectionUnit hij.symm (-((u⁻¹ : Aˣ) : A)) *
    transvectionUnit hij (u : A)

/-- The elementary image `φ(h_ij(u)) = φ(w_ij(u)) φ(w_ij(-1))` of the diagonal lift. -/
def diagLiftGL {i j : Fin n} (hij : i ≠ j) (u : Aˣ) : GL (Fin n) A :=
  weylGL hij u * weylGL hij (-1)

/-- A monomial invertible matrix `P_π · diag(v)`, with `P_π = permutationGL π` sending `e_k` to
`e_{π k}`. -/
def IsMonomial (g : GL (Fin n) A) : Prop :=
  ∃ π : Equiv.Perm (Fin n), ∃ v : Fin n → Aˣ, g = permutationGL π * diagGL v

/-- `φ(w_ij(u))` has `u` at `(i, j)`, `-u⁻¹` at `(j, i)`, `1` on the other diagonal entries. -/
theorem weylGL_coe {i j : Fin n} (hij : i ≠ j) (u : Aˣ) :
    (weylGL hij u : Matrix (Fin n) (Fin n) A) =
      1 - single i i 1 - single j j 1 + single i j (u : A) - single j i ((u⁻¹ : Aˣ) : A) := by
  sorry

theorem weylGL_isMonomial {i j : Fin n} (hij : i ≠ j) (u : Aˣ) :
    IsMonomial (weylGL hij u) := by
  sorry

theorem det_weylGL {i j : Fin n} (hij : i ≠ j) (u : Aˣ) :
    Matrix.GeneralLinearGroup.det (weylGL hij u) = 1 := by
  sorry

/-- `φ(h_ij(u))` is diagonal with `u` at `i` and `u⁻¹` at `j`. -/
theorem diagLiftGL_eq_diagGL {i j : Fin n} (hij : i ≠ j) (u : Aˣ) :
    diagLiftGL hij u = diagGL (Function.update (Function.update 1 i u) j u⁻¹) := by
  have h := congrArg (fun g : Matrix.SpecialLinearGroup (Fin n) A =>
      (g : Matrix (Fin n) (Fin n) A))
    (Matrix.SpecialLinearGroup.diag2nUnit_decompose hij u)
  apply Matrix.GeneralLinearGroup.ext
  intro p q
  have hpq := congrFun (congrFun h p) q
  by_cases hpi : p = i <;> by_cases hpj : p = j <;>
    simpa [diagLiftGL, weylGL, Matrix.SpecialLinearGroup.diag2nUnit_coe,
      Matrix.SpecialLinearGroup.coe_mul, Matrix.SpecialLinearGroup.transvection_coe,
      Matrix.transvection, Function.update_apply, Matrix.diagonal_apply, mul_assoc,
      hpi, hpj, hij, hij.symm] using hpq.symm

/-- Milnor's Lemma 9.1, matrix side of `Steinberg.toElementary_monomialSubgroup`: the Weyl lift
matrices generate exactly the monomial matrices of determinant one. -/
theorem mem_closure_weylGL_iff (g : GL (Fin n) A) :
    g ∈ Subgroup.closure {x | ∃ (i j : Fin n) (hij : i ≠ j) (u : Aˣ), x = weylGL hij u} ↔
      IsMonomial g ∧ Matrix.GeneralLinearGroup.det g = 1 := by
  sorry

/-- Unit test `weylGL_int_computation`: over `ℤ`, `φ_3(w_12(1))`. -/
example : ((weylGL (n := 3) (by decide : (0 : Fin 3) ≠ 1) (1 : ℤˣ) :
    Matrix (Fin 3) (Fin 3) ℤ)) = !![0, 1, 0; -1, 0, 0; 0, 0, 1] := by
  decide

/-- Unit test `weylGL_int_computation`: its square is `φ_3(h_12(-1)) = diag(-1, -1, 1)`. -/
theorem weylGL_int_square : (weylGL (n := 3) (by decide : (0 : Fin 3) ≠ 1) (1 : ℤˣ)) ^ 2 =
    diagGL ![-1, -1, 1] := by
  sorry

/-- Unit test `weylGL_int_computation`: its fourth power is `1`. -/
theorem weylGL_int_fourth : (weylGL (n := 3) (by decide : (0 : Fin 3) ≠ 1) (1 : ℤˣ)) ^ 4 = 1 := by
  sorry

/-- Unit test `weylGL_zmod_two`: over `𝔽₂`, `φ_3(w_12(1))` is the permutation matrix of `(1 2)`. -/
example : weylGL (n := 3) (by decide : (0 : Fin 3) ≠ 1) (1 : (ZMod 2)ˣ) =
    permutationGL (Equiv.swap 0 1) := by
  apply Units.ext
  decide

/-- Unit test `diagLiftGL_zmod_five_not_signed`: over `𝔽₅`, `φ_3(h_12(2)) = diag(2, 3, 1)` is not a
signed permutation matrix. -/
theorem diagLiftGL_zmod_five_not_signed (h2 : IsUnit (2 : ZMod 5)) :
    ¬ ∃ π : Equiv.Perm (Fin 3), ∃ ε : Fin 3 → (ZMod 5)ˣ, (∀ k, ε k = 1 ∨ ε k = -1) ∧
      diagLiftGL (n := 3) (by decide : (0 : Fin 3) ≠ 1) h2.unit = permutationGL π * diagGL ε := by
  sorry

/-- Unit test `monomialImage_card_zmod_three`: over `𝔽₃` there are `3! · 2² = 24` monomial
matrices of determinant one. -/
theorem monomialImage_card_zmod_three : {g : GL (Fin 3) (ZMod 3) | IsMonomial g ∧
    Matrix.GeneralLinearGroup.det g = 1}.ncard = 24 := by
  sorry

/-! ## `T.2:symbols/monomial-kernel/weyl-conjugation`: Milnor 9.2–9.5, matrix side

README targets on the Steinberg side: the conjugation formulas (a)–(b) in `St_n(A)`, the
normality of `H_n(A)` in `W_n(A)` and the centrality of `C_n(A)` (Corollary 9.3). -/

/-- Corollary 9.4, matrix side: `P_π D e_ij(c) D⁻¹ P_π⁻¹ = e_{π i, π j}(v_i c v_j⁻¹)`. -/
theorem permutationGL_mul_diagGL_conj_transvectionUnit (π : Equiv.Perm (Fin n))
    (v : Fin n → Aˣ) {i j : Fin n} (hij : i ≠ j) (c : A) :
    (permutationGL π * diagGL v) * transvectionUnit hij c * (permutationGL π * diagGL v)⁻¹ =
      transvectionUnit (π.injective.ne hij) ((v i : A) * c * ((v j)⁻¹ : Aˣ)) := by
  sorry

/-- `w_ij(u) w_ij(-u) = 1`, matrix side. -/
theorem weylGL_mul_neg {i j : Fin n} (hij : i ≠ j) (u : Aˣ) :
    weylGL hij u * weylGL hij (-u) = 1 := by
  sorry

/-- Lemma 9.5, matrix side: `w_ij(u) = w_ji(-u⁻¹)`. -/
theorem weylGL_symm {i j : Fin n} (hij : i ≠ j) (u : Aˣ) :
    weylGL hij u = weylGL hij.symm (-u⁻¹) := by
  sorry

/-- Acceptance check over `ℤ`: conjugating `e_12(λ)` by `φ(w_12(1))` gives `e_21(-λ)`. -/
theorem weylGL_int_conj (c : ℤ) :
    weylGL (n := 3) (by decide : (0 : Fin 3) ≠ 1) 1 *
        transvectionUnit (by decide : (0 : Fin 3) ≠ 1) c *
        (weylGL (n := 3) (by decide : (0 : Fin 3) ≠ 1) 1)⁻¹ =
      transvectionUnit (by decide : (1 : Fin 3) ≠ 0) (-c) := by
  change transvectionWeylElement (by decide : (0 : Fin 3) ≠ 1) *
      transvectionUnit (by decide : (0 : Fin 3) ≠ 1) c *
      (transvectionWeylElement (by decide : (0 : Fin 3) ≠ 1))⁻¹ = _
  rw [transvectionWeylElement_inv]
  exact transvectionWeylElement_mul_transvectionUnit_mul_inv_self _ c

/-! ## `T.2:symbols/monomial-kernel/finite-rank-symbol`: matrix side

README targets on the Steinberg side: `Steinberg.finiteRankSymbol` and its API (the formula of
Lemma 9.6, membership in `C_n(A)`, bimultiplicativity, skew-symmetry, the Steinberg relation,
stabilisation to `T.2`'s `steinbergSymbol`, and `{-1, -1}_n = w_12(1)⁴` over `ℤ`), and the unit
tests `finiteRankSymbol_neg_one_int`, `finiteRankSymbol_one`, `same_pair_commutator` and
`finiteRankSymbol_stable_real`. -/

/-- Unit test `toElementary_finiteRankSymbol`: `φ_n({u, v}_n) = 1`, since the images of `h_ij(u)`
and `h_ik(v)` commute. -/
theorem commutatorElement_diagLiftGL {i j k : Fin n} (hij : i ≠ j) (hik : i ≠ k) (u v : Aˣ) :
    ⁅diagLiftGL hij u, diagLiftGL hik v⁆ = 1 := by
  sorry

/-! ## `T.2:symbols/monomial-kernel/generated-by-symbols`: the diagonal step of Theorem 9.11

README target on the Steinberg side: `C_n(A)` is the subgroup generated by the `{u, v}_n`. The
proof ends with a product `h_12(u_2) ⋯ h_1n(u_n)` whose image is the identity; its rank-three case
is stated here. -/

theorem diagLiftGL_mul_diagLiftGL_eq_one_iff (u v : Aˣ) :
    diagLiftGL (n := 3) (by decide : (0 : Fin 3) ≠ 1) u *
        diagLiftGL (n := 3) (by decide : (0 : Fin 3) ≠ 2) v = 1 ↔ u = 1 ∧ v = 1 := by
  sorry

/-! ## `T.2:symbols/monomial-kernel/upper-unipotent-normal-form`: Lemma 9.14, matrix side

README target on the Steinberg side: every element of `T_n(A)` is an ordered product of upper root
generators with unique parameters, and `φ_n` maps `T_n(A)` isomorphically onto `U_n(A)`. -/

/-- Acceptance check: `e_12(a) e_13(b) e_23(c)` has rows `(1, a, b + ac)`, `(0, 1, c)`, `(0, 0, 1)`. -/
theorem orderedTransvection_three_coe (a b c : A) :
    (transvection (0 : Fin 3) 1 a * transvection 0 2 b * transvection 1 2 c :
      Matrix (Fin 3) (Fin 3) A) = !![1, a, b + a * c; 0, 1, c; 0, 0, 1] := by
  sorry

/-- The rank-three normal form: the ordered product determines its three parameters. -/
theorem orderedTransvection_three_injective :
    Function.Injective fun p : A × A × A =>
      (transvectionUnit (by decide : (0 : Fin 3) ≠ 1) p.1 *
        transvectionUnit (by decide : (0 : Fin 3) ≠ 2) p.2.1 *
        transvectionUnit (by decide : (1 : Fin 3) ≠ 2) p.2.2 : GL (Fin 3) A) := by
  sorry

/-- The rank-three normal form: the ordered products are exactly the upper unitriangular group. -/
theorem mem_upperUnitriangularGroup_three_iff (g : GL (Fin 3) A) :
    g ∈ upperUnitriangularGroup (Fin 3) A ↔
      ∃ a b c : A, g = transvectionUnit (by decide : (0 : Fin 3) ≠ 1) a *
        transvectionUnit (by decide : (0 : Fin 3) ≠ 2) b *
        transvectionUnit (by decide : (1 : Fin 3) ≠ 2) c := by
  sorry

/-! ## `T.2:symbols/monomial-kernel/field-bruhat-cover` and `field-kernel-is-monomial`

README targets on the Steinberg side: `St_n(F) = T·W·T` for a field (Lemma 9.15), and
`ker(St_n(F) → E_n(F)) = C_n(F)` with the stable consequence that symbols generate `K₂(F)`
(Theorem 9.12, Corollary 9.13). The matrix step of Theorem 9.12 is stated here. -/

/-- An upper unitriangular monomial matrix is the identity. -/
theorem IsMonomial.mem_upperUnitriangularGroup_iff [Nontrivial A] {g : GL (Fin n) A}
    (hg : IsMonomial g) : g ∈ upperUnitriangularGroup (Fin n) A ↔ g = 1 := by
  sorry

end TauCeti.SteinbergMonomial

/-! ## `T.5`: the real sign pairing

README targets: `realSignSymbol : K₂(ℝ) →* ℤˣ`, its descent through Matsumoto's theorem,
`signSymbolAt` on `K₂(F)` for a real embedding, and every other T.5 statement about K₂. The pairing
`realSignPairing`, from which `realSignSymbol` descends (routed row R2.9 of the packet), is stated
here with the unit tests of `T.5/real-sign-symbol` that it supports. -/

namespace TauCeti.TameKernel

/-- The real sign pairing: `-1` exactly when both entries are negative. -/
noncomputable def realSignPairing (x y : ℝˣ) : ℤˣ :=
  if (x : ℝ) < 0 ∧ (y : ℝ) < 0 then -1 else 1

/-- The sign pairing at a real embedding `σ : F →+* ℝ`. -/
noncomputable def signPairingAt {F : Type*} [Field F] (σ : F →+* ℝ) (a b : Fˣ) : ℤˣ :=
  realSignPairing (Units.map σ.toMonoidHom a) (Units.map σ.toMonoidHom b)

theorem realSignPairing_mul_left (x x' y : ℝˣ) :
    realSignPairing (x * x') y = realSignPairing x y * realSignPairing x' y := by
  sorry

theorem realSignPairing_mul_right (x y y' : ℝˣ) :
    realSignPairing x (y * y') = realSignPairing x y * realSignPairing x y' := by
  sorry

/-- The Steinberg identity: a real number and one minus it are never both negative. -/
theorem realSignPairing_steinberg (x y : ℝˣ) (h : (x : ℝ) + y = 1) :
    realSignPairing x y = 1 := by
  sorry

theorem realSignPairing_neg_one_neg_one : realSignPairing (-1) (-1) = -1 := by
  sorry

/-- Unit test `realSignSymbol_hilbert`: the pairing is the Hilbert symbol of `ℝ`. -/
theorem realSignPairing_eq_one_iff (x y : ℝˣ) :
    realSignPairing x y = 1 ↔ ∃ a b : ℝ, (x : ℝ) * a ^ 2 + (y : ℝ) * b ^ 2 = 1 := by
  sorry

/-- Unit test `realSignSymbol_values`: `(-2, -3)_∞ = -1` and `(-2, 3)_∞ = 1`. -/
example : realSignPairing (Units.mk0 (-2) (by norm_num)) (Units.mk0 (-3) (by norm_num)) = -1 ∧
    realSignPairing (Units.mk0 (-2) (by norm_num)) (Units.mk0 3 (by norm_num)) = 1 := by
  norm_num [realSignPairing]

/-- Unit test `realSignSymbol_one`: `(x, 1)_∞ = (1, y)_∞ = 1`. -/
example (x y : ℝˣ) : realSignPairing x 1 = 1 ∧ realSignPairing 1 y = 1 := by
  simp [realSignPairing]

/-- Unit test `orSign_not_steinberg`: the pairing that is `-1` when at least one entry is negative
fails the Steinberg identity at `(2, -1)`. -/
theorem orSign_not_steinberg : ¬ ∀ x y : ℝˣ, (x : ℝ) + y = 1 →
    (if (x : ℝ) < 0 ∨ (y : ℝ) < 0 then (-1 : ℤˣ) else 1) = 1 := by
  sorry

/-- Unit test `signSymbolAt_rat`: at the real embedding of `ℚ`, `(-1, -1)` gives `-1` and two
positive numbers give `1`. -/
example (p q : ℚˣ) (hp : (0 : ℚ) < p) (hq : (0 : ℚ) < q) :
    signPairingAt (Rat.castHom ℝ) (-1) (-1) = -1 ∧ signPairingAt (Rat.castHom ℝ) p q = 1 := by
  have hp' : (0 : ℝ) < (p : ℚ) := by exact_mod_cast hp
  have hq' : (0 : ℝ) < (q : ℚ) := by exact_mod_cast hq
  simp [signPairingAt, realSignPairing, not_lt_of_gt hp', not_lt_of_gt hq']

end TauCeti.TameKernel
