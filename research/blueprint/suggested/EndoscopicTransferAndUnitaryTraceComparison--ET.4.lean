import Mathlib.Data.Int.Interval
import Mathlib.Data.Multiset.Basic
import Mathlib.Data.Matrix.Basic
import Mathlib.LinearAlgebra.Matrix.Notation
import Mathlib.Algebra.Order.Field.Basic
import Mathlib.Algebra.Group.Even
import Mathlib.Tactic.NormNum

/-!
# Endoscopic transfer and unitary trace comparison: ET.4 revision and inherited signatures

This file suggests signatures for light targets of revision 2. ET.4 is planned, with explicit
proof and supplier gaps; the historical independent review remains `needs_changes` until a
new independent review. The reader now includes its corrected ET.5/ET.6 statements, whose
light signatures below are inherited and whose coverage is outside this revision. These
numerical signatures do not establish the geometric or representation-theoretic inputs.

Baseline: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

Only light definitions with real bodies over carriers that exist at the pinned Mathlib are
given, with milestones statable over them. Reductive groups over p-adic and number fields,
their smooth representations and characters, the twisted trace formula, Igusa varieties,
Kottwitz triples, deformation spaces with Drinfeld level structure, the Weil group and
Weil–Deligne representations have no carriers at the pins: they are targets of the roadmap
document, not declarations here, and the corresponding API items and unit tests of the
packet are stated there.

What is prototyped:
* segments of cuspidal representations on one cuspidal line, modelled by integer intervals
  (the type-χ lines of Atobe–Kondo–Yasuda; a general line is the orbit of one supercuspidal
  under unramified twists ν^j), with linking, precedence, truncation and ladders (ET.6);
* a matrix check for the special Weil–Deligne block already owned by
  ArithmeticGaloisRepresentations R01.2, with its covariance identity (ET.6 imports that object);
* the acceptability condition on eigenvalue valuations across slope components (ET.5);
* the numerical checks of the Kottwitz sign of inner forms of GL_n, the Tamagawa numbers of
  the unitary similitude groups and the endoscopic coefficient ι(G,H) (ET.4, ET.6).
-/

noncomputable section

namespace TauCetiRoadmap.EndoscopicTransfer

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

/-! ## ET.4 and ET.6: numerical checks -/

/-- The Kottwitz sign `(-1)^(n - r)` of the inner form `GL_r(D)` of `GL_n`, `n = r · deg D`. -/
def glInnerFormSign (n r : ℕ) : ℤ := (-1) ^ (n - r)

-- The quaternion units: n = 2, r = 1, sign −1 (Jacquet–Langlands sign for GL₂).
example : glInnerFormSign 2 1 = -1 := by
  sorry

-- Shin's trivial endoscopic datum for basic GL₂ has c = e_p(J_b) = −1, not c = 1.
-- This sign is distinct from the global coefficient ι(G,H) checked below.

-- The split form has sign 1.
example (n : ℕ) : glInnerFormSign n n = 1 := by
  sorry

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

/-- The endoscopic coefficient `ι(G,H) = τ(G) τ(H)⁻¹ |Out(H,s,η)|⁻¹` from its three inputs. -/
def endoscopicCoefficient (τG τH : ℚ) (outH : ℕ) : ℚ := τG / τH / outH

-- endoscopicCoefficient_self: the trivial triple has coefficient 1.
example (τ : ℚ) (h : τ ≠ 0) : endoscopicCoefficient τ τ 1 = 1 := by
  sorry

-- endoscopicCoefficient_equal_blocks: |Out| = 2 halves the coefficient.
example : endoscopicCoefficient 2 2 2 = 1 / 2 := by
  sorry

/-- The inverse determinant when the spectral involution is minus identity on a quotient
of dimension `r`. The full Levi can have positive r: the quotient is by the theta-fixed
full-group split space, not by its entire split space (Shin 2011 Proposition 4.8). -/
def twistedDeterminantCoefficient (r : ℕ) : ℚ := (2 ^ r : ℚ)⁻¹

example : twistedDeterminantCoefficient 0 = 1 := by
  norm_num [twistedDeterminantCoefficient]

-- A single full GL block has anti-invariant dimension one, rather than zero.
example : twistedDeterminantCoefficient 1 = 1 / 2 := by
  norm_num [twistedDeterminantCoefficient]

example : twistedDeterminantCoefficient 2 = 1 / 4 := by
  norm_num [twistedDeterminantCoefficient]

end TauCetiRoadmap.EndoscopicTransfer
