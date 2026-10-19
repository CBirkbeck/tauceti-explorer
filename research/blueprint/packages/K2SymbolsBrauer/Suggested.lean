import Mathlib
import TauCeti.RingTheory.Valuation.Discrete.Order
import TauCeti.FieldTheory.FunctionField.Divisor.Eval

/-!
# K2SymbolsBrauer: representative target signatures

This file is not the roadmap: `README.md` is, and it is definitive. The file records the
definitions and theorem signatures of the roadmap that can be stated against the pinned Mathlib
and Tau Ceti APIs, so that contributors and reviewers converge on names and signatures; it is not
exhaustive. Every theorem is proved by `sorry` unless a short proof is given.

Design choices made explicit here:
* a central extension is a surjective homomorphism with central kernel, and universality
  quantifies over central extensions in the universe of the source;
* the finite-rank Steinberg group is a `PresentedGroup` on generators `x_ij(r)` with the
  distinctness of the indices built into the generator, and with no relation imposed on opposite
  roots; it is meant for `n ≥ 3`, and every theorem about it carries that hypothesis;
* commutators are `⁅a, b⁆ = a * b * a⁻¹ * b⁻¹`;
* Milnor K-theory has integral coefficients: it is a quotient of the tensor algebra of `Additive Fˣ`
  over `ℤ` by the two-sided ideal of the Steinberg products, and `{a, a}` is not killed;
* the tame symbol is normalised by `∂{u, π} = ū` for a unit `u` and a uniformiser `π`, the
  inverse of the symbol of Weibel's Lemma III.6.3; its unit part is recorded before the residue.
-/

namespace TauCetiRoadmap.K2SymbolsBrauer

open scoped TensorProduct commutatorElement WithZero

universe u

/-! ## Layer 1: central extensions, Hopf's formula and the recognition theorem -/

section CentralExtensions

/-- A central extension of `G`: a surjective homomorphism whose kernel lies in the centre of its
source. -/
def IsCentralExtension {X G : Type*} [Group X] [Group G] (p : X →* G) : Prop :=
  Function.Surjective p ∧ p.ker ≤ Subgroup.center X

/-- A universal central extension of `G`: a central extension with a unique homomorphism over
`G` to every central extension of `G` whose source lies in the universe of `X`. -/
def IsUniversalCentralExtension {X G : Type u} [Group X] [Group G] (p : X →* G) : Prop :=
  IsCentralExtension p ∧
    ∀ (Y : Type u) [Group Y] (q : Y →* G), IsCentralExtension q → ∃! h : X →* Y, q.comp h = p

/-- A group is superperfect when its first and second integral homology groups, with trivial
coefficients, vanish. -/
def IsSuperperfect (X : Type) [Group X] : Prop :=
  Subsingleton (groupHomology (Rep.trivial ℤ X ℤ) 1) ∧
    Subsingleton (groupHomology (Rep.trivial ℤ X ℤ) 2)

/-- The identity of any group is a central extension. -/
example (G : Type*) [Group G] : IsCentralExtension (MonoidHom.id G) :=
  ⟨fun x => ⟨x, rfl⟩, fun x hx => by
    rw [MonoidHom.mem_ker, MonoidHom.id_apply] at hx
    rw [hx]
    exact Subgroup.one_mem _⟩

/-- The source of a universal central extension is perfect (Weibel, Lemma III.5.3.2). -/
theorem IsUniversalCentralExtension.isPerfect {X G : Type u} [Group X] [Group G] {p : X →* G}
    (hp : IsUniversalCentralExtension p) : Group.IsPerfect X := by
  sorry

/-- A superperfect group is perfect. -/
theorem IsSuperperfect.isPerfect {X : Type} [Group X] (hX : IsSuperperfect X) :
    Group.IsPerfect X := by
  sorry

/-- Every perfect group has a universal central extension (Weibel, Theorem III.5.4). -/
theorem exists_isUniversalCentralExtension (G : Type) [Group G] [Group.IsPerfect G] :
    ∃ (X : Type) (_ : Group X) (p : X →* G), IsUniversalCentralExtension p := by
  sorry

