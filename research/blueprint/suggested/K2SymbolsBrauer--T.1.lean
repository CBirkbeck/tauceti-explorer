/-
Independent review REV-K2SymbolsBrauer--T.1, Codex codex-5ebb6f, 2026-09-29.
The current plan and verdict are in the packet K2SymbolsBrauer--T.1.json and
research/blueprint/reviews/REV-K2SymbolsBrauer--T.1.md. The original companion
README still needs regeneration by its owner. This file is a partial suggested
interface, not an implementation or an assertion that the plan is closed.

Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.
No existing build at both pins was available; elaboration was not attempted.

Signatures needing missing carriers are comments below. They do not use a
vacuous proposition, a self-map, or an arbitrary type to stand for that carrier.
Group homology uses trivial integral representation coefficients. Natural-number
homotopy degree n is represented by the coordinate type Fin n at this baseline.
-/
import Mathlib.Algebra.Group.Commutator
import Mathlib.GroupTheory.IsPerfect
import Mathlib.GroupTheory.PresentedGroup
import Mathlib.GroupTheory.Subgroup.Center

noncomputable section
universe u v

namespace TauCeti.Steinberg

/-- Indices and the ring parameter of a Steinberg generator. -/
structure Gen (n : ℕ) (R : Type u) where
  i : Fin n
  j : Fin n
  hij : i ≠ j
  val : R

/-- Intended relators: additivity, nonchaining commutators, forward chaining
coefficient r*s, and reverse chaining coefficient -(s*r). Opposite-root
commutators are deliberately not prescribed. -/
def relations (n : ℕ) (R : Type u) [Ring R] : Set (FreeGroup (Gen n R)) := by
  sorry

/-- Finite-rank presentation, with the source's n >= 3 convention. -/
abbrev Steinberg (n : ℕ) (_hn : 3 ≤ n) (R : Type u) [Ring R] : Type u :=
  PresentedGroup (relations n R)

variable {R : Type u} [Ring R] {n : ℕ}

def x (hn : 3 ≤ n) {i j : Fin n} (hij : i ≠ j) (r : R) : Steinberg n hn R := by
  sorry

@[simp] theorem x_zero (hn : 3 ≤ n) {i j : Fin n} (hij : i ≠ j) :
    x (R := R) hn hij 0 = 1 := by
  sorry

@[simp] theorem x_inv (hn : 3 ≤ n) {i j : Fin n} (hij : i ≠ j) (r : R) :
    (x hn hij r)⁻¹ = x hn hij (-r) := by
  sorry

theorem x_add (hn : 3 ≤ n) {i j : Fin n} (hij : i ≠ j) (r s : R) :
    x hn hij r * x hn hij s = x hn hij (r + s) := by
  sorry

theorem commutator_nonchaining (hn : 3 ≤ n) {i j k l : Fin n}
    (hij : i ≠ j) (hkl : k ≠ l) (hjk : j ≠ k) (hil : i ≠ l) (r s : R) :
    ⁅x hn hij r, x hn hkl s⁆ = 1 := by
  sorry

theorem commutator_forward (hn : 3 ≤ n) {i j k : Fin n}
    (hij : i ≠ j) (hjk : j ≠ k) (hik : i ≠ k) (r s : R) :
    ⁅x hn hij r, x hn hjk s⁆ = x hn hik (r * s) := by
  sorry

theorem commutator_reverse (hn : 3 ≤ n) {i j k : Fin n}
    (hij : i ≠ j) (hki : k ≠ i) (hkj : k ≠ j) (r s : R) :
    ⁅x hn hij r, x hn hki s⁆ = x hn hkj (-(s * r)) := by
  sorry

/-- Keep both word indices, including the reversed indices in the middle factor. -/
def w (hn : 3 ≤ n) {i j : Fin n} (hij : i ≠ j) (r : Rˣ) : Steinberg n hn R :=
  x hn hij (r : R) * x hn hij.symm (-((r⁻¹ : Rˣ) : R)) * x hn hij (r : R)

def h (hn : 3 ≤ n) {i j : Fin n} (hij : i ≠ j) (r : Rˣ) : Steinberg n hn R :=
  w hn hij r * w hn hij (-1 : Rˣ)

/-- Finite perfectness follows by choosing a third index for each generator. -/
theorem finite_isPerfect (hn : 3 ≤ n) : Group.IsPerfect (Steinberg n hn R) := by
  sorry

/-
Missing OWNER carriers and their intended interfaces, not definitions in this file:

