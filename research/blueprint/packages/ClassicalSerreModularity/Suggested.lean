import Mathlib.Algebra.Group.End
import Mathlib.Algebra.Order.Floor.Semiring
import Mathlib.Algebra.Ring.Parity
import Mathlib.Analysis.Complex.Basic
import Mathlib.Analysis.SpecialFunctions.Log.Basic
import Mathlib.Data.Int.ModEq
import Mathlib.Data.Nat.MaxPrimeFac
import Mathlib.Data.ZMod.Basic
import Mathlib.FieldTheory.IsAlgClosed.AlgebraicClosure
import Mathlib.FieldTheory.KrullTopology
import Mathlib.GroupTheory.OrderOfElement
import Mathlib.GroupTheory.Solvable
import Mathlib.LinearAlgebra.Dimension.Finrank
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.LinearAlgebra.Matrix.Notation
import Mathlib.LinearAlgebra.Matrix.Trace
import Mathlib.LinearAlgebra.TensorProduct.Tower
import Mathlib.NumberTheory.DirichletCharacter.Basic
import Mathlib.NumberTheory.ModularForms.Basic
import Mathlib.NumberTheory.NumberField.Basic
import Mathlib.NumberTheory.NumberField.DirichletDensity
import Mathlib.NumberTheory.NumberField.InfinitePlace.Embeddings
import Mathlib.NumberTheory.PrimeCounting
import Mathlib.Order.Interval.Finset.Nat
import Mathlib.RingTheory.DiscreteValuationRing.Basic
import Mathlib.RingTheory.Frobenius
import Mathlib.RepresentationTheory.Irreducible
import Mathlib.RingTheory.LocalRing.ResidueField.Basic
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.NormNum.GCD
import Mathlib.Tactic.NormNum.Prime
import Mathlib.Tactic.Ring
import Mathlib.Topology.Algebra.Constructions
import Mathlib.Topology.Instances.Matrix

/-!
# Suggested Lean forms: Serre's modularity conjecture over ℚ

This file is not the roadmap and is not exhaustive. The roadmap README is definitive. These
statements suggest Lean forms so that contributors and reviewers converge on names and
signatures. The targets are proved by `sorry`; only arithmetic and matrix examples carry proofs,
and nothing here is claimed to be formalised.

The file imports individual Mathlib modules only. It works with Mathlib's absolute Galois group
of `ℚ`, its Frobenius elements, inertia groups, complex conjugations and Dirichlet density.
Objects that other roadmaps own appear in the section `ImportedInterfaces` as opaque data
stand-ins whose docstrings name the owner; the owner's definition governs. Tau Ceti's
`HeckeRing.GL2.Newform` is among them: the pinned newform carries no attached Galois
representation, and the shared check of this file has no Tau Ceti build, so a stand-in summing it
over levels and weights carries the residual representations; an implementation uses the pinned
structure. No condition is replaced by a `Prop`-valued placeholder: "arises from" and "modular"
are defined from the data stand-ins, and for irreducible `ρ̄`, the only case used, this is the
definition of §2.2 of the README, owned by `AlgebraicModularFormsAndSerreWeights:R15.6`.

Local p-adic statements (crystalline and Barsotti–Tate lifts, Weil–Deligne types, deformation
rings, compatible systems) need interfaces that the pinned libraries do not have. For those
targets the file records their exact matrix and arithmetic content as examples, most of them
proved by `decide`, `norm_num` or `omega`; the README states the theorems.

Layer labels such as `R26.3` and target labels such as `R26.3/weight-interval-containment`
refer to the README.
-/

set_option autoImplicit false

noncomputable section

namespace TauCeti.SerreConjecture

open NumberField
open scoped TensorProduct

universe u

/-! ## Conventions -/

/-- The absolute Galois group `G_ℚ = Gal(ℚ̄/ℚ)`, with Mathlib's Krull topology. This is the body
of `Field.absoluteGaloisGroup ℚ`, used unfolded so that its actions on algebraic integers apply. -/
abbrev GQ : Type := AlgebraicClosure ℚ ≃ₐ[ℚ] AlgebraicClosure ℚ

/-- The ring `ℤ̄` of algebraic integers, on which `G_ℚ` acts. -/
abbrev IntBar : Type := 𝓞 (AlgebraicClosure ℚ)

/-- `𝔽̄_p`, the coefficient field of residual representations. -/
abbrev FpBar (p : ℕ) [Fact p.Prime] : Type := AlgebraicClosure (ZMod p)

/-- `σ` is an arithmetic Frobenius element at some prime of `ℤ̄` containing `r`: `σ x ≡ x ^ r`
modulo that prime for every algebraic integer `x`. For a prime number `r` these are the elements
`Frob_r` of the sources, for all choices of a prime above `r`. -/
def IsFrobAt (σ : GQ) (r : ℕ) : Prop :=
  ∃ Q : Ideal IntBar, Q.IsPrime ∧ (r : IntBar) ∈ Q ∧ IsArithFrobAt ℤ σ Q

/-- `ρ` is unramified at `r`: trivial on the inertia group of every prime of `ℤ̄` containing `r`. -/
def IsUnramifiedAt {H : Type*} [Group H] (ρ : GQ →* H) (r : ℕ) : Prop :=
  ∀ Q : Ideal IntBar, Q.IsPrime → (r : IntBar) ∈ Q → Q.inertia GQ ≤ ρ.ker

/-- `ρ` is odd: `det ρ(c) = −1` for every complex conjugation `c`, that is every `c` which some
embedding `φ : ℚ̄ → ℂ` carries to complex conjugation. All such `c` are conjugate in `G_ℚ`. -/
def IsOdd {k : Type*} [CommRing k] (ρ : GQ →* GL (Fin 2) k) : Prop :=
  ∀ (φ : AlgebraicClosure ℚ →+* ℂ) (c : GQ), ComplexEmbedding.IsConj φ c →
    Matrix.det (ρ c : Matrix (Fin 2) (Fin 2) k) = -1

/-- Irreducibility of a two-dimensional representation: no line of `k²` is stable. Over an
algebraically closed field this is absolute irreducibility. -/
def IsIrreducible {G k : Type*} [Group G] [Field k] (ρ : G →* GL (Fin 2) k) : Prop :=
  ∀ v : Fin 2 → k, v ≠ 0 → ∃ g : G, ∀ a : k, (ρ g : Matrix (Fin 2) (Fin 2) k).mulVec v ≠ a • v

/-- The Mathlib representation on `k²` underlying a matrix representation. -/
def toRepresentation {G k : Type*} [Group G] [Field k] (ρ : G →* GL (Fin 2) k) :
    Representation k G (Fin 2 → k) :=
  (Units.coeHom _).comp (Matrix.GeneralLinearGroup.toLin.toMonoidHom.comp ρ)

/-- The stable-line form of irreducibility is Mathlib's `Representation.IsIrreducible`. -/
theorem isIrreducible_iff {G k : Type*} [Group G] [Field k] (ρ : G →* GL (Fin 2) k) :
    IsIrreducible ρ ↔ (toRepresentation ρ).IsIrreducible := by
  sorry

/-- Absolute irreducibility in Burnside's form: the matrices `ρ(g)` span `M₂(k)`. This is
equivalent to irreducibility over every extension field of `k`. -/
def IsAbsIrreducible {G k : Type*} [Group G] [Field k] (ρ : G →* GL (Fin 2) k) : Prop :=
  Submodule.span k (Set.range fun g : G => (ρ g : Matrix (Fin 2) (Fin 2) k)) = ⊤

/-- A residual representation of S-type: continuous (open kernel), odd and absolutely
irreducible. -/
def IsSType {k : Type*} [Field k] (ρ : GQ →* GL (Fin 2) k) : Prop :=
  IsOpen (ρ.ker : Set GQ) ∧ IsOdd ρ ∧ IsAbsIrreducible ρ

/-- `ρ_proj(a)` and `ρ_proj(b)` are conjugate in the projective image: `ρ(a)` is a scalar multiple
of `ρ(τ b τ⁻¹)` for some `τ`. -/
def IsProjConj {G k : Type*} [Group G] [CommRing k] (ρ : G →* GL (Fin 2) k) (a b : G) : Prop :=
  ∃ (τ : G) (z : k),
    (ρ a : Matrix (Fin 2) (Fin 2) k) = z • (ρ (τ * b * τ⁻¹) : Matrix (Fin 2) (Fin 2) k)

/-- The vectors of `R²` fixed by a subgroup `H`. -/
def fixedVectors {G R : Type*} [Group G] [CommRing R] (ρ : G →* GL (Fin 2) R) (H : Subgroup G) :
    Submodule R (Fin 2 → R) where
  carrier := {v | ∀ h ∈ H, (ρ h : Matrix (Fin 2) (Fin 2) R).mulVec v = v}
  add_mem' hv hw h hh := by rw [Matrix.mulVec_add, hv h hh, hw h hh]
  zero_mem' h _ := Matrix.mulVec_zero _
  smul_mem' a v hv h hh := by rw [Matrix.mulVec_smul, hv h hh]

/-- The reduction of a representation over a local ring modulo the maximal ideal. -/
def residualRep {G O : Type*} [Group G] [CommRing O] [IsLocalRing O] (ρ : G →* GL (Fin 2) O) :
    G →* GL (Fin 2) (IsLocalRing.ResidueField O) :=
  (Matrix.GeneralLinearGroup.map (IsLocalRing.residue O)).comp ρ

/-- The representation over the fraction field. -/
def genericRep {G O : Type*} [Group G] [CommRing O] [IsDomain O] (ρ : G →* GL (Fin 2) O) :
    G →* GL (Fin 2) (FractionRing O) :=
  (Matrix.GeneralLinearGroup.map (algebraMap O (FractionRing O))).comp ρ

/-- The nonzero primes of `ℤ = 𝓞 ℚ` generated by an element of a set `S` of natural numbers, the
form in which Mathlib's Dirichlet density takes a set of rational primes. -/
def primesOfRat (S : Set ℕ) : Set (IsDedekindDomain.HeightOneSpectrum (𝓞 ℚ)) :=
  {v | Ideal.absNorm v.asIdeal ∈ S}

/-- The level `N′` of the weight-one statements: `N` if `N ≥ 5` and `5N` otherwise. -/
def auxLevel (N : ℕ) : ℕ := if 5 ≤ N then N else 5 * N

open Classical in
/-- A chosen prime of `ℤ̄` above `q` (the unit ideal if there is none, which happens only when
`q` is a unit). Statements below that use it are invariant under the choice, since the inertia
groups above `q` are conjugate. -/
def primeAbove (q : ℕ) : Ideal IntBar :=
  if h : ∃ Q : Ideal IntBar, Q.IsPrime ∧ (q : IntBar) ∈ Q then h.choose else ⊤

/-- The inertia group `I_q ⊆ G_ℚ` at the chosen prime above `q`. -/
def inertiaAt (q : ℕ) : Subgroup GQ := (primeAbove q).inertia GQ

/-- The inclusions `I_q → G_ℚ`, the inertia data of the good-dihedral predicate over `ℚ`. -/
def galoisInertia (q : ℕ) : inertiaAt q →* GQ := (inertiaAt q).subtype

