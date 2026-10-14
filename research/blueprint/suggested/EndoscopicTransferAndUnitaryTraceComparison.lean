import Mathlib.Algebra.BigOperators.Fin
import Mathlib.Algebra.BigOperators.Group.Finset.Basic
import Mathlib.Algebra.Group.Action.Defs
import Mathlib.Algebra.Group.Conj
import Mathlib.Algebra.Group.Even
import Mathlib.Algebra.Order.Field.Basic
import Mathlib.Basic.Complex.Basic
import Mathlib.Data.Int.Interval
import Mathlib.Data.Matrix.Basic
import Mathlib.Data.Multiset.Basic
import Mathlib.Data.ZMod.Basic
import Mathlib.FieldTheory.Separable
import Mathlib.LinearAlgebra.Matrix.Charpoly.Coeff
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.LinearAlgebra.Matrix.Notation
import Mathlib.LinearAlgebra.Matrix.Trace
import Mathlib.RingTheory.AdjoinRoot
import Mathlib.RingTheory.Finiteness.Defs
import Mathlib.RingTheory.LaurentSeries
import Mathlib.Tactic.NormNum

/-!
# Endoscopic transfer and unitary trace comparison: suggested signatures

This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/EndoscopicTransferAndUnitaryTraceComparison.md` is definitive; the
statements below suggest Lean forms so that contributors and reviewers converge on names and
signatures. No implementation is claimed.

Baseline: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti
f790474821cf4256814db967cb154e7af3d0c369. Only Mathlib modules are imported.

Only light definitions with real bodies over carriers that exist at the pinned Mathlib are
given, together with milestones statable over them and a few discriminating examples. Reductive
groups over local and global fields, their Galois cohomology, endoscopic data, transfer factors,
orbital integrals, the Hitchin fibration, the fundamental lemma, smooth representations and
their characters, the stable and twisted trace formulas, Igusa varieties and Kottwitz triples,
deformation spaces and towers with Drinfeld level structure, Weil–Deligne representations,
automorphic packets and Igusa trace objects have no carriers at the pins: they are targets of
the roadmap document, and their API items and unit tests are stated there.

The finite models here are not those objects:
* `NonabelianH1` is the cohomology of abstract cochains of a group acting on a group. Profinite
  topologies are suppressed: read `Γ` as a finite Galois quotient acting on the points over the
  corresponding finite extension. It is not continuous Galois cohomology of a profinite group.
* `IntSegment` and `IntMultisegment` model segments on one cuspidal line `ν^j ρ` by integer
  intervals; `specialMonodromy` and `specialFrobenius` are rational matrices checking the
  conventions of the special Weil–Deligne block owned by ArithmeticGaloisRepresentations R01.2.
  Neither is a representation or a Weil–Deligne parameter.
* `comparisonTrace` is a finite rational sum at a fixed spectral test package, not an
  automorphic or Igusa trace.

Cocycles `a : Γ → H` satisfy `a (σ * τ) = a σ * σ • a τ`, and `b` is cohomologous to `a` when
`b σ = c⁻¹ * a σ * σ • c`. For `GL_n` the Chevalley characteristic map is the characteristic
polynomial and the Kostant section is the companion matrix of `X^n + a_{n-1} X^{n-1} + … + a_0`.
The special block `Sp_k` has `N e_j = e_{j+1}` and `r(Frob) e_i = |Frob|^i e_i` with geometric
Frobenius `|Frob| = q⁻¹`. Acceptability uses Shin's ordering by decreasing slope.

The ET.4–ET.6 signatures come from a packet whose independent review returned `needs_changes`.
They check numerical conventions only; they do not supply the missing algebraic and Igusa
geometry, the Drinfeld-level representability, the multiplicity-one newvector input or the
segment-pair factors with monodromy that the roadmap document lists as open.

Layers appear in roadmap order: ET.0 (nonabelian cohomology, crossed modules, stable conjugacy
in `GL_n`, the Kottwitz sign), ET.1 (κ-sums over rational classes), ET.2b (the Chevalley map,
the Kostant section, regular centralizers and affine Springer fibres of `GL_n`), ET.4 (component
groups and the endoscopic coefficient), ET.5 (acceptability), ET.6 (segments, ladders and the
special Weil–Deligne block) and ET.7 (the finite coefficient ledger). Packet unit-test names are
recorded in the comment or docstring preceding their example.
-/

noncomputable section
open scoped BigOperators

namespace TauCetiRoadmap.EndoscopicTransferAndUnitaryTraceComparison

universe u v

/-! ## ET.0: nonabelian Galois cohomology with discrete coefficients -/

section NonabelianH1
variable (Γ : Type u) (H : Type v) [Group Γ] [Group H] [MulDistribMulAction Γ H]

/-- Crossed homomorphisms (1-cocycles) `Γ → H`. -/
def IsCocycle (a : Γ → H) : Prop := ∀ σ τ : Γ, a (σ * τ) = a σ * σ • a τ

/-- The set of 1-cocycles. -/
def Cocycle := {a : Γ → H // IsCocycle Γ H a}

variable {Γ H}

/-- Two cocycles are cohomologous if they differ by twisted conjugation by an element of `H`. -/
def Cohomologous (a b : Cocycle Γ H) : Prop :=
  ∃ c : H, ∀ σ : Γ, b.1 σ = c⁻¹ * a.1 σ * σ • c

variable (Γ H)

/-- Cohomology of cocycles is an equivalence relation. -/
def cohomologousSetoid : Setoid (Cocycle Γ H) where
  r := Cohomologous
  iseqv := by sorry

/-- The pointed set `H¹(Γ, H)`. -/
def NonabelianH1 := Quotient (cohomologousSetoid Γ H)

/-- The trivial cocycle. -/
def Cocycle.one : Cocycle Γ H := ⟨fun _ => 1, by sorry⟩

/-- The base point of `H¹(Γ, H)`. -/
def NonabelianH1.basePoint : NonabelianH1 Γ H := Quotient.mk _ (Cocycle.one Γ H)

/-- For an abelian group with trivial action, cocycles are homomorphisms and `H¹` is `Hom(Γ, H)`:
the comparison used for tori split by the Galois group. -/
theorem NonabelianH1.equivHomOfTrivial {A : Type v} [CommGroup A] [MulDistribMulAction Γ A]
    (htriv : ∀ (σ : Γ) (x : A), σ • x = x) :
    Nonempty (NonabelianH1 Γ A ≃ (Γ →* A)) := by sorry

/-- A trivial coefficient group has a single cohomology class. -/
example [Subsingleton H] : Subsingleton (NonabelianH1 Γ H) := by sorry

/-- Over the trivial group every cocycle is trivial. -/
example [MulDistribMulAction Unit H] : Subsingleton (NonabelianH1 Unit H) := by sorry

end NonabelianH1

/-! ## ET.0: crossed modules -/

/-- A crossed module `∂ : H̃ → H` of groups (the coefficient object of abelianized cohomology,
`[G_sc → G]`). -/
structure CrossedModule (Ht : Type u) (H : Type v) [Group Ht] [Group H]
    [MulDistribMulAction H Ht] where
  /-- The boundary map. -/
  toHom : Ht →* H
  /-- Equivariance of the boundary. -/
  map_smul : ∀ (h : H) (x : Ht), toHom (h • x) = h * toHom x * h⁻¹
  /-- The Peiffer identity. -/
  peiffer : ∀ x y : Ht, toHom x • y = x * y * x⁻¹

/-- The kernel of a crossed module is central in the source. -/
theorem CrossedModule.ker_central {Ht : Type u} {H : Type v} [Group Ht] [Group H]
    [MulDistribMulAction H Ht] (X : CrossedModule Ht H) {x : Ht} (hx : X.toHom x = 1)
    (y : Ht) : x * y = y * x := by sorry

/-! ## ET.0: stable conjugacy for `GL_n` -/

section GLn
variable {n : Type*} [Fintype n] [DecidableEq n] {K : Type*} [Field K]

-- stableConj_gln (regular semisimple case).
/-- For `GL_n` over a field, two elements with the same separable characteristic polynomial are
conjugate: stable and rational conjugacy agree for regular semisimple elements of `GL_n`. -/
theorem isConj_iff_charpoly_eq_of_separable (γ γ' : Matrix.GeneralLinearGroup n K)
    (hsep : (γ : Matrix n n K).charpoly.Separable) :
    IsConj γ γ' ↔ (γ : Matrix n n K).charpoly = (γ' : Matrix n n K).charpoly := by sorry

/-- Conjugate matrices have equal characteristic polynomials (the easy direction). -/
example (γ γ' : Matrix.GeneralLinearGroup n K) (h : IsConj γ γ') :
    (γ : Matrix n n K).charpoly = (γ' : Matrix n n K).charpoly := by sorry

/-- The equality of characteristic polynomials alone does not give conjugacy without
semisimplicity: the identity and a unipotent Jordan block in `GL_2(ℚ)`. -/
example : ¬ IsConj (1 : Matrix.GeneralLinearGroup (Fin 2) ℚ)
    (Matrix.GeneralLinearGroup.mkOfDetNeZero !![1, 1; 0, 1] (by simp [Matrix.det_fin_two_of])) := by sorry

end GLn

/-! ## ET.0: the Kottwitz sign -/

/-- The Kottwitz sign `e(G) = (-1)^(q(G*) - q(G))`, from the `F`-ranks of the derived groups of the
quasi-split inner form and of the inner form. -/
def kottwitzSign (rankQuasiSplit rankInner : ℕ) : ℤˣ :=
  (-1 : ℤˣ) ^ ((rankQuasiSplit : ℤ) - rankInner)

-- kottwitzSign_quasiSplit: `e(G*) = 1`.
@[simp] theorem kottwitzSign_self (r : ℕ) : kottwitzSign r r = 1 := by sorry

/-- `GL_m(D)` with `D` central of degree `d` and `n = m d`: the derived groups have `F`-ranks
`n - 1` and `m - 1`. -/
theorem kottwitzSign_gl (n m : ℕ) (hm : 1 ≤ m) (hmn : m ≤ n) :
    kottwitzSign (n - 1) (m - 1) = (-1 : ℤˣ) ^ ((n : ℤ) - m) := by sorry

-- kottwitzSign_quaternion.
/-- The quaternion division algebra: `e(D^×) = -1`. -/
example : kottwitzSign 1 0 = -1 := by sorry

/-! ## ET.1: κ-weighted sums over the rational classes in a stable class -/

section KappaSum
variable {D : Type*} [CommGroup D] [Fintype D]

/-- The κ-weighted sum `Σ_d κ(d) O(d)` over a finite abelian group of invariants (the rational
classes in a stable class, indexed by `inv(γ, ·)`). -/
def kappaSum (κ : D →* ℂˣ) (O : D → ℂ) : ℂ := ∑ d, (κ d : ℂ) * O d

/-- The stable sum is the κ-sum for the trivial character. -/
def stableSum (O : D → ℂ) : ℂ := kappaSum (1 : D →* ℂˣ) O

-- kappaOrbitalIntegral_change_base.
/-- Changing the base point of the stable class by `d₀` multiplies the κ-sum by `κ(d₀)⁻¹`. -/
theorem kappaSum_rebase (κ : D →* ℂˣ) (O : D → ℂ) (d₀ : D) :
    kappaSum κ (fun d => O (d₀ * d)) = ((κ d₀)⁻¹ : ℂˣ) * kappaSum κ O := by sorry

/-- The stable sum does not depend on the base point. -/
theorem stableSum_rebase (O : D → ℂ) (d₀ : D) :
    stableSum (fun d => O (d₀ * d)) = stableSum O := by sorry

-- kappaOrbitalIntegral_sl2.
/-- `SL_2` and an elliptic torus: two rational classes, and the nontrivial κ gives the difference
of the two orbital integrals. -/
example (κ : Multiplicative (ZMod 2) →* ℂˣ) (hκ : κ (Multiplicative.ofAdd 1) = -1)
    (O : Multiplicative (ZMod 2) → ℂ) :
    kappaSum κ O = O 1 - O (Multiplicative.ofAdd 1) := by sorry

-- stableOrbitalIntegral_gln.
/-- A single rational class (as for `GL_n`): κ-sum and stable sum both evaluate `O`. -/
example (O : Unit → ℂ) : stableSum O = O () := by sorry

end KappaSum

/-! ## ET.2b: the Chevalley map and the Kostant section for `GL_n` -/

section ChevalleyGL
variable {K : Type*} [Field K] {n : ℕ}

-- chevalleyQuotient_gln.
/-- The Chevalley characteristic map for `𝔤𝔩_n`: the non-leading coefficients of the
characteristic polynomial, a point of `𝔠 = 𝔸^n`. -/
def chevalleyMap (X : Matrix (Fin n) (Fin n) K) : Fin n → K := fun i => X.charpoly.coeff i

/-- The Kostant section for `𝔤𝔩_n`: the companion matrix of `X^n + Σ_i a_i X^i`, with ones on the
subdiagonal and `-a` in the last column. -/
def kostantSectionGL (a : Fin n → K) : Matrix (Fin n) (Fin n) K := fun i j =>
  (if (i : ℕ) = (j : ℕ) + 1 then 1 else 0) - (if (j : ℕ) + 1 = n then a i else 0)

-- kostantSection_gln.
/-- The characteristic polynomial of the companion matrix is `X^n + Σ_i a_i X^i`. -/
theorem charpoly_kostantSectionGL (a : Fin n → K) :
    (kostantSectionGL a).charpoly =
      Polynomial.X ^ n + ∑ i : Fin n, Polynomial.C (a i) * Polynomial.X ^ (i : ℕ) := by sorry

/-- The Kostant section is a section of the Chevalley map. -/
theorem chevalleyMap_kostantSectionGL (a : Fin n → K) : chevalleyMap (kostantSectionGL a) = a := by sorry

/-- `n = 1`: the companion matrix of `X + a₀` is `(-a₀)`. -/
example (a : Fin 1 → K) : kostantSectionGL a = fun _ _ => -a 0 := by sorry

/-- The Chevalley map is invariant under conjugation. -/
theorem chevalleyMap_conj (X : Matrix (Fin n) (Fin n) K)
    (g : Matrix.GeneralLinearGroup (Fin n) K) :
    chevalleyMap ((g : Matrix (Fin n) (Fin n) K) * X *
        ((g⁻¹ : Matrix.GeneralLinearGroup (Fin n) K) : Matrix (Fin n) (Fin n) K)) =
      chevalleyMap X := by sorry

-- kostantSection_not_semisimple.
/-- The zero matrix is not regular for `n = 2`, while `kostantSectionGL 0` is: the section passes through
regular nilpotent elements. -/
example : kostantSectionGL (0 : Fin 2 → K) ≠ 0 := by sorry

end ChevalleyGL

/-! ## ET.2b: the regular centralizer of `GL_n` -/

section RegularCentralizer
variable {K : Type*} [Field K]

-- regularCentralizer_gln.
/-- The fibre of the regular centralizer of `GL_n` at the characteristic polynomial `P`: the units
of `K[X]/(P)`. -/
abbrev RegularCentralizerGL (P : Polynomial K) := (AdjoinRoot P)ˣ

/-- For `P = X - c` the regular centralizer is `GL_1`. -/
theorem regularCentralizerGL_linear (c : K) :
    Nonempty (RegularCentralizerGL (Polynomial.X - Polynomial.C c) ≃* Kˣ) := by sorry

end RegularCentralizer

/-! ## ET.2b: affine Springer fibres for `GL_n` (lattices) -/

section AffineSpringer
variable (k : Type*) [Field k] (n : ℕ)

/-- A lattice in `k((ε))^n`: a finitely generated `k[[ε]]`-submodule spanning over `k((ε))`. -/
def IsLattice (L : Submodule (PowerSeries k) (Fin n → LaurentSeries k)) : Prop :=
  L.FG ∧ Submodule.span (LaurentSeries k) (L : Set (Fin n → LaurentSeries k)) = ⊤

variable {k n}

/-- The affine Springer fibre of `γ ∈ 𝔤𝔩_n(k((ε)))` in the affine Grassmannian of `GL_n`: the
lattices stable under `γ`. -/
def affineSpringerFibre (γ : Matrix (Fin n) (Fin n) (LaurentSeries k)) :
    Set (Submodule (PowerSeries k) (Fin n → LaurentSeries k)) :=
  {L | IsLattice k n L ∧ ∀ v ∈ L, γ.mulVec v ∈ L}

/-- For `γ = 0` every lattice is in the fibre: the fibre is the whole affine Grassmannian, which is
not of finite type (`γ = 0` is not regular semisimple). -/
theorem affineSpringerFibre_zero :
    affineSpringerFibre (0 : Matrix (Fin n) (Fin n) (LaurentSeries k)) =
      {L | IsLattice k n L} := by sorry

/-- The fibre of a scalar `c • 1` with `c` integral is again the whole affine Grassmannian. -/
example (c : PowerSeries k) :
    affineSpringerFibre ((algebraMap (PowerSeries k) (LaurentSeries k) c) •
      (1 : Matrix (Fin n) (Fin n) (LaurentSeries k))) = {L | IsLattice k n L} := by sorry

end AffineSpringer

/-! ## ET.4: component groups and the endoscopic coefficient -/

/-- The order of `π₀(Z(Ĝ_n⃗)^Γ)` for the unitary similitude group `G_n⃗` with blocks `n⃗` over a
CM field with `[F⁺ : ℚ] = d`: `2^r` if `d` is even or every block is even, `2^(r-1)`
otherwise (Shin 2011 Lemma 3.1). Its group interpretation requires a nonempty list of positive
block sizes and positive d; this light definition itself is just a numerical function. -/
def unitaryComponentCount (d : ℕ) (n : List ℕ) : ℕ :=
  if Even d ∨ ∀ i ∈ n, Even i then 2 ^ n.length else 2 ^ (n.length - 1)

-- component count: one block, [F⁺:ℚ] = 2 gives 2.
example : unitaryComponentCount 2 [1] = 2 := by
  sorry

-- [F⁺:ℚ] = 3 and an odd block: 2^(r-1).
example : unitaryComponentCount 3 [3, 2] = 2 := by
  sorry

-- endoscopicCoefficient.
/-- The endoscopic coefficient `ι(G,H) = τ(G) τ(H)⁻¹ |Out(H,s,η)|⁻¹` from its three inputs. -/
def endoscopicCoefficient (τG τH : ℚ) (outH : ℕ) : ℚ := τG / τH / outH

-- endoscopicCoefficient_self: the trivial triple has coefficient 1.
example (τ : ℚ) (h : τ ≠ 0) : endoscopicCoefficient τ τ 1 = 1 := by
  sorry

-- endoscopicCoefficient_equal_blocks: |Out| = 2 halves the coefficient.
example : endoscopicCoefficient 2 2 2 = 1 / 2 := by
  sorry

/-! ## ET.5: acceptability across slope components -/

/- Shin's root convention uses ν_i = −λ_i for decreasing slopes λ_i. The negative Frobenius
shift fr^(−sN) separates valuations in the direction encoded below. -/

/-- Eigenvalue valuations `vals i` of the components of `δ ∈ J_b(ℚ_p)` on the slope pieces,
ordered by decreasing slope, satisfy Shin's acceptability condition: a component of larger
slope has strictly smaller valuations (Shin 2009 Definition 6.1). -/
def IsAcceptableValuations {r : ℕ} (vals : Fin r → Finset ℚ) : Prop :=
  ∀ i j : Fin r, i < j → ∀ x ∈ vals i, ∀ y ∈ vals j, x < y

-- IsAcceptableElement.gl2: δ = (1, p) (valuations 0, 1) is acceptable.
example : IsAcceptableValuations (r := 2) ![{0}, {1}] := by
  sorry

-- δ = (p, 1) (valuations 1, 0) is not acceptable.
example : ¬ IsAcceptableValuations (r := 2) ![{1}, {0}] := by
  sorry

-- IsAcceptableElement.basic: with one slope every element is acceptable.
example (vals : Fin 1 → Finset ℚ) : IsAcceptableValuations vals := by
  sorry

-- IsAcceptableFunction.not_all: δ = 1 has equal valuations and is not acceptable for two slopes.
example : ¬ IsAcceptableValuations (r := 2) ![{0}, {0}] := by
  sorry

/-! ## ET.6: segments on one cuspidal line -/

/-- A segment `[a, b]` on one cuspidal line: the cuspidals `ν^a ρ, …, ν^b ρ` with `a ≤ b`. -/
structure IntSegment where
  /-- The exponent of the beginning `ν^a ρ`. -/
  a : ℤ
  /-- The exponent of the end `ν^b ρ`. -/
  b : ℤ
  le : a ≤ b

namespace IntSegment

/-- The exponents occurring in the segment. -/
def toFinset (Δ : IntSegment) : Finset ℤ := Finset.Icc Δ.a Δ.b

/-- The number of cuspidals in the segment. -/
def length (Δ : IntSegment) : ℕ := (Δ.b - Δ.a + 1).toNat

/-- `Δ₁` and `Δ₂` are linked: their union is a segment and neither contains the other. -/
def Linked (Δ₁ Δ₂ : IntSegment) : Prop :=
  ¬ Δ₁.toFinset ⊆ Δ₂.toFinset ∧ ¬ Δ₂.toFinset ⊆ Δ₁.toFinset ∧
    Δ₁.a ≤ Δ₂.b + 1 ∧ Δ₂.a ≤ Δ₁.b + 1

/-- `Δ₁` precedes `Δ₂`: they are linked and `Δ₂` begins strictly after `Δ₁`. -/
def Precedes (Δ₁ Δ₂ : IntSegment) : Prop := Linked Δ₁ Δ₂ ∧ Δ₁.a < Δ₂.a

/-- Right truncation `Δ⁻ = [a, b - 1]`, empty when `a = b`. -/
def truncate (Δ : IntSegment) : Option IntSegment :=
  if h : Δ.a ≤ Δ.b - 1 then some ⟨Δ.a, Δ.b - 1, h⟩ else none

/-- Twisting by `ν^j` shifts both endpoints. -/
def twist (j : ℤ) (Δ : IntSegment) : IntSegment := ⟨Δ.a + j, Δ.b + j, by have := Δ.le; omega⟩

theorem Linked.symm {Δ₁ Δ₂ : IntSegment} (h : Linked Δ₁ Δ₂) : Linked Δ₂ Δ₁ := by
  sorry

-- Segment.precedes_irrefl.
theorem not_precedes_self (Δ : IntSegment) : ¬ Precedes Δ Δ := by
  sorry

theorem Precedes.asymm {Δ₁ Δ₂ : IntSegment} (h : Precedes Δ₁ Δ₂) : ¬ Precedes Δ₂ Δ₁ := by
  sorry

theorem linked_twist_iff (j : ℤ) (Δ₁ Δ₂ : IntSegment) :
    Linked (twist j Δ₁) (twist j Δ₂) ↔ Linked Δ₁ Δ₂ := by
  sorry

theorem length_twist (j : ℤ) (Δ : IntSegment) : (twist j Δ).length = Δ.length := by
  sorry

-- Segment.linked_example: [0,1] and [1,2] are linked and the first precedes the second.
example : Precedes ⟨0, 1, by norm_num⟩ ⟨1, 2, by norm_num⟩ := by
  sorry

-- Segment.length_one: [0,0] and [1,1] are linked (juxtaposed).
example : Linked ⟨0, 0, le_refl _⟩ ⟨1, 1, le_refl _⟩ := by
  sorry

-- Segment.containment_not_linked: [0,2] and [1,1] are not linked.
example : ¬ Linked ⟨0, 2, by norm_num⟩ ⟨1, 1, le_refl _⟩ := by
  sorry

-- Multisegment.truncate_singleton: [a,a]⁻ is empty.
example (a : ℤ) : truncate ⟨a, a, le_refl a⟩ = none := by
  sorry

end IntSegment

/-- A multisegment on one cuspidal line. -/
abbrev IntMultisegment := Multiset IntSegment

/-- `m⁻`, the multisegment of right truncations (empty segments removed). -/
def IntMultisegment.truncate (m : IntMultisegment) : IntMultisegment :=
  m.filterMap IntSegment.truncate

/-- A list of segments `[x₁,y₁], …, [x_t,y_t]` is a ladder when both the beginnings and the
ends decrease strictly. -/
def IsLadder : List IntSegment → Prop
  | [] => True
  | [_] => True
  | Δ₁ :: Δ₂ :: rest => Δ₂.a < Δ₁.a ∧ Δ₂.b < Δ₁.b ∧ IsLadder (Δ₂ :: rest)

-- Multisegment.IsLadder_example: [1,2], [0,1] is a ladder.
example : IsLadder [⟨1, 2, by norm_num⟩, ⟨0, 1, by norm_num⟩] := by
  sorry

-- Multisegment.IsLadder_non: [0,2], [1,1] is not a ladder.
example : ¬ IsLadder [⟨0, 2, by norm_num⟩, ⟨1, 1, le_refl _⟩] := by
  sorry


/-! ## ET.6: matrix checks for the imported special Weil–Deligne block

These are matrices, not a new Weil–Deligne carrier. For a genuine Frobenius action the residue
cardinality is positive. The covariance identity below also makes sense for every rational q.
For a segment based on GL_d, tensoring this block with a d-dimensional irreducible Weil
representation produces d monodromy blocks of this length.
-/

/-- The monodromy operator of `Sp_k`: `N e_j = e_{j+1}`, `N e_{k-1} = 0`. -/
def specialMonodromy (k : ℕ) : Matrix (Fin k) (Fin k) ℚ :=
  fun i j => if (i : ℕ) = (j : ℕ) + 1 then 1 else 0

/-- The action of a geometric Frobenius on `Sp_k` for residue cardinality `q`:
`r(Frob) e_i = |Frob|^i e_i` with `|Frob| = q⁻¹`. -/
def specialFrobenius (q : ℚ) (k : ℕ) : Matrix (Fin k) (Fin k) ℚ :=
  Matrix.diagonal fun i => q⁻¹ ^ (i : ℕ)

/-- Covariance of the monodromy: `r(Frob) N = |Frob| · N r(Frob)`. -/
theorem specialFrobenius_mul_monodromy (q : ℚ) (k : ℕ) :
    specialFrobenius q k * specialMonodromy k = q⁻¹ • (specialMonodromy k * specialFrobenius q k) := by
  sorry

/-- The monodromy of `Sp_k` is a single nilpotent Jordan block. -/
theorem specialMonodromy_pow_length (k : ℕ) : specialMonodromy k ^ k = 0 := by
  sorry

theorem specialMonodromy_pow_ne_zero {k : ℕ} (hk : 0 < k) :
    specialMonodromy k ^ (k - 1) ≠ 0 := by
  sorry

-- specialWD_two: Sp_2 has N = !![0, 0; 1, 0] and r(Frob) = diag(1, q⁻¹).
example : specialMonodromy 2 = !![0, 0; 1, 0] := by
  sorry

example (q : ℚ) : specialFrobenius q 2 = !![1, 0; 0, q⁻¹] := by
  sorry

-- segmentWD_length_one: Sp_1 has N = 0.
example : specialMonodromy 1 = 0 := by
  sorry

/-! ## ET.6: the inner-form sign

The sign `(-1)^(n - r)` of the inner form `GL_r(D)` of `GL_n` (`n = r · deg D`), which enters the
Jacquet–Langlands character relation and Shin's coefficient `c = e_p(J_b)`, is the Kottwitz sign of
ET.0: `kottwitzSign_gl` above. The quaternion units give `kottwitzSign 1 0 = -1`, so for basic `GL₂`
Shin's trivial endoscopic datum has `c = e_p(J_b) = -1`, not `1`; this sign is distinct from the
global coefficient `endoscopicCoefficient`. The split form has `kottwitzSign_self`.
-/

/-! ## ET.7: a finite signed coefficient ledger

The ledger tests normalization at a fixed spectral test package. It does not define an
infinite-dimensional automorphic trace. The five factors record virtual multiplicity, endoscopic
coefficient, local `Red` trace, auxiliary twisted trace and spherical eigenvalue, respectively.
-/

/-- The finite signed coefficient sum for a normalization check. -/
def comparisonTrace {ι : Type*} (s : Finset ι)
    (multiplicity coefficient localTrace auxiliaryTrace sphericalTrace : ι → ℚ) : ℚ :=
  ∑ i ∈ s, multiplicity i * coefficient i * localTrace i * auxiliaryTrace i * sphericalTrace i

theorem comparisonTrace_addMultiplicity {ι : Type*} (s : Finset ι)
    (m₁ m₂ coefficient localTrace auxiliaryTrace sphericalTrace : ι → ℚ) :
    comparisonTrace s (m₁ + m₂) coefficient localTrace auxiliaryTrace sphericalTrace =
      comparisonTrace s m₁ coefficient localTrace auxiliaryTrace sphericalTrace +
        comparisonTrace s m₂ coefficient localTrace auxiliaryTrace sphericalTrace := by
  sorry

theorem comparisonTrace_zeroLocal {ι : Type*} (s : Finset ι)
    (multiplicity coefficient localTrace auxiliaryTrace sphericalTrace : ι → ℚ)
    (h : ∀ i ∈ s, localTrace i = 0) :
    comparisonTrace s multiplicity coefficient localTrace auxiliaryTrace sphericalTrace = 0 := by
  sorry

/-- Two terms with identical trace factors combine by adding multiplicities. -/
theorem comparisonTrace_merge (a b coefficient localTrace auxiliaryTrace sphericalTrace : ℚ) :
    comparisonTrace ({false, true} : Finset Bool) (fun i => if i = true then a else b)
        (fun _ => coefficient) (fun _ => localTrace)
        (fun _ => auxiliaryTrace) (fun _ => sphericalTrace) =
      comparisonTrace ({()} : Finset Unit) (fun _ => a + b)
        (fun _ => coefficient) (fun _ => localTrace)
        (fun _ => auxiliaryTrace) (fun _ => sphericalTrace) := by
  sorry

-- comparisonTrace.balanced: the balanced proper endoscopic coefficient stays 1/2.
example : comparisonTrace ({()} : Finset Unit) (fun _ => 1) (fun _ => 1 / 2)
    (fun _ => 1) (fun _ => 1) (fun _ => 1) = 1 / 2 := by
  norm_num [comparisonTrace]

-- comparisonTrace.cancellation: equal trace factors can cancel virtually.
example : comparisonTrace ({false, true} : Finset Bool)
    (fun i => if i = true then 1 else -1)
    (fun _ => 1) (fun _ => 1) (fun _ => 1) (fun _ => 1) = 0 := by
  norm_num [comparisonTrace]

-- comparisonTrace.innerForm: omitting the inner-form sign changes this value.
example : comparisonTrace ({()} : Finset Unit) (fun _ => 2) (fun _ => -1)
    (fun _ => 3) (fun _ => 5) (fun _ => 7) = -210 := by
  norm_num [comparisonTrace]

/-- Over all of a finite index type the ledger is the Mathlib trace of the diagonal matrix of
the five-fold products. -/
theorem comparisonTrace_eq_trace_diagonal {ι : Type*} [Fintype ι] [DecidableEq ι]
    (multiplicity coefficient localTrace auxiliaryTrace sphericalTrace : ι → ℚ) :
    comparisonTrace Finset.univ multiplicity coefficient localTrace auxiliaryTrace
        sphericalTrace =
      Matrix.trace (Matrix.diagonal fun i =>
        multiplicity i * coefficient i * localTrace i * auxiliaryTrace i * sphericalTrace i) := by
  sorry

-- comparisonTrace.matrixTrace: two terms with products 2 and 3 give the trace of diag(2,3).
example : comparisonTrace (Finset.univ : Finset (Fin 2)) (fun i => if i = 0 then 2 else 3)
    (fun _ => 1) (fun _ => 1) (fun _ => 1) (fun _ => 1) =
      Matrix.trace (Matrix.diagonal (fun i : Fin 2 => if i = 0 then (2 : ℚ) else 3)) := by
  simp [comparisonTrace, Fin.sum_univ_two]

end TauCetiRoadmap.EndoscopicTransferAndUnitaryTraceComparison