KTheoryLowDegrees U.1 supplies Elementary n R and StableElementary R as the
actual elementary subgroups of finite/stable GL, including general-ring matrix
units, rank embeddings and Whitehead block factorization. General-ring bridges
and a group colimit are gaps in the packet.

  toElementary (hn : 3 ≤ n) : Steinberg n hn R →* Elementary n R
  toElementary_x : toElementary hn (x hn hij r) = elementary hij r
  toElementary_surjective : Function.Surjective (toElementary hn)
  stabilise : Steinberg n hn R →* Steinberg (n+1) (...) R
  stableLift : (compatible finite-stage homomorphisms) → (StableSteinberg R →* G)
  phi : StableSteinberg R →* StableElementary R
  classicalK2 R := (phi (R := R)).ker
  K2_eq_center : classicalK2 R = Subgroup.center (StableSteinberg R)
  stable_isPerfect : Group.IsPerfect (StableSteinberg R)

For phi, surjectivity and centrality are mathematical assertions to prove.
Its codomain is E(R), not St(R). Classical K2 is not assumed trivial.
The longer exact sequence uses the imported U.2 quotient GL(R)/E(R).
-/

section CentralExtensions
variable {X G Y : Type u} [Group X] [Group G] [Group Y]

/-- Kernel centrality. Surjectivity is a separate part of an extension. -/
def IsCentral (p : X →* G) : Prop := p.ker ≤ Subgroup.center X

/-- Maps over G retain the actual projection square. -/
structure HomOver (p : X →* G) (q : Y →* G) where
  hom : X →* Y
  over : q.comp hom = p

/-- Universality in the chosen common universe of central extensions over G.
The quantified target need not have the same marked kernel as p. -/
def IsUniversalCentralExtension (p : X →* G) : Prop :=
  Function.Surjective p ∧ IsCentral p ∧
    ∀ (Y : Type u) [Group Y] (q : Y →* G),
      Function.Surjective q → IsCentral q → ∃! f : X →* Y, q.comp f = p

theorem uce_isPerfect {p : X →* G} (hp : IsUniversalCentralExtension p) :
    Group.IsPerfect X ∧ Group.IsPerfect G := by
  sorry

theorem perfect_source_rigidity {p : X →* G} {q : Y →* G}
    (hX : Group.IsPerfect X) (hq : IsCentral q)
    (f g : X →* Y) (hf : q.comp f = p) (hg : q.comp g = p) : f = g := by
  sorry

/-- A generic instance of the star construction with actual central/surjective
projection data; its inputs are in the quotient elementary group when applied
to phi. It is not defined on arbitrary general-linear matrices. -/
def centralStar (p : X →* G) (hp : Function.Surjective p) (hc : IsCentral p)
    (A B : G) (hAB : Commute A B) : p.ker := by
  sorry

theorem centralStar_self (p : X →* G) (hp : Function.Surjective p)
    (hc : IsCentral p) (A : G) : centralStar p hp hc A A (Commute.refl A) = 1 := by
  sorry

/-
Remaining central-extension signatures require the owners' coefficient/quotient
models, rather than an invented carrier:

  relationProjection : F/[S,F] →* F/S
  commutatorProjection : [F,F]/[S,F] →* [G,G]
  hopf : H2(trivial integral representation of G) ≃+
         Additive ((S ∩ [F,F])/[S,F])
  recognition (hp_surj) (hp_central) :
    IsUniversalCentralExtension p ↔
      (H1(trivial integral representation of X) = 0 ∧
       H2(trivial integral representation of X) = 0)
  finite_split (hn : 5 ≤ n) (q : Y →* Steinberg n (...) R)
    (hq_surj) (hq_central) : ∃ s, q.comp s = MonoidHom.id _
  finite_kernel_central (injective on finite kernel under stabilization) :
    IsCentral (toElementary hn)

No finite-rank centrality conclusion follows from finite_split alone.
The full classification uses H2 COHOMOLOGY with trivial action on a fixed
abelian kernel, whereas hopf uses H2 HOMOLOGY with integral coefficients.
-/
end CentralExtensions

/-
Stable comparison interfaces (all require missing carriers/maps):

  steinberg_isUniversal : IsUniversalCentralExtension (phi (R := R))
  k2EquivH2 : Additive (classicalK2 R) ≃+
    (groupHomology.H2 (trivial integral representation of StableElementary R))
  k2EquivPi2 : Additive (classicalK2 R) ≃+
    HomotopyGroup (Fin 2) (BGLPlus R) (zeroBasepoint R)