/-! ## Imported interfaces

Each declaration here stands in for an object that another roadmap owns, named in its
docstring. An opaque `def` is data (a type, a number or a map) whose body is `sorry`. -/

section ImportedInterfaces

/-- Imported from `ArithmeticGaloisRepresentations:R01.3` (stand-in, opaque): the Artin conductor
of a two-dimensional representation of `G_ℚ` with open kernel over `k`, taken away from the
characteristic of `k`: `∏ r ^ n(r, ρ)` over the primes `r ≠ char k`, with
`n(r, ρ) = ∑_{i ≥ 0} [G₀ : Gᵢ]⁻¹ dim V / V^{Gᵢ}`. In characteristic zero it is the Artin conductor,
and in characteristic `p` it is Serre's level `N(ρ̄)`. Every use is over a field; the binder asks
only for `CommRing k`, so that fraction fields and residue fields are accepted without unfolding
their instances. -/
def artinConductor {k : Type*} [CommRing k] (ρ : GQ →* GL (Fin 2) k) : ℕ := sorry

/-- Imported from `AlgebraicModularFormsAndSerreWeights:R15.4` (stand-in, opaque): Serre's weight
`k(ρ̄) ≥ 2` of a residual representation, from his local recipe at `p`. -/
def serreWeight {p : ℕ} [Fact p.Prime] (ρ : GQ →* GL (Fin 2) (FpBar p)) : ℕ := sorry

/-- Stand-in (opaque) for the normalised classical newforms of all levels and weights, Tau Ceti's
`HeckeRing.GL2.Newform N k` at the pin, summed over `N` and `k`. -/
def Newform : Type := sorry

namespace Newform

/-- The level of a newform (stand-in, opaque). -/
def level (f : Newform) : ℕ := sorry

/-- The weight of a newform (stand-in, opaque). -/
def weight (f : Newform) : ℕ := sorry

/-- The character of a newform, a Dirichlet character modulo its level (stand-in, opaque). -/
def character (f : Newform) : DirichletCharacter ℂ f.level := sorry

/-- Imported from `AlgebraicModularFormsAndSerreWeights:R15.6` (stand-in, opaque): the primes `λ`
above `p` of the coefficient field of `f`, relative to the fixed embedding `ι_p`, together with an
embedding of the residue field of `λ` in `𝔽̄_p`. -/
def ResidualPlace (f : Newform) (p : ℕ) : Type := sorry

/-- Imported from `AlgebraicModularFormsAndSerreWeights:R15.6`, which takes the attached
representations from `AutomorphicGaloisRepresentations` (stand-in, opaque): the semisimplified
reduction of `ρ_{f,λ}` at a residual place, in a chosen basis. Only its conjugacy class is
determined by `f` and the place. -/
def residualRep (f : Newform) {p : ℕ} [Fact p.Prime] (v : f.ResidualPlace p) :
    GQ →* GL (Fin 2) (FpBar p) := sorry

end Newform

/-- Imported from `AlgebraicModularFormsAndSerreWeights:R15.1` (stand-in, opaque): Katz cusp forms
`S_k(Γ₁(N); A)` of level `N` and weight `k` over a ring `A` in which `N` is invertible: sections of
`ω^k ⊗ 𝒪(−cusps)` on the `Γ₁(N)` moduli stack over `A`, which for `N ≥ 5` is
`H⁰(X₁(N)_A, ω^k ⊗ 𝒪(−cusps))`. For `N` not invertible in `A` the value is not used. -/
def KatzCuspForms (N : ℕ) (k : ℤ) (A : Type u) [CommRing A] : Type u := sorry

/-- The addition of Katz cusp forms (imported, opaque). -/
instance (N : ℕ) (k : ℤ) (A : Type u) [CommRing A] : AddCommGroup (KatzCuspForms N k A) := sorry

/-- The `A`-module structure of Katz cusp forms (imported, opaque). -/
instance (N : ℕ) (k : ℤ) (A : Type u) [CommRing A] : Module A (KatzCuspForms N k A) := sorry

/-- Imported from `AlgebraicModularFormsAndSerreWeights:R15.1`–`R15.2` (stand-in, opaque): the Hecke
operator `T_r` on Katz cusp forms, for a prime `r` not dividing `N` and invertible in `A`. -/
def katzHecke (N : ℕ) (k : ℤ) (A : Type u) [CommRing A] (r : ℕ) :
    KatzCuspForms N k A →ₗ[A] KatzCuspForms N k A := sorry

/-- Imported from `AlgebraicModularFormsAndSerreWeights:R15.1`–`R15.2` (stand-in, opaque): the diamond operator `⟨d⟩` on Katz cusp
forms, for a unit `d` of `ℤ/N`. -/
def katzDiamond (N : ℕ) (k : ℤ) (A : Type u) [CommRing A] (d : ZMod N) :
    KatzCuspForms N k A →ₗ[A] KatzCuspForms N k A := sorry

/-- Imported from `AlgebraicModularFormsAndSerreWeights:R15.2` (stand-in, opaque): the base-change map
`B ⊗_A S_k(Γ₁(N); A) → S_k(Γ₁(N); B)`. -/
def katzBaseChange (N : ℕ) (k : ℤ) (A B : Type u) [CommRing A] [CommRing B] [Algebra A B] :
    B ⊗[A] KatzCuspForms N k A →ₗ[B] KatzCuspForms N k B := sorry

/-- Imported from Tau Ceti ModularForms, Layer 4 (stand-in, opaque): the normalised cuspidal
newforms of weight one, of all levels and characters, `Σ N, HeckeRing.GL2.Newform N 1` at the
pin, with their complex Deligne–Serre representations. -/
def WeightOneNewform : Type := sorry

namespace WeightOneNewform

/-- The level of a weight-one newform (imported, opaque). -/
def level (f : WeightOneNewform) : ℕ := sorry

/-- The character of a weight-one newform, modulo its level (imported, opaque). -/
def character (f : WeightOneNewform) : DirichletCharacter ℂ f.level := sorry

/-- The Fourier coefficient `a_n(f)`; for a prime `r` it is the eigenvalue of `T_r`
(imported, opaque). -/
def coeff (f : WeightOneNewform) (n : ℕ) : ℂ := sorry

/-- Imported from `AutomorphicGaloisRepresentations:R19.1` (stand-in, opaque): the Deligne–Serre
representation `ρ_f : G_ℚ → GL₂(ℂ)`, in a chosen basis. -/
def galoisRep (f : WeightOneNewform) : GQ →* GL (Fin 2) ℂ := sorry

end WeightOneNewform

end ImportedInterfaces

/-! ## Arising from a newform and modularity (README §2.2) -/

/-- `ρ̄` arises from a newform of level `N` and weight `k`: some newform `f` of that level and
weight has a residual place at which its (semisimplified) residual representation is isomorphic
to `ρ̄`. For irreducible `ρ̄` this agrees with arising from an integral model (Brauer–Nesbitt). -/
def ArisesFrom {p : ℕ} [Fact p.Prime] (ρ : GQ →* GL (Fin 2) (FpBar p)) (N k : ℕ) : Prop :=
  ∃ (f : Newform) (v : f.ResidualPlace p), f.level = N ∧ f.weight = k ∧
    ∃ g : GL (Fin 2) (FpBar p), ∀ σ : GQ, f.residualRep v σ = g * ρ σ * g⁻¹

/-- `ρ̄` is modular: it arises from a newform of some level and some weight `k ≥ 2`. -/
def IsModular {p : ℕ} [Fact p.Prime] (ρ : GQ →* GL (Fin 2) (FpBar p)) : Prop :=
  ∃ N k : ℕ, 2 ≤ k ∧ ArisesFrom ρ N k

/-- Arising from a newform of weight at least two is modularity. -/
theorem ArisesFrom.isModular {p : ℕ} [Fact p.Prime] {ρ : GQ →* GL (Fin 2) (FpBar p)} {N k : ℕ}
    (h : ArisesFrom ρ N k) (hk : 2 ≤ k) : IsModular ρ := by
  sorry

/-- Arising from a newform depends only on the isomorphism class of `ρ̄`. -/
theorem arisesFrom_conj {p : ℕ} [Fact p.Prime] (ρ : GQ →* GL (Fin 2) (FpBar p)) (N k : ℕ)
    (B : GL (Fin 2) (FpBar p)) :
    ArisesFrom ((MulAut.conj B).toMonoidHom.comp ρ) N k ↔ ArisesFrom ρ N k := by
  sorry

/-! ## R26.1, R26.6: the level-one theorem and its corollaries -/