/-- **The recognition theorem** (Weibel, Theorem III.5.4): for a central extension `p` of a
perfect group, universality is equivalent to the source being perfect with every central extension
split, and to the source being superperfect. -/
theorem recognition_theorem {X G : Type} [Group X] [Group G] [Group.IsPerfect G] {p : X →* G}
    (hp : IsCentralExtension p) :
    (IsUniversalCentralExtension p ↔
      (Group.IsPerfect X ∧ ∀ (Y : Type) [Group Y] (q : Y →* X), IsCentralExtension q →
        ∃ s : X →* Y, q.comp s = MonoidHom.id X)) ∧
    (IsUniversalCentralExtension p ↔ IsSuperperfect X) := by
  sorry

/-- The kernel of a universal central extension of a perfect group is its second integral
homology (Weibel, Theorem III.5.4 with Hopf's formula). -/
theorem IsUniversalCentralExtension.nonempty_kerEquiv {X G : Type} [Group X] [Group G]
    [Group.IsPerfect G] {p : X →* G} (hp : IsUniversalCentralExtension p) :
    Nonempty (Additive p.ker ≃+ groupHomology (Rep.trivial ℤ G ℤ) 2) := by
  sorry

end CentralExtensions

/-! ## Layer 2: Steinberg groups and classical K₂ -/

section Steinberg

/-- The generators `x_ij(r)` of the Steinberg group, with `i ≠ j` part of the generator. -/
structure StGen (n : ℕ) (R : Type u) where
  /-- The row index. -/
  i : Fin n
  /-- The column index. -/
  j : Fin n
  /-- The two indices are distinct. -/
  ne : i ≠ j
  /-- The parameter. -/
  r : R

variable (n : ℕ) (R : Type u) [Ring R]

/-- The Steinberg relations (Weibel, III.5.1): additivity in the parameter, the non-chaining
commutator relation, and the two chaining relations `[x_ij(r), x_jl(s)] = x_il(rs)` and
`[x_ij(r), x_ki(s)] = x_kj(-sr)`. Nothing is imposed on the opposite pair `(i, j), (j, i)`. -/
def steinbergRels : Set (FreeGroup (StGen n R)) :=
  {w | (∃ (i j : Fin n) (h : i ≠ j) (r s : R),
          w = FreeGroup.of (StGen.mk i j h r) * FreeGroup.of (StGen.mk i j h s) *
            (FreeGroup.of (StGen.mk i j h (r + s)))⁻¹) ∨
       (∃ (i j k l : Fin n) (h₁ : i ≠ j) (h₂ : k ≠ l) (r s : R), j ≠ k ∧ i ≠ l ∧
          w = ⁅FreeGroup.of (StGen.mk i j h₁ r), FreeGroup.of (StGen.mk k l h₂ s)⁆) ∨
       (∃ (i j l : Fin n) (h₁ : i ≠ j) (h₂ : j ≠ l) (h₃ : i ≠ l) (r s : R),
          w = ⁅FreeGroup.of (StGen.mk i j h₁ r), FreeGroup.of (StGen.mk j l h₂ s)⁆ *
            (FreeGroup.of (StGen.mk i l h₃ (r * s)))⁻¹) ∨
       (∃ (i j k : Fin n) (h₁ : i ≠ j) (h₂ : k ≠ i) (h₃ : k ≠ j) (r s : R),
          w = ⁅FreeGroup.of (StGen.mk i j h₁ r), FreeGroup.of (StGen.mk k i h₂ s)⁆ *
            (FreeGroup.of (StGen.mk k j h₃ (-(s * r))))⁻¹)}

/-- The Steinberg group `St_n(R)` of an associative unital ring, for `n ≥ 3` (Layer 2). -/
abbrev Steinberg : Type u := PresentedGroup (steinbergRels n R)

variable {n R}

/-- The generator `x_ij(r)`. -/
def Steinberg.x (i j : Fin n) (h : i ≠ j) (r : R) : Steinberg n R :=
  PresentedGroup.of ⟨i, j, h, r⟩

/-- Additivity of the generators: `x_ij(r) x_ij(s) = x_ij(r + s)`. -/
theorem Steinberg.x_add (i j : Fin n) (h : i ≠ j) (r s : R) :
    Steinberg.x i j h r * Steinberg.x i j h s = Steinberg.x i j h (r + s) := by
  show PresentedGroup.mk _ (FreeGroup.of _) * PresentedGroup.mk _ (FreeGroup.of _) =
    PresentedGroup.mk _ (FreeGroup.of _)
  rw [← map_mul]
  exact PresentedGroup.mk_eq_mk_of_mul_inv_mem (show _ ∈ steinbergRels n R from
    Or.inl ⟨i, j, h, r, s, rfl⟩)

/-- `x_ij(0)` is the identity. -/
example (i j : Fin n) (h : i ≠ j) : Steinberg.x i j h (0 : R) = 1 := by
  have := Steinberg.x_add i j h (0 : R) 0
  rw [add_zero] at this
  simpa using this

/-- The forward chaining relation `[x_ij(r), x_jl(s)] = x_il(rs)`. -/
theorem Steinberg.commutator_chain (i j l : Fin n) (h₁ : i ≠ j) (h₂ : j ≠ l) (h₃ : i ≠ l)
    (r s : R) :
    ⁅Steinberg.x i j h₁ r, Steinberg.x j l h₂ s⁆ = Steinberg.x i l h₃ (r * s) := by
  sorry

/-- The reverse chaining relation `[x_ij(r), x_ki(s)] = x_kj(-sr)`; the order `sr` matters over a
noncommutative ring. -/
theorem Steinberg.commutator_reverse (i j k : Fin n) (h₁ : i ≠ j) (h₂ : k ≠ i) (h₃ : k ≠ j)
    (r s : R) :
    ⁅Steinberg.x i j h₁ r, Steinberg.x k i h₂ s⁆ = Steinberg.x k j h₃ (-(s * r)) := by
  sorry

/-- The generator assignment `x_ij(r) ↦ 1 + r E_ij` defines a homomorphism onto the elementary
subgroup of `GL_n(R)` (Weibel, III.5.1.1); over a noncommutative ring the matrix identities are
proved from matrix units. -/
theorem Steinberg.exists_toGL :
    ∃ φ : Steinberg n R →* Matrix.GeneralLinearGroup (Fin n) R,
      ∀ (i j : Fin n) (h : i ≠ j) (r : R),
        (φ (Steinberg.x i j h r) : Matrix (Fin n) (Fin n) R) = 1 + Matrix.single i j r := by
  sorry

/-- For `n ≥ 3` the Steinberg group is perfect: `x_ij(r) = [x_ik(r), x_kj(1)]` for a third
index `k`. -/
theorem Steinberg.isPerfect (hn : 3 ≤ n) : Group.IsPerfect (Steinberg n R) := by
  sorry

/-- **Finite-rank splitting** (Weibel, III.5.5.1): for `n ≥ 5` every central extension of
`St_n(R)` splits. Centrality of `St_n(R) → E_n(R)` is not a consequence. -/
theorem Steinberg.centralExtension_splits (hn : 5 ≤ n) (Y : Type u) [Group Y]
    (q : Y →* Steinberg n R) (hq : IsCentralExtension q) :
    ∃ s : Steinberg n R →* Y, q.comp s = MonoidHom.id _ := by
  sorry

end Steinberg

/-! ## Layer 6: Steinberg symbols and the monomial kernel -/

section Symbols

variable {n : ℕ} {R : Type u} [Ring R]

/-- The Weyl word `w_ij(u) = x_ij(u) x_ji(-u⁻¹) x_ij(u)`, whose elementary image has the block
`[[0, u], [-u⁻¹, 0]]` at the coordinates `i, j`. -/
def Steinberg.w (i j : Fin n) (h : i ≠ j) (u : Rˣ) : Steinberg n R :=
  Steinberg.x i j h (u : R) * Steinberg.x j i h.symm (-((u⁻¹ : Rˣ) : R)) * Steinberg.x i j h (u : R)

/-- The diagonal word `h_ij(u) = w_ij(u) w_ij(-1)`, whose elementary image is `diag(u, u⁻¹)` at the
coordinates `i, j`. -/
def Steinberg.hDiag (i j : Fin n) (h : i ≠ j) (u : Rˣ) : Steinberg n R :=
  Steinberg.w i j h u * Steinberg.w i j h (-1)

/-- The finite-rank Steinberg symbol `{u, v}_n = [h_ij(u), h_ik(v)]` for pairwise distinct
`i, j, k` (Milnor, §9). -/
def Steinberg.finiteRankSymbol (i j k : Fin n) (hij : i ≠ j) (hik : i ≠ k) (u v : Rˣ) : Steinberg n R :=
  ⁅Steinberg.hDiag i j hij u, Steinberg.hDiag i k hik v⁆

/-- For commutative `A` and `n ≥ 3` the finite-rank symbol is central, independent of the
triple and bimultiplicative (Milnor, Lemmas 9.6–9.7). -/
theorem Steinberg.finiteRankSymbol_mul_left {A : Type u} [CommRing A] (hn : 3 ≤ n) (i j k : Fin n)
    (hij : i ≠ j) (hik : i ≠ k) (hjk : j ≠ k) (u u' v : Aˣ) :
    Steinberg.finiteRankSymbol i j k hij hik (u * u') v =
      Steinberg.finiteRankSymbol i j k hij hik u v * Steinberg.finiteRankSymbol i j k hij hik u' v := by
  sorry

/-- The Steinberg relation `{u, 1 - u}_n = 1` when `u` and `1 - u` are units (Milnor, Lemma 9.8). -/
theorem Steinberg.finiteRankSymbol_one_sub {A : Type u} [CommRing A] (hn : 3 ≤ n) (i j k : Fin n)
    (hij : i ≠ j) (hik : i ≠ k) (hjk : j ≠ k) (u v : Aˣ) (huv : (u : A) + v = 1) :
    Steinberg.finiteRankSymbol i j k hij hik u v = 1 := by
  sorry

end Symbols

/-! ## Layer 5: Steinberg pairings and Milnor K-theory -/

section Milnor

variable (F : Type u) [Field F]

/-- A Steinberg pairing: bimultiplicative into an additive group and zero on complementary
units. -/
structure IsSteinbergPairing {A : Type*} [AddCommGroup A] (c : Fˣ → Fˣ → A) : Prop where
  mul_left : ∀ a b d : Fˣ, c (a * b) d = c a d + c b d
  mul_right : ∀ a b d : Fˣ, c a (b * d) = c a b + c a d
  steinberg : ∀ a b : Fˣ, (a : F) + b = 1 → c a b = 0

/-- The constant pairing `1` is not a Steinberg pairing: bilinearity at `(1, 1, 1)` would give
`1 = 2`. -/
example : ¬ IsSteinbergPairing F (fun _ _ => (1 : ℤ)) := by
  intro h
  have := h.mul_left 1 1 1
  norm_num at this

/-- The span of the tensors `a ⊗ b` with `a + b = 1`. -/
def steinbergRelations : Submodule ℤ (Additive Fˣ ⊗[ℤ] Additive Fˣ) :=
  Submodule.span ℤ {x | ∃ a b : Fˣ, (a : F) + b = 1 ∧ x = Additive.ofMul a ⊗ₜ Additive.ofMul b}

/-- The degree-two symbol group `(Fˣ ⊗ Fˣ) / ⟨a ⊗ b : a + b = 1⟩`, the universal target of
Steinberg pairings; it is `K₂ᴹ(F)`. -/
abbrev SymbolGroup : Type u := (Additive Fˣ ⊗[ℤ] Additive Fˣ) ⧸ steinbergRelations F

variable {F}

/-- The class `{a, b}` of `a ⊗ b`. -/
def symbol (a b : Fˣ) : SymbolGroup F :=
  Submodule.Quotient.mk (Additive.ofMul a ⊗ₜ Additive.ofMul b)

/-- The Steinberg relation in the symbol group. -/
example (a b : Fˣ) (h : (a : F) + b = 1) : symbol a b = 0 :=
  (Submodule.Quotient.mk_eq_zero _).2 (Submodule.subset_span ⟨a, b, h, rfl⟩)

/-- Skew-symmetry `{a, b} = -{b, a}` and `{a, a} = {a, -1}` (Weibel, III.6.1; Matsumoto,
Proposition 5.7). -/
theorem symbol_swap (a b : Fˣ) : symbol a b = -symbol b a := by
  sorry

theorem symbol_self (a : Fˣ) : symbol a a = symbol a (-1) := by
  sorry

/-- `{-1, -1}` is nonzero over `ℝ`: the sign pairing detects it, so the symbol group is not an
exterior square. -/
theorem symbol_neg_one_neg_one_real : symbol (-1 : ℝˣ) (-1) ≠ 0 := by
  sorry

/-- The degree-two symbol group of a finite field vanishes (Weibel, III.6.1.1). -/
theorem subsingleton_symbolGroup_of_finite [Finite F] : Subsingleton (SymbolGroup F) := by
  sorry

/-- Every Steinberg pairing factors uniquely through the symbol group. -/
theorem existsUnique_lift_of_isSteinbergPairing {A : Type*} [AddCommGroup A] {c : Fˣ → Fˣ → A}
    (hc : IsSteinbergPairing F c) :
    ∃! f : SymbolGroup F →+ A, ∀ a b, f (symbol a b) = c a b := by
  sorry

variable (F)

/-- The relation generating the Steinberg ideal of the tensor algebra. -/
def milnorRel : TensorAlgebra ℤ (Additive Fˣ) → TensorAlgebra ℤ (Additive Fˣ) → Prop :=
  fun x y => ∃ a b : Fˣ, (a : F) + b = 1 ∧
    x = TensorAlgebra.ι ℤ (Additive.ofMul a) * TensorAlgebra.ι ℤ (Additive.ofMul b) ∧ y = 0

/-- Milnor K-theory `K_*ᴹ(F)`, the quotient of the tensor algebra of `Additive Fˣ` over `ℤ` by
the two-sided ideal generated by the Steinberg products (Weibel, III.7.1). -/
abbrev MilnorK : Type u := RingQuot (milnorRel F)

variable {F}

/-- The degree-one class of a unit. -/
def MilnorK.ofUnit (a : Fˣ) : MilnorK F :=
  RingQuot.mkRingHom (milnorRel F) (TensorAlgebra.ι ℤ (Additive.ofMul a))

/-- The Milnor symbol `{a₁, …, aₙ}`, the ordered product of degree-one classes. -/
def MilnorK.symbol (l : List Fˣ) : MilnorK F :=
  (l.map MilnorK.ofUnit).prod

/-- Consecutive complementary entries kill a Milnor symbol. -/
example (a b : Fˣ) (h : (a : F) + b = 1) : MilnorK.symbol [a, b] = 0 := by
  simp only [MilnorK.symbol, List.map_cons, List.map_nil, List.prod_cons, List.prod_nil,
    mul_one, MilnorK.ofUnit]
  rw [← map_mul, RingQuot.mkRingHom_rel (r := milnorRel F) ⟨a, b, h, rfl, rfl⟩, map_zero]

/-- A permutation of the entries multiplies a Milnor symbol by its sign. -/
theorem MilnorK.symbol_perm (l : List Fˣ) (σ : Equiv.Perm (Fin l.length)) :
    MilnorK.symbol (List.ofFn fun i => l.get (σ i)) =
      ((Equiv.Perm.sign σ : ℤˣ) : ℤ) • MilnorK.symbol l := by
  sorry

/-- For a finite field the Milnor symbols with at least two entries vanish (Weibel,
III.7.2(a)). -/
theorem MilnorK.symbol_eq_zero_of_finite [Finite F] (l : List Fˣ) (hl : 2 ≤ l.length) :
    MilnorK.symbol l = 0 := by
  sorry

end Milnor

/-! ## Layer 9: tame symbols and Milnor residues -/

section Tame

variable {F : Type*} [Field F]

open Valuation in
/-- The unit part of the tame symbol, `(-1)^{v(f)v(g)} f^{v(g)} g^{-v(f)}`, whose residue is
`∂_v{f, g}`; it is a unit of the valuation ring. -/
noncomputable def tameUnit (v : Valuation F ℤᵐ⁰) (f g : Fˣ) : Fˣ :=
  (-1) ^ (ord v (f : F) * ord v (g : F)) * f ^ ord v (g : F) * g ^ (-ord v (f : F))

open Valuation in
/-- The normalisation `∂{u, π} = ū`. -/
example (v : Valuation F ℤᵐ⁰) (u π : Fˣ) (hu : ord v (u : F) = 0) (hπ : ord v (π : F) = 1) :
    tameUnit v u π = u := by
  simp [tameUnit, hu, hπ]

open Valuation in
/-- The reversed order gives the inverse, `∂{π, u} = ū⁻¹`. -/
example (v : Valuation F ℤᵐ⁰) (u π : Fˣ) (hu : ord v (u : F) = 0) (hπ : ord v (π : F) = 1) :
    tameUnit v π u = u⁻¹ := by
  simp [tameUnit, hu, hπ]

/-- The tame unit lies in the unit group of the valuation ring. -/
theorem tameUnit_mem_unitGroup (v : Valuation F ℤᵐ⁰) (hv : Function.Surjective v) (f g : Fˣ) :
    tameUnit v f g ∈ v.valuationSubring.unitGroup := by
  sorry

/-- Bimultiplicativity of the tame unit. -/
theorem tameUnit_mul_left (v : Valuation F ℤᵐ⁰) (f f' g : Fˣ) :
    tameUnit v (f * f') g = tameUnit v f g * tameUnit v f' g := by
  sorry

/-- **The Steinberg relation for the tame symbol** (Weibel, Lemma III.6.3): if `f + g = 1` the
tame unit is a principal unit, so its residue is `1`. -/
theorem tameUnit_steinberg (v : Valuation F ℤᵐ⁰) (hv : Function.Surjective v) (f g : Fˣ)
    (h : (f : F) + g = 1) : v ((tameUnit v f g : F) - 1) < 1 := by
  sorry

end Tame

/-! ## Layer 10: rational function fields, Milnor norms and reciprocity -/

section Reciprocity

variable {k F : Type*} [Field k] [Field F] [Algebra k F]

/-- **Weil reciprocity for disjoint supports**, the degree-two disjoint case of Suslin's
reciprocity law for any function field of one variable: `f(div g) = g(div f)`. -/
theorem weil_reciprocity_of_disjoint (hF : TauCeti.IsFunctionField k F) (f g : Fˣ)
    (h : Disjoint (TauCeti.Divisor.principal hF f).support
      (TauCeti.Divisor.principal hF g).support) :
    TauCeti.Divisor.eval (TauCeti.Divisor.principal hF g) f =
      TauCeti.Divisor.eval (TauCeti.Divisor.principal hF f) g := by
  sorry

end Reciprocity

/-! ## Layer 13: Dennis–Stein symbols and relative K₂ -/

section DennisStein

variable {n : ℕ} {R : Type u} [Ring R]

/-- The Dennis–Stein word `⟨r, s⟩ = x_ji(-s u⁻¹) x_ij(-r) x_ji(s) x_ij(u⁻¹ r) h_ij(u)⁻¹` for
commuting `r, s` with `u = 1 - rs` a unit. -/
def Steinberg.dennisStein (i j : Fin n) (h : i ≠ j) (r s : R) (u : Rˣ) (_hu : (u : R) = 1 - r * s) :
    Steinberg n R :=
  Steinberg.x j i h.symm (-(s * ((u⁻¹ : Rˣ) : R))) * Steinberg.x i j h (-r) *
    Steinberg.x j i h.symm s * Steinberg.x i j h (((u⁻¹ : Rˣ) : R) * r) *
    (Steinberg.hDiag i j h u)⁻¹

end DennisStein

/-
The following targets of README.md have carriers that are not in Mathlib or Tau Ceti at the pins,
and are stated there rather than here: the stable Steinberg group `St(R)` as a group colimit and
classical `K₂(R) = ker(St(R) → E(R))`; Steinberg's centre theorem and the universal central
extension `St(R) → E(R)`; the comparisons `K₂(R) ≅ H₂(E(R); ℤ) ≅ π₂(BGL(R)⁺)` and with Quillen's
`K₂`; the grading of Milnor K-theory and its functoriality; Matsumoto's theorem and the permutation
construction behind it; the graded map to Quillen K-theory; the tame symbol with values in the
residue field, higher residues, Serre's residue algebra and specialisation maps; Milnor norms,
Kato's theorem, the Bass–Tate sequence and Suslin's reciprocity law in every degree; the
localization comparisons; tame kernels, `K₂(ℤ) ≅ ℤ/2` and `K₂(ℚ)`; relative Steinberg groups and
the Dennis–Stein presentations; and the comparisons with Hilbert symbols, cyclic algebras, local
invariants, Tate's theorems and the étale Chern class.
-/

end TauCetiRoadmap.K2SymbolsBrauer