The cover BE(R)+ -> BGL(R)+ and its chosen natural Hurewicz map are needed;
IV.1.7.1/Exercise IV.1.8 are the K2 locators, not the K3 exercise/corollary.

Symbol interfaces over arbitrary associative unital R:

  commutingSymbol (r s : Rˣ) (hrs : Commute r s) : classicalK2 R
  symbol_eq_commutator : symbol r s hrs = [h_ij(r),h_ik(s)]
  symbol_mul_left (r1 r2 s pairwise commuting) :
    symbol (r1*r2) s = symbol r1 s * symbol r2 s
  symbol_one_sub (r s : Rˣ) (hs : (s : R)=1-(r : R)) : symbol r s = 1
  symbol_negative (r : Rˣ) : symbol r (-r) = 1
  symbol_self : symbol r r = symbol r (-1)

The negative-unit identity is specialized FROM the universal Laurent ring;
no injection of arbitrary-ring K2 into a localization is assumed.

Milnor/Quillen signatures, commented because neither missing graded carrier
may be represented by a self-map or a vacuous theorem:

  milnorSymbol (F : Type u) [Field F] (n : ℕ) (a : Fin n → Fˣ) : MilnorK F n
  milnorSymbol_product : concatenate symbols = their graded product
  milnorLift : a degree-one unit map killing Steinberg products extends uniquely
  matsumoto : MilnorK F 2 ≃+ Additive (classicalK2 F)
  finite_field_K2 [Finite F] : Subsingleton (classicalK2 F)
  rational_restriction : Function.Injective (K2.map (F →+* F(t)))
  extension_kernel_torsion : every element of ker(K2.map(F→L)) has finite order
  milnor_permutation : symbol (a ∘ permutation) = sign • symbol a
  milnor_finite [Finite F] (hn : 2 ≤ n) : Subsingleton (MilnorK F n)
  milnor_algclosed [IsAlgClosed F] (hn : 2 ≤ n) : uniquely divisible (MilnorK F n)
  milnor_real (hn : 1 ≤ n) : MilnorK ℝ n ≃+ (Z/2 plus a divisible subgroup)
  milnor_number_field (hn : 3 ≤ n) : MilnorK F n ≃+ (Z/2)^(real places)
  milnor_global_positive_char (hn : 3 ≤ n) : Subsingleton (MilnorK F n)
  milnorToQuillen n : MilnorK F n →+ QuillenK F n
  milnorToQuillen_symbol : the image is the ordered product of unit classes
  milnorToQuillen_degree_two : Function.Bijective (milnorToQuillen 2)
  milnorToQuillen_degree_three : MilnorK F 3 →+ QuillenK F 3

K.7 supplies the products and comparison with classical degree-two symbols;
V.2 consumes the integral degree-three component, proves its injectivity and
constructs its cokernel. V.2 is not a prerequisite for constructing that map.
-/

/-! Representative tests in addition to the packet's full object-level tests. -/
example (r s : R) :
    ⁅x (n := 3) (by decide) (i := 0) (j := 1) (by decide) r,
      x (n := 3) (by decide) (i := 1) (j := 2) (by decide) s⁆ =
      x (n := 3) (by decide) (i := 0) (j := 2) (by decide) (r*s) := by
  sorry

example (r s : R) :
    ⁅x (n := 3) (by decide) (i := 0) (j := 1) (by decide) r,
      x (n := 3) (by decide) (i := 2) (j := 0) (by decide) s⁆ =
      x (n := 3) (by decide) (i := 2) (j := 1) (by decide) (-(s*r)) := by
  sorry

example : x (R := ℤ) (n := 3) (by decide) (i := 0) (j := 1) (by decide) 0 = 1 := by
  sorry

/-
Counterexample-sensitive tests awaiting the missing owners:
* R=M_2(Z), r=E12, s=E21 distinguishes reverse s*r from r*s.
* C4 -> C2 is central and nonsplit; C2 x C2 -> C2 is split.
* Killing b in Free(a,b)->Z leaves a nonzero RELATION kernel detected by b's
  exponent sum, though H2(Z;Z) is zero.
* The elementary pair e01(1),e12(1) is not a legal star input.
* h12(2) over Q has diagonal image (1,2,1/2), preserving both indices.
* K0^M(C)=Z and K1^M(C)=C× exclude unique divisibility in degrees 0 and 1.
* In C(t), {t,t}={t,-1} has residue -1 at t=0. The presence of i does not
  annihilate this integral repeated-entry symbol.
* Over Q, degree three is injective Z/2 -> Z/48 and fails surjectivity.
-/
end TauCeti.Steinberg