/-- `R26.1/level-one-theorem-and-the-meaning-of-arises-from` (Khare's level-one theorem): a
residual representation of S-type unramified outside its characteristic arises from a newform
of level one and weight `k(ρ̄)`. -/
theorem level_one {p : ℕ} [Fact p.Prime] (ρ : GQ →* GL (Fin 2) (FpBar p)) (hS : IsSType ρ)
    (hur : ∀ r : ℕ, r.Prime → r ≠ p → IsUnramifiedAt ρ r) :
    ArisesFrom ρ 1 (serreWeight ρ) := by
  sorry

/-- `R26.1/corollary-1-2-conductor-a-prime-and-its-corrected-proof` and `R26.6/corollary-1-2-proof`
(Khare Corollary 1.2, Khare–Wintenberger Corollary 8.1(i)): weight two and prime conductor `q`
give a newform in `S₂(Γ₁(q))`, in every characteristic. -/
theorem conductor_prime_weight_two {p : ℕ} [Fact p.Prime] (ρ : GQ →* GL (Fin 2) (FpBar p))
    (hS : IsSType ρ) (hk : serreWeight ρ = 2) {q : ℕ} (hq : q.Prime)
    (hN : artinConductor ρ = q) : ArisesFrom ρ q 2 := by
  sorry

/-- `R26.6/corollary-8-1-ii-and-the-statement-W1` (Khare–Wintenberger Corollary 8.1(ii)): weight
two, unramified outside `p` and one odd prime `q`, tamely ramified at `q` with inertia image of
order a power of an odd prime `t > 5`. Tameness is `t ≠ q`. The conclusion is at level `q²`. -/
theorem corollary_8_1_ii {p : ℕ} [Fact p.Prime] (ρ : GQ →* GL (Fin 2) (FpBar p))
    (hS : IsSType ρ) (hk : serreWeight ρ = 2) {q t a : ℕ} (hq : q.Prime) (hq2 : q ≠ 2)
    (hqp : q ≠ p) (hur : ∀ r : ℕ, r.Prime → r ≠ p → r ≠ q → IsUnramifiedAt ρ r)
    (ht : t.Prime) (ht5 : 5 < t) (htq : t ≠ q)
    (hI : Nat.card ((inertiaAt q).map ρ) = t ^ a) :
    ∃ N : ℕ, N ∣ q ^ 2 ∧ ArisesFrom ρ N 2 := by
  sorry

/-- `R26.6/finiteness-corollary-1-3` (Khare Corollary 1.3), absolutely irreducible part: up to
isomorphism there are finitely many S-type representations unramified outside `p`. Left out of
the signature: the reducible semisimple ones, sums of two characters of order dividing `p − 1`. -/
theorem finite_level_one (p : ℕ) [Fact p.Prime] :
    ∃ S : Set (GQ →* GL (Fin 2) (FpBar p)), S.Finite ∧
      ∀ ρ : GQ →* GL (Fin 2) (FpBar p), IsSType ρ →
        (∀ r : ℕ, r.Prime → r ≠ p → IsUnramifiedAt ρ r) →
        ∃ ρ' ∈ S, ∃ g : GL (Fin 2) (FpBar p), ∀ σ : GQ, ρ' σ = g * ρ σ * g⁻¹ := by
  sorry

/-! ## R26.3, R26.5: the weight induction at level one -/

/-- `R26.3/level-one-induction-scheme`: the statement `S(B)`, that every S-type representation
of level one and Serre weight at most `B`, in every characteristic, is modular. -/
def LevelOneUpTo (B : ℕ) : Prop :=
  ∀ (p : ℕ) [Fact p.Prime] (ρ : GQ →* GL (Fin 2) (FpBar p)), IsSType ρ →
    (∀ r : ℕ, r.Prime → r ≠ p → IsUnramifiedAt ρ r) → serreWeight ρ ≤ B → IsModular ρ

/-- `S(B)` is antitone in `B`. -/
theorem LevelOneUpTo.mono {B C : ℕ} (h : B ≤ C) (hC : LevelOneUpTo C) : LevelOneUpTo B := by
  sorry

/-- `R26.5/weight-eight`: the row `(P, ℓ^e, j) = (7, 3, 2)`. -/
theorem levelOneUpTo_eight : LevelOneUpTo 8 := by
  sorry

/-- `R26.5/weights-ten-twelve`: the row `(11, 5, 4)`. -/
theorem levelOneUpTo_twelve : LevelOneUpTo 12 := by
  sorry

/-- `R26.5/weights-fourteen-twenty`: the row `(19, 9, 8)`. -/
theorem levelOneUpTo_twenty : LevelOneUpTo 20 := by
  sorry

/-- `R26.5/weights-twentytwo-thirty`: the row `(29, 7, j)` with `j = 16` for `k = 22, 26, 30` and
`j = 14` for `k = 24, 28`. -/
theorem levelOneUpTo_thirty : LevelOneUpTo 30 := by
  sorry

/-- `R26.5/weight-thirtytwo` and `R26.5/small-weights-table`: the row `(31, 5, 18)`, giving
`S(32)`. -/
theorem levelOneUpTo_thirtyTwo : LevelOneUpTo 32 := by
  sorry

/-- `R26.3/level-one-induction-scheme` and `R26.6/level-one-proof-assembly`, the inductive step:
for a prime `p ≥ 31` and the least non-Fermat prime `P > p`, `S(p + 1)` implies `S(P + 1)`. -/
theorem levelOneUpTo_step {p P : ℕ} (hp : p.Prime) (h31 : 31 ≤ p) (hP : P.Prime) (hlt : p < P)
    (hPF : ∀ a : ℕ, P ≠ 2 ^ (2 ^ a) + 1)
    (hnext : ∀ q : ℕ, q.Prime → p < q → (∀ a : ℕ, q ≠ 2 ^ (2 ^ a) + 1) → P ≤ q)
    (h : LevelOneUpTo (p + 1)) : LevelOneUpTo (P + 1) := by
  sorry

/-! ## R26.2, R26.3, R27.2: prime estimates and the local quadratic -/

/-- `R26.3/explicit-prime-counting-input`: the Rosser–Schoenfeld inequalities, with the existing
prime-counting function evaluated at the floor. -/
theorem explicit_prime_counting (x : ℝ) :
    (17 ≤ x → x / Real.log x < (Nat.primeCounting ⌊x⌋₊ : ℝ)) ∧
    (1 < x → (Nat.primeCounting ⌊x⌋₊ : ℝ) < (125506 / 100000 : ℝ) * x / Real.log x) ∧
    (67 ≤ x → x / (Real.log x - 1 / 2) < (Nat.primeCounting ⌊x⌋₊ : ℝ)) ∧
    (Real.exp (3 / 2) < x →
      (Nat.primeCounting ⌊x⌋₊ : ℝ) < x / (Real.log x - 3 / 2)) := by
  sorry

/-- `R26.3/next-prime-ratio`: the exact rational bound for consecutive primes. -/
theorem next_prime_ratio (p P : ℕ) (hp : p.Prime) (h31 : 31 ≤ p)
    (hP : P.Prime) (hlt : p < P)
    (hnext : ∀ q : ℕ, q.Prime → p < q → P ≤ q) :
    (P : ℚ) / p < 22 / 15 := by
  sorry

/-- `R26.3/next-prime-ratio`, large range: for `p ≥ 21591` the least non-Fermat prime above `p`
is less than `1499/1000 · p`. -/
theorem next_nonFermat_prime_ratio (p P : ℕ) (hp : p.Prime) (hbig : 21591 ≤ p)
    (hP : P.Prime) (hlt : p < P) (hPF : ∀ a : ℕ, P ≠ 2 ^ (2 ^ a) + 1)
    (hnext : ∀ q : ℕ, q.Prime → p < q → (∀ a : ℕ, q ≠ 2 ^ (2 ^ a) + 1) → P ≤ q) :
    (P : ℚ) < 1499 / 1000 * p := by
  sorry

/-- `R26.3/finite-auxiliary-prime-checks`: the finite certificate, including the Fermat skips. -/
theorem finite_auxiliary_prime_checks (p : ℕ) (hp : p.Prime) (h5 : 5 ≤ p)
    (hbound : p ≤ 21591) :
    ∃ P ℓ e m : ℕ, P.Prime ∧ p < P ∧
      (∀ a : ℕ, P ≠ 2 ^ (2 ^ a) + 1) ∧
      (∀ q : ℕ, q.Prime → p < q → (∀ a : ℕ, q ≠ 2 ^ (2 ^ a) + 1) → P ≤ q) ∧
      ℓ.Prime ∧ Odd ℓ ∧ 0 < e ∧ ℓ ^ e ∣ P - 1 ∧ ¬ ℓ ^ (e + 1) ∣ P - 1 ∧
      ℓ ^ e = 2 * m + 1 ∧ (m + 1) * P + m ≤ (2 * m + 1) * p := by
  sorry

/-- `R26.3/chebyshev-next-prime` (Khare's estimate (1)): the single owner of the odd
auxiliary-prime inequality. -/
theorem odd_auxiliary_prime (p : ℕ) (hp : p.Prime) (h31 : 31 ≤ p) :
    ∃ P ℓ e m : ℕ, P.Prime ∧ p < P ∧
      (∀ a : ℕ, P ≠ 2 ^ (2 ^ a) + 1) ∧
      (∀ q : ℕ, q.Prime → p < q → (∀ a : ℕ, q ≠ 2 ^ (2 ^ a) + 1) → P ≤ q) ∧
      ℓ.Prime ∧ Odd ℓ ∧ 0 < e ∧ ℓ ≤ p ∧
      ℓ ^ e ∣ P - 1 ∧ ¬ ℓ ^ (e + 1) ∣ P - 1 ∧
      ℓ ^ e = 2 * m + 1 ∧ (m + 1) * P + m ≤ (2 * m + 1) * p := by
  sorry

/-- `R26.3/weight-interval-containment`: both returned weights lie in the proved range. -/
theorem weight_interval_containment (m P p j : ℚ)
    (h : (m + 1) * P + m ≤ (2 * m + 1) * p) (hm : 1 ≤ m) (hP : 2 ≤ P)
    (hlo : m * (P - 1) / (2 * m + 1) < j)
    (hhi : j ≤ (m + 1) * (P - 1) / (2 * m + 1)) :
    (2 ≤ j + 2 ∧ j + 2 ≤ p + 1) ∧ (2 ≤ P + 1 - j ∧ P + 1 - j ≤ p + 1) := by
  sorry

/-- `R26.3/weight-interval-containment`: a half-open interval of positive integral length `L`
contains exactly one representative of every residue class modulo `L`. -/
theorem half_open_interval_residue (L : ℕ) (hL : 0 < L) (a c : ℤ) :
    ∃! j : ℤ, a < j ∧ j ≤ a + L ∧ Int.ModEq (L : ℤ) j c := by
  sorry

/-- `R26.2/local-ring-at-q-smooth`: the commutation and determinant relations give the quadratic
with a plus sign. -/
theorem local_frobenius_quadratic {R : Type*} [CommRing R]
    (α β γ c ψ : R) (hcomm : α - β = γ * (c - 1)) (hdet : α * β = ψ) :
    β ^ 2 + β * γ * (c - 1) - ψ = 0 := by
  sorry

/-- `R27.2/prime-gap-estimates-driving-the-weight-recursion`: the dyadic inequality (2) implies
inequality (4). The exponent `e` is unrelated to the conductor count `r`. -/
theorem dyadic_weight_bound (p P e : ℕ) (he : 4 ≤ e)
    (h : (2 ^ (e - 1) + 2) * P + (2 ^ (e - 1) - 2) ≤ 2 ^ e * p) :
    (2 ^ (e - 1) + 2) * (P - 1) + 2 * 2 ^ e ≤ (p + 1) * 2 ^ e := by
  sorry

/-! ## R27.1: good-dihedral primes -/

section GoodDihedral

variable {G K : Type*} {I : ℕ → Type*} [Group G] [∀ q, Group (I q)] [Field K]

/-- `R27.1/good-dihedral-prime-definition` (Khare–Wintenberger Definition 2.1), with supplied
inertia homomorphisms, characteristic `p` and conductor `N`. The universal power condition and the
attained order together say that `ψ` has exact order `t^a`. -/
def IsGoodDihedralPrime (ρ : G →* GL (Fin 2) K) (inertia : ∀ q, I q →* G) (p N q : ℕ) : Prop :=
  q.Prime ∧ q ≠ p ∧
  (∃ (t a : ℕ) (ψ : I q →* Kˣ),
    t.Prime ∧ Odd t ∧ 0 < a ∧ t ∣ q + 1 ∧
    max (max (Nat.maxPrimeFac (N / q ^ 2)) 5) p < t ∧
    (∀ x, ψ x ^ (t ^ a) = 1) ∧ (∃ x, orderOf (ψ x) = t ^ a) ∧
    ∃ B : GL (Fin 2) K, ∀ x,
      ((B⁻¹ * ρ (inertia q x) * B : GL (Fin 2) K) : Matrix (Fin 2) (Fin 2) K) =
        Matrix.diagonal (fun i => if i = 0 then (ψ x : K) else (ψ x : K) ^ q)) ∧
  q % 8 = 1 ∧ ∀ s : ℕ, s.Prime → s ≤ max (Nat.maxPrimeFac (N / q ^ 2)) p → q % s = 1

/-- `R27.1/good-dihedral-prime-definition`: `ρ` is locally good-dihedral if some prime is a
good-dihedral prime for it. -/
def IsLocallyGoodDihedral (ρ : G →* GL (Fin 2) K) (inertia : ∀ q, I q →* G) (p N : ℕ) : Prop :=
  ∃ q, IsGoodDihedralPrime ρ inertia p N q

namespace IsGoodDihedralPrime

variable {ρ : G →* GL (Fin 2) K} {ι : ∀ q, I q →* G} {p N q : ℕ}

theorem inertia (h : IsGoodDihedralPrime ρ ι p N q) :
    ∃ (t a : ℕ) (ψ : I q →* Kˣ), t.Prime ∧ Odd t ∧ 0 < a ∧ t ∣ q + 1 ∧
      max (max (Nat.maxPrimeFac (N / q ^ 2)) 5) p < t ∧
      (∀ x, ψ x ^ (t ^ a) = 1) ∧ (∃ x, orderOf (ψ x) = t ^ a) ∧
      ∃ B : GL (Fin 2) K, ∀ x,
        ((B⁻¹ * ρ (ι q x) * B : GL (Fin 2) K) : Matrix (Fin 2) (Fin 2) K) =
          Matrix.diagonal (fun i => if i = 0 then (ψ x : K) else (ψ x : K) ^ q) := by
  sorry

theorem congruences (h : IsGoodDihedralPrime ρ ι p N q) :
    q % 8 = 1 ∧ ∀ s : ℕ, s.Prime →
      s ≤ max (Nat.maxPrimeFac (N / q ^ 2)) p → q % s = 1 := by
  sorry

theorem conjugate (B : GL (Fin 2) K) :
    IsGoodDihedralPrime ((MulAut.conj B⁻¹).toMonoidHom.comp ρ) ι p N q ↔
      IsGoodDihedralPrime ρ ι p N q := by
  sorry

theorem locallyGood (h : IsGoodDihedralPrime ρ ι p N q) :
    IsLocallyGoodDihedral ρ ι p N := by
  sorry

end IsGoodDihedralPrime

namespace IsLocallyGoodDihedral

variable {ρ : G →* GL (Fin 2) K} {ι : ∀ q, I q →* G} {p N : ℕ}

theorem exists_good (h : IsLocallyGoodDihedral ρ ι p N) :
    ∃ q, IsGoodDihedralPrime ρ ι p N q := by
  sorry

theorem conjugate (B : GL (Fin 2) K) :
    IsLocallyGoodDihedral ((MulAut.conj B⁻¹).toMonoidHom.comp ρ) ι p N ↔
      IsLocallyGoodDihedral ρ ι p N := by
  sorry

end IsLocallyGoodDihedral

-- goodDihedral_congruence_fails
example (ρ : G →* GL (Fin 2) K) (inertia : ∀ q, I q →* G) (p N : ℕ) :
    ¬ IsGoodDihedralPrime ρ inertia p N 13 := by
  sorry

-- goodDihedral_trivial_inertia_fails
example (ρ : G →* GL (Fin 2) K) (inertia : ∀ q, I q →* G) (p N q : ℕ)
    (htriv : ∀ x, ρ (inertia q x) = 1) :
    ¬ IsGoodDihedralPrime ρ inertia p N q := by
  sorry

-- goodDihedral_upper_endpoint: the congruences at 2, 3, 5 and 8 hold; equality s = p = 7 fails.
example (ρ : G →* GL (Fin 2) K) (inertia : ∀ q, I q →* G) :
    Nat.maxPrimeFac ((9 * 241 ^ 2) / 241 ^ 2) = 3 ∧
      241 % 8 = 1 ∧ 241 % 2 = 1 ∧ 241 % 3 = 1 ∧ 241 % 5 = 1 ∧
      241 % 7 ≠ 1 ∧ ¬ IsGoodDihedralPrime ρ inertia 7 (9 * 241 ^ 2) 241 := by
  sorry

-- goodDihedral_basis_change
example (ρ : G →* GL (Fin 2) K) (inertia : ∀ q, I q →* G) (p N q : ℕ) (B : GL (Fin 2) K) :
    IsGoodDihedralPrime ((MulAut.conj B⁻¹).toMonoidHom.comp ρ) inertia p N q ↔
      IsGoodDihedralPrime ρ inertia p N q := by
  sorry

-- locallyGood_single_witness: one witness suffices although the candidate 13 always fails.
example (ρ : G →* GL (Fin 2) K) (inertia : ∀ q, I q →* G) (p N q : ℕ)
    (h : IsGoodDihedralPrime ρ inertia p N q) :
    IsLocallyGoodDihedral ρ inertia p N ∧ ¬ IsGoodDihedralPrime ρ inertia p N 13 := by
  sorry

-- locallyGood_trivial_inertia_fails
example (ρ : G →* GL (Fin 2) K) (inertia : ∀ q, I q →* G) (p N : ℕ)
    (htriv : ∀ q x, ρ (inertia q x) = 1) :
    ¬ IsLocallyGoodDihedral ρ inertia p N := by
  sorry

-- locallyGood_basis_change
example (ρ : G →* GL (Fin 2) K) (inertia : ∀ q, I q →* G) (p N : ℕ) (B : GL (Fin 2) K) :
    IsLocallyGoodDihedral ((MulAut.conj B⁻¹).toMonoidHom.comp ρ) inertia p N ↔
      IsLocallyGoodDihedral ρ inertia p N := by
  sorry

end GoodDihedral

/-- `R27.1/good-dihedral-prime-definition` over `ℚ`: a residual representation is locally
good-dihedral, with its own characteristic, its conductor `N(ρ̄)` and the inertia groups at the
chosen primes. -/
def IsGoodDihedralRep {p : ℕ} [Fact p.Prime] (ρ : GQ →* GL (Fin 2) (FpBar p)) : Prop :=
  IsLocallyGoodDihedral ρ galoisInertia p (artinConductor ρ)

/-- `IsGoodDihedralPrime.q_sq_dvd_conductor`: for an actual residual Galois representation the
niveau-two inertia at a good-dihedral prime has no invariants, so `q² ∣ N(ρ̄)`. -/
theorem IsGoodDihedralPrime.q_sq_dvd_conductor {p : ℕ} [Fact p.Prime]
    {ρ : GQ →* GL (Fin 2) (FpBar p)} (hcont : IsOpen (ρ.ker : Set GQ)) {q : ℕ}
    (h : IsGoodDihedralPrime ρ galoisInertia p (artinConductor ρ) q) :
    q ^ 2 ∣ artinConductor ρ := by
  sorry

/-- `R27.1/good-dihedral-implies-nonsolvable-image-and-is-preserved`, part (i) (Khare–Wintenberger
Lemma 6.3(i)): a locally good-dihedral representation has non-solvable image. Left out of the
signature: the projective image is not `A₅`, and part (ii), which needs compatible systems. -/
theorem isLocallyGoodDihedral_not_isSolvable {p : ℕ} [Fact p.Prime]
    (ρ : GQ →* GL (Fin 2) (FpBar p)) (hcont : IsOpen (ρ.ker : Set GQ)) (h : IsGoodDihedralRep ρ) :
    ¬ Group.IsSolvable ρ.range := by
  sorry

/-! ## R27.1: Lemma 8.2 -/

/-- `R27.1/lemma-8-2-chebotarev-choice-of-auxiliary-primes`: the primes `q` at which `ρ̄` is
unramified such that (i) `ρ̄_proj(Frob_q)` and `ρ̄_proj(c)` are conjugate in the projective image,
(ii) `q ≡ 1` modulo every prime `ℓ ≤ p − 1` and modulo `8`, and (iii) `q ≡ −1` modulo `p`. -/
def auxiliaryPrimes {p : ℕ} (ρ : GQ →* GL (Fin 2) (ZMod p)) (c : GQ) : Set ℕ :=
  {q | q.Prime ∧ IsUnramifiedAt ρ q ∧ (∃ σ : GQ, IsFrobAt σ q ∧ IsProjConj ρ σ c) ∧
    (∀ ℓ : ℕ, ℓ.Prime → ℓ ≤ p - 1 → q % ℓ = 1) ∧ q % 8 = 1 ∧ q % p = p - 1}

/-- `R27.1/lemma-8-2-chebotarev-choice-of-auxiliary-primes` (Khare–Wintenberger Lemma 8.2,
Dieulefait–Pacetti Lemma 1.15): for `p ≡ 1 mod 4` and `ρ̄ : G_ℚ → GL₂(𝔽_p)` with coefficients in
the prime field, continuous, odd and of non-solvable image, the primes of the lemma have positive
Dirichlet density. Absolute irreducibility is not a hypothesis: a non-solvable subgroup of
`GL₂(𝔽_p)` stabilises no line over `𝔽̄_p`. -/
theorem lemma_8_2 {p : ℕ} [Fact p.Prime] (hp : p % 4 = 1) (ρ : GQ →* GL (Fin 2) (ZMod p))
    (hcont : IsOpen (ρ.ker : Set GQ)) (hns : ¬ Group.IsSolvable ρ.range)
    {φ : AlgebraicClosure ℚ →+* ℂ} {c : GQ} (hc : ComplexEmbedding.IsConj φ c)
    (hodd : Matrix.det (ρ c : Matrix (Fin 2) (Fin 2) (ZMod p)) = -1) :
    ∃ δ : ℝ, 0 < δ ∧ NumberField.Set.HasDirichletDensity (primesOfRat (auxiliaryPrimes ρ c)) δ := by
  sorry

/-- `R27.1/lemma-8-2-chebotarev-choice-of-auxiliary-primes`, the consequences: at such a prime
every Frobenius element has trace zero, and `p ∣ q + 1`. -/
theorem lemma_8_2_trace_eq_zero {p : ℕ} [Fact p.Prime] (ρ : GQ →* GL (Fin 2) (ZMod p))
    {φ : AlgebraicClosure ℚ →+* ℂ} {c : GQ} (hc : ComplexEmbedding.IsConj φ c)
    (hodd : Matrix.det (ρ c : Matrix (Fin 2) (Fin 2) (ZMod p)) = -1) {q : ℕ}
    (hq : q ∈ auxiliaryPrimes ρ c) {σ : GQ} (hσ : IsFrobAt σ q) :
    Matrix.trace (ρ σ : Matrix (Fin 2) (Fin 2) (ZMod p)) = 0 ∧ p ∣ q + 1 := by
  sorry

/-! ## R27.2–R27.3: the hypotheses (L_r), (W_r), (D_r) and the double induction -/

/-- `R27.2/hypotheses-Lr-Wr-and-Dr`, `(L_r)`: every S-type, locally good-dihedral `ρ̄` with
`k(ρ̄) = 2` when `p = 2`, and odd conductor with at most `r` prime divisors, is modular. -/
def HypL (r : ℕ) : Prop :=
  ∀ (p : ℕ) [Fact p.Prime] (ρ : GQ →* GL (Fin 2) (FpBar p)), IsSType ρ → IsGoodDihedralRep ρ →
    (p = 2 → serreWeight ρ = 2) → Odd (artinConductor ρ) →
    (artinConductor ρ).primeFactors.card ≤ r → IsModular ρ

/-- `R27.2/hypotheses-Lr-Wr-and-Dr`, `(W_r)`: as `(L_r)`, with `k(ρ̄) = 2` in every
characteristic. -/
def HypW (r : ℕ) : Prop :=
  ∀ (p : ℕ) [Fact p.Prime] (ρ : GQ →* GL (Fin 2) (FpBar p)), IsSType ρ → IsGoodDihedralRep ρ →
    serreWeight ρ = 2 → Odd (artinConductor ρ) →
    (artinConductor ρ).primeFactors.card ≤ r → IsModular ρ

/-- `R27.2/hypotheses-Lr-Wr-and-Dr`, `(D_r)`: every S-type, locally good-dihedral `ρ̄` of odd
characteristic with `2^(r+1) ∤ N(ρ̄)` is modular. -/
def HypD (r : ℕ) : Prop :=
  ∀ (p : ℕ) [Fact p.Prime] (ρ : GQ →* GL (Fin 2) (FpBar p)), IsSType ρ → IsGoodDihedralRep ρ →
    p ≠ 2 → ¬ 2 ^ (r + 1) ∣ artinConductor ρ → IsModular ρ

/-- `(L_r)` implies `(W_r)`, by restriction to weight two. -/
theorem hypL_imp_hypW {r : ℕ} (h : HypL r) : HypW r := by
  sorry

theorem hypL_mono {r s : ℕ} (hrs : r ≤ s) (h : HypL s) : HypL r := by
  sorry

theorem hypW_mono {r s : ℕ} (hrs : r ≤ s) (h : HypW s) : HypW r := by
  sorry

theorem hypD_mono {r s : ℕ} (hrs : r ≤ s) (h : HypD s) : HypD r := by
  sorry

-- hypL_imp_hypW_test: specialising `(L_r)` to weight two gives `(W_r)` at that representation.
example {r : ℕ} (h : HypL r) {p : ℕ} [Fact p.Prime] (ρ : GQ →* GL (Fin 2) (FpBar p))
    (hS : IsSType ρ) (hg : IsGoodDihedralRep ρ) (hk : serreWeight ρ = 2)
    (hN : Odd (artinConductor ρ)) (hc : (artinConductor ρ).primeFactors.card ≤ r) :
    IsModular ρ := by
  sorry

-- hypD_even_conductor (arithmetic content): `N = 2·7²` meets the condition of `(D₁)` and is not
-- odd, so it fails the conductor condition of `(L_r)` and `(W_r)`.
example : ¬ (2 ^ (1 + 1) ∣ (2 * 7 ^ 2 : ℕ)) ∧ ¬ Odd (2 * 7 ^ 2 : ℕ) := by decide

-- hyp_count_primes: `3 · 5 · 7²` has three prime factors.
example : (3 * 5 * 7 ^ 2 : ℕ).primeFactors.card = 3 := by
  rw [Nat.primeFactors_mul (by norm_num) (by norm_num), Nat.primeFactors_mul (by norm_num) (by norm_num),
    Nat.primeFactors_pow _ (by norm_num), Nat.Prime.primeFactors (by norm_num),
    Nat.Prime.primeFactors (by norm_num), Nat.Prime.primeFactors (by norm_num)]
  decide

-- hyp_dyadic_weight (arithmetic content): at `p = 2` the weight condition admits `2` and rejects
-- `4`; at odd `p` the condition of `(L_r)` is vacuous while that of `(W_r)` rejects `4`.
example : ((2 : ℕ) = 2 → (2 : ℕ) = 2) ∧ ¬ ((2 : ℕ) = 2 → (4 : ℕ) = 2) ∧
    ((3 : ℕ) = 2 → (4 : ℕ) = 2) ∧ (4 : ℕ) ≠ 2 := by decide

/-- `R27.2/theorem-3-2-weight-reduction` (Khare–Wintenberger Theorem 3.2): `(W_r) ⇒ (L_r)`. -/
theorem hypL_of_hypW {r : ℕ} (hr : 1 ≤ r) (h : HypW r) : HypL r := by
  sorry

/-- `R27.3/theorem-3-1-killing-ramification` (Theorem 3.1): `(L_r) ⇒ (W_{r+1})`. -/
theorem hypW_succ_of_hypL {r : ℕ} (hr : 1 ≤ r) (h : HypL r) : HypW (r + 1) := by
  sorry

/-- `R27.3/theorem-3-3-initial-case` (Theorem 3.3): `(W₁)`. -/
theorem hypW_one : HypW 1 := by
  sorry

/-- `R27.3/double-induction-assembly`: `(L_r)` for every `r ≥ 1`. -/
theorem hypL_all {r : ℕ} (hr : 1 ≤ r) : HypL r := by
  sorry

/-- `R27.3/d0-from-all-lr`: if `(L_r)` holds for every `r ≥ 1`, then `(D₀)` holds. -/
theorem hypD_zero_of_hypL (h : ∀ r : ℕ, 1 ≤ r → HypL r) : HypD 0 := by
  sorry

/-- `(D₀)`, from `hypD_zero_of_hypL` and `hypL_all`. -/
theorem hypD_zero : HypD 0 := by
  sorry

-- d0-from-all-lr: `N = 6` satisfies the condition of `(D₁)` but not that of `(D₀)`.
example : 2 ^ (0 + 1) ∣ 6 ∧ ¬ 2 ^ (1 + 1) ∣ 6 := by norm_num

/-! ## R27.4: raising levels, weight and level, Theorem 1.2 -/

/-- `R27.4/theorem-3-4-raising-levels-and-the-chebotarev-choice` (Theorem 3.4): `(D_r)` removes the
good-dihedral hypothesis, for conductors with `2^(r+1) ∤ N(ρ̄)`, with `k(ρ̄) = 2` when `p = 2` and
`r = 0`. -/
theorem raising_levels {r : ℕ} (hD : HypD r) {p : ℕ} [Fact p.Prime]
    (ρ : GQ →* GL (Fin 2) (FpBar p)) (hS : IsSType ρ) (hN : ¬ 2 ^ (r + 1) ∣ artinConductor ρ)
    (hk : p = 2 → r = 0 → serreWeight ρ = 2) : IsModular ρ := by
  sorry

/-- `R27.4/strong-form-by-minimal-lifts`: a modular S-type representation, of odd characteristic or
of Serre weight two, arises at weight `k(ρ̄)` and level `N(ρ̄)`. -/
theorem arisesFrom_of_isModular {p : ℕ} [Fact p.Prime] (ρ : GQ →* GL (Fin 2) (FpBar p))
    (hS : IsSType ρ) (hmod : IsModular ρ) (hk : p = 2 → serreWeight ρ = 2) :
    ArisesFrom ρ (artinConductor ρ) (serreWeight ρ) := by
  sorry

/-- `R27.4/theorem-1-2`, part (1): odd characteristic and odd conductor. -/
theorem kw_theorem_1_2_odd {p : ℕ} [Fact p.Prime] (hp : p ≠ 2) (ρ : GQ →* GL (Fin 2) (FpBar p))
    (hS : IsSType ρ) (hN : Odd (artinConductor ρ)) :
    ArisesFrom ρ (artinConductor ρ) (serreWeight ρ) := by
  sorry

/-- `R27.4/theorem-1-2`, part (2): characteristic two and weight two. -/
theorem kw_theorem_1_2_two [Fact (Nat.Prime 2)] (ρ : GQ →* GL (Fin 2) (FpBar 2))
    (hS : IsSType ρ) (hk : serreWeight ρ = 2) :
    ArisesFrom ρ (artinConductor ρ) 2 := by
  sorry

-- auxiliary-characteristic-choice: a prime `p′ > 5` is at least 7, so the inertia orders
-- `p′ − 1` and `p′ + 1` are at least 6.
example (p : ℕ) (hp : 7 ≤ p) : 6 ≤ p - 1 ∧ 6 ≤ p + 1 := by omega

-- Theorem 3.4: for `p′ = 13` the characteristic in which `(D_r)` is applied is `11`.
example : Nat.Prime 11 ∧ ¬ Nat.Prime 12 := by norm_num

/-- Theorem 3.4, the dyadic conductor chain: the Steinberg parameter `(id, N)` with `N ≠ 0`
nilpotent of rank one has conductor exponent `2 − dim ker N = 1`. -/
example : !![(0 : ℤ), 1; 0, 0] * !![(0 : ℤ), 1; 0, 0] = 0 ∧ !![(0 : ℤ), 1; 0, 0] ≠ 0 ∧
    2 - 1 = 1 := by
  decide

/-- The chain of bounds: the final exponent is at most `r` when each reduction lowers or keeps the
exponent and the minimal lift keeps it; no equality with the original exponent is needed. -/
example (r A e₁ e₂ e₃ : ℕ) (hA : A ≤ r) (h₁ : e₁ ≤ A) (h₂ : e₂ = e₁) (h₃ : e₃ ≤ e₂) : e₃ ≤ r := by
  omega

/-- The boundary case `p = 2`, `k(ρ̄) = 4`, `r = 1`: original exponent `0`, first-system exponent
`A = 1 ≤ r`; with `r = 0`, excluded by the theorem, the bound would fail. -/
example : (0 : ℕ) ≠ 1 ∧ (1 : ℕ) ≤ 1 ∧ ¬ (1 : ℕ) ≤ 0 := by decide

/-! ## R27.5: characteristic two, weight four and even conductor -/

/-- `R27.5/d1-by-the-prime-three`: `(D₁)`, through a congruence at 3 and Hypothesis (H) at 2
(Kisin, `GL2ModularityLifting:R22.6/hypothesis-h`). -/
theorem hypD_one : HypD 1 := by
  sorry

/-- `R27.5/dr-for-r-at-least-two`: `(D_r)` for every `r ≥ 2`. -/
theorem hypD_of_two_le {r : ℕ} (hr : 2 ≤ r) : HypD r := by
  sorry

/-- `R27.5/hypothesis-H-and-theorem-9-1` (Khare–Wintenberger Theorem 9.1): every S-type residual
representation is modular. The same statement is the qualitative theorem of the modern route,
`R33.5/qualitative-serre-theorem`, with a second proof. -/
theorem isModular_of_isSType {p : ℕ} [Fact p.Prime] (ρ : GQ →* GL (Fin 2) (FpBar p))
    (hS : IsSType ρ) : IsModular ρ := by
  sorry

/-- `R27.5/dyadic-weight-two-claim`, `R33.3/remark-6-weight-two-after-type-change` and
`ramification_index_three`: an odd valuation stays odd in an extension of odd ramification index
(such as `K = ℚ₄(χ′)`, of index 3) and becomes even in index 2. -/
example (e v : ℕ) (he : Odd e) (hv : Odd v) : Odd (e * v) := he.mul hv

example (v : ℕ) : Even (2 * v) := even_two_mul v

/-- `order_three_level_two`: an order-3 character of tame inertia at 2 has niveau two:
`3 ∣ 2 + 1`, `|𝔽₄^×| = 3`, `|𝔽₂^×| = 1`. -/
example : 3 ∣ 2 + 1 ∧ 2 ^ 2 - 1 = 3 ∧ 2 - 1 = 1 := by norm_num

/-! ## R27.6: the strong form and its exports -/

/-- `R27.6/full-classical-serre-theorem` (Serre's conjecture, strong form): every S-type
`ρ̄ : G_ℚ → GL₂(𝔽̄_p)` arises from a newform of weight `k(ρ̄)` and level `N(ρ̄)`. The character of
that newform then reduces to `ε(ρ̄)`, since `det ρ̄ = ε̄ χ̄_p^(k(ρ̄)−1)`. -/
theorem serre_strong {p : ℕ} [Fact p.Prime] (ρ : GQ →* GL (Fin 2) (FpBar p)) (hS : IsSType ρ) :
    ArisesFrom ρ (artinConductor ρ) (serreWeight ρ) := by
  sorry

/-- `R27.6/finite-flat-weight-two-export`: for `p ≥ 5`, an S-type `ρ̄` of Serre weight two with
cyclotomic determinant (`det ρ̄(Frob_r) = r` for primes `r ≠ p`) arises from a newform of weight
two, level `N(ρ̄)` and trivial character. In the source the weight-two hypothesis is finiteness at
`p` with `det ρ̄|_{I_p} = χ̄_p`, which gives `k(ρ̄) = 2` by Serre's Proposition 4. -/
theorem weight_two_trivial_character {p : ℕ} [Fact p.Prime] (hp : 5 ≤ p)
    (ρ : GQ →* GL (Fin 2) (FpBar p)) (hS : IsSType ρ) (hk : serreWeight ρ = 2)
    (hdet : ∀ r : ℕ, r.Prime → r ≠ p → ∀ τ : GQ, IsFrobAt τ r →
      Matrix.det (ρ τ : Matrix (Fin 2) (Fin 2) (FpBar p)) = r) :
    ∃ (g : Newform) (v : g.ResidualPlace p), g.level = artinConductor ρ ∧ g.weight = 2 ∧
      g.character = 1 ∧ ∃ h : GL (Fin 2) (FpBar p), ∀ σ : GQ, g.residualRep v σ = h * ρ σ * h⁻¹ := by
  sorry

/-- `R27.6/artin-reductions-of-serre-type`, part (b), faithfulness: for a finite group whose order
is invertible in the residue field, reduction does not change the kernel. -/
theorem artin_reduction_ker_eq {G O : Type*} [Group G] [Finite G] [CommRing O] [IsLocalRing O]
    (hG : (Nat.card G : IsLocalRing.ResidueField O) ≠ 0) (ρ : G →* GL (Fin 2) O) :
    (residualRep ρ).ker = ρ.ker := by
  sorry

/-- `R27.6/artin-reductions-of-serre-type`, part (b), invariants: `(O²)^H` is free of rank
`dim (k²)^H` for every subgroup `H`. -/
theorem artin_reduction_finrank_fixedVectors {G O : Type*} [Group G] [Finite G] [CommRing O]
    [IsLocalRing O] (hG : (Nat.card G : IsLocalRing.ResidueField O) ≠ 0) (ρ : G →* GL (Fin 2) O)
    (H : Subgroup G) :
    Module.Free O (fixedVectors ρ H) ∧
      Module.finrank (IsLocalRing.ResidueField O) (fixedVectors (residualRep ρ) H) =
        Module.finrank O (fixedVectors ρ H) := by
  sorry

/-- `R27.6/artin-reductions-of-serre-type`, part (b), irreducibility: over a discrete valuation
ring, with the group order invertible in the residue field, absolute irreducibility over the
fraction field passes to the reduction. -/
theorem artin_reduction_isAbsIrreducible {G O : Type*} [Group G] [Finite G] [CommRing O]
    [IsDomain O] [IsDiscreteValuationRing O] (hG : (Nat.card G : IsLocalRing.ResidueField O) ≠ 0)
    (ρ : G →* GL (Fin 2) O) (hirr : IsAbsIrreducible (genericRep ρ)) :
    IsAbsIrreducible (residualRep ρ) := by
  sorry

/-- `R27.6/artin-reductions-of-serre-type`, part (c): with `ℓ` prime to the order of the image and
to the Artin conductor, the reduction is unramified at `ℓ` and has the same conductor. Left out of
the signature: part (a), the independence of the lattice, the character, the weights `k(ρ̄_λ) = ℓ`
and `1`, and part (d). -/
theorem artin_reduction_conductor {O : Type*} [CommRing O] [IsDomain O]
    [IsDiscreteValuationRing O] [CharZero O] {ℓ : ℕ} (hℓ : ℓ.Prime)
    [CharP (IsLocalRing.ResidueField O) ℓ]
    (ρ : GQ →* GL (Fin 2) O) (hcont : IsOpen (ρ.ker : Set GQ)) (hG : ¬ ℓ ∣ Nat.card ρ.range)
    (hN : ¬ ℓ ∣ artinConductor (genericRep ρ)) :
    IsUnramifiedAt (residualRep ρ) ℓ ∧
      artinConductor (residualRep ρ) = artinConductor (genericRep ρ) := by
  sorry

/-- `R27.6/unramified-residual-representations-arise-in-weight-one`: for odd `ℓ`, a continuous,
irreducible, odd `ρ̄ : G_ℚ → GL₂(𝔽̄_ℓ)` unramified at `ℓ`, with distinct Frobenius eigenvalues at
`ℓ` (`tr² ≠ 4 det`), comes from a nonzero Katz cusp form of weight one and level `N(ρ̄)`. -/
theorem unramified_residual_arises_in_weight_one {ℓ : ℕ} [Fact ℓ.Prime] (hℓ : ℓ ≠ 2)
    (ρ : GQ →* GL (Fin 2) (FpBar ℓ)) (hcont : IsOpen (ρ.ker : Set GQ))
    (hirr : IsIrreducible ρ) (hodd : IsOdd ρ) (hur : IsUnramifiedAt ρ ℓ) {σ : GQ}
    (hσ : IsFrobAt σ ℓ)
    (hdist : Matrix.trace (ρ σ : Matrix (Fin 2) (Fin 2) (FpBar ℓ)) ^ 2 ≠
      4 * Matrix.det (ρ σ : Matrix (Fin 2) (Fin 2) (FpBar ℓ))) :
    ∃ h : KatzCuspForms (artinConductor ρ) 1 (FpBar ℓ), h ≠ 0 ∧
      ∀ r : ℕ, r.Prime → ¬ r ∣ artinConductor ρ * ℓ → ∀ τ : GQ, IsFrobAt τ r →
        katzHecke _ 1 _ r h = Matrix.trace (ρ τ : Matrix (Fin 2) (Fin 2) (FpBar ℓ)) • h ∧
          katzDiamond _ 1 _ (r : ZMod (artinConductor ρ)) h =
            Matrix.det (ρ τ : Matrix (Fin 2) (Fin 2) (FpBar ℓ)) • h := by
  sorry

/-- `R27.6/weight-one-reduction-is-onto-for-almost-all-primes`: for `N ≥ 5`, outside a finite set
of primes, base change `k ⊗_O S₁(N; O) → S₁(N; k)` is bijective and commutes with `T_r` and the
diamond operators. -/
theorem weight_one_reduction_bijective (N : ℕ) (hN : 5 ≤ N) :
    ∃ B : Finset ℕ, ∀ ℓ : ℕ, ℓ.Prime → ¬ ℓ ∣ N → ℓ ∉ B →
      ∀ (O : Type u) [CommRing O] [IsDomain O] [IsDiscreteValuationRing O] [CharZero O]
        [CharP (IsLocalRing.ResidueField O) ℓ],
        Function.Bijective (katzBaseChange N 1 O (IsLocalRing.ResidueField O)) ∧
        (∀ r : ℕ, r.Prime → ¬ r ∣ N * ℓ → ∀ x,
          katzBaseChange N 1 O (IsLocalRing.ResidueField O)
              ((katzHecke N 1 O r).baseChange (IsLocalRing.ResidueField O) x) =
            katzHecke N 1 (IsLocalRing.ResidueField O) r
              (katzBaseChange N 1 O (IsLocalRing.ResidueField O) x)) ∧
        ∀ d : ZMod N, IsUnit d → ∀ x,
          katzBaseChange N 1 O (IsLocalRing.ResidueField O)
              ((katzDiamond N 1 O d).baseChange (IsLocalRing.ResidueField O) x) =
            katzDiamond N 1 (IsLocalRing.ResidueField O) d
              (katzBaseChange N 1 O (IsLocalRing.ResidueField O) x) := by
  sorry

/-- `R27.6/weight-one-descent-from-infinitely-many-primes`, the hypothesis at one prime `ℓ`: a
place `λ ∣ ℓ` with an embedding of its residue field in `𝔽̄_ℓ`, given as `χ : 𝓞_E → 𝔽̄_ℓ`, and a
nonzero Katz form of type `(N, 1, ε mod λ)` with `T_r h = (t_r mod λ) h` for primes `r ∤ Nℓ`. -/
def OccursInWeightOneModulo (N : ℕ) {E : Type*} [Field E] [NumberField E]
    (ε : DirichletCharacter (𝓞 E) N) (t : ℕ → 𝓞 E) (ℓ : ℕ) [Fact ℓ.Prime] : Prop :=
  ∃ (χ : 𝓞 E →+* FpBar ℓ) (h : KatzCuspForms N 1 (FpBar ℓ)),
    h ≠ 0 ∧ (∀ d : ZMod N, IsUnit d → katzDiamond N 1 _ d h = χ (ε d) • h) ∧
      ∀ r : ℕ, r.Prime → ¬ r ∣ N * ℓ → katzHecke N 1 _ r h = χ (t r) • h

/-- `R27.6/weight-one-descent-from-infinitely-many-primes` (Khare's descent): if the family occurs
in weight one modulo infinitely many primes, a weight-one newform of level dividing `N′`, with
character induced by `ε`, has `a_r(f) = t_r` for the primes `r ∤ N′`. -/
theorem weight_one_descent (N : ℕ) (hN : 0 < N) {E : Type*} [Field E] [NumberField E]
    (ι : E →+* ℂ) (ε : DirichletCharacter (𝓞 E) N) (t : ℕ → 𝓞 E)
    (h : {ℓ : ℕ | ∃ _ : Fact ℓ.Prime, OccursInWeightOneModulo N ε t ℓ}.Infinite) :
    ∃ f : WeightOneNewform, f.level ∣ auxLevel N ∧
      (∀ d : ℕ, d.Coprime (auxLevel N) → f.character (d : ZMod f.level) = ι (ε (d : ZMod N))) ∧
      ∀ r : ℕ, r.Prime → ¬ r ∣ auxLevel N → f.coeff r = ι (t r) := by
  sorry

/-- `R27.6/weight-one-descent-from-infinitely-many-primes`, the last sentence: a continuous
`ρ : G_ℚ → GL₂(ℂ)` unramified outside `N` with these traces and determinants is isomorphic to the
Deligne–Serre representation of such an `f`. -/
theorem weight_one_descent_galoisRep (N : ℕ) (hN : 0 < N) {E : Type*} [Field E] [NumberField E]
    (ι : E →+* ℂ) (ε : DirichletCharacter (𝓞 E) N) (t : ℕ → 𝓞 E)
    (h : {ℓ : ℕ | ∃ _ : Fact ℓ.Prime, OccursInWeightOneModulo N ε t ℓ}.Infinite)
    (ρ : GQ →* GL (Fin 2) ℂ) (hcont : Continuous ρ)
    (hρ : ∀ r : ℕ, r.Prime → ¬ r ∣ N → IsUnramifiedAt ρ r ∧ ∀ τ : GQ, IsFrobAt τ r →
      Matrix.trace (ρ τ : Matrix (Fin 2) (Fin 2) ℂ) = ι (t r) ∧
        Matrix.det (ρ τ : Matrix (Fin 2) (Fin 2) ℂ) = ι (ε (r : ZMod N))) :
    ∃ f : WeightOneNewform, f.level ∣ auxLevel N ∧
      (∀ d : ℕ, d.Coprime (auxLevel N) → f.character (d : ZMod f.level) = ι (ε (d : ZMod N))) ∧
      (∀ r : ℕ, r.Prime → ¬ r ∣ auxLevel N → f.coeff r = ι (t r)) ∧
      ∃ g : GL (Fin 2) ℂ, ∀ σ : GQ, f.galoisRep σ = g * ρ σ * g⁻¹ := by
  sorry

/-- `R27.6/odd-artin-weight-one-modularity` (Khare–Wintenberger Corollary 10.2(ii)): a continuous,
odd, irreducible `ρ : G_ℚ → GL₂(ℂ)` is the Deligne–Serre representation of a weight-one newform of
level dividing `N′`, `N` the Artin conductor, whose character is `det ρ`. -/
theorem odd_artin_weight_one (ρ : GQ →* GL (Fin 2) ℂ) (hcont : Continuous ρ)
    (hirr : IsIrreducible ρ) (hodd : IsOdd ρ) :
    ∃ f : WeightOneNewform, f.level ∣ auxLevel (artinConductor ρ) ∧
      (∀ r : ℕ, r.Prime → ¬ r ∣ auxLevel (artinConductor ρ) → ∀ τ : GQ, IsFrobAt τ r →
        f.character (r : ZMod f.level) = Matrix.det (ρ τ : Matrix (Fin 2) (Fin 2) ℂ)) ∧
      ∃ g : GL (Fin 2) ℂ, ∀ σ : GQ, f.galoisRep σ = g * ρ σ * g⁻¹ := by
  sorry

/-! ## R26.5: arithmetic of the terminal rows and the prime estimates -/

-- The return weights `j + 2` and `P + 1 − j` of the five rows.
example : (2 + 2, 7 + 1 - 2) = (4, 6) ∧ (4 + 2, 11 + 1 - 4) = (6, 8) ∧
    (8 + 2, 19 + 1 - 8) = (10, 12) ∧ (16 + 2, 29 + 1 - 16) = (18, 14) ∧
    (14 + 2, 29 + 1 - 14) = (16, 16) ∧ (18 + 2, 31 + 1 - 18) = (20, 14) := by decide

-- `P − 1 = ((P − 1)/ℓ^e) · ℓ^e` in each row.
example : 7 - 1 = 2 * 3 ∧ 11 - 1 = 2 * 5 ∧ 19 - 1 = 2 * 9 ∧
    29 - 1 = 4 * 7 ∧ 31 - 1 = 6 * 5 := by decide

-- The coset condition modulo 4 at `P = 29`.
example : 22 % 4 = 14 % 4 ∧ 26 % 4 = 14 % 4 ∧ 20 % 4 = 16 % 4 ∧
    24 % 4 = 16 % 4 ∧ 28 % 4 = 16 % 4 := by decide

-- At `P = 31` the printed exponent 16 is inadmissible, while 18 lies in `(12, 18]`.
example : ¬ (6 ∣ 16) ∧ 6 ∣ 18 ∧ 2 * 30 < 18 * 5 ∧ 18 * 5 ≤ 3 * 30 := by decide

-- The dyadic case `(p, P, e) = (13, 17, 4)` of inequality (2) is strict.
example : (2 ^ (4 - 1) + 2) * 17 + (2 ^ (4 - 1) - 2) = 176 ∧
    (2 ^ 4 * 13 : ℕ) = 208 ∧ (176 : ℕ) < 208 := by decide

-- The Fermat skip after 251.
example : 257 = 2 ^ 8 + 1 ∧ (263 : ℚ) / 251 ≤ 3 / 2 - 1 / 30 := by norm_num

-- The printed uniform prime-counting bound fails at 31 and at 100.
example : Nat.primeCounting 31 = 11 ∧ Nat.primeCounting 100 = 25 := by
  sorry

-- The local quadratic: the plus sign vanishes at `(α, β, γ, c, ψ) = (3, 2, 1, 2, 6)` and the
-- printed minus sign gives `−4`.
example : (2 : ℚ) ^ 2 + 2 * 1 * (2 - 1) - 6 = 0 ∧ (2 : ℚ) ^ 2 - 2 * 1 * (2 - 1) - 6 = -4 := by
  norm_num

/-! ## R33.1, R33.4–R33.6: the modern route -/

namespace DP

/-- `R33.1/dp-target-and-the-weight-at-least-two-convention`, the solvable case (Dieulefait–Pacetti
Theorem 1.3, Langlands–Tunnell): an S-type representation of odd characteristic with solvable
image is modular. -/
theorem isModular_of_isSolvable {p : ℕ} [Fact p.Prime] (hp : p ≠ 2)
    (ρ : GQ →* GL (Fin 2) (FpBar p)) (hS : IsSType ρ) (hsolv : Group.IsSolvable ρ.range) :
    IsModular ρ := by
  sorry

/-- `R33.4/dp-odd-characteristic-assembly` (Dieulefait–Pacetti §2): Serre's conjecture, weak form,
in odd characteristic. -/
theorem serre_weak_odd {p : ℕ} [Fact p.Prime] (hp : p ≠ 2) (ρ : GQ →* GL (Fin 2) (FpBar p))
    (hS : IsSType ρ) : IsModular ρ := by
  sorry

/-- `R33.5/dp-characteristic-two-closure` (Dieulefait–Pacetti §3): characteristic two. -/
theorem serre_weak_two [Fact (Nat.Prime 2)] (ρ : GQ →* GL (Fin 2) (FpBar 2)) (hS : IsSType ρ) :
    IsModular ρ := by
  sorry

end DP

/-- `R33.6/strong-form-by-the-modern-route`: modularity gives weight `k(ρ̄)` and level `N(ρ̄)` in
every characteristic, using `arisesFrom_of_isModular` and, for `p = 2` with `k(ρ̄) = 4`, the dyadic
optimisation of `SerreWeightAndLevelOptimisation:R20.5`–`R20.6`. With `isModular_of_isSType` this
is the strong form. -/
theorem arisesFrom_optimal_of_isModular {p : ℕ} [Fact p.Prime] (ρ : GQ →* GL (Fin 2) (FpBar p))
    (hS : IsSType ρ) (hmod : IsModular ρ) :
    ArisesFrom ρ (artinConductor ρ) (serreWeight ρ) := by
  sorry

/-- `R33.6/elliptic-curve-export-via-either-route`: the conditional form of the weight-two export,
for one `ρ̄` for which the strong conclusion is given. As in `weight_two_trivial_character`,
finiteness at `p` with cyclotomic determinant enters as `serreWeight ρ = 2` (Serre's
Proposition 4, `AlgebraicModularFormsAndSerreWeights:R15.4/weight-two-iff-finite-flat-at-p`). -/
theorem weight_two_trivial_character_of_arisesFrom {p : ℕ} [Fact p.Prime] (hp : 5 ≤ p)
    (ρ : GQ →* GL (Fin 2) (FpBar p)) (hS : IsSType ρ) (hk : serreWeight ρ = 2)
    (hdet : ∀ r : ℕ, r.Prime → r ≠ p → ∀ τ : GQ, IsFrobAt τ r →
      Matrix.det (ρ τ : Matrix (Fin 2) (Fin 2) (FpBar p)) = r)
    (hstrong : ArisesFrom ρ (artinConductor ρ) (serreWeight ρ)) :
    ∃ (g : Newform) (v : g.ResidualPlace p), g.level = artinConductor ρ ∧ g.weight = 2 ∧
      g.character = 1 ∧ ∃ h : GL (Fin 2) (FpBar p), ∀ σ : GQ, g.residualRep v σ = h * ρ σ * h⁻¹ := by
  sorry

/-! ## R33.2: the dihedral local type at `N` -/

namespace DP

/-- `R33.2/dihedral-local-type-at-n`: on the standard lattice `Ind 𝒪(κ)` a tame generator `σ` of
`I_N` acts by `diag(ζ, ζ^N)`, with `ζ = κ(σ)` a primitive `q`-th root of unity. -/
def dihedralInertia {R : Type*} [CommRing R] (ζ : R) (N : ℕ) : Matrix (Fin 2) (Fin 2) R :=
  !![ζ, 0; 0, ζ ^ N]

/-- `R33.2/dihedral-local-type-at-n`: on the standard lattice a Frobenius lift `s` acts by the
swap, because `κ(s²) = κ(Art(N)) = 1`. -/
def dihedralFrob (R : Type*) [CommRing R] : Matrix (Fin 2) (Fin 2) R :=
  !![0, 1; 1, 0]

/-- `R33.2/dihedral-local-type-at-n`: the tame relation `s σ s⁻¹ = σ^N`, `s² = 1` and `σ^q = 1`
hold on the standard lattice when `ζ^q = 1` and `q ∣ N + 1`. -/
theorem dihedralType_tame_relation {R : Type*} [CommRing R] {q N : ℕ} (ζ : R) (hζ : ζ ^ q = 1)
    (hqN : q ∣ N + 1) :
    dihedralFrob R * dihedralInertia ζ N * dihedralFrob R = dihedralInertia ζ N ^ N ∧
      dihedralFrob R * dihedralFrob R = 1 ∧ dihedralInertia ζ N ^ q = 1 := by
  sorry

/-- `R33.2/dihedral-local-type-at-n`: modulo a maximal ideal containing `ζ − 1` (as for a
`q`-th root of unity in residue characteristic `q`) the inertia matrix reduces to `1`: the standard
lattice reduces to `1 ⊕ η`, unramified. -/
theorem dihedralType_reduction {R k : Type*} [CommRing R] [CommRing k] (f : R →+* k) (ζ : R)
    (N : ℕ) (hζ : f ζ = 1) : (dihedralInertia ζ N).map f = 1 := by
  sorry

-- level_two_q7_N13 and level_one_nonexample.
example : 7 ∣ 13 + 1 ∧ ¬ 7 ∣ 13 - 1 ∧ 3 ∣ 7 - 1 := by norm_num

-- residue_field_units: `N² − 1 = (N − 1)(N + 1)`, and `|𝔽₂₅| = 25 ≠ 24`.
example (N : ℤ) : N ^ 2 - 1 = (N - 1) * (N + 1) := by ring

example : (5 : ℕ) ^ 2 - 1 = (5 - 1) * (5 + 1) ∧ (5 : ℕ) ^ 2 ≠ (5 - 1) * (5 + 1) := by norm_num

-- residual_trace_zero: the swap has trace zero.
example : Matrix.trace (dihedralFrob ℤ) = 0 := by
  simp [dihedralFrob, Matrix.trace_fin_two]

-- insertion_congruences_q13 and insertion_level_two (`R33.2/dp-lift-existence-and-good-dihedral-insertion`).
example : Nat.Prime 406561 ∧ 406561 % 8 = 1 ∧ 406561 % 3 = 1 ∧ 406561 % 5 = 1 ∧
    406561 % 7 = 1 ∧ 406561 % 11 = 1 ∧ 406561 % 13 = 12 ∧ 13 ∣ 406561 + 1 ∧
    ¬ 13 ∣ 406561 - 1 := by
  norm_num

-- insertion_crystalline_needs_weight_two (arithmetic content): weight 2 is not `q + 1` at `q = 13`.
example : (2 : ℕ) ≠ 13 + 1 := by norm_num

-- Lemma 8.2 for `p = 5`: `q = 409` satisfies the three congruences.
example : Nat.Prime 409 ∧ 409 % 8 = 1 ∧ 409 % 3 = 1 ∧ 409 % 5 = 5 - 1 := by norm_num

-- Lemma 8.2 uses that `−1` is a square modulo `p ≡ 1 mod 4`: `2² ≡ −1 mod 5`, `5² ≡ −1 mod 13`.
example : (2 ^ 2 + 1) % 5 = 0 ∧ (5 ^ 2 + 1) % 13 = 0 := by norm_num

/-! ## R33.1, R33.3–R33.5: bad-dihedral arithmetic -/

-- `R33.1/fontaine-laffaille-member-not-bad-dihedral`: `p > 2k` excludes `p = 2k − 1` and
-- `p = 2k − 3`.
example (p k : ℕ) (hk : 2 ≤ k) (hp : 2 * k < p) : p ≠ 2 * k - 1 ∧ p ≠ 2 * k - 3 := by omega

-- The niveau-two case is attained at `p = 7`, `k = 5`.
example : Nat.gcd (7 + 1) (5 - 1) = 4 ∧ (7 + 1) / 4 = 2 ∧ 7 = 2 * 5 - 3 := by norm_num

-- `R33.3/paso-5-killing-the-good-dihedral-prime` (Remark 5): at level one a bad-dihedral
-- representation has `p ≡ 3 mod 4`, which `N ≡ 1 mod 8` and `p = 5` avoid.
example (m : ℕ) (hm : 1 ≤ m) : (2 * (2 * m) - 1) % 4 = 3 := by omega

example (N : ℕ) (hN : N % 8 = 1) : N % 4 ≠ 3 := by omega

example : 5 % 4 ≠ 3 := by norm_num

-- `R33.4/dp-terminal-characteristic-five-and-the-schoof-base-case`: the even weights in `[2, 6]`,
-- and `4 = 3 + 1`.
example : (Finset.Icc 2 6).filter (fun k => k % 2 = 0) = {2, 4, 6} ∧ 4 = 3 + 1 := by decide

-- `R33.5/auxiliary-odd-prime-for-the-dyadic-system`: at weight 2 the excluded primes are 3 and 1.
example : 2 * 2 - 1 = 3 ∧ 2 * 2 - 3 = 1 := by norm_num

example (p : ℕ) (hp : 3 < p) : p ≠ 2 * 2 - 1 ∧ p ≠ 2 * 2 - 3 := by omega

-- `R33.5/dp-characteristic-two-closure` (Lemma 6.1): an element of 2-power order of `GL₂(𝔽̄₂)` is
-- unipotent, `1 + X` with `X² = 0`, and in characteristic two it has order at most 2; so `S₄`,
-- which has elements of order 4, is not a projective image in characteristic two.
example {k : Type*} [CommRing k] [CharP k 2] (X : Matrix (Fin 2) (Fin 2) k) (hX : X * X = 0) :
    (1 + X) * (1 + X) = 1 := by
  have h2 : (2 : k) = 0 := CharP.cast_eq_zero k 2
  have : (1 + X) * (1 + X) = 1 + (2 : k) • X + X * X := by
    rw [add_mul, mul_add, mul_add, one_mul, mul_one, one_mul, two_smul]; simp only [add_assoc]
  rw [this, hX, h2, zero_smul, add_zero, add_zero]

example : (!![1, 1; 0, 1] : Matrix (Fin 2) (Fin 2) (ZMod 2)) ^ 2 = 1 := by decide

-- The Borel subgroup of `PGL₂(𝔽₄)` has order `12 = |A₄|`, and `|PGL₂(𝔽₄)| = 60 = |A₅|`.
example : 4 * (4 - 1) = 12 ∧ 4 * (4 ^ 2 - 1) = 60 ∧ Nat.factorial 4 / 2 = 12 ∧
    Nat.factorial 5 / 2 = 60 := by
  decide

end DP

end TauCeti.SerreConjecture

end

/-! ## R33.3: the two integral lattices of the order-three type at 2

Elements `a + bζ` of `ℤ[ζ]`, `ζ² + ζ + 1 = 0`, and `2 × 2` matrices over it, with the products
written out, so that the lattice identities are checked exactly. Reduction modulo `π = ζ − 1` is
`ℤ[ζ]/(π) = 𝔽₃`, `ζ ↦ 1`. `D₀, F₀` give the action of a tame generator `σ` of `I₂` and of `Frob₂`
on the standard lattice `L₀`; `D₁, F₁` give it on the adapted lattice `L₁ = 𝒪(e₁ + e₂) ⊕ 𝒪πe₂`,
with change of basis `P`. -/

namespace TauCeti.SerreConjecture.DP

/-- `a + bζ ∈ ℤ[ζ]`, `ζ² + ζ + 1 = 0`. -/
structure Eis where
  a : ℤ
  b : ℤ
  deriving DecidableEq

namespace Eis

/-- Addition in `ℤ[ζ]`. -/
def add (x y : Eis) : Eis := ⟨x.a + y.a, x.b + y.b⟩

/-- `(a + bζ)(c + dζ) = (ac − bd) + (ad + bc − bd)ζ`, since `ζ² = −1 − ζ`. -/
def mul (x y : Eis) : Eis := ⟨x.a * y.a - x.b * y.b, x.a * y.b + x.b * y.a - x.b * y.b⟩

/-- Reduction modulo `π = ζ − 1`. -/
def red (x : Eis) : ZMod 3 := ((x.a + x.b : ℤ) : ZMod 3)

end Eis

/-- `2 × 2` matrices over `ℤ[ζ]`, row by row. -/
structure M2 where
  e00 : Eis
  e01 : Eis
  e10 : Eis
  e11 : Eis
  deriving DecidableEq

namespace M2

/-- Matrix multiplication. -/
def mul (A B : M2) : M2 :=
  ⟨(A.e00.mul B.e00).add (A.e01.mul B.e10), (A.e00.mul B.e01).add (A.e01.mul B.e11),
   (A.e10.mul B.e00).add (A.e11.mul B.e10), (A.e10.mul B.e01).add (A.e11.mul B.e11)⟩

/-- Reduction modulo `π`, as a Mathlib matrix over `𝔽₃`. -/
def red (A : M2) : Matrix (Fin 2) (Fin 2) (ZMod 3) :=
  !![A.e00.red, A.e01.red; A.e10.red, A.e11.red]

end M2

/-- `0`, `1`, `ζ`, `ζ² = −1 − ζ` and `π = ζ − 1` in `ℤ[ζ]`. -/
def e0 : Eis := ⟨0, 0⟩
def e1 : Eis := ⟨1, 0⟩
def eζ : Eis := ⟨0, 1⟩
def eζ2 : Eis := ⟨-1, -1⟩
def eπ : Eis := ⟨-1, 1⟩

/-- The identity, the standard-lattice matrices, the change of basis and the adapted-lattice
matrices. -/
def one : M2 := ⟨e1, e0, e0, e1⟩
def D₀ : M2 := ⟨eζ, e0, e0, eζ2⟩
def F₀ : M2 := ⟨e0, e1, e1, e0⟩
def P : M2 := ⟨e1, e0, e1, eπ⟩
def D₁ : M2 := ⟨eζ, e0, eζ, eζ2⟩
def F₁ : M2 := ⟨e1, eπ, e0, ⟨-1, 0⟩⟩

/-- `ζ² = −1 − ζ`, so `ζ² + ζ + 1 = 0`. -/
example : eζ.mul eζ = eζ2 ∧ (eζ.mul eζ).add (eζ.add e1) = e0 := by decide

/-- `standard_lattice_relations`: `D₀³ = F₀² = 1`, `F₀D₀F₀⁻¹ = D₀²` (`F₀⁻¹ = F₀`), the tame
relation at 2, and `D₀ ≡ 1 mod π`. -/
example : D₀.mul (D₀.mul D₀) = one ∧ F₀.mul F₀ = one ∧ (F₀.mul D₀).mul F₀ = D₀.mul D₀ ∧
    D₀.red = 1 := by
  decide

/-- `adapted_lattice_change_of_basis`: `D₀P = PD₁` and `F₀P = PF₁`, so `L₁` is stable; and
`D₁³ = F₁² = 1`, `F₁D₁F₁⁻¹ = D₁²`. -/
example : D₀.mul P = P.mul D₁ ∧ F₀.mul P = P.mul F₁ ∧ D₁.mul (D₁.mul D₁) = one ∧
    F₁.mul F₁ = one ∧ (F₁.mul D₁).mul F₁ = D₁.mul D₁ := by
  decide

/-- `adapted_lattice_nonsplit` and `residual_depends_on_lattice`: modulo `π`, `D₁ ≡ (1 0; 1 1) ≠ 1`
and `F₁ ≡ diag(1, −1)`, so the reduction of `L₁` is a non-split extension with one-dimensional
inertia invariants. -/
example : D₁.red = !![1, 0; 1, 1] ∧ F₁.red = !![1, 0; 0, -1] ∧ D₁.red ≠ 1 ∧
    (D₁.red - 1) * (D₁.red - 1) = 0 := by
  decide

/-- `standard_lattice_nonexample`: the standard lattice reduces to the trivial inertia action,
with two-dimensional invariants, so it cannot realise a ramified `ρ̄₃|_{I₂}`; `L₁` does. -/
example : D₀.red = 1 ∧ D₀.red ≠ D₁.red := by decide

/-- `split_case_standard_lattice`: modulo `π`, `F₀² = 1` and `F₀ ≠ ±1`, so its eigenvalues are `1`
and `−1 = 2 = χ̄₃(Frob₂)`; `L₀` realises `γ ⊗ (η ⊕ 1)`. -/
example : F₀.red * F₀.red = 1 ∧ F₀.red ≠ 1 ∧ F₀.red ≠ -1 ∧ (2 : ZMod 3) = -1 := by decide

/-- Both lattices have Frobenius trace `0`: `tr F₀ = 0` and `tr F₁ = 1 − 1 = 0`. -/
example : F₀.e00.add F₀.e11 = e0 ∧ F₁.e00.add F₁.e11 = e0 := by decide

end TauCeti.SerreConjecture.DP

/-! ## The analytic carriers at the pin -/

open scoped UpperHalfPlane in
/-- Mathlib's `CuspForm Γ k` exists at the pin and is a function on the upper half-plane; the
attached Galois representation is what the pinned libraries lack. -/
example (Γ : Subgroup (GL (Fin 2) ℝ)) (k : ℤ) (f : CuspForm Γ k) : UpperHalfPlane → ℂ := f
